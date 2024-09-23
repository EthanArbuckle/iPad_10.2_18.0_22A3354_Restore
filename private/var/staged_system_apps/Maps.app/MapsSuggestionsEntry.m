@implementation MapsSuggestionsEntry

- (int)proactiveItemType
{
  unint64_t v2;

  v2 = (unint64_t)-[MapsSuggestionsEntry type](self, "type");
  if (v2 > 0x18)
    return 0;
  else
    return dword_100E3567C[v2];
}

- (NSString)analyticsGrouping
{
  id v3;
  NSString *result;

  v3 = -[MapsSuggestionsEntry type](self, "type");
  result = (NSString *)CFSTR("AppConnections");
  switch((unint64_t)v3)
  {
    case 0uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0x11uLL:
    case 0x14uLL:
      result = (NSString *)CFSTR("Other");
      break;
    case 1uLL:
    case 2uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x16uLL:
      result = (NSString *)CFSTR("UserDefined");
      break;
    case 3uLL:
    case 8uLL:
      result = (NSString *)CFSTR("Strong Signals");
      break;
    case 4uLL:
    case 7uLL:
    case 0x15uLL:
      result = (NSString *)CFSTR("UserBehavior");
      break;
    case 5uLL:
    case 0xBuLL:
      result = (NSString *)CFSTR("MapsAppActions");
      break;
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x17uLL:
      result = (NSString *)CFSTR("Bookings");
      break;
    case 0x18uLL:
      if ((isLikelyMeetupThroughMessages(self) & 1) != 0)
      {
        result = (NSString *)CFSTR("BehaviorPrediction_Directions_Messages");
      }
      else if ((isLikelyMeetupThroughFindMy(self) & 1) != 0)
      {
        result = (NSString *)CFSTR("BehaviorPrediction_Directions_FindMy");
      }
      else if (isRecentlyShared(self))
      {
        result = (NSString *)CFSTR("BehaviorPrediction_RecentlyShared");
      }
      else
      {
        result = (NSString *)CFSTR("Other");
      }
      break;
    default:
      return result;
  }
  return result;
}

- (id)sharingContacts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry dataForKey:](self, "dataForKey:", CFSTR("MapsSuggestionsResumeRouteRouteSharedETAData")));
  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactsFromArchivedTripSharingState:", v3)),
        v4,
        v5))
  {
    v6 = v5;
    v7 = v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry arrayForKey:](self, "arrayForKey:", CFSTR("MapsSuggestionSharedETAHandlesFromFavorite")));
    if (v8)
      v6 = (id)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromHandles:](MSPSharedTripContact, "contactsFromHandles:", v8));
    else
      v6 = 0;
    v9 = &__NSArray0__struct;
    if (v6)
      v9 = v6;
    v7 = v9;

  }
  return v7;
}

- (void)updateModel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_101273380));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("__internal__CarMapsSuggestionsEntryDecoratedTitle")));

  if (v7)
    v8 = v7;
  else
    v8 = v5;
  v9 = v8;

  v10 = objc_msgSend(v9, "BOOLValue");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_101273398));

    v4 = (void *)v11;
  }
  if (-[MapsSuggestionsEntry wasEverOneOfTypes:](self, "wasEverOneOfTypes:", v4))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry title](self, "title"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")));
    if (!objc_msgSend(v12, "length"))
    {
      v13 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle"));

      v12 = (void *)v13;
    }
  }
  objc_msgSend(v24, "setFirstLine:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry MKMapItem](self, "MKMapItem"));
  if (v14)
    objc_msgSend(v24, "setMapItem:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1012733B0));
  objc_msgSend(v24, "observeObject:forKeyPaths:", self, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mapItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_shortAddress"));
  objc_msgSend(v24, "setSecondLine:", v17);

  if (-[MapsSuggestionsEntry type](self, "type") == (id)11)
  {
    v18 = MapsSuggestionsLocalizedResumeRouteString();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v24, "setSecondLine:", v19);

  }
  if (-[MapsSuggestionsEntry type](self, "type") == (id)10)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry subtitle](self, "subtitle"));
    objc_msgSend(v24, "setSecondLine:", v20);

  }
  v21 = NSStringFromMapsSuggestionsEntryType(-[MapsSuggestionsEntry type](self, "type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[MSg %@]"), v22));
  objc_msgSend(v24, "setDebugSubtitle:", v23);

}

