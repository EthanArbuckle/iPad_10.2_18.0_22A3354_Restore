@implementation UIManagedDocument

+ (void)initialize
{
  char *v4;

  if ((id)objc_opt_class() == a1)
  {
    _MergedGlobals_1_5 = (uint64_t)dlopen((const char *)objc_msgSend(CFSTR("/System/Library/Frameworks/CoreData.framework/CoreData"), "UTF8String"), 1);
    if (_MergedGlobals_1_5
      || (v4 = dlerror(),
          NSLog(CFSTR("UIManagedDocument failed to load CoreData at path %@: %s"), CFSTR("/System/Library/Frameworks/CoreData.framework/CoreData"), v4), _MergedGlobals_1_5)|| (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIManagedDocument.m"), 88, CFSTR("Failed to load CoreData framework")), _MergedGlobals_1_5))
    {
      qword_1ECD79D80 = (uint64_t)objc_getClass("NSIncrementalStore");
      qword_1ECD79D88 = (uint64_t)objc_getClass("NSManagedObjectContext");
      qword_1ECD79D90 = (uint64_t)objc_getClass("NSManagedObjectModel");
      qword_1ECD79D98 = (uint64_t)objc_getClass("NSPersistentStoreCoordinator");
      if (!qword_1ECD79D80)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIManagedDocument.m"), 94, CFSTR("Failed to load class NSIncrementalStore"));
      if (!qword_1ECD79D88)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIManagedDocument.m"), 95, CFSTR("Failed to load class NSManagedObjectContext"));
      if (!qword_1ECD79D90)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIManagedDocument.m"), 96, CFSTR("Failed to load class NSManagedObjectModel"));
      if (!qword_1ECD79D98)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIManagedDocument.m"), 97, CFSTR("Failed to load class NSPersistentStoreCoordinator"));
    }
  }
}

- (UIManagedDocument)initWithFileURL:(id)a3
{
  UIManagedDocument *v3;
  void *v4;
  uint64_t v5;
  NSManagedObjectContext *v6;
  objc_class *v7;
  void (*MethodImplementation)(void);
  objc_class *v9;
  _QWORD v11[7];
  _QWORD v12[6];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIManagedDocument;
  v3 = -[UIDocument initWithFileURL:](&v13, sel_initWithFileURL_, a3);
  if (v3)
  {
    v3->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc((Class)qword_1ECD79D98), "initWithManagedObjectModel:", -[UIManagedDocument managedObjectModel](v3, "managedObjectModel"));
    v4 = (void *)objc_msgSend(objc_alloc((Class)qword_1ECD79D88), "initWithConcurrencyType:", 1);
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__UIManagedDocument_initWithFileURL___block_invoke;
    v12[3] = &unk_1E16C3CF0;
    v12[4] = v4;
    v12[5] = v3;
    objc_msgSend(v4, "performBlockAndWait:", v12);
    v6 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)qword_1ECD79D88), "initWithConcurrencyType:", 2);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __37__UIManagedDocument_initWithFileURL___block_invoke_2;
    v11[3] = &unk_1E16C3D18;
    v11[4] = v6;
    v11[5] = v4;
    v11[6] = v3;
    -[NSManagedObjectContext performBlockAndWait:](v6, "performBlockAndWait:", v11);
    v3->_managedObjectContext = v6;
    v7 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v7, sel_writeAdditionalContent_toURL_originalContentsURL_error_);
    v9 = (objc_class *)objc_opt_class();
    if (MethodImplementation != class_getMethodImplementation(v9, sel_writeAdditionalContent_toURL_originalContentsURL_error_))*(_DWORD *)&v3->_mdocFlags |= 1u;
  }
  return v3;
}

uint64_t __37__UIManagedDocument_initWithFileURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPersistentStoreCoordinator:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208));
}

void __37__UIManagedDocument_initWithFileURL___block_invoke_2(id *a1)
{
  objc_msgSend(a1[4], "setParentContext:", a1[5]);
  objc_msgSend(a1[4], "setUndoManager:", objc_msgSend(a1[6], "undoManager"));

}

- (void)dealloc
{
  NSManagedObjectContext *managedObjectContext;
  objc_super v4;
  _QWORD v5[5];

  managedObjectContext = self->_managedObjectContext;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__UIManagedDocument_dealloc__block_invoke;
  v5[3] = &unk_1E16B41B8;
  v5[4] = managedObjectContext;
  -[NSManagedObjectContext performBlock:](managedObjectContext, "performBlock:", v5);
  self->_managedObjectContext = 0;

  self->_managedObjectModel = 0;
  self->_persistentStoreCoordinator = 0;

  self->_documentMetadata = 0;
  self->persistentStoreOptions = 0;

  self->modelConfiguration = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIManagedDocument;
  -[UIDocument dealloc](&v4, sel_dealloc);
}

