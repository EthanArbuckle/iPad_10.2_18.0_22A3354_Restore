@implementation PUPhotoEditImageValues

- (NSDictionary)smartToneStatistics
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSmartToneStatistics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDictionary)smartColorStatistics
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSmartColorStatistics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)semanticStyleStatistics
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSemanticStyleStatistics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (double)smartToneAutoSuggestion
{
  return self->_smartToneAutoSuggestion;
}

- (void)setSmartToneAutoSuggestion:(double)a3
{
  self->_smartToneAutoSuggestion = a3;
}

- (double)smartColorAutoSuggestion
{
  return self->_smartColorAutoSuggestion;
}

- (void)setSmartColorAutoSuggestion:(double)a3
{
  self->_smartColorAutoSuggestion = a3;
}

- (NSDictionary)autoCropValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAutoCropValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSDictionary)autoPerspectiveValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAutoPerspectiveValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSDictionary)portraitValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPortraitValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSDictionary)apertureValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setApertureValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apertureValues, 0);
  objc_storeStrong((id *)&self->_portraitValues, 0);
  objc_storeStrong((id *)&self->_autoPerspectiveValues, 0);
  objc_storeStrong((id *)&self->_autoCropValues, 0);
  objc_storeStrong((id *)&self->_semanticStyleStatistics, 0);
  objc_storeStrong((id *)&self->_smartColorStatistics, 0);
  objc_storeStrong((id *)&self->_smartToneStatistics, 0);
}

@end
