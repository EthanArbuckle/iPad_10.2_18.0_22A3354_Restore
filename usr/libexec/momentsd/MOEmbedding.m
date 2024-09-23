@implementation MOEmbedding

- (MOEmbedding)initWithEventBundle:(id)a3 forEmbeddingType:(unint64_t)a4
{
  id v7;
  MOEmbedding *v8;
  uint64_t v9;
  NSUUID *bundleIdentifier;
  uint64_t v11;
  NSUUID *suggestionID;
  uint64_t v13;
  NSDictionary *activityContextEmbedding;
  uint64_t v15;
  NSDictionary *timeContextEmbedding;
  uint64_t v17;
  NSDictionary *locationContextEmbedding;
  uint64_t v19;
  NSDictionary *socialContextEmbedding;
  uint64_t v21;
  NSDictionary *extraContextEmbedding;
  void *v23;
  MOEmbedding *v24;
  id os_log;
  NSObject *v26;
  void *v27;
  objc_super v29;

  v7 = a3;
  if (v7)
  {
    v29.receiver = self;
    v29.super_class = (Class)MOEmbedding;
    v8 = -[MOEmbedding init](&v29, "init");
    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
      bundleIdentifier = v8->_bundleIdentifier;
      v8->_bundleIdentifier = (NSUUID *)v9;

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestionID"));
      suggestionID = v8->_suggestionID;
      v8->_suggestionID = (NSUUID *)v11;

      v8->_embeddingType = a4;
      v13 = objc_claimAutoreleasedReturnValue(-[MOEmbedding extractActivtyContextEmbedding:](v8, "extractActivtyContextEmbedding:", v7));
      activityContextEmbedding = v8->_activityContextEmbedding;
      v8->_activityContextEmbedding = (NSDictionary *)v13;

      v15 = objc_claimAutoreleasedReturnValue(-[MOEmbedding extractTimeContextEmbedding:](v8, "extractTimeContextEmbedding:", v7));
      timeContextEmbedding = v8->_timeContextEmbedding;
      v8->_timeContextEmbedding = (NSDictionary *)v15;

      v17 = objc_claimAutoreleasedReturnValue(-[MOEmbedding extractLocationContextEmbedding:](v8, "extractLocationContextEmbedding:", v7));
      locationContextEmbedding = v8->_locationContextEmbedding;
      v8->_locationContextEmbedding = (NSDictionary *)v17;

      v19 = objc_claimAutoreleasedReturnValue(-[MOEmbedding extractSocialContextEmbedding:](v8, "extractSocialContextEmbedding:", v7));
      socialContextEmbedding = v8->_socialContextEmbedding;
      v8->_socialContextEmbedding = (NSDictionary *)v19;

      v21 = objc_claimAutoreleasedReturnValue(-[MOEmbedding extractExtraContextEmbedding:](v8, "extractExtraContextEmbedding:", v7));
      extraContextEmbedding = v8->_extraContextEmbedding;
      v8->_extraContextEmbedding = (NSDictionary *)v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "photoTraits"));
      -[MOEmbedding extractContextsFromPhotoTraits:](v8, "extractContextsFromPhotoTraits:", v23);

    }
    self = v8;
    v24 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[MOEmbedding initWithEventBundle:forEmbeddingType:].cold.1();

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEmbedding.m"), 29, CFSTR("Invalid parameter not satisfying: eventBundle"));

    v24 = 0;
  }

  return v24;
}

- (id)extractActivtyContextEmbedding:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSuperTypeString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, CFSTR("topLevelActivityType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("secondLevelActivityType"));

  return v4;
}

- (id)extractTimeContextEmbedding:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t embeddingType;
  double v10;
  double v11;
  void *v12;
  __double2 v13;
  id v14;
  double v15;
  __double2 v16;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  __double2 v30;
  __double2 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id os_log;
  NSObject *v37;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localStartDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v8 = v7;
  embeddingType = self->_embeddingType;
  if (embeddingType == 2)
  {
    v30 = __sincos_stret((double)(uint64_t)objc_msgSend(v7, "component:fromDate:", 4096, v6) * 6.28318531 / 5.0);
    v31 = __sincos_stret((double)(uint64_t)objc_msgSend(v8, "component:fromDate:", 8, v6) * 6.28318531 / 12.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30.__cosval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v32, CFSTR("weekOfMonthCos"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v30.__sinval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v33, CFSTR("weekOfMonthSin"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31.__cosval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v34, CFSTR("monthCos"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31.__sinval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v35, CFSTR("monthSin"));

    v29 = v5;
  }
  else if (embeddingType == 1)
  {
    objc_msgSend(v4, "duration");
    v11 = v10 / 86400.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components:fromDate:", 96, v6));
    v13 = __sincos_stret(((double)(uint64_t)objc_msgSend(v12, "minute") / 60.0 + (double)(uint64_t)objc_msgSend(v12, "hour"))* 6.28318531/ 24.0);
    v14 = objc_msgSend(v8, "component:fromDate:", 512, v6);
    v15 = (double)(uint64_t)v14;
    v16 = __sincos_stret((double)(uint64_t)v14 * 6.28318531 / 7.0);
    v18 = v14 == (id)1 || v14 == (id)7;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, CFSTR("normalizedDuration"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13.__cosval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, CFSTR("timeOfDayCos"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13.__sinval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, CFSTR("timeOfDaySin"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16.__cosval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v22, CFSTR("dayOfWeekCos"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16.__sinval));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("dayOfWeekSin"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v18));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v24, CFSTR("isWeekend"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localStartDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localEndDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOTime simpleTimetagFromStartDate:endDate:](MOTime, "simpleTimetagFromStartDate:endDate:", v25, v26)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v27, CFSTR("timeTag"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v28, CFSTR("dayOfWeek"));

    v29 = v5;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    v37 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[MOEmbedding extractTimeContextEmbedding:].cold.1();

    v29 = 0;
  }

  return v29;
}

- (id)extractLocationContextEmbedding:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeName"));
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeName"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("placeName"));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enclosingArea"));
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "enclosingArea"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("enclosingAreaName"));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    v16 = objc_msgSend(v15, "placeType");
    if (v16 == (id)2
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place")),
          objc_msgSend(v12, "placeType") == (id)3))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "poiCategory"));
      v19 = objc_msgSend(v18, "length");

      if (v16 != (id)2)
      if (!v19)
      {
LABEL_13:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
        if (objc_msgSend(v20, "placeUserType"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          v22 = objc_msgSend(v21, "placeUserType");

          if (v22 == (id)100)
            goto LABEL_17;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventRoutine stringOfPlaceUserType:](MOEventRoutine, "stringOfPlaceUserType:", objc_msgSend(v20, "placeUserType")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v23, CFSTR("combinedPlaceType"));

        }
LABEL_17:
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "location"));
        objc_msgSend(v25, "latitude");
        if (v26 != 0.0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "location"));
          objc_msgSend(v28, "longitude");
          v30 = v29;

          if (v30 == 0.0)
          {
LABEL_21:
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
            objc_msgSend(v35, "familiarityIndexLOI");
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v36, CFSTR("placeFamiliarityIndexLOI"));

            goto LABEL_22;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "location"));
          objc_msgSend(v32, "latitude");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v33, CFSTR("placeLatitude"));

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "location"));
          objc_msgSend(v25, "longitude");
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v34, CFSTR("placeLongitude"));

        }
        goto LABEL_21;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "poiCategory"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("combinedPlaceType"));
    }

    goto LABEL_13;
  }
