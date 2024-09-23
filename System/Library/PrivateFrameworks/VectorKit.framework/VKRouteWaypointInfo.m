@implementation VKRouteWaypointInfo

- (VKRouteWaypointInfo)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8 waypointType:(unsigned __int8)a9
{
  double var2;
  double var1;
  double var0;
  double v14;
  double v15;
  double v16;
  id v21;
  id v22;
  VKRouteWaypointInfo *v23;
  VKRouteWaypointInfo *v24;
  GEOComposedWaypointDisplayInfo *displayInfo;
  void *v26;
  uint64_t v27;
  NSString *annotationText;
  VKRouteWaypointInfo *v29;
  objc_super v31;

  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  v14 = a6.var2;
  v15 = a6.var1;
  v16 = a6.var0;
  v21 = a3;
  v22 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VKRouteWaypointInfo;
  v23 = -[VKRouteWaypointInfo init](&v31, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_waypoint, a3);
    objc_storeStrong((id *)&v24->_displayInfo, a4);
    v24->_type = a9;
    v24->_legIndex = a5;
    v24->_needsTextUpdate = 0;
    v24->_routeCoordinate.latitude = v16;
    v24->_routeCoordinate.longitude = v15;
    v24->_routeCoordinate.altitude = v14;
    v24->_adjacentRouteCoordinate.latitude = var0;
    v24->_adjacentRouteCoordinate.longitude = var1;
    v24->_adjacentRouteCoordinate.altitude = var2;
    v24->_polylineCoordinate = a8;
    v24->_when = 1;
    displayInfo = v24->_displayInfo;
    if (displayInfo)
    {
      -[GEOComposedWaypointDisplayInfo waypointCaption](displayInfo, "waypointCaption");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithDefaultOptions");
      v27 = objc_claimAutoreleasedReturnValue();
      annotationText = v24->_annotationText;
      v24->_annotationText = (NSString *)v27;

    }
    else
    {
      v26 = v24->_annotationText;
      v24->_annotationText = 0;
    }

    v29 = v24;
  }

  return v24;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  -[GEOComposedWaypointDisplayInfo artwork](self->_displayInfo, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D270A8]);
    -[GEOComposedWaypointDisplayInfo artwork](self->_displayInfo, "artwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "initWithGEOStyleAttributes:", v7);
LABEL_5:
    v11 = (void *)v8;

LABEL_6:
    return (GEOFeatureStyleAttributes *)v11;
  }
  -[GEOComposedWaypoint artwork](self->_waypoint, "artwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D270A8]);
    -[GEOComposedWaypoint artwork](self->_waypoint, "artwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "initWithGEOStyleAttributes:", v7);
    goto LABEL_5;
  }
  -[VKRouteWaypointInfo _anchorpoint](self, "_anchorpoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "styleAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[VKRouteWaypointInfo _anchorpoint](self, "_anchorpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleAttributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[GEOComposedWaypoint styleAttributes](self->_waypoint, "styleAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[GEOComposedWaypoint styleAttributes](self->_waypoint, "styleAttributes");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 5, 3, 6, 348, 0);
  }
  v11 = (void *)v16;
  return (GEOFeatureStyleAttributes *)v11;
}

- (BOOL)_isAnchorpoint
{
  return self->_type == 4;
}

- (id)_anchorpoint
{
  GEOComposedWaypoint *waypoint;

  if (-[VKRouteWaypointInfo _isAnchorpoint](self, "_isAnchorpoint"))
    waypoint = self->_waypoint;
  else
    waypoint = 0;
  return waypoint;
}

