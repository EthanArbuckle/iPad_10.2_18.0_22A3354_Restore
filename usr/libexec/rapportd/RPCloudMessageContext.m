@implementation RPCloudMessageContext

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_appleID, a3);
}

- (NSString)cloudServiceID
{
  return self->_cloudServiceID;
}

- (void)setCloudServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_cloudServiceID, a3);
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
  objc_storeStrong((id *)&self->_fromID, a3);
}

- (NSString)sendersKnownAlias
{
  return self->_sendersKnownAlias;
}

- (void)setSendersKnownAlias:(id)a3
{
  objc_storeStrong((id *)&self->_sendersKnownAlias, a3);
}

- (NSString)toID
{
  return self->_toID;
}

- (void)setToID:(id)a3
{
  objc_storeStrong((id *)&self->_toID, a3);
}

- (BOOL)nonWakingRequest
{
  return self->_nonWakingRequest;
}

- (void)setNonWakingRequest:(BOOL)a3
{
  self->_nonWakingRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toID, 0);
  objc_storeStrong((id *)&self->_sendersKnownAlias, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_cloudServiceID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

@end
