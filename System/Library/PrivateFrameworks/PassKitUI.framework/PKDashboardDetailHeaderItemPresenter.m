@implementation PKDashboardDetailHeaderItemPresenter

- (PKDashboardDetailHeaderItemPresenter)init
{
  PKDashboardDetailHeaderItemPresenter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKDashboardDetailHeaderItemPresenter;
  v2 = -[PKDashboardDetailHeaderItemPresenter init](&v4, sel_init);
  if (v2)
    v2->_hasNetworkAccess = PKProcessHasNetworkPrivilegies();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PKObjectDownloader invalidate](self->_fileDownloader, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardDetailHeaderItemPresenter;
  -[PKDashboardDetailHeaderItemPresenter dealloc](&v3, sel_dealloc);
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  switch(objc_msgSend(v11, "type"))
  {
    case 0:
      -[PKDashboardDetailHeaderItemPresenter _merchantHeaderCellForItem:inCollectionView:atIndexPath:](self, "_merchantHeaderCellForItem:inCollectionView:atIndexPath:", v11, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      -[PKDashboardDetailHeaderItemPresenter _peerPaymentHeaderCellForItem:inCollectionView:atIndexPath:](self, "_peerPaymentHeaderCellForItem:inCollectionView:atIndexPath:", v11, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[PKDashboardDetailHeaderItemPresenter _transactionGroupHeaderCellForItem:inCollectionView:atIndexPath:](self, "_transactionGroupHeaderCellForItem:inCollectionView:atIndexPath:", v11, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[PKDashboardDetailHeaderItemPresenter _transactionTypeHeaderCellForItem:inCollectionView:atIndexPath:](self, "_transactionTypeHeaderCellForItem:inCollectionView:atIndexPath:", v11, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      -[PKDashboardDetailHeaderItemPresenter _installmentProductHeaderCellForItem:inCollectionView:atIndexPath:](self, "_installmentProductHeaderCellForItem:inCollectionView:atIndexPath:", v11, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = (void *)v12;
      break;
    default:
      v13 = 0;
      break;
  }

  return v13;
}

- (id)collectionViewCellClasses
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PKTransactionHistoryHeaderPresenterMerchantReuseIdentifier");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("PKTransactionHistoryHeaderPresenterPeerPaymentReuseIdentifier");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier");
  v4[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  PKMerchantHeaderCell *v12;
  UICollectionViewCell *v13;
  UICollectionViewCell *templateCell;
  UICollectionViewCell *v15;
  PKTransactionHistoryPeerPaymentHeaderCell *v16;
  UICollectionViewCell *v17;
  UICollectionViewCell *v18;
  UICollectionViewCell *v19;
  PKTransactionHistoryTransactionGroupHeaderCell *v20;
  UICollectionViewCell *v21;
  UICollectionViewCell *v22;
  UICollectionViewCell *v23;
  PKTransactionHistoryTransactionGroupHeaderCell *v24;
  UICollectionViewCell *v25;
  UICollectionViewCell *v26;
  UICollectionViewCell *v27;
  PKTransactionHistoryTransactionGroupHeaderCell *v28;
  UICollectionViewCell *v29;
  UICollectionViewCell *v30;
  double v31;
  double v32;
  UICollectionViewCell *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize result;
  CGRect v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  switch(objc_msgSend(v11, "type"))
  {
    case 0:
      if (!self->_templateCell)
      {
        v12 = [PKMerchantHeaderCell alloc];
        v13 = -[PKMerchantHeaderCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        templateCell = self->_templateCell;
        self->_templateCell = v13;

      }
      break;
    case 1:
      v15 = self->_templateCell;
      if (!v15)
      {
        v16 = [PKTransactionHistoryPeerPaymentHeaderCell alloc];
        v17 = -[PKTransactionHistoryPeerPaymentHeaderCell initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v18 = self->_templateCell;
        self->_templateCell = v17;

        v15 = self->_templateCell;
      }
      -[PKDashboardDetailHeaderItemPresenter _configurePeerPaymentHeaderCell:forItem:](self, "_configurePeerPaymentHeaderCell:forItem:", v15, v11);
      break;
    case 2:
      v19 = self->_templateCell;
      if (!v19)
      {
        v20 = [PKTransactionHistoryTransactionGroupHeaderCell alloc];
        v21 = -[PKTransactionHistoryTransactionGroupHeaderCell initWithFrame:](v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v22 = self->_templateCell;
        self->_templateCell = v21;

        v19 = self->_templateCell;
      }
      -[PKDashboardDetailHeaderItemPresenter _configureCategoryHeaderCell:forItem:isUpdate:](self, "_configureCategoryHeaderCell:forItem:isUpdate:", v19, v11, 0);
      break;
    case 3:
      v23 = self->_templateCell;
      if (!v23)
      {
        v24 = [PKTransactionHistoryTransactionGroupHeaderCell alloc];
        v25 = -[PKTransactionHistoryTransactionGroupHeaderCell initWithFrame:](v24, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v26 = self->_templateCell;
        self->_templateCell = v25;

        v23 = self->_templateCell;
      }
      -[PKDashboardDetailHeaderItemPresenter _configureTransactionTypeHeaderCell:forItem:](self, "_configureTransactionTypeHeaderCell:forItem:", v23, v11);
      break;
    case 4:
      v27 = self->_templateCell;
      if (!v27)
      {
        v28 = [PKTransactionHistoryTransactionGroupHeaderCell alloc];
        v29 = -[PKTransactionHistoryTransactionGroupHeaderCell initWithFrame:](v28, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v30 = self->_templateCell;
        self->_templateCell = v29;

        v27 = self->_templateCell;
      }
      -[PKDashboardDetailHeaderItemPresenter _configureInstallmentProductHeaderCell:forItem:inCollectionView:atIndexPath:downloadImage:](self, "_configureInstallmentProductHeaderCell:forItem:inCollectionView:atIndexPath:downloadImage:", v27, v11, v9, v10, 0);
      break;
    default:
      break;
  }
  objc_msgSend(v9, "bounds");
  v32 = v31;
  v33 = self->_templateCell;
  objc_msgSend(v9, "bounds");
  -[UICollectionViewCell sizeThatFits:](v33, "sizeThatFits:", CGRectGetWidth(v41), v32);
  v35 = v34;
  v37 = v36;

  v38 = v35;
  v39 = v37;
  result.height = v39;
  result.width = v38;
  return result;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v10;
  switch(objc_msgSend(v13, "type"))
  {
    case 0:
      -[PKDashboardDetailHeaderItemPresenter _configureMerchantHeaderCell:forItem:inCollectionView:atIndexPath:](self, "_configureMerchantHeaderCell:forItem:inCollectionView:atIndexPath:", v14, v13, v11, v12);
      break;
    case 1:
      -[PKDashboardDetailHeaderItemPresenter _configurePeerPaymentHeaderCell:forItem:](self, "_configurePeerPaymentHeaderCell:forItem:", v14, v13);
      break;
    case 2:
      -[PKDashboardDetailHeaderItemPresenter _configureCategoryHeaderCell:forItem:isUpdate:](self, "_configureCategoryHeaderCell:forItem:isUpdate:", v14, v13, 1);
      break;
    case 3:
      -[PKDashboardDetailHeaderItemPresenter _configureTransactionTypeHeaderCell:forItem:](self, "_configureTransactionTypeHeaderCell:forItem:", v14, v13);
      break;
    case 4:
      -[PKDashboardDetailHeaderItemPresenter _configureInstallmentProductHeaderCell:forItem:inCollectionView:atIndexPath:downloadImage:](self, "_configureInstallmentProductHeaderCell:forItem:inCollectionView:atIndexPath:downloadImage:", v14, v13, v11, v12, 1);
      break;
    default:
      break;
  }

}

- (id)_merchantHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKTransactionHistoryHeaderPresenterMerchantReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDetailHeaderItemPresenter _configureMerchantHeaderCell:forItem:inCollectionView:atIndexPath:](self, "_configureMerchantHeaderCell:forItem:inCollectionView:atIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (id)_installmentProductHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDetailHeaderItemPresenter _configureInstallmentProductHeaderCell:forItem:inCollectionView:atIndexPath:downloadImage:](self, "_configureInstallmentProductHeaderCell:forItem:inCollectionView:atIndexPath:downloadImage:", v11, v10, v9, v8, 1);

  return v11;
}

- (void)_configureInstallmentProductHeaderCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6 downloadImage:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  UIImage *logoImage;
  PKObjectDownloader *fileDownloader;
  PKObjectDownloader *v28;
  PKObjectDownloader *v29;
  void *v30;
  UIImage *v31;
  UIImage *v32;
  UIImage *v33;
  void *v34;
  void *v35;
  double v36;
  PKObjectDownloader *v37;
  _BOOL4 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location;

  v38 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v12, "installmentProduct");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "serialNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKSerialNumber();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v19 = v17;
  if (v18 != v19)
  {
    v20 = v19;
    if (v18 && v19)
    {
      v21 = objc_msgSend(v18, "caseInsensitiveCompare:", v19);

      if (!v21)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(v15, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    goto LABEL_10;
  }

LABEL_7:
  PKDeviceName();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(v11, "setTitle:", v22);
  objc_msgSend(v11, "setSubtitle:", v23);
  objc_msgSend(v11, "setUseShadows:", 1);
  objc_msgSend(v15, "iconURLForScale:suffix:", 0, PKUIScreenScale());
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  logoImage = self->_logoImage;
  if (!logoImage && v24)
  {
    fileDownloader = self->_fileDownloader;
    if (!fileDownloader)
    {
      v28 = (PKObjectDownloader *)objc_alloc_init(MEMORY[0x1E0D66EA8]);
      v29 = self->_fileDownloader;
      self->_fileDownloader = v28;

      fileDownloader = self->_fileDownloader;
    }
    -[PKObjectDownloader cachedDataForURL:](fileDownloader, "cachedDataForURL:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v30);
      v31 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v32 = self->_logoImage;
      self->_logoImage = v31;

    }
    else if (v38)
    {
      objc_initWeak(&location, self);
      v37 = self->_fileDownloader;
      v39[1] = 3221225472;
      v39[2] = __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke;
      v39[3] = &unk_1E3E733D8;
      v39[0] = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v41, &location);
      v40 = v11;
      -[PKObjectDownloader downloadFromUrl:completionHandler:](v37, "downloadFromUrl:completionHandler:", v25, v39);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }

    logoImage = self->_logoImage;
  }
  v33 = logoImage;
  if (!v33)
  {
    PKPassKitUIBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "URLForResource:withExtension:", CFSTR("InstallmentsFallback"), CFSTR("pdf"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      v36 = PKUIScreenScale();
      PKUIImageFromPDF(v35, 100.0, 100.0, v36);
      v33 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }

  }
  objc_msgSend(v11, "setImage:animated:", v33, 0);

}

void __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a2 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke_25;
      block[3] = &unk_1E3E61EE8;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      v13 = v8;
      v14 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "invalid image for URL: %@", buf, 0xCu);

      }
    }

  }
}

void __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke_25(id *a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 4, a1[4]);
    objc_msgSend(a1[5], "setImage:animated:", a1[4], 1);
    WeakRetained = v3;
  }

}

