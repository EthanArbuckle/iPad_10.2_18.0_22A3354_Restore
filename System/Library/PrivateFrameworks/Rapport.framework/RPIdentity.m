@implementation RPIdentity

- (id)authTagForData:(id)a3 type:(int)a4 error:(id *)a5
{
  id v8;
  NSData *v9;
  NSData *v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;
  _BYTE v16[6];

  v8 = a3;
  v9 = self->_deviceIRKData;
  v10 = v9;
  if (!v9)
  {
    if (a5)
      goto LABEL_10;
    goto LABEL_11;
  }
  if (-[NSData length](v9, "length") != 16)
  {
    if (a5)
      goto LABEL_10;
    goto LABEL_11;
  }
  -[NSData bytes](objc_retainAutorelease(v10), "bytes");
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "bytes");
  objc_msgSend(v11, "length");
  v12 = SipHash();
  v16[0] = BYTE5(v12);
  v16[1] = BYTE4(v12);
  v16[2] = BYTE3(v12);
  v16[3] = BYTE2(v12);
  v16[4] = BYTE1(v12);
  v16[5] = v12;
  if ((a4 - 1) >= 4)
  {
    if (a5)
    {
LABEL_10:
      RPErrorF();
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v13 = a4 - 1;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v16, qword_1AF307830[v13]);
LABEL_12:

  return v14;
}

- (void)setDeviceIRKData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRequested, 0);
  objc_storeStrong((id *)&self->_dateAcknowledged, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_btIRKData, 0);
  objc_storeStrong((id *)&self->_allUsedSendersKnownAliases, 0);
  objc_storeStrong((id *)&self->_sendersKnownAlias, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_mediaRouteID, 0);
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, 0);
  objc_storeStrong((id *)&self->_edSKData, 0);
  objc_storeStrong((id *)&self->_edPKData, 0);
  objc_storeStrong((id *)&self->_deviceIRKData, 0);
  objc_storeStrong((id *)&self->_dateRemoved, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_accessGroups, 0);
}

+ (id)nullIdentity
{
  if (nullIdentity_sOnce != -1)
    dispatch_once(&nullIdentity_sOnce, &__block_literal_global_8);
  return (id)nullIdentity_sObj;
}

void __26__RPIdentity_nullIdentity__block_invoke()
{
  RPIdentity *v0;
  void *v1;

  v0 = objc_alloc_init(RPIdentity);
  v1 = (void *)nullIdentity_sObj;
  nullIdentity_sObj = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPIdentity)initWithCoder:(id)a3
{
  id v4;
  RPIdentity *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RPIdentity *v23;
  objc_super v25;
  uint64_t v26;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RPIdentity;
  v5 = -[RPIdentity init](&v25, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_opt_class();
    NSDecodeNSDictionaryOfClassesIfPresent();
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v11;
    if (objc_msgSend(v12, "containsValueForKey:", CFSTR("ff")))
      v5->_featureFlags = objc_msgSend(v12, "decodeInt64ForKey:", CFSTR("ff"));

    v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v26 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_revisionID = v26;
    v20 = v19;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v21 = v20;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v26 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_type = v26;
    v23 = v5;
  }

  return v5;
}

- (RPIdentity)initWithType:(int)a3
{
  RPIdentity *v4;
  RPIdentity *v5;
  uint64_t v6;
  NSData *edPKData;
  uint64_t v8;
  NSData *edSKData;
  RPIdentity *v10;
  objc_super v12;
  _BYTE __s[32];
  _BYTE v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)RPIdentity;
  v4 = -[RPIdentity init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    if ((a3 & 0xFFFFFFFB) == 0xA)
    {
      cced25519_make_key_pair_compat();
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v14, 32);
      edPKData = v5->_edPKData;
      v5->_edPKData = (NSData *)v6;

      v8 = objc_msgSend(MEMORY[0x1E0C99D50], "_newZeroingDataWithBytes:length:", __s, 32);
      edSKData = v5->_edSKData;
      v5->_edSKData = (NSData *)v8;

      memset_s(__s, 0x20uLL, 0, 0x20uLL);
    }
    v10 = v5;
  }

  return v5;
}

- (RPIdentity)initWithPairedPeer:(id)a3 type:(int)a4
{
  id v6;
  RPIdentity *v7;
  void *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSData *deviceIRKData;
  uint64_t v13;
  NSData *edPKData;
  void *v15;
  uint64_t v16;
  NSString *idsDeviceID;
  uint64_t v18;
  NSString *model;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  NSDictionary *acl;
  void *v24;
  void *v25;
  RPIdentity *v26;
  objc_super v28;

  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RPIdentity;
  v7 = -[RPIdentity init](&v28, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v7->_type = a4;
    objc_msgSend(v6, "altIRK");
    v11 = objc_claimAutoreleasedReturnValue();
    deviceIRKData = v7->_deviceIRKData;
    v7->_deviceIRKData = (NSData *)v11;

    objc_msgSend(v6, "publicKey");
    v13 = objc_claimAutoreleasedReturnValue();
    edPKData = v7->_edPKData;
    v7->_edPKData = (NSData *)v13;

    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    idsDeviceID = v7->_idsDeviceID;
    v7->_idsDeviceID = (NSString *)v16;

    objc_msgSend(v6, "model");
    v18 = objc_claimAutoreleasedReturnValue();
    model = v7->_model;
    v7->_model = (NSString *)v18;

    objc_msgSend(v6, "name");
    v20 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v20;

    objc_msgSend(v6, "acl");
    v22 = objc_claimAutoreleasedReturnValue();
    acl = v7->_acl;
    v7->_acl = (NSDictionary *)v22;

    objc_msgSend(v6, "info");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueForKey:", CFSTR("RPIdentityFeatureFlags"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      v7->_featureFlags = objc_msgSend(v25, "unsignedLongValue");
    v26 = v7;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *acl;
  NSArray *accessGroups;
  NSString *accountAltDSID;
  NSString *accountID;
  NSArray *allUsedSendersKnownAliases;
  NSString *contactID;
  NSData *deviceIRKData;
  NSData *edPKData;
  NSData *edSKData;
  unint64_t featureFlags;
  NSUUID *homeKitUserIdentifier;
  NSString *identifier;
  NSString *idsDeviceID;
  NSString *mediaRemoteID;
  NSString *mediaRouteID;
  NSString *model;
  NSString *name;
  uint64_t revisionID;
  NSString *sendersKnownAlias;
  NSData *btIRKData;
  NSData *btAddress;
  uint64_t type;
  id v27;

  v4 = a3;
  acl = self->_acl;
  v27 = v4;
  if (acl)
  {
    objc_msgSend(v4, "encodeObject:forKey:", acl, CFSTR("acl"));
    v4 = v27;
  }
  accessGroups = self->_accessGroups;
  if (accessGroups)
  {
    objc_msgSend(v27, "encodeObject:forKey:", accessGroups, CFSTR("ag"));
    v4 = v27;
  }
  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID)
  {
    objc_msgSend(v27, "encodeObject:forKey:", accountAltDSID, CFSTR("altDSID"));
    v4 = v27;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    objc_msgSend(v27, "encodeObject:forKey:", accountID, CFSTR("aid"));
    v4 = v27;
  }
  allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
  if (allUsedSendersKnownAliases)
  {
    objc_msgSend(v27, "encodeObject:forKey:", allUsedSendersKnownAliases, CFSTR("allSKAs"));
    v4 = v27;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    objc_msgSend(v27, "encodeObject:forKey:", contactID, CFSTR("cnid"));
    v4 = v27;
  }
  deviceIRKData = self->_deviceIRKData;
  if (deviceIRKData)
  {
    objc_msgSend(v27, "encodeObject:forKey:", deviceIRKData, CFSTR("dIRK"));
    v4 = v27;
  }
  edPKData = self->_edPKData;
  if (edPKData)
  {
    objc_msgSend(v27, "encodeObject:forKey:", edPKData, CFSTR("edPK"));
    v4 = v27;
  }
  edSKData = self->_edSKData;
  if (edSKData)
  {
    objc_msgSend(v27, "encodeObject:forKey:", edSKData, CFSTR("edSK"));
    v4 = v27;
  }
  featureFlags = self->_featureFlags;
  if (featureFlags)
  {
    objc_msgSend(v27, "encodeInt64:forKey:", featureFlags, CFSTR("ff"));
    v4 = v27;
  }
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if (homeKitUserIdentifier)
  {
    objc_msgSend(v27, "encodeObject:forKey:", homeKitUserIdentifier, CFSTR("hkUID"));
    v4 = v27;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v27, "encodeObject:forKey:", identifier, CFSTR("id"));
    v4 = v27;
  }
  idsDeviceID = self->_idsDeviceID;
  if (idsDeviceID)
  {
    objc_msgSend(v27, "encodeObject:forKey:", idsDeviceID, CFSTR("idsD"));
    v4 = v27;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    objc_msgSend(v27, "encodeObject:forKey:", mediaRemoteID, CFSTR("MRI"));
    v4 = v27;
  }
  mediaRouteID = self->_mediaRouteID;
  if (mediaRouteID)
  {
    objc_msgSend(v27, "encodeObject:forKey:", mediaRouteID, CFSTR("MRtI"));
    v4 = v27;
  }
  model = self->_model;
  if (model)
  {
    objc_msgSend(v27, "encodeObject:forKey:", model, CFSTR("md"));
    v4 = v27;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v27, "encodeObject:forKey:", name, CFSTR("nm"));
    v4 = v27;
  }
  revisionID = self->_revisionID;
  if ((_DWORD)revisionID)
  {
    objc_msgSend(v27, "encodeInt64:forKey:", revisionID, CFSTR("rev"));
    v4 = v27;
  }
  sendersKnownAlias = self->_sendersKnownAlias;
  if (sendersKnownAlias)
  {
    objc_msgSend(v27, "encodeObject:forKey:", sendersKnownAlias, CFSTR("ska"));
    v4 = v27;
  }
  btIRKData = self->_btIRKData;
  if (btIRKData)
  {
    objc_msgSend(v27, "encodeObject:forKey:", btIRKData, CFSTR("bIRK"));
    v4 = v27;
  }
  btAddress = self->_btAddress;
  if (btAddress)
  {
    objc_msgSend(v27, "encodeObject:forKey:", btAddress, CFSTR("bAdd"));
    v4 = v27;
  }
  type = self->_type;
  if ((_DWORD)type)
  {
    objc_msgSend(v27, "encodeInteger:forKey:", type, CFSTR("ty"));
    v4 = v27;
  }

}