void __28__UIManagedDocument_dealloc__block_invoke(uint64_t a1)
{

}

+ (NSString)persistentStoreName
{
  return (NSString *)CFSTR("persistentStore");
}

+ (id)additionalContentPathComponent
{
  return CFSTR("AdditionalContent");
}

+ (BOOL)isPersistentStoreSynchronizedViaUbiquitousContentWithOptions:(id)a3
{
  return objc_msgSend(a3, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")) != 0;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSManagedObjectModel)managedObjectModel
{
  NSManagedObjectModel *result;

  result = self->_managedObjectModel;
  if (!result)
  {
    result = (NSManagedObjectModel *)(id)objc_msgSend((id)qword_1ECD79D90, "mergedModelFromBundles:", 0);
    self->_managedObjectModel = result;
  }
  return result;
}

- (BOOL)configurePersistentStoreCoordinatorForURL:(NSURL *)storeURL ofType:(NSString *)fileType modelConfiguration:(NSString *)configuration storeOptions:(NSDictionary *)storeOptions error:(NSError *)error
{
  NSString *v12;
  id v13;
  BOOL v14;

  v12 = -[UIManagedDocument persistentStoreTypeForFileType:](self, "persistentStoreTypeForFileType:", fileType);
  if (storeOptions)
  {
    v13 = (id)-[NSDictionary mutableCopy](storeOptions, "mutableCopy");
    objc_msgSend(v13, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSPersistentStoreRemoveStoreOnCleanupKey"));
  }
  else
  {
    v13 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("NSPersistentStoreRemoveStoreOnCleanupKey"), 0);
  }
  -[NSPersistentStoreCoordinator lock](self->_persistentStoreCoordinator, "lock");
  v14 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](self->_persistentStoreCoordinator, "addPersistentStoreWithType:configuration:URL:options:error:", v12, configuration, storeURL, v13, error) != 0;
  -[NSPersistentStoreCoordinator unlock](self->_persistentStoreCoordinator, "unlock");
  return v14;
}

- (NSString)persistentStoreTypeForFileType:(NSString *)fileType
{
  return (NSString *)CFSTR("SQLite");
}

- (BOOL)readAdditionalContentFromURL:(NSURL *)absoluteURL error:(NSError *)error
{
  return 1;
}

- (id)additionalContentForURL:(NSURL *)absoluteURL error:(NSError *)error
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", absoluteURL, error);
}

- (BOOL)writeAdditionalContent:(id)content toURL:(NSURL *)absoluteURL originalContentsURL:(NSURL *)absoluteOriginalContentsURL error:(NSError *)error
{
  return 1;
}

- (void)_handleRelocatingStoreContentDirectoryFromNonSyncedURL:(id)a3 toSyncedURL:(id)a4
{
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = 1;
  if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v15))
  {
    if (!v15)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid store content path is file"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, CFSTR("path"))), "raise");
    v14 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromNonSyncedURL_toSyncedURL___block_invoke;
    v9[3] = &unk_1E16C3D40;
    v9[4] = v7;
    v9[5] = &v10;
    objc_msgSend(v8, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", a3, 2, a4, 8, &v14, v9);
    if (!*((_BYTE *)v11 + 24))
      NSLog(CFSTR("Failed to coordinate moving store content directory -- %@"), v14);

    _Block_object_dispose(&v10, 8);
  }
}

void __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromNonSyncedURL_toSyncedURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v6 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), 0) & 1) != 0)
  {
    NSLog(CFSTR("Failed to move store content directory, both synced and non synced directories exist: %@, %@"), a2, a3);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "moveItemAtURL:toURL:error:", a2, a3, &v6) & 1) == 0)
  {
    NSLog(CFSTR("Failed to move store content directory from %@ to %@ -- %@"), a2, a3, v6);
  }
}