LABEL_22:

  return v4;
}

- (id)extractSocialContextEmbedding:(id)a3
{
  id v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSMutableSet *v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  id os_log;
  NSObject *v16;
  void *v17;
  void *v18;
  NSMutableSet *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v30;
  NSMutableSet *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "count");

  if (v5)
  {
    v31 = objc_opt_new(NSMutableSet);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v30 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v7)
    {
      v8 = v7;
      v35 = 0;
      v36 = 0;
      v33 = 0;
      v34 = 0;
      v32 = 0;
      v9 = *(_QWORD *)v38;
      v10 = v31;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));

          if (v13 && (objc_msgSend(v12, "isMePerson") & 1) == 0)
            -[NSMutableSet addObject:](v10, "addObject:", v12);
          v14 = +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:](MOClusteringUtility, "getTheBestPersonRelationtshipTagFor:", v12);
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
          v16 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mask"));
            *(_DWORD *)buf = 138412546;
            v42 = v18;
            v43 = 2048;
            v44 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Relationship Tag for person %@:%lu", buf, 0x16u);

            v10 = v31;
          }

          if (v14 <= 20)
          {
            if (v14 == 4)
            {
              ++v32;
            }
            else if (v14 == 15)
            {
              ++v35;
            }
          }
          else
          {
            switch(v14)
            {
              case 21:
                ++v34;
                break;
              case 22:
                ++v33;
                break;
              case 27:
                ++v36;
                break;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v8);
    }
    else
    {
      v35 = 0;
      v36 = 0;
      v33 = 0;
      v34 = 0;
      v32 = 0;
      v10 = v31;
    }

    v5 = objc_opt_new(NSMutableDictionary);
    v19 = v10;
    v20 = -[NSMutableSet copy](v10, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, CFSTR("persons"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NSMutableSet count](v19, "count") != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, CFSTR("withContact"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32 != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v22, CFSTR("withFamily"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v33 != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("withCoworker"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v34 != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v24, CFSTR("withFriend"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v35 != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v25, CFSTR("withChild"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v36 != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v26, CFSTR("withMyPet"));

    v27 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[MOEmbedding extractSocialContextEmbedding:].cold.1((uint64_t)v5, v28);

    v3 = v30;
  }

  return v5;
}

- (id)extractExtraContextEmbedding:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, CFSTR("bundleGoodnessScore"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      LODWORD(v14) = 0;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v11);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "type") == (id)2)
            v14 = (v14 + 1);
          else
            v14 = v14;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("photoCount"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &off_1002D98A8, CFSTR("photoCount"));
  }

  return v4;
}

