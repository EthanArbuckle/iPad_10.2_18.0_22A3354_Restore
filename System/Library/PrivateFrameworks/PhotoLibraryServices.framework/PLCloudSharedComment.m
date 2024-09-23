@implementation PLCloudSharedComment

- (PLCloudSharedComment)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCloudSharedComment;
  return -[PLCloudSharedComment init](&v3, sel_init);
}

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedComment;
  -[PLCloudSharedComment awakeFromInsert](&v4, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedComment setCloudGUID:](self, "setCloudGUID:", v3);

}

- (void)willSave
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedComment;
  -[PLManagedObject willSave](&v5, sel_willSave);
  -[PLCloudSharedComment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "delayedSaveActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordCommentForCloudFeedUpdate:", self);

  }
}

- (id)asset
{
  void *v3;
  int v4;

  -[PLCloudSharedComment isLike](self, "isLike");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    -[PLCloudSharedComment likedAsset](self, "likedAsset");
  else
    -[PLCloudSharedComment commentedAsset](self, "commentedAsset");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PLCloudFeedCommentsEntry)cloudFeedEntry
{
  if (-[PLCloudSharedComment isLikeBoolValue](self, "isLikeBoolValue"))
    -[PLCloudSharedComment cloudFeedLikeCommentEntry](self, "cloudFeedLikeCommentEntry");
  else
    -[PLCloudSharedComment cloudFeedCommentEntry](self, "cloudFeedCommentEntry");
  return (PLCloudFeedCommentsEntry *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isLikeBoolValue
{
  void *v2;
  char v3;

  -[PLCloudSharedComment isLike](self, "isLike");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_isInterestingToUser
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint32_t v11;
  _BOOL4 v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PLCloudSharedComment asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isCloudSharedAsset"))
  {
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v3;
      v8 = "Comment marked as not interesting because it's not for a cloudSharedAsset: %@.";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v4 = objc_msgSend(v3, "cloudIsMyAsset");
  -[PLCloudSharedComment isMyComment](self, "isMyComment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v8 = "Ignoring comment notification because it's my comment";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEFAULT;
      v11 = 2;
LABEL_7:
      _os_log_impl(&dword_199541000, v9, v10, v8, (uint8_t *)&v14, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((v4 & 1) != 0)
  {
    LOBYTE(v12) = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "cloudHasCommentsByMe"))
  {
    v12 = !-[PLCloudSharedComment isLikeBoolValue](self, "isLikeBoolValue");
    goto LABEL_10;
  }
LABEL_9:
  LOBYTE(v12) = 0;
LABEL_10:

  return v12;
}

- (BOOL)shouldNotifyAsNotificationWithMediaStreamInfo:(id)a3 asCaptionOnly:(BOOL *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint8_t *v13;
  BOOL result;
  __int16 v15;
  __int16 v16;

  v6 = a3;
  -[PLCloudSharedComment isCaption](self, "isCaption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "valueForKey:", *MEMORY[0x1E0D16D88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v9, "BOOLValue");
  if (!(_DWORD)v6)
  {
    result = -[PLCloudSharedComment _isInterestingToUser](self, "_isInterestingToUser");
    if (!a4)
      return result;
    goto LABEL_11;
  }
  PLPhotoSharingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v11)
      goto LABEL_10;
    v16 = 0;
    v12 = "Notifications: mstreamd says comment is not interesting, but allowing as caption";
    v13 = (uint8_t *)&v16;
  }
  else
  {
    if (!v11)
      goto LABEL_10;
    v15 = 0;
    v12 = "Notifications: Ignoring comment notification because mstreamd says it's not interesting and is not a caption";
    v13 = (uint8_t *)&v15;
  }
  _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
LABEL_10:

  result = 0;
  if (!a4)
    return result;
LABEL_11:
  if (!result)
    *a4 = v8;
  return result;
}

- (BOOL)isInterestingForAlbumsSorting
{
  void *v3;
  char v4;

  -[PLCloudSharedComment isMyComment](self, "isMyComment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return (v4 & 1) != 0 || -[PLCloudSharedComment _isInterestingToUser](self, "_isInterestingToUser");
}

- (id)commenterDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  -[PLCloudSharedComment commenterFirstName](self, "commenterFirstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedComment commenterLastName](self, "commenterLastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedComment commenterFullName](self, "commenterFullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else if (objc_msgSend(v3, "length") || objc_msgSend(v4, "length"))
  {
    PLLocalizedNameWithFirstAndLastName();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLCloudSharedComment commenterEmail](self, "commenterEmail");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E36789C0;

  return v7;
}

- (BOOL)canBeDeletedByUser
{
  void *v3;
  char v4;
  void *v5;

  -[PLCloudSharedComment isDeletable](self, "isDeletable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PLCloudSharedComment asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "cloudIsMyAsset");

  }
  return v4;
}

- (void)performDelete
{
  void *v3;
  _QWORD v4[5];

  if (-[PLCloudSharedComment canBeDeletedByUser](self, "canBeDeletedByUser"))
  {
    -[PLManagedObject photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__PLCloudSharedComment_performDelete__block_invoke;
    v4[3] = &unk_1E3677AA0;
    v4[4] = self;
    objc_msgSend(v3, "performTransaction:", v4);

  }
}

- (NSString)commenterEmail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailForPersonID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)commenterFirstName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstNameForPersonID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)commenterLastName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastNameForPersonID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)commenterFullName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personInfoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedComment commenterHashedPersonID](self, "commenterHashedPersonID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullNameForPersonID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)matchesCommentText:(id)a3 isLike:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;

  v4 = a4;
  v6 = (unint64_t)a3;
  if (v4 && -[PLCloudSharedComment isLikeBoolValue](self, "isLikeBoolValue"))
    goto LABEL_6;
  -[PLCloudSharedComment commentText](self, "commentText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  -[PLCloudSharedComment commentText](self, "commentText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if ((v10 & 1) == 0)
  {
LABEL_8:
    -[PLCloudSharedComment commentText](self, "commentText");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v6 | v12;

    v11 = v13 == 0;
    goto LABEL_9;
  }
LABEL_6:
  v11 = 1;
LABEL_9:

  return v11;
}

void __37__PLCloudSharedComment_performDelete__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDeleteCloudSharedComment:", *(_QWORD *)(a1 + 32));

}

+ (id)entityName
{
  return CFSTR("CloudSharedComment");
}

+ (id)insertNewCommentIntoAsset:(id)a3 commentDate:(id)a4 withText:(id)a5 isLike:(BOOL)a6 isMyComment:(BOOL)a7 inLibrary:(id)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v14 && (objc_msgSend(v14, "isCloudSharedAsset") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot insert a comment in an asset that is not a CloudSharedAsset"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  objc_msgSend(a1, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v18, (uint64_t)v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v20, "setCommentDate:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCommentDate:", v21);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIsMyComment:", v22);

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsLike:", v23);

    if (!v14)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(v20, "setCommentText:", v16);
    if (!v14)
      goto LABEL_12;
  }
  if (v20)
    objc_msgSend(v14, "addComment:", v20);
