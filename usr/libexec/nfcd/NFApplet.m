@implementation NFApplet

- (void)_initManagedBySP
{
  self->_managedBySP = 0;
}

- (id)description
{
  void *v2;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  int activationState;
  const __CFString *v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  id v14;
  id v15;
  const __CFString *v16;
  const __CFString *v17;
  id v18;
  id v19;
  uint64_t groupActivationStyle;
  NSData *discretionaryData;
  __CFString *v22;
  NSUInteger v23;
  id v24;
  __CFString *v25;
  NSUInteger v26;
  __CFString *v27;
  const __CFString *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  NSData *moduleIdentifierAsData;
  NSData *packageIdentifierAsData;
  NSUInteger v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t appletGPState;
  uint64_t family;
  NSUInteger v47;
  id v48;
  const __CFString *v49;
  NSData *groupHeadIDAsData;
  void *v51;
  void *v52;
  const __CFString *v53;
  const __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  objc_super v60;

  if ((self->_family - 1) > 7u)
    v4 = CFSTR("UNKNOWN");
  else
    v4 = *(&off_1002E55E8 + (char)(self->_family - 1));
  v54 = v4;
  v5 = -[NFApplet lifecycleState](self, "lifecycleState");
  v6 = CFSTR("UNKNOWN");
  if (v5 <= 14)
  {
    switch(v5)
    {
      case 1:
        v6 = CFSTR("loaded");
        break;
      case 3:
        v6 = CFSTR("installed");
        break;
      case 7:
        v6 = CFSTR("selectable");
        break;
    }
  }
  else if (v5 > 128)
  {
    if (v5 == 129)
    {
      v6 = CFSTR("terminated");
    }
    else if (v5 == 130)
    {
      v6 = CFSTR("frozen");
    }
  }
  else if (v5 == 15)
  {
    v6 = CFSTR("personalized");
  }
  else if (v5 == 23)
  {
    v6 = CFSTR("pre-personalized");
  }
  v53 = v6;
  activationState = self->_activationState;
  if (activationState == 128)
  {
    v8 = CFSTR("non-activatable");
  }
  else if (activationState == 1)
  {
    v8 = CFSTR("activated");
  }
  else if (self->_activationState)
  {
    v8 = CFSTR("UNKNOWN");
  }
  else
  {
    v8 = CFSTR("deactivated");
  }
  v49 = v8;
  v48 = objc_alloc((Class)NSString);
  v60.receiver = self;
  v60.super_class = (Class)NFApplet;
  v9 = -[NFApplet description](&v60, "description");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_identifierAsData, "NF_asHexString"));
  family = self->_family;
  appletGPState = self->_appletGPState;
  if (-[NFApplet isGPLocked](self, "isGPLocked"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v43 = self->_activationState;
  v44 = v10;
  if (self->_authTransientSupport)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_authTransientConfigurable)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v41 = v12;
  v42 = v11;
  groupHeadIDAsData = self->_groupHeadIDAsData;
  if (groupHeadIDAsData)
  {
    v13 = objc_alloc((Class)NSString);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_groupHeadIDAsData, "NF_asHexString"));
    v59 = (__CFString *)objc_msgSend(v13, "initWithFormat:", CFSTR("groupHead=%@ "), v35);
  }
  else
  {
    v59 = &stru_1002ED8A8;
  }
  v47 = -[NSArray count](self->_groupMemberIDs, "count");
  if (v47)
  {
    v14 = objc_alloc((Class)NSString);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](self->_groupMemberIDs, "componentsJoinedByString:", CFSTR(", ")));
    v58 = (__CFString *)objc_msgSend(v14, "initWithFormat:", CFSTR("groupMembers={%@} "), v34);
  }
  else
  {
    v58 = &stru_1002ED8A8;
  }
  v40 = -[NSArray count](self->_referencedAppIDs, "count");
  if (v40)
  {
    v15 = objc_alloc((Class)NSString);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](self->_referencedAppIDs, "componentsJoinedByString:", CFSTR(", ")));
    v57 = (__CFString *)objc_msgSend(v15, "initWithFormat:", CFSTR("referencedApps={%@} "), v33);
  }
  else
  {
    v57 = &stru_1002ED8A8;
  }
  if (self->_isContainer)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (self->_isProxy)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v36 = v17;
  v37 = v16;
  packageIdentifierAsData = self->_packageIdentifierAsData;
  if (packageIdentifierAsData)
  {
    v18 = objc_alloc((Class)NSString);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_packageIdentifierAsData, "NF_asHexString"));
    v56 = (__CFString *)objc_msgSend(v18, "initWithFormat:", CFSTR("packageIdentifier=%@ "), v32);
  }
  else
  {
    v56 = &stru_1002ED8A8;
  }
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  if (moduleIdentifierAsData)
  {
    v19 = objc_alloc((Class)NSString);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_moduleIdentifierAsData, "NF_asHexString"));
    v55 = (__CFString *)objc_msgSend(v19, "initWithFormat:", CFSTR("moduleIdentifier=%@ "), v31);
  }
  else
  {
    v55 = &stru_1002ED8A8;
  }
  groupActivationStyle = self->_groupActivationStyle;
  discretionaryData = self->_discretionaryData;
  if (discretionaryData)
    v22 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("discretionaryData=%@ "), self->_discretionaryData);
  else
    v22 = &stru_1002ED8A8;
  v23 = -[NSArray count](self->_multiSEApplicationGroupMemberIDs, "count");
  if (v23)
  {
    v24 = objc_alloc((Class)NSString);
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](self->_multiSEApplicationGroupMemberIDs, "componentsJoinedByString:", CFSTR(", ")));
    v25 = (__CFString *)objc_msgSend(v24, "initWithFormat:", CFSTR("multiSsdMembers={%@} "), v2);
  }
  else
  {
    v25 = &stru_1002ED8A8;
  }
  v26 = -[NSData length](self->_typeFSystemCode, "length");
  if (v26)
    v27 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("systemCode=%@ "), self->_typeFSystemCode);
  else
    v27 = &stru_1002ED8A8;
  if (self->_managedBySP)
    v28 = CFSTR("managedBySP=Y");
  else
    v28 = &stru_1002ED8A8;
  v29 = objc_msgSend(v48, "initWithFormat:", CFSTR("%@ { identifier=%@ family=0x%x(%@) lifecycle=0x%x(%@) locked=%@ activation=0x%x(%@) authTransient=%@ authTransientConfigurable=%@ %@%@%@isContainer=%@ isProxy=%@ %@%@activationStyle=%d %@ %@%@seOS=%lu%@instanceACL=%@}"), v52, v51, family, v54, appletGPState, v53, v44, v43, v49, v42, v41, v59, v58, v57, v37, v36,
          v56,
          v55,
          groupActivationStyle,
          v22,
          v25,
          v27,
          self->_seOS,
          v28,
          self->_instanceACL);
  if (v26)

  if (v23)
  {

  }
  if (discretionaryData)

  if (moduleIdentifierAsData)
  {

  }
  if (packageIdentifierAsData)
  {

  }
  if (v40)
  {

  }
  if (v47)
  {

  }
  if (groupHeadIDAsData)
  {

  }
  return v29;
}

