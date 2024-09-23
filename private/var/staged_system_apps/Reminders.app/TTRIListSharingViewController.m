@implementation TTRIListSharingViewController

- (_TtC9Reminders29TTRIListSharingViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders29TTRIListSharingViewController *)sub_100077990(v3, v4);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_localUndoManager));
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders29TTRIListSharingViewController *v3;

  v3 = self;
  sub_100077AD0((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v7.receiver;
  -[TTRIListSharingViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "tableView", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "reloadData");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_100007870(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (SEL *)&selRef_becomeFirstResponder);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_100007870(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (SEL *)&selRef_resignFirstResponder);
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                    + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton));
}

- (void)setDoneButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton) = (Class)a3;
  v3 = a3;

}

- (void)didTapDone:(id)a3
{
  _TtC9Reminders29TTRIListSharingViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  sub_1002F4ADC();

  sub_100027F10(v6);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders29TTRIListSharingViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000780A4(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders29TTRIListSharingViewController *v12;
  unint64_t v13;
  __int16 v14;
  unsigned __int8 v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (*((_BYTE *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_allowsEditing) == 1)
  {
    v11 = a3;
    v12 = self;
    v13 = sub_100077F50((uint64_t)v10);
    if ((v14 & 0x100) != 0)
      v15 = 0;
    else
      v15 = sub_100078024(v13, v14 & 1);

  }
  else
  {
    v15 = 0;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15 & 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC9Reminders29TTRIListSharingViewController *v14;
  uint64_t v15;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = self;
  sub_100078674(v13, a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_class *ObjectType;
  _TtC9Reminders29TTRIListSharingViewController *v8;
  id v9;
  id v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v8 = self;
  v9 = -[TTRIListSharingViewController navigationItem](v8, "navigationItem");
  if (v5)
    v10 = 0;
  else
    v10 = objc_retain(*(id *)((char *)&v8->super.super.super.super.isa
                            + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton));
  objc_msgSend(v9, "setLeftBarButtonItem:", v10);

  v11.receiver = v8;
  v11.super_class = ObjectType;
  -[TTRIListSharingViewController setEditing:animated:](&v11, "setEditing:animated:", v5, v4);

}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders29TTRIListSharingViewController *v12;
  Swift::String v13;
  Swift::String v14;
  void *object;
  NSString v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13._object = (void *)0x8000000100561360;
  v14._countAndFlagsBits = 0x61685320706F7453;
  v14._object = (void *)0xEC000000676E6972;
  v13._countAndFlagsBits = 0xD00000000000002ELL;
  object = TTRLocalizedString(_:comment:)(v14, v13)._object;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v16;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;
  objc_super v9;
  uint64_t v10;
  uint64_t v11;

  result = 2.0;
  if (a4 != 1)
  {
    v10 = v4;
    v11 = v5;
    v9.receiver = self;
    v9.super_class = (Class)swift_getObjectType(self, a2);
    -[TTRIListSharingViewController tableView:heightForHeaderInSection:](&v9, "tableView:heightForHeaderInSection:", a3, a4);
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC9Reminders29TTRIListSharingViewController *v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;

  v4 = a3;
  v5 = self;
  v6 = sub_1002F4154();
  v7 = v6[2];
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    v8 = *((unsigned __int8 *)&v5->super.super.super.super.isa
         + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_style);

    if (v8)
      return 1;
    else
      return 2;
  }
  else
  {

    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC9Reminders29TTRIListSharingViewController *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t result;

  if (a4 == 1)
    return a4;
  if (a4)
    return 0;
  v5 = a3;
  v6 = self;
  v7 = sub_1002F4154();
  v8 = v7[2];
  swift_bridgeObjectRelease(v7);
  v9 = *((unsigned __int8 *)&v6->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_allowsEditing);

  a4 = v8 + v9;
  if (!__OFADD__(v8, v9))
    return a4;
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC9Reminders29TTRIListSharingViewController *v12;
  char *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100078F74((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC9Reminders29TTRIListSharingViewController)initWithStyle:(int64_t)a3
{
  _TtC9Reminders29TTRIListSharingViewController *result;

  result = (_TtC9Reminders29TTRIListSharingViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIListSharingViewController", 39, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders29TTRIListSharingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders29TTRIListSharingViewController *result;

  v4 = a4;
  result = (_TtC9Reminders29TTRIListSharingViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIListSharingViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_localUndoManager));
}

@end
