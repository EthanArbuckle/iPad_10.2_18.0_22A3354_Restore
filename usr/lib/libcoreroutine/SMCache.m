@implementation SMCache

void __56__SMCache_RTCoreDataTransformable__createWithSMCacheMO___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
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
  uint64_t v18;
  uint64_t v19;
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

  v2 = objc_alloc(MEMORY[0x1E0D8B8F8]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D8B930];
  objc_msgSend(*(id *)(a1 + 32), "deviceStatus");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createWithManagedObject:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D8B8F8];
  objc_msgSend(*(id *)(a1 + 32), "locationsDuringSession");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_getOrCreateManagedLocationsFromLocations:", v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "unlockLocation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createWithManagedObject:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "lockLocation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createWithManagedObject:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "mostRecentLocation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createWithManagedObject:", v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "startingLocation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createWithManagedObject:", v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "offWristLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createWithManagedObject:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D8B998];
  objc_msgSend(*(id *)(a1 + 32), "parkedCarLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createWithManagedObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "destinationMapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D8BAB8];
  objc_msgSend(*(id *)(a1 + 32), "workoutEvents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createWithSMWorkoutEventMOs:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v2, "initWithIdentifier:deviceStatus:locationsDuringSession:unlockLocation:lockLocation:mostRecentLocation:startingLocation:offWristLocation:parkedCarLocation:destinationMapItem:workoutEvents:", v34, v33, v5, v26, v24, v23, v22, v21, v13, v14, v17);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

}

@end
