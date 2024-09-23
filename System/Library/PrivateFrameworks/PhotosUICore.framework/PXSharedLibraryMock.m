@implementation PXSharedLibraryMock

- (PXSharedLibraryMock)init
{
  PXSharedLibraryMock *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSURL *shareURL;
  uint64_t v9;
  NSDate *creationDate;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryMock;
  v2 = -[PXSharedLibraryMock init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v5;

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://share.icloud.com/shared_library/123"));
    v7 = objc_claimAutoreleasedReturnValue();
    shareURL = v2->_shareURL;
    v2->_shareURL = (NSURL *)v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v9;

  }
  return v2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p, identifier:\"%@\", participants:%@, rule:%@>"), objc_opt_class(), self, self->_identifier, self->_participants, self->_rule);
}

- (id)sourceLibraryInfo
{
  return objc_alloc_init(PXSharedLibrarySourceLibraryInfoMock);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)fetchItemCounts
{
  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E50B7ED8;
  return self;
}

- (void)previewInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  PXSharedLibraryMock *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Preview shared library invitation: %@ with rule: %@", buf, 0x16u);
  }

  if (v8)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "simulateErrorType");

    if (v11 == 3)
    {
      v12 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PXSharedLibraryMock_previewInvitationWithRule_progress_completion___block_invoke;
      block[3] = &unk_1E5148A40;
      v14 = v8;
      dispatch_after(v12, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
    }
  }

}

- (void)acceptInvitationWithRule:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  dispatch_time_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint8_t buf[4];
  PXSharedLibraryMock *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Accepting shared library invitation: %@ with rule: %@", buf, 0x16u);
  }

  if (v8)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "simulateErrorType");

    if (v11 == 16)
    {
      PLSharedLibraryGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Simulated Error: Accept Invitation Failed", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Accept Invitation Failed"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke;
      block[3] = &unk_1E5148CE0;
      v19 = v13;
      v20 = v8;
      v14 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v15 = dispatch_time(0, 3000000000);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke_2;
      v16[3] = &unk_1E5148A40;
      v17 = v8;
      dispatch_after(v15, MEMORY[0x1E0C80D38], v16);
      v14 = v17;
    }

  }
}

- (void)declineInvitationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  PXSharedLibraryMock *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSharedLibraryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Declining shared library invitation: %@", buf, 0xCu);
  }

  if (v4)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "simulateErrorType");

    if (v7 == 19)
    {
      PLSharedLibraryGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Simulated Error: Decline Invitation Failed", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Decline Invitation Failed"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __55__PXSharedLibraryMock_declineInvitationWithCompletion___block_invoke;
      v11[3] = &unk_1E5148CE0;
      v12 = v9;
      v13 = v4;
      v10 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], v11);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
    }
  }

}

- (void)restoreDeclinedInvitationWithCompletion:(id)a3
{
  void (**v4)(id, PXSharedLibraryMock *, _QWORD);
  NSObject *v5;
  int v6;
  PXSharedLibraryMock *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, PXSharedLibraryMock *, _QWORD))a3;
  PLSharedLibraryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Restore previously declined shared library invitation: %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4)
    v4[2](v4, self, 0);

}

- (void)publishPreviewWithPresentationEnvironment:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  dispatch_time_t v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  PXSharedLibraryMock *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLSharedLibraryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Publish shared library preview: %@", buf, 0xCu);
  }

  if (v6)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "simulateErrorType");

    if (v9 == 4)
    {
      v10 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__PXSharedLibraryMock_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke;
      block[3] = &unk_1E5148A40;
      v12 = v6;
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      -[PXSharedLibraryMock setIsPublished:](self, "setIsPublished:", 1);
      (*((void (**)(id, PXSharedLibraryMock *, _QWORD))v6 + 2))(v6, self, 0);
    }
  }

}

- (void)exitPreviewWithPresentationEnvironment:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  PXSharedLibraryMock *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLSharedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Exiting shared library preview: %@", buf, 0xCu);
  }

  if (v5)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "simulateErrorType");

    if (v8 == 5)
    {
      v9 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__PXSharedLibraryMock_exitPreviewWithPresentationEnvironment_completion___block_invoke;
      block[3] = &unk_1E5148A40;
      v11 = v5;
      dispatch_after(v9, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v5 + 2))(v5, 1, 0);
    }
  }

}

