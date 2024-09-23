@implementation BKDeleteActionItemsProvider

- (BKDeleteActionItemsProvider)initWithBooks:(id)a3 currentCollectionId:(id)a4
{
  id v7;
  id v8;
  BKDeleteActionItemsProvider *v9;
  BKDeleteActionItemsProvider *v10;
  NSString *v11;
  NSString *collectionId;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKDeleteActionItemsProvider;
  v9 = -[BKDeleteActionItemsProvider init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_booksToDelete, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    collectionId = v10->_collectionId;
    v10->_collectionId = v11;

    -[BKDeleteActionItemsProvider computeCounts](v10, "computeCounts");
  }

  return v10;
}

- (void)computeCounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  void *i;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  unsigned int v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  BKDeleteActionItemsProvider *v38;
  char *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  id obj;
  char v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unsigned int v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v62 = objc_msgSend(v3, "isUserSignedInToiCloud");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeStoreAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_DSID"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider booksToDelete](self, "booksToDelete"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v7, "count")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collectionId](self, "collectionId"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v38 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider booksToDelete](self, "booksToDelete"));
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v63)
  {
    v53 = 0;
    v54 = 0;
    v59 = 0;
    v60 = 0;
    v9 = 0;
    v48 = 0;
    v49 = 0;
    v44 = 0;
    v45 = 0;
    v42 = 0;
    v43 = 0;
    v51 = 0;
    v52 = 0;
    v58 = 0;
    v10 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v56 = 0;
    v39 = 0;
    v50 = 0;
    v61 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v61)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "isInSamples");
        if (objc_msgSend(v12, "iTunesU"))
        {
          if (objc_msgSend(v12, "isLocal"))
            ++v55;
          else
            v56 += objc_msgSend(v12, "isCloud");
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID"));
          v15 = objc_msgSend(v14, "longLongValue");

          if (v15)
          {
            if (objc_msgSend(v12, "isCloud"))
            {
              ++v50;
            }
            else if (((objc_msgSend(v12, "isStoreItem") ^ 1 | v13) & 1) != 0)
            {
              if (objc_msgSend(v12, "isDownloading"))
              {
                ++v46;
              }
              else if (objc_msgSend(v12, "isSample"))
              {
                ++v45;
              }
              else if (objc_msgSend(v12, "isNonLocalSample"))
              {
                ++v44;
              }
              else if (objc_msgSend(v12, "isSeriesItem"))
              {
                ++v43;
              }
              else if (objc_msgSend(v12, "isContainer"))
              {
                ++v42;
              }
              else
              {
                if (v41 && objc_msgSend(v12, "isBook"))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider _assetPurchasedDSIDForLibraryAsset:](v38, "_assetPurchasedDSIDForLibraryAsset:", v12));
                  v39 += objc_msgSend(v16, "isEqualToString:", v41);

                }
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID"));
                objc_msgSend(v40, "addObject:", v17);

              }
            }
            else
            {
              ++v49;
            }
          }
          else
          {
            ++v54;
            if (objc_msgSend(v12, "canRedownload"))
            {
              if (objc_msgSend(v12, "isLocal"))
                ++v47;
              else
                v48 += objc_msgSend(v12, "isCloud");
            }
          }
        }
        if (objc_msgSend(v12, "isAudiobook"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID"));
          v19 = objc_msgSend(v18, "longLongValue");

          if (v19)
          {
            if (objc_msgSend(v12, "isCloud"))
              ++v52;
            else
              v51 += objc_msgSend(v12, "isLocal");
          }
          else
          {
            ++v53;
          }
        }
        if (v62)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "permanentOrTemporaryAssetID"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "statusForAssetID:", v21));

          if (v22)
          {
            v23 = (char *)objc_msgSend(v22, "state");
            v24 = v59;
            if (v23 == (_BYTE *)&dword_8 + 2)
              v24 = v59 + 1;
            v59 = v24;
          }

        }
        if (objc_msgSend(v12, "contentType") == 3)
          ++v9;
        if (objc_msgSend(v12, "isTrackedAsRecent")
          && (!objc_msgSend(v12, "isStoreItem")
           || (objc_msgSend(v12, "isAudiobook") & 1) == 0))
        {
          ++v60;
        }
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionMembers"));
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v26)
        {
          v27 = v26;
          v64 = i;
          v28 = v13;
          v29 = v10;
          v30 = v9;
          v31 = *(_QWORD *)v66;
          while (2)
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(_QWORD *)v66 != v31)
                objc_enumerationMutation(v25);
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1)
                                                                                 + 8 * (_QWORD)j), "collection"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "collectionID"));

              if (v34
                && (objc_msgSend(v8, "isEqualToString:", v34) & 1) == 0
                && +[BKCollection allowsManualAdditionToCollectionWithID:](BKCollection, "allowsManualAdditionToCollectionWithID:", v34))
              {

                v58 = 1;
                goto LABEL_63;
              }

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            if (v27)
              continue;
            break;
          }
