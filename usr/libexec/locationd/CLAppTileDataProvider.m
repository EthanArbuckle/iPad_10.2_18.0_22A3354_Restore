@implementation CLAppTileDataProvider

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_10230D570 != -1)
    dispatch_once(&qword_10230D570, &stru_1021A9818);
  return (id)qword_10230D568;
}

- (CLAppTileDataProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAppTileDataProvider;
  return -[CLAppTileDataProvider initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLAppTileDataProviderProtocol, &OBJC_PROTOCOL___CLAppTileDataProviderClientProtocol);
}

- (void)beginService
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _QWORD v6[5];
  _WORD v7[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "silo");
  if (qword_1022A02D0 != -1)
    dispatch_once(&qword_1022A02D0, &stru_1021A9838);
  v3 = qword_1022A02D8;
  if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TILE_APP: begin", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TILE_APP: begin", v7, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider beginService]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLAppTileDataProvider setActiveRequests:](self, "setActiveRequests:", objc_alloc_init((Class)NSMutableArray));
  -[CLAppTileDataProvider setActiveRequestCleanupTimer:](self, "setActiveRequestCleanupTimer:", objc_msgSend(objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "silo"), "newTimer"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10121EE44;
  v6[3] = &unk_10212BB58;
  v6[4] = self;
  -[CLTimer setHandler:](-[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"), "setHandler:", v6);
}

- (void)endService
{
  NSObject *v3;
  Client *value;
  const char *v5;
  uint8_t *v6;
  _WORD v7[8];
  uint8_t buf[1640];

  objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "silo");
  if (qword_1022A02D0 != -1)
    dispatch_once(&qword_1022A02D0, &stru_1021A9838);
  v3 = qword_1022A02D8;
  if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TILE_APP: shutdown", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v7[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TILE_APP: shutdown", v7, 2);
    v6 = (uint8_t *)v5;
    sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider endService]", "%s\n", v5);
    if (v6 != buf)
      free(v6);
  }

  -[CLAppTileDataProvider setActiveRequests:](self, "setActiveRequests:", 0);
  -[CLTimer invalidate](-[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"), "invalidate");

  -[CLAppTileDataProvider setActiveRequestCleanupTimer:](self, "setActiveRequestCleanupTimer:", 0);
  value = self->_tilesManagerClient.__ptr_.__value_;
  self->_tilesManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id)getAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7
{
  _BOOL8 v8;
  id v13;
  double v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  double *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  double v29;
  double v30;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  CLAppTileDataProviderResult *v36;
  int v37;
  NSObject *v38;
  double v39;
  double v40;
  int v41;
  double v42;
  double v43;
  int v44;
  const char *v45;
  uint8_t *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint8_t *v55;
  id v56;
  const char *v58;
  uint8_t *v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  double v66[5];
  char v67[4];
  double v68;
  double v69;
  uint64_t v70;
  double *v71;
  double v72;
  _BYTE v73[16];
  char *v74[5];
  _BYTE v75[128];
  int v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint8_t buf[4];
  double v85;
  __int16 v86;
  double v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;

  v8 = a6;
  sub_100D974B8((uint64_t)v73);
  v70 = (uint64_t)&v70;
  v71 = (double *)&v70;
  v72 = 0.0;
  v68 = a3;
  v69 = a4;
  v13 = objc_msgSend(objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLTilesManager"));
  *(float *)&v14 = a5;
  objc_msgSend(v13, "syncgetAppAvailabilityForLocation:radius:searchContext:availabilityList:includeRegionalApps:", v67, v73, &v70, v8, v14);
  v15 = objc_alloc_init((Class)NSMutableArray);
  sub_1002433B8((uint64_t)v66);
  if (qword_1022A02D0 != -1)
    dispatch_once(&qword_1022A02D0, &stru_1021A9838);
  v16 = qword_1022A02D8;
  if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v85 = v72;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "TILE_APP: getAppsForArea, examining %zu candidate grids.", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v76 = 134217984;
    v77 = v72;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TILE_APP: getAppsForArea, examining %zu candidate grids.", (size_t)&v76);
    v59 = (uint8_t *)v58;
    sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]", "%s\n", v58);
    if (v59 != buf)
      free(v59);
  }
  v18 = v71;
  if (v71 != (double *)&v70)
  {
    *(_QWORD *)&v17 = 134218496;
    v61 = v17;
    do
    {
      if (a5 <= 0.0)
      {
        if (qword_1022A02D0 != -1)
          dispatch_once(&qword_1022A02D0, &stru_1021A9838);
        v19 = qword_1022A02D8;
        if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
        {
          v20 = *((_QWORD *)v18 + 5);
          v21 = *((_QWORD *)v18 + 6);
          *(_DWORD *)buf = 134218752;
          v85 = a3;
          v86 = 2048;
          v87 = a4;
          v88 = 2048;
          v89 = v20;
          v90 = 2048;
          v91 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "TILE_APP: getAppsForArea, query for exact grid containing lat = %f, lon = %f, gridLat = %f, gridLon = %f", buf, 0x2Au);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A02D0 != -1)
            dispatch_once(&qword_1022A02D0, &stru_1021A9838);
          v52 = *((_QWORD *)v18 + 5);
          v53 = *((_QWORD *)v18 + 6);
          v76 = 134218752;
          v77 = a3;
          v78 = 2048;
          v79 = a4;
          v80 = 2048;
          v81 = v52;
          v82 = 2048;
          v83 = v53;
          LODWORD(v60) = 42;
          _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TILE_APP: getAppsForArea, query for exact grid containing lat = %f, lon = %f, gridLat = %f, gridLon = %f", COERCE_DOUBLE(&v76), v60, *(double *)&v61, *((double *)&v61 + 1));
          v55 = (uint8_t *)v54;
          sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]", "%s\n", v54);
          if (v55 != buf)
            free(v55);
        }
        v22 = v18[5];
        v23 = v18[7] * 0.5;
        v24 = v22 - v23;
        v25 = v22 + v23;
        if (v24 > a3 || v25 < a3)
          goto LABEL_57;
        v27 = v18[6];
        v28 = v18[8] * 0.5;
        v29 = v27 - v28;
        v30 = v27 + v28;
        if (v29 > a4 || v30 < a4)
          goto LABEL_57;
      }
      else if (sub_10011E634(v66, v18[5], v18[6], a3, a4, 0.0) - a5 + -25.0 > 0.0)
      {
        goto LABEL_57;
      }
      if (a7)
      {
        if (((*((_DWORD *)v18 + 4) >> 5) & 1) == 0)
          goto LABEL_57;
      }
      else
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v32 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        if (v32)
        {
          v33 = *(_QWORD *)v63;
          while (2)
          {
            for (i = 0; i != v32; i = (char *)i + 1)
            {
              if (*(_QWORD *)v63 != v33)
                objc_enumerationMutation(v15);
              v35 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v35, "adamId") == *((_DWORD *)v18 + 5)
                && objc_msgSend(v35, "touristApp") != (((_BYTE)v18[2] & 0x10) == 0))
              {
                v47 = sub_10011E634(v66, v18[5], v18[6], a3, a4, 0.0);
                objc_msgSend(v35, "latitude");
                v49 = v48;
                objc_msgSend(v35, "longitude");
                if (v47 < sub_10011E634(v66, v49, v50, a3, a4, 0.0))
                {
                  objc_msgSend(v35, "setLatitude:", v18[5]);
                  objc_msgSend(v35, "setLongitude:", v18[6]);
                  objc_msgSend(v35, "setEffectiveRadiusMetersIfInstalled:", *((unsigned int *)v18 + 6));
                  objc_msgSend(v35, "setHeroAppRankInstalled:", *((unsigned int *)v18 + 7));
                  objc_msgSend(v35, "setHeroAppRankUnInstalled:", *((unsigned int *)v18 + 8));
                }
                goto LABEL_57;
              }
            }
            v32 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
            if (v32)
              continue;
            break;
          }
        }
      }
      v36 = objc_alloc_init(CLAppTileDataProviderResult);
      -[CLAppTileDataProviderResult setAdamId:](v36, "setAdamId:", *((unsigned int *)v18 + 5));
      v37 = *((_DWORD *)v18 + 4);
      if ((v37 & 1) != 0)
      {
        v51 = 100;
      }
      else if ((v37 & 2) != 0)
      {
        v51 = 200;
      }
      else if ((v37 & 4) != 0)
      {
        v51 = 300;
      }
      else
      {
        if ((v37 & 8) == 0)
        {
          if (qword_1022A02D0 != -1)
            dispatch_once(&qword_1022A02D0, &stru_1021A9838);
          v38 = qword_1022A02D8;
          if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEFAULT))
          {
            v39 = v18[5];
            v40 = v18[6];
            v41 = *((_DWORD *)v18 + 5);
            *(_DWORD *)buf = v61;
            v85 = v39;
            v86 = 2048;
            v87 = v40;
            v88 = 1024;
            LODWORD(v89) = v41;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "#Warning TILE_APP: getAppsForArea, invalid age rating, lat, %f, lon, %f, adamId, %d", buf, 0x1Cu);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1022A02D0 != -1)
              dispatch_once(&qword_1022A02D0, &stru_1021A9838);
            v42 = v18[5];
            v43 = v18[6];
            v44 = *((_DWORD *)v18 + 5);
            v76 = v61;
            v77 = v42;
            v78 = 2048;
            v79 = v43;
            v80 = 1024;
            LODWORD(v81) = v44;
            LODWORD(v60) = 28;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 0, "#Warning TILE_APP: getAppsForArea, invalid age rating, lat, %f, lon, %f, adamId, %d", COERCE_DOUBLE(&v76), v60, (_DWORD)v61);
            v46 = (uint8_t *)v45;
            sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:]", "%s\n", v45);
            if (v46 != buf)
              free(v46);
          }
          goto LABEL_56;
        }
        v51 = 600;
      }
      -[CLAppTileDataProviderResult setAgeRating:](v36, "setAgeRating:", v51);
      -[CLAppTileDataProviderResult setTouristApp:](v36, "setTouristApp:", (*((_DWORD *)v18 + 4) >> 4) & 1);
      -[CLAppTileDataProviderResult setEffectiveRadiusMetersIfInstalled:](v36, "setEffectiveRadiusMetersIfInstalled:", *((unsigned int *)v18 + 6));
      -[CLAppTileDataProviderResult setHeroAppRankInstalled:](v36, "setHeroAppRankInstalled:", *((unsigned int *)v18 + 7));
      -[CLAppTileDataProviderResult setHeroAppRankUnInstalled:](v36, "setHeroAppRankUnInstalled:", *((unsigned int *)v18 + 8));
      -[CLAppTileDataProviderResult setLatitude:](v36, "setLatitude:", v18[5]);
      -[CLAppTileDataProviderResult setLongitude:](v36, "setLongitude:", v18[6]);
      -[CLAppTileDataProviderResult setSpanLat:](v36, "setSpanLat:", v18[7]);
      -[CLAppTileDataProviderResult setSpanLon:](v36, "setSpanLon:", v18[8]);
      objc_msgSend(v15, "addObject:", v36);
