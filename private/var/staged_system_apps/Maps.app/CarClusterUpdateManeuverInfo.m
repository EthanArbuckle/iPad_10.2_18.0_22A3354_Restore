@implementation CarClusterUpdateManeuverInfo

+ (id)maneuverUpdateWithGuidanceEvent:(id)a3 routeStep:(id)a4 component:(id)a5
{
  id v7;
  id v8;
  id v9;
  CarClusterUpdateManeuverInfo *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v31;
  id v32;
  id v33;
  unsigned __int16 v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "hasSignGuidance"))
  {
    v10 = objc_opt_new(CarClusterUpdateManeuverInfo);
    -[CarClusterUpdateManeuverInfo setGuidanceEvent:](v10, "setGuidanceEvent:", v7);
    v32 = v9;
    -[CarClusterUpdate setComponent:](v10, "setComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarClusterUpdateManeuverInfo _maneuverDescriptionForGuidanceEvent:routeStep:](CarClusterUpdateManeuverInfo, "_maneuverDescriptionForGuidanceEvent:routeStep:", v7, v8));
    -[CarClusterUpdateManeuverInfo setManeuverDescription:](v10, "setManeuverDescription:", v11);

    -[CarClusterUpdateManeuverInfo setManeuverType:](v10, "setManeuverType:", +[CarClusterUpdate _accNavManeuverTypeForGEOManeuverType:](CarClusterUpdate, "_accNavManeuverTypeForGEOManeuverType:", objc_msgSend(v7, "maneuverType")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "roadName"));
    -[CarClusterUpdateManeuverInfo setAfterManeuverRoadName:](v10, "setAfterManeuverRoadName:", v12);

    objc_msgSend(v7, "distance");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13));
    -[CarClusterUpdateManeuverInfo setDistanceBetweenManeuver:](v10, "setDistanceBetweenManeuver:", v14);

    v34 = 0;
    v33 = 0;
    objc_msgSend(v7, "distance");
    +[CarClusterUpdate getStringValue:displayUnits:forRemainingDistance:](CarClusterUpdate, "getStringValue:displayUnits:forRemainingDistance:", &v33, &v34);
    v31 = v33;
    -[CarClusterUpdateManeuverInfo setDistanceBetweenManeuverDisplayString:](v10, "setDistanceBetweenManeuverDisplayString:");
    -[CarClusterUpdateManeuverInfo setDistanceBetweenManeuverDisplayUnits:](v10, "setDistanceBetweenManeuverDisplayUnits:", v34);
    -[CarClusterUpdateManeuverInfo setDrivingSide:](v10, "setDrivingSide:", (unsigned __int16)objc_msgSend(v7, "drivingSide"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "maneuverJunction"));
    -[CarClusterUpdateManeuverInfo setJunctionType:](v10, "setJunctionType:", (unsigned __int16)objc_msgSend(v15, "junctionType"));
    v16 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v15, "numElements"))
    {
      v17 = 0;
      v18 = 0;
      do
      {
        v19 = (char *)objc_msgSend(v15, "elements");
        v20 = *(_DWORD *)&v19[v17 + 8];
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)&v19[v17]));
        if (v20 != 1)
        {
          if (v20 == 2)
          {
            if (objc_msgSend(v15, "maneuverType") == 4)
            {
              if (!-[CarClusterUpdateManeuverInfo drivingSide](v10, "drivingSide")
                && (objc_msgSend(v21, "doubleValue"), v22 > 0.0)
                || -[CarClusterUpdateManeuverInfo drivingSide](v10, "drivingSide") == 1
                && (objc_msgSend(v21, "doubleValue"), v23 < 0.0))
              {
                objc_msgSend(v21, "doubleValue");
                v25 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", -v24));

                v21 = (void *)v25;
              }
            }
            -[CarClusterUpdateManeuverInfo setJunctionElementExitAngle:](v10, "setJunctionElementExitAngle:", v21);
          }
          else
          {
            -[NSMutableArray addObject:](v16, "addObject:", v21);
          }
        }

        ++v18;
        v17 += 16;
      }
      while (v18 < (unint64_t)objc_msgSend(v15, "numElements"));
    }
    -[CarClusterUpdateManeuverInfo setJunctionElementAngle:](v10, "setJunctionElementAngle:", v16);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoStep"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "exitNumber"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
    v29 = objc_msgSend(v28, "copy");
    -[CarClusterUpdateManeuverInfo setExitInfo:](v10, "setExitInfo:", v29);

    v9 = v32;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)maneuverUpdateWithStep:(id)a3 component:(id)a4
{
  id v5;
  id v6;
  CarClusterUpdateManeuverInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  _UNKNOWN **v23;
  void *v24;
  NSMutableArray *v25;
  void *v26;
  id v27;
  unint64_t v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v49;
  __CFString *v50;
  void *v51;
  id v52;
  unsigned __int16 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(CarClusterUpdateManeuverInfo);
  -[CarClusterUpdate setComponent:](v7, "setComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "stepIndex")));
  -[CarClusterUpdateManeuverInfo setIndex:](v7, "setIndex:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsForContext:", 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instructionWithShorterAlternatives"));

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v17 = objc_msgSend(v16, "length");
        if (v17 <= objc_msgSend(v6, "maxLength_ManeuverDescription"))
        {
          v18 = v16;
          goto LABEL_12;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v13)
        continue;
      break;
    }
    v18 = &stru_1011EB268;
  }
  else
  {
    v18 = &stru_1011EB268;
  }
LABEL_12:
  v51 = v11;

  v50 = (__CFString *)v18;
  -[CarClusterUpdateManeuverInfo setManeuverDescription:](v7, "setManeuverDescription:", v18);
  -[CarClusterUpdateManeuverInfo setManeuverType:](v7, "setManeuverType:", +[CarClusterUpdate _accNavManeuverTypeForGEOManeuverType:](CarClusterUpdate, "_accNavManeuverTypeForGEOManeuverType:", objc_msgSend(v5, "maneuverType")));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maneuverRoadName"));
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_1011EB268;
  -[CarClusterUpdateManeuverInfo setAfterManeuverRoadName:](v7, "setAfterManeuverRoadName:", v21);

  objc_msgSend(v5, "distance");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[CarClusterUpdateManeuverInfo setDistanceBetweenManeuver:](v7, "setDistanceBetweenManeuver:", v22);

  v53 = 0;
  v52 = 0;
  objc_msgSend(v5, "distance");
  v23 = MKPlaceCollectionsLogicController_ptr;
  +[CarClusterUpdate getStringValue:displayUnits:forRemainingDistance:](CarClusterUpdate, "getStringValue:displayUnits:forRemainingDistance:", &v52, &v53);
  v49 = v52;
  -[CarClusterUpdateManeuverInfo setDistanceBetweenManeuverDisplayString:](v7, "setDistanceBetweenManeuverDisplayString:");
  -[CarClusterUpdateManeuverInfo setDistanceBetweenManeuverDisplayUnits:](v7, "setDistanceBetweenManeuverDisplayUnits:", v53);
  -[CarClusterUpdateManeuverInfo setDrivingSide:](v7, "setDrivingSide:", (unsigned __int16)objc_msgSend(v5, "drivingSide"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
  -[CarClusterUpdateManeuverInfo setJunctionType:](v7, "setJunctionType:", (unsigned __int16)objc_msgSend(v24, "junctionType"));

  v25 = objc_opt_new(NSMutableArray);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
  v27 = objc_msgSend(v26, "junctionElementsCount");

  if (v27)
  {
    v28 = 0;
    do
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
      objc_msgSend(v29, "junctionElementAtIndex:", v28);
      v31 = v30;

      v32 = v23[370];
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "numberWithInt:", objc_msgSend(v33, "junctionElementAtIndex:", v28)));

      if (v31 != 1)
      {
        if (v31 == 2)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
          v36 = objc_msgSend(v35, "maneuverType");

          if (v36 == 4)
          {
            if (!objc_msgSend(v5, "drivingSide") && (objc_msgSend(v34, "doubleValue"), v37 > 0.0)
              || objc_msgSend(v5, "drivingSide") == 1 && (objc_msgSend(v34, "doubleValue"), v38 < 0.0))
            {
              v39 = v23[370];
              objc_msgSend(v34, "doubleValue");
              v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "numberWithDouble:", -v40));

              v34 = (void *)v41;
            }
          }
          -[CarClusterUpdateManeuverInfo setJunctionElementExitAngle:](v7, "setJunctionElementExitAngle:", v34);
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "exitNumber"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "shield"));
          v45 = objc_msgSend(v44, "copy");
          -[CarClusterUpdateManeuverInfo setExitInfo:](v7, "setExitInfo:", v45);

          v23 = MKPlaceCollectionsLogicController_ptr;
        }
        else
        {
          -[NSMutableArray addObject:](v25, "addObject:", v34);
        }
      }

      ++v28;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
      v47 = objc_msgSend(v46, "junctionElementsCount");

    }
    while (v28 < (unint64_t)v47);
  }
  -[CarClusterUpdateManeuverInfo setJunctionElementAngle:](v7, "setJunctionElementAngle:", v25);

  return v7;
}

