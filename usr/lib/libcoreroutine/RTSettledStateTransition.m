@implementation RTSettledStateTransition

+ (id)createWithManagedObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2080;
      v10 = "+[RTSettledStateTransition(RTCoreDataTransformable) createWithManagedObject:]";
      v11 = 1024;
      v12 = 31;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTSettledStateTransition+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "createWithSettledStateTransitionMO:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

+ (id)createWithSettledStateTransitionMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__39;
    v16 = __Block_byref_object_dispose__39;
    v17 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__RTSettledStateTransition_RTCoreDataTransformable__createWithSettledStateTransitionMO___block_invoke;
    v9[3] = &unk_1E929A690;
    v11 = buf;
    v10 = v4;
    objc_msgSend(v5, "performBlockAndWait:", v9);

    v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: settledStateTransitionMO", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

void __88__RTSettledStateTransition_RTCoreDataTransformable__createWithSettledStateTransitionMO___block_invoke(uint64_t a1)
{
  RTSettledStateTransition *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = [RTSettledStateTransition alloc];
  objc_msgSend(*(id *)(a1 + 32), "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transitionFromType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 32), "transitionToType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTSettledStateTransition initWithDate:transitionFromType:transitionToType:](v2, "initWithDate:transitionFromType:transitionToType:", v9, v4, objc_msgSend(v5, "unsignedIntegerValue"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTSettledStateTransitionMO managedObjectWithSettledStateTransition:inManagedObjectContext:](RTSettledStateTransitionMO, "managedObjectWithSettledStateTransition:inManagedObjectContext:", self, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

- (RTSettledStateTransition)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDate_transitionFromType_transitionToType_);
}

- (RTSettledStateTransition)initWithDate:(id)a3 transitionFromType:(int64_t)a4 transitionToType:(int64_t)a5
{
  id v8;
  NSObject *v9;
  const char *v10;
  RTSettledStateTransition *v11;
  RTSettledStateTransition *v13;
  uint64_t v14;
  NSDate *date;
  objc_super v16;
  uint8_t buf[16];

  v8 = a3;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: date";
      goto LABEL_13;
    }
LABEL_14:

    v11 = 0;
    goto LABEL_15;
  }
  if ((unint64_t)a4 >= 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: RTSettledStateIsValid(transitionFromType)";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((unint64_t)a5 >= 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: RTSettledStateIsValid(transitionToType)";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (a4 == a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid parameter not satisfying: transitionFromType != transitionToType";
LABEL_13:
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTSettledStateTransition;
  v13 = -[RTSettledStateTransition init](&v16, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v8, "copy");
    date = v13->_date;
    v13->_date = (NSDate *)v14;

    v13->_transitionFromType = a4;
    v13->_transitionToType = a5;
  }
  self = v13;
  v11 = self;
LABEL_15:

  return v11;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)transitionFromType
{
  return self->_transitionFromType;
}

- (int64_t)transitionToType
{
  return self->_transitionToType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
