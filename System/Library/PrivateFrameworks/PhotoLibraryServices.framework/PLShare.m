@implementation PLShare

+ (id)predicateToExcludeExpiredShares
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("expiryDate == nil OR expiryDate > %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateToExcludeTrashedShares
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(trashedState) == %d"), 0);
}

- (void)prepareForDeletion
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLShare;
  -[PLManagedObject prepareForDeletion](&v4, sel_prepareForDeletion);
  -[PLShare managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "mergingChanges") & 1) == 0
    && objc_msgSend((id)objc_opt_class(), "_shouldRecordCloudDeletionForShare:", self))
  {
    objc_msgSend(v3, "recordCloudDeletionForObject:", self);
  }

}

- (void)publishWithCompletionHandler:(id)a3
{
  id v4;
  PLShare *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PLAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)acceptWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_abortIfCalledOnBaseClass");
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudPhotoLibraryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLShare cplScopeChange](self, "cplScopeChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__PLShare_acceptWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E3674E40;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v7, "acceptCPLShare:completionHandler:", v8, v12);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("PLCloudPhotoLibraryManager is not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 41004, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v11);

  }
}

- (void)setPublicPermission:(int64_t)a3
{
  void *v5;

  -[PLShare willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("publicPermission"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("publicPermission"));

  -[PLShare didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("publicPermission"));
}

- (int64_t)publicPermission
{
  void *v3;
  int64_t v4;

  -[PLShare willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("publicPermission"));
  -[PLShare primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("publicPermission"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[PLShare didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("publicPermission"));
  return v4;
}

- (void)setScopeType:(int64_t)a3
{
  void *v5;

  -[PLShare willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("scopeType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("scopeType"));

  -[PLShare didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("scopeType"));
}

- (int64_t)scopeType
{
  void *v3;
  int64_t v4;

  -[PLShare willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("scopeType"));
  -[PLShare primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("scopeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[PLShare didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("scopeType"));
  return v4;
}

- (id)cplScopeChange
{
  PLShare *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)updateShareWithCPLShare:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __objc2_class **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __objc2_class *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __objc2_class *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v67 = a4;
  objc_msgSend((id)objc_opt_class(), "_abortIfCalledOnBaseClass");
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare setShareURL:](self, "setShareURL:", v7);

  -[PLShare setPublicPermission:](self, "setPublicPermission:", objc_msgSend(v6, "publicPermission"));
  -[PLShare participants](self, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "participants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

  v68 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v64 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v65 = v6;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(v6, "participants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  v15 = off_1E365A000;
  v69 = v10;
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v83 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        -[__objc2_class participantWithCPLShareParticipant:inShare:](v15[370], "participantWithCPLShareParticipant:inShare:", v19, self);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = v20;
          if (objc_msgSend(v20, "acceptanceStatus") == 1 && objc_msgSend(v19, "acceptanceStatus") == 2)
          {
            PLBackendSharingGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v21, "uuid");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v90 = v23;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Participant acceptance status changes from pending to accepted: %{public}@", buf, 0xCu);

            }
            objc_msgSend(v66, "addObject:", v21);
          }
        }
        else
        {
          v24 = v15[370];
          -[PLManagedObject photoLibrary](self, "photoLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[__objc2_class insertInPhotoLibrary:](v24, "insertInPhotoLibrary:", v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "setShare:", self);
          objc_msgSend(v21, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "addObject:", v26);

        }
        objc_msgSend(v21, "updateWithCPLShareParticipant:inShare:", v19, self);
        objc_msgSend(v21, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v27);

        if (objc_msgSend(v19, "isCurrentUser"))
        {
          PLBackendSharingGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            -[PLShare uuid](self, "uuid");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "uuid");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v90 = v29;
            v91 = 2114;
            v92 = v30;
            v93 = 2112;
            v94 = v19;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_INFO, "Updating status for %{public}@ from current user: %{public}@, %@", buf, 0x20u);

            v10 = v69;
          }

          -[PLShare _updateShareStatusWithCurrentUser:](self, "_updateShareStatusWithCurrentUser:", v19);
        }

        v15 = off_1E365A000;
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v66, "count") && -[PLShare isCurrentUserOwner](self, "isCurrentUserOwner"))
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v31 = v66;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    if (!v32)
      goto LABEL_33;
    v33 = v32;
    v34 = *(_QWORD *)v79;
    while (1)
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v79 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
        objc_msgSend(v36, "shortName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
          v38 = objc_claimAutoreleasedReturnValue();
          -[PLShare scopeIdentifier](self, "scopeIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject postNotificationForAcceptedSharedLibraryWithScopeIdentifier:participantName:library:notificationDeliveryDate:](v38, "postNotificationForAcceptedSharedLibraryWithScopeIdentifier:participantName:library:notificationDeliveryDate:", v39, v37, v67, v40);

          v10 = v69;
        }
        else
        {
          PLBackendSharingGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            goto LABEL_31;
          objc_msgSend(v36, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v90 = v39;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Accepted participant does not have a short name for notification: %{public}@", buf, 0xCu);
        }

LABEL_31:
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      if (!v33)
      {
LABEL_33:

        v15 = off_1E365A000;
        break;
      }
    }
  }
  if (objc_msgSend(v10, "count"))
  {
    PLBackendSharingGetLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      -[PLShare uuid](self, "uuid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v90 = v10;
      v91 = 2112;
      v92 = v42;
      _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_INFO, "Deleting participants %@ in share %@", buf, 0x16u);

    }
    objc_msgSend(v10, "allObjects");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLShareParticipant participantsWithUUIDs:inPhotoLibrary:](PLShareParticipant, "participantsWithUUIDs:inPhotoLibrary:", v43, v67);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v75 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "uuid");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v50);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      }
      while (v47);
    }

    v15 = off_1E365A000;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v68, "count"))
    {
      objc_msgSend(v68, "allObjects");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = off_1E365A000;
      +[PLLibraryScope informRapportToAddShareParticipantUUIDs:photoLibrary:](PLLibraryScope, "informRapportToAddShareParticipantUUIDs:photoLibrary:", v51, v67);

    }
    if (objc_msgSend(v64, "count"))
    {
      objc_msgSend(v64, "allObjects");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "libraryBundle");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = off_1E365A000;
      +[PLLibraryScope informRapportToRemoveShareParticipantUUIDs:photoLibraryBundle:](PLLibraryScope, "informRapportToRemoveShareParticipantUUIDs:photoLibraryBundle:", v52, v53);

    }
  }
  if (objc_msgSend(v64, "count"))
  {
    v54 = v15[370];
    objc_msgSend(v64, "allObjects");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class participantsWithUUIDs:inPhotoLibrary:](v54, "participantsWithUUIDs:inPhotoLibrary:", v55, v67);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v57 = v56;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v71;
      do
      {
        for (m = 0; m != v59; ++m)
        {
          if (*(_QWORD *)v71 != v60)
            objc_enumerationMutation(v57);
          v62 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * m);
          objc_msgSend(v67, "managedObjectContext");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "deleteObject:", v62);

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
      }
      while (v59);
    }

    v10 = v69;
  }

}

