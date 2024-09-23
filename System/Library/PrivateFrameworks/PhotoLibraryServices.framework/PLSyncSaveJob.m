@implementation PLSyncSaveJob

- (id)initFromSerializedData:(id)a3
{
  id v4;
  PLSyncSaveJob *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PLSyncSaveJob *v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  objc_super v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PLSyncSaveJob;
  v5 = -[PLSyncSaveJob init](&v52, sel_init);
  if (v5)
  {
    v51 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v51);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v51;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v6;
        objc_msgSend(v8, "objectForKey:", CFSTR("path"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSyncSaveJob setOriginalAssetURL:](v5, "setOriginalAssetURL:", v10);

        }
        v45 = (void *)v9;
        v46 = v7;
        objc_msgSend(v8, "objectForKey:", CFSTR("videoComplementPath"));
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSyncSaveJob setVideoComplementURL:](v5, "setVideoComplementURL:", v12);

        }
        v44 = (void *)v11;
        objc_msgSend(v8, "objectForKey:", CFSTR("hasVideoComplement"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setHasVideoComplement:](v5, "setHasVideoComplement:", objc_msgSend(v13, "BOOLValue"));

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v8, "objectForKey:", CFSTR("albums"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v48 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(v14, "addObject:", v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
          }
          while (v17);
        }

        -[PLSyncSaveJob setAlbumURIs:](v5, "setAlbumURIs:", v14);
        objc_msgSend(v8, "objectForKey:", CFSTR("UUID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setUuid:](v5, "setUuid:", v21);

        objc_msgSend(v8, "objectForKey:", CFSTR("isVideo"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setIsVideo:](v5, "setIsVideo:", objc_msgSend(v22, "BOOLValue"));

        objc_msgSend(v8, "objectForKey:", CFSTR("date"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setCreationDate:](v5, "setCreationDate:", v23);

        objc_msgSend(v8, "objectForKey:", CFSTR("moddate"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setModificationDate:](v5, "setModificationDate:", v24);

        objc_msgSend(v8, "objectForKey:", CFSTR("latitude"));
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          objc_msgSend(v8, "objectForKey:", CFSTR("longitude"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            v28 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            objc_msgSend(v8, "objectForKey:", CFSTR("latitude"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "doubleValue");
            v31 = v30;
            objc_msgSend(v8, "objectForKey:", CFSTR("longitude"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "doubleValue");
            v34 = (void *)objc_msgSend(v28, "initWithLatitude:longitude:", v31, v33);

            objc_msgSend(v34, "coordinate");
            if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
              -[PLSyncSaveJob setLocation:](v5, "setLocation:", v34);

          }
        }
        objc_msgSend(v8, "objectForKey:", CFSTR("facesInfo"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setFacesInfo:](v5, "setFacesInfo:", v35);

        objc_msgSend(v8, "objectForKey:", CFSTR("sortToken"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setSortToken:](v5, "setSortToken:", v36);

        objc_msgSend(v8, "objectForKey:", CFSTR("originalFileName"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setOriginalFileName:](v5, "setOriginalFileName:", v37);

        objc_msgSend(v8, "objectForKey:", CFSTR("isSyncComplete"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setIsSyncComplete:](v5, "setIsSyncComplete:", objc_msgSend(v38, "BOOLValue"));

        objc_msgSend(v8, "objectForKey:", CFSTR("cleanupSyncState"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setCleanupSyncState:](v5, "setCleanupSyncState:", objc_msgSend(v39, "BOOLValue"));

        objc_msgSend(v8, "objectForKey:", CFSTR("cleanupBeforeDate"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSyncSaveJob setCleanupBeforeDate:](v5, "setCleanupBeforeDate:", v40);

        goto LABEL_23;
      }
    }
    else
    {
      v42 = objc_opt_class();
      NSLog(CFSTR("Unable to create %@: %@"), v42, v7);
    }

    v41 = 0;
    goto LABEL_26;
  }
LABEL_23:
  v41 = v5;
LABEL_26:

  return v41;
}

- (id)serializedData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSyncSaveJob originalAssetURL](self, "originalAssetURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLSyncSaveJob originalAssetURL](self, "originalAssetURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("path"));

  }
  -[PLSyncSaveJob videoComplementURL](self, "videoComplementURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLSyncSaveJob videoComplementURL](self, "videoComplementURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("videoComplementPath"));

  }
  v10 = -[PLSyncSaveJob hasVideoComplement](self, "hasVideoComplement");
  v11 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (v10)
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("hasVideoComplement"));
  if (-[PLSyncSaveJob isVideo](self, "isVideo"))
    objc_msgSend(v3, "setObject:forKey:", *v11, CFSTR("isVideo"));
  -[PLSyncSaveJob uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PLSyncSaveJob uuid](self, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("UUID"));

  }
  -[PLSyncSaveJob creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PLSyncSaveJob creationDate](self, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("date"));

  }
  -[PLSyncSaveJob modificationDate](self, "modificationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLSyncSaveJob modificationDate](self, "modificationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("moddate"));

  }
  -[PLSyncSaveJob location](self, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "coordinate");
    if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
    {
      objc_msgSend(v19, "coordinate");
      v21 = v20;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("latitude"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("longitude"));

    }
  }
  -[PLSyncSaveJob albumURIs](self, "albumURIs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[PLSyncSaveJob albumURIs](self, "albumURIs", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v43;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v30), "description");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v28);
    }

    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("albums"));
  }
  -[PLSyncSaveJob facesInfo](self, "facesInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[PLSyncSaveJob facesInfo](self, "facesInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("facesInfo"));

  }
  -[PLSyncSaveJob sortToken](self, "sortToken");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[PLSyncSaveJob sortToken](self, "sortToken");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("sortToken"));

  }
  -[PLSyncSaveJob originalFileName](self, "originalFileName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[PLSyncSaveJob originalFileName](self, "originalFileName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("originalFileName"));

  }
  if (-[PLSyncSaveJob isSyncComplete](self, "isSyncComplete"))
    objc_msgSend(v3, "setObject:forKey:", *v11, CFSTR("isSyncComplete"));
  if (-[PLSyncSaveJob cleanupSyncState](self, "cleanupSyncState"))
    objc_msgSend(v3, "setObject:forKey:", *v11, CFSTR("cleanupSyncState"));
  -[PLSyncSaveJob cleanupBeforeDate](self, "cleanupBeforeDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[PLSyncSaveJob cleanupBeforeDate](self, "cleanupBeforeDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("cleanupBeforeDate"));

  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (void)processFacesWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  BOOL v14;
  __int16 v15;
  void (**v16)(id, _QWORD, void *, double, double, double, double);
  CGRect rect;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = (void (**)(id, _QWORD, void *, double, double, double, double))a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PLSyncSaveJob facesInfo](self, "facesInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKey:", CFSTR("faceAlbumUUID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("faceIndex"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("faceRectangle"));
        v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          memset(&rect, 0, sizeof(rect));
          if (CGRectMakeWithDictionaryRepresentation(v12, &rect))
          {
            v15 = objc_msgSend(v11, "intValue");
            v16[2](v16, v15, v10, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLSyncSaveJob;
  -[PLSyncSaveJob description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLSyncSaveJob isSyncComplete](self, "isSyncComplete"))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" sync complete"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[PLSyncSaveJob cleanupSyncState](self, "cleanupSyncState"))
    {
      -[PLSyncSaveJob cleanupBeforeDate](self, "cleanupBeforeDate");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" cleanup sync state (before: %@)"), v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (-[PLSyncSaveJob isVideo](self, "isVideo"))
        v6 = CFSTR("video");
      else
        v6 = CFSTR("photo");
      -[PLSyncSaveJob uuid](self, "uuid");
      v5 = objc_claimAutoreleasedReturnValue();
      -[PLSyncSaveJob originalAssetURL](self, "originalAssetURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" sync %@ %@: %@"), v6, v5, v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v3 = (void *)v5;
  }

  return v4;
}

- (NSArray)facesInfo
{
  return self->facesInfo;
}

- (void)setFacesInfo:(id)a3
{
  objc_storeStrong((id *)&self->facesInfo, a3);
}

- (NSURL)originalAssetURL
{
  return self->originalAssetURL;
}

- (void)setOriginalAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->originalAssetURL, a3);
}

