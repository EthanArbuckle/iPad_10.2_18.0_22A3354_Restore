@implementation ICDatabaseVacuum

- (ICDatabaseVacuum)init
{
  ICDatabaseVacuum *v2;
  dispatch_queue_t v3;
  NSObject *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICDatabaseVacuum;
  v2 = -[ICDatabaseVacuum init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.notes.vacuum", 0);
    -[ICDatabaseVacuum setQueue:](v2, "setQueue:", v3);

    v4 = objc_claimAutoreleasedReturnValue(-[ICDatabaseVacuum queue](v2, "queue"));
    global_queue = dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v4, v6);

  }
  return v2;
}

+ (id)activeVacuumQueue
{
  if (qword_1005DDD88 != -1)
    dispatch_once(&qword_1005DDD88, &stru_100551CF0);
  return (id)qword_1005DDD80;
}

+ (ICDatabaseVacuum)activeVacuum
{
  return (ICDatabaseVacuum *)(id)qword_1005DDD90;
}

+ (void)setActiveVacuum:(id)a3
{
  objc_storeStrong((id *)&qword_1005DDD90, a3);
}

+ (void)startDatabaseVacuumPolicyWithPreVacuumHandler:(id)a3 postVacuumHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "activeVacuumQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F98C;
  block[3] = &unk_100551D18;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

+ (void)startDatabaseVacuumPolicy
{
  objc_msgSend(a1, "startDatabaseVacuumPolicyWithPreVacuumHandler:postVacuumHandler:", 0, 0);
}

+ (NSDate)lastVacuumDate
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("LastVacuumDate"));
  v4 = v3;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v4);
}

+ (void)setLastVacuumDate:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100406EDC((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v11, "setDouble:forKey:", CFSTR("LastVacuumDate"));

}

- (void)startDatabaseVacuumPolicy
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[ICDatabaseVacuum queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FBC8;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDatabaseVacuumPolicy
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FED4;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)timerFired:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100407028();

  v5 = objc_claimAutoreleasedReturnValue(-[ICDatabaseVacuum queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FFA8;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)vacuum
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  ICDatabaseVacuum *v15;
  id v16;

  v3 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100407054();

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDatabaseVacuum preVacuumHandler](self, "preVacuumHandler"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ICDatabaseVacuum preVacuumHandler](self, "preVacuumHandler"));
    ((void (**)(_QWORD, void *))v6)[2](v6, v4);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentContainer"));

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100070104;
  v14 = &unk_10054FE80;
  v15 = self;
  v16 = v4;
  v9 = v4;
  objc_msgSend(v8, "vacuumStoreWithCompletionHandler:", &v11);
  -[ICDatabaseVacuum vacuumHTMLDatabase](self, "vacuumHTMLDatabase", v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend((id)objc_opt_class(self), "setLastVacuumDate:", v10);

}

- (void)vacuumHTMLDatabase
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  ICDatabaseVacuum *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDatabaseVacuum preVacuumHandler](self, "preVacuumHandler"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ICDatabaseVacuum preVacuumHandler](self, "preVacuumHandler"));
    ((void (**)(_QWORD, void *))v5)[2](v5, v3);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext urlForPersistentStore](NoteContext, "urlForPersistentStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NoteContext sharedContext](NoteContext, "sharedContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managedObjectContext"));

  v9 = os_log_create("com.apple.notes", "Vacuum");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100407080((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  objc_msgSend(v8, "setShouldPerformSecureOperation:", 1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10007034C;
  v19[3] = &unk_100550098;
  v20 = v8;
  v21 = v6;
  v22 = self;
  v23 = v3;
  v16 = v3;
  v17 = v6;
  v18 = v8;
  objc_msgSend(v18, "performBlock:", v19);

}

- (id)preVacuumHandler
{
  return self->_preVacuumHandler;
}

- (void)setPreVacuumHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)postVacuumHandler
{
  return self->_postVacuumHandler;
}

- (void)setPostVacuumHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_postVacuumHandler, 0);
  objc_storeStrong(&self->_preVacuumHandler, 0);
}

@end
