id MTTimerManagerTimersKeyFunction()
{
  return (id)constantMTTimerManagerTimersKey;
}

id initMTTimer()
{
  if (initMTTimer_sOnce != -1)
    dispatch_once(&initMTTimer_sOnce, &__block_literal_global_54_964);
  return (id)classMTTimer;
}

id SOClockAlarmCreateFromMTAlarm(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v1 = a1;
  objc_msgSend(v1, "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v1, "sound");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
    objc_msgSend(getTLToneManagerClass(), "sharedToneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "sound");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "_hasUnderlyingPlaybackArchiveForToneIdentifier:", v7);

    if ((v8 & 1) != 0)
      v9 = 1;
    else
LABEL_5:
      v9 = 0;
    v10 = (void *)MEMORY[0x24BE09140];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __SOClockAlarmCreateFromMTAlarm_block_invoke;
    v13[3] = &unk_24CE755A0;
    v14 = v2;
    v15 = v1;
    v16 = v9;
    v11 = (void *)objc_msgSend(v10, "newWithBuilder:", v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id TLToneManagerFunction()
{
  return (id)classTLToneManager;
}

id initTLToneManager()
{
  if (initTLToneManager_sOnce != -1)
    dispatch_once(&initTLToneManager_sOnce, &__block_literal_global);
  return (id)classTLToneManager;
}

Class __initTLToneManager_block_invoke()
{
  Class result;

  if (ToneLibraryLibrary_sOnce != -1)
    dispatch_once(&ToneLibraryLibrary_sOnce, &__block_literal_global_4);
  result = objc_getClass("TLToneManager");
  classTLToneManager = (uint64_t)result;
  getTLToneManagerClass = (uint64_t (*)())TLToneManagerFunction;
  return result;
}

id SOClockAlarmCreateFromMTAlarms(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v2);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          SOClockAlarmCreateFromMTAlarm(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9, (_QWORD)v12);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
      v10 = (void *)objc_msgSend(v3, "copy");
    else
      v10 = (void *)MEMORY[0x24BDBD1A8];

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

void sub_212A1C944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  id *v18;

  v18 = v10;
  objc_destroyWeak(v18);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 128));
  _Unwind_Resume(a1);
}

void sub_212A1CE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _SOClockAlarmObserverGetAlarmIDsFromAlarms(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v2);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "alarmID", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
      v10 = (void *)objc_msgSend(v3, "copy");
    else
      v10 = (void *)MEMORY[0x24BDBD1A8];

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

uint64_t SOClockTimerGetTimerStateFromMTTimer(void *a1)
{
  uint64_t result;

  result = objc_msgSend(a1, "state");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

id SOClockTimerCreateFromMTTimer(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v1 = a1;
  objc_msgSend(v1, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(v1, "state");
    v4 = (void *)MEMORY[0x24BE09158];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __SOClockTimerCreateFromMTTimer_block_invoke;
    v7[3] = &unk_24CE756B0;
    v8 = v2;
    v9 = v1;
    v10 = v3;
    v5 = (void *)objc_msgSend(v4, "newWithBuilder:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id SOClockTimerCreateFromMTTimers(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v2);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          SOClockTimerCreateFromMTTimer(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9, (_QWORD)v12);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
      v10 = (void *)objc_msgSend(v3, "copy");
    else
      v10 = (void *)MEMORY[0x24BDBD1A8];

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

uint64_t SOAlarmRepeatScheduleValidate(char a1)
{
  return a1 & 0x7F;
}

id SOAlarmRepeatScheduleGetNames(uint64_t a1)
{
  char v1;
  id v2;
  void *v3;
  void *v4;

  if (!a1)
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
    return v4;
  }
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = v2;
  if ((v1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("monday"));
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("tuesday"));
  if ((v1 & 4) == 0)
  {
LABEL_5:
    if ((v1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "addObject:", CFSTR("wednesday"));
  if ((v1 & 8) == 0)
  {
LABEL_6:
    if ((v1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "addObject:", CFSTR("thursday"));
  if ((v1 & 0x10) == 0)
  {
LABEL_7:
    if ((v1 & 0x20) == 0)
      goto LABEL_8;
LABEL_18:
    objc_msgSend(v3, "addObject:", CFSTR("saturday"));
    if ((v1 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  objc_msgSend(v3, "addObject:", CFSTR("friday"));
  if ((v1 & 0x20) != 0)
    goto LABEL_18;
LABEL_8:
  if ((v1 & 0x40) != 0)
LABEL_9:
    objc_msgSend(v3, "addObject:", CFSTR("sunday"));
LABEL_10:
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

uint64_t SOAlarmRepeatScheduleGetFromNames(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = v1;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v2);
          v8 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v7);
          if (objc_msgSend(v8, "length"))
          {
            if (_SOAlarmRepeatScheduleGetFromName_onceToken != -1)
              dispatch_once(&_SOAlarmRepeatScheduleGetFromName_onceToken, &__block_literal_global_29);
            objc_msgSend((id)_SOAlarmRepeatScheduleGetFromName_map, "objectForKey:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "unsignedIntegerValue");

          }
          else
          {
            v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

    v1 = v12;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id initMTAlarmManagerAlarmsChanged()
{
  if (initMTAlarmManagerAlarmsChanged_sOnce != -1)
    dispatch_once(&initMTAlarmManagerAlarmsChanged_sOnce, &__block_literal_global_46);
  return (id)constantMTAlarmManagerAlarmsChanged;
}

void __initMTAlarmManagerAlarmsChanged_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsChanged");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsChanged, *v0);
  getMTAlarmManagerAlarmsChanged = (uint64_t)MTAlarmManagerAlarmsChangedFunction;
}

id MTAlarmManagerAlarmsChangedFunction()
{
  return (id)constantMTAlarmManagerAlarmsChanged;
}

id initMTAlarmManagerStateReset()
{
  if (initMTAlarmManagerStateReset_sOnce != -1)
    dispatch_once(&initMTAlarmManagerStateReset_sOnce, &__block_literal_global_44);
  return (id)constantMTAlarmManagerStateReset;
}

void __initMTAlarmManagerStateReset_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerStateReset");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerStateReset, *v0);
  getMTAlarmManagerStateReset = (uint64_t)MTAlarmManagerStateResetFunction;
}

id MTAlarmManagerStateResetFunction()
{
  return (id)constantMTAlarmManagerStateReset;
}

id initMTAlarmManagerFiringAlarmChanged()
{
  if (initMTAlarmManagerFiringAlarmChanged_sOnce != -1)
    dispatch_once(&initMTAlarmManagerFiringAlarmChanged_sOnce, &__block_literal_global_42);
  return (id)constantMTAlarmManagerFiringAlarmChanged;
}

void __initMTAlarmManagerFiringAlarmChanged_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerFiringAlarmChanged");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmChanged, *v0);
  getMTAlarmManagerFiringAlarmChanged = (uint64_t)MTAlarmManagerFiringAlarmChangedFunction;
}

id MTAlarmManagerFiringAlarmChangedFunction()
{
  return (id)constantMTAlarmManagerFiringAlarmChanged;
}

id initMTAlarmManagerFiringAlarmDismissed()
{
  if (initMTAlarmManagerFiringAlarmDismissed_sOnce != -1)
    dispatch_once(&initMTAlarmManagerFiringAlarmDismissed_sOnce, &__block_literal_global_40);
  return (id)constantMTAlarmManagerFiringAlarmDismissed;
}

void __initMTAlarmManagerFiringAlarmDismissed_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerFiringAlarmDismissed");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmDismissed, *v0);
  getMTAlarmManagerFiringAlarmDismissed = (uint64_t)MTAlarmManagerFiringAlarmDismissedFunction;
}

id MTAlarmManagerFiringAlarmDismissedFunction()
{
  return (id)constantMTAlarmManagerFiringAlarmDismissed;
}

id initMTAlarmManagerAlarmFired()
{
  if (initMTAlarmManagerAlarmFired_sOnce != -1)
    dispatch_once(&initMTAlarmManagerAlarmFired_sOnce, &__block_literal_global_38);
  return (id)constantMTAlarmManagerAlarmFired;
}

void __initMTAlarmManagerAlarmFired_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmFired");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmFired, *v0);
  getMTAlarmManagerAlarmFired = (uint64_t)MTAlarmManagerAlarmFiredFunction;
}

id MTAlarmManagerAlarmFiredFunction()
{
  return (id)constantMTAlarmManagerAlarmFired;
}

id initMTAlarmManagerAlarmsRemoved()
{
  if (initMTAlarmManagerAlarmsRemoved_sOnce != -1)
    dispatch_once(&initMTAlarmManagerAlarmsRemoved_sOnce, &__block_literal_global_36);
  return (id)constantMTAlarmManagerAlarmsRemoved;
}

void __initMTAlarmManagerAlarmsRemoved_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsRemoved");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsRemoved, *v0);
  getMTAlarmManagerAlarmsRemoved = (uint64_t)MTAlarmManagerAlarmsRemovedFunction;
}

id MTAlarmManagerAlarmsRemovedFunction()
{
  return (id)constantMTAlarmManagerAlarmsRemoved;
}

id initMTAlarmManagerAlarmsUpdated()
{
  if (initMTAlarmManagerAlarmsUpdated_sOnce != -1)
    dispatch_once(&initMTAlarmManagerAlarmsUpdated_sOnce, &__block_literal_global_34);
  return (id)constantMTAlarmManagerAlarmsUpdated;
}

void __initMTAlarmManagerAlarmsUpdated_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsUpdated");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsUpdated, *v0);
  getMTAlarmManagerAlarmsUpdated = (uint64_t)MTAlarmManagerAlarmsUpdatedFunction;
}

id MTAlarmManagerAlarmsUpdatedFunction()
{
  return (id)constantMTAlarmManagerAlarmsUpdated;
}

id initMTAlarmManagerAlarmsAdded()
{
  if (initMTAlarmManagerAlarmsAdded_sOnce != -1)
    dispatch_once(&initMTAlarmManagerAlarmsAdded_sOnce, &__block_literal_global_32);
  return (id)constantMTAlarmManagerAlarmsAdded;
}

void __initMTAlarmManagerAlarmsAdded_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsAdded");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsAdded, *v0);
  getMTAlarmManagerAlarmsAdded = (uint64_t)MTAlarmManagerAlarmsAddedFunction;
}

id MTAlarmManagerAlarmsAddedFunction()
{
  return (id)constantMTAlarmManagerAlarmsAdded;
}

id MTAlarmManagerAlarmsKeyFunction()
{
  return (id)constantMTAlarmManagerAlarmsKey;
}

id initMTAlarmManagerAlarmsKey()
{
  if (initMTAlarmManagerAlarmsKey_sOnce != -1)
    dispatch_once(&initMTAlarmManagerAlarmsKey_sOnce, &__block_literal_global_51);
  return (id)constantMTAlarmManagerAlarmsKey;
}

id MTAlarmFunction()
{
  return (id)classMTAlarm;
}

id initMTAlarm()
{
  if (initMTAlarm_sOnce != -1)
    dispatch_once(&initMTAlarm_sOnce, &__block_literal_global_53);
  return (id)classMTAlarm;
}

Class __initMTAlarm_block_invoke()
{
  Class result;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  result = objc_getClass("MTAlarm");
  classMTAlarm = (uint64_t)result;
  getMTAlarmClass = MTAlarmFunction;
  return result;
}

void __initMTAlarmManagerAlarmsKey_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib, "MTAlarmManagerAlarmsKey");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsKey, *v0);
  getMTAlarmManagerAlarmsKey = MTAlarmManagerAlarmsKeyFunction;
}

id MTAlarmManagerFunction()
{
  return (id)classMTAlarmManager;
}

id initMTAlarmManager()
{
  if (initMTAlarmManager_sOnce != -1)
    dispatch_once(&initMTAlarmManager_sOnce, &__block_literal_global_54);
  return (id)classMTAlarmManager;
}

Class __initMTAlarmManager_block_invoke()
{
  Class result;

  if (MobileTimerLibrary_sOnce != -1)
    dispatch_once(&MobileTimerLibrary_sOnce, &__block_literal_global_30);
  result = objc_getClass("MTAlarmManager");
  classMTAlarmManager = (uint64_t)result;
  getMTAlarmManagerClass = MTAlarmManagerFunction;
  return result;
}

BOOL SOTimerTypeGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SOTimerTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *SOTimerTypeGetName(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_24CE757B8[a1];
}

uint64_t SOTimerTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SOTimerTypeGetFromName_onceToken != -1)
      dispatch_once(&SOTimerTypeGetFromName_onceToken, &__block_literal_global_66);
    objc_msgSend((id)SOTimerTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id MTAlarmManagerAlarmsAddedFunction_102()
{
  return (id)constantMTAlarmManagerAlarmsAdded_144;
}

id initMTAlarmManagerAlarmsAdded_103()
{
  if (initMTAlarmManagerAlarmsAdded_sOnce_143 != -1)
    dispatch_once(&initMTAlarmManagerAlarmsAdded_sOnce_143, &__block_literal_global_61);
  return (id)constantMTAlarmManagerAlarmsAdded_144;
}

id MTAlarmManagerAlarmsUpdatedFunction_105()
{
  return (id)constantMTAlarmManagerAlarmsUpdated_141;
}

id initMTAlarmManagerAlarmsUpdated_106()
{
  if (initMTAlarmManagerAlarmsUpdated_sOnce_140 != -1)
    dispatch_once(&initMTAlarmManagerAlarmsUpdated_sOnce_140, &__block_literal_global_63);
  return (id)constantMTAlarmManagerAlarmsUpdated_141;
}

id MTAlarmManagerAlarmsRemovedFunction_108()
{
  return (id)constantMTAlarmManagerAlarmsRemoved_138;
}

id initMTAlarmManagerAlarmsRemoved_109()
{
  if (initMTAlarmManagerAlarmsRemoved_sOnce_137 != -1)
    dispatch_once(&initMTAlarmManagerAlarmsRemoved_sOnce_137, &__block_literal_global_65);
  return (id)constantMTAlarmManagerAlarmsRemoved_138;
}

id MTAlarmManagerAlarmFiredFunction_111()
{
  return (id)constantMTAlarmManagerAlarmFired_135;
}

id initMTAlarmManagerAlarmFired_112()
{
  if (initMTAlarmManagerAlarmFired_sOnce_134 != -1)
    dispatch_once(&initMTAlarmManagerAlarmFired_sOnce_134, &__block_literal_global_67);
  return (id)constantMTAlarmManagerAlarmFired_135;
}

id MTAlarmManagerFiringAlarmChangedFunction_114()
{
  return (id)constantMTAlarmManagerFiringAlarmChanged_132;
}

id initMTAlarmManagerFiringAlarmChanged_115()
{
  if (initMTAlarmManagerFiringAlarmChanged_sOnce_131 != -1)
    dispatch_once(&initMTAlarmManagerFiringAlarmChanged_sOnce_131, &__block_literal_global_69);
  return (id)constantMTAlarmManagerFiringAlarmChanged_132;
}

id MTAlarmManagerFiringAlarmDismissedFunction_117()
{
  return (id)constantMTAlarmManagerFiringAlarmDismissed_129;
}

id initMTAlarmManagerFiringAlarmDismissed_118()
{
  if (initMTAlarmManagerFiringAlarmDismissed_sOnce_128 != -1)
    dispatch_once(&initMTAlarmManagerFiringAlarmDismissed_sOnce_128, &__block_literal_global_71);
  return (id)constantMTAlarmManagerFiringAlarmDismissed_129;
}

id MTAlarmManagerStateResetFunction_120()
{
  return (id)constantMTAlarmManagerStateReset_123;
}

id initMTAlarmManagerStateReset_121()
{
  if (initMTAlarmManagerStateReset_sOnce_122 != -1)
    dispatch_once(&initMTAlarmManagerStateReset_sOnce_122, &__block_literal_global_73);
  return (id)constantMTAlarmManagerStateReset_123;
}

void __initMTAlarmManagerStateReset_block_invoke_124()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_126, "MTAlarmManagerStateReset");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerStateReset_123, *v0);
  getMTAlarmManagerStateReset_119 = MTAlarmManagerStateResetFunction_120;
}

