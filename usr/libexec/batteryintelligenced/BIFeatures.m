@implementation BIFeatures

+ (BIFeatures)sharedInstance
{
  if (qword_100035250 != -1)
    dispatch_once(&qword_100035250, &stru_10002C808);
  return (BIFeatures *)(id)qword_100035248;
}

- (BIFeatures)init
{
  id v2;
  char *v3;
  uint64_t v4;
  void *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BIFeatures *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v38;
  objc_super v39;
  NSFileAttributeKey v40;
  NSFileProtectionType v41;

  v39.receiver = self;
  v39.super_class = (Class)BIFeatures;
  v2 = -[BIFeatures init](&v39, "init");
  if (!v2)
  {
    v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20)
      sub_10001EB1C(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_12;
  }
  v3 = sub_10001714C("features");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v4;

  if (!*((_QWORD *)v2 + 1))
  {
    v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v28)
      sub_10001EB50(v28, v29, v30, v31, v32, v33, v34, v35);
    goto LABEL_12;
  }
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = dispatch_queue_create("com.apple.batteryintelligenced.features.sampler", v7);
  v9 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v8;

  if (!*((_QWORD *)v2 + 3))
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 1), OS_LOG_TYPE_ERROR))
      sub_10001EB84();
LABEL_12:
    v19 = 0;
    goto LABEL_17;
  }
  v10 = sub_100017140();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v40 = NSFileProtectionKey;
  v41 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  v38 = 0;
  v14 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, v13, &v38);
  v15 = v38;

  if ((v14 & 1) != 0)
  {
    v16 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = &stru_10002C848;

    v17 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = &stru_10002C868;

    v18 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = &stru_10002C888;

    v19 = (BIFeatures *)v2;
  }
  else
  {
    v36 = *((_QWORD *)v2 + 1);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_10001EBB0((uint64_t)v11, (uint64_t)v15, v36);
    v19 = 0;
  }

LABEL_17:
  return v19;
}

- (id)defaultTemperatureBinner
{
  return objc_retainBlock(self->_defaultTemperatureBinner);
}

- (id)defaultUISocBinner
{
  return objc_retainBlock(self->_defaultUISocBinner);
}

- (id)defaultCRateBinner
{
  return objc_retainBlock(self->_defaultCRateBinner);
}

- (id)getTimestampForEntry:(id)a3 atVersion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(PPSEvent);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    objc_msgSend(v6, "epochTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
  }
  else
  {
    v10 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000106F8;
      block[3] = &unk_10002C5A8;
      v15 = v7;
      if (qword_100035258 != -1)
        dispatch_once(&qword_100035258, block);
      v11 = (void *)qword_100035268;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", dword_100035260));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateFromString:", v12));

    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001EC30();
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)processDataEntry:(id)a3 forBDCDataColumns:(id)a4 atVersion:(id)a5 intoRunningCount:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  signed int v20;
  $0A884CB292867F64193AFE02BF718FAA *v21;
  int32x2_t *p_var3;
  int32x2_t v23;
  signed int var1;
  int *p_var1;
  signed int var2;
  int *p_var2;
  NSObject *v28;
  int var0;
  int v30;
  int v31;
  __int32 v32;
  unsigned int var4;
  NSObject *logger;
  id v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  BIFeatures *v40;
  char isKindOfClass;
  void *v42;
  id v43;
  id v44;
  int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  __int32 v59;
  __int16 v60;
  unsigned int v61;
  _BYTE v62[128];

  v10 = a3;
  v11 = a4;
  v43 = a5;
  if (a6)
  {
    if (v11 && objc_msgSend(v11, "count"))
    {
      if (v43)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[BDCSchema sharedBDCSchema](BDCSchema, "sharedBDCSchema"));
        v12 = objc_opt_class(PPSEvent);
        isKindOfClass = objc_opt_isKindOfClass(v10, v12);
        if ((isKindOfClass & 1) != 0)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metricKeysAndValues"));
          v36 = v10;
          v40 = self;
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
            sub_10001ECE0();
        }
        else
        {
          v15 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v10, v15) & 1) == 0)
          {
            logger = self->_logger;
            if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
              sub_10001ED40(logger, v10);
            v13 = 0;
            goto LABEL_38;
          }
          v40 = self;
          v36 = v10;
          v37 = 0;
        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v35 = v11;
        obj = v11;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
        if (v44)
        {
          v45 = 0;
          v39 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v44; i = (char *)i + 1)
            {
              if (*(_QWORD *)v47 != v39)
                objc_enumerationMutation(obj);
              v17 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
              if ((isKindOfClass & 1) != 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bdcNameForColumnName:atVersion:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i), v43));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v18));
                v20 = objc_msgSend(v19, "intValue");

              }
              else
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndexedSubscript:", objc_msgSend(v42, "columnIndexForColumnName:atVersion:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i), v43)));
                v20 = objc_msgSend(v18, "intValue");
              }
              v21 = &a6[v45 + (int)i];

              p_var3 = (int32x2_t *)&v21->var3;
              v23 = *(int32x2_t *)&v21->var3;
              v21->var0 = v20;
              p_var1 = &v21->var1;
              var1 = v21->var1;
              if (v20 > var1)
                var1 = v20;
              *p_var1 = var1;
              p_var2 = &v21->var2;
              var2 = v21->var2;
              if (v20 < var2)
                var2 = v20;
              *p_var2 = var2;
              *p_var3 = vadd_s32(v23, (int32x2_t)(v20 | 0x100000000));
              v28 = v40->_logger;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                var0 = v21->var0;
                v30 = *p_var1;
                v31 = *p_var2;
                v32 = p_var3->i32[0];
                var4 = a6[v45 + (int)i].var4;
                *(_DWORD *)buf = 138413570;
                v51 = v17;
                v52 = 1024;
                v53 = var0;
                v54 = 1024;
                v55 = v30;
                v56 = 1024;
                v57 = v31;
                v58 = 1024;
                v59 = v32;
                v60 = 1024;
                v61 = var4;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Key:%@ currVal %d maxVal %d minVal %d sum %d count %d", buf, 0x2Au);
              }
            }
            v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
            v45 += (int)i;
          }
          while (v44);
        }

        v13 = 1;
        v10 = v36;
        v11 = v35;