- (void)_configureMerchantHeaderCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PKObjectDownloader *fileDownloader;
  PKObjectDownloader *v25;
  PKObjectDownloader *v26;
  void *v27;
  UIImage *v28;
  UIImage *logoImage;
  UIImage *v30;
  UIImage *logoBackgroundImage;
  uint64_t v32;
  void *v33;
  PKObjectDownloader *v34;
  PKObjectDownloader *v35;
  PKObjectDownloader *v36;
  void *v37;
  UIImage *v38;
  UIImage *heroImage;
  PKObjectDownloader *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  double v49;
  double v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id location[2];

  v10 = a3;
  v11 = a4;
  v48 = a5;
  v47 = a6;
  objc_msgSend(v11, "merchant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = v11;
  v14 = objc_msgSend(v12, "category");
  if (objc_msgSend(v13, "useDisplayNameIgnoringBrand"))
  {
    objc_msgSend(v13, "displayNameIgnoringBrand");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v13, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v11, "title");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v46 = v17;

    if (!v14)
      goto LABEL_11;
  }
  if ((objc_msgSend(v11, "showDetailedPropertyLocation") & 1) != 0)
  {
LABEL_11:
    v18 = 0;
    goto LABEL_13;
  }
  PKLocalizedStringFromMerchantCategory();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  if (objc_msgSend(v11, "showDetailedPropertyLocation"))
  {
    objc_msgSend(v13, "mapsMerchant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postalAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKMerchantFormattedLocationForPostalAddress();
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
  objc_msgSend(v13, "logoImageURL");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!self->_logoImage && v22)
  {
    fileDownloader = self->_fileDownloader;
    if (!fileDownloader)
    {
      if (self->_hasNetworkAccess)
      {
        v25 = (PKObjectDownloader *)objc_alloc_init(MEMORY[0x1E0D66EA8]);
        v26 = self->_fileDownloader;
        self->_fileDownloader = v25;

        fileDownloader = self->_fileDownloader;
      }
      else
      {
        fileDownloader = 0;
      }
    }
    -[PKObjectDownloader cachedDataForURL:](fileDownloader, "cachedDataForURL:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v27);
      v28 = (UIImage *)objc_claimAutoreleasedReturnValue();
      logoImage = self->_logoImage;
      self->_logoImage = v28;

      -[PKDashboardDetailHeaderItemPresenter _backgroundImageFromLogoImage:](self, "_backgroundImageFromLogoImage:", self->_logoImage);
      v30 = (UIImage *)objc_claimAutoreleasedReturnValue();
      logoBackgroundImage = self->_logoBackgroundImage;
      self->_logoBackgroundImage = v30;

    }
    else
    {
      objc_initWeak(location, self);
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke;
      v55[3] = &unk_1E3E7B6C0;
      objc_copyWeak(&v58, location);
      v56 = v10;
      v57 = v11;
      -[PKDashboardDetailHeaderItemPresenter _downloadLogoForItem:withCompletionHandler:](self, "_downloadLogoForItem:withCompletionHandler:", v57, v55);

      objc_destroyWeak(&v58);
      objc_destroyWeak(location);
    }

  }
  objc_msgSend(v13, "heroImageURL", v23);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (!self->_heroImage && v32)
  {
    v34 = self->_fileDownloader;
    if (!v34)
    {
      if (self->_hasNetworkAccess)
      {
        v35 = (PKObjectDownloader *)objc_alloc_init(MEMORY[0x1E0D66EA8]);
        v36 = self->_fileDownloader;
        self->_fileDownloader = v35;

        v34 = self->_fileDownloader;
      }
      else
      {
        v34 = 0;
      }
    }
    -[PKObjectDownloader cachedDataForURL:](v34, "cachedDataForURL:", v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v37);
      v38 = (UIImage *)objc_claimAutoreleasedReturnValue();
      heroImage = self->_heroImage;
      self->_heroImage = v38;

    }
    else
    {
      objc_initWeak(location, self);
      v40 = self->_fileDownloader;
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_3;
      v51[3] = &unk_1E3E67620;
      objc_copyWeak(&v54, location);
      v52 = v10;
      v53 = v11;
      -[PKObjectDownloader downloadFromUrl:completionHandler:](v40, "downloadFromUrl:completionHandler:", v33, v51);

      objc_destroyWeak(&v54);
      objc_destroyWeak(location);
    }

  }
  objc_msgSend(v10, "headerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPrimaryText:", v46);
  objc_msgSend(v41, "setSecondaryText:", v18);
  v42 = PKUIScreenScale();
  PKColorForMerchantCategory(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  location[0] = 0;
  v49 = 0.0;
  v50 = 0.0;
  objc_msgSend(v43, "getRed:green:blue:alpha:", location, &v50, &v49, 0);
  *(double *)location = *(double *)location * 0.9;
  v49 = v49 * 0.9;
  v50 = v50 * 0.9;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFallbackColor:", v44);

  objc_msgSend(v10, "setOverlayEffect:", self->_overlayEffect);
  objc_msgSend(v10, "setShadowColor:", self->_shadowColor);
  -[PKDashboardDetailHeaderItemPresenter _updateMerchantHeaderImagesOnCell:item:](self, "_updateMerchantHeaderImagesOnCell:item:", v10, v11);

}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  if (a2)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_2;
      v6[3] = &unk_1E3E65CC0;
      objc_copyWeak(&v10, a1 + 6);
      v7 = v4;
      v8 = a1[4];
      v9 = a1[5];
      v5 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v6);

      objc_destroyWeak(&v10);
    }
  }
}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_storeStrong(WeakRetained + 4, *(id *)(a1 + 32));
    objc_msgSend(v5, "_backgroundImageFromLogoImage:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v5[5];
    v5[5] = (id)v3;

    objc_msgSend(v5, "_updateMerchantHeaderImagesOnCell:item:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v5;
  }

}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_3(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  if (a2)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_4;
      v7[3] = &unk_1E3E65CC0;
      objc_copyWeak(&v11, a1 + 6);
      v8 = v5;
      v9 = a1[4];
      v10 = a1[5];
      v6 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

      objc_destroyWeak(&v11);
    }
  }
}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 6, *(id *)(a1 + 32));
    objc_msgSend(v3, "_updateMerchantHeaderImagesOnCell:item:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_updateMerchantHeaderImagesOnCell:(id)a3 item:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  UIImage *logoImage;
  UIImage *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  UIImage *heroImage;
  UIImage *v17;
  void *v18;
  _BOOL8 v19;
  UIImage *v20;
  void *v21;
  id v22;

  v22 = a4;
  v6 = a3;
  objc_msgSend(v22, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    logoImage = self->_logoImage;
    if (logoImage)
    {
      v10 = logoImage;
    }
    else
    {
      v15 = PKUIScreenScale();
      PKIconForMerchant(v7, 0, 0, 0, 73.0, 73.0, v15);
      v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v10;
  }
  else
  {
    v11 = PKUIScreenScale();
    objc_msgSend(v22, "category");
    v12 = PKUIScreenScale();
    PKColorForMerchantCategory(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKUIGenericBusinessIconImage(v13, 73.0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setIconImage:", v14);
  heroImage = self->_heroImage;
  if (!heroImage)
    heroImage = self->_logoBackgroundImage;
  v17 = heroImage;
  objc_msgSend(v8, "backgroundImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  objc_msgSend(v8, "setBackgroundImage:animated:", v17, v19);
  v20 = self->_heroImage;
  if (v20)
  {
    objc_msgSend(v7, "heroImageAttribution");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributionProviderName:", v21);

  }
  objc_msgSend(v8, "setShowsGradientOverlay:", v20 != 0);

}

- (id)_backgroundImageFromLogoImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGImage *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[9];

  v3 = (objc_class *)MEMORY[0x1E0C9DD90];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithOptions:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithImage:", v4);

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAffineClamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaults");
  v8 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x1E0C9E1F8]);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIGaussianBlur"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, v8);

  objc_msgSend(v9, "setValue:forKey:", &unk_1E3FAE098, *MEMORY[0x1E0C9E258]);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorControls"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, v8);

  objc_msgSend(v11, "setValue:forKey:", &unk_1E3FACBA0, *MEMORY[0x1E0C9E260]);
  objc_msgSend(v6, "extent");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v11, "outputImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (CGImage *)objc_msgSend(v5, "createCGImage:fromRect:", v21, v14, v16, v18, v20);

  v23 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithBounds:format:", v24, v14, v16, v18, v20);

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __70__PKDashboardDetailHeaderItemPresenter__backgroundImageFromLogoImage___block_invoke;
  v28[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v28[4] = v14;
  *(double *)&v28[5] = v16;
  *(double *)&v28[6] = v18;
  *(double *)&v28[7] = v20;
  v28[8] = v22;
  objc_msgSend(v25, "imageWithActions:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    CGImageRelease(v22);

  return v26;
}

void __70__PKDashboardDetailHeaderItemPresenter__backgroundImageFromLogoImage___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  CGAffineTransform v5;
  CGRect v6;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v6 = *(CGRect *)(a1 + 32);
  v5.b = 0.0;
  v5.c = 0.0;
  v5.a = 1.0;
  *(_OWORD *)&v5.d = xmmword_19DF16010;
  v5.ty = CGRectGetHeight(v6);
  CGContextConcatCTM(v3, &v5);
  CGContextDrawImage(v3, *(CGRect *)(a1 + 32), *(CGImageRef *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  CGContextSetBlendMode(v3, kCGBlendModePlusDarker);
  CGContextFillRect(v3, *(CGRect *)(a1 + 32));
}

- (id)_peerPaymentHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKTransactionHistoryHeaderPresenterPeerPaymentReuseIdentifier"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDetailHeaderItemPresenter _configurePeerPaymentHeaderCell:forItem:](self, "_configurePeerPaymentHeaderCell:forItem:", v9, v8);

  return v9;
}

- (void)_configurePeerPaymentHeaderCell:(id)a3 forItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "peerPaymentCounterpartHandle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "configureWithPeerPaymentCounterpartHandle:contact:", v8, v7);
}

- (id)_transactionGroupHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDetailHeaderItemPresenter _configureCategoryHeaderCell:forItem:isUpdate:](self, "_configureCategoryHeaderCell:forItem:isUpdate:", v9, v8, 0);

  return v9;
}

- (id)_transactionTypeHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDetailHeaderItemPresenter _configureTransactionTypeHeaderCell:forItem:](self, "_configureTransactionTypeHeaderCell:forItem:", v9, v8);

  return v9;
}

