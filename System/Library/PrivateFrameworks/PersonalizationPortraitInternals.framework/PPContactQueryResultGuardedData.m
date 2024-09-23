@implementation PPContactQueryResultGuardedData

- (NSArray)cnContacts
{
  return self->_cnContacts;
}

- (void)setCnContacts:(id)a3
{
  objc_storeStrong((id *)&self->_cnContacts, a3);
}

- (NSArray)fiaContacts
{
  return self->_fiaContacts;
}

- (void)setFiaContacts:(id)a3
{
  objc_storeStrong((id *)&self->_fiaContacts, a3);
}

- (NSError)latestError
{
  return self->_latestError;
}

- (void)setLatestError:(id)a3
{
  objc_storeStrong((id *)&self->_latestError, a3);
}

- (BOOL)joined
{
  return self->_joined;
}

- (void)setJoined:(BOOL)a3
{
  self->_joined = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_fiaContacts, 0);
  objc_storeStrong((id *)&self->_cnContacts, 0);
}

@end
