@implementation SSRVoiceProfileStoreData

- (SSRVoiceProfileStoreData)initWithVoiceProfileArray:(id)a3 withVersion:(id)a4
{
  id v7;
  id v8;
  SSRVoiceProfileStoreData *v9;
  SSRVoiceProfileStoreData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSRVoiceProfileStoreData;
  v9 = -[SSRVoiceProfileStoreData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vpArray, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("version %@ arrayCount %lu"), self->_version, -[NSArray count](self->_vpArray, "count"));
}

- (SSRVoiceProfileStoreData)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  SSRVoiceProfileStoreData *v11;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("Known User Voice Profiles"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Voice Profile Store Version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SSRVoiceProfileStoreData initWithVoiceProfileArray:withVersion:](self, "initWithVoiceProfileArray:withVersion:", v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *vpArray;
  id v5;

  vpArray = self->_vpArray;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", vpArray, CFSTR("Known User Voice Profiles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("Voice Profile Store Version"));

}

- (NSArray)vpArray
{
  return self->_vpArray;
}

- (NSNumber)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_vpArray, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
