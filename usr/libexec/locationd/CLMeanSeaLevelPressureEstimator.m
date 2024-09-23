@implementation CLMeanSeaLevelPressureEstimator

- (CLMeanSeaLevelPressureEstimator)initWithContextManager:(id)a3 andUniverse:(id)a4 andDelegate:(id)a5 andBuffers:(void *)a6
{
  CLMeanSeaLevelPressureEstimator *v10;
  CLMeanSeaLevelPressureEstimator *v11;
  int64x2_t v12;
  NSObject *v13;
  double Current;
  const char *v16;
  uint8_t *v17;
  unsigned __int8 v18[16];
  objc_super v19;
  uint8_t buf[4];
  float v21;

  v19.receiver = self;
  v19.super_class = (Class)CLMeanSeaLevelPressureEstimator;
  v10 = -[CLMeanSeaLevelPressureEstimator init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    v10->_universe = (CLIntersiloUniverse *)a4;
    v10->_delegate = (CLBarometerCalibrationContextClient *)a5;
    v10->_dataBuffers = a6;
    v10->_meanSeaLevelPressureArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v11->_recentMeanSeaLevelPressureArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v11->_inVisitRebasedMslp = objc_alloc_init(CLMeanSeaLevelPressureData);
    v11->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
    v11->_cumulativeNumber = 0;
    v11->_cumulativeUncertainty = 0.0;
    v11->_cumulativeMeanSeaLevelPressure = 0.0;
    v12 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v11->_cumulativePressureMeasurement = 0.0;
    *(int64x2_t *)&v11->_cumulativeTimestamp = v12;
    *(int64x2_t *)&v11->_lastTimestampSavedMslpForRecovery = v12;
    v11->_lastRefreshTimestamp = 1.79769313e308;
    v11->_exitVisitTimestamp = 0.0;
    *(_WORD *)&v11->_inVisitStatus = 0;
    v11->_lastSuccessfulRefreshTimestamp = 1.79769313e308;
    *(_QWORD *)&v11->_numberOfRebaseBtwRefresh = -1;
    v11->_numberOfWeatherUpdate = -1;
    *(int64x2_t *)&v11->_uncertaintyAfterRefresh = v12;
    *(int64x2_t *)&v11->_longitudeAfterRefresh = v12;
    *(_DWORD *)v18 = 1155596288;
    sub_1018C2254(buf, "RateToRefreshHistoricalMeanSeaLevelPressure", v18, 0);
    v11->_rateToRefreshHistoricalMeanSeaLevelPressure = v21;
    v18[0] = 0;
    sub_1018BF25C(buf, "MeanSeaLevelPressureLogInitialArray", v18, 0);
    v11->_logInitialHistoricalMeanSeaLevelPressure = buf[1];
    *(_DWORD *)v18 = 1137180672;
    sub_1018C2254(buf, "gpVerticalScale_historicalMslp", v18, 0);
    v11->_gpMinVertScale_historical = v21;
    *(_DWORD *)v18 = 1132068864;
    sub_1018C2254(buf, "gpVerticalScale_recentMslp", v18, 0);
    v11->_gpMinVertScale_recent = v21;
    *(_DWORD *)v18 = 1079194419;
    sub_1018C2254(buf, "gpHorizontalScale_historicalMslpOutVisit", v18, 0);
    v11->_gpHorizScale_outVisit = v21;
    *(_DWORD *)v18 = 1056964608;
    sub_1018C2254(buf, "gpHorizontalScale_historicalMslpInVisit", v18, 0);
    v11->_gpHorizScale_inVisit = v21;
    *(_DWORD *)v18 = 1056964608;
    sub_1018C2254(buf, "gpHorizontalScale_recentMslpInVisit", v18, 0);
    v11->_gpHorizScale_recentInVisit = v21;
    *(_DWORD *)v18 = 1045220557;
    sub_1018C2254(buf, "gpHorizontalScale_recentMslpOutVisit", v18, 0);
    v11->_gpHorizScale_recentOutVisit = v21;
    -[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState](v11, "retrieveMeanSeaLevelPressureEstimatorState");
    if (!-[NSMutableArray count](v11->_meanSeaLevelPressureArray, "count")
      && !-[NSMutableArray count](v11->_recentMeanSeaLevelPressureArray, "count"))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v13 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "locationd starts and no historical data retrieved from plist, refreshing mean sea level array.", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        *(_WORD *)v18 = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "locationd starts and no historical data retrieved from plist, refreshing mean sea level array.", v18, 2);
        v17 = (uint8_t *)v16;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator initWithContextManager:andUniverse:andDelegate:andBuffers:]", "%s\n", v16);
        if (v17 != buf)
          free(v17);
      }
      Current = CFAbsoluteTimeGetCurrent();
      -[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:](v11, "refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:", Current + -10800.0, CFAbsoluteTimeGetCurrent());
    }
    -[CLIntersiloUniverse silo](v11->_universe, "silo");
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  self->_meanSeaLevelPressureArray = 0;
  self->_recentMeanSeaLevelPressureArray = 0;

  self->_elevationProfileContextManager = 0;
  self->_currentEstimateMslp = 0;

  self->_inVisitRebasedMslp = 0;
  if (sub_1001FBB04(0))
  {
    v3 = sub_1001FBB04(0);
    sub_1000A4A6C(v3, 48, (uint64_t)self->_mslpDispatcher.__ptr_.__value_);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLMeanSeaLevelPressureEstimator;
  -[CLMeanSeaLevelPressureEstimator dealloc](&v4, "dealloc");
}

- (int)getMeanSeaLevelArrayCount
{
  unsigned int v3;

  v3 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
  return -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count") + v3;
}

- (void)printMeanSeaLevelPressureArray:(id)a3 withPrePhrase:()basic_string<char
{
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  std::string *v11;
  __int128 v12;
  const std::string::value_type *v13;
  std::string::size_type v14;
  double v15;
  std::string *v16;
  __int128 v17;
  const std::string::value_type *v18;
  std::string::size_type v19;
  double v20;
  std::string *v21;
  __int128 v22;
  const std::string::value_type *v23;
  std::string::size_type v24;
  double v25;
  std::string *v26;
  __int128 v27;
  const std::string::value_type *v28;
  std::string::size_type v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  std::string *v34;
  NSObject *v35;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v36;
  std::string *v37;
  NSObject *v38;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v39;
  std::string *v40;
  NSObject *v41;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v42;
  std::string *v43;
  const char *v44;
  char *v45;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v46;
  std::string *v47;
  const char *v48;
  char *v49;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v50;
  std::string *v51;
  const char *v52;
  char *v53;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v54;
  std::string *v55;
  const char *v56;
  char *v57;
  std::string *v58;
  const char *v59;
  char *v60;
  const char *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  std::string v66;
  std::string v67;
  std::string v68;
  std::string v69;
  _BYTE __p[1632];
  std::string v71;
  _BYTE v72[128];

  memset(&v69, 0, sizeof(v69));
  memset(&v68, 0, sizeof(v68));
  memset(&v67, 0, sizeof(v67));
  memset(&v66, 0, sizeof(v66));
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "timestamp");
        std::to_string(&v71, v10);
        v11 = std::string::insert(&v71, 0, ", ");
        v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
        *(_QWORD *)&__p[16] = *((_QWORD *)&v11->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v12;
        v11->__r_.__value_.__l.__size_ = 0;
        v11->__r_.__value_.__r.__words[2] = 0;
        v11->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0)
          v13 = __p;
        else
          v13 = *(const std::string::value_type **)__p;
        if (__p[23] >= 0)
          v14 = __p[23];
        else
          v14 = *(_QWORD *)&__p[8];
        std::string::append(&v69, v13, v14);
        if ((__p[23] & 0x80000000) != 0)
          operator delete(*(void **)__p);
        if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v71.__r_.__value_.__l.__data_);
        objc_msgSend(v9, "meanSeaLevelPressure");
        std::to_string(&v71, v15);
        v16 = std::string::insert(&v71, 0, ", ");
        v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
        *(_QWORD *)&__p[16] = *((_QWORD *)&v16->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v17;
        v16->__r_.__value_.__l.__size_ = 0;
        v16->__r_.__value_.__r.__words[2] = 0;
        v16->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0)
          v18 = __p;
        else
          v18 = *(const std::string::value_type **)__p;
        if (__p[23] >= 0)
          v19 = __p[23];
        else
          v19 = *(_QWORD *)&__p[8];
        std::string::append(&v68, v18, v19);
        if ((__p[23] & 0x80000000) != 0)
          operator delete(*(void **)__p);
        if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v71.__r_.__value_.__l.__data_);
        objc_msgSend(v9, "uncertainty");
        std::to_string(&v71, v20);
        v21 = std::string::insert(&v71, 0, ", ");
        v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
        *(_QWORD *)&__p[16] = *((_QWORD *)&v21->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v22;
        v21->__r_.__value_.__l.__size_ = 0;
        v21->__r_.__value_.__r.__words[2] = 0;
        v21->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0)
          v23 = __p;
        else
          v23 = *(const std::string::value_type **)__p;
        if (__p[23] >= 0)
          v24 = __p[23];
        else
          v24 = *(_QWORD *)&__p[8];
        std::string::append(&v67, v23, v24);
        if ((__p[23] & 0x80000000) != 0)
          operator delete(*(void **)__p);
        if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v71.__r_.__value_.__l.__data_);
        objc_msgSend(v9, "pressureMeasurement");
        std::to_string(&v71, v25);
        v26 = std::string::insert(&v71, 0, ", ");
        v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        *(_QWORD *)&__p[16] = *((_QWORD *)&v26->__r_.__value_.__l + 2);
        *(_OWORD *)__p = v27;
        v26->__r_.__value_.__l.__size_ = 0;
        v26->__r_.__value_.__r.__words[2] = 0;
        v26->__r_.__value_.__r.__words[0] = 0;
        if (__p[23] >= 0)
          v28 = __p;
        else
          v28 = *(const std::string::value_type **)__p;
        if (__p[23] >= 0)
          v29 = __p[23];
        else
          v29 = *(_QWORD *)&__p[8];
        std::string::append(&v66, v28, v29);
        if ((__p[23] & 0x80000000) != 0)
          operator delete(*(void **)__p);
        if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v71.__r_.__value_.__l.__data_);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v6);
  }
  v30 = objc_msgSend(a3, "count");
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v31 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = "count";
    *(_WORD *)&__p[12] = 2048;
    *(_QWORD *)&__p[14] = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "mean sea level pressure array,%s,%lu", __p, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)"count";
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v30;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FE88, 0, "mean sea level pressure array,%s,%lu", (const char *)&v71, 22);
    v45 = (char *)v44;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v44);
    if (v45 != __p)
      free(v45);
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v32 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    data = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v34 = &v69;
    if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v34 = (std::string *)v69.__r_.__value_.__r.__words[0];
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = data;
    *(_WORD *)&__p[12] = 2080;
    *(_QWORD *)&__p[14] = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s timestamps%s", __p, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v46 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      v46 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v47 = &v69;
    if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v47 = (std::string *)v69.__r_.__value_.__r.__words[0];
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)v46;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v47;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FE88, 0, "%s timestamps%s", (const char *)&v71, v61);
    v49 = (char *)v48;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v48);
    if (v49 != __p)
      free(v49);
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v35 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v36 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      v36 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v37 = &v68;
    if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v37 = (std::string *)v68.__r_.__value_.__r.__words[0];
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = v36;
    *(_WORD *)&__p[12] = 2080;
    *(_QWORD *)&__p[14] = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s pressures%s", __p, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v50 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      v50 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v51 = &v68;
    if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v51 = (std::string *)v68.__r_.__value_.__r.__words[0];
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)v50;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v51;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FE88, 0, "%s pressures%s", (const char *)&v71, v61);
    v53 = (char *)v52;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v52);
    if (v53 != __p)
      free(v53);
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v38 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v39 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      v39 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v40 = &v67;
    if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v40 = (std::string *)v67.__r_.__value_.__r.__words[0];
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = v39;
    *(_WORD *)&__p[12] = 2080;
    *(_QWORD *)&__p[14] = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s uncertainties%s", __p, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v54 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      v54 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v55 = &v67;
    if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v55 = (std::string *)v67.__r_.__value_.__r.__words[0];
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)v54;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v55;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FE88, 0, "%s uncertainties%s", (const char *)&v71, v61);
    v57 = (char *)v56;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v56);
    if (v57 != __p)
      free(v57);
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v41 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v42 = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      v42 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v43 = &v66;
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v43 = (std::string *)v66.__r_.__value_.__r.__words[0];
    *(_DWORD *)__p = 136315394;
    *(_QWORD *)&__p[4] = v42;
    *(_WORD *)&__p[12] = 2080;
    *(_QWORD *)&__p[14] = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s pressureMeasurements%s", __p, 0x16u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      a4 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    v58 = &v66;
    if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v58 = (std::string *)v66.__r_.__value_.__r.__words[0];
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v58;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_10229FE88, 0, "%s pressureMeasurements%s", (const char *)&v71, v61);
    v60 = (char *)v59;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]", "%s\n", v59);
    if (v60 != __p)
      free(v60);
  }
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v66.__r_.__value_.__l.__data_);
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v67.__r_.__value_.__l.__data_);
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v68.__r_.__value_.__l.__data_);
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v69.__r_.__value_.__l.__data_);
}

