@implementation REFeatureMapGenerator

void __45__REFeatureMapGenerator_initWithFeatureList___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Duplicate feature provided in feature list %@"), v4, v5, v6, v7, v8, v9, (uint64_t)v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v10, v11);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (REFeatureMapGenerator)initWithFeatureList:(id)a3
{
  id v4;
  REFeatureMapGenerator *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *featureIndexMap;
  _QWORD v10[4];
  REFeatureMapGenerator *v11;
  _QWORD *v12;
  _QWORD v13[4];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REFeatureMapGenerator;
  v5 = -[REFeatureMapGenerator init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "sharedKeySetForKeys:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithSharedKeySet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    featureIndexMap = v5->_featureIndexMap;
    v5->_featureIndexMap = (NSMutableDictionary *)v7;

    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__REFeatureMapGenerator_initWithFeatureList___block_invoke;
    v10[3] = &unk_24CF8AD10;
    v11 = v5;
    v12 = v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

    _Block_object_dispose(v13, 8);
  }

  return v5;
}

- (id)createFeatureMap
{
  return -[REFeatureMap initWithFeatureMap:]([REFeatureMap alloc], "initWithFeatureMap:", self->_featureIndexMap);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIndexMap, 0);
}

@end
