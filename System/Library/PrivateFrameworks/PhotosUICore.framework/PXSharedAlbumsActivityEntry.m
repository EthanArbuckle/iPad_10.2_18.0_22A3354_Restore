@implementation PXSharedAlbumsActivityEntry

- (PXSharedAlbumsActivityEntry)initWithPhotoLibrary:(id)a3 uuid:(id)a4 date:(id)a5 type:(int64_t)a6 isFromMe:(BOOL)a7 contributors:(id)a8 avatarConfigurations:(id)a9 albumGUID:(id)a10 albumName:(id)a11 message:(id)a12 keyAssetUUIDs:(id)a13 keyAssets:(id)a14 relatedCommentUUID:(id)a15 relatedUUIDs:(id)a16 underlyingObject:(id)a17
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  PXSharedAlbumsActivityEntry *v35;
  PXSharedAlbumsActivityEntry *v36;
  void *v37;
  uint64_t v38;
  NSArray *contributors;
  uint64_t v40;
  NSArray *contributorDisplayNames;
  uint64_t v42;
  NSArray *avatarConfigurations;
  NSArray *v44;
  NSArray *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSArray *keyAssetUUIDs;
  NSArray *v53;
  uint64_t v54;
  NSManagedObjectID *objectID;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v72;
  id v73;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v80;
  id v82;
  id v83;
  id v84;
  objc_super v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v72 = a4;
  v21 = a4;
  v73 = a5;
  v84 = a5;
  v22 = a8;
  v82 = a9;
  v83 = a10;
  v23 = a11;
  v77 = a12;
  v24 = a13;
  v76 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v78 = v20;
  v80 = v21;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    v21 = v80;
  }
  if (!objc_msgSend(v21, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid.length"));

  }
  v28 = v24;
  v29 = v82;
  if (v84)
  {
    if (v22)
      goto LABEL_7;
LABEL_38:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contributors"));

    if (v82)
      goto LABEL_8;
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  if (!v22)
    goto LABEL_38;
LABEL_7:
  if (v82)
    goto LABEL_8;
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("avatarConfigurations"));

LABEL_8:
  if (v83)
  {
    if (v23)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumGUID"));

    if (v23)
    {
LABEL_10:
      if (v24)
        goto LABEL_11;
LABEL_42:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyAssetUUIDs"));

      if (v26)
        goto LABEL_12;
      goto LABEL_43;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("albumName"));

  if (!v24)
    goto LABEL_42;
LABEL_11:
  if (v26)
    goto LABEL_12;
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relatedUUIDs"));

LABEL_12:
  if (!objc_msgSend(v22, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 105, CFSTR("Must have a contributor."));

  }
  if (!objc_msgSend(v82, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 106, CFSTR("Must have an avatar configuration."));

  }
  if (a6 != 1)
  {
    if (objc_msgSend(v22, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 108, CFSTR("Found multiple contributors for a non-reaction type activity entry. Only reactions can have multiple contributors."));

    }
    if (objc_msgSend(v82, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedAlbumsActivityEntry.m"), 109, CFSTR("Found multiple avatar configurations for a non-reaction type activity entry. Only reactions can have multiple contributors."));

    }
  }
  objc_msgSend(v22, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "displayName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length");

  if (!v32)
  {
    PLSharingGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v87 = (uint64_t)v80;
      v88 = 2114;
      v89 = (uint64_t)v83;
      v90 = 2112;
      v91 = v23;
      v92 = 2112;
      v93 = v84;
      _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_ERROR, "Contributor display name is empty/blank for activity UUID: %{public}@, in albumGUID/name %{public}@/%@, date: %@", buf, 0x2Au);
    }

  }
  if (!objc_msgSend(v23, "length"))
  {
    PLSharingGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v87 = (uint64_t)v80;
      v88 = 2114;
      v89 = (uint64_t)v83;
      v90 = 2112;
      v91 = v84;
      _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "Album name is empty/blank for activity UUID: %{public}@, for albumGUID %{public}@, date: %@", buf, 0x20u);
    }

  }
  v85.receiver = self;
  v85.super_class = (Class)PXSharedAlbumsActivityEntry;
  v35 = -[PXSharedAlbumsActivityEntry init](&v85, sel_init);
  v36 = v35;
  if (v35)
  {
    v37 = v27;
    objc_storeStrong((id *)&v35->_photoLibrary, a3);
    objc_storeStrong((id *)&v36->_uuid, v72);
    objc_storeStrong((id *)&v36->_date, v73);
    v36->_type = a6;
    v36->_isFromMe = a7;
    v38 = objc_msgSend(v22, "copy");
    contributors = v36->_contributors;
    v36->_contributors = (NSArray *)v38;

    PXMap();
    v40 = objc_claimAutoreleasedReturnValue();
    contributorDisplayNames = v36->_contributorDisplayNames;
    v36->_contributorDisplayNames = (NSArray *)v40;

    v42 = objc_msgSend(v82, "copy");
    avatarConfigurations = v36->_avatarConfigurations;
    v36->_avatarConfigurations = (NSArray *)v42;

    objc_storeStrong((id *)&v36->_albumGUID, a10);
    objc_storeStrong((id *)&v36->_albumName, a11);
    objc_storeStrong((id *)&v36->_message, a12);
    v44 = v28;
    v45 = v44;
    if (v76)
    {
      v46 = -[NSArray count](v44, "count");
      if (v46 != objc_msgSend(v76, "count"))
      {
        v75 = v26;
        PLSharingGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = objc_msgSend(v76, "count");
          v49 = -[NSArray count](v45, "count");
          *(_DWORD *)buf = 134218240;
          v87 = v48;
          v88 = 2048;
          v89 = v49;
          _os_log_impl(&dword_1A6789000, v47, OS_LOG_TYPE_ERROR, "Supplied key assets (%lu) don't match the count of keyAssetUUIDs (%lu), preferring UUIDs from supplied key assets", buf, 0x16u);
        }

        objc_msgSend(v76, "fetchedObjects");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        PXMap();
        v51 = objc_claimAutoreleasedReturnValue();

        v45 = (NSArray *)v51;
        v26 = v75;
      }
    }
    keyAssetUUIDs = v36->_keyAssetUUIDs;
    v36->_keyAssetUUIDs = v45;
    v53 = v45;

    objc_storeStrong((id *)&v36->_keyAssets, a14);
    objc_storeStrong((id *)&v36->_relatedCommentUUID, a15);
    objc_storeStrong((id *)&v36->_relatedUUIDs, a16);
    objc_storeStrong(&v36->_underlyingObject, a17);
    v27 = v37;
    objc_msgSend(v37, "objectID");
    v54 = objc_claimAutoreleasedReturnValue();
    objectID = v36->_objectID;
    v36->_objectID = (NSManagedObjectID *)v54;

    v29 = v82;
  }

  return v36;
}

