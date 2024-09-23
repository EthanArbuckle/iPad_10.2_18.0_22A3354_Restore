@implementation PKTransactionSessionWrapper

- (PKTransactionSessionWrapper)initWithNFSession:(id)a3
{
  id v5;
  PKTransactionSessionWrapper *v6;
  PKTransactionSessionWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSessionWrapper;
  v6 = -[PKTransactionSessionWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nfSession, a3);

  return v7;
}

- (PKTransactionSessionWrapper)initWithSTSSession:(id)a3
{
  id v5;
  PKTransactionSessionWrapper *v6;
  PKTransactionSessionWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSessionWrapper;
  v6 = -[PKTransactionSessionWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stsSession, a3);

  return v7;
}

- (void)endSession
{
  NFSession *nfSession;
  STSSession *stsSession;

  nfSession = self->_nfSession;
  if (nfSession)
    -[NFSession endSession](nfSession, "endSession");
  stsSession = self->_stsSession;
  if (stsSession)
    -[STSSession endSessionWithCompletion:](stsSession, "endSessionWithCompletion:", &__block_literal_global_38);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4;
  NFSession *nfSession;
  STSSession *stsSession;
  id v7;

  v4 = a3;
  nfSession = self->_nfSession;
  v7 = v4;
  if (nfSession)
  {
    -[NFSession endSessionWithCompletion:](nfSession, "endSessionWithCompletion:", v4);
    v4 = v7;
  }
  stsSession = self->_stsSession;
  if (stsSession)
  {
    -[STSSession endSessionWithCompletion:](stsSession, "endSessionWithCompletion:", v7);
    v4 = v7;
  }

}

- (BOOL)isFirstInQueue
{
  unint64_t firstInQueue;
  NFSession *nfSession;

  firstInQueue = self->_firstInQueue;
  if (firstInQueue)
    return firstInQueue == 1;
  nfSession = self->_nfSession;
  if (nfSession)
    return -[NFSession isFirstInQueue](nfSession, "isFirstInQueue");
  else
    return 1;
}

- (void)setFirstInQueue:(BOOL)a3
{
  unint64_t v3;

  v3 = 1;
  if (!a3)
    v3 = 2;
  self->_firstInQueue = v3;
}

- (NFSession)nfSession
{
  return self->_nfSession;
}

- (STSSession)stsSession
{
  return self->_stsSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stsSession, 0);
  objc_storeStrong((id *)&self->_nfSession, 0);
}

@end
