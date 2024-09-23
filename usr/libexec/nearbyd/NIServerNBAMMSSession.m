@implementation NIServerNBAMMSSession

- (NIServerNBAMMSSession)initWithQueue:(id)a3 identityString:(id)a4 stateUpdateHandler:(id)a5 mutualAuthHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NIServerNBAMMSSession *v15;
  NIServerNBAMMSSession *v16;
  NIServerNBAMMSSession *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NIDiscoveryToken *sessionToken;
  _QWORD *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  NIServerCryptoSession *selfEncryptionSession;
  NIServerCryptoSession *peerDecryptionSession;
  char v31;
  void *secondary_scheduling_delay_usec;
  NIDiscoveryToken *finderToken;
  double velocityChangeH2;
  NSData *outboundChallenge;
  id v36;
  double val;
  id v38;
  void *v39;
  __int128 v41;
  objc_super v42;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v42.receiver = self;
  v42.super_class = (Class)NIServerNBAMMSSession;
  v15 = -[NIServerNBAMMSSession init](&v42, "init");
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_internalQueue, a3);
    objc_storeStrong((id *)&v16->_identityString, a4);
    v41 = 0uLL;
    sub_1000145E8((uint64_t)&v16->_nbammsSession, &v41);
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v17->_sessionState = 0;
    sessionToken = v17->_sessionToken;
    v17->_sessionToken = 0;

    if (v17->_sessionStartRangingOptions.__engaged_)
      v17->_sessionStartRangingOptions.__engaged_ = 0;
    v17->_sharedProtocol = -1;
    v22 = sub_1002CA108();
    v23 = v22[21];
    *(_QWORD *)&v41 = v22[20];
    *((_QWORD *)&v41 + 1) = v23;
    if (v23)
    {
      v24 = (unint64_t *)(v23 + 8);
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    sub_1000145E8((uint64_t)&v16->_pbLogger, &v41);
    v26 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v27 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v17->_measurementsReceived = 0;
    selfEncryptionSession = v17->_selfEncryptionSession;
    v17->_selfEncryptionSession = 0;

    peerDecryptionSession = v17->_peerDecryptionSession;
    v17->_peerDecryptionSession = 0;

    if (-[NIServerNBAMMSSession _isCryptoDisabled](v17, "_isCryptoDisabled", (_QWORD)v41))
      v31 = 3;
    else
      v31 = 0;
    v17->_cryptoSessionState = v31;
    v17->_cryptoFailures = 0;
    v17->_finderAttached = 0;
    objc_storeWeak((id *)&v16->_finderClient, 0);
    sub_10021B6D8((uint64_t)&v16->_finderMutualAuthState);
    secondary_scheduling_delay_usec = (void *)v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0;

    v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    finderToken = v17->_finderToken;
    v17->_finderToken = 0;

    if (v17->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_)
      v17->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    if (LOBYTE(v17->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec))
      LOBYTE(v17->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 0;
    if (v17->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
      v17->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    if (BYTE2(v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
      BYTE2(v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    HIBYTE(v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    objc_storeWeak((id *)&v16->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, 0);
    sub_10021B6D8((uint64_t)&v16->_finderStartRangingOptions.__engaged_);
    velocityChangeH2 = v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2 = 0.0;

    v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    outboundChallenge = v17->_findeeMutualAuthState.outboundChallenge;
    v17->_findeeMutualAuthState.outboundChallenge = 0;

    if (v17->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_)
      v17->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
    if (v17->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12])
      v17->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
    if (v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
      v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    if (BYTE1(v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
      BYTE1(v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    if (*(&v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2))
      *(&v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
    v36 = objc_retainBlock(v13);
    val = v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
    *(_QWORD *)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_ = v36;

    v38 = objc_retainBlock(v14);
    v39 = *(void **)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_;
    *(_QWORD *)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v38;

    *(_DWORD *)&v17->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_ = 0;
    *(_QWORD *)&v17->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty = 0;
    *(_OWORD *)&v16->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__null_state_ = 0u;
  }

  return v17;
}

- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8
{
  _BOOL4 v11;
  id v14;
  NSObject *v15;
  id v16;
  NSString *identityString;
  void *v18;
  shared_ptr<rose::objects::NBAMMSSession> *p_nbammsSession;
  int *p_sharedProtocol;
  NSObject *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  char v27;
  id v28;
  _BOOL4 engaged;
  int scheduling_interval_usec_low;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v34;
  __int128 v35;
  BOOL *p_engaged;
  id v37;
  _BOOL4 v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  NSObject *v45;
  NSString *v46;
  id v47;
  _BOOL4 v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v53;
  __int128 v54;
  BOOL *v55;
  id v56;
  _BOOL4 v57;
  int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  double v64;
  _BOOL4 v65;
  __int128 v66;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  void *v74;
  unsigned int v76;
  uint64_t v77;
  void *v78;
  unsigned int v79;
  NSObject *v80;
  NSObject *v81;
  NSString *v82;
  NSObject *v83;
  NSString *v84;
  NBAMMSSession *ptr;
  NIDiscoveryToken *sessionToken;
  void *p_finderRoseServiceRequest;
  __int128 *p_null_state;
  void *v89;
  int v90;
  NSObject *v91;
  double val;
  uint64_t v93;
  char *v94;
  __int128 v95;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v96;
  __int128 v97;
  void *v98;
  id v99;
  NSErrorUserInfoKey v100;
  const __CFString *v101;
  NSErrorUserInfoKey v102;
  const __CFString *v103;
  NSErrorUserInfoKey v104;
  const __CFString *v105;
  NSErrorUserInfoKey v106;
  const __CFString *v107;
  __int128 v108;
  NSErrorUserInfoKey v109;
  const __CFString *v110;
  uint8_t buf[4];
  NSString *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  const char *v116;

  v98 = (void *)a7;
  v11 = a4;
  v99 = a3;
  v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v15 = (id)qword_10085F520;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v14;
    identityString = self->_identityString;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "descriptionInternal"));
    *(_DWORD *)buf = 138412802;
    v112 = identityString;
    v113 = 2112;
    v114 = v18;
    v115 = 2080;
    v116 = sub_1002B69E0(v11);
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-range,Registering %@ with token %@, role %s", buf, 0x20u);

    v14 = v16;
  }

  if (!v99)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFA50();
LABEL_14:
    p_nbammsSession = (shared_ptr<rose::objects::NBAMMSSession> *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10012, 0, v98));
    goto LABEL_95;
  }
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFA7C();
    v109 = NSLocalizedFailureReasonErrorKey;
    v110 = CFSTR("Client is nil");
    v21 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1, v98));
    v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v21));
    goto LABEL_26;
  }
  p_nbammsSession = &self->_nbammsSession;
  if (self->_nbammsSession.__ptr_)
  {
    p_sharedProtocol = &self->_sharedProtocol;
    if (self->_sharedProtocol == a8)
    {
      if (!self->_finderAttached && !self->_finderToken && v11)
      {
        self->_finderAttached = 1;
        objc_storeWeak((id *)&self->_finderClient, v14);
        sub_10021B6D8((uint64_t)&self->_finderMutualAuthState);
        if (BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
          BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 1;
        objc_storeStrong((id *)&self->_finderToken, a3);
        v28 = v14;
        engaged = self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
        memcpy(&self->_finderRoseServiceRequest, a6, 0x1F8uLL);
        if (!engaged)
          self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
        scheduling_interval_usec_low = LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec);
        v32 = *((_OWORD *)v98 + 1);
        v31 = *((_OWORD *)v98 + 2);
        *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)v98;
        *(_OWORD *)self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v32;
        *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v31;
        v33 = *((_OWORD *)v98 + 6);
        v35 = *((_OWORD *)v98 + 3);
        v34 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)v98 + 4);
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v98 + 5);
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.start_time_or_offset_usec = v33;
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__null_state_ = v35;
        *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                             + 12) = v34;
        if (!scheduling_interval_usec_low)
          LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 1;
        v14 = v28;
        if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
        {
          p_engaged = &self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
LABEL_53:
          *p_engaged = 0;
          goto LABEL_54;
        }
        goto LABEL_54;
      }
      if (!HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
        && !self->_findeeMutualAuthState.outboundChallenge
        && !v11)
      {
        HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 1;
        objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, v14);
        sub_10021B6D8((uint64_t)&self->_finderStartRangingOptions.__engaged_);
        if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2))
          *(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
        self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 1;
        objc_storeStrong((id *)&self->_findeeMutualAuthState.outboundChallenge, a3);
        v37 = v14;
        v38 = self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_;
        memcpy(&self->_findeeMutualAuthState.outboundResponse, a6, 0x1F8uLL);
        if (!v38)
          self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 1;
        v39 = self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12];
        v41 = *((_OWORD *)v98 + 1);
        v40 = *((_OWORD *)v98 + 2);
        self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr = *(optional<unsigned long long> *)v98;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.contention_based_ranging_type.var0.__null_state_ = v41;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.nb_bch.var0.__null_state_ = v40;
        v42 = *((_OWORD *)v98 + 6);
        v44 = *((_OWORD *)v98 + 3);
        v43 = *((_OWORD *)v98 + 4);
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = *((_OWORD *)v98 + 5);
        *(_OWORD *)&self->_findeeStartRangingOptions.var0.__null_state_ = v42;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = v44;
        *(_OWORD *)self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v43;
        if (!v39)
          self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 1;
        v14 = v37;
        if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
          self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
        if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
        {
          p_engaged = (BOOL *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1
                    + 1;
          goto LABEL_53;
        }
LABEL_54:
        if (!self->_finderAttached
          || !HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
        {
          goto LABEL_91;
        }
        if (self->_measurementsReceived)
        {
          v45 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal finding, measurements already received, do nothing", buf, 2u);
          }
          v21 = (id)qword_10085F520;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v46 = (NSString *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _getState](self, "_getState"));
            *(_DWORD *)buf = 138412290;
            v112 = v46;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after register): %@", buf, 0xCu);

          }
LABEL_93:
          p_nbammsSession = 0;
          goto LABEL_94;
        }
        if (-[NIServerNBAMMSSession _validateTokensAndRangingParameters](self, "_validateTokensAndRangingParameters"))
        {
          v76 = -[NIServerNBAMMSSession _shouldUseFinderToken:findeeToken:](self, "_shouldUseFinderToken:findeeToken:", self->_finderToken, self->_findeeMutualAuthState.outboundChallenge);
          v77 = 1040;
          if (v76)
            v77 = 304;
          v78 = *(Class *)((char *)&self->super.isa + v77);
          v21 = v78;
          v79 = -[NIDiscoveryToken isEqual:](self->_sessionToken, "isEqual:", v21);
          v80 = qword_10085F520;
          if (v79)
          {
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal finding, ranging started with the right token, do nothing", buf, 2u);
            }
            v81 = (id)qword_10085F520;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              v82 = (NSString *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _getState](self, "_getState"));
              *(_DWORD *)buf = 138412290;
              v112 = v82;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after register): %@", buf, 0xCu);

            }
            goto LABEL_93;
          }
          v83 = (id)qword_10085F520;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            v84 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject descriptionInternal](v21, "descriptionInternal"));
            *(_DWORD *)buf = 138412290;
            v112 = v84;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal finding, re-configuring with new token %@", buf, 0xCu);

          }
          self->_measurementsReceived = 0;
          ptr = self->_nbammsSession.__ptr_;
          if (ptr)
          {
            sub_1002AE5BC((uint64_t)ptr);
            sub_100180AF4(&self->_nbammsSession.__ptr_);
            sessionToken = self->_sessionToken;
            self->_sessionToken = 0;

            if (self->_sessionStartRangingOptions.__engaged_)
              self->_sessionStartRangingOptions.__engaged_ = 0;
            -[NIServerNBAMMSSession _resetStatistics](self, "_resetStatistics", v98);
            -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 1);
          }
          if (v76)
          {
            if (self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_)
            {
              p_finderRoseServiceRequest = &self->_finderRoseServiceRequest;
              goto LABEL_118;
            }
          }
          else if (self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_)
          {
            p_finderRoseServiceRequest = &self->_findeeMutualAuthState.outboundResponse;
LABEL_118:
            -[NIServerNBAMMSSession _buildNbammsSession:](self, "_buildNbammsSession:", p_finderRoseServiceRequest, v98);
            if (!(_QWORD)v108)
            {
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                sub_1003DFAA8();
              v100 = NSLocalizedFailureReasonErrorKey;
              v101 = CFSTR("Could not build ranging session");
              v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
              p_nbammsSession = (shared_ptr<rose::objects::NBAMMSSession> *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v89));

              goto LABEL_131;
            }
            if (v76)
            {
              if (LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec))
              {
                p_null_state = (__int128 *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_;
LABEL_127:
                v90 = sub_1002B1704(v108, p_null_state);
                if (v90)
                {
                  v91 = (id)qword_10085F520;
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                  {
                    sub_1002B48B0(v90, buf);
                    sub_1003DFAD4();
                  }

                  p_nbammsSession = (shared_ptr<rose::objects::NBAMMSSession> *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
LABEL_131:
                  sub_10001AE68((uint64_t)&v108);
                  goto LABEL_94;
                }
                sub_100021C24(&self->_nbammsSession.__ptr_, (uint64_t *)&v108);
                objc_storeStrong((id *)&self->_sessionToken, v78);
                self->_sessionState = 1;
                val = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
                if (val != 0.0)
                  (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(_QWORD *)&val + 16))(COERCE_DOUBLE(*(_QWORD *)&val), self, 1);
                v93 = 1560;
                if (v76)
                  v93 = 824;
                v94 = (char *)self + v93;
                v95 = *((_OWORD *)v94 + 5);
                *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.scheduling_interval_usec = *((_OWORD *)v94 + 4);
                *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v95;
                *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = *((_OWORD *)v94 + 6);
                v96 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)v94 + 1);
                *(_OWORD *)&self->_sessionStartRangingOptions.var0.__null_state_ = *(_OWORD *)v94;
                *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                                     + 12) = v96;
                v97 = *((_OWORD *)v94 + 3);
                *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v94 + 2);
                self->_sessionStartRangingOptions.__engaged_ = v94[112];
                *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.start_time_or_offset_usec = v97;
                -[NIServerNBAMMSSession _resetStatistics](self, "_resetStatistics");
                -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 1);
                -[NIServerNBAMMSSession _updateSessionPayload](self, "_updateSessionPayload");
                sub_10001AE68((uint64_t)&v108);

                goto LABEL_91;
              }
            }
            else if (self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12])
            {
              p_null_state = (__int128 *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr.var0;
              goto LABEL_127;
            }
            sub_10000BA44();
          }
          sub_10000BA44();
        }
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DFB24();
      v102 = NSLocalizedFailureReasonErrorKey;
      v103 = CFSTR("Could not attache to existing NBAMMS session");
      v21 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1, v98));
      v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v21));
    }
    else
    {
      v25 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DFB50(p_sharedProtocol, a8, v25);
      v104 = NSLocalizedFailureReasonErrorKey;
      v105 = CFSTR("Shared protocols not matching");
      v21 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1, v98));
      v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v21));
    }
