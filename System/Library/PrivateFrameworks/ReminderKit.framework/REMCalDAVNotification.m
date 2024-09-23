@implementation REMCalDAVNotification

- (id)initCalDAVNotificationWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 uuidString:(id)a6 hostURL:(id)a7 externalIdentifier:(id)a8 externalModificationTag:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  REMCalDAVNotification *v21;
  REMCalDAVNotification *v22;
  uint64_t v23;
  NSString *uuidString;
  uint64_t v25;
  NSURL *hostURL;
  void *v27;
  void *v28;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v32.receiver = self;
  v32.super_class = (Class)REMCalDAVNotification;
  v21 = -[REMCalDAVNotification init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_objectID, a3);
    objc_storeStrong((id *)&v22->_accountID, a4);
    objc_storeStrong((id *)&v22->_listID, a5);
    v23 = objc_msgSend(v17, "copy", v30, v31);
    uuidString = v22->_uuidString;
    v22->_uuidString = (NSString *)v23;

    v25 = objc_msgSend(v18, "copy");
    hostURL = v22->_hostURL;
    v22->_hostURL = (NSURL *)v25;

    v27 = (void *)objc_msgSend(v19, "copy");
    -[REMCalDAVNotification setExternalIdentifier:](v22, "setExternalIdentifier:", v27);

    v28 = (void *)objc_msgSend(v20, "copy");
    -[REMCalDAVNotification setExternalModificationTag:](v22, "setExternalModificationTag:", v28);

    -[REMCalDAVNotification setDaPushKey:](v22, "setDaPushKey:", &stru_1E67FB1F0);
    -[REMCalDAVNotification setDaSyncToken:](v22, "setDaSyncToken:", &stru_1E67FB1F0);
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMCalDAVNotification)initWithCoder:(id)a3
{
  id v4;
  REMCalDAVNotification *v5;
  uint64_t v6;
  REMObjectID *objectID;
  uint64_t v8;
  REMObjectID *accountID;
  uint64_t v10;
  REMObjectID *listID;
  uint64_t v12;
  NSString *uuidString;
  uint64_t v14;
  NSURL *hostURL;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)REMCalDAVNotification;
  v5 = -[REMCalDAVNotification init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listID"));
    v10 = objc_claimAutoreleasedReturnValue();
    listID = v5->_listID;
    v5->_listID = (REMObjectID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuidString"));
    v12 = objc_claimAutoreleasedReturnValue();
    uuidString = v5->_uuidString;
    v5->_uuidString = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    hostURL = v5->_hostURL;
    v5->_hostURL = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMCalDAVNotification setExternalIdentifier:](v5, "setExternalIdentifier:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalModificationTag"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMCalDAVNotification setExternalModificationTag:](v5, "setExternalModificationTag:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daSyncToken"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMCalDAVNotification setDaSyncToken:](v5, "setDaSyncToken:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daPushKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMCalDAVNotification setDaPushKey:](v5, "setDaPushKey:", v19);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  id v13;

  v4 = a3;
  -[REMCalDAVNotification objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  -[REMCalDAVNotification accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountID"));

  -[REMCalDAVNotification listID](self, "listID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("listID"));

  -[REMCalDAVNotification uuidString](self, "uuidString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("uuidString"));

  -[REMCalDAVNotification hostURL](self, "hostURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("hostURL"));

  -[REMCalDAVNotification externalIdentifier](self, "externalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("externalIdentifier"));

  -[REMCalDAVNotification externalModificationTag](self, "externalModificationTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("externalModificationTag"));

  -[REMCalDAVNotification daSyncToken](self, "daSyncToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("daSyncToken"));

  -[REMCalDAVNotification daPushKey](self, "daPushKey");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("daPushKey"));

}

- (BOOL)isEqual:(id)a3
{
  REMCalDAVNotification *v4;
  REMCalDAVNotification *v5;
  REMCalDAVNotification *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;

  v4 = (REMCalDAVNotification *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMCalDAVNotification objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMCalDAVNotification objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_34;
      }
      -[REMCalDAVNotification accountID](self, "accountID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification accountID](v6, "accountID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMCalDAVNotification accountID](self, "accountID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification accountID](v6, "accountID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_34;
      }
      -[REMCalDAVNotification listID](self, "listID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification listID](v6, "listID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMCalDAVNotification listID](self, "listID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification listID](v6, "listID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_34;
      }
      -[REMCalDAVNotification uuidString](self, "uuidString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification uuidString](v6, "uuidString");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMCalDAVNotification uuidString](self, "uuidString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification uuidString](v6, "uuidString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_34;
      }
      -[REMCalDAVNotification hostURL](self, "hostURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification hostURL](v6, "hostURL");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[REMCalDAVNotification hostURL](self, "hostURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification hostURL](v6, "hostURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_34;
      }
      -[REMCalDAVNotification externalIdentifier](self, "externalIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification externalIdentifier](v6, "externalIdentifier");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[REMCalDAVNotification externalIdentifier](self, "externalIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification externalIdentifier](v6, "externalIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_34;
      }
      -[REMCalDAVNotification externalModificationTag](self, "externalModificationTag");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification externalModificationTag](v6, "externalModificationTag");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v44 == (void *)v45)
      {

      }
      else
      {
        v46 = (void *)v45;
        -[REMCalDAVNotification externalModificationTag](self, "externalModificationTag");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification externalModificationTag](v6, "externalModificationTag");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "isEqual:", v48);

        if (!v49)
          goto LABEL_34;
      }
      -[REMCalDAVNotification daSyncToken](self, "daSyncToken");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification daSyncToken](v6, "daSyncToken");
      v51 = objc_claimAutoreleasedReturnValue();
      if (v50 == (void *)v51)
      {

      }
      else
      {
        v52 = (void *)v51;
        -[REMCalDAVNotification daSyncToken](self, "daSyncToken");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification daSyncToken](v6, "daSyncToken");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqual:", v54);

        if (!v55)
          goto LABEL_34;
      }
      -[REMCalDAVNotification daPushKey](self, "daPushKey");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMCalDAVNotification daPushKey](v6, "daPushKey");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v57 == (void *)v58)
      {
        v13 = 1;
        v59 = v57;
      }
      else
      {
        v59 = (void *)v58;
        -[REMCalDAVNotification daPushKey](self, "daPushKey");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMCalDAVNotification daPushKey](v6, "daPushKey");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v60, "isEqual:", v61);

      }
      goto LABEL_35;
    }
