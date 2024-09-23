@implementation _FindingAdvertiser

+ (id)sharedInstance
{
  if (qword_10085D650 != -1)
    dispatch_once(&qword_10085D650, &stru_100814BB0);
  return (id)qword_10085D648;
}

- (id)startAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4 withAdvertisement:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *selfQueue;
  id v11;
  id v12;
  id v13;
  const char *v15;
  int v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    v15 = "token";
    v16 = 125;
    goto LABEL_6;
  }
  if (!v9)
  {
    v15 = "advertisement";
    v16 = 126;
LABEL_6:
    __assert_rtn("-[_FindingAdvertiser startAdvertisingAsFinder:toPeer:withAdvertisement:]", "NIServerFindingDiscovery.mm", v16, v15);
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1002DAF54;
  v26 = sub_1002DAF64;
  v27 = 0;
  selfQueue = self->_selfQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002DAF6C;
  block[3] = &unk_100814BD8;
  v21 = a3;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = &v22;
  v11 = v9;
  v12 = v8;
  dispatch_sync((dispatch_queue_t)selfQueue, block);
  v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (id)stopAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4
{
  id v6;
  OS_dispatch_queue *selfQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  if (!v6)
    sub_1003E8B3C();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1002DAF54;
  v19 = sub_1002DAF64;
  v20 = 0;
  selfQueue = self->_selfQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002DB210;
  v11[3] = &unk_100814C00;
  v14 = a3;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)selfQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)printableState
{
  OS_dispatch_queue *selfQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  NSMutableArray *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1002DAF54;
  v11 = sub_1002DAF64;
  v12 = objc_opt_new(NSMutableArray);
  selfQueue = self->_selfQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002DB48C;
  v6[3] = &unk_10080A8F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)selfQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_initInternal
{
  _FindingAdvertiser *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *selfQueue;
  OS_dispatch_source *roundRobinTimer;
  CBAdvertiser *nearbyActionNoWakeAdvertiser;
  CBSpatialInteractionSession *spatialInteractionAdvertiser;
  NSMutableArray *v10;
  NSMutableArray *nearbyActionNoWakePeers;
  NSMutableArray *v12;
  NSMutableArray *nearbyActionNoWakeAdvertisements;
  NSMutableArray *v14;
  NSMutableArray *spatialInteractionPeers;
  NSMutableArray *v16;
  NSMutableArray *spatialInteractionAdvertisements;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_FindingAdvertiser;
  v2 = -[_FindingAdvertiser init](&v19, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.nearbyd.finding.advertiser-self", v4);
    selfQueue = v2->_selfQueue;
    v2->_selfQueue = (OS_dispatch_queue *)v5;

    roundRobinTimer = v2->_roundRobinTimer;
    v2->_roundRobinTimer = 0;

    nearbyActionNoWakeAdvertiser = v2->_nearbyActionNoWakeAdvertiser;
    v2->_nearbyActionNoWakeAdvertiser = 0;

    v2->_activatedNearbyActionNoWake = 0;
    spatialInteractionAdvertiser = v2->_spatialInteractionAdvertiser;
    v2->_spatialInteractionAdvertiser = 0;

    v2->_activatedSpatialInteraction = 0;
    v10 = objc_opt_new(NSMutableArray);
    nearbyActionNoWakePeers = v2->_nearbyActionNoWakePeers;
    v2->_nearbyActionNoWakePeers = v10;

    v12 = objc_opt_new(NSMutableArray);
    nearbyActionNoWakeAdvertisements = v2->_nearbyActionNoWakeAdvertisements;
    v2->_nearbyActionNoWakeAdvertisements = v12;

    v2->_nearbyActionNoWakeCurrentPeerIndex = 0;
    v14 = objc_opt_new(NSMutableArray);
    spatialInteractionPeers = v2->_spatialInteractionPeers;
    v2->_spatialInteractionPeers = v14;

    v16 = objc_opt_new(NSMutableArray);
    spatialInteractionAdvertisements = v2->_spatialInteractionAdvertisements;
    v2->_spatialInteractionAdvertisements = v16;

    v2->_spatialInteractionCurrentPeerIndex = 0;
  }
  return v2;
}

