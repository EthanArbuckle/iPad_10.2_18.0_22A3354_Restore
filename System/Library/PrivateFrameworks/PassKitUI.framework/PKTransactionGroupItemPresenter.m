@implementation PKTransactionGroupItemPresenter

- (PKTransactionGroupItemPresenter)init
{
  PKTransactionGroupItemPresenter *v2;
  NSCache *v3;
  NSCache *iconsPerMerchantCategory;
  PKPaymentTransactionIconGenerator *v5;
  PKPaymentTransactionIconGenerator *iconGenerator;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  PKContactResolver *contactResolver;
  NSDateFormatter *v12;
  NSDateFormatter *formatterYear;
  NSDateFormatter *v14;
  id v15;
  void *v16;
  NSDateFormatter *v17;
  NSDateFormatter *formatterMonth;
  PKPaymentTransactionCollectionViewCell *v19;
  uint64_t v20;
  PKPaymentTransactionCollectionViewCell *sampleCell;
  NSString *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKTransactionGroupItemPresenter;
  v2 = -[PKTransactionGroupItemPresenter init](&v24, sel_init);
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
    -[PKTransactionGroupItemPresenter _contactKeysToFetch](v2, "_contactKeysToFetch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithContactStore:keysToFetch:", v8, v9);
    contactResolver = v2->_contactResolver;
    v2->_contactResolver = (PKContactResolver *)v10;

    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterYear = v2->_formatterYear;
    v2->_formatterYear = v12;

    v14 = v2->_formatterYear;
    v15 = objc_alloc(MEMORY[0x1E0C99D48]);
    v16 = (void *)objc_msgSend(v15, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    -[NSDateFormatter setCalendar:](v14, "setCalendar:", v16);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_formatterYear, "setLocalizedDateFormatFromTemplate:", CFSTR("y"));
    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterMonth = v2->_formatterMonth;
    v2->_formatterMonth = v17;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_formatterMonth, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
    v2->_needsSizing = 1;
    v19 = [PKPaymentTransactionCollectionViewCell alloc];
    v20 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPaymentTransactionCollectionViewCell *)v20;

    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v2->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory(v22);

  }
  return v2;
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
  v3 = CFSTR("transactionGroupPresenter");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  NSString *v11;
  PKPaymentTransactionCollectionViewCell *v12;
  PKPaymentTransactionCollectionViewCell *v13;
  PKPaymentTransactionCollectionViewCell *sampleCell;
  id v15;

  v7 = a4;
  if (a3)
  {
    if (v7)
    {
      v15 = v7;
      objc_msgSend(a3, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferredContentSizeCategory");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = UIContentSizeCategoryCompareToCategory(v8, v9);

      v7 = v15;
      if (v10)
      {
        objc_msgSend(v15, "preferredContentSizeCategory");
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        self->_useAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v11, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) == NSOrderedDescending;

        self->_needsSizing = 1;
        v12 = [PKPaymentTransactionCollectionViewCell alloc];
        v13 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v13;

        v7 = v15;
      }
    }
  }

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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("transactionGroupPresenter"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionGroupItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:forSizing:](self, "_configureCell:forItem:inCollectionView:forIndexPath:forSizing:", v11, v10, v9, v8, 0);

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  -[PKTransactionGroupItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:forSizing:](self, "_configureCell:forItem:inCollectionView:forIndexPath:forSizing:", a3, a4, a5, a6, 0);
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  double width;
  double height;
  BOOL v13;
  PKPaymentTransactionCollectionViewCell *sampleCell;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_needsSizing
    || self->_useAccessibilityLayout
    || ((width = self->_groupSize.width, height = self->_groupSize.height, width == *MEMORY[0x1E0C9D820])
      ? (v13 = height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v13 = 0),
        v13))
  {
    -[PKTransactionGroupItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:forSizing:](self, "_configureCell:forItem:inCollectionView:forIndexPath:forSizing:", self->_sampleCell, v8, v9, v10, 1);
    sampleCell = self->_sampleCell;
    objc_msgSend(v9, "bounds");
    -[PKPaymentTransactionCollectionViewCell sizeThatFits:](sampleCell, "sizeThatFits:", v15, 3.40282347e38);
    width = v16;
    height = v17;
    self->_groupSize.width = v16;
    self->_groupSize.height = v17;
  }

  v18 = width;
  v19 = height;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transactionCount") != 0;

  return v6;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a6;
  v11 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __110__PKTransactionGroupItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
  v14[3] = &unk_1E3E62370;
  v15 = v10;
  v16 = v11;
  v12 = v10;
  v13 = v11;
  -[PKTransactionGroupItemPresenter _viewControllerForItem:withCompletion:](self, "_viewControllerForItem:withCompletion:", a3, v14);

}

