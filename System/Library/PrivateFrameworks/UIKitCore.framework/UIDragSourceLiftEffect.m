@implementation UIDragSourceLiftEffect

void __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  CAFrameRateRange v10;

  v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v10.minimum;
  maximum = v10.maximum;
  preferred = v10.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_2;
  v8[3] = &unk_1E16B1B28;
  v9 = *(id *)(a1 + 32);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);

}

uint64_t __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __60___UIDragSourceLiftEffect_interaction_didChangeWithContext___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  id v8;
  CAFrameRateRange v9;

  v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v9.minimum;
  maximum = v9.maximum;
  preferred = v9.preferred;
  objc_msgSend(*(id *)(a1 + 32), "animations");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);

}

void __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  CAFrameRateRange v10;

  v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v10.minimum;
  maximum = v10.maximum;
  preferred = v10.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_2;
  v8[3] = &unk_1E16B1B28;
  v9 = *(id *)(a1 + 32);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);

}

void __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "items", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "platterView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLifted:", 1);
        objc_msgSend(v6, "liftAlpha");
        objc_msgSend(v7, "setAlpha:");
        objc_msgSend(v7, "layoutIfNeeded");

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

uint64_t __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "_uninstallInteractionPlattersForOperation:", *(_QWORD *)(result + 40));
  return result;
}

@end
