@implementation VUIMediaEntityKind

- (id)propertyDescriptorForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VUIMediaEntityKind propertyDescriptorsByName](self, "propertyDescriptorsByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)propertyDescriptorsByName
{
  return self->_propertyDescriptorsByName;
}

- (void)_updatePropertyDescriptorsByName
{
  VUIMediaEntityKind *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *propertyDescriptorsByName;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VUIMediaEntityKind propertyDescriptors](v2, "propertyDescriptors");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "name", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v8, v9);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend(v3, "copy");
  propertyDescriptorsByName = v2->_propertyDescriptorsByName;
  v2->_propertyDescriptorsByName = (NSDictionary *)v10;

  objc_sync_exit(v2);
}

- (id)sortingPropertyDescriptorForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[VUIMediaEntityKind propertyDescriptorForName:](self, "propertyDescriptorForName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "sortAsName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[VUIMediaEntityKind propertyDescriptorForName:](self, "propertyDescriptorForName:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
      if (!v7)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown sortAs property %@"), v6);
    }

  }
  return v5;
}

- (void)setPropertyDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *propertyDescriptors;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  propertyDescriptors = self->_propertyDescriptors;
  self->_propertyDescriptors = v4;

  -[VUIMediaEntityKind _updatePropertyDescriptorsByName](self, "_updatePropertyDescriptorsByName");
}

- (NSArray)propertyDescriptors
{
  return self->_propertyDescriptors;
}

- (VUIMediaEntityKind)initWithMediaEntityClassName:(id)a3
{
  id v5;
  VUIMediaEntityKind *v6;
  VUIMediaEntityKind *v7;
  NSArray *propertyDescriptors;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUIMediaEntityKind;
  v6 = -[VUIMediaEntityKind init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaEntityClassName, a3);
    propertyDescriptors = v7->_propertyDescriptors;
    v7->_propertyDescriptors = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v7;
}

- (VUIMediaEntityKind)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMediaEntityKind *v4;
  uint64_t v5;
  NSArray *propertyDescriptors;

  v4 = -[VUIMediaEntityKind initWithMediaEntityClassName:]([VUIMediaEntityKind alloc], "initWithMediaEntityClassName:", self->_mediaEntityClassName);
  v5 = -[NSArray copy](self->_propertyDescriptors, "copy");
  propertyDescriptors = v4->_propertyDescriptors;
  v4->_propertyDescriptors = (NSArray *)v5;

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMediaEntityKind;
  -[VUIMediaEntityKind description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityKind mediaEntityClassName](self, "mediaEntityClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaEntityClassName"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityKind propertyDescriptors](self, "propertyDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("propertyDescriptors"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)mediaEntityClassName
{
  return self->_mediaEntityClassName;
}

- (void)setPropertyDescriptorsByName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyDescriptors, 0);
  objc_storeStrong((id *)&self->_propertyDescriptorsByName, 0);
  objc_storeStrong((id *)&self->_mediaEntityClassName, 0);
}

@end
