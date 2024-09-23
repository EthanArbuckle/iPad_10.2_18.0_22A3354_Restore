@implementation NINearbyUpdatesEngine

- (NINearbyUpdatesEngine)initWithConfiguration:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6 analyticsManager:(id)a7 protobufLogger:(shared_ptr<rose:(id *)a9 :protobuf::Logger>)a8 error:
{
  uint64_t *v9;
  uint64_t *v10;
  id v17;
  id v18;
  id v19;
  id v20;
  NINearbyUpdatesEngine *v21;
  NINearbyUpdatesEngine *v22;
  NINearbyUpdatesEngine *v23;
  NINearbyUpdatesEngine *v24;
  void **p_uniqueIdentifier;
  NSMutableDictionary *v26;
  SyntheticApertureFilter *value;
  void *v28;
  double lastProcessTimeSeconds;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  uint64_t v39;
  objc_super v40;

  v10 = v9;
  v17 = a3;
  v37 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
LABEL_19:
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyUpdatesEngine.mm"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v19)
      goto LABEL_4;
    goto LABEL_20;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyUpdatesEngine.mm"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  if (!v18)
    goto LABEL_19;
LABEL_3:
  if (v19)
    goto LABEL_4;
LABEL_20:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyUpdatesEngine.mm"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

LABEL_4:
  if (!a8.__ptr_)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerNearbyUpdatesEngine.mm"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v40.receiver = self;
  v40.super_class = (Class)NINearbyUpdatesEngine;
  v21 = -[NINearbyUpdatesEngine init](&v40, "init");
  v22 = v21;
  v23 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_queue, a4);
    objc_storeWeak((id *)&v22->_configuration, v18);
    objc_storeWeak((id *)&v22->_previousNIObjectUpdate, v19);
    sub_100021C24(&v22->_protobufLogger.__ptr_, v10);
    objc_storeStrong((id *)&v22->_dataSource, a7);
    if (v19)
    {
      objc_msgSend(v19, "uniqueIdentifierForEngine:", v23);
    }
    else
    {
      v38 = 0uLL;
      v39 = 0;
    }
    p_uniqueIdentifier = (void **)&v22->_uniqueIdentifier;
    if (*((char *)&v23->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
      operator delete(*p_uniqueIdentifier);
    *(_OWORD *)p_uniqueIdentifier = v38;
    *((_QWORD *)&v22->_uniqueIdentifier.__r_.__value_.var0.var1 + 2) = v39;
    v23->_rangeMeasSourcePref = 0;
    v26 = objc_opt_new(NSMutableDictionary);
    value = v23->_syntheticApertureFilter.__ptr_.__value_;
    v23->_syntheticApertureFilter.__ptr_.__value_ = (SyntheticApertureFilter *)v26;

    LOBYTE(v23->_convStateForObject) = 1;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    LOBYTE(v23->_cachedMagneticFieldStrength.var0.__val_.value) = objc_msgSend(v28, "BOOLForKey:", CFSTR("NIFindingOnlySendKinematicPeerData"));

    *(_OWORD *)&v23->_findingLatencyBookkeeping.receivedFirstMeasurement = 0u;
    *(_OWORD *)&v23->_cachedMagneticFieldStrength.__engaged_ = 0u;
    lastProcessTimeSeconds = v23->_findingLatencyBookkeeping.lastProcessTimeSeconds;
    v23->_findingLatencyBookkeeping.lastProcessTimeSeconds = 0.0;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine configure:](v23, "configure:", v17));
    v31 = v30;
    if (v30)
    {
      v24 = 0;
      *(_QWORD *)a8.__ptr_ = objc_retainAutorelease(v30);
    }
    else
    {
      v24 = v23;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)_configureRangeBiasEstimator
{
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  NIMLModelResourceFileHandler *v11;
  RangeBiasEstimatorSingleAntennaModel *v12;
  NRBYFindingContainer *value;
  Logger *ptr;
  void *v15;
  Logger *v16;
  void *__p;
  void *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[8];
  const void *v22;
  uint64_t v23;
  _QWORD v24[3];
  char v25;

  LOBYTE(self->_convStateForObject) = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("NIHomeBypassResponderBiasEstimation")));

  if (v4)
  {
    v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NIHomeBypassResponderBiasEstimation"));
    LOBYTE(self->_convStateForObject) = v5;
    if (v5)
      goto LABEL_3;
  }
  else if (LOBYTE(self->_convStateForObject))
  {
LABEL_3:
    v6 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Bypassing range bias estimation", buf, 2u);
    }
    goto LABEL_17;
  }
  if (byte_10085D68F >= 0)
    v7 = &qword_10085D678;
  else
    v7 = (uint64_t *)qword_10085D678;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  if (byte_10085D6A7 >= 0)
    v9 = &qword_10085D690;
  else
    v9 = (uint64_t *)qword_10085D690;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  v11 = -[NIMLModelResourceFileHandler initWithResourceBundleDirectory:bundleName:]([NIMLModelResourceFileHandler alloc], "initWithResourceBundleDirectory:bundleName:", v8, v10);
  v12 = objc_alloc_init(RangeBiasEstimatorSingleAntennaModel);
  value = self->_findingAlgorithmContainer.__ptr_.__value_;
  self->_findingAlgorithmContainer.__ptr_.__value_ = (NRBYFindingContainer *)v12;

  if ((-[NRBYFindingContainer configureWithResourceFileHandler:](self->_findingAlgorithmContainer.__ptr_.__value_, "configureWithResourceFileHandler:", v11) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E9360();
    LOBYTE(self->_convStateForObject) = 1;
  }

LABEL_17:
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    if (LOBYTE(self->_convStateForObject))
    {
      LOBYTE(v24[0]) = 0;
      v25 = 0;
      sub_100277C8C((uint64_t)ptr, 0, 0, (uint64_t)v24);
      if (v25)
      {
        v15 = (void *)v24[0];
        if (v24[0])
        {
          v24[1] = v24[0];
LABEL_27:
          operator delete(v15);
        }
      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      v22 = 0;
      v23 = 0;
      sub_1002F0988(buf, &unk_100477500, (uint64_t)&xmmword_100477558, 0xBuLL);
      v16 = self->_protobufLogger.__ptr_;
      v18 = 0;
      v19 = 0;
      __p = 0;
      sub_1001375D8(&__p, *(const void **)buf, (uint64_t)v22, ((uint64_t)v22 - *(_QWORD *)buf) >> 3);
      v20 = 1;
      sub_100277C8C((uint64_t)v16, 1, 0x100000002, (uint64_t)&__p);
      if (v20 && __p)
      {
        v18 = __p;
        operator delete(__p);
      }
      v15 = *(void **)buf;
      if (*(_QWORD *)buf)
      {
        v22 = *(const void **)buf;
        goto LABEL_27;
      }
    }
  }

}

- (id)configure:(id)a3
{
  id v5;
  NSObject *v6;
  double *p_accumulatedExcessSeconds;
  double accumulatedExcessSeconds;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  char isKindOfClass;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  id v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_uniqueIdentifier;
  id v43;
  void *v44;
  unsigned int v45;
  NSObject *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  _DWORD *v56;
  int v57;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v58;
  _QWORD v59[2];

  v5 = a3;
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v57) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#nrby-eng,configure", (uint8_t *)&v57, 2u);
  }
  p_accumulatedExcessSeconds = &self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
  objc_storeStrong((id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds, a3);
  accumulatedExcessSeconds = self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
  v10 = objc_opt_class(NIHomeDeviceConfiguration, v9);
  if ((objc_opt_isKindOfClass(*(_QWORD *)&accumulatedExcessSeconds, v10) & 1) != 0)
  {
    -[NINearbyUpdatesEngine _configureRangeBiasEstimator](self, "_configureRangeBiasEstimator");
    v12 = *(id *)p_accumulatedExcessSeconds;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "monitoredRegions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _configureForRegionMonitoring:](self, "_configureForRegionMonitoring:", v13));

    self->_rangeMeasSourcePref = 1;
    goto LABEL_18;
  }
  v15 = *(id *)p_accumulatedExcessSeconds;
  v16 = objc_opt_class(NINearbyAccessoryConfiguration, v11);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v14 = 0;
    self->_rangeMeasSourcePref = 1;
    goto LABEL_18;
  }
  v18 = *(id *)p_accumulatedExcessSeconds;
  v19 = objc_opt_class(NINearbyPeerConfiguration, v17);
  isKindOfClass = objc_opt_isKindOfClass(v18, v19);
  v22 = *(id *)p_accumulatedExcessSeconds;
  if ((isKindOfClass & 1) != 0)
  {
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "debugParameters"));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "debugParameters"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", CFSTR("enableAdditionalUWBSignalFeatures")));
      v27 = v26 == 0;

      if (!v27)
        -[NINearbyUpdatesEngine _configureRangeBiasEstimator](self, "_configureRangeBiasEstimator");
    }
    self->_rangeMeasSourcePref = 0;

    goto LABEL_15;
  }
  v28 = objc_opt_class(NIDevicePresenceConfiguration, v21);
  if ((objc_opt_isKindOfClass(v22, v28) & 1) == 0)
  {
LABEL_15:
    v14 = 0;
    goto LABEL_18;
  }
  v29 = *(id *)p_accumulatedExcessSeconds;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "monitoredRegions"));
  v31 = v30 == 0;

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "innerBoundary"));
    v59[0] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "outerBoundary"));
    v59[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _configureForRegionMonitoring:](self, "_configureForRegionMonitoring:", v34));

  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "monitoredRegions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _configureForRegionMonitoring:](self, "_configureForRegionMonitoring:", v32));
  }

LABEL_18:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v36 = objc_msgSend(v35, "BOOLForKey:", CFSTR("ForcePeerFindingAlgorithms"));

  if (v36)
  {
    v38 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v57) = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#nrby-eng,ForcePeerFindingAlgorithms set.  ", (uint8_t *)&v57, 2u);
    }
  }
  v39 = *(id *)p_accumulatedExcessSeconds;
  v40 = objc_opt_class(NIFindingConfiguration, v37);
  if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
  {
    v41 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      p_uniqueIdentifier = &self->_uniqueIdentifier;
      if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
        p_uniqueIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_uniqueIdentifier->__r_.__value_.var0.var1.__data_;
      v57 = 136315138;
      v58 = p_uniqueIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_configuration is NIFindingConfiguration. Unique identifier: %s", (uint8_t *)&v57, 0xCu);
    }
    v43 = *(id *)p_accumulatedExcessSeconds;
    if ((objc_msgSend(v43, "isFinder") & 1) != 0)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v45 = objc_msgSend(v44, "BOOLForKey:", CFSTR("EnableDeviceFindingOnPhone"));

      if (v45)
      {
        v46 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v57) = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#nrby-eng,For rdar://102527413 (Test hook to use Wenda arrow interface on phone), enabling device finding on phone", (uint8_t *)&v57, 2u);
        }
        -[NINearbyUpdatesEngine _createDeviceFinderAlgoContainer](self, "_createDeviceFinderAlgoContainer");
      }
      else
      {
        v56 = sub_100004784();
        if (sub_1000069CC(v56[144]))
          -[NINearbyUpdatesEngine _createPeopleFinderAlgoContainer](self, "_createPeopleFinderAlgoContainer");
      }
    }
    else
    {
      -[NINearbyUpdatesEngine _createFindeeAlgoContainer](self, "_createFindeeAlgoContainer");
    }

  }
  else if ((objc_msgSend(*(id *)p_accumulatedExcessSeconds, "_internalIsExtendedDistanceMeasurementEnabled") | v36) == 1)
  {
    -[NINearbyUpdatesEngine _createPeerFindingAlgoContainer](self, "_createPeerFindingAlgoContainer");
  }
  else if (objc_msgSend(*(id *)p_accumulatedExcessSeconds, "_internalIsCameraAssistanceEnabled"))
  {
    v48 = *(id *)p_accumulatedExcessSeconds;
    v49 = objc_opt_class(NINearbyPeerConfiguration, v47);
    if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0
      || (v51 = *(id *)p_accumulatedExcessSeconds,
          v52 = objc_opt_class(NINearbyAccessoryConfiguration, v50),
          (objc_opt_isKindOfClass(v51, v52) & 1) != 0))
    {
      v53 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        data = &self->_uniqueIdentifier;
        if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
          data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
        v57 = 136315138;
        v58 = data;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_configuration is NINearbyPeerConfiguration AND has camera assistance; but it does not have enhanced"
          " ranging or test mode enabled. Unique identifier: %s",
          (uint8_t *)&v57,
          0xCu);
      }
      -[NINearbyUpdatesEngine _createSyntheticApertureAlgoContainer](self, "_createSyntheticApertureAlgoContainer");
    }
  }

  return v14;
}

- (id)_configureForRegionMonitoring:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *regionDict;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NIRegionKey *v10;
  void *v11;
  NIRegionKey *v12;
  id v13;
  int v14;
  int v15;
  unsigned int v16;
  char *v17;
  int v18;
  char *v19;
  int v20;
  unsigned __int8 v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  id v24;
  int v25;
  uint64_t v26;
  void *j;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  __long *p_uniqueIdentifier;
  NSMutableDictionary *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  float v46;
  float v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  char v53;
  NSObject *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  int8x8_t v59;
  double v60;
  double v61;
  int v62;
  double v63;
  double v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  int v69;
  int v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  NSObject *v74;
  double accumulatedExcessSeconds;
  uint64_t v76;
  char isKindOfClass;
  uint64_t v78;
  double v79;
  NSObject *v80;
  void *v81;
  BOOL v82;
  uint64_t v83;
  void *v84;
  unsigned int v85;
  float64x2_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  BOOL v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  void *v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  float64_t v102;
  float64_t v103;
  id v104;
  id obj;
  unsigned int obja;
  NINearbyUpdatesEngine *v107;
  void *v108;
  std::string v109;
  void *v110[2];
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139[5];
  _BYTE __p[28];
  unsigned int v141;
  float v142;
  float v143;
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  int v149;
  char v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[23];
  uint64_t v159;
  double v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint64_t v164;
  uint64_t v165;
  int8x8_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _OWORD v170[3];
  uint64_t v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _BYTE v190[32];
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _OWORD v198[2];
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  uint64_t v203;
  _BYTE v204[128];
  char v205[16];
  uint8_t v206[128];
  _BYTE buf[12];
  char v208;
  uint64_t v209;

  v104 = a3;
  if (objc_msgSend(v104, "count"))
  {
    v107 = self;
    v4 = objc_opt_new(NSMutableDictionary);
    regionDict = v107->_regionDict;
    v107->_regionDict = v4;

    memset(v139, 0, 24);
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    obj = v104;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v206, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v136 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)i);
          v10 = [NIRegionKey alloc];
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
          v12 = -[NIRegionKey initWithName:regionSizeCategory:](v10, "initWithName:regionSizeCategory:", v11, objc_msgSend(v9, "regionSizeCategory"));

          -[NSMutableDictionary setObject:forKey:](v107->_regionDict, "setObject:forKey:", v9, v12);
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name")));
          sub_10000BF04(v110, (char *)objc_msgSend(v13, "UTF8String"));
          objc_msgSend(v9, "radius");
          v15 = v14;
          v16 = objc_msgSend(v9, "regionSizeCategory");
          v17 = (char *)objc_msgSend(v9, "preferredUpdateRate");
          if ((unint64_t)(v17 - 1) >= 3)
            v18 = 1;
          else
            v18 = (_DWORD)v17 + 1;
          v19 = (char *)objc_msgSend(v9, "devicePresencePreset");
          if ((unint64_t)(v19 - 1) >= 6)
            v20 = 1;
          else
            v20 = (_DWORD)v19 + 1;
          v21 = objc_msgSend(v9, "requiresUserIntent");
          if (SHIBYTE(v111) < 0)
          {
            sub_100004678(__p, v110[0], (unint64_t)v110[1]);
          }
          else
          {
            *(_OWORD *)__p = *(_OWORD *)v110;
            *(_QWORD *)&__p[16] = v111;
          }
          *(_DWORD *)&__p[24] = v15;
          v141 = v16;
          v142 = *(float *)&v18;
          v143 = *(float *)&v20;
          LOBYTE(v144) = v21;
          sub_1002E7AD0(v139, (__int128 *)__p);
          if ((__p[23] & 0x80000000) != 0)
            operator delete(*(void **)__p);
          if (SHIBYTE(v111) < 0)
            operator delete(v110[0]);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v206, 16);
      }
      while (v6);
    }

    v22 = (id)qword_10085F520;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_1003E93E4((uint64_t)v205, (uint64_t)-[NSMutableDictionary count](v107->_regionDict, "count"), v22);

    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v23 = v107->_regionDict;
    v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v131, v204, 16);
    if (v24)
    {
      v25 = 0;
      v26 = *(_QWORD *)v132;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v132 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)j);
          v29 = (id)qword_10085F520;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "description"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v107->_regionDict, "objectForKey:", v28));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "description"));
            *(_DWORD *)__p = 67109634;
            *(_DWORD *)&__p[4] = v25 + (_DWORD)j;
            *(_WORD *)&__p[8] = 2112;
            *(_QWORD *)&__p[10] = v30;
            *(_WORD *)&__p[18] = 2112;
            *(_QWORD *)&__p[20] = v32;
            _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "#nrby-eng,#region-class _regionDict (%d) key %@: %@", __p, 0x1Cu);

          }
        }
        v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v131, v204, 16);
        v25 += (int)j;
      }
      while (v24);
    }

    v33 = (id)qword_10085F520;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      p_uniqueIdentifier = (__long *)&v107->_uniqueIdentifier;
      if (*((char *)&v107->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
        p_uniqueIdentifier = (__long *)p_uniqueIdentifier->__data_;
      v35 = v107->_regionDict;
      *(_DWORD *)__p = 136315394;
      *(_QWORD *)&__p[4] = p_uniqueIdentifier;
      *(_WORD *)&__p[12] = 2112;
      *(_QWORD *)&__p[14] = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions _configureForRegionMonitoring. Unique identifier: %s. Regions: %@", __p, 0x16u);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v36, "doubleForKey:", CFSTR("RegMonFilterAlphaOverride"));
    v38 = v37;
    objc_msgSend(v36, "doubleForKey:", CFSTR("RegMonHystEnterDistMOverride"));
    v40 = v39;
    objc_msgSend(v36, "doubleForKey:", CFSTR("RegMonHystExitDistMOverride"));
    v42 = v41;
    objc_msgSend(v36, "doubleForKey:", CFSTR("HandoffUserIntentScoreThresholdOverride"));
    v44 = v43;
    obja = DWORD1(xmmword_10085D6C0);
    v45 = *(float *)&xmmword_10085D6C0;
    v46 = *((float *)&xmmword_10085D6C0 + 3);
    v47 = *((float *)&xmmword_10085D6C0 + 2);
    v48 = qword_10085D6D0;
    v201 = unk_10085D6F8;
    v202 = *(_OWORD *)&dword_10085D708;
    v203 = qword_10085D718;
    v200 = *(_OWORD *)&qword_10085D6E8;
    v199 = *(_OWORD *)algn_10085D6D8;
    if (v38 > 0.0 && v38 < 1.0)
    {
      v49 = (id)qword_10085F520;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v38;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override regMonFilterAlphaOverride = %f", __p, 0xCu);
      }

      v45 = v38;
    }
    if (v40 > 0.0)
    {
      v50 = (id)qword_10085F520;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v40;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override regMonHystEnterDistMOverride = %f", __p, 0xCu);
      }

      v46 = v40;
    }
    if (v42 > 0.0)
    {
      v51 = (id)qword_10085F520;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v42;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override regMonHystExitDistMOverride = %f", __p, 0xCu);
      }

      v47 = v42;
    }
    if (v44 > 0.0)
    {
      v52 = (id)qword_10085F520;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v44;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override handoffUserIntentScoreThresholdOverride = %f", __p, 0xCu);
      }

      v48 = *(_QWORD *)&v44;
    }
    v53 = byte_10085D720;
    v197 = unk_10085D781;
    v198[0] = *(__int128 *)((char *)&xmmword_10085D790 + 1);
    *(_QWORD *)((char *)v198 + 15) = qword_10085D7A0;
    v193 = unk_10085D741;
    v194 = *(__int128 *)((char *)&xmmword_10085D750 + 1);
    v196 = *(__int128 *)((char *)&xmmword_10085D770 + 1);
    v195 = *(_OWORD *)((char *)&qword_10085D760 + 1);
    v192 = *(__int128 *)((char *)&xmmword_10085D730 + 1);
    v191 = *(_OWORD *)algn_10085D721;
    if (objc_msgSend(v36, "BOOLForKey:", CFSTR("RegMonDisableRVKalmanFilter")))
    {
      v54 = (id)qword_10085F520;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override disabled rv kalman filters", __p, 2u);
      }

      v53 = 1;
    }
    sub_1002F0CAC(&v130, (uint64_t)&unk_10085D6A8);
    v55 = qword_10085D7A8;
    v56 = *(double *)&xmmword_10085D7B0;
    v127 = *(__int128 *)((char *)&xmmword_10085D7B0 + 8);
    v128 = unk_10085D7C8;
    v129 = *(__int128 *)((char *)&xmmword_10085D7D0 + 8);
    v58 = *((_QWORD *)&xmmword_10085D7E8 + 1);
    v57 = xmmword_10085D7E8;
    v59 = (int8x8_t)qword_10085D7F8;
    *(_OWORD *)&v190[16] = *(_OWORD *)&qword_10085D840;
    *(_OWORD *)v190 = *(__int128 *)((char *)&xmmword_10085D828 + 8);
    v189 = unk_10085D820;
    v188 = *(_OWORD *)&qword_10085D810;
    v187 = xmmword_10085D800;
    objc_msgSend(v36, "doubleForKey:", CFSTR("RegMonKalmanFilterHystUpperOverride"));
    v103 = v60;
    objc_msgSend(v36, "doubleForKey:", CFSTR("RegMonKalmanFilterHystLowerOverride"));
    v102 = v61;
    v62 = objc_msgSend(v36, "integerForKey:", CFSTR("RegMonKalmanFilterNStartupMeasurementsOverride"));
    objc_msgSend(v36, "doubleForKey:", CFSTR("RegMonKalmanFilterProcessStdOverride"));
    v64 = v63;
    v65 = objc_msgSend(v36, "integerForKey:", CFSTR("RegMonKalmanFilterTimeoutSeconds"));
    if (v62 > 0)
    {
      v66 = (id)qword_10085F520;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = v62;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override RegMonKalmanFilterNStartupMeasurementsOverride = %i", __p, 8u);
      }

      v57 = v62;
    }
    if (v64 > 0.0)
    {
      v67 = (id)qword_10085F520;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v64;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override RegMonKalmanFilterProcessStdOverride = %f", __p, 0xCu);
      }

      v56 = v64;
    }
    if (v65 >= 1)
    {
      v68 = (id)qword_10085F520;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = v65;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override RegMonKalmanFilterTimeoutSeconds = %i", __p, 8u);
      }

      v58 = v65;
    }
    v69 = objc_msgSend(v36, "integerForKey:", CFSTR("RegMonThresholdDetectorBufferSize"));
    *(_OWORD *)v110 = xmmword_10085D850;
    sub_100232898(&v111, (uint64_t)&unk_10085D860);
    v126 = xmmword_10085D958;
    v123 = unk_10085D928;
    v124 = xmmword_10085D938;
    v125 = xmmword_10085D948;
    v119 = unk_10085D8E8;
    v120 = xmmword_10085D8F8;
    v121 = *(_OWORD *)&qword_10085D908;
    v122 = xmmword_10085D918;
    v115 = xmmword_10085D8A8;
    v116 = xmmword_10085D8B8;
    v117 = xmmword_10085D8C8;
    v118 = xmmword_10085D8D8;
    v112 = xmmword_10085D878;
    v113 = *(_OWORD *)&qword_10085D888;
    v114 = xmmword_10085D898;
    if (v69 >= 1)
      LODWORD(v110[0]) = v69;
    v70 = objc_msgSend(v36, "integerForKey:", CFSTR("RegMonBoundedRegionRangeEstimatorType"));
    if (v70 < 1)
    {
LABEL_86:
      accumulatedExcessSeconds = v107->_findingLatencyBookkeeping.accumulatedExcessSeconds;
      v76 = objc_opt_class(NIDevicePresenceConfiguration, v71);
      isKindOfClass = objc_opt_isKindOfClass(*(_QWORD *)&accumulatedExcessSeconds, v76);
      v79 = v107->_findingLatencyBookkeeping.accumulatedExcessSeconds;
      if ((isKindOfClass & 1) != 0)
      {
        v80 = *(id *)&v79;
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject token](v80, "token"));
        v82 = v81 == 0;

        if (!v82)
        {
          BYTE12(v113) = 1;
          BYTE8(v114) = 0;
        }
      }
      else
      {
        v83 = objc_opt_class(NIHomeDeviceConfiguration, v78);
        if ((objc_opt_isKindOfClass(*(_QWORD *)&v79, v83) & 1) == 0)
          goto LABEL_94;
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v85 = objc_msgSend(v84, "BOOLForKey:", CFSTR("HomeDeviceSessionBTLeechingEnabled"));

        if (!v85)
          goto LABEL_94;
        BYTE12(v113) = 1;
        BYTE8(v114) = 0;
        *((_QWORD *)&v118 + 1) = 1;
        v80 = (id)qword_10085F520;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__p = 0;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions #config-override Enable BT-based region monitoring in Home session with HomeDeviceSessionBTLeechingEnabled.", __p, 2u);
        }
      }