- (void)exitWithRetentionPolicy:(int64_t)a3 presentationEnvironment:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  dispatch_time_t v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  PXSharedLibraryMock *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a6;
  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    PXSharedLibraryExitRetentionPolicyDescription(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "Exiting shared library: %@ with policy: %@", buf, 0x16u);

  }
  if (v8)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "simulateErrorType");

    if (v12 == 5)
    {
      v13 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __91__PXSharedLibraryMock_exitWithRetentionPolicy_presentationEnvironment_progress_completion___block_invoke;
      block[3] = &unk_1E5148A40;
      v15 = v8;
      dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
    }
  }

}

- (BOOL)canEditParticipants
{
  return -[PXSharedLibraryParticipant isCurrentUser](self->_owner, "isCurrentUser");
}

- (void)addParticipantsWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 presentationEnvironment:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  dispatch_time_t v17;
  id v18;
  id v19;
  NSArray *v20;
  NSArray *participants;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD block[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  PXSharedLibraryMock *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMock.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddresses.count > 0"));

  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMock.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phoneNumbers.count == 0"));

    if (a5)
      goto LABEL_5;
  }
  else if (a5)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMock.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

LABEL_5:
  PLSharedLibraryGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = v11;
    v31 = 2112;
    v32 = self;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "Adding participants with email addresses: %{public}@, to shared library: %@", buf, 0x16u);
  }

  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "simulateErrorType");

  if (v16 == 21)
  {
    v17 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke;
    block[3] = &unk_1E5148A40;
    v28 = v13;
    dispatch_after(v17, MEMORY[0x1E0C80D38], block);
    v18 = v28;
  }
  else
  {
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke_54;
    v25[3] = &unk_1E513DD20;
    v18 = v19;
    v26 = v18;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v25);
    -[NSArray arrayByAddingObjectsFromArray:](self->_participants, "arrayByAddingObjectsFromArray:", v18);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    participants = self->_participants;
    self->_participants = v20;

    if (v13)
      (*((void (**)(id, uint64_t, _QWORD))v13 + 2))(v13, 1, 0);

  }
}

- (BOOL)canDeleteParticipants:(id)a3
{
  uint64_t v4;
  BOOL result;

  v4 = objc_msgSend(a3, "indexOfObjectPassingTest:", &__block_literal_global_212761);
  result = -[PXSharedLibraryMock canEditParticipants](self, "canEditParticipants");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return result;
}

- (void)deleteParticipants:(id)a3 presentationEnvironment:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  dispatch_time_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *participants;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _BYTE *v25;
  _QWORD block[4];
  id v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "count"))
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMock.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participants.count"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryMock.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationEnvironment"));

LABEL_3:
  PLSharedLibraryGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Deleting participants: %{public}@, from shared library: %@", buf, 0x16u);
  }

  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "simulateErrorType") == 21;

  if (v14)
  {
    v15 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke;
    block[3] = &unk_1E5148A40;
    v27 = v11;
    dispatch_after(v15, MEMORY[0x1E0C80D38], block);
    v16 = v27;
  }
  else
  {
    v17 = (void *)-[NSArray mutableCopy](self->_participants, "mutableCopy");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v29 = __Block_byref_object_copy__212748;
    v30 = __Block_byref_object_dispose__212749;
    v31 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_62;
    v23[3] = &unk_1E5136FA0;
    v16 = v17;
    v24 = v16;
    v25 = buf;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);
    v18 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (!v18)
    {
      v19 = (NSArray *)objc_msgSend(v16, "copy");
      participants = self->_participants;
      self->_participants = v19;

    }
    if (v11)
      (*((void (**)(id, BOOL, _QWORD))v11 + 2))(v11, v18 == 0, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
  }

}

- (BOOL)canMoveAssetsToSharedLibrary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "participatesInLibraryScope", (_QWORD)v10) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (void)moveAssetsToSharedLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  PXSharedLibraryMock *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Moving assets: %@, to shared library: %@", buf, 0x16u);
  }

  if (v7)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "simulateErrorType");

    if (v10 == 25)
    {
      v11 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__PXSharedLibraryMock_moveAssetsToSharedLibrary_completion___block_invoke;
      block[3] = &unk_1E5148A40;
      v13 = v7;
      dispatch_after(v11, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    }
  }

}

- (void)moveAssetsWithLocalIdentifiersToSharedLibrary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  PXSharedLibraryMock *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Moving assets with local identifiers: %@, to shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7)
    v7[2](v7, 1, 0);

}

