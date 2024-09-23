@implementation PXFeedCommentsSectionInfo

- (int64_t)sectionType
{
  return 1;
}

- (id)cloudFeedCommentsEntry
{
  void *v4;
  void *v6;

  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedCommentsSectionInfo.m"), 34, CFSTR("unexpected cloud feed entry class"));

  }
  return v4;
}

- (void)updateFromCloudFeedEntry
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  PXFeedCommentsSectionInfo *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PXFeedCommentsSectionInfo;
  -[PXFeedSectionInfo updateFromCloudFeedEntry](&v29, sel_updateFromCloudFeedEntry);
  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9072;
  v19 = __Block_byref_object_dispose__9073;
  v20 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PXFeedCommentsSectionInfo_updateFromCloudFeedEntry__block_invoke;
  v9[3] = &unk_1E51196F0;
  v12 = &v25;
  v5 = v3;
  v13 = &v21;
  v14 = &v15;
  v10 = v5;
  v11 = self;
  objc_msgSend(v4, "performBlockAndWait:", v9);

  v6 = v26[3];
  v7 = v22[3];
  if (v6 >= 1)
    v22[3] = ++v7;
  -[PXFeedSectionInfo setNumberOfItems:](self, "setNumberOfItems:", v7);
  -[PXFeedSectionInfo setSharedAlbum:](self, "setSharedAlbum:", v16[5]);
  objc_msgSend((id)v16[5], "localizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo setAlbumTitle:](self, "setAlbumTitle:", v8);

  -[PXFeedCommentsSectionInfo _setHasLikes:](self, "_setHasLikes:", v6 > 0);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  if (((a3 == 0) & -[PXFeedCommentsSectionInfo _hasLikes](self, "_hasLikes")) != 0)
    return 2;
  else
    return 1;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9072;
  v16 = __Block_byref_object_dispose__9073;
  v17 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PXFeedCommentsSectionInfo_assetForItemAtIndex___block_invoke;
  v9[3] = &unk_1E5148AA8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)hasMultipleAssetsForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PXFeedCommentsSectionInfo_hasMultipleAssetsForItemAtIndex___block_invoke;
  v8[3] = &unk_1E5148AA8;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (id)assetsForItemAtIndex:(int64_t)a3 maximumCount:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9072;
  v19 = __Block_byref_object_dispose__9073;
  v20 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__PXFeedCommentsSectionInfo_assetsForItemAtIndex_maximumCount___block_invoke;
  v11[3] = &unk_1E5141AE0;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = a4;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)commentForItemAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3 - -[PXFeedCommentsSectionInfo _hasLikes](self, "_hasLikes");
  objc_msgSend(v5, "entryComments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 0x8000000000000000) != 0 || v6 >= objc_msgSend(v7, "count"))
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218496;
      v13 = v6;
      v14 = 2048;
      v15 = a3;
      v16 = 1024;
      v17 = -[PXFeedCommentsSectionInfo _hasLikes](self, "_hasLikes");
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to get a comment at invalid index [%ld] from original index [%ld] due to _hasLikes=[%d]", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)commentTextForItemAtIndex:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9072;
  v13 = __Block_byref_object_dispose__9073;
  v14 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PXFeedCommentsSectionInfo_commentTextForItemAtIndex___block_invoke;
  v8[3] = &unk_1E5141AE0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)likesForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9072;
  v16 = __Block_byref_object_dispose__9073;
  v17 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PXFeedCommentsSectionInfo_likesForItemAtIndex___block_invoke;
  v9[3] = &unk_1E5148AA8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)getCommentCount:(unint64_t *)a3 likeCount:(unint64_t *)a4
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (!-[PXFeedSectionInfo isLoaded](self, "isLoaded"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedCommentsSectionInfo.m"), 156, CFSTR("section info should be loaded at this point"));

  }
  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PXFeedCommentsSectionInfo_getCommentCount_likeCount___block_invoke;
  v12[3] = &unk_1E51401A8;
  v14 = &v20;
  v10 = v8;
  v13 = v10;
  v15 = &v16;
  objc_msgSend(v9, "performBlockAndWait:", v12);

  if (a3)
    *a3 = v21[3];
  if (a4)
    *a4 = v17[3];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

}

