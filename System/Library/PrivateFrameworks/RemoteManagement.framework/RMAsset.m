@implementation RMAsset

- (RMAsset)initWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 content:(id)a6 channel:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RMAsset *v17;
  uint64_t v18;
  NSString *type;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSString *serverToken;
  uint64_t v24;
  NSData *content;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)RMAsset;
  v17 = -[RMAsset init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    type = v17->_type;
    v17->_type = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    serverToken = v17->_serverToken;
    v17->_serverToken = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    content = v17->_content;
    v17->_content = (NSData *)v24;

    objc_storeStrong((id *)&v17->_channel, a7);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RMAsset *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("channel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RMAsset initWithType:identifier:serverToken:content:channel:](self, "initWithType:identifier:serverToken:content:channel:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[RMAsset type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[RMAsset identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[RMAsset serverToken](self, "serverToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serverToken"));

  -[RMAsset content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("content"));

  -[RMAsset channel](self, "channel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("channel"));

}

- (BOOL)isEqual:(id)a3
{
  RMAsset *v4;
  BOOL v5;

  v4 = (RMAsset *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[RMAsset isEqualToAsset:](self, "isEqualToAsset:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = -[RMAsset hash](self, "hash");
  if (v5 == objc_msgSend(v4, "hash"))
  {
    -[RMAsset identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[RMAsset serverToken](self, "serverToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serverToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[RMAsset type](self, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          -[RMAsset channel](self, "channel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "channel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToChannel:", v13))
          {
            -[RMAsset content](self, "content");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "content");
            v18 = v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v17, "isEqualToData:", v14);

            v12 = v18;
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[RMAsset identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RMAsset serverToken](self, "serverToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RMAsset content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[RMAsset channel](self, "channel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RMAsset type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serverToken
{
  return self->_serverToken;
}

- (NSData)content
{
  return self->_content;
}

- (RMManagementChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_serverToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
