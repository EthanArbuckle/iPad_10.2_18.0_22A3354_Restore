@implementation PKShippingMethods

+ (PKShippingMethods)shippingMethodsWithProtobuf:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PKShippingMethods *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "methods", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        +[PKShippingMethod shippingMethodWithProtobuf:](PKShippingMethod, "shippingMethodWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "defaultMethod");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKShippingMethod shippingMethodWithProtobuf:](PKShippingMethod, "shippingMethodWithProtobuf:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PKShippingMethods initWithMethods:defaultMethod:]([PKShippingMethods alloc], "initWithMethods:defaultMethod:", v4, v12);
  return v13;
}

- (id)protobuf
{
  PKProtobufShippingMethods *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PKProtobufShippingMethods);
  -[PKShippingMethods methods](self, "methods");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PKShippingMethods methods](self, "methods", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "shippingMethodProtobuf");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    -[PKProtobufShippingMethods setMethods:](v3, "setMethods:", v6);
  }
  -[PKShippingMethods defaultMethod](self, "defaultMethod");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shippingMethodProtobuf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufShippingMethods setDefaultMethod:](v3, "setDefaultMethod:", v14);

  return v3;
}

- (PKShippingMethods)init
{
  return -[PKShippingMethods initWithMethods:defaultMethod:](self, "initWithMethods:defaultMethod:", MEMORY[0x1E0C9AA60], 0);
}

- (PKShippingMethods)initWithLegacyShippingMethods:(id)a3
{
  return -[PKShippingMethods initWithMethods:defaultMethod:](self, "initWithMethods:defaultMethod:", a3, 0);
}

- (PKShippingMethods)initWithMethods:(id)a3 defaultMethod:(id)a4
{
  id v6;
  id v7;
  PKShippingMethods *v8;
  PKShippingMethods *v9;
  NSArray *legacyShippingMethods;
  uint64_t v11;
  NSOrderedSet *methodsSet;
  uint64_t v13;
  NSObject *v14;
  PKShippingMethod *defaultMethod;
  uint8_t v17[16];
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKShippingMethods;
  v8 = -[PKShippingMethods init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    legacyShippingMethods = v8->_legacyShippingMethods;
    v8->_legacyShippingMethods = 0;

    if (v6)
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
    else
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v11 = objc_claimAutoreleasedReturnValue();
    methodsSet = v9->_methodsSet;
    v9->_methodsSet = (NSOrderedSet *)v11;

    if (-[NSOrderedSet containsObject:](v9->_methodsSet, "containsObject:", v7))
    {
      v13 = objc_msgSend(v7, "copy");
    }
    else
    {
      if (v7)
      {
        PKLogFacilityTypeGetObject(7uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "PKShippingMethods: Default shipping method provided, but doesn't exist in set. Defaulting to first item instead.", v17, 2u);
        }

      }
      -[NSOrderedSet firstObject](v9->_methodsSet, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    defaultMethod = v9->_defaultMethod;
    v9->_defaultMethod = (PKShippingMethod *)v13;

  }
  return v9;
}

- (NSArray)legacyShippingMethods
{
  NSArray *legacyShippingMethods;
  NSUInteger v4;
  NSOrderedSet *methodsSet;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  legacyShippingMethods = self->_legacyShippingMethods;
  if (!legacyShippingMethods)
  {
    v4 = -[NSOrderedSet indexOfObject:](self->_methodsSet, "indexOfObject:", self->_defaultMethod);
    methodsSet = self->_methodsSet;
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSOrderedSet array](methodsSet, "array");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_legacyShippingMethods;
      self->_legacyShippingMethods = v6;
    }
    else
    {
      v7 = (NSArray *)-[NSOrderedSet mutableCopy](methodsSet, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray moveObjectsAtIndexes:toIndex:](v7, "moveObjectsAtIndexes:toIndex:", v8, 0);

      -[NSArray array](v7, "array");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_legacyShippingMethods;
      self->_legacyShippingMethods = v9;

    }
    legacyShippingMethods = self->_legacyShippingMethods;
  }
  return legacyShippingMethods;
}

- (NSArray)methods
{
  return -[NSOrderedSet array](self->_methodsSet, "array");
}

- (PKShippingMethods)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKShippingMethods *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("methods"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultMethod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PKShippingMethods initWithMethods:defaultMethod:](self, "initWithMethods:defaultMethod:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKShippingMethods methods](self, "methods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("methods"));

  -[PKShippingMethods defaultMethod](self, "defaultMethod");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("defaultMethod"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSOrderedSet copyWithZone:](self->_methodsSet, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[PKShippingMethod copyWithZone:](self->_defaultMethod, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_methodsSet);
  objc_msgSend(v3, "safelyAddObject:", self->_defaultMethod);
  v7.receiver = self;
  v7.super_class = (Class)PKShippingMethods;
  v4 = -[PKShippingMethods hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKShippingMethods *v4;
  PKShippingMethods *v5;
  BOOL v6;

  v4 = (PKShippingMethods *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKShippingMethods isEqualToShippingMethods:](self, "isEqualToShippingMethods:", v5);

  return v6;
}

- (BOOL)isEqualToShippingMethods:(id)a3
{
  _QWORD *v4;
  NSOrderedSet *methodsSet;
  NSOrderedSet *v6;
  BOOL v7;
  BOOL v8;
  PKShippingMethod *defaultMethod;
  PKShippingMethod *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  methodsSet = self->_methodsSet;
  v6 = (NSOrderedSet *)v4[2];
  if (methodsSet)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSOrderedSet isEqual:](methodsSet, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (methodsSet != v6)
    goto LABEL_8;
LABEL_11:
  defaultMethod = self->_defaultMethod;
  v11 = (PKShippingMethod *)v4[3];
  if (defaultMethod && v11)
    v8 = -[PKShippingMethod isEqual:](defaultMethod, "isEqual:");
  else
    v8 = defaultMethod == v11;
LABEL_9:

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("methods: %d, "), -[NSOrderedSet count](self->_methodsSet, "count"));
  -[PKShippingMethod identifier](self->_defaultMethod, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultMethod identifier: %@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (PKShippingMethod)defaultMethod
{
  return self->_defaultMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMethod, 0);
  objc_storeStrong((id *)&self->_methodsSet, 0);
  objc_storeStrong((id *)&self->_legacyShippingMethods, 0);
}

@end
