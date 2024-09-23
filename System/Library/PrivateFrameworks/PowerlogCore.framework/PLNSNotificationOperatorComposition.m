@implementation PLNSNotificationOperatorComposition

void __52__PLNSNotificationOperatorComposition_notification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "operatorBlock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)operatorBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)notification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *workQueue;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__PLNSNotificationOperatorComposition_notification___block_invoke;
  v14[3] = &unk_1E6A560A8;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v6;
  dispatch_async(workQueue, v14);

}

- (PLNSNotificationOperatorComposition)initWithOperator:(id)a3 forNotification:(id)a4 withBlock:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  PLNSNotificationOperatorComposition *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PLNSNotificationOperatorComposition initWithOperator:forNotifications:withBlock:](self, "initWithOperator:forNotifications:withBlock:", v11, v12, v9, v15, v16);
  return v13;
}

- (PLNSNotificationOperatorComposition)initWithOperator:(id)a3 forNotifications:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PLNSNotificationOperatorComposition *v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotifications:withBlock:](self, "initWithWorkQueue:forNotifications:withBlock:", v11, v10, v9);

  if (v12)
    objc_storeWeak((id *)&v12->_operator, v8);

  return v12;
}

- (PLNSNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotification:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  PLNSNotificationOperatorComposition *v10;
  void *v11;
  PLNSNotificationOperatorComposition *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PLNSNotificationOperatorComposition;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PLNSNotificationOperatorComposition init](&v14, sel_init);
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1, v14.receiver, v14.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotifications:withBlock:](v10, "initWithWorkQueue:forNotifications:withBlock:", v9, v11, v7);
  return v12;
}

- (PLNSNotificationOperatorComposition)initWithWorkQueue:(id)a3 forNotifications:(id)a4 withBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id operatorBlock;
  NSMutableArray *v14;
  NSMutableArray *notificationObservers;

  v9 = a3;
  v10 = a4;
  if (self)
  {
    self->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&self->_workQueue, a3);
    v11 = a5;
    v12 = (void *)MEMORY[0x1BCC9EB70]();

    operatorBlock = self->_operatorBlock;
    self->_operatorBlock = v12;

    objc_storeStrong((id *)&self->_notificationNames, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    notificationObservers = self->_notificationObservers;
    self->_notificationObservers = v14;

    -[PLNSNotificationOperatorComposition listenForNotifications:](self, "listenForNotifications:", 1);
  }

  return self;
}

- (NSString)notificationName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[PLNSNotificationOperatorComposition notificationNames](self, "notificationNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PLNSNotificationOperatorComposition notificationNames](self, "notificationNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)listenForNotifications:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *notificationObservers;
  void *v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[PLNSNotificationOperatorComposition notificationNames](self, "notificationNames");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "_addObserver:selector:name:object:options:", self, sel_notification_, v9, 0, 1024);

          os_unfair_lock_lock(&self->_lock);
          notificationObservers = self->_notificationObservers;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](notificationObservers, "addObject:", v13);

          os_unfair_lock_unlock(&self->_lock);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v6);
    }
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v15 = (void *)-[NSMutableArray copy](self->_notificationObservers, "copy");
    os_unfair_lock_unlock(p_lock);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = v15;
    v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v4);
          v20 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "unsignedLongLongValue", (_QWORD)v22);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_removeObserver:", v20);

        }
        v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PLNSNotificationOperatorComposition listenForNotifications:](self, "listenForNotifications:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PLNSNotificationOperatorComposition;
  -[PLNSNotificationOperatorComposition dealloc](&v3, sel_dealloc);
}

- (NSArray)notificationNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOperatorBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (PLOperator)operator
{
  return (PLOperator *)objc_loadWeakRetained((id *)&self->_operator);
}

- (void)setOperator:(id)a3
{
  objc_storeWeak((id *)&self->_operator, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_notificationNames, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
}

@end
