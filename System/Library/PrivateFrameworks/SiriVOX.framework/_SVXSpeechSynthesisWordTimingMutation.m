@implementation _SVXSpeechSynthesisWordTimingMutation

- (_SVXSpeechSynthesisWordTimingMutation)init
{
  return -[_SVXSpeechSynthesisWordTimingMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXSpeechSynthesisWordTimingMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXSpeechSynthesisWordTimingMutation *v6;
  _SVXSpeechSynthesisWordTimingMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisWordTimingMutation;
  v6 = -[_SVXSpeechSynthesisWordTimingMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXSpeechSynthesisWordTiming *baseModel;
  SVXSpeechSynthesisWordTiming *v4;
  SVXSpeechSynthesisWordTiming *v5;
  double timeInterval;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  double v12;
  double v13;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [SVXSpeechSynthesisWordTiming alloc];
    timeInterval = self->_timeInterval;
    location = self->_range.location;
    length = self->_range.length;
LABEL_11:
    v4 = -[SVXSpeechSynthesisWordTiming initWithRange:timeInterval:](v5, "initWithRange:timeInterval:", location, length, timeInterval);
    return v4;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      v9 = self->_range.location;
      v11 = self->_range.length;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
        goto LABEL_7;
    }
    else
    {
      v9 = -[SVXSpeechSynthesisWordTiming range](baseModel, "range");
      v11 = v10;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        v12 = self->_timeInterval;
LABEL_10:
        v5 = [SVXSpeechSynthesisWordTiming alloc];
        location = v9;
        length = v11;
        timeInterval = v12;
        goto LABEL_11;
      }
    }
    -[SVXSpeechSynthesisWordTiming timeInterval](self->_baseModel, "timeInterval");
    v12 = v13;
    goto LABEL_10;
  }
  v4 = (SVXSpeechSynthesisWordTiming *)-[SVXSpeechSynthesisWordTiming copy](baseModel, "copy");
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
