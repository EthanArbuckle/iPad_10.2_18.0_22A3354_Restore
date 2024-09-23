@implementation MTLModel

- (MTLModel)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLModel;
  return -[MTLModel init](&v3, sel_init);
}

- (MTLModel)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  MTLModel *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  MTLModel *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[MTLModel init](self, "init");
  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqual:", v15);

          if (v16)
            v17 = 0;
          else
            v17 = v14;
          if (!MTLValidateAndSetValue(v7, v13, v17, 1, (uint64_t)a4))
          {

            v18 = 0;
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          continue;
        break;
      }
    }

    v18 = v7;
LABEL_15:
    v6 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "transitoryPropertyKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "permanentPropertyKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLModel dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (void)mergeValueForKey:(id)a3 fromModel:(id)a4
{
  id v7;
  void *v8;
  id v9;
  SEL v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = v13;
  v9 = v7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLModel.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    v8 = 0;
  }
  v10 = MTLSelectorWithCapitalizedKeyPattern("merge", v8, "FromModel:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(MTLModel *, SEL, id))-[MTLModel methodForSelector:](self, "methodForSelector:", v10))(self, v10, v9);
  }
  else if (v9)
  {
    objc_msgSend(v9, "valueForKey:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTLModel setValue:forKey:](self, "setValue:forKey:", v11, v13);

  }
}

- (void)mergeValuesForKeysFromModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "propertyKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "propertyKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v5, "containsObject:", v11))
          -[MTLModel mergeValueForKey:fromModel:](self, "mergeValueForKey:fromModel:", v11, v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (BOOL)validate:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)objc_opt_class(), "propertyKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[MTLModel valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = MTLValidateAndSetValue(self, v10, v11, 0, (uint64_t)a3);

        if (!(_DWORD)v10)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MTLModel dictionaryValue](self, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValuesForKeysWithDictionary:", v5);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "permanentPropertyKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLModel dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)objc_opt_class(), "permanentPropertyKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[MTLModel valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 ^= objc_msgSend(v9, "hash");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MTLModel *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (MTLModel *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else if (-[MTLModel isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend((id)objc_opt_class(), "permanentPropertyKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[MTLModel valueForKey:](self, "valueForKey:", v10);
          v11 = objc_claimAutoreleasedReturnValue();
          -[MTLModel valueForKey:](v4, "valueForKey:", v10);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v11 | v12)
          {
            v13 = (void *)v12;
            v14 = objc_msgSend((id)v11, "isEqual:", v12);

            if (!v14)
            {
              v15 = 0;
              goto LABEL_16;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_16:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)generateAndCacheStorageBehaviors
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "propertyKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(a1, "storageBehaviorForPropertyWithKey:", v10);
        v12 = v3;
        if (v11 != 1)
        {
          if (v11 != 2)
            continue;
          v12 = v4;
        }
        objc_msgSend(v12, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_setAssociatedObject(a1, (const void *)MTLModelCachedTransitoryPropertyKeysKey, v3, (void *)0x303);
  objc_setAssociatedObject(a1, (const void *)MTLModelCachedPermanentPropertyKeysKey, v4, (void *)0x303);

}

+ (id)modelWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:error:", v6, a4);

  return v7;
}

+ (void)enumeratePropertiesUsingBlock:(id)a3
{
  void (**v4)(id, objc_property_t, _BYTE *);
  uint64_t v5;
  objc_property_t *v6;
  void (**v7)(_QWORD);
  unint64_t v8;
  BOOL v9;
  _QWORD v10[5];
  unsigned int outCount;
  char v12;

  v4 = (void (**)(id, objc_property_t, _BYTE *))a3;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  do
  {
    if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
      break;
    outCount = 0;
    v6 = class_copyPropertyList((Class)a1, &outCount);
    a1 = (id)objc_msgSend(a1, "superclass");
    if (v6)
    {
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __42__MTLModel_enumeratePropertiesUsingBlock___block_invoke;
      v10[3] = &__block_descriptor_40_e5_v8__0l;
      v10[4] = v6;
      v7 = (void (**)(_QWORD))_Block_copy(v10);
      if (outCount)
      {
        v8 = 0;
        do
        {
          v4[2](v4, v6[v8++], &v12);
          if (v12)
            v9 = 1;
          else
            v9 = v8 >= outCount;
        }
        while (!v9);
      }
      v7[2](v7);

    }
  }
  while (!v12);

}

+ (id)propertyKeys
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_getAssociatedObject(a1, (const void *)MTLModelCachedPropertyKeysKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __24__MTLModel_propertyKeys__block_invoke;
    v8[3] = &unk_1E7AF3098;
    v10 = a1;
    v5 = v6;
    v9 = v5;
    objc_msgSend(a1, "enumeratePropertiesUsingBlock:", v8);
    objc_setAssociatedObject(a1, (const void *)MTLModelCachedPropertyKeysKey, v5, (void *)0x303);

  }
  return v5;
}

