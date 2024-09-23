@implementation CLStore

- (CLStore)initWithPersistenceManager:(id)a3
{
  CLStore *v5;
  CLStore *v6;
  objc_super v8;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLStore.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistenceManager"));
  v8.receiver = self;
  v8.super_class = (Class)CLStore;
  v5 = -[CLStore init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    v5->_persistenceManager = (CLPersistenceManager *)a3;
    v5->_managedObjectContext = (NSManagedObjectContext *)objc_msgSend(a3, "createManagedObjectContext");
  }
  return v6;
}

- (CLStore)initWithDefaultPersistenceManager:(BOOL)a3
{
  CLPersistenceManager *v4;

  v4 = -[CLPersistenceManager initWithDefaultDirectories:]([CLPersistenceManager alloc], "initWithDefaultDirectories:", a3);
  if (-[CLPersistenceManager connectToStore](v4, "connectToStore"))
    return -[CLStore initWithPersistenceManager:](self, "initWithPersistenceManager:", v4);
  NSLog(CFSTR("CoreData, Could not connnect to store!"));

  return 0;
}

- (BOOL)commitChangesToStore
{
  NSManagedObjectContext *managedObjectContext;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_100206E70;
  v10 = sub_100207BAC;
  v11 = 0;
  managedObjectContext = self->_managedObjectContext;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100889618;
  v5[3] = &unk_102159018;
  v5[4] = self;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v5);
  v3 = v7[5];
  if (v3)
    NSLog(CFSTR("Could not save changes to store! Error: %@"), v7[5]);
  _Block_object_dispose(&v6, 8);
  return v3 == 0;
}

- (BOOL)deleteRecordsWithEntityName:(id)a3 byAndPredicates:(id)a4
{
  NSManagedObjectContext *managedObjectContext;
  uint64_t v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_100206E70;
  v12 = sub_100207BAC;
  v13 = 0;
  managedObjectContext = self->_managedObjectContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10088973C;
  v7[3] = &unk_102159040;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = self;
  v7[7] = &v8;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v7);
  v5 = v9[5];
  if (v5)
    NSLog(CFSTR("Couldnt perform delete request to store with error = %@"), v9[5]);
  _Block_object_dispose(&v8, 8);
  return v5 == 0;
}

- (id)fetchRecordsWithEntityName:(id)a3 byAndPredicates:(id)a4
{
  NSManagedObjectContext *managedObjectContext;
  void *v9;
  _QWORD v11[10];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_100206E70;
  v22 = sub_100207BAC;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_100206E70;
  v16 = sub_100207BAC;
  v17 = 0;
  v17 = +[NSMutableArray array](NSMutableArray, "array");
  managedObjectContext = self->_managedObjectContext;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100889914;
  v11[3] = &unk_102159090;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = a4;
  v11[7] = &v18;
  v11[8] = &v12;
  v11[9] = a2;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v11);
  if (v19[5])
    NSLog(CFSTR("Could not perform fetch request to store with error = %@"), v19[5]);
  v9 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (int)countRecordsWithEntityName:(id)a3 predicates:(id)a4
{
  NSManagedObjectContext *managedObjectContext;
  int v5;
  _QWORD v7[9];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = sub_100206E70;
  v16 = sub_100207BAC;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  managedObjectContext = self->_managedObjectContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100889BC4;
  v7[3] = &unk_1021590B8;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = self;
  v7[7] = &v8;
  v7[8] = &v12;
  -[NSManagedObjectContext performBlockAndWait:](managedObjectContext, "performBlockAndWait:", v7);
  if (v13[5])
    NSLog(CFSTR("Could not perform fetch request to store with error = %@"), v13[5]);
  v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (CLPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

@end
