@implementation SSVPlayActivityEventItemIDs

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_cloudID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" cloudID: %llu"), self->_cloudID);
  if (-[NSString length](self->_lyricsID, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR(" lyricsID: %@"), self->_lyricsID);
  if (self->_purchasedAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" purchasedAdamID: %lli"), self->_purchasedAdamID);
  if (self->_radioAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" radioAdamID: %lli"), self->_radioAdamID);
  if (self->_equivalencySourceAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" equivalencySourceAdamID: %lli"), self->_equivalencySourceAdamID);
  if (self->_subscriptionAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" subscriptionAdamID: %lli"), self->_subscriptionAdamID);
  if (self->_tvShowPurchasedAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" tvShowPurchasedAdamID: %lli"), self->_tvShowPurchasedAdamID);
  if (self->_tvShowSubscriptionAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" tvShowSubscriptionAdamID: %lli"), self->_tvShowSubscriptionAdamID);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (SSVPlayActivityEventItemIDs)initWithCoder:(id)a3
{
  id v4;
  SSVPlayActivityEventItemIDs *v5;
  uint64_t v6;
  NSString *lyricsID;

  v4 = a3;
  v5 = -[SSVPlayActivityEventItemIDs init](self, "init");
  if (v5)
  {
    v5->_cloudID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVPlayActivityEventItemIDsCloudID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSVPlayActivityEventItemIDsLyricsID"));
    v6 = objc_claimAutoreleasedReturnValue();
    lyricsID = v5->_lyricsID;
    v5->_lyricsID = (NSString *)v6;

    v5->_purchasedAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVPlayActivityEventItemIDsPurchasedAdamID"));
    v5->_radioAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVPlayActivityEventItemIDsRadioAdamID"));
    v5->_equivalencySourceAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVPlayActivityEventItemIDsEquivalencySourceAdamID"));
    v5->_subscriptionAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVPlayActivityEventItemIDsSubscriptionAdamID"));
    v5->_tvShowPurchasedAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVPlayActivityEventItemIDsTVShowPurchasedAdamID"));
    v5->_tvShowSubscriptionAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SSVPlayActivityEventItemIDsTVShowSubscriptionAdamID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t cloudID;
  id v5;

  cloudID = self->_cloudID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", cloudID, CFSTR("SSVPlayActivityEventItemIDsCloudID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lyricsID, CFSTR("SSVPlayActivityEventItemIDsLyricsID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_purchasedAdamID, CFSTR("SSVPlayActivityEventItemIDsPurchasedAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_radioAdamID, CFSTR("SSVPlayActivityEventItemIDsRadioAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_equivalencySourceAdamID, CFSTR("SSVPlayActivityEventItemIDsEquivalencySourceAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_subscriptionAdamID, CFSTR("SSVPlayActivityEventItemIDsSubscriptionAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_tvShowPurchasedAdamID, CFSTR("SSVPlayActivityEventItemIDsTVShowPurchasedAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_tvShowSubscriptionAdamID, CFSTR("SSVPlayActivityEventItemIDsTVShowSubscriptionAdamID"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SSVPlayActivityEventItemIDs _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_copyWithClass:(Class)a3
{
  id v4;
  _QWORD *v5;

  v4 = objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 2) = self->_cloudID;
    objc_storeStrong((id *)v4 + 3, self->_lyricsID);
    v5[4] = self->_purchasedAdamID;
    v5[5] = self->_radioAdamID;
    v5[1] = self->_equivalencySourceAdamID;
    v5[6] = self->_subscriptionAdamID;
    v5[7] = self->_tvShowPurchasedAdamID;
    v5[8] = self->_tvShowSubscriptionAdamID;
  }
  return v5;
}

- (unint64_t)cloudID
{
  return self->_cloudID;
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (int64_t)purchasedAdamID
{
  return self->_purchasedAdamID;
}

- (int64_t)radioAdamID
{
  return self->_radioAdamID;
}

- (int64_t)equivalencySourceAdamID
{
  return self->_equivalencySourceAdamID;
}

- (int64_t)subscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (int64_t)tvShowPurchasedAdamID
{
  return self->_tvShowPurchasedAdamID;
}

- (int64_t)tvShowSubscriptionAdamID
{
  return self->_tvShowSubscriptionAdamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsID, 0);
}

@end