LABEL_63:
          v9 = v30;
          v10 = v29;
          v13 = v28;
          i = v64;
        }
        v10 |= v13;

      }
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v63);
  }
  else
  {
    v53 = 0;
    v54 = 0;
    v59 = 0;
    v60 = 0;
    v9 = 0;
    v48 = 0;
    v49 = 0;
    v44 = 0;
    v45 = 0;
    v42 = 0;
    v43 = 0;
    v51 = 0;
    v52 = 0;
    v58 = 0;
    LOBYTE(v10) = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v56 = 0;
    v39 = 0;
    v50 = 0;
  }

  if (objc_msgSend(v40, "count"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "assetIDsInDataSourceWithIdentifier:intersectingWithAssetIDs:", CFSTR("com.apple.ibooks.datasource.jalisco.purchases"), v40));

    v37 = v39;
    if (objc_msgSend(v36, "count"))
      v37 = objc_msgSend(v36, "count");

  }
  else
  {
    v37 = v39;
  }
  v38->_ghostBookCount = v50;
  v38->_localJaliscoBooksOnlyCount = (unint64_t)v37;
  v38->_localUbiquityCount = v47;
  v38->_nonlocalUbiquityCount = v48;
  v38->_localiTunesUCount = v55;
  v38->_nonlocaliTunesUCount = v56;
  v38->_downloadingCount = v46;
  v38->_localITSAudiobookCount = v51;
  v38->_cloudITSAudiobookCount = v52;
  v38->_nonStoreAudiobookCount = v53;
  v38->_ubiquityErrorCount = v59;
  v38->_pdfCount = v9;
  v38->_storeItemCount = v49;
  v38->_localSampleCount = v45;
  v38->_nonLocalSampleCount = v44;
  v38->_recentBooksCount = v60;
  v38->_memberOfOtherManualCollection = v58 & 1;
  v38->_memberOfSampleCollection = v10 & 1;
  v38->_seriesItemCount = v43;
  v38->_seriesStackCount = v42;
  v38->_sideloadedItemCount = v54;

}

- (unint64_t)ubiquityCount
{
  unint64_t v3;

  v3 = -[BKDeleteActionItemsProvider localUbiquityCount](self, "localUbiquityCount");
  return -[BKDeleteActionItemsProvider nonlocalUbiquityCount](self, "nonlocalUbiquityCount") + v3;
}

- (unint64_t)iTunesUCount
{
  unint64_t v3;

  v3 = -[BKDeleteActionItemsProvider localiTunesUCount](self, "localiTunesUCount");
  return -[BKDeleteActionItemsProvider nonlocaliTunesUCount](self, "nonlocaliTunesUCount") + v3;
}

