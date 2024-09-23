@implementation PhotosControlPhotoLibraryCommand

- (PhotosControlPhotoLibraryCommand)initWithArgc:(int)a3 argv:(char *)a4 ctl:(id)a5
{
  uint64_t v7;
  id v9;
  PhotosControlPhotoLibraryCommand *v10;
  dispatch_group_t v11;
  OS_dispatch_group *group;
  char *v13;
  uint64_t v14;
  NSString *libraryArg;
  uint64_t v16;
  NSURL *libraryURL;
  objc_super v19;

  v7 = *(_QWORD *)&a3;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PhotosControlPhotoLibraryCommand;
  v10 = -[PhotosControlCommand initWithArgc:argv:](&v19, sel_initWithArgc_argv_, v7, a4);
  if (v10)
  {
    v11 = dispatch_group_create();
    group = v10->_group;
    v10->_group = (OS_dispatch_group *)v11;

    objc_storeStrong((id *)&v10->_ctl, a5);
    v10->_argumentRangeForRunOnManagedObjects.location = 0;
    v10->_argumentRangeForRunOnManagedObjects.length = 0;
    v13 = getenv("PHOTOSCTL_LIBRARY");
    if (v13)
    {
      if (!v10->_libraryURL)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        libraryArg = v10->_libraryArg;
        v10->_libraryArg = (NSString *)v14;

        -[PhotosControlCommand libraryURLFromArgument:](v10, "libraryURLFromArgument:", v10->_libraryArg);
        v16 = objc_claimAutoreleasedReturnValue();
        libraryURL = v10->_libraryURL;
        v10->_libraryURL = (NSURL *)v16;

      }
    }
  }

  return v10;
}

- (NSURL)libraryURL
{
  NSURL *v3;
  NSURL *libraryURL;
  NSURL *v5;
  NSURL *v6;
  NSURL *v7;

  v3 = self->_libraryURL;
  objc_sync_enter(v3);
  libraryURL = self->_libraryURL;
  if (!libraryURL)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v6 = self->_libraryURL;
    self->_libraryURL = v5;

    libraryURL = self->_libraryURL;
  }
  v7 = libraryURL;
  objc_sync_exit(v3);

  return v7;
}

- (void)enterGroup
{
  dispatch_group_enter((dispatch_group_t)self->_group);
}

- (void)leaveGroup
{
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)waitForGroup
{
  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)configureWithAlternateURLToLibraryDatabase:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PhotosControlArbitraryPersistentContainer *v13;
  void *v14;
  void *v15;
  NSManagedObjectContext *v16;
  NSManagedObjectContext *moc;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosControlPhotoLibraryCommand.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("urlToDb"));

  }
  v6 = (void *)MEMORY[0x1E0C97BF8];
  v20 = 0;
  v7 = v5;
  objc_msgSend(v6, "cachedModelForPersistentStoreWithURL:options:error:", v7, 0, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosControlPhotoLibraryCommand.m"), 101, CFSTR("can't load model."));

  }
  objc_msgSend(v7, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PhotosControlArbitraryPersistentContainer setDefaultDirectoryURL:](PhotosControlArbitraryPersistentContainer, "setDefaultDirectoryURL:", v12);
  v13 = -[NSPersistentContainer initWithName:managedObjectModel:]([PhotosControlArbitraryPersistentContainer alloc], "initWithName:managedObjectModel:", v11, v8);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C08]), "initWithURL:", v7);

  objc_msgSend(v14, "setShouldMigrateStoreAutomatically:", 0);
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentContainer setPersistentStoreDescriptions:](v13, "setPersistentStoreDescriptions:", v15);

  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v13, "loadPersistentStoresWithCompletionHandler:", &__block_literal_global_56172);
  v16 = -[NSPersistentContainer newBackgroundContext](v13, "newBackgroundContext");
  moc = self->_moc;
  self->_moc = v16;

}

- (id)photosCtl
{
  return self->_ctl;
}

