@implementation SXResourceResponse

- (NSString)resourceIdentifier
{
  return self->_resourceIdentifier;
}

- (void)setResourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_resourceIdentifier, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
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
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_resourceIdentifier, 0);
}

@end
