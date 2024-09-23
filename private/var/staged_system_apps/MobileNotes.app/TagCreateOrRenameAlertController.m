@implementation TagCreateOrRenameAlertController

- (UITextField)alertTextField
{
  return (UITextField *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField));
}

- (void)setAlertTextField:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField) = (Class)a3;
  v3 = a3;

}

- (_TtC11MobileNotes32TagCreateOrRenameAlertController)initWithTagObjectID:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 renameMethod:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (_TtC11MobileNotes32TagCreateOrRenameAlertController *)sub_1002F88BC(a3, a4, a5, a6);

  return v13;
}

- (id)makeAlertController
{
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v2;
  id v3;

  v2 = self;
  v3 = sub_1002F5B64(0, 0, 0, 0);

  return v3;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v9 = v8;
  v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1002B8A18(v7, v9);

  swift_bridgeObjectRelease(v9);
  return v7 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textChanged:(id)a3
{
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MobileNotes32TagCreateOrRenameAlertController *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_1002F64B8();

  sub_1000160C8((uint64_t)v9);
}

- (_TtC11MobileNotes32TagCreateOrRenameAlertController)init
{
  _TtC11MobileNotes32TagCreateOrRenameAlertController *result;

  result = (_TtC11MobileNotes32TagCreateOrRenameAlertController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.TagCreateOrRenameAlertController", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_accountObjectID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_presentingViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_tagObjectID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_eventReporter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_sizingCell));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_workerContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_viewContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_tagAction));
}

@end
