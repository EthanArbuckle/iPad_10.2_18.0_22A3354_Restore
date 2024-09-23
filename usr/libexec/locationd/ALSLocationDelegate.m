@implementation ALSLocationDelegate

- (ALSLocationDelegate)initWithRequester:(void *)a3
{
  ALSLocationDelegate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ALSLocationDelegate;
  v4 = -[ALSLocationDelegate init](&v6, "init");
  if (v4)
  {
    v4->fRequestersWithOutstandingRequests = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v4->fRequester = a3;
  }
  return v4;
}

- (void)dealloc
{
  NSMutableSet *fRequestersWithOutstandingRequests;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  fRequestersWithOutstandingRequests = self->fRequestersWithOutstandingRequests;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](fRequestersWithOutstandingRequests, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(fRequestersWithOutstandingRequests);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "cancel");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](fRequestersWithOutstandingRequests, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ALSLocationDelegate;
  -[ALSLocationDelegate dealloc](&v8, "dealloc");
}

- (void)requester:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5
{
  double Current;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  signed int v20;
  const char *v21;
  NSObject *v22;
  unsigned int v23;
  void *fRequester;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  unint64_t i;
  unsigned int v32;
  unsigned int v33;
  char *v34;
  _DWORD *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  unsigned int *v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  char *v47;
  uint64_t v48;
  const char *v49;
  char *v50;
  uint64_t v51;
  id v52;
  const char *v53;
  char *v54;
  uint64_t v55;
  id v56;
  const char *v57;
  char *v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  _QWORD v64[8];
  _QWORD v65[8];
  _QWORD v66[8];
  int v67;
  id v68;
  _BYTE __p[28];
  __int16 v70;
  unsigned int v71;
  _BYTE buf[18];
  __int16 v73;
  const char *v74;
  __int16 v75;
  unsigned int v76;

  Current = CFAbsoluteTimeGetCurrent();
  v9 = objc_msgSend(a4, "cellTowers");
  v62 = objc_msgSend(a4, "scdmaCellTowers");
  v10 = objc_msgSend(a4, "cdmaCellTowers");
  v11 = objc_msgSend(a4, "lteCellTowers");
  v60 = objc_msgSend(a4, "nr5GCellTowers");
  v12 = objc_msgSend(a4, "wirelessAPs");
  objc_msgSend(a3, "timestamp");
  v14 = Current - v13;
  v61 = v12;
  if (objc_msgSend(v12, "count"))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    v15 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240960;
      *(_DWORD *)&buf[4] = objc_msgSend(a3, "tag");
      *(_WORD *)&buf[8] = 2050;
      *(double *)&buf[10] = v14;
      v73 = 2050;
      v74 = (const char *)objc_msgSend(v12, "count");
      v75 = 1026;
      v76 = objc_msgSend(a3, "type");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "@AlsFlow, reply, tag, %{public}d, wifi, rtt, %{public}.1f, aps, %{public}lu, type, %{public}d", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10214A310);
      v48 = qword_1022A0048;
      *(_DWORD *)__p = 67240960;
      *(_DWORD *)&__p[4] = objc_msgSend(a3, "tag");
      *(_WORD *)&__p[8] = 2050;
      *(double *)&__p[10] = v14;
      *(_WORD *)&__p[18] = 2050;
      *(_QWORD *)&__p[20] = objc_msgSend(v12, "count");
      v70 = 1026;
      v71 = objc_msgSend(a3, "type");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v48, 0, "@AlsFlow, reply, tag, %{public}d, wifi, rtt, %{public}.1f, aps, %{public}lu, type, %{public}d", __p, 34);
      v50 = (char *)v49;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v49);
      if (v50 != buf)
        free(v50);
    }
  }
  if (objc_msgSend(v9, "count")
    || objc_msgSend(v10, "count")
    || objc_msgSend(v11, "count")
    || objc_msgSend(v62, "count")
    || objc_msgSend(v60, "count"))
  {
    v16 = objc_msgSend(v9, "count");
    v17 = objc_msgSend(v10, "count");
    v18 = objc_msgSend(v11, "count");
    v19 = objc_msgSend(v62, "count");
    v20 = v17 + v16 + v18 + v19 + objc_msgSend(v60, "count");
    if ((id)v20 == objc_msgSend(v9, "count"))
    {
      v21 = "gsm";
    }
    else if ((id)v20 == objc_msgSend(v11, "count"))
    {
      v21 = "lte";
    }
    else if ((id)v20 == objc_msgSend(v10, "count"))
    {
      v21 = "cdma";
    }
    else if ((id)v20 == objc_msgSend(v62, "count"))
    {
      v21 = "scdma";
    }
    else if ((id)v20 == objc_msgSend(v60, "count"))
    {
      v21 = "nr";
    }
    else
    {
      v21 = "multiple";
    }
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    v22 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(a3, "tag");
      *(_DWORD *)buf = 67240962;
      *(_DWORD *)&buf[4] = v23;
      *(_WORD *)&buf[8] = 2050;
      *(double *)&buf[10] = v14;
      v73 = 2082;
      v74 = v21;
      v75 = 1026;
      v76 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "@AlsFlow, reply, tag, %{public}d, cell, rtt, %{public}.1f, %{public}s, %{public}d", buf, 0x22u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10214A310);
      v44 = qword_1022A0048;
      v45 = objc_msgSend(a3, "tag");
      *(_DWORD *)__p = 67240962;
      *(_DWORD *)&__p[4] = v45;
      *(_WORD *)&__p[8] = 2050;
      *(double *)&__p[10] = v14;
      *(_WORD *)&__p[18] = 2082;
      *(_QWORD *)&__p[20] = v21;
      v70 = 1026;
      v71 = v20;
      LODWORD(v59) = 34;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v44, 0, "@AlsFlow, reply, tag, %{public}d, cell, rtt, %{public}.1f, %{public}s, %{public}d", __p, v59);
      v47 = (char *)v46;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v46);
      if (v47 != buf)
        free(v47);
    }
  }
  (*(void (**)(uint64_t *))(qword_102303150 + 16))(&qword_102303150);
  ++dword_102303184;
  (*(void (**)(uint64_t *))(qword_102303150 + 24))(&qword_102303150);
  sub_1015A2E04(buf, "didReceiveResponse");
  sub_100CDC4CC((uint64_t)&qword_102303150, (uint64_t *)buf, *((_DWORD *)self->fRequester + 118));
  if (SBYTE3(v74) < 0)
    operator delete(*(void **)buf);
  if (objc_msgSend(v10, "count"))
  {
    fRequester = self->fRequester;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100663458;
    v66[3] = &unk_10214A1B0;
    v66[4] = v10;
    v66[5] = self;
    v66[6] = a3;
    *(double *)&v66[7] = Current;
    sub_1006633F4((uint64_t)fRequester, (int)objc_msgSend(a3, "type"), (int)objc_msgSend(a3, "tag"), (uint64_t)v66);
  }
  if (objc_msgSend(v11, "count"))
  {
    v25 = self->fRequester;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100664070;
    v65[3] = &unk_10214A1B0;
    v65[4] = v11;
    v65[5] = self;
    v65[6] = a3;
    *(double *)&v65[7] = Current;
    sub_1006633F4((uint64_t)v25, (int)objc_msgSend(a3, "type"), (int)objc_msgSend(a3, "tag"), (uint64_t)v65);
  }
  if (objc_msgSend(v60, "count"))
  {
    v26 = self->fRequester;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_1006649F0;
    v64[3] = &unk_10214A1B0;
    v64[4] = v60;
    v64[5] = self;
    v64[6] = a3;
    *(double *)&v64[7] = Current;
    sub_1006633F4((uint64_t)v26, (int)objc_msgSend(a3, "type"), (int)objc_msgSend(a3, "tag"), (uint64_t)v64);
  }
  if (objc_msgSend(v62, "count"))
    -[ALSLocationDelegate processScdmaCells:inRange:timeReceived:requestType:tag:](self, "processScdmaCells:inRange:timeReceived:requestType:tag:", v62, 0, objc_msgSend(v62, "count"), objc_msgSend(a3, "type"), objc_msgSend(a3, "tag"), Current);
  if (objc_msgSend(v9, "count"))
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    v27 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      v28 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "AlsCell, gsm, unbatched, %{public}lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10214A310);
      v51 = qword_1022A0048;
      v52 = objc_msgSend(v9, "count");
      *(_DWORD *)__p = 134349056;
      *(_QWORD *)&__p[4] = v52;
      LODWORD(v59) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v51, 2, "AlsCell, gsm, unbatched, %{public}lu", __p, v59);
      v54 = (char *)v53;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v53);
      if (v54 != buf)
        free(v54);
    }
    -[ALSLocationDelegate processCells:inRange:timeReceived:requestType:tag:](self, "processCells:inRange:timeReceived:requestType:tag:", v9, 0, objc_msgSend(v9, "count"), objc_msgSend(a3, "type"), objc_msgSend(a3, "tag"), Current);
  }
  if (objc_msgSend(v61, "count"))
  {
    memset(__p, 0, 24);
    if (!objc_msgSend(a3, "type") && objc_msgSend(a5, "surroundingWifiBandsCount"))
    {
      for (i = 0; i < (unint64_t)objc_msgSend(a5, "surroundingWifiBandsCount"); ++i)
      {
        v32 = objc_msgSend(a5, "surroundingWifiBandsAtIndex:", i);
        v33 = v32;
        v34 = *(char **)&__p[8];
        if (*(_QWORD *)&__p[8] >= *(_QWORD *)&__p[16])
        {
          v36 = *(char **)__p;
          v37 = (uint64_t)(*(_QWORD *)&__p[8] - *(_QWORD *)__p) >> 2;
          v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62)
            sub_100259694();
          v39 = *(_QWORD *)&__p[16] - *(_QWORD *)__p;
          if ((uint64_t)(*(_QWORD *)&__p[16] - *(_QWORD *)__p) >> 1 > v38)
            v38 = v39 >> 1;
          if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL)
            v40 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v40 = v38;
          if (v40)
          {
            v41 = (char *)sub_100260634((uint64_t)&__p[16], v40);
            v36 = *(char **)__p;
            v34 = *(char **)&__p[8];
          }
          else
          {
            v41 = 0;
          }
          v42 = (unsigned int *)&v41[4 * v37];
          *v42 = v33;
          v35 = v42 + 1;
          while (v34 != v36)
          {
            v43 = *((_DWORD *)v34 - 1);
            v34 -= 4;
            *--v42 = v43;
          }
          *(_QWORD *)__p = v42;
          *(_QWORD *)&__p[8] = v35;
          *(_QWORD *)&__p[16] = &v41[4 * v40];
          if (v36)
            operator delete(v36);
        }
        else
        {
          **(_DWORD **)&__p[8] = v32;
          v35 = v34 + 4;
        }
        *(_QWORD *)&__p[8] = v35;
      }
    }
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    v29 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      v30 = objc_msgSend(v61, "count");
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "AlsWifi, unbatched, %{public}lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10214A310);
      v55 = qword_1022A0048;
      v56 = objc_msgSend(v61, "count");
      v67 = 134349056;
      v68 = v56;
      LODWORD(v59) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v55, 2, "AlsWifi, unbatched, %{public}lu", &v67, v59);
      v58 = (char *)v57;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v57);
      if (v58 != buf)
        free(v58);
    }
    -[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:](self, "processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:", v61, 0, objc_msgSend(v61, "count"), objc_msgSend(a3, "type"), objc_msgSend(a3, "tag"), __p, Current);
    if (*(_QWORD *)__p)
    {
      *(_QWORD *)&__p[8] = *(_QWORD *)__p;
      operator delete(*(void **)__p);
    }
  }
}

