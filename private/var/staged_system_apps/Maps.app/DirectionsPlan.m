@implementation DirectionsPlan

+ (id)_maps_expiryDateForRoute:(id)a3
{
  unsigned int v3;
  double Double;

  if (a3)
  {
    v3 = objc_msgSend(a3, "expectedTime");
    Double = (double)v3 + (double)v3;
    if (v3 > 0xE10)
      Double = (double)v3 + 3600.0;
  }
  else
  {
    Double = GEOConfigGetDouble(MapsConfig_MapsActivityDirectionsExpiryTimeDefaults, off_1014B2E38);
  }
  return +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", Double);
}

- (BOOL)hasRouteRequestStorage
{
  return self->_routeRequestStorage != 0;
}

- (BOOL)hasOriginString
{
  return self->_originString != 0;
}

- (BOOL)hasDestinationString
{
  return self->_destinationString != 0;
}

- (void)setDepartureTime:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_departureTime = a3;
}

- (void)setHasDepartureTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDepartureTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setArrivalTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_arrivalTime = a3;
}

- (void)setHasArrivalTime:(BOOL)a3
{
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasArrivalTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCurrentRouteIndex:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_currentRouteIndex = a3;
}

- (void)setHasCurrentRouteIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCurrentRouteIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCurrentRouteStep:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_currentRouteStep = a3;
}

- (void)setHasCurrentRouteStep:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCurrentRouteStep
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)displayMethod
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_displayMethod;
  else
    return 0;
}

- (void)setDisplayMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_displayMethod = a3;
}

- (void)setHasDisplayMethod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDisplayMethod
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)displayMethodAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1011C0CA0[a3];
}

- (int)StringAsDisplayMethod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DirectionsSearch")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RoutePicking")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DirectionsStarted")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTransitPreferences
{
  return self->_transitPreferences != 0;
}

- (void)setRoutesPerInitialPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_routesPerInitialPage = a3;
}

- (void)setHasRoutesPerInitialPage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRoutesPerInitialPage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setEarlierPagesLoaded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_earlierPagesLoaded = a3;
}

- (void)setHasEarlierPagesLoaded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEarlierPagesLoaded
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setLaterPagesLoaded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_laterPagesLoaded = a3;
}

- (void)setHasLaterPagesLoaded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLaterPagesLoaded
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setRoutesPerEarlierPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_routesPerEarlierPage = a3;
}

- (void)setHasRoutesPerEarlierPage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRoutesPerEarlierPage
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setRoutesPerLaterPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_routesPerLaterPage = a3;
}

- (void)setHasRoutesPerLaterPage:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRoutesPerLaterPage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (int)transitPrioritization
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_transitPrioritization;
  else
    return 0;
}

- (void)setTransitPrioritization:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_transitPrioritization = a3;
}

- (void)setHasTransitPrioritization:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTransitPrioritization
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)transitPrioritizationAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_1011C0CB8[a3];
}

- (int)StringAsTransitPrioritization:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRAVEL_TIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTransitSurchargeOption:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_transitSurchargeOption = a3;
}

- (void)setHasTransitSurchargeOption:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTransitSurchargeOption
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setExpiryTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_expiryTime = a3;
}

- (void)setHasExpiryTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasExpiryTime
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsPlayingTrace:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isPlayingTrace = a3;
}

- (void)setHasIsPlayingTrace:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsPlayingTrace
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setShouldRestoreLowGuidance:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_shouldRestoreLowGuidance = a3;
}

- (void)setHasShouldRestoreLowGuidance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasShouldRestoreLowGuidance
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setAvoidTolls:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_avoidTolls = a3;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasAvoidTolls
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_avoidHighways = a3;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C75E4E3A3DEB277DB9C7B3008F0DFC00)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAvoidHighways
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)clearPlanningWaypoints
{
  -[NSMutableArray removeAllObjects](self->_planningWaypoints, "removeAllObjects");
}

- (void)addPlanningWaypoint:(id)a3
{
  id v4;
  NSMutableArray *planningWaypoints;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  planningWaypoints = self->_planningWaypoints;
  v8 = v4;
  if (!planningWaypoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_planningWaypoints;
    self->_planningWaypoints = v6;

    v4 = v8;
    planningWaypoints = self->_planningWaypoints;
  }
  -[NSMutableArray addObject:](planningWaypoints, "addObject:", v4);

}

- (unint64_t)planningWaypointsCount
{
  return (unint64_t)-[NSMutableArray count](self->_planningWaypoints, "count");
}

