@implementation PLGraphNodeContainer

- (PLGraphNodeContainer)initWithNode:(id)a3
{
  id v6;
  PLGraphNodeContainer *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLGraphNodeContainer;
  v7 = -[PLGraphNodeContainer init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLGraphNodeContainer.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

    }
    objc_storeStrong((id *)&v7->_sourceNode, a3);
  }

  return v7;
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setUuid:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuid:", v4);

}

- (signed)cloudLocalState
{
  void *v2;
  signed __int16 v3;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudLocalState");

  return v3;
}

- (void)setCloudLocalState:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudLocalState:", v3);

}

- (signed)cloudDeleteState
{
  void *v2;
  signed __int16 v3;

  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudDeleteState");

  return v3;
}

- (void)setCloudDeleteState:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[PLGraphNodeContainer sourceNode](self, "sourceNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudDeleteState:", v3);

}

- (void)updateChangeFlagsForNodeContainerKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "changeFlagsKeysByNodeContainerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PLGraphNodeContainer_updateChangeFlagsForNodeContainerKey___block_invoke;
  v7[3] = &unk_1E3661E40;
  v7[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

- (PLGraphNode)sourceNode
{
  return self->_sourceNode;
}

- (void)setSourceNode:(id)a3
{
  objc_storeStrong((id *)&self->_sourceNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceNode, 0);
}

void __61__PLGraphNodeContainer_updateChangeFlagsForNodeContainerKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "sourceNode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v7 + 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, v4);

}

+ (id)newNodeContainerWithNode:(id)a3 containerClass:(Class)a4
{
  id v7;
  objc_class *v8;
  void *v10;

  v7 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNodeContainer.m"), 35, CFSTR("Couldn't find container class for node: %@"), v7);

  }
  v8 = -[objc_class initWithNode:](-[objc_class alloc](a4, "alloc"), "initWithNode:", v7);

  return v8;
}

+ (id)newNodeContainerWithNode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "newNodeContainerWithNode:containerClass:", v4, objc_msgSend(v4, "nodeContainerClass"));

  return v5;
}

+ (NSSet)requiredNodeValueKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
}

+ (NSSet)sortableKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)changeFlagsKeysByNodeContainerKey
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)changeFlagKeysForNodeContainerKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "changeFlagsKeysByNodeContainerKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)nodeContainerKeysByChangeFlagKey
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "changeFlagsKeysByNodeContainerKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke;
  v7[3] = &unk_1E3677EE0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

+ (id)defaultValueForRequiredNodeValueKey:(id)a3 forNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLGraphNodeValue, "insertInManagedObjectContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setNode:", v5);
  objc_msgSend(v8, "setValueName:", v6);

  return v8;
}

+ (void)validateAllKnownSubclassesWithManagedObjectContext:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  v5 = v3;
  v4 = v3;
  PFObjc_enumerateSubclassesForHeader();

}

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a1;
  PFAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

void __75__PLGraphNodeContainer_validateAllKnownSubclassesWithManagedObjectContext___block_invoke(uint64_t a1, Class aClass)
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  Class v10;

  NSStringFromClass(aClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__PLGraphNodeContainer_validateAllKnownSubclassesWithManagedObjectContext___block_invoke_2;
  v7[3] = &unk_1E3669960;
  v10 = aClass;
  v8 = v5;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v8, "performBlockAndWait:", v7);

}

void __75__PLGraphNodeContainer_validateAllKnownSubclassesWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = (void *)objc_msgSend(*(id *)(a1 + 48), "newNodeContainerWithManagedObjectContext:", *(_QWORD *)(a1 + 32));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "requiredNodeValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v2)
  {
    v3 = v2;
    v22 = *(_QWORD *)v26;
    v20 = *MEMORY[0x1E0C99768];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v4);
        v6 = (void *)MEMORY[0x1E0C97B48];
        +[PLGraphNodeValue entityName](PLGraphNodeValue, "entityName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)MEMORY[0x1E0CB3528];
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("valueName"), v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v10;
        v11 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(v23, "sourceNode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("node"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "andPredicateWithSubpredicates:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPredicate:", v15);

        v16 = *(void **)(a1 + 32);
        v24 = 0;
        objc_msgSend(v16, "executeFetchRequest:error:", v8, &v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v24;
        v19 = objc_msgSend(v17, "count");

        if (!v19)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v20, CFSTR("failed validation for class %@ error: %@"), *(_QWORD *)(a1 + 40), v18);

        ++v4;
      }
      while (v3 != v4);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v3);
  }

}

void __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke_2;
  v7[3] = &unk_1E3669798;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __56__PLGraphNodeContainer_nodeContainerKeysByChangeFlagKey__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

@end
