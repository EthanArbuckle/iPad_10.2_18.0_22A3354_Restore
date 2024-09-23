@implementation SMSessionManagerStateMO

+ (id)initWithSessionManagerState:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[2];
  __int16 v37;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v14 = 0;
      goto LABEL_8;
    }
    v37 = 0;
    v16 = "Invalid parameter not satisfying: sessionManagerState";
    v17 = (uint8_t *)&v37;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_7;
  }
  if (!v7)
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
  objc_msgSend(v6, "configuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v6, "sessionState");
  objc_msgSend(v6, "monitorContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v32, "triggerCategory");
  objc_msgSend(v6, "monitorContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v31, "updateReason");
  v27 = objc_msgSend(v6, "userTriggerResponse");
  objc_msgSend(v6, "date");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allowReadToken");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safetyCacheKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startMessageGUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduledSendMessageGUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduledSendMessageDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "estimatedEndDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coarseEstimatedEndDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "estimatedEndDateStatus");
  v19 = a1;
  v11 = objc_msgSend(v6, "sessionEndReason");
  objc_msgSend(v6, "sessionStateTransitionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activePairedDeviceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "managedObjectWithSessionManagerConfiguration:sessionState:triggerCateogry:updateReason:userTriggerResponse:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:managedObjectContext:", v35, v30, v29, v28, v27, v26, v25, v34, v24, v23, v33, v22, v9, v21,
    v20,
    v10,
    v11,
    v12,
    v13,
    v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v14;
}

+ (id)managedObjectWithSessionManagerConfiguration:(id)a3 sessionState:(unint64_t)a4 triggerCateogry:(unint64_t)a5 updateReason:(unint64_t)a6 userTriggerResponse:(int64_t)a7 date:(id)a8 location:(id)a9 allowReadToken:(id)a10 safetyCacheKey:(id)a11 startMessageGUID:(id)a12 scheduledSendMessageGUID:(id)a13 scheduledSendMessageDate:(id)a14 activeDeviceIdentifier:(id)a15 estimatedEndDate:(id)a16 coarseEstimatedEndDate:(id)a17 estimatedEndDateStatus:(unint64_t)a18 sessionEndReason:(unint64_t)a19 sessionStateTransitionDate:(id)a20 activePairedDeviceIdentifier:(id)a21 managedObjectContext:(id)a22
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
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v41;
  id v42;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;

  v53 = a3;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v52 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v29 = a15;
  v30 = a16;
  v51 = a17;
  v31 = a20;
  v32 = a21;
  v33 = a22;
  v49 = v25;
  v47 = v29;
  v48 = v28;
  v50 = v32;
  if (v33)
  {
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__0;
    v80 = __Block_byref_object_dispose__0;
    v81 = 0;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __425__SMSessionManagerStateMO_managedObjectWithSessionManagerConfiguration_sessionState_triggerCateogry_updateReason_userTriggerResponse_date_location_allowReadToken_safetyCacheKey_startMessageGUID_scheduledSendMessageGUID_scheduledSendMessageDate_activeDeviceIdentifier_estimatedEndDate_coarseEstimatedEndDate_estimatedEndDateStatus_sessionEndReason_sessionStateTransitionDate_activePairedDeviceIdentifier_managedObjectContext___block_invoke;
    v54[3] = &unk_1E9296F48;
    v69 = &v76;
    v41 = v33;
    v42 = v23;
    v55 = v33;
    v70 = a4;
    v71 = a5;
    v72 = a6;
    v73 = a7;
    v56 = v23;
    v57 = v24;
    v58 = v25;
    v34 = v52;
    v59 = v52;
    v60 = v26;
    v61 = v27;
    v62 = v28;
    v63 = v29;
    v64 = v30;
    v65 = v51;
    v74 = a18;
    v75 = a19;
    v66 = v31;
    v67 = v32;
    v35 = v53;
    v68 = v53;
    objc_msgSend(v55, "performBlockAndWait:", v54);
    v36 = v42;
    v37 = v27;
    v38 = v51;
    v39 = (id)v77[5];

    _Block_object_dispose(&v76, 8);
    v33 = v41;
  }
  else
  {
    v39 = 0;
    v36 = v23;
    v34 = v52;
    v35 = v53;
    v37 = v27;
    v38 = v51;
  }

  return v39;
}

void __425__SMSessionManagerStateMO_managedObjectWithSessionManagerConfiguration_sessionState_triggerCateogry_updateReason_userTriggerResponse_date_location_allowReadToken_safetyCacheKey_startMessageGUID_scheduledSendMessageGUID_scheduledSendMessageDate_activeDeviceIdentifier_estimatedEndDate_coarseEstimatedEndDate_estimatedEndDateStatus_sessionEndReason_sessionStateTransitionDate_activePairedDeviceIdentifier_managedObjectContext___block_invoke(uint64_t a1)
{
  SMSessionManagerStateMO *v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  id v7;

  v2 = -[SMSessionManagerStateMO initWithContext:]([SMSessionManagerStateMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setSessionState:", *(__int16 *)(a1 + 152));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setTriggerCategory:", *(__int16 *)(a1 + 160));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setUpdateReason:", *(__int16 *)(a1 + 168));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setUserTriggerResponse:", *(__int16 *)(a1 + 176));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "coordinate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setLocationLatitude:");
  objc_msgSend(*(id *)(a1 + 48), "coordinate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setLocationLongitude:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setAllowReadToken:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setSafetyCacheKey:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setStartMessageGUID:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setScheduledSendMessageGUID:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setScheduledSendMessageDate:", *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setActiveDeviceIdentifier:", *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setEstimatedEndDate:", *(_QWORD *)(a1 + 104));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setCoarseEstimatedEndDate:", *(_QWORD *)(a1 + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setEstimatedEndDateStatus:", *(__int16 *)(a1 + 184));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setSessionEndReason:", *(__int16 *)(a1 + 192));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setSessionStateTransitionDate:", *(_QWORD *)(a1 + 120));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setActivePairedDeviceIdentifier:", *(_QWORD *)(a1 + 128));
  v6 = *(_QWORD *)(a1 + 136);
  if (v6)
  {
    +[SMSessionConfigurationMO initWithSessionConfiguration:inManagedObjectContext:](SMSessionConfigurationMO, "initWithSessionConfiguration:inManagedObjectContext:", v6, *(_QWORD *)(a1 + 32));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "setSessionConfiguration:", v7);

  }
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMSessionManagerStateMO"));
}

@end