- (id)planningWaypointAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_planningWaypoints, "objectAtIndex:", a3);
}

+ (Class)planningWaypointType
{
  return (Class)objc_opt_class(DirectionsPlanWaypoint, a2);
}

- (void)clearHandlesForSharingETAs
{
  -[NSMutableArray removeAllObjects](self->_handlesForSharingETAs, "removeAllObjects");
}

- (void)addHandlesForSharingETA:(id)a3
{
  id v4;
  NSMutableArray *handlesForSharingETAs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  handlesForSharingETAs = self->_handlesForSharingETAs;
  v8 = v4;
  if (!handlesForSharingETAs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_handlesForSharingETAs;
    self->_handlesForSharingETAs = v6;

    v4 = v8;
    handlesForSharingETAs = self->_handlesForSharingETAs;
  }
  -[NSMutableArray addObject:](handlesForSharingETAs, "addObject:", v4);

}

- (unint64_t)handlesForSharingETAsCount
{
  return (unint64_t)-[NSMutableArray count](self->_handlesForSharingETAs, "count");
}

- (id)handlesForSharingETAAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_handlesForSharingETAs, "objectAtIndex:", a3);
}

+ (Class)handlesForSharingETAType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (BOOL)hasCompanionRouteContextData
{
  return self->_companionRouteContextData != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DirectionsPlan;
  v3 = -[DirectionsPlan description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  void *v5;
  NSString *originString;
  NSString *destinationString;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t displayMethod;
  __CFString *v14;
  DirectionsPlanTransitPreferences *transitPreferences;
  void *v16;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v17;
  void *v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  NSMutableArray *handlesForSharingETAs;
  NSData *companionRouteContextData;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t transitPrioritization;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOStorageRouteRequestStorage dictionaryRepresentation](routeRequestStorage, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("routeRequestStorage"));

  }
  originString = self->_originString;
  if (originString)
    objc_msgSend(v3, "setObject:forKey:", originString, CFSTR("originString"));
  destinationString = self->_destinationString;
  if (destinationString)
    objc_msgSend(v3, "setObject:forKey:", destinationString, CFSTR("destinationString"));
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_departureTime));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("departureTime"));

    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_10;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_arrivalTime));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("arrivalTime"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_11;
    goto LABEL_16;
  }
LABEL_15:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_currentRouteIndex));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("currentRouteIndex"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_17;
  }
LABEL_16:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_currentRouteStep));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("currentRouteStep"));

  if ((*(_DWORD *)&self->_has & 0x20) == 0)
    goto LABEL_21;
LABEL_17:
  displayMethod = self->_displayMethod;
  if (displayMethod >= 3)
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_displayMethod));
  else
    v14 = off_1011C0CA0[displayMethod];
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("displayMethod"));

LABEL_21:
  transitPreferences = self->_transitPreferences;
  if (transitPreferences)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlanTransitPreferences dictionaryRepresentation](transitPreferences, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("transitPreferences"));

  }
  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x200) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_routesPerInitialPage));
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("routesPerInitialPage"));

    v17 = self->_has;
    if ((*(_BYTE *)&v17 & 0x40) == 0)
    {
LABEL_25:
      if ((*(_BYTE *)&v17 & 0x80) == 0)
        goto LABEL_26;
      goto LABEL_52;
    }
  }
  else if ((*(_BYTE *)&v17 & 0x40) == 0)
  {
    goto LABEL_25;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_earlierPagesLoaded));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("earlierPagesLoaded"));

  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x80) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v17 & 0x100) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_laterPagesLoaded));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("laterPagesLoaded"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v17 & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_54;
  }
LABEL_53:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_routesPerEarlierPage));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("routesPerEarlierPage"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x400) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v17 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_55;
  }
LABEL_54:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_routesPerLaterPage));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("routesPerLaterPage"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x800) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v17 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_55:
  transitPrioritization = self->_transitPrioritization;
  if (transitPrioritization >= 4)
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transitPrioritization));
  else
    v35 = off_1011C0CB8[transitPrioritization];
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("transitPrioritization"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v17 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_transitSurchargeOption));
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("transitSurchargeOption"));

  v17 = self->_has;
  if ((*(_BYTE *)&v17 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v17 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_61;
  }
LABEL_60:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_expiryTime));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("expiryTime"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v17 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPlayingTrace));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("isPlayingTrace"));

  v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v17 & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_63;
  }
LABEL_62:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_shouldRestoreLowGuidance));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("shouldRestoreLowGuidance"));

  v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x4000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v17 & 0x2000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_63:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidTolls));
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("avoidTolls"));

  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_35:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_avoidHighways));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("avoidHighways"));

  }
