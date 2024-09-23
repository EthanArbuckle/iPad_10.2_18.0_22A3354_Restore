@implementation SRUIFAlternativeInfo

- (NSNumber)combinedRank
{
  return self->_combinedRank;
}

- (void)setCombinedRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)combinedScore
{
  return self->_combinedScore;
}

- (void)setCombinedScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)isFromDevice
{
  return self->_isFromDevice;
}

- (void)setIsFromDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)originalRank
{
  return self->_originalRank;
}

- (void)setOriginalRank:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)originalScore
{
  return self->_originalScore;
}

- (void)setOriginalScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalScore, 0);
  objc_storeStrong((id *)&self->_originalRank, 0);
  objc_storeStrong((id *)&self->_isFromDevice, 0);
  objc_storeStrong((id *)&self->_combinedScore, 0);
  objc_storeStrong((id *)&self->_combinedRank, 0);
}

@end