- (void)requesterDidFinish:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  const char *v10;
  char *v11;
  NSObject *v12;
  const char *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  _BYTE __p[12];
  __int16 v19;
  id v20;
  char v21;

  if ((-[NSMutableSet containsObject:](self->fRequestersWithOutstandingRequests, "containsObject:") & 1) != 0)
  {
    sub_1015A2E04(__p, "requesterDidFinish");
    sub_100CDC4CC((uint64_t)&qword_102303150, (uint64_t *)__p, *((_DWORD *)self->fRequester + 118));
    if (v21 < 0)
      operator delete(*(void **)__p);
    v5 = objc_msgSend(a3, "downloadPayloadSize");
    (*(void (**)(uint64_t *))(qword_102303150 + 16))(&qword_102303150);
    dword_10230317C += (int)v5;
    (*(void (**)(uint64_t *))(qword_102303150 + 24))(&qword_102303150);
    objc_msgSend(a3, "setFinished:", 1);
    -[ALSLocationDelegate finished:](self, "finished:", a3);
    -[NSMutableSet removeObject:](self->fRequestersWithOutstandingRequests, "removeObject:", a3);
    if (qword_1022A0290 != -1)
      dispatch_once(&qword_1022A0290, &stru_10214A378);
    v6 = qword_1022A0298;
    if (os_log_type_enabled((os_log_t)qword_1022A0298, OS_LOG_TYPE_INFO))
    {
      v7 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      *(_DWORD *)__p = 134218240;
      *(_QWORD *)&__p[4] = v5;
      v19 = 2048;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AlsRequester, didFinish, payload, %lu, outstanding, %ld", __p, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1022A0290 != -1)
        dispatch_once(&qword_1022A0290, &stru_10214A378);
      v8 = qword_1022A0298;
      v9 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      v14 = 134218240;
      v15 = v5;
      v16 = 2048;
      v17 = v9;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, v8, 1, "AlsRequester, didFinish, payload, %lu, outstanding, %ld", &v14, 22);
      v11 = (char *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate requesterDidFinish:]", "%s\n", v10);
LABEL_21:
      if (v11 != __p)
        free(v11);
    }
  }
  else
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10214A358);
    v12 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Unknown pbrequester object received in delegate callback", __p, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10214A358);
      LOWORD(v14) = 0;
      _os_log_send_and_compose_impl(2, 0, __p, 1628, &_mh_execute_header, qword_1022A02A8, 17, "Unknown pbrequester object received in delegate callback", &v14, 2);
      v11 = (char *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[ALSLocationDelegate requesterDidFinish:]", "%s\n", v13);
      goto LABEL_21;
    }
  }
}