- (id)owner
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_abortIfCalledOnBaseClass");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PLShare participants](self, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "role") == 1)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)currentUserParticipant
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_abortIfCalledOnBaseClass");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PLShare participants](self, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isCurrentUser"))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isCurrentUserOwner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PLShare owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare currentUserParticipant](self, "currentUserParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 == v6;

  return v7;
}

- (void)_updateShareStatusWithCurrentUser:(id)a3
{
  id v5;
  uint64_t v6;
  PLShare *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_abortIfCalledOnBaseClass");
  v6 = objc_msgSend(v5, "role");
  if ((unint64_t)(v6 - 2) < 2)
  {
    switch(objc_msgSend(v5, "acceptanceStatus"))
    {
      case 0:
      case 3:
        PLBackendSharingGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          -[PLShare compactDescription](self, "compactDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v15 = v5;
          v16 = 2112;
          v17 = v10;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Un-expected status from %@ for share %@", buf, 0x16u);

        }
        v7 = self;
        v8 = 0;
        goto LABEL_16;
      case 1:
        v7 = self;
        v8 = 2;
        goto LABEL_16;
      case 2:
        v7 = self;
        v8 = 3;
        goto LABEL_16;
      default:
        break;
    }
  }
  else if (v6)
  {
    if (v6 == 1)
    {
      if (objc_msgSend(v5, "acceptanceStatus") != 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLShare compactDescription](self, "compactDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLShare.m"), 524, CFSTR("Owner %@ of a share %@ should have the accepted status"), v5, v13);

      }
      v7 = self;
      v8 = 1;
LABEL_16:
      -[PLShare setStatus:](v7, "setStatus:", v8);
    }
  }
  else
  {
    PLBackendSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unknown share participant type for %@", buf, 0xCu);
    }

  }
}

