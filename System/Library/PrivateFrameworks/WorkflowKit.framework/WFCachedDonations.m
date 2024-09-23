@implementation WFCachedDonations

- (WFCachedDonations)initWithDonations:(id)a3 ballpark:(unint64_t)a4
{
  id v6;
  WFCachedDonations *v7;
  uint64_t v8;
  NSArray *donations;
  uint64_t v10;
  NSDate *fetchDate;
  WFCachedDonations *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFCachedDonations;
  v7 = -[WFCachedDonations init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    donations = v7->_donations;
    v7->_donations = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    fetchDate = v7->_fetchDate;
    v7->_fetchDate = (NSDate *)v10;

    v7->_ballpark = a4;
    v12 = v7;
  }

  return v7;
}

- (BOOL)isValidWithBallpark:(unint64_t)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  if (-[WFCachedDonations ballpark](self, "ballpark") != a3)
    return 0;
  -[WFCachedDonations fetchDate](self, "fetchDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == 1;

  return v6;
}

- (NSArray)donations
{
  return self->_donations;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (unint64_t)ballpark
{
  return self->_ballpark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_donations, 0);
}

@end
