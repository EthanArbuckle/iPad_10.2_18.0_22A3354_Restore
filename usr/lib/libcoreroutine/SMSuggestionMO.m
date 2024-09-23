@implementation SMSuggestionMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMSuggestionMO"));
}

+ (id)initWithSuggestion:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[2];
  __int16 v40;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v24 = 0;
      goto LABEL_8;
    }
    v40 = 0;
    v26 = "Invalid parameter not satisfying: suggestion";
    v27 = (uint8_t *)&v40;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: managedObjectContext";
    v27 = buf;
    goto LABEL_10;
  }
  v35 = objc_msgSend(v5, "suggestionTrigger");
  v34 = objc_msgSend(v5, "suggestionUserType");
  v32 = objc_msgSend(v5, "suppressionReason");
  v31 = objc_msgSend(v5, "sessionType");
  objc_msgSend(v5, "sourceLocation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "latitude");
  v9 = v8;
  objc_msgSend(v5, "sourceLocation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "longitude");
  v11 = v10;
  objc_msgSend(v5, "destinationLocation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "latitude");
  v13 = v12;
  objc_msgSend(v5, "destinationLocation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "longitude");
  v15 = v14;
  objc_msgSend(v5, "buddy");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "email");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buddy");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "phoneNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v16;
  +[SMSuggestionMO managedObjectWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocationLatitude:sourceLocationLongitude:destinationLocationLatitude:destinationLocationLongitude:buddyEmail:buddyPhoneNumber:startDate:endDate:creationDate:managedObjectContext:](SMSuggestionMO, "managedObjectWithSuggestionTrigger:suggestionUserType:suppressionReason:sessionType:sourceLocationLatitude:sourceLocationLongitude:destinationLocationLatitude:destinationLocationLongitude:buddyEmail:buddyPhoneNumber:startDate:endDate:creationDate:managedObjectContext:", v35, v34, v32, v31, v16, v17, v9, v11, v13, v15, v19, v21, v22, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v24;
}

+ (id)managedObjectWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocationLatitude:(double)a7 sourceLocationLongitude:(double)a8 destinationLocationLatitude:(double)a9 destinationLocationLongitude:(double)a10 buddyEmail:(id)a11 buddyPhoneNumber:(id)a12 startDate:(id)a13 endDate:(id)a14 creationDate:(id)a15 managedObjectContext:(id)a16
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v24 = a11;
  v25 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v30 = v29;
  if (v29)
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__80;
    v54 = __Block_byref_object_dispose__80;
    v55 = 0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __286__SMSuggestionMO_managedObjectWithSuggestionTrigger_suggestionUserType_suppressionReason_sessionType_sourceLocationLatitude_sourceLocationLongitude_destinationLocationLatitude_destinationLocationLongitude_buddyEmail_buddyPhoneNumber_startDate_endDate_creationDate_managedObjectContext___block_invoke;
    v34[3] = &unk_1E929F240;
    v41 = &v50;
    v35 = v29;
    v42 = a3;
    v43 = a4;
    v44 = a5;
    v45 = a6;
    v46 = a7;
    v47 = a8;
    v48 = a9;
    v49 = a10;
    v36 = v24;
    v37 = v25;
    v38 = v26;
    v39 = v27;
    v40 = v28;
    objc_msgSend(v35, "performBlockAndWait:", v34);
    v31 = (id)v51[5];

    _Block_object_dispose(&v50, 8);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

uint64_t __286__SMSuggestionMO_managedObjectWithSuggestionTrigger_suggestionUserType_suppressionReason_sessionType_sourceLocationLatitude_sourceLocationLongitude_destinationLocationLatitude_destinationLocationLongitude_buddyEmail_buddyPhoneNumber_startDate_endDate_creationDate_managedObjectContext___block_invoke(uint64_t a1)
{
  SMSuggestionMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[SMSuggestionMO initWithContext:]([SMSuggestionMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSuggestionTrigger:", *(__int16 *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSuggestionUserType:", *(__int16 *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSuppressionReason:", *(__int16 *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSessionType:", *(__int16 *)(a1 + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSourceLocationLatitude:", *(double *)(a1 + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setSourceLocationLongitude:", *(double *)(a1 + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setDestinationLocationLatitude:", *(double *)(a1 + 136));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setDestinationLocationLongitude:", *(double *)(a1 + 144));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setBuddyEmail:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setBuddyPhoneNumber:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setStartDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setEndDate:", *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setCreationDate:", *(_QWORD *)(a1 + 72));
}

@end
