@implementation SearchTimerIntentResponse

- (int64_t)code
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___SearchTimerIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___SearchTimerIntentResponse_code);
  swift_beginAccess();
  *v4 = a3;
}

- (SearchTimerIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  SearchTimerIntentResponse *v7;
  int64_t *v8;
  SearchTimerIntentResponse *v9;

  v6 = a4;
  v7 = -[SearchTimerIntentResponse init](self, sel_init);
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SearchTimerIntentResponse_code);
  swift_beginAccess();
  *v8 = a3;
  v9 = v7;
  -[SearchTimerIntentResponse setUserActivity:](v9, sel_setUserActivity_, v6);

  return v9;
}

- (SearchTimerIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SearchTimerIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchTimerIntentResponse();
  return -[SearchTimerIntentResponse init](&v3, sel_init);
}

- (SearchTimerIntentResponse)initWithCoder:(id)a3
{
  return (SearchTimerIntentResponse *)sub_2473E6D50((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (SearchTimerIntentResponse)initWithBackingStore:(id)a3
{
  return (SearchTimerIntentResponse *)sub_2473E6D50((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (SearchTimerIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_2473EE404();
  else
    v3 = 0;
  return (SearchTimerIntentResponse *)SearchTimerIntentResponse.init(propertiesByName:)(v3);
}

@end
