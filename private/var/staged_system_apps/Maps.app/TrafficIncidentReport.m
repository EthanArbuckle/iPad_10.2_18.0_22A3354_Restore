@implementation TrafficIncidentReport

- (TrafficIncidentReport)initWithType:(int)a3 countryCodeUponCreation:(id)a4
{
  id v7;
  TrafficIncidentReport *v8;
  TrafficIncidentReport *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TrafficIncidentReport;
  v8 = -[TrafficIncidentReport init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_incidentType = a3;
    objc_storeStrong((id *)&v8->_countryCodeUponCreation, a4);
    -[TrafficIncidentReport _commonInit](v9, "_commonInit");
  }

  return v9;
}

- (TrafficIncidentReport)initWithIncidentLocation:(id)a3 type:(int)a4 userPath:(int)a5
{
  id v9;
  TrafficIncidentReport *v10;
  TrafficIncidentReport *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TrafficIncidentReport;
  v10 = -[TrafficIncidentReport init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_incidentLocation, a3);
    v11->_incidentType = a4;
    v11->_userPath = a5;
    -[TrafficIncidentReport _commonInit](v11, "_commonInit");
  }

  return v11;
}

- (TrafficIncidentReport)initWithUserLocation:(id)a3 type:(int)a4 userPath:(int)a5
{
  id v9;
  TrafficIncidentReport *v10;
  TrafficIncidentReport *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TrafficIncidentReport;
  v10 = -[TrafficIncidentReport init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_userLocation, a3);
    v11->_incidentType = a4;
    v11->_userPath = a5;
    -[TrafficIncidentReport _commonInit](v11, "_commonInit");
  }

  return v11;
}

- (void)_commonInit
{
  NSUUID *v3;
  NSUUID *uniqueID;
  NSDate *v5;
  NSDate *incidentUpdateTime;

  v3 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  uniqueID = self->_uniqueID;
  self->_uniqueID = v3;

  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  incidentUpdateTime = self->_incidentUpdateTime;
  self->_incidentUpdateTime = v5;

  self->_submissionCount = 0;
  -[GEOLocation clearSensitiveFields:](self->_incidentLocation, "clearSensitiveFields:", 0);
  -[GEOLocation clearSensitiveFields:](self->_userLocation, "clearSensitiveFields:", 0);
}