LABEL_94:
      sub_1002F0CAC((uint64_t *)__p, (uint64_t)&v130);
      v86.f64[0] = v103;
      v86.f64[1] = v102;
      *(float *)&__p[24] = v45;
      v141 = obja;
      v142 = v47;
      v143 = v46;
      v144 = v48;
      v147 = v201;
      v148 = v202;
      v149 = v203;
      v145 = v199;
      v146 = v200;
      v150 = v53;
      v151 = v191;
      v155 = v195;
      v154 = v194;
      v153 = v193;
      v152 = v192;
      *(_QWORD *)&v158[15] = *(_QWORD *)((char *)v198 + 15);
      *(_OWORD *)v158 = v198[0];
      v157 = v197;
      v156 = v196;
      v159 = v55;
      v160 = v56;
      v161 = v127;
      v162 = v128;
      v163 = v129;
      v164 = v57;
      v165 = v58;
      v166 = vbsl_s8((int8x8_t)vmovn_s64(vcgtzq_f64(v86)), (int8x8_t)vcvt_f32_f64(v86), v59);
      v168 = v188;
      v169 = v189;
      v170[0] = *(_OWORD *)v190;
      *(_OWORD *)((char *)v170 + 12) = *(_OWORD *)&v190[12];
      v167 = v187;
      v170[2] = *(_OWORD *)v110;
      sub_100232898(&v171, (uint64_t)&v111);
      v184 = v124;
      v185 = v125;
      v186 = v126;
      v180 = v120;
      v181 = v121;
      v183 = v123;
      v182 = v122;
      v176 = v116;
      v177 = v117;
      v179 = v119;
      v178 = v118;
      v172 = v112;
      v173 = v113;
      v175 = v115;
      v174 = v114;
      HIDWORD(v107->_convStateForObject) = -[NINearbyUpdatesEngine _setReadValidateDefaultsWriteForTypeOfPredictor](v107, "_setReadValidateDefaultsWriteForTypeOfPredictor");
      sub_1002913EC(&v109);
      switch(HIDWORD(v107->_convStateForObject))
      {
        case 0:
          v94 = (id)qword_10085F520;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = 0x3FE8000000000000;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Using default user intent threshold value for AoA predictor: %f", buf, 0xCu);
          }
          goto LABEL_112;
        case 1:
        case 3:
          sub_1002913F0((__int128 *)&v109, (uint64_t)buf);
          if ((_BYTE)v209)
          {
            if (v208 < 0)
              operator delete(*(void **)buf);
            v87 = (id)qword_10085F520;
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Successfully obtained trained model weights filepath", buf, 2u);
            }

            v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", CFSTR("SpatialGesturesIntentPredictorThresholdSingleAntenna")));
            v90 = v89 == 0;

            if (!v90)
            {
              objc_msgSend(v88, "doubleForKey:", CFSTR("SpatialGesturesIntentPredictorThresholdSingleAntenna"));
              v92 = v91;
              v93 = (id)qword_10085F520;
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v92;
                _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Setting user intent threshold value for spatial gestures single antenna predictor: %f", buf, 0xCu);
              }

            }
            v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", CFSTR("SpatialGesturesIntentPredictorThresholdDualAntenna")));
            v97 = v96 == 0;

            if (!v97)
            {
              objc_msgSend(v88, "doubleForKey:", CFSTR("SpatialGesturesIntentPredictorThresholdDualAntenna"));
              v99 = v98;
              v100 = (id)qword_10085F520;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v99;
                _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Setting user intent threshold value for spatial gestures dual antenna predictor: %f", buf, 0xCu);
              }

            }
          }
          else
          {
            v95 = (id)qword_10085F520;
            if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              sub_1003E93B8();

            HIDWORD(v107->_convStateForObject) = 2;
          }
          goto LABEL_121;
        case 2:
          v94 = (id)qword_10085F520;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = 0xBFB999999999999ALL;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor Using default user intent threshold value for (no AoA + no spatial gestures) predictor: %f", buf, 0xCu);
          }
          goto LABEL_112;
        default:
          v94 = (id)qword_10085F520;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
            sub_1003E938C();
LABEL_112:

LABEL_121:
          sub_1002913F0((__int128 *)&v109, (uint64_t)&v108);
          operator new();
      }
    }
    if (v70 == 1)
    {
      LODWORD(v114) = 1;
      v72 = (id)qword_10085F520;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        v73 = "#nrby-eng,#regions #config-override RegMonBoundedRegionRangeEstimatorType = KALMAN_FILTER";
        goto LABEL_84;
      }
    }
    else if (v70 == 2)
    {
      LODWORD(v114) = 2;
      v72 = (id)qword_10085F520;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        v73 = "#nrby-eng,#regions #config-override RegMonBoundedRegionRangeEstimatorType = MAX_OF_MEAN_OF_CHAN_FILTER";
LABEL_84:
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, v73, __p, 2u);
      }
    }
    else
    {
      v72 = (id)qword_10085F520;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        v73 = "#nrby-eng,#regions #config-override Invalid value specified for RegMonBoundedRegionRangeEstimatorType, NOT overriding";
        goto LABEL_84;
      }
    }

    goto LABEL_86;
  }
  v74 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__p = 0;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions No regions to be monitored.", __p, 2u);
  }

  return 0;
}

- (int)_setReadValidateDefaultsWriteForTypeOfPredictor
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = atomic_load((unsigned __int8 *)&qword_10085DA90);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_10085DA90))
  {
    dword_10085DA88 = *((_DWORD *)sub_100004784() + 144);
    __cxa_guard_release(&qword_10085DA90);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("HandoffIntentPredictorType")));

  if (!v4)
  {
    if (dword_10085DA88 > 99)
    {
      if (dword_10085DA88 > 199)
      {
        if ((dword_10085DA88 - 200) >= 2 && dword_10085DA88 != 997 && dword_10085DA88 != 999)
          goto LABEL_3;
      }
      else if ((dword_10085DA88 - 100) >= 0x16)
      {
        goto LABEL_3;
      }
      v8 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v7 = 2;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#intentPredictorDefaultsWrite Intent predictor not enabled for this device type", v18, 2u);
      }
      else
      {
        v7 = 2;
      }
      goto LABEL_29;
    }
    if (dword_10085DA88 < 0x18)
    {
      v16 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#intentPredictorDefaultsWrite Intent predictor type for this device: Spatial Gestures", buf, 2u);
      }
      v7 = 3;
      goto LABEL_29;
    }
  }
LABEL_3:
  v5 = objc_msgSend(v2, "integerForKey:", CFSTR("HandoffIntentPredictorType"));
  v6 = (uint64_t)v5;
  v7 = 2;
  if (dword_10085DA88 <= 199)
  {
    if ((dword_10085DA88 - 100) < 0x16)
      goto LABEL_29;
    if ((dword_10085DA88 - 11) >= 0xD)
    {
      if (dword_10085DA88 >= 0xB || v5 < 4)
        goto LABEL_25;
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
LABEL_27:
        sub_1003E9420(v6, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      if (((_DWORD)v5 - 1) < 3)
      {
LABEL_25:
        v7 = (int)v5;
        goto LABEL_29;
      }
      v9 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
    }
    v7 = 1;
    goto LABEL_29;
  }
  if ((dword_10085DA88 - 200) >= 2 && dword_10085DA88 != 997 && dword_10085DA88 != 999)
    goto LABEL_25;
LABEL_29:

  return v7;
}

- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfigForPeerSessions
{
  NSObject *v4;
  PeopleFinderAlgorithmConfig *result;
  double var10;
  double var11;
  double var12;
  double var13;
  double var8;
  double var9;
  int v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;

  -[NINearbyUpdatesEngine _getPeopleFinderAlgorithmConfig](self, "_getPeopleFinderAlgorithmConfig");
  *(int64x2_t *)&retstr->var8 = vdupq_n_s64(0x7FF0000000000000uLL);
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  retstr->var18 = INFINITY;
  retstr->var19 = 1;
  v4 = qword_10085F520;
  result = (PeopleFinderAlgorithmConfig *)os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    var10 = retstr->var10;
    var11 = retstr->var11;
    var12 = retstr->var12;
    var13 = retstr->var13;
    var8 = retstr->var8;
    var9 = retstr->var9;
    v12 = 134219264;
    v13 = var8;
    v14 = 2048;
    v15 = var10;
    v16 = 2048;
    v17 = var11;
    v18 = 2048;
    v19 = var12;
    v20 = 2048;
    v21 = var13;
    v22 = 2048;
    v23 = var9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nrby-eng,People-finder yield for peer session config set to maxUWBRange, %f, minUWBRangeRate, %f, rangeRateWindow, %f, groupFindingMinUWBRangeRate, %f, groupFindingRangeRateWindow, %f,  maxUWBRangeInFavorableGnssConditions, %f", (uint8_t *)&v12, 0x3Eu);
  }
  return result;
}

- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfig
{
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned __int8 v20;
  double v21;
  double v22;
  unsigned int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  NSObject *v45;
  NSObject *v46;
  double var10;
  double var11;
  double var12;
  double var13;
  _BOOL4 var15;
  double var8;
  double var9;
  uint8x8_t v54;
  NSObject *v55;
  _BOOL4 var1;
  _BOOL4 var2;
  _BOOL4 var4;
  _BOOL4 var3;
  _BOOL4 var0;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  PeopleFinderAlgorithmConfig *result;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  int64_t v87;
  unsigned int v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  unsigned int v93;
  unsigned int v94;
  uint8_t buf[4];
  _BYTE v96[10];
  double v97;
  _BYTE v98[10];
  __int16 v99;
  double v100;
  __int16 v101;
  double v102;
  __int16 v103;
  _BOOL4 v104;
  __int16 v105;
  double v106;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v92 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisableCL"));
  v91 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisablePF"));
  v90 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisableSA"));
  v89 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisableSAWithFindeeVIO"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisableSARangeOnly"));
  v6 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsEnableStraightPathFilter"));
  v7 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DisableUseOfRangesWithStatus7"));
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsYieldMaxRange"));
  v9 = v8;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsYieldMaxRangeInFavorableGnssConditions"));
  v11 = v10;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsYieldMinUWBRangeRate"));
  v13 = v12;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsYieldRangeRateWindow"));
  v15 = v14;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsYieldGroupFindingMinUWBRangeRate"));
  v17 = v16;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsYieldGroupFindingRangeRateWindow"));
  v19 = v18;
  v20 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisableRelaxedYieldCriteria"));
  v94 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisableStrictSABoxSpanRequirement"));
  v93 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsDisableFinderIO"));
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderMinSvTrackedToAvailableRatioForFavorableGnssConditions"));
  v86 = v21;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderMinGnssSatelliteElevationDeg"));
  v84 = v22;
  v88 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterSeedWithCL"));
  v23 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterDisableSeedWithSA"));
  v87 = (int64_t)objc_msgSend(v4, "integerForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterNumParticles"));
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterPDRFrameRotationNoiseRads"));
  v85 = v24;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterPDRScaleNoiseMuLognormal"));
  v83 = v25;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterPDRScaleNoiseSigmaLognormal"));
  v82 = v26;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterMultipathProcessVarianceScaling"));
  v81 = v27;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterMultipathMeasurementStd"));
  v80 = v28;
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterTrailingMeasurementStdThreshold"));
  v79 = v29;
  v30 = (uint64_t)objc_msgSend(v4, "integerForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterNLOSTimeoutSec"));
  v31 = (uint64_t)objc_msgSend(v4, "integerForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterNoMeasurementTimeoutSec"));
  v32 = (uint64_t)objc_msgSend(v4, "integerForKey:", CFSTR("PeopleFinderAlgorithmsParticleFilterConservativeNLOSTimeoutSec"));
  objc_msgSend(v4, "doubleForKey:", CFSTR("PeopleFindingFindButtonTimeoutSecondsOverride"));
  v34 = v33;
  *(_OWORD *)&retstr->var7 = xmmword_100477A30;
  *(_OWORD *)&retstr->var9 = xmmword_100477A40;
  __asm { FMOV            V0.2D, #2.0 }
  *(_OWORD *)&retstr->var11 = _Q0;
  retstr->var13 = 2.0;
  *(_WORD *)&retstr->var14.var0 = 0;
  retstr->var14.var2 = 0.05;
  retstr->var14.var3 = 20000;
  *(_OWORD *)&retstr->var14.var4 = xmmword_100477A50;
  *(_OWORD *)&retstr->var14.var6 = xmmword_100477A60;
  *(_OWORD *)&retstr->var14.var8 = xmmword_100477A70;
  *(_OWORD *)&retstr->var14.var10 = xmmword_100477A80;
  retstr->var16 = (GnssReliabilityIndicatorConfig)xmmword_100477A90;
  retstr->var18 = 10.0;
  retstr->var19 = 0;
  retstr->var0 = v92 ^ 1;
  retstr->var1 = v91 ^ 1;
  retstr->var2 = v90 ^ 1;
  retstr->var4 = v89 ^ 1;
  retstr->var3 = v5 ^ 1;
  retstr->var5 = v6;
  retstr->var6 = v7 ^ 1;
  retstr->var15 = v20 ^ 1;
  retstr->var17 = v94 ^ 1;
  retstr->var20 = v93 ^ 1;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("PeopleFinderLowPassFilterTimeConstant")));

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v42, "doubleForKey:", CFSTR("PeopleFinderLowPassFilterTimeConstant"));
    v44 = v43;

    retstr->var7 = v44;
    v45 = (id)qword_10085F520;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v44;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Setting PeopleFinderAlgorithms low pass filter time constant to %3.2f", buf, 0xCu);
    }

  }
  if (v9 > 0.0)
    retstr->var8 = v9;
  if (v11 > 0.0)
    retstr->var9 = v11;
  if (v13 > 0.0 && v15 > 0.0)
  {
    retstr->var10 = v13;
    retstr->var11 = v15;
  }
  if (v17 > 0.0 && v19 > 0.0)
  {
    retstr->var12 = v17;
    retstr->var13 = v19;
  }
  if (v34 > 0.0)
    retstr->var18 = v34;
  v46 = (id)qword_10085F520;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    var10 = retstr->var10;
    var11 = retstr->var11;
    var12 = retstr->var12;
    var13 = retstr->var13;
    var15 = retstr->var15;
    var8 = retstr->var8;
    var9 = retstr->var9;
    *(_DWORD *)buf = 134219520;
    *(double *)v96 = var8;
    *(_WORD *)&v96[8] = 2048;
    v97 = var10;
    *(_WORD *)v98 = 2048;
    *(double *)&v98[2] = var11;
    v99 = 2048;
    v100 = var12;
    v101 = 2048;
    v102 = var13;
    v103 = 1024;
    v104 = var15;
    v105 = 2048;
    v106 = var9;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#nrby-eng,People-finder yield config set to maxUWBRange, %f, minUWBRangeRate, %f, rangeRateWindow, %f, groupFindingMinUWBRangeRate, %f, groupFindingRangeRateWindow, %f, enableRelaxedYieldCriteriaInFavorableGnssConditions, %d, maxUWBRangeInFavorableGnssConditions, %f", buf, 0x44u);
  }

  v54.i32[0] = *(_DWORD *)&retstr->var1;
  if ((vmaxv_u16((uint16x4_t)vceqz_s16((int16x4_t)(vmovl_u8(v54).u64[0] & 0xFF00FF00FF00FFLL))) & 1) != 0
    || !retstr->var0)
  {
    v55 = (id)qword_10085F520;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      var1 = retstr->var1;
      var2 = retstr->var2;
      var4 = retstr->var4;
      var3 = retstr->var3;
      var0 = retstr->var0;
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v96 = var1;
      *(_WORD *)&v96[4] = 1024;
      *(_DWORD *)&v96[6] = var2;
      LOWORD(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 2) = var4;
      HIWORD(v97) = 1024;
      *(_DWORD *)v98 = var3;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = var0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#nrby-eng,WARNING: One or more estimators disabled via default,pf,%d,sa,%d,savio,%d,saro,%d,cl,%d", buf, 0x20u);
    }

  }
  if (retstr->var5)
  {
    v61 = (id)qword_10085F520;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Straight path estimator enabled via default", buf, 2u);
    }

  }
  if (v94)
  {
    v62 = (id)qword_10085F520;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Strict SA box span requirement disabled via default", buf, 2u);
    }

  }
  if (v93)
  {
    v63 = (id)qword_10085F520;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Finder IO usage enabled via default", buf, 2u);
    }

  }
  if (v87 >= 1)
  {
    retstr->var14.var3 = v87;
    v64 = (id)qword_10085F520;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v96 = v87;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, number of particles in PF: %ld", buf, 0xCu);
    }

  }
  if (v88)
  {
    retstr->var14.var0 = v88;
    v65 = (id)qword_10085F520;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#nrby-eng,People-finder enabling seeding PF solution with CL arrow", buf, 2u);
    }

  }
  if (v23)
  {
    retstr->var14.var1 = v23;
    v66 = (id)qword_10085F520;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Disabling the ability to seed PF with SA solution when findee motion detected", buf, 2u);
    }

  }
  if (v85 > 0.0)
  {
    retstr->var14.var2 = v85;
    v67 = (id)qword_10085F520;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v85;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, pdrFrameRotationNoise: %f rads", buf, 0xCu);
    }

  }
  if (v83 > 0.0)
  {
    retstr->var14.var10 = v83;
    v68 = (id)qword_10085F520;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v83;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, pdrScaleMu: %f", buf, 0xCu);
    }

  }
  if (v82 > 0.0)
  {
    retstr->var14.var11 = v82;
    v69 = (id)qword_10085F520;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v82;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, pdrScalSigma: %f", buf, 0xCu);
    }

  }
  if (v81 > 0.0)
  {
    retstr->var14.var4 = v81;
    v70 = (id)qword_10085F520;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v81;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, processVarInnovationScale: %f", buf, 0xCu);
    }

  }
  if (v80 > 0.0)
  {
    retstr->var14.var5 = v80;
    v71 = (id)qword_10085F520;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v80;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, measurementStdForInnovationCheck: %f", buf, 0xCu);
    }

  }
  if (v79 > 0.0)
  {
    retstr->var14.var6 = v79;
    v72 = (id)qword_10085F520;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v79;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, trailingStdThreshold: %f", buf, 0xCu);
    }

  }
  if (v30 >= 1)
  {
    retstr->var14.var7 = (double)v30;
    v73 = (id)qword_10085F520;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = (double)v30;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, nlosTimeThreshSec: %f", buf, 0xCu);
    }

  }
  if (v31 >= 1)
  {
    retstr->var14.var9 = (double)v31;
    v74 = (id)qword_10085F520;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = (double)v31;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, timeoutAfterNoMeasurementsSec: %f", buf, 0xCu);
    }

  }
  if (v32 >= 1)
  {
    retstr->var14.var8 = (double)v32;
    v75 = (id)qword_10085F520;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = (double)v32;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding PF parameter, conservativeNlosTimeThreshSec: %f", buf, 0xCu);
    }

  }
  if (v86 > 0.0)
  {
    retstr->var16.var0 = v86;
    v76 = (id)qword_10085F520;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v86;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minSvTrackedToAvailableRatioForFavorableGnssConditions: %.2lf", buf, 0xCu);
    }

  }
  if (v84 > 0.0 && v84 <= 90.0)
  {
    retstr->var16.var1 = v84;
    v77 = (id)qword_10085F520;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v96 = v84;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minGnssSatelliteElevationDeg: %f", buf, 0xCu);
    }

  }
  return result;
}

