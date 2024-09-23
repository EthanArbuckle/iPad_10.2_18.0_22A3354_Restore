@implementation LocateDeviceIntentResponse

- (int64_t)code
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___LocateDeviceIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___LocateDeviceIntentResponse_code, v4, 0, 0);
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___LocateDeviceIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___LocateDeviceIntentResponse_code, v5, 1, 0);
  *v4 = a3;
}

- (LocateDeviceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  LocateDeviceIntentResponse *v7;
  int64_t *v8;
  LocateDeviceIntentResponse *v9;
  _BYTE v11[24];

  v6 = a4;
  v7 = -[LocateDeviceIntentResponse init](self, "init");
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___LocateDeviceIntentResponse_code);
  swift_beginAccess((char *)v7 + OBJC_IVAR___LocateDeviceIntentResponse_code, v11, 1, 0);
  *v8 = a3;
  v9 = v7;
  -[LocateDeviceIntentResponse setUserActivity:](v9, "setUserActivity:", v6);

  return v9;
}

- (LocateDeviceIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___LocateDeviceIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LocateDeviceIntentResponse();
  return -[LocateDeviceIntentResponse init](&v3, "init");
}

- (LocateDeviceIntentResponse)initWithCoder:(id)a3
{
  return (LocateDeviceIntentResponse *)sub_10046FA08((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (LocateDeviceIntentResponse)initWithBackingStore:(id)a3
{
  return (LocateDeviceIntentResponse *)sub_10046FA08((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (LocateDeviceIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v3 = 0;
  return (LocateDeviceIntentResponse *)LocateDeviceIntentResponse.init(propertiesByName:)(v3);
}

@end
