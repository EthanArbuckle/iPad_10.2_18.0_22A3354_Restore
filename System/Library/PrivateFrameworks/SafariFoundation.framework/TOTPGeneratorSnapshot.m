@implementation TOTPGeneratorSnapshot

- (NSDate)startDateOfInterval
{
  return self->_startDateOfInterval;
}

- (void)setStartDateOfInterval:(id)a3
{
  objc_storeStrong((id *)&self->_startDateOfInterval, a3);
}

- (SFAutoFillOneTimeCode)oneTimeCode
{
  return self->_oneTimeCode;
}

- (void)setOneTimeCode:(id)a3
{
  objc_storeStrong((id *)&self->_oneTimeCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneTimeCode, 0);
  objc_storeStrong((id *)&self->_startDateOfInterval, 0);
}

@end
