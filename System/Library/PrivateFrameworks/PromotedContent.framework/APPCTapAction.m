@implementation APPCTapAction

- (int64_t)actionType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_actionType);
}

- (double)confirmedClickInterval
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_confirmedClickInterval);
}

- (APPCTapAction)initWithActionType:(int64_t)a3 confirmedClickInterval:(double)a4
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_actionType) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___APPCTapAction_confirmedClickInterval) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TapAction();
  return -[APPCTapAction init](&v5, sel_init);
}

- (void)performActionWithCompletion:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

+ (id)actionFor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = _s15PromotedContent9TapActionC6action3forACSgSo05APTapD0CSg_tFZ_0(a3);

  return v5;
}

- (APPCTapAction)init
{
  APPCTapAction *result;

  result = (APPCTapAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