LABEL_36:
  if (-[NSMutableArray count](self->_planningWaypoints, "count"))
  {
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_planningWaypoints, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v20 = self->_planningWaypoints;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("planningWaypoint"));
  }
  handlesForSharingETAs = self->_handlesForSharingETAs;
  if (handlesForSharingETAs)
    objc_msgSend(v3, "setObject:forKey:", handlesForSharingETAs, CFSTR("handlesForSharingETA"));
  companionRouteContextData = self->_companionRouteContextData;
  if (companionRouteContextData)
    objc_msgSend(v3, "setObject:forKey:", companionRouteContextData, CFSTR("companionRouteContextData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1006F1EF4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  NSString *originString;
  NSString *destinationString;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has;
  DirectionsPlanTransitPreferences *transitPreferences;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSData *companionRouteContextData;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v4 = a3;
  v5 = v4;
  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage)
    PBDataWriterWriteSubmessage(v4, routeRequestStorage, 1);
  originString = self->_originString;
  if (originString)
    PBDataWriterWriteStringField(v5, originString, 2);
  destinationString = self->_destinationString;
  if (destinationString)
    PBDataWriterWriteStringField(v5, destinationString, 3);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 4, self->_departureTime);
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_10;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField(v5, 5, self->_arrivalTime);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field(v5, self->_currentRouteIndex, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_49:
  PBDataWriterWriteUint64Field(v5, self->_currentRouteStep, 7);
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field(v5, self->_displayMethod, 8);
LABEL_13:
  transitPreferences = self->_transitPreferences;
  if (transitPreferences)
    PBDataWriterWriteSubmessage(v5, transitPreferences, 9);
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_routesPerInitialPage, 10);
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x40) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v11 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field(v5, self->_earlierPagesLoaded, 11);
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v11 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field(v5, self->_laterPagesLoaded, 12);
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v11 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field(v5, self->_routesPerEarlierPage, 13);
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v11 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field(v5, self->_routesPerLaterPage, 14);
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v11 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field(v5, self->_transitPrioritization, 15);
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v11 & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field(v5, self->_transitSurchargeOption, 16);
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v11 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField(v5, 17, self->_expiryTime);
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v11 & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField(v5, self->_shouldRestoreLowGuidance, 18);
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v11 & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_60:
  PBDataWriterWriteBOOLField(v5, self->_avoidTolls, 19);
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
LABEL_26:
    PBDataWriterWriteBOOLField(v5, self->_avoidHighways, 20);
LABEL_27:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_planningWaypoints;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v16), 21);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v14);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = self->_handlesForSharingETAs;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v21), 22);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

  companionRouteContextData = self->_companionRouteContextData;
  if (companionRouteContextData)
    PBDataWriterWriteDataField(v5, companionRouteContextData, 23);
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteBOOLField(v5, self->_isPlayingTrace, 404);

}

- (void)copyTo:(id)a3
{
  id v4;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (self->_routeRequestStorage)
  {
    objc_msgSend(v4, "setRouteRequestStorage:");
    v4 = v15;
  }
  if (self->_originString)
  {
    objc_msgSend(v15, "setOriginString:");
    v4 = v15;
  }
  if (self->_destinationString)
  {
    objc_msgSend(v15, "setDestinationString:");
    v4 = v15;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_departureTime;
    *((_DWORD *)v4 + 37) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_10;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_arrivalTime;
  *((_DWORD *)v4 + 37) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  *((_QWORD *)v4 + 2) = self->_currentRouteIndex;
  *((_DWORD *)v4 + 37) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_43:
  *((_QWORD *)v4 + 3) = self->_currentRouteStep;
  *((_DWORD *)v4 + 37) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 16) = self->_displayMethod;
    *((_DWORD *)v4 + 37) |= 0x20u;
  }
LABEL_13:
  if (self->_transitPreferences)
  {
    objc_msgSend(v15, "setTransitPreferences:");
    v4 = v15;
  }
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 29) = self->_routesPerInitialPage;
    *((_DWORD *)v4 + 37) |= 0x200u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 0x40) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v6 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_47;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 17) = self->_earlierPagesLoaded;
  *((_DWORD *)v4 + 37) |= 0x40u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 20) = self->_laterPagesLoaded;
  *((_DWORD *)v4 + 37) |= 0x80u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 28) = self->_routesPerEarlierPage;
  *((_DWORD *)v4 + 37) |= 0x100u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 30) = self->_routesPerLaterPage;
  *((_DWORD *)v4 + 37) |= 0x400u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 34) = self->_transitPrioritization;
  *((_DWORD *)v4 + 37) |= 0x800u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 35) = self->_transitSurchargeOption;
  *((_DWORD *)v4 + 37) |= 0x1000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_expiryTime;
  *((_DWORD *)v4 + 37) |= 0x10u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_25;
