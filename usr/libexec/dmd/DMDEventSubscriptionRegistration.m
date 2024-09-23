@implementation DMDEventSubscriptionRegistration

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistration payloadMetadata](self, "payloadMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "organization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventSubscriptionRegistration payloadMetadata](self, "payloadMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v5, v7));

  return v8;
}

+ (BOOL)automaticallyNotifiesObserversOfPayloadMetadata
{
  return 0;
}

- (void)setPayloadMetadata:(id)a3
{
  id v4;

  v4 = a3;
  -[DMDEventSubscriptionRegistration willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("payloadMetadata"));
  -[DMDEventSubscriptionRegistration setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("payloadMetadata"));

  -[DMDEventSubscriptionRegistration didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("payloadMetadata"));
}

+ (id)fetchRequestMatchingRegistrationFromOrganizationWithIdentifier:(id)a3 payloadIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DMDEventSubscriptionRegistration fetchRequest](DMDEventSubscriptionRegistration, "fetchRequest"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("payloadMetadata.organization.identifier = %@ AND payloadMetadata.identifier = %@"), v6, v5));

  objc_msgSend(v7, "setPredicate:", v8);
  return v7;
}

@end
