@implementation RAPMapState

- (RAPMapState)initWithTraits:(id)a3
{
  id v5;
  RAPMapState *v6;
  RAPMapState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPMapState;
  v6 = -[RAPMapState init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_traits, a3);

  return v7;
}

- (RAPMapState)initWithMapView:(id)a3 traits:(id)a4 place:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPMapState *v11;
  double v12;
  uint64_t v13;
  GEOMapRegion *mapRegion;
  uint64_t v15;
  NSArray *mapVisibleTileSets;
  uint64_t v17;
  MKMapCamera *mapCamera;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RAPMapState;
  v11 = -[RAPMapState init](&v20, "init");
  if (v11)
  {
    v11->_isShowingImagery = objc_msgSend(v8, "isShowingImagery");
    v11->_isShowingLabels = ((unint64_t)objc_msgSend(v8, "mapType") & 0xFFFFFFFFFFFFFFFDLL) != 1;
    objc_msgSend(v8, "_zoomLevel");
    v11->_mapZoomLevel = v12;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapRegion"));
    mapRegion = v11->_mapRegion;
    v11->_mapRegion = (GEOMapRegion *)v13;

    v11->_mapType = (unint64_t)objc_msgSend(v8, "mapType");
    v11->_isShowingTraffic = objc_msgSend(v8, "showsTraffic");
    v11->_isSprMap = objc_msgSend(v8, "_isShowingCuratedElevatedGround");
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_visibleTileSets"));
    mapVisibleTileSets = v11->_mapVisibleTileSets;
    v11->_mapVisibleTileSets = (NSArray *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "camera"));
    mapCamera = v11->_mapCamera;
    v11->_mapCamera = (MKMapCamera *)v17;

    objc_storeStrong((id *)&v11->_traits, a4);
    objc_storeStrong((id *)&v11->_reportedPlace, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_mapSnapshotImageData, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v6;

  *((_BYTE *)v5 + 9) = self->_isShowingImagery;
  *((_BYTE *)v5 + 8) = self->_isShowingLabels;
  *((_QWORD *)v5 + 6) = *(_QWORD *)&self->_mapZoomLevel;
  v8 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v8;

  *((_QWORD *)v5 + 7) = self->_mapType;
  v10 = -[NSArray copyWithZone:](self->_mapVisibleTileSets, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v10;

  v12 = -[MKMapCamera copyWithZone:](self->_mapCamera, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 10);
  *((_QWORD *)v5 + 10) = v12;

  v14 = -[GEOMapServiceTraits copyWithZone:](self->_traits, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v14;

  objc_storeStrong((id *)v5 + 2, self->_reportedPlace);
  v16 = -[RAPTransitLine copyWithZone:](self->_reportedLine, "copyWithZone:", a3);
  v17 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v16;

  objc_storeStrong((id *)v5 + 11, self->_reportedLookAroundContext);
  *((_BYTE *)v5 + 10) = self->_isShowingTraffic;
  *((_BYTE *)v5 + 11) = self->_isSprMap;
  return v5;
}

- (id)copyWithReportedPlace:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = -[RAPMapState copyWithZone:](self, "copyWithZone:", 0);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RAPMapState *v4;
  uint64_t v5;
  RAPMapState *v6;
  _BOOL4 isShowingLabels;
  _BOOL4 isShowingImagery;
  double mapZoomLevel;
  double v10;
  id mapType;
  GEOMapRegion *mapRegion;
  void *v13;
  NSArray *mapVisibleTileSets;
  void *v15;
  MKMapCamera *mapCamera;
  void *v17;
  GEOMapServiceTraits *traits;
  void *v19;
  RAPPlace *reportedPlace;
  RAPPlace *v21;
  uint64_t v22;
  void *v23;
  int v24;
  BOOL v25;
  RAPTransitLine *reportedLine;
  uint64_t v28;
  RAPLookAroundContext *reportedLookAroundContext;
  RAPLookAroundContext *v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 isSprMap;
  uint64_t v34;
  void *v35;
  int v36;
  _BOOL4 isShowingTraffic;
  void *v38;
  int v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  RAPTransitLine *v44;

  v4 = (RAPMapState *)a3;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    v5 = objc_opt_class(RAPMapState);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      isShowingLabels = self->_isShowingLabels;
      if (isShowingLabels != -[RAPMapState isShowingLabels](v6, "isShowingLabels")
        || (isShowingImagery = self->_isShowingImagery,
            isShowingImagery != -[RAPMapState isShowingImagery](v6, "isShowingImagery"))
        || (mapZoomLevel = self->_mapZoomLevel, -[RAPMapState mapZoomLevel](v6, "mapZoomLevel"), mapZoomLevel != v10)
        || (mapType = (id)self->_mapType, mapType != (id)-[RAPMapState mapType](v6, "mapType")))
      {
        v25 = 0;
LABEL_19:

        goto LABEL_20;
      }
      mapRegion = self->_mapRegion;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapState mapRegion](v6, "mapRegion"));
      if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:", v13))
      {
        v25 = 0;
LABEL_54:

        goto LABEL_19;
      }
      mapVisibleTileSets = self->_mapVisibleTileSets;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapState mapVisibleTileSets](v6, "mapVisibleTileSets"));
      if (!-[NSArray isEqual:](mapVisibleTileSets, "isEqual:", v15))
      {
        v25 = 0;
LABEL_53:

        goto LABEL_54;
      }
      mapCamera = self->_mapCamera;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapState mapCamera](v6, "mapCamera"));
      if (!-[MKMapCamera isEqual:](mapCamera, "isEqual:", v17))
      {
        v25 = 0;
LABEL_52:

        goto LABEL_53;
      }
      traits = self->_traits;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapState traits](v6, "traits"));
      if (!-[GEOMapServiceTraits isEqual:](traits, "isEqual:", v19))
      {
        v25 = 0;
LABEL_51:

        goto LABEL_52;
      }
      reportedPlace = self->_reportedPlace;
      v21 = reportedPlace;
      if (!reportedPlace)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[RAPMapState reportedPlace](v6, "reportedPlace"));
        if (!v22)
        {
          v41 = 0;
          v24 = 0;
          goto LABEL_27;
        }
        v41 = (void *)v22;
        v21 = self->_reportedPlace;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapState reportedPlace](v6, "reportedPlace"));
      if (!-[RAPPlace isEqual:](v21, "isEqual:", v23))
      {
        v25 = 0;
        goto LABEL_48;
      }
      v43 = v23;
      v24 = 1;
