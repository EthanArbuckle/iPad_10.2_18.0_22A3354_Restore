@implementation SKUIRedeem

- (SKUIRedeem)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIRedeem *v11;
  SKUIRedeem *v12;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIRedeem init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIRedeem;
  v11 = -[SKUIRedeem init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[SKUIRedeem setITunesPassLearnMoreAlertInterval:](v11, "setITunesPassLearnMoreAlertInterval:", -1.0);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIRedeem)initWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIRedeem *v13;
  uint64_t v14;
  NSArray *items;
  uint64_t v16;
  NSArray *downloads;
  uint64_t v18;
  NSString *inAppPurchase;
  uint64_t v20;
  NSString *credit;
  uint64_t v22;
  NSString *creditDisplay;
  uint64_t v24;
  NSString *balance;
  uint64_t v26;
  NSDictionary *thankYouDictionary;
  uint64_t v28;
  NSURL *redirectURL;
  uint64_t v30;
  NSURL *customizedThankyouURL;
  uint64_t v32;
  UIImage *headerImage;
  uint64_t v34;
  SKUIArtworkProviding *headerArtworkProvider;
  uint64_t v36;
  NSString *title;
  uint64_t v38;
  NSString *message;
  uint64_t v40;
  NSArray *links;
  objc_super v43;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIRedeem initWithCoder:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v43.receiver = self;
  v43.super_class = (Class)SKUIRedeem;
  v13 = -[SKUIRedeem init](&v43, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("items"));
    v14 = objc_claimAutoreleasedReturnValue();
    items = v13->_items;
    v13->_items = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloads"));
    v16 = objc_claimAutoreleasedReturnValue();
    downloads = v13->_downloads;
    v13->_downloads = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inAppPurchase"));
    v18 = objc_claimAutoreleasedReturnValue();
    inAppPurchase = v13->_inAppPurchase;
    v13->_inAppPurchase = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credit"));
    v20 = objc_claimAutoreleasedReturnValue();
    credit = v13->_credit;
    v13->_credit = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditDisplay"));
    v22 = objc_claimAutoreleasedReturnValue();
    creditDisplay = v13->_creditDisplay;
    v13->_creditDisplay = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v24 = objc_claimAutoreleasedReturnValue();
    balance = v13->_balance;
    v13->_balance = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thankYouDictionary"));
    v26 = objc_claimAutoreleasedReturnValue();
    thankYouDictionary = v13->_thankYouDictionary;
    v13->_thankYouDictionary = (NSDictionary *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redirectURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    redirectURL = v13->_redirectURL;
    v13->_redirectURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customizedThankyouURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    customizedThankyouURL = v13->_customizedThankyouURL;
    v13->_customizedThankyouURL = (NSURL *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerImage"));
    v32 = objc_claimAutoreleasedReturnValue();
    headerImage = v13->_headerImage;
    v13->_headerImage = (UIImage *)v32;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("headerArtworkProvider"));
    v34 = objc_claimAutoreleasedReturnValue();
    headerArtworkProvider = v13->_headerArtworkProvider;
    v13->_headerArtworkProvider = (SKUIArtworkProviding *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v36 = objc_claimAutoreleasedReturnValue();
    title = v13->_title;
    v13->_title = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v38 = objc_claimAutoreleasedReturnValue();
    message = v13->_message;
    v13->_message = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("links"));
    v40 = objc_claimAutoreleasedReturnValue();
    links = v13->_links;
    v13->_links = (NSArray *)v40;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *items;
  id v5;

  items = self->_items;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", items, CFSTR("items"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloads, CFSTR("downloads"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inAppPurchase, CFSTR("inAppPurchase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credit, CFSTR("credit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creditDisplay, CFSTR("creditDisplay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thankYouDictionary, CFSTR("thankYouDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redirectURL, CFSTR("redirectURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customizedThankyouURL, CFSTR("customizedThankyouURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headerImage, CFSTR("headerImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headerArtworkProvider, CFSTR("headerArtworkProvider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_links, CFSTR("links"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hideItemView, CFSTR("hideItemView"));

}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSArray)downloads
{
  return self->_downloads;
}

- (void)setDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_downloads, a3);
}

- (NSString)inAppPurchase
{
  return self->_inAppPurchase;
}

- (void)setInAppPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPurchase, a3);
}

- (NSString)credit
{
  return self->_credit;
}

- (void)setCredit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)creditDisplay
{
  return self->_creditDisplay;
}

- (void)setCreditDisplay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)thankYouDictionary
{
  return self->_thankYouDictionary;
}

- (void)setThankYouDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_thankYouDictionary, a3);
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
  objc_storeStrong((id *)&self->_redirectURL, a3);
}

- (NSURL)customizedThankyouURL
{
  return self->_customizedThankyouURL;
}

- (void)setCustomizedThankyouURL:(id)a3
{
  objc_storeStrong((id *)&self->_customizedThankyouURL, a3);
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (void)setHeaderImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerImage, a3);
}

- (SKUIArtworkProviding)headerArtworkProvider
{
  return self->_headerArtworkProvider;
}

- (void)setHeaderArtworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_headerArtworkProvider, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_storeStrong((id *)&self->_links, a3);
}

- (BOOL)hideItemView
{
  return self->_hideItemView;
}

- (void)setHideItemView:(BOOL)a3
{
  self->_hideItemView = a3;
}

- (double)ITunesPassLearnMoreAlertInterval
{
  return self->_ITunesPassLearnMoreAlertInterval;
}

- (void)setITunesPassLearnMoreAlertInterval:(double)a3
{
  self->_ITunesPassLearnMoreAlertInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_headerArtworkProvider, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_customizedThankyouURL, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_thankYouDictionary, 0);
  objc_storeStrong((id *)&self->_creditDisplay, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_credit, 0);
  objc_storeStrong((id *)&self->_inAppPurchase, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)init
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
