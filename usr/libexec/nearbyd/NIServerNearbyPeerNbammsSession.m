@implementation NIServerNearbyPeerNbammsSession

- (NIServerNearbyPeerNbammsSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NIServerNearbyPeerNbammsSession *v11;
  NIServerNearbyPeerNbammsSession *v12;
  void *v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NIServerNearbyPeerNbammsSession *v18;
  __int128 v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NIServerNearbyPeerNbammsSession;
  v11 = -[NIServerNearbyPeerNbammsSession init](&v21, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_clientQueue, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getResourcesManager"));
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "protobufLogger");
    else
      v20 = 0uLL;
    sub_1000145E8((uint64_t)&v12->_pbLogger, &v20);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    *(_WORD *)&v12->_useTestNbammsMode = 0;
    v18 = v12;
  }

  return v12;
}

- (id)configure
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  BOOL v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  _BOOL4 isInitiator;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  __int128 __src[32];
  uint8_t buf[520];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_nbammsSession.__ptr_)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
    v6 = objc_msgSend(v5, "copy");

    if ((objc_msgSend(v6, "isExtendedDistanceMeasurementEnabled") & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E3BF8();
      v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
      goto LABEL_34;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugParameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("useTestNbammsMode")));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugParameters"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("useTestNbammsMode")));
      self->_useTestNbammsMode = objc_msgSend(v10, "BOOLValue");

      v11 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_useTestNbammsMode)
          v12 = "Y";
        else
          v12 = "N";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#peer-nba,NBAMMS test mode used: %s", buf, 0xCu);
      }
    }
    v13 = sub_100004784();
    v14 = sub_100395734((uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("DisableNIPeerExtendedDistanceOverride"));

    if (v16)
    {
      v17 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#peer-nba,* disable extended distance measurement through default writes.", buf, 2u);
      }
      goto LABEL_31;
    }
    if (!v14)
    {
LABEL_31:
      v33 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#peer-nba,Invalidating NBAMMS session configuration - device does not support NBAMMS", buf, 2u);
      }
      v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5889, 0));
      goto LABEL_34;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDiscoveryToken"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceCapabilities"));
    v21 = objc_msgSend(v20, "supportsExtendedDistanceMeasurement");

    v22 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "N";
      if (v21)
        v23 = "Y";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#peer-nba,Peer supports NBAMMS %s", buf, 0xCu);
    }
    if ((v21 & 1) != 0 || self->_useTestNbammsMode)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDiscoveryToken"));
      v25 = v24 == 0;

      if (!v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getResourcesManager"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "discoveryToken"));

        if (!v27)
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003E3B74();
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
          goto LABEL_61;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDiscoveryToken"));
        v44 = 0;
        v29 = objc_msgSend(WeakRetained, "shouldInitiate:peerDiscoveryToken:error:", v27, v28, &v44);
        v30 = v44;
        self->_isInitiator = v29;

        if (v30)
        {
          v31 = (id)qword_10085F520;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "description")));
            v43 = objc_msgSend(v42, "UTF8String");
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v43;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#peer-nba,Unable to determine initiator: %s", buf, 0xCu);

          }
          v32 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
        }
        else
        {
          isInitiator = self->_isInitiator;
          v39 = v27;
          if (!self->_isInitiator)
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDiscoveryToken"));
          v40 = -[NIServerNearbyPeerNbammsSession _getNbUwbAcquisitionBandChannel:](self, "_getNbUwbAcquisitionBandChannel:", v39);
          if (!isInitiator)

          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDiscoveryToken"));
          -[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:](self, "_prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:", v41, v40);
          memcpy(buf, __src, 0x1F9uLL);

          if (buf[504])
          {
            -[NIServerNearbyPeerNbammsSession _buildRoseSession:](self, "_buildRoseSession:", buf);
            sub_1000145E8((uint64_t)&self->_nbammsSession, __src);
            sub_10001AE68((uint64_t)__src);
            if (self->_nbammsSession.__ptr_)
            {
              v34 = 0;
LABEL_60:

LABEL_61:
              goto LABEL_35;
            }
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
              sub_1003E3BCC();
          }
          else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
          {
            sub_1003E3BA0();
          }
          v32 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
        }
        v34 = (void *)v32;
        goto LABEL_60;
      }
      v35 = -5888;
    }
    else
    {
      v36 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_useTestNbammsMode)
          v37 = "Y";
        else
          v37 = "N";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#peer-nba,Invalidating NBAMMS session configuration - peer does not support NBAMMS; testNbammsMode = %s",
          buf,
          0xCu);
      }
      v35 = -5881;
    }
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), v35, 0));
LABEL_34:
    v34 = (void *)v18;
LABEL_35:

    return v34;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E3C24();
  return (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5880, 0));
}

- (id)run
{
  _BOOL4 useTestNbammsMode;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  char *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *__p[2];
  char v20;
  uint8_t buf[4];
  void **v22;

  if (!self->_nbammsSession.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003E3C50();
    v6 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5888, 0));
    goto LABEL_9;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  useTestNbammsMode = self->_useTestNbammsMode;
  v4 = qword_10085F520;
  v5 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if (useTestNbammsMode)
  {
    if (v5)
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,Test Nbamms mode not gated by BT, start ranging immediately", (uint8_t *)__p, 2u);
    }
    v6 = objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerNbammsSession _triggerRanging:](self, "_triggerRanging:", 0));
LABEL_9:
    v7 = (void *)v6;
    return v7;
  }
  if (v5)
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,POR MAC mode", (uint8_t *)__p, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getResourcesManager"));
  v11 = -[NIServerNearbyPeerNbammsSession _getRangingTriggerType](self, "_getRangingTriggerType");
  v12 = (id)qword_10085F520;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v11 ? "TriggerRequired" : "NoTriggerRequired";
    sub_10000BF04(__p, v13);
    v14 = v20 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#peer-nba,ranging trigger type %s", buf, 0xCu);
    if (v20 < 0)
      operator delete(__p[0]);
  }

  if (!v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerNbammsSession _triggerRanging:](self, "_triggerRanging:", 0));
    if (v7)
    {

      return v7;
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
  objc_msgSend(v15, "setBleRSSIThresholdHint:", 4294967176);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
  objc_msgSend(v16, "startAdvertising");

  if (objc_msgSend(v10, "isBackgroundOperationAllowed"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
    objc_msgSend(v17, "allowScreenOffOperation:", 1);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "btResource"));
  objc_msgSend(v18, "startScanning");

  return 0;
}

