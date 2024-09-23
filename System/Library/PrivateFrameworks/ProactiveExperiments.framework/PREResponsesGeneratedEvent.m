@implementation PREResponsesGeneratedEvent

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_storeStrong((id *)&self->_responses, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (unint64_t)responseTimePerf
{
  return self->_responseTimePerf;
}

- (void)setResponseTimePerf:(unint64_t)a3
{
  self->_responseTimePerf = a3;
}

- (unint64_t)messageCharCount
{
  return self->_messageCharCount;
}

- (void)setMessageCharCount:(unint64_t)a3
{
  self->_messageCharCount = a3;
}

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
}

- (void)setHasQuestionMark:(BOOL)a3
{
  self->_hasQuestionMark = a3;
}

- (unint64_t)responseGenerationTime
{
  return self->_responseGenerationTime;
}

- (void)setResponseGenerationTime:(unint64_t)a3
{
  self->_responseGenerationTime = a3;
}

- (int)generationStatus
{
  return self->_generationStatus;
}

- (void)setGenerationStatus:(int)a3
{
  self->_generationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_responses, 0);
}

@end
