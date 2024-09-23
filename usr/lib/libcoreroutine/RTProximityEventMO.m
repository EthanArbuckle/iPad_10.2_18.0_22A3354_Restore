@implementation RTProximityEventMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTProximityEventMO"));
}

+ (id)managedObjectWithProximityEvent:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  uint8_t buf[2];
  __int16 v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v17 = 0;
      goto LABEL_8;
    }
    v23 = 0;
    v19 = "Invalid parameter not satisfying: proximityEvent";
    v20 = (uint8_t *)&v23;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: managedObjectContext";
    v20 = buf;
    goto LABEL_10;
  }
  objc_msgSend(v5, "eventID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "relationship");
  objc_msgSend(v5, "socialScore");
  v13 = v12;
  objc_msgSend(v5, "combinedFrequencyScores");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combinedRecencyScores");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combinedSignificanceScores");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTProximityEventMO managedObjectWithEventID:startDate:endDate:relationship:socialScore:frequency:recency:significance:inManagedObjectContext:](RTProximityEventMO, "managedObjectWithEventID:startDate:endDate:relationship:socialScore:frequency:recency:significance:inManagedObjectContext:", v8, v9, v10, v11, v14, v15, v13, v16, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v17;
}

+ (id)managedObjectWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 relationship:(int64_t)a6 socialScore:(double)a7 frequency:(id)a8 recency:(id)a9 significance:(id)a10 inManagedObjectContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  int64_t v36;
  double v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = v23;
  if (v23)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__161;
    v42 = __Block_byref_object_dispose__161;
    v43 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __144__RTProximityEventMO_managedObjectWithEventID_startDate_endDate_relationship_socialScore_frequency_recency_significance_inManagedObjectContext___block_invoke;
    v27[3] = &unk_1E92A5408;
    v35 = &v38;
    v28 = v23;
    v29 = v17;
    v30 = v18;
    v31 = v19;
    v36 = a6;
    v37 = a7;
    v32 = v20;
    v33 = v21;
    v34 = v22;
    objc_msgSend(v28, "performBlockAndWait:", v27);
    v25 = (id)v39[5];

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t __144__RTProximityEventMO_managedObjectWithEventID_startDate_endDate_relationship_socialScore_frequency_recency_significance_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTProximityEventMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[RTProximityEventMO initWithContext:]([RTProximityEventMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setEventID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setStartDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setEndDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setRelationship:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setSocialScore:", *(double *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setFrequencyTransformable:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setRecencyTransformable:", *(_QWORD *)(a1 + 72));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setSignificanceTransformable:", *(_QWORD *)(a1 + 80));
}

@end
