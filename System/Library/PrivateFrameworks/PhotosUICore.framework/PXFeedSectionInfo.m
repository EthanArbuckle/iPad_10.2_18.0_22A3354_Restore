@implementation PXFeedSectionInfo

- (PXFeedSectionInfo)initWithCloudFeedEntry:(id)a3
{
  id v5;
  PXFeedSectionInfo *v6;
  PXFeedSectionInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFeedSectionInfo;
  v6 = -[PXFeedSectionInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cloudFeedEntry, a3);

  return v7;
}

- (PLPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLPhotoLibrary *)v3;
}

- (void)reload
{
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionInfo.m"), 93, CFSTR("Attempted to reload PXFeedSectionInfo on background thread!"));

  }
  -[PXFeedSectionInfo updateFromCloudFeedEntry](self, "updateFromCloudFeedEntry");
  -[PXFeedSectionInfo setLoaded:](self, "setLoaded:", 1);
  -[PXFeedSectionInfo setCachedInboxModelType:](self, "setCachedInboxModelType:", 0);
  -[PXFeedSectionInfo inboxModelType](self, "inboxModelType");
}

- (void)updateFromCloudFeedEntry
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__47686;
  v16 = __Block_byref_object_dispose__47687;
  v17 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __45__PXFeedSectionInfo_updateFromCloudFeedEntry__block_invoke;
  v9 = &unk_1E5148AA8;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "performBlockAndWait:", &v6);

  -[PXFeedSectionInfo setDate:](self, "setDate:", v13[5], v6, v7, v8, v9);
  _Block_object_dispose(&v12, 8);

}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)hasMultipleAssetsForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)hasPlayableAssetForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)assetsForItemAtIndex:(int64_t)a3 maximumCount:(int64_t)a4
{
  return 0;
}

- (id)captionForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)batchIDForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)indexOfFirstItemFromLastBatch
{
  return 0;
}

- (id)commentForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)commentTextForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)commentsForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)likesForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (void)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4
{
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
}

- (void)getCommentCount:(unint64_t *)a3 likeCount:(unint64_t *)a4
{
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
}

- (NSCountedSet)countsByAssetDisplayType
{
  return 0;
}

- (BOOL)areAllAssetsLiked
{
  return 0;
}

- (BOOL)containsAsset:(id)a3
{
  return 0;
}

- (int64_t)indexOfItemWithAsset:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)indexOfItemWithComment:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)inboxModelType
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  int v11;

  v3 = -[PXFeedSectionInfo cachedInboxModelType](self, "cachedInboxModelType");
  if (!v3)
  {
    v3 = 0;
    switch(-[PXFeedSectionInfo sectionType](self, "sectionType"))
    {
      case 0:
        v3 = 3;
        break;
      case 1:
        v3 = -[PXFeedSectionInfo _inboxModelTypeForCloudCommentType](self, "_inboxModelTypeForCloudCommentType");
        break;
      case 2:
        v3 = 6;
        break;
      case 3:
      case 5:
        break;
      case 4:
        *(_QWORD *)buf = 0;
        v9 = buf;
        v10 = 0x2020000000;
        v11 = 0;
        -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __35__PXFeedSectionInfo_inboxModelType__block_invoke;
        v7[3] = &unk_1E5148AA8;
        v7[4] = self;
        v7[5] = buf;
        objc_msgSend(v5, "performBlockAndWait:", v7);

        if (*((_DWORD *)v9 + 6) == 2)
          v3 = 4;
        else
          v3 = 5;
        _Block_object_dispose(buf, 8);
        break;
      default:
        PLUIGetLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "Invalid section type", buf, 2u);
        }

        v3 = 0;
        break;
    }
    -[PXFeedSectionInfo setCachedInboxModelType:](self, "setCachedInboxModelType:", v3);
  }
  return v3;
}