- (id)asDictionary
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  int activationState;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSData *groupHeadIDAsData;
  void *v20;
  NSArray *groupMemberIDs;
  NSArray *referencedAppIDs;
  NSData *packageIdentifierAsData;
  void *v24;
  NSData *moduleIdentifierAsData;
  void *v26;
  NSData *discretionaryData;
  NSArray *multiSEApplicationGroupMemberIDs;
  NSData *typeFSystemCode;
  NSData *instanceACL;
  void *v32;
  NSString *seIdentifier;
  void *v34;
  id v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;

  if ((self->_family - 1) > 7u)
    v3 = CFSTR("UNKNOWN");
  else
    v3 = *(&off_1002E55E8 + (char)(self->_family - 1));
  v38 = v3;
  v4 = -[NFApplet lifecycleState](self, "lifecycleState");
  v5 = CFSTR("UNKNOWN");
  if (v4 <= 14)
  {
    switch(v4)
    {
      case 1:
        v5 = CFSTR("loaded");
        break;
      case 3:
        v5 = CFSTR("installed");
        break;
      case 7:
        v5 = CFSTR("selectable");
        break;
    }
  }
  else if (v4 > 128)
  {
    if (v4 == 129)
    {
      v5 = CFSTR("terminated");
    }
    else if (v4 == 130)
    {
      v5 = CFSTR("frozen");
    }
  }
  else if (v4 == 15)
  {
    v5 = CFSTR("personalized");
  }
  else if (v4 == 23)
  {
    v5 = CFSTR("pre-personalized");
  }
  v37 = v5;
  activationState = self->_activationState;
  if (activationState == 128)
  {
    v7 = CFSTR("non-activatable");
  }
  else if (activationState == 1)
  {
    v7 = CFSTR("activated");
  }
  else if (self->_activationState)
  {
    v7 = CFSTR("UNKNOWN");
  }
  else
  {
    v7 = CFSTR("deactivated");
  }
  v36 = v7;
  v35 = objc_alloc((Class)NSMutableDictionary);
  v8 = objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_identifierAsData, "NF_asHexString"));
  seIdentifier = self->_seIdentifier;
  v34 = (void *)v8;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_family));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_appletGPState));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_activationState));
  if (self->_authTransientSupport)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_authTransientConfigurable)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_isContainer)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_isProxy)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", self->_groupActivationStyle));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_seOS));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_managedBySP));
  v18 = objc_msgSend(v35, "initWithObjectsAndKeys:", v34, CFSTR("identifier"), seIdentifier, CFSTR("seid"), v32, CFSTR("family"), v38, CFSTR("familyStr"), v9, CFSTR("lifecycleState"), v37, CFSTR("lifecycleStr"), v10, CFSTR("activationState"), v36, CFSTR("activationStr"), v11,
          CFSTR("authTransientSupport"),
          v12,
          CFSTR("authTransientConfigurable"),
          v13,
          CFSTR("containerInstance"),
          v14,
          CFSTR("proxyInstance"),
          v15,
          CFSTR("groupActivationStyle"),
          v16,
          CFSTR("seOS"),
          v17,
          CFSTR("managedBySP"),
          0);

  groupHeadIDAsData = self->_groupHeadIDAsData;
  if (groupHeadIDAsData)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](groupHeadIDAsData, "NF_asHexString"));
    objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("groupHead"));

  }
  groupMemberIDs = self->_groupMemberIDs;
  if (groupMemberIDs)
    objc_msgSend(v18, "setObject:forKey:", groupMemberIDs, CFSTR("groupMembers"));
  referencedAppIDs = self->_referencedAppIDs;
  if (referencedAppIDs)
    objc_msgSend(v18, "setObject:forKey:", referencedAppIDs, CFSTR("referencedApps"));
  packageIdentifierAsData = self->_packageIdentifierAsData;
  if (packageIdentifierAsData)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](packageIdentifierAsData, "NF_asHexString"));
    objc_msgSend(v18, "setObject:forKey:", v24, CFSTR("packageIdentifier"));

  }
  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  if (moduleIdentifierAsData)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](moduleIdentifierAsData, "NF_asHexString"));
    objc_msgSend(v18, "setObject:forKey:", v26, CFSTR("moduleIdentifier"));

  }
  discretionaryData = self->_discretionaryData;
  if (discretionaryData)
    objc_msgSend(v18, "setObject:forKey:", discretionaryData, CFSTR("discretionary"));
  multiSEApplicationGroupMemberIDs = self->_multiSEApplicationGroupMemberIDs;
  if (multiSEApplicationGroupMemberIDs)
    objc_msgSend(v18, "setObject:forKey:", multiSEApplicationGroupMemberIDs, CFSTR("multiSEApplicationGroup"));
  typeFSystemCode = self->_typeFSystemCode;
  if (typeFSystemCode)
    objc_msgSend(v18, "setObject:forKey:", typeFSystemCode, CFSTR("typeFSystemCode"));
  instanceACL = self->_instanceACL;
  if (instanceACL)
    objc_msgSend(v18, "setObject:forKey:", instanceACL, CFSTR("instanceACL"));
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  NFApplet *v4;
  NFApplet *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (NFApplet *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = -[NFApplet isEqualToApplet:](self, "isEqualToApplet:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToApplet:(id)a3
{
  NFApplet *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = (NFApplet *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifierAsData](self, "identifierAsData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifierAsData](v4, "identifierAsData"));
    if (objc_msgSend(v5, "isEqualToData:", v6))
    {
      v7 = -[NFApplet seOS](self, "seOS");
      v8 = v7 == (id)-[NFApplet seOS](v4, "seOS");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)isTypeF
{
  return -[NSData length](self->_typeFSystemCode, "length") != 0;
}

- (BOOL)suppressTypeB
{
  NSData *moduleIdentifierAsData;
  id v4;
  unsigned __int8 v5;
  NSData *v6;
  id v7;

  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_1002698B8, 16);
  if (-[NSData isEqualToData:](moduleIdentifierAsData, "isEqualToData:", v4))
  {
    v5 = 1;
  }
  else
  {
    v6 = self->_moduleIdentifierAsData;
    v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_1002698C8, 10);
    v5 = -[NSData isEqualToData:](v6, "isEqualToData:", v7);

  }
  return v5;
}

- (BOOL)suppressTypeA
{
  NSData *moduleIdentifierAsData;
  id v3;

  moduleIdentifierAsData = self->_moduleIdentifierAsData;
  v3 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_1002698D2, 10);
  LOBYTE(moduleIdentifierAsData) = -[NSData isEqualToData:](moduleIdentifierAsData, "isEqualToData:", v3);

  return (char)moduleIdentifierAsData;
}

- (unsigned)supportedTypeFSystem
{
  if ((id)-[NSData length](self->_typeFSystemCode, "length") != (id)2)
    return 0;
  if (*(_WORD *)-[NSData bytes](self->_typeFSystemCode, "bytes") == 768)
    return 1;
  if (*(_WORD *)-[NSData bytes](self->_typeFSystemCode, "bytes") != 2176)
    return 0;
  return 2;
}

- (void)setInstanceACL:(id)a3
{
  objc_storeStrong((id *)&self->_instanceACL, a3);
}

- (NFApplet)initWithCoder:(id)a3
{
  id v4;
  NFApplet *v5;
  id v6;
  uint64_t v7;
  NSString *seIdentifier;
  id v9;
  uint64_t v10;
  NSData *identifierAsData;
  id v12;
  uint64_t v13;
  NSData *discretionaryData;
  id v15;
  uint64_t v16;
  NSData *groupHeadIDAsData;
  id v18;
  uint64_t v19;
  NSArray *groupMemberIDs;
  id v21;
  uint64_t v22;
  NSArray *referencedAppIDs;
  id v24;
  uint64_t v25;
  NSData *packageIdentifierAsData;
  id v27;
  uint64_t v28;
  NSData *moduleIdentifierAsData;
  id v30;
  uint64_t v31;
  NSArray *multiSEApplicationGroupMemberIDs;
  id v33;
  uint64_t v34;
  NSData *typeFSystemCode;
  id v36;
  uint64_t v37;
  NSData *instanceACL;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NFApplet;
  v5 = -[NFApplet init](&v40, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("seid"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    seIdentifier = v5->_seIdentifier;
    v5->_seIdentifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("identifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    identifierAsData = v5->_identifierAsData;
    v5->_identifierAsData = (NSData *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("discretionary"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    discretionaryData = v5->_discretionaryData;
    v5->_discretionaryData = (NSData *)v13;

    v5->_family = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("family"));
    v5->_appletGPState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lifecycleState"));
    v5->_activationState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("activationState"));
    v5->_authTransientSupport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authTransientSupport"));
    v5->_authTransientConfigurable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authTransientConfigurable"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("groupHead"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    groupHeadIDAsData = v5->_groupHeadIDAsData;
    v5->_groupHeadIDAsData = (NSData *)v16;

    v18 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(NSString), CFSTR("groupMembers"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = (NSArray *)v19;

    v21 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(NSString), CFSTR("referencedApps"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    referencedAppIDs = v5->_referencedAppIDs;
    v5->_referencedAppIDs = (NSArray *)v22;

    v5->_isContainer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("containerInstance"));
    v5->_isProxy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxyInstance"));
    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("packageIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    packageIdentifierAsData = v5->_packageIdentifierAsData;
    v5->_packageIdentifierAsData = (NSData *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("moduleIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    moduleIdentifierAsData = v5->_moduleIdentifierAsData;
    v5->_moduleIdentifierAsData = (NSData *)v28;

    v5->_groupActivationStyle = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("groupActivationStyle"));
    v30 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(NSString), CFSTR("multiSEApplicationGroup"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = (NSArray *)v31;

    v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("typeFSystemCode"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = (NSData *)v34;

    v5->_seOS = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seOS"));
    v36 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("instanceACL"));
    v37 = objc_claimAutoreleasedReturnValue(v36);
    instanceACL = v5->_instanceACL;
    v5->_instanceACL = (NSData *)v37;

    -[NFApplet _initManagedBySP](v5, "_initManagedBySP");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *seIdentifier;
  id v5;

  seIdentifier = self->_seIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", seIdentifier, CFSTR("seid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifierAsData, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_discretionaryData, CFSTR("discretionary"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_family, CFSTR("family"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_appletGPState, CFSTR("lifecycleState"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_activationState, CFSTR("activationState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_authTransientSupport, CFSTR("authTransientSupport"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_authTransientConfigurable, CFSTR("authTransientConfigurable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupHeadIDAsData, CFSTR("groupHead"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupMemberIDs, CFSTR("groupMembers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_referencedAppIDs, CFSTR("referencedApps"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContainer, CFSTR("containerInstance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isProxy, CFSTR("proxyInstance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_packageIdentifierAsData, CFSTR("packageIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_moduleIdentifierAsData, CFSTR("moduleIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_groupActivationStyle, CFSTR("groupActivationStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_multiSEApplicationGroupMemberIDs, CFSTR("multiSEApplicationGroup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typeFSystemCode, CFSTR("typeFSystemCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_seOS, CFSTR("seOS"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_instanceACL, CFSTR("instanceACL"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;

  v5 = objc_alloc_init((Class)objc_opt_class(self));
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_seIdentifier, "copyWithZone:", a3);
    v7 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v6;

    v8 = -[NSData copyWithZone:](self->_identifierAsData, "copyWithZone:", a3);
    v9 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v8;

    v10 = -[NSData copyWithZone:](self->_discretionaryData, "copyWithZone:", a3);
    v11 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v10;

    *((_BYTE *)v5 + 76) = self->_family;
    *((_BYTE *)v5 + 75) = self->_appletGPState;
    *((_BYTE *)v5 + 77) = self->_activationState;
    *((_BYTE *)v5 + 78) = self->_authTransientSupport;
    *((_BYTE *)v5 + 79) = self->_authTransientConfigurable;
    v12 = -[NSData copyWithZone:](self->_groupHeadIDAsData, "copyWithZone:", a3);
    v13 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v12;

    v14 = -[NSArray copyWithZone:](self->_groupMemberIDs, "copyWithZone:", a3);
    v15 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v14;

    v16 = -[NSArray copyWithZone:](self->_referencedAppIDs, "copyWithZone:", a3);
    v17 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v16;

    *((_BYTE *)v5 + 73) = self->_isContainer;
    *((_BYTE *)v5 + 74) = self->_isProxy;
    v18 = -[NSData copyWithZone:](self->_packageIdentifierAsData, "copyWithZone:", a3);
    v19 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v18;

    v20 = -[NSData copyWithZone:](self->_moduleIdentifierAsData, "copyWithZone:", a3);
    v21 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v20;

    *((_BYTE *)v5 + 72) = self->_groupActivationStyle;
    v22 = -[NSArray copyWithZone:](self->_multiSEApplicationGroupMemberIDs, "copyWithZone:", a3);
    v23 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v22;

    v24 = -[NSData copyWithZone:](self->_typeFSystemCode, "copyWithZone:", a3);
    v25 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v24;

    *((_BYTE *)v5 + 80) = self->_managedBySP;
    objc_storeStrong((id *)v5 + 15, self->_instanceACL);
  }
  return v5;
}

- (NSArray)groupMemberIDs
{
  return self->_groupMemberIDs;
}

- (NSArray)multiSEGroupMemberIDs
{
  return self->_multiSEApplicationGroupMemberIDs;
}

- (NSString)groupHeadID
{
  return (NSString *)-[NSData NF_asHexString](self->_groupHeadIDAsData, "NF_asHexString");
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isProxy
{
  return self->_isProxy;
}

- (NSString)identifier
{
  return (NSString *)-[NSData NF_asHexString](self->_identifierAsData, "NF_asHexString");
}

- (NSString)packageIdentifier
{
  return (NSString *)-[NSData NF_asHexString](self->_packageIdentifierAsData, "NF_asHexString");
}

- (NSString)moduleIdentifier
{
  return (NSString *)-[NSData NF_asHexString](self->_moduleIdentifierAsData, "NF_asHexString");
}

- (unsigned)groupActivationStyle
{
  return self->_groupActivationStyle;
}

- (NFAppletCollection)appletCollection
{
  return (NFAppletCollection *)objc_loadWeakRetained((id *)&self->_appletCollection);
}

- (void)setAppletCollection:(id)a3
{
  objc_storeWeak((id *)&self->_appletCollection, a3);
}

- (NFApplet)groupHead
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v10;

  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 446, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_groupHeadIDAsData)
  {
    v6 = objc_loadWeakRetained((id *)p_appletCollection);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](self->_groupHeadIDAsData, "NF_asHexString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appletWithIdentifier:", v7));

  }
  else
  {
    v8 = 0;
  }
  return (NFApplet *)v8;
}

- (NSArray)groupMembers
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  void *v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v27;
  const char *ClassName;
  const char *Name;
  NSArray *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];

  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_groupMemberIDs)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_groupMemberIDs, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = self->_groupMemberIDs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v11 = objc_loadWeakRetained((id *)p_appletCollection);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appletWithIdentifier:", v10));

          if (v10)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v15 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v18 = 45;
              if (isMetaClass)
                v18 = 43;
              v15(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v18, ClassName, Name, 461, 0);
            }
            v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v20 = NFSharedLogGetLogger(v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = object_getClass(self);
              if (class_isMetaClass(v22))
                v23 = 43;
              else
                v23 = 45;
              v24 = object_getClassName(self);
              v25 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v37 = v23;
              v38 = 2082;
              v39 = v24;
              v40 = 2082;
              v41 = v25;
              v42 = 1024;
              v43 = 461;
              v44 = 2114;
              v45 = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)referencedApps
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  void *v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v27;
  const char *ClassName;
  const char *Name;
  NSArray *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];

  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_referencedAppIDs)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_referencedAppIDs, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = self->_referencedAppIDs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v11 = objc_loadWeakRetained((id *)p_appletCollection);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appletWithIdentifier:", v10));

          if (v10)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v15 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v18 = 45;
              if (isMetaClass)
                v18 = 43;
              v15(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v18, ClassName, Name, 480, 0);
            }
            v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v20 = NFSharedLogGetLogger(v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = object_getClass(self);
              if (class_isMetaClass(v22))
                v23 = 43;
              else
                v23 = 45;
              v24 = object_getClassName(self);
              v25 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v37 = v23;
              v38 = 2082;
              v39 = v24;
              v40 = 2082;
              v41 = v25;
              v42 = 1024;
              v43 = 480;
              v44 = 2114;
              v45 = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (id)multiSSDMembers
{
  NFAppletCollection **p_appletCollection;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  void *v12;
  void *specific;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  void *v27;
  const char *ClassName;
  const char *Name;
  NSArray *obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];

  p_appletCollection = &self->_appletCollection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appletCollection);

  if (!WeakRetained)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NFApplet.m"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_appletCollection!=nil"));

  }
  if (self->_multiSEApplicationGroupMemberIDs)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_multiSEApplicationGroupMemberIDs, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = self->_multiSEApplicationGroupMemberIDs;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v11 = objc_loadWeakRetained((id *)p_appletCollection);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appletWithIdentifier:", v10));

          if (v10)
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            Logger = NFLogGetLogger(specific);
            if (Logger)
            {
              v15 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              v18 = 45;
              if (isMetaClass)
                v18 = 43;
              v15(5, "%c[%{public}s %{public}s]:%i No applet for %{public}@", v18, ClassName, Name, 499, 0);
            }
            v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v20 = NFSharedLogGetLogger(v19);
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = object_getClass(self);
              if (class_isMetaClass(v22))
                v23 = 43;
              else
                v23 = 45;
              v24 = object_getClassName(self);
              v25 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v37 = v23;
              v38 = 2082;
              v39 = v24;
              v40 = 2082;
              v41 = v25;
              v42 = 1024;
              v43 = 499;
              v44 = 2114;
              v45 = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i No applet for %{public}@", buf, 0x2Cu);
            }

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isGPLocked
{
  int appletGPState;

  appletGPState = (char)self->_appletGPState;
  return appletGPState < 0 && (appletGPState + 125) < 0xFEu;
}

- (BOOL)containsSubKeys
{
  void *v3;
  id v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifierAsData](self, "identifierAsData"));
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_1002698DC, 13);
  if ((objc_msgSend(v3, "isEqualToData:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifierAsData](self, "identifierAsData"));
    v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_1002698E9, 12);
    if ((objc_msgSend(v6, "isEqualToData:", v7) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifierAsData](self, "identifierAsData"));
      v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_1002698F5, 12);
      if ((objc_msgSend(v8, "isEqualToData:", v9) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFApplet identifierAsData](self, "identifierAsData"));
        v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &unk_100269901, 9);
        v5 = objc_msgSend(v10, "isEqualToData:", v11);

      }
    }

  }
  return v5;
}

