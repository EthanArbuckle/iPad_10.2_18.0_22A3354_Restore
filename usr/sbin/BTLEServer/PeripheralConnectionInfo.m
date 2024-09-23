@implementation PeripheralConnectionInfo

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unint64_t)tryCount
{
  return self->_tryCount;
}

- (void)setTryCount:(unint64_t)a3
{
  self->_tryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
