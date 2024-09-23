@implementation UIMotionEffectEngine

id __29___UIMotionEffectEngine_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_analyzerClass")), "initWithSettings:", v2);

  return v3;
}

void __29___UIMotionEffectEngine_init__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  state64 = 0;
  notify_get_state(a2, &state64);
  if (state64 < 0x1E)
  {
    objc_msgSend(WeakRetained, "endSuspendingForReason:", CFSTR("thermal"));
  }
  else
  {
    objc_msgSend(WeakRetained, "beginSuspendingForReason:", CFSTR("thermal"));
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __29___UIMotionEffectEngine_init__block_invoke_3;
    v4[3] = &unk_1E16B1B28;
    v5 = WeakRetained;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.75);

  }
}

uint64_t __29___UIMotionEffectEngine_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetMotionAnalysis");
}

void __29___UIMotionEffectEngine_init__block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  id v3[2];
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 128), &state64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29___UIMotionEffectEngine_init__block_invoke_5;
  block[3] = &unk_1E16C0530;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v3[1] = (id)state64;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v3);
}

void __29___UIMotionEffectEngine_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  double v3;
  int v4;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (double)*(unint64_t *)(a1 + 40);
  v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectMinimumBacklightLevel, (uint64_t)CFSTR("UIMotionEffectMinimumBacklightLevel"));
  v5 = *(double *)&qword_1EDDA81F8;
  if (v4)
    v5 = 5.0;
  if (v5 >= v3)
  {
    objc_msgSend(WeakRetained, "beginSuspendingForReason:", CFSTR("screenDimmed"));
    if (*(_QWORD *)(a1 + 40))
      v6 = 0.75;
    else
      v6 = 0.0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __29___UIMotionEffectEngine_init__block_invoke_6;
    v7[3] = &unk_1E16B1B28;
    v8 = WeakRetained;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, v6);

  }
  else
  {
    objc_msgSend(WeakRetained, "endSuspendingForReason:", CFSTR("screenDimmed"));
  }

}

uint64_t __29___UIMotionEffectEngine_init__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetMotionAnalysis");
}

uint64_t __41___UIMotionEffectEngine_updateWithEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLatestDeviceMotion");
}

@end
