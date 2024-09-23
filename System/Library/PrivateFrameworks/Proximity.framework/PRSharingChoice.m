@implementation PRSharingChoice

- (PRSharingChoice)init
{
  -[PRSharingChoice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PRSharingChoice)initWithQueue:(id)a3
{
  id v5;
  PRSharingChoice *v6;
  PRSharingChoice *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *scores;
  NSData *lastBigHeadMacAddress;
  uint64_t v16;
  NSSortDescriptor *scoreSortDescriptor;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PRSharingChoice;
  v6 = -[PRSharingChoice init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    *(_WORD *)&v7->_useRegionBasedEstimator = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    scores = v7->_scores;
    v7->_scores = v8;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v7->_lastScoreReportMachContinuousTime = _Q0;
    lastBigHeadMacAddress = v7->_lastBigHeadMacAddress;
    v7->_lastBigHeadMacAddress = 0;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("score"), 0);
    scoreSortDescriptor = v7->_scoreSortDescriptor;
    v7->_scoreSortDescriptor = (NSSortDescriptor *)v16;

  }
  return v7;
}

- (void)createEstimators
{
  unique_ptr<SharingImportanceManager, std::default_delete<SharingImportanceManager>> *p_estimatorRangeOnly;
  NSObject *logger;
  SharingImportanceManager *v5;
  uint8_t v6[16];

  p_estimatorRangeOnly = &self->_estimatorRangeOnly;
  if (!self->_estimatorRangeOnly.__ptr_.__value_)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "Initializing SharingImportanceManager", v6, 2u);
    }
    v5 = (SharingImportanceManager *)operator new();
    SharingImportanceManager::SharingImportanceManager(v5, self->_useRegionBasedEstimator, 0);
    std::unique_ptr<SharingImportanceManager>::reset[abi:ne180100](&p_estimatorRangeOnly->__ptr_.__value_, v5);
  }
}