- (FindeeAlgorithmConfig)_getFindeeAlgorithmConfig
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  double v11;
  double v12;
  int v13;
  double v14;
  FindeeAlgorithmConfig result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("FindeeMinSvTrackedToAvailableRatioForFavorableGnssConditions"));
  v4 = v3;
  objc_msgSend(v2, "doubleForKey:", CFSTR("FindeeMinGnssSatelliteElevationDeg"));
  v6 = v5;
  v7 = 0.5;
  if (v4 > 0.0)
  {
    v8 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minSvTrackedToAvailableRatioForFavorableGnssConditions: %.2lf", (uint8_t *)&v13, 0xCu);
    }
    v7 = v4;
  }
  v9 = 15.0;
  if (v6 > 0.0 && v6 <= 90.0)
  {
    v10 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Overriding GRI parameter, minGnssSatelliteElevationDeg: %f", (uint8_t *)&v13, 0xCu);
    }
    v9 = v6;
  }

  v11 = v7;
  v12 = v9;
  result.var0.var1 = v12;
  result.var0.var0 = v11;
  return result;
}

- (void)_sendTimeTupleToAlgorithms
{
  int64_t var0;
  _QWORD v4[3];
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  if (sub_10002D1A4(&v7, &v6, &v5))
  {
    var0 = self->_uniqueIdentifier.var0;
    if (var0)
    {
      *(double *)v4 = v5;
      *(double *)&v4[1] = v6;
      *(double *)&v4[2] = v7;
      if (self->_protobufLogger.__ptr_)
      {
        sub_10027B360((uint64_t)self->_protobufLogger.__ptr_, (const std::string *)&self->_uniqueIdentifier, v5, v6, v7);
        var0 = self->_uniqueIdentifier.var0;
      }
      (*(void (**)(int64_t, _QWORD *))(*(_QWORD *)var0 + 16))(var0, v4);
    }
  }
}

- (void)_createSyntheticApertureAlgoContainer
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_syntheticApertureFilter", v3, 2u);
  }
  operator new();
}

- (void)_createPeerFindingAlgoContainer
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[208];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = PeerFindingAlgorithms", buf, 2u);
  }
  -[NINearbyUpdatesEngine _getPeopleFinderAlgorithmConfigForPeerSessions](self, "_getPeopleFinderAlgorithmConfigForPeerSessions");
  -[NINearbyUpdatesEngine _getFindeeAlgorithmConfig](self, "_getFindeeAlgorithmConfig");
  v6 = v4;
  v7 = v5;
  operator new();
}

- (void)_createPeopleFinderAlgoContainer
{
  NSObject *v3;
  uint8_t v4[208];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = PeopleFinderAlgorithms", v4, 2u);
  }
  -[NINearbyUpdatesEngine _getPeopleFinderAlgorithmConfig](self, "_getPeopleFinderAlgorithmConfig");
  operator new();
}

- (void)_createDeviceFinderAlgoContainer
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = DeviceFinderAlgorithms", v3, 2u);
  }
  operator new();
}

- (void)_createFindeeAlgoContainer
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_findingAlgorithmContainer = FindeeAlgorithms", (uint8_t *)v6, 2u);
  }
  -[NINearbyUpdatesEngine _getFindeeAlgorithmConfig](self, "_getFindeeAlgorithmConfig");
  v6[0] = v4;
  v6[1] = v5;
  operator new();
}

- (void)provideFindingSolution:(id)a3
{
  id v5;
  Logger *ptr;
  void *v7;
  Logger *v8;
  double v9;
  double v10;
  NINearbyUpdatesEngineDataSource *dataSource;
  float v12;
  std::string *p_p;
  std::string::size_type size;
  std::string *v15;
  std::string::size_type v16;
  char *v17;
  std::string *v18;
  __int128 v19;
  char *v20;
  void **v21;
  std::string::size_type v22;
  std::string *v23;
  __int128 v24;
  void **v25;
  std::string::size_type v26;
  std::string *v27;
  void *v28;
  id WeakRetained;
  void *v30;
  void *v31;
  void *v32;
  NINearbyObject *v33;
  NSObject *v34;
  void *v35[2];
  unsigned __int8 v36;
  std::string v37;
  void *v38[2];
  int64_t v39;
  std::string v40;
  std::string v41;
  void *v42;
  std::string __p;
  void *v44;
  float32x2_t v45[45];
  uint64_t v46;

  v5 = a3;
  if (self->_uniqueIdentifier.var0)
  {
    sub_1001D0140(0x2B73047Cu, 1, 0, 0, 0, 0);
    (**(void (***)(float32x2_t *__return_ptr))self->_uniqueIdentifier.var0)(v45);
    sub_1001D0140(0x2B73047Cu, 2, 0, 0, 0, 0);
    ptr = self->_protobufLogger.__ptr_;
    if (ptr)
      sub_10027A8BC((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v45);
    -[NINearbyUpdatesEngine logSolution:](self, "logSolution:", v45);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromSolution:](self, "nearbyObjectFromSolution:", v45));
    if (v7
      || self->_findingPeerToken
      && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromSolution:forPeer:](self, "nearbyObjectFromSolution:forPeer:", v45))) != 0)
    {
      v8 = self->_protobufLogger.__ptr_;
      if (v8)
      {
        objc_msgSend(v7, "timestamp");
        v10 = v9;
        sub_100268FEC(v7, (uint64_t)&__p);
        memset(&v41, 0, sizeof(v41));
        v40.__r_.__value_.__s.__data_[8] = 0;
        v41.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0xA0uLL);
        v41.__r_.__value_.__l.__size_ = v41.__r_.__value_.__r.__words[0];
        v41.__r_.__value_.__r.__words[2] = v41.__r_.__value_.__r.__words[0] + 160;
        v41.__r_.__value_.__l.__size_ = sub_1002F1C0C((uint64_t)&v41.__r_.__value_.__r.__words[2], (uint64_t)&__p, (uint64_t)v45, (uint64_t)v41.__r_.__value_.__l.__data_);
        sub_100273D94((uint64_t)v8, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v41, v10);
        v40.__r_.__value_.__r.__words[0] = (std::string::size_type)&v41;
        sub_1002F1D80((void ***)&v40);
        if (__p.__r_.__value_.__r.__words[0])
        {
          __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      dataSource = self->_dataSource;
      if (dataSource)
        -[NINearbyUpdatesEngineDataSource updateWithSolution:](dataSource, "updateWithSolution:", v45);
      if (v5)
      {
        objc_msgSend(v7, "setNbRxStatus:", objc_msgSend(v5, "nbRxStatus"));
        objc_msgSend(v7, "setMmsRxStatus:", objc_msgSend(v5, "mmsRxStatus"));
        objc_msgSend(v5, "nbRssi");
        objc_msgSend(v7, "setNbRssi:");
        objc_msgSend(v5, "signalStrength");
        objc_msgSend(v7, "setSignalStrength:");
      }
      sub_10000BF04(&v41, "");
      sub_10000BF04(&v40, "RawDist = ");
      if (v5)
      {
        objc_storeStrong((id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds, a3);
        objc_msgSend(v5, "distance");
      }
      else
      {
        objc_msgSend(*(id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds, "distance");
      }
      sub_1002E9BC0(2, v12 * 3.28);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      std::string::append(&v40, (const std::string::value_type *)p_p, size);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v40;
      else
        v15 = (std::string *)v40.__r_.__value_.__r.__words[0];
      if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
      else
        v16 = v40.__r_.__value_.__l.__size_;
      std::string::append(&v41, (const std::string::value_type *)v15, v16);
      std::string::append(&v41, " ");
      std::string::append(&v41, ", ");
      if ((v46 & 0xFF00000000) != 0)
        v17 = (&off_100815090)[(int)v46];
      else
        v17 = "Unavailable";
      sub_10000BF04(&v37, v17);
      v18 = std::string::append(&v37, " : ");
      v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
      v18->__r_.__value_.__l.__size_ = 0;
      v18->__r_.__value_.__r.__words[2] = 0;
      v18->__r_.__value_.__r.__words[0] = 0;
      if (v45[0].i32[0])
      {
        v20 = "Converged   ";
      }
      else if ((*(_QWORD *)v45 & 0x100000000) != 0)
      {
        v20 = "LowDisp     ";
      }
      else if ((*(_QWORD *)v45 & 0x100000000000000) != 0)
      {
        v20 = "LowLighting ";
      }
      else if ((*(_QWORD *)v45 & 0x10000000000) != 0)
      {
        v20 = "LowHorzDisp ";
      }
      else if ((*(_QWORD *)v45 & 0x1000000000000) != 0)
      {
        v20 = "LowVertDisp ";
      }
      else
      {
        v20 = "NotConverged";
      }
      sub_10000BF04(v35, v20);
      if ((v36 & 0x80u) == 0)
        v21 = v35;
      else
        v21 = (void **)v35[0];
      if ((v36 & 0x80u) == 0)
        v22 = v36;
      else
        v22 = (std::string::size_type)v35[1];
      v23 = std::string::append(&__p, (const std::string::value_type *)v21, v22);
      v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      v39 = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)v38 = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      if ((char)v36 < 0)
        operator delete(v35[0]);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v37.__r_.__value_.__l.__data_);
      if (v39 >= 0)
        v25 = v38;
      else
        v25 = (void **)v38[0];
      if (v39 >= 0)
        v26 = HIBYTE(v39);
      else
        v26 = (std::string::size_type)v38[1];
      std::string::append(&v41, (const std::string::value_type *)v25, v26);
      if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v27 = &v41;
      else
        v27 = (std::string *)v41.__r_.__value_.__r.__words[0];
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v27));
      objc_msgSend(v7, "setDebugDisplayInfo:", v28);

      WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
      if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
      {
        v42 = v7;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
        objc_msgSend(WeakRetained, "updatesEngine:didUpdateNearbyObjects:", self, v30);

      }
      if (self->_findingPeerToken)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine niConvergenceStateFromSolution:](self, "niConvergenceStateFromSolution:", v45));
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SyntheticApertureFilter objectForKeyedSubscript:](self->_syntheticApertureFilter.__ptr_.__value_, "objectForKeyedSubscript:", self->_findingPeerToken));
        if ((objc_msgSend(v32, "isEqual:", v31) & 1) == 0)
        {
          -[SyntheticApertureFilter setObject:forKeyedSubscript:](self->_syntheticApertureFilter.__ptr_.__value_, "setObject:forKeyedSubscript:", v31, self->_findingPeerToken);
          v33 = -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_findingPeerToken);
          if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:") & 1) != 0)
            objc_msgSend(WeakRetained, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:", self, v31, v33);
          v34 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(__p.__r_.__value_.__l.__data_) = 138412802;
            *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v33;
            WORD2(__p.__r_.__value_.__r.__words[1]) = 2112;
            *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v31;
            HIWORD(__p.__r_.__value_.__r.__words[2]) = 2112;
            v44 = v32;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#finding, Updated convergence state for object: %@. New state: %@. Previous state: %@", (uint8_t *)&__p, 0x20u);
          }

        }
      }

      if (SHIBYTE(v39) < 0)
        operator delete(v38[0]);
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v40.__r_.__value_.__l.__data_);
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v41.__r_.__value_.__l.__data_);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    sub_1003E9484();
  }

}

- (void)acceptRoseSolution:(const void *)a3
{
  __int128 v3;
  uint64_t v4;

  v3 = xmmword_100477558;
  v4 = 1;
  -[NINearbyUpdatesEngine acceptRoseSolution:withProcessingOptions:](self, "acceptRoseSolution:withProcessingOptions:", a3, &v3);
}