- (void)requester:(id)a3 didFailWithError:(id)a4
{
  NSObject *v7;
  unsigned int v8;
  double Current;
  double v10;
  unsigned int v11;
  NSObject *v12;
  const char *v13;
  char *v14;
  NSObject *v15;
  unsigned int v16;
  NSObject *v17;
  int v18;
  uint8_t *v19;
  id v20;
  uint8_t *v21;
  uint64_t v22;
  unsigned int v23;
  double v24;
  double v25;
  const char *v26;
  uint8_t *v27;
  uint64_t v28;
  int v29;
  _BYTE *v30;
  id v31;
  _BYTE *v32;
  char *v33;
  uint64_t v34;
  unsigned int v35;
  const char *v36;
  uint8_t *v37;
  uint64_t v38;
  int v39;
  _BYTE *v40;
  __int16 v41;
  id v42;
  _BYTE v43[28];
  uint8_t buf[8];
  __int16 v45;
  double v46;
  __int16 v47;
  id v48;

  if ((-[NSMutableSet containsObject:](self->fRequestersWithOutstandingRequests, "containsObject:") & 1) != 0)
  {
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    v7 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(a3, "tag");
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(a3, "timestamp");
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)&buf[4] = v8;
      v45 = 2050;
      v46 = Current - v10;
      v47 = 2050;
      v48 = objc_msgSend(a4, "code");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "@AlsFlow, reply, tag, %{public}d, error, rtt, %{public}.1lf, code, %{public}ld", buf, 0x1Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10214A310);
      v22 = qword_1022A0048;
      v23 = objc_msgSend(a3, "tag");
      v24 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(a3, "timestamp");
      *(_DWORD *)v43 = 67240704;
      *(_DWORD *)&v43[4] = v23;
      *(_WORD *)&v43[8] = 2050;
      *(double *)&v43[10] = v24 - v25;
      *(_WORD *)&v43[18] = 2050;
      *(_QWORD *)&v43[20] = objc_msgSend(a4, "code");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v22, 0, "@AlsFlow, reply, tag, %{public}d, error, rtt, %{public}.1lf, code, %{public}ld", v43, 28);
      v27 = (uint8_t *)v26;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v26);
      if (v27 != buf)
        free(v27);
    }
    v11 = objc_msgSend(a3, "type");
    if (v11 == 1)
    {
      sub_100666088((uint64_t)self->fRequester, (int)objc_msgSend(a3, "type"), (int)objc_msgSend(a3, "tag"));
    }
    else if (v11)
    {
      if (qword_1022A02D0 != -1)
        dispatch_once(&qword_1022A02D0, &stru_10214A398);
      v15 = qword_1022A02D8;
      if (os_log_type_enabled((os_log_t)qword_1022A02D8, OS_LOG_TYPE_FAULT))
      {
        v16 = objc_msgSend(a3, "tag");
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "query: received error for unknown requester type (tag %{public}d)", buf, 8u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A02D0 != -1)
          dispatch_once(&qword_1022A02D0, &stru_10214A398);
        v34 = qword_1022A02D8;
        v35 = objc_msgSend(a3, "tag");
        *(_DWORD *)v43 = 67240192;
        *(_DWORD *)&v43[4] = v35;
        LODWORD(v38) = 8;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v34, 17, "query: received error for unknown requester type (tag %{public}d)", v43, v38);
        v37 = (uint8_t *)v36;
        sub_100512490("Generic", 1, 0, 0, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v36);
        if (v37 != buf)
          free(v37);
      }
    }
    else
    {
      sub_100666024((uint64_t)self->fRequester, (int)objc_msgSend(a3, "type"), (int)objc_msgSend(a3, "tag"));
    }
    sub_1015A2E04(buf, "didFailWithError");
    sub_100CDC4CC((uint64_t)&qword_102303150, (uint64_t *)buf, *((_DWORD *)self->fRequester + 118));
    if (SBYTE3(v48) < 0)
      operator delete(*(void **)buf);
    -[NSMutableSet removeObject:](self->fRequestersWithOutstandingRequests, "removeObject:", a3);
    if (qword_1022A0290 != -1)
      dispatch_once(&qword_1022A0290, &stru_10214A378);
    v17 = qword_1022A0298;
    if (os_log_type_enabled((os_log_t)qword_1022A0298, OS_LOG_TYPE_INFO))
    {
      sub_1001A486C((const __CFString *)objc_msgSend(a4, "domain"), (uint64_t)buf);
      v18 = SBYTE3(v48);
      v19 = *(uint8_t **)buf;
      v20 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      v21 = buf;
      if (v18 < 0)
        v21 = v19;
      *(_DWORD *)v43 = 136315394;
      *(_QWORD *)&v43[4] = v21;
      *(_WORD *)&v43[12] = 2048;
      *(_QWORD *)&v43[14] = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "AlsRequester, didFailWithError, code, %s, outstanding, %ld", v43, 0x16u);
      if (SBYTE3(v48) < 0)
        operator delete(*(void **)buf);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0290 != -1)
        dispatch_once(&qword_1022A0290, &stru_10214A378);
      v28 = qword_1022A0298;
      sub_1001A486C((const __CFString *)objc_msgSend(a4, "domain"), (uint64_t)v43);
      v29 = v43[23];
      v30 = *(_BYTE **)v43;
      v31 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
      v32 = v43;
      if (v29 < 0)
        v32 = v30;
      v39 = 136315394;
      v40 = v32;
      v41 = 2048;
      v42 = v31;
      LODWORD(v38) = 22;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v28, 1, "AlsRequester, didFailWithError, code, %s, outstanding, %ld", (const char *)&v39, v38);
      v14 = v33;
      if ((v43[23] & 0x80000000) != 0)
        operator delete(*(void **)v43);
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v14);
      if (v14 != (char *)buf)