LABEL_26:
    p_nbammsSession = (shared_ptr<rose::objects::NBAMMSSession> *)v22;
LABEL_94:

    goto LABEL_95;
  }
  -[NIServerNBAMMSSession _buildNbammsSession:](self, "_buildNbammsSession:", a6);
  if (!(_QWORD)v108)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFAA8();
    v106 = NSLocalizedFailureReasonErrorKey;
    v107 = CFSTR("Could not build ranging session");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1, v98));
    p_nbammsSession = (shared_ptr<rose::objects::NBAMMSSession> *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -10020, v26));

    goto LABEL_30;
  }
  v23 = sub_1002B1704(v108, (__int128 *)v98);
  if (v23)
  {
    v24 = (id)qword_10085F520;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v23, buf);
      sub_1003DFAD4();
    }

    p_nbammsSession = (shared_ptr<rose::objects::NBAMMSSession> *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NearbyInteraction"), -5887, 0));
LABEL_30:
    v27 = 0;
    goto LABEL_86;
  }
  if (v11)
  {
    self->_finderAttached = 1;
    objc_storeWeak((id *)&self->_finderClient, v14);
    objc_storeStrong((id *)&self->_finderToken, a3);
    v47 = v14;
    v48 = self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
    memcpy(&self->_finderRoseServiceRequest, a6, 0x1F8uLL);
    if (!v48)
      self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    v49 = LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec);
    v51 = *((_OWORD *)v98 + 1);
    v50 = *((_OWORD *)v98 + 2);
    *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)v98;
    *(_OWORD *)self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v51;
    *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v50;
    v52 = *((_OWORD *)v98 + 6);
    v54 = *((_OWORD *)v98 + 3);
    v53 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)v98 + 4);
    *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v98 + 5);
    *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.start_time_or_offset_usec = v52;
    *(_OWORD *)&self->_finderStartRangingOptions.var0.__null_state_ = v54;
    *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                         + 12) = v53;
    if (!v49)
      LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 1;
    v14 = v47;
    if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
      self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    sub_10021B6D8((uint64_t)&self->_finderMutualAuthState);
    self->_finderMutualAuthState.outboundAuthState = 1;
    if (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
      goto LABEL_81;
    v55 = (BOOL *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec + 2;
  }
  else
  {
    HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 1;
    objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, v14);
    objc_storeStrong((id *)&self->_findeeMutualAuthState.outboundChallenge, a3);
    v56 = v14;
    v57 = self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_;
    memcpy(&self->_findeeMutualAuthState.outboundResponse, a6, 0x1F8uLL);
    if (!v57)
      self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 1;
    v58 = self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12];
    v60 = *((_OWORD *)v98 + 1);
    v59 = *((_OWORD *)v98 + 2);
    self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr = *(optional<unsigned long long> *)v98;
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.contention_based_ranging_type.var0.__null_state_ = v60;
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.nb_bch.var0.__null_state_ = v59;
    v61 = *((_OWORD *)v98 + 6);
    v63 = *((_OWORD *)v98 + 3);
    v62 = *((_OWORD *)v98 + 4);
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = *((_OWORD *)v98 + 5);
    *(_OWORD *)&self->_findeeStartRangingOptions.var0.__null_state_ = v61;
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = v63;
    *(_OWORD *)self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v62;
    if (!v58)
      self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 1;
    v14 = v56;
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
      BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    sub_10021B6D8((uint64_t)&self->_finderStartRangingOptions.__engaged_);
    self->_finderStartRangingOptions.__engaged_ = 1;
    if (!*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2))
      goto LABEL_81;
    v55 = &self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2;
  }
  *v55 = 0;
LABEL_81:
  sub_100021C24(&self->_nbammsSession.__ptr_, (uint64_t *)&v108);
  self->_sharedProtocol = a8;
  objc_storeStrong((id *)&self->_sessionToken, a3);
  self->_sessionState = 1;
  v64 = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
  if (v64 != 0.0)
    (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(_QWORD *)&v64 + 16))(COERCE_DOUBLE(*(_QWORD *)&v64), self, 1);
  v65 = self->_sessionStartRangingOptions.__engaged_;
  v67 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)v98 + 1);
  v66 = *((_OWORD *)v98 + 2);
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__null_state_ = *(_OWORD *)v98;
  *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                       + 12) = v67;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = v66;
  v68 = *((_OWORD *)v98 + 5);
  v69 = *((_OWORD *)v98 + 6);
  v70 = *((_OWORD *)v98 + 4);
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.start_time_or_offset_usec = *((_OWORD *)v98 + 3);
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = v69;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v68;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.scheduling_interval_usec = v70;
  if (!v65)
    self->_sessionStartRangingOptions.__engaged_ = 1;
  -[NIServerNBAMMSSession _resetStatistics](self, "_resetStatistics", v98);
  -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 1);
  -[NIServerNBAMMSSession _updateSessionPayload](self, "_updateSessionPayload");
  v27 = 1;
LABEL_86:
  v71 = (std::__shared_weak_count *)*((_QWORD *)&v108 + 1);
  if (*((_QWORD *)&v108 + 1))
  {
    v72 = (unint64_t *)(*((_QWORD *)&v108 + 1) + 8);
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
      if ((v27 & 1) == 0)
        goto LABEL_95;
      goto LABEL_91;
    }
  }
  if ((v27 & 1) != 0)
  {
LABEL_91:
    v21 = (id)qword_10085F520;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _getState](self, "_getState"));
      LODWORD(v108) = 138412290;
      *(_QWORD *)((char *)&v108 + 4) = v74;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after register): %@", (uint8_t *)&v108, 0xCu);

    }
    goto LABEL_93;
  }
LABEL_95:

  return p_nbammsSession;
}

- (void)unregisterNBAMMSSessionForToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *identityString;
  void *v7;
  NIDiscoveryToken *finderToken;
  NSObject *secondary_scheduling_delay_usec;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSData *outboundChallenge;
  double velocityChangeH2;
  double v15;
  _BOOL4 finderAttached;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NBAMMSSession *v20;
  NIDiscoveryToken *v21;
  void **p_finderToken;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  double val;
  NBAMMSSession *ptr;
  NIDiscoveryToken *sessionToken;
  NSObject *v29;
  void *v30;
  __int128 v31;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v32;
  __int128 v33;
  int v34;
  NSObject *v35;
  char v36;
  double v37;
  __int128 v38;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v39;
  __int128 v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  void *v44;
  uint8_t v45[32];
  uint64_t v46;
  std::__shared_weak_count *v47;
  __int128 v48;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;
  uint8_t buf[520];

  v4 = a3;
  v5 = (id)qword_10085F520;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    identityString = self->_identityString;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionInternal"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = identityString;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,Unregistering session %@ with token %@", buf, 0x16u);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (objc_msgSend(v4, "isEqual:", self->_finderToken))
  {
    finderToken = self->_finderToken;
    self->_finderToken = 0;

    objc_storeWeak((id *)&self->_finderClient, 0);
    self->_finderAttached = 0;
    sub_10021B6D8((uint64_t)&self->_finderMutualAuthState);
    if (BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
      BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    secondary_scheduling_delay_usec = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    if (secondary_scheduling_delay_usec)
    {
      dispatch_source_cancel(secondary_scheduling_delay_usec);
      v10 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
      self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0;

    }
    if (self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_)
      self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    if (LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec))
      LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 0;
    if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
      self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      v12 = "#find-range,Finder role with token %@ is detached";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }
  else
  {
    if (!objc_msgSend(v4, "isEqual:", self->_findeeMutualAuthState.outboundChallenge))
    {
      v18 = (id)qword_10085F520;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionInternal"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,Not ranging with token %@, return", buf, 0xCu);

      }
      goto LABEL_82;
    }
    outboundChallenge = self->_findeeMutualAuthState.outboundChallenge;
    self->_findeeMutualAuthState.outboundChallenge = 0;

    objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, 0);
    HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    sub_10021B6D8((uint64_t)&self->_finderStartRangingOptions.__engaged_);
    if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2))
      *(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    if (velocityChangeH2 != 0.0)
    {
      dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
      v15 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2 = 0.0;

    }
    if (self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_)
      self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
    if (self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12])
      self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
      BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    v11 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      v12 = "#find-range,Findee role is detached with token %@ is detached";
      goto LABEL_31;
    }
  }
  finderAttached = self->_finderAttached;
  if (!self->_finderAttached
    && !HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    self->_measurementsReceived = 0;
    self->_sessionState = 0;
    self->_sharedProtocol = -1;
    val = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
    if (val != 0.0)
      (*(void (**)(double, NIServerNBAMMSSession *, _QWORD))(*(_QWORD *)&val + 16))(COERCE_DOUBLE(*(_QWORD *)&val), self, 0);
    ptr = self->_nbammsSession.__ptr_;
    if (ptr)
    {
      sub_1002AE5BC((uint64_t)ptr);
      sub_100180AF4(&self->_nbammsSession.__ptr_);
      sessionToken = self->_sessionToken;
      self->_sessionToken = 0;

      if (self->_sessionStartRangingOptions.__engaged_)
        self->_sessionStartRangingOptions.__engaged_ = 0;
      -[NIServerNBAMMSSession _resetStatistics](self, "_resetStatistics");
      -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 1);
    }
    goto LABEL_80;
  }
  if (self->_measurementsReceived)
  {
    v17 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal -> one-way, measurements already received, do nothing", buf, 2u);
    }
LABEL_80:
    v18 = (id)qword_10085F520;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _getState](self, "_getState"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v44;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after unregister): %@", buf, 0xCu);

    }
LABEL_82:

    goto LABEL_83;
  }
  v20 = self->_nbammsSession.__ptr_;
  self->_measurementsReceived = 0;
  if (v20)
  {
    sub_1002AE5BC((uint64_t)v20);
    sub_100180AF4(&self->_nbammsSession.__ptr_);
    v21 = self->_sessionToken;
    self->_sessionToken = 0;

    if (self->_sessionStartRangingOptions.__engaged_)
      self->_sessionStartRangingOptions.__engaged_ = 0;
    -[NIServerNBAMMSSession _resetStatistics](self, "_resetStatistics");
    -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 1);
    finderAttached = self->_finderAttached;
  }
  buf[0] = 0;
  buf[504] = 0;
  if (finderAttached)
  {
    p_finderToken = (void **)&self->_finderToken;
    v23 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal -> one-way: reconfigure as finder", v45, 2u);
    }
    v24 = 824;
    v25 = 312;
  }
  else
  {
    if (!HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
    {
      v18 = 0;
      goto LABEL_66;
    }
    v29 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal -> one-way: reconfigure as findee", v45, 2u);
    }
    p_finderToken = (void **)&self->_findeeMutualAuthState.outboundChallenge;
    v24 = 1560;
    v25 = 1048;
  }
  v30 = *p_finderToken;
  v18 = v30;
  memcpy(buf, (char *)self + v25, 0x1F9uLL);
  v31 = *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[v24 + 3];
  v52 = *(__int128 *)((char *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0 + v24 + 4);
  v53 = v31;
  v54 = *(_OWORD *)(&self->_sessionStartRangingOptions.var0.__val_.peer.__engaged_ + v24);
  v55 = *(&self->_sessionStartRangingOptions.var0.__val_.start_time_type + v24);
  v32 = *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_identityString + v24);
  v48 = *(_OWORD *)((char *)&self->super.isa + v24);
  v49 = v32;
  v33 = *(_OWORD *)((char *)&self->_sessionToken + v24);
  v50 = *(_OWORD *)((char *)&self->_nbammsSession.__cntrl_ + v24);
  v51 = v33;
  if (!v18 || !buf[504] || !v55)
  {
LABEL_66:
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFBD4();
    goto LABEL_82;
  }
  -[NIServerNBAMMSSession _buildNbammsSession:](self, "_buildNbammsSession:", buf);
  if (!v46)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFAA8();
    goto LABEL_70;
  }
  v34 = sub_1002B1704(v46, &v48);
  if (v34)
  {
    v35 = (id)qword_10085F520;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v34, v45);
      sub_1003DFAD4();
    }

LABEL_70:
    v36 = 0;
    goto LABEL_74;
  }
  sub_100021C24(&self->_nbammsSession.__ptr_, &v46);
  objc_storeStrong((id *)&self->_sessionToken, v30);
  self->_sessionState = 1;
  v37 = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
  if (v37 != 0.0)
    (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(_QWORD *)&v37 + 16))(COERCE_DOUBLE(*(_QWORD *)&v37), self, 1);
  v38 = v53;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.scheduling_interval_usec = v52;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v38;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = v54;
  v39 = v49;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__null_state_ = v48;
  *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                       + 12) = v39;
  v40 = v51;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = v50;
  self->_sessionStartRangingOptions.__engaged_ = v55;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.start_time_or_offset_usec = v40;
  -[NIServerNBAMMSSession _resetStatistics](self, "_resetStatistics");
  -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 1);
  -[NIServerNBAMMSSession _updateSessionPayload](self, "_updateSessionPayload");
  v36 = 1;
