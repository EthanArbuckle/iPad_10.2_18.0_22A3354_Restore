@implementation DMDEngineDatabaseProcessingOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  __int128 v10;
  char **v11;
  char **v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unsigned __int8 v19;
  id v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  __int128 v48;
  void *v49;
  void *v50;
  id obj;
  char *v52;
  char *v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequest](DMDConfigurationOrganization, "fetchRequest"));
  v65 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "execute:", &v65));
  v8 = v65;
  v9 = v8;
  if (!v7)
  {
    v43 = DMFConfigurationEngineLog(v8);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_1000762B8();
    goto LABEL_36;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v7;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v62;
    v11 = &selRef_decodeObjectOfClasses_forKey_;
    v12 = &selRef_decodeObjectOfClasses_forKey_;
    *(_QWORD *)&v10 = 138412290;
    v48 = v10;
    v56 = v4;
    v49 = v7;
    v50 = v6;
    while (2)
    {
      v13 = 0;
      v52 = v12[162];
      v53 = v11[163];
      do
      {
        v14 = v5;
        if (*(_QWORD *)v62 != v55)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v13);
        if ((objc_msgSend(v15, "active", v48) & 1) != 0
          || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "payloadMetadatas")),
              v17 = objc_msgSend(v16, "count"),
              v16,
              v17))
        {
          v60 = v9;
          v19 = -[DMDEngineDatabaseProcessingOperation preprocessDatabaseInContext:forOrganization:error:](self, "preprocessDatabaseInContext:forOrganization:error:", v4, v15, &v60);
          v20 = v60;

          if ((v19 & 1) == 0)
          {
            v45 = DMFConfigurationEngineLog(v21);
            v46 = objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              sub_1000763AC();

            -[DMDEngineDatabaseProcessingOperation setError:](self, "setError:", v20);
            goto LABEL_33;
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
          v23 = objc_opt_respondsToSelector(v22, v53);

          if ((v23 & 1) != 0)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "engineProcessingOperation:enqueuedOperationsForOrganizationWithIdentifier:", self, v25));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v26));

            v4 = v56;
          }
          else
          {
            v27 = 0;
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
          v29 = objc_opt_respondsToSelector(v28, v52);

          if ((v29 & 1) != 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation delegate](self, "delegate"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "engineProcessingOperation:assetResolverForOrganizationWithIdentifier:", self, v31));

          }
          else
          {
            v32 = 0;
          }
          v59 = v20;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation processCommandPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:](self, "processCommandPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:", v4, v15, v27, v32, &v59));
          v34 = v4;
          v35 = v59;

          if (!v33)
            goto LABEL_32;
          v5 = v14;
          -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v33);
          v58 = v35;
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation processDeclarationPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:](self, "processDeclarationPayloadsInContext:forOrganization:enqueuedOperations:assetResolver:error:", v34, v15, v27, v32, &v58));
          v9 = v58;

          if (!v36)
          {
            v35 = v9;
LABEL_32:
            -[DMDEngineDatabaseProcessingOperation setError:](self, "setError:", v35);

            v20 = v35;
            v4 = v56;
LABEL_33:
            v7 = v49;
            v6 = v50;

            v9 = v20;
            v5 = v14;
            goto LABEL_37;
          }
          -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v36);

          v4 = v56;
        }
        else
        {
          v37 = DMFConfigurationEngineLog(v18);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v48;
            v67 = v15;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Deleting deactivated organization %@", buf, 0xCu);
          }

          objc_msgSend(v4, "deleteObject:", v15);
          v5 = v14;
        }
        v13 = (char *)v13 + 1;
      }
      while (v54 != v13);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      v7 = v49;
      v6 = v50;
      v11 = &selRef_decodeObjectOfClasses_forKey_;
      v12 = &selRef_decodeObjectOfClasses_forKey_;
      v54 = v39;
      if (v39)
        continue;
      break;
    }
  }
  v40 = v9;

  v57 = v9;
  v41 = objc_msgSend(v4, "save:", &v57);
  v9 = v57;

  if (!v41)
  {
    v47 = DMFConfigurationEngineLog(v42);
    v44 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_100076334(v9);
LABEL_36:

    -[DMDEngineDatabaseProcessingOperation setError:](self, "setError:", v9);
    goto LABEL_37;
  }
  -[DMDEngineDatabaseProcessingOperation setResultObject:](self, "setResultObject:", v5);
LABEL_37:

}

- (BOOL)preprocessDatabaseInContext:(id)a3 forOrganization:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  __objc2_class **p_superclass;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id obj;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  os_log_t log;
  id v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  void *v73;
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];

  v7 = a3;
  v60 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier"));
  v9 = objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsFromOrganizationWithIdentifier:](DMDDeclarationPayloadMetadata, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:", v8));

  v72 = 0;
  v61 = v7;
  v50 = (void *)v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v9, &v72));
  v11 = v72;
  v12 = v11;
  v49 = v10;
  if (v10)
  {
    v71 = 0u;
    v69 = 0u;
    v70 = 0u;
    v68 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v69;
      p_superclass = &OBJC_METACLASS___DMDBeginTransactionOperation.superclass;
      v51 = *(_QWORD *)v69;
      do
      {
        v17 = 0;
        v52 = v14;
        do
        {
          if (*(_QWORD *)v69 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v17);
          v19 = objc_autoreleasePoolPush();
          v20 = objc_opt_class(p_superclass + 164);
          if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
          {
            v57 = v19;
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "payload"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "payloadDictionary"));
            v67 = v12;
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[CEMConfigurationBase declarationForPayload:error:](CEMConfigurationBase, "declarationForPayload:error:", v21, &v67));
            v23 = v67;

            v55 = v22;
            if (v22)
            {
              log = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mutableSetValueForKey:", CFSTR("outgoingPayloadMetadataReferences")));
              -[NSObject removeAllObjects](log, "removeAllObjects");
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "assetReferences"));
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              v58 = v25;
              v26 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v64;
                v54 = v17;
                while (2)
                {
                  v29 = 0;
                  v30 = v23;
                  do
                  {
                    if (*(_QWORD *)v64 != v28)
                      objc_enumerationMutation(v58);
                    v31 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v29);
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier", v49));
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
                    v73 = v33;
                    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v73, 1));
                    v35 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:withIdentifiers:](DMDAssetPayloadMetadata, "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:withIdentifiers:", v32, v34));

                    v62 = v30;
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "executeFetchRequest:error:", v35, &v62));
                    v23 = v62;

                    if (!v36)
                    {
                      v39 = DMFConfigurationEngineLog(v37);
                      v40 = objc_claimAutoreleasedReturnValue(v39);
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      {
                        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
                        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "verboseDescription"));
                        *(_DWORD *)buf = 138543618;
                        v76 = v42;
                        v77 = 2114;
                        v78 = v43;
                        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to fetch asset with identifier (%{public}@): %{public}@", buf, 0x16u);

                      }
                      v17 = v54;
                      goto LABEL_23;
                    }
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
                    if (v38)
                      -[NSObject addObject:](log, "addObject:", v38);

                    v29 = (char *)v29 + 1;
                    v30 = v23;
                  }
                  while (v27 != v29);
                  v27 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
                  v17 = v54;
                  if (v27)
                    continue;
                  break;
                }
              }