- (void)printMeanSeaLevelPressureElement:(id)a3 withPrePhrase:()basic_string<char
{
  NSObject *v6;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint8_t *v20;
  int v21;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  uint8_t buf[4];
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    data = a4;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    objc_msgSend(a3, "meanSeaLevelPressure");
    v9 = v8;
    objc_msgSend(a3, "uncertainty");
    v11 = v10;
    objc_msgSend(a3, "timestamp");
    *(_DWORD *)buf = 136316674;
    v36 = data;
    v37 = 2080;
    v38 = "meanSeaLevelPressure";
    v39 = 2048;
    v40 = v9;
    v41 = 2080;
    v42 = "uncertainty";
    v43 = 2048;
    v44 = v11;
    v45 = 2080;
    v46 = "timestamp";
    v47 = 2048;
    v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s,%s,%f,%s,%f,%s,%f", buf, 0x48u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v13 = qword_10229FE88;
    if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
      a4 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a4->__r_.__value_.var0.var1.__data_;
    objc_msgSend(a3, "meanSeaLevelPressure");
    v15 = v14;
    objc_msgSend(a3, "uncertainty");
    v17 = v16;
    objc_msgSend(a3, "timestamp");
    v21 = 136316674;
    v22 = a4;
    v23 = 2080;
    v24 = "meanSeaLevelPressure";
    v25 = 2048;
    v26 = v15;
    v27 = 2080;
    v28 = "uncertainty";
    v29 = 2048;
    v30 = v17;
    v31 = 2080;
    v32 = "timestamp";
    v33 = 2048;
    v34 = v18;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 0, "%s,%s,%f,%s,%f,%s,%f", (const char *)&v21, 72);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureElement:withPrePhrase:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
}

- (BOOL)updateLastSampleInMeanSeaLevelPressureArray
{
  id v3;
  CLMeanSeaLevelPressureData *v4;
  CFAbsoluteTime Current;
  NSMutableArray *recentMeanSeaLevelPressureArray;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint8_t *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint8_t *v33;
  double v35;
  const char *v36;
  void *__p[2];
  double v38;
  int v39;
  const char *v40;
  __int16 v41;
  CFAbsoluteTime v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  CFAbsoluteTime v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  uint64_t v70;

  v3 = -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count");
  if (v3)
  {
    v4 = objc_opt_new(CLMeanSeaLevelPressureData);
    Current = CFAbsoluteTimeGetCurrent();
    -[CLMeanSeaLevelPressureData setTimestamp:](v4, "setTimestamp:");
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_1015A2E04(__p, "recent mean sea level pressure array for Gaussian process:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](self, "printMeanSeaLevelPressureArray:withPrePhrase:", recentMeanSeaLevelPressureArray, __p);
    if (SHIBYTE(v38) < 0)
      operator delete(__p[0]);
    if (-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:](self, "gaussianProcess:withMslpArray:withType:", v4, self->_recentMeanSeaLevelPressureArray, 0))
    {
      if ((unint64_t)-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count") >= 0xF)
      {
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v7 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(-[NSMutableArray firstObject](self->_meanSeaLevelPressureArray, "firstObject"), "timestamp");
          *(_DWORD *)buf = 134217984;
          v56 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remove the oldest mean sea level pressure,timestamp,%f", buf, 0xCu);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021B7438);
          v30 = qword_10229FE88;
          objc_msgSend(-[NSMutableArray firstObject](self->_meanSeaLevelPressureArray, "firstObject"), "timestamp");
          v39 = 134217984;
          v40 = v31;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v30, 0, "remove the oldest mean sea level pressure,timestamp,%f", COERCE_DOUBLE(&v39));
          v33 = (uint8_t *)v32;
          sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]", "%s\n", v32);
          if (v33 != buf)
            free(v33);
        }
        -[NSMutableArray removeObjectAtIndex:](self->_meanSeaLevelPressureArray, "removeObjectAtIndex:", 0);
      }
      -[NSMutableArray addObject:](self->_meanSeaLevelPressureArray, "addObject:", v4);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v9 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureData timestamp](v4, "timestamp");
        v11 = v10;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v4, "meanSeaLevelPressure");
        v13 = v12;
        -[CLMeanSeaLevelPressureData uncertainty](v4, "uncertainty");
        v15 = v14;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v4, "pressureMeasurement");
        *(_DWORD *)buf = 136316930;
        v56 = "timestamp";
        v57 = 2048;
        v58 = v11;
        v59 = 2080;
        v60 = "meanSeaLevelPressure";
        v61 = 2048;
        v62 = v13;
        v63 = 2080;
        v64 = "uncertainty";
        v65 = 2048;
        v66 = v15;
        v67 = 2080;
        v68 = "measurePressure";
        v69 = 2048;
        v70 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "add temporary mslp to mslp array,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x52u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v20 = qword_10229FE88;
        -[CLMeanSeaLevelPressureData timestamp](v4, "timestamp");
        v22 = v21;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v4, "meanSeaLevelPressure");
        v24 = v23;
        -[CLMeanSeaLevelPressureData uncertainty](v4, "uncertainty");
        v26 = v25;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v4, "pressureMeasurement");
        v39 = 136316930;
        v40 = "timestamp";
        v41 = 2048;
        v42 = v22;
        v43 = 2080;
        v44 = "meanSeaLevelPressure";
        v45 = 2048;
        v46 = v24;
        v47 = 2080;
        v48 = "uncertainty";
        v49 = 2048;
        v50 = v26;
        v51 = 2080;
        v52 = "measurePressure";
        v53 = 2048;
        v54 = v27;
        LODWORD(v35) = 82;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "add temporary mslp to mslp array,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v39, v35, v36, *(double *)__p, (const char *)__p[1], v38);
        v29 = (uint8_t *)v28;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]", "%s\n", v28);
        if (v29 != buf)
          free(v29);
      }
      LOBYTE(v3) = 1;
    }
    else
    {
      -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");
      -[CLMeanSeaLevelPressureEstimator clearRecentMeanSeaLevelPressureArrayInPlist](self, "clearRecentMeanSeaLevelPressureArrayInPlist");
      self->_cumulativeStartTime = 1.79769313e308;
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v17 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "timestamp";
        v57 = 2048;
        v58 = Current;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "fail to query temporary mslp from recent mslp array,%s,%f", buf, 0x16u);
      }
      LODWORD(v3) = sub_1001BFF7C(115, 2);
      if ((_DWORD)v3)
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v39 = 136315394;
        v40 = "timestamp";
        v41 = 2048;
        v42 = Current;
        LODWORD(v35) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "fail to query temporary mslp from recent mslp array,%s,%f", (const char *)&v39, v35);
        v19 = (uint8_t *)v18;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]", "%s\n", v18);
        if (v19 != buf)
          free(v19);
        LOBYTE(v3) = 0;
      }
    }
  }
  return (char)v3;
}

- (id)getEstimatedMeanSeaLevelPressure
{
  CLMeanSeaLevelPressureData *v3;
  CFAbsoluteTime Current;
  unsigned int v5;
  NSMutableArray *meanSeaLevelPressureArray;
  NSObject *v7;
  double v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint8_t *v18;
  void *__p[2];
  char v20;
  int v21;
  CFAbsoluteTime v22;
  uint8_t buf[4];
  CFAbsoluteTime v24;

  v3 = objc_opt_new(CLMeanSeaLevelPressureData);
  Current = CFAbsoluteTimeGetCurrent();
  -[CLMeanSeaLevelPressureData setTimestamp:](v3, "setTimestamp:");
  v5 = -[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray](self, "updateLastSampleInMeanSeaLevelPressureArray");
  meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
  sub_1015A2E04(__p, "mean sea level pressure array for Gaussian process:");
  -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](self, "printMeanSeaLevelPressureArray:withPrePhrase:", meanSeaLevelPressureArray, __p);
  if (v20 < 0)
    operator delete(__p[0]);
  if (!-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count"))
  {
    -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v3, "setMeanSeaLevelPressure:", 101325.0);
    -[CLMeanSeaLevelPressureData setUncertainty:](v3, "setUncertainty:", 6000.0);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v9 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "mean sea level pressure array is empty.", buf, 2u);
    }
    if (!sub_1001BFF7C(115, 2))
      return v3;
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    LOWORD(v21) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "mean sea level pressure array is empty.", &v21, 2);
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]", "%s\n", v10);
LABEL_29:
    if (v11 != buf)
      free(v11);
    return v3;
  }
  if (-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:](self, "gaussianProcess:withMslpArray:withType:", v3, self->_meanSeaLevelPressureArray, 1))
  {
    if (v5)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v7 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject"), "timestamp");
        *(_DWORD *)buf = 134217984;
        v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "remove temporary mslp from mslp array,timestamp,%f", buf, 0xCu);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v15 = qword_10229FE88;
        objc_msgSend(-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject"), "timestamp");
        v21 = 134217984;
        v22 = v16;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 0, "remove temporary mslp from mslp array,timestamp,%f", COERCE_DOUBLE(&v21));
        v18 = (uint8_t *)v17;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]", "%s\n", v17);
        if (v18 != buf)
          free(v18);
      }
      -[NSMutableArray removeLastObject](self->_meanSeaLevelPressureArray, "removeLastObject");
    }
    return v3;
  }
  -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");
  -[CLMeanSeaLevelPressureEstimator clearRecentMeanSeaLevelPressureArrayInPlist](self, "clearRecentMeanSeaLevelPressureArrayInPlist");
  -[NSMutableArray removeAllObjects](self->_meanSeaLevelPressureArray, "removeAllObjects");
  -[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist](self, "clearMeanSeaLevelPressureArrayInPlist");
  self->_cumulativeStartTime = 1.79769313e308;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v12 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = Current;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "fail to query mslp from mslp array,timestamp,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v21 = 134217984;
    v22 = Current;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "fail to query mslp from mslp array,timestamp,%f", COERCE_DOUBLE(&v21));
    v11 = (uint8_t *)v14;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]", "%s\n", v14);
    goto LABEL_29;
  }
  return v3;
}

