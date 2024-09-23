@implementation SPTopHitResult

- (SPTopHitResult)initWithRankingItem:(id)a3
{
  id v5;
  SPTopHitResult *v6;
  SPTopHitResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPTopHitResult;
  v6 = -[SPTopHitResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rankingItem, a3);

  return v7;
}

- (unint64_t)oid
{
  return self->_oid;
}

- (void)setOid:(unint64_t)a3
{
  self->_oid = a3;
}

- (uint64_t)score
{
  return *(_QWORD *)(a1 + 80);
}

- (void)setScore:(SPTopHitResult *)self
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
