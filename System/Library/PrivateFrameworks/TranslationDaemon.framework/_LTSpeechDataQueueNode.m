@implementation _LTSpeechDataQueueNode

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (_LTSpeechDataQueueNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
