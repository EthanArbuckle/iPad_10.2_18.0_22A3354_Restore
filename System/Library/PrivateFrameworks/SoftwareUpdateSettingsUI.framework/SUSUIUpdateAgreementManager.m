@implementation SUSUIUpdateAgreementManager

- (SUSUIUpdateAgreementManager)init
{
  NSMutableDictionary *v2;
  NSMutableDictionary *updateAgreementDict;
  dispatch_queue_t v4;
  OS_dispatch_queue *stateQueue;
  SUSUIUpdateAgreementManager *v7;
  NSObject *v8;
  objc_super v9;
  SEL v10;
  SUSUIUpdateAgreementManager *v11;

  v10 = a2;
  v11 = 0;
  v9.receiver = self;
  v9.super_class = (Class)SUSUIUpdateAgreementManager;
  v11 = -[SUSUIUpdateAgreementManager init](&v9, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    updateAgreementDict = v11->_updateAgreementDict;
    v11->_updateAgreementDict = v2;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.softwareupdatesettings.agreementManagerQueue", v8);
    stateQueue = v11->_stateQueue;
    v11->_stateQueue = (OS_dispatch_queue *)v4;

  }
  v7 = v11;
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (void)setCellularFeeAgreementStatus:(int)a3 forUpdate:(id)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  dispatch_queue_t *v10;
  id v11;
  int v12;
  id location;
  int v14;
  SEL v15;
  dispatch_queue_t *v16;

  v16 = (dispatch_queue_t *)self;
  v15 = a2;
  v14 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_not_V2(v16[2]);
  queue = v16[2];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __71__SUSUIUpdateAgreementManager_setCellularFeeAgreementStatus_forUpdate___block_invoke;
  v9 = &unk_24DFFFFD0;
  v10 = v16;
  v12 = v14;
  v11 = location;
  dispatch_sync(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

uint64_t __71__SUSUIUpdateAgreementManager_setCellularFeeAgreementStatus_forUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAgreementDictValue:forKey:forDescriptor:", *(unsigned int *)(a1 + 48), kAgreementDictKeyCellularFee, *(_QWORD *)(a1 + 40), a1, a1);
}

- (void)setTermsAgreementStatus:(int)a3 forUpdate:(id)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  dispatch_queue_t *v10;
  id v11;
  int v12;
  id location;
  int v14;
  SEL v15;
  dispatch_queue_t *v16;

  v16 = (dispatch_queue_t *)self;
  v15 = a2;
  v14 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  dispatch_assert_queue_not_V2(v16[2]);
  queue = v16[2];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __65__SUSUIUpdateAgreementManager_setTermsAgreementStatus_forUpdate___block_invoke;
  v9 = &unk_24DFFFFD0;
  v10 = v16;
  v12 = v14;
  v11 = location;
  dispatch_sync(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

uint64_t __65__SUSUIUpdateAgreementManager_setTermsAgreementStatus_forUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAgreementDictValue:forKey:forDescriptor:", *(unsigned int *)(a1 + 48), kAgreementDictKeyTerms, *(_QWORD *)(a1 + 40), a1, a1);
}

- (int)cellularFeeAgreementStatusForUpdate:(id)a3
{
  NSObject *queue;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  dispatch_queue_t *v11;
  id v12[2];
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  int v17;
  id location[2];
  dispatch_queue_t *v19;

  v19 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_not_V2(v19[2]);
  v13 = 0;
  v14 = &v13;
  v15 = 0x20000000;
  v16 = 32;
  v17 = 0;
  queue = v19[2];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __67__SUSUIUpdateAgreementManager_cellularFeeAgreementStatusForUpdate___block_invoke;
  v10 = &unk_24DFFFFF8;
  v12[1] = &v13;
  v11 = v19;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);
  v5 = *((_DWORD *)v14 + 6);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __67__SUSUIUpdateAgreementManager_cellularFeeAgreementStatusForUpdate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_agreementDictValueForKey:forDescriptor:", kAgreementDictKeyCellularFee, *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int)termsAgreementStatusForUpdate:(id)a3
{
  NSObject *queue;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  dispatch_queue_t *v11;
  id v12[2];
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  int v17;
  id location[2];
  dispatch_queue_t *v19;

  v19 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_not_V2(v19[2]);
  v13 = 0;
  v14 = &v13;
  v15 = 0x20000000;
  v16 = 32;
  v17 = 0;
  queue = v19[2];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __61__SUSUIUpdateAgreementManager_termsAgreementStatusForUpdate___block_invoke;
  v10 = &unk_24DFFFFF8;
  v12[1] = &v13;
  v11 = v19;
  v12[0] = location[0];
  dispatch_sync(queue, &v6);
  v5 = *((_DWORD *)v14 + 6);
  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __61__SUSUIUpdateAgreementManager_termsAgreementStatusForUpdate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_agreementDictValueForKey:forDescriptor:", kAgreementDictKeyTerms, *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_queue_agreementDictForDescriptor:(id)a3
{
  id location[2];
  SUSUIUpdateAgreementManager *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v5->_stateQueue);
  if (location[0])
    v6 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v5->_updateAgreementDict, "objectForKeyedSubscript:", location[0]);
  else
    v6 = 0;
  objc_storeStrong(location, 0);
  return v6;
}

- (void)_queue_setAgreementDictValue:(int)a3 forKey:(id)a4 forDescriptor:(id)a5
{
  id v5;
  id v6;
  id v8;
  id v9;
  int v10;
  id v11;
  id location;
  unsigned int v13;
  SEL v14;
  SUSUIUpdateAgreementManager *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v15->_stateQueue);
  if (v11 && location)
  {
    v9 = -[SUSUIUpdateAgreementManager _queue_agreementDictForDescriptor:](v15, "_queue_agreementDictForDescriptor:", v11);
    if (v9)
    {
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
      objc_msgSend(v9, "setObject:forKeyedSubscript:");

    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
      objc_msgSend(v8, "setObject:forKeyedSubscript:");

      -[NSMutableDictionary setObject:forKeyedSubscript:](v15->_updateAgreementDict, "setObject:forKeyedSubscript:", v8, v11);
      objc_storeStrong(&v8, 0);
    }
    objc_storeStrong(&v9, 0);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (int)_queue_agreementDictValueForKey:(id)a3 forDescriptor:(id)a4
{
  id v4;
  id v5;
  int v7;
  id v9;
  int v10;
  id v11;
  id v12;
  id location[2];
  SUSUIUpdateAgreementManager *v14;
  int v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v14->_stateQueue);
  v11 = 0;
  if (v12 && location[0])
  {
    v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v14->_updateAgreementDict, "objectForKeyedSubscript:", v12);
    if (v9)
    {
      v4 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", location[0]);
      v5 = v11;
      v11 = v4;

    }
    if (v11)
      v7 = objc_msgSend(v11, "integerValue");
    else
      v7 = 0;
    v15 = v7;
    v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v15 = 0;
    v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_updateAgreementDict, 0);
}

@end
