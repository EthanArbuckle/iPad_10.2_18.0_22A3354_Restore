@implementation SecDbKeychainMetadata

- (_SFAuthenticatedCiphertext)wrappedKey
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata wrappedKey](self->_serializedHolder, "wrappedKey"));
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
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error deserializing wrappedKey from metadata: %@", buf, 0xCu);
    }

  }
  return (_SFAuthenticatedCiphertext *)v5;
}

- (NSString)tamperCheck
{
  return -[SecDbKeychainSerializedMetadata tamperCheck](self->_serializedHolder, "tamperCheck");
}

- (SecDbKeychainMetadata)initWithData:(id)a3
{
  id v4;
  SecDbKeychainMetadata *v5;
  SecDbKeychainSerializedMetadata *v6;
  SecDbKeychainSerializedMetadata *serializedHolder;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SecDbKeychainMetadata;
  v5 = -[SecDbKeychainMetadata init](&v14, "init");
  if (!v5)
    goto LABEL_8;
  v6 = -[SecDbKeychainSerializedMetadata initWithData:]([SecDbKeychainSerializedMetadata alloc], "initWithData:", v4);
  serializedHolder = v5->_serializedHolder;
  v5->_serializedHolder = v6;

  v8 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata ciphertext](v5->_serializedHolder, "ciphertext"));
  if (!v8)
  {
LABEL_7:

    v5 = 0;
    goto LABEL_8;
  }
  v9 = (void *)v8;
  v10 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata wrappedKey](v5->_serializedHolder, "wrappedKey"));
  if (!v10)
  {

    goto LABEL_7;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata tamperCheck](v5->_serializedHolder, "tamperCheck"));

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata ciphertext](self->_serializedHolder, "ciphertext"));
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
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error deserializing ciphertext from metadata: %@", buf, 0xCu);
    }

  }
  return (_SFAuthenticatedCiphertext *)v5;
}

- (SecDbKeychainMetadata)initWithCiphertext:(id)a3 wrappedKey:(id)a4 tamperCheck:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  SecDbKeychainMetadata *v13;
  SecDbKeychainSerializedMetadata *v14;
  SecDbKeychainSerializedMetadata *serializedHolder;
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
  v24.super_class = (Class)SecDbKeychainMetadata;
  v13 = -[SecDbKeychainMetadata init](&v24, "init");
  if (!v13)
    goto LABEL_8;
  v14 = objc_alloc_init(SecDbKeychainSerializedMetadata);
  serializedHolder = v13->_serializedHolder;
  v13->_serializedHolder = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, a6));
  -[SecDbKeychainSerializedMetadata setCiphertext:](v13->_serializedHolder, "setCiphertext:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, a6));
  -[SecDbKeychainSerializedMetadata setWrappedKey:](v13->_serializedHolder, "setWrappedKey:", v17);

  -[SecDbKeychainSerializedMetadata setTamperCheck:](v13->_serializedHolder, "setTamperCheck:", v12);
  v18 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata ciphertext](v13->_serializedHolder, "ciphertext"));
  if (!v18)
  {
LABEL_7:

    v13 = 0;
    goto LABEL_8;
  }
  v19 = (void *)v18;
  v20 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata wrappedKey](v13->_serializedHolder, "wrappedKey"));
  if (!v20)
  {

    goto LABEL_7;
  }
  v21 = (void *)v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedMetadata tamperCheck](v13->_serializedHolder, "tamperCheck"));

  if (!v22)
    goto LABEL_7;
LABEL_8:

  return v13;
}

- (NSData)serializedRepresentation
{
  return (NSData *)-[SecDbKeychainSerializedMetadata data](self->_serializedHolder, "data");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedHolder, 0);
}

@end
