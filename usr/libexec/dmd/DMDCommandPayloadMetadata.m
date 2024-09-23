@implementation DMDCommandPayloadMetadata

+ (id)commandsWithPayloadDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  NSMutableDictionary *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];

  v9 = a3;
  v31 = a4;
  v30 = a5;
  v10 = objc_opt_new(NSMutableDictionary);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    v15 = DMFCommandPayloadStatusKey;
    v16 = DMFCommandStatusQueued;
    obj = v11;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(obj);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPayloadMetadata metadataWithPayloadDictionary:organizationIdentifier:context:error:](DMDCommandPayloadMetadata, "metadataWithPayloadDictionary:organizationIdentifier:context:error:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v17), v31, v30, a6));
        v19 = v18;
        if (!v18)
          goto LABEL_13;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v20));

        if (v21)
        {
          if (a6)
          {
            v38 = DMFConfigurationPayloadIdentifierErrorKey;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
            v39 = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
            v27 = DMFErrorWithCodeAndUserInfo(4001, v26);
            *a6 = (id)objc_claimAutoreleasedReturnValue(v27);

          }
LABEL_13:

          v11 = obj;
          v24 = 0;
          goto LABEL_14;
        }
        v36 = v15;
        v37 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        objc_msgSend(v19, "setStateDictionary:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, v23);

        v17 = (char *)v17 + 1;
      }
      while (v13 != v17);
      v11 = obj;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v13)
        continue;
      break;
    }
  }

  v24 = v10;
LABEL_14:

  return v24;
}

+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableArray);
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("organization.identifier"), v6));
    -[NSMutableArray addObject:](v8, "addObject:", v9);

  }
  if (v7)
    -[NSMutableArray addObject:](v8, "addObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));
  objc_msgSend(v10, "setPredicate:", v11);

  return v10;
}

+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3
{
  return objc_msgSend(a1, "fetchRequestForCommandsFromOrganizationWithIdentifier:matchingPredicate:", a3, 0);
}

+ (id)fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("available"), &__kCFBooleanTrue));
  v11[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("installed"), &__kCFBooleanFalse));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForCommandsFromOrganizationWithIdentifier:matchingPredicate:", v4, v8));

  return v9;
}

+ (id)fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("available"), &__kCFBooleanFalse));
  v11[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("installed"), &__kCFBooleanFalse));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForCommandsFromOrganizationWithIdentifier:matchingPredicate:", v4, v8));

  return v9;
}

+ (id)fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("installed"), &__kCFBooleanTrue));
  v11[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("pendingStatusUpdate"), &__kCFBooleanFalse));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForCommandsFromOrganizationWithIdentifier:matchingPredicate:", v4, v8));

  return v9;
}

@end
