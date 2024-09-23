@implementation WBWindowState

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (WBMutableTabGroup)privateTabGroup
{
  return self->_privateTabGroup;
}

- (void)setNewlyCreated:(BOOL)a3
{
  self->_newlyCreated = a3;
}

- (WBMutableTabGroup)localTabGroup
{
  return self->_localTabGroup;
}

- (NSString)activeTabGroupUUID
{
  return self->_activeTabGroupUUID;
}

- (NSString)activeProfileIdentifier
{
  return self->_activeProfileIdentifier;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setExtraAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setActiveProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, a3);
}

- (WBWindowState)initWithUUID:(id)a3 activeTabGroupUUID:(id)a4 localTabGroup:(id)a5 privateTabGroup:(id)a6 sceneID:(id)a7 windowID:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  WBWindowState *v19;
  uint64_t v20;
  NSString *activeTabGroupUUID;
  NSDictionary *extraAttributes;
  uint64_t v23;
  NSMutableDictionary *profilesToActiveTabGroups;
  uint64_t v25;
  NSString *sceneID;
  uint64_t v27;
  NSMutableDictionary *tabGroupsToActiveTabs;
  uint64_t v29;
  NSMutableSet *unnamedTabGroupUUIDs;
  uint64_t v31;
  NSString *uuid;
  WBWindowState *v33;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v35.receiver = self;
  v35.super_class = (Class)WBWindowState;
  v19 = -[WBWindowState init](&v35, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    activeTabGroupUUID = v19->_activeTabGroupUUID;
    v19->_activeTabGroupUUID = (NSString *)v20;

    extraAttributes = v19->_extraAttributes;
    v19->_extraAttributes = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v19->_identifier = a8;
    objc_storeStrong((id *)&v19->_localTabGroup, a5);
    objc_storeStrong((id *)&v19->_privateTabGroup, a6);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    profilesToActiveTabGroups = v19->_profilesToActiveTabGroups;
    v19->_profilesToActiveTabGroups = (NSMutableDictionary *)v23;

    v25 = objc_msgSend(v18, "copy");
    sceneID = v19->_sceneID;
    v19->_sceneID = (NSString *)v25;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    tabGroupsToActiveTabs = v19->_tabGroupsToActiveTabs;
    v19->_tabGroupsToActiveTabs = (NSMutableDictionary *)v27;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    unnamedTabGroupUUIDs = v19->_unnamedTabGroupUUIDs;
    v19->_unnamedTabGroupUUIDs = (NSMutableSet *)v29;

    v31 = objc_msgSend(v14, "copy");
    uuid = v19->_uuid;
    v19->_uuid = (NSString *)v31;

    v33 = v19;
  }

  return v19;
}

- (NSSet)unnamedTabGroupUUIDs
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_unnamedTabGroupUUIDs, "copy");
}

- (BOOL)isEqual:(id)a3
{
  WBWindowState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WBWindowState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WBWindowState uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBWindowState uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = WBSIsEqual();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (WBWindowState)initWithUUID:(id)a3
{
  return -[WBWindowState initWithUUID:sceneID:](self, "initWithUUID:sceneID:", a3, 0);
}

- (WBWindowState)initWithUUID:(id)a3 sceneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WBWindowState *v11;

  v6 = a4;
  v7 = a3;
  +[WBMutableTabGroup localTabGroup](WBMutableTabGroup, "localTabGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBMutableTabGroup privateTabGroup](WBMutableTabGroup, "privateTabGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBWindowState initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:](self, "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", v7, v10, v8, v9, v6, 0);

  return v11;
}

