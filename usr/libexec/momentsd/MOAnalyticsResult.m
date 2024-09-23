@implementation MOAnalyticsResult

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (double)predict
{
  return self->_predict;
}

- (void)setPredict:(double)a3
{
  self->_predict = a3;
}

- (double)actual
{
  return self->_actual;
}

- (void)setActual:(double)a3
{
  self->_actual = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (BOOL)outlier
{
  return self->_outlier;
}

- (void)setOutlier:(BOOL)a3
{
  self->_outlier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
