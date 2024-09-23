@implementation REMSharee

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
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to check properties affecting isConcealed for REMSharee."));
  return 0;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to fetch by object ID for REMSharee."));
  return 0;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to fetch by object IDs for REMSharee."));
  return 0;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_298;
}

REMDAShareeTombstone *__92__REMSharee_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  REMDAShareeTombstone *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = objc_alloc_init(REMDAShareeTombstone);
  objc_msgSend(v2, "objectIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAShareeTombstone setObjectIdentifier:](v3, "setObjectIdentifier:", v4);

  objc_msgSend(v2, "shareeOwningListIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAShareeTombstone setOwningListIdentifier:](v3, "setOwningListIdentifier:", v5);

  objc_msgSend(v2, "shareeDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMDAShareeTombstone setDisplayName:](v3, "setDisplayName:", v6);

  objc_msgSend(v2, "shareeAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMDAShareeTombstone setAddress:](v3, "setAddress:", v7);
  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ASSERT failure: Should not attempt to call +rem_DA_deletedKeyFromConcealedModelObjectBlock for REMSharee."));
  return 0;
}

- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6 firstName:(id)a7 middleName:(id)a8 lastName:(id)a9 namePrefix:(id)a10 nameSuffix:(id)a11 nickname:(id)a12 address:(id)a13 status:(int64_t)a14 accessLevel:(int64_t)a15
{
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  REMSharee *v30;
  REMSharee *v31;
  uint64_t v32;
  NSString *displayName;
  uint64_t v34;
  NSString *firstName;
  uint64_t v36;
  NSString *middleName;
  uint64_t v38;
  NSString *lastName;
  uint64_t v40;
  NSString *namePrefix;
  uint64_t v42;
  NSString *nameSuffix;
  uint64_t v44;
  NSString *nickname;
  uint64_t v46;
  NSString *address;
  id obj;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v53 = a3;
  obj = a4;
  v52 = a4;
  v51 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v54 = a9;
  v24 = v21;
  v25 = a10;
  v26 = a11;
  v27 = v23;
  v28 = a12;
  v29 = a13;
  v55.receiver = self;
  v55.super_class = (Class)REMSharee;
  v30 = -[REMSharee init](&v55, sel_init);
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_objectID, a3);
    objc_storeStrong((id *)&v31->_accountID, obj);
    objc_storeStrong((id *)&v31->_listID, a5);
    v32 = objc_msgSend(v24, "copy");
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    firstName = v31->_firstName;
    v31->_firstName = (NSString *)v34;

    v36 = objc_msgSend(v27, "copy");
    middleName = v31->_middleName;
    v31->_middleName = (NSString *)v36;

    v38 = objc_msgSend(v54, "copy");
    lastName = v31->_lastName;
    v31->_lastName = (NSString *)v38;

    v40 = objc_msgSend(v25, "copy");
    namePrefix = v31->_namePrefix;
    v31->_namePrefix = (NSString *)v40;

    v42 = objc_msgSend(v26, "copy");
    nameSuffix = v31->_nameSuffix;
    v31->_nameSuffix = (NSString *)v42;

    v44 = objc_msgSend(v28, "copy");
    nickname = v31->_nickname;
    v31->_nickname = (NSString *)v44;

    v46 = objc_msgSend(v29, "copy");
    address = v31->_address;
    v31->_address = (NSString *)v46;

    v31->_status = a14;
    v31->_accessLevel = a15;
  }

  return v31;
}

- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 displayName:(id)a6 firstName:(id)a7 lastName:(id)a8 address:(id)a9 status:(int64_t)a10 accessLevel:(int64_t)a11
{
  return -[REMSharee initShareeWithObjectID:accountID:listID:displayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:](self, "initShareeWithObjectID:accountID:listID:displayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:", a3, a4, a5, a6, a7, 0, a8, 0, 0, 0, a9, a10, a11);
}

- (id)initShareeWithObjectID:(id)a3 accountID:(id)a4 listID:(id)a5 personNameComponents:(id)a6 address:(id)a7 status:(int64_t)a8 accessLevel:(int64_t)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v27;

  v24 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v13, "givenName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "middleName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "familyName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "namePrefix");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nameSuffix");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nickname");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[REMSharee initShareeWithObjectID:accountID:listID:displayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:](self, "initShareeWithObjectID:accountID:listID:displayName:firstName:middleName:lastName:namePrefix:nameSuffix:nickname:address:status:accessLevel:", v16, v15, v14, 0, v17, v18, v19, v20, v21, v22, v24, a8, a9);
  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSharee)initWithCoder:(id)a3
{
  id v4;
  REMSharee *v5;
  uint64_t v6;
  REMObjectID *objectID;
  uint64_t v8;
  REMObjectID *accountID;
  uint64_t v10;
  REMObjectID *listID;
  uint64_t v12;
  NSString *displayName;
  uint64_t v14;
  NSString *firstName;
  uint64_t v16;
  NSString *middleName;
  uint64_t v18;
  NSString *lastName;
  uint64_t v20;
  NSString *namePrefix;
  uint64_t v22;
  NSString *nameSuffix;
  uint64_t v24;
  NSString *nickname;
  uint64_t v26;
  NSString *address;
  unint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)REMSharee;
  v5 = -[REMSharee init](&v45, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v14 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("middleName"));
    v16 = objc_claimAutoreleasedReturnValue();
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namePrefix"));
    v20 = objc_claimAutoreleasedReturnValue();
    namePrefix = v5->_namePrefix;
    v5->_namePrefix = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameSuffix"));
    v22 = objc_claimAutoreleasedReturnValue();
    nameSuffix = v5->_nameSuffix;
    v5->_nameSuffix = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nickname"));
    v24 = objc_claimAutoreleasedReturnValue();
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v26 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v26;

    v28 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    if (v28 >= 6)
    {
      v29 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[REMSharee initWithCoder:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

      v28 = 0;
    }
    v5->_status = v28;
    v36 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accessLevel"));
    if (v36 >= 4)
    {
      v37 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        -[REMSharee initWithCoder:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);

      v36 = 0;
    }
    v5->_accessLevel = v36;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
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
  id v15;

  v15 = a3;
  -[REMSharee objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("objectID"));

  -[REMSharee accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v5, CFSTR("accountID"));

  -[REMSharee listID](self, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v6, CFSTR("listID"));

  -[REMSharee displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[REMSharee firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v8, CFSTR("firstName"));

  -[REMSharee middleName](self, "middleName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v9, CFSTR("middleName"));

  -[REMSharee lastName](self, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v10, CFSTR("lastName"));

  -[REMSharee namePrefix](self, "namePrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v11, CFSTR("namePrefix"));

  -[REMSharee nameSuffix](self, "nameSuffix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v12, CFSTR("nameSuffix"));

  -[REMSharee nickname](self, "nickname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v13, CFSTR("nickname"));

  -[REMSharee address](self, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v14, CFSTR("address"));

  objc_msgSend(v15, "encodeInteger:forKey:", -[REMSharee status](self, "status"), CFSTR("status"));
  objc_msgSend(v15, "encodeInteger:forKey:", -[REMSharee accessLevel](self, "accessLevel"), CFSTR("accessLevel"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[REMSharee isEqualToSharee:](self, "isEqualToSharee:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToSharee:(id)a3
{
  REMSharee *v4;
  REMSharee *v5;
  REMSharee *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;

  v4 = (REMSharee *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
    v7 = -[REMSharee status](self, "status");
    if (v7 != -[REMSharee status](v6, "status"))
      goto LABEL_44;
    v8 = -[REMSharee accessLevel](self, "accessLevel");
    if (v8 != -[REMSharee accessLevel](v6, "accessLevel"))
      goto LABEL_44;
    -[REMSharee objectID](self, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee objectID](v6, "objectID");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[REMSharee objectID](self, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee objectID](v6, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_44;
    }
    -[REMSharee accountID](self, "accountID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee accountID](v6, "accountID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[REMSharee accountID](self, "accountID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee accountID](v6, "accountID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_44;
    }
    -[REMSharee listID](self, "listID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee listID](v6, "listID");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[REMSharee listID](self, "listID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee listID](v6, "listID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_44;
    }
    -[REMSharee displayName](self, "displayName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee displayName](v6, "displayName");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v28 == (void *)v29)
    {

    }
    else
    {
      v30 = (void *)v29;
      -[REMSharee displayName](self, "displayName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee displayName](v6, "displayName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_44;
    }
    -[REMSharee firstName](self, "firstName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee firstName](v6, "firstName");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v34 == (void *)v35)
    {

    }
    else
    {
      v36 = (void *)v35;
      -[REMSharee firstName](self, "firstName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee firstName](v6, "firstName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_44;
    }
    -[REMSharee middleName](self, "middleName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee middleName](v6, "middleName");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v40 == (void *)v41)
    {

    }
    else
    {
      v42 = (void *)v41;
      -[REMSharee middleName](self, "middleName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee middleName](v6, "middleName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_44;
    }
    -[REMSharee lastName](self, "lastName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee lastName](v6, "lastName");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v46 == (void *)v47)
    {

    }
    else
    {
      v48 = (void *)v47;
      -[REMSharee lastName](self, "lastName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee lastName](v6, "lastName");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqual:", v50);

      if (!v51)
        goto LABEL_44;
    }
    -[REMSharee namePrefix](self, "namePrefix");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee namePrefix](v6, "namePrefix");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v52 == (void *)v53)
    {

    }
    else
    {
      v54 = (void *)v53;
      -[REMSharee namePrefix](self, "namePrefix");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee namePrefix](v6, "namePrefix");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v55, "isEqual:", v56);

      if (!v57)
        goto LABEL_44;
    }
    -[REMSharee nameSuffix](self, "nameSuffix");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee nameSuffix](v6, "nameSuffix");
    v59 = objc_claimAutoreleasedReturnValue();
    if (v58 == (void *)v59)
    {

    }
    else
    {
      v60 = (void *)v59;
      -[REMSharee nameSuffix](self, "nameSuffix");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee nameSuffix](v6, "nameSuffix");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqual:", v62);

      if (!v63)
        goto LABEL_44;
    }
    -[REMSharee nickname](self, "nickname");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee nickname](v6, "nickname");
    v65 = objc_claimAutoreleasedReturnValue();
    if (v64 == (void *)v65)
    {

    }
    else
    {
      v66 = (void *)v65;
      -[REMSharee nickname](self, "nickname");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee nickname](v6, "nickname");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "isEqual:", v68);

      if (!v69)
      {
LABEL_44:
        v15 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    -[REMSharee address](self, "address");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSharee address](v6, "address");
    v72 = objc_claimAutoreleasedReturnValue();
    if (v71 == (void *)v72)
    {
      v15 = 1;
      v73 = v71;
    }
    else
    {
      v73 = (void *)v72;
      -[REMSharee address](self, "address");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSharee address](v6, "address");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v74, "isEqual:", v75);

    }
    goto LABEL_45;
  }
  v15 = 1;
LABEL_46:

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMSharee objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSPersonNameComponents)personNameComponents
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[REMSharee firstName](self, "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[REMSharee middleName](self, "middleName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[REMSharee lastName](self, "lastName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[REMSharee nickname](self, "nickname");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return (NSPersonNameComponents *)v4;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  -[REMSharee firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v5);

  -[REMSharee middleName](self, "middleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMiddleName:", v6);

  -[REMSharee lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v7);

  -[REMSharee namePrefix](self, "namePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNamePrefix:", v8);

  -[REMSharee nameSuffix](self, "nameSuffix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNameSuffix:", v9);

  -[REMSharee nickname](self, "nickname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNickname:", v10);

  return (NSPersonNameComponents *)v4;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMSharee objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharee listID](self, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMSharee status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMSharee accessLevel](self, "accessLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, listID: %@, status: %@, access: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)debugDescription
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
  -[REMSharee objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharee listID](self, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMSharee status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMSharee accessLevel](self, "accessLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSharee address](self, "address");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, listID: %@, status: %@, access: %@, address: %@>"), v4, self, v5, v6, v7, v8, v9);
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
  return (NSString *)CFSTR("REMCDSharee");
}

+ (id)nullifiedAssignmentOriginatorID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("0D5A5BA9-302D-4518-AE2D-58DDA388E850"));
  +[REMSharee objectIDWithUUID:](REMSharee, "objectIDWithUUID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)formattedName
{
  void *v3;
  void *v4;

  -[REMSharee displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rem_tidyFormattedNameString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[REMSharee formattedNameWithStyle:](self, "formattedNameWithStyle:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)shortName
{
  void *v3;

  -[REMSharee formattedNameWithStyle:](self, "formattedNameWithStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[REMSharee displayName](self, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)formattedNameWithStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  -[REMSharee personNameComponents](self, "personNameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_3;
  -[REMSharee personNameComponents](self, "personNameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v6, a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rem_tidyFormattedNameString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_3:
    -[REMSharee address](self, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rem_hasMailto");

    if (!v10)
      goto LABEL_5;
    -[REMSharee address](self, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rem_removingMailto");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rem_tidyFormattedNameString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_5:
      -[REMSharee address](self, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "rem_hasTel");

      if (v14)
      {
        -[REMSharee address](self, "address");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(MEMORY[0x1E0C97398]);
        objc_msgSend(v15, "rem_removingTel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithStringValue:", v17);
        objc_msgSend(v18, "formattedStringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "rem_tidyFormattedNameString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
    }
  }
  return v8;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (NSString)address
{
  return self->_address;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)accessLevel
{
  return self->_accessLevel;
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
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Unknown REMShareeAccessLevel %ld", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Unknown REMShareeStatus %ld", a5, a6, a7, a8, 0);
}

@end