- (int)engineType
{
  void *v3;
  int v4;

  if (-[MapsSuggestionsEntry type](self, "type") != (id)10)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry numberForKey:](self, "numberForKey:", CFSTR("MapsSuggestionsCarPlayEnergyTypeKey")));
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)isHybridEngineType
{
  unsigned int v2;

  v2 = -[MapsSuggestionsEntry engineType](self, "engineType");
  return ((v2 >> 1) & 1) + (v2 & 1) + ((v2 >> 2) & 1) + ((v2 >> 3) & 1) > 1;
}

- (GEOComposedWaypoint)findMyWaypoint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  if (-[MapsSuggestionsEntry type](self, "type") == (id)24
    && -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsContactLikelyAppleIDKey"))&& -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsLatitudeKey"))&& -[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsLongitudeKey")))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry numberForKey:](self, "numberForKey:", CFSTR("MapsSuggestionsLatitudeKey")));
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry numberForKey:](self, "numberForKey:", CFSTR("MapsSuggestionsLongitudeKey")));
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    v9 = 0;
    if (v8 >= -180.0 && v8 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry dateForKey:](self, "dateForKey:", CFSTR("MapsSuggestionsContactLocationTimestampKey")));
      v11 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v5, v8);
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      objc_msgSend(v11, "setTimestamp:");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsContactLikelyAppleIDKey")));
      v9 = objc_msgSend(objc_alloc((Class)GEOComposedWaypoint), "initWithLocation:findMyHandleID:", v11, v12);

    }
  }
  else
  {
    v9 = 0;
  }
  return (GEOComposedWaypoint *)v9;
}

- (int)transportType
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry numberForKey:](self, "numberForKey:", CFSTR("MapsSuggestionsTransportTypeKey")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 4;

  return v4;
}

- (BOOL)hasVibrantBackground
{
  unsigned int v3;

  v3 = -[MapsSuggestionsEntry isShortcutForSetup](self, "isShortcutForSetup");
  if (v3)
    LOBYTE(v3) = -[MapsSuggestionsEntry type](self, "type") != (id)7;
  return v3;
}

+ (id)iconForSuggestionType:(int64_t)a3 suggestionAttributes:(id)a4 mapItemAttributes:(id)a5 originBundleID:(id)a6 screenScale:(double)a7 showEVChargingIcon:(BOOL)a8 showOnboardingMultipleVehiclesIcon:(BOOL)a9 inverted:(BOOL)a10 isDashboardWidget:(BOOL)a11 nightMode:(BOOL)a12 isRTL:(BOOL)a13 contact:(id)a14
{
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  uint64_t (**v33)(_QWORD, _QWORD);
  id v34;
  id v35;
  id v36;
  id v37;
  UIImage *v38;
  uint64_t v39;
  uint64_t Log;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t (*v46)(void);
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int BOOL;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  id v74;
  id v75;
  id v76;
  double v77;
  double v78;
  double v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v117;
  id v118;
  id v119;
  id v120;
  void *v121;
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[5];
  BOOL v126;
  BOOL v127;
  _QWORD v128[4];
  id v129;
  _QWORD v130[2];
  uint8_t buf[8];
  uint64_t v132;
  id (*v133)(uint64_t);
  void *v134;
  id v135;
  id v136;
  double v137;
  double v138;
  uint64_t v139;
  _QWORD v140[2];

  v14 = a9;
  v15 = a8;
  v20 = a11;
  v122 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a14;
  v24 = v23;
  if (!v15)
  {
    if (!v14)
      goto LABEL_17;
    v25 = a11;
    v35 = v21;
    v36 = v22;
    v37 = v23;
    v38 = sub_100BA0DB8();
    v33 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(v38);
    v39 = MapsSuggestionsLoggingSubsystem;
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "Entry+MapsAppHelper");
    v41 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Trying to show the EVOnboardingIconForTipKit", buf, 2u);
    }

    v24 = v37;
    v22 = v36;
    v21 = v35;
    if (v33)
      goto LABEL_60;
    v42 = GEOFindOrCreateLog(v39, "Entry+MapsAppHelper");
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Could not fetch the icon for onboarding with multiple vehicles", buf, 2u);
    }
LABEL_16:
    v20 = v25;

