@implementation STUWhiteboard

- (CRKIDSPrimitives)IDSPrimitives
{
  CRKIDSPrimitives *IDSPrimitives;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRKIDSPrimitives *v8;
  CRKIDSPrimitives *v9;

  IDSPrimitives = self->_IDSPrimitives;
  if (!IDSPrimitives)
  {
    v4 = objc_alloc((Class)CRKLocalBackedIDSPrimitives);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUWhiteboard primitives](self, "primitives"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSLocalPrimitives"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUWhiteboard appleIDAuthenticator](self, "appleIDAuthenticator"));
    v8 = (CRKIDSPrimitives *)objc_msgSend(v4, "initWithIDSLocalPrimitives:IDSReadinessEvaluator:", v6, v7);
    v9 = self->_IDSPrimitives;
    self->_IDSPrimitives = v8;

    IDSPrimitives = self->_IDSPrimitives;
  }
  return IDSPrimitives;
}

- (STUAppleIDAuthenticator)appleIDAuthenticator
{
  STUAppleIDAuthenticator *appleIDAuthenticator;
  STUAppleIDAuthenticator *v3;
  void *v5;
  STUAppleIDAuthenticator *v6;
  void *v7;
  void *v8;
  void *v9;
  STUAppleIDAuthenticator *v10;
  STUAppleIDAuthenticator *v11;

  appleIDAuthenticator = self->_appleIDAuthenticator;
  if (appleIDAuthenticator)
  {
    v3 = appleIDAuthenticator;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUWhiteboard primitives](self, "primitives"));
    v6 = [STUAppleIDAuthenticator alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUWhiteboard monotonicClock](self, "monotonicClock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountsPrimitives"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSLocalPrimitives"));
    v10 = -[STUAppleIDAuthenticator initWithClock:accountsPrimitives:IDSLocalPrimitives:](v6, "initWithClock:accountsPrimitives:IDSLocalPrimitives:", v7, v8, v9);
    v11 = self->_appleIDAuthenticator;
    self->_appleIDAuthenticator = v10;

    v3 = self->_appleIDAuthenticator;
  }
  return v3;
}

- (STUDateProviderProtocol)monotonicClock
{
  STUDateProviderProtocol *monotonicClock;
  STUMonotonicDateProvider *v4;
  STUDateProviderProtocol *v5;

  monotonicClock = self->_monotonicClock;
  if (!monotonicClock)
  {
    v4 = objc_opt_new(STUMonotonicDateProvider);
    v5 = self->_monotonicClock;
    self->_monotonicClock = (STUDateProviderProtocol *)v4;

    monotonicClock = self->_monotonicClock;
  }
  return monotonicClock;
}

- (STUIDSCacheClearer)IDSCacheClearer
{
  STUIDSCacheClearer *IDSCacheClearer;
  STUIDSCacheClearer *v3;
  void *v5;
  STUIDSCacheClearer *v6;
  void *v7;
  void *v8;
  void *v9;
  STUIDSCacheClearer *v10;
  STUIDSCacheClearer *v11;

  IDSCacheClearer = self->_IDSCacheClearer;
  if (IDSCacheClearer)
  {
    v3 = IDSCacheClearer;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUWhiteboard primitives](self, "primitives"));
    v6 = [STUIDSCacheClearer alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUWhiteboard monotonicClock](self, "monotonicClock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSLocalPrimitives"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSAddressTranslator"));
    v10 = -[STUIDSCacheClearer initWithClock:IDSLocalPrimitives:IDSAddressTranslator:](v6, "initWithClock:IDSLocalPrimitives:IDSAddressTranslator:", v7, v8, v9);
    v11 = self->_IDSCacheClearer;
    self->_IDSCacheClearer = v10;

    v3 = self->_IDSCacheClearer;
  }
  return v3;
}

- (id)primitives
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primitives"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IDSCacheClearer, 0);
  objc_storeStrong((id *)&self->_monotonicClock, 0);
  objc_storeStrong((id *)&self->_appleIDAuthenticator, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

@end
