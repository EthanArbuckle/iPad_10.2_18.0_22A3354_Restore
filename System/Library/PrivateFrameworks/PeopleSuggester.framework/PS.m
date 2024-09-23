@implementation PS

uint64_t __59___PS_TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __59___PS_TPSDiscoverabilitySignal_donateSignalWithCompletion___block_invoke_2(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (a2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[4], CFSTR("signalIdentifier"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[5], CFSTR("sourceBundleIdentifier"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", a1[6], CFSTR("context"));
    objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/discoverability/signals/dataDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

    v5 = v11;
  }
  v9 = a1[7];
  if (v9)
  {
    v10 = v11;
    if (a2)
      v10 = 0;
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
    v5 = v11;
  }

}

void __47___PS_TPSDiscoverabilitySignal__knowledgeStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_knowledgeStore_store;
  _knowledgeStore_store = v0;

}

@end
