@implementation DOCDefaultSourceUIManager

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  _TtC5Files25DOCDefaultSourceUIManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000A3080((uint64_t)&unk_1005E1C60, (uint64_t)sub_1000A3014, (uint64_t)&unk_1005E1C78);

}

- (_TtC5Files25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5
{
  return (_TtC5Files25DOCDefaultSourceUIManager *)sub_10001C630(a3, a4, a5);
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC5Files25DOCDefaultSourceUIManager *v5;
  id v6;
  CFNotificationCenterRef DistributedCenter;
  __CFNotificationCenter *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  if (DistributedCenter)
  {
    v8 = DistributedCenter;
    CFNotificationCenterRemoveEveryObserver(v8, v5);

    v9.receiver = v5;
    v9.super_class = ObjectType;
    -[DOCDefaultSourceUIManager dealloc](&v9, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files25DOCDefaultSourceUIManager_viewController);
}

- (void)ubiquityIdentityDidChange:(id)a3
{
  id v4;
  _TtC5Files25DOCDefaultSourceUIManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000A3080((uint64_t)&unk_1005E2138, (uint64_t)sub_10036E984, (uint64_t)&unk_1005E2150);

}

- (_TtC5Files25DOCDefaultSourceUIManager)init
{
  _TtC5Files25DOCDefaultSourceUIManager *result;

  result = (_TtC5Files25DOCDefaultSourceUIManager *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCDefaultSourceUIManager", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