LABEL_38:

        goto LABEL_13;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001ECB4();
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      sub_10001EC88();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
  {
    sub_10001EC5C();
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)resampleUsingEnumerator:(id)a3 forBDCDataColumns:(id)a4 samplingPeriodSeconds:(unsigned int)a5 aggregationTypes:(id)a6 callBack:(id)a7
{
  id v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  double v17;
  __int128 v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSDate *v24;
  void *v25;
  void *v26;
  NSDate *v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  NSObject *v31;
  double v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  int v39;
  float v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _DWORD *v51;
  int v52;
  int v53;
  double v54;
  int v55;
  _DWORD *v56;
  void *v57;
  unsigned int v58;
  id v59;
  id v60;
  void *v61;
  NSObject *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE *v67;
  uint64_t v68;
  id v69;
  _QWORD *v70;
  __int128 v71;
  __int128 *v72;
  unint64_t v73;
  size_t v74;
  __int128 *v75;
  void (**v76)(id, id);
  unsigned int v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  uint64_t v84;
  int v85;
  float *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  char *v93;
  os_log_t *v94;
  uint8_t v95;
  _BYTE v96[7];
  _QWORD v97[6];
  unsigned int v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[5];
  _QWORD v104[5];
  uint8_t buf[4];
  _BYTE v106[26];
  __int16 v107;
  double v108;
  __int16 v109;
  int v110;
  __int16 v111;
  int v112;

  v77 = a5;
  v83 = a3;
  v11 = a4;
  v90 = a6;
  v76 = (void (**)(id, id))a7;
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  v91 = v11;
  v12 = objc_msgSend(v11, "count");
  v75 = &v63;
  v74 = 4 * v12;
  v93 = (char *)&v63 - ((v74 + 15) & 0x7FFFFFFF0);
  v94 = (os_log_t *)self;
  j__dispatch_assert_queue_barrier((dispatch_queue_t)self->_samplingQueue);
  if (v12 && (id)v12 == objc_msgSend(v90, "count"))
  {
    if (v83)
    {
      v69 = (id)objc_claimAutoreleasedReturnValue(+[BDCSchema sharedBDCSchema](BDCSchema, "sharedBDCSchema"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "version"));
      v14 = objc_msgSend(v69, "maxColumnIndexForBDCStream:atVersion:", CFSTR("BDC_SBC"), v13);

      if ((v14 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(v94[1], OS_LOG_TYPE_ERROR))
          sub_10001EE18();

      }
      else
      {
        v15 = malloc_type_malloc(20 * (v12 + 1), 0xF37DBD15uLL);
        v100[3] = (uint64_t)v15;
        if (v15)
        {
          v97[0] = _NSConcreteStackBlock;
          v97[1] = 3221225472;
          v97[2] = sub_1000118D8;
          v97[3] = &unk_10002C8B0;
          v97[4] = &v99;
          v97[5] = 20 * (v12 + 1);
          v98 = v12;
          v70 = objc_retainBlock(v97);
          ((void (*)(void))v70[2])();
          bzero(v93, v74);
          v89 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "nextObject"));
          v16 = 0;
          v92 = 0;
          v73 = v14 + 1;
          v17 = (double)v77;
          v67 = v96;
          v84 = 20 * v12;
          *(_QWORD *)&v18 = 138412546;
          v65 = v18;
          v68 = (4 * v14 + 15) & 0x7FFFFFFF0;
          *(_QWORD *)&v18 = 67109120;
          v66 = v18;
          *(_QWORD *)&v18 = 67110656;
          v71 = v18;
          *(_QWORD *)&v18 = 67109634;
          v63 = v18;
          *(_QWORD *)&v18 = 138412290;
          v64 = v18;
          while (1)
          {
            if (!v89)
            {
              v61 = (void *)v100[3];
              if (v61)
                free(v61);

              goto LABEL_59;
            }
            v80 = objc_autoreleasePoolPush();
            v19 = objc_opt_class(NSArray);
            if ((objc_opt_isKindOfClass(v89, v19) & 1) == 0)
              break;
            v20 = objc_msgSend(v89, "count");
            if ((unint64_t)v20 >= v73)
              break;
            v21 = v94[1];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              sub_10001EE80(&v95, v67, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "nextObject", (_QWORD)v63));
            v82 = v89;
            v89 = v22;
LABEL_56:

            objc_autoreleasePoolPop(v80);
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "version", (_QWORD)v63, *((_QWORD *)&v63 + 1)));
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t getTimestampForEntry:atVersion:](v94, "getTimestampForEntry:atVersion:", v89, v23));

          v24 = sub_100017170(v82, v77);
          v79 = (id)objc_claimAutoreleasedReturnValue(v24);
          if (!v92)
            v92 = v79;
          v81 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "nextObject"));
          if (v81)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "version"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t getTimestampForEntry:atVersion:](v94, "getTimestampForEntry:atVersion:", v81, v25));

            v27 = sub_100017170(v26, v77);
            v78 = (id)objc_claimAutoreleasedReturnValue(v27);
            if (v26 && objc_msgSend(v82, "isEqualToDate:", v26))
            {
              v28 = v94[1];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v64;
                *(_QWORD *)v106 = v82;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Skipping row due to repeated timestamp %@", buf, 0xCu);
              }
