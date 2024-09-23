@implementation BKAppLaunchCoordinator

- (id)_conditionSatisfied:(unint64_t)a3 invalidatingAssertion:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSMutableDictionary *coordinators;
  void *v9;
  void *v10;
  unint64_t pendingConditionMask;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  const char *v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  id v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  NSMutableDictionary *v29;
  void *v30;
  NSMutableArray *launchBlocks;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  _QWORD v37[6];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;

  v4 = a4;
  v7 = 1 << a3;
  coordinators = self->_coordinators;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](coordinators, "objectForKeyedSubscript:", v9));

  if (v4)
  {
    pendingConditionMask = self->_pendingConditionMask;
    if ((pendingConditionMask & v7) != 0)
    {
      self->_pendingConditionMask = pendingConditionMask & ~v7;
      goto LABEL_7;
    }
    v34 = BCIMLog();
    v13 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v35 = sub_10003C830(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v15;
      v16 = "BKAppLaunchCoordinator: Assertion invalidated but waiting for explicit condition signal: %@";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (objc_msgSend(v10, "holdCount"))
  {
    self->_pendingConditionMask |= v7;
    v12 = BCIMLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = sub_10003C830(a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412290;
      v39 = (uint64_t)v15;
      v16 = "BKAppLaunchCoordinator: Condition satisfied but waiting for assertion invalidation: %@";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);

    }
LABEL_22:

LABEL_23:
    v33 = 0;
    goto LABEL_26;
  }
LABEL_7:
  v17 = v7 & ~self->_currentConditionMask;
  v18 = BCIMLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (v20)
    {
      v21 = sub_10003C830(a3);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)v22;
      v24 = CFSTR("NO");
      if (v4)
        v24 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v39 = v22;
      v40 = 2112;
      v41 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "BKAppLaunchCoordinator: Condition already satisfied: %@, invalidatingAssertion: %@", buf, 0x16u);

    }
    goto LABEL_23;
  }
  if (v20)
  {
    v25 = sub_10003C830(a3);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)v26;
    v28 = CFSTR("NO");
    if (v4)
      v28 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v39 = v26;
    v40 = 2112;
    v41 = v28;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "BKAppLaunchCoordinator: Condition Satisfied: %@, invalidatingAssertion: %@", buf, 0x16u);

  }
  v29 = self->_coordinators;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", 0, v30);

  self->_currentConditionMask |= v7;
  launchBlocks = self->_launchBlocks;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10003C060;
  v37[3] = &unk_1008EDEF8;
  v37[4] = self;
  v37[5] = v7;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](launchBlocks, "indexesOfObjectsPassingTest:", v37));
  if (objc_msgSend(v32, "count"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectsAtIndexes:](self->_launchBlocks, "objectsAtIndexes:", v32));
    -[NSMutableArray removeObjectsAtIndexes:](self->_launchBlocks, "removeObjectsAtIndexes:", v32);
  }
  else
  {
    v33 = 0;
  }

LABEL_26:
  return v33;
}

- (id)_onConditionMask:(unint64_t)a3 flags:(unint64_t)a4 blockID:(id)a5 performBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  id v38;

  v10 = a5;
  v11 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10019FA5C;
  v31 = sub_10019FA6C;
  v32 = 0;
  v12 = objc_claimAutoreleasedReturnValue(-[BKAppLaunchCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C188;
  block[3] = &unk_1008EDFB0;
  v23 = &v33;
  v24 = &v27;
  block[4] = self;
  v25 = a3;
  v13 = v11;
  v22 = v13;
  v26 = a4;
  v14 = v10;
  v21 = v14;
  dispatch_sync(v12, block);

  if (v13 && *((_BYTE *)v34 + 24))
  {
    v16 = BCIMLog(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BKAppLaunchCoordinator: running #blockID:'%{public}@'", buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, _QWORD))v13 + 2))(v13, 1, 0);
  }
  v18 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (BOOL)appLaunchCoordinatorIsConditionSatisfied:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKAppLaunchCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006684;
  block[3] = &unk_1008EB1E8;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)signalConditionSatisfied:(unint64_t)a3 blockID:(id)a4 notifyBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a4;
  v9 = a5;
  -[BKAppLaunchCoordinator signalConditionSatisfied:](self, "signalConditionSatisfied:", a3);
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004DCFC;
    v10[3] = &unk_1008E7B98;
    v11 = v9;
    -[BKAppLaunchCoordinator _appLaunchCoordinatorOnConditionMask:flags:blockID:performBlock:](self, "_appLaunchCoordinatorOnConditionMask:flags:blockID:performBlock:", 1 << a3, 1, v8, v10);

  }
}

