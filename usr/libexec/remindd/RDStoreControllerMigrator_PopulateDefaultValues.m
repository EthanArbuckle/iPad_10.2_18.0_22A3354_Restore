@implementation RDStoreControllerMigrator_PopulateDefaultValues

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RDStoreControllerMigrator_PopulateDefaultValues")));
  v8 = objc_msgSend(v7, "integerValue");

  if ((uint64_t)v8 <= 0)
  {
    -[RDStoreControllerMigrator_PopulateDefaultValues migrateStore:](self, "migrateStore:", v9);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_100804848, CFSTR("RDStoreControllerMigrator_PopulateDefaultValues"));
  }

}

- (void)migrateStore:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  id obj;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PopulateDefaultValuesMigration BEGIN {store: %@}", buf, 0xCu);
  }

  v39 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentStoreCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectModel"));

  v32 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entitiesByName"));
  v40 = objc_alloc_init((Class)NSMutableArray);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v35 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v56;
    v38 = RDStoreControllerDefaultValuesMigrationAuthor;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v56 != v34)
          objc_enumerationMutation(obj);
        v37 = v8;
        v41 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v8);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "attributesByName"));
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
        v10 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v52 != v12)
                objc_enumerationMutation(v43);
              v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
              if ((objc_msgSend(v15, "isOptional") & 1) == 0)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "defaultValue"));
                if (v16)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "superentity"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributesByName"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v14));

                  v20 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
                  if (v19)
                  {
                    if (v21)
                    {
                      *(_DWORD *)buf = 138412546;
                      v63 = v41;
                      v64 = 2112;
                      v65 = v14;
                      v22 = v20;
                      v23 = OS_LOG_TYPE_INFO;
                      v24 = "Attribute belongs to super entity. Skipping {entityName: %@, attributeName: %@}";
                      goto LABEL_20;
                    }
                  }
                  else
                  {
                    if (v21)
                    {
                      *(_DWORD *)buf = 138412546;
                      v63 = v41;
                      v64 = 2112;
                      v65 = v14;
                      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "PopulateDefaultValues BEGIN {entity: %@, attributeName: %@}", buf, 0x16u);
                    }

                    v25 = objc_msgSend(objc_alloc((Class)NSBatchUpdateRequest), "initWithEntity:", v42);
                    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NULL"), v14));
                    objc_msgSend(v25, "setPredicate:", v26);

                    objc_msgSend(v25, "setIncludesSubentities:", 1);
                    objc_msgSend(v25, "setResultType:", 2);
                    v60 = v15;
                    v61 = v16;
                    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
                    objc_msgSend(v25, "setPropertiesToUpdate:", v27);

                    v59 = v39;
                    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
                    objc_msgSend(v25, "setAffectedStores:", v28);

                    v29 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
                    objc_msgSend(v29, "setTransactionAuthor:", v38);
                    v44[0] = _NSConcreteStackBlock;
                    v44[1] = 3221225472;
                    v44[2] = sub_1000935D0;
                    v44[3] = &unk_1007D9008;
                    v45 = v39;
                    v46 = v25;
                    v47 = v29;
                    v48 = v40;
                    v49 = v41;
                    v50 = v14;
                    v30 = v29;
                    v20 = v25;
                    objc_msgSend(v30, "performBlockAndWait:", v44);

                  }
                }
                else
                {
                  v20 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v63 = v41;
                    v64 = 2112;
                    v65 = v14;
                    v22 = v20;
                    v23 = OS_LOG_TYPE_DEFAULT;
                    v24 = "Non-optional attribute has no default value. Skipping {entityName: %@, attributeName: %@}";
LABEL_20:
                    _os_log_impl((void *)&_mh_execute_header, v22, v23, v24, buf, 0x16u);
                  }
                }

              }
            }
            v11 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
          }
          while (v11);
        }

        v8 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    }
    while (v36);
  }

  v31 = objc_claimAutoreleasedReturnValue(+[REMLogStore container](REMLogStore, "container"));
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v63 = v39;
    v64 = 2112;
    v65 = v40;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "PopulateDefaultValuesMigration END {store: %@, populateAttributeNames: %@}", buf, 0x16u);
  }

}

@end
