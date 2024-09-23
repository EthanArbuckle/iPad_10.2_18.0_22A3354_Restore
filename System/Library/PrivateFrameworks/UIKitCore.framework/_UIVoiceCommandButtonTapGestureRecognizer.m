@implementation _UIVoiceCommandButtonTapGestureRecognizer

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIVoiceCommandButtonTapGestureRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
  self->_pressEventBeginTimestamp = 0.0;
  self->_pressEventEndTimestamp = 0.0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIVoiceCommandButtonTapGestureRecognizer;
  v6 = a4;
  -[UITapGestureRecognizer pressesBegan:withEvent:](&v9, sel_pressesBegan_withEvent_, a3, v6);
  objc_msgSend(v6, "timestamp", v9.receiver, v9.super_class);
  v8 = v7;

  self->_pressEventBeginTimestamp = v8;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIVoiceCommandButtonTapGestureRecognizer;
  v6 = a4;
  -[UITapGestureRecognizer pressesEnded:withEvent:](&v9, sel_pressesEnded_withEvent_, a3, v6);
  objc_msgSend(v6, "timestamp", v9.receiver, v9.super_class);
  v8 = v7;

  self->_pressEventEndTimestamp = v8;
}

- (id)voiceCommandButtonTapDuration
{
  double pressEventEndTimestamp;
  double pressEventBeginTimestamp;
  void *v4;

  pressEventEndTimestamp = self->_pressEventEndTimestamp;
  if (pressEventEndTimestamp <= 0.0
    || (pressEventBeginTimestamp = self->_pressEventBeginTimestamp, pressEventBeginTimestamp <= 0.0))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", pressEventEndTimestamp - pressEventBeginTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (double)pressEventBeginTimestamp
{
  return self->_pressEventBeginTimestamp;
}

- (void)setPressEventBeginTimestamp:(double)a3
{
  self->_pressEventBeginTimestamp = a3;
}

- (double)pressEventEndTimestamp
{
  return self->_pressEventEndTimestamp;
}

- (void)setPressEventEndTimestamp:(double)a3
{
  self->_pressEventEndTimestamp = a3;
}

@end
