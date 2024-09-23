@implementation PUPeopleTileCollectionViewCell

- (PUPeopleTileCollectionViewCell)initWithFrame:(CGRect)a3
{
  PUPeopleTileCollectionViewCell *v3;
  PUPeopleTileCollectionViewCell *v4;
  void *v5;
  UIView *v6;
  void *v7;
  id v8;
  double v9;
  UIView *shadowView;
  UIView *v11;
  void *v12;
  id v13;
  UIImageView *v14;
  void *v15;
  id v16;
  UIImageView *avatarImageView;
  UIImageView *v18;
  UIButton *v19;
  UIButton *menuButton;
  UIButton *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PUPeopleTileCollectionViewCell;
  v3 = -[PUPeopleTileCollectionViewCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUPeopleTileCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIView *)objc_opt_new();
    -[UIView layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIAccessibilityIsInvertColorsEnabled())
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    LODWORD(v9) = 1051931443;
    objc_msgSend(v7, "setShadowOpacity:", v9);
    objc_msgSend(v7, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(v7, "setShadowRadius:", 4.0);
    shadowView = v4->_shadowView;
    v4->_shadowView = v6;
    v11 = v6;

    objc_msgSend(v5, "addSubview:", v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_accessibilityInvertColorsStatusDidChange_, *MEMORY[0x1E0DC4528], 0);

    v13 = objc_alloc(MEMORY[0x1E0DC3890]);
    v14 = (UIImageView *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIImageView layer](v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    avatarImageView = v4->_avatarImageView;
    v4->_avatarImageView = v14;
    v18 = v14;

    objc_msgSend(v5, "addSubview:", v18);
    v19 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    -[UIButton setShowsMenuAsPrimaryAction:](v19, "setShowsMenuAsPrimaryAction:", 1);
    -[UIButton _setTouchInsets:](v19, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    menuButton = v4->_menuButton;
    v4->_menuButton = v19;
    v21 = v19;

    objc_msgSend(v5, "addSubview:", v21);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PUPeopleTileCollectionViewCell;
  -[PUPeopleTileCollectionViewCell layoutSubviews](&v26, sel_layoutSubviews);
  -[PUPeopleTileCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");

  -[PUPeopleTileCollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PUPeopleTileCollectionViewCell avatarImageView](self, "avatarImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[PUPeopleTileCollectionViewCell menuButton](self, "menuButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

  -[PUPeopleTileCollectionViewCell shadowView](self, "shadowView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v13);

  if (v4 == 1)
    v17 = 0.0;
  else
    v17 = v11 - v11 * 0.400000006;
  -[PUPeopleTileCollectionViewCell questionView](self, "questionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v17, v13 - v11 * 0.400000006, v11 * 0.400000006, v11 * 0.400000006);

  -[PUPeopleTileCollectionViewCell previousContentViewSize](self, "previousContentViewSize");
  if (v11 != v20 || v13 != v19)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v11, v11, v11 * 0.5);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGPath");
    -[PUPeopleTileCollectionViewCell shadowView](self, "shadowView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShadowPath:", v22);

    -[PUPeopleTileCollectionViewCell setRenderer:](self, "setRenderer:", 0);
    -[PUPeopleTileCollectionViewCell person](self, "person");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPeopleTileCollectionViewCell _reloadAvatarImageViewForPerson:](self, "_reloadAvatarImageViewForPerson:", v25);

  }
  -[PUPeopleTileCollectionViewCell setPreviousContentViewSize:](self, "setPreviousContentViewSize:", v11, v13);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUPeopleTileCollectionViewCell menuButton](self, "menuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  -[PUPeopleTileCollectionViewCell menuButton](self, "menuButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTest:withEvent:", v7, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)accessibilityInvertColorsStatusDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (UIAccessibilityIsInvertColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v7, "CGColor");
  -[PUPeopleTileCollectionViewCell shadowView](self, "shadowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowColor:", v4);

}

- (void)setPerson:(id)a3 asset:(id)a4
{
  -[PUPeopleTileCollectionViewCell _setPerson:asset:reloadAvatar:](self, "_setPerson:asset:reloadAvatar:", a3, a4, 1);
}

- (void)_setPerson:(id)a3 asset:(id)a4 reloadAvatar:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v5 = a5;
  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)&self->_person, a3);
  objc_storeStrong((id *)&self->_asset, a4);
  if (v5)
    -[PUPeopleTileCollectionViewCell _reloadAvatarImageViewForPerson:](self, "_reloadAvatarImageViewForPerson:", v9);
  -[PUPeopleTileCollectionViewCell questionView](self, "questionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    v14 = v11;
    v15 = 1;
  }
  else
  {
    if (!v11)
    {
      v16 = (void *)MEMORY[0x1E0DC3F10];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "px_circularGlyphViewWithName:backgroundColor:", CFSTR("questionmark.circle"), v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUPeopleTileCollectionViewCell setQuestionView:](self, "setQuestionView:", v11);
      -[PUPeopleTileCollectionViewCell contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v11);

    }
    v14 = v11;
    v15 = 0;
  }
  objc_msgSend(v14, "setHidden:", v15);
  if (v9)
  {
    -[PUPeopleTileCollectionViewCell personActionManager](self, "personActionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = (void *)MEMORY[0x1E0CD13B8];
      objc_msgSend(v9, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], 0, 0, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6C8]), "initWithAssetCollection:displayTitleInfo:", v22, 0);
      -[PUPeopleTileCollectionViewCell setPersonActionManager:](self, "setPersonActionManager:", v23);

      -[PUPeopleTileCollectionViewCell personActionManager](self, "personActionManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPerformerDelegate:", self);

    }
  }
  v25 = objc_alloc(MEMORY[0x1E0CD1620]);
  v34[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v25, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v26, v27, v28, 0, 0, 0);
  -[PUPeopleTileCollectionViewCell personActionManager](self, "personActionManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPeople:", v29);

  objc_msgSend(v9, "px_localizedName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
  {
    -[PUPeopleTileCollectionViewCell menuButton](self, "menuButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAccessibilityLabel:", v31);
  }
  else
  {
    PXLocalizedStringForPersonOrPetAndVisibility();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPeopleTileCollectionViewCell menuButton](self, "menuButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAccessibilityLabel:", v32);

  }
  -[PUPeopleTileCollectionViewCell _setupActionsForPerson:asset:](self, "_setupActionsForPerson:asset:", v9, v10);

}