- (BOOL)shouldBypassBleDiscovery
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("FindingUseDiscovery"));

  return v3 ^ 1;
}

- (void)deviceDiscovered:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  void *v7;
  Logger *ptr;
  id v9;
  id v10;
  void *__p[20];

  v4 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#peer-nba,Device discovered", (uint8_t *)__p, 2u);
  }
  if (self->_pbLogger.__ptr_)
  {
    v6 = sub_10000883C();
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NINearbyObject objectFromBluetoothDevice:](NINearbyObject, "objectFromBluetoothDevice:", v4));
    if (v7)
    {
      ptr = self->_pbLogger.__ptr_;
      v9 = objc_msgSend(v4, "u64Identifier");
      sub_100268FEC(v7, (uint64_t)__p);
      sub_100274790((uint64_t)ptr, (uint64_t)v9, (uint64_t)__p, v6);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

  }
  if (-[NIServerNearbyPeerNbammsSession _getRangingTriggerType](self, "_getRangingTriggerType"))
    v10 = -[NIServerNearbyPeerNbammsSession _triggerRanging:](self, "_triggerRanging:", v4);

}

- (void)device:(id)a3 rediscovered:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,Device rediscovered", v5, 2u);
  }
}

- (void)updatePeerData:(const void *)a3
{
  NBAMMSSession *ptr;

  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E3C7C();
  ptr = self->_nbammsSession.__ptr_;
  if (ptr)
  {
    if (!self->_useTestNbammsMode)
      sub_1002B1E34((uint64_t)ptr, (uint64_t)a3);
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  int *v3;
  NSObject *v4;
  id WeakRetained;

  v3 = (int *)((char *)a3 + 32);
  if (((*((_DWORD *)a3 + 8) - 1) & 0xFFFFFFFD) != 0)
  {
    v4 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003E3CA8(v3, v4);
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didReceiveNewSolution:", a3);

  }
}

- (void)didReceiveUnsuccessfulSolution:(const void *)a3
{
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didReceiveUnsuccessfulSolution:", a3);

}

- (void)didReceiveRemoteData:(const void *)a3
{
  id WeakRetained;

  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E3D1C();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didReceiveRemoteData:", a3);

}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  unsigned int var2;
  uint64_t v4;
  id WeakRetained;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didServiceRequestUpdateStatus:", v4, var2);

}

- (void)invalidate
{
  uint64_t v3;
  shared_ptr<rose::objects::NBAMMSSession> *p_nbammsSession;
  NBAMMSSession *ptr;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  ptr = self->_nbammsSession.__ptr_;
  p_nbammsSession = &self->_nbammsSession;
  v3 = (uint64_t)ptr;
  if (ptr)
  {
    sub_1002AE5BC(v3);
    sub_100180AF4(p_nbammsSession);
  }
}

