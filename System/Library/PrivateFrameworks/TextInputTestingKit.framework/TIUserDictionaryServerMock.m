@implementation TIUserDictionaryServerMock

- (TIUserDictionaryServerMock)init
{
  TIUserDictionaryServerMock *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  NSArray *v5;
  NSArray *pairs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIUserDictionaryServerMock;
  v2 = -[TIUserDictionaryServerMock init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    pairs = v2->_pairs;
    v2->_pairs = v5;

  }
  return v2;
}

- (NSUUID)userDictionaryUUID
{
  return (NSUUID *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
}

- (id)addObserver:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  TIUserDictionaryServerMock *v6;
  NSMutableArray *observers;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  observers = v6->_observers;
  v8 = (void *)MEMORY[0x2348A8EA4](v5);
  -[NSMutableArray addObject:](observers, "addObject:", v8);

  ((void (**)(_QWORD, NSArray *))v5)[2](v5, v6->_pairs);
  objc_sync_exit(v6);

  v9 = (void *)MEMORY[0x2348A8EA4](v5);
  return v9;
}

- (void)removeObserver:(id)a3
{
  TIUserDictionaryServerMock *v4;
  NSMutableArray *observers;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  observers = v4->_observers;
  v6 = (void *)MEMORY[0x2348A8EA4](v7);
  -[NSMutableArray removeObject:](observers, "removeObject:", v6);

  objc_sync_exit(v4);
}

- (void)getPhraseShortcutPairs:(id)a3
{
  (*((void (**)(id, NSArray *))a3 + 2))(a3, self->_pairs);
}

- (NSArray)pairs
{
  return self->_pairs;
}

- (void)setPairs:(id)a3
{
  objc_storeStrong((id *)&self->_pairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