- (BOOL)gaussianProcess:(id)a3 withMslpArray:(id)a4 withType:(unint64_t)a5
{
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  int v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double gpMinVertScale_historical;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  unint64_t v39;
  unint64_t i;
  id v41;
  double v42;
  double v43;
  double *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  float v61;
  double v62;
  float v63;
  float v64;
  float v65;
  double v66;
  double v67;
  double v68;
  float v69;
  double v70;
  float v71;
  NSObject *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NSObject *v80;
  uint64_t v81;
  double v82;
  double v83;
  const char *v84;
  uint8_t *v85;
  const char *v86;
  uint8_t *v87;
  unint64_t v88;
  int64_t j;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double *v96;
  double v97;
  double v98;
  double v99;
  __int128 v100;
  double v101;
  __int128 v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint8_t *v117;
  double v118;
  double v119;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint8_t *v126;
  double v127;
  const char *v128;
  double v129;
  double v130;
  const char *v131;
  double v132;
  double v133;
  const char *v134;
  const char *v135;
  double v136;
  double v137;
  const char *v138;
  double v139;
  double v140;
  double v141;
  const char *v142;
  double v143;
  double v144;
  double v145;
  const char *v146;
  double v147;
  double v148;
  double v149;
  const char *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  int v159;
  double v160;
  double v161;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  float v168;
  double v169;
  float v170;
  double v171;
  void *__p[2];
  char v173;
  double v174[15];
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  double v182;
  _BYTE v183[960];
  double v184;
  double v185;
  int v186;
  const char *v187;
  __int16 v188;
  uint64_t v189;
  __int16 v190;
  const char *v191;
  __int16 v192;
  uint64_t v193;
  __int16 v194;
  const char *v195;
  __int16 v196;
  double v197;
  __int16 v198;
  const char *v199;
  __int16 v200;
  double v201;
  _BYTE v202[48];
  _BYTE v203[32];
  _BYTE v204[40];
  const char *v205;
  __int16 v206;
  double v207;
  __int16 v208;
  const char *v209;
  __int16 v210;
  double v211;
  uint8_t v212[4];
  const char *v213;
  __int16 v214;
  _BYTE v215[74];
  __int16 v216;
  double v217;
  __int16 v218;
  const char *v219;
  __int16 v220;
  double v221;
  __int16 v222;
  const char *v223;
  __int16 v224;
  double v225;
  __int16 v226;
  const char *v227;
  __int16 v228;
  double v229;
  uint8_t buf[4];
  const char *v231;
  __int16 v232;
  double v233;
  __int16 v234;
  const char *v235;
  __int16 v236;
  uint64_t v237;
  __int16 v238;
  const char *v239;
  __int16 v240;
  uint64_t v241;

  objc_msgSend(a3, "timestamp");
  v166 = v7;
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v8 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(objc_msgSend(a4, "firstObject"), "timestamp");
    v10 = v9;
    objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
    *(_DWORD *)buf = 136316418;
    v231 = "queryTimestamp";
    v232 = 2048;
    v233 = v166;
    v234 = 2080;
    v235 = "firstTimestampInArray";
    v236 = 2048;
    v237 = v10;
    v238 = 2080;
    v239 = "lastTimestampInArray";
    v240 = 2048;
    v241 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "interpolating or extrapolating the mean sea level pressure,%s,%f,%s,%f,%s,%f", buf, 0x3Eu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v121 = qword_10229FE88;
    objc_msgSend(objc_msgSend(a4, "firstObject"), "timestamp");
    v123 = v122;
    objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
    *(_DWORD *)v212 = 136316418;
    v213 = "queryTimestamp";
    v214 = 2048;
    *(double *)v215 = v166;
    *(_WORD *)&v215[8] = 2080;
    *(_QWORD *)&v215[10] = "firstTimestampInArray";
    *(_WORD *)&v215[18] = 2048;
    *(_QWORD *)&v215[20] = v123;
    *(_WORD *)&v215[28] = 2080;
    *(_QWORD *)&v215[30] = "lastTimestampInArray";
    *(_WORD *)&v215[38] = 2048;
    *(_QWORD *)&v215[40] = v124;
    LODWORD(v127) = 62;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v121, 0, "interpolating or extrapolating the mean sea level pressure,%s,%f,%s,%f,%s,%f", (const char *)v212, v127, v128, v129, v131, v132);
    v126 = (uint8_t *)v125;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v125);
    if (v126 != buf)
      free(v126);
  }
  v185 = 1.79769313e308;
  if (-[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v185))
  {
    objc_msgSend(a3, "setPressureMeasurement:", v185);
  }
  else
  {
    objc_msgSend(objc_msgSend(a4, "lastObject"), "pressureMeasurement");
    objc_msgSend(a3, "setPressureMeasurement:");
    objc_msgSend(objc_msgSend(a4, "lastObject"), "pressureMeasurement");
    v185 = v12;
  }
  v13 = objc_msgSend(a4, "count");
  v159 = v13;
  v184 = 0.0;
  v14 = v13;
  if (v13 <= 0)
  {
    v32 = 0.0;
    v164 = 0.0 / (double)v13;
  }
  else
  {
    v15 = 0;
    v16 = v13;
    v17 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    do
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "meanSeaLevelPressure");
      v21 = v20;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "meanSeaLevelPressure");
      v23 = v22;
      v24 = v15 + 1;
      if (v15 + 1 < v14)
      {
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15 + 1), "meanSeaLevelPressure");
        v26 = v25;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "meanSeaLevelPressure");
        v28 = v27;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15 + 1), "timestamp");
        v30 = v29;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "timestamp");
        v19 = v19 + vabdd_f64(v26, v28) / (v30 - v31);
      }
      v17 = v17 + v21;
      v18 = v18 + v23 * v23;
      ++v15;
    }
    while (v16 != v24);
    v32 = 0.0;
    v164 = v17 / (double)v159;
    if (v159 > 1)
    {
      v32 = sqrt(v18 / (double)v159 - v17 / (double)v159 * (v17 / (double)v159));
      v184 = v19 / (double)(v159 - 1) / 0.000277777785;
    }
  }
  objc_msgSend(objc_msgSend(a4, "lastObject"), "meanSeaLevelPressure");
  -[CLMeanSeaLevelPressureEstimator getMslpDriftRate:withLastMslp:](self, "getMslpDriftRate:withLastMslp:", &v184);
  bzero(buf, 0x708uLL);
  if (a5 == 1)
  {
    gpMinVertScale_historical = v32 * 4.0;
    v36 = 152;
    if (!self->_inVisitStatus)
      v36 = 144;
    v34 = *(double *)((char *)&self->super.isa + v36);
    if (gpMinVertScale_historical < self->_gpMinVertScale_historical)
      gpMinVertScale_historical = self->_gpMinVertScale_historical;
  }
  else
  {
    gpMinVertScale_historical = 0.0;
    v34 = 0.0;
    if (!a5)
    {
      v35 = 160;
      if (!self->_inVisitStatus)
        v35 = 168;
      v34 = *(double *)((char *)&self->super.isa + v35);
      gpMinVertScale_historical = self->_gpMinVertScale_recent;
    }
  }
  v37 = gpMinVertScale_historical * gpMinVertScale_historical;
  v38 = 0.5 / (v34 * v34);
  if (v159 < 1)
  {
    v165 = 1.79769313e308;
LABEL_61:
    v88 = v14;
    do
    {
      *(_QWORD *)sub_1014556A0((uint64_t)buf, v88, v88) = 0x3FF0000000000000;
      ++v88;
    }
    while (v88 != 15);
    goto LABEL_63;
  }
  v39 = 0;
  v165 = 1.79769313e308;
  do
  {
    for (i = 0; i != v159; ++i)
    {
      v41 = objc_msgSend(a4, "objectAtIndexedSubscript:", v39);
      if (v39 == i)
      {
        objc_msgSend(v41, "uncertainty");
        v43 = v42;
        v44 = (double *)sub_1014556A0((uint64_t)buf, v39, v39);
        v45 = v43 * v43 + v37 * 2.0;
      }
      else
      {
        objc_msgSend(v41, "timestamp");
        v47 = v46;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", i), "timestamp");
        v49 = v48;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39), "pressureMeasurement");
        v51 = v50;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", i), "pressureMeasurement");
        v53 = v52;
        v54 = exp(v38 * -((v47 * 0.000277777785 - v49 * 0.000277777785) * (v47 * 0.000277777785 - v49 * 0.000277777785)));
        *(double *)sub_1014556A0((uint64_t)buf, v39, i) = v37 * v54;
        v55 = exp(v38 * -((v51 / 1000.0 - v53 / 1000.0) * (v51 / 1000.0 - v53 / 1000.0)));
        v44 = (double *)sub_1014556A0((uint64_t)buf, v39, i);
        v45 = *v44 + v37 * v55;
      }
      *v44 = v45;
    }
    v56 = v185;
    v170 = 0.0;
    if (v185 != 1.79769313e308)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39, v185), "pressureMeasurement");
      v56 = v57 - v185;
      *(float *)&v56 = v56;
      *(float *)&v56 = fabsf(*(float *)&v56);
      v170 = *(float *)&v56;
    }
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39, v56), "pressureMeasurement");
    *(float *)&v58 = v58;
    v168 = sub_100083204(*(float *)&v58);
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39), "pressureMeasurement");
    v60 = v59;
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39), "meanSeaLevelPressure");
    v61 = v60;
    v63 = v62;
    sub_1013D36F0(v61, v63);
    v65 = v64;
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39), "timestamp");
    v67 = v66;
    v68 = v184;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v69 = (float)((float)(v170 * v168) / v65) * (float)((float)(v170 * v168) / v65);
    v70 = vabdd_f64(v67, v166);
    v71 = v68 * v70 * 0.000277777785 * (v68 * v70 * 0.000277777785);
    v72 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v73 = v184;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39), "uncertainty");
      *(_DWORD *)v212 = 136318978;
      v213 = "index";
      v214 = 1024;
      *(_DWORD *)v215 = v39;
      *(_WORD *)&v215[4] = 2080;
      *(_QWORD *)&v215[6] = "deltaPressure";
      *(_WORD *)&v215[14] = 2048;
      *(double *)&v215[16] = v170;
      *(_WORD *)&v215[24] = 2080;
      *(_QWORD *)&v215[26] = "uncDueToElevation";
      *(_WORD *)&v215[34] = 2048;
      *(double *)&v215[36] = v69;
      *(_WORD *)&v215[44] = 2080;
      *(_QWORD *)&v215[46] = "slopeDiffDElevationDPressure";
      *(_WORD *)&v215[54] = 2048;
      *(double *)&v215[56] = v168;
      *(_WORD *)&v215[64] = 2080;
      *(_QWORD *)&v215[66] = "dhdpb";
      v216 = 2048;
      v217 = v65;
      v218 = 2080;
      v219 = "uncDueToWeather";
      v220 = 2048;
      v221 = v71;
      v222 = 2080;
      v223 = "aveRateInSec";
      v224 = 2048;
      v225 = v73 * 0.000277777785;
      v226 = 2080;
      v227 = "uncSquare";
      v228 = 2048;
      v229 = v74 * v74;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "uncertainty term,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", v212, 0x9Eu);
    }
    v75 = v69;
    v76 = v71;
    if (sub_1001BFF7C(115, 2))
    {
      bzero(v212, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v77 = v75;
      v81 = qword_10229FE88;
      v82 = v184;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39), "uncertainty");
      *(_DWORD *)v202 = 136318978;
      *(_QWORD *)&v202[4] = "index";
      *(_WORD *)&v202[12] = 1024;
      *(_DWORD *)&v202[14] = v39;
      *(_WORD *)&v202[18] = 2080;
      *(_QWORD *)&v202[20] = "deltaPressure";
      *(_WORD *)&v202[28] = 2048;
      *(double *)&v202[30] = v170;
      *(_WORD *)&v202[38] = 2080;
      *(_QWORD *)&v202[40] = "uncDueToElevation";
      *(_WORD *)v203 = 2048;
      *(double *)&v203[2] = v77;
      *(_WORD *)&v203[10] = 2080;
      *(_QWORD *)&v203[12] = "slopeDiffDElevationDPressure";
      *(_WORD *)&v203[20] = 2048;
      *(double *)&v203[22] = v168;
      *(_WORD *)&v203[30] = 2080;
      *(_QWORD *)v204 = "dhdpb";
      *(_WORD *)&v204[8] = 2048;
      *(double *)&v204[10] = v65;
      *(_WORD *)&v204[18] = 2080;
      *(_QWORD *)&v204[20] = "uncDueToWeather";
      *(_WORD *)&v204[28] = 2048;
      *(double *)&v204[30] = v76;
      *(_WORD *)&v204[38] = 2080;
      v205 = "aveRateInSec";
      v206 = 2048;
      v207 = v82 * 0.000277777785;
      v208 = 2080;
      v209 = "uncSquare";
      v210 = 2048;
      v211 = v83 * v83;
      _os_log_send_and_compose_impl(2, 0, v212, 1628, &_mh_execute_header, v81, 0, "uncertainty term,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", v202, 158, v128, v129, v131, v132, v134, v136, v138, v140, v142,
        v144,
        v146,
        v148,
        v150,
        v152);
      v85 = (uint8_t *)v84;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v84);
      if (v85 != v212)
        free(v85);
    }
    else
    {
      v77 = v75;
    }
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v39), "uncertainty");
    v79 = v78 * v78 + v77 + v76;
    if (v79 < v165)
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v80 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v212 = 136315906;
        v213 = "index";
        v214 = 1024;
        *(_DWORD *)v215 = v39;
        *(_WORD *)&v215[4] = 2080;
        *(_QWORD *)&v215[6] = "minUncSquare";
        *(_WORD *)&v215[14] = 2048;
        *(double *)&v215[16] = v79;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "minimum unc,%s,%d,%s,%f", v212, 0x26u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(v212, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        *(_DWORD *)v202 = 136315906;
        *(_QWORD *)&v202[4] = "index";
        *(_WORD *)&v202[12] = 1024;
        *(_DWORD *)&v202[14] = v39;
        *(_WORD *)&v202[18] = 2080;
        *(_QWORD *)&v202[20] = "minUncSquare";
        *(_WORD *)&v202[28] = 2048;
        *(double *)&v202[30] = v79;
        _os_log_send_and_compose_impl(2, 0, v212, 1628, &_mh_execute_header, qword_10229FE88, 0, "minimum unc,%s,%d,%s,%f", v202, 38, v128, v129);
        v87 = (uint8_t *)v86;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v86);
        if (v87 != v212)
          free(v87);
      }
      v165 = v79;
    }
    ++v39;
  }
  while (v39 != v159);
  if (v159 < 15)
    goto LABEL_61;
