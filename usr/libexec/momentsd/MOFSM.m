@implementation MOFSM

- (id)referenceState
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("state")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)referenceStateCode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("stateCode")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)referenceCountry
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("country")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)referenceCountryCode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("countryCode")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setReferenceDataWithCountry:(id)a3 countryCode:(id)a4 state:(id)a5 stateCode:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v13)
    v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
  else
    v14 = objc_opt_new(NSMutableDictionary);
  v15 = v14;
  if (v16 && v10)
  {
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v16, CFSTR("country"));
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v10, CFSTR("countryCode"));
  }
  if (v11 && v12)
  {
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v11, CFSTR("state"));
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v12, CFSTR("stateCode"));
  }
  else if ((id)-[MOFSM mode](self, "mode") == (id)2)
  {
    -[MOFSM setMode:](self, "setMode:", 1);
  }
  if (!-[NSMutableDictionary count](v15, "count"))
    -[MOFSM setMode:](self, "setMode:", 0);
  -[MOFSM setMetaData:](self, "setMetaData:", v15);

}

- (id)destination
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("destination")));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setDestination:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v5)
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
  else
    v6 = objc_opt_new(NSMutableDictionary);
  v7 = v6;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v4, CFSTR("destination"));

  -[MOFSM setMetaData:](self, "setMetaData:", v7);
}

- (id)processVisitEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id os_log;
  NSObject *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  MOFSM *v18;
  void *v19;
  MOTripPlan *v20;
  void *v21;
  unint64_t v22;
  MOTripPlan *v23;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  uint64_t v29;
  MOTripPlan *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  MOFSM *v47;
  __int16 v48;
  MOTripPlan *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;

  v4 = a3;
  if (objc_msgSend(v4, "category") != (id)1
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM lastProcessedDate](self, "lastProcessedDate")),
        v7 = objc_msgSend(v5, "isBeforeDate:", v6),
        v6,
        v5,
        (v7 & 1) != 0)
    || (v8 = -[MOFSM tripStateFromVisitEvent:](self, "tripStateFromVisitEvent:", v4)) == 0)
  {
    v23 = 0;
    goto LABEL_12;
  }
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM subStateFromVisitEvent:state:](self, "subStateFromVisitEvent:state:", v4, v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM destinationFromVisitEvent:state:](self, "destinationFromVisitEvent:state:", v4, v9));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class(self, v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (MOFSM *)objc_claimAutoreleasedReturnValue(-[MOFSM stringFromState:](self, "stringFromState:", -[MOFSM state](self, "state")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM substate](self, "substate"));
    v43 = v11;
    v20 = (MOTripPlan *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mask"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM stringFromState:](self, "stringFromState:", v9));
    *(_DWORD *)buf = 138413570;
    v45 = v17;
    v46 = 2112;
    v47 = v18;
    v48 = 2112;
    v49 = v20;
    v50 = 2112;
    v51 = v21;
    v52 = 2112;
    v53 = v10;
    v54 = 2112;
    v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: FSM, prevState, %@, prevSubState, %@, newState, %@, newSubState, %@, event, %@", buf, 0x3Eu);

    v11 = v43;
  }

  v22 = -[MOFSM state](self, "state");
  if (v22 - 2 >= 2)
  {
    if (v22 != 1)
    {
      v23 = 0;
      if (v22 || v9 != 1)
        goto LABEL_31;
      goto LABEL_29;
    }
    if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2)
      goto LABEL_22;
LABEL_23:
    v23 = 0;
    if (-[MOFSM state](self, "state") != v9)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v9 != 1 && -[MOFSM state](self, "state") == v9)
  {
    if ((id)-[MOFSM state](self, "state") != (id)2 && (id)-[MOFSM state](self, "state") != (id)3)
      goto LABEL_23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM substate](self, "substate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM destination](self, "destination"));
    v27 = -[MOFSM stayAtTheSameDestinationWithPrevDestinationCode:prevDestinationName:newDestinationCode:newDestinationName:](self, "stayAtTheSameDestinationWithPrevDestinationCode:prevDestinationName:newDestinationCode:newDestinationName:", v25, v26, v10, v11);

    if ((v27 & 1) != 0)
      goto LABEL_23;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM destination](self, "destination"));

  if (v28)
  {
    if ((id)-[MOFSM state](self, "state") == (id)3)
    {
      v29 = 3;
    }
    else if ((id)-[MOFSM state](self, "state") == (id)2)
    {
      v29 = 2;
    }
    else
    {
      v29 = 3;
    }
    v30 = [MOTripPlan alloc];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM destination](self, "destination"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeStartDate](self, "timeRangeStartDate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeEndDate](self, "timeRangeEndDate"));
    v23 = -[MOTripPlan initWithDestination:destinationType:startDate:endDate:](v30, "initWithDestination:destinationType:startDate:endDate:", v31, v29, v32, v33);

    goto LABEL_29;
  }