- (unint64_t)_peerIndexReferenceForAdvertisementType:(int)a3 outPeers:(id *)a4 outAdvertisements:(id *)a5
{
  unint64_t *v7;
  id v8;
  unint64_t v9;
  id v10;
  unint64_t v11;

  v7 = self;
  if (a3 == 26)
  {
    *a4 = objc_retainAutorelease((id)self[7]);
    *a5 = objc_retainAutorelease((id)v7[8]);
    v10 = objc_msgSend(*a4, "count");
    if (v10 != objc_msgSend(*a5, "count"))
      sub_1003E8BDC();
    if (objc_msgSend(*a4, "count"))
    {
      v11 = v7[9];
      if (v11 >= (unint64_t)objc_msgSend(*a4, "count"))
        sub_1003E8BB4();
    }
    return v7 + 9;
  }
  else if (a3 == 19)
  {
    *a4 = objc_retainAutorelease((id)self[10]);
    *a5 = objc_retainAutorelease((id)v7[11]);
    v8 = objc_msgSend(*a4, "count");
    if (v8 != objc_msgSend(*a5, "count"))
      sub_1003E8B8C();
    if (objc_msgSend(*a4, "count"))
    {
      v9 = v7[12];
      if (v9 >= (unint64_t)objc_msgSend(*a4, "count"))
        sub_1003E8B64();
    }
    return v7 + 12;
  }
  return self;
}

- (unint64_t)_totalPeers
{
  id v3;

  v3 = -[NSMutableArray count](self->_nearbyActionNoWakePeers, "count");
  return (unint64_t)v3 + (_QWORD)-[NSMutableArray count](self->_spatialInteractionPeers, "count");
}

- (id)_configureAdvertiserForType:(int)a3 toPeer:(id)a4 withAdvertisement:(id)a5
{
  void *v5;
  id v9;
  id v10;
  uint64_t v11;

  v9 = a4;
  v10 = a5;
  if (a3 == 26)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[_FindingAdvertiser _configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:](self, "_configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:", v9, v10));
    goto LABEL_5;
  }
  if (a3 == 19)
  {
    v11 = objc_claimAutoreleasedReturnValue(-[_FindingAdvertiser _configureSpatialInteractionAdvertiserWithPeer:advertisement:](self, "_configureSpatialInteractionAdvertiserWithPeer:advertisement:", v9, v10));
LABEL_5:
    v5 = (void *)v11;
  }

  return v5;
}

- (void)_resetAdvertiserForType:(int)a3
{
  if (a3 == 26)
  {
    -[_FindingAdvertiser _resetNearbyActionNoWakeAdvertiser](self, "_resetNearbyActionNoWakeAdvertiser");
  }
  else if (a3 == 19)
  {
    -[_FindingAdvertiser _resetSpatialInteractionAdvertiser](self, "_resetSpatialInteractionAdvertiser");
  }
}

