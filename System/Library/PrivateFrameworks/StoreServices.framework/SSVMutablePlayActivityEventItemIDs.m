@implementation SSVMutablePlayActivityEventItemIDs

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SSVPlayActivityEventItemIDs _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (void)setCloudID:(unint64_t)a3
{
  self->super._cloudID = a3;
}

- (void)setLyricsID:(id)a3
{
  NSString *v4;
  NSString *lyricsID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  lyricsID = self->super._lyricsID;
  self->super._lyricsID = v4;

}

- (void)setPurchasedAdamID:(int64_t)a3
{
  self->super._purchasedAdamID = a3;
}

- (void)setRadioAdamID:(int64_t)a3
{
  self->super._radioAdamID = a3;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  self->super._equivalencySourceAdamID = a3;
}

- (void)setSubscriptionAdamID:(int64_t)a3
{
  self->super._subscriptionAdamID = a3;
}

- (void)setTvShowPurchasedAdamID:(int64_t)a3
{
  self->super._tvShowPurchasedAdamID = a3;
}

- (void)setTvShowSubscriptionAdamID:(int64_t)a3
{
  self->super._tvShowSubscriptionAdamID = a3;
}

@end