+ (id)_maneuverDescriptionForGuidanceEvent:(id)a3 routeStep:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "maneuverType");
  if (v7 <= 0x27 && ((1 << v7) & 0x8600050000) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));

    v10 = objc_alloc_init((Class)NSMutableDictionary);
    v11 = objc_msgSend(v9, "legIndexForStepIndex:", objc_msgSend(v6, "stepIndex"));
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destination"));
    }
    else
    {
      v13 = (unint64_t)v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "legs"));
      if (v13 >= (unint64_t)objc_msgSend(v14, "count"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destination"));
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "legs"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v13));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destination"));

      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navDisplayAddress"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("{Address}"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navDisplayName"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("{Name}"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverRoadOrExitName"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("{Road}"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signDetails"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
    *((_QWORD *)&v27 + 1) = 0;
    v26 = 1;
    *(_DWORD *)((char *)&v27 + 7) = 0;
    v28 = 0;
    *(_QWORD *)&v27 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:options:overrideVariables:](NSString, "_navigation_stringForServerFormattedString:options:overrideVariables:", v21, &v26, v10));

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signDetails"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v25));

  }
  return v22;
}

- (CarClusterUpdateManeuverInfo)init
{
  CarClusterUpdateManeuverInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarClusterUpdateManeuverInfo;
  result = -[CarClusterUpdateManeuverInfo init](&v3, "init");
  if (result)
  {
    result->_maneuverType = -1;
    result->_distanceBetweenManeuverDisplayUnits = -1;
    result->_drivingSide = -1;
    result->_junctionType = -1;
  }
  return result;
}

