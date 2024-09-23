@implementation PLCloudSharedAlbum

- (BOOL)hasUnseenContentBoolValue
{
  void *v2;
  char v3;

  -[PLCloudSharedAlbum hasUnseenContent](self, "hasUnseenContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHasUnseenContentBoolValue:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum setHasUnseenContent:](self, "setHasUnseenContent:", v4);

}

- (unint64_t)unseenAssetsCountIntegerValue
{
  void *v2;
  unint64_t v3;

  -[PLCloudSharedAlbum unseenAssetsCount](self, "unseenAssetsCount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setUnseenAssetsCountIntegerValue:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum setUnseenAssetsCount:](self, "setUnseenAssetsCount:", v4);

}

- (void)getUnseenStartMarkerIndex:(unint64_t *)a3 count:(unint64_t *)a4 showsProgress:(BOOL *)a5
{
  unint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t v12;

  v9 = -[PLCloudSharedAlbum unseenAssetsCountIntegerValue](self, "unseenAssetsCountIntegerValue");
  if (v9)
  {
    -[PLCloudSharedAlbum assets](self, "assets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    v12 = v11 - v9;
    if (!a3)
      goto LABEL_6;
  }
  else
  {
    v12 = -1;
    if (!a3)
      goto LABEL_6;
  }
  if (v12 < 0)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  *a3 = v12;
LABEL_6:
  if (a4)
    *a4 = v9;
  if (a5)
    *a5 = 0;
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedAlbum;
  -[PLGenericAlbum awakeFromInsert](&v4, sel_awakeFromInsert);
  -[PLGenericAlbum setKindValue:](self, "setKindValue:", 1505);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum setCloudGUID:](self, "setCloudGUID:", v3);

}

- (void)willSave
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbum;
  -[PLManagedAlbum willSave](&v5, sel_willSave);
  -[PLCloudSharedAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "delayedSaveActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordAlbumForCloudFeedUpdate:", self);

  }
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbum;
  -[PLManagedAlbum prepareForDeletion](&v5, sel_prepareForDeletion);
  -[PLCloudSharedAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "mergingChanges") & 1) == 0)
  {
    objc_msgSend(v3, "delayedSaveActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordAlbumForCloudFeedUpdate:", self);

  }
}