LABEL_54:
    *((_BYTE *)v4 + 145) = self->_avoidTolls;
    *((_DWORD *)v4 + 37) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_53:
  *((_BYTE *)v4 + 147) = self->_shouldRestoreLowGuidance;
  *((_DWORD *)v4 + 37) |= 0x10000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
    goto LABEL_54;
LABEL_25:
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
LABEL_26:
    *((_BYTE *)v4 + 144) = self->_avoidHighways;
    *((_DWORD *)v4 + 37) |= 0x2000u;
  }
LABEL_27:
  if (-[DirectionsPlan planningWaypointsCount](self, "planningWaypointsCount"))
  {
    objc_msgSend(v15, "clearPlanningWaypoints");
    v7 = -[DirectionsPlan planningWaypointsCount](self, "planningWaypointsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan planningWaypointAtIndex:](self, "planningWaypointAtIndex:", i));
        objc_msgSend(v15, "addPlanningWaypoint:", v10);

      }
    }
  }
  if (-[DirectionsPlan handlesForSharingETAsCount](self, "handlesForSharingETAsCount"))
  {
    objc_msgSend(v15, "clearHandlesForSharingETAs");
    v11 = -[DirectionsPlan handlesForSharingETAsCount](self, "handlesForSharingETAsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsPlan handlesForSharingETAAtIndex:](self, "handlesForSharingETAAtIndex:", j));
        objc_msgSend(v15, "addHandlesForSharingETA:", v14);

      }
    }
  }
  if (self->_companionRouteContextData)
    objc_msgSend(v15, "setCompanionRouteContextData:");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *((_BYTE *)v15 + 146) = self->_isPlayingTrace;
    *((_DWORD *)v15 + 37) |= 0x8000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has;
  id v13;
  void *v14;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  id v27;
  id v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[GEOStorageRouteRequestStorage copyWithZone:](self->_routeRequestStorage, "copyWithZone:", a3);
  v7 = (void *)v5[13];
  v5[13] = v6;

  v8 = -[NSString copyWithZone:](self->_originString, "copyWithZone:", a3);
  v9 = (void *)v5[11];
  v5[11] = v8;

  v10 = -[NSString copyWithZone:](self->_destinationString, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v5[4] = *(_QWORD *)&self->_departureTime;
    *((_DWORD *)v5 + 37) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 2) == 0)
        goto LABEL_4;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(_QWORD *)&self->_arrivalTime;
  *((_DWORD *)v5 + 37) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_5;
    goto LABEL_39;
  }
LABEL_38:
  v5[2] = self->_currentRouteIndex;
  *((_DWORD *)v5 + 37) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_39:
  v5[3] = self->_currentRouteStep;
  *((_DWORD *)v5 + 37) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 16) = self->_displayMethod;
    *((_DWORD *)v5 + 37) |= 0x20u;
  }
LABEL_7:
  v13 = -[DirectionsPlanTransitPreferences copyWithZone:](self->_transitPreferences, "copyWithZone:", a3);
  v14 = (void *)v5[16];
  v5[16] = v13;

  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) != 0)
  {
    *((_DWORD *)v5 + 29) = self->_routesPerInitialPage;
    *((_DWORD *)v5 + 37) |= 0x200u;
    v15 = self->_has;
    if ((*(_BYTE *)&v15 & 0x40) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&v15 & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_43;
    }
  }
  else if ((*(_BYTE *)&v15 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v5 + 17) = self->_earlierPagesLoaded;
  *((_DWORD *)v5 + 37) |= 0x40u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x80) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v15 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v5 + 20) = self->_laterPagesLoaded;
  *((_DWORD *)v5 + 37) |= 0x80u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v15 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v5 + 28) = self->_routesPerEarlierPage;
  *((_DWORD *)v5 + 37) |= 0x100u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v15 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v5 + 30) = self->_routesPerLaterPage;
  *((_DWORD *)v5 + 37) |= 0x400u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v15 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v5 + 34) = self->_transitPrioritization;
  *((_DWORD *)v5 + 37) |= 0x800u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v15 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v5 + 35) = self->_transitSurchargeOption;
  *((_DWORD *)v5 + 37) |= 0x1000u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v15 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_49;
  }
