@implementation PLCloudSharingInvitationChangeJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PLCloudSharingInvitationChangeJob;
  v4 = a3;
  -[PLDaemonJob encodeToXPCObject:](&v14, sel_encodeToXPCObject_, v4);
  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[PLCloudSharingInvitationChangeJob MSASSharingRelationships](self, "MSASSharingRelationships");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (!v7)
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Failed to archive msASRelationshipsData, error: %@", buf, 0xCu);
    }

  }
  PLXPCDictionarySetData();
  xpc_dictionary_set_int64(v4, (const char *)propertyKeyRelationshipChangeType, -[PLCloudSharingInvitationChangeJob relationshipChangeType](self, "relationshipChangeType"));
  -[PLCloudSharingInvitationChangeJob albumGUID](self, "albumGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharingInvitationChangeJob resendInvitationGUID](self, "resendInvitationGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharingInvitationChangeJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetDictionary();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyJobType, -[PLCloudSharingInvitationChangeJob jobType](self, "jobType"));
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLCloudSharingInvitationChangeJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v18, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    PLDataFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pl_safeUnarchiveObjectFromData:classes:", v8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v7, "setMSASSharingRelationships:", v13);
    objc_msgSend(v7, "setRelationshipChangeType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyRelationshipChangeType));
    PLStringFromXPCDictionary();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlbumGUID:", v14);

    PLStringFromXPCDictionary();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setResendInvitationGUID:", v15);

    PLDictionaryFromXPCDictionary();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMstreamdInfoDictionary:", v16);

    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyJobType));
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PLCloudSharingInvitationChangeJob MSASSharingRelationships](self, "MSASSharingRelationships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLCloudSharingInvitationChangeJob relationshipChangeType](self, "relationshipChangeType");
  -[PLCloudSharingInvitationChangeJob albumGUID](self, "albumGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharingInvitationChangeJob resendInvitationGUID](self, "resendInvitationGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharingInvitationChangeJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (MSASSharingRelationships=%@ relationshipChangeType=%lld albumGUID=%@ resendInvitationGUID=%@ mstreamdInfo=%@) "), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)daemonOperation
{
  return 7;
}

- (BOOL)shouldArchiveXPCToDisk
{
  void *v2;
  BOOL v3;

  -[PLCloudSharingInvitationChangeJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)runDaemonSide
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  PLCloudSharingInvitationChangeJob *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = (id)objc_opt_class();
    v12 = 2112;
    v13 = self;
    v4 = v11;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharingInvitationChangeJob runDaemonSide]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "highPriorityOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PLCloudSharingInvitationChangeJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "addOperationWithBlock:", v8);

}

- (void)executeSaveServerStateLocallyForSharingInvitationRelationships
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLCloudSharingInvitationChangeJob MSASSharingRelationships](self, "MSASSharingRelationships");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "executeSaveServerStateLocallyForSharingRelationships %@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)executeSaveServerStateLocallyForSharingACLRelationships
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLCloudSharingInvitationChangeJob MSASSharingRelationships](self, "MSASSharingRelationships");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "executeSaveServerStateLocallyForSharingACLRelationships %@", buf, 0xCu);

  }
  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__PLCloudSharingInvitationChangeJob_executeSaveServerStateLocallyForSharingACLRelationships__block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performTransactionAndWait:", v7);

}

- (void)executeSendServerPendingInvitationsForAlbumWithGUID
{
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _BYTE *v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;
  _BYTE *v18;
  BOOL v19;
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLCloudSharingInvitationChangeJob albumGUID](self, "albumGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharingInvitationChangeJob resendInvitationGUID](self, "resendInvitationGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "executeSendServerPendingInvitationsForAlbumWithGUID %@ resendInvitationGUID %@", buf, 0x16u);

  }
  v6 = -[PLCloudSharingInvitationChangeJob jobType](self, "jobType") == 4;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v21 = __Block_byref_object_copy__65889;
  v22 = __Block_byref_object_dispose__65890;
  v23 = 0;
  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke;
  v16[3] = &unk_1E3676E78;
  v16[4] = self;
  v10 = v7;
  v19 = v6;
  v17 = v10;
  v18 = buf;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke_46;
  v12[3] = &unk_1E3676E78;
  v14 = buf;
  v12[4] = self;
  v11 = v8;
  v13 = v11;
  v15 = v6;
  objc_msgSend(v10, "performBlockAndWait:completionHandler:", v16, v12);

  _Block_object_dispose(buf, 8);
}

