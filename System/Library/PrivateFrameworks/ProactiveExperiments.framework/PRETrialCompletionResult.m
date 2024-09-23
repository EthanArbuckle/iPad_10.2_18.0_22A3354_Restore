@implementation PRETrialCompletionResult

- (BOOL)isCompletionCalled
{
  return self->_isCompletionCalled;
}

- (void)setIsCompletionCalled:(BOOL)a3
{
  self->_isCompletionCalled = a3;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void)setIsSuccess:(BOOL)a3
{
  self->_isSuccess = a3;
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(id)a3
{
  objc_storeStrong((id *)&self->_downloadError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadError, 0);
}

@end