- (unsigned)lifecycleState
{
  int appletGPState;
  unsigned int v3;
  unint64_t v4;

  appletGPState = self->_appletGPState;
  if (appletGPState != 129 && appletGPState != 130)
  {
    HIDWORD(v4) = (appletGPState & 0x7F) - 1;
    LODWORD(v4) = HIDWORD(v4);
    v3 = v4 >> 1;
    if (v3 > 0xB)
      LOBYTE(appletGPState) = 0;
    else
      LOBYTE(appletGPState) = byte_100269918[v3];
  }
  return appletGPState;
}

- (unint64_t)rawGPState
{
  return self->_appletGPState;
}

- (NSString)seIdentifier
{
  return self->_seIdentifier;
}

- (NSData)identifierAsData
{
  return self->_identifierAsData;
}

- (NSData)discretionaryData
{
  return self->_discretionaryData;
}

- (unsigned)family
{
  return self->_family;
}

- (unsigned)activationState
{
  return self->_activationState;
}

- (int64_t)seOS
{
  return self->_seOS;
}

- (BOOL)authTransientSupport
{
  return self->_authTransientSupport;
}

- (BOOL)authTransientConfigurable
{
  return self->_authTransientConfigurable;
}

- (BOOL)managedBySP
{
  return self->_managedBySP;
}

