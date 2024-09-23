@implementation PXFeedInvitationResponseSectionInfo

- (int64_t)sectionType
{
  return 4;
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
  PXFeedInvitationResponseSectionInfo *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PXFeedInvitationResponseSectionInfo;
  -[PXFeedSectionInfo updateFromCloudFeedEntry](&v38, sel_updateFromCloudFeedEntry);
  -[PXFeedSectionInfo cloudFeedEntry](self, "cloudFeedEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__223934;
  v36 = __Block_byref_object_dispose__223935;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__223934;
  v30 = __Block_byref_object_dispose__223935;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__223934;
  v24 = __Block_byref_object_dispose__223935;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  -[PXFeedSectionInfo photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __63__PXFeedInvitationResponseSectionInfo_updateFromCloudFeedEntry__block_invoke;
  v9 = &unk_1E5138A48;
  v5 = v3;
  v10 = v5;
  v11 = self;
  v12 = &v20;
  v13 = &v32;
  v14 = &v26;
  v15 = &v16;
  objc_msgSend(v4, "performBlockAndWait:", &v6);

  -[PXFeedSectionInfo setNumberOfItems:](self, "setNumberOfItems:", v17[3], v6, v7, v8, v9);
  -[PXFeedSectionInfo setSharedAlbum:](self, "setSharedAlbum:", v33[5]);
  -[PXFeedSectionInfo setAlbumTitle:](self, "setAlbumTitle:", v27[5]);
  -[PXFeedSectionInfo setInvitationRecord:](self, "setInvitationRecord:", v21[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 3;
}

- (id)assets
{
  void *v2;
  void *v3;

  -[PXFeedSectionInfo sharedAlbum](self, "sharedAlbum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __63__PXFeedInvitationResponseSectionInfo_updateFromCloudFeedEntry__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entryInvitationRecordGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D71630];
  v16[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "album");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "localizedTitle");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    NSLog(CFSTR("no invitation record for invitation response section info %@, entry %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }

}

@end
