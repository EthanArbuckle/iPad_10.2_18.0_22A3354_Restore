@implementation RMConfiguration

- (RMConfiguration)initWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 content:(id)a6 channel:(id)a7 assetByIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RMConfiguration *v20;
  uint64_t v21;
  NSString *type;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  NSString *serverToken;
  uint64_t v27;
  NSData *content;
  uint64_t v29;
  NSDictionary *assetByIdentifier;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)RMConfiguration;
  v20 = -[RMConfiguration init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    type = v20->_type;
    v20->_type = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    serverToken = v20->_serverToken;
    v20->_serverToken = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    content = v20->_content;
    v20->_content = (NSData *)v27;

    objc_storeStrong((id *)&v20->_channel, a7);
    v29 = objc_msgSend(v19, "copy");
    assetByIdentifier = v20->_assetByIdentifier;
    v20->_assetByIdentifier = (NSDictionary *)v29;

  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  RMConfiguration *v15;

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
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("assetByIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[RMConfiguration initWithType:identifier:serverToken:content:channel:assetByIdentifier:](self, "initWithType:identifier:serverToken:content:channel:assetByIdentifier:", v5, v6, v7, v8, v9, v14);
  return v15;
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
  -[RMConfiguration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[RMConfiguration identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  -[RMConfiguration serverToken](self, "serverToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serverToken"));

  -[RMConfiguration content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("content"));

  -[RMConfiguration channel](self, "channel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("channel"));

  -[RMConfiguration assetByIdentifier](self, "assetByIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("assetByIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  RMConfiguration *v4;
  BOOL v5;

  v4 = (RMConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
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
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  id v22;
  char v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = -[RMConfiguration hash](self, "hash");
  if (v5 == objc_msgSend(v4, "hash"))
  {
    -[RMConfiguration identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[RMConfiguration serverToken](self, "serverToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serverToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[RMConfiguration type](self, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          -[RMConfiguration channel](self, "channel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "channel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToChannel:", v13))
          {
            v29 = v12;
            -[RMConfiguration content](self, "content");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "content");
            v30 = v14;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "isEqualToData:"))
            {
              -[RMConfiguration assetByIdentifier](self, "assetByIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "assetByIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              v17 = v25;
              v18 = v17;
              v19 = v16;
              v20 = v16 == v17;
              v12 = v29;
              v27 = v19;
              if (v20)
              {
                v21 = 1;
              }
              else
              {
                v21 = 0;
                if (v19 && v17)
                {
                  v22 = v17;
                  v23 = objc_msgSend(v19, "isEqual:", v17);
                  v18 = v22;
                  v21 = v23;
                }
              }
              v26 = v18;

            }
            else
            {
              v21 = 0;
              v12 = v29;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
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
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[RMConfiguration identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RMConfiguration serverToken](self, "serverToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RMConfiguration content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[RMConfiguration channel](self, "channel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RMConfiguration type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RMConfiguration assetByIdentifier](self, "assetByIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
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

- (NSDictionary)assetByIdentifier
{
  return self->_assetByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetByIdentifier, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_serverToken, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
