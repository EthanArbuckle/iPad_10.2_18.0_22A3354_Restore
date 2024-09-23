@implementation PLPersonReference

+ (id)insertIntoPhotoLibrary:(id)a3 personUUID:(id)a4 personData:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersonReference.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  objc_msgSend(v9, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v13, (uint64_t)v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPersonUUID:", v10);
  objc_msgSend(v14, "setPersonData:", v11);
  objc_msgSend(v9, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v14, "setPerson:", v16);
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to find a person with UUID %@", buf, 0xCu);
    }

  }
  return v14;
}

+ (id)entityName
{
  return CFSTR("PersonReference");
}

@end