- (void)acceptRoseSolution:(const void *)a3 withProcessingOptions:(const AlgorithmProcessingOptions *)a4
{
  unsigned int v5;
  int v6;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  NSObject *v13;
  const char *v14;
  unsigned int v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  double accumulatedExcessSeconds;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  id v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  __int16 v33;
  __int16 v34;
  Logger *v35;
  NINearbyUpdatesEngineDataSource *dataSource;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  NSObject *v43;
  double lastMeasurementTimeSeconds;
  void *v45;
  unint64_t i;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  _QWORD *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  unsigned int v63;
  NSObject *v64;
  float v65;
  float v66;
  float v67;
  float v68;
  double v69;
  _BOOL4 v70;
  BiasEstimatorOutputs *v71;
  float v72;
  float v73;
  float v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t j;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  _QWORD *v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  unsigned int v106;
  Logger *ptr;
  float v108;
  float v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  UWBSignalFeatures *v114;
  void *v115;
  _BOOL4 v116;
  void *v117;
  id v118;
  void *__p;
  char *v120;
  char *v121;
  id v122;
  uint8_t v123[24];
  int v124;
  __int16 v125;
  int v126;
  __int128 buf;
  _QWORD v128[4];
  char v129;
  char v130;
  char v131;
  char v132;
  uint64_t v133;
  uint64_t v134;
  __int16 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  char v139;
  char v140;
  uint64_t v141;
  uint64_t v142;
  int v143;
  __int16 v144;
  __int16 v145;

  if (*((_BYTE *)a3 + 24))
  {
    v5 = *((_DWORD *)a3 + 8);
    if (v5 > 5)
      return;
    v6 = 1 << v5;
    if ((v6 & 0x31) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E9540();
      return;
    }
    if ((v6 & 0xC) != 0)
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeAndAoASolution:](self, "_handleRangeAndAoASolution:", a3));
    else
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeOnlySolution:](self, "_handleRangeOnlySolution:", a3));
    v10 = v9;
    if (v9)
    {
      if (!*((_BYTE *)a3 + 24))
        sub_10000BA44();
      objc_msgSend(v9, "setTimestamp:", *((double *)a3 + 2));
      objc_msgSend(v10, "setRequiresBiasCorrection:", a4->requiresBiasCorrection);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "discoveryToken"));
      v122 = objc_msgSend(v11, "hash");
      *(_QWORD *)&buf = &v122;
      v12 = (id *)sub_1002F1E14((uint64_t)&self->_hashToTokenMap, (unint64_t *)&v122, (uint64_t)&unk_100472CF8, (_QWORD **)&buf);
      objc_storeStrong(v12 + 3, v11);
      objc_msgSend(v10, "setRangeBiasEstimate:", *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable);
      objc_msgSend(v10, "setRangeUncertainty:", *(double *)&NINearbyObjectRangeUncertaintyNotAvailable);
      if (LOBYTE(self->_convStateForObject))
      {
        v13 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          v14 = "#nrby-eng,#bias-est, Bypass estimating bias correction.";
LABEL_40:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v15 = objc_msgSend(v10, "requiresBiasCorrection");
        v13 = qword_10085F520;
        v16 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v16)
          {
            LOWORD(buf) = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est This device type requires bias estimation.", (uint8_t *)&buf, 2u);
          }
          if (*((_BYTE *)a3 + 600))
          {
            if (*((unsigned __int16 *)a3 + 215) > 0xFFu)
            {
              v13 = qword_10085F520;
              if (*((_BYTE *)a3 + 1288))
              {
                v17 = (id)qword_10085F520;
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  if (!*((_BYTE *)a3 + 600))
                    sub_10000BA44();
                  v18 = *((_QWORD *)a3 + 14);
                  LODWORD(buf) = 67109120;
                  DWORD1(buf) = v18;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Calculating bias for device mac addr : %d", (uint8_t *)&buf, 8u);
                }

                if (self->_protobufLogger.__ptr_)
                {
                  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
                    sub_1003E9514();
                  sub_100277158((uint64_t)self->_protobufLogger.__ptr_, (uint64_t)a3);
                }
                v114 = objc_alloc_init(UWBSignalFeatures);
                accumulatedExcessSeconds = self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
                v21 = objc_opt_class(NINearbyPeerConfiguration, v20);
                if ((objc_opt_isKindOfClass(*(_QWORD *)&accumulatedExcessSeconds, v21) & 1) != 0)
                {
                  v22 = *(id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "debugParameters"));
                  if (v23)
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "debugParameters"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("enableAdditionalUWBSignalFeatures")));
                    v116 = v25 != 0;

                  }
                  else
                  {
                    v116 = 0;
                  }

                }
                else
                {
                  v116 = 0;
                }
                v113 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _consolidateInputToMLModel:](self, "_consolidateInputToMLModel:", a3));
                v111 = (void *)objc_claimAutoreleasedReturnValue(-[NRBYFindingContainer consumeInputFeatures:](self->_findingAlgorithmContainer.__ptr_.__value_, "consumeInputFeatures:", v113));
                v112 = (void *)objc_claimAutoreleasedReturnValue(-[NRBYFindingContainer preprocessInputFeatures:](self->_findingAlgorithmContainer.__ptr_.__value_, "preprocessInputFeatures:", v111));
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[NRBYFindingContainer predictOutput:](self->_findingAlgorithmContainer.__ptr_.__value_, "predictOutput:"));
                v115 = (void *)objc_claimAutoreleasedReturnValue(-[NRBYFindingContainer biasCorrectionEstimate](self->_findingAlgorithmContainer.__ptr_.__value_, "biasCorrectionEstimate"));
                if (v115 && v45)
                {
                  buf = 0uLL;
                  v128[0] = 0;
                  v118 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", &stru_10081D5E0);
                  for (i = 0; (unint64_t)objc_msgSend(v45, "count") > i; ++i)
                  {
                    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", i));
                    objc_msgSend(v47, "doubleValue");
                    v49 = v48;

                    objc_msgSend(v118, "appendFormat:", CFSTR("%f "), v49);
                    v50 = (char *)*((_QWORD *)&buf + 1);
                    if (*((_QWORD *)&buf + 1) >= v128[0])
                    {
                      v52 = (char *)buf;
                      v53 = (uint64_t)(*((_QWORD *)&buf + 1) - buf) >> 3;
                      v54 = v53 + 1;
                      if ((unint64_t)(v53 + 1) >> 61)
                        sub_100026E7C();
                      v55 = v128[0] - buf;
                      if ((uint64_t)(v128[0] - buf) >> 2 > v54)
                        v54 = v55 >> 2;
                      if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF8)
                        v56 = 0x1FFFFFFFFFFFFFFFLL;
                      else
                        v56 = v54;
                      if (v56)
                      {
                        v57 = (char *)sub_10005538C((uint64_t)v128, v56);
                        v50 = (char *)*((_QWORD *)&buf + 1);
                        v52 = (char *)buf;
                      }
                      else
                      {
                        v57 = 0;
                      }
                      v58 = &v57[8 * v53];
                      *(_QWORD *)v58 = v49;
                      v51 = v58 + 8;
                      while (v50 != v52)
                      {
                        v59 = *((_QWORD *)v50 - 1);
                        v50 -= 8;
                        *((_QWORD *)v58 - 1) = v59;
                        v58 -= 8;
                      }
                      *(_QWORD *)&buf = v58;
                      *((_QWORD *)&buf + 1) = v51;
                      v128[0] = &v57[8 * v56];
                      if (v52)
                        operator delete(v52);
                    }
                    else
                    {
                      **((_QWORD **)&buf + 1) = v49;
                      v51 = v50 + 8;
                    }
                    *((_QWORD *)&buf + 1) = v51;
                  }
                  v62 = (id)qword_10085F520;
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                  {
                    if (!*((_BYTE *)a3 + 600) || (v63 = *((unsigned __int16 *)a3 + 215), v63 <= 0xFF))
                      sub_10000BA44();
                    *(_DWORD *)v123 = 67109378;
                    *(_DWORD *)&v123[4] = v63;
                    *(_WORD *)&v123[8] = 2112;
                    *(_QWORD *)&v123[10] = v118;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Output probabilities for antenna mask %d : %@", v123, 0x12u);
                  }

                  v64 = (id)qword_10085F520;
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v10, "distance");
                    v66 = v65;
                    objc_msgSend(v10, "distance");
                    v68 = v67;
                    objc_msgSend(v115, "doubleValue");
                    *(_DWORD *)v123 = 134218240;
                    *(double *)&v123[4] = v66;
                    *(_WORD *)&v123[12] = 2048;
                    *(double *)&v123[14] = v69 + v68;
                    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Range result (raw) = %f, Corrected Range = %f", v123, 0x16u);
                  }

                  objc_msgSend(v115, "doubleValue");
                  objc_msgSend(v10, "setRangeBiasEstimate:");
                  v70 = v116;
                  if (!v113)
                    v70 = 0;
                  if (v70)
                  {
                    v71 = objc_alloc_init(BiasEstimatorOutputs);
                    objc_msgSend(v10, "distance");
                    -[BiasEstimatorOutputs setRawRange:](v71, "setRawRange:", v72);
                    objc_msgSend(v10, "distance");
                    v74 = v73;
                    objc_msgSend(v115, "doubleValue");
                    -[BiasEstimatorOutputs setCorrectedRange:](v71, "setCorrectedRange:", v75 + v74);
                    -[BiasEstimatorOutputs setOutProbabilities:](v71, "setOutProbabilities:", v45);
                    -[UWBSignalFeatures setInputFeatures:](v114, "setInputFeatures:", v113);
                    -[UWBSignalFeatures setOutputs:](v114, "setOutputs:", v71);
                    objc_msgSend(v10, "setUwbSignalFeatures:", v114);

                  }
                  if (self->_protobufLogger.__ptr_)
                  {
                    memset(v123, 0, sizeof(v123));
                    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "featureValueForName:", CFSTR("input")));
                    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "multiArrayValue"));

                    __p = 0;
                    v120 = 0;
                    v121 = 0;
                    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "featureValueForName:", CFSTR("input")));
                    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "multiArrayValue"));

                    for (j = 0; (uint64_t)objc_msgSend(v77, "count") > j; ++j)
                    {
                      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectAtIndexedSubscript:", j));
                      objc_msgSend(v80, "doubleValue");
                      v82 = v81;
                      v83 = *(char **)&v123[8];
                      if (*(_QWORD *)&v123[8] >= *(_QWORD *)&v123[16])
                      {
                        v85 = *(char **)v123;
                        v86 = (uint64_t)(*(_QWORD *)&v123[8] - *(_QWORD *)v123) >> 3;
                        v87 = v86 + 1;
                        if ((unint64_t)(v86 + 1) >> 61)
                          sub_100026E7C();
                        v88 = *(_QWORD *)&v123[16] - *(_QWORD *)v123;
                        if ((uint64_t)(*(_QWORD *)&v123[16] - *(_QWORD *)v123) >> 2 > v87)
                          v87 = v88 >> 2;
                        if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF8)
                          v89 = 0x1FFFFFFFFFFFFFFFLL;
                        else
                          v89 = v87;
                        if (v89)
                        {
                          v90 = (char *)sub_10005538C((uint64_t)&v123[16], v89);
                          v85 = *(char **)v123;
                          v83 = *(char **)&v123[8];
                        }
                        else
                        {
                          v90 = 0;
                        }
                        v91 = &v90[8 * v86];
                        *(_QWORD *)v91 = v82;
                        v84 = v91 + 8;
                        while (v83 != v85)
                        {
                          v92 = *((_QWORD *)v83 - 1);
                          v83 -= 8;
                          *((_QWORD *)v91 - 1) = v92;
                          v91 -= 8;
                        }
                        *(_QWORD *)v123 = v91;
                        *(_QWORD *)&v123[8] = v84;
                        *(_QWORD *)&v123[16] = &v90[8 * v89];
                        if (v85)
                          operator delete(v85);
                      }
                      else
                      {
                        **(_QWORD **)&v123[8] = v81;
                        v84 = v83 + 8;
                      }
                      *(_QWORD *)&v123[8] = v84;

                      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "objectAtIndexedSubscript:", j));
                      objc_msgSend(v93, "doubleValue");
                      v95 = v94;
                      v96 = v120;
                      if (v120 >= v121)
                      {
                        v98 = (char *)__p;
                        v99 = (v120 - (_BYTE *)__p) >> 3;
                        v100 = v99 + 1;
                        if ((unint64_t)(v99 + 1) >> 61)
                          sub_100026E7C();
                        v101 = v121 - (_BYTE *)__p;
                        if ((v121 - (_BYTE *)__p) >> 2 > v100)
                          v100 = v101 >> 2;
                        if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF8)
                          v102 = 0x1FFFFFFFFFFFFFFFLL;
                        else
                          v102 = v100;
                        if (v102)
                        {
                          v103 = (char *)sub_10005538C((uint64_t)&v121, v102);
                          v98 = (char *)__p;
                          v96 = v120;
                        }
                        else
                        {
                          v103 = 0;
                        }
                        v104 = &v103[8 * v99];
                        *(_QWORD *)v104 = v95;
                        v97 = v104 + 8;
                        while (v96 != v98)
                        {
                          v105 = *((_QWORD *)v96 - 1);
                          v96 -= 8;
                          *((_QWORD *)v104 - 1) = v105;
                          v104 -= 8;
                        }
                        __p = v104;
                        v120 = v97;
                        v121 = &v103[8 * v102];
                        if (v98)
                          operator delete(v98);
                      }
                      else
                      {
                        *(_QWORD *)v120 = v94;
                        v97 = v96 + 8;
                      }
                      v120 = v97;

                    }
                    if (!*((_BYTE *)a3 + 600)
                      || (v106 = *((unsigned __int16 *)a3 + 215), v106 < 0x100)
                      || (ptr = self->_protobufLogger.__ptr_,
                          objc_msgSend(v10, "distance"),
                          v109 = v108,
                          objc_msgSend(v115, "doubleValue"),
                          !*((_BYTE *)a3 + 24)))
                    {
                      sub_10000BA44();
                    }
                    sub_100277994((uint64_t)ptr, v106, v109, v110, *((double *)a3 + 2), (uint64_t)v123, (uint64_t)&__p, (uint64_t *)&buf, *((unsigned __int16 *)a3 + 18), *((_QWORD *)a3 + 5));

                    if (__p)
                    {
                      v120 = (char *)__p;
                      operator delete(__p);
                    }

                    if (*(_QWORD *)v123)
                    {
                      *(_QWORD *)&v123[8] = *(_QWORD *)v123;
                      operator delete(*(void **)v123);
                    }
                  }

                  if ((_QWORD)buf)
                  {
                    *((_QWORD *)&buf + 1) = buf;
                    operator delete((void *)buf);
                  }
                }
                else
                {
                  -[NINearbyUpdatesEngine _getRangeUncertaintyWhenBiasEstimateNotAvailable](self, "_getRangeUncertaintyWhenBiasEstimateNotAvailable");
                  objc_msgSend(v10, "setRangeUncertainty:");
                  v60 = (id)qword_10085F520;
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v10, "rangeUncertainty");
                    LODWORD(buf) = 134217984;
                    *(_QWORD *)((char *)&buf + 4) = v61;
                    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Could not compute bias estimate, override range uncertainty to %.2f", (uint8_t *)&buf, 0xCu);
                  }

                }
                goto LABEL_41;
              }
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                v14 = "#nrby-eng,#bias-est Not estimating range bias correction for this range result since no TOA V2 CIRs";
                goto LABEL_40;
              }
            }
            else
            {
              v13 = qword_10085F520;
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                v14 = "#nrby-eng,#bias-est received raw rose range measurement without remoteTxAntennaMask, Bypass estima"
                      "ting bias correction.";
                goto LABEL_40;
              }
            }
          }
          else
          {
            v13 = qword_10085F520;
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf) = 0;
              v14 = "#nrby-eng,#bias-est raw_rose_measurement not available, Bypass estimating bias correction.";
              goto LABEL_40;
            }
          }
        }
        else if (v16)
        {
          LOWORD(buf) = 0;
          v14 = "#nrby-eng,#bias-est This device type does not require bias estimation";
          goto LABEL_40;
        }
      }
LABEL_41:
      v26 = -[NINearbyUpdatesEngine _shouldConsumeRoseSolution:](self, "_shouldConsumeRoseSolution:", a3);
      if (self->_regionMonitor.__ptr_.__value_)
      {
        if ((v26 & 1) != 0)
          -[NINearbyUpdatesEngine processUWBResultForRegionMonitoring:roseSolution:processingOptions:](self, "processUWBResultForRegionMonitoring:roseSolution:processingOptions:", v10, a3, a4);
      }
      else if (*(_QWORD *)&self->_uniqueIdentifier.__r_.var0)
      {
        -[NINearbyUpdatesEngine processUWBResultForSyntheticAperture:roseSolution:](self, "processUWBResultForSyntheticAperture:roseSolution:", v10, a3);
      }
      else if (self->_uniqueIdentifier.var0)
      {
        if (*((_BYTE *)a3 + 600))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "discoveryToken"));
          v28 = objc_msgSend(v27, "hash");
          if (!*((_BYTE *)a3 + 24) || !*((_BYTE *)a3 + 600))
            sub_10000BA44();
          v29 = *((_QWORD *)a3 + 2);
          *(float *)&v30 = *((double *)a3 + 44);
          v31 = *((_QWORD *)a3 + 27);
          v32 = *((unsigned __int16 *)a3 + 80) | 0x10000;
          v33 = *((_WORD *)a3 + 257);
          v34 = *((_WORD *)a3 + 280);
          *(_QWORD *)&buf = v28;
          *((_QWORD *)&buf + 1) = v29;
          v128[0] = v30 | 0x100000000;
          v129 = 0;
          v130 = 0;
          v131 = 0;
          v132 = 0;
          v128[1] = 0;
          v128[2] = 0;
          v133 = v31;
          v134 = 1;
          v135 = 0;
          v137 = 0u;
          v136 = 0u;
          v138 = 0x200000000;
          v139 = 0;
          v140 = 0;
          v141 = 0;
          v142 = 0;
          v143 = v32;
          v144 = v33;
          v145 = v34;

          -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
          v35 = self->_protobufLogger.__ptr_;
          if (v35)
            sub_10027B57C((uint64_t)v35, (const std::string *)&self->_uniqueIdentifier, (float32x2_t *)&buf);
          dataSource = self->_dataSource;
          if (dataSource)
          {
            if (!*((_BYTE *)a3 + 600))
              sub_10000BA44();
            -[NINearbyUpdatesEngineDataSource updateWithSuccessfulRange:uwbRSSI:nbRSSI:](dataSource, "updateWithSuccessfulRange:uwbRSSI:nbRSSI:", *((_QWORD *)a3 + 28), *((_QWORD *)a3 + 29), *((double *)a3 + 44), *((double *)a3 + 27));
          }
          v37 = *((double *)&buf + 1);
          v38 = *(double *)&self->_onlySendKinematicFindeeData;
          *(_QWORD *)&self->_onlySendKinematicFindeeData = *((_QWORD *)&buf + 1);
          v39 = sub_10000883C();
          v40 = v37 - v38;
          v41 = v39 - *(double *)&self->_findingLatencyBookkeeping.receivedFirstMeasurement;
          *(double *)&self->_findingLatencyBookkeeping.receivedFirstMeasurement = v39;
          v42 = v41 - v40;
          if (self->_cachedMagneticFieldStrength.__engaged_)
            self->_findingLatencyBookkeeping.lastMeasurementTimeSeconds = v42
                                                                        + self->_findingLatencyBookkeeping.lastMeasurementTimeSeconds;
          v43 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            lastMeasurementTimeSeconds = self->_findingLatencyBookkeeping.lastMeasurementTimeSeconds;
            *(_DWORD *)v123 = 134349824;
            *(double *)&v123[4] = v40;
            *(_WORD *)&v123[12] = 2050;
            *(double *)&v123[14] = v41;
            *(_WORD *)&v123[22] = 1026;
            v124 = (int)(v42 * 1000.0);
            v125 = 1026;
            v126 = (int)(lastMeasurementTimeSeconds * 1000.0);
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#nrby-eng,Finding range result latency report. measDelta: %{public}0.3f [s]. processDelta: %{public}0.3f [s]. Excess ms: %{public}d. Accumulated excess ms: %{public}d", v123, 0x22u);
          }
          self->_cachedMagneticFieldStrength.__engaged_ = 1;
          sub_1001D0140(0x2B730440u, 1, 1, 0, 0, 0);
          (*(void (**)(int64_t, __int128 *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 24))(self->_uniqueIdentifier.var0, &buf);
          sub_1001D0140(0x2B730440u, 2, 1, 0, 0, 0);
          if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 32))(self->_uniqueIdentifier.var0))
            -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", v10);
          if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 40))(self->_uniqueIdentifier.var0))
            -[NINearbyUpdatesEngine getPeerDataFromFindingContainerWithToken:](self, "getPeerDataFromFindingContainerWithToken:", v11);
        }
        else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          sub_1003E94E8();
        }
      }
      else if (v26)
      {
        -[NINearbyUpdatesEngine reportAndLogNearbyObject:](self, "reportAndLogNearbyObject:", v10);
      }

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E94BC();
  }
}

- (void)acceptUnsuccessfulRoseSolution:(const void *)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  __int16 v12;
  Logger *ptr;
  NINearbyUpdatesEngineDataSource *dataSource;
  id WeakRetained;
  void *v16;
  void *v17;
  NIDiscoveryToken *findingPeerToken;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;

  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E9644();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ForwardUnsuccessfulRangingEvents")));

  if (v6)
  {
    v7 = *((_DWORD *)a3 + 8);
    if (v7 <= 5)
    {
      v8 = 1 << v7;
      if ((v8 & 0x31) == 0)
      {
        if ((v8 & 0xC) != 0)
          v10 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeAndAoASolution:](self, "_handleRangeAndAoASolution:", a3));
        else
          v10 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeOnlySolution:](self, "_handleRangeOnlySolution:", a3));
        v9 = (void *)v10;
        if (v10)
          -[NINearbyUpdatesEngine reportAndLogNearbyObject:](self, "reportAndLogNearbyObject:", v10);
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E9540();
    }
    v9 = 0;
LABEL_14:

  }
  if (self->_uniqueIdentifier.var0)
  {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
    if (*((_BYTE *)a3 + 24))
    {
      if (*((_BYTE *)a3 + 600))
      {
        v11 = *((unsigned __int16 *)a3 + 280);
        if (v11 <= 0xFF)
          sub_1003E956C();
        v12 = *((_WORD *)a3 + 80);
        v20 = *((_QWORD *)a3 + 2);
        LOWORD(v21) = v12;
        BYTE2(v21) = v11;
        ptr = self->_protobufLogger.__ptr_;
        if (ptr)
          sub_10027A6A0((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)&v20);
        dataSource = self->_dataSource;
        if (dataSource)
          -[NINearbyUpdatesEngineDataSource updateWithMissedRange](dataSource, "updateWithMissedRange", v20, v21);
        if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 304))(self->_uniqueIdentifier.var0))
        {
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
            sub_1003E9618();
          sub_1001D0140(0x2B730440u, 1, 0, 0, 0, 0);
          (*(void (**)(int64_t, uint64_t *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 296))(self->_uniqueIdentifier.var0, &v20);
          sub_1001D0140(0x2B730440u, 2, 0, 0, 0, 0);
          if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 312))(self->_uniqueIdentifier.var0))
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "objectFromIdentifier:", *((_QWORD *)a3 + 5)));

            if (v16)
            {
              if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
                sub_1003E95EC();
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "discoveryToken", v20, v21));
              -[NINearbyUpdatesEngine getPeerDataFromFindingContainerWithToken:](self, "getPeerDataFromFindingContainerWithToken:", v17);

            }
            else
            {
              findingPeerToken = self->_findingPeerToken;
              v19 = os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG);
              if (findingPeerToken)
              {
                if (v19)
                  sub_1003E95C0();
                -[NINearbyUpdatesEngine getPeerDataFromFindingContainerWithToken:](self, "getPeerDataFromFindingContainerWithToken:", self->_findingPeerToken, v20, v21);
              }
              else if (v19)
              {
                sub_1003E9594();
              }
            }

          }
        }
      }
    }
  }
}

- (void)reportAndLogNearbyObject:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NINearbyUpdatesEngineDataSource *dataSource;
  Logger *ptr;
  double v9;
  double v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char **v14;
  char v15;
  void *__p[20];
  id v17;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
  {
    v17 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    objc_msgSend(WeakRetained, "updatesEngine:didUpdateNearbyObjects:", self, v6);

  }
  dataSource = self->_dataSource;
  if (dataSource)
    -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](dataSource, "nearbyObjectUpdated:", v4);
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    objc_msgSend(v4, "timestamp");
    v10 = v9;
    sub_100268FEC(v4, (uint64_t)__p);
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = &v11;
    v15 = 0;
    v11 = (char *)operator new(0xA0uLL);
    v12 = (uint64_t)v11;
    v13 = v11 + 160;
    v12 = sub_1002F1C0C((uint64_t)&v13, (uint64_t)__p, (uint64_t)&v17, (uint64_t)v11);
    sub_100273D94((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v11, v10);
    v14 = &v11;
    sub_1002F1D80((void ***)&v14);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }

}

- (void)acceptDeviceMotion:(const void *)a3
{
  RegionMonitor *value;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if (*((_BYTE *)a3 + 16))
  {
    v4 = *((_QWORD *)a3 + 1);
    v5 = *(_OWORD *)((char *)a3 + 24);
    v6 = *((_QWORD *)a3 + 5);
    v7 = *((_OWORD *)a3 + 3);
    v8 = *((_QWORD *)a3 + 8);
    v9 = *(_OWORD *)((char *)a3 + 72);
    v10 = *(_OWORD *)((char *)a3 + 88);
    v12 = *((_QWORD *)a3 + 15);
    v11 = *(_OWORD *)((char *)a3 + 104);
    value = self->_regionMonitor.__ptr_.__value_;
    if (value)
      sub_100355524((uint64_t)value, (uint64_t)&v4);
  }
}

- (void)acceptMagneticFieldStrength:(double)a3
{
  double v5;
  int null_state;

  v5 = sub_10000883C();
  null_state = self->_cachedMagneticFieldStrength.var0.__null_state_;
  *(double *)&self->_rangeBiasEstimatorSingleAntennaModel = v5;
  *(double *)&self->_shouldBypassBiasCorrection = a3;
  if (!null_state)
    self->_cachedMagneticFieldStrength.var0.__null_state_ = 1;
}

