@implementation SHRecorderConfiguration

- (int64_t)availableRecordersForClientIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  -[SHRecorderConfiguration cacheValuesForIdentifier:](self, "cacheValuesForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3
    || (v5 = objc_msgSend(v3, "containsObject:", CFSTR("internal")),
        (v6 = objc_msgSend(v4, "containsObject:", CFSTR("external"))) != 0)
    && (v5 & 1) != 0)
  {
    v7 = 3;
  }
  else
  {
    v8 = 2;
    if (!v6)
      v8 = 0;
    if (v5)
      v7 = 1;
    else
      v7 = v8;
  }

  return v7;
}

- (id)cacheValuesForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("recorders"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHRecorderConfiguration cacheValues](self, "cacheValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[SHRecorderConfiguration cacheValues](self, "cacheValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("recorders"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (SHRecorderConfiguration)initWithValues:(id)a3
{
  id v5;
  SHRecorderConfiguration *v6;
  SHRecorderConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHRecorderConfiguration;
  v6 = -[SHRecorderConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cacheValues, a3);

  return v7;
}

- (SHRecorderConfiguration)initWithPromise:(id)a3
{
  id v5;
  SHRecorderConfiguration *v6;
  SHRecorderConfiguration *v7;
  AMSPromise *promise;
  _QWORD v10[5];
  _QWORD v11[5];
  SHRecorderConfiguration *v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHRecorderConfiguration;
  v6 = -[SHRecorderConfiguration init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_promise, a3);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy_;
    v11[4] = __Block_byref_object_dispose_;
    v12 = v7;
    promise = v7->_promise;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__SHRecorderConfiguration_initWithPromise___block_invoke;
    v10[3] = &unk_24DDB1FD0;
    v10[4] = v11;
    -[AMSPromise addSuccessBlock:](promise, "addSuccessBlock:", v10);
    _Block_object_dispose(v11, 8);

  }
  return v7;
}

void __43__SHRecorderConfiguration_initWithPromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v4)
  {
    v9 = v3;
    v5 = v3;
    v6 = (void *)v4[1];
    v4[1] = v5;
    v7 = v4;

    v8 = (void *)v7[2];
    v7[2] = 0;

    v3 = v9;
  }

}

- (NSDictionary)cacheValues
{
  return self->_cacheValues;
}

- (AMSPromise)promise
{
  return self->_promise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_cacheValues, 0);
}

@end