- (id)_configureNearbyActionNoWakeAdvertiserWithPeer:(id)a3 advertisement:(id)a4
{
  id v6;
  id v7;
  CBAdvertiser *nearbyActionNoWakeAdvertiser;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  CBAdvertiser *v20;
  CBAdvertiser *v21;
  NSObject *v22;
  double v23;
  CBAdvertiser *v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  CBAdvertiser *v30;
  const char *v32;
  int v33;
  void *v34;
  _QWORD v35[5];
  id v36[2];
  uint8_t buf[8];
  _QWORD v38[4];
  id v39;
  id location[2];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (!v6)
  {
    v32 = "peerToken";
    v33 = 388;
    goto LABEL_37;
  }
  if (!v7)
  {
    v32 = "advertisement";
    v33 = 389;
LABEL_37:
    __assert_rtn("-[_FindingAdvertiser _configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:]", "NIServerFindingDiscovery.mm", v33, v32);
  }
  nearbyActionNoWakeAdvertiser = self->_nearbyActionNoWakeAdvertiser;
  if (nearbyActionNoWakeAdvertiser)
  {
    if (self->_activatedNearbyActionNoWake)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiser advertisingAddressDataConnectable](nearbyActionNoWakeAdvertiser, "advertisingAddressDataConnectable"));
      v10 = v9;
      if (!v9 || (unint64_t)objc_msgSend(v9, "length") <= 5)
      {
        WORD2(location[0]) = 0;
        LODWORD(location[0]) = 0;
        v11 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", location, 6));

        v10 = (void *)v11;
      }
      v12 = sub_1002DC7A4(v6, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          sub_1003E8C04();
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, 0));
        goto LABEL_33;
      }
      if (-[CBAdvertiser nearbyActionNoWakeType](self->_nearbyActionNoWakeAdvertiser, "nearbyActionNoWakeType") != 1)-[CBAdvertiser setNearbyActionNoWakeType:](self->_nearbyActionNoWakeAdvertiser, "setNearbyActionNoWakeType:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiser nearbyActionNoWakeAuthTagData](self->_nearbyActionNoWakeAdvertiser, "nearbyActionNoWakeAuthTagData"));
      v15 = (uint64_t)objc_msgSend(v13, "isEqualToData:", v14);

      if ((v15 & 1) == 0)
        -[CBAdvertiser setNearbyActionNoWakeAuthTagData:](self->_nearbyActionNoWakeAdvertiser, "setNearbyActionNoWakeAuthTagData:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload"));
      if (v16
        || (v15 = objc_claimAutoreleasedReturnValue(-[CBAdvertiser nearbyActionNoWakeConfigData](self->_nearbyActionNoWakeAdvertiser, "nearbyActionNoWakeConfigData"))) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload", v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBAdvertiser nearbyActionNoWakeConfigData](self->_nearbyActionNoWakeAdvertiser, "nearbyActionNoWakeConfigData"));
        v19 = objc_msgSend(v17, "isEqualToData:", v18);

        if (v16)
        {

          if (!v19)
            goto LABEL_29;
        }
        else
        {

          if ((v19 & 1) == 0)
            goto LABEL_29;
        }
      }
      v27 = -[CBAdvertiser nearbyActionNWPrecisionFindingStatus](self->_nearbyActionNoWakeAdvertiser, "nearbyActionNWPrecisionFindingStatus");
      if (v27 == objc_msgSend(v7, "statusFlags"))
      {
LABEL_30:
        v29 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_nearbyActionNoWakeAdvertiser;
          LODWORD(location[0]) = 138477827;
          *(id *)((char *)location + 4) = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: configured advertiser: %{private}@", (uint8_t *)location, 0xCu);
        }
        v26 = 0;
LABEL_33:

        goto LABEL_34;
      }
