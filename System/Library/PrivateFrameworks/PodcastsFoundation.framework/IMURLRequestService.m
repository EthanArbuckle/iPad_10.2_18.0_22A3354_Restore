@implementation IMURLRequestService

- (void)setUrlSessionDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMBaseStoreService amsUrlSession](self, "amsUrlSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (NSURLSessionDelegate)urlSessionDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[IMBaseStoreService amsUrlSession](self, "amsUrlSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURLSessionDelegate *)v4;
}

- (NSURLRequest)mutableRequest
{
  return self->_mutableRequest;
}

- (void)setMutableRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mutableRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableRequest, 0);
}

@end
