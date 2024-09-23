@implementation SFSearchViewDisappearFeedback

- (SFSearchViewDisappearFeedback)initWithEvent:(int64_t)a3
{
  SFSearchViewDisappearFeedback *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewDisappearFeedback;
  result = -[SFFeedback init](&v5, sel_init);
  if (result)
    result->_viewDisappearEvent = a3;
  return result;
}

- (SFSearchViewDisappearFeedback)initWithCoder:(id)a3
{
  id v4;
  SFSearchViewDisappearFeedback *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFSearchViewDisappearFeedback;
  v5 = -[SFFeedback initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_viewDisappearEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("viewDisappearEvent"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSearchViewDisappearFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_viewDisappearEvent, CFSTR("viewDisappearEvent"), v5.receiver, v5.super_class);

}

- (int64_t)viewDisappearEvent
{
  return self->_viewDisappearEvent;
}

- (void)setViewDisappearEvent:(int64_t)a3
{
  self->_viewDisappearEvent = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