- (PXSharedAlbumsActivityEntryContributor)contributor
{
  return (PXSharedAlbumsActivityEntryContributor *)-[NSArray firstObject](self->_contributors, "firstObject");
}

- (NSString)contributorDisplayName
{
  return (NSString *)-[NSArray firstObject](self->_contributorDisplayNames, "firstObject");
}

- (PXSharedAlbumsActivityEntryAvatarConfiguration)avatarConfiguration
{
  return (PXSharedAlbumsActivityEntryAvatarConfiguration *)-[NSArray firstObject](self->_avatarConfigurations, "firstObject");
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  NSDate *date;
  uint64_t v9;
  void *v10;
  NSString *albumName;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_type - 1;
  if (v6 > 6)
    v7 = CFSTR("Assets");
  else
    v7 = *(&off_1E5129E38 + v6);
  date = self->_date;
  -[NSArray componentsJoinedByString:](self->_contributorDisplayNames, "componentsJoinedByString:", CFSTR(","));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  albumName = self->_albumName;
  if (self->_message)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" \"%@\"), self->_message);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [(%@) %@ from %@ in %@%@]>"), v5, self, date, v7, v10, albumName, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [(%@) %@ from %@ in %@%@]>"), v5, self, date, v7, v9, self->_albumName, &stru_1E5149688);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (NSArray)contributors
{
  return self->_contributors;
}

- (NSArray)contributorDisplayNames
{
  return self->_contributorDisplayNames;
}

- (NSArray)avatarConfigurations
{
  return self->_avatarConfigurations;
}

- (NSString)albumName
{
  return self->_albumName;
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)keyAssetUUIDs
{
  return self->_keyAssetUUIDs;
}

- (NSString)relatedCommentUUID
{
  return self->_relatedCommentUUID;
}

- (NSArray)relatedUUIDs
{
  return self->_relatedUUIDs;
}

- (id)underlyingObject
{
  return self->_underlyingObject;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (PHFetchResult)keyAssets
{
  return self->_keyAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssets, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong(&self->_underlyingObject, 0);
  objc_storeStrong((id *)&self->_relatedUUIDs, 0);
  objc_storeStrong((id *)&self->_relatedCommentUUID, 0);
  objc_storeStrong((id *)&self->_keyAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_avatarConfigurations, 0);
  objc_storeStrong((id *)&self->_contributorDisplayNames, 0);
  objc_storeStrong((id *)&self->_contributors, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __211__PXSharedAlbumsActivityEntry_initWithPhotoLibrary_uuid_date_type_isFromMe_contributors_avatarConfigurations_albumGUID_albumName_message_keyAssetUUIDs_keyAssets_relatedCommentUUID_relatedUUIDs_underlyingObject___block_invoke_174(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __211__PXSharedAlbumsActivityEntry_initWithPhotoLibrary_uuid_date_type_isFromMe_contributors_avatarConfigurations_albumGUID_albumName_message_keyAssetUUIDs_keyAssets_relatedCommentUUID_relatedUUIDs_underlyingObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayName");
}

+ (id)fetchAssetsMockActivitiesWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PXSharedAlbumsActivityEntry *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PXSharedAlbumsActivityEntry *v21;
  PXSharedAlbumsActivityEntry *v22;
  void *v23;
  void *v24;
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
  void *v35;
  PXSharedAlbumsActivityEntry *v36;
  void *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PXSharedAlbumsActivityEntry *v56;
  PXSharedAlbumsActivityEntryContributor *v57;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v58;
  void *v59;
  PXSharedAlbumsActivityEntryContributor *v60;
  PXSharedAlbumsActivityEntryContributor *v61;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v62;
  void *v63;
  void *v64;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v65;
  PXSharedAlbumsActivityEntry *v66;
  uint64_t v67;
  PXSharedAlbumsActivityEntry *v68;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  uint64_t v76;
  void *v77;
  void *v78;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v79;
  PXSharedAlbumsActivityEntryContributor *v80;
  void *v81;
  void *v82;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v83;
  PXSharedAlbumsActivityEntryContributor *v84;
  void *v85;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v86;
  PXSharedAlbumsActivityEntryContributor *v87;
  _BYTE v88[128];
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeAllPhotosSmartAlbum:", 1);
  v45 = v4;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000205, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();

  v69 = v3;
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchLimit:", 10);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v9);

  v43 = v7;
  v44 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v10;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v72;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v72 != v47)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v11);
        v67 = v11;
        v61 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:]([PXSharedAlbumsActivityEntryContributor alloc], "initWithDisplayName:email:", CFSTR("Jane"), 0);
        v65 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:]([PXSharedAlbumsActivityEntryAvatarConfiguration alloc], "initWithEmail:phone:firstName:lastName:", 0, 0, CFSTR("Jane"), 0);
        v13 = [PXSharedAlbumsActivityEntry alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "creationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v61;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v65;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v13, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v69, v15, v16, 0, 0, v17, v18, &stru_1E5149688, CFSTR("Faves"), CFSTR("Look what we did!"), v20, 0, 0, MEMORY[0x1E0C9AA60], 0);

        v68 = v21;
        objc_msgSend(v70, "addObject:", v21);
        v57 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:]([PXSharedAlbumsActivityEntryContributor alloc], "initWithDisplayName:email:", CFSTR("Mel"), 0);

        v62 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:]([PXSharedAlbumsActivityEntryAvatarConfiguration alloc], "initWithEmail:phone:firstName:lastName:", 0, 0, CFSTR("Mel"), 0);
        v22 = [PXSharedAlbumsActivityEntry alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "UUIDString");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v12;
        objc_msgSend(v12, "creationDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v62;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSharedAlbumsActivityEntry uuid](v21, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v22, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v69, v53, v51, 1, 0, v49, v23, &stru_1E5149688, CFSTR("Faves"), CFSTR("❤️"), v24, 0, v26, v28, 0);

        objc_msgSend(v70, "addObject:", v66);
        v60 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:]([PXSharedAlbumsActivityEntryContributor alloc], "initWithDisplayName:email:", CFSTR("Chris"), 0);

        v58 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:]([PXSharedAlbumsActivityEntryAvatarConfiguration alloc], "initWithEmail:phone:firstName:lastName:", 0, 0, CFSTR("Chris"), 0);
        v56 = [PXSharedAlbumsActivityEntry alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "UUIDString");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "creationDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v58;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSharedAlbumsActivityEntry uuid](v68, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v56, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v69, v50, v54, 2, 0, v52, v29, &stru_1E5149688, CFSTR("Faves"), CFSTR("Neat!"), v31, 0, v33, v35, 0);

        objc_msgSend(v70, "addObject:", v36);
        v11 = v67 + 1;
      }
      while (v48 != v67 + 1);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    }
    while (v48);
  }

  +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "simulateEmptyActivityEntries");

  if (v38)
  {
    PLSharingGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(v70, "count");
      *(_DWORD *)buf = 134217984;
      v76 = v40;
      _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_DEFAULT, "Received %lu activities, but simulating empty activities, so setting to 0 activities", buf, 0xCu);
    }

    objc_msgSend(v70, "removeAllObjects");
  }
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1620]), "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v70, v69, 0, 0, 0, 0);

  return v41;
}

