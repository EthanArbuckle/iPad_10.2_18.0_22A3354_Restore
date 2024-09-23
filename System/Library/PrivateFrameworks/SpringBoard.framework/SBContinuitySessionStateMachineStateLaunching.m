@implementation SBContinuitySessionStateMachineStateLaunching

void __67___SBContinuitySessionStateMachineStateLaunching_enteredStateFrom___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[32])
  {
    WeakRetained[33] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_reevaluateStateForReason:", CFSTR("radar 124642623"));
    WeakRetained = v2;
  }

}

void __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke_2;
  v6[3] = &unk_1E8E9E820;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v4, "appendProem:block:", v3, v6);

}

uint64_t __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("isCurrentState"));
  result = objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle");
  if ((result & 1) == 0)
    return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("handlingLaunchEvents"));
  return result;
}

@end