- (TrafficIncidentReport)initWithCoder:(id)a3
{
  id v4;
  TrafficIncidentReport *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TrafficIncidentReport;
  v5 = -[TrafficIncidentReport init](&v17, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOLocation), CFSTR("incidentLocation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TrafficIncidentReport setIncidentLocation:](v5, "setIncidentLocation:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOLocation), CFSTR("userLocation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[TrafficIncidentReport setUserLocation:](v5, "setUserLocation:", v9);

    -[TrafficIncidentReport setIncidentType:](v5, "setIncidentType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("incidentType")));
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("incidentId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[TrafficIncidentReport setIncidentId:](v5, "setIncidentId:", v11);

    -[TrafficIncidentReport setAnnotationType:](v5, "setAnnotationType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("annotationType")));
    -[TrafficIncidentReport setUserPath:](v5, "setUserPath:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("userPath")));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("uniqueID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[TrafficIncidentReport setUniqueID:](v5, "setUniqueID:", v13);

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("incidentUpdateTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[TrafficIncidentReport setIncidentUpdateTime:](v5, "setIncidentUpdateTime:", v15);

    -[TrafficIncidentReport setSiriContext:](v5, "setSiriContext:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("siriContext")));
    -[TrafficIncidentReport setHidden:](v5, "setHidden:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden")));
    -[TrafficIncidentReport setReportedFromCarplay:](v5, "setReportedFromCarplay:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reportedFromCarplay")));
    -[TrafficIncidentReport setSubmissionFailed:](v5, "setSubmissionFailed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("submissionFailed")));
    -[TrafficIncidentReport setSubmissionCount:](v5, "setSubmissionCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("submissionCount")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport incidentLocation](self, "incidentLocation"));
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("incidentLocation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport userLocation](self, "userLocation"));
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("userLocation"));

  objc_msgSend(v9, "encodeInt32:forKey:", -[TrafficIncidentReport incidentType](self, "incidentType"), CFSTR("incidentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport incidentId](self, "incidentId"));
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("incidentId"));

  objc_msgSend(v9, "encodeInt32:forKey:", -[TrafficIncidentReport annotationType](self, "annotationType"), CFSTR("annotationType"));
  objc_msgSend(v9, "encodeInt32:forKey:", -[TrafficIncidentReport userPath](self, "userPath"), CFSTR("userPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport uniqueID](self, "uniqueID"));
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("uniqueID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport incidentUpdateTime](self, "incidentUpdateTime"));
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("incidentUpdateTime"));

  objc_msgSend(v9, "encodeBool:forKey:", -[TrafficIncidentReport isSiriContext](self, "isSiriContext"), CFSTR("siriContext"));
  objc_msgSend(v9, "encodeBool:forKey:", -[TrafficIncidentReport isHidden](self, "isHidden"), CFSTR("hidden"));
  objc_msgSend(v9, "encodeBool:forKey:", -[TrafficIncidentReport isReportedFromCarplay](self, "isReportedFromCarplay"), CFSTR("reportedFromCarplay"));
  objc_msgSend(v9, "encodeBool:forKey:", -[TrafficIncidentReport submissionFailed](self, "submissionFailed"), CFSTR("submissionFailed"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[TrafficIncidentReport submissionCount](self, "submissionCount"), CFSTR("submissionCount"));

}

- (BOOL)isEqual:(id)a3
{
  TrafficIncidentReport *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = (TrafficIncidentReport *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport uniqueID](v4, "uniqueID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport uniqueID](self, "uniqueID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
      v10 = objc_msgSend(v7, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  NSUUID *uniqueID;
  uint64_t incidentType;
  void *v5;
  GEOLocation *incidentLocation;
  GEOLocation *userLocation;
  uint64_t userPath;
  void *v9;
  unint64_t submissionCount;
  NSString *incidentId;
  int v12;
  void *v13;
  void *v14;

  uniqueID = self->_uniqueID;
  incidentType = self->_incidentType;
  if (incidentType >= 0x12)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_incidentType));
  else
    v5 = (void *)*((_QWORD *)&off_1011C9D98 + incidentType);
  incidentLocation = self->_incidentLocation;
  userLocation = self->_userLocation;
  userPath = self->_userPath;
  if (userPath >= 7)
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_userPath));
  else
    v9 = (void *)*((_QWORD *)&off_1011C9D60 + userPath);
  submissionCount = self->_submissionCount;
  incidentId = self->_incidentId;
  v12 = self->_annotationType - 1;
  if (v12 >= 4)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_annotationType));
  else
    v13 = (void *)*((_QWORD *)&off_1011C9E28 + v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("uniqueID: %@ incidentType: %@ incidentLocation: %@ userLocation: %@ userPath:%@,TransitPassManager submissionCount: %lu, incidentId :%@, annotationType:%@"), uniqueID, v5, incidentLocation, userLocation, v9, submissionCount, incidentId, v13));

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)personalizedItemKey
{
  return CFSTR("TrafficIncidentReport");
}

- (id)mapItemLocation
{
  GEOLocation *incidentLocation;

  incidentLocation = self->_incidentLocation;
  if (!incidentLocation)
    incidentLocation = self->_userLocation;
  return incidentLocation;
}

- (double)timestamp
{
  uint64_t v3;
  double v4;
  double result;

  -[GEOLocation timestamp](self->_incidentLocation, "timestamp");
  v3 = 64;
  if (v4 != 0.0)
    v3 = 56;
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "timestamp");
  return result;
}

+ (int)actionForVoteType:(int)a3
{
  if ((a3 - 1) > 3)
    return 107;
  else
    return dword_100E3BFE0[a3 - 1];
}

- (NSString)displayText
{
  return (NSString *)+[TrafficIncidentLayoutItem defaultDisplayTextForType:](TrafficIncidentLayoutItem, "defaultDisplayTextForType:", -[TrafficIncidentReport incidentType](self, "incidentType"));
}

- (NSString)descriptionText
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKTrafficSupport sharedTrafficSupport](MKTrafficSupport, "sharedTrafficSupport"));
  v4 = -[TrafficIncidentReport incidentType](self, "incidentType");
  if (v4 > 6)
  {
    if (v4 == 7)
    {
      v5 = v3;
      v6 = 1;
      goto LABEL_11;
    }
    if (v4 == 16)
    {
      v5 = v3;
      v6 = 13;
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 == 5)
    {
      v5 = v3;
      v6 = 0;
      goto LABEL_11;
    }
    if (v4 == 6)
    {
      v5 = v3;
      v6 = 4;
LABEL_11:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedReportedByYouForGEOIncidentType:", v6));
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Incident [OON, Report Incident]"), CFSTR("localized string not found"), 0));

LABEL_12:
  return (NSString *)v8;
}

- (void)submitWithCompletionHandler:(id)a3
{
  int annotationType;
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  annotationType = self->_annotationType;
  v5 = a3;
  v6 = sub_1004327DC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (annotationType)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Submitting feedback", buf, 2u);
    }

    -[TrafficIncidentReport submitFeedbackForType:incidentId:completionHandler:](self, "submitFeedbackForType:incidentId:completionHandler:", self->_annotationType, self->_incidentId, v5);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Submitting new report", v9, 2u);
    }

    -[TrafficIncidentReport submitWithAttachedImages:comments:completionHandler:](self, "submitWithAttachedImages:comments:completionHandler:", 0, 0, v5);
  }

}

