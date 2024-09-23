@implementation LyonStepUpHelper

- (_TtC10seserviced16LyonStepUpHelper)init
{
  objc_class *ObjectType;
  id v4;
  _TtC10seserviced16LyonStepUpHelper *v5;
  objc_class *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_endpointId) = xmmword_1002888D0;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stepUpSK) = xmmword_1002888D0;
  v4 = objc_allocWithZone((Class)STSHelperLibrary);
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, "init");
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stsHelper) = v6;

  v8.receiver = v5;
  v8.super_class = ObjectType;
  return -[LyonStepUpHelper init](&v8, "init");
}

- (void).cxx_destruct
{

  sub_10006B9B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_endpointId), *(_QWORD *)&self->stsHelper[OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_endpointId]);
  sub_10006B9B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stepUpSK), *(_QWORD *)&self->stsHelper[OBJC_IVAR____TtC10seserviced16LyonStepUpHelper_stepUpSK]);
}

@end
