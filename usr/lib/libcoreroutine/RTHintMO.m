@implementation RTHintMO

+ (id)managedObjectWithHint:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  __int16 v24;
  __int16 v25;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v19 = 0;
      goto LABEL_8;
    }
    v25 = 0;
    v21 = "Invalid parameter not satisfying: hint";
    v22 = (uint8_t *)&v25;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, v22, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v24 = 0;
    v21 = "Invalid parameter not satisfying: managedObjectContext";
    v22 = (uint8_t *)&v24;
    goto LABEL_10;
  }
  objc_msgSend(v5, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latitude");
  v10 = v9;
  objc_msgSend(v5, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "longitude");
  v13 = v12;
  objc_msgSend(v5, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "horizontalUncertainty");
  v16 = v15;
  v17 = objc_msgSend(v5, "source");
  objc_msgSend(v5, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTHintMO managedObjectWithLatitude:longitude:horizontalUncertainty:source:date:inManagedObjectContext:](RTHintMO, "managedObjectWithLatitude:longitude:horizontalUncertainty:source:date:inManagedObjectContext:", v17, v18, v7, v10, v13, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v19;
}

+ (id)managedObjectWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 source:(int64_t)a6 date:(id)a7 inManagedObjectContext:(id)a8
{
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  double v22;
  double v23;
  double v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v13 = a7;
  v14 = a8;
  v15 = v14;
  if (v14)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__87;
    v30 = __Block_byref_object_dispose__87;
    v31 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __105__RTHintMO_managedObjectWithLatitude_longitude_horizontalUncertainty_source_date_inManagedObjectContext___block_invoke;
    v18[3] = &unk_1E92A0250;
    v21 = &v26;
    v19 = v14;
    v22 = a3;
    v23 = a4;
    v24 = a5;
    v25 = a6;
    v20 = v13;
    objc_msgSend(v19, "performBlockAndWait:", v18);
    v16 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __105__RTHintMO_managedObjectWithLatitude_longitude_horizontalUncertainty_source_date_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTHintMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[RTHintMO initWithContext:]([RTHintMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setLatitude:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setLongitude:", *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setHorizontalUncertainty:", *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSource:", *(_QWORD *)(a1 + 80));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDate:", *(_QWORD *)(a1 + 40));
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTHintMO"));
}

@end