LABEL_23:

              v15 = v51;
              v14 = v52;
              p_superclass = (__objc2_class **)(&OBJC_METACLASS___DMDBeginTransactionOperation + 8);
            }
            else
            {
              v41 = DMFConfigurationEngineLog(v24);
              log = (os_log_t)objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "verboseDescription"));
                *(_DWORD *)buf = 138543618;
                v76 = v44;
                v77 = 2114;
                v78 = v45;
                _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to deserialize configuration engine model: %{public}@", buf, 0x16u);

              }
            }
            v19 = v57;

            v12 = v23;
          }
          objc_autoreleasePoolPop(v19);
          v17 = (char *)v17 + 1;
        }
        while (v17 != v14);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v14);
    }

  }
  else
  {
    v46 = DMFConfigurationEngineLog(v11);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_100076428(v12);

    if (a5)
    {
      v12 = objc_retainAutorelease(v12);
      *a5 = v12;
    }
  }

  return v49 != 0;
}

- (BOOL)updateActiveRestrictionsInContext:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  unsigned __int8 v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  _QWORD v61[2];
  _QWORD v62[3];
  _QWORD v63[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationPayloadMetadata fetchRequest](DMDConfigurationPayloadMetadata, "fetchRequest", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("installed"), &__kCFBooleanTrue));
  v63[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("failed"), &__kCFBooleanFalse));
  v63[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("installed"), &__kCFBooleanFalse));
  v62[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("failed"), &__kCFBooleanFalse));
  v62[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SUBQUERY(incomingPayloadMetadataReferences, $ref, ($ref.available == YES) && ($ref.predicatePayloadMetadata.%K.BOOLValue == YES)).@count > 0"), DMFDeclarationStatePredicateLastEvaluationValueKey));
  v62[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v12));

  v61[0] = v8;
  v61[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v14));
  objc_msgSend(v4, "setPredicate:", v15);

  v57 = 0;
  v50 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "execute:", &v57));
  v17 = v57;
  v18 = v17;
  if (v16)
  {
    v45 = v17;
    v47 = v13;
    v48 = v8;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v16, "count")));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v46 = v16;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "type"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringFromIndex:", 24));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@-restrictions"), v26, v27));

          objc_msgSend(v51, "addObject:", v28);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v21);
    }

    v30 = DMFConfigurationEngineLog(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v51;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Active restrictions: %@", buf, 0xCu);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[DMFConfigurationSourceClient activeRestrictionsURL](DMFConfigurationSourceClient, "activeRestrictionsURL"));
    v13 = v47;
    v8 = v48;
    if (v32)
    {
      v33 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v51, 200, 0, 0));
      v52 = v45;
      v34 = -[NSObject writeToURL:options:error:](v33, "writeToURL:options:error:", v32, 1, &v52);
      v18 = v52;

      if ((v34 & 1) != 0)
      {
        v36 = objc_msgSend(v32, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsExcludedFromBackupKey, 0);
        v16 = v46;
        if ((v36 & 1) == 0)
        {
          v37 = DMFConfigurationEngineLog(v36);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            sub_10007659C();

        }
      }
      else
      {
        v42 = DMFConfigurationEngineLog(v35);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        v16 = v46;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          sub_10007659C();

        if (a4)
        {
          v18 = objc_retainAutorelease(v18);
          *a4 = v18;
        }
      }
    }
    else
    {
      v41 = DMFConfigurationEngineLog(0);
      v33 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        sub_10007652C();
      v34 = 0;
      v18 = v45;
      v16 = v46;
    }

  }
  else
  {
    v39 = DMFConfigurationEngineLog(v17);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      sub_1000764A0();

    if (a4)
    {
      v18 = objc_retainAutorelease(v18);
      v34 = 0;
      *a4 = v18;
    }
    else
    {
      v34 = 0;
    }
  }

  return v34;
}

- (id)processCommandPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  DMDCommandExecuteOperation *v34;
  uint64_t v35;
  uint64_t isKindOfClass;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  DMDCommandExecuteOperation *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *k;
  void *v58;
  void *v59;
  DMDCommandRemoveOperation *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  DMDCommandRemoveOperation *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  NSObject *v86;
  _BOOL4 v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  id v102;
  id v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSObject *v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  NSMutableArray *v124;
  id v125;
  id v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  NSMutableArray *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  void *v141;
  NSObject *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  id *v147;
  NSObject *v148;
  void *v149;
  id v150;
  id obj;
  NSMutableArray *v152;
  NSMutableDictionary *v153;
  NSMutableDictionary *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  uint8_t v192[128];
  uint8_t buf[4];
  void *v194;
  __int16 v195;
  void *v196;
  _BYTE v197[128];
  _BYTE v198[128];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v147 = a7;
  if (!a7)
  {
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v141, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEngineDatabaseProcessingOperation.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v152 = objc_opt_new(NSMutableArray);
  v153 = objc_opt_new(NSMutableDictionary);
  v154 = objc_opt_new(NSMutableDictionary);
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v184;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v184 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * (_QWORD)i);
        v22 = objc_opt_class(DMDCommandActionOperation);
        if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "payloadMetadataObjectID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v21, v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "payloadIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v154, "setObject:forKeyedSubscript:", v21, v24);

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
    }
    while (v18);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[DMDCommandPayloadMetadata fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:](DMDCommandPayloadMetadata, "fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:", v25));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "execute:", v147));
  v150 = v27;
  if (!v27)
  {
    v136 = DMFConfigurationEngineLog(0);
    v52 = objc_claimAutoreleasedReturnValue(v136);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      sub_100076618((uint64_t)v147);
    v135 = 0;
    goto LABEL_108;
  }
  v143 = v26;
  v144 = v16;
  v145 = v13;
  v146 = v14;
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
  if (!v28)
    goto LABEL_26;
  v29 = v28;
  v30 = *(_QWORD *)v180;
  do
  {
    for (j = 0; j != v29; j = (char *)j + 1)
    {
      if (*(_QWORD *)v180 != v30)
        objc_enumerationMutation(v150);
      v32 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * (_QWORD)j);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
      v34 = (DMDCommandExecuteOperation *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v154, "objectForKeyedSubscript:", v33));

      if (v34)
      {
        v35 = objc_opt_class(DMDCommandExecuteOperation);
        isKindOfClass = objc_opt_isKindOfClass(v34, v35);
        if ((isKindOfClass & 1) != 0)
          goto LABEL_24;
        v37 = DMFConfigurationEngineLog(isKindOfClass);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
          v40 = (objc_class *)objc_opt_class(v34);
          v41 = NSStringFromClass(v40);
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          *(_DWORD *)buf = 138543618;
          v194 = v39;
          v195 = 2114;
          v196 = v42;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%{public}@: Cancelling enqueued %{public}@ so we can enqueue an execute command operation", buf, 0x16u);

        }
        -[DMDCommandExecuteOperation cancel](v34, "cancel");

      }
      v43 = [DMDCommandExecuteOperation alloc];
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectID"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
      v34 = -[DMDPayloadActionOperation initWithDatabase:payloadMetadataObjectID:payloadIdentifier:](v43, "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:", v44, v45, v46);

      -[DMDPayloadActionOperation setRequiresNetworkTether:](v34, "setRequiresNetworkTether:", objc_msgSend(v32, "requiresNetworkTether"));
      -[DMDPayloadActionOperation setRequiresUnlockedKeychain:](v34, "setRequiresUnlockedKeychain:", objc_msgSend(v32, "requiresUnlockedKeychain"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
      -[DMDPayloadActionOperation setDeviceStateProvider:](v34, "setDeviceStateProvider:", v47);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation taskOperationProvider](self, "taskOperationProvider"));
      -[DMDPayloadActionOperation setTaskOperationProvider:](v34, "setTaskOperationProvider:", v48);

      -[NSMutableArray addObject:](v152, "addObject:", v34);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v34, v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v154, "setObject:forKeyedSubscript:", v34, v50);