LABEL_17:
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_1009523A4;
    v125[3] = &unk_1011DCA18;
    *(double *)&v125[4] = a7;
    v126 = a10;
    v127 = a12;
    v45 = objc_retainBlock(v125);
    v33 = (uint64_t (**)(_QWORD, _QWORD))v45;
    switch(a3)
    {
      case 0:
      case 4:
      case 5:
      case 6:
      case 10:
      case 17:
      case 18:
      case 21:
        v49 = v21;
        v50 = ((uint64_t (**)(_QWORD, NSObject *))v33)[2](v33, v49);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (v51)
          goto LABEL_57;
        v52 = v122;

        v53 = ((uint64_t (**)(_QWORD, NSObject *))v33)[2](v33, v52);
        v34 = (id)objc_claimAutoreleasedReturnValue(v53);
        v49 = v52;
        if (v34)
          goto LABEL_58;
        goto LABEL_55;
      case 1:
      case 2:
      case 7:
      case 13:
      case 14:
      case 15:
      case 16:
      case 19:
      case 22:
        goto LABEL_18;
      case 3:
        v57 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "Entry+MapsAppHelper");
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Will fetch image for calendar event (isDashboardWidget:%d)", buf, 8u);
        }

        v46 = (uint64_t (*)(void))v33[2];
        goto LABEL_19;
      case 8:
      case 12:
        if (v20)
        {
LABEL_18:
          v46 = (uint64_t (*)(void))v45[2];
LABEL_19:
          v47 = v46();
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (v48)
          {
LABEL_20:
            v34 = (id)v48;
            goto LABEL_59;
          }
          goto LABEL_56;
        }
        v54 = v22;
        v49 = v54;
        if (!v54)
          goto LABEL_52;
        if (-[NSObject isEqualToString:](v54, "isEqualToString:", CFSTR("com.apple.siri.homepod")))
        {
          v55 = ((uint64_t (**)(_QWORD, id))v33)[2](v33, v21);
        }
        else
        {
          v113 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
          objc_msgSend(v113, "scale");
          v34 = (id)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v49, 2));

          if (v34)
            goto LABEL_58;
