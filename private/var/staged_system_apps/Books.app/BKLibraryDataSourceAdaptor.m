@implementation BKLibraryDataSourceAdaptor

- (BKLibraryDataSourceAdaptor)initWithBooksDataSource:(id)a3 supplementaryDataSource:(id)a4
{
  id v6;
  id v7;
  BKLibraryDataSourceAdaptor *v8;
  BKLibraryDataSourceAdaptor *v9;
  uint64_t v10;
  NSMutableDictionary *storage;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryDataSourceAdaptor;
  v8 = -[BKLibraryDataSourceAdaptor init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    -[BKLibraryDataSourceAdaptor setBooksDataSource:](v8, "setBooksDataSource:", v6);
    -[BKLibraryDataSourceAdaptor setSupplementaryDataSource:](v9, "setSupplementaryDataSource:", v7);
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    storage = v9->_storage;
    v9->_storage = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
  -[BKLibraryDataSourceAdaptor registerClasses](self, "registerClasses");
}

- (void)registerClasses
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
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(BKLibraryBookshelfGridBookCell), off_1009CB800);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(BKLibraryBookshelfListModeBookCell), off_1009CB808);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(BKLibraryBookshelfFinishedBookCell), off_1009CB810);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(BKLibraryBookshelfWantToReadBookCell), off_1009CB818);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(BKLibraryBookshelfTitleHeader), off_1009CB830, off_1009CB820);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v8, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(BKLibraryBookshelfCollectionsHeader), off_1009CB838, off_1009CB820);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v9, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(BKLibraryBookshelfCollectionInfoHeader), off_1009CB840, off_1009CB820);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(BKLibraryBookshelfNoBooks), off_1009CB848, off_1009CB820);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v11, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(BKLibraryBookshelfSectionHeader), off_1009CB850, off_1009CB828);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v12, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(BKLibraryBookshelfSeparatorLine), off_1009CB858, off_1009CB820);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v13, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(BKLibraryBookshelfSeparatorLine), off_1009CB860, off_1009CB820);

}

- (void)reloadData
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
  objc_msgSend(v3, "invalidateFRC");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
  objc_msgSend(v4, "reloadData");

}

- (id)representedObjectForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "representedObjectForIndexPath:", v4));

  return v6;
}

- (id)indexPathForRepresentedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForRepresentedObject:", v4));

  return v6;
}

- (BOOL)isEditable
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collection"));

  LOBYTE(v2) = objc_msgSend(v3, "allowsManualAddition");
  return (char)v2;
}

- (NSString)dataSourceID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collection"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionID"));
  return (NSString *)v4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource", a3));
  v4 = objc_msgSend(v3, "numberOfSections");

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource", a3));
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return (int64_t)v6;
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitTest:withEvent:", 0, v7, v9));

  v12 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBookCell, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
    v15 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBookCell, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v15);

  }
  v16 = objc_msgSend(v13, "shouldDragWithTouch:", v4);

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  void *context;
  void *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  BKLibraryDataSourceAdaptor *v75;

  v6 = a3;
  v7 = a4;
  context = objc_autoreleasePoolPush();
  v8 = objc_opt_class(BKLibraryAsset);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor representedObjectForIndexPath:](self, "representedObjectForIndexPath:", v7));
  v10 = BUDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_opt_class(BKLibraryLayoutAttributes);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutAttributesForItemAtIndexPath:", v7));
  v14 = BUDynamicCast(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = v11;
  v67 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellMetrics"));
  v18 = objc_msgSend(v17, "cellType");

  if (v18 > 4)
    v19 = 0;
  else
    v19 = *off_1008EE488[v18];
  v69 = v6;
  v66 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v7));
  v21 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBookCell, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v22, "setStorageProvider:", self);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor coverEffectsEnvironment](self, "coverEffectsEnvironment"));
  objc_msgSend(v22, "setCoverEffectsEnvironment:", v23);

  v24 = objc_opt_class(BKLibraryBookshelfGridBookCell);
  if ((objc_opt_isKindOfClass(v20, v24) & 1) != 0)
  {
    v25 = objc_opt_class(BKLibraryBookshelfGridBookCell);
    v26 = BUDynamicCast(v25, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor actionHandler](self, "actionHandler"));
    objc_msgSend(v27, "setActionHandler:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
    objc_msgSend(v27, "setHasSeriesSequenceLabel:", objc_msgSend(v29, "hasSeriesSequenceLabel"));

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
  objc_msgSend(v22, "setDataSource:", v30);

  objc_msgSend(v22, "setLibraryAsset:", v16);
  objc_msgSend(v22, "setLayoutManager:", self);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor actionHandler](self, "actionHandler"));
  objc_msgSend(v22, "setupMenuWithLibraryAsset:withActionHandler:", v16, v31);

  v32 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfAudiobookCell, v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor _audioBookStatusForCell:](self, "_audioBookStatusForCell:", v22));
    objc_msgSend(v33, "setAudiobookStatus:", v34);

  }
  v35 = objc_opt_class(BKLibraryBookshelfListModeBookCell);
  if ((objc_opt_isKindOfClass(v20, v35) & 1) != 0)
  {
    v36 = objc_opt_class(BKLibraryBookshelfListModeBookCell);
    v37 = BUDynamicCast(v36, v20);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor actionHandler](self, "actionHandler"));
    objc_msgSend(v38, "setActionHandler:", v39);
