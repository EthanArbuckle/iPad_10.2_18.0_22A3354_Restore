@implementation BKBLDownloadAsset

- (BKBLDownloadAsset)initWithBLDownloadStatus:(id)a3 dataSourceIdentifier:(id)a4 isParent:(BOOL)a5
{
  id v8;
  id v9;
  BKBLDownloadAsset *v10;
  BKBLDownloadAsset *v11;
  uint64_t v12;
  NSString *downloadID;
  uint64_t v14;
  NSString *genre;
  void *v16;
  uint64_t v17;
  NSURL *thumbnailImageURL;
  uint64_t v19;
  NSString *kind;
  uint64_t v21;
  NSString *author;
  uint64_t v23;
  NSString *title;
  void *v25;
  NSString *v26;
  NSString *assetID;
  NSMutableArray *v28;
  NSMutableArray *childAssets;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSString *storeID;
  uint64_t v39;
  NSString *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  uint64_t v45;
  NSURL *permlink;
  NSURL *v47;
  objc_super v48;

  v8 = a3;
  v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)BKBLDownloadAsset;
  v10 = -[BKBLDownloadAsset init](&v48, "init");
  v11 = v10;
  if (v10)
  {
    v10->_active = 1;
    v10->_needsUpdate = 0;
    objc_storeStrong((id *)&v10->_dataSourceIdentifier, a4);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadID"));
    downloadID = v11->_downloadID;
    v11->_downloadID = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "genre"));
    genre = v11->_genre;
    v11->_genre = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "thumbnailImageURL"));
    v17 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));
    thumbnailImageURL = v11->_thumbnailImageURL;
    v11->_thumbnailImageURL = (NSURL *)v17;

    v11->_generation = 0x7FFFFFFFFFFFFFFFLL;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetKind"));
    kind = v11->_kind;
    v11->_kind = (NSString *)v19;

    v11->_state = 2;
    v11->_sample = objc_msgSend(v8, "isSample");
    if (a5)
    {
      v11->_isAudiobook = 1;
      v11->_isParent = a5;
      -[BKBLDownloadAsset _updateContentTypeFromKind](v11, "_updateContentTypeFromKind");
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionArtistName"));
      author = v11->_author;
      v11->_author = (NSString *)v21;

      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionTitle"));
      title = v11->_title;
      v11->_title = (NSString *)v23;

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storePlaylistID"));
      v26 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringValue"));
      assetID = v11->_assetID;
      v11->_assetID = v26;

      objc_storeStrong((id *)&v11->_storeID, v26);
      v28 = objc_opt_new(NSMutableArray);
      childAssets = v11->_childAssets;
      v11->_childAssets = v28;
    }
    else
    {
      v11->_isAudiobook = objc_msgSend(v8, "isAudiobook");
      v11->_isParent = a5;
      -[BKBLDownloadAsset _updateContentTypeFromKind](v11, "_updateContentTypeFromKind");
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "artistName"));
      v31 = v11->_author;
      v11->_author = (NSString *)v30;

      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      v33 = v11->_title;
      v11->_title = (NSString *)v32;

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeID"));
      v35 = objc_msgSend(v34, "longLongValue");

      if (v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeID"));
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringValue"));
        storeID = v11->_storeID;
        v11->_storeID = (NSString *)v37;

        v39 = objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset _assetIDFromDownloadStatus:](v11, "_assetIDFromDownloadStatus:", v8));
        v40 = v11->_assetID;
        v11->_assetID = (NSString *)v39;

        v41 = objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset _temporaryAssetIDFromDownloadStatus:](v11, "_temporaryAssetIDFromDownloadStatus:", v8));
      }
      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "permLink"));

        if (!v43)
          goto LABEL_8;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "permLink"));
        v45 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v44));
        permlink = v11->_permlink;
        v11->_permlink = (NSURL *)v45;

        v47 = v11->_permlink;
        if (!v47)
        {
          childAssets = (NSMutableArray *)v11->_temporaryAssetID;
          v11->_temporaryAssetID = 0;
          goto LABEL_7;
        }
        v41 = objc_claimAutoreleasedReturnValue(-[NSURL identifierFromPermlink](v47, "identifierFromPermlink"));
      }
      childAssets = (NSMutableArray *)v11->_temporaryAssetID;
      v11->_temporaryAssetID = (NSString *)v41;
    }