LABEL_63:
  sub_1014559FC((uint64_t)v183, (uint64_t)buf);
  for (j = 0; j != 15; ++j)
  {
    if (j >= v14)
    {
      *(_QWORD *)sub_101455D30((uint64_t)v202, j) = 0;
      v98 = 0.0;
    }
    else
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", j), "timestamp");
      v91 = v90;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", j), "pressureMeasurement");
      v93 = v92;
      v94 = exp(v38 * -((v91 * -0.000277777785 + v166 * 0.000277777785) * (v91 * -0.000277777785 + v166 * 0.000277777785)));
      *(double *)sub_101455D30((uint64_t)v202, j) = v37 * v94;
      v95 = exp(v38 * -((v185 / 1000.0 - v93 / 1000.0) * (v185 / 1000.0 - v93 / 1000.0)));
      v96 = (double *)sub_101455D30((uint64_t)v202, j);
      *v96 = *v96 + v37 * v95;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", j), "meanSeaLevelPressure");
      v98 = v97 - v164;
    }
    *(double *)sub_101455D30((uint64_t)v174, j) = v98;
  }
  v175 = *(_OWORD *)v202;
  v176 = *(_OWORD *)&v202[16];
  v177 = *(_OWORD *)&v202[32];
  v178 = *(_OWORD *)v203;
  v179 = *(_OWORD *)&v203[16];
  v180 = *(_OWORD *)v204;
  v181 = *(_OWORD *)&v204[16];
  v182 = *(double *)&v204[32];
  sub_101455F08((uint64_t)v183, (uint64_t)&v175);
  v99 = v182;
  v147 = *((double *)&v181 + 1);
  v149 = *(double *)&v181;
  v151 = *((double *)&v180 + 1);
  v153 = *(double *)&v180;
  v154 = *((double *)&v179 + 1);
  v155 = *(double *)&v179;
  v156 = *((double *)&v178 + 1);
  v157 = *(double *)&v178;
  v160 = *((double *)&v177 + 1);
  v161 = *(double *)&v177;
  v163 = *((double *)&v176 + 1);
  v167 = *(double *)&v176;
  v169 = *((double *)&v175 + 1);
  v171 = *(double *)&v175;
  v143 = *(double *)&v202[8];
  v145 = *(double *)v202;
  v139 = *(double *)&v202[24];
  v141 = *(double *)&v202[16];
  v135 = *(const char **)&v202[40];
  v137 = *(double *)&v202[32];
  v100 = *(_OWORD *)v203;
  v133 = *(double *)v203;
  v130 = *(double *)&v203[16];
  v101 = *(double *)&v203[24];
  v102 = *(_OWORD *)v204;
  v103 = *(double *)&v204[16];
  v104 = *(double *)&v204[24];
  v105 = *(double *)&v204[32];
  objc_msgSend(a3, "setMeanSeaLevelPressure:", &v204[32], v164+ v182 * v174[14]+ 0.0+ *((double *)&v181 + 1) * v174[13]+ *(double *)&v181 * v174[12]+ *((double *)&v180 + 1) * v174[11]+ *(double *)&v180 * v174[10]+ *((double *)&v179 + 1) * v174[9]+ *(double *)&v179 * v174[8]+ *((double *)&v178 + 1) * v174[7]+ *(double *)&v178 * v174[6]+ *((double *)&v177 + 1) * v174[5]+ *(double *)&v177 * v174[4]+ *((double *)&v176 + 1) * v174[3]+ *(double *)&v176 * v174[2]+ *((double *)&v175 + 1) * v174[1]
  + *(double *)&v175 * v174[0]);
  v106 = v165 + v37 * 2.0;
  v107 = v99 * v105
       + 0.0
       + v147 * v104
       + v149 * v103
       + v151 * *((double *)&v102 + 1)
       + v153 * *(double *)&v102
       + v154 * v101
       + v155 * v130
       + v156 * *((double *)&v100 + 1)
       + v157 * v133
       + v160 * *(double *)&v135
       + v161 * v137
       + v163 * v139
       + v167 * v141
       + v169 * v143
       + v171 * v145;
  if (v106 <= v107)
  {
    objc_msgSend(a3, "setUncertainty:", sqrt(v106));
  }
  else
  {
    objc_msgSend(a3, "setUncertainty:", sqrt(v106 - v107));
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v108 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a3, "uncertainty");
      v110 = v109;
      objc_msgSend(a3, "meanSeaLevelPressure");
      *(_DWORD *)v212 = 136316930;
      v213 = "uncertainty";
      v214 = 2048;
      *(_QWORD *)v215 = v110;
      *(_WORD *)&v215[8] = 2080;
      *(_QWORD *)&v215[10] = "mslp";
      *(_WORD *)&v215[18] = 2048;
      *(_QWORD *)&v215[20] = v111;
      *(_WORD *)&v215[28] = 2080;
      *(_QWORD *)&v215[30] = "queriedAprioriVerticalScale";
      *(_WORD *)&v215[38] = 2048;
      *(double *)&v215[40] = v106;
      *(_WORD *)&v215[48] = 2080;
      *(_QWORD *)&v215[50] = "uncertaintyUpdate";
      *(_WORD *)&v215[58] = 2048;
      *(double *)&v215[60] = v107;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "query information,%s,%f,%s,%f,%s,%f,%s,%f", v212, 0x52u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(v212, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v112 = qword_10229FE88;
      objc_msgSend(a3, "uncertainty");
      v114 = v113;
      objc_msgSend(a3, "meanSeaLevelPressure");
      v186 = 136316930;
      v187 = "uncertainty";
      v188 = 2048;
      v189 = v114;
      v190 = 2080;
      v191 = "mslp";
      v192 = 2048;
      v193 = v115;
      v194 = 2080;
      v195 = "queriedAprioriVerticalScale";
      v196 = 2048;
      v197 = v106;
      v198 = 2080;
      v199 = "uncertaintyUpdate";
      v200 = 2048;
      v201 = v107;
      LODWORD(v127) = 82;
      _os_log_send_and_compose_impl(2, 0, v212, 1628, &_mh_execute_header, v112, 0, "query information,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v186, v127, v128, v130, *((const char **)&v100 + 1), v133, v135, v137);
      v117 = (uint8_t *)v116;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]", "%s\n", v116);
      if (v117 != v212)
        free(v117);
    }
  }
  objc_msgSend(a3, "meanSeaLevelPressure");
  objc_msgSend(a3, "uncertainty");
  objc_msgSend(a3, "meanSeaLevelPressure");
  if (v118 <= 115000.0 && (objc_msgSend(a3, "meanSeaLevelPressure"), v119 >= 80000.0))
  {
    sub_1015A2E04(__p, "extrapolate or interpolate the mean sea level pressure:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureElement:withPrePhrase:](self, "printMeanSeaLevelPressureElement:withPrePhrase:", a3, __p);
    if (v173 < 0)
      operator delete(__p[0]);
    return 1;
  }
  else
  {
    objc_msgSend(a3, "setMeanSeaLevelPressure:", 101325.0);
    objc_msgSend(a3, "setUncertainty:", 6000.0);
    return 0;
  }
}

- (BOOL)getLastPressureSample:(double *)a3
{
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double Current;
  double v11;
  NSObject *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  BOOL v15;
  unint64_t *v16;
  unint64_t v17;
  const char *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  double v26;
  uint8_t buf[4];
  double v28;

  sub_100211128((uint64_t)&v21, (_QWORD *)self->_dataBuffers + 6);
  if (!v24)
  {
LABEL_16:
    v15 = 0;
    goto LABEL_23;
  }
  v4 = *(_OWORD *)(*(_QWORD *)(v22 + (((unint64_t)(v24 + v23 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v24 + v23 - 1));
  v5 = *(std::__shared_weak_count **)(*(_QWORD *)(v22 + (((unint64_t)(v24 + v23 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                                    + 16 * (v24 + v23 - 1)
                                    + 8);
  if (*((_QWORD *)&v4 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = v4;
  v9 = *(double *)v4;
  Current = CFAbsoluteTimeGetCurrent();
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v11 = vabdd_f64(v9, Current);
  v12 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "time difference from the last pressure,sample,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v25 = 134217984;
    v26 = v11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 2, "time difference from the last pressure,sample,%f", COERCE_DOUBLE(&v25));
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator getLastPressureSample:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  if (v11 > 720.0)
  {
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    goto LABEL_16;
  }
  *a3 = *(double *)(v8 + 8) * 1000.0;
  if (v5)
  {
    v16 = (unint64_t *)&v5->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v15 = 1;
LABEL_23:
  sub_1006F0FB8(&v21);
  return v15;
}

- (void)getMslpDriftRate:(double *)a3 withLastMslp:(double)a4
{
  double v6;
  float v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;

  v11 = 0.0;
  if (-[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v11))
  {
    v6 = v11;
  }
  else
  {
    v11 = a4;
    v6 = a4;
  }
  v7 = v6;
  v8 = sub_10024806C(v7, 101320.0) < 3000.0;
  v9 = 180.0;
  if (v8)
    v9 = 100.0;
  v10 = v9 * a4 / v11;
  if (*a3 > v10)
    v10 = *a3;
  *a3 = v10;
}

- (void)refreshHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4
{
  float v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t *v12;
  NSObject *v13;
  CLContextManagerElevationProfile *elevationProfileContextManager;
  const char *v15;
  uint8_t *v16;
  double v17;
  _QWORD v18[7];
  double v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  uint8_t buf[4];
  double v25;
  __int16 v26;
  double v27;

  v19 = 0.0;
  if (!-[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v19))
    v19 = 101325.0;
  if (self->_inVisitStatus && (v7 = v19, sub_10024806C(v7, 101320.0) < 3000.0))
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v8 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "refresh withdrawn due to in-visit.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "refresh withdrawn due to in-visit.", &v20, 2);
LABEL_32:
      v12 = (uint8_t *)v9;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:]", "%s\n", v9);
      if (v12 != buf)
        free(v12);
    }
  }
  else if (self->_lastRefreshTimestamp == 1.79769313e308
         || CFAbsoluteTimeGetCurrent() - self->_lastRefreshTimestamp >= self->_rateToRefreshHistoricalMeanSeaLevelPressure)
  {
    if (-[CLContextManagerElevationProfileBase registeredXPCTaskMSLP](self->_elevationProfileContextManager, "registeredXPCTaskMSLP"))
    {
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v11 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "delay registration of XPC task for mslp estimation", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        LOWORD(v20) = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "delay registration of XPC task for mslp estimation", &v20, 2);
        goto LABEL_32;
      }
    }
    else
    {
      self->_lastRefreshTimestamp = CFAbsoluteTimeGetCurrent();
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v13 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v25 = a3;
        v26 = 2048;
        v27 = a4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "calling refreshing mean sea level pressure,startTimestamp,%f,endTimestamp,%f", buf, 0x16u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v20 = 134218240;
        v21 = a3;
        v22 = 2048;
        v23 = a4;
        LODWORD(v17) = 22;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "calling refreshing mean sea level pressure,startTimestamp,%f,endTimestamp,%f", COERCE_DOUBLE(&v20), v17);
        v16 = (uint8_t *)v15;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:]", "%s\n", v15);
        if (v16 != buf)
          free(v16);
      }
      elevationProfileContextManager = self->_elevationProfileContextManager;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_101456B1C;
      v18[3] = &unk_1021B73F0;
      v18[4] = self;
      *(double *)&v18[5] = a4;
      *(double *)&v18[6] = a3;
      -[CLContextManagerElevationProfileBase getHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:](elevationProfileContextManager, "getHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:", v18, a3, a4);
    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v10 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "refresh withdrawn due to the last refresh event is finished within the past 30 mins.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "refresh withdrawn due to the last refresh event is finished within the past 30 mins.", &v20, 2);
      goto LABEL_32;
    }
  }
}

- (void)sentRefreshMslpAnalyticsWithAltitudeCorrection:(double)a3 uncertaintyBeforeCurrentRefresh:(double)a4 uncertaintyAfterCurrentRefresh:(double)a5 refreshDuration:(double)a6 xpcWaitingTime:(double)a7 timeDiffBtwRefresh:(double)a8 pressureDelta:(double)a9
{
  NSObject *v17;
  double latitudeAfterRefresh;
  double longitudeAfterRefresh;
  double currentLatitude;
  double currentLongitude;
  double v22;
  double v23;
  NSObject *v24;
  double v25;
  int numberOfRebaseBtwRefresh;
  int numberOfTrackEndedBtwRefresh;
  int numberOfWeatherUpdate;
  double uncertaintyAfterRefresh;
  _BOOL4 firstRefreshAfterVisit;
  double v31;
  double v32;
  double v33;
  double v34;
  const char *v35;
  uint8_t *v36;
  double v37;
  int v38;
  int v39;
  int v40;
  double v41;
  _BOOL4 v42;
  const char *v43;
  uint8_t *v44;
  double v45;
  const char *v46;
  void **v47;
  uint64_t v48;
  NSDictionary *(*v49)(uint64_t);
  const char *v50;
  CLMeanSeaLevelPressureEstimator *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int v60;
  const char *v61;
  __int16 v62;
  double v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  double v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  double v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  double v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  double v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  double v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  double v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  double v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  double v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  double v111;
  __int16 v112;
  const char *v113;
  __int16 v114;
  _BOOL4 v115;
  uint8_t buf[4];
  const char *v117;
  __int16 v118;
  double v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  double v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  double v127;
  __int16 v128;
  const char *v129;
  __int16 v130;
  int v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  int v135;
  __int16 v136;
  const char *v137;
  __int16 v138;
  int v139;
  __int16 v140;
  const char *v141;
  __int16 v142;
  double v143;
  __int16 v144;
  const char *v145;
  __int16 v146;
  double v147;
  __int16 v148;
  const char *v149;
  __int16 v150;
  double v151;
  __int16 v152;
  const char *v153;
  __int16 v154;
  double v155;
  __int16 v156;
  const char *v157;
  __int16 v158;
  double v159;
  __int16 v160;
  const char *v161;
  __int16 v162;
  double v163;
  __int16 v164;
  const char *v165;
  __int16 v166;
  double v167;
  __int16 v168;
  const char *v169;
  __int16 v170;
  _BOOL4 v171;

  if (self->_latitudeAfterRefresh != 1.79769313e308)
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v17 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      latitudeAfterRefresh = self->_latitudeAfterRefresh;
      longitudeAfterRefresh = self->_longitudeAfterRefresh;
      currentLatitude = self->_currentLatitude;
      currentLongitude = self->_currentLongitude;
      *(_DWORD *)buf = 134218752;
      v117 = *(const char **)&latitudeAfterRefresh;
      v118 = 2048;
      v119 = longitudeAfterRefresh;
      v120 = 2048;
      v121 = *(const char **)&currentLatitude;
      v122 = 2048;
      v123 = currentLongitude;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "refresh traveling distance location,lastLat,%f,lastLon,%f,currLat,%f,currLon,%f", buf, 0x2Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v31 = self->_latitudeAfterRefresh;
      v32 = self->_longitudeAfterRefresh;
      v33 = self->_currentLatitude;
      v34 = self->_currentLongitude;
      v60 = 134218752;
      v61 = *(const char **)&v31;
      v62 = 2048;
      v63 = v32;
      v64 = 2048;
      v65 = *(const char **)&v33;
      v66 = 2048;
      v67 = v34;
      LODWORD(v45) = 42;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "refresh traveling distance location,lastLat,%f,lastLon,%f,currLat,%f,currLon,%f", COERCE_DOUBLE(&v60), v45, *(double *)&v46, *(double *)&v47);
      v36 = (uint8_t *)v35;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator sentRefreshMslpAnalyticsWithAltitudeCorrection:uncertaintyBeforeCurrentRefresh:uncertaintyAfterCurrentRefresh:refreshDuration:xpcWaitingTime:timeDiffBtwRefresh:pressureDelta:]", "%s\n", v35);
      if (v36 != buf)
        free(v36);
    }
    v22 = sub_100124100(self->_latitudeAfterRefresh, self->_longitudeAfterRefresh, self->_currentLatitude, self->_currentLongitude);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v23 = fabs(v22);
    v24 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_maxPressure - self->_minPressure;
      numberOfRebaseBtwRefresh = self->_numberOfRebaseBtwRefresh;
      numberOfTrackEndedBtwRefresh = self->_numberOfTrackEndedBtwRefresh;
      numberOfWeatherUpdate = self->_numberOfWeatherUpdate;
      uncertaintyAfterRefresh = self->_uncertaintyAfterRefresh;
      firstRefreshAfterVisit = self->_firstRefreshAfterVisit;
      *(_DWORD *)buf = 136322050;
      v117 = "altitudeCorrection";
      v118 = 2048;
      v119 = a3;
      v120 = 2080;
      v121 = "minMaxPressureDelta";
      v122 = 2048;
      v123 = v25;
      v124 = 2080;
      v125 = "pressureDelta";
      v126 = 2048;
      v127 = a9;
      v128 = 2080;
      v129 = "numberOfRebase";
      v130 = 1024;
      v131 = numberOfRebaseBtwRefresh;
      v132 = 2080;
      v133 = "numberOfTrackEnded";
      v134 = 1024;
      v135 = numberOfTrackEndedBtwRefresh;
      v136 = 2080;
      v137 = "numberOfWeatherUpdate";
      v138 = 1024;
      v139 = numberOfWeatherUpdate;
      v140 = 2080;
      v141 = "refreshDuration";
      v142 = 2048;
      v143 = a6;
      v144 = 2080;
      v145 = "timeDiffBtwRefresh";
      v146 = 2048;
      v147 = a8;
      v148 = 2080;
      v149 = "travelingDistance";
      v150 = 2048;
      v151 = v23;
      v152 = 2080;
      v153 = "uncertaintyAfterFormerRefresh";
      v154 = 2048;
      v155 = uncertaintyAfterRefresh;
      v156 = 2080;
      v157 = "uncertaintyAfterLatterRefresh";
      v158 = 2048;
      v159 = a5;
      v160 = 2080;
      v161 = "uncertaintyBeforeLatterRefresh";
      v162 = 2048;
      v163 = a4;
      v164 = 2080;
      v165 = "xpcWaitingTime";
      v166 = 2048;
      v167 = a7;
      v168 = 2080;
      v169 = "firstRefreshAfterVisit";
      v170 = 1024;
      v171 = firstRefreshAfterVisit;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "sent refresh mslp event to CoreAnalytics,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d", buf, 0x10Au);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v37 = self->_maxPressure - self->_minPressure;
      v38 = self->_numberOfRebaseBtwRefresh;
      v39 = self->_numberOfTrackEndedBtwRefresh;
      v40 = self->_numberOfWeatherUpdate;
      v41 = self->_uncertaintyAfterRefresh;
      v42 = self->_firstRefreshAfterVisit;
      v60 = 136322050;
      v61 = "altitudeCorrection";
      v62 = 2048;
      v63 = a3;
      v64 = 2080;
      v65 = "minMaxPressureDelta";
      v66 = 2048;
      v67 = v37;
      v68 = 2080;
      v69 = "pressureDelta";
      v70 = 2048;
      v71 = a9;
      v72 = 2080;
      v73 = "numberOfRebase";
      v74 = 1024;
      v75 = v38;
      v76 = 2080;
      v77 = "numberOfTrackEnded";
      v78 = 1024;
      v79 = v39;
      v80 = 2080;
      v81 = "numberOfWeatherUpdate";
      v82 = 1024;
      v83 = v40;
      v84 = 2080;
      v85 = "refreshDuration";
      v86 = 2048;
      v87 = a6;
      v88 = 2080;
      v89 = "timeDiffBtwRefresh";
      v90 = 2048;
      v91 = a8;
      v92 = 2080;
      v93 = "travelingDistance";
      v94 = 2048;
      v95 = v23;
      v96 = 2080;
      v97 = "uncertaintyAfterFormerRefresh";
      v98 = 2048;
      v99 = v41;
      v100 = 2080;
      v101 = "uncertaintyAfterLatterRefresh";
      v102 = 2048;
      v103 = a5;
      v104 = 2080;
      v105 = "uncertaintyBeforeLatterRefresh";
      v106 = 2048;
      v107 = a4;
      v108 = 2080;
      v109 = "xpcWaitingTime";
      v110 = 2048;
      v111 = a7;
      v112 = 2080;
      v113 = "firstRefreshAfterVisit";
      v114 = 1024;
      v115 = v42;
      LODWORD(v45) = 266;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "sent refresh mslp event to CoreAnalytics,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d", (const char *)&v60, v45, v46, *(double *)&v47, (const char *)v48, *(double *)&v49, v50, (_DWORD)v51, *(const char **)&v52, LODWORD(v53), *(const char **)&v54,
        LODWORD(v55),
        *(const char **)&v56,
        v57,
        *(const char **)&v58,
        v59);
      v44 = (uint8_t *)v43;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator sentRefreshMslpAnalyticsWithAltitudeCorrection:uncertaintyBeforeCurrentRefresh:uncertaintyAfterCurrentRefresh:refreshDuration:xpcWaitingTime:timeDiffBtwRefresh:pressureDelta:]", "%s\n", v43);
      if (v44 != buf)
        free(v44);
    }
    v47 = _NSConcreteStackBlock;
    v48 = 3221225472;
    v49 = sub_101457B30;
    v50 = (const char *)&unk_1021B7418;
    v51 = self;
    v52 = a3;
    v53 = a9;
    v54 = a6;
    v55 = a8;
    v56 = v23;
    v57 = a5;
    v58 = a4;
    v59 = a7;
    AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Altimeter.RefreshMslp"), &v47);
  }
}

