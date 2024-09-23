@implementation SBProductivityGestureEducationActivationHistory

- (id)copyWithZone:(_NSZone *)a3
{
  SBProductivityGestureEducationActivationHistory *v4;

  v4 = objc_alloc_init(SBProductivityGestureEducationActivationHistory);
  -[SBProductivityGestureEducationActivationHistory setCount:](v4, "setCount:", self->_count);
  -[SBProductivityGestureEducationActivationHistory setDate:](v4, "setDate:", self->_date);
  return v4;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