- (void)appLaunchCoordinatorPerformWhenLaunched:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004DCF0;
    v8[3] = &unk_1008E7B98;
    v9 = v6;
    -[BKAppLaunchCoordinator appLaunchCoordinatorOnConditionMask:blockID:performBlock:](self, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 32, a3, v8);

  }
}

- (void)_appLaunchCoordinatorOnConditionMask:(unint64_t)a3 flags:(unint64_t)a4 blockID:(id)a5 performBlock:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v11 = v10;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004C8D0;
    v13[3] = &unk_1008EDF88;
    v14 = v10;
    v12 = -[BKAppLaunchCoordinator _onConditionMask:flags:blockID:performBlock:](self, "_onConditionMask:flags:blockID:performBlock:", a3, a4, a5, v13);

  }
}

- (void)appLaunchCoordinatorOnConditionMask:(unint64_t)a3 blockID:(id)a4 performBlock:(id)a5
{
  -[BKAppLaunchCoordinator _appLaunchCoordinatorOnConditionMask:flags:blockID:performBlock:](self, "_appLaunchCoordinatorOnConditionMask:flags:blockID:performBlock:", a3, 0, a4, a5);
}

- (void)signalConditionSatisfied:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppLaunchCoordinator.m", 382, "-[BKAppLaunchCoordinator signalConditionSatisfied:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  kdebug_trace(725353724, 2, a3, 0, 0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10019FA5C;
  v11 = sub_10019FA6C;
  v12 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKAppLaunchCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021B78;
  block[3] = &unk_1008EB1E8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(v5, block);

  -[BKAppLaunchCoordinator _dispatchBlocks:](self, "_dispatchBlocks:", v8[5]);
  kdebug_trace(725353724, 3, a3, 0, 0);
  _Block_object_dispose(&v7, 8);

}

- (void)_dispatchBlocks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v4 = a3;
  v9 = v4;
  if ((self->_currentConditionMask & 8) == 0)
  {
    v5 = 0;
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexesOfObjectsPassingTest:", &stru_1008EDF38));
  v5 = v6;
  if (!v6)
    goto LABEL_5;
  v7 = (uint64_t)objc_msgSend(v6, "lastIndex");
LABEL_6:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004C810;
  v10[3] = &unk_1008EDF60;
  v11 = v5;
  v12 = v7;
  v8 = v5;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

- (void)signalConditionSatisfied:(unint64_t)a3 notifyWithTimeout:(double)a4 blockID:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a5;
  v11 = a6;
  -[BKAppLaunchCoordinator signalConditionSatisfied:](self, "signalConditionSatisfied:", a3);
  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100063868;
    v12[3] = &unk_1008EDF88;
    v13 = v11;
    -[BKAppLaunchCoordinator _appLaunchCoordinatorOnConditionMask:timeout:flags:blockID:performBlock:](self, "_appLaunchCoordinatorOnConditionMask:timeout:flags:blockID:performBlock:", 1 << a3, 1, v10, v12, a4);

  }
}