LABEL_55:
              v60 = v81;

              v89 = v60;
              goto LABEL_56;
            }
          }
          else
          {
            v78 = 0;
            v26 = 0;
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "version"));
          v30 = -[os_log_t processDataEntry:forBDCDataColumns:atVersion:intoRunningCount:](v94, "processDataEntry:forBDCDataColumns:atVersion:intoRunningCount:", v89, v91, v29, v100[3]);

          if (v30 && (!v81 || (objc_msgSend(v78, "isEqualToDate:", v92) & 1) == 0))
          {
            v31 = v94[1];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v65;
              *(_QWORD *)v106 = v16;
              *(_WORD *)&v106[8] = 2112;
              *(_QWORD *)&v106[10] = v92;
              _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "END OF SEGMENT prev_ts %@, current_ts %@", buf, 0x16u);
            }
            v72 = &v63;
            v86 = (float *)((char *)&v63 - v68);
            if (!v16)
            {
              v85 = 1;
LABEL_31:
              v87 = objc_alloc_init((Class)NSMutableDictionary);
              v34 = v94[1];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v66;
                *(_DWORD *)v106 = v85;
                _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Number of segments to fill %d", buf, 8u);
              }
              v35 = 0;
              v36 = 0;
              while (2)
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndexedSubscript:", v36));
                v38 = objc_msgSend(v37, "unsignedIntValue");

                if (v38)
                {
                  if (v38 == 1)
                  {
                    v39 = *(_DWORD *)(v100[3] + v35 + 4);
LABEL_40:
                    v40 = (float)v39;
                  }
                  else
                  {
                    if (v38 == 2)
                    {
                      v39 = *(_DWORD *)(v100[3] + v35 + 8);
                      goto LABEL_40;
                    }
                    v41 = v94[1];
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                    {
                      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectAtIndexedSubscript:", v36));
                      v58 = objc_msgSend(v57, "unsignedIntValue");
                      *(_DWORD *)buf = v66;
                      *(_DWORD *)v106 = v58;
                      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Unknown resampling aggregation type %u", buf, 8u);

                    }
                    v40 = *(float *)&v93[4 * v36];
                  }
                }
                else
                {
                  v40 = (float)*(int *)(v100[3] + v35 + 12) / (float)*(unsigned int *)(v100[3] + v35 + 16);
                }
                v86[v36] = v40;
                if (!v16)
                  *(float *)&v93[4 * v36] = v40;
                v42 = v94[1];
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                {
                  v51 = (_DWORD *)(v100[3] + v35);
                  v53 = v51[3];
                  v52 = v51[4];
                  v54 = *(float *)&v93[4 * v36];
                  v56 = v51 + 1;
                  LODWORD(v51) = v51[1];
                  v55 = v56[1];
                  *(_DWORD *)buf = v71;
                  *(_DWORD *)v106 = v36;
                  *(_WORD *)&v106[4] = 1024;
                  *(_DWORD *)&v106[6] = v52;
                  *(_WORD *)&v106[10] = 1024;
                  *(_DWORD *)&v106[12] = v53;
                  *(_WORD *)&v106[16] = 2048;
                  *(double *)&v106[18] = v54;
                  v107 = 2048;
                  v108 = v40;
                  v109 = 1024;
                  v110 = v55;
                  v111 = 1024;
                  v112 = (int)v51;
                  _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "idx %d, count %d, sum %d, prevVal %f, currVal %f, min %d, max %d", buf, 0x34u);
                }
                v103[0] = CFSTR("NumSegments");
                v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v85));
                v104[0] = v43;
                v103[1] = CFSTR("PrevSegmentVal");
                LODWORD(v44) = *(_DWORD *)&v93[4 * v36];
                v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v44));
                v104[1] = v45;
                v103[2] = CFSTR("CurrSegmentVal");
                *(float *)&v46 = v40;
                v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v46));
                v104[2] = v47;
                v103[3] = CFSTR("PrevSegmentTimeStamp");
                v48 = v16;
                if (!v16)
                {
                  v88 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                  v48 = v88;
                }
                v103[4] = CFSTR("CurrSegmentTimeStamp");
                v104[3] = v48;
                v104[4] = v92;
                v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v104, v103, 5));
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectAtIndexedSubscript:", v36));
                objc_msgSend(v87, "setObject:forKeyedSubscript:", v49, v50);

                if (!v16)
                ++v36;
                v35 += 20;
                if (v84 == v35)
                {
                  v59 = objc_msgSend(v87, "copy");
                  v76[2](v76, v59);

                  goto LABEL_54;
                }
                continue;
              }
            }
            objc_msgSend(v92, "timeIntervalSinceDate:", v16);
            v85 = (int)(v32 / v17);
            if (v85 >= 1)
              goto LABEL_31;
            v33 = v94[1];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v63;
              *(_DWORD *)v106 = v85;
              *(_WORD *)&v106[4] = 2112;
              *(_QWORD *)&v106[6] = v92;
              *(_WORD *)&v106[14] = 2112;
              *(_QWORD *)&v106[16] = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Unexpected number of segments %d current_ts %@ prev_ts %@", buf, 0x1Cu);
            }
LABEL_54:

            memcpy(v93, v86, v74);
            ((void (*)(void))v70[2])();
            v16 = v92;
            v92 = 0;
          }
          goto LABEL_55;
        }
        v62 = v94[1];
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          sub_10001EE44((uint64_t)buf, (uint64_t)objc_msgSend(v91, "count"), v62);

      }
    }
    else if (os_log_type_enabled(v94[1], OS_LOG_TYPE_ERROR))
    {
      sub_10001EDEC();
    }
  }
  else if (os_log_type_enabled(v94[1], OS_LOG_TYPE_ERROR))
  {
    sub_10001EDC0();
  }
LABEL_59:
  _Block_object_dispose(&v99, 8);

}