- (id)_triggerRanging:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  char *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  float v18;
  float v19;
  double v20;
  float v21;
  float v22;
  float v23;
  unsigned __int8 v24;
  int v25;
  float v26;
  NSObject *v27;
  unsigned __int16 v28;
  int v29;
  NSObject *v30;
  unsigned __int8 v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  _BOOL4 useTestNbammsMode;
  NSObject *v36;
  _BOOL4 v37;
  unsigned __int8 v38;
  __int128 *p_p;
  unsigned __int8 v40;
  int v41;
  NSObject *v42;
  id v44;
  void *v45;
  id WeakRetained;
  unsigned int v47;
  uint8_t v48[32];
  uint8_t buf[4];
  void **v50;
  __int16 v51;
  char v52;
  int v53;
  __int16 v54;
  char v55;
  char v56;
  uint64_t v57;
  char v58;
  unsigned int v59;
  int v60;
  float v61;
  uint64_t v62;
  __int16 v63;
  _BYTE v64[30];
  void *__p;
  __int16 v66;
  _BYTE v67[14];
  char v68;
  uint64_t v69;
  char v70;
  unsigned int v71;
  int v72;
  float v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  _WORD v78[7];
  NSErrorUserInfoKey v79;
  const __CFString *v80;

  v4 = a3;
  if (self->_nbammsSession.__ptr_)
  {
    v5 = -[NIServerNearbyPeerNbammsSession _getRangingAcquisitionType](self, "_getRangingAcquisitionType");
    v6 = (id)qword_10085F520;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v5 ? "BTAidedAcquisition" : "DirectAcquisition";
      sub_10000BF04(&__p, v7);
      v8 = v67[13] >= 0 ? &__p : (void **)__p;
      *(_DWORD *)buf = 136315138;
      v50 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#peer-nba,ranging acquisition type = %s", buf, 0xCu);
      if ((v67[13] & 0x80000000) != 0)
        operator delete(__p);
    }

    if (v4 || v5 != 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
      v12 = objc_msgSend(v11, "copy");

      v45 = v12;
      dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "debugParameters"));
      v14 = v13 == 0;

      v47 = 10000000;
      if (!v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "debugParameters"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("startTimeUncertainty")));

        if (v16)
          v47 = objc_msgSend(v16, "intValue");

      }
      v17 = -[NIServerNearbyPeerNbammsSession _getSchedulingIntervalForTriggeredDutyCycledAcquisition](self, "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
      -[NIServerNearbyPeerNbammsSession _getDutyCycleForTriggeredDutyCycledAcquisition](self, "_getDutyCycleForTriggeredDutyCycledAcquisition");
      v19 = v18;
      v44 = -[NIServerNearbyPeerNbammsSession _getSecondarySchedulingParameters](self, "_getSecondarySchedulingParameters");
      v22 = v21;
      v23 = v21;
      v25 = v24;
      if ((_DWORD)v17)
      {
        if (v19 <= 1.0)
        {
          *(float *)&v20 = v19;
          -[NIServerNearbyPeerNbammsSession _adjustDutyCycleForInterfaceDelays:schedulingInterval:](self, "_adjustDutyCycleForInterfaceDelays:schedulingInterval:", v17, v20);
          v19 = v26;
          if (v25)
          {
            v27 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(__p) = 0;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#peer-nba,Requested backoff acquisition policy, processing secondary scheduling parameters", (uint8_t *)&__p, 2u);
            }
            if (v19 >= v23)
            {
              v25 = 1;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                sub_1003E3DC0();
              v25 = 0;
            }
          }
        }
      }
      if (self->_isInitiator)
      {
        v28 = (unsigned __int16)-[NIServerNearbyPeerNbammsSession _getDitherConst](self, "_getDitherConst");
        v29 = HIBYTE(v28);
      }
      else
      {
        LOBYTE(v28) = 0;
        v29 = 0;
      }
      v30 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p) = 67109632;
        if (v29)
          v31 = v28;
        else
          v31 = 0;
        HIDWORD(__p) = v17;
        v66 = 2048;
        *(double *)v67 = v19;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#peer-nba,Primary scheduling params: Interval(us)=%d, Duty Cycle=%f, Dither const=%d", (uint8_t *)&__p, 0x18u);
      }
      if (v25)
      {
        v32 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(__p) = 67109632;
          HIDWORD(__p) = (_DWORD)v44;
          v66 = 1024;
          *(_DWORD *)v67 = HIDWORD(v44);
          *(_WORD *)&v67[4] = 2048;
          *(double *)&v67[6] = v23;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#peer-nba,Secondary scheduling params: Delay(us)=%d, Interval(us)=%d, Duty Cycle=%f", (uint8_t *)&__p, 0x18u);
        }
      }
      LOBYTE(__p) = 0;
      v68 = 0;
      v69 = 17000;
      v70 = 1;
      v71 = v47;
      v72 = v17;
      v73 = v19;
      v74 = 0;
      v75 = v28 | (unsigned __int16)((_WORD)v29 << 8);
      v76 = 0;
      memset(v78, 0, sizeof(v78));
      v77 = 0;
      v54 = 0;
      v53 = 0;
      *(_DWORD *)buf = 2;
      LOBYTE(v50) = 0;
      v51 = 0;
      v52 = 0;
      v55 = 1;
      v56 = 1;
      v57 = 17000;
      v58 = 1;
      v59 = v47;
      v60 = v17;
      v61 = v19;
      v62 = 0;
      v63 = v75;
      memset(v64, 0, sizeof(v64));
      if (v5 == 1)
      {
        v34 = objc_msgSend(v4, "btAdvertisingAddress");
        *(_DWORD *)buf = 2;
        LOBYTE(v50) = 0;
        v51 = 0;
        v52 = 0;
        v53 = (int)v34;
        v54 = WORD2(v34);
        v55 = 1;
        v56 = 1;
        v57 = 17000;
        v58 = 1;
        v59 = v47;
        v60 = v17;
        v61 = v19;
        v62 = 0;
        v63 = v28 | (unsigned __int16)((_WORD)v29 << 8);
        memset(v64, 0, sizeof(v64));
      }
      else if (!v5 && v25)
      {
        v33 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v48 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#peer-nba,Resetting NBAMMSStartOptions", v48, 2u);
        }
        v54 = 0;
        v53 = 0;
        *(_DWORD *)buf = 2;
        LOBYTE(v50) = 0;
        v51 = 0;
        v52 = 0;
        v55 = 1;
        v56 = 1;
        v57 = 17000;
        v58 = 1;
        v59 = v47;
        v60 = v17;
        v61 = v19;
        v62 = 0;
        v63 = v28 | (unsigned __int16)((_WORD)v29 << 8);
        *(_DWORD *)v64 = 0;
        *(_WORD *)&v64[4] = 0;
        *(_QWORD *)&v64[6] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | v44;
        *(_QWORD *)&v64[14] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000 | HIDWORD(v44);
        *(float *)&v64[22] = v22;
        v64[26] = 1;
      }
      useTestNbammsMode = self->_useTestNbammsMode;
      v36 = qword_10085F520;
      v37 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
      if (useTestNbammsMode)
      {
        if (v37)
        {
          if (v29)
            v38 = v28;
          else
            v38 = 0;
          *(_DWORD *)v48 = 67109120;
          *(_DWORD *)&v48[4] = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#peer-nba,startRanging dither = %d", v48, 8u);
        }
        p_p = (__int128 *)&__p;
      }
      else
      {
        if (v37)
        {
          if (HIBYTE(v63))
            v40 = v63;
          else
            v40 = 0;
          *(_DWORD *)v48 = 67109120;
          *(_DWORD *)&v48[4] = v40;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "#peer-nba,startRanging dither = %d", v48, 8u);
        }
        p_p = (__int128 *)buf;
      }
      v9 = WeakRetained;
      v41 = sub_1002B1704((uint64_t)self->_nbammsSession.__ptr_, p_p);
      if (v41)
      {
        v42 = (id)qword_10085F520;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          sub_1002B48B0(v41, v48);
          sub_1003E3D74();
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v79 = NSLocalizedFailureReasonErrorKey;
      v80 = CFSTR("Didnt receive BT discovered device info");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, v9));
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003E3D48();
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
  }

  return v10;
}

- (void)_nbammsSessionInvalidatedWithReason:(int)a3
{
  NSObject *v5;
  id WeakRetained;
  _QWORD v7[3];

  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1002B48E0(a3, v7);
    sub_1003E3DEC();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didInvalidateUWBSession");

}