LABEL_27:
      reportedLine = self->_reportedLine;
      v44 = reportedLine;
      if (!reportedLine)
      {
        v28 = objc_claimAutoreleasedReturnValue(-[RAPMapState reportedLine](v6, "reportedLine"));
        if (!v28)
        {
          v39 = v24;
          v40 = 0;
          v38 = 0;
          goto LABEL_34;
        }
        v38 = (void *)v28;
        reportedLine = self->_reportedLine;
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapState reportedLine](v6, "reportedLine"));
      if (!-[RAPTransitLine isEqual:](reportedLine, "isEqual:"))
      {
        v25 = 0;
        v23 = v43;
LABEL_43:

        goto LABEL_46;
      }
      v39 = v24;
      v40 = 1;
LABEL_34:
      reportedLookAroundContext = self->_reportedLookAroundContext;
      v30 = reportedLookAroundContext;
      if (!reportedLookAroundContext)
      {
        v31 = objc_claimAutoreleasedReturnValue(-[RAPMapState reportedLookAroundContext](v6, "reportedLookAroundContext"));
        if (!v31)
        {
          v35 = 0;
          v36 = 0;
          goto LABEL_59;
        }
        v34 = v31;
        v30 = self->_reportedLookAroundContext;
      }
      v32 = objc_claimAutoreleasedReturnValue(-[RAPMapState reportedLookAroundContext](v6, "reportedLookAroundContext", v34));
      if (v30 != (RAPLookAroundContext *)v32)
      {
        v25 = 0;
        v30 = (RAPLookAroundContext *)v32;
LABEL_39:

        goto LABEL_40;
      }
      v36 = 1;
LABEL_59:
      isShowingTraffic = self->_isShowingTraffic;
      if (isShowingTraffic == -[RAPMapState isShowingTraffic](v6, "isShowingTraffic", v35))
      {
        isSprMap = self->_isSprMap;
        v25 = isSprMap == -[RAPMapState isSprMap](v6, "isSprMap");
        if ((v36 & 1) != 0)
          goto LABEL_39;
      }
      else
      {
        v25 = 0;
        if (v36)
          goto LABEL_39;
      }
LABEL_40:
      if (reportedLookAroundContext)
      {
        v23 = v43;
        if (v40)
        {
LABEL_42:
          v24 = v39;
          goto LABEL_43;
        }
      }
      else
      {

        v23 = v43;
        if ((v40 & 1) != 0)
          goto LABEL_42;
      }
      v24 = v39;
LABEL_46:
      if (v44)
      {
        if (!v24)
          goto LABEL_49;
      }
      else
      {

        if ((v24 & 1) == 0)
        {
LABEL_49:
          if (!reportedPlace)

          goto LABEL_51;
        }
      }
LABEL_48:

      goto LABEL_49;
    }
    v25 = 0;
  }
LABEL_20:

  return v25;
}

