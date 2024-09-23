@implementation STUControlGroupEnrollmentRecord

+ (id)managedXPCEnrollmentRecord
{
  id v2;
  void *v3;
  CRKUser *v4;
  id v5;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMFControlGroupIdentifier crk_managedXPCGroupIdentifier](DMFControlGroupIdentifier, "crk_managedXPCGroupIdentifier"));
  v4 = objc_opt_new(CRKUser);
  LOBYTE(v8) = 1;
  LOBYTE(v7) = 0;
  v5 = objc_msgSend(v2, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:", v3, CFSTR("ManagedXPC"), CFSTR("ManagedXPC"), 0, 0, 0, &__NSDictionary0__struct, &__NSArray0__struct, v4, v7, 0, 0, v8);

  return v5;
}

+ (id)adHocXPCEnrollmentRecord
{
  id v2;
  void *v3;
  CRKUser *v4;
  id v5;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMFControlGroupIdentifier crk_adHocXPCGroupIdentifier](DMFControlGroupIdentifier, "crk_adHocXPCGroupIdentifier"));
  v4 = objc_opt_new(CRKUser);
  LOBYTE(v8) = 1;
  LOBYTE(v7) = 0;
  v5 = objc_msgSend(v2, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:", v3, CFSTR("AdHocXPC"), CFSTR("AdHocXPC"), 0, 0, 0, &__NSDictionary0__struct, &__NSArray0__struct, v4, v7, 0, 1, v8);

  return v5;
}

+ (id)asmXPCEnrollmentRecord
{
  id v2;
  void *v3;
  CRKUser *v4;
  id v5;
  uint64_t v7;
  uint64_t v8;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMFControlGroupIdentifier crk_asmXPCGroupIdentifier](DMFControlGroupIdentifier, "crk_asmXPCGroupIdentifier"));
  v4 = objc_opt_new(CRKUser);
  LOBYTE(v8) = 1;
  LOBYTE(v7) = 0;
  v5 = objc_msgSend(v2, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:", v3, CFSTR("ASMXPC"), CFSTR("ASMXPC"), 0, 0, 0, &__NSDictionary0__struct, &__NSArray0__struct, v4, v7, 0, 2, v8);

  return v5;
}

- (STUControlGroupEnrollmentRecord)initWithGroupIdentifier:(id)a3 groupName:(id)a4 groupDescription:(id)a5 groupMascotType:(unint64_t)a6 groupColorType:(unint64_t)a7 rollingCourseIdentitySet:(id)a8 instructorsByIdentifier:(id)a9 trustedAnchorCertificatePersistentIDs:(id)a10 groupUser:(id)a11 tombstoned:(BOOL)a12 requestingUnenroll:(BOOL)a13 automaticRemovalDate:(id)a14 type:(unint64_t)a15 hidden:(BOOL)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  STUControlGroupEnrollmentRecord *v26;
  id v27;
  id v28;
  STUControlGroupEnrollmentRecord *v29;
  void *v30;
  void *v31;
  id v32;
  DMFControlGroupIdentifier *v33;
  DMFControlGroupIdentifier *groupIdentifier;
  NSString *v35;
  NSString *groupName;
  NSString *v37;
  NSString *groupDescription;
  NSDictionary *v39;
  NSDictionary *instructorsByIdentifier;
  NSArray *v41;
  NSArray *trustedAnchorCertificatePersistentIDs;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  objc_super v53;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v50 = a8;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = self;
  v27 = a11;
  v28 = a14;
  if (v20)
  {
    if (v21)
      goto LABEL_3;
LABEL_8:
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("STUControlGroupEnrollmentRecord.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupName"));

    if (v25)
      goto LABEL_4;
    goto LABEL_9;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("STUControlGroupEnrollmentRecord.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier"));

  if (!v21)
    goto LABEL_8;
LABEL_3:
  if (v25)
    goto LABEL_4;
LABEL_9:
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("STUControlGroupEnrollmentRecord.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trustedAnchorCertificatePersistentIDs"));

