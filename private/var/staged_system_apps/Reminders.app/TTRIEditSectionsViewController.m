@implementation TTRIEditSectionsViewController

- (_TtC9Reminders30TTRIEditSectionsViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9Reminders30TTRIEditSectionsViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_lastConsumedViewModel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___cancelButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___doneButton) = 0;
  v4 = a3;

  result = (_TtC9Reminders30TTRIEditSectionsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIEditSectionsViewController.swift", 46, 2, 36, 0);
  __break(1u);
  return result;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders30TTRIEditSectionsViewController *v3;

  v3 = self;
  sub_10023E44C((uint64_t)v3, v2);

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
  -[TTRIEditSectionsViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
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
  -[TTRIEditSectionsViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  UIViewController.endFirstResponderEditing()();
  objc_msgSend(v4, "resignFirstResponder", v5.receiver, v5.super_class);

}

- (void)didTapCancel:(id)a3
{
  _TtC9Reminders30TTRIEditSectionsViewController *v5;
  _TtC9Reminders30TTRIEditSectionsViewController *v6;
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
  UIViewController.endFirstResponderEditing()();
  v7 = sub_10023EDD0(&OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___cancelButton, &selRef_didTapCancel_, 1);
  sub_10019EF10((uint64_t)v7);

  sub_1000073A0((uint64_t)v8, &qword_100640E50);
}

- (void)didTapDone:(id)a3
{
  _TtC9Reminders30TTRIEditSectionsViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  UIViewController.endFirstResponderEditing()();
  sub_10019F470();

  sub_100027F10(v6);
}

- (void)didToggleHideEmptySections:(id)a3
{
  id v4;
  _TtC9Reminders30TTRIEditSectionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10019EBBC((char)objc_msgSend(v4, "isOn"));

}

- (_TtC9Reminders30TTRIEditSectionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC9Reminders30TTRIEditSectionsViewController *result;

  v3 = a3;
  result = (_TtC9Reminders30TTRIEditSectionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIEditSectionsViewController", 40, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders30TTRIEditSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders30TTRIEditSectionsViewController *result;

  v4 = a4;
  result = (_TtC9Reminders30TTRIEditSectionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIEditSectionsViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_localUndoManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_dataSource));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_lastConsumedViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___doneButton));
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC9Reminders30TTRIEditSectionsViewController *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "text");
  if (v6)
  {
    v7 = v6;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0xE000000000000000;
  }
  sub_10019E494(v8, v10, v4);

  swift_bridgeObjectRelease(v10);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC9Reminders30TTRIEditSectionsViewController *v10;

  v4 = a3;
  v10 = self;
  v5 = objc_msgSend(v4, "text");
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v9 = v8;

    sub_10019E94C(v7, v9, v4);
    swift_bridgeObjectRelease(v9);
  }
  else
  {

  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end