- (void)trash
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PLShare setTrashedState:](self, "setTrashedState:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare setTrashedDate:](self, "setTrashedDate:", v3);

  PLBackendSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[PLShare compactDescription](self, "compactDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "Setting share to trashed state: %@", (uint8_t *)&v7, 0xCu);

  }
  -[PLShare managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_shouldRecordCloudDeletionForShare:", self))
    objc_msgSend(v6, "recordCloudDeletionForObject:", self);

}

- (void)untrash
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PLShare setTrashedState:](self, "setTrashedState:", 0);
  -[PLShare setTrashedDate:](self, "setTrashedDate:", 0);
  PLBackendSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PLShare compactDescription](self, "compactDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Setting share to untrashed state: %@", (uint8_t *)&v5, 0xCu);

  }
}

- (int64_t)cloudDeletionType
{
  return objc_msgSend((id)objc_opt_class(), "_cloudDeletionTypeForScopeType:", -[PLShare scopeType](self, "scopeType"));
}

- (BOOL)incrementallyDeleteAndSaveWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  id v13;
  PLShare *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__35431;
  v25 = __Block_byref_object_dispose__35432;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[PLShare managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__PLShare_incrementallyDeleteAndSaveWithError___block_invoke;
  v12[3] = &unk_1E3676348;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v15 = &v17;
  v16 = &v21;
  objc_msgSend(v6, "performBlockAndWait:", v12);

  LODWORD(v6) = *((unsigned __int8 *)v18 + 24);
  v8 = (id)v22[5];
  v9 = v8;
  if (!(_DWORD)v6 && a3)
    *a3 = objc_retainAutorelease(v8);

  v10 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v10;
}

- (id)compactDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare scopeIdentifier](self, "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLShare status](self, "status");
  -[PLShare shareURL](self, "shareURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pl_redactedShareURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare expiryDate](self, "expiryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLShare trashedDate](self, "trashedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ - UUID: %@, ScopeIdentifier: %@, Title: %@, Status: %d, ShareURL: %@, CreationDate: %@, ExpiryDate: %@, TrashedDate: %@"), v3, v4, v5, v6, v7, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_statusDescription
{
  unsigned int v2;

  v2 = -[PLShare status](self, "status");
  if (v2 > 3)
    return CFSTR("owned");
  else
    return off_1E3668E58[(unsigned __int16)v2];
}

void __47__PLShare_incrementallyDeleteAndSaveWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "deleteObject:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "save:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
}

void __39__PLShare_acceptWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__PLShare_acceptWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E3677C18;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = v6;
  v15 = v7;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __39__PLShare_acceptWithCompletionHandler___block_invoke_58;
  v10[3] = &unk_1E3675C58;
  v11 = v6;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v4, "performTransaction:completionHandler:withPriority:", v13, v10, 1);

}

void __39__PLShare_acceptWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PLBackendSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to accept share %@ : %@", (uint8_t *)&v8, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_INFO, "Accepted share %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "setStatus:", 3);
  }
}

uint64_t __39__PLShare_acceptWithCompletionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)_registeredSubclasses
{
  if (_registeredSubclasses_onceToken != -1)
    dispatch_once(&_registeredSubclasses_onceToken, &__block_literal_global_35586);
  return (id)_registeredSubclasses_subclasses;
}