LABEL_4:
  v53.receiver = v26;
  v53.super_class = (Class)STUControlGroupEnrollmentRecord;
  v29 = -[STUControlGroupEnrollmentRecord init](&v53, "init");
  if (v29)
  {
    v30 = v21;
    v31 = v20;
    v32 = v24;
    v33 = (DMFControlGroupIdentifier *)objc_msgSend(v31, "copy");
    groupIdentifier = v29->_groupIdentifier;
    v29->_groupIdentifier = v33;

    v35 = (NSString *)objc_msgSend(v30, "copy");
    groupName = v29->_groupName;
    v29->_groupName = v35;

    v37 = (NSString *)objc_msgSend(v22, "copy");
    groupDescription = v29->_groupDescription;
    v29->_groupDescription = v37;

    v29->_groupMascotType = a6;
    v29->_groupColorType = a7;
    v39 = (NSDictionary *)objc_msgSend(v24, "copy");
    instructorsByIdentifier = v29->_instructorsByIdentifier;
    v29->_instructorsByIdentifier = v39;

    v41 = (NSArray *)objc_msgSend(v25, "copy");
    trustedAnchorCertificatePersistentIDs = v29->_trustedAnchorCertificatePersistentIDs;
    v29->_trustedAnchorCertificatePersistentIDs = v41;

    objc_storeStrong((id *)&v29->_groupUser, a11);
    v29->_tombstoned = a12;
    v29->_requestingUnenroll = a13;
    objc_storeStrong((id *)&v29->_automaticRemovalDate, a14);
    v29->_type = a15;
    v29->_hidden = a16;
    objc_storeStrong((id *)&v29->_rollingCourseIdentitySet, v50);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupUser](v29, "groupUser"));
    objc_msgSend(v43, "setRole:", 1);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord instructorsByIdentifier](v29, "instructorsByIdentifier"));
    objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", &stru_1000CA578);

    v24 = v32;
    v20 = v31;
    v21 = v30;
  }

  return v29;
}

- (STUControlGroupEnrollmentRecord)initWithGroupIdentifier:(id)a3 groupName:(id)a4 groupDescription:(id)a5 groupMascotType:(unint64_t)a6 groupColorType:(unint64_t)a7 rollingCourseIdentitySet:(id)a8 instructorsByIdentifier:(id)a9 trustedAnchorCertificatePersistentIDs:(id)a10 groupUser:(id)a11 requestingUnenroll:(BOOL)a12 automaticRemovalDate:(id)a13 type:(unint64_t)a14 hidden:(BOOL)a15
{
  return -[STUControlGroupEnrollmentRecord initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:tombstoned:requestingUnenroll:automaticRemovalDate:type:hidden:](self, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:tombstoned:requestingUnenroll:automaticRemovalDate:type:hidden:", a3, a4, a5, a6, a7, a8);
}

- (STUControlGroupEnrollmentRecord)initWithDictionary:(id)a3 type:(unint64_t)a4 hidden:(BOOL)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  STUControlGroupEnrollmentRecord *v32;
  id v33;
  void *v34;
  STUCoursePrivateIdentity *v35;
  void *v36;
  STUCoursePrivateIdentity *v37;
  STURollingCourseIdentitySet *v38;
  STUControlGroupEnrollmentRecord *v39;
  void *v40;
  STURollingCourseIdentitySet *v41;
  uint64_t v42;
  STURollingCourseIdentitySet *v43;
  uint64_t v44;
  STURollingCourseIdentitySet *v45;
  STURollingCourseIdentitySet *v46;
  STURollingCourseIdentitySet *v47;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 v51;
  id v52;
  unsigned __int8 v53;
  id v54;
  id v55;
  void *v58;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];

  v5 = a3;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupIdentifier")));
  v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupDisplayName")));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupDescription")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupMascotType")));
  v55 = objc_msgSend(v6, "unsignedIntegerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupColorType")));
  v54 = objc_msgSend(v7, "unsignedIntegerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("InstructorsByIdentifier")));
  v9 = objc_opt_new(NSMutableDictionary);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        v16 = objc_alloc((Class)CRKUser);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15));
        v18 = objc_msgSend(v16, "initWithDictionary:", v17);

        if (v18)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v18, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v12);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AnchorCertificatePersistentIDs")));
  v20 = objc_alloc((Class)CRKUser);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("GroupUser")));
  v22 = objc_msgSend(v20, "initWithDictionary:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Tombstoned")));
  v24 = objc_msgSend(v23, "BOOLValue");

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RequestingUnenroll")));
  v26 = objc_msgSend(v25, "BOOLValue");

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutomaticRemovalDate")));
  v28 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v58, v28) & 1) != 0)
  {
    v53 = v24;
    v29 = objc_opt_class(NSString);
    v30 = (void *)v61;
    if ((objc_opt_isKindOfClass(v61, v29) & 1) != 0)
    {
      v31 = objc_opt_class(NSArray);
      v32 = self;
      if ((objc_opt_isKindOfClass(v19, v31) & 1) != 0)
      {
        v33 = objc_msgSend(objc_alloc((Class)DMFControlGroupIdentifier), "initWithString:", v58);
        if (v33)
        {
          v52 = v33;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PrivateIdentity")));

          v51 = v26;
          if (v34)
          {
            v35 = [STUCoursePrivateIdentity alloc];
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PrivateIdentity")));
            v37 = -[STUCoursePrivateIdentity initWithDictionary:groupIdentifier:](v35, "initWithDictionary:groupIdentifier:", v36, v58);

            v38 = -[STURollingCourseIdentitySet initWithCoursePrivateIdentity:]([STURollingCourseIdentitySet alloc], "initWithCoursePrivateIdentity:", v37);
          }
          else
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RollingCourseIdentitySet")));

            v41 = [STURollingCourseIdentitySet alloc];
            if (v40)
            {
              v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RollingCourseIdentitySet")));
              v43 = v41;
              v37 = (STUCoursePrivateIdentity *)v42;
              v38 = -[STURollingCourseIdentitySet initWithDictionary:](v43, "initWithDictionary:");
            }
            else
            {
              v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "userIdentifier"));
              v45 = v41;
              v37 = (STUCoursePrivateIdentity *)v44;
              v38 = -[STURollingCourseIdentitySet initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:](v45, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:", 0, 0);
            }
          }
          v46 = v38;

          v47 = v46;
          -[STURollingDeviceIdentitySet migrateFromCorruptStagedCertificateCommonNames](v46, "migrateFromCorruptStagedCertificateCommonNames");
          LOBYTE(v50) = a5;
          BYTE1(v49) = v51;
          LOBYTE(v49) = v53;
          v30 = (void *)v61;
          v32 = -[STUControlGroupEnrollmentRecord initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:tombstoned:requestingUnenroll:automaticRemovalDate:type:hidden:](self, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:tombstoned:requestingUnenroll:automaticRemovalDate:type:hidden:", v52, v61, v60, v55, v54, v47, v9, v19, v22, v49, v27, a4, v50);

          v33 = v52;
          v39 = v32;
        }
        else
        {
          v39 = 0;
        }

      }
      else
      {
        v39 = 0;
      }
    }
    else
    {
      v39 = 0;
      v32 = self;
    }
  }
  else
  {
    v39 = 0;
    v32 = self;
    v30 = (void *)v61;
  }

  return v39;
}

