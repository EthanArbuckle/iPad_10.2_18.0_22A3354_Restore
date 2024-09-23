@implementation DMDPayloadMetadata

+ (id)fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
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

+ (id)fetchRequestForActivePayloadMetadatasFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:", v6, v7));

  return v8;
}

+ (id)fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("pendingStatusUpdate"), &__kCFBooleanTrue));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:", v4, v5));

  return v6;
}

+ (id)metadataWithPayloadDictionary:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __objc2_class *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  DMDPayload *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = DMFDeclarationPayloadTypeKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", DMFDeclarationPayloadTypeKey));
  if (objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.command")))
  {
    v15 = DMDCommandPayloadMetadata;
  }
  else if (objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.activation")))
  {
    v15 = DMDActivationPayloadMetadata;
  }
  else if (objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.asset")))
  {
    v15 = DMDAssetPayloadMetadata;
  }
  else
  {
    v16 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.configuration"));
    if ((_DWORD)v16)
    {
      v15 = DMDConfigurationPayloadMetadata;
    }
    else
    {
      v17 = DMFConfigurationEngineLog(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100078718((uint64_t)v14, v18);

      v15 = DMDPayloadMetadata;
    }
  }
  v19 = (objc_class *)objc_opt_class(v15);
  if ((-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", a1) & 1) != 0)
  {
    v20 = [v19 alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class entity](v19, "entity"));
    v22 = objc_msgSend(v20, "initWithEntity:insertIntoManagedObjectContext:", v21, v12);

    if (!a1)
    {
LABEL_18:
      v22 = v22;
      a6 = (id *)v22;
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v22, "setType:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", DMFDeclarationPayloadIdentifierKey));
    objc_msgSend(v22, "setIdentifier:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", DMFDeclarationPayloadRequiresNetworkTetherKey));
    objc_msgSend(v22, "setRequiresNetworkTether:", objc_msgSend(v24, "BOOLValue"));

    v25 = -[DMDPayload initWithContext:]([DMDPayload alloc], "initWithContext:", v12);
    objc_msgSend(v22, "setPayload:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "payload"));
    objc_msgSend(v26, "setPayloadDictionary:", v10);

    objc_msgSend(v22, "setAvailable:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:](DMDConfigurationOrganization, "fetchRequestMatchingConfigurationOrganizationWithIdentifier:", v11));
    v42 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeFetchRequest:error:", v27, &v42));
    v29 = v42;

    if (v28)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
      if (v31)
      {
        objc_msgSend(v22, "setOrganization:", v31);
        objc_msgSend(v22, "setRequiresUnlockedKeychain:", objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.configuration.policy")) ^ 1);
        v43 = DMFDeclarationStateStatusKey;
        v44 = DMFDeclarationStatusQueued;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
        objc_msgSend(v22, "setStateDictionary:", v32);

        objc_msgSend(v22, "applyPayloadDictionary:", v10);
        if ((objc_msgSend(v22, "validateProperties:", a6) & 1) != 0)
        {

          goto LABEL_18;
        }
        objc_msgSend(v12, "deleteObject:", v22);
      }
      else if (a6)
      {
        v45 = DMFConfigurationOrganizationIdentifierErrorKey;
        v46 = v11;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
        v40 = DMFErrorWithCodeAndUserInfo(4002, v39);
        *a6 = (id)objc_claimAutoreleasedReturnValue(v40);

      }
LABEL_32:

      a6 = 0;
      goto LABEL_33;
    }
    v37 = DMFConfigurationEngineLog(v30);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_100078668((uint64_t)v11, v29, v38);

    if (!a6)
      goto LABEL_32;
    v36 = objc_retainAutorelease(v29);
LABEL_23:
    *a6 = v36;
    goto LABEL_32;
  }
  if (a6)
  {
    v47[0] = DMFConfigurationPayloadIdentifierErrorKey;
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", DMFDeclarationPayloadIdentifierKey));
    v22 = (id)v33;
    v34 = &stru_1000BC2E0;
    if (v33)
      v34 = (const __CFString *)v33;
    v47[1] = DMFInvalidParameterErrorKey;
    v48[0] = v34;
    v48[1] = v13;
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2));
    v35 = DMFErrorWithCodeAndUserInfo(4000, v29);
    v36 = (id)objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_23;
  }
LABEL_34:

  return a6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata descriptiveProperties](self, "descriptiveProperties"));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)descriptiveProperties
{
  _QWORD v3[9];

  v3[0] = CFSTR("type");
  v3[1] = CFSTR("identifier");
  v3[2] = CFSTR("available");
  v3[3] = CFSTR("installed");
  v3[4] = CFSTR("organization.identifier");
  v3[5] = CFSTR("requiresNetworkTether");
  v3[6] = CFSTR("requiresUnlockedKeychain");
  v3[7] = CFSTR("lastStatusReportTimestamp");
  v3[8] = CFSTR("stateChangeTimestamp");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 9));
}

- (NSString)status
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", DMFDeclarationStateStatusKey));

  return (NSString *)v3;
}