- (BOOL)containsAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  PXFeedCommentsSectionInfo *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PXFeedCommentsSectionInfo_containsAsset___block_invoke;
  v10[3] = &unk_1E513D0D8;
  v7 = v5;
  v11 = v7;
  v14 = &v15;
  v8 = v4;
  v12 = v8;
  v13 = self;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  LOBYTE(self) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)self;
}

- (int64_t)indexOfItemWithAsset:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[PXFeedSectionInfo numberOfItems](self, "numberOfItems") >= 1
    && -[PXFeedCommentsSectionInfo containsAsset:](self, "containsAsset:", v4))
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)indexOfItemWithComment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (-[PXFeedSectionInfo numberOfItems](self, "numberOfItems") < 1)
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isLikeBoolValue"))
    {
      objc_msgSend(v5, "entryLikeComments");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", v4);

      if (v7)
        v8 = 0;
      else
        v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      objc_msgSend(v5, "entryComments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", v4);

      v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        v8 = v10 + -[PXFeedCommentsSectionInfo _hasLikes](self, "_hasLikes");
    }

  }
  return v8;
}

- (id)assets
{
  void *v3;
  void *v4;

  if (-[PXFeedCommentsSectionInfo hasMultipleAssetsForItemAtIndex:](self, "hasMultipleAssetsForItemAtIndex:", 0))
  {
    -[PXFeedCommentsSectionInfo assetsForItemAtIndex:maximumCount:](self, "assetsForItemAtIndex:maximumCount:", 0, 0x7FFFFFFFFFFFFFFFLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXFeedCommentsSectionInfo assetForItemAtIndex:](self, "assetForItemAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", v4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (unint64_t)assetsCount
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__PXFeedCommentsSectionInfo_assetsCount__block_invoke;
  v8[3] = &unk_1E5148AA8;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)isMine
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  -[PXFeedCommentsSectionInfo cloudFeedCommentsEntry](self, "cloudFeedCommentsEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PXFeedCommentsSectionInfo_isMine__block_invoke;
  v7[3] = &unk_1E5148AA8;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

- (BOOL)_hasLikes
{
  return self->__hasLikes;
}

- (void)_setHasLikes:(BOOL)a3
{
  self->__hasLikes = a3;
}

void __35__PXFeedCommentsSectionInfo_isMine__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entryComments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "entryLikeComments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionOrderedSet:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isMyComment", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if ((v11 & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

void __40__PXFeedCommentsSectionInfo_assetsCount__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entryCloudAssetGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "entryLikeComments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "count");

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

void __43__PXFeedCommentsSectionInfo_containsAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "entryCloudAssetGUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cloudAssetGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "isEqualToString:", v4);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && objc_msgSend(*(id *)(a1 + 48), "hasMultipleAssetsForItemAtIndex:", 0))
  {
    objc_msgSend(*(id *)(a1 + 48), "assetsForItemAtIndex:maximumCount:", 0, 0x7FFFFFFFFFFFFFFFLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  }
}

void __55__PXFeedCommentsSectionInfo_getCommentCount_likeCount___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "entryComments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "entryLikeComments");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count");

}

void __49__PXFeedCommentsSectionInfo_likesForItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "entryLikeComments");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __55__PXFeedCommentsSectionInfo_commentTextForItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "commentForItemAtIndex:", *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commentText");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__PXFeedCommentsSectionInfo_assetsForItemAtIndex_maximumCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entryLikeComments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E10];
  v4 = *(_QWORD *)(a1 + 48);
  v5 = objc_msgSend(v2, "count");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  objc_msgSend(v3, "orderedSetWithCapacity:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v2;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "asset", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v15);
          if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") >= *(_QWORD *)(a1 + 48))
          {

            goto LABEL_15;
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "entryComments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "asset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v18);

  }
}

void __61__PXFeedCommentsSectionInfo_hasMultipleAssetsForItemAtIndex___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "entryCloudAssetGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

}

void __49__PXFeedCommentsSectionInfo_assetForItemAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "entryLikeComments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "entryComments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "asset");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __53__PXFeedCommentsSectionInfo_updateFromCloudFeedEntry__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "entryLikeComments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "entryComments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "count");

  objc_msgSend(*(id *)(a1 + 32), "entryAlbumGUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sharedAlbumWithGUID:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
