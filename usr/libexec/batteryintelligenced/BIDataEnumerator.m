@implementation BIDataEnumerator

- (BIDataEnumerator)initWithStartDate:(id)a3 endDate:(id)a4 forBDCStream:(id)a5 atOrAboveVersion:(id)a6 usingDataFromCSVs:(BOOL)a7
{
  return -[BIDataEnumerator initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:withInputFilePath:](self, "initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:withInputFilePath:", a3, a4, a5, a6, a7, 0);
}

- (BIDataEnumerator)initWithStartDate:(id)a3 endDate:(id)a4 forBDCStream:(id)a5 atOrAboveVersion:(id)a6 usingDataFromCSVs:(BOOL)a7 withInputFilePath:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BIDataEnumerator *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *i;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  float v61;
  id v62;
  uint64_t v63;
  void *j;
  void *v65;
  void *v66;
  float v67;
  float v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  int *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  NSObject *v88;
  id obj;
  uint64_t v90;
  id v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  objc_super v102;
  uint8_t v103[4];
  int v104;
  uint8_t buf[4];
  id v106;
  __int16 v107;
  id v108;
  __int16 v109;
  id v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _QWORD v113[2];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v102.receiver = self;
  v102.super_class = (Class)BIDataEnumerator;
  v19 = -[BIDataEnumerator init](&v102, "init");
  if (v19)
  {
    v20 = sub_10001714C("dataaccess");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)*((_QWORD *)v19 + 1);
    *((_QWORD *)v19 + 1) = v21;

    *((_BYTE *)v19 + 96) = a7;
    *((_QWORD *)v19 + 8) = 0x412A5E0000000000;
    *((_QWORD *)v19 + 9) = 0x3FF0000000000000;
    v23 = objc_msgSend(v14, "copy");
    v24 = (void *)*((_QWORD *)v19 + 13);
    *((_QWORD *)v19 + 13) = v23;

    v25 = objc_msgSend(v15, "copy");
    v26 = (void *)*((_QWORD *)v19 + 14);
    *((_QWORD *)v19 + 14) = v25;

    v27 = objc_msgSend(v16, "copy");
    v28 = (void *)*((_QWORD *)v19 + 15);
    *((_QWORD *)v19 + 15) = v27;

    v29 = objc_msgSend(v17, "copy");
    v30 = (void *)*((_QWORD *)v19 + 16);
    *((_QWORD *)v19 + 16) = v29;

    if (a7)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v84 = v14;
      if (v18)
      {
        v32 = v18;
      }
      else
      {
        v42 = sub_100017134();
        v32 = (id)objc_claimAutoreleasedReturnValue(v42);
      }
      v43 = v32;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v32, 1));
      v113[0] = NSURLAttributeModificationDateKey;
      v113[1] = NSURLCreationDateKey;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v113, 2));
      v101 = 0;
      v46 = v31;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v44, v45, 5, &v101));
      v87 = v101;

      v81 = v46;
      v82 = v47;
      if (v47)
      {
        v78 = v44;
        v79 = v43;
        v80 = v18;
        v86 = v17;
        v83 = v15;
        v48 = objc_alloc_init((Class)NSMutableArray);
        v49 = (void *)*((_QWORD *)v19 + 2);
        *((_QWORD *)v19 + 2) = v48;

        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        obj = v47;
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
        if (v50)
        {
          v51 = v50;
          v90 = *(_QWORD *)v98;
          v77 = &v104;
          v85 = v16;
          do
          {
            for (i = 0; i != v51; i = (char *)i + 1)
            {
              if (*(_QWORD *)v98 != v90)
                objc_enumerationMutation(obj);
              v53 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
              v54 = objc_autoreleasePoolPush();
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastPathComponent"));
              v56 = objc_msgSend(v55, "containsString:", v16);

              if (v56)
              {
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastPathComponent"));
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "componentsSeparatedByString:", CFSTR("_")));

                v95 = 0u;
                v96 = 0u;
                v93 = 0u;
                v94 = 0u;
                v59 = v58;
                v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
                v61 = 0.0;
                if (v60)
                {
                  v62 = v60;
                  v63 = *(_QWORD *)v94;
                  while (2)
                  {
                    for (j = 0; j != v62; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v94 != v63)
                        objc_enumerationMutation(v59);
                      v65 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)j);
                      if (objc_msgSend(v65, "containsString:", CFSTR("version"), v77)
                        && objc_msgSend(v65, "length") == (id)10)
                      {
                        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "substringFromIndex:", 7));
                        objc_msgSend(v66, "floatValue");
                        v61 = v67;

                        goto LABEL_28;
                      }
                    }
                    v62 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
                    if (v62)
                      continue;
                    break;
                  }