- (id)copyHistogramsOfTypes:(id)a3 withBinners:(id)a4 withParams:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *samplingQueue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100011A78;
  v26 = sub_100011A88;
  v27 = 0;
  samplingQueue = self->_samplingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011A90;
  block[3] = &unk_10002C8D8;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(samplingQueue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)_copyHistogramsOfTypes:(id)a3 withBinners:(id)a4 withParams:(id)a5
{
  id v8;
  id *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  void *v19;
  id v20;
  int v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  uint64_t v26;
  char v27;
  void *v28;
  BIHistogram *uisocHistogramCache;
  unsigned int v30;
  BIHistogram *v31;
  BIHistogram *v32;
  BIHistogram *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  BIHistogram *v51;
  BIHistogram *v52;
  BIHistogram *v53;
  BIDataEnumerator *v54;
  BIDataEnumerator *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *i;
  void *v62;
  id v63;
  id v64;
  BIHistogram *v65;
  id v66;
  NSObject *logger;
  __int128 v69;
  int v70;
  void *v71;
  id v72;
  void *v73;
  id *p_temperatureHistogramCache;
  id *p_cRateHistogramCache;
  BIDataEnumerator *v76;
  uint64_t v77;
  id *location;
  id *locationa;
  id v80;
  id v81;
  id v82;
  BIFeatures *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  BIHistogram *v89;
  BIHistogram *v90;
  BIHistogram *v91;
  int v92;
  uint8_t v93[128];
  uint8_t buf[4];
  id v95;

  v8 = a3;
  v9 = (id *)a4;
  v10 = a5;
  j__dispatch_assert_queue_barrier((dispatch_queue_t)self->_samplingQueue);
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001EEB4();
    v20 = 0;
    goto LABEL_97;
  }
  v13 = os_transaction_create("com.apple.batteryintelligence.bifeatures.gethistograms", v11);
  v83 = self;
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UseCachedFeatures")));
    v15 = objc_msgSend(v14, "BOOLValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HistogramStartDate")));
    v17 = objc_opt_class(NSDate);
    isKindOfClass = objc_opt_isKindOfClass(v16, v17);

    if ((isKindOfClass & 1) != 0)
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HistogramStartDate")));
    else
      v19 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HistogramEndDate")));
    v23 = objc_opt_class(NSDate);
    v24 = objc_opt_isKindOfClass(v22, v23);

    if ((v24 & 1) != 0)
      v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HistogramEndDate")));
    else
      v77 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DesignCapacity")));
    v26 = objc_opt_class(NSNumber);
    v27 = objc_opt_isKindOfClass(v25, v26);

    if ((v27 & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DesignCapacity")));
      v21 = objc_msgSend(v28, "unsignedIntValue");

    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v15 = 0;
    v21 = 0;
    v77 = 0;
    v19 = 0;
  }
  uisocHistogramCache = self->_uisocHistogramCache;
  location = (id *)&self->_uisocHistogramCache;
  v71 = (void *)v13;
  v72 = v10;
  if (uisocHistogramCache && self->_temperatureHistogramCache)
  {
    v30 = self->_cRateHistogramCache ? v15 : 0;
    if (v30 == 1)
    {
      v73 = v19;
      locationa = v9;
      v31 = uisocHistogramCache;
      v32 = self->_temperatureHistogramCache;
      v33 = self->_cRateHistogramCache;
      v76 = 0;
LABEL_70:
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v81 = v8;
      v57 = v8;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      if (!v58)
        goto LABEL_86;
      v59 = v58;
      v60 = *(_QWORD *)v85;
      while (1)
      {
        for (i = 0; i != v59; i = (char *)i + 1)
        {
          if (*(_QWORD *)v85 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
          v63 = objc_msgSend(v62, "integerValue");
          if (v63 == (id)2)
          {
            v65 = v33;
            goto LABEL_81;
          }
          v64 = v63;
          if (v63 == (id)1)
          {
            v65 = v32;
            goto LABEL_81;
          }
          if (!v63)
          {
            v65 = v31;
LABEL_81:
            v66 = -[BIHistogram copyHistogramWithNormalizedCounts](v65, "copyHistogramWithNormalizedCounts");
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v66, v62);

            continue;
          }
          logger = v83->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v95 = v64;
            _os_log_error_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_ERROR, "Unknown BIFeatureType %lu", buf, 0xCu);
          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
        if (!v59)
        {
LABEL_86:

          v20 = v12;
          v9 = locationa;
          v8 = v81;
          v34 = (void *)v77;
          goto LABEL_96;
        }
      }
    }
  }
  v34 = (void *)v77;
  if (!v77)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    if (v19)
      goto LABEL_25;
LABEL_64:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "dateByAddingTimeInterval:", -2592000.0));
    goto LABEL_25;
  }
  if (!v19)
    goto LABEL_64;
LABEL_25:
  v73 = v19;
  if (v19
    && v34
    && (v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "laterDate:", v34)),
        v35,
        v35 == v19))
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001EEE0();
  }
  else
  {
    if (v21 || (v21 = sub_10001784C()) != 0)
    {
      v36 = self->_logger;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        sub_10001EF9C(v21, v36);
      v70 = v21;
      v77 = (uint64_t)v34;
      v82 = objc_alloc_init((Class)NSMutableSet);
      v80 = objc_alloc_init((Class)NSMutableArray);
      if (objc_msgSend(v8, "count"))
      {
        v38 = 0;
        v31 = 0;
        v32 = 0;
        v33 = 0;
        p_cRateHistogramCache = (id *)&self->_cRateHistogramCache;
        p_temperatureHistogramCache = (id *)&self->_temperatureHistogramCache;
        *(_QWORD *)&v37 = 134217984;
        v69 = v37;
        while (1)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v38, v69));
          v40 = objc_msgSend(v39, "integerValue");

          if (v40 == (id)2)
          {
            if (v9)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v38));
              if (v44)
              {
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v38));
                v46 = objc_retainBlock(v45);

              }
              else
              {
                v46 = objc_retainBlock(self->_defaultCRateBinner);
              }

            }
            else
            {
              v46 = objc_retainBlock(self->_defaultCRateBinner);
            }
            v52 = -[BIHistogram initWithBinLabelGenerator:allLabels:]([BIHistogram alloc], "initWithBinLabelGenerator:allLabels:", v46, &off_10002F0B0);

            objc_msgSend(v82, "addObject:", CFSTR("amperage"));
            objc_msgSend(v80, "addObject:", &off_10002F5A8);
            objc_storeStrong(p_cRateHistogramCache, v52);

            v33 = v52;
          }
          else if (v40 == (id)1)
          {
            if (v9)
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v38));
              if (v47)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v38));
                v49 = objc_retainBlock(v48);

              }
              else
              {
                v49 = objc_retainBlock(self->_defaultTemperatureBinner);
              }

            }
            else
            {
              v49 = objc_retainBlock(self->_defaultTemperatureBinner);
            }
            v53 = -[BIHistogram initWithBinLabelGenerator:allLabels:]([BIHistogram alloc], "initWithBinLabelGenerator:allLabels:", v49, &off_10002F098);

            objc_msgSend(v82, "addObject:", CFSTR("temp"));
            objc_msgSend(v80, "addObject:", &off_10002F5A8);
            objc_storeStrong(p_temperatureHistogramCache, v53);

            v32 = v53;
          }
          else
          {
            if (v40)
            {
              v50 = self->_logger;
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v69;
                v95 = v40;
                _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Unknown BIFeatureType %lu", buf, 0xCu);
              }
              goto LABEL_61;
            }
            if (v9)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v38));
              if (v41)
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v38));
                v43 = objc_retainBlock(v42);

              }
              else
              {
                v43 = objc_retainBlock(self->_defaultUISocBinner);
              }

            }
            else
            {
              v43 = objc_retainBlock(self->_defaultUISocBinner);
            }
            v51 = -[BIHistogram initWithBinLabelGenerator:allLabels:]([BIHistogram alloc], "initWithBinLabelGenerator:allLabels:", v43, &off_10002F080);

            objc_msgSend(v82, "addObject:", CFSTR("uisoc"));
            objc_msgSend(v80, "addObject:", &off_10002F5A8);
            objc_storeStrong(location, v51);

            v31 = v51;
          }
          self = v83;