- (void)addRoseSolutions:(id)a3 currentMachContTime:(double)a4
{
  NSObject *logger;
  OS_os_log *v6;
  std::string::size_type v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD **v15;
  _QWORD *v16;
  _QWORD **v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  id *p_isa;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  std::string::size_type v27;
  NSObject *v28;
  std::string::size_type v29;
  NSObject *v30;
  const char *v31;
  std::string::size_type v32;
  std::string::size_type v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  __CFString *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  id v62;
  PRSharingChoice *v63;
  id obj;
  std::string::size_type v65;
  int64x2_t v66;
  uint64_t v67;
  uint64_t v68;
  std::string __str;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t *v78;
  _QWORD *v79[2];
  std::string buf;
  uint64_t v81;
  __int16 v82;
  _BYTE v83[30];
  const char *v84;
  _BYTE v85[10];
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  uint64_t v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v61 = a4;
  v104 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(double *)((char *)buf.__r_.__value_.__r.__words + 4) = v61;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "addRoseSolutions: current mach continuous time %lf", (uint8_t *)&buf, 0xCu);
  }
  v79[0] = 0;
  v79[1] = 0;
  v78 = (uint64_t *)v79;
  v6 = self->_logger;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v62, "count");
    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v7;
    _os_log_impl(&dword_19BF46000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Got %lu solutions", (uint8_t *)&buf, 0xCu);
  }

  v63 = self;
  v77 = 0u;
  v75 = 0u;
  v76 = 0u;
  v74 = 0u;
  v8 = v62;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v103, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v75;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v75 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v11);
        __str.__r_.__value_.__r.__words[0] = 0;
        v13 = objc_msgSend(v12, "mac_addr", *(_QWORD *)&v61);
        __str.__r_.__value_.__r.__words[0] = v13;
        v14 = v79[0];
        if (!v79[0])
          goto LABEL_19;
        v15 = v79;
        do
        {
          v16 = v14;
          v17 = v15;
          v18 = v14[4];
          v19 = v14 + 1;
          if (v18 >= v13)
          {
            v19 = v16;
            v15 = (_QWORD **)v16;
          }
          v14 = (_QWORD *)*v19;
        }
        while (v14);
        if (v15 == v79)
          goto LABEL_19;
        if (v18 < v13)
          v16 = v17;
        if (v13 >= v16[4])
        {
          if (objc_msgSend(v12, "variant") == 1)
          {
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
            *((_BYTE *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40) = 1;
          }
        }
        else
        {
LABEL_19:
          v20 = objc_msgSend(v12, "variant");
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
          *((_BYTE *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40) = v20 == 1;
        }
        ++v11;
      }
      while (v11 != v9);
      v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v74, v103, 16);
      v9 = v21;
    }
    while (v21);
  }

  p_isa = (id *)&v63->super.isa;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v8;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v102, 16);
  if (v23)
  {
    v67 = *(_QWORD *)v71;
    v66 = vdupq_n_s64(0x7FF4000000000000uLL);
    do
    {
      v68 = v23;
      for (i = 0; i != v68; ++i)
      {
        if (*(_QWORD *)v71 != v67)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        if (objc_msgSend(v25, "variant", *(_QWORD *)&v61) != 1)
        {
          __str.__r_.__value_.__r.__words[0] = objc_msgSend(v25, "mac_addr");
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
          if (*((_BYTE *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40))continue;
        }
        __str.__r_.__value_.__r.__words[0] = objc_msgSend(v25, "mac_addr");
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
        if (!*((_BYTE *)std::__tree<std::__value_type<unsigned long long,BOOL>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,BOOL>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(&v78, (unint64_t *)&__str, (uint64_t)&std::piecewise_construct, &buf)+ 40))
        {
          v26 = p_isa[14];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = objc_msgSend(v25, "mac_addr");
            LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v27;
            _os_log_impl(&dword_19BF46000, v26, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Using raw measurement solution for MAC: 0x%016llx", (uint8_t *)&buf, 0xCu);
          }

        }
        if (objc_msgSend(v25, "variant") == 1)
        {
          v28 = p_isa[14];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = objc_msgSend(v25, "mac_addr");
            LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v29;
            _os_log_impl(&dword_19BF46000, v28, OS_LOG_TYPE_DEFAULT, "PRSharingSession: Using sensor-fused measurement solution for MAC: 0x%016llx", (uint8_t *)&buf, 0xCu);
          }

        }
        v30 = p_isa[14];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = "false";
          v32 = objc_msgSend(v25, "mac_addr");
          objc_msgSend(v25, "mach_absolute_time_sec");
          v65 = v33;
          if (objc_msgSend(v25, "mach_continuous_time_valid"))
            v34 = "true";
          else
            v34 = "false";
          objc_msgSend(v25, "mach_continuous_time_sec");
          v36 = v35;
          objc_msgSend(v25, "range_m");
          v38 = v37;
          objc_msgSend(v25, "range_unc_m");
          v40 = v39;
          if (objc_msgSend(v25, "az_valid"))
            v41 = "true";
          else
            v41 = "false";
          objc_msgSend(v25, "az_deg");
          v43 = v42;
          objc_msgSend(v25, "az_unc_deg");
          v45 = v44;
          if (objc_msgSend(v25, "el_valid"))
            v31 = "true";
          objc_msgSend(v25, "el_deg");
          v47 = v46;
          objc_msgSend(v25, "el_unc_deg");
          v49 = v48;
          objc_msgSend(v25, "fov_confidence");
          v51 = v50;
          v52 = objc_msgSend(v25, "antenna_type");
          v53 = CFSTR("InvalidEnumValue");
          if (v52 <= 4)
            v53 = off_1E3D04DC0[v52];
          v54 = -[__CFString UTF8String](v53, "UTF8String");
          v55 = objc_msgSend(v25, "soi_rssi_valid");
          objc_msgSend(v25, "soi_rssi_dbm");
          LODWORD(buf.__r_.__value_.__l.__data_) = 134221826;
          v57 = "false";
          if (v55)
            v57 = "true";
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v32;
          WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v65;
          HIWORD(buf.__r_.__value_.__r.__words[2]) = 2080;
          v81 = (uint64_t)v34;
          v82 = 2048;
          *(_QWORD *)v83 = v36;
          *(_WORD *)&v83[8] = 2048;
          *(_QWORD *)&v83[10] = v38;
          *(_WORD *)&v83[18] = 2048;
          *(_QWORD *)&v83[20] = v40;
          *(_WORD *)&v83[28] = 2080;
          v84 = v41;
          *(_WORD *)v85 = 2048;
          *(_QWORD *)&v85[2] = v43;
          v86 = 2048;
          v87 = v45;
          v88 = 2080;
          v89 = v31;
          v90 = 2048;
          v91 = v47;
          v92 = 2048;
          v93 = v49;
          v94 = 2048;
          v95 = v51;
          v96 = 2080;
          v97 = v54;
          v98 = 2080;
          v99 = v57;
          v100 = 2048;
          v101 = v56;
          _os_log_impl(&dword_19BF46000, v30, OS_LOG_TYPE_DEFAULT, "PRSharingSession: new PRRoseSolution sent to estimator:\n MAC: 0x%016llx\n MAT: %f\n MCT_valid: %s\n MCT: %f\n range: %f\n range_unc: %f\n az_valid: %s\n az_deg: %f\n az_deg_unc: %f\n el_valid: %s\n el_deg: %f\n el_deg_unc: %f\n fov_confidence: %f\n antenna_type: %s\n soi_rssi_valid: %s\n"
            " soi_rssi_dbm: %f",
            (uint8_t *)&buf,
            0xA2u);
          p_isa = (id *)&v63->super.isa;
        }

        +[PRSharingSessionHelper UIntToHexString:len:](PRSharingSessionHelper, "UIntToHexString:len:", objc_msgSend(v25, "mac_addr"), 6);
        memset(&buf, 0, sizeof(buf));
        v81 = 0x7FF4000000000000;
        v82 = 0;
        *(int64x2_t *)&v83[6] = v66;
        v83[22] = 0;
        *(_DWORD *)&v83[26] = 3;
        LOBYTE(v84) = 0;
        *(_QWORD *)v85 = 0x7FF4000000000000;
        *(_WORD *)&v85[8] = 0;
        std::string::operator=(&buf, &__str);
        objc_msgSend(v25, "mach_absolute_time_sec");
        v81 = v58;
        LOBYTE(v82) = 1;
        objc_msgSend(v25, "range_m");
        *(_QWORD *)&v83[6] = v59;
        LOBYTE(v84) = objc_msgSend(v25, "soi_rssi_valid");
        objc_msgSend(v25, "soi_rssi_dbm");
        *(_QWORD *)v85 = v60;
        HIBYTE(v82) = 0;
        *(_QWORD *)&v83[14] = 0xC00921FB54442D18;
        v83[22] = 0;
        *(_DWORD *)&v83[26] = 3;
        *(_WORD *)&v85[8] = 0;
        objc_msgSend(p_isa, "updateScoresWithNewMeasurement:", &buf);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
          operator delete(buf.__r_.__value_.__l.__data_);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v102, 16);
    }
    while (v23);
  }

  objc_msgSend(p_isa, "reportScoresToClientAlways:useUpdatedScoreList:currentMachContTime:", 0, 1, v61);
  std::__tree<Region>::destroy((uint64_t)&v78, v79[0]);

}