- (id)dictionaryValue
{
  NSMutableDictionary *v3;
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
  void *v24;
  void *v25;
  void *v26;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupIdentifier](self, "groupIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("GroupIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupName](self, "groupName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("GroupDisplayName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUControlGroupEnrollmentRecord groupMascotType](self, "groupMascotType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("GroupMascotType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUControlGroupEnrollmentRecord groupColorType](self, "groupColorType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("GroupColorType"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord instructorsByIdentifier](self, "instructorsByIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("dictionaryValue")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord instructorsByIdentifier](self, "instructorsByIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v11, v13));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, CFSTR("InstructorsByIdentifier"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord trustedAnchorCertificatePersistentIDs](self, "trustedAnchorCertificatePersistentIDs"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, CFSTR("AnchorCertificatePersistentIDs"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUControlGroupEnrollmentRecord isTombstoned](self, "isTombstoned")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, CFSTR("Tombstoned"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord rollingCourseIdentitySet](self, "rollingCourseIdentitySet"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dictionaryValue"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v18, CFSTR("RollingCourseIdentitySet"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUControlGroupEnrollmentRecord isRequestingUnenroll](self, "isRequestingUnenroll")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, CFSTR("RequestingUnenroll"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord automaticRemovalDate](self, "automaticRemovalDate"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord automaticRemovalDate](self, "automaticRemovalDate"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v21, CFSTR("AutomaticRemovalDate"));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupDescription](self, "groupDescription"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupDescription](self, "groupDescription"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v23, CFSTR("GroupDescription"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupUser](self, "groupUser"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupUser](self, "groupUser"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dictionaryValue"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v26, CFSTR("GroupUser"));

  }
  return v3;
}

