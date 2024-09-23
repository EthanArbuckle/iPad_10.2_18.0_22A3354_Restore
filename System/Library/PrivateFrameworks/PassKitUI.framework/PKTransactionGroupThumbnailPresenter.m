@implementation PKTransactionGroupThumbnailPresenter

- (PKTransactionGroupThumbnailPresenter)init
{
  PKTransactionGroupThumbnailPresenter *v2;
  NSCache *v3;
  NSCache *iconsPerMerchantCategory;
  PKPaymentTransactionIconGenerator *v5;
  PKPaymentTransactionIconGenerator *iconGenerator;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  PKContactResolver *contactResolver;
  PKThumbnailCollectionViewCell *v12;
  uint64_t v13;
  PKThumbnailCollectionViewCell *sampleCell;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKTransactionGroupThumbnailPresenter;
  v2 = -[PKTransactionGroupThumbnailPresenter init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    iconsPerMerchantCategory = v2->_iconsPerMerchantCategory;
    v2->_iconsPerMerchantCategory = v3;

    v5 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = v2->_iconGenerator;
    v2->_iconGenerator = v5;

    v7 = objc_alloc(MEMORY[0x1E0D66C60]);
    v8 = objc_alloc_init(MEMORY[0x1E0C97298]);
    -[PKTransactionGroupThumbnailPresenter _contactKeysToFetch](v2, "_contactKeysToFetch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithContactStore:keysToFetch:", v8, v9);
    contactResolver = v2->_contactResolver;
    v2->_contactResolver = (PKContactResolver *)v10;

    v12 = [PKThumbnailCollectionViewCell alloc];
    v13 = -[PKThumbnailCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKThumbnailCollectionViewCell *)v13;

  }
  return v2;
}

- (double)thumbnailWidth
{
  unint64_t v2;
  double result;

  v2 = PKUIGetMinScreenWidthType();
  result = dbl_19DF18850[v2 < 4];
  if (!v2)
    return 65.0;
  return result;
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
  v3 = CFSTR("PKTransactionGroupThumbnailPresenterIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PKTransactionGroupThumbnailPresenterIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionGroupThumbnailPresenter updateCell:forItem:inCollectionView:atIndexPath:](self, "updateCell:forItem:inCollectionView:atIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  PKContactAvatarManager *avatarManager;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PKPaymentTransactionIconGenerator *iconGenerator;
  id v31;
  id v32;
  void *v33;
  id *p_from;
  void *v35;
  int v36;
  PKContactResolver *contactResolver;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  PKMapsSnapshotManager *snapshotManager;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  double v54;
  void *v55;
  PKContactAvatarManager *v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id from;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id location[2];

  v10 = a3;
  v11 = a4;
  v58 = a5;
  v12 = a6;
  v13 = v10;
  objc_msgSend(v11, "group");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionGroupThumbnailPresenter thumbnailWidth](self, "thumbnailWidth");
  v16 = v15;
  objc_initWeak(location, self);
  v17 = objc_msgSend(v14, "type");
  v18 = 0;
  v19 = 0;
  v20 = 1;
  if (v17 <= 11)
  {
    if (!v17)
    {
      v52 = objc_msgSend(v14, "merchantCategory", 0);
      PKLocalizedStringFromMerchantCategory();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:", v27);
      objc_msgSend(v13, "setIdentifier:", v27);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache objectForKey:](self->_iconsPerMerchantCategory, "objectForKey:", v28);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v53)
      {
        v54 = PKUIScreenScale();
        PKIconForMerchantCategory(v16, v16, v54, v52, 0, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
          -[NSCache setObject:forKey:](self->_iconsPerMerchantCategory, "setObject:forKey:", v53, v28);
      }
      objc_msgSend(v13, "setImage:animated:", v53, 0);

      goto LABEL_18;
    }
    if (v17 != 1)
      goto LABEL_22;
    objc_msgSend(v14, "merchant", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "displayName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v28);
    objc_msgSend(v13, "setIdentifier:", v29);
    iconGenerator = self->_iconGenerator;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke;
    v70[3] = &unk_1E3E68620;
    objc_copyWeak(&v73, location);
    v31 = v29;
    v71 = v31;
    v32 = v13;
    v72 = v32;
    -[PKPaymentTransactionIconGenerator iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v27, 0, 0, v70, v16, v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage:animated:", v33, 0);

    p_from = &v73;
LABEL_13:
    objc_destroyWeak(p_from);

LABEL_18:
    v19 = 0;
    v18 = 0;
LABEL_21:
    v20 = 1;
    goto LABEL_22;
  }
  switch(v17)
  {
    case 12:
      objc_msgSend(v14, "handles", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "anyObject");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setIdentifier:", v19);
      v36 = -[PKContactResolver hasCachedResultForHandle:](self->_contactResolver, "hasCachedResultForHandle:", v19);
      contactResolver = self->_contactResolver;
      if (v36)
      {
        -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", v19);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionGroupThumbnailPresenter _updateAvatarOnThumbnailCell:contact:](self, "_updateAvatarOnThumbnailCell:contact:", v13, v38);
        -[PKTransactionGroupThumbnailPresenter _updateTitleOnThumbnailCell:withPeerPaymentCounterpartHandle:contact:](self, "_updateTitleOnThumbnailCell:withPeerPaymentCounterpartHandle:contact:", v13, v19, v38);

      }
      else
      {
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_3;
        v66[3] = &unk_1E3E6F408;
        objc_copyWeak(&v69, location);
        v19 = v19;
        v67 = v19;
        v68 = v13;
        -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", v19, v66);

        objc_destroyWeak(&v69);
      }
      v18 = 1;
      goto LABEL_21;
    case 13:
      objc_msgSend(v14, "regions", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "localizedName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:", v28);
      objc_msgSend(v13, "setIdentifier:", v40);
      objc_msgSend(v27, "displayRegion");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
      objc_initWeak(&from, v13);
      snapshotManager = self->_snapshotManager;
      objc_msgSend(v58, "traitCollection");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_5;
      v62[3] = &unk_1E3E62438;
      objc_copyWeak(&v64, &from);
      v31 = v40;
      v63 = v31;
      -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](snapshotManager, "snapshotForDisplayRegion:size:traitCollection:completion:", v50, v62, v42, v44, v46, v48, v16, v16);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setImage:animated:", v51, 0);
      objc_destroyWeak(&v64);
      p_from = &from;
      goto LABEL_13;
    case 16:
      objc_msgSend(v14, "familyMember", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accountUser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "altDSID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIdentifier:", v23);
      avatarManager = self->_avatarManager;
      objc_msgSend(v22, "altDSID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKContactAvatarManager cachedAvatarForAltDSID:](avatarManager, "cachedAvatarForAltDSID:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v13, "setImage:animated:", v26, 0);
      }
      else
      {
        v56 = self->_avatarManager;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_7;
        v59[3] = &unk_1E3E61428;
        v60 = v23;
        v61 = v13;
        -[PKContactAvatarManager avatarForFamilyMember:accountUser:invitation:completion:](v56, "avatarForFamilyMember:accountUser:invitation:completion:", v21, v22, 0, v59);

      }
      objc_msgSend(v14, "userDisplayName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:", v57);

      v19 = 0;
      v18 = 0;
      v20 = 0;
      break;
  }