LABEL_24:
    }
    v29 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
  }
  while (v29);
LABEL_26:
  v14 = v146;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "identifier"));
  v52 = objc_claimAutoreleasedReturnValue(+[DMDCommandPayloadMetadata fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:](DMDCommandPayloadMetadata, "fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:", v51));

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject execute:](v52, "execute:", v147));
  v149 = v53;
  if (v53)
  {
    v142 = v52;
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v175, v192, 16);
    if (!v54)
      goto LABEL_40;
    v55 = v54;
    v56 = *(_QWORD *)v176;
    while (1)
    {
      for (k = 0; k != v55; k = (char *)k + 1)
      {
        if (*(_QWORD *)v176 != v56)
          objc_enumerationMutation(v149);
        v58 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * (_QWORD)k);
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
        v60 = (DMDCommandRemoveOperation *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v154, "objectForKeyedSubscript:", v59));

        if (v60)
        {
          v61 = objc_opt_class(DMDCommandRemoveOperation);
          v62 = objc_opt_isKindOfClass(v60, v61);
          if ((v62 & 1) != 0)
            goto LABEL_38;
          v63 = DMFConfigurationEngineLog(v62);
          v64 = objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
            v66 = (objc_class *)objc_opt_class(v60);
            v67 = NSStringFromClass(v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
            *(_DWORD *)buf = 138543618;
            v194 = v65;
            v195 = 2114;
            v196 = v68;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%{public}@: Cancelling enqueued %{public}@ so we can enqueue an remove command operation", buf, 0x16u);

          }
          -[DMDCommandRemoveOperation cancel](v60, "cancel");

        }
        v69 = [DMDCommandRemoveOperation alloc];
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectID"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
        v60 = -[DMDPayloadActionOperation initWithDatabase:payloadMetadataObjectID:payloadIdentifier:](v69, "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:", v70, v71, v72);

        -[DMDPayloadActionOperation setRequiresNetworkTether:](v60, "setRequiresNetworkTether:", objc_msgSend(v58, "requiresNetworkTether"));
        -[DMDPayloadActionOperation setRequiresUnlockedKeychain:](v60, "setRequiresUnlockedKeychain:", objc_msgSend(v58, "requiresUnlockedKeychain"));
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
        -[DMDPayloadActionOperation setDeviceStateProvider:](v60, "setDeviceStateProvider:", v73);

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation taskOperationProvider](self, "taskOperationProvider"));
        -[DMDPayloadActionOperation setTaskOperationProvider:](v60, "setTaskOperationProvider:", v74);

        -[NSMutableArray addObject:](v152, "addObject:", v60);
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectID"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v153, "setObject:forKeyedSubscript:", v60, v75);

        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v154, "setObject:forKeyedSubscript:", v60, v76);

LABEL_38:
      }
      v55 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v175, v192, 16);
      if (!v55)
      {
LABEL_40:
        v14 = v146;
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "identifier"));
        v78 = objc_claimAutoreleasedReturnValue(+[DMDCommandPayloadMetadata fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:](DMDCommandPayloadMetadata, "fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:", v77));

        v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject execute:](v78, "execute:", v147));
        v80 = v79;
        if (v79)
        {
          v173 = 0u;
          v174 = 0u;
          v171 = 0u;
          v172 = 0u;
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v171, v191, 16);
          v16 = v144;
          v13 = v145;
          v52 = v142;
          v26 = v143;
          if (v81)
          {
            v82 = v81;
            v83 = *(_QWORD *)v172;
            do
            {
              v84 = 0;
              do
              {
                if (*(_QWORD *)v172 != v83)
                  objc_enumerationMutation(v80);
                objc_msgSend(v145, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * (_QWORD)v84));
                v84 = (char *)v84 + 1;
              }
              while (v82 != v84);
              v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v171, v191, 16);
              v82 = v81;
            }
            while (v81);
          }
          v85 = DMFConfigurationEngineLog(v81);
          v86 = objc_claimAutoreleasedReturnValue(v85);
          v87 = os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG);

          if (v87)
          {
            v148 = v78;
            v89 = DMFConfigurationEngineLog(v88);
            v90 = objc_claimAutoreleasedReturnValue(v89);
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
              sub_100076830();

            v169 = 0u;
            v170 = 0u;
            v167 = 0u;
            v168 = 0u;
            v91 = v150;
            v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v167, v190, 16);
            if (v92)
            {
              v93 = v92;
              v94 = *(_QWORD *)v168;
              do
              {
                v95 = 0;
                do
                {
                  if (*(_QWORD *)v168 != v94)
                    objc_enumerationMutation(v91);
                  v96 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)v95);
                  v97 = DMFConfigurationEngineLog(v92);
                  v98 = objc_claimAutoreleasedReturnValue(v97);
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v96;
                    _os_log_debug_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v95 = (char *)v95 + 1;
                }
                while (v93 != v95);
                v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v167, v190, 16);
                v93 = v92;
              }
              while (v92);
            }

            v100 = DMFConfigurationEngineLog(v99);
            v101 = objc_claimAutoreleasedReturnValue(v100);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
              sub_100076804();

            v165 = 0u;
            v166 = 0u;
            v163 = 0u;
            v164 = 0u;
            v102 = v149;
            v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v163, v189, 16);
            if (v103)
            {
              v104 = v103;
              v105 = *(_QWORD *)v164;
              do
              {
                v106 = 0;
                do
                {
                  if (*(_QWORD *)v164 != v105)
                    objc_enumerationMutation(v102);
                  v107 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)v106);
                  v108 = DMFConfigurationEngineLog(v103);
                  v109 = objc_claimAutoreleasedReturnValue(v108);
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v107;
                    _os_log_debug_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v106 = (char *)v106 + 1;
                }
                while (v104 != v106);
                v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v163, v189, 16);
                v104 = v103;
              }
              while (v103);
            }

            v111 = DMFConfigurationEngineLog(v110);
            v112 = objc_claimAutoreleasedReturnValue(v111);
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
              sub_1000767D8();

            v161 = 0u;
            v162 = 0u;
            v159 = 0u;
            v160 = 0u;
            v113 = v80;
            v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v159, v188, 16);
            if (v114)
            {
              v115 = v114;
              v116 = *(_QWORD *)v160;
              do
              {
                v117 = 0;
                do
                {
                  if (*(_QWORD *)v160 != v116)
                    objc_enumerationMutation(v113);
                  v118 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)v117);
                  v119 = DMFConfigurationEngineLog(v114);
                  v120 = objc_claimAutoreleasedReturnValue(v119);
                  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v118;
                    _os_log_debug_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v117 = (char *)v117 + 1;
                }
                while (v115 != v117);
                v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v159, v188, 16);
                v115 = v114;
              }
              while (v114);
            }

            v122 = DMFConfigurationEngineLog(v121);
            v123 = objc_claimAutoreleasedReturnValue(v122);
            if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
              sub_1000767AC();

            v157 = 0u;
            v158 = 0u;
            v155 = 0u;
            v156 = 0u;
            v124 = v152;
            v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v155, v187, 16);
            v13 = v145;
            if (v125)
            {
              v126 = v125;
              v127 = *(_QWORD *)v156;
              do
              {
                v128 = 0;
                do
                {
                  if (*(_QWORD *)v156 != v127)
                    objc_enumerationMutation(v124);
                  v129 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)v128);
                  v130 = DMFConfigurationEngineLog(v125);
                  v131 = objc_claimAutoreleasedReturnValue(v130);
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    v194 = v129;
                    _os_log_debug_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                  }

                  v128 = (char *)v128 + 1;
                }
                while (v126 != v128);
                v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v124, "countByEnumeratingWithState:objects:count:", &v155, v187, 16);
                v126 = v125;
              }
              while (v125);
            }

            v133 = DMFConfigurationEngineLog(v132);
            v134 = objc_claimAutoreleasedReturnValue(v133);
            if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
              sub_100076780();

            v14 = v146;
            v78 = v148;
            v26 = v143;
            v16 = v144;
            v52 = v142;
          }
          v135 = v152;
        }
        else
        {
          v138 = DMFConfigurationEngineLog(0);
          v139 = objc_claimAutoreleasedReturnValue(v138);
          v16 = v144;
          v13 = v145;
          v52 = v142;
          v26 = v143;
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
            sub_100076708((uint64_t)v147);

          v135 = 0;
        }

        goto LABEL_107;
      }
    }
  }
  v137 = DMFConfigurationEngineLog(0);
  v78 = objc_claimAutoreleasedReturnValue(v137);
  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    sub_100076690((uint64_t)v147);
  v135 = 0;
  v16 = v144;
  v13 = v145;
  v26 = v143;
