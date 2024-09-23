@implementation PGMeaningCriteriaInfo

- (NSString)meaningLabel
{
  return self->_meaningLabel;
}

- (void)setMeaningLabel:(id)a3
{
  objc_storeStrong((id *)&self->_meaningLabel, a3);
}

- (double)version
{
  return self->_version;
}

- (void)setVersion:(double)a3
{
  self->_version = a3;
}

- (unint64_t)criteriaNumber
{
  return self->_criteriaNumber;
}

- (void)setCriteriaNumber:(unint64_t)a3
{
  self->_criteriaNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningLabel, 0);
}

@end
