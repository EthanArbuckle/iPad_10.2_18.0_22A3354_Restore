@implementation SFDidGoToSearchFeedback

- (SFDidGoToSearchFeedback)initWithInput:(id)a3 endpoint:(unint64_t)a4
{
  id v6;
  SFDidGoToSearchFeedback *v7;
  uint64_t v8;
  NSString *input;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFDidGoToSearchFeedback;
  v7 = -[SFFeedback init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    input = v7->_input;
    v7->_input = (NSString *)v8;

    v7->_endpoint = a4;
  }

  return v7;
}

- (SFDidGoToSearchFeedback)initWithCoder:(id)a3
{
  id v4;
  SFDidGoToSearchFeedback *v5;
  uint64_t v6;
  NSString *input;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDidGoToSearchFeedback;
  v5 = -[SFFeedback initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_input"));
    v6 = objc_claimAutoreleasedReturnValue();
    input = v5->_input;
    v5->_input = (NSString *)v6;

    v5->_endpoint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endpoint"));
    v5->_triggerEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_triggerEvent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFDidGoToSearchFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, CFSTR("_input"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_endpoint, CFSTR("endpoint"));
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

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
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