- (int64_t)localOnlyBookCount
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v14;
  _BYTE *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider booksToDelete](self, "booksToDelete"));
  v15 = objc_msgSend(v3, "count");
  v14 = -[BKDeleteActionItemsProvider ghostBookCount](self, "ghostBookCount");
  v4 = -[BKDeleteActionItemsProvider localJaliscoBooksOnlyCount](self, "localJaliscoBooksOnlyCount");
  v5 = -[BKDeleteActionItemsProvider localITSAudiobookCount](self, "localITSAudiobookCount");
  v6 = -[BKDeleteActionItemsProvider ubiquityCount](self, "ubiquityCount");
  v7 = -[BKDeleteActionItemsProvider iTunesUCount](self, "iTunesUCount");
  v8 = -[BKDeleteActionItemsProvider downloadingCount](self, "downloadingCount");
  v9 = -[BKDeleteActionItemsProvider storeItemCount](self, "storeItemCount");
  v10 = -[BKDeleteActionItemsProvider sampleCount](self, "sampleCount");
  v11 = -[BKDeleteActionItemsProvider seriesItemCount](self, "seriesItemCount");
  v12 = v15
      - ((_BYTE *)-[BKDeleteActionItemsProvider seriesStackCount](self, "seriesStackCount")
       + v10
       + v11)
      - (v14
       + v4
       + v5
       + v6
       + v7
       + v8
       + v9);

  return v12;
}

- (unint64_t)sampleCount
{
  unint64_t v3;

  v3 = -[BKDeleteActionItemsProvider localSampleCount](self, "localSampleCount");
  return -[BKDeleteActionItemsProvider nonLocalSampleCount](self, "nonLocalSampleCount") + v3;
}

- (BOOL)canDeleteFromAllDevices
{
  BOOL v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (!-[BKDeleteActionItemsProvider localOnlyBookCount](self, "localOnlyBookCount")
     || -[BKDeleteActionItemsProvider ubiquityCount](self, "ubiquityCount")
     || -[BKDeleteActionItemsProvider iTunesUCount](self, "iTunesUCount"))
    && !-[BKDeleteActionItemsProvider ghostBookCount](self, "ghostBookCount")
    && !-[BKDeleteActionItemsProvider localJaliscoBooksOnlyCount](self, "localJaliscoBooksOnlyCount")
    && !-[BKDeleteActionItemsProvider localITSAudiobookCount](self, "localITSAudiobookCount")
    && -[BKDeleteActionItemsProvider seriesStackCount](self, "seriesStackCount") == 0;
  if (!-[BKDeleteActionItemsProvider ubiquityCount](self, "ubiquityCount")
    && !-[BKDeleteActionItemsProvider iTunesUCount](self, "iTunesUCount"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collectionId](self, "collectionId"));
    if (objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultAll))
    {

      return 0;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collection](self, "collection"));
    v6 = objc_msgSend(v5, "isSeriesCollection");

    if (v6)
      return 0;
  }
  return v3;
}

- (BOOL)canRemoveFromCollection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collection](self, "collection"));
  v3 = objc_msgSend(v2, "deleteRemovesFromCollection");

  return v3;
}

- (BKCollection)collection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collectionId](self, "collectionId"));

  if (v3)
  {
    v4 = objc_opt_class(BKCollection);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collectionId](self, "collectionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionOnMainQueueWithCollectionID:error:", v7, 0));
    v9 = BUDynamicCast(v4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
  else
  {
    v10 = 0;
  }
  return (BKCollection *)v10;
}