void __110__PKTransactionGroupItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(void))(v4 + 16))(), v6 = v7, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v7, 1);
    v6 = v7;
  }

}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 forSizing:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  void *v13;
  uint64_t v14;
  UIImage *v15;
  UIImage *emptyImage;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSDateFormatter *formatterMonth;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSDateFormatter *formatterYear;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  PKContactAvatarManager *avatarManager;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  unint64_t v90;
  __CFString *v91;
  void *v92;
  PKContactResolver *contactResolver;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  PKPaymentTransactionIconGenerator *iconGenerator;
  double v99;
  double v100;
  double v101;
  double v102;
  id v103;
  id v104;
  void *v105;
  PKMapsSnapshotManager *snapshotManager;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  PKContactAvatarManager *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  _BOOL4 v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  _QWORD v136[4];
  id v137;
  id v138;
  id v139;
  _QWORD v140[4];
  id v141;
  id v142;
  _QWORD v143[4];
  id v144;
  id v145;
  id v146;
  id v147;
  id location;
  _QWORD v149[4];
  id v150;
  id v151;
  id v152;
  id v153;
  _QWORD v154[4];

  v7 = a7;
  v154[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v135 = a4;
  v134 = a5;
  v133 = a6;
  if (v12)
  {
    v130 = v7;
    objc_msgSend(v135, "group");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "merchantCategory");
    if (!self->_emptyImage)
    {
      v15 = (UIImage *)objc_alloc_init(MEMORY[0x1E0DC3870]);
      emptyImage = self->_emptyImage;
      self->_emptyImage = v15;

    }
    objc_msgSend(v12, "transactionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "totalAmount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "amount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "pk_isNegativeNumber");

    if (v20)
    {
      objc_msgSend(v18, "negativeValue");
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v21;
    }
    else
    {
      v22 = v18;
    }
    v132 = v22;
    objc_msgSend(v22, "formattedStringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 1;
    switch(objc_msgSend(v13, "type"))
    {
      case 0:
        PKLocalizedStringFromMerchantCategory();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v26);

        if (v130)
        {
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache objectForKey:](self->_iconsPerMerchantCategory, "objectForKey:", v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v80)
          {
            -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
            v82 = v81;
            v84 = v83;
            v85 = PKUIScreenScale();
            PKIconForMerchantCategory(v82, v84, v85, v14, 0, 0);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (v80)
              -[NSCache setObject:forKey:](self->_iconsPerMerchantCategory, "setObject:forKey:", v80, v79);
          }
          objc_msgSend(v17, "setPrimaryImage:", v80);

        }
        objc_msgSend(v13, "trend");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v86;
        if (v86 && objc_msgSend(v86, "direction"))
        {
          objc_msgSend(v87, "change");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "formattedStringValue");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBadgeString:", v89);

          objc_msgSend(v17, "setHideBadgeBackground:", 1);
          v90 = objc_msgSend(v87, "direction") - 1;
          if (v90 > 4)
            v91 = 0;
          else
            v91 = off_1E3E62518[v90];
          objc_msgSend(v17, "setSecondaryBadgeSymbol:", v91);
          objc_msgSend(v17, "setHideSecondaryBadgeSymbolBackground:", 1);
          v119 = (void *)MEMORY[0x1E0DC3888];
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v154[0] = v120;
          objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v154[1] = v121;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 2);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "configurationWithPaletteColors:", v122);
          v123 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setSecondaryBadgeSymbolConfiguration:", v123);
        }

        v24 = !v130;
        goto LABEL_80;
      case 1:
        if (v20)
        {
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v23);
          v30 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v30;
        }
        objc_msgSend(v13, "merchant");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "displayName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v32);

        if (v130)
        {
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          objc_msgSend(v31, "uniqueIdentifier");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setIdentifier:", v97);
          iconGenerator = self->_iconGenerator;
          -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
          v100 = v99;
          v102 = v101;
          v149[0] = MEMORY[0x1E0C809B0];
          v149[1] = 3221225472;
          v149[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke;
          v149[3] = &unk_1E3E623C0;
          v150 = v12;
          v103 = v97;
          v151 = v103;
          v152 = v134;
          v104 = v17;
          v153 = v104;
          -[PKPaymentTransactionIconGenerator iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v31, 0, 0, v149, v100, v102);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          if (v105)
            objc_msgSend(v104, "setPrimaryImage:animated:", v105, 0);
          else
            objc_msgSend(v104, "setPrimaryImage:", self->_emptyImage);

        }
        goto LABEL_79;
      case 2:

        formatterMonth = self->_formatterMonth;
        objc_msgSend(v13, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](formatterMonth, "stringFromDate:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "pk_uppercaseFirstStringForPreferredLocale");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v36);

        objc_msgSend(v17, "setSecondaryString:", 0);
        objc_msgSend(v17, "setTertiaryString:", 0);
        -[PKTransactionGroupItemPresenter transactionListImage](self, "transactionListImage");
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 3:

        formatterYear = self->_formatterYear;
        objc_msgSend(v13, "startDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](formatterYear, "stringFromDate:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PASS_DETAILS_TRANSACTIONS_IN_YEAR_FORMAT"), CFSTR("%@"), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v41);

        objc_msgSend(v17, "setSecondaryString:", 0);
        objc_msgSend(v17, "setTertiaryString:", 0);
        -[PKTransactionGroupItemPresenter transactionListImage](self, "transactionListImage");
        v37 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v42 = (void *)v37;
        objc_msgSend(v17, "setPrimaryImage:", v37);

        v24 = 0;
        v23 = 0;
        goto LABEL_80;
      case 4:
        objc_msgSend(v132, "amount");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "compare:", v44);

        if (v45 == 1)
        {
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v23);
          v46 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v46 = 0;
        }

        PKLocalizedFeatureString();
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v94);

        objc_msgSend(v17, "setTertiaryString:", 0);
        if (v130)
          goto LABEL_53;
        -[PKTransactionGroupItemPresenter cashbackImage](self, "cashbackImage");
        v60 = objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      case 5:
        objc_msgSend(v132, "amount");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "compare:", v48);

        if (v49 == 1)
        {
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v23);
          v50 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v50;
        }
        PKLocalizedFeatureString();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v51);

        PKLocalizedFeatureString();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSecondaryString:", v52);

        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "isDateInToday:", v54))
        {
          PKLocalizedString(CFSTR("RELATIVE_DATE_TODAY"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          PKRelativeDateStringWithFullDateForUnits();
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "pk_uppercaseFirstStringForPreferredLocale");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v17, "setTertiaryString:", v55);

        if (v130)
        {
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          -[PKTransactionGroupItemPresenter appleCardImage](self, "appleCardImage");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrimaryImage:", v115);

        }
        goto LABEL_68;
      case 7:
        PKLocalizedFeatureString();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v56);

        objc_msgSend(v17, "setSecondaryString:", 0);
        objc_msgSend(v17, "setTertiaryString:", 0);
        if (v130)
        {
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          -[PKTransactionGroupItemPresenter interestImage](self, "interestImage");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrimaryImage:", v53);
LABEL_68:

        }
