@implementation VUILibraryViewFactory

+ (id)viewControllerForMediaEntity:(id)a3 withFamilyMember:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  __objc2_class **v10;
  VUILibraryMediaCollectionViewController *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
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
  VUILibraryMediaCollectionViewController *v32;
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
  _BOOL8 v43;
  void *v45;
  void *v46;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = off_1E9F96CB8;
    if (v8 != v9)
      v10 = off_1E9F96D68;
    v11 = (VUILibraryMediaCollectionViewController *)objc_msgSend(objc_alloc(*v10), "initWithMediaItem:", v7);
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v5;
    objc_msgSend(v12, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v13)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "userInterfaceIdiom");

      objc_msgSend(v12, "seasonCount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");

      if (v16 || v18 < 2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "amsShowIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntitiesDataSourceFactory seasonsDataSourceForShowIdentifier:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "seasonsDataSourceForShowIdentifier:withFamilyMember:", v24, v6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntitiesDataSourceFactory episodesDataSourceForShowIdentifier:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "episodesDataSourceForShowIdentifier:withFamilyMember:", v24, v6);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v12, "type");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntityType season](VUIMediaEntityType, "season");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntityFetchRequest seasonsFetchRequestWithShowIdentifier:](VUIMediaEntityFetchRequest, "seasonsFetchRequestWithShowIdentifier:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "mediaLibrary");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v36, v37);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45 == v34)
          {
            objc_msgSend(v12, "identifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            +[VUIMediaEntityFetchRequest episodesFetchRequestWithSeasonIdentifier:](VUIMediaEntityFetchRequest, "episodesFetchRequestWithSeasonIdentifier:", v46);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "mediaLibrary");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v41, v42);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "showTitle");
          }
          else
          {
            objc_msgSend(v12, "showIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[VUIMediaEntityFetchRequest episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:](VUIMediaEntityFetchRequest, "episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "mediaLibrary");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v39, v40);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "title");
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v43 = v16 != 0;
        v11 = -[VUILibraryMediaCollectionViewController initWithTitle:withSeasonsDataSource:withEpisodesDataSource:]([VUILibraryMediaCollectionViewController alloc], "initWithTitle:withSeasonsDataSource:withEpisodesDataSource:", v20, v23, v25);
        -[VUILibraryMediaCollectionViewController setCanShowMultipleSeasons:](v11, "setCanShowMultipleSeasons:", v43);
        -[VUILibraryMediaCollectionViewController setMediaCollection:](v11, "setMediaCollection:", v12);

      }
      else
      {
        if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v12, "amsShowIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntitiesDataSourceFactory seasonsDataSourceForShowIdentifier:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "seasonsDataSourceForShowIdentifier:withFamilyMember:", v19, v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntityFetchRequest seasonsFetchRequestWithShowIdentifier:](VUIMediaEntityFetchRequest, "seasonsFetchRequestWithShowIdentifier:", v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "mediaLibrary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v19, v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v11 = -[VUISeasonPickerViewController initWithDataSource:]([VUISeasonPickerViewController alloc], "initWithDataSource:", v20);
        objc_msgSend(v12, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUILibraryMediaCollectionViewController setTitle:](v11, "setTitle:", v23);
      }
    }
    else
    {
      +[VUIMediaEntityType season](VUIMediaEntityType, "season");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v14)
      {
        v11 = 0;
LABEL_29:

        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "amsShowIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "amsSeasonIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory seasonsDataSourceForSeasonIdentifier:showIdentifier:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "seasonsDataSourceForSeasonIdentifier:showIdentifier:withFamilyMember:", v22, v21, v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory episodesDataSourceForSeasonIdentifier:showIdentifier:withFamilyMember:](VUIMediaEntitiesDataSourceFactory, "episodesDataSourceForSeasonIdentifier:showIdentifier:withFamilyMember:", v22, v21, v6);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v12, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntityFetchRequest seasonsFetchRequestWithSeasonIdentifier:](VUIMediaEntityFetchRequest, "seasonsFetchRequestWithSeasonIdentifier:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaLibrary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v29, v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntityFetchRequest episodesFetchRequestWithSeasonIdentifier:](VUIMediaEntityFetchRequest, "episodesFetchRequestWithSeasonIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mediaLibrary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntitiesDataSourceFactory dataSourceForFetchRequest:withLibrary:](VUIMediaEntitiesDataSourceFactory, "dataSourceForFetchRequest:withLibrary:", v22, v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v32 = [VUILibraryMediaCollectionViewController alloc];
      objc_msgSend(v12, "showTitle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[VUILibraryMediaCollectionViewController initWithTitle:withSeasonsDataSource:withEpisodesDataSource:](v32, "initWithTitle:withSeasonsDataSource:withEpisodesDataSource:", v33, v20, v23);

      -[VUILibraryMediaCollectionViewController setCanShowMultipleSeasons:](v11, "setCanShowMultipleSeasons:", 0);
      -[VUILibraryMediaCollectionViewController setMediaCollection:](v11, "setMediaCollection:", v12);
    }

    goto LABEL_29;
  }
  v11 = 0;
LABEL_30:

  return v11;
}

+ (id)viewControllerForMediaEntity:(id)a3
{
  return +[VUILibraryViewFactory viewControllerForMediaEntity:withFamilyMember:](VUILibraryViewFactory, "viewControllerForMediaEntity:withFamilyMember:", a3, 0);
}

+ (id)moviePlaceholderImage
{
  if (moviePlaceholderImage_onceToken != -1)
    dispatch_once(&moviePlaceholderImage_onceToken, &__block_literal_global_134);
  return (id)moviePlaceholderImage_moviePlaceholder;
}

void __46__VUILibraryViewFactory_moviePlaceholderImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", CFSTR("PreloadAsset-Movie"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)moviePlaceholderImage_moviePlaceholder;
  moviePlaceholderImage_moviePlaceholder = v0;

}

+ (id)tvPlaceholderImage
{
  if (tvPlaceholderImage_onceToken != -1)
    dispatch_once(&tvPlaceholderImage_onceToken, &__block_literal_global_16_3);
  return (id)tvPlaceholderImage_tvPlaceholder;
}

void __43__VUILibraryViewFactory_tvPlaceholderImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", CFSTR("PreloadAsset-TV"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tvPlaceholderImage_tvPlaceholder;
  tvPlaceholderImage_tvPlaceholder = v0;

}

@end