LABEL_107:

LABEL_108:
  return v135;
}

- (id)processDeclarationPayloadsInContext:(id)a3 forOrganization:(id)a4 enqueuedOperations:(id)a5 assetResolver:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _UNKNOWN **v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void **v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t isKindOfClass;
  id v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  id v91;
  uint64_t v92;
  void *j;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  id v103;
  id v104;
  uint64_t v105;
  __objc2_class **p_superclass;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  NSObject *v115;
  uint64_t v116;
  NSObject *v117;
  NSObject *v118;
  objc_class *v119;
  NSString *v120;
  id v121;
  __objc2_class **v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  void *v134;
  NSObject *v135;
  uint64_t v136;
  void *v137;
  id v138;
  uint64_t v139;
  id v140;
  NSMutableDictionary *v141;
  id v142;
  uint64_t v143;
  __objc2_class **v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *v152;
  NSObject *v153;
  uint64_t v154;
  NSObject *v155;
  NSObject *v156;
  objc_class *v157;
  NSString *v158;
  id v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  NSObject *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  NSObject *v170;
  void *v171;
  id v172;
  char **v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  DMDAssetInstallOperation *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  NSObject *v184;
  NSObject *v185;
  objc_class *v186;
  NSString *v187;
  id v188;
  DMDAssetInstallOperation *v189;
  void *v190;
  void *v191;
  void *v192;
  DMDAssetInstallOperation *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  uint64_t v198;
  NSObject *v199;
  void *v200;
  unsigned __int8 v201;
  void *v202;
  NSObject *v203;
  void *v204;
  void *v205;
  id v206;
  id v207;
  id v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *k;
  void *v213;
  void *v214;
  void *v215;
  NSObject *v216;
  void *v217;
  void *v218;
  id v219;
  id v220;
  id v221;
  uint64_t v222;
  void *m;
  uint64_t v224;
  uint64_t v225;
  NSObject *v226;
  _BOOL4 v227;
  uint64_t v228;
  uint64_t v229;
  NSObject *v230;
  id v231;
  id v232;
  id v233;
  uint64_t v234;
  void *v235;
  NSObject *v236;
  uint64_t v237;
  NSObject *v238;
  uint64_t v239;
  uint64_t v240;
  NSObject *v241;
  id v242;
  id v243;
  id v244;
  uint64_t v245;
  void *v246;
  NSObject *v247;
  uint64_t v248;
  NSObject *v249;
  uint64_t v250;
  uint64_t v251;
  NSObject *v252;
  id v253;
  id v254;
  id v255;
  uint64_t v256;
  void *v257;
  NSObject *v258;
  uint64_t v259;
  NSObject *v260;
  uint64_t v261;
  uint64_t v262;
  NSObject *v263;
  NSMutableArray *v264;
  id v265;
  id v266;
  uint64_t v267;
  void *v268;
  NSObject *v269;
  uint64_t v270;
  NSObject *v271;
  uint64_t v272;
  uint64_t v273;
  NSObject *v274;
  NSMutableArray *v275;
  uint64_t v276;
  void *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  NSObject *v282;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  NSObject *v288;
  void *v289;
  void *v290;
  void *v291;
  id v292;
  uint64_t v293;
  id v294;
  id v295;
  void *v296;
  void *v297;
  void *v298;
  id *v299;
  void *v300;
  NSObject *v301;
  NSMutableDictionary *v302;
  uint64_t v303;
  id v304;
  void *v305;
  id v306;
  id v307;
  NSMutableArray *v308;
  unsigned int obj;
  NSObject *objc;
  id obja;
  NSObject *objb;
  uint64_t v313;
  NSMutableDictionary *v314;
  void *v316;
  uint64_t v317;
  id v318;
  NSObject *v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  _BYTE v364[128];
  _BYTE v365[128];
  _BYTE v366[128];
  _BYTE v367[128];
  _BYTE v368[128];
  uint64_t v369;
  uint64_t v370;
  _BYTE v371[128];
  _BYTE v372[128];
  _BYTE v373[128];
  _BYTE v374[128];
  _BYTE v375[128];
  uint64_t v376;
  void *v377;
  uint64_t v378;
  void *v379;
  uint8_t buf[4];
  NSObject *v381;
  __int16 v382;
  id v383;
  __int16 v384;
  uint64_t v385;
  __int16 v386;
  unsigned int v387;
  uint64_t v388;
  void *v389;
  uint64_t v390;
  void *v391;
  uint64_t v392;
  void *v393;
  _BYTE v394[128];

  v12 = a3;
  v13 = a4;
  v292 = a5;
  v306 = a6;
  if (!a7)
  {
    v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v284, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEngineDatabaseProcessingOperation.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v298 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[DMDActivationPayloadMetadata fetchRequestForActivationsFromOrganizationWithIdentifier:](DMDActivationPayloadMetadata, "fetchRequestForActivationsFromOrganizationWithIdentifier:", v14));

  v291 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "execute:", a7));
  v290 = v16;
  if (!v16)
  {
    v276 = DMFConfigurationEngineLog(0);
    v308 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v276);
    if (os_log_type_enabled(&v308->super.super, OS_LOG_TYPE_ERROR))
      sub_10007685C((uint64_t)a7);
    v275 = 0;
    v277 = v13;
    goto LABEL_206;
  }
  v289 = v12;
  v362 = 0u;
  v363 = 0u;
  v360 = 0u;
  v361 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v360, v394, 16);
  v299 = a7;
  if (!v18)
    goto LABEL_54;
  v19 = v18;
  v20 = &ACAccountPropertyPersonaIdentifier_ptr;
  v317 = *(_QWORD *)v361;
  v313 = DMFDeclarationStatePredicateLastEvaluationValueKey;
  v307 = v17;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(_QWORD *)v361 != v317)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v360 + 1) + 8 * (_QWORD)i);
      v23 = v20[354];
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "payload"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "payloadDictionary"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "declarationForPayload:error:", v25, a7));

      if (!v26)
      {
        v34 = DMFConfigurationEngineLog(v27);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a7, "verboseDescription"));
          *(_DWORD *)buf = 138543618;
          v381 = v68;
          v382 = 2114;
          v383 = v69;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to parse activation payload (%{public}@): %{public}@", buf, 0x16u);

          v20 = &ACAccountPropertyPersonaIdentifier_ptr;
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation activationPredicateObserverManager](self, "activationPredicateObserverManager"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
        objc_msgSend(v36, "removeActivationPredicateObserverWithUniqueIdentifier:", v37);

        objc_msgSend(v22, "setFailed:", 1);
        v392 = v313;
        v393 = &__kCFBooleanFalse;
        v38 = &v393;
        v39 = &v392;
        goto LABEL_28;
      }
      v28 = objc_opt_class(CEMActivationBasicDeclaration);
      if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0)
      {
        if (objc_msgSend(v22, "available"))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationPayloadMetadata fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:](DMDConfigurationPayloadMetadata, "fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:", v29));

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "execute:", a7));
          if (v31)
          {
            v390 = v313;
            v391 = &__kCFBooleanTrue;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v391, &v390, 1));
            objc_msgSend(v22, "setPredicatePayloadMetadata:", v32);

            objc_msgSend(v22, "setInstalled:", 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v31));
            objc_msgSend(v22, "setOutgoingPayloadMetadataReferences:", v33);

            objc_msgSend(v22, "updateStateDictionaryIfNeeded");
          }
          else
          {
            v63 = DMFConfigurationEngineLog(0);
            v64 = objc_claimAutoreleasedReturnValue(v63);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v299, "verboseDescription"));
              *(_DWORD *)buf = 138543618;
              v381 = v85;
              v382 = 2114;
              v383 = v86;
              _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Failed to fetch available configurations for organization (%{public}@): %{public}@", buf, 0x16u);

              v17 = v307;
              a7 = v299;
            }

            objc_msgSend(v22, "setFailed:", 1);
          }