- (shared_ptr<rose::objects::NBAMMSSession>)_buildRoseSession:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v5;
  NIServerNearbyPeerNbammsSession *v6;
  id WeakRetained;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  NIServerNearbyPeerNbammsSession *v11;
  NIServerNearbyPeerNbammsSession *v12;
  NIServerNearbyPeerNbammsSession *v13;
  NIServerNearbyPeerNbammsSession *v14;
  NIServerNearbyPeerNbammsSession *v15;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  NSObject *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  NBAMMSSession *v46;
  __shared_weak_count *v47;
  __int128 v48;
  void *__p[2];
  char v50;
  Logger *ptr;
  std::__shared_weak_count *v52;
  _BYTE v53[24];
  _BYTE *v54;
  _BYTE v55[24];
  _BYTE *v56;
  _BYTE v57[24];
  _BYTE *v58;
  _BYTE v59[24];
  _BYTE *v60;
  _QWORD v61[3];
  _QWORD *v62;
  _QWORD v63[3];
  _QWORD *v64;
  _QWORD v65[3];
  _QWORD *v66;
  _QWORD v67[3];
  _QWORD *v68;
  uint8_t buf[8];
  NIServerNearbyPeerNbammsSession *v70;
  uint8_t *v71;
  shared_ptr<rose::objects::NBAMMSSession> result;

  v5 = v3;
  v6 = self;
  WeakRetained = objc_loadWeakRetained((id *)&v6->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)v6->_clientQueue);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getContainerUniqueIdentifier")));
  sub_10000BF04(__p, (char *)objc_msgSend(v8, "UTF8String"));

  v9 = operator new(0x5D8uLL);
  v9[1] = 0;
  v9[2] = 0;
  *v9 = off_10080F610;
  v10 = (uint64_t)(v9 + 3);
  v11 = v6;
  *(_QWORD *)buf = off_1008110C8;
  v70 = v11;
  v71 = buf;
  v12 = v11;
  v67[0] = off_100811148;
  v67[1] = v12;
  v68 = v67;
  v13 = v12;
  v65[0] = off_1008111C8;
  v65[1] = v13;
  v66 = v65;
  v14 = v13;
  v63[0] = off_100811248;
  v63[1] = v14;
  v64 = v63;
  v15 = v14;
  v61[0] = off_1008112C8;
  v61[1] = v15;
  v62 = v61;
  v60 = 0;
  v58 = 0;
  v56 = 0;
  v54 = 0;
  cntrl = (std::__shared_weak_count *)v15->_pbLogger.__cntrl_;
  ptr = v6->_pbLogger.__ptr_;
  v52 = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  sub_1002ADC18(v10, (__int128 *)__p, (void *)a3, (uint64_t)buf, (uint64_t)v67, (uint64_t)v65, (uint64_t)v63, (uint64_t)v61, (uint64_t)v59, (uint64_t)v57, (uint64_t)v55, (uint64_t)v53, &ptr);
  v9[3] = &off_10080F8E0;
  v9[4] = off_10080F9A8;
  v19 = v52;
  if (v52)
  {
    v20 = (unint64_t *)&v52->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v54;
  if (v54 == v53)
  {
    v23 = 4;
    v22 = v53;
  }
  else
  {
    if (!v54)
      goto LABEL_14;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_14:
  v24 = v56;
  if (v56 == v55)
  {
    v25 = 4;
    v24 = v55;
  }
  else
  {
    if (!v56)
      goto LABEL_19;
    v25 = 5;
  }
  (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_19:
  v26 = v58;
  if (v58 == v57)
  {
    v27 = 4;
    v26 = v57;
  }
  else
  {
    if (!v58)
      goto LABEL_24;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_24:
  v28 = v60;
  if (v60 == v59)
  {
    v29 = 4;
    v28 = v59;
  }
  else
  {
    if (!v60)
      goto LABEL_29;
    v29 = 5;
  }
  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_29:
  v30 = v62;
  if (v62 == v61)
  {
    v31 = 4;
    v30 = v61;
  }
  else
  {
    if (!v62)
      goto LABEL_34;
    v31 = 5;
  }
  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_34:
  v32 = v64;
  if (v64 == v63)
  {
    v33 = 4;
    v32 = v63;
  }
  else
  {
    if (!v64)
      goto LABEL_39;
    v33 = 5;
  }
  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_39:
  v34 = v66;
  if (v66 == v65)
  {
    v35 = 4;
    v34 = v65;
  }
  else
  {
    if (!v66)
      goto LABEL_44;
    v35 = 5;
  }
  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_44:
  v36 = v68;
  if (v68 == v67)
  {
    v37 = 4;
    v36 = v67;
  }
  else
  {
    if (!v68)
      goto LABEL_49;
    v37 = 5;
  }
  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_49:
  v38 = v71;
  if (v71 == buf)
  {
    v39 = 4;
    v38 = buf;
  }
  else
  {
    if (!v71)
      goto LABEL_54;
    v39 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v38 + 8 * v39))();
LABEL_54:
  *(_QWORD *)&v48 = v9 + 3;
  *((_QWORD *)&v48 + 1) = v9;
  sub_10001B020((uint64_t)&v48, v9 + 5, v10);
  v40 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#peer-nba,Registering for UWB service.", buf, 2u);
  }
  v41 = sub_1002AEA48(v48);
  if (v41)
  {
    v42 = (id)qword_10085F520;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v41, buf);
      sub_1003E3E38();
    }

    *v5 = 0;
    v5[1] = 0;
    v43 = (std::__shared_weak_count *)*((_QWORD *)&v48 + 1);
    if (*((_QWORD *)&v48 + 1))
    {
      v44 = (unint64_t *)(*((_QWORD *)&v48 + 1) + 8);
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
  }
  else
  {
    *(_OWORD *)v5 = v48;
  }
  if (v50 < 0)
    operator delete(__p[0]);

  result.__cntrl_ = v47;
  result.__ptr_ = v46;
  return result;
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 nbUwbAcquisitionBandChannel:(id)a4
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  unsigned int v124;
  _BOOL4 useTestNbammsMode;
  NSObject *v126;
  _BOOL4 v127;
  void *v128;
  void *v129;
  void *v130;
  BOOL v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  BOOL v137;
  void *v138;
  void *v139;
  unsigned __int16 v140;
  void *v141;
  void *v142;
  void *v143;
  BOOL v144;
  void *v145;
  void *v146;
  unsigned __int8 v147;
  void *v148;
  void *v149;
  void *v150;
  BOOL v151;
  void *v152;
  void *v153;
  unsigned __int8 v154;
  void *v155;
  void *v156;
  void *v157;
  BOOL v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  id v166;
  _BYTE *v167;
  _BYTE *v168;
  id v169;
  uint64_t i;
  NSObject *v171;
  optional<rose::RoseServiceRequest> *result;
  id v173;
  id v174;
  uint64_t v175;
  unsigned int v176;
  NSObject *v177;
  char *v178;
  uint8_t *v179;
  __int16 v180;
  NSObject *v181;
  NSObject *v182;
  id v183;
  void *v185;
  id v186;
  id WeakRetained;
  uint8_t buf[8];
  char v189;
  uint8_t v190[4];
  uint8_t *v191;
  int v192;
  unsigned __int16 v193;
  char v194;
  unsigned __int16 v195;
  char v196;
  uint64_t v197;
  char v198;
  unsigned __int16 v199;
  char v200;
  uint64_t v201;
  char v202;
  _BYTE v203[7];
  unsigned __int8 v204;
  int v205;
  unsigned __int8 v206;
  unsigned __int16 v207;
  char v208;
  int v209;
  __int16 v210;
  BOOL v211;
  char v212;
  char v213;
  __int16 v214;
  char v215;
  uint64_t v216;
  char v217;
  __int128 v218;
  int v219;

  v186 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
  v8 = objc_msgSend(v7, "copy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getResourcesManager"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "discoveryToken"));

  v185 = (void *)v10;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E3B74();
    goto LABEL_118;
  }
  v194 = 0;
  v198 = 0;
  LOBYTE(v199) = 0;
  v200 = 0;
  v202 = 0;
  v192 = 0;
  LOBYTE(v193) = 0;
  LODWORD(v197) = 0;
  *(_DWORD *)((char *)&v197 + 3) = 0;
  LODWORD(v201) = 0;
  *(_DWORD *)((char *)&v201 + 3) = 0;
  memset(v203, 0, sizeof(v203));
  LOBYTE(v207) = 0;
  v208 = 0;
  v206 = 0;
  v205 = 0;
  v210 = 0;
  v209 = 0;
  v211 = 1;
  v212 = 0;
  v213 = 0;
  LOBYTE(v214) = 0;
  v215 = 0;
  LOBYTE(v216) = 0;
  v217 = 0;
  v218 = 0uLL;
  v195 = a5;
  v196 = 1;
  v11 = sub_100004784();
  v204 = sub_100395798((uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("nbTxAntenna")));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("nbTxAntenna")));
      LOWORD(v192) = objc_msgSend(v16, "intValue") | 0x100;

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("nbRxAntenna")));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("nbRxAntenna")));
      HIWORD(v192) = objc_msgSend(v21, "intValue") | 0x100;

    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("nbPacketType")));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", CFSTR("nbPacketType")));
      v193 = (unsigned __int16)objc_msgSend(v26, "intValue");
      v194 = 1;

    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("nbBandChannel")));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("nbBandChannel")));
      v195 = (unsigned __int16)objc_msgSend(v31, "intValue");
      v196 = 1;

    }
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", CFSTR("mmsTxAntenna")));

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", CFSTR("mmsTxAntenna")));
      LOWORD(v197) = objc_msgSend(v36, "intValue") | 0x100;

    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", CFSTR("mmsRxAntenna")));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("mmsRxAntenna")));
      WORD1(v197) = objc_msgSend(v41, "intValue") | 0x100;

    }
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKey:", CFSTR("mmsRxSyncAntenna")));

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", CFSTR("mmsRxSyncAntenna")));
      WORD2(v197) = objc_msgSend(v46, "intValue") | 0x100;

    }
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v47)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("mmsPacketType")));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKey:", CFSTR("mmsPacketType")));
      HIWORD(v197) = (unsigned __int16)objc_msgSend(v51, "intValue");
      v198 = 1;

    }
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v52)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("mmsPSR")));

    if (v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", CFSTR("mmsPSR")));
      *(_WORD *)v203 = objc_msgSend(v56, "intValue") | 0x100;

    }
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKey:", CFSTR("mmsGap")));

    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKey:", CFSTR("mmsGap")));
      *(_WORD *)&v203[2] = objc_msgSend(v61, "intValue") | 0x100;

    }
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKey:", CFSTR("mmsSeqIdx")));

    if (v64)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKey:", CFSTR("mmsSeqIdx")));
      *(_WORD *)&v203[4] = objc_msgSend(v66, "intValue") | 0x100;

    }
  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKey:", CFSTR("mmsBandChannel")));

    if (v69)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "objectForKey:", CFSTR("mmsBandChannel")));
      v199 = (unsigned __int16)objc_msgSend(v71, "intValue");
      v200 = 1;

    }
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v72)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "objectForKey:", CFSTR("nbSlotSize")));

    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKey:", CFSTR("nbSlotSize")));
      WORD1(v201) = objc_msgSend(v76, "intValue") | 0x100;

    }
  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v77)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKey:", CFSTR("mmsSlotSize")));

    if (v79)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKey:", CFSTR("mmsSlotSize")));
      WORD2(v201) = objc_msgSend(v81, "intValue") | 0x100;

    }
  }
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v82)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKey:", CFSTR("mmsNumFragments")));

    if (v84)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKey:", CFSTR("mmsNumFragments")));
      LOWORD(v201) = objc_msgSend(v86, "intValue") | 0x100;

    }
  }
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v87)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", CFSTR("interval")));

    if (v89)
    {
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKey:", CFSTR("interval")));
      HIWORD(v201) = (unsigned __int16)objc_msgSend(v91, "intValue");
      v202 = 1;

    }
  }
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v92)
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKey:", CFSTR("enableNonInterlacedMMS")));

    if (v94)
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKey:", CFSTR("enableNonInterlacedMMS")));
      v203[6] = objc_msgSend(v96, "BOOLValue");

    }
  }
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v97)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "objectForKey:", CFSTR("enableAntennaDiversity")));

    if (v99)
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKey:", CFSTR("enableAntennaDiversity")));
      v204 = objc_msgSend(v101, "BOOLValue");

    }
  }
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v102)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "objectForKey:", CFSTR("useDedicatedAntennas")));

    if (v104)
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "objectForKey:", CFSTR("useDedicatedAntennas")));
      BYTE1(v205) = objc_msgSend(v106, "BOOLValue");

    }
  }
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v107)
  {
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectForKey:", CFSTR("overrideDefaultAntenna")));

    if (v109)
    {
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "objectForKey:", CFSTR("overrideDefaultAntenna")));
      BYTE2(v205) = objc_msgSend(v111, "BOOLValue");

    }
  }
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v112)
  {
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "objectForKey:", CFSTR("useTestNbammsMode")));

    if (v114)
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "objectForKey:", CFSTR("useTestNbammsMode")));
      v206 = objc_msgSend(v116, "BOOLValue");

    }
  }
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v117)
  {
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKey:", CFSTR("antennaDiversityMask")));

    if (v119)
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "objectForKey:", CFSTR("antennaDiversityMask")));
      HIBYTE(v205) = objc_msgSend(v121, "intValue");

    }
  }
  v122 = sub_100004784();
  LOBYTE(v205) = sub_100395798((uint64_t)v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v124 = objc_msgSend(v123, "BOOLForKey:", CFSTR("DisableDualRxChain"));

  if (v124)
    LOBYTE(v205) = 0;
  useTestNbammsMode = self->_useTestNbammsMode;
  v126 = (id)qword_10085F520;
  v127 = os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT);
  if (useTestNbammsMode)
  {
    if (v127)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "#peer-nba,Test NBAMMS mode enabled", buf, 2u);
    }

    v206 = 1;
    v216 = 0x1010101010101010;
    v217 = 1;
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    if (v128)
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "objectForKey:", CFSTR("baseMacAddress")));
      v131 = v130 == 0;

      if (!v131)
      {
        v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
        v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectForKey:", CFSTR("baseMacAddress")));

        if (v133)
        {
          v216 = (uint64_t)objc_msgSend(v133, "longLongValue");
          v217 = 1;
        }

      }
    }
    if (!v215)
      v215 = 1;
    v214 = 4864;
