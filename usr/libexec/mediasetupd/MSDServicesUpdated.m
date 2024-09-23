@implementation MSDServicesUpdated

- (MSDServicesUpdated)initWithUpdatedData:(id)a3 cachedData:(id)a4
{
  id v7;
  id v8;
  MSDServicesUpdated *v9;
  MSDServicesUpdated *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSDServicesUpdated;
  v9 = -[MSDServicesUpdated init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cachedData, a4);
    objc_storeStrong((id *)&v10->_updatedData, a3);
  }

  return v10;
}

+ (id)servicesUpdated:(id)a3 cachedData:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithUpdatedData:cachedData:", v7, v6);

  return v8;
}

- (void)processChangesInServices
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  unsigned int v23;
  NSArray *cachedData;
  void *v25;
  id v26;
  NSObject *v27;
  dispatch_time_t v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_map:](self->_cachedData, "na_map:", &stru_100048A50));
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_map:](self->_updatedData, "na_map:", &stru_100048A70));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = objc_msgSend(v6, "count");
  if (v7 != objc_msgSend(v4, "count"))
  {
    v8 = objc_msgSend(v6, "count");
    v9 = objc_msgSend(v4, "count");
    v10 = sub_10002E034();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8 <= v9)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "A service was deleted on device", buf, 2u);
      }

      v13 = objc_msgSend(v6, "copy");
      v14 = objc_msgSend(v4, "copy");
      -[MSDServicesUpdated _handleServiceRemoved:cachedDataIDS:](self, "_handleServiceRemoved:cachedDataIDS:", v13, v14);
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "A service was added on device", buf, 2u);
      }

      v13 = objc_msgSend(v6, "copy");
      v14 = objc_msgSend(v4, "copy");
      -[MSDServicesUpdated _handleServiceAdded:cachedDataIDS:](self, "_handleServiceAdded:cachedDataIDS:", v13, v14);
    }

  }
  v29 = v6;
  v30 = v4;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = self->_updatedData;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    v19 = MSDefaultServiceRecordType;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "recordType", v29, v30));
        v23 = objc_msgSend(v22, "isEqualToString:", v19);

        if (v23)
        {
          -[MSDServicesUpdated _handleDefaultServiceChanged:](self, "_handleDefaultServiceChanged:", v21);
        }
        else
        {
          cachedData = self->_cachedData;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10000527C;
          v32[3] = &unk_100048A98;
          v32[4] = v21;
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_firstObjectPassingTest:](cachedData, "na_firstObjectPassingTest:", v32));
          if (v25)
          {
            v26 = sub_10002E034();
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "A service was updated on device", buf, 2u);
            }

            v28 = dispatch_time(0, 500000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000538C;
            block[3] = &unk_100048AC0;
            block[4] = v21;
            dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);
          }

        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v17);
  }

}

- (void)_handleServiceAdded:(id)a3 cachedDataIDS:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a4;
  v7 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "removeObjectsInArray:", v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000553C;
  v8[3] = &unk_100048AE8;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)_handleServiceRemoved:(id)a3 cachedDataIDS:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a3;
  v7 = objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v7, "removeObjectsInArray:", v6);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005878;
  v8[3] = &unk_100048AE8;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)_handleDefaultServiceChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *cachedData;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSArray *updatedData;
  void *v15;
  id v16;
  NSObject *v17;
  dispatch_time_t v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[8];
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homeUserID"));
  cachedData = self->_cachedData;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100005D28;
  v25[3] = &unk_100048A98;
  v9 = v7;
  v26 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_firstObjectPassingTest:](cachedData, "na_firstObjectPassingTest:", v25));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "service"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serviceID"));
  v13 = objc_msgSend(v12, "isEqual:", v6);

  if ((v13 & 1) == 0)
  {
    updatedData = self->_updatedData;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100005DA8;
    v22[3] = &unk_100048B10;
    v23 = v9;
    v24 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray na_firstObjectPassingTest:](updatedData, "na_firstObjectPassingTest:", v22));
    if (v15)
    {
      v16 = sub_10002E034();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "DefaultService was updated on device", buf, 2u);
      }

      v18 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005E68;
      block[3] = &unk_100048AC0;
      v20 = v15;
      dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (NSArray)updatedData
{
  return self->_updatedData;
}

- (void)setUpdatedData:(id)a3
{
  objc_storeStrong((id *)&self->_updatedData, a3);
}

- (NSArray)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedData, 0);
  objc_storeStrong((id *)&self->_updatedData, 0);
}

@end