- (NSString)name
{
  void *v3;
  void *v4;

  if (-[VKRouteWaypointInfo _isAnchorpoint](self, "_isAnchorpoint"))
  {
    -[VKRouteWaypointInfo _anchorpoint](self, "_anchorpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[GEOComposedWaypoint name](self->_waypoint, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (unint64_t)muid
{
  void *v3;
  unint64_t v4;

  if (!-[VKRouteWaypointInfo _isAnchorpoint](self, "_isAnchorpoint"))
    return -[GEOComposedWaypoint muid](self->_waypoint, "muid");
  -[VKRouteWaypointInfo _anchorpoint](self, "_anchorpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "muid");

  return v4;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $1AB5FA073B851C12C2339EC22442E995 result;

  if (-[VKRouteWaypointInfo _isAnchorpoint](self, "_isAnchorpoint"))
  {
    -[VKRouteWaypointInfo _anchorpoint](self, "_anchorpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationCoordinate");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    v10 = v5;
    v11 = v7;
    v12 = v9;
  }
  else
  {
    -[GEOComposedWaypoint coordinate](self->_waypoint, "coordinate");
  }
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (GEOComposedWaypoint)waypoint
{
  return self->_waypoint;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)when
{
  return self->_when;
}

- (void)setWhen:(unsigned __int8)a3
{
  self->_when = a3;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (BOOL)needsTextUpdate
{
  return self->_needsTextUpdate;
}

- (void)setNeedsTextUpdate:(BOOL)a3
{
  self->_needsTextUpdate = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)routeCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_routeCoordinate.latitude;
  longitude = self->_routeCoordinate.longitude;
  altitude = self->_routeCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)adjacentRouteCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_adjacentRouteCoordinate.latitude;
  longitude = self->_adjacentRouteCoordinate.longitude;
  altitude = self->_adjacentRouteCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (PolylineCoordinate)polylineCoordinate
{
  return self->_polylineCoordinate;
}

- (BOOL)isAtStart
{
  return self->_isAtStart;
}

- (void)setIsAtStart:(BOOL)a3
{
  self->_isAtStart = a3;
}

- (BOOL)isAtEnd
{
  return self->_isAtEnd;
}

- (void)setIsAtEnd:(BOOL)a3
{
  self->_isAtEnd = a3;
}

- (BOOL)isOnSelectedRoute
{
  return self->_isOnSelectedRoute;
}

- (void)setIsOnSelectedRoute:(BOOL)a3
{
  self->_isOnSelectedRoute = a3;
}

- (NSString)annotationText
{
  return self->_annotationText;
}

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
}

- (void)setWaypointIndex:(unint64_t)a3
{
  self->_waypointIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationText, 0);
  objc_storeStrong((id *)&self->_displayInfo, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0xBF80000000000000;
  return self;
}

+ (id)newRouteWaypointForWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8
{
  double var2;
  double var1;
  double var0;
  double v12;
  double v13;
  double v14;
  id v17;
  id v18;
  void *v19;
  __objc2_class **v20;
  VKRouteWaypointInfo *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  int v28;
  VKRouteWaypointInfo *v29;
  int v31;

  var2 = a7.var2;
  var1 = a7.var1;
  var0 = a7.var0;
  v12 = a6.var2;
  v13 = a6.var1;
  v14 = a6.var0;
  v17 = a3;
  v18 = a4;
  objc_msgSend(v17, "chargingInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v22 = v17;
    objc_msgSend(v22, "styleAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v22, "styleAttributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "featureStyleAttributes");
      if (*(_BYTE *)(v25 + 33))
      {
        v26 = 0;
        v27 = *(int **)v25;
        while (1)
        {
          v28 = *v27;
          v27 += 2;
          if (v28 == 6)
            break;
          if (*(unsigned __int8 *)(v25 + 33) == ++v26)
            goto LABEL_9;
        }
        v31 = *(_DWORD *)(*(_QWORD *)v25 + 8 * v26 + 4);

        if (v31 == 456)
        {
          v20 = off_1E426D560;
          goto LABEL_3;
        }
LABEL_11:
        v21 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:]([VKRouteWaypointInfo alloc], "initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:", v22, v18, a5, a8, 1, v14, v13, v12, var0, var1, var2);
        goto LABEL_12;
      }
LABEL_9:

    }
    goto LABEL_11;
  }
  v20 = off_1E426D448;
LABEL_3:
  v21 = (VKRouteWaypointInfo *)objc_msgSend(objc_alloc(*v20), "initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:", v17, v18, a5, a8, v14, v13, v12, var0, var1, var2);
LABEL_12:
  v29 = v21;

  return v29;
}

+ (id)newRouteWaypointForAnchorpoint:(id)a3 legIndex:(unint64_t)a4 routeCoordinate:(id)a5 adjacentRouteCoordinate:(id)a6 polylineCoordinate:(PolylineCoordinate)a7
{
  double var2;
  double var1;
  double var0;
  double v11;
  double v12;
  double v13;
  id v15;
  VKRouteWaypointInfo *v16;
  void *v17;
  VKRouteWaypointInfo *v18;

  var2 = a6.var2;
  var1 = a6.var1;
  var0 = a6.var0;
  v11 = a5.var2;
  v12 = a5.var1;
  v13 = a5.var0;
  v15 = a3;
  v16 = [VKRouteWaypointInfo alloc];
  objc_msgSend(v15, "displayInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:](v16, "initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:", v15, v17, a4, a7, 4, v13, v12, v11, var0, var1, var2);

  return v18;
}

@end