LABEL_7:

  }
LABEL_8:

  return v11;
}

- (BOOL)_isSupplementalPDFromDownloadStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storePlaylistID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));

  if (v5)
    v6 = objc_msgSend(v3, "isAudiobook") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (id)_assetIDFromDownloadStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[BKBLDownloadAsset _isSupplementalPDFromDownloadStatus:](self, "_isSupplementalPDFromDownloadStatus:", v4))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

  }
  return v5;
}

- (id)_temporaryAssetIDFromDownloadStatus:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[BKBLDownloadAsset _isSupplementalPDFromDownloadStatus:](self, "_isSupplementalPDFromDownloadStatus:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permLink"));

    if (!v7)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permLink"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));

    if (!v5)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v6 = objc_claimAutoreleasedReturnValue(-[NSURL identifierFromPermlink](self->_permlink, "identifierFromPermlink"));
  }
  v9 = (void *)v6;
LABEL_7:

LABEL_8:
  return v9;
}

- (BOOL)updateMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *temporaryAssetID;
  NSString *v14;
  NSString *v15;
  void *v16;
  id v17;
  NSString *v18;
  NSString *author;
  NSString *v20;
  NSString *title;
  void *v22;
  id v23;
  void *v24;
  NSString *v25;
  NSString *storeID;
  NSString *v27;
  NSString *assetID;
  NSString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSString *v55;
  NSString *genre;
  void *v57;
  NSURL *v58;
  NSURL *thumbnailImageURL;
  NSString *v60;
  NSString *kind;
  unsigned __int8 v62;
  void *v64;
  void *v65;
  NSURL *v66;
  NSURL *permlink;
  NSURL *v68;

  v4 = a3;
  if (!-[BKBLDownloadAsset isParent](self, "isParent"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    if (objc_msgSend(v6, "length"))
    {

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artistName"));
      v17 = objc_msgSend(v16, "length");

      if (!v17)
        goto LABEL_13;
    }
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artistName"));
    author = self->_author;
    self->_author = v18;

    v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    title = self->_title;
    self->_title = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
    v23 = objc_msgSend(v22, "longLongValue");

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
      v25 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringValue"));
      storeID = self->_storeID;
      self->_storeID = v25;

      v27 = (NSString *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset _assetIDFromDownloadStatus:](self, "_assetIDFromDownloadStatus:", v4));
      assetID = self->_assetID;
      self->_assetID = v27;

      v29 = (NSString *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset _temporaryAssetIDFromDownloadStatus:](self, "_temporaryAssetIDFromDownloadStatus:", v4));
    }
    else
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permLink"));

      if (!v64)
        goto LABEL_13;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permLink"));
      v66 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v65));
      permlink = self->_permlink;
      self->_permlink = v66;

      v68 = self->_permlink;
      if (!v68)
      {
        temporaryAssetID = self->_temporaryAssetID;
        self->_temporaryAssetID = 0;
        goto LABEL_12;
      }
      v29 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSURL identifierFromPermlink](v68, "identifierFromPermlink"));
    }
    temporaryAssetID = self->_temporaryAssetID;
    self->_temporaryAssetID = v29;
