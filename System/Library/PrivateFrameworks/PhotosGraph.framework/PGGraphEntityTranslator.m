@implementation PGGraphEntityTranslator

- (PGGraphEntityTranslator)initWithPhotoLibrary:(id)a3
{
  id v5;
  PGGraphEntityTranslator *v6;
  PGGraphEntityTranslator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphEntityTranslator;
  v6 = -[PGGraphEntityTranslator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photoLibrary, a3);

  return v7;
}

- (id)graphChangesForInsertedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  return 0;
}

- (id)graphChangesForDeletedLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  return 0;
}

- (id)graphChangesForChangedPropertyNamesByLocalIdentifier:(id)a3 change:(id)a4 progressBlock:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

+ (Class)entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)entityClassName
{
  return NSStringFromClass((Class)objc_msgSend(a1, "entityClass"));
}

+ (NSString)managedEntityName
{
  return (NSString *)objc_msgSend((id)objc_msgSend(a1, "entityClass"), "managedEntityName");
}

+ (BOOL)includesRelationshipChanges
{
  return 0;
}

+ (id)uuidFromLocalIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "entityClass"), "uuidFromLocalIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)uuidsFromLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(a1, "entityClass");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v5;
}

@end
