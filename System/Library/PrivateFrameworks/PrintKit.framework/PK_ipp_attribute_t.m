@implementation PK_ipp_attribute_t

- (PK_ipp_attribute_t)initWithName:(id)a3 group:(int)a4 value:(int)a5
{
  NSString *v8;
  PK_ipp_attribute_t *v9;
  PK_ipp_attribute_t *v10;
  uint64_t v11;
  NSString *x_name;
  uint64_t v13;
  NSMutableArray *values;
  objc_super v16;

  v8 = (NSString *)a3;
  v16.receiver = self;
  v16.super_class = (Class)PK_ipp_attribute_t;
  v9 = -[PK_ipp_attribute_t init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_group_tag = a4;
    v9->_value_tag = a5;
    if (v8)
    {
      internString(v8);
      v11 = objc_claimAutoreleasedReturnValue();
      x_name = v10->x_name;
      v10->x_name = (NSString *)v11;
    }
    else
    {
      x_name = v9->x_name;
      v9->x_name = 0;
    }

    v13 = objc_opt_new();
    values = v10->_values;
    v10->_values = (NSMutableArray *)v13;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:group:value:", self->x_name, self->_group_tag, self->_value_tag);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_values;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_msgSend(v4, "values", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PK_ipp_attribute_t)initWithCoder:(id)a3
{
  id v4;
  PK_ipp_attribute_t *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;
  NSString *x_name;
  void *v10;
  uint64_t v11;
  NSMutableArray *values;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PK_ipp_attribute_t;
  v5 = -[PK_ipp_attribute_t init](&v14, sel_init);
  if (v5)
  {
    v5->_group_tag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_group_tag"));
    v5->_value_tag = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_value_tag"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      internString(v6);
      v8 = objc_claimAutoreleasedReturnValue();
      x_name = v5->x_name;
      v5->x_name = (NSString *)v8;
    }
    else
    {
      x_name = v5->x_name;
      v5->x_name = 0;
    }

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_values"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mutableCopy");
    values = v5->_values;
    v5->_values = (NSMutableArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *x_name;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_group_tag, CFSTR("_group_tag"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_value_tag, CFSTR("_value_tag"));
  x_name = self->x_name;
  if (x_name)
    objc_msgSend(v5, "encodeObject:forKey:", x_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_values, CFSTR("_values"));

}

- (unint64_t)num_values
{
  return -[NSMutableArray count](self->_values, "count");
}

- (NSString)name
{
  return self->x_name;
}

- (id)loggingDict
{
  void *v3;
  NSMutableArray *values;
  id v5;
  void *v6;
  uint64_t group_tag;
  const char *v8;
  void *v10;
  void *v11;
  uint64_t value_tag;
  const char *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_value_tag)
    return &unk_24E6E9E98;
  v3 = (void *)objc_opt_new();
  values = self->_values;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __33__PK_ipp_attribute_t_loggingDict__block_invoke;
  v16[3] = &unk_24E6CB030;
  v16[4] = self;
  v5 = v3;
  v17 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](values, "enumerateObjectsUsingBlock:", v16);
  v19[0] = self->x_name;
  v18[0] = CFSTR("name");
  v18[1] = CFSTR("tagg");
  v6 = (void *)MEMORY[0x24BDD17C8];
  group_tag = self->_group_tag;
  if ((int)group_tag > 74)
    v8 = "UNKNOWN";
  else
    v8 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(ipp_tag_names[group_tag]), "UTF8String");
  objc_msgSend(v6, "stringWithUTF8String:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  v18[2] = CFSTR("tagv");
  v11 = (void *)MEMORY[0x24BDD17C8];
  value_tag = self->_value_tag;
  if ((int)value_tag > 74)
    v13 = "UNKNOWN";
  else
    v13 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(ipp_tag_names[value_tag]), "UTF8String");
  objc_msgSend(v11, "stringWithUTF8String:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = CFSTR("vals");
  v19[2] = v14;
  v19[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PK_ipp_attribute_t;
  -[PK_ipp_attribute_t description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PK_ipp_attribute_t loggingDict](self, "loggingDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateValues:(id)a3
{
  id v4;
  NSMutableArray *values;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  values = self->_values;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__PK_ipp_attribute_t_enumerateValues___block_invoke;
  v7[3] = &unk_24E6CB058;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](values, "enumerateObjectsUsingBlock:", v7);

}

- (id)_copySettingGroup:(int)a3
{
  id result;

  result = -[PK_ipp_attribute_t copyWithZone:](self, "copyWithZone:", 0);
  *((_DWORD *)result + 6) = a3;
  return result;
}

- (NSMutableArray)values
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (int)group_tag
{
  return self->_group_tag;
}

- (int)value_tag
{
  return self->_value_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->x_name, 0);
}

- (void)withNewEmptyValue:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v4 = (void *)objc_opt_new();
  v5[2](v5, v4);
  -[NSMutableArray addObject:](self->_values, "addObject:", v4);

}

- (id)addNewEmptyValue
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[NSMutableArray addObject:](self->_values, "addObject:", v3);
  return v3;
}

- (void)toss_last_value
{
  -[NSMutableArray removeLastObject](self->_values, "removeLastObject");
}

- (void)setNSName:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *x_name;
  NSString *v7;

  v4 = (NSString *)a3;
  v7 = v4;
  if (v4)
  {
    internString(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    x_name = self->x_name;
    self->x_name = v5;
  }
  else
  {
    x_name = self->x_name;
    self->x_name = 0;
  }

}

- (void)setValueTag:(int)a3
{
  self->_value_tag = a3;
}

@end