LABEL_22:
  v23 = 0;
LABEL_29:
  -[MOFSM setState:](self, "setState:", v9);
  -[MOFSM setSubstate:](self, "setSubstate:", v10);
  -[MOFSM setDestination:](self, "setDestination:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  -[MOFSM setTimeRangeStartDate:](self, "setTimeRangeStartDate:", v34);

LABEL_30:
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  -[MOFSM setTimeRangeEndDate:](self, "setTimeRangeEndDate:", v35);

LABEL_31:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  -[MOFSM setLastProcessedDate:](self, "setLastProcessedDate:", v36);

  v37 = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v40 = (objc_class *)objc_opt_class(self, v39);
    v41 = NSStringFromClass(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    *(_DWORD *)buf = 138412802;
    v45 = v42;
    v46 = 2112;
    v47 = self;
    v48 = 2112;
    v49 = v23;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%@: FSM, %@, completed trip, %@", buf, 0x20u);

  }
LABEL_12:

  return v23;
}

- (void)cleanUpBeforeUpdate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
    v6[0] = CFSTR("state");
    v6[1] = CFSTR("stateCode");
    v6[2] = CFSTR("country");
    v6[3] = CFSTR("countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 4));
    objc_msgSend(v4, "removeObjectsForKeys:", v5);

  }
}

- (BOOL)stayAtTheSameDestinationWithPrevDestinationCode:(id)a3 prevDestinationName:(id)a4 newDestinationCode:(id)a5 newDestinationName:(id)a6
{
  unint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  BOOL v14;

  v10 = (unint64_t)a3;
  v11 = a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  v14 = (v10 != 0) == (v12 != 0)
     && (!(v10 | v12)
      || v10
      && v12
      && -[MOFSM compareRegionCode:regionName:otherRegionCode:otherRegionName:](self, "compareRegionCode:regionName:otherRegionCode:otherRegionName:", v10, v11, v12, v13));

  return v14;
}

- (BOOL)compareRegionCode:(id)a3 regionName:(id)a4 otherRegionCode:(id)a5 otherRegionName:(id)a6
{
  id v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  unsigned __int8 v14;

  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  v12 = (unint64_t)a6;
  if (!(v10 | v12))
  {
    v10 = 0;
    v13 = 0;
    goto LABEL_7;
  }
  v13 = (id)v12;
  if (v10)
  {
    if (v12)
      goto LABEL_4;
  }
  else
  {
    v10 = (unint64_t)v9;
    if (v13)
      goto LABEL_4;
  }
  v13 = v11;
LABEL_4:
  if ((objc_msgSend((id)v10, "isEqualToString:", v13) & 1) == 0)
  {
LABEL_7:
    v14 = objc_msgSend(v9, "isEqualToString:", v11);
    goto LABEL_8;
  }
  v14 = 1;
LABEL_8:

  return v14;
}

