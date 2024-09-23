@implementation NavSignManeuverGuidanceInfo

+ (id)updatedGuidanceWithPreviousGuidance:(id)a3 currentGuidance:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signID"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v10 = v6;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverArtwork"));
    objc_msgSend(v5, "setManeuverArtwork:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "majorTextAlternatives"));
    objc_msgSend(v5, "setMajorTextAlternatives:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "minorTextAlternatives"));
    objc_msgSend(v5, "setMinorTextAlternatives:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shieldInfo"));
    objc_msgSend(v5, "setShieldInfo:", v14);

    v10 = v5;
  }
  v15 = v10;

  return v15;
}

- (NavSignManeuverGuidanceInfo)initWithSignID:(id)a3 maneuverArtwork:(id)a4 majorTextAlternatives:(id)a5 minorTextAlternatives:(id)a6 shieldInfo:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NavSignManeuverGuidanceInfo *v18;
  NavSignManeuverGuidanceInfo *v19;
  NSArray *v20;
  NSArray *majorTextAlternatives;
  NSArray *v22;
  NSArray *minorTextAlternatives;
  uint64_t v24;
  NSHashTable *observers;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)NavSignManeuverGuidanceInfo;
  v18 = -[NavSignManeuverGuidanceInfo init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signID, a3);
    objc_storeStrong((id *)&v19->_maneuverArtwork, a4);
    v20 = (NSArray *)objc_msgSend(v15, "copy");
    majorTextAlternatives = v19->_majorTextAlternatives;
    v19->_majorTextAlternatives = v20;

    v22 = (NSArray *)objc_msgSend(v16, "copy");
    minorTextAlternatives = v19->_minorTextAlternatives;
    v19->_minorTextAlternatives = v22;

    objc_storeStrong((id *)&v19->_shieldInfo, a7);
    v24 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v24;

  }
  return v19;
}

- (MKServerFormattedString)majorText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo majorTextAlternatives](self, "majorTextAlternatives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (MKServerFormattedString *)v3;
}

- (MKServerFormattedString)minorText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo minorTextAlternatives](self, "minorTextAlternatives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (MKServerFormattedString *)v3;
}

- (void)setMajorText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    -[NavSignManeuverGuidanceInfo setMajorTextAlternatives:](self, "setMajorTextAlternatives:", v6);

  }
  else
  {
    -[NavSignManeuverGuidanceInfo setMajorTextAlternatives:](self, "setMajorTextAlternatives:", 0);
  }

}

- (void)setMinorText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    -[NavSignManeuverGuidanceInfo setMinorTextAlternatives:](self, "setMinorTextAlternatives:", v6);

  }
  else
  {
    -[NavSignManeuverGuidanceInfo setMinorTextAlternatives:](self, "setMinorTextAlternatives:", 0);
  }

}

- (BOOL)matchesManeuver:(int)a3 minorTextAlternatives:(id)a4 shieldInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo maneuverArtwork](self, "maneuverArtwork"));
  v11 = objc_msgSend(v10, "maneuver");

  if (v11 != a3)
    goto LABEL_7;
  v12 = objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo shieldInfo](self, "shieldInfo"));
  if (!v12)
  {
    if (!v9)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_10;
  }
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo shieldInfo](self, "shieldInfo"));
  v15 = objc_msgSend(v14, "isEqual:", v9);

  if ((v15 & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo minorTextAlternatives](self, "minorTextAlternatives"));
  if (objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo minorTextAlternatives](self, "minorTextAlternatives"));
    v18 = objc_msgSend(v17, "isEqualToArray:", v8);

  }
  else
  {
    v18 = objc_msgSend(v8, "count") == 0;
  }

LABEL_10:
  return v18;
}

