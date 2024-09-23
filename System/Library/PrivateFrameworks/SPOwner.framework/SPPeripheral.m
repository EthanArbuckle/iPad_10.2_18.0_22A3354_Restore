@implementation SPPeripheral

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPeripheral)initWithUserIdentifier:(id)a3 beaconIdentifier:(id)a4 groupIdentifier:(id)a5 name:(id)a6 partIdentifier:(unsigned __int8)a7 serialNumber:(id)a8 managedByFindMy:(BOOL)a9 primaryIndex:(unint64_t)a10 ltkIndexMap:(id)a11 lastConnectedLEMAC:(id)a12 allowedSessions:(id)a13 keyAddressPairs:(id)a14
{
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SPPeripheral *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SPPeripheral *v42;
  uint64_t v44;
  unsigned int v45;
  SPPeripheral *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v45 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v53 = a4;
  v52 = a5;
  v51 = a6;
  v50 = a8;
  v49 = a11;
  v48 = a12;
  v47 = a13;
  v19 = a14;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v26, "leMACAddress");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v26, "leMACAddress");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, v30);

        }
        objc_msgSend(v26, "leMACAddress");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "longTermKey");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v33);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v23);
  }

  if ((unint64_t)objc_msgSend(v20, "count") < 3)
  {
    v35 = objc_msgSend(v20, "copy");
    v40 = v47;
    v39 = v48;
    v42 = self;
    v38 = v49;
    v41 = v50;
    LOBYTE(v44) = a9;
    v37 = v51;
    v36 = v52;
    v34 = -[SPPeripheral initWithUserIdentifier:beaconIdentifier:groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:longTermKeyMap:](v42, "initWithUserIdentifier:beaconIdentifier:groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:longTermKeyMap:", v54, v53, v52, v51, v45, v50, v44, a10, v49, v48, v47, v35);
    v46 = v34;
  }
  else
  {
    v34 = self;
    LogCategory_CBPeripheralManagement();
    v35 = objc_claimAutoreleasedReturnValue();
    v37 = v51;
    v36 = v52;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[SPPeripheral initWithUserIdentifier:beaconIdentifier:groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:keyAddressPairs:].cold.1(v20, v35);
    v46 = 0;
    v39 = v48;
    v38 = v49;
    v40 = v47;
    v41 = v50;
  }

  return v46;
}