- (void)_configureTransactionTypeHeaderCell:(id)a3 forItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v5 = a3;
  if (objc_msgSend(a4, "transactionType") == 11)
  {
    PKLocalizedFeatureString();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("InterestIcon"), CFSTR("pdf"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PKUIScreenScale();
    PKUIImageFromPDF(v8, 100.0, 100.0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v6 = 0;
    v10 = 0;
  }
  objc_msgSend(v5, "setTitle:", v11);
  objc_msgSend(v5, "setSubtitle:", v6);
  objc_msgSend(v5, "setImage:animated:", v10, 0);

}

- (void)_configureCell:(id)a3 withRegion:(id)a4 isUpdate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PKMapsSnapshotManager *v10;
  PKMapsSnapshotManager *snapshotManager;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PKMapsSnapshotManager *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!self->_snapshotManager)
  {
    v10 = objc_alloc_init(PKMapsSnapshotManager);
    snapshotManager = self->_snapshotManager;
    self->_snapshotManager = v10;

  }
  objc_msgSend(v9, "displayRegion");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_initWeak(&location, v8);
  v20 = self->_snapshotManager;
  objc_msgSend(v8, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke;
  v26 = &unk_1E3E67170;
  objc_copyWeak(&v27, &location);
  -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](v20, "snapshotForDisplayRegion:size:traitCollection:completion:", v21, &v23, v13, v15, v17, v19, 100.0, 100.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setImage:animated:", v22, v5, v23, v24, v25, v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "setImage:animated:", v3, 1);
      WeakRetained = v4;
    }
  }

}

