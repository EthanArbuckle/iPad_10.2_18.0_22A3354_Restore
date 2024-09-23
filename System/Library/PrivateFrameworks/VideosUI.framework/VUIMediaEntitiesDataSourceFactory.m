@implementation VUIMediaEntitiesDataSourceFactory

+ (id)dataSourceForCategoryType:(int64_t)a3 withLibrary:(id)a4 withOwnerIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  VUIFamilySharingMediaEntitiesDataSource *v10;
  VUIMediaEntityFetchRequest *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  VUIFamilySharingMediaEntitiesDataSource *v15;
  VUIFamilySharingMediaEntitiesDataSource *v16;
  id v17;
  void *v18;
  void *v19;
  VUIMediaEntityFetchRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __objc2_class *v30;
  VUIMediaEntityFetchRequest *v31;
  id v32;
  VUIMediaEntityFetchRequest *v33;
  void *v34;
  VUIMediaEntityFetchRequest *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  VUIMediaEntityFetchRequest *v46;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (!v7)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceMediaLibrary");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  switch(a3)
  {
    case 0:
      if (v8)
      {
        +[VUIMediaAPIRequestFactory recentPurchasesRequestWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "recentPurchasesRequestWithOwnerIdentifier:", v8);
        v11 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
        v10 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v11);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = 0;
        goto LABEL_8;
      }
      v31 = [VUIMediaEntityFetchRequest alloc];
      v32 = objc_alloc_init(MEMORY[0x1E0C99E60]);
      v33 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:](v31, "initWithMediaEntityTypes:", v32);

      VUIMediaEntityFetchRequestMinimalPropertiesSet();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaEntityFetchRequest setProperties:](v33, "setProperties:", v34);

      -[VUIMediaEntityFetchRequest addRecentlyAddedSortDescriptorWithLimit:](v33, "addRecentlyAddedSortDescriptorWithLimit:", 0);
      v10 = -[VUIMPMediaEntitiesDataSource initWithMediaLibrary:fetchRequest:]([VUIMPMediaEntitiesDataSource alloc], "initWithMediaLibrary:fetchRequest:", v7, v33);

      goto LABEL_27;
    case 1:
      if (!v8)
      {
        v35 = [VUIMediaEntityFetchRequest alloc];
        v36 = (void *)MEMORY[0x1E0C99E60];
        +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntityType show](VUIMediaEntityType, "show");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setWithObjects:", v37, v38, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:](v35, "initWithMediaEntityTypes:", v39);

        VUIMediaEntityFetchRequestMinimalPropertiesSet();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityFetchRequest setProperties:](v11, "setProperties:", v40);

        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v41;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityFetchRequest setSortDescriptors:](v11, "setSortDescriptors:", v42);

        -[VUIMediaEntityFetchRequest addRecentlyAddedSortDescriptorWithLimit:](v11, "addRecentlyAddedSortDescriptorWithLimit:", 25);
        v43 = (void *)MEMORY[0x1E0CB3880];
        v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v43, "vui_predicateWithSubpredicates:type:", v44, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityFetchRequest setPredicate:](v11, "setPredicate:", v45);

        goto LABEL_23;
      }
      +[VUIMediaAPIRequestFactory recentPurchasesRequestWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "recentPurchasesRequestWithOwnerIdentifier:", v8);
      v11 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
      v10 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v11);
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v13 = 25;
LABEL_8:
      objc_msgSend(v12, "numberWithInt:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFamilySharingMediaEntitiesDataSource setResultLimit:](v10, "setResultLimit:", v14);

      v15 = v10;
      goto LABEL_13;
    case 2:
      if (v8)
      {
        +[VUIMediaAPIRequestFactory moviesPurchasesRequestWithOwnerIdentifier:sortType:](VUIMediaAPIRequestFactory, "moviesPurchasesRequestWithOwnerIdentifier:sortType:", v8, 0);
        v11 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
        v16 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v11);
        goto LABEL_25;
      }
      +[VUIMediaEntityFetchRequest moviesFetchRequest](VUIMediaEntityFetchRequest, "moviesFetchRequest");
      v46 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 3:
      if (v8)
      {
        +[VUIMediaAPIRequestFactory showsPurchasesRequestWithOwnerIdentifier:sortType:](VUIMediaAPIRequestFactory, "showsPurchasesRequestWithOwnerIdentifier:sortType:", v8, 0);
        v11 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
        v15 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v11);
        v10 = v15;
