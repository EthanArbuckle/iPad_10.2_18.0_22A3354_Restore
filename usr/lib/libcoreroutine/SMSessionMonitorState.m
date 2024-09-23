@implementation SMSessionMonitorState

void __84__SMSessionMonitorState_RTCoreDataTransformable__createWithSMSessionMonitorStateMO___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = objc_alloc(MEMORY[0x1E0D8BA48]);
  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(*(id *)(a1 + 32), "currentRegionState");
  v4 = objc_msgSend(*(id *)(a1 + 32), "triggerPending");
  v5 = objc_msgSend(*(id *)(a1 + 32), "triggerConfirmed");
  objc_msgSend(*(id *)(a1 + 32), "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "initWithSessionIdentifier:currentRegionState:triggerPending:triggerConfirmed:date:", v10, v3, v4, v5, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

@end