LABEL_69:
        v116 = objc_msgSend(v13, "transactionCount");
        v24 = 0;
        v25 = 1;
        goto LABEL_82;
      case 9:
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v23);
        v57 = objc_claimAutoreleasedReturnValue();

        PKLocalizedFeatureString();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v58);

        objc_msgSend(v17, "setTertiaryString:", 0);
        if (v130)
        {
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          -[PKTransactionGroupItemPresenter appleCardImage](self, "appleCardImage");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrimaryImage:", v95);

        }
        PKLocalizedString(CFSTR("PAYMENTS_COUNT"), CFSTR("%lu"), objc_msgSend(v13, "transactionCount"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSecondaryString:", v96);

        v23 = (void *)v57;
        goto LABEL_69;
      case 10:
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v23);
        v46 = objc_claimAutoreleasedReturnValue();

        PKLocalizedFeatureString();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v59);

        objc_msgSend(v17, "setTertiaryString:", 0);
        if (v130)
        {
LABEL_53:
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          -[PKTransactionGroupItemPresenter refundsImage](self, "refundsImage");
          v60 = objc_claimAutoreleasedReturnValue();
LABEL_61:
          v113 = (void *)v60;
          objc_msgSend(v17, "setPrimaryImage:", v60);

        }
        v24 = 0;
        v25 = 1;
        v23 = (void *)v46;
        break;
      case 11:
        if (v20)
        {
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v23);
          v61 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v61;
        }
        PKLocalizedFeatureString();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v62);

        objc_msgSend(v17, "setTertiaryString:", 0);
        if (v130)
        {
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          -[PKTransactionGroupItemPresenter adjustmentsImage](self, "adjustmentsImage");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPrimaryImage:", v92);

        }
        goto LABEL_72;
      case 12:
        objc_msgSend(v13, "handles");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "anyObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setShowsAvatarView:", 1);
        objc_msgSend(v17, "setPrimaryImage:", 0);
        objc_msgSend(v12, "setIdentifier:", v28);
        if (-[PKContactResolver hasCachedResultForHandle:](self->_contactResolver, "hasCachedResultForHandle:", v28))
        {
          -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransactionGroupItemPresenter _updateAvatarOnTransactionCell:withGroup:contact:](self, "_updateAvatarOnTransactionCell:withGroup:contact:", v12, v13, v29);
          -[PKTransactionGroupItemPresenter _updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:](self, "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:", v12, v28, v29);

        }
        else
        {
          objc_initWeak(&location, self);
          contactResolver = self->_contactResolver;
          v143[0] = MEMORY[0x1E0C809B0];
          v143[1] = 3221225472;
          v143[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_3;
          v143[3] = &unk_1E3E62410;
          objc_copyWeak(&v147, &location);
          v144 = v12;
          v145 = v28;
          v146 = v13;
          -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", v145, v143);

          objc_destroyWeak(&v147);
          objc_destroyWeak(&location);
        }

        goto LABEL_79;
      case 13:
        objc_msgSend(v13, "regions");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "firstObject");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "displayRegion");
        v66 = v65;
        v68 = v67;
        v70 = v69;
        v72 = v71;
        objc_msgSend(v64, "localizedName");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIdentifier:", v73);
        objc_msgSend(v17, "setPrimaryString:", v73);
        objc_msgSend(v17, "setTertiaryString:", 0);
        if (v130)
        {
          objc_msgSend(v17, "setPrimaryImage:", self->_emptyImage);
        }
        else
        {
          objc_initWeak(&location, v12);
          snapshotManager = self->_snapshotManager;
          -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
          v108 = v107;
          v110 = v109;
          objc_msgSend(v12, "traitCollection");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v140[0] = MEMORY[0x1E0C809B0];
          v140[1] = 3221225472;
          v140[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_5;
          v140[3] = &unk_1E3E62438;
          objc_copyWeak(&v142, &location);
          v141 = v73;
          -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](snapshotManager, "snapshotForDisplayRegion:size:traitCollection:completion:", v111, v140, v66, v68, v70, v72, v108, v110);
          v112 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setPrimaryImage:animated:", v112, 0);
          objc_destroyWeak(&v142);
          objc_destroyWeak(&location);
        }