LABEL_74:
  v41 = v47;
  if (v47)
  {
    p_shared_owners = (unint64_t *)&v47->__shared_owners_;
    do
      v43 = __ldaxr(p_shared_owners);
    while (__stlxr(v43 - 1, p_shared_owners));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }

  if ((v36 & 1) != 0)
    goto LABEL_80;
LABEL_83:

}

- (void)refreshRangingForToken:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  NSString *identityString;
  id v9;
  void **v10;
  NSString *v11;
  void *v12;
  void *__p[2];
  char v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void **v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_nbammsSession.__ptr_
    && self->_sessionStartRangingOptions.__engaged_
    && -[NIDiscoveryToken isEqual:](self->_sessionToken, "isEqual:", v4))
  {
    if (!self->_sessionStartRangingOptions.__engaged_)
      sub_10000BA44();
    v5 = sub_1002B1704((uint64_t)self->_nbammsSession.__ptr_, (__int128 *)&self->_sessionStartRangingOptions.var0.__null_state_);
    v6 = (id)qword_10085F520;
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identityString = self->_identityString;
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionInternal"));
        sub_1002B48B0(v5, __p);
        if (v14 >= 0)
          v10 = __p;
        else
          v10 = (void **)__p[0];
        *(_DWORD *)buf = 138412802;
        v16 = identityString;
        v17 = 2112;
        v18 = v9;
        v19 = 2080;
        v20 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#find-range,refreshRanging for %@ with token %@: Failed to refresh ranging. Return code: %s", buf, 0x20u);
        if (v14 < 0)
          operator delete(__p[0]);

      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_identityString;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "descriptionInternal"));
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,refreshRanging: Success for %@, token: %@!", buf, 0x16u);

    }
  }

}

- (BOOL)sessionRegistered
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  return self->_nbammsSession.__ptr_ != 0;
}

- (vector<NMISessionRole,)attachedRoles
{
  vector<NMISessionRole, std::allocator<NMISessionRole>> *result;
  int *v6;
  int *var1;
  uint64_t v8;
  int *v9;
  int *v10;
  int v11;
  int *var0;
  int *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  int *v19;
  int *v20;
  int v21;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (self->_finderAttached && self->_finderToken)
  {
    v6 = (int *)sub_10003B05C((uint64_t)&retstr->var2, 1uLL);
    result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
    var1 = retstr->var1;
    v9 = &v6[v8];
    *v6 = 0;
    v10 = v6 + 1;
    while (var1 != (int *)result)
    {
      v11 = *--var1;
      *--v6 = v11;
    }
    retstr->var0 = v6;
    retstr->var1 = v10;
    retstr->var2.var0 = v9;
    if (result)
      operator delete(result);
    retstr->var1 = v10;
  }
  else
  {
    v10 = 0;
  }
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
    && self->_findeeMutualAuthState.outboundChallenge)
  {
    var0 = retstr->var2.var0;
    if (v10 >= var0)
    {
      result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
      v14 = v10 - retstr->var0;
      v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62)
        sub_100026E7C();
      v16 = (char *)var0 - (char *)result;
      if (v16 >> 1 > v15)
        v15 = v16 >> 1;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
        v17 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v17 = v15;
      if (v17)
      {
        v18 = (char *)sub_10003B05C((uint64_t)&retstr->var2, v17);
        result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
        v10 = retstr->var1;
      }
      else
      {
        v18 = 0;
      }
      v19 = (int *)&v18[4 * v14];
      v20 = (int *)&v18[4 * v17];
      *v19 = 1;
      v13 = v19 + 1;
      while (v10 != (int *)result)
      {
        v21 = *--v10;
        *--v19 = v21;
      }
      retstr->var0 = v19;
      retstr->var1 = v13;
      retstr->var2.var0 = v20;
      if (result)
        operator delete(result);
    }
    else
    {
      *v10 = 1;
      v13 = v10 + 1;
    }
    retstr->var1 = v13;
  }
  return result;
}

- (int)sessionState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  return self->_sessionState;
}

- (int)sharedProtocol
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  return self->_sharedProtocol;
}

- (void)setSharedProtocol:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  self->_sharedProtocol = a3;
}

- (id)sessionTokenForFinder:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v5 = 1040;
  if (v3)
    v5 = 304;
  return *(id *)((char *)&self->super.isa + v5);
}

- (id)sessionClientForFinder:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v5 = 976;
  if (v3)
    v5 = 240;
  return objc_loadWeakRetained((id *)((char *)&self->super.isa + v5));
}

- (optional<rose::RoseServiceRequest>)sessionServiceRequestForFinder:(SEL)a3
{
  _BOOL4 v4;
  uint64_t v7;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v7 = 1048;
  if (v4)
    v7 = 312;
  return (optional<rose::RoseServiceRequest> *)memcpy(retstr, (char *)self + v7, 0x200uLL);
}

- (optional<rose::RoseStartRangingOptions>)sessionStartRangingOptionsForFinder:(SEL)a3
{
  _BOOL4 v4;
  optional<rose::RoseStartRangingOptions> *result;
  uint64_t v8;
  char *v9;
  __int128 v10;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v11;
  __int128 v12;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v8 = 1560;
  if (v4)
    v8 = 824;
  v9 = (char *)self + v8;
  v10 = *((_OWORD *)v9 + 5);
  *(_OWORD *)&retstr->var0.__val_.scheduling_interval_usec = *((_OWORD *)v9 + 4);
  *(_OWORD *)&retstr->var0.__val_.dither_constant_msec.var0.__null_state_ = v10;
  *(_OWORD *)&retstr->var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = *((_OWORD *)v9 + 6);
  *(_QWORD *)&retstr->__engaged_ = *((_QWORD *)v9 + 14);
  v11 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)v9 + 1);
  *(_OWORD *)&retstr->var0.__null_state_ = *(_OWORD *)v9;
  *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&retstr->var0.__val_.peer.var0.__val_.uuid.var0 + 12) = v11;
  v12 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var0.__val_.start_time_or_offset_usec = v12;
  return result;
}

- (void)informMutualAuthFailuresToClients
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  NIServerNBAMMSSession *v10;
  _QWORD block[4];
  id v12;
  NIServerNBAMMSSession *v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
  v4 = WeakRetained;
  if ((self->_finderMutualAuthState.outboundAuthState - 5 < 2
     || self->_finderMutualAuthState.inboundAuthState == 2)
    && WeakRetained)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10021D3E4;
    block[3] = &unk_1007FA518;
    v12 = v4;
    v13 = self;
    dispatch_async(v5, block);

  }
  v6 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

  if (self->_finderStartRangingOptions.__engaged_ - 5 < 2 || LOBYTE(self->_finderMutualAuthTimer) == 2)
  {
    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientQueue"));
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10021D3F4;
      v8[3] = &unk_1007FA518;
      v9 = v6;
      v10 = self;
      dispatch_async(v7, v8);

    }
  }

}

- (id)identityString
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  return self->_identityString;
}

- (SessionClientsStatus)sessionClientsStatus
{
  int outboundAuthState;
  int inboundAuthState;
  uint64_t v5;
  int engaged;
  int finderMutualAuthTimer_low;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SessionClientsStatus result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
  if (outboundAuthState == 1)
    goto LABEL_4;
  if (outboundAuthState == 4)
  {
    inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
    if (inboundAuthState == 1)
    {
LABEL_4:
      v5 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if ((outboundAuthState - 5) < 2)
    {
LABEL_8:
      v5 = (uint64_t)&_mh_execute_header;
      goto LABEL_10;
    }
    inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
  }
  if (inboundAuthState == 2)
    goto LABEL_8;
  v5 = 0x200000000;
LABEL_10:
  engaged = self->_finderStartRangingOptions.__engaged_;
  if (engaged != 1)
  {
    if (engaged == 4)
    {
      finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
      if (finderMutualAuthTimer_low == 1)
        goto LABEL_13;
    }
    else
    {
      if ((engaged - 5) < 2)
      {
LABEL_17:
        v8 = (uint64_t)&_mh_execute_header;
        goto LABEL_19;
      }
      finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
    }
    if (finderMutualAuthTimer_low != 2)
    {
      v8 = 0x200000000;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_13:
  v8 = 0;
LABEL_19:
  v9 = v5 | self->_finderAttached;
  v10 = v8 | HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_);
  result.var2 = v10;
  result.var3 = HIDWORD(v10);
  result.var0 = v9;
  result.var1 = HIDWORD(v9);
  return result;
}

- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4
{
  id v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (objc_msgSend(v6, "isEqual:", self->_finderToken))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFC00();
  }
  else if (objc_msgSend(v6, "isEqual:", self->_findeeMutualAuthState.outboundChallenge))
  {
    v7 = (_OWORD *)((char *)&self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0 + 3);
    v8 = *(_OWORD *)a3;
    v9 = *((_OWORD *)a3 + 2);
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
    {
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type = v9;
      *v7 = v8;
      v10 = *((_OWORD *)a3 + 3);
      v11 = *((_OWORD *)a3 + 4);
      v12 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_ = v12;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = v10;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v11;
      v13 = *((_OWORD *)a3 + 7);
      v14 = *((_OWORD *)a3 + 8);
      v15 = *((_OWORD *)a3 + 9);
      *(_OWORD *)((char *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH2
                + 2) = *(_OWORD *)((char *)a3 + 154);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v14;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v15;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = v13;
    }
    else
    {
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type = v9;
      *v7 = v8;
      v16 = *((_OWORD *)a3 + 3);
      v17 = *((_OWORD *)a3 + 4);
      v18 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_ = v18;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = v16;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v17;
      v19 = *((_OWORD *)a3 + 7);
      v20 = *((_OWORD *)a3 + 8);
      v21 = *((_OWORD *)a3 + 10);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = *((_OWORD *)a3 + 9);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV = v21;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = v19;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v20;
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 1;
    }
    -[NIServerNBAMMSSession _updateSessionPayload](self, "_updateSessionPayload");
  }

}

- (void)updateSignallingData:(const void *)a3 token:(id)a4
{
  _BOOL4 engaged;
  char v7;
  BOOL *p_engaged;
  int v9;
  char v10;
  id v11;

  v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (objc_msgSend(v11, "isEqual:", self->_finderToken))
  {
    engaged = self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
    v7 = *((_BYTE *)a3 + 8);
    self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc = *(optional<rose::ConnectionEventTriggerDescriptor> *)a3;
    self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v7;
    if (!engaged)
    {
      p_engaged = &self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
LABEL_7:
      *p_engaged = 1;
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v11, "isEqual:", self->_findeeMutualAuthState.outboundChallenge))
  {
    v9 = BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1);
    v10 = *((_BYTE *)a3 + 8);
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp = *(double *)a3;
    LOBYTE(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = v10;
    if (!v9)
    {
      p_engaged = (BOOL *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1
                + 1;
      goto LABEL_7;
    }
LABEL_8:
    -[NIServerNBAMMSSession _updateSessionPayload](self, "_updateSessionPayload");
  }

}

- (void)_updateSessionPayload
{
  unsigned int cryptoSessionState;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSString *identityString;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  NSString *v16;

  if (!self->_nbammsSession.__ptr_)
    return;
  cryptoSessionState = self->_cryptoSessionState;
  if (cryptoSessionState - 1 < 2)
  {
LABEL_6:
    -[NIServerNBAMMSSession _updateCryptoSessionConfigPayload](self, "_updateCryptoSessionConfigPayload");
    goto LABEL_7;
  }
  if (cryptoSessionState != 3)
  {
    if (self->_cryptoSessionState)
      goto LABEL_7;
    -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
    goto LABEL_6;
  }
  if (-[NIServerNBAMMSSession _shouldSendMutualAuthMessage](self, "_shouldSendMutualAuthMessage"))
  {
    if (self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_)
      -[NIServerNBAMMSSession _armMutualAuthTimerForFinder:](self, "_armMutualAuthTimerForFinder:", 1);
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_)
      -[NIServerNBAMMSSession _armMutualAuthTimerForFinder:](self, "_armMutualAuthTimerForFinder:", 0);
    if (-[NIServerNBAMMSSession _encryptAndUpdateMutualAuthPayload](self, "_encryptAndUpdateMutualAuthPayload"))
      goto LABEL_7;
    goto LABEL_20;
  }
  if (!-[NIServerNBAMMSSession _encryptAndUpdateAidingAndSignallingPayload](self, "_encryptAndUpdateAidingAndSignallingPayload"))
  {
LABEL_20:
    v10 = (id)qword_10085F520;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
      sub_1003DFC64();
    }

    -[NIServerNBAMMSSession _handleCryptoFailure](self, "_handleCryptoFailure");
  }
LABEL_7:
  if (self->_cryptoSessionState != cryptoSessionState)
  {
    v4 = (id)qword_10085F520;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = sub_10021D8D4(cryptoSessionState);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = sub_10021D8D4(self->_cryptoSessionState);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      identityString = self->_identityString;
      v11 = 138478339;
      v12 = v6;
      v13 = 2113;
      v14 = v8;
      v15 = 2112;
      v16 = identityString;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Session state update while updating payload. %{private}@ -> %{private}@, id: %@", (uint8_t *)&v11, 0x20u);

    }
  }
}

