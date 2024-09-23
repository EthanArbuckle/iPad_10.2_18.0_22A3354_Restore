@implementation CLDurianJourneyStats

- (CLDurianJourneyStats)init
{
  CLDurianJourneyStats *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianJourneyStats;
  result = -[CLDurianJourneyStats init](&v3, "init");
  if (result)
    result->_journeyCount = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLDurianJourneyStats;
  -[CLDurianJourneyStats dealloc](&v2, "dealloc");
}

- (id)description
{
  return -[NSNumber stringValue](+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianJourneyStats journeyCount](self, "journeyCount")), "stringValue");
}

- (int64_t)journeyCount
{
  return self->_journeyCount;
}

- (void)setJourneyCount:(int64_t)a3
{
  self->_journeyCount = a3;
}

@end
