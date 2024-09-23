@implementation _Feedback

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (int64_t)feedbackActionType
{
  return self->_feedbackActionType;
}

- (void)setFeedbackActionType:(int64_t)a3
{
  self->_feedbackActionType = a3;
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  self->_isFallbackFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationId, 0);
}

@end