LABEL_48:
  v5[5] = *(_QWORD *)&self->_expiryTime;
  *((_DWORD *)v5 + 37) |= 0x10u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v15 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_50;
  }
LABEL_49:
  *((_BYTE *)v5 + 147) = self->_shouldRestoreLowGuidance;
  *((_DWORD *)v5 + 37) |= 0x10000u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v15 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_50:
  *((_BYTE *)v5 + 145) = self->_avoidTolls;
  *((_DWORD *)v5 + 37) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_18:
    *((_BYTE *)v5 + 144) = self->_avoidHighways;
    *((_DWORD *)v5 + 37) |= 0x2000u;
  }
LABEL_19:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = self->_planningWaypoints;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addPlanningWaypoint:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v18);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = self->_handlesForSharingETAs;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend(v5, "addHandlesForSharingETA:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

  v28 = -[NSData copyWithZone:](self->_companionRouteContextData, "copyWithZone:", a3);
  v29 = (void *)v5[6];
  v5[6] = v28;

  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *((_BYTE *)v5 + 146) = self->_isPlayingTrace;
    *((_DWORD *)v5 + 37) |= 0x8000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  NSString *originString;
  NSString *destinationString;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has;
  int v9;
  DirectionsPlanTransitPreferences *transitPreferences;
  NSMutableArray *planningWaypoints;
  NSMutableArray *handlesForSharingETAs;
  NSData *companionRouteContextData;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_109;
  routeRequestStorage = self->_routeRequestStorage;
  if ((unint64_t)routeRequestStorage | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOStorageRouteRequestStorage isEqual:](routeRequestStorage, "isEqual:"))
      goto LABEL_109;
  }
  originString = self->_originString;
  if ((unint64_t)originString | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](originString, "isEqual:"))
      goto LABEL_109;
  }
  destinationString = self->_destinationString;
  if ((unint64_t)destinationString | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](destinationString, "isEqual:"))
      goto LABEL_109;
  }
  has = self->_has;
  v9 = *((_DWORD *)v4 + 37);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_departureTime != *((double *)v4 + 4))
      goto LABEL_109;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_arrivalTime != *((double *)v4 + 1))
      goto LABEL_109;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_currentRouteIndex != *((_QWORD *)v4 + 2))
      goto LABEL_109;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_currentRouteStep != *((_QWORD *)v4 + 3))
      goto LABEL_109;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_displayMethod != *((_DWORD *)v4 + 16))
      goto LABEL_109;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_109;
  }
  transitPreferences = self->_transitPreferences;
  if ((unint64_t)transitPreferences | *((_QWORD *)v4 + 16))
  {
    if (!-[DirectionsPlanTransitPreferences isEqual:](transitPreferences, "isEqual:"))
      goto LABEL_109;
    has = self->_has;
    v9 = *((_DWORD *)v4 + 37);
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_routesPerInitialPage != *((_DWORD *)v4 + 29))
      goto LABEL_109;
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_earlierPagesLoaded != *((_DWORD *)v4 + 17))
      goto LABEL_109;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_laterPagesLoaded != *((_DWORD *)v4 + 20))
      goto LABEL_109;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_routesPerEarlierPage != *((_DWORD *)v4 + 28))
      goto LABEL_109;
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_routesPerLaterPage != *((_DWORD *)v4 + 30))
      goto LABEL_109;
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_transitPrioritization != *((_DWORD *)v4 + 34))
      goto LABEL_109;
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_transitSurchargeOption != *((_DWORD *)v4 + 35))
      goto LABEL_109;
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_expiryTime != *((double *)v4 + 5))
      goto LABEL_109;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0)
      goto LABEL_109;
    if (self->_shouldRestoreLowGuidance)
    {
      if (!*((_BYTE *)v4 + 147))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 147))
    {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0)
      goto LABEL_109;
    if (self->_avoidTolls)
    {
      if (!*((_BYTE *)v4 + 145))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 145))
    {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_109;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0)
      goto LABEL_109;
    if (self->_avoidHighways)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_109;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_109;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_109;
  }
  planningWaypoints = self->_planningWaypoints;
  if ((unint64_t)planningWaypoints | *((_QWORD *)v4 + 12)
    && !-[NSMutableArray isEqual:](planningWaypoints, "isEqual:"))
  {
    goto LABEL_109;
  }
  handlesForSharingETAs = self->_handlesForSharingETAs;
  if ((unint64_t)handlesForSharingETAs | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](handlesForSharingETAs, "isEqual:"))
      goto LABEL_109;
  }
  companionRouteContextData = self->_companionRouteContextData;
  if ((unint64_t)companionRouteContextData | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](companionRouteContextData, "isEqual:"))
      goto LABEL_109;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    if ((*((_DWORD *)v4 + 37) & 0x8000) != 0)
    {
      if (self->_isPlayingTrace)
      {
        if (!*((_BYTE *)v4 + 146))
          goto LABEL_109;
      }
      else if (*((_BYTE *)v4 + 146))
      {
        goto LABEL_109;
      }
      v14 = 1;
      goto LABEL_110;
    }
