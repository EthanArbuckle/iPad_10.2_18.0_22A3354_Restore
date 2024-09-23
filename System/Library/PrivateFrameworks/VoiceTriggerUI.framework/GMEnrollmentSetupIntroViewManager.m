@implementation GMEnrollmentSetupIntroViewManager

- (id)createViewControllerWithIntroViewControllerDelegate:(id)a3
{
  _TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager *v4;
  void *v5;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_229F3FE40();
  swift_unknownObjectRelease();

  return v5;
}

- (void)proceedToReady
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager__enrollmentStateChange))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_229F4B340();
  }
}

- (_TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC14VoiceTriggerUI33GMEnrollmentSetupIntroViewManager__enrollmentStateChange) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMEnrollmentSetupIntroViewManager();
  return -[GMEnrollmentSetupIntroViewManager init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
