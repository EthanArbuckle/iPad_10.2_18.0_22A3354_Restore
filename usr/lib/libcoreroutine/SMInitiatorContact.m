@implementation SMInitiatorContact

void __76__SMInitiatorContact_RTCoreDataTransformable__createWithInitiatorContactMO___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  char v45;
  char v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  uint64_t v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D8B918];
    objc_msgSend(*(id *)(a1 + 32), "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createWithManagedObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_11;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "receiverPrimaryHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "receiverPrimaryHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "receiverSecondaryHandles");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B960]), "initWithPrimaryHandle:secondaryHandles:", v7, v11);
  v13 = objc_alloc(MEMORY[0x1E0D8B918]);
  v102[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v13, "initWithReceiverHandles:identifier:displayName:", v14, 0, 0);

  if (!v5)
  {
LABEL_8:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v55 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v99 = "+[SMInitiatorContact(RTCoreDataTransformable) createWithInitiatorContactMO:]_block_invoke";
      v100 = 2112;
      v101 = v55;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%s, no conversation from SMSessionConfigurationMO, %@", buf, 0x16u);
    }

    v5 = 0;
  }
LABEL_11:
  v96 = (void *)v5;
  v16 = (void *)MEMORY[0x1E0D8BAB8];
  objc_msgSend(*(id *)(a1 + 32), "workoutEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createWithSMWorkoutEventMOs:", v17);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerLatitude");
  v20 = v19;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerLongitude");
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerHorizontalUncertainty");
  v24 = v23;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerAltitude");
  v26 = v25;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerVerticalUncertainty");
  v28 = v27;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerReferenceFrame");
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerSpeed");
  v97 = (void *)objc_msgSend(v18, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v29, v30, (int)objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerSourceAccuracy"), v20, v22, v24, v26, v28, v31);

  v81 = objc_alloc(MEMORY[0x1E0D8B968]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "shouldBeCleanedUpDate");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(*(id *)(a1 + 32), "cloudkitShareZoneCleanedUpSuccessfully");
  objc_msgSend(*(id *)(a1 + 32), "syncDate");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyReleaseMessageSendDate");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scheduledSendExpiryDate");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D8B8F8];
  objc_msgSend(*(id *)(a1 + 32), "phoneCache");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "createWithManagedObject:", v83);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0D8B8F8];
  objc_msgSend(*(id *)(a1 + 32), "watchCache");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "createWithManagedObject:", v82);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionUUID");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safetyCacheKey");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allowReadToken");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scheduleSendMessageGUID");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "unlockLocation");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "createWithManagedObject:", v79);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "lockLocation");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "createWithManagedObject:", v78);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "startingLocation");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "createWithManagedObject:", v77);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "offWristLocation");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "createWithManagedObject:", v76);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "parkedCarLocation");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "createWithManagedObject:", v75);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "destinationMapItem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timeCacheUploadCompletion");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "maxCacheSize");
  v40 = v39;
  v67 = (int)objc_msgSend(*(id *)(a1 + 32), "maxLocationsInTrace");
  objc_msgSend(*(id *)(a1 + 32), "maxTimeBetweenCacheUpdates");
  v42 = v41;
  v66 = (int)objc_msgSend(*(id *)(a1 + 32), "numCacheUpdates");
  objc_msgSend(*(id *)(a1 + 32), "timeTilCacheRelease");
  v44 = v43;
  v65 = (int)objc_msgSend(*(id *)(a1 + 32), "numberOfSuccessfulCacheUpdates");
  v64 = (int)objc_msgSend(*(id *)(a1 + 32), "numberOfMessageCancelling");
  v63 = (int)objc_msgSend(*(id *)(a1 + 32), "numberOfSuccessfulMessageCancelling");
  v62 = (int)objc_msgSend(*(id *)(a1 + 32), "numberOfMessageScheduling");
  v61 = (int)objc_msgSend(*(id *)(a1 + 32), "numberOfSuccessfulMessageScheduling");
  v60 = objc_msgSend(*(id *)(a1 + 32), "wasCacheReleased");
  v45 = objc_msgSend(*(id *)(a1 + 32), "wasScheduledSendTriggered");
  objc_msgSend(*(id *)(a1 + 32), "triggerDate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(*(id *)(a1 + 32), "lockState");
  objc_msgSend(*(id *)(a1 + 32), "cacheUpdateBackstopExpiryDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v72, "mutableCopy");
  v48 = (int)objc_msgSend(*(id *)(a1 + 32), "numberOfHandoffBecomingActive");
  v49 = (int)objc_msgSend(*(id *)(a1 + 32), "numberOfHandoffBecomingNonActive");
  objc_msgSend(*(id *)(a1 + 32), "earliestActiveDeviceIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "latestActiveDeviceIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v57) = v46;
  BYTE1(v56) = v45;
  LOBYTE(v56) = v60;
  v52 = objc_msgSend(v81, "initWithIdentifier:conversation:shouldBeCleanedUpDate:cloudkitShareZoneCleanedUpSuccessfully:syncDate:keyReleaseMessageSendDate:scheduledSendExpiryDate:phoneCache:watchCache:sessionID:safetyCacheKey:allowReadToken:scheduleSendMessageGUID:unlockLocation:lockLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:timeCacheUploadCompletion:maxCacheSize:maxLocationsInTrace:maxTimeBetweenCacheUpdates:numCacheUpdates:timeTilCacheRelease:numberOfSuccessfulCacheUpdates:numberOfMessageCancelling:numberOfSuccessfulMessageCancelling:numberOfMessageScheduling:numberOfSuccessfulMessageScheduling:wasCacheReleased:wasScheduledSendTriggered:locationOfTrigger:triggerDate:lockState:cacheUpdateBackstopExpiryDate:workoutEvents:numberOfHandoffBecomingActive:numberOfHandoffBecomingNonActive:earliestActiveDeviceIdentifier:latestActiveDeviceIdentifier:", v95, v96, v93, v80, v92, v90, v40, v42, v44, v94,
          v91,
          v89,
          v88,
          v87,
          v86,
          v85,
          v74,
          v73,
          v71,
          v70,
          v84,
          v69,
          v68,
          v67,
          v66,
          v65,
          v64,
          v63,
          v62,
          v61,
          v56,
          v97,
          v59,
          v57,
          v58,
          v47,
          v48,
          v49,
          v50,
          v51);
  v53 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v54 = *(void **)(v53 + 40);
  *(_QWORD *)(v53 + 40) = v52;

}

@end
