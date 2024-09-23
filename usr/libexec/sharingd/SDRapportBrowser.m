@implementation SDRapportBrowser

+ (SDRapportBrowser)sharedRapportBrowser
{
  if (qword_1007C6720 != -1)
    dispatch_once(&qword_1007C6720, &stru_100716778);
  return (SDRapportBrowser *)(id)qword_1007C6728;
}

- (SDRapportBrowser)init
{
  SDRapportBrowser *v2;
  SDRapportBrowser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SDRapportBrowser;
  v2 = -[SDRapportBrowser init](&v5, "init");
  v3 = v2;
  if (v2)
    -[SDRapportBrowser updateUltraWideBandStateTo:](v2, "updateUltraWideBandStateTo:", 0);
  return v3;
}

- (void)start
{
  uint64_t v3;
  NSObject *v4;
  int64_t startCount;
  int64_t v6;
  _DWORD v7[2];

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    startCount = self->_startCount;
    v7[0] = 67109120;
    v7[1] = startCount;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Rapport Browser start, current request count %d", (uint8_t *)v7, 8u);
  }

  v6 = self->_startCount;
  if (!v6)
  {
    -[SDRapportBrowser _start](self, "_start");
    v6 = self->_startCount;
  }
  self->_startCount = v6 + 1;
}

- (void)stop
{
  int64_t startCount;
  uint64_t v4;
  NSObject *v5;
  int64_t v6;
  _DWORD v7[2];

  startCount = self->_startCount;
  if (startCount <= 1)
    startCount = 1;
  self->_startCount = startCount - 1;
  v4 = airdrop_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_startCount;
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Rapport Browser stop, current request count %d", (uint8_t *)v7, 8u);
  }

  if (!self->_startCount)
    -[SDRapportBrowser _stop](self, "_stop");
}

- (void)_start
{
  uint64_t v3;
  NSObject *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedNodes;
  RPPeopleDiscovery *v7;
  RPPeopleDiscovery *peopleDiscovery;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  RPPeopleDiscovery *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[8];

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Rapport Browser start", buf, 2u);
  }

  -[SDRapportBrowser stopHandoffAdvertisingIfAppropriate](self, "stopHandoffAdvertisingIfAppropriate");
  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  cachedNodes = self->_cachedNodes;
  self->_cachedNodes = v5;

  v7 = (RPPeopleDiscovery *)objc_alloc_init((Class)RPPeopleDiscovery);
  peopleDiscovery = self->_peopleDiscovery;
  self->_peopleDiscovery = v7;

  -[RPPeopleDiscovery setChangeFlags:](self->_peopleDiscovery, "setChangeFlags:", 0xFFFFFFFFLL);
  -[RPPeopleDiscovery setDiscoveryFlags:](self->_peopleDiscovery, "setDiscoveryFlags:", 16);
  -[RPPeopleDiscovery setDiscoveryFlags:](self->_peopleDiscovery, "setDiscoveryFlags:", -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 4);
  -[RPPeopleDiscovery setDiscoveryFlags:](self->_peopleDiscovery, "setDiscoveryFlags:", -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 8);
  -[RPPeopleDiscovery setDiscoveryFlags:](self->_peopleDiscovery, "setDiscoveryFlags:", -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 0x80);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v10 = objc_msgSend(v9, "enableStrangers");

  if (v10)
  {
    v12 = airdrop_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enabling Stranger Discovery", buf, 2u);
    }

    -[RPPeopleDiscovery setDiscoveryFlags:](self->_peopleDiscovery, "setDiscoveryFlags:", -[RPPeopleDiscovery discoveryFlags](self->_peopleDiscovery, "discoveryFlags") | 0x400);
  }
  -[RPPeopleDiscovery setDiscoveryMode:](self->_peopleDiscovery, "setDiscoveryMode:", 1);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000B18BC;
  v22[3] = &unk_1007167A0;
  objc_copyWeak(&v23, (id *)buf);
  -[RPPeopleDiscovery setPersonFoundHandler:](self->_peopleDiscovery, "setPersonFoundHandler:", v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000B19C0;
  v20[3] = &unk_1007167C8;
  objc_copyWeak(&v21, (id *)buf);
  -[RPPeopleDiscovery setPersonChangedHandler:](self->_peopleDiscovery, "setPersonChangedHandler:", v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000B1A74;
  v18[3] = &unk_1007167A0;
  objc_copyWeak(&v19, (id *)buf);
  -[RPPeopleDiscovery setPersonLostHandler:](self->_peopleDiscovery, "setPersonLostHandler:", v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B1B74;
  v16[3] = &unk_1007145D0;
  objc_copyWeak(&v17, (id *)buf);
  -[RPPeopleDiscovery setStatusChangedHandler:](self->_peopleDiscovery, "setStatusChangedHandler:", v16);
  -[RPPeopleDiscovery setInterruptionHandler:](self->_peopleDiscovery, "setInterruptionHandler:", &stru_1007167E8);
  -[RPPeopleDiscovery setInvalidationHandler:](self->_peopleDiscovery, "setInvalidationHandler:", &stru_100716808);
  v14 = self->_peopleDiscovery;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B1C84;
  v15[3] = &unk_1007147C8;
  v15[4] = self;
  -[RPPeopleDiscovery activateWithCompletion:](v14, "activateWithCompletion:", v15);
  -[SDRapportBrowser addObservers](self, "addObservers");
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)_stop
{
  uint64_t v3;
  NSObject *v4;
  RPPeopleDiscovery *peopleDiscovery;
  uint8_t v6[16];

  v3 = airdrop_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Rapport Browser stop", v6, 2u);
  }

  -[SDRapportBrowser updateUltraWideBandStateTo:](self, "updateUltraWideBandStateTo:", 0);
  -[SDRapportBrowser removeObservers](self, "removeObservers");
  -[RPPeopleDiscovery invalidate](self->_peopleDiscovery, "invalidate");
  peopleDiscovery = self->_peopleDiscovery;
  self->_peopleDiscovery = 0;

  -[SDRapportBrowser resumeHandoffAdvertisingIfAppropriate](self, "resumeHandoffAdvertisingIfAppropriate");
}

- (void)updateUltraWideBandStateTo:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;

  if (self->_ultraWideBandState != a3)
  {
    self->_ultraWideBandState = a3;
    v4 = airdrop_log(self);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 2)
        v6 = "?";
      else
        v6 = off_100716850[a3];
      v8 = 136315138;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "UWB state changed to %s", (uint8_t *)&v8, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.RapportStatusChanged"), 0, 0);

  }
}