LABEL_61:
          if ((unint64_t)objc_msgSend(v8, "count") <= ++v38)
            goto LABEL_66;
        }
      }
      v33 = 0;
      v32 = 0;
      v31 = 0;
LABEL_66:
      v34 = (void *)v77;
      v54 = -[BIDataEnumerator initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:]([BIDataEnumerator alloc], "initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:", v73, v77, CFSTR("BDC_SBC"), CFSTR("1.3"), 0);
      if (v54)
      {
        v55 = v54;
        if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
          sub_10001EF64();
        locationa = v9;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "allObjects"));
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_100012490;
        v88[3] = &unk_10002C900;
        v88[4] = self;
        v31 = v31;
        v89 = v31;
        v32 = v32;
        v90 = v32;
        v92 = v70;
        v33 = v33;
        v91 = v33;
        v76 = v55;
        -[BIFeatures resampleUsingEnumerator:forBDCDataColumns:samplingPeriodSeconds:aggregationTypes:callBack:](self, "resampleUsingEnumerator:forBDCDataColumns:samplingPeriodSeconds:aggregationTypes:callBack:", v55, v56, 900, v80, v88);

        goto LABEL_70;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001EF38();

      goto LABEL_95;
    }
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001EF0C();
  }
  v33 = 0;
  v32 = 0;
  v31 = 0;
LABEL_95:
  v20 = 0;
LABEL_96:

  v10 = v72;
LABEL_97:

  return v20;
}

- (id)getDeviceManufactureDate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v8;
  unsigned __int16 v9;

  v9 = 0;
  v8 = 0;
  if (sub_100017A94(&v9, &v8))
  {
    v3 = objc_alloc_init((Class)NSDateComponents);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierISO8601));
    objc_msgSend(v3, "setCalendar:", v4);

    objc_msgSend(v3, "setYear:", v9);
    objc_msgSend(v3, "setWeekOfYear:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendar"));
    objc_msgSend(v3, "setWeekday:", objc_msgSend(v5, "firstWeekday"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001F06C();
    v6 = 0;
  }
  return v6;
}

- (id)getDeviceAgeAtDate:(id)a3 usingManufactureDate:(id)a4
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4 / 31536000.0);
}

