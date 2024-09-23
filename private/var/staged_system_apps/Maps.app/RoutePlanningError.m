@implementation RoutePlanningError

- (RoutePlanningError)initWithError:(id)a3 transportType:(unint64_t)a4
{
  return -[RoutePlanningError initWithError:transportType:origin:destination:](self, "initWithError:transportType:origin:destination:", a3, a4, 0, 0);
}

- (RoutePlanningError)initWithError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  RoutePlanningError *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  GEOTransitRoutingIncidentMessage *incidentMessage;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningError;
  v13 = -[RoutePlanningError init](&v19, "init");
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", MKDirectionsErrorCodeKey));
    -[RoutePlanningError setErrorCode:](v13, "setErrorCode:", objc_msgSend(v15, "integerValue"));

    -[RoutePlanningError _buildErrorStringsFromError:transportType:origin:destination:](v13, "_buildErrorStringsFromError:transportType:origin:destination:", v10, a4, v11, v12);
    -[RoutePlanningError _updateRoutingAppsVisibilityWithError:transportType:](v13, "_updateRoutingAppsVisibilityWithError:transportType:", v10, a4);
    -[RoutePlanningError _updateRegularDirectionsFallbackVisibilityWithError:transportType:](v13, "_updateRegularDirectionsFallbackVisibilityWithError:transportType:", v10, a4);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapkit_transitIncident"));
    incidentMessage = v13->_incidentMessage;
    v13->_incidentMessage = (GEOTransitRoutingIncidentMessage *)v16;

  }
  return v13;
}

- (void)_buildErrorStringsFromError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int BOOL;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSString *v48;
  NSString *errorTitle;
  NSString *v50;
  NSString *errorMessage;
  void *v52;
  id v53;
  id v54;
  id v55;

  v10 = a3;
  v54 = a5;
  v53 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSLocalizedFailureReasonErrorKey));

  switch(MKCurrentNetworkConnectionFailureDiagnosis())
  {
    case 0:
    case 4:
      if (!-[RoutePlanningError _buildOutOfCoverageErrorStringsForError:transportType:origin:destination:](self, "_buildOutOfCoverageErrorStringsForError:transportType:origin:destination:", v10, a4, v54, v53))break;
      goto LABEL_52;
    case 1:
      switch(MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0))
      {
        case 1u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_AirplaneMode_iPhone");
          break;
        case 2u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_AirplaneMode_iPod");
          break;
        case 3u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_AirplaneMode_iPad");
          break;
        case 6u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_AirplaneMode_Watch");
          break;
        default:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_AirplaneMode_Device");
          break;
      }
      goto LABEL_7;
    case 2:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = v16;
      v18 = CFSTR("Enable Cellular Data [Route Planning]");
      goto LABEL_7;
    case 3:
      switch(MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0))
      {
        case 1u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_NoNetworkConnection_iPhone");
          break;
        case 2u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_NoNetworkConnection_iPod");
          break;
        case 3u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_NoNetworkConnection_iPad");
          break;
        case 6u:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_NoNetworkConnection_Watch");
          break;
        default:
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = v16;
          v18 = CFSTR("RoutePlanningError_NoNetworkConnection_Device");
          break;
      }
LABEL_7:
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v18, CFSTR("localized string not found"), 0));

      v15 = 0;
      v13 = (void *)v19;
      break;
    default:
      break;
  }
  if (objc_msgSend(v11, "isEqualToString:", MNErrorDomain) && objc_msgSend(v10, "code") == (id)3)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("RoutePlanningError_NilWaypoints_Title"), CFSTR("localized string not found"), 0));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("RoutePlanningError_NilWaypoints_Message"), CFSTR("localized string not found"), 0));
    v13 = v15;
    v15 = v22;
LABEL_13:

    v15 = (void *)v23;
    v13 = (void *)v21;
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "isEqualToString:", NSURLErrorDomain))
  {
    v23 = 0;
    v21 = 0;
    goto LABEL_13;
  }
LABEL_14:
  if ((objc_msgSend(v11, "isEqualToString:", kCFErrorDomainCFNetwork) & 1) != 0
    || (id)-[RoutePlanningError errorCode](self, "errorCode") == (id)2
    || (id)-[RoutePlanningError errorCode](self, "errorCode") == (id)22)
  {
    BOOL = GEOConfigGetBOOL(MapsConfig_OfflineOnlyData, off_1014B4C08);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = v25;
    if (BOOL)
      v27 = CFSTR("Using Offline Maps");
    else
      v27 = CFSTR("You’re Offline");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", v27, CFSTR("localized string not found"), CFSTR("Offline")));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("RoutePlanningError_NoNetworkConnection_Message"), CFSTR("localized string not found"), 0));

    if (!-[RoutePlanningError errorCode](self, "errorCode"))
      -[RoutePlanningError setErrorCode:](self, "setErrorCode:", 2);
  }
  else
  {
    v30 = v15;
    v28 = v13;
  }
  if (objc_msgSend(v28, "length") || objc_msgSend(v30, "length"))
  {
    v13 = v28;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", kCLErrorDomain) & 1) != 0
         || objc_msgSend(v11, "isEqualToString:", MKLocationErrorDomain))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v55 = 0;
    v41 = objc_msgSend(v40, "isLocationServicesPossiblyAvailable:", &v55);
    v42 = v55;

    if (v41)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Current Location Not Available"), CFSTR("localized string not found"), 0));

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Your current location cannot be determined at this time."), CFSTR("localized string not found"), 0));
    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "userInfo"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", NSLocalizedRecoverySuggestionErrorKey));
    }
    v47 = (void *)v45;

    v30 = v47;
  }
  else
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("A route can’t be shown because of a problem connecting to the server."), CFSTR("localized string not found"), 0));

    v30 = 0;
  }
  if (!v10)
    goto LABEL_51;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (!objc_msgSend(v31, "isInternalInstall"))
    goto LABEL_50;
  v32 = GEOConfigGetBOOL(MapsConfig_DisplayInternalRoutingErrors, off_1014B3DB8);

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", MKErrorDirectionsErrorInfoKey));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "internalServerErrors"));
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "internalServerErrors"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Internal Only] %@"), v37));

      if (v30)
      {
        v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingFormat:", CFSTR("\n\n%@"), v38));

        v30 = (id)v39;
      }
      else
      {
        v30 = v38;
      }

    }
