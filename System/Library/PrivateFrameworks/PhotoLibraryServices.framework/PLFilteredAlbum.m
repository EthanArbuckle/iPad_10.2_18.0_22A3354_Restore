@implementation PLFilteredAlbum

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)-[PLAlbumProtocol photoLibrary](self->_backingAlbum, "photoLibrary");
}

- (void)dealloc
{
  void *v3;
  NSMutableIndexSet *filteredIndexes;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PLFilteredAlbum setBackingAlbum:](self, "setBackingAlbum:", 0);
  -[PLFilteredAlbum set_assets:](self, "set_assets:", 0);
  filteredIndexes = self->_filteredIndexes;
  self->_filteredIndexes = 0;

  v5.receiver = self;
  v5.super_class = (Class)PLFilteredAlbum;
  -[PLFilteredAlbum dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "descriptionForAlbumFilter:parameters:", -[PLFilteredAlbum filter](self, "filter"), self->_filterParameters);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> album: <%@ %p> filter: %@"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)setBackingAlbum:(id)a3
{
  PLAlbumProtocol *v5;
  char v6;
  PLAlbumProtocol *v7;

  v5 = (PLAlbumProtocol *)a3;
  if (self->_backingAlbum != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_backingAlbum, a3);
    self->_backingAlbumSupportsEdits = -[PLAlbumProtocol conformsToProtocol:](self->_backingAlbum, "conformsToProtocol:", &unk_1EE399D18);
    v6 = -[PLAlbumProtocol conformsToProtocol:](self->_backingAlbum, "conformsToProtocol:", &unk_1EE3B1010);
    v5 = v7;
    self->_backingAlbumSupportsCloudShared = v6;
  }

}

- (NSMutableOrderedSet)_assets
{
  return (NSMutableOrderedSet *)objc_loadWeakRetained((id *)&self->_weak_assets);
}

- (void)set_assets:(id)a3
{
  objc_storeWeak((id *)&self->_weak_assets, a3);
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSNumber)kind
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (int)kindValue
{
  void *v2;
  int v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "kindValue");

  return v3;
}

- (NSMutableOrderedSet)mutableAssets
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFilteredAlbum.m"), 179, CFSTR("This album does not support mutations via mutableAssets: %@"), self);

  return 0;
}

- (NSMutableOrderedSet)userEditableAssets
{
  void *v3;
  void *v4;

  -[PLFilteredAlbum _assets](self, "_assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PLFilteredAlbum mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("filteredAssets"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFilteredAlbum set_assets:](self, "set_assets:", v4);

  }
  return -[PLFilteredAlbum _assets](self, "_assets");
}

- (unint64_t)approximateCount
{
  void *v2;
  unint64_t v3;

  -[PLFilteredAlbum filteredIndexes](self, "filteredIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)assetsCount
{
  void *v2;
  unint64_t v3;

  -[PLFilteredAlbum filteredIndexes](self, "filteredIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)hasUnseenContentBoolValue
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasUnseenContentBoolValue");

  return v3;
}

- (void)setHasUnseenContentBoolValue:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasUnseenContentBoolValue:", v3);

}

- (BOOL)isEmpty
{
  return -[PLFilteredAlbum assetsCount](self, "assetsCount") == 0;
}

- (unint64_t)photosCount
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = -[PLFilteredAlbum filter](self, "filter");
  if (v3 == 1)
    return -[PLFilteredAlbum approximateCount](self, "approximateCount");
  if ((v3 & 1) == 0 && (v3 & 6) != 0)
    return 0;
  v5 = (void *)MEMORY[0x19AEC1554]();
  -[PLFilteredAlbum assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (unint64_t)videosCount
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = -[PLFilteredAlbum filter](self, "filter");
  if (v3 == 2)
    return -[PLFilteredAlbum approximateCount](self, "approximateCount");
  if ((v3 & 2) == 0 && (v3 & 5) != 0)
    return 0;
  v5 = (void *)MEMORY[0x19AEC1554]();
  -[PLFilteredAlbum assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  NSLog(CFSTR("Warning: The -name property of albums is going away soon. Please use -localizedTitle instead. Album: %@"), a2, self);
  PLPrintSymbolicStackTrace();
  return -[PLFilteredAlbum localizedTitle](self, "localizedTitle");
}

- (NSObject)posterImage
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isLibrary
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLibrary");

  return v3;
}

- (BOOL)isCameraAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCameraAlbum");

  return v3;
}

- (BOOL)isPanoramasAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPanoramasAlbum");

  return v3;
}

