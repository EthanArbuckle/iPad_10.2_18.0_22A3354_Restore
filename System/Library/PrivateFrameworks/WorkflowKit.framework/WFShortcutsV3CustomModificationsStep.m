@implementation WFShortcutsV3CustomModificationsStep

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v39;
  void *v40;
  void *v42;
  void *context;
  void *contexta;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  _BYTE v67[128];
  void *v68;
  _BYTE v69[128];
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Shortcut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchLimit:", 5);
  objc_msgSend(v5, "setPropertiesToFetch:", &unk_1E7B8DB08);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("workflowID"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  v66 = 0;
  v45 = v4;
  v42 = v5;
  objc_msgSend(v4, "executeFetchRequest:error:", v5, &v66);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v66;
  while (objc_msgSend(v8, "count"))
  {
    v10 = MEMORY[0x1C3BB3598]();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    context = (void *)v10;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v63 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1C3BB3598]();
          v61 = v9;
          WFMigratePropertyListObject(v16, CFSTR("actions"), CFSTR("actionsData"), (uint64_t)&v61);
          v18 = v61;

          v60 = v18;
          WFMigratePropertyListObject(v16, CFSTR("importQuestions"), CFSTR("importQuestionsData"), (uint64_t)&v60);
          v19 = v60;

          v59 = v19;
          WFMigratePropertyListObject(v16, CFSTR("inputClasses"), CFSTR("inputClassesData"), (uint64_t)&v59);
          v9 = v59;

          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v13);
    }

    v58 = v9;
    objc_msgSend(v45, "save:", &v58);
    v20 = v58;

    objc_msgSend(v45, "reset");
    objc_msgSend(v42, "setFetchOffset:", objc_msgSend(v42, "fetchOffset") + objc_msgSend(v42, "fetchLimit"));
    v57 = v20;
    objc_msgSend(v45, "executeFetchRequest:error:", v42, &v57);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v57;

    objc_autoreleasePoolPop(context);
  }

  objc_autoreleasePoolPop(v39);
  v40 = (void *)MEMORY[0x1C3BB3598]();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Collection"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFetchLimit:", 5);
  objc_msgSend(v21, "setPropertiesToFetch:", &unk_1E7B8DB20);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSortDescriptors:", v23);

  v56 = v9;
  objc_msgSend(v45, "executeFetchRequest:error:", v21, &v56);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v56;

  while (objc_msgSend(v24, "count"))
  {
    v26 = MEMORY[0x1C3BB3598]();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v27 = v24;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    contexta = (void *)v26;
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v53 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          v33 = (void *)MEMORY[0x1C3BB3598]();
          v51 = v25;
          WFMigratePropertyListObject(v32, CFSTR("lastRemoteCollectionOrdering"), CFSTR("lastRemoteCollectionOrderingData"), (uint64_t)&v51);
          v34 = v51;

          v50 = v34;
          WFMigratePropertyListObject(v32, CFSTR("lastRemoteCollectionOrderingSubset"), CFSTR("lastRemoteCollectionOrderingSubsetData"), (uint64_t)&v50);
          v35 = v50;

          v49 = v35;
          WFMigratePropertyListObject(v32, CFSTR("lastRemoteShortcutOrdering"), CFSTR("lastRemoteShortcutOrderingData"), (uint64_t)&v49);
          v36 = v49;

          v48 = v36;
          WFMigratePropertyListObject(v32, CFSTR("lastRemoteShortcutOrderingSubset"), CFSTR("lastRemoteShortcutOrderingSubsetData"), (uint64_t)&v48);
          v25 = v48;

          objc_autoreleasePoolPop(v33);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
      }
      while (v29);
    }

    v47 = v25;
    objc_msgSend(v45, "save:", &v47);
    v37 = v47;

    objc_msgSend(v45, "reset");
    objc_msgSend(v21, "setFetchOffset:", objc_msgSend(v21, "fetchOffset") + objc_msgSend(v21, "fetchLimit"));
    v46 = v37;
    objc_msgSend(v45, "executeFetchRequest:error:", v21, &v46);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v46;

    objc_autoreleasePoolPop(contexta);
  }

  objc_autoreleasePoolPop(v40);
  if (a4)
    *a4 = objc_retainAutorelease(v25);

  return v25 == 0;
}

@end
