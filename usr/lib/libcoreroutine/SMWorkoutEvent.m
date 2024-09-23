@implementation SMWorkoutEvent

void __70__SMWorkoutEvent_RTCoreDataTransformable__createWithSMWorkoutEventMO___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v16 = objc_alloc(MEMORY[0x1E0D8BAB8]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createWithManagedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(*(id *)(a1 + 32), "activityType");
  v7 = (int)objc_msgSend(*(id *)(a1 + 32), "locationType");
  v8 = (int)objc_msgSend(*(id *)(a1 + 32), "swimmingLocationType");
  v9 = (int)objc_msgSend(*(id *)(a1 + 32), "sessionState");
  v10 = objc_msgSend(*(id *)(a1 + 32), "isResumedSessionState");
  objc_msgSend(*(id *)(a1 + 32), "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v10;
  v12 = objc_msgSend(v16, "initWithIdentifier:sessionIdentifier:location:activityType:locationType:swimmingLocationType:sessionState:isResumedSessionState:date:", v17, v2, v5, v6, v7, v8, v9, v15, v11);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

@end
