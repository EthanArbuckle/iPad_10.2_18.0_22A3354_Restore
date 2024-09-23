@implementation SecDbKeychainSecretData

- (NSString)tamperCheck
{
  return -[SecDbKeychainSerializedSecretData tamperCheck](self->_serializedHolder, "tamperCheck");
}

- (SecDbKeychainSecretData)initWithData:(id)a3
{
  id v4;
  SecDbKeychainSecretData *v5;
  SecDbKeychainSerializedSecretData *v6;
  SecDbKeychainSerializedSecretData *serializedHolder;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SecDbKeychainSecretData;
  v5 = -[SecDbKeychainSecretData init](&v14, "init");
  if (!v5)
    goto LABEL_8;
  v6 = -[SecDbKeychainSerializedSecretData initWithData:]([SecDbKeychainSerializedSecretData alloc], "initWithData:", v4);
  serializedHolder = v5->_serializedHolder;
  v5->_serializedHolder = v6;

  v8 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData ciphertext](v5->_serializedHolder, "ciphertext"));
  if (!v8)
  {
LABEL_7:

    v5 = 0;
    goto LABEL_8;
  }
  v9 = (void *)v8;
  v10 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData wrappedKey](v5->_serializedHolder, "wrappedKey"));
  if (!v10)
  {

    goto LABEL_7;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData tamperCheck](v5->_serializedHolder, "tamperCheck"));

  if (!v12)
    goto LABEL_7;
LABEL_8:

  return v5;
}

- (_SFAuthenticatedCiphertext)ciphertext
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  const void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;

  v3 = objc_opt_class(_SFAuthenticatedCiphertext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData ciphertext](self->_serializedHolder, "ciphertext"));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v3, v4, &v10));
  v6 = v10;

  if (!v5)
  {
    v7 = sub_10000EF14("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error deserializing ciphertext from secret data: %@", buf, 0xCu);
    }

  }
  return (_SFAuthenticatedCiphertext *)v5;
}

- (SecDbKeychainAKSWrappedKey)wrappedKey
{
  SecDbKeychainAKSWrappedKey *v3;
  void *v4;
  SecDbKeychainAKSWrappedKey *v5;

  v3 = [SecDbKeychainAKSWrappedKey alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData wrappedKey](self->_serializedHolder, "wrappedKey"));
  v5 = -[SecDbKeychainAKSWrappedKey initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (SecDbKeychainSecretData)initWithCiphertext:(id)a3 wrappedKey:(id)a4 tamperCheck:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  SecDbKeychainSecretData *v13;
  SecDbKeychainSerializedSecretData *v14;
  SecDbKeychainSerializedSecretData *serializedHolder;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SecDbKeychainSecretData;
  v13 = -[SecDbKeychainSecretData init](&v24, "init");
  if (!v13)
    goto LABEL_8;
  v14 = objc_alloc_init(SecDbKeychainSerializedSecretData);
  serializedHolder = v13->_serializedHolder;
  v13->_serializedHolder = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, a6));
  -[SecDbKeychainSerializedSecretData setCiphertext:](v13->_serializedHolder, "setCiphertext:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serializedRepresentation"));
  -[SecDbKeychainSerializedSecretData setWrappedKey:](v13->_serializedHolder, "setWrappedKey:", v17);

  -[SecDbKeychainSerializedSecretData setTamperCheck:](v13->_serializedHolder, "setTamperCheck:", v12);
  v18 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData ciphertext](v13->_serializedHolder, "ciphertext"));
  if (!v18)
  {
LABEL_7:

    v13 = 0;
    goto LABEL_8;
  }
  v19 = (void *)v18;
  v20 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData wrappedKey](v13->_serializedHolder, "wrappedKey"));
  if (!v20)
  {

    goto LABEL_7;
  }
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedSecretData tamperCheck](v13->_serializedHolder, "tamperCheck"));

  if (!v22)
    goto LABEL_7;
LABEL_8:

  return v13;
}

- (NSData)serializedRepresentation
{
  return (NSData *)-[SecDbKeychainSerializedSecretData data](self->_serializedHolder, "data");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedHolder, 0);
}

@end
