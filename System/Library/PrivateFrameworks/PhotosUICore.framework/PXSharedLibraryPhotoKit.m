@implementation PXSharedLibraryPhotoKit

- (PXSharedLibraryPhotoKit)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKit.m"), 42, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryPhotoKit init]");

  abort();
}

- (PXSharedLibraryPhotoKit)initWithLibraryScope:(id)a3
{
  id v6;
  PXSharedLibraryPhotoKit *v7;
  PXSharedLibraryPhotoKit *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKit.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryScope"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKit;
  v7 = -[PXSharedLibraryPhotoKit init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_libraryScope, a3);

  return v8;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, libraryScope:\"%@\", owner:%@, participants:%@, rule:%@>"), objc_opt_class(), self, self->_libraryScope, self->_owner, self->_participants, self->_rule);
}

- (NSString)identifier
{
  return (NSString *)-[PHLibraryScope uuid](self->_libraryScope, "uuid");
}

- (PXSharedLibraryParticipant)owner
{
  PHShareParticipant *owner;

  owner = self->_owner;
  if (!owner)
  {
    -[PXSharedLibraryPhotoKit _updateParticipants](self, "_updateParticipants");
    owner = self->_owner;
  }
  return owner;
}

- (NSArray)participants
{
  PHFetchResult *participants;

  participants = self->_participants;
  if (!participants)
  {
    -[PXSharedLibraryPhotoKit _updateParticipants](self, "_updateParticipants");
    participants = self->_participants;
  }
  return (NSArray *)-[PHFetchResult fetchedObjects](participants, "fetchedObjects");
}

- (PXSharedLibraryRule)rule
{
  PXSharedLibraryRule *rule;
  PHLibraryScope *v4;
  int v5;
  uint64_t v6;
  PXSharedLibraryRule *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  PXSharedLibraryRule *v13;
  _QWORD v15[4];
  PHLibraryScope *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  rule = self->_rule;
  if (!rule)
  {
    v4 = self->_libraryScope;
    v5 = -[PHLibraryScope autoSharePolicy](v4, "autoSharePolicy");
    v6 = v5 == 1;
    if (v5 == 2)
      v6 = 2;
    if (v6 == 2)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__83398;
      v23 = __Block_byref_object_dispose__83399;
      v24 = 0;
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[PHLibraryScope photoLibrary](v4, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1600], "fetchLibraryScopeRulesForLibraryScope:options:", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = ___RuleForLibraryScope_block_invoke;
      v15[3] = &unk_1E5123370;
      v18 = &v19;
      v16 = v4;
      v12 = v8;
      v17 = v12;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
      +[PXSharedLibraryRule customizedRuleWithStartDate:personUUIDs:](PXSharedLibraryRule, "customizedRuleWithStartDate:personUUIDs:", v20[5], v12);
      v7 = (PXSharedLibraryRule *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      if (v6 == 1)
        +[PXSharedLibraryRule everythingRule](PXSharedLibraryRule, "everythingRule");
      else
        +[PXSharedLibraryRule manualRule](PXSharedLibraryRule, "manualRule");
      v7 = (PXSharedLibraryRule *)objc_claimAutoreleasedReturnValue();
    }

    v13 = self->_rule;
    self->_rule = v7;

    rule = self->_rule;
  }
  return rule;
}

- (BOOL)isInPreview
{
  return -[PHLibraryScope previewState](self->_libraryScope, "previewState") == 1;
}

- (unint64_t)cloudPhotoCount
{
  return -[PHLibraryScope cloudPhotoCount](self->_libraryScope, "cloudPhotoCount");
}

- (unint64_t)cloudVideoCount
{
  return -[PHLibraryScope cloudVideoCount](self->_libraryScope, "cloudVideoCount");
}

- (unint64_t)cloudItemCount
{
  return -[PHLibraryScope cloudItemCount](self->_libraryScope, "cloudItemCount");
}

- (NSURL)shareURL
{
  return (NSURL *)-[PHLibraryScope shareURL](self->_libraryScope, "shareURL");
}

- (BOOL)isInLocalMode
{
  return -[PHLibraryScope libraryScopeInLocalMode](self->_libraryScope, "libraryScopeInLocalMode");
}

- (BOOL)isPublished
{
  return -[PHLibraryScope publishState](self->_libraryScope, "publishState") == 2;
}

- (BOOL)isExiting
{
  return -[PHLibraryScope exitState](self->_libraryScope, "exitState") != 0;
}

- (BOOL)isDeclined
{
  return -[PHLibraryScope trashedState](self->_libraryScope, "trashedState") == 1;
}