- (void)acceptBluetoothSample:(const void *)a3
{
  id WeakRetained;
  char *v6;
  void *v7;
  Logger *ptr;
  void *v9;
  id *v10;
  _QWORD *v11;
  _QWORD *i;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  void *v18;
  int v19;
  __CFString *v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  RegionMonitor *value;
  double v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[3];
  void *__p[2];
  uint64_t v38;
  void *v39[2];
  char v40;
  _QWORD *v41[2];
  _QWORD *v42[33];
  _QWORD **v43;
  _QWORD *v44[2];
  _QWORD *v45;
  std::__shared_weak_count *v46;
  unint64_t v47[2];

  if (self->_regionMonitor.__ptr_.__value_)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
    v6 = (char *)a3 + 72;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "objectFromIdentifier:", *((_QWORD *)a3 + 9)));

    if (v7)
    {
      ptr = self->_protobufLogger.__ptr_;
      if (ptr)
        sub_1002744B4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryToken"));
      v47[0] = (unint64_t)objc_msgSend(v9, "hash");
      v41[0] = v47;
      v10 = (id *)sub_1002F1E14((uint64_t)&self->_hashToTokenMap, v47, (uint64_t)&unk_100472CF8, v41);
      objc_storeStrong(v10 + 3, v9);
      sub_100355A94((uint64_t *)self->_regionMonitor.__ptr_.__value_, 0, (uint64_t *)&v45);
      v44[0] = 0;
      v44[1] = 0;
      v43 = v44;
      if (sub_1003559B4((uint64_t)self->_regionMonitor.__ptr_.__value_, *((_QWORD *)a3 + 9), *((_QWORD *)a3 + 10)))
      {
        v11 = v45;
        for (i = (_QWORD *)*v45; ; i = v23)
        {
          v15 = (_QWORD *)v11[1];
          v13 = v11 + 1;
          v14 = v15;
          if (v15)
          {
            do
            {
              v16 = v14;
              v14 = (_QWORD *)v14[1];
            }
            while (v14);
          }
          else
          {
            do
            {
              v16 = (_QWORD *)v13[2];
              v17 = *v16 == (_QWORD)v13;
              v13 = v16;
            }
            while (v17);
          }
          if (i == v16)
            break;
          v18 = sub_1002EB648();
          v19 = *((_DWORD *)i + 17);
          v20 = sub_1001FD9AC();
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v20));
          sub_10000BF04(v39, (char *)objc_msgSend(v21, "UTF8String"));
          if (*((char *)a3 + 47) < 0)
          {
            sub_100004678(__p, *((void **)a3 + 3), *((_QWORD *)a3 + 4));
          }
          else
          {
            *(_OWORD *)__p = *(_OWORD *)((char *)a3 + 24);
            v38 = *((_QWORD *)a3 + 5);
          }
          sub_100231ED0((uint64_t)v18, v19, (uint64_t)v39, (uint64_t)__p, (uint64_t)v41);
          if (SHIBYTE(v38) < 0)
            operator delete(__p[0]);
          if (v40 < 0)
            operator delete(v39[0]);

          sub_1002F20A8((uint64_t)&v43, (uint64_t)v41, (uint64_t)v41);
          sub_10003E3F0((uint64_t)v42, v42[1]);
          v22 = (_QWORD *)i[1];
          if (v22)
          {
            do
            {
              v23 = v22;
              v22 = (_QWORD *)*v22;
            }
            while (v22);
          }
          else
          {
            do
            {
              v23 = (_QWORD *)i[2];
              v17 = *v23 == (_QWORD)i;
              i = v23;
            }
            while (!v17);
          }
          v11 = v45;
        }
      }
      value = self->_regionMonitor.__ptr_.__value_;
      sub_1002F22AC(v36, (uint64_t)&v43);
      v25 = sub_10000883C();
      sub_100355574((uint64_t)value, (uint64_t)a3, (uint64_t)v36, v25);
      sub_1002F205C((uint64_t)v36, (_QWORD *)v36[1]);
      sub_1002F205C((uint64_t)&v43, v44[0]);
      v26 = v46;
      if (v46)
      {
        p_shared_owners = (unint64_t *)&v46->__shared_owners_;
        do
          v28 = __ldaxr(p_shared_owners);
        while (__stlxr(v28 - 1, p_shared_owners));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }

    }
    else
    {
      v29 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E9670((uint64_t)v6, v29, v30, v31, v32, v33, v34, v35);
    }

  }
}

- (void)clearStateForToken:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  Logger *ptr;
  void *__p[20];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained, "identifierFromDiscoveryToken:", v4);
    if (v8)
    {
      if (self->_regionMonitor.__ptr_.__value_)
      {
        v9 = (uint64_t)v7;
        v10 = sub_10000883C();
        sub_100355204((uint64_t)self->_regionMonitor.__ptr_.__value_, v9, v10);
        if (self->_protobufLogger.__ptr_)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectFromIdentifier:", v9));
          v12 = v11;
          if (v11)
          {
            ptr = self->_protobufLogger.__ptr_;
            sub_100268FEC(v11, (uint64_t)__p);
            sub_1002766B0((uint64_t)ptr, (uint64_t)__p, v10);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }

          }
        }
      }
    }
  }

}

- (void)invalidate
{
  uint64_t *p_regionMonitor;
  Logger *ptr;
  Logger *v5;
  int64_t var0;
  Logger *v7;

  p_regionMonitor = (uint64_t *)&self->_regionMonitor;
  if (self->_regionMonitor.__ptr_.__value_)
  {
    ptr = self->_protobufLogger.__ptr_;
    if (ptr)
      sub_1002753AC((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier);
    sub_1002EB860(p_regionMonitor, 0);
    sub_1002F25A0((uint64_t)&self->_hashToTokenMap);
    -[NSMutableDictionary removeAllObjects](self->_regionDict, "removeAllObjects");
  }
  HIDWORD(self->_convStateForObject) = 2;
  if (*(_QWORD *)&self->_uniqueIdentifier.__r_.var0)
  {
    v5 = self->_protobufLogger.__ptr_;
    if (v5)
      sub_10027B174((uint64_t)v5, (const std::string *)&self->_uniqueIdentifier);
  }
  var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 328))(var0, a2))
      (*(void (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 336))(self->_uniqueIdentifier.var0);
    v7 = self->_protobufLogger.__ptr_;
    if (v7)
      sub_10027B174((uint64_t)v7, (const std::string *)&self->_uniqueIdentifier);
  }
}

- (id)_consolidateInputToMLModel:(const void *)a3
{
  NSObject *v4;
  __int16 *v5;
  Complex *v6;
  Complex *v7;
  Complex *v8;
  Complex *v9;
  Complex *v10;
  Complex *v11;
  void *v12;
  Complex *v13;
  Complex *v14;
  void *v15;
  void *v16;
  Complex *v17;
  Complex *v18;
  void *v19;
  void *v20;
  Complex *v21;
  __int16 *v22;
  Complex *v23;
  Complex *v24;
  Complex *v25;
  Complex *v26;
  Complex *v27;
  Complex *v28;
  void *v29;
  Complex *v30;
  Complex *v31;
  void *v32;
  void *v33;
  Complex *v34;
  Complex *v35;
  void *v36;
  void *v37;
  Complex *v38;
  BiasEstimatorFeatures *v39;
  void *v40;
  double v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  BiasEstimatorFeatures *v46;
  void *v48;
  void *v49;
  Complex *v50;
  Complex *v51;
  void *v52;
  void *v53;
  Complex *v54;
  Complex *v55;
  void *v56;
  void *v57;
  Complex *v58;
  Complex *v59;
  void *v60;
  void *v61;
  Complex *v62;
  Complex *v63;
  Complex *v64;
  void *v65;
  void *v66;
  void *v67;
  Complex *v68;
  void *v69;
  char *v70;
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
  uint8_t buf[16];
  _QWORD v84[8];
  _QWORD v85[8];

  v4 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#bias-est Consolidating input to bias estimator", buf, 2u);
  }
  if (!*((_BYTE *)a3 + 600))
    sub_10000BA44();
  if (!*((_BYTE *)a3 + 1288))
    sub_1003E96D8();
  if (*((unsigned __int16 *)a3 + 215) <= 0xFFu)
    sub_1003E9700();
  v70 = (char *)a3 + 1184;
  v5 = (__int16 *)sub_10015BF7C((uint64_t)a3 + 1184, 0);
  v6 = [Complex alloc];
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)*v5));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[1]));
  v68 = -[Complex initWithRealPart:imagPart:](v6, "initWithRealPart:imagPart:", v81);
  v85[0] = v68;
  v7 = [Complex alloc];
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[2]));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[3]));
  v63 = -[Complex initWithRealPart:imagPart:](v7, "initWithRealPart:imagPart:", v79);
  v85[1] = v63;
  v8 = [Complex alloc];
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[4]));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[5]));
  v59 = -[Complex initWithRealPart:imagPart:](v8, "initWithRealPart:imagPart:", v77);
  v85[2] = v59;
  v9 = [Complex alloc];
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[6]));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[7]));
  v55 = -[Complex initWithRealPart:imagPart:](v9, "initWithRealPart:imagPart:", v75);
  v85[3] = v55;
  v10 = [Complex alloc];
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[8]));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[9]));
  v51 = -[Complex initWithRealPart:imagPart:](v10, "initWithRealPart:imagPart:", v73);
  v85[4] = v51;
  v11 = [Complex alloc];
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[10]));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[11]));
  v13 = -[Complex initWithRealPart:imagPart:](v11, "initWithRealPart:imagPart:", v71, v12);
  v85[5] = v13;
  v14 = [Complex alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[12]));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[13]));
  v17 = -[Complex initWithRealPart:imagPart:](v14, "initWithRealPart:imagPart:", v15, v16);
  v85[6] = v17;
  v18 = [Complex alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[14]));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v5[15]));
  v21 = -[Complex initWithRealPart:imagPart:](v18, "initWithRealPart:imagPart:", v19, v20);
  v85[7] = v21;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 8));

  v22 = (__int16 *)sub_10015BF7C((uint64_t)a3 + 1184, 1);
  v23 = [Complex alloc];
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)*v22));
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[1]));
  v64 = -[Complex initWithRealPart:imagPart:](v23, "initWithRealPart:imagPart:", v82);
  v84[0] = v64;
  v24 = [Complex alloc];
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[2]));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[3]));
  v62 = -[Complex initWithRealPart:imagPart:](v24, "initWithRealPart:imagPart:", v80);
  v84[1] = v62;
  v25 = [Complex alloc];
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[4]));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[5]));
  v58 = -[Complex initWithRealPart:imagPart:](v25, "initWithRealPart:imagPart:", v78);
  v84[2] = v58;
  v26 = [Complex alloc];
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[6]));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[7]));
  v54 = -[Complex initWithRealPart:imagPart:](v26, "initWithRealPart:imagPart:", v76);
  v84[3] = v54;
  v27 = [Complex alloc];
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[8]));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[9]));
  v50 = -[Complex initWithRealPart:imagPart:](v27, "initWithRealPart:imagPart:", v74);
  v84[4] = v50;
  v28 = [Complex alloc];
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[10]));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[11]));
  v30 = -[Complex initWithRealPart:imagPart:](v28, "initWithRealPart:imagPart:", v72, v29);
  v84[5] = v30;
  v31 = [Complex alloc];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[12]));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[13]));
  v34 = -[Complex initWithRealPart:imagPart:](v31, "initWithRealPart:imagPart:", v32, v33);
  v84[6] = v34;
  v35 = [Complex alloc];
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[14]));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v22[15]));
  v38 = -[Complex initWithRealPart:imagPart:](v35, "initWithRealPart:imagPart:", v36, v37);
  v84[7] = v38;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 8));

  v39 = objc_alloc_init(BiasEstimatorFeatures);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v40, "timeIntervalSince1970");
  v42 = v41;

  -[BiasEstimatorFeatures setTimestamp:](v39, "setTimestamp:", v42);
  if (!*((_BYTE *)a3 + 24))
    __assert_rtn("-[NINearbyUpdatesEngine _consolidateInputToMLModel:]", "NIServerNearbyUpdatesEngine.mm", 1715, "solution.mach_continuous_time_sec.has_value()");
  -[BiasEstimatorFeatures setUwbTime:](v39, "setUwbTime:", *((double *)a3 + 2));
  if (*((unsigned __int16 *)a3 + 215) <= 0xFFu)
    sub_10000BA44();
  -[BiasEstimatorFeatures setAntennaMask:](v39, "setAntennaMask:", *((_WORD *)a3 + 215));
  -[BiasEstimatorFeatures setSoiRssiDbm:](v39, "setSoiRssiDbm:", *((double *)a3 + 27));
  -[BiasEstimatorFeatures setRssiDbm:](v39, "setRssiDbm:", *((double *)a3 + 26));
  -[BiasEstimatorFeatures setTofPicSecond:](v39, "setTofPicSecond:", *((double *)a3 + 22));
  LOWORD(v43) = *((_WORD *)a3 + 212);
  -[BiasEstimatorFeatures setToaNoiseRms:](v39, "setToaNoiseRms:", (double)v43);
  LOWORD(v44) = *((_WORD *)a3 + 213);
  -[BiasEstimatorFeatures setToaPpwinRms:](v39, "setToaPpwinRms:", (double)v44);
  LOWORD(v45) = *((_WORD *)a3 + 214);
  -[BiasEstimatorFeatures setToaPpwinPeak:](v39, "setToaPpwinPeak:", (double)v45);
  if (*((_BYTE *)a3 + 440) && *((_BYTE *)a3 + 456) && *((_BYTE *)a3 + 472) && *((_BYTE *)a3 + 488))
  {
    -[BiasEstimatorFeatures setRttInitiator:](v39, "setRttInitiator:", (double)*((unint64_t *)a3 + 54));
    if (!*((_BYTE *)a3 + 456))
      sub_10000BA44();
    -[BiasEstimatorFeatures setTatInitiator:](v39, "setTatInitiator:", (double)*((unint64_t *)a3 + 56));
    if (!*((_BYTE *)a3 + 472))
      sub_10000BA44();
    -[BiasEstimatorFeatures setRttResponder:](v39, "setRttResponder:", (double)*((unint64_t *)a3 + 58));
    if (!*((_BYTE *)a3 + 488))
      sub_10000BA44();
    -[BiasEstimatorFeatures setTatResponder:](v39, "setTatResponder:", (double)*((unint64_t *)a3 + 60));
    -[BiasEstimatorFeatures setCirPacket1:](v39, "setCirPacket1:", v67);
    -[BiasEstimatorFeatures setLeadingEdgePacket1:](v39, "setLeadingEdgePacket1:", (double)sub_10015BF2C((uint64_t)v70, 0));
    -[BiasEstimatorFeatures setFirstPathIndexPacket1:](v39, "setFirstPathIndexPacket1:", (double)sub_10015BF04((uint64_t)v70, 0));
    -[BiasEstimatorFeatures setRxAntennaPacket1:](v39, "setRxAntennaPacket1:", sub_10015BEDC((uint64_t)v70, 0));
    -[BiasEstimatorFeatures setCirPacket2:](v39, "setCirPacket2:", v69);
    -[BiasEstimatorFeatures setLeadingEdgePacket2:](v39, "setLeadingEdgePacket2:", (double)sub_10015BF2C((uint64_t)v70, 1));
    -[BiasEstimatorFeatures setFirstPathIndexPacket2:](v39, "setFirstPathIndexPacket2:", (double)sub_10015BF04((uint64_t)v70, 1));
    -[BiasEstimatorFeatures setRxAntennaPacket2:](v39, "setRxAntennaPacket2:", sub_10015BEDC((uint64_t)v70, 1));
    v46 = v39;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E9728();
    v46 = 0;
  }

  return v46;
}

- (id)_handleRangeAndAoASolution:(const void *)a3
{
  id WeakRetained;
  void *v6;
  double v7;
  float v8;
  int rangeMeasSourcePref;
  NSObject *v10;
  double v11;
  double v12;
  id v13;
  float v15;
  float v16;
  uint8_t buf[16];

  if (!*((_BYTE *)a3 + 752))
    sub_1003E9754();
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "objectFromIdentifier:", *((_QWORD *)a3 + 5)));

  if (v6)
  {
    -[NINearbyUpdatesEngine _convertFromPointingCoordinatesToSpatial:](self, "_convertFromPointingCoordinatesToSpatial:", (char *)a3 + 608);
    v15 = *(float *)&v7;
    v16 = v8;
    rangeMeasSourcePref = self->_rangeMeasSourcePref;
    if (rangeMeasSourcePref)
    {
      if (rangeMeasSourcePref != 1)
        goto LABEL_12;
      if (!*((_BYTE *)a3 + 600))
      {
        *(float *)&v7 = NINearbyObjectDistanceNotAvailable;
        goto LABEL_11;
      }
      v7 = *((double *)a3 + 44);
    }
    else
    {
      v7 = *((double *)a3 + 81);
    }
    *(float *)&v7 = v7;
LABEL_11:
    objc_msgSend(v6, "setDistance:", v7);
LABEL_12:
    objc_msgSend(v6, "setDirection:", sub_10003F09C(&v15));
    objc_msgSend(v6, "setDistanceMeasurementQuality:", 1);
    objc_msgSend(v6, "setQuaternion:", sub_10003EFF0(v15, v16));
    *(float *)&v11 = v15;
    objc_msgSend(v6, "setAzimuth:", v11);
    *(float *)&v12 = v16;
    objc_msgSend(v6, "setElevation:", v12);
    if (*((_BYTE *)a3 + 600))
    {
      objc_msgSend(v6, "setSignalStrength:", *((double *)a3 + 27));
      if (*((unsigned __int16 *)a3 + 215) >= 0x100u)
        objc_msgSend(v6, "setRemoteTxAntennaMask:", *((_WORD *)a3 + 215));
    }
    v13 = v6;
    goto LABEL_16;
  }
  v10 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#warning _handleRangeAndAoASolution failed to convert identifier to object.", buf, 2u);
  }
LABEL_16:

  return v6;
}

- (id)_handleRangeOnlySolution:(const void *)a3
{
  id WeakRetained;
  void *v6;
  double v7;
  id v8;

  if (!*((_BYTE *)a3 + 600))
    sub_1003E977C();
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "objectFromIdentifier:", *((_QWORD *)a3 + 5)));

  if (v6)
  {
    if (!*((_BYTE *)a3 + 600))
      sub_10000BA44();
    if (self->_rangeMeasSourcePref < 2u)
    {
      v7 = *((double *)a3 + 44);
      *(float *)&v7 = v7;
      objc_msgSend(v6, "setDistance:", v7);
    }
    objc_msgSend(v6, "setDirection:", *(double *)NINearbyObjectDirectionNotAvailable.i64);
    objc_msgSend(v6, "setDistanceMeasurementQuality:", 1);
    objc_msgSend(v6, "setSignalStrength:", *((double *)a3 + 27));
    if (*((unsigned __int16 *)a3 + 215) >= 0x100u)
      objc_msgSend(v6, "setRemoteTxAntennaMask:", *((_WORD *)a3 + 215));
    if (*((unsigned __int16 *)a3 + 248) >= 0x100u && *((unsigned __int16 *)a3 + 249) >= 0x100u)
    {
      objc_msgSend(v6, "setNbRxStatus:", *((_WORD *)a3 + 248));
      if (*((unsigned __int16 *)a3 + 249) <= 0xFFu)
        sub_10000BA44();
      objc_msgSend(v6, "setMmsRxStatus:", *((_WORD *)a3 + 249));
    }
    if (*((_BYTE *)a3 + 232))
      objc_msgSend(v6, "setNbRssi:", *((double *)a3 + 28));
    v8 = v6;
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E97A4();
  }

  return v6;
}

- (double)_getRangeUncertaintyWhenBiasEstimateNotAvailable
{
  return 0.5;
}

- (BOOL)_shouldConsumeRoseSolution:(const void *)a3
{
  __int128 v4;
  __int128 v5;
  const void *v6;
  uint64_t v7;
  __int128 v8;
  const void *v9;
  BOOL v10;
  NSObject *v11;
  _DWORD v13[4];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *__p;
  void *v26;
  uint64_t v27;
  _WORD v28[196];

  if (*((_BYTE *)a3 + 600))
  {
    v4 = *((_OWORD *)a3 + 6);
    v16 = *((_OWORD *)a3 + 5);
    v17 = v4;
    v5 = *((_OWORD *)a3 + 4);
    v14 = *((_OWORD *)a3 + 3);
    v15 = v5;
    v6 = (const void *)*((_QWORD *)a3 + 15);
    v18 = *((_QWORD *)a3 + 14);
    v19 = 0;
    v7 = *((_QWORD *)a3 + 16);
    v20 = 0;
    v21 = 0;
    sub_1001375D8(&v19, v6, v7, (v7 - (uint64_t)v6) >> 3);
    v8 = *((_OWORD *)a3 + 10);
    v22 = *((_OWORD *)a3 + 9);
    v23 = v8;
    v9 = (const void *)*((_QWORD *)a3 + 23);
    v24 = *((_QWORD *)a3 + 22);
    __p = 0;
    v26 = 0;
    v27 = 0;
    sub_100137690(&__p, v9, *((_QWORD *)a3 + 24), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a3 + 24) - (_QWORD)v9) >> 3));
    memcpy(v28, (char *)a3 + 208, 0x181uLL);
    if (v28[153] > 0xFFu)
    {
      if (LOBYTE(v28[153]) <= 2u)
      {
        v11 = (id)qword_10085F520;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          if (v28[153] <= 0xFFu)
            sub_10000BA44();
          v13[0] = 67109120;
          v13[1] = LOBYTE(v28[153]);
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#nrby-eng,mmsValStatus %d does not pass check, rejecting range result event", (uint8_t *)v13, 8u);
        }

        v10 = 0;
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    {
      sub_1003E97FC();
    }
    v10 = 1;
LABEL_14:
    if (__p)
    {
      v26 = __p;
      operator delete(__p);
    }
    if (v19)
    {
      v20 = v19;
      operator delete(v19);
    }
    return v10;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E97D0();
  return 0;
}