- (id)description
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
  uint64_t v14;
  void *v15;

  v14 = objc_opt_class(self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupIdentifier](self, "groupIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupName](self, "groupName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupUser](self, "groupUser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUControlGroupEnrollmentRecord type](self, "type")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUControlGroupEnrollmentRecord isHidden](self, "isHidden")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUControlGroupEnrollmentRecord isTombstoned](self, "isTombstoned")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUControlGroupEnrollmentRecord isRequestingUnenroll](self, "isRequestingUnenroll")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord automaticRemovalDate](self, "automaticRemovalDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, name = %@, user = %@, type = %@, hidden = %@, tombstoned = %@, requestingUnenroll = %@, automaticRemovalDate = %@ }>"), v14, self, v3, v4, v6, v7, v8, v9, v10, v11));

  return v12;
}

- (BOOL)shouldRemoveRecordToday:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startOfDayForDate:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord automaticRemovalDate](self, "automaticRemovalDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v6, v7, 0));

  v9 = (uint64_t)objc_msgSend(v8, "day") < 1;
  return v9;
}

- (BOOL)isModifiable
{
  return (id)-[STUControlGroupEnrollmentRecord type](self, "type") == (id)1;
}

- (BOOL)isManaged
{
  return -[STUControlGroupEnrollmentRecord type](self, "type") == 0;
}

- (BOOL)isAdHoc
{
  return (id)-[STUControlGroupEnrollmentRecord type](self, "type") == (id)1;
}

- (BOOL)isASM
{
  return (id)-[STUControlGroupEnrollmentRecord type](self, "type") == (id)2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord dictionaryValue](self, "dictionaryValue"));
  v6 = objc_msgSend(v4, "initWithDictionary:type:hidden:", v5, -[STUControlGroupEnrollmentRecord type](self, "type"), -[STUControlGroupEnrollmentRecord isHidden](self, "isHidden"));

  return v6;
}

- (unint64_t)groupMascotType
{
  if (-[STUControlGroupEnrollmentRecord type](self, "type"))
    return self->_groupMascotType;
  else
    return 5;
}

- (BOOL)studentCredentialsAreValid
{
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[STUControlGroupEnrollmentRecord isASM](self, "isASM"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("ExpireStudentCredentials"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keychain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord rollingCourseIdentitySet](self, "rollingCourseIdentitySet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeIdentityPersistentID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identityWithPersistentID:", v9));

  if ((v5 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "certificate"));
    v3 = objc_msgSend(v11, "isTemporallyValid");

  }
  return v3;
}

- (id)validTrustedAnchorPersistentIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("NumberExpiredInstructorCertificates")));

  v5 = (uint64_t)objc_msgSend(v4, "integerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord trustedAnchorCertificatePersistentIDs](self, "trustedAnchorCertificatePersistentIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1000CA5B8));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v8));

  if (v5 >= 1)
  {
    v10 = v5 + 1;
    do
    {
      if (!objc_msgSend(v9, "count"))
        break;
      objc_msgSend(v9, "removeLastObject");
      --v10;
    }
    while (v10 > 1);
  }

  return v9;
}

- (NSSet)instructors
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord instructorsByIdentifier](self, "instructorsByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return (NSSet *)v4;
}

