@implementation SATimeVal

- (timeval)getTimeValAddr
{
  return &self->_timeVal;
}

- (timeval)timeVal
{
  __darwin_time_t v2;
  uint64_t v3;
  _QWORD v4[2];
  timeval result;

  objc_copyStruct(v4, &self->_timeVal, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.tv_usec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setTimeVal:(timeval)a3
{
  timeval v3;

  v3 = a3;
  objc_copyStruct(&self->_timeVal, &v3, 16, 1, 0);
}

@end