- (void)getAndSendCurrentEstimateMeanSeaLevelPressureFrom:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;

  self->_currentEstimateMslp = (CLMeanSeaLevelPressureData *)-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure](self, "getEstimatedMeanSeaLevelPressure");
  -[CLMeanSeaLevelPressureEstimator updateUncertinatyAndSendCurrentEstimateMslpFrom:](self, "updateUncertinatyAndSendCurrentEstimateMslpFrom:", v3);
}

- (void)updateUncertinatyAndSendCurrentEstimateMslpFrom:(int)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  float v23;
  double v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint8_t *v33;
  double v34;
  int v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  _BOOL4 v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  _BOOL4 v66;

  if (self->_inVisitStatus)
  {
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
    if (v5 != 1.79769313e308)
    {
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      if (v6 != 1.79769313e308)
      {
        -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
        v8 = v7;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
        v10 = v9;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        v12 = vabdd_f64(v10, v11);
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        v14 = v12 + v13;
        if (v14 >= v8)
          v14 = v8;
        -[CLMeanSeaLevelPressureData setUncertainty:](self->_currentEstimateMslp, "setUncertainty:", v14);
      }
    }
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v15 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
    v17 = v16;
    -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
    v19 = v18;
    -[CLMeanSeaLevelPressureData timestamp](self->_currentEstimateMslp, "timestamp");
    *(_DWORD *)buf = 136316930;
    v52 = "meanSeaLevelPressure";
    v53 = 2048;
    v54 = v17;
    v55 = 2080;
    v56 = "uncertainty";
    v57 = 2048;
    v58 = v19;
    v59 = 2080;
    v60 = "timestamp";
    v61 = 2048;
    v62 = v20;
    v63 = 2080;
    v64 = "resetInVisitReference";
    v65 = 1024;
    v66 = a3 != 1;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "current estimate mean sea level pressure sent to AOP,%s,%f,%s,%f,%s,%f,%s,%d", buf, 0x4Eu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v26 = qword_10229FE88;
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
    v28 = v27;
    -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
    v30 = v29;
    -[CLMeanSeaLevelPressureData timestamp](self->_currentEstimateMslp, "timestamp");
    v35 = 136316930;
    v36 = "meanSeaLevelPressure";
    v37 = 2048;
    v38 = v28;
    v39 = 2080;
    v40 = "uncertainty";
    v41 = 2048;
    v42 = v30;
    v43 = 2080;
    v44 = "timestamp";
    v45 = 2048;
    v46 = v31;
    v47 = 2080;
    v48 = "resetInVisitReference";
    v49 = 1024;
    v50 = a3 != 1;
    LODWORD(v34) = 78;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v26, 0, "current estimate mean sea level pressure sent to AOP,%s,%f,%s,%f,%s,%f,%s,%d", (const char *)&v35, v34);
    v33 = (uint8_t *)v32;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateUncertinatyAndSendCurrentEstimateMslpFrom:]", "%s\n", v32);
    if (v33 != buf)
      free(v33);
  }
  v21 = sub_1001FBB04(0);
  -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
  v23 = v22;
  -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
  v25 = v24;
  (*(void (**)(uint64_t, BOOL, float, float))(*(_QWORD *)(v21 + 112) + 64))(v21 + 112, a3 != 1, v23, v25);
}

- (void)getLastHistoricalMeanSeaLevelPressureData:(double *)a3
{
  uint64_t v5;
  id v6;
  void *__p[2];
  char v8;

  if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count"))
  {
    objc_msgSend(-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject"), "timestamp");
    *(_QWORD *)a3 = v5;
    v6 = -[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject");
    sub_1015A2E04(__p, "get last mean sea level pressure");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureElement:withPrePhrase:](self, "printMeanSeaLevelPressureElement:withPrePhrase:", v6, __p);
    if (v8 < 0)
      operator delete(__p[0]);
  }
}

- (void)cleanHistoricalMslpArrayForForceRebase:(id)a3
{
  uint64_t v4;

  v4 = 0x7FEFFFFFFFFFFFFFLL;
  if (-[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:", a3)
    && -[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v4))
  {
    if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count"))
      -[NSMutableArray removeAllObjects](self->_meanSeaLevelPressureArray, "removeAllObjects");
    if (-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"))
      -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");
    -[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist](self, "clearMeanSeaLevelPressureArrayInPlist");
    self->_cumulativeStartTime = 1.79769313e308;
  }
}

- (BOOL)isValidMslp:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;

  objc_msgSend(a3, "uncertainty");
  if (v4 > 6000.0)
    objc_msgSend(a3, "setUncertainty:");
  objc_msgSend(a3, "timestamp");
  if (v5 == 1.79769313e308)
    return 0;
  objc_msgSend(a3, "meanSeaLevelPressure");
  if (v6 > 115000.0)
    return 0;
  objc_msgSend(a3, "meanSeaLevelPressure");
  if (v7 < 80000.0)
    return 0;
  objc_msgSend(a3, "uncertainty");
  return v9 > 0.0;
}

- (BOOL)updateHistoricalMslpArray:(id)a3 from:(int)a4
{
  uint64_t v4;
  unsigned int v7;
  double v8;
  double Current;
  int v10;
  double v11;
  NSObject *v12;
  double cumulativeStartTime;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  const char *v18;
  uint8_t *v19;
  double v20;
  NSObject *v21;
  CLMeanSeaLevelPressureData *v22;
  NSMutableArray *recentMeanSeaLevelPressureArray;
  id v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *i;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double lastTimestampSavedMslpForRecovery;
  NSObject *v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSMutableArray *meanSeaLevelPressureArray;
  double v50;
  NSObject *v51;
  NSObject *v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double lastTimestampSavedRecentMslpForRecovery;
  NSMutableArray *v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint8_t *v73;
  const char *v74;
  uint8_t *v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint8_t *v86;
  const char *v87;
  uint8_t *v88;
  double v90;
  const char *v91;
  id v92;
  void *v93;
  double v94;
  const char *v95;
  void *__p;
  const char *v97;
  double v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  double v103;
  int v104;
  const char *v105;
  __int16 v106;
  _BYTE v107[14];
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  const char *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  const char *v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  const char *v119;
  __int16 v120;
  uint64_t v121;
  uint8_t v122[128];
  uint8_t buf[4];
  const char *v124;
  __int16 v125;
  _BYTE v126[14];
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  const char *v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  const char *v134;
  __int16 v135;
  uint64_t v136;
  __int16 v137;
  const char *v138;
  __int16 v139;
  uint64_t v140;

  v4 = *(_QWORD *)&a4;
  v103 = 1.79769313e308;
  v7 = -[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:");
  if (!v7)
    return v7;
  v7 = -[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v103);
  if (!v7)
    return v7;
  if (self->_cumulativeStartTime == 1.79769313e308
    || (objc_msgSend(a3, "timestamp"), v8 - self->_cumulativeStartTime > 0.0))
  {
    objc_msgSend(a3, "setPressureMeasurement:", v103);
    if (!(_DWORD)v4 && self->_inVisitStatus)
      -[CLMeanSeaLevelPressureEstimator resetInVisitRebasedMslp](self, "resetInVisitRebasedMslp");
    Current = CFAbsoluteTimeGetCurrent();
    v10 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
    v92 = -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count");
    if (self->_cumulativeStartTime == 1.79769313e308)
    {
      if ((int)v92 < 1)
      {
LABEL_49:
        objc_msgSend(a3, "timestamp");
        self->_cumulativeStartTime = v50;
        goto LABEL_50;
      }
      objc_msgSend(-[NSMutableArray firstObject](self->_recentMeanSeaLevelPressureArray, "firstObject"), "timestamp");
      self->_cumulativeStartTime = v11;
    }
    else if ((int)v92 < 1)
    {
      goto LABEL_50;
    }
    objc_msgSend(a3, "timestamp");
    if (v20 - self->_cumulativeStartTime > 900.0)
    {
      if (v10 >= 15)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_meanSeaLevelPressureArray, "removeObjectAtIndex:", 0);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v21 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v124 = "mslpArrayCount";
          v125 = 1024;
          *(_DWORD *)v126 = v10 - 1;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "remove the oldest mean sea level pressure,%s,%d", buf, 0x12u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021B7438);
          v104 = 136315394;
          v105 = "mslpArrayCount";
          v106 = 1024;
          *(_DWORD *)v107 = v10 - 1;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "remove the oldest mean sea level pressure,%s,%d", (const char *)&v104, 18);
          v88 = (uint8_t *)v87;
          sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v87);
          if (v88 != buf)
            free(v88);
        }
      }
      v22 = objc_opt_new(CLMeanSeaLevelPressureData);
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recentMeanSeaLevelPressureArray, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v100;
        v26 = 0.0;
        v27 = 0.0;
        v28 = 0.0;
        v29 = 0.0;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v100 != v25)
              objc_enumerationMutation(recentMeanSeaLevelPressureArray);
            v31 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v31, "timestamp");
            v33 = v32;
            objc_msgSend(v31, "meanSeaLevelPressure");
            v35 = v34;
            objc_msgSend(v31, "uncertainty");
            v37 = v36;
            objc_msgSend(v31, "pressureMeasurement");
            v26 = v26 + v33;
            v27 = v27 + v35;
            v28 = v28 + v37;
            v29 = v29 + v38;
          }
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](recentMeanSeaLevelPressureArray, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
        }
        while (v24);
      }
      else
      {
        v26 = 0.0;
        v27 = 0.0;
        v28 = 0.0;
        v29 = 0.0;
      }
      -[CLMeanSeaLevelPressureData setTimestamp:](v22, "setTimestamp:", v26 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v22, "setMeanSeaLevelPressure:", v27 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[CLMeanSeaLevelPressureData setUncertainty:](v22, "setUncertainty:", v28 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[CLMeanSeaLevelPressureData setPressureMeasurement:](v22, "setPressureMeasurement:", v29 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[NSMutableArray addObject:](self->_meanSeaLevelPressureArray, "addObject:", v22);
      lastTimestampSavedMslpForRecovery = self->_lastTimestampSavedMslpForRecovery;
      if (lastTimestampSavedMslpForRecovery == 1.79769313e308
        || vabdd_f64(Current, lastTimestampSavedMslpForRecovery) > 180.0)
      {
        -[CLMeanSeaLevelPressureEstimator saveMeanSeaLevelPressureArrayToPlist](self, "saveMeanSeaLevelPressureArrayToPlist");
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v40 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        v41 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v22, "meanSeaLevelPressure");
        v43 = v42;
        -[CLMeanSeaLevelPressureData uncertainty](v22, "uncertainty");
        v45 = v44;
        -[CLMeanSeaLevelPressureData timestamp](v22, "timestamp");
        v47 = v46;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v22, "pressureMeasurement");
        *(_DWORD *)buf = 136317442;
        v124 = "count";
        v125 = 1024;
        *(_DWORD *)v126 = v41;
        *(_WORD *)&v126[4] = 2080;
        *(_QWORD *)&v126[6] = "meanSeaLevelPressure";
        v127 = 2048;
        v128 = v43;
        v129 = 2080;
        v130 = "uncertainty";
        v131 = 2048;
        v132 = v45;
        v133 = 2080;
        v134 = "timestamp";
        v135 = 2048;
        v136 = v47;
        v137 = 2080;
        v138 = "measurePressure";
        v139 = 2048;
        v140 = v48;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "add mslp to mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x62u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v76 = qword_10229FE88;
        v77 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v22, "meanSeaLevelPressure");
        v79 = v78;
        -[CLMeanSeaLevelPressureData uncertainty](v22, "uncertainty");
        v81 = v80;
        -[CLMeanSeaLevelPressureData timestamp](v22, "timestamp");
        v83 = v82;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v22, "pressureMeasurement");
        v104 = 136317442;
        v105 = "count";
        v106 = 1024;
        *(_DWORD *)v107 = v77;
        *(_WORD *)&v107[4] = 2080;
        *(_QWORD *)&v107[6] = "meanSeaLevelPressure";
        v108 = 2048;
        v109 = v79;
        v110 = 2080;
        v111 = "uncertainty";
        v112 = 2048;
        v113 = v81;
        v114 = 2080;
        v115 = "timestamp";
        v116 = 2048;
        v117 = v83;
        v118 = 2080;
        v119 = "measurePressure";
        v120 = 2048;
        v121 = v84;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v76, 0, "add mslp to mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v104, 98, v91, *(double *)&v92, (const char *)v93, v94, v95, *(double *)&__p, v97, v98);
        v86 = (uint8_t *)v85;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v85);
        if (v86 != buf)
          free(v86);
      }
      meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
      sub_1015A2E04(&__p, "mean sea level pressure array updates to:");
      -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](self, "printMeanSeaLevelPressureArray:withPrePhrase:", meanSeaLevelPressureArray, &__p);
      if (SHIBYTE(v98) < 0)
        operator delete(__p);
      -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");

      goto LABEL_49;
    }
