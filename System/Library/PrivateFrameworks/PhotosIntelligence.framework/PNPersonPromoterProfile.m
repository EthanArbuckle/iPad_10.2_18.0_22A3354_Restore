@implementation PNPersonPromoterProfile

- (PNPersonPromoterProfile)init
{
  PNPersonPromoterProfile *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PNPersonPromoterProfile;
  result = -[PNPersonPromoterProfile init](&v8, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_interestingPersonMomentsNormalDistributionSigmaFactor = xmmword_243FA9F10;
    *(_OWORD *)&result->_interestingPersonFacesNormalDistributionSigmaFactor = xmmword_243FA9F10;
    *(_OWORD *)&result->_interestingPersonTimeNormalDistributionSigmaFactor = xmmword_243FA9F10;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail = _Q0;
    *(_OWORD *)&result->_interestingPersonLastSeenNormalDistributionSigmaFactor = xmmword_243FA9F20;
    *(_OWORD *)&result->_interestingPersonLastSeenCumulativeNormalDistributionUpperTail = xmmword_243FA9F30;
    *(_OWORD *)&result->_highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail = xmmword_243FA9F40;
    *(_OWORD *)&result->_interestingPersonNormalDistributionsToMatch = xmmword_243F96D30;
  }
  return result;
}

- (double)interestingPersonMomentsNormalDistributionSigmaFactor
{
  return self->_interestingPersonMomentsNormalDistributionSigmaFactor;
}

- (void)setInterestingPersonMomentsNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonMomentsNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonMomentsCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonMomentsCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonMomentsCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonMomentsCumulativeNormalDistributionUpperTail = a3;
}

- (double)interestingPersonFacesNormalDistributionSigmaFactor
{
  return self->_interestingPersonFacesNormalDistributionSigmaFactor;
}

- (void)setInterestingPersonFacesNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonFacesNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonFacesCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonFacesCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonFacesCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonFacesCumulativeNormalDistributionUpperTail = a3;
}

- (double)interestingPersonTimeNormalDistributionSigmaFactor
{
  return self->_interestingPersonTimeNormalDistributionSigmaFactor;
}

- (void)setInterestingPersonTimeNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonTimeNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonTimeCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonTimeCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonTimeCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonTimeCumulativeNormalDistributionUpperTail = a3;
}

- (double)interestingPersonLastSeenNormalDistributionSigmaFactor
{
  return self->_interestingPersonLastSeenNormalDistributionSigmaFactor;
}

- (void)setInterestingPersonLastSeenNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonLastSeenNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonLastSeenCumulativeNormalDistributionLowerTail
{
  return self->_interestingPersonLastSeenCumulativeNormalDistributionLowerTail;
}

- (void)setInterestingPersonLastSeenCumulativeNormalDistributionLowerTail:(double)a3
{
  self->_interestingPersonLastSeenCumulativeNormalDistributionLowerTail = a3;
}

- (double)interestingPersonLastSeenCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonLastSeenCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonLastSeenCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonLastSeenCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail;
}

- (void)setHighlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail;
}

- (void)setHighlyInterestingPersonFacesCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail;
}

- (void)setHighlyInterestingPersonTimeCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail
{
  return self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail;
}

- (void)setHighlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail:(double)a3
{
  self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail = a3;
}

- (double)highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail;
}

- (void)setHighlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail = a3;
}

- (unint64_t)interestingPersonNormalDistributionsToMatch
{
  return self->_interestingPersonNormalDistributionsToMatch;
}

- (void)setInterestingPersonNormalDistributionsToMatch:(unint64_t)a3
{
  self->_interestingPersonNormalDistributionsToMatch = a3;
}

- (unint64_t)highlyInterestingPersonNormalDistributionsToMatch
{
  return self->_highlyInterestingPersonNormalDistributionsToMatch;
}

- (void)setHighlyInterestingPersonNormalDistributionsToMatch:(unint64_t)a3
{
  self->_highlyInterestingPersonNormalDistributionsToMatch = a3;
}

@end
