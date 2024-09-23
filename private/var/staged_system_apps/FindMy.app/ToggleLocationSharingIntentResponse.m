@implementation ToggleLocationSharingIntentResponse

- (int64_t)code
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___ToggleLocationSharingIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___ToggleLocationSharingIntentResponse_code, v4, 0, 0);
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___ToggleLocationSharingIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___ToggleLocationSharingIntentResponse_code, v5, 1, 0);
  *v4 = a3;
}

- (ToggleLocationSharingIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  ToggleLocationSharingIntentResponse *v7;
  int64_t *v8;
  ToggleLocationSharingIntentResponse *v9;
  _BYTE v11[24];

  v6 = a4;
  v7 = -[ToggleLocationSharingIntentResponse init](self, "init");
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___ToggleLocationSharingIntentResponse_code);
  swift_beginAccess((char *)v7 + OBJC_IVAR___ToggleLocationSharingIntentResponse_code, v11, 1, 0);
  *v8 = a3;
  v9 = v7;
  -[ToggleLocationSharingIntentResponse setUserActivity:](v9, "setUserActivity:", v6);

  return v9;
}

+ (id)unspecifiedIntentResponseWithState:(int64_t)a3
{
  char *v4;
  char *v5;
  double v6;
  char v8[24];

  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()), "init");
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  *(_QWORD *)&v6 = swift_beginAccess(&v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code], v8, 1, 0).n128_u64[0];
  *(_QWORD *)v5 = 0;
  objc_msgSend(v4, "setUserActivity:", 0, v6);
  objc_msgSend(v4, "setState:", a3);
  return v4;
}

+ (id)readyIntentResponseWithState:(int64_t)a3
{
  char *v4;
  char *v5;
  double v6;
  char v8[24];

  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()), "init");
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  *(_QWORD *)&v6 = swift_beginAccess(&v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code], v8, 1, 0).n128_u64[0];
  *(_QWORD *)v5 = 1;
  objc_msgSend(v4, "setUserActivity:", 0, v6);
  objc_msgSend(v4, "setState:", a3);
  return v4;
}

+ (id)continueInAppIntentResponseWithState:(int64_t)a3
{
  char *v4;
  char *v5;
  double v6;
  char v8[24];

  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()), "init");
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  *(_QWORD *)&v6 = swift_beginAccess(&v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code], v8, 1, 0).n128_u64[0];
  *(_QWORD *)v5 = 2;
  objc_msgSend(v4, "setUserActivity:", 0, v6);
  objc_msgSend(v4, "setState:", a3);
  return v4;
}

+ (id)inProgressIntentResponseWithState:(int64_t)a3
{
  char *v4;
  char *v5;
  double v6;
  char v8[24];

  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()), "init");
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  *(_QWORD *)&v6 = swift_beginAccess(&v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code], v8, 1, 0).n128_u64[0];
  *(_QWORD *)v5 = 3;
  objc_msgSend(v4, "setUserActivity:", 0, v6);
  objc_msgSend(v4, "setState:", a3);
  return v4;
}

+ (id)successIntentResponseWithState:(int64_t)a3
{
  char *v4;
  char *v5;
  double v6;
  char v8[24];

  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()), "init");
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  *(_QWORD *)&v6 = swift_beginAccess(&v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code], v8, 1, 0).n128_u64[0];
  *(_QWORD *)v5 = 4;
  objc_msgSend(v4, "setUserActivity:", 0, v6);
  objc_msgSend(v4, "setState:", a3);
  return v4;
}

+ (id)failureRequiringAppLaunchIntentResponseWithState:(int64_t)a3
{
  char *v4;
  char *v5;
  double v6;
  char v8[24];

  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ToggleLocationSharingIntentResponse()), "init");
  v5 = &v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code];
  *(_QWORD *)&v6 = swift_beginAccess(&v4[OBJC_IVAR___ToggleLocationSharingIntentResponse_code], v8, 1, 0).n128_u64[0];
  *(_QWORD *)v5 = 6;
  objc_msgSend(v4, "setUserActivity:", 0, v6);
  objc_msgSend(v4, "setState:", a3);
  return v4;
}

- (ToggleLocationSharingIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ToggleLocationSharingIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ToggleLocationSharingIntentResponse();
  return -[ToggleLocationSharingIntentResponse init](&v3, "init");
}

- (ToggleLocationSharingIntentResponse)initWithCoder:(id)a3
{
  return (ToggleLocationSharingIntentResponse *)sub_10046EF7C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (ToggleLocationSharingIntentResponse)initWithBackingStore:(id)a3
{
  return (ToggleLocationSharingIntentResponse *)sub_10046EF7C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (ToggleLocationSharingIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v3 = 0;
  return (ToggleLocationSharingIntentResponse *)ToggleLocationSharingIntentResponse.init(propertiesByName:)(v3);
}

@end
