@implementation PLGraphNode

- (id)searchIdentifier
{
  void *v3;
  int v4;
  id v5;
  void *v6;

  -[PLGraphNode primaryLabel](self, "primaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "code");

  if (v4 == 1100)
  {
    v5 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", self);
    objc_msgSend(v5, "encodedIdentifierString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PLGraphNode uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)isEligibleForSearchIndexing
{
  void *v2;
  BOOL v3;

  -[PLGraphNode primaryLabel](self, "primaryLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code") == 1100;

  return v3;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  return +[PLSearchEntity predicateForSearchEntitySourceNodes](PLSearchEntity, "predicateForSearchEntitySourceNodes", a3);
}

+ (id)propertiesToFetch
{
  return 0;
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

- (unsigned)primaryLabelCode
{
  void *v3;
  unsigned int v4;
  void *v5;

  -[PLGraphNode willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("primaryLabelCode"));
  -[PLGraphNode primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("primaryLabelCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  if (!v4)
  {
    -[PLGraphNode primaryLabel](self, "primaryLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "code");

  }
  -[PLGraphNode didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("primaryLabelCode"));
  return v4;
}

- (BOOL)validateForInsert:(id *)a3
{
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLGraphNode;
  if (!-[PLGraphNode validateForInsert:](&v7, sel_validateForInsert_, a3))
    return 0;
  -[PLGraphNode primaryLabel](self, "primaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLGraphNode;
  if (!-[PLGraphNode validateForUpdate:](&v7, sel_validateForUpdate_, a3))
    return 0;
  -[PLGraphNode primaryLabel](self, "primaryLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)addNodeValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLGraphNode willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("values"));
  -[PLGraphNode mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("values"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[PLGraphNode didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("values"));
}

- (void)removeNodeValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLGraphNode willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("values"));
  -[PLGraphNode mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("values"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[PLGraphNode didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("values"));
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char isKindOfClass;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLGraphNode;
  -[PLManagedObject willSave](&v8, sel_willSave);
  if (-[PLGraphNode isDeleted](self, "isDeleted")
    && ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]()))
  {
    -[PLGraphNode managedObjectContext](self, "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGraphEdge cleanupDanglingReferencesInManagedObjectContext:](PLGraphEdge, "cleanupDanglingReferencesInManagedObjectContext:", v3);

  }
  objc_opt_class();
  -[PLGraphNode managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 || MEMORY[0x19AEC0720]())
  {
    -[PLGraphNode setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
    -[objc_class willSaveWithNode:](-[PLGraphNode nodeContainerClass](self, "nodeContainerClass"), "willSaveWithNode:", self);
  }
}

- (void)didSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLGraphNode;
  -[PLGraphNode didSave](&v3, sel_didSave);
  -[objc_class didSaveWithNode:](-[PLGraphNode nodeContainerClass](self, "nodeContainerClass"), "didSaveWithNode:", self);
  -[PLGraphNode setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
}

- (void)prepareForDeletion
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLGraphNode;
  -[PLManagedObject prepareForDeletion](&v3, sel_prepareForDeletion);
  -[objc_class prepareForDeletionWithNode:](-[PLGraphNode nodeContainerClass](self, "nodeContainerClass"), "prepareForDeletionWithNode:", self);
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]())
    +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:](PLGraphEdge, "registerDeletedObjectForDanglingReferenceCleanup:", self);
}

- (id)edgesIn
{
  return +[PLGraphEdge edgesInToObject:](PLGraphEdge, "edgesInToObject:", self);
}

- (id)edgesOut
{
  return +[PLGraphEdge edgesOutFromObject:](PLGraphEdge, "edgesOutFromObject:", self);
}

- (void)implementsPLGraphEdgeReferenceObjectRecipient
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();

}

- (id)nodeValueWithName:(id)a3 createIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGraphNode.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  if (-[PLGraphNode hasFaultForRelationshipNamed:](self, "hasFaultForRelationshipNamed:", CFSTR("values")))
  {
    -[PLGraphNode values](self, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3880];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __49__PLGraphNode_nodeValueWithName_createIfMissing___block_invoke;
    v27[3] = &unk_1E366C6E8;
    v28 = v7;
    objc_msgSend(v9, "predicateWithBlock:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredSetUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "anyObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = v28;
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[PLGraphNode values](self, "values");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v12)
    {
      v14 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v13);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v16, "valueName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v7);

          if (v18)
          {
            v12 = v16;
            goto LABEL_15;
          }
        }
        v12 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v12)
          continue;
        break;
      }
    }
  }
LABEL_15:

  if (!v12 && v4)
  {
    +[PLGraphNodeValue entityName](PLGraphNodeValue, "entityName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphNode managedObjectContext](self, "managedObjectContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v19, (uint64_t)v20, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setValueName:", v7);
    -[PLGraphNode addNodeValue:](self, "addNodeValue:", v12);
  }

  return v12;
}

- (id)nodeValueWithName:(id)a3
{
  return -[PLGraphNode nodeValueWithName:createIfMissing:](self, "nodeValueWithName:createIfMissing:", a3, 0);
}

- (Class)nodeContainerClass
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  PLGraphNode *v8;
  id v9;
  NSObject *v10;
  int v12;
  PLGraphNode *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PLGraphNode managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pl_graphCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIDForLabelWithCode:inContext:", -[PLGraphNode primaryLabelCode](self, "primaryLabelCode"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "classFromLabelID:withContext:", v5, v3);
    if (!v6)
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        +[PLGraphLabel labelNameFromCode:](PLGraphLabel, "labelNameFromCode:", -[PLGraphNode primaryLabelCode](self, "primaryLabelCode"));
        v8 = (PLGraphNode *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v8;
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "Expected a class for primary label %@ (object ID: %@)", (uint8_t *)&v12, 0x16u);

      }
    }
    v9 = v6;
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "No primary label code for node: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0;
  }

  return (Class)v9;
}

