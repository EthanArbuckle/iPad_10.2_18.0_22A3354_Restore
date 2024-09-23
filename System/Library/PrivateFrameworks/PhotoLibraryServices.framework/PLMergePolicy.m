@implementation PLMergePolicy

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[PLUnintendedChangeChecker checkForUnintendedChangeOnMergeConflicts:withBlock:](PLUnintendedChangeChecker, "checkForUnintendedChangeOnMergeConflicts:withBlock:", v6, &__block_literal_global_53573);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v13, "newVersionNumber"))
        {
          objc_msgSend(v13, "sourceObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  v30.receiver = self;
  v30.super_class = (Class)PLMergePolicy;
  v15 = -[NSMergePolicy resolveOptimisticLockingVersionConflicts:error:](&v30, sel_resolveOptimisticLockingVersionConflicts_error_, v8, a4);
  +[PLUnintendedChangeChecker checkForUnintendedChangeOnMergeConflicts:withBlock:](PLUnintendedChangeChecker, "checkForUnintendedChangeOnMergeConflicts:withBlock:", v8, &__block_literal_global_31);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v21, "managedObjectContext", (_QWORD)v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "delayedSaveActions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "recordAlbumForCountsAndDateRangeUpdate:", v21);

        objc_msgSend(v22, "delayedSaveActions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordAlbumForKeyAssetsUpdate:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v18);
  }

  return v15;
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  BOOL result;
  objc_super v6;

  self->_isResolvingConflicts = 1;
  v6.receiver = self;
  v6.super_class = (Class)PLMergePolicy;
  result = -[NSMergePolicy resolveConflicts:error:](&v6, sel_resolveConflicts_error_, a3, a4);
  self->_isResolvingConflicts = 0;
  return result;
}

- (BOOL)isResolvingConflicts
{
  return self->_isResolvingConflicts;
}

void __64__PLMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138413058;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_FAULT, "Unintended change during post-flight merge: key %@, value: %@, context %@, conflict %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unintended change during post-flight merge: key %@, value: %@, context %@, conflict %@"), v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: Unintended change during post-flight merge"), v13);

}

void __64__PLMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  PLBackendGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138413058;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_FAULT, "Unintended change during pre-flight merge: key %@, value: %@, context %@, conflict %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unintended change during pre-flight merge: key %@, value: %@, context %@, conflict %@"), v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: Unintended change during pre-flight merge"), v13);

}

@end