- (id)albumDirectoryPath
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PLCloudSharedAlbum cloudGUID](self, "cloudGUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("FS-")) & 1) != 0
    || (v4 = v3, objc_msgSend(v3, "hasPrefix:", CFSTR("fs-"))))
  {
    objc_msgSend(v3, "substringFromIndex:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  if (v5)
  {
    -[PLCloudSharedAlbum cloudPersonID](self, "cloudPersonID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAlbum managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoDirectoryWithType:", 22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      if (v6)
      {
LABEL_7:
        objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("personID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v14, 4, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
      if (v15)
        goto LABEL_7;
    }
    v11 = 0;
    goto LABEL_13;
  }
  PLPhotoSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[PLCloudSharedAlbum uuid](self, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v3;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Invalid cloudGIUD (%@) for album (uuid: %@)", (uint8_t *)&v17, 0x16u);

  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)deleteFromDatabaseOnly
{
  void *v4;

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudSharedAlbum.m"), 176, CFSTR("deleteFromDatabaseOnly is only safe from inside of assetsd!"));

  }
  *(&self->super.super.didRegisteredWithUserInterfaceContext + 3) = 1;
  -[PLCloudSharedAlbum delete](self, "delete");
}

- (void)delete
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(&self->super.super.didRegisteredWithUserInterfaceContext + 3))
  {
    v3 = 0;
  }
  else
  {
    -[PLCloudSharedAlbum albumDirectoryPath](self, "albumDirectoryPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedAlbum removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v5);

  }
  -[PLCloudSharedAlbum assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v24.receiver = self;
  v24.super_class = (Class)PLCloudSharedAlbum;
  -[PLGenericAlbum delete](&v24, sel_delete);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Shared Streams]The shared album %@ was deleted, removing all of its assets."), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCloudSharedAlbum managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __28__PLCloudSharedAlbum_delete__block_invoke;
  v22[3] = &unk_1E3677A78;
  v22[4] = self;
  v12 = v9;
  v23 = v12;
  objc_msgSend(v10, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v11, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    PLPhotoSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to save the deletion of shared album assets. Error: %@", buf, 0xCu);
    }

  }
  if (v3)
  {
    PLPhotoSharingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v3;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "deleting album directory path %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v17 = objc_msgSend(v16, "removeItemAtPath:error:", v3, &v21);
    v18 = v21;

    if ((v17 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "error %@", buf, 0xCu);
      }

    }
  }
  if (!*(&self->super.super.didRegisteredWithUserInterfaceContext + 3))
  {
    -[PLCloudSharedAlbum cloudGUID](self, "cloudGUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPhotoSharingHelper deleteDebugBreadcrumbsForAlbumGUID:](PLPhotoSharingHelper, "deleteDebugBreadcrumbsForAlbumGUID:", v20);

  }
}

- (id)sortDescriptorsForKeyAssetsCandidates
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("albums"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortingComparator
{
  return (id)objc_msgSend(&__block_literal_global_63079, "copy");
}

- (int)cloudRelationshipStateValue
{
  void *v2;
  int v3;

  -[PLCloudSharedAlbum cloudRelationshipState](self, "cloudRelationshipState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)cloudRelationshipStateLocalValue
{
  void *v2;
  int v3;

  -[PLCloudSharedAlbum cloudRelationshipState](self, "cloudRelationshipState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (id)emailAddressManager
{
  void *v2;
  void *v3;
  void *v4;

  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddressManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = -[PLCloudSharedAlbum isOwnedCloudSharedAlbum](self, "isOwnedCloudSharedAlbum");
  -[PLCloudSharedAlbum cloudOwnerFirstName](self, "cloudOwnerFirstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudOwnerLastName](self, "cloudOwnerLastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudOwnerFullName](self, "cloudOwnerFullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudOwnerEmailKey](self, "cloudOwnerEmailKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum emailAddressManager](self, "emailAddressManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum localizedSharedByLabelWithFirstName:lastName:fullName:emailKey:isOwned:allowsEmail:emailAddressManager:](PLCloudSharedAlbum, "localizedSharedByLabelWithFirstName:lastName:fullName:emailKey:isOwned:allowsEmail:emailAddressManager:", v6, v7, v8, v9, v5, v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)localizedSharedWithLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PLCloudSharedAlbum cloudAlbumSubscriberRecords](self, "cloudAlbumSubscriberRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (!-[PLCloudSharedAlbum isOwnedCloudSharedAlbum](self, "isOwnedCloudSharedAlbum"))
  {
    PLServicesLocalizedFrameworkString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAlbum cloudOwnerDisplayNameIncludingEmail:allowsEmail:](self, "cloudOwnerDisplayNameIncludingEmail:allowsEmail:", 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PFStringWithValidatedFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (v4 == 1)
  {
    PLServicesLocalizedFrameworkString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inviteeDisplayNameIncludingEmail:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PFStringWithValidatedFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  if (v4)
  {
    PLServicesLocalizedFrameworkString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PFStringWithValidatedFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  PLServicesLocalizedFrameworkString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return (NSString *)v5;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  void *v2;
  char v3;

  -[PLCloudSharedAlbum isOwned](self, "isOwned");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isFamilyCloudSharedAlbum
{
  return -[PLCloudSharedAlbum cloudAlbumSubtype](self, "cloudAlbumSubtype") == 1;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  void *v2;
  char v3;

  -[PLCloudSharedAlbum cloudMultipleContributorsEnabled](self, "cloudMultipleContributorsEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)canContributeToCloudSharedAlbum
{
  void *v3;
  char v4;
  void *v5;

  -[PLCloudSharedAlbum isOwned](self, "isOwned");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PLCloudSharedAlbum cloudMultipleContributorsEnabled](self, "cloudMultipleContributorsEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLValue");

  }
  return v4;
}

- (NSDate)cloudFirstRecentBatchDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  -[PLCloudSharedAlbum getUnseenStartMarkerIndex:count:showsProgress:](self, "getUnseenStartMarkerIndex:count:showsProgress:", &v8, 0, 0);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || (-[PLCloudSharedAlbum assets](self, "assets"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectAtIndex:", v8),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    -[PLCloudSharedAlbum assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "cloudBatchPublishDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDate *)v6;
}

- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  -[PLCloudSharedAlbum cloudOwnerFirstName](self, "cloudOwnerFirstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudOwnerLastName](self, "cloudOwnerLastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudOwnerFullName](self, "cloudOwnerFullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudOwnerEmailKey](self, "cloudOwnerEmailKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum emailAddressManager](self, "emailAddressManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum cloudOwnerDisplayNameWithFirstName:lastName:fullName:emailKey:includingEmail:allowsEmail:emailAddressManager:](PLCloudSharedAlbum, "cloudOwnerDisplayNameWithFirstName:lastName:fullName:emailKey:includingEmail:allowsEmail:emailAddressManager:", v7, v8, v9, v10, v5, v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)updateCloudLastInterestingChangeDateWithDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudSharedAlbum cloudLastInterestingChangeDate](self, "cloudLastInterestingChangeDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && (!v5 || objc_msgSend(v4, "compare:", v5) == 1))
  {
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PLGenericAlbum localizedTitle](self, "localizedTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Updating album updated date: %@ %@", buf, 0x16u);

    }
    -[PLCloudSharedAlbum setCloudLastInterestingChangeDate:](self, "setCloudLastInterestingChangeDate:", v4);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PLCloudSharedAlbum albumLists](self, "albumLists", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setNeedsReordering");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)updateCloudLastContributionDateWithDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudSharedAlbum cloudLastContributionDate](self, "cloudLastContributionDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && (!v5 || objc_msgSend(v4, "compare:", v5) == 1))
  {
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PLGenericAlbum localizedTitle](self, "localizedTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Updating album last contribution date: %@ %@", (uint8_t *)&v9, 0x16u);

    }
    -[PLCloudSharedAlbum setCloudLastContributionDate:](self, "setCloudLastContributionDate:", v4);
  }

}

- (void)publishBatchOfOriginalAssetUUIDs:(id)a3 withBatchCommentText:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 andTrimmedVideoPathInfo:(id)a7 isNewAlbum:(BOOL)a8
{
  +[PLPublishCloudSharedAssetsJob publishBatchOfOriginalAssetUUIDs:toSharedAlbum:withAssetsSharingInfos:customExportsInfo:trimmedVideoPathInfo:isNewAlbum:batchCommentText:](PLPublishCloudSharedAssetsJob, "publishBatchOfOriginalAssetUUIDs:toSharedAlbum:withAssetsSharingInfos:customExportsInfo:trimmedVideoPathInfo:isNewAlbum:batchCommentText:", a3, self, a5, a6, a7, a8, a4);
}

- (NSString)cloudOwnerEmail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLCloudSharedAlbum emailAddressManager](self, "emailAddressManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudOwnerEmailKey](self, "cloudOwnerEmailKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddressForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PLGenericAlbum photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "personInfoManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAlbum cloudOwnerHashedPersonID](self, "cloudOwnerHashedPersonID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailForPersonID:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if ((PLIsAssetsd() & 1) == 0)
        +[PLUserActivityDaemonJob checkedSharedAlbumServerModelRelationships](PLUserActivityDaemonJob, "checkedSharedAlbumServerModelRelationships");
      v5 = 0;
    }
  }
  return (NSString *)v5;
}

- (void)setCloudOwnerEmail:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLCloudSharedAlbum emailAddressManager](self, "emailAddressManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyForEmailAddress:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PLCloudSharedAlbum setCloudOwnerEmailKey:](self, "setCloudOwnerEmailKey:", v6);
}

- (void)userDeleteSubscriberRecord:(id)a3
{
  PLCloudSharedAlbum *v4;
  void *v5;
  int v6;
  void *v7;
  PLCloudSharedAlbum *v8;
  PLCloudSharedAlbum *v9;

  v4 = (PLCloudSharedAlbum *)a3;
  if (v4)
  {
    v9 = v4;
    -[PLCloudSharedAlbum isOwned](self, "isOwned");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPhotoSharingHelper removeSubscribers:fromOwnedAlbum:](PLPhotoSharingHelper, "removeSubscribers:fromOwnedAlbum:", v7, self);

      v8 = v9;
    }
    else
    {
      +[PLPhotoSharingHelper unsubscribeFromAlbum:](PLPhotoSharingHelper, "unsubscribeFromAlbum:", self);
      v8 = self;
    }
    -[PLCloudSharedAlbum delete](v8, "delete");
    v4 = v9;
  }

}

