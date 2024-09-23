@implementation ISODelayedOffer

- (id)serverDict
{
  id v2;
  void *v3;

  v2 = -[ISODelayedOffer newOfferResponse](self, "newOfferResponse");
  objc_msgSend(v2, "toContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)newOfferResponse
{
  id v2;

  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end
