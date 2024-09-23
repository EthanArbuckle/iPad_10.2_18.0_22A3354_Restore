@implementation NFTrustKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustKey)initWithCoder:(id)a3
{
  id v4;
  NFTrustKey *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NFTrustKey;
  v5 = -[NFTrustObject initWithCoder:](&v19, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("identifier"));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("counterLimit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("counterLimit"));

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("counterValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("counterValue"));

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("keyAttestationAuthority"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v13, CFSTR("keyAttestationAuthority"));

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("keyAttestation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v15, CFSTR("keyAttestation"));

    v16 = +[NFNSCheckedDecoder coder:decodeArrayOfArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfArrayOfClass:forKey:", v4, objc_opt_class(NFTrustLocalValidation), CFSTR("localValidations"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NFTrustKey setValue:forKey:](v5, "setValue:forKey:", v17, CFSTR("localValidations"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKey identifier](self, "identifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKey counterLimit](self, "counterLimit"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("counterLimit"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKey counterValue](self, "counterValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("counterValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKey keyAttestationAuthority](self, "keyAttestationAuthority"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keyAttestationAuthority"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKey keyAttestation](self, "keyAttestation"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("keyAttestation"));

  v10 = (id)objc_claimAutoreleasedReturnValue(-[NFTrustKey localValidations](self, "localValidations"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("localValidations"));

}

- (NSData)publicKey
{
  NSData *publicKey;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  publicKey = self->_publicKey;
  if (!publicKey)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustKey keyAttestation](self, "keyAttestation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData NF_dataWithHexString:](NSData, "NF_dataWithHexString:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", v5));

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "children"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "tag") == 32585)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", v13));

            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
            -[NFTrustKey setPublicKey:](self, "setPublicKey:", v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    publicKey = self->_publicKey;
  }
  return publicKey;
}

+ (id)keyWithIdentifier:(id)a3
{
  id v5;
  NFTrustKey *v6;
  NFTrustKey *v7;
  void *specific;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;

  v5 = a3;
  if (v5)
  {
    v6 = [NFTrustKey alloc];
    v7 = v6;
    if (v6)
      -[NFTrustKey setIdentifier:](v6, "setIdentifier:", v5);
  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", v14, ClassName, Name, 220);
    }
    v15 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(a1);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      *(_DWORD *)buf = 67109890;
      v23 = v19;
      v24 = 2082;
      v25 = object_getClassName(a1);
      v26 = 2082;
      v27 = sel_getName(a2);
      v28 = 1024;
      v29 = 220;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustKey with null identifier", buf, 0x22u);
    }

    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSString)keyAttestationAuthority
{
  return self->_keyAttestationAuthority;
}

- (void)setKeyAttestationAuthority:(id)a3
{
  objc_storeStrong((id *)&self->_keyAttestationAuthority, a3);
}

- (NSString)keyAttestation
{
  return self->_keyAttestation;
}

- (void)setKeyAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_keyAttestation, a3);
}

- (NSNumber)counterLimit
{
  return self->_counterLimit;
}

- (void)setCounterLimit:(id)a3
{
  objc_storeStrong((id *)&self->_counterLimit, a3);
}

- (NSNumber)counterValue
{
  return self->_counterValue;
}

- (void)setCounterValue:(id)a3
{
  objc_storeStrong((id *)&self->_counterValue, a3);
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
  objc_storeStrong((id *)&self->_localValidations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_keyAttestationAuthority, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