- (void)_handleRelocatingStoreContentDirectoryFromSyncedURL:(id)a3 toNonSyncedURL:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  _QWORD v12[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v7 = objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
  v9 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke;
  v12[3] = &unk_1E16C3D68;
  v12[8] = &v13;
  v12[4] = v7;
  v12[5] = v8;
  v12[6] = a4;
  v12[7] = &v17;
  objc_msgSend(v8, "coordinateReadingItemAtURL:options:error:byAccessor:", a3, 0, &v21, v12);
  if (*((_BYTE *)v18 + 24))
  {
    if (*((_BYTE *)v14 + 24))
    {
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke_2;
      v10[3] = &unk_1E16C3D40;
      v10[5] = &v17;
      v11 = 0;
      v10[4] = v7;
      objc_msgSend(v8, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", a3, 2, a4, 8, &v11, v10);
      if (!*((_BYTE *)v18 + 24))
        NSLog(CFSTR("Failed to coordinate moving store content directory -- %@"), v11);

    }
    else
    {

    }
  }
  else
  {
    NSLog(CFSTR("Failed to coordinate moving store content directory -- %@"), v21);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  int v4;
  id v5;
  unsigned __int8 v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v6 = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", objc_msgSend(a2, "path"), &v6);
  if ((_DWORD)result)
  {
    v4 = v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6;
    if (!v4)
    {
      v5 = *(id *)(a1 + 40);
      return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid store content path is file"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("path"))), "raise");
    }
  }
  return result;
}

void __88__UIManagedDocument__handleRelocatingStoreContentDirectoryFromSyncedURL_toNonSyncedURL___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v6 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), 0) & 1) != 0)
  {
    NSLog(CFSTR("Failed to move store content directory, both synced and non synced directories exist: %@, %@"), a2, a3);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "moveItemAtURL:toURL:error:", a2, a3, &v6) & 1) == 0)
  {
    NSLog(CFSTR("Failed to move store content directory from %@ to %@ -- %@"), a2, a3, v6);
  }
}

- (id)_readMetadataFromDocumentURL:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__69;
  v18 = __Block_byref_object_dispose__69;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
  v9 = 0;
  v5 = objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("DocumentMetadata.plist"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__UIManagedDocument__readMetadataFromDocumentURL___block_invoke;
  v8[3] = &unk_1E16C3D90;
  v8[4] = &v10;
  v8[5] = &v14;
  objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", v5, 0, &v9, v8);
  if (!*((_BYTE *)v11 + 24))
    NSLog(CFSTR("Failed to coordinate read of %@, %@"), v5, v9);

  v6 = (id)v15[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

uint64_t __50__UIManagedDocument__readMetadataFromDocumentURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_writeMetadataToDocumentURL:(id)a3
{
  id v5;
  id v6;
  NSDictionary *documentMetadata;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v5 = -[NSDictionary objectForKey:](-[UIManagedDocument persistentStoreOptions](self, "persistentStoreOptions"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v5)
  {
    v6 = v5;
    documentMetadata = self->_documentMetadata;
    if (documentMetadata)
    {
      v8 = (void *)-[NSDictionary mutableCopy](self->_documentMetadata, "mutableCopy");
      objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
      self->_documentMetadata = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v8);

    }
    else
    {
      self->_documentMetadata = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("NSPersistentStoreUbiquitousContentNameKey"), 0);
    }
    v18 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
    v11 = objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("DocumentMetadata.plist"));
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__UIManagedDocument__writeMetadataToDocumentURL___block_invoke;
    v13[3] = &unk_1E16C3DB8;
    v13[5] = &v14;
    v13[6] = &v19;
    v13[4] = self;
    objc_msgSend(v10, "coordinateWritingItemAtURL:options:error:byAccessor:", v11, 8, &v18, v13);
    if (!*((_BYTE *)v15 + 24))
      NSLog(CFSTR("Failed to coordinate write of %@, %@"), v11, v18);

    _Block_object_dispose(&v14, 8);
    v9 = *((_BYTE *)v20 + 24) != 0;
  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v19, 8);
  return v9;
}

