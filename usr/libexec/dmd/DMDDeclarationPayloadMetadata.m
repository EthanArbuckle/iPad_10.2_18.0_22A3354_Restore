@implementation DMDDeclarationPayloadMetadata

- (NSString)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeclarationPayloadMetadata identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeclarationPayloadMetadata serverHash](self, "serverHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v3, v4));

  return (NSString *)v5;
}

- (void)applyPayloadDictionary:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", DMFDeclarationPayloadServerHashKey));
  -[DMDDeclarationPayloadMetadata setServerHash:](self, "setServerHash:", v4);

}

- (id)descriptiveProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v7.receiver = self;
  v7.super_class = (Class)DMDDeclarationPayloadMetadata;
  v2 = -[DMDPayloadMetadata descriptiveProperties](&v7, "descriptiveProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v8[0] = CFSTR("serverHash");
  v8[1] = CFSTR("failed");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));

  return v5;
}

- (void)setStateDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = objc_msgSend(a3, "mutableCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeclarationPayloadMetadata serverHash](self, "serverHash"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, DMFDeclarationStateServerHashKey);

  v6.receiver = self;
  v6.super_class = (Class)DMDDeclarationPayloadMetadata;
  -[DMDPayloadMetadata setStateDictionary:](&v6, "setStateDictionary:", v4);

}

+ (id)declarationsWithDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSMutableDictionary *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  _BYTE v35[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_new(NSMutableDictionary);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    obj = v13;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(obj);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMDPayloadMetadata metadataWithPayloadDictionary:organizationIdentifier:context:error:](DMDDeclarationPayloadMetadata, "metadataWithPayloadDictionary:organizationIdentifier:context:error:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v17), v10, v11, a6));
        v19 = v18;
        if (!v18)
          goto LABEL_13;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v20));

        if (v21)
        {
          if (a6)
          {
            v33 = DMFConfigurationPayloadIdentifierErrorKey;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
            v34 = v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
            v26 = DMFErrorWithCodeAndUserInfo(4001, v25);
            *a6 = (id)objc_claimAutoreleasedReturnValue(v26);

          }
LABEL_13:

          v13 = obj;
          v23 = 0;
          goto LABEL_14;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v19, v22);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v13 = obj;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v15)
        continue;
      break;
    }
  }

  v23 = v12;
LABEL_14:

  return v23;
}

+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
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

+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3
{
  return objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:", a3, 0);
}

+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3 withIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier IN %@"), a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:", v6, v7));

  return v8;
}

+ (id)fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("available"), &__kCFBooleanTrue));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:", v4, v7));

  return v8;
}

+ (id)fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:(id)a3 withIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier IN %@"), a4));
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("available"), &__kCFBooleanTrue));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:", v6, v10));

  return v11;
}

+ (id)fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4 serverHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("available"), &__kCFBooleanTrue));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), v9, v11));

  v18[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("serverHash"), v8));

  v18[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:", v10, v15));

  return v16;
}

+ (id)fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:(id)a3
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("failed"), &__kCFBooleanTrue));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:", v4, v8));

  return v9;
}

+ (id)fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("available"), &__kCFBooleanFalse));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("installed"), &__kCFBooleanFalse, v5));
  v12[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("pendingStatusUpdate"), &__kCFBooleanFalse));
  v12[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForDeclarationsFromOrganizationWithIdentifier:matchingPredicate:", v4, v9));

  return v10;
}

@end
