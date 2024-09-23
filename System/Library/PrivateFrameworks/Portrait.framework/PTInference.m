@implementation PTInference

+ (int)espressoPlanPriorityValidate:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  int result;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  result = a3;
  if (a3 == 1)
  {
    v8 = v3;
    v9 = v4;
    if (+[PTEffectUtil currentProcessIsCameracaptured](PTEffectUtil, "currentProcessIsCameracaptured"))
    {
      return 1;
    }
    else
    {
      _PTLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1C9281000, v6, OS_LOG_TYPE_INFO, "Changing espresso plan priority to 1 due to missing entitlements", v7, 2u);
      }

      return 0x2000;
    }
  }
  return result;
}

+ (int)espressoPlanPriorityForSynchronousWork
{
  return objc_msgSend(a1, "espressoPlanPriorityValidate:", 1);
}

+ (int)espressoPlanPriorityForAsynchronousWork
{
  return objc_msgSend(a1, "espressoPlanPriorityValidate:", 0x2000);
}

+ (int)espressoEngineForPlanPriority:(int)a3
{
  if (a3 == 1)
    return 10006;
  else
    return 10007;
}

+ (id)ANEConfigForSynchronousWork
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "espressoPlanPriorityForSynchronousWork");
  return -[PTInferenceANEConfig initWithEspressoPlanPriority:espressoEngine:]([PTInferenceANEConfig alloc], "initWithEspressoPlanPriority:espressoEngine:", v3, objc_msgSend(a1, "espressoEngineForPlanPriority:", v3));
}

+ (id)ANEConfigForAsynchronousWork
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "espressoPlanPriorityForAsynchronousWork");
  return -[PTInferenceANEConfig initWithEspressoPlanPriority:espressoEngine:]([PTInferenceANEConfig alloc], "initWithEspressoPlanPriority:espressoEngine:", v3, objc_msgSend(a1, "espressoEngineForPlanPriority:", v3));
}

@end
