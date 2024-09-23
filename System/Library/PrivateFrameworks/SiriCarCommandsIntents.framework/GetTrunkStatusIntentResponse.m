@implementation GetTrunkStatusIntentResponse

- (int64_t)code
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___GetTrunkStatusIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___GetTrunkStatusIntentResponse_code);
  swift_beginAccess();
  *v4 = a3;
}

- (GetTrunkStatusIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  GetTrunkStatusIntentResponse *v7;
  int64_t *v8;
  GetTrunkStatusIntentResponse *v9;

  v6 = a4;
  v7 = -[GetTrunkStatusIntentResponse init](self, sel_init);
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___GetTrunkStatusIntentResponse_code);
  swift_beginAccess();
  *v8 = a3;
  v9 = v7;
  -[GetTrunkStatusIntentResponse setUserActivity:](v9, sel_setUserActivity_, v6);

  return v9;
}

- (GetTrunkStatusIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___GetTrunkStatusIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GetTrunkStatusIntentResponse();
  return -[GetTrunkStatusIntentResponse init](&v3, sel_init);
}

- (GetTrunkStatusIntentResponse)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___GetTrunkStatusIntentResponse_code) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GetTrunkStatusIntentResponse();
  return -[GetTrunkStatusIntentResponse initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
