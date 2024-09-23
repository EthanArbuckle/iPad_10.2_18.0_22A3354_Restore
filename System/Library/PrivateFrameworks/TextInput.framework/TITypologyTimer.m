@implementation TITypologyTimer

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setMaxTimeIntervalBetweenInputs:(double)a3
{
  self->_maxTimeIntervalBetweenInputs = a3;
}

- (void)addInputEventWithTimestamp:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!-[TITypologyTimer foundFirstInput](self, "foundFirstInput"))
  {
    -[TITypologyTimer setMostRecentTimestamp:](self, "setMostRecentTimestamp:", a3);
    -[TITypologyTimer setFoundFirstInput:](self, "setFoundFirstInput:", 1);
  }
  -[TITypologyTimer mostRecentTimestamp](self, "mostRecentTimestamp");
  v6 = a3 - v5;
  -[TITypologyTimer maxTimeIntervalBetweenInputs](self, "maxTimeIntervalBetweenInputs");
  if (v7 > 0.0)
  {
    -[TITypologyTimer maxTimeIntervalBetweenInputs](self, "maxTimeIntervalBetweenInputs");
    if (v6 >= v8)
      v6 = v8;
  }
  -[TITypologyTimer elapsedTime](self, "elapsedTime");
  -[TITypologyTimer setElapsedTime:](self, "setElapsedTime:", v6 + v9);
  -[TITypologyTimer setMostRecentTimestamp:](self, "setMostRecentTimestamp:", a3);
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)mostRecentTimestamp
{
  return self->_mostRecentTimestamp;
}

- (void)setMostRecentTimestamp:(double)a3
{
  self->_mostRecentTimestamp = a3;
}

- (double)maxTimeIntervalBetweenInputs
{
  return self->_maxTimeIntervalBetweenInputs;
}

- (BOOL)foundFirstInput
{
  return self->_foundFirstInput;
}

- (void)setFoundFirstInput:(BOOL)a3
{
  self->_foundFirstInput = a3;
}

@end
