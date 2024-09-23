@implementation PKSEConsistencyCheckDeviceCredential

- (PKSEConsistencyCheckDeviceCredential)init
{

  return 0;
}

- (PKSEConsistencyCheckDeviceCredential)initWithType:(unint64_t)a3 state:(unint64_t)a4 underlyingCredentialState:(id)a5 address:(id)a6
{
  id v11;
  id v12;
  PKSEConsistencyCheckDeviceCredential *v13;
  PKSEConsistencyCheckDeviceCredential *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKSEConsistencyCheckDeviceCredential;
  v13 = -[PKSEConsistencyCheckDeviceCredential init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_state = a4;
    objc_storeStrong((id *)&v13->_underlyingCredentialState, a5);
    objc_storeStrong((id *)&v14->_address, a6);
  }

  return v14;
}

+ (id)deviceCredentialWithISOCredentialProperties:(id)a3 hasKeyMeterial:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  int v15;
  void *v16;
  __CFString *v17;
  PKSECredentialAddress *v18;
  const __CFString *v19;
  PKSECredentialAddress *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  PKSEConsistencyCheckDeviceCredential *v24;
  void *v25;
  PKSEConsistencyCheckDeviceCredential *v26;
  PKSEConsistencyCheckDeviceCredentialISO18013Properties *v27;
  id v28;
  PKSEConsistencyCheckDeviceCredentialISO18013Properties *v29;
  PKSEConsistencyCheckDeviceCredentialISO18013Properties *isoProperties;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  NSData *keyMaterialHash;
  objc_super v40;

  v4 = a3;
  objc_msgSend(v4, "credentialIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentmentKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hexEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "partition");
  v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("identity");
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  v13 = v12;
  if (v11 && v12)
  {
    v14 = -[__CFString isEqualToString:](v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_9;
LABEL_7:
    v15 = 1;
    v16 = v5;
    goto LABEL_10;
  }

LABEL_9:
  v15 = 0;
  v16 = v10;
LABEL_10:
  v17 = v16;
  v18 = [PKSECredentialAddress alloc];
  if (v17)
    v19 = v17;
  else
    v19 = CFSTR("null");
  v20 = -[PKSECredentialAddress initWithType:identifier:](v18, "initWithType:identifier:", 1, v19);
  v21 = objc_msgSend(v4, "credentialState");
  v22 = v21;
  if (v21 > 3)
    v23 = 0;
  else
    v23 = qword_190453E10[v21];
  v24 = [PKSEConsistencyCheckDeviceCredential alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PKSEConsistencyCheckDeviceCredential initWithType:state:underlyingCredentialState:address:](v24, "initWithType:state:underlyingCredentialState:address:", 2, v23, v25, v20);

  if (v26)
  {
    v27 = [PKSEConsistencyCheckDeviceCredentialISO18013Properties alloc];
    v28 = v5;
    if (v27)
    {
      v40.receiver = v27;
      v40.super_class = (Class)PKSEConsistencyCheckDeviceCredentialISO18013Properties;
      v29 = objc_msgSendSuper2(&v40, sel_init);
      v27 = v29;
      if (v29)
      {
        v29->_hasKeyMeterial = a4;
        objc_storeStrong((id *)&v29->_isoIdentifier, v5);
      }
    }

    isoProperties = v26->_isoProperties;
    v26->_isoProperties = v27;

    if (!v15)
    {
      v35 = 130;
LABEL_32:
      -[PKSEConsistencyCheckDeviceCredential setCredentialType:](v26, "setCredentialType:", v35);
      objc_msgSend(v4, "payloadIngestionHash");
      v36 = objc_claimAutoreleasedReturnValue();
      keyMaterialHash = v26->_keyMaterialHash;
      v26->_keyMaterialHash = (NSData *)v36;

      goto LABEL_33;
    }
    objc_msgSend(v4, "docType");
    v31 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("org.iso.23220.1.jp.mnc");
    if (v31 == v32)
    {

    }
    else
    {
      v33 = v32;
      if (!v31 || !v32)
      {

LABEL_30:
        v35 = 129;
        goto LABEL_31;
      }
      v34 = -[__CFString isEqualToString:](v31, "isEqualToString:", v32);

      if (!v34)
        goto LABEL_30;
    }
    v35 = 138;
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:

  return v26;
}

+ (id)deviceCredentialWithDAKeyInformation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKSECredentialAddress *v18;
  PKSEConsistencyCheckDeviceCredential *v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  switch(objc_msgSend(v3, "keyType"))
  {
    case 1:
      objc_msgSend(v3, "alishaKeyInformation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "revocationAttestation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v9 = 2;
        v10 = 129;
      }
      else
      {
        objc_msgSend(v4, "trackingReceipt");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          v10 = 15;
        else
          v10 = 21;
        if (v15)
          v9 = 1;
        else
          v9 = 4;
      }
      objc_msgSend(v4, "trackingRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v16 != 0;

      v7 = CFSTR("A000000809434343444B417631");
      v11 = 301;
      goto LABEL_14;
    case 2:
    case 4:
      objc_msgSend(v3, "hydraKeyInformation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appletIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hexEncoding");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uppercaseString");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v8 = 0;
      v9 = 1;
      v10 = 21;
      v11 = 130;
      goto LABEL_14;
    case 3:
    case 5:
      objc_msgSend(v3, "homeKeyInformation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appletIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hexEncoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uppercaseString");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v8 = 0;
      v9 = 1;
      v10 = 21;
      v11 = 133;
LABEL_14:

      break;
    default:
      v8 = 0;
      v7 = 0;
      v11 = 0;
      v10 = 0;
      v9 = 0;
      break;
  }
  objc_msgSend(v3, "publicKeyIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PKSECredentialAddress initWithType:identifier:]([PKSECredentialAddress alloc], "initWithType:identifier:", 0, v7);
  -[PKSECredentialAddress appendType:identifier:](v18, "appendType:identifier:", 1, v17);
  v19 = [PKSEConsistencyCheckDeviceCredential alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PKSEConsistencyCheckDeviceCredential initWithType:state:underlyingCredentialState:address:](v19, "initWithType:state:underlyingCredentialState:address:", 1, v9, v20, v18);

  if (v21)
  {
    *(_QWORD *)(v21 + 56) = v11;
    *(_BYTE *)(v21 + 8) = v8;
  }

  return (id)v21;
}

+ (id)deviceCredentialWithApplet:(id)a3
{
  id v3;
  PKSECredentialAddress *v4;
  void *v5;
  PKSECredentialAddress *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKSEConsistencyCheckDeviceCredential *v14;
  void *v15;
  PKSEConsistencyCheckDeviceCredential *v16;
  PKSEConsistencyCheckDeviceCredentialAppletProperties *v17;
  char v18;
  char v19;
  char v20;
  PKSEConsistencyCheckDeviceCredentialAppletProperties *v21;
  PKSEConsistencyCheckDeviceCredentialAppletProperties *appletProperties;
  objc_super v24;

  v3 = a3;
  v4 = [PKSECredentialAddress alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKSECredentialAddress initWithType:identifier:](v4, "initWithType:identifier:", 0, v5);

  v7 = objc_msgSend(v3, "lifecycleState");
  v8 = v7;
  if (v7 <= 14)
  {
    if (v7 == 1 || v7 == 3 || v7 == 7)
      v13 = 5;
    else
      v13 = 0;
  }
  else
  {
    v9 = 2;
    v10 = 6;
    if (v7 != 130)
      v10 = 0;
    if (v7 != 129)
      v9 = v10;
    v11 = 1;
    v12 = 4;
    if (v7 != 23)
      v12 = 0;
    if (v7 != 15)
      v11 = v12;
    if (v7 <= 128)
      v13 = v11;
    else
      v13 = v9;
  }
  v14 = [PKSEConsistencyCheckDeviceCredential alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKSEConsistencyCheckDeviceCredential initWithType:state:underlyingCredentialState:address:](v14, "initWithType:state:underlyingCredentialState:address:", 0, v13, v15, v6);

  if (v16)
  {
    v17 = [PKSEConsistencyCheckDeviceCredentialAppletProperties alloc];
    v18 = objc_msgSend(v3, "isLocked");
    v19 = objc_msgSend(v3, "containsSubKeys");
    if (v17)
    {
      v20 = v19;
      v24.receiver = v17;
      v24.super_class = (Class)PKSEConsistencyCheckDeviceCredentialAppletProperties;
      v21 = objc_msgSendSuper2(&v24, sel_init);
      if (v21)
      {
        v21->_locked = v18;
        v21->_container = v20;
      }
    }
    else
    {
      v21 = 0;
    }
    appletProperties = v16->_appletProperties;
    v16->_appletProperties = v21;

  }
  return v16;
}

- (id)description
{
  unint64_t type;
  __CFString *v4;
  void *v5;
  void *v6;
  NSData *keyMaterialHash;
  void *v8;

  type = self->_type;
  if (type > 2)
    v4 = 0;
  else
    v4 = off_1E2AC62A0[type];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("type: '%@'; "), v4);
  objc_msgSend(v5, "appendFormat:", CFSTR("state: '%lu'; "), self->_state);
  objc_msgSend(v5, "appendFormat:", CFSTR("credentialType: '%lu'; "), self->_credentialType);
  objc_msgSend(v5, "appendFormat:", CFSTR("underlyingCredentialState: '%@'; "), self->_underlyingCredentialState);
  -[PKSECredentialAddress shortDescription](self->_address, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("address: '%@'; "), v6);

  if (self->_appletProperties)
    objc_msgSend(v5, "appendFormat:", CFSTR("appletProperties: '%@'; "), self->_appletProperties);
  if (self->_isoProperties)
    objc_msgSend(v5, "appendFormat:", CFSTR("isoProperties: '%@'; "), self->_isoProperties);
  keyMaterialHash = self->_keyMaterialHash;
  if (keyMaterialHash)
  {
    -[NSData base64EncodedStringWithOptions:](keyMaterialHash, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("keyMaterialHash: '%@'; "), v8);

  }
  objc_msgSend(v5, "appendFormat:", CFSTR(">"));
  return v5;
}

- (PKSECredentialAddress)address
{
  return self->_address;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSData)keyMaterialHash
{
  return self->_keyMaterialHash;
}

- (NSNumber)underlyingCredentialState
{
  return self->_underlyingCredentialState;
}

- (void)setUnderlyingCredentialState:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingCredentialState, a3);
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (BOOL)shouldRegister
{
  return self->_shouldRegister;
}

- (PKSEConsistencyCheckDeviceCredentialAppletProperties)appletProperties
{
  return self->_appletProperties;
}

- (void)setAppletProperties:(id)a3
{
  objc_storeStrong((id *)&self->_appletProperties, a3);
}

- (PKSEConsistencyCheckDeviceCredentialISO18013Properties)isoProperties
{
  return self->_isoProperties;
}

- (void)setIsoProperties:(id)a3
{
  objc_storeStrong((id *)&self->_isoProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoProperties, 0);
  objc_storeStrong((id *)&self->_appletProperties, 0);
  objc_storeStrong((id *)&self->_underlyingCredentialState, 0);
  objc_storeStrong((id *)&self->_keyMaterialHash, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