- (id)copyUsageHistory:(id)a3 withFeatureDimensions:(id)a4 withParams:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  BIDataEnumerator *v12;
  void *v13;
  void *v14;
  BIDataEnumerator *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
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
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *i;
  char *v56;
  void *v57;
  NSObject *logger;
  NSObject *v59;
  id v60;
  NSObject *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v74;
  void *v75;
  char *v76;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id obj;
  char *obja;
  uint64_t v87;
  BIDataEnumerator *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[3];
  uint8_t buf[4];
  char *v104;
  __int16 v105;
  id v106;
  __int16 v107;
  char *v108;
  __int16 v109;
  unint64_t v110;
  _BYTE v111[128];
  _QWORD v112[5];
  _QWORD v113[5];
  _BYTE v114[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = [BIDataEnumerator alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UsageHistoryStartDate")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UsageHistoryEndDate")));
  v15 = -[BIDataEnumerator initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:](v12, "initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:", v13, v14, CFSTR("BDC_SBC"), CFSTR("1.3"), 0);

  if (v15)
  {
    v84 = v8;
    v16 = v9;
    v93 = objc_alloc_init((Class)NSMutableArray);
    v92 = objc_alloc_init((Class)NSMutableArray);
    v91 = objc_alloc_init((Class)NSMutableArray);
    v90 = objc_alloc_init((Class)NSMutableArray);
    v89 = objc_alloc_init((Class)NSMutableArray);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F0C8));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UsageHistoryStartDate")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("UsageHistoryEndDate")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MaxUsageHistoryLenTimesteps")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BIDataEnumerator getBDCDataFromStartDate:toEndDate:forStream:withMetrics:withLimit:](v15, "getBDCDataFromStartDate:toEndDate:forStream:withMetrics:withLimit:", v18, v19, CFSTR("BDC_SBC"), v17, objc_msgSend(v20, "unsignedLongValue")));

    if (v21 && objc_msgSend(v21, "count"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BIDataEnumerator version](v15, "version"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BIFeatures getTimestampForEntry:atVersion:](self, "getTimestampForEntry:atVersion:", v22, v23));

      if (v24)
      {
        v25 = v24;
        v79 = v17;
        v80 = v11;
        v88 = v15;
        v83 = v10;
        v81 = v16;
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dateByAddingTimeInterval:", -300.0));
        v27 = v21;
        v28 = (id)v26;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        v82 = v27;
        obj = v27;
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
        if (v29)
        {
          v30 = v29;
          v87 = *(_QWORD *)v99;
          while (2)
          {
            v31 = 0;
            v32 = v28;
            v28 = v25;
            do
            {
              if (*(_QWORD *)v99 != v87)
                objc_enumerationMutation(obj);
              v33 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)v31);
              v34 = objc_autoreleasePoolPush();
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "metricKeysAndValues"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[BIDataEnumerator version](v88, "version"));
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[BIFeatures getTimestampForEntry:atVersion:](self, "getTimestampForEntry:atVersion:", v33, v36));

              if (!v37)
              {
                if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
                  sub_10001F1D4();

                objc_autoreleasePoolPop(v34);
                v64 = 0;
                v51 = 0;
                v63 = 0;
                v28 = v32;
                v10 = v83;
                v8 = v84;
                v11 = v80;
                v9 = v81;
                v15 = v88;
                v17 = v79;
                goto LABEL_52;
              }
              objc_msgSend(v37, "timeIntervalSinceDate:", v32);
              v39 = v38;
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Voltage")));
              objc_msgSend(v40, "floatValue");
              v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
              objc_msgSend(v93, "addObject:", v41);

              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Amperage")));
              objc_msgSend(v42, "floatValue");
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
              objc_msgSend(v92, "addObject:", v43);

              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Temperature")));
              objc_msgSend(v44, "floatValue");
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
              objc_msgSend(v91, "addObject:", v45);

              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ChargeAccum")));
              objc_msgSend(v46, "floatValue");
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
              objc_msgSend(v90, "addObject:", v47);

              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v39 / 60.0));
              objc_msgSend(v89, "addObject:", v48);

              objc_autoreleasePoolPop(v34);
              v28 = v37;

              v31 = (char *)v31 + 1;
              v32 = v28;
            }
            while (v30 != v31);
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v114, 16);
            v25 = v28;
            if (v30)
              continue;
            break;
          }
        }
        v77 = v25;

        v112[0] = CFSTR("voltageHistory");
        v112[1] = CFSTR("currentHistory");
        v113[0] = v93;
        v113[1] = v92;
        v112[2] = CFSTR("tempHistory");
        v112[3] = CFSTR("qHistory");
        v113[2] = v91;
        v113[3] = v90;
        v112[4] = CFSTR("timeSinceLastReadingMins");
        v113[4] = v89;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v113, v112, 5));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("MaxUsageHistoryLenTimesteps")));
        v78 = objc_msgSend(v50, "unsignedIntValue");

        obja = (char *)objc_msgSend(v93, "count");
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v51 = v49;
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v95;
          do
          {
            for (i = 0; i != v53; i = (char *)i + 1)
            {
              if (*(_QWORD *)v95 != v54)
                objc_enumerationMutation(v51);
              v56 = *(char **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKey:", v56));
              logger = self->_logger;
              if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
              {
                v59 = logger;
                v60 = objc_msgSend(v57, "count");
                *(_DWORD *)buf = 138413058;
                v104 = v56;
                v105 = 2048;
                v106 = v60;
                v107 = 2112;
                v108 = v56;
                v109 = 2112;
                v110 = (unint64_t)v57;
                _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%@ length: %lu \n %@: %@", buf, 0x2Au);

              }
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
          }
          while (v53);
        }

        if ((unint64_t)obja <= v78)
        {
          v10 = v83;
        }
        else
        {
          v61 = self->_logger;
          v10 = v83;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            v74 = v61;
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("UsageHistoryStartDate")));
            v76 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("UsageHistoryEndDate")));
            *(_DWORD *)buf = 134218754;
            v104 = obja;
            v105 = 2112;
            v106 = v75;
            v107 = 2112;
            v108 = v76;
            v109 = 2048;
            v110 = v78;
            _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "Actual usage history length = %lu pulled from start date %@ to end date %@ exceeds model max input length of %lu", buf, 0x2Au);

          }
          v62 = objc_claimAutoreleasedReturnValue(+[BITensor createSubArraysFromArrays:fromStartIndex:withSize:](BITensor, "createSubArraysFromArrays:fromStartIndex:withSize:", v51, &obja[-v78], v78));

          v51 = (id)v62;
          if (!v62)
          {
            if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
              sub_10001F11C();
            v51 = 0;
            v63 = 0;
            v8 = v84;
            v11 = v80;
            v9 = v81;
            goto LABEL_51;
          }
        }
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "allValues"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndex:", 0));
        v67 = objc_msgSend(v66, "count");

        v102[0] = &off_10002F5C0;
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v67));
        v102[1] = v68;
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "count")));
        v102[2] = v69;
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v102, 3));

        v9 = v81;
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKey:", CFSTR("usage_history_input")));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[BITensor create3DMultiArrayFromFeatureArrays:withInputShape:usingFeatureDimensionsDict:](BITensor, "create3DMultiArrayFromFeatureArrays:withInputShape:usingFeatureDimensionsDict:", v51, v70, v71));

        if (v72)
        {
          v11 = v80;
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v72, CFSTR("usage_history_input"));
          v8 = v84;
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
            sub_10001F174();
          v63 = v80;
        }
        else
        {
          v8 = v84;
          v11 = v80;
          if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
            sub_10001F148();
          v63 = 0;
        }

LABEL_51:
        v15 = v88;
        v17 = v79;
        v64 = v77;
LABEL_52:

        v21 = v82;
        goto LABEL_53;
      }
      v9 = v16;
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001F0F0();
      v63 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
        sub_10001F0C4();
      v63 = 0;
      v9 = v16;
    }
    v8 = v84;
LABEL_53:

    goto LABEL_54;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    sub_10001F098();
  v63 = 0;
LABEL_54:

  return v63;
}

