@implementation ICMusicSubscriptionFairPlayKeyStatus

- (ICMusicSubscriptionFairPlayKeyStatus)initWithFairPlaySubscriptionInfo:(FPSubscriptionInfo_)a3
{
  int var1;
  unint64_t var0;
  ICMusicSubscriptionFairPlayKeyStatus *result;

  var1 = a3.var1;
  var0 = a3.var0;
  result = -[ICMusicSubscriptionFairPlayKeyStatus init](self, "init");
  if (result)
  {
    result->_accountUniqueIdentifier = var0;
    result->_hasOfflinePlaybackKeys = (var1 & 0xFFFFFFFE) == 2;
    result->_hasOnlinePlaybackKeys = (var1 & 0xFFFFFFFD) == 1;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_hasOfflinePlaybackKeys == v4[9]
    && self->_hasOnlinePlaybackKeys == v4[8];

  return v5;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_hasOfflinePlaybackKeys)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_hasOnlinePlaybackKeys)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p> - accountUniqueIdentifier: %llu - hasOfflinePlaybackKeys=%@ - hasOnlinePlaybackKeys=%@"), self, self->_accountUniqueIdentifier, v3, v2);
}

- (unint64_t)accountUniqueIdentifier
{
  return self->_accountUniqueIdentifier;
}

- (void)setAccountUniqueIdentifier:(unint64_t)a3
{
  self->_accountUniqueIdentifier = a3;
}

- (BOOL)hasOnlinePlaybackKeys
{
  return self->_hasOnlinePlaybackKeys;
}

- (void)setHasOnlinePlaybackKeys:(BOOL)a3
{
  self->_hasOnlinePlaybackKeys = a3;
}

- (BOOL)hasOfflinePlaybackKeys
{
  return self->_hasOfflinePlaybackKeys;
}

- (void)setHasOfflinePlaybackKeys:(BOOL)a3
{
  self->_hasOfflinePlaybackKeys = a3;
}

@end