+ (id)fetchActivitiesWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__123708;
  v28 = __Block_byref_object_dispose__123709;
  v29 = 0;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibraryForCurrentQueueQoS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__PXSharedAlbumsActivityEntry_fetchActivitiesWithOptions___block_invoke;
  v18[3] = &unk_1E5138630;
  v8 = v4;
  v19 = v8;
  v9 = v7;
  v20 = v9;
  v22 = &v24;
  v23 = a1;
  v10 = v5;
  v21 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v18);
  +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v11, "simulateEmptyActivityEntries");

  if ((_DWORD)v6)
  {
    PLSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend((id)v25[5], "count");
      *(_DWORD *)buf = 134217984;
      v31 = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "Received %lu activities, but simulating empty activities, so setting to 0 activities", buf, 0xCu);
    }

    v14 = (void *)v25[5];
    v25[5] = MEMORY[0x1E0C9AA60];

  }
  v15 = objc_alloc(MEMORY[0x1E0CD1620]);
  v16 = (void *)objc_msgSend(v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v25[5], v10, 0, 0, 0, 0);

  _Block_object_dispose(&v24, 8);
  return v16;
}

+ (id)fetchRecentActivitiesWithOptions:(id)a3 olderThanDate:(id)a4 filter:(int64_t)a5
{
  uint64_t v5;

  if (a5 == 2)
    v5 = 5;
  else
    v5 = a5 == 1;
  return (id)objc_msgSend(a1, "_fetchRecentActivitiesWithOptions:olderThanDate:filter:", a3, a4, v5);
}

+ (unint64_t)fetchCountOfRecentFeedActivitiesWithOptions:(id)a3 newerThanDate:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  PLSharedAlbumsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v11 = objc_msgSend(v5, "fetchLimit");
    *(_DWORD *)buf = 134218242;
    v32 = v11;
    v33 = 2112;
    v34 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SharedAlbumsCountOfRecentFeedActivitiesDuration", "FetchLimit=%lu,earliestDate=%@", buf, 0x16u);
  }

  objc_msgSend(v5, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibraryForCurrentQueueQoS");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "fetchLimit");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__PXSharedAlbumsActivityEntry_fetchCountOfRecentFeedActivitiesWithOptions_newerThanDate___block_invoke;
  v21[3] = &unk_1E513FD70;
  v15 = v13;
  v22 = v15;
  v16 = v6;
  v25 = v14;
  v26 = 2;
  v23 = v16;
  v24 = &v27;
  objc_msgSend(v15, "performBlockAndWait:", v21);
  v17 = v10;
  v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_END, v8, "SharedAlbumsCountOfRecentFeedActivitiesDuration", ", buf, 2u);
  }

  v19 = v28[3];
  _Block_object_dispose(&v27, 8);

  return v19;
}

+ (id)_fetchRecentActivitiesWithOptions:(id)a3 olderThanDate:(id)a4 filter:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _BYTE *v35;
  uint64_t v36;
  int64_t v37;
  id v38;
  uint8_t v39[4];
  uint64_t v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLSharedAlbumsGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = objc_msgSend(v8, "fetchLimit");
    NSStringFromPLCloudFeedEntryFilter();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v42) = v9 != 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SharedAlbumsRecentActivityFetchDuration", "FetchLimit=%lu,Filter=%@,FetchingMore=%d", buf, 0x1Cu);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__123708;
  v43 = __Block_byref_object_dispose__123709;
  v44 = 0;
  objc_msgSend(v8, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoLibraryForCurrentQueueQoS");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v8, "fetchLimit");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __86__PXSharedAlbumsActivityEntry__fetchRecentActivitiesWithOptions_olderThanDate_filter___block_invoke;
  v31[3] = &unk_1E5129D10;
  v19 = v17;
  v32 = v19;
  v20 = v9;
  v36 = v18;
  v37 = a5;
  v33 = v20;
  v35 = buf;
  v38 = a1;
  v21 = v16;
  v34 = v21;
  objc_msgSend(v19, "performBlockAndWait:", v31);
  +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v22, "simulateEmptyActivityEntries");

  if ((_DWORD)v16)
  {
    PLSharingGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
      *(_DWORD *)v39 = 134217984;
      v40 = v24;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "Received %lu activities, but simulating empty activities, so setting to 0 activities", v39, 0xCu);
    }

    v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = MEMORY[0x1E0C9AA60];

  }
  v26 = objc_alloc(MEMORY[0x1E0CD1620]);
  v27 = (void *)objc_msgSend(v26, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v21, 0, 0, 0, 0);
  v28 = v13;
  v29 = v28;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)v39 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, v11, "SharedAlbumsRecentActivityFetchDuration", ", v39, 2u);
  }

  _Block_object_dispose(buf, 8);
  return v27;
}

