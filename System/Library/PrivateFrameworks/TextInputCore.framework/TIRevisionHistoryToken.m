@implementation TIRevisionHistoryToken

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  TITokenID v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TIRevisionHistoryToken tokenInputString](self, "tokenInputString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TIRevisionHistoryToken offset](self, "offset");
  v7 = -[TIRevisionHistoryToken tokenID](self, "tokenID");
  v8 = (unint64_t)-[TIRevisionHistoryToken tokenID](self, "tokenID") >> 32;
  -[TIRevisionHistoryToken tokenDictionaryString](self, "tokenDictionaryString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; string %@; offset %u; ID [%u]%u; surface form %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)tokenDictionaryString
{
  NSString *tokenDictionaryString;

  tokenDictionaryString = self->_tokenDictionaryString;
  if (!tokenDictionaryString)
    tokenDictionaryString = self->_tokenInputString;
  return tokenDictionaryString;
}

- (NSString)tokenInputString
{
  return self->_tokenInputString;
}

- (void)setTokenInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (TITokenID)tokenID
{
  return self->_tokenID;
}

- (void)setTokenID:(TITokenID)a3
{
  self->_tokenID = a3;
}

- (void)setTokenDictionaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)userTyping
{
  return self->_userTyping;
}

- (void)setUserTyping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)tokenLatinInputString
{
  return self->_tokenLatinInputString;
}

- (void)setTokenLatinInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)usageLearningMask
{
  return self->_usageLearningMask;
}

- (void)setUsageLearningMask:(unsigned int)a3
{
  self->_usageLearningMask = a3;
}

- (unsigned)usageTrackingMask
{
  return self->_usageTrackingMask;
}

- (void)setUsageTrackingMask:(unsigned int)a3
{
  self->_usageTrackingMask = a3;
}

- (BOOL)isAccepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenLatinInputString, 0);
  objc_storeStrong((id *)&self->_userTyping, 0);
  objc_storeStrong((id *)&self->_tokenDictionaryString, 0);
  objc_storeStrong((id *)&self->_tokenInputString, 0);
}

@end
