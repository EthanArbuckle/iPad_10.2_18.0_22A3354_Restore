@implementation CLBarometerCalibrationSourceAggregator

- (void)enableSources:(id)a3 forContext:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSMutableSet **clientsForSource;
  uint64_t **p_sources;
  void *i;
  id v13;
  unsigned int v14;
  NSMutableSet *v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned int *v21;
  _BYTE v22[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    clientsForSource = self->_clientsForSource;
    p_sources = (uint64_t **)&self->_sources;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(a3);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "integerValue");
        v14 = v13;
        v15 = clientsForSource[(_QWORD)v13];
        -[NSMutableSet addObject:](v15, "addObject:", a4);
        if (-[NSMutableSet count](v15, "count"))
        {
          v16 = v14;
          v21 = &v16;
          objc_msgSend(sub_10021083C(p_sources, &v16, (uint64_t)&unk_101B9EB60, &v21)[5], "enableSource");
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }
}

+ (uint64_t)isLocationUsefulForCalibration:(uint64_t)a3
{
  return (*(_DWORD *)(a3 + 96) < 0xCu) & (0xC12u >> *(_DWORD *)(a3 + 96));
}

- (void)didUpdateSource:(unint64_t)a3 withData:(shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>)a4
{
  CLBarometerCalibrationData *var0;
  int64x2_t *dataBuffers;
  std::string::size_type v7;
  std::string::size_type v8;
  unint64_t *v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *size;
  int64x2_t *v34;
  std::__shared_weak_count *v35;
  std::string::size_type *v36;
  unint64_t *v37;
  unint64_t v38;
  NSObject *v39;
  std::string::size_type v40;
  std::string::size_type v41;
  std::string::size_type v42;
  NSObject *v43;
  std::string::size_type v44;
  std::string::size_type v45;
  std::string::size_type v46;
  unint64_t *v47;
  unint64_t v48;
  int64x2_t *v49;
  std::string::size_type v50;
  unint64_t *v51;
  unint64_t v52;
  NSObject *v53;
  uint64_t v54;
  std::string *v55;
  int v56;
  int v57;
  int v58;
  unint64_t *v59;
  int64x2_t *v60;
  std::string::size_type v61;
  unint64_t *v62;
  unint64_t v63;
  NSObject *v64;
  uint64_t v65;
  int v66;
  unint64_t *v67;
  uint64_t v68;
  unint64_t *v69;
  unint64_t v70;
  double v71;
  double *p_fSurfacePressure;
  double fSurfacePressure;
  double v74;
  float v75;
  double v76;
  double fTimestamp;
  float v78;
  double *v79;
  double v80;
  double v81;
  float v82;
  double v83;
  double v84;
  float v85;
  __objc2_class *v86;
  NSObject *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  unint64_t *v93;
  unint64_t v94;
  int64x2_t *v95;
  uint64_t *v96;
  unint64_t *p_shared_owners;
  unint64_t v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t *v103;
  int64x2_t *v104;
  uint64_t *v105;
  unint64_t *v106;
  unint64_t v107;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t *v113;
  int64x2_t *v114;
  std::string::size_type v115;
  unint64_t *v116;
  unint64_t v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  int v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t *v128;
  int64x2_t *v129;
  std::string::size_type v130;
  unint64_t *v131;
  unint64_t v132;
  NSObject *v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t *v136;
  int64x2_t *v137;
  NSObject *v138;
  double v139;
  uint64_t v140;
  NSObject *v141;
  CFAbsoluteTime Current;
  int v143;
  uint64_t v144;
  double v145;
  std::__shared_weak_count *v146;
  unint64_t *v147;
  unint64_t v148;
  unint64_t *v149;
  std::string::size_type v150;
  std::string::size_type v151;
  std::string::size_type v152;
  char *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  char *v159;
  uint64_t v160;
  CFAbsoluteTime v161;
  int v162;
  std::string::size_type v163;
  double v164;
  char *v165;
  double v166;
  double v167;
  double v168;
  CLBarometerCalibrationSurfaceCalData *p_prevSurfCalMotion;
  CLBarometerCalibrationSurfaceCalData *p_prevSurfCalLocation;
  void **v171;
  uint64_t v172;
  NSDictionary *(*v173)(uint64_t);
  void *v174;
  uint64_t v175;
  std::__shared_weak_count *v176;
  __int128 v177;
  uint64_t v178;
  __int128 v179;
  uint64_t v180;
  __int128 v181;
  uint64_t v182;
  __int128 v183;
  uint64_t v184;
  void *v185;
  void *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  uint64_t v196;
  void *v197[2];
  uint64_t v198;
  void *v199[2];
  uint64_t v200;
  void *v201[2];
  uint64_t v202;
  void *v203[2];
  uint64_t v204;
  uint64_t v205;
  std::__shared_weak_count *v206;
  std::string __p;
  _BYTE v208[18];
  __int16 v209;
  double v210;
  __int16 v211;
  double v212;
  __int16 v213;
  double v214;
  __int16 v215;
  double v216;
  _BYTE buf[64];
  double v218;
  _BYTE v219[10];
  uint64_t v220;
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  uint64_t v224;
  __int16 v225;
  uint64_t v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  int v230;
  __int16 v231;
  uint64_t v232;
  __int16 v233;
  uint64_t v234;
  __int16 v235;
  uint64_t v236;
  __int16 v237;
  uint64_t v238;
  __int16 v239;
  int v240;
  __int16 v241;
  int v242;
  __int16 v243;
  int v244;

  var0 = a4.var0;
  switch(a3)
  {
    case 0uLL:
      dataBuffers = (int64x2_t *)self->_dataBuffers;
      if (dataBuffers[2].i64[1] >= 0x258uLL)
        sub_10017F858(dataBuffers);
      v8 = *(_QWORD *)var0;
      v7 = *((_QWORD *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(_QWORD *)var0;
      __p.__r_.__value_.__l.__size_ = v7;
      if (v7)
      {
        v9 = (unint64_t *)(v7 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v11 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)v8;
        v13 = *(_QWORD *)(v8 + 8);
        v15 = *(_QWORD *)(v8 + 16);
        v14 = *(_QWORD *)(v8 + 24);
        v16 = *(unsigned __int8 *)(v8 + 128);
        v17 = *(_QWORD *)(v8 + 112);
        v18 = *(_QWORD *)(v8 + 120);
        v19 = *(_QWORD *)(v8 + 32);
        v20 = *(_QWORD *)(v8 + 40);
        v21 = *(_QWORD *)(v8 + 48);
        v22 = *(_QWORD *)(v8 + 56);
        v23 = *(_DWORD *)(v8 + 96);
        v24 = *(_DWORD *)(v8 + 100);
        v25 = *(_QWORD *)(v8 + 64);
        v26 = *(_QWORD *)(v8 + 72);
        v27 = *(_QWORD *)(v8 + 80);
        v28 = *(_QWORD *)(v8 + 88);
        v29 = *(_DWORD *)(v8 + 104);
        v30 = *(unsigned __int16 *)(v8 + 130);
        *(_DWORD *)buf = 68294147;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(_QWORD *)&buf[20] = v14;
        *(_WORD *)&buf[28] = 2049;
        *(_QWORD *)&buf[30] = v12;
        *(_WORD *)&buf[38] = 2049;
        *(_QWORD *)&buf[40] = v13;
        *(_WORD *)&buf[48] = 2049;
        *(_QWORD *)&buf[50] = v15;
        *(_WORD *)&buf[58] = 1025;
        *(_DWORD *)&buf[60] = v24;
        LOWORD(v218) = 1025;
        *(_DWORD *)((char *)&v218 + 2) = v16;
        HIWORD(v218) = 2049;
        *(_QWORD *)v219 = v17;
        *(_WORD *)&v219[8] = 2049;
        v220 = v18;
        v221 = 2049;
        v222 = v21;
        v223 = 2049;
        v224 = v19;
        v225 = 2049;
        v226 = v20;
        v227 = 2049;
        v228 = v22;
        v229 = 1025;
        v230 = v23;
        v231 = 2049;
        v232 = v25;
        v233 = 2049;
        v234 = v26;
        v235 = 2049;
        v236 = v27;
        v237 = 2049;
        v238 = v28;
        v239 = 1025;
        v240 = v29;
        v241 = 1025;
        v242 = v30;
        v243 = 1025;
        v244 = v24;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"location source updated with\", \"altitude\":\"%{private}f\", \"time_s\":\"%{private}.09f\", \"lat\":\"%{private}f\", \"long\":\"%{private}f\", \"type\":%{private}d, \"isPrefilteredLocation\":%{private}d, \"rawAltitude\":\"%{private}f\", \"rawVerticalAccuracy\":\"%{private}f\", \"DEM\":\"%{private}f\", \"horizontalAccuracy\":\"%{private}f\", \"verticalAccuracy\":\"%{private}f\", \"DEMUncertainty\":\"%{private}f\", \"Environment\":%{private}d, \"Slope\":\"%{private}f\", \"MaxAbsSlope\":\"%{private}f\", \"Speed\":\"%{private}f\", \"SpeedAccuracy\":\"%{private}f\", \"MatchQuality\":%{private}d, \"AltitudeState\":%{private}d, \"RefProvider\":%{private}d}", buf, 0xC2u);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "didUpdateDataBuffer:") & 1) != 0)-[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "didUpdateDataBuffer:", 0);
      if (__p.__r_.__value_.__l.__size_)
      {
        v31 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
          size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
          goto LABEL_214;
        }
      }
      break;
    case 1uLL:
      v95 = (int64x2_t *)self->_dataBuffers;
      if (v95[5].i64[1] >= 0x258uLL)
        sub_10017F858(v95 + 3);
      v96 = *(uint64_t **)var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(_QWORD *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        p_shared_owners = (unint64_t *)&v35->__shared_owners_;
        do
          v98 = __ldxr(p_shared_owners);
        while (__stxr(v98 + 1, p_shared_owners));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v99 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v100 = *v96;
        v101 = v96[1];
        v102 = v96[2];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)&buf[20] = v100;
        *(_WORD *)&buf[28] = 2049;
        *(_QWORD *)&buf[30] = v101;
        *(_WORD *)&buf[38] = 2049;
        *(_QWORD *)&buf[40] = v102;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"pressure source updated with\", \"time_s\":\"%{public}.09f\", \"pressure\":\"%{private}f\", \"temperature\":\"%{private}f\"}", buf, 0x30u);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers + 6, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0)
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 1);
      if (v35)
      {
        v103 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v103);
        while (__stlxr(v48 - 1, v103));
        goto LABEL_212;
      }
      break;
    case 2uLL:
      v49 = (int64x2_t *)self->_dataBuffers;
      if (v49[8].i64[1] >= 0x4B0uLL)
        sub_10017F858(v49 + 6);
      v50 = *(_QWORD *)var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      v203[0] = *(void **)var0;
      v203[1] = v35;
      if (v35)
      {
        v51 = (unint64_t *)&v35->__shared_owners_;
        do
          v52 = __ldxr(v51);
        while (__stxr(v52 + 1, v51));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v53 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v54 = *(_QWORD *)v50;
        sub_1000C2150((_QWORD *)(v50 + 8), &__p);
        v55 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &__p
            : (std::string *)__p.__r_.__value_.__r.__words[0];
        v56 = *(_DWORD *)(v50 + 16);
        v57 = *(_DWORD *)(v50 + 24);
        v58 = *(unsigned __int8 *)(v50 + 20);
        *(_DWORD *)buf = 68290307;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(_QWORD *)&buf[20] = v54;
        *(_WORD *)&buf[28] = 2081;
        *(_QWORD *)&buf[30] = v55;
        *(_WORD *)&buf[38] = 1025;
        *(_DWORD *)&buf[40] = v56;
        *(_WORD *)&buf[44] = 1025;
        *(_DWORD *)&buf[46] = v57;
        *(_WORD *)&buf[50] = 1025;
        *(_DWORD *)&buf[52] = v58;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"wifi source updated with\", \"scanTimestamp_s\":\"%{private}.09f\", \"mac\":%{private, location:escape_only}s, \"channel\":%{private}d, \"rssi\":%{private}d, \"hidden\":%{private}hhd}", buf, 0x38u);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers + 12, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0)
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 2);
      if (v35)
      {
        v59 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v59);
        while (__stlxr(v48 - 1, v59));
        goto LABEL_212;
      }
      break;
    case 3uLL:
      v60 = (int64x2_t *)self->_dataBuffers;
      if (v60[11].i64[1] >= 0x258uLL)
        sub_10017F858(v60 + 9);
      v61 = *(_QWORD *)var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(_QWORD *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v62 = (unint64_t *)&v35->__shared_owners_;
        do
          v63 = __ldxr(v62);
        while (__stxr(v63 + 1, v62));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v64 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v65 = *(_QWORD *)v61;
        v66 = *(_DWORD *)(v61 + 8);
        *(_DWORD *)buf = 68289539;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(_QWORD *)&buf[20] = v65;
        *(_WORD *)&buf[28] = 1025;
        *(_DWORD *)&buf[30] = v66;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"elevation source updated with\", \"timestamp_s\":\"%{private}.09f\", \"elevation\":%{private}d}", buf, 0x22u);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers + 18, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0)
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 3);
      if (v35)
      {
        v67 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v67);
        while (__stlxr(v48 - 1, v67));
        goto LABEL_212;
      }
      break;
    case 4uLL:
      v34 = (int64x2_t *)self->_dataBuffers;
      if (v34[14].i64[1] >= 0x258uLL)
        sub_10017F858(v34 + 12);
      v36 = *(std::string::size_type **)var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      v203[0] = *(void **)var0;
      v203[1] = v35;
      if (v35)
      {
        v37 = (unint64_t *)&v35->__shared_owners_;
        do
          v38 = __ldxr(v37);
        while (__stxr(v38 + 1, v37));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v39 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v40 = *v36;
        v41 = v36[1];
        v42 = v36[2];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(_QWORD *)&buf[20] = v40;
        *(_WORD *)&buf[28] = 2049;
        *(_QWORD *)&buf[30] = v41;
        *(_WORD *)&buf[38] = 2049;
        *(_QWORD *)&buf[40] = v42;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"companion source updated with\", \"timestamp_s\":\"%{private}.09f\", \"biasInMeters\":\"%{private}f\", \"uncertaintyInMeters\":\"%{private}f\"}", buf, 0x30u);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      }
      v43 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
      {
        v44 = *v36;
        v45 = v36[1];
        v46 = v36[2];
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v46;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "companion source updated with timestamp %f, altitude %f, uncertainty %f", buf, 0x20u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10219E1D8);
        v150 = *v36;
        v151 = v36[1];
        v152 = v36[2];
        LODWORD(__p.__r_.__value_.__l.__data_) = 134218496;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v150;
        WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v151;
        HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
        *(_QWORD *)v208 = v152;
        LODWORD(v166) = 32;
        v153 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "companion source updated with timestamp %f, altitude %f, uncertainty %f", COERCE_DOUBLE(&__p), v166, v168);
        sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]", "%s\n", v153);
        if (v153 != buf)
          free(v153);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers + 24, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0)
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 4);
      if (v35)
      {
        v47 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v47);
        while (__stlxr(v48 - 1, v47));
        goto LABEL_212;
      }
      break;
    case 5uLL:
      v104 = (int64x2_t *)self->_dataBuffers;
      if (v104[17].i64[1] >= 9uLL)
        sub_10017F858(v104 + 15);
      v105 = *(uint64_t **)var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(_QWORD *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v106 = (unint64_t *)&v35->__shared_owners_;
        do
          v107 = __ldxr(v106);
        while (__stxr(v107 + 1, v106));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v108 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v109 = *v105;
        v110 = v105[1];
        v111 = v105[2];
        v112 = v105[3];
        *(_DWORD *)buf = 68290051;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(_QWORD *)&buf[20] = v109;
        *(_WORD *)&buf[28] = 2049;
        *(_QWORD *)&buf[30] = v111;
        *(_WORD *)&buf[38] = 2049;
        *(_QWORD *)&buf[40] = v110;
        *(_WORD *)&buf[48] = 2049;
        *(_QWORD *)&buf[50] = v112;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"kfPressure source updated with\", \"timestamp_s\":\"%{private}.09f\", \"kfPressure\":\"%{private}f\", \"kfElevation\":\"%{private}f\", \"absAltUncertainty\":\"%{private}f\"}", buf, 0x3Au);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers + 30, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0)
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 5);
      if (v35)
      {
        v113 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v113);
        while (__stlxr(v48 - 1, v113));
        goto LABEL_212;
      }
      break;
    case 6uLL:
      v114 = (int64x2_t *)self->_dataBuffers;
      if (v114[20].i64[1] >= 0x258uLL)
        sub_10017F858(v114 + 18);
      v115 = *(_QWORD *)var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(_QWORD *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v116 = (unint64_t *)&v35->__shared_owners_;
        do
          v117 = __ldxr(v116);
        while (__stxr(v117 + 1, v116));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v118 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v119 = *(_QWORD *)v115;
        v120 = *(_QWORD *)(v115 + 8);
        v122 = *(_QWORD *)(v115 + 16);
        v121 = *(_QWORD *)(v115 + 24);
        v123 = *(_DWORD *)(v115 + 100);
        v124 = *(unsigned __int8 *)(v115 + 128);
        v125 = *(_QWORD *)(v115 + 112);
        v126 = *(_QWORD *)(v115 + 120);
        v127 = *(_QWORD *)(v115 + 48);
        *(_DWORD *)buf = 68291331;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2049;
        *(_QWORD *)&buf[20] = v121;
        *(_WORD *)&buf[28] = 2049;
        *(_QWORD *)&buf[30] = v119;
        *(_WORD *)&buf[38] = 2049;
        *(_QWORD *)&buf[40] = v120;
        *(_WORD *)&buf[48] = 2049;
        *(_QWORD *)&buf[50] = v122;
        *(_WORD *)&buf[58] = 1025;
        *(_DWORD *)&buf[60] = v123;
        LOWORD(v218) = 1025;
        *(_DWORD *)((char *)&v218 + 2) = v124;
        HIWORD(v218) = 2049;
        *(_QWORD *)v219 = v125;
        *(_WORD *)&v219[8] = 2049;
        v220 = v126;
        v221 = 2049;
        v222 = v127;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"prefiltered location source updated with\", \"altitude\":\"%{private}f\", \"time_s\":\"%{private}.09f\", \"lat\":\"%{private}f\", \"long\":\"%{private}f\", \"type\":%{private}d, \"isPrefilteredLocation\":%{private}d, \"rawAltitude\":\"%{private}f\", \"rawVerticalAccuracy\":\"%{private}f\", \"DEM\":\"%{private}f\"}", buf, 0x64u);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers + 36, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "didUpdateDataBuffer:") & 1) != 0)-[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "didUpdateDataBuffer:", 6);
      if (v35)
      {
        v128 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v128);
        while (__stlxr(v48 - 1, v128));
        goto LABEL_212;
      }
      break;
    case 7uLL:
      v68 = *(_QWORD *)a4.var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)a4.var0 + 1);
      v205 = *(_QWORD *)a4.var0;
      v206 = v35;
      if (v35)
      {
        v69 = (unint64_t *)&v35->__shared_owners_;
        do
          v70 = __ldxr(v69);
        while (__stxr(v70 + 1, v69));
      }
      v71 = *(double *)(v68 + 8);
      *(float *)&v71 = v71;
      if (-[CLBarometerCalibrationSourceAggregator goodSurfaceCalibration:](self, "goodSurfaceCalibration:", v71))
      {
        sub_1015A2E04(v203, "NULL");
        sub_1015A2E04(v201, "NULL");
        sub_1015A2E04(v199, "NULL");
        sub_1015A2E04(v197, "NULL");
        HIDWORD(v167) = *(_DWORD *)(v68 + 16);
        p_fSurfacePressure = &self->_prevSurfCalLocation.fSurfacePressure;
        fSurfacePressure = self->_prevSurfCalLocation.fSurfacePressure;
        if (fSurfacePressure != 1.79769313e308)
        {
          v74 = *(double *)(v68 + 8);
          v194 = 0;
          v195 = 0;
          v196 = 0;
          sub_10027205C(&v194, (const void *)qword_10230C320, qword_10230C328, (qword_10230C328 - qword_10230C320) >> 2);
          v75 = v74 - fSurfacePressure;
          sub_10041CAFC((uint64_t)&v194, buf, v75);
          if (SHIBYTE(v204) < 0)
            operator delete(v203[0]);
          *(_OWORD *)v203 = *(_OWORD *)buf;
          v204 = *(_QWORD *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v194)
          {
            v195 = v194;
            operator delete(v194);
          }
          v76 = *(double *)v68;
          fTimestamp = self->_prevSurfCalLocation.fTimestamp;
          v192 = 0;
          v193 = 0;
          v191 = 0;
          sub_10027205C(&v191, (const void *)qword_10230C338, qword_10230C340, (qword_10230C340 - qword_10230C338) >> 2);
          v78 = v76 - fTimestamp;
          sub_10041CAFC((uint64_t)&v191, buf, v78);
          if (SHIBYTE(v202) < 0)
            operator delete(v201[0]);
          *(_OWORD *)v201 = *(_OWORD *)buf;
          v202 = *(_QWORD *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v191)
          {
            v192 = v191;
            operator delete(v191);
          }
        }
        p_prevSurfCalLocation = &self->_prevSurfCalLocation;
        v79 = &self->_prevSurfCalMotion.fSurfacePressure;
        v80 = self->_prevSurfCalMotion.fSurfacePressure;
        p_prevSurfCalMotion = &self->_prevSurfCalMotion;
        if (v80 != 1.79769313e308)
        {
          v81 = *(double *)(v68 + 8);
          v188 = 0;
          v189 = 0;
          v190 = 0;
          sub_10027205C(&v188, (const void *)qword_10230C320, qword_10230C328, (qword_10230C328 - qword_10230C320) >> 2);
          v82 = v81 - v80;
          sub_10041CAFC((uint64_t)&v188, buf, v82);
          if (SHIBYTE(v200) < 0)
            operator delete(v199[0]);
          *(_OWORD *)v199 = *(_OWORD *)buf;
          v200 = *(_QWORD *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v188)
          {
            v189 = v188;
            operator delete(v188);
          }
          v83 = *(double *)v68;
          v84 = p_prevSurfCalMotion->fTimestamp;
          v186 = 0;
          v187 = 0;
          v185 = 0;
          sub_10027205C(&v185, (const void *)qword_10230C338, qword_10230C340, (qword_10230C340 - qword_10230C338) >> 2);
          v85 = v83 - v84;
          sub_10041CAFC((uint64_t)&v185, buf, v85);
          if (SHIBYTE(v198) < 0)
            operator delete(v197[0]);
          *(_OWORD *)v197 = *(_OWORD *)buf;
          v198 = *(_QWORD *)&buf[16];
          buf[23] = 0;
          buf[0] = 0;
          if (v185)
          {
            v186 = v185;
            operator delete(v185);
          }
        }
        v86 = DefaultObserver;
        if (qword_10229FE80 != -1)
          dispatch_once(&qword_10229FE80, &stru_10219E1D8);
        v87 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          v88 = p_prevSurfCalLocation->fTimestamp;
          v89 = *v79;
          v90 = p_prevSurfCalMotion->fTimestamp;
          v92 = *(double *)v68;
          v91 = *(double *)(v68 + 8);
          *(double *)&buf[4] = *p_fSurfacePressure;
          *(double *)&buf[14] = v88;
          *(double *)&buf[24] = v89;
          *(double *)&buf[34] = v90;
          *(_DWORD *)buf = 134219776;
          *(_WORD *)&buf[12] = 2048;
          *(_WORD *)&buf[22] = 2048;
          *(_WORD *)&buf[32] = 2048;
          *(_WORD *)&buf[42] = 2048;
          *(double *)&buf[44] = v91 - *(double *)&buf[4];
          *(_WORD *)&buf[52] = 2048;
          *(double *)&buf[54] = v92 - v88;
          *(_WORD *)&buf[62] = 2048;
          v218 = v91 - v89;
          *(_WORD *)v219 = 2048;
          *(double *)&v219[2] = v92 - v90;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "prevLocationPressure,%f,prevLocationTimestamp,%f,prevMotionPressure,%f,prevMotionTimestamp,%f,pressureDiffLastLocation,%f,timeDiffLastLocation,%f,pressureDiffLastMotion,%f,timeDiffLastMotion,%f", buf, 0x52u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_10229FE80 != -1)
            dispatch_once(&qword_10229FE80, &stru_10219E1D8);
          v154 = p_prevSurfCalLocation->fTimestamp;
          v155 = *v79;
          v156 = p_prevSurfCalMotion->fTimestamp;
          v158 = *(double *)v68;
          v157 = *(double *)(v68 + 8);
          *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = *(std::string::size_type *)p_fSurfacePressure;
          *(double *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v154;
          *(double *)v208 = v155;
          *(double *)&v208[10] = v156;
          LODWORD(__p.__r_.__value_.__l.__data_) = 134219776;
          WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
          HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
          *(_WORD *)&v208[8] = 2048;
          v209 = 2048;
          v210 = v157 - *(double *)((char *)__p.__r_.__value_.__r.__words + 4);
          v211 = 2048;
          v212 = v158 - v154;
          v213 = 2048;
          v214 = v157 - v155;
          v215 = 2048;
          v216 = v158 - v156;
          LODWORD(v167) = 82;
          v159 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE88, 0, "prevLocationPressure,%f,prevLocationTimestamp,%f,prevMotionPressure,%f,prevMotionTimestamp,%f,pressureDiffLastLocation,%f,timeDiffLastLocation,%f,pressureDiffLastMotion,%f,timeDiffLastMotion,%f", COERCE_DOUBLE(&__p), v167, *(double *)&p_prevSurfCalMotion, *(double *)&p_prevSurfCalLocation, *(double *)&v171, *(double *)&v172, *(double *)&v173, *(double *)&v174);
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]", "%s\n", v159);
          if (v159 != buf)
            free(v159);
          v86 = DefaultObserver;
        }
        if ((HIDWORD(v167) | 2) != 2)
        {
          p_prevSurfCalLocation = p_prevSurfCalMotion;
          p_fSurfacePressure = &self->_prevSurfCalMotion.fSurfacePressure;
        }
        p_prevSurfCalLocation->fTimestamp = *(double *)v68;
        *p_fSurfacePressure = *(double *)(v68 + 8);
        v171 = _NSConcreteStackBlock;
        v172 = 3321888768;
        v173 = sub_101085D04;
        v174 = &unk_10219E1A8;
        v175 = v68;
        v176 = v35;
        if (v35)
        {
          v93 = (unint64_t *)&v35->__shared_owners_;
          do
            v94 = __ldxr(v93);
          while (__stxr(v94 + 1, v93));
        }
        if (SHIBYTE(v204) < 0)
        {
          sub_100115CE4(&v177, v203[0], (unint64_t)v203[1]);
        }
        else
        {
          v177 = *(_OWORD *)v203;
          v178 = v204;
        }
        if (SHIBYTE(v202) < 0)
        {
          sub_100115CE4(&v179, v201[0], (unint64_t)v201[1]);
        }
        else
        {
          v179 = *(_OWORD *)v201;
          v180 = v202;
        }
        if (SHIBYTE(v200) < 0)
        {
          sub_100115CE4(&v181, v199[0], (unint64_t)v199[1]);
        }
        else
        {
          v181 = *(_OWORD *)v199;
          v182 = v200;
        }
        if (SHIBYTE(v198) < 0)
        {
          sub_100115CE4(&v183, v197[0], (unint64_t)v197[1]);
        }
        else
        {
          v183 = *(_OWORD *)v197;
          v184 = v198;
        }
        AnalyticsSendEventLazy(CFSTR("com.apple.Motion.Charon.SurfacePressure"), &v171);
        v137 = (int64x2_t *)self->_dataBuffers;
        if (v137[23].i64[1] >= 0x64uLL)
          sub_10017F858(v137 + 21);
        if (v86[92].info != (__objc2_class_ro *)-1)
          dispatch_once(&qword_10229FE80, &stru_10219E1D8);
        v138 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
        {
          v139 = *(double *)v68;
          v140 = *(_QWORD *)(v68 + 8);
          *(_DWORD *)buf = 68289539;
          *(_DWORD *)&buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(_QWORD *)&buf[10] = "";
          *(_WORD *)&buf[18] = 2050;
          *(double *)&buf[20] = v139;
          *(_WORD *)&buf[28] = 2049;
          *(_QWORD *)&buf[30] = v140;
          _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"surface calibration pressure source updated with\", \"time_s\":\"%{public}.09f\", \"pressure\":\"%{private}f\"}", buf, 0x26u);
          if (v86[92].info != (__objc2_class_ro *)-1)
            dispatch_once(&qword_10229FE80, &stru_10219E1D8);
        }
        v141 = qword_10229FE88;
        if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
        {
          Current = CFAbsoluteTimeGetCurrent();
          v143 = *(_DWORD *)(v68 + 16);
          v145 = *(double *)v68;
          v144 = *(_QWORD *)(v68 + 8);
          *(_DWORD *)buf = 134218752;
          *(CFAbsoluteTime *)&buf[4] = Current;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v144;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v143;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v145;
          _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "surface pressure calibration,timestamp,%f,pressure,%f,type,%d,pressureTimestamp,%f", buf, 0x26u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v86[92].info != (__objc2_class_ro *)-1)
            dispatch_once(&qword_10229FE80, &stru_10219E1D8);
          v160 = qword_10229FE88;
          v161 = CFAbsoluteTimeGetCurrent();
          v162 = *(_DWORD *)(v68 + 16);
          v164 = *(double *)v68;
          v163 = *(_QWORD *)(v68 + 8);
          LODWORD(__p.__r_.__value_.__l.__data_) = 134218752;
          *(CFAbsoluteTime *)((char *)__p.__r_.__value_.__r.__words + 4) = v161;
          WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v163;
          HIWORD(__p.__r_.__value_.__r.__words[2]) = 1024;
          *(_DWORD *)v208 = v162;
          *(_WORD *)&v208[4] = 2048;
          *(double *)&v208[6] = v164;
          LODWORD(v167) = 38;
          v165 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v160, 0, "surface pressure calibration,timestamp,%f,pressure,%f,type,%d,pressureTimestamp,%f", COERCE_DOUBLE(&__p), v167, (_DWORD)p_prevSurfCalMotion, *(double *)&p_prevSurfCalLocation);
          sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator didUpdateSource:withData:]", "%s\n", v165);
          if (v165 != buf)
            free(v165);
        }
        sub_10017EDC0((_QWORD *)self->_dataBuffers + 42, (__int128 *)var0);
        if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0)
          -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 7);
        if (SHIBYTE(v184) < 0)
          operator delete((void *)v183);
        if (SHIBYTE(v182) < 0)
          operator delete((void *)v181);
        if (SHIBYTE(v180) < 0)
          operator delete((void *)v179);
        if (SHIBYTE(v178) < 0)
          operator delete((void *)v177);
        v146 = v176;
        if (v176)
        {
          v147 = (unint64_t *)&v176->__shared_owners_;
          do
            v148 = __ldaxr(v147);
          while (__stlxr(v148 - 1, v147));
          if (!v148)
          {
            ((void (*)(std::__shared_weak_count *))v146->__on_zero_shared)(v146);
            std::__shared_weak_count::__release_weak(v146);
          }
        }
        if (SHIBYTE(v198) < 0)
          operator delete(v197[0]);
        if (SHIBYTE(v200) < 0)
          operator delete(v199[0]);
        if (SHIBYTE(v202) < 0)
          operator delete(v201[0]);
        if (SHIBYTE(v204) < 0)
          operator delete(v203[0]);
        v35 = v206;
      }
      if (v35)
      {
        v149 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v149);
        while (__stlxr(v48 - 1, v149));
        goto LABEL_212;
      }
      break;
    case 8uLL:
      v129 = (int64x2_t *)self->_dataBuffers;
      if (v129[26].i64[1] >= 5uLL)
        sub_10017F858(v129 + 24);
      v130 = *(_QWORD *)var0;
      v35 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      __p.__r_.__value_.__r.__words[0] = *(_QWORD *)var0;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v35;
      if (v35)
      {
        v131 = (unint64_t *)&v35->__shared_owners_;
        do
          v132 = __ldxr(v131);
        while (__stxr(v132 + 1, v131));
      }
      if (qword_10229FE80 != -1)
        dispatch_once(&qword_10229FE80, &stru_10219E1D8);
      v133 = qword_10229FE88;
      if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEBUG))
      {
        v134 = *(_QWORD *)v130;
        v135 = *(unsigned __int8 *)(v130 + 8);
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2050;
        *(_QWORD *)&buf[20] = v134;
        *(_WORD *)&buf[28] = 2050;
        *(_QWORD *)&buf[30] = v135;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"water submersion source updated with\", \"time_s\":\"%{public}.09f\", \"water submersion state\":%{public, location:CMSubmersion_Types::CMSubmersionStates}lld}", buf, 0x26u);
      }
      sub_10017EDC0((_QWORD *)self->_dataBuffers + 48, (__int128 *)var0);
      if ((objc_opt_respondsToSelector(self->_delegate, "didUpdateDataBuffer:") & 1) != 0)
        -[CLBarometerCalibrationAggregatorClient didUpdateDataBuffer:](self->_delegate, "didUpdateDataBuffer:", 8);
      if (v35)
      {
        v136 = (unint64_t *)&v35->__shared_owners_;
        do
          v48 = __ldaxr(v136);
        while (__stlxr(v48 - 1, v136));
LABEL_212:
        if (!v48)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          size = v35;
LABEL_214:
          std::__shared_weak_count::__release_weak(size);
        }
      }
      break;
    default:
      return;
  }
}

