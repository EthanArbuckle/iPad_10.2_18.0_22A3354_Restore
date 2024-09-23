@implementation ICIntentsExtension

- (ICIntentsExtension)init
{
  ICIntentsExtension *v2;
  void *v3;
  RBSAssertion *databaseLockingBackgroundTask;
  RBSAssertion *objectCreationLockingBackgroundTask;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICIntentsExtension;
  v2 = -[ICIntentsExtension init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "persistentContainerWillLockDatabase:", ICPersistentContainerWillLockDatabaseNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "persistentContainerDidUnlockDatabase:", ICPersistentContainerDidUnlockDatabaseNotification, 0);
    databaseLockingBackgroundTask = v2->_databaseLockingBackgroundTask;
    v2->_databaseLockingBackgroundTask = 0;

    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "noteContextWillLockObjectCreation:", NoteContextWillLockObjectCreationNotification, 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "noteContextDidUnlockObjectCreation:", NoteContextDidUnlockObjectCreationNotification, 0);
    objectCreationLockingBackgroundTask = v2->_objectCreationLockingBackgroundTask;
    v2->_objectCreationLockingBackgroundTask = 0;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  RBSAssertion *databaseLockingBackgroundTask;
  NSObject *v6;
  RBSAssertion *objectCreationLockingBackgroundTask;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_databaseLockingBackgroundTask)
  {
    v4 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100014120();

    -[RBSAssertion invalidate](self->_databaseLockingBackgroundTask, "invalidate");
    databaseLockingBackgroundTask = self->_databaseLockingBackgroundTask;
    self->_databaseLockingBackgroundTask = 0;

  }
  if (self->_objectCreationLockingBackgroundTask)
  {
    v6 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1000140F4();

    -[RBSAssertion invalidate](self->_objectCreationLockingBackgroundTask, "invalidate");
    objectCreationLockingBackgroundTask = self->_objectCreationLockingBackgroundTask;
    self->_objectCreationLockingBackgroundTask = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)ICIntentsExtension;
  -[ICIntentsExtension dealloc](&v8, "dealloc");
}

- (void)persistentContainerWillLockDatabase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  RBSAssertion *v10;
  RBSAssertion *databaseLockingBackgroundTask;
  RBSAssertion *v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ICIntentsExtension persistentContainerWillLockDatabase:]";
    v18 = 1024;
    v19 = 65;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget currentProcess](RBSTarget, "currentProcess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable")));
  v8 = objc_alloc((Class)RBSAssertion);
  v15 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v10 = (RBSAssertion *)objc_msgSend(v8, "initWithExplanation:target:attributes:", CFSTR("Finish Database-locking operation"), v6, v9);
  databaseLockingBackgroundTask = self->_databaseLockingBackgroundTask;
  self->_databaseLockingBackgroundTask = v10;

  objc_initWeak((id *)buf, self);
  v12 = self->_databaseLockingBackgroundTask;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004F8C;
  v13[3] = &unk_100020710;
  objc_copyWeak(&v14, (id *)buf);
  -[RBSAssertion acquireWithInvalidationHandler:](v12, "acquireWithInvalidationHandler:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)persistentContainerDidUnlockDatabase:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  RBSAssertion *databaseLockingBackgroundTask;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v4 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ICIntentsExtension persistentContainerDidUnlockDatabase:]";
    v9 = 1024;
    v10 = 82;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v7, 0x12u);
  }

  if (self->_databaseLockingBackgroundTask)
  {
    v5 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_10001414C();

    -[RBSAssertion invalidate](self->_databaseLockingBackgroundTask, "invalidate");
    databaseLockingBackgroundTask = self->_databaseLockingBackgroundTask;
    self->_databaseLockingBackgroundTask = 0;

  }
}

- (void)noteContextWillLockObjectCreation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  RBSAssertion *v10;
  RBSAssertion *objectCreationLockingBackgroundTask;
  RBSAssertion *v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ICIntentsExtension noteContextWillLockObjectCreation:]";
    v18 = 1024;
    v19 = 93;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSTarget currentProcess](RBSTarget, "currentProcess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RBSDomainAttribute attributeWithDomain:name:](RBSDomainAttribute, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable")));
  v8 = objc_alloc((Class)RBSAssertion);
  v15 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v10 = (RBSAssertion *)objc_msgSend(v8, "initWithExplanation:target:attributes:", CFSTR("Finish object creation-locking operation"), v6, v9);
  objectCreationLockingBackgroundTask = self->_objectCreationLockingBackgroundTask;
  self->_objectCreationLockingBackgroundTask = v10;

  objc_initWeak((id *)buf, self);
  v12 = self->_objectCreationLockingBackgroundTask;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000053AC;
  v13[3] = &unk_100020710;
  objc_copyWeak(&v14, (id *)buf);
  -[RBSAssertion acquireWithInvalidationHandler:](v12, "acquireWithInvalidationHandler:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)noteContextDidUnlockObjectCreation:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  RBSAssertion *objectCreationLockingBackgroundTask;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v4 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ICIntentsExtension noteContextDidUnlockObjectCreation:]";
    v9 = 1024;
    v10 = 110;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v7, 0x12u);
  }

  if (self->_objectCreationLockingBackgroundTask)
  {
    v5 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_100014178();

    -[RBSAssertion invalidate](self->_objectCreationLockingBackgroundTask, "invalidate");
    objectCreationLockingBackgroundTask = self->_objectCreationLockingBackgroundTask;
    self->_objectCreationLockingBackgroundTask = 0;

  }
}

- (id)handlerForIntent:(id)a3
{
  id v3;
  uint64_t v4;
  __objc2_class **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  v4 = objc_opt_class(ICNotesFolderIntent);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = &off_1000201A0;
  }
  else
  {
    v6 = objc_opt_class(ICNoteIntent);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v5 = &off_100020190;
    }
    else
    {
      v7 = objc_opt_class(INCreateNoteIntent);
      if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0)
      {
        v5 = &off_100020150;
      }
      else
      {
        v8 = objc_opt_class(INAppendToNoteIntent);
        if ((objc_opt_isKindOfClass(v3, v8) & 1) != 0)
        {
          v5 = &off_100020128;
        }
        else
        {
          v9 = objc_opt_class(INSearchForNotebookItemsIntent);
          if ((objc_opt_isKindOfClass(v3, v9) & 1) == 0)
          {
            v10 = 0;
            goto LABEL_12;
          }
          v5 = &off_1000201C0;
        }
      }
    }
  }
  v10 = objc_alloc_init(*v5);
LABEL_12:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectCreationLockingBackgroundTask, 0);
  objc_storeStrong((id *)&self->_databaseLockingBackgroundTask, 0);
}

@end
