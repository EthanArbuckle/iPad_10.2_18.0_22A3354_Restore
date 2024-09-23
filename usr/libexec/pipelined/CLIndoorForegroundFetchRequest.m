@implementation CLIndoorForegroundFetchRequest

- (CLIndoorForegroundFetchRequest)initWithFloorRequests:(id)a3 forAction:(unsigned __int8)a4
{
  id v7;
  CLIndoorForegroundFetchRequest *v8;
  CLIndoorForegroundFetchRequest *v9;

  v7 = a3;
  v8 = -[CLIndoorForegroundFetchRequest init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_floorRequests, a3);
    v9->_action = a4;
  }

  return v9;
}

- (CLIndoorForegroundFetchRequest)init
{
  CLIndoorForegroundFetchRequest *v2;
  uint64_t v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLIndoorForegroundFetchRequest;
  v2 = -[CLIndoorForegroundFetchRequest init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

  }
  return v2;
}

- (BOOL)allFloorsDownloaded
{
  unint64_t v3;

  v3 = -[CLIndoorForegroundFetchRequest numFloorsSuccessfullyDownloaded](self, "numFloorsSuccessfullyDownloaded");
  return v3 == -[CLIndoorForegroundFetchRequest numExpectedFloors](self, "numExpectedFloors");
}

- (unint64_t)numExpectedFloors
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorForegroundFetchRequest floorRequests](self, "floorRequests"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSArray)floorRequests
{
  return self->_floorRequests;
}

- (void)requestDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  int v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v4 = a3;
  if (-[CLIndoorForegroundFetchRequest isRequestValid:](self, "isRequestValid:", v4))
  {
    -[CLIndoorForegroundFetchRequest setNumFloorsSuccessfullyDownloaded:](self, "setNumFloorsSuccessfullyDownloaded:", (char *)-[CLIndoorForegroundFetchRequest numFloorsSuccessfullyDownloaded](self, "numFloorsSuccessfullyDownloaded")+ 1);
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407200);
    v5 = (id)qword_100417F00;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = -[CLIndoorForegroundFetchRequest numFloorsSuccessfullyDownloaded](self, "numFloorsSuccessfullyDownloaded");
      v7 = -[CLIndoorForegroundFetchRequest numExpectedFloors](self, "numExpectedFloors");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueUuid")));
      v9 = objc_msgSend(v8, "UTF8String");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "floorUuid")));
      v11 = 134218755;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      v15 = 2081;
      v16 = v9;
      v17 = 2081;
      v18 = objc_msgSend(v10, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received floor %lu of %lu for venue ID %{private}s|%{private}s", (uint8_t *)&v11, 0x2Au);

    }
  }

}

- (unint64_t)numFloorsSuccessfullyDownloaded
{
  return self->_numFloorsSuccessfullyDownloaded;
}

- (void)setNumFloorsSuccessfullyDownloaded:(unint64_t)a3
{
  self->_numFloorsSuccessfullyDownloaded = a3;
}

- (BOOL)isRequestValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *__p[2];
  _BYTE buf[12];
  __int16 v18;
  id v19;
  char v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorForegroundFetchRequest uuid](self, "uuid"));
  if (!v5)
  {
    sub_1000D5048(buf, "");
    sub_100174738((uint64_t)buf, 0, 0);
    if (v20 < 0)
      operator delete(*(void **)buf);
    sub_1000F2AE4((uint64_t)__p);
  }

  if (!v4)
  {
    sub_1000D5048(buf, "");
    sub_100174738((uint64_t)buf, 0, 0);
    if (v20 < 0)
      operator delete(*(void **)buf);
    sub_10015C2DC((uint64_t)__p);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorForegroundFetchRequest uuid](self, "uuid"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407200);
    v9 = (id)qword_100417F00;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestUUID"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString")));
      v12 = objc_msgSend(v11, "UTF8String");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorForegroundFetchRequest uuid](self, "uuid"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString")));
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v12;
      v18 = 2080;
      v19 = objc_msgSend(v14, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got request complete for an outdated request. Received %s but expecting %s. Ignoring", buf, 0x16u);

    }
  }

  return v8;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorRequests, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)requestDidComplete:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;

  v6 = a3;
  v7 = a4;
  if (-[CLIndoorForegroundFetchRequest isRequestValid:](self, "isRequestValid:", v6))
  {
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407200);
    v8 = (id)qword_100417F00;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venueUuid")));
      v9 = objc_msgSend(v13, "UTF8String");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "floorUuid")));
      v11 = objc_msgSend(v10, "UTF8String");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
      *(_DWORD *)buf = 136381699;
      v15 = v9;
      v16 = 2081;
      v17 = v11;
      v18 = 2080;
      v19 = objc_msgSend(v12, "UTF8String");
      v20 = 2048;
      v21 = -[CLIndoorForegroundFetchRequest numFloorsSuccessfullyDownloaded](self, "numFloorsSuccessfullyDownloaded");
      v22 = 2048;
      v23 = -[CLIndoorForegroundFetchRequest numExpectedFloors](self, "numExpectedFloors");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get a floor for venue ID %{private}s|%{private}s because %s\nHave %lu of %lu floors", buf, 0x34u);

    }
  }

}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setFloorRequests:(id)a3
{
  objc_storeStrong((id *)&self->_floorRequests, a3);
}

- (void)setAction:(unsigned __int8)a3
{
  self->_action = a3;
}

@end