LABEL_79:
        v24 = 0;
LABEL_80:
        v25 = 1;
        break;
      case 16:
        objc_msgSend(v13, "familyMember");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "accountUser");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "altDSID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setIdentifier:", v75);
        avatarManager = self->_avatarManager;
        objc_msgSend(v74, "altDSID");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKContactAvatarManager cachedAvatarForAltDSID:](avatarManager, "cachedAvatarForAltDSID:", v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
          objc_msgSend(v17, "setPrimaryImage:animated:", v78, 0);
        }
        else
        {
          v117 = self->_avatarManager;
          v136[0] = MEMORY[0x1E0C809B0];
          v136[1] = 3221225472;
          v136[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_7;
          v136[3] = &unk_1E3E62488;
          v137 = v75;
          v138 = v12;
          v139 = v17;
          -[PKContactAvatarManager avatarForFamilyMember:accountUser:invitation:completion:](v117, "avatarForFamilyMember:accountUser:invitation:completion:", v131, v74, 0, v136);

        }
        objc_msgSend(v13, "userDisplayName");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPrimaryString:", v118);

        v25 = 0;
LABEL_72:
        v24 = 0;
        break;
      default:
        break;
    }
    v116 = objc_msgSend(v13, "transactionCount");
    PKLocalizedString(CFSTR("TRANSACTIONS_COUNT"), CFSTR("%lu"), v116);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSecondaryString:", v124);

LABEL_82:
    v125 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v23, "length"))
    {
      v126 = objc_alloc(MEMORY[0x1E0CB3498]);
      v127 = (void *)objc_msgSend(v125, "copy");
      v128 = (void *)objc_msgSend(v126, "initWithString:attributes:", v23, v127);

    }
    else
    {
      v128 = 0;
    }
    objc_msgSend(v17, "setTransactionValueAttributedText:", v128);
    objc_msgSend(v17, "setStrokeImage:", v25);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSecondaryColor:", v129);

    objc_msgSend(v17, "setShowsDisclosureView:", v116 != 0);
    objc_msgSend(v17, "setAllowPrimaryStringExpansion:", v24);

  }
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_2;
  block[3] = &unk_1E3E62398;
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 48);
    v10 = v2;
    v4 = v3;
    if (v10 == v4)
    {

LABEL_11:
      objc_msgSend(*(id *)(a1 + 56), "indexPathsForVisibleItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "indexPathForCell:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      objc_msgSend(*(id *)(a1 + 64), "setPrimaryImage:animated:", *(_QWORD *)(a1 + 32), v9);
      return;
    }
    if (v10)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
    {

      return;
    }
    v6 = objc_msgSend(v10, "isEqualToString:", v4);

    if (v6)
      goto LABEL_11;
  }
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_4;
  block[3] = &unk_1E3E623E8;
  objc_copyWeak(&v10, a1 + 7);
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

