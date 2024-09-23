@implementation MOPhotoTrait

- (MOPhotoTrait)initWithIdentifier:(id)a3 name:(id)a4 relevantAssetUUIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOPhotoTrait *v12;
  MOPhotoTrait *v13;
  NSArray *v14;
  NSArray *relevantAssetUUIDs;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MOPhotoTrait;
  v12 = -[MOPhotoTrait init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    v14 = (NSArray *)objc_msgSend(v11, "copy");
    relevantAssetUUIDs = v13->_relevantAssetUUIDs;
    v13->_relevantAssetUUIDs = v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoTrait identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoTrait name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoTrait relevantAssetUUIDs](self, "relevantAssetUUIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOPhotoTrait localIdentifier, %@, name, %@, relevantAssetUUIDs, %@,>"), v3, v4, v5));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantAssetUUIDs, CFSTR("relevantAssetUUIDs"));

}

- (MOPhotoTrait)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  MOPhotoTrait *v17;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_opt_class(NSArray, v11);
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(NSString, v13), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("relevantAssetUUIDs")));

  v17 = -[MOPhotoTrait initWithIdentifier:name:relevantAssetUUIDs:](self, "initWithIdentifier:name:relevantAssetUUIDs:", v7, v10, v16);
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOPhotoTrait *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  MOPhotoTrait *v11;

  v4 = [MOPhotoTrait alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoTrait identifier](self, "identifier"));
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoTrait name](self, "name"));
  v8 = objc_msgSend(v7, "copy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoTrait relevantAssetUUIDs](self, "relevantAssetUUIDs"));
  v10 = objc_msgSend(v9, "copy");
  v11 = -[MOPhotoTrait initWithIdentifier:name:relevantAssetUUIDs:](v4, "initWithIdentifier:name:relevantAssetUUIDs:", v6, v8, v10);

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)relevantAssetUUIDs
{
  return self->_relevantAssetUUIDs;
}

- (void)setRelevantAssetUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MOPhotoTrait)initWithPhotoTraitMO:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MOPhotoTrait *v8;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relevantAssetUUIDs"));

    self = -[MOPhotoTrait initWithIdentifier:name:relevantAssetUUIDs:](self, "initWithIdentifier:name:relevantAssetUUIDs:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