LABEL_34:
    v13 = 0;
LABEL_35:

    goto LABEL_36;
  }
  v13 = 1;
LABEL_36:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMCalDAVNotification objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMCalDAVNotification objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCalDAVNotification listID](self, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCalDAVNotification uuidString](self, "uuidString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCalDAVNotification hostURL](self, "hostURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMCalDAVNotification externalIdentifier](self, "externalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, owner: %@, uuid: %@, hostURL: %@, extID: %@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDCalDAVNotification");
}

- (NSString)externalIdentifierForMarkedForDeletionObject
{
  NSObject *v3;
  void *v4;
  void *v5;

  +[REMLogStore read](REMLogStore, "read");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[REMCalDAVNotification externalIdentifierForMarkedForDeletionObject].cold.1(v3);

  -[REMCalDAVNotification externalIdentifier](self, "externalIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:](REMExternalSyncMetadataUtils, "decodeExternalIdentifierForMarkedForDeletionObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)shouldUseExternalIdentifierAsDeletionKey
{
  return 1;
}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (void)setDaPushKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (void)setDaSyncToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (NSURL)hostURL
{
  return self->_hostURL;
}

- (void)setHostURL:(id)a3
{
  objc_storeStrong((id *)&self->_hostURL, a3);
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_hostURL, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);
  objc_storeStrong((id *)&self->externalIdentifier, 0);
}

+ (BOOL)isChangeTrackableModel
{
  return 1;
}

+ (BOOL)rem_DA_supportsFetching
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(a1, "performSelector:", sel_isChangeTrackableFetchableModel) != 0;
}

+ (BOOL)rem_DA_supportsConcealedObjects
{
  return 0;
}

+ (NSArray)rem_DA_propertiesAffectingIsConcealed
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to check properties affecting isConcealed for REMCalDAVNotification."));
  return 0;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to fetch by object ID for REMCalDAVNotification."));
  return 0;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to fetch by object IDs for REMCalDAVNotification."));
  return 0;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_308_0;
}

uint64_t __104__REMCalDAVNotification_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "externalIdentifier");
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to call +rem_DA_deletedKeyFromConcealedModelObjectBlock for REMCalDAVNotification."));
  return 0;
}

- (void)externalIdentifierForMarkedForDeletionObject
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "REMCalDAVNotification is designed to be immutable and does not do marked-for-deletion.", v1, 2u);
}

@end