LABEL_13:
        -[VUIFamilySharingMediaEntitiesDataSource setShouldCoalesceEpisodesToShows:](v15, "setShouldCoalesceEpisodesToShows:", 1);
      }
      else
      {
        +[VUIMediaEntityFetchRequest showsFetchRequest](VUIMediaEntityFetchRequest, "showsFetchRequest");
        v46 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        v11 = v46;
        -[VUIMediaEntityFetchRequest setGroupingKeyPath:](v46, "setGroupingKeyPath:", CFSTR("genreTitle"));
LABEL_23:
        v30 = VUIMPMediaEntitiesDataSource;
LABEL_24:
        v16 = (VUIFamilySharingMediaEntitiesDataSource *)objc_msgSend([v30 alloc], "initWithMediaLibrary:fetchRequest:", v7, v11);
LABEL_25:
        v10 = v16;
      }
LABEL_26:

LABEL_27:
      return v10;
    case 4:
      +[VUIMediaEntityFetchRequest moviesFetchRequest](VUIMediaEntityFetchRequest, "moviesFetchRequest");
      v11 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaEntityFetchRequest addHDRColorCapabilityOr4KResolutionPredicate](v11, "addHDRColorCapabilityOr4KResolutionPredicate");
      goto LABEL_23;
    case 5:
      +[VUIMediaEntityFetchRequest homeVideosFetchRequest](VUIMediaEntityFetchRequest, "homeVideosFetchRequest");
      v11 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 6:
      +[VUIMediaEntityFetchRequest movieRentalsFetchRequest](VUIMediaEntityFetchRequest, "movieRentalsFetchRequest");
      v11 = (VUIMediaEntityFetchRequest *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rentalExpirationDate"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, 0);

      -[VUIMediaEntityFetchRequest setSortDescriptors:](v11, "setSortDescriptors:", v19);
      v10 = -[VUIMPMediaEntitiesDataSource initWithMediaLibrary:fetchRequest:]([VUIMPMediaEntitiesDataSource alloc], "initWithMediaLibrary:fetchRequest:", v7, v11);

      goto LABEL_26;
    case 8:
      v20 = [VUIMediaEntityFetchRequest alloc];
      v21 = (void *)MEMORY[0x1E0C99E60];
      +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:](v20, "initWithMediaEntityTypes:", v26);

      VUIMediaEntityFetchRequestAllPropertiesSet();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaEntityFetchRequest setProperties:](v11, "setProperties:", v27);

      -[VUIMediaEntityFetchRequest setGroupingKeyPath:](v11, "setGroupingKeyPath:", CFSTR("showTitle"));
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaEntityFetchRequest setSortDescriptors:](v11, "setSortDescriptors:", v29);

      -[VUIMediaEntityFetchRequest addIsLocalOrHasExpiredDownloadPredicate](v11, "addIsLocalOrHasExpiredDownloadPredicate");
      v30 = VUIDownloadDataSource;
      goto LABEL_24;
    default:
      goto LABEL_27;
  }
}

+ (id)dataSourceForCategoryType:(int64_t)a3 withLibrary:(id)a4
{
  return +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:withOwnerIdentifier:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:withOwnerIdentifier:", a3, a4, 0);
}

+ (id)dataSourceForShelf:(int64_t)a3 withLibrary:(id)a4
{
  return +[VUIMediaEntitiesDataSourceFactory _dataSourceForShelfType:withLibrary:withOwnerIdentifier:](VUIMediaEntitiesDataSourceFactory, "_dataSourceForShelfType:withLibrary:withOwnerIdentifier:", a3, a4, 0);
}