- (int64_t)_inboxModelTypeForCloudCommentType
{
  int64_t v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  _BOOL8 v9;
  int v10;
  BOOL v11;
  _BOOL4 v12;
  char v13;
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = -[PXFeedSectionInfo numberOfItems](self, "numberOfItems");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__PXFeedSectionInfo__inboxModelTypeForCloudCommentType__block_invoke;
  v20[3] = &unk_1E5140068;
  v20[4] = self;
  v20[5] = &v25;
  v20[6] = &v21;
  v20[7] = v3;
  objc_msgSend(v4, "performBlockAndWait:", v20);

  v5 = v26[3];
  v6 = v5 == 0;
  v7 = v22[3];
  v8 = v5 > 1;
  v9 = v5 == 1;
  v10 = v8;
  v11 = v7 == 0;
  if (!v7)
    v6 = 0;
  v12 = v7 == 0;
  if (v11)
    v13 = 0;
  else
    v13 = v10;
  v14 = v10 & v12;
  v11 = v14 == 0;
  v15 = v6 | v14 | v13;
  v16 = 7;
  if (v11)
    v16 = 8;
  v11 = !v6;
  v17 = 2;
  if (v11)
    v17 = v16;
  if ((v15 & 1) != 0)
    v18 = v17;
  else
    v18 = v9;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v18;
}

- (NSString)uuid
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URIRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)title
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__47686;
  v15 = __Block_byref_object_dispose__47687;
  v16 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__PXFeedSectionInfo_title__block_invoke;
  v8[3] = &unk_1E5148AA8;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (NSOrderedSet)assets
{
  return 0;
}

- (NSString)localizedTitle
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__47686;
  v15 = __Block_byref_object_dispose__47687;
  v16 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PXFeedSectionInfo_localizedTitle__block_invoke;
  v8[3] = &unk_1E5148AA8;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (unint64_t)assetsCount
{
  return 0;
}

- (unint64_t)photosCount
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionInfo.m"), 355, CFSTR("%s not implemented yet"), "-[PXFeedSectionInfo photosCount]");

  return 0;
}

- (unint64_t)videosCount
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionInfo.m"), 360, CFSTR("%s not implemented yet"), "-[PXFeedSectionInfo videosCount]");

  return 0;
}

- (BOOL)isEmpty
{
  return -[PXFeedSectionInfo numberOfItems](self, "numberOfItems") == 0;
}

- (BOOL)isMine
{
  return 0;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PXFeedSectionInfo_canPerformEditOperation___block_invoke;
  v9[3] = &unk_1E5141AE0;
  v11 = &v13;
  v7 = v5;
  v10 = v7;
  v12 = a3;
  objc_msgSend(v6, "performBlockAndWait:", v9);

  LOBYTE(a3) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return a3;
}

- (BOOL)canShowComments
{
  return 1;
}

- (BOOL)canShowAvalancheStacks
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (id)sharedAlbumWithGUID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend((id)cacheOfSharedAlbumsByGUIDs, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    v7 = (void *)MEMORY[0x1E0D71628];
    -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudSharedAlbumWithGUID:inLibrary:", v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)cacheOfSharedAlbumsByGUIDs, "setObject:forKey:", v6, v4);
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v9)
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)transientIdentifier
{
  NSString *transientIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  transientIdentifier = self->_transientIdentifier;
  if (!transientIdentifier)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_transientIdentifier;
    self->_transientIdentifier = v5;

    transientIdentifier = self->_transientIdentifier;
  }
  return transientIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  PXFeedSectionInfo *v4;
  PXFeedSectionInfo *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXFeedSectionInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXFeedSectionInfo uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFeedSectionInfo uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (PLCloudFeedEntry)cloudFeedEntry
{
  return self->_cloudFeedEntry;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PLCloudSharedAlbumProtocol)sharedAlbum
{
  return self->_sharedAlbum;
}

- (void)setSharedAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAlbum, a3);
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PLCloudSharedAlbumInvitationRecord)invitationRecord
{
  return self->_invitationRecord;
}

- (void)setInvitationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_invitationRecord, a3);
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_numberOfItems = a3;
}

- (BOOL)shouldBeVisibleWhenEmpty
{
  return self->_shouldBeVisibleWhenEmpty;
}

- (void)setShouldBeVisibleWhenEmpty:(BOOL)a3
{
  self->_shouldBeVisibleWhenEmpty = a3;
}

