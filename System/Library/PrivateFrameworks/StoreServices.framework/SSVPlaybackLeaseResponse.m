@implementation SSVPlaybackLeaseResponse

- (id)itemForItemIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSVPlaybackLeaseResponse;
  -[SSVPlaybackResponse itemForItemIdentifier:](&v4, sel_itemForItemIdentifier_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)leaseDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SSVPlaybackResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("leaseDurationInSeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      v4 = v5;
    }
  }
  else
  {
    v4 = 600.0;
  }

  return v4;
}

- (BOOL)isOfflineSlotAvailable
{
  void *v2;
  void *v3;
  char v4;

  -[SSVPlaybackResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("offlineSlotAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (NSData)leaseInfoData
{
  void *v2;
  void *v3;
  void *v4;

  -[SSVPlaybackResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ckc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  else
    v4 = 0;

  return (NSData *)v4;
}

- (NSData)subscriptionKeyBagData
{
  void *v2;
  void *v3;

  -[SSVPlaybackResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SSVSubscriptionBagForDictionary(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVPlaybackLeaseResponse;
  v4 = -[SSVPlaybackResponse copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setCertificateData:", self->_certificateData);
  objc_msgSend(v4, "setKDMovieIdentifier:", self->_kdMovieIdentifier);
  return v4;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)KDMovieIdentifier
{
  return self->_kdMovieIdentifier;
}

- (void)setKDMovieIdentifier:(unint64_t)a3
{
  self->_kdMovieIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateData, 0);
}

@end
