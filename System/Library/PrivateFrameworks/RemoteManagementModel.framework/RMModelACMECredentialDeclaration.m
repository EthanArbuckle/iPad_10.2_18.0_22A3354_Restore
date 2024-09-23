@implementation RMModelACMECredentialDeclaration

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DirectoryURL");
  v6[1] = CFSTR("ClientIdentifier");
  v6[2] = CFSTR("KeySize");
  v6[3] = CFSTR("KeyType");
  v6[4] = CFSTR("HardwareBound");
  v6[5] = CFSTR("Subject");
  v6[6] = CFSTR("SubjectAltName");
  v6[7] = CFSTR("UsageFlags");
  v6[8] = CFSTR("ExtendedKeyUsage");
  v6[9] = CFSTR("Attest");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(id)a5 keyType:(id)a6 hardwareBound:(id)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(id)a10 extendedKeyUsage:(id)a11 attest:(id)a12
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
  id v27;
  id v29;
  id v30;

  v30 = a12;
  v18 = a11;
  v29 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setPayloadDirectoryURL:", v25);

  objc_msgSend(v26, "setPayloadClientIdentifier:", v24);
  objc_msgSend(v26, "setPayloadKeySize:", v23);

  objc_msgSend(v26, "setPayloadKeyType:", v22);
  objc_msgSend(v26, "setPayloadHardwareBound:", v21);

  objc_msgSend(v26, "setPayloadSubject:", v20);
  objc_msgSend(v26, "setPayloadSubjectAltName:", v19);

  objc_msgSend(v26, "setPayloadUsageFlags:", v29);
  objc_msgSend(v26, "setPayloadExtendedKeyUsage:", v18);

  if (v30)
    v27 = v30;
  else
    v27 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v26, "setPayloadAttest:", v27, v29);

  return v26;
}

+ (id)buildRequiredOnlyWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(id)a5 keyType:(id)a6 hardwareBound:(id)a7 subject:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setPayloadDirectoryURL:", v18);

  objc_msgSend(v19, "setPayloadClientIdentifier:", v17);
  objc_msgSend(v19, "setPayloadKeySize:", v16);

  objc_msgSend(v19, "setPayloadKeyType:", v15);
  objc_msgSend(v19, "setPayloadHardwareBound:", v14);

  objc_msgSend(v19, "setPayloadSubject:", v13);
  return v19;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelACMECredentialDeclaration allowedPayloadKeys](RMModelACMECredentialDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("DirectoryURL"), CFSTR("payloadDirectoryURL"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ClientIdentifier"), CFSTR("payloadClientIdentifier"), 1, 0, a5)&& -[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         CFSTR("KeySize"),
         CFSTR("payloadKeySize"),
         1,
         0,
         a5)
    && -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("KeyType"), CFSTR("payloadKeyType"), 1, 0, a5)&& -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("HardwareBound"), CFSTR("payloadHardwareBound"), 1, 0, a5)&& -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self,
         "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:",
         v8,
         CFSTR("Subject"),
         CFSTR("payloadSubject"),
         &__block_literal_global_6,
         1,
         0,
         a5))
  {
    LOWORD(v16) = a4;
    v14 = 0;
    if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("SubjectAltName"), CFSTR("payloadSubjectAltName"), objc_opt_class(), 0, 0, v16, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("UsageFlags"), CFSTR("payloadUsageFlags"), 0, 0, a5))
      {
        v14 = 0;
        if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("ExtendedKeyUsage"), CFSTR("payloadExtendedKeyUsage"), &__block_literal_global_48, 0, 0, a5))
        {
          v14 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Attest"), CFSTR("payloadAttest"), 0, MEMORY[0x24BDBD1C0], a5);
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __79__RMModelACMECredentialDeclaration_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = a2;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:
          v13 = 0;
          goto LABEL_21;
        }
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v10)
              continue;
            break;
          }
        }

        v5 = v15;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v13 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v13 = 1;
  }
LABEL_21:

  return v13;
}