LABEL_51:
          v20 = &ACAccountPropertyPersonaIdentifier_ptr;
          goto LABEL_52;
        }
        v388 = v313;
        v389 = &__kCFBooleanFalse;
        v38 = &v389;
        v39 = &v388;
LABEL_28:
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v39, 1));
        objc_msgSend(v22, "setPredicatePayloadMetadata:", v62);

        objc_msgSend(v22, "setInstalled:", 0);
        objc_msgSend(v22, "updateStateDictionaryIfNeeded");
        goto LABEL_52;
      }
      v40 = objc_opt_class(CEMActivationSimpleDeclaration);
      isKindOfClass = objc_opt_isKindOfClass(v26, v40);
      if ((isKindOfClass & 1) != 0)
      {
        if (!objc_msgSend(v22, "available"))
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation activationPredicateObserverManager](self, "activationPredicateObserverManager"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
          objc_msgSend(v60, "removeActivationPredicateObserverWithUniqueIdentifier:", v61);

          v376 = v313;
          v377 = &__kCFBooleanFalse;
          v38 = &v377;
          v39 = &v376;
          goto LABEL_28;
        }
        v42 = v26;
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "predicatePayloadMetadata"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v313));
        v45 = objc_msgSend(v44, "BOOLValue");

        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "payloadPredicate"));
        if (v46)
        {
          obj = v45;
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation activationPredicateObserverManager](self, "activationPredicateObserverManager"));
          v49 = v42;
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "payloadPredicate"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
          v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "addActivationPredicateObserverForPredicate:withUniqueIdentifier:", v50, v51));

          if (v52)
          {
            v54 = objc_claimAutoreleasedReturnValue(-[NSObject evaluatePredicateWithError:](v52, "evaluatePredicateWithError:", a7));
            v55 = v54;
            if (v54)
            {
              obj = -[NSObject BOOLValue](v54, "BOOLValue");
              v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject metadata](v52, "metadata"));
              goto LABEL_42;
            }
            v73 = DMFConfigurationEngineLog(0);
            v74 = objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              v301 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
              v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v299, "verboseDescription"));
              *(_DWORD *)buf = 138544130;
              v381 = v301;
              v382 = 2114;
              v383 = v87;
              v384 = 2114;
              v385 = v88;
              v89 = (void *)v88;
              v386 = 1024;
              v387 = obj;
              _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to evaluate activation predicate with unique identifier %{public}@ for organization (%{public}@): %{public}@ using last predicate evaluation %d", buf, 0x26u);

            }
          }
          else
          {
            v70 = DMFConfigurationEngineLog(v53);
            v55 = objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
              *(_DWORD *)buf = 138543874;
              v381 = v71;
              v382 = 2114;
              v383 = v72;
              v384 = 1024;
              LODWORD(v385) = obj;
              _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to create activation predicate observer with unique identifier %{public}@ for organization (%{public}@) using last predicate evaluation %d", buf, 0x1Cu);

            }
          }
          v56 = 0;
LABEL_42:

        }
        else
        {
          v49 = v42;
          v65 = DMFConfigurationEngineLog(v47);
          v52 = objc_claimAutoreleasedReturnValue(v65);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
            *(_DWORD *)buf = 138543618;
            v381 = v66;
            v382 = 2114;
            v383 = v67;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Activation predicate with unique identifier %{public}@ for organization (%{public}@) is nil", buf, 0x16u);

          }
          v56 = 0;
          obj = 1;
        }

        v75 = objc_alloc((Class)NSMutableArray);
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "payloadStandardConfigurations"));
        v77 = objc_msgSend(v75, "initWithArray:", v76);

        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationPayloadMetadata fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:payloadIdentifiers:](DMDConfigurationPayloadMetadata, "fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:payloadIdentifiers:", v78, v77));

        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "execute:", v299));
        if (v80)
        {
          if (!v56)
          {
            v378 = v313;
            v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", obj));
            v379 = v81;
            v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v379, &v378, 1));

          }
          objc_msgSend(v22, "setPredicatePayloadMetadata:", v56);
          objc_msgSend(v22, "setInstalled:", 1);
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v80));
          objc_msgSend(v22, "setOutgoingPayloadMetadataReferences:", v82);

          objc_msgSend(v22, "updateStateDictionaryIfNeeded");
        }
        else
        {
          v83 = DMFConfigurationEngineLog(0);
          v84 = objc_claimAutoreleasedReturnValue(v83);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            objc = objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
            v300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v299, "verboseDescription"));
            *(_DWORD *)buf = 138543618;
            v381 = objc;
            v382 = 2114;
            v383 = v300;
            _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Failed to fetch available configurations for organization (%{public}@): %{public}@", buf, 0x16u);

          }
          objc_msgSend(v22, "setFailed:", 1);
        }

        a7 = v299;
        v17 = v307;
        goto LABEL_51;
      }
      v57 = DMFConfigurationEngineLog(isKindOfClass);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "type"));
        *(_DWORD *)buf = 138543362;
        v381 = v59;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Unknown activation type: %{public}@", buf, 0xCu);

      }
LABEL_52:

    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v360, v394, 16);
  }
  while (v19);