void __initMTAlarmManagerFiringAlarmDismissed_block_invoke_130()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_126, "MTAlarmManagerFiringAlarmDismissed");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmDismissed_129, *v0);
  getMTAlarmManagerFiringAlarmDismissed_116 = MTAlarmManagerFiringAlarmDismissedFunction_117;
}

void __initMTAlarmManagerFiringAlarmChanged_block_invoke_133()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_126, "MTAlarmManagerFiringAlarmChanged");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerFiringAlarmChanged_132, *v0);
  getMTAlarmManagerFiringAlarmChanged_113 = MTAlarmManagerFiringAlarmChangedFunction_114;
}

void __initMTAlarmManagerAlarmFired_block_invoke_136()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_126, "MTAlarmManagerAlarmFired");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmFired_135, *v0);
  getMTAlarmManagerAlarmFired_110 = MTAlarmManagerAlarmFiredFunction_111;
}

void __initMTAlarmManagerAlarmsRemoved_block_invoke_139()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_126, "MTAlarmManagerAlarmsRemoved");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsRemoved_138, *v0);
  getMTAlarmManagerAlarmsRemoved_107 = MTAlarmManagerAlarmsRemovedFunction_108;
}

void __initMTAlarmManagerAlarmsUpdated_block_invoke_142()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_126, "MTAlarmManagerAlarmsUpdated");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsUpdated_141, *v0);
  getMTAlarmManagerAlarmsUpdated_104 = MTAlarmManagerAlarmsUpdatedFunction_105;
}

