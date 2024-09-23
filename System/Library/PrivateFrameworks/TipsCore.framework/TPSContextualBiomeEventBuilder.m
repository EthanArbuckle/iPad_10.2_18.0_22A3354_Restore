@implementation TPSContextualBiomeEventBuilder

+ (id)contextualBiomeEventFromDictionary:(id)a3
{
  id v3;
  void *v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  +[TPSContextualBiomeEvent streamFromDictionary:](TPSContextualBiomeEvent, "streamFromDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("App.InFocus")) & 1) != 0)
  {
    v5 = off_1E395A540;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("AppLaunch")) & 1) != 0)
  {
    v5 = off_1E395A548;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Device.Wireless.Bluetooth")) & 1) != 0)
  {
    v5 = off_1E395A550;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Discoverability.Signals")) & 1) != 0)
  {
    v5 = off_1E395A558;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("UserFocusComputedMode")))
    {
      v6 = 0;
      goto LABEL_12;
    }
    v5 = off_1E395A570;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithDictionary:", v3);
LABEL_12:

  return v6;
}

+ (id)contextualBiomeEventFromDuetEventDictionary:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  TPSContextualBiomeDiscoverabilitySignalsEvent *v13;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stream"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("/discoverability/signals"));

  if (v5)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Discoverability.Signals"), CFSTR("stream"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

    v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__TPSContextualBiomeEventBuilder_contextualBiomeEventFromDuetEventDictionary___block_invoke;
    v15[3] = &unk_1E395BDA0;
    v16 = v8;
    v11 = v8;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("value"));
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("filter"));

    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);
    v13 = -[TPSContextualBiomeEvent initWithDictionary:]([TPSContextualBiomeDiscoverabilitySignalsEvent alloc], "initWithDictionary:", v6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __78__TPSContextualBiomeEventBuilder_contextualBiomeEventFromDuetEventDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const __CFString *v6;
  __CFString *v7;

  v7 = a2;
  v5 = a3;
  if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("stringValue")))
    v6 = CFSTR("contentIdentifier");
  else
    v6 = v7;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __78__TPSContextualBiomeEventBuilder_contextualBiomeEventFromDuetEventDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSLog(CFSTR("%@, %@"), a2, a3);
}

@end