- (BOOL)shouldUpdatePersistence
{
  void *v2;
  void *v3;
  char v4;

  -[PLGraphNode managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_msgSend(v3, "isDCIM") & 1) != 0)
      v4 = 1;
    else
      v4 = MEMORY[0x19AEC0720]();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)needsPersistenceUpdate
{
  return self->_needsPersistenceUpdate;
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  self->_needsPersistenceUpdate = a3;
}

uint64_t __49__PLGraphNode_nodeValueWithName_createIfMissing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)entityName
{
  return CFSTR("GraphNode");
}

+ (id)insertGraphNodeInContext:(id)a3 withPrimaryLabel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNode.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNode.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryLabel"));

LABEL_3:
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPrimaryLabel:", v7);
  v10 = (void *)objc_msgSend(v9, "nodeContainerClass");
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNode.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerClass != nil"));

  }
  objc_msgSend(v10, "requiredNodeValueKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "defaultValueForRequiredNodeValueKey:forNode:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15), v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "node");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 != v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphNode.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodeValue.node == node"));

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  return v9;
}

+ (PLGraphNode)graphNodeWithUUID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__54789;
  v20 = __Block_byref_object_dispose__54790;
  v21 = 0;
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PLGraphNode_graphNodeWithUUID_inManagedObjectContext___block_invoke;
    v11[3] = &unk_1E3674DF8;
    v12 = v6;
    v15 = a1;
    v13 = v7;
    v14 = &v16;
    objc_msgSend(v13, "performBlockAndWait:", v11);

    v8 = (void *)v17[5];
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  _Block_object_dispose(&v16, 8);

  return (PLGraphNode *)v9;
}

void __56__PLGraphNode_graphNodeWithUUID_inManagedObjectContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(*(id *)(a1 + 56), "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v9);
  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end
