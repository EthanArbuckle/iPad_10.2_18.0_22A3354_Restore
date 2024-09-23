@implementation SMReceiverSessionStatusMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMReceiverSessionStatusMO"));
}

+ (id)managedObjectWithReceiverSessionStatus:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithReceiverSessionStatus:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithReceiverSessionStatus:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v11 = 0;
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: sessionStatus";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__51;
  v24 = __Block_byref_object_dispose__51;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__SMReceiverSessionStatusMO_managedObjectWithReceiverSessionStatus_managedObject_inManagedObjectContext___block_invoke;
  v15[3] = &unk_1E92987D0;
  v19 = buf;
  v16 = v8;
  v17 = v10;
  v18 = v7;
  objc_msgSend(v17, "performBlockAndWait:", v15);
  v11 = *((id *)v21 + 5);

  _Block_object_dispose(buf, 8);
LABEL_8:

  return v11;
}

uint64_t __105__SMReceiverSessionStatusMO_managedObjectWithReceiverSessionStatus_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  SMReceiverSessionStatusMO *v2;
  SMReceiverSessionStatusMO *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v2 = *(SMReceiverSessionStatusMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[SMReceiverSessionStatusMO initWithContext:]([SMReceiverSessionStatusMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 48), "lastUpdateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLastUpdateDate:", v5);

  objc_msgSend(*(id *)(a1 + 48), "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionID:", v6);

  objc_msgSend(*(id *)(a1 + 48), "initiatorHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setInitiatorPrimaryHandle:", v8);

  objc_msgSend(*(id *)(a1 + 48), "initiatorHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondaryHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setInitiatorSecondaryHandles:", v10);

  objc_msgSend(*(id *)(a1 + 48), "receiverHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setReceiverHandle:", v11);

  objc_msgSend(*(id *)(a1 + 48), "cacheExpiryDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCacheExpiryDate:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionEndReason:", (__int16)objc_msgSend(*(id *)(a1 + 48), "sessionEndReason"));
  objc_msgSend(*(id *)(a1 + 48), "cacheRequestDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCacheRequestDate:", v13);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTriggerType:", (__int16)objc_msgSend(*(id *)(a1 + 48), "triggerType"));
  objc_msgSend(*(id *)(a1 + 48), "triggerDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTriggerDate:", v14);

  objc_msgSend(*(id *)(a1 + 48), "destinationMapItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDestinationMapItem:", v15);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDestinationType:", (__int16)objc_msgSend(*(id *)(a1 + 48), "destinationType"));
  objc_msgSend(*(id *)(a1 + 48), "estimatedEndDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setEstimatedEndDate:", v16);

  objc_msgSend(*(id *)(a1 + 48), "coarseEstimatedEndDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCoarseEstimatedEndDate:", v17);

  objc_msgSend(*(id *)(a1 + 48), "sessionStartDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionStartDate:", v18);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionType:", (__int16)objc_msgSend(*(id *)(a1 + 48), "sessionType"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setZoneShareAccepted:", objc_msgSend(*(id *)(a1 + 48), "zoneShareAccepted"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionState:", (__int16)objc_msgSend(*(id *)(a1 + 48), "sessionState"));
  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerDate:", v20);

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "latitude");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerLatitude:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "longitude");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerLongitude:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "horizontalUncertainty");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerHorizontalUncertainty:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "altitude");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerAltitude:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "verticalUncertainty");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerVerticalUncertainty:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "speed");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerSpeed:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerSourceAccuracy:", (__int16)objc_msgSend(v27, "sourceAccuracy"));

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerReferenceFrame:", (__int16)objc_msgSend(v28, "referenceFrame"));

  objc_msgSend(*(id *)(a1 + 48), "lastSessionStartInfoRequestDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLastSessionStartInfoRequestDate:", v29);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionStartInfoRequestCount:", (__int16)objc_msgSend(*(id *)(a1 + 48), "sessionStartInfoRequestCount"));
  objc_msgSend(*(id *)(a1 + 48), "lastKeyReleaseInfoRequestDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLastKeyReleaseInfoRequestDate:", v30);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setKeyReleaseInfoRequestCount:", (__int16)objc_msgSend(*(id *)(a1 + 48), "keyReleaseInfoRequestCount"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIsSOSTrigger:", objc_msgSend(*(id *)(a1 + 48), "isSOSTrigger"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLowPowerModeWarningState:", (__int16)objc_msgSend(*(id *)(a1 + 48), "lowPowerModeWarningState"));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCacheDownloadError:", (__int16)objc_msgSend(*(id *)(a1 + 48), "cacheDownloadError"));
}

@end
