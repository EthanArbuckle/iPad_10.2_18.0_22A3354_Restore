@implementation CLIndoorUniverse

- (void).cxx_destruct
{
  if (self->_availabilityData.m_initialized)
  {

    self->_availabilityData.m_initialized = 0;
  }
  if (self->_localizerUniverseState.m_initialized)
  {

    self->_localizerUniverseState.m_initialized = 0;
  }
}

- (BOOL)updateLocalizerUniverseIfAllowed:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1 withUniverseUpdatedHandler:(id)a5
{
  id v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  BOOL v13;
  _OWORD v15[8];
  _OWORD v16[2];
  uint64_t v17;
  void *v18[2];
  char v19;
  std::string v20;

  v8 = a5;
  if (!self->_availabilityData.m_initialized)
  {
    sub_1000D5048(v18, "");
    sub_10022B678("AvailabilityTile is not loaded.", &v20);
    sub_100174738((uint64_t)v18, (uint64_t)&v20, 1);
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v20.__r_.__value_.__l.__data_);
    if (v19 < 0)
      operator delete(v18[0]);
    sub_1000F2AE4((uint64_t)&v17);
  }
  if (self->_anon_c9[47])
    goto LABEL_6;
  if (!-[CLIndoorUniverse isAllowedToUpdateUniverse:](self, "isAllowedToUpdateUniverse:", a4))
    goto LABEL_6;
  var13 = a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = var13;
  v16[0] = *(_OWORD *)&a4->var14;
  *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)&a4->var16;
  v10 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v10;
  v11 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v11;
  v12 = *(_OWORD *)&a4->var1.var1;
  v15[0] = *(_OWORD *)&a4->var0;
  v15[1] = v12;
  if (-[CLIndoorUniverse debouceUpdateUniverse:fromLocation:](self, "debouceUpdateUniverse:fromLocation:", a3.__rep_, v15))
  {
    -[CLIndoorUniverse updateLocalizerUniverse:fromLocation:withUniverseUpdatedHandler:](self, "updateLocalizerUniverse:fromLocation:withUniverseUpdatedHandler:", a3.__rep_, a4, v8);
    v13 = 1;
  }
  else
  {
LABEL_6:
    v13 = 0;
  }

  return v13;
}

- (BOOL)isAllowedToUpdateUniverse:(id *)a3
{
  double v3;
  double v4;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v3 = *(double *)((char *)&a3->var1.var1 + 4);
  v4 = *(double *)&self->_anon_c9[39];
  if (v3 > v4)
  {
    if (qword_100417EF8 != -1)
    {
      dispatch_once(&qword_100417EF8, &stru_100406F28);
      v7 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        return v3 <= v4;
      goto LABEL_4;
    }
    v7 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
    {
LABEL_4:
      v8 = *(_QWORD *)((char *)&a3->var1.var1 + 4);
      v9 = *(_QWORD *)&self->_anon_c9[39];
      v11 = 134349312;
      v12 = v8;
      v13 = 2050;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[CLIndoorUniverse] Location accuracy %{public}.02f [m] not enough to update universe (> %{public}.02f [m]", (uint8_t *)&v11, 0x16u);
    }
  }
  return v3 <= v4;
}

- (BOOL)debouceUpdateUniverse:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1
{
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  double v10;
  double v11;
  NSObject *v12;
  _QWORD v14[3];
  char v15;
  uint8_t v16[4];
  double v17;
  __int16 v18;
  double v19;
  _BYTE buf[24];
  char v21;

  if (!self->_localizerUniverseState.m_initialized)
    goto LABEL_8;
  v5 = a3.__rep_ - *(_QWORD *)&self->_anon_11[7];
  if (v5 >= *(_QWORD *)&self->_anon_c9[15])
  {
    *(_OWORD *)&buf[8] = 0uLL;
    *(_QWORD *)buf = off_1003F9A88;
    v21 = 0;
    sub_1000504A8((uint64_t)buf, *(double *)(&a4->var0 + 1));
    sub_1000504A0((uint64_t)buf, *(double *)((char *)&a4->var1.var0 + 4));
    v14[1] = 0;
    v14[2] = 0;
    v14[0] = off_1003F9A88;
    v15 = 0;
    sub_1000504A8((uint64_t)v14, *(double *)&self->_anon_11[19]);
    sub_1000504A0((uint64_t)v14, *(double *)&self->_anon_11[27]);
    v10 = sub_10015C0B0((uint64_t)buf, (uint64_t)v14);
    v11 = *(double *)&self->_anon_c9[23]
        - *(double *)((char *)&a4->var1.var1 + 4)
        * *(double *)((char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7);
    if (v10 >= v11)
    {
      nullsub_22(v14);
      nullsub_22(buf);
LABEL_8:
      LOBYTE(v7) = 1;
      return v7;
    }
    if (qword_100417EF8 == -1)
    {
      v12 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      {
LABEL_12:
        nullsub_22(v14);
        nullsub_22(buf);
        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406F28);
      v12 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
        goto LABEL_12;
    }
    *(_DWORD *)v16 = 134283777;
    v17 = v10;
    v18 = 2049;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[CLIndoorUniverse] not enough distance %{private}.02f m moved since universe was set (waiting for at least: %{private}.02f m", v16, 0x16u);
    goto LABEL_12;
  }
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100406F28);
    v6 = qword_100417F00;
    v7 = os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG);
    if (!v7)
      return v7;
    goto LABEL_5;
  }
  v6 = qword_100417F00;
  v7 = os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
LABEL_5:
    v8 = *(_QWORD *)&self->_anon_c9[15] / 1000000000;
    *(_DWORD *)buf = 134349312;
    *(_QWORD *)&buf[4] = v5 / 1000000000;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CLIndoorUniverse] not enough time %{public}lld sec since universe was set (waiting until: %{public}lld sec)", buf, 0x16u);
