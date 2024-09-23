@implementation REPortraitPredictor

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REPortraitPredictor;
  v2 = -[REPredictor _init](&v7, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[9];
    v2[9] = v3;

    objc_msgSend(v2, "_loadStoreIfNeeded");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__loadStoreIfNeeded, CFSTR("REDeviceLockStateChangedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("REDeviceLockStateChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)REPortraitPredictor;
  -[REPredictor dealloc](&v4, sel_dealloc);
}

+ (double)updateInterval
{
  return 10800.0;
}

- (void)_loadStoreIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__REPortraitPredictor__loadStoreIfNeeded__block_invoke;
  v2[3] = &unk_24CF8AAF0;
  v2[4] = self;
  -[REPredictor onQueue:](self, "onQueue:", v2);
}

uint64_t __41__REPortraitPredictor__loadStoreIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = REDeviceUnlockedSinceBoot();
  if ((_DWORD)result && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    if (!PersonalizationPortraitLibraryCore_frameworkLibrary)
    {
      v12 = xmmword_24CF91570;
      v13 = 0;
      result = _sl_dlopen();
      PersonalizationPortraitLibraryCore_frameworkLibrary = result;
    }
    if (PersonalizationPortraitLibraryCore_frameworkLibrary)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x2050000000;
      v3 = (void *)getPPNamedEntityStoreClass_softClass;
      v11 = getPPNamedEntityStoreClass_softClass;
      if (!getPPNamedEntityStoreClass_softClass)
      {
        *(_QWORD *)&v12 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v12 + 1) = 3221225472;
        v13 = __getPPNamedEntityStoreClass_block_invoke;
        v14 = &unk_24CF8AC38;
        v15 = &v8;
        __getPPNamedEntityStoreClass_block_invoke((uint64_t)&v12);
        v3 = (void *)v9[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v8, 8);
      objc_msgSend(v4, "defaultStore", v8);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 64);
      *(_QWORD *)(v6 + 64) = v5;

      return objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
  }
  return result;
}

- (void)update
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Unable to load named entities: %@", (uint8_t *)&v2, 0xCu);
}

void __29__REPortraitPredictor_update__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "score");
  v7 = v6;

  objc_msgSend(v5, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKeyedSubscript:", v8, v14);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v11 + 24))
    v12 = 1;
  else
    v12 = v9 == 0;
  if (v12)
  {
    v13 = 1;
  }
  else
  {
    v13 = objc_msgSend(v9, "isEqualToNumber:", v8) ^ 1;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_BYTE *)(v11 + 24) = v13;

}

- (float)userAffinityToContent:(id)a3
{
  id v4;
  uint64_t v5;
  float v6;
  _QWORD v8[7];
  uint64_t v9;
  float *v10;
  uint64_t v11;
  int v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v9 = 0;
    v10 = (float *)&v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__REPortraitPredictor_userAffinityToContent___block_invoke;
    v8[3] = &unk_24CF91550;
    v8[5] = &v9;
    v8[6] = v5;
    v8[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
    v6 = v10[6];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

void __45__REPortraitPredictor_userAffinityToContent___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  float v4;
  float v5;
  id v6;

  v4 = (float)(unint64_t)(a1[6] - a3);
  objc_msgSend(*(id *)(a1[4] + 72), "objectForKeyedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = (float)((float)(v5 * v4) / (float)(unint64_t)a1[6])
                                              + *(float *)(*(_QWORD *)(a1[5] + 8) + 24);

}

- (NSDictionary)namedEntityScores
{
  return (NSDictionary *)self->_namedEntityScores;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityScores, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

@end