- (id)description
{
  return -[RPIdentity descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  id v11;
  id v12;
  NSString *accountAltDSID;
  NSString *v14;
  id v15;
  NSString *accountID;
  NSString *v17;
  id v18;
  NSString *name;
  NSString *v20;
  id v21;
  NSUUID *homeKitUserIdentifier;
  NSUUID *v23;
  id v24;
  NSString *mediaRemoteID;
  NSString *v26;
  id v27;
  NSString *sendersKnownAlias;
  NSString *v29;
  id v30;
  NSString *model;
  NSString *v32;
  id v33;
  NSString *v34;
  NSString *v35;
  id *v36;
  id v37;
  NSString *contactID;
  NSString *v39;
  id v40;
  NSArray *allUsedSendersKnownAliases;
  NSArray *v42;
  void *v43;
  id v44;
  id v45;
  NSData *deviceIRKData;
  id v47;
  NSData *edPKData;
  NSData *v49;
  id v50;
  NSData *edSKData;
  NSData *v52;
  id v53;
  NSData *btIRKData;
  id v55;
  NSData *btAddress;
  id v57;
  NSDate *dateRequested;
  id v59;
  NSDate *dateAcknowledged;
  id v61;
  NSDate *dateRemoved;
  id v63;
  id v64;
  NSDictionary *acl;
  id v66;
  id v67;
  NSData *revisionID;
  NSData *v70;
  NSData *v71;
  NSDate *v72;
  NSDate *v73;
  NSDate *v74;
  NSDictionary *v75;
  id v76;
  _QWORD v77[10];
  id v78;
  uint64_t v79;

  v4 = shouldPrintSensitiveData();
  v79 = 0;
  NSAppendPrintF();
  v5 = 0;
  v6 = v5;
  if (self->_type)
  {
    v78 = v5;
    NSAppendPrintF();
    v7 = v78;

    v6 = v7;
  }
  v8 = self->_identifier;
  v9 = self->_idsDeviceID;
  if ((-[NSString isEqual:](v9, "isEqual:", v8) & 1) != 0)
  {
    v10 = v8;
    v8 = 0;
  }
  else
  {
    if (!v8)
      goto LABEL_8;
    v77[9] = v6;
    formatSensitiveData((uint64_t)", ID ", v4);
    NSAppendPrintF();
    v11 = v6;
    v10 = (NSString *)v6;
    v6 = v11;
  }

LABEL_8:
  if (v9)
  {
    v77[8] = v6;
    formatSensitiveData((uint64_t)", IDS ", v4);
    NSAppendPrintF();
    v12 = v6;

    v6 = v12;
  }
  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID)
  {
    v77[7] = v6;
    v14 = accountAltDSID;
    formatSensitiveData((uint64_t)", AccountAltDSID ", v4);
    NSAppendPrintF();
    v15 = v6;

    v6 = v15;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    v77[6] = v6;
    v17 = accountID;
    formatSensitiveData((uint64_t)", AID ", v4);
    NSAppendPrintF();
    v18 = v6;

    v6 = v18;
  }
  name = self->_name;
  if (name)
  {
    v77[5] = v6;
    v20 = name;
    formatSensitiveData((uint64_t)", Nm ", v4);
    NSAppendPrintF();
    v21 = v6;

    v6 = v21;
  }
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if (homeKitUserIdentifier)
  {
    v77[4] = v6;
    v23 = homeKitUserIdentifier;
    formatSensitiveData((uint64_t)", HKUID ", v4);
    NSAppendPrintF();
    v24 = v6;

    v6 = v24;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    v77[3] = v6;
    v26 = mediaRemoteID;
    formatSensitiveData((uint64_t)", MRI ", v4);
    NSAppendPrintF();
    v27 = v6;

    v6 = v27;
  }
  sendersKnownAlias = self->_sendersKnownAlias;
  if (sendersKnownAlias)
  {
    v77[2] = v6;
    v29 = sendersKnownAlias;
    formatSensitiveData((uint64_t)", SKA ", v4);
    NSAppendPrintF();
    v30 = v6;

    v6 = v30;
  }
  model = self->_model;
  if (model)
  {
    v77[1] = v6;
    v32 = model;
    formatSensitiveData((uint64_t)", Md ", v4);
    NSAppendPrintF();
    v33 = v6;

    v6 = v33;
  }
  v34 = self->_mediaRouteID;
  v35 = v34;
  if (v34)
  {
    if (-[NSString isEqual:](v34, "isEqual:", self->_identifier))
    {
      v77[0] = v6;
      v36 = (id *)v77;
    }
    else
    {
      v76 = v6;
      formatSensitiveData((uint64_t)", MRtI ", v4);
      v36 = &v76;
    }
    NSAppendPrintF();
    v37 = *v36;

    v6 = v37;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    v39 = contactID;
    formatSensitiveData((uint64_t)", CNID ", v4);
    NSAppendPrintF();
    v40 = v6;

    v6 = v40;
  }
  allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
  if (allUsedSendersKnownAliases)
  {
    v42 = allUsedSendersKnownAliases;
    -[NSArray componentsJoinedByString:](v42, "componentsJoinedByString:", CFSTR(" "));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    formatSensitiveData((uint64_t)", Used SKAs ", v4);
    NSAppendPrintF();
    v44 = v6;

    v6 = v44;
  }
  revisionID = (NSData *)self->_revisionID;
  NSAppendPrintF();
  v45 = v6;

  if (v4)
  {
    deviceIRKData = self->_deviceIRKData;
    if (deviceIRKData)
    {
      revisionID = deviceIRKData;
      NSAppendPrintF();
      v47 = v45;

      v45 = v47;
    }
    edPKData = self->_edPKData;
    if (edPKData)
    {
      v49 = edPKData;
      -[NSData length](v49, "length", revisionID);
      NSAppendPrintF();
      v50 = v45;

      v45 = v50;
    }
    edSKData = self->_edSKData;
    if (edSKData)
    {
      v52 = edSKData;
      -[NSData length](v52, "length");
      NSAppendPrintF();
      v53 = v45;

      v45 = v53;
    }
    btIRKData = self->_btIRKData;
    if (btIRKData)
    {
      v70 = btIRKData;
      NSAppendPrintF();
      v55 = v45;

      v45 = v55;
    }
    btAddress = self->_btAddress;
    if (btAddress)
    {
      v71 = btAddress;
      NSAppendPrintF();
      v57 = v45;

      v45 = v57;
    }
    dateRequested = self->_dateRequested;
    if (dateRequested)
    {
      v72 = dateRequested;
      NSAppendPrintF();
      v59 = v45;

      v45 = v59;
    }
    dateAcknowledged = self->_dateAcknowledged;
    if (dateAcknowledged)
    {
      v73 = dateAcknowledged;
      NSAppendPrintF();
      v61 = v45;

      v45 = v61;
    }
    dateRemoved = self->_dateRemoved;
    if (dateRemoved)
    {
      v74 = dateRemoved;
      NSAppendPrintF();
      v63 = v45;

      v45 = v63;
    }
    if (self->_featureFlags)
    {
      NSAppendPrintF();
      v64 = v45;

      v45 = v64;
    }
    acl = self->_acl;
    if (acl)
    {
      v75 = acl;
      NSAppendPrintF();
      v66 = v45;

      v45 = v66;
    }
  }
  v67 = v45;

  return v67;
}

