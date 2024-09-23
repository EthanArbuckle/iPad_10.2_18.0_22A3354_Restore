@implementation CKKSCloudKitFetchRequest

- (BOOL)participateInFetch
{
  return self->_participateInFetch;
}

- (void)setParticipateInFetch:(BOOL)a3
{
  self->_participateInFetch = a3;
}

- (BOOL)resync
{
  return self->_resync;
}

- (void)setResync:(BOOL)a3
{
  self->_resync = a3;
}

- (CKServerChangeToken)changeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChangeToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
}

@end