- (BOOL)isPhotoStreamAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPhotoStreamAlbum");

  return v3;
}

- (BOOL)isCloudSharedAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudSharedAlbum");

  return v3;
}

- (BOOL)isPendingPhotoStreamAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPendingPhotoStreamAlbum");

  return v3;
}

- (BOOL)isStandInAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStandInAlbum");

  return v3;
}

- (BOOL)isFolder
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFolder");

  return v3;
}

- (BOOL)isInTrash
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInTrash");

  return v3;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOwnedCloudSharedAlbum");

  return v3;
}

- (BOOL)isFamilyCloudSharedAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFamilyCloudSharedAlbum");

  return v3;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultipleContributorCloudSharedAlbum");

  return v3;
}

- (BOOL)isRecentlyAddedAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRecentlyAddedAlbum");

  return v3;
}

- (BOOL)isUserLibraryAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserLibraryAlbum");

  return v3;
}

- (BOOL)isProjectAlbum
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProjectAlbum");

  return v3;
}

- (BOOL)canContributeToCloudSharedAlbum
{
  void *v3;
  char v4;
  void *v5;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isOwnedCloudSharedAlbum") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isMultipleContributorCloudSharedAlbum");

  }
  return v4;
}

- (BOOL)canShowComments
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowComments");

  return v3;
}

- (BOOL)canShowAvalancheStacks
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canShowAvalancheStacks");

  return v3;
}

- (NSArray)localizedLocationNames
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedLocationNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  void *v4;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "canPerformEditOperation:", a3);

  return a3;
}

- (BOOL)shouldDeleteWhenEmpty
{
  void *v2;
  char v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDeleteWhenEmpty");

  return v3;
}

- (NSString)importSessionID
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importSessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setImportSessionID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImportSessionID:", v4);

}

- (NSURL)groupURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://%@/?%@=%@&%@=%d"), CFSTR("assets-library"), CFSTR("group"), CFSTR("id"), v6, CFSTR("filter"), -[PLFilteredAlbum filter](self, "filter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (id)sortingComparator
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortingComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)batchFetchAssets:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "batchFetchAssets:", v4);

}

- (id)_cloudSharedBackingAlbum
{
  void *v2;

  if (self->_backingAlbumSupportsCloudShared)
  {
    -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSString)cloudGUID
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudGUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudGUID:", v4);

}

- (NSDictionary)cloudMetadata
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setCloudMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudMetadata:", v4);

}

- (NSString)cloudOwnerFirstName
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudOwnerFirstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudOwnerFirstName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudOwnerFirstName:", v4);

}

- (NSString)cloudOwnerLastName
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudOwnerLastName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudOwnerLastName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudOwnerLastName:", v4);

}

- (NSString)cloudOwnerFullName
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudOwnerFullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudOwnerFullName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudOwnerFullName:", v4);

}

- (NSString)cloudOwnerEmail
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudOwnerEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudOwnerEmail:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudOwnerEmail:", v4);

}

- (NSString)cloudOwnerHashedPersonID
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudOwnerHashedPersonID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudOwnerHashedPersonID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudOwnerHashedPersonID:", v4);

}

- (BOOL)cloudOwnerIsWhitelisted
{
  void *v2;
  char v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudOwnerIsWhitelisted");

  return v3;
}