- (void)extractContextsFromPhotoTraits:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  NSObject *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  id v104;
  void *v105;
  MOEmbedding *v106;
  NSMutableDictionary *v107;
  NSMutableDictionary *v108;
  NSMutableDictionary *v109;
  NSMutableDictionary *v110;
  NSMutableDictionary *v111;
  id obj;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  id v120;
  uint8_t v121[4];
  uint64_t v122;
  _BYTE v123[128];

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MOEmbedding extractContextsFromPhotoTraits:].cold.7(v4, v6);

  if (objc_msgSend(v4, "count"))
  {
    v106 = self;
    v111 = objc_opt_new(NSMutableDictionary);
    v110 = objc_opt_new(NSMutableDictionary);
    v108 = objc_opt_new(NSMutableDictionary);
    v109 = objc_opt_new(NSMutableDictionary);
    v107 = objc_opt_new(NSMutableDictionary);
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v114;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v114 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          v13 = objc_msgSend(v12, "length");

          if (v13)
          {
            v14 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              -[MOEmbedding extractContextsFromPhotoTraits:].cold.6(v121, v11, &v122, v15);

            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lowercaseString"));
            v18 = objc_msgSend(&off_1002DC680, "containsObject:", v17);

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lowercaseString"));
              v21 = objc_msgSend(&off_1002DC680, "indexOfObject:", v20);

              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lowercaseString"));
              -[NSMutableDictionary setObject:forKey:](v111, "setObject:forKey:", v22, v24);

              v25 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              v26 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
                *(_DWORD *)buf = 138412546;
                v118 = v71;
                v119 = 2048;
                v120 = v21;
                _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Photo trait was found from activity type list: traitName=%@, rankFromList=%lu", buf, 0x16u);

              }
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lowercaseString"));
            v29 = objc_msgSend(&off_1002DC6B0, "containsObject:", v28);

            if (v29)
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lowercaseString"));
              v32 = objc_msgSend(&off_1002DC6B0, "indexOfObject:", v31);

              v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v32));
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lowercaseString"));
              -[NSMutableDictionary setObject:forKey:](v110, "setObject:forKey:", v33, v35);

              v36 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              v37 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
                *(_DWORD *)buf = 138412546;
                v118 = v72;
                v119 = 2048;
                v120 = v32;
                _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Photo trait was found from time context list:traitName=%@, rankFromList=%lu", buf, 0x16u);

              }
            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "lowercaseString"));
            v40 = objc_msgSend(&off_1002DC698, "containsObject:", v39);

            if (v40)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "lowercaseString"));
              v43 = objc_msgSend(&off_1002DC698, "indexOfObject:", v42);

              v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v43));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lowercaseString"));
              -[NSMutableDictionary setObject:forKey:](v108, "setObject:forKey:", v44, v46);

              v47 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              v48 = objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
                *(_DWORD *)buf = 138412546;
                v118 = v73;
                v119 = 2048;
                v120 = v43;
                _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Photo trait was found from place type list:traitName=%@, rankFromList=%lu", buf, 0x16u);

              }
            }
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "lowercaseString"));
            v51 = objc_msgSend(&off_1002DC6C8, "containsObject:", v50);

            if (v51)
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lowercaseString"));
              v54 = objc_msgSend(&off_1002DC6C8, "indexOfObject:", v53);

              v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v54));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lowercaseString"));
              -[NSMutableDictionary setObject:forKey:](v109, "setObject:forKey:", v55, v57);

              v58 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              v59 = objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
                *(_DWORD *)buf = 138412546;
                v118 = v74;
                v119 = 2048;
                v120 = v54;
                _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "Photo trait was found from social event list:traitName=%@, rankFromList=%lu", buf, 0x16u);

              }
            }
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "lowercaseString"));
            v62 = objc_msgSend(&__NSArray0__struct, "containsObject:", v61);

            if (v62)
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "lowercaseString"));
              v65 = objc_msgSend(&__NSArray0__struct, "indexOfObject:", v64);

              v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v65));
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "lowercaseString"));
              -[NSMutableDictionary setObject:forKey:](v107, "setObject:forKey:", v66, v68);

              v69 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              v70 = objc_claimAutoreleasedReturnValue(v69);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
                *(_DWORD *)buf = 138412546;
                v118 = v75;
                v119 = 2048;
                v120 = v65;
                _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Photo trait was found from other subject list:traitName=%@, rankFromList=%lu", buf, 0x16u);

              }
            }
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
      }
      while (v8);
    }

    if (-[NSMutableDictionary count](v111, "count"))
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v111, "keysSortedByValueUsingComparator:", &__block_literal_global_30));
      v77 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        -[MOEmbedding extractContextsFromPhotoTraits:].cold.5();

      v79 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding activityContextEmbedding](v106, "activityContextEmbedding"));
      v80 = objc_msgSend(v79, "mutableCopy");

      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectAtIndex:", 0));
      objc_msgSend(v80, "setObject:forKeyedSubscript:", v81, CFSTR("activityTypeFromPhotoTraits"));

      -[MOEmbedding setActivityContextEmbedding:](v106, "setActivityContextEmbedding:", v80);
    }
    if (-[NSMutableDictionary count](v110, "count"))
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v110, "keysSortedByValueUsingComparator:", &__block_literal_global_85));
      v83 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      v84 = objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        -[MOEmbedding extractContextsFromPhotoTraits:].cold.4();

      v85 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](v106, "timeContextEmbedding"));
      v86 = objc_msgSend(v85, "mutableCopy");

      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectAtIndex:", 0));
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v87, CFSTR("timeContextFromPhotoTraits"));

      -[MOEmbedding setTimeContextEmbedding:](v106, "setTimeContextEmbedding:", v86);
    }
    if (-[NSMutableDictionary count](v108, "count"))
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v108, "keysSortedByValueUsingComparator:", &__block_literal_global_87));
      v89 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      v90 = objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        -[MOEmbedding extractContextsFromPhotoTraits:].cold.3();

      v91 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](v106, "locationContextEmbedding"));
      v92 = objc_msgSend(v91, "mutableCopy");

      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectAtIndex:", 0));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v108, "setObject:forKeyedSubscript:", v93, CFSTR("placeTypeFromPhotoTraits"));

      -[MOEmbedding setLocationContextEmbedding:](v106, "setLocationContextEmbedding:", v92);
    }
    if (-[NSMutableDictionary count](v109, "count"))
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v109, "keysSortedByValueUsingComparator:", &__block_literal_global_89));
      v95 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      v96 = objc_claimAutoreleasedReturnValue(v95);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
        -[MOEmbedding extractContextsFromPhotoTraits:].cold.2();

      v97 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](v106, "socialContextEmbedding"));
      v98 = objc_msgSend(v97, "mutableCopy");

      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "objectAtIndex:", 0));
      objc_msgSend(v98, "setObject:forKeyedSubscript:", v99, CFSTR("socialEventFromPhotoTraits"));

      -[MOEmbedding setSocialContextEmbedding:](v106, "setSocialContextEmbedding:", v98);
    }
    if (-[NSMutableDictionary count](v107, "count"))
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v107, "keysSortedByValueUsingComparator:", &__block_literal_global_91_0));
      v101 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      v102 = objc_claimAutoreleasedReturnValue(v101);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
        -[MOEmbedding extractContextsFromPhotoTraits:].cold.1();

      v103 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding extraContextEmbedding](v106, "extraContextEmbedding"));
      v104 = objc_msgSend(v103, "mutableCopy");

      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectAtIndex:", 0));
      objc_msgSend(v104, "setObject:forKeyedSubscript:", v105, CFSTR("otherSubjectFromPhotoTraits"));

      -[MOEmbedding setExtraContextEmbedding:](v106, "setExtraContextEmbedding:", v104);
    }

  }
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "compare:", a3);
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_84(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "compare:", a3);
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_86(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "compare:", a3);
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_88(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "compare:", a3);
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_90(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "compare:", a3);
}

- (double)getDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  SEL v55;
  double v56;
  double v57;
  uint8_t buf[4];
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  double v69;

  v7 = a3;
  v8 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[MOEmbedding getDistanceFrom:withWeights:].cold.3(self, v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding bundleIdentifier](self, "bundleIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  if (objc_msgSend(v11, "isEqual:", v12))
  {

    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding suggestionID](self, "suggestionID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestionID"));
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
LABEL_6:
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = 0.0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[MOEmbedding getDistanceFrom:withWeights:].cold.1();
    goto LABEL_26;
  }
  v55 = a2;
  -[MOEmbedding getActivityContextDistanceFrom:withWeights:](self, "getActivityContextDistanceFrom:withWeights:", v7, v8);
  v20 = v19;
  -[MOEmbedding getTimeContextDistanceFrom:withWeights:](self, "getTimeContextDistanceFrom:withWeights:", v7, v8);
  v22 = v21;
  -[MOEmbedding getLocationContextDistanceFrom:withWeights:](self, "getLocationContextDistanceFrom:withWeights:", v7, v8);
  v24 = v23;
  -[MOEmbedding getSocialContextDistanceFrom:withWeights:](self, "getSocialContextDistanceFrom:withWeights:", v7, v8);
  v57 = v25;
  -[MOEmbedding getExtraContextDistanceFrom:withWeights:](self, "getExtraContextDistanceFrom:withWeights:", v7, v8);
  v56 = v26;
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_activityContext")));
  if (!v27)
  {
    v30 = 0.2;
    goto LABEL_15;
  }
  v28 = (void *)v27;
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_timeContext")));
  v30 = 0.2;
  if (!v29)
  {
LABEL_18:
    v41 = 0.2;
    v44 = 0.2;
    v47 = 0.2;
    v49 = 0.2;
    goto LABEL_19;
  }
  v31 = (void *)v29;
  v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_locationContext")));
  if (!v32)
  {
LABEL_17:

    goto LABEL_18;
  }
  v33 = (void *)v32;
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:"));
  if (!v34)
  {

    goto LABEL_17;
  }
  v35 = (void *)v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:"));

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_activityContext")));
    objc_msgSend(v37, "doubleValue");
    v30 = v38;

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_timeContext")));
    objc_msgSend(v39, "doubleValue");
    v41 = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_locationContext")));
    objc_msgSend(v42, "doubleValue");
    v44 = v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_socialContext")));
    objc_msgSend(v45, "doubleValue");
    v47 = v46;

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_extraContext")));
    objc_msgSend(v28, "doubleValue");
    v49 = v48;
