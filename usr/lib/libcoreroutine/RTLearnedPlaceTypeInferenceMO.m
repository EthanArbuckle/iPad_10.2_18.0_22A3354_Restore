@implementation RTLearnedPlaceTypeInferenceMO

+ (id)initWithLearnedPlaceTypeInference:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  uint8_t buf[2];
  __int16 v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v14 = 0;
      goto LABEL_8;
    }
    v20 = 0;
    v16 = "Invalid parameter not satisfying: learnedPlaceTypeInference";
    v17 = (uint8_t *)&v20;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    v17 = buf;
    goto LABEL_10;
  }
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "learnedPlaceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "placeType");
  v12 = objc_msgSend(v5, "metricSource");
  objc_msgSend(v5, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLearnedPlaceTypeInferenceMO managedObjectWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:managedObjectContext:](RTLearnedPlaceTypeInferenceMO, "managedObjectWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:managedObjectContext:", v8, v9, v10, v11, v12, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v14;
}

+ (id)managedObjectWithIdentifier:(id)a3 sessionId:(id)a4 learnedPlaceIdentifier:(id)a5 placeType:(unint64_t)a6 metricSource:(unint64_t)a7 creationDate:(id)a8 managedObjectContext:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v19 = v18;
  if (v18)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__15;
    v35 = __Block_byref_object_dispose__15;
    v36 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __151__RTLearnedPlaceTypeInferenceMO_managedObjectWithIdentifier_sessionId_learnedPlaceIdentifier_placeType_metricSource_creationDate_managedObjectContext___block_invoke;
    v22[3] = &unk_1E92988E0;
    v28 = &v31;
    v23 = v18;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    v29 = a6;
    v30 = a7;
    v27 = v17;
    objc_msgSend(v23, "performBlockAndWait:", v22);
    v20 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __151__RTLearnedPlaceTypeInferenceMO_managedObjectWithIdentifier_sessionId_learnedPlaceIdentifier_placeType_metricSource_creationDate_managedObjectContext___block_invoke(uint64_t a1)
{
  RTLearnedPlaceTypeInferenceMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[RTLearnedPlaceTypeInferenceMO initWithContext:]([RTLearnedPlaceTypeInferenceMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSessionId:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLearnedPlaceIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPlaceType:", *(__int16 *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setMetricSource:", *(__int16 *)(a1 + 88));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCreationDate:", *(_QWORD *)(a1 + 64));
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTLearnedPlaceTypeInferenceMO"));
}

@end
