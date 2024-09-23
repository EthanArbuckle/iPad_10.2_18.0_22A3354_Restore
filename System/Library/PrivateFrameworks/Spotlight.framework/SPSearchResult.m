@implementation SPSearchResult

- (SPSearchResult)initWithRankingItem:(id)a3
{
  id v5;
  SPSearchResult *v6;
  SPSearchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPSearchResult;
  v6 = -[SPSearchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rankingItem, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *bundleID;
  void *v6;
  NSDate *interestingDate;
  double scoreL1;
  float v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)SPSearchResult;
  -[SPSearchResult description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  bundleID = self->_bundleID;
  -[NSString stringByPaddingToLength:withString:startingAtIndex:](self->_identifier, "stringByPaddingToLength:withString:startingAtIndex:", 10, CFSTR(" "), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  interestingDate = self->_interestingDate;
  scoreL1 = self->_scoreL1;
  -[PRSRankingItem l2Score](self->_rankingItem, "l2Score");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ bid = %@ uid = %@: (%@) L1 = %.04f, L2 = %.04f"), v4, bundleID, v6, interestingDate, *(_QWORD *)&scoreL1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)score
{
  return *(_QWORD *)(a1 + 64);
}

- (void)setScore:(SPSearchResult *)self
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)self->_score = v2;
  *(_QWORD *)&self->_score[8] = v3;
}

- (float)scoreL1
{
  return self->_scoreL1;
}

- (void)setScoreL1:(float)a3
{
  self->_scoreL1 = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(id)a3
{
  objc_storeStrong((id *)&self->_dataclass, a3);
}

- (NSDate)interestingDate
{
  return self->_interestingDate;
}

- (void)setInterestingDate:(id)a3
{
  objc_storeStrong((id *)&self->_interestingDate, a3);
}

- (NSString)threadId
{
  return self->_threadId;
}

- (void)setThreadId:(id)a3
{
  objc_storeStrong((id *)&self->_threadId, a3);
}

- (PRSRankingItem)rankingItem
{
  return self->_rankingItem;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingItem, 0);
  objc_storeStrong((id *)&self->_threadId, 0);
  objc_storeStrong((id *)&self->_interestingDate, 0);
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