LABEL_12:

    goto LABEL_13;
  }
  v40 = objc_opt_class(BKLibraryBookshelfFinishedBookCell);
  if ((objc_opt_isKindOfClass(v20, v40) & 1) != 0)
  {
    v41 = objc_opt_class(BKLibraryBookshelfFinishedBookCell);
    v42 = BUDynamicCast(v41, v20);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor actionHandler](self, "actionHandler"));
    objc_msgSend(v43, "setActionHandler:", v44);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1001ACD80;
    v73[3] = &unk_1008EE3E0;
    v74 = v43;
    v75 = self;
    v39 = v43;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "assetReviewForAssetID:completion:", v38, v73));
    objc_msgSend(v39, "setAssetReview:", v46);

    goto LABEL_12;
  }
  v61 = objc_opt_class(BKLibraryBookshelfWantToReadBookCell);
  if ((objc_opt_isKindOfClass(v20, v61) & 1) != 0)
  {
    v62 = objc_opt_class(BKLibraryBookshelfWantToReadBookCell);
    v63 = BUDynamicCast(v62, v20);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor actionHandler](self, "actionHandler"));
    objc_msgSend(v64, "setActionHandler:", v65);

  }
LABEL_13:
  v47 = objc_opt_class(NSObject);
  v48 = BUClassAndProtocolCast(v20, v47, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  if (objc_msgSend(v49, "needsAsset", &OBJC_PROTOCOL___BKLibraryBookshelfProductProfileCell))
  {
    v50 = objc_msgSend(v16, "isAudiobook");
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1001ACE80;
    v70[3] = &unk_1008EE408;
    v71 = v20;
    v72 = v49;
    objc_msgSend(v52, "resourceForAssetID:type:completion:", v51, v50, v70);

  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "delegate"));
  v55 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfCellSelectionAccessibilityDelegate, v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v57 = objc_opt_class(BKLibraryBookshelfCollectionViewCell);
  v58 = BUDynamicCast(v57, v20);
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  objc_msgSend(v59, "setDelegate:", v56);

  objc_autoreleasePoolPop(context);
  return v20;
}

- (BOOL)isItemPlayingAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));

  v7 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfAudiobookCell, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "audiobookStatus"));
    v10 = objc_msgSend(v9, "assetAudiobookStatusIsPlaying");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_audioBookStatusForCell:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "libraryAsset"));
  v6 = objc_msgSend(v5, "isAudiobook");

  if (v6)
  {
    v7 = objc_opt_class(UIViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    v10 = BUDynamicCast(v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKMinifiedPresenting));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "libraryAsset"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "minifiedPresenterAssetCurrentPresenterForAssetID:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "minifiedAssetStatus"));
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString **v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", off_1009CB830)
    || objc_msgSend(v9, "isEqualToString:", off_1009CB838)
    || objc_msgSend(v9, "isEqualToString:", off_1009CB840))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, off_1009CB820, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
    objc_msgSend(v11, "setDataSource:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor actionHandler](self, "actionHandler"));
    objc_msgSend(v11, "setActionHandler:", v13);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v9, "isEqualToString:", off_1009CB848))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, off_1009CB820, v10));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
    objc_msgSend(v11, "setDataSource:", v13);
    goto LABEL_5;
  }
  if (objc_msgSend(v9, "isEqualToString:", off_1009CB850))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, off_1009CB828, v10));
    v15 = objc_opt_class(BKLibraryAsset);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor representedObjectForIndexPath:](self, "representedObjectForIndexPath:", v10));
    v17 = BUDynamicCast(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentSortMode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "sectionKeyPathForDisplay"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(".")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastObject"));
    v31 = v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringFromSectionData:", v22));

    objc_msgSend(v11, "setSectionName:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collection"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "collectionID"));
    LODWORD(v21) = objc_msgSend(v26, "isEqualToString:", kBKCollectionDefaultIDFinished);

    if ((_DWORD)v21)
      objc_msgSend(v11, "setBottomSeparator:", 1);

  }
  else
  {
    if ((objc_msgSend(v9, "isEqualToString:", off_1009CB858) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", off_1009CB860))
    {
      v27 = &off_1009CB820;
    }
    else
    {
      v27 = &off_1009CB828;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, *v27, v10));
  }
LABEL_6:

  return v11;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource", a3, a4));
  v5 = objc_msgSend(v4, "sortMode") == (id)6;

  return v5;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
  objc_msgSend(v9, "moveItemAtIndexPath:toIndexPath:", v8, v7);

}