LABEL_19:

    goto LABEL_20;
  }
  v30 = 0.2;
LABEL_15:
  v41 = 0.2;
  v44 = 0.2;
  v47 = 0.2;
  v49 = 0.2;
LABEL_20:
  if (fabs(v30 + v41 + v44 + v47 + v49 + -1.0) >= 0.00001)
  {
    v50 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      -[MOEmbedding getDistanceFrom:withWeights:].cold.2();

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", v55, self, CFSTR("MOEmbedding.m"), 356, CFSTR("Sum of full distance weight is not 1, sum=%.3f (in %s:%d)"), v30 + v41 + v44 + v47 + v49, "-[MOEmbedding getDistanceFrom:withWeights:]", 356);

  }
  v18 = v22 * v41 + v30 * v20 + v44 * v24 + v47 * v57 + v49 * v56;
  v53 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  v17 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219264;
    v59 = v18;
    v60 = 2048;
    v61 = v20;
    v62 = 2048;
    v63 = v22;
    v64 = 2048;
    v65 = v24;
    v66 = 2048;
    v67 = v57;
    v68 = 2048;
    v69 = v56;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Full distance=%.3f (activity=%.3f,time=%.3f,location=%.3f,social=%.3f, extra=%.3f)", buf, 0x3Eu);
  }
LABEL_26:

  return v18;
}

- (double)getActivityContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id os_log;
  NSObject *v42;
  void *v43;
  double v44;
  id v45;
  NSObject *v46;
  MOEmbedding *v48;
  uint8_t buf[4];
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding activityContextEmbedding](self, "activityContextEmbedding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityContextEmbedding"));

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
  v11 = 1.0;
  v12 = 1.0;
  if (v10)
  {
    v13 = (void *)v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
      if (objc_msgSend(v15, "isEqualToString:", v16))
        v12 = 0.0;
      else
        v12 = 1.0;

    }
  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));
  if (v17)
  {
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));
      if (objc_msgSend(v20, "isEqualToString:", v21))
        v11 = 0.0;
      else
        v11 = 1.0;

    }
  }
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activityTypeFromPhotoTraits")));
  v23 = 1.0;
  if (v22)
  {
    v24 = (void *)v22;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("activityTypeFromPhotoTraits")));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activityTypeFromPhotoTraits")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("activityTypeFromPhotoTraits")));
      if (objc_msgSend(v26, "isEqualToString:", v27))
        v23 = 0.0;
      else
        v23 = 1.0;

    }
  }
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_topLevelActivityType")));
  if (!v28)
  {
    v35 = 0.333333343;
    v38 = 0.333333343;
    v40 = 0.333333343;
    goto LABEL_27;
  }
  v29 = (void *)v28;
  v48 = self;
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_secondLevelActivityType")));
  if (!v30)
  {
    v35 = 0.333333343;
    v38 = 0.333333343;
    v40 = 0.333333343;
    goto LABEL_25;
  }
  v31 = (void *)v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_activityTypeFromPhotoTraits")));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_topLevelActivityType")));
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_secondLevelActivityType")));
    objc_msgSend(v36, "doubleValue");
    v38 = v37;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_activityTypeFromPhotoTraits")));
    objc_msgSend(v29, "doubleValue");
    v40 = v39;
LABEL_25:
    self = v48;

    goto LABEL_27;
  }
  v35 = 0.333333343;
  v38 = 0.333333343;
  v40 = 0.333333343;
  self = v48;
LABEL_27:
  if (fabs(v35 + v38 + v40 + -1.0) >= 0.00001)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[MOEmbedding getActivityContextDistanceFrom:withWeights:].cold.1();

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEmbedding.m"), 392, CFSTR("Sum of activity context distance weight is not 1, sum=%.3f (in %s:%d)"), v35 + v38 + v40, "-[MOEmbedding getActivityContextDistanceFrom:withWeights:]", 392);

  }
  v44 = v11 * v38 + v35 * v12 + v40 * v23;
  v45 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v51 = v44;
    v52 = 2048;
    v53 = v12;
    v54 = 2048;
    v55 = v11;
    v56 = 2048;
    v57 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Activity context distance=%.3f (topLevelActivityTypeDist=%.3f,secondLevelActivityTypeDist=%.3f,activityFromPhotoTraits=%.3f)", buf, 0x2Au);
  }

  return v44;
}