LABEL_12:

  return v20;
}

+ (id)insertNewCommentWithCommentText:(id)a3 commentDate:(id)a4 isLike:(BOOL)a5 isMyComment:(BOOL)a6 inLibrary:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(a1, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v15, (uint64_t)v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v17, "setCommentDate:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCommentDate:", v18);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIsMyComment:", v19);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsLike:", v20);

  }
  else
  {
    objc_msgSend(v17, "setCommentText:", v12);
  }

  return v17;
}

+ (id)_cloudSharedCommentsWithPredicate:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  v9 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityInManagedObjectContext:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntity:", v10);

  objc_msgSend(v9, "setPredicate:", v6);
  v15 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (!v11)
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch cloud shared comments with request %@: %@", buf, 0x16u);
    }

  }
  objc_autoreleasePoolPop(v8);

  return v11;
}

+ (id)cloudSharedCommentsWithGUIDs:(id)a3 inLibrary:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("cloudGUID IN %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_cloudSharedCommentsWithPredicate:inManagedObjectContext:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)cloudSharedCommentWithGUID:(id)a3 inLibrary:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18[0] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  objc_msgSend(v7, "arrayWithObjects:count:", v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cloudSharedCommentsWithGUIDs:inLibrary:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one comment with cloudGUID %@, returning last one in array %@", (uint8_t *)&v14, 0x16u);
    }

  }
  objc_msgSend(v10, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)cloudSharedCommentsWithCommentDate:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("commentDate"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cloudSharedCommentsWithPredicate:inManagedObjectContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