LABEL_12:

    goto LABEL_13;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionTitle"));
  if (objc_msgSend(v5, "length"))
  {

LABEL_7:
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionArtistName"));
    v10 = self->_author;
    self->_author = v9;

    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionTitle"));
    v12 = self->_title;
    self->_title = v11;

    temporaryAssetID = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storePlaylistID"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringValue](temporaryAssetID, "stringValue"));
    v15 = self->_assetID;
    self->_assetID = v14;

    objc_storeStrong((id *)&self->_storeID, v14);
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionArtistName"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
    goto LABEL_7;
LABEL_13:
  if (!-[NSString length](self->_storeID, "length"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_permlink, "absoluteString"));
    v31 = objc_msgSend(v30, "length");

    if (!v31)
    {
      v35 = BCBookDownloadLog(v32, v33, v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_1006A3BC0(v36, v37, v38, v39, v40, v41, v42, v43);

    }
  }
  if (!-[NSString length](self->_title, "length"))
  {
    v46 = BCBookDownloadLog(0, v44, v45);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_1006A3B8C(v47, v48, v49, v50, v51, v52, v53, v54);

  }
  v55 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "genre"));
  genre = self->_genre;
  self->_genre = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "thumbnailImageURL"));
  v58 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v57));
  thumbnailImageURL = self->_thumbnailImageURL;
  self->_thumbnailImageURL = v58;

  self->_generation = 0x7FFFFFFFFFFFFFFFLL;
  v60 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetKind"));
  kind = self->_kind;
  self->_kind = v60;

  if (-[BKBLDownloadAsset isParent](self, "isParent"))
    v62 = 1;
  else
    v62 = objc_msgSend(v4, "isAudiobook");
  self->_isAudiobook = v62;
  -[BKBLDownloadAsset _updateContentTypeFromKind](self, "_updateContentTypeFromKind");
  self->_state = 2;
  self->_sample = objc_msgSend(v4, "isSample");

  return 1;
}

- (NSString)description
{
  return (NSString *)+[BKAssetUtilities descriptionForAsset:](BKAssetUtilities, "descriptionForAsset:", self);
}

- (void)_updateContentTypeFromKind
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;

  if (-[BKBLDownloadAsset isParent](self, "isParent")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset kind](self, "kind")),
        v4 = objc_msgSend(v3, "isEqualToString:", BLDownloadKindAudiobook),
        v3,
        (v4 & 1) != 0))
  {
    v5 = 6;
LABEL_4:
    -[BKBLDownloadAsset setContentType:](self, "setContentType:", v5);
    return;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset kind](self, "kind"));
  v7 = objc_msgSend(v6, "isEqualToString:", BLDownloadKindEBook);

  if ((v7 & 1) != 0)
  {
    v5 = 1;
    goto LABEL_4;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset kind](self, "kind"));
  v9 = objc_msgSend(v8, "isEqualToString:", BLDownloadKindPDF);

  if (v9)
  {
    v5 = 3;
    goto LABEL_4;
  }
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset storeID](self, "storeID"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset temporaryAssetID](self, "temporaryAssetID"));
  v6 = v5;

  return (NSString *)v6;
}

- (void)setProgress:(float)a3
{
  id v3;

  self->_progress = a3;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset parent](self, "parent"));
  objc_msgSend(v3, "setNeedsUpdate:", 1);

}

- (float)progress
{
  -[BKBLDownloadAsset _updateIfNeeded](self, "_updateIfNeeded");
  return self->_progress;
}

- (void)setSecondsRemaining:(int64_t)a3
{
  id v3;

  if (self->_secondsRemaining != a3)
  {
    self->_secondsRemaining = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset parent](self, "parent"));
    objc_msgSend(v3, "setNeedsUpdate:", 1);

  }
}

- (int64_t)secondsRemaining:(int64_t)a3
{
  -[BKBLDownloadAsset _updateIfNeeded](self, "_updateIfNeeded", a3);
  return self->_secondsRemaining;
}

- (void)setBytesDownloaded:(int64_t)a3
{
  id v3;

  if (self->_bytesDownloaded != a3)
  {
    self->_bytesDownloaded = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset parent](self, "parent"));
    objc_msgSend(v3, "setNeedsUpdate:", 1);

  }
}

- (int64_t)bytesDownloaded:(int64_t)a3
{
  -[BKBLDownloadAsset _updateIfNeeded](self, "_updateIfNeeded", a3);
  return self->_bytesDownloaded;
}

- (void)setBytesTotal:(int64_t)a3
{
  id v3;

  if (self->_bytesTotal != a3)
  {
    self->_bytesTotal = a3;
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset parent](self, "parent"));
    objc_msgSend(v3, "setNeedsUpdate:", 1);

  }
}

- (int64_t)bytesTotal:(int64_t)a3
{
  -[BKBLDownloadAsset _updateIfNeeded](self, "_updateIfNeeded", a3);
  return self->_bytesTotal;
}

