@implementation RTPersistenceContext

- (BOOL)save:(id *)a3
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  id v14;
  id v15;
  id WeakRetained;
  id v17;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  objc_super v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[RTPersistenceContext _shouldExecute:](self, "_shouldExecute:"))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v8, v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "UTF8String");
    v11 = (void *)os_transaction_create();

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

    }
    v24.receiver = self;
    v24.super_class = (Class)RTPersistenceContext;
    v25 = 0;
    v13 = -[RTPersistenceContext save:](&v24, sel_save_, &v25);
    v14 = v25;
    v15 = v14;
    if (v13 && !v14)
    {
      if (-[RTPersistenceContext mirroringQualityOfService](self, "mirroringQualityOfService"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v23 = 0;
        LOBYTE(v13) = objc_msgSend(WeakRetained, "persistenceContextPerformedSave:error:", self, &v23);
        v15 = v23;

      }
      else
      {
        v15 = 0;
        LOBYTE(v13) = 1;
      }
    }
    v22 = v15;
    -[RTPersistenceContext _processError:](self, "_processError:", &v22);
    v17 = v22;

    if (a3)
      *a3 = objc_retainAutorelease(v17);
    -[RTPersistenceContext setMirroringQualityOfService:](self, "setMirroringQualityOfService:", 0);

  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (void)setMirroringQualityOfService:(int64_t)a3
{
  self->_mirroringQualityOfService = a3;
}

- (int64_t)mirroringQualityOfService
{
  return self->_mirroringQualityOfService;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v20;
  objc_super v21;
  id v22;
  id v23;

  v6 = a3;
  if (-[RTPersistenceContext _shouldExecute:](self, "_shouldExecute:", a4))
  {
    -[RTPersistenceContext substitutionVariableKeys](self, "substitutionVariableKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistenceContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[RTPersistenceContext shouldSubstituteVariables:inPredicate:entityName:model:](self, "shouldSubstituteVariables:inPredicate:entityName:model:", v7, v10, v11, v9);

    if (v12)
    {
      objc_msgSend(v6, "predicate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceContext predicateWithDefaultSubstitutionVariables:](self, "predicateWithDefaultSubstitutionVariables:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPredicate:", v14);

    }
    v23 = v6;
    -[RTPersistenceContext _updateRequest:includingContextOptions:](self, "_updateRequest:includingContextOptions:", &v23, -[RTPersistenceContext options](self, "options"));
    v15 = v23;

    v21.receiver = self;
    v21.super_class = (Class)RTPersistenceContext;
    v22 = 0;
    -[RTPersistenceContext executeFetchRequest:error:](&v21, sel_executeFetchRequest_error_, v15, &v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22;
    v20 = v17;
    -[RTPersistenceContext _processError:](self, "_processError:", &v20);
    v18 = v20;

    if (a4)
      *a4 = objc_retainAutorelease(v18);

    v6 = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_shouldExecute:(id *)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "persistenceContextShouldExecute:", self) & 1) != 0
    || (self->_options & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Request execution is unavailable.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
      *a3 = objc_retainAutorelease(v7);

    v9 = 0;
  }

  return v9;
}

- (BOOL)_processError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  BOOL v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a3 || !*a3)
    return 0;
  v5 = *a3;
  -[RTPersistenceContext delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceContext:encounteredError:", self, v5);

  objc_msgSend(v5, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "description");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  if (v11)
    v12 = v11;
  else
    v12 = CFSTR("no description");
  v21 = *MEMORY[0x1E0CB2D50];
  v22[0] = v12;
  v10 = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, objc_msgSend(v5, "code"), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *MEMORY[0x1E0CB3388];
  v20 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v17);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)substitutionVariableKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((-[RTPersistenceContext options](self, "options") & 1) != 0)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v9 = CFSTR("RT_CURRENT_DEVICE");
  -[NSManagedObjectContext currentDevice](self, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)shouldSubstituteVariables:(id)a3 inPredicate:(id)a4 entityName:(id)a5 model:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RTPredicateInspector *predicateInspector;
  RTPredicateInspector *v15;
  RTPredicateInspector *v16;
  BOOL v17;
  BOOL v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  predicateInspector = self->_predicateInspector;
  if (!predicateInspector)
  {
    v15 = (RTPredicateInspector *)objc_opt_new();
    v16 = self->_predicateInspector;
    self->_predicateInspector = v15;

    predicateInspector = self->_predicateInspector;
  }
  v17 = -[RTPredicateInspector predicate:referencesSubstitutionVariablesFromSet:](predicateInspector, "predicate:referencesSubstitutionVariablesFromSet:", v11, v10);
  v18 = v17 & -[RTPersistenceContext validateEntityName:inModel:](self, "validateEntityName:inModel:", v12, v13);

  return v18;
}

