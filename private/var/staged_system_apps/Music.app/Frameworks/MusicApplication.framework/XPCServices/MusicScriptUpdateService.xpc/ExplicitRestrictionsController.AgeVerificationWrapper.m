@implementation ExplicitRestrictionsController.AgeVerificationWrapper

- (void)dealloc
{
  objc_class *ObjectType;
  void (*v4)(_QWORD, _QWORD);
  uint64_t v5;
  _TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper *v6;
  _TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void (**)(_QWORD, _QWORD))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion);
  if (v4)
  {
    v5 = *(_QWORD *)&self->completion[OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion];
    v6 = self;
    sub_10003A434((uint64_t)v4, v5);
    v4(0, 0);
    sub_10003A5C8((uint64_t)v4, v5);
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[ExplicitRestrictionsController.AgeVerificationWrapper dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  sub_10003A5C8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion), *(_QWORD *)&self->completion[OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion]);
}

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  uint64_t v5;
  _TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper *v6;
  id v7;

  sub_1000087DC(0, (unint64_t *)&qword_100490BC0, OS_dispatch_queue_ptr);
  v5 = swift_allocObject(&unk_10044F8E8, 24, 7);
  *(_QWORD *)(v5 + 16) = self;
  v6 = self;
  v7 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_10016C760, v5);

  swift_release(v5);
}

- (_TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC9MusicCore30ExplicitRestrictionsControllerP33_49A4F392108DD8BCF77701E27C86571422AgeVerificationWrapper_completion);
  *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[ExplicitRestrictionsController.AgeVerificationWrapper init](&v6, "init");
}

@end
