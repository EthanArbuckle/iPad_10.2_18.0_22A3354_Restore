@implementation PXCMMMomentsInvitationsDataSourceState

- (PXCMMMomentsInvitationsDataSourceState)initWithAssetCollections:(id)a3 invitationsByAssetCollectionObjectID:(id)a4
{
  id v7;
  id v8;
  PXCMMMomentsInvitationsDataSourceState *v9;
  PXCMMMomentsInvitationsDataSourceState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCMMMomentsInvitationsDataSourceState;
  v9 = -[PXCMMMomentsInvitationsDataSourceState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetCollections, a3);
    objc_storeStrong((id *)&v10->_invitationsByAssetCollectionObjectID, a4);
  }

  return v10;
}

- (PHPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PXCMMMomentsInvitationsDataSourceState assetCollections](self, "assetCollections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPhotoLibrary *)v3;
}

- (id)stateUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void *, _QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  PXCMMMomentsInvitationsDataSourceState *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PXCMMMomentsInvitationsDataSourceState *v42;
  void *v43;
  void *v44;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD aBlock[4];
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXCMMMomentsInvitationsDataSourceState assetCollections](self, "assetCollections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsForFetchResult:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v6;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PXCMMMomentsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke;
    aBlock[3] = &unk_1E51341E8;
    v61 = v7;
    v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v8, "insertedObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v57 != v13)
            objc_enumerationMutation(v10);
          v9[2](v9, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      }
      while (v12);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v8, "changedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          v9[2](v9, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      }
      while (v17);
    }

    objc_msgSend(v8, "fetchResultAfterChanges");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v6;
  }
  v21 = v20;
  objc_msgSend(v20, "fetchedObjectIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedIndexes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v8, "changedIndexes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PXCMMMomentsInvitationsDataSourceState invitationsByAssetCollectionObjectID](self, "invitationsByAssetCollectionObjectID");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __79__PXCMMMomentsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2;
  v47[3] = &unk_1E5134210;
  v27 = v7;
  v48 = v27;
  v28 = v22;
  v49 = v28;
  v29 = v5;
  v50 = v29;
  v30 = v25;
  v51 = v30;
  objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v47);
  objc_msgSend(v8, "removedObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {

  }
  else if (!objc_msgSend(v27, "count"))
  {
    v32 = v26;
    goto LABEL_27;
  }
  v32 = (id)objc_msgSend(v26, "mutableCopy");
  objc_msgSend(v8, "removedObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v8, "removedObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeObjectsForKeys:", v34);

  }
  objc_msgSend(v32, "addEntriesFromDictionary:", v27);
LABEL_27:
  v43 = v28;
  v44 = v29;
  if (v21 == v46 && v32 == v26)
    v35 = self;
  else
    v35 = -[PXCMMMomentsInvitationsDataSourceState initWithAssetCollections:invitationsByAssetCollectionObjectID:]([PXCMMMomentsInvitationsDataSourceState alloc], "initWithAssetCollections:invitationsByAssetCollectionObjectID:", v21, v32);
  v42 = v35;
  v36 = objc_alloc((Class)off_1E50B1608);
  objc_msgSend(v8, "removedIndexes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertedIndexes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "movedIndexes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v36, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v37, v38, v39, objc_msgSend(v8, "movedFromIndexes"), v30);

  if (a4)
    *a4 = objc_retainAutorelease(v40);

  return v42;
}

- (PHFetchResult)assetCollections
{
  return self->_assetCollections;
}

- (NSDictionary)invitationsByAssetCollectionObjectID
{
  return self->_invitationsByAssetCollectionObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationsByAssetCollectionObjectID, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
}

void __79__PXCMMMomentsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  +[PXCMMMomentsInvitation invitationWithAssetCollection:](PXCMMMomentsInvitation, "invitationWithAssetCollection:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

void __79__PXCMMMomentsInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v5, "previewAssetsFetchResult");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = *(void **)(a1 + 40);
      if (v9)
      {
        v10 = objc_msgSend(v9, "indexOfObject:", v14);

        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_5;
        v11 = *(void **)(a1 + 48);
        objc_msgSend(v5, "previewAssetsFetchResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "changeDetailsForFetchResult:", v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          goto LABEL_4;
        objc_msgSend(v7, "fetchResultAfterChanges");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "invitationWithUpdatedPreviewAssetsFetchResult:", v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v14);
        objc_msgSend(*(id *)(a1 + 56), "addIndex:", v10);
      }
    }

LABEL_4:
  }
LABEL_5:

}

@end