uint64_t __79__RMModelACMECredentialDeclaration_loadFromDictionary_serializationType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializeWithType:(signed __int16)a3
{
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
  _QWORD v18[4];
  signed __int16 v19;

  v5 = (void *)objc_opt_new();
  -[RMModelACMECredentialDeclaration payloadDirectoryURL](self, "payloadDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("DirectoryURL"), v6, 1, 0);

  -[RMModelACMECredentialDeclaration payloadClientIdentifier](self, "payloadClientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ClientIdentifier"), v7, 1, 0);

  -[RMModelACMECredentialDeclaration payloadKeySize](self, "payloadKeySize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("KeySize"), v8, 1, 0);

  -[RMModelACMECredentialDeclaration payloadKeyType](self, "payloadKeyType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("KeyType"), v9, 1, 0);

  -[RMModelACMECredentialDeclaration payloadHardwareBound](self, "payloadHardwareBound");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("HardwareBound"), v10, 1, 0);

  -[RMModelACMECredentialDeclaration payloadSubject](self, "payloadSubject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Subject"), v11, &__block_literal_global_53, 1, 0);

  -[RMModelACMECredentialDeclaration payloadSubjectAltName](self, "payloadSubjectAltName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke_2;
  v18[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v19 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("SubjectAltName"), v12, v18, 0, 0);

  -[RMModelACMECredentialDeclaration payloadUsageFlags](self, "payloadUsageFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("UsageFlags"), v13, 0, 0);

  -[RMModelACMECredentialDeclaration payloadExtendedKeyUsage](self, "payloadExtendedKeyUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("ExtendedKeyUsage"), v14, &__block_literal_global_56, 0, 0);

  -[RMModelACMECredentialDeclaration payloadAttest](self, "payloadAttest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Attest"), v15, 0, MEMORY[0x24BDBD1C0]);

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

id __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

uint64_t __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

id __54__RMModelACMECredentialDeclaration_serializeWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
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
  v26.super_class = (Class)RMModelACMECredentialDeclaration;
  v4 = -[RMModelPayloadBase copyWithZone:](&v26, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadDirectoryURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadClientIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSNumber copy](self->_payloadKeySize, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadKeyType, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadHardwareBound, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSArray copy](self->_payloadSubject, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[RMModelACMECredentialDeclaration_SubjectAltName copy](self->_payloadSubjectAltName, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSNumber copy](self->_payloadUsageFlags, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSArray copy](self->_payloadExtendedKeyUsage, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadAttest, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  return v4;
}

- (NSString)payloadDirectoryURL
{
  return self->_payloadDirectoryURL;
}

- (void)setPayloadDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadClientIdentifier
{
  return self->_payloadClientIdentifier;
}

- (void)setPayloadClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)payloadKeySize
{
  return self->_payloadKeySize;
}

- (void)setPayloadKeySize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadKeyType
{
  return self->_payloadKeyType;
}

- (void)setPayloadKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadHardwareBound
{
  return self->_payloadHardwareBound;
}

- (void)setPayloadHardwareBound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadSubject
{
  return self->_payloadSubject;
}

- (void)setPayloadSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (RMModelACMECredentialDeclaration_SubjectAltName)payloadSubjectAltName
{
  return self->_payloadSubjectAltName;
}

- (void)setPayloadSubjectAltName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadUsageFlags
{
  return self->_payloadUsageFlags;
}

- (void)setPayloadUsageFlags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)payloadExtendedKeyUsage
{
  return self->_payloadExtendedKeyUsage;
}

- (void)setPayloadExtendedKeyUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAttest
{
  return self->_payloadAttest;
}

- (void)setPayloadAttest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAttest, 0);
  objc_storeStrong((id *)&self->_payloadExtendedKeyUsage, 0);
  objc_storeStrong((id *)&self->_payloadUsageFlags, 0);
  objc_storeStrong((id *)&self->_payloadSubjectAltName, 0);
  objc_storeStrong((id *)&self->_payloadSubject, 0);
  objc_storeStrong((id *)&self->_payloadHardwareBound, 0);
  objc_storeStrong((id *)&self->_payloadKeyType, 0);
  objc_storeStrong((id *)&self->_payloadKeySize, 0);
  objc_storeStrong((id *)&self->_payloadClientIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDirectoryURL, 0);
}

@end