+ (void)_abortIfCalledOnBaseClass
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = a1;
    PLAbstractMethodException();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
}

+ (id)scopeIdentifierPrefix
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)entityName
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)insertInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "_abortIfCalledOnBaseClass");
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v6, (uint64_t)v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUuid:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "scopeIdentifierPrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setScopeIdentifier:", v12);
  return v7;
}

+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 inPhotoLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "_abortIfCalledOnBaseClass");
  objc_msgSend(a1, "insertInPhotoLibrary:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setTitle:", v11);
  objc_msgSend(v14, "setCreationDate:", v12);

  objc_msgSend(v14, "setUuid:", v13);
  objc_msgSend(v14, "setStatus:", 1);
  return v14;
}

+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  PLAbstractMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

+ (BOOL)_shouldRecordCloudDeletionForShare:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "status")
    && objc_msgSend(v3, "scopeType") != 4
    && objc_msgSend(v3, "scopeType") != 5;

  return v4;
}

+ (id)shareWithScopedIdentifier:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isInAMomentShare"))
  {
    objc_msgSend(v8, "scopeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v10, v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)shareWithScopeIdentifier:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v5 = a4;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "_basePredicateIncludeTrashedShares:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("scopeIdentifier"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v14, 1, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)shareWithScopeIdentifiers:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v5 = a4;
  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "_basePredicateIncludeTrashedShares:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("scopeIdentifier"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v14, 0, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)shareWithUUID:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v5 = a4;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "_basePredicateIncludeTrashedShares:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v14, 1, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)shareWithShareURL:(id)a3 includeTrashed:(BOOL)a4 inManagedObjectContext:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v5 = a4;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "_basePredicateIncludeTrashedShares:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("shareURL"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v14, 1, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)sharesWithPredicate:(id)a3 fetchLimit:(unint64_t)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  unint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __65__PLShare_sharesWithPredicate_fetchLimit_inManagedObjectContext___block_invoke;
  v28[3] = &unk_1E3668DC0;
  v10 = v8;
  v29 = v10;
  v31 = a4;
  v11 = v9;
  v30 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v28);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_opt_class();
  if (v14 == objc_opt_class())
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(a1, "_registeredSubclasses", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20), "entityName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v12)[2](v12, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v13, "addObjectsFromArray:", v22);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }
  }
  else
  {
    objc_msgSend(a1, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v13, "addObjectsFromArray:", v16);
  }

  return v13;
}

+ (BOOL)getShareIfNecessary:(id *)a3 forCPLRecordWithClass:(Class)a4 scopedIdentifier:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  int v22;
  Class v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "isInAMomentShare"))
  {
    objc_msgSend(v11, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
    objc_msgSend(a1, "shareWithScopedIdentifier:includeTrashed:inManagedObjectContext:", v10, 1, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v22 = 138543618;
          v23 = a4;
          v24 = 2112;
          v25 = v10;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to find moment share for <%{public}@ %@>", (uint8_t *)&v22, 0x16u);
        }
LABEL_11:

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v10, "scopeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mainScopeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v18 & 1) == 0)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "mainScopeIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543874;
          v23 = a4;
          v24 = 2112;
          v25 = v10;
          v26 = 2112;
          v27 = v19;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Invalid scope identifier for  <%{public}@ %@> (expecting %@)", (uint8_t *)&v22, 0x20u);

        }
        goto LABEL_11;
      }
LABEL_12:
      v14 = 0;
      v13 = 0;
      goto LABEL_13;
    }
    v14 = 0;
    v13 = 1;
  }
LABEL_13:
  v20 = objc_retainAutorelease(v14);
  *a3 = v20;

  return v13;
}

+ (id)_basePredicateIncludeTrashedShares:(BOOL)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trashedState"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)fetchShareFromShareURL:(id)a3 inPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudPhotoLibraryManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    PLBackendSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "pl_redactedShareURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Fetching share from URL: %@", buf, 0xCu);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke;
    v19[3] = &unk_1E3668E38;
    v20 = v8;
    v23 = v10;
    v24 = a1;
    v21 = v9;
    v22 = v12;
    objc_msgSend(v22, "fetchShareFromShareURL:completionHandler:", v20, v19);

    v15 = v20;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("PLCloudPhotoLibraryManager is not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 41004, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v18);

  }
}