- (void)setCloudOwnerIsWhitelisted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudOwnerIsWhitelisted:", v3);

}

- (NSDate)cloudSubscriptionDate
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudSubscriptionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setCloudSubscriptionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudSubscriptionDate:", v4);

}

- (NSString)publicURL
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPublicURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPublicURL:", v4);

}

- (NSString)cloudPersonID
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPersonID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCloudPersonID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudPersonID:", v4);

}

- (NSOrderedSet)invitationRecords
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invitationRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v3;
}

- (void)setInvitationRecords:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvitationRecords:", v4);

}

- (NSNumber)unseenAssetsCount
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unseenAssetsCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setUnseenAssetsCount:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnseenAssetsCount:", v4);

}

- (unint64_t)unseenAssetsCountIntegerValue
{
  void *v2;
  unint64_t v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unseenAssetsCountIntegerValue");

  return v3;
}

- (void)setUnseenAssetsCountIntegerValue:(unint64_t)a3
{
  id v4;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnseenAssetsCountIntegerValue:", a3);

}

- (NSNumber)cloudPublicURLEnabled
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPublicURLEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudPublicURLEnabled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudPublicURLEnabled:", v4);

}

- (NSNumber)cloudPublicURLEnabledLocal
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPublicURLEnabledLocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudPublicURLEnabledLocal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudPublicURLEnabledLocal:", v4);

}

- (NSNumber)cloudMultipleContributorsEnabled
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudMultipleContributorsEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudMultipleContributorsEnabled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudMultipleContributorsEnabled:", v4);

}

- (NSNumber)cloudMultipleContributorsEnabledLocal
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudMultipleContributorsEnabledLocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setCloudMultipleContributorsEnabledLocal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudMultipleContributorsEnabledLocal:", v4);

}

- (NSDate)cloudLastInterestingChangeDate
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudLastInterestingChangeDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setCloudLastInterestingChangeDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudLastInterestingChangeDate:", v4);

}

- (NSDate)cloudCreationDate
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setCloudCreationDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudCreationDate:", v4);

}

- (NSDate)cloudLastContributionDate
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudLastContributionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setCloudLastContributionDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudLastContributionDate:", v4);

}

- (int)cloudRelationshipStateValue
{
  void *v2;
  int v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudRelationshipStateValue");

  return v3;
}

- (int)cloudRelationshipStateLocalValue
{
  void *v2;
  int v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudRelationshipStateLocalValue");

  return v3;
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedSharedByLabelAllowsEmail:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)localizedSharedWithLabel
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedSharedWithLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)cloudFirstRecentBatchDate
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudFirstRecentBatchDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)cloudNotificationsEnabled
{
  void *v2;
  char v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudNotificationsEnabled");

  return v3;
}

- (void)setCloudNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudNotificationsEnabled:", v3);

}

- (NSOrderedSet)cloudAlbumSubscriberRecords
{
  void *v2;
  void *v3;

  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudAlbumSubscriberRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSOrderedSet *)v3;
}

- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateCloudLastInterestingChangeDateWithDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCloudLastInterestingChangeDateWithDate:", v4);

}

- (void)updateCloudLastContributionDateWithDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCloudLastContributionDateWithDate:", v4);

}

- (void)getUnseenStartMarkerIndex:(unint64_t *)a3 count:(unint64_t *)a4 showsProgress:(BOOL *)a5
{
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v16 = 0;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getUnseenStartMarkerIndex:count:showsProgress:", &v17, &v16, a5);

  v10 = -[PLFilteredAlbum assetsCount](self, "assetsCount");
  v11 = v17;
  if (a3)
  {
    v12 = v10 - 1;
    if (v17 < v10 - 1)
      v12 = v17;
    if (v12 < 0)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v11 = v12;
    }
    *a3 = v13;
  }
  if (a4)
  {
    v14 = v10 - v11;
    if (v16 < v10 - v11)
      v14 = v16;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = v16;
    else
      v15 = v14;
    *a4 = v15;
  }
}

