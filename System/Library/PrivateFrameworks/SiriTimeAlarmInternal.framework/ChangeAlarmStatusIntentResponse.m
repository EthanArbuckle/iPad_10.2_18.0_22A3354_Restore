@implementation ChangeAlarmStatusIntentResponse

- (int64_t)code
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code);
  swift_beginAccess();
  *v4 = a3;
}

- (ChangeAlarmStatusIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  ChangeAlarmStatusIntentResponse *v7;
  int64_t *v8;
  ChangeAlarmStatusIntentResponse *v9;

  v6 = a4;
  v7 = -[ChangeAlarmStatusIntentResponse init](self, sel_init);
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code);
  swift_beginAccess();
  *v8 = a3;
  v9 = v7;
  -[ChangeAlarmStatusIntentResponse setUserActivity:](v9, sel_setUserActivity_, v6);

  return v9;
}

- (ChangeAlarmStatusIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ChangeAlarmStatusIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ChangeAlarmStatusIntentResponse();
  return -[ChangeAlarmStatusIntentResponse init](&v3, sel_init);
}

- (ChangeAlarmStatusIntentResponse)initWithCoder:(id)a3
{
  return (ChangeAlarmStatusIntentResponse *)sub_247382CA0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ChangeAlarmStatusIntentResponse)initWithBackingStore:(id)a3
{
  return (ChangeAlarmStatusIntentResponse *)sub_247382CA0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ChangeAlarmStatusIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_24738A550();
  else
    v3 = 0;
  return (ChangeAlarmStatusIntentResponse *)ChangeAlarmStatusIntentResponse.init(propertiesByName:)(v3);
}

@end