- (void)addBluetoothProximityEstimate:(NeighborMeasurements *)a3 currentMachContTime:
{
  double v3;
  double v4;
  NSObject *logger;
  int v8;
  double v9;
  uint64_t v10;

  v4 = v3;
  v10 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v4;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "addBluetoothProximityEstimate: current mach continuous time %lf", (uint8_t *)&v8, 0xCu);
  }
  -[PRSharingChoice updateScoresWithNewMeasurement:](self, "updateScoresWithNewMeasurement:", a3);
  -[PRSharingChoice reportScoresToClientAlways:useUpdatedScoreList:currentMachContTime:](self, "reportScoresToClientAlways:useUpdatedScoreList:currentMachContTime:", 0, 1, v4);
}

- (void)heartbeatTimeout:(double)a3 currentMachContTime:(double)a4 useUpdatedScores:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *logger;
  int v10;
  double v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x1E0C80C00];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a4;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "heartbeatTimeout: current mach continuous time %lf", (uint8_t *)&v10, 0xCu);
  }
  if (v5)
    -[PRSharingChoice updateScoresForTime:](self, "updateScoresForTime:", a3);
  -[PRSharingChoice reportScoresToClientAlways:useUpdatedScoreList:currentMachContTime:](self, "reportScoresToClientAlways:useUpdatedScoreList:currentMachContTime:", 1, v5, a4);
}