LABEL_109:
    v14 = 0;
    goto LABEL_110;
  }
  v14 = (*((_DWORD *)v4 + 37) & 0x8000) == 0;
LABEL_110:

  return v14;
}

- (unint64_t)hash
{
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 has;
  unint64_t v4;
  double departureTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double arrivalTime;
  double v11;
  long double v12;
  double v13;
  $C75E4E3A3DEB277DB9C7B3008F0DFC00 v14;
  double expiryTime;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  NSUInteger v41;
  NSUInteger v42;
  unint64_t v43;

  v43 = (unint64_t)-[GEOStorageRouteRequestStorage hash](self->_routeRequestStorage, "hash");
  v42 = -[NSString hash](self->_originString, "hash");
  v41 = -[NSString hash](self->_destinationString, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    departureTime = self->_departureTime;
    v6 = -departureTime;
    if (departureTime >= 0.0)
      v6 = self->_departureTime;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    arrivalTime = self->_arrivalTime;
    v11 = -arrivalTime;
    if (arrivalTime >= 0.0)
      v11 = self->_arrivalTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v39 = 2654435761u * self->_currentRouteIndex;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_19;
  }
  else
  {
    v39 = 0;
    if ((*(_BYTE *)&has & 4) != 0)
    {
LABEL_19:
      v38 = 2654435761u * self->_currentRouteStep;
      goto LABEL_22;
    }
  }
  v38 = 0;
LABEL_22:
  v40 = v9;
  if ((*(_BYTE *)&has & 0x20) != 0)
    v37 = 2654435761 * self->_displayMethod;
  else
    v37 = 0;
  v36 = -[DirectionsPlanTransitPreferences hash](self->_transitPreferences, "hash");
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    v35 = 2654435761 * self->_routesPerInitialPage;
    if ((*(_BYTE *)&v14 & 0x40) != 0)
    {
LABEL_27:
      v34 = 2654435761 * self->_earlierPagesLoaded;
      if ((*(_BYTE *)&v14 & 0x80) != 0)
        goto LABEL_28;
      goto LABEL_34;
    }
  }
  else
  {
    v35 = 0;
    if ((*(_BYTE *)&v14 & 0x40) != 0)
      goto LABEL_27;
  }
  v34 = 0;
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
LABEL_28:
    v33 = 2654435761 * self->_laterPagesLoaded;
    if ((*(_WORD *)&v14 & 0x100) != 0)
      goto LABEL_29;
    goto LABEL_35;
  }
LABEL_34:
  v33 = 0;
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
LABEL_29:
    v32 = 2654435761 * self->_routesPerEarlierPage;
    if ((*(_WORD *)&v14 & 0x400) != 0)
      goto LABEL_30;
LABEL_36:
    v31 = 0;
    if ((*(_WORD *)&v14 & 0x800) != 0)
      goto LABEL_31;
    goto LABEL_37;
  }
LABEL_35:
  v32 = 0;
  if ((*(_WORD *)&v14 & 0x400) == 0)
    goto LABEL_36;
LABEL_30:
  v31 = 2654435761 * self->_routesPerLaterPage;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_31:
    v30 = 2654435761 * self->_transitPrioritization;
    goto LABEL_38;
  }
LABEL_37:
  v30 = 0;
LABEL_38:
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    v28 = 2654435761 * self->_transitSurchargeOption;
    if ((*(_BYTE *)&v14 & 0x10) != 0)
      goto LABEL_40;
LABEL_45:
    v19 = 0;
    goto LABEL_48;
  }
  v28 = 0;
  if ((*(_BYTE *)&v14 & 0x10) == 0)
    goto LABEL_45;
LABEL_40:
  expiryTime = self->_expiryTime;
  v16 = -expiryTime;
  if (expiryTime >= 0.0)
    v16 = self->_expiryTime;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_48:
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
    v20 = 0;
    if ((*(_WORD *)&v14 & 0x4000) != 0)
      goto LABEL_50;
