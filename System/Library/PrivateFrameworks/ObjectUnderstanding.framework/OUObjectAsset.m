@implementation OUObjectAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OUObjectAsset)init
{
  OUObjectAsset *v2;
  uint64_t v3;
  NSMutableDictionary *groups;
  uint64_t v5;
  NSMutableArray *objects;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OUObjectAsset;
  v2 = -[OUObjectAsset init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    groups = v2->_groups;
    v2->_groups = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    objects = v2->_objects;
    v2->_objects = (NSMutableArray *)v5;

  }
  return v2;
}

- (OUObjectAsset)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  OUObjectAsset *v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *objects;
  uint64_t v9;
  NSMutableArray *v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *groups;
  uint64_t v14;
  NSMutableDictionary *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OUObjectAsset;
  v5 = -[OUObjectAsset init](&v17, sel_init);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objects"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (NSMutableArray *)v6;
  else
    v7 = 0;

  objects = v5->_objects;
  v5->_objects = v7;

  if (!v5->_objects)
  {
    v9 = objc_opt_new();
    v10 = v5->_objects;
    v5->_objects = (NSMutableArray *)v9;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groups"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = (NSMutableDictionary *)v11;
  else
    v12 = 0;

  groups = v5->_groups;
  v5->_groups = v12;

  if (!v5->_groups)
  {
    v14 = objc_opt_new();
    v15 = v5->_groups;
    v5->_groups = (NSMutableDictionary *)v14;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  OUObjectAsset *v4;
  uint64_t v5;
  NSMutableDictionary *groups;
  uint64_t v7;
  NSMutableArray *objects;

  v4 = objc_alloc_init(OUObjectAsset);
  v5 = -[NSMutableDictionary mutableCopy](self->_groups, "mutableCopy");
  groups = v4->_groups;
  v4->_groups = (NSMutableDictionary *)v5;

  v7 = -[NSMutableArray mutableCopy](self->_objects, "mutableCopy");
  objects = v4->_objects;
  v4->_objects = (NSMutableArray *)v7;

  return v4;
}

- (OUObjectAsset)initWithCoder:(id)a3
{
  id v4;
  OUObjectAsset *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *groups;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *objects;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)OUObjectAsset;
  v5 = -[OUObjectAsset init](&v18, sel_init);
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("groups"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = objc_msgSend(v10, "mutableCopy");
  groups = v5->_groups;
  v5->_groups = (NSMutableDictionary *)v11;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("objects"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v15 = objc_msgSend(v14, "mutableCopy");
  objects = v5->_objects;
  v5->_objects = (NSMutableArray *)v15;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_objects, CFSTR("objects"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_groups, CFSTR("groups"));

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_objects, CFSTR("objects"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_groups, CFSTR("groups"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)GetAllObjects
{
  return (id)-[NSMutableArray copy](self->_objects, "copy");
}

- (OUPointCloud)frustumPointCloud
{
  return self->_frustumPointCloud;
}

- (void)setFrustumPointCloud:(id)a3
{
  objc_storeStrong((id *)&self->_frustumPointCloud, a3);
}

- (NSArray)objects
{
  return &self->_objects->super;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (NSDictionary)groups
{
  return &self->_groups->super;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frustumPointCloud, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
