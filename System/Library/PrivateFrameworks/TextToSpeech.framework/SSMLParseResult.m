@implementation SSMLParseResult

- (SSMLParseError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)ssmlResult
{
  return self->_ssmlResult;
}

- (void)setSsmlResult:(id)a3
{
  objc_storeStrong((id *)&self->_ssmlResult, a3);
}

- (NSString)plainTextResult
{
  return self->_plainTextResult;
}

- (void)setPlainTextResult:(id)a3
{
  objc_storeStrong((id *)&self->_plainTextResult, a3);
}

- (NSString)plainTalkResult
{
  return self->_plainTalkResult;
}

- (void)setPlainTalkResult:(id)a3
{
  objc_storeStrong((id *)&self->_plainTalkResult, a3);
}

- (NSArray)utteranceResult
{
  return self->_utteranceResult;
}

- (void)setUtteranceResult:(id)a3
{
  objc_storeStrong((id *)&self->_utteranceResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceResult, 0);
  objc_storeStrong((id *)&self->_plainTalkResult, 0);
  objc_storeStrong((id *)&self->_plainTextResult, 0);
  objc_storeStrong((id *)&self->_ssmlResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
