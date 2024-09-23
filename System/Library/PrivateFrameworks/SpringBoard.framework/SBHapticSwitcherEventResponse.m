@implementation SBHapticSwitcherEventResponse

- (int64_t)type
{
  return 3;
}

- (SBHapticSwitcherEventResponse)initWithHapticType:(int64_t)a3 phase:(int64_t)a4
{
  SBHapticSwitcherEventResponse *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHapticSwitcherEventResponse;
  result = -[SBChainableModifierEventResponse init](&v7, sel_init);
  if (result)
  {
    result->_hapticType = a3;
    result->_phase = a4;
    result->_hidEventSenderID = 0;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  int64_t hapticType;
  const __CFString *v7;
  const __CFString *v8;
  int64_t phase;
  const __CFString *v10;
  const __CFString *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBHapticSwitcherEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v14, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  hapticType = self->_hapticType;
  v7 = CFSTR("FlyIn");
  if (hapticType == 2)
    v7 = CFSTR("ReduceMotion");
  if (hapticType == 1)
    v8 = CFSTR("EmptySwitcher");
  else
    v8 = v7;
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("hapticType"));
  phase = self->_phase;
  v10 = CFSTR("Warmup");
  if (phase == 1)
    v10 = CFSTR("Actuate");
  if (phase == 2)
    v11 = CFSTR("Cooldown");
  else
    v11 = v10;
  objc_msgSend(v5, "appendString:withName:", v11, CFSTR("phase"));
  v12 = (id)objc_msgSend(v5, "appendUInt64:withName:format:", self->_hidEventSenderID, CFSTR("hidEventSenderID"), 1);
  return v5;
}

- (int64_t)hapticType
{
  return self->_hapticType;
}

- (int64_t)phase
{
  return self->_phase;
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
}

@end
