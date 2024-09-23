@implementation PKPassEntitlementCapabilitySet

- (PKPassEntitlementCapabilitySet)init
{

  return 0;
}

- (PKPassEntitlementCapabilitySet)initWithLocalizedName:(id)a3 shareability:(unint64_t)a4 manageability:(unint64_t)a5 visibility:(unint64_t)a6
{
  id v11;
  PKPassEntitlementCapabilitySet *v12;
  PKPassEntitlementCapabilitySet *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassEntitlementCapabilitySet;
  v12 = -[PKPassEntitlementCapabilitySet init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localizedName, a3);
    v13->_shareability = a4;
    v13->_manageability = a5;
    v13->_visibility = a6;
  }

  return v13;
}

- (PKPassEntitlementCapabilitySet)initWithRole:(id)a3
{
  id v4;
  void *v5;
  PKPassEntitlementCapabilitySet *v6;
  unsigned __int16 v8;

  v4 = a3;
  if (objc_msgSend(v4, "length") == 4)
  {
    v8 = 0;
    objc_msgSend(v4, "pk_decodeHexadecimal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getBytes:length:", &v8, 2);

    v8 = bswap32(v8) >> 16;
    self = -[PKPassEntitlementCapabilitySet initWithIntRole:](self, "initWithIntRole:");
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PKPassEntitlementCapabilitySet)initWithIntRole:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKPassEntitlementCapabilitySet *v10;
  PKPassEntitlementCapabilitySet *v11;
  uint64_t shareability;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  NSNumber *capabilityRoleValue;

  v3 = a3;
  v4 = 3;
  v5 = 2;
  if ((a3 & 2) == 0)
    v5 = a3 & 1;
  if ((~a3 & 3) != 0)
    v4 = v5;
  if ((~a3 & 7) != 0)
    v6 = v4;
  else
    v6 = 999;
  if ((a3 & 0x80) != 0)
    v7 = 2;
  else
    v7 = 1;
  if ((~a3 & 0x90) != 0)
    v8 = v7;
  else
    v8 = -1;
  if ((a3 & 0x800) != 0)
    v9 = 2;
  else
    v9 = 1;
  v10 = -[PKPassEntitlementCapabilitySet initWithLocalizedName:shareability:manageability:visibility:](self, "initWithLocalizedName:shareability:manageability:visibility:", &stru_1E2ADF4C0, v6, v8, v9);
  v11 = v10;
  if (v10)
  {
    shareability = v10->_shareability;
    if (shareability == 999)
      v13 = 15;
    else
      v13 = 8;
    if (shareability == 3)
      v14 = 11;
    else
      v14 = v13;
    if (shareability == 2)
      v15 = 10;
    else
      v15 = 8;
    if (shareability == 1)
      v15 = 9;
    if (shareability <= 2)
      v16 = v15;
    else
      v16 = v14;
    v10->_intraAccountSharingEnabled = (v16 & ~(_DWORD)v3) == 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
    v17 = objc_claimAutoreleasedReturnValue();
    capabilityRoleValue = v11->_capabilityRoleValue;
    v11->_capabilityRoleValue = (NSNumber *)v17;

  }
  return v11;
}

- (id)_initWithLocalizationKey:(id)a3 shareability:(unint64_t)a4 manageability:(unint64_t)a5 visibility:(unint64_t)a6
{
  void *v10;
  PKPassEntitlementCapabilitySet *v11;

  PKLocalizedShareableCredentialString((NSString *)a3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKPassEntitlementCapabilitySet initWithLocalizedName:shareability:manageability:visibility:](self, "initWithLocalizedName:shareability:manageability:visibility:", v10, a4, a5, a6);

  return v11;
}

