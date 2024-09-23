@implementation PLGraphEdge

- (BOOL)validateForInsert:(id *)a3
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if ((MEMORY[0x19AEC0720](self, a2) & 1) != 0)
    return 1;
  v46.receiver = self;
  v46.super_class = (Class)PLGraphEdge;
  v37 = a3;
  v5 = -[PLGraphEdge validateForInsert:](&v46, sel_validateForInsert_, a3);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  +[PLGraphEdge _edgeReferenceSourceRelationshipNames](PLGraphEdge, "_edgeReferenceSourceRelationshipNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v6);
        -[PLGraphEdge valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          ++v9;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  +[PLGraphEdge _edgeReferenceTargetRelationshipNames](PLGraphEdge, "_edgeReferenceTargetRelationshipNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v14);
        -[PLGraphEdge valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          ++v17;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v16);
    v22 = v17 > 1;
  }
  else
  {
    v22 = 0;
  }

  if (v9 > 1 || v22)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[PLGraphEdge sourceNode](self, "sourceNode");
    v24 = objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge sourceAsset](self, "sourceAsset");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge sourcePerson](self, "sourcePerson");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge sourceMoment](self, "sourceMoment");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge targetNode](self, "targetNode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge targetAsset](self, "targetAsset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge targetPerson](self, "targetPerson");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge targetMoment](self, "targetMoment");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v24;
    objc_msgSend(v23, "stringWithFormat:", CFSTR("There must be no more then one source and one target set (sourceNode: %p, sourceAsset: %p, sourcePerson: %p, sourceMoment: %p, targetNode: %p, targetAsset: %p, targetPerson: %p, targetMoment: %p)"), v24, v25, v26, v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)PLErrorCreate();
    v34 = v33;
    if (v37)
      *v37 = objc_retainAutorelease(v33);

    return 0;
  }
  return v5;
}

- (void)addLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLGraphEdge willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("labels"));
  -[PLGraphEdge mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("labels"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[PLGraphEdge didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("labels"));
}

- (void)removeLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLGraphEdge willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("labels"));
  -[PLGraphEdge mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("labels"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[PLGraphEdge didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("labels"));
}

- (void)addEdgeValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLGraphEdge willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("values"));
  -[PLGraphEdge mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("values"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[PLGraphEdge didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("values"));
}

- (void)removeEdgeValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLGraphEdge willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("values"));
  -[PLGraphEdge mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("values"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[PLGraphEdge didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("values"));
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLGraphEdge;
  -[PLManagedObject willSave](&v7, sel_willSave);
  objc_opt_class();
  -[PLGraphEdge managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (v4 && -[PLGraphEdge isInserted](self, "isInserted"))
  {
    -[PLGraphEdge sourceNode](self, "sourceNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PLGraphEdge sourceNode](self, "sourceNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v6, "nodeContainerClass"), "willInsertOutgoingEdge:", self);

    }
  }
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLGraphEdge;
  -[PLManagedObject prepareForDeletion](&v5, sel_prepareForDeletion);
  -[PLGraphEdge sourceNode](self, "sourceNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLGraphEdge sourceNode](self, "sourceNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v4, "nodeContainerClass"), "prepareForDeletingOutgoingEdge:", self);

  }
}

- (BOOL)hasLabelWithCode:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  unsigned int v9;

  -[PLGraphEdge labels](self, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__PLGraphEdge_hasLabelWithCode___block_invoke;
  v8[3] = &__block_descriptor_36_e39_B24__0__PLGraphLabel_8__NSDictionary_16l;
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredSetUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "count") != 0;
  return (char)v5;
}