- (id)parseHealthHistoryFromPPSData:(id)a3 withBDCversion:(id)a4 andParams:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  os_log_t *v20;
  void *v21;
  id v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  float v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v53;
  void *v54;
  id obj;
  uint64_t v56;
  id v57;
  void *v59;
  id v60;
  void *context;
  uint8_t v62;
  _BYTE v63[15];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _QWORD v74[6];

  v7 = a3;
  v60 = a4;
  v8 = a5;
  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v74[0] = CFSTR("nccpHistory");
  v74[1] = CFSTR("wraHistory");
  v74[2] = CFSTR("qmaxpHistory");
  v74[3] = CFSTR("cycleCountHistory");
  v74[4] = CFSTR("ageHistory");
  v74[5] = CFSTR("timeSinceLastReadingDays");
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 6));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v16 = objc_alloc_init((Class)NSMutableArray);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("DesignCapacity")));
  v18 = objc_msgSend(v17, "unsignedIntValue");

  v54 = v8;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ManufactureDate")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v20 = (os_log_t *)self;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BIFeatures getTimestampForEntry:atVersion:](self, "getTimestampForEntry:atVersion:", v19, v60));

  if (v21)
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateByAddingTimeInterval:", -86400.0));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v53 = v7;
    obj = v7;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v57)
    {
      v56 = *(_QWORD *)v65;
      v23 = (float)v18;
LABEL_11:
      v24 = 0;
      v25 = v22;
      v22 = v21;
      while (1)
      {
        if (*(_QWORD *)v65 != v56)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v24);
        v27 = objc_autoreleasePoolPush();
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "metricKeysAndValues"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t getTimestampForEntry:atVersion:](v20, "getTimestampForEntry:atVersion:", v26, v60));

        if (!v21)
          break;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t getDeviceAgeAtDate:usingManufactureDate:](v20, "getDeviceAgeAtDate:usingManufactureDate:", v21, v59));
        if (!v29)
        {
          v51 = v20[1];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            sub_10001F258(&v62, v63, v51);

LABEL_27:
          objc_autoreleasePoolPop(v27);

          v50 = 0;
          goto LABEL_28;
        }
        objc_msgSend(v21, "timeIntervalSinceDate:", v25);
        v31 = v30;
        context = v27;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("nccpHistory")));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("NominalChargeCapacity")));
        objc_msgSend(v33, "floatValue");
        *(float *)&v35 = v34 / v23;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35));
        objc_msgSend(v32, "addObject:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("wraHistory")));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("WeightedRa")));
        objc_msgSend(v38, "floatValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
        objc_msgSend(v37, "addObject:", v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("qmaxpHistory")));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Qmax0")));
        objc_msgSend(v41, "floatValue");
        *(float *)&v43 = v42 / v23;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v43));
        objc_msgSend(v40, "addObject:", v44);

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cycleCountHistory")));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("CycleCount")));
        objc_msgSend(v45, "addObject:", v46);

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ageHistory")));
        objc_msgSend(v47, "addObject:", v29);

        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeSinceLastReadingDays")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31 / 86400.0));
        objc_msgSend(v48, "addObject:", v49);

        v20 = (os_log_t *)self;
        objc_autoreleasePoolPop(context);
        v22 = v21;

        v24 = (char *)v24 + 1;
        v25 = v22;
        if (v57 == v24)
        {
          v21 = v22;
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
          if (v57)
            goto LABEL_11;
          goto LABEL_18;
        }
      }
      if (os_log_type_enabled(v20[1], OS_LOG_TYPE_ERROR))
        sub_10001F22C();
      goto LABEL_27;
    }
LABEL_18:

    v50 = v9;
    v25 = v22;
LABEL_28:

    v7 = v53;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
      sub_10001F200();
    v50 = 0;
  }

  return v50;
}

