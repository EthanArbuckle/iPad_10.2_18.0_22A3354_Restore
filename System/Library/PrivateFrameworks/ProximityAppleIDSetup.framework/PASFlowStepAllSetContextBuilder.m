@implementation PASFlowStepAllSetContextBuilder

- (_TtC21ProximityAppleIDSetup31PASFlowStepAllSetContextBuilder)init
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  objc_super v7;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21ProximityAppleIDSetup31PASFlowStepAllSetContextBuilder_title);
  *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21ProximityAppleIDSetup31PASFlowStepAllSetContextBuilder_subtitle);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21ProximityAppleIDSetup31PASFlowStepAllSetContextBuilder_systemImage);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC21ProximityAppleIDSetup31PASFlowStepAllSetContextBuilder_imageColor;
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PASFlowStepAllSetContextBuilder();
  return -[PASFlowStepAllSetContextBuilder init](&v7, sel_init);
}

- (void).cxx_destruct
{
  sub_21F673398();
}

@end
