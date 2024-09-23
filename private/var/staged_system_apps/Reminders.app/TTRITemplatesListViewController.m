@implementation TTRITemplatesListViewController

- (_TtC9Reminders31TTRITemplatesListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002660E8();
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)*(id *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_localUndoManager];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders31TTRITemplatesListViewController *v3;

  v3 = self;
  sub_100262390((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  unsigned __int8 *v4;
  id v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  v4 = (unsigned __int8 *)v8.receiver;
  v5 = -[TTRITemplatesListViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v6 = (unsigned __int8 *)UIViewController.effectiveNavigationControllerForBars.getter(v5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setToolbarHidden:animated:", v4[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_style], v3, v8.receiver, v8.super_class);

    v4 = v7;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v8.receiver;
  -[TTRITemplatesListViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
  v5 = objc_msgSend(v4, "view", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (!v7)
      objc_msgSend(v4, "becomeFirstResponder");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v5.receiver;
  -[TTRITemplatesListViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  UIViewController.endFirstResponderEditing()();
  objc_msgSend(v4, "resignFirstResponder", v5.receiver, v5.super_class);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _TtC9Reminders31TTRITemplatesListViewController *v6;

  v4 = a4;
  v6 = self;
  sub_100264DA0(a3, v4);

}

- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  _TtC9Reminders31TTRITemplatesListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100266200();

}

- (void)didTapCancel:(id)a3
{
  _TtC9Reminders31TTRITemplatesListViewController *v5;
  _TtC9Reminders31TTRITemplatesListViewController *v6;
  id v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v6 = self;
  }
  v7 = sub_10023EDD0(&OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController____lazy_storage___cancelButton, &selRef_didTapCancel_, 1);
  sub_1001DA5E8();

  sub_1000073A0((uint64_t)v8, &qword_100640E50);
}

- (void)didTapDone:(id)a3
{
  _TtC9Reminders31TTRITemplatesListViewController *v5;
  _TtC9Reminders31TTRITemplatesListViewController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  UIViewController.endFirstResponderEditing()();
  sub_1001D7B98();

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (_TtC9Reminders31TTRITemplatesListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders31TTRITemplatesListViewController *result;

  v4 = a4;
  result = (_TtC9Reminders31TTRITemplatesListViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRITemplatesListViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_presenter]);

  sub_100265E60(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_lastConsumedViewModel], *(_QWORD *)&self->style[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_lastConsumedViewModel], *(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_lastConsumedViewModel + 7], *(_QWORD *)&self->presenter[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_lastConsumedViewModel + 15]);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders31TTRITemplatesListViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100265B50(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC9Reminders31TTRITemplatesListViewController *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  sub_100266694((uint64_t)v11);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

@end