- (unint64_t)hash
{
  unint64_t mapZoomLevel;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  mapZoomLevel = (unint64_t)self->_mapZoomLevel;
  v4 = self->_isShowingImagery ^ self->_isShowingLabels ^ self->_mapType;
  v5 = v4 ^ (unint64_t)-[GEOMapRegion hash](self->_mapRegion, "hash");
  v6 = v5 ^ (unint64_t)-[NSArray hash](self->_mapVisibleTileSets, "hash");
  v7 = v6 ^ (unint64_t)-[MKMapCamera hash](self->_mapCamera, "hash");
  v8 = v7 ^ (unint64_t)-[GEOMapServiceTraits hash](self->_traits, "hash") ^ mapZoomLevel;
  v9 = (unint64_t)-[RAPPlace hash](self->_reportedPlace, "hash");
  v10 = v9 ^ -[RAPTransitLine hash](self->_reportedLine, "hash");
  return v8 ^ v10 ^ (unint64_t)-[RAPLookAroundContext hash](self->_reportedLookAroundContext, "hash") ^ self->_isShowingTraffic ^ self->_isSprMap;
}

- (NSString)debugDescription
{
  id v3;
  id v4;
  void *v5;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  id v11;
  objc_super v13;

  v3 = objc_alloc((Class)NSMutableString);
  v13.receiver = self;
  v13.super_class = (Class)RAPMapState;
  v4 = -[RAPMapState description](&v13, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithString:", v5);

  if (self->_isShowingImagery)
    v7 = CFSTR("\nis showing imagery");
  else
    v7 = CFSTR("\nis not showing imagery");
  objc_msgSend(v6, "appendString:", v7);
  if (self->_isShowingLabels)
    v8 = CFSTR("\nis showing labels");
  else
    v8 = CFSTR("\nis not showing labels");
  objc_msgSend(v6, "appendString:", v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("\nzoom level: %f"), *(_QWORD *)&self->_mapZoomLevel);
  objc_msgSend(v6, "appendFormat:", CFSTR("\nmap type: %lu"), self->_mapType);
  objc_msgSend(v6, "appendFormat:", CFSTR("\ncamera: %@"), self->_mapCamera);
  objc_msgSend(v6, "appendFormat:", CFSTR("\nregion: %@"), self->_mapRegion);
  objc_msgSend(v6, "appendFormat:", CFSTR("\ntraits: %@"), self->_traits);
  if (self->_reportedLine)
    objc_msgSend(v6, "appendFormat:", CFSTR("\nreported line: %@"), self->_reportedLine);
  if (self->_reportedPlace)
    objc_msgSend(v6, "appendFormat:", CFSTR("\nreported place: %@"), self->_reportedPlace);
  if (self->_isShowingTraffic)
    v9 = CFSTR("\nis showing traffic");
  else
    v9 = CFSTR("\nis not showing traffic");
  objc_msgSend(v6, "appendString:", v9);
  if (self->_isSprMap)
    v10 = CFSTR("\nis showing spr");
  else
    v10 = CFSTR("\nis not showing spr");
  objc_msgSend(v6, "appendString:", v10);
  v11 = objc_msgSend(v6, "copy");

  return (NSString *)v11;
}

- (BOOL)isShowingLabels
{
  return self->_isShowingLabels;
}

- (BOOL)isShowingImagery
{
  return self->_isShowingImagery;
}

- (RAPPlace)reportedPlace
{
  return self->_reportedPlace;
}

- (void)setReportedPlace:(id)a3
{
  objc_storeStrong((id *)&self->_reportedPlace, a3);
}

- (RAPTransitLine)reportedLine
{
  return self->_reportedLine;
}

- (void)setReportedLine:(id)a3
{
  objc_storeStrong((id *)&self->_reportedLine, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (double)mapZoomLevel
{
  return self->_mapZoomLevel;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (NSData)mapSnapshotImageData
{
  return self->_mapSnapshotImageData;
}

- (void)setMapSnapshotImageData:(id)a3
{
  objc_storeStrong((id *)&self->_mapSnapshotImageData, a3);
}

- (NSArray)mapVisibleTileSets
{
  return self->_mapVisibleTileSets;
}

- (MKMapCamera)mapCamera
{
  return self->_mapCamera;
}

- (RAPLookAroundContext)reportedLookAroundContext
{
  return self->_reportedLookAroundContext;
}

- (RAPPlacecardImageryContext)placecardImageryContext
{
  return self->_placecardImageryContext;
}

- (BOOL)isShowingTraffic
{
  return self->_isShowingTraffic;
}

- (BOOL)isSprMap
{
  return self->_isSprMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placecardImageryContext, 0);
  objc_storeStrong((id *)&self->_reportedLookAroundContext, 0);
  objc_storeStrong((id *)&self->_mapCamera, 0);
  objc_storeStrong((id *)&self->_mapVisibleTileSets, 0);
  objc_storeStrong((id *)&self->_mapSnapshotImageData, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_reportedLine, 0);
  objc_storeStrong((id *)&self->_reportedPlace, 0);
}

@end
