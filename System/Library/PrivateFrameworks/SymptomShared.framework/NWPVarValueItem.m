@implementation NWPVarValueItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWPVarValueItem)initWithCoder:(id)a3
{
  id v4;
  NWPVarValueItem *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWPVarValueItem;
  v5 = -[NWPVarValueItem init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24958F0D4]();
    v5->_armPullCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("armPullCount"));
    v5->_armObservedCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("armObservedCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sampleRewardMean"));
    v5->_sampleRewardMean = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sampleRewardSum"));
    v5->_sampleRewardSum = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sampleRewardSumSquares"));
    v5->_sampleRewardSumSquares = v9;
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x24958F0D4]();
  objc_msgSend(v5, "encodeInt64:forKey:", -[NWPVarValueItem armPullCount](self, "armPullCount"), CFSTR("armPullCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[NWPVarValueItem armObservedCount](self, "armObservedCount"), CFSTR("armObservedCount"));
  -[NWPVarValueItem sampleRewardMean](self, "sampleRewardMean");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sampleRewardMean"));
  -[NWPVarValueItem sampleRewardSum](self, "sampleRewardSum");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sampleRewardSum"));
  -[NWPVarValueItem sampleRewardSumSquares](self, "sampleRewardSumSquares");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sampleRewardSumSquares"));
  objc_autoreleasePoolPop(v4);

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("pulls: %llu, observed: %llu, mean: %f, sum: %.2f, sum^2: %.2f"), self->_armPullCount, self->_armObservedCount, *(_QWORD *)&self->_sampleRewardMean, *(_QWORD *)&self->_sampleRewardSum, *(_QWORD *)&self->_sampleRewardSumSquares);
}

- (unint64_t)armPullCount
{
  return self->_armPullCount;
}

- (void)setArmPullCount:(unint64_t)a3
{
  self->_armPullCount = a3;
}

- (unint64_t)armObservedCount
{
  return self->_armObservedCount;
}

- (void)setArmObservedCount:(unint64_t)a3
{
  self->_armObservedCount = a3;
}

- (double)sampleRewardMean
{
  return self->_sampleRewardMean;
}

- (void)setSampleRewardMean:(double)a3
{
  self->_sampleRewardMean = a3;
}

- (double)sampleRewardSum
{
  return self->_sampleRewardSum;
}

- (void)setSampleRewardSum:(double)a3
{
  self->_sampleRewardSum = a3;
}

- (double)sampleRewardSumSquares
{
  return self->_sampleRewardSumSquares;
}

- (void)setSampleRewardSumSquares:(double)a3
{
  self->_sampleRewardSumSquares = a3;
}

@end
