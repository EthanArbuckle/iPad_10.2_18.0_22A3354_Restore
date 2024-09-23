@implementation SBRemoteAlertHandleServerTarget

void __116___SBRemoteAlertHandleServerTarget_remoteAlertHandleContextsForDefinition_allowsCreationValue_configurationContext___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "remoteAlertHandleContextsForDefinition:allowsCreationValue:configurationContext:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __102___SBRemoteAlertHandleServerTarget_createRemoteAlertHandleContextWithDefinition_configurationContext___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "createRemoteAlertHandleContextWithDefinition:configurationContext:", a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __86___SBRemoteAlertHandleServerTarget_activateRemoteAlertHandleWithID_activationContext___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "activateRemoteAlertHandleWithID:activationContext:", a1[5], a1[6]);

}

void __70___SBRemoteAlertHandleServerTarget_invalidateRemoteAlertHandleWithID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "invalidateRemoteAlertHandleWithID:", *(_QWORD *)(a1 + 40));

}

@end