- (unint64_t)tripStateFromVisitEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id os_log;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  if (-[MOFSM mode](self, "mode") && objc_msgSend(v4, "category") == (id)1)
  {
    if ((id)-[MOFSM mode](self, "mode") == (id)2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSM stateFromAddress:](MOFSM, "stateFromAddress:", v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "address"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSM stateCodeFromAddress:](MOFSM, "stateCodeFromAddress:", v9));

    }
    else
    {
      v7 = 0;
      v10 = 0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routineEvent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "address"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOFSM countryCodeFromAddress:](MOFSM, "countryCodeFromAddress:", v13));

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityTripAnnotationManager);
    v16 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v26 = 138412802;
      v27 = v7;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "tripStateFromVisitEvent : state : %@ , stateCode : %@, countryCode : %@", (uint8_t *)&v26, 0x20u);
    }

    if ((id)-[MOFSM mode](self, "mode") == (id)2)
    {
      if (v14)
      {
        v11 = objc_claimAutoreleasedReturnValue(-[MOFSM referenceCountryCode](self, "referenceCountryCode"));

        if (v11)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceCountryCode](self, "referenceCountryCode"));
          v18 = objc_msgSend(v17, "isEqualToString:", v14);

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceStateCode](self, "referenceStateCode"));
            v20 = v19;
            if (v19 && v10)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceStateCode](self, "referenceStateCode"));
              v22 = objc_msgSend(v21, "isEqualToString:", v10);

              if (v22)
                v11 = 1;
              else
                v11 = 2;
            }
            else
            {

              v11 = 1;
            }
          }
          else
          {
            v11 = 3;
          }
        }
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      if ((id)-[MOFSM mode](self, "mode") == (id)1)
      {
        if (v14)
        {
          v11 = objc_claimAutoreleasedReturnValue(-[MOFSM referenceCountryCode](self, "referenceCountryCode"));

          if (v11)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceCountryCode](self, "referenceCountryCode"));
            v24 = objc_msgSend(v23, "isEqualToString:", v14);

            if (v24)
              v11 = 1;
            else
              v11 = 3;
          }
        }
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)subStateFromVisitEvent:(id)a3 state:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 3uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
      v9 = objc_claimAutoreleasedReturnValue(+[MOFSM countryCodeFromAddress:](MOFSM, "countryCodeFromAddress:", v8));
      break;
    case 2uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
      v9 = objc_claimAutoreleasedReturnValue(+[MOFSM stateCodeFromAddress:](MOFSM, "stateCodeFromAddress:", v8));
      break;
    case 1uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
      v9 = objc_claimAutoreleasedReturnValue(+[MOFSM cityFromAddress:](MOFSM, "cityFromAddress:", v8));
      break;
    default:
      v10 = 0;
      goto LABEL_9;
  }
  v10 = (void *)v9;

LABEL_9:
  return v10;
}

- (id)destinationFromVisitEvent:(id)a3 state:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 3uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
      v9 = objc_claimAutoreleasedReturnValue(+[MOFSM countryFromAddress:](MOFSM, "countryFromAddress:", v8));
      break;
    case 2uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
      v9 = objc_claimAutoreleasedReturnValue(+[MOFSM stateFromAddress:](MOFSM, "stateFromAddress:", v8));
      break;
    case 1uLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routineEvent"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
      v9 = objc_claimAutoreleasedReturnValue(+[MOFSM cityFromAddress:](MOFSM, "cityFromAddress:", v8));
      break;
    default:
      v10 = 0;
      goto LABEL_9;
  }
  v10 = (void *)v9;

LABEL_9:
  return v10;
}

- (id)stringFromState:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1002AE388[a3 - 1];
}

+ (id)countryFromAddress:(id)a3
{
  return objc_msgSend(a3, "country");
}

+ (id)countryCodeFromAddress:(id)a3
{
  return objc_msgSend(a3, "countryCode");
}

+ (id)stateFromAddress:(id)a3
{
  return objc_msgSend(a3, "administrativeArea");
}

+ (id)stateCodeFromAddress:(id)a3
{
  return objc_msgSend(a3, "administrativeAreaCode");
}

+ (id)cityFromAddress:(id)a3
{
  return objc_msgSend(a3, "locality");
}