- (BOOL)argument:(id)a3 isValidDouble:(double *)a4
{
  void *v5;
  BOOL v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (objc_msgSend(v5, "scanDouble:", &v8) && objc_msgSend(v5, "isAtEnd"))
  {
    if (a4)
      *(_QWORD *)a4 = v8;
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setArgumentRangeForRunOnManagedObjects:(_NSRange)a3
{
  self->_argumentRangeForRunOnManagedObjects = a3;
}

- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 block:(id)a5
{
  return -[PhotosControlPhotoLibraryCommand runOnManagedObjectArgumentsWithEntityName:identifierPropertyKey:allowAll:additionalPredicate:sortDescriptors:block:](self, "runOnManagedObjectArgumentsWithEntityName:identifierPropertyKey:allowAll:additionalPredicate:sortDescriptors:block:", a3, a4, 0, 0, 0, a5);
}

- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 allowAll:(BOOL)a5 additionalPredicate:(id)a6 sortDescriptors:(id)a7 block:(id)a8
{
  return -[PhotosControlPhotoLibraryCommand runOnManagedObjectArgumentsWithEntityName:identifierPropertyKey:allowAll:additionalPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:block:](self, "runOnManagedObjectArgumentsWithEntityName:identifierPropertyKey:allowAll:additionalPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:block:", a3, a4, a5, a6, a7, 0, a8);
}

- (int)runOnManagedObjectArgumentsWithEntityName:(id)a3 identifierPropertyKey:(id)a4 allowAll:(BOOL)a5 additionalPredicate:(id)a6 sortDescriptors:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 block:(id)a9
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  int v25;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  PhotosControlPhotoLibraryCommand *v36;
  id v37;
  uint64_t *v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;

  v12 = a5;
  v15 = a3;
  v27 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  -[PhotosControlPhotoLibraryCommand managedObjectContext](self, "managedObjectContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (self->_argumentRangeForRunOnManagedObjects.length)
  {
    -[PhotosControlCommand args](self, "args");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "subarrayWithRange:", self->_argumentRangeForRunOnManagedObjects.location, self->_argumentRangeForRunOnManagedObjects.length);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PhotosControlCommand args](self, "args");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = objc_msgSend(v22, "count");
  if (v23 > 1)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke;
    v28[3] = &unk_1E366CF98;
    v39 = v23;
    v29 = v22;
    v40 = v12;
    v30 = v27;
    v31 = v15;
    v32 = v18;
    v33 = v20;
    v34 = v16;
    v35 = v17;
    v36 = self;
    v37 = v19;
    v38 = &v41;
    objc_msgSend(v33, "performBlockAndWait:", v28);
    v25 = *((_DWORD *)v42 + 6);

    v24 = v29;
  }
  else
  {
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("%@ requires at least 1 %@ identifier"), v24, v15, v27);
    if (v12)
    {
      -[PhotosControlCommand outputError:](self, "outputError:", CFSTR(" or 'all'"));
      -[PhotosControlCommand outputError:](self, "outputError:", CFSTR(" or 'guest'"));
    }
    -[PhotosControlCommand outputError:](self, "outputError:", CFSTR(" or 'latest'\n"));
    v25 = 64;
  }

  _Block_object_dispose(&v41, 8);
  return v25;
}

- (int)runOnAssetArgumentsAllowAll:(BOOL)a3 additionalPredicate:(id)a4 block:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__PhotosControlPhotoLibraryCommand_runOnAssetArgumentsAllowAll_additionalPredicate_block___block_invoke;
  v13[3] = &unk_1E366CFC0;
  v14 = v8;
  v11 = v8;
  LODWORD(v6) = -[PhotosControlPhotoLibraryCommand runOnManagedObjectArgumentsWithEntityName:identifierPropertyKey:allowAll:additionalPredicate:sortDescriptors:block:](self, "runOnManagedObjectArgumentsWithEntityName:identifierPropertyKey:allowAll:additionalPredicate:sortDescriptors:block:", v10, CFSTR("uuid"), v6, v9, 0, v13);

  return v6;
}