- (void)contactsChanged:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[NSMutableDictionary removeAllObjects](self->_cachedNodes, "removeAllObjects", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPPeopleDiscovery discoveredPeople](self->_peopleDiscovery, "discoveredPeople"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[SDRapportBrowser addOrUpdateNodesForPerson:withChanges:](self, "addOrUpdateNodesForPerson:withChanges:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), 0);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.RapportChanged"), 0, 0);

}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "contactsChanged:", CFSTR("com.apple.sharingd.ContactsChanged"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (NSArray)nodes
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_cachedNodes, "allValues");
}

- (void)addOrUpdateNodesForPerson:(id)a3 withChanges:(unsigned int)a4
{
  id v6;
  void *v7;
  __SFNode *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  __SFNode *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  unsigned int v22;
  uint8_t buf[4];
  __SFNode *v24;
  __int16 v25;
  id v26;

  v6 = a3;
  if ((objc_msgSend(v6, "flags") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000B239C;
    v21[3] = &unk_100716830;
    v21[4] = self;
    v22 = a4;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v21);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = (__SFNode *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedNodes, "objectForKeyedSubscript:", v7));

    v10 = objc_msgSend((id)objc_opt_class(self, v9), "personHasAirDropEligibleDevice:", v6);
    if ((_DWORD)v10)
    {
      if (v8)
      {
        if ((a4 & 8) != 0)
          objc_msgSend((id)objc_opt_class(self, v11), "updateRangingMeasurementForPerson:inNode:", v6, v8);
      }
      else if (v7 || (v14 = objc_msgSend(v6, "flags"), ((unsigned __int16)v14 & 0x100) != 0))
      {
        v17 = -[SDRapportBrowser createSFNodeFromRPPerson:](self, "createSFNodeFromRPPerson:", v6);
        v18 = airdrop_log(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v17;
            v25 = 2112;
            v26 = v6;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Adding SFNode %@ for %@", buf, 0x16u);
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedNodes, "setObject:forKeyedSubscript:", v17, v7);
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            sub_1000B39AC();

        }
      }
      else
      {
        v15 = airdrop_log(v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          sub_1000B3940();

      }
    }
    else if (v8)
    {
      v12 = airdrop_log(v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v8;
        v25 = 2112;
        v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Removing SFNode %@ for RPPerson %@", buf, 0x16u);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedNodes, "setObject:forKeyedSubscript:", 0, v7);
    }
  }

}

