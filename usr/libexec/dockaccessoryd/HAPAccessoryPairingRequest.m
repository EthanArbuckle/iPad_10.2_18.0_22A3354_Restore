@implementation HAPAccessoryPairingRequest

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;

  v4 = a3;
  v6 = objc_opt_class(HAPAccessoryPairingRequest, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  if (!v8)
    goto LABEL_12;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pairingIdentity"));
  v11 = HMFEqualObjects(v9, v10);

  if (!v11)
    goto LABEL_12;
  v12 = -[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent");
  if (v12 != objc_msgSend(v8, "requiresUserConsent"))
    goto LABEL_12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ownershipToken"));
  v15 = HMFEqualObjects(v13, v14);

  if (!v15)
    goto LABEL_12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ssid](self, "ssid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ssid"));
  v18 = HMFEqualObjects(v16, v17);

  if (!v18)
    goto LABEL_12;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest psk](self, "psk"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "psk"));
  v21 = HMFEqualObjects(v19, v20);

  if (!v21)
    goto LABEL_12;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "isoCountryCode"));
  v24 = HMFEqualObjects(v22, v23);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest chipFabricIndex](self, "chipFabricIndex"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chipFabricIndex"));
    v27 = HMFEqualObjects(v25, v26);

  }
  else
  {
LABEL_12:
    v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");

  v5 = -[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken"));
  v7 = v4 ^ (unint64_t)objc_msgSend(v6, "hash") ^ v5;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ssid](self, "ssid"));
  v9 = (unint64_t)objc_msgSend(v8, "hash");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest psk](self, "psk"));
  v11 = v9 ^ (unint64_t)objc_msgSend(v10, "hash");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode"));
  v13 = v7 ^ v11 ^ (unint64_t)objc_msgSend(v12, "hash");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest chipFabricIndex](self, "chipFabricIndex"));
  v15 = v13 ^ (unint64_t)objc_msgSend(v14, "hash");

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HAPAccessoryPairingRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[HAPAccessoryPairingRequest init](+[HAPAccessoryPairingRequest allocWithZone:](HAPAccessoryPairingRequest, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity"));
  -[HAPAccessoryPairingRequest setPairingIdentity:](v4, "setPairingIdentity:", v5);

  -[HAPAccessoryPairingRequest setRequiresUserConsent:](v4, "setRequiresUserConsent:", -[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken"));
  -[HAPAccessoryPairingRequest setOwnershipToken:](v4, "setOwnershipToken:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ssid](self, "ssid"));
  -[HAPAccessoryPairingRequest setSsid:](v4, "setSsid:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest psk](self, "psk"));
  -[HAPAccessoryPairingRequest setPsk:](v4, "setPsk:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode"));
  -[HAPAccessoryPairingRequest setIsoCountryCode:](v4, "setIsoCountryCode:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest chipFabricIndex](self, "chipFabricIndex"));
  -[HAPAccessoryPairingRequest setChipFabricIndex:](v4, "setChipFabricIndex:", v10);

  return v4;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity"));

  if (v4)
  {
    v5 = objc_alloc((Class)HMFAttributeDescription);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest pairingIdentity](self, "pairingIdentity"));
    v7 = objc_msgSend(v5, "initWithName:value:", CFSTR("Pairing Identity"), v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent"))
  {
    v8 = objc_alloc((Class)HMFAttributeDescription);
    v9 = HMFBooleanToString(-[HAPAccessoryPairingRequest requiresUserConsent](self, "requiresUserConsent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "initWithName:value:", CFSTR("Requires User Consent"), v10);
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken"));

  if (v12)
  {
    v13 = objc_alloc((Class)HMFAttributeDescription);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ownershipToken](self, "ownershipToken"));
    v15 = objc_msgSend(v13, "initWithName:value:", CFSTR("Ownership Token"), v14);
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ssid](self, "ssid"));

  if (v16)
  {
    v17 = objc_alloc((Class)HMFAttributeDescription);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest ssid](self, "ssid"));
    v19 = objc_msgSend(v17, "initWithName:value:", CFSTR("SSID"), v18);
    objc_msgSend(v3, "addObject:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest psk](self, "psk"));

  if (v20)
  {
    v21 = objc_alloc((Class)HMFAttributeDescription);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest psk](self, "psk"));
    v23 = objc_msgSend(v21, "initWithName:value:", CFSTR("PSK"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode"));

  if (v24)
  {
    v25 = objc_alloc((Class)HMFAttributeDescription);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest isoCountryCode](self, "isoCountryCode"));
    v27 = objc_msgSend(v25, "initWithName:value:", CFSTR("ISO Country Code"), v26);
    objc_msgSend(v3, "addObject:", v27);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest chipFabricIndex](self, "chipFabricIndex"));

  if (v28)
  {
    v29 = objc_alloc((Class)HMFAttributeDescription);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryPairingRequest chipFabricIndex](self, "chipFabricIndex"));
    v31 = objc_msgSend(v29, "initWithName:value:", CFSTR("CHIP Fabric Index"), v30);
    objc_msgSend(v3, "addObject:", v31);

  }
  v32 = objc_msgSend(v3, "copy");

  return v32;
}

- (HAPPairingIdentity)pairingIdentity
{
  return (HAPPairingIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingIdentity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSData)ownershipToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOwnershipToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)ssid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSsid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)psk
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPsk:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)chipFabricIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChipFabricIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipFabricIndex, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

@end
