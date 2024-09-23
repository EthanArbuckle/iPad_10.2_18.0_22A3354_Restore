@implementation FMFUpdateGeoFenceCommand

- (FMFUpdateGeoFenceCommand)initWithClientSession:(id)a3 andFence:(id)a4
{
  id v6;
  FMFUpdateGeoFenceCommand *v7;
  id v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMFUpdateGeoFenceCommand;
  v7 = -[FMFBaseCmd initWithClientSession:](&v11, "initWithClientSession:", a3);
  if (v7)
  {
    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand initialized for fence: %@", buf, 0xCu);
    }

    -[FMFUpdateGeoFenceCommand setFence:](v7, "setFence:", v6);
  }

  return v7;
}

- (id)pathSuffix
{
  return CFSTR("updateGeoFence");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
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
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSMutableArray *v44;
  NSMutableArray *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *i;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  uint8_t buf[4];
  void *v68;
  _BYTE v69[128];

  v66.receiver = self;
  v66.super_class = (Class)FMFUpdateGeoFenceCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v66, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFUpdateGeoFenceCommand fence](self, "fence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFUpdateGeoFenceCommand fence](self, "fence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placemark"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("id"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "friendIdentifier"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "friendIdentifier"));
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("friendId"));

  }
  if (objc_msgSend(v5, "isActive"))
    v14 = CFSTR("true");
  else
    v14 = CFSTR("false");
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("isOn"));
  if (objc_msgSend(v5, "isRecurring"))
    v15 = CFSTR("false");
  else
    v15 = CFSTR("true");
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("onetimeonly"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("type"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trigger"));
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("trigger"));

  if (objc_msgSend(v5, "shouldUseCloudKitStore"))
  {
    objc_msgSend(v4, "setObject:forKey:", &off_1000A0F78, CFSTR("locationType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", kCLLocationCoordinate2DInvalid.latitude));
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("latitude"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", kCLLocationCoordinate2DInvalid.longitude));
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("longitude"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("radius"));
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "label"));
    if (v21)
    {
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("label"));
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("label"));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "streetAddress"));
    if (v23)
    {
      objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("address"));
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("address"));

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedAddress"));
    if (v25)
    {
      objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("prettyAddress"));
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("prettyAddress"));

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "streetName"));
    if (v27)
    {
      objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("streetName"));
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("streetName"));

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryValue"));
    if (v29)
    {
      objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("fullAddress"));
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("fullAddress"));

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "label"));
    if (v31)
    {
      objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("prettyAddress"));
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("prettyAddress"));

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "locationType")));
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("locationType"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
    objc_msgSend(v34, "coordinate");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("latitude"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
    objc_msgSend(v36, "coordinate");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v37));
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("longitude"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "location"));
    objc_msgSend(v39, "horizontalAccuracy");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("radius"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "schedule"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dictionary"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("fenceTimeRange"));

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipients"));
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    v61 = v7;
    v44 = objc_opt_new(NSMutableArray);
    v45 = objc_opt_new(NSMutableArray);
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipients"));
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "identifier"));
          -[NSMutableArray addObject:](v44, "addObject:", v52);

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serverId"));
          if (v53)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serverId"));
            -[NSMutableArray addObject:](v45, "addObject:", v54);

          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v48);
    }

    if (-[NSMutableArray count](v44, "count"))
      objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("emails"));
    v7 = v61;
    if (-[NSMutableArray count](v45, "count"))
      objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("ids"));

  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "acceptanceStatus"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v55, CFSTR("acceptanceStatus"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ckRecordName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("ckRecordName"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ckRecordZoneOwnerName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v57, CFSTR("ckRecordZoneOwnerName"));

  v58 = sub_100011D0C();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v4;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand jsonBodyDictionary: %@", buf, 0xCu);
  }

  return v4;
}