LABEL_29:
      -[CBAdvertiser setNearbyActionNWPrecisionFindingStatus:](self->_nearbyActionNoWakeAdvertiser, "setNearbyActionNWPrecisionFindingStatus:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload"));
      -[CBAdvertiser setNearbyActionNoWakeConfigData:](self->_nearbyActionNoWakeAdvertiser, "setNearbyActionNoWakeConfigData:", v28);

      -[CBAdvertiser setNearbyActionNWPrecisionFindingStatus:](self->_nearbyActionNoWakeAdvertiser, "setNearbyActionNWPrecisionFindingStatus:", -[CBAdvertiser nearbyActionNWPrecisionFindingStatus](self->_nearbyActionNoWakeAdvertiser, "nearbyActionNWPrecisionFindingStatus") | objc_msgSend(v7, "statusFlags"));
      goto LABEL_30;
    }
    v25 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: advertiser still activating", (uint8_t *)location, 2u);
    }
  }
  else
  {
    v20 = objc_opt_new(CBAdvertiser);
    v21 = self->_nearbyActionNoWakeAdvertiser;
    self->_nearbyActionNoWakeAdvertiser = v20;

    -[CBAdvertiser setDispatchQueue:](self->_nearbyActionNoWakeAdvertiser, "setDispatchQueue:", self->_selfQueue);
    -[CBAdvertiser setLabel:](self->_nearbyActionNoWakeAdvertiser, "setLabel:", CFSTR("nearbydFinding"));
    -[CBAdvertiser setAdvertiseRate:](self->_nearbyActionNoWakeAdvertiser, "setAdvertiseRate:", 50);
    -[CBAdvertiser setEnableEPAForLEAdvertisement:](self->_nearbyActionNoWakeAdvertiser, "setEnableEPAForLEAdvertisement:", 1);
    -[CBAdvertiser setUseCase:](self->_nearbyActionNoWakeAdvertiser, "setUseCase:", 458752);
    objc_initWeak(location, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1002DC614;
    v38[3] = &unk_1007FA078;
    objc_copyWeak(&v39, location);
    -[CBAdvertiser setAdvertisingAddressChangedHandler:](self->_nearbyActionNoWakeAdvertiser, "setAdvertisingAddressChangedHandler:", v38);
    self->_activatedNearbyActionNoWake = 0;
    v22 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: activating advertiser", buf, 2u);
    }
    v23 = sub_10000883C();
    v24 = self->_nearbyActionNoWakeAdvertiser;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1002DC65C;
    v35[3] = &unk_1007FA108;
    v36[1] = *(id *)&v23;
    objc_copyWeak(v36, location);
    v35[4] = self;
    -[CBAdvertiser activateWithCompletion:](v24, "activateWithCompletion:", v35);
    objc_destroyWeak(v36);
    objc_destroyWeak(&v39);
    objc_destroyWeak(location);
  }
  v26 = 0;
LABEL_34:

  return v26;
}

