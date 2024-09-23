@implementation PGGraphNamedLocationNode

- (PGGraphNamedLocationNode)initWithName:(id)a3 uuid:(id)a4
{
  id v7;
  id v8;
  PGGraphNamedLocationNode *v9;
  PGGraphNamedLocationNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphNamedLocationNode;
  v9 = -[PGGraphLocationNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

- (PGGraphNamedLocationNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  PGGraphNamedLocationNode *v9;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PGGraphNamedLocationNode initWithName:uuid:](self, "initWithName:uuid:", v7, v8);
  return v9;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v9 = 0;
    if (!v6 || objc_msgSend(v6, "isEqual:", self->_name))
    {

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (!v8 || objc_msgSend(v8, "isEqual:", self->_uuid))
        v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)propertyDictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uuid, CFSTR("id"));
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v5, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)domain
{
  return 200;
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  return (MANodeFilter *)objc_msgSend((id)objc_opt_class(), "filterWithUUID:", self->_uuid);
}

- (id)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphNamedLocationNode UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphNamedLocationNode name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@|%@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)UUID
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)setName:(id)a3 onLocationNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  objc_msgSend(a5, "persistModelProperty:forKey:forNodeWithIdentifier:", a3, CFSTR("name"), a4);
}

+ (void)setUUID:(id)a3 onLocationNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  objc_msgSend(a5, "persistModelProperty:forKey:forNodeWithIdentifier:", a3, CFSTR("id"), a4);
}

+ (id)filterWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D42A50]);
  objc_msgSend(v5, "labels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("name");
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithLabels:domain:properties:", v7, 200, v8);
  return v9;
}

+ (id)filterWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D42A50]);
  objc_msgSend(v5, "labels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("id");
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithLabels:domain:properties:", v7, 200, v8);
  return v9;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 200);
}

+ (id)filterBySettingNameNotEmptyPropertyOnFilter:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("name");
  v3 = (objc_class *)MEMORY[0x1E0D42978];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithComparator:value:", 2, &stru_1E8436F28);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