- (void)processCommandResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  int64_t v20;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMFUpdateGeoFenceCommand;
  -[FMFBaseCmd processCommandResponse:](&v18, "processCommandResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("commandResponse")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_nullToNil"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("statusMap")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_nullToNil"));

    if (v8)
    {
      v9 = sub_100011D0C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = (int64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand contacts_status_map : %@", buf, 0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keysOfEntriesPassingTest:", &stru_10009A750));
      -[FMFUpdateGeoFenceCommand setNonNotifiableRecipients:](self, "setNonNotifiableRecipients:", v11);

    }
  }
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[FMFBaseCmd commandStatus](self, "commandStatus");
    *(_DWORD *)buf = 134217984;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand processCommandResponse status code %lu", buf, 0xCu);
  }

  v15 = sub_100011D0C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
    *(_DWORD *)buf = 138412290;
    v20 = (int64_t)v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand processCommandResponse : %@", buf, 0xCu);

  }
  -[FMFUpdateGeoFenceCommand processCommandError](self, "processCommandError");

}

- (void)processCommandError
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString **v16;
  NSErrorUserInfoKey *v17;
  void *v18;
  id v19;
  NSObject *v20;
  int v21;
  void *v22;
  NSErrorUserInfoKey v23;
  const __CFString *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;
  NSErrorUserInfoKey v37;
  const __CFString *v38;
  NSErrorUserInfoKey v39;
  const __CFString *v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;

  v3 = -[FMFBaseCmd commandStatus](self, "commandStatus");
  switch(v3)
  {
    case 541:
      v4 = FMFFenceErrorDomain;
      v41 = NSLocalizedDescriptionKey;
      v42 = CFSTR("iOS version needs to be upgraded");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
      v6 = v4;
      v7 = 1;
      goto LABEL_14;
    case 542:
      v9 = FMFFenceErrorDomain;
      v39 = NSLocalizedDescriptionKey;
      v40 = CFSTR("App version needs to be upgraded");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
      v6 = v9;
      v7 = 0;
      goto LABEL_14;
    case 543:
      v10 = FMFFenceErrorDomain;
      v37 = NSLocalizedDescriptionKey;
      v38 = CFSTR("Geofencing is disabled");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      v6 = v10;
      v7 = 2;
      goto LABEL_14;
    case 544:
      v11 = FMFFenceErrorDomain;
      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("Me device upgrade is needed");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v6 = v11;
      v7 = 3;
      goto LABEL_14;
    case 545:
      v12 = FMFFenceErrorDomain;
      v35 = NSLocalizedDescriptionKey;
      v36 = CFSTR("No me device set");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
      v6 = v12;
      v7 = 4;
      goto LABEL_14;
    case 546:
      v13 = FMFFenceErrorDomain;
      v29 = NSLocalizedDescriptionKey;
      v30 = CFSTR("Me device upgrade is needed");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      v6 = v13;
      v7 = 5;
      goto LABEL_14;
    case 547:
      v14 = FMFFenceErrorDomain;
      v33 = NSLocalizedDescriptionKey;
      v34 = CFSTR("Cannot set a fence for that region");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
      v6 = v14;
      v7 = 6;
      goto LABEL_14;
    case 548:
      v15 = FMFFenceErrorDomain;
      v27 = NSLocalizedDescriptionKey;
      v28 = CFSTR("The user has reached the maximum number of notify others fences");
      v16 = &v28;
      v17 = &v27;
      goto LABEL_13;
    case 549:
      v15 = FMFFenceErrorDomain;
      v25 = NSLocalizedDescriptionKey;
      v26 = CFSTR("The user has reached the maximum number of fences");
      v16 = &v26;
      v17 = &v25;
LABEL_13:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v17, 1));
      v6 = v15;
      v7 = 7;
      goto LABEL_14;
    default:
      if (v3 != 411)
        return;
      v8 = FMFFenceErrorDomain;
      v23 = NSLocalizedDescriptionKey;
      v24 = CFSTR("The fence cannot be set");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
      v6 = v8;
      v7 = 9;
LABEL_14:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, v7, v5));

      if (v18)
      {
        v19 = sub_100011D0C();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand: Error processed: %@", (uint8_t *)&v21, 0xCu);
        }

        -[FMFUpdateGeoFenceCommand setError:](self, "setError:", v18);
      }
      return;
  }
}

- (FMFFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
  objc_storeStrong((id *)&self->_fence, a3);
}

- (NSSet)nonNotifiableRecipients
{
  return self->_nonNotifiableRecipients;
}

- (void)setNonNotifiableRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_nonNotifiableRecipients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonNotifiableRecipients, 0);
  objc_storeStrong((id *)&self->_fence, 0);
}

@end
