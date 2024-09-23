@implementation STSDiffieHellmanParameter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t publicKeyGroup;
  const char *v5;
  const char *v6;
  id v7;

  publicKeyGroup = self->_publicKeyGroup;
  v7 = a3;
  objc_msgSend_encodeInteger_forKey_(v7, v5, publicKeyGroup, CFSTR("publicKeyGroup"));
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_publicKey, CFSTR("publicKey"));

}

- (STSDiffieHellmanParameter)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  STSDiffieHellmanParameter *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSData *publicKey;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STSDiffieHellmanParameter;
  v6 = -[STSDiffieHellmanParameter init](&v12, sel_init);
  if (v6)
  {
    v6->_publicKeyGroup = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("publicKeyGroup"));
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("dhInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    publicKey = v6->_publicKey;
    v6->_publicKey = (NSData *)v9;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  STSDiffieHellmanParameter *v4;
  STSDiffieHellmanParameter *v5;
  STSDiffieHellmanParameter *v6;
  unint64_t publicKeyGroup;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSData *publicKey;
  void *v22;
  const char *v23;
  char isEqualToData;

  v4 = (STSDiffieHellmanParameter *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToData = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    publicKeyGroup = self->_publicKeyGroup;
    if (publicKeyGroup == objc_msgSend_publicKeyGroup(v6, v8, v9)
      && (v12 = objc_msgSend_length(self->_publicKey, v10, v11),
          objc_msgSend_publicKey(v6, v13, v14),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend_length(v15, v16, v17),
          v15,
          v12 == v18))
    {
      publicKey = self->_publicKey;
      if (publicKey)
      {
        objc_msgSend_publicKey(v6, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToData = objc_msgSend_isEqualToData_(publicKey, v23, (uint64_t)v22);

      }
      else
      {
        isEqualToData = 1;
      }
    }
    else
    {
      isEqualToData = 0;
    }

  }
  else
  {
    isEqualToData = 0;
  }

  return isEqualToData;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("keyGroup=%lu, key=%@"), self->_publicKeyGroup, self->_publicKey);
}

- (STSDiffieHellmanParameter)initWithKeyGroup:(unint64_t)a3 key:(id)a4
{
  id v7;
  STSDiffieHellmanParameter *v8;
  STSDiffieHellmanParameter *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)STSDiffieHellmanParameter;
  v8 = -[STSDiffieHellmanParameter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_publicKeyGroup = a3;
    objc_storeStrong((id *)&v8->_publicKey, a4);
  }

  return v9;
}

- (id)asData
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  __int16 v12;
  char v13;

  objc_msgSend_data(MEMORY[0x24BDBCEC8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(self->_publicKey, v5, v6) + 3;
  objc_msgSend_appendBytes_length_(v4, v7, (uint64_t)&v13, 1);
  objc_msgSend_appendBytes_length_(v4, v8, (uint64_t)&unk_20A030500, 1);
  v12 = bswap32(LOWORD(self->_publicKeyGroup)) >> 16;
  objc_msgSend_appendBytes_length_(v4, v9, (uint64_t)&v12, 2);
  objc_msgSend_appendData_(v4, v10, (uint64_t)self->_publicKey);
  return v4;
}

- (unint64_t)publicKeyGroup
{
  return self->_publicKeyGroup;
}

- (void)setPublicKeyGroup:(unint64_t)a3
{
  self->_publicKeyGroup = a3;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