- (double)getTimeContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t embeddingType;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  long double v29;
  long double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  double v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  id os_log;
  NSObject *v81;
  double v82;
  double v83;
  double v84;
  id v85;
  NSObject *v86;
  void *v87;
  id v88;
  void *v90;
  const char *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint8_t buf[4];
  double v99;
  __int16 v100;
  double v101;
  __int16 v102;
  double v103;
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeContextEmbedding"));

  embeddingType = self->_embeddingType;
  if (embeddingType == 2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    v81 = objc_claimAutoreleasedReturnValue(os_log);
    v12 = 0.0;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[MOEmbedding getTimeContextDistanceFrom:withWeights:].cold.2();
    goto LABEL_41;
  }
  v12 = 0.0;
  if (embeddingType == 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("normalizedDuration")));
    objc_msgSend(v13, "doubleValue");
    v96 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("normalizedDuration")));
    objc_msgSend(v15, "doubleValue");
    v95 = v16;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeOfDayCos")));
    objc_msgSend(v17, "doubleValue");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timeOfDayCos")));
    objc_msgSend(v20, "doubleValue");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeOfDaySin")));
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timeOfDaySin")));
    objc_msgSend(v26, "doubleValue");
    v28 = v25 * v27 + v19 * v22;

    v29 = 1.0;
    v30 = 1.0;
    if (v28 <= 1.0)
    {
      v30 = v28;
      if (v28 < -1.0)
        v30 = -1.0;
    }
    v31 = acos(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayOfWeekCos")));
    objc_msgSend(v32, "doubleValue");
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dayOfWeekCos")));
    objc_msgSend(v35, "doubleValue");
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dayOfWeekSin")));
    objc_msgSend(v38, "doubleValue");
    v40 = v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dayOfWeekSin")));
    objc_msgSend(v41, "doubleValue");
    v43 = v40 * v42 + v34 * v37;

    if (v43 <= 1.0)
    {
      v29 = v43;
      if (v43 < -1.0)
        v29 = -1.0;
    }
    v92 = acos(v29);
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isWeekend")));
    v45 = 1.0;
    v46 = 1.0;
    if (v44)
    {
      v47 = (void *)v44;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isWeekend")));

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isWeekend")));
        v50 = objc_msgSend(v49, "BOOLValue");
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isWeekend")));
        if (v50 != objc_msgSend(v51, "BOOLValue"))
          v46 = 1.0;
        else
          v46 = 0.0;

      }
    }
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));
    if (v52)
    {
      v53 = (void *)v52;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));

      if (v54)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));
        if (objc_msgSend(v55, "isEqualToString:", v56))
          v45 = 0.0;
        else
          v45 = 1.0;

      }
    }
    v93 = v46;
    v94 = v45;
    v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_normalizedDuration")));
    if (!v57)
    {
      v60 = 0.2;
      v82 = 0.2;
      v74 = 0.2;
      v77 = 0.2;
      v79 = 0.2;
LABEL_35:
      v83 = vabdd_f64(v96, v95);
      v84 = v60 + v82 + v74 + v77 + v79;
      if (fabs(v84 + -1.0) >= 0.00001)
      {
        v97 = v82;
        v85 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v86 = objc_claimAutoreleasedReturnValue(v85);
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          -[MOEmbedding getTimeContextDistanceFrom:withWeights:].cold.1();

        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEmbedding.m"), 456, CFSTR("Sum of time context distance weight is not 1, sum=%.3f (in %s:%d)"), *(_QWORD *)&v84, "-[MOEmbedding getTimeContextDistanceFrom:withWeights:]", 456);

        v82 = v97;
      }
      v12 = v31 / 3.14159265 * v82 + v60 * v83 + v74 * (v92 / 3.14159265) + v77 * v93 + v79 * v94;
      v88 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      v81 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219264;
        v99 = v12;
        v100 = 2048;
        v101 = v83;
        v102 = 2048;
        v103 = v31 / 3.14159265;
        v104 = 2048;
        v105 = v92 / 3.14159265;
        v106 = 2048;
        v107 = v93;
        v108 = 2048;
        v109 = v94;
        _os_log_debug_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "Time context distance=%.3f (durationNormDist=%.3f,timeOfDayDist=%.3f,dayOfWeekDist=%.3f,isWeekendDist=%.3f, timeContextFromPhotoTraits=%.3f)", buf, 0x3Eu);
      }
LABEL_41:

      goto LABEL_42;
    }
    v58 = (void *)v57;
    v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_timeOfDay")));
    v60 = 0.2;
    if (v59)
    {
      v61 = (void *)v59;
      v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:"));
      if (v62)
      {
        v63 = (void *)v62;
        v91 = a2;
        v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:"));
        if (v64)
        {
          v65 = (void *)v64;
          v90 = v7;
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:"));

          if (!v66)
          {
            v60 = 0.2;
            v82 = 0.2;
            v74 = 0.2;
            v77 = 0.2;
            v79 = 0.2;
            a2 = v91;
            v7 = v90;
            goto LABEL_35;
          }
          v7 = v90;
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_normalizedDuration")));
          objc_msgSend(v67, "doubleValue");
          v60 = v68;

          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_timeOfDay")));
          objc_msgSend(v69, "doubleValue");
          v71 = v70;

          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_dayOfWeek")));
          objc_msgSend(v72, "doubleValue");
          v74 = v73;

          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_isWeekend")));
          objc_msgSend(v75, "doubleValue");
          v77 = v76;

          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_timeContextFromPhotoTrait")));
          objc_msgSend(v58, "doubleValue");
          v79 = v78;
        }
        else
        {

          *(double *)&v71 = 0.2;
          v74 = 0.2;
          v77 = 0.2;
          v79 = 0.2;
        }
        a2 = v91;
        goto LABEL_34;
      }

    }
    *(double *)&v71 = 0.2;
    v74 = 0.2;
    v77 = 0.2;
    v79 = 0.2;
LABEL_34:

    v82 = *(double *)&v71;
    goto LABEL_35;
  }
LABEL_42:

  return v12;
}

- (double)getLocationContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  double v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id os_log;
  NSObject *v69;
  void *v70;
  double v71;
  id v72;
  NSObject *v73;
  MOEmbedding *v76;
  double v77;
  uint8_t buf[4];
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;

  v6 = a4;
  v7 = a3;
  v76 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locationContextEmbedding"));

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeName")));
  v11 = 1.0;
  v12 = 1.0;
  if (v10)
  {
    v13 = (void *)v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeName")));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeName")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeName")));
      if (objc_msgSend(v15, "isEqualToString:", v16))
        v12 = 0.0;
      else
        v12 = 1.0;

    }
  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
  if (v17)
  {
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
      if (objc_msgSend(v20, "isEqualToString:", v21))
        v11 = 0.0;
      else
        v11 = 1.0;

    }
  }
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));
  v23 = 1.0;
  v24 = 1.0;
  if (v22)
  {
    v25 = (void *)v22;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));
      if (objc_msgSend(v27, "isEqualToString:", v28))
        v24 = 0.0;
      else
        v24 = 1.0;

    }
  }
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeLatitude")));
  v77 = v12;
  if (v29)
  {
    v30 = (void *)v29;
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeLongitude")));
    if (v31)
    {
      v32 = (void *)v31;
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeLatitude")));
      if (v33)
      {
        v34 = (void *)v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeLongitude")));

        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeLatitude")));
          objc_msgSend(v36, "doubleValue");
          v38 = v37;

          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("placeLongitude")));
          objc_msgSend(v39, "doubleValue");
          v41 = v40;

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeLatitude")));
          objc_msgSend(v42, "doubleValue");
          v44 = v43;

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("placeLongitude")));
          objc_msgSend(v45, "doubleValue");
          v47 = v46;

          +[RTLocation distanceFromlat1:lon1:tolat2:lon2:](RTLocation, "distanceFromlat1:lon1:tolat2:lon2:", v38, v41, v44, v47);
          v49 = v48 * 0.00062137;
          if (v49 >= 200.0)
            v23 = 1.0;
          else
            v23 = v49 / 200.0;
        }
        goto LABEL_28;
      }

    }
  }