- (BKAppLaunchCoordinator)init
{
  BKAppLaunchCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableArray *v5;
  NSMutableArray *launchBlocks;
  NSMutableDictionary *v7;
  NSMutableDictionary *coordinators;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKAppLaunchCoordinator;
  v2 = -[BKAppLaunchCoordinator init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("BKAppLaunchCoordinator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new(NSMutableArray);
    launchBlocks = v2->_launchBlocks;
    v2->_launchBlocks = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    coordinators = v2->_coordinators;
    v2->_coordinators = v7;

  }
  return v2;
}

- (id)appLaunchCoordinatorHoldAtLaunchingAssertion
{
  return -[BKAppLaunchCoordinator appLaunchCoordinatorHoldAtConditionAssertion:](self, "appLaunchCoordinatorHoldAtConditionAssertion:", 2);
}

- (id)appLaunchCoordinatorHoldAtConditionAssertion:(unint64_t)a3
{
  NSObject *v5;
  BKAppLaunchAssertion *v6;
  void *v7;
  BKAppLaunchAssertion *v8;
  _QWORD v10[7];
  _QWORD block[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  kdebug_trace(725353724, 4, a3, 0, 0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_10019FA5C;
  v16 = sub_10019FA6C;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKAppLaunchCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000162CC;
  block[3] = &unk_1008EDEA8;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  block[7] = a3;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v19 + 24) && v13[5])
  {
    v6 = [BKAppLaunchAssertion alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppLaunchCoordinator queue](self, "queue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000FFA0;
    v10[3] = &unk_1008EB458;
    v10[4] = self;
    v10[5] = &v12;
    v10[6] = a3;
    v8 = -[BKAppLaunchAssertion initWithQueue:releaseBlock:](v6, "initWithQueue:releaseBlock:", v7, v10);

  }
  else
  {
    v8 = 0;
  }
  kdebug_trace(725353724, 5, a3, 0, 0);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (void)_appLaunchCoordinatorOnConditionMask:(unint64_t)a3 timeout:(double)a4 flags:(unint64_t)a5 blockID:(id)a6 performBlock:(id)a7
{
  void *v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  id v12;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppLaunchCoordinator _onConditionMask:flags:blockID:performBlock:](self, "_onConditionMask:flags:blockID:performBlock:", a3, a5, a6, a7));
  if (v9)
  {
    v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10019FC3C;
    v11[3] = &unk_1008E7338;
    v11[4] = self;
    v12 = v9;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

- (NSString)description
{
  unint64_t currentConditionMask;
  unint64_t pendingConditionMask;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  currentConditionMask = self->_currentConditionMask;
  pendingConditionMask = self->_pendingConditionMask;
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_10003C724(currentConditionMask);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = sub_10003C724(pendingConditionMask);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, currentConditionMask: %@, pendingConditionMask: %@>"), v7, self, v9, v11));

  return (NSString *)v12;
}

- (BOOL)appLaunchCoordinatorHasAppLaunched
{
  return -[BKAppLaunchCoordinator appLaunchCoordinatorIsConditionSatisfied:](self, "appLaunchCoordinatorIsConditionSatisfied:", 5);
}

- (void)_launchBlockTimedout:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppLaunchCoordinator.m", 467, "-[BKAppLaunchCoordinator _launchBlockTimedout:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKAppLaunchCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019FBD0;
  block[3] = &unk_1008E7658;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  dispatch_sync(v5, block);

  if (v6 && *((_BYTE *)v13 + 24))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "block"));
    v8 = (void *)v7;
    if (v7)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, 1, 1);

  }
  _Block_object_dispose(&v12, 8);

}

- (void)appLaunchCoordinatorOnConditionMask:(unint64_t)a3 timeout:(double)a4 blockID:(id)a5 performBlock:(id)a6
{
  -[BKAppLaunchCoordinator _appLaunchCoordinatorOnConditionMask:timeout:flags:blockID:performBlock:](self, "_appLaunchCoordinatorOnConditionMask:timeout:flags:blockID:performBlock:", a3, 0, a5, a6, a4);
}

- (NSMutableArray)launchBlocks
{
  return self->_launchBlocks;
}

- (void)setLaunchBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_launchBlocks, a3);
}

- (NSMutableDictionary)coordinators
{
  return self->_coordinators;
}

- (void)setCoordinators:(id)a3
{
  objc_storeStrong((id *)&self->_coordinators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinators, 0);
  objc_storeStrong((id *)&self->_launchBlocks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