- (void)removeNodesForPerson:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "identifiersForPerson:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);

  -[NSMutableDictionary removeObjectsForKeys:](self->_cachedNodes, "removeObjectsForKeys:", v7);
}

- (id)assertionIdentifier
{
  uint64_t v3;

  v3 = objc_opt_class(self, a2);
  return (id)NSPrintF("%@: %{ptr}", v3, self);
}

- (BOOL)shouldStopHandoffAdvertising
{
  return GestaltGetBoolean(CFSTR("R1Capability"), 0, 0) != 0;
}

- (void)stopHandoffAdvertisingIfAppropriate
{
  void *v3;
  id v4;

  if (-[SDRapportBrowser shouldStopHandoffAdvertising](self, "shouldStopHandoffAdvertising"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](SDActivityAdvertiser, "sharedAdvertiser"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser assertionIdentifier](self, "assertionIdentifier"));
    objc_msgSend(v4, "stopForReason:", v3);

  }
}

- (void)resumeHandoffAdvertisingIfAppropriate
{
  void *v3;
  id v4;

  if (-[SDRapportBrowser shouldStopHandoffAdvertising](self, "shouldStopHandoffAdvertising"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](SDActivityAdvertiser, "sharedAdvertiser"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser assertionIdentifier](self, "assertionIdentifier"));
    objc_msgSend(v4, "resumeForReason:", v3);

  }
}

+ (void)updateRangingMeasurementForPerson:(id)a3 inNode:(__SFNode *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  void *i;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  __SFNode *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  NSObject *v52;
  _BYTE v53[128];

  v6 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v8)
  {
    v10 = v8;
    v38 = a4;
    v39 = v6;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v16 = objc_msgSend((id)objc_opt_class(a1, v9), "deviceIsEligibleForAirDrop:", v15);
        v17 = magic_head_log();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v19)
          {
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativeLocation"));
            *(_DWORD *)buf = 138412546;
            v46 = v15;
            v47 = 2112;
            v48 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Device %@ with location %@ eligible for AirDrop", buf, 0x16u);

          }
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativeLocation"));
          v18 = v21;
          if (v21)
          {
            -[NSObject ptsScore](v21, "ptsScore");
            v23 = v22;
            -[NSObject ptsScore](v12, "ptsScore");
            if (v23 > v24 || v12 == 0)
            {
              v18 = v18;

              v12 = v18;
            }
          }
        }
        else if (v19)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativeLocation"));
          objc_msgSend(v26, "ptsScore");
          *(_DWORD *)buf = 138412546;
          v46 = v15;
          v47 = 2048;
          v48 = v27;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: Device %@ with score %f not eligible for AirDrop", buf, 0x16u);

        }
        v11 |= (objc_msgSend(v15, "flags") & 0x100) >> 8;
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v10);

    if (v12)
    {
      v40 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v40));
      v29 = v40;
      v30 = SFUpTicksDiffFromNowToString(-[NSObject timestampTicks](v12, "timestampTicks"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = magic_head_log();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      a4 = v38;
      v6 = v39;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v46 = v39;
        v47 = 2112;
        v48 = v12;
        v49 = 2112;
        v50 = v31;
        v51 = 2112;
        v52 = v29;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Setting ranging measurement for person %@ to %@ - %@ (%@)", buf, 0x2Au);
      }

      goto LABEL_29;
    }
    a4 = v38;
    v6 = v39;
  }
  else
  {

    LOBYTE(v11) = 0;
  }
  v34 = magic_head_log();
  v29 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v6;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No highest ranging measurement found for %@", buf, 0xCu);
  }
  v12 = 0;
  v28 = 0;
