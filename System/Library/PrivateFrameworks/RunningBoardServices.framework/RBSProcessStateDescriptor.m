@implementation RBSProcessStateDescriptor

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endowmentNamespaces, 0);
}

- (void)filterState:(id)a3
{
  id v4;
  void *v5;
  unint64_t values;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v5 = v4;
  values = self->_values;
  if ((values & 1) != 0)
  {
    if ((values & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(v4, "setTaskState:", 0);
    objc_msgSend(v5, "setDebugState:", 0);
    if ((values & 4) != 0)
    {
LABEL_3:
      if ((values & 0x8000) != 0)
        goto LABEL_4;
LABEL_11:
      if (-[NSSet count](self->_endowmentNamespaces, "count")
        && (objc_msgSend(v5, "endowmentNamespaces"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        v8 = (void *)-[NSSet mutableCopy](self->_endowmentNamespaces, "mutableCopy");
        objc_msgSend(v5, "endowmentNamespaces");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "intersectSet:", v9);

        if (objc_msgSend(v8, "count"))
          v10 = v8;
        else
          v10 = 0;
        objc_msgSend(v5, "setEndowmentNamespaces:", v10);

        if ((values & 2) == 0)
          goto LABEL_19;
      }
      else
      {
        objc_msgSend(v5, "setEndowmentNamespaces:", 0);
        if ((values & 2) == 0)
          goto LABEL_19;
      }
LABEL_5:
      if ((values & 8) != 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  objc_msgSend(v5, "setTerminationResistance:", 0);
  if ((values & 0x8000) == 0)
    goto LABEL_11;
LABEL_4:
  if ((values & 2) != 0)
    goto LABEL_5;
LABEL_19:
  objc_msgSend(v5, "setTags:", 0);
  if ((values & 8) != 0)
  {
LABEL_6:
    if ((values & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v5, "setLegacyAssertions:", 0);
  if ((values & 0x10) != 0)
  {
LABEL_7:
    if ((values & 0x20) == 0)
      goto LABEL_26;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v5, "setPrimitiveAssertions:", 0);
  if ((values & 0x20) == 0)
  {
LABEL_26:
    objc_msgSend(v5, "setEndowmentInfos:", 0);
    goto LABEL_27;
  }
LABEL_22:
  if (!-[NSSet count](self->_endowmentNamespaces, "count"))
    goto LABEL_26;
  objc_msgSend(v5, "endowmentInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_26;
  v12 = (void *)-[NSSet mutableCopy](self->_endowmentNamespaces, "mutableCopy");
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endowmentInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __41__RBSProcessStateDescriptor_filterState___block_invoke;
  v19 = &unk_1E2D17A50;
  v14 = v12;
  v20 = v14;
  v21 = &v22;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v16);

  if (objc_msgSend((id)v23[5], "count", v16, v17, v18, v19))
    v15 = v23[5];
  else
    v15 = 0;
  objc_msgSend(v5, "setEndowmentInfos:", v15);

  _Block_object_dispose(&v22, 8);
LABEL_27:

}

- (unint64_t)values
{
  return self->_values;
}

- (id)_endowmentNamespaces
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

- (void)setValues:(unint64_t)a3
{
  self->_values = a3;
}

+ (id)descriptor
{
  return objc_alloc_init((Class)a1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSProcessStateDescriptor *v4;
  uint64_t v5;
  NSSet *endowmentNamespaces;

  v4 = -[RBSProcessStateDescriptor init](+[RBSProcessStateDescriptor allocWithZone:](RBSProcessStateDescriptor, "allocWithZone:", a3), "init");
  v4->_values = self->_values;
  v5 = -[NSSet copy](self->_endowmentNamespaces, "copy");
  endowmentNamespaces = v4->_endowmentNamespaces;
  v4->_endowmentNamespaces = (NSSet *)v5;

  return v4;
}

- (RBSProcessStateDescriptor)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessStateDescriptor *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *endowmentNamespaces;

  v4 = a3;
  v5 = -[RBSProcessStateDescriptor init](self, "init");
  if (v5)
  {
    v5->_values = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("_values"));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("_endowmentNamespaces"));
    v7 = objc_claimAutoreleasedReturnValue();
    endowmentNamespaces = v5->_endowmentNamespaces;
    v5->_endowmentNamespaces = (NSSet *)v7;

  }
  return v5;
}

- (RBSProcessStateDescriptor)init
{
  RBSProcessStateDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSProcessStateDescriptor;
  result = -[RBSProcessStateDescriptor init](&v3, sel_init);
  if (result)
    result->_values = 1;
  return result;
}

- (NSString)debugDescription
{
  void *v2;
  id v4;
  void *v5;
  unint64_t values;
  const __CFString *v7;
  NSUInteger v8;
  __CFString *v9;
  NSUInteger v10;
  const __CFString *v11;
  void *v12;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  values = self->_values;
  if (-[NSSet count](self->_endowmentNamespaces, "count"))
    v7 = CFSTR(" namespaces:[");
  else
    v7 = &stru_1E2D183D0;
  v8 = -[NSSet count](self->_endowmentNamespaces, "count");
  if (v8)
  {
    -[NSSet allObjects](self->_endowmentNamespaces, "allObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E2D183D0;
  }
  v10 = -[NSSet count](self->_endowmentNamespaces, "count");
  v11 = CFSTR("]");
  if (!v10)
    v11 = &stru_1E2D183D0;
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@| values:%llx%@%@%@>"), v5, values, v7, v9, v11);
  if (v8)
  {

  }
  return (NSString *)v12;
}

- (void)setEndowmentNamespaces:(id)a3
{
  NSSet *v4;
  NSSet *endowmentNamespaces;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    endowmentNamespaces = self->_endowmentNamespaces;
    self->_endowmentNamespaces = v4;
  }
  else
  {
    endowmentNamespaces = self->_endowmentNamespaces;
    self->_endowmentNamespaces = 0;
  }

}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  unint64_t values;
  id v5;
  id v6;

  values = self->_values;
  v5 = a3;
  objc_msgSend(v5, "encodeUInt64:forKey:", values, CFSTR("_values"));
  -[RBSProcessStateDescriptor endowmentNamespaces](self, "endowmentNamespaces");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_endowmentNamespaces"));

}

- (NSArray)endowmentNamespaces
{
  return -[NSSet allObjects](self->_endowmentNamespaces, "allObjects");
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| values:%llx>"), v4, self->_values);

  return (NSString *)v5;
}

void __41__RBSProcessStateDescriptor_filterState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v7 = v3;
  objc_msgSend(v3, "endowmentNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "intersectsSet:", v6))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

}

- (BOOL)isEqual:(id)a3
{
  RBSProcessStateDescriptor *v4;
  uint64_t v5;
  char v6;
  RBSProcessStateDescriptor *v7;
  RBSProcessStateDescriptor *v8;
  NSSet *endowmentNamespaces;
  const __CFSet *v10;
  CFIndex Count;

  v4 = (RBSProcessStateDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_14;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    v8 = v7;
    if (self->_values != v7->_values)
      goto LABEL_11;
    endowmentNamespaces = self->_endowmentNamespaces;
    v10 = (const __CFSet *)v7->_endowmentNamespaces;
    if (endowmentNamespaces == (NSSet *)v10)
    {
      v6 = 1;
      goto LABEL_13;
    }
    v6 = 0;
    if (!endowmentNamespaces || !v10)
      goto LABEL_13;
    Count = CFSetGetCount((CFSetRef)endowmentNamespaces);
    if (Count == CFSetGetCount(v10))
      v6 = -[NSSet isEqualToSet:](endowmentNamespaces, "isEqualToSet:", v10);
    else
LABEL_11:
      v6 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

@end
