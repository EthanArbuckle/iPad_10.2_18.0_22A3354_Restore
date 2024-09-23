@implementation PXGLoadingStatusComponent

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGLoadingStatusComponent;
  -[PXGComponent performChanges:](&v3, sel_performChanges_, a3);
}

- ($A5A652246548B43F8BC05201A1C72A70)mutableStates
{
  id v2;
  $A5A652246548B43F8BC05201A1C72A70 *v3;

  -[PXGComponent mutableDataStore](self, "mutableDataStore");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = ($A5A652246548B43F8BC05201A1C72A70 *)objc_msgSend(v2, "mutableContents");

  return v3;
}

+ (unint64_t)elementSize
{
  return 1;
}

- (PXGLoadingStatusComponent)initWithDataStore:(id)a3
{
  PXGLoadingStatusComponent *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *errorByEntity;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGLoadingStatusComponent;
  v3 = -[PXGComponent initWithDataStore:](&v7, sel_initWithDataStore_, a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    errorByEntity = v3->_errorByEntity;
    v3->_errorByEntity = v4;

  }
  return v3;
}

+ (BOOL)shouldDiffForChanges
{
  return 1;
}

- (void)willDestroyEntities:(id *)a3 count:(int64_t)a4
{
  BOOL v7;
  int64_t v8;
  NSMutableDictionary *errorByEntity;
  unsigned int var0;
  void *v11;
  objc_super v12;

  if (-[NSMutableDictionary count](self->_errorByEntity, "count"))
    v7 = a4 < 1;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = a4;
    do
    {
      errorByEntity = self->_errorByEntity;
      var0 = a3->var0;
      ++a3;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", var0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](errorByEntity, "removeObjectForKey:", v11);

      --v8;
    }
    while (v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)PXGLoadingStatusComponent;
  -[PXGComponent willDestroyEntities:count:](&v12, sel_willDestroyEntities_count_, a3, a4);
}

- (id)errorForEntity:(id)a3
{
  NSMutableDictionary *errorByEntity;
  void *v4;
  void *v5;

  errorByEntity = self->_errorByEntity;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3.var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](errorByEntity, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setError:(id)a3 forEntity:(id)a4
{
  uint64_t v4;
  NSMutableDictionary *errorByEntity;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a4.var0;
  errorByEntity = self->_errorByEntity;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](errorByEntity, "setObject:forKeyedSubscript:", v7, v8);

}

- (const)states
{
  id v2;
  const $A5A652246548B43F8BC05201A1C72A70 *v3;

  -[PXGComponent dataStore](self, "dataStore");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const $A5A652246548B43F8BC05201A1C72A70 *)objc_msgSend(v2, "contents");

  return v3;
}

- ($A5A652246548B43F8BC05201A1C72A70)stateForEntity:(id)a3
{
  return -[PXGLoadingStatusComponent states](objc_retainAutorelease(self), "states")[a3.var0];
}

- (void)setState:(id)a3 forEntity:(id)a4
{
  -[PXGLoadingStatusComponent mutableStates](objc_retainAutorelease(self), "mutableStates")[a4.var0] = a3;
}

- (void)setState:(id)a3 forEntities:(id *)a4 count:(unint64_t)a5
{
  $A5A652246548B43F8BC05201A1C72A70 *i;
  unsigned int var0;

  for (i = -[PXGLoadingStatusComponent mutableStates](objc_retainAutorelease(self), "mutableStates"); a5; --a5)
  {
    var0 = a4->var0;
    ++a4;
    i[var0] = a3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorByEntity, 0);
}

@end