+ (BOOL)incrementallyDeleteAndSaveShares:(id)a3 logMessagePrefix:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  id *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v25 = a4;
  PLBackendSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v33 = objc_msgSend(v7, "count");
    v34 = 2112;
    v35 = v25;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Deleting %lu (%@) shares...", buf, 0x16u);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v10)
  {
    v13 = 0;
    v12 = v9;
LABEL_23:

    goto LABEL_24;
  }
  v11 = v10;
  v24 = a5;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v28;
  do
  {
    v15 = 0;
    v16 = v12;
    do
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
      v18 = (void *)MEMORY[0x19AEC1554]();
      v26 = v16;
      v19 = objc_msgSend(v17, "incrementallyDeleteAndSaveWithError:", &v26);
      v12 = v26;

      if ((v19 & 1) != 0)
      {
        ++v13;
      }
      else
      {
        PLBackendSharingGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v33 = (uint64_t)v25;
          v34 = 2112;
          v35 = v12;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to delete (%@) share: %@", buf, 0x16u);
        }

      }
      objc_autoreleasePoolPop(v18);
      ++v15;
      v16 = v12;
    }
    while (v11 != v15);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v11);

  if (v13 >= 1)
  {
    PLBackendSharingGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v33 = v13;
      v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "Deleted %lu (%@) shares", buf, 0x16u);
    }

  }
  if (v12)
  {
    if (v24)
    {
      v12 = objc_retainAutorelease(v12);
      *v24 = v12;
    }
    goto LABEL_23;
  }
LABEL_24:
  v22 = v13 == objc_msgSend(v9, "count");

  return v22;
}

+ (void)deleteAllSharesInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v5, 0, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "incrementallyDeleteAndSaveShares:logMessagePrefix:error:", v6, CFSTR("all"), 0);
  objc_autoreleasePoolPop(v4);

}

+ (void)deleteExpiredSharesInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("expiryDate != nil AND expiryDate < %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v7, 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "incrementallyDeleteAndSaveShares:logMessagePrefix:error:", v8, CFSTR("expired"), 0);

  objc_autoreleasePoolPop(v4);
}

+ (void)deleteOldTrashedSharesInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setMonth:", -3);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Deleting trashed shares older than %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trashedDate != nil AND trashedDate < %@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v11, 0, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "incrementallyDeleteAndSaveShares:logMessagePrefix:error:", v12, CFSTR("old trashed"), 0);

  objc_autoreleasePoolPop(v5);
}

+ (BOOL)validateCPLScopeChange:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "creationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
LABEL_3:
      v5 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(v3, "share");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_3;
  }
  PLBackendSharingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Triggering tap to radar for CPLScopeChange with nil creationDate", buf, 2u);
  }

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D11460], "descriptionForScopeType:", objc_msgSend(v3, "scopeType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("TTR: Inconsistent %@ scope detected"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D11460], "descriptionForScopeType:", objc_msgSend(v3, "scopeType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scopeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("A %@ scope was detected in an inconsistent state and ignored: %@"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Inconsistent Scope State Detected"), CFSTR("Your photo library has experienced an unexpected state, please file a Radar against Photos to help us diagnose the issue"), v11, v15);
  PLBackendSharingGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v15;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_FAULT, "%{public}@", buf, 0xCu);
  }

  v5 = 0;
LABEL_10:

  return v5;
}

+ (BOOL)supportsCPLScopeType:(int64_t)a3
{
  id v3;
  id v4;

  v3 = a1;
  PLAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a1;
  PLAbstractMethodException();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scopeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(a1, "_cloudDeletionTypeForScopeType:", (int)objc_msgSend(v5, "intValue"));
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "_cloudDeletionTypeForStatus:", (__int16)objc_msgSend(v8, "intValue"));

  }
  return v7;
}

