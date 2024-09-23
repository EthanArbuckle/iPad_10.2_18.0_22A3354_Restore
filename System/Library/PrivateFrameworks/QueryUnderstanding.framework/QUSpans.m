@implementation QUSpans

- (NSArray)peopleNameRanges
{
  return self->_peopleNameRanges;
}

- (void)setPeopleNameRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)locationNameRanges
{
  return self->_locationNameRanges;
}

- (void)setLocationNameRanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNameRanges, 0);
  objc_storeStrong((id *)&self->_peopleNameRanges, 0);
}

@end