void __initMTAlarmManagerAlarmsAdded_block_invoke_145()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_126, "MTAlarmManagerAlarmsAdded");
  if (v0)
    objc_storeStrong((id *)&constantMTAlarmManagerAlarmsAdded_144, *v0);
  getMTAlarmManagerAlarmsAdded_101 = MTAlarmManagerAlarmsAddedFunction_102;
}

id MTAlarmManagerFunction_152()
{
  return (id)classMTAlarmManager_158;
}

id initMTAlarmManager_153()
{
  if (initMTAlarmManager_sOnce_156 != -1)
    dispatch_once(&initMTAlarmManager_sOnce_156, &__block_literal_global_157);
  return (id)classMTAlarmManager_158;
}

Class __initMTAlarmManager_block_invoke_159()
{
  Class result;

  if (MobileTimerLibrary_sOnce_125 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_125, &__block_literal_global_59);
  result = objc_getClass("MTAlarmManager");
  classMTAlarmManager_158 = (uint64_t)result;
  getMTAlarmManagerClass_151 = MTAlarmManagerFunction_152;
  return result;
}

void sub_212A23904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212A23B90(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_212A26D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;
  id *v18;

  v18 = v10;
  objc_destroyWeak(v18);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 128));
  _Unwind_Resume(a1);
}