- (CLBarometerCalibrationAggregatorClient)delegate
{
  return self->_delegate;
}

- (CLBarometerCalibrationSourceAggregator)initWithUniverse:(id)a3 buffers:(void *)a4
{
  CLBarometerCalibrationSourceAggregator *v6;
  CLBarometerCalibrationSourceAggregator *v7;
  uint64_t i;
  CLBarometerCalibrationSourceWifi *v9;
  CLBarometerCalibrationSourcePressure *v10;
  CLBarometerCalibrationSourceLocation *v11;
  CLBarometerCalibrationSourceCompanion *v12;
  CLBarometerCalibrationSourceSurfaceCalibration *v13;
  CLBarometerCalibrationSourceSubmersionState *v14;
  uint64_t **v15;
  int64x2_t v16;
  unsigned int v18;
  objc_super v19;
  unsigned int *v20;

  v19.receiver = self;
  v19.super_class = (Class)CLBarometerCalibrationSourceAggregator;
  v6 = -[CLBarometerCalibrationSourceAggregator init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a3;
    v6->_dataBuffers = a4;
    for (i = 48; i != 120; i += 8)
      *(Class *)((char *)&v7->super.isa + i) = (Class)objc_opt_new(NSMutableSet);
    v7->_lastTimestampPressureBuffer = 1.79769313e308;
    v7->_currentWetState = 0;
    v9 = -[CLBarometerCalibrationSourceWifi initWithUniverse:delegate:]([CLBarometerCalibrationSourceWifi alloc], "initWithUniverse:delegate:", a3, v7);
    v18 = 2;
    v20 = &v18;
    sub_10021083C((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101B9EB60, &v20)[5] = (uint64_t *)v9;
    v10 = -[CLBarometerCalibrationSourcePressure initWithUniverse:delegate:]([CLBarometerCalibrationSourcePressure alloc], "initWithUniverse:delegate:", a3, v7);
    v18 = 1;
    v20 = &v18;
    sub_10021083C((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101B9EB60, &v20)[5] = (uint64_t *)v10;
    v11 = -[CLBarometerCalibrationSourceLocation initWithUniverse:delegate:]([CLBarometerCalibrationSourceLocation alloc], "initWithUniverse:delegate:", a3, v7);
    v18 = 0;
    v20 = &v18;
    sub_10021083C((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101B9EB60, &v20)[5] = (uint64_t *)v11;
    v12 = -[CLBarometerCalibrationSourceCompanion initWithUniverse:delegate:]([CLBarometerCalibrationSourceCompanion alloc], "initWithUniverse:delegate:", a3, v7);
    v18 = 4;
    v20 = &v18;
    sub_10021083C((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101B9EB60, &v20)[5] = (uint64_t *)v12;
    v13 = -[CLBarometerCalibrationSourceSurfaceCalibration initWithUniverse:delegate:]([CLBarometerCalibrationSourceSurfaceCalibration alloc], "initWithUniverse:delegate:", a3, v7);
    v18 = 7;
    v20 = &v18;
    sub_10021083C((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101B9EB60, &v20)[5] = (uint64_t *)v13;
    v14 = -[CLBarometerCalibrationSourceSubmersionState initWithUniverse:delegate:]([CLBarometerCalibrationSourceSubmersionState alloc], "initWithUniverse:delegate:", a3, v7);
    v18 = 8;
    v20 = &v18;
    v15 = sub_10021083C((uint64_t **)&v7->_sources, &v18, (uint64_t)&unk_101B9EB60, &v20);
    v16 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v15[5] = (uint64_t *)v14;
    *(int64x2_t *)&v7->_prevSurfCalLocation.fTimestamp = v16;
    v7->_prevSurfCalLocation.fCalibrationSource = 3;
    *(int64x2_t *)&v7->_prevSurfCalMotion.fTimestamp = v16;
    v7->_prevSurfCalMotion.fCalibrationSource = 3;
  }
  return v7;
}

- (void)dealloc
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *v6;
  BOOL v7;
  uint64_t i;
  objc_super v9;

  self->_universe = 0;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)self->_sources.__tree_.__begin_node_;
  p_pair1 = &self->_sources.__tree_.__pair1_;
  if (begin_node != &self->_sources.__tree_.__pair1_)
  {
    do
    {

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v6 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, CLBarometerCalibrationSource *>, void *>>> *)begin_node[2].__value_.__left_;
          v7 = v6->__value_.__left_ == begin_node;
          begin_node = v6;
        }
        while (!v7);
      }
      begin_node = v6;
    }
    while (v6 != p_pair1);
  }
  for (i = 48; i != 120; i += 8)

  v9.receiver = self;
  v9.super_class = (Class)CLBarometerCalibrationSourceAggregator;
  -[CLBarometerCalibrationSourceAggregator dealloc](&v9, "dealloc");
}

