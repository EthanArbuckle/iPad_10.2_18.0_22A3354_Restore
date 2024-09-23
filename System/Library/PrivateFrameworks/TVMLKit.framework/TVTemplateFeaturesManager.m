@implementation TVTemplateFeaturesManager

+ (id)featuresManagerForAppDocument:(id)a3
{
  return (id)objc_msgSend(a3, "tv_featuresManager");
}

- (void)pushContext:(id)a3 forFeature:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *contextsByFeature;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  if (!self->_contextsByFeature)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    contextsByFeature = self->_contextsByFeature;
    self->_contextsByFeature = v8;

  }
  -[TVTemplateFeaturesManager _contextsForFeature:](self, "_contextsForFeature:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVTemplateFeatureContextHandle handleWithContext:](_TVTemplateFeatureContextHandle, "handleWithContext:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRank:", -[TVTemplateFeaturesManager _rankForContext:](self, "_rankForContext:", v6));
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v23 = objc_msgSend(v10, "count");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__TVTemplateFeaturesManager_pushContext_forFeature___block_invoke;
  v16[3] = &unk_24EB88650;
  v12 = v11;
  v17 = v12;
  v18 = &v24;
  v19 = &v20;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);
  if (v25[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v21[3];
  }
  else
  {
    objc_msgSend(v10, "removeObjectAtIndex:");
    v13 = v21[3];
    if (v25[3] < v13)
      v21[3] = --v13;
  }
  objc_msgSend(v10, "insertObject:atIndex:", v12, v13);
  v14 = v21[3];
  if (v14 == objc_msgSend(v10, "count") - 1)
  {
    -[TVTemplateFeaturesManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "featuresManager:currentContextDidChangeForFeature:", self, v7);

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

void __52__TVTemplateFeaturesManager_pushContext_forFeature___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  if (objc_msgSend(v7, "isEqual:", v8))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  v9 = objc_msgSend(*(id *)(a1 + 32), "rank");
  v10 = objc_msgSend(v8, "rank");

  if (v9 < v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)popContext:(id)a3 forFeature:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  -[TVTemplateFeaturesManager _contextsForFeature:](self, "_contextsForFeature:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVTemplateFeatureContextHandle handleWithContext:](_TVTemplateFeatureContextHandle, "handleWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "indexOfObject:", v8);
  objc_msgSend(v7, "removeObject:", v8);
  if (v9 == objc_msgSend(v7, "count"))
  {
    -[TVTemplateFeaturesManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "featuresManager:currentContextDidChangeForFeature:", self, v11);

  }
}

- (id)currentContextForFeature:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TVTemplateFeaturesManager _contextsForFeature:](self, "_contextsForFeature:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_contextsForFeature:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", protocol_getName((Protocol *)a3), 30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contextsByFeature, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contextsByFeature, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (int64_t)_rankForContext:(id)a3
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  uint64_t v6;

  objc_msgSend(a3, "tv_associatedIKViewElement");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return -1;
  v4 = (void *)v3;
  v5 = -1;
  do
  {
    ++v5;
    objc_msgSend(v4, "parent");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  while (v6);
  return v5;
}

- (TVTemplateFeaturesManagerDelegate)delegate
{
  return (TVTemplateFeaturesManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextsByFeature, 0);
}

@end