- (BOOL)hasLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[PLGraphEdge objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("labels"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (id)edgeValueWithName:(id)a3 createIfMissing:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGraphEdge.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  if (!-[PLGraphEdge hasFaultForRelationshipNamed:](self, "hasFaultForRelationshipNamed:", CFSTR("values")))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[PLGraphEdge values](self, "values");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v17, "valueName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v6);

          if (v19)
          {
            v11 = v17;
            goto LABEL_15;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v14)
          continue;
        break;
      }
    }

    goto LABEL_16;
  }
  -[PLGraphEdge values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __49__PLGraphEdge_edgeValueWithName_createIfMissing___block_invoke;
  v28[3] = &unk_1E3673318;
  v29 = v6;
  objc_msgSend(v8, "predicateWithBlock:", v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredSetUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "anyObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v29;
LABEL_15:

  if (!v11)
  {
LABEL_16:
    +[PLGraphEdgeValue entityName](PLGraphEdgeValue, "entityName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGraphEdge managedObjectContext](self, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v20, (uint64_t)v21, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setValueName:", v6);
    -[PLGraphEdge addEdgeValue:](self, "addEdgeValue:", v11);
  }

  return v11;
}

- (id)edgeValueWithName:(id)a3
{
  return -[PLGraphEdge edgeValueWithName:createIfMissing:](self, "edgeValueWithName:createIfMissing:", a3, 0);
}

uint64_t __49__PLGraphEdge_edgeValueWithName_createIfMissing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "valueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL __32__PLGraphEdge_hasLabelWithCode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "code") == *(_DWORD *)(a1 + 32);
}

+ (id)_edgeReferenceRelationshipNames
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_edgeReferenceSourceRelationshipNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_edgeReferenceTargetRelationshipNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_edgeReferenceSourceRelationshipNames
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("sourceNode");
  v3[1] = CFSTR("sourceAsset");
  v3[2] = CFSTR("sourceMoment");
  v3[3] = CFSTR("sourcePerson");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_edgeReferenceTargetRelationshipNames
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("targetNode");
  v3[1] = CFSTR("targetAsset");
  v3[2] = CFSTR("targetMoment");
  v3[3] = CFSTR("targetPerson");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_edgesForObject:(id)a3 relationshipPrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
  {

    v10 = CFSTR("Node");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), v15, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v16);

  v20 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_targetRelationshipNameForEntity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("target%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_sourceRelationshipNameForEntity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("source%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)insertGraphEdgeInContext:(id)a3 withPrimaryLabel:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphEdge.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphEdge.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryLabel"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v10, (uint64_t)v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPrimaryLabel:", v9);
  return v11;
}

+ (id)entityName
{
  return CFSTR("GraphEdge");
}

+ (BOOL)managedObjectConformsToProtocolPLGraphEdgeReferenceRecipient:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

+ (void)registerDeletedObjectForDanglingReferenceCleanup:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphEdge.m"), 192, CFSTR("must have a moc to registerDeletedObjectForDanglingReferenceCleanup"));

  }
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pl_objectsPendingCleanup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("pl_objectsPendingCleanup"));

  }
  objc_msgSend(v11, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

}

+ (id)_entityNameFromRelationshipName:(id)a3
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGraphEdge.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relationshipName"));

  }
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("source")))
    v6 = CFSTR("source");
  else
    v6 = CFSTR("target");
  objc_msgSend(v5, "substringFromIndex:", -[__CFString length](v6, "length"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("Node")))
  {

    v7 = CFSTR("GraphNode");
  }

  return v7;
}

+ (void)cleanupDanglingReferencesInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NSObject *v23;
  void *v24;
  id obj;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pl_objectsPendingCleanup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v24 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(a1, "_edgeReferenceRelationshipNames");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __63__PLGraphEdge_cleanupDanglingReferencesInManagedObjectContext___block_invoke;
          v33[3] = &unk_1E36732D0;
          v33[4] = v11;
          v33[5] = a1;
          objc_msgSend(v27, "_pl_filter:", v33);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v13);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v8);
    }

    +[PLGraphEdge fetchRequest](PLGraphEdge, "fetchRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v15);

    objc_msgSend(v14, "setFetchBatchSize:", 100);
    v32 = 0;
    v4 = v24;
    objc_msgSend(v24, "executeFetchRequest:error:", v14, &v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v32;
    if (v16)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(v24, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v20);
      }

      objc_msgSend(v27, "removeAllObjects");
    }
    else
    {
      PLBackendGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v17;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch edges with error: %@", buf, 0xCu);
      }

    }
  }

}

+ (id)objectIDsPendingDanglingReferenceCleanupForManagedObjectContext:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pl_objectsPendingCleanup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)edgesInToObject:(id)a3
{
  return (id)objc_msgSend(a1, "_edgesForObject:relationshipPrefix:", a3, CFSTR("target"));
}

+ (id)edgesOutFromObject:(id)a3
{
  return (id)objc_msgSend(a1, "_edgesForObject:relationshipPrefix:", a3, CFSTR("source"));
}

uint64_t __63__PLGraphEdge_cleanupDanglingReferencesInManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_entityNameFromRelationshipName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v5);

  return v8;
}

@end
