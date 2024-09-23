@implementation ICPlayActivityEventItemIDs

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
  if (self->_reportingAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" reportingAdamID: %lli"), self->_reportingAdamID);
  if (self->_subscriptionAdamID)
    objc_msgSend(v6, "appendFormat:", CFSTR(" subscriptionAdamID: %lli"), self->_subscriptionAdamID);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (ICPlayActivityEventItemIDs)initWithCoder:(id)a3
{
  id v4;
  ICPlayActivityEventItemIDs *v5;
  uint64_t v6;
  NSString *lyricsID;

  v4 = a3;
  v5 = -[ICPlayActivityEventItemIDs init](self, "init");
  if (v5)
  {
    v5->_cloudID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventItemIDsCloudID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICPlayActivityEventItemIDsLyricsID"));
    v6 = objc_claimAutoreleasedReturnValue();
    lyricsID = v5->_lyricsID;
    v5->_lyricsID = (NSString *)v6;

    v5->_purchasedAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventItemIDsPurchasedAdamID"));
    v5->_radioAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventItemIDsRadioAdamID"));
    v5->_equivalencySourceAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventItemIDsEquivalencySourceAdamID"));
    v5->_reportingAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventItemIDsReportingAdamID"));
    v5->_subscriptionAdamID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ICPlayActivityEventItemIDsSubscriptionAdamID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t cloudID;
  id v5;

  cloudID = self->_cloudID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", cloudID, CFSTR("ICPlayActivityEventItemIDsCloudID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lyricsID, CFSTR("ICPlayActivityEventItemIDsLyricsID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_purchasedAdamID, CFSTR("ICPlayActivityEventItemIDsPurchasedAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_radioAdamID, CFSTR("ICPlayActivityEventItemIDsRadioAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_equivalencySourceAdamID, CFSTR("ICPlayActivityEventItemIDsEquivalencySourceAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_reportingAdamID, CFSTR("ICPlayActivityEventItemIDsReportingAdamID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_subscriptionAdamID, CFSTR("ICPlayActivityEventItemIDsSubscriptionAdamID"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ICPlayActivityEventItemIDs _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
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
    v5[6] = self->_reportingAdamID;
    v5[7] = self->_subscriptionAdamID;
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

- (int64_t)reportingAdamID
{
  return self->_reportingAdamID;
}

- (int64_t)subscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