- (id)_configureSpatialInteractionAdvertiserWithPeer:(id)a3 advertisement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 i;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CBSpatialInteractionSession *spatialInteractionAdvertiser;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  CBSpatialInteractionSession *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  void *v36;
  void *v37;
  CBSpatialInteractionSession *v38;
  CBSpatialInteractionSession *v39;
  NSObject *v40;
  double v41;
  CBSpatialInteractionSession *v42;
  uint64_t v44;
  const char *v45;
  int v46;
  _QWORD v47[5];
  id v48[2];
  uint8_t buf[8];
  int v50;
  char v51;
  id location[3];
  NSErrorUserInfoKey v53;
  const __CFString *v54;
  NSErrorUserInfoKey v55;
  const __CFString *v56;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (!v6)
  {
    v45 = "peerToken";
    v46 = 485;
    goto LABEL_34;
  }
  if (!v7)
  {
    v45 = "advertisement";
    v46 = 486;
LABEL_34:
    __assert_rtn("-[_FindingAdvertiser _configureSpatialInteractionAdvertiserWithPeer:advertisement:]", "NIServerFindingDiscovery.mm", v46, v45);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getIRK"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getSessionIdentifier"));
    if (v9)
    {
      v51 = 0;
      v50 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload"));

      if (v10)
      {
        for (i = 0; ; ++i)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload"));
          v13 = objc_msgSend(v12, "length");

          if ((unint64_t)v13 <= i)
            break;
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload")));
          *((_BYTE *)&v50 + i) = *((_BYTE *)objc_msgSend(v14, "bytes") + i);

        }
      }
      v15 = objc_msgSend(v7, "statusFlags");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
      objc_msgSend(v16, "setFindingStatus:", v15);

      v17 = v50;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
      objc_msgSend(v18, "setFindingConfig:", v17);

      v19 = BYTE1(v50);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
      objc_msgSend(v20, "setFindingConfig2:", v19);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
      objc_msgSend(v21, "setFindingEnabled:", 1);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
      objc_msgSend(v22, "commitChange");

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "aggregatedData"));

      spatialInteractionAdvertiser = self->_spatialInteractionAdvertiser;
      if (spatialInteractionAdvertiser)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIrkData](spatialInteractionAdvertiser, "clientIrkData"));
        if ((objc_msgSend(v26, "isEqualToData:", v8) & 1) != 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIdentifierData](self->_spatialInteractionAdvertiser, "clientIdentifierData"));
          v28 = objc_msgSend(v27, "isEqual:", v9);

          if ((v28 & 1) != 0)
          {
            if (self->_activatedSpatialInteraction)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession uwbConfigData](self->_spatialInteractionAdvertiser, "uwbConfigData"));
              v30 = objc_msgSend(v24, "isEqualToData:", v29);

              if ((v30 & 1) == 0)
              {
                -[CBSpatialInteractionSession setControlFlags:](self->_spatialInteractionAdvertiser, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_spatialInteractionAdvertiser, "controlFlags") | 8);
                -[CBSpatialInteractionSession setUwbConfigData:](self->_spatialInteractionAdvertiser, "setUwbConfigData:", v24);
                -[CBSpatialInteractionSession setControlFlags:](self->_spatialInteractionAdvertiser, "setControlFlags:", (unint64_t)-[CBSpatialInteractionSession controlFlags](self->_spatialInteractionAdvertiser, "controlFlags") & 0xFFFFFFF7);
              }
              v31 = qword_10085F520;
              if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
                goto LABEL_27;
              v32 = self->_spatialInteractionAdvertiser;
              LODWORD(location[0]) = 138477827;
              *(id *)((char *)location + 4) = v32;
              v33 = "#find-disc,SpatialInteraction: configured advertiser: %{private}@";
              v34 = v31;
              v35 = 12;
            }
            else
            {
              v44 = qword_10085F520;
              if (!os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
LABEL_27:

                v36 = 0;
                goto LABEL_28;
              }
              LOWORD(location[0]) = 0;
              v33 = "#find-disc,SpatialInteraction: advertiser still activating";
              v34 = v44;
              v35 = 2;
            }
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)location, v35);
            goto LABEL_27;
          }
        }
        else
        {

        }
      }
      -[CBSpatialInteractionSession invalidate](self->_spatialInteractionAdvertiser, "invalidate");
      v38 = objc_opt_new(CBSpatialInteractionSession);
      v39 = self->_spatialInteractionAdvertiser;
      self->_spatialInteractionAdvertiser = v38;

      -[CBSpatialInteractionSession setDispatchQueue:](self->_spatialInteractionAdvertiser, "setDispatchQueue:", self->_selfQueue);
      -[CBSpatialInteractionSession setLabel:](self->_spatialInteractionAdvertiser, "setLabel:", CFSTR("nearbydFinding"));
      -[CBSpatialInteractionSession setClientIrkData:](self->_spatialInteractionAdvertiser, "setClientIrkData:", v8);
      -[CBSpatialInteractionSession setClientIdentifierData:](self->_spatialInteractionAdvertiser, "setClientIdentifierData:", v9);
      -[CBSpatialInteractionSession setControlFlags:](self->_spatialInteractionAdvertiser, "setControlFlags:", 4115);
      -[CBSpatialInteractionSession setEnableEPAForLEAdvertisement:](self->_spatialInteractionAdvertiser, "setEnableEPAForLEAdvertisement:", 1);
      -[CBSpatialInteractionSession setAdvertiseRate:](self->_spatialInteractionAdvertiser, "setAdvertiseRate:", 50);
      -[CBSpatialInteractionSession setUwbConfigData:](self->_spatialInteractionAdvertiser, "setUwbConfigData:", v24);
      self->_activatedSpatialInteraction = 0;
      objc_initWeak(location, self);
      v40 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: activating advertiser", buf, 2u);
      }
      v41 = sub_10000883C();
      v42 = self->_spatialInteractionAdvertiser;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1002DD040;
      v47[3] = &unk_1007FA108;
      v48[1] = *(id *)&v41;
      objc_copyWeak(v48, location);
      v47[4] = self;
      -[CBSpatialInteractionSession activateWithCompletion:](v42, "activateWithCompletion:", v47);
      objc_destroyWeak(v48);
      objc_destroyWeak(location);
      goto LABEL_27;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003E8CBC();
    v53 = NSLocalizedFailureReasonErrorKey;
    v54 = CFSTR("Discovery token doesn't contain valid session identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v37));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003E8CBC();
    v55 = NSLocalizedFailureReasonErrorKey;
    v56 = CFSTR("Discovery token doesn't contain valid IRK");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v9));
  }