- (int)traverseRelationshipsForRootManagedObject:(id)a3 keys:(id)a4 targetObject:(id *)a5
{
  id v8;
  void *v9;
  const __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v25;
  id *v26;
  PhotosControlPhotoLibraryCommand *v27;

  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  v25 = v8;
  v26 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v10 = CFSTR("Cannot find relationship %@ on object of class %@\n");
    v11 = 0x1E0C97000uLL;
    v27 = self;
    while (1)
    {
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
      objc_msgSend(v8, "entity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "propertiesByName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKey:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("%@ is not a relationship\n"), v12);
        goto LABEL_9;
      }
      if (objc_msgSend(v15, "isToMany"))
      {

        -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Set command is not supported for to-many relationships, %@ is to-many\n"), v12);
LABEL_9:
        v8 = 0;
        v18 = 0;
        v19 = 64;
        goto LABEL_10;
      }
      objc_msgSend(v8, "valueForKey:", v12);
      v21 = v11;
      v22 = v10;
      v23 = objc_claimAutoreleasedReturnValue();

      v19 = 0;
      v18 = 1;
      v8 = (id)v23;
      v10 = v22;
      v11 = v21;
      self = v27;
LABEL_10:

      v20 = objc_msgSend(v9, "count");
      if (!v18 || !v20)
        goto LABEL_15;
    }
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosControlCommand outputError:](self, "outputError:", v10, v12, v17);

    goto LABEL_9;
  }
  v19 = 0;
LABEL_15:
  if (v26)
    *v26 = objc_retainAutorelease(v8);

  return v19;
}

- (int)setValueString:(id)a3 forKey:(id)a4 onManagedObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "propertiesByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      v15 = v14;
      if (!v8)
      {
        if ((objc_msgSend(v14, "isOptional") & 1) == 0)
        {
          -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Resetting property %@ is forbidden because it is not optional\n"), v9);
LABEL_33:
          v17 = 64;
          goto LABEL_34;
        }
        v18 = 0;
        goto LABEL_29;
      }
      v16 = objc_msgSend(v14, "attributeType");
      if (v16 <= 599)
      {
        if (v16 <= 299)
        {
          if (v16 != 100 && v16 != 200)
            goto LABEL_31;
          goto LABEL_22;
        }
        if (v16 == 300)
        {
LABEL_22:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
        if (v16 == 500)
        {
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "doubleValue");
          objc_msgSend(v19, "numberWithDouble:");
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
LABEL_31:
        v24 = CFSTR("Set command is not supported for date, binary, and transformable attributes\n");
        goto LABEL_32;
      }
      if (v16 > 799)
      {
        if (v16 == 800)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v16 != 900)
            goto LABEL_31;
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v8, "integerValue"));
          v20 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (v16 != 600)
        {
          if (v16 == 700)
          {
            v18 = v8;
            goto LABEL_29;
          }
          goto LABEL_31;
        }
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "floatValue");
        objc_msgSend(v21, "numberWithFloat:");
        v20 = objc_claimAutoreleasedReturnValue();
      }
LABEL_28:
      v18 = (id)v20;
      if (!v20)
      {
        v24 = CFSTR("Unable to provide non-null value for set command\n");
LABEL_32:
        -[PhotosControlCommand outputError:](self, "outputError:", v24, v26);
        goto LABEL_33;
      }
LABEL_29:
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PhotosControlCommand output:](self, "output:", CFSTR("Setting value %@ for key %@ on object of class %@\n"), v18, v9, v23);

      objc_msgSend(v10, "setValue:forKey:", v18, v9);
      v17 = 0;
LABEL_34:

      goto LABEL_35;
    }
    -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Set command is only supported for attribute properties, %@ is not an attribute\n"), v9);
  }
  else
  {
    -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Cannot find property %@\n"), v9);
  }
  v17 = 64;
LABEL_35:

  return v17;
}

- (id)_jsonDictionaryFromManagedObject:(id)a3 allPreviousObjects:(id)a4 currentDepth:(unint64_t)a5 maxDepth:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  PhotosControlPhotoLibraryCommand *v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;

  v10 = a3;
  v11 = a4;
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v10, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertiesByName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __110__PhotosControlPhotoLibraryCommand__jsonDictionaryFromManagedObject_allPreviousObjects_currentDepth_maxDepth___block_invoke;
  v22[3] = &unk_1E366CFE8;
  v23 = v10;
  v17 = v14;
  v24 = v17;
  v25 = v11;
  v29 = a6 - 1 >= a5;
  v26 = self;
  v27 = a5;
  v28 = a6;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v22);
  v20 = v17;

  return v20;
}

- (id)jsonDictionaryFromManagedObject:(id)a3 maxDepth:(unint64_t)a4
{
  return -[PhotosControlPhotoLibraryCommand _jsonDictionaryFromManagedObject:allPreviousObjects:currentDepth:maxDepth:](self, "_jsonDictionaryFromManagedObject:allPreviousObjects:currentDepth:maxDepth:", a3, 0, 1, a4);
}