LABEL_13:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (CLIndoorUniverse)initWithAvailableVenues:(id)a3 availabilityZScoreConfidenceInterval:(double)a4 dynamicUniverseParameters:(const void *)a5
{
  id v9;
  CLIndoorUniverse *v10;
  CLIndoorUniverse *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  CLIndoorUniverse *v17;
  objc_super v19;
  void *v20[2];
  void *v21[2];
  char v22;
  std::string __p;

  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLIndoorUniverse;
  v10 = -[CLIndoorUniverse init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    *(double *)-[CLIndoorUniverse mutableAvailabilityData](v10, "mutableAvailabilityData") = a4;
    objc_storeStrong((id *)-[CLIndoorUniverse mutableAvailabilityData](v11, "mutableAvailabilityData") + 1, a3);
    if ((*((_BYTE *)a5 + 56) & 4) == 0)
    {
      sub_1000D5048(v21, "");
      sub_10030CE3C("Debounce interval must be set in the dynamicUniverseParameters", &__p);
      sub_100174738((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v22 < 0)
        operator delete(v21[0]);
      sub_1000F2AE4((uint64_t)v20);
    }
    v12 = *((double *)a5 + 4);
    *((_QWORD *)-[CLIndoorUniverse mutableAvailabilityData](v11, "mutableAvailabilityData") + 2) = (uint64_t)(v12 * 1000000000.0);
    if ((*((_BYTE *)a5 + 56) & 2) == 0)
    {
      sub_1000D5048(v21, "");
      sub_10030CE3C("Debounce distance must be set in the dynamicUniverseParameters", &__p);
      sub_100174738((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v22 < 0)
        operator delete(v21[0]);
      sub_1000F2AE4((uint64_t)v20);
    }
    v13 = *((_QWORD *)a5 + 3);
    *((_QWORD *)-[CLIndoorUniverse mutableAvailabilityData](v11, "mutableAvailabilityData") + 3) = v13;
    if ((*((_BYTE *)a5 + 56) & 1) == 0)
    {
      sub_1000D5048(v21, "");
      sub_10024D1FC("Venue group distance must be set in the dynamicUniverseParameters", &__p);
      sub_100174738((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v22 < 0)
        operator delete(v21[0]);
      sub_1000F2AE4((uint64_t)v20);
    }
    v14 = *((_QWORD *)a5 + 2);
    *((_QWORD *)-[CLIndoorUniverse mutableAvailabilityData](v11, "mutableAvailabilityData") + 4) = v14;
    if ((*((_BYTE *)a5 + 56) & 8) == 0)
    {
      sub_1000D5048(v21, "");
      sub_10030CE3C("Update radius cap must be set in the dynamicUniverseParameters", &__p);
      sub_100174738((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v22 < 0)
        operator delete(v21[0]);
      sub_1000F2AE4((uint64_t)v20);
    }
    v15 = *((_QWORD *)a5 + 5);
    *((_QWORD *)-[CLIndoorUniverse mutableAvailabilityData](v11, "mutableAvailabilityData") + 5) = v15;
    if ((*((_BYTE *)a5 + 56) & 0x10) == 0)
    {
      sub_1000D5048(v21, "");
      sub_100237160("Disable dynamic universe must be set in the dynamicUniverseParameters", &__p);
      sub_100174738((uint64_t)v21, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v22 < 0)
        operator delete(v21[0]);
      sub_1000F2AE4((uint64_t)v20);
    }
    v16 = *((_BYTE *)a5 + 48);
    *((_BYTE *)-[CLIndoorUniverse mutableAvailabilityData](v11, "mutableAvailabilityData") + 48) = v16;
    v11->_indoorUniverseFirstDidChange = 1;
    v17 = v11;
  }

  return v11;
}

- (void)mutableAvailabilityData
{
  if (!self->_availabilityData.m_initialized)
  {
    self->_anon_c9[47] = 0;
    *(_OWORD *)&self->_anon_c9[31] = 0u;
    *(_OWORD *)&self->_anon_c9[15] = 0u;
    *(_OWORD *)((char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7) = 0u;
    self->_availabilityData.m_initialized = 1;
  }
  return (char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7;
}

- (id)stripLocatationGroupIdsPrefix:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *__p;
  void *v19[2];
  char v20;
  _BYTE v21[128];
  std::string v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8);
        if ((objc_msgSend(v9, "hasPrefix:", CFSTR("G"), (_QWORD)v14) & 1) == 0)
        {
          sub_1000D5048(v19, "");
          sub_100237160("LocationGroupIds must be prefixed with \"G\" prior to stripping prefix.", &v22);
          sub_100174738((uint64_t)v19, (uint64_t)&v22, 1);
          if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v22.__r_.__value_.__l.__data_);
            if (v20 < 0)
              goto LABEL_13;
          }
          else
          {
            if ((v20 & 0x80000000) == 0)
              goto LABEL_11;
LABEL_13:
            operator delete(v19[0]);
          }
LABEL_11:
          sub_1000F2AE4((uint64_t)&__p);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", 1));
        objc_msgSend(v4, "addObject:", v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
      v6 = v11;
    }
    while (v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  return v12;
}

- (void)updateLocalizerUniverse:(duration<long)long fromLocation:()std:(1000000000>>)a3 :(id *)a4 ratio<1 withUniverseUpdatedHandler:(id)a5
{
  void (**v8)(id, void *, uint64_t, BOOL);
  const char *v9;
  int v10;
  const char *v11;
  int v12;
  const char *v13;
  int v14;
  const char *v15;
  int v16;
  CLGpsPosition *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  id v36[2];
  id v37;
  char v38;
  void *__p[2];
  void *v40[2];
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE buf[12];
  char v73;

  v8 = (void (**)(id, void *, uint64_t, BOOL))a5;
  v36[0] = 0;
  v37 = 0;
  v38 = 0;
  v9 = sub_1000C3814();
  sub_1000B3964((uint64_t)v9);
  v10 = (int)v40[0];
  sub_1000B3D5C((uint64_t)v40);
  if (v10 != v10 >> 31)
  {
    v11 = sub_1000C3814();
    sub_1000B3964((uint64_t)v11);
    v12 = (int)v40[0];
    sub_1000B3D5C((uint64_t)v40);
    if (v12 != v12 >> 31)
    {
      sub_1000D5048(buf, "");
      sub_100316750("Override of DYNAMIC_UNIVERSE_FORCED_VENUES is not supported.", (std::string *)v40);
      sub_100174738((uint64_t)buf, (uint64_t)v40, 1);
      if (SBYTE7(v41) < 0)
      {
        operator delete(v40[0]);
        if ((v73 & 0x80000000) == 0)
          goto LABEL_5;
      }
      else if ((v73 & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)buf);
LABEL_5:
      sub_1000F2AE4((uint64_t)__p);
    }
  }
  v13 = sub_1000C3824();
  sub_1000B3964((uint64_t)v13);
  v14 = (int)v40[0];
  sub_1000B3D5C((uint64_t)v40);
  if (v14 != v14 >> 31)
  {
    v15 = sub_1000C3824();
    sub_1000B3964((uint64_t)v15);
    v16 = (int)v40[0];
    sub_1000B3D5C((uint64_t)v40);
    if (v16 != v16 >> 31)
    {
      sub_1000D5048(buf, "");
      sub_100316750("Override of DYNAMIC_UNIVERSE_FAKE_LAST_FIX is not supported.", (std::string *)v40);
      sub_100174738((uint64_t)buf, (uint64_t)v40, 1);
      if (SBYTE7(v41) < 0)
      {
        operator delete(v40[0]);
        if ((v73 & 0x80000000) == 0)
          goto LABEL_10;
      }
      else if ((v73 & 0x80000000) == 0)
      {
        goto LABEL_10;
      }
      operator delete(*(void **)buf);
LABEL_10:
      sub_1000F2AE4((uint64_t)__p);
    }
  }
  v36[1] = *(id *)&self->_anon_c9[31];
  v38 = 1;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  *(_OWORD *)v40 = 0u;
  +[CLClientTypesPrivate defaultCLClientLocationPrivate](CLClientTypesPrivate, "defaultCLClientLocationPrivate");
  v17 = -[CLGpsPosition initWithLocation:andPrivateLocation:]([CLGpsPosition alloc], "initWithLocation:andPrivateLocation:", a4, v40);
  if (!objc_msgSend(*(id *)&self->_anon_c9[7], "count"))
  {
    if (qword_100417EF8 == -1)
    {
      v18 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      goto LABEL_14;
    }
    dispatch_once(&qword_100417EF8, &stru_100406F28);
    v18 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "zero _availabilityData->availableVenues when computed nearestVenues.", buf, 2u);
    }
  }
LABEL_15:
  v19 = +[CLIndoorCommonHooks nearestVenues:availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:](CLIndoorCommonHooks, "nearestVenues:availableVenues:latestPosition:availabilityZScoreConfidenceInterval:settings:isAllowedMultipleVenues:", std::chrono::steady_clock::now().__d_.__rep_, *(_QWORD *)&self->_anon_c9[7], v17, v36, 1, *(double *)((char *)&self->_availabilityData.m_storage.dummy_.aligner_ + 7));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorUniverse stripLocatationGroupIdsPrefix:](self, "stripLocatationGroupIdsPrefix:", v20));

  if (!objc_msgSend(v21, "count"))
  {
    if (qword_100417EF8 != -1)
    {
      dispatch_once(&qword_100417EF8, &stru_100406F28);
      v22 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      goto LABEL_18;
    }
    v22 = qword_100417F00;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "zero selectedLocationGroups returned in nearestVenues.", buf, 2u);
    }
  }
