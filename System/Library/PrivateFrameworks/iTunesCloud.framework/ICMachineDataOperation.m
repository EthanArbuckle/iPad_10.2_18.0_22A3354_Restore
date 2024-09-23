@implementation ICMachineDataOperation

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_requestContext, a3);
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