- (NSArray)MSASSharingRelationships
{
  return self->_MSASSharingRelationships;
}

- (void)setMSASSharingRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_MSASSharingRelationships, a3);
}

- (int64_t)relationshipChangeType
{
  return self->_relationshipChangeType;
}

- (void)setRelationshipChangeType:(int64_t)a3
{
  self->_relationshipChangeType = a3;
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (NSString)resendInvitationGUID
{
  return self->_resendInvitationGUID;
}

- (void)setResendInvitationGUID:(id)a3
{
  objc_storeStrong((id *)&self->_resendInvitationGUID, a3);
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (NSDictionary)mstreamdInfoDictionary
{
  return self->_mstreamdInfoDictionary;
}

- (void)setMstreamdInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, 0);
  objc_storeStrong((id *)&self->_resendInvitationGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_MSASSharingRelationships, 0);
}

void __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "albumGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "invitationRecords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v38 = v3;
    v39 = 2048;
    v40 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "found plAlbum %@ with invitationRecods %lu", buf, 0x16u);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = v3;
  objc_msgSend(v3, "invitationRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        PLPhotoSharingGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v11;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "invitation record %@", buf, 0xCu);
        }

        objc_msgSend(v11, "invitationState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "intValue") == 1)
        {

        }
        else
        {
          v14 = *(unsigned __int8 *)(a1 + 56);

          if (!v14)
            continue;
        }
        if (*(_BYTE *)(a1 + 56))
        {
          objc_msgSend(v11, "cloudGUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "resendInvitationGUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if (!v17)
            continue;
        }
        PLPhotoSharingGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "record state is kMSASRelationshipStatePending, will send invitation", buf, 2u);
        }

        v19 = objc_alloc_init(MEMORY[0x1E0D16C68]);
        objc_msgSend(v11, "cloudGUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setGUID:", v20);

        objc_msgSend(v11, "inviteeEmails");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setEmails:", v21);

        objc_msgSend(v11, "inviteePhones");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPhones:", v22);

        objc_msgSend(v11, "inviteeFirstName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFirstName:", v23);

        objc_msgSend(v11, "inviteeLastName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLastName:", v24);

        objc_msgSend(v11, "inviteeFullName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setFullName:", v25);

        objc_msgSend(v11, "inviteeHashedPersonID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPersonID:", v26);

        objc_msgSend(v19, "setState:", 1);
        v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (!v27)
        {
          v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v30 = *(void **)(v29 + 40);
          *(_QWORD *)(v29 + 40) = v28;

          v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        }
        objc_msgSend(v27, "addObject:", v19);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

}

void __88__PLCloudSharingInvitationChangeJob_executeSendServerPendingInvitationsForAlbumWithGUID__block_invoke_46(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = (void *)objc_opt_class();
      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v7 = *(void **)(a1 + 32);
      v8 = v5;
      objc_msgSend(v7, "albumGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v18 = 138413058;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@: about to call connection addAccessControlEntries: %@ toAlbumWithGUID: %@ forPersonID %@", (uint8_t *)&v18, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "albumGUID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[NSObject addAccessControlEntries:toAlbumWithGUID:personID:](v11, "addAccessControlEntries:toAlbumWithGUID:personID:", v12, v13, *(_QWORD *)(a1 + 40));
    goto LABEL_5;
  }
  if (v4)
  {
    v18 = 138412290;
    v19 = (id)objc_opt_class();
    v14 = v19;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@: no sharing invitations to send", (uint8_t *)&v18, 0xCu);

  }
  if (*(_BYTE *)(a1 + 56))
  {
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v15 = (void *)objc_opt_class();
    v16 = *(void **)(a1 + 32);
    v13 = v15;
    objc_msgSend(v16, "resendInvitationGUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v15;
    v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "%@: failed to find invitation GUID %@ to resend", (uint8_t *)&v18, 0x16u);

LABEL_5:
LABEL_6:

  }
}

