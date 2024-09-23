@implementation BMStateVectorMetricsCollector

- (BMStateVectorMetricsCollector)initWithDatabase:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  BMStateVectorMetricsCollector *v9;
  BMStateVectorMetricsCollector *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMStateVectorMetricsCollector;
  v9 = -[BMStateVectorMetricsCollector init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)computeAndSendStateVectorMetrics
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStateVectorMetricsCollector computeStateVectorMetrics](self, "computeStateVectorMetrics", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        +[BMCoreAnalyticsEvents sendCKRecordCRDTLog:](BMCoreAnalyticsEvents, "sendCKRecordCRDTLog:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6));
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)validStreamNameMapping
{
  NSMutableDictionary *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v2 = objc_opt_new(NSMutableDictionary);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BMStreamSyncPolicy syncableStreamConfigurations](BMStreamSyncPolicy, "syncableStreamConfigurations"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "streamIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "syncPolicy"));
        if (objc_msgSend(v9, "supportsTransport:direction:", 3, 3))
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "streamUUID"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, v11);

          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legacyNames"));
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j));
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v14);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  return v2;
}

- (id)computeStateVectorMetrics
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _UNKNOWN **v20;
  _UNKNOWN **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BMStateVectorMetricsCollector *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  id v51;
  id obj;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  _QWORD v67[5];
  _QWORD v68[5];
  _BYTE v69[128];

  v50 = objc_opt_new(NSMutableArray);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[BMStateVectorMetricsCollector validStreamNameMapping](self, "validStreamNameMapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100041D00((uint64_t)self, (uint64_t)v4, v6);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BMStateVectorMetricsCollector dateToRelativePositionDictionary](self, "dateToRelativePositionDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationsWithState:](self->_database, "locationsWithState:", 2));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v58;
    v46 = *(_QWORD *)v58;
    v47 = v4;
    do
    {
      v11 = 0;
      v51 = v9;
      do
      {
        if (*(_QWORD *)v58 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "streamName"));
        v15 = objc_msgSend(v4, "containsObject:", v14);

        if (v15)
        {
          v54 = v13;
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocation:](self->_database, "locationRowWithLocation:", v12));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase stateVectorForLocationRow:](self->_database, "stateVectorForLocationRow:"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "day"));
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", v17));
          v19 = (void *)v18;
          v20 = &off_10006EA98;
          if (v18)
            v20 = (_UNKNOWN **)v18;
          v21 = v20;

          v55 = v21;
          v68[0] = v21;
          v67[0] = CFSTR("relative_pos");
          v67[1] = CFSTR("state_vector_sites_cnt");
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "clockVector"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allSiteIdentifiers"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count")));
          v68[1] = v24;
          v67[2] = CFSTR("state_vector_size_est");
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BMStateVectorMetricsCollector sizeOfSerializedStateVectorInBytes:](self, "sizeOfSerializedStateVectorInBytes:", v16)));
          v68[2] = v25;
          v67[3] = CFSTR("state_vector_timestamp_cnt");
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BMStateVectorMetricsCollector timestampCountForStateVector:](self, "timestampCountForStateVector:", v16)));
          v68[3] = v26;
          v67[4] = CFSTR("stream_name");
          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "streamName"));
          v28 = self;
          v29 = (void *)v27;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v27));
          v68[4] = v30;
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 5));

          self = v28;
          v31 = __biome_log_for_category(11);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v37 = (objc_class *)objc_opt_class(v28, v33);
            v38 = NSStringFromClass(v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "location"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "day"));
            *(_DWORD *)buf = 138412802;
            v62 = v39;
            v63 = 2112;
            v64 = v41;
            v65 = 2112;
            v66 = v55;
            _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%@ - locationRow with day: %@ has relativePosition: %@", buf, 0x20u);

          }
          v34 = __biome_log_for_category(11);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v42 = (objc_class *)objc_opt_class(v28, v36);
            v43 = NSStringFromClass(v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            *(_DWORD *)buf = 138412546;
            v62 = v44;
            v63 = 2112;
            v64 = v53;
            _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%@ - generated crdtLog: %@", buf, 0x16u);

          }
          -[NSMutableArray addObject:](v50, "addObject:", v53);

          v10 = v46;
          v4 = v47;
          v9 = v51;
          v13 = v54;
        }
        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v9);
  }

  return v50;
}

- (id)dateToRelativePositionDictionary
{
  NSMutableDictionary *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = +[BMStreamCRDTLocationDayAssigner truncateDateToDay:](BMStreamCRDTLocationDayAssigner, "truncateDateToDay:", CFAbsoluteTimeGetCurrent());
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = 0;
  for (i = 0; i != 100; ++i)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreamCRDTLocationDayAssigner truncateDateToDay:](BMStreamCRDTLocationDayAssigner, "truncateDateToDay:", v6 - (double)v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v10, v9);

    v7 += 86400;
  }

  return v2;
}

- (unint64_t)sizeOfSerializedStateVectorInBytes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v11;

  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11));
  v6 = v11;
  if (v6)
  {
    v7 = __biome_log_for_category(11);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100041D94((uint64_t)self, (uint64_t)v4, v8);

  }
  v9 = objc_msgSend(v5, "length");

  return (unint64_t)v9;
}

- (unint64_t)timestampCountForStateVector:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011B40;
  v6[3] = &unk_100068DE0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateAllClockValuesUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
