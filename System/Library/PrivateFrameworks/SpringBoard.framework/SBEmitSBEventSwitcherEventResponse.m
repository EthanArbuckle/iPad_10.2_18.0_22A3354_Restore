@implementation SBEmitSBEventSwitcherEventResponse

- (int64_t)type
{
  return 9;
}

- (SBEmitSBEventSwitcherEventResponse)initWithSBEventWithEventType:(unint64_t)a3 payload:(id)a4
{
  id v6;
  SBEmitSBEventSwitcherEventResponse *v7;
  SBEmitSBEventSwitcherEventResponse *v8;
  uint64_t v9;
  NSDictionary *payload;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBEmitSBEventSwitcherEventResponse;
  v7 = -[SBChainableModifierEventResponse init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_eventType = a3;
    v9 = objc_msgSend(v6, "copy");
    payload = v8->_payload;
    v8->_payload = (NSDictionary *)v9;

  }
  return v8;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEmitSBEventSwitcherEventResponse;
  -[SBChainableModifierEventResponse succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAnalyticsEventType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("eventType"));

  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSDictionary count](self->_payload, "count"), CFSTR("payloadCount"));
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBEmitSBEventSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromAnalyticsEventType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("eventType"));

  objc_msgSend(v4, "appendDictionarySection:withName:skipIfEmpty:", self->_payload, CFSTR("payload"), 1);
  return v4;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