- (void)disableSources:(id)a3 forContext:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSMutableSet **clientsForSource;
  uint64_t **p_sources;
  void *i;
  id v13;
  unsigned int v14;
  NSMutableSet *v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unsigned int *v21;
  _BYTE v22[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    clientsForSource = self->_clientsForSource;
    p_sources = (uint64_t **)&self->_sources;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(a3);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "integerValue");
        v14 = v13;
        v15 = clientsForSource[(_QWORD)v13];
        -[NSMutableSet removeObject:](v15, "removeObject:", a4);
        if (!-[NSMutableSet count](v15, "count"))
        {
          v16 = v14;
          v21 = &v16;
          objc_msgSend(sub_10021083C(p_sources, &v16, (uint64_t)&unk_101B9EB60, &v21)[5], "disableSource");
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }
}

- (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>,)copyDataBuffersForTrack:(CLBarometerCalibrationSourceAggregator *)self
{
  uint64_t v6;
  char *dataBuffers;
  array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 9UL> *result;
  unint64_t start;
  void **begin;
  char *v11;
  double **v12;
  unint64_t v13;
  char *v14;
  double **v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v6 = 0;
  dataBuffers = (char *)self->_dataBuffers;
  do
  {
    result = (array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 9UL> *)sub_100211128((uint64_t)retstr + v6, &dataBuffers[v6]);
    v6 += 48;
  }
  while (v6 != 432);
  if (a4 == 3)
  {
    start = retstr->__elems_[2].__start_;
    begin = retstr->__elems_[2].__map_.__begin_;
    v11 = (char *)&begin[start >> 8];
    if (retstr->__elems_[2].__map_.__end_ == begin)
    {
      v12 = 0;
      v15 = 0;
      v14 = (char *)&begin[(retstr->__elems_[2].__size_.__value_ + start) >> 8];
    }
    else
    {
      v12 = (double **)(*(_QWORD *)v11 + 16 * start);
      v13 = retstr->__elems_[2].__size_.__value_ + start;
      v14 = (char *)&begin[v13 >> 8];
      v15 = (double **)(*(_QWORD *)v14 + 16 * v13);
    }
    if (v15 == v12
      || (v16 = (((uint64_t)v15 - *(_QWORD *)v14) >> 4) + 32 * (v14 - v11),
          v17 = (uint64_t)v12 - *(_QWORD *)v11,
          v16 == v17 >> 4))
    {
      v18 = 0;
    }
    else
    {
      v18 = 63 - __clz(v16 - (v17 >> 4));
    }
    sub_1010868E4(v11, v12, v14, v15, 2 * v18, 1);
  }
  return result;
}