void __92__PLCloudSharingInvitationChangeJob_executeSaveServerStateLocallyForSharingACLRelationships__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  const __CFString *v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v1 = a1;
  v91 = *MEMORY[0x1E0C80C00];
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "MSASSharingRelationships");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v90, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v68;
    v61 = v1;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v68 != v65)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v2);
        objc_msgSend(v3, "GUID");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        if (v4 && objc_msgSend(v4, "length"))
        {
          v89 = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCloudSharedAlbumInvitationRecord cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:](PLCloudSharedAlbumInvitationRecord, "cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:", v6, *(_QWORD *)(v1 + 40));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "firstObject");
          v8 = objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(v1 + 32), "relationshipChangeType") == 1
            || objc_msgSend(*(id *)(v1 + 32), "relationshipChangeType") == 3)
          {
            objc_msgSend(v3, "albumGUID");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v9, *(_QWORD *)(v1 + 40));
            v10 = objc_claimAutoreleasedReturnValue();

            if (!v10)
            {
              PLPhotoSharingGetLog();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v3, "albumGUID");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v72 = (uint64_t)v12;
                _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "WARNING: couldn't find album with GUID %@ to set sharingRelationship", buf, 0xCu);

              }
            }
            v64 = (void *)v10;
            v63 = objc_msgSend(v3, "state");
            if (v8)
            {
              -[NSObject invitationState](v8, "invitationState");
              v13 = objc_claimAutoreleasedReturnValue();
              v62 = (int)-[NSObject intValue](v13, "intValue");
            }
            else
            {
              objc_msgSend(v3, "firstName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "lastName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "fullName");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "emails");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "phones");
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = v1;
              v25 = (void *)v23;
              +[PLCloudSharedAlbumInvitationRecord insertNewInvitationRecordIntoAlbum:withFirstName:lastName:fullName:emails:phones:inLibrary:](PLCloudSharedAlbumInvitationRecord, "insertNewInvitationRecordIntoAlbum:withFirstName:lastName:fullName:emails:phones:inLibrary:", v64, v19, v20, v21, v22, v23, *(_QWORD *)(v24 + 40));
              v8 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v3, "GUID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setCloudGUID:](v8, "setCloudGUID:", v26);

              PLPhotoSharingGetLog();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "inserting new PLCloudSharedAlbumInvitationRecord", buf, 2u);
              }
              v62 = 0x7FFFFFFFFFFFFFFFLL;
              v1 = v61;
            }

            objc_msgSend(v3, "albumGUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setAlbumGUID:](v8, "setAlbumGUID:", v27);

            objc_msgSend(v3, "emails");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "phones");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setInviteeEmails:phones:](v8, "setInviteeEmails:phones:", v28, v29);

            objc_msgSend(v3, "firstName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setInviteeFirstName:](v8, "setInviteeFirstName:", v30);

            objc_msgSend(v3, "lastName");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setInviteeLastName:](v8, "setInviteeLastName:", v31);

            objc_msgSend(v3, "personID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setInviteeHashedPersonID:](v8, "setInviteeHashedPersonID:", v32);

            objc_msgSend(v3, "fullName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setInviteeFullName:](v8, "setInviteeFullName:", v33);

            objc_msgSend(v3, "subscriptionDate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setInviteeSubscriptionDate:](v8, "setInviteeSubscriptionDate:", v34);

            -[NSObject setIsMine:](v8, "setIsMine:", objc_msgSend(v3, "isMine"));
            PLPhotoSharingGetLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v64, "title");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "cloudGUID");
              v57 = v5;
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject inviteeFirstName](v8, "inviteeFirstName");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject inviteeLastName](v8, "inviteeLastName");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject inviteeFullName](v8, "inviteeFullName");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject inviteeEmails](v8, "inviteeEmails");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject inviteePhones](v8, "inviteePhones");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject inviteeHashedPersonID](v8, "inviteeHashedPersonID");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = -[NSObject isMine](v8, "isMine");
              *(_DWORD *)buf = 138414338;
              v43 = CFSTR("NO");
              if (v42)
                v43 = CFSTR("YES");
              v72 = (uint64_t)v59;
              v73 = 2112;
              v74 = v58;
              v75 = 2112;
              v76 = v36;
              v77 = 2112;
              v78 = v37;
              v79 = 2112;
              v80 = v38;
              v81 = 2112;
              v82 = v39;
              v83 = 2112;
              v84 = v40;
              v85 = 2112;
              v86 = v41;
              v87 = 2112;
              v88 = v43;
              _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "setting person info for invitation record on album '%@' (%@): %@, %@, %@, %@, %@, hashedPersonID %@ isMine %@", buf, 0x5Cu);

              v1 = v61;
              v5 = v57;

            }
            objc_msgSend(*(id *)(v1 + 40), "personInfoManager");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "firstName");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "lastName");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "fullName");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "email");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "personID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setFirstName:lastName:fullName:email:forPersonID:", v45, v46, v47, v48, v49);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v63);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setInvitationState:](v8, "setInvitationState:", v50);

            -[NSObject album](v8, "album");
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v64 && !v51)
              -[NSObject setAlbum:](v8, "setAlbum:", v64);
            PLPhotoSharingGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v72 = (uint64_t)v8;
              v73 = 2112;
              v74 = v3;
              _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "resulting invitation record %@ for MSASSharingRelationship %@", buf, 0x16u);
            }

            +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v1 = v61;
            objc_msgSend(*(id *)(v61 + 32), "mstreamdInfoDictionary");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "noteInvitationRecordStatusChanged:fromOldState:mstreamdInfo:", v8, v62, v54);

          }
          else
          {
            if (objc_msgSend(*(id *)(v1 + 32), "relationshipChangeType") != 2)
            {
              PLPhotoSharingGetLog();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                v55 = objc_msgSend(*(id *)(v1 + 32), "relationshipChangeType");
                *(_DWORD *)buf = 134217984;
                v72 = v55;
                _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "ERROR: unknown relationship change type %lld", buf, 0xCu);
              }
              goto LABEL_20;
            }
            -[NSObject delete](v8, "delete");
          }
        }
        else
        {
          if (!objc_msgSend(v3, "state"))
          {
            objc_msgSend(*(id *)(v1 + 40), "personInfoManager");
            v8 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "firstName");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "lastName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "fullName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "email");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "personID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setFirstName:lastName:fullName:email:forPersonID:](v8, "setFirstName:lastName:fullName:email:forPersonID:", v14, v15, v16, v17, v18);