LABEL_52:
          v55 = ((uint64_t (**)(_QWORD, id))v33)[2](v33, v122);
        }
        v114 = (void *)objc_claimAutoreleasedReturnValue(v55);
        if (!v114)
          goto LABEL_55;
        v34 = v114;

        goto LABEL_58;
      case 9:
      case 20:
        if (v20)
          goto LABEL_56;
        v49 = v22;
        if (!v49)
          goto LABEL_55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v56, "scale");
        v34 = (id)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v49, 2));

        if (!v34)
          goto LABEL_55;
        goto LABEL_58;
      case 11:
        v48 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("recentroute")));
        if (!v48)
          goto LABEL_56;
        goto LABEL_20;
      case 23:
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        v130[0] = v59;
        v60 = v24;
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        v130[1] = v61;
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v130, 2));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v62));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("shippingbox.circle.fill"), v63));

        v24 = v60;
        if (!v64)
          goto LABEL_56;
        BOOL = GEOConfigGetBOOL(GEOConfigMapsSuggestionsOrderStatusCategoryIconEnabled[0], GEOConfigMapsSuggestionsOrderStatusCategoryIconEnabled[1]);
        if (v122
          && BOOL
          && (v66 = (id)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes addressMarkerStyleAttributes](GEOFeatureStyleAttributes, "addressMarkerStyleAttributes")), v66, v66 != v122)&& (v67 = ((uint64_t (**)(_QWORD, id))v33)[2](v33, v122), (v68 = objc_claimAutoreleasedReturnValue(v67)) != 0))
        {
          v69 = (void *)v68;
          objc_msgSend(v64, "size");
          v71 = v70 * 0.5;
          objc_msgSend(v64, "size");
          v73 = v72 * 0.5;
          v74 = v64;
          v75 = v69;
          v76 = objc_alloc((Class)UIGraphicsImageRenderer);
          objc_msgSend(v74, "size");
          v78 = v77 + 0.0;
          objc_msgSend(v74, "size");
          v80 = objc_msgSend(v76, "initWithSize:", v78, v79 + 0.0);
          *(_QWORD *)buf = _NSConcreteStackBlock;
          v132 = 3221225472;
          v133 = sub_1009526E8;
          v134 = &unk_1011BA538;
          v135 = v74;
          v136 = v75;
          v137 = v71;
          v138 = v73;
          v81 = v75;
          v49 = v74;
          v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "imageWithActions:", buf));

          v24 = v60;
        }
        else
        {
          v111 = objc_alloc((Class)UIGraphicsImageRenderer);
          objc_msgSend(v64, "size");
          v81 = objc_msgSend(v111, "initWithSize:");
          v123[0] = _NSConcreteStackBlock;
          v123[1] = 3221225472;
          v123[2] = sub_1009526D4;
          v123[3] = &unk_1011B4110;
          v124 = v64;
          v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "imageWithActions:", v123));

          v34 = v49;
        }

        goto LABEL_58;
      case 24:
        v117 = v24;
        v120 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "avatarImageWithSize:scale:rightToLeft:", a13, 128.0, 128.0, a7));
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
        v140[0] = v82;
        v83 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
        v140[1] = v83;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v140, 2));
        v121 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v84));

        v85 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("location.circle.fill"), v121));
        v86 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v85);
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "layer"));
        objc_msgSend(v87, "setBorderWidth:", 1.0);

        v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor")));
        v89 = objc_msgSend(v88, "CGColor");
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "layer"));
        objc_msgSend(v90, "setBackgroundColor:", v89);

        v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor")));
        v92 = objc_msgSend(v91, "CGColor");
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "layer"));
        objc_msgSend(v93, "setBorderColor:", v92);

        objc_msgSend(v85, "size");
        v95 = v94 * 0.5;
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "layer"));
        objc_msgSend(v96, "setCornerRadius:", v95);

        v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "layer"));
        objc_msgSend(v97, "setMasksToBounds:", 1);

        v98 = objc_alloc((Class)UIGraphicsImageRenderer);
        objc_msgSend(v85, "size");
        v118 = objc_msgSend(v98, "initWithSize:");
        v128[0] = _NSConcreteStackBlock;
        v128[1] = 3221225472;
        v128[2] = sub_10095275C;
        v128[3] = &unk_1011B4110;
        v129 = v86;
        v119 = v86;
        v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "imageWithActions:", v128));

        objc_msgSend(v120, "size");
        v101 = v100 * 0.5;
        objc_msgSend(v120, "size");
        v103 = v101 + v102 * 0.5 * 0.707106781 + -40.0;
        objc_msgSend(v120, "size");
        v105 = v104 * 0.5;
        objc_msgSend(v120, "size");
        v107 = v105 + v106 * 0.5 * 0.707106781 + -40.0;
        v108 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v103 + 80.0, v107 + 80.0);
        *(_QWORD *)buf = _NSConcreteStackBlock;
        v132 = 3221225472;
        v133 = sub_1009527B8;
        v134 = &unk_1011DCA40;
        v137 = v103;
        v138 = v107;
        v135 = v120;
        v136 = v99;
        v139 = 0x4054000000000000;
        v109 = v99;
        v110 = v120;
        v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "imageWithActions:", buf));

        if (v34)
        {
          v24 = v117;
        }
        else
        {
          v112 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "Entry+MapsAppHelper");
          v49 = objc_claimAutoreleasedReturnValue(v112);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, "Unable to get an image from the Monogrammer. Showing red pin. This should never happen.", buf, 2u);
          }
          v24 = v117;
LABEL_55:

LABEL_56:
          v49 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
          v115 = ((uint64_t (**)(_QWORD, NSObject *))v33)[2](v33, v49);
          v51 = objc_claimAutoreleasedReturnValue(v115);
LABEL_57:
          v34 = (id)v51;
LABEL_58:

        }
        break;
      default:
        goto LABEL_56;
    }
    goto LABEL_59;
  }
  v25 = a11;
  v26 = v21;
  v27 = v22;
  v28 = v23;
  v29 = MapsSuggestionsLoggingSubsystem;
  v30 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "Entry+MapsAppHelper");
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 101661;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Trying to show the EV Charging Icon %u", buf, 8u);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  objc_msgSend(v32, "screenScale");
  v33 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(+[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", 101661, 4, 0));

  if (!v33)
  {
    v44 = GEOFindOrCreateLog(v29, "Entry+MapsAppHelper");
    v43 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Could not fetch the icon for resuming an EV route", buf, 2u);
    }
    v24 = v28;
    v22 = v27;
    v21 = v26;
    goto LABEL_16;
  }
  if (a10)
  {
    v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "_maps_invertedImage"));
    v24 = v28;
    v22 = v27;
    v21 = v26;