void sub_212A2723C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _SOClockTimerObserverGetTimerIDsFromTimers(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v2);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "timerID", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
      v10 = (void *)objc_msgSend(v3, "copy");
    else
      v10 = (void *)MEMORY[0x24BDBD1A8];

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v10;
}

BOOL SOTimerStateGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SOTimerStateGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

const __CFString *SOTimerStateGetName(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_24CE75D08[a1];
}

uint64_t SOTimerStateGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SOTimerStateGetFromName_onceToken != -1)
      dispatch_once(&SOTimerStateGetFromName_onceToken, &__block_literal_global_557);
    objc_msgSend((id)SOTimerStateGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id MTTimerManagerTimersAddedFunction()
{
  return (id)constantMTTimerManagerTimersAdded;
}

id initMTTimerManagerTimersAdded()
{
  if (initMTTimerManagerTimersAdded_sOnce != -1)
    dispatch_once(&initMTTimerManagerTimersAdded_sOnce, &__block_literal_global_58);
  return (id)constantMTTimerManagerTimersAdded;
}

id MTTimerManagerTimersUpdatedFunction()
{
  return (id)constantMTTimerManagerTimersUpdated;
}

id initMTTimerManagerTimersUpdated()
{
  if (initMTTimerManagerTimersUpdated_sOnce != -1)
    dispatch_once(&initMTTimerManagerTimersUpdated_sOnce, &__block_literal_global_60);
  return (id)constantMTTimerManagerTimersUpdated;
}

id MTTimerManagerTimersRemovedFunction()
{
  return (id)constantMTTimerManagerTimersRemoved;
}

id initMTTimerManagerTimersRemoved()
{
  if (initMTTimerManagerTimersRemoved_sOnce != -1)
    dispatch_once(&initMTTimerManagerTimersRemoved_sOnce, &__block_literal_global_62);
  return (id)constantMTTimerManagerTimersRemoved;
}

id MTTimerManagerTimerFiredFunction()
{
  return (id)constantMTTimerManagerTimerFired;
}

id initMTTimerManagerTimerFired()
{
  if (initMTTimerManagerTimerFired_sOnce != -1)
    dispatch_once(&initMTTimerManagerTimerFired_sOnce, &__block_literal_global_64);
  return (id)constantMTTimerManagerTimerFired;
}

id MTTimerManagerFiringTimerChangedFunction()
{
  return (id)constantMTTimerManagerFiringTimerChanged;
}

id initMTTimerManagerFiringTimerChanged()
{
  if (initMTTimerManagerFiringTimerChanged_sOnce != -1)
    dispatch_once(&initMTTimerManagerFiringTimerChanged_sOnce, &__block_literal_global_66_872);
  return (id)constantMTTimerManagerFiringTimerChanged;
}

id MTTimerManagerFiringTimerDismissedFunction()
{
  return (id)constantMTTimerManagerFiringTimerDismissed;
}

id initMTTimerManagerFiringTimerDismissed()
{
  if (initMTTimerManagerFiringTimerDismissed_sOnce != -1)
    dispatch_once(&initMTTimerManagerFiringTimerDismissed_sOnce, &__block_literal_global_68);
  return (id)constantMTTimerManagerFiringTimerDismissed;
}

id MTTimerManagerStateResetFunction()
{
  return (id)constantMTTimerManagerStateReset;
}

id initMTTimerManagerStateReset()
{
  if (initMTTimerManagerStateReset_sOnce != -1)
    dispatch_once(&initMTTimerManagerStateReset_sOnce, &__block_literal_global_70);
  return (id)constantMTTimerManagerStateReset;
}

void __initMTTimerManagerStateReset_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_870, "MTTimerManagerStateReset");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerStateReset, *v0);
  getMTTimerManagerStateReset = MTTimerManagerStateResetFunction;
}

