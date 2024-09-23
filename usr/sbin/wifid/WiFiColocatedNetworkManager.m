@implementation WiFiColocatedNetworkManager

- (WiFiColocatedNetworkManager)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-[WiFiColocatedNetworkManager init] unavailable"), 0));
  objc_exception_throw(v2);
}

- (WiFiColocatedNetworkManager)initWithNetwork:(id)a3 colocatedNetworks:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WiFiColocatedNetworkManager *v9;
  WiFiColocatedNetworkManager *v10;
  WiFiColocatedNetworkManager *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v13.receiver = self;
  v13.super_class = (Class)WiFiColocatedNetworkManager;
  v9 = -[WiFiColocatedNetworkManager init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    -[WiFiColocatedNetworkManager setColocatedNetworks:](v9, "setColocatedNetworks:", v7);
    -[WiFiColocatedNetworkManager setJoinedNetwork:](v10, "setJoinedNetwork:", v6);
    -[WiFiColocatedNetworkManager _reduceNetworks](v10, "_reduceNetworks");
  }
  v11 = v10;
  objc_autoreleasePoolPop(v8);

  return v11;
}

- (unint64_t)numberOfCandidates
{
  return -[NSArray count](self->_colocatedNetworks, "count");
}

- (id)retrieveNextCandidate
{
  NSArray *v3;
  void *v4;
  NSArray *colocatedNetworks;

  v3 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", self->_colocatedNetworks);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](v3, "lastObject"));
  -[NSArray removeLastObject](v3, "removeLastObject");
  colocatedNetworks = self->_colocatedNetworks;
  self->_colocatedNetworks = v3;

  return v4;
}

- (id)_reduceNumberOfCandidatesTo:(unint64_t)a3 on:(unsigned int)a4
{
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int16 v34[8];
  _BYTE v35[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
  v7 = objc_msgSend(v6, "band");

  if (v7 == 3 || (v8 = _os_feature_enabled_impl("CoreWiFi", "LegacySSIDTransitionUI"), (v8 & 1) != 0))
  {
    v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
    v11 = objc_msgSend(v10, "band");

    if (v11 != a4)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v12 = self->_colocatedNetworks;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            v18 = objc_autoreleasePoolPush();
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "channel"));
            v20 = objc_msgSend(v19, "band");

            if (v20 == a4)
            {
              -[NSObject addObject:](v9, "addObject:", v17);
              if (-[NSObject count](v9, "count") == (id)a3)
              {
                objc_autoreleasePoolPop(v18);
                goto LABEL_15;
              }
            }
            objc_autoreleasePoolPop(v18);
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_15:

    }
    if (-[NSObject count](v9, "count"))
      v21 = v9;
    else
      v21 = 0;
    v22 = v21;
  }
  else
  {
    v24 = CWFGetOSLog(v8);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)v25;
    if (v25)
    {
      v27 = CWFGetOSLog(v25);
      v9 = objc_claimAutoreleasedReturnValue(v27);
    }
    else
    {
      v9 = &_os_log_default;
      v28 = &_os_log_default;
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v34[0] = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[corewifi] SSID Transition: Legacy SSID networks not enabled", v34, 2);
    }
    v22 = 0;
  }

  return v22;
}

- (void)_reduceNetworks
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  NSArray *v13;
  NSArray *colocatedNetworks;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[WiFiColocatedNetworkManager _reduceNumberOfCandidatesTo:on:](self, "_reduceNumberOfCandidatesTo:on:", 1, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiColocatedNetworkManager _reduceNumberOfCandidatesTo:on:](self, "_reduceNumberOfCandidatesTo:on:", 1, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiColocatedNetworkManager _reduceNumberOfCandidatesTo:on:](self, "_reduceNumberOfCandidatesTo:on:", 1, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
  v6 = objc_msgSend(v5, "is2GHz");

  if (v6)
  {
    if (v3)
    {
      v7 = v3;
      goto LABEL_6;
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CWFScanResult channel](self->_joinedNetwork, "channel"));
    v9 = objc_msgSend(v8, "is5GHz");

    if (!v9)
    {
      v7 = v15;
      if (!v15)
      {
        v11 = v3;
        goto LABEL_11;
      }
      v10 = v3;
      goto LABEL_10;
    }
    v7 = v15;
    if (v15)
    {
LABEL_6:
      v10 = v4;
LABEL_10:
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10));
      goto LABEL_11;
    }
  }
  v11 = v4;
LABEL_11:
  v12 = v11;
  v13 = (NSArray *)objc_msgSend(v11, "copy");
  colocatedNetworks = self->_colocatedNetworks;
  self->_colocatedNetworks = v13;

}

- (CWFScanResult)joinedNetwork
{
  return (CWFScanResult *)objc_getProperty(self, a2, 8, 1);
}

- (void)setJoinedNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)colocatedNetworks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setColocatedNetworks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colocatedNetworks, 0);
  objc_storeStrong((id *)&self->_joinedNetwork, 0);
}

@end
