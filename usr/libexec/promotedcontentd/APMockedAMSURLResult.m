@implementation APMockedAMSURLResult

- (id)data
{
  return -[APMockedAMSURLResult mockData](self, "mockData");
}

- (int64_t)responseStatusCode
{
  return -[APMockedAMSURLResult mockResponseStatusCode](self, "mockResponseStatusCode");
}

- (id)responseHeaders
{
  return -[APMockedAMSURLResult mockResponseHeaders](self, "mockResponseHeaders");
}

- (NSData)mockData
{
  return self->_mockData;
}

- (void)setMockData:(id)a3
{
  objc_storeStrong((id *)&self->_mockData, a3);
}

- (int64_t)mockResponseStatusCode
{
  return self->_mockResponseStatusCode;
}

- (void)setMockResponseStatusCode:(int64_t)a3
{
  self->_mockResponseStatusCode = a3;
}

- (NSDictionary)mockResponseHeaders
{
  return self->_mockResponseHeaders;
}

- (void)setMockResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_mockResponseHeaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockResponseHeaders, 0);
  objc_storeStrong((id *)&self->_mockData, 0);
}

@end