- (void)persistRecoveryMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAlbum cloudRelationshipState](self, "cloudRelationshipState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLCloudSharedAlbum cloudRelationshipState](self, "cloudRelationshipState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cloudRelationshipState"));

  }
  -[PLCloudSharedAlbum cloudOwnerFirstName](self, "cloudOwnerFirstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLCloudSharedAlbum cloudOwnerFirstName](self, "cloudOwnerFirstName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cloudOwnerFirstName"));

  }
  -[PLCloudSharedAlbum cloudOwnerLastName](self, "cloudOwnerLastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PLCloudSharedAlbum cloudOwnerLastName](self, "cloudOwnerLastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cloudOwnerLastName"));

  }
  -[PLCloudSharedAlbum cloudOwnerEmail](self, "cloudOwnerEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PLCloudSharedAlbum cloudOwnerEmail](self, "cloudOwnerEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cloudOwnerEmail"));

  }
  -[PLCloudSharedAlbum cloudOwnerHashedPersonID](self, "cloudOwnerHashedPersonID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PLCloudSharedAlbum cloudOwnerHashedPersonID](self, "cloudOwnerHashedPersonID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("cloudOwnerHashedPersonID"));

  }
  -[PLCloudSharedAlbum cloudSubscriptionDate](self, "cloudSubscriptionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PLCloudSharedAlbum cloudSubscriptionDate](self, "cloudSubscriptionDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cloudSubscriptionDate"));

  }
  -[PLCloudSharedAlbum title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLCloudSharedAlbum title](self, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("title"));

  }
  -[PLCloudSharedAlbum cloudPublicURLEnabled](self, "cloudPublicURLEnabled");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PLCloudSharedAlbum cloudPublicURLEnabled](self, "cloudPublicURLEnabled");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("cloudPublicURLEnabled"));

  }
  -[PLCloudSharedAlbum publicURL](self, "publicURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PLCloudSharedAlbum publicURL](self, "publicURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("publicURL"));

  }
  if (objc_msgSend(v3, "count"))
  {
    -[PLCloudSharedAlbum albumDirectoryPath](self, "albumDirectoryPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 100, 0, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject writeToFile:options:error:](v24, "writeToFile:options:error:", v23, 1073741825, 0) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = objc_claimAutoreleasedReturnValue();
        -[PLCloudSharedAlbum albumDirectoryPath](self, "albumDirectoryPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, 0);

        v29 = 0;
        LOBYTE(v25) = -[NSObject writeToFile:options:error:](v24, "writeToFile:options:error:", v23, 1073741825, &v29);
        v27 = v29;
        if ((v25 & 1) == 0)
        {
          PLPhotoSharingGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v31 = v3;
            v32 = 2112;
            v33 = v23;
            v34 = 2112;
            v35 = v27;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to write recovery metadata %@ to %@: %@", buf, 0x20u);
          }

        }
      }
    }
    else
    {
      PLPhotoSharingGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v3;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Missing path to persist recovery metadata %@ for cloud shared album", buf, 0xCu);
      }
    }

  }
}