LABEL_54:

  v12 = v289;
  if (-[DMDEngineDatabaseProcessingOperation updateActiveRestrictionsInContext:error:](self, "updateActiveRestrictionsInContext:error:", v289, a7))
  {
    v308 = objc_opt_new(NSMutableArray);
    v314 = objc_opt_new(NSMutableDictionary);
    v302 = objc_opt_new(NSMutableDictionary);
    v356 = 0u;
    v357 = 0u;
    v358 = 0u;
    v359 = 0u;
    obja = v292;
    v90 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v356, v375, 16);
    if (v90)
    {
      v91 = v90;
      v92 = *(_QWORD *)v357;
      do
      {
        for (j = 0; j != v91; j = (char *)j + 1)
        {
          if (*(_QWORD *)v357 != v92)
            objc_enumerationMutation(obja);
          v94 = *(void **)(*((_QWORD *)&v356 + 1) + 8 * (_QWORD)j);
          v95 = objc_opt_class(DMDDeclarationActionOperation);
          if ((objc_opt_isKindOfClass(v94, v95) & 1) != 0)
          {
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "payloadMetadataObjectID"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v314, "setObject:forKeyedSubscript:", v94, v96);

            v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "payloadIdentifier"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v302, "setObject:forKeyedSubscript:", v94, v97);

          }
        }
        v91 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v356, v375, 16);
      }
      while (v91);
    }

    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:](DMDConfigurationPayloadMetadata, "fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:", v98));

    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "execute:", a7));
    v101 = objc_msgSend(v100, "mutableCopy");

    if (v101)
    {
      v285 = v99;
      v286 = v101;
      v354 = 0u;
      v355 = 0u;
      v352 = 0u;
      v353 = 0u;
      v318 = objc_msgSend(v101, "copy");
      v103 = objc_msgSend(v318, "countByEnumeratingWithState:objects:count:", &v352, v374, 16);
      if (v103)
      {
        v104 = v103;
        v105 = *(_QWORD *)v353;
        p_superclass = &OBJC_METACLASS___DMDBeginTransactionOperation.superclass;
        v303 = *(_QWORD *)v353;
        do
        {
          v107 = 0;
          v304 = v104;
          do
          {
            if (*(_QWORD *)v353 != v105)
              objc_enumerationMutation(v318);
            v108 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * (_QWORD)v107);
            v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifier"));
            v110 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v302, "objectForKeyedSubscript:", v109));

            v111 = objc_opt_class(p_superclass + 174);
            v112 = objc_opt_isKindOfClass(v110, v111);
            if ((v112 & 1) != 0)
            {
              v113 = DMFConfigurationEngineLog(v112);
              v114 = objc_claimAutoreleasedReturnValue(v113);
              if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
              {
                v115 = objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifier"));
                *(_DWORD *)buf = 138543362;
                v381 = v115;
                _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_INFO, "Remove %{public}@: Declaration remove operation already enqueued, skipping", buf, 0xCu);

              }
            }
            else
            {
              if (v110)
              {
                v116 = DMFConfigurationEngineLog(v112);
                v117 = objc_claimAutoreleasedReturnValue(v116);
                if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
                {
                  v118 = objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifier"));
                  v119 = (objc_class *)objc_opt_class(v110);
                  v120 = NSStringFromClass(v119);
                  v121 = (id)objc_claimAutoreleasedReturnValue(v120);
                  *(_DWORD *)buf = 138543618;
                  v381 = v118;
                  v382 = 2114;
                  v383 = v121;
                  _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_INFO, "Remove %{public}@: Cancelling enqueued %{public}@ so we can enqueue a remove operation", buf, 0x16u);

                }
                objc_msgSend(v110, "cancel");
              }
              v122 = p_superclass;
              v123 = objc_alloc((Class)(p_superclass + 174));
              v124 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
              v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectID"));
              v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifier"));
              v114 = objc_msgSend(v123, "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:", v124, v125, v126);

              v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "identifier"));
              -[NSObject setName:](v114, "setName:", v127);

              -[NSObject setRequiresNetworkTether:](v114, "setRequiresNetworkTether:", objc_msgSend(v108, "requiresNetworkTether"));
              -[NSObject setRequiresUnlockedKeychain:](v114, "setRequiresUnlockedKeychain:", objc_msgSend(v108, "requiresUnlockedKeychain"));
              v128 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
              -[NSObject setDeviceStateProvider:](v114, "setDeviceStateProvider:", v128);

              v129 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation taskOperationProvider](self, "taskOperationProvider"));
              -[NSObject setTaskOperationProvider:](v114, "setTaskOperationProvider:", v129);

              -[NSMutableArray addObject:](v308, "addObject:", v114);
              v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectID"));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v314, "setObject:forKeyedSubscript:", v114, v130);

              v132 = DMFConfigurationEngineLog(v131);
              v133 = objc_claimAutoreleasedReturnValue(v132);
              if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v381 = v114;
                _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_INFO, "Enqueued remove operation: %{public}@", buf, 0xCu);
              }

              p_superclass = v122;
              v105 = v303;
              v104 = v304;
            }

            v107 = (char *)v107 + 1;
          }
          while (v104 != v107);
          v104 = objc_msgSend(v318, "countByEnumeratingWithState:objects:count:", &v352, v374, 16);
        }
        while (v104);
      }

      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
      v135 = objc_claimAutoreleasedReturnValue(+[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:](DMDConfigurationPayloadMetadata, "fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:", v134));

      v288 = v135;
      v136 = (uint64_t)v299;
      v137 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject execute:](v135, "execute:", v299));
      v138 = objc_msgSend(v137, "mutableCopy");

      v287 = v138;
      if (v138)
      {
        v350 = 0u;
        v351 = 0u;
        v348 = 0u;
        v349 = 0u;
        v295 = objc_msgSend(v138, "copy");
        v140 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v348, v373, 16);
        v141 = v314;
        if (v140)
        {
          v142 = v140;
          v143 = *(_QWORD *)v349;
          v144 = &OBJC_METACLASS___DMDBeginTransactionOperation.superclass;
          v293 = *(_QWORD *)v349;
          do
          {
            v145 = 0;
            v294 = v142;
            do
            {
              if (*(_QWORD *)v349 != v143)
                objc_enumerationMutation(v295);
              v146 = *(void **)(*((_QWORD *)&v348 + 1) + 8 * (_QWORD)v145);
              v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "identifier"));
              v148 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v302, "objectForKeyedSubscript:", v147));

              v149 = objc_opt_class(v144 + 134);
              v150 = objc_opt_isKindOfClass(v148, v149);
              if ((v150 & 1) == 0)
              {
                if (v148)
                {
                  v154 = DMFConfigurationEngineLog(v150);
                  v155 = objc_claimAutoreleasedReturnValue(v154);
                  if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
                  {
                    v156 = objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "identifier"));
                    v157 = (objc_class *)objc_opt_class(v148);
                    v158 = NSStringFromClass(v157);
                    v159 = (id)objc_claimAutoreleasedReturnValue(v158);
                    *(_DWORD *)buf = 138543618;
                    v381 = v156;
                    v382 = 2114;
                    v383 = v159;
                    _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_INFO, "Install %{public}@: Cancelling enqueued %{public}@ so we can enqueue an install operation", buf, 0x16u);

                  }
                  objc_msgSend(v148, "cancel");
                }
                v296 = v148;
                v297 = v145;
                v160 = objc_alloc((Class)(v144 + 134));
                v161 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
                v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectID"));
                v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "identifier"));
                v164 = objc_msgSend(v160, "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:", v161, v162, v163);

                v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "identifier"));
                -[NSObject setName:](v164, "setName:", v165);

                -[NSObject setRequiresNetworkTether:](v164, "setRequiresNetworkTether:", objc_msgSend(v146, "requiresNetworkTether"));
                -[NSObject setRequiresUnlockedKeychain:](v164, "setRequiresUnlockedKeychain:", objc_msgSend(v146, "requiresUnlockedKeychain"));
                v166 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
                -[NSObject setDeviceStateProvider:](v164, "setDeviceStateProvider:", v166);

                v167 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation taskOperationProvider](self, "taskOperationProvider"));
                -[NSObject setTaskOperationProvider:](v164, "setTaskOperationProvider:", v167);

                -[NSMutableArray addObject:](v308, "addObject:", v164);
                v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectID"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v141, "setObject:forKeyedSubscript:", v164, v168);

                v169 = DMFConfigurationEngineLog(objc_msgSend(obja, "addObject:", v164));
                v170 = objc_claimAutoreleasedReturnValue(v169);
                if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543362;
                  v381 = v164;
                  _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_INFO, "Enqueued configuration install operation: %{public}@", buf, 0xCu);
                }

                v346 = 0u;
                v347 = 0u;
                v344 = 0u;
                v345 = 0u;
                v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "outgoingPayloadMetadataReferences"));
                v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v344, v372, 16);
                v173 = &selRef_server_clientSession_didReceiveNotificationWithName_userInfo_;
                v319 = v164;
                if (!v172)
                {
LABEL_118:

                  v143 = v293;
                  v142 = v294;
                  v144 = (__objc2_class **)(&OBJC_METACLASS___DMDBeginTransactionOperation + 8);
                  v145 = v297;
                  v148 = v296;
                  goto LABEL_119;
                }
                v174 = v172;
                v175 = *(_QWORD *)v345;
                while (2)
                {
                  v176 = 0;
LABEL_100:
                  if (*(_QWORD *)v345 != v175)
                    objc_enumerationMutation(v171);
                  v177 = *(void **)(*((_QWORD *)&v344 + 1) + 8 * v176);
                  v178 = objc_opt_class(v173 + 496);
                  if ((objc_opt_isKindOfClass(v177, v178) & 1) != 0
                    && (objc_msgSend(v177, "installed") & 1) == 0)
                  {
                    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "objectID"));
                    v180 = (DMDAssetInstallOperation *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v141, "objectForKeyedSubscript:", v179));

                    v181 = objc_opt_class(DMDAssetInstallOperation);
                    v182 = objc_opt_isKindOfClass(v180, v181);
                    if ((v182 & 1) != 0)
                    {
                      if (!v180)
                        goto LABEL_110;
                    }
                    else
                    {
                      v183 = DMFConfigurationEngineLog(v182);
                      v184 = objc_claimAutoreleasedReturnValue(v183);
                      if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
                      {
                        v185 = objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "identifier"));
                        v186 = (objc_class *)objc_opt_class(v180);
                        v187 = NSStringFromClass(v186);
                        v188 = (id)objc_claimAutoreleasedReturnValue(v187);
                        *(_DWORD *)buf = 138543618;
                        v381 = v185;
                        v382 = 2114;
                        v383 = v188;
                        _os_log_impl((void *)&_mh_execute_header, v184, OS_LOG_TYPE_INFO, "Install %{public}@: Cancelling enqueued %{public}@ so we can enqueue an asset install operation", buf, 0x16u);

                      }
                      -[DMDAssetInstallOperation cancel](v180, "cancel");

