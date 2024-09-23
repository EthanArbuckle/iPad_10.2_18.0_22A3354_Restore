@implementation ConfiguratorClientInfo

- (id)copyWithZone:(_NSZone *)a3
{
  ConfiguratorClientInfo *v4;

  v4 = -[ConfiguratorClientInfo init](+[ConfiguratorClientInfo allocWithZone:](ConfiguratorClientInfo, "allocWithZone:", a3), "init");
  -[ConfiguratorClientInfo setPrewarmUWB:](v4, "setPrewarmUWB:", self->_prewarmUWB);
  -[ConfiguratorClientInfo setPrewarmSecureElementChannel:](v4, "setPrewarmSecureElementChannel:", self->_prewarmSecureElementChannel);
  -[ConfiguratorClientInfo setCarKeyRangingLimitExceeded:](v4, "setCarKeyRangingLimitExceeded:", self->_carKeyRangingLimitExceeded);
  -[ConfiguratorClientInfo setAcwgRangingLimitExceeded:](v4, "setAcwgRangingLimitExceeded:", self->_acwgRangingLimitExceeded);
  -[ConfiguratorClientInfo setPassiveAccessIntent:](v4, "setPassiveAccessIntent:", self->_passiveAccessIntent);
  return v4;
}

- (void)consumeInfoForAggregation:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unint64_t passiveAccessIntent;
  id v11;

  v4 = a3;
  v5 = v4;
  v11 = v4;
  if (self->_prewarmUWB)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v4, "prewarmUWB");
    v5 = v11;
  }
  self->_prewarmUWB = v6;
  if (self->_prewarmSecureElementChannel)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "prewarmSecureElementChannel");
    v5 = v11;
  }
  self->_prewarmSecureElementChannel = v7;
  if (self->_carKeyRangingLimitExceeded)
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(v5, "carKeyRangingLimitExceeded");
    v5 = v11;
  }
  self->_carKeyRangingLimitExceeded = v8;
  if (self->_acwgRangingLimitExceeded)
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v5, "acwgRangingLimitExceeded");
    v5 = v11;
  }
  self->_acwgRangingLimitExceeded = v9;
  passiveAccessIntent = self->_passiveAccessIntent;
  self->_passiveAccessIntent = (unint64_t)objc_msgSend(v5, "passiveAccessIntent") | passiveAccessIntent;

}

- (id)description
{
  _BOOL8 prewarmUWB;
  _BOOL8 prewarmSecureElementChannel;
  _BOOL8 carKeyRangingLimitExceeded;
  _BOOL8 acwgRangingLimitExceeded;
  void *v6;
  void *v7;

  prewarmUWB = self->_prewarmUWB;
  prewarmSecureElementChannel = self->_prewarmSecureElementChannel;
  carKeyRangingLimitExceeded = self->_carKeyRangingLimitExceeded;
  acwgRangingLimitExceeded = self->_acwgRangingLimitExceeded;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NIUtils NISystemPassiveAccessIntentToString:](NIUtils, "NISystemPassiveAccessIntentToString:", self->_passiveAccessIntent));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[prewarm [UWB: %d, SE channel: %d], limits exceeded [CarKey: %d, ACWG: %d], passive access intent: %@]"), prewarmUWB, prewarmSecureElementChannel, carKeyRangingLimitExceeded, acwgRangingLimitExceeded, v6));

  return v7;
}

- (BOOL)prewarmUWB
{
  return self->_prewarmUWB;
}

- (void)setPrewarmUWB:(BOOL)a3
{
  self->_prewarmUWB = a3;
}

- (BOOL)prewarmSecureElementChannel
{
  return self->_prewarmSecureElementChannel;
}

- (void)setPrewarmSecureElementChannel:(BOOL)a3
{
  self->_prewarmSecureElementChannel = a3;
}

- (BOOL)carKeyRangingLimitExceeded
{
  return self->_carKeyRangingLimitExceeded;
}

- (void)setCarKeyRangingLimitExceeded:(BOOL)a3
{
  self->_carKeyRangingLimitExceeded = a3;
}

- (BOOL)acwgRangingLimitExceeded
{
  return self->_acwgRangingLimitExceeded;
}

- (void)setAcwgRangingLimitExceeded:(BOOL)a3
{
  self->_acwgRangingLimitExceeded = a3;
}

- (unint64_t)passiveAccessIntent
{
  return self->_passiveAccessIntent;
}

- (void)setPassiveAccessIntent:(unint64_t)a3
{
  self->_passiveAccessIntent = a3;
}

@end
