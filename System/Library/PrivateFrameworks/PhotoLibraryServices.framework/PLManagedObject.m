@implementation PLManagedObject

uint64_t __38__PLManagedObject_objectIDDescription__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  v1 = (void *)objectIDDescription_sObjectIDDescription;
  objectIDDescription_sObjectIDDescription = (uint64_t)v0;

  objc_msgSend((id)objectIDDescription_sObjectIDDescription, "setName:", CFSTR("objectID"));
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objectIDDescription_sObjectIDDescription, "setExpression:", v2);

  return objc_msgSend((id)objectIDDescription_sObjectIDDescription, "setExpressionResultType:", 2000);
}

+ (NSExpressionDescription)objectIDDescription
{
  if (objectIDDescription_onceToken != -1)
    dispatch_once(&objectIDDescription_onceToken, &__block_literal_global_35169);
  return (NSExpressionDescription *)(id)objectIDDescription_sObjectIDDescription;
}

- (PLPhotoLibraryPathManager)pathManager
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[PLManagedObject managedObjectContext](self, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObject.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    goto LABEL_3;
  }
  objc_msgSend(v4, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
LABEL_3:

  return (PLPhotoLibraryPathManager *)v6;
}

- (PLPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PLManagedObject managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLPhotoLibrary *)v3;
}

- (BOOL)isRegisteredWithUserInterfaceContext
{
  void *v2;
  char v3;

  -[PLManagedObject managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInterfaceContext");

  return v3;
}

- (NSString)shortObjectIDURI
{
  void *v2;
  void *v3;

  -[PLManagedObject objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pl_shortURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsCloudUpload
{
  return 0;
}

- (BOOL)isSyncableChange
{
  return 0;
}

- (void)prepareForDeletion
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLManagedObject;
  -[PLManagedObject prepareForDeletion](&v3, sel_prepareForDeletion);
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19AEC0720]())
  {
    if (+[PLGraphEdge managedObjectConformsToProtocolPLGraphEdgeReferenceRecipient:](PLGraphEdge, "managedObjectConformsToProtocolPLGraphEdgeReferenceRecipient:", self))
    {
      +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:](PLGraphEdge, "registerDeletedObjectForDanglingReferenceCleanup:", self);
    }
  }
}

- (void)willSave
{
  void *v3;
  char isKindOfClass;
  objc_super v5;

  -[PLManagedObject managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5.receiver = self;
  v5.super_class = (Class)PLManagedObject;
  -[PLManagedObject willSave](&v5, sel_willSave);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "recordManagedObjectWillSave:", self);
    if (-[PLManagedObject isSyncableChange](self, "isSyncableChange"))
      objc_msgSend(v3, "recordSyncChangeMarker");
  }

}

- (void)pl_safeSetValue:(id)a3 forKey:(id)a4 valueDidChangeHandler:(id)a5
{
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObject.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  -[PLManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", v9);
  -[PLManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", v9);
  if ((PLObjectIsEqual() & 1) == 0)
  {
    -[PLManagedObject willChangeValueForKey:](self, "willChangeValueForKey:", v9);
    -[PLManagedObject setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v13, v9);
    -[PLManagedObject didChangeValueForKey:](self, "didChangeValueForKey:", v9);
    if (v10)
      v10[2](v10, v11);
  }

}

- (id)pl_committedValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObject.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

  }
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObject committedValuesForKeys:](self, "committedValuesForKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLNullToNil();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entityName
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)insertInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v5, (uint64_t)v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entityInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext((uint64_t)v5, (uint64_t)v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)attributeValidationRules
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)isValidForJournalPersistence
{
  return 1;
}

- (id)payloadID
{
  return 0;
}

- (id)payloadForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadIDForTombstone:(id)a3
{
  return 0;
}

- (id)payloadIDsByPayloadClassIDToDeleteOnInsert
{
  return 0;
}

- (id)payloadsForChangedKeys:(id)a3
{
  return 0;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return 0;
}

- (id)duplicateSortPropertyNames
{
  PLManagedObject *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)duplicateSortPropertyNamesSkip
{
  PLManagedObject *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end
