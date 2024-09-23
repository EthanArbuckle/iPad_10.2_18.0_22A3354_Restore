@implementation MSDPingResponse

- (NSNumber)statusCode
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStatusCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
}

@end