LABEL_110:
                      v189 = [DMDAssetInstallOperation alloc];
                      v190 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
                      v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "objectID"));
                      v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "identifier"));
                      v193 = -[DMDPayloadActionOperation initWithDatabase:payloadMetadataObjectID:payloadIdentifier:](v189, "initWithDatabase:payloadMetadataObjectID:payloadIdentifier:", v190, v191, v192);

                      v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "identifier"));
                      -[DMDAssetInstallOperation setName:](v193, "setName:", v194);

                      -[DMDPayloadActionOperation setRequiresNetworkTether:](v193, "setRequiresNetworkTether:", objc_msgSend(v177, "requiresNetworkTether"));
                      -[DMDPayloadActionOperation setRequiresUnlockedKeychain:](v193, "setRequiresUnlockedKeychain:", objc_msgSend(v177, "requiresUnlockedKeychain"));
                      v195 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation deviceStateProvider](self, "deviceStateProvider"));
                      -[DMDPayloadActionOperation setDeviceStateProvider:](v193, "setDeviceStateProvider:", v195);

                      v141 = v314;
                      v196 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseProcessingOperation taskOperationProvider](self, "taskOperationProvider"));
                      -[DMDPayloadActionOperation setTaskOperationProvider:](v193, "setTaskOperationProvider:", v196);

                      -[DMDAssetInstallOperation setAssetResolver:](v193, "setAssetResolver:", v306);
                      -[NSMutableArray addObject:](v308, "addObject:", v193);
                      v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "objectID"));
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v314, "setObject:forKeyedSubscript:", v193, v197);

                      objc_msgSend(obja, "addObject:", v193);
                      v180 = v193;
                      v198 = DMFConfigurationEngineLog(v180);
                      v199 = objc_claimAutoreleasedReturnValue(v198);
                      if (os_log_type_enabled(v199, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        v381 = v180;
                        _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_INFO, "Enqueued asset install operation: %{public}@", buf, 0xCu);
                      }

                      v173 = &selRef_server_clientSession_didReceiveNotificationWithName_userInfo_;
                    }
                    v200 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dependencies](v319, "dependencies"));
                    v201 = objc_msgSend(v200, "containsObject:", v180);

                    if ((v201 & 1) == 0)
                      -[NSObject addDependency:](v319, "addDependency:", v180);

                  }
                  if (v174 == (id)++v176)
                  {
                    v174 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v344, v372, 16);
                    if (!v174)
                      goto LABEL_118;
                    continue;
                  }
                  goto LABEL_100;
                }
              }
              v151 = DMFConfigurationEngineLog(v150);
              v152 = objc_claimAutoreleasedReturnValue(v151);
              v319 = v152;
              if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
              {
                v153 = objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "identifier"));
                *(_DWORD *)buf = 138543362;
                v381 = v153;
                _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_INFO, "Install %{public}@: Declaration install operation already enqueued, skipping", buf, 0xCu);

              }