- (void)userDeleteSubscriberRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLFilteredAlbum _cloudSharedBackingAlbum](self, "_cloudSharedBackingAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDeleteSubscriberRecord:", v4);

}

- (void)backingContextDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSMutableIndexSet *filteredIndexes;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v10, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C97840]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    -[PLFilteredAlbum setBackingAlbum:](self, "setBackingAlbum:", 0);
    -[PLFilteredAlbum setPredicate:](self, "setPredicate:", 0);
    -[PLFilteredAlbum willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assets"));
    -[PLFilteredAlbum set_assets:](self, "set_assets:", 0);
    filteredIndexes = self->_filteredIndexes;
    self->_filteredIndexes = 0;

    -[PLFilteredAlbum didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assets"));
  }

  objc_autoreleasePoolPop(v4);
}

- (int)pendingItemsCount
{
  void *v2;
  int v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pendingItemsCount");

  return v3;
}

- (int)pendingItemsType
{
  void *v2;
  int v3;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pendingItemsType");

  return v3;
}

- (void)_commonInitWithBackingAlbum:(id)a3 predicate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  PLIndexMapper *v11;
  PLIndexMapper *indexMapper;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  -[PLFilteredAlbum setBackingAlbum:](self, "setBackingAlbum:", v19);
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerDerivedAlbum:", self);

  }
  v11 = -[PLIndexMapper initWithDataSource:]([PLIndexMapper alloc], "initWithDataSource:", self);
  indexMapper = self->_indexMapper;
  self->_indexMapper = v11;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
  {
    -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFilteredAlbum setIsObservingContextChanges:](self, "setIsObservingContextChanges:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C978B0];
    objc_msgSend(v15, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_backingContextDidChange_, v17, v18);

  }
  -[PLFilteredAlbum setPredicate:](self, "setPredicate:", v6);
  objc_autoreleasePoolPop(v7);

}

- (PLFilteredAlbum)initWithBackingAlbum:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  PLFilteredAlbum *v8;
  PLFilteredAlbum *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLFilteredAlbum;
  v8 = -[PLFilteredAlbum init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[PLFilteredAlbum _commonInitWithBackingAlbum:predicate:](v8, "_commonInitWithBackingAlbum:predicate:", v6, v7);

  return v9;
}

- (PLFilteredAlbum)initWithBackingAlbum:(id)a3 filter:(int)a4 parameters:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  PLFilteredAlbum *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLFilteredAlbum;
  v10 = -[PLFilteredAlbum init](&v15, sel_init);
  if (v10)
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(v8, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateForAlbumFilter:parameters:photoLibrary:", v6, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLFilteredAlbum _commonInitWithBackingAlbum:predicate:](v10, "_commonInitWithBackingAlbum:predicate:", v8, v13);
    -[PLFilteredAlbum setFilter:](v10, "setFilter:", v6);
    objc_storeStrong((id *)&v10->_filterParameters, a5);

  }
  return v10;
}

- (PLIndexMapper)indexMapper
{
  return self->_indexMapper;
}

- (NSIndexSet)filteredIndexes
{
  NSMutableIndexSet *filteredIndexes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableIndexSet *v8;
  NSMutableIndexSet *v9;

  filteredIndexes = self->_filteredIndexes;
  if (!filteredIndexes)
  {
    v4 = (void *)MEMORY[0x19AEC1554](0, a2);
    v5 = (void *)objc_opt_class();
    -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFilteredAlbum predicate](self, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredIndexesInAlbum:predicate:", v6, v7);
    v8 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();

    v9 = self->_filteredIndexes;
    self->_filteredIndexes = v8;

    objc_autoreleasePoolPop(v4);
    filteredIndexes = self->_filteredIndexes;
  }
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](filteredIndexes, "copy");
}

