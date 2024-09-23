@implementation SFDidGoToSiteFeedback

- (SFDidGoToSiteFeedback)initWithInput:(id)a3
{
  id v4;
  SFDidGoToSiteFeedback *v5;
  uint64_t v6;
  NSString *input;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDidGoToSiteFeedback;
  v5 = -[SFFeedback init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    input = v5->_input;
    v5->_input = (NSString *)v6;

  }
  return v5;
}

- (SFDidGoToSiteFeedback)initWithCoder:(id)a3
{
  id v4;
  SFDidGoToSiteFeedback *v5;
  uint64_t v6;
  NSString *input;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDidGoToSiteFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_input"));
    v6 = objc_claimAutoreleasedReturnValue();
    input = v5->_input;
    v5->_input = (NSString *)v6;

    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_triggerEvent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFDidGoToSiteFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, CFSTR("_input"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_triggerEvent, CFSTR("_triggerEvent"));

}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