+ (id)_dataSourceForShelfType:(int64_t)a3 withLibrary:(id)a4 withOwnerIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  VUIMPMediaEntitiesDataSource *v14;
  VUIFamilySharingMediaEntitiesDataSource *v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  if (!v7)
  {
    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceMediaLibrary");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  switch(a3)
  {
    case 0:
      +[VUIMediaEntityFetchRequest movieRentalsFetchRequest](VUIMediaEntityFetchRequest, "movieRentalsFetchRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x1E0C99D20]);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rentalExpirationDate"), 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, 0);

      objc_msgSend(v10, "setSortDescriptors:", v13);
      v14 = -[VUIMPMediaEntitiesDataSource initWithMediaLibrary:fetchRequest:]([VUIMPMediaEntitiesDataSource alloc], "initWithMediaLibrary:fetchRequest:", v7, v10);

      goto LABEL_16;
    case 1:
      if (v8)
      {
        +[VUIMediaAPIRequestFactory showsPurchasesRequestWithOwnerIdentifier:sortType:](VUIMediaAPIRequestFactory, "showsPurchasesRequestWithOwnerIdentifier:sortType:", v8, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v10);
        -[VUIMPMediaEntitiesDataSource setShouldCoalesceEpisodesToShows:](v14, "setShouldCoalesceEpisodesToShows:", 1);
        goto LABEL_16;
      }
      +[VUIMediaEntityFetchRequest showsFetchRequest](VUIMediaEntityFetchRequest, "showsFetchRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      if (v8)
      {
        +[VUIMediaAPIRequestFactory moviesPurchasesRequestWithOwnerIdentifier:sortType:](VUIMediaAPIRequestFactory, "moviesPurchasesRequestWithOwnerIdentifier:sortType:", v8, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v10);
      }
      else
      {
        +[VUIMediaEntityFetchRequest moviesFetchRequest](VUIMediaEntityFetchRequest, "moviesFetchRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v10 = v16;
        objc_msgSend(v16, "addRecentlyAddedSortDescriptorWithLimit:", 25);
        objc_msgSend(v10, "setGroupingKeyPath:", CFSTR("genreTitle"));
LABEL_14:
        v15 = -[VUIMPMediaEntitiesDataSource initWithMediaLibrary:fetchRequest:]([VUIMPMediaEntitiesDataSource alloc], "initWithMediaLibrary:fetchRequest:", v7, v10);
      }
      v14 = (VUIMPMediaEntitiesDataSource *)v15;
LABEL_16:

LABEL_17:
      return v14;
    case 3:
      +[VUIMediaEntityFetchRequest moviesFetchRequest](VUIMediaEntityFetchRequest, "moviesFetchRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addHDRColorCapabilityOr4KResolutionPredicate");
      goto LABEL_14;
    default:
      v14 = 0;
      goto LABEL_17;
  }
}

+ (id)dataSourceForCategoryType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataSourceForCategoryType:withLibrary:withOwnerIdentifier:", a3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dataSourceForFetchRequest:(id)a3 withLibrary:(id)a4
{
  id v5;
  id v6;
  VUIMPMediaEntitiesDataSource *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[VUIMPMediaEntitiesDataSource initWithMediaLibrary:fetchRequest:]([VUIMPMediaEntitiesDataSource alloc], "initWithMediaLibrary:fetchRequest:", v5, v6);

  return v7;
}

+ (id)seasonsDataSourceForShowIdentifier:(id)a3 withFamilyMember:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  VUIFamilySharingMediaEntitiesDataSource *v9;

  v5 = a3;
  objc_msgSend(a4, "memberIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory seasonsRequestWithShowIdentifier:withOwnerIdentifier:](VUIMediaAPIRequestFactory, "seasonsRequestWithShowIdentifier:withOwnerIdentifier:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v8);
  -[VUIFamilySharingMediaEntitiesDataSource setShouldCoalesceEpisodesToSeasons:](v9, "setShouldCoalesceEpisodesToSeasons:", 1);

  return v9;
}

+ (id)episodesDataSourceForShowIdentifier:(id)a3 withFamilyMember:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  VUIFamilySharingMediaEntitiesDataSource *v9;

  v5 = a3;
  objc_msgSend(a4, "memberIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory episodesRequestWithShowIdentifier:withOwnerIdentifier:](VUIMediaAPIRequestFactory, "episodesRequestWithShowIdentifier:withOwnerIdentifier:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v8);
  -[VUIFamilySharingMediaEntitiesDataSource setShouldGroupBySeason:](v9, "setShouldGroupBySeason:", 1);
  -[VUIFamilySharingMediaEntitiesDataSource setOrderEpisodesByEpisodeNumber:](v9, "setOrderEpisodesByEpisodeNumber:", 1);

  return v9;
}

