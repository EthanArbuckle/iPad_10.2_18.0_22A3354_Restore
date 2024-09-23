@implementation PXContentFilterState

+ (id)defaultFilterStateForPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "defaultFilterStateForContainerCollection:photoLibrary:", 0, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PXContentFilterState photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithPhotoLibrary:", v5);

  objc_msgSend(v6, "setIncludeScreenshots:", -[PXContentFilterState includeScreenshots](self, "includeScreenshots"));
  objc_msgSend(v6, "setIncludeSharedWithYou:", -[PXContentFilterState includeSharedWithYou](self, "includeSharedWithYou"));
  objc_msgSend(v6, "setSaved:", -[PXContentFilterState saved](self, "saved"));
  objc_msgSend(v6, "setUnsaved:", -[PXContentFilterState unsaved](self, "unsaved"));
  objc_msgSend(v6, "setFavorite:", -[PXContentFilterState favorite](self, "favorite"));
  objc_msgSend(v6, "setEdited:", -[PXContentFilterState edited](self, "edited"));
  objc_msgSend(v6, "setImage:", -[PXContentFilterState image](self, "image"));
  objc_msgSend(v6, "setVideo:", -[PXContentFilterState video](self, "video"));
  objc_msgSend(v6, "setLive:", -[PXContentFilterState live](self, "live"));
  objc_msgSend(v6, "setPortrait:", -[PXContentFilterState portrait](self, "portrait"));
  objc_msgSend(v6, "setShowOnlyScreenshots:", -[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots"));
  objc_msgSend(v6, "setShowOnlySharedWithYou:", -[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou"));
  -[PXContentFilterState keywords](self, "keywords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeywords:", v7);

  -[PXContentFilterState uuids](self, "uuids");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuids:", v8);

  objc_msgSend(v6, "setShowOnlySentICloudLinks:", -[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks"));
  objc_msgSend(v6, "setShowOnlyReceivedICloudLinks:", -[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks"));
  objc_msgSend(v6, "setIncludeOthersInSocialGroupAssets:", -[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PXContentFilterState *v4;
  PXContentFilterState *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  int v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  void *v29;

  v4 = (PXContentFilterState *)a3;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v18) = 0;
    goto LABEL_19;
  }
  v5 = v4;
  v6 = -[PXContentFilterState includeScreenshots](self, "includeScreenshots");
  if (v6 == -[PXContentFilterState includeScreenshots](v5, "includeScreenshots"))
  {
    v7 = -[PXContentFilterState includeSharedWithYou](self, "includeSharedWithYou");
    if (v7 == -[PXContentFilterState includeSharedWithYou](v5, "includeSharedWithYou"))
    {
      v8 = -[PXContentFilterState saved](self, "saved");
      if (v8 == -[PXContentFilterState saved](v5, "saved"))
      {
        v9 = -[PXContentFilterState unsaved](self, "unsaved");
        if (v9 == -[PXContentFilterState unsaved](v5, "unsaved"))
        {
          v10 = -[PXContentFilterState favorite](self, "favorite");
          if (v10 == -[PXContentFilterState favorite](v5, "favorite"))
          {
            v11 = -[PXContentFilterState edited](self, "edited");
            if (v11 == -[PXContentFilterState edited](v5, "edited"))
            {
              v12 = -[PXContentFilterState image](self, "image");
              if (v12 == -[PXContentFilterState image](v5, "image"))
              {
                v13 = -[PXContentFilterState video](self, "video");
                if (v13 == -[PXContentFilterState video](v5, "video"))
                {
                  v14 = -[PXContentFilterState live](self, "live");
                  if (v14 == -[PXContentFilterState live](v5, "live"))
                  {
                    v15 = -[PXContentFilterState portrait](self, "portrait");
                    if (v15 == -[PXContentFilterState portrait](v5, "portrait"))
                    {
                      v16 = -[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots");
                      if (v16 == -[PXContentFilterState showOnlyScreenshots](v5, "showOnlyScreenshots"))
                      {
                        v17 = -[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou");
                        if (v17 == -[PXContentFilterState showOnlySharedWithYou](v5, "showOnlySharedWithYou"))
                        {
                          -[PXContentFilterState keywords](self, "keywords");
                          v20 = (id)objc_claimAutoreleasedReturnValue();
                          -[PXContentFilterState keywords](v5, "keywords");
                          v21 = (id)objc_claimAutoreleasedReturnValue();
                          v29 = v20;
                          if (v20 == v21)
                          {

                          }
                          else
                          {
                            v22 = objc_msgSend(v20, "isEqual:", v21);

                            if (!v22)
                            {
                              LOBYTE(v18) = 0;
LABEL_32:

                              goto LABEL_16;
                            }
                          }
                          -[PXContentFilterState uuids](self, "uuids");
                          v23 = (id)objc_claimAutoreleasedReturnValue();
                          -[PXContentFilterState uuids](v5, "uuids");
                          v24 = (id)objc_claimAutoreleasedReturnValue();
                          if (v23 == v24)
                          {

                          }
                          else
                          {
                            v25 = objc_msgSend(v23, "isEqual:", v24);

                            if (!v25)
                              goto LABEL_30;
                          }
                          v26 = -[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks");
                          if (v26 == -[PXContentFilterState showOnlySentICloudLinks](v5, "showOnlySentICloudLinks"))
                          {
                            v27 = -[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks");
                            if (v27 == -[PXContentFilterState showOnlyReceivedICloudLinks](v5, "showOnlyReceivedICloudLinks"))
                            {
                              v28 = -[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets");
                              v18 = v28 ^ -[PXContentFilterState includeOthersInSocialGroupAssets](v5, "includeOthersInSocialGroupAssets") ^ 1;
                              goto LABEL_31;
                            }
                          }
LABEL_30:
                          LOBYTE(v18) = 0;
LABEL_31:

                          goto LABEL_32;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  LOBYTE(v18) = 0;
LABEL_16:

LABEL_19:
  return v18;
}

- (BOOL)video
{
  return self->_video;
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (BOOL)favorite
{
  return self->_favorite;
}

- (BOOL)edited
{
  return self->_edited;
}

- (BOOL)unsaved
{
  return self->_unsaved;
}

- (BOOL)showOnlySharedWithYou
{
  return self->_showOnlySharedWithYou;
}

- (BOOL)showOnlySentICloudLinks
{
  return self->_showOnlySentICloudLinks;
}

- (BOOL)showOnlyReceivedICloudLinks
{
  return self->_showOnlyReceivedICloudLinks;
}

- (BOOL)saved
{
  return self->_saved;
}

- (BOOL)includeSharedWithYou
{
  return self->_includeSharedWithYou;
}

+ (id)defaultFilterStateForContainerCollection:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PXContentFilterState *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXContentFilterState initWithPhotoLibrary:]([PXContentFilterState alloc], "initWithPhotoLibrary:", v6);

  if ((objc_msgSend(v5, "px_isAllPhotosSmartAlbum") & 1) != 0)
  {
    objc_msgSend(v7, "includeScreenshots");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentFilterState setIncludeScreenshots:](v8, "setIncludeScreenshots:", objc_msgSend(v9, "BOOLValue"));

  }
  else
  {
    -[PXContentFilterState setIncludeScreenshots:](v8, "setIncludeScreenshots:", 1);
  }
  if (objc_msgSend(v5, "px_isContentSyndicationAlbum"))
  {
    -[PXContentFilterState setIncludeSharedWithYou:](v8, "setIncludeSharedWithYou:", 1);
  }
  else
  {
    objc_msgSend(v7, "includeSharedWithYou");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXContentFilterState setIncludeSharedWithYou:](v8, "setIncludeSharedWithYou:", objc_msgSend(v10, "BOOLValue"));

  }
  return v8;
}

- (void)setIncludeSharedWithYou:(BOOL)a3
{
  self->_includeSharedWithYou = a3;
}

- (PXContentFilterState)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXContentFilterState *v6;
  PXContentFilterState *v7;
  uint64_t v8;
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXContentFilterState;
  v6 = -[PXContentFilterState init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    if (v5)
    {
      +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v7->_photoLibrary);
      v8 = objc_claimAutoreleasedReturnValue();
      contentSyndicationConfigurationProvider = v7->_contentSyndicationConfigurationProvider;
      v7->_contentSyndicationConfigurationProvider = (PXContentSyndicationConfigurationProvider *)v8;

    }
  }

  return v7;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (void)setUuids:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setUnsaved:(BOOL)a3
{
  self->_unsaved = a3;
}

- (void)setShowOnlySharedWithYou:(BOOL)a3
{
  self->_showOnlySharedWithYou = a3;
}

- (void)setShowOnlySentICloudLinks:(BOOL)a3
{
  self->_showOnlySentICloudLinks = a3;
}

- (void)setShowOnlyReceivedICloudLinks:(BOOL)a3
{
  self->_showOnlyReceivedICloudLinks = a3;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setImage:(BOOL)a3
{
  self->_image = a3;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (void)setEdited:(BOOL)a3
{
  self->_edited = a3;
}

- (id)predicateForUseCase:(unint64_t)a3
{
  id v5;
  void *v6;
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[5];
  id v53;
  _BYTE v54[128];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!-[PXContentFilterState includeScreenshots](self, "includeScreenshots"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == NO"), CFSTR("isDetectedScreenshot"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  if (!contentSyndicationConfigurationProvider
    || !-[PXContentSyndicationConfigurationProvider contentSyndicationIsAvailable](contentSyndicationConfigurationProvider, "contentSyndicationIsAvailable"))
  {
    goto LABEL_18;
  }
  if (-[PXContentFilterState includeSharedWithYou](self, "includeSharedWithYou"))
  {
    if (!-[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou"))
      goto LABEL_10;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __44__PXContentFilterState_predicateForUseCase___block_invoke;
    v52[3] = &unk_1E511C2A8;
    v52[4] = self;
    v53 = v5;
    -[PXContentFilterState _checkDataSourceType:](self, "_checkDataSourceType:", v52);
    v8 = v53;
  }
  else
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __44__PXContentFilterState_predicateForUseCase___block_invoke_2;
    v50[3] = &unk_1E511C2D0;
    v51 = v5;
    -[PXContentFilterState _checkDataSourceType:](self, "_checkDataSourceType:", v50);
    v8 = v51;
  }

LABEL_10:
  if (-[PXContentFilterState saved](self, "saved") && -[PXContentFilterState unsaved](self, "unsaved"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(syndicationState & %d) != 0 OR (syndicationState & %d) == 0"), 2, 2);
  }
  else if (-[PXContentFilterState saved](self, "saved"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(syndicationState & %d) != 0"), 2, v45);
  }
  else
  {
    if (!-[PXContentFilterState unsaved](self, "unsaved"))
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(syndicationState & %d) == 0"), 2, v45);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

LABEL_18:
  if (-[PXContentFilterState favorite](self, "favorite"))
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(favorite) == YES"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

      if (!-[PXContentFilterState edited](self, "edited"))
        goto LABEL_28;
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("favorite == YES"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  if (-[PXContentFilterState edited](self, "edited"))
  {
    if (a3 != 1)
    {
      objc_msgSend(MEMORY[0x1E0D71880], "predicateForAdjustedAssetsWithKeyPathToAsset:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) > %d"), CFSTR("adjustmentsState"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_27:
    v13 = (void *)v12;
    objc_msgSend(v5, "addObject:", v12);

  }
LABEL_28:
  if (!-[PXContentFilterState image](self, "image")
    && !-[PXContentFilterState video](self, "video")
    && !-[PXContentFilterState live](self, "live")
    && !-[PXContentFilterState portrait](self, "portrait"))
  {
    v25 = 0;
    v27 = 0;
    if (!-[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots"))
      goto LABEL_63;
    goto LABEL_55;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PXContentFilterState image](self, "image"))
  {
    if (a3 == 1)
    {
      v15 = CFSTR("noindex:(kind) == %d");
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(kind) == %d"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

      if (!-[PXContentFilterState video](self, "video"))
      {
        if (-[PXContentFilterState live](self, "live"))
        {
          v17 = (void *)MEMORY[0x1E0CB3880];
LABEL_45:
          objc_msgSend(v17, "predicateWithFormat:", CFSTR("noindex:(kindSubtype) == %d"), 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          if (!-[PXContentFilterState portrait](self, "portrait"))
            goto LABEL_53;
          v21 = CFSTR("noindex:(%K & %d) != 0");
          goto LABEL_52;
        }
        goto LABEL_48;
      }
      goto LABEL_42;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  if (!-[PXContentFilterState video](self, "video"))
    goto LABEL_43;
  if (a3 == 1)
    v15 = CFSTR("noindex:(kind) == %d");
  else
    v15 = CFSTR("kind == %d");
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v15, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v19);

LABEL_43:
  if (-[PXContentFilterState live](self, "live"))
  {
    v17 = (void *)MEMORY[0x1E0CB3880];
    if (a3 == 1)
      goto LABEL_45;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype == %d"), 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

  }
LABEL_48:
  if (!-[PXContentFilterState portrait](self, "portrait"))
    goto LABEL_53;
  if (a3 == 1)
    v21 = CFSTR("noindex:(%K & %d) != 0");
  else
    v21 = CFSTR("(%K & %d) != 0");
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v21, CFSTR("additionalAttributes.unmanagedAdjustment.adjustmentRenderTypes"), 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v23);

LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v14);
  v24 = objc_claimAutoreleasedReturnValue();

  if (-[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots"))
  {
    v25 = (void *)v24;
LABEL_55:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == YES"), CFSTR("isDetectedScreenshot"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v25 && v26)
    {
      v28 = (void *)MEMORY[0x1E0CB3528];
      v55[0] = v25;
      v55[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "andPredicateWithSubpredicates:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v30);
      goto LABEL_63;
    }
    if (v25)
    {
      v24 = (uint64_t)v25;
      goto LABEL_62;
    }
    if (v26)
      objc_msgSend(v5, "addObject:", v26);
    v25 = 0;
    goto LABEL_63;
  }
  v27 = 0;
  v25 = 0;
  if (v24)
  {
LABEL_62:
    objc_msgSend(v5, "addObject:", v24);
    v25 = (void *)v24;
  }
LABEL_63:
  -[PXContentFilterState uuids](self, "uuids");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)MEMORY[0x1E0CB3880];
    -[PXContentFilterState uuids](self, "uuids");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "predicateWithFormat:", CFSTR("uuid in %@"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v34);

  }
  -[PXContentFilterState keywords](self, "keywords");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("packedBadgeAttributes&0x01 == 1"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v36);

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[PXContentFilterState keywords](self, "keywords");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v47 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN additionalAttributes.keywords.title"), *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v39);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (BOOL)image
{
  return self->_image;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuids, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
}

- (PXContentFilterState)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentFilterState.m"), 39, CFSTR("%s is not available as initializer"), "-[PXContentFilterState init]");

  abort();
}

- (int64_t)ruleCount
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  LODWORD(v3) = -[PXContentFilterState saved](self, "saved");
  v4 = -[PXContentFilterState unsaved](self, "unsaved");
  v5 = 1;
  if ((_DWORD)v3)
    v5 = 2;
  if (v4)
    v3 = v5;
  else
    v3 = v3;
  v6 = v3 + -[PXContentFilterState favorite](self, "favorite");
  v7 = v6 + -[PXContentFilterState edited](self, "edited");
  v8 = v7 + -[PXContentFilterState image](self, "image");
  v9 = v8 + -[PXContentFilterState video](self, "video");
  v10 = v9 + -[PXContentFilterState live](self, "live");
  v11 = v10 + -[PXContentFilterState portrait](self, "portrait");
  v12 = v11 + -[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots");
  v13 = v12 + -[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou");
  -[PXContentFilterState keywords](self, "keywords");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  -[PXContentFilterState uuids](self, "uuids");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 + v15 + objc_msgSend(v16, "count");

  v18 = v17 + -[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks");
  v19 = v18 + -[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks");
  return v19 + -[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets");
}

- (BOOL)hasRules
{
  return -[PXContentFilterState ruleCount](self, "ruleCount") > 0;
}

- (BOOL)isContentFilterActive:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL result;

  v5 = 0;
  switch(a3)
  {
    case 1:
      v5 = -[PXContentFilterState hash](self, "hash", v3, v4) == 0;
      goto LABEL_3;
    case 2:
      result = -[PXContentFilterState includeScreenshots](self, "includeScreenshots");
      break;
    case 3:
      result = -[PXContentFilterState includeSharedWithYou](self, "includeSharedWithYou");
      break;
    case 4:
      result = -[PXContentFilterState saved](self, "saved");
      break;
    case 5:
      result = -[PXContentFilterState unsaved](self, "unsaved");
      break;
    case 7:
      result = -[PXContentFilterState image](self, "image");
      break;
    case 8:
      result = -[PXContentFilterState video](self, "video");
      break;
    case 9:
      result = -[PXContentFilterState edited](self, "edited");
      break;
    case 10:
      result = -[PXContentFilterState favorite](self, "favorite");
      break;
    case 11:
      result = -[PXContentFilterState live](self, "live");
      break;
    case 12:
      result = -[PXContentFilterState portrait](self, "portrait");
      break;
    case 13:
      result = -[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots");
      break;
    case 14:
      result = -[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou");
      break;
    case 18:
      result = -[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks");
      break;
    case 19:
      result = -[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks");
      break;
    case 20:
      result = -[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets");
      break;
    default:
LABEL_3:
      result = v5;
      break;
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PXContentSyndicationConfigurationProvider contentSyndicationIsAvailable](self->_contentSyndicationConfigurationProvider, "contentSyndicationIsAvailable"))
  {
    if (-[PXContentFilterState includeSharedWithYou](self, "includeSharedWithYou"))
      objc_msgSend(v3, "addObject:", CFSTR("include items shared with you"));
    if (-[PXContentFilterState saved](self, "saved"))
      objc_msgSend(v3, "addObject:", CFSTR("saved items"));
    if (-[PXContentFilterState unsaved](self, "unsaved"))
      objc_msgSend(v3, "addObject:", CFSTR("unsaved items"));
    if (-[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou"))
      objc_msgSend(v3, "addObject:", CFSTR("sharedWithYou"));
  }
  if (-[PXContentFilterState includeScreenshots](self, "includeScreenshots"))
    objc_msgSend(v3, "addObject:", CFSTR("include screenshots"));
  if (-[PXContentFilterState favorite](self, "favorite"))
    objc_msgSend(v3, "addObject:", CFSTR("favorited"));
  if (-[PXContentFilterState edited](self, "edited"))
    objc_msgSend(v3, "addObject:", CFSTR("edited"));
  if (-[PXContentFilterState image](self, "image"))
    objc_msgSend(v3, "addObject:", CFSTR("image"));
  if (-[PXContentFilterState video](self, "video"))
    objc_msgSend(v3, "addObject:", CFSTR("video"));
  if (-[PXContentFilterState live](self, "live"))
    objc_msgSend(v3, "addObject:", CFSTR("live"));
  if (-[PXContentFilterState portrait](self, "portrait"))
    objc_msgSend(v3, "addObject:", CFSTR("portrait"));
  if (-[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots"))
    objc_msgSend(v3, "addObject:", CFSTR("screenshot"));
  -[PXContentFilterState keywords](self, "keywords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[PXContentFilterState keywords](self, "keywords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("keywords: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[PXContentFilterState uuids](self, "uuids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PXContentFilterState uuids](self, "uuids");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("uuids: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  if (-[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks"))
    objc_msgSend(v3, "addObject:", CFSTR("showOnlySentICloudLinks"));
  if (-[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks"))
    objc_msgSend(v3, "addObject:", CFSTR("showOnlyReceivedICloudLinks"));
  if (-[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets"))
    objc_msgSend(v3, "addObject:", CFSTR("includeOthersInSocialGroupAssets"));
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: filter criteria: [%@]>"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;

  v3 = -[PXContentFilterState saved](self, "saved");
  v4 = -[PXContentFilterState unsaved](self, "unsaved");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[PXContentFilterState favorite](self, "favorite"))
    v7 = 4;
  else
    v7 = 0;
  v8 = -[PXContentFilterState edited](self, "edited");
  v9 = 8;
  if (!v8)
    v9 = 0;
  v10 = v6 | v7 | v9;
  if (-[PXContentFilterState image](self, "image"))
    v11 = 16;
  else
    v11 = 0;
  v12 = -[PXContentFilterState video](self, "video");
  v13 = 32;
  if (!v12)
    v13 = 0;
  v14 = v11 | v13;
  v15 = -[PXContentFilterState live](self, "live");
  v16 = 64;
  if (!v15)
    v16 = 0;
  v17 = v10 | v14 | v16;
  if (-[PXContentFilterState portrait](self, "portrait"))
    v18 = 128;
  else
    v18 = 0;
  v19 = -[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots");
  v20 = 256;
  if (!v19)
    v20 = 0;
  v21 = v18 ^ v20;
  v22 = -[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou");
  v23 = 512;
  if (!v22)
    v23 = 0;
  v24 = v17 ^ v21 ^ v23;
  -[PXContentFilterState keywords](self, "keywords");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24 ^ (objc_msgSend(v25, "hash") << 10);

  -[PXContentFilterState uuids](self, "uuids");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26 ^ (objc_msgSend(v27, "hash") << 11);

  if (-[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks"))
    v29 = 4096;
  else
    v29 = 0;
  v30 = -[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks");
  v31 = 0x2000;
  if (!v30)
    v31 = 0;
  v32 = v29 ^ v31;
  v33 = -[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets");
  v34 = 0x4000;
  if (!v33)
    v34 = 0;
  return v28 ^ v32 ^ v34;
}

- (void)_checkDataSourceType:(id)a3
{
  void (**v4)(id, _QWORD);
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  if (contentSyndicationConfigurationProvider)
  {
    v9 = v4;
    v6 = -[PXContentSyndicationConfigurationProvider dataSourceType](contentSyndicationConfigurationProvider, "dataSourceType");
    v4 = v9;
    if ((unint64_t)(v6 - 5) <= 0xFFFFFFFFFFFFFFFCLL)
    {
      v7 = 0;
      switch(v6)
      {
        case 0:
        case 1:
        case 5:
          v8 = objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset", v9);
          goto LABEL_7;
        case 6:
          v8 = objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset", v9);
          goto LABEL_7;
        case 7:
          v8 = objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset", v9);
LABEL_7:
          v4 = v9;
          v7 = v8;
          break;
        default:
          break;
      }
      if (v4)
      {
        v4[2](v4, v7);
        v4 = v9;
      }
    }
  }

}

- (NSString)localizedDescription
{
  int64_t v3;
  __CFString *v4;
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;
  uint64_t v6;
  __CFString *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[PXContentFilterState ruleCount](self, "ruleCount");
  if (v3 != 1)
  {
    if (v3)
      v4 = CFSTR("PXContentFilterTitleFilteringMany");
    else
      v4 = CFSTR("PXContentFilterTitleFilteringOff");
    goto LABEL_27;
  }
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  if (contentSyndicationConfigurationProvider
    && -[PXContentSyndicationConfigurationProvider contentSyndicationIsAvailable](contentSyndicationConfigurationProvider, "contentSyndicationIsAvailable"))
  {
    if (-[PXContentFilterState saved](self, "saved"))
    {
      v4 = CFSTR("PXContentFilterMenu_SavedItemsOnly");
      goto LABEL_27;
    }
    if (-[PXContentFilterState unsaved](self, "unsaved"))
    {
      v4 = CFSTR("PXContentFilterMenu_UnsavedItemsOnly");
      goto LABEL_27;
    }
  }
  if (-[PXContentFilterState favorite](self, "favorite"))
  {
    v4 = CFSTR("PXContentFilterMenu_Favorite");
  }
  else if (-[PXContentFilterState edited](self, "edited"))
  {
    v4 = CFSTR("PXContentFilterMenu_Edited");
  }
  else if (-[PXContentFilterState image](self, "image"))
  {
    v4 = CFSTR("PXContentFilterMenu_Photos");
  }
  else if (-[PXContentFilterState video](self, "video"))
  {
    v4 = CFSTR("PXContentFilterMenu_Videos");
  }
  else if (-[PXContentFilterState live](self, "live"))
  {
    v4 = CFSTR("PXContentFilterMenu_Live");
  }
  else if (-[PXContentFilterState portrait](self, "portrait"))
  {
    v4 = CFSTR("PXContentFilterMenu_Portrait");
  }
  else if (-[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots"))
  {
    v4 = CFSTR("PXContentFilterMenu_Screenshots");
  }
  else if (-[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou"))
  {
    v4 = CFSTR("PXContentFilterMenu_SharedWithYou");
  }
  else
  {
    -[PXContentFilterState keywords](self, "keywords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      -[PXContentFilterState keywords](self, "keywords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return (NSString *)v7;
    }
    -[PXContentFilterState uuids](self, "uuids");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
    {
      if (-[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks"))
      {
        v14 = 18;
      }
      else if (-[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks"))
      {
        v14 = 19;
      }
      else
      {
        if (!-[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets"))
        {
          v7 = &stru_1E5149688;
          return (NSString *)v7;
        }
        v14 = 20;
      }
      PXContentFilterTitleForItemTag(v14);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v4 = CFSTR("PXContentFilterMenu_Selected");
  }
LABEL_27:
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_28:
  v7 = (__CFString *)v6;
  return (NSString *)v7;
}

- (NSString)localizedFooterDescription
{
  uint64_t v3;
  void *v4;
  PXContentSyndicationConfigurationProvider *contentSyndicationConfigurationProvider;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = -[PXContentFilterState ruleCount](self, "ruleCount");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
  if (v3 >= 1)
  {
    contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
    if (contentSyndicationConfigurationProvider
      && -[PXContentSyndicationConfigurationProvider contentSyndicationIsAvailable](contentSyndicationConfigurationProvider, "contentSyndicationIsAvailable"))
    {
      if (-[PXContentFilterState saved](self, "saved"))
      {
        PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_SavedItemsOnly"), CFSTR("PhotosUICore"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

      }
      if (-[PXContentFilterState unsaved](self, "unsaved"))
      {
        PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_UnsavedItemsOnly"), CFSTR("PhotosUICore"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v7);

      }
    }
    if (-[PXContentFilterState favorite](self, "favorite"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Favorite"), CFSTR("PhotosUICore"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    if (-[PXContentFilterState edited](self, "edited"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Edited"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

    }
    if (-[PXContentFilterState image](self, "image"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Photos"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
    if (-[PXContentFilterState video](self, "video"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Videos"), CFSTR("PhotosUICore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v11);

    }
    if (-[PXContentFilterState live](self, "live"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Live"), CFSTR("PhotosUICore"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v12);

    }
    if (-[PXContentFilterState portrait](self, "portrait"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Portrait"), CFSTR("PhotosUICore"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

    }
    if (-[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Screenshots"), CFSTR("PhotosUICore"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

    }
    if (-[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou"))
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_SharedWithYou"), CFSTR("PhotosUICore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

    }
    -[PXContentFilterState keywords](self, "keywords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      -[PXContentFilterState keywords](self, "keywords");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v19);

    }
    -[PXContentFilterState uuids](self, "uuids");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      PXLocalizedStringFromTable(CFSTR("PXContentFilterMenu_Selected"), CFSTR("PhotosUICore"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v22);

    }
    if (-[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks"))
    {
      PXContentFilterTitleForItemTag(18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v23);

    }
    if (-[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks"))
    {
      PXContentFilterTitleForItemTag(19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v24);

    }
    if (-[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets"))
    {
      PXContentFilterTitleForItemTag(20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v25);

    }
  }
  PXLocalizedStringFromTable(CFSTR("PXFilterListSeparator"), CFSTR("PhotosUICore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v27;
}

- (BOOL)live
{
  return self->_live;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

- (BOOL)portrait
{
  return self->_portrait;
}

- (void)setPortrait:(BOOL)a3
{
  self->_portrait = a3;
}

- (BOOL)includeScreenshots
{
  return self->_includeScreenshots;
}

- (void)setIncludeScreenshots:(BOOL)a3
{
  self->_includeScreenshots = a3;
}

- (BOOL)showOnlyScreenshots
{
  return self->_showOnlyScreenshots;
}

- (void)setShowOnlyScreenshots:(BOOL)a3
{
  self->_showOnlyScreenshots = a3;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  self->_includeOthersInSocialGroupAssets = a3;
}

- (PXContentSyndicationConfigurationProvider)contentSyndicationConfigurationProvider
{
  return self->_contentSyndicationConfigurationProvider;
}

void __44__PXContentFilterState_predicateForUseCase___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dataSourceType") & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v4 = (void *)MEMORY[0x1E0D73310];
    v5 = a2;
LABEL_7:
    objc_msgSend(v4, "predicateForIncludeMask:useIndex:", v5, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
    || (+[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "sharedWithYouOnlyFilterIncludesUnsaved"),
        v6,
        !v7))
  {
    v9 = (void *)MEMORY[0x1E0D73310];
    v5 = objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset");
    v4 = v9;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.syndicationIdentifier != nil"));
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = (id)v8;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __44__PXContentFilterState_predicateForUseCase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (id)defaultAllPhotosFilterStateForPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "defaultFilterStateForPhotoLibrary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "includeScreenshots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeScreenshots:", objc_msgSend(v5, "BOOLValue"));

  return v3;
}

@end
