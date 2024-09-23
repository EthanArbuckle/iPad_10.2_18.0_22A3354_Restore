@implementation CRObject

- (CRObject)init
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  CRSet *v11;
  CRSet *v12;
  void *v13;
  CRObject *v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "CRProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", CRPropertyRegisterLatest))
        {
          +[CRRegister registerWithType:contents:](CRRegister, "registerWithType:contents:", 0, 0);
          v11 = (CRSet *)objc_claimAutoreleasedReturnValue();
LABEL_10:
          v12 = v11;
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v9);

          goto LABEL_12;
        }
        if (objc_msgSend(v10, "isEqual:", CRPropertySet))
        {
          v11 = objc_alloc_init(CRSet);
          goto LABEL_10;
        }
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);
LABEL_12:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  -[CRObject setupConstraintsFor:in:](self, "setupConstraintsFor:in:", v4, v3);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CRObject initWithIdentity:fields:](self, "initWithIdentity:fields:", v13, v3);

  return v14;
}

- (CRObject)initWithIdentity:(id)a3 fields:(id)a4
{
  id v7;
  id v8;
  CRObject *v9;
  CRObject *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRObject;
  v9 = -[CRObject init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_fields, a4);
  }

  return v10;
}

- (CRObject)initWithCRCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  CRObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeUUIDForKey:", CFSTR("identity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)objc_opt_class(), "CRProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "decodeObjectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  -[CRObject setupConstraintsFor:in:](self, "setupConstraintsFor:in:", v7, v6);
  v14 = -[CRObject initWithIdentity:fields:](self, "initWithIdentity:fields:", v5, v6);
  if (v14)
  {
    objc_msgSend(v4, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRObject identity](v14, "identity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v17);

  }
  return v14;
}

- (void)encodeWithCRCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[CRObject identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeUUID:forKey:", v5, CFSTR("identity"));

  -[CRObject fields](self, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__CRObject_encodeWithCRCoder___block_invoke;
  v8[3] = &unk_1E67FACE0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

uint64_t __30__CRObject_encodeWithCRCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", a3, a2);
}

- (void)setupConstraintsFor:(id)a3 in:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "isEqual:", CRPropertyOneOfKey);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

+ (id)CRProperties
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)setFieldKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *fields;

  v6 = a4;
  v7 = a3;
  -[CRObject fields](self, "fields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSDictionary *)objc_msgSend(v8, "mutableCopy");

  -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, v7);
  fields = self->_fields;
  self->_fields = v9;

}

- (void)mergeWith:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Invalid CRObject merge, classes must be equal for merge."), 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v4);
    }
    -[CRObject mergeWithObject:](self, "mergeWithObject:", v5);
  }

}

- (void)mergeWithObject:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "fields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__CRObject_mergeWithObject___block_invoke;
  v5[3] = &unk_1E67FACE0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __28__CRObject_mergeWithObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "fields");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mergeWith:", v5);
}

- (void)setDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *fields;
  NSDictionary *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NSDictionary *v17;

  v4 = a3;
  objc_msgSend(v4, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRObject identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self, v6);

  v7 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[CRObject fields](self, "fields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  -[CRObject fields](self, "fields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __24__CRObject_setDocument___block_invoke;
  v15[3] = &unk_1E67FAD08;
  v16 = v4;
  v11 = v9;
  v17 = v11;
  v14 = v4;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

  fields = self->_fields;
  self->_fields = v11;
  v13 = v11;

}

void __24__CRObject_setDocument___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "localObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

  objc_msgSend(v7, "setDocument:", *(_QWORD *)(a1 + 32));
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CRObject fields](self, "fields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __26__CRObject_deltaSince_in___block_invoke;
  v17[3] = &unk_1E67FAD30;
  v18 = v6;
  v19 = v7;
  v10 = v8;
  v20 = v10;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v17);

  if (objc_msgSend(v10, "count"))
  {
    v13 = objc_alloc((Class)objc_opt_class());
    -[CRObject identity](self, "identity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithIdentity:fields:", v14, v10);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __26__CRObject_deltaSince_in___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "deltaSince:in:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v6);

}

- (void)walkGraph:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CRObject fields](self, "fields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__CRObject_walkGraph___block_invoke;
  v7[3] = &unk_1E67FAD58;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __22__CRObject_walkGraph___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)tombstone
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)objc_opt_class());
  -[CRObject identity](self, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentity:fields:", v4, MEMORY[0x1E0C9AA70]);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CRObject identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRObject identity](self, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[CRObject fields](self, "fields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRObject identity](self, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CR_shortDescription");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v4)
  {
    -[CRObject fields](self, "fields");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p %@ %@>"), v7, self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p %@>"), v7, self, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v12;
}

+ (id)keyFromSelector:(SEL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  NSStringFromSelector(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("set")))
  {
    objc_msgSend(v3, "substringWithRange:", 3, objc_msgSend(v3, "length") - 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "substringToIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringFromIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  objc_class *v10;
  void (*v11)(void);
  const char *v12;
  BOOL v13;

  +[CRObject keyFromSelector:](CRObject, "keyFromSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(a1, "CRProperties"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKey:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("set"));

    v10 = (objc_class *)objc_opt_class();
    if (v9)
    {
      v11 = (void (*)(void))setPropertyIMP;
      v12 = "v@:@";
    }
    else
    {
      v11 = (void (*)(void))propertyIMP;
      v12 = "@@:";
    }
    class_addMethod(v10, a3, v11, v12);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