LABEL_28:
  v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_placeName")));
  if (!v50)
  {
    v53 = 0.25;
    goto LABEL_34;
  }
  v51 = (void *)v50;
  v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_placeType")));
  v53 = 0.25;
  if (!v52)
  {
LABEL_36:
    v62 = 0.25;
    v65 = 0.25;
    v67 = 0.25;
    goto LABEL_37;
  }
  v54 = (void *)v52;
  v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_geoProximity")));
  if (!v55)
  {

    goto LABEL_36;
  }
  v56 = (void *)v55;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:"));

  if (!v57)
  {
LABEL_34:
    v62 = 0.25;
    v65 = 0.25;
    v67 = 0.25;
    goto LABEL_38;
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_placeName")));
  objc_msgSend(v58, "doubleValue");
  v53 = v59;

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_placeType")));
  objc_msgSend(v60, "doubleValue");
  v62 = v61;

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_geoProximity")));
  objc_msgSend(v63, "doubleValue");
  v65 = v64;

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_placeTypeFromPhotoTraits")));
  objc_msgSend(v51, "doubleValue");
  v67 = v66;
LABEL_37:

LABEL_38:
  if (fabs(v53 + v62 + v65 + v67 + -1.0) >= 0.00001)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v69 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      -[MOEmbedding getLocationContextDistanceFrom:withWeights:].cold.1();

    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, v76, CFSTR("MOEmbedding.m"), 508, CFSTR("Sum of location context distance weight is not 1, sum=%.3f (in %s:%d)"), v53 + v62 + v65 + v67, "-[MOEmbedding getLocationContextDistanceFrom:withWeights:]", 508);

  }
  v71 = v11 * v62 + v53 * v77 + v65 * v23 + v67 * v24;
  v72 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  v73 = objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    v79 = v71;
    v80 = 2048;
    v81 = v77;
    v82 = 2048;
    v83 = v11;
    v84 = 2048;
    v85 = v23;
    v86 = 2048;
    v87 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "Location context distance=%.3f (placeNameDist=%.3f,combinedPlaceTypeDist=%.3f,geoProxDist=%.3f,placeTypeFromPhotoTraits=%.3f)", buf, 0x34u);
  }

  return v71;
}

- (double)getSocialContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  uint64_t v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  id os_log;
  NSObject *v110;
  void *v111;
  double v112;
  id v113;
  NSObject *v114;
  double v115;
  id v116;
  NSObject *v117;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  uint8_t buf[4];
  double v134;
  __int16 v135;
  double v136;
  __int16 v137;
  double v138;
  __int16 v139;
  double v140;
  __int16 v141;
  double v142;
  __int16 v143;
  double v144;
  __int16 v145;
  double v146;
  __int16 v147;
  double v148;
  __int16 v149;
  double v150;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "socialContextEmbedding"));

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("persons")));
  v12 = 1.0;
  v13 = 1.0;
  if (v11)
  {
    v14 = (void *)v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("persons")));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("persons")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForKey:", CFSTR("name")));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("persons")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("name")));

      if (objc_msgSend(v17, "count") && objc_msgSend(v19, "count"))
      {
        v20 = objc_msgSend(v17, "mutableCopy");
        v21 = objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v20, "intersectSet:", v19);
        objc_msgSend(v21, "unionSet:", v19);
        v22 = (double)(unint64_t)objc_msgSend(v20, "count");
        v13 = 1.0 - v22 / (double)(unint64_t)objc_msgSend(v21, "count");

      }
    }
  }
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withContact")));
  if (v23)
  {
    v24 = (void *)v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withContact")));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withContact")));
      v27 = objc_msgSend(v26, "BOOLValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withContact")));
      if (v27 != objc_msgSend(v28, "BOOLValue"))
        v12 = 1.0;
      else
        v12 = 0.0;

    }
  }
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withFamily")));
  v30 = 1.0;
  v31 = 1.0;
  if (v29)
  {
    v32 = (void *)v29;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withFamily")));

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withFamily")));
      v35 = objc_msgSend(v34, "BOOLValue");
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withFamily")));
      if (v35 != objc_msgSend(v36, "BOOLValue"))
        v31 = 1.0;
      else
        v31 = 0.0;

    }
  }
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withCoworker")));
  if (v37)
  {
    v38 = (void *)v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withCoworker")));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withCoworker")));
      v41 = objc_msgSend(v40, "BOOLValue");
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withCoworker")));
      if (v41 != objc_msgSend(v42, "BOOLValue"))
        v30 = 1.0;
      else
        v30 = 0.0;

    }
  }
  v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withFriend")));
  v44 = 1.0;
  v45 = 1.0;
  if (v43)
  {
    v46 = (void *)v43;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withFriend")));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withFriend")));
      v49 = objc_msgSend(v48, "BOOLValue");
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withFriend")));
      if (v49 != objc_msgSend(v50, "BOOLValue"))
        v45 = 1.0;
      else
        v45 = 0.0;

    }
  }
  v127 = v45;
  v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withChild")));
  if (v51)
  {
    v52 = (void *)v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withChild")));

    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withChild")));
      v55 = objc_msgSend(v54, "BOOLValue");
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withChild")));
      if (v55 != objc_msgSend(v56, "BOOLValue"))
        v44 = 1.0;
      else
        v44 = 0.0;

    }
  }
  v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withMyPet")));
  v58 = 1.0;
  v59 = 1.0;
  if (v57)
  {
    v60 = (void *)v57;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withMyPet")));

    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("withMyPet")));
      v63 = objc_msgSend(v62, "BOOLValue");
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("withMyPet")));
      if (v63 != objc_msgSend(v64, "BOOLValue"))
        v59 = 1.0;
      else
        v59 = 0.0;

    }
  }
  v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));
  if (v65)
  {
    v66 = (void *)v65;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));

    if (v67)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));
      if (objc_msgSend(v68, "isEqualToString:", v69))
        v58 = 0.0;
      else
        v58 = 1.0;

    }
  }
  v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_contactNames")));
  v129 = v30;
  v130 = v12;
  v131 = v31;
  v132 = v13;
  v128 = v44;
  v125 = v59;
  v126 = v58;
  if (!v70)
  {
    v105 = 0.125;
    v104 = 0.125;
    v87 = 0.125;
    v90 = 0.125;
    v106 = 0.125;
    v96 = 0.125;
    v99 = 0.125;
    v102 = 0.125;
    goto LABEL_66;
  }
  v71 = (void *)v70;
  v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_IsWithContact")));
  v122 = 0.125;
  if (!v72)
  {
    v104 = 0.125;
    v87 = 0.125;
    v90 = 0.125;
    v93 = 0.125;
    v96 = 0.125;
    v99 = 0.125;
    v102 = 0.125;
    goto LABEL_65;
  }
  v73 = (void *)v72;
  v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_isWithFamily")));
  if (!v74)
  {

    v104 = 0.125;
    v87 = 0.125;
    v90 = 0.125;
    v93 = 0.125;
    v96 = 0.125;
    v99 = 0.125;
    v102 = 0.125;
    goto LABEL_65;
  }
  v75 = (void *)v74;
  v76 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:"));
  v77 = v7;
  if (!v76)
  {

    v104 = 0.125;
    v87 = 0.125;
    v90 = 0.125;
    v93 = 0.125;
    v96 = 0.125;
    v99 = 0.125;
    v102 = 0.125;
    goto LABEL_65;
  }
  v78 = (void *)v76;
  v121 = v77;
  v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKeyedSubscript:"));
  if (!v79)
  {
LABEL_64:

    v104 = 0.125;
    v87 = 0.125;
    v90 = 0.125;
    v93 = 0.125;
    v96 = 0.125;
    v99 = 0.125;
    v102 = 0.125;
    v7 = v121;
    goto LABEL_65;
  }
  v80 = (void *)v79;
  v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:"));
  if (!v81)
  {
LABEL_63:

    goto LABEL_64;
  }
  v120 = (void *)v81;
  v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:"));
  if (!v82)
  {

    goto LABEL_63;
  }
  v119 = (void *)v82;
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:"));

  if (v123)
  {
    v7 = v121;
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_contactNames")));
    objc_msgSend(v83, "doubleValue");
    v122 = v84;

    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_isWithFamily")));
    objc_msgSend(v85, "doubleValue");
    v87 = v86;

    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_isWithCoworker")));
    objc_msgSend(v88, "doubleValue");
    v90 = v89;

    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_isWithFriend")));
    objc_msgSend(v91, "doubleValue");
    v93 = v92;

    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_isWithChild")));
    objc_msgSend(v94, "doubleValue");
    v96 = v95;

    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_isWithMyPet")));
    objc_msgSend(v97, "doubleValue");
    v99 = v98;

    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_SocialEventFromPhotoTraits ")));
    objc_msgSend(v100, "doubleValue");
    v102 = v101;

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("embeddingDistWeight_IsWithContact")));
    objc_msgSend(v71, "doubleValue");
    v104 = v103;