LABEL_59:

    v33 = (uint64_t (**)(_QWORD, _QWORD))v34;
    goto LABEL_60;
  }
  v24 = v28;
  v22 = v27;
  v21 = v26;
LABEL_60:

  return v33;
}

- (MKMapItem)MKMapItem
{
  void *v3;
  id AssociatedObject;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry geoMapItem](self, "geoMapItem"));

  if (v3)
  {
    AssociatedObject = objc_getAssociatedObject(self, algn_100E3CC85);
    v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    v6 = objc_getAssociatedObject(self, &algn_100E3CC85[1]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v5
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry geoMapItem](self, "geoMapItem")),
          v9 = objc_msgSend(v8, "isEqual:", v7),
          v8,
          v9))
    {
      v10 = v5;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry geoMapItem](self, "geoMapItem"));
      if (-[MapsSuggestionsEntry isShortcut](self, "isShortcut"))
      {
        v12 = objc_msgSend(v11, "copy");

        v13 = objc_alloc_init((Class)GEOMapItemStorageUserValues);
        objc_msgSend(v12, "setUserValues:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userValues"));
        objc_msgSend(v15, "setName:", v14);

        v11 = v12;
      }
      v16 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v11, 0);

      objc_setAssociatedObject(self, algn_100E3CC85, v16, (void *)0x301);
      objc_setAssociatedObject(self, &algn_100E3CC85[1], v11, (void *)0x301);
      v10 = v16;

    }
  }
  else
  {
    v10 = 0;
  }
  return (MKMapItem *)v10;
}

- (UIImage)icon
{
  void *v3;
  id AssociatedObject;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));

  if (v3)
  {
    AssociatedObject = objc_getAssociatedObject(self, &algn_100E3CC85[2]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    v6 = objc_getAssociatedObject(self, &unk_100E3CC88);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (!v5
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData")),
          v9 = objc_msgSend(v8, "isEqual:", v7),
          v8,
          (v9 & 1) == 0))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v10));

      objc_setAssociatedObject(self, &algn_100E3CC85[2], v11, (void *)0x301);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));
      objc_setAssociatedObject(self, &unk_100E3CC88, v12, (void *)0x301);

      v5 = v11;
    }
    v13 = v5;

  }
  else
  {
    v13 = 0;
  }
  return (UIImage *)v13;
}

- (void)setIcon:(id)a3
{
  id AssociatedObject;
  void *v5;
  NSData *v6;
  void *v7;
  void *v8;
  UIImage *image;

  image = (UIImage *)a3;
  AssociatedObject = objc_getAssociatedObject(self, &algn_100E3CC85[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (image)
  {
    if ((-[UIImage isEqual:](image, "isEqual:", v5) & 1) == 0)
    {
      v6 = UIImagePNGRepresentation(image);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      -[MapsSuggestionsEntry setIconData:](self, "setIconData:", v7);

      objc_setAssociatedObject(self, &algn_100E3CC85[2], image, (void *)0x301);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry iconData](self, "iconData"));
      objc_setAssociatedObject(self, &unk_100E3CC88, v8, (void *)0x301);

    }
  }
  else if (v5)
  {
    objc_setAssociatedObject(self, &algn_100E3CC85[2], 0, (void *)0x301);
    objc_setAssociatedObject(self, &unk_100E3CC88, 0, (void *)0x301);
    -[MapsSuggestionsEntry setIconData:](self, "setIconData:", 0);
  }

}

- (GEOFeatureStyleAttributes)styleAttributes
{
  unint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (unint64_t)-[MapsSuggestionsEntry type](self, "type");
  if (v3 > 0x18)
  {
LABEL_8:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry MKMapItem](self, "MKMapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_styleAttributes"));

    if (v7)
      return (GEOFeatureStyleAttributes *)v7;
    goto LABEL_3;
  }
  if (((1 << v3) & 0x8018E) == 0)
  {
    if (v3 == 24)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes sharedLocationStyleAttributes](GEOFeatureStyleAttributes, "sharedLocationStyleAttributes"));
      if (v7)
        return (GEOFeatureStyleAttributes *)v7;
      goto LABEL_3;
    }
    goto LABEL_8;
  }
