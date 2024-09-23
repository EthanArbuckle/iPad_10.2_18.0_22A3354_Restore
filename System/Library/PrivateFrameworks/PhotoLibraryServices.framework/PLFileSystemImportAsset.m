@implementation PLFileSystemImportAsset

- (PLFileSystemImportAsset)initWithDestinationAlbum:(id)a3 assetKind:(int)a4
{
  id v7;
  PLFileSystemImportAsset *v8;
  NSMutableSet *v9;
  NSMutableSet *urls;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLFileSystemImportAsset;
  v8 = -[PLFileSystemImportAsset init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    urls = v8->_urls;
    v8->_urls = v9;

    objc_storeStrong((id *)&v8->_destinationAlbum, a3);
    v8->_assetKind = a4;
  }

  return v8;
}

- (PLFileSystemImportAsset)initWithAssetPayload:(id)a3
{
  id v5;
  PLFileSystemImportAsset *v6;
  NSMutableSet *v7;
  NSMutableSet *urls;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFileSystemImportAsset;
  v6 = -[PLFileSystemImportAsset init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    urls = v6->_urls;
    v6->_urls = v7;

    objc_storeStrong((id *)&v6->_assetPayload, a3);
    -[PLFileSystemImportAsset setAssetKind:](v6, "setAssetKind:", objc_msgSend(MEMORY[0x1E0D73310], "mapSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", objc_msgSend(v5, "savedAssetType"), 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        4,
        0));
  }

  return v6;
}

- (BOOL)isCameraKit
{
  return -[PLFileSystemImportAsset assetKind](self, "assetKind") == 1;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  int v5;
  int64_t v6;
  unsigned int v7;
  NSString *path;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;

  v4 = a3;
  v5 = -[PLFileSystemImportAsset assetKind](self, "assetKind");
  if (v5 == objc_msgSend(v4, "assetKind"))
  {
    if (!self->_pathContainsDCIM || *((_BYTE *)v4 + 16))
    {
      if (self->_pathContainsDCIM || !*((_BYTE *)v4 + 16))
      {
        path = self->_path;
        v10 = v4[1];
        v11 = path;
        v12 = -[NSString compare:](v11, "compare:", v10);
        if (v12 == -1)
        {
          v6 = 1;
        }
        else
        {
          v6 = v12;
          if (v12 == 1)
            v6 = -1;
        }

      }
      else
      {
        v6 = 1;
      }
    }
    else
    {
      v6 = -1;
    }
  }
  else
  {
    v7 = -[PLFileSystemImportAsset assetKind](self, "assetKind");
    if (v7 < objc_msgSend(v4, "assetKind"))
      v6 = -1;
    else
      v6 = 1;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSMutableSet allObjects](self->_urls, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p (%@)>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)urls
{
  return (NSSet *)self->_urls;
}

- (void)addURL:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSString *v10;
  NSString *path;
  void *v12;
  id v13;

  v6 = a3;
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFileSystemImportAsset.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

    v6 = 0;
  }
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLockedResourceTransferRecovery lockedTransferRecoveryMarkerFileExtension](PLLockedResourceTransferRecovery, "lockedTransferRecoveryMarkerFileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&self->_lockedResourceTransferMarkerFileURL, a3);
  }
  else
  {
    -[NSMutableSet addObject:](self->_urls, "addObject:", v13);
    if (!self->_path)
    {
      objc_msgSend(v13, "path");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      path = self->_path;
      self->_path = v10;

      self->_pathContainsDCIM = -[NSString containsString:](self->_path, "containsString:", CFSTR("DCIM"));
    }
  }

}

- (void)addURLs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PLFileSystemImportAsset addURL:](self, "addURL:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)isInterruptedLockedResourceTransfer
{
  return self->_lockedResourceTransferMarkerFileURL != 0;
}

- (PLAlbumProtocol)destinationAlbum
{
  return self->_destinationAlbum;
}

- (void)setDestinationAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_destinationAlbum, a3);
}

- (int)assetKind
{
  return self->_assetKind;
}

- (void)setAssetKind:(int)a3
{
  self->_assetKind = a3;
}

- (PLAssetJournalEntryPayload)assetPayload
{
  return self->_assetPayload;
}

- (NSURL)lockedResourceTransferMarkerFileURL
{
  return self->_lockedResourceTransferMarkerFileURL;
}

- (PLLockedResourceTransferRecovery)lockedResourceTransferRecovery
{
  return self->_lockedResourceTransferRecovery;
}

- (void)setLockedResourceTransferRecovery:(id)a3
{
  objc_storeStrong((id *)&self->_lockedResourceTransferRecovery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedResourceTransferRecovery, 0);
  objc_storeStrong((id *)&self->_lockedResourceTransferMarkerFileURL, 0);
  objc_storeStrong((id *)&self->_assetPayload, 0);
  objc_storeStrong((id *)&self->_destinationAlbum, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
