@implementation RMModelSCEPCredentialDeclaration

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("URL");
  v6[1] = CFSTR("Name");
  v6[2] = CFSTR("Subject");
  v6[3] = CFSTR("Challenge");
  v6[4] = CFSTR("Keysize");
  v6[5] = CFSTR("Key Type");
  v6[6] = CFSTR("Key Usage");
  v6[7] = CFSTR("CAFingerprint");
  v6[8] = CFSTR("Retries");
  v6[9] = CFSTR("RetryDelay");
  v6[10] = CFSTR("SubjectAltName");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithURL:(id)a3 name:(id)a4 subject:(id)a5 challenge:(id)a6 keysize:(id)a7 keyType:(id)a8 keyUsage:(id)a9 caFingerprint:(id)a10 retries:(id)a11 retryDelay:(id)a12 subjectAltName:(id)a13
{
  id v18;
  id v19;
  __CFString *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v34;
  id v35;
  id v36;

  v36 = a13;
  v35 = a12;
  v18 = a11;
  v34 = a10;
  v19 = a9;
  v20 = (__CFString *)a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "setPayloadURL:", v25);

  objc_msgSend(v26, "setPayloadName:", v24);
  objc_msgSend(v26, "setPayloadSubject:", v23);

  objc_msgSend(v26, "setPayloadChallenge:", v22);
  if (v21)
    v27 = v21;
  else
    v27 = &unk_251629E68;
  objc_msgSend(v26, "setPayloadKeysize:", v27, a3);

  if (v20)
    v28 = v20;
  else
    v28 = CFSTR("RSA");
  objc_msgSend(v26, "setPayloadKeyType:", v28);

  if (v19)
    v29 = v19;
  else
    v29 = &unk_251629E80;
  objc_msgSend(v26, "setPayloadKeyUsage:", v29);

  objc_msgSend(v26, "setPayloadCAFingerprint:", v34);
  if (v18)
    v30 = v18;
  else
    v30 = &unk_251629E98;
  objc_msgSend(v26, "setPayloadRetries:", v30);

  if (v35)
    v31 = v35;
  else
    v31 = &unk_251629EB0;
  objc_msgSend(v26, "setPayloadRetryDelay:", v31);

  objc_msgSend(v26, "setPayloadSubjectAltName:", v36);
  return v26;
}

+ (id)buildRequiredOnlyWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPayloadURL:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;

  v6 = a4;
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelSCEPCredentialDeclaration allowedPayloadKeys](RMModelSCEPCredentialDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("URL"), CFSTR("payloadURL"), 1, 0, a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Name"), CFSTR("payloadName"), 0, 0, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("Subject"), CFSTR("payloadSubject"), &__block_literal_global_15, 0, 0, a5))
      {
        v14 = 0;
        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Challenge"), CFSTR("payloadChallenge"), 0, 0, a5))
        {
          v14 = 0;
          if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Keysize"), CFSTR("payloadKeysize"), 0, &unk_251629E68, a5))
          {
            v14 = 0;
            if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Key Type"), CFSTR("payloadKeyType"), 0, CFSTR("RSA"), a5))
            {
              v14 = 0;
              if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Key Usage"), CFSTR("payloadKeyUsage"), 0, &unk_251629E80, a5))
              {
                v14 = 0;
                if (-[RMModelPayloadBase loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self, "loadDataFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:", v8, CFSTR("CAFingerprint"), CFSTR("payloadCAFingerprint"), 0, 0, v6, a5))
                {
                  v14 = 0;
                  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Retries"), CFSTR("payloadRetries"), 0, &unk_251629E98, a5))
                  {
                    v14 = 0;
                    if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("RetryDelay"), CFSTR("payloadRetryDelay"), 0, &unk_251629EB0, a5))
                    {
                      LOWORD(v16) = v6;
                      v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("SubjectAltName"), CFSTR("payloadSubjectAltName"), objc_opt_class(), 0, 0, v16, a5);
                    }
                  }
                }
              }
            }
          }
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