- (NSURL)videoComplementURL
{
  return self->videoComplementURL;
}

- (void)setVideoComplementURL:(id)a3
{
  objc_storeStrong((id *)&self->videoComplementURL, a3);
}

- (BOOL)hasVideoComplement
{
  return self->hasVideoComplement;
}

- (void)setHasVideoComplement:(BOOL)a3
{
  self->hasVideoComplement = a3;
}

- (BOOL)isVideo
{
  return self->isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->isVideo = a3;
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)creationDate
{
  return self->creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)modificationDate
{
  return self->modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)albumURIs
{
  return self->albumURIs;
}

- (void)setAlbumURIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CLLocation)location
{
  return self->location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)sortToken
{
  return self->sortToken;
}

- (void)setSortToken:(id)a3
{
  objc_storeStrong((id *)&self->sortToken, a3);
}

- (NSString)originalFileName
{
  return self->originalFileName;
}

- (void)setOriginalFileName:(id)a3
{
  objc_storeStrong((id *)&self->originalFileName, a3);
}

- (BOOL)isSyncComplete
{
  return self->isSyncComplete;
}

- (void)setIsSyncComplete:(BOOL)a3
{
  self->isSyncComplete = a3;
}

- (BOOL)cleanupSyncState
{
  return self->_cleanupSyncState;
}

- (void)setCleanupSyncState:(BOOL)a3
{
  self->_cleanupSyncState = a3;
}

- (NSDate)cleanupBeforeDate
{
  return self->_cleanupBeforeDate;
}

- (void)setCleanupBeforeDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)finishedBlock
{
  return self->_finishedBlock;
}

- (void)setFinishedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedBlock, 0);
  objc_storeStrong((id *)&self->_cleanupBeforeDate, 0);
  objc_storeStrong((id *)&self->originalFileName, 0);
  objc_storeStrong((id *)&self->sortToken, 0);
  objc_storeStrong((id *)&self->location, 0);
  objc_storeStrong((id *)&self->albumURIs, 0);
  objc_storeStrong((id *)&self->modificationDate, 0);
  objc_storeStrong((id *)&self->creationDate, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->videoComplementURL, 0);
  objc_storeStrong((id *)&self->originalAssetURL, 0);
  objc_storeStrong((id *)&self->facesInfo, 0);
}

@end
