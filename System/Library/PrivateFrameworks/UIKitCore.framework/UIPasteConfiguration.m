@implementation UIPasteConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptableTypes, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSMutableOrderedSet copy](self->_acceptableTypes, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (UIPasteConfiguration)initWithAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers
{
  NSArray *v4;
  UIPasteConfiguration *v5;
  UIPasteConfiguration *v6;

  v4 = acceptableTypeIdentifiers;
  v5 = -[UIPasteConfiguration init](self, "init");
  v6 = v5;
  if (v5)
    -[NSMutableOrderedSet addObjectsFromArray:](v5->_acceptableTypes, "addObjectsFromArray:", v4);

  return v6;
}

- (UIPasteConfiguration)init
{
  UIPasteConfiguration *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *acceptableTypes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPasteConfiguration;
  v2 = -[UIPasteConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    acceptableTypes = v2->_acceptableTypes;
    v2->_acceptableTypes = v3;

  }
  return v2;
}

+ (id)_pasteConfigurationForAcceptingClasses:(id)a3
{
  id v3;
  UIPasteConfiguration *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(UIPasteConfiguration);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[UIPasteConfiguration addTypeIdentifiersForAcceptingClass:](v4, "addTypeIdentifiersForAcceptingClass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)addAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers
{
  -[NSMutableOrderedSet addObjectsFromArray:](self->_acceptableTypes, "addObjectsFromArray:", acceptableTypeIdentifiers);
}

- (UIPasteConfiguration)initWithTypeIdentifiersForAcceptingClass:(id)aClass
{
  UIPasteConfiguration *v4;
  UIPasteConfiguration *v5;

  v4 = -[UIPasteConfiguration init](self, "init");
  v5 = v4;
  if (v4)
    -[UIPasteConfiguration addTypeIdentifiersForAcceptingClass:](v4, "addTypeIdentifiersForAcceptingClass:", aClass);
  return v5;
}

- (void)addTypeIdentifiersForAcceptingClass:(id)aClass
{
  NSMutableOrderedSet *acceptableTypes;
  id v4;

  acceptableTypes = self->_acceptableTypes;
  objc_msgSend(aClass, "readableTypeIdentifiersForItemProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObjectsFromArray:](acceptableTypes, "addObjectsFromArray:", v4);

}

+ (UIPasteConfiguration)pasteConfigurationWithAcceptableTypes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAcceptableTypes:", v4);

  return (UIPasteConfiguration *)v5;
}

- (void)setAcceptableTypeIdentifiers:(NSArray *)acceptableTypeIdentifiers
{
  objc_class *v4;
  NSArray *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *acceptableTypes;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = acceptableTypeIdentifiers;
  v6 = (NSMutableOrderedSet *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  acceptableTypes = self->_acceptableTypes;
  self->_acceptableTypes = v6;

}

- (NSArray)acceptableTypeIdentifiers
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_acceptableTypes, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableOrderedSet *acceptableTypes;
  uint64_t v6;
  BOOL v8;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    acceptableTypes = self->_acceptableTypes;
    v6 = v4[1];

    return -[NSMutableOrderedSet isEqualToOrderedSet:](acceptableTypes, "isEqualToOrderedSet:", v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIPasteConfiguration;
    v8 = -[UIPasteConfiguration isEqual:](&v9, sel_isEqual_, v4);

    return v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIPasteConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIPasteConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableOrderedSet *acceptableTypes;

  v4 = a3;
  v5 = -[UIPasteConfiguration init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("at"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    acceptableTypes = v5->_acceptableTypes;
    v5->_acceptableTypes = (NSMutableOrderedSet *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableOrderedSet *acceptableTypes;
  id v4;
  id v5;

  acceptableTypes = self->_acceptableTypes;
  if (acceptableTypes)
  {
    v4 = a3;
    v5 = (id)-[NSMutableOrderedSet copy](acceptableTypes, "copy");
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("at"));

  }
}

@end
