@implementation RMModelACMECredentialDeclaration_SubjectAltName

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("rfc822Name");
  v6[1] = CFSTR("dNSName");
  v6[2] = CFSTR("uniformResourceIdentifier");
  v6[3] = CFSTR("ntPrincipalName");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithRfc822Name:(id)a3 dnsName:(id)a4 uniformResourceIdentifier:(id)a5 ntPrincipalName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadRfc822Name:", v12);

  objc_msgSend(v13, "setPayloadDNSName:", v11);
  objc_msgSend(v13, "setPayloadUniformResourceIdentifier:", v10);

  objc_msgSend(v13, "setPayloadNtPrincipalName:", v9);
  return v13;
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

  +[RMModelACMECredentialDeclaration_SubjectAltName allowedPayloadKeys](RMModelACMECredentialDeclaration_SubjectAltName, "allowedPayloadKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v12);

  v13 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("rfc822Name"), CFSTR("payloadRfc822Name"), 0, 0, a5))
  {
    v13 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("dNSName"), CFSTR("payloadDNSName"), 0, 0, a5))
    {
      v13 = 0;
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("uniformResourceIdentifier"), CFSTR("payloadUniformResourceIdentifier"), 0, 0, a5))
      {
        v13 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("ntPrincipalName"), CFSTR("payloadNtPrincipalName"), 0, 0, a5);
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

  v4 = (void *)objc_opt_new();
  -[RMModelACMECredentialDeclaration_SubjectAltName payloadRfc822Name](self, "payloadRfc822Name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("rfc822Name"), v5, 0, 0);

  -[RMModelACMECredentialDeclaration_SubjectAltName payloadDNSName](self, "payloadDNSName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("dNSName"), v6, 0, 0);

  -[RMModelACMECredentialDeclaration_SubjectAltName payloadUniformResourceIdentifier](self, "payloadUniformResourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("uniformResourceIdentifier"), v7, 0, 0);

  -[RMModelACMECredentialDeclaration_SubjectAltName payloadNtPrincipalName](self, "payloadNtPrincipalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ntPrincipalName"), v8, 0, 0);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RMModelACMECredentialDeclaration_SubjectAltName;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadRfc822Name, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadDNSName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_payloadUniformResourceIdentifier, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadNtPrincipalName, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadRfc822Name
{
  return self->_payloadRfc822Name;
}

- (void)setPayloadRfc822Name:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadDNSName
{
  return self->_payloadDNSName;
}

- (void)setPayloadDNSName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)payloadUniformResourceIdentifier
{
  return self->_payloadUniformResourceIdentifier;
}

- (void)setPayloadUniformResourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadNtPrincipalName
{
  return self->_payloadNtPrincipalName;
}

- (void)setPayloadNtPrincipalName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNtPrincipalName, 0);
  objc_storeStrong((id *)&self->_payloadUniformResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDNSName, 0);
  objc_storeStrong((id *)&self->_payloadRfc822Name, 0);
}

@end