+ (id)activitiesFromCloudFeedEntries:(id)a3 inMostRecentOrder:(BOOL)a4 photoLibrary:(id)a5 plPhotoLibrary:(id)a6
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  NSObject *v54;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  __CFString *v61;
  __CFString *v62;
  PXSharedAlbumsActivityEntryContributor *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  PXSharedAlbumsActivityEntry *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  PXSharedAlbumsActivityEntry *v74;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  PXSharedAlbumsActivityEntryContributor *v82;
  uint64_t v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  PXSharedAlbumsActivityEntry *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  PXSharedAlbumsActivityEntry *v101;
  NSObject *v102;
  PXSharedAlbumsActivityEntry *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  PXSharedAlbumsActivityEntry *v109;
  void *v110;
  void *v111;
  objc_class *v112;
  void *v113;
  void *v114;
  void *v115;
  objc_class *v116;
  void *v117;
  objc_class *v118;
  void *v119;
  objc_class *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  _BOOL4 v129;
  id v130;
  uint64_t v131;
  void *v132;
  id obj;
  PXSharedAlbumsActivityEntryContributor *v135;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v136;
  __CFString *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  __CFString *v150;
  __CFString *v151;
  _QWORD v152[4];
  id v153;
  id v154;
  id v155;
  __CFString *v156;
  __CFString *v157;
  id v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint8_t buf[4];
  uint64_t v165;
  __int16 v166;
  uint64_t v167;
  void *v168;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  PXSharedAlbumsActivityEntryContributor *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  PXSharedAlbumsActivityEntryContributor *v179;
  void *v180;
  _BYTE v181[128];
  uint64_t v182;

  v129 = a4;
  v182 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v143 = a5;
  v130 = a6;
  v138 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  obj = v8;
  v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
  if (v140)
  {
    v139 = *(_QWORD *)v161;
    v9 = 0x1E0C99000uLL;
LABEL_3:
    v10 = 0;
    while (2)
    {
      if (*(_QWORD *)v161 != v139)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v10);
      v12 = (id)objc_msgSend(v11, "entryDate");
      v13 = (void *)MEMORY[0x1E0D71628];
      objc_msgSend(v11, "entryAlbumGUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cloudSharedAlbumWithGUID:inLibrary:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        PLSharingGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "entryAlbumGUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v165 = (uint64_t)v18;
          _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Album not found with guid: %@", buf, 0xCu);

        }
      }
      objc_msgSend(v16, "localizedTitle");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (__CFString *)v19;
      else
        v21 = &stru_1E5149688;
      v22 = v21;

      objc_msgSend(v16, "cloudGUID");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
        v25 = (__CFString *)v23;
      else
        v25 = &stru_1E5149688;
      v26 = v25;

      if (!-[__CFString length](v22, "length"))
      {
        PLSharingGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v16, "cloudGUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v165 = (uint64_t)v28;
          _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Album with cloud GUID: %@ has an empty title", buf, 0xCu);

        }
      }
      objc_msgSend(v11, "URIRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "absoluteString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      switch(objc_msgSend(v11, "entryType"))
      {
        case 1:
          v48 = v11;
          if (v48)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_29;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXSharedAlbumsActivityEntry activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = (objc_class *)objc_opt_class();
            NSStringFromClass(v118);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "px_descriptionForAssertionMessage");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "handleFailureInFunction:file:lineNumber:description:", v111, CFSTR("PXSharedAlbumsActivityEntry.m"), 341, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("entry"), v113, v119);

            v9 = 0x1E0C99000;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXSharedAlbumsActivityEntry activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = (objc_class *)objc_opt_class();
            NSStringFromClass(v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "handleFailureInFunction:file:lineNumber:description:", v111, CFSTR("PXSharedAlbumsActivityEntry.m"), 341, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("entry"), v113);
          }

LABEL_29:
          objc_msgSend(a1, "_assetsAddedActivitiesFromCloudFeedAssetsEntry:inMostRecentOrder:inAlbum:photoLibrary:", v48, v129, v16, v143);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v49, "count"))
          {
            objc_msgSend(v138, "addObjectsFromArray:", v49);
          }
          else
          {
            PLSharingGetLog();
            v102 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v165 = (uint64_t)v48;
              _os_log_impl(&dword_1A6789000, v102, OS_LOG_TYPE_ERROR, "No assets for entry: %@", buf, 0xCu);
            }

          }
          goto LABEL_71;
        case 2:
          v48 = v11;
          if (v48)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_33;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXSharedAlbumsActivityEntry activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = (objc_class *)objc_opt_class();
            NSStringFromClass(v120);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "px_descriptionForAssertionMessage");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, CFSTR("PXSharedAlbumsActivityEntry.m"), 350, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("entry"), v117, v121);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXSharedAlbumsActivityEntry activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:]");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = (objc_class *)objc_opt_class();
            NSStringFromClass(v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, CFSTR("PXSharedAlbumsActivityEntry.m"), 350, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("entry"), v117);
          }

LABEL_33:
          objc_msgSend(v48, "entryComments");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v152[0] = MEMORY[0x1E0C809B0];
          v152[1] = 3221225472;
          v152[2] = __108__PXSharedAlbumsActivityEntry_activitiesFromCloudFeedEntries_inMostRecentOrder_photoLibrary_plPhotoLibrary___block_invoke;
          v152[3] = &unk_1E5129D38;
          v159 = a1;
          v51 = v143;
          v153 = v51;
          v154 = v30;
          v155 = v48;
          v156 = v26;
          v157 = v22;
          v52 = v138;
          v158 = v52;
          objc_msgSend(v50, "enumerateObjectsUsingBlock:", v152);
          v49 = v50;
          v9 = 0x1E0C99000;
          objc_msgSend(a1, "_reactionActivitiesFromCloudFeedLikeEntry:inAlbum:photoLibrary:plPhotoLibrary:", v48, v16, v51, v130);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObjectsFromArray:", v53);
          if (!objc_msgSend(v49, "count") && !objc_msgSend(v53, "count"))
          {
            PLSharingGetLog();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v165 = (uint64_t)v48;
              _os_log_impl(&dword_1A6789000, v54, OS_LOG_TYPE_ERROR, "No comments or likes for entry: %@", buf, 0xCu);
            }

          }
LABEL_71:

LABEL_72:
          if (v140 != ++v10)
            continue;
          v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
          v140 = v122;
          if (!v122)
            goto LABEL_81;
          goto LABEL_3;
        case 3:
          v148 = v30;
          v55 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
          objc_msgSend(v16, "cloudOwnerEmail");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "cloudOwnerFirstName");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "cloudOwnerLastName");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v55, "initWithEmail:phone:firstName:lastName:", v56, 0, v57, v58);

          objc_msgSend(v16, "cloudOwnerFullName");
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = (void *)v59;
          v61 = &stru_1E5149688;
          if (v59)
            v61 = (__CFString *)v59;
          v62 = v61;

          v63 = [PXSharedAlbumsActivityEntryContributor alloc];
          objc_msgSend(v16, "cloudOwnerEmail");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = (uint64_t)v62;
          v135 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:](v63, "initWithDisplayName:email:", v62, v64);

          objc_msgSend(v16, "keyAssets");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "firstObject");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v144 = v16;
          v150 = v26;
          v40 = v22;
          if (v39)
          {
            v176 = v39;
            v9 = 0x1E0C99000uLL;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v176, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_fetchAssetsWithUUIDs:inPhotoLibrary:", v67, v143);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v42 = 0;
            v9 = 0x1E0C99000uLL;
          }
          v103 = [PXSharedAlbumsActivityEntry alloc];
          objc_msgSend(v11, "entryDate");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v175 = v135;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v175, 1);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v174 = v146;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v174, 1);
          v106 = objc_claimAutoreleasedReturnValue();
          v107 = (void *)v106;
          if (v39)
          {
            v173 = v39;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v173, 1);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v103, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v143, v148, v104, 5, 0, v105, v107, v150, v40, 0, v108, v42, 0, MEMORY[0x1E0C9AA60], v11);

            v9 = 0x1E0C99000;
          }
          else
          {
            v109 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v103, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v143, v148, v104, 5, 0, v105, v106, v150, v40, 0, MEMORY[0x1E0C9AA60], v42, 0, MEMORY[0x1E0C9AA60], v11);
          }

          objc_msgSend(v138, "addObject:", v109);
          goto LABEL_70;
        case 4:
        case 7:
          v148 = v30;
          v31 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
          objc_msgSend(MEMORY[0x1E0D719E0], "sharingUsername");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D719E0], "sharingFirstName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D719E0], "sharingLastName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v31, "initWithEmail:phone:firstName:lastName:", v32, 0, v33, v34);

          v35 = objc_msgSend(v11, "entryType");
          v36 = 3;
          if (v35 != 4)
            v36 = 4;
          v131 = v36;
          objc_msgSend(MEMORY[0x1E0D719E0], "sharingDisplayNameIncludingEmail:allowsEmail:", 0, 1);
          v141 = objc_claimAutoreleasedReturnValue();
          v135 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:]([PXSharedAlbumsActivityEntryContributor alloc], "initWithDisplayName:email:", v141, 0);
          objc_msgSend(v16, "keyAssets");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v144 = v16;
          v150 = v26;
          v40 = v22;
          if (v39)
          {
            v180 = v39;
            v9 = 0x1E0C99000uLL;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_fetchAssetsWithUUIDs:inPhotoLibrary:", v41, v143);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v42 = 0;
            v9 = 0x1E0C99000uLL;
          }
          v68 = [PXSharedAlbumsActivityEntry alloc];
          objc_msgSend(v11, "entryDate");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v179 = v135;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v179, 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v178 = v146;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v178, 1);
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = (void *)v71;
          if (v39)
          {
            v177 = v39;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v177, 1);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v68, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v143, v148, v69, v131, 1, v70, v72, v150, v40, 0, v73, v42, 0, MEMORY[0x1E0C9AA60], v11);

            v9 = 0x1E0C99000;
          }
          else
          {
            v74 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v68, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v143, v148, v69, v131, 1, v70, v71, v150, v40, 0, MEMORY[0x1E0C9AA60], v42, 0, MEMORY[0x1E0C9AA60], v11);
          }

          objc_msgSend(v138, "addObject:", v74);
LABEL_70:

          v16 = v144;
          v48 = (id)v146;
          v22 = v40;
          v30 = v148;
          v26 = v150;
          v49 = (void *)v141;
          goto LABEL_71;
        case 5:
        case 6:
          objc_msgSend(v11, "entryInvitationRecordGUID");
          v43 = objc_claimAutoreleasedReturnValue();
          v145 = v16;
          v147 = (void *)v43;
          v137 = v22;
          v149 = v30;
          v151 = v26;
          if (v43)
          {
            v44 = (void *)MEMORY[0x1E0D71630];
            v172 = v43;
            objc_msgSend(*(id *)(v9 + 3360), "arrayWithObjects:count:", &v172, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:", v45, v130);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "firstObject");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v47 = 0;
          }
          v75 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
          objc_msgSend(v47, "inviteeEmails");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "firstObject");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "inviteePhones");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "firstObject");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "inviteeFirstName");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "inviteeLastName");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v75, "initWithEmail:phone:firstName:lastName:", v77, v79, v80, v81);

          v82 = [PXSharedAlbumsActivityEntryContributor alloc];
          objc_msgSend(v47, "inviteeFullName");
          v83 = objc_claimAutoreleasedReturnValue();
          v84 = (void *)v83;
          if (v83)
            v85 = (const __CFString *)v83;
          else
            v85 = &stru_1E5149688;
          v142 = v47;
          objc_msgSend(v47, "inviteeEmails");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "firstObject");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:](v82, "initWithDisplayName:email:", v85, v87);

          objc_msgSend(v145, "keyAssets");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "firstObject");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "uuid");
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (v91)
          {
            v171 = v91;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v171, 1);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_fetchAssetsWithUUIDs:inPhotoLibrary:", v92, v143);
            v93 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v93 = 0;
          }
          if (objc_msgSend(v11, "entryType") == 5)
            v94 = 6;
          else
            v94 = 7;
          v95 = [PXSharedAlbumsActivityEntry alloc];
          objc_msgSend(v11, "entryDate");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = (void *)v88;
          v170 = v88;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v170, 1);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = v136;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v169, 1);
          v98 = objc_claimAutoreleasedReturnValue();
          v99 = (void *)v98;
          if (v91)
          {
            v168 = v91;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v168, 1);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v95, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v143, v149, v96, v94, 0, v97, v99, v151, v137, 0, v100, v93, 0, MEMORY[0x1E0C9AA60], v11);

          }
          else
          {
            v101 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v95, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v143, v149, v96, v94, 0, v97, v98, v151, v137, 0, MEMORY[0x1E0C9AA60], v93, 0, MEMORY[0x1E0C9AA60], v11);
          }
          v49 = v142;

          objc_msgSend(v138, "addObject:", v101);
          v9 = 0x1E0C99000;
          v16 = v145;
          v48 = v147;
          v22 = v137;
          v30 = v149;
          v26 = v151;
          goto LABEL_71;
        default:
          goto LABEL_72;
      }
    }
  }
LABEL_81:

  v123 = objc_msgSend(v138, "count");
  if (v123 != objc_msgSend(obj, "count"))
  {
    PLSharingGetLog();
    v124 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
    {
      v125 = objc_msgSend(v138, "count");
      v126 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 134218240;
      v165 = v125;
      v166 = 2048;
      v167 = v126;
      _os_log_impl(&dword_1A6789000, v124, OS_LOG_TYPE_INFO, "[ActivityEntry] Produced %lu activity entries from %lu cloud feed entries", buf, 0x16u);
    }

  }
  v127 = (void *)objc_msgSend(v138, "copy");

  return v127;
}