- (void)refreshPerson
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D7B6B8];
  -[PUPeopleTileCollectionViewCell person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personWithLocalIdentifier:propertySets:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPeopleTileCollectionViewCell asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleTileCollectionViewCell _setPerson:asset:reloadAvatar:](self, "_setPerson:asset:reloadAvatar:", v7, v8, 0);

}

- (void)_reloadAvatarImageViewForPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[PUPeopleTileCollectionViewCell avatarImageView](self, "avatarImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v8 = v7;
  objc_msgSend(v5, "setImage:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v9);

  objc_msgSend(v6, "setMasksToBounds:", 1);
  objc_msgSend(v6, "setCornerRadius:", v8 * 0.5);
  objc_msgSend(v6, "setBorderWidth:", 1.0);
  objc_initWeak(&location, self);
  v10 = (void *)objc_opt_class();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PUPeopleTileCollectionViewCell__reloadAvatarImageViewForPerson___block_invoke;
  v12[3] = &unk_1E58A9F08;
  objc_copyWeak(&v14, &location);
  v11 = v4;
  v13 = v11;
  objc_msgSend(v10, "_fetchContactInfoForPerson:completion:", v11, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_fetchContactImageForPerson:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  -[PUPeopleTileCollectionViewCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:](PUPeopleTileCollectionViewCell, "itemSizeForTraitCollection:", v8);
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v8, "layoutDirection");
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0D7B168];
  objc_msgSend(v8, "displayScale");
  v16 = v15;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__PUPeopleTileCollectionViewCell__fetchContactImageForPerson_contact___block_invoke;
  v18[3] = &unk_1E58A9F30;
  objc_copyWeak(&v20, &location);
  v17 = v6;
  v19 = v17;
  objc_msgSend(v14, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v7, v13 == 1, 0, v18, v10, v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_fetchAvatarImageForPerson:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[PUPeopleTileCollectionViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:](PUPeopleTileCollectionViewCell, "itemSizeForTraitCollection:", v5);
  v7 = v6;
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x1E0D7B690]);
  objc_msgSend(v5, "displayScale");
  v12 = (void *)objc_msgSend(v10, "initWithPerson:targetSize:displayScale:", v4, v7, v9, v11);
  objc_msgSend(v12, "setCornerStyle:", 2);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D7B698], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__PUPeopleTileCollectionViewCell__fetchAvatarImageForPerson___block_invoke;
  v15[3] = &unk_1E58A9F80;
  objc_copyWeak(&v17, &location);
  v14 = v4;
  v16 = v14;
  objc_msgSend(v13, "requestFaceCropForOptions:resultHandler:", v12, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_displayAvatarImageRequestResult:(id)a3 faceRect:(CGRect)a4 person:(id)a5 error:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  double v18;
  double v19;
  void *v20;
  _BOOL4 v21;
  _BOOL8 v22;
  double v23;
  BOOL v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  double v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  CGRect v41;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  -[PUPeopleTileCollectionViewCell person](self, "person");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v14)
  {
    if (v13)
    {
      -[PUPeopleTileCollectionViewCell avatarImageView](self, "avatarImageView");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject frame](v17, "frame");
      v19 = v18;
      -[NSObject layer](v17, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      v21 = CGRectEqualToRect(v41, *MEMORY[0x1E0D7D078]);
      v22 = !v21;
      objc_msgSend(v20, "setMasksToBounds:", v22);
      v23 = v19 * 0.5;
      v24 = !v21;
      if (v21)
        v25 = 4;
      else
        v25 = 1;
      if (v24)
        v26 = 1.0;
      else
        v26 = 0.0;
      if (!v24)
        v23 = 0.0;
      objc_msgSend(v20, "setCornerRadius:", v23);
      objc_msgSend(v20, "setBorderWidth:", v26);
      objc_msgSend(v20, "setContentsRect:", x, y, width, height);
      -[NSObject setContentMode:](v17, "setContentMode:", v25);
      -[NSObject setBackgroundColor:](v17, "setBackgroundColor:", 0);
      if (v22)
      {
        -[NSObject setImage:](v17, "setImage:", v13);
      }
      else
      {
        -[PUPeopleTileCollectionViewCell renderer](self, "renderer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __89__PUPeopleTileCollectionViewCell__displayAvatarImageRequestResult_faceRect_person_error___block_invoke;
        v33 = &unk_1E58AA748;
        v35 = v19;
        v34 = v13;
        objc_msgSend(v27, "imageWithActions:", &v30);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setImage:](v17, "setImage:", v28, v30, v31, v32, v33);

      }
    }
    else
    {
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "localizedDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v14;
        v38 = 2112;
        v39 = v29;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "No face image returned from face crop manager. Person: %@ - Error: %@", buf, 0x16u);

      }
    }

  }
}

