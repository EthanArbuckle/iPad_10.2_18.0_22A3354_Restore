@implementation ReportIncidentActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  int v30;
  uint8_t buf[8];
  const __CFString *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(ReportIncidentAction);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    if ((objc_msgSend(v9, "isLocationServicesEnabled") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v11 = objc_msgSend(v10, "isAuthorizedForPreciseLocation");

      if ((v11 & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v13 = objc_msgSend(v12, "isLocationServicesPossiblyAvailable");

        if ((v13 & 1) == 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
          objc_msgSend(v14, "promptLocationServicesOff");
LABEL_11:

          goto LABEL_12;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incidentIntent"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "incidentType"));
        v16 = +[TrafficIncidentIntentSupport incidentTypeForINTrafficIncidentType:](TrafficIncidentIntentSupport, "incidentTypeForINTrafficIncidentType:", objc_msgSend(v15, "type"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "isClear"));
        if (objc_msgSend(v17, "BOOLValue"))
        {

        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "additionalDetails"));
          v21 = objc_msgSend(v20, "isEqual:", CFSTR("update"));

          if (!v21)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
            if (v16 >= 0x12)
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v16));
            else
              v26 = off_1011DD790[(int)v16];
            objc_msgSend(v25, "captureUserAction:onTarget:eventValue:", 2152, 0, v26);

            v27 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_10099C194;
            v28[3] = &unk_1011C5EA0;
            v30 = v16;
            v29 = v7;
            objc_msgSend(v27, "fetchTrafficIncidentsLayout:", v28);

            v23 = v29;
            goto LABEL_20;
          }
        }
        v32 = CFSTR("SiriTrafficIncidentIsClearKey");
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "isClear"));
        v33 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("SiriTrafficIncidentUpdateNotification"), a1, v23);

LABEL_20:
        goto LABEL_11;
      }
    }
    else
    {

    }
    v18 = sub_1004327DC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "ReportIncidentActionHandler: precise location is disabled", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v14, "promptPreciseLocationOff");
    goto LABEL_11;
  }
LABEL_12:

}

@end
