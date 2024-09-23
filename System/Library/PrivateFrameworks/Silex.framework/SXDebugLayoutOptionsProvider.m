@implementation SXDebugLayoutOptionsProvider

- (SXDebugLayoutOptionsProvider)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  int64x2_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXDebugLayoutOptionsProvider;
  v2 = -[SXDebugLayoutOptionsProvider init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v3;

    v5 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)(v2 + 8) = v5;
    *(int64x2_t *)(v2 + 24) = v5;
    *(int64x2_t *)(v2 + 40) = v5;
  }
  return (SXDebugLayoutOptionsProvider *)v2;
}

- (id)overrideContentSizeCategory:(id)a3
{
  return a3;
}

- (unint64_t)overrideViewingLocation:(unint64_t)a3
{
  if (self->_viewingLocation == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  else
    return self->_viewingLocation;
}

- (int64_t)overrideBundleSubscriptionStatus:(int64_t)a3
{
  if (self->_bundleSubscriptionStatus == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  else
    return self->_bundleSubscriptionStatus;
}

- (int64_t)overrideChannelSubscriptionStatus:(int64_t)a3
{
  if (self->_channelSubscriptionStatus == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  else
    return self->_channelSubscriptionStatus;
}

- (int64_t)overrideNewsletterSubscriptionStatus:(unint64_t)a3
{
  if (self->_newsletterSubscriptionStatus == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  else
    return self->_newsletterSubscriptionStatus;
}

- (int64_t)overrideOfferUpsellScenario:(int64_t)a3
{
  if (self->_offerUpsellScenario == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  else
    return self->_offerUpsellScenario;
}

- (int64_t)overrideSubscriptionActivationEligibility:(int64_t)a3
{
  if (self->_subscriptionActivationEligibility == 0x7FFFFFFFFFFFFFFFLL)
    return a3;
  else
    return self->_subscriptionActivationEligibility;
}

- (id)overrideConditionKeys:(id)a3
{
  return a3;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXDebugLayoutOptionsProvider observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXDebugLayoutOptionsProvider observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)setViewingLocation:(unint64_t)a3
{
  if (self->_viewingLocation != a3)
  {
    self->_viewingLocation = a3;
    -[SXDebugLayoutOptionsProvider notifyObservers](self, "notifyObservers");
  }
}

- (void)setBundleSubscriptionStatus:(int64_t)a3
{
  if (self->_bundleSubscriptionStatus != a3)
  {
    self->_bundleSubscriptionStatus = a3;
    -[SXDebugLayoutOptionsProvider notifyObservers](self, "notifyObservers");
  }
}

- (void)setChannelSubscriptionStatus:(int64_t)a3
{
  if (self->_channelSubscriptionStatus != a3)
  {
    self->_channelSubscriptionStatus = a3;
    -[SXDebugLayoutOptionsProvider notifyObservers](self, "notifyObservers");
  }
}

- (void)setNewsletterSubscriptionStatus:(unint64_t)a3
{
  if (self->_newsletterSubscriptionStatus != a3)
  {
    self->_newsletterSubscriptionStatus = a3;
    -[SXDebugLayoutOptionsProvider notifyObservers](self, "notifyObservers");
  }
}

- (void)setOfferUpsellScenario:(int64_t)a3
{
  if (self->_offerUpsellScenario != a3)
  {
    self->_offerUpsellScenario = a3;
    -[SXDebugLayoutOptionsProvider notifyObservers](self, "notifyObservers");
  }
}

- (void)setSubscriptionActivationEligibility:(int64_t)a3
{
  if (self->_subscriptionActivationEligibility != a3)
  {
    self->_subscriptionActivationEligibility = a3;
    -[SXDebugLayoutOptionsProvider notifyObservers](self, "notifyObservers");
  }
}

- (void)notifyObservers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SXDebugLayoutOptionsProvider observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "debugLayoutOptionsDidChange:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (unint64_t)viewingLocation
{
  return self->_viewingLocation;
}

- (int64_t)bundleSubscriptionStatus
{
  return self->_bundleSubscriptionStatus;
}

- (int64_t)channelSubscriptionStatus
{
  return self->_channelSubscriptionStatus;
}

- (unint64_t)newsletterSubscriptionStatus
{
  return self->_newsletterSubscriptionStatus;
}

- (int64_t)offerUpsellScenario
{
  return self->_offerUpsellScenario;
}

- (int64_t)subscriptionActivationEligibility
{
  return self->_subscriptionActivationEligibility;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
