@implementation FundingSourceVerificationController

- (_TtC9PassKitUI35FundingSourceVerificationController)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR____TtC9PassKitUI35FundingSourceVerificationController_verificationType;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC9PassKitUI35FundingSourceVerificationController_fundingSource) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FundingSourceVerificationController();
  return -[ApplyControllerModel init](&v4, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI35FundingSourceVerificationController_fundingSource));
}

@end