- (id)jsonDictionaryFromError:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("domain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("code"));

  objc_msgSend(v4, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("localizedDescription"));
  return v5;
}

- (int)save
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  int v8;
  id v10;

  -[PhotosControlPhotoLibraryCommand plPhotoLibrary](self, "plPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v5 = objc_msgSend(v4, "save:", &v10);
  v6 = v10;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Save error: %@\n"), v6);
    v8 = 70;
  }

  return v8;
}

- (id)processBooleanOptionArg:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("y")) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("yes")))
  {
    objc_msgSend(v4, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));

    if ((v10 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v4, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("n")) & 1) == 0)
    {
      objc_msgSend(v4, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("no")))
      {
        objc_msgSend(v4, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("0"));

        if ((v14 & 1) == 0)
        {
          -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Argument for BOOLean option must be one of '1|0', 'y|n', 'yes|no'\n"));
          v7 = 0;
          goto LABEL_6;
        }
        goto LABEL_12;
      }

    }
LABEL_12:
    v7 = (void *)MEMORY[0x1E0C9AAA0];
    goto LABEL_6;
  }

LABEL_4:
LABEL_5:
  v7 = (void *)MEMORY[0x1E0C9AAB0];
LABEL_6:

  return v7;
}

- (BOOL)processOption:(int)a3 arg:(id)a4
{
  uint64_t v5;
  id v7;
  NSURL *v8;
  NSURL *libraryURL;
  BOOL v10;
  BOOL v11;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  if ((_DWORD)v5 == 108)
  {
    objc_storeStrong((id *)&self->_libraryArg, a4);
    -[PhotosControlCommand libraryURLFromArgument:](self, "libraryURLFromArgument:", v7);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    libraryURL = self->_libraryURL;
    self->_libraryURL = v8;

  }
  v10 = -[PhotosControlPhotoLibraryCommand libraryProcessOption:arg:](self, "libraryProcessOption:arg:", v5, v7);
  v11 = (_DWORD)v5 == 108 || v10;

  return v11;
}

- (BOOL)libraryProcessOption:(int)a3 arg:(id)a4
{
  return 0;
}

- (id)plPhotoLibrary
{
  _PhotosControlPhotoLibraryPhotoKit *photoKitProxy;
  id v4;

  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing required _PhotosControlPhotoLibraryPhotoKit"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return (id)-[_PhotosControlPhotoLibraryPhotoKit plPhotoLibrary](photoKitProxy, "plPhotoLibrary");
}

- (id)unopenedPhotoLibrary
{
  _PhotosControlPhotoLibraryPhotoKit *photoKitProxy;
  id v4;

  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing required _PhotosControlPhotoLibraryPhotoKit"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return (id)-[_PhotosControlPhotoLibraryPhotoKit unopenedPhotoLibrary](photoKitProxy, "unopenedPhotoLibrary");
}

- (id)photoLibrary
{
  _PhotosControlPhotoLibraryPhotoKit *photoKitProxy;
  id v4;

  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing required _PhotosControlPhotoLibraryPhotoKit"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return (id)-[_PhotosControlPhotoLibraryPhotoKit photoLibrary](photoKitProxy, "photoLibrary");
}