- (void)_configureCategoryHeaderCell:(id)a3 forItem:(id)a4 isUpdate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  PKContactAvatarManager *v62;
  void *v63;
  void *v64;
  PKContactAvatarManager *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  double v106;
  int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  double v136;
  void *v137;
  __CFString *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  double v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  double v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  PKContactAvatarManager *avatarManager;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  double v170;
  void *v171;
  void *v172;
  void *v173;
  PKContactAvatarManager *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  _QWORD v188[4];
  id v189;
  _QWORD v190[4];
  id v191;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "transactionGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");
  v12 = objc_msgSend(v9, "featureIdentifier");
  v13 = 1;
  switch(v11)
  {
    case 0uLL:
    case 0xFuLL:
      v14 = objc_msgSend(v10, "merchantCategory");
      PKLocalizedStringFromMerchantCategory();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v15);

      v16 = PKUIScreenScale();
      PKIconForMerchantCategory(100.0, 100.0, v16, v14, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:animated:", v17, 0);

      v13 = 1;
      if (v11 > 0xF)
        goto LABEL_35;
      if (((1 << v11) & 0xA553) != 0)
        goto LABEL_21;
      if (v11 != 14)
        goto LABEL_35;
      goto LABEL_78;
    case 1uLL:
      goto LABEL_21;
    case 2uLL:
      objc_msgSend(v10, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKMonthAndYearStringFromDate();
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(v10, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKYearStringFromDate();
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v20 = (void *)v19;
      objc_msgSend(v8, "setTitle:", v19);

      objc_msgSend(v8, "setImage:animated:", 0, 0);
      goto LABEL_34;
    case 4uLL:
      PKLocalizedFeatureString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v21);

      PKPassKitUIBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = CFSTR("CashBackIcon");
      goto LABEL_17;
    case 5uLL:
      PKLocalizedFeatureString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v25);

      PKLocalizedFeatureString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSubtitle:", v26);

      PKPassKitUIBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = CFSTR("AppleCardIcon");
      goto LABEL_32;
    case 6uLL:
      PKLocalizedFeatureString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v30);

      PKPassKitUIBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = CFSTR("SpendingIcon");
      goto LABEL_17;
    case 7uLL:
      v31 = v12;
      PKLocalizedFeatureString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v32);

      if (v31 == 5)
      {
        PKLocalizedString(CFSTR("TRANSACTIONS_COUNT"), CFSTR("%lu"), objc_msgSend(v9, "historyCount"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSubtitle:", v67);

        PKPassKitUIBundle();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v29 = CFSTR("SAVINGS_Interest");
      }
      else
      {
        if (v31 != 2)
          goto LABEL_34;
        PKLocalizedFeatureString();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSubtitle:", v33);

        PKPassKitUIBundle();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v29 = CFSTR("InterestIcon");
      }
LABEL_32:
      objc_msgSend(v27, "URLForResource:withExtension:", v29, CFSTR("pdf"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = PKUIScreenScale();
      PKUIImageFromPDF(v68, 100.0, 100.0, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:animated:", v70, 0);

LABEL_33:
LABEL_34:
      v13 = 1;
      goto LABEL_35;
    case 8uLL:
    case 0xAuLL:
      PKLocalizedFeatureString();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v39);

      PKPassKitUIBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = CFSTR("RefundsIcon");
LABEL_17:
      objc_msgSend(v22, "URLForResource:withExtension:", v24, CFSTR("pdf"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = PKUIScreenScale();
      PKUIImageFromPDF(v40, 100.0, 100.0, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:animated:", v42, 0);

      goto LABEL_20;
    case 9uLL:
      PKLocalizedFeatureString();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v34);

      PKPassKitUIBundle();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "URLForResource:withExtension:", CFSTR("AppleCardIcon"), CFSTR("pdf"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = PKUIScreenScale();
      PKUIImageFromPDF(v36, 100.0, 100.0, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:animated:", v38, 0);

      PKLocalizedFeatureString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSubtitle:", v28);
      goto LABEL_33;
    case 0xBuLL:
      PKLocalizedFeatureString();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v43);

      PKPassKitUIBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = CFSTR("AdjustmentsIcon");
      goto LABEL_32;
    case 0xDuLL:
      objc_msgSend(v10, "regions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "localizedName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v46);

      -[PKDashboardDetailHeaderItemPresenter _configureCell:withRegion:isUpdate:](self, "_configureCell:withRegion:isUpdate:", v8, v45, v5);
LABEL_20:
      v13 = 1;
      goto LABEL_21;
    case 0xEuLL:
      objc_msgSend(v10, "searchQuery");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "tokens");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      switch(v52)
      {
        case 1uLL:
          objc_msgSend(v50, "locationTokens");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "count");

          if (v54)
          {
            objc_msgSend(v50, "locationTokens");
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v176, "lastObject");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "group");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "regions");
            v57 = v50;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "firstObject");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            v50 = v57;
            -[PKDashboardDetailHeaderItemPresenter _configureCell:withRegion:isUpdate:](self, "_configureCell:withRegion:isUpdate:", v8, v59, v5);
LABEL_43:

LABEL_44:
            v107 = 0;
            goto LABEL_65;
          }
          objc_msgSend(v50, "categoryToken");
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          if (v102)
          {
            objc_msgSend(v50, "categoryToken");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "group");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v104, "merchantCategory");

            v106 = PKUIScreenScale();
            PKIconForMerchantCategory(100.0, 100.0, v106, v105, 0, 0);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setImage:animated:", v59, 0);
            goto LABEL_43;
          }
          objc_msgSend(v50, "transactionTypes");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = objc_msgSend(v108, "count");

          if (v109)
          {
            objc_msgSend(v50, "transactionTypes");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "firstObject");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v111, "integerValue");

            v107 = 1;
            v13 = 1;
            switch(v112)
            {
              case 1:
                PKLocalizedFeatureString();
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setTitle:", v113);

                PKPassKitUIBundle();
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = v114;
                v116 = CFSTR("RefundsIcon");
                goto LABEL_59;
              case 2:
              case 3:
              case 4:
              case 8:
              case 9:
                goto LABEL_66;
              case 5:
                v138 = CFSTR("TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
                goto LABEL_55;
              case 6:
                v138 = CFSTR("TRANSACTION_TYPE_TOP_UP");
LABEL_55:
                PKLocalizedPaymentString(&v138->isa);
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setTitle:", v139);

                PKPassKitUIBundle();
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = v114;
                v116 = CFSTR("CashBackIcon");
                goto LABEL_59;
              case 7:
                PKLocalizedFeatureString();
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setTitle:", v140);

                PKPassKitUIBundle();
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = v114;
                v116 = CFSTR("AdjustmentsIcon");
                goto LABEL_59;
              case 10:
                PKLocalizedFeatureString();
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setTitle:", v141);

                PKPassKitUIBundle();
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v142, "URLForResource:withExtension:", CFSTR("AppleCardIcon"), CFSTR("pdf"));
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = PKUIScreenScale();
                PKUIImageFromPDF(v143, 100.0, 100.0, v144);
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setImage:animated:", v145, 0);

                PKLocalizedFeatureString();
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setSubtitle:", v115);
                goto LABEL_60;
              case 11:
                PKLocalizedFeatureString();
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setTitle:", v146);

                PKLocalizedFeatureString();
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setSubtitle:", v147);

                PKPassKitUIBundle();
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = v114;
                v116 = CFSTR("InterestIcon");
LABEL_59:
                objc_msgSend(v114, "URLForResource:withExtension:", v116, CFSTR("pdf"));
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                v149 = PKUIScreenScale();
                PKUIImageFromPDF(v148, 100.0, 100.0, v149);
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setImage:animated:", v150, 0);

LABEL_60:
                v13 = 1;
                break;
              default:
                goto LABEL_65;
            }
            goto LABEL_77;
          }
          objc_msgSend(v50, "transactionSources");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = objc_msgSend(v117, "count");

          if (v118)
          {
            v119 = (void *)MEMORY[0x1E0DC3870];
            objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 100.0);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "_systemImageNamed:withConfiguration:", CFSTR("applecard.fill"), v120);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "imageWithTintColor:", v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            PKPassKitUIBundle();
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "URLForResource:withExtension:", CFSTR("AppleCardSquareBackground"), CFSTR("pdf"));
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = PKUIScreenScale();
            PKUIImageFromPDF(v125, 100.0, 100.0, v126);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            ApplySymbolToBackgroundImage(v123, v127);
            v128 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "setImage:animated:", v128, 0);