+ (id)transitoryPropertyKeys
{
  void *v3;

  objc_getAssociatedObject(a1, (const void *)MTLModelCachedTransitoryPropertyKeysKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(a1, "generateAndCacheStorageBehaviors");
    objc_getAssociatedObject(a1, (const void *)MTLModelCachedTransitoryPropertyKeysKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)permanentPropertyKeys
{
  void *v3;

  objc_getAssociatedObject(a1, (const void *)MTLModelCachedPermanentPropertyKeysKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(a1, "generateAndCacheStorageBehaviors");
    objc_getAssociatedObject(a1, (const void *)MTLModelCachedPermanentPropertyKeysKey);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (unint64_t)storageBehaviorForPropertyWithKey:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  objc_property *Property;
  _BYTE *v8;
  void (**v9)(_QWORD);
  int v10;
  int v11;
  int v12;
  unint64_t v13;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = objc_retainAutorelease(v4);
  Property = class_getProperty(v5, (const char *)objc_msgSend(v6, "UTF8String"));
  if (Property)
  {
    v8 = mtl_copyPropertyAttributes(Property);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__MTLModel_storageBehaviorForPropertyWithKey___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v8;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v10 = objc_msgSend(a1, "instancesRespondToSelector:", *((_QWORD *)v8 + 2));
    v11 = objc_msgSend(a1, "instancesRespondToSelector:", *((_QWORD *)v8 + 3));
    if (v8[4] || (*((_QWORD *)v8 + 4) ? (v12 = 1) : (v12 = v10), ((v12 | v11) & 1) != 0))
    {
      if (!*v8 || *((_QWORD *)v8 + 4))
      {
        v13 = 2;
LABEL_14:
        v9[2](v9);

        goto LABEL_15;
      }
      if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) == 0)
      {
        v13 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "storageBehaviorForPropertyWithKey:", v6);
        goto LABEL_14;
      }
    }
    v13 = 0;
    goto LABEL_14;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

void __46__MTLModel_storageBehaviorForPropertyWithKey___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void __24__MTLModel_propertyKeys__block_invoke(uint64_t a1, objc_property_t property)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(property));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "storageBehaviorForPropertyWithKey:"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __42__MTLModel_enumeratePropertiesUsingBlock___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

- (id)decodeValueForKey:(id)a3 withCoder:(id)a4 modelVersion:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  SEL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLModel+NSCoding.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLModel+NSCoding.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder != nil"));

LABEL_3:
  v12 = MTLSelectorWithCapitalizedKeyPattern("decode", v9, "WithCoder:modelVersion:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ((void (*)(MTLModel *, SEL, void *, unint64_t))-[MTLModel methodForSelector:](self, "methodForSelector:", v12))(self, v12, v11, a5);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = (void *)v13;
    goto LABEL_11;
  }
  if (!coderRequiresSecureCoding(v11))
  {
    objc_msgSend(v11, "decodeObjectForKey:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "allowedSecureCodingClassesByPropertyKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLModel+NSCoding.m"), 141, CFSTR("No allowed classes specified for securely decoding key \"%@\" on %@"), v9, objc_opt_class());

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v16, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v17;
}

- (MTLModel)initWithCoder:(id)a3
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  MTLModel *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  MTLModel *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = coderRequiresSecureCoding(v5);
  if (v6)
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTLModelVersion"));
  else
    objc_msgSend(v5, "decodeObjectForKey:", CFSTR("MTLModelVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v11 = objc_opt_class();
    NSLog(CFSTR("Warning: decoding an archive of %@ without a version, assuming 0"), v11);
LABEL_8:
    if (v6)
    {
      v12 = (void *)objc_opt_class();
      verifyAllowedClassesByPropertyKey(v12);
    }
    else
    {
      objc_msgSend(v5, "decodeObjectForKey:", CFSTR("externalRepresentation"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (id)v13;
        v15 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", sel_dictionaryValueFromArchivedExternalRepresentation_version_);
        if (v15 == +[MTLModel methodForSelector:](MTLModel, "methodForSelector:", sel_dictionaryValueFromArchivedExternalRepresentation_version_))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTLModel+NSCoding.m"), 177, CFSTR("Decoded an old archive of %@ that contains an externalRepresentation, but +dictionaryValueFromArchivedExternalRepresentation:version: is not overridden to handle it"), objc_opt_class());

        }
        objc_msgSend((id)objc_opt_class(), "dictionaryValueFromArchivedExternalRepresentation:version:", v14, objc_msgSend(v8, "unsignedIntegerValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v10 = 0;
          goto LABEL_28;
        }
        v35 = 0;
        v17 = -[MTLModel initWithDictionary:error:](self, "initWithDictionary:error:", v16, &v35);
        v18 = v35;
        if (!v17)
        {
          v28 = objc_opt_class();
          NSLog(CFSTR("*** Could not decode old %@ archive: %@"), v28, v18);
        }
LABEL_27:
        self = v17;

        v10 = self;
LABEL_28:

        goto LABEL_29;
      }
    }
    objc_msgSend((id)objc_opt_class(), "propertyKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v19, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = v19;
    v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v14);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[MTLModel decodeValueForKey:withCoder:modelVersion:](self, "decodeValueForKey:withCoder:modelVersion:", v24, v5, objc_msgSend(v8, "unsignedIntegerValue"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, v24);

        }
        v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v21);
    }

    v30 = 0;
    v17 = -[MTLModel initWithDictionary:error:](self, "initWithDictionary:error:", v16, &v30);
    v18 = v30;
    if (!v17)
    {
      v29 = objc_opt_class();
      NSLog(CFSTR("*** Could not unarchive %@: %@"), v29, v18);
    }
    goto LABEL_27;
  }
  v9 = objc_msgSend(v7, "unsignedIntegerValue");
  if (v9 <= objc_msgSend((id)objc_opt_class(), "modelVersion"))
    goto LABEL_8;
  v10 = 0;