- (UIGraphicsImageRenderer)renderer
{
  UIGraphicsImageRenderer *renderer;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIGraphicsImageRenderer *v9;
  UIGraphicsImageRenderer *v10;

  renderer = self->_renderer;
  if (!renderer)
  {
    -[PUPeopleTileCollectionViewCell traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:](PUPeopleTileCollectionViewCell, "itemSizeForTraitCollection:", v4);
    v6 = v5;
    v8 = v7;

    v9 = (UIGraphicsImageRenderer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v6, v8);
    v10 = self->_renderer;
    self->_renderer = v9;

    renderer = self->_renderer;
  }
  return renderer;
}

- (void)_setupActionsForPerson:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  char v41;
  uint64_t *v42;
  _QWORD *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id location;
  _QWORD v71[6];
  _QWORD v72[5];
  uint64_t v73;
  _QWORD v74[4];
  void *v75;
  _QWORD v76[4];
  _QWORD v77[5];
  void *v78;
  _QWORD v79[2];
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPeopleTileCollectionViewCell.m"), 343, CFSTR("%s must be called on the main thread"), "-[PUPeopleTileCollectionViewCell _setupActionsForPerson:asset:]");

  }
  objc_initWeak(&location, self);
  -[PUPeopleTileCollectionViewCell personActionManager](self, "personActionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "standardActionForActionType:", *MEMORY[0x1E0D7C148]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "px_localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v10;
  if (objc_msgSend(v10, "length"))
  {
    PXLocalizedStringForPersonOrPetAndVisibility();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v10;
    PXStringWithValidatedFormat();
    v58 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedString();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack"), v48);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke;
  v67[3] = &unk_1E58A9FA8;
  objc_copyWeak(&v69, &location);
  v15 = v7;
  v68 = v15;
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v58, v13, 0, v67);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedString();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack.person.crop"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3428];
  v63[0] = v14;
  v63[1] = 3221225472;
  v63[2] = __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_2;
  v63[3] = &unk_1E58A9FD0;
  objc_copyWeak(&v66, &location);
  v17 = v15;
  v64 = v17;
  v50 = v8;
  v65 = v50;
  objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v57, v56, 0, v63);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleTileCollectionViewCell personActionManager](self, "personActionManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "standardActionForActionType:", *MEMORY[0x1E0D7C168]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0DC39D0];
    v80[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v21);
    v22 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }
  -[PUPeopleTileCollectionViewCell _reviewActionForPerson:](self, "_reviewActionForPerson:", v17);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v22;
  if (!objc_msgSend(v23, "length"))
  {
    v37 = (void *)MEMORY[0x1E0DC39D0];
    v75 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = _os_feature_enabled_impl();
    if (v49)
      v41 = v40;
    else
      v41 = 1;
    if ((v41 & 1) != 0)
    {
      if (v49 && ((v40 ^ 1) & 1) == 0)
      {
        v72[1] = v49;
        v72[2] = v53;
        v72[3] = v54;
        v72[4] = v52;
        v42 = &v73;
LABEL_29:
        *v42 = (uint64_t)v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0;
        goto LABEL_30;
      }
      if (v49)
        v44 = 1;
      else
        v44 = v40;
      if ((v44 & 1) == 0)
      {
        v71[4] = v53;
        v71[5] = v54;
        v42 = v72;
        goto LABEL_29;
      }
      v71[0] = v53;
      v71[1] = v54;
      v71[2] = v52;
      v43 = v71;
    }
    else
    {
      v74[0] = v49;
      v74[1] = v53;
      v74[2] = v54;
      v43 = v74;
    }
    v42 = v43 + 3;
    goto LABEL_29;
  }
  v24 = (void *)MEMORY[0x1E0DC3428];
  PXLocalizedString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.badge.xmark"), v51);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v14;
  v59[1] = 3221225472;
  v59[2] = __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_3;
  v59[3] = &unk_1E58A9FD0;
  objc_copyWeak(&v62, &location);
  v60 = v17;
  v61 = v50;
  objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, v27, 0, v59);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setAttributes:", 2);
  v29 = v23;
  v30 = (void *)MEMORY[0x1E0DC39D0];
  v79[0] = v55;
  v79[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19
    && (v33 = (void *)MEMORY[0x1E0DC39D0],
        v78 = v19,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v33, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v34),
        v35 = (void *)objc_claimAutoreleasedReturnValue(),
        v34,
        v35))
  {
    v77[0] = v35;
    v77[1] = v53;
    v77[2] = v54;
    v77[3] = v52;
    v77[4] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v76[0] = v53;
    v76[1] = v54;
    v76[2] = v52;
    v76[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_destroyWeak(&v62);
LABEL_30:
  if (v19)
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E58AD278, v36);
  else
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", v29, v36);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleTileCollectionViewCell menuButton](self, "menuButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setMenu:", v45);

  objc_destroyWeak(&v66);
  objc_destroyWeak(&v69);

  objc_destroyWeak(&location);
}