- (BOOL)canMoveAssetsToPersonalLibrary:(id)a3
{
  return 1;
}

- (void)moveAssetsToPersonalLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  PXSharedLibraryMock *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Moving assets: %@, from shared library: %@", buf, 0x16u);
  }

  if (v7)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "simulateErrorType");

    if (v10 == 25)
    {
      v11 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__PXSharedLibraryMock_moveAssetsToPersonalLibrary_completion___block_invoke;
      block[3] = &unk_1E5148A40;
      v13 = v7;
      dispatch_after(v11, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
    }
  }

}

- (BOOL)canRemoveAssetSharingSuggestions:(id)a3
{
  return 1;
}

- (void)removeAssetSharingSuggestions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  PXSharedLibraryMock *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Removing sharing suggestions for assets: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7)
    v7[2](v7, 1, 0);

}

- (void)addAssetSharingSuggestions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  PXSharedLibraryMock *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Adding sharing suggestions for assets: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7)
    v7[2](v7, 1, 0);

}

- (void)addPersonUUIDsToPersonCondition:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  PXSharedLibraryMock *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Adding personUUIDs: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7)
    v7[2](v7, 1, 0);

}

- (void)removePersonUUIDsFromPersonCondition:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  PXSharedLibraryMock *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Removing personUUIDs: %@, from shared library: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v7)
    v7[2](v7, 1, 0);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (PXSharedLibraryParticipant)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PXSharedLibraryRule)rule
{
  return self->_rule;
}

- (void)setRule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)cloudPhotoCount
{
  return self->_cloudPhotoCount;
}

- (unint64_t)cloudVideoCount
{
  return self->_cloudVideoCount;
}

- (unint64_t)cloudItemCount
{
  return self->_cloudItemCount;
}

- (BOOL)isInPreview
{
  return self->_isInPreview;
}

- (void)setIsInPreview:(BOOL)a3
{
  self->_isInPreview = a3;
}

- (BOOL)isOwned
{
  return self->_isOwned;
}

- (void)setIsOwned:(BOOL)a3
{
  self->_isOwned = a3;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (BOOL)isInLocalMode
{
  return self->_isInLocalMode;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isPublished
{
  return self->_isPublished;
}

- (void)setIsPublished:(BOOL)a3
{
  self->_isPublished = a3;
}

- (BOOL)isExiting
{
  return self->_isExiting;
}

- (void)setIsExiting:(BOOL)a3
{
  self->_isExiting = a3;
}

- (BOOL)isDeclined
{
  return self->_isDeclined;
}

- (void)setIsDeclined:(BOOL)a3
{
  self->_isDeclined = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __62__PXSharedLibraryMock_moveAssetsToPersonalLibrary_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Move Assets to Personal Library Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Move Assets to Personal Library Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __60__PXSharedLibraryMock_moveAssetsToSharedLibrary_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Move Assets to Shared Library Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Move Assets to Shared Library Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Deleting Participants Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Deleting Participants Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_62(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_2;
  v13[3] = &unk_1E5136F78;
  v14 = v6;
  v12 = v6;
  v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v13);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Failed to delete participants: Email address not found"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v8);
  }

}

uint64_t __81__PXSharedLibraryMock_deleteParticipants_presentationEnvironment_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __45__PXSharedLibraryMock_canDeleteParticipants___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUser");
}

void __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Adding Participants Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Adding Participants Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __109__PXSharedLibraryMock_addParticipantsWithEmailAddresses_phoneNumbers_presentationEnvironment_withCompletion___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  PXSharedLibraryMockParticipant *v4;

  v3 = a2;
  v4 = objc_alloc_init(PXSharedLibraryMockParticipant);
  -[PXSharedLibraryMockParticipant setEmailAddress:](v4, "setEmailAddress:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __91__PXSharedLibraryMock_exitWithRetentionPolicy_presentationEnvironment_progress_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Exit Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Exit Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __73__PXSharedLibraryMock_exitPreviewWithPresentationEnvironment_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Exit from Preview Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Exit from Preview Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__PXSharedLibraryMock_publishPreviewWithPresentationEnvironment_progress_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Publish Shared Library Preview Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Publish Shared Library Preview Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __55__PXSharedLibraryMock_declineInvitationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __68__PXSharedLibraryMock_acceptInvitationWithRule_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__PXSharedLibraryMock_previewInvitationWithRule_progress_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Create Invitation Preview Failed", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Create Invitation Preview Failed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
