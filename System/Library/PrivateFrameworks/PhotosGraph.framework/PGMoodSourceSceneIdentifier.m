@implementation PGMoodSourceSceneIdentifier

- (NSString)moodIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMoodIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isDistributed
{
  return self->_isDistributed;
}

- (void)setIsDistributed:(BOOL)a3
{
  self->_isDistributed = a3;
}

- (BOOL)isHighConfidence
{
  return self->_isHighConfidence;
}

- (void)setIsHighConfidence:(BOOL)a3
{
  self->_isHighConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moodIdentifier, 0);
}

@end