- (id)_reviewActionForPerson:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = _os_feature_enabled_impl();
  v6 = (void *)MEMORY[0x1E0DC3428];
  if (v5)
  {
    PXLemonadeLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.rectangle.stack"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__PUPeopleTileCollectionViewCell__reviewActionForPerson___block_invoke;
    v16[3] = &unk_1E58A9FA8;
    v9 = v16;
    v10 = &v17;
    objc_copyWeak(&v17, &location);
    v16[4] = v4;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v16);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.rectangle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__PUPeopleTileCollectionViewCell__reviewActionForPerson___block_invoke_2;
    v14[3] = &unk_1E58A9FA8;
    v9 = v14;
    v10 = &v15;
    objc_copyWeak(&v15, &location);
    v14[4] = v4;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v14);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_showAlbumActionTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPeopleTileCollectionViewCell peopleDelegate](self, "peopleDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7B570], "isLemonadeUIEnabled"))
  {
    v6 = (void *)MEMORY[0x1E0D7B6B8];
    objc_msgSend(v5, "allPeople");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeLemonadeDetailViewControllerForPerson:allPeople:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "presentPeopleViewController:", v8);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0D7B688]);
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "initWithPeople:ignoreSharedLibraryFilters:", v10, 0);

    objc_msgSend(v5, "pushPeopleViewController:", v8);
  }
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.tilingView.showAlbumTapped"), MEMORY[0x1E0C9AA70]);

}