LABEL_22:
  objc_msgSend(v13, "showAvatarView:", v18);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v55);

  objc_msgSend(v13, "setWantsCustomAppearance:", 1);
  objc_msgSend(v13, "setWantsDefaultHighlightBehavior:", 0);
  objc_msgSend(v13, "setShowsBottomSeparator:", 0);
  objc_msgSend(v13, "setStrokeImage:", v20);
  objc_destroyWeak(location);

}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke(id *a1, void *a2)
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
  v5[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_2;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v9 = WeakRetained;
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_11;
      }
      v8 = objc_msgSend(v5, "isEqualToString:", v6);

      WeakRetained = v9;
      if (!v8)
        goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 48), "setImage:animated:", *(_QWORD *)(a1 + 32), 1);
LABEL_11:
    WeakRetained = v9;
  }
LABEL_12:

}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_3(id *a1, void *a2)
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
  v5[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_4;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_10;
      }
      v8 = objc_msgSend(v5, "isEqualToString:", v6);

      WeakRetained = v9;
      if (!v8)
        goto LABEL_11;
    }
    objc_msgSend(v9, "_updateAvatarOnThumbnailCell:contact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(v9, "_updateTitleOnThumbnailCell:withPeerPaymentCounterpartHandle:contact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
LABEL_10:
    WeakRetained = v9;
  }
LABEL_11:

}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_6;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v3 = *(void **)(a1 + 40);
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

    }
    else
    {
      v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_11;
      }
      v8 = objc_msgSend(v5, "isEqualToString:", v6);

      WeakRetained = v9;
      if (!v8)
        goto LABEL_12;
    }
    objc_msgSend(v9, "setImage:animated:", *(_QWORD *)(a1 + 32), 1);
LABEL_11:
    WeakRetained = v9;
  }
LABEL_12:

}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_8;
  block[3] = &unk_1E3E61400;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int v6;
  id v7;

  if (!*(_QWORD *)(a1 + 32))
    return;
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  if (v4 == v5)
  {

    goto LABEL_8;
  }
  v7 = v5;
  if (!v4 || !v5)
  {

    return;
  }
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
LABEL_8:
    objc_msgSend(*(id *)(a1 + 48), "setImage:animated:", *(_QWORD *)(a1 + 32), 0);
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKThumbnailCollectionViewCell *sampleCell;
  double v6;
  double v7;
  CGSize result;

  sampleCell = self->_sampleCell;
  -[PKTransactionGroupThumbnailPresenter thumbnailWidth](self, "thumbnailWidth", a3, a4, a5);
  -[PKThumbnailCollectionViewCell sizeThatFits:](sampleCell, "sizeThatFits:");
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  UIImage *mapsPlaceholderImage;
  PKThumbnailCollectionViewCell *v11;
  PKThumbnailCollectionViewCell *v12;
  PKThumbnailCollectionViewCell *sampleCell;

  v7 = a4;
  v8 = objc_msgSend(a3, "userInterfaceStyle");
  v9 = objc_msgSend(v7, "userInterfaceStyle");

  if (v8 != v9)
  {
    mapsPlaceholderImage = self->_mapsPlaceholderImage;
    self->_mapsPlaceholderImage = 0;

  }
  v11 = [PKThumbnailCollectionViewCell alloc];
  v12 = -[PKThumbnailCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sampleCell = self->_sampleCell;
  self->_sampleCell = v12;

}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v3 = _MergedGlobals_666();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend((Class)off_1ED06C558(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C966A8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateAvatarOnThumbnailCell:(id)a3 contact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11[0] = v5;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = (id *)v11;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v5, "setContactType:", 0);
    v10 = v5;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v10;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContacts:", v9);
}

- (void)_updateTitleOnThumbnailCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0D67400];
  v8 = a3;
  objc_msgSend(v7, "displayNameForCounterpartHandle:contact:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

}

- (PKMapsSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (void)setSnapshotManager:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotManager, a3);
}

- (PKPaymentDataProvider)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (void)setPaymentDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDataProvider, a3);
}

- (PKContactAvatarManager)avatarManager
{
  return self->_avatarManager;
}

- (void)setAvatarManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_mapsPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_iconsPerMerchantCategory, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
}

@end
