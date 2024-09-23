@implementation SMTriggerDestinationStateMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMTriggerDestinationStateMO"));
}

+ (id)initWithTriggerDestinationState:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __int16 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint8_t buf[2];
  __int16 v34;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v17 = 0;
      goto LABEL_8;
    }
    v34 = 0;
    v19 = "Invalid parameter not satisfying: state";
    v20 = (uint8_t *)&v34;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_7;
  }
  if (!v7)
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
  objc_msgSend(v6, "sessionIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastLockDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastUnlockDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v6, "predominantModeOfTransport");
  v27 = objc_msgSend(v6, "currentStatus");
  objc_msgSend(v6, "currentStatusDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v6, "shouldRetryETAQuery");
  v9 = objc_msgSend(v6, "numberOfETARetries");
  objc_msgSend(v6, "upperBoundEta");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "crowFliesUpperBoundEta");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "upperBoundEta");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapsUpperBoundEta");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "roundTripReminderDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeToUpdateStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapsExpectedTravelTime");
  v15 = v14;
  objc_msgSend(v6, "remainingDistance");
  WORD1(v22) = v9;
  LOBYTE(v22) = v32;
  objc_msgSend(a1, "managedObjectWithSessionIdentifier:lastLockDate:lastUnlockDate:predominantModeOfTransport:currentStatus:currentStatusDate:date:shouldRetryETAQuery:numberOfETARetries:upperBoundEtaCrowFliesUpperBoundEta:upperBoundEtaMapsUpperBoundEta:roundTripReminderDate:timeToUpdateStatus:mapsExpectedTravelTime:remainingDistance:managedObjectContext:", v31, v30, v29, v28, v27, v25, v15, v16, v24, v22, v23, v11, v12, v13, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v17;
}

+ (id)managedObjectWithSessionIdentifier:(id)a3 lastLockDate:(id)a4 lastUnlockDate:(id)a5 predominantModeOfTransport:(unint64_t)a6 currentStatus:(unint64_t)a7 currentStatusDate:(id)a8 date:(id)a9 shouldRetryETAQuery:(BOOL)a10 numberOfETARetries:(unsigned __int16)a11 upperBoundEtaCrowFliesUpperBoundEta:(id)a12 upperBoundEtaMapsUpperBoundEta:(id)a13 roundTripReminderDate:(id)a14 timeToUpdateStatus:(id)a15 mapsExpectedTravelTime:(double)a16 remainingDistance:(double)a17 managedObjectContext:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t *v53;
  unint64_t v54;
  unint64_t v55;
  double v56;
  double v57;
  unsigned __int16 v58;
  BOOL v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v23 = a3;
  v24 = a4;
  v25 = a5;
  v41 = a8;
  v26 = a9;
  v27 = a12;
  v28 = a13;
  v29 = a14;
  v30 = a15;
  v31 = a18;
  v32 = v31;
  v39 = v26;
  v40 = v23;
  if (v31)
  {
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__92;
    v64 = __Block_byref_object_dispose__92;
    v65 = 0;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __367__SMTriggerDestinationStateMO_managedObjectWithSessionIdentifier_lastLockDate_lastUnlockDate_predominantModeOfTransport_currentStatus_currentStatusDate_date_shouldRetryETAQuery_numberOfETARetries_upperBoundEtaCrowFliesUpperBoundEta_upperBoundEtaMapsUpperBoundEta_roundTripReminderDate_timeToUpdateStatus_mapsExpectedTravelTime_remainingDistance_managedObjectContext___block_invoke;
    v42[3] = &unk_1E92A0728;
    v53 = &v60;
    v43 = v31;
    v44 = v23;
    v45 = v26;
    v33 = v24;
    v46 = v24;
    v47 = v25;
    v54 = a6;
    v55 = a7;
    v34 = v41;
    v48 = v41;
    v59 = a10;
    v58 = a11;
    v49 = v27;
    v50 = v28;
    v51 = v29;
    v52 = v30;
    v56 = a16;
    v57 = a17;
    objc_msgSend(v43, "performBlockAndWait:", v42);
    v35 = (id)v61[5];

    _Block_object_dispose(&v60, 8);
  }
  else
  {
    v35 = 0;
    v33 = v24;
    v34 = v41;
  }

  return v35;
}

uint64_t __367__SMTriggerDestinationStateMO_managedObjectWithSessionIdentifier_lastLockDate_lastUnlockDate_predominantModeOfTransport_currentStatus_currentStatusDate_date_shouldRetryETAQuery_numberOfETARetries_upperBoundEtaCrowFliesUpperBoundEta_upperBoundEtaMapsUpperBoundEta_roundTripReminderDate_timeToUpdateStatus_mapsExpectedTravelTime_remainingDistance_managedObjectContext___block_invoke(uint64_t a1)
{
  SMTriggerDestinationStateMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[SMTriggerDestinationStateMO initWithContext:]([SMTriggerDestinationStateMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setSessionIdentifier_v2:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setLastLockDate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setLastUnlockDate:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setPredominantModeOfTransport_v2:", *(_QWORD *)(a1 + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setCurrentStatus:", *(__int16 *)(a1 + 128));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setCurrentStatusDate:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setShouldRetryETAQuery:", *(unsigned __int8 *)(a1 + 154));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setNumberOfETARetries:", *(__int16 *)(a1 + 152));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setUpperBoundEtaCrowFliesUpperBoundEta:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setUpperBoundEtaMapsUpperBoundEta:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setRoundTripReminderDate:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setTimeToUpdateStatus:", *(_QWORD *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setMapsExpectedTravelTime:", *(double *)(a1 + 136));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setRemainingDistance:", *(double *)(a1 + 144));
}

@end
