@implementation SidebarDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC5Books18SidebarDataManager *v5;
  id v6;
  void *v7;
  _TtC5Books18SidebarDataManager *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (void *)objc_opt_self(BUAccountsProvider);
  v5 = self;
  v6 = objc_msgSend(v4, "sharedProvider");
  objc_msgSend(v6, "removeObserver:accountTypes:", v5, 1);

  type metadata accessor for AccountController(0);
  v7 = (void *)static AccountController.shared.getter();
  v8 = v5;
  AccountController.remove(observer:)();

  v9.receiver = v8;
  v9.super_class = ObjectType;
  -[SidebarDataManager dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_selectionStatePublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_searchBarPublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_standardItemsPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books18SidebarDataManager_defaultCollectionsPublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_userCollectionsPublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_accountPublisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_selectedItemReceiver));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_standardItemsReceiver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18SidebarDataManager_cancellables));
  swift_release(*(_QWORD *)&self->selectionStatePublisher[OBJC_IVAR____TtC5Books18SidebarDataManager_contactDescriptorKeys]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books18SidebarDataManager_restrictionsProvider));
}

- (_TtC5Books18SidebarDataManager)init
{
  _TtC5Books18SidebarDataManager *result;

  result = (_TtC5Books18SidebarDataManager *)_swift_stdlib_reportUnimplementedInitializer("Books.SidebarDataManager", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
