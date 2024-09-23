@implementation ICQOfferCacheObject

- (ICQOfferCacheObject)initWithDaemonOffer:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  ICQOfferCacheObject *v9;
  ICQOfferCacheObject *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQOfferCacheObject;
  v9 = -[ICQOfferCacheObject init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonOffer, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

- (id)offer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  -[ICQOfferCacheObject daemonOffer](self, "daemonOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQOfferCacheObject bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = (void *)objc_opt_class();
    objc_msgSend(v5, "isEqual:", objc_opt_class());
    v6 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v3, "serverDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountAltDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "retrievalDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callbackInterval");
    v12 = v11;
    objc_msgSend(v3, "appLaunchLinkForBundleID:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v6, "initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:", v7, v8, v9, v10, v13, v4, v12);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ICQDaemonOffer)daemonOffer
{
  return self->_daemonOffer;
}

- (void)setDaemonOffer:(id)a3
{
  objc_storeStrong((id *)&self->_daemonOffer, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonOffer, 0);
}

@end