- (id)_nonContainerAssetsFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isContainer", (_QWORD)v12) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)collectionView:(id)a3 addAssets:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionID"));
    v9 = objc_msgSend(v8, "isEqualToString:", kBKCollectionDefaultIDFinished);

    if (v9)
    {
      v32 = v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor _nonContainerAssetsFrom:](self, "_nonContainerAssetsFrom:", v5));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v34;
        do
        {
          v15 = 0;
          v16 = v13;
          do
          {
            if (*(_QWORD *)v34 != v14)
              objc_enumerationMutation(v10);
            v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v15);
            v18 = objc_opt_class(BKLibraryAsset);
            v19 = BUDynamicCast(v18, v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            objc_msgSend(v20, "setFinishedStateAddToFinishedCollection");
            v21 = objc_opt_class(BKLibraryManagedObjectContext);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "managedObjectContext"));
            v23 = BUDynamicCast(v21, v22);
            v13 = (void *)objc_claimAutoreleasedReturnValue(v23);

            v15 = (char *)v15 + 1;
            v16 = v13;
          }
          while (v12 != v15);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v13, "setSaveContext:", 2);
      if (objc_msgSend(v13, "hasChanges"))
        objc_msgSend(v13, "saveLibrary");

      v5 = v32;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collection"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "collectionID"));
      v27 = objc_msgSend(v26, "isEqualToString:", kBKCollectionDefaultIDWantToRead);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "collection"));
      v30 = v29;
      if (v27)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor _nonContainerAssetsFrom:](self, "_nonContainerAssetsFrom:", v5));
        objc_msgSend(v30, "addLibraryAssets:", v31);

      }
      else
      {
        objc_msgSend(v29, "addLibraryAssets:", v5);
      }

    }
  }

}

- (void)collectionView:(id)a3 addBookStoreItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionID"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001ADB68;
  v13[3] = &unk_1008E73F0;
  v14 = v5;
  v15 = v10;
  v11 = v10;
  v12 = v5;
  objc_msgSend(v7, "addStoreID:toCollectionID:forceToTop:completion:", v12, v11, 1, v13);

}

- (id)bookImageProviderForLibraryAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForRepresentedObject:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));

  v9 = objc_opt_class(UICollectionViewCell);
  v10 = BUClassAndProtocolCast(v8, v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)coverImageForLibraryAsset:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor bookImageProviderForLibraryAsset:](self, "bookImageProviderForLibraryAsset:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverImage"));

  return v4;
}

- (id)coverAnimationSourceViewForLibraryAsset:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor bookImageProviderForLibraryAsset:](self, "bookImageProviderForLibraryAsset:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverView"));

  return v4;
}

- (CGRect)coverRectForLibraryAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
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
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor bookImageProviderForLibraryAsset:](self, "bookImageProviderForLibraryAsset:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v4, "coverContainerFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v6, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)coverAnimationSourceReferenceViewForLibraryAsset:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  return v4;
}

- (BOOL)coverAnimationSourceUseLargeCoverForLibraryAsset:(id)a3
{
  return 0;
}

- (void)coverAnimationSourcePrepareForLibraryAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBookCell, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "libraryAsset"));

        if (v14 == v4)
        {
          objc_msgSend(v13, "setCoverHidden:", 1);

          goto LABEL_11;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)coverAnimationSourceFinalizeForLibraryAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBookCell, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "libraryAsset"));

        if (v14 == v4)
        {
          objc_msgSend(v13, "setCoverHidden:", 0);

          goto LABEL_11;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

}

- (int64_t)coverAnimationSourceAlignment
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
  v3 = objc_msgSend(v2, "viewMode");

  if (v3 == (id)1)
    return 2;
  else
    return v3 == (id)2;
}

- (void)adjustHeight:(id)a3
{
  void *v4;
  unsigned int v5;
  __objc2_class *v6;
  void *v7;
  int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representedElementKind"));
  v5 = objc_msgSend(v4, "isEqualToString:", off_1009CB830);

  if (v5)
  {
    v6 = BKLibraryBookshelfTitleHeader;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representedElementKind"));
  v8 = objc_msgSend(v7, "isEqualToString:", off_1009CB838);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representedElementKind"));
    v10 = objc_msgSend(v9, "isEqualToString:", off_1009CB840);

    if (v10)
    {
      v6 = BKLibraryBookshelfCollectionInfoHeader;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representedElementKind"));
      v12 = objc_msgSend(v11, "isEqualToString:", off_1009CB848);

      if (!v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representedElementKind"));
        objc_msgSend(v13, "isEqualToString:", off_1009CB850);
        goto LABEL_9;
      }
      v6 = BKLibraryBookshelfNoBooks;
    }
LABEL_8:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
    -[__objc2_class adjustHeight:withDataSource:](v6, "adjustHeight:withDataSource:", v14, v13);
LABEL_9:

  }
}