LABEL_82:

            goto LABEL_44;
          }
          objc_msgSend(v50, "dateToken");
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          if (v129)
          {
            v130 = (void *)MEMORY[0x1E0DC3870];
            objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 100.0);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "systemImageNamed:withConfiguration:", CFSTR("calendar"), v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "imageWithTintColor:", v133);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v9, "featureIdentifier") == 2)
            {
              PKPassKitUIBundle();
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "URLForResource:withExtension:", CFSTR("AppleCardSquareBackground"), CFSTR("pdf"));
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = PKUIScreenScale();
              PKUIImageFromPDF(v135, 100.0, 100.0, v136);
              v137 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              ImageOfSizeAndColor(v134, 100.0, 100.0);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
            }

            ApplySymbolToBackgroundImage(v123, v137);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setImage:animated:", v173, 0);

            goto LABEL_82;
          }
          objc_msgSend(v50, "accountUserToken");
          v151 = (void *)objc_claimAutoreleasedReturnValue();

          if (v151)
          {
            v177 = v50;
            objc_msgSend(v50, "accountUserToken");
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v152, "group");
            v153 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v153, "familyMember");
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "accountUser");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            avatarManager = self->_avatarManager;
            objc_msgSend(v155, "altDSID");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKContactAvatarManager cachedAvatarForAltDSID:](avatarManager, "cachedAvatarForAltDSID:", v157);
            v158 = (void *)objc_claimAutoreleasedReturnValue();

            if (v158)
            {
              objc_msgSend(v8, "setImage:animated:", v158, 0);
            }
            else
            {
              v174 = self->_avatarManager;
              v188[0] = MEMORY[0x1E0C809B0];
              v188[1] = 3221225472;
              v188[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_3;
              v188[3] = &unk_1E3E613B0;
              v189 = v8;
              -[PKContactAvatarManager avatarForFamilyMember:accountUser:invitation:completion:](v174, "avatarForFamilyMember:accountUser:invitation:completion:", v154, v155, 0, v188);

            }
            objc_msgSend(v153, "userDisplayName");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setTitle:", v175);

            v107 = 0;
            v13 = 0;
            v50 = v177;
          }
          else
          {
LABEL_64:
            v107 = 1;
LABEL_65:
            v13 = 1;
          }
