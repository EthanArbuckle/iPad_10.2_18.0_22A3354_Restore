@implementation UAFAsset

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)location
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (UAFAsset)initWithName:(id)a3 location:(id)a4 metadata:(id)a5
{
  id v9;
  id v10;
  id v11;
  UAFAsset *v12;
  UAFAsset *v13;
  NSDictionary *v14;
  NSDictionary *metadata;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UAFAsset;
  v12 = -[UAFAsset init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_location, a4);
    if (v11)
      v14 = (NSDictionary *)v11;
    else
      v14 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    metadata = v13->_metadata;
    v13->_metadata = v14;

    v13->_hash = -[UAFAsset _generateHash](v13, "_generateHash");
  }

  return v13;
}

- (id)propertiesAsDictionary
{
  void *v2;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("name");
  -[UAFAsset name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UAFAsset name](self, "name");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24F1F9848;
  }
  v13[0] = v5;
  v12[1] = CFSTR("location");
  -[UAFAsset location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UAFAsset location](self, "location");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "absoluteString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24F1F9848;
  }
  v13[1] = v7;
  v12[2] = CFSTR("metadata");
  -[UAFAsset metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UAFAsset metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1B8];
  }
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)

  if (v6)
  {

  }
  if (v4)

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  UAFAsset *v4;
  UAFAsset *v5;
  NSString *name;
  void *v7;
  NSURL *location;
  void *v9;
  NSURL *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v4 = (UAFAsset *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 != self)
    {
      v5 = v4;
      name = self->_name;
      -[UAFAsset name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(name) = -[NSString isEqualToString:](name, "isEqualToString:", v7);

      if (!(_DWORD)name)
      {
        v13 = 0;
LABEL_34:

        goto LABEL_35;
      }
      location = self->_location;
      -[UAFAsset location](v5, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = location;
      v11 = v9;
      v12 = v11;
      if (!v10 && v11)
      {
        v10 = 0;
        goto LABEL_8;
      }
      if (v10 && !v11)
      {
        v14 = 0;
        v13 = 0;
        goto LABEL_33;
      }
      if (v10 && !-[NSURL isEqual:](v10, "isEqual:", v11))
      {
LABEL_8:
        v13 = 0;
        v14 = v12;
LABEL_33:

        goto LABEL_34;
      }

      -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("version"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAFAsset metadata](v5, "metadata");
      v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
      -[NSURL objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("version"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      v17 = v16;
      v12 = v17;
      if (!v14 && v17)
        goto LABEL_19;
      if (v14 && !v17 || v14 && !objc_msgSend(v14, "isEqual:", v17))
        goto LABEL_31;

      -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("language"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAFAsset metadata](v5, "metadata");
      v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
      -[NSURL objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("language"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;
      v20 = v19;
      v12 = v20;
      if (v14)
        goto LABEL_38;
      if (v20)
      {
LABEL_19:
        v14 = 0;
      }
      else
      {
LABEL_38:
        if ((!v14 || v20) && (!v14 || objc_msgSend(v14, "isEqual:", v20)))
        {
          v13 = 1;
LABEL_32:

          goto LABEL_33;
        }
      }
LABEL_31:
      v13 = 0;
      goto LABEL_32;
    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
LABEL_35:

  return v13;
}

- (unint64_t)_generateHash
{
  void *v3;
  NSString *name;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  name = self->_name;
  -[NSURL path](self->_location, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("language"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@%@%@"), name, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hash");
  return v9;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (id)description
{
  void *v2;
  void *v3;

  -[UAFAsset propertiesAsDictionary](self, "propertiesAsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFCommonUtilities serializeDictToJSONStr:error:](UAFCommonUtilities, "serializeDictToJSONStr:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
