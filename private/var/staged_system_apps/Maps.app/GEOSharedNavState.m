@implementation GEOSharedNavState

- (id)senderNameIncludingHandleIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderInfo](self, "senderInfo"));
  v4 = objc_msgSend(v3, "hasLocalContactIdentifier");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderInfo](self, "senderInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fromIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v8));

  }
  return v5;
}

- (id)initialNotificationSubtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = MSPBundle(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when sharing"), CFSTR("%@ is sharing ETA"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  return v7;
}

- (id)initialNotificationBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState finalETAInfo](self, "finalETAInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = -[GEOSharedNavState numberOfIntermediateStopsRemaining](self, "numberOfIntermediateStopsRemaining");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v10 = MSPBundle(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when sharing (with destination name)"), CFSTR("localized string not found"), 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v7, v14, v8, v6);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when sharing (no destination name)"), CFSTR("localized string not found"), 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v7, v14, v6, v18);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (id)initialMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState finalETAInfo](self, "finalETAInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = -[GEOSharedNavState numberOfIntermediateStopsRemaining](self, "numberOfIntermediateStopsRemaining");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v10 = MSPBundle(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body (with destination name)"), CFSTR("localized string not found"), 0));
    v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v7, v8, v6);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body (no destination name)"), CFSTR("localized string not found"), 0));
    v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v7, v6, v17);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (id)updateNotificationSubtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = MSPBundle(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update Notification's subtitle when sharing"), CFSTR("%@’s ETA has changed"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  return v7;
}

- (id)updateNotificationBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState etaInfo](self, "etaInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

  v11 = MSPBundle(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update Notification's body when sharing (with destination)"), CFSTR("%1$@ will now arrive at %2$@ around %3$@"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15, v8, v6);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update Notification's body when sharing (without destination)"), CFSTR("%1$@ will now arrive around %2$@"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15, v6, v19);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

- (id)updateMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint64_t v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState etaInfo](self, "etaInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

  v11 = MSPBundle(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update text message body (with destination)"), CFSTR("My updated arrival time to %1$@ is now around %2$@."), 0));
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v8, v6);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] update text message body (without destination)"), CFSTR("My updated arrival time is now around %@."), 0));
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v6, v18);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (id)chargingStopNotificationSubtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = MSPBundle(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when stopping at a charger"), CFSTR("%@ is making a stop"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  return v7;
}

- (id)chargingStopNotificationBody
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v7 = MSPBundle(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when stopping at a charger"), CFSTR("%@ has stopped at a charging station in %@."), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10, v4));

  return v11;
}

- (id)chargingStopMessage
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  v6 = MSPBundle(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body when stopping at a charger"), CFSTR("I have stopped at a charging station in %@."), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v3));

  return v9;
}

- (id)intermediateArrivalNotificationSubtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = MSPBundle(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when stopping at an intermediate waypoint"), CFSTR("%@ is making a stop"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  return v7;
}

- (id)intermediateArrivalNotificationBody
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v7 = MSPBundle(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when stopping at an intermediate waypoint"), CFSTR("%@ is stopping at %@ before continuing to %@."), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v4, v5);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when stopping at an intermediate waypoint, generic"), CFSTR("%@ is stopping at %@ before continuing to their destination."), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v4, v15);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)intermediateArrivalMessage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  uint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v7 = MSPBundle(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body when stopping at an intermediate waypoint"), CFSTR("I’m making a stop at %@ before continuing to %@."), 0));
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v4, v5);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] text message body when stopping at an intermediate waypoint, generic"), CFSTR("I’m making a stop at %@ before continuing to my destination."), 0));
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v4, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (id)waypointResumeNotificationSubtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = MSPBundle(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's subtitle when resuming sharing"), CFSTR("%@ has resumed the route"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  return v7;
}

- (id)waypointResumeNotificationBody
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState finalETAInfo](self, "finalETAInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v9 = MSPBundle(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when resuming sharing"), CFSTR("%@ will arrive at %@ around %@. Follow along in Maps."), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13, v7, v6);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Notification's body when resuming sharing, generic"), CFSTR("%@ will arrive at their destination around %@. Follow along in Maps."), 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13, v6, v17);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

- (id)waypointResumeMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  uint64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState finalETAInfo](self, "finalETAInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v9 = MSPBundle(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Text message body when resuming sharing"), CFSTR("I will arrive at %@ around %@. I’ll let you know if I’m running late."), 0));
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v7, v6);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] Text message body when resuming sharing, generic"), CFSTR("I will arrive at my destination around %@. I’ll let you know if I’m running late."), 0));
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v6, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (id)arrivalNotificationSubtitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = MSPBundle(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival notification subtitle"), CFSTR("%@ is arriving"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6));

  return v7;
}