LABEL_66:
          objc_msgSend(v50, "tokens");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "firstObject");
          v160 = (void *)objc_claimAutoreleasedReturnValue();

          if (v160)
          {
            v178 = 0;
            PKSearchAutoCompletionTextAndImageFromSuggestion(&v178, 0, 0, v160, self->_contactResolver);
            v161 = v178;
            objc_msgSend(v8, "setTitle:", v161);
          }
          else
          {
            objc_msgSend(v50, "text");
            v161 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v161, "length"))
              PKLocalizedString(CFSTR("SEARCH_TEXT_RESULT"), CFSTR("%@"), v161);
            else
              PKLocalizedString(CFSTR("SEARCH_RESULTS"));
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setTitle:", v162);

          }
          if (v107)
          {
LABEL_73:
            v163 = (void *)MEMORY[0x1E0DC3870];
            objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 100.0);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "imageWithTintColor:", v166);
            v167 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v9, "featureIdentifier") == 2)
            {
              PKPassKitUIBundle();
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v168, "URLForResource:withExtension:", CFSTR("AppleCardSquareBackground"), CFSTR("pdf"));
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              v170 = PKUIScreenScale();
              PKUIImageFromPDF(v169, 100.0, 100.0, v170);
              v171 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              ImageOfSizeAndColor(v168, 100.0, 100.0);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
            }

            ApplySymbolToBackgroundImage(v167, v171);
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setImage:animated:", v172, 0);

          }
