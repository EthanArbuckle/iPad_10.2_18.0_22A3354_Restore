@implementation SecDbKeychainAKSWrappedKey

- (SecDbKeychainAKSWrappedKey)initWithData:(id)a3
{
  id v4;
  SecDbKeychainAKSWrappedKey *v5;
  SecDbKeychainSerializedAKSWrappedKey *v6;
  SecDbKeychainSerializedAKSWrappedKey *serializedHolder;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SecDbKeychainAKSWrappedKey;
  v5 = -[SecDbKeychainAKSWrappedKey init](&v12, "init");
  if (v5)
  {
    v6 = -[SecDbKeychainSerializedAKSWrappedKey initWithData:]([SecDbKeychainSerializedAKSWrappedKey alloc], "initWithData:", v4);
    serializedHolder = v5->_serializedHolder;
    v5->_serializedHolder = v6;

    v8 = objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedAKSWrappedKey wrappedKey](v5->_serializedHolder, "wrappedKey"));
    if (!v8)
      goto LABEL_5;
    v9 = (void *)v8;
    if (-[SecDbKeychainSerializedAKSWrappedKey type](v5->_serializedHolder, "type") != 1)
    {
LABEL_6:

      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SecDbKeychainSerializedAKSWrappedKey refKeyBlob](v5->_serializedHolder, "refKeyBlob"));

    if (!v10)
    {
LABEL_5:
      v9 = v5;
      v5 = 0;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

- (NSData)wrappedKey
{
  return -[SecDbKeychainSerializedAKSWrappedKey wrappedKey](self->_serializedHolder, "wrappedKey");
}

- (unsigned)type
{
  return -[SecDbKeychainSerializedAKSWrappedKey type](self->_serializedHolder, "type");
}

- (NSData)serializedRepresentation
{
  return (NSData *)-[SecDbKeychainSerializedAKSWrappedKey data](self->_serializedHolder, "data");
}

- (id)initRegularWrappedKeyWithData:(id)a3
{
  id v4;
  SecDbKeychainAKSWrappedKey *v5;
  SecDbKeychainSerializedAKSWrappedKey *v6;
  SecDbKeychainSerializedAKSWrappedKey *serializedHolder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecDbKeychainAKSWrappedKey;
  v5 = -[SecDbKeychainAKSWrappedKey init](&v9, "init");
  if (v5)
  {
    v6 = objc_alloc_init(SecDbKeychainSerializedAKSWrappedKey);
    serializedHolder = v5->_serializedHolder;
    v5->_serializedHolder = v6;

    -[SecDbKeychainSerializedAKSWrappedKey setWrappedKey:](v5->_serializedHolder, "setWrappedKey:", v4);
    -[SecDbKeychainSerializedAKSWrappedKey setType:](v5->_serializedHolder, "setType:", 0);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedHolder, 0);
}

- (id)initRefKeyWrappedKeyWithData:(id)a3 refKeyBlob:(id)a4
{
  id v6;
  id v7;
  SecDbKeychainAKSWrappedKey *v8;
  SecDbKeychainSerializedAKSWrappedKey *v9;
  SecDbKeychainSerializedAKSWrappedKey *serializedHolder;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SecDbKeychainAKSWrappedKey;
  v8 = -[SecDbKeychainAKSWrappedKey init](&v12, "init");
  if (v8)
  {
    v9 = objc_alloc_init(SecDbKeychainSerializedAKSWrappedKey);
    serializedHolder = v8->_serializedHolder;
    v8->_serializedHolder = v9;

    -[SecDbKeychainSerializedAKSWrappedKey setWrappedKey:](v8->_serializedHolder, "setWrappedKey:", v6);
    -[SecDbKeychainSerializedAKSWrappedKey setRefKeyBlob:](v8->_serializedHolder, "setRefKeyBlob:", v7);
    -[SecDbKeychainSerializedAKSWrappedKey setType:](v8->_serializedHolder, "setType:", 1);
  }

  return v8;
}

- (NSData)refKeyBlob
{
  return -[SecDbKeychainSerializedAKSWrappedKey refKeyBlob](self->_serializedHolder, "refKeyBlob");
}

@end
