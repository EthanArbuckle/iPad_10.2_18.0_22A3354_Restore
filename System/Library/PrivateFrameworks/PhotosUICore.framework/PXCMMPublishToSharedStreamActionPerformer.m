@implementation PXCMMPublishToSharedStreamActionPerformer

- (void)performBackgroundTask
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  PXCMMPublishToSharedStreamActionPerformer *v40;
  id v41;
  _BYTE *v42;
  char v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _BYTE *v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[PXCMMActionPerformer session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sourceType");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1006, CFSTR("Publish to shared streams is only supported from Photos"));
    v35 = (id)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, v35);

  }
  else
  {
    -[PXCMMActionPerformer session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "totalNumberOfItems");

    objc_msgSend(v8, "selectedIndexPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    PLSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Publishing to shared stream with %lu assets selected out of %lu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      objc_msgSend(v8, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectedIndexPaths");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v15;
      v52[1] = 3221225472;
      v52[2] = __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke;
      v52[3] = &unk_1E5142450;
      v53 = v14;
      v18 = v16;
      v54 = v18;
      objc_msgSend(v17, "enumerateItemIndexPathsUsingBlock:", v52);

      v50 = xmmword_1A7C0C1F0;
      v49 = objc_msgSend(v18, "identifier");
      v51 = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v18, "assetCollectionAtSectionIndexPath:", &v49);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v19, "localizedTitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringToIndex:", 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("CMM-Test-%@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v25, "stringByAppendingString:", v20);
      v26 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v26;
    }
    objc_msgSend(MEMORY[0x1E0D719A8], "cloudSharingPhotoLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v56 = __Block_byref_object_copy__173536;
    v57 = __Block_byref_object_dispose__173537;
    v58 = 0;
    -[PXCMMActionPerformer session](self, "session");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "viewModel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "recipients");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v44[0] = v15;
    v44[1] = 3221225472;
    v44[2] = __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_137;
    v44[3] = &unk_1E513D0D8;
    v48 = buf;
    v45 = v25;
    v31 = v27;
    v46 = v31;
    v32 = v30;
    v47 = v32;
    v36[0] = v15;
    v36[1] = 3221225472;
    v36[2] = __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_2;
    v36[3] = &unk_1E5131990;
    v33 = v14;
    v37 = v33;
    v38 = 0u;
    v39 = 0u;
    v43 = 1;
    v42 = buf;
    v40 = self;
    v34 = v45;
    v41 = v34;
    objc_msgSend(v31, "performTransaction:completionHandler:", v44, v36);

    _Block_object_dispose(buf, 8);
  }
}

void __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v2, "assetAtItemIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

}

void __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_137(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D71778];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNewCloudSharedAlbumWithTitle:lastInterestingDate:intoLibrary:", v3, v4, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIsOwned:", MEMORY[0x1E0C9AAB0]);
  v9 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCloudPublicURLEnabled:", MEMORY[0x1E0C9AAA0]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCloudPublicURLEnabledLocal:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCloudMultipleContributorsEnabled:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCloudMultipleContributorsEnabledLocal:", v8);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = a1;
  obj = *(id *)(a1 + 48);
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1E0D71630];
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v23 + 56) + 8) + 40);
        objc_msgSend(v11, "firstName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allEmails");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allPhones");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v25, "insertNewInvitationRecordIntoAlbum:withFirstName:lastName:fullName:emails:phones:inLibrary:", v12, v13, v14, v15, v17, v19, *(_QWORD *)(v23 + 40));

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v24);
  }

}

void __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "publishBatchOfOriginalAssetUUIDs:withBatchCommentText:assetsSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:isNewAlbum:", v2, v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 96));
  v6 = *(id *)(a1 + 80);
  px_dispatch_on_main_queue();

}

uint64_t __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  void *v2;

  PXURLForCMMShare(*(void **)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPublishedURL:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", 1, 0);
}

@end