LABEL_81:
    v219 = 6;
    sub_1001650A4((char *)&v192, !self->_isInitiator, (uint64_t)buf);
    operator new();
  }
  if (v127)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "#peer-nba,POR NBAMMS mode enabled", buf, 2u);
  }

  v206 = 0;
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v134)
  {
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "objectForKey:", CFSTR("nbChannelSelectionMask")));
    v137 = v136 == 0;

    if (!v137)
    {
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "objectForKey:", CFSTR("nbChannelSelectionMask")));
      v140 = (unsigned __int16)objc_msgSend(v139, "intValue");
      if (!v208)
        v208 = 1;
      v207 = v140;

    }
  }
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v141)
  {
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKey:", CFSTR("napSlotSize")));
    v144 = v143 == 0;

    if (!v144)
    {
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKey:", CFSTR("napSlotSize")));
      v147 = objc_msgSend(v146, "intValue");
      if (!BYTE1(v209))
        BYTE1(v209) = 1;
      LOBYTE(v209) = v147;

    }
  }
  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v148)
  {
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "objectForKey:", CFSTR("dataSlotSize")));
    v151 = v150 == 0;

    if (!v151)
    {
      v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "objectForKey:", CFSTR("dataSlotSize")));
      v154 = objc_msgSend(v153, "intValue");
      if (!HIBYTE(v209))
        HIBYTE(v209) = 1;
      BYTE2(v209) = v154;

    }
  }
  v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
  if (v155)
  {
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "objectForKey:", CFSTR("useType2Addr")));
    v158 = v157 == 0;

    if (!v158)
    {
      v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugParameters"));
      v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKey:", CFSTR("useType2Addr")));
      v211 = objc_msgSend(v160, "intValue") != 0;

    }
  }
  if (!v186)
    __assert_rtn("-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]", "NIServerNearbyPeerNbammsSession.mm", 683, "token != nil");
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v186, "getIRK"));
  v162 = v161;
  if (!v161)
  {
    v171 = (id)qword_10085F520;
    if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
      sub_1003E3E84();

LABEL_118:
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    goto LABEL_119;
  }
  if (objc_msgSend(v161, "length") != (id)16)
    __assert_rtn("-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]", "NIServerNearbyPeerNbammsSession.mm", 691, "[peerIRK length] == kNbammsIRKLengthBytes");
  v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "getIRK"));
  v164 = v163;
  if (v163)
  {
    if (objc_msgSend(v163, "length") != (id)16)
      __assert_rtn("-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]", "NIServerNearbyPeerNbammsSession.mm", 698, "[selfIRK length] == kNbammsIRKLengthBytes");
    v165 = v164;
    v166 = v162;
    v183 = v165;
    if (objc_msgSend(v165, "length") == (id)16 && objc_msgSend(v166, "length") == (id)16)
    {
      v167 = objc_msgSend(objc_retainAutorelease(v165), "bytes");
      v168 = objc_msgSend(objc_retainAutorelease(v166), "bytes");
      v169 = objc_alloc_init((Class)NSMutableData);
      for (i = 0; i != 16; ++i)
      {
        buf[0] = v168[i] ^ v167[i];
        objc_msgSend(v169, "appendBytes:length:", buf, 1);
      }
      if (objc_msgSend(v169, "length") != (id)16)
        __assert_rtn("generateCombinedIRK", "NIServerNearbyPeerNbammsSession.mm", 1112, "[xorIRK length] == kNbammsIRKLengthBytes");
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E3EDC();
      v169 = 0;
    }

    if (v169)
    {
      v173 = objc_retainAutorelease(v169);
      v218 = *(_OWORD *)objc_msgSend(v173, "bytes");
      v174 = objc_retainAutorelease(v173);
      v175 = SipHash(objc_msgSend(v174, "bytes"), &unk_100474AA8, 8);

      v216 = v175;
      v217 = 1;
      v176 = -[NIServerNearbyPeerNbammsSession _getRangingAcquisitionType](self, "_getRangingAcquisitionType");
      v177 = (id)qword_10085F520;
      if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
      {
        v178 = v176 ? "BTAidedAcquisition" : "DirectAcquisition";
        sub_10000BF04(buf, v178);
        v179 = v189 >= 0 ? buf : *(uint8_t **)buf;
        *(_DWORD *)v190 = 136315138;
        v191 = v179;
        _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "#peer-nba,ranging acquisition type = %s", v190, 0xCu);
        if (v189 < 0)
          operator delete(*(void **)buf);
      }

      if (v176 == 1)
      {
        v180 = 4865;
        if (v215)
          goto LABEL_137;
      }
      else
      {
        if (v176)
        {
LABEL_138:

          goto LABEL_81;
        }
        v180 = 4864;
        if (v215)
        {
LABEL_137:
          v214 = v180;
          goto LABEL_138;
        }
      }
      v215 = 1;
      goto LABEL_137;
    }
    v182 = (id)qword_10085F520;
    if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
      sub_1003E3EB0();

    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

  }
  else
  {
    v181 = (id)qword_10085F520;
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
      sub_1003E3E84();

    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;

  }
