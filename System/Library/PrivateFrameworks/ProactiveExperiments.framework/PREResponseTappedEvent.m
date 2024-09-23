@implementation PREResponseTappedEvent

- (PREResponsesGeneratedEvent)responsesGeneratedEvent
{
  return self->_responsesGeneratedEvent;
}

- (void)setResponsesGeneratedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_responsesGeneratedEvent, a3);
}

- (NSString)selectedResponse
{
  return self->_selectedResponse;
}

- (void)setSelectedResponse:(id)a3
{
  objc_storeStrong((id *)&self->_selectedResponse, a3);
}

- (NSNumber)selectedPosition
{
  return self->_selectedPosition;
}

- (void)setSelectedPosition:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPosition, a3);
}

- (unint64_t)timeToTap
{
  return self->_timeToTap;
}

- (void)setTimeToTap:(unint64_t)a3
{
  self->_timeToTap = a3;
}

- (int)inputMethod
{
  return self->_inputMethod;
}

- (void)setInputMethod:(int)a3
{
  self->_inputMethod = a3;
}

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
}

- (void)setHasQuestionMark:(BOOL)a3
{
  self->_hasQuestionMark = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPosition, 0);
  objc_storeStrong((id *)&self->_selectedResponse, 0);
  objc_storeStrong((id *)&self->_responsesGeneratedEvent, 0);
}

@end