uint64_t __49__UIManagedDocument__writeMetadataToDocumentURL___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1[4] + 224), "writeToURL:atomically:", a2, 0);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  void *v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  id v17;
  id v18;
  NSDictionary *documentMetadata;
  void *v20;
  id v21;
  id v22;
  id v23;
  int v24;
  uint64_t *v25;
  id *v26;
  int v27;
  NSManagedObjectContext *v28;
  uint64_t v29;
  id v30;
  id v31;
  char v32;
  NSString *v34;
  NSDictionary *v35;
  NSString *v36;
  uint64_t v37;
  NSPersistentStore *v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[4];
  NSManagedObjectContext *v42;
  _QWORD v43[9];
  objc_super v44;
  _QWORD v45[39];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[3];
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[12];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;

  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  if (!objc_msgSend(a3, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("you must override %@ to support reading of non-file URLs"), NSStringFromSelector(sel_readFromURL_error_));
    goto LABEL_53;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v78 = 1;
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v78);
  if (v78)
    v9 = v8;
  else
    v9 = 0;
  if ((v9 & 1) != 0)
  {
    v10 = objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("StoreContent"));
    v11 = objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("StoreContent.nosync"));
    v12 = objc_msgSend((id)objc_opt_class(), "isPersistentStoreSynchronizedViaUbiquitousContentWithOptions:", -[UIManagedDocument persistentStoreOptions](self, "persistentStoreOptions"));
    v13 = v12;
    v37 = v11;
    if (v12)
      v14 = (void *)v11;
    else
      v14 = (void *)v10;
    v40 = objc_msgSend(v14, "URLByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "persistentStoreName"));
    -[NSPersistentStoreCoordinator lock](self->_persistentStoreCoordinator, "lock");
    v38 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self->_persistentStoreCoordinator, "persistentStoreForURL:", v40);
    -[NSPersistentStoreCoordinator unlock](self->_persistentStoreCoordinator, "unlock");
    if (v38)
      *((_BYTE *)v80 + 24) = 1;
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
    if (*((_BYTE *)v80 + 24))
    {
      v15 = 0;
LABEL_42:
      v72 = 0;
      v73 = &v72;
      v74 = 0x3052000000;
      v75 = __Block_byref_object_copy__69;
      v76 = __Block_byref_object_dispose__69;
      v77 = 0;
      v28 = -[UIManagedDocument managedObjectContext](self, "managedObjectContext");
      v29 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_5;
      v45[3] = &unk_1E16C3E80;
      v45[4] = v28;
      v45[5] = &v72;
      -[NSManagedObjectContext performBlockAndWait:](v28, "performBlockAndWait:", v45);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v73[5], CFSTR("parentContext"), 0);
      v44.receiver = self;
      v44.super_class = (Class)UIManagedDocument;
      v30 = -[UIDocument _fileOpeningQueue](&v44, sel__fileOpeningQueue);
      if (v30)
        v31 = v30;
      else
        v31 = (id)MEMORY[0x1E0C80D38];
      v43[0] = v29;
      v43[1] = 3221225472;
      v43[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_6;
      v43[3] = &unk_1E16C3ED0;
      v43[4] = a3;
      v43[5] = self;
      v43[6] = v39;
      v43[7] = &v79;
      v43[8] = a4;
      -[UIDocument _performBlock:synchronouslyOnQueue:](self, "_performBlock:synchronouslyOnQueue:", v43, v31);

      v32 = !v15;
      if (*((_BYTE *)v80 + 24))
        v32 = 1;
      if ((v32 & 1) == 0)
      {
        v41[0] = v29;
        v41[1] = 3221225472;
        v41[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_8;
        v41[3] = &unk_1E16B41B8;
        v42 = -[UIManagedDocument managedObjectContext](self, "managedObjectContext");
        -[NSManagedObjectContext performBlockAndWait:](v42, "performBlockAndWait:", v41);
        -[NSPersistentStoreCoordinator lock](self->_persistentStoreCoordinator, "lock");
        v60 = 0;
        if (-[NSPersistentStoreCoordinator persistentStoreForURL:](self->_persistentStoreCoordinator, "persistentStoreForURL:", v40)&& !-[NSPersistentStoreCoordinator removePersistentStore:error:](self->_persistentStoreCoordinator, "removePersistentStore:error:", v38, &v60))
        {
          NSLog(CFSTR("Error during store removal after failed readAdditionalContentsFromURL: %@"), v60);
        }
        -[NSPersistentStoreCoordinator unlock](self->_persistentStoreCoordinator, "unlock");
      }
      _Block_object_dispose(&v72, 8);
      goto LABEL_53;
    }
    v36 = -[UIDocument fileType](self, "fileType");
    v35 = -[UIManagedDocument persistentStoreOptions](self, "persistentStoreOptions");
    v34 = -[UIManagedDocument modelConfiguration](self, "modelConfiguration");
    v72 = 0;
    v73 = &v72;
    v74 = 0x3052000000;
    v75 = __Block_byref_object_copy__69;
    v76 = __Block_byref_object_dispose__69;
    v77 = 0;
    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    v17 = -[UIManagedDocument _readMetadataFromDocumentURL:](self, "_readMetadataFromDocumentURL:", a3);
    v18 = v17;
    if (v17)
    {
      documentMetadata = self->_documentMetadata;
      if (documentMetadata)
      {
        v20 = (void *)-[NSDictionary mutableCopy](self->_documentMetadata, "mutableCopy");
        objc_msgSend(v20, "addEntriesFromDictionary:", v18);
        self->_documentMetadata = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v20);

      }
      else
      {
        self->_documentMetadata = (NSDictionary *)v17;
      }
      v21 = -[NSDictionary objectForKey:](-[UIManagedDocument persistentStoreOptions](self, "persistentStoreOptions"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
      v22 = -[NSDictionary objectForKey:](self->_documentMetadata, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
      if (!v21 || (v23 = v22, (objc_msgSend(v21, "isEqualToString:", v22) & 1) != 0))
      {
LABEL_27:
        if ((v13 & 1) == 0)
        {
          -[UIManagedDocument _handleRelocatingStoreContentDirectoryFromNonSyncedURL:toSyncedURL:](self, "_handleRelocatingStoreContentDirectoryFromNonSyncedURL:toSyncedURL:", v37, v10);
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __39__UIManagedDocument_readFromURL_error___block_invoke;
          v67[3] = &unk_1E16C3DE0;
          v67[4] = v7;
          v67[5] = self;
          v67[6] = v36;
          v67[7] = v34;
          v67[9] = &v68;
          v67[8] = v35;
          v67[10] = &v79;
          v67[11] = a4;
          objc_msgSend(v39, "coordinateReadingItemAtURL:options:error:byAccessor:", v40, 0, a4, v67);
LABEL_41:
          v27 = *((unsigned __int8 *)v80 + 24);
          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(&v72, 8);
          v15 = v27 != 0;
          if (*((_BYTE *)v80 + 24))
            goto LABEL_42;

LABEL_53:
          v16 = *((_BYTE *)v80 + 24) != 0;
          goto LABEL_54;
        }
        -[UIManagedDocument _handleRelocatingStoreContentDirectoryFromSyncedURL:toNonSyncedURL:](self, "_handleRelocatingStoreContentDirectoryFromSyncedURL:toNonSyncedURL:", v10, v37);
        v66 = 0;
        v60 = 0;
        v61 = &v60;
        v62 = 0x3052000000;
        v63 = __Block_byref_object_copy__69;
        v64 = __Block_byref_object_dispose__69;
        v65 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x2020000000;
        v59 = 0;
        v54[0] = 0;
        v54[1] = v54;
        v54[2] = 0x2020000000;
        v55 = 0;
        v50 = 0;
        v51 = &v50;
        v52 = 0x2020000000;
        v53 = 0;
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        v45[21] = MEMORY[0x1E0C809B0];
        v45[22] = 3221225472;
        v45[23] = __39__UIManagedDocument_readFromURL_error___block_invoke_2;
        v45[24] = &unk_1E16C3E30;
        v45[33] = &v68;
        v45[34] = v54;
        v45[25] = v7;
        v45[26] = v37;
        v45[27] = v39;
        v45[28] = v40;
        v45[35] = &v72;
        v45[36] = &v79;
        v45[29] = self;
        v45[30] = v36;
        v45[31] = v34;
        v45[32] = v35;
        v45[37] = &v60;
        v45[38] = &v50;
        objc_msgSend(v39, "coordinateReadingItemAtURL:options:error:byAccessor:");
        if (*((_BYTE *)v80 + 24))
          goto LABEL_40;
        if (*((_BYTE *)v51 + 24))
        {
          v24 = 0;
        }
        else
        {
          v45[6] = MEMORY[0x1E0C809B0];
          v45[7] = 3221225472;
          v45[8] = __39__UIManagedDocument_readFromURL_error___block_invoke_4;
          v45[9] = &unk_1E16C3E58;
          v45[16] = &v56;
          v45[17] = &v79;
          v45[10] = v7;
          v45[11] = self;
          v45[12] = v36;
          v45[13] = v34;
          v45[18] = &v60;
          v45[19] = &v46;
          v45[20] = a4;
          v45[14] = v35;
          v45[15] = v37;
          objc_msgSend(v39, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:");
          v24 = *((unsigned __int8 *)v80 + 24);
        }
        if (!a4 || v24)
        {
LABEL_40:
          _Block_object_dispose(&v46, 8);
          _Block_object_dispose(&v50, 8);
          _Block_object_dispose(v54, 8);
          _Block_object_dispose(&v56, 8);
          _Block_object_dispose(&v60, 8);
          goto LABEL_41;
        }
        if (*((_BYTE *)v51 + 24) || *((_BYTE *)v47 + 24))
        {
          v25 = v61;
        }
        else
        {
          if (*((_BYTE *)v69 + 24))
            goto LABEL_40;
          if (!*((_BYTE *)v57 + 24))
          {
            v26 = (id *)&v66;
            goto LABEL_39;
          }
          v25 = v73;
        }
        v26 = (id *)(v25 + 5);
LABEL_39:
        *a4 = *v26;
        goto LABEL_40;
      }
      NSLog(CFSTR("Updating document ubiquitous content name from %@ to %@"), v23, v21);
    }
    -[UIManagedDocument _writeMetadataToDocumentURL:](self, "_writeMetadataToDocumentURL:", a3);
    goto LABEL_27;
  }
  if (!v78)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("UIManagedDocument can only read documents that are file packages"), 0), "raise");
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
  v16 = 0;
LABEL_54:
  _Block_object_dispose(&v79, 8);
  return v16;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a2, "path"));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result;
  }
  else if (*(_QWORD *)(a1 + 88))
  {
    result = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Missing store file"), CFSTR("reason"), 0));
    **(_QWORD **)(a1 + 88) = result;
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(*(id *)(a1 + 40), "path"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
    v3 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__UIManagedDocument_readFromURL_error___block_invoke_3;
    v8[3] = &unk_1E16C3E08;
    v14 = *(_QWORD *)(a1 + 136);
    v6 = *(_QWORD *)(a1 + 96);
    v7 = *(_OWORD *)(a1 + 80);
    v9 = *(_OWORD *)(a1 + 64);
    v10 = v7;
    v13 = *(_OWORD *)(a1 + 120);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v6;
    return objc_msgSend(v3, "coordinateReadingItemAtURL:options:error:byAccessor:", v4, 0, v5, v8);
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 64), "fileExistsAtPath:isDirectory:", objc_msgSend(a2, "path"), 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = result;
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  uint64_t result;
  uint64_t v7;
  id v8;

  v8 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a2, 0, 0, &v8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  if ((v5 & 1) != 0 || (result = objc_msgSend(v8, "code"), result == 516))
  {
    result = objc_msgSend(*(id *)(a1 + 40), "configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:", a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                           + 24) ^ 1;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 112);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
    if (v7)
    {
      result = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to restore path to store content"), CFSTR("reason"), v8, *MEMORY[0x1E0CB3388], *(_QWORD *)(a1 + 72), CFSTR("path"), 0));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "parentContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __39__UIManagedDocument_readFromURL_error___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_opt_class(), "additionalContentPathComponent"), 1);
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  objc_msgSend(*(id *)(a1 + 48), "coordinateReadingItemAtURL:options:error:byAccessor:", v2, 0, MEMORY[0x1E0C809B0], 3221225472, __39__UIManagedDocument_readFromURL_error___block_invoke_7, &unk_1E16C3EA8, *(_QWORD *)(a1 + 40), &v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (!*((_BYTE *)v4 + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  _Block_object_dispose(&v3, 8);
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "readAdditionalContentFromURL:error:", a2, *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __39__UIManagedDocument_readFromURL_error___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (id)contentsForType:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  NSManagedObjectContext *v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v7 = -[UIManagedDocument additionalContentForURL:error:](self, "additionalContentForURL:error:", -[UIDocument fileURL](self, "fileURL"), a4);
  if (!v7)
    return 0;
  v8 = v7;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__69;
  v17 = __Block_byref_object_dispose__69;
  v18 = 0;
  v9 = -[UIManagedDocument managedObjectContext](self, "managedObjectContext");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__UIManagedDocument_contentsForType_error___block_invoke;
  v12[3] = &unk_1E16C3F20;
  v12[5] = &v13;
  v12[6] = a4;
  v12[4] = v9;
  -[NSManagedObjectContext performBlockAndWait:](v9, "performBlockAndWait:", v12);
  if (v14[5])
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("parentContext"), v8, CFSTR("additionalContent"), a3, CFSTR("fileType"), 0);
  else
    v10 = 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __43__UIManagedDocument_contentsForType_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "save:", *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "parentContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)writeContents:(id)a3 andAttributes:(id)a4 safelyToURL:(id)a5 forSaveOperation:(int64_t)a6 error:(id *)a7
{
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  BOOL v18;
  _QWORD v20[11];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Contents must be a dictionary"), 0), "raise");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = v13;
  if (!a6
    && (objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a5, 0, a4, a7) & 1) == 0)
  {
    v18 = 0;
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_mdocFlags & 1) == 0)
  {
    *((_BYTE *)v26 + 24) = 1;
    goto LABEL_10;
  }
  v15 = objc_msgSend(a5, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_opt_class(), "additionalContentPathComponent"), 1);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__UIManagedDocument_writeContents_andAttributes_safelyToURL_forSaveOperation_error___block_invoke;
  v20[3] = &unk_1E16C3EF8;
  v20[8] = &v21;
  v20[9] = &v25;
  v20[4] = v15;
  v20[5] = v14;
  v20[10] = a7;
  v20[6] = self;
  v20[7] = a3;
  objc_msgSend(v16, "coordinateWritingItemAtURL:options:error:byAccessor:", v15, 8, a7, v20);
  if (!*((_BYTE *)v22 + 24))
    *((_BYTE *)v26 + 24) = 0;

  _Block_object_dispose(&v21, 8);
  if (*((_BYTE *)v26 + 24))
  {
LABEL_10:
    v17 = -[UIManagedDocument writeContents:toURL:forSaveOperation:originalContentsURL:error:](self, "writeContents:toURL:forSaveOperation:originalContentsURL:error:", a3, a5, a6, a5, a7);
    *((_BYTE *)v26 + 24) = v17;
    if (!a6)
      goto LABEL_11;
    goto LABEL_15;
  }
  v17 = 0;
  if (!a6)
  {
LABEL_11:
    if (!v17)
    {
      v21 = 0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a5, &v21) & 1) == 0)
        NSLog(CFSTR("UIManagedDocument could not delete the temporary item at %@ reason:\n%@"), a5, v21);
      v17 = *((unsigned __int8 *)v26 + 24);
    }
  }