LABEL_119:

  return result;
}

- (unsigned)_getRangingTimeoutWithKey:(id)a3 timeoutIfNoOverride:(unsigned __int16)a4
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  int v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  if (v7 && (v9 = objc_opt_class(NSNumber, v8), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
  {
    v10 = objc_msgSend(v7, "intValue");
    v11 = qword_10085F520;
    v12 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    if (v10 < 0x10000)
    {
      if (v12)
      {
        v18 = 138412546;
        v19 = v5;
        v20 = 1024;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#peer-nba,Timeout override found for key %@. Returning %d", (uint8_t *)&v18, 0x12u);
      }
      LOWORD(v4) = v10;
    }
    else
    {
      LOWORD(v4) = -1;
      if (v12)
      {
        v18 = 138412802;
        v19 = v5;
        v20 = 1024;
        v21 = v10;
        v22 = 1024;
        v23 = 0xFFFF;
        v13 = "#peer-nba,Timeout override found for key %@. Override value %d exceeds max value %d. Returning max value.";
        v14 = v11;
        v15 = 24;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
      }
    }
  }
  else
  {
    v16 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v5;
      v20 = 1024;
      v21 = v4;
      v13 = "#peer-nba,No timeout override found for key %@. Returning timeout %d";
      v14 = v16;
      v15 = 18;
      goto LABEL_8;
    }
  }

  return v4;
}