LABEL_56:

LABEL_57:
      v18 = (double *)*((_QWORD *)v18 + 1);
    }
    while (v18 != (double *)&v70);
  }
  v56 = v15;
  sub_1000F34E0(&v70);
  sub_100067A00((uint64_t)v74, v74[1]);
  return v56;
}

- (void)fetchAppsForAreaAtLatitude:(double)a3 longitude:(double)a4 radius:(float)a5 includeRegionalApps:(BOOL)a6 marqueeAppsOnly:(BOOL)a7 withReply:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  NSObject *v15;
  double v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  CLAppTileDataProviderRequest *v23;
  double v24;
  double v25;
  const char *v26;
  char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  char *v31;
  const char *v32;
  char *v33;
  const char *v34;
  char *v35;
  double v36;
  __int16 v37;
  char v38;
  unint64_t v39;
  int v40;
  CFAbsoluteTime Current;
  __int16 v42;
  __int16 v43;
  int v44;
  double v45;
  __int16 v46;
  double v47;
  _DWORD buf[3];
  __int16 v49;
  double v50;

  v9 = a7;
  v10 = a6;
  objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "silo");
  if (!a8)
    sub_10194787C();
  v43 = 0;
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLTilesManager")), "syncgetTileFilePath:latitude:longitude:isFileAccessible:isTileNotExistingOnServer:", 9, (char *)&v43 + 1, &v43, a3, a4))
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v15 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      buf[0] = 134218240;
      *(double *)&buf[1] = a3;
      v49 = 2048;
      v50 = a4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, tile is available for lat = %f, lon = %f.", (uint8_t *)buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021A9838);
      v44 = 134218240;
      v45 = a3;
      v46 = 2048;
      v47 = a4;
      LODWORD(v36) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TILE_APP: fetchAppsForArea, tile is available for lat = %f, lon = %f.", COERCE_DOUBLE(&v44), v36);
      v27 = (char *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v26);
      if (v27 != (char *)buf)
        free(v27);
    }
    *(float *)&v16 = a5;
    v17 = -[CLAppTileDataProvider getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:](self, "getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:", v10, v9, a3, a4, v16);
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v18 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      v19 = objc_msgSend(v17, "count");
      buf[0] = 134217984;
      *(_QWORD *)&buf[1] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, found %lu apps.", (uint8_t *)buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021A9838);
      v28 = qword_1022A02D8;
      v29 = objc_msgSend(v17, "count");
      v44 = 134217984;
      v45 = *(double *)&v29;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 2, "TILE_APP: fetchAppsForArea, found %lu apps.", &v44);
      v31 = (char *)v30;
      sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v30);
      if (v31 != (char *)buf)
        free(v31);
    }
    (*((void (**)(id, id, _QWORD))a8 + 2))(a8, v17, 0);
  }
  else if ((_BYTE)v43)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v20 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      buf[0] = 134218240;
      *(double *)&buf[1] = a3;
      v49 = 2048;
      v50 = a4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, tile does not exist on the server for lat = %f, lon = %f.", (uint8_t *)buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021A9838);
      v44 = 134218240;
      v45 = a3;
      v46 = 2048;
      v47 = a4;
      LODWORD(v36) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TILE_APP: fetchAppsForArea, tile does not exist on the server for lat = %f, lon = %f.", COERCE_DOUBLE(&v44), v36);
      v33 = (char *)v32;
      sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v32);
      if (v33 != (char *)buf)
        free(v33);
    }
    v21 = objc_alloc_init((Class)NSArray);
    (*((void (**)(id, id, _QWORD))a8 + 2))(a8, v21, 0);

  }
  else
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v22 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      buf[0] = 134218240;
      *(double *)&buf[1] = a3;
      v49 = 2048;
      v50 = a4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "TILE_APP: fetchAppsForArea, tile is not available for lat = %f, lon = %f. Request for download.", (uint8_t *)buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021A9838);
      v44 = 134218240;
      v45 = a3;
      v46 = 2048;
      v47 = a4;
      LODWORD(v36) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02D8, 2, "TILE_APP: fetchAppsForArea, tile is not available for lat = %f, lon = %f. Request for download.", COERCE_DOUBLE(&v44), v36);
      v35 = (char *)v34;
      sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider fetchAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:withReply:]", "%s\n", v34);
      if (v35 != (char *)buf)
        free(v35);
    }
    if (!-[CLAppTileDataProvider fIsRegisteredForTileDownload](self, "fIsRegisteredForTileDownload"))
    {
      -[CLAppTileDataProvider universe](self, "universe");
      sub_100FBFE98();
    }
    v23 = objc_alloc_init(CLAppTileDataProviderRequest);
    -[CLAppTileDataProviderRequest setLat:](v23, "setLat:", a3);
    -[CLAppTileDataProviderRequest setLon:](v23, "setLon:", a4);
    *(float *)&v24 = a5;
    -[CLAppTileDataProviderRequest setRadiusMeters:](v23, "setRadiusMeters:", v24);
    -[CLAppTileDataProviderRequest setIncludeRegionalApps:](v23, "setIncludeRegionalApps:", v10);
    -[CLAppTileDataProviderRequest setMarqueeAppsOnly:](v23, "setMarqueeAppsOnly:", v9);
    -[CLAppTileDataProviderRequest setHandler:](v23, "setHandler:", a8);
    -[CLAppTileDataProviderRequest setTimestamp:](v23, "setTimestamp:", CFAbsoluteTimeGetCurrent());
    -[NSMutableArray addObject:](-[CLAppTileDataProvider activeRequests](self, "activeRequests"), "addObject:", v23);

    v37 = 0;
    v38 = 0;
    v39 = 0xBFF0000000000000;
    v40 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    v42 = 1;
    objc_msgSend(objc_msgSend(objc_msgSend(-[CLAppTileDataProvider universe](self, "universe"), "vendor"), "proxyForService:", CFSTR("CLTilesManager")), "requestTileDownloadByType:lat:lon:seckey:details:", 9, -1, &v37, a3, a4);
    -[CLTimer nextFireDelay](-[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"), "nextFireDelay");
    if (v25 == 1.79769313e308)
      -[CLTimer setNextFireDelay:](-[CLAppTileDataProvider activeRequestCleanupTimer](self, "activeRequestCleanupTimer"), "setNextFireDelay:", 5.0);
  }
}

