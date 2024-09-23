@implementation PKPaymentProvisioningControllerCredentialQueue

- (PKPaymentProvisioningControllerCredentialQueue)init
{
  PKPaymentProvisioningControllerCredentialQueue *v2;
  PKPaymentProvisioningControllerCredentialQueue *v3;
  NSMutableArray *v4;
  NSMutableArray *completedCredentials;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentProvisioningControllerCredentialQueue;
  v2 = -[PKPaymentProvisioningControllerCredentialQueue init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completedCredentials = v3->_completedCredentials;
    v3->_completedCredentials = v4;

  }
  return v3;
}

- (void)setCredentialsToProvision:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *credentials;

  self->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  credentials = self->_credentials;
  self->_credentials = v4;

  -[NSMutableArray removeAllObjects](self->_completedCredentials, "removeAllObjects");
}

- (void)removeCredential:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t currentIndex;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    v5 = -[NSMutableArray indexOfObject:](self->_credentials, "indexOfObject:", v4);
    v4 = v11;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      -[NSMutableArray addObject:](self->_completedCredentials, "addObject:", v11);
      -[NSMutableArray removeObjectAtIndex:](self->_credentials, "removeObjectAtIndex:", v6);
      v4 = v11;
      currentIndex = self->_currentIndex;
      if (currentIndex != 0x7FFFFFFFFFFFFFFFLL && v6 <= currentIndex)
      {
        v8 = currentIndex - 1;
        v9 = currentIndex == 0;
        v10 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v9)
          v10 = v8;
        self->_currentIndex = v10;
      }
    }
  }

}

- (id)nextCredentialToProvision
{
  unint64_t currentIndex;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  currentIndex = self->_currentIndex;
  if (currentIndex == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = currentIndex + 1;
  v5 = -[NSMutableArray count](self->_credentials, "count");
  v6 = 0;
  if (v4 < v5)
  {
    -[NSMutableArray objectAtIndex:](self->_credentials, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentIndex = v4;
  }
  return v6;
}

- (void)setCurrentCredential:(id)a3
{
  unint64_t v4;

  if (a3)
    v4 = -[NSMutableArray indexOfObject:](self->_credentials, "indexOfObject:");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  self->_currentIndex = v4;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_credentials, "count");
}

- (unint64_t)remaining
{
  unint64_t result;
  unint64_t currentIndex;
  unint64_t v5;

  result = -[NSMutableArray count](self->_credentials, "count");
  if (result)
  {
    currentIndex = self->_currentIndex;
    if (currentIndex == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
    else
      v5 = ~currentIndex;
    result += v5;
  }
  return result;
}

- (unint64_t)completedCount
{
  return -[NSMutableArray count](self->_completedCredentials, "count");
}

- (id)credentials
{
  return (id)-[NSMutableArray copy](self->_credentials, "copy");
}

- (id)completedCredentials
{
  return (id)-[NSMutableArray copy](self->_completedCredentials, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedCredentials, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