LABEL_29:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  MTLModel *v15;
  SEL v16;

  v5 = a3;
  if (coderRequiresSecureCoding(v5))
  {
    v6 = (void *)objc_opt_class();
    verifyAllowedClassesByPropertyKey(v6);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "modelVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("MTLModelVersion"));

  objc_msgSend((id)objc_opt_class(), "encodingBehaviorsByPropertyKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLModel dictionaryValue](self, "dictionaryValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__MTLModel_NSCoding__encodeWithCoder___block_invoke;
  v12[3] = &unk_1E7AF4570;
  v13 = v8;
  v14 = v5;
  v15 = self;
  v16 = a2;
  v10 = v5;
  v11 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __38__MTLModel_NSCoding__encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9)
    {
      if (v9 == 2)
      {
        objc_msgSend(*(id *)(a1 + 40), "encodeConditionalObject:forKey:", v5, v15);
      }
      else if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v15);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        v11 = *(_QWORD *)(a1 + 56);
        v13 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("MTLModel+NSCoding.m"), 232, CFSTR("Unrecognized encoding behavior %@ on class %@ for key \"%@\"), v13, v14, v15);

      }
    }
  }

}

+ (id)dictionaryValueFromArchivedExternalRepresentation:(id)a3 version:(unint64_t)a4
{
  return 0;
}

+ (unint64_t)modelVersion
{
  return 0;
}

+ (id)encodingBehaviorsByPropertyKey
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_property *Property;
  _BYTE *v10;
  _BYTE *v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  _QWORD aBlock[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "propertyKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7));
        Property = class_getProperty((Class)a1, (const char *)objc_msgSend(v8, "UTF8String"));
        if (Property)
        {
          v10 = mtl_copyPropertyAttributes(Property);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLModel+NSCoding.m"), 71, CFSTR("Could not find property \"%@\" on %@"), v8, a1);

          v10 = mtl_copyPropertyAttributes(0);
        }
        v11 = v10;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __52__MTLModel_NSCoding__encodingBehaviorsByPropertyKey__block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v10;
        v12 = (void (**)(_QWORD))_Block_copy(aBlock);
        if (v11[2])
          v13 = 2;
        else
          v13 = 1;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v8);

        v12[2](v12);
        ++v7;
      }
      while (v5 != v7);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v5 = v16;
    }
    while (v16);
  }

  return v4;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_property *Property;
  _BYTE *v13;
  _BYTE *v14;
  void (**v15)(_QWORD);
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id obj;
  _QWORD aBlock[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(a1, (const void *)MTLModelCachedAllowedClassesKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(a1, "encodingBehaviorsByPropertyKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keysOfEntriesPassingTest:", &__block_literal_global_43262);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (!v8)
      goto LABEL_20;
    v9 = *(_QWORD *)v25;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10));
        Property = class_getProperty((Class)a1, (const char *)objc_msgSend(v11, "UTF8String"));
        if (Property)
        {
          v13 = mtl_copyPropertyAttributes(Property);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTLModel+NSCoding.m"), 98, CFSTR("Could not find property \"%@\" on %@"), v11, a1);

          v13 = mtl_copyPropertyAttributes(0);
        }
        v14 = v13;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __61__MTLModel_NSCoding__allowedSecureCodingClassesByPropertyKey__block_invoke_2;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v13;
        v15 = (void (**)(_QWORD))_Block_copy(aBlock);
        v16 = v14[48];
        if (v16 == 35 || v16 == 64)
        {
          if (!*((_QWORD *)v14 + 5))
            goto LABEL_16;
          v28 = *((_QWORD *)v14 + 5);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v11);
        }
        else
        {
          v29 = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v11);
        }

LABEL_16:
        v15[2](v15);

        ++v10;
      }
      while (v8 != v10);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      v8 = v19;
      if (!v19)
      {
LABEL_20:

        objc_setAssociatedObject(a1, (const void *)MTLModelCachedAllowedClassesKey, v5, (void *)0x303);
        v4 = 0;
        goto LABEL_21;
      }
    }
  }
  v5 = v3;
LABEL_21:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

void __61__MTLModel_NSCoding__allowedSecureCodingClassesByPropertyKey__block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

BOOL __61__MTLModel_NSCoding__allowedSecureCodingClassesByPropertyKey__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "unsignedIntegerValue") != 0;
}

void __52__MTLModel_NSCoding__encodingBehaviorsByPropertyKey__block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

@end