- (id)arrivalNotificationBody
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  v7 = MSPBundle(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival notification body"), CFSTR("%@ is arriving at %@."), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v4);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival notification body, generic"), CFSTR("%@ is arriving at their destination."), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameIncludingHandleIfNecessary](self, "senderNameIncludingHandleIfNecessary"));
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v15);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)arrivalMessage
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState nextWaypointInfo](self, "nextWaypointInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  v6 = MSPBundle(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival text message body"), CFSTR("I’m arriving at %@ soon."), 0));
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v3);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] arrival text message body, generic"), CFSTR("I’m arriving at my destination soon."), 0));
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v13);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState homeCellTitle](self, "homeCellTitle"));
  objc_msgSend(v4, "setFirstLine:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState homeCellSubtitle](self, "homeCellSubtitle"));
  objc_msgSend(v4, "setSecondLine:", v6);

}

- (id)_transportTypeStringForAnalytics
{
  id v3;
  __CFString *v4;

  if (-[GEOSharedNavState hasTransportType](self, "hasTransportType"))
  {
    v3 = -[GEOSharedNavState transportType](self, "transportType");
    if (v3 >= 7)
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v3));
    else
      v4 = *(&off_1011D8FB8 + (int)v3);
  }
  else
  {
    v4 = CFSTR("UNKNOWN_TRANSPORT_TYPE");
  }
  return v4;
}

- (BOOL)disallowDetailsForChina
{
  return -[GEOSharedNavState referenceFrame](self, "referenceFrame") == 2
      && !+[GEOLocationShifter isLocationShiftEnabled](GEOLocationShifter, "isLocationShiftEnabled");
}

- (BOOL)disallowDetailsForTransportType
{
  unsigned int v3;
  uint64_t v4;

  if (!-[GEOSharedNavState hasTransportType](self, "hasTransportType"))
    return 1;
  v3 = -[GEOSharedNavState transportType](self, "transportType") - 1;
  if (v3 > 5)
    v4 = 1;
  else
    v4 = qword_100E3CA28[v3];
  return MSPSharedTripReceiverDetailViewSupportedForTransportType(v4) ^ 1;
}

- (BOOL)disallowDetailsForProtocolVersion
{
  unsigned int v3;
  unsigned int v4;

  v3 = -[GEOSharedNavState hasProtocolVersion](self, "hasProtocolVersion");
  if (v3)
  {
    v4 = -[GEOSharedNavState protocolVersion](self, "protocolVersion");
    LOBYTE(v3) = GEOConfigGetUInteger(MapsConfig_ShareETASupportedReceivedProtocolVersion, off_1014B3638) < (unint64_t)v4;
  }
  return v3;
}

- (BOOL)_disallowDetailsForAnyReason
{
  if (-[GEOSharedNavState disallowDetailsForChina](self, "disallowDetailsForChina")
    || -[GEOSharedNavState disallowDetailsForTransportType](self, "disallowDetailsForTransportType"))
  {
    return 1;
  }
  else
  {
    return -[GEOSharedNavState disallowDetailsForProtocolVersion](self, "disallowDetailsForProtocolVersion");
  }
}

- (id)alertTitleForDisallowedDetails
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Route Not Viewable [Share ETA]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)alertMessageForChinaError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState etaInfo](self, "etaInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("China outside-in error [Share ETA]"), CFSTR("localized string not found"), 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11, v12, v6));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("China outside-in error, generic [Share ETA]"), CFSTR("localized string not found"), 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11, v6));
  }

  return v13;
}

- (id)alertMessageForTransportOrProtocolError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState etaInfo](self, "etaInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v9 = objc_msgSend(v8, "userInterfaceIdiom");
  if (!v7)
  {
    if (v9 == (id)1)
    {

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v16 = objc_msgSend(v15, "userInterfaceIdiom");

      if (v16 != (id)5)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = v17;
        v19 = CFSTR("Transport error, generic (iOS) [Share ETA]");
        goto LABEL_15;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = v17;
    v19 = CFSTR("Transport error, generic (iPad) [Share ETA]");
LABEL_15:
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, CFSTR("localized string not found"), 0));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21, v6));
    goto LABEL_16;
  }
  if (v9 == (id)1)
  {

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 != (id)5)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("Transport error (iOS) [Share ETA]");
      goto LABEL_13;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = v12;
  v14 = CFSTR("Transport error (iPad) [Share ETA]");
