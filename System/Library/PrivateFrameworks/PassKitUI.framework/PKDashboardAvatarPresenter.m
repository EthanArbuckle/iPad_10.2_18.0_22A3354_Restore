@implementation PKDashboardAvatarPresenter

- (PKDashboardAvatarPresenter)initWithAvatarManager:(id)a3
{
  id v5;
  PKDashboardAvatarPresenter *v6;
  PKDashboardAvatarPresenter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardAvatarPresenter;
  v6 = -[PKDashboardAvatarPresenter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_needsSizing = 1;
    objc_storeStrong((id *)&v6->_avatarManager, a3);
  }

  return v7;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("avatarPresenter");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  PKAvatarHeaderView *v11;
  void *v12;

  v8 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("avatarPresenter"), a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostedContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = -[PKAvatarHeaderView initWithContact:counterpartHandle:]([PKAvatarHeaderView alloc], "initWithContact:counterpartHandle:", 0, 0);
    objc_msgSend(v9, "setHostedContentView:", v11);

  }
  objc_msgSend(v9, "hostedContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardAvatarPresenter _configureView:item:](self, "_configureView:item:", v12, v8);

  return v9;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  objc_msgSend(v10, "hostedContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardAvatarPresenter _configureView:item:](self, "_configureView:item:", v9, v8);

}

- (void)swapSummaryInCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  objc_msgSend(v10, "hostedContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardAvatarPresenter _configureView:item:](self, "_configureView:item:", v9, v8);

}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKAvatarHeaderView *sampleView;
  void *v12;
  PKAvatarHeaderView *v13;
  PKAvatarHeaderView *v14;
  PKAvatarHeaderView *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat width;
  CGFloat v21;
  CGFloat height;
  double v23;
  double v24;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_needsSizing)
  {
    sampleView = self->_sampleView;
    if (!sampleView)
    {
      -[PKDashboardAvatarPresenter _contactForItem:](self, "_contactForItem:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKAvatarHeaderView initWithContact:counterpartHandle:]([PKAvatarHeaderView alloc], "initWithContact:counterpartHandle:", v12, 0);
      v14 = self->_sampleView;
      self->_sampleView = v13;

      sampleView = self->_sampleView;
    }
    self->_needsSizing = 0;
    -[PKDashboardAvatarPresenter _configureView:item:](self, "_configureView:item:", sampleView, v8);
    v15 = self->_sampleView;
    objc_msgSend(v9, "bounds");
    v17 = v16;
    +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
    -[PKAvatarHeaderView sizeThatFits:](v15, "sizeThatFits:", v17 + v18 * -2.0, 3.40282347e38);
    width = v19;
    height = v21;
    self->_viewSize.width = v19;
    self->_viewSize.height = v21;
  }
  else
  {
    width = self->_viewSize.width;
    height = self->_viewSize.height;
  }

  v23 = width;
  v24 = height;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKAvatarHeaderView *v11;
  PKAvatarHeaderView *sampleView;

  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
    if (v10)
    {
      self->_needsSizing = 1;
      v11 = -[PKAvatarHeaderView initWithContact:counterpartHandle:]([PKAvatarHeaderView alloc], "initWithContact:counterpartHandle:", 0, 0);
      sampleView = self->_sampleView;
      self->_sampleView = v11;

    }
  }
}

- (id)_contactForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "familyMember");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKContactAvatarManager cachedAvatarForAltDSID:](self->_avatarManager, "cachedAvatarForAltDSID:", v7);
  v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0D66C60];
  if (v9)
  {
    UIImagePNGRepresentation(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactForFamilyMember:nameComponents:imageData:", v5, v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D66C60], "contactForFamilyMember:nameComponents:imageData:", v5, v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_configureView:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKContactAvatarManager *avatarManager;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(id *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[PKDashboardAvatarPresenter _contactForItem:](self, "_contactForItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContact:", v8);
    objc_initWeak(&location, self);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __50__PKDashboardAvatarPresenter__configureView_item___block_invoke;
    v20 = &unk_1E3E6F3C0;
    objc_copyWeak(&v23, &location);
    v9 = v8;
    v21 = v9;
    v22 = v6;
    v10 = _Block_copy(&v17);
    objc_msgSend(v9, "imageData", v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v7, "familyMember");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {

LABEL_6:
        avatarManager = self->_avatarManager;
        objc_msgSend(v7, "familyMember");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accountUser");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKContactAvatarManager avatarForFamilyMember:accountUser:invitation:completion:](avatarManager, "avatarForFamilyMember:accountUser:invitation:completion:", v15, v16, 0, v10);

        goto LABEL_7;
      }
      objc_msgSend(v7, "accountUser");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_6;
    }
LABEL_7:

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

void __50__PKDashboardAvatarPresenter__configureView_item___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PKDashboardAvatarPresenter__configureView_item___block_invoke_2;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __50__PKDashboardAvatarPresenter__configureView_item___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  UIImage *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v6 = WeakRetained;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v4 = *(UIImage **)(a1 + 32);
    if (v4)
    {
      UIImagePNGRepresentation(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setImageData:", v5);

    }
    else
    {
      objc_msgSend(v3, "setImageData:", 0);
    }
    objc_msgSend(*(id *)(a1 + 48), "setContact:", *(_QWORD *)(a1 + 40));

    WeakRetained = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_sampleView, 0);
}

@end
