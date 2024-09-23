@implementation BKLibraryBookshelfController

+ (id)setupBookshelfWithConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BKLibraryBookshelfCollectionViewController *v6;
  void *v7;
  BKLibraryBookshelfSupplementaryDataSource *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  BKLibraryBookshelfBooksDataSource *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  BKLibraryBookshelfBooksDataSource *v47;
  BKLibraryBookshelfLayout *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  _BOOL8 v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  BKLibraryBookshelfMetrics *v63;
  void *v64;
  id v65;
  void *v66;
  BKLibraryDataSourceAdaptor *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BKLibraryBookshelfDragDelegate *v72;
  BKLibraryBookshelfDropDelegate *v73;
  unsigned int v75;
  BKLibraryActionHandler *v76;

  v3 = a3;
  kdebug_trace(725353716, 96, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collection"));
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isDefaultCollection") & 1) == 0)
    v75 = objc_msgSend(v5, "isSeriesCollection") ^ 1;
  else
    v75 = 0;
  v6 = objc_alloc_init(BKLibraryBookshelfCollectionViewController);
  -[BKLibraryBookshelfCollectionViewController setCollection:](v6, "setCollection:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionID"));
  -[BKLibraryBookshelfCollectionViewController setCollectionID:](v6, "setCollectionID:", v7);

  v76 = objc_alloc_init(BKLibraryActionHandler);
  -[BKLibraryActionHandler setBookshelfCVC:](v76, "setBookshelfCVC:", v6);
  v8 = objc_alloc_init(BKLibraryBookshelfSupplementaryDataSource);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortControlConfig"));
  -[BKLibraryBookshelfSupplementaryDataSource setSortControlConfig:](v8, "setSortControlConfig:", v9);

  if (v5)
    v10 = objc_msgSend(v5, "resolvedSortMode");
  else
    v10 = objc_msgSend(v3, "initialSortMode");
  -[BKLibraryBookshelfSupplementaryDataSource setSortMode:](v8, "setSortMode:", v10);
  -[BKLibraryBookshelfSupplementaryDataSource setViewMode:](v8, "setViewMode:", objc_msgSend(v3, "initialViewMode"));
  -[BKLibraryBookshelfSupplementaryDataSource setCanChangeViewMode:](v8, "setCanChangeViewMode:", objc_msgSend(v3, "canChangeViewMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readingListButtonText"));
  -[BKLibraryBookshelfSupplementaryDataSource setReadingListButtonText:](v8, "setReadingListButtonText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collection"));
  -[BKLibraryBookshelfSupplementaryDataSource setCollection:](v8, "setCollection:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewTitle"));
  -[BKLibraryBookshelfSupplementaryDataSource setCollectionTitle:](v8, "setCollectionTitle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewDescription"));
  -[BKLibraryBookshelfSupplementaryDataSource setCollectionDescription:](v8, "setCollectionDescription:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionDescriptionPlaceholderText"));
  -[BKLibraryBookshelfSupplementaryDataSource setCollectionDescriptionPlaceHolder:](v8, "setCollectionDescriptionPlaceHolder:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesID"));
  -[BKLibraryBookshelfSupplementaryDataSource setSeriesID:](v8, "setSeriesID:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noBooksDescription"));
  -[BKLibraryBookshelfSupplementaryDataSource setNoBooksDescription:](v8, "setNoBooksDescription:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "noBooksDescriptionHeader"));
  -[BKLibraryBookshelfSupplementaryDataSource setNoBooksDescriptionHeader:](v8, "setNoBooksDescriptionHeader:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudDownloadImageName"));
  -[BKLibraryBookshelfSupplementaryDataSource setCloudDownloadImageName:](v8, "setCloudDownloadImageName:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudUploadingImageName"));
  -[BKLibraryBookshelfSupplementaryDataSource setCloudUploadingImageName:](v8, "setCloudUploadingImageName:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudErrorImageName"));
  -[BKLibraryBookshelfSupplementaryDataSource setCloudErrorImageName:](v8, "setCloudErrorImageName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionMenuImageName"));
  -[BKLibraryBookshelfSupplementaryDataSource setActionMenuImageName:](v8, "setActionMenuImageName:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reviewBackgroundName"));
  -[BKLibraryBookshelfSupplementaryDataSource setReviewBackgroundName:](v8, "setReviewBackgroundName:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dragBarName"));
  -[BKLibraryBookshelfSupplementaryDataSource setDragBarName:](v8, "setDragBarName:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedCheckmarkName"));
  -[BKLibraryBookshelfSupplementaryDataSource setSelectedCheckmarkName:](v8, "setSelectedCheckmarkName:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unselectedCheckmarkName"));
  -[BKLibraryBookshelfSupplementaryDataSource setUnselectedCheckmarkName:](v8, "setUnselectedCheckmarkName:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarDownloading"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarDownloading:](v8, "setInfoBarDownloading:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarDownloadWaiting"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarDownloadWaiting:](v8, "setInfoBarDownloadWaiting:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarDownloadPaused"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarDownloadPaused:](v8, "setInfoBarDownloadPaused:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarNew"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarNew:](v8, "setInfoBarNew:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarNext"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarNext:](v8, "setInfoBarNext:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarProof"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarProof:](v8, "setInfoBarProof:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarPreOrderable"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarPreOrderable:](v8, "setInfoBarPreOrderable:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarPreOrdered"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarPreOrdered:](v8, "setInfoBarPreOrdered:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarSample"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarSample:](v8, "setInfoBarSample:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarBuy"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarBuy:](v8, "setInfoBarBuy:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoExpectedDateString"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoExpectedDateString:](v8, "setInfoExpectedDateString:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "moreText"));
  -[BKLibraryBookshelfSupplementaryDataSource setMoreText:](v8, "setMoreText:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoBarAudiobookImageName"));
  -[BKLibraryBookshelfSupplementaryDataSource setInfoBarAudiobookImageName:](v8, "setInfoBarAudiobookImageName:", v39);

  -[BKLibraryBookshelfSupplementaryDataSource setHideTopSeparatorLine:](v8, "setHideTopSeparatorLine:", objc_msgSend(v3, "hideTopSeparatorLine"));
  -[BKLibraryBookshelfSupplementaryDataSource setShowCancelNavigationBarItem:](v8, "setShowCancelNavigationBarItem:", objc_msgSend(v3, "showCancelNavigationBarItem"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementalContentPDFTitle"));
  -[BKLibraryBookshelfSupplementaryDataSource setSupplementalContentPDFPickerTitle:](v8, "setSupplementalContentPDFPickerTitle:", v40);

  -[BKLibraryBookshelfSupplementaryDataSource setSupplementalContentPDFPicker:](v8, "setSupplementalContentPDFPicker:", objc_msgSend(v3, "supplementalContentPDFPicker"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementalContentStorePlaylistID"));
  -[BKLibraryBookshelfSupplementaryDataSource setSupplementalContentStorePlaylistID:](v8, "setSupplementalContentStorePlaylistID:", v41);

  -[BKLibraryBookshelfSupplementaryDataSource setFromActionMenu:](v8, "setFromActionMenu:", objc_msgSend(v3, "fromActionMenu"));
  v42 = [BKLibraryBookshelfBooksDataSource alloc];
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfSupplementaryDataSource seriesID](v8, "seriesID"));
  v44 = objc_msgSend(v3, "providesReviewData");
  v45 = objc_msgSend(v3, "providesProductInfoData");
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productInfoFilter"));
  v47 = -[BKLibraryBookshelfBooksDataSource initWithSortModeProvider:isSeries:providesReviewData:providesProductInfoData:productInfoFilter:](v42, "initWithSortModeProvider:isSeries:providesReviewData:providesProductInfoData:productInfoFilter:", v8, v43 != 0, v44, v45, v46);

  v48 = objc_alloc_init(BKLibraryBookshelfLayout);
  -[BKLibraryBookshelfCollectionViewController setLayout:](v6, "setLayout:", v48);

  v49 = objc_msgSend(v3, "includeCollectionInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v50, "setIncludeCollectionInfo:", v49);

  v51 = objc_msgSend(v3, "supportsReadingListsButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v52, "setSupportsReadingListsButton:", v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v53, "setEditableCollection:", v75);

  v54 = objc_msgSend(v3, "stackedSortControl");
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v55, "setWantsStackedSortControl:", v54);

  v56 = objc_msgSend(v3, "showsSortControl");
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v57, "setWantsSortControl:", v56);

  v58 = (id)-[BKLibraryBookshelfSupplementaryDataSource sortMode](v8, "sortMode") == (id)6;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v59, "setReorderableCollection:", v58);

  v60 = objc_msgSend(v3, "collectionType");
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v61, "setCollectionType:", v60);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v62, "setDelegate:", v6);

  v63 = -[BKLibraryBookshelfMetrics initWithObserver:]([BKLibraryBookshelfMetrics alloc], "initWithObserver:", v6);
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v64, "setMetrics:", v63);

  v65 = -[BKLibraryBookshelfSupplementaryDataSource viewMode](v8, "viewMode");
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v66, "setViewMode:", v65);

  v67 = -[BKLibraryDataSourceAdaptor initWithBooksDataSource:supplementaryDataSource:]([BKLibraryDataSourceAdaptor alloc], "initWithBooksDataSource:supplementaryDataSource:", v47, v8);
  -[BKLibraryBookshelfCollectionViewController setDataSourceAdaptor:](v6, "setDataSourceAdaptor:", v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](v6, "dataSourceAdaptor"));
  objc_msgSend(v68, "setActionHandler:", v76);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](v6, "dataSourceAdaptor"));
  objc_msgSend(v69, "setCoverEffectsEnvironment:", v6);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](v6, "dataSourceAdaptor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](v6, "layout"));
  objc_msgSend(v71, "setMeasuring:", v70);

  v72 = -[BKLibraryBookshelfDragDelegate initWithBookDataSource:]([BKLibraryBookshelfDragDelegate alloc], "initWithBookDataSource:", v47);
  -[BKLibraryBookshelfCollectionViewController setDragDelegate:](v6, "setDragDelegate:", v72);
  v73 = objc_alloc_init(BKLibraryBookshelfDropDelegate);
  -[BKLibraryBookshelfCollectionViewController setDropDelegate:](v6, "setDropDelegate:", v73);
  kdebug_trace(725353716, 97, 0, 0, 0);

  return v6;
}