void __initMTTimerManagerFiringTimerDismissed_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_870, "MTTimerManagerFiringTimerDismissed");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerDismissed, *v0);
  getMTTimerManagerFiringTimerDismissed = MTTimerManagerFiringTimerDismissedFunction;
}

void __initMTTimerManagerFiringTimerChanged_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_870, "MTTimerManagerFiringTimerChanged");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerChanged, *v0);
  getMTTimerManagerFiringTimerChanged = MTTimerManagerFiringTimerChangedFunction;
}

void __initMTTimerManagerTimerFired_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_870, "MTTimerManagerTimerFired");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimerFired, *v0);
  getMTTimerManagerTimerFired = MTTimerManagerTimerFiredFunction;
}

void __initMTTimerManagerTimersRemoved_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_870, "MTTimerManagerTimersRemoved");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersRemoved, *v0);
  getMTTimerManagerTimersRemoved = MTTimerManagerTimersRemovedFunction;
}

void __initMTTimerManagerTimersUpdated_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_870, "MTTimerManagerTimersUpdated");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersUpdated, *v0);
  getMTTimerManagerTimersUpdated = MTTimerManagerTimersUpdatedFunction;
}

void __initMTTimerManagerTimersAdded_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_870, "MTTimerManagerTimersAdded");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersAdded, *v0);
  getMTTimerManagerTimersAdded = MTTimerManagerTimersAddedFunction;
}