- (BOOL)_encryptAndUpdateAidingAndSignallingPayload
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  BOOL v8;
  _DWORD *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v15;
  void *v16[3];
  unsigned __int8 v17;
  void *__p;
  void *__dst;
  char v20;
  void *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  if (!self->_nbammsSession.__ptr_)
    return 0;
  if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
  {
    v3 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_;
    v4 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1;
    v34 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp;
    v35 = v4;
    v36 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV;
    v5 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_;
    v6 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_;
    v30 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_;
    v31 = v6;
    v32 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_;
    v33 = v3;
    v7 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_;
    v26 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[3];
    v27 = v7;
    v28 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type;
    v29 = v5;
  }
  else
  {
    LOBYTE(v26) = 0;
    LOBYTE(v27) = 0;
    BYTE8(v27) = 0;
    BYTE8(v30) = 0;
    LOBYTE(v31) = 0;
    LOBYTE(v33) = 0;
    LOBYTE(v36) = 0;
    WORD4(v36) = 0;
    *((_QWORD *)&v33 + 1) = 0;
    *(_QWORD *)&v34 = 0;
    BYTE8(v34) = 0;
  }
  v9 = sub_100004784();
  sub_1000069CC(v9[144]);
  v23 = 0;
  v24 = sub_10021DC78((uint64_t)&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc, (uint64_t)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp);
  v25 = v10;
  v21 = 0;
  v22 = 0;
  if (sub_100212F4C((uint64_t)&v21, (uint64_t)&v26, (unsigned __int8 *)&v24))
  {
    sub_10000BF04(&__p, "Send");
    sub_10021411C((uint64_t **)&__p, (unsigned __int8 **)&v21);
    if (v20 < 0)
      operator delete(__p);
    v17 = 2;
    if (-[NIServerNBAMMSSession _shouldEncodeSignallingDataInMessageID](self, "_shouldEncodeSignallingDataInMessageID"))
      v17 = -[NIServerNBAMMSSession _encodeSignallingDataInMessageID:](self, "_encodeSignallingDataInMessageID:", v17);
    sub_100191910(&__p, 1uLL, &v17);
    sub_10022CEEC((uint64_t)&__p, (char *)__dst, (char *)v21, v22, v22 - (_BYTE *)v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", __p, (_BYTE *)__dst - (_BYTE *)__p));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _encrypt:](self, "_encrypt:", v11));
    v13 = v12;
    if (v12 && objc_msgSend(v12, "length"))
    {
      v15 = 0;
      sub_100191910(v16, (size_t)objc_msgSend(v13, "length"), &v15);
      objc_msgSend(v13, "getBytes:length:", v16[0], objc_msgSend(v13, "length"));
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
        sub_1003DFCCC();
      sub_1002B1E34((uint64_t)self->_nbammsSession.__ptr_, (uint64_t)v16);
      if (v16[0])
      {
        v16[1] = v16[0];
        operator delete(v16[0]);
      }
      v8 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DFCA0();
      v8 = 0;
    }

    if (__p)
    {
      __dst = __p;
      operator delete(__p);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003DFCF8();
    v8 = 0;
  }
  if (v21)
  {
    v22 = (char *)v21;
    operator delete(v21);
  }
  return v8;
}

- (void)_receivedAidingAndSignallingMessage:(const void *)a3 machAbsTimestamp:(double)a4
{
  uint64_t v7;
  const void *v8;
  _DWORD *v9;
  BOOL v10;
  _BOOL4 v11;
  id WeakRetained;
  void *v13;
  int outboundAuthState;
  NSObject *v15;
  id v16;
  id v17;
  int engaged;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  NIServerNBAMMSSession *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  BOOL v36;
  _QWORD block[4];
  id v38;
  NIServerNBAMMSSession *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  BOOL v54;
  __int128 __p;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  unsigned __int8 *v66;
  unsigned __int8 *v67;
  uint64_t v68;

  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003DFD50();
  ++*(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_;
  -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
  -[NIServerNBAMMSSession _handleNonMutualAuthMessage](self, "_handleNonMutualAuthMessage");
  v7 = *((_QWORD *)a3 + 1);
  v8 = (const void *)(*(_QWORD *)a3 + 1);
  v67 = 0;
  v68 = 0;
  v66 = 0;
  sub_10022D0C8(&v66, v8, v7, v7 - (_QWORD)v8);
  sub_10000BF04(&__p, "Receive");
  sub_10021411C((uint64_t **)&__p, &v66);
  if (SBYTE7(v56) < 0)
    operator delete((void *)__p);
  LOBYTE(__p) = 0;
  LOBYTE(v56) = 0;
  BYTE8(v56) = 0;
  BYTE8(v59) = 0;
  LOBYTE(v60) = 0;
  LOBYTE(v62) = 0;
  LOBYTE(v65) = 0;
  WORD4(v65) = 0;
  *(_QWORD *)&v63 = 0;
  *((_QWORD *)&v62 + 1) = 0;
  BYTE8(v63) = 0;
  v9 = sub_100004784();
  v10 = sub_1000069CC(v9[144]);
  v53 = 0;
  v54 = v10;
  if ((sub_100213960((uint64_t)&v66, (uint64_t)&__p, (uint64_t)&v53) & 1) != 0)
  {
    *((double *)&v62 + 1) = a4;
    v11 = 1;
    LOBYTE(v63) = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    v13 = WeakRetained;
    outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4)
        goto LABEL_12;
      v11 = self->_finderMutualAuthState.inboundAuthState == 1;
    }
    if (v11 && WeakRetained)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10021E154;
      block[3] = &unk_10080F420;
      v16 = v13;
      v51 = v53;
      v52 = v54;
      v48 = v63;
      v49 = v64;
      v50 = v65;
      v44 = v59;
      v45 = v60;
      v47 = v62;
      v46 = v61;
      v40 = __p;
      v41 = v56;
      v43 = v58;
      v42 = v57;
      v38 = v16;
      v39 = self;
      dispatch_async(v15, block);

    }
LABEL_12:
    v17 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    engaged = self->_finderStartRangingOptions.__engaged_;
    if (engaged != 1)
    {
      if (engaged != 4)
      {
LABEL_18:

        goto LABEL_21;
      }
      engaged = LOBYTE(self->_finderMutualAuthTimer) == 1;
    }
    if (engaged && v17)
    {
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientQueue"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10021E16C;
      v21[3] = &unk_10080F420;
      v20 = v17;
      v35 = v53;
      v36 = v54;
      v32 = v63;
      v33 = v64;
      v34 = v65;
      v28 = v59;
      v29 = v60;
      v31 = v62;
      v30 = v61;
      v24 = __p;
      v25 = v56;
      v27 = v58;
      v26 = v57;
      v22 = v20;
      v23 = self;
      dispatch_async(v19, v21);

    }
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DFD24();
LABEL_21:
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
}

- (id)printableState
{
  NSMutableArray *v3;
  NSString *identityString;
  NBAMMSSession *ptr;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id WeakRetained;
  const char *v12;
  void *v13;
  _BOOL4 engaged;
  std::string *p_p;
  void *v16;
  const char *v17;
  id v18;
  const char *v19;
  void *v20;
  int v21;
  std::string *v22;
  void *v23;
  void *v24;
  int sessionState;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  void *v55;
  void *v56;
  void *v57;
  std::string v59;
  std::string __p;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v3 = objc_opt_new(NSMutableArray);
  identityString = self->_identityString;
  ptr = self->_nbammsSession.__ptr_;
  v6 = objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
  v7 = (void *)v6;
  v8 = "NO";
  if (ptr)
    v8 = "YES";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Name: %@. Created: %s. Creation token: %@"), identityString, v8, v6));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  if (self->_finderAttached)
    v10 = "YES";
  else
    v10 = "NO";
  WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
  if (WeakRetained)
    v12 = "YES";
  else
    v12 = "NO";
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
  engaged = self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
  if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
  {
    sub_10021E7B0(&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  else
  {
    p_p = (std::string *)"0";
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Finder attached: %s, client: %s, token: %@, signalling: %s"), v10, v12, v13, p_p));
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  if (engaged && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
    v17 = "YES";
  else
    v17 = "NO";
  v18 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);
  if (v18)
    v19 = "YES";
  else
    v19 = "NO";
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSData descriptionInternal](self->_findeeMutualAuthState.outboundChallenge, "descriptionInternal"));
  v21 = BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1);
  if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
  {
    sub_10021E7B0(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp, &v59);
    if ((v59.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = &v59;
    else
      v22 = (std::string *)v59.__r_.__value_.__r.__words[0];
  }
  else
  {
    v22 = (std::string *)"0";
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Findee attached: %s, client: %s, token: %@, signalling: %s, aiding: %d"), v17, v19, v20, v22, self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_));
  -[NSMutableArray addObject:](v3, "addObject:", v23);

  if (v21 && SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Shared protocol: %d"), self->_sharedProtocol));
  -[NSMutableArray addObject:](v3, "addObject:", v24);

  sessionState = self->_sessionState;
  v26 = "IDLE";
  if (sessionState == 1)
    v26 = "ACQ";
  if (sessionState == 2)
    v27 = "RNG";
  else
    v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Session state: %s"), v27));
  -[NSMutableArray addObject:](v3, "addObject:", v28);

  v29 = "NO";
  if (self->_measurementsReceived)
    v29 = "YES";
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Measurements received: %s"), v29));
  -[NSMutableArray addObject:](v3, "addObject:", v30);

  v31 = sub_10021D8D4(self->_cryptoSessionState);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
  v35 = CUPrintNSObjectMasked(v33, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
  v39 = CUPrintNSObjectMasked(v37, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Crypto state: %@. Self: %@. Peer: %@. Failures: %d"), v32, v36, v40, self->_cryptoFailures));
  -[NSMutableArray addObject:](v3, "addObject:", v41);

  v43 = sub_10021ED08(&self->_finderMutualAuthState.outboundAuthState, v42);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  v45 = (void *)v44;
  if (BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    if (*(&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ + 1))
      v46 = "S";
    else
      v46 = "F";
  }
  else
  {
    v46 = "N/A";
  }
  v47 = "NO";
  if (self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_)
    v47 = "YES";
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Finder mutual auth: %@, last reported state: %s, should arm timer: %s"), v44, v46, v47));
  -[NSMutableArray addObject:](v3, "addObject:", v48);

  v50 = sub_10021ED08((unsigned __int8 *)&self->_finderStartRangingOptions.__engaged_, v49);
  v51 = objc_claimAutoreleasedReturnValue(v50);
  v52 = (void *)v51;
  if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2))
  {
    if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 1))
      v53 = "S";
    else
      v53 = "F";
  }
  else
  {
    v53 = "N/A";
  }
  v54 = "NO";
  if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_)
    v54 = "YES";
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Findee mutual auth: %@, last reported state: %s, should arm timer: %s"), v51, v53, v54));
  -[NSMutableArray addObject:](v3, "addObject:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Solution count: %d successful, %d unsuccessful"), LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM), HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM)));
  -[NSMutableArray addObject:](v3, "addObject:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Message count: %d crypto, %d mutual auth, %d aiding/signalling"), self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty, *(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1), *(unsigned int *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_));
  -[NSMutableArray addObject:](v3, "addObject:", v57);

  return v3;
}

- (void)_serviceRequestStatusUpdate:(const ServiceRequestStatusUpdate *)a3
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  NIServerNBAMMSSession *v13;
  uint64_t v14;
  int v15;
  _QWORD block[4];
  id v17;
  NIServerNBAMMSSession *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int var2;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    v21 = *(_QWORD *)&a3->var0;
    var2 = a3->var2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10021F0C8;
      block[3] = &unk_10080F448;
      v18 = self;
      v19 = v21;
      v20 = var2;
      v17 = v6;
      dispatch_async(v7, block);

    }
    v8 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientQueue"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10021F0DC;
      v11[3] = &unk_10080F448;
      v10 = v8;
      v13 = self;
      v14 = v21;
      v15 = var2;
      v12 = v10;
      dispatch_async(v9, v11);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DFD7C();
  }
}

- (void)_didReceiveNewSolution:(const void *)a3
{
  NSObject *v5;
  NSString *identityString;
  double val;
  __int128 v8;
  id WeakRetained;
  void *v10;
  int outboundAuthState;
  NSObject *v12;
  id v13;
  int engaged;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  NIServerNBAMMSSession *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[560];
  _BYTE v23[16];
  _QWORD *v24[16];
  char v25;
  __n128 v26[4];
  void *v27;
  void *v28;
  char v29;
  _BYTE v30[545];
  _QWORD block[4];
  id v32;
  NIServerNBAMMSSession *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[560];
  _BYTE v38[16];
  _QWORD *v39[16];
  char v40;
  __n128 v41[4];
  void *__p;
  void *v43;
  char v44;
  uint8_t v45[545];
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  _BYTE v49[560];
  _BYTE v50[16];
  _QWORD *v51[16];
  char v52;
  __n128 v53[4];
  void *v54;
  void *v55;
  char v56;
  _BYTE v57[545];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  sub_1001D0140(0x2B730404u, 0, 0, 0, 0, 0);
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    if (!self->_measurementsReceived)
    {
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = identityString;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,First NBAMMS measurement received for %@", buf, 0xCu);
      }
      self->_measurementsReceived = 1;
      self->_sessionState = 2;
      val = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
      if (val != 0.0)
        (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(_QWORD *)&val + 16))(COERCE_DOUBLE(*(_QWORD *)&val), self, 2);
    }
    ++LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
    -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
    v8 = *((_OWORD *)a3 + 1);
    *(_OWORD *)buf = *(_OWORD *)a3;
    v47 = v8;
    v48 = *((_OWORD *)a3 + 2);
    sub_10015A39C(v49, (uint64_t)a3 + 48);
    sub_100153F08(v50, (uint64_t)a3 + 608);
    sub_10015A3F0(v53, (__n128 *)((char *)a3 + 760));
    memcpy(v57, (char *)a3 + 880, sizeof(v57));
    WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    v10 = WeakRetained;
    outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4)
        goto LABEL_19;
      outboundAuthState = self->_finderMutualAuthState.inboundAuthState == 1;
    }
    if (outboundAuthState && WeakRetained)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768;
      block[2] = sub_10021F634;
      block[3] = &unk_10080F470;
      v32 = v10;
      v34 = *(_OWORD *)buf;
      v35 = v47;
      v36 = v48;
      sub_10015A39C(v37, (uint64_t)v49);
      sub_100153F08(v38, (uint64_t)v50);
      sub_10015A3F0(v41, v53);
      memcpy(v45, v57, sizeof(v45));
      v33 = self;
      dispatch_async(v12, block);

      if (v44 && __p)
      {
        v43 = __p;
        operator delete(__p);
      }
      if (v40)
        sub_10003E3F0((uint64_t)v39, v39[1]);
      sub_100144868((uint64_t)v37);

    }