- (void)_handleRegionChangeForDevice:(unint64_t)a3 currentRegion:(optional<nearby::algorithms::region_monitoring::Region> *)a4 prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  optional<nearby::algorithms::region_monitoring::Region> *data;
  void *v16;
  NIRegionKey *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NIRegionKey *v21;
  void *v22;
  NSObject *v23;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_uniqueIdentifier;
  const char *v25;
  const char *v26;
  std::string *v27;
  __rep *p_p;
  std::string *v29;
  std::string *v30;
  __rep *v31;
  std::string *v32;
  uint64_t v33;
  void *v34;
  Logger *ptr;
  int v36;
  void *v37;
  void *v38;
  unsigned int v40;
  id WeakRetained;
  __rep __p;
  char v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  __rep v48;
  std::string v49;
  __rep buf;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  std::string *v55;
  __int16 v56;
  __rep *v57;
  __int16 v58;
  std::string *v59;

  v40 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v8;
  v12 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (WeakRetained)
  {
    if (LOBYTE(a4->var3))
    {
      data = a4;
      if (*((char *)&a4->var0.var1.var0.__r_.__value_.var0.var1 + 23) < 0)
        data = (optional<nearby::algorithms::region_monitoring::Region> *)a4->var0.var1.var0.__r_.__value_.var0.var1.__data_;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", data));
      if (!LOBYTE(a4->var3))
        sub_10000BA44();
      v17 = -[NIRegionKey initWithName:regionSizeCategory:]([NIRegionKey alloc], "initWithName:regionSizeCategory:", v16, *(int *)&a4->var0.var1.var0.__r_.var1);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_regionDict, "objectForKey:", v17));
      if (!v38 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003E9888();

    }
    else
    {
      v38 = 0;
    }
    if (*(_BYTE *)(v12 + 48))
    {
      v19 = v12;
      if (*(char *)(v12 + 23) < 0)
        v19 = *(_QWORD *)v12;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
      if (!*(_BYTE *)(v12 + 48))
        sub_10000BA44();
      v21 = -[NIRegionKey initWithName:regionSizeCategory:]([NIRegionKey alloc], "initWithName:regionSizeCategory:", v20, *(int *)(v12 + 28));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_regionDict, "objectForKey:", v21));
      if (!v22 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003E9888();

    }
    else
    {
      v22 = 0;
    }
    if ((v9 & 0xFF00000000) != 0)
      std::to_string(&v49, *(float *)&v9);
    else
      sub_10000BF04(&v49, "N/A");
    if ((v40 & 1) == 0)
    {
      sub_10000BF04(&__p, "NONE");
      sub_10000BF04(&v48, "NONE");
      if (*(_BYTE *)(v10 + 184))
      {
        sub_1002ED388();
        if (*((char *)&__p.var0.var1 + 23) < 0)
          operator delete(__p.var0.var1.__data_);
        __p = buf;
        if (!*(_BYTE *)(v10 + 184))
          sub_10000BA44();
        if (*(_BYTE *)(v10 + 72))
        {
          sub_1002ED388();
          if (*((char *)&v48.var0.var1 + 23) < 0)
            operator delete(v48.var0.var1.__data_);
          v48 = buf;
        }
      }
      v23 = (id)qword_10085F520;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v22;
        p_uniqueIdentifier = &self->_uniqueIdentifier;
        if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
          p_uniqueIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_uniqueIdentifier->__r_.__value_.var0.var1.__data_;
        v36 = *(unsigned __int8 *)(v12 + 48);
        if (*(_BYTE *)(v12 + 48))
        {
          sub_100322E10(v12);
          if (v47 >= 0)
            v25 = (const char *)&v46;
          else
            v25 = (const char *)v46;
        }
        else
        {
          v25 = "NONE";
        }
        if (LOBYTE(a4->var3))
        {
          sub_100322E10((uint64_t)a4);
          if (v45 >= 0)
            v26 = (const char *)&v44;
          else
            v26 = (const char *)v44;
          v27 = &v49;
          if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v27 = (std::string *)v49.__r_.__value_.__r.__words[0];
          p_p = &__p;
          if (*((char *)&__p.var0.var1 + 23) < 0)
            p_p = (__rep *)__p.var0.var1.__data_;
          v29 = (std::string *)&v48;
          if (*((char *)&v48.var0.var1 + 23) < 0)
            v29 = (std::string *)v48.var0.var1.__data_;
          *(_DWORD *)buf.var0.var0.__data_ = 136316674;
          *(char **)((char *)&buf.var0.var1.__data_ + 4) = (char *)p_uniqueIdentifier;
          WORD2(buf.var0.var1.__size_) = 2048;
          *(unint64_t *)((char *)&buf.var0.var1.__size_ + 6) = a3;
          *((_WORD *)&buf.var0.var1 + 11) = 2080;
          v51 = v25;
          v52 = 2080;
          v53 = v26;
          v54 = 2080;
          v55 = v27;
          v56 = 2080;
          v57 = p_p;
          v58 = 2080;
          v59 = v29;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor #region change ses_id: %s dev: 0x%llx from %s -> %s, intent score: %s, range_m: %s, rssi_dbm: %s", (uint8_t *)&buf, 0x48u);
          if (v45 < 0)
            operator delete(v44);
        }
        else
        {
          v30 = &v49;
          if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v30 = (std::string *)v49.__r_.__value_.__r.__words[0];
          v31 = &__p;
          if (*((char *)&__p.var0.var1 + 23) < 0)
            v31 = (__rep *)__p.var0.var1.__data_;
          v32 = (std::string *)&v48;
          if (*((char *)&v48.var0.var1 + 23) < 0)
            v32 = (std::string *)v48.var0.var1.__data_;
          *(_DWORD *)buf.var0.var0.__data_ = 136316674;
          *(char **)((char *)&buf.var0.var1.__data_ + 4) = (char *)p_uniqueIdentifier;
          WORD2(buf.var0.var1.__size_) = 2048;
          *(unint64_t *)((char *)&buf.var0.var1.__size_ + 6) = a3;
          *((_WORD *)&buf.var0.var1 + 11) = 2080;
          v51 = v25;
          v52 = 2080;
          v53 = "NONE";
          v54 = 2080;
          v55 = v30;
          v56 = 2080;
          v57 = v31;
          v58 = 2080;
          v59 = v32;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#spatialGesturesPredictor #region change ses_id: %s dev: 0x%llx from %s -> %s, intent score: %s, range_m: %s, rssi_dbm: %s", (uint8_t *)&buf, 0x48u);
        }
        v22 = v37;
        if (v36 && v47 < 0)
          operator delete(v46);
      }

      if (*((char *)&v48.var0.var1 + 23) < 0)
        operator delete(v48.var0.var1.__data_);
      if (*((char *)&__p.var0.var1 + 23) < 0)
        operator delete(__p.var0.var1.__data_);
    }
    if (*(_BYTE *)(v10 + 184))
      v33 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromRangeResult:](self, "nearbyObjectFromRangeResult:", v10));
    else
      v33 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromDeviceIdentifier:](self, "nearbyObjectFromDeviceIdentifier:", a3));
    v34 = (void *)v33;
    if (v33)
    {
      if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:") & 1) != 0)objc_msgSend(WeakRetained, "updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:", self, v34, v38, v22, v40);
      if (self->_protobufLogger.__ptr_)
      {
        sub_100268FEC(v34, (uint64_t)&buf);
        ptr = self->_protobufLogger.__ptr_;
        if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
          sub_100004678(&__p, self->_uniqueIdentifier.__r_.__value_.var0.var1.__data_, self->_uniqueIdentifier.__r_.__value_.var0.var1.__size_);
        else
          __p = self->_uniqueIdentifier.__r_.__value_;
        v43 = 1;
        sub_1002762D0((uint64_t)ptr, (const std::string *)&__p, (uint64_t)&buf, (std::string *)a4, (std::string *)v12, v9, v40, v11);
        if (v43 && *((char *)&__p.var0.var1 + 23) < 0)
          operator delete(__p.var0.var1.__data_);
        if (buf.var0.var1.__data_)
        {
          buf.var0.var1.__size_ = (unint64_t)buf.var0.var1.__data_;
          operator delete(buf.var0.var1.__data_);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003E9828();
    }

    if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v49.__r_.__value_.__l.__data_);

  }
  else
  {
    v18 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0.__data_ = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions, no delegate.", (uint8_t *)&buf, 2u);
    }
  }

}

- (void)_handleBoundedRegionRange:(double)a3 forDevice:(unint64_t)a4 rangeResult:(optional<nearby::algorithms::common::RangeResult> *)a5
{
  id WeakRetained;
  void *v9;
  void *v10;
  double val;
  void *v12;
  void *__p[20];
  void *v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (!a5->var1)
    sub_10000BA44();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromRangeResult:](self, "nearbyObjectFromRangeResult:", a5));
  v10 = v9;
  if (v9)
  {
    if (a5->var0.var1.var15.__engaged_)
    {
      val = a5->var0.var1.var15.var0.__val_;
      *(float *)&val = val;
      objc_msgSend(v9, "setBoundedRegionRange:", val);
    }
    if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
    {
      v14 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      objc_msgSend(WeakRetained, "updatesEngine:didUpdateNearbyObjects:", self, v12);

    }
    if (self->_protobufLogger.__ptr_)
    {
      if (a5->var0.var1.var15.__engaged_)
      {
        sub_100268FEC(v10, (uint64_t)__p);
        sub_10027601C((uint64_t)self->_protobufLogger.__ptr_, (const std::string *)&self->_uniqueIdentifier, (uint64_t)__p, a3);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E9828();
  }

}

- (void)_handleDeviceMonitorActivation:(BOOL)a3 forDevice:(unint64_t)a4 timestamp:(double)a5 regionSizeCategory:(int)a6 regions:(optional<std:(int)a8 :vector<nearby::algorithms::region_monitoring::Region>> *)a7 predictorType:
{
  _BOOL4 v13;
  NSObject *v15;
  Logger *ptr;

  v13 = a3;
  v15 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E9910(v13, a4, v15);
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    if (v13)
    {
      if (!a7->var1)
        sub_1003E98E8();
      sub_1002755E8((uint64_t)ptr, a4, a6, (std::string **)a7, a8, a5);
    }
    else
    {
      sub_100275900((uint64_t)ptr, a4);
    }
  }
}

- (void)processUWBResultForRegionMonitoring:(id)a3 roseSolution:(const void *)a4 processingOptions:(const AlgorithmProcessingOptions *)a5
{
  unsigned int v5;
  id v9;
  void *v10;
  double v11;
  float v12;
  unsigned int v13;
  float v14;
  float v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned __int16 v20;
  unsigned int convStateForObject_high;
  int intentPredictorConfiguration;
  int v23;
  unsigned int magneticFieldStrengthCheckOption;
  uint64_t v25;
  unsigned int v26;
  RangeBiasEstimatorSingleAntennaModel *rangeBiasEstimatorSingleAntennaModel;
  RegionMonitor *value;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  int64_t regionSizeCategory;
  int v41;
  BOOL v42;
  BOOL v43;
  char v44;
  double v45;
  NSObject *v46;
  int v47;
  unint64_t v48;
  id WeakRetained;
  void *v50;
  NINearbyUpdatesEngineDataSource *dataSource;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *__p[2];
  float v57;
  char v58;
  void *v59;
  uint8_t buf[8];
  _BYTE v61[12];
  _BYTE v62[20];
  char v63;
  char v64;
  char v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  unsigned int v75;
  char v76;
  __int16 v77;
  char v78;
  RangeBiasEstimatorSingleAntennaModel *v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v9 = a3;
  v10 = v9;
  if (!*((_BYTE *)a4 + 24))
    __assert_rtn("-[NINearbyUpdatesEngine processUWBResultForRegionMonitoring:roseSolution:processingOptions:]", "NIServerNearbyUpdatesEngine.mm", 1985, "solution.mach_continuous_time_sec.has_value()");
  v11 = *((double *)a4 + 2);
  objc_msgSend(v9, "distance");
  if (v12 != NINearbyObjectDistanceNotAvailable)
  {
    objc_msgSend(v10, "azimuth");
    v13 = 0;
    if (v14 == *(float *)&NINearbyObjectAzimuthNotAvailable
      || (objc_msgSend(v10, "elevation"), v15 == *(float *)&NINearbyObjectElevationNotAvailable))
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(v10, "azimuth");
      v13 = v16;
      objc_msgSend(v10, "elevation");
      v5 = v17;
      v18 = 0x100000001;
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "discoveryToken"));
    v55 = objc_msgSend(v54, "hash");
    if (self->_protobufLogger.__ptr_)
    {
      sub_100268FEC(v10, (uint64_t)__p);
      sub_100275B00((uint64_t)self->_protobufLogger.__ptr_, *((unsigned __int16 *)a4 + 18), *((_QWORD *)a4 + 5), (uint64_t)__p, (char)objc_msgSend(v10, "requiresBiasCorrection"), v11);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    v19 = objc_msgSend(v10, "remoteTxAntennaMask");
    if (v19 == NINearbyObjectRemoteTxAntennaMaskNotAvailable)
      v20 = 1;
    else
      v20 = (unsigned __int16)objc_msgSend(v10, "remoteTxAntennaMask");
    convStateForObject_high = HIDWORD(self->_convStateForObject);
    if (convStateForObject_high == 3)
    {
      intentPredictorConfiguration = a5->intentPredictorConfiguration;
      if (intentPredictorConfiguration == 2)
        v23 = 3;
      else
        v23 = 0;
      if (intentPredictorConfiguration == 1)
        convStateForObject_high = 1;
      else
        convStateForObject_high = v23;
    }
    else if (convStateForObject_high >= 2)
    {
      convStateForObject_high = 2;
    }
    magneticFieldStrengthCheckOption = a5->magneticFieldStrengthCheckOption;
    v25 = 0;
    v52 = v18;
    if (magneticFieldStrengthCheckOption == 1)
    {
      v26 = 0;
    }
    else
    {
      if (self->_cachedMagneticFieldStrength.var0.__null_state_)
      {
        rangeBiasEstimatorSingleAntennaModel = self->_rangeBiasEstimatorSingleAntennaModel;
        if (vabdd_f64(*(double *)&rangeBiasEstimatorSingleAntennaModel, v11) < 0.07)
        {
          v26 = magneticFieldStrengthCheckOption >> 8;
          v25 = *(_QWORD *)&self->_shouldBypassBiasCorrection;
LABEL_29:
          value = self->_regionMonitor.__ptr_.__value_;
          objc_msgSend(v10, "distance", v52);
          v30 = v29;
          objc_msgSend(v10, "signalStrength");
          v32 = v31;
          objc_msgSend(v10, "rangeBiasEstimate");
          if (v33 == *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable)
          {
            v34 = 0;
            v35 = 0;
          }
          else
          {
            objc_msgSend(v10, "rangeBiasEstimate");
            v35 = v36;
            v34 = 1;
          }
          objc_msgSend(v10, "rangeUncertainty");
          if (v37 == *(double *)&NINearbyObjectRangeUncertaintyNotAvailable)
          {
            v38 = 0;
            v39 = 0;
          }
          else
          {
            objc_msgSend(v10, "rangeUncertainty");
            v38 = 1;
          }
          regionSizeCategory = a5->regionSizeCategory;
          *(_QWORD *)buf = v55;
          v41 = magneticFieldStrengthCheckOption | (v26 << 8);
          *(double *)v61 = v11;
          v42 = v41 == 1;
          v43 = v41 != 1;
          *(_DWORD *)&v61[8] = v30;
          if (v42)
            v44 = 0;
          else
            v44 = magneticFieldStrengthCheckOption;
          *(_DWORD *)v62 = 1;
          *(_QWORD *)&v62[4] = v13 | ((unint64_t)v5 << 32);
          *(_QWORD *)&v62[12] = v53;
          v63 = 0;
          v64 = 0;
          v65 = 0;
          v66 = 0;
          v67 = v32;
          v68 = 1;
          v69 = v20 | 0x100;
          v70 = v35;
          v71 = v34;
          v72 = v39;
          v73 = v38;
          v74 = regionSizeCategory;
          v75 = convStateForObject_high;
          v76 = v44;
          v77 = v26;
          v78 = BYTE2(v26);
          v79 = rangeBiasEstimatorSingleAntennaModel;
          v80 = v25;
          v81 = v43;
          v82 = 0;
          v83 = 0;
          v84 = 0;
          sub_100355338((std::string::size_type)value, (uint64_t)buf, 0, (uint64_t)__p);
          if (v58)
          {
            *(float *)&v45 = v57;
            objc_msgSend(v10, "setDistance:", v45);
            objc_msgSend(v10, "setDistanceMeasurementQuality:", 1);
            objc_msgSend(v10, "setMotionState:", 0);
            objc_msgSend(v10, "setTimestamp:", v11);
            v46 = (id)qword_10085F520;
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              if (!v58)
                sub_10000BA44();
              v47 = *((unsigned __int16 *)a4 + 18);
              v48 = 0xBFF0000000000000;
              if (*((_BYTE *)a4 + 24))
                v48 = *((_QWORD *)a4 + 2);
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)&buf[4] = v47;
              *(_WORD *)v61 = 2048;
              *(_QWORD *)&v61[2] = v48;
              *(_WORD *)&v61[10] = 2048;
              *(_QWORD *)v62 = v55;
              *(_WORD *)&v62[8] = 2048;
              *(double *)&v62[10] = v57;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#regions filtered solution. {'ticket id': %d, 'cont time s': %0.3f, 'identifier': %llx, 'range_m': %0.2f}", buf, 0x26u);
            }

            if (self->_protobufLogger.__ptr_)
            {
              sub_100268FEC(v10, (uint64_t)buf);
              sub_100275D94((uint64_t)self->_protobufLogger.__ptr_, *((unsigned __int16 *)a4 + 18), *((_QWORD *)a4 + 5), (uint64_t)buf, v11);
              if (*(_QWORD *)buf)
              {
                *(_QWORD *)v61 = *(_QWORD *)buf;
                operator delete(*(void **)buf);
              }
            }
            if (v10)
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
              if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
              {
                v59 = v10;
                v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
                objc_msgSend(WeakRetained, "updatesEngine:didUpdateNearbyObjects:", self, v50);

              }
              dataSource = self->_dataSource;
              if (dataSource)
                -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](dataSource, "nearbyObjectUpdated:", v10);

            }
          }

          goto LABEL_54;
        }
      }
      v26 = 0;
      LOBYTE(magneticFieldStrengthCheckOption) = 1;
    }
    rangeBiasEstimatorSingleAntennaModel = 0;
    goto LABEL_29;
  }
LABEL_54:

}

- (void)acceptWiFiRangeResults:(const void *)a3
{
  -[NINearbyUpdatesEngine _handleWiFiRangeResults:](self, "_handleWiFiRangeResults:", a3);
}

