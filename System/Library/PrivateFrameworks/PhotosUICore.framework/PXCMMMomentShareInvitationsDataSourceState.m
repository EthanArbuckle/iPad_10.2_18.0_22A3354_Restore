@implementation PXCMMMomentShareInvitationsDataSourceState

- (PXCMMMomentShareInvitationsDataSourceState)initWithMomentShares:(id)a3 invitationsByMomentShareObjectID:(id)a4
{
  id v7;
  id v8;
  PXCMMMomentShareInvitationsDataSourceState *v9;
  PXCMMMomentShareInvitationsDataSourceState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCMMMomentShareInvitationsDataSourceState;
  v9 = -[PXCMMMomentShareInvitationsDataSourceState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentShares, a3);
    objc_storeStrong((id *)&v10->_invitationsByMomentShareObjectID, a4);
  }

  return v10;
}

- (PXCMMMomentShareInvitationsDataSourceState)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 342, CFSTR("%s is not available as initializer"), "-[PXCMMMomentShareInvitationsDataSourceState init]");

  abort();
}

- (id)stateUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  id v5;
  PHFetchResult *v6;
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
  PHFetchResult *v20;
  PHFetchResult *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  PHFetchResult *v33;
  id v34;
  void *v35;
  void *v36;
  PXCMMMomentShareInvitationsDataSourceState *v37;
  PXCMMMomentShareInvitationsDataSourceState *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  PXCMMMomentShareInvitationsDataSourceState *v49;
  PHFetchResult *v50;
  id v51;
  PHFetchResult *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD aBlock[4];
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_momentShares;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsForFetchResult:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v6;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke;
    aBlock[3] = &unk_1E5118920;
    v68 = v7;
    v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(v8, "insertedObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v64 != v13)
            objc_enumerationMutation(v10);
          v9[2](v9, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v12);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v8, "changedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v60 != v18)
            objc_enumerationMutation(v15);
          v9[2](v9, *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
      }
      while (v17);
    }

    objc_msgSend(v8, "fetchResultAfterChanges");
    v20 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v6;
  }
  v21 = v20;
  -[PHFetchResult fetchedObjectIDs](v20, "fetchedObjectIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedIndexes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;

  -[PXCMMMomentShareInvitationsDataSourceState invitationsByMomentShareObjectID](self, "invitationsByMomentShareObjectID");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2;
  v54[3] = &unk_1E5118948;
  v29 = v7;
  v55 = v29;
  v51 = v22;
  v56 = v51;
  v30 = v5;
  v57 = v30;
  v31 = v27;
  v58 = v31;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v54);
  objc_msgSend(v8, "removedObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {

    v33 = v53;
  }
  else
  {
    v33 = v53;
    if (!objc_msgSend(v29, "count"))
    {
      v34 = v28;
      goto LABEL_27;
    }
  }
  v34 = (id)objc_msgSend(v28, "mutableCopy");
  objc_msgSend(v8, "removedObjects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v8, "removedObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeObjectsForKeys:", v36);

  }
  objc_msgSend(v34, "addEntriesFromDictionary:", v29);
LABEL_27:
  if (v21 == v33 && v34 == v28)
    v37 = self;
  else
    v37 = -[PXCMMMomentShareInvitationsDataSourceState initWithMomentShares:invitationsByMomentShareObjectID:]([PXCMMMomentShareInvitationsDataSourceState alloc], "initWithMomentShares:invitationsByMomentShareObjectID:", v21, v34);
  v38 = v37;
  if (a4)
  {
    v50 = v21;
    v49 = v37;
    v39 = objc_alloc((Class)off_1E50B1608);
    objc_msgSend(v8, "removedIndexes");
    v40 = v29;
    v41 = v30;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertedIndexes");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "movedIndexes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v39, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v42, v43, v44, objc_msgSend(v8, "movedFromIndexes"), v31);

    v33 = v53;
    v30 = v41;
    v29 = v40;
    v46 = (void *)v45;
    v38 = v49;
    v47 = objc_retainAutorelease(v46);
    *a4 = v47;
    v21 = v50;

  }
  return v38;
}

- (PHFetchResult)momentShares
{
  return self->_momentShares;
}

- (NSDictionary)invitationsByMomentShareObjectID
{
  return self->_invitationsByMomentShareObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationsByMomentShareObjectID, 0);
  objc_storeStrong((id *)&self->_momentShares, 0);
}

void __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  +[PXCMMMomentShareInvitation invitationWithMomentShare:](PXCMMMomentShareInvitation, "invitationWithMomentShare:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
}

void __83__PXCMMMomentShareInvitationsDataSourceState_stateUpdatedWithChange_changeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v5 = a3;
  objc_msgSend(v5, "participantsFetchResult");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewAssetsFetchResult");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = *(void **)(a1 + 40);
      if (v9)
      {
        v10 = objc_msgSend(v9, "indexOfObject:", v19);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_4;
        v11 = v10;
        if (v6)
        {
          objc_msgSend(*(id *)(a1 + 48), "changeDetailsForFetchResult:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "fetchResultAfterChanges");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "invitationWithUpdatedParticipantsFetchResult:", v14);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v8 = 0;
          }
        }
        else
        {
          v8 = 0;
          v13 = 0;
        }
        if (v7)
        {
          objc_msgSend(*(id *)(a1 + 48), "changeDetailsForFetchResult:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            if (v8)
              v16 = v8;
            else
              v16 = v5;
            objc_msgSend(v15, "fetchResultAfterChanges");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "invitationWithUpdatedPreviewAssetsFetchResult:", v17);
            v18 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v18;
            v13 = v15;
          }
          else
          {
            v13 = 0;
          }
        }
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v19);
          objc_msgSend(*(id *)(a1 + 56), "addIndex:", v11);
        }

      }
      else
      {
        v8 = 0;
      }
    }

  }
LABEL_4:

}

+ (PXCMMMomentShareInvitationsDataSourceState)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 346, CFSTR("%s is not available as initializer"), "+[PXCMMMomentShareInvitationsDataSourceState new]");

  abort();
}

@end
