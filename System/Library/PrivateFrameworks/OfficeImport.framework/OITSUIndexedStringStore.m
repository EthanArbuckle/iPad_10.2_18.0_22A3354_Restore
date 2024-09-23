@implementation OITSUIndexedStringStore

- (OITSUIndexedStringStore)init
{
  OITSUIndexedStringStore *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OITSUIndexedStringStore;
  v2 = -[OITSUIndexedStringStore init](&v4, sel_init);
  if (v2)
  {
    v2->_indexByString = (NSMutableDictionary *)objc_opt_new();
    v2->_stringByIndex = (NSMutableArray *)objc_opt_new();
    v2->_accessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iWork.TSUIndexedStringStore", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUIndexedStringStore;
  -[OITSUIndexedStringStore dealloc](&v3, sel_dealloc);
}

- (unint64_t)indexForString:(id)a3
{
  uint64_t v5;
  NSObject *accessQueue;
  unint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = objc_msgSend(a3, "length");
  if (a3 && v5)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__OITSUIndexedStringStore_indexForString___block_invoke;
    block[3] = &unk_24F39A630;
    block[4] = self;
    block[5] = a3;
    block[6] = &v10;
    dispatch_sync(accessQueue, block);
  }
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __42__OITSUIndexedStringStore_indexForString___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 24), "addObject:", a1[5]);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 24), "count");
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", v3, a1[5]);

  }
}

- (id)stringForIndex:(unint64_t)a3
{
  NSObject *accessQueue;
  void *v4;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  if (a3)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__OITSUIndexedStringStore_stringForIndex___block_invoke;
    block[3] = &unk_24F39A658;
    block[5] = &v8;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(accessQueue, block);
    v4 = (void *)v9[5];
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __42__OITSUIndexedStringStore_stringForIndex___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  id result;

  v2 = a1[6];
  result = (id)objc_msgSend(*(id *)(a1[4] + 24), "count");
  if (v2 <= (unint64_t)result)
  {
    result = (id)objc_msgSend(*(id *)(a1[4] + 24), "objectAtIndex:", a1[6] - 1);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  }
  return result;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_stringByIndex, "count");
}

@end