LABEL_50:

  }
LABEL_51:
  v48 = (NSString *)objc_msgSend(v13, "copy");
  errorTitle = self->_errorTitle;
  self->_errorTitle = v48;

  v50 = (NSString *)objc_msgSend(v30, "copy");
  errorMessage = self->_errorMessage;
  self->_errorMessage = v50;

  v15 = v30;
LABEL_52:

}

- (BOOL)_buildOutOfCoverageErrorStringsForError:(id)a3 transportType:(unint64_t)a4 origin:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  NSString *v19;
  NSString *errorTitle;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v32;
  NSString *errorMessage;
  uint64_t String;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  v14 = 0;
  if (a4 == 8 && v11 && v12)
  {
    if (objc_msgSend(v10, "_mapkit_isDirectionsError")
      && GEOConfigGetBOOL(MapsConfig_RoutePlanningEnableCyclingOutOfCoverageMessaging, off_1014B3D28)
      && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", MKDirectionsErrorCodeKey)),
          v17 = (unint64_t)objc_msgSend(v16, "integerValue"),
          v16,
          v15,
          (v17 & 0xFFFFFFFFFFFFFFFELL) == 8))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Cycling Directions Not Available [Title]"), CFSTR("localized string not found"), 0));
      errorTitle = self->_errorTitle;
      self->_errorTitle = v19;

      v21 = sub_1002F9D5C(v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = sub_1002F9D5C(v13);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)v24;
      if (v22)
        v26 = v24 == 0;
      else
        v26 = 1;
      v14 = !v26;
      if (!v26)
      {
        v27 = objc_msgSend(v22, "isEqualToString:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v29 = v28;
        if (v27)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Cycling Directions Not Available [Message, Single City]"), CFSTR("localized string not found"), 0));
        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Cycling Directions Not Available [Message, Multi City]"), CFSTR("localized string not found"), 0));
          v38 = v25;
        }
        v32 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v22, v38));
        errorMessage = self->_errorMessage;
        self->_errorMessage = v32;

        String = GEOConfigGetString(MapsConfig_RoutePlanningEnableCyclingOutOfCoverageFeatureAvailabilityPunchoutURL, off_1014B3D38);
        v35 = (void *)objc_claimAutoreleasedReturnValue(String);
        if (objc_msgSend(v35, "length"))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v35));
          if (v36)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
            v39 = objc_msgSend(v37, "canOpenURL:", v36);

            if (v39)
              objc_storeStrong((id *)&self->_errorViewFeatureAvailabilityPunchoutURL, v36);
          }
        }
        else
        {
          v36 = 0;
        }

      }
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (void)_updateRoutingAppsVisibilityWithError:(id)a3 transportType:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  id v10;

  v10 = a3;
  v9 = objc_msgSend(v10, "_mapkit_isDirectionsError")
    && ((v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo")),
         v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", MKDirectionsErrorCodeKey)),
         v8 = (unint64_t)objc_msgSend(v7, "integerValue"),
         v7,
         v6,
         a4 == 8)
     || a4 == 4)
    && (v8 & 0xFFFFFFFFFFFFFFFELL) == 8;
  self->_errorViewShouldShowRoutingApps = v9;

}

- (void)_updateRegularDirectionsFallbackVisibilityWithError:(id)a3 transportType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char *v9;
  BOOL v10;
  id v11;

  v6 = a3;
  if (a4 == 1)
  {
    v11 = v6;
    if (objc_msgSend(v6, "_mapkit_isDirectionsError"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MKDirectionsErrorCodeKey));
      v9 = (char *)objc_msgSend(v8, "integerValue");

      v10 = (unint64_t)(v9 - 18) < 3;
    }
    else
    {
      v10 = 0;
    }
    self->_errorViewShouldShowRegularDirectionsFallback = v10;
    v6 = v11;
  }
  else
  {
    self->_errorViewShouldShowRegularDirectionsFallback = 0;
  }

}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (BOOL)errorViewShouldShowRoutingApps
{
  return self->_errorViewShouldShowRoutingApps;
}

- (BOOL)errorViewShouldShowRegularDirectionsFallback
{
  return self->_errorViewShouldShowRegularDirectionsFallback;
}

- (NSURL)errorViewFeatureAvailabilityPunchoutURL
{
  return self->_errorViewFeatureAvailabilityPunchoutURL;
}

- (GEOTransitRoutingIncidentMessage)incidentMessage
{
  return self->_incidentMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentMessage, 0);
  objc_storeStrong((id *)&self->_errorViewFeatureAvailabilityPunchoutURL, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
}

@end