LABEL_28:
                  v16 = v85;
                }

                objc_msgSend(v86, "floatValue");
                if (v61 >= v68)
                {
                  v91 = 0;
                  v92 = 0;
                  objc_msgSend(v53, "getResourceValue:forKey:error:", &v92, NSURLCreationDateKey, &v91);
                  v69 = v92;
                  v70 = v91;

                  v71 = *((_QWORD *)v19 + 1);
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    v106 = v84;
                    v107 = 2112;
                    v108 = v83;
                    v109 = 2112;
                    v110 = v69;
                    _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Look back %@ end date %@ Creation %@", buf, 0x20u);
                  }
                  v72 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "laterDate:", v84, v77));
                  if (v72 == v69)
                  {
                    v73 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "laterDate:", v83));

                    v16 = v85;
                    if (v73 == v83)
                    {
                      v88 = *((_QWORD *)v19 + 1);
                      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
                        sub_10001DF10(v103, v88, v53, v77);
                      objc_msgSend(*((id *)v19 + 2), "addObject:", v53);
                    }
                  }
                  else
                  {

                  }
                  v87 = v70;
                }

              }
              objc_autoreleasePoolPop(v54);
            }
            v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
          }
          while (v51);
        }

        objc_msgSend(*((id *)v19 + 2), "sortUsingComparator:", &stru_10002C630);
        if (objc_msgSend(*((id *)v19 + 2), "count"))
          v74 = v19;
        else
          v74 = 0;
        v41 = v74;
        v14 = v84;
        v15 = v83;
        v17 = v86;
        v18 = v80;
        v75 = v81;
        v44 = v78;
        v43 = v79;
      }
      else
      {
        if (os_log_type_enabled(*((os_log_t *)v19 + 1), OS_LOG_TYPE_ERROR))
          sub_10001DEB0();
        v41 = 0;
        v75 = v46;
        v14 = v84;
      }

    }
    else
    {
      v41 = (BIDataEnumerator *)v19;
    }
  }
  else
  {
    v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v33)
      sub_10001D844(v33, v34, v35, v36, v37, v38, v39, v40);
    v41 = 0;
  }

  return v41;
}

