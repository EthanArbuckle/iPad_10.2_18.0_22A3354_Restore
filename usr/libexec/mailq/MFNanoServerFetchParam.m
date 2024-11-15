@implementation MFNanoServerFetchParam

- (NSDate)beforeDateReceived
{
  return self->_beforeDateReceived;
}

- (void)setBeforeDateReceived:(id)a3
{
  objc_storeStrong((id *)&self->_beforeDateReceived, a3);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
  objc_storeStrong((id *)&self->_conversationId, a3);
}

- (NSDate)dateReceivedLimit
{
  return self->_dateReceivedLimit;
}

- (void)setDateReceivedLimit:(id)a3
{
  objc_storeStrong((id *)&self->_dateReceivedLimit, a3);
}

- (BOOL)protectedDataAvailable
{
  return self->_protectedDataAvailable;
}

- (void)setProtectedDataAvailable:(BOOL)a3
{
  self->_protectedDataAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateReceivedLimit, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_beforeDateReceived, 0);
}

@end
