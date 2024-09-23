@implementation SSRTriggerPhraseDetectorNDAPIResult

- (unint64_t)phId
{
  return self->_phId;
}

- (void)setPhId:(unint64_t)a3
{
  self->_phId = a3;
}

- (unint64_t)samplesFed
{
  return self->_samplesFed;
}

- (void)setSamplesFed:(unint64_t)a3
{
  self->_samplesFed = a3;
}

- (unint64_t)bestPhrase
{
  return self->_bestPhrase;
}

- (void)setBestPhrase:(unint64_t)a3
{
  self->_bestPhrase = a3;
}

- (unint64_t)bestStart
{
  return self->_bestStart;
}

- (void)setBestStart:(unint64_t)a3
{
  self->_bestStart = a3;
}

- (unint64_t)bestEnd
{
  return self->_bestEnd;
}

- (void)setBestEnd:(unint64_t)a3
{
  self->_bestEnd = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (BOOL)isEarlyWarning
{
  return self->_isEarlyWarning;
}

- (void)setIsEarlyWarning:(BOOL)a3
{
  self->_isEarlyWarning = a3;
}

- (BOOL)isRescoring
{
  return self->_isRescoring;
}

- (void)setIsRescoring:(BOOL)a3
{
  self->_isRescoring = a3;
}

@end