+ (void)reconfigureBookshelfCollectionViewController:(id)a3 forEditModeState:(BOOL)a4
{
  objc_msgSend(a3, "setEditing:animated:", a4, 1);
}

+ (id)libraryViewControllerWithIdentifier:(id)a3
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BKLibraryBookshelfLibraryCollectionViewConfiguration *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  BKLibraryBookshelfLibraryCollectionViewConfiguration *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[5];
  _QWORD v44[5];

  v3 = a3;
  kdebug_trace(725353712, 102, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryAllIdentifier](BKRootBarItemsProvider, "LibraryAllIdentifier"));
  v43[0] = v4;
  v44[0] = kBKCollectionDefaultAll;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryBooksIdentifier](BKRootBarItemsProvider, "LibraryBooksIdentifier"));
  v43[1] = v5;
  v44[1] = kBKCollectionDefaultIDBooks;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryAudiobooksIdentifier](BKRootBarItemsProvider, "LibraryAudiobooksIdentifier"));
  v43[2] = v6;
  v44[2] = kBKCollectionDefaultIDAudiobooks;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryPDFIdentifier](BKRootBarItemsProvider, "LibraryPDFIdentifier"));
  v43[3] = v7;
  v44[3] = kBKCollectionDefaultIDPDFs;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryDownloadedIdentifier](BKRootBarItemsProvider, "LibraryDownloadedIdentifier"));
  v43[4] = v8;
  v44[4] = kBKCollectionDefaultIDDownloaded;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 5));

  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider customCollectionIDFromItemIdentifier:](BKRootBarItemsProvider, "customCollectionIDFromItemIdentifier:", v3));
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v35 = v9;
  if (v10)
    v12 = v10;
  else
    v12 = v11;
  v13 = v12;
  v33 = v13;
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager", v13, v9));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uiChildContext"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v13, v17, 0));

    v18 = -[BKLibraryBookshelfLibraryCollectionViewConfiguration initWithCollection:]([BKLibraryBookshelfLibraryCollectionViewConfiguration alloc], "initWithCollection:", v13);
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryWantToReadIdentifier](BKRootBarItemsProvider, "LibraryWantToReadIdentifier", v33));
  v41[0] = v19;
  v42[0] = objc_opt_class(BKLibraryBookshelfLibraryWantToReadViewConfiguration);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryFinishedIdentifier](BKRootBarItemsProvider, "LibraryFinishedIdentifier"));
  v41[1] = v20;
  v42[1] = objc_opt_class(BKLibraryBookshelfLibraryFinishedViewConfiguration);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider LibraryMySamplesIdentifier](BKRootBarItemsProvider, "LibraryMySamplesIdentifier"));
  v41[2] = v21;
  v42[2] = objc_opt_class(BKLibraryBookshelfLibrarySamplesViewConfiguration);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 3));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v3, "isEqualToString:", v28))
        {
          v29 = (BKLibraryBookshelfLibraryCollectionViewConfiguration *)objc_alloc_init((Class)objc_msgSend(v23, "objectForKeyedSubscript:", v28));

          v18 = v29;
          goto LABEL_20;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v25)
        continue;
      break;
    }
  }
LABEL_20:

  if (v18)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfController setupBookshelfWithConfig:](BKLibraryBookshelfController, "setupBookshelfWithConfig:", v18));
    if (!v11)
      goto LABEL_26;
  }
  else
  {
    v30 = 0;
    if (!v11)
      goto LABEL_26;
  }
  if (v13)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryCollectionViewConfiguration viewTitle](v18, "viewTitle"));
    objc_msgSend(v30, "setTitle:", v31);

  }
LABEL_26:
  kdebug_trace(725353712, 103, 0, 0, 0);

  return v30;
}

+ (id)supplementalContentPDFPickerWithPlaylistID:(id)a3 fromActionMenu:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration *v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  kdebug_trace(725353712, 102, 0, 0, 0);
  v7 = kBKCollectionDefaultIDPDFs;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uiChildContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v7, v11, 0));

  v13 = -[BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration initWithCollection:storePlaylistID:fromActionMenu:]([BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration alloc], "initWithCollection:storePlaylistID:fromActionMenu:", v12, v6, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "setupBookshelfWithConfig:", v13));
  v15 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v14);
  kdebug_trace(725353712, 103, 0, 0, 0);

  return v15;
}

@end