+ (id)seasonsDataSourceForSeasonIdentifier:(id)a3 showIdentifier:(id)a4 withFamilyMember:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  VUIFamilySharingMediaEntitiesDataSource *v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a5, "memberIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory seasonsRequestWithShowIdentifier:withOwnerIdentifier:](VUIMediaAPIRequestFactory, "seasonsRequestWithShowIdentifier:withOwnerIdentifier:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v11);
  -[VUIFamilySharingMediaEntitiesDataSource setShouldCoalesceEpisodesToSeasons:](v12, "setShouldCoalesceEpisodesToSeasons:", 1);
  -[VUIFamilySharingMediaEntitiesDataSource setSeasonIdentifierFilter:](v12, "setSeasonIdentifierFilter:", v8);

  return v12;
}

+ (id)episodesDataSourceForSeasonIdentifier:(id)a3 showIdentifier:(id)a4 withFamilyMember:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  VUIFamilySharingMediaEntitiesDataSource *v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a5, "memberIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory episodesRequestWithShowIdentifier:withOwnerIdentifier:](VUIMediaAPIRequestFactory, "episodesRequestWithShowIdentifier:withOwnerIdentifier:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v11);
  -[VUIFamilySharingMediaEntitiesDataSource setShouldGroupBySeason:](v12, "setShouldGroupBySeason:", 1);
  -[VUIFamilySharingMediaEntitiesDataSource setOrderEpisodesByEpisodeNumber:](v12, "setOrderEpisodesByEpisodeNumber:", 1);
  -[VUIFamilySharingMediaEntitiesDataSource setSeasonIdentifierFilter:](v12, "setSeasonIdentifierFilter:", v8);

  return v12;
}

+ (id)dataSourceForCategoryType:(int64_t)a3 withFamilyMember:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (a4)
  {
    objc_msgSend(a4, "memberIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIMediaEntitiesDataSourceFactory dataSourceForCategoryType:withLibrary:withOwnerIdentifier:](VUIMediaEntitiesDataSourceFactory, "dataSourceForCategoryType:withLibrary:withOwnerIdentifier:", a3, 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)dataSourceForGenre:(id)a3 withFamilyMember:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  VUIFamilySharingMediaEntitiesDataSource *v9;

  v5 = a3;
  objc_msgSend(a4, "memberIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaAPIRequestFactory genresRequestForVUIFamilySharingGenre:withOwnerIdentifier:](VUIMediaAPIRequestFactory, "genresRequestForVUIFamilySharingGenre:withOwnerIdentifier:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VUIFamilySharingMediaEntitiesDataSource initWithNSURLRequest:]([VUIFamilySharingMediaEntitiesDataSource alloc], "initWithNSURLRequest:", v8);
  -[VUIFamilySharingMediaEntitiesDataSource setShouldCoalesceEpisodesToShows:](v9, "setShouldCoalesceEpisodesToShows:", 1);

  return v9;
}

+ (id)dataSourceForGenre:(id)a3 withLibrary:(id)a4
{
  id v5;
  void *v6;
  VUIMPMediaEntitiesDataSource *v7;

  v5 = a4;
  +[VUIMediaEntitiesDataSourceFactory _fetchRequestForGenre:](VUIMediaEntitiesDataSourceFactory, "_fetchRequestForGenre:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIMPMediaEntitiesDataSource initWithMediaLibrary:fetchRequest:]([VUIMPMediaEntitiesDataSource alloc], "initWithMediaLibrary:fetchRequest:", v5, v6);

  return v7;
}

+ (id)_fetchRequestForGenre:(id)a3
{
  id v3;
  VUIMediaEntityFetchRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIMediaEntityFetchRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [VUIMediaEntityFetchRequest alloc];
  v5 = (void *)MEMORY[0x1E0C99E60];
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:](v4, "initWithMediaEntityTypes:", v8);

  VUIMediaEntityFetchRequestMinimalPropertiesSet();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setProperties:](v9, "setProperties:", v10);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setSortDescriptors:](v9, "setSortDescriptors:", v12);

  objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("genreTitle"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMediaEntityFetchRequest setPredicate:](v9, "setPredicate:", v13);
  return v9;
}

+ (id)dataSourceForShelf:(int64_t)a3 withFamilyMember:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "memberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaEntitiesDataSourceFactory _dataSourceForShelfType:withLibrary:withOwnerIdentifier:](VUIMediaEntitiesDataSourceFactory, "_dataSourceForShelfType:withLibrary:withOwnerIdentifier:", a3, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