- (NSUUID)uniqueID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdateManeuverInfo guidanceEvent](self, "guidanceEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueID"));

  return (NSUUID *)v3;
}

- (void)setManeuverDescription:(id)a3
{
  NSString *v4;
  NSString *maneuverDescription;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
  maneuverDescription = self->_maneuverDescription;
  self->_maneuverDescription = v4;

}

- (void)setAfterManeuverRoadName:(id)a3
{
  NSString *v4;
  NSString *afterManeuverRoadName;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
  afterManeuverRoadName = self->_afterManeuverRoadName;
  self->_afterManeuverRoadName = v4;

}

- (id)debugProperties
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[CarClusterUpdateManeuverInfo hasBeenSent](self, "hasBeenSent");
  v3 = CFSTR("NO");
  if (v2)
    v3 = CFSTR("YES");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hasBeenSent=%@"), v3);
}

+ (id)_enumProperties
{
  if (qword_1014D4310 != -1)
    dispatch_once(&qword_1014D4310, &stru_1011E7FF8);
  return (id)qword_1014D4318;
}

+ (id)_integersKeyed
{
  if (qword_1014D4320 != -1)
    dispatch_once(&qword_1014D4320, &stru_1011E8018);
  return (id)qword_1014D4328;
}

- (BOOL)hasBeenSent
{
  return self->_hasBeenSent;
}

- (void)setHasBeenSent:(BOOL)a3
{
  self->_hasBeenSent = a3;
}

- (GEOComposedGuidanceEvent)guidanceEvent
{
  return self->_guidanceEvent;
}

- (void)setGuidanceEvent:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceEvent, a3);
}

- (GEOComposedRouteStep)routeStep
{
  return self->_routeStep;
}

- (void)setRouteStep:(id)a3
{
  objc_storeStrong((id *)&self->_routeStep, a3);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)isSecondary
{
  return self->_isSecondary;
}

- (void)setIsSecondary:(BOOL)a3
{
  self->_isSecondary = a3;
}

- (NSString)maneuverDescription
{
  return self->_maneuverDescription;
}

- (unsigned)maneuverType
{
  return self->_maneuverType;
}

- (void)setManeuverType:(unsigned __int16)a3
{
  self->_maneuverType = a3;
}

- (NSString)afterManeuverRoadName
{
  return self->_afterManeuverRoadName;
}

- (NSNumber)distanceBetweenManeuver
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDistanceBetweenManeuver:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)distanceBetweenManeuverDisplayString
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDistanceBetweenManeuverDisplayString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (unsigned)distanceBetweenManeuverDisplayUnits
{
  return self->_distanceBetweenManeuverDisplayUnits;
}

- (void)setDistanceBetweenManeuverDisplayUnits:(unsigned __int16)a3
{
  self->_distanceBetweenManeuverDisplayUnits = a3;
}

- (unsigned)drivingSide
{
  return self->_drivingSide;
}

- (void)setDrivingSide:(unsigned __int16)a3
{
  self->_drivingSide = a3;
}

- (unsigned)junctionType
{
  return self->_junctionType;
}

- (void)setJunctionType:(unsigned __int16)a3
{
  self->_junctionType = a3;
}

- (NSArray)junctionElementAngle
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setJunctionElementAngle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)junctionElementExitAngle
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setJunctionElementExitAngle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSNumber)linkedLaneGuidanceInfo
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLinkedLaneGuidanceInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)exitInfo
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setExitInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitInfo, 0);
  objc_storeStrong((id *)&self->_linkedLaneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_junctionElementExitAngle, 0);
  objc_storeStrong((id *)&self->_junctionElementAngle, 0);
  objc_storeStrong((id *)&self->_distanceBetweenManeuverDisplayString, 0);
  objc_storeStrong((id *)&self->_distanceBetweenManeuver, 0);
  objc_storeStrong((id *)&self->_afterManeuverRoadName, 0);
  objc_storeStrong((id *)&self->_maneuverDescription, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_routeStep, 0);
  objc_storeStrong((id *)&self->_guidanceEvent, 0);
}

@end
