@implementation _SPBucketSet

- (int64_t)valueForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  int64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28___SPBucketSet_valueForKey___block_invoke;
  block[3] = &unk_24D0EABC8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (_SPBucketSet)init
{
  _SPBucketSet *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SPBucketSet;
  v2 = -[_SPBucketSet init](&v7, sel_init);
  if (v2)
  {
    v2->_members = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.spotlight.index.buckets", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *members;
  objc_super v4;

  members = self->_members;
  if (members)
    CFRelease(members);
  v4.receiver = self;
  v4.super_class = (Class)_SPBucketSet;
  -[_SPBucketSet dealloc](&v4, sel_dealloc);
}

- (void)removeValueForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34___SPBucketSet_removeValueForKey___block_invoke;
  block[3] = &unk_24D0EA9D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)addValue:(int64_t)a3 forKey:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32___SPBucketSet_addValue_forKey___block_invoke;
  block[3] = &unk_24D0EABF0;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_sync(queue, block);

}

- (void)decay:(int64_t)a3
{
  NSObject *queue;
  void *v4;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22___SPBucketSet_decay___block_invoke;
  v5[3] = &unk_24D0EAAC0;
  v5[4] = self;
  v5[5] = a3;
  _setup_block(v5, 0, 823);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(queue, v4);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