- (BOOL)validateEntityName:(id)a3 inModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("RT")))
  {
    objc_msgSend(v6, "entitiesByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateRequest:(id *)a3 includingContextOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v6 = *a3;
        goto LABEL_8;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*a3, "fetchRequest");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (id)objc_msgSend(v7, "copy");

LABEL_8:
        +[RTCloudManagedObject entityNamesEligibleForDeletionByOtherDevices](RTCloudManagedObject, "entityNamesEligibleForDeletionByOtherDevices");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "entityName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "containsObject:", v9);

        if (v10)
        {
          objc_msgSend(v6, "predicate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "predicateFormat");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTCloudManagedObject notTombstonedPredicate](RTCloudManagedObject, "notTombstonedPredicate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "predicateFormat");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "containsString:", v14);

          if ((v15 & 1) != 0)
          {
LABEL_16:

            return;
          }
          if (!-[RTPersistenceContext allowTombstones](self, "allowTombstones"))
          {
            objc_msgSend(v6, "predicate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v17 = (void *)MEMORY[0x1E0CB3528];
              objc_msgSend(v6, "predicate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[RTCloudManagedObject notTombstonedPredicate](RTCloudManagedObject, "notTombstonedPredicate", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v28[1] = v19;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "andPredicateWithSubpredicates:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setPredicate:", v21);

            }
            else
            {
              +[RTCloudManagedObject notTombstonedPredicate](RTCloudManagedObject, "notTombstonedPredicate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setPredicate:", v22);

            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v6);
          objc_msgSend(v23, "setResultType:", objc_msgSend(*a3, "resultType"));
          v24 = objc_retainAutorelease(v23);
          *a3 = v24;

        }
        goto LABEL_16;
      }
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v27;
        _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "unhandled request class, %@", buf, 0xCu);

      }
      __break(1u);
    }
  }
}

- (BOOL)allowTombstones
{
  return (-[RTPersistenceContext options](self, "options") >> 1) & 1;
}

- (RTPersistenceContext)initWithConcurrencyType:(unint64_t)a3
{
  return -[RTPersistenceContext initWithConcurrencyType:options:](self, "initWithConcurrencyType:options:", a3, 0);
}

- (RTPersistenceContext)initWithConcurrencyType:(unint64_t)a3 options:(unint64_t)a4
{
  RTPersistenceContext *v5;
  RTPersistenceContext *v6;
  objc_super v8;

  if (a4 > 3)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RTPersistenceContext;
    v5 = -[RTPersistenceContext initWithConcurrencyType:](&v8, sel_initWithConcurrencyType_, a3);
    if (v5)
      v5->_options = a4;
    self = v5;
    v6 = self;
  }

  return v6;
}