+ (id)_assetsAddedActivityFromAssets:(id)a3 batchID:(unint64_t)a4 inAlbum:(id)a5 forEntry:(id)a6 photoLibrary:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  void *v29;
  PXSharedAlbumsActivityEntryContributor *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  PXSharedAlbumsActivityEntry *v42;
  void *v43;
  void *v44;
  void *v45;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v47;
  void *v48;
  id v49;
  void *v50;
  __CFString *v51;
  unsigned int v52;
  __CFString *v53;
  PXSharedAlbumsActivityEntry *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  PXSharedAlbumsActivityEntryContributor *v59;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v60;
  PXSharedAlbumsActivityEntryContributor *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1E0CB3940];
  v49 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v57 = v12;
  objc_msgSend(v12, "URIRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_batch_%lu"), v16, a4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "localizedTitle");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (__CFString *)v17;
  else
    v19 = &stru_1E5149688;
  v51 = v19;

  objc_msgSend(v13, "cloudGUID");
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = v20;
  else
    v21 = &stru_1E5149688;
  v56 = v21;

  PXMap();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_msgSend(v23, "cloudIsMyAsset");
  objc_msgSend(v23, "cloudOwnerDisplayName");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (__CFString *)v24;
  else
    v26 = &stru_1E5149688;
  v27 = v26;

  if (!-[__CFString length](v27, "length"))
  {
    PLSharingGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v29;
      v64 = 2112;
      v65 = v23;
      _os_log_impl(&dword_1A6789000, v28, OS_LOG_TYPE_ERROR, "Empty/missing cloudOwnerDisplayName for asset [%{public}@]: %@", buf, 0x16u);

    }
  }
  v30 = [PXSharedAlbumsActivityEntryContributor alloc];
  objc_msgSend(v23, "cloudOwnerEmail");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:](v30, "initWithDisplayName:email:", v27, v31);

  objc_msgSend(v23, "orderedCloudComments");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "isCaption");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v27;
  v50 = v33;
  if (objc_msgSend(v34, "BOOLValue"))
  {
    objc_msgSend(v33, "commentText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }

  v36 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
  objc_msgSend(v23, "cloudOwnerEmail");
  v37 = v23;
  v48 = v23;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "cloudOwnerFirstName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "cloudOwnerLastName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v36, "initWithEmail:phone:firstName:lastName:", v38, 0, v39, v40);

  objc_msgSend(a1, "_fetchAssetsWithUUIDs:inPhotoLibrary:", v22, v49);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = [PXSharedAlbumsActivityEntry alloc];
  objc_msgSend(v57, "entryDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v42, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v49, v58, v43, 0, v52, v44, v45, v56, v51, v35, v22, v41, 0, MEMORY[0x1E0C9AA60], v57);

  return v55;
}

+ (id)_assetsAddedActivitiesFromCloudFeedAssetsEntry:(id)a3 inMostRecentOrder:(BOOL)a4 inAlbum:(id)a5 photoLibrary:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  void *v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v22 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v8, "entryAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "activityEntryAssetsAddedBatchingBehavior");

    if (v13)
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__123708;
      v47 = __Block_byref_object_dispose__123709;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v48 = (id)objc_claimAutoreleasedReturnValue();
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x3032000000;
      v41[3] = __Block_byref_object_copy__123708;
      v41[4] = __Block_byref_object_dispose__123709;
      v42 = 0;
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = __Block_byref_object_copy__123708;
      v39[4] = __Block_byref_object_dispose__123709;
      v40 = 0;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v38 = 0;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke;
      v30[3] = &unk_1E5129D80;
      v35 = v39;
      v36 = v13;
      v32 = v41;
      v33 = v37;
      v34 = &v43;
      v31 = v11;
      objc_msgSend(v31, "enumerateObjectsUsingBlock:", v30);
      if ((unint64_t)objc_msgSend((id)v44[5], "count") >= 2)
      {
        PLSharingGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = objc_msgSend((id)v44[5], "count");
          objc_msgSend(v8, "objectID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v51 = v15;
          v52 = 2112;
          v53 = v16;
          _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_INFO, "[ActivityEntry] Produced %lu assets activity entries from assets-added cloud entry: %@", buf, 0x16u);

        }
      }
      v17 = (void *)objc_msgSend((id)v44[5], "copy");

      _Block_object_dispose(v37, 8);
      _Block_object_dispose(v39, 8);

      _Block_object_dispose(v41, 8);
      _Block_object_dispose(&v43, 8);

    }
    else
    {
      v49 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__123708;
    v47 = __Block_byref_object_dispose__123709;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke_234;
    v24[3] = &unk_1E5129DA8;
    v29 = a1;
    v25 = v9;
    v26 = v8;
    v27 = v10;
    v28 = &v43;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v24);
    v19 = (void *)v44[5];
    if (v22)
    {
      objc_msgSend(v19, "reverseObjectEnumerator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allObjects");
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = v19;
    }

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    v18 = (id)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