- (id)nextObject
{
  NSEnumerator *v3;
  NSEnumerator *fileEnumerator;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *rows;
  NSMutableArray *v14;
  id v15;
  NSObject *v16;
  NSDate *startDate;
  void *v19;
  void *v20;
  NSDate **p_itrEndDate;
  NSDate *itrEndDate;
  NSDate **p_itrStartDate;
  NSDate *v24;
  NSDate *v25;
  uint64_t v26;
  NSDate *v27;
  NSDate *v28;
  NSDate *endDate;
  id v30;
  NSObject *logger;
  uint64_t Data;
  void *v33;
  id v34;
  PPSTimeSeries *v35;
  PPSTimeSeries *currentPPSCollection;
  NSEnumerator *v37;
  NSEnumerator *enumeratorPPSCollection;
  uint64_t v39;
  NSObject *v40;
  NSString *bdcStream;
  NSDate *v42;
  NSDate *v43;
  NSEnumerator *v44;
  NSEnumerator *rowEnumerator;
  uint64_t v46;
  void *v47;
  NSDate *v48;
  void *v49;
  uint8_t v50;
  char v51[7];
  id v52;
  uint8_t buf[4];
  NSString *v54;
  __int16 v55;
  NSDate *v56;
  __int16 v57;
  NSDate *v58;

  if (!self->_useCSVs)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == %@)"), self->_bdcStream));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_enumeratorPPSCollection, "nextObject"));
    if (-[NSString isEqualToString:](self->_bdcStream, "isEqualToString:", CFSTR("BDC_SBC")))
    {
      v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F050));
      if (v6)
      {
        v8 = (id)v7;
LABEL_22:

        goto LABEL_23;
      }
      v49 = (void *)v7;
      startDate = self->_startDate;
      if (startDate)
      {
        v19 = 0;
        v20 = 0;
        while (1)
        {
          if (!self->_endDate)
          {
            v8 = v20;
            v30 = v19;
            goto LABEL_51;
          }
          p_itrEndDate = &self->_itrEndDate;
          itrEndDate = self->_itrEndDate;
          if (itrEndDate)
          {
            v48 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](self->_itrEndDate, "dateByAddingTimeInterval:", self->_timeIntevalBetweenChunks));
            startDate = v48;
          }
          p_itrStartDate = &self->_itrStartDate;
          objc_storeStrong((id *)&self->_itrStartDate, startDate);
          if (itrEndDate)

          if (-[NSDate isEqualToDate:](*p_itrEndDate, "isEqualToDate:", self->_endDate))
            break;
          v24 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](*p_itrStartDate, "laterDate:", self->_endDate));
          v25 = *p_itrStartDate;

          if (v24 == v25)
            break;
          v26 = objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](*p_itrStartDate, "dateByAddingTimeInterval:", self->_dataChunkingTimeInterval));
          v27 = *p_itrEndDate;
          *p_itrEndDate = (NSDate *)v26;

          v28 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSDate laterDate:](*p_itrEndDate, "laterDate:", self->_endDate));
          endDate = *p_itrEndDate;
          if (v28 == *p_itrEndDate)
            endDate = self->_endDate;
          objc_storeStrong((id *)&self->_itrEndDate, endDate);

          v30 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", *p_itrStartDate, *p_itrEndDate);
          v8 = objc_msgSend(objc_alloc((Class)PPSTimeSeriesRequest), "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", v49, v5, v30, 3000, 0);

          logger = self->_logger;
          if (!v8)
          {
            if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
              sub_10001DFEC();

            v6 = 0;
            v8 = v30;
            goto LABEL_22;
          }
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            bdcStream = self->_bdcStream;
            v42 = *p_itrStartDate;
            v43 = *p_itrEndDate;
            *(_DWORD *)buf = 138412802;
            v54 = bdcStream;
            v55 = 2112;
            v56 = v42;
            v57 = 2112;
            v58 = v43;
            _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Fetching data from %@ stream in range %@ - %@", buf, 0x20u);
          }
          v52 = 0;
          Data = PerfPowerServicesGetData(v8, &v52);
          v33 = (void *)objc_claimAutoreleasedReturnValue(Data);
          v34 = v52;
          if (v34)
          {
            v47 = v34;
            if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
              sub_10001DD44();

            goto LABEL_53;
          }
          v35 = (PPSTimeSeries *)objc_msgSend(v33, "copy");
          currentPPSCollection = self->_currentPPSCollection;
          self->_currentPPSCollection = v35;

          v37 = (NSEnumerator *)objc_claimAutoreleasedReturnValue(-[PPSTimeSeries objectEnumerator](self->_currentPPSCollection, "objectEnumerator"));
          enumeratorPPSCollection = self->_enumeratorPPSCollection;
          self->_enumeratorPPSCollection = v37;

          v39 = objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_enumeratorPPSCollection, "nextObject"));
          if (v39)
          {
            v6 = (void *)v39;

            v8 = v49;
            goto LABEL_22;
          }
          v40 = self->_logger;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            sub_10001E018(&v50, v51, v40);

          startDate = self->_startDate;
          v19 = v30;
          v20 = v8;
          if (!startDate)
            goto LABEL_51;
        }
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
          sub_10001DFBC();

        v6 = 0;
        v8 = v20;
        goto LABEL_22;
      }
      v8 = 0;
      v30 = 0;
LABEL_51:
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001DF90();
LABEL_53:

    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001E04C();
      v8 = v6;
    }
    v6 = 0;
    goto LABEL_22;
  }
  if (!self->_fileEnumerator)
  {
    v3 = (NSEnumerator *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectEnumerator](self->_fileURLs, "objectEnumerator"));
    fileEnumerator = self->_fileEnumerator;
    self->_fileEnumerator = v3;

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_rowEnumerator, "nextObject"));
  if (v5)
    goto LABEL_5;
  v9 = objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_fileEnumerator, "nextObject"));
  if (v9)
  {
    v5 = (void *)v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:encoding:error:](NSString, "stringWithContentsOfURL:encoding:error:", v9, 4, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n")));
    v12 = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");
    rows = self->_rows;
    self->_rows = v12;

    v14 = self->_rows;
    if (v14 && -[NSMutableArray count](v14, "count"))
    {
      -[NSMutableArray removeObject:](self->_rows, "removeObject:", &stru_10002D5B8);
      v15 = -[NSMutableArray count](self->_rows, "count");
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
        sub_10001E078();
      if ((unint64_t)v15 > 1)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_rows, "removeObjectAtIndex:", 0);
        v44 = (NSEnumerator *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectEnumerator](self->_rows, "objectEnumerator"));
        rowEnumerator = self->_rowEnumerator;
        self->_rowEnumerator = v44;

        v46 = objc_claimAutoreleasedReturnValue(-[NSEnumerator nextObject](self->_rowEnumerator, "nextObject"));
        v5 = (void *)v46;
LABEL_5:
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(",")));
LABEL_23:

        return v6;
      }
      v16 = self->_logger;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v54 = (NSString *)v5;
        v55 = 1024;
        LODWORD(v56) = (_DWORD)v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Returning early. File %@ Row count %u", buf, 0x12u);
      }
    }

    v6 = 0;
    goto LABEL_23;
  }
  return 0;
}