LABEL_50:
    if ((unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count") >= 0xF)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_recentMeanSeaLevelPressureArray, "removeObjectAtIndex:", 0);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v51 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v124 = "recentMslpArrayCount";
        v125 = 1024;
        *(_DWORD *)v126 = (_DWORD)v92 - 1;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "remove the oldest recent mslp,%s,%d", buf, 0x12u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v104 = 136315394;
        v105 = "recentMslpArrayCount";
        v106 = 1024;
        *(_DWORD *)v107 = (_DWORD)v92 - 1;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "remove the oldest recent mslp,%s,%d", (const char *)&v104, 18);
        v75 = (uint8_t *)v74;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v74);
        if (v75 != buf)
          free(v75);
      }
    }
    -[NSMutableArray addObject:](self->_recentMeanSeaLevelPressureArray, "addObject:", a3);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v52 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      v53 = -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count");
      objc_msgSend(a3, "meanSeaLevelPressure");
      v55 = v54;
      objc_msgSend(a3, "uncertainty");
      v57 = v56;
      objc_msgSend(a3, "timestamp");
      v59 = v58;
      objc_msgSend(a3, "pressureMeasurement");
      *(_DWORD *)buf = 136317442;
      v124 = "count";
      v125 = 1024;
      *(_DWORD *)v126 = v53;
      *(_WORD *)&v126[4] = 2080;
      *(_QWORD *)&v126[6] = "meanSeaLevelPressure";
      v127 = 2048;
      v128 = v55;
      v129 = 2080;
      v130 = "uncertainty";
      v131 = 2048;
      v132 = v57;
      v133 = 2080;
      v134 = "timestamp";
      v135 = 2048;
      v136 = v59;
      v137 = 2080;
      v138 = "measurePressure";
      v139 = 2048;
      v140 = v60;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "add mslp to recent mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x62u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v63 = qword_10229FE88;
      v64 = -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count");
      objc_msgSend(a3, "meanSeaLevelPressure");
      v66 = v65;
      objc_msgSend(a3, "uncertainty");
      v68 = v67;
      objc_msgSend(a3, "timestamp");
      v70 = v69;
      objc_msgSend(a3, "pressureMeasurement");
      v104 = 136317442;
      v105 = "count";
      v106 = 1024;
      *(_DWORD *)v107 = v64;
      *(_WORD *)&v107[4] = 2080;
      *(_QWORD *)&v107[6] = "meanSeaLevelPressure";
      v108 = 2048;
      v109 = v66;
      v110 = 2080;
      v111 = "uncertainty";
      v112 = 2048;
      v113 = v68;
      v114 = 2080;
      v115 = "timestamp";
      v116 = 2048;
      v117 = v70;
      v118 = 2080;
      v119 = "measurePressure";
      v120 = 2048;
      v121 = v71;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v63, 0, "add mslp to recent mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", (const char *)&v104, 98, v91, *(double *)&v92, (const char *)v93, v94, v95, *(double *)&__p, v97, v98);
      v73 = (uint8_t *)v72;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v72);
      if (v73 != buf)
        free(v73);
    }
    lastTimestampSavedRecentMslpForRecovery = self->_lastTimestampSavedRecentMslpForRecovery;
    if (lastTimestampSavedRecentMslpForRecovery == 1.79769313e308
      || vabdd_f64(Current, lastTimestampSavedRecentMslpForRecovery) > 180.0)
    {
      -[CLMeanSeaLevelPressureEstimator saveRecentMeanSeaLevelPressureArrayToPlist](self, "saveRecentMeanSeaLevelPressureArrayToPlist");
    }
    v62 = self->_recentMeanSeaLevelPressureArray;
    sub_1015A2E04(&v93, "recent mslp array updates to:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](self, "printMeanSeaLevelPressureArray:withPrePhrase:", v62, &v93);
    if (SHIBYTE(v95) < 0)
      operator delete(v93);
    -[CLMeanSeaLevelPressureEstimator getAndSendCurrentEstimateMeanSeaLevelPressureFrom:](self, "getAndSendCurrentEstimateMeanSeaLevelPressureFrom:", v4);
    LOBYTE(v7) = 1;
    return v7;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v12 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a3, "timestamp");
    cumulativeStartTime = self->_cumulativeStartTime;
    *(_DWORD *)buf = 134218240;
    v124 = v14;
    v125 = 2048;
    *(double *)v126 = cumulativeStartTime;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "return early in update historical mslp array due to fall back timestamp,sampleTimestamp,%f,cumulativeStartTime,%f", buf, 0x16u);
  }
  v7 = sub_1001BFF7C(115, 2);
  if (v7)
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v15 = qword_10229FE88;
    objc_msgSend(a3, "timestamp");
    v16 = self->_cumulativeStartTime;
    v104 = 134218240;
    v105 = v17;
    v106 = 2048;
    *(double *)v107 = v16;
    LODWORD(v90) = 22;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v15, 0, "return early in update historical mslp array due to fall back timestamp,sampleTimestamp,%f,cumulativeStartTime,%f", COERCE_DOUBLE(&v104), v90);
    v19 = (uint8_t *)v18;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]", "%s\n", v18);
    if (v19 != buf)
      free(v19);
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)updateInVisitRebasedMslp:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint8_t *v18;
  double v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;

  if (-[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:"))
  {
    objc_msgSend(a3, "meanSeaLevelPressure");
    -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](self->_inVisitRebasedMslp, "setMeanSeaLevelPressure:");
    objc_msgSend(a3, "uncertainty");
    -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:");
    objc_msgSend(a3, "timestamp");
    -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:");
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v5 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
      v7 = v6;
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      v9 = v8;
      -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
      *(_DWORD *)buf = 134218496;
      v27 = v7;
      v28 = 2048;
      v29 = v9;
      v30 = 2048;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "in visit rebased location mean sea level pressure sample,meanSeaLevelPressure,%f,uncertainty,%f,timestamp,%f", buf, 0x20u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v11 = qword_10229FE88;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
      v13 = v12;
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      v15 = v14;
      -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
      v20 = 134218496;
      v21 = v13;
      v22 = 2048;
      v23 = v15;
      v24 = 2048;
      v25 = v16;
      LODWORD(v19) = 32;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v11, 0, "in visit rebased location mean sea level pressure sample,meanSeaLevelPressure,%f,uncertainty,%f,timestamp,%f", COERCE_DOUBLE(&v20), v19);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator updateInVisitRebasedMslp:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
    -[CLMeanSeaLevelPressureEstimator saveInVisitRebasedMslpToPlist](self, "saveInVisitRebasedMslpToPlist");
  }
}

- (void)writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:(double)a3
{
  char *v5;
  char *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double lastRefreshTimestamp;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __int16 v15[8];
  void *__p;
  _BYTE *v17;
  void *v18;
  _BYTE *v19;
  void *v20;
  _BYTE *v21;
  _QWORD v22[178];
  uint64_t v23;
  char v24;
  uint8_t buf[1640];

  if (self->_logInitialHistoricalMeanSeaLevelPressure
    && -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count"))
  {
    sub_1015EB864(v22);
    v24 |= 1u;
    *(double *)&v22[77] = a3;
    sub_101604600((uint64_t)v22);
    v5 = (char *)-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
    sub_1000ECE2C(&v20, (unint64_t)v5);
    sub_1000ECE2C(&v18, (unint64_t)v5);
    sub_1000ECE2C(&__p, (unint64_t)v5);
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->_meanSeaLevelPressureArray, "objectAtIndexedSubscript:", i), "timestamp");
        *((_QWORD *)v20 + (_QWORD)i) = v7;
        objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->_meanSeaLevelPressureArray, "objectAtIndexedSubscript:", i), "meanSeaLevelPressure");
        *((_QWORD *)v18 + (_QWORD)i) = v8;
        objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](self->_meanSeaLevelPressureArray, "objectAtIndexedSubscript:", i), "uncertainty");
        *((_QWORD *)__p + (_QWORD)i) = v9;
      }
    }
    v10 = v23;
    if ((void **)(v23 + 32) != &v20)
    {
      sub_10034F2B0((char *)(v23 + 32), (char *)v20, (uint64_t)v21, (v21 - (_BYTE *)v20) >> 3);
      v10 = v23;
    }
    if ((void **)(v10 + 8) != &v18)
    {
      sub_10034F2B0((char *)(v10 + 8), (char *)v18, (uint64_t)v19, (v19 - (_BYTE *)v18) >> 3);
      v10 = v23;
    }
    if ((void **)(v10 + 56) != &__p)
    {
      sub_10034F2B0((char *)(v10 + 56), (char *)__p, (uint64_t)v17, (v17 - (_BYTE *)__p) >> 3);
      v10 = v23;
    }
    lastRefreshTimestamp = self->_lastRefreshTimestamp;
    *(_BYTE *)(v10 + 88) |= 1u;
    *(double *)(v10 + 80) = lastRefreshTimestamp;
    if (qword_1023118A8 != -1)
      dispatch_once(&qword_1023118A8, &stru_1021B7458);
    if (qword_1023118B0)
      sub_101888B64(qword_1023118B0, (uint64_t)v22);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v12 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "write initial mean sea level pressure array to msl.", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v15[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "write initial mean sea level pressure array to msl.", v15, 2);
      v14 = (uint8_t *)v13;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:]", "%s\n", v13);
      if (v14 != buf)
        free(v14);
    }
    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
    if (v18)
    {
      v19 = v18;
      operator delete(v18);
    }
    if (v20)
    {
      v21 = v20;
      operator delete(v20);
    }
    sub_1015EE304((PB::Base *)v22);
  }
}