- (NSArray)actionItems
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v4 = objc_msgSend(v3, "isUserSignedInToiCloud");

  v5 = -[BKDeleteActionItemsProvider canRemoveFromCollection](self, "canRemoveFromCollection");
  v6 = -[BKDeleteActionItemsProvider canDeleteFromAllDevices](self, "canDeleteFromAllDevices");
  if (v4)
  {
    v7 = v6;
    if (-[BKDeleteActionItemsProvider localUbiquityCount](self, "localUbiquityCount")
      || -[BKDeleteActionItemsProvider localiTunesUCount](self, "localiTunesUCount"))
    {
      goto LABEL_14;
    }
    if (v7
      && (-[BKDeleteActionItemsProvider nonlocalUbiquityCount](self, "nonlocalUbiquityCount")
       || -[BKDeleteActionItemsProvider nonlocaliTunesUCount](self, "nonlocaliTunesUCount")))
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v7 = 1;
      goto LABEL_15;
    }
    if (-[BKDeleteActionItemsProvider ubiquityErrorCount](self, "ubiquityErrorCount"))
      goto LABEL_44;
  }
  if (-[BKDeleteActionItemsProvider localOnlyBookCount](self, "localOnlyBookCount") >= 1
    && !-[BKDeleteActionItemsProvider sampleCount](self, "sampleCount"))
  {
LABEL_44:
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 1;
  }
  else
  {
    if (-[BKDeleteActionItemsProvider localJaliscoBooksOnlyCount](self, "localJaliscoBooksOnlyCount")
      || -[BKDeleteActionItemsProvider localITSAudiobookCount](self, "localITSAudiobookCount"))
    {
      v7 = 0;
LABEL_14:
      v9 = 0;
      v10 = 0;
      v8 = 1;
      goto LABEL_15;
    }
    if (-[BKDeleteActionItemsProvider sampleCount](self, "sampleCount"))
    {
      if (-[BKDeleteActionItemsProvider localSampleCount](self, "localSampleCount")
        && (-[NSString isEqualToString:](self->_collectionId, "isEqualToString:", kBKCollectionDefaultAll)
         || -[NSString isEqualToString:](self->_collectionId, "isEqualToString:", kBKCollectionDefaultIDSamples)
         || -[NSString isEqualToString:](self->_collectionId, "isEqualToString:", kBKCollectionDefaultIDDownloaded)))
      {
        v7 = 0;
        v10 = 0;
        v8 = 1;
      }
      else
      {
        v7 = 0;
        v8 = 0;
        v10 = 0;
      }
      v9 = 1;
    }
    else
    {
      if (-[BKDeleteActionItemsProvider storeItemCount](self, "storeItemCount"))
        v7 = -[BKDeleteActionItemsProvider memberOfOtherManualCollection](self, "memberOfOtherManualCollection");
      else
        v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }
  }
LABEL_15:
  if (-[BKDeleteActionItemsProvider sideloadedItemCount](self, "sideloadedItemCount"))
    v11 = 0;
  else
    v11 = -[BKDeleteActionItemsProvider countForActionItem:](self, "countForActionItem:", 7) != 0;
  if (-[BKDeleteActionItemsProvider downloadingCount](self, "downloadingCount"))
    v12 = 1;
  else
    v12 = v8;
  v13 = -[BKDeleteActionItemsProvider memberOfSampleCollection](self, "memberOfSampleCollection");
  if (-[BKDeleteActionItemsProvider storeItemCount](self, "storeItemCount"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collectionId](self, "collectionId"));
    if (v14)
      v15 = v5 ^ 1;
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
  v17 = v16;
  if (v5)
    objc_msgSend(v16, "addObject:", &off_C9E20);
  if (-[BKDeleteActionItemsProvider memberOfSampleCollection](self, "memberOfSampleCollection"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKDeleteActionItemsProvider collectionId](self, "collectionId"));
    v19 = objc_msgSend(v18, "isEqualToString:", kBKCollectionDefaultIDSamples);

    if ((v19 & 1) == 0)
      objc_msgSend(v17, "addObject:", &off_C9E38);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v21 = objc_msgSend((id)objc_opt_class(v20), "isRunningInStoreDemoMode");

  if ((v21 & 1) == 0)
  {
    if (v12)
      objc_msgSend(v17, "addObject:", &off_C9E50);
    if (v11)
      objc_msgSend(v17, "addObject:", &off_C9E68);
    if (v10 | v15)
      objc_msgSend(v17, "addObject:", &off_C9E80);
    if (v7)
      objc_msgSend(v17, "addObject:", &off_C9E98);
    if (v9 | v13 & ~v11 & (v7 ^ 1))
      objc_msgSend(v17, "addObject:", &off_C9EB0);
  }
  v22 = objc_msgSend(v17, "copy");

  return (NSArray *)v22;
}