- (BOOL)isOwned
{
  return -[PHLibraryScope status](self->_libraryScope, "status") == 1;
}

- (NSDate)creationDate
{
  return (NSDate *)-[PHLibraryScope creationDate](self->_libraryScope, "creationDate");
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fetchItemCounts
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v12;

  -[PXSharedLibraryPhotoKit libraryScope](self, "libraryScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71880], "predicateToIncludeSharedLibraryAssetsAllowingIndexingOnParticipationState:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInternalPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E50B7EE0;
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v7, "countOfAssetsWithMediaType:", 1);
    v9 = objc_msgSend(v7, "countOfAssetsWithMediaType:", 2);
    v10 = objc_msgSend(v7, "countOfAssetsWithMediaType:", 3);
    retstr->var0 = v8;
    retstr->var1 = v9;
    retstr->var2 = v10;
  }

  return result;
}

- (id)sourceLibraryInfo
{
  PXSharedLibrarySourceLibraryInfoPhotoKit *v3;
  void *v4;
  void *v5;
  PXSharedLibrarySourceLibraryInfoPhotoKit *v6;

  v3 = [PXSharedLibrarySourceLibraryInfoPhotoKit alloc];
  -[PXSharedLibraryPhotoKit libraryScope](self, "libraryScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSharedLibrarySourceLibraryInfoPhotoKit initWithPhotoLibrary:](v3, "initWithPhotoLibrary:", v5);

  return v6;
}

- (void)previewInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v10, "autoSharePolicy");
  if (v11 == 2)
    v12 = 2;
  else
    v12 = v11 == 1;
  objc_msgSend(v10, "startDate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedLibraryPreviewLibraryScopeInvitation(self->_libraryScope, v12, v14, v13, v9, v8);
}

- (void)acceptInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (-[PXSharedLibraryPhotoKit isInPreview](self, "isInPreview"))
  {
    PXSharedLibraryAcceptLibraryScopeInvitationPreview(self->_libraryScope, v9);
  }
  else
  {
    v10 = objc_msgSend(v14, "autoSharePolicy");
    if (v10 == 2)
      v11 = 2;
    else
      v11 = v10 == 1;
    objc_msgSend(v14, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "personUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXSharedLibraryAcceptLibraryScopeInvitation(self->_libraryScope, v11, v12, v13, v8, v9);

  }
}

- (void)declineInvitationWithCompletion:(id)a3
{
  PXSharedLibraryDeclineLibraryScopeInvitation(self->_libraryScope, a3);
}

- (void)restoreDeclinedInvitationWithCompletion:(id)a3
{
  id v4;
  PHLibraryScope *libraryScope;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  libraryScope = self->_libraryScope;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PXSharedLibraryPhotoKit_restoreDeclinedInvitationWithCompletion___block_invoke;
  v7[3] = &unk_1E5141AB8;
  v8 = v4;
  v6 = v4;
  PXSharedLibraryRestoreDeclinedLibraryScopeInvitation(libraryScope, v7);

}

- (void)publishPreviewWithPresentationEnvironment:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  PHLibraryScope *libraryScope;
  id v10;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  libraryScope = self->_libraryScope;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__PXSharedLibraryPhotoKit_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke;
  v11[3] = &unk_1E5141AB8;
  v12 = v8;
  v10 = v8;
  PXSharedLibraryPublishPreviewLibraryScope(libraryScope, a4, a3, v11);

}

- (void)exitPreviewWithPresentationEnvironment:(id)a3 completion:(id)a4
{
  PXSharedLibraryExitPreviewLibraryScope(self->_libraryScope, a3, a4);
}

- (void)exitWithRetentionPolicy:(int64_t)a3 presentationEnvironment:(id)a4 progress:(id)a5 completion:(id)a6
{
  unint64_t v6;

  if (a3 == 2)
    v6 = 2;
  else
    v6 = a3 == 1;
  PXSharedLibraryExitLibraryScope(self->_libraryScope, v6, a5, a4, a6);
}

- (BOOL)canEditParticipants
{
  return PXSharedLibraryCanEditParticipantsInLibraryScope(self->_libraryScope);
}

- (BOOL)canAddParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4
{
  return PXSharedLibraryCanAddParticipantsToLibraryScope(self->_libraryScope, a3, a4);
}

- (void)addParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 presentationEnvironment:(id)a5 withCompletion:(id)a6
{
  PXSharedLibraryAddParticipantsToLibraryScope(self->_libraryScope, a3, a4, a5, a6);
}