+ (id)predefinedSets
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[PKPassEntitlementCapabilitySet _initWithLocalizationKey:shareability:manageability:visibility:]([PKPassEntitlementCapabilitySet alloc], "_initWithLocalizationKey:shareability:manageability:visibility:", CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_OWNER"), 999, -1, 2);
  objc_msgSend(v2, "addObject:", v3);

  v4 = -[PKPassEntitlementCapabilitySet _initWithLocalizationKey:shareability:manageability:visibility:]([PKPassEntitlementCapabilitySet alloc], "_initWithLocalizationKey:shareability:manageability:visibility:", CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_SUPER_ADMIN"), 999, -1, 2);
  objc_msgSend(v2, "addObject:", v4);

  v5 = -[PKPassEntitlementCapabilitySet _initWithLocalizationKey:shareability:manageability:visibility:]([PKPassEntitlementCapabilitySet alloc], "_initWithLocalizationKey:shareability:manageability:visibility:", CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_ADMIN"), 2, 2, 2);
  objc_msgSend(v2, "addObject:", v5);

  v6 = -[PKPassEntitlementCapabilitySet _initWithLocalizationKey:shareability:manageability:visibility:]([PKPassEntitlementCapabilitySet alloc], "_initWithLocalizationKey:shareability:manageability:visibility:", CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_FAMILY"), 2, 1, 2);
  objc_msgSend(v2, "addObject:", v6);

  v7 = -[PKPassEntitlementCapabilitySet _initWithLocalizationKey:shareability:manageability:visibility:]([PKPassEntitlementCapabilitySet alloc], "_initWithLocalizationKey:shareability:manageability:visibility:", CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_FRIEND"), 1, 1, 1);
  objc_msgSend(v2, "addObject:", v7);

  v8 = -[PKPassEntitlementCapabilitySet _initWithLocalizationKey:shareability:manageability:visibility:]([PKPassEntitlementCapabilitySet alloc], "_initWithLocalizationKey:shareability:manageability:visibility:", CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_GUEST"), 0, 1, 1);
  objc_msgSend(v2, "addObject:", v8);

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

- (id)mutableCopy
{
  NSNumber *capabilityRoleValue;
  PKMutablePassEntitlementCapabilitySet *v4;
  PKMutablePassEntitlementCapabilitySet *v5;
  void *v6;

  capabilityRoleValue = self->_capabilityRoleValue;
  v4 = [PKMutablePassEntitlementCapabilitySet alloc];
  if (!capabilityRoleValue)
    return -[PKPassEntitlementCapabilitySet initWithLocalizedName:shareability:manageability:visibility:](v4, "initWithLocalizedName:shareability:manageability:visibility:", self->_localizedName, self->_shareability, self->_manageability, self->_visibility);
  v5 = -[PKPassEntitlementCapabilitySet initWithIntRole:](v4, "initWithIntRole:", -[NSNumber unsignedShortValue](self->_capabilityRoleValue, "unsignedShortValue"));
  v6 = (void *)-[NSString copy](self->_localizedName, "copy");
  -[PKPassEntitlementCapabilitySet setLocalizedName:](v5, "setLocalizedName:", v6);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassEntitlementCapabilitySet *v4;
  uint64_t v5;
  NSString *localizedName;

  v4 = [PKPassEntitlementCapabilitySet alloc];
  v5 = -[NSString copy](self->_localizedName, "copy");
  localizedName = v4->_localizedName;
  v4->_localizedName = (NSString *)v5;

  v4->_shareability = self->_shareability;
  v4->_manageability = self->_manageability;
  v4->_visibility = self->_visibility;
  v4->_intraAccountSharingEnabled = self->_intraAccountSharingEnabled;
  objc_storeStrong((id *)&v4->_capabilityRoleValue, self->_capabilityRoleValue);
  return v4;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (unint64_t)shareability
{
  return self->_shareability;
}

- (void)setShareability:(unint64_t)a3
{
  self->_shareability = a3;
}

- (unint64_t)manageability
{
  return self->_manageability;
}

- (void)setManageability:(unint64_t)a3
{
  self->_manageability = a3;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(unint64_t)a3
{
  self->_visibility = a3;
}

- (BOOL)intraAccountSharingEnabled
{
  return self->_intraAccountSharingEnabled;
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  self->_intraAccountSharingEnabled = a3;
}

- (NSNumber)capabilityRoleValue
{
  return self->_capabilityRoleValue;
}

- (void)setCapabilityRoleValue:(id)a3
{
  objc_storeStrong((id *)&self->_capabilityRoleValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityRoleValue, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
