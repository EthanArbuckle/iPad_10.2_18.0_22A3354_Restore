@implementation PLCloudSharedAlbumInvitationRecord

- (PLCloudSharedAlbumInvitationRecord)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  return -[PLCloudSharedAlbumInvitationRecord init](&v3, sel_init);
}

- (void)awakeFromInsert
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  -[PLCloudSharedAlbumInvitationRecord awakeFromInsert](&v6, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord setUuid:](self, "setUuid:", v3);

  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord setCloudGUID:](self, "setCloudGUID:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord setInvitationState:](self, "setInvitationState:", v5);

}

- (void)willSave
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  -[PLManagedObject willSave](&v5, sel_willSave);
  -[PLCloudSharedAlbumInvitationRecord managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "delayedSaveActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordInvitationRecordForCloudFeedUpdate:", self);

  }
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  -[PLManagedObject prepareForDeletion](&v5, sel_prepareForDeletion);
  -[PLCloudSharedAlbumInvitationRecord managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "mergingChanges") & 1) == 0)
  {
    objc_msgSend(v3, "delayedSaveActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordInvitationRecordForCloudFeedUpdate:", self);

  }
}

- (void)delete
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord cloudGUID](self, "cloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteEmailsAndPhonesForInvitationRecordGUID:", v5);

  -[PLCloudSharedAlbumInvitationRecord managedObjectContext](self, "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteObject:", self);

}

- (id)inviteeDisplayNameIncludingEmail:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  -[PLCloudSharedAlbumInvitationRecord inviteeFirstName](self, "inviteeFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord inviteeLastName](self, "inviteeLastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord inviteeFullName](self, "inviteeFullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord inviteeEmails](self, "inviteeEmails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCloudSharedAlbumInvitationRecord inviteePhones](self, "inviteePhones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v11 = v7;
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "length"))
  {
    v11 = v5;
    goto LABEL_3;
  }
  if (objc_msgSend(v6, "length"))
  {
    v11 = v6;
LABEL_3:
    v12 = v11;
    if (!v3)
      goto LABEL_6;
    goto LABEL_4;
  }
  if (objc_msgSend(v9, "length"))
  {
    v12 = v9;
    goto LABEL_6;
  }
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    if (!v3)
      goto LABEL_7;
    v12 = 0;
    goto LABEL_4;
  }
  v21 = v3;
  v22 = v10;
  v23 = v6;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v12 = 0;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        if (v12)
        {
          -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(" / %@"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v20 = objc_claimAutoreleasedReturnValue();

          v12 = (__CFString *)v20;
        }
        else
        {
          v12 = (__CFString *)*(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }
  else
  {
    v12 = 0;
  }

  v10 = v22;
  v6 = v23;
  if (v21)
  {
LABEL_4:
    if (objc_msgSend(v9, "length"))
    {
      -[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR(" (%@)"), v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v13;
    }
  }
LABEL_6:
  if (!v12)
LABEL_7:
    v12 = &stru_1E36789C0;

  return v12;
}

- (NSArray)inviteeEmails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord cloudGUID](self, "cloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailsForInvitationRecordGUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)inviteePhones
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord cloudGUID](self, "cloudGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phonesForInvitationRecordGUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)setInviteeEmails:(id)a3 phones:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personInfoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbumInvitationRecord cloudGUID](self, "cloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEmails:phones:forInvitationRecordGUID:", v7, v6, v9);

}

- (id)invitationStateDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[PLCloudSharedAlbumInvitationRecord invitationState](self, "invitationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  v5 = 0;
  switch(v4)
  {
    case 0:
    case 2:
      return v5;
    case 1:
      -[PLCloudSharedAlbumInvitationRecord invitationStateLocal](self, "invitationStateLocal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "integerValue");

      goto LABEL_3;
    default:
LABEL_3:
      PLLocalizedFrameworkString();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v5;
}

+ (id)entityName
{
  return CFSTR("CloudSharedAlbumInvitationRecord");
}

+ (id)insertNewInvitationRecordIntoAlbum:(id)a3 withFirstName:(id)a4 lastName:(id)a5 fullName:(id)a6 emails:(id)a7 phones:(id)a8 inLibrary:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int IsEqual;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v42 = a4;
  v41 = a5;
  v40 = a6;
  v15 = a7;
  v16 = a8;
  v39 = a9;
  objc_msgSend(v14, "cloudAlbumSubscriberRecords");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v24, "inviteeEmails");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        IsEqual = PLObjectIsEqual();

        objc_msgSend(v24, "inviteePhones");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = PLObjectIsEqual();

        if (IsEqual && (v28 & 1) != 0)
        {
          v32 = 0;
          v36 = v19;
          v34 = v41;
          v33 = v42;
          v30 = v39;
          v35 = v40;
          goto LABEL_13;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v21)
        continue;
      break;
    }
  }

  objc_msgSend(a1, "entityName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v39;
  objc_msgSend(v39, "managedObjectContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v29, (uint64_t)v31, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setInviteeEmails:phones:", v15, v16);
  v33 = v42;
  objc_msgSend(v32, "setInviteeFirstName:", v42);
  v34 = v41;
  objc_msgSend(v32, "setInviteeLastName:", v41);
  v35 = v40;
  objc_msgSend(v32, "setInviteeFullName:", v40);
  if (v14)
  {
    objc_msgSend(v32, "setAlbum:", v14);
    objc_msgSend(v14, "cloudGUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAlbumGUID:", v36);
LABEL_13:

  }
  return v32;
}

+ (id)cloudSharedAlbumInvitationRecordsWithGUIDs:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudGUID in %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityInManagedObjectContext:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEntity:", v12);

  objc_msgSend(v11, "setPredicate:", v10);
  v15 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v11, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v13;
}

+ (id)cloudSharedAlbumInvitationRecordsWithAlbumGUID:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("albumGUID == %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityInManagedObjectContext:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEntity:", v12);

  objc_msgSend(v11, "setPredicate:", v10);
  v15 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v11, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v13;
}

@end
