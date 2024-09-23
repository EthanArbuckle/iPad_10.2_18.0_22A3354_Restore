@implementation STStopwatchShowAndPerformStopwatchAction

- (id)_initWithAction:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStopwatchShowAndPerformStopwatchAction;
  result = -[AFSiriRequest init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 5) = a3;
  return result;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStopwatchShowAndPerformStopwatchAction;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_action, CFSTR("_action"), v5.receiver, v5.super_class);

}

- (STStopwatchShowAndPerformStopwatchAction)initWithCoder:(id)a3
{
  id v4;
  STStopwatchShowAndPerformStopwatchAction *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STStopwatchShowAndPerformStopwatchAction;
  v5 = -[AFSiriRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_action"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