LABEL_3:
  v4 = -[MapsSuggestionsEntry type](self, "type");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier"));
  v6 = v5;
  v7 = 0;
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xBuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
      goto LABEL_22;
    case 1uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
      goto LABEL_22;
    case 2uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes workStyleAttributes](GEOFeatureStyleAttributes, "workStyleAttributes"));
      goto LABEL_22;
    case 3uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes calendarEventStyleAttributes](GEOFeatureStyleAttributes, "calendarEventStyleAttributes"));
      goto LABEL_22;
    case 7uLL:
    case 0xAuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes parkedCarStyleAttributes](GEOFeatureStyleAttributes, "parkedCarStyleAttributes"));
      goto LABEL_22;
    case 8uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes restaurantStyleAttributes](GEOFeatureStyleAttributes, "restaurantStyleAttributes"));
      goto LABEL_22;
    case 0xDuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes hotelStyleAttributes](GEOFeatureStyleAttributes, "hotelStyleAttributes"));
      goto LABEL_22;
    case 0xEuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes carRentalStyleAttributes](GEOFeatureStyleAttributes, "carRentalStyleAttributes"));
      goto LABEL_22;
    case 0xFuLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes airportStyleAttributes](GEOFeatureStyleAttributes, "airportStyleAttributes"));
      goto LABEL_22;
    case 0x10uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes ticketedEventStyleAttributes](GEOFeatureStyleAttributes, "ticketedEventStyleAttributes"));
      goto LABEL_22;
    case 0x13uLL:
      v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes schoolStyleAttributes](GEOFeatureStyleAttributes, "schoolStyleAttributes"));
      goto LABEL_22;
    case 0x16uLL:
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("NearbyTransit")))
      {
        v8 = objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes nearbyTransitStyleAttributes](GEOFeatureStyleAttributes, "nearbyTransitStyleAttributes"));
LABEL_22:
        v7 = (void *)v8;
      }
      else
      {
        v7 = 0;
      }
LABEL_23:

      break;
    default:
      goto LABEL_23;
  }
  return (GEOFeatureStyleAttributes *)v7;
}

- (NSString)poiTitle
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v7;

  v3 = (unint64_t)-[MapsSuggestionsEntry type](self, "type");
  if (v3 > 0x18)
  {
    v5 = 0;
    return (NSString *)v5;
  }
  if (((1 << v3) & 0x7E96F7) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry undecoratedTitle](self, "undecoratedTitle"));
  }
  else
  {
    if (((1 << v3) & 0x1816108) == 0
      || (-[MapsSuggestionsEntry containsKey:](self, "containsKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")) & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry MKMapItem](self, "MKMapItem"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

      return (NSString *)v5;
    }
    v4 = objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry stringForKey:](self, "stringForKey:", CFSTR("MapsSuggestionsEntryTitleNameKey")));
  }
  v5 = (void *)v4;
  return (NSString *)v5;
}

- (NSArray)waypoints
{
  MapsSuggestionsEntry *v2;
  void *v3;

  v2 = self;
  if (self)
  {
    if (-[MapsSuggestionsEntry type](self, "type") == (id)11)
      v2 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry routeRequestStorageForKey:](v2, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")));
    else
      v2 = 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry waypoints](v2, "waypoints"));

  return (NSArray *)v3;
}

+ (id)archivedDestinationForUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t Log;
  _BYTE v14[38];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dataForKey:](v5, "dataForKey:", CFSTR("kSavedMapsCommuteDestinations")));
    *(_QWORD *)v14 = objc_opt_class(NSString);
    *(_QWORD *)&v14[8] = objc_opt_class(NSDictionary);
    *(_QWORD *)&v14[16] = objc_opt_class(NSDate);
    *(_QWORD *)&v14[24] = objc_opt_class(MapsSuggestionsEntry);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7, *(_QWORD *)v14, *(_QWORD *)&v14[8], *(_QWORD *)&v14[16]));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v8, v6, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kDestinationsKey")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v4));
  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomDestination");
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v14 = 136446978;
      *(_QWORD *)&v14[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/MapsSuggestionsEntry+DoomExtras.m";
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = 37;
      *(_WORD *)&v14[18] = 2082;
      *(_QWORD *)&v14[20] = "+[MapsSuggestionsEntry(DoomExtras) archivedDestinationForUniqueID:]";
      *(_WORD *)&v14[28] = 2082;
      *(_QWORD *)&v14[30] = "0u == uniqueID.length";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Desintation ID is nil", v14, 0x26u);
    }
    v11 = 0;
  }

  return v11;
}

