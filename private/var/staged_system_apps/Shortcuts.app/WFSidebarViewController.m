@implementation WFSidebarViewController

- (WFSidebarViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007AE04();
}

- (void)viewDidLoad
{
  WFSidebarViewController *v2;

  v2 = self;
  sub_10007B10C();

}

- (void)dealloc
{
  WFSidebarViewController *v2;

  v2 = self;
  sub_10007B650();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___WFSidebarViewController_style;
  v4 = sub_10007D110();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFSidebarViewController_shortcutMoveService));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___WFSidebarViewController_rootView);
  sub_10000F634(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___WFSidebarViewController____lazy_storage___toolbarViewController));
  sub_10007CE28(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR___WFSidebarViewController____lazy_storage___barButtons), *(void **)&self->database[OBJC_IVAR___WFSidebarViewController____lazy_storage___barButtons], *(void **)&self->sections[OBJC_IVAR___WFSidebarViewController____lazy_storage___barButtons]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___WFSidebarViewController____lazy_storage___sidebarDataSource));
}

- (void)viewWillAppear:(BOOL)a3
{
  WFSidebarViewController *v3;

  v3 = self;
  sub_10007B7AC();

}

- (void)viewDidAppear:(BOOL)a3
{
  WFSidebarViewController *v3;

  v3 = self;
  sub_10007B8EC();

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  WFSidebarViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10007B9D0((uint64_t)a3);

}

- (void)keyboardWillChange:(id)a3
{
  id v4;
  WFSidebarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10007BA6C(v4);

}

- (void)startEditing
{
  WFSidebarViewController *v2;

  v2 = self;
  sub_10007BF98(1, (uint64_t)sub_10007CFEC);

}

- (void)endEditing
{
  WFSidebarViewController *v2;

  v2 = self;
  sub_10007BF98(0, (uint64_t)sub_10007CEAC);

}

- (void)addFolder
{
  WFSidebarViewController *v2;

  v2 = self;
  sub_10007C390();

}

- (void)presentFolderEditorWithSender:(id)a3
{
  id v4;
  WFSidebarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10007C40C();

}

- (WFSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10007C4BC();
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v11;
  unint64_t v12;
  id v13;
  WFSidebarViewController *v14;

  v11 = sub_100003B2C(0, (unint64_t *)&qword_1000D13B8, WFDatabaseObjectDescriptor_ptr);
  v12 = sub_10007CECC();
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v11, v12);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v11, v12);
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a6, v11, v12);
  v13 = a3;
  v14 = self;
  sub_10007C5F4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