- (SPPeripheral)initWithUserIdentifier:(id)a3 beaconIdentifier:(id)a4 groupIdentifier:(id)a5 name:(id)a6 partIdentifier:(unsigned __int8)a7 serialNumber:(id)a8 managedByFindMy:(BOOL)a9 primaryIndex:(unint64_t)a10 ltkIndexMap:(id)a11 lastConnectedLEMAC:(id)a12 allowedSessions:(id)a13 longTermKeyMap:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SPPeripheral *v24;
  uint64_t v25;
  NSUUID *userIdentifier;
  uint64_t v27;
  NSUUID *beaconIdentifier;
  uint64_t v29;
  NSUUID *groupIdentifier;
  uint64_t v31;
  NSString *name;
  uint64_t v33;
  NSString *serialNumber;
  uint64_t v35;
  NSArray *allowedSessions;
  uint64_t v37;
  NSDictionary *longTermKeyMap;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v44 = a3;
  v43 = a4;
  v42 = a5;
  v41 = a6;
  v19 = a8;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v45.receiver = self;
  v45.super_class = (Class)SPPeripheral;
  v24 = -[SPPeripheral init](&v45, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v44, "copy");
    userIdentifier = v24->_userIdentifier;
    v24->_userIdentifier = (NSUUID *)v25;

    v27 = objc_msgSend(v43, "copy");
    beaconIdentifier = v24->_beaconIdentifier;
    v24->_beaconIdentifier = (NSUUID *)v27;

    v29 = objc_msgSend(v42, "copy");
    groupIdentifier = v24->_groupIdentifier;
    v24->_groupIdentifier = (NSUUID *)v29;

    v31 = objc_msgSend(v41, "copy");
    name = v24->_name;
    v24->_name = (NSString *)v31;

    v24->_partIdentifier = a7;
    v33 = objc_msgSend(v19, "copy");
    serialNumber = v24->_serialNumber;
    v24->_serialNumber = (NSString *)v33;

    v24->_managedByFindMy = a9;
    v24->_primaryIndex = a10;
    objc_storeStrong((id *)&v24->_ltkIndexMap, a11);
    objc_storeStrong((id *)&v24->_lastConnectedLEMAC, a12);
    v35 = objc_msgSend(v22, "copy");
    allowedSessions = v24->_allowedSessions;
    v24->_allowedSessions = (NSArray *)v35;

    v37 = objc_msgSend(v23, "copy");
    longTermKeyMap = v24->_longTermKeyMap;
    v24->_longTermKeyMap = (NSDictionary *)v37;

  }
  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SPPeripheral *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  SPPeripheral *v19;

  v19 = [SPPeripheral alloc];
  -[SPPeripheral userIdentifier](self, "userIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral beaconIdentifier](self, "beaconIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral groupIdentifier](self, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPPeripheral partIdentifier](self, "partIdentifier");
  -[SPPeripheral serialNumber](self, "serialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SPPeripheral managedByFindMy](self, "managedByFindMy");
  v9 = -[SPPeripheral primaryIndex](self, "primaryIndex");
  -[SPPeripheral ltkIndexMap](self, "ltkIndexMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral lastConnectedLEMAC](self, "lastConnectedLEMAC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral allowedSessions](self, "allowedSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral longTermKeyMap](self, "longTermKeyMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = v8;
  v14 = -[SPPeripheral initWithUserIdentifier:beaconIdentifier:groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:longTermKeyMap:](v19, "initWithUserIdentifier:beaconIdentifier:groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:longTermKeyMap:", v18, v17, v4, v5, v6, v7, v16, v9, v10, v11, v12, v13);

  return v14;
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
  -[SPPeripheral userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userIdentifier"));

  -[SPPeripheral beaconIdentifier](self, "beaconIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("beaconIdentifier"));

  -[SPPeripheral groupIdentifier](self, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("groupIdentifier"));

  -[SPPeripheral name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("name"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[SPPeripheral partIdentifier](self, "partIdentifier"), CFSTR("partIdentifier"));
  -[SPPeripheral serialNumber](self, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("serialNumber"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SPPeripheral managedByFindMy](self, "managedByFindMy"), CFSTR("managedByFindMy"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SPPeripheral primaryIndex](self, "primaryIndex"), CFSTR("primaryIndex"));
  -[SPPeripheral ltkIndexMap](self, "ltkIndexMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("ltkIndexMap"));

  -[SPPeripheral lastConnectedLEMAC](self, "lastConnectedLEMAC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lastConnectedLEMAC"));

  -[SPPeripheral allowedSessions](self, "allowedSessions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("allowedSessions"));

  -[SPPeripheral longTermKeyMap](self, "longTermKeyMap");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("longTermKeyMap"));

}

- (SPPeripheral)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *userIdentifier;
  NSUUID *v7;
  NSUUID *beaconIdentifier;
  NSUUID *v9;
  NSUUID *groupIdentifier;
  NSString *v11;
  NSString *name;
  NSString *v13;
  NSString *serialNumber;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *ltkIndexMap;
  NSData *v20;
  NSData *lastConnectedLEMAC;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *allowedSessions;
  void *v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  NSDictionary *longTermKeyMap;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  userIdentifier = self->_userIdentifier;
  self->_userIdentifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconIdentifier"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  groupIdentifier = self->_groupIdentifier;
  self->_groupIdentifier = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v11;

  self->_partIdentifier = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("partIdentifier"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  serialNumber = self->_serialNumber;
  self->_serialNumber = v13;

  self->_managedByFindMy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("managedByFindMy"));
  self->_primaryIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("primaryIndex"));
  v15 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v37[2] = objc_opt_class();
  v37[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("ltkIndexMap"));
  v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  ltkIndexMap = self->_ltkIndexMap;
  self->_ltkIndexMap = v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastConnectedLEMAC"));
  v20 = (NSData *)objc_claimAutoreleasedReturnValue();
  lastConnectedLEMAC = self->_lastConnectedLEMAC;
  self->_lastConnectedLEMAC = v20;

  v22 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("allowedSessions"));
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allowedSessions = self->_allowedSessions;
  self->_allowedSessions = v25;

  v27 = (void *)MEMORY[0x1E0C99E60];
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28, v33, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("longTermKeyMap"));
  v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  longTermKeyMap = self->_longTermKeyMap;
  self->_longTermKeyMap = v30;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  SPPeripheral *v4;
  SPPeripheral *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SPPeripheral *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPPeripheral userIdentifier](self, "userIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPPeripheral userIdentifier](v5, "userIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SPPeripheral beaconIdentifier](self, "beaconIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPPeripheral beaconIdentifier](v5, "beaconIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SPPeripheral userIdentifier](self, "userIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SPPeripheral beaconIdentifier](self, "beaconIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSArray)keyAddressPairs
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SPCBPeripheralKeyAddressPair *v17;
  id obj;
  uint64_t v20;
  SPPeripheral *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = self;
  -[SPPeripheral longTermKeyMap](self, "longTermKeyMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v20 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v8);
        -[SPPeripheral longTermKeyMap](v21, "longTermKeyMap");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = -[SPCBPeripheralKeyAddressPair initWithLEMACAddress:longTermKey:]([SPCBPeripheralKeyAddressPair alloc], "initWithLEMACAddress:longTermKey:", v9, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16));
              objc_msgSend(v3, "addObject:", v17);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v14);
        }

        ++v8;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (id)descriptionForLEMAC:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "subdataWithRange:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subdataWithRange:", 1, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "fm_hexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_hexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  id obj;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  -[SPPeripheral groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SPPeripheral groupIdentifier](self, "groupIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = CFSTR("<nil>");
  }
  -[SPPeripheral lastConnectedLEMAC](self, "lastConnectedLEMAC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SPPeripheral lastConnectedLEMAC](self, "lastConnectedLEMAC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPPeripheral descriptionForLEMAC:](self, "descriptionForLEMAC:", v6);
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = &stru_1E5E19868;
  }
  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SPPeripheral longTermKeyMap](self, "longTermKeyMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v9)
  {
    v10 = v9;
    v53 = *(id *)v66;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(id *)v66 != v53)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        -[SPPeripheral longTermKeyMap](self, "longTermKeyMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v62 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "fm_hexString");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          }
          while (v18);
        }

        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB3940];
        -[SPPeripheral descriptionForLEMAC:](self, "descriptionForLEMAC:", v12);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("LEMAC: %@ -- LTKs: [%@]"), v24, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "addObject:", v25);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v10);
  }

  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[SPPeripheral ltkIndexMap](self, "ltkIndexMap");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v58 != v29)
          objc_enumerationMutation(v54);
        v31 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
        v32 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v31, "fm_hexString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPPeripheral ltkIndexMap](self, "ltkIndexMap");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("  %@ -> %llu"), v33, objc_msgSend(v35, "unsignedLongLongValue"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v36);

      }
      v28 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v28);
  }

  v37 = (void *)MEMORY[0x1E0CB3940];
  v49 = v26;
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringWithFormat:", CFSTR("\n%@\n"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (id)MEMORY[0x1E0CB3940];
  -[SPPeripheral userIdentifier](self, "userIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral beaconIdentifier](self, "beaconIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v38) = -[SPPeripheral partIdentifier](self, "partIdentifier");
  -[SPPeripheral name](self, "name");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPeripheral serialNumber](self, "serialNumber");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[SPPeripheral managedByFindMy](self, "managedByFindMy");
  v44 = -[SPPeripheral primaryIndex](self, "primaryIndex");
  -[SPPeripheral allowedSessions](self, "allowedSessions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "stringWithFormat:", CFSTR("<Uid: %@ Bid: %@ group: %@ part: %u name: [%@] S/N: [%@] managed: %d index: %llu lastConnectedMAC: [%@] acl: %@ ltkMap: %@ ltkIndexMap: %@>"), v48, v40, v51, v38, v41, v42, v43, v44, v50, v45, v56, v39);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (NSUUID)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(unsigned __int8)a3
{
  self->_partIdentifier = a3;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)managedByFindMy
{
  return self->_managedByFindMy;
}

- (void)setManagedByFindMy:(BOOL)a3
{
  self->_managedByFindMy = a3;
}

- (NSData)lastConnectedLEMAC
{
  return self->_lastConnectedLEMAC;
}

- (void)setLastConnectedLEMAC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)allowedSessions
{
  return self->_allowedSessions;
}

- (void)setAllowedSessions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)longTermKeyMap
{
  return self->_longTermKeyMap;
}

- (void)setLongTermKeyMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (unint64_t)primaryIndex
{
  return self->_primaryIndex;
}

- (void)setPrimaryIndex:(unint64_t)a3
{
  self->_primaryIndex = a3;
}

- (NSDictionary)ltkIndexMap
{
  return self->_ltkIndexMap;
}

- (void)setLtkIndexMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltkIndexMap, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_longTermKeyMap, 0);
  objc_storeStrong((id *)&self->_allowedSessions, 0);
  objc_storeStrong((id *)&self->_lastConnectedLEMAC, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

- (void)initWithUserIdentifier:(void *)a1 beaconIdentifier:(NSObject *)a2 groupIdentifier:name:partIdentifier:serialNumber:managedByFindMy:primaryIndex:ltkIndexMap:lastConnectedLEMAC:allowedSessions:keyAddressPairs:.cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "Too many MAC addresses: %lu", (uint8_t *)&v3, 0xCu);
}

@end