LABEL_77:

LABEL_78:
          v47 = objc_msgSend(v10, "transactionCount");
          if (v47)
          {
LABEL_22:
            PKLocalizedString(CFSTR("TRANSACTIONS_COUNT"), CFSTR("%lu"), v47);
            v48 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            PKLocalizedString(CFSTR("LOADING"));
            v48 = objc_claimAutoreleasedReturnValue();
          }
          v49 = (void *)v48;
          objc_msgSend(v8, "setSubtitle:", v48);

LABEL_35:
          objc_msgSend(v8, "setStrokeImage:", v13);

          return;
        case 2uLL:
          v187 = 0;
          objc_msgSend(v50, "tokens");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectAtIndex:", 0);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 1;
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v187, 0, 1, v73, self->_contactResolver);
          v74 = v187;

          v186 = 0;
          objc_msgSend(v50, "tokens");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectAtIndex:", 1);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v186, 0, 1, v76, self->_contactResolver);
          v77 = v186;

          PKLocalizedString(CFSTR("SEARCH_RESULTS_TWO_TOKENS"), CFSTR("%@%@"), v74, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTitle:", v78);

          goto LABEL_73;
        case 3uLL:
          v185 = 0;
          objc_msgSend(v50, "tokens");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectAtIndex:", 0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v185, 0, 1, v80, self->_contactResolver);
          v81 = v185;

          v184 = 0;
          objc_msgSend(v50, "tokens");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "objectAtIndex:", 1);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v184, 0, 1, v83, self->_contactResolver);
          v84 = v184;

          v183 = 0;
          objc_msgSend(v50, "tokens");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "objectAtIndex:", 2);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v183, 0, 1, v86, self->_contactResolver);
          v87 = v183;

          PKLocalizedString(CFSTR("SEARCH_RESULTS_THREE_TOKENS"), CFSTR("%@%@%@"), v81, v84, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTitle:", v88);

          v13 = 1;
          goto LABEL_73;
        case 4uLL:
          v182 = 0;
          objc_msgSend(v50, "tokens");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "objectAtIndex:", 0);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v182, 0, 1, v90, self->_contactResolver);
          v91 = v182;

          v181 = 0;
          objc_msgSend(v50, "tokens");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "objectAtIndex:", 1);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v181, 0, 1, v93, self->_contactResolver);
          v94 = v181;

          v180 = 0;
          objc_msgSend(v50, "tokens");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "objectAtIndex:", 2);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v180, 0, 1, v96, self->_contactResolver);
          v97 = v180;

          v179 = 0;
          objc_msgSend(v50, "tokens");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "objectAtIndex:", 3);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v179, 0, 1, v99, self->_contactResolver);
          v100 = v179;

          PKLocalizedString(CFSTR("SEARCH_RESULTS_FOUR_TOKENS"), CFSTR("%@%@%@%@"), v91, v94, v97, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTitle:", v101);

          v13 = 1;
          goto LABEL_73;
        default:
          if (v52 < 5)
            goto LABEL_64;
          PKLocalizedString(CFSTR("SEARCH_RESULTS"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTitle:", v71);

          v13 = 1;
          goto LABEL_73;
      }
    case 0x10uLL:
      objc_msgSend(v10, "familyMember");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accountUser");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = self->_avatarManager;
      objc_msgSend(v61, "altDSID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContactAvatarManager cachedAvatarForAltDSID:](v62, "cachedAvatarForAltDSID:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        objc_msgSend(v8, "setImage:animated:", v64, 0);
      }
      else
      {
        v65 = self->_avatarManager;
        v190[0] = MEMORY[0x1E0C809B0];
        v190[1] = 3221225472;
        v190[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke;
        v190[3] = &unk_1E3E613B0;
        v191 = v8;
        -[PKContactAvatarManager avatarForFamilyMember:accountUser:invitation:completion:](v65, "avatarForFamilyMember:accountUser:invitation:completion:", v60, v61, 0, v190);

      }
      objc_msgSend(v10, "userDisplayName");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v66);

      v13 = 0;
LABEL_21:
      v47 = objc_msgSend(v10, "transactionCount");
      goto LABEL_22;
    default:
      goto LABEL_35;
  }
}

