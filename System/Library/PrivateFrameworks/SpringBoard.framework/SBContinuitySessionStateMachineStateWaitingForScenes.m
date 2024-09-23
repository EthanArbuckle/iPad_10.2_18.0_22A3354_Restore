@implementation SBContinuitySessionStateMachineStateWaitingForScenes

void __83___SBContinuitySessionStateMachineStateWaitingForScenes_appendDescriptionToStream___block_invoke(uint64_t a1)
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
  v6[2] = __83___SBContinuitySessionStateMachineStateWaitingForScenes_appendDescriptionToStream___block_invoke_2;
  v6[3] = &unk_1E8E9E820;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v4, "appendProem:block:", v3, v6);

}

uint64_t __83___SBContinuitySessionStateMachineStateWaitingForScenes_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t result;
  id v4;
  id v5;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 28), CFSTR("isCurrentState"));
  result = objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle");
  if ((result & 1) == 0)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 27), CFSTR("validDisplayUUID"));
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("mainSceneConnected"));
    result = SBFEffectiveArtworkSubtype();
    if (result <= 2795)
    {
      if (result != 2556 && result != 2622)
        return result;
LABEL_8:
      v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 25), CFSTR("systemApertureSceneConnected"));
      return (uint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 26), CFSTR("systemApertureCurtainSceneConnected"));
    }
    if (result == 2868 || result == 2796)
      goto LABEL_8;
  }
  return result;
}

@end