- (WBWindowState)initWithDictionaryRepresentation:(id)a3 localTabGroup:(id)a4 privateTabGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  WBWindowState *v13;
  uint64_t v14;
  NSDictionary *extraAttributes;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *tabGroupsToActiveTabs;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  WBWindowState *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "safari_stringForKey:", *MEMORY[0x24BE83360]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_stringForKey:", *MEMORY[0x24BE83370]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    +[WBMutableTabGroup localTabGroup](WBMutableTabGroup, "localTabGroup");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_3;
  }
  +[WBMutableTabGroup privateTabGroup](WBMutableTabGroup, "privateTabGroup");
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v13 = -[WBWindowState initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:](self, "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", v11, v12, v9, v10, 0, 0);
  if (v13)
  {
    v14 = objc_msgSend(v8, "copy");
    extraAttributes = v13->_extraAttributes;
    v13->_extraAttributes = (NSDictionary *)v14;

    objc_msgSend(v8, "safari_dictionaryForKey:", *MEMORY[0x24BE833B8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    tabGroupsToActiveTabs = v13->_tabGroupsToActiveTabs;
    v13->_tabGroupsToActiveTabs = v19;

    objc_msgSend(v8, "safari_stringForKey:returningNilIfEmpty:", *MEMORY[0x24BE83368], 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = v21;
    else
      v23 = *MEMORY[0x24BE82E70];
    -[WBWindowState setActiveProfileIdentifier:](v13, "setActiveProfileIdentifier:", v23);

    v24 = v13;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WBWindowState uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = -[WBTabGroup copyWithZone:](self->_localTabGroup, "copyWithZone:");
  v6 = -[WBTabGroup copyWithZone:](self->_privateTabGroup, "copyWithZone:", a3);
  v7 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", self->_uuid, self->_activeTabGroupUUID, v5, v6, self->_sceneID, self->_identifier);
  objc_msgSend(v7, "setDateClosed:", self->_dateClosed);
  v8 = (void *)-[NSDictionary copy](self->_extraAttributes, "copy");
  objc_msgSend(v7, "setExtraAttributes:", v8);

  v9 = (void *)-[NSMutableDictionary copy](self->_tabGroupsToActiveTabs, "copy");
  objc_msgSend(v7, "setTabGroupsToActiveTabs:", v9);

  v10 = (void *)-[NSString copy](self->_activeProfileIdentifier, "copy");
  objc_msgSend(v7, "setActiveProfileIdentifier:", v10);

  v11 = -[NSMutableDictionary mutableCopy](self->_profilesToActiveTabGroups, "mutableCopy");
  v12 = (void *)v7[2];
  v7[2] = v11;

  v13 = -[NSMutableSet mutableCopy](self->_unnamedTabGroupUUIDs, "mutableCopy");
  v14 = (void *)v7[3];
  v7[3] = v13;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBWindowState)initWithCoder:(id)a3
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WBWindowState *v19;
  uint64_t v20;
  NSMutableDictionary *profilesToActiveTabGroups;
  uint64_t v22;
  NSMutableSet *unnamedTabGroupUUIDs;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83370]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateClosed"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  v38[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("extraAttributes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v3, "decodeIntForKey:", CFSTR("identifier"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localTabGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateTabGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, *MEMORY[0x24BE833B8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83360]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83368]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF20];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, *MEMORY[0x24BE833A8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCF20];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, *MEMORY[0x24BE833C0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[WBWindowState initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:](self, "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", v25, v34, v7, v8, v29, v30);
  -[WBWindowState setDateClosed:](v19, "setDateClosed:", v32);
  -[WBWindowState setExtraAttributes:](v19, "setExtraAttributes:", v31);
  -[WBWindowState setTabGroupsToActiveTabs:](v19, "setTabGroupsToActiveTabs:", v28);
  -[WBWindowState setActiveProfileIdentifier:](v19, "setActiveProfileIdentifier:", v27);
  v20 = objc_msgSend(v26, "mutableCopy");
  profilesToActiveTabGroups = v19->_profilesToActiveTabGroups;
  v19->_profilesToActiveTabGroups = (NSMutableDictionary *)v20;

  v22 = objc_msgSend(v18, "mutableCopy");
  unnamedTabGroupUUIDs = v19->_unnamedTabGroupUUIDs;
  v19->_unnamedTabGroupUUIDs = (NSMutableSet *)v22;

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *activeTabGroupUUID;
  uint64_t v5;
  uint64_t v6;
  id v7;

  activeTabGroupUUID = self->_activeTabGroupUUID;
  v5 = *MEMORY[0x24BE83370];
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", activeTabGroupUUID, v5);
  objc_msgSend(v7, "encodeObject:forKey:", self->_dateClosed, CFSTR("dateClosed"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_extraAttributes, CFSTR("extraAttributes"));
  objc_msgSend(v7, "encodeInt:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_localTabGroup, CFSTR("localTabGroup"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_privateTabGroup, CFSTR("privateTabGroup"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_sceneID, CFSTR("sceneID"));
  v6 = *MEMORY[0x24BE833B8];
  objc_msgSend(v7, "encodeObject:forKey:", self->_tabGroupsToActiveTabs, *MEMORY[0x24BE833B8]);
  objc_msgSend(v7, "encodeObject:forKey:", self->_uuid, *MEMORY[0x24BE83360]);
  objc_msgSend(v7, "encodeObject:forKey:", self->_activeProfileIdentifier, *MEMORY[0x24BE83368]);
  objc_msgSend(v7, "encodeObject:forKey:", self->_profilesToActiveTabGroups, v6);
  objc_msgSend(v7, "encodeObject:forKey:", self->_unnamedTabGroupUUIDs, *MEMORY[0x24BE833C0]);

}

- (WBWindowState)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBMutableTabGroup *v7;
  void *v8;
  WBMutableTabGroup *v9;
  WBMutableTabGroup *v10;
  void *v11;
  WBMutableTabGroup *v12;
  WBWindowState *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *v18;
  NSDictionary *extraAttributes;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *tabGroupsToActiveTabs;
  void *v25;
  double v26;
  void *v27;
  NSString *v28;
  NSString *activeProfileIdentifier;
  void *v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *profilesToActiveTabGroups;
  unint64_t v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  NSMutableSet *v39;
  NSMutableSet *unnamedTabGroupUUIDs;
  WBWindowState *v41;
  void *v43;

  v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x24BE83360]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x24BE83370]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [WBMutableTabGroup alloc];
    objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("localTabGroup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WBTabGroup initWithDictionaryRepresentation:](v7, "initWithDictionaryRepresentation:", v8);

    v10 = [WBMutableTabGroup alloc];
    objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("privateTabGroup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WBTabGroup initWithDictionaryRepresentation:](v10, "initWithDictionaryRepresentation:", v11);

    v13 = 0;
    if (v9 && v12)
    {
      if (!objc_msgSend(v6, "length"))
      {
        -[WBTabGroup uuid](v9, "uuid");
        v14 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v14;
      }
      objc_msgSend(v4, "safari_stringForKey:", CFSTR("sceneID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "length"))
      {

        v15 = 0;
      }
      objc_msgSend(v4, "safari_numberForKey:", CFSTR("identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      self = -[WBWindowState initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:](self, "initWithUUID:activeTabGroupUUID:localTabGroup:privateTabGroup:sceneID:windowID:", v5, v6, v9, v12, v15, v17);
      if (self)
      {
        objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("extraAttributes"));
        v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        extraAttributes = self->_extraAttributes;
        self->_extraAttributes = v18;

        objc_msgSend(v4, "safari_dictionaryForKey:", *MEMORY[0x24BE833B8]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");
        v22 = v21;
        if (v21)
        {
          v23 = v21;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v23 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        }
        tabGroupsToActiveTabs = self->_tabGroupsToActiveTabs;
        self->_tabGroupsToActiveTabs = v23;

        objc_msgSend(v4, "safari_dateForKey:", CFSTR("dateClosed"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSinceNow");
        v43 = v25;
        if (v26 >= 0.0)
          v27 = 0;
        else
          v27 = v25;
        objc_storeStrong((id *)&self->_dateClosed, v27);
        objc_msgSend(v4, "safari_stringForKey:", *MEMORY[0x24BE83368]);
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        activeProfileIdentifier = self->_activeProfileIdentifier;
        self->_activeProfileIdentifier = v28;

        objc_msgSend(v4, "safari_dictionaryForKey:", *MEMORY[0x24BE833A8]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "mutableCopy");
        v32 = v31;
        if (v31)
        {
          v33 = v31;
          profilesToActiveTabGroups = self->_profilesToActiveTabGroups;
          self->_profilesToActiveTabGroups = v33;
          v35 = 0x24BDBC000;
        }
        else
        {
          v35 = 0x24BDBC000uLL;
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          profilesToActiveTabGroups = self->_profilesToActiveTabGroups;
          self->_profilesToActiveTabGroups = v36;
        }

        v37 = *(void **)(v35 + 3824);
        objc_msgSend(v4, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE833C0]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setWithArray:", v38);
        v39 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        unnamedTabGroupUUIDs = self->_unnamedTabGroupUUIDs;
        self->_unnamedTabGroupUUIDs = v39;

        v41 = self;
      }

      v13 = self;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  NSString *uuid;
  uint64_t v4;
  NSString *activeTabGroupUUID;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *sceneID;
  void *v10;
  NSDictionary *extraAttributes;
  NSDate *dateClosed;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *tabGroupsToActiveTabs;
  NSMutableDictionary *profilesToActiveTabGroups;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[12];
  _QWORD v24[13];

  v24[12] = *MEMORY[0x24BDAC8D0];
  uuid = self->_uuid;
  v4 = *MEMORY[0x24BE83370];
  v23[0] = *MEMORY[0x24BE83360];
  v23[1] = v4;
  activeTabGroupUUID = self->_activeTabGroupUUID;
  v24[0] = uuid;
  v24[1] = activeTabGroupUUID;
  v23[2] = CFSTR("localTabGroup");
  -[WBTabGroup dictionaryRepresentation](self->_localTabGroup, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  v23[3] = CFSTR("privateTabGroup");
  -[WBTabGroup dictionaryRepresentation](self->_privateTabGroup, "dictionaryRepresentation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  sceneID = &stru_24CB35168;
  if (self->_sceneID)
    sceneID = (const __CFString *)self->_sceneID;
  v24[3] = v7;
  v24[4] = sceneID;
  v23[4] = CFSTR("sceneID");
  v23[5] = CFSTR("identifier");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_identifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dateClosed = self->_dateClosed;
  extraAttributes = self->_extraAttributes;
  v24[5] = v10;
  v24[6] = extraAttributes;
  v23[6] = CFSTR("extraAttributes");
  v23[7] = CFSTR("dateClosed");
  v13 = dateClosed;
  if (!dateClosed)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = *MEMORY[0x24BE833B8];
  tabGroupsToActiveTabs = self->_tabGroupsToActiveTabs;
  profilesToActiveTabGroups = self->_profilesToActiveTabGroups;
  v24[7] = v13;
  v24[8] = tabGroupsToActiveTabs;
  v17 = *MEMORY[0x24BE83368];
  v23[8] = v14;
  v23[9] = v17;
  v18 = *MEMORY[0x24BE833A8];
  v24[9] = self->_activeProfileIdentifier;
  v24[10] = profilesToActiveTabGroups;
  v19 = *MEMORY[0x24BE833C0];
  v23[10] = v18;
  v23[11] = v19;
  -[NSMutableSet allObjects](self->_unnamedTabGroupUUIDs, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!dateClosed)
  return (NSDictionary *)v21;
}

- (NSDictionary)tabGroupsToActiveTabs
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_tabGroupsToActiveTabs, "copy");
}

- (void)setActiveTabUUID:(id)a3 forTabGroupWithUUID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tabGroupsToActiveTabs, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSDictionary)profilesToActiveTabGroups
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_profilesToActiveTabGroups, "copy");
}

- (id)localOrUnnamedTabGroupForRestoration:(BOOL)a3 inProfileWithIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  WBMutableTabGroup *localTabGroup;
  WBMutableTabGroup *unnamedTabGroupForRestoration;
  void *v12;
  int v13;
  WBMutableTabGroup *v14;
  void *v15;
  void *v16;
  WBMutableTabGroup *v17;
  WBMutableTabGroup *v18;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (WBSIsEqual())
  {
    localTabGroup = self->_localTabGroup;
LABEL_6:
    v14 = localTabGroup;
    goto LABEL_11;
  }
  unnamedTabGroupForRestoration = self->_unnamedTabGroupForRestoration;
  if (unnamedTabGroupForRestoration)
  {
    -[WBTabGroup profileIdentifier](unnamedTabGroupForRestoration, "profileIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = WBSIsEqual();

    if (v13)
    {
      localTabGroup = self->_unnamedTabGroupForRestoration;
      goto LABEL_6;
    }
  }
  if (!v6
    || (-[NSMutableSet anyObject](self->_unnamedTabGroupUUIDs, "anyObject"),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet addObject:](self->_unnamedTabGroupUUIDs, "addObject:", v15);
  }
  +[WBMutableTabGroup unnamedTabGroupWithUUID:profileIdentifier:deviceIdentifier:](WBMutableTabGroup, "unnamedTabGroupWithUUID:profileIdentifier:deviceIdentifier:", v15, v8, v9);
  v17 = (WBMutableTabGroup *)objc_claimAutoreleasedReturnValue();
  v18 = self->_unnamedTabGroupForRestoration;
  self->_unnamedTabGroupForRestoration = v17;

  v14 = self->_unnamedTabGroupForRestoration;
LABEL_11:

  return v14;
}

- (NSString)customUnifiedFieldText
{
  return (NSString *)-[NSDictionary safari_stringForKey:](self->_extraAttributes, "safari_stringForKey:", *MEMORY[0x24BE83378]);
}

- (BOOL)isFavoritesBarHidden
{
  return -[NSDictionary safari_BOOLForKey:](self->_extraAttributes, "safari_BOOLForKey:", *MEMORY[0x24BE83380]);
}

- (BOOL)isMinimized
{
  return -[NSDictionary safari_BOOLForKey:](self->_extraAttributes, "safari_BOOLForKey:", *MEMORY[0x24BE83398]);
}

- (BOOL)isPopupWindow
{
  return -[NSDictionary safari_BOOLForKey:](self->_extraAttributes, "safari_BOOLForKey:", *MEMORY[0x24BE83388]);
}

- (BOOL)prefersSidebarVisible
{
  return -[NSDictionary safari_BOOLForKey:](self->_extraAttributes, "safari_BOOLForKey:", *MEMORY[0x24BE833A0]);
}

- (void)setPrefersSidebarVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSDictionary *v6;
  NSDictionary *extraAttributes;
  id v8;

  v3 = a3;
  v8 = (id)-[NSDictionary mutableCopy](self->_extraAttributes, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE833A0]);

  v6 = (NSDictionary *)objc_msgSend(v8, "copy");
  extraAttributes = self->_extraAttributes;
  self->_extraAttributes = v6;

}

- (BOOL)isPrivateWindow
{
  return -[NSDictionary safari_BOOLForKey:](self->_extraAttributes, "safari_BOOLForKey:", *MEMORY[0x24BE83390]);
}

- (BOOL)isTabBarHidden
{
  return -[NSDictionary safari_BOOLForKey:](self->_extraAttributes, "safari_BOOLForKey:", *MEMORY[0x24BE833B0]);
}

- (id)activeTabUUIDForTabGroupWithUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tabGroupsToActiveTabs, "objectForKeyedSubscript:", a3);
}

- (void)removeActiveTabUUIDForTabGroupWithUUID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_tabGroupsToActiveTabs, "removeObjectForKey:", a3);
}

