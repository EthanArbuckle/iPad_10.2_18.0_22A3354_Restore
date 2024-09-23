@implementation _SVDMutableSpeakerCapability

- (void)setSupportStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setQualityScore:(int64_t)a3
{
  self->_qualityScore = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)qualityScore
{
  return self->_qualityScore;
}

@end
