@implementation SiriAnalyticsXPCMessageEnvelope

+ (BOOL)supportsSecureCoding
{
  return static XPCMessageEnvelope.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static XPCMessageEnvelope.supportsSecureCoding.setter(a3);
}

- (int64_t)eventTypeId
{
  return XPCMessageEnvelope.eventTypeId.getter();
}

- (NSData)payload
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;

  v2 = XPCMessageEnvelope.payload.getter();
  v4 = v3;
  v5 = (void *)sub_1A0307280();
  sub_1A02653E8(v2, v4);
  return (NSData *)v5;
}

- (SiriAnalyticsXPCMessageEnvelope)initWithEventTypeId:(int64_t)a3 payload:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a4;
  v6 = sub_1A030728C();
  v8 = v7;

  return (SiriAnalyticsXPCMessageEnvelope *)XPCMessageEnvelope.init(eventTypeId:payload:)(a3, v6, v8);
}

- (SiriAnalyticsXPCMessageEnvelope)initWithCoder:(id)a3
{
  return (SiriAnalyticsXPCMessageEnvelope *)XPCMessageEnvelope.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriAnalyticsXPCMessageEnvelope *v5;

  v4 = a3;
  v5 = self;
  sub_1A02AEB68(v4);

}

- (SiriAnalyticsXPCMessageEnvelope)init
{
  XPCMessageEnvelope.init()();
}

- (void).cxx_destruct
{
  sub_1A02653E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriAnalyticsXPCMessageEnvelope_payload), *(_QWORD *)&self->eventTypeId[OBJC_IVAR___SiriAnalyticsXPCMessageEnvelope_payload]);
}

@end