- (void)removeAllActiveTabUUIDs
{
  -[NSMutableDictionary removeAllObjects](self->_tabGroupsToActiveTabs, "removeAllObjects");
}

- (void)addUnnamedTabGroupUUID:(id)a3
{
  -[NSMutableSet addObject:](self->_unnamedTabGroupUUIDs, "addObject:", a3);
}

- (void)removeUnnamedTabGroupUUID:(id)a3
{
  -[NSMutableSet removeObject:](self->_unnamedTabGroupUUIDs, "removeObject:", a3);
}

- (id)activeTabGroupUUIDForProfileWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_profilesToActiveTabGroups, "objectForKeyedSubscript:", a3);
}

- (void)removeActiveTabGroupUUIDForProfileWithIdentifier:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profilesToActiveTabGroups, "setObject:forKeyedSubscript:", 0, a3);
}

- (void)setActiveTabGroupUUID:(id)a3 forProfileWithIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_profilesToActiveTabGroups, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBWindowState activeTabGroupUUID](self, "activeTabGroupUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBWindowState identifier](self, "identifier");
  -[WBWindowState sceneID](self, "sceneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBWindowState uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; activeTabGroupUUID = %@; identifier = %d; sceneID = %@; uuid = %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setActiveTabGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)dateClosed
{
  return self->_dateClosed;
}

- (void)setDateClosed:(id)a3
{
  objc_storeStrong((id *)&self->_dateClosed, a3);
}

- (NSDictionary)extraAttributes
{
  return self->_extraAttributes;
}

- (void)setTabGroupsToActiveTabs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)newlyCreated
{
  return self->_newlyCreated;
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_privateTabGroup, 0);
  objc_storeStrong((id *)&self->_localTabGroup, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_dateClosed, 0);
  objc_storeStrong((id *)&self->_activeTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_unnamedTabGroupForRestoration, 0);
  objc_storeStrong((id *)&self->_unnamedTabGroupUUIDs, 0);
  objc_storeStrong((id *)&self->_profilesToActiveTabGroups, 0);
  objc_storeStrong((id *)&self->_tabGroupsToActiveTabs, 0);
}

@end
