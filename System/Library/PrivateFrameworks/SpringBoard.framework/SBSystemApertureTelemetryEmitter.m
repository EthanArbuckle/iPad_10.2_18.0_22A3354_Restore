@implementation SBSystemApertureTelemetryEmitter

+ (void)logTelemetryForUpdatedContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_emitPowerLogIfNecessaryWithUpdatedContext:previousContext:", v4, logTelemetryForUpdatedContext____previousContext);
  objc_msgSend(a1, "_emitCoreAnalyticsTelemetryIfNecessaryWithUpdatedContext:previousContext:", v4, logTelemetryForUpdatedContext____previousContext);
  v5 = (void *)logTelemetryForUpdatedContext____previousContext;
  logTelemetryForUpdatedContext____previousContext = (uint64_t)v4;

}

+ (void)_emitCoreAnalyticsTelemetryIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v5 = a3;
  v6 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_msgSend(v5, "elementContexts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == 1)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
    objc_msgSend(v6, "elementContexts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == 1)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    if (!_SBElementContextsMatchIdentityAndLayoutState(v10, v15)
      || !_SBElementContextsMatchIdentityAndLayoutState(v11, v16))
    {
      v17 = v10;
      v18 = v15;
      v19 = v11;
      v20 = v16;
      AnalyticsSendEventLazy();

    }
  }

}

+ (void)_emitPowerLogIfNecessaryWithUpdatedContext:(id)a3 previousContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v28 = a3;
  v5 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_msgSend(v28, "elementContexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == 1)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    objc_msgSend(v5, "elementContexts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == 1)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    if (!_SBElementContextsMatchIdentityAndLayoutState(v9, v14)
      || !_SBElementContextsMatchIdentityAndLayoutState(v10, v15))
    {
      objc_msgSend(v9, "clientIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "elementIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v9, "layoutMode");
      objc_msgSend(v10, "clientIdentifier");
      v26 = v9;
      v27 = v5;
      v19 = v11;
      v20 = v14;
      v21 = v6;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "elementIdentifier");
      v23 = v15;
      v24 = v10;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SBSystemAperturePowerLogEvent(v16, v17, v18, v22, v25);

      v10 = v24;
      v15 = v23;

      v6 = v21;
      v14 = v20;
      v11 = v19;
      v9 = v26;
      v5 = v27;

    }
  }

}

id __109__SBSystemApertureTelemetryEmitter__emitCoreAnalyticsTelemetryIfNecessaryWithUpdatedContext_previousContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;

  v2 = objc_msgSend(*(id *)(a1 + 32), "layoutMode");
  v3 = objc_msgSend(*(id *)(a1 + 40), "layoutMode");
  v4 = objc_msgSend(*(id *)(a1 + 48), "layoutMode") < 1;
  v5 = objc_msgSend(*(id *)(a1 + 56), "layoutMode");
  v6 = v5 > 0 || v4;
  v7 = v5 > 0 && v4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringBySanitizingNil:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("ClientID"));

  v12 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "elementIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringBySanitizingNil:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("ElementID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "layoutMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("LayoutMode"));

  v16 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringBySanitizingNil:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("SecondaryClientID"));

  v19 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "elementIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringBySanitizingNil:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("SecondaryElementID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "layoutMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("SecondaryLayoutMode"));

  if (v2 < 1 || v3 >= 1)
  {
    if (v2 > 0 || v3 <= 0)
    {
      v24 = CFSTR("none");
      if (v7)
        v24 = CFSTR("SecondarySessionEnded");
      if (v6)
        v23 = v24;
      else
        v23 = CFSTR("SecondarySessionBegan");
    }
    else
    {
      v23 = CFSTR("SessionEnded");
    }
  }
  else
  {
    v23 = CFSTR("SessionBegan");
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("Subevent"));
  return v8;
}

+ (void)logTelemetryForInteractionTap:(BOOL)a3 clientIdentifier:(id)a4 elementIdentifier:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  AnalyticsSendEventLazy();

}

id __101__SBSystemApertureTelemetryEmitter_logTelemetryForInteractionTap_clientIdentifier_elementIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ClientID");
  objc_msgSend(*(id *)(a1 + 48), "stringBySanitizingNil:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("ElementID");
  objc_msgSend(*(id *)(a1 + 48), "stringBySanitizingNil:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("Handled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = CFSTR("InteractionType");
  v8[2] = v4;
  v8[3] = CFSTR("tap");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)logTelemetryForInteractionLongPress:(BOOL)a3 clientIdentifier:(id)a4 elementIdentifier:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  AnalyticsSendEventLazy();

}

id __107__SBSystemApertureTelemetryEmitter_logTelemetryForInteractionLongPress_clientIdentifier_elementIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ClientID");
  objc_msgSend(*(id *)(a1 + 48), "stringBySanitizingNil:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("ElementID");
  objc_msgSend(*(id *)(a1 + 48), "stringBySanitizingNil:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("Handled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = CFSTR("InteractionType");
  v8[2] = v4;
  v8[3] = CFSTR("longPress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)logTelemetryForInteractionPanGesture:(int64_t)a3 handled:(BOOL)a4 clientIdentifier:(id)a5 elementIdentifier:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v10 = a6;
  v8 = v10;
  v9 = v7;
  AnalyticsSendEventLazy();

}

id __116__SBSystemApertureTelemetryEmitter_logTelemetryForInteractionPanGesture_handled_clientIdentifier_elementIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ClientID");
  objc_msgSend(*(id *)(a1 + 48), "stringBySanitizingNil:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("ElementID");
  objc_msgSend(*(id *)(a1 + 48), "stringBySanitizingNil:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("LayoutMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("Handled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = CFSTR("InteractionType");
  v9[3] = v5;
  v9[4] = CFSTR("pan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringBySanitizingNil:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("none");

  return v5;
}

@end
