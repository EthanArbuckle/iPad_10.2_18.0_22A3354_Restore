@implementation TIRevisionRateAnalysisSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageRegion, 0);
  objc_storeStrong((id *)&self->_sessionAlignmentConfidence, 0);
}

- (BOOL)hasEmojiInput
{
  return self->_hasEmojiInput;
}

- (void)setHasEmojiInput:(BOOL)a3
{
  self->_hasEmojiInput = a3;
}

- (BOOL)hasCursorMovement
{
  return self->_hasCursorMovement;
}

- (void)setHasCursorMovement:(BOOL)a3
{
  self->_hasCursorMovement = a3;
}

- (NSNumber)sessionAlignmentConfidence
{
  return self->_sessionAlignmentConfidence;
}

- (void)setSessionAlignmentConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAlignmentConfidence, a3);
}

- (int64_t)tappedCount
{
  return self->_tappedCount;
}

- (void)setTappedCount:(int64_t)a3
{
  self->_tappedCount = a3;
}

- (int64_t)autocorrectedCount
{
  return self->_autocorrectedCount;
}

- (void)setAutocorrectedCount:(int64_t)a3
{
  self->_autocorrectedCount = a3;
}

- (int64_t)revisedCount
{
  return self->_revisedCount;
}

- (void)setRevisedCount:(int64_t)a3
{
  self->_revisedCount = a3;
}

- (int64_t)revisedAutocorrectionCount
{
  return self->_revisedAutocorrectionCount;
}

- (void)setRevisedAutocorrectionCount:(int64_t)a3
{
  self->_revisedAutocorrectionCount = a3;
}

- (NSString)languageRegion
{
  return self->_languageRegion;
}

- (void)setLanguageRegion:(id)a3
{
  objc_storeStrong((id *)&self->_languageRegion, a3);
}

@end