LABEL_28:

  return v36;
}

- (void)_resetNearbyActionNoWakeAdvertiser
{
  NSObject *v3;
  CBAdvertiser *nearbyActionNoWakeAdvertiser;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,NearbyActionNoWake: reset advertising", v5, 2u);
  }
  -[CBAdvertiser invalidate](self->_nearbyActionNoWakeAdvertiser, "invalidate");
  nearbyActionNoWakeAdvertiser = self->_nearbyActionNoWakeAdvertiser;
  self->_nearbyActionNoWakeAdvertiser = 0;

  self->_activatedNearbyActionNoWake = 0;
}

- (void)_resetSpatialInteractionAdvertiser
{
  NSObject *v3;
  CBSpatialInteractionSession *spatialInteractionAdvertiser;
  void *v5;
  void *v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: reset advertising", v7, 2u);
  }
  -[CBSpatialInteractionSession invalidate](self->_spatialInteractionAdvertiser, "invalidate");
  spatialInteractionAdvertiser = self->_spatialInteractionAdvertiser;
  self->_spatialInteractionAdvertiser = 0;

  self->_activatedSpatialInteraction = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
  objc_msgSend(v5, "setFindingEnabled:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
  objc_msgSend(v6, "commitChange");

}

- (void)_updateAdvertisementAfterActivationForType:(int)a3
{
  uint64_t v3;
  unint64_t *v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  v12 = 0;
  v13 = 0;
  v5 = -[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:](self, "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:", v3, &v13, &v12);
  v6 = v13;
  v7 = v12;
  v8 = *v5;
  if (v8 < (unint64_t)objc_msgSend(v6, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", *v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", *v5));
    v11 = -[_FindingAdvertiser _configureAdvertiserForType:toPeer:withAdvertisement:](self, "_configureAdvertiserForType:toPeer:withAdvertisement:", v3, v9, v10);

  }
}

- (void)_startRoundRobinTimer
{
  OS_dispatch_source *roundRobinTimer;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  dispatch_time_t v8;
  OS_dispatch_source *v9;
  _QWORD v10[4];
  id v11;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  roundRobinTimer = self->_roundRobinTimer;
  if (roundRobinTimer)
  {
    dispatch_source_cancel((dispatch_source_t)roundRobinTimer);
    v4 = self->_roundRobinTimer;
    self->_roundRobinTimer = 0;

  }
  v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_selfQueue);
  v6 = self->_roundRobinTimer;
  self->_roundRobinTimer = v5;

  v7 = self->_roundRobinTimer;
  v8 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0x12A05F200uLL, 0x989680uLL);
  objc_initWeak(&location, self);
  v9 = self->_roundRobinTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002DD564;
  v10[3] = &unk_1007FA078;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
  dispatch_resume((dispatch_object_t)self->_roundRobinTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_stopRoundRobinTimer
{
  OS_dispatch_source *roundRobinTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  roundRobinTimer = self->_roundRobinTimer;
  if (roundRobinTimer)
  {
    dispatch_source_cancel((dispatch_source_t)roundRobinTimer);
    v4 = self->_roundRobinTimer;
    self->_roundRobinTimer = 0;

  }
}

- (void)_roundRobinTimerHandler
{
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  unint64_t *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  __int128 v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  v3 = operator new(8uLL);
  v4 = 0;
  *v3 = 0x1A00000013;
  *(_QWORD *)&v5 = 136315651;
  v16 = v5;
  do
  {
    v6 = *(unsigned int *)((char *)v3 + v4);
    v17 = 0;
    v18 = 0;
    v7 = -[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:](self, "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:", v6, &v18, &v17, v16);
    v8 = v18;
    v9 = v17;
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v10 = *v7;
      *v7 = (v10 + 1) % (unint64_t)objc_msgSend(v8, "count");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", *v7));
      v13 = -[_FindingAdvertiser _configureAdvertiserForType:toPeer:withAdvertisement:](self, "_configureAdvertiserForType:toPeer:withAdvertisement:", v6, v11, v12);
      v14 = (id)qword_10085F520;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = sub_1002B73C8(v6);
        *(_DWORD *)buf = v16;
        v20 = v15;
        v21 = 2113;
        v22 = v11;
        v23 = 2113;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-disc,Round robin: re-configured advertiser (%s). New peer: %{private}@. New advertisement: %{private}@.", buf, 0x20u);
      }

    }
    v4 += 4;
  }
  while (v4 != 8);
  operator delete(v3);
}