- (id)copyDailyHealthHistoryForFeatures:(id)a3 withFeatureDimensions:(id)a4 withParams:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  BIDataEnumerator *v15;
  void *v16;
  void *v17;
  BIDataEnumerator *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  os_log_t *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  void *j;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *k;
  char *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  id v66;
  unint64_t v67;
  NSObject *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  char *v83;
  void *v84;
  id v85;
  char *v86;
  unint64_t v87;
  id v88;
  BIDataEnumerator *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *log;
  os_log_t *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[3];
  uint8_t buf[4];
  char *v110;
  __int16 v111;
  id v112;
  __int16 v113;
  char *v114;
  __int16 v115;
  unint64_t v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _QWORD v119[6];
  _QWORD v120[6];
  _BYTE v121[128];
  _QWORD v122[2];
  _QWORD v123[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HealthHistoryStartDate")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HealthHistoryEndDate")));
  v14 = objc_msgSend(v12, "compare:", v13);

  if (v14 != (id)1)
  {
    v95 = (os_log_t *)self;
    v15 = [BIDataEnumerator alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HealthHistoryStartDate")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HealthHistoryEndDate")));
    v18 = -[BIDataEnumerator initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:](v15, "initWithStartDate:endDate:forBDCStream:atOrAboveVersion:usingDataFromCSVs:", v16, v17, CFSTR("BDC_Daily"), CFSTR("1.3"), 0);

    if (!v18)
    {
      if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR))
        sub_10001F2B8();
      goto LABEL_9;
    }
    v93 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("DesignCapacity")));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("DesignCapacity")));
      v21 = objc_msgSend(v20, "unsignedIntValue");

    }
    else
    {
      v21 = (id)sub_10001784C();
    }

    if (!(_DWORD)v21)
    {
      if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR))
        sub_10001F2E4();

      v22 = 0;
      goto LABEL_81;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ManufactureDate")));
    v92 = v10;
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ManufactureDate")));
      v25 = v95;
    }
    else
    {
      v25 = v95;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t getDeviceManufactureDate](v95, "getDeviceManufactureDate"));
    }

    v26 = v25[1];
    if (v24)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        sub_10001F648();
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HealthHistoryStartDate")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HealthHistoryEndDate")));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BIDataEnumerator getBDCDataFromStartDate:toEndDate:forStream:withMetrics:withLimit:](v18, "getBDCDataFromStartDate:toEndDate:forStream:withMetrics:withLimit:", v27, v28, CFSTR("BDC_Daily"), 0, 1000));

      if (v29 && objc_msgSend(v29, "count"))
      {
        v90 = v24;
        v91 = v29;
        v30 = v95[1];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          sub_10001F5D0(v30);
        v88 = v9;
        v89 = v18;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[BIDataEnumerator version](v18, "version"));
        v122[0] = CFSTR("DesignCapacity");
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v21));
        v122[1] = CFSTR("ManufactureDate");
        v123[0] = v32;
        v123[1] = v90;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 2));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_t parseHealthHistoryFromPPSData:withBDCversion:andParams:](v95, "parseHealthHistoryFromPPSData:withBDCversion:andParams:", v29, v31, v33));

        if (os_log_type_enabled(v95[1], OS_LOG_TYPE_DEBUG))
          sub_10001F570();
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v105;
          while (2)
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v105 != v38)
                objc_enumerationMutation(v35);
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)i)));
              v41 = objc_msgSend(v40, "count");

              if (!v41)
              {
                v71 = v95[1];
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                  sub_10001F4F8(v71);
                v22 = 0;
                v43 = v35;
                v9 = v88;
                goto LABEL_70;
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
            if (v37)
              continue;
            break;
          }
        }

        v42 = objc_alloc_init((Class)NSMutableDictionary);
        v119[0] = &off_10002F5D8;
        v119[1] = &off_10002F5F0;
        v120[0] = CFSTR("nccpHistory");
        v120[1] = CFSTR("wraHistory");
        v119[2] = &off_10002F608;
        v119[3] = &off_10002F620;
        v120[2] = CFSTR("qmaxpHistory");
        v120[3] = CFSTR("cycleCountHistory");
        v119[4] = &off_10002F638;
        v119[5] = &off_10002F650;
        v120[4] = CFSTR("ageHistory");
        v120[5] = CFSTR("timeSinceLastReadingDays");
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v120, v119, 6));
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        v85 = v8;
        v44 = v8;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v101;
          do
          {
            for (j = 0; j != v46; j = (char *)j + 1)
            {
              if (*(_QWORD *)v101 != v47)
                objc_enumerationMutation(v44);
              v49 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)j);
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v49));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v50));
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v49));
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v51, v52);

            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v100, v118, 16);
          }
          while (v46);
        }

        if (os_log_type_enabled(v95[1], OS_LOG_TYPE_DEBUG))
          sub_10001F498();
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("MaxHealthHistoryLenDays")));
        v87 = objc_msgSend(v53, "unsignedIntValue");

        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndex:", 0));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v54));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", v55));
        v86 = (char *)objc_msgSend(v56, "count");

        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v57 = v42;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v97;
          do
          {
            for (k = 0; k != v59; k = (char *)k + 1)
            {
              if (*(_QWORD *)v97 != v60)
                objc_enumerationMutation(v57);
              v62 = *(char **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)k);
              v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", v62));
              v64 = v95[1];
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v65 = v64;
                v66 = objc_msgSend(v63, "count");
                *(_DWORD *)buf = 138413058;
                v110 = v62;
                v111 = 2048;
                v112 = v66;
                v113 = 2112;
                v114 = v62;
                v115 = 2112;
                v116 = (unint64_t)v63;
                _os_log_debug_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "%@ length: %lu \n %@: %@", buf, 0x2Au);

              }
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v117, 16);
          }
          while (v59);
        }

        v67 = v87;
        if ((unint64_t)v86 <= v87)
        {
          v8 = v85;
          v9 = v88;
        }
        else
        {
          v68 = v95[1];
          v8 = v85;
          v9 = v88;
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            log = v68;
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("HealthHistoryStartDate")));
            v67 = v87;
            v83 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("HealthHistoryEndDate")));
            *(_DWORD *)buf = 134218754;
            v110 = v86;
            v111 = 2112;
            v112 = v84;
            v113 = 2112;
            v114 = v83;
            v115 = 2048;
            v116 = v87;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Actual daily history length = %lu pulled from start date %@ to end date %@ exceeds model max input length of %lu", buf, 0x2Au);

          }
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[BITensor createSubArraysFromArrays:fromStartIndex:withSize:](BITensor, "createSubArraysFromArrays:fromStartIndex:withSize:", v57, &v86[-v87], v67));
          v70 = objc_msgSend(v69, "copy");

          v57 = v70;
          if (!v70)
          {
            if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR))
              sub_10001F3A0();
            v22 = 0;
LABEL_70:
            v10 = v92;
            v72 = v90;
            goto LABEL_80;
          }
        }
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "allValues"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectAtIndex:", 0));
        v75 = objc_msgSend(v74, "count");

        v108[0] = &off_10002F5C0;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v75));
        v108[1] = v76;
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v57, "count")));
        v108[2] = v77;
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v108, 3));

        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("daily_history_input")));
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[BITensor create3DMultiArrayFromFeatureArrays:withInputShape:usingFeatureDimensionsDict:](BITensor, "create3DMultiArrayFromFeatureArrays:withInputShape:usingFeatureDimensionsDict:", v57, v78, v79));

        if (v80)
        {
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v80, CFSTR("daily_history_input"));
          v81 = v95[1];
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            sub_10001F3F8(v81, v57);
          v22 = v93;
          v72 = v90;
        }
        else
        {
          v72 = v90;
          if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR))
            sub_10001F3CC();
          v22 = 0;
        }

        v10 = v92;
LABEL_80:

        goto LABEL_81;
      }
      if (os_log_type_enabled(v95[1], OS_LOG_TYPE_ERROR))
        sub_10001F33C();

    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10001F310();

    }
    v22 = 0;
    v10 = v92;
LABEL_81:
    v11 = v93;
    goto LABEL_82;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    sub_10001F28C();
LABEL_9:
  v22 = 0;
LABEL_82:

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startCyclesCache, 0);
  objc_storeStrong((id *)&self->_startAgeCache, 0);
  objc_storeStrong((id *)&self->_startQMaxpCache, 0);
  objc_storeStrong((id *)&self->_startWRaCache, 0);
  objc_storeStrong((id *)&self->_startNCCPCache, 0);
  objc_storeStrong((id *)&self->_cRateHistogramCache, 0);
  objc_storeStrong((id *)&self->_temperatureHistogramCache, 0);
  objc_storeStrong((id *)&self->_uisocHistogramCache, 0);
  objc_storeStrong(&self->_defaultCRateBinner, 0);
  objc_storeStrong(&self->_defaultTemperatureBinner, 0);
  objc_storeStrong(&self->_defaultUISocBinner, 0);
  objc_storeStrong((id *)&self->_samplingQueue, 0);
  objc_storeStrong((id *)&self->_storageLocation, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