- (void)submitWithAttachedImages:(id)a3 comments:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
  objc_msgSend(v11, "addReport:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceRecentLocations sharedInstance](DeviceRecentLocations, "sharedInstance"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10080DC44;
  v16[3] = &unk_1011C9C70;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "updateLocationsWithCompletionHandler:", v16);

}

- (void)submitFeedbackForType:(int)a3 incidentId:(id)a4 completionHandler:(id)a5
{
  uint64_t v7;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  int incidentType;
  void *v27;
  id v28;
  NSObject *v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  id v32;
  id location;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  void *v37;

  v7 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if ((_DWORD)v7 == 4 && (sub_100BA14A8() & 1) == 0)
  {
    v28 = sub_1004327DC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Submitting Feedback for AUTO_UP_VOTE is disabled", buf, 2u);
    }

    if (v10)
      v10[2](v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentLocation"));

    v13 = objc_alloc_init((Class)GEORPIncidentAnnotationDetails);
    v14 = objc_alloc_init((Class)GEORPUserLocationDetails);
    objc_msgSend(v13, "setUserLocation:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userLocation"));
    objc_msgSend(v15, "setCurrentUserLocation:", v12);

    objc_msgSend(v13, "setAnnotationType:", v7);
    objc_msgSend(v13, "setIncidentId:", v9);
    objc_msgSend(v13, "setIncidentType:", self->_incidentType);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOLocation latLng](self->_incidentLocation, "latLng"));
    objc_msgSend(v13, "setIncidentLocation:", v16);

    self->_annotationType = v7;
    objc_storeStrong((id *)&self->_incidentId, a4);
    objc_storeStrong((id *)&self->_userLocation, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
    objc_msgSend(v17, "addReport:", self);

    if ((_DWORD)v7 == 3 || v9)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
      objc_msgSend(v18, "hideReport:", self);

    }
    objc_initWeak(&location, self);
    v19 = objc_alloc((Class)GEORPFeedbackRequestParameters);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentReport _incidentUserPath](self, "_incidentUserPath"));
    v21 = objc_msgSend(v19, "initWithIncidentAnnotationDetails:userPath:", v13, v20);

    v22 = sub_100BA18A8();
    if ((_DWORD)v7 == 4)
      v23 = 0;
    else
      v23 = v22;
    v24 = sub_1004327DC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      incidentType = self->_incidentType;
      if ((v7 - 1) >= 4)
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v7));
      else
        v27 = (void *)*((_QWORD *)&off_1011C9E28 + (int)v7 - 1);
      *(_DWORD *)buf = 67109378;
      v35 = incidentType;
      v36 = 2112;
      v37 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Submitting incident feedback: %d annotationType %@", buf, 0x12u);

    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10080E20C;
    v30[3] = &unk_1011B0520;
    objc_copyWeak(&v32, &location);
    v31 = v10;
    -[TrafficIncidentReport _submitFeedbackRequestParameters:attachedImages:comments:requireAuthenication:completionHandler:](self, "_submitFeedbackRequestParameters:attachedImages:comments:requireAuthenication:completionHandler:", v21, 0, 0, v23, v30);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

- (void)_submitFeedbackRequestParameters:(id)a3 attachedImages:(id)a4 comments:(id)a5 requireAuthenication:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = v15;
  if (v15)
    (*((void (**)(id))v15 + 2))(v15);
  if (v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentAuthenticationManager sharedInstance](TrafficIncidentAuthenticationManager, "sharedInstance"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10080E3A0;
    v18[3] = &unk_1011C9C98;
    v18[4] = self;
    v19 = v12;
    v20 = v13;
    v21 = v14;
    objc_msgSend(v17, "generateAuthenticationInfoWithCompletionHandler:", v18);

  }
  else
  {
    -[TrafficIncidentReport _submitFeedbackRequestParameters:attachedImages:comments:userInfo:](self, "_submitFeedbackRequestParameters:attachedImages:comments:userInfo:", v12, v13, v14, 0);
  }

}

