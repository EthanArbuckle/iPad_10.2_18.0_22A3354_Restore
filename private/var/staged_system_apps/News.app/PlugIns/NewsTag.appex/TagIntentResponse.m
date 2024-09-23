@implementation TagIntentResponse

- (int64_t)code
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___TagIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___TagIntentResponse_code, v4, 0, 0);
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___TagIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___TagIntentResponse_code, v5, 1, 0);
  *v4 = a3;
}

- (TagIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  TagIntentResponse *v7;
  int64_t *v8;
  TagIntentResponse *v9;
  _BYTE v11[24];

  v6 = a4;
  v7 = -[TagIntentResponse init](self, "init");
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___TagIntentResponse_code);
  swift_beginAccess((char *)v7 + OBJC_IVAR___TagIntentResponse_code, v11, 1, 0);
  *v8 = a3;
  v9 = v7;
  -[TagIntentResponse setUserActivity:](v9, "setUserActivity:", v6);

  return v9;
}

- (TagIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___TagIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TagIntentResponse();
  return -[TagIntentResponse init](&v3, "init");
}

- (TagIntentResponse)initWithCoder:(id)a3
{
  return (TagIntentResponse *)sub_10007D930((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (TagIntentResponse)initWithBackingStore:(id)a3
{
  return (TagIntentResponse *)sub_10007D930((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (TagIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v3 = 0;
  return (TagIntentResponse *)TagIntentResponse.init(propertiesByName:)(v3);
}

@end
