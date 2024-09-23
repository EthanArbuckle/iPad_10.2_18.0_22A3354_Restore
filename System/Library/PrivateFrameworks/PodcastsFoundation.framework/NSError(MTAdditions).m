@implementation NSError(MTAdditions)

- (void)logAndThrow:()MTAdditions printStackTrace:
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  void *v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v6 = a1;
  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2968]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v39 = a4;
    v40 = a3;
    v41 = v6;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v44 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          +[IMLogger sharedLogger](IMLogger, "sharedLogger");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "code");
          objc_msgSend(v13, "domain");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "userInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Extensions/Foundation/NSError+MTAdditions.m", 24, CFSTR("[%ld %@] %@"), v15, v16, v18);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v10);
    }

    v6 = v41;
    a3 = v40;
    if (v39)
      goto LABEL_10;
  }
  else
  {
    +[IMLogger sharedLogger](IMLogger, "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v6, "code");
    objc_msgSend(v6, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "description");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Extensions/Foundation/NSError+MTAdditions.m", 29, CFSTR("[%ld %@] %@"), v23, v24, v26);

    if (a4)
    {
LABEL_10:
      +[IMLogger sharedLogger](IMLogger, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsFoundation/PodcastsFoundation/PodcastsFoundation/Extensions/Foundation/NSError+MTAdditions.m", 34, CFSTR("%@"), v21);

    }
  }
  if (+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp"))
    objc_msgSend(v6, "recordMetrics");
  if (a3)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("%@: %@ (%ld)"), v29, v30, objc_msgSend(v6, "code"));
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "localizedDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedFailureReason");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ | %@"), v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v6, "userInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "exceptionWithName:reason:userInfo:", v31, v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "collectErrorsAndThrow:", v38);
    objc_exception_throw(objc_retainAutorelease(v38));
  }

}

- (uint64_t)logAndThrow:()MTAdditions
{
  return objc_msgSend(a1, "logAndThrow:printStackTrace:", a3, 1);
}

- (uint64_t)_NSManagedObjectValidationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectConstraintValidationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationMultipleErrorsError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationMissingMandatoryPropertyError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationRelationshipLacksMinimumCountError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationRelationshipExceedsMaximumCountError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationRelationshipDeniedDeleteError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationNumberTooLargeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationNumberTooSmallError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationDateTooLateError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationDateTooSoonError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationInvalidDateError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationStringTooLongError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationStringTooShortError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationStringPatternMatchingError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSValidationInvalidURIError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectContextLockingError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreCoordinatorLockingError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectReferentialIntegrityError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectExternalRelationshipError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectMergeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSManagedObjectConstraintMergeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreInvalidTypeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreTypeMismatchError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreIncompatibleSchemaError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreSaveError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreIncompleteSaveError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreSaveConflictsError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSCoreDataError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreOperationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreOpenError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreTimeoutError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreUnsupportedRequestTypeError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentStoreIncompatibleVersionHashError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationConstraintViolationError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationCancelledError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationMissingSourceModelError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationMissingMappingModelError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationManagerSourceStoreError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSMigrationManagerDestinationStoreError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSEntityMigrationPolicyError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSSQLiteError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSInferredMappingModelError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSExternalRecordImportError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (uint64_t)_NSPersistentHistoryTokenExpiredError:()MTAdditions andThrow:
{
  return objc_msgSend(a1, "createErrorStackTraceForErrorCodes:andThrow:");
}

- (void)collectErrorsAndThrow:()MTAdditions
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB28A8];
  v7 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CB28A8]);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "userInfo", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2968]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v6);

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "code"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v18);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  objc_msgSend(v19, "createErrorStackTraceForErrorCodes:andThrow:", v4, v20);
}

