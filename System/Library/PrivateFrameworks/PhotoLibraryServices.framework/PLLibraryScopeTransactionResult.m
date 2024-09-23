@implementation PLLibraryScopeTransactionResult

- (PLLibraryScopeTransactionResult)initWithToken:(id)a3 assetObjectIDs:(id)a4 detectedFaceObjectIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLLibraryScopeTransactionResult *v12;
  PLLibraryScopeTransactionResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLLibraryScopeTransactionResult;
  v12 = -[PLLibraryScopeTransactionResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lastProcessedCoreDataToken, a3);
    objc_storeStrong((id *)&v13->_assetObjectIDs, a4);
    objc_storeStrong((id *)&v13->_detectedFaceObjectIDs, a5);
  }

  return v13;
}

- (NSPersistentHistoryToken)lastProcessedCoreDataToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)assetObjectIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)detectedFaceObjectIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedFaceObjectIDs, 0);
  objc_storeStrong((id *)&self->_assetObjectIDs, 0);
  objc_storeStrong((id *)&self->_lastProcessedCoreDataToken, 0);
}

@end