uint64_t __39__PLCloudSharedAlbum_sortingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "cloudBatchPublishDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudBatchPublishDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    objc_msgSend(v4, "cloudBatchPublishDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudBatchPublishDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

  }
  else
  {
    v11 = v7 != 0;
    if (v6)
    {
      v11 = -1;
      goto LABEL_9;
    }
  }
  if (!v11)
  {
    objc_msgSend(v4, "dateCreated");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateCreated");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "compare:", v13);

    if (!v11)
    {
      objc_msgSend(v4, "cloudAssetGUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cloudAssetGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "compare:", v15);

    }
  }
LABEL_9:

  return v11;
}

void __28__PLCloudSharedAlbum_delete__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isCloudSharedAsset"))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 109))
    {
      objc_msgSend(v3, "deleteFromDatabaseOnly");
    }
    else
    {
      PLPhotoSharingGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "pathForOriginalFile");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "deleting asset at path %@", (uint8_t *)&v6, 0xCu);

      }
      objc_msgSend(v3, "deleteWithReason:", *(_QWORD *)(a1 + 40));
    }
  }

}

+ (id)entityName
{
  return CFSTR("CloudSharedAlbum");
}

+ (id)cloudSharedAlbumWithGUID:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d AND (uuid = %@ OR cloudGUID == %@)"), 1505, v6, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityInManagedObjectContext:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEntity:", v12);

  objc_msgSend(v11, "setPredicate:", v10);
  v18 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v11, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    PLPhotoSharingGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one album with cloudGUID %@, returning last one in array %@", buf, 0x16u);
    }

  }
  objc_msgSend(v13, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v16;
}