- (NSObject)cachedIndexMapState
{
  return self->_filteredIndexes;
}

- (id)currentStateForChange
{
  return (id)-[NSMutableIndexSet copy](self->_filteredIndexes, "copy");
}

- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFilteredAlbum predicate](self, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "evaluateWithObject:", v7);

  return (char)v5;
}

- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4
{
  id v5;
  BOOL v6;
  NSMutableIndexSet *filteredIndexes;

  v5 = a3;
  -[PLFilteredAlbum set_assets:](self, "set_assets:", 0);
  v6 = -[PLIndexMapper applyContainerChangeNotification:changeTypes:toFilteredIndexes:](self->_indexMapper, "applyContainerChangeNotification:changeTypes:toFilteredIndexes:", v5, 15, self->_filteredIndexes);

  if (!v6)
  {
    filteredIndexes = self->_filteredIndexes;
    self->_filteredIndexes = 0;

  }
  return 1;
}

- (Class)derivedChangeNotificationClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)countOfFilteredAssets
{
  void *v2;
  unint64_t v3;

  -[PLFilteredAlbum filteredIndexes](self, "filteredIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)indexInFilteredAssetsOfObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = a3;
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  v8 = -[PLIndexMapper indexForBackingIndex:](self->_indexMapper, "indexForBackingIndex:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = v8;
  if (v7 != -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", v8))
    return 0x7FFFFFFFFFFFFFFFLL;
  return v9;
}

- (id)objectInFilteredAssetsAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filteredAssetsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIndexMapper backingIndexesForIndexes:](self->_indexMapper, "backingIndexesForIndexes:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_editableBackingAlbum
{
  void *v2;

  if (self->_backingAlbumSupportsEdits)
  {
    -[PLFilteredAlbum backingAlbum](self, "backingAlbum");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)insertObject:(id)a3 inFilteredAssetsAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PLFilteredAlbum _editableBackingAlbum](self, "_editableBackingAlbum");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userEditableAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v6, -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a4));

}

- (void)removeObjectFromFilteredAssetsAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;

  -[PLFilteredAlbum _editableBackingAlbum](self, "_editableBackingAlbum");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userEditableAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));

}

- (void)insertFilteredAssets:(id)a3 atIndexes:(id)a4
{
  PLIndexMapper *indexMapper;
  id v7;
  void *v8;
  void *v9;
  id v10;

  indexMapper = self->_indexMapper;
  v7 = a3;
  -[PLIndexMapper backingIndexesForIndexes:](indexMapper, "backingIndexesForIndexes:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLFilteredAlbum _editableBackingAlbum](self, "_editableBackingAlbum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userEditableAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertObjects:atIndexes:", v7, v10);

}

- (void)removeFilteredAssetsAtIndexes:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PLIndexMapper backingIndexesForIndexes:](self->_indexMapper, "backingIndexesForIndexes:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLFilteredAlbum _editableBackingAlbum](self, "_editableBackingAlbum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEditableAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v6);

}

- (void)replaceObjectInFilteredAssetsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[PLFilteredAlbum _editableBackingAlbum](self, "_editableBackingAlbum");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userEditableAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3), v6);

}

- (void)replaceFilteredAssetsAtIndexes:(id)a3 withFilteredValues:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PLFilteredAlbum _editableBackingAlbum](self, "_editableBackingAlbum");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userEditableAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIndexMapper backingIndexesForIndexes:](self->_indexMapper, "backingIndexesForIndexes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "replaceObjectsAtIndexes:withObjects:", v9, v6);
}

- (void)insertInternalUserEditableAssets:(id)a3 atIndexes:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 trimmedVideoPathInfo:(id)a7 commentText:(id)a8
{
  PLIndexMapper *indexMapper;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;

  indexMapper = self->_indexMapper;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  -[PLIndexMapper backingIndexesForIndexes:](indexMapper, "backingIndexesForIndexes:", a4);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[PLFilteredAlbum _editableBackingAlbum](self, "_editableBackingAlbum");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "insertInternalUserEditableAssets:atIndexes:assetsSharingInfos:customExportsInfo:trimmedVideoPathInfo:commentText:", v19, v21, v18, v17, v16, v15);

}