LABEL_29:

  SFNodeSetRangingData(a4, v28);
  v35 = (void *)SFNodeCopyFlags(a4);
  v36 = (unint64_t)objc_msgSend(v35, "longValue");
  if ((v11 & 1) != 0)
    v37 = v36 | 0x400;
  else
    v37 = v36 & 0x400;
  SFNodeSetFlags(a4, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v37, v38));

}

+ (void)updateRangingMeasurementForDevice:(id)a3 inNode:(__SFNode *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  unsigned __int16 v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativeLocation"));
  if (v6)
  {
    v18 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v18));
    v8 = v18;
    v9 = SFUpTicksDiffFromNowToString(objc_msgSend(v6, "timestampTicks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = magic_head_log();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting ranging measurement for device %@ to %@ - %@ (%@)", buf, 0x2Au);
    }

  }
  else
  {
    v13 = magic_head_log();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No highest ranging measurement found for %@", buf, 0xCu);
    }
    v7 = 0;
  }

  SFNodeSetRangingData(a4, v7);
  v14 = (unsigned __int16)objc_msgSend(v5, "flags");
  v15 = (void *)SFNodeCopyFlags(a4);
  v16 = (unint64_t)objc_msgSend(v15, "longValue");
  if ((v14 & 0x100) != 0)
    v17 = v16 | 0x400;
  else
    v17 = v16 & 0x400;
  SFNodeSetFlags(a4, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));

}

+ (unint64_t)defaultSFNodeFlags
{
  return 999;
}

- (__SFNode)createSFNodeFromCNContacts:(id)a3 identifier:(id)a4 device:(id)a5
{
  id v7;
  id v8;
  __SFNode *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  NSMutableSet *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSNumber *v42;
  void *v44;
  uint8_t buf[4];
  id v47;

  v7 = a3;
  v8 = a5;
  v9 = (__SFNode *)SFNodeCreate(0, a4, a4);
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactWithPreferredIdentifierForContacts:", v7));
    v12 = objc_alloc_init((Class)CNContactFormatter);
    v13 = objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v13, "setMiddleName:", &stru_10072FE60);
    v44 = v12;
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromContact:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    SFNodeSetContactIdentifier(v9, v15);

    v16 = sub_100195B94(v7);
    SFNodeSetContactIdentifiers(v9, v16);
    if (v14)
      v17 = v14;
    else
      v17 = &stru_10072FE60;
    SFNodeSetDisplayName(v9, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "givenName"));
    SFNodeSetFirstName(v9, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "familyName"));
    SFNodeSetLastName(v9, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nickname"));
    SFNodeSetNickName(v9, v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "meCard"));
    v22 = objc_msgSend(v21, "isEqual:", v11);

    if (v22)
    {
      SFNodeAddKind(v9, kSFNodeKindMe);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "myAppleID"));
      SFNodeSetAppleID(v9, v23);

      v24 = objc_msgSend(v8, "idsDeviceIdentifierConflict");
      if ((v24 & 1) != 0)
      {
        v25 = airdrop_log(v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v8;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SDRapportBrowser: IDS device info for %@ may be inaccurate. Don't use it for AirDrop", buf, 0xCu);
        }
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
        SFNodeSetComputerName(v9, v28);

        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsDeviceIdentifier"));
        SFNodeSetIDSDeviceIdentifier(v9, v26);
      }

      v30 = (void *)objc_opt_class(self, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "deviceTypeFromModelIdentifier:", v31));

      SFNodeSetSecondaryName(v9, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
      v34 = SFDeviceImageFromDeviceModel(60.0, 60.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

      v36 = objc_retainAutorelease(v35);
      if (objc_msgSend(v36, "CGImage"))
      {
        v37 = objc_retainAutorelease(v36);
        v38 = SFDataFromCGImage(objc_msgSend(v37, "CGImage"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

        if (v39)
        {
LABEL_17:
          SFNodeSetIconData(v9, v39);

          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    buf[0] = 0;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDRapportBrowser helperConnection](self, "helperConnection"));
    v39 = sub_10004E578(v11, 1, (uint64_t)buf, v40);

    if (!buf[0])
      SFNodeAddKind(v9, kSFNodeKindMonogram);
    goto LABEL_17;
  }
  SFNodeAddKind(v9, kSFNodeKindUnknown);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleAuthTag"));
  SFNodeSetUserName(v9, objc_msgSend(v27, "base64EncodedStringWithOptions:", 0));

LABEL_18:
  SFNodeAddKind(v9, kSFNodeKindPerson);
  SFNodeAddKind(v9, kSFNodeKindRapport);
  v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(self, v41), "defaultSFNodeFlags"));
  SFNodeSetFlags(v9, v42);

  return v9;
}