- (void)onMslp:(const CMMeanSeaLevelPressure *)a3
{
  NSObject *v5;
  CFAbsoluteTime Current;
  double var1;
  double var2;
  CLMeanSeaLevelPressureData *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  CFAbsoluteTime v14;
  double v15;
  double v16;
  const char *v17;
  uint8_t *v18;
  uint8_t *v19;
  double v20;
  _BYTE v21[12];
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint8_t buf[4];
  CFAbsoluteTime v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;

  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v5 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    Current = CFAbsoluteTimeGetCurrent();
    var1 = a3->var1;
    var2 = a3->var2;
    *(_DWORD *)buf = 134218496;
    v27 = Current;
    v28 = 2048;
    v29 = var1;
    v30 = 2048;
    v31 = var2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mslp from aop,timestamp,%f,mslp,%f,uncertainty,%f", buf, 0x20u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v13 = qword_10229FE88;
    v14 = CFAbsoluteTimeGetCurrent();
    v15 = a3->var1;
    v16 = a3->var2;
    *(_DWORD *)v21 = 134218496;
    *(CFAbsoluteTime *)&v21[4] = v14;
    v22 = 2048;
    v23 = v15;
    v24 = 2048;
    v25 = v16;
    LODWORD(v20) = 32;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v13, 0, "mslp from aop,timestamp,%f,mslp,%f,uncertainty,%f", COERCE_DOUBLE(v21), v20);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator onMslp:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
  v9 = objc_opt_new(CLMeanSeaLevelPressureData);
  -[CLMeanSeaLevelPressureData setTimestamp:](v9, "setTimestamp:", a3->var0);
  -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v9, "setMeanSeaLevelPressure:", a3->var1);
  -[CLMeanSeaLevelPressureData setUncertainty:](v9, "setUncertainty:", a3->var2);
  if (-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:](self, "updateHistoricalMslpArray:from:", v9, 1))
  {
    ++self->_numberOfWeatherUpdate;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v10 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "mslp array is successfully updated from AOP weather estimate", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      *(_WORD *)v21 = 0;
      LODWORD(v20) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "mslp array is successfully updated from AOP weather estimate", v21, *(_QWORD *)&v20, *(_QWORD *)v21);
LABEL_28:
      v19 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator onMslp:]", "%s\n", v11);
      if (v19 != buf)
        free(v19);
    }
  }
  else
  {
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v12 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "mslp array fails to update from AOP weather estimate", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      *(_WORD *)v21 = 0;
      LODWORD(v20) = 2;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "mslp array fails to update from AOP weather estimate", v21, *(_QWORD *)&v20, *(_QWORD *)v21);
      goto LABEL_28;
    }
  }

}

- (void)resetInVisitRebasedMslp
{
  NSObject *v3;
  uint64_t v4;
  const char *v5;
  uint8_t *v6;
  int v7;
  CFAbsoluteTime v8;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:", 1.79769313e308);
  -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](self->_inVisitRebasedMslp, "setMeanSeaLevelPressure:", 1.79769313e308);
  -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:", 1.79769313e308);
  -[CLMeanSeaLevelPressureEstimator clearInVisitRebasedMslpInPlist](self, "clearInVisitRebasedMslpInPlist");
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v3 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset in visit rebased Mslp,timestamp,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v4 = qword_10229FE88;
    v7 = 134217984;
    v8 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v4, 0, "reset in visit rebased Mslp,timestamp,%f", COERCE_DOUBLE(&v7));
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator resetInVisitRebasedMslp]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }
}

- (void)clearInVisitRebasedMslpInPlist
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  CFAbsoluteTime v11;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  v2 = sub_1001FD94C();
  sub_100525484(v2, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", 0xFFFFFFFFLL);
  v3 = sub_1001FD94C();
  sub_100525484(v3, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", 0xFFFFFFFFLL);
  v4 = sub_1001FD94C();
  sub_100525484(v4, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", 0xFFFFFFFFLL);
  v5 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 944))(v5);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v6 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "clear visit rebase location to plist,timestamp,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v7 = qword_10229FE88;
    v10 = 134217984;
    v11 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 0, "clear visit rebase location to plist,timestamp,%f", COERCE_DOUBLE(&v10));
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator clearInVisitRebasedMslpInPlist]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
}

- (void)clearMeanSeaLevelPressureArrayInPlist
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  CFAbsoluteTime v13;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  v2 = sub_1001FD94C();
  sub_1005254E4(v2);
  v3 = sub_1001FD94C();
  sub_1005254E4(v3);
  v4 = sub_1001FD94C();
  sub_1005254E4(v4);
  v5 = sub_1001FD94C();
  sub_1005254E4(v5);
  v6 = sub_1001FD94C();
  sub_100525484(v6, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", 0xFFFFFFFFLL);
  v7 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v7 + 944))(v7);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v8 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "clear mean sea level pressure in plist,timestamp,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v9 = qword_10229FE88;
    v12 = 134217984;
    v13 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v9, 0, "clear mean sea level pressure in plist,timestamp,%f", COERCE_DOUBLE(&v12));
    v11 = (uint8_t *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist]", "%s\n", v10);
    if (v11 != buf)
      free(v11);
  }
}

- (void)clearRecentMeanSeaLevelPressureArrayInPlist
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  CFAbsoluteTime v12;
  uint8_t buf[4];
  CFAbsoluteTime Current;

  v2 = sub_1001FD94C();
  sub_1005254E4(v2);
  v3 = sub_1001FD94C();
  sub_1005254E4(v3);
  v4 = sub_1001FD94C();
  sub_1005254E4(v4);
  v5 = sub_1001FD94C();
  sub_1005254E4(v5);
  v6 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 944))(v6);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v7 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "clear recent mean sea level pressure in plist,timestamp,%f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v8 = qword_10229FE88;
    v11 = 134217984;
    v12 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v8, 0, "clear recent mean sea level pressure in plist,timestamp,%f", COERCE_DOUBLE(&v11));
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator clearRecentMeanSeaLevelPressureArrayInPlist]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
}

- (void)saveMeanSeaLevelPressureArrayToPlist
{
  CFAbsoluteTime Current;
  id v4;
  id v5;
  id v6;
  NSMutableArray *meanSeaLevelPressureArray;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CLMeanSeaLevelPressureEstimator *p_lastRefreshTimestamp;
  uint64_t v19;
  NSObject *v20;
  Class isa;
  Class v22;
  const char *v23;
  uint8_t *v24;
  CLMeanSeaLevelPressureEstimator *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *__p[2];
  char v32;
  int v33;
  Class v34;
  uint8_t buf[4];
  Class v36;
  _BYTE v37[128];

  Current = CFAbsoluteTimeGetCurrent();
  if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count")
    && self->_lastRefreshTimestamp != 1.79769313e308)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = objc_alloc_init((Class)NSMutableArray);
    v25 = self;
    v26 = objc_alloc_init((Class)NSMutableArray);
    meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
    sub_1015A2E04(__p, "save mean sea level array to cache:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](v25, "printMeanSeaLevelPressureArray:withPrePhrase:", meanSeaLevelPressureArray, __p);
    if (v32 < 0)
      operator delete(__p[0]);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v25->_meanSeaLevelPressureArray;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "timestamp");
          objc_msgSend(v4, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v12, "meanSeaLevelPressure");
          objc_msgSend(v5, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v12, "uncertainty");
          objc_msgSend(v6, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v12, "pressureMeasurement");
          objc_msgSend(v26, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v9);
    }
    -[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist](v25, "clearMeanSeaLevelPressureArrayInPlist");
    v13 = sub_1001FD94C();
    sub_10023EC14(v13);
    v14 = sub_1001FD94C();
    sub_10023EC14(v14);
    v15 = sub_1001FD94C();
    sub_10023EC14(v15);
    v16 = sub_1001FD94C();
    sub_10023EC14(v16);
    v17 = sub_1001FD94C();
    p_lastRefreshTimestamp = (CLMeanSeaLevelPressureEstimator *)&v25->_lastRefreshTimestamp;
    sub_10018A4CC(v17, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", &v25->_lastRefreshTimestamp);
    v19 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 944))(v19);
    v25->_lastTimestampSavedMslpForRecovery = Current;

    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v20 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      isa = p_lastRefreshTimestamp->super.isa;
      *(_DWORD *)buf = 134217984;
      v36 = isa;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "save the latest refresh time to plist,%f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v22 = p_lastRefreshTimestamp->super.isa;
      v33 = 134217984;
      v34 = v22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "save the latest refresh time to plist,%f", COERCE_DOUBLE(&v33));
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator saveMeanSeaLevelPressureArrayToPlist]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }
  }
}

- (void)saveRecentMeanSeaLevelPressureArrayToPlist
{
  CFAbsoluteTime Current;
  id v4;
  id v5;
  id v6;
  id v7;
  NSMutableArray *recentMeanSeaLevelPressureArray;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CLMeanSeaLevelPressureEstimator *v18;
  _QWORD *v19;
  NSMutableArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *__p[2];
  char v26;
  _BYTE v27[128];

  Current = CFAbsoluteTimeGetCurrent();
  if (-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"))
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = objc_alloc_init((Class)NSMutableArray);
    v18 = self;
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_1015A2E04(__p, "save recent mean sea level array to cache:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](v18, "printMeanSeaLevelPressureArray:withPrePhrase:", recentMeanSeaLevelPressureArray, __p);
    if (v26 < 0)
      operator delete(__p[0]);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v18->_recentMeanSeaLevelPressureArray;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16, v18);
    if (v9)
    {
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "timestamp");
          objc_msgSend(v4, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v12, "meanSeaLevelPressure");
          objc_msgSend(v5, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v12, "uncertainty");
          objc_msgSend(v6, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v12, "pressureMeasurement");
          objc_msgSend(v7, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v9);
    }
    objc_msgSend(v19, "clearRecentMeanSeaLevelPressureArrayInPlist");
    v13 = sub_1001FD94C();
    sub_10023EC14(v13);
    v14 = sub_1001FD94C();
    sub_10023EC14(v14);
    v15 = sub_1001FD94C();
    sub_10023EC14(v15);
    v16 = sub_1001FD94C();
    sub_10023EC14(v16);
    v17 = sub_1001FD94C();
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 944))(v17);
    *((CFAbsoluteTime *)v19 + 13) = Current;

  }
}

- (void)saveInVisitRebasedMslpToPlist
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  char *v26;
  double v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  _BYTE buf[12];
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;

  -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
  if (v3 != 1.79769313e308)
  {
    -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
    if (v4 != 1.79769313e308)
    {
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      if (v5 != 1.79769313e308)
      {
        -[CLMeanSeaLevelPressureEstimator clearInVisitRebasedMslpInPlist](self, "clearInVisitRebasedMslpInPlist");
        v6 = sub_1001FD94C();
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        *(_QWORD *)buf = v7;
        sub_10018A4CC(v6, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", buf);
        v8 = sub_1001FD94C();
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        *(_QWORD *)buf = v9;
        sub_10018A4CC(v8, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", buf);
        v10 = sub_1001FD94C();
        -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
        *(_QWORD *)buf = v11;
        sub_10018A4CC(v10, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", buf);
        v12 = sub_1001FD94C();
        (*(void (**)(uint64_t))(*(_QWORD *)v12 + 944))(v12);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v13 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
          v15 = v14;
          -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
          v17 = v16;
          -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
          *(_DWORD *)buf = 134218496;
          *(_QWORD *)&buf[4] = v15;
          v35 = 2048;
          v36 = v17;
          v37 = 2048;
          v38 = v18;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "save visit rebased mean sea level pressure to plist,mslp,%f,uncertainty,%f,timestamp,%f", buf, 0x20u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_1021B7438);
          v19 = qword_10229FE88;
          -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
          v21 = v20;
          -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
          v23 = v22;
          -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
          v28 = 134218496;
          v29 = v21;
          v30 = 2048;
          v31 = v23;
          v32 = 2048;
          v33 = v24;
          LODWORD(v27) = 32;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 0, "save visit rebased mean sea level pressure to plist,mslp,%f,uncertainty,%f,timestamp,%f", COERCE_DOUBLE(&v28), v27);
          v26 = (char *)v25;
          sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator saveInVisitRebasedMslpToPlist]", "%s\n", v25);
          if (v26 != buf)
            free(v26);
        }
      }
    }
  }
}

- (void)saveInVisitStateToPlist
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL *p_inVisitStatus;
  uint64_t v8;
  double *p_exitVisitTimestamp;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  const char *v16;
  uint8_t *v17;
  double v18;
  _DWORD v19[2];
  __int16 v20;
  uint64_t v21;
  uint8_t buf[4];
  _BOOL4 v23;
  __int16 v24;
  uint64_t v25;

  v3 = sub_1001FD94C();
  sub_100525484(v3, "CLMeanSeaLevelPressureEstimator_InVisitStatus", 0xFFFFFFFFLL);
  v4 = sub_1001FD94C();
  sub_100525484(v4, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", 0xFFFFFFFFLL);
  v5 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 944))(v5);
  v6 = sub_1001FD94C();
  p_inVisitStatus = &self->_inVisitStatus;
  sub_10011B47C(v6, "CLMeanSeaLevelPressureEstimator_InVisitStatus", &self->_inVisitStatus);
  v8 = sub_1001FD94C();
  p_exitVisitTimestamp = &self->_exitVisitTimestamp;
  sub_10018A4CC(v8, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", p_exitVisitTimestamp);
  v10 = sub_1001FD94C();
  (*(void (**)(uint64_t))(*(_QWORD *)v10 + 944))(v10);
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v11 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *p_inVisitStatus;
    v13 = *(_QWORD *)p_exitVisitTimestamp;
    *(_DWORD *)buf = 67109376;
    v23 = v12;
    v24 = 2048;
    v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "save visit to plist,inVisitStatus,%d,exitVisitTimestamp,%f", buf, 0x12u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v14 = *p_inVisitStatus;
    v15 = *(_QWORD *)p_exitVisitTimestamp;
    v19[0] = 67109376;
    v19[1] = v14;
    v20 = 2048;
    v21 = v15;
    LODWORD(v18) = 18;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "save visit to plist,inVisitStatus,%d,exitVisitTimestamp,%f", v19, v18);
    v17 = (uint8_t *)v16;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator saveInVisitStateToPlist]", "%s\n", v16);
    if (v17 != buf)
      free(v17);
  }
}