- (id)managedObjectContext
{
  NSManagedObjectContext *moc;
  NSManagedObjectContext *v3;
  _PhotosControlPhotoLibraryPhotoKit *photoKitProxy;
  id v6;

  moc = self->_moc;
  if (moc)
  {
    v3 = moc;
  }
  else
  {
    photoKitProxy = self->_photoKitProxy;
    if (!photoKitProxy)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing required _PhotosControlPhotoLibraryPhotoKit"), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
    -[_PhotosControlPhotoLibraryPhotoKit managedObjectContext](photoKitProxy, "managedObjectContext");
    v3 = (NSManagedObjectContext *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)runOnPhotoKitAssetArgumentsAllowAll:(BOOL)a3 propertySets:(id)a4 additionalPredicate:(id)a5 block:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  _PhotosControlPhotoLibraryPhotoKit *photoKitProxy;
  int v14;
  id v16;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  photoKitProxy = self->_photoKitProxy;
  if (!photoKitProxy)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("missing required _PhotosControlPhotoLibraryPhotoKit"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v14 = -[_PhotosControlPhotoLibraryPhotoKit runOnPhotoKitAssetArgumentsAllowAll:propertySets:additionalPredicate:block:](photoKitProxy, "runOnPhotoKitAssetArgumentsAllowAll:propertySets:additionalPredicate:block:", v8, v10, v11, v12);

  return v14;
}

- (NSString)libraryArg
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (_PhotosControlPhotoLibraryPhotoKit)photoKitProxy
{
  return (_PhotosControlPhotoLibraryPhotoKit *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPhotoKitProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoKitProxy, 0);
  objc_storeStrong((id *)&self->_libraryArg, 0);
  objc_storeStrong((id *)&self->_ctl, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_moc, 0);
}

void __110__PhotosControlPhotoLibraryCommand__jsonDictionaryFromManagedObject_allPreviousObjects_currentDepth_maxDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "isToMany");
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v5;
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v5);
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v30 = v9;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v33 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v17 = *(void **)(a1 + 48);
              objc_msgSend(v16, "objectID", v30);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v17) = objc_msgSend(v17, "containsObject:", v18);

              if ((v17 & 1) == 0)
              {
                v19 = *(void **)(a1 + 48);
                objc_msgSend(v16, "objectID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v20);

                if (*(_BYTE *)(a1 + 80))
                  objc_msgSend(*(id *)(a1 + 56), "_jsonDictionaryFromManagedObject:allPreviousObjects:currentDepth:maxDepth:", v16, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 72));
                else
                  objc_msgSend(v16, "description");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v21);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v13);
        }

        v9 = v30;
        v5 = v31;
      }
      goto LABEL_37;
    }
    if (v8)
    {
      v23 = *(void **)(a1 + 48);
      objc_msgSend(v8, "objectID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = objc_msgSend(v23, "containsObject:", v24);

      if ((v23 & 1) == 0)
      {
        v25 = *(void **)(a1 + 48);
        objc_msgSend(v9, "objectID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

        if (*(_BYTE *)(a1 + 80))
        {
          objc_msgSend(*(id *)(a1 + 56), "_jsonDictionaryFromManagedObject:allPreviousObjects:currentDepth:maxDepth:", v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 72));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(void **)(a1 + 40);
LABEL_36:
          objc_msgSend(v28, "setObject:forKey:", v27, v5);

          goto LABEL_37;
        }
LABEL_35:
        v29 = *(void **)(a1 + 40);
        objc_msgSend(v9, "description");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v29;
        goto LABEL_36;
      }
    }
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v22 = objc_msgSend(v6, "attributeType");
      if (v22 <= 499)
      {
        if (v22 != 100 && v22 != 200 && v22 != 300)
          goto LABEL_35;
      }
      else if (v22 > 699)
      {
        if (v22 != 800 && v22 != 700)
          goto LABEL_35;
      }
      else if (v22 != 500 && v22 != 600)
      {
        goto LABEL_35;
      }
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v5);
    }
LABEL_37:

  }
}