LABEL_13:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v21, v22, v6));

LABEL_16:
  return v23;
}

- (id)alertMessageForClosedTrip
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Route not available anymore [Share ETA]"), CFSTR("localized string not found"), 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7));

    v5 = (void *)v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Route not available [Share ETA]"), CFSTR("localized string not found"), 0));
  }

  return v8;
}

- (id)homeCellTitle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != (id)5)
  {
    if ((-[GEOSharedNavState hasArrived](self, "hasArrived") & 1) != 0
      || (-[GEOSharedNavState hasClosed](self, "hasClosed") & 1) != 0
      || -[GEOSharedNavState _disallowDetailsForAnyReason](self, "_disallowDetailsForAnyReason"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v12)
      {
        if (v13)
        {
          v14 = CFSTR("[Shared Trip] Home cell title (destination, contact card, cannot see details)");
LABEL_11:
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));

          v15 = objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
LABEL_17:
          v10 = (void *)v15;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10, v18));

          goto LABEL_18;
        }
        v17 = CFSTR("[Shared Trip] Home cell title (destination, no contact card, cannot see details)");
        goto LABEL_16;
      }
      if (v13)
      {
        v16 = CFSTR("[Shared Trip] Home cell title (no destination, contact card, cannot see details)");
LABEL_14:
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));

        v9 = objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
        goto LABEL_4;
      }
      v7 = CFSTR("[Shared Trip] Home cell title (no destination, no contact card, cannot see details)");
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState destinationName](self, "destinationName"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderName](self, "senderName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v20)
      {
        if (v21)
        {
          v14 = CFSTR("[Shared Trip] Home cell title (destination, contact card, can see details)");
          goto LABEL_11;
        }
        v17 = CFSTR("[Shared Trip] Home cell title (destination, no contact card, can see details)");
LABEL_16:
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v17, CFSTR("localized string not found"), 0));

        v15 = objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));
        goto LABEL_17;
      }
      if (v21)
      {
        v16 = CFSTR("[Shared Trip] Home cell title (no destination, contact card, can see details)");
        goto LABEL_14;
      }
      v7 = CFSTR("[Shared Trip] Home cell title (no destination, no contact card, can see details)");
    }
    v5 = v6;
    goto LABEL_3;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  v7 = CFSTR("[Shared Trip] Home cell title (Mac)");
LABEL_3:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

  v9 = objc_claimAutoreleasedReturnValue(-[GEOSharedNavState senderNameOrHandle](self, "senderNameOrHandle"));
LABEL_4:
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v9));
LABEL_18:

  return v11;
}

- (id)homeCellSubtitle
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  unsigned int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  char *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  void *v47;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  if (-[GEOSharedNavState hasClosed](self, "hasClosed")
    && (-[GEOSharedNavState closed](self, "closed") & 1) != 0)
  {
    v4 = 0;
    v5 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState _transportTypeString](self, "_transportTypeString"));
    v5 = 0;
  }
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "addObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState finalETAInfo](self, "finalETAInfo"));
  if (objc_msgSend(v6, "hasEtaTimestamp"))
  {
    objc_msgSend(v6, "etaTimestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }
  else
  {
    v7 = 0;
  }
  if (-[GEOSharedNavState hasArrived](self, "hasArrived")
    && -[GEOSharedNavState arrived](self, "arrived"))
  {
    if (-[GEOSharedNavState hasArrivedTimestamp](self, "hasArrivedTimestamp"))
      -[GEOSharedNavState arrivedTimestamp](self, "arrivedTimestamp");
    else
      -[GEOSharedNavState updatedTimestamp](self, "updatedTimestamp");
    v21 = v8;
    if (v8 <= 0.0)
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Both arrived and updated timestamps are missing for this trip")));
        *(_DWORD *)buf = 136316162;
        v39 = "-[GEOSharedNavState(Maps) homeCellSubtitle]";
        v40 = 2080;
        v41 = "GEOSharedNavState+Maps.m";
        v42 = 1024;
        v43 = 195;
        v44 = 2080;
        v45 = "timestamp > 0";
        v46 = 2112;
        v47 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v35 = sub_1004318FC();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v39 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v12, v22, 0));

    v23 = -[GEOSharedNavState isNavigatingToIntermediateStop](self, "isNavigatingToIntermediateStop");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = v24;
    if (v23)
      v26 = CFSTR("Arrived at a stop at (time) [shared eta]");
    else
      v26 = CFSTR("Arrived at (time) [shared eta]");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, CFSTR("localized string not found"), 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v15));

    objc_msgSend(v3, "addObject:", v16);
    goto LABEL_26;
  }
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = -[GEOSharedNavState _willArriveSoon:](self, "_willArriveSoon:");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
    v11 = v9 ^ 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v7, v10, v9 ^ 1));

    if ((v11 & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Arriving soon around (time) [shared eta]"), CFSTR("localized string not found"), 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v12));

      objc_msgSend(v3, "addObject:", v15);
LABEL_27:

      goto LABEL_28;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState _arrivingAroundStringWithETATimeString:](self, "_arrivingAroundStringWithETATimeString:", v12));
    objc_msgSend(v3, "addObject:", v15);
    -[GEOSharedNavState updatedTimestamp](self, "updatedTimestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    objc_msgSend(v16, "timeIntervalSinceNow");
    v18 = v17;
    if (-[GEOSharedNavState hasUpdatedTimestamp](self, "hasUpdatedTimestamp") && v18 <= -60.0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:](NSDateComponentsFormatter, "_mapkit_descriptionForTimeSinceDate:", v16));
      v20 = objc_claimAutoreleasedReturnValue(-[GEOSharedNavState _lastUpdatedStringWithElapsedTime:](self, "_lastUpdatedStringWithElapsedTime:", v19));

      objc_msgSend(v3, "addObject:", v20);
      v15 = (void *)v20;
    }