LABEL_19:
  *((duration<long long, std::ratio<1, 1000000000>> *)-[CLIndoorUniverse mutableUniverseState](self, "mutableUniverseState")+ 1) = a3;
  v23 = -[CLIndoorUniverse mutableUniverseState](self, "mutableUniverseState");
  v24 = *(_OWORD *)&a4->var1.var1;
  v23[1] = *(_OWORD *)&a4->var0;
  v23[2] = v24;
  v25 = *(_OWORD *)&a4->var3;
  v26 = *(_OWORD *)&a4->var5;
  v27 = *(_OWORD *)&a4->var9;
  v23[5] = *(_OWORD *)&a4->var7;
  v23[6] = v27;
  v23[3] = v25;
  v23[4] = v26;
  v28 = *(_OWORD *)&a4->var11;
  var13 = a4->var13;
  v30 = *(_OWORD *)&a4->var14;
  *(_OWORD *)((char *)v23 + 156) = *(_OWORD *)&a4->var16;
  v23[8] = var13;
  v23[9] = v30;
  v23[7] = v28;
  if (!*(_QWORD *)((char *)&self->_localizerUniverseState.m_storage.dummy_.aligner_ + 7)
    || (objc_msgSend(v21, "isSubsetOfSet:") & 1) == 0)
  {
    if (qword_100417EF8 == -1)
    {
      v32 = (id)qword_100417F00;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
LABEL_25:

        objc_storeStrong((id *)-[CLIndoorUniverse mutableUniverseState](self, "mutableUniverseState"), v21);
        v31 = 1;
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100406F28);
      v32 = (id)qword_100417F00;
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        goto LABEL_25;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "))));
    v35 = objc_msgSend(v34, "UTF8String");
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v35;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "updateUniverse setting _universeState.locationGroupIds: %s", buf, 0xCu);

    goto LABEL_25;
  }
  v31 = 0;