- (PLAlbumProtocol)backingAlbum
{
  return self->_backingAlbum;
}

- (int)filter
{
  return self->filter;
}

- (void)setFilter:(int)a3
{
  self->filter = a3;
}

- (NSPredicate)predicate
{
  return self->predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->predicate, a3);
}

- (BOOL)isObservingContextChanges
{
  return self->isObservingContextChanges;
}

- (void)setIsObservingContextChanges:(BOOL)a3
{
  self->isObservingContextChanges = a3;
}

- (NSArray)filterParameters
{
  return self->_filterParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterParameters, 0);
  objc_storeStrong((id *)&self->predicate, 0);
  objc_storeStrong((id *)&self->_backingAlbum, 0);
  objc_destroyWeak((id *)&self->_weak_assets);
  objc_storeStrong((id *)&self->_filteredIndexes, 0);
  objc_storeStrong((id *)&self->_indexMapper, 0);
}

+ (id)filteredAlbum:(id)a3 filter:(int)a4
{
  return (id)objc_msgSend(a1, "filteredAlbum:filter:parameters:", a3, *(_QWORD *)&a4, 0);
}

+ (id)filteredAlbum:(id)a3 filter:(int)a4 parameters:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v8;
    if (objc_msgSend(v8, "filter") == (_DWORD)v6)
    {
      objc_msgSend(v8, "filterParameters");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10
        || (v11 = (void *)v10,
            objc_msgSend(v8, "filterParameters"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "isEqualToArray:", v9),
            v12,
            v11,
            (v13 & 1) != 0))
      {
        v14 = v8;
        goto LABEL_12;
      }
    }
    objc_msgSend(v8, "backingAlbum");
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v15;
  }
  if ((_DWORD)v6 && v8)
  {
    v16 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithBackingAlbum:filter:parameters:", v8, v6, v9);
  }
  else
  {
    v16 = v8;
    v8 = v16;
  }
  v14 = v16;
LABEL_12:

  return v14;
}

+ (id)filteredAlbum:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBackingAlbum:predicate:", v7, v6);

  return v8;
}

