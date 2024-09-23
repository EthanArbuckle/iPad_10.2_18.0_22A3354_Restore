@implementation DockContainerPersistence

- (DockContainerPersistence)initWithRecoveryDelegate:(id)a3
{
  id v4;
  DockContainerPersistence *v5;
  DockContainerPersistence *v6;
  NSMutableArray *v7;
  NSMutableArray *dockedStates;
  NSHashTable *v9;
  NSHashTable *observers;
  uint64_t v11;
  EFScheduler *queue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DockContainerPersistence;
  v5 = -[DockContainerPersistence init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_recoveryDelegate, v4);
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dockedStates = v6->_dockedStates;
    v6->_dockedStates = v7;

    v9 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 5, 3);
    observers = v6->_observers;
    v6->_observers = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:](EFScheduler, "serialDispatchQueueSchedulerWithName:", CFSTR("DockContainerPersistenceQueue")));
    queue = v6->_queue;
    v6->_queue = (EFScheduler *)v11;

    -[DockContainerPersistence _beginLoadFromDisk](v6, "_beginLoadFromDisk");
  }

  return v6;
}

- (void)setRecoveryCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryCancelable, a3);
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DAD4;
  v7[3] = &unk_10051A910;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (EFCancelable)recoveryCancelable
{
  return self->_recoveryCancelable;
}

- (void)recoverAbandonedDrafts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence recoveryCancelable](self, "recoveryCancelable"));
  objc_msgSend(v3, "cancel");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FD28;
  v6[3] = &unk_10051C5E0;
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "performCancelableBlock:", v6));
  -[DockContainerPersistence setRecoveryCancelable:](self, "setRecoveryCancelable:", v5);

}

- (EFScheduler)queue
{
  return self->_queue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (NSMutableArray)dockedStates
{
  return self->_dockedStates;
}

- (void)_beginLoadFromDisk
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E250;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C424;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9B20 != -1)
    dispatch_once(&qword_1005A9B20, block);
  return (id)qword_1005A9B18;
}

- (id)requestDockedStates
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008BEF4;
  v6[3] = &unk_10051C4D8;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture onScheduler:futureWithBlock:](EFFuture, "onScheduler:futureWithBlock:", v3, v6));

  return v4;
}

- (void)pushNewDockedState:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  DockContainerPersistence *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008C0F8;
  v16[3] = &unk_10051C528;
  v9 = v6;
  v17 = v9;
  v18 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture onScheduler:futureWithBlock:](EFFuture, "onScheduler:futureWithBlock:", v8, v16));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008C2D4;
  v14[3] = &unk_10051C550;
  v14[4] = self;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "onScheduler:addSuccessBlock:", v11, v14);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008C2E4;
  v13[3] = &unk_10051BF30;
  v13[4] = self;
  objc_msgSend(v10, "addSuccessBlock:", v13);

}

- (void)removeDockedStateWithIdentifier:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008C4A0;
    v14[3] = &unk_10051C528;
    v14[4] = self;
    v15 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture onScheduler:futureWithBlock:](EFFuture, "onScheduler:futureWithBlock:", v8, v14));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008C634;
    v12[3] = &unk_10051C550;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v9, "onScheduler:addSuccessBlock:", v10, v12);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008C644;
    v11[3] = &unk_10051BF30;
    v11[4] = self;
    objc_msgSend(v9, "addSuccessBlock:", v11);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008C70C;
  v7[3] = &unk_10051A910;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)_notifyObserversOfChange:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  DockContainerPersistence *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence observers](self, "observers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008C9F8;
  v14[3] = &unk_10051C1F0;
  v11 = v7;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v17 = self;
  v13 = v6;
  v18 = v13;
  objc_msgSend(v10, "performBlock:", v14);

}

- (void)_saveToDisk
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence activeWriteCancelable](self, "activeWriteCancelable"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence activeWriteCancelable](self, "activeWriteCancelable"));
    objc_msgSend(v4, "cancel");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence dockedStates](self, "dockedStates"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockContainerPersistence queue](self, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008CD28;
  v10[3] = &unk_10051C5E0;
  v8 = v6;
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "performCancelableBlock:", v10));
  -[DockContainerPersistence setActiveWriteCancelable:](self, "setActiveWriteCancelable:", v9);

}

- (void)migrateDockContainerDraftsToWindowsIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DockContainerPersistence *v9;
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[DockContainerPersistence log](DockContainerPersistence, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migrate %lu docked drafts", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008CF80;
  v7[3] = &unk_10051C550;
  v6 = v4;
  v8 = v6;
  v9 = self;
  +[MFBayAdoption migrateDockedDrafts:completion:](MFBayAdoption, "migrateDockedDrafts:completion:", v6, v7);

}

- (DockContainerPersistenceRecoveryDelegate)recoveryDelegate
{
  return (DockContainerPersistenceRecoveryDelegate *)objc_loadWeakRetained((id *)&self->_recoveryDelegate);
}

- (void)setRecoveryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recoveryDelegate, a3);
}

- (void)setDockedStates:(id)a3
{
  objc_storeStrong((id *)&self->_dockedStates, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (EFCancelable)activeWriteCancelable
{
  return self->_activeWriteCancelable;
}

- (void)setActiveWriteCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_activeWriteCancelable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryCancelable, 0);
  objc_storeStrong((id *)&self->_activeWriteCancelable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dockedStates, 0);
  objc_destroyWeak((id *)&self->_recoveryDelegate);
}

@end
