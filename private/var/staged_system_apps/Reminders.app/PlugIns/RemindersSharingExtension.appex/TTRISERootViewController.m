@implementation TTRISERootViewController

- (void)loadView
{
  _TtC25RemindersSharingExtension24TTRISERootViewController *v2;

  v2 = self;
  sub_10000BE0C();

}

- (_TtC25RemindersSharingExtension24TTRISERootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC25RemindersSharingExtension24TTRISERootViewController *)sub_10000C258(v5, v7, a4);
}

- (_TtC25RemindersSharingExtension24TTRISERootViewController)initWithCoder:(id)a3
{
  return (_TtC25RemindersSharingExtension24TTRISERootViewController *)sub_10000C398(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionCreateReminderInterface));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionContextExtractor));
}

@end