LABEL_47:
        free(v14);
    }
  }
  else
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_10214A358);
    v12 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Unknown pbrequester object received in delegate callback", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_10214A358);
      *(_WORD *)v43 = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 17, "Unknown pbrequester object received in delegate callback", v43, 2);
      v14 = (char *)v13;
      sub_100512490("Generic", 1, 0, 0, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v13);
      if (v14 != (char *)buf)
        goto LABEL_47;
    }
  }
}

- (void)finished:(id)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint8_t *v10;
  int v11;
  id v12;
  uint8_t buf[4];
  id v14;

  if (qword_1022A0290 != -1)
    dispatch_once(&qword_1022A0290, &stru_10214A378);
  v5 = qword_1022A0298;
  if (os_log_type_enabled((os_log_t)qword_1022A0298, OS_LOG_TYPE_INFO))
  {
    v6 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
    *(_DWORD *)buf = 134217984;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AlsRequester, finished, outstanding, %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0290 != -1)
      dispatch_once(&qword_1022A0290, &stru_10214A378);
    v7 = qword_1022A0298;
    v8 = -[NSMutableSet count](self->fRequestersWithOutstandingRequests, "count");
    v11 = 134217984;
    v12 = v8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v7, 1, "AlsRequester, finished, outstanding, %ld", &v11);
    v10 = (uint8_t *)v9;
    sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate finished:]", "%s\n", v9);
    if (v10 != buf)
      free(v10);
  }
  if ((objc_msgSend(a3, "processingCellTowers") & 1) == 0
    && (objc_msgSend(a3, "processingWirelessAPs") & 1) == 0)
  {
    if (objc_msgSend(a3, "finished"))
      sub_1006662F8((uint64_t)self->fRequester, (int)objc_msgSend(a3, "type"), (int)objc_msgSend(a3, "tag"));
  }
}

- (void)processCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v14;
  void *fRequester;
  const char *v16;
  uint8_t *v17;
  _QWORD v18[9];
  int v19;
  int v20;
  int v21;
  NSUInteger v22;
  uint8_t buf[4];
  NSUInteger v24;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    v14 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v24 = length;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AlsCell, gsm, rx, %{public}lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10214A310);
      v21 = 134349056;
      v22 = length;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "AlsCell, gsm, rx, %{public}lu", &v21, 12);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate processCells:inRange:timeReceived:requestType:tag:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    fRequester = self->fRequester;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100666588;
    v18[3] = &unk_10214A1D8;
    v18[6] = location;
    v18[7] = length;
    v18[4] = a3;
    v18[5] = self;
    v19 = a6;
    v20 = a7;
    *(double *)&v18[8] = a5;
    sub_1006633F4((uint64_t)fRequester, a6, a7, (uint64_t)v18);
  }
}

- (void)processScdmaCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v14;
  void *fRequester;
  const char *v16;
  uint8_t *v17;
  _QWORD v18[9];
  int v19;
  int v20;
  int v21;
  NSUInteger v22;
  uint8_t buf[4];
  NSUInteger v24;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    v14 = qword_1022A0048;
    if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v24 = length;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AlsCell, scdma, rx, %{public}lu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0040 != -1)
        dispatch_once(&qword_1022A0040, &stru_10214A310);
      v21 = 134349056;
      v22 = length;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "AlsCell, scdma, rx, %{public}lu", &v21, 12);
      v17 = (uint8_t *)v16;
      sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate processScdmaCells:inRange:timeReceived:requestType:tag:]", "%s\n", v16);
      if (v17 != buf)
        free(v17);
    }
    fRequester = self->fRequester;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100666F1C;
    v18[3] = &unk_10214A1D8;
    v18[6] = location;
    v18[7] = length;
    v18[4] = a3;
    v18[5] = self;
    v19 = a6;
    v20 = a7;
    *(double *)&v18[8] = a5;
    sub_1006633F4((uint64_t)fRequester, a6, a7, (uint64_t)v18);
  }
}