uint64_t __79__RMModelSCEPCredentialDeclaration_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
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

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3;
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
  _QWORD v19[4];
  __int16 v20;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMModelSCEPCredentialDeclaration payloadURL](self, "payloadURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("URL"), v6, 1, 0);

  -[RMModelSCEPCredentialDeclaration payloadName](self, "payloadName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Name"), v7, 0, 0);

  -[RMModelSCEPCredentialDeclaration payloadSubject](self, "payloadSubject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Subject"), v8, &__block_literal_global_57, 0, 0);

  -[RMModelSCEPCredentialDeclaration payloadChallenge](self, "payloadChallenge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Challenge"), v9, 0, 0);

  -[RMModelSCEPCredentialDeclaration payloadKeysize](self, "payloadKeysize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Keysize"), v10, 0, &unk_251629E68);

  -[RMModelSCEPCredentialDeclaration payloadKeyType](self, "payloadKeyType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Key Type"), v11, 0, CFSTR("RSA"));

  -[RMModelSCEPCredentialDeclaration payloadKeyUsage](self, "payloadKeyUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Key Usage"), v12, 0, &unk_251629E80);

  -[RMModelSCEPCredentialDeclaration payloadCAFingerprint](self, "payloadCAFingerprint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:](self, "serializeDataIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:", v5, CFSTR("CAFingerprint"), v13, 0, 0, v3);

  -[RMModelSCEPCredentialDeclaration payloadRetries](self, "payloadRetries");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Retries"), v14, 0, &unk_251629E98);

  -[RMModelSCEPCredentialDeclaration payloadRetryDelay](self, "payloadRetryDelay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("RetryDelay"), v15, 0, &unk_251629EB0);

  -[RMModelSCEPCredentialDeclaration payloadSubjectAltName](self, "payloadSubjectAltName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __54__RMModelSCEPCredentialDeclaration_serializeWithType___block_invoke_2;
  v19[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v20 = v3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("SubjectAltName"), v16, v19, 0, 0);

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

id __54__RMModelSCEPCredentialDeclaration_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

uint64_t __54__RMModelSCEPCredentialDeclaration_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
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
  uint64_t v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)RMModelSCEPCredentialDeclaration;
  v4 = -[RMModelPayloadBase copyWithZone:](&v28, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_payloadName, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadSubject, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_payloadChallenge, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSNumber copy](self->_payloadKeysize, "copy");
  v14 = (void *)v4[6];
  v4[6] = v13;

  v15 = -[NSString copy](self->_payloadKeyType, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSNumber copy](self->_payloadKeyUsage, "copy");
  v18 = (void *)v4[8];
  v4[8] = v17;

  v19 = -[NSData copy](self->_payloadCAFingerprint, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  v21 = -[NSNumber copy](self->_payloadRetries, "copy");
  v22 = (void *)v4[10];
  v4[10] = v21;

  v23 = -[NSNumber copy](self->_payloadRetryDelay, "copy");
  v24 = (void *)v4[11];
  v4[11] = v23;

  v25 = -[RMModelSCEPCredentialDeclaration_SubjectAltName copy](self->_payloadSubjectAltName, "copy");
  v26 = (void *)v4[12];
  v4[12] = v25;

  return v4;
}

- (NSString)payloadURL
{
  return self->_payloadURL;
}

- (void)setPayloadURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)payloadName
{
  return self->_payloadName;
}

- (void)setPayloadName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadSubject
{
  return self->_payloadSubject;
}

- (void)setPayloadSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)payloadChallenge
{
  return self->_payloadChallenge;
}

- (void)setPayloadChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)payloadKeysize
{
  return self->_payloadKeysize;
}

- (void)setPayloadKeysize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadKeyType
{
  return self->_payloadKeyType;
}

- (void)setPayloadKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadKeyUsage
{
  return self->_payloadKeyUsage;
}

- (void)setPayloadKeyUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)payloadCAFingerprint
{
  return self->_payloadCAFingerprint;
}

- (void)setPayloadCAFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadRetries
{
  return self->_payloadRetries;
}

- (void)setPayloadRetries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadRetryDelay
{
  return self->_payloadRetryDelay;
}

- (void)setPayloadRetryDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (RMModelSCEPCredentialDeclaration_SubjectAltName)payloadSubjectAltName
{
  return self->_payloadSubjectAltName;
}

- (void)setPayloadSubjectAltName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSubjectAltName, 0);
  objc_storeStrong((id *)&self->_payloadRetryDelay, 0);
  objc_storeStrong((id *)&self->_payloadRetries, 0);
  objc_storeStrong((id *)&self->_payloadCAFingerprint, 0);
  objc_storeStrong((id *)&self->_payloadKeyUsage, 0);
  objc_storeStrong((id *)&self->_payloadKeyType, 0);
  objc_storeStrong((id *)&self->_payloadKeysize, 0);
  objc_storeStrong((id *)&self->_payloadChallenge, 0);
  objc_storeStrong((id *)&self->_payloadSubject, 0);
  objc_storeStrong((id *)&self->_payloadName, 0);
  objc_storeStrong((id *)&self->_payloadURL, 0);
}

@end
