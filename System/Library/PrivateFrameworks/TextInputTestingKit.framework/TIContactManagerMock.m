@implementation TIContactManagerMock

- (TIContactManagerMock)initWithContactCollection:(id)a3
{
  id v5;
  TIContactManagerMock *v6;
  TIContactManagerMock *v7;
  NSMutableArray *v8;
  NSMutableArray *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIContactManagerMock;
  v6 = -[TIContactManagerMock init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactCollection, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v7->_observers;
    v7->_observers = v8;

  }
  return v7;
}

- (NSUUID)contactCollectionUUID
{
  return (NSUUID *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
}

- (id)addContactObserver:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  TIContactManagerMock *v6;
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

  objc_sync_exit(v6);
  ((void (**)(_QWORD, TIContactCollection *))v5)[2](v5, v6->_contactCollection);
  v9 = (void *)MEMORY[0x2348A8EA4](v5);

  return v9;
}

- (void)removeContactObserver:(id)a3
{
  TIContactManagerMock *v4;
  NSMutableArray *observers;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  observers = v4->_observers;
  v6 = (void *)MEMORY[0x2348A8EA4](v7);
  -[NSMutableArray removeObjectIdenticalTo:](observers, "removeObjectIdenticalTo:", v6);

  objc_sync_exit(v4);
}

- (void)getOnce:(id)a3
{
  (*((void (**)(id, TIContactCollection *))a3 + 2))(a3, self->_contactCollection);
}

- (NSArray)observers
{
  return (NSArray *)self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCollection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