- (void)setDownloadStatus:(id)a3
{
  id v4;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "percentComplete"));
    objc_msgSend(v5, "floatValue");
    self->_progress = v6;

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "estimatedTimeRemaining"));
    self->_secondsRemaining = (int64_t)objc_msgSend(v7, "integerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transferBytesWritten"));
    self->_bytesDownloaded = (int64_t)objc_msgSend(v8, "longLongValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transferBytesExpected"));
    self->_bytesTotal = (int64_t)objc_msgSend(v9, "longLongValue");

    v10 = (unint64_t)objc_msgSend(v4, "downloadPhase");
    if (v10 <= 8)
      self->_downloadState = qword_10070CBD8[v10];
    v11 = (id)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset parent](self, "parent"));
    objc_msgSend(v11, "setNeedsUpdate:", 1);

  }
}

- (int64_t)downloadState
{
  -[BKBLDownloadAsset _updateIfNeeded](self, "_updateIfNeeded");
  return self->_downloadState;
}

- (void)_updateIfNeeded
{
  void *v3;
  id v4;
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  float v11;
  void *i;
  void *v13;
  float v14;
  float v15;
  void *v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  _BYTE v38[128];

  if (-[BKBLDownloadAsset needsUpdate](self, "needsUpdate"))
  {
    self->_downloadState = 4;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset children](self, "children"));
    if (objc_msgSend(v3, "count"))
    {
      self->_secondsRemaining = 0;
      self->_bytesDownloaded = 0;
      self->_bytesTotal = 0;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v23 = v3;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v5)
      {
        v6 = v5;
        v25 = 0;
        v24 = 0;
        v7 = 0;
        v8 = 0;
        v9 = 0;
        v10 = *(_QWORD *)v27;
        v11 = 0.0;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v4);
            v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            self->_secondsRemaining += (int64_t)objc_msgSend(v13, "secondsRemaining");
            self->_bytesDownloaded += (int64_t)objc_msgSend(v13, "bytesDownloaded");
            self->_bytesTotal += (int64_t)objc_msgSend(v13, "bytesTotal");
            objc_msgSend(v13, "progress");
            v15 = v14;
            switch((unint64_t)objc_msgSend(v13, "downloadState"))
            {
              case 3uLL:
                ++v24;
                break;
              case 4uLL:
                ++v9;
                break;
              case 5uLL:
                ++v8;
                break;
              case 6uLL:
                ++HIDWORD(v25);
                break;
              case 7uLL:
                ++v7;
                break;
              case 8uLL:
                LODWORD(v25) = v25 + 1;
                break;
              default:
                break;
            }
            v11 = v11 + v15;
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        }
        while (v6);
      }
      else
      {
        v25 = 0;
        v24 = 0;
        v7 = 0;
        v8 = 0;
        v9 = 0;
        v11 = 0.0;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset children](self, "children"));
      self->_progress = v11 / (float)(unint64_t)objc_msgSend(v16, "count");

      if (v7 <= 0)
      {
        v3 = v23;
        if (v9 <= 0)
        {
          if (objc_msgSend(v4, "count") == (id)v8)
          {
            v17 = 5;
          }
          else if (objc_msgSend(v4, "count") == (id)SHIDWORD(v25))
          {
            v17 = 6;
          }
          else if ((int)v25 <= 0)
          {
            v18 = objc_msgSend(v4, "count");
            if (v18 == (id)v24)
            {
              v17 = 3;
            }
            else
            {
              v21 = BCBookDownloadLog(v18, v19, v20);
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109888;
                v31 = v8;
                v32 = 1024;
                v33 = HIDWORD(v25);
                v34 = 1024;
                v35 = v25;
                v36 = 1024;
                v37 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "unexpected audiobook download state downloaded=%d paused=%d cancelled=%d waiting=%d", buf, 0x1Au);
              }

              v17 = 0;
            }
          }
          else
          {
            v17 = 8;
          }
        }
        else
        {
          v17 = 4;
        }
      }
      else
      {
        v17 = 7;
        v3 = v23;
      }
      self->_downloadState = v17;
    }
    -[BKBLDownloadAsset setNeedsUpdate:](self, "setNeedsUpdate:", 0);

  }
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)addChild:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset childAssets](self, "childAssets"));
  objc_msgSend(v4, "addObject:", v5);

  -[BKBLDownloadAsset setNumberOfAddedChildren:](self, "setNumberOfAddedChildren:", (char *)-[BKBLDownloadAsset numberOfAddedChildren](self, "numberOfAddedChildren") + 1);
  objc_msgSend(v5, "setParent:", self);

}