LABEL_15:
  v18 = v17 != 0;
LABEL_16:
  _Block_object_dispose(&v25, 8);
  return v18;
}

uint64_t __84__UIManagedDocument_writeContents_andAttributes_safelyToURL_forSaveOperation_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  _QWORD *v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathExtension:", CFSTR("nosync_tmp"));
  if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", objc_msgSend(v4, "path")))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "removeItemAtURL:error:", v4, *(_QWORD *)(a1 + 80));
  result = objc_msgSend(*(id *)(a1 + 40), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 0, 0, *(_QWORD *)(a1 + 80));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "writeAdditionalContent:toURL:originalContentsURL:error:", objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("additionalContent")), v4, a2, *(_QWORD *)(a1 + 80)))
    {
      v7 = 0;
      if ((objc_msgSend(*(id *)(a1 + 40), "removeItemAtURL:error:", a2, &v7) & 1) != 0
        || (result = objc_msgSend(v7, "code"), result == 4))
      {
        result = objc_msgSend(*(id *)(a1 + 40), "moveItemAtURL:toURL:error:", v4, a2, *(_QWORD *)(a1 + 80));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = result;
      }
      else
      {
        v6 = *(_QWORD **)(a1 + 80);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        if (v6)
          *v6 = v7;
      }
    }
    else
    {
      result = objc_msgSend(*(id *)(a1 + 40), "removeItemAtURL:error:", v4, 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    }
  }
  return result;
}