- (NSData)instanceACL
{
  return self->_instanceACL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceACL, 0);
  objc_storeStrong((id *)&self->_discretionaryData, 0);
  objc_storeStrong((id *)&self->_identifierAsData, 0);
  objc_storeStrong((id *)&self->_seIdentifier, 0);
  objc_storeStrong((id *)&self->_typeFSystemCode, 0);
  objc_storeStrong((id *)&self->_multiSEApplicationGroupMemberIDs, 0);
  objc_storeStrong((id *)&self->_moduleIdentifierAsData, 0);
  objc_storeStrong((id *)&self->_packageIdentifierAsData, 0);
  objc_storeStrong((id *)&self->_referencedAppIDs, 0);
  objc_storeStrong((id *)&self->_groupMemberIDs, 0);
  objc_storeStrong((id *)&self->_groupHeadIDAsData, 0);
  objc_destroyWeak((id *)&self->_appletCollection);
}

- (NFApplet)initWithDictionary:(id)a3
{
  id v4;
  NFApplet *v5;
  void *v6;
  uint64_t v7;
  NSData *v8;
  uint64_t v9;
  NSData *identifierAsData;
  uint64_t v11;
  NSString *seIdentifier;
  uint64_t v13;
  NSData *discretionaryData;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSData *v22;
  uint64_t v23;
  NSData *groupHeadIDAsData;
  void *v25;
  NSArray *v26;
  NSArray *groupMemberIDs;
  void *v28;
  NSArray *v29;
  NSArray *referencedAppIDs;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSData *v35;
  uint64_t v36;
  NSData *packageIdentifierAsData;
  void *v38;
  uint64_t v39;
  NSData *v40;
  uint64_t v41;
  NSData *moduleIdentifierAsData;
  void *v43;
  void *v44;
  NSArray *v45;
  NSArray *multiSEApplicationGroupMemberIDs;
  void *v47;
  NSData *v48;
  NSData *typeFSystemCode;
  void *v50;
  uint64_t v51;
  NSData *instanceACL;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)NFApplet;
  v5 = -[NFApplet init](&v54, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("identifier")));
    if (!v6)
      goto LABEL_8;
    v7 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v6));
    }
    else
    {
      v9 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
        goto LABEL_8;
      v8 = (NSData *)objc_msgSend(v6, "copy");
    }
    identifierAsData = v5->_identifierAsData;
    v5->_identifierAsData = v8;

