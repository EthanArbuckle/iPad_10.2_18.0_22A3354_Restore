@implementation PXPhotoKitVirtualCollections

- (PXPhotoKitVirtualCollections)initWithPhotoLibrary:(id)a3
{
  id v4;
  PXPhotoKitVirtualCollections *v5;
  PXPhotoKitVirtualCollections *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PHAssetCollection *momentsCollection;
  void *v12;
  void *v13;
  uint64_t v14;
  PHAssetCollection *photosCollection;
  void *v16;
  void *v17;
  uint64_t v18;
  PHAssetCollection *memoriesCollection;
  void *v20;
  void *v21;
  uint64_t v22;
  PHAssetCollection *forYouCollection;
  void *v24;
  void *v25;
  uint64_t v26;
  PHAssetCollection *allAlbumsCollection;
  void *v28;
  void *v29;
  uint64_t v30;
  PHAssetCollection *myAlbumsCollection;
  void *v32;
  void *v33;
  uint64_t v34;
  PHAssetCollection *sharedAlbumsCollection;
  void *v36;
  void *v37;
  uint64_t v38;
  PHAssetCollection *searchCollection;
  void *v40;
  void *v41;
  uint64_t v42;
  PHAssetCollection *completeMyMomentCollection;
  void *v44;
  void *v45;
  uint64_t v46;
  PHAssetCollection *sharedActivityCollection;
  void *v48;
  void *v49;
  uint64_t v50;
  PHCollectionList *sharedAlbumsAndActivityCollectionList;
  void *v52;
  void *v53;
  uint64_t v54;
  PHAssetCollection *featuredCollection;
  void *v56;
  void *v57;
  uint64_t v58;
  PHAssetCollection *eventsCollection;
  void *v60;
  void *v61;
  uint64_t v62;
  PHAssetCollection *tripsCollection;
  void *v64;
  void *v65;
  uint64_t v66;
  PHAssetCollection *featuredPhotosCollection;
  void *v68;
  void *v69;
  uint64_t v70;
  PHAssetCollection *wallpaperSuggestionsCollection;
  void *v72;
  void *v73;
  uint64_t v74;
  PHAssetCollection *bookmarksCollection;
  void *v76;
  void *v77;
  uint64_t v78;
  PHAssetCollection *mapCollection;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  PLLazyObject *importHistoryCollection;
  id v85;
  id v86;
  uint64_t v87;
  PLLazyObject *recentlyViewedCollection;
  id v89;
  id v90;
  uint64_t v91;
  PLLazyObject *recentlyEditedCollection;
  id v93;
  id v94;
  uint64_t v95;
  PLLazyObject *recentlySharedCollection;
  id v97;
  id v98;
  uint64_t v99;
  PLLazyObject *contentSyndicationCollection;
  id v101;
  id v102;
  uint64_t v103;
  PLLazyObject *sharedAlbumsCollectionList;
  id v105;
  id v106;
  uint64_t v107;
  PLLazyObject *mediaTypesCollectionList;
  id v109;
  id v110;
  uint64_t v111;
  PLLazyObject *utilitiesCollectionList;
  id v113;
  id v114;
  uint64_t v115;
  PLLazyObject *macSyncedAlbumsCollectionList;
  id v117;
  id v118;
  uint64_t v119;
  PLLazyObject *rootAlbumCollectionList;
  id v121;
  uint64_t v122;
  PLLazyObject *rootProjectCollectionList;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  id v140;
  _QWORD v141[4];
  id v142;
  _QWORD v143[4];
  id v144;
  _QWORD v145[4];
  id v146;
  objc_super v147;

  v4 = a3;
  v147.receiver = self;
  v147.super_class = (Class)PXPhotoKitVirtualCollections;
  v5 = -[PXPhotoKitVirtualCollections init](&v147, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_photoLibrary, v4);
    v7 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionPhotosTitle"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v7, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], v8, CFSTR("PXMomentsVirtualCollection"), v4);
    v10 = objc_claimAutoreleasedReturnValue();
    momentsCollection = v6->_momentsCollection;
    v6->_momentsCollection = (PHAssetCollection *)v10;

    v12 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionLibraryTitle"), CFSTR("PhotosUICore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v13, CFSTR("PXPhotosVirtualCollection"), v4);
    v14 = objc_claimAutoreleasedReturnValue();
    photosCollection = v6->_photosCollection;
    v6->_photosCollection = (PHAssetCollection *)v14;

    v16 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionMemoriesTitle"), CFSTR("PhotosUICore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v17, CFSTR("PXMemoriesVirtualCollection"), v4);
    v18 = objc_claimAutoreleasedReturnValue();
    memoriesCollection = v6->_memoriesCollection;
    v6->_memoriesCollection = (PHAssetCollection *)v18;

    v20 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionForYouTitle"), CFSTR("PhotosUICore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v21, CFSTR("PXForYouVirtualCollection"), v4);
    v22 = objc_claimAutoreleasedReturnValue();
    forYouCollection = v6->_forYouCollection;
    v6->_forYouCollection = (PHAssetCollection *)v22;

    v24 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionAllAlbumsTitle"), CFSTR("PhotosUICore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v25, CFSTR("PXAllAlbumsVirtualCollection"), v4);
    v26 = objc_claimAutoreleasedReturnValue();
    allAlbumsCollection = v6->_allAlbumsCollection;
    v6->_allAlbumsCollection = (PHAssetCollection *)v26;

    v28 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionMyAlbumsTitle"), CFSTR("PhotosUICore"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v29, CFSTR("PXMyAlbumsVirtualCollection"), v4);
    v30 = objc_claimAutoreleasedReturnValue();
    myAlbumsCollection = v6->_myAlbumsCollection;
    v6->_myAlbumsCollection = (PHAssetCollection *)v30;

    v32 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionAllSharedAlbumsTitle"), CFSTR("PhotosUICore"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v33, CFSTR("PXSharedAlbumsVirtualCollection"), v4);
    v34 = objc_claimAutoreleasedReturnValue();
    sharedAlbumsCollection = v6->_sharedAlbumsCollection;
    v6->_sharedAlbumsCollection = (PHAssetCollection *)v34;

    v36 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionSearchTitle"), CFSTR("PhotosUICore"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v37, CFSTR("PXPhotosSearchVirtualCollection"), v4);
    v38 = objc_claimAutoreleasedReturnValue();
    searchCollection = v6->_searchCollection;
    v6->_searchCollection = (PHAssetCollection *)v38;

    v40 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionCompleteMyMomentTitle"), CFSTR("PhotosUICore"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v41, CFSTR("PXCompleteMyMomentVirtualCollection"), v4);
    v42 = objc_claimAutoreleasedReturnValue();
    completeMyMomentCollection = v6->_completeMyMomentCollection;
    v6->_completeMyMomentCollection = (PHAssetCollection *)v42;

    v44 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionSharedActivityTitle"), CFSTR("PhotosUICore"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v45, CFSTR("PXSharedActivityVirtualCollection"), v4);
    v46 = objc_claimAutoreleasedReturnValue();
    sharedActivityCollection = v6->_sharedActivityCollection;
    v6->_sharedActivityCollection = (PHAssetCollection *)v46;

    v48 = (void *)MEMORY[0x1E0CD14E0];
    PXLocalizedStringFromTable(CFSTR("PXCollectionSharedAlbumsTitle"), CFSTR("PhotosUICore"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v9, v49, CFSTR("PXSharedAlbumsAndActivityVirtualCollection"), v4);
    v50 = objc_claimAutoreleasedReturnValue();
    sharedAlbumsAndActivityCollectionList = v6->_sharedAlbumsAndActivityCollectionList;
    v6->_sharedAlbumsAndActivityCollectionList = (PHCollectionList *)v50;

    v52 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionFeaturedTitle"), CFSTR("LemonadeLocalizable"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v53, CFSTR("PXTransientCollectionIdentifierFeatured"), v4);
    v54 = objc_claimAutoreleasedReturnValue();
    featuredCollection = v6->_featuredCollection;
    v6->_featuredCollection = (PHAssetCollection *)v54;

    v56 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionEventsTitle"), CFSTR("LemonadeLocalizable"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v57, CFSTR("PXTransientCollectionIdentifierEvents"), v4);
    v58 = objc_claimAutoreleasedReturnValue();
    eventsCollection = v6->_eventsCollection;
    v6->_eventsCollection = (PHAssetCollection *)v58;

    v60 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionTripsTitle"), CFSTR("LemonadeLocalizable"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v61, CFSTR("PXTransientCollectionIdentifierTrips"), v4);
    v62 = objc_claimAutoreleasedReturnValue();
    tripsCollection = v6->_tripsCollection;
    v6->_tripsCollection = (PHAssetCollection *)v62;

    v64 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionFeaturedPhotosTitle"), CFSTR("LemonadeLocalizable"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v65, CFSTR("PXFeaturedPhotosVirtualCollection"), v4);
    v66 = objc_claimAutoreleasedReturnValue();
    featuredPhotosCollection = v6->_featuredPhotosCollection;
    v6->_featuredPhotosCollection = (PHAssetCollection *)v66;

    v68 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionWallpaperSuggestionsCollectionTitle"), CFSTR("LemonadeLocalizable"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v69, CFSTR("PXTransientCollectionIdentifierWallpaperSuggestions"), v4);
    v70 = objc_claimAutoreleasedReturnValue();
    wallpaperSuggestionsCollection = v6->_wallpaperSuggestionsCollection;
    v6->_wallpaperSuggestionsCollection = (PHAssetCollection *)v70;

    v72 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionBookmarksCollectionTitle"), CFSTR("LemonadeLocalizable"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v73, CFSTR("PXTransientCollectionIdentifierBookmarks"), v4);
    v74 = objc_claimAutoreleasedReturnValue();
    bookmarksCollection = v6->_bookmarksCollection;
    v6->_bookmarksCollection = (PHAssetCollection *)v74;

    v76 = (void *)MEMORY[0x1E0CD13B8];
    PXLocalizedStringFromTable(CFSTR("PXCollectionMapCollectionTitle"), CFSTR("LemonadeLocalizable"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v9, v77, CFSTR("PXTransientCollectionIdentifierMap"), v4);
    v78 = objc_claimAutoreleasedReturnValue();
    mapCollection = v6->_mapCollection;
    v6->_mapCollection = (PHAssetCollection *)v78;

    v80 = objc_alloc(MEMORY[0x1E0D73248]);
    v81 = MEMORY[0x1E0C809B0];
    v145[0] = MEMORY[0x1E0C809B0];
    v145[1] = 3221225472;
    v145[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke;
    v145[3] = &unk_1E5148158;
    v82 = v4;
    v146 = v82;
    v83 = objc_msgSend(v80, "initWithRetriableBlock:", v145);
    importHistoryCollection = v6->_importHistoryCollection;
    v6->_importHistoryCollection = (PLLazyObject *)v83;

    v85 = objc_alloc(MEMORY[0x1E0D73248]);
    v143[0] = v81;
    v143[1] = 3221225472;
    v143[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_2;
    v143[3] = &unk_1E5148158;
    v86 = v82;
    v144 = v86;
    v87 = objc_msgSend(v85, "initWithRetriableBlock:", v143);
    recentlyViewedCollection = v6->_recentlyViewedCollection;
    v6->_recentlyViewedCollection = (PLLazyObject *)v87;

    v89 = objc_alloc(MEMORY[0x1E0D73248]);
    v141[0] = v81;
    v141[1] = 3221225472;
    v141[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_3;
    v141[3] = &unk_1E5148158;
    v90 = v86;
    v142 = v90;
    v91 = objc_msgSend(v89, "initWithRetriableBlock:", v141);
    recentlyEditedCollection = v6->_recentlyEditedCollection;
    v6->_recentlyEditedCollection = (PLLazyObject *)v91;

    v93 = objc_alloc(MEMORY[0x1E0D73248]);
    v139[0] = v81;
    v139[1] = 3221225472;
    v139[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_4;
    v139[3] = &unk_1E5148158;
    v94 = v90;
    v140 = v94;
    v95 = objc_msgSend(v93, "initWithRetriableBlock:", v139);
    recentlySharedCollection = v6->_recentlySharedCollection;
    v6->_recentlySharedCollection = (PLLazyObject *)v95;

    v97 = objc_alloc(MEMORY[0x1E0D73248]);
    v137[0] = v81;
    v137[1] = 3221225472;
    v137[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_5;
    v137[3] = &unk_1E5148158;
    v98 = v94;
    v138 = v98;
    v99 = objc_msgSend(v97, "initWithRetriableBlock:", v137);
    contentSyndicationCollection = v6->_contentSyndicationCollection;
    v6->_contentSyndicationCollection = (PLLazyObject *)v99;

    v101 = objc_alloc(MEMORY[0x1E0D73248]);
    v135[0] = v81;
    v135[1] = 3221225472;
    v135[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_6;
    v135[3] = &unk_1E5148158;
    v102 = v98;
    v136 = v102;
    v103 = objc_msgSend(v101, "initWithRetriableBlock:", v135);
    sharedAlbumsCollectionList = v6->_sharedAlbumsCollectionList;
    v6->_sharedAlbumsCollectionList = (PLLazyObject *)v103;

    v105 = objc_alloc(MEMORY[0x1E0D73248]);
    v133[0] = v81;
    v133[1] = 3221225472;
    v133[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_7;
    v133[3] = &unk_1E5148158;
    v106 = v102;
    v134 = v106;
    v107 = objc_msgSend(v105, "initWithRetriableBlock:", v133);
    mediaTypesCollectionList = v6->_mediaTypesCollectionList;
    v6->_mediaTypesCollectionList = (PLLazyObject *)v107;

    v109 = objc_alloc(MEMORY[0x1E0D73248]);
    v131[0] = v81;
    v131[1] = 3221225472;
    v131[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_8;
    v131[3] = &unk_1E5148158;
    v110 = v106;
    v132 = v110;
    v111 = objc_msgSend(v109, "initWithRetriableBlock:", v131);
    utilitiesCollectionList = v6->_utilitiesCollectionList;
    v6->_utilitiesCollectionList = (PLLazyObject *)v111;

    v113 = objc_alloc(MEMORY[0x1E0D73248]);
    v129[0] = v81;
    v129[1] = 3221225472;
    v129[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_9;
    v129[3] = &unk_1E5148158;
    v114 = v110;
    v130 = v114;
    v115 = objc_msgSend(v113, "initWithRetriableBlock:", v129);
    macSyncedAlbumsCollectionList = v6->_macSyncedAlbumsCollectionList;
    v6->_macSyncedAlbumsCollectionList = (PLLazyObject *)v115;

    v117 = objc_alloc(MEMORY[0x1E0D73248]);
    v127[0] = v81;
    v127[1] = 3221225472;
    v127[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_10;
    v127[3] = &unk_1E5148158;
    v118 = v114;
    v128 = v118;
    v119 = objc_msgSend(v117, "initWithRetriableBlock:", v127);
    rootAlbumCollectionList = v6->_rootAlbumCollectionList;
    v6->_rootAlbumCollectionList = (PLLazyObject *)v119;

    v121 = objc_alloc(MEMORY[0x1E0D73248]);
    v125[0] = v81;
    v125[1] = 3221225472;
    v125[2] = __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_11;
    v125[3] = &unk_1E5148158;
    v126 = v118;
    v122 = objc_msgSend(v121, "initWithRetriableBlock:", v125);
    rootProjectCollectionList = v6->_rootProjectCollectionList;
    v6->_rootProjectCollectionList = (PLLazyObject *)v122;

  }
  return v6;
}

- (PHAssetCollection)peopleCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PXPhotoKitVirtualCollections photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringForPersonOrPetAndVisibility(0, objc_msgSend(v3, "px_peoplePetsHomeVisibility"), CFSTR("PXCollectionPeopleTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CD13B8];
  -[PXPhotoKitVirtualCollections photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], v4, CFSTR("PXPeopleVirtualCollection"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHAssetCollection *)v7;
}

- (PHAssetCollection)prototypeCollection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CD13B8];
  -[PXPhotoKitVirtualCollections photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], CFSTR("Prototype"), CFSTR("PXPrototypeVirtualCollection"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHAssetCollection *)v4;
}

- (PHAssetCollection)importHistoryCollection
{
  return (PHAssetCollection *)-[PLLazyObject objectValue](self->_importHistoryCollection, "objectValue");
}

- (PHAssetCollection)recentlyViewedCollection
{
  return (PHAssetCollection *)-[PLLazyObject objectValue](self->_recentlyViewedCollection, "objectValue");
}

- (PHAssetCollection)recentlyEditedCollection
{
  return (PHAssetCollection *)-[PLLazyObject objectValue](self->_recentlyEditedCollection, "objectValue");
}

- (PHAssetCollection)recentlySharedCollection
{
  return (PHAssetCollection *)-[PLLazyObject objectValue](self->_recentlySharedCollection, "objectValue");
}

- (PHAssetCollection)contentSyndicationCollection
{
  return (PHAssetCollection *)-[PLLazyObject objectValue](self->_contentSyndicationCollection, "objectValue");
}

- (id)featuredTripsCollectionsWithAssetFetchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(a3, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCollectionFeaturedTripsCollectionTitle"), CFSTR("LemonadeLocalizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitVirtualCollections photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v5, v6, CFSTR("PXTransientCollectionIdentifierFeaturedTrips"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)featuredEventsCollectionsWithAssetFetchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(a3, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCollectionFeaturedEventsCollectionTitle"), CFSTR("LemonadeLocalizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitVirtualCollections photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v5, v6, CFSTR("PXTransientCollectionIdentifierFeaturedEvents"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)featuredMemoriesCollectionsWithAssetFetchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(a3, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCollectionFeaturedMemoriesCollectionTitle"), CFSTR("LemonadeLocalizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitVirtualCollections photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v5, v6, CFSTR("PXTransientCollectionIdentifierFeaturedMemories"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)featuredPeopleCollectionsWithAssetFetchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(a3, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXCollectionFeaturedPeopleCollectionTitle"), CFSTR("LemonadeLocalizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitVirtualCollections photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v5, v6, CFSTR("PXTransientCollectionIdentifierFeaturedPeople"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PHCollectionList)sharedAlbumsCollectionList
{
  return (PHCollectionList *)-[PLLazyObject objectValue](self->_sharedAlbumsCollectionList, "objectValue");
}

- (PHCollectionList)mediaTypesCollectionList
{
  return (PHCollectionList *)-[PLLazyObject objectValue](self->_mediaTypesCollectionList, "objectValue");
}

- (PHCollectionList)utilitiesCollectionList
{
  return (PHCollectionList *)-[PLLazyObject objectValue](self->_utilitiesCollectionList, "objectValue");
}

- (PHCollectionList)macSyncedAlbumsCollectionList
{
  return (PHCollectionList *)-[PLLazyObject objectValue](self->_macSyncedAlbumsCollectionList, "objectValue");
}

- (PHCollectionList)rootAlbumCollectionList
{
  return (PHCollectionList *)-[PLLazyObject objectValue](self->_rootAlbumCollectionList, "objectValue");
}

- (PHCollectionList)rootProjectCollectionList
{
  return (PHCollectionList *)-[PLLazyObject objectValue](self->_rootProjectCollectionList, "objectValue");
}

- (PHAssetCollection)momentsCollection
{
  return self->_momentsCollection;
}

- (PHAssetCollection)photosCollection
{
  return self->_photosCollection;
}

- (PHAssetCollection)memoriesCollection
{
  return self->_memoriesCollection;
}

- (PHAssetCollection)forYouCollection
{
  return self->_forYouCollection;
}

- (PHAssetCollection)searchCollection
{
  return self->_searchCollection;
}

- (PHAssetCollection)allAlbumsCollection
{
  return self->_allAlbumsCollection;
}

- (PHAssetCollection)completeMyMomentCollection
{
  return self->_completeMyMomentCollection;
}

- (PHAssetCollection)sharedActivityCollection
{
  return self->_sharedActivityCollection;
}

- (PHAssetCollection)myAlbumsCollection
{
  return self->_myAlbumsCollection;
}

- (PHAssetCollection)sharedAlbumsCollection
{
  return self->_sharedAlbumsCollection;
}

- (PHAssetCollection)featuredCollection
{
  return self->_featuredCollection;
}

- (PHAssetCollection)eventsCollection
{
  return self->_eventsCollection;
}

- (PHAssetCollection)tripsCollection
{
  return self->_tripsCollection;
}

- (PHAssetCollection)featuredPhotosCollection
{
  return self->_featuredPhotosCollection;
}

- (PHAssetCollection)mapCollection
{
  return self->_mapCollection;
}

- (PHAssetCollection)wallpaperSuggestionsCollection
{
  return self->_wallpaperSuggestionsCollection;
}

- (PHAssetCollection)bookmarksCollection
{
  return self->_bookmarksCollection;
}

- (PHCollectionList)sharedAlbumsAndActivityCollectionList
{
  return self->_sharedAlbumsAndActivityCollectionList;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_sharedAlbumsAndActivityCollectionList, 0);
  objc_storeStrong((id *)&self->_bookmarksCollection, 0);
  objc_storeStrong((id *)&self->_wallpaperSuggestionsCollection, 0);
  objc_storeStrong((id *)&self->_mapCollection, 0);
  objc_storeStrong((id *)&self->_featuredPhotosCollection, 0);
  objc_storeStrong((id *)&self->_tripsCollection, 0);
  objc_storeStrong((id *)&self->_eventsCollection, 0);
  objc_storeStrong((id *)&self->_featuredCollection, 0);
  objc_storeStrong((id *)&self->_sharedAlbumsCollection, 0);
  objc_storeStrong((id *)&self->_myAlbumsCollection, 0);
  objc_storeStrong((id *)&self->_sharedActivityCollection, 0);
  objc_storeStrong((id *)&self->_completeMyMomentCollection, 0);
  objc_storeStrong((id *)&self->_allAlbumsCollection, 0);
  objc_storeStrong((id *)&self->_searchCollection, 0);
  objc_storeStrong((id *)&self->_forYouCollection, 0);
  objc_storeStrong((id *)&self->_memoriesCollection, 0);
  objc_storeStrong((id *)&self->_photosCollection, 0);
  objc_storeStrong((id *)&self->_momentsCollection, 0);
  objc_storeStrong((id *)&self->_rootProjectCollectionList, 0);
  objc_storeStrong((id *)&self->_rootAlbumCollectionList, 0);
  objc_storeStrong((id *)&self->_macSyncedAlbumsCollectionList, 0);
  objc_storeStrong((id *)&self->_utilitiesCollectionList, 0);
  objc_storeStrong((id *)&self->_mediaTypesCollectionList, 0);
  objc_storeStrong((id *)&self->_sharedAlbumsCollectionList, 0);
  objc_storeStrong((id *)&self->_contentSyndicationCollection, 0);
  objc_storeStrong((id *)&self->_recentlySharedCollection, 0);
  objc_storeStrong((id *)&self->_recentlyEditedCollection, 0);
  objc_storeStrong((id *)&self->_recentlyViewedCollection, 0);
  objc_storeStrong((id *)&self->_importHistoryCollection, 0);
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 1, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_2(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 7, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_3(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 5, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_4(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 6, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_5(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 0, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_6(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 9, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_7(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 3, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_8(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 10, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_9(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 2, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_10(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 8, *(_QWORD *)(a1 + 32));
}

id __53__PXPhotoKitVirtualCollections_initWithPhotoLibrary___block_invoke_11(uint64_t a1)
{
  return +[PXPhotoKitVirtualCollections _virtualCollectionForType:photoLibrary:](PXPhotoKitVirtualCollections, "_virtualCollectionForType:photoLibrary:", 4, *(_QWORD *)(a1 + 32));
}

+ (id)_makeTransientAssetCollectionWithRecentsKey:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6 configurationHandler:(id)a7
{
  void (**v11)(id, void *);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
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
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(id, void *))a7;
  v12 = (void *)MEMORY[0x1E0C99D48];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setDay:", -14);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startOfDayForDate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v18, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "px_standardLibrarySpecificFetchOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), v16, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInternalPredicate:", v23);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v16, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setInternalSortDescriptors:", v25);

  objc_msgSend(v22, "setWantsIncrementalChangeDetails:", 1);
  if (v11)
    v11[2](v11, v22);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17E8]), "initWithFetchOptions:", v22);
  objc_msgSend(v26, "setType:", 2);
  objc_msgSend(v26, "setTitle:", v15);

  objc_msgSend(v26, "setIdentifier:", v14);
  objc_msgSend(v26, "setKeyAssetsPosition:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithOptions:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_virtualCollectionForType:(int64_t)a3 photoLibrary:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0:
      PXContentSyndicationLocalizedSocialLayerTitle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", MEMORY[0x1E0C9AA60], v8, CFSTR("PXContentSyndicationVirtualCollection"), v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 1:
      objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("importSession != nil"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setInternalPredicate:", v10);

      objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 1);
      objc_msgSend(v8, "setSortDescriptors:", MEMORY[0x1E0C9AA60]);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17E8]), "initWithFetchOptions:", v8);
      PXLocalizedStringFromTable(CFSTR("PXImportHistoryTitle"), CFSTR("PhotosUICore"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTitle:", v12);

      objc_msgSend(v11, "setIdentifier:", CFSTR("PXImportHistoryVirtualCollection"));
      objc_msgSend(v11, "setType:", 9);
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithOptions:", v11);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2:
      PXLocalizedStringFromTable(CFSTR("PXSyncedFromMacOutlineTitle"), CFSTR("PhotosUICore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CD14E0];
      v15 = MEMORY[0x1E0C9AA60];
      v16 = CFSTR("PXMacSyncedAlbumsVirtualCollection");
      goto LABEL_17;
    case 3:
      v17 = (void *)MEMORY[0x1E0CD13B8];
      objc_msgSend(MEMORY[0x1E0CD13B8], "px_mediaTypeSmartAlbumSubtypes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "px_fetchAssetCollectionsWithAlbumSubtypes:photoLibrary:", v18, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      PXLocalizedStringFromTable(CFSTR("PXNavigationListGadgetMediaTypesTitle"), CFSTR("PhotosUICore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollections:title:identifier:photoLibrary:", v8, v11, CFSTR("PXMediaTypesVirtualCollection"), v7);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 4:
      v19 = (void *)MEMORY[0x1E0CD14E0];
      objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fetchRootProjectCollectionListWithOptions:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      PXLocalizedStringFromTable(CFSTR("PXCollectionRecentlyEditedTitle"), CFSTR("LemonadeLocalizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("adjustmentTimestamp");
      v22 = CFSTR("PXRecentlyEditedVirtualCollection");
      v23 = &__block_literal_global_188396;
      v24 = v8;
      v25 = v7;
      goto LABEL_11;
    case 6:
      PXLocalizedStringFromTable(CFSTR("PXCollectionRecentlySharedTitle"), CFSTR("LemonadeLocalizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("lastSharedDate");
      v22 = CFSTR("PXRecentlySharedVirtualCollection");
      goto LABEL_10;
    case 7:
      PXLocalizedStringFromTable(CFSTR("PXCollectionRecentlyViewedTitle"), CFSTR("LemonadeLocalizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("additionalAttributes.lastViewedDate");
      v22 = CFSTR("PXRecentlyViewedVirtualCollection");
LABEL_10:
      v24 = v8;
      v25 = v7;
      v23 = 0;
LABEL_11:
      +[PXPhotoKitVirtualCollections _makeTransientAssetCollectionWithRecentsKey:title:identifier:photoLibrary:configurationHandler:](PXPhotoKitVirtualCollections, "_makeTransientAssetCollectionWithRecentsKey:title:identifier:photoLibrary:configurationHandler:", v21, v24, v22, v25, v23);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 8:
      v26 = (void *)MEMORY[0x1E0CD14E0];
      objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "fetchRootAlbumCollectionListWithOptions:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v11 = v20;
      objc_msgSend(v20, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 9:
      v27 = (void *)MEMORY[0x1E0CD13B8];
      objc_msgSend(v6, "px_standardLibrarySpecificFetchOptions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fetchAssetCollectionsWithType:subtype:options:", 1, 101, v28);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      PXLocalizedStringFromTable(CFSTR("PXCollectionSharedAlbumsTitle"), CFSTR("PhotosUICore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD14E0], "transientCollectionListWithCollectionsFetchResult:title:identifier:", v8, v11, CFSTR("PXSharedAlbumsVirtualCollection"));
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v4 = (void *)v13;

      goto LABEL_19;
    case 10:
      PXLocalizedStringFromTable(CFSTR("PXOtherAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CD14E0];
      v15 = MEMORY[0x1E0C9AA60];
      v16 = CFSTR("PXTransientCollectionIdentifierUtilities");
LABEL_17:
      objc_msgSend(v14, "transientCollectionListWithCollections:title:identifier:photoLibrary:", v15, v8, v16, v7);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v4 = (void *)v9;
LABEL_19:

      break;
    default:
      break;
  }

  return v4;
}

uint64_t __71__PXPhotoKitVirtualCollections__virtualCollectionForType_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIncludeRecentlyEditedSmartAlbum:", 1);
}

@end
