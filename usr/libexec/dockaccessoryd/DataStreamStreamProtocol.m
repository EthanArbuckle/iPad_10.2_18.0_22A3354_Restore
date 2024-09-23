@implementation DataStreamStreamProtocol

+ (id)protocolName
{
  return CFSTR("stream");
}

- (DataStreamStreamProtocol)initWithDataStream:(id)a3
{
  id v4;
  DataStreamStreamProtocol *v5;
  uint64_t v6;
  NSMapTable *sockets;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DataStreamStreamProtocol;
  v5 = -[DataStreamStreamProtocol init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    sockets = v5->_sockets;
    v5->_sockets = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_dataStream, v4);
  }

  return v5;
}

- (void)registerSocket:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = -[DataStreamStreamProtocol isActive](self, "isActive");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationProtocolName"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 12));
  objc_msgSend(v11, "closeWithError:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationProtocolName"));
  objc_msgSend(v9, "setObject:forKey:", v4, v10);

  -[DataStreamStreamProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v5);
}

- (void)unregisterSocket:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[DataStreamStreamProtocol isActive](self, "isActive");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationProtocolName"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  if (v7 == v10)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationProtocolName"));
    objc_msgSend(v8, "removeObjectForKey:", v9);

    -[DataStreamStreamProtocol _notifyActiveStatusChangedFromPreviousValue:](self, "_notifyActiveStatusChangedFromPreviousValue:", v4);
    -[DataStreamStreamProtocol _reevaluateTrafficClassForDataStream](self, "_reevaluateTrafficClassForDataStream");
  }

}

- (void)_reevaluateTrafficClassForDataStream
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  DataStreamStreamProtocol *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  DataStreamStreamProtocol *v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_sockets, "objectEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "trafficClass");
        if ((unint64_t)v11 > v7)
        {
          v12 = (unint64_t)v11;
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationProtocolName"));

          v6 = (void *)v13;
          v7 = v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v5);

    if (v6)
    {
      v14 = self;
      v16 = sub_10007CCE4((uint64_t)v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = sub_10007CD2C(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138543874;
        v31 = v19;
        v32 = 2048;
        v33 = v7;
        v34 = 2112;
        v35 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (requested by: '%@')", buf, 0x20u);

      }
      goto LABEL_17;
    }
  }
  else
  {

    v7 = 0;
  }
  v20 = self;
  v22 = sub_10007CCE4((uint64_t)v20, v21);
  v17 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v23 = sub_10007CD2C(v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138543618;
    v31 = v24;
    v32 = 2048;
    v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (reset)", buf, 0x16u);

  }
  v6 = 0;
LABEL_17:

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol dataStream](self, "dataStream"));
  objc_msgSend(v25, "setTrafficClass:", v7);

}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  DataStreamStreamProtocol *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  if (-[DataStreamStreamProtocol isActive](self, "isActive") != a3)
  {
    v4 = self;
    v6 = sub_10007CCE4((uint64_t)v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = sub_10007CD2C(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = HMFBooleanToString(-[DataStreamStreamProtocol isActive](v4, "isActive"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Stream protocol changes active to %@", (uint8_t *)&v13, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol dataStream](v4, "dataStream"));
    objc_msgSend(v12, "protocolDidUpdateActiveStatus:", v4);

  }
}

- (void)sendData:(id)a3 socket:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  const __CFString *v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol dataStream](self, "dataStream"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationProtocolName"));

  v17 = CFSTR("data");
  v18 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000304E4;
  v15[3] = &unk_100236EF0;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v11, "sendEventForProtocol:topic:payload:completion:", CFSTR("stream"), v12, v13, v15);

}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)dataStreamInitiatedClose:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets", a3, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "closeInitiated");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)dataStreamDidClose:(id)a3
{
  -[DataStreamStreamProtocol _closeAllSocketsWithError:](self, "_closeAllSocketsWithError:", 0);
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  -[DataStreamStreamProtocol _closeAllSocketsWithError:](self, "_closeAllSocketsWithError:", a4);
}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  DataStreamStreamProtocol *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  id v23;
  __CFString *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v8 = a4;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));

  if (!v11)
  {
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v25 = 138543874;
      v26 = v18;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v19 = "%{public}@No active socket, dropping packet with topic=%@ payload=%@";
      v20 = v16;
      v21 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, (uint8_t *)&v25, 0x20u);

    }
LABEL_9:

    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data")));

  if (!v12)
  {
    v13 = self;
    v23 = sub_10007CCE4((uint64_t)v13, v22);
    v16 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v25 = 138543874;
      v26 = v18;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v19 = "%{public}@No data field in payload, dropping packet with topic=%@ payload=%@";
      v20 = v16;
      v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v13 = (DataStreamStreamProtocol *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data")));
  objc_msgSend(v11, "handleIncomingData:", v13);
LABEL_10:

}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v9;
  id v10;
  id v11;
  DataStreamStreamProtocol *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = self;
  v14 = sub_10007CCE4((uint64_t)v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_10007CD2C(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = 138544130;
    v19 = v17;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support request message with topic=%@, header=%@, payload=%@", (uint8_t *)&v18, 0x2Au);

  }
}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  id v9;
  id v10;
  id v11;
  DataStreamStreamProtocol *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = self;
  v14 = sub_10007CCE4((uint64_t)v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_10007CD2C(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = 138544130;
    v19 = v17;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support response message with topic=%@, header=%@, payload=%@", (uint8_t *)&v18, 0x2Au);

  }
}

- (void)_closeAllSocketsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        if (v11)
          objc_msgSend(v11, "closeWithError:", v4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamStreamProtocol sockets](self, "sockets"));
  objc_msgSend(v12, "removeAllObjects");

}

- (NSMapTable)sockets
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (DataStreamProtocolDelegate)dataStream
{
  return (DataStreamProtocolDelegate *)objc_loadWeakRetained((id *)&self->_dataStream);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStream);
  objc_storeStrong((id *)&self->_sockets, 0);
}

@end
