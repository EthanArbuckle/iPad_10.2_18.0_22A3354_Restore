@implementation WFResourceNode

+ (id)nodesWithDefinitions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  WFResourceNode *v12;
  WFResourceNode *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = -[WFResourceNode initWithResource:subnodes:]([WFResourceNode alloc], "initWithResource:subnodes:", v11, v9);
          goto LABEL_10;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
LABEL_10:
          v13 = v12;
          if (!v12)
            goto LABEL_21;
LABEL_11:
          objc_msgSend(v4, "addObject:", v13, (_QWORD)v17);
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "length", (_QWORD)v17))
        {
          v21 = CFSTR("WFResourceClass");
          v22 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_20;
          v14 = v11;
        }
        v15 = v14;
        if (!v14)
        {
LABEL_20:
          v13 = 0;
          goto LABEL_21;
        }
        v13 = -[WFResourceNode initWithDefinition:]([WFResourceNode alloc], "initWithDefinition:", v14);

        if (v13)
          goto LABEL_11;
LABEL_21:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  return v4;
}

- (WFResourceNode)initWithDefinition:(id)a3
{
  id v4;
  NSString *v5;
  Class v6;
  uint64_t v7;
  WFResourceNode *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("WFResourceClass"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSClassFromString(v5);

  if (-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
  {
    if (-[objc_class isSingleton](v6, "isSingleton"))
    {
      -[objc_class sharedInstance](v6, "sharedInstance");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = objc_msgSend([v6 alloc], "initWithDefinition:", v4);
    }
    v9 = (void *)v7;
    v10 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("RequiredResources"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nodesWithDefinitions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[WFResourceNode initWithResource:subnodes:](self, "initWithResource:subnodes:", v9, v12);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (WFResourceNode)initWithResource:(id)a3 subnodes:(id)a4
{
  id v7;
  id v8;
  WFResourceNode *v9;
  WFResourceNode *v10;
  void *v11;
  uint64_t v12;
  NSArray *subnodes;
  WFResourceNode *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFResourceNode;
  v9 = -[WFResourceNode init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resource, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_resourceUpdated, CFSTR("WFResourceAvailabilityChangedNotification"), v10->_resource);

    v12 = objc_msgSend(v8, "copy");
    subnodes = v10->_subnodes;
    v10->_subnodes = (NSArray *)v12;

    -[NSArray makeObjectsPerformSelector:withObject:](v10->_subnodes, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, v10);
    v14 = v10;
  }

  return v10;
}

- (WFResourceNode)initWithResource:(id)a3
{
  return -[WFResourceNode initWithResource:subnodes:](self, "initWithResource:subnodes:", a3, MEMORY[0x1E0C9AA60]);
}

- (void)resourceUpdated
{
  void *v3;
  char v4;
  id v5;

  -[WFResourceNode delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFResourceNode delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resourceNodeAvailabilityChanged:", self);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFResourceAvailabilityChangedNotification"), self->_resource);

  v4.receiver = self;
  v4.super_class = (Class)WFResourceNode;
  -[WFResourceNode dealloc](&v4, sel_dealloc);
}

- (void)refreshAvailability
{
  void *v3;
  id v4;

  -[WFResourceNode subnodes](self, "subnodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_refreshAvailability);

  -[WFResourceNode resource](self, "resource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshAvailabilityWithNotification");

}

- (id)resourceObjectsOfClass:(Class)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFResourceNode resourceObjectsOfClasses:](self, "resourceObjectsOfClasses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)resourceObjectsConformingToProtocol:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFResourceNode addResourceObjectsOfClassesOrProtocols:toSet:](self, "addResourceObjectsOfClassesOrProtocols:toSet:", v6, v5);
  return v5;
}

- (id)resourceObjectsOfClasses:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "anyObject"))
    -[WFResourceNode addResourceObjectsOfClassesOrProtocols:toSet:](self, "addResourceObjectsOfClassesOrProtocols:toSet:", v4, v5);

  return v5;
}

- (void)addResourceObjectsOfClassesOrProtocols:(id)a3 toSet:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BOOL4 isClass;
  void *v14;
  void *v15;
  char isKindOfClass;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        isClass = object_isClass(v12);
        -[WFResourceNode resource](self, "resource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!isClass)
        {
          v17 = objc_msgSend(v14, "conformsToProtocol:", v12);

          if (!v17)
            continue;
LABEL_10:
          -[WFResourceNode resource](self, "resource");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v18);

          continue;
        }
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          goto LABEL_10;
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[WFResourceNode subnodes](self, "subnodes", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "addResourceObjectsOfClassesOrProtocols:toSet:", v6, v7);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v21);
  }

}

- (NSString)description
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
  -[WFResourceNode resource](self, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFResourceNode subnodes](self, "subnodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, resource: %@, subnodes count: %lu>"), v5, self, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (WFResource)resource
{
  return self->_resource;
}

- (NSArray)subnodes
{
  return self->_subnodes;
}

- (WFResourceNodeDelegate)delegate
{
  return (WFResourceNodeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subnodes, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

@end
