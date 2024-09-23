@implementation DOCLazyActionManager

- (_TtC5Files20DOCLazyActionManager)initWithActionsConstructor:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();
  void *v7;
  objc_class *v8;
  objc_class *v9;
  char *v10;
  _TtC5Files20DOCLazyActionManager *v11;
  objc_super v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1005E0140, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files20DOCLazyActionManager____lazy_storage____lazyActions) = 0;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC5Files20DOCLazyActionManager_actionsClosure);
  *v6 = sub_10035ECA0;
  v6[1] = (uint64_t (*)())v5;
  v7 = (void *)objc_opt_self(FPItemManager);
  v8 = (objc_class *)objc_msgSend(v7, "defaultManager", swift_retain().n128_f64[0]);
  v9 = (objc_class *)objc_msgSend((id)objc_opt_self(DOCManagedPermission), "defaultPermission");
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_forbiddenActionIdentifiers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_associatedActionManagers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_actions) = (Class)_swiftEmptyArrayStorage;
  v10 = (char *)self + OBJC_IVAR____TtC5Files16DOCActionManager_actionManagerDelegate;
  *((_QWORD *)v10 + 1) = 0;
  swift_unknownObjectWeakInit(v10);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_fpItemManager) = v8;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_managedPermission) = v9;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DOCActionManager();
  v11 = -[DOCActionManager init](&v13, "init");
  swift_release(v5);
  return v11;
}

- (NSArray)actions
{
  _TtC5Files20DOCLazyActionManager *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_1003552FC();

  sub_10004F2F0(0, (unint64_t *)&unk_1006475D0, UIDocumentBrowserAction_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setActions:(id)a3
{
  self;
  sub_10035EBB0();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.forbiddenActionIdentifiers[OBJC_IVAR____TtC5Files20DOCLazyActionManager_actionsClosure]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC5Files20DOCLazyActionManager____lazy_storage____lazyActions));
}

@end