- (id)getBDCDataFromStartDate:(id)a3 toEndDate:(id)a4 forStream:(id)a5 withMetrics:(id)a6 withLimit:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *logger;
  void *v21;
  uint64_t Data;
  void *v23;
  id v24;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!self->_useCSVs)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == %@)"), v14));
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("BDC_Daily")) & 1) != 0
      || (objc_msgSend(v14, "isEqualToString:", CFSTR("BDC_SBC")) & 1) != 0)
    {
      v18 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v12, v13);
      v19 = objc_msgSend(objc_alloc((Class)PPSTimeSeriesRequest), "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", v15, v17, v18, a7, 0);
      logger = self->_logger;
      if (v19)
      {
        v21 = v19;
        v26 = v17;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v29 = v14;
          v30 = 2112;
          v31 = v12;
          v32 = 2112;
          v33 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Fetching data for stream %@ in range %@ - %@", buf, 0x20u);
        }
        v27 = 0;
        Data = PerfPowerServicesGetData(v21, &v27);
        v23 = (void *)objc_claimAutoreleasedReturnValue(Data);
        v24 = v27;
        if (v24)
        {
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
            sub_10001DD44();
          v16 = 0;
        }
        else
        {
          v16 = v23;
        }

        v17 = v26;
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001E0F4();

    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      sub_10001E120();
    }
    v16 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    sub_10001E14C();
  v16 = 0;
LABEL_23:

  return v16;
}

- (void)resetStream
{
  NSEnumerator *fileEnumerator;
  NSEnumerator *rowEnumerator;
  NSEnumerator *enumeratorPPSCollection;
  NSDate *itrEndDate;
  NSDate *itrStartDate;

  fileEnumerator = self->_fileEnumerator;
  self->_fileEnumerator = 0;

  rowEnumerator = self->_rowEnumerator;
  self->_rowEnumerator = 0;

  enumeratorPPSCollection = self->_enumeratorPPSCollection;
  self->_enumeratorPPSCollection = 0;

  itrEndDate = self->_itrEndDate;
  self->_itrEndDate = 0;

  itrStartDate = self->_itrStartDate;
  self->_itrStartDate = 0;

}

- (id)copyFileURLs
{
  return -[NSMutableArray copy](self->_fileURLs, "copy");
}

- (id)getMedianValueForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *logger;
  NSDate *startDate;
  NSDate *endDate;
  id v11;
  void *v12;
  uint64_t Data;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  NSDate *v44;
  __int16 v45;
  NSDate *v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  v6 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", self->_startDate, self->_endDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(subsystem == 'BatteryDataCollection' AND category == %@)"), self->_bdcStream));
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
    sub_10001E280();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    startDate = self->_startDate;
    endDate = self->_endDate;
    *(_DWORD *)buf = 138412802;
    v42 = v4;
    v43 = 2112;
    v44 = startDate;
    v45 = 2112;
    v46 = endDate;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "Fetching BDC metric %@ in range %@ - %@", buf, 0x20u);
  }
  v11 = objc_msgSend(objc_alloc((Class)PPSTimeSeriesRequest), "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:", v5, v7, v6, 100, 0);
  v12 = v11;
  if (v11)
  {
    v39 = 0;
    Data = PerfPowerServicesGetData(v11, &v39);
    v14 = (void *)objc_claimAutoreleasedReturnValue(Data);
    v15 = v39;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001DD44();
      v16 = 0;
    }
    else
    {
      v31 = v12;
      v32 = v7;
      v33 = v6;
      v34 = v5;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
        sub_10001E220();
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v30 = v14;
      v18 = v14;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v21)
              objc_enumerationMutation(v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "metricKeysAndValues"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v4));
            objc_msgSend(v17, "addObject:", v24);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v20);
      }

      v25 = sub_100017F90(v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      if (v26
        && (v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
            v28 = objc_msgSend(v26, "isEqual:", v27),
            v27,
            !v28))
      {
        v5 = v34;
        v15 = 0;
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
          sub_10001E1A4();
        v16 = v26;
      }
      else
      {
        v5 = v34;
        v15 = 0;
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
          sub_10001E178();
        v16 = 0;
      }
      v14 = v30;
      v12 = v31;

      v7 = v32;
      v6 = v33;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)bdcStream
{
  return self->_bdcStream;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)useCSVs
{
  return self->_useCSVs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_bdcStream, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_itrEndDate, 0);
  objc_storeStrong((id *)&self->_itrStartDate, 0);
  objc_storeStrong((id *)&self->_enumeratorPPSCollection, 0);
  objc_storeStrong((id *)&self->_currentPPSCollection, 0);
  objc_storeStrong((id *)&self->_rowEnumerator, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_fileEnumerator, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
