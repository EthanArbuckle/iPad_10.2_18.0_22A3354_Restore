@implementation STReconciler

+ (void)reconcileWithManagedObjectContext:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  NSObject *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  char v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  id v35;
  char v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _QWORD v52[4];

  v52[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = a4;
  v52[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransactionAuthor:", CFSTR("STUnique"));
  v7 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v45;
    while (2)
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v45 != v13)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        v43 = v15;
        v17 = objc_msgSend(v16, "reconcileWithManagedObjectContext:andUpdateLosers:error:", v5, v7, &v43);
        v12 = v43;

        if ((v17 & 1) != 0)
        {
          v11 = 1;
        }
        else if (v12)
        {
          objc_msgSend(v12, "domain");
          v18 = v12;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("STErrorDomain"));

          if ((v20 & 1) != 0)
          {
            v21 = v18;
          }
          else
          {
            STXPCSafeErrorFromCoreDataError(v18, 1);
            v21 = (id)objc_claimAutoreleasedReturnValue();

          }
          v29 = (void (**)(_QWORD, _QWORD, _QWORD))v37;
          (*((void (**)(id, _QWORD, id))v37 + 2))(v37, v11 & 1, v21);

          goto LABEL_35;
        }
        ++v14;
        v15 = v12;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v34 = v12;
  v35 = v8;
  v36 = v11;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        +[STLog persistence](STLog, "persistence");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v27;
          _os_log_impl(&dword_1D22E7000, v28, OS_LOG_TYPE_DEFAULT, "Conflict loser being deleted: %@", buf, 0xCu);
        }

        objc_msgSend(v5, "deleteObject:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v24);
  }

  if ((v36 & 1) == 0)
  {
    v29 = (void (**)(_QWORD, _QWORD, _QWORD))v37;
    v8 = v35;
    v21 = v34;
LABEL_34:
    v29[2](v29, v36 & 1, 0);
    goto LABEL_35;
  }
  v29 = (void (**)(_QWORD, _QWORD, _QWORD))v37;
  v21 = v34;
  v8 = v35;
  if (!objc_msgSend(v5, "hasChanges"))
    goto LABEL_34;
  v38 = v34;
  v30 = objc_msgSend(v5, "save:", &v38);
  v21 = v38;

  if ((v30 & 1) != 0)
    goto LABEL_34;
  if (v21)
  {
    objc_msgSend(v21, "domain");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("STErrorDomain"));

    if ((v32 & 1) == 0)
    {
      STXPCSafeErrorFromCoreDataError(v21, 1);
      v33 = objc_claimAutoreleasedReturnValue();

      v21 = (id)v33;
    }
  }
  (*((void (**)(id, _QWORD, id))v37 + 2))(v37, 0, v21);
LABEL_35:

}

@end
