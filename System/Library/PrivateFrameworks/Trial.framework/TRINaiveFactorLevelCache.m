@implementation TRINaiveFactorLevelCache

void __49__TRINaiveFactorLevelCache_initWithFactorLevels___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "hasFactor");
  v4 = v9;
  if (v3)
  {
    objc_msgSend(v9, "factor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "hasName"))
    {
LABEL_5:

      v4 = v9;
      goto LABEL_6;
    }
    v6 = objc_msgSend(v9, "hasLevel");

    v4 = v9;
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v9, "factor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

      goto LABEL_5;
    }
  }
LABEL_6:

}

void __60__TRINaiveFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC6B8C]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v6);

}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_factorLevels, "objectForKeyedSubscript:", a3);
}

- (TRINaiveFactorLevelCache)initWithFactorLevels:(id)a3
{
  id v4;
  TRINaiveFactorLevelCache *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *factorLevels;
  NSDictionary *v9;
  _QWORD v11[4];
  NSDictionary *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TRINaiveFactorLevelCache;
  v5 = -[TRINaiveFactorLevelCache init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__TRINaiveFactorLevelCache_initWithFactorLevels___block_invoke;
    v11[3] = &unk_1E3BFEC78;
    v7 = v6;
    v12 = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
    factorLevels = v5->_factorLevels;
    v5->_factorLevels = v7;
    v9 = v7;

  }
  return v5;
}

- (void)enumerateFactorLevelsUsingBlock:(id)a3
{
  id v4;
  NSDictionary *factorLevels;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  factorLevels = self->_factorLevels;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__TRINaiveFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke;
  v7[3] = &unk_1E3BFF628;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](factorLevels, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorLevels, 0);
}

@end