- (BOOL)matchesManeuver:(int)a3 minorTextAlternatives:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo maneuverArtwork](self, "maneuverArtwork"));
  v8 = objc_msgSend(v7, "maneuver");

  if (v8 == a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo minorTextAlternatives](self, "minorTextAlternatives"));
    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo minorTextAlternatives](self, "minorTextAlternatives"));
      v11 = objc_msgSend(v10, "isEqualToArray:", v6);

    }
    else
    {
      v11 = objc_msgSend(v6, "count") == 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addGuidanceObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeGuidanceObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NavSignManeuverGuidanceInfo;
  v3 = -[NavSignManeuverGuidanceInfo description](&v18, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo signID](self, "signID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo maneuverArtwork](self, "maneuverArtwork"));
  v6 = objc_msgSend(v17, "maneuver");
  v7 = CFSTR("NO_TURN");
  switch((int)v6)
  {
    case 0:
      break;
    case 1:
      v7 = CFSTR("LEFT_TURN");
      break;
    case 2:
      v7 = CFSTR("RIGHT_TURN");
      break;
    case 3:
      v7 = CFSTR("STRAIGHT_AHEAD");
      break;
    case 4:
      v7 = CFSTR("U_TURN");
      break;
    case 5:
      v7 = CFSTR("FOLLOW_ROAD");
      break;
    case 6:
      v7 = CFSTR("ENTER_ROUNDABOUT");
      break;
    case 7:
      v7 = CFSTR("EXIT_ROUNDABOUT");
      break;
    case 11:
      v7 = CFSTR("OFF_RAMP");
      break;
    case 12:
      v7 = CFSTR("ON_RAMP");
      break;
    case 16:
      v7 = CFSTR("ARRIVE_END_OF_NAVIGATION");
      break;
    case 17:
      v7 = CFSTR("START_ROUTE");
      break;
    case 18:
      v7 = CFSTR("ARRIVE_AT_DESTINATION");
      break;
    case 20:
      v7 = CFSTR("KEEP_LEFT");
      break;
    case 21:
      v7 = CFSTR("KEEP_RIGHT");
      break;
    case 22:
      v7 = CFSTR("ENTER_FERRY");
      break;
    case 23:
      v7 = CFSTR("EXIT_FERRY");
      break;
    case 24:
      v7 = CFSTR("CHANGE_FERRY");
      break;
    case 25:
      v7 = CFSTR("START_ROUTE_WITH_U_TURN");
      break;
    case 26:
      v7 = CFSTR("U_TURN_AT_ROUNDABOUT");
      break;
    case 27:
      v7 = CFSTR("LEFT_TURN_AT_END");
      break;
    case 28:
      v7 = CFSTR("RIGHT_TURN_AT_END");
      break;
    case 29:
      v7 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
      break;
    case 30:
      v7 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
      break;
    case 33:
      v7 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
      break;
    case 34:
      v7 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
      break;
    case 35:
      v7 = CFSTR("U_TURN_WHEN_POSSIBLE");
      break;
    case 39:
      v7 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
      break;
    case 41:
      v7 = CFSTR("ROUNDABOUT_EXIT_1");
      break;
    case 42:
      v7 = CFSTR("ROUNDABOUT_EXIT_2");
      break;
    case 43:
      v7 = CFSTR("ROUNDABOUT_EXIT_3");
      break;
    case 44:
      v7 = CFSTR("ROUNDABOUT_EXIT_4");
      break;
    case 45:
      v7 = CFSTR("ROUNDABOUT_EXIT_5");
      break;
    case 46:
      v7 = CFSTR("ROUNDABOUT_EXIT_6");
      break;
    case 47:
      v7 = CFSTR("ROUNDABOUT_EXIT_7");
      break;
    case 48:
      v7 = CFSTR("ROUNDABOUT_EXIT_8");
      break;
    case 49:
      v7 = CFSTR("ROUNDABOUT_EXIT_9");
      break;
    case 50:
      v7 = CFSTR("ROUNDABOUT_EXIT_10");
      break;
    case 51:
      v7 = CFSTR("ROUNDABOUT_EXIT_11");
      break;
    case 52:
      v7 = CFSTR("ROUNDABOUT_EXIT_12");
      break;
    case 53:
      v7 = CFSTR("ROUNDABOUT_EXIT_13");
      break;
    case 54:
      v7 = CFSTR("ROUNDABOUT_EXIT_14");
      break;
    case 55:
      v7 = CFSTR("ROUNDABOUT_EXIT_15");
      break;
    case 56:
      v7 = CFSTR("ROUNDABOUT_EXIT_16");
      break;
    case 57:
      v7 = CFSTR("ROUNDABOUT_EXIT_17");
      break;
    case 58:
      v7 = CFSTR("ROUNDABOUT_EXIT_18");
      break;
    case 59:
      v7 = CFSTR("ROUNDABOUT_EXIT_19");
      break;
    case 60:
      v7 = CFSTR("SHARP_LEFT_TURN");
      break;
    case 61:
      v7 = CFSTR("SHARP_RIGHT_TURN");
      break;
    case 62:
      v7 = CFSTR("SLIGHT_LEFT_TURN");
      break;
    case 63:
      v7 = CFSTR("SLIGHT_RIGHT_TURN");
      break;
    case 64:
      v7 = CFSTR("CHANGE_HIGHWAY");
      break;
    case 65:
      v7 = CFSTR("CHANGE_HIGHWAY_LEFT");
      break;
    case 66:
      v7 = CFSTR("CHANGE_HIGHWAY_RIGHT");
      break;
    case 80:
      v7 = CFSTR("TOLL_STATION");
      break;
    case 81:
      v7 = CFSTR("ENTER_TUNNEL");
      break;
    case 82:
      v7 = CFSTR("WAYPOINT_STOP");
      break;
    case 83:
      v7 = CFSTR("WAYPOINT_STOP_LEFT");
      break;
    case 84:
      v7 = CFSTR("WAYPOINT_STOP_RIGHT");
      break;
    case 85:
      v7 = CFSTR("RESUME_ROUTE");
      break;
    case 86:
      v7 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
      break;
    case 87:
      v7 = CFSTR("CUSTOM");
      break;
    case 88:
      v7 = CFSTR("TURN_AROUND");
      break;
    default:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v6));
      break;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo majorTextAlternatives](self, "majorTextAlternatives"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "debugDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo minorTextAlternatives](self, "minorTextAlternatives"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "debugDescription"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignManeuverGuidanceInfo shieldInfo](self, "shieldInfo"));
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ signID: [%@] maneuver: [%@] major: [%@] minor: [%@] shield: [%@]"), v4, v5, v7, v10, v13, v14));

  return v16;
}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_setNeedsChangeNotification
{
  _QWORD block[5];

  if (!self->_willNotify)
  {
    self->_willNotify = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002475B8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setManeuverArtwork:(id)a3
{
  GuidanceManeuverArtwork *v5;
  GuidanceManeuverArtwork *maneuverArtwork;
  unsigned __int8 v7;
  GuidanceManeuverArtwork *v8;

  v5 = (GuidanceManeuverArtwork *)a3;
  maneuverArtwork = self->_maneuverArtwork;
  if (maneuverArtwork != v5)
  {
    v8 = v5;
    v7 = -[GuidanceManeuverArtwork isEqual:](maneuverArtwork, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maneuverArtwork, a3);
      -[NavSignManeuverGuidanceInfo _setNeedsChangeNotification](self, "_setNeedsChangeNotification");
      v5 = v8;
    }
  }

}

- (void)setMajorTextAlternatives:(id)a3
{
  NSArray *v4;
  NSArray *majorTextAlternatives;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  majorTextAlternatives = self->_majorTextAlternatives;
  if (majorTextAlternatives != v4)
  {
    v9 = v4;
    if (!v4 || (v6 = -[NSArray isEqualToArray:](majorTextAlternatives, "isEqualToArray:", v4), v4 = v9, (v6 & 1) == 0))
    {
      v7 = (NSArray *)-[NSArray copy](v4, "copy");
      v8 = self->_majorTextAlternatives;
      self->_majorTextAlternatives = v7;

      -[NavSignManeuverGuidanceInfo _setNeedsChangeNotification](self, "_setNeedsChangeNotification");
      v4 = v9;
    }
  }

}

- (void)setMinorTextAlternatives:(id)a3
{
  NSArray *v4;
  NSArray *minorTextAlternatives;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  minorTextAlternatives = self->_minorTextAlternatives;
  if (minorTextAlternatives != v4)
  {
    v9 = v4;
    if (!v4 || (v6 = -[NSArray isEqualToArray:](minorTextAlternatives, "isEqualToArray:", v4), v4 = v9, (v6 & 1) == 0))
    {
      v7 = (NSArray *)-[NSArray copy](v4, "copy");
      v8 = self->_minorTextAlternatives;
      self->_minorTextAlternatives = v7;

      -[NavSignManeuverGuidanceInfo _setNeedsChangeNotification](self, "_setNeedsChangeNotification");
      v4 = v9;
    }
  }

}

- (void)setShieldInfo:(id)a3
{
  NavSignShieldInfo *v5;
  NavSignShieldInfo *shieldInfo;
  unsigned __int8 v7;
  NavSignShieldInfo *v8;

  v5 = (NavSignShieldInfo *)a3;
  shieldInfo = self->_shieldInfo;
  if (shieldInfo != v5)
  {
    v8 = v5;
    v7 = -[NavSignShieldInfo isEqual:](shieldInfo, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_shieldInfo, a3);
      -[NavSignManeuverGuidanceInfo _setNeedsChangeNotification](self, "_setNeedsChangeNotification");
      v5 = v8;
    }
  }

}

- (NSUUID)signID
{
  return self->_signID;
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  return self->_maneuverArtwork;
}

- (NSArray)majorTextAlternatives
{
  return self->_majorTextAlternatives;
}

- (NSArray)minorTextAlternatives
{
  return self->_minorTextAlternatives;
}

- (NavSignShieldInfo)shieldInfo
{
  return self->_shieldInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldInfo, 0);
  objc_storeStrong((id *)&self->_minorTextAlternatives, 0);
  objc_storeStrong((id *)&self->_majorTextAlternatives, 0);
  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
  objc_storeStrong((id *)&self->_signID, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