- (void)_reviewPhotosActionTapped:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D7B6A8], "recoControllerForPerson:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPeopleTileCollectionViewCell peopleDelegate](self, "peopleDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentPeopleViewController:", v5);

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.tilingView.manageTagsTapped"), MEMORY[0x1E0C9AA70]);
}

- (void)_customizeAlbumActionTapped:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D7B748];
  v4 = a3;
  v5 = [v3 alloc];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithPeople:", v6);
  objc_msgSend(v7, "actionPerformerForActionType:", *MEMORY[0x1E0D7C5E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PXPresentationEnvironmentForSender();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentationEnvironment:", v9);

  objc_msgSend(v8, "performActionWithCompletionHandler:", 0);
}

- (void)_unnameActionTapped:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0D7B6B8];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __60__PUPeopleTileCollectionViewCell__unnameActionTapped_asset___block_invoke;
  v15 = &unk_1E58A9FF8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v8, "alertControllerForUntaggingPerson:asset:completion:", v6, v7, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModalPresentationStyle:", 7, v12, v13, v14, v15);
  objc_msgSend(v9, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSourceView:", self);
  -[PUPeopleTileCollectionViewCell bounds](self, "bounds");
  objc_msgSend(v10, "setSourceRect:");
  -[PUPeopleTileCollectionViewCell peopleDelegate](self, "peopleDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentPeopleViewController:", v9);

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.tilingView.untagTapped"), MEMORY[0x1E0C9AA70]);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_nameActionTapped:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x1E0D7B678];
  v5 = a3;
  objc_msgSend(v4, "contextWithPerson:type:", v5, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x1E0D7B6B8], "isPersonHiddenFromPeopleHome:", v5);

  objc_msgSend(v14, "setWantsToBeAddedToPeopleAlbum:", v6);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/Projects/PhotosUI/PhotosUI/iOS/People Tile/PUPeopleTileCollectionViewCell.m"), "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v9, v10, "-[PUPeopleTileCollectionViewCell _nameActionTapped:]", 524);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCallerInfo:", v11);

  objc_msgSend(MEMORY[0x1E0D7B6B8], "bootstrapViewControllerForContext:delegate:", v14, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleTileCollectionViewCell peopleDelegate](self, "peopleDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentPeopleViewController:", v12);

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.tilingView.nameTapped"), MEMORY[0x1E0C9AA70]);
}

- (void)_makeKeyPhotoActionTapped:(id)a3 asset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Expected to have a person and asset pair for make key photo action", buf, 2u);
    }

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B260]), "initWithPerson:asset:", v5, v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PUPeopleTileCollectionViewCell__makeKeyPhotoActionTapped_asset___block_invoke;
  v12[3] = &unk_1E58AA020;
  v13 = v5;
  v14 = v7;
  v10 = v7;
  v11 = v5;
  objc_msgSend(v9, "executeWithUndoManager:completionHandler:", 0, v12);

}

- (id)undoManagerForActionPerformer:(id)a3
{
  return 0;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  if (a5 == 2)
  {
    -[PUPeopleTileCollectionViewCell peopleDelegate](self, "peopleDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentPeopleViewController:", v9);
  }
  else
  {
    if (a5 != 1)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[PUPeopleTileCollectionViewCell peopleDelegate](self, "peopleDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushPeopleViewController:", v9);
  }

  v11 = 1;
LABEL_7:

  return v11;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;

  v6 = a5;
  objc_msgSend(a4, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v6);

  return 1;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  void *v5;
  int v6;

  objc_msgSend(a3, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D7C148]);

  if (a4 == 30)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.tilingView.featureLessTapped"), MEMORY[0x1E0C9AA70]);
      px_dispatch_on_main_queue();
    }
  }
}

- (PUPeopleTileDelegate)peopleDelegate
{
  return (PUPeopleTileDelegate *)objc_loadWeakRetained((id *)&self->_peopleDelegate);
}

- (void)setPeopleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_peopleDelegate, a3);
}

- (UIView)questionView
{
  return self->_questionView;
}

- (void)setQuestionView:(id)a3
{
  objc_storeStrong((id *)&self->_questionView, a3);
}

- (UIButton)menuButton
{
  return self->_menuButton;
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (CGSize)previousContentViewSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_previousContentViewSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreviousContentViewSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_previousContentViewSize, &v3, 16, 1, 0);
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (PXPhotoKitAssetCollectionActionManager)personActionManager
{
  return self->_personActionManager;
}