+ (int64_t)_cloudDeletionTypeForScopeType:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int64_t result;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0:
    case 1:
    case 6:
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid scope type for cloud deletetion: %ld"), a3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v8 = v5;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);

      }
      goto LABEL_5;
    case 2:
      result = 6;
      break;
    case 3:
      result = 7;
      break;
    case 4:
      result = 11;
      break;
    case 5:
      result = 12;
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

+ (int64_t)_cloudDeletionTypeForStatus:(signed __int16)a3
{
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((a3 - 2) < 2)
    return 7;
  if (a3)
  {
    if (a3 == 1)
      return 6;
    else
      return 0;
  }
  else
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid share status for cloud deletetion: %d"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);

    }
    return 0;
  }
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("scopeIdentifier");
}

void __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  id v22;
  id obj;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _BYTE *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v22 = a3;
  if (v22)
  {
    PLBackendSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch share from %{public}@: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 64), "_registeredSubclasses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v35;
      *(_QWORD *)&v9 = 138412546;
      v21 = v9;
LABEL_7:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
        if (objc_msgSend(v12, "supportsCPLScopeType:", objc_msgSend(v5, "scopeType", v21)))
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v43 = __Block_byref_object_copy__35431;
          v44 = __Block_byref_object_dispose__35432;
          v45 = 0;
          v32[0] = 0;
          v32[1] = v32;
          v32[2] = 0x3032000000;
          v32[3] = __Block_byref_object_copy__35431;
          v32[4] = __Block_byref_object_dispose__35432;
          v33 = 0;
          objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "libraryBundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "+[PLShare fetchShareFromShareURL:inPhotoLibrary:completionHandler:]_block_invoke", v14);

          v31 = 0;
          v16 = objc_msgSend(v12, "shouldAllowFetchURLWithScopeChange:photoLibrary:error:", v5, v15, &v31);
          v17 = v31;
          if ((v16 & 1) != 0)
          {
            v18 = *(void **)(a1 + 48);
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_55;
            v24[3] = &unk_1E3668E10;
            v25 = v15;
            v28 = v32;
            v30 = v12;
            v26 = v5;
            v29 = buf;
            v27 = *(id *)(a1 + 56);
            objc_msgSend(v18, "performTransactionOnLibraryScopeSynchronizationQueue:", v24);

          }
          else
          {
            PLBackendSharingGetLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(*(id *)(a1 + 32), "pl_redactedShareURL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v38 = v21;
              v39 = v20;
              v40 = 2114;
              v41 = v17;
              _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Not ingesting shareURL: %@ due to %{public}@", v38, 0x16u);

            }
            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          }

          _Block_object_dispose(v32, 8);
          _Block_object_dispose(buf, 8);

          if ((v16 & 1) != 0)
            break;
        }
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          if (v8)
            goto LABEL_7;
          break;
        }
      }
    }

  }
}

void __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_55(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_2;
  v12[3] = &unk_1E3668DE8;
  v3 = *(_QWORD *)(a1 + 72);
  v15 = *(_QWORD *)(a1 + 56);
  v17 = v3;
  v4 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 64);
  v14 = v5;
  v16 = v6;
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_3;
  v9[3] = &unk_1E3674CE0;
  v8 = *(_OWORD *)(a1 + 48);
  v7 = (id)v8;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "performTransactionAndWait:completionHandler:", v12, v9);

}

void __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 64), "insertOrUpdateShareWithCPLScopeChange:inPhotoLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "uuid");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __67__PLShare_fetchShareFromShareURL_inPhotoLibrary_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "autoAcceptShareIfNecessary");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __65__PLShare_sharesWithPredicate_fetchLimit_inManagedObjectContext___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", a1[4]);
  if (a1[6])
    objc_msgSend(v3, "setFetchLimit:");
  v4 = (void *)a1[5];
  v10 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (!v5)
  {
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch shares with predicate %@: %@", buf, 0x16u);
    }

  }
  return v5;
}

void __32__PLShare__registeredSubclasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_registeredSubclasses_subclasses;
  _registeredSubclasses_subclasses = v0;

}

@end