+ (id)_reactionActivitiesFromCloudFeedLikeEntry:(id)a3 inAlbum:(id)a4 photoLibrary:(id)a5 plPhotoLibrary:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  PXSharedAlbumsActivityEntry *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PXSharedAlbumsActivityEntry *v34;
  void *v35;
  void *v36;
  void *v37;
  PXSharedAlbumsActivityEntry *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PXSharedAlbumsActivityEntry *v44;
  void *v45;
  int v46;
  PXSharedAlbumsActivityEntry *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  PXSharedAlbumsActivityEntry *v55;
  void *v56;
  void *v57;
  id v58;
  __CFString *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  _QWORD v69[4];
  PXSharedAlbumsActivityEntry *v70;
  id v71;
  __CFString *v72;
  __CFString *v73;
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  void *v86;
  void *v87;
  void *v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v67 = a4;
  v66 = a5;
  v64 = a6;
  v68 = v10;
  objc_msgSend(v10, "entryLikeComments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = (id)MEMORY[0x1E0C9AA60];
  if (v12)
  {
    objc_msgSend(v10, "URIRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v67, "localizedTitle");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (__CFString *)v15;
    else
      v17 = &stru_1E5149688;
    v60 = v17;

    objc_msgSend(v67, "cloudGUID");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = &stru_1E5149688;
    v59 = v20;

    v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v11, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v11, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v11, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entryDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    v83 = &v82;
    v84 = 0x2020000000;
    v24 = MEMORY[0x1E0C809B0];
    v85 = 0;
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke;
    v77[3] = &unk_1E5129DD0;
    v81 = &v82;
    v65 = v22;
    v78 = v65;
    v58 = v23;
    v79 = v58;
    v25 = v21;
    v80 = v25;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v77);
    v62 = v25;
    PXMap();
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_fetchAssetsWithUUIDs:inPhotoLibrary:", v26, v66);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v26;
    if (objc_msgSend(v62, "count") == 1)
    {
      if (objc_msgSend(v65, "count") == 1)
      {
        objc_msgSend(v65, "objectAtIndex:", 0);
        v55 = (PXSharedAlbumsActivityEntry *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndex:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = [PXSharedAlbumsActivityEntry alloc];
        v29 = *((unsigned __int8 *)v83 + 24);
        v89[0] = v55;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "cloudGUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v28, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v66, v54, v56, 1, v29 != 0, v30, v31, v59, v60, 0, v57, v61, v33, v13, v68);

        objc_msgSend(v63, "addObject:", v34);
      }
      else
      {
        +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "activityEntryAllowsMultipleLikeContributors");

        if (v46)
        {
          v47 = [PXSharedAlbumsActivityEntry alloc];
          v48 = *((unsigned __int8 *)v83 + 24);
          objc_msgSend(v65, "array");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "array");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "cloudGUID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v47, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v66, v54, v56, 1, v48 != 0, v49, v50, v59, v60, 0, v57, v61, v52, v13, v68);

          objc_msgSend(v63, "addObject:", v55);
        }
        else
        {
          v69[0] = v24;
          v69[1] = 3221225472;
          v69[2] = __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke_3;
          v69[3] = &unk_1E5129E18;
          v70 = v54;
          v71 = v66;
          v72 = v59;
          v73 = v60;
          v74 = v61;
          v75 = v68;
          v76 = v63;
          objc_msgSend(v11, "enumerateObjectsUsingBlock:", v69);

          v55 = v70;
        }
      }
    }
    else
    {
      objc_msgSend(v68, "URIRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "absoluteString");
      v55 = (PXSharedAlbumsActivityEntry *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v65, "objectAtIndex:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectAtIndex:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = [PXSharedAlbumsActivityEntry alloc];
      v39 = *((unsigned __int8 *)v83 + 24);
      v87 = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "cloudGUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v38, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v66, v55, v56, 1, v39 != 0, v40, v41, v59, v60, 0, v57, v61, v43, v13, v68);

      objc_msgSend(v63, "addObject:", v44);
    }

    v13 = v63;
    _Block_object_dispose(&v82, 8);

  }
  return v13;
}

+ (id)fetchKeyAssetsForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "keyAssetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_fetchAssetsWithUUIDs:inPhotoLibrary:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_fetchAssetsWithUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), (_QWORD)v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  v24 = objc_alloc(MEMORY[0x1E0CD1620]);
  v25 = (void *)objc_msgSend(v24, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v17, v6, *MEMORY[0x1E0CD1B90], 0, 0, 0);

  return v25;
}

void __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  PXSharedAlbumsActivityEntryContributor *v6;
  void *v7;
  void *v8;
  PXSharedAlbumsActivityEntryContributor *v9;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v14;
  PXSharedAlbumsActivityEntryContributor *v15;
  void *v16;
  void *v17;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = a2;
  objc_msgSend(v3, "isMyComment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v6 = [PXSharedAlbumsActivityEntryContributor alloc];
    objc_msgSend(v3, "commenterDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commenterEmail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:](v6, "initWithDisplayName:email:", v7, v8);

    v10 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
    objc_msgSend(v3, "commenterEmail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commenterFirstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commenterLastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v10, "initWithEmail:phone:firstName:lastName:", v11, 0, v12, v13);

    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v9, 0);
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v14, 0);
  }
  else
  {
    v15 = [PXSharedAlbumsActivityEntryContributor alloc];
    objc_msgSend(v3, "commenterDisplayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commenterEmail");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:](v15, "initWithDisplayName:email:", v16, v17);

    v18 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
    objc_msgSend(v3, "commenterEmail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commenterFirstName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commenterLastName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v18, "initWithEmail:phone:firstName:lastName:", v19, 0, v20, v21);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  }

  v22 = *(void **)(a1 + 48);
  objc_msgSend(v3, "likedAsset");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "addObject:", v23);
}

void __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  PXSharedAlbumsActivityEntryContributor *v17;
  void *v18;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  PXSharedAlbumsActivityEntry *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  PXSharedAlbumsActivityEntry *v36;
  uint64_t v37;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v38;
  PXSharedAlbumsActivityEntryContributor *v39;
  __CFString *v40;
  unsigned int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v45;
  PXSharedAlbumsActivityEntryContributor *v46;
  uint8_t buf[4];
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "cloudGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "shortObjectIDURI");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_reaction_%@"), *(_QWORD *)(a1 + 32), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "likedAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v42 = v8;
      v43 = v7;
      objc_msgSend(v3, "isMyComment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      v13 = &stru_1E5149688;
      v41 = v12;
      if ((v12 & 1) == 0)
      {
        objc_msgSend(v3, "commenterDisplayName");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (__CFString *)v14;
        else
          v16 = &stru_1E5149688;
        v13 = v16;

      }
      v40 = (__CFString *)v13;
      v17 = [PXSharedAlbumsActivityEntryContributor alloc];
      objc_msgSend(v3, "commenterEmail");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:](v17, "initWithDisplayName:email:", v13, v18);

      v19 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
      objc_msgSend(v3, "commenterEmail");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "commenterFirstName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "commenterLastName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v19, "initWithEmail:phone:firstName:lastName:", v20, 0, v21, v22);

      v36 = [PXSharedAlbumsActivityEntry alloc];
      v37 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "commentDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 48);
      v25 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v3, "likedAsset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v3, "cloudGUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v24;
      v8 = v42;
      v31 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v36, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v37, v42, v35, 1, v41, v34, v23, v33, v25, 0, v28, v29, v30, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 72));

      objc_msgSend(*(id *)(a1 + 80), "addObject:", v31);
      v7 = v43;
    }
    else
    {
      PLSharingGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v3;
        _os_log_impl(&dword_1A6789000, v32, OS_LOG_TYPE_ERROR, "likedAsset was missing for PLCloudSharedComment (like): %@. Skipping.", buf, 0xCu);
      }

    }
  }
  else
  {
    PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v3;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "cloudGUID and shortObjectIDURI was missing for PLCloudSharedComment (like): %@. Skipping.", buf, 0xCu);
    }
  }

}

