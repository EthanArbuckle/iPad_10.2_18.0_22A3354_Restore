@implementation RTPeopleDensityMO

+ (id)managedObjectWithPeopleDensity:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  __int16 v21;
  __int16 v22;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v16 = 0;
      goto LABEL_8;
    }
    v22 = 0;
    v18 = "Invalid parameter not satisfying: peopleDensity";
    v19 = (uint8_t *)&v22;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v18, v19, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v21 = 0;
    v18 = "Invalid parameter not satisfying: managedObjectContext";
    v19 = (uint8_t *)&v21;
    goto LABEL_10;
  }
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "densityScore");
  v12 = v11;
  objc_msgSend(v5, "scanDuration");
  v14 = v13;
  objc_msgSend(v5, "rssiHistogram");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPeopleDensityMO managedObjectWithIdentifier:startDate:endDate:densityScore:scanDuration:rssiHistogram:inManagedObjectContext:](RTPeopleDensityMO, "managedObjectWithIdentifier:startDate:endDate:densityScore:scanDuration:rssiHistogram:inManagedObjectContext:", v8, v9, v10, v15, v7, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v16;
}

+ (id)managedObjectWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 densityScore:(double)a6 scanDuration:(double)a7 rssiHistogram:(id)a8 inManagedObjectContext:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = v19;
  if (v19)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__25;
    v36 = __Block_byref_object_dispose__25;
    v37 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __130__RTPeopleDensityMO_managedObjectWithIdentifier_startDate_endDate_densityScore_scanDuration_rssiHistogram_inManagedObjectContext___block_invoke;
    v23[3] = &unk_1E92988E0;
    v29 = &v32;
    v24 = v19;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v30 = a6;
    v31 = a7;
    v28 = v18;
    objc_msgSend(v24, "performBlockAndWait:", v23);
    v21 = (id)v33[5];

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __130__RTPeopleDensityMO_managedObjectWithIdentifier_startDate_endDate_densityScore_scanDuration_rssiHistogram_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTPeopleDensityMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[RTPeopleDensityMO initWithContext:]([RTPeopleDensityMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setStartDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setEndDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDensityScore:", *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setScanDuration:", *(double *)(a1 + 88));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setRssiHistogram:", *(_QWORD *)(a1 + 64));
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTPeopleDensityMO"));
}

@end
