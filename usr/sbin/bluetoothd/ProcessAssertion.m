@implementation ProcessAssertion

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ProcessAssertion name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %lus"), v3, -[ProcessAssertion secondsLeft](self, "secondsLeft")));

  return v4;
}

- (unint64_t)secondsLeft
{
  return self->_secondsLeft;
}

- (void)setSecondsLeft:(unint64_t)a3
{
  self->_secondsLeft = a3;
}

@end