- (void)onTileWasDownloadedNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v7;
  const char *v8;
  int *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  int v32;
  id v33;
  id v34;
  double v35;
  id v36;
  NSObject *v37;
  id v38;
  void (**v39)(id, id, _QWORD);
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  int *v45;
  uint64_t v46;
  id v47;
  const char *v48;
  int *v49;
  id v50;
  uint64_t v51;
  const char *v52;
  int *v53;
  double v54;
  id v55;
  __int16 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  int v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  _BYTE v65[128];
  int buf;
  id v67;
  __int16 v68;
  uint64_t v69;

  objc_msgSend(objc_msgSend(a1, "universe"), "silo");
  if (a3)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v7 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = 67109120;
      LODWORD(v67) = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Warning TILE_APP: Got unexpected notification, %d", (uint8_t *)&buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021A9838);
      v61 = 67109120;
      LODWORD(v62) = a3;
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_1022A02D8, 0, "#Warning TILE_APP: Got unexpected notification, %d", &v61);
      v9 = (int *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v8);
      if (v9 != &buf)
        free(v9);
    }
  }
  else if (*(_DWORD *)(a4 + 4) == 9)
  {
    if (qword_1022A02D0 != -1)
      dispatch_once(&qword_1022A02D0, &stru_1021A9838);
    v10 = qword_1022A02D8;
    if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
    {
      buf = 134217984;
      v67 = objc_msgSend(objc_msgSend(a1, "activeRequests"), "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "TILE_APP: onTileWasDownloadedNotification, activeRequests.count = %lu", (uint8_t *)&buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_1021A9838);
      v51 = qword_1022A02D8;
      v61 = 134217984;
      v62 = objc_msgSend(objc_msgSend(a1, "activeRequests"), "count");
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, v51, 2, "TILE_APP: onTileWasDownloadedNotification, activeRequests.count = %lu", &v61);
      v53 = (int *)v52;
      sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v52);
      if (v53 != &buf)
        free(v53);
    }
    v55 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v11 = objc_msgSend(a1, "activeRequests");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v58;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v58 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v16);
          v56 = 0;
          v18 = objc_msgSend(objc_msgSend(objc_msgSend(a1, "universe"), "vendor"), "proxyForService:", CFSTR("CLTilesManager"));
          objc_msgSend(v17, "lat");
          v20 = v19;
          objc_msgSend(v17, "lon");
          if (objc_msgSend(v18, "syncgetTileFilePath:latitude:longitude:isFileAccessible:isTileNotExistingOnServer:", 9, (char *)&v56 + 1, &v56, v20, v21))
          {
            v22 = 0;
          }
          else
          {
            v22 = v56 == 0;
          }
          if (!v22)
          {
            if (qword_1022A02D0 != -1)
              dispatch_once(&qword_1022A02D0, &stru_1021A9838);
            v23 = qword_1022A02D8;
            if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v17, "lat");
              v25 = v24;
              objc_msgSend(v17, "lon");
              buf = 134218240;
              v67 = v25;
              v68 = 2048;
              v69 = v26;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "TILE_APP: onTileWasDownloadedNotification, tile is available (or tile is 404) for lat = %f, lon = %f.", (uint8_t *)&buf, 0x16u);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(&buf, 0x65CuLL);
              if (qword_1022A02D0 != -1)
                dispatch_once(&qword_1022A02D0, &stru_1021A9838);
              v40 = qword_1022A02D8;
              objc_msgSend(v17, "lat");
              v42 = v41;
              objc_msgSend(v17, "lon");
              v61 = 134218240;
              v62 = v42;
              v63 = 2048;
              v64 = v43;
              LODWORD(v54) = 22;
              _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, v40, 2, "TILE_APP: onTileWasDownloadedNotification, tile is available (or tile is 404) for lat = %f, lon = %f.", COERCE_DOUBLE(&v61), v54);
              v45 = (int *)v44;
              sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v44);
              if (v45 != &buf)
                free(v45);
            }
            objc_msgSend(v17, "lat");
            v28 = v27;
            objc_msgSend(v17, "lon");
            v30 = v29;
            objc_msgSend(v17, "radiusMeters");
            v32 = v31;
            v33 = objc_msgSend(v17, "includeRegionalApps");
            v34 = objc_msgSend(v17, "marqueeAppsOnly");
            LODWORD(v35) = v32;
            v36 = objc_msgSend(a1, "getAppsForAreaAtLatitude:longitude:radius:includeRegionalApps:marqueeAppsOnly:", v33, v34, v28, v30, v35);
            if (qword_1022A02D0 != -1)
              dispatch_once(&qword_1022A02D0, &stru_1021A9838);
            v37 = qword_1022A02D8;
            if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_DEBUG))
            {
              v38 = objc_msgSend(v36, "count");
              buf = 134217984;
              v67 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "TILE_APP: onTileWasDownloadedNotification, found %lu apps.", (uint8_t *)&buf, 0xCu);
            }
            if (sub_1001BFF7C(115, 2))
            {
              bzero(&buf, 0x65CuLL);
              if (qword_1022A02D0 != -1)
                dispatch_once(&qword_1022A02D0, &stru_1021A9838);
              v46 = qword_1022A02D8;
              v47 = objc_msgSend(v36, "count");
              v61 = 134217984;
              v62 = v47;
              _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, v46, 2, "TILE_APP: onTileWasDownloadedNotification, found %lu apps.", &v61);
              v49 = (int *)v48;
              sub_100512490("Generic", 1, 0, 2, "-[CLAppTileDataProvider onTileWasDownloadedNotification:data:]", "%s\n", v48);
              if (v49 != &buf)
                free(v49);
            }
            v39 = (void (**)(id, id, _QWORD))objc_msgSend(v17, "handler");
            v39[2](v39, v36, 0);
            objc_msgSend(v55, "addIndex:", (char *)v16 + v14);
          }
          v16 = (char *)v16 + 1;
        }
        while (v13 != v16);
        v50 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        v13 = v50;
        v14 += (uint64_t)v16;
      }
      while (v50);
    }
    objc_msgSend(objc_msgSend(a1, "activeRequests"), "removeObjectsAtIndexes:", v55);
  }
}

- (BOOL)fIsRegisteredForTileDownload
{
  return self->_fIsRegisteredForTileDownload;
}

- (void)setFIsRegisteredForTileDownload:(BOOL)a3
{
  self->_fIsRegisteredForTileDownload = a3;
}

- (NSMutableArray)activeRequests
{
  return self->_activeRequests;
}

- (void)setActiveRequests:(id)a3
{
  self->_activeRequests = (NSMutableArray *)a3;
}

- (CLTimer)activeRequestCleanupTimer
{
  return self->_activeRequestCleanupTimer;
}

- (void)setActiveRequestCleanupTimer:(id)a3
{
  self->_activeRequestCleanupTimer = (CLTimer *)a3;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_tilesManagerClient.__ptr_.__value_;
  self->_tilesManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
