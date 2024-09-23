@implementation SMSessionManagerStatus

void __84__SMSessionManagerStatus_RTCoreDataTransformable__createWithSessionManagerStatusMO___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0D8BA28];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createWithManagedObject:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0D8BA30]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stateQueryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastSessionIDDuringMagnetBreak");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "initWithIdentifier:stateQueryDate:lastSessionIDDuringMagnetBreak:state:", v5, v6, v7, v11);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

@end
