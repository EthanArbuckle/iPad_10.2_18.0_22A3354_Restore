@implementation GTCaptureCompletionState

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (void)setArchiveURL:(id)a3
{
  objc_storeStrong((id *)&self->_archiveURL, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end