void __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:animated:", *(_QWORD *)(a1 + 40), 1);
}

void __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_4;
  v5[3] = &unk_1E3E61388;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_downloadLogoForItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  PKObjectDownloader *fileDownloader;
  void *v9;
  void *v10;
  PKPaymentService *paymentService;
  PKPaymentService *v12;
  PKPaymentService *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  if (self->_hasNetworkAccess)
  {
    fileDownloader = self->_fileDownloader;
    objc_msgSend(v6, "merchant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logoImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__PKDashboardDetailHeaderItemPresenter__downloadLogoForItem_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E3E65260;
    v18 = v7;
    -[PKObjectDownloader downloadFromUrl:completionHandler:](fileDownloader, "downloadFromUrl:completionHandler:", v10, v17);

  }
  else
  {
    paymentService = self->_paymentService;
    if (!paymentService)
    {
      v12 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
      v13 = self->_paymentService;
      self->_paymentService = v12;

      paymentService = self->_paymentService;
    }
    objc_msgSend(v6, "transaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "merchant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logoImageURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService logoImageDataForURL:completion:](paymentService, "logoImageDataForURL:completion:", v16, v7);

  }
}

uint64_t __83__PKDashboardDetailHeaderItemPresenter__downloadLogoForItem_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PKMapsSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (void)setSnapshotManager:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotManager, a3);
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
  objc_storeStrong((id *)&self->_contactResolver, a3);
}

- (PKContactAvatarManager)avatarManager
{
  return self->_avatarManager;
}

- (void)setAvatarManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarManager, a3);
}

- (UIVisualEffect)overlayEffect
{
  return self->_overlayEffect;
}

- (void)setOverlayEffect:(id)a3
{
  objc_storeStrong((id *)&self->_overlayEffect, a3);
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_overlayEffect, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_logoBackgroundImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_templateCell, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_fileDownloader, 0);
}

@end