- (void)_handleWiFiRangeResults:(const void *)a3
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  double v10;
  id WeakRetained;
  void *v12;
  double v13;
  float v14;
  Logger *ptr;
  id v16;
  id *v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NINearbyUpdatesEngineDataSource *dataSource;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t *v26;
  unordered_map<unsigned long long, NIDiscoveryToken *, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, NIDiscoveryToken *>>> *p_hashToTokenMap;
  id *p_configuration;
  id *location;
  _QWORD v30[2];
  float v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  int v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  _BYTE __p[22];
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  uint8_t buf[16];
  float v61;
  double v62;
  char v63;

  v3 = *(uint64_t **)a3;
  v26 = (uint64_t *)*((_QWORD *)a3 + 1);
  if (*(uint64_t **)a3 != v26)
  {
    location = (id *)&self->_previousNIObjectUpdate;
    p_hashToTokenMap = &self->_hashToTokenMap;
    p_configuration = (id *)&self->_configuration;
    while (1)
    {
      v5 = v3[3];
      if (v3[4] != v5)
        break;
LABEL_32:
      v3 += 7;
      if (v3 == v26)
        return;
    }
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = v5 + v6;
      v9 = *(_DWORD *)v8;
      v10 = sub_100008778(*(_QWORD *)(v8 + 16));
      WeakRetained = objc_loadWeakRetained(location);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "objectFromIdentifier:", *v3));

      if (!v12)
      {
        v23 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        {
          v24 = *v3;
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#nrby-eng,_handleWiFiRangeResult failed to create object from address 0x%llx ", buf, 0xCu);
        }
        goto LABEL_31;
      }
      v13 = (double)v9 * 0.0149896229;
      v14 = v13;
      *(float *)&v13 = v14;
      objc_msgSend(v12, "setDistance:", v13);
      objc_msgSend(v12, "setDirection:", *(double *)NINearbyObjectDirectionNotAvailable.i64);
      objc_msgSend(v12, "setDistanceMeasurementQuality:", 2);
      ptr = self->_protobufLogger.__ptr_;
      if (ptr)
        sub_1002742C0((uint64_t)ptr, *v3, *(unsigned __int8 *)(v3[3] + v6 + 8), *(unsigned __int8 *)(v3[3] + v6 + 9), v3[1], v14, v10);
      if (self->_regionMonitor.__ptr_.__value_)
      {
        v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "discoveryToken"));
        v51 = 0;
        v51 = objc_msgSend(v16, "hash");
        *(_QWORD *)buf = &v51;
        v17 = (id *)sub_1002F1E14((uint64_t)p_hashToTokenMap, (unint64_t *)&v51, (uint64_t)&unk_100472CF8, (_QWORD **)buf);
        objc_storeStrong(v17 + 3, v16);
        v30[0] = objc_msgSend(v16, "hash");
        *(double *)&v30[1] = v10;
        v31 = v14;
        v32 = 2;
        v35 = 0;
        v36 = 0;
        v37 = 0;
        v38 = 0;
        v33 = 0;
        v34 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0u;
        v43 = 0u;
        v44 = 0;
        v45 = 2;
        v46 = 0;
        v47 = 0;
        v48 = 0;
        v49 = 0;
        v50 = 0;
        sub_100355338((std::string::size_type)self->_regionMonitor.__ptr_.__value_, (uint64_t)v30, v7 == -1 - 0x5555555555555555 * ((v3[4] - v3[3]) >> 3), (uint64_t)buf);
        if (!v63)
        {
          v25 = qword_10085F520;
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__p = 134217984;
            *(double *)&__p[4] = v31;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#wifi_regions: measurement processed but no filtered solution returned, Distance: %f m", __p, 0xCu);
          }
          goto LABEL_30;
        }
        *(float *)&v18 = v61;
        objc_msgSend(v12, "setDistance:", v18);
        if (!v63)
          sub_10000BA44();
        if (v62 > 1.0 && v62 != -1.0)
          objc_msgSend(v12, "setDistanceMeasurementQuality:", 3, v62);
        if (self->_protobufLogger.__ptr_)
        {
          sub_100268FEC(v12, (uint64_t)__p);
          sub_100275D94((uint64_t)self->_protobufLogger.__ptr_, v3[1], *v3, (uint64_t)__p, v10);
          if (*(_QWORD *)__p)
          {
            *(_QWORD *)&__p[8] = *(_QWORD *)__p;
            operator delete(*(void **)__p);
          }
        }
        v19 = (id)qword_10085F520;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          if (!v63)
            sub_10000BA44();
          v20 = v3[1];
          *(_DWORD *)__p = 134219008;
          *(_QWORD *)&__p[4] = v20;
          *(_WORD *)&__p[12] = 2048;
          *(double *)&__p[14] = v10;
          v54 = 2048;
          v55 = (unint64_t)v51;
          v56 = 2048;
          v57 = v61;
          v58 = 2048;
          v59 = v62;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#wifi_regions: filtered solution. {'ticket id': %llu, 'cont time s': %0.3f, 'identifier': %llx, 'range_m': %0.2f, 'uncertainty: %0.2f}", __p, 0x34u);
        }

        objc_msgSend(v12, "setMotionState:", 0);
      }
      v16 = objc_loadWeakRetained(p_configuration);
      if ((objc_opt_respondsToSelector(v16, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
      {
        v52 = v12;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
        objc_msgSend(v16, "updatesEngine:didUpdateNearbyObjects:", self, v21);

      }
      dataSource = self->_dataSource;
      if (dataSource)
        -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](dataSource, "nearbyObjectUpdated:", v12);
LABEL_30:

LABEL_31:
      ++v7;
      v5 = v3[3];
      v6 += 24;
      if (0xAAAAAAAAAAAAAAABLL * ((v3[4] - v5) >> 3) <= v7)
        goto LABEL_32;
    }
  }
}

- (void)acceptVisionInput:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  int v12;
  double v13;
  uint64_t v14;
  Logger *ptr;
  NINearbyUpdatesEngineDataSource *dataSource;
  uint64_t v17;
  NINearbyUpdatesEngineDataSource *v18;
  NINearbyUpdatesEngineDataSource *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  NINearbyUpdatesEngineDataSource *v23;
  Logger *v24;
  double v25;
  double v26;
  int64_t var0;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char **v36;
  char v37;
  void *__p[20];
  uint64_t v39;
  void *v40;
  _BYTE __dst[384];
  uint64_t __src[48];
  _OWORD v43[8];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = v5;
  objc_msgSend(v4, "devicePose");
  v31 = v8;
  v32 = v7;
  v29 = v10;
  v30 = v9;
  v11 = objc_msgSend(v4, "trackingState");
  if (v11 == (id)2)
    v12 = 2;
  else
    v12 = v11 == (id)1;
  *(_QWORD *)&v44 = v6;
  v45 = v32;
  v46 = v31;
  v47 = v30;
  v48 = v29;
  LODWORD(v49) = v12;
  BYTE4(v49) = objc_msgSend(v4, "majorRelocalization");
  BYTE5(v49) = objc_msgSend(v4, "minorRelocalization");
  BYTE8(v49) = 0;
  LOBYTE(v50) = 0;
  BYTE8(v50) = 0;
  BYTE12(v50) = 0;
  LOBYTE(v51) = 0;
  BYTE4(v51) = 0;
  objc_msgSend(v4, "lightEstimate");
  if (v13 != *(double *)&NIARLightEstimateNotAvailable)
  {
    objc_msgSend(v4, "lightEstimate");
    *((_QWORD *)&v49 + 1) = v14;
    LOBYTE(v50) = 1;
  }
  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_100277FBC((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)&v44);
  dataSource = self->_dataSource;
  if (dataSource)
    -[NINearbyUpdatesEngineDataSource updateWithPose:](dataSource, "updateWithPose:", &v44);
  v17 = *(_QWORD *)&self->_uniqueIdentifier.__r_.var0;
  if (!v17)
    goto LABEL_27;
  sub_100308E04(v17, (uint64_t)&v44);
  v18 = self->_dataSource;
  if (v18)
  {
    v43[4] = v48;
    v43[5] = v49;
    v43[6] = v50;
    v43[7] = v51;
    v43[0] = v44;
    v43[1] = v45;
    v43[2] = v46;
    v43[3] = v47;
    -[NINearbyUpdatesEngineDataSource updateWithVIOPose:](v18, "updateWithVIOPose:", v43);
  }
  sub_10030AE88(*(_QWORD *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)__src);
  v19 = self->_dataSource;
  if (v19)
  {
    memcpy(__dst, __src, sizeof(__dst));
    -[NINearbyUpdatesEngineDataSource updateWithSASolution:](v19, "updateWithSASolution:", __dst);
  }
  if (!LOBYTE(__src[24]))
    goto LABEL_27;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromSolution:](self, "nearbyObjectFromSolution:", __src));
  if (v20)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
    if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
    {
      v40 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
      objc_msgSend(WeakRetained, "updatesEngine:didUpdateNearbyObjects:", self, v22);

    }
    v23 = self->_dataSource;
    if (v23)
      -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](v23, "nearbyObjectUpdated:", v20);
    v24 = self->_protobufLogger.__ptr_;
    if (v24)
    {
      objc_msgSend(v20, "timestamp");
      v26 = v25;
      sub_100268FEC(v20, (uint64_t)__p);
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = &v33;
      v37 = 0;
      v33 = (char *)operator new(0xA0uLL);
      v34 = (uint64_t)v33;
      v35 = v33 + 160;
      v34 = sub_1002F1C0C((uint64_t)&v35, (uint64_t)__p, (uint64_t)&v39, (uint64_t)v33);
      sub_100273D94((uint64_t)v24, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v33, v26);
      v36 = &v33;
      sub_1002F1D80((void ***)&v36);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

LABEL_27:
    var0 = self->_uniqueIdentifier.var0;
    if (var0)
    {
      if ((*(unsigned int (**)(int64_t))(*(_QWORD *)var0 + 56))(var0))
      {
        (*(void (**)(int64_t, __int128 *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 48))(self->_uniqueIdentifier.var0, &v44);
        if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 64))(self->_uniqueIdentifier.var0))
          -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
      }
    }
    goto LABEL_35;
  }
  v28 = (id)qword_10085F520;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    if (!LOBYTE(__src[24]))
      sub_10000BA44();
    sub_1003E99A0(&__src[1], (uint64_t)__p, v28);
  }

LABEL_35:
}

- (void)processUWBResultForSyntheticAperture:(id)a3 roseSolution:(const void *)a4
{
  float v4;
  id v7;
  id WeakRetained;
  unsigned int v9;
  BOOL v10;
  int v11;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  float v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  float v28;
  __int16 v29;
  __int16 v30;
  Logger *ptr;
  NINearbyUpdatesEngineDataSource *dataSource;
  NINearbyUpdatesEngineDataSource *v33;
  void *v34;
  SyntheticApertureFilter *value;
  void *v36;
  void *v37;
  SyntheticApertureFilter *v38;
  void *v39;
  NINearbyObject *v40;
  void *v41;
  NINearbyObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NINearbyUpdatesEngineDataSource *v46;
  Logger *v47;
  double v48;
  double v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_uniqueIdentifier;
  uint64_t v54;
  uint64_t v55;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  uint64_t v57[3];
  _OWORD v58[11];
  uint64_t v59;
  void **v60;
  _BYTE buf[22];
  __int16 v62;
  void *v63;
  void *v64;
  _BYTE __dst[384];
  uint64_t __src[48];
  _BYTE v67[32];
  _BYTE v68[32];
  __int128 v69;
  _BYTE v70[48];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v7 = a3;
  if (!*(_QWORD *)&self->_uniqueIdentifier.__r_.var0)
    __assert_rtn("-[NINearbyUpdatesEngine processUWBResultForSyntheticAperture:roseSolution:]", "NIServerNearbyUpdatesEngine.mm", 2293, "_syntheticApertureFilter != nullptr");
  WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (*((_BYTE *)a4 + 24))
  {
    v9 = *((_DWORD *)a4 + 8);
    v10 = v9 > 5;
    v11 = (1 << v9) & 0x25;
    if (v10 || v11 == 0)
    {
      if (*((_BYTE *)a4 + 752))
      {
        sub_1003C843C(__src);
        v21 = (id)qword_10085F520;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          if (!*((_BYTE *)a4 + 600) || !*((_BYTE *)a4 + 24))
            sub_10000BA44();
          v51 = *((_QWORD *)a4 + 44);
          v52 = *((_QWORD *)a4 + 2);
          p_uniqueIdentifier = &self->_uniqueIdentifier;
          if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
            p_uniqueIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_uniqueIdentifier->__r_.__value_.var0.var1.__data_;
          *(_DWORD *)v67 = 134219010;
          *(_QWORD *)&v67[4] = v51;
          *(_WORD *)&v67[12] = 2048;
          *(_QWORD *)&v67[14] = v52;
          *(_WORD *)&v67[22] = 2048;
          *(_QWORD *)&v67[24] = __src[7];
          *(_WORD *)v68 = 2048;
          *(_QWORD *)&v68[2] = __src[6];
          *(_WORD *)&v68[10] = 2080;
          *(_QWORD *)&v68[12] = p_uniqueIdentifier;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#nrby-eng,#sa_algo,New measurement with distance %4.3f m, timestamp %f, az %4.1f deg, and el %4.1f deg. Unique identifier: %s", v67, 0x34u);
        }

        v22 = sub_100030318(*(double *)&__src[7]);
        v4 = sub_100030318(*(double *)&__src[6]);
        sub_10003E3F0((uint64_t)&__src[2], (_QWORD *)__src[3]);
        v23 = 0x100000001;
      }
      else
      {
        v24 = (id)qword_10085F520;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          if (!*((_BYTE *)a4 + 600) || !*((_BYTE *)a4 + 24))
            sub_10000BA44();
          v54 = *((_QWORD *)a4 + 44);
          v55 = *((_QWORD *)a4 + 2);
          data = &self->_uniqueIdentifier;
          if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
            data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
          LODWORD(__src[0]) = 134218498;
          *(uint64_t *)((char *)__src + 4) = v54;
          WORD2(__src[1]) = 2048;
          *(uint64_t *)((char *)&__src[1] + 6) = v55;
          HIWORD(__src[2]) = 2080;
          __src[3] = (uint64_t)data;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#nrby-eng,#sa_algo,New measurement with distance %4.3f m, timestamp %f, no az or el. Unique identifier: %s", (uint8_t *)__src, 0x20u);
        }

        v23 = 0;
        v22 = 0.0;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryToken"));
      v26 = objc_msgSend(v25, "hash");
      if (!*((_BYTE *)a4 + 24) || !*((_BYTE *)a4 + 600))
        sub_10000BA44();
      v27 = *((_QWORD *)a4 + 2);
      v28 = *((double *)a4 + 44);
      v29 = *((_WORD *)a4 + 257);
      v30 = *((_WORD *)a4 + 280);
      *(_QWORD *)v67 = v26;
      *(_QWORD *)&v67[8] = v27;
      *(float *)&v67[16] = v28;
      *(_DWORD *)&v67[20] = 1;
      *(_QWORD *)&v67[24] = LODWORD(v22) | ((unint64_t)LODWORD(v4) << 32);
      *(_QWORD *)v68 = v23;
      v68[16] = 0;
      v68[20] = 0;
      v68[24] = 0;
      v68[28] = 0;
      v69 = 0uLL;
      *(_WORD *)v70 = 0;
      memset(&v70[8], 0, 32);
      *(_QWORD *)&v70[40] = 0x200000000;
      LOBYTE(v71) = 0;
      BYTE8(v72) = 0;
      LODWORD(v74) = 0;
      v73 = 0uLL;
      WORD2(v74) = v29;
      HIWORD(v74) = v30;

      ptr = self->_protobufLogger.__ptr_;
      if (ptr)
        sub_10027B57C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (float32x2_t *)v67);
      sub_10030A9D0(*(_QWORD *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)v67);
      dataSource = self->_dataSource;
      if (dataSource)
      {
        v58[9] = v72;
        v58[10] = v73;
        v58[4] = v69;
        v58[5] = *(_OWORD *)v70;
        v58[6] = *(_OWORD *)&v70[16];
        v59 = v74;
        v58[7] = *(_OWORD *)&v70[32];
        v58[8] = v71;
        v58[0] = *(_OWORD *)v67;
        v58[1] = *(_OWORD *)&v67[16];
        v58[2] = *(_OWORD *)v68;
        v58[3] = *(_OWORD *)&v68[16];
        -[NINearbyUpdatesEngineDataSource updateWithRangeResult:](dataSource, "updateWithRangeResult:", v58);
      }
      sub_10030AE88(*(_QWORD *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)__src);
      v33 = self->_dataSource;
      if (v33)
      {
        memcpy(__dst, __src, sizeof(__dst));
        -[NINearbyUpdatesEngineDataSource updateWithSASolution:](v33, "updateWithSASolution:", __dst);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine niConvergenceStateFromSolution:](self, "niConvergenceStateFromSolution:", __src));
      value = self->_syntheticApertureFilter.__ptr_.__value_;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryToken"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SyntheticApertureFilter objectForKeyedSubscript:](value, "objectForKeyedSubscript:", v36));

      if ((objc_msgSend(v37, "isEqual:", v34) & 1) == 0)
      {
        v38 = self->_syntheticApertureFilter.__ptr_.__value_;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryToken"));
        -[SyntheticApertureFilter setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v34, v39);

        v40 = [NINearbyObject alloc];
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "discoveryToken"));
        v42 = -[NINearbyObject initWithToken:](v40, "initWithToken:", v41);

        if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:") & 1) != 0)
          objc_msgSend(WeakRetained, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:", self, v34, v42);
        v43 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v34;
          v62 = 2112;
          v63 = v37;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#nrby-eng,#sa_algo,Updated convergence state for object: %@. New state: %@. Previous state: %@", buf, 0x20u);
        }

      }
      if (LOBYTE(__src[24]))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromSolution:](self, "nearbyObjectFromSolution:", __src));
        if (v44)
        {
          if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
          {
            v64 = v44;
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
            objc_msgSend(WeakRetained, "updatesEngine:didUpdateNearbyObjects:", self, v45);

          }
          v46 = self->_dataSource;
          if (v46)
            -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](v46, "nearbyObjectUpdated:", v44);
          v47 = self->_protobufLogger.__ptr_;
          if (v47)
          {
            objc_msgSend(v44, "timestamp");
            v49 = v48;
            sub_100268FEC(v44, (uint64_t)buf);
            sub_1002E9B24(v57, (uint64_t)buf, 1uLL);
            sub_100273D94((uint64_t)v47, (const std::string *)&self->_uniqueIdentifier, v57, v49);
            v60 = (void **)v57;
            sub_1002F1D80(&v60);
            if (*(_QWORD *)buf)
            {
              *(_QWORD *)&buf[8] = *(_QWORD *)buf;
              operator delete(*(void **)buf);
            }
          }
        }
        else
        {
          v50 = (id)qword_10085F520;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            if (!LOBYTE(__src[24]))
              sub_10000BA44();
            sub_1003E99A0(&__src[1], (uint64_t)buf, v50);
          }

        }
      }

    }
    else
    {
      v13 = (id)qword_10085F520;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if (!*((_BYTE *)a4 + 24))
          sub_10000BA44();
        sub_1003E9A54((uint64_t *)a4 + 2, (uint64_t)self, (uint64_t)__src, v13);
      }

    }
  }
  else
  {
    v14 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E99E0((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
  }

}

- (void)acceptPeerDeviceType:(BOOL)a3
{
  NINearbyUpdatesEngineDataSource *dataSource;

  dataSource = self->_dataSource;
  if (dataSource)
    -[NINearbyUpdatesEngineDataSource updateWithPeerDeviceType:](dataSource, "updateWithPeerDeviceType:", a3);
}

- (void)acceptDeviceMotionInput:(const void *)a3
{
  Logger *ptr;
  int64_t var0;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_10027837C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 80))(var0, a2))
  {
    sub_1001D0140(0x2B730444u, 1, 0, 0, 0, 0);
    (*(void (**)(int64_t, const void *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 72))(self->_uniqueIdentifier.var0, a3);
    sub_1001D0140(0x2B730444u, 2, 0, 0, 0, 0);
    if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 88))(self->_uniqueIdentifier.var0))
      -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
  }
}

- (void)acceptAltimeterData:(const AltimeterInput *)a3
{
  Logger *ptr;
  int64_t var0;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_1002787D8((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 104))(var0, a2))
    {
      sub_1001D0140(0x2B73044Cu, 1, 0, 0, 0, 0);
      (*(void (**)(int64_t, const AltimeterInput *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 96))(self->_uniqueIdentifier.var0, a3);
      sub_1001D0140(0x2B73044Cu, 2, 0, 0, 0, 0);
    }
  }
}

- (void)acceptGnssSatelliteData:(const void *)a3
{
  Logger *ptr;
  int64_t var0;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
    sub_1003E9AB4();
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_1002789E4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t))(*(_QWORD *)var0 + 192))(var0))
  {
    (*(void (**)(int64_t, const void *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 184))(self->_uniqueIdentifier.var0, a3);
    if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 200))(self->_uniqueIdentifier.var0))
      -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
  }
}

- (void)acceptSelfLocationData:(const LocationInput *)a3
{
  Logger *ptr;
  int64_t var0;
  NINearbyUpdatesEngineDataSource *dataSource;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_1002791D0((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3, 0);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 144))(var0, a2))
  {
    (*(void (**)(int64_t, const LocationInput *, _QWORD))(*(_QWORD *)self->_uniqueIdentifier.var0
                                                                          + 136))(self->_uniqueIdentifier.var0, a3, 0);
    if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 152))(self->_uniqueIdentifier.var0))
      -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
    dataSource = self->_dataSource;
    if (dataSource)
      -[NINearbyUpdatesEngineDataSource updateWithSelfLocation:](dataSource, "updateWithSelfLocation:", a3);
  }
}

- (void)acceptHeadingData:(const HeadingInput *)a3
{
  Logger *ptr;
  int64_t var0;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_1002797CC((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 168))(var0, a2))
  {
    (*(void (**)(int64_t, const HeadingInput *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 160))(self->_uniqueIdentifier.var0, a3);
    if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 176))(self->_uniqueIdentifier.var0))
      -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
  }
}

- (void)acceptDiscoveryEventForPeer:(id)a3
{
  double v4;
  double v5;
  Logger *ptr;
  int64_t var0;
  id v8;

  v8 = a3;
  if (self->_uniqueIdentifier.var0)
  {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
    -[NINearbyUpdatesEngine setFindingPeerToken:](self, "setFindingPeerToken:", v8);
  }
  v4 = sub_10000883C();
  v5 = v4;
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_100279C94((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v4);
  var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t))(*(_QWORD *)var0 + 120))(var0))
    {
      (*(void (**)(int64_t, double))(*(_QWORD *)self->_uniqueIdentifier.var0 + 112))(self->_uniqueIdentifier.var0, v5);
      if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 128))(self->_uniqueIdentifier.var0))
        -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
    }
  }

}

