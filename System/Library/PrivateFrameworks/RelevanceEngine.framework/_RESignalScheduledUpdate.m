@implementation _RESignalScheduledUpdate

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)lastFireDate
{
  return self->_lastFireDate;
}

- (void)setLastFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastFireDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFireDate, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