LABEL_20:
            goto LABEL_34;
          }
          PLPhotoSharingGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v72 = (uint64_t)v3;
            _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "found sharingRelationship without GUID: %@. Skipping", buf, 0xCu);
          }
        }
LABEL_34:

        ++v2;
      }
      while (v66 != v2);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v90, 16);
      v66 = v56;
    }
    while (v56);
  }

}

void __50__PLCloudSharingInvitationChangeJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "jobType");
  if ((unint64_t)(v3 - 3) < 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "executeSendServerPendingInvitationsForAlbumWithGUID");
  }
  else if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "executeSaveServerStateLocallyForSharingInvitationRelationships");
  }
  else if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "executeSaveServerStateLocallyForSharingACLRelationships");
  }
  else
  {
    PLPhotoSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Error: unknown job type for %@", buf, 0xCu);
    }

  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)PLCloudSharingInvitationChangeJob;
  objc_msgSendSuper2(&v6, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_autoreleasePoolPop(v2);
}

+ (void)saveServerStateLocallyForSharingACLRelationships:(id)a3 changeType:(int64_t)a4 info:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v9, "setJobType:", 1);
  objc_msgSend(v9, "setMSASSharingRelationships:", v8);

  objc_msgSend(v9, "setRelationshipChangeType:", a4);
  objc_msgSend(v9, "setMstreamdInfoDictionary:", v7);

  objc_msgSend(v9, "runAndWaitForMessageToBeSent");
}

+ (void)saveServerStateLocallyForSharingInvitationRelationships:(id)a3 changeType:(int64_t)a4 info:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v9, "setJobType:", 2);
  objc_msgSend(v9, "setMSASSharingRelationships:", v8);

  objc_msgSend(v9, "setRelationshipChangeType:", a4);
  objc_msgSend(v9, "setMstreamdInfoDictionary:", v7);

  objc_msgSend(v9, "runAndWaitForMessageToBeSent");
}

+ (void)sendServerPendingInvitationsForAlbumWithGUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setJobType:", 3);
  objc_msgSend(v4, "setAlbumGUID:", v3);

  objc_msgSend(v4, "setMstreamdInfoDictionary:", 0);
  objc_msgSend(v4, "run");

}

+ (void)resendPendingInvitationWithGUID:(id)a3 albumGUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = (id)objc_opt_class();
      v10 = v15;
      v11 = "%@ : cannot resend invitation with nil invitation GUID";
      v12 = v9;
      v13 = 12;
LABEL_8:
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);

    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v6)
  {
    PLPhotoSharingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = (id)objc_opt_class();
      v16 = 2112;
      v17 = v5;
      v10 = v15;
      v11 = "%@ : cannot resend invitation %@ with nil album GUID";
      v12 = v9;
      v13 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v8, "setJobType:", 4);
  objc_msgSend(v8, "setAlbumGUID:", v7);
  objc_msgSend(v8, "setResendInvitationGUID:", v5);
  objc_msgSend(v8, "setMstreamdInfoDictionary:", 0);
  objc_msgSend(v8, "run");

LABEL_10:
}

@end