- (NSIndexSet)excludedAssetIndexes
{
  return self->_excludedAssetIndexes;
}

- (void)setExcludedAssetIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)cachedInboxModelType
{
  return self->_cachedInboxModelType;
}

- (void)setCachedInboxModelType:(int64_t)a3
{
  self->_cachedInboxModelType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedAssetIndexes, 0);
  objc_storeStrong((id *)&self->_invitationRecord, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_sharedAlbum, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_cloudFeedEntry, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
}

uint64_t __45__PXFeedSectionInfo_canPerformEditOperation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canPerformEditOperation:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __35__PXFeedSectionInfo_localizedTitle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __26__PXFeedSectionInfo_title__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__PXFeedSectionInfo__inboxModelTypeForCloudCommentType__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (*(uint64_t *)(a1 + 56) >= 1)
  {
    v2 = 0;
    while (1)
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "typeForItemAtIndex:", v2);
      if (v3 == 2)
        break;
      if (v3 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "commentForItemAtIndex:", v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "isMyComment");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "BOOLValue");

        if ((v6 & 1) == 0)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        goto LABEL_8;
      }
LABEL_9:
      if (++v2 >= *(_QWORD *)(a1 + 56))
        return;
    }
    objc_msgSend(*(id *)(a1 + 32), "cloudFeedEntry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isMyComment == NO AND cloudFeedLikeCommentEntry == %@"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(MEMORY[0x1E0D71638], "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setFetchLimit:", 1);
    objc_msgSend(v10, "setPredicate:", v7);
    objc_msgSend(v10, "setResultType:", 4);
    objc_msgSend(v10, "setIncludesPropertyValues:", 0);
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v12, "countForFetchRequest:error:", v10, 0);
LABEL_8:

    goto LABEL_9;
  }
}

void __35__PXFeedSectionInfo_inboxModelType__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "invitationRecord");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invitationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "intValue");

}

void __45__PXFeedSectionInfo_updateFromCloudFeedEntry__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entryDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)sectionInfoWithCloudFeedEntry:(id)a3
{
  id v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PXFeedSectionInfo_sectionInfoWithCloudFeedEntry___block_invoke;
  v12[3] = &unk_1E5148AA8;
  v14 = &v15;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v12);

  switch(v16[3])
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXFeedSectionInfo.m"), 72, CFSTR("%s: Unknown entry type"), "+[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:]");

      abort();
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      v8 = (objc_class *)objc_opt_class();
      break;
    default:
      v8 = 0;
      break;
  }
  v9 = (void *)objc_msgSend([v8 alloc], "initWithCloudFeedEntry:", v7);

  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (void)beginCachingSharedAlbumsByGUIDs
{
  id v3;
  void *v4;

  if (!sharedAlbumsCacheRequestCount++)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v4 = (void *)cacheOfSharedAlbumsByGUIDs;
    cacheOfSharedAlbumsByGUIDs = (uint64_t)v3;

  }
}

+ (void)endCachingSharedAlbumsByGUIDs
{
  void *v2;

  if (!--sharedAlbumsCacheRequestCount)
  {
    v2 = (void *)cacheOfSharedAlbumsByGUIDs;
    cacheOfSharedAlbumsByGUIDs = 0;

  }
}