LABEL_26:

    goto LABEL_27;
  }
LABEL_28:
  if (v5 && !objc_msgSend(v3, "count"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Shared Trip] ETA no longer available"), CFSTR("localized string not found"), 0));
    objc_msgSend(v3, "addObject:", v29);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("・")));

  return v30;
}

- (id)_transportTypeString
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  NSObject *v7;
  void *v9;
  _DWORD v10[2];

  if (!-[GEOSharedNavState hasTransportType](self, "hasTransportType"))
    return 0;
  switch(-[GEOSharedNavState transportType](self, "transportType"))
  {
    case 0u:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Shared Trip Cell Transport Type: Driving");
      break;
    case 1u:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Shared Trip Cell Transport Type: Transit");
      break;
    case 2u:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Shared Trip Cell Transport Type: Walking");
      break;
    case 3u:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Shared Trip Cell Transport Type: Cycling");
      break;
    default:
      v6 = sub_10043237C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10[0] = 67109120;
        v10[1] = -[GEOSharedNavState transportType](self, "transportType");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No transport type string for %d", (uint8_t *)v10, 8u);
      }

      return 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v9;
}

- (id)_arrivingAroundStringWithETATimeString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[GEOSharedNavState numberOfIntermediateStopsRemaining](self, "numberOfIntermediateStopsRemaining");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("(time) ETA [shared eta]"), CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v5, v4));
  return v8;
}

- (id)_lastUpdatedStringWithElapsedTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Last updated (time ago) [shared eta]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3));
  return v6;
}

- (BOOL)_willArriveSoon:(double)a3
{
  if (a3 < 0.0)
    return 0;
  if (GEOConfigGetDouble(GEOConfigMSPDefaultArrivingSoonInterval[0], GEOConfigMSPDefaultArrivingSoonInterval[1]) <= a3)
    return 0;
  if (-[GEOSharedNavState hasClosed](self, "hasClosed"))
    return -[GEOSharedNavState closed](self, "closed") ^ 1;
  return 1;
}

- (id)carPlayListCellSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSharedNavState etaInfo](self, "etaInfo"));
  objc_msgSend(v3, "etaTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

  if (-[GEOSharedNavState hasArrived](self, "hasArrived")
    && -[GEOSharedNavState arrived](self, "arrived"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Arrived [Shared ETA, List, CarPlay]");
    goto LABEL_9;
  }
  if (!-[GEOSharedNavState hasClosed](self, "hasClosed")
    || (-[GEOSharedNavState closed](self, "closed") & 1) == 0)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (!-[GEOSharedNavState _willArriveSoon:](self, "_willArriveSoon:"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:](NSDateFormatter, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v9, 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("00:00 ETA [CarPlay, Shared Trip]"), CFSTR("localized string not found"), 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v6));

      goto LABEL_11;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Arriving soon [Shared ETA, List, CarPlay]");
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));
LABEL_11:

    goto LABEL_12;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

@end
