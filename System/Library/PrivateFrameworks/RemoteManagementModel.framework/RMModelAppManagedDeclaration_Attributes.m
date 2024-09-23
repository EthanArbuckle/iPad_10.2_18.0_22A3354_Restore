@implementation RMModelAppManagedDeclaration_Attributes

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Hideable");
  v6[1] = CFSTR("Lockable");
  v6[2] = CFSTR("AssociatedDomains");
  v6[3] = CFSTR("AssociatedDomainsEnableDirectDownloads");
  v6[4] = CFSTR("CellularSliceUUID");
  v6[5] = CFSTR("ContentFilterUUID");
  v6[6] = CFSTR("DNSProxyUUID");
  v6[7] = CFSTR("RelayUUID");
  v6[8] = CFSTR("TapToPayScreenLock");
  v6[9] = CFSTR("VPNUUID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithHideable:(id)a3 lockable:(id)a4 associatedDomains:(id)a5 associatedDomainsEnableDirectDownloads:(id)a6 cellularSliceUUID:(id)a7 contentFilterUUID:(id)a8 dnsProxyUUID:(id)a9 relayUUID:(id)a10 tapToPayScreenLock:(id)a11 VPNUUID:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v35;
  void *v36;
  id v37;

  v37 = a12;
  v18 = a11;
  v35 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  v27 = v26;
  v28 = (void *)MEMORY[0x24BDBD1C8];
  if (v25)
    v29 = v25;
  else
    v29 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v26, "setPayloadHideable:", v29, v35);

  if (v24)
    v30 = v24;
  else
    v30 = v28;
  objc_msgSend(v27, "setPayloadLockable:", v30);

  objc_msgSend(v27, "setPayloadAssociatedDomains:", v23);
  v31 = (void *)MEMORY[0x24BDBD1C0];
  if (v22)
    v32 = v22;
  else
    v32 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v27, "setPayloadAssociatedDomainsEnableDirectDownloads:", v32);

  objc_msgSend(v27, "setPayloadCellularSliceUUID:", v21);
  objc_msgSend(v27, "setPayloadContentFilterUUID:", v20);

  objc_msgSend(v27, "setPayloadDNSProxyUUID:", v19);
  objc_msgSend(v27, "setPayloadRelayUUID:", v36);

  if (v18)
    v33 = v18;
  else
    v33 = v31;
  objc_msgSend(v27, "setPayloadTapToPayScreenLock:", v33);

  objc_msgSend(v27, "setPayloadVPNUUID:", v37);
  return v27;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelAppManagedDeclaration_Attributes allowedPayloadKeys](RMModelAppManagedDeclaration_Attributes, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Hideable"), CFSTR("payloadHideable"), 0, MEMORY[0x24BDBD1C8], a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("Lockable"), CFSTR("payloadLockable"), 0, MEMORY[0x24BDBD1C8], a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("AssociatedDomains"), CFSTR("payloadAssociatedDomains"), &__block_literal_global_301, 0, 0, a5))
      {
        v13 = 0;
        if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("AssociatedDomainsEnableDirectDownloads"), CFSTR("payloadAssociatedDomainsEnableDirectDownloads"), 0, MEMORY[0x24BDBD1C0], a5))
        {
          v13 = 0;
          if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("CellularSliceUUID"), CFSTR("payloadCellularSliceUUID"), 0, 0, a5))
          {
            v13 = 0;
            if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ContentFilterUUID"), CFSTR("payloadContentFilterUUID"), 0, 0, a5))
            {
              v13 = 0;
              if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("DNSProxyUUID"), CFSTR("payloadDNSProxyUUID"), 0, 0, a5))
              {
                v13 = 0;
                if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("RelayUUID"), CFSTR("payloadRelayUUID"), 0, 0, a5))
                {
                  v13 = 0;
                  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("TapToPayScreenLock"), CFSTR("payloadTapToPayScreenLock"), 0, MEMORY[0x24BDBD1C0], a5))
                  {
                    v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("VPNUUID"), CFSTR("payloadVPNUUID"), 0, 0, a5);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v13;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (void *)objc_opt_new();
  -[RMModelAppManagedDeclaration_Attributes payloadHideable](self, "payloadHideable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C8];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Hideable"), v5, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelAppManagedDeclaration_Attributes payloadLockable](self, "payloadLockable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("Lockable"), v7, 0, v6);

  -[RMModelAppManagedDeclaration_Attributes payloadAssociatedDomains](self, "payloadAssociatedDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AssociatedDomains"), v8, &__block_literal_global_318, 0, 0);

  -[RMModelAppManagedDeclaration_Attributes payloadAssociatedDomainsEnableDirectDownloads](self, "payloadAssociatedDomainsEnableDirectDownloads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("AssociatedDomainsEnableDirectDownloads"), v9, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelAppManagedDeclaration_Attributes payloadCellularSliceUUID](self, "payloadCellularSliceUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("CellularSliceUUID"), v11, 0, 0);

  -[RMModelAppManagedDeclaration_Attributes payloadContentFilterUUID](self, "payloadContentFilterUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ContentFilterUUID"), v12, 0, 0);

  -[RMModelAppManagedDeclaration_Attributes payloadDNSProxyUUID](self, "payloadDNSProxyUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("DNSProxyUUID"), v13, 0, 0);

  -[RMModelAppManagedDeclaration_Attributes payloadRelayUUID](self, "payloadRelayUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("RelayUUID"), v14, 0, 0);

  -[RMModelAppManagedDeclaration_Attributes payloadTapToPayScreenLock](self, "payloadTapToPayScreenLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("TapToPayScreenLock"), v15, 0, v10);

  -[RMModelAppManagedDeclaration_Attributes payloadVPNUUID](self, "payloadVPNUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("VPNUUID"), v16, 0, 0);

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)RMModelAppManagedDeclaration_Attributes;
  v4 = -[RMModelPayloadBase copyWithZone:](&v26, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadHideable, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSNumber copy](self->_payloadLockable, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadAssociatedDomains, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSNumber copy](self->_payloadAssociatedDomainsEnableDirectDownloads, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadCellularSliceUUID, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadContentFilterUUID, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSString copy](self->_payloadDNSProxyUUID, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSString copy](self->_payloadRelayUUID, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadTapToPayScreenLock, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSString copy](self->_payloadVPNUUID, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  return v4;
}

- (NSNumber)payloadHideable
{
  return self->_payloadHideable;
}

- (void)setPayloadHideable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)payloadLockable
{
  return self->_payloadLockable;
}

- (void)setPayloadLockable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadAssociatedDomains
{
  return self->_payloadAssociatedDomains;
}

- (void)setPayloadAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)payloadAssociatedDomainsEnableDirectDownloads
{
  return self->_payloadAssociatedDomainsEnableDirectDownloads;
}

- (void)setPayloadAssociatedDomainsEnableDirectDownloads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadCellularSliceUUID
{
  return self->_payloadCellularSliceUUID;
}

- (void)setPayloadCellularSliceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadContentFilterUUID
{
  return self->_payloadContentFilterUUID;
}

- (void)setPayloadContentFilterUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadDNSProxyUUID
{
  return self->_payloadDNSProxyUUID;
}

- (void)setPayloadDNSProxyUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadRelayUUID
{
  return self->_payloadRelayUUID;
}

- (void)setPayloadRelayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadTapToPayScreenLock
{
  return self->_payloadTapToPayScreenLock;
}

- (void)setPayloadTapToPayScreenLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadVPNUUID
{
  return self->_payloadVPNUUID;
}

- (void)setPayloadVPNUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadVPNUUID, 0);
  objc_storeStrong((id *)&self->_payloadTapToPayScreenLock, 0);
  objc_storeStrong((id *)&self->_payloadRelayUUID, 0);
  objc_storeStrong((id *)&self->_payloadDNSProxyUUID, 0);
  objc_storeStrong((id *)&self->_payloadContentFilterUUID, 0);
  objc_storeStrong((id *)&self->_payloadCellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_payloadAssociatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_payloadAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_payloadLockable, 0);
  objc_storeStrong((id *)&self->_payloadHideable, 0);
}

@end