+ (id)filteredAlbum:(id)a3 intersectFilter:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v4 = objc_msgSend(v7, "filter") & v4;
    objc_msgSend(v7, "filterParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(a1, "filteredAlbum:filter:parameters:", v6, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unfilteredAlbum:(id)a3
{
  return (id)objc_msgSend(a1, "filteredAlbum:filter:parameters:", a3, 0, 0);
}

+ (id)predicateForAlbumFilter:(int)a3 parameters:(id)a4 photoLibrary:(id)a5
{
  __int16 v6;
  id v9;
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
  id v27;
  uint64_t v28;
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
  void *v40;
  _QWORD v41[3];

  v6 = a3;
  v41[2] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v29);

    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v30);

  if ((v6 & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
LABEL_5:
  if ((v6 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPhotoBoothAsset"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudPlaceholderKind != %d AND cloudPlaceholderKind != %d"), 2, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  if ((v6 & 0x40) != 0 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFilteredAlbum.m"), 791, CFSTR("Parameter for PLAlbumFilterHideNonRecentCloudAssets must be a date but it's %@"), v17);

    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudHasUnseenComments = YES || cloudBatchPublishDate >= %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v18);

  }
  if ((v6 & 0x100) != 0)
  {
    +[PLManagedAsset fetchPredicateForLegacyRequiredResourcesLocallyAvailable:photoLibrary:](PLManagedAsset, "fetchPredicateForLegacyRequiredResourcesLocallyAvailable:photoLibrary:", 0, v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v31);

    if ((v6 & 0x200) == 0)
    {
LABEL_18:
      if ((v6 & 0x400) == 0)
        goto LABEL_19;
      goto LABEL_35;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(trashedState) == %d"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v32);

  if ((v6 & 0x400) == 0)
  {
LABEL_19:
    if ((v6 & 0x2000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(hidden) == 0"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v33);

  if ((v6 & 0x2000) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPlaceholderAsset"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

  }
LABEL_21:
  if ((v6 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPhotoStreamAsset"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v20);

  }
  if ((v6 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v21);

  }
  if ((v6 & 0x80) != 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kind"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v23;
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCloudSharedAsset"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "orPredicateWithSubpredicates:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v26);

  }
  v27 = (id)objc_msgSend(v11, "count");
  v28 = objc_msgSend(v15, "count");
  if (v27)
  {
    if (v27 == (id)1)
      objc_msgSend(v11, "objectAtIndex:", 0);
    else
      objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v11);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v27)
    {
      v36 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v27, v34, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "andPredicateWithSubpredicates:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v27 = (id)v38;
    }
    else
    {
      v27 = v34;
    }

  }
  return v27;
}

+ (id)descriptionForAlbumFilter:(int)a3 parameters:(id)a4
{
  __int16 v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;

  v4 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "addObject:", CFSTR("Photos"));
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v7, "addObject:", CFSTR("Videos"));
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v7, "addObject:", CFSTR("Audio"));
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v7, "addObject:", CFSTR("Unknown"));
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v7, "addObject:", CFSTR("HidePlaceholders"));
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v7, "addObject:", CFSTR("HideNonRecentCloudAssets"));
  if ((v4 & 0x100) == 0)
  {
LABEL_8:
    if ((v4 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v7, "addObject:", CFSTR("HideAssetsWithoutLegacyRequiredResourcesLocallyAvailable"));
  if ((v4 & 0x200) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v7, "addObject:", CFSTR("PLAlbumFilterHideTrashed"));
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v7, "addObject:", CFSTR("PLAlbumFilterShowPhotoBooth"));
  if ((v4 & 0x800) == 0)
  {
LABEL_11:
    if ((v4 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_25:
  objc_msgSend(v7, "addObject:", CFSTR("PLAlbumFilterHidePhotoStream"));
  if ((v4 & 0x1000) != 0)
LABEL_12:
    objc_msgSend(v7, "addObject:", CFSTR("PLAlbumFilterHideMomentShared"));
LABEL_13:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("+"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR(" params: %@"), v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (__CFString *)v10;
    }
  }
  else
  {
    v9 = CFSTR("{none}");
  }

  return v9;
}

+ (id)filteredIndexesInAlbum:(id)a3 predicate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  SEL v25;
  id v26;
  _QWORD v27[4];

  v7 = a3;
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v9 = (void *)MEMORY[0x19AEC1554](),
        objc_msgSend(v7, "filteredIndexesForPredicate:", v8),
        v10 = (id)objc_claimAutoreleasedReturnValue(),
        objc_autoreleasePoolPop(v9),
        !v10))
  {
    objc_msgSend(v7, "assets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "filteredArrayUsingPredicate:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "count");
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__PLFilteredAlbum_filteredIndexesInAlbum_predicate___block_invoke;
    v20[3] = &unk_1E3664880;
    v23 = v27;
    v24 = v15;
    v16 = v12;
    v21 = v16;
    v25 = a2;
    v26 = a1;
    v17 = v14;
    v22 = v17;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);
    v18 = v22;
    v10 = v17;

    _Block_object_dispose(v27, 8);
  }

  return v10;
}

uint64_t __52__PLFilteredAlbum_filteredIndexesInAlbum_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:inRange:", a2, v3, *(_QWORD *)(a1 + 56) - v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("PLFilteredAlbum.m"), 946, &stru_1E36789C0);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  return objc_msgSend(*(id *)(a1 + 40), "addIndex:", v4);
}

@end
