@implementation REEngineDefaults

void __35___REEngineDefaults_globalDefaults__block_invoke()
{
  _REEngineDefaults *v0;
  void *v1;

  v0 = -[_REEngineDefaults initWithDomain:]([_REEngineDefaults alloc], "initWithDomain:", CFSTR("com.apple.RelevanceEngine"));
  v1 = (void *)globalDefaults_GlobalDefaults;
  globalDefaults_GlobalDefaults = (uint64_t)v0;

}

void __46___REEngineDefaults__registerCallback_forKey___block_invoke(_QWORD *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1[4] + 24), "containsObject:", a1[5]);
  v4 = a1[4];
  v3 = a1[5];
  if (v2)
  {
    objc_msgSend(*(id *)(v4 + 32), "objectForKeyedSubscript:", v3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x2199B2434](a1[6]);
    objc_msgSend(v9, "addObject:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(v4 + 24), "addObject:", v3);
    v6 = (void *)MEMORY[0x24BDBCEB8];
    v7 = (void *)MEMORY[0x2199B2434](a1[6]);
    objc_msgSend(v6, "arrayWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v8, a1[5]);

    objc_msgSend(*(id *)(a1[4] + 16), "addObserver:forKeyPath:options:context:", a1[4], a1[5], 1, REPreferenceContext);
  }
}

void __68___REEngineDefaults_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++) + 16))();
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

@end
