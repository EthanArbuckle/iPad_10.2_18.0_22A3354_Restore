@implementation IMApplication

- (void)sendEvent:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[IMApplication setLastEventDate:](self, "setLastEventDate:");
  v5.receiver = self;
  v5.super_class = (Class)IMApplication;
  -[IMApplication sendEvent:](&v5, "sendEvent:", v4);

}

- (double)lastEventDate
{
  return self->_lastEventDate;
}

- (void)setLastEventDate:(double)a3
{
  self->_lastEventDate = a3;
}

@end