- (BOOL)writeContents:(id)a3 toURL:(id)a4 forSaveOperation:(int64_t)a5 originalContentsURL:(id)a6 error:(id *)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *v14;
  id v15;
  char v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  char v21;
  NSPersistentStore *v22;
  const __CFString *v23;
  const __CFString *v24;
  int v25;
  char v26;
  char v27;
  void *v29;
  uint64_t v30;
  id v32;
  _QWORD v33[7];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("parentContext"));
    v12 = objc_msgSend(a3, "objectForKey:", CFSTR("fileType"));
    v13 = v12;
    if (v11 && v12)
      goto LABEL_7;
  }
  else
  {
    v13 = 0;
    v11 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Contents must be a dictionary that contains a reference to the parentContext and fileType"), 0), "raise");
LABEL_7:
  v14 = -[UIManagedDocument persistentStoreOptions](self, "persistentStoreOptions");
  v15 = -[NSDictionary objectForKey:](v14, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
  if (v15)
    v16 = objc_msgSend(v15, "isEqual:", -[NSDictionary objectForKey:](self->_documentMetadata, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")));
  else
    v16 = 1;
  v29 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  if (a5)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v30 = 0;
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(), "isPersistentStoreSynchronizedViaUbiquitousContentWithOptions:", v14))v24 = CFSTR("StoreContent.nosync");
    else
      v24 = CFSTR("StoreContent");
    v19 = (void *)objc_msgSend(a4, "URLByAppendingPathComponent:", v24);
    v30 = objc_msgSend(v19, "URLByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(), "persistentStoreName"));
    v25 = objc_msgSend((id)objc_msgSend(v19, "fileReferenceURL"), "isEqual:", objc_msgSend(a4, "fileReferenceURL"));
    if ((v25 & 1) != 0)
    {
      if (!*((_BYTE *)v35 + 24))
        goto LABEL_43;
    }
    else
    {
      v26 = objc_msgSend(v29, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 0, 0, a7);
      *((_BYTE *)v35 + 24) = v26;
      if ((v26 & 1) == 0)
        goto LABEL_43;
    }
    v18 = -[UIManagedDocument configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:](self, "configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:", v30, v13, -[UIManagedDocument modelConfiguration](self, "modelConfiguration"), -[UIManagedDocument persistentStoreOptions](self, "persistentStoreOptions"), a7);
    v17 = v25 ^ 1;
    v20 = *((unsigned __int8 *)v35 + 24);
    if (!*((_BYTE *)v35 + 24))
      goto LABEL_17;
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __84__UIManagedDocument_writeContents_toURL_forSaveOperation_originalContentsURL_error___block_invoke;
  v33[3] = &unk_1E16C3F20;
  v33[4] = v11;
  v33[5] = &v34;
  v33[6] = a7;
  objc_msgSend(v11, "performBlockAndWait:", v33);
  v20 = *((unsigned __int8 *)v35 + 24);
  if (*((_BYTE *)v35 + 24))
    v21 = v16;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
  {
    -[UIManagedDocument _writeMetadataToDocumentURL:](self, "_writeMetadataToDocumentURL:", a4);
    v20 = *((unsigned __int8 *)v35 + 24);
  }
LABEL_17:
  if (a5 || v20)
    goto LABEL_43;
  if (!v18)
    goto LABEL_40;
  -[NSPersistentStoreCoordinator lock](self->_persistentStoreCoordinator, "lock");
  v32 = 0;
  v22 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self->_persistentStoreCoordinator, "persistentStoreForURL:", v30);
  if (!v22)
    goto LABEL_33;
  if (-[NSPersistentStoreCoordinator removePersistentStore:error:](self->_persistentStoreCoordinator, "removePersistentStore:error:", v22, &v32))
  {
    goto LABEL_35;
  }
  if (v32)
    v23 = (const __CFString *)objc_msgSend(v32, "description");
  else
LABEL_33:
    v23 = CFSTR("No store registered at URL");
  NSLog(CFSTR("UIManagedDocument could not remove the temporary store at %@, %@"), v30, v23);
LABEL_35:
  -[NSPersistentStoreCoordinator unlock](self->_persistentStoreCoordinator, "unlock");
  if (!v30)
  {
LABEL_40:
    if (!v17)
      goto LABEL_43;
    goto LABEL_41;
  }
  v32 = 0;
  if ((objc_msgSend(v29, "removeItemAtURL:error:", v30, &v32) & 1) == 0)
    NSLog(CFSTR("UIManagedDocument could not delete the temporary store %@, %@"), v30, v32);
  if ((v17 & 1) != 0)
  {
LABEL_41:
    v32 = 0;
    if ((objc_msgSend(v29, "removeItemAtURL:error:", v19, &v32) & 1) == 0)
      NSLog(CFSTR("UIManagedDocument could not delete the temporary store dir %@, %@"), v19, v32);
  }
LABEL_43:
  v27 = *((_BYTE *)v35 + 24);
  _Block_object_dispose(&v34, 8);
  return v27;
}

uint64_t __84__UIManagedDocument_writeContents_toURL_forSaveOperation_originalContentsURL_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "save:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)revertToContentsOfURL:(id)a3 completionHandler:(id)a4
{
  NSManagedObjectContext *v7;
  uint64_t v8;
  NSPersistentStore *v9;
  _QWORD v10[5];
  objc_super v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v7 = -[UIManagedDocument managedObjectContext](self, "managedObjectContext");
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke;
  v14[3] = &unk_1E16B41B8;
  v14[4] = v7;
  -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v14);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_2;
  v13[3] = &unk_1E16B41B8;
  v13[4] = v7;
  -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v13);
  -[NSPersistentStoreCoordinator lock](self->_persistentStoreCoordinator, "lock");
  v9 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self->_persistentStoreCoordinator, "persistentStoreForURL:", a3);
  if (v9)
  {
    v12 = 0;
  }
  else
  {
    v9 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self->_persistentStoreCoordinator, "persistentStoreForURL:", -[UIDocument fileURL](self, "fileURL"));
    v12 = 0;
    if (!v9)
      goto LABEL_5;
  }
  if (!-[NSPersistentStoreCoordinator removePersistentStore:error:](self->_persistentStoreCoordinator, "removePersistentStore:error:", v9, &v12))
  {
    -[NSPersistentStoreCoordinator unlock](self->_persistentStoreCoordinator, "unlock");
    goto LABEL_7;
  }
LABEL_5:
  v11.receiver = self;
  v11.super_class = (Class)UIManagedDocument;
  -[UIDocument revertToContentsOfURL:completionHandler:](&v11, sel_revertToContentsOfURL_completionHandler_, a3, a4);
  -[NSPersistentStoreCoordinator unlock](self->_persistentStoreCoordinator, "unlock");
LABEL_7:
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_3;
  v10[3] = &unk_1E16B41B8;
  v10[4] = v7;
  -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v10);
}

uint64_t __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lock");
}

uint64_t __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __61__UIManagedDocument_revertToContentsOfURL_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

- (NSDictionary)persistentStoreOptions
{
  return self->persistentStoreOptions;
}

- (void)setPersistentStoreOptions:(NSDictionary *)persistentStoreOptions
{
  objc_setProperty_nonatomic_copy(self, a2, persistentStoreOptions, 240);
}

- (NSString)modelConfiguration
{
  return self->modelConfiguration;
}

- (void)setModelConfiguration:(NSString *)modelConfiguration
{
  objc_setProperty_nonatomic_copy(self, a2, modelConfiguration, 248);
}

@end