- (void)processWireless:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7 surroundingWifiBands:(const void *)a8
{
  NSUInteger length;
  NSUInteger location;
  uint64_t *v12;
  NSObject *v13;
  id v19;
  double v20;
  uint64_t v21;
  CFAbsoluteTime Current;
  unsigned int v23;
  NSObject *v24;
  _BYTE *v25;
  unsigned int v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  unsigned int v35;
  NSObject *v36;
  _BYTE *v37;
  std::string *v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  unsigned int v43;
  _OWORD *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char *v54;
  _OWORD *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  char *v60;
  __int128 v61;
  __int128 v62;
  char *v63;
  char *v64;
  char *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  char *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  char *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  char *v95;
  uint64_t v96;
  std::string *v97;
  unsigned int v98;
  char *v99;
  char *v100;
  uint64_t v101;
  std::string *v102;
  void **v103;
  int v104;
  int v105;
  uint64_t v106;
  int v107;
  unsigned int v108;
  char *v109;
  char *v110;
  int *v111;
  int *v112;
  char v113;
  char v114;
  int v115;
  int v116;
  int v117;
  int v118;
  const char *v119;
  char *v120;
  uint64_t v121;
  id v125;
  __int128 v127;
  NSUInteger v128;
  void *v129[2];
  int v130;
  char v131;
  std::string v132;
  __int128 v133;
  uint64_t v134;
  void *v135;
  char *v136;
  char *v137;
  void *v138;
  char *v139;
  char *v140;
  _BYTE v141[32];
  __int16 v142;
  int v143;
  __int16 v144;
  int v145;
  __int16 v146;
  uint64_t v147;
  __int16 v148;
  int v149;
  __int16 v150;
  unsigned int v151;
  __int16 v152;
  int v153;
  __int16 v154;
  int v155;
  __int16 v156;
  int v157;
  _BYTE __p[96];
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[32];
  uint64_t v163;
  _BYTE v164[19];
  _BYTE buf[12];
  __int16 v166;
  NSUInteger v167;
  __int16 v168;
  _BYTE v169[10];
  int v170;
  __int16 v171;
  int v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  int v176;
  __int16 v177;
  unsigned int v178;
  __int16 v179;
  int v180;
  __int16 v181;
  int v182;
  __int16 v183;
  int v184;

  length = a4.length;
  location = a4.location;
  v12 = &qword_1022A0000;
  if (qword_1022A0040 != -1)
    dispatch_once(&qword_1022A0040, &stru_10214A310);
  v13 = qword_1022A0048;
  if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    *(_QWORD *)&buf[4] = length;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "AlsWifi, rx, %{public}lu", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0040 != -1)
      dispatch_once(&qword_1022A0040, &stru_10214A310);
    *(_DWORD *)__p = 134349056;
    *(_QWORD *)&__p[4] = length;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0048, 2, "AlsWifi, rx, %{public}lu", __p, 12);
    v120 = (char *)v119;
    sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]", "%s\n", v119);
    if (v120 != buf)
      free(v120);
  }
  if (length)
  {
    v138 = 0;
    v139 = 0;
    v140 = 0;
    v135 = 0;
    v136 = 0;
    v137 = 0;
    v128 = location + length;
    if (location < location + length)
    {
      __asm { FMOV            V0.2D, #-1.0 }
      v127 = _Q0;
      v125 = a3;
      do
      {
        v19 = objc_msgSend(a3, "objectAtIndex:", location);
        sub_1001A486C((const __CFString *)objc_msgSend(v19, "macID"), (uint64_t)buf);
        v134 = sub_1000CC740((uint64_t)buf);
        if (SHIBYTE(v168) < 0)
          operator delete(*(void **)buf);
        if (!objc_msgSend(v19, "hasLocation")
          || (objc_msgSend(objc_msgSend(v19, "location"), "accuracy") & 0x80000000) != 0)
        {
          v21 = v134;
          v133 = 0uLL;
          v129[0] = 0;
          v129[1] = 0;
          v130 = 0;
          memset(v141, 0, 25);
          *(_QWORD *)&v164[3] = -1;
          *(_QWORD *)&v164[11] = -1;
          Current = CFAbsoluteTimeGetCurrent();
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask"))
            v23 = objc_msgSend(objc_msgSend(v19, "location"), "infoMask");
          else
            v23 = 1;
          if (v12[8] != -1)
            dispatch_once(&qword_1022A0040, &stru_10214A310);
          v24 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEFAULT))
          {
            sub_1000C2254(&v134, (std::string *)__p);
            v25 = __p[23] >= 0 ? __p : *(_BYTE **)__p;
            v26 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            *(_DWORD *)buf = 136381443;
            *(_QWORD *)&buf[4] = v25;
            v166 = 2050;
            v167 = location;
            v168 = 1026;
            *(_DWORD *)v169 = v26;
            *(_WORD *)&v169[4] = 1026;
            *(_DWORD *)&v169[6] = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AlsWifi, unknown, %{private}s, %{public}lu, hasInfoMask, %{public}d, infoMask, 0x%{public}x", buf, 0x22u);
            if ((__p[23] & 0x80000000) != 0)
              operator delete(*(void **)__p);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (v12[8] != -1)
              dispatch_once(&qword_1022A0040, &stru_10214A310);
            v96 = qword_1022A0048;
            sub_1000C2254(&v134, &v132);
            if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v97 = &v132;
            else
              v97 = (std::string *)v132.__r_.__value_.__r.__words[0];
            v98 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            *(_DWORD *)__p = 136381443;
            *(_QWORD *)&__p[4] = v97;
            *(_WORD *)&__p[12] = 2050;
            *(_QWORD *)&__p[14] = location;
            *(_WORD *)&__p[22] = 1026;
            *(_DWORD *)&__p[24] = v98;
            *(_WORD *)&__p[28] = 1026;
            *(_DWORD *)&__p[30] = v23;
            LODWORD(v121) = 34;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v96, 0, "AlsWifi, unknown, %{private}s, %{public}lu, hasInfoMask, %{public}d, infoMask, 0x%{public}x", __p, v121);
            v100 = v99;
            if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v132.__r_.__value_.__l.__data_);
            sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]", "%s\n", v100);
            if (v100 != buf)
              free(v100);
          }
          v27 = v136;
          if (v136 >= v137)
          {
            v31 = 0xD37A6F4DE9BD37A7 * ((v136 - (_BYTE *)v135) >> 3);
            v32 = v31 + 1;
            if (v31 + 1 > 0x1642C8590B21642)
              sub_100259694();
            if (0xA6F4DE9BD37A6F4ELL * ((v137 - (_BYTE *)v135) >> 3) > v32)
              v32 = 0xA6F4DE9BD37A6F4ELL * ((v137 - (_BYTE *)v135) >> 3);
            if (0xD37A6F4DE9BD37A7 * ((v137 - (_BYTE *)v135) >> 3) >= 0xB21642C8590B21)
              v33 = 0x1642C8590B21642;
            else
              v33 = v32;
            if (v33)
              v34 = (char *)sub_10055ADA8((uint64_t)&v137, v33);
            else
              v34 = 0;
            v60 = &v34[184 * v31];
            *(_DWORD *)v60 = 0xFFFF;
            *(_OWORD *)(v60 + 4) = v133;
            *(_OWORD *)(v60 + 20) = xmmword_101BB8E10;
            *(_OWORD *)(v60 + 36) = v127;
            *(_OWORD *)(v60 + 52) = v127;
            *(_QWORD *)(v60 + 68) = 0xBFF0000000000000;
            *(CFAbsoluteTime *)(v60 + 76) = Current;
            *((_DWORD *)v60 + 21) = 0;
            *((_QWORD *)v60 + 11) = 0xBFF0000000000000;
            *((_OWORD *)v60 + 6) = *(_OWORD *)v129;
            *((_DWORD *)v60 + 28) = v130;
            *(_QWORD *)(v60 + 116) = 0xBFF0000000000000;
            *((_DWORD *)v60 + 31) = 0x7FFFFFFF;
            v61 = *(_OWORD *)&v141[9];
            *((_OWORD *)v60 + 8) = *(_OWORD *)v141;
            *(_OWORD *)(v60 + 137) = v61;
            v62 = *(_OWORD *)v164;
            *((_DWORD *)v60 + 42) = *(_DWORD *)&v164[15];
            *((_DWORD *)v60 + 43) = v23;
            *(_OWORD *)(v60 + 153) = v62;
            *((_QWORD *)v60 + 22) = v21;
            v64 = (char *)v135;
            v63 = v136;
            v65 = v60;
            if (v136 != v135)
            {
              do
              {
                v66 = *(_OWORD *)(v63 - 184);
                v67 = *(_OWORD *)(v63 - 168);
                v68 = *(_OWORD *)(v63 - 152);
                *(_OWORD *)(v65 - 136) = *(_OWORD *)(v63 - 136);
                *(_OWORD *)(v65 - 152) = v68;
                *(_OWORD *)(v65 - 168) = v67;
                *(_OWORD *)(v65 - 184) = v66;
                v69 = *(_OWORD *)(v63 - 120);
                v70 = *(_OWORD *)(v63 - 104);
                v71 = *(_OWORD *)(v63 - 88);
                *(_OWORD *)(v65 - 72) = *(_OWORD *)(v63 - 72);
                *(_OWORD *)(v65 - 88) = v71;
                *(_OWORD *)(v65 - 104) = v70;
                *(_OWORD *)(v65 - 120) = v69;
                v72 = *(_OWORD *)(v63 - 56);
                v73 = *(_OWORD *)(v63 - 40);
                v74 = *(_OWORD *)(v63 - 24);
                *((_QWORD *)v65 - 1) = *((_QWORD *)v63 - 1);
                *(_OWORD *)(v65 - 24) = v74;
                *(_OWORD *)(v65 - 40) = v73;
                *(_OWORD *)(v65 - 56) = v72;
                v65 -= 184;
                v63 -= 184;
              }
              while (v63 != v64);
              v63 = v64;
            }
            v30 = v60 + 184;
            v135 = v65;
            v136 = v60 + 184;
            v137 = &v34[184 * v33];
            if (v63)
              operator delete(v63);
          }
          else
          {
            *(_DWORD *)v136 = 0xFFFF;
            *(_OWORD *)(v27 + 4) = v133;
            *(_OWORD *)(v27 + 20) = xmmword_101BB8E10;
            *(_OWORD *)(v27 + 36) = v127;
            *(_OWORD *)(v27 + 52) = v127;
            *(_QWORD *)(v27 + 68) = 0xBFF0000000000000;
            *(CFAbsoluteTime *)(v27 + 76) = Current;
            *((_DWORD *)v27 + 21) = 0;
            *((_QWORD *)v27 + 11) = 0xBFF0000000000000;
            *((_OWORD *)v27 + 6) = *(_OWORD *)v129;
            *((_DWORD *)v27 + 28) = v130;
            *(_QWORD *)(v27 + 116) = 0xBFF0000000000000;
            *((_DWORD *)v27 + 31) = 0x7FFFFFFF;
            v28 = *(_OWORD *)v141;
            *(_OWORD *)(v27 + 137) = *(_OWORD *)&v141[9];
            *((_OWORD *)v27 + 8) = v28;
            v29 = *(_OWORD *)v164;
            *((_DWORD *)v27 + 42) = *(_DWORD *)&v164[15];
            *((_DWORD *)v27 + 43) = v23;
            *(_OWORD *)(v27 + 153) = v29;
            v30 = v27 + 184;
            *((_QWORD *)v27 + 22) = v21;
          }
          v136 = v30;
        }
        else
        {
          *(_QWORD *)&__p[4] = 0;
          *(_QWORD *)&__p[12] = 0;
          *(_OWORD *)&__p[36] = v127;
          *(_OWORD *)&__p[52] = v127;
          *(_OWORD *)&__p[68] = v127;
          *(_DWORD *)__p = 0xFFFF;
          *(_DWORD *)&__p[84] = 0;
          *(_QWORD *)&__p[88] = 0xBFF0000000000000;
          v159 = 0uLL;
          LODWORD(v160) = 0;
          *(_QWORD *)((char *)&v160 + 4) = 0xBFF0000000000000;
          *(_QWORD *)v162 = 0;
          v161 = 0uLL;
          v162[8] = 0;
          *(_QWORD *)&v162[12] = -1;
          *(_QWORD *)&v162[20] = -1;
          HIDWORD(v160) = 0x7FFFFFFF;
          *(_DWORD *)&v162[28] = 0;
          v163 = v134;
          *(_OWORD *)&__p[20] = xmmword_101BB8E10;
          if ((int)objc_msgSend(objc_msgSend(v19, "location"), "accuracy") < 1000000)
            v20 = (double)(int)objc_msgSend(objc_msgSend(v19, "location"), "accuracy");
          else
            v20 = (double)(int)objc_msgSend(objc_msgSend(v19, "location"), "accuracy") / 1000000.0;
          *(double *)&__p[20] = v20;
          *(double *)&__p[76] = a5;
          *(double *)&__p[4] = (double)(uint64_t)objc_msgSend(objc_msgSend(v19, "location"), "latitude") / 100000000.0;
          *(double *)&__p[12] = (double)(uint64_t)objc_msgSend(objc_msgSend(v19, "location"), "longitude") / 100000000.0;
          DWORD1(v161) = 1;
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasAltitude")
            && objc_msgSend(objc_msgSend(v19, "location"), "hasVerticalAccuracy"))
          {
            *(double *)&__p[28] = (double)(int)objc_msgSend(objc_msgSend(v19, "location"), "altitude") / 100.0;
            *(double *)&__p[36] = (double)(int)objc_msgSend(objc_msgSend(v19, "location"), "verticalAccuracy") / 100.0;
          }
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasConfidence"))
            v35 = objc_msgSend(objc_msgSend(v19, "location"), "confidence");
          else
            v35 = 50;
          *(_DWORD *)&__p[84] = v35;
          if (objc_msgSend(v19, "hasChannel"))
            *(_DWORD *)&v162[16] = objc_msgSend(v19, "channel");
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasScore"))
            *(_DWORD *)&v162[12] = objc_msgSend(objc_msgSend(v19, "location"), "score");
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasReach"))
            *(_DWORD *)&v162[20] = objc_msgSend(objc_msgSend(v19, "location"), "reach");
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask"))
            *(_DWORD *)&v162[28] = objc_msgSend(objc_msgSend(v19, "location"), "infoMask");
          if (objc_msgSend(v19, "hasNumZaxisHarvestTraces"))
            *(_DWORD *)&v162[24] = objc_msgSend(v19, "numZaxisHarvestTraces");
          if (v12[8] != -1)
            dispatch_once(&qword_1022A0040, &stru_10214A310);
          v36 = qword_1022A0048;
          if (os_log_type_enabled((os_log_t)qword_1022A0048, OS_LOG_TYPE_DEBUG))
          {
            sub_1000C2254(&v134, (std::string *)v141);
            if (v141[23] >= 0)
              v37 = v141;
            else
              v37 = *(_BYTE **)v141;
            sub_100B61B98((uint64_t)__p, &v132);
            if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v38 = &v132;
            else
              v38 = (std::string *)v132.__r_.__value_.__r.__words[0];
            v39 = *(_DWORD *)&v162[12];
            v40 = *(_DWORD *)&v162[16];
            v41 = *(_QWORD *)&__p[28];
            v42 = *(_DWORD *)&v162[20];
            v43 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            *(_DWORD *)buf = 136383235;
            *(_QWORD *)&buf[4] = v37;
            v166 = 2050;
            v167 = location;
            v168 = 2081;
            *(_QWORD *)v169 = v38;
            *(_WORD *)&v169[8] = 1026;
            v170 = v39;
            v171 = 1026;
            v172 = v40;
            v173 = 2050;
            v174 = v41;
            v175 = 1026;
            v176 = v42;
            v177 = 1026;
            v178 = v43;
            v179 = 1026;
            v180 = *(_DWORD *)&v162[28];
            v181 = 1026;
            v182 = *(_DWORD *)&v162[24];
            v183 = 1026;
            v184 = a6;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "AlsWifi, valid, location, %{private}s, %{public}lu, %{private}s, score, %{public}d, channel, %{public}d, alt, %{public}.2lf, reach, %{public}d, hasInfoMask, %{public}d, infoMask, 0x%{public}x, numHarvestTraces, %{public}d, type, %{public}d", buf, 0x54u);
            if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v132.__r_.__value_.__l.__data_);
            a3 = v125;
            v12 = &qword_1022A0000;
            if ((v141[23] & 0x80000000) != 0)
              operator delete(*(void **)v141);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (v12[8] != -1)
              dispatch_once(&qword_1022A0040, &stru_10214A310);
            v101 = qword_1022A0048;
            sub_1000C2254(&v134, &v132);
            if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v102 = &v132;
            else
              v102 = (std::string *)v132.__r_.__value_.__r.__words[0];
            sub_100B61B98((uint64_t)__p, v129);
            if (v131 >= 0)
              v103 = v129;
            else
              v103 = (void **)v129[0];
            v104 = *(_DWORD *)&v162[12];
            v105 = *(_DWORD *)&v162[16];
            v106 = *(_QWORD *)&__p[28];
            v107 = *(_DWORD *)&v162[20];
            v108 = objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask");
            *(_DWORD *)v141 = 136383235;
            *(_QWORD *)&v141[4] = v102;
            *(_WORD *)&v141[12] = 2050;
            *(_QWORD *)&v141[14] = location;
            *(_WORD *)&v141[22] = 2081;
            *(_QWORD *)&v141[24] = v103;
            v142 = 1026;
            v143 = v104;
            v144 = 1026;
            v145 = v105;
            v146 = 2050;
            v147 = v106;
            v148 = 1026;
            v149 = v107;
            v150 = 1026;
            v151 = v108;
            v152 = 1026;
            v153 = *(_DWORD *)&v162[28];
            v154 = 1026;
            v155 = *(_DWORD *)&v162[24];
            v156 = 1026;
            v157 = a6;
            LODWORD(v121) = 84;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v101, 2, "AlsWifi, valid, location, %{private}s, %{public}lu, %{private}s, score, %{public}d, channel, %{public}d, alt, %{public}.2lf, reach, %{public}d, hasInfoMask, %{public}d, infoMask, 0x%{public}x, numHarvestTraces, %{public}d, type, %{public}d", v141, v121);
            v110 = v109;
            if (v131 < 0)
              operator delete(v129[0]);
            a3 = v125;
            v12 = &qword_1022A0000;
            if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v132.__r_.__value_.__l.__data_);
            sub_100512490("Generic", 1, 0, 2, "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]", "%s\n", v110);
            if (v110 != buf)
              free(v110);
          }
          v44 = v139;
          if (v139 >= v140)
          {
            v55 = v138;
            v56 = 0xD37A6F4DE9BD37A7 * ((v139 - (_BYTE *)v138) >> 3);
            v57 = v56 + 1;
            if (v56 + 1 > 0x1642C8590B21642)
              sub_100259694();
            if (0xA6F4DE9BD37A6F4ELL * ((v140 - (_BYTE *)v138) >> 3) > v57)
              v57 = 0xA6F4DE9BD37A6F4ELL * ((v140 - (_BYTE *)v138) >> 3);
            if (0xD37A6F4DE9BD37A7 * ((v140 - (_BYTE *)v138) >> 3) >= 0xB21642C8590B21)
              v58 = 0x1642C8590B21642;
            else
              v58 = v57;
            if (v58)
            {
              v59 = (char *)sub_10055ADA8((uint64_t)&v140, v58);
              v55 = v138;
              v44 = v139;
            }
            else
            {
              v59 = 0;
            }
            v75 = &v59[184 * v56];
            v76 = *(_OWORD *)__p;
            v77 = *(_OWORD *)&__p[16];
            v78 = *(_OWORD *)&__p[48];
            *((_OWORD *)v75 + 2) = *(_OWORD *)&__p[32];
            *((_OWORD *)v75 + 3) = v78;
            *(_OWORD *)v75 = v76;
            *((_OWORD *)v75 + 1) = v77;
            v79 = *(_OWORD *)&__p[64];
            v80 = *(_OWORD *)&__p[80];
            v81 = v160;
            *((_OWORD *)v75 + 6) = v159;
            *((_OWORD *)v75 + 7) = v81;
            *((_OWORD *)v75 + 4) = v79;
            *((_OWORD *)v75 + 5) = v80;
            v82 = v161;
            v83 = *(_OWORD *)v162;
            v84 = *(_OWORD *)&v162[16];
            *((_QWORD *)v75 + 22) = v163;
            *((_OWORD *)v75 + 9) = v83;
            *((_OWORD *)v75 + 10) = v84;
            *((_OWORD *)v75 + 8) = v82;
            if (v44 == v55)
            {
              v95 = &v59[184 * v56];
            }
            else
            {
              v85 = &v59[184 * v56];
              do
              {
                v86 = *(_OWORD *)((char *)v44 - 184);
                v87 = *(_OWORD *)((char *)v44 - 168);
                v88 = *(_OWORD *)((char *)v44 - 152);
                *(_OWORD *)(v85 - 136) = *(_OWORD *)((char *)v44 - 136);
                *(_OWORD *)(v85 - 152) = v88;
                *(_OWORD *)(v85 - 168) = v87;
                *(_OWORD *)(v85 - 184) = v86;
                v89 = *(_OWORD *)((char *)v44 - 120);
                v90 = *(_OWORD *)((char *)v44 - 104);
                v91 = *(_OWORD *)((char *)v44 - 88);
                *(_OWORD *)(v85 - 72) = *(_OWORD *)((char *)v44 - 72);
                *(_OWORD *)(v85 - 88) = v91;
                *(_OWORD *)(v85 - 104) = v90;
                *(_OWORD *)(v85 - 120) = v89;
                v92 = *(_OWORD *)((char *)v44 - 56);
                v93 = *(_OWORD *)((char *)v44 - 40);
                v94 = *(_OWORD *)((char *)v44 - 24);
                v95 = v85 - 184;
                *((_QWORD *)v85 - 1) = *((_QWORD *)v44 - 1);
                *(_OWORD *)(v85 - 24) = v94;
                *(_OWORD *)(v85 - 40) = v93;
                *(_OWORD *)(v85 - 56) = v92;
                v44 = (_OWORD *)((char *)v44 - 184);
                v85 -= 184;
              }
              while (v44 != v55);
            }
            v54 = v75 + 184;
            v138 = v95;
            v139 = v75 + 184;
            v140 = &v59[184 * v58];
            if (v55)
              operator delete(v55);
          }
          else
          {
            v45 = *(_OWORD *)__p;
            v46 = *(_OWORD *)&__p[16];
            v47 = *(_OWORD *)&__p[48];
            *((_OWORD *)v139 + 2) = *(_OWORD *)&__p[32];
            v44[3] = v47;
            *v44 = v45;
            v44[1] = v46;
            v48 = *(_OWORD *)&__p[64];
            v49 = *(_OWORD *)&__p[80];
            v50 = v160;
            v44[6] = v159;
            v44[7] = v50;
            v44[4] = v48;
            v44[5] = v49;
            v51 = v161;
            v52 = *(_OWORD *)v162;
            v53 = *(_OWORD *)&v162[16];
            *((_QWORD *)v44 + 22) = v163;
            v44[9] = v52;
            v44[10] = v53;
            v44[8] = v51;
            v54 = (char *)v44 + 184;
          }
          v139 = v54;
        }
        ++location;
      }
      while (location != v128);
    }
    v111 = *(int **)a8;
    v112 = (int *)*((_QWORD *)a8 + 1);
    if (*(int **)a8 == v112)
    {
      v117 = 0;
    }
    else
    {
      v113 = 0;
      v114 = 0;
      do
      {
        while (1)
        {
          while (1)
          {
            v116 = *v111++;
            v115 = v116;
            if (v116 != 1)
              break;
            v113 = 1;
            if (v111 == v112)
            {
              if ((v114 & 1) != 0)
                v117 = 3;
              else
                v117 = 1;
              goto LABEL_140;
            }
          }
          if (v115 != 2)
            break;
          v114 = 1;
          if (v111 == v112)
          {
            if ((v113 & 1) != 0)
              v117 = 3;
            else
              v117 = 2;
            goto LABEL_140;
          }
        }
      }
      while (v111 != v112);
      if ((v114 & 1) != 0)
        v117 = 3;
      else
        v117 = 1;
      if ((v114 & 1) != 0)
        v118 = 2;
      else
        v118 = 0;
      if ((v113 & 1) == 0)
        v117 = v118;
    }
LABEL_140:
    sub_10066878C((uint64_t)self->fRequester, (uint64_t)&v138, (uint64_t)&v135, a6, a7, v117);
    if (v135)
    {
      v136 = (char *)v135;
      operator delete(v135);
    }
    if (v138)
    {
      v139 = (char *)v138;
      operator delete(v138);
    }
  }
}

- (void)addRequesterWithOutstandingRequest:(id)a3
{
  -[NSMutableSet addObject:](self->fRequestersWithOutstandingRequests, "addObject:", a3);
}

@end
