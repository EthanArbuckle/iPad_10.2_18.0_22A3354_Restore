@implementation NSManagedObjectContext

- (NSString)ic_debugName
{
  return (NSString *)objc_getAssociatedObject(self, off_100836BB0);
}

- (void)setIc_debugName:(id)a3
{
  objc_setAssociatedObject(self, off_100836BB0, a3, (void *)0x301);
}

- (BOOL)ic_save
{
  return -[NSManagedObjectContext ic_saveWithLogDescription:](self, "ic_saveWithLogDescription:", 0);
}

- (BOOL)ic_saveWithLogDescription:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[24];
  uint64_t v14;

  v4 = a3;
  if (-[NSManagedObjectContext hasChanges](self, "hasChanges"))
  {
    v12 = 0;
    v5 = -[NSManagedObjectContext save:](self, "save:", &v12);
    v6 = v12;
    if (v4)
    {
      *(_QWORD *)buf = &v14;
      v7 = objc_alloc((Class)NSString);
      v8 = objc_msgSend(v7, "initWithFormat:arguments:", v4, *(_QWORD *)buf);
      v9 = v8;
      if (v5)
      {
        if (!v8)
        {
LABEL_17:

          goto LABEL_18;
        }
        v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saved context: %{public}@", buf, 0xCu);
        }
        goto LABEL_13;
      }
      if (v8)
      {
        v10 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_100685060((uint64_t)v9, (uint64_t)v6, v10);
LABEL_13:

LABEL_16:
        goto LABEL_17;
      }
    }
    else if (v5)
    {
      goto LABEL_17;
    }
    v9 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkit](REMLog, "cloudkit"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100684FEC((uint64_t)v6, v9);
    goto LABEL_16;
  }
  v5 = 1;
LABEL_18:

  return v5;
}

- (void)ic_performBlock:(id)a3 andPerformBlockOnMainThread:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000967C8;
  v8[3] = &unk_1007DA878;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[NSManagedObjectContext performBlock:](self, "performBlock:", v8);

}

- (void)ic_performBlockAndWait:(id)a3 andPerformBlockAndWaitOnMainThread:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009688C;
  v8[3] = &unk_1007D8118;
  v9 = a3;
  v7 = v9;
  v6 = a4;
  -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v8);
  performBlockOnMainThread(v6);

}

- (id)reduceIntoDictionaryByRootEntityNamesWithManagedObjectIDs:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSManagedObjectContext *v7;
  Class isa;

  v5 = sub_1000151B0(0, &qword_100843EA0, NSManagedObjectID_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_1005016DC(v6);

  swift_bridgeObjectRelease();
  sub_10001A630((uint64_t *)&unk_100846CB0);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)rootEntityNameWithEntityName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSManagedObjectContext *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100501EE0(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
