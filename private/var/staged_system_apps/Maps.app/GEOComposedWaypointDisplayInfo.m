@implementation GEOComposedWaypointDisplayInfo

- (void)_routeCreation_setStartWaypointCaption
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Start Anchor Caption"), CFSTR("localized string not found"), 0));

  v4 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", v5);
  -[GEOComposedWaypointDisplayInfo setWaypointCaption:](self, "setWaypointCaption:", v4);

}

- (void)_routeCreation_setEndWaypointCaption
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Route Creation] End Anchor Caption"), CFSTR("localized string not found"), 0));

  v4 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", v5);
  -[GEOComposedWaypointDisplayInfo setWaypointCaption:](self, "setWaypointCaption:", v4);

}

- (void)_routeCreation_setStartEndWaypointCaption
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Combined Start End Anchor Caption"), CFSTR("localized string not found"), 0));

  v4 = objc_msgSend(objc_alloc((Class)GEOComposedString), "initWithString:", v5);
  -[GEOComposedWaypointDisplayInfo setWaypointCaption:](self, "setWaypointCaption:", v4);

}

- (void)_routeCreation_setMyLocationName
{
  uint64_t v3;
  id v4;

  v3 = MKLocalizedStringForCurrentLocation(self, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[GEOComposedWaypointDisplayInfo setName:](self, "setName:", v4);

}

@end