LABEL_53:
    v21 = 0;
    if ((*(_WORD *)&v14 & 0x2000) != 0)
      goto LABEL_51;
    goto LABEL_54;
  }
  v20 = 2654435761 * self->_shouldRestoreLowGuidance;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
    goto LABEL_53;
LABEL_50:
  v21 = 2654435761 * self->_avoidTolls;
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
LABEL_51:
    v22 = 2654435761 * self->_avoidHighways;
    goto LABEL_55;
  }
LABEL_54:
  v22 = 0;
LABEL_55:
  v23 = (unint64_t)-[NSMutableArray hash](self->_planningWaypoints, "hash", v28);
  v24 = (unint64_t)-[NSMutableArray hash](self->_handlesForSharingETAs, "hash");
  v25 = (unint64_t)-[NSData hash](self->_companionRouteContextData, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v26 = 2654435761 * self->_isPlayingTrace;
  else
    v26 = 0;
  return v42 ^ v43 ^ v41 ^ v4 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  uint64_t v6;
  int v7;
  DirectionsPlanTransitPreferences *transitPreferences;
  uint64_t v9;
  int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  routeRequestStorage = self->_routeRequestStorage;
  v6 = *((_QWORD *)v4 + 13);
  if (routeRequestStorage)
  {
    if (v6)
      -[GEOStorageRouteRequestStorage mergeFrom:](routeRequestStorage, "mergeFrom:");
  }
  else if (v6)
  {
    -[DirectionsPlan setRouteRequestStorage:](self, "setRouteRequestStorage:");
  }
  if (*((_QWORD *)v4 + 11))
    -[DirectionsPlan setOriginString:](self, "setOriginString:");
  if (*((_QWORD *)v4 + 7))
    -[DirectionsPlan setDestinationString:](self, "setDestinationString:");
  v7 = *((_DWORD *)v4 + 37);
  if ((v7 & 8) != 0)
  {
    self->_departureTime = *((double *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    v7 = *((_DWORD *)v4 + 37);
    if ((v7 & 1) == 0)
    {
LABEL_12:
      if ((v7 & 2) == 0)
        goto LABEL_13;
      goto LABEL_21;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_12;
  }
  self->_arrivalTime = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v7 = *((_DWORD *)v4 + 37);
  if ((v7 & 2) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  self->_currentRouteIndex = *((_QWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v7 = *((_DWORD *)v4 + 37);
  if ((v7 & 4) == 0)
  {
LABEL_14:
    if ((v7 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_22:
  self->_currentRouteStep = *((_QWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)v4 + 37) & 0x20) != 0)
  {
LABEL_15:
    self->_displayMethod = *((_DWORD *)v4 + 16);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_16:
  transitPreferences = self->_transitPreferences;
  v9 = *((_QWORD *)v4 + 16);
  if (transitPreferences)
  {
    if (v9)
      -[DirectionsPlanTransitPreferences mergeFrom:](transitPreferences, "mergeFrom:");
  }
  else if (v9)
  {
    -[DirectionsPlan setTransitPreferences:](self, "setTransitPreferences:");
  }
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x200) != 0)
  {
    self->_routesPerInitialPage = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_has |= 0x200u;
    v10 = *((_DWORD *)v4 + 37);
    if ((v10 & 0x40) == 0)
    {
LABEL_28:
      if ((v10 & 0x80) == 0)
        goto LABEL_29;
      goto LABEL_59;
    }
  }
  else if ((v10 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  self->_earlierPagesLoaded = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x80) == 0)
  {
LABEL_29:
    if ((v10 & 0x100) == 0)
      goto LABEL_30;
    goto LABEL_60;
  }
LABEL_59:
  self->_laterPagesLoaded = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x100) == 0)
  {
LABEL_30:
    if ((v10 & 0x400) == 0)
      goto LABEL_31;
    goto LABEL_61;
  }
LABEL_60:
  self->_routesPerEarlierPage = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x100u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x400) == 0)
  {
LABEL_31:
    if ((v10 & 0x800) == 0)
      goto LABEL_32;
    goto LABEL_62;
  }
LABEL_61:
  self->_routesPerLaterPage = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x400u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x800) == 0)
  {
LABEL_32:
    if ((v10 & 0x1000) == 0)
      goto LABEL_33;
    goto LABEL_63;
  }
LABEL_62:
  self->_transitPrioritization = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x800u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x1000) == 0)
  {
LABEL_33:
    if ((v10 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_64;
  }
LABEL_63:
  self->_transitSurchargeOption = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x1000u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x10) == 0)
  {
LABEL_34:
    if ((v10 & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_65;
  }
LABEL_64:
  self->_expiryTime = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x10000) == 0)
  {
LABEL_35:
    if ((v10 & 0x4000) == 0)
      goto LABEL_36;
    goto LABEL_66;
  }