LABEL_8:
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seid")));
    seIdentifier = v5->_seIdentifier;
    v5->_seIdentifier = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discretionary")));
    discretionaryData = v5->_discretionaryData;
    v5->_discretionaryData = (NSData *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("family")));
    v5->_family = objc_msgSend(v15, "intValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lifecycleState")));
    v5->_appletGPState = objc_msgSend(v16, "unsignedCharValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activationState")));
    v5->_activationState = objc_msgSend(v17, "intValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authTransientSupport")));
    v5->_authTransientSupport = objc_msgSend(v18, "BOOLValue");

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authTransientConfigurable")));
    v5->_authTransientConfigurable = objc_msgSend(v19, "BOOLValue");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("groupHead")));
    if (!v20)
      goto LABEL_14;
    v21 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      v22 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v20));
    }
    else
    {
      v23 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v20, v23) & 1) == 0)
        goto LABEL_14;
      v22 = (NSData *)objc_msgSend(v20, "copy");
    }
    groupHeadIDAsData = v5->_groupHeadIDAsData;
    v5->_groupHeadIDAsData = v22;

LABEL_14:
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupMembers")));
    v26 = (NSArray *)objc_msgSend(v25, "copy");
    groupMemberIDs = v5->_groupMemberIDs;
    v5->_groupMemberIDs = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referencedApps")));
    v29 = (NSArray *)objc_msgSend(v28, "copy");
    referencedAppIDs = v5->_referencedAppIDs;
    v5->_referencedAppIDs = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("containerInstance")));
    v5->_isContainer = objc_msgSend(v31, "BOOLValue");

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("proxyInstance")));
    v5->_isProxy = objc_msgSend(v32, "BOOLValue");

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("packageIdentifier")));
    if (!v33)
      goto LABEL_20;
    v34 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
    {
      v35 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v33));
    }
    else
    {
      v36 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v33, v36) & 1) == 0)
        goto LABEL_20;
      v35 = (NSData *)objc_msgSend(v33, "copy");
    }
    packageIdentifierAsData = v5->_packageIdentifierAsData;
    v5->_packageIdentifierAsData = v35;

