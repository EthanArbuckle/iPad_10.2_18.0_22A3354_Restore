@implementation SUPlayerStatus

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUPlayerStatus;
  -[SUPlayerStatus dealloc](&v3, sel_dealloc);
}

- (id)description
{
  unint64_t v2;
  __CFString *v3;
  objc_super v5;

  v2 = self->_state - 1;
  if (v2 > 4)
    v3 = 0;
  else
    v3 = off_24DE7DF20[v2];
  v5.receiver = self;
  v5.super_class = (Class)SUPlayerStatus;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Time: (%.2f : %.2f), State: %@"), -[SUPlayerStatus description](&v5, sel_description), *(_QWORD *)&self->_currentTime, *(_QWORD *)&self->_duration, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 8) = self->_currentTime;
  *(double *)(v4 + 16) = self->_duration;
  *(_QWORD *)(v4 + 24) = self->_error;
  *(_QWORD *)(v4 + 32) = self->_state;
  return (id)v4;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)playerState
{
  return self->_state;
}

- (void)setPlayerState:(int64_t)a3
{
  self->_state = a3;
}

@end