uint64_t __109__PXSharedAlbumsActivityEntry__reactionActivitiesFromCloudFeedLikeEntry_inAlbum_photoLibrary_plPhotoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "cloudBatchID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = v4;
  if (v4 == v3)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "isEqualToString:", v3);

  objc_msgSend(v15, "orderedCloudComments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "isCaption");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (*(_QWORD *)(a1 + 72) == 2)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v11 + 24))
    {
      if ((v6 & 1) == 0)
      {
        *(_BYTE *)(v11 + 24) = v10;
LABEL_12:
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
        goto LABEL_13;
      }
    }
    else
    {
      *(_BYTE *)(v11 + 24) = v10;
      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
  }
  else if (!v6)
  {
    goto LABEL_12;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    goto LABEL_12;
LABEL_13:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v15);

}

void __117__PXSharedAlbumsActivityEntry__assetsAddedActivitiesFromCloudFeedAssetsEntry_inMostRecentOrder_inAlbum_photoLibrary___block_invoke_234(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)a1[8];
  objc_msgSend(a2, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_assetsAddedActivityFromAssets:batchID:inAlbum:forEntry:photoLibrary:", v6, a3, a1[4], a1[5], a1[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v7);
}

uint64_t __100__PXSharedAlbumsActivityEntry__assetsAddedActivityFromAssets_batchID_inAlbum_forEntry_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __108__PXSharedAlbumsActivityEntry_activitiesFromCloudFeedEntries_inMostRecentOrder_photoLibrary_plPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  PXSharedAlbumsActivityEntryContributor *v9;
  void *v10;
  PXSharedAlbumsActivityEntryContributor *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  PXSharedAlbumsActivityEntryContributor *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  PXSharedAlbumsActivityEntry *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  PXSharedAlbumsActivityEntry *v37;
  void *v38;
  uint64_t v39;
  PXSharedAlbumsActivityEntry *v40;
  NSObject *v41;
  void *v42;
  PXSharedAlbumsActivityEntryContributor *v43;
  __CFString *v44;
  __CFString *v45;
  unsigned int v46;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v47;
  PXSharedAlbumsActivityEntryAvatarConfiguration *v48;
  PXSharedAlbumsActivityEntryContributor *v49;
  void *v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "isMyComment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "commenterDisplayName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E5149688;
  v8 = v7;

  v9 = [PXSharedAlbumsActivityEntryContributor alloc];
  objc_msgSend(v3, "commenterEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXSharedAlbumsActivityEntryContributor initWithDisplayName:email:](v9, "initWithDisplayName:email:", v8, v10);

  objc_msgSend(v3, "commentText");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = &stru_1E5149688;
  v15 = v14;

  v16 = [PXSharedAlbumsActivityEntryAvatarConfiguration alloc];
  objc_msgSend(v3, "commenterEmail");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commenterFirstName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commenterLastName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[PXSharedAlbumsActivityEntryAvatarConfiguration initWithEmail:phone:firstName:lastName:](v16, "initWithEmail:phone:firstName:lastName:", v17, 0, v18, v19);

  objc_msgSend(v3, "cloudGUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(v3, "shortObjectIDURI");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  if (objc_msgSend(v23, "length"))
  {
    v44 = v15;
    objc_msgSend(v3, "commentedAsset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v8;
    if (v24)
    {
      objc_msgSend(v3, "commentedAsset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uuid");
      v26 = v11;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v28 = objc_claimAutoreleasedReturnValue();

      v11 = v26;
    }
    else
    {
      v28 = MEMORY[0x1E0C9AA60];
    }
    v43 = v11;

    objc_msgSend(*(id *)(a1 + 80), "_fetchAssetsWithUUIDs:inPhotoLibrary:", v28, *(_QWORD *)(a1 + 32));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_comment_%@"), *(_QWORD *)(a1 + 40), v23);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = [PXSharedAlbumsActivityEntry alloc];
    v39 = *(_QWORD *)(a1 + 32);
    v40 = v31;
    objc_msgSend(*(id *)(a1 + 48), "entryDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v41 = v28;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1 + 56);
    v34 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v3, "cloudGUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[PXSharedAlbumsActivityEntry initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:](v40, "initWithPhotoLibrary:uuid:date:type:isFromMe:contributors:avatarConfigurations:albumGUID:albumName:message:keyAssetUUIDs:keyAssets:relatedCommentUUID:relatedUUIDs:underlyingObject:", v39, v42, v38, 2, v46, v32, v33, v35, v34, v44, v28, v30, v36, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 48));

    v11 = v43;
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v37);

    v15 = v44;
    v8 = v45;
    v29 = v41;
  }
  else
  {
    PLSharingGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v3;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_ERROR, "cloudGUID and shortObjectIDURI was missing for PLCloudSharedComment (comment): %@. Skipping.", buf, 0xCu);
    }
  }

}

void __86__PXSharedAlbumsActivityEntry__fetchRecentActivitiesWithOptions_olderThanDate_filter___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D71618], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", a1[4], 0, a1[5], a1[8], a1[9], 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:", v5, 1, a1[6], a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __89__PXSharedAlbumsActivityEntry_fetchCountOfRecentFeedActivitiesWithOptions_newerThanDate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71618], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", a1[4], a1[5], 0, a1[7], a1[8], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "entryAlbumGUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v11 = (void *)MEMORY[0x1E0D71628];
          objc_msgSend(v8, "photoLibrary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cloudSharedAlbumWithGUID:inLibrary:", v9, v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v9);
        }
        if (objc_msgSend(v10, "cloudNotificationsEnabled"))
          ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

void __58__PXSharedAlbumsActivityEntry_fetchActivitiesWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "reverseSortOrder"))
    objc_msgSend(MEMORY[0x1E0D71618], "recentEntriesInLibrary:earliestDate:latestDate:limit:filter:sortDescriptors:", *(_QWORD *)(a1 + 40), 0, 0, objc_msgSend(*(id *)(a1 + 32), "fetchLimit"), 0, 0);
  else
    objc_msgSend(MEMORY[0x1E0D71618], "allEntriesInLibrary:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "activitiesFromCloudFeedEntries:inMostRecentOrder:photoLibrary:plPhotoLibrary:", v5, objc_msgSend(*(id *)(a1 + 32), "reverseSortOrder"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
