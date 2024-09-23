@implementation UIViewCreateMotionEffectEngineIfNecessary

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (void *)_motionEffectEngine;
  v3 = a2;
  v4 = objc_msgSend(v2, "_targetInterfaceOrientation");
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIWindowNewOrientationUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v4 != v7)
    +[UIView _recenterMotionEffects](UIView, "_recenterMotionEffects");
}

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "integerValue") == 3;
    v3 = v5;
    if (v4)
    {
      +[UIView _endSuspendingMotionEffectsForReason:](UIView, "_endSuspendingMotionEffectsForReason:", CFSTR("switcher"));
      v3 = v5;
    }
  }

}

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "integerValue") == 3;
    v3 = v5;
    if (v4)
    {
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", &__block_literal_global_3369, 0.25);
      +[UIView _beginSuspendingMotionEffectsForReason:](UIView, "_beginSuspendingMotionEffectsForReason:", CFSTR("switcher"));
      v3 = v5;
    }
  }

}

uint64_t ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_3()
{
  return +[UIView _recenterMotionEffects](UIView, "_recenterMotionEffects");
}

uint64_t ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_5()
{
  return +[UIView _recenterMotionEffects](UIView, "_recenterMotionEffects");
}

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_7()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_UIMotionEffectsEnabledDidChangeNotification"), 0);

}

@end