LABEL_19:
    v13 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    engaged = self->_finderStartRangingOptions.__engaged_;
    if (engaged != 1)
    {
      if (engaged != 4)
      {
LABEL_30:
        if (v56 && v54)
        {
          v55 = v54;
          operator delete(v54);
        }
        if (v52)
          sub_10003E3F0((uint64_t)v51, v51[1]);
        sub_100144868((uint64_t)v49);

        return;
      }
      engaged = LOBYTE(self->_finderMutualAuthTimer) == 1;
    }
    if (engaged && v13)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientQueue"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3321888768;
      v16[2] = sub_10021F72C;
      v16[3] = &unk_10080F470;
      v17 = v13;
      v19 = *(_OWORD *)buf;
      v20 = v47;
      v21 = v48;
      sub_10015A39C(v22, (uint64_t)v49);
      sub_100153F08(v23, (uint64_t)v50);
      sub_10015A3F0(v26, v53);
      memcpy(v30, v57, sizeof(v30));
      v18 = self;
      dispatch_async(v15, v16);

      if (v29 && v27)
      {
        v28 = v27;
        operator delete(v27);
      }
      if (v25)
        sub_10003E3F0((uint64_t)v24, v24[1]);
      sub_100144868((uint64_t)v22);

    }
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DFDE0();
}

- (void)_didReceiveUnsuccessfulSolution:(const void *)a3
{
  __int128 v5;
  id WeakRetained;
  void *v7;
  int outboundAuthState;
  NSObject *v9;
  id v10;
  int engaged;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  NIServerNBAMMSSession *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[560];
  _BYTE v20[16];
  _QWORD *v21[16];
  char v22;
  __n128 v23[4];
  void *v24;
  void *v25;
  char v26;
  _BYTE v27[545];
  _QWORD block[4];
  id v29;
  NIServerNBAMMSSession *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[560];
  _BYTE v35[16];
  _QWORD *v36[16];
  char v37;
  __n128 v38[4];
  void *__p;
  void *v40;
  char v41;
  _BYTE v42[545];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[560];
  _BYTE v47[16];
  _QWORD *v48[16];
  char v49;
  __n128 v50[4];
  void *v51;
  void *v52;
  char v53;
  _BYTE v54[545];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  sub_1001D0140(0x2B730408u, 0, 0, 0, 0, 0);
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    ++HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
    -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
    v5 = *((_OWORD *)a3 + 1);
    v43 = *(_OWORD *)a3;
    v44 = v5;
    v45 = *((_OWORD *)a3 + 2);
    sub_10015A39C(v46, (uint64_t)a3 + 48);
    sub_100153F08(v47, (uint64_t)a3 + 608);
    sub_10015A3F0(v50, (__n128 *)((char *)a3 + 760));
    memcpy(v54, (char *)a3 + 880, sizeof(v54));
    WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    v7 = WeakRetained;
    outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4)
        goto LABEL_14;
      outboundAuthState = self->_finderMutualAuthState.inboundAuthState == 1;
    }
    if (outboundAuthState && WeakRetained)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768;
      block[2] = sub_10021FBFC;
      block[3] = &unk_10080F470;
      v29 = v7;
      v31 = v43;
      v32 = v44;
      v33 = v45;
      sub_10015A39C(v34, (uint64_t)v46);
      sub_100153F08(v35, (uint64_t)v47);
      sub_10015A3F0(v38, v50);
      memcpy(v42, v54, sizeof(v42));
      v30 = self;
      dispatch_async(v9, block);

      if (v41 && __p)
      {
        v40 = __p;
        operator delete(__p);
      }
      if (v37)
        sub_10003E3F0((uint64_t)v36, v36[1]);
      sub_100144868((uint64_t)v34);

    }
LABEL_14:
    v10 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    engaged = self->_finderStartRangingOptions.__engaged_;
    if (engaged != 1)
    {
      if (engaged != 4)
      {
LABEL_25:
        if (v53 && v51)
        {
          v52 = v51;
          operator delete(v51);
        }
        if (v49)
          sub_10003E3F0((uint64_t)v48, v48[1]);
        sub_100144868((uint64_t)v46);

        return;
      }
      engaged = LOBYTE(self->_finderMutualAuthTimer) == 1;
    }
    if (engaged && v10)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3321888768;
      v13[2] = sub_10021FC10;
      v13[3] = &unk_10080F470;
      v14 = v10;
      v16 = v43;
      v17 = v44;
      v18 = v45;
      sub_10015A39C(v19, (uint64_t)v46);
      sub_100153F08(v20, (uint64_t)v47);
      sub_10015A3F0(v23, v50);
      memcpy(v27, v54, sizeof(v27));
      v15 = self;
      dispatch_async(v12, v13);

      if (v26 && v24)
      {
        v25 = v24;
        operator delete(v24);
      }
      if (v22)
        sub_10003E3F0((uint64_t)v21, v21[1]);
      sub_100144868((uint64_t)v19);

    }
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DFE80();
}

- (void)_didReceivePeerData:(const void *)a3
{
  _BYTE *v5;
  uint64_t v6;
  unsigned int cryptoSessionState;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSString *identityString;
  void *__p[4];
  _BYTE v19[24];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  sub_1001D0140(0x2B730400u, 0, 0, 0, 0, 0);
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    v5 = (_BYTE *)*((_QWORD *)a3 + 1);
    v6 = *((_QWORD *)a3 + 2);
    if ((_BYTE *)v6 == v5)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003DFF48();
    }
    else if (*v5)
    {
      cryptoSessionState = self->_cryptoSessionState;
      switch(self->_cryptoSessionState)
      {
        case 0u:
          -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
          goto LABEL_7;
        case 1u:
LABEL_7:
          -[NIServerNBAMMSSession _updateCryptoSessionConfigPayload](self, "_updateCryptoSessionConfigPayload");
          break;
        case 2u:
          self->_cryptoSessionState = 3;
          goto LABEL_15;
        case 3u:
LABEL_15:
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _decrypt:](self, "_decrypt:", v8));
          v10 = v9;
          if (v9 && objc_msgSend(v9, "length"))
          {
            v19[0] = 0;
            sub_100191910(__p, (size_t)objc_msgSend(v10, "length"), v19);
            objc_msgSend(v10, "getBytes:length:", __p[0], objc_msgSend(v10, "length"));
            -[NIServerNBAMMSSession _processPeerMessage:machAbsTimestamp:wasEncrypted:](self, "_processPeerMessage:machAbsTimestamp:wasEncrypted:", __p, 1, *((double *)a3 + 4));
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v11 = (id)qword_10085F520;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
              sub_1003DFFA8();
            }

            -[NIServerNBAMMSSession _handleCryptoFailure](self, "_handleCryptoFailure");
          }

          break;
        default:
          break;
      }
      if (self->_cryptoSessionState != cryptoSessionState)
      {
        v12 = (id)qword_10085F520;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = sub_10021D8D4(cryptoSessionState);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = sub_10021D8D4(self->_cryptoSessionState);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          identityString = self->_identityString;
          LODWORD(__p[0]) = 138478339;
          *(void **)((char *)__p + 4) = v14;
          WORD2(__p[1]) = 2113;
          *(void **)((char *)&__p[1] + 6) = v16;
          HIWORD(__p[2]) = 2112;
          __p[3] = identityString;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Session state update while receiving data. %{private}@ -> %{private}@. %@", (uint8_t *)__p, 0x20u);

        }
      }
    }
    else
    {
      memset(__p, 0, 24);
      sub_10022D0C8(__p, v5 + 1, v6, v6 - (_QWORD)(v5 + 1));
      -[NIServerNBAMMSSession _processPeerMessage:machAbsTimestamp:wasEncrypted:](self, "_processPeerMessage:machAbsTimestamp:wasEncrypted:", __p, 0, *((double *)a3 + 4));
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003DFEE4();
  }
}

- (void)_processPeerMessage:(void *)a3 machAbsTimestamp:(double)a4 wasEncrypted:(BOOL)a5
{
  _BOOL4 v6;
  int v9;
  _DWORD *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  int outboundAuthState;
  NSObject *v17;
  id v18;
  int engaged;
  NSObject *v20;
  id v21;
  NSObject *v22;
  int v23;
  NSString *identityString;
  void **v25;
  uint64_t v26;
  id (*v27)(uint64_t);
  void *v28;
  id v29;
  NIServerNBAMMSSession *v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  __int128 v37;
  uint64_t v38;
  char v39;
  __int16 v40;
  uint64_t v41;
  BOOL v42;
  _QWORD block[4];
  id v44;
  NIServerNBAMMSSession *v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  __int128 v52;
  uint64_t v53;
  char v54;
  __int16 v55;
  uint64_t v56;
  BOOL v57;
  uint8_t buf[4];
  int v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  NSString *v63;
  _BYTE v64[24];

  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v6 = a5;
    v9 = **(unsigned __int8 **)a3;
    memset(&v64[7], 0, 17);
    v10 = sub_100004784();
    v11 = sub_1000069CC(v10[144]);
    if ((v9 & 0x10) != 0)
    {
      v12 = 0x10100000000;
    }
    else
    {
      if ((v9 & 0x18) == 0)
        goto LABEL_21;
      v12 = 0;
    }
    v13 = (v9 << 28 >> 31) & 0x101;
    WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    v15 = WeakRetained;
    outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4)
        goto LABEL_14;
      outboundAuthState = self->_finderMutualAuthState.inboundAuthState == 1;
    }
    if (outboundAuthState && WeakRetained)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002203A0;
      block[3] = &unk_10080F420;
      v53 = *(_QWORD *)&v64[16];
      v56 = v12 | (v13 << 16);
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = 0;
      v52 = *(_OWORD *)v64;
      v54 = 0;
      v55 = 0;
      v57 = v11;
      v44 = v15;
      v45 = self;
      dispatch_async(v17, block);

    }
LABEL_14:
    v18 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    engaged = self->_finderStartRangingOptions.__engaged_;
    if (engaged != 1)
    {
      if (engaged != 4)
      {
LABEL_20:

LABEL_21:
        **(_BYTE **)a3 &= 7u;
        if ((v9 & 7) == 2)
        {
          if (v6)
          {
            -[NIServerNBAMMSSession _receivedAidingAndSignallingMessage:machAbsTimestamp:](self, "_receivedAidingAndSignallingMessage:machAbsTimestamp:", a3, a4);
            goto LABEL_32;
          }
        }
        else if ((v9 & 7) == 1)
        {
          if (v6)
          {
            -[NIServerNBAMMSSession _receivedMutualAuthMessage:](self, "_receivedMutualAuthMessage:", a3);
            goto LABEL_32;
          }
        }
        else if ((v9 & 7) == 0 && !v6)
        {
          -[NIServerNBAMMSSession _receivedCryptoSessionConfigMessage:](self, "_receivedCryptoSessionConfigMessage:", a3);
LABEL_32:
          -[NIServerNBAMMSSession _updateSessionPayload](self, "_updateSessionPayload", v25, v26, v27, v28);
          return;
        }
        v22 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          v23 = **(unsigned __int8 **)a3;
          identityString = self->_identityString;
          *(_DWORD *)buf = 67109634;
          v59 = v23;
          v60 = 1024;
          v61 = v6;
          v62 = 2112;
          v63 = identityString;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#find-range,Unrecognized message ID %d. Was encrypted: %d. %@", buf, 0x18u);
        }
        goto LABEL_32;
      }
      engaged = LOBYTE(self->_finderMutualAuthTimer) == 1;
    }
    if (engaged && v18)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "clientQueue"));
      v25 = _NSConcreteStackBlock;
      v26 = 3221225472;
      v27 = sub_1002203B8;
      v28 = &unk_10080F420;
      v21 = v18;
      v38 = *(_QWORD *)&v64[16];
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = *(_OWORD *)v64;
      v39 = 0;
      v40 = 0;
      v41 = v12 | (v13 << 16);
      v42 = v11;
      v29 = v21;
      v30 = self;
      dispatch_async(v20, &v25);

    }
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003DFFE4();
}

- (void)_didReceiveInvalidation:(int)a3
{
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NIServerNBAMMSSession *v12;
  int v13;
  _QWORD block[4];
  id v15;
  NIServerNBAMMSSession *v16;
  int v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10022053C;
      block[3] = &unk_10080F4A8;
      v17 = a3;
      v15 = v6;
      v16 = self;
      dispatch_async(v7, block);

    }
    v8 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientQueue"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100220550;
      v10[3] = &unk_10080F4A8;
      v13 = a3;
      v11 = v8;
      v12 = self;
      dispatch_async(v9, v10);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E0044();
  }
}

- (BOOL)_validateTokensAndRangingParameters
{
  NIDiscoveryToken *finderToken;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *identityString;
  void *v13;
  void *v14;
  int v15;
  NSString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  finderToken = self->_finderToken;
  if (finderToken && self->_findeeMutualAuthState.outboundChallenge)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken getIRK](finderToken, "getIRK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData getIRK](self->_findeeMutualAuthState.outboundChallenge, "getIRK"));
    if (-[NSObject length](v4, "length") == (id)16
      && objc_msgSend(v5, "length") == (id)16
      && !-[NSObject isEqualToData:](v4, "isEqualToData:", v5))
    {
      if (self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_
        && self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_)
      {
        if (LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec)
          && self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12])
        {
          v7 = 1;
          goto LABEL_10;
        }
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E0150();
      }
      else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      {
        sub_1003E00A8();
      }
    }
    else
    {
      v6 = (id)qword_10085F520;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identityString = self->_identityString;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSData descriptionInternal](self->_findeeMutualAuthState.outboundChallenge, "descriptionInternal"));
        v15 = 138412802;
        v16 = identityString;
        v17 = 2112;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#find-range,Finder or findee token of %@ has invalid length or they have equal IRKs, finder: %@, findee: %@", (uint8_t *)&v15, 0x20u);

      }
    }
    v7 = 0;