- (MOFSM)initWithFSMMO:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MOFSM *v13;
  void *v15;

  if (a3)
  {
    v4 = a3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v5 = objc_msgSend(v4, "mode");
    v6 = objc_msgSend(v4, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeRangeStartDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeRangeEndDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastProcessedDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaData"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v11));
    self = -[MOFSM initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:](self, "initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:", v15, v5, v6, v7, v8, v9, v10, v12);

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MOFSM)initWithName:(id)a3
{
  return -[MOFSM initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:](self, "initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:", a3, 0, 0, 0, 0, 0, 0, 0);
}

- (MOFSM)initWithName:(id)a3 mode:(unint64_t)a4 state:(unint64_t)a5 subState:(id)a6 timeRangeStartDate:(id)a7 timeRangeEndDate:(id)a8 lastProcessedDate:(id)a9 metaData:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  MOFSM *v19;
  NSString *v20;
  NSString *name;
  NSMutableDictionary *v22;
  NSMutableDictionary *metaData;
  id v26;
  id v27;
  objc_super v28;

  v15 = a3;
  v27 = a6;
  v26 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)MOFSM;
  v19 = -[MOFSM init](&v28, "init");
  if (v19)
  {
    v20 = (NSString *)objc_msgSend(v15, "copy");
    name = v19->_name;
    v19->_name = v20;

    v19->_mode = a4;
    v19->_state = a5;
    objc_storeStrong((id *)&v19->_substate, a6);
    objc_storeStrong((id *)&v19->_timeRangeStartDate, a7);
    objc_storeStrong((id *)&v19->_timeRangeEndDate, a8);
    objc_storeStrong((id *)&v19->_lastProcessedDate, a9);
    v22 = (NSMutableDictionary *)objc_msgSend(v18, "mutableCopy");
    metaData = v19->_metaData;
    v19->_metaData = v22;

  }
  return v19;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM name](self, "name"));
  v4 = -[MOFSM mode](self, "mode");
  v5 = -[MOFSM state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM substate](self, "substate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeStartDate](self, "timeRangeStartDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeEndDate](self, "timeRangeEndDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM lastProcessedDate](self, "lastProcessedDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOFSM name, %@, mode, %lu, state, %lu, substate, %@, startDate, %@, endDate, %@, lastProcessedDate, %@>"), v3, v4, v5, v6, v7, v8, v9));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_substate, CFSTR("substate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeRangeStartDate, CFSTR("timeRangeStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeRangeEndDate, CFSTR("timeRangeEndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastProcessedDate, CFSTR("lastProcessedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metaData, CFSTR("timeRangeMetaData"));

}

- (MOFSM)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  MOFSM *v25;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("substate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v13), CFSTR("timeRangeStartDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v16), CFSTR("timeRangeEndDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v19), CFSTR("lastProcessedDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDictionary, v22), CFSTR("timeRangeMetaData"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  v25 = -[MOFSM initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:](self, "initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:", v7, v8, v9, v12, v15, v18, v21, v24);
  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOFSM *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  MOFSM *v15;

  v5 = [MOFSM alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM name](self, "name"));
  v7 = -[MOFSM mode](self, "mode");
  v8 = -[MOFSM state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM substate](self, "substate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeStartDate](self, "timeRangeStartDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeEndDate](self, "timeRangeEndDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM lastProcessedDate](self, "lastProcessedDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM metaData](self, "metaData"));
  v14 = objc_msgSend(v13, "copyWithZone:", a3);
  v15 = -[MOFSM initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:](v5, "initWithName:mode:state:subState:timeRangeStartDate:timeRangeEndDate:lastProcessedDate:metaData:", v6, v7, v8, v9, v10, v11, v12, v14);

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)substate
{
  return self->_substate;
}

- (void)setSubstate:(id)a3
{
  objc_storeStrong((id *)&self->_substate, a3);
}

- (NSDate)timeRangeStartDate
{
  return self->_timeRangeStartDate;
}

- (void)setTimeRangeStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeRangeStartDate, a3);
}

- (NSDate)timeRangeEndDate
{
  return self->_timeRangeEndDate;
}

- (void)setTimeRangeEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeRangeEndDate, a3);
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessedDate, a3);
}

- (NSMutableDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_timeRangeEndDate, 0);
  objc_storeStrong((id *)&self->_timeRangeStartDate, 0);
  objc_storeStrong((id *)&self->_substate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