- (void)createErrorStackTraceForErrorCodes:()MTAdditions andThrow:
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538EE8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538EE8);
    objc_msgSend(a1, "_NSManagedObjectValidationError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538F00))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538F00);
    objc_msgSend(a1, "_NSManagedObjectConstraintValidationError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538F18))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538F18);
    objc_msgSend(a1, "_NSValidationMultipleErrorsError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538F30))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538F30);
    objc_msgSend(a1, "_NSValidationMissingMandatoryPropertyError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538F48))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538F48);
    objc_msgSend(a1, "_NSValidationRelationshipLacksMinimumCountError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538F60))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538F60);
    objc_msgSend(a1, "_NSValidationRelationshipExceedsMaximumCountError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538F78))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538F78);
    objc_msgSend(a1, "_NSValidationRelationshipDeniedDeleteError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538F90))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538F90);
    objc_msgSend(a1, "_NSValidationNumberTooLargeError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538FA8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538FA8);
    objc_msgSend(a1, "_NSValidationNumberTooSmallError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538FC0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538FC0);
    objc_msgSend(a1, "_NSValidationDateTooLateError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538FD8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538FD8);
    objc_msgSend(a1, "_NSValidationDateTooSoonError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5538FF0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5538FF0);
    objc_msgSend(a1, "_NSValidationInvalidDateError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539008))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539008);
    objc_msgSend(a1, "_NSValidationStringTooLongError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539020))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539020);
    objc_msgSend(a1, "_NSValidationStringTooShortError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539038))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539038);
    objc_msgSend(a1, "_NSValidationStringPatternMatchingError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539050))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539050);
    objc_msgSend(a1, "_NSValidationInvalidURIError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539068))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539068);
    objc_msgSend(a1, "_NSManagedObjectContextLockingError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539080))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539080);
    objc_msgSend(a1, "_NSPersistentStoreCoordinatorLockingError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539098))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539098);
    objc_msgSend(a1, "_NSManagedObjectReferentialIntegrityError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55390B0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55390B0);
    objc_msgSend(a1, "_NSManagedObjectExternalRelationshipError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55390C8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55390C8);
    objc_msgSend(a1, "_NSManagedObjectMergeError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55390E0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55390E0);
    objc_msgSend(a1, "_NSManagedObjectConstraintMergeError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55390F8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55390F8);
    objc_msgSend(a1, "_NSPersistentStoreInvalidTypeError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539110))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539110);
    objc_msgSend(a1, "_NSPersistentStoreTypeMismatchError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539128))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539128);
    objc_msgSend(a1, "_NSPersistentStoreIncompatibleSchemaError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539140))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539140);
    objc_msgSend(a1, "_NSPersistentStoreSaveError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539158))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539158);
    objc_msgSend(a1, "_NSPersistentStoreIncompleteSaveError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539170))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539170);
    objc_msgSend(a1, "_NSPersistentStoreSaveConflictsError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539188))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539188);
    objc_msgSend(a1, "_NSCoreDataError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55391A0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55391A0);
    objc_msgSend(a1, "_NSPersistentStoreOperationError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55391B8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55391B8);
    objc_msgSend(a1, "_NSPersistentStoreOpenError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55391D0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55391D0);
    objc_msgSend(a1, "_NSPersistentStoreTimeoutError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55391E8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55391E8);
    objc_msgSend(a1, "_NSPersistentStoreUnsupportedRequestTypeError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539200))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539200);
    objc_msgSend(a1, "_NSPersistentStoreIncompatibleVersionHashError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539218))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539218);
    objc_msgSend(a1, "_NSMigrationError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539230))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539230);
    objc_msgSend(a1, "_NSMigrationConstraintViolationError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539248))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539248);
    objc_msgSend(a1, "_NSMigrationCancelledError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539260))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539260);
    objc_msgSend(a1, "_NSMigrationMissingSourceModelError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539278))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539278);
    objc_msgSend(a1, "_NSMigrationMissingMappingModelError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539290))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539290);
    objc_msgSend(a1, "_NSMigrationManagerSourceStoreError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55392A8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55392A8);
    objc_msgSend(a1, "_NSMigrationManagerDestinationStoreError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55392C0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55392C0);
    objc_msgSend(a1, "_NSEntityMigrationPolicyError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55392D8))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55392D8);
    objc_msgSend(a1, "_NSSQLiteError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E55392F0))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E55392F0);
    objc_msgSend(a1, "_NSInferredMappingModelError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539308))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539308);
    objc_msgSend(a1, "_NSExternalRecordImportError:andThrow:", v6, v7);
  }
  if (objc_msgSend(v6, "containsObject:", &unk_1E5539320))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E5539320);
    objc_msgSend(a1, "_NSPersistentHistoryTokenExpiredError:andThrow:", v6, v7);
  }
  objc_exception_throw(objc_retainAutorelease(v7));
}

@end
