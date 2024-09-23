@implementation BKLibraryAssetUpdate

- (BKLibraryAssetUpdate)init
{
  BKLibraryAssetUpdate *v2;
  BKLibraryAssetUpdate *v3;
  NSString *seriesID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryAssetUpdate;
  v2 = -[BKLibraryAssetUpdate init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    seriesID = v2->_seriesID;
    v2->_seriesID = 0;

  }
  return v3;
}

- (BKLibraryAssetUpdate)initWithAsset:(id)a3 dataSource:(id)a4 dataSourceBitmask:(unint64_t)a5
{
  id v9;
  id v10;
  BKLibraryAssetUpdate *v11;
  BKLibraryAssetUpdate *v12;
  void *v13;
  uint64_t v14;
  NSString *seriesID;
  void *v16;
  uint64_t v17;
  NSNumber *duration;
  uint64_t v19;

  v9 = a3;
  v10 = a4;
  v11 = -[BKLibraryAssetUpdate init](self, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    if ((objc_opt_respondsToSelector(v9, "seriesID") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seriesID"));

      if (v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "seriesID"));
        seriesID = v12->_seriesID;
        v12->_seriesID = (NSString *)v14;

      }
    }
    if ((objc_opt_respondsToSelector(v9, "duration") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "duration"));

      if (v16)
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "duration"));
        duration = v12->_duration;
        v12->_duration = (NSNumber *)v17;

      }
    }
    v12->_dataSourcesBitmask = a5;
    if ((objc_opt_respondsToSelector(v10, "propagateDataProperties") & 1) != 0)
      v19 = (uint64_t)objc_msgSend(v10, "propagateDataProperties");
    else
      v19 = 268370174;
    -[BKLibraryAssetUpdate setPropertiesToPropagate:](v12, "setPropertiesToPropagate:", v19);
    -[BKLibraryAssetUpdate propagateAdditionalDataWithAsset:](v12, "propagateAdditionalDataWithAsset:", v9);
  }

  return v12;
}