+ (id)cloudSharedAlbumWithObjectID:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  v9 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityInManagedObjectContext:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntity:", v10);

  v17[0] = CFSTR("invitationRecords");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self == %@"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v12);

  v16 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v14;
}

+ (id)allCloudSharedAlbumsInLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumsWithKind:inManagedObjectContext:](PLGenericAlbum, "albumsWithKind:inManagedObjectContext:", 1505, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localizedSharedByLabelWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emailKey:(id)a6 isOwned:(BOOL)a7 allowsEmail:(BOOL)a8 emailAddressManager:(id)a9
{
  void *v9;
  void *v10;
  void *v11;

  if (a7)
  {
    PLServicesLocalizedFrameworkString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PLCloudSharedAlbum cloudOwnerDisplayNameWithFirstName:lastName:fullName:emailKey:includingEmail:allowsEmail:emailAddressManager:](PLCloudSharedAlbum, "cloudOwnerDisplayNameWithFirstName:lastName:fullName:emailKey:includingEmail:allowsEmail:emailAddressManager:", a3, a4, a5, a6, a7, a8, a9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      PLServicesLocalizedFrameworkString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PFStringWithValidatedFormat();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PLServicesLocalizedFrameworkString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

+ (id)cloudOwnerDisplayNameWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emailKey:(id)a6 includingEmail:(BOOL)a7 allowsEmail:(BOOL)a8 emailAddressManager:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;

  v9 = a8;
  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = v18;
  v20 = &stru_1E36789C0;
  if (v9)
  {
    objc_msgSend(v18, "emailAddressForKey:", v17);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v16, "length") && !objc_msgSend(v16, "isEqualToString:", CFSTR("(null) (null)")))
  {
    v21 = (__CFString *)v16;
    if (!v10)
      goto LABEL_13;
LABEL_10:
    if (-[__CFString length](v20, "length"))
    {
      PLServicesLocalizedFrameworkString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PFStringWithValidatedFormat();
      v23 = objc_claimAutoreleasedReturnValue();

      v21 = (__CFString *)v23;
    }
    goto LABEL_13;
  }
  if (!objc_msgSend(v14, "length") && !objc_msgSend(v15, "length"))
  {
    v21 = v20;
    goto LABEL_13;
  }
  PLLocalizedNameWithFirstAndLastName();
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_10;
LABEL_13:
  if (v21)
    v24 = v21;
  else
    v24 = &stru_1E36789C0;

  return v24;
}

+ (id)lightweightReimportDirectoryNameWithGUID:(id)a3 cloudPersonID:(id)a4
{
  void *v4;
  id v6;
  void *v7;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = a3;
    objc_msgSend(a4, "stringByAppendingString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