LABEL_10:

    goto LABEL_14;
  }
  v4 = (id)qword_10085F520;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = self->_identityString;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSData descriptionInternal](self->_findeeMutualAuthState.outboundChallenge, "descriptionInternal"));
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#find-range,One or both tokens for %@ are nil - finder: %@, findee: %@", (uint8_t *)&v15, 0x20u);

  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (BOOL)_shouldUseFinderToken:(id)a3 findeeToken:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  const char *v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v12 = "finderToken != nil";
    v13 = 1961;
    goto LABEL_9;
  }
  if (!v6)
  {
    v12 = "findeeToken != nil";
    v13 = 1962;
LABEL_9:
    __assert_rtn("-[NIServerNBAMMSSession _shouldUseFinderToken:findeeToken:]", "NIServerFindingRanging.mm", v13, v12);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getIRK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getIRK"));
  v16 = 0;
  v17 = 0;
  v14 = 0;
  v15 = 0;
  objc_msgSend(v8, "getBytes:range:", &v16, 0, 8);
  objc_msgSend(v8, "getBytes:range:", &v17, 8, 8);
  objc_msgSend(v9, "getBytes:range:", &v14, 0, 8);
  objc_msgSend(v9, "getBytes:range:", &v15, 8, 8);
  if (v17 == v15)
    v10 = v16 > v14;
  else
    v10 = v17 > v15;

  return v10;
}

- (shared_ptr<rose::objects::NBAMMSSession>)_buildNbammsSession:(const void *)a3
{
  __int128 *v3;
  __int128 *v6;
  std::string *v7;
  std::string *v8;
  __int128 v9;
  NIServerNBAMMSSession *v10;
  _QWORD *v11;
  uint64_t v12;
  NIServerNBAMMSSession *v13;
  NIServerNBAMMSSession *v14;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t (***v31)();
  uint64_t v32;
  uint64_t (***v33)();
  uint64_t v34;
  uint64_t (***v35)();
  uint64_t v36;
  __int128 *v37;
  uint64_t v38;
  NSObject *v39;
  NSString *identityString;
  int v41;
  NSObject *v42;
  NSObject *v43;
  NSString *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  NBAMMSSession *v48;
  __shared_weak_count *v49;
  __int128 v50;
  void *__p[2];
  std::string::size_type v52;
  Logger *ptr;
  std::__shared_weak_count *v54;
  _BYTE v55[24];
  _BYTE *v56;
  _BYTE v57[24];
  _BYTE *v58;
  _BYTE v59[24];
  _BYTE *v60;
  _BYTE v61[24];
  _BYTE *v62;
  _QWORD v63[3];
  _QWORD *v64;
  uint64_t (**v65)();
  NIServerNBAMMSSession *v66;
  uint64_t (***v67)();
  uint64_t (**v68)();
  NIServerNBAMMSSession *v69;
  uint64_t (***v70)();
  uint64_t (**v71)();
  NIServerNBAMMSSession *v72;
  uint64_t (***v73)();
  __int128 buf;
  char v75;
  __int128 *p_buf;
  shared_ptr<rose::objects::NBAMMSSession> result;

  v6 = v3;
  v7 = (std::string *)sub_10000BF04(&buf, (char *)-[NSString UTF8String](self->_identityString, "UTF8String"));
  v8 = std::string::insert(v7, 0, "Finding.");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v52 = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (v75 < 0)
    operator delete((void *)buf);
  v10 = self;
  v11 = operator new(0x5D8uLL);
  v11[1] = 0;
  v11[2] = 0;
  *v11 = off_10080F610;
  v12 = (uint64_t)(v11 + 3);
  v13 = v10;
  *(_QWORD *)&buf = off_10080F660;
  *((_QWORD *)&buf + 1) = v13;
  p_buf = &buf;
  v71 = off_10080F6E0;
  v72 = v13;
  v73 = &v71;
  v68 = off_10080F760;
  v69 = v72;
  v70 = &v68;
  v65 = off_10080F7E0;
  v66 = v69;
  v67 = &v65;
  v14 = v66;
  v63[0] = off_10080F860;
  v63[1] = v14;
  v64 = v63;
  v62 = 0;
  v60 = 0;
  v58 = 0;
  v56 = 0;
  cntrl = (std::__shared_weak_count *)v14->_pbLogger.__cntrl_;
  ptr = v10->_pbLogger.__ptr_;
  v54 = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  sub_1002ADC18(v12, (__int128 *)__p, (void *)a3, (uint64_t)&buf, (uint64_t)&v71, (uint64_t)&v68, (uint64_t)&v65, (uint64_t)v63, (uint64_t)v61, (uint64_t)v59, (uint64_t)v57, (uint64_t)v55, &ptr);
  v11[3] = &off_10080F8E0;
  v11[4] = off_10080F9A8;
  v18 = v54;
  if (v54)
  {
    v19 = (unint64_t *)&v54->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v56;
  if (v56 == v55)
  {
    v22 = 4;
    v21 = v55;
  }
  else
  {
    if (!v56)
      goto LABEL_16;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_16:
  v23 = v58;
  if (v58 == v57)
  {
    v24 = 4;
    v23 = v57;
  }
  else
  {
    if (!v58)
      goto LABEL_21;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_21:
  v25 = v60;
  if (v60 == v59)
  {
    v26 = 4;
    v25 = v59;
  }
  else
  {
    if (!v60)
      goto LABEL_26;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_26:
  v27 = v62;
  if (v62 == v61)
  {
    v28 = 4;
    v27 = v61;
  }
  else
  {
    if (!v62)
      goto LABEL_31;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_31:
  v29 = v64;
  if (v64 == v63)
  {
    v30 = 4;
    v29 = v63;
  }
  else
  {
    if (!v64)
      goto LABEL_36;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_36:
  v31 = v67;
  if (v67 == &v65)
  {
    v32 = 4;
    v31 = &v65;
  }
  else
  {
    if (!v67)
      goto LABEL_41;
    v32 = 5;
  }
  (*v31)[v32]();
LABEL_41:
  v33 = v70;
  if (v70 == &v68)
  {
    v34 = 4;
    v33 = &v68;
  }
  else
  {
    if (!v70)
      goto LABEL_46;
    v34 = 5;
  }
  (*v33)[v34]();
LABEL_46:
  v35 = v73;
  if (v73 == &v71)
  {
    v36 = 4;
    v35 = &v71;
  }
  else
  {
    if (!v73)
      goto LABEL_51;
    v36 = 5;
  }
  (*v35)[v36]();
LABEL_51:
  v37 = p_buf;
  if (p_buf == &buf)
  {
    v38 = 4;
    v37 = &buf;
  }
  else
  {
    if (!p_buf)
      goto LABEL_56;
    v38 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v37 + 8 * v38))();
LABEL_56:
  *(_QWORD *)&v50 = v11 + 3;
  *((_QWORD *)&v50 + 1) = v11;
  sub_10001B020((uint64_t)&v50, v11 + 5, v12);
  v39 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    identityString = self->_identityString;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = identityString;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#find-range,Initialize NBAMMS session for %@.", (uint8_t *)&buf, 0xCu);
  }
  if ((_QWORD)v50)
  {
    v41 = sub_1002AEA48(v50);
    if (v41)
    {
      v42 = (id)qword_10085F520;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        sub_1002B48B0(v41, &buf);
        sub_1003E01FC();
      }

    }
    else
    {
      *v6 = v50;
      v6 = &v50;
    }
  }
  else
  {
    v43 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v44 = self->_identityString;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#find-range,Failed to create a NBAMMS session for %@.", (uint8_t *)&buf, 0xCu);
    }
  }
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v45 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
  if (*((_QWORD *)&v50 + 1))
  {
    v46 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

  if (SHIBYTE(v52) < 0)
    operator delete(__p[0]);
  result.__cntrl_ = v49;
  result.__ptr_ = v48;
  return result;
}

- (id)_getState
{
  NSString *identityString;
  const char *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;

  identityString = self->_identityString;
  v4 = "NO";
  if (self->_nbammsSession.__ptr_)
    v5 = "YES";
  else
    v5 = "NO";
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
  if (self->_finderAttached)
    v7 = "YES";
  else
    v7 = "NO";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
  v10 = sub_10021ED08(&self->_finderMutualAuthState.outboundAuthState, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
    v4 = "YES";
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSData descriptionInternal](self->_findeeMutualAuthState.outboundChallenge, "descriptionInternal"));
  v14 = sub_10021ED08((unsigned __int8 *)&self->_finderStartRangingOptions.__engaged_, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s, token: %@. Finder: %s, token: %@, authState: %@. Findee: %s, token: %@, authState: %@"), identityString, v5, v6, v7, v8, v11, v4, v12, v15));

  return v16;
}

- (void)_logStatisticsIfNecessary
{
  double v3;
  NSObject *v4;
  NSString *identityString;
  int easterlyOffsetM_low;
  int easterlyOffsetM_high;
  unsigned int uncertainty;
  int v9;
  int v10;
  int v11;
  NSString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;

  v3 = sub_10000883C();
  if (v3 - self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.northerlyOffsetM > 5.0)
  {
    v4 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      identityString = self->_identityString;
      easterlyOffsetM_low = LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
      easterlyOffsetM_high = HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
      uncertainty = self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty;
      v9 = *(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1);
      v10 = *(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_;
      v11 = 138413570;
      v12 = identityString;
      v13 = 1024;
      v14 = easterlyOffsetM_low;
      v15 = 1024;
      v16 = easterlyOffsetM_high;
      v17 = 1024;
      v18 = uncertainty;
      v19 = 1024;
      v20 = v9;
      v21 = 1024;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-range,%@, Solution count: %d successful, %d unsuccessful. Message count: %d crypto, %d mutual auth, %d aiding/signalling", (uint8_t *)&v11, 0x2Au);
    }
    self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.northerlyOffsetM = v3;
  }
}

- (void)_resetStatistics
{
  *(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_ = 0;
  *(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty = 0;
  *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__null_state_ = 0u;
}

- (BOOL)_shouldEncodeSignallingDataInMessageID
{
  return self->_sharedProtocol > 0;
}

- (unsigned)_encodeSignallingDataInMessageID:(unsigned __int8)a3
{
  _DWORD *v5;
  unint64_t v6;
  BOOL v7;
  unsigned __int8 v8;

  v5 = sub_100004784();
  sub_1000069CC(v5[144]);
  v6 = sub_10021DC78((uint64_t)&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc, (uint64_t)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp);
  v7 = (v6 & 0xFF0000) == 0 || (v6 & 0xFF000000) == 0;
  v8 = a3 | 8;
  if (v7)
    v8 = a3;
  if ((v6 & 0xFF00000000) == 0 || (v6 & 0xFF0000000000) == 0)
    return v8;
  else
    return v8 | 0x10;
}

- (void)_updateCryptoSessionConfigPayload
{
  unsigned __int8 cryptoSessionState;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  _BYTE *v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char *v13;
  unsigned __int8 v14;
  char v15;
  void *__p;
  _BYTE *v17;

  if (self->_nbammsSession.__ptr_)
  {
    -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
    cryptoSessionState = self->_cryptoSessionState;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    v5 = objc_msgSend(v4, "length");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    v15 = 0;
    sub_100191910(&__p, (size_t)objc_msgSend(v6, "length") + 8, &v15);

    *(_BYTE *)__p = 0;
    v7 = __p;
    *((_BYTE *)__p + 1) = 0;
    v7[2] = cryptoSessionState;
    v7[3] = v5;
    *((_DWORD *)v7 + 1) = 0;
    v8 = (char *)__p;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier")));
    v10 = objc_msgSend(v9, "bytes");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    memcpy(v8 + 8, v10, (size_t)objc_msgSend(v11, "length"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    v13 = (char *)objc_msgSend(v12, "length") + 8;

    if (v13 != (char *)(v17 - (_BYTE *)__p))
      __assert_rtn("-[NIServerNBAMMSSession _updateCryptoSessionConfigPayload]", "NIServerFindingRanging.mm", 2128, "byteOffset == payload.size()");
    if (*((_BYTE *)__p + 1))
      __assert_rtn("-[NIServerNBAMMSSession _updateCryptoSessionConfigPayload]", "NIServerFindingRanging.mm", 2132, "payload[kMessageIDIndex] == static_cast<uint8_t>(FindingMessageID::CryptoSessionConfig)");
    if (-[NIServerNBAMMSSession _shouldEncodeSignallingDataInMessageID](self, "_shouldEncodeSignallingDataInMessageID"))
    {
      v14 = -[NIServerNBAMMSSession _encodeSignallingDataInMessageID:](self, "_encodeSignallingDataInMessageID:", *((unsigned __int8 *)__p + 1));
      *((_BYTE *)__p + 1) = v14;
    }
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E0240();
    sub_1002B1E34((uint64_t)self->_nbammsSession.__ptr_, (uint64_t)&__p);
    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
  }
}

- (void)_receivedCryptoSessionConfigMessage:(const void *)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  NSString *identityString;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  NSString *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSString *v31;
  NIServerCryptoSession *v32;
  void *v33;
  NIServerCryptoSession *v34;
  NIServerCryptoSession *peerDecryptionSession;
  unsigned int cryptoSessionState;
  int v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  NSString *v45;
  int v46;
  _BYTE v47[20];
  void *v48;
  __int16 v49;
  NSString *v50;

  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E026C();
  ++self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty;
  -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
  v5 = *(_QWORD *)a3;
  v6 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (v6 <= 6)
  {
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      v8 = *((_DWORD *)a3 + 2) - *(_DWORD *)a3;
      identityString = self->_identityString;
      v46 = 67109378;
      *(_DWORD *)v47 = v8;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = identityString;
      v10 = "#find-range,#crypto Invalid peer session config message size %d, %@";
      v11 = v7;
      v12 = 18;
LABEL_12:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v46, v12);
      return;
    }
    return;
  }
  v13 = *(unsigned __int8 *)(v5 + 2);
  if (*(_BYTE *)(v5 + 2))
    v14 = v6 >= v13 + 7;
  else
    v14 = 0;
  if (v14)
  {
    v18 = *(unsigned __int8 *)(v5 + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5 + 7, *(unsigned __int8 *)(v5 + 2)));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
    v21 = objc_msgSend(v19, "isEqualToData:", v20);

    if ((v21 & 1) == 0)
    {
      v22 = (id)qword_10085F520;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
        v25 = CUPrintNSObjectMasked(v23, v24);
        v26 = (id)objc_claimAutoreleasedReturnValue(v25);
        v28 = CUPrintNSObjectMasked(v19, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
        v31 = self->_identityString;
        v46 = 138478595;
        *(_QWORD *)v47 = v26;
        *(_WORD *)&v47[8] = 2113;
        *(_QWORD *)&v47[10] = v29;
        *(_WORD *)&v47[18] = 2113;
        v48 = v30;
        v49 = 2112;
        v50 = v31;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Init peer session. Old ID: %{private}@. New ID: %{private}@. Token: %{private}@, %@", (uint8_t *)&v46, 0x2Au);

      }
      v32 = [NIServerCryptoSession alloc];
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken getIRK](self->_sessionToken, "getIRK"));
      v34 = -[NIServerCryptoSession initWithKeyDerivationKey:sessionIdentifier:encrypt:](v32, "initWithKeyDerivationKey:sessionIdentifier:encrypt:", v33, v19, 0);
      peerDecryptionSession = self->_peerDecryptionSession;
      self->_peerDecryptionSession = v34;

    }
    cryptoSessionState = self->_cryptoSessionState;
    -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
    v37 = 2;
    self->_cryptoSessionState = 2;
    if (v18 == 2)
    {
      if (!cryptoSessionState)
        goto LABEL_20;
    }
    else if (v18 != 3)
    {
LABEL_20:
      if (v37 != cryptoSessionState)
      {
        v38 = (id)qword_10085F520;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = sub_10021D8D4(v18);
          v40 = (id)objc_claimAutoreleasedReturnValue(v39);
          v41 = sub_10021D8D4(cryptoSessionState);
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          v43 = sub_10021D8D4(self->_cryptoSessionState);
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
          v45 = self->_identityString;
          v46 = 138478595;
          *(_QWORD *)v47 = v40;
          *(_WORD *)&v47[8] = 2113;
          *(_QWORD *)&v47[10] = v42;
          *(_WORD *)&v47[18] = 2113;
          v48 = v44;
          v49 = 2112;
          v50 = v45;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Session state update while receiving peer config [peer state %{private}@]. %{private}@ -> %{private}@. %@", (uint8_t *)&v46, 0x2Au);

        }
      }

      return;
    }
    v37 = 3;
    self->_cryptoSessionState = 3;
    goto LABEL_20;
  }
  v15 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    v16 = *((_DWORD *)a3 + 2) - *(_DWORD *)a3;
    v17 = self->_identityString;
    v46 = 67109634;
    *(_DWORD *)v47 = v13;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = v16;
    *(_WORD *)&v47[10] = 2112;
    *(_QWORD *)&v47[12] = v17;
    v10 = "#find-range,#crypto Invalid peer session ID size %d (config message size %d), %@";
    v11 = v15;
    v12 = 24;
    goto LABEL_12;
  }
}