- (void)propagateAdditionalDataWithAsset:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
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
  void *v42;
  void *v43;
  unsigned int v44;
  id v45;

  v45 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "purchaseDate"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate purchaseDates_hack](self, "purchaseDates_hack"));

    if (!v5)
    {
      v6 = objc_opt_new(NSMutableArray);
      -[BKLibraryAssetUpdate setPurchaseDates_hack:](self, "setPurchaseDates_hack:", v6);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate purchaseDates_hack](self, "purchaseDates_hack"));
    objc_msgSend(v7, "addObject:", v4);

    self->_hasChanges = 1;
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x10000000) != 0
    && (objc_opt_respondsToSelector(v45, "coverAspectRatio") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "coverAspectRatio"));
    if (v8)
    {
      v9 = v8;
      objc_storeStrong((id *)&self->_coverAspectRatio, v8);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x2000) != 0
    && (objc_opt_respondsToSelector(v45, "assetIsHidden") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "assetIsHidden"));
    if (v10)
    {
      v11 = v10;
      objc_storeStrong((id *)&self->_assetIsHidden, v10);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 2) != 0
    && (objc_opt_respondsToSelector(v45, "seriesID") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "seriesID"));
    if (v12)
    {
      v13 = v12;
      objc_storeStrong((id *)&self->_seriesID, v12);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 4) != 0
    && (objc_opt_respondsToSelector(v45, "seriesSortKey") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "seriesSortKey"));
    if (v14)
    {
      v15 = v14;
      objc_storeStrong((id *)&self->_seriesSortKey, v14);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 8) != 0
    && (objc_opt_respondsToSelector(v45, "sequenceDisplayName") & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sequenceDisplayName"));
    if (v16)
    {
      v17 = v16;
      objc_storeStrong((id *)&self->_sequenceDisplayName, v16);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x4000000) != 0
    && (objc_opt_respondsToSelector(v45, "sequenceNumber") & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sequenceNumber"));
    if (v18)
    {
      v19 = v18;
      objc_storeStrong((id *)&self->_sequenceNumber, v18);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x10) != 0
    && (objc_opt_respondsToSelector(v45, "seriesIsHidden") & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "seriesIsHidden"));
    if (v20)
    {
      v21 = v20;
      objc_storeStrong((id *)&self->_seriesIsHidden, v20);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x4000) != 0
    && (objc_opt_respondsToSelector(v45, "isStoreAudiobook") & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "isStoreAudiobook"));
    if (v22)
    {
      v23 = v22;
      objc_storeStrong((id *)&self->_isStoreAudiobook, v22);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x8000) != 0
    && (objc_opt_respondsToSelector(v45, "hasRACSupport") & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "hasRACSupport"));
    if (v24)
    {
      v25 = v24;
      objc_storeStrong((id *)&self->_hasRACSupport, v24);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x20) != 0
    && (objc_opt_respondsToSelector(v45, "seriesIsCloudOnly") & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "seriesIsCloudOnly"));
    if (v26)
    {
      v27 = v26;
      objc_storeStrong((id *)&self->_seriesIsCloudOnly, v26);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x40) != 0
    && (objc_opt_respondsToSelector(v45, "expectedDate") & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "expectedDate"));
    if (v28)
    {
      v29 = v28;
      objc_storeStrong((id *)&self->_expectedDate, v28);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x2000000) != 0
    && (objc_opt_respondsToSelector(v45, "releaseDate") & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "releaseDate"));
    if (v30)
    {
      v31 = v30;
      objc_storeStrong((id *)&self->_releaseDate, v30);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x80) != 0
    && (objc_opt_respondsToSelector(v45, "isSample") & 1) != 0
    && objc_msgSend(v45, "isSample"))
  {
    *(_WORD *)&self->_hasChanges = 257;
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x100) != 0
    && (objc_opt_respondsToSelector(v45, "title") & 1) != 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "title"));
    if (v32)
    {
      v33 = v32;
      objc_storeStrong((id *)&self->_title, v32);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x1000) != 0
    && (objc_opt_respondsToSelector(v45, "url") & 1) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "url"));
    if (v34)
    {
      v35 = v34;
      objc_storeStrong((id *)&self->_url, v34);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x200) != 0
    && (objc_opt_respondsToSelector(v45, "author") & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "author"));
    if (v36)
    {
      v37 = v36;
      objc_storeStrong((id *)&self->_author, v36);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x400) != 0
    && (objc_opt_respondsToSelector(v45, "genre") & 1) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "genre"));
    if (v38)
    {
      v39 = v38;
      objc_storeStrong((id *)&self->_genre, v38);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x800) != 0
    && (objc_opt_respondsToSelector(v45, "isExplicit") & 1) != 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "isExplicit"));
    if (v40)
    {
      v41 = v40;
      objc_storeStrong((id *)&self->_isExplicit, v40);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x800000) != 0
    && (objc_opt_respondsToSelector(v45, "mappedAssetID") & 1) != 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "mappedAssetID"));
    if (v42)
    {
      v43 = v42;
      objc_storeStrong((id *)&self->_mappedAssetID, v42);
      self->_hasChanges = 1;

    }
  }
  if ((-[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate") & 0x1000000) != 0
    && (objc_opt_respondsToSelector(v45, "mappedAssetContentType") & 1) != 0)
  {
    v44 = objc_msgSend(v45, "mappedAssetContentType");
    if (v44)
    {
      self->_mappedAssetContentType = v44;
      self->_hasChanges = 1;
    }
  }

}

- (void)postIntegrateCleanup
{
  BKAsset *asset;
  NSNumber *assetIsHidden;
  NSNumber *coverAspectRatio;
  NSString *seriesID;
  NSString *sequenceDisplayName;
  NSDecimalNumber *sequenceNumber;
  NSNumber *seriesSortKey;
  NSNumber *seriesIsHidden;
  NSNumber *seriesIsCloudOnly;
  NSNumber *isStoreAudiobook;
  NSMutableArray *purchaseDates_hack;
  NSDate *expectedDate;
  NSDate *releaseDate;
  NSString *title;
  NSURL *url;
  NSString *author;
  NSString *genre;
  NSNumber *isExplicit;

  asset = self->_asset;
  self->_asset = 0;

  assetIsHidden = self->_assetIsHidden;
  self->_assetIsHidden = 0;

  coverAspectRatio = self->_coverAspectRatio;
  self->_coverAspectRatio = 0;

  seriesID = self->_seriesID;
  self->_seriesID = 0;

  sequenceDisplayName = self->_sequenceDisplayName;
  self->_sequenceDisplayName = 0;

  sequenceNumber = self->_sequenceNumber;
  self->_sequenceNumber = 0;

  seriesSortKey = self->_seriesSortKey;
  self->_seriesSortKey = 0;

  seriesIsHidden = self->_seriesIsHidden;
  self->_seriesIsHidden = 0;

  seriesIsCloudOnly = self->_seriesIsCloudOnly;
  self->_seriesIsCloudOnly = 0;

  isStoreAudiobook = self->_isStoreAudiobook;
  self->_isStoreAudiobook = 0;

  purchaseDates_hack = self->_purchaseDates_hack;
  self->_purchaseDates_hack = 0;

  expectedDate = self->_expectedDate;
  self->_expectedDate = 0;

  releaseDate = self->_releaseDate;
  self->_releaseDate = 0;

  title = self->_title;
  self->_title = 0;

  url = self->_url;
  self->_url = 0;

  author = self->_author;
  self->_author = 0;

  genre = self->_genre;
  self->_genre = 0;

  isExplicit = self->_isExplicit;
  self->_isExplicit = 0;

  self->_hasChanges = 0;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@: <%p>"), v5, self));

  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tproperties - 0x%lx"), -[BKLibraryAssetUpdate propertiesToPropagate](self, "propertiesToPropagate"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tbitmask=%#lx"), -[BKLibraryAssetUpdate dataSourcesBitmask](self, "dataSourcesBitmask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate asset](self, "asset"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tasset=%p"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate asset](self, "asset"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate asset](self, "asset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetID"));
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\tasset.assetID=%@"), v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate asset](self, "asset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "temporaryAssetID"));
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\tasset.temporaryAssetID=%@ "), v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate asset](self, "asset"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\tasset.title=%@"), v14);

  }
  v15 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate seriesID](self, "seriesID"));
  v16 = (void *)v15;
  if (v15)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("seriesID"), v15);

  v17 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate seriesSortKey](self, "seriesSortKey"));
  v18 = (void *)v17;
  if (v17)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("seriesSortKey"), v17);

  v19 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate sequenceDisplayName](self, "sequenceDisplayName"));
  v20 = (void *)v19;
  if (v19)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("sequenceDisplayName"), v19);

  v21 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate sequenceNumber](self, "sequenceNumber"));
  v22 = (void *)v21;
  if (v21)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("sequenceNumber"), v21);

  v23 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate seriesIsHidden](self, "seriesIsHidden"));
  v24 = (void *)v23;
  if (v23)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("seriesIsHidden"), v23);

  v25 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate seriesIsCloudOnly](self, "seriesIsCloudOnly"));
  v26 = (void *)v25;
  if (v25)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("seriesIsCloudOnly"), v25);

  v27 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate isStoreAudiobook](self, "isStoreAudiobook"));
  v28 = (void *)v27;
  if (v27)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("isStoreAudiobook"), v27);

  v29 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate expectedDate](self, "expectedDate"));
  v30 = (void *)v29;
  if (v29)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("expectedDate"), v29);

  v31 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate releaseDate](self, "releaseDate"));
  v32 = (void *)v31;
  if (v31)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("releaseDate"), v31);

  v33 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate title](self, "title"));
  v34 = (void *)v33;
  if (v33)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("title"), v33);

  v35 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate author](self, "author"));
  v36 = (void *)v35;
  if (v35)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("author"), v35);

  v37 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate genre](self, "genre"));
  v38 = (void *)v37;
  if (v37)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("genre"), v37);

  v39 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate isExplicit](self, "isExplicit"));
  v40 = (void *)v39;
  if (v39)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("isExplicit"), v39);

  v41 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate url](self, "url"));
  v42 = (void *)v41;
  if (v41)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("url"), v41);

  v43 = objc_claimAutoreleasedReturnValue(-[BKLibraryAssetUpdate coverAspectRatio](self, "coverAspectRatio"));
  v44 = (void *)v43;
  if (v43)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ - %@"), CFSTR("coverAspectRatio"), v43);

  return v6;
}