- (int)_getRangingTriggerType
{
  if (-[NIServerNearbyPeerNbammsSession shouldBypassBleDiscovery](self, "shouldBypassBleDiscovery"))
    return 0;
  if (self->_useTestNbammsMode)
    sub_1003E3F08();
  return 1;
}

- (int)_getRangingAcquisitionType
{
  if (-[NIServerNearbyPeerNbammsSession shouldBypassBleDiscovery](self, "shouldBypassBleDiscovery"))
    return 0;
  if (self->_useTestNbammsMode)
    sub_1003E3F30();
  return !-[NIServerNearbyPeerNbammsSession _doesWantTriggeredDutyCycledAcquisition](self, "_doesWantTriggeredDutyCycledAcquisition");
}

- (BOOL)_doesWantTriggeredDutyCycledAcquisition
{
  unsigned int v3;
  float v4;

  v3 = -[NIServerNearbyPeerNbammsSession _getSchedulingIntervalForTriggeredDutyCycledAcquisition](self, "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
  -[NIServerNearbyPeerNbammsSession _getDutyCycleForTriggeredDutyCycledAcquisition](self, "_getDutyCycleForTriggeredDutyCycledAcquisition");
  return v4 <= 1.0 && v3 != 0;
}

- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition
{
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
  v5 = objc_msgSend(v4, "copy");

  if (self->_isInitiator)
    v6 = 30000;
  else
    v6 = 29000;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("FindingDisableDutyCycledAcquisition"));

  if (v8)
    v9 = 0;
  else
    v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("FindingSchedulingInterval")));

  if (v11)
  {
    v13 = objc_opt_class(NSNumber, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
      v9 = objc_msgSend(v11, "intValue");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugParameters"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugParameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("schedulingInterval")));

    if (v16)
      v9 = objc_msgSend(v16, "intValue");

  }
  return v9;
}

- (float)_getDutyCycleForTriggeredDutyCycledAcquisition
{
  id WeakRetained;
  void *v4;
  id v5;
  float v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
  v5 = objc_msgSend(v4, "copy");

  if (self->_isInitiator)
    v6 = 0.0;
  else
    v6 = 0.1034;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("FindingDisableDutyCycledAcquisition"));

  if (v8)
    v6 = 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("FindingDutyCycle")));

  if (v10)
  {
    v12 = objc_opt_class(NSNumber, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      v6 = v13;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugParameters"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugParameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("dutyCycle")));

    if (v16)
    {
      objc_msgSend(v16, "floatValue");
      v6 = v17;
    }

  }
  return v6;
}

- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4
{
  float v5;
  NSObject *v6;
  uint8_t v8[16];

  v5 = (float)((unint64_t)(a4 - 17000) - 2000);
  if ((float)((float)a4 * a3) > v5)
  {
    v6 = qword_10085F520;
    a3 = v5 / (float)a4;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#peer-nba,Provided duty cycle leads to scan window > scheduling interval - (start time offset + interface delays), using entire available scan window", v8, 2u);
    }
  }
  return a3;
}

- (optional<unsigned)_getDitherConst
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  _BOOL4 v6;
  __int16 v7;
  unsigned __int8 v8;
  const char *v9;
  uint8_t *v10;
  _BOOL4 v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int16 v23;
  uint8_t buf[2];

  if (self->_isInitiator)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("FindingDisableDitheredAcq"));

    if (v4)
    {
      v5 = qword_10085F520;
      v6 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
      v7 = 0;
      v8 = 0;
      if (v6)
      {
        v23 = 0;
        v9 = "#peer-nba,Dithered duty cycled acquisition is disabled using defaults write";
        v10 = (uint8_t *)&v23;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        v7 = 0;
        v8 = 0;
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
      v14 = objc_msgSend(v13, "copy");

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("FindingDitherConst")));

      if (v16 && (v18 = objc_opt_class(NSNumber, v17), (objc_opt_isKindOfClass(v16, v18) & 1) != 0))
        v8 = objc_msgSend(v16, "intValue");
      else
        v8 = 10;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "debugParameters"));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "debugParameters"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("ditherConst")));

        if (v21)
          v8 = objc_msgSend(v21, "intValue");

      }
      v7 = 1;
    }
  }
  else
  {
    v5 = qword_10085F520;
    v11 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
    v7 = 0;
    v8 = 0;
    if (v11)
    {
      *(_WORD *)buf = 0;
      v9 = "#peer-nba,Dithered duty cycled acquisition not valid for responder";
      v10 = buf;
      goto LABEL_7;
    }
  }
  return (optional<unsigned char>)(v8 | (unsigned __int16)(v7 << 8));
}

