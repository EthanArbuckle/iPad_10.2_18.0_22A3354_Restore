@implementation SOSDictionaryUpdate

- (SOSDictionaryUpdate)init
{
  SOSDictionaryUpdate *v2;
  SOSDictionaryUpdate *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SOSDictionaryUpdate;
  v2 = -[SOSDictionaryUpdate init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->currentHashBuf = 0;
    v4 = dispatch_queue_create("SOSDictionaryUpdate", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SOSDictionaryUpdate reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)SOSDictionaryUpdate;
  -[SOSDictionaryUpdate dealloc](&v3, "dealloc");
}

- (void)onqueueFreeHashBuff
{
  NSObject *v3;
  char *currentHashBuf;

  v3 = objc_claimAutoreleasedReturnValue(-[SOSDictionaryUpdate queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  currentHashBuf = self->currentHashBuf;
  if (currentHashBuf)
  {
    free(currentHashBuf);
    self->currentHashBuf = 0;
  }
}

- (BOOL)hasChanged:(__CFDictionary *)a3
{
  unsigned __int8 *v4;
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = sub_1001E8F94(a3);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[SOSDictionaryUpdate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E9170;
  block[3] = &unk_1002ED5E8;
  block[5] = &v8;
  block[6] = v4;
  block[4] = self;
  dispatch_sync(v5, block);

  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (void)reset
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SOSDictionaryUpdate queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E8F8C;
  block[3] = &unk_1002EC350;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