- (BKAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (unint64_t)dataSourcesBitmask
{
  return self->_dataSourcesBitmask;
}

- (void)setDataSourcesBitmask:(unint64_t)a3
{
  self->_dataSourcesBitmask = a3;
}

- (unint64_t)propertiesToPropagate
{
  return self->_propertiesToPropagate;
}

- (void)setPropertiesToPropagate:(unint64_t)a3
{
  self->_propertiesToPropagate = a3;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (NSNumber)assetIsHidden
{
  return self->_assetIsHidden;
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (NSNumber)seriesSortKey
{
  return self->_seriesSortKey;
}

- (NSString)sequenceDisplayName
{
  return self->_sequenceDisplayName;
}

- (NSDecimalNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSNumber)seriesIsHidden
{
  return self->_seriesIsHidden;
}

- (NSNumber)seriesIsCloudOnly
{
  return self->_seriesIsCloudOnly;
}

- (NSNumber)seriesIsOrdered
{
  return self->_seriesIsOrdered;
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSNumber)isExplicit
{
  return self->_isExplicit;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (BOOL)sample
{
  return self->_sample;
}

- (NSNumber)isStoreAudiobook
{
  return self->_isStoreAudiobook;
}

- (NSNumber)hasRACSupport
{
  return self->_hasRACSupport;
}

- (NSString)mappedAssetID
{
  return self->_mappedAssetID;
}

- (signed)mappedAssetContentType
{
  return self->_mappedAssetContentType;
}

- (NSNumber)coverAspectRatio
{
  return self->_coverAspectRatio;
}

- (NSMutableArray)purchaseDates_hack
{
  return self->_purchaseDates_hack;
}

- (void)setPurchaseDates_hack:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseDates_hack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseDates_hack, 0);
  objc_storeStrong((id *)&self->_coverAspectRatio, 0);
  objc_storeStrong((id *)&self->_mappedAssetID, 0);
  objc_storeStrong((id *)&self->_hasRACSupport, 0);
  objc_storeStrong((id *)&self->_isStoreAudiobook, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_seriesIsOrdered, 0);
  objc_storeStrong((id *)&self->_seriesIsCloudOnly, 0);
  objc_storeStrong((id *)&self->_seriesIsHidden, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_sequenceDisplayName, 0);
  objc_storeStrong((id *)&self->_seriesSortKey, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);
  objc_storeStrong((id *)&self->_assetIsHidden, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