uint64_t __51__PXFeedSectionInfo_sectionInfoWithCloudFeedEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "entryType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)inboxModelTitle
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  __CFString *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__300158;
  v11 = __Block_byref_object_dispose__300159;
  v12 = &stru_1E5149688;
  if (-[PXFeedSectionInfo isLoaded](self, "isLoaded"))
  {
    -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__PXFeedSectionInfo_PXInboxModel__inboxModelTitle__block_invoke;
    v6[3] = &unk_1E5148AA8;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v3, "performBlockAndWait:", v6);

  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (NSArray)senderNames
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__300158;
  v12 = __Block_byref_object_dispose__300159;
  v13 = 0;
  if (-[PXFeedSectionInfo isLoaded](self, "isLoaded"))
  {
    -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__PXFeedSectionInfo_PXInboxModel__senderNames__block_invoke;
    v7[3] = &unk_1E5148AA8;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(v3, "performBlockAndWait:", v7);

  }
  v4 = (void *)v9[5];
  if (!v4)
  {
    v9[5] = MEMORY[0x1E0C9AA60];
    v4 = (void *)v9[5];
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (BOOL)isSeen
{
  return 1;
}

- (NSArray)leftPreviewItems
{
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = -[PXFeedSectionInfo inboxModelType](self, "inboxModelType");
  if (v4 > 0xA)
  {
    v6 = 0;
    goto LABEL_13;
  }
  if (((1 << v4) & 0x1BE) != 0)
  {
    -[PXFeedSectionInfo assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "count"))
    {
      v7 = objc_msgSend(v6, "count");
      if (v7 >= 3)
        v8 = 3;
      else
        v8 = v7;
      objc_msgSend(v6, "subarrayWithRange:", 0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D71880];
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pl_PHAssetsForManagedAssets:photoLibrary:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  if (v4 != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionInfo+PXInboxModel.m"), 128, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  +[PXFeedSectionInfo defaultPreviewImage](PXFeedSectionInfo, "defaultPreviewImage");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  v6 = 0;
LABEL_14:

  return (NSArray *)v12;
}

- (void)fetchLeftPreviewItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__300158;
  v11[4] = __Block_byref_object_dispose__300159;
  v12 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke;
  v10[3] = &unk_1E5148AA8;
  v10[4] = self;
  v10[5] = v11;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke_4;
  v7[3] = &unk_1E5149038;
  v6 = v4;
  v8 = v6;
  v9 = v11;
  objc_msgSend(v5, "performBlock:completionHandler:", v10, v7);

  _Block_object_dispose(v11, 8);
}

- (NSArray)assetsForOneUp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXFeedSectionInfo assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pl_PHAssetsForManagedAssets:photoLibrary:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSString)ownerFirstName
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = -[PXFeedSectionInfo inboxModelType](self, "inboxModelType");
  if (v3 == 6)
  {
    -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
LABEL_6:
    objc_msgSend(v4, "cloudOwnerFirstName");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    -[PXFeedSectionInfo assets](self, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    goto LABEL_6;
  }
  -[PXFeedSectionInfo invitationRecord](self, "invitationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeFirstName");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v6;

  return (NSString *)v8;
}

- (NSString)ownerLastName
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = -[PXFeedSectionInfo inboxModelType](self, "inboxModelType");
  if (v3 == 6)
  {
    -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
LABEL_6:
    objc_msgSend(v4, "cloudOwnerLastName");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    -[PXFeedSectionInfo assets](self, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    goto LABEL_6;
  }
  -[PXFeedSectionInfo invitationRecord](self, "invitationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeLastName");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v6;

  return (NSString *)v8;
}

- (NSString)ownerEmail
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[PXFeedSectionInfo inboxModelType](self, "inboxModelType");
  if (v3 == 6)
  {
    -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
LABEL_6:
    objc_msgSend(v4, "cloudOwnerEmail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    -[PXFeedSectionInfo assets](self, "assets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    goto LABEL_6;
  }
  -[PXFeedSectionInfo invitationRecord](self, "invitationRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inviteeEmails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (NSString *)v7;
}

- (NSString)keyCommentGUID
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__300158;
  v11 = __Block_byref_object_dispose__300159;
  v12 = 0;
  if (-[PXFeedSectionInfo numberOfItems](self, "numberOfItems") >= 1)
  {
    -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__PXFeedSectionInfo_PXInboxModel__keyCommentGUID__block_invoke;
    v6[3] = &unk_1E5148AA8;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v3, "performBlockAndWait:", v6);

  }
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)_usersInvolved
{
  void *v3;

  switch(-[PXFeedSectionInfo inboxModelType](self, "inboxModelType"))
  {
    case 1:
      -[PXFeedSectionInfo _usersInvolvedForComment](self, "_usersInvolvedForComment");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[PXFeedSectionInfo _usersInvolvedForLike](self, "_usersInvolvedForLike");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[PXFeedSectionInfo _usersInvolvedForPost](self, "_usersInvolvedForPost");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
    case 5:
      -[PXFeedSectionInfo _usersInvolvedForResponse](self, "_usersInvolvedForResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[PXFeedSectionInfo _usersInvolvedForInvitation](self, "_usersInvolvedForInvitation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
    case 8:
      -[PXFeedSectionInfo _usersInvolvedForCoalescedEntry](self, "_usersInvolvedForCoalescedEntry");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = (void *)MEMORY[0x1E0C9AA60];
      break;
  }
  return v3;
}

- (id)_usersInvolvedForLike
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXFeedSectionInfo likesForItemAtIndex:](self, "likesForItemAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "isMyComment", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "commenterDisplayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
            objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_usersInvolvedForComment
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__300158;
  v12 = __Block_byref_object_dispose__300159;
  v13 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PXFeedSectionInfo_PXInboxModel___usersInvolvedForComment__block_invoke;
  v7[3] = &unk_1E5148AA8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  objc_msgSend((id)v9[5], "commenterDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)_usersInvolvedForPost
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[PXFeedSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "cloudIsMyAsset") & 1) != 0
    || (objc_msgSend(v2, "cloudOwnerDisplayName"), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v4 = (void *)v3;
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_usersInvolvedForInvitation
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)_usersInvolvedForResponse
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PXFeedSectionInfo invitationRecord](self, "invitationRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inviteeDisplayNameIncludingEmail:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)_usersInvolvedForCoalescedEntry
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    objc_msgSend(v3, "entryLikeComments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v3, "entryComments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionOrderedSet:", v6);

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "isMyComment", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "BOOLValue");

          if ((v15 & 1) == 0)
          {
            objc_msgSend(v13, "commenterDisplayName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "length"))
              objc_msgSend(v7, "addObject:", v16);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

void __59__PXFeedSectionInfo_PXInboxModel___usersInvolvedForComment__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfItems");
  if (v2 >= 1)
  {
    v3 = v2;
    for (i = 0; v3 != i; ++i)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "typeForItemAtIndex:", i) == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "commentForItemAtIndex:", i);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "isMyComment");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "BOOLValue");

        if ((v7 & 1) == 0)
        {
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v9 = *(void **)(v8 + 40);
          *(_QWORD *)(v8 + 40) = v5;

          return;
        }

      }
    }
  }
}

