@implementation RMModelNetworkEAPDeclaration_TLS

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("RequireClientCertificate");
  v6[1] = CFSTR("IdentityAssetReference");
  v6[2] = CFSTR("TrustedServerNames");
  v6[3] = CFSTR("AnchorCertificateAssetReferences");
  v6[4] = CFSTR("MinimumVersion");
  v6[5] = CFSTR("MaximumVersion");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRequireClientCertificate:(id)a3 identityAssetReference:(id)a4 trustedServerNames:(id)a5 anchorCertificateAssetReferences:(id)a6 minimumVersion:(id)a7 maximumVersion:(id)a8
{
  __CFString *v13;
  __CFString *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  const __CFString *v23;

  v13 = (__CFString *)a8;
  v14 = (__CFString *)a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  v20 = v19;
  if (v18)
    v21 = v18;
  else
    v21 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v19, "setPayloadRequireClientCertificate:", v21);

  objc_msgSend(v20, "setPayloadIdentityAssetReference:", v17);
  objc_msgSend(v20, "setPayloadTrustedServerNames:", v16);

  objc_msgSend(v20, "setPayloadAnchorCertificateAssetReferences:", v15);
  if (v14)
    v22 = v14;
  else
    v22 = CFSTR("1.0");
  objc_msgSend(v20, "setPayloadMinimumVersion:", v22);

  if (v13)
    v23 = v13;
  else
    v23 = CFSTR("1.2");
  objc_msgSend(v20, "setPayloadMaximumVersion:", v23);

  return v20;
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

  +[RMModelNetworkEAPDeclaration_TLS allowedPayloadKeys](RMModelNetworkEAPDeclaration_TLS, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("RequireClientCertificate"), CFSTR("payloadRequireClientCertificate"), 0, MEMORY[0x24BDBD1C0], a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("IdentityAssetReference"), CFSTR("payloadIdentityAssetReference"), 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("TrustedServerNames"), CFSTR("payloadTrustedServerNames"), &__block_literal_global_396, 0, 0, a5))
      {
        v13 = 0;
        if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("AnchorCertificateAssetReferences"), CFSTR("payloadAnchorCertificateAssetReferences"), &__block_literal_global_399, 0, 0, a5))
        {
          v13 = 0;
          if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("MinimumVersion"), CFSTR("payloadMinimumVersion"), 0, CFSTR("1.0"), a5))
          {
            v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("MaximumVersion"), CFSTR("payloadMaximumVersion"), 0, CFSTR("1.2"), a5);
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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_opt_new();
  -[RMModelNetworkEAPDeclaration_TLS payloadRequireClientCertificate](self, "payloadRequireClientCertificate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("RequireClientCertificate"), v5, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelNetworkEAPDeclaration_TLS payloadIdentityAssetReference](self, "payloadIdentityAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("IdentityAssetReference"), v6, 0, 0);

  -[RMModelNetworkEAPDeclaration_TLS payloadTrustedServerNames](self, "payloadTrustedServerNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("TrustedServerNames"), v7, &__block_literal_global_404, 0, 0);

  -[RMModelNetworkEAPDeclaration_TLS payloadAnchorCertificateAssetReferences](self, "payloadAnchorCertificateAssetReferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AnchorCertificateAssetReferences"), v8, &__block_literal_global_405, 0, 0);

  -[RMModelNetworkEAPDeclaration_TLS payloadMinimumVersion](self, "payloadMinimumVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("MinimumVersion"), v9, 0, CFSTR("1.0"));

  -[RMModelNetworkEAPDeclaration_TLS payloadMaximumVersion](self, "payloadMaximumVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("MaximumVersion"), v10, 0, CFSTR("1.2"));

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RMModelNetworkEAPDeclaration_TLS;
  v4 = -[RMModelPayloadBase copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadRequireClientCertificate, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadIdentityAssetReference, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadTrustedServerNames, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_payloadAnchorCertificateAssetReferences, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_payloadMinimumVersion, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadMaximumVersion, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSNumber)payloadRequireClientCertificate
{
  return self->_payloadRequireClientCertificate;
}

- (void)setPayloadRequireClientCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadIdentityAssetReference
{
  return self->_payloadIdentityAssetReference;
}

- (void)setPayloadIdentityAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadTrustedServerNames
{
  return self->_payloadTrustedServerNames;
}

- (void)setPayloadTrustedServerNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)payloadAnchorCertificateAssetReferences
{
  return self->_payloadAnchorCertificateAssetReferences;
}

- (void)setPayloadAnchorCertificateAssetReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)payloadMinimumVersion
{
  return self->_payloadMinimumVersion;
}

- (void)setPayloadMinimumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadMaximumVersion
{
  return self->_payloadMaximumVersion;
}

- (void)setPayloadMaximumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMaximumVersion, 0);
  objc_storeStrong((id *)&self->_payloadMinimumVersion, 0);
  objc_storeStrong((id *)&self->_payloadAnchorCertificateAssetReferences, 0);
  objc_storeStrong((id *)&self->_payloadTrustedServerNames, 0);
  objc_storeStrong((id *)&self->_payloadIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadRequireClientCertificate, 0);
}

@end