LABEL_26:
  v8[2](v8, -[CLIndoorUniverse mutableUniverseState](self, "mutableUniverseState"), v31, self->_indoorUniverseFirstDidChange);
  if ((_DWORD)v31 && self->_indoorUniverseFirstDidChange)
    self->_indoorUniverseFirstDidChange = 0;

}

- (void)mutableUniverseState
{
  if (!self->_localizerUniverseState.m_initialized)
  {
    *(_OWORD *)&self->_anon_11[155] = 0u;
    *(_OWORD *)&self->_anon_11[127] = 0u;
    *(_OWORD *)&self->_anon_11[143] = 0u;
    *(_OWORD *)&self->_anon_11[95] = 0u;
    *(_OWORD *)&self->_anon_11[111] = 0u;
    *(_OWORD *)&self->_anon_11[63] = 0u;
    *(_OWORD *)&self->_anon_11[79] = 0u;
    *(_OWORD *)&self->_anon_11[31] = 0u;
    *(_OWORD *)&self->_anon_11[47] = 0u;
    *(_OWORD *)((char *)&self->_localizerUniverseState.m_storage.dummy_.aligner_ + 7) = 0u;
    *(_OWORD *)&self->_anon_11[15] = 0u;
    self->_localizerUniverseState.m_initialized = 1;
  }
  return (char *)&self->_localizerUniverseState.m_storage.dummy_.aligner_ + 7;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 192) = 0;
  return self;
}

@end
