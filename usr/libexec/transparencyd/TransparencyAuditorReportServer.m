@implementation TransparencyAuditorReportServer

+ (void)makeReports:(id)a3 additionalData:(id)a4 auditorURI:(id)a5 logClient:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void (**v34)(id, void *);
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  int v43;
  dispatch_queue_attr_t v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  id v48;
  id v49;
  void (**v50)(id, void *);
  void (**v51)(id, void *);
  NSObject *group;
  uint64_t v53;
  uint64_t v54;
  id obj;
  void *v56;
  _QWORD block[4];
  void (**v58)(id, void *);
  _BYTE *v59;
  _QWORD v60[4];
  NSObject *v61;
  _BYTE *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _BYTE v77[128];

  v11 = a3;
  v12 = a4;
  v48 = a5;
  v49 = a6;
  v50 = (void (**)(id, void *))a7;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v69;
    v15 = kTransparencyAuditorReportApplication;
    v53 = kTransparencyAuditorReportUUID;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v69 != v14)
          objc_enumerationMutation(obj);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v16)));
        v18 = v17;
        if (v12)
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("userInput"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v15));
        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v19));
          v21 = v20 == 0;

          if (v21)
          {
            if (qword_1002A7880 != -1)
              dispatch_once(&qword_1002A7880, &stru_1002489C8);
            v29 = (void *)qword_1002A7888;
            if (os_log_type_enabled((os_log_t)qword_1002A7888, OS_LOG_TYPE_ERROR))
            {
              v30 = v29;
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v53));
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v19;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "skipping auditor report with unknown application %@ : %@", buf, 0x16u);

            }
          }
          else
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v19));
            v23 = v22 == 0;

            if (v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v24, v19);

            }
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v19));
            objc_msgSend(v25, "addObject:", v18);

          }
        }
        else
        {
          if (qword_1002A7880 != -1)
            dispatch_once(&qword_1002A7880, &stru_1002489A8);
          v26 = (void *)qword_1002A7888;
          if (os_log_type_enabled((os_log_t)qword_1002A7888, OS_LOG_TYPE_ERROR))
          {
            v27 = v26;
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v53));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "skipping auditor report with missing application: %@", buf, 0xCu);

          }
        }

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v13);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "allKeys"));
  v33 = objc_msgSend(v32, "count") == 0;

  if (v33)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInterface, -178, CFSTR("no auditor reports with valid applications")));
    v50[2](v50, v47);

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v74 = sub_1001561B0;
    v75 = sub_1001561C0;
    v76 = 0;
    group = dispatch_group_create();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v34 = v56;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v65;
      v54 = kTransparencyErrorInterface;
      v51 = v34;
LABEL_26:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v65 != v36)
          objc_enumerationMutation(v34);
        v38 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v38));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v39))
        {
          v63 = 0;
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v39, 0, &v63));
          v42 = v63;
          if (v41)
          {
            dispatch_group_enter(group);
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_1001561C8;
            v60[3] = &unk_1002489F0;
            v62 = buf;
            v34 = v51;
            v61 = group;
            objc_msgSend(v49, "postReport:uuid:application:completionHandler:", v41, v40, v38, v60);

            v43 = 0;
          }
          else
          {
            v50[2](v50, v42);
            v43 = 1;
          }

        }
        else
        {
          v42 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v54, -300, CFSTR("auditor report is not a valid JSON object")));
          v50[2](v50, v42);
          v43 = 1;
        }

        if (v43)
          break;
        if (v35 == (id)++v37)
        {
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
          if (v35)
            goto LABEL_26;
          goto LABEL_38;
        }
      }
    }
    else
    {
LABEL_38:

      v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      v46 = dispatch_queue_create("com.apple.transparency.auditReports", v45);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10015621C;
      block[3] = &unk_10023F2D8;
      v58 = v50;
      v59 = buf;
      dispatch_group_notify(group, v46, block);

      v34 = v58;
    }

    _Block_object_dispose(buf, 8);
  }

}

@end