- (BOOL)isInOutdoorWorkout
{
  BOOL result;

  result = -[CLBarometerCalibrationAggregatorClient isInOutdoorWorkout](-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "isInOutdoorWorkout");
  self->_inOutdoorWorkout = result;
  return result;
}

- (double)getLastAltitude
{
  double result;

  -[CLBarometerCalibrationAggregatorClient getLastAltitude](-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "getLastAltitude");
  self->_lastAltitude = result;
  return result;
}

- (double)getLastAltitudeTime
{
  double result;

  -[CLBarometerCalibrationAggregatorClient getLastAltitudeTime](-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "getLastAltitudeTime");
  self->_lastAltitudeTime = result;
  return result;
}

- (double)getLastAltitudeAccuracy
{
  double result;

  -[CLBarometerCalibrationAggregatorClient getLastAltitudeAccuracy](-[CLBarometerCalibrationSourceAggregator delegate](self, "delegate"), "getLastAltitudeAccuracy");
  self->_lastAltitudeAccuracy = result;
  return result;
}

- (void)wetStateUpdated:(unint64_t)a3
{
  if (self->_currentWetState != a3)
    self->_currentWetState = a3 != 0;
}

- (BOOL)goodSurfaceCalibration:(float)a3
{
  uint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  float v10;
  float v11;
  unint64_t *v12;
  unint64_t v13;
  double v14;
  _BOOL4 v15;
  NSObject *v16;
  CFAbsoluteTime Current;
  _BOOL4 currentWetState;
  uint64_t v20;
  CFAbsoluteTime v21;
  _BOOL4 v22;
  const char *v23;
  uint8_t *v24;
  double v25;
  double v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  CFAbsoluteTime v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  uint8_t buf[4];
  CFAbsoluteTime v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  _BOOL4 v50;

  sub_100211128((uint64_t)&v26, (_QWORD *)self->_dataBuffers + 42);
  if (v30)
  {
    v5 = (uint64_t *)(*(_QWORD *)(v27 + (((unint64_t)(v30 + v29 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v30 + v29 - 1));
    v6 = *v5;
    v7 = (std::__shared_weak_count *)v5[1];
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v10 = a3 - *(double *)(v6 + 8);
    v11 = fabsf(v10);
    if (v7)
    {
      v12 = (unint64_t *)&v7->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v14 = v11;
    v15 = v11 > 3.0 || !self->_currentWetState;
  }
  else
  {
    v15 = 1;
    v14 = -1.0;
  }
  if (qword_10229FE80 != -1)
    dispatch_once(&qword_10229FE80, &stru_10219E1D8);
  v16 = qword_10229FE88;
  if (os_log_type_enabled((os_log_t)qword_10229FE88, OS_LOG_TYPE_DEFAULT))
  {
    Current = CFAbsoluteTimeGetCurrent();
    currentWetState = self->_currentWetState;
    *(_DWORD *)buf = 134219008;
    v42 = Current;
    v43 = 2048;
    v44 = a3;
    v45 = 2048;
    v46 = v14;
    v47 = 1024;
    v48 = currentWetState;
    v49 = 1024;
    v50 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "surface cal check,timestamp,%f,pressure,%f,lastCalDiff,%f,wetState,%d,pass,%d", buf, 0x2Cu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE80 != -1)
      dispatch_once(&qword_10229FE80, &stru_10219E1D8);
    v20 = qword_10229FE88;
    v21 = CFAbsoluteTimeGetCurrent();
    v22 = self->_currentWetState;
    v31 = 134219008;
    v32 = v21;
    v33 = 2048;
    v34 = a3;
    v35 = 2048;
    v36 = v14;
    v37 = 1024;
    v38 = v22;
    v39 = 1024;
    v40 = v15;
    LODWORD(v25) = 44;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v20, 0, "surface cal check,timestamp,%f,pressure,%f,lastCalDiff,%f,wetState,%d,pass,%d", COERCE_DOUBLE(&v31), v25, v26, v27, v28);
    v24 = (uint8_t *)v23;
    sub_100512490("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceAggregator goodSurfaceCalibration:]", "%s\n", v23);
    if (v24 != buf)
      free(v24);
  }
  sub_1006F0FB8(&v26);
  return v15;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_inOutdoorWorkout = a3;
}

- (void)setLastAltitude:(double)a3
{
  self->_lastAltitude = a3;
}

- (void)setLastAltitudeTime:(double)a3
{
  self->_lastAltitudeTime = a3;
}

- (void)setLastAltitudeAccuracy:(double)a3
{
  self->_lastAltitudeAccuracy = a3;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLBarometerCalibrationAggregatorClient *)a3;
}

- (void).cxx_destruct
{
  sub_100008848((uint64_t)&self->_sources, (_QWORD *)self->_sources.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  int64x2_t v2;

  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = (char *)self + 32;
  v2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)((char *)self + 136) = v2;
  *((_DWORD *)self + 38) = 3;
  *((int64x2_t *)self + 10) = v2;
  *((_DWORD *)self + 44) = 3;
  return self;
}

@end