- (void)reportScoresToClientAlways:(BOOL)a3 useUpdatedScoreList:(BOOL)a4 currentMachContTime:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unsigned int v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  unsigned int v18;
  double v19;
  void *v20;
  void *v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  OS_os_log *v26;
  NSData *v27;
  BOOL v28;
  void *v29;
  OS_os_log *v30;
  NSData *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  int v38;
  OS_os_log *v39;
  void *v40;
  NSData *v41;
  NSData *v42;
  id v43;
  void *v44;
  PRDeviceScore *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  PRDeviceScore *v52;
  void *v53;
  NSData **p_lastBigHeadMacAddress;
  NSObject *logger;
  NSData *v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void (**newScoresHandler)(id, void *);
  NSObject *v68;
  NSData *v69;
  BOOL v70;
  void *obj;
  _BOOL4 v72;
  uint8_t buf[4];
  NSData *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x1E0C80C00];
  v72 = a3;
  if (a3 || a4)
  {
    if (a3 && !a4 && self->_newScoresHandler && -[NSArray count](self->_lastReportedScores, "count"))
    {
      (*((void (**)(id, NSArray *))self->_newScoresHandler + 2))(self->_newScoresHandler, self->_lastReportedScores);
      return;
    }
    if (self->_lastScoreReportMachContinuousTime + 0.05 <= a5 || v72)
    {
      -[NSMutableDictionary allValues](self->_scores, "allValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = self->_scoreSortDescriptor;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sortedArrayUsingDescriptors:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      v12 = 0;
      v13 = 0;
      while (objc_msgSend(v11, "count") > v12)
      {
        objc_msgSend(v11, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "angle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 != 0;

        v13 += v16;
        ++v12;
      }
      if (v13)
      {
        v17 = 0;
        v18 = -1;
        v19 = -1.0;
        while (objc_msgSend(v11, "count") > v17)
        {
          objc_msgSend(v11, "objectAtIndex:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "angle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          if (!v22)
          {
            objc_msgSend(v20, "score");
            if (v19 >= v23)
            {
              objc_msgSend(v20, "score");
              if (v19 == v25)
              {
                v26 = self->_logger;
                if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v20, "score");
                  *(_DWORD *)buf = 134217984;
                  v74 = v27;
                  _os_log_impl(&dword_19BF46000, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Big Head Selection: multiple candidates with same score %f!", buf, 0xCu);
                }

                v18 = -1;
              }
            }
            else
            {
              objc_msgSend(v20, "score");
              v19 = v24;
              v18 = v17;
            }
          }

          ++v17;
        }
        v28 = (v18 & 0x80000000) == 0;
        if (v13 >= 2 && (v18 & 0x80000000) == 0)
        {
          objc_msgSend(v11, "objectAtIndex:", v18);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = self->_logger;
          if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v29, "btAddress");
            v31 = (NSData *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "score");
            *(_DWORD *)buf = 138412546;
            v74 = v31;
            v75 = 2048;
            v76 = v32;
            _os_log_impl(&dword_19BF46000, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, "Big Head Selection: selected big head device %@ with score %f", buf, 0x16u);

          }
          v28 = 1;
        }
        v70 = v28;
      }
      else
      {
        v70 = 0;
        v18 = -1;
      }
      v33 = 0;
      v34 = v18;
      while (objc_msgSend(v11, "count") > v33)
      {
        objc_msgSend(v11, "objectAtIndex:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "angle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          v37 = v34 == v33;
        else
          v37 = 1;
        v38 = !v37;

        if (v38)
        {
          v39 = self->_logger;
          if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v35, "angle");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "measurement");
            v42 = v41;
            objc_msgSend(v35, "btAddress");
            v43 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "score");
            *(_DWORD *)buf = 134218498;
            v74 = v42;
            v75 = 2112;
            v76 = (uint64_t)v43;
            v77 = 2048;
            v78 = v44;
            _os_log_impl(&dword_19BF46000, (os_log_t)v39, OS_LOG_TYPE_DEFAULT, "Big Head Selection: nil out angle %f for device %@ with score %f (II)", buf, 0x20u);

          }
          v45 = [PRDeviceScore alloc];
          objc_msgSend(v35, "btAddress");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v35, "proximity");
          objc_msgSend(v35, "range");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "score");
          v50 = v49;
          objc_msgSend(v35, "scoreUncertainty");
          v52 = -[PRDeviceScore initWithValues:proximity:range:angle:score:scoreUncertainty:](v45, "initWithValues:proximity:range:angle:score:scoreUncertainty:", v46, v47, v48, 0, v50, v51);

          objc_msgSend(v35, "timestamp");
          -[PRDeviceScore setTimestamp:](v52, "setTimestamp:");
          objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v33, v52);

        }
        ++v33;
      }
      if (v70)
      {
        objc_msgSend(v11, "objectAtIndex:", v34);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "btAddress");
        p_lastBigHeadMacAddress = &self->_lastBigHeadMacAddress;
        obj = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(obj, "isEqual:", self->_lastBigHeadMacAddress) & 1) == 0)
        {
          if (self->_lastBigHeadFirstReportTime + 0.5 > a5)
          {
            if (v72 && self->_newScoresHandler)
            {
              logger = self->_logger;
              if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
              {
                v56 = *p_lastBigHeadMacAddress;
                *(_DWORD *)buf = 138412802;
                v74 = v56;
                v75 = 2048;
                v76 = 0x3FE0000000000000;
                v77 = 2112;
                v78 = obj;
                _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "Big Head Selection: last big head %@ less than %f second(s), reporting previously reported big head %@", buf, 0x20u);
              }
              (*((void (**)(void))self->_newScoresHandler + 2))();
            }
            else
            {
              v68 = self->_logger;
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
              {
                v69 = *p_lastBigHeadMacAddress;
                *(_DWORD *)buf = 138412802;
                v74 = v69;
                v75 = 2048;
                v76 = 0x3FE0000000000000;
                v77 = 2112;
                v78 = obj;
                _os_log_impl(&dword_19BF46000, v68, OS_LOG_TYPE_DEFAULT, "Big Head Selection: last big head %@ less than %f second(s), skip reporting current big head %@", buf, 0x20u);
              }
            }

LABEL_71:
            return;
          }
          self->_lastBigHeadFirstReportTime = a5;
          objc_storeStrong((id *)&self->_lastBigHeadMacAddress, obj);
        }

      }
      else
      {
        obj = 0;
      }
      v57 = objc_msgSend(v11, "count");
      if (v57 == -[NSArray count](self->_lastReportedScores, "count"))
      {
        v58 = 0;
        while (objc_msgSend(v11, "count") > v58)
        {
          objc_msgSend(v11, "objectAtIndex:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_lastReportedScores, "objectAtIndex:", v58);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "btAddress");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "btAddress");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v61, "isEqual:", v62);

          if ((v63 & 1) == 0)
          {

            goto LABEL_66;
          }
          objc_msgSend(v59, "angle");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "angle");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v65 == 0;

          ++v58;
          if ((((v64 != 0) ^ v66) & 1) == 0)
            goto LABEL_66;
        }
        if (v72)
          goto LABEL_66;
      }
      else
      {
LABEL_66:
        self->_lastScoreReportMachContinuousTime = a5;
        objc_storeStrong((id *)&self->_lastReportedScores, v11);
        newScoresHandler = (void (**)(id, void *))self->_newScoresHandler;
        if (newScoresHandler)
          newScoresHandler[2](newScoresHandler, v11);
      }
      goto LABEL_71;
    }
  }
}

