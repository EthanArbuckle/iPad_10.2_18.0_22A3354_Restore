@implementation SMReceiverSessionStatus

void __86__SMReceiverSessionStatus_RTCoreDataTransformable__createWithReceiverSessionStatusMO___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
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
  id v37;

  v2 = objc_alloc(MEMORY[0x1E0D8B960]);
  objc_msgSend(*(id *)(a1 + 32), "initiatorPrimaryHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "initiatorSecondaryHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v2, "initWithPrimaryHandle:secondaryHandles:", v3, v4);

  v5 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerLatitude");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerLongitude");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerHorizontalUncertainty");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerAltitude");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerVerticalUncertainty");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerReferenceFrame");
  objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerSpeed");
  v19 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v16, v17, (int)objc_msgSend(*(id *)(a1 + 32), "locationOfTriggerSourceAccuracy"), v7, v9, v11, v13, v15, v18);

  v20 = objc_alloc(MEMORY[0x1E0D8B9C8]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "initWithIdentifier:sessionID:initiatorHandle:", v21, v22, v37);
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  objc_msgSend(*(id *)(a1 + 32), "receiverHandle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setReceiverHandle:", v26);

  objc_msgSend(*(id *)(a1 + 32), "lastUpdateDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLastUpdateDate:", v27);

  objc_msgSend(*(id *)(a1 + 32), "cacheExpiryDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCacheExpiryDate:", v28);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSessionEndReason:", (int)objc_msgSend(*(id *)(a1 + 32), "sessionEndReason"));
  objc_msgSend(*(id *)(a1 + 32), "cacheRequestDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCacheRequestDate:", v29);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTriggerType:", (int)objc_msgSend(*(id *)(a1 + 32), "triggerType"));
  objc_msgSend(*(id *)(a1 + 32), "triggerDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setTriggerDate:", v30);

  objc_msgSend(*(id *)(a1 + 32), "destinationMapItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDestinationMapItem:", v31);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDestinationType:", (int)objc_msgSend(*(id *)(a1 + 32), "destinationType"));
  objc_msgSend(*(id *)(a1 + 32), "estimatedEndDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setEstimatedEndDate:", v32);

  objc_msgSend(*(id *)(a1 + 32), "coarseEstimatedEndDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCoarseEstimatedEndDate:", v33);

  objc_msgSend(*(id *)(a1 + 32), "sessionStartDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSessionStartDate:", v34);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSessionType:", (int)objc_msgSend(*(id *)(a1 + 32), "sessionType"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setZoneShareAccepted:", objc_msgSend(*(id *)(a1 + 32), "zoneShareAccepted"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSessionState:", (int)objc_msgSend(*(id *)(a1 + 32), "sessionState"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLocationOfTrigger:", v19);
  objc_msgSend(*(id *)(a1 + 32), "lastSessionStartInfoRequestDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLastSessionStartInfoRequestDate:", v35);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSessionStartInfoRequestCount:", (int)objc_msgSend(*(id *)(a1 + 32), "sessionStartInfoRequestCount"));
  objc_msgSend(*(id *)(a1 + 32), "lastKeyReleaseInfoRequestDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLastKeyReleaseInfoRequestDate:", v36);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setKeyReleaseInfoRequestCount:", (int)objc_msgSend(*(id *)(a1 + 32), "keyReleaseInfoRequestCount"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setIsSOSTrigger:", objc_msgSend(*(id *)(a1 + 32), "isSOSTrigger"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLowPowerModeWarningState:", (int)objc_msgSend(*(id *)(a1 + 32), "lowPowerModeWarningState"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCacheDownloadError:", (int)objc_msgSend(*(id *)(a1 + 32), "cacheDownloadError"));

}

@end
