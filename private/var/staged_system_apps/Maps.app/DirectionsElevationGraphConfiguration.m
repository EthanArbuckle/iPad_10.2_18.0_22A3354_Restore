@implementation DirectionsElevationGraphConfiguration

- (DirectionsElevationGraphConfiguration)initWithUseType:(int64_t)a3 userInterfaceIdiom:(int64_t)a4
{
  DirectionsElevationGraphConfiguration *v6;
  DirectionsElevationGraphConfiguration *v7;
  NSString *v8;
  NSSet *v9;
  NSString *specType;
  uint64_t v11;
  NSSet *supportedSignals;
  NSString *v13;
  uint64_t v14;
  NSSet *v15;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DirectionsElevationGraphConfiguration;
  v6 = -[DirectionsElevationGraphConfiguration init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_useType = a3;
    v6->_userInterfaceIdiom = a4;
    *(_OWORD *)&v6->_barWidth = xmmword_100E3ECE0;
    switch(a3)
    {
      case 2:
        specType = v6->_specType;
        v6->_specType = (NSString *)CFSTR("navigation");

        v7->_allowUserInteraction = 1;
        v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("width"), CFSTR("height"), CFSTR("elevationDomainUnionWith"), CFSTR("routeLength"), CFSTR("progress"), CFSTR("textSizes"), CFSTR("yAxis"), 0));
        supportedSignals = v7->_supportedSignals;
        v7->_supportedSignals = (NSSet *)v11;

        *(_OWORD *)&v7->_barWidth = xmmword_100E3ECF0;
        break;
      case 1:
        v13 = v6->_specType;
        v6->_specType = (NSString *)CFSTR("planning");

        v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("width"), CFSTR("height"), CFSTR("elevationDomainUnionWith"), CFSTR("routeLength"), CFSTR("selectedBarColor"), 0, v17, v18);
        goto LABEL_8;
      case 0:
        v8 = v6->_specType;
        v6->_specType = (NSString *)CFSTR("details");

        v7->_showElevationAxisLabels = a4 != 4;
        v7->_allowUserInteraction = 1;
        v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("width"), CFSTR("height"), CFSTR("elevationDomainUnionWith"), CFSTR("routeLength"), CFSTR("fadeDistance"), CFSTR("fadeEnd"), CFSTR("yAxis"), 0);
LABEL_8:
        v14 = objc_claimAutoreleasedReturnValue(v9);
        v15 = v7->_supportedSignals;
        v7->_supportedSignals = (NSSet *)v14;

        break;
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && v4[5] == self->_useType
    && v4[2]
    && self->_userInterfaceIdiom != 0;

  return v5;
}

- (BOOL)supportsSignal:(id)a3
{
  return -[NSSet containsObject:](self->_supportedSignals, "containsObject:", a3);
}

- (unint64_t)targetNumberOfBarsForRouteLength:(double)a3 availableWidth:(double)a4
{
  int64_t useType;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t result;
  unint64_t v13;

  useType = self->_useType;
  -[DirectionsElevationGraphConfiguration barWidth](self, "barWidth");
  v9 = v8;
  -[DirectionsElevationGraphConfiguration gapWidth](self, "gapWidth");
  v11 = v9 + v10;
  if (useType == 1)
    return sub_10044823C(a3, v11, a4);
  v13 = vcvtmd_u64_f64(a4 / v11);
  result = GEOConfigGetUInteger(MapsConfig_RoutePlanningElevationGraphBarMinimumNumberOfBars, off_1014B3BE8);
  if (result <= v13)
    return v13;
  return result;
}

- (NSString)chartSpec
{
  return (NSString *)-[DirectionsElevationGraphConfiguration _JSONForType:](self, "_JSONForType:", self->_specType);
}

- (id)_testDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager _maps_globalCachesURL](NSFileManager, "_maps_globalCachesURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));

  return v4;
}

- (id)_JSONForType:(id)a3
{
  void *v3;
  id v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphConfiguration _urlForType:](self, "_urlForType:", a3));
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v3);
  v5 = &stru_1011EB268;
  if (objc_msgSend(v4, "length"))
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = &stru_1011EB268;
    v5 = v8;

  }
  return v5;
}

- (id)_urlForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = CFSTR("phone");
  if (v6 == (id)5)
    v7 = CFSTR("mac");
  if (v6 == (id)4)
    v8 = CFSTR("watch");
  else
    v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphConfiguration _urlForType:device:](self, "_urlForType:device:", v4, v8));

  return v9;
}

- (id)_urlForType:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  void *v50;
  id v51;

  v6 = a3;
  v7 = a4;
  v32 = v6;
  v51 = v6;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphConfiguration _testDirectoryURL](self, "_testDirectoryURL"));
  v50 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resourceURL"));

  v30 = (void *)v11;
  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObject:", v11));

    v9 = (void *)v12;
  }
  v31 = v7;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithObjects:](NSOrderedSet, "orderedSetWithObjects:", v7, CFSTR("phone"), &stru_1011EB268, 0));
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v45;
    v35 = v9;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(obj);
        v37 = v13;
        v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v13);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v38 = v9;
        v15 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v41;
LABEL_10:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v41 != v17)
              objc_enumerationMutation(v38);
            v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v18);
            v20 = objc_msgSend(v14, "length")
                ? (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "arrayByAddingObject:", v14))
                : v39;
            v21 = v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "componentsJoinedByString:", CFSTR("_")));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cycling_%@"), v22));

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingPathExtension:", CFSTR("json")));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URLByAppendingPathComponent:", v24));

            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
            v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

            if ((v28 & 1) != 0)
              break;

            if (v16 == (id)++v18)
            {
              v16 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              if (v16)
                goto LABEL_10;
              goto LABEL_19;
            }
          }

          v9 = v35;
          if (v25)
            goto LABEL_24;
        }
        else
        {
LABEL_19:

          v9 = v35;
        }
        v13 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v36);
  }
  v25 = 0;
LABEL_24:

  return v25;
}

- (int64_t)useType
{
  return self->_useType;
}

- (BOOL)allowsUserInteraction
{
  return self->_allowUserInteraction;
}

- (void)setAllowUserInteraction:(BOOL)a3
{
  self->_allowUserInteraction = a3;
}

- (BOOL)showsElevationAxisLabels
{
  return self->_showElevationAxisLabels;
}

- (void)setShowElevationAxisLabels:(BOOL)a3
{
  self->_showElevationAxisLabels = a3;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (double)gapWidth
{
  return self->_gapWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSignals, 0);
  objc_storeStrong((id *)&self->_specType, 0);
}

@end