- (void)retrieveMeanSeaLevelPressureEstimatorState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  CLMeanSeaLevelPressureData *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  CLMeanSeaLevelPressureData *v38;
  NSObject *v39;
  const char *v40;
  uint8_t *v41;
  NSObject *v42;
  NSMutableArray *meanSeaLevelPressureArray;
  NSMutableArray *recentMeanSeaLevelPressureArray;
  NSObject *v45;
  double lastRefreshTimestamp;
  NSObject *v47;
  _BOOL4 inVisitStatus;
  double exitVisitTimestamp;
  CLMeanSeaLevelPressureData *inVisitRebasedMslp;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint8_t *v64;
  _BOOL4 v65;
  double v66;
  const char *v67;
  uint8_t *v68;
  double v69;
  const char *v70;
  uint8_t *v71;
  const char *v72;
  uint8_t *v73;
  double v74;
  void *v75[2];
  char v76;
  void *__p[2];
  char v78;
  CFTypeRef v79;
  CFTypeRef v80;
  CFTypeRef v81;
  void *v82;
  CFTypeRef v83;
  CFTypeRef v84;
  CFTypeRef v85;
  void *v86;
  BOOL v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  int v93;
  _BYTE v94[18];
  __int16 v95;
  uint64_t v96;
  uint8_t buf[4];
  _BYTE v98[18];
  __int16 v99;
  uint64_t v100;

  v91 = 0.0;
  v92 = 1.79769313e308;
  v89 = 1.79769313e308;
  v90 = 1.79769313e308;
  v88 = 1.79769313e308;
  v87 = 0;
  v85 = 0;
  v86 = 0;
  v83 = 0;
  v84 = 0;
  v81 = 0;
  v82 = 0;
  v79 = 0;
  v80 = 0;
  v3 = sub_1001FD94C();
  sub_1001FD98C(v3, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", &v90);
  v4 = sub_1001FD94C();
  sub_1001FD98C(v4, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", &v89);
  v5 = sub_1001FD94C();
  sub_1001FD98C(v5, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", &v88);
  v6 = sub_1001FD94C();
  sub_1001E4874(v6, "CLMeanSeaLevelPressureEstimator_InVisitStatus", &v87);
  v7 = sub_1001FD94C();
  sub_1001FD98C(v7, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", &v91);
  v8 = sub_1001FD94C();
  sub_1001FD98C(v8, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", &v92);
  v9 = sub_1001FD94C();
  sub_100527258(v9, CFSTR("CLMeanSeaLevelPressureEstimator_MslpArray"), (CFTypeRef *)&v86);
  v10 = sub_1001FD94C();
  sub_100527258(v10, CFSTR("CLMeanSeaLevelPressureEstimator_MslpUncertaintyArray"), &v85);
  v11 = sub_1001FD94C();
  sub_100527258(v11, CFSTR("CLMeanSeaLevelPressureEstimator_MslpTimestampArray"), &v84);
  v12 = sub_1001FD94C();
  sub_100527258(v12, CFSTR("CLMeanSeaLevelPressureEstimator_PressureMeasurementArray"), &v83);
  v13 = sub_1001FD94C();
  sub_100527258(v13, CFSTR("CLMeanSeaLevelPressureEstimator_RecentMslpArray"), (CFTypeRef *)&v82);
  v14 = sub_1001FD94C();
  sub_100527258(v14, CFSTR("CLMeanSeaLevelPressureEstimator_RecentMslpUncertaintyArray"), &v81);
  v15 = sub_1001FD94C();
  sub_100527258(v15, CFSTR("CLMeanSeaLevelPressureEstimator_RecentMslpTimestampArray"), &v80);
  v16 = sub_1001FD94C();
  sub_100527258(v16, CFSTR("CLMeanSeaLevelPressureEstimator_RecentPressureMeasurementArray"), &v79);
  if (v92 == 1.79769313e308
    || (v17 = v86) == 0
    || (v18 = (void *)v85) == 0
    || (v19 = (void *)v84) == 0
    || (v20 = (void *)v83) == 0)
  {
LABEL_53:
    self->_exitVisitTimestamp = v91;
    self->_inVisitStatus = v87;
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v47 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      inVisitStatus = self->_inVisitStatus;
      exitVisitTimestamp = self->_exitVisitTimestamp;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v98 = inVisitStatus;
      *(_WORD *)&v98[4] = 2048;
      *(double *)&v98[6] = exitVisitTimestamp;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "retrieve invisit state,inVisitStatus,%d,exitVisitTimestamp,%f", buf, 0x12u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v65 = self->_inVisitStatus;
      v66 = self->_exitVisitTimestamp;
      v93 = 67109376;
      *(_DWORD *)v94 = v65;
      *(_WORD *)&v94[4] = 2048;
      *(double *)&v94[6] = v66;
      LODWORD(v74) = 18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "retrieve invisit state,inVisitStatus,%d,exitVisitTimestamp,%f", &v93, v74);
      v68 = (uint8_t *)v67;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v67);
      if (v68 != buf)
        free(v68);
    }
    inVisitRebasedMslp = self->_inVisitRebasedMslp;
    if (!self->_inVisitStatus || v90 == 1.79769313e308 || v89 == 1.79769313e308 || v88 == 1.79769313e308)
    {
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](inVisitRebasedMslp, "setMeanSeaLevelPressure:", 1.79769313e308);
      -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:", 1.79769313e308);
      -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:", 1.79769313e308);
    }
    else
    {
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](inVisitRebasedMslp, "setMeanSeaLevelPressure:", v90, v88);
      -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:", v89);
      -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:", v88);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v51 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        v53 = v52;
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        v55 = v54;
        -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)v98 = v53;
        *(_WORD *)&v98[8] = 2048;
        *(_QWORD *)&v98[10] = v55;
        v99 = 2048;
        v100 = v56;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "retrieve invisit rebase mslp,inVisitRebasedMslp,%f,inVisitRebasedMslpUnc,%f,inVisitRebasedMslpTime,%f", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_1021B7438);
        v57 = qword_10229FE88;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        v59 = v58;
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        v61 = v60;
        -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
        v93 = 134218496;
        *(_QWORD *)v94 = v59;
        *(_WORD *)&v94[8] = 2048;
        *(_QWORD *)&v94[10] = v61;
        v95 = 2048;
        v96 = v62;
        LODWORD(v74) = 32;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v57, 0, "retrieve invisit rebase mslp,inVisitRebasedMslp,%f,inVisitRebasedMslpUnc,%f,inVisitRebasedMslpTime,%f", COERCE_DOUBLE(&v93), v74, *(double *)v75);
        v64 = (uint8_t *)v63;
        sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v63);
        if (v64 != buf)
          free(v64);
      }
    }
    if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count")
      || -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"))
    {
      -[CLMeanSeaLevelPressureEstimator updateUncertinatyAndSendCurrentEstimateMslpFrom:](self, "updateUncertinatyAndSendCurrentEstimateMslpFrom:", 0);
    }
    return;
  }
  v21 = objc_msgSend(v86, "count", v92);
  v22 = objc_msgSend(v18, "count");
  v23 = objc_msgSend(v19, "count");
  v24 = objc_msgSend(v20, "count");
  if (v21 == v22 && v21 == v23 && v22 == v23 && v24 == v23 && v24 == v22 && v24 == v21)
  {
    self->_lastRefreshTimestamp = v92;
    if (v21 >= 1)
    {
      v25 = 0;
      v26 = v21;
      do
      {
        v27 = objc_opt_new(CLMeanSeaLevelPressureData);
        objc_msgSend(objc_msgSend(v19, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setTimestamp:](v27, "setTimestamp:");
        objc_msgSend(objc_msgSend(v17, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v27, "setMeanSeaLevelPressure:");
        objc_msgSend(objc_msgSend(v18, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setUncertainty:](v27, "setUncertainty:");
        objc_msgSend(objc_msgSend(v20, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setPressureMeasurement:](v27, "setPressureMeasurement:");
        -[NSMutableArray addObject:](self->_meanSeaLevelPressureArray, "addObject:", v27);

        ++v25;
      }
      while (v26 != v25);
    }
    v28 = v82;
    if (v82)
    {
      v29 = (void *)v81;
      if (v81)
      {
        v30 = (void *)v80;
        if (v80)
        {
          v31 = (void *)v79;
          if (v79)
          {
            v32 = objc_msgSend(v82, "count");
            v33 = objc_msgSend(v29, "count");
            v34 = objc_msgSend(v30, "count");
            v35 = objc_msgSend(v31, "count");
            if (v32 == v33 && v32 == v34 && v33 == v34 && v35 == v34 && v35 == v33 && v35 == v32)
            {
              if (v32 >= 1)
              {
                v36 = 0;
                v37 = v32;
                do
                {
                  v38 = objc_opt_new(CLMeanSeaLevelPressureData);
                  objc_msgSend(objc_msgSend(v30, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setTimestamp:](v38, "setTimestamp:");
                  objc_msgSend(objc_msgSend(v28, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v38, "setMeanSeaLevelPressure:");
                  objc_msgSend(objc_msgSend(v29, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setUncertainty:](v38, "setUncertainty:");
                  objc_msgSend(objc_msgSend(v31, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setPressureMeasurement:](v38, "setPressureMeasurement:");
                  -[NSMutableArray addObject:](self->_recentMeanSeaLevelPressureArray, "addObject:", v38);

                  ++v36;
                }
                while (v37 != v36);
              }
            }
            else
            {
              if (qword_10229FE80 != -1)
                dispatch_once(&qword_10229FE80, &stru_1021B7438);
              v42 = qword_10229FE88;
              if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "the saved recent mean sea level pressure arrays have different sizes.", buf, 2u);
              }
              if (sub_1001BFF7C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_10229FE80 != -1)
                  dispatch_once(&qword_10229FE80, &stru_1021B7438);
                LOWORD(v93) = 0;
                _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "the saved recent mean sea level pressure arrays have different sizes.", &v93, 2);
                v73 = (uint8_t *)v72;
                sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v72);
                if (v73 != buf)
                  free(v73);
              }
            }
          }
        }
      }
    }
    meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
    sub_1015A2E04(__p, "retrieve mean sea level pressure array from plist:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](self, "printMeanSeaLevelPressureArray:withPrePhrase:", meanSeaLevelPressureArray, __p);
    if (v78 < 0)
      operator delete(__p[0]);
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_1015A2E04(v75, "retrieve recent mean sea level pressure array from plist:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:](self, "printMeanSeaLevelPressureArray:withPrePhrase:", recentMeanSeaLevelPressureArray, v75);
    if (v76 < 0)
      operator delete(v75[0]);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    v45 = qword_10229FE88;
    if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
    {
      lastRefreshTimestamp = self->_lastRefreshTimestamp;
      *(_DWORD *)buf = 134217984;
      *(double *)v98 = lastRefreshTimestamp;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "retrieve the latest array refresh time from plist,%f", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_1021B7438);
      v69 = self->_lastRefreshTimestamp;
      v93 = 134217984;
      *(double *)v94 = v69;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "retrieve the latest array refresh time from plist,%f", COERCE_DOUBLE(&v93));
      v71 = (uint8_t *)v70;
      sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v70);
      if (v71 != buf)
        free(v71);
    }

    self->_currentEstimateMslp = (CLMeanSeaLevelPressureData *)-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure](self, "getEstimatedMeanSeaLevelPressure");
    -[CLMeanSeaLevelPressureEstimator writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:](self, "writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:", CFAbsoluteTimeGetCurrent());
    goto LABEL_53;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_1021B7438);
  v39 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "the saved mean sea level pressure arrays have different sizes.", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_1021B7438);
    LOWORD(v93) = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "the saved mean sea level pressure arrays have different sizes.", &v93, 2);
    v41 = (uint8_t *)v40;
    sub_100512490("Generic", 1, 0, 2, "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]", "%s\n", v40);
    if (v41 != buf)
      free(v41);
  }
}

- (double)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(double)a3
{
  self->_lastRefreshTimestamp = a3;
}

- (double)exitVisitTimestamp
{
  return self->_exitVisitTimestamp;
}

- (void)setExitVisitTimestamp:(double)a3
{
  self->_exitVisitTimestamp = a3;
}

- (double)cumulativeStartTime
{
  return self->_cumulativeStartTime;
}

- (void)setCumulativeStartTime:(double)a3
{
  self->_cumulativeStartTime = a3;
}

- (BOOL)inVisitStatus
{
  return self->_inVisitStatus;
}

- (void)setInVisitStatus:(BOOL)a3
{
  self->_inVisitStatus = a3;
}

- (double)currentLatitude
{
  return self->_currentLatitude;
}

- (void)setCurrentLatitude:(double)a3
{
  self->_currentLatitude = a3;
}

- (double)currentLongitude
{
  return self->_currentLongitude;
}

- (void)setCurrentLongitude:(double)a3
{
  self->_currentLongitude = a3;
}

- (double)currentPressure
{
  return self->_currentPressure;
}

- (void)setCurrentPressure:(double)a3
{
  self->_currentPressure = a3;
}

- (double)minPressure
{
  return self->_minPressure;
}

- (void)setMinPressure:(double)a3
{
  self->_minPressure = a3;
}

- (double)maxPressure
{
  return self->_maxPressure;
}

- (void)setMaxPressure:(double)a3
{
  self->_maxPressure = a3;
}

- (BOOL)firstRefreshAfterVisit
{
  return self->_firstRefreshAfterVisit;
}

- (void)setFirstRefreshAfterVisit:(BOOL)a3
{
  self->_firstRefreshAfterVisit = a3;
}

- (int)numberOfRebaseBtwRefresh
{
  return self->_numberOfRebaseBtwRefresh;
}

- (void)setNumberOfRebaseBtwRefresh:(int)a3
{
  self->_numberOfRebaseBtwRefresh = a3;
}

- (int)numberOfTrackEndedBtwRefresh
{
  return self->_numberOfTrackEndedBtwRefresh;
}

- (void)setNumberOfTrackEndedBtwRefresh:(int)a3
{
  self->_numberOfTrackEndedBtwRefresh = a3;
}

- (void).cxx_destruct
{
  void *value;

  value = self->_mslpDispatcher.__ptr_.__value_;
  self->_mslpDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 30) = 0;
  return self;
}

@end