id MTTimerManagerFunction()
{
  return (id)classMTTimerManager;
}

id initMTTimerManager()
{
  if (initMTTimerManager_sOnce != -1)
    dispatch_once(&initMTTimerManager_sOnce, &__block_literal_global_882);
  return (id)classMTTimerManager;
}

Class __initMTTimerManager_block_invoke()
{
  Class result;

  if (MobileTimerLibrary_sOnce_869 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_869, &__block_literal_global_56);
  result = objc_getClass("MTTimerManager");
  classMTTimerManager = (uint64_t)result;
  getMTTimerManagerClass = MTTimerManagerFunction;
  return result;
}

id initMTTimerManagerStateReset_922()
{
  if (initMTTimerManagerStateReset_sOnce_923 != -1)
    dispatch_once(&initMTTimerManagerStateReset_sOnce_923, &__block_literal_global_47);
  return (id)constantMTTimerManagerStateReset_924;
}

void __initMTTimerManagerStateReset_block_invoke_925()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerStateReset");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerStateReset_924, *v0);
  getMTTimerManagerStateReset_921 = (uint64_t)MTTimerManagerStateResetFunction_928;
}

id MTTimerManagerStateResetFunction_928()
{
  return (id)constantMTTimerManagerStateReset_924;
}

id initMTTimerManagerTimersChanged()
{
  if (initMTTimerManagerTimersChanged_sOnce != -1)
    dispatch_once(&initMTTimerManagerTimersChanged_sOnce, &__block_literal_global_45);
  return (id)constantMTTimerManagerTimersChanged;
}

