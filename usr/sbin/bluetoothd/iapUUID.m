@implementation iapUUID

- (NSString)connectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnectionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)endpointUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndpointUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
}

@end
