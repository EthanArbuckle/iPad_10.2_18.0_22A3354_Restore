@implementation SBRingerSwitchMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  if (a3 == 11 || a3 == 62)
  {
    AnalyticsSendEventLazy();
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __48__SBRingerSwitchMetric_handleEvent_withContext___block_invoke()
{
  return 0;
}

id __48__SBRingerSwitchMetric_handleEvent_withContext___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("is_muted");
  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)SBApp, "ringerControl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", -[SBRingerControl isRingerMuted]((uint64_t)v1));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
