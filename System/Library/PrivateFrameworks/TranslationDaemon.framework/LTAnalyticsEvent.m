@implementation LTAnalyticsEvent

void __39___LTAnalyticsEvent_timestampWithName___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[5], "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

  }
}

void __58___LTAnalyticsEvent_addFieldsFromDictionary_internalOnly___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[5], "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __29___LTAnalyticsEvent_sendLazy__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_copyWeak(&v3, v1);
    AnalyticsSendEventLazy();
    objc_destroyWeak(&v3);
  }

}

id __29___LTAnalyticsEvent_sendLazy__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((double *)WeakRetained + 3) - *((double *)WeakRetained + 2);
    v5 = (void *)MEMORY[0x24BDBCED8];
    v14 = CFSTR("duration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "sourceLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_ltLocaleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "targetLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_ltLocaleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && v12)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("sourceLocale"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("targetLocale"));
    }
    objc_msgSend(v8, "addEntriesFromDictionary:", v3[5]);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