LABEL_65:

    v105 = v122;
    v106 = v93;
    goto LABEL_66;
  }
  v105 = 0.125;
  v104 = 0.125;
  v87 = 0.125;
  v90 = 0.125;
  v106 = 0.125;
  v96 = 0.125;
  v99 = 0.125;
  v102 = 0.125;
  v7 = v121;
LABEL_66:
  v107 = v87;
  v108 = v105 + v104 + v87 + v90 + v106 + v96 + v99 + v102;
  if (fabs(v108 + -1.0) >= 0.00001)
  {
    v124 = v106;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v110 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      -[MOEmbedding getSocialContextDistanceFrom:withWeights:].cold.2();

    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v111, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEmbedding.m"), 579, CFSTR("Sum of social context distance weight is not 1, sum=%.3f (in %s:%d)"), *(_QWORD *)&v108, "-[MOEmbedding getSocialContextDistanceFrom:withWeights:]", 579);

    v106 = v124;
  }
  v112 = v130 * v104 + v105 * v132 + v107 * v131 + v90 * v129 + v106 * v127 + v96 * v128 + v99 * v125;
  v113 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  v114 = objc_claimAutoreleasedReturnValue(v113);
  if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
    -[MOEmbedding getSocialContextDistanceFrom:withWeights:].cold.1((uint64_t)v9, (uint64_t)v10, v114);
  v115 = v112 + v102 * v126;

  v116 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  v117 = objc_claimAutoreleasedReturnValue(v116);
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134220032;
    v134 = v115;
    v135 = 2048;
    v136 = v132;
    v137 = 2048;
    v138 = v130;
    v139 = 2048;
    v140 = v131;
    v141 = 2048;
    v142 = v129;
    v143 = 2048;
    v144 = v127;
    v145 = 2048;
    v146 = v128;
    v147 = 2048;
    v148 = v125;
    v149 = 2048;
    v150 = v126;
    _os_log_debug_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEBUG, "Social context distance=%.3f (contactNames=%.3f,isWithContact=%.3f,isWithFamily=%.3f,isWithCoworker=%.3f,isWithFriend=%.3f,isWithChild=%.3f,isWithMyPet=%.3f,socialEventFromPhotoTraits=%.3f)", buf, 0x5Cu);
  }

  return v115;
}

- (double)getExtraContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding extraContextEmbedding](self, "extraContextEmbedding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extraContextEmbedding"));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherSubjectFromPhotoTraits")));
  v9 = 1.0;
  if (v8)
  {
    v10 = (void *)v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("otherSubjectFromPhotoTraits")));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("otherSubjectFromPhotoTraits")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("otherSubjectFromPhotoTraits")));
      if (objc_msgSend(v12, "isEqualToString:", v13))
        v9 = 0.0;
      else
        v9 = 1.0;

    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding bundleIdentifier](self, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding suggestionID](self, "suggestionID"));
  v5 = -[MOEmbedding embeddingType](self, "embeddingType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding activityContextEmbedding](self, "activityContextEmbedding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding extraContextEmbedding](self, "extraContextEmbedding"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOEmbedding bundleID:%@, suggestionID:%@, embeddingType:%lu, activityContextEmbedding:%@, timeContextEmbedding:%@, locationContextEmbedding:%@, socialContextEmbedding:%@, extraContextEmbedding:%@>"), v3, v4, v5, v6, v7, v8, v9, v10));

  return v11;
}

