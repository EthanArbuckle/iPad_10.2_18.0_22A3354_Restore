@implementation PLModelMigrationAction_FixupTombstonedPeople

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int64_t v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C97AB0];
  +[PLPerson entityName](PLPerson, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "batchUpdateRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("verifiedType"), 4294967294);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v24[0] = CFSTR("contactMatchingDictionary");
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = CFSTR("personUri");
  v25[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToUpdate:", v14);

  objc_msgSend(v10, "setResultType:", 2);
  v21 = 0;
  objc_msgSend(v6, "executeRequest:error:", v10, &v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v21;
  if (v15)
  {
    v17 = 1;
    objc_msgSend(v7, "setCompletedUnitCount:", 1);
    PLMigrationGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "result");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Removed contactMatchingDictionary and personUri from %@ persons with PLPersonVerifiedTypeTombstone", buf, 0xCu);

      v17 = 1;
    }
  }
  else
  {
    PLMigrationGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to remove contactMatchingDictionary and personUri from persons with PLPersonVerifiedTypeTombstone, error: %@", buf, 0xCu);
    }
    v17 = 3;
  }

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v16);

  return v17;
}

@end