void __initMTTimerManagerTimersChanged_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerTimersChanged");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersChanged, *v0);
  getMTTimerManagerTimersChanged = (uint64_t)MTTimerManagerTimersChangedFunction;
}

id MTTimerManagerTimersChangedFunction()
{
  return (id)constantMTTimerManagerTimersChanged;
}

id initMTTimerManagerFiringTimerDismissed_932()
{
  if (initMTTimerManagerFiringTimerDismissed_sOnce_933 != -1)
    dispatch_once(&initMTTimerManagerFiringTimerDismissed_sOnce_933, &__block_literal_global_43);
  return (id)constantMTTimerManagerFiringTimerDismissed_934;
}

void __initMTTimerManagerFiringTimerDismissed_block_invoke_935()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerFiringTimerDismissed");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerDismissed_934, *v0);
  getMTTimerManagerFiringTimerDismissed_920 = (uint64_t)MTTimerManagerFiringTimerDismissedFunction_936;
}

id MTTimerManagerFiringTimerDismissedFunction_936()
{
  return (id)constantMTTimerManagerFiringTimerDismissed_934;
}

id initMTTimerManagerFiringTimerChanged_937()
{
  if (initMTTimerManagerFiringTimerChanged_sOnce_938 != -1)
    dispatch_once(&initMTTimerManagerFiringTimerChanged_sOnce_938, &__block_literal_global_41);
  return (id)constantMTTimerManagerFiringTimerChanged_939;
}

void __initMTTimerManagerFiringTimerChanged_block_invoke_940()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerFiringTimerChanged");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerFiringTimerChanged_939, *v0);
  getMTTimerManagerFiringTimerChanged_919 = (uint64_t)MTTimerManagerFiringTimerChangedFunction_941;
}

id MTTimerManagerFiringTimerChangedFunction_941()
{
  return (id)constantMTTimerManagerFiringTimerChanged_939;
}

id initMTTimerManagerTimerFired_942()
{
  if (initMTTimerManagerTimerFired_sOnce_943 != -1)
    dispatch_once(&initMTTimerManagerTimerFired_sOnce_943, &__block_literal_global_39);
  return (id)constantMTTimerManagerTimerFired_944;
}

void __initMTTimerManagerTimerFired_block_invoke_945()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerTimerFired");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimerFired_944, *v0);
  getMTTimerManagerTimerFired_918 = (uint64_t)MTTimerManagerTimerFiredFunction_946;
}

id MTTimerManagerTimerFiredFunction_946()
{
  return (id)constantMTTimerManagerTimerFired_944;
}

id initMTTimerManagerTimersRemoved_947()
{
  if (initMTTimerManagerTimersRemoved_sOnce_948 != -1)
    dispatch_once(&initMTTimerManagerTimersRemoved_sOnce_948, &__block_literal_global_37);
  return (id)constantMTTimerManagerTimersRemoved_949;
}

void __initMTTimerManagerTimersRemoved_block_invoke_950()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerTimersRemoved");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersRemoved_949, *v0);
  getMTTimerManagerTimersRemoved_917 = (uint64_t)MTTimerManagerTimersRemovedFunction_951;
}

id MTTimerManagerTimersRemovedFunction_951()
{
  return (id)constantMTTimerManagerTimersRemoved_949;
}

