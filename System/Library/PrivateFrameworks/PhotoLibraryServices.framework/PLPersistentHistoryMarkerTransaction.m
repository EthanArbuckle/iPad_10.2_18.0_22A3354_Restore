@implementation PLPersistentHistoryMarkerTransaction

- (PLPersistentHistoryMarkerTransaction)initWithTransaction:(id)a3
{
  id v5;
  PLPersistentHistoryMarkerTransaction *v6;
  PLPersistentHistoryMarkerTransaction *v7;
  PLPersistentHistoryMarkerTransaction *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistentHistoryMarkerTransaction;
  v6 = -[PLPersistentHistoryMarkerTransaction init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v8 = v7;
  }

  return v7;
}

- (id)overrride_changeRequestForFetching
{
  return (id)objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterTransaction:", self->_transaction);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLPersistentHistoryMarkerTransaction(%@)"), self->_transaction);
}

- (id)overrride_shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".Transaction(%@)"), self->_transaction);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
