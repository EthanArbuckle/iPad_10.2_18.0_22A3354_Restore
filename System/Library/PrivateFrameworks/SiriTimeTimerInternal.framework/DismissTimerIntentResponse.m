@implementation DismissTimerIntentResponse

- (int64_t)code
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___DismissTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___DismissTimerIntentResponse_code);
  swift_beginAccess();
  *v4 = a3;
}

- (DismissTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  DismissTimerIntentResponse *v7;
  int64_t *v8;
  DismissTimerIntentResponse *v9;

  v6 = a4;
  v7 = -[DismissTimerIntentResponse init](self, sel_init);
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___DismissTimerIntentResponse_code);
  swift_beginAccess();
  *v8 = a3;
  v9 = v7;
  -[DismissTimerIntentResponse setUserActivity:](v9, sel_setUserActivity_, v6);

  return v9;
}

- (DismissTimerIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___DismissTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DismissTimerIntentResponse();
  return -[DismissTimerIntentResponse init](&v3, sel_init);
}

- (DismissTimerIntentResponse)initWithCoder:(id)a3
{
  return (DismissTimerIntentResponse *)sub_2473E5FF8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (DismissTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (DismissTimerIntentResponse *)sub_2473E5FF8((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (DismissTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_2473EE404();
  else
    v3 = 0;
  return (DismissTimerIntentResponse *)DismissTimerIntentResponse.init(propertiesByName:)(v3);
}

@end