LABEL_12:
      WeakRetained = v10;
      goto LABEL_13;
    }
    v9 = objc_msgSend(v5, "isEqualToString:", v6);

    WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      objc_msgSend(v10, "_updateAvatarOnTransactionCell:withGroup:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      objc_msgSend(v10, "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
      goto LABEL_12;
    }
  }
LABEL_13:

}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_5(uint64_t a1, void *a2)
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
  block[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_6;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "transactionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v10, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 40);
      v6 = v4;
      v7 = v5;
      if (v6 == v7)
      {

      }
      else
      {
        v8 = v7;
        if (!v6 || !v7)
        {

          goto LABEL_11;
        }
        v9 = objc_msgSend(v6, "isEqualToString:", v7);

        if (!v9)
          goto LABEL_11;
      }
      objc_msgSend(v3, "setPrimaryImage:animated:", *(_QWORD *)(a1 + 32), 1);
    }
LABEL_11:

    WeakRetained = v10;
  }

}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_7(id *a1, void *a2)
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
  v5[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_8;
  v5[3] = &unk_1E3E62460;
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_8(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 56), "setPrimaryImage:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (void)_viewControllerForItem:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKPaymentDataProvider *v12;
  PKPaymentDataProvider *paymentDataProvider;
  PKTransactionHistoryViewController *v14;
  void *v15;
  PKTransactionGroupItemPresenter *v16;
  PKWorldRegionUpdater *v17;
  void *v18;
  PKTransactionHistoryViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  PKTransactionHistoryViewController *v51;
  void *v52;
  PKTransactionHistoryViewController *v53;
  id v54;
  void *v55;
  void (**v56)(_QWORD, PKTransactionHistoryViewController *);
  void *v57;
  PKTransactionHistoryViewController *v58;
  PKTransactionHistoryViewController *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void (**v77)(_QWORD, PKTransactionHistoryViewController *);
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  PKTransactionHistoryViewController *v83;
  PKTransactionHistoryViewController *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  PKPaymentTransactionsInYearTableViewController *v91;
  void *v92;
  void *v93;
  id v94;
  PKPaymentDataProvider *v95;
  void *v96;
  void *v97;
  void *v98;
  PKPaymentTransactionsInYearTableViewController *v99;
  void *v100;
  void *v101;
  void (**v102)(_QWORD, _QWORD);
  void (**v103)(_QWORD, PKTransactionHistoryViewController *);
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  void (**v115)(_QWORD, _QWORD);
  id v116;
  id location[2];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");
  objc_msgSend(v6, "transactionSourceCollection");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "familyCollection");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountUserCollection");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "physicalCards");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_paymentDataProvider)
  {
    v12 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    paymentDataProvider = self->_paymentDataProvider;
    self->_paymentDataProvider = v12;

  }
  if (v9 <= 11)
  {
    v100 = v11;
    v102 = (void (**)(_QWORD, _QWORD))v7;
    switch(v9)
    {
      case 0:
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithMerchantCategory:transactionSourceCollection:paymentDataProvider:", objc_msgSend(v8, "merchantCategory"), v106, self->_paymentDataProvider);
        objc_msgSend(v6, "tokens");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchTokensOfGroupTypeFromTokens();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "group");
        v44 = v8;
        v45 = v10;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "merchant");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "filterMerchant:", v47);

        v10 = v45;
        v8 = v44;

        objc_msgSend(v6, "tokens");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchTokensOfGroupTypeFromTokens();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchRegionsFromLocationItems();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "filterRegions:", v50);

        -[PKTransactionGroupItemPresenter _applyTokenFiltersFromItem:toFetcher:](self, "_applyTokenFiltersFromItem:toFetcher:", v6, v40);
        v51 = [PKTransactionHistoryViewController alloc];
        v52 = v44;
        v18 = v105;
        v20 = v104;
        v53 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:](v51, "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v52, v106, v104, v10, v105, v100, v40, 0, 0);
        ((void (**)(_QWORD, PKTransactionHistoryViewController *))v102)[2](v102, v53);

        v11 = v100;
        v7 = v102;
        goto LABEL_27;
      case 1:
        v60 = objc_alloc(MEMORY[0x1E0D66C98]);
        objc_msgSend(v8, "merchant");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v60, "initWithMerchant:transactionSourceCollection:paymentDataProvider:", v61, v106, self->_paymentDataProvider);

        -[PKTransactionGroupItemPresenter _applyTokenFiltersFromItem:toFetcher:](self, "_applyTokenFiltersFromItem:toFetcher:", v6, v62);
        objc_msgSend(v6, "tokens");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchTokensOfGroupTypeFromTokens();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchRegionsFromLocationItems();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "filterRegions:", v65);

        objc_msgSend(v6, "tokens");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        PKSearchTokensOfGroupTypeFromTokens();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "firstObject");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "group");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "filterCategory:", objc_msgSend(v69, "merchantCategory"));

        objc_initWeak(location, self);
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke;
        v107[3] = &unk_1E3E624D8;
        objc_copyWeak(&v116, location);
        v70 = v62;
        v108 = v70;
        v109 = v106;
        v20 = v104;
        v110 = v104;
        v111 = v10;
        v112 = v105;
        v11 = v100;
        v113 = v100;
        v114 = v8;
        v7 = v102;
        v115 = v102;
        objc_msgSend(v70, "reloadTransactionsWithCompletion:", v107);

        objc_destroyWeak(&v116);
        objc_destroyWeak(location);

        goto LABEL_26;
      case 3:
        if (!v10 || objc_msgSend(v10, "feature") == 2)
        {
          v14 = [PKTransactionHistoryViewController alloc];
          objc_msgSend(v8, "groups");
          v96 = v10;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc_init(PKTransactionGroupItemPresenter);
          v17 = -[PKWorldRegionUpdater initWithSearchService:]([PKWorldRegionUpdater alloc], "initWithSearchService:", 0);
          v18 = v105;
          v19 = -[PKTransactionHistoryViewController initWithTransactionGroups:headerGroup:groupPresenter:regionUpdater:tokens:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:](v14, "initWithTransactionGroups:headerGroup:groupPresenter:regionUpdater:tokens:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v15, v8, v16, v17, 0, v106, v104, v96, v105, v11);

          v10 = v96;
          (*((void (**)(id, PKTransactionHistoryViewController *))v7 + 2))(v7, v19);

          v20 = v104;
          goto LABEL_27;
        }
        v99 = [PKPaymentTransactionsInYearTableViewController alloc];
        objc_msgSend(v8, "startDate");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = self->_paymentDataProvider;
        v86 = v10;
        v87 = objc_alloc(MEMORY[0x1E0D66C60]);
        v94 = objc_alloc_init(MEMORY[0x1E0C97298]);
        -[PKTransactionGroupItemPresenter _contactKeysToFetch](self, "_contactKeysToFetch");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = (void *)objc_msgSend(v87, "initWithContactStore:keysToFetch:", v94, v88);
        objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = -[PKPaymentTransactionsInYearTableViewController initWithDateFromYear:calendar:transactionSourceCollection:familyCollection:detailViewStyle:paymentServiceDataProvider:contactResolver:peerPaymentWebService:account:](v99, "initWithDateFromYear:calendar:transactionSourceCollection:familyCollection:detailViewStyle:paymentServiceDataProvider:contactResolver:peerPaymentWebService:account:", v93, v85, v106, v104, 0, v95, v89, v90, v86);

        v10 = v86;
        ((void (**)(_QWORD, PKPaymentTransactionsInYearTableViewController *))v102)[2](v102, v91);

        v20 = v104;
        v7 = v102;
LABEL_26:
        v18 = v105;
        goto LABEL_27;
    }
    goto LABEL_17;
  }
  if (v9 == 12)
  {
    v54 = objc_alloc(MEMORY[0x1E0D66C98]);
    objc_msgSend(v8, "handles");
    v55 = v10;
    v56 = (void (**)(_QWORD, PKTransactionHistoryViewController *))v7;
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (PKTransactionHistoryViewController *)objc_msgSend(v54, "initWithCounterpartHandles:transactionSourceCollection:paymentDataProvider:", v57, v106, self->_paymentDataProvider);

    -[PKTransactionGroupItemPresenter _applyTokenFiltersFromItem:toFetcher:](self, "_applyTokenFiltersFromItem:toFetcher:", v6, v58);
    v20 = v104;
    v18 = v105;
    v59 = -[PKTransactionHistoryViewController initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:]([PKTransactionHistoryViewController alloc], "initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:", v58, v106, v104, v55, v105, v11, 0, 0, 0);
    v56[2](v56, v59);

    v7 = v56;
    v10 = v55;
LABEL_20:

    goto LABEL_27;
  }
  if (v9 == 13)
  {
    v71 = objc_alloc(MEMORY[0x1E0D66C98]);
    objc_msgSend(v8, "regions");
    v98 = v10;
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (PKTransactionHistoryViewController *)objc_msgSend(v71, "initWithRegions:transactionSourceCollection:paymentDataProvider:", v72, v106, self->_paymentDataProvider);

    -[PKTransactionGroupItemPresenter _applyTokenFiltersFromItem:toFetcher:](self, "_applyTokenFiltersFromItem:toFetcher:", v6, v58);
    objc_msgSend(v6, "tokens");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    PKSearchTokensOfGroupTypeFromTokens();
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "firstObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "group");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "merchant");
    v77 = (void (**)(_QWORD, PKTransactionHistoryViewController *))v7;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController filterMerchant:](v58, "filterMerchant:", v78);

    objc_msgSend(v6, "tokens");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    PKSearchTokensOfGroupTypeFromTokens();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "firstObject");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "group");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController filterCategory:](v58, "filterCategory:", objc_msgSend(v82, "merchantCategory"));

    v10 = v98;
    v20 = v104;
    v18 = v105;
    v83 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v8, v106, v104, v98, v105, v11, v58, 0, 0);
    v77[2](v77, v83);

    v7 = v77;
    goto LABEL_20;
  }
  if (v9 != 16)
  {
LABEL_17:
    v18 = v105;
    v20 = v104;
    v58 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v8, v106, v104, v10, v105, v11, 0, 0, 0);
    (*((void (**)(id, PKTransactionHistoryViewController *))v7 + 2))(v7, v58);
    goto LABEL_20;
  }
  v103 = (void (**)(_QWORD, PKTransactionHistoryViewController *))v7;
  v97 = v10;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C98]), "initWithTransactionSourceCollection:paymentDataProvider:", v106, self->_paymentDataProvider);
  objc_msgSend(v6, "tokens");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfGroupTypeFromTokens();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "group");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "merchant");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filterMerchant:", v26);

  objc_msgSend(v6, "tokens");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfGroupTypeFromTokens();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchRegionsFromLocationItems();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filterRegions:", v29);

  objc_msgSend(v6, "tokens");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfGroupTypeFromTokens();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "group");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filterCategory:", objc_msgSend(v33, "merchantCategory"));

  v34 = v21;
  -[PKTransactionGroupItemPresenter _applyTokenFiltersFromItem:toFetcher:](self, "_applyTokenFiltersFromItem:toFetcher:", v6, v21);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLimit:startDate:endDate:", 0, 0, v35);

  v36 = v8;
  objc_msgSend(v8, "accountUser");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "isCurrentUser"))
  {
    objc_msgSend(v106, "paymentPass");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "deviceTransactionSourceIdentifiers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v37, "transactionSourceIdentifiers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v101 = v37;
  if (objc_msgSend(v39, "count"))
    objc_msgSend(v21, "filterTransactionSourceIdentifiers:", v39);
  v92 = v21;
  v8 = v36;
  v18 = v105;
  v20 = v104;
  v84 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v36, v106, v104, v97, v105, v11, v92, 0, 0);
  -[PKTransactionHistoryViewController setContactAvatarManager:](v84, "setContactAvatarManager:", self->_avatarManager);
  v103[2](v103, v84);

  v10 = v97;
  v7 = v103;