- (BOOL)canDeleteParticipants:(id)a3
{
  return PXSharedLibraryCanDeleteParticipantsFromLibraryScope(self->_libraryScope, a3);
}

- (void)deleteParticipants:(id)a3 presentationEnvironment:(id)a4 withCompletion:(id)a5
{
  PXSharedLibraryDeleteParticipantsFromLibraryScope(self->_libraryScope, a3, a4, a5);
}

- (BOOL)canMoveAssetsToSharedLibrary:(id)a3
{
  return PXSharedLibraryCanMoveAssetsToLibraryScope(self->_libraryScope, a3);
}

- (void)moveAssetsToSharedLibrary:(id)a3 completion:(id)a4
{
  PXSharedLibraryMoveAssetsToLibraryScope(self->_libraryScope, a3, a4);
}

- (void)moveAssetsWithLocalIdentifiersToSharedLibrary:(id)a3 completion:(id)a4
{
  PXSharedLibraryMoveAssetsWithLocalIdentifiersToLibraryScope(self->_libraryScope, a3, a4);
}

- (BOOL)canMoveAssetsToPersonalLibrary:(id)a3
{
  return PXSharedLibraryCanMoveAssetsToSPLPersonalLibrary(self->_libraryScope, a3);
}

- (void)moveAssetsToPersonalLibrary:(id)a3 completion:(id)a4
{
  PXSharedLibraryMoveAssetsToSPLPersonalLibrary(self->_libraryScope, a3, a4);
}

- (BOOL)canRemoveAssetSharingSuggestions:(id)a3
{
  return PXSharedLibraryCanRejectAssetsSharingSuggestionsForLibraryScope((uint64_t)self, a3);
}

- (void)removeAssetSharingSuggestions:(id)a3 completion:(id)a4
{
  PXSharedLibraryRejectAssetSharingSuggestionsForLibraryScope(self->_libraryScope, a3, a4);
}

- (void)addAssetSharingSuggestions:(id)a3 completion:(id)a4
{
  PXSharedLibraryUnRejectAssetSharingSuggestionsForLibraryScope(self->_libraryScope, a3, a4);
}

- (void)addPersonUUIDsToPersonCondition:(id)a3 completion:(id)a4
{
  PXSharedLibraryAddPersonUUIDsToPersonConditionForLibraryScope(self->_libraryScope, a3, a4);
}

- (void)removePersonUUIDsFromPersonCondition:(id)a3 completion:(id)a4
{
  PXSharedLibraryRemovePersonUUIDsFromPersonConditionForLibraryScope(self->_libraryScope, a3, a4);
}

- (void)_updateOwner
{
  PHFetchResult *participants;
  _QWORD v3[5];

  participants = self->_participants;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PXSharedLibraryPhotoKit__updateOwner__block_invoke;
  v3[3] = &unk_1E5123340;
  v3[4] = self;
  -[PHFetchResult enumerateObjectsUsingBlock:](participants, "enumerateObjectsUsingBlock:", v3);
}

- (void)_updateParticipants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHFetchResult *v10;
  PHFetchResult *participants;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!self->_participants)
  {
    -[PHLibraryScope photoLibrary](self->_libraryScope, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_registerChangeObserver:", self);

  }
  -[PHLibraryScope photoLibrary](self->_libraryScope, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_isCurrentUser);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v9);

  objc_msgSend(MEMORY[0x1E0CD17A8], "fetchParticipantsInShare:options:", self->_libraryScope, v5);
  v10 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  participants = self->_participants;
  self->_participants = v10;

  -[PXSharedLibraryPhotoKit _updateOwner](self, "_updateOwner");
  -[PHLibraryScope previewState](self->_libraryScope, "previewState");

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  void *v4;
  PHFetchResult *v5;
  PHFetchResult *participants;
  void *v7;
  id v8;

  objc_msgSend(a3, "changeDetailsForFetchResult:", self->_participants);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "fetchResultAfterChanges");
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    participants = self->_participants;
    self->_participants = v5;

    -[PXSharedLibraryPhotoKit _updateOwner](self, "_updateOwner");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PXSharedLibraryParticipantsDidChange"), self, 0);

    v4 = v8;
  }

}

- (PHLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScope, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

void __39__PXSharedLibraryPhotoKit__updateOwner__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "role") == 1)
  {
    v6 = objc_msgSend(v9, "copy");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    *a4 = 1;
  }

}

void __89__PXSharedLibraryPhotoKit_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  PXSharedLibraryPhotoKit *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __67__PXSharedLibraryPhotoKit_restoreDeclinedInvitationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  PXSharedLibraryPhotoKit *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
