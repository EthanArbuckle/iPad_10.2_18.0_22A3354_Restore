@implementation RTStateModelEarliestLatestEl

- (RTStateModelEarliestLatestEl)init
{
  return -[RTStateModelEarliestLatestEl initWithEarliest:andLatest:](self, "initWithEarliest:andLatest:", 1.0e12, -1.0e12);
}

- (RTStateModelEarliestLatestEl)initWithEarliest:(double)a3 andLatest:(double)a4
{
  RTStateModelEarliestLatestEl *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTStateModelEarliestLatestEl;
  result = -[RTStateModelEarliestLatestEl init](&v7, sel_init);
  if (result)
  {
    result->_earliestEl_s = a3;
    result->_latestEl_s = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double earliestEl_s;
  id v5;

  earliestEl_s = self->_earliestEl_s;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("earliestStateModelEl"), earliestEl_s);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latestStateModelEl"), self->_latestEl_s);

}

- (RTStateModelEarliestLatestEl)initWithCoder:(id)a3
{
  id v4;
  RTStateModelEarliestLatestEl *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateModelEarliestLatestEl;
  v5 = -[RTStateModelEarliestLatestEl init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("earliestStateModelEl"));
    v5->_earliestEl_s = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latestStateModelEl"));
    v5->_latestEl_s = v7;
  }

  return v5;
}

- (double)earliestEl_s
{
  return self->_earliestEl_s;
}

- (void)setEarliestEl_s:(double)a3
{
  self->_earliestEl_s = a3;
}

- (double)latestEl_s
{
  return self->_latestEl_s;
}

- (void)setLatestEl_s:(double)a3
{
  self->_latestEl_s = a3;
}

@end