- (void)_initializeEncryptionSessionIfNecessary
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *identityString;
  NIServerCryptoSession *v11;
  void *v12;
  NIServerCryptoSession *v13;
  NIServerCryptoSession *selfEncryptionSession;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSString *v20;

  if (!self->_cryptoSessionState)
  {
    v3 = NSRandomData(8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (id)qword_10085F520;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CUPrintNSObjectMasked(v4, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
      identityString = self->_identityString;
      v15 = 138478339;
      v16 = v8;
      v17 = 2113;
      v18 = v9;
      v19 = 2112;
      v20 = identityString;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Init self session. ID: %{private}@. Token: %{private}@. %@", (uint8_t *)&v15, 0x20u);

    }
    v11 = [NIServerCryptoSession alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken getIRK](self->_sessionToken, "getIRK"));
    v13 = -[NIServerCryptoSession initWithKeyDerivationKey:sessionIdentifier:encrypt:](v11, "initWithKeyDerivationKey:sessionIdentifier:encrypt:", v12, v4, 1);
    selfEncryptionSession = self->_selfEncryptionSession;
    self->_selfEncryptionSession = v13;

    self->_cryptoSessionState = 1;
  }
}

- (id)_encrypt:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[NIServerNBAMMSSession _isCryptoDisabled](self, "_isCryptoDisabled"))
    v5 = v4;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession encrypt:](self->_selfEncryptionSession, "encrypt:", v4));
  v6 = v5;

  return v6;
}

- (id)_decrypt:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[NIServerNBAMMSSession _isCryptoDisabled](self, "_isCryptoDisabled"))
    v5 = v4;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession decrypt:](self->_peerDecryptionSession, "decrypt:", v4));
  v6 = v5;

  return v6;
}

- (void)_resetCryptoStateIncludingFailures:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int cryptoFailures;
  NSString *identityString;
  NIServerCryptoSession *selfEncryptionSession;
  NIServerCryptoSession *peerDecryptionSession;
  unsigned __int8 v10;
  _DWORD v11[2];
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  NSString *v15;

  v3 = a3;
  v5 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    cryptoFailures = self->_cryptoFailures;
    identityString = self->_identityString;
    v11[0] = 67240706;
    v11[1] = cryptoFailures;
    v12 = 1026;
    v13 = v3;
    v14 = 2112;
    v15 = identityString;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Reset state. Failures: %{public}d. Reset: %{public}d, %@", (uint8_t *)v11, 0x18u);
  }
  selfEncryptionSession = self->_selfEncryptionSession;
  self->_selfEncryptionSession = 0;

  peerDecryptionSession = self->_peerDecryptionSession;
  self->_peerDecryptionSession = 0;

  if (-[NIServerNBAMMSSession _isCryptoDisabled](self, "_isCryptoDisabled"))
    v10 = 3;
  else
    v10 = 0;
  self->_cryptoSessionState = v10;
  if (v3)
    self->_cryptoFailures = 0;
}

- (void)_handleCryptoFailure
{
  int cryptoFailures;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  NIServerNBAMMSSession *v11;
  _QWORD block[4];
  id v13;
  NIServerNBAMMSSession *v14;

  -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 0);
  sub_10021B6D8((uint64_t)&self->_finderMutualAuthState);
  sub_10021B6D8((uint64_t)&self->_finderStartRangingOptions.__engaged_);
  -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
  -[NIServerNBAMMSSession _updateCryptoSessionConfigPayload](self, "_updateCryptoSessionConfigPayload");
  cryptoFailures = self->_cryptoFailures;
  self->_cryptoFailures = cryptoFailures + 1;
  if (cryptoFailures >= 10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    v5 = WeakRetained;
    if (WeakRetained)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "clientQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100221F94;
      block[3] = &unk_1007FA518;
      v13 = v5;
      v14 = self;
      dispatch_async(v6, block);

    }
    v7 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientQueue"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100221FA4;
      v9[3] = &unk_1007FA518;
      v10 = v7;
      v11 = self;
      dispatch_async(v8, v9);

    }
  }
}

- (BOOL)_isCryptoDisabled
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100222028;
  block[3] = &unk_1007FB340;
  block[4] = self;
  if (qword_100859530 != -1)
    dispatch_once(&qword_100859530, block);
  return byte_100859538;
}

- (BOOL)_shouldSendMutualAuthMessage
{
  BOOL finderAttached;
  int outboundAuthState;
  char val_high;
  int engaged;

  finderAttached = self->_finderAttached;
  if (finderAttached)
  {
    outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    finderAttached = outboundAuthState != 1
                  && (outboundAuthState != 4 || self->_finderMutualAuthState.inboundAuthState != 1);
  }
  val_high = HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_);
  if (val_high)
  {
    engaged = self->_finderStartRangingOptions.__engaged_;
    val_high = engaged != 1 && (engaged != 4 || LOBYTE(self->_finderMutualAuthTimer) != 1);
  }
  return finderAttached | val_high;
}

- (void)_handleNonMutualAuthMessage
{
  -[NIServerNBAMMSSession _processNonMutualAuthMessageForFinder:](self, "_processNonMutualAuthMessageForFinder:", 1);
  -[NIServerNBAMMSSession _processNonMutualAuthMessageForFinder:](self, "_processNonMutualAuthMessageForFinder:", 0);
  -[NIServerNBAMMSSession _reportMutualAuthStates](self, "_reportMutualAuthStates");
}

- (void)_processNonMutualAuthMessageForFinder:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v6;
  char *v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *v11;
  NSString *identityString;
  int v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  NSString *v18;
  NSString *v19;
  int v20;
  const char *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  NSString *v25;

  v3 = 971;
  if (a3)
    v3 = 232;
  if (*((_BYTE *)&self->super.isa + v3))
  {
    v4 = a3;
    v6 = 984;
    if (a3)
      v6 = 248;
    v7 = (char *)self + v6;
    v8 = *((unsigned __int8 *)&self->super.isa + v6);
    if (v8 != 1)
    {
      if (v8 == 4)
      {
        v9 = v7[24];
        if (v9 == 1)
          return;
      }
      else if (v8 == 3)
      {
        v9 = v7[24];
        if (v9 == 1)
        {
          v10 = (id)qword_10085F520;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = sub_1002B69E0(v4);
            identityString = self->_identityString;
            v20 = 136315394;
            v21 = v11;
            v22 = 2112;
            v23 = identityString;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Non-auth message. Self [%s] outbound response accepted. %@", (uint8_t *)&v20, 0x16u);
          }

          *v7 = 4;
          return;
        }
      }
      else
      {
        if ((v8 - 5) < 2)
          return;
        v9 = v7[24];
      }
      if (v9 != 2)
      {
        v13 = *((_DWORD *)v7 + 12);
        *((_DWORD *)v7 + 12) = v13 + 1;
        if (v13 >= 50)
          *v7 = 6;
        v14 = (id)qword_10085F520;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = sub_1002B69E0(v4);
          v17 = sub_10021ED08((unsigned __int8 *)v7, v16);
          v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
          v19 = self->_identityString;
          v20 = 136315650;
          v21 = v15;
          v22 = 2112;
          v23 = v18;
          v24 = 2112;
          v25 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#find-range,#auth Non-auth message. Self [%s] missed attempt %@. %@", (uint8_t *)&v20, 0x20u);

        }
      }
    }
  }
}