- (void)updateScoresForTime:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  char **v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  PRDeviceScore *v15;
  void *v16;
  char *v17;
  char **v18;
  BOOL v19;
  char **v20;
  char *v21[2];

  v21[0] = 0;
  v21[1] = 0;
  v20 = v21;
  SharingImportanceManager::getImportanceEstimates((uint64_t)self->_estimatorRangeOnly.__ptr_.__value_, (uint64_t)&v20, a3);
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary allKeys](self->_scores, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v8 = v20;
  if (v20 != v21)
  {
    do
    {
      +[PRSharingSessionHelper convertMacStringToNSData:](PRSharingSessionHelper, "convertMacStringToNSData:", v8 + 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRSharingSessionHelper reverseNSData:](PRSharingSessionHelper, "reverseNSData:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (((_BYTE)v8[9] & 1) != 0)
      {
        v11 = *((double *)v8 + 7);
        v12 = *((double *)v8 + 8);
        v13 = *((unsigned int *)v8 + 26);
        if (((_BYTE)v8[11] & 1) != 0)
        {
          +[PRRangeMeasurement measurementWithRange:uncertainty:](PRRangeMeasurement, "measurementWithRange:uncertainty:", *((double *)v8 + 12), 0.0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        v15 = -[PRDeviceScore initWithValues:proximity:range:angle:score:scoreUncertainty:]([PRDeviceScore alloc], "initWithValues:proximity:range:angle:score:scoreUncertainty:", v10, +[PRSharingSessionHelper CoarseRangeToProx:](PRSharingSessionHelper, "CoarseRangeToProx:", v13), v14, 0, v11, v12);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scores, "setObject:forKeyedSubscript:", v15, v10);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_scores, "objectForKeyedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTimestamp:", a3);

        objc_msgSend(v7, "removeObject:", v10);
      }

      v17 = v8[1];
      if (v17)
      {
        do
        {
          v18 = (char **)v17;
          v17 = *(char **)v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = (char **)v8[2];
          v19 = *v18 == (char *)v8;
          v8 = v18;
        }
        while (!v19);
      }
      v8 = v18;
    }
    while (v18 != v21);
  }
  -[NSMutableDictionary removeObjectsForKeys:](self->_scores, "removeObjectsForKeys:", v7);

  std::__tree<std::__value_type<std::string,NeighborImportanceEstimate>,std::__map_value_compare<std::string,std::__value_type<std::string,NeighborImportanceEstimate>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,NeighborImportanceEstimate>>>::destroy((uint64_t)&v20, v21[0]);
}

- (void)updateScoresWithNewMeasurement:(const void *)a3
{
  NeighborMeasurements *end;
  uint64_t *p_measurements;
  NeighborMeasurements *v7;
  NSObject *logger;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  end = self->_measurements.userSharingInput.__end_;
  p_measurements = (uint64_t *)&self->_measurements;
  if (end >= self->_measurements.userSharingInput.__end_cap_.__value_)
  {
    v7 = (NeighborMeasurements *)std::vector<NeighborMeasurements>::__push_back_slow_path<NeighborMeasurements const&>(p_measurements, (__int128 *)a3);
  }
  else
  {
    std::vector<NeighborMeasurements>::__construct_one_at_end[abi:ne180100]<NeighborMeasurements const&>((uint64_t)p_measurements, (__int128 *)a3);
    v7 = (NeighborMeasurements *)((char *)end + 88);
  }
  self->_measurements.userSharingInput.__end_ = v7;
  SharingImportanceManager::handleMeasurements(self->_estimatorRangeOnly.__ptr_.__value_, &self->_measurements);
  std::vector<NeighborMeasurements>::__clear[abi:ne180100]((uint64_t *)&self->_measurements);
  -[PRSharingChoice updateScoresForTime:](self, "updateScoresForTime:", *((double *)a3 + 3));
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *((_QWORD *)a3 + 3);
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_19BF46000, logger, OS_LOG_TYPE_DEFAULT, "measurement time %lf", (uint8_t *)&v10, 0xCu);
  }
  kdebug_trace();
}

- (id)newScoresHandler
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setNewScoresHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (BOOL)useRegionBasedEstimator
{
  return self->_useRegionBasedEstimator;
}

- (void)setUseRegionBasedEstimator:(BOOL)a3
{
  self->_useRegionBasedEstimator = a3;
}

- (BOOL)currentlyInitiating
{
  return self->_currentlyInitiating;
}

- (void)setCurrentlyInitiating:(BOOL)a3
{
  self->_currentlyInitiating = a3;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  SharingImportanceMeasurements *p_measurements;

  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_newScoresHandler, 0);
  std::unique_ptr<SharingImportanceManager>::reset[abi:ne180100](&self->_estimatorRangeOnly.__ptr_.__value_, 0);
  objc_storeStrong((id *)&self->_scoreSortDescriptor, 0);
  p_measurements = &self->_measurements;
  std::vector<NeighborMeasurements>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_measurements);
  objc_storeStrong((id *)&self->_lastReportedScores, 0);
  objc_storeStrong((id *)&self->_lastBigHeadMacAddress, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