- (id)summaryDictionary
{
  NSMutableDictionary *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding bundleIdentifier](self, "bundleIdentifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("bundleID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding suggestionID](self, "suggestionID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("suggestionID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding activityContextEmbedding](self, "activityContextEmbedding"));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("normalizedDuration")));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("normalizedDuration")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, CFSTR("normalizedDuration"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("timeTag")));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("timeTag")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, CFSTR("timeTag"));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding dayOfWeekString:](self, "dayOfWeekString:", (int)objc_msgSend(v18, "intValue")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, CFSTR("dayOfWeek"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("isWeekend")));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isWeekend")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v23, CFSTR("isWeekend"));

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding timeContextEmbedding](self, "timeContextEmbedding"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v27, CFSTR("timeContextFromPhotoTraits"));

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("placeName")));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("placeName")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v31, CFSTR("placeName"));

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v35, CFSTR("combinedPlaceType"));

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("enclosingAreaName")));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("enclosingAreaName")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v39, CFSTR("enclosingAreaName"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v43, CFSTR("placeTypeFromPhotoTraits"));

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("placeFamiliarityIndexLOI")));

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding locationContextEmbedding](self, "locationContextEmbedding"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("placeFamiliarityIndexLOI")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v47, CFSTR("placeFamiliarityIndexLOI"));

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("persons")));

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("persons")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v51, CFSTR("persons"));

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("withFamily")));

  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("withFamily")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v55, CFSTR("withFamily"));

  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("withCoworker")));

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("withCoworker")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v59, CFSTR("withCoworker"));

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("withFriend")));

  if (v61)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("withFriend")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v63, CFSTR("withFriend"));

  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("withChild")));

  if (v65)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("withChild")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v67, CFSTR("withChild"));

  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("withMyPet")));

  if (v69)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("withMyPet")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v71, CFSTR("withMyPet"));

  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));

  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding socialContextEmbedding](self, "socialContextEmbedding"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v75, CFSTR("socialEventFromPhotoTraits"));

  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MOEmbedding extraContextEmbedding](self, "extraContextEmbedding"));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v76);

  return v3;
}

- (id)dayOfWeekString:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return CFSTR("undefined");
  else
    return *(&off_1002B3588 + a3 - 1);
}

- (NSUUID)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSUUID)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionID, a3);
}

- (unint64_t)embeddingType
{
  return self->_embeddingType;
}

- (void)setEmbeddingType:(unint64_t)a3
{
  self->_embeddingType = a3;
}

- (NSDictionary)activityContextEmbedding
{
  return self->_activityContextEmbedding;
}

- (void)setActivityContextEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_activityContextEmbedding, a3);
}

- (NSDictionary)timeContextEmbedding
{
  return self->_timeContextEmbedding;
}

- (void)setTimeContextEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_timeContextEmbedding, a3);
}

- (NSDictionary)locationContextEmbedding
{
  return self->_locationContextEmbedding;
}

- (void)setLocationContextEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_locationContextEmbedding, a3);
}

- (NSDictionary)socialContextEmbedding
{
  return self->_socialContextEmbedding;
}

- (void)setSocialContextEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_socialContextEmbedding, a3);
}

- (NSDictionary)extraContextEmbedding
{
  return self->_extraContextEmbedding;
}

- (void)setExtraContextEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_extraContextEmbedding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraContextEmbedding, 0);
  objc_storeStrong((id *)&self->_socialContextEmbedding, 0);
  objc_storeStrong((id *)&self->_locationContextEmbedding, 0);
  objc_storeStrong((id *)&self->_timeContextEmbedding, 0);
  objc_storeStrong((id *)&self->_activityContextEmbedding, 0);
  objc_storeStrong((id *)&self->_suggestionID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithEventBundle:forEmbeddingType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventBundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)extractTimeContextEmbedding:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Unable to create time context embedding since embeddingType is unknown or unassigned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)extractSocialContextEmbedding:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  OUTLINED_FUNCTION_4_5((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "socialContextEmbedding:%@", (uint8_t *)&v2);
}

- (void)extractContextsFromPhotoTraits:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10_2();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(v0, v1), "objectAtIndex:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v4, v5, "otherSubjectTraitsRankedDict=%@, selectedTrait=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)extractContextsFromPhotoTraits:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10_2();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(v0, v1), "objectAtIndex:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v4, v5, "socialEventTraitsRankedDict=%@, selectedTrait=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)extractContextsFromPhotoTraits:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10_2();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(v0, v1), "objectAtIndex:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v4, v5, "placeTypeTraitsRankedDict=%@, selectedTrait=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)extractContextsFromPhotoTraits:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10_2();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(v0, v1), "objectAtIndex:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v4, v5, "timeContextTraitsRankedDict=%@, selectedTrait=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)extractContextsFromPhotoTraits:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10_2();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(v0, v1), "objectAtIndex:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v4, v5, "activityTraitsRankedDict=%@, selectedTrait=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)extractContextsFromPhotoTraits:(_QWORD *)a3 .cold.6(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  OUTLINED_FUNCTION_4_5((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Current photo trait name:%@", a1);

}

- (void)extractContextsFromPhotoTraits:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  int v3;
  id v4;

  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4_5((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Photo trait count:%lu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_11();
}

- (void)getDistanceFrom:withWeights:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Distance is 0 since input embeddings share bundleID or suggestionID", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

- (void)getDistanceFrom:withWeights:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Sum of full distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)getDistanceFrom:(void *)a1 withWeights:(void *)a2 .cold.3(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "bundleIdentifier"));
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v4, v5, "Calculating distance between bundleIDs %@ and %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)getActivityContextDistanceFrom:withWeights:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Sum of activity context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)getTimeContextDistanceFrom:withWeights:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Sum of time context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)getTimeContextDistanceFrom:withWeights:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Multi-year embedding is currently not supported. time embedding distance is set to default (0)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)getLocationContextDistanceFrom:withWeights:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Sum of location context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)getSocialContextDistanceFrom:(os_log_t)log withWeights:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "social context embeddings e1 %@, e2 %@", (uint8_t *)&v3, 0x16u);
}

- (void)getSocialContextDistanceFrom:withWeights:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Sum of social context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

@end