- (void)setPersonActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_personActionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personActionManager, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_questionView, 0);
  objc_destroyWeak((id *)&self->_peopleDelegate);
}

uint64_t __65__PUPeopleTileCollectionViewCell_actionPerformer_didChangeState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshPerson");
}

void __66__PUPeopleTileCollectionViewCell__makeKeyPhotoActionTapped_asset___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLOneUpGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v10 = "Make Key Photo succeeded from 1up for person %@ asset %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    v10 = "Make Key Photo failed from 1up for person %@ asset %@. Error: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
    goto LABEL_6;
  }

}

void __60__PUPeopleTileCollectionViewCell__unnameActionTapped_asset___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v3 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v3);

    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained(v3);
      objc_msgSend(v5, "peopleDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentPeopleViewController:", v7);

    }
  }

}

void __57__PUPeopleTileCollectionViewCell__reviewActionForPerson___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_customizeAlbumActionTapped:", *(_QWORD *)(a1 + 32));

}

void __57__PUPeopleTileCollectionViewCell__reviewActionForPerson___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reviewPhotosActionTapped:", *(_QWORD *)(a1 + 32));

}

void __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showAlbumActionTapped:", *(_QWORD *)(a1 + 32));

}

void __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_makeKeyPhotoActionTapped:asset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __63__PUPeopleTileCollectionViewCell__setupActionsForPerson_asset___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_unnameActionTapped:asset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __89__PUPeopleTileCollectionViewCell__displayAvatarImageRequestResult_faceRect_person_error___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGFloat v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = *(double *)(a1 + 40) + -2.0;
  v10.origin.x = 1.0;
  v10.origin.y = 1.0;
  v10.size.width = v4;
  v10.size.height = v4;
  v11 = CGRectInset(v10, -1.0, -1.0);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  CGContextSetGrayFillColor(v3, 1.0, 1.0);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGContextFillEllipseInRect(v3, v12);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 1.0, 1.0, v4, v4);
}

void __61__PUPeopleTileCollectionViewCell__fetchAvatarImageForPerson___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v5;
  v8 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __61__PUPeopleTileCollectionViewCell__fetchAvatarImageForPerson___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D7C5B0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D7C5B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "CGRectValue");
  objc_msgSend(WeakRetained, "_displayAvatarImageRequestResult:faceRect:person:error:", v4, *(_QWORD *)(a1 + 48), v2);

}

void __70__PUPeopleTileCollectionViewCell__fetchContactImageForPerson_contact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v5;
  v8 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __70__PUPeopleTileCollectionViewCell__fetchContactImageForPerson_contact___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_displayAvatarImageRequestResult:faceRect:person:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *MEMORY[0x1E0D7D078], *(double *)(MEMORY[0x1E0D7D078] + 8), *(double *)(MEMORY[0x1E0D7D078] + 16), *(double *)(MEMORY[0x1E0D7D078] + 24));

}

void __66__PUPeopleTileCollectionViewCell__reloadAvatarImageViewForPerson___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  if (v6)
    objc_msgSend(WeakRetained, "_fetchContactImageForPerson:contact:", v5, v6);
  else
    objc_msgSend(WeakRetained, "_fetchAvatarImageForPerson:", v5);

}

+ (CGSize)itemSizeForTraitCollection:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = PXUserInterfaceSizeClassFromUITraitCollection();
  v4 = 32.0;
  if (v3 == 2)
    v4 = 40.0;
  v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (OS_dispatch_queue)sharedContactFetchQueue
{
  if (sharedContactFetchQueue_onceToken != -1)
    dispatch_once(&sharedContactFetchQueue_onceToken, &__block_literal_global_97950);
  return (OS_dispatch_queue *)(id)sharedContactFetchQueue_contactFetchQueue;
}

+ (void)_fetchContactInfoForPerson:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "sharedContactFetchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke;
  v10[3] = &unk_1E58AB968;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v10[0] = *MEMORY[0x1E0C96890];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkedContactWithKeysToFetch:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke_2;
  v7[3] = &unk_1E58AB968;
  v5 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __72__PUPeopleTileCollectionViewCell__fetchContactInfoForPerson_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__PUPeopleTileCollectionViewCell_sharedContactFetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("OneUpPeopleContactFetchQueue", v2);
  v1 = (void *)sharedContactFetchQueue_contactFetchQueue;
  sharedContactFetchQueue_contactFetchQueue = (uint64_t)v0;

}

@end
