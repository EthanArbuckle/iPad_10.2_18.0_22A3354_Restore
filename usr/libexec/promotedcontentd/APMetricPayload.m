@implementation APMetricPayload

- (void)setFakeNetworkResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, a3);
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void)setBilling:(id)a3
{
  objc_storeStrong((id *)&self->_billing, a3);
}

- (void)setBatchesData:(id)a3
{
  objc_storeStrong((id *)&self->_batchesData, a3);
}

- (void)setBatchInfos:(id)a3
{
  objc_storeStrong((id *)&self->_batchInfos, a3);
}

- (APFakeNetworkResponse)fakeNetworkResponse
{
  return self->_fakeNetworkResponse;
}

- (APEventChannel)channel
{
  return self->_channel;
}

- (NSString)billing
{
  return self->_billing;
}

- (NSData)batchesData
{
  return self->_batchesData;
}

- (NSArray)batchInfos
{
  return self->_batchInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeNetworkResponse, 0);
  objc_storeStrong((id *)&self->_batchInfos, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_billing, 0);
  objc_storeStrong((id *)&self->_batchesData, 0);
}

@end