- (void)acceptPeerLocationData:(const LocationInput *)a3 forPeer:(id)a4
{
  Logger *ptr;
  int64_t var0;
  NINearbyUpdatesEngineDataSource *dataSource;
  id v9;

  v9 = a4;
  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_1002791D0((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3, 1);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t))(*(_QWORD *)var0 + 144))(var0))
  {
    (*(void (**)(int64_t, const LocationInput *, uint64_t))(*(_QWORD *)self->_uniqueIdentifier.var0
                                                                           + 136))(self->_uniqueIdentifier.var0, a3, 1);
    if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 152))(self->_uniqueIdentifier.var0))
      -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
    dataSource = self->_dataSource;
    if (dataSource)
      -[NINearbyUpdatesEngineDataSource updateWithPeerLocationFromFMF](dataSource, "updateWithPeerLocationFromFMF");
  }

}

- (void)acceptPedometerData:(const PedometerDataInput *)a3
{
  Logger *ptr;
  int64_t var0;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_100278D80((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 232))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E9AE0();
    (*(void (**)(int64_t, const PedometerDataInput *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 224))(self->_uniqueIdentifier.var0, a3);
  }
}

- (void)acceptPedometerEvent:(const PedometerEventInput *)a3
{
  Logger *ptr;
  int64_t var0;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_100278FC4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 248))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E9B0C();
    (*(void (**)(int64_t, const PedometerEventInput *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 240))(self->_uniqueIdentifier.var0, a3);
  }
}

- (void)acceptMotionActivity:(const MotionActivityInput *)a3
{
  Logger *ptr;
  int64_t var0;

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_1002799D8((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 216))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E9B38();
    (*(void (**)(int64_t, const MotionActivityInput *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 208))(self->_uniqueIdentifier.var0, a3);
  }
}

- (void)acceptPeerData:(const void *)a3 fromPeer:(id)a4
{
  id v6;
  NSObject *v7;
  Logger *ptr;
  NINearbyUpdatesEngineDataSource *dataSource;
  int64_t var0;
  uint64_t v11[22];

  v6 = a4;
  v7 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nrby-eng,acceptPeerData:FromPeer:", (uint8_t *)v11, 2u);
  }
  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  sub_10026230C((uint64_t)a3, (uint64_t)v11);
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
    sub_100279E9C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v11);
  dataSource = self->_dataSource;
  if (dataSource)
    -[NINearbyUpdatesEngineDataSource updateWithFinderPeerData:](dataSource, "updateWithFinderPeerData:", v11);
  var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t))(*(_QWORD *)var0 + 280))(var0))
    {
      -[NINearbyUpdatesEngine setFindingPeerToken:](self, "setFindingPeerToken:", v6);
      sub_1001D0140(0x2B730448u, 1, 0, 0, 0, 0);
      (*(void (**)(int64_t, uint64_t *))(*(_QWORD *)self->_uniqueIdentifier.var0 + 272))(self->_uniqueIdentifier.var0, v11);
      sub_1001D0140(0x2B730448u, 2, 0, 0, 0, 0);
      if ((*(unsigned int (**)(int64_t))(*(_QWORD *)self->_uniqueIdentifier.var0 + 288))(self->_uniqueIdentifier.var0))
        -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", 0);
    }
  }

}

- (void)acceptDevicePDRInput:(const void *)a3
{
  Logger *ptr;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  NINearbyUpdatesEngineDataSource *dataSource;
  int64_t var0;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[10];

  if (self->_uniqueIdentifier.var0)
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    v6 = *((_OWORD *)a3 + 7);
    v29[6] = *((_OWORD *)a3 + 6);
    v29[7] = v6;
    v7 = *((_OWORD *)a3 + 9);
    v29[8] = *((_OWORD *)a3 + 8);
    v29[9] = v7;
    v8 = *((_OWORD *)a3 + 3);
    v29[2] = *((_OWORD *)a3 + 2);
    v29[3] = v8;
    v9 = *((_OWORD *)a3 + 5);
    v29[4] = *((_OWORD *)a3 + 4);
    v29[5] = v9;
    v10 = *((_OWORD *)a3 + 1);
    v29[0] = *(_OWORD *)a3;
    v29[1] = v10;
    sub_10027A3E8((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)v29);
  }
  dataSource = self->_dataSource;
  if (dataSource)
    -[NINearbyUpdatesEngineDataSource updateWithPDR:](dataSource, "updateWithPDR:", a3);
  var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(_QWORD *)var0 + 264))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E9B64();
    if (LOBYTE(self->_cachedMagneticFieldStrength.var0.__val_.value))
    {
      v15 = *((_OWORD *)a3 + 7);
      v25 = *((_OWORD *)a3 + 6);
      v26 = v15;
      v16 = *((_OWORD *)a3 + 9);
      v27 = *((_OWORD *)a3 + 8);
      v28 = v16;
      v17 = *((_OWORD *)a3 + 3);
      v21 = *((_OWORD *)a3 + 2);
      v22 = v17;
      v18 = *((_OWORD *)a3 + 5);
      v23 = *((_OWORD *)a3 + 4);
      v24 = v18;
      v19 = *((_OWORD *)a3 + 1);
      v20[0] = *(_OWORD *)a3;
      v20[1] = v19;
      if ((_BYTE)v21)
        LOBYTE(v21) = 0;
      if ((_BYTE)v22)
        LOBYTE(v22) = 0;
      if ((_BYTE)v23)
        LOBYTE(v23) = 0;
      (*(void (**)(int64_t, _OWORD *, uint64_t, uint64_t))(*(_QWORD *)self->_uniqueIdentifier.var0
                                                                         + 256))(self->_uniqueIdentifier.var0, v20, v13, v14);
    }
    else
    {
      (*(void (**)(int64_t, const void *, uint64_t, uint64_t))(*(_QWORD *)self->_uniqueIdentifier.var0
                                                                             + 256))(self->_uniqueIdentifier.var0, a3, v13, v14);
    }
  }
}

- (void)acceptWatchOrientation:(const WatchOrientationInput *)a3
{
  int64_t var0;

  var0 = self->_uniqueIdentifier.var0;
  if (var0)
    (*(void (**)(int64_t, const WatchOrientationInput *))(*(_QWORD *)var0 + 320))(var0, a3);
}

- (void)setFindingPeerToken:(id)a3
{
  id v4;
  NIDiscoveryToken *v5;
  uint64_t *p_findingPeerToken;
  NIDiscoveryToken *findingPeerToken;
  NSObject *v8;
  void *v9;

  v4 = a3;
  findingPeerToken = self->_findingPeerToken;
  p_findingPeerToken = (uint64_t *)&self->_findingPeerToken;
  v5 = findingPeerToken;
  if (findingPeerToken)
  {
    if (!-[NIDiscoveryToken isEqual:](v5, "isEqual:", v4))
    {
      v8 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003E9B90(p_findingPeerToken, (uint64_t)v4, v8);
    }
  }
  v9 = (void *)*p_findingPeerToken;
  *p_findingPeerToken = (uint64_t)v4;

}

- (AoARad)_convertFromPointingCoordinatesToSpatial:(const void *)a3
{
  float v4;
  float v5;
  float v6;
  __float2 v7;
  float v8;
  float v9;
  AoARad result;

  v4 = sub_100030318(*((double *)a3 + 7));
  v5 = sub_100030318(*((double *)a3 + 6));
  v6 = cosf(v4);
  v7 = __sincosf_stret(v5);
  v8 = atan2f(v6 * v7.__cosval, -(float)(v6 * v7.__sinval));
  v9 = v4;
  result.var1 = v8;
  result.var0 = v9;
  return result;
}

- (id)nearbyObjectFromSolution:(const void *)a3 forPeer:(id)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromToken:](self, "nearbyObjectFromToken:", a4));
  if (v6)
  {
    if (*((_BYTE *)a3 + 192))
      -[NINearbyUpdatesEngine fillNearbyObject:fromRangeResult:](self, "fillNearbyObject:fromRangeResult:", v6, (char *)a3 + 8);
    -[NINearbyUpdatesEngine fillNearbyObject:fromSolution:](self, "fillNearbyObject:fromSolution:", v6, a3);
    v7 = v6;
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E9C14();
  }

  return v6;
}

- (id)nearbyObjectFromToken:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E9C40();
    goto LABEL_9;
  }
  v7 = objc_msgSend(WeakRetained, "identifierFromDiscoveryToken:", v4);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E9C6C();
LABEL_9:
    v10 = 0;
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectFromIdentifier:", v7));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
  {
    sub_1003E9CCC();
  }

LABEL_13:
  return v10;
}

- (id)nearbyObjectFromDeviceIdentifier:(unint64_t)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v11;
  uint8_t buf[4];
  unint64_t v13;

  v11 = a3;
  v4 = sub_1000550B8(&self->_hashToTokenMap.__table_.__bucket_list_.__ptr_.__value_, &v11);
  if (v4)
  {
    v5 = (id)v4[3];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromToken:](self, "nearbyObjectFromToken:", v5));
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    {
      sub_1003E9D2C();
    }

    return v7;
  }
  else
  {
    v9 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#nrby-eng,nearbyObjectFromDeviceIdentifier - failed to find token mapped to hash: %llu", buf, 0xCu);
    }
    return 0;
  }
}

- (id)nearbyObjectFromRangeResult:(const void *)a3
{
  void *v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  uint8_t v10[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromDeviceIdentifier:](self, "nearbyObjectFromDeviceIdentifier:", *(_QWORD *)a3));
  if (v5)
    goto LABEL_5;
  v6 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#nrby-eng,attempting to get NIObject from session's database", v10, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "objectFromIdentifier:", *(_QWORD *)a3));

  v5 = (void *)v8;
  if (v8)
LABEL_5:
    -[NINearbyUpdatesEngine fillNearbyObject:fromRangeResult:](self, "fillNearbyObject:fromRangeResult:", v5, a3);
  return v5;
}

- (id)niConvergenceStateFromSolution:(const void *)a3
{
  uint64_t v4;
  NIAlgorithmConvergenceState *v5;

  if (*(_DWORD *)a3 == 1)
    v4 = 2;
  else
    v4 = *(_DWORD *)a3 == 0;
  v5 = -[NIAlgorithmConvergenceState initWithConvergenceStatus:]([NIAlgorithmConvergenceState alloc], "initWithConvergenceStatus:", v4);
  -[NIAlgorithmConvergenceState setInsufficientMovement:](v5, "setInsufficientMovement:", *((unsigned __int8 *)a3 + 4));
  -[NIAlgorithmConvergenceState setInsufficientHorizontalSweep:](v5, "setInsufficientHorizontalSweep:", *((unsigned __int8 *)a3 + 5));
  -[NIAlgorithmConvergenceState setInsufficientVerticalSweep:](v5, "setInsufficientVerticalSweep:", *((unsigned __int8 *)a3 + 6));
  -[NIAlgorithmConvergenceState setInsufficientLighting:](v5, "setInsufficientLighting:", *((unsigned __int8 *)a3 + 7));
  return v5;
}

- (void)fillNearbyObject:(id)a3 fromRangeResult:(const void *)a4
{
  id v5;
  double v6;
  int v7;
  uint64_t v8;

  v5 = a3;
  LODWORD(v6) = *((_DWORD *)a4 + 4);
  objc_msgSend(v5, "setDistance:", v6);
  v7 = *((_DWORD *)a4 + 5) - 1;
  if (v7 < 4)
    objc_msgSend(v5, "setDistanceMeasurementQuality:", qword_1004779A8[v7]);
  if (*((_BYTE *)a4 + 36))
  {
    v8 = *((_QWORD *)a4 + 3);
    objc_msgSend(v5, "setDirection:", sub_10003F09C((float *)&v8));
  }

}

- (void)fillNearbyObject:(id)a3 fromSolution:(const void *)a4
{
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (*((_BYTE *)a4 + 208))
  {
    v5 = *((double *)a4 + 25) * 0.0174532925;
    *(float *)&v5 = v5;
    objc_msgSend(v9, "setHorizontalAngle:", v5);
  }
  if (*((_BYTE *)a4 + 328))
  {
    v6 = *((double *)a4 + 40) * 0.0174532925;
    *(float *)&v6 = v6;
    objc_msgSend(v9, "setHorizontalAngleAccuracy:", v6);
  }
  if (*((_DWORD *)a4 + 58) <= 4u)
    objc_msgSend(v9, "setVerticalDirectionEstimate:");
  if (*((_BYTE *)a4 + 272))
    objc_msgSend(v9, "setDirection:", *((double *)a4 + 32));
  if (*((_BYTE *)a4 + 304))
    objc_msgSend(v9, "setWorldPosition:", *((double *)a4 + 36));
  if (*((_BYTE *)a4 + 368))
  {
    v7 = *((unsigned int *)a4 + 91);
    if (v7 <= 7)
      objc_msgSend(v9, "setAlgorithmSource:", v7 + 1);
  }
  if (!*((_BYTE *)a4 + 376))
  {
    v8 = 0;
    goto LABEL_18;
  }
  v8 = *((unsigned int *)a4 + 93);
  if (v8 <= 2)
LABEL_18:
    objc_msgSend(v9, "setMotionState:", v8);
  if (*((_BYTE *)a4 + 380))
    objc_msgSend(v9, "setResetARSession:", 1);
  if (*((_BYTE *)a4 + 381))
    objc_msgSend(v9, "setRevokeFindingExperience:", 1);

}

- (id)nearbyObjectFromSolution:(const void *)a3
{
  uint64_t *v5;
  void *v6;
  id v7;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  if (!*((_BYTE *)a3 + 192))
    return 0;
  v5 = (uint64_t *)((char *)a3 + 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromRangeResult:](self, "nearbyObjectFromRangeResult:", (char *)a3 + 8));
  if (v6)
  {
    -[NINearbyUpdatesEngine fillNearbyObject:fromSolution:](self, "fillNearbyObject:fromSolution:", v6, a3);
    v7 = v6;
  }
  else
  {
    v9 = (id)qword_10085F520;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (!*((_BYTE *)a3 + 192))
        sub_10000BA44();
      v10 = *v5;
      v11 = 134217984;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#nrby-eng,no object for identifier 0x%llx", (uint8_t *)&v11, 0xCu);
    }

  }
  return v6;
}

- (void)logSolution:(const void *)a3
{
  float v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  char v14[24];
  uint64_t v15;
  _QWORD v16[10];
  char v17;
  uint64_t v18;
  _BYTE v19[24];

  sub_100210A10((uint64_t)&v15);
  sub_100054C60(&v15, (uint64_t)"#solutionDebug: ", 16);
  sub_100054C60(&v15, (uint64_t)"Range ", 6);
  if (!*((_BYTE *)a3 + 192) || (v4 = *((float *)a3 + 6), v4 == 1.1755e-38))
  {
    sub_100054C60(&v15, (uint64_t)"-, ", 3);
  }
  else
  {
    v5 = v15;
    *(_DWORD *)((char *)v16 + *(_QWORD *)(v15 - 24)) = *(_DWORD *)((_BYTE *)v16 + *(_QWORD *)(v15 - 24)) & 0xFFFFFEFB | 4;
    *(_QWORD *)((char *)&v16[1] + *(_QWORD *)(v5 - 24)) = 2;
    v6 = (_QWORD *)std::ostream::operator<<(v4);
    sub_100054C60(v6, (uint64_t)" m, ", 4);
  }
  sub_100054C60(&v15, (uint64_t)"Horizontal angle ", 17);
  if (*((_BYTE *)a3 + 208))
  {
    v7 = v15;
    *(_DWORD *)((char *)v16 + *(_QWORD *)(v15 - 24)) = *(_DWORD *)((_BYTE *)v16 + *(_QWORD *)(v15 - 24)) & 0xFFFFFEFB | 4;
    *(_QWORD *)((char *)&v16[1] + *(_QWORD *)(v7 - 24)) = 2;
    v8 = (_QWORD *)std::ostream::operator<<(&v15);
    sub_100054C60(v8, (uint64_t)" deg, ", 6);
  }
  else
  {
    sub_100054C60(&v15, (uint64_t)"-, ", 3);
  }
  sub_100054C60(&v15, (uint64_t)"Horizontal angle unc ", 21);
  if (*((_BYTE *)a3 + 328))
  {
    v9 = v15;
    *(_DWORD *)((char *)v16 + *(_QWORD *)(v15 - 24)) = *(_DWORD *)((_BYTE *)v16 + *(_QWORD *)(v15 - 24)) & 0xFFFFFEFB | 4;
    *(_QWORD *)((char *)&v16[1] + *(_QWORD *)(v9 - 24)) = 2;
    v10 = (_QWORD *)std::ostream::operator<<(&v15);
    sub_100054C60(v10, (uint64_t)" deg, ", 6);
  }
  else
  {
    sub_100054C60(&v15, (uint64_t)"-, ", 3);
  }
  sub_100054C60(&v15, (uint64_t)"Vertical state ", 15);
  v11 = *((int *)a3 + 58);
  if (v11 <= 4)
    sub_100054C60(&v15, (uint64_t)(&off_1008150D0)[v11], qword_1004779C8[v11]);
  sub_100054C60(&v15, (uint64_t)", Algorithm source ", 19);
  if (*((_BYTE *)a3 + 368))
  {
    v12 = *((int *)a3 + 91);
    if (v12 <= 7)
      sub_100054C60(&v15, (uint64_t)(&off_1008150F8)[v12], qword_1004779F0[v12]);
  }
  v13 = (id)qword_10085F520;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str(v16);
    sub_1003E9D8C(v14, (uint64_t)v19, v13);
  }

  if (v17 < 0)
    operator delete((void *)v16[8]);
  std::streambuf::~streambuf(v16);
  std::ios::~ios(&v18);
}

- (void)getPeerDataFromFindingContainerWithToken:(id)a3
{
  id v4;
  void *v5;
  Logger *ptr;
  NINearbyUpdatesEngineDataSource *dataSource;
  id WeakRetained;
  _BYTE v9[176];
  uint64_t v10[22];

  v4 = a3;
  v5 = v4;
  if (self->_uniqueIdentifier.var0)
  {
    objc_msgSend(v4, "hash");
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEBUG))
      sub_1003E9DF4();
    (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)self->_uniqueIdentifier.var0 + 8))(v10);
    sub_100261EE8((uint64_t)v10, (uint64_t)v9);
    ptr = self->_protobufLogger.__ptr_;
    if (ptr)
      sub_100279E9C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v10);
    dataSource = self->_dataSource;
    if (dataSource)
      -[NINearbyUpdatesEngineDataSource updateWithFindeePeerData:](dataSource, "updateWithFindeePeerData:", v10);
    WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
    if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateFindeeData:forToken:") & 1) != 0)
      objc_msgSend(WeakRetained, "updatesEngine:didUpdateFindeeData:forToken:", self, v9, v5);

  }
}

- (void)probeRegions
{
  RegionMonitor *value;
  double v3;

  value = self->_regionMonitor.__ptr_.__value_;
  if (value)
  {
    v3 = sub_10000883C();
    sub_100355A24((uint64_t)value, v3);
  }
}

- (NIConfiguration)configuration
{
  return *(NIConfiguration **)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
}

- (NINearbyUpdatesEngineDataSource)dataSource
{
  return (NINearbyUpdatesEngineDataSource *)objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_previousNIObjectUpdate, a3);
}

- (NINearbyUpdatesEngineDelegate)delegate
{
  return (NINearbyUpdatesEngineDelegate *)objc_loadWeakRetained((id *)&self->_configuration);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_configuration, a3);
}

- (NIServerAnalyticsManager)analyticsManager
{
  return (NIServerAnalyticsManager *)self->_dataSource;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  int64_t var0;
  uint64_t v4;

  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_configuration);
  objc_destroyWeak((id *)&self->_previousNIObjectUpdate);
  objc_storeStrong((id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds, 0);
  objc_storeStrong((id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds, 0);
  objc_storeStrong((id *)&self->_findingAlgorithmContainer.__ptr_.__value_, 0);
  objc_storeStrong((id *)&self->_syntheticApertureFilter.__ptr_.__value_, 0);
  var0 = self->_uniqueIdentifier.var0;
  self->_uniqueIdentifier.var0 = 0;
  if (var0)
    (*(void (**)(int64_t))(*(_QWORD *)var0 + 368))(var0);
  v4 = *(_QWORD *)&self->_uniqueIdentifier.__r_.var0;
  *(_QWORD *)&self->_uniqueIdentifier.__r_.var0 = 0;
  if (v4)
    sub_1002F185C((uint64_t)&self->_uniqueIdentifier.__r_.var0, v4);
  if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_uniqueIdentifier.__r_.__value_.var0.var1.__data_);
  sub_10001AE68((uint64_t)&self->_protobufLogger);
  objc_storeStrong((id *)&self->_findingPeerToken, 0);
  sub_10018839C((uint64_t)&self->_hashToTokenMap);
  objc_storeStrong((id *)&self->_regionDict, 0);
  sub_1002EB860((uint64_t *)&self->_regionMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  *((_BYTE *)self + 168) = 0;
  *((_BYTE *)self + 184) = 0;
  *((_BYTE *)self + 200) = 0;
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 26) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_QWORD *)self + 17) = 0;
  return self;
}

@end