id initMTTimerManagerTimersUpdated_952()
{
  if (initMTTimerManagerTimersUpdated_sOnce_953 != -1)
    dispatch_once(&initMTTimerManagerTimersUpdated_sOnce_953, &__block_literal_global_35);
  return (id)constantMTTimerManagerTimersUpdated_954;
}

void __initMTTimerManagerTimersUpdated_block_invoke_955()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerTimersUpdated");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersUpdated_954, *v0);
  getMTTimerManagerTimersUpdated_916 = (uint64_t)MTTimerManagerTimersUpdatedFunction_957;
}

id MTTimerManagerTimersUpdatedFunction_957()
{
  return (id)constantMTTimerManagerTimersUpdated_954;
}

id initMTTimerManagerTimersAdded_958()
{
  if (initMTTimerManagerTimersAdded_sOnce_959 != -1)
    dispatch_once(&initMTTimerManagerTimersAdded_sOnce_959, &__block_literal_global_33);
  return (id)constantMTTimerManagerTimersAdded_960;
}

void __initMTTimerManagerTimersAdded_block_invoke_961()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerTimersAdded");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersAdded_960, *v0);
  getMTTimerManagerTimersAdded_915 = (uint64_t)MTTimerManagerTimersAddedFunction_962;
}

id MTTimerManagerTimersAddedFunction_962()
{
  return (id)constantMTTimerManagerTimersAdded_960;
}

id initMTTimerManagerTimersKey()
{
  if (initMTTimerManagerTimersKey_sOnce != -1)
    dispatch_once(&initMTTimerManagerTimersKey_sOnce, &__block_literal_global_52);
  return (id)constantMTTimerManagerTimersKey;
}

id MTTimerFunction()
{
  return (id)classMTTimer;
}

Class __initMTTimer_block_invoke()
{
  Class result;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  result = objc_getClass("MTTimer");
  classMTTimer = (uint64_t)result;
  getMTTimerClass = MTTimerFunction;
  return result;
}

void __initMTTimerManagerTimersKey_block_invoke()
{
  id *v0;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  v0 = (id *)dlsym((void *)MobileTimerLibrary_sLib_927, "MTTimerManagerTimersKey");
  if (v0)
    objc_storeStrong((id *)&constantMTTimerManagerTimersKey, *v0);
  getMTTimerManagerTimersKey = MTTimerManagerTimersKeyFunction;
}

id MTTimerManagerFunction_972()
{
  return (id)classMTTimerManager_978;
}

id initMTTimerManager_973()
{
  if (initMTTimerManager_sOnce_976 != -1)
    dispatch_once(&initMTTimerManager_sOnce_976, &__block_literal_global_977);
  return (id)classMTTimerManager_978;
}

Class __initMTTimerManager_block_invoke_979()
{
  Class result;

  if (MobileTimerLibrary_sOnce_926 != -1)
    dispatch_once(&MobileTimerLibrary_sOnce_926, &__block_literal_global_31);
  result = objc_getClass("MTTimerManager");
  classMTTimerManager_978 = (uint64_t)result;
  getMTTimerManagerClass_971 = MTTimerManagerFunction_972;
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t AFClockAlarmManagerEventGetName()
{
  return MEMORY[0x24BE08BF8]();
}

uint64_t AFClockTimerManagerEventGetName()
{
  return MEMORY[0x24BE08C00]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x24BE08E18]();
}

uint64_t AFMediaPlaybackStateGetIsValidAndSpecified()
{
  return MEMORY[0x24BE08E20]();
}

uint64_t AFMediaPlaybackStateGetName()
{
  return MEMORY[0x24BE08E28]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MRMediaRemoteCopyDeviceInfo()
{
  return MEMORY[0x24BE650D0]();
}

uint64_t MRMediaRemoteCopyPlaybackStateDescription()
{
  return MEMORY[0x24BE650E8]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x24BE65110]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x24BE65148]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x24BE65270]();
}

uint64_t MRPairedDeviceIsProxyGroupPlayer()
{
  return MEMORY[0x24BE65358]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t _AFGetNowPlayingApplicationIdentifier()
{
  return MEMORY[0x24BE093E0]();
}

uint64_t _AFGetNowPlayingInfoDictionary()
{
  return MEMORY[0x24BE093E8]();
}

uint64_t _AFGetPlaybackState()
{
  return MEMORY[0x24BE093F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

