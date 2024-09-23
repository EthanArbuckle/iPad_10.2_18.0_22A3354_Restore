@implementation STListData

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STListData initWithListData:](+[STMutableListData allocWithZone:](STMutableListData, "allocWithZone:", a3), self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

- (STListData)init
{
  void *v3;
  STListData *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STListData initWithObjects:](self, "initWithObjects:", v3);

  return v4;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[STListData objects](self, "objects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)initWithListData:(void *)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "objects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v2, "initWithObjects:", v3);

  }
  return v2;
}

- (STListData)initWithObjects:(id)a3
{
  id v4;
  STListData *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *objects;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STListData;
  v5 = -[STListData init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    objects = v5->_objects;
    v5->_objects = v8;

  }
  return v5;
}

- (NSArray)objects
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_objects, "copy");
}

id __22__STListData_isEqual___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3550]);
  objc_msgSend(*(id *)(a1 + 32), "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3550]);
  -[STListData objects](self, "objects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __22__STListData_isEqual___block_invoke;
  v12[3] = &unk_1E91E5AB0;
  v13 = v4;
  v9 = v4;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", v8, v12);

  LOBYTE(v7) = objc_msgSend(v5, "isEqual");
  return (char)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STListData objects](self, "objects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objects"));

}

- (STListData)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  STListData *v9;

  v4 = a3;
  objc_opt_self();
  if (qword_1ED0CB470 != -1)
    dispatch_once(&qword_1ED0CB470, &__block_literal_global_13_0);
  v5 = (id)_MergedGlobals_12;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("objects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
  {
    self = -[STListData initWithObjects:](self, "initWithObjects:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[STListData objects](self, "objects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__STListData_enumerateObjectsUsingBlock___block_invoke;
    v6[3] = &unk_1E91E5A88;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STListData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STListData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(a1, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(a1, "objects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeMultilinePrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v7, 0, v8, 1);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

uint64_t __41__STListData_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3550]);
  -[STListData objects](self, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (NSString)description
{
  return (NSString *)-[STListData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STListData debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STListData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STListData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEmpty"))
    {
      v5 = (void *)-[STListData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STListData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableListData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __35__STListData__encodableObjectTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v16, v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v10;

}

@end