LABEL_65:
  self->_shouldRestoreLowGuidance = *((_BYTE *)v4 + 147);
  *(_DWORD *)&self->_has |= 0x10000u;
  v10 = *((_DWORD *)v4 + 37);
  if ((v10 & 0x4000) == 0)
  {
LABEL_36:
    if ((v10 & 0x2000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_66:
  self->_avoidTolls = *((_BYTE *)v4 + 145);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 37) & 0x2000) != 0)
  {
LABEL_37:
    self->_avoidHighways = *((_BYTE *)v4 + 144);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_38:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v4 + 12);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[DirectionsPlan addPlanningWaypoint:](self, "addPlanningWaypoint:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 9);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[DirectionsPlan addHandlesForSharingETA:](self, "addHandlesForSharingETA:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

  if (*((_QWORD *)v4 + 6))
    -[DirectionsPlan setCompanionRouteContextData:](self, "setCompanionRouteContextData:");
  if ((*((_BYTE *)v4 + 149) & 0x80) != 0)
  {
    self->_isPlayingTrace = *((_BYTE *)v4 + 146);
    *(_DWORD *)&self->_has |= 0x8000u;
  }

}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  return self->_routeRequestStorage;
}

- (void)setRouteRequestStorage:(id)a3
{
  objc_storeStrong((id *)&self->_routeRequestStorage, a3);
}

- (NSString)originString
{
  return self->_originString;
}

- (void)setOriginString:(id)a3
{
  objc_storeStrong((id *)&self->_originString, a3);
}

- (NSString)destinationString
{
  return self->_destinationString;
}

- (void)setDestinationString:(id)a3
{
  objc_storeStrong((id *)&self->_destinationString, a3);
}

- (double)departureTime
{
  return self->_departureTime;
}

- (double)arrivalTime
{
  return self->_arrivalTime;
}

- (unint64_t)currentRouteIndex
{
  return self->_currentRouteIndex;
}

- (unint64_t)currentRouteStep
{
  return self->_currentRouteStep;
}

- (DirectionsPlanTransitPreferences)transitPreferences
{
  return self->_transitPreferences;
}

- (void)setTransitPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_transitPreferences, a3);
}

- (unsigned)routesPerInitialPage
{
  return self->_routesPerInitialPage;
}

- (unsigned)earlierPagesLoaded
{
  return self->_earlierPagesLoaded;
}

- (unsigned)laterPagesLoaded
{
  return self->_laterPagesLoaded;
}

- (unsigned)routesPerEarlierPage
{
  return self->_routesPerEarlierPage;
}

- (unsigned)routesPerLaterPage
{
  return self->_routesPerLaterPage;
}

- (int)transitSurchargeOption
{
  return self->_transitSurchargeOption;
}

- (double)expiryTime
{
  return self->_expiryTime;
}

- (BOOL)isPlayingTrace
{
  return self->_isPlayingTrace;
}

- (BOOL)shouldRestoreLowGuidance
{
  return self->_shouldRestoreLowGuidance;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (NSMutableArray)planningWaypoints
{
  return self->_planningWaypoints;
}

- (void)setPlanningWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_planningWaypoints, a3);
}

- (NSMutableArray)handlesForSharingETAs
{
  return self->_handlesForSharingETAs;
}

- (void)setHandlesForSharingETAs:(id)a3
{
  objc_storeStrong((id *)&self->_handlesForSharingETAs, a3);
}

- (NSData)companionRouteContextData
{
  return self->_companionRouteContextData;
}

- (void)setCompanionRouteContextData:(id)a3
{
  objc_storeStrong((id *)&self->_companionRouteContextData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitPreferences, 0);
  objc_storeStrong((id *)&self->_routeRequestStorage, 0);
  objc_storeStrong((id *)&self->_planningWaypoints, 0);
  objc_storeStrong((id *)&self->_originString, 0);
  objc_storeStrong((id *)&self->_handlesForSharingETAs, 0);
  objc_storeStrong((id *)&self->_destinationString, 0);
  objc_storeStrong((id *)&self->_companionRouteContextData, 0);
}

@end