- (void)_cbAdvertisingAddressChanged
{
  NSObject *v3;
  unint64_t *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,BT adv address changed", buf, 2u);
  }
  v10 = 0;
  v11 = 0;
  v4 = -[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:](self, "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:", 26, &v11, &v10);
  v5 = v11;
  v6 = v10;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", *v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", *v4));
    v9 = -[_FindingAdvertiser _configureAdvertiserForType:toPeer:withAdvertisement:](self, "_configureAdvertiserForType:toPeer:withAdvertisement:", 26, v7, v8);

  }
}

- (id)payloadChangeObserverQueue
{
  return self->_selfQueue;
}

- (void)payloadDidChange
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  void *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (self->_spatialInteractionAdvertiser)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerSpatialInteractionPayloadAggregator sharedInstance](NIServerSpatialInteractionPayloadAggregator, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "aggregatedData"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession uwbConfigData](self->_spatialInteractionAdvertiser, "uwbConfigData"));
    v6 = objc_msgSend(v5, "isEqualToData:", v4);

    if ((v6 & 1) == 0)
    {
      v7 = -[CBSpatialInteractionSession controlFlags](self->_spatialInteractionAdvertiser, "controlFlags");
      v8 = qword_10085F520;
      v9 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
      if ((v7 & 8) != 0)
      {
        if (v9)
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: payload did change: %@. Advertiser updated, but not currently advertising", (uint8_t *)&v10, 0xCu);
        }
        -[CBSpatialInteractionSession setUwbConfigData:](self->_spatialInteractionAdvertiser, "setUwbConfigData:", v4);
      }
      else
      {
        if (v9)
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-disc,SpatialInteraction: payload did change: %@. Advertiser updated, and control flags toggled for it to take effect", (uint8_t *)&v10, 0xCu);
        }
        -[CBSpatialInteractionSession setControlFlags:](self->_spatialInteractionAdvertiser, "setControlFlags:", -[CBSpatialInteractionSession controlFlags](self->_spatialInteractionAdvertiser, "controlFlags") | 8);
        -[CBSpatialInteractionSession setUwbConfigData:](self->_spatialInteractionAdvertiser, "setUwbConfigData:", v4);
        -[CBSpatialInteractionSession setControlFlags:](self->_spatialInteractionAdvertiser, "setControlFlags:", (unint64_t)-[CBSpatialInteractionSession controlFlags](self->_spatialInteractionAdvertiser, "controlFlags") & 0xFFFFFFF7);
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialInteractionAdvertisements, 0);
  objc_storeStrong((id *)&self->_spatialInteractionPeers, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAdvertisements, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakePeers, 0);
  objc_storeStrong((id *)&self->_spatialInteractionAdvertiser, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAdvertiser, 0);
  objc_storeStrong((id *)&self->_roundRobinTimer, 0);
  objc_storeStrong((id *)&self->_selfQueue, 0);
}

@end
