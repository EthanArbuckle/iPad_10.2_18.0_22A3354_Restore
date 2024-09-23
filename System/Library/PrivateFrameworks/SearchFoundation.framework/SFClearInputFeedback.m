@implementation SFClearInputFeedback

- (SFClearInputFeedback)initWithEvent:(unint64_t)a3
{
  SFClearInputFeedback *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFClearInputFeedback;
  result = -[SFFeedback init](&v5, sel_init);
  if (result)
    result->_triggerEvent = a3;
  return result;
}

- (SFClearInputFeedback)initWithCoder:(id)a3
{
  id v4;
  SFClearInputFeedback *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFClearInputFeedback;
  v5 = -[SFFeedback initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_triggerEvent"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFClearInputFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("_triggerEvent"), v5.receiver, v5.super_class);

}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