LABEL_20:
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("moduleIdentifier")));

    if (v38)
    {
      v39 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
      {
        v40 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v38));
LABEL_25:
        moduleIdentifierAsData = v5->_moduleIdentifierAsData;
        v5->_moduleIdentifierAsData = v40;

        goto LABEL_26;
      }
      v41 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v38, v41) & 1) != 0)
      {
        v40 = (NSData *)objc_msgSend(v38, "copy");
        goto LABEL_25;
      }
    }
LABEL_26:
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupActivationStyle")));
    v5->_groupActivationStyle = objc_msgSend(v43, "intValue");

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multiSEApplicationGroup")));
    v45 = (NSArray *)objc_msgSend(v44, "copy");
    multiSEApplicationGroupMemberIDs = v5->_multiSEApplicationGroupMemberIDs;
    v5->_multiSEApplicationGroupMemberIDs = v45;

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("typeFSystemCode")));
    v48 = (NSData *)objc_msgSend(v47, "copy");
    typeFSystemCode = v5->_typeFSystemCode;
    v5->_typeFSystemCode = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seOS")));
    v5->_seOS = (int64_t)objc_msgSend(v50, "unsignedIntegerValue");

    v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("instanceACL")));
    instanceACL = v5->_instanceACL;
    v5->_instanceACL = (NSData *)v51;

    -[NFApplet _initManagedBySP](v5, "_initManagedBySP");
  }

  return v5;
}

- (void)_setIsActive:(BOOL)a3
{
  void *specific;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  if (self->_activationState == 128)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(4, "%c[%{public}s %{public}s]:%i Applet is non-activatable", v11, ClassName, Name, 625);
    }
    v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      *(_DWORD *)buf = 67109890;
      v19 = v16;
      v20 = 2082;
      v21 = object_getClassName(self);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 625;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Applet is non-activatable", buf, 0x22u);
    }

  }
  else
  {
    self->_activationState = a3;
  }
}

+ (id)aidListForPrinting:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(NFApplet);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
          -[NSMutableArray addObject:](v4, "addObject:", v12);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), v4);
  return v13;
}

- (BOOL)isPPSEControllable
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = self->_referencedAppIDs;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v9 = objc_alloc((Class)NSData);
          v10 = objc_msgSend(v9, "initWithBytes:length:", &unk_10026990A, 14, (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "NF_asHexString"));
          v12 = objc_msgSend(v7, "caseInsensitiveCompare:", v11);

          if (!v12)
          {
            v13 = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

@end