- (unsigned)compareWithRPIdentity:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *acl;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  int v10;
  void *v11;
  NSArray *accessGroups;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  void *v16;
  NSString *accountAltDSID;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  void *v21;
  NSString *accountID;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  void *v26;
  NSArray *allUsedSendersKnownAliases;
  NSArray *v28;
  NSArray *v29;
  NSArray *v30;
  void *v31;
  NSString *contactID;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  void *v36;
  NSData *deviceIRKData;
  NSData *v38;
  NSData *v39;
  NSData *v40;
  void *v41;
  NSData *edPKData;
  NSData *v43;
  NSData *v44;
  NSData *v45;
  void *v46;
  NSData *edSKData;
  NSData *v48;
  NSData *v49;
  NSData *v50;
  uint64_t v51;
  void *v52;
  NSUUID *homeKitUserIdentifier;
  NSUUID *v54;
  NSUUID *v55;
  NSUUID *v56;
  void *v57;
  NSString *identifier;
  NSString *v59;
  NSString *v60;
  NSString *v61;
  void *v62;
  NSString *idsDeviceID;
  NSString *v64;
  NSString *v65;
  NSString *v66;
  void *v67;
  NSString *mediaRemoteID;
  NSString *v69;
  NSString *v70;
  NSString *v71;
  void *v72;
  NSString *mediaRouteID;
  NSString *v74;
  NSString *v75;
  NSString *v76;
  int v77;
  void *v78;
  NSString *model;
  NSString *v80;
  NSString *v81;
  NSString *v82;
  int v83;
  void *v84;
  NSString *name;
  NSString *v86;
  NSString *v87;
  NSString *v88;
  int v89;
  void *v90;
  NSString *sendersKnownAlias;
  NSString *v92;
  NSString *v93;
  NSString *v94;
  int v95;
  void *v96;
  NSData *btIRKData;
  NSData *v98;
  NSData *v99;
  NSData *v100;
  int v101;
  void *v102;
  NSData *btAddress;
  NSData *v104;
  NSData *v105;
  NSData *v106;
  int v107;
  int v108;
  int v109;
  unsigned int v110;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  unint64_t featureFlags;
  uint64_t v126;

  v4 = a3;
  objc_msgSend(v4, "acl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  acl = self->_acl;
  v7 = v5;
  v8 = acl;
  if (v7 == v8)
  {

    goto LABEL_6;
  }
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    v10 = -[NSDictionary isEqual:](v7, "isEqual:", v8);

    if (!v10)
      goto LABEL_8;
LABEL_6:
    v124 = 0;
    goto LABEL_9;
  }

LABEL_8:
  v124 = 0x200000;
