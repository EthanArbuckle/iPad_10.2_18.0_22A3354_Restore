@implementation SecurityAccessoryConfigurationIntentResponse

- (int64_t)code
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code, v4, 0, 0);
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code, v5, 1, 0);
  *v4 = a3;
}

- (SecurityAccessoryConfigurationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  SecurityAccessoryConfigurationIntentResponse *v7;
  int64_t *v8;
  SecurityAccessoryConfigurationIntentResponse *v9;
  _BYTE v11[24];

  v6 = a4;
  v7 = -[SecurityAccessoryConfigurationIntentResponse init](self, "init");
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  swift_beginAccess((char *)v7 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code, v11, 1, 0);
  *v8 = a3;
  v9 = v7;
  -[SecurityAccessoryConfigurationIntentResponse setUserActivity:](v9, "setUserActivity:", v6);

  return v9;
}

- (SecurityAccessoryConfigurationIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  return -[SecurityAccessoryConfigurationIntentResponse init](&v3, "init");
}

- (SecurityAccessoryConfigurationIntentResponse)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  return -[SecurityAccessoryConfigurationIntentResponse initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