LABEL_27:
}

void __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke_2;
  v5[3] = &unk_1E3E624B0;
  objc_copyWeak(&v15, a1 + 12);
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v11 = a1[9];
  v12 = a1[10];
  v13 = v3;
  v14 = a1[11];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v15);
}

void __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PKTransactionHistoryViewController *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = -[PKTransactionHistoryViewController initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:]([PKTransactionHistoryViewController alloc], "initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();

    WeakRetained = v4;
  }

}

- (void)_applyTokenFiltersFromItem:(id)a3 toFetcher:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "tokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v9;
  objc_msgSend(v9, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v6;
  objc_msgSend(v6, "setLimit:startDate:endDate:", 0, v10, v11);

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "tokens");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v90 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "transactionType"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
    }
    while (v17);
  }

  v73 = v12;
  objc_msgSend(v76, "filterTypes:", v12);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "tokens");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v86 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "transactionSource"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    }
    while (v26);
  }

  objc_msgSend(v76, "filterSources:", v21);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v75 = v5;
  objc_msgSend(v5, "tokens");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v82;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v82 != v36)
          objc_enumerationMutation(v33);
        v38 = objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * k), "transactionStatus");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v39);

        if (!v38)
          objc_msgSend(v30, "addObject:", &unk_1E3FACC70);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    }
    while (v35);
  }

  objc_msgSend(v76, "filterStatuses:", v30);
  objc_msgSend(v75, "tokens");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "amount");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v42;
  objc_msgSend(v76, "filterAmount:comparison:", v43, objc_msgSend(v42, "comparison"));

  objc_msgSend(v75, "tokens");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "firstObject");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "rewardsValue");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v46;
  objc_msgSend(v76, "filterRewardsValue:unit:", v47, objc_msgSend(v46, "rewardsValueUnit"));

  objc_msgSend(v75, "tokens");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v50;
  objc_msgSend(v76, "filterPeerPaymentSubType:", objc_msgSend(v50, "subType"));
  objc_msgSend(v75, "tokens");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfGroupTypeFromTokens();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "firstObject");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "group");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "accountUser");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "transactionSourceIdentifiers");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v55, "isCurrentUser"))
  {
    objc_msgSend(v75, "transactionSourceCollection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "paymentPass");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "deviceTransactionSourceIdentifiers");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "setByAddingObjectsFromSet:", v59);
    v60 = objc_claimAutoreleasedReturnValue();

    v56 = (void *)v60;
  }
  objc_msgSend(v76, "filterTransactionSourceIdentifiers:", v56);
  v61 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v75, "tokens");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  PKSearchTokensOfTypeFromTokens();
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v64 = v63;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v78;
    do
    {
      for (m = 0; m != v66; ++m)
      {
        if (*(_QWORD *)v78 != v67)
          objc_enumerationMutation(v64);
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * m), "tag");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addObject:", v69);

      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    }
    while (v66);
  }

  objc_msgSend(v76, "filterTags:", v61);
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
  v3 = _MergedGlobals_654();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend((Class)off_1ED06C448(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C966A8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)transactionListImage
{
  UIImage *transactionListImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  transactionListImage = self->_transactionListImage;
  if (!transactionListImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("Category_Transactions"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_transactionListImage;
    self->_transactionListImage = v11;

    transactionListImage = self->_transactionListImage;
  }
  return transactionListImage;
}

- (id)cashbackImage
{
  UIImage *cashbackImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  cashbackImage = self->_cashbackImage;
  if (!cashbackImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("CashBackIcon"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cashbackImage;
    self->_cashbackImage = v11;

    cashbackImage = self->_cashbackImage;
  }
  return cashbackImage;
}

- (id)interestImage
{
  UIImage *interestImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  interestImage = self->_interestImage;
  if (!interestImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("InterestIcon"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_interestImage;
    self->_interestImage = v11;

    interestImage = self->_interestImage;
  }
  return interestImage;
}

- (id)appleCardImage
{
  UIImage *appleCardImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  appleCardImage = self->_appleCardImage;
  if (!appleCardImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("AppleCardIcon"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_appleCardImage;
    self->_appleCardImage = v11;

    appleCardImage = self->_appleCardImage;
  }
  return appleCardImage;
}

- (id)refundsImage
{
  UIImage *refundsImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  refundsImage = self->_refundsImage;
  if (!refundsImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("RefundsIcon"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_refundsImage;
    self->_refundsImage = v11;

    refundsImage = self->_refundsImage;
  }
  return refundsImage;
}

- (id)adjustmentsImage
{
  UIImage *adjustmentsImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  adjustmentsImage = self->_adjustmentsImage;
  if (!adjustmentsImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("AdjustmentsIcon"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionGroupItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_adjustmentsImage;
    self->_adjustmentsImage = v11;

    adjustmentsImage = self->_adjustmentsImage;
  }
  return adjustmentsImage;
}

- (CGSize)_imageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 100.0;
  if (!self->_useAccessibilityLayout)
    v2 = 45.0;
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateAvatarOnTransactionCell:(id)a3 withGroup:(id)a4 contact:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(a3, "transactionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13[0] = v6;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = (id *)v13;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v6, "setContactType:", 0);
    v12 = v6;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v12;
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContacts:", v11);
}

- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0D67400];
  v8 = a3;
  objc_msgSend(v7, "displayNameForCounterpartHandle:contact:", a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transactionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPrimaryString:", v10);
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
  objc_storeStrong((id *)&self->_contactResolver, a3);
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
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_formatterYear, 0);
  objc_storeStrong((id *)&self->_iconsPerMerchantCategory, 0);
  objc_storeStrong((id *)&self->_adjustmentsImage, 0);
  objc_storeStrong((id *)&self->_refundsImage, 0);
  objc_storeStrong((id *)&self->_appleCardImage, 0);
  objc_storeStrong((id *)&self->_interestImage, 0);
  objc_storeStrong((id *)&self->_transactionListImage, 0);
  objc_storeStrong((id *)&self->_cashbackImage, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_transactionCellSecondaryLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellValueLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellPrimaryLabelFont, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
