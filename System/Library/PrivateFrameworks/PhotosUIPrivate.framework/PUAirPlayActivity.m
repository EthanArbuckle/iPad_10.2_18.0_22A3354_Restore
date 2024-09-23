@implementation PUAirPlayActivity

- (PUAirPlayActivity)init
{
  PUAirPlayActivity *v2;
  PUAirPlayActivity *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAirPlayActivity;
  v2 = -[UIActivity init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PUAirPlayActivity _registerForAirPlayNotifications](v2, "_registerForAirPlayNotifications");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PUAirPlayActivity _unregisterForAirPlayNotifications](self, "_unregisterForAirPlayNotifications");
  v3.receiver = self;
  v3.super_class = (Class)PUAirPlayActivity;
  -[PUAirPlayActivity dealloc](&v3, sel_dealloc);
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BC80];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("PUPHOTOBROWSER_BUTTON_AIRPLAY"));
}

- (id)_systemImageName
{
  return CFSTR("airplayvideo");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  char v4;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPreparingIndividualItems");

  return v4;
}

- (BOOL)isRouteAvailable
{
  void *v2;
  char v3;

  +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pu_hasAvailableRoute");

  return v3;
}

- (NSString)localizedRouteUnavailabilityMessage
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "routeUnavailableReason");

  if (v3 == 2)
    v4 = CFSTR("SHARING_AIRPLAY_ERROR_MESSAGE_EXTERNAL_DISPLAY_CONNECTED");
  else
    v4 = CFSTR("SHARING_AIRPLAY_ERROR_MESSAGE");
  PULocalizedString(v4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)performActivity
{
  _BOOL8 v3;
  void *v4;

  v3 = -[PUAirPlayActivity isRouteAvailable](self, "isRouteAvailable");
  if (v3)
  {
    -[PUAirPlayActivity _unregisterForAirPlayNotifications](self, "_unregisterForAirPlayNotifications");
    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notifyDidPresentAirPlayRoutesFromShareSheet");

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", v3);
}

- (void)_registerForAirPlayNotifications
{
  id v3;

  +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerRouteObserver:", self);

}

- (void)_unregisterForAirPlayNotifications
{
  id v3;

  +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterRouteObserver:", self);

}

@end