LABEL_119:

              v145 = (char *)v145 + 1;
              v136 = (uint64_t)v299;
            }
            while (v145 != v142);
            v142 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v348, v373, 16);
          }
          while (v142);
        }

        v202 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
        v203 = objc_claimAutoreleasedReturnValue(+[DMDConfigurationPayloadMetadata fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:](DMDConfigurationPayloadMetadata, "fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:", v202));

        v204 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject execute:](v203, "execute:", v136));
        v205 = v204;
        if (v204)
        {
          v342 = 0u;
          v343 = 0u;
          v340 = 0u;
          v341 = 0u;
          v316 = v204;
          v206 = v204;
          v207 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v340, v371, 16);
          if (v207)
          {
            v208 = v207;
            v209 = *(_QWORD *)v341;
            v210 = DMFDeclarationStateStatusKey;
            v211 = DMFDeclarationStatusInactive;
            do
            {
              for (k = 0; k != v208; k = (char *)k + 1)
              {
                if (*(_QWORD *)v341 != v209)
                  objc_enumerationMutation(v206);
                v213 = *(void **)(*((_QWORD *)&v340 + 1) + 8 * (_QWORD)k);
                v369 = v210;
                v370 = v211;
                v214 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v370, &v369, 1));
                objc_msgSend(v213, "setStateDictionary:", v214);

              }
              v208 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v340, v371, 16);
            }
            while (v208);
          }

          v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v298, "identifier"));
          v216 = objc_claimAutoreleasedReturnValue(+[DMDDeclarationPayloadMetadata fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:](DMDDeclarationPayloadMetadata, "fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:", v215));

          v217 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject execute:](v216, "execute:", v299));
          v218 = v217;
          if (v217)
          {
            v338 = 0u;
            v339 = 0u;
            v336 = 0u;
            v337 = 0u;
            v219 = v217;
            v220 = objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v336, v368, 16);
            v12 = v289;
            v141 = v314;
            if (v220)
            {
              v221 = v220;
              v222 = *(_QWORD *)v337;
              do
              {
                for (m = 0; m != v221; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v337 != v222)
                    objc_enumerationMutation(v219);
                  objc_msgSend(v289, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v336 + 1) + 8 * (_QWORD)m));
                }
                v221 = objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v336, v368, 16);
              }
              while (v221);
            }

            v225 = DMFConfigurationEngineLog(v224);
            v226 = objc_claimAutoreleasedReturnValue(v225);
            v227 = os_log_type_enabled(v226, OS_LOG_TYPE_DEBUG);

            if (v227)
            {
              v305 = v218;
              objb = v216;
              v229 = DMFConfigurationEngineLog(v228);
              v230 = objc_claimAutoreleasedReturnValue(v229);
              if (os_log_type_enabled(v230, OS_LOG_TYPE_DEBUG))
                sub_100076AC0();

              v334 = 0u;
              v335 = 0u;
              v332 = 0u;
              v333 = 0u;
              v231 = v287;
              v232 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v332, v367, 16);
              if (v232)
              {
                v233 = v232;
                v234 = *(_QWORD *)v333;
                do
                {
                  v235 = 0;
                  do
                  {
                    if (*(_QWORD *)v333 != v234)
                      objc_enumerationMutation(v231);
                    v236 = *(NSObject **)(*((_QWORD *)&v332 + 1) + 8 * (_QWORD)v235);
                    v237 = DMFConfigurationEngineLog(v232);
                    v238 = objc_claimAutoreleasedReturnValue(v237);
                    if (os_log_type_enabled(v238, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v236;
                      _os_log_debug_impl((void *)&_mh_execute_header, v238, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v235 = (char *)v235 + 1;
                  }
                  while (v233 != v235);
                  v232 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v332, v367, 16);
                  v233 = v232;
                }
                while (v232);
              }

              v240 = DMFConfigurationEngineLog(v239);
              v241 = objc_claimAutoreleasedReturnValue(v240);
              if (os_log_type_enabled(v241, OS_LOG_TYPE_DEBUG))
                sub_100076A94();

              v330 = 0u;
              v331 = 0u;
              v328 = 0u;
              v329 = 0u;
              v242 = v286;
              v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v328, v366, 16);
              if (v243)
              {
                v244 = v243;
                v245 = *(_QWORD *)v329;
                do
                {
                  v246 = 0;
                  do
                  {
                    if (*(_QWORD *)v329 != v245)
                      objc_enumerationMutation(v242);
                    v247 = *(NSObject **)(*((_QWORD *)&v328 + 1) + 8 * (_QWORD)v246);
                    v248 = DMFConfigurationEngineLog(v243);
                    v249 = objc_claimAutoreleasedReturnValue(v248);
                    if (os_log_type_enabled(v249, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v247;
                      _os_log_debug_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v246 = (char *)v246 + 1;
                  }
                  while (v244 != v246);
                  v243 = objc_msgSend(v242, "countByEnumeratingWithState:objects:count:", &v328, v366, 16);
                  v244 = v243;
                }
                while (v243);
              }

              v251 = DMFConfigurationEngineLog(v250);
              v252 = objc_claimAutoreleasedReturnValue(v251);
              if (os_log_type_enabled(v252, OS_LOG_TYPE_DEBUG))
                sub_100076A68();

              v326 = 0u;
              v327 = 0u;
              v324 = 0u;
              v325 = 0u;
              v253 = v219;
              v254 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v324, v365, 16);
              v218 = v305;
              if (v254)
              {
                v255 = v254;
                v256 = *(_QWORD *)v325;
                do
                {
                  v257 = 0;
                  do
                  {
                    if (*(_QWORD *)v325 != v256)
                      objc_enumerationMutation(v253);
                    v258 = *(NSObject **)(*((_QWORD *)&v324 + 1) + 8 * (_QWORD)v257);
                    v259 = DMFConfigurationEngineLog(v254);
                    v260 = objc_claimAutoreleasedReturnValue(v259);
                    if (os_log_type_enabled(v260, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v258;
                      _os_log_debug_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v257 = (char *)v257 + 1;
                  }
                  while (v255 != v257);
                  v254 = objc_msgSend(v253, "countByEnumeratingWithState:objects:count:", &v324, v365, 16);
                  v255 = v254;
                }
                while (v254);
              }

              v262 = DMFConfigurationEngineLog(v261);
              v263 = objc_claimAutoreleasedReturnValue(v262);
              if (os_log_type_enabled(v263, OS_LOG_TYPE_DEBUG))
                sub_100076A3C();

              v322 = 0u;
              v323 = 0u;
              v320 = 0u;
              v321 = 0u;
              v264 = v308;
              v265 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v264, "countByEnumeratingWithState:objects:count:", &v320, v364, 16);
              if (v265)
              {
                v266 = v265;
                v267 = *(_QWORD *)v321;
                do
                {
                  v268 = 0;
                  do
                  {
                    if (*(_QWORD *)v321 != v267)
                      objc_enumerationMutation(v264);
                    v269 = *(NSObject **)(*((_QWORD *)&v320 + 1) + 8 * (_QWORD)v268);
                    v270 = DMFConfigurationEngineLog(v265);
                    v271 = objc_claimAutoreleasedReturnValue(v270);
                    if (os_log_type_enabled(v271, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138543362;
                      v381 = v269;
                      _os_log_debug_impl((void *)&_mh_execute_header, v271, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
                    }

                    v268 = (char *)v268 + 1;
                  }
                  while (v266 != v268);
                  v265 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v264, "countByEnumeratingWithState:objects:count:", &v320, v364, 16);
                  v266 = v265;
                }
                while (v265);
              }

              v273 = DMFConfigurationEngineLog(v272);
              v274 = objc_claimAutoreleasedReturnValue(v273);
              if (os_log_type_enabled(v274, OS_LOG_TYPE_DEBUG))
                sub_100076780();

              v12 = v289;
              v216 = objb;
              v141 = v314;
            }
            v275 = v308;
            v99 = v285;
            v101 = v286;
          }
          else
          {
            v281 = DMFConfigurationEngineLog(0);
            v282 = objc_claimAutoreleasedReturnValue(v281);
            v12 = v289;
            v141 = v314;
            v101 = v286;
            if (os_log_type_enabled(v282, OS_LOG_TYPE_ERROR))
              sub_1000769C4((uint64_t)v299);

            v275 = 0;
            v99 = v285;
          }
          v205 = v316;

        }
        else
        {
          v280 = DMFConfigurationEngineLog(0);
          v216 = objc_claimAutoreleasedReturnValue(v280);
          v99 = v285;
          v101 = v286;
          if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
            sub_10007694C(v136);
          v275 = 0;
          v12 = v289;
        }

      }
      else
      {
        v279 = DMFConfigurationEngineLog(v139);
        v203 = objc_claimAutoreleasedReturnValue(v279);
        v141 = v314;
        if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR))
          sub_10007694C((uint64_t)v299);
        v275 = 0;
        v12 = v289;
        v99 = v285;
        v101 = v286;
      }

      v277 = v298;
    }
    else
    {
      v278 = DMFConfigurationEngineLog(v102);
      v288 = objc_claimAutoreleasedReturnValue(v278);
      if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR))
        sub_1000768D4((uint64_t)a7);
      v275 = 0;
      v277 = v298;
      v141 = v314;
    }

LABEL_206:
  }
  else
  {
    v275 = 0;
    v277 = v298;
  }

  return v275;
}

- (DMDEngineDatabaseProcessingOperationDelegate)delegate
{
  return (DMDEngineDatabaseProcessingOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (void)setDeviceStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceStateProvider, a3);
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_taskOperationProvider, a3);
}

- (DMDActivationPredicateObserverManager)activationPredicateObserverManager
{
  return self->_activationPredicateObserverManager;
}

- (void)setActivationPredicateObserverManager:(id)a3
{
  objc_storeStrong((id *)&self->_activationPredicateObserverManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationPredicateObserverManager, 0);
  objc_storeStrong((id *)&self->_taskOperationProvider, 0);
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
