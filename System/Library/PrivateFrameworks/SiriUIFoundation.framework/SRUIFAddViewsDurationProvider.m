@implementation SRUIFAddViewsDurationProvider

+ (double)minimumDisplayDurationForAddViews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  double v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BE091B0];
  objc_msgSend(v4, "dialogPhase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialogPhaseForAceDialogPhase:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if ((objc_msgSend(v7, "isExpository") & 1) != 0)
    goto LABEL_30;
  objc_msgSend(v4, "views");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    goto LABEL_30;
  objc_msgSend(a1, "internalDurationOverride");
  v8 = v11;
  if (v11 != 9.22337204e18)
    goto LABEL_30;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v4, "views");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (!v12)
  {
    v14 = 0;
    goto LABEL_23;
  }
  v13 = v12;
  v14 = 0;
  v32 = *(_QWORD *)v34;
  v8 = 0.0;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v34 != v32)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v16, "listenAfterSpeaking");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if ((v18 & 1) != 0 || (objc_msgSend(v16, "sruif_hasButton") & 1) != 0)
        goto LABEL_29;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "postDialogDelayInMilliseconds");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v16, "postDialogDelayInMilliseconds");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          v8 = v29 / 1000.0;

LABEL_29:
          goto LABEL_30;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v16, "text"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, v20))
      {
        objc_msgSend(v16, "text");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v16, "speakableText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          continue;
        objc_msgSend(v16, "speakableText");
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v23 = (void *)v21;
      v14 += objc_msgSend(a1, "_numberOfWordsInString:", v21);

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v13)
      continue;
    break;
  }
LABEL_23:

  v24 = fmin((double)v14 / 2.83333333, 4.0);
  if (v24 >= 1.0)
    v8 = v24;
  else
    v8 = 1.0;
  v25 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    objc_msgSend(v4, "aceId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v38 = "+[SRUIFAddViewsDurationProvider minimumDisplayDurationForAddViews:]";
    v39 = 2048;
    v40 = v14;
    v41 = 2112;
    v42 = v27;
    v43 = 2048;
    v44 = v8;
    _os_log_impl(&dword_219F26000, v26, OS_LOG_TYPE_DEFAULT, "%s %li words in AddViews command:%@. Returning a minimum display duration of %f", buf, 0x2Au);

  }
LABEL_30:

  return v8;
}

+ (double)internalDurationOverride
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SRUIFAddViewsDurationProvider_internalDurationOverride__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (internalDurationOverride_onceToken != -1)
    dispatch_once(&internalDurationOverride_onceToken, block);
  return *(double *)&internalDurationOverride_duration;
}

uint64_t __57__SRUIFAddViewsDurationProvider_internalDurationOverride__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = AFIsInternalInstall();
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "fetchMinimumDurationFromDefaults");
  else
    v3 = 0x43E0000000000000;
  internalDurationOverride_duration = v3;
  return result;
}

+ (double)fetchMinimumDurationFromDefaults
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MinimumDurationForAddViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "doubleForKey:", CFSTR("MinimumDurationForAddViews"));
    v5 = v4;
  }
  else
  {
    v5 = 9.22337204e18;
  }

  return v5;
}

+ (id)userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
}

+ (int64_t)_numberOfWordsInString:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SRUIFAddViewsDurationProvider__numberOfWordsInString___block_invoke;
  v7[3] = &unk_24DC1A8B8;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 3, v7);
  v5 = *((int *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __56__SRUIFAddViewsDurationProvider__numberOfWordsInString___block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