+ (void)removeStaleArchivedDestinations
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[4];

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedDefaults"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dataForKey:", CFSTR("kSavedMapsCommuteDestinations")));
  v25[0] = objc_opt_class(NSString);
  v25[1] = objc_opt_class(NSDictionary);
  v25[2] = objc_opt_class(NSDate);
  v25[3] = objc_opt_class(MapsSuggestionsEntry);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  v18 = (void *)v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v4, v2, 0));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kDatesKey")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kDestinationsKey")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14));
        objc_msgSend(v15, "timeIntervalSinceNow");
        if (GEOConfigGetDouble(GEOConfigNavdDoomDestinationStalenessThreshold, off_1014BA3C0) < -v16)
        {
          objc_msgSend(v7, "removeObjectForKey:", v14);
          objc_msgSend(v8, "removeObjectForKey:", v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0));
  objc_msgSend(v19, "setObject:forKey:", v17, CFSTR("kSavedMapsCommuteDestinations"));
  objc_msgSend(v19, "synchronize");

}

- (void)archiveDestination
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t Log;
  _BYTE v21[38];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier"));

  if (v3)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "sharedDefaults");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dataForKey:](v5, "dataForKey:", CFSTR("kSavedMapsCommuteDestinations")));
    *(_QWORD *)v21 = objc_opt_class(NSString);
    *(_QWORD *)&v21[8] = objc_opt_class(NSDictionary);
    *(_QWORD *)&v21[16] = objc_opt_class(NSDate);
    *(_QWORD *)&v21[24] = objc_opt_class(MapsSuggestionsEntry);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7, *(_QWORD *)v21, *(_QWORD *)&v21[8], *(_QWORD *)&v21[16]));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v8, v6, 0));
    v10 = (NSMutableDictionary *)objc_msgSend(v9, "mutableCopy");

    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("kDatesKey")));
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("kDestinationsKey")));
    if (!v10)
    {
      v10 = objc_opt_new(NSMutableDictionary);
      v13 = objc_opt_new(NSMutableDictionary);

      v14 = objc_opt_new(NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, CFSTR("kDatesKey"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, CFSTR("kDestinationsKey"));
      v11 = v13;
      v12 = v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", self, v15);

    v16 = MapsSuggestionsNow();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0));
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", v19, CFSTR("kSavedMapsCommuteDestinations"));
    -[NSObject synchronize](v5, "synchronize");

  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomDestination");
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v21 = 136446978;
      *(_QWORD *)&v21[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/MapsSuggestionsEntry+DoomExtras.m";
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 72;
      *(_WORD *)&v21[18] = 2082;
      *(_QWORD *)&v21[20] = "-[MapsSuggestionsEntry(DoomExtras) archiveDestination]";
      *(_WORD *)&v21[28] = 2082;
      *(_QWORD *)&v21[30] = "nil == (self.uniqueIdentifier)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Destination ID is nil", v21, 0x26u);
    }
  }

}

- (id)notificationDetailsWithTitle:(id)a3 message:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  double Double;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v6 = GEOConfigNavdDoomAlertExpirationTimeout;
  v7 = off_1014BA3B0;
  v8 = a4;
  v9 = a3;
  Double = GEOConfigGetDouble(v6, v7);
  v11 = objc_alloc((Class)NSDate);
  v12 = MapsSuggestionsNow();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v11, "initWithTimeInterval:sinceDate:", v13, Double);

  v15 = objc_alloc((Class)GEOCommuteNotificationDetails);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry uniqueIdentifier](self, "uniqueIdentifier"));
  v17 = objc_msgSend(v15, "initWithTitle:message:commuteDetailsIdentifier:expirationDate:score:", v9, v8, v16, v14, 1);

  return v17;
}

+ (id)sharedDefaults
{
  if (qword_1014D3E20 != -1)
    dispatch_once(&qword_1014D3E20, &stru_1011E1218);
  return (id)qword_1014D3E18;
}

+ (id)__debug_fakeHomeEntry
{
  return _objc_msgSend(a1, "entryFromSerializedBase64String:hasPrefix:", &cfstr_64Ynbsaxn0mddu, 1);
}

@end
