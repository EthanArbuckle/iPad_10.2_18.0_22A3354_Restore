@implementation VCSEntity

+ (id)stringForType:(unint64_t)a3
{
  if (a3 < 5)
    return off_1E953B3D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid(%lu)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VCSEntity)init
{
  VCSEntity *v2;
  uint64_t v3;
  NSMutableArray *children;
  uint64_t v5;
  NSMutableDictionary *propertyMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCSEntity;
  v2 = -[VCSEntity init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    children = v2->_children;
    v2->_children = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    propertyMap = v2->_propertyMap;
    v2->_propertyMap = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)dictify
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *propertyMap;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "stringForType:", -[VCSEntity entityType](self, "entityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  if (-[NSMutableDictionary count](self->_propertyMap, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_propertyMap, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    propertyMap = self->_propertyMap;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __20__VCSEntity_dictify__block_invoke;
    v11[3] = &unk_1E953B338;
    v12 = v5;
    v7 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](propertyMap, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("properties"));

  }
  if (-[NSMutableArray count](self->_children, "count"))
  {
    -[NSMutableArray VCS_map:](self->_children, "VCS_map:", &__block_literal_global_20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("children"));

  }
  return v3;
}

void __20__VCSEntity_dictify__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  objc_msgSend(a3, "values");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "VCS_map:", &__block_literal_global_12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __20__VCSEntity_dictify__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictify");
}

uint64_t __20__VCSEntity_dictify__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictify");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[VCSEntity dictify](self, "dictify");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)children
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_children, "copy");
}

- (NSArray)properties
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_propertyMap, "allValues");
}

- (unint64_t)entityType
{
  return 0;
}

- (void)setProperty:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *propertyMap;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v5)
    {
      propertyMap = self->_propertyMap;
      objc_msgSend(v8, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](propertyMap, "setObject:forKeyedSubscript:", v8, v7);

      v4 = v8;
    }
  }

}

- (void)removePropertyForName:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_propertyMap, "removeObjectForKey:");
}

- (BOOL)hasPropertyWithName:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyMap, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)propertyForName:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyMap, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addChildEntity:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setParent:", self);
  -[NSMutableArray addObject:](self->_children, "addObject:", v4);

}

- (NSArray)alarms
{
  return (NSArray *)-[NSMutableArray VCS_filter:](self->_children, "VCS_filter:", &__block_literal_global_26);
}

BOOL __19__VCSEntity_alarms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "entityType") == 4;
}

- (BOOL)isValidStatus:(unint64_t)a3
{
  return 1;
}

- (VCSEntity)parent
{
  return (VCSEntity *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_propertyMap, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