- (id)predicateWithDefaultSubstitutionVariables:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("RT_CURRENT_DEVICE");
  v4 = a3;
  -[NSManagedObjectContext currentDevice](self, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithSubstitutionVariables:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)executeRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v29;
  id v30;
  objc_super v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && !-[RTPersistenceContext _shouldExecute:](self, "_shouldExecute:", a4))
  {
    v17 = 0;
    goto LABEL_20;
  }
  -[RTPersistenceContext substitutionVariableKeys](self, "substitutionVariableKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "requestType") == 1)
  {
    objc_msgSend(v6, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RTPersistenceContext shouldSubstituteVariables:inPredicate:entityName:model:](self, "shouldSubstituteVariables:inPredicate:entityName:model:", v7, v10, v11, v9))
    {
      objc_msgSend(v6, "predicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceContext predicateWithDefaultSubstitutionVariables:](self, "predicateWithDefaultSubstitutionVariables:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPredicate:", v13);

    }
    v35 = v6;
    v14 = &v35;
LABEL_16:
    -[RTPersistenceContext _updateRequest:includingContextOptions:](self, "_updateRequest:includingContextOptions:", v14, -[RTPersistenceContext options](self, "options", v29));
    v25 = *v14;

    v6 = v25;
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "requestType") == 6)
  {
    objc_msgSend(v6, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[RTPersistenceContext shouldSubstituteVariables:inPredicate:entityName:model:](self, "shouldSubstituteVariables:inPredicate:entityName:model:", v7, v10, v11, v9))
    {
      objc_msgSend(v6, "predicate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceContext predicateWithDefaultSubstitutionVariables:](self, "predicateWithDefaultSubstitutionVariables:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPredicate:", v16);

    }
    v34 = v6;
    v14 = &v34;
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "requestType") == 7)
  {
    objc_msgSend(v6, "fetchRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fetchRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[RTPersistenceContext shouldSubstituteVariables:inPredicate:entityName:model:](self, "shouldSubstituteVariables:inPredicate:entityName:model:", v7, v10, v11, v9))
    {
      objc_msgSend(v6, "fetchRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v20, "copy");

      objc_msgSend(v6, "fetchRequest");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "predicate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceContext predicateWithDefaultSubstitutionVariables:](self, "predicateWithDefaultSubstitutionVariables:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setPredicate:", v23);

      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v29);
      objc_msgSend(v24, "setResultType:", objc_msgSend(v6, "resultType"));

      v6 = v24;
    }
    v33 = v6;
    v14 = &v33;
    goto LABEL_16;
  }
LABEL_17:
  v31.receiver = self;
  v31.super_class = (Class)RTPersistenceContext;
  v32 = 0;
  -[RTPersistenceContext executeRequest:error:](&v31, sel_executeRequest_error_, v6, &v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v32;
  v30 = v26;
  -[RTPersistenceContext _processError:](self, "_processError:", &v30);
  v27 = v30;

  if (a4)
    *a4 = objc_retainAutorelease(v27);

LABEL_20:
  return v17;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v20;
  objc_super v21;
  id v22;
  id v23;

  v6 = a3;
  if (-[RTPersistenceContext _shouldExecute:](self, "_shouldExecute:", a4))
  {
    -[RTPersistenceContext substitutionVariableKeys](self, "substitutionVariableKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistenceContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[RTPersistenceContext shouldSubstituteVariables:inPredicate:entityName:model:](self, "shouldSubstituteVariables:inPredicate:entityName:model:", v7, v10, v11, v9);

    if (v12)
    {
      objc_msgSend(v6, "predicate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPersistenceContext predicateWithDefaultSubstitutionVariables:](self, "predicateWithDefaultSubstitutionVariables:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPredicate:", v14);

    }
    v23 = v6;
    -[RTPersistenceContext _updateRequest:includingContextOptions:](self, "_updateRequest:includingContextOptions:", &v23, -[RTPersistenceContext options](self, "options"));
    v15 = v23;

    v21.receiver = self;
    v21.super_class = (Class)RTPersistenceContext;
    v22 = 0;
    v16 = -[RTPersistenceContext countForFetchRequest:error:](&v21, sel_countForFetchRequest_error_, v15, &v22);
    v17 = v22;
    v20 = v17;
    -[RTPersistenceContext _processError:](self, "_processError:", &v20);
    v18 = v20;

    if (a4)
      *a4 = objc_retainAutorelease(v18);

    v6 = v15;
  }
  else
  {
    v16 = 0;
  }

  return (unint64_t)v16;
}

- (RTPersistenceContextDelegate)delegate
{
  return (RTPersistenceContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTPredicateInspector)predicateInspector
{
  return self->_predicateInspector;
}

- (void)setPredicateInspector:(id)a3
{
  objc_storeStrong((id *)&self->_predicateInspector, a3);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateInspector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