- (void)_submitFeedbackRequestParameters:(id)a3 attachedImages:(id)a4 comments:(id)a5 userInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  TrafficIncidentReport *v32;
  char v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_100BA16A8();
  v15 = v14;
  if (v12 && v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submissionParameters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commonCorrections"));

    if (!v17)
    {
      v18 = objc_alloc_init((Class)GEORPFeedbackCommonCorrections);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submissionParameters"));
      objc_msgSend(v19, "setCommonCorrections:", v18);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submissionParameters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "commonCorrections"));
    objc_msgSend(v21, "setComments:", v12);

  }
  if (sub_100BA1AA8())
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPFeedbackRequest clientTestingDebugSettings](GEORPFeedbackRequest, "clientTestingDebugSettings"));
  else
    v22 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10080E624;
  v27[3] = &unk_1011AD458;
  v33 = v15;
  v28 = v10;
  v29 = v11;
  v30 = v13;
  v31 = v22;
  v32 = self;
  v23 = v22;
  v24 = v13;
  v25 = v11;
  v26 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v27);

}

- (void)_displayInternalErrorAlert
{
  void *v3;
  unsigned int v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    v5 = -[TrafficIncidentReport submissionCount](self, "submissionCount");
    if (v5 >= GEOConfigGetUInteger(MapsConfig_TrafficIncidentsStorageMaxSubmissionCount, off_1014B35B8))
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1011C9CE0);
  }
}

- (id)_processLocations:(id)a3
{
  id v3;
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (char *)objc_msgSend(v3, "count");
    if ((unint64_t)objc_msgSend(v3, "count") <= 0x78)
      v5 = (uint64_t)objc_msgSend(v3, "count");
    else
      v5 = 120;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", &v4[-v5], (_BYTE *)objc_msgSend(v3, "count") - &v4[-v5]));
    v8 = sub_10039DCD4(v7, &stru_1011C9D40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_incidentUserPath
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = objc_alloc_init((Class)GEORPIncidentUserPath);
  objc_msgSend(v3, "addUserPath:", self->_userPath);
  objc_msgSend(v3, "setReportedFromCarplay:", self->_reportedFromCarplay);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = objc_msgSend(v4, "isInNavigatingState");

  if (v5)
  {
    objc_msgSend(v3, "setNavigationActive:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v3, "setTransportType:", objc_msgSend(v6, "navigationTransportType"));

  }
  return v3;
}

- (BOOL)isSiriContext
{
  return self->_siriContext;
}

- (void)setSiriContext:(BOOL)a3
{
  self->_siriContext = a3;
}

- (BOOL)isReportedFromCarplay
{
  return self->_reportedFromCarplay;
}

- (void)setReportedFromCarplay:(BOOL)a3
{
  self->_reportedFromCarplay = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)submissionFailed
{
  return self->_submissionFailed;
}

- (void)setSubmissionFailed:(BOOL)a3
{
  self->_submissionFailed = a3;
}

- (unint64_t)submissionCount
{
  return self->_submissionCount;
}

- (void)setSubmissionCount:(unint64_t)a3
{
  self->_submissionCount = a3;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (int)incidentType
{
  return self->_incidentType;
}

- (void)setIncidentType:(int)a3
{
  self->_incidentType = a3;
}

- (NSDate)incidentUpdateTime
{
  return self->_incidentUpdateTime;
}

- (void)setIncidentUpdateTime:(id)a3
{
  objc_storeStrong((id *)&self->_incidentUpdateTime, a3);
}

- (NSString)countryCodeUponCreation
{
  return self->_countryCodeUponCreation;
}

- (GEOLocation)incidentLocation
{
  return self->_incidentLocation;
}

- (void)setIncidentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_incidentLocation, a3);
}

- (GEOLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (NSString)incidentId
{
  return self->_incidentId;
}

- (void)setIncidentId:(id)a3
{
  objc_storeStrong((id *)&self->_incidentId, a3);
}

- (int)annotationType
{
  return self->_annotationType;
}

- (void)setAnnotationType:(int)a3
{
  self->_annotationType = a3;
}

- (int)userPath
{
  return self->_userPath;
}

- (void)setUserPath:(int)a3
{
  self->_userPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_incidentLocation, 0);
  objc_storeStrong((id *)&self->_countryCodeUponCreation, 0);
  objc_storeStrong((id *)&self->_incidentUpdateTime, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