- (optional<SecondarySchedulingParameters>)_getSecondarySchedulingParameters
{
  uint64_t v2;
  unsigned int v3;
  const mach_header_64 *v4;
  int v5;
  unsigned int v6;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  float v35;
  uint64_t v36;
  float v37;
  int v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  float v43;
  BOOL v45;
  unsigned int v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  optional<SecondarySchedulingParameters> result;

  if (self->_isInitiator)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E3F58();
    v4 = 0;
    LOBYTE(v5) = 0;
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getNIConfiguration"));
    v10 = objc_msgSend(v9, "copy");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("FindingDisableDutyCycledAcquisition"));

    if ((v12 & 1) != 0)
    {
      v4 = 0;
      LOBYTE(v5) = 0;
      v6 = 0;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("FindingSecondarySchedulingDelay")));

      v49 = v14;
      if (v14 && (v16 = objc_opt_class(NSNumber, v15), (objc_opt_isKindOfClass(v14, v16) & 1) != 0))
      {
        v17 = objc_msgSend(v14, "intValue", v14);
        v18 = 1;
      }
      else
      {
        v17 = 0;
        v18 = 0;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugParameters", v49));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugParameters"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("secondarySchedulingDelay")));

        if (v21)
        {
          v17 = objc_msgSend(v21, "intValue");
          v18 = 1;
        }

      }
      if (v17)
        v22 = v18 == 0;
      else
        v22 = 1;
      if (v22)
        v5 = 30000000;
      else
        v5 = v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("FindingSecondarySchedulingInterval")));

      if (v24 && (v26 = objc_opt_class(NSNumber, v25), (objc_opt_isKindOfClass(v24, v26) & 1) != 0))
      {
        LODWORD(v2) = objc_msgSend(v24, "intValue");
        v27 = 1;
      }
      else
      {
        LODWORD(v2) = 0;
        v27 = 0;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugParameters"));

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugParameters"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", CFSTR("secondarySchedulingInterval")));

        if (v30)
        {
          LODWORD(v2) = objc_msgSend(v30, "intValue");
          v27 = 1;
        }

      }
      if ((_DWORD)v2)
        v31 = v27 == 0;
      else
        v31 = 1;
      if (v31)
        v2 = 59000;
      else
        v2 = v2;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("FindingSecondaryDutyCycle")));

      v35 = 0.0;
      if (v33)
      {
        v36 = objc_opt_class(NSNumber, v34);
        if ((objc_opt_isKindOfClass(v33, v36) & 1) != 0)
        {
          objc_msgSend(v33, "floatValue");
          v35 = v37;
          v38 = 1;
        }
        else
        {
          v38 = 0;
        }
      }
      else
      {
        v38 = 0;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugParameters"));

      if (v39)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugParameters"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("secondaryDutyCycle")));

        if (v42)
        {
          objc_msgSend(v42, "floatValue");
          v35 = v43;
          v38 = 1;
        }

      }
      v45 = v35 > 1.0 || v35 <= 0.0 || v38 == 0;
      LODWORD(v40) = 1028658089;
      if (!v45)
        *(float *)&v40 = v35;
      -[NIServerNearbyPeerNbammsSession _adjustDutyCycleForInterfaceDelays:schedulingInterval:](self, "_adjustDutyCycleForInterfaceDelays:schedulingInterval:", v2, v40);
      v3 = v46;
      v6 = v5 & 0xFFFFFF00;

      v4 = &_mh_execute_header;
    }

  }
  v47 = v6 & 0xFFFFFF00 | v5 | (unint64_t)(v2 << 32);
  v48 = (unint64_t)v4 & (unint64_t)&_mh_execute_header | v3;
  *(_QWORD *)&result.var0.var1.var2 = v48;
  *(_QWORD *)&result.var0.var0 = v47;
  return result;
}

- (unsigned)_getNbUwbAcquisitionBandChannel:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  int v11;
  NSObject *v12;
  _BOOL4 useTestNbammsMode;
  _BOOL4 isInitiator;
  int v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;

  v4 = a3;
  v5 = v4;
  if (self->_useTestNbammsMode)
  {
    v6 = 5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectInRawTokenOPACKDictForKey:", &off_10082C0E8));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectInRawTokenOPACKDictForKey:", &off_10082C0E8));
      v6 = objc_msgSend(v8, "integerValue");

    }
    else
    {
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E3F84(v9);
      v6 = 2;
    }
  }
  if (self->_useTestNbammsMode)
    v10 = 1;
  else
    v10 = 6;
  LOBYTE(v16) = v10;
  *(_WORD *)((char *)&v16 + 1) = 0;
  LOWORD(v17) = v6;
  BYTE2(v17) = 1;
  v11 = sub_10036C5B8((unsigned __int8 *)&v16);
  v12 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    useTestNbammsMode = self->_useTestNbammsMode;
    isInitiator = self->_isInitiator;
    v16 = 67109888;
    v17 = useTestNbammsMode;
    v18 = 1024;
    v19 = isInitiator;
    v20 = 1024;
    v21 = v6;
    v22 = 1024;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#peer-nba,startRangingWithPeer: testMode: %d, isInitiator: %d, NapChIdx: %d, NapBch: %d", (uint8_t *)&v16, 0x1Au);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  sub_10001AE68((uint64_t)&self->_nbammsSession);
  sub_10001AE68((uint64_t)&self->_pbLogger);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