LABEL_9:
  objc_msgSend(v4, "accessGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  accessGroups = self->_accessGroups;
  v13 = v11;
  v14 = accessGroups;
  v15 = v14;
  if (v13 == v14)
  {
    v123 = 1;
  }
  else if ((v13 == 0) == (v14 != 0))
  {
    v123 = 0;
  }
  else
  {
    v123 = -[NSArray isEqual:](v13, "isEqual:", v14);
  }

  objc_msgSend(v4, "accountAltDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  accountAltDSID = self->_accountAltDSID;
  v18 = v16;
  v19 = accountAltDSID;
  v20 = v19;
  if (v18 == v19)
  {
    v122 = 1;
  }
  else if ((v18 == 0) == (v19 != 0))
  {
    v122 = 0;
  }
  else
  {
    v122 = -[NSString isEqual:](v18, "isEqual:", v19);
  }

  objc_msgSend(v4, "accountID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  accountID = self->_accountID;
  v23 = v21;
  v24 = accountID;
  v25 = v24;
  if (v23 == v24)
  {
    v121 = 1;
  }
  else if ((v23 == 0) == (v24 != 0))
  {
    v121 = 0;
  }
  else
  {
    v121 = -[NSString isEqual:](v23, "isEqual:", v24);
  }

  objc_msgSend(v4, "allUsedSendersKnownAliases");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
  v28 = v26;
  v29 = allUsedSendersKnownAliases;
  v30 = v29;
  if (v28 == v29)
  {
    v120 = 1;
  }
  else if ((v28 == 0) == (v29 != 0))
  {
    v120 = 0;
  }
  else
  {
    v120 = -[NSArray isEqual:](v28, "isEqual:", v29);
  }

  objc_msgSend(v4, "contactID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  contactID = self->_contactID;
  v33 = v31;
  v34 = contactID;
  v35 = v34;
  if (v33 == v34)
  {
    v119 = 1;
  }
  else if ((v33 == 0) == (v34 != 0))
  {
    v119 = 0;
  }
  else
  {
    v119 = -[NSString isEqual:](v33, "isEqual:", v34);
  }

  objc_msgSend(v4, "deviceIRKData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  deviceIRKData = self->_deviceIRKData;
  v38 = v36;
  v39 = deviceIRKData;
  v40 = v39;
  if (v38 == v39)
  {
    v118 = 1;
  }
  else if ((v38 == 0) == (v39 != 0))
  {
    v118 = 0;
  }
  else
  {
    v118 = -[NSData isEqual:](v38, "isEqual:", v39);
  }

  objc_msgSend(v4, "edPKData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  edPKData = self->_edPKData;
  v43 = v41;
  v44 = edPKData;
  v45 = v44;
  if (v43 == v44)
  {
    v117 = 1;
  }
  else if ((v43 == 0) == (v44 != 0))
  {
    v117 = 0;
  }
  else
  {
    v117 = -[NSData isEqual:](v43, "isEqual:", v44);
  }

  objc_msgSend(v4, "edSKData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  edSKData = self->_edSKData;
  v48 = v46;
  v49 = edSKData;
  v50 = v49;
  if (v48 == v49)
  {
    v116 = 1;
  }
  else if ((v48 == 0) == (v49 != 0))
  {
    v116 = 0;
  }
  else
  {
    v116 = -[NSData isEqual:](v48, "isEqual:", v49);
  }

  v51 = objc_msgSend(v4, "featureFlags");
  featureFlags = self->_featureFlags;
  v126 = v51;
  objc_msgSend(v4, "homeKitUserIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  v54 = v52;
  v55 = homeKitUserIdentifier;
  v56 = v55;
  if (v54 == v55)
  {
    v115 = 1;
  }
  else if ((v54 == 0) == (v55 != 0))
  {
    v115 = 0;
  }
  else
  {
    v115 = -[NSUUID isEqual:](v54, "isEqual:", v55);
  }

  objc_msgSend(v4, "identifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  v59 = v57;
  v60 = identifier;
  v61 = v60;
  if (v59 == v60)
  {
    v114 = 1;
  }
  else if ((v59 == 0) == (v60 != 0))
  {
    v114 = 0;
  }
  else
  {
    v114 = -[NSString isEqual:](v59, "isEqual:", v60);
  }

  objc_msgSend(v4, "idsDeviceID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  idsDeviceID = self->_idsDeviceID;
  v64 = v62;
  v65 = idsDeviceID;
  v66 = v65;
  if (v64 == v65)
  {
    v113 = 1;
  }
  else if ((v64 == 0) == (v65 != 0))
  {
    v113 = 0;
  }
  else
  {
    v113 = -[NSString isEqual:](v64, "isEqual:", v65);
  }

  objc_msgSend(v4, "mediaRemoteID");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  mediaRemoteID = self->_mediaRemoteID;
  v69 = v67;
  v70 = mediaRemoteID;
  v71 = v70;
  if (v69 == v70)
  {
    v112 = 1;
  }
  else if ((v69 == 0) == (v70 != 0))
  {
    v112 = 0;
  }
  else
  {
    v112 = -[NSString isEqual:](v69, "isEqual:", v70);
  }

  objc_msgSend(v4, "mediaRouteID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  mediaRouteID = self->_mediaRouteID;
  v74 = v72;
  v75 = mediaRouteID;
  v76 = v75;
  if (v74 == v75)
  {
    v77 = 1;
  }
  else if ((v74 == 0) == (v75 != 0))
  {
    v77 = 0;
  }
  else
  {
    v77 = -[NSString isEqual:](v74, "isEqual:", v75);
  }

  objc_msgSend(v4, "model");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  v80 = v78;
  v81 = model;
  v82 = v81;
  if (v80 == v81)
  {
    v83 = 1;
  }
  else if ((v80 == 0) == (v81 != 0))
  {
    v83 = 0;
  }
  else
  {
    v83 = -[NSString isEqual:](v80, "isEqual:", v81);
  }

  objc_msgSend(v4, "name");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v86 = v84;
  v87 = name;
  v88 = v87;
  if (v86 == v87)
  {
    v89 = 1;
  }
  else if ((v86 == 0) == (v87 != 0))
  {
    v89 = 0;
  }
  else
  {
    v89 = -[NSString isEqual:](v86, "isEqual:", v87);
  }

  objc_msgSend(v4, "sendersKnownAlias");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  sendersKnownAlias = self->_sendersKnownAlias;
  v92 = v90;
  v93 = sendersKnownAlias;
  v94 = v93;
  if (v92 == v93)
  {
    v95 = 1;
  }
  else if ((v92 == 0) == (v93 != 0))
  {
    v95 = 0;
  }
  else
  {
    v95 = -[NSString isEqual:](v92, "isEqual:", v93);
  }

  objc_msgSend(v4, "btIRKData");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  btIRKData = self->_btIRKData;
  v98 = v96;
  v99 = btIRKData;
  v100 = v99;
  if (v98 == v99)
  {
    v101 = 1;
  }
  else if ((v98 == 0) == (v99 != 0))
  {
    v101 = 0;
  }
  else
  {
    v101 = -[NSData isEqual:](v98, "isEqual:", v99);
  }

  objc_msgSend(v4, "btAddress");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  btAddress = self->_btAddress;
  v104 = v102;
  v105 = btAddress;
  v106 = v105;
  if (v104 == v105)
  {
    v107 = 1;
  }
  else if ((v104 == 0) == (v105 != 0))
  {
    v107 = 0;
  }
  else
  {
    v107 = -[NSData isEqual:](v104, "isEqual:", v105);
  }
  v108 = v124 | 0x80000;
  if (v123)
    v108 = v124;
  if (!v122)
    v108 |= 0x2000000u;
  if (!v121)
    v108 |= 0x2000u;
  if (!v120)
    v108 |= 0x1000000u;
  if (!v119)
    v108 |= 0x8000u;
  if (!v118)
    v108 |= 4u;
  if (!v117)
    v108 |= 8u;
  if (!v116)
    v108 |= 0x10u;
  if (v126 != featureFlags)
    v108 |= 0x400u;
  if (!v115)
    v108 |= 0x100000u;
  if (!v114)
    v108 |= 0x20u;
  if (!v113)
    v108 |= 0x40u;
  if (!v112)
    v108 |= 0x10000u;
  if (!v77)
    v108 |= 0x20000u;
  if (!v83)
    v108 |= 0x80u;
  if (!v89)
    v108 |= 0x100u;
  if (!v95)
    v108 |= 0x40000u;
  if (v101)
    v109 = v108;
  else
    v109 = v108 | 0x400000;

  if (!v107)
    v109 |= 0x800000u;
  if (objc_msgSend(v4, "type") == self->_type)
    v110 = v109;
  else
    v110 = v109 | 0x200;

  return v110;
}

- (unsigned)updateWithKeychainItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *identifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  unsigned int v15;
  id v16;
  int v17;
  void *v18;
  NSArray *accessGroups;
  NSArray *v20;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  char v24;
  void *v25;
  NSString *accountAltDSID;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  void *v31;
  NSString *accountID;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;
  void *v37;
  NSString *contactID;
  NSString *v39;
  NSString *v40;
  NSString *v41;
  char v42;
  void *v43;
  NSDate *dateAcknowledged;
  NSDate *v45;
  NSDate *v46;
  NSDate *v47;
  char v48;
  void *v49;
  NSDate *dateAdded;
  NSDate *v51;
  NSDate *v52;
  NSDate *v53;
  char v54;
  void *v55;
  NSDate *dateRemoved;
  NSDate *v57;
  NSDate *v58;
  NSDate *v59;
  void *v60;
  NSDate *v61;
  char v62;
  void *v63;
  void *v64;
  NSDate *dateRequested;
  NSDate *v66;
  NSDate *v67;
  NSDate *v68;
  char v69;
  void *v70;
  NSData *deviceIRKData;
  NSData *v72;
  NSData *v73;
  NSData *v74;
  char v75;
  void *v76;
  NSData *edPKData;
  NSData *v78;
  NSData *v79;
  NSData *v80;
  char v81;
  void *v82;
  NSData *edSKData;
  NSData *v84;
  NSData *v85;
  NSData *v86;
  char v87;
  unint64_t Int64;
  NSString *v89;
  NSString *v90;
  void *v91;
  NSString *idsDeviceID;
  NSString *v93;
  NSString *v94;
  char v95;
  void *v96;
  NSString *mediaRemoteID;
  NSString *v98;
  NSString *v99;
  NSString *v100;
  char v101;
  void *v102;
  NSString *mediaRouteID;
  NSString *v104;
  NSString *v105;
  NSString *v106;
  char v107;
  void *v108;
  NSString *model;
  NSString *v110;
  NSString *v111;
  NSString *v112;
  char v113;
  void *v114;
  NSString *name;
  NSString *v116;
  NSString *v117;
  NSString *v118;
  char v119;
  void *v120;
  NSString *sendersKnownAlias;
  NSString *v122;
  NSString *v123;
  NSString *v124;
  char v125;
  void *v126;
  NSArray *allUsedSendersKnownAliases;
  NSArray *v128;
  NSArray *v129;
  NSArray *v130;
  char v131;
  _BOOL4 v132;
  void *v133;
  void *v134;
  NSData *btIRKData;
  NSData *v136;
  NSData *v137;
  NSData *v138;
  void *v139;
  void *v140;
  char v141;
  void *v142;
  void *v143;
  NSData **p_btAddress;
  NSData *btAddress;
  NSData *v146;
  NSData *v147;
  NSData *v148;
  unsigned int v149;
  void *v150;
  void *v151;
  char v152;
  void *v153;
  void *v154;
  void *v156;
  NSString *v157;
  NSString *v158;
  void *v159;
  void *v160;
  NSDate *v161;
  NSArray *v162;
  void *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id obj;
  id v172;
  void *v173;
  NSString *v174;
  void *v175;
  id v176;
  void *v177;

  v6 = a3;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secrets");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if (a4)
    {
      RPErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
  identifier = self->_identifier;
  v11 = v8;
  v12 = identifier;
  if (v11 == v12)
  {

  }
  else
  {
    v13 = v12;
    if (!v12)
    {

LABEL_12:
      objc_storeStrong((id *)&self->_identifier, v9);
      v15 = 32;
      goto LABEL_13;
    }
    v14 = -[NSString isEqual:](v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_12;
  }
  v15 = 0;
LABEL_13:
  objc_msgSend(v6, "type");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v176 = v6;
  v163 = v9;
  v174 = v11;
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-FamilyAccount")) & 1) != 0)
  {
    v17 = 3;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-FamilyDevice")) & 1) != 0)
  {
    v17 = 4;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-FriendAccount")) & 1) != 0)
  {
    v17 = 5;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-FriendDevice")) & 1) != 0)
  {
    v17 = 6;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-PairedAccount")) & 1) != 0)
  {
    v17 = 7;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-PairedDevice")) & 1) != 0)
  {
    v17 = 8;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-SameAccountDevice")) & 1) != 0)
  {
    v17 = 2;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-Self")) & 1) != 0)
  {
    v17 = 1;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isEqual:", CFSTR("RPIdentity-SharedTVUserDevice")) & 1) != 0)
  {
    v17 = 12;
LABEL_31:

    if (v17 != self->_type)
    {
      self->_type = v17;
      v15 |= 0x200u;
    }
    objc_opt_class();
    NSDictionaryGetNSArrayOfClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    accessGroups = self->_accessGroups;
    v20 = v18;
    v21 = accessGroups;
    v162 = v20;
    if (v20 == v21)
    {

      goto LABEL_40;
    }
    v22 = v21;
    if ((v20 == 0) != (v21 != 0))
    {
      v23 = v20;
      v24 = -[NSArray isEqual:](v20, "isEqual:", v21);

      if ((v24 & 1) != 0)
      {
LABEL_40:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v25, "length"))
          goto LABEL_48;
        accountAltDSID = self->_accountAltDSID;
        v27 = v25;
        v28 = accountAltDSID;
        if (v27 == v28)
        {

          goto LABEL_48;
        }
        v29 = v28;
        if ((v27 == 0) != (v28 != 0))
        {
          v30 = -[NSString isEqual:](v27, "isEqual:", v28);

          if ((v30 & 1) != 0)
          {
LABEL_48:
            CFStringGetTypeID();
            CFDictionaryGetTypedValue();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            obj = v31;
            if (!objc_msgSend(v31, "length"))
              goto LABEL_56;
            accountID = self->_accountID;
            v33 = v31;
            v34 = accountID;
            if (v33 == v34)
            {

              goto LABEL_56;
            }
            v35 = v34;
            if ((v33 == 0) != (v34 != 0))
            {
              v36 = -[NSString isEqual:](v33, "isEqual:", v34);

              if ((v36 & 1) != 0)
              {
LABEL_56:
                CFStringGetTypeID();
                CFDictionaryGetTypedValue();
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v170 = v37;
                if (!objc_msgSend(v37, "length"))
                  goto LABEL_64;
                contactID = self->_contactID;
                v39 = v37;
                v40 = contactID;
                if (v39 == v40)
                {

                  goto LABEL_64;
                }
                v41 = v40;
                if ((v39 == 0) != (v40 != 0))
                {
                  v42 = -[NSString isEqual:](v39, "isEqual:", v40);

                  if ((v42 & 1) != 0)
                  {
LABEL_64:
                    CFDateGetTypeID();
                    CFDictionaryGetTypedValue();
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v168 = v43;
                    if (!v43)
                      goto LABEL_72;
                    dateAcknowledged = self->_dateAcknowledged;
                    v45 = v43;
                    v46 = dateAcknowledged;
                    if (v45 == v46)
                    {

                      goto LABEL_72;
                    }
                    v47 = v46;
                    if (v46)
                    {
                      v48 = -[NSDate isEqual:](v45, "isEqual:", v46);

                      if ((v48 & 1) != 0)
                      {
LABEL_72:
                        CFDateGetTypeID();
                        CFDictionaryGetTypedValue();
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v167 = v49;
                        if (!v49)
                          goto LABEL_80;
                        dateAdded = self->_dateAdded;
                        v51 = v49;
                        v52 = dateAdded;
                        if (v51 == v52)
                        {

                          goto LABEL_80;
                        }
                        v53 = v52;
                        if (v52)
                        {
                          v54 = -[NSDate isEqual:](v51, "isEqual:", v52);

                          if ((v54 & 1) != 0)
                          {
LABEL_80:
                            CFDateGetTypeID();
                            CFDictionaryGetTypedValue();
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            dateRemoved = self->_dateRemoved;
                            v57 = v55;
                            v58 = dateRemoved;
                            v161 = v57;
                            if (v57 == v58)
                            {

                              goto LABEL_87;
                            }
                            v59 = v58;
                            if ((v57 == 0) != (v58 != 0))
                            {
                              v60 = v25;
                              v61 = v57;
                              v62 = -[NSDate isEqual:](v57, "isEqual:", v58);

                              v25 = v60;
                              if ((v62 & 1) != 0)
                              {
LABEL_87:
                                CFDateGetTypeID();
                                CFDictionaryGetTypedValue();
                                v63 = (void *)objc_claimAutoreleasedReturnValue();
                                v64 = v63;
                                if (!v63)
                                  goto LABEL_95;
                                dateRequested = self->_dateRequested;
                                v66 = v63;
                                v67 = dateRequested;
                                if (v66 == v67)
                                {

                                  goto LABEL_95;
                                }
                                v68 = v67;
                                if (v67)
                                {
                                  v69 = -[NSDate isEqual:](v66, "isEqual:", v67);

                                  if ((v69 & 1) != 0)
                                  {
LABEL_95:
                                    CFDictionaryGetCFDataOfLength();
                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                    v166 = v70;
                                    if (!v70)
                                      goto LABEL_103;
                                    deviceIRKData = self->_deviceIRKData;
                                    v72 = v70;
                                    v73 = deviceIRKData;
                                    if (v72 == v73)
                                    {

                                      goto LABEL_103;
                                    }
                                    v74 = v73;
                                    if (v73)
                                    {
                                      v75 = -[NSData isEqual:](v72, "isEqual:", v73);

                                      if ((v75 & 1) != 0)
                                      {
LABEL_103:
                                        CFDictionaryGetCFDataOfLength();
                                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                                        v165 = v76;
                                        if (!v76)
                                          goto LABEL_111;
                                        edPKData = self->_edPKData;
                                        v78 = v76;
                                        v79 = edPKData;
                                        if (v78 == v79)
                                        {

                                          goto LABEL_111;
                                        }
                                        v80 = v79;
                                        if (v79)
                                        {
                                          v81 = -[NSData isEqual:](v78, "isEqual:", v79);

                                          if ((v81 & 1) != 0)
                                          {
LABEL_111:
                                            CFDictionaryGetCFDataOfLength();
                                            v82 = (void *)objc_claimAutoreleasedReturnValue();
                                            v164 = v82;
                                            if (!v82)
                                              goto LABEL_119;
                                            edSKData = self->_edSKData;
                                            v84 = v82;
                                            v85 = edSKData;
                                            if (v84 == v85)
                                            {

                                              goto LABEL_119;
                                            }
                                            v86 = v85;
                                            if (v85)
                                            {
                                              v87 = -[NSData isEqual:](v84, "isEqual:", v85);

                                              if ((v87 & 1) != 0)
                                              {
LABEL_119:
                                                Int64 = CFDictionaryGetInt64();
                                                if (Int64 != self->_featureFlags)
                                                {
                                                  self->_featureFlags = Int64;
                                                  v15 |= 0x400u;
                                                }
                                                v160 = v64;
                                                if ((v17 & 0xFFFFFFFB) == 2 || (v17 & 7) == 4)
                                                {
                                                  v89 = v174;
                                                }
                                                else
                                                {
                                                  CFStringGetTypeID();
                                                  CFDictionaryGetTypedValue();
                                                  v89 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                  if (!v89)
                                                  {
                                                    v90 = 0;
                                                    v91 = v176;
                                                    goto LABEL_133;
                                                  }
                                                }
                                                idsDeviceID = self->_idsDeviceID;
                                                v90 = v89;
                                                v93 = idsDeviceID;
                                                v91 = v176;
                                                if (v90 == v93)
                                                {

                                                  goto LABEL_133;
                                                }
                                                v94 = v93;
                                                if (v93)
                                                {
                                                  v95 = -[NSString isEqual:](v90, "isEqual:", v93);

                                                  if ((v95 & 1) != 0)
                                                  {
LABEL_133:
                                                    CFStringGetTypeID();
                                                    CFDictionaryGetTypedValue();
                                                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v169 = v96;
                                                    if (!objc_msgSend(v96, "length"))
                                                      goto LABEL_141;
                                                    mediaRemoteID = self->_mediaRemoteID;
                                                    v98 = v96;
                                                    v99 = mediaRemoteID;
                                                    if (v98 == v99)
                                                    {

                                                      goto LABEL_141;
                                                    }
                                                    v100 = v99;
                                                    if ((v98 == 0) != (v99 != 0))
                                                    {
                                                      v101 = -[NSString isEqual:](v98, "isEqual:", v99);

                                                      if ((v101 & 1) != 0)
                                                      {
LABEL_141:
                                                        CFStringGetTypeID();
                                                        CFDictionaryGetTypedValue();
                                                        v102 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v175 = v102;
                                                        if (!objc_msgSend(v102, "length"))
                                                          goto LABEL_149;
                                                        mediaRouteID = self->_mediaRouteID;
                                                        v104 = v102;
                                                        v105 = mediaRouteID;
                                                        if (v104 == v105)
                                                        {

                                                          goto LABEL_149;
                                                        }
                                                        v106 = v105;
                                                        if ((v104 == 0) != (v105 != 0))
                                                        {
                                                          v107 = -[NSString isEqual:](v104, "isEqual:", v105);

                                                          if ((v107 & 1) != 0)
                                                          {
LABEL_149:
                                                            CFStringGetTypeID();
                                                            CFDictionaryGetTypedValue();
                                                            v108 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v173 = v108;
                                                            if (!objc_msgSend(v108, "length"))
                                                              goto LABEL_157;
                                                            model = self->_model;
                                                            v110 = v108;
                                                            v111 = model;
                                                            if (v110 == v111)
                                                            {

                                                              goto LABEL_157;
                                                            }
                                                            v112 = v111;
                                                            if ((v110 == 0) != (v111 != 0))
                                                            {
                                                              v113 = -[NSString isEqual:](v110, "isEqual:", v111);

                                                              if ((v113 & 1) != 0)
                                                              {
LABEL_157:
                                                                objc_msgSend(v91, "name");
                                                                v114 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (!objc_msgSend(v114, "length"))
                                                                  goto LABEL_165;
                                                                name = self->_name;
                                                                v116 = v114;
                                                                v117 = name;
                                                                if (v116 == v117)
                                                                {

                                                                  goto LABEL_165;
                                                                }
                                                                v118 = v117;
                                                                if ((v116 == 0) != (v117 != 0))
                                                                {
                                                                  v119 = -[NSString isEqual:](v116, "isEqual:", v117);

                                                                  if ((v119 & 1) != 0)
                                                                  {
LABEL_165:
                                                                    self->_revisionID = CFDictionaryGetInt64Ranged();
                                                                    CFStringGetTypeID();
                                                                    CFDictionaryGetTypedValue();
                                                                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v159 = v114;
                                                                    v172 = v120;
                                                                    if (!objc_msgSend(v120, "length"))
                                                                      goto LABEL_173;
                                                                    sendersKnownAlias = self->_sendersKnownAlias;
                                                                    v122 = v120;
                                                                    v123 = sendersKnownAlias;
                                                                    if (v122 == v123)
                                                                    {

                                                                      goto LABEL_173;
                                                                    }
                                                                    v124 = v123;
                                                                    if ((v122 == 0) != (v123 != 0))
                                                                    {
                                                                      v125 = -[NSString isEqual:](v122, "isEqual:", v123);

                                                                      if ((v125 & 1) != 0)
                                                                      {
LABEL_173:
                                                                        objc_opt_class();
                                                                        NSDictionaryGetNSArrayOfClass();
                                                                        v126 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
                                                                        v128 = v126;
                                                                        v129 = allUsedSendersKnownAliases;
                                                                        if (v128 == v129)
                                                                        {

                                                                          goto LABEL_180;
                                                                        }
                                                                        v130 = v129;
                                                                        if ((v128 == 0) != (v129 != 0))
                                                                        {
                                                                          v131 = -[NSArray isEqual:](v128, "isEqual:", v129);

                                                                          if ((v131 & 1) != 0)
                                                                          {
LABEL_180:
                                                                            v132 = CFDictionaryGetInt64() != 0;
                                                                            if (self->_userAdded != v132)
                                                                            {
                                                                              self->_userAdded = v132;
                                                                              v15 |= 0x4000u;
                                                                            }
                                                                            CFDictionaryGetCFDataOfLength();
                                                                            v133 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v134 = v133;
                                                                            if (!v133)
                                                                            {
LABEL_191:
                                                                              CFDictionaryGetCFDataOfLength();
                                                                              v142 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v143 = v142;
                                                                              if (v142)
                                                                              {
                                                                                btAddress = self->_btAddress;
                                                                                p_btAddress = &self->_btAddress;
                                                                                v146 = v142;
                                                                                v147 = btAddress;
                                                                                if (v146 != v147)
                                                                                {
                                                                                  v148 = v147;
                                                                                  v158 = v90;
                                                                                  v149 = v15;
                                                                                  v150 = v7;
                                                                                  v151 = v25;
                                                                                  if (v147)
                                                                                  {
                                                                                    v152 = -[NSData isEqual:](v146, "isEqual:", v147);

                                                                                    if ((v152 & 1) != 0)
                                                                                      goto LABEL_200;
                                                                                  }
                                                                                  else
                                                                                  {

                                                                                  }
                                                                                  objc_storeStrong((id *)p_btAddress, v143);
                                                                                  v149 |= 0x800000u;
LABEL_200:
                                                                                  v25 = v151;
                                                                                  v7 = v150;
                                                                                  v15 = v149;
                                                                                  v154 = v170;
                                                                                  v153 = obj;
                                                                                  v90 = v158;
                                                                                  goto LABEL_201;
                                                                                }

                                                                              }
                                                                              v154 = v170;
                                                                              v153 = obj;
LABEL_201:

                                                                              v6 = v176;
                                                                              v9 = v163;
                                                                              goto LABEL_202;
                                                                            }
                                                                            btIRKData = self->_btIRKData;
                                                                            v136 = v133;
                                                                            v137 = btIRKData;
                                                                            if (v136 == v137)
                                                                            {

                                                                              goto LABEL_191;
                                                                            }
                                                                            v138 = v137;
                                                                            v157 = v90;
                                                                            v139 = v7;
                                                                            v140 = v25;
                                                                            if (v137)
                                                                            {
                                                                              v141 = -[NSData isEqual:](v136, "isEqual:", v137);

                                                                              if ((v141 & 1) != 0)
                                                                                goto LABEL_190;
                                                                            }
                                                                            else
                                                                            {

                                                                            }
                                                                            objc_storeStrong((id *)&self->_btIRKData, v134);
                                                                            v15 |= 0x400000u;
LABEL_190:
                                                                            v25 = v140;
                                                                            v7 = v139;
                                                                            v90 = v157;
                                                                            goto LABEL_191;
                                                                          }
                                                                        }
                                                                        else
                                                                        {

                                                                        }
                                                                        objc_storeStrong((id *)&self->_allUsedSendersKnownAliases, v126);
                                                                        v15 |= 0x1000000u;
                                                                        goto LABEL_180;
                                                                      }
                                                                    }
                                                                    else
                                                                    {

                                                                    }
                                                                    objc_storeStrong((id *)&self->_sendersKnownAlias, v172);
                                                                    v15 |= 0x40000u;
                                                                    goto LABEL_173;
                                                                  }
                                                                }
                                                                else
                                                                {

                                                                }
                                                                objc_storeStrong((id *)&self->_name, v114);
                                                                v15 |= 0x100u;
                                                                goto LABEL_165;
                                                              }
                                                            }
                                                            else
                                                            {

                                                            }
                                                            objc_storeStrong((id *)&self->_model, v173);
                                                            v15 |= 0x80u;
                                                            goto LABEL_157;
                                                          }
                                                        }
                                                        else
                                                        {

                                                        }
                                                        objc_storeStrong((id *)&self->_mediaRouteID, v175);
                                                        v15 |= 0x20000u;
                                                        goto LABEL_149;
                                                      }
                                                    }
                                                    else
                                                    {

                                                    }
                                                    objc_storeStrong((id *)&self->_mediaRemoteID, v169);
                                                    v15 |= 0x10000u;
                                                    goto LABEL_141;
                                                  }
                                                }
                                                else
                                                {

                                                }
                                                objc_storeStrong((id *)&self->_idsDeviceID, v89);
                                                v15 |= 0x40u;
                                                goto LABEL_133;
                                              }
                                            }
                                            else
                                            {

                                            }
                                            objc_storeStrong((id *)&self->_edSKData, v164);
                                            v15 |= 0x10u;
                                            goto LABEL_119;
                                          }
                                        }
                                        else
                                        {

                                        }
                                        objc_storeStrong((id *)&self->_edPKData, v165);
                                        v15 |= 8u;
                                        goto LABEL_111;
                                      }
                                    }
                                    else
                                    {

                                    }
                                    objc_storeStrong((id *)&self->_deviceIRKData, v166);
                                    v15 |= 4u;
                                    goto LABEL_103;
                                  }
                                }
                                else
                                {

                                }
                                objc_storeStrong((id *)&self->_dateRequested, v64);
                                v15 |= 2u;
                                goto LABEL_95;
                              }
                            }
                            else
                            {

                            }
                            objc_storeStrong((id *)&self->_dateRemoved, v55);
                            v15 |= 2u;
                            goto LABEL_87;
                          }
                        }
                        else
                        {

                        }
                        objc_storeStrong((id *)&self->_dateAdded, v167);
                        v15 |= 2u;
                        goto LABEL_80;
                      }
                    }
                    else
                    {

                    }
                    objc_storeStrong((id *)&self->_dateAcknowledged, v168);
                    v15 |= 2u;
                    goto LABEL_72;
                  }
                }
                else
                {

                }
                objc_storeStrong((id *)&self->_contactID, v170);
                v15 |= 0x8000u;
                goto LABEL_64;
              }
            }
            else
            {

            }
            objc_storeStrong((id *)&self->_accountID, obj);
            v15 |= 0x2000u;
            goto LABEL_56;
          }
        }
        else
        {

        }
        objc_storeStrong((id *)&self->_accountAltDSID, v25);
        v15 |= 0x2000000u;
        goto LABEL_48;
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_accessGroups, v18);
    v15 |= 0x80000u;
    goto LABEL_40;
  }

  if (a4)
  {
    objc_msgSend(v6, "type");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:
  v15 = 1;
LABEL_202:

  return v15;
}

- (unsigned)updateWithRPMessage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSData *v7;
  NSData *v8;
  NSData *v9;
  char v10;
  unsigned int v11;
  void *v12;
  NSData *v13;
  NSData *v14;
  NSData *v15;
  char v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  char v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  char v33;
  void *v34;
  NSData *v35;
  NSData *v36;
  NSData *v37;
  char v38;
  void *v39;
  NSData **p_btAddress;
  NSData *btAddress;
  NSData *v42;
  NSData *v43;
  NSData *v44;
  char v45;

  v5 = a3;
  CFDictionaryGetCFDataOfLength();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  v7 = self->_deviceIRKData;
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  if (v7)
  {
    v10 = -[NSData isEqual:](v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    v11 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_deviceIRKData, v6);
  v11 = 4;
LABEL_10:

  CFDictionaryGetCFDataOfLength();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_18;
  v13 = self->_edPKData;
  v14 = v12;
  v15 = v14;
  if (v13 == v14)
  {

    goto LABEL_18;
  }
  if (!v13)
  {

    goto LABEL_17;
  }
  v16 = -[NSData isEqual:](v13, "isEqual:", v14);

  if ((v16 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_edPKData, v12);
    v11 |= 8u;
  }
LABEL_18:

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = self->_idsDeviceID;
    v19 = v17;
    v20 = v19;
    if (v18 == v19)
    {

    }
    else
    {
      if (v18)
      {
        v21 = -[NSString isEqual:](v18, "isEqual:", v19);

        if ((v21 & 1) != 0)
          goto LABEL_26;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_idsDeviceID, v17);
      v11 |= 0x40u;
    }
  }
LABEL_26:

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22 && objc_msgSend(v22, "length"))
  {
    v24 = self->_model;
    v25 = v23;
    v26 = v25;
    if (v24 == v25)
    {

    }
    else
    {
      if (v24)
      {
        v27 = -[NSString isEqual:](v24, "isEqual:", v25);

        if ((v27 & 1) != 0)
          goto LABEL_35;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_model, v23);
      v11 |= 0x80u;
    }
  }
LABEL_35:

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28 && objc_msgSend(v28, "length"))
  {
    v30 = self->_name;
    v31 = v29;
    v32 = v31;
    if (v30 == v31)
    {

      goto LABEL_44;
    }
    if (v30)
    {
      v33 = -[NSString isEqual:](v30, "isEqual:", v31);

      if ((v33 & 1) != 0)
        goto LABEL_44;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_name, v29);
    v11 |= 0x100u;
  }
LABEL_44:

  CFDictionaryGetCFDataOfLength();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34)
    goto LABEL_52;
  v35 = self->_btIRKData;
  v36 = v34;
  v37 = v36;
  if (v35 == v36)
  {

    goto LABEL_52;
  }
  if (!v35)
  {

    goto LABEL_51;
  }
  v38 = -[NSData isEqual:](v35, "isEqual:", v36);

  if ((v38 & 1) == 0)
  {
LABEL_51:
    objc_storeStrong((id *)&self->_btIRKData, v34);
    v11 |= 0x400000u;
  }
LABEL_52:

  CFDictionaryGetCFDataOfLength();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    btAddress = self->_btAddress;
    p_btAddress = &self->_btAddress;
    v42 = btAddress;
    v43 = v39;
    v44 = v43;
    if (v42 == v43)
    {

    }
    else
    {
      if (v42)
      {
        v45 = -[NSData isEqual:](v42, "isEqual:", v43);

        if ((v45 & 1) != 0)
          goto LABEL_60;
      }
      else
      {

      }
      objc_storeStrong((id *)p_btAddress, v39);
      v11 |= 0x800000u;
    }
  }
LABEL_60:

  return v11;
}

- (BOOL)verifyAuthTag:(id)a3 data:(id)a4 type:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v7 = *(_QWORD *)&a5;
  v10 = objc_retainAutorelease(a3);
  v11 = a4;
  v12 = v10;
  v13 = objc_msgSend(v12, "bytes");
  v14 = objc_msgSend(v12, "length");

  v15 = objc_retainAutorelease(v11);
  v16 = objc_msgSend(v15, "bytes");
  v17 = objc_msgSend(v15, "length");

  return -[RPIdentity verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:](self, "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:", v13, v14, v16, v17, v7, a6);
}

- (BOOL)verifyAuthTagPtr:(const void *)a3 authTagLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 type:(int)a7 error:(id *)a8
{
  NSData *v12;
  NSData *v13;
  uint64_t v14;
  int v15;
  unsigned __int8 *v16;
  int v17;
  int v18;
  int v19;
  BOOL v20;
  _BYTE v22[6];

  v12 = self->_deviceIRKData;
  v13 = v12;
  if (!v12)
  {
    if (a8)
      goto LABEL_15;
    goto LABEL_17;
  }
  if (-[NSData length](v12, "length") != 16)
  {
    if (a8)
      goto LABEL_15;
    goto LABEL_17;
  }
  -[NSData bytes](objc_retainAutorelease(v13), "bytes");
  v14 = SipHash();
  v22[0] = BYTE5(v14);
  v22[1] = BYTE4(v14);
  v22[2] = BYTE3(v14);
  v22[3] = BYTE2(v14);
  v22[4] = BYTE1(v14);
  v22[5] = v14;
  if ((a7 - 1) >= 4)
  {
    if (a8)
      goto LABEL_15;
LABEL_17:
    v20 = 0;
    goto LABEL_18;
  }
  if (qword_1AF307830[a7 - 1] != a4)
  {
    if (!a8)
      goto LABEL_17;
LABEL_15:
    RPErrorF();
    v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v15 = 0;
  v16 = v22;
  do
  {
    v18 = *(unsigned __int8 *)a3;
    a3 = (char *)a3 + 1;
    v17 = v18;
    v19 = *v16++;
    v15 |= v19 ^ v17;
    --a4;
  }
  while (a4);
  v20 = v15 == 0;
  if (a8 && v15)
    goto LABEL_15;
LABEL_18:

  return v20;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[64];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  if (-[RPIdentity signDataPtr:dataLen:signatureBytes:error:](self, "signDataPtr:dataLen:signatureBytes:error:", v7, v8, v10, a4))
  {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v10, 64);
  }
  else
  {
    return 0;
  }
}

- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6
{
  NSData *v8;
  NSData *v9;
  uint64_t v10;
  BOOL v11;

  v8 = self->_edPKData;
  if (-[NSData length](v8, "length") == 32)
  {
    v9 = self->_edSKData;
    v10 = -[NSData length](v9, "length");
    v11 = v10 == 32;
    if (v10 == 32)
    {
      -[NSData bytes](objc_retainAutorelease(v8), "bytes");
      -[NSData bytes](objc_retainAutorelease(v9), "bytes");
      cced25519_sign_compat();
    }
    else if (a6)
    {
      RPErrorF();
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a6)
  {
    RPErrorF();
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v8 = objc_retainAutorelease(a3);
  v9 = a4;
  v10 = v8;
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");

  v13 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  return -[RPIdentity verifySignaturePtr:signatureLen:dataPtr:dataLen:error:](self, "verifySignaturePtr:signatureLen:dataPtr:dataLen:error:", v11, v12, v14, v15, a5);
}

- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7
{
  NSData *v8;
  int v9;
  BOOL v10;

  if (a4 == 64)
  {
    v8 = self->_edPKData;
    if (-[NSData length](v8, "length") == 32)
    {
      -[NSData bytes](objc_retainAutorelease(v8), "bytes");
      v9 = cced25519_verify_compat();
      v10 = v9 == 0;
      if (!a7 || !v9)
        goto LABEL_12;
    }
    else if (!a7)
    {
      v10 = 0;
      goto LABEL_12;
    }
    RPErrorF();
    v10 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v10;
  }
  if (!a7)
    return 0;
  RPErrorF();
  v10 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (NSArray)accessGroups
{
  return self->_accessGroups;
}

- (void)setAccessGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)dateRemoved
{
  return self->_dateRemoved;
}

- (void)setDateRemoved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)deviceIRKData
{
  return self->_deviceIRKData;
}

- (NSData)edPKData
{
  return self->_edPKData;
}

- (void)setEdPKData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)edSKData
{
  return self->_edSKData;
}

- (void)setEdSKData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(unint64_t)a3
{
  self->_featureFlags = a3;
}

- (NSUUID)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setHomeKitUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void)setMediaRemoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (void)setMediaRouteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)sendersKnownAlias
{
  return self->_sendersKnownAlias;
}

- (void)setSendersKnownAlias:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)allUsedSendersKnownAliases
{
  return self->_allUsedSendersKnownAliases;
}

- (void)setAllUsedSendersKnownAliases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)userAdded
{
  return self->_userAdded;
}

- (void)setUserAdded:(BOOL)a3
{
  self->_userAdded = a3;
}

- (NSData)btIRKData
{
  return self->_btIRKData;
}

- (void)setBtIRKData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSData)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)dateAcknowledged
{
  return self->_dateAcknowledged;
}

- (void)setDateAcknowledged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSDate)dateRequested
{
  return self->_dateRequested;
}

- (void)setDateRequested:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (unint64_t)disabledUntilTicks
{
  return self->_disabledUntilTicks;
}

- (void)setDisabledUntilTicks:(unint64_t)a3
{
  self->_disabledUntilTicks = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (unsigned)revisionID
{
  return self->_revisionID;
}

- (void)setRevisionID:(unsigned int)a3
{
  self->_revisionID = a3;
}

@end
