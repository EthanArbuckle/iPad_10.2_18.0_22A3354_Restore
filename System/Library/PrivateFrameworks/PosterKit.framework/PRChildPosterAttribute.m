@implementation PRChildPosterAttribute

- (PRChildPosterAttribute)initWithChildPosterUUID:(id)a3 dateCreated:(id)a4 providerIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PRChildPosterAttribute *v11;
  uint64_t v12;
  NSUUID *childPosterUUID;
  uint64_t v14;
  NSDate *dateCreated;
  uint64_t v16;
  NSString *providerIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PRChildPosterAttribute;
  v11 = -[PRChildPosterAttribute init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    childPosterUUID = v11->_childPosterUUID;
    v11->_childPosterUUID = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    dateCreated = v11->_dateCreated;
    v11->_dateCreated = (NSDate *)v14;

    v16 = objc_msgSend(v10, "copy");
    providerIdentifier = v11->_providerIdentifier;
    v11->_providerIdentifier = (NSString *)v16;

  }
  return v11;
}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeChildPosterUUID");
}

+ (id)decodeObjectWithJSON:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PRChildPosterAttribute *v11;

  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 16, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("dateCreated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v3, "objectForKey:", CFSTR("UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("providerIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PRChildPosterAttribute initWithChildPosterUUID:dateCreated:providerIdentifier:]([PRChildPosterAttribute alloc], "initWithChildPosterUUID:dateCreated:providerIdentifier:", v9, v10, v8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)encodeJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *providerIdentifier;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  if (encodeJSON_onceToken != -1)
    dispatch_once(&encodeJSON_onceToken, &__block_literal_global_41);
  v3 = (void *)MEMORY[0x1E0CB36D8];
  v14[0] = CFSTR("dateCreated");
  v4 = (void *)encodeJSON_posixNumberFormatter;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_dateCreated, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForObjectValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v14[1] = CFSTR("UUIDString");
  -[NSUUID UUIDString](self->_childPosterUUID, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  providerIdentifier = self->_providerIdentifier;
  v15[1] = v8;
  v15[2] = providerIdentifier;
  v14[2] = CFSTR("providerIdentifier");
  v14[3] = CFSTR("attributeType");
  -[PRChildPosterAttribute attributeType](self, "attributeType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithJSONObject:options:error:", v11, 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __36__PRChildPosterAttribute_encodeJSON__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)encodeJSON_posixNumberFormatter;
  encodeJSON_posixNumberFormatter = (uint64_t)v0;

  v2 = (void *)encodeJSON_posixNumberFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

- (NSUUID)childPosterUUID
{
  return self->_childPosterUUID;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_childPosterUUID, 0);
}

@end
