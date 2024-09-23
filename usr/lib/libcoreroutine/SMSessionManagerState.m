@implementation SMSessionManagerState

void __84__SMSessionManagerState_RTCoreDataTransformable__createWithSMSessionManagerStateMO___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;

  v2 = objc_alloc(MEMORY[0x1E0D8BA40]);
  v3 = (int)objc_msgSend(*(id *)(a1 + 32), "updateReason");
  v4 = (int)objc_msgSend(*(id *)(a1 + 32), "triggerCategory");
  v5 = (void *)MEMORY[0x1E0D8B9F0];
  objc_msgSend(*(id *)(a1 + 32), "sessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createWithManagedObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v2, "initWithUpdateReason:triggerCategory:sessionID:", v3, v4, v8);

  v33 = objc_alloc(MEMORY[0x1E0D8BA28]);
  v32 = (int)objc_msgSend(*(id *)(a1 + 32), "sessionState");
  v9 = (void *)MEMORY[0x1E0D8B9F0];
  objc_msgSend(*(id *)(a1 + 32), "sessionConfiguration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createWithManagedObject:", v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (int)objc_msgSend(*(id *)(a1 + 32), "userTriggerResponse");
  objc_msgSend(*(id *)(a1 + 32), "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(*(id *)(a1 + 32), "locationLatitude");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "locationLongitude");
  v28 = (void *)objc_msgSend(v10, "initWithLatitude:longitude:", v12, v13);
  objc_msgSend(*(id *)(a1 + 32), "allowReadToken");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safetyCacheKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startMessageGUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scheduledSendMessageGUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scheduledSendMessageDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeDeviceIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "estimatedEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "coarseEstimatedEndDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (int)objc_msgSend(*(id *)(a1 + 32), "estimatedEndDateStatus");
  v17 = (int)objc_msgSend(*(id *)(a1 + 32), "sessionEndReason");
  objc_msgSend(*(id *)(a1 + 32), "sessionStateTransitionDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activePairedDeviceIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v33, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v32, v31, v30, v36, v29, v28, v35, v25, v27, v24, v26, v23, v14, v15, v16,
          v17,
          v18,
          v19);
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

}

@end
