@implementation PKPaymentWebServicePaginatedRequest

- (PKPaginatedWebServiceResponse)lastPageResponse
{
  return self->_lastPageResponse;
}

- (void)setLastPageResponse:(id)a3
{
  objc_storeStrong((id *)&self->_lastPageResponse, a3);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_lastPageResponse, 0);
}

@end