- (void)_reportMutualAuthStates
{
  __int16 *v3;
  int outboundAuthState;
  NSObject *v5;
  NSString *identityString;
  __int16 v7;
  int engaged;
  NSObject *v9;
  NSString *v10;
  __int16 v11;
  NSObject *v12;
  NSString *v13;
  NSObject *secondary_scheduling_delay_usec;
  void *v15;
  NSObject *v16;
  NSString *v17;
  double velocityChangeH2;
  double v19;
  int v20;
  NSString *v21;

  v3 = (__int16 *)((char *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec + 1);
  if (self->_finderAttached
    && *(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_)
  {
    outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (((outboundAuthState - 5) < 2 || self->_finderMutualAuthState.inboundAuthState == 2)
      && (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
       || *(_BYTE *)v3))
    {
      v5 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        v20 = 138412290;
        v21 = identityString;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for finder failed, report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      v7 = 256;
LABEL_10:
      *v3 = v7;
      goto LABEL_15;
    }
    if (outboundAuthState == 4
      && self->_finderMutualAuthState.inboundAuthState == 1
      && (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
       || !*(_BYTE *)v3))
    {
      v12 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_identityString;
        v20 = 138412290;
        v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for finder succeeded, cancel timer and report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      secondary_scheduling_delay_usec = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
      if (secondary_scheduling_delay_usec)
      {
        dispatch_source_cancel(secondary_scheduling_delay_usec);
        v15 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0;

        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
      }
      (*(void (**)(void))(*(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      v7 = 257;
      goto LABEL_10;
    }
  }
LABEL_15:
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
    && *(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_)
  {
    engaged = self->_finderStartRangingOptions.__engaged_;
    if (((engaged - 5) < 2 || LOBYTE(self->_finderMutualAuthTimer) == 2)
      && (!*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)
       || *((_BYTE *)v3 + 920)))
    {
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_identityString;
        v20 = 138412290;
        v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for findee failed, report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      (*(void (**)(void))(*(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      v11 = 256;
LABEL_24:
      v3[460] = v11;
      return;
    }
    if (engaged == 4
      && LOBYTE(self->_finderMutualAuthTimer) == 1
      && (!*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)
       || !*((_BYTE *)v3 + 920)))
    {
      v16 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_identityString;
        v20 = 138412290;
        v21 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for findee succeeded, cancel timer and report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
      if (velocityChangeH2 != 0.0)
      {
        dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
        v19 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
        self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2 = 0.0;

        self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
      }
      (*(void (**)(void))(*(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      v11 = 257;
      goto LABEL_24;
    }
  }
}

- (BOOL)_encryptAndUpdateMutualAuthPayload
{
  unsigned int outboundAuthState;
  MutualAuthState *p_finderMutualAuthState;
  BOOL v5;
  int v6;
  BOOL v7;
  unsigned int engaged;
  int v9;
  BOOL v10;
  unsigned int v11;
  unsigned int inboundAuthState;
  unsigned int v13;
  unsigned int finderMutualAuthTimer_low;
  _OWORD *v15;
  __int128 v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v23;
  NSString *identityString;
  NSObject *v25;
  NSString *v26;
  char v27;
  void *__p[3];
  _BYTE v29[21];
  __int128 buf;

  if (!self->_nbammsSession.__ptr_)
    return 0;
  if (self->_finderAttached)
  {
    p_finderMutualAuthState = &self->_finderMutualAuthState;
    outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    v5 = outboundAuthState > 0xB;
    v6 = (1 << outboundAuthState) & 0xC02;
    v7 = v5 || v6 == 0;
    if (v7 && !self->_finderMutualAuthState.outboundChallenge)
    {
      v23 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = identityString;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Self [Finder] start mutual auth (generate outbound challenge), %@", (uint8_t *)&buf, 0xCu);
      }
      sub_100222BA8((uint64_t)&self->_finderMutualAuthState);
      p_finderMutualAuthState->outboundAuthState = 2;
    }
  }
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    engaged = self->_finderStartRangingOptions.__engaged_;
    v5 = engaged > 0xB;
    v9 = (1 << engaged) & 0xC02;
    v10 = v5 || v9 == 0;
    if (v10 && !*(_QWORD *)&self->_finderSignallingData.var0.__null_state_)
    {
      v25 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_identityString;
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Self [Findee] start mutual auth (generate outbound challenge), %@", (uint8_t *)&buf, 0xCu);
      }
      sub_100222BA8((uint64_t)&self->_finderStartRangingOptions.__engaged_);
      self->_finderStartRangingOptions.__engaged_ = 2;
    }
  }
  v29[0] = 1;
  memset(&v29[2], 0, 19);
  v11 = self->_finderMutualAuthState.outboundAuthState;
  if (v11 >= 0x10)
    sub_1003E0298();
  inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
  if (inboundAuthState >= 0x10)
    sub_1003E02C0();
  v29[1] = inboundAuthState | (16 * v11);
  if ((id)-[NSData length](self->_finderMutualAuthState.outboundChallenge, "length") == (id)3)
    -[NSData getBytes:length:](self->_finderMutualAuthState.outboundChallenge, "getBytes:length:", &v29[2], 3);
  if ((id)-[NSData length](self->_finderMutualAuthState.outboundResponse, "length") == (id)6)
    -[NSData getBytes:length:](self->_finderMutualAuthState.outboundResponse, "getBytes:length:", &v29[5], 6);
  v13 = self->_finderStartRangingOptions.__engaged_;
  if (v13 >= 0x10)
    sub_1003E02E8();
  finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
  if (finderMutualAuthTimer_low >= 0x10)
    sub_1003E0310();
  v29[11] = finderMutualAuthTimer_low | (16 * v13);
  if (objc_msgSend(*(id *)&self->_finderSignallingData.var0.__null_state_, "length") == (id)3)
    objc_msgSend(*(id *)&self->_finderSignallingData.var0.__null_state_, "getBytes:length:", &v29[12], 3);
  if (objc_msgSend(*(id *)&self->_finderSignallingData.var0.__val_.isPhone, "length") == (id)6)
    objc_msgSend(*(id *)&self->_finderSignallingData.var0.__val_.isPhone, "getBytes:length:", &v29[15], 6);
  LOBYTE(__p[0]) = 0;
  sub_100191910(&buf, 0x15uLL, __p);
  v15 = (_OWORD *)buf;
  v16 = *(_OWORD *)v29;
  *(_QWORD *)(buf + 13) = *(_QWORD *)&v29[13];
  *v15 = v16;
  if (-[NIServerNBAMMSSession _shouldEncodeSignallingDataInMessageID](self, "_shouldEncodeSignallingDataInMessageID"))
  {
    v17 = -[NIServerNBAMMSSession _encodeSignallingDataInMessageID:](self, "_encodeSignallingDataInMessageID:", *(unsigned __int8 *)buf);
    *(_BYTE *)buf = v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", (_QWORD)buf, *((_QWORD *)&buf + 1) - (_QWORD)buf));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _encrypt:](self, "_encrypt:", v18));
  v20 = v19;
  if (v19 && objc_msgSend(v19, "length"))
  {
    v27 = 0;
    sub_100191910(__p, (size_t)objc_msgSend(v20, "length"), &v27);
    objc_msgSend(v20, "getBytes:length:", __p[0], objc_msgSend(v20, "length"));
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E039C();
    sub_1002B1E34((uint64_t)self->_nbammsSession.__ptr_, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v21 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E0338();
    v21 = 0;
  }

  if ((_QWORD)buf)
  {
    *((_QWORD *)&buf + 1) = buf;
    operator delete((void *)buf);
  }
  return v21;
}

- (void)_receivedMutualAuthMessage:(const void *)a3
{
  __int128 *v5;
  __int128 v6;
  int v7;
  NSObject *v8;
  const char *v9;
  _BYTE v10[56];
  char v11;
  _BYTE v12[56];
  unsigned __int8 v13;
  _BYTE v14[21];
  uint8_t buf[24];

  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E046C();
  ++*(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1);
  -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
  v5 = *(__int128 **)a3;
  if (*((_QWORD *)a3 + 1) - *(_QWORD *)a3 > 0x14uLL)
  {
    v6 = *v5;
    *(_QWORD *)&v14[13] = *(_QWORD *)((char *)v5 + 13);
    *(_OWORD *)v14 = v6;
    sub_100222DA8((uint64_t)v14, 1, (uint64_t)v12);
    sub_100222DA8((uint64_t)v14, 0, (uint64_t)v10);
    v7 = v13;
    if (v13 && v11)
    {
      -[NIServerNBAMMSSession _processPeerMutualAuthState:peerIsFinder:](self, "_processPeerMutualAuthState:peerIsFinder:", v12, 1);
      if (!v11)
        sub_10000BA44();
      -[NIServerNBAMMSSession _processPeerMutualAuthState:peerIsFinder:](self, "_processPeerMutualAuthState:peerIsFinder:", v10, 0);
      -[NIServerNBAMMSSession _reportMutualAuthStates](self, "_reportMutualAuthStates");
    }
    else
    {
      v8 = (id)qword_10085F520;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = sub_1002B69E0(v7 == 0);
        sub_1003E0428((uint64_t)v9, buf, v8);
      }

    }
    sub_10022CEA4((uint64_t)v10);
    sub_10022CEA4((uint64_t)v12);
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E03C8();
  }
}

- (void)_processPeerMutualAuthState:(const MutualAuthState *)a3 peerIsFinder:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  char *v12;
  id *v13;
  unsigned int outboundAuthState;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  void *v34;
  char v35;
  int inboundAuthState;
  char v37;
  int v38;
  const char *v39;
  __int16 v40;
  void *v41;
  char v42[8];
  id v43;
  id v44;
  char v45;
  id v46;
  id v47;
  int v48;

  v4 = a4;
  v6 = 232;
  if (a4)
    v6 = 971;
  if (*((_BYTE *)&self->super.isa + v6))
  {
    v8 = 304;
    if (a4)
      v8 = 1040;
    v9 = *(Class *)((char *)&self->super.isa + v8);
    if (a4)
      v10 = 984;
    else
      v10 = 248;
    v11 = v9;
    v12 = (char *)self + v10;
    v42[0] = *v12;
    v43 = *((id *)v12 + 1);
    v44 = *((id *)v12 + 2);
    v45 = v12[24];
    v13 = (id *)(v12 + 32);
    v46 = *((id *)v12 + 4);
    v47 = *((id *)v12 + 5);
    v48 = *((_DWORD *)v12 + 12);
    *((_DWORD *)v12 + 12) = 0;
    outboundAuthState = a3->outboundAuthState;
    if (outboundAuthState == 1)
      goto LABEL_14;
    if ((*v12 & 0xFE) != 0xA)
    {
      if ((outboundAuthState & 0xFE) != 0xA)
      {
        if (a3->outboundResponse && !-[NSData isEqualToData:](a3->outboundChallenge, "isEqualToData:", *v13))
        {
          sub_10022342C((uint64_t)v12, 0xAu);
          goto LABEL_14;
        }
        if (*((_QWORD *)v12 + 1))
        {
          if (a3->outboundChallenge && (objc_msgSend(*v13, "isEqualToData:") & 1) == 0)
          {
            objc_storeStrong((id *)v12 + 4, a3->outboundChallenge);
            sub_1002234C4(v12, v11);
            *v12 = 3;
          }
          if (a3->outboundResponse && (objc_msgSend(*((id *)v12 + 5), "isEqualToData:") & 1) == 0)
          {
            objc_storeStrong((id *)v12 + 5, a3->outboundResponse);
            if (sub_1002235D4(v12, v11))
              v35 = 1;
            else
              v35 = 2;
            v12[24] = v35;
          }
          inboundAuthState = a3->inboundAuthState;
          if (inboundAuthState == 1)
          {
            v37 = 4;
          }
          else
          {
            if (inboundAuthState != 2)
              goto LABEL_14;
            v37 = 5;
          }
        }
        else
        {
          sub_100222BA8((uint64_t)v12);
          v37 = 2;
        }
        *v12 = v37;
        goto LABEL_14;
      }
      sub_10022342C((uint64_t)v12, outboundAuthState);
    }
    sub_1002233B4(v12);
LABEL_14:
    if (!sub_100223708((unsigned __int8 *)v12, (unsigned __int8 *)v42))
    {
      v15 = (id)qword_10085F520;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = sub_1002B69E0(v4);
        v18 = sub_10021ED08(&a3->outboundAuthState, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v38 = 136315394;
        v39 = v16;
        v40 = 2112;
        v41 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Received peer [%s] mutual auth:     %@", (uint8_t *)&v38, 0x16u);

      }
      v20 = !v4;
      v21 = (id)qword_10085F520;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = sub_1002B69E0(v20);
        v24 = sub_10021ED08((unsigned __int8 *)v42, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v38 = 136315394;
        v39 = v22;
        v40 = 2112;
        v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#find-range,#auth     Self [%s] mutual auth (BEFORE): %@", (uint8_t *)&v38, 0x16u);

      }
      v26 = (id)qword_10085F520;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = sub_1002B69E0(v20);
        v29 = sub_10021ED08((unsigned __int8 *)v12, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v38 = 136315394;
        v39 = v27;
        v40 = 2112;
        v41 = v30;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#find-range,#auth     Self [%s] mutual auth (AFTER):  %@", (uint8_t *)&v38, 0x16u);

      }
    }

LABEL_23:
    return;
  }
  if (a3->outboundAuthState)
  {
    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v31 = sub_1002B69E0(v4);
      v33 = sub_10021ED08(&a3->outboundAuthState, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      sub_1003E0498((uint64_t)v31, v34, (uint64_t)v42, v11);
    }
    goto LABEL_23;
  }
}

- (void)_armMutualAuthTimerForFinder:(BOOL)a3
{
  NSObject *secondary_scheduling_delay_usec;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id *v11;
  NSObject *v12;
  NSString *identityString;
  const char *v14;
  double velocityChangeH2;
  dispatch_source_t v16;
  double v17;
  double v18;
  dispatch_time_t v19;
  double v20;
  NSString *v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  _QWORD handler[5];
  id v26;
  BOOL v27;
  id location;
  uint8_t buf[4];
  NSString *v30;

  if (a3)
  {
    secondary_scheduling_delay_usec = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    if (secondary_scheduling_delay_usec)
      dispatch_source_cancel(secondary_scheduling_delay_usec);
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_internalQueue);
    v7 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = (optional<unsigned int>)v6;

    v8 = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    v9 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    v10 = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100223AE0;
    handler[3] = &unk_10080F4D0;
    v11 = &v26;
    objc_copyWeak(&v26, &location);
    handler[4] = self;
    v27 = a3;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(*(dispatch_object_t *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec);
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    v12 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      identityString = self->_identityString;
      *(_DWORD *)buf = 138412290;
      v30 = identityString;
      v14 = "#find-range,Armed finder mutual-auth timer, session %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    }
  }
  else
  {
    velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    if (velocityChangeH2 != 0.0)
      dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
    v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_internalQueue);
    v17 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    *(_QWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2 = v16;

    v18 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    v19 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)&v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    v20 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100223C0C;
    v22[3] = &unk_10080F4D0;
    v11 = &v23;
    objc_copyWeak(&v23, &location);
    v22[4] = self;
    v24 = a3;
    dispatch_source_set_event_handler(*(dispatch_source_t *)&v20, v22);
    dispatch_resume(*(dispatch_object_t *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2);
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    v12 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_identityString;
      *(_DWORD *)buf = 138412290;
      v30 = v21;
      v14 = "#find-range,Armed findee mutual-auth timer, session %@";
      goto LABEL_10;
    }
  }
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_, 0);
  objc_storeStrong((id *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_, 0);
  objc_storeStrong((id *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2, 0);
  objc_storeStrong((id *)&self->_findeeMutualAuthState.outboundChallenge, 0);

  objc_destroyWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);
  objc_storeStrong((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec, 0);
  objc_storeStrong((id *)&self->_finderToken, 0);

  objc_destroyWeak((id *)&self->_finderClient);
  objc_storeStrong((id *)&self->_peerDecryptionSession, 0);
  objc_storeStrong((id *)&self->_selfEncryptionSession, 0);
  sub_10001AE68((uint64_t)&self->_pbLogger);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  sub_10001AE68((uint64_t)&self->_nbammsSession);
  objc_storeStrong((id *)&self->_identityString, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (id).cxx_construct
{
  self->_nbammsSession = 0u;
  self->_sessionStartRangingOptions.var0.__null_state_ = 0;
  self->_sessionStartRangingOptions.__engaged_ = 0;
  self->_pbLogger = 0u;
  *(_OWORD *)&self->_finderMutualAuthState.outboundChallenge = 0u;
  *(_OWORD *)&self->_finderMutualAuthState.inboundChallenge = 0u;
  sub_10021B6D8((uint64_t)&self->_finderMutualAuthState);
  self->_finderRoseServiceRequest.var0.__null_state_ = 0;
  self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = 0;
  LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 0;
  self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = 0;
  self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
  *(_WORD *)(&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ + 1) = 0;
  *(_OWORD *)&self->_finderSignallingData.var0.__null_state_ = 0u;
  *(_OWORD *)&self->_finderShouldArmMutualAuthTimer = 0u;
  sub_10021B6D8((uint64_t)&self->_finderStartRangingOptions.__engaged_);
  LOBYTE(self->_findeeMutualAuthState.outboundResponse) = 0;
  self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
  self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr.var0.__null_state_ = 0;
  self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
  self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[3] = 0;
  self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
  LOBYTE(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp) = 0;
  BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
  *(_WORD *)(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 1) = 0;
  return self;
}

@end