- (CRKCourse)crkCourse
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc((Class)CRKCourse);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupIdentifier](self, "groupIdentifier"));
  v5 = objc_msgSend(v3, "initWithIdentifier:type:", v4, -[STUControlGroupEnrollmentRecord crkCourseType](self, "crkCourseType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupName](self, "groupName"));
  objc_msgSend(v5, "setCourseName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupDescription](self, "groupDescription"));
  objc_msgSend(v5, "setCourseDescription:", v7);

  objc_msgSend(v5, "setCourseMascotType:", -[STUControlGroupEnrollmentRecord groupMascotType](self, "groupMascotType"));
  objc_msgSend(v5, "setCourseColorType:", -[STUControlGroupEnrollmentRecord groupColorType](self, "groupColorType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupUser](self, "groupUser"));
  objc_msgSend(v5, "setCourseUser:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord instructorsByIdentifier](self, "instructorsByIdentifier"));
  objc_msgSend(v5, "setInstructorsByIdentifier:", v9);

  objc_msgSend(v5, "setRequestingUnenroll:", -[STUControlGroupEnrollmentRecord isRequestingUnenroll](self, "isRequestingUnenroll"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord automaticRemovalDate](self, "automaticRemovalDate"));
  objc_msgSend(v5, "setAutomaticRemovalDate:", v10);

  objc_msgSend(v5, "setStudentCredentialsAreValid:", -[STUControlGroupEnrollmentRecord studentCredentialsAreValid](self, "studentCredentialsAreValid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord trustedAnchorCertificatePersistentIDs](self, "trustedAnchorCertificatePersistentIDs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
  objc_msgSend(v5, "setTrustedCertificatePersistentIds:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord validTrustedAnchorPersistentIDs](self, "validTrustedAnchorPersistentIDs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
  objc_msgSend(v5, "setValidTrustedCertificatePersistentIds:", v14);

  return (CRKCourse *)v5;
}

- (unint64_t)crkCourseType
{
  unint64_t v2;
  unint64_t v3;

  v2 = -[STUControlGroupEnrollmentRecord type](self, "type");
  v3 = 1;
  if (v2 == 2)
    v3 = 2;
  if (v2)
    return v3;
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupIdentifier](self, "groupIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupName](self, "groupName"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[STUControlGroupEnrollmentRecord type](self, "type")));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STUControlGroupEnrollmentRecord *v8;
  STUControlGroupEnrollmentRecord *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  STUControlGroupEnrollmentRecord *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("groupIdentifier, groupName, groupDescription, groupMascotType, groupColorType, groupUser, instructorsByIdentifier, trustedAnchorCertificatePersistentIDs, managed, requestingUnenroll, hidden, tombstoned, automaticRemovalDate, requestingUnenroll"), "componentsSeparatedByString:", CFSTR(",")));
  v6 = objc_msgSend(v5, "mutableCopy");

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002A0FC;
  v28[3] = &unk_1000C9E08;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (STUControlGroupEnrollmentRecord *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[STUControlGroupEnrollmentRecord isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class(v8)))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v17 = v9;
          v18 = objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord valueForKey:](v8, "valueForKey:", v16));
          v19 = objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord valueForKey:](v17, "valueForKey:", v16));

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)groupDescription
{
  return self->_groupDescription;
}

- (void)setGroupDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setGroupMascotType:(unint64_t)a3
{
  self->_groupMascotType = a3;
}

- (unint64_t)groupColorType
{
  return self->_groupColorType;
}

- (void)setGroupColorType:(unint64_t)a3
{
  self->_groupColorType = a3;
}

- (CRKUser)groupUser
{
  return self->_groupUser;
}

- (void)setGroupUser:(id)a3
{
  objc_storeStrong((id *)&self->_groupUser, a3);
}

- (NSDictionary)instructorsByIdentifier
{
  return self->_instructorsByIdentifier;
}

- (void)setInstructorsByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)trustedAnchorCertificatePersistentIDs
{
  return self->_trustedAnchorCertificatePersistentIDs;
}

- (void)setTrustedAnchorCertificatePersistentIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)isTombstoned
{
  return self->_tombstoned;
}

- (void)setTombstoned:(BOOL)a3
{
  self->_tombstoned = a3;
}

- (BOOL)isRequestingUnenroll
{
  return self->_requestingUnenroll;
}

- (void)setRequestingUnenroll:(BOOL)a3
{
  self->_requestingUnenroll = a3;
}

- (NSDate)automaticRemovalDate
{
  return self->_automaticRemovalDate;
}

- (void)setAutomaticRemovalDate:(id)a3
{
  objc_storeStrong((id *)&self->_automaticRemovalDate, a3);
}

- (STURollingCourseIdentitySet)rollingCourseIdentitySet
{
  return self->_rollingCourseIdentitySet;
}

- (void)setRollingCourseIdentitySet:(id)a3
{
  objc_storeStrong((id *)&self->_rollingCourseIdentitySet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollingCourseIdentitySet, 0);
  objc_storeStrong((id *)&self->_automaticRemovalDate, 0);
  objc_storeStrong((id *)&self->_trustedAnchorCertificatePersistentIDs, 0);
  objc_storeStrong((id *)&self->_instructorsByIdentifier, 0);
  objc_storeStrong((id *)&self->_groupUser, 0);
  objc_storeStrong((id *)&self->_groupDescription, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