void __49__PXFeedSectionInfo_PXInboxModel__keyCommentGUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "typeForItemAtIndex:", 0);
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "likesForItemAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v8;
  }
  else
  {
    v3 = 0;
    if (v2 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "commentForItemAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = v3;
  objc_msgSend(v3, "cloudGUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "assets");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  PXMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v2, v4, v5, 0, 0, 1);

  PXMap();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke_5;
  v4[3] = &unk_1E5149038;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

id __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke_3(int a1, id a2)
{
  return a2;
}

uint64_t __71__PXFeedSectionInfo_PXInboxModel__fetchLeftPreviewItemsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __46__PXFeedSectionInfo_PXInboxModel__senderNames__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_usersInvolved");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__PXFeedSectionInfo_PXInboxModel__inboxModelTitle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfItems");
  if (v2 >= 1)
  {
    v3 = v2;
    for (i = 0; v3 != i; ++i)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "typeForItemAtIndex:", i) == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "commentForItemAtIndex:", i);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "isMyComment");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "BOOLValue");

        if ((v6 & 1) == 0)
        {
          objc_msgSend(v10, "commentText");
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v9 = *(void **)(v8 + 40);
          *(_QWORD *)(v8 + 40) = v7;

          return;
        }

      }
    }
  }
}

+ (id)defaultPreviewImage
{
  if (defaultPreviewImage_onceToken != -1)
    dispatch_once(&defaultPreviewImage_onceToken, &__block_literal_global_300168);
  return (id)defaultPreviewImage_image;
}

void __54__PXFeedSectionInfo_PXInboxModel__defaultPreviewImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack.person.crop.fill"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithSymbolConfiguration:", v5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultPreviewImage_image;
  defaultPreviewImage_image = v1;

  objc_msgSend((id)defaultPreviewImage_image, "imageWithRenderingMode:", 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultPreviewImage_image;
  defaultPreviewImage_image = v3;

}

@end
