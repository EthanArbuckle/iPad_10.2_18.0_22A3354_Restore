@implementation CLSAssetScoringContext

- (double)viewCountThreshold
{
  return self->_viewCountThreshold;
}

- (void)setViewCountThreshold:(double)a3
{
  self->_viewCountThreshold = a3;
}

- (double)playCountThreshold
{
  return self->_playCountThreshold;
}

- (void)setPlayCountThreshold:(double)a3
{
  self->_playCountThreshold = a3;
}

- (BOOL)shouldEmphasizeShared
{
  return self->_shouldEmphasizeShared;
}

- (void)setShouldEmphasizeShared:(BOOL)a3
{
  self->_shouldEmphasizeShared = a3;
}

- (BOOL)shouldEmphasizeAdjusted
{
  return self->_shouldEmphasizeAdjusted;
}

- (void)setShouldEmphasizeAdjusted:(BOOL)a3
{
  self->_shouldEmphasizeAdjusted = a3;
}

- (BOOL)shouldEmphasizePanorama
{
  return self->_shouldEmphasizePanorama;
}

- (void)setShouldEmphasizePanorama:(BOOL)a3
{
  self->_shouldEmphasizePanorama = a3;
}

- (BOOL)shouldEmphasizeLive
{
  return self->_shouldEmphasizeLive;
}

- (void)setShouldEmphasizeLive:(BOOL)a3
{
  self->_shouldEmphasizeLive = a3;
}

- (BOOL)shouldEmphasizeBurst
{
  return self->_shouldEmphasizeBurst;
}

- (void)setShouldEmphasizeBurst:(BOOL)a3
{
  self->_shouldEmphasizeBurst = a3;
}

- (BOOL)shouldEmphasizeSDOF
{
  return self->_shouldEmphasizeSDOF;
}

- (void)setShouldEmphasizeSDOF:(BOOL)a3
{
  self->_shouldEmphasizeSDOF = a3;
}

- (signed)audioClassificationsToEmphasize
{
  return self->_audioClassificationsToEmphasize;
}

- (void)setAudioClassificationsToEmphasize:(signed __int16)a3
{
  self->_audioClassificationsToEmphasize = a3;
}

- (double)aestheticScoreThresholdToBeAwesome
{
  return self->_aestheticScoreThresholdToBeAwesome;
}

- (void)setAestheticScoreThresholdToBeAwesome:(double)a3
{
  self->_aestheticScoreThresholdToBeAwesome = a3;
}

@end