- (void)removeFromParent
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset parent](self, "parent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childAssets"));
  objc_msgSend(v4, "removeObject:", self);

  -[BKBLDownloadAsset setParent:](self, "setParent:", 0);
}

- (NSArray)children
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset childAssets](self, "childAssets"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)activeChildren
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("active == YES")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBLDownloadAsset childAssets](self, "childAssets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v3));

  return (NSArray *)v5;
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSURL)permlink
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isSample
{
  return self->_sample;
}

- (int64_t)generation
{
  return self->_generation;
}

- (signed)state
{
  return self->_state;
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)isProof
{
  return self->proof;
}

- (BOOL)isCompressed
{
  return self->compressed;
}

- (BOOL)isLocked
{
  return self->locked;
}

- (BOOL)isEphemeral
{
  return self->ephemeral;
}

- (int64_t)fileSize
{
  return self->fileSize;
}

- (signed)contentType
{
  return self->contentType;
}

- (void)setContentType:(signed __int16)a3
{
  self->contentType = a3;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 192, 1);
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return self->shouldDisableOptimizeSpeed;
}

- (BOOL)shouldDisableTouchEmulation
{
  return self->shouldDisableTouchEmulation;
}

- (signed)desktopSupportLevel
{
  return self->desktopSupportLevel;
}

- (NSString)scrollDirection
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (int64_t)pageCount
{
  return self->pageCount;
}

- (int64_t)rating
{
  return self->rating;
}

- (NSDate)updateDate
{
  return (NSDate *)objc_getProperty(self, a2, 224, 1);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)computedRating
{
  return self->computedRating;
}

- (int64_t)metadataMigrationVersion
{
  return self->metadataMigrationVersion;
}

- (BOOL)isDevelopment
{
  return self->development;
}

- (int64_t)secondsRemaining
{
  return self->_secondsRemaining;
}

- (int64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (int64_t)bytesTotal
{
  return self->_bytesTotal;
}

- (void)setDownloadState:(int64_t)a3
{
  self->_downloadState = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (NSURL)thumbnailImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 320, 1);
}

- (void)setThumbnailImageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (BKBLDownloadAsset)parent
{
  return (BKBLDownloadAsset *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSMutableArray)childAssets
{
  return self->_childAssets;
}

- (void)setChildAssets:(id)a3
{
  objc_storeStrong((id *)&self->_childAssets, a3);
}

- (unint64_t)numberOfAddedChildren
{
  return self->_numberOfAddedChildren;
}

- (void)setNumberOfAddedChildren:(unint64_t)a3
{
  self->_numberOfAddedChildren = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childAssets, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_thumbnailImageURL, 0);
  objc_storeStrong((id *)&self->grouping, 0);
  objc_storeStrong((id *)&self->year, 0);
  objc_storeStrong((id *)&self->comments, 0);
  objc_storeStrong((id *)&self->bookDescription, 0);
  objc_storeStrong((id *)&self->versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->versionNumber, 0);
  objc_storeStrong((id *)&self->updateDate, 0);
  objc_storeStrong((id *)&self->scrollDirection, 0);
  objc_storeStrong((id *)&self->lastOpenDate, 0);
  objc_storeStrong((id *)&self->expectedDate, 0);
  objc_storeStrong((id *)&self->purchaseDate, 0);
  objc_storeStrong((id *)&self->releaseDate, 0);
  objc_storeStrong((id *)&self->dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->isExplicit, 0);
  objc_storeStrong((id *)&self->url, 0);
  objc_storeStrong((id *)&self->sortTitle, 0);
  objc_storeStrong((id *)&self->sortAuthor, 0);
  objc_storeStrong((id *)&self->accountID, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
