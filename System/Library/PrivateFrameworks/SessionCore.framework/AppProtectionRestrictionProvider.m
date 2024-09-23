@implementation AppProtectionRestrictionProvider

- (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider)init
{
  return (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider *)sub_1C13C9CF8();
}

- (void)dealloc
{
  void *v3;
  _TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider_subjectMonitorSubscription);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppProtectionRestrictionProvider();
  -[AppProtectionRestrictionProvider dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332AppProtectionRestrictionProvider *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1C13C9F28();
  swift_unknownObjectRelease();

}

@end