+ (id)keyPathsForValuesAffectingStatus
{
  void *v2;
  void *v3;
  const __CFString *v5;

  v5 = CFSTR("stateDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

- (void)setNeedsRefreshStatus
{
  -[DMDPayloadMetadata setPendingStatusUpdate:](self, "setPendingStatusUpdate:", 1);
}

+ (BOOL)automaticallyNotifiesObserversOfStateDictionary
{
  return 0;
}

- (void)setStateDictionary:(id)a3
{
  void *v4;
  id v5;
  NSDate *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("stateDictionary")));
  v5 = objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, DMFDeclarationStateTimestampKey);
  }
  else if (!v9)
  {
    goto LABEL_6;
  }
  if ((objc_msgSend(v5, "isEqual:", v9) & 1) == 0)
  {
    -[DMDPayloadMetadata willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("stateDictionary"));
    v6 = objc_opt_new(NSDate);
    -[DMDPayloadMetadata setStateChangeTimestamp:](self, "setStateChangeTimestamp:", v6);

    -[DMDPayloadMetadata setPendingStatusUpdate:](self, "setPendingStatusUpdate:", 1);
    v7 = objc_msgSend(v9, "mutableCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata stateChangeTimestamp](self, "stateChangeTimestamp"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, DMFDeclarationStateTimestampKey);

    -[DMDPayloadMetadata setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("stateDictionary"));
    -[DMDPayloadMetadata didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("stateDictionary"));

  }
LABEL_6:

}

+ (BOOL)automaticallyNotifiesObserversOfLastStatusReportTimestamp
{
  return 0;
}

- (void)setLastStatusReportTimestamp:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;

  v8 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("lastStatusReportTimestamp")));
  if (v8 | v4 && (objc_msgSend((id)v4, "isEqual:", v8) & 1) == 0)
  {
    -[DMDPayloadMetadata willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lastStatusReportTimestamp"));
    -[DMDPayloadMetadata setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, CFSTR("lastStatusReportTimestamp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata stateChangeTimestamp](self, "stateChangeTimestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata lastStatusReportTimestamp](self, "lastStatusReportTimestamp"));
    v7 = objc_msgSend(v5, "compare:", v6);

    if (v7 != (id)1)
      -[DMDPayloadMetadata setPendingStatusUpdate:](self, "setPendingStatusUpdate:", 0);
    -[DMDPayloadMetadata didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lastStatusReportTimestamp"));
  }

}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata changedValues](self, "changedValues"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  if (objc_msgSend(v7, "containsObject:", CFSTR("stateDictionary")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata organization](self, "organization"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("DMDConfigurationSourceStatusDidChange"), v6);

  }
}

- (BOOL)validateProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata identifier](self, "identifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata type](self, "type"));

    if (v6)
      return 1;
    if (a3)
    {
      v12[0] = DMFConfigurationPayloadIdentifierErrorKey;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata identifier](self, "identifier"));
      v12[1] = DMFInvalidParameterErrorKey;
      v13[0] = v8;
      v13[1] = DMFDeclarationPayloadTypeKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
      v11 = DMFErrorWithCodeAndUserInfo(4000, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v11);

      goto LABEL_8;
    }
  }
  else if (a3)
  {
    v14 = DMFInvalidParameterErrorKey;
    v15 = DMFDeclarationPayloadIdentifierKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v9 = DMFErrorWithCodeAndUserInfo(4000, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v9);
LABEL_8:

  }
  return 0;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v5 = -[DMDPayloadMetadata validateProperties:](self, "validateProperties:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDPayloadMetadata;
    LOBYTE(v5) = -[DMDPayloadMetadata validateForInsert:](&v7, "validateForInsert:", a3);
  }
  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v5 = -[DMDPayloadMetadata validateProperties:](self, "validateProperties:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDPayloadMetadata;
    LOBYTE(v5) = -[DMDPayloadMetadata validateForUpdate:](&v7, "validateForUpdate:", a3);
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMDPayloadMetadata;
  return -[DMDPayloadMetadata validateForDelete:](&v4, "validateForDelete:", a3);
}

- (DMDPayloadMetadata)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMDPayloadMetadata;
  return -[DMDPayloadMetadata initWithEntity:insertIntoManagedObjectContext:](&v5, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

- (DMDPayloadMetadata)initWithContext:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  id v10;
  void *v11;
  DMDPayloadMetadata *v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v7 = objc_opt_class(self);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDPayloadMetadata.m"), 317, CFSTR("%@ cannot call %@"), v7, v9);

  v10 = objc_msgSend((id)objc_opt_class(self), "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[DMDPayloadMetadata initWithEntity:insertIntoManagedObjectContext:](self, "initWithEntity:insertIntoManagedObjectContext:", v11, v5);

  return v12;
}

- (DMDPayloadMetadata)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  DMDPayloadMetadata *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v5 = objc_opt_class(self);
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDPayloadMetadata.m"), 322, CFSTR("%@ cannot call %@"), v5, v7);

  v8 = objc_msgSend((id)objc_opt_class(self), "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = -[DMDPayloadMetadata initWithEntity:insertIntoManagedObjectContext:](self, "initWithEntity:insertIntoManagedObjectContext:", v9, 0);

  return v10;
}

@end