uint64_t __90__PhotosControlPhotoLibraryCommand_runOnAssetArgumentsAllowAll_additionalPredicate_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  int v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 112) < 2uLL)
  {
    v3 = 0;
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!*(_BYTE *)(a1 + 120))
    goto LABEL_6;
  objc_msgSend(v2, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("guest"));

  if (!v5)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  if (*(_BYTE *)(a1 + 120)
    && (objc_msgSend(v3, "lowercaseString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("all")),
        v7,
        (v8 & 1) != 0))
  {
    v44 = 0;
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_msgSend(v3, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqualToString:", CFSTR("latest"));

    v44 = v9;
  }
  LODWORD(v11) = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("self"));
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 & 1) == 0 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, *(_QWORD *)(a1 + 112) - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), *(_QWORD *)(a1 + 40), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v41 = (char)v11;
    if ((_DWORD)v11)
    {
      v37 = (void *)v16;
      v38 = v14;
      v39 = v13;
      v40 = v12;
      v42 = v3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v52 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "persistentStoreCoordinator");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "managedObjectIDForURIRepresentation:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "addObject:", v25);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        }
        while (v20);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v42;
      v12 = v40;
      v6 = 0;
      v14 = v38;
      v13 = v39;
    }
    else
    {
      v11 = v15;
    }
    objc_msgSend(v13, "addObject:", v17);
    objc_msgSend(v14, "addObjectsFromArray:", v11);

    LOBYTE(v11) = v41;
  }
  if (*(_QWORD *)(a1 + 72))
    objc_msgSend(v13, "addObject:");
  if (v6)
    objc_msgSend(v13, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v26);
  objc_msgSend(v12, "setSortDescriptors:", *(_QWORD *)(a1 + 80));
  if (v44)
  {
    v27 = (char)v11;
    v43 = v3;
    v28 = v14;
    v29 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v29, "setResultType:", 1);
    objc_msgSend(*(id *)(a1 + 64), "executeFetchRequest:error:", v29, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(*(id *)(a1 + 88), "output:", CFSTR("'latest' resolved to object with ID: %@\n"), v30);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self == %@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPredicate:", v31);

      objc_msgSend(v28, "addObject:", v30);
      v27 = 1;
    }

    v14 = v28;
    v3 = v43;
    LOBYTE(v11) = v27;
  }
  v32 = *(void **)(a1 + 64);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke_2;
  v45[3] = &unk_1E366CF70;
  v50 = (char)v11;
  v33 = v14;
  v46 = v33;
  v47 = *(id *)(a1 + 40);
  v34 = *(id *)(a1 + 96);
  v35 = *(_QWORD *)(a1 + 104);
  v48 = v34;
  v49 = v35;
  v36 = (id)objc_msgSend(v32, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v12, 0, v45);
  if (objc_msgSend(v33, "count") && !*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 88), "outputError:", CFSTR("Unable to find objects with identifiers: %@\n"), v33);

}

void __186__PhotosControlPhotoLibraryCommand_runOnManagedObjectArgumentsWithEntityName_identifierPropertyKey_allowAll_additionalPredicate_sortDescriptors_relationshipKeyPathsForPrefetching_block___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v7 = a2;
  v12 = v7;
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
LABEL_5:
    objc_msgSend(v10, "removeObject:", v9);
    goto LABEL_6;
  }
  objc_msgSend(v7, "valueForKeyPath:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
LABEL_6:

  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v11 + 16))(v11, v12, a3, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      *a4 = 1;
  }

}

void __79__PhotosControlPhotoLibraryCommand_configureWithAlternateURLToLibraryDatabase___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "userInfo");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unresolved error %@, %@"), v3, v4);

  }
}

+ (id)usagesummary
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  objc_msgSend(a1, "libraryUsagesummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
    v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ %@ %@"), v5, CFSTR("[-l|--library <path.photoslibrary>|<uuid>|<WellKnownPhotoLibraryIdentifier (1=System,3=Syndication)>]"), v3);
  else
    v7 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ %@"), v5, CFSTR("[-l|--library <path.photoslibrary>|<uuid>|<WellKnownPhotoLibraryIdentifier (1=System,3=Syndication)>]"), v10);
  v8 = (void *)v7;

  return v8;
}

+ (id)usage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "usagesummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "libraryUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v3, v4);
  else
    v5 = v3;
  v6 = v5;

  return v6;
}

+ (const)optstring
{
  const char *v2;

  if (!objc_msgSend(a1, "libraryOptstring"))
    return "l:";
  v2 = (const char *)&optstring_buffer;
  __strlcpy_chk();
  __strlcat_chk();
  return v2;
}

+ (option)longopts
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  char **v5;
  __int128 v6;

  v2 = objc_msgSend(a1, "libraryLongopts");
  if (v2)
  {
    v3 = 0;
    do
    {
      v4 = (_OWORD *)(v2 + v3 * 8);
      if (!*(_QWORD *)(v2 + v3 * 8))
        break;
      v3 += 4;
      v5 = &(&longopts_longopts)[v3];
      v6 = v4[1];
      *(_OWORD *)v5 = *v4;
      *((_OWORD *)v5 + 1) = v6;
    }
    while (v3 != 392);
  }
  return (option *)&longopts_longopts;
}

+ (id)libraryUsage
{
  return 0;
}

+ (id)libraryUsagesummary
{
  return 0;
}

+ (option)libraryLongopts
{
  return 0;
}

+ (const)libraryOptstring
{
  return 0;
}

@end
