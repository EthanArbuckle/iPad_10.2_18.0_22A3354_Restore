@implementation PLPersistentHistoryMarkerToken

- (PLPersistentHistoryMarkerToken)initWithToken:(id)a3
{
  id v4;
  PLPersistentHistoryMarkerToken *v5;
  uint64_t v6;
  NSPersistentHistoryToken *token;
  PLPersistentHistoryMarkerToken *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistentHistoryMarkerToken;
  v5 = -[PLPersistentHistoryMarkerToken init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    token = v5->_token;
    v5->_token = (NSPersistentHistoryToken *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)overrride_changeRequestForFetching
{
  return (id)objc_msgSend(MEMORY[0x1E0C97BD8], "fetchHistoryAfterToken:", self->_token);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLPersistentHistoryMarkerToken(%@)"), self->_token);
}

- (id)overrride_shortDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".Token(%@)"), self->_token);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
