@implementation CreateAlarmIntentResponse

- (CreateAlarmIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CreateAlarmIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CreateAlarmIntentResponse();
  return -[CreateAlarmIntentResponse init](&v3, sel_init);
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___CreateAlarmIntentResponse_code);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)code
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CreateAlarmIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (CreateAlarmIntentResponse)initWithBackingStore:(id)a3
{
  return (CreateAlarmIntentResponse *)sub_247381FA0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (CreateAlarmIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  CreateAlarmIntentResponse *v7;
  int64_t *v8;
  CreateAlarmIntentResponse *v9;

  v6 = a4;
  v7 = -[CreateAlarmIntentResponse init](self, sel_init);
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___CreateAlarmIntentResponse_code);
  swift_beginAccess();
  *v8 = a3;
  v9 = v7;
  -[CreateAlarmIntentResponse setUserActivity:](v9, sel_setUserActivity_, v6);

  return v9;
}

- (CreateAlarmIntentResponse)initWithCoder:(id)a3
{
  return (CreateAlarmIntentResponse *)sub_247381FA0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (CreateAlarmIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_24738A550();
  else
    v3 = 0;
  return (CreateAlarmIntentResponse *)CreateAlarmIntentResponse.init(propertiesByName:)(v3);
}

@end
