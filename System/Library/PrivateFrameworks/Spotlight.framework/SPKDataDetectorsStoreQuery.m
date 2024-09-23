@implementation SPKDataDetectorsStoreQuery

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPKDataDetectorsStoreQuery;
  -[SPKQuery cancel](&v3, sel_cancel);
  -[SSDataDetectorResultGenerator cancel](self->_generator, "cancel");
}

+ (unsigned)searchDomain
{
  return 10;
}

- (void)start
{
  void *v3;
  void *v4;
  SSDataDetectorResultGenerator *v5;
  SSDataDetectorResultGenerator *generator;
  SSDataDetectorResultGenerator *v7;
  unint64_t v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPKDataDetectorsStoreQuery;
  -[SPKQuery start](&v10, sel_start);
  if (!-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    -[SPKQuery userQueryString](self, "userQueryString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v5 = (SSDataDetectorResultGenerator *)objc_alloc_init(MEMORY[0x24BEB02A8]);
    generator = self->_generator;
    self->_generator = v5;

    v7 = self->_generator;
    v8 = -[SPKQuery queryId](self, "queryId");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__SPKDataDetectorsStoreQuery_start__block_invoke;
    v9[3] = &unk_24F01C0A8;
    v9[4] = self;
    -[SSDataDetectorResultGenerator getResultSections:queryId:completion:](v7, "getResultSections:queryId:completion:", v4, v8, v9);

  }
}

void __35__SPKDataDetectorsStoreQuery_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0260]), "initWithQueryID:sections:", objc_msgSend(*(id *)(a1 + 32), "queryGroupId"), v5);
    objc_msgSend(v3, "setTopHitIsIn:", 1);
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
}

@end