- (__SFNode)createSFNodeFromRPPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  __SFNode *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v19[0] = v6;
  v19[1] = CNContactThumbnailImageDataKey;
  v19[2] = CNContactPhoneNumbersKey;
  v19[3] = CNContactEmailAddressesKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactsWithPhoneNumberOrEmail:keys:", v8, v7));

  if (objc_msgSend(v9, "count") || (v10 = objc_msgSend(v4, "flags"), ((unsigned __int16)v10 & 0x100) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v13 = -[SDRapportBrowser createSFNodeFromCNContacts:identifier:device:](self, "createSFNodeFromCNContacts:identifier:device:", v9, v14, v16);

    SFNodeSetRapportFlags(v13, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "flags")));
    objc_msgSend((id)objc_opt_class(self, v17), "updateRangingMeasurementForPerson:inNode:", v4, v13);
  }
  else
  {
    v11 = airdrop_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000B3A6C();

    v13 = 0;
  }

  return v13;
}

- (__SFNode)createSFNodeFromMyRPDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __SFNode *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "meCard"));

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v10 = -[SDRapportBrowser createSFNodeFromCNContacts:identifier:device:](self, "createSFNodeFromCNContacts:identifier:device:", v8, v9, v4);

    SFNodeSetRapportFlags(v10, &off_10074B5B0);
    objc_msgSend((id)objc_opt_class(self, v11), "updateRangingMeasurementForDevice:inNode:", v4, v10);
  }
  else
  {
    v12 = airdrop_log(v7);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000B3ACC(v13);

    v10 = 0;
  }

  return v10;
}

+ (id)identifiersForPerson:(id)a3
{
  id v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  if ((objc_msgSend(v3, "flags") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "devices"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("identifier")));
    -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v6);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

    -[NSMutableArray addObject:](v4, "addObject:", v5);
  }

  return v4;
}

+ (BOOL)personHasAirDropEligibleDevice:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "devices", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(a1, "deviceIsEligibleForAirDrop:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (BOOL)deviceIsEligibleForAirDrop:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v5 = v4;
  if (v4
    && ((objc_msgSend(v4, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0
     || (objc_msgSend(v5, "hasPrefix:", CFSTR("Watch")) & 1) != 0
     || (objc_msgSend(v5, "hasPrefix:", CFSTR("Audio")) & 1) != 0))
  {

    LOBYTE(v5) = 0;
  }
  else
  {

    LODWORD(v5) = (objc_msgSend(v3, "flags") >> 11) & 1;
  }

  return (char)v5;
}

+ (id)deviceTypeFromModelIdentifier:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  v4 = CFSTR("iPhone");
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone")) & 1) == 0)
  {
    v4 = CFSTR("iPad");
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod")) & 1) != 0)
      {
        v4 = CFSTR("iPod touch");
      }
      else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("MacBookPro")) & 1) != 0)
      {
        v4 = CFSTR("MacBook Pro");
      }
      else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("MacBookAir")) & 1) != 0)
      {
        v4 = CFSTR("MacBook Air");
      }
      else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("MacPro")) & 1) != 0)
      {
        v4 = CFSTR("Mac Pro");
      }
      else
      {
        v4 = CFSTR("iMac");
        if (!objc_msgSend(v3, "hasPrefix:", CFSTR("iMac")))
          v4 = &stru_10072FE60;
      }
    }
  }

  return (id)v4;
}

- (SDXPCHelperConnection)helperConnection
{
  return (SDXPCHelperConnection *)objc_loadWeakRetained((id *)&self->_helperConnection);
}

- (void)setHelperConnection:(id)a3
{
  objc_storeWeak((id *)&self->_helperConnection, a3);
}

- (unint64_t)ultraWideBandState
{
  return self->_ultraWideBandState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_helperConnection);
  objc_storeStrong((id *)&self->_peopleDiscovery, 0);
  objc_storeStrong((id *)&self->_cachedNodes, 0);
}

@end
