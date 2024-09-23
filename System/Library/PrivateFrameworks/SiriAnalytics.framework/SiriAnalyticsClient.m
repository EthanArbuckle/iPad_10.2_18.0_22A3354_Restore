@implementation SiriAnalyticsClient

- (SiriAnalyticsClientMessageStream)defaultMessageStream
{
  return self->_defaultMessageStream;
}

- (void)setDefaultMessageStream:(id)a3
{
  objc_storeStrong((id *)&self->_defaultMessageStream, a3);
}

- (BOOL)clientMessageStream:(id)a3 shouldEmitMessage:(id)a4 timestamp:(unint64_t)a5 isolatedStreamUUID:(id)a6
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMessageStream, 0);
}

@end
