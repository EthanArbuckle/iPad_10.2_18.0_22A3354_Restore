@implementation SMInitiatorContactMO

+ (id)managedObjectWithInitiatorContact:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithInitiatorContact:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithInitiatorContact:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: initiatorContact";
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
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__SMInitiatorContactMO_managedObjectWithInitiatorContact_managedObject_inManagedObjectContext___block_invoke;
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

void __95__SMInitiatorContactMO_managedObjectWithInitiatorContact_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  SMInitiatorContactMO *v2;
  SMInitiatorContactMO *v3;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v2 = *(SMInitiatorContactMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[SMInitiatorContactMO initWithContext:]([SMInitiatorContactMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 48), "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMConversationMO managedObjectWithSMConversation:inManagedObjectContext:](SMConversationMO, "managedObjectWithSMConversation:inManagedObjectContext:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setConversation:", v6);

  objc_msgSend(*(id *)(a1 + 48), "shouldBeCleanedUpDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setShouldBeCleanedUpDate:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCloudkitShareZoneCleanedUpSuccessfully:", objc_msgSend(*(id *)(a1 + 48), "cloudkitShareZoneCleanedUpSuccessfully"));
  objc_msgSend(*(id *)(a1 + 48), "keyReleaseMessageSendDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setKeyReleaseMessageSendDate:", v8);

  objc_msgSend(*(id *)(a1 + 48), "scheduledSendExpiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setScheduledSendExpiryDate:", v9);

  objc_msgSend(*(id *)(a1 + 48), "sessionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionUUID:", v10);

  objc_msgSend(*(id *)(a1 + 48), "allowReadToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAllowReadToken:", v11);

  objc_msgSend(*(id *)(a1 + 48), "safetyCacheKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSafetyCacheKey:", v12);

  objc_msgSend(*(id *)(a1 + 48), "syncDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSyncDate:", v13);

  objc_msgSend(*(id *)(a1 + 48), "scheduleSendMessageGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setScheduleSendMessageGUID:", v14);

  objc_msgSend(*(id *)(a1 + 48), "unlockLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMInitiatorContactMO getLocationMOFromLocation:context:](SMInitiatorContactMO, "getLocationMOFromLocation:context:", v15, *(_QWORD *)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setUnlockLocation:", v16);

  objc_msgSend(*(id *)(a1 + 48), "lockLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMInitiatorContactMO getLocationMOFromLocation:context:](SMInitiatorContactMO, "getLocationMOFromLocation:context:", v17, *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLockLocation:", v18);

  objc_msgSend(*(id *)(a1 + 48), "startingLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMInitiatorContactMO getLocationMOFromLocation:context:](SMInitiatorContactMO, "getLocationMOFromLocation:context:", v19, *(_QWORD *)(a1 + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStartingLocation:", v20);

  objc_msgSend(*(id *)(a1 + 48), "offWristLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMInitiatorContactMO getLocationMOFromLocation:context:](SMInitiatorContactMO, "getLocationMOFromLocation:context:", v21, *(_QWORD *)(a1 + 40));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setOffWristLocation:", v22);

  objc_msgSend(*(id *)(a1 + 48), "parkedCarLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMInitiatorContactMO getLocationMOFromLocation:context:](SMInitiatorContactMO, "getLocationMOFromLocation:context:", v23, *(_QWORD *)(a1 + 40));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setParkedCarLocation:", v24);

  objc_msgSend(*(id *)(a1 + 48), "destinationMapItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDestinationMapItem:", v25);

  objc_msgSend(*(id *)(a1 + 48), "timeCacheUploadCompletion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTimeCacheUploadCompletion:", v26);

  objc_msgSend(*(id *)(a1 + 48), "maxCacheSize");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMaxCacheSize:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMaxLocationsInTrace:", (__int16)objc_msgSend(*(id *)(a1 + 48), "maxLocationsInTrace"));
  objc_msgSend(*(id *)(a1 + 48), "maxTimeBetweenCacheUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMaxTimeBetweenCacheUpdates:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumCacheUpdates:", (__int16)objc_msgSend(*(id *)(a1 + 48), "numCacheUpdates"));
  objc_msgSend(*(id *)(a1 + 48), "timeTilCacheRelease");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTimeTilCacheRelease:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfSuccessfulCacheUpdates:", (__int16)objc_msgSend(*(id *)(a1 + 48), "numberOfSuccessfulCacheUpdates"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfMessageCancelling:", (__int16)objc_msgSend(*(id *)(a1 + 48), "numberOfMessageCancelling"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfSuccessfulMessageCancelling:", (__int16)objc_msgSend(*(id *)(a1 + 48), "numberOfSuccessfulMessageCancelling"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfMessageScheduling:", (__int16)objc_msgSend(*(id *)(a1 + 48), "numberOfMessageScheduling"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfSuccessfulMessageScheduling:", (__int16)objc_msgSend(*(id *)(a1 + 48), "numberOfSuccessfulMessageScheduling"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWasCacheReleased:", objc_msgSend(*(id *)(a1 + 48), "wasCacheReleased"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWasScheduledSendTriggered:", objc_msgSend(*(id *)(a1 + 48), "wasScheduledSendTriggered"));
  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerDate:", v28);

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "latitude");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerLatitude:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "longitude");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerLongitude:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "horizontalUncertainty");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerHorizontalUncertainty:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "altitude");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerAltitude:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "verticalUncertainty");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerVerticalUncertainty:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "speed");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerSpeed:");

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerSourceAccuracy:", (__int16)objc_msgSend(v35, "sourceAccuracy"));

  objc_msgSend(*(id *)(a1 + 48), "locationOfTrigger");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationOfTriggerReferenceFrame:", (__int16)objc_msgSend(v36, "referenceFrame"));

  objc_msgSend(*(id *)(a1 + 48), "triggerDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTriggerDate:", v37);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLockState:", objc_msgSend(*(id *)(a1 + 48), "lockState"));
  objc_msgSend(*(id *)(a1 + 48), "cacheUpdateBackstopExpiryDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCacheUpdateBackstopExpiryDate:", v38);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfHandoffBecomingActive:", objc_msgSend(*(id *)(a1 + 48), "numberOfHandoffBecomingActive"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setNumberOfHandoffBecomingNonActive:", objc_msgSend(*(id *)(a1 + 48), "numberOfHandoffBecomingNonActive"));
  objc_msgSend(*(id *)(a1 + 48), "earliestActiveDeviceIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setEarliestActiveDeviceIdentifier:", v39);

  objc_msgSend(*(id *)(a1 + 48), "latestActiveDeviceIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLatestActiveDeviceIdentifier:", v40);

  +[SMCacheMO fetchRequest](SMCacheMO, "fetchRequest");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "phoneCache");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPredicate:", v45);

  v46 = *(void **)(a1 + 40);
  v78 = 0;
  objc_msgSend(v46, "executeFetchRequest:error:", v41, &v78);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v78;
  objc_msgSend(*(id *)(a1 + 48), "phoneCache");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMCacheMO managedObjectWithCache:managedObject:inManagedObjectContext:](SMCacheMO, "managedObjectWithCache:managedObject:inManagedObjectContext:", v49, v50, *(_QWORD *)(a1 + 40));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPhoneCache:", v51);

  if (v48)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "sessionUUID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "phoneCache");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "identifier");
      v68 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v80 = "+[SMInitiatorContactMO managedObjectWithInitiatorContact:managedObject:inManagedObjectContext:]_block_invoke";
      v81 = 2112;
      v82 = v73;
      v83 = 2112;
      v84 = v67;
      v85 = 2112;
      v86 = v68;
      v69 = (void *)v68;
      v87 = 2112;
      v88 = v48;
      _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "SMInitiatorContactMO,%s,sessionUUID,%@,initiatorContact.identifier,%@,phoneCache.identifier,%@,phone cache fetch error,%@", buf, 0x34u);

    }
  }
  +[SMCacheMO fetchRequest](SMCacheMO, "fetchRequest");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "watchCache");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "identifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setPredicate:", v57);

  v58 = *(void **)(a1 + 40);
  v77 = 0;
  objc_msgSend(v58, "executeFetchRequest:error:", v53, &v77);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v77;
  objc_msgSend(*(id *)(a1 + 48), "watchCache");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "firstObject");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMCacheMO managedObjectWithCache:managedObject:inManagedObjectContext:](SMCacheMO, "managedObjectWithCache:managedObject:inManagedObjectContext:", v61, v62, *(_QWORD *)(a1 + 40));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWatchCache:", v63);

  if (v60)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "sessionUUID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "watchCache");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "identifier");
      v71 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v80 = "+[SMInitiatorContactMO managedObjectWithInitiatorContact:managedObject:inManagedObjectContext:]_block_invoke";
      v81 = 2112;
      v82 = v74;
      v83 = 2112;
      v84 = v70;
      v85 = 2112;
      v86 = v71;
      v72 = (void *)v71;
      v87 = 2112;
      v88 = v60;
      _os_log_error_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_ERROR, "SMInitiatorContactMO,%s,sessionUUID,%@,initiatorContact.identifier,%@,watchCache.identifier,%@,watch cache fetch error,%@", buf, 0x34u);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "workoutEvents");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMWorkoutEventMO getWorkoutEventMOFromWorkoutEvents:context:](SMWorkoutEventMO, "getWorkoutEventMOFromWorkoutEvents:context:", v65, *(_QWORD *)(a1 + 40));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setWorkoutEvents:", v66);

}

+ (id)getLocationMOFromLocation:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v5 = a4;
  v6 = a3;
  +[SMLocationMO fetchRequest](SMLocationMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  v15 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMLocationMO managedObjectWithLocation:managedObject:inManagedObjectContext:](SMLocationMO, "managedObjectWithLocation:managedObject:inManagedObjectContext:", v6, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMInitiatorContactMO"));
}

@end