- (unint64_t)countForActionItem:(int64_t)a3
{
  void *v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  char *v11;
  unint64_t v13;
  unint64_t v14;

  if (a3 == 7)
  {
    if ((+[BLLibraryUtility _isMultiUser](BLLibraryUtility, "_isMultiUser") & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
      v9 = objc_msgSend(v8, "isAccountModificationAllowed");

      if (v9)
      {
        v10 = -[BKDeleteActionItemsProvider localJaliscoBooksOnlyCount](self, "localJaliscoBooksOnlyCount");
        v11 = (char *)-[BKDeleteActionItemsProvider localITSAudiobookCount](self, "localITSAudiobookCount") + v10;
        return -[BKDeleteActionItemsProvider ghostBookCount](self, "ghostBookCount") + (_QWORD)v11;
      }
    }
    return 0;
  }
  if (a3 != 2)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v5 = objc_msgSend(v4, "isUserSignedInToiCloud");

  if (v5)
  {
    v6 = -[BKDeleteActionItemsProvider localUbiquityCount](self, "localUbiquityCount");
    v7 = -[BKDeleteActionItemsProvider localiTunesUCount](self, "localiTunesUCount");
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v13 = -[BKDeleteActionItemsProvider localJaliscoBooksOnlyCount](self, "localJaliscoBooksOnlyCount");
  v14 = -[BKDeleteActionItemsProvider localITSAudiobookCount](self, "localITSAudiobookCount");
  return -[BKDeleteActionItemsProvider localSampleCount](self, "localSampleCount") + v14 + v7 + v6 + v13;
}

- (id)_assetPurchasedDSIDForLibraryAsset:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_4CACC;
  v16 = sub_4CADC;
  v17 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4CAE4;
  v9[3] = &unk_C2D30;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "assetAccountIdentifiersForAsset:completion:", v3, v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (NSSet)booksToDelete
{
  return self->_booksToDelete;
}

- (NSString)collectionId
{
  return self->_collectionId;
}

- (unint64_t)ghostBookCount
{
  return self->_ghostBookCount;
}

- (unint64_t)localJaliscoBooksOnlyCount
{
  return self->_localJaliscoBooksOnlyCount;
}

- (unint64_t)localUbiquityCount
{
  return self->_localUbiquityCount;
}

- (unint64_t)nonlocalUbiquityCount
{
  return self->_nonlocalUbiquityCount;
}

- (unint64_t)localiTunesUCount
{
  return self->_localiTunesUCount;
}

- (unint64_t)nonlocaliTunesUCount
{
  return self->_nonlocaliTunesUCount;
}

- (unint64_t)downloadingCount
{
  return self->_downloadingCount;
}

- (unint64_t)localITSAudiobookCount
{
  return self->_localITSAudiobookCount;
}

- (unint64_t)cloudITSAudiobookCount
{
  return self->_cloudITSAudiobookCount;
}

- (unint64_t)nonStoreAudiobookCount
{
  return self->_nonStoreAudiobookCount;
}

- (unint64_t)ubiquityErrorCount
{
  return self->_ubiquityErrorCount;
}

- (unint64_t)pdfCount
{
  return self->_pdfCount;
}

- (unint64_t)storeItemCount
{
  return self->_storeItemCount;
}

- (unint64_t)localSampleCount
{
  return self->_localSampleCount;
}

- (unint64_t)nonLocalSampleCount
{
  return self->_nonLocalSampleCount;
}

- (unint64_t)recentBooksCount
{
  return self->_recentBooksCount;
}

- (BOOL)memberOfOtherManualCollection
{
  return self->_memberOfOtherManualCollection;
}

- (BOOL)memberOfSampleCollection
{
  return self->_memberOfSampleCollection;
}

- (unint64_t)seriesItemCount
{
  return self->_seriesItemCount;
}

- (unint64_t)seriesStackCount
{
  return self->_seriesStackCount;
}

- (unint64_t)sideloadedItemCount
{
  return self->_sideloadedItemCount;
}

- (BOOL)isRemovingFromWantToRead
{
  return self->_isRemovingFromWantToRead;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionId, 0);
  objc_storeStrong((id *)&self->_booksToDelete, 0);
}

@end