- (double)bookCellHeightFor:(id)a3 editMode:(BOOL)a4 metrics:(id)a5 clearCache:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v24;

  v7 = a4;
  v10 = a5;
  if (a3)
  {
    v11 = a3;
    v12 = objc_opt_class(BKLibraryAsset);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor representedObjectForIndexPath:](self, "representedObjectForIndexPath:", v11));

    v14 = BUDynamicCast(v12, v13);
    a3 = (id)objc_claimAutoreleasedReturnValue(v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](self, "supplementaryDataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentStoreAccountID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor booksDataSource](self, "booksDataSource"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "assetID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetReviewForAssetID:", v19));

  LOBYTE(v24) = a6;
  +[BKLibraryBookshelfFinishedBookCell bookCellHeightFor:assetReview:storeID:editMode:metrics:storageProvider:clearCache:](BKLibraryBookshelfFinishedBookCell, "bookCellHeightFor:assetReview:storeID:editMode:metrics:storageProvider:clearCache:", a3, v20, v17, v7, v10, self, v24);
  v22 = v21;

  return v22;
}

- (void)storeValue:(id)a3 forKey:(id)a4 forConsumer:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor storage](self, "storage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

  if (!v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor storage](self, "storage"));
    objc_msgSend(v12, "setObject:forKey:", v11, v9);

  }
  objc_msgSend(v11, "setObject:forKey:", v13, v8);

}

- (id)retrieveValueForKey:(id)a3 forConsumer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor storage](self, "storage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));
  return v10;
}

- (void)invalidateLayoutFor:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewLayout"));
  objc_msgSend(v3, "invalidateLayout");

}

- (void)booksDataSource:(id)a3 insertedSections:(id)a4 deletedSections:(id)a5 insertedItems:(id)a6 deletedItems:(id)a7 updatedItems:(id)a8 mayHaveZeroObjects:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void ***v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BKLibraryDataSourceAdaptor *v30;
  BOOL v31;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_1001AE6B4;
  v25 = &unk_1008E8A10;
  v17 = v14;
  v26 = v17;
  v18 = v13;
  v27 = v18;
  v19 = v16;
  v28 = v19;
  v20 = v15;
  v31 = a9;
  v29 = v20;
  v30 = self;
  v21 = objc_retainBlock(&v22);
  if (+[NSThread isMainThread](NSThread, "isMainThread", v22, v23, v24, v25))
    ((void (*)(void ***))v21[2])(v21);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);

}

- (void)booksDataSourceReloadAssetInfo:(id)a3
{
  _QWORD *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001AE990;
  v4[3] = &unk_1008E72C0;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v3[2])(v3);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

- (void)booksDataSourceReloadAssetInfo:(id)a3 forAssetIDs:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001AEA48;
  v5[3] = &unk_1008E7338;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.3);

}

- (void)booksDataSourceReloadAssetReviewData:(id)a3
{
  _QWORD *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001AECCC;
  v4[3] = &unk_1008E72C0;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v3[2])(v3);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

- (void)booksDataSourceReloadAssetReviewData:(id)a3 forAssetIDs:(id)a4
{
  id v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  BKLibraryDataSourceAdaptor *v11;
  id v12;

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1001AEDB4;
  v10 = &unk_1008E7338;
  v11 = self;
  v12 = a4;
  v5 = v12;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &v7, 0.3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor collectionView](self, "collectionView", v7, v8, v9, v10, v11));
  objc_msgSend(v6, "performBatchUpdates:completion:", &stru_1008EE448, &stru_1008EE468);

}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (BKLibraryActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandler, a3);
}

- (BKLibraryBookshelfBooksDataSource)booksDataSource
{
  return self->_booksDataSource;
}

- (void)setBooksDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_booksDataSource, a3);
}

- (BKLibraryBookshelfSupplementaryDataSource)supplementaryDataSource
{
  return self->_supplementaryDataSource;
}

- (void)setSupplementaryDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryDataSource, a3);
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  return (BCUCoverEffectsEnvironment *)objc_loadWeakRetained((id *)&self->_coverEffectsEnvironment);
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_coverEffectsEnvironment, a3);
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_coverEffectsEnvironment);
  objc_storeStrong((id *)&self->_supplementaryDataSource, 0);
  objc_storeStrong((id *)&self->_booksDataSource, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
