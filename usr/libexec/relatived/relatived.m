void sub_100003CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003CE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "eventMask") != (id)1)
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024818);
    v4 = (void *)qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
    {
      v5 = v4;
      v7 = 134349056;
      v8 = objc_msgSend(v3, "eventMask");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[RMUserInteractionMonitorAttentionAwareness] event: %{public}llu", (uint8_t *)&v7, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "sendUserInteractionUpdate");

  }
}

void sub_100003FE0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

void sub_10000401C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

void sub_10000402C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

void sub_10000403C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

void sub_10000404C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

void sub_10000405C(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

void sub_100004100(id a1)
{
  RMAudioListenerPoseEngine *v1;
  void *v2;

  v1 = objc_alloc_init(RMAudioListenerPoseEngine);
  v2 = (void *)qword_10002C8F0;
  qword_10002C8F0 = (uint64_t)v1;

}

void sub_1000045C0(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

void sub_1000045D0(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

void sub_1000045E0(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

void sub_1000045F0(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

void sub_100004600(uint64_t a1, void *a2)
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

uint64_t sub_100004750(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004760(uint64_t a1)
{

}

void sub_100004768(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  RMAudioListenerPoseEngineClientEntry *v6;
  const char *v7;
  RMAudioListenerPoseEngineClientEntry *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  int clientMode;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _DWORD v28[2];
  __int16 v29;
  int v30;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(id *)(v2 + 32);
    if (v3)
    {
      ++v3[12];

    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", kCMMediaSessionClientMode));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", kCMMediaSessionPredictionIntervalMicroseconds));
  v6 = objc_opt_new(RMAudioListenerPoseEngineClientEntry);
  v8 = v6;
  if (v6)
    objc_setProperty_nonatomic_copy(v6, v7, *(id *)(a1 + 56), 8);
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0)
    v10 = (int)objc_msgSend(v4, "intValue");
  else
    v10 = 0;
  if (v8)
    v8->_clientMode = v10;
  v11 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
    v12 = (uint64_t)objc_msgSend(v5, "unsignedLongLongValue");
  else
    v12 = -1;
  if (v8)
    v8->_predictionIntervalMicroseconds = v12;
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    v14 = *(void **)(v13 + 56);
  else
    v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("TempestClientModeOverride")));

  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v16 ? *(void **)(v16 + 56) : 0;
    v18 = (unint64_t)objc_msgSend(v17, "integerForKey:", CFSTR("TempestClientModeOverride"));
    if ((v18 & 0x8000000000000000) == 0)
    {
      v19 = v18;
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v20 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        if (v8)
          clientMode = v8->_clientMode;
        else
          clientMode = 0;
        v28[0] = 67240448;
        v28[1] = clientMode;
        v29 = 1026;
        v30 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Overriding requested client mode %{public}d with %{public}d", (uint8_t *)v28, 0xEu);
      }
      if (v8)
        v8->_clientMode = v19;
    }
  }
  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    v23 = *(void **)(v22 + 24);
  else
    v23 = 0;
  objc_msgSend(v23, "setObject:forKey:", v8, *(_QWORD *)(a1 + 48));
  if (sub_100004A14(*(_QWORD *)(a1 + 32)))
  {
    v24 = sub_100004B38(*(dispatch_queue_t **)(a1 + 32), *(_BYTE *)(a1 + 72));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      sub_1000050A0(*(_QWORD *)(a1 + 32));
  }

}

uint64_t sub_100004A14(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(id *)(v1 + 24);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6), (_QWORD)v9));
          if (v7 && v7[2])
          {

            v1 = 1;
            goto LABEL_13;
          }

          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
    v1 = 0;
LABEL_13:

  }
  return v1;
}

NSObject *sub_100004B38(dispatch_queue_t *a1, char a2)
{
  NSObject *v2;
  id *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSNumber *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  objc_class *v23;
  unsigned __int8 v24;
  NSObject *v25;
  dispatch_source_t v26;
  void *v27;
  NSObject *v28;
  _QWORD v30[5];
  uint8_t v31[16];
  _QWORD v32[6];
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;

  v2 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    v4 = v2[4].isa;
    v5 = sub_100005598((uint64_t)v2);
    if (v4)
    {
      v6 = v4[1];
      if (v6)
      {
        v7 = v4[13];

        v4[13] = (id)v5;
        if (v7 == (id)v5 && (a2 & 1) == 0)
        {
          if (qword_10002C4B0 != -1)
            dispatch_once(&qword_10002C4B0, &stru_1000249E8);
          v8 = qword_10002C4B8;
          if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Keeping existing CMMediaSession", buf, 2u);
          }
          v2 = 0;
LABEL_44:

          return v2;
        }
      }
      else
      {
        v4[13] = (id)v5;
      }
    }
    sub_1000054F0((uint64_t)v2);
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v9 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restarting CMMediaSession", buf, 2u);
    }
    v10 = objc_opt_new(NSMutableDictionary);
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_10000584C((uint64_t)v2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, kCMMediaSessionClientMode);

    if (v5 != -1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, kCMMediaSessionPredictionIntervalMicroseconds);

    }
    v14 = objc_msgSend(objc_alloc((Class)CMMediaSession), "_initWithOptions:", v10);
    sub_10000401C((uint64_t)v4, v14);

    if (-[objc_class BOOLForKey:](v2[7].isa, "BOOLForKey:", CFSTR("TempestLogMsl")))
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v15 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Logging MSL", buf, 2u);
      }
      v16 = sub_1000146FC();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/Tempest/MSL"), v17));

      if (v4)
        v19 = v4[1];
      else
        v19 = 0;
      objc_msgSend(v19, "_enableLoggingForReplayWithFilenamePrefix:filePath:", CFSTR("tempest"), v18);

    }
    else
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v20 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "MSL logging disabled", buf, 2u);
      }
    }
    *(_QWORD *)buf = 0;
    v34 = buf;
    v35 = 0x2020000000;
    v36 = 2;
    if (v4)
      v21 = v4[1];
    else
      v21 = 0;
    v22 = v21;
    v23 = v2[5].isa;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000058D4;
    v32[3] = &unk_1000248D8;
    v32[4] = v2;
    v32[5] = buf;
    v24 = objc_msgSend(v22, "_startPoseUpdatesToQueue:andHandler:", v23, v32);

    if ((v24 & 1) != 0)
    {
      sub_100005C84((uint64_t)v2);
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v25 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Starting timer to emulate media session status callback", v31, 2u);
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000060FC;
      v30[3] = &unk_100024900;
      v30[4] = v2;
      v26 = sub_10000635C(v2, v30, 2.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      sub_10000402C((uint64_t)v4, v27);

      +[RMAudioAccessoryManager setTempestActive:](RMAudioAccessoryManager, "setTempestActive:", 1);
      v2 = 0;
    }
    else
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v28 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to start CMMediaSession", v31, 2u);
      }
      v2 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kRMErrorDomain"), 3, 0));
    }
    _Block_object_dispose(buf, 8);

    goto LABEL_44;
  }
  return v2;
}

void sub_100005088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000050A0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  _DWORD v7[2];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = sub_10000584C(a1);
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v3 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67240192;
      v7[1] = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating CMMediaSession client mode to %{public}d", (uint8_t *)v7, 8u);
    }
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v5 = (void *)v4[1];
    else
      v5 = 0;
    v6 = v4;
    objc_msgSend(v5, "_updateClientMode:", v2);

  }
}

void sub_100005238(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  double v20;
  dispatch_time_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40)));
  if (v4)
    v5 = v4[3];
  else
    v5 = 0;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 24);
  else
    v7 = 0;
  objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v8 = sub_100004A14(*(_QWORD *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    sub_1000050A0(v9);
  }
  else
  {
    if (v9)
      v10 = *(void **)(v9 + 32);
    else
      v10 = 0;
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 32);
    if (v12 && (v13 = *(id *)(v12 + 32)) != 0)
    {
      v14 = v13[12];

    }
    else
    {
      v14 = 0;
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000053D8;
    v24[3] = &unk_100024888;
    v15 = (char *)v11;
    v16 = *(_QWORD *)(a1 + 32);
    v25 = v15;
    v26 = v16;
    v27 = v14;
    v17 = objc_retainBlock(v24);
    v18 = v17;
    if (!v15)
      goto LABEL_21;
    v19 = 88;
    if (!v5)
      v19 = 80;
    v20 = *(double *)&v15[v19];
    if (v20 > 0.0)
    {
      v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
      v22 = *(_QWORD *)(a1 + 32);
      if (v22)
        v23 = *(NSObject **)(v22 + 40);
      else
        v23 = 0;
      dispatch_after(v21, v23, v18);
    }
    else
    {
LABEL_21:
      ((void (*)(_QWORD *))v17[2])(v17);
    }

  }
}

void sub_1000053D8(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = a1[4];
  if (v2 && *(_QWORD *)(v2 + 96) > a1[6])
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v3 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Not stopping CMMediaSession because new session is using it", buf, 2u);
    }
  }
  else
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v4 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping CMMediaSession", v5, 2u);
    }
    sub_1000054F0(a1[5]);
  }
}

void sub_1000054F0(uint64_t a1)
{
  id *v2;
  id *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = (id *)*(id *)(a1 + 32);
    if (v2)
    {
      if (v2[1])
      {
        v3 = v2;
        sub_1000063F8(a1);
        objc_msgSend(v3[1], "_stop");
        objc_msgSend(v3[1], "_disableLoggingForReplay");
        sub_10000401C((uint64_t)v3, 0);
        +[RMAudioAccessoryManager setTempestActive:](RMAudioAccessoryManager, "setTempestActive:", 0);
        v2 = v3;
      }
    }

  }
}

uint64_t sub_100005598(uint64_t result)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  char v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  BOOL v14;
  char v15;
  id v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 40));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v2 = *(id *)(v1 + 24);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = 0;
      v7 = *(_QWORD *)v19;
      v8 = -1;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v2);
          v10 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9), (_QWORD)v18));
          if (v10)
            v11 = v10[2];
          else
            v11 = 0;
          if (v8 >= v11)
            v12 = v11;
          else
            v12 = v8;
          v13 = v11 == 0;
          v14 = v11 != 0;
          v15 = v13;
          v5 |= v15;
          v6 |= v14;
          if (!v13)
            v8 = v12;

          v9 = (char *)v9 + 1;
        }
        while (v4 != v9);
        v16 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v4 = v16;
      }
      while (v16);

      if ((v6 & 1) != 0)
        v17 = v8;
      else
        v17 = 0;
      if ((v5 & 1) != 0)
        return v17;
      else
        return v8;
    }
    else
    {

      return -1;
    }
  }
  return result;
}

uint64_t sub_100005708(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 24);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), (_QWORD)v12));
        if (v9 && v9[2] && v9[3] == a2)
        {

          v10 = 1;
          goto LABEL_14;
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_14:

  return v10;
}

uint64_t sub_10000584C(uint64_t a1)
{
  uint64_t v2;

  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  v2 = 0;
  if ((sub_100005708(a1, 0) & 1) == 0)
  {
    v2 = 4;
    if ((sub_100005708(a1, 4) & 1) == 0)
    {
      v2 = 2;
      if ((sub_100005708(a1, 2) & 1) == 0)
      {
        v2 = 3;
        if (!sub_100005708(a1, 3))
          return 1;
      }
    }
  }
  return v2;
}

void sub_1000058D4(uint64_t a1, void *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a3 == 114)
    v5 = 4;
  else
    v5 = 2;
  sub_10000595C(*(_QWORD *)(a1 + 32), a2, v5);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 != v5)
  {
    if (a3 == 114)
    {
      sub_100005B80(*(_QWORD *)(a1 + 32));
    }
    else if (v6 == 4)
    {
      sub_100005C04(*(_QWORD *)(a1 + 32));
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }
}

void sub_10000595C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[9];
  _BYTE v34[128];

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));
    objc_msgSend(v6, "quaternion");
    v33[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));
    objc_msgSend(v8, "quaternion");
    v33[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));
    objc_msgSend(v10, "quaternion");
    v33[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attitude"));
    objc_msgSend(v12, "quaternion");
    v33[3] = v13;
    objc_msgSend(v5, "timestamp");
    v33[4] = v14;
    v33[5] = a3;
    objc_msgSend(v5, "consumedAuxTimestamp");
    v33[6] = v15;
    objc_msgSend(v5, "receivedAuxTimestamp");
    v33[7] = v16;
    v28 = v5;
    objc_msgSend(v5, "machAbsTimestamp");
    v33[8] = v17;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = *(id *)(a1 + 24);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v22)));
          v24 = (void *)v23;
          if (v23 && *(_QWORD *)(v23 + 16))
          {
            v25 = *(void (***)(_QWORD, _QWORD))(v23 + 8);
            v26 = v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v33, 72));
            ((void (**)(_QWORD, void *))v25)[2](v26, v27);

          }
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v20);
    }

    v5 = v28;
  }

}

void sub_100005B80(uint64_t a1)
{
  int v2;
  _QWORD block[5];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = *(_DWORD *)(a1 + 12);
    if (!v2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007214;
      block[3] = &unk_100024900;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v2 = *(_DWORD *)(a1 + 12);
    }
    *(_DWORD *)(a1 + 12) = v2 + 1;
  }
}

void sub_100005C04(uint64_t a1)
{
  int v2;
  _QWORD block[5];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v2 = *(_DWORD *)(a1 + 12) - 1;
    *(_DWORD *)(a1 + 12) = v2;
    if (!v2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000072F0;
      block[3] = &unk_100024900;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

void sub_100005C84(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  _QWORD *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  dispatch_source_t v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  id buf[2];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(_BYTE *)(a1 + 9))
    {
      v2 = *(id *)(a1 + 32);
      if (*(_BYTE *)(a1 + 8))
      {
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_1000249E8);
        v3 = qword_10002C4B8;
        if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Keeping existing RMFacePoseCaptureSession", (uint8_t *)buf, 2u);
        }
        objc_msgSend((id)a1, "facePoseCaptureSessionDidConfigure:", *(_QWORD *)(a1 + 72));
      }
      else
      {
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_1000249E8);
        v4 = qword_10002C4B8;
        if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting RMFacePoseCaptureSession", (uint8_t *)buf, 2u);
        }
        objc_initWeak(buf, (id)a1);
        v5 = *(id *)(a1 + 72);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10000657C;
        v23[3] = &unk_100024950;
        v23[4] = a1;
        objc_copyWeak(&v24, buf);
        objc_msgSend(v5, "startCaptureSessionWithHandler:", v23);

        *(_BYTE *)(a1 + 8) = 1;
        objc_destroyWeak(&v24);
        objc_destroyWeak(buf);
      }
      ++*(_QWORD *)(a1 + 80);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "externalDisplayService"));
      objc_msgSend(v6, "addObserver:", a1);

      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        *(_QWORD *)(v7 + 72) = 2;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
      objc_msgSend(v8, "addObserver:", a1);

      -[RMAudioListenerPoseEngine externalDisplayDidConnect:]_0((dispatch_queue_t *)a1);
      objc_msgSend(*(id *)(a1 + 64), "startLidAngleUpdates");
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v9 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting timer to control camera pause state", (uint8_t *)buf, 2u);
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000068FC;
      v22[3] = &unk_100024900;
      v22[4] = a1;
      v10 = sub_10000635C((dispatch_source_t)a1, v22, 0.1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      sub_10000403C((uint64_t)v2, v11);

      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v12 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting timer to read lid angle", (uint8_t *)buf, 2u);
      }
      if (v2)
        v2[5] = 0xBFF0000000000000;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000697C;
      v20[3] = &unk_1000248B0;
      v20[4] = a1;
      v13 = v2;
      v21 = v13;
      v14 = sub_10000635C((dispatch_source_t)a1, v20, 0.1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      sub_10000404C((uint64_t)v13, v15);

      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v16 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting timer to read device state", (uint8_t *)buf, 2u);
      }
      if (v2)
      {
        v13[7] = -1;
        v13[8] = -1;
      }
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100006AEC;
      v19[3] = &unk_100024900;
      v19[4] = a1;
      v17 = sub_10000635C((dispatch_source_t)a1, v19, 2.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      sub_10000405C((uint64_t)v13, v18);

    }
  }
}

void sub_1000060E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1000060FC(uint64_t a1)
{
  NSNumber *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v5 = CFSTR("Time");
  v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_10000DC20());
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  sub_1000061B4(*(_QWORD *)(a1 + 32), v4);
}

void sub_1000061B4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  id v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v17 = v3;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Time")));
    objc_msgSend(v16, "doubleValue");
    v22 = v4;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = *(id *)(a1 + 24);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9)));
          v11 = (void *)v10;
          if (v10)
            v12 = *(void (***)(_QWORD, _QWORD))(v10 + 8);
          else
            v12 = 0;
          v13 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v22, 8));
          ((void (**)(_QWORD, void *))v12)[2](v13, v14);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        v7 = v15;
      }
      while (v15);
    }

    v3 = v17;
  }

}

dispatch_source_t sub_10000635C(dispatch_source_t a1, void *a2, double a3)
{
  id v5;
  dispatch_time_t v6;

  v5 = a2;
  if (a1)
  {
    a1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)a1[5].isa);
    if (a1)
    {
      v6 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(a1, v6, (unint64_t)(a3 * 1000000000.0), 0);
      dispatch_source_set_event_handler(a1, v5);
      dispatch_resume(a1);
    }
  }

  return a1;
}

void sub_1000063F8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[6];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(_BYTE *)(a1 + 9))
    {
      v2 = *(id *)(a1 + 32);
      v3 = (uint64_t)v2;
      if (v2)
      {
        v4 = *((_QWORD *)v2 + 3);
        if (v4)
          dispatch_source_cancel(v4);
        sub_10000403C(v3, 0);
        v5 = *(NSObject **)(v3 + 32);
        if (v5)
          dispatch_source_cancel(v5);
        sub_10000404C(v3, 0);
        v6 = *(NSObject **)(v3 + 48);
        if (v6)
          dispatch_source_cancel(v6);
        sub_10000405C(v3, 0);
        v7 = *(id *)(v3 + 16);
        if (v7)
        {
          v8 = v7;
          dispatch_source_cancel(v7);

        }
      }
      else
      {
        sub_10000403C(0, 0);
        sub_10000404C(0, 0);
        sub_10000405C(0, 0);
      }
      sub_10000402C(v3, 0);
      objc_msgSend(*(id *)(a1 + 64), "stopLidAngleUpdates");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BLSBacklight sharedBacklight](BLSBacklight, "sharedBacklight"));
      objc_msgSend(v9, "removeObserver:", a1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1, "externalDisplayService"));
      objc_msgSend(v10, "removeObserver:", a1);

      v11 = *(_QWORD *)(a1 + 80);
      v12 = dispatch_time(0, 2000000000);
      v13 = *(NSObject **)(a1 + 40);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100006CE8;
      v14[3] = &unk_100024978;
      v14[4] = a1;
      v14[5] = v11;
      dispatch_after(v12, v13, v14);
      objc_msgSend(*(id *)(a1 + 72), "setCameraPaused:", 1);

    }
  }
}

void sub_10000657C(uint64_t a1, void *a2, __int128 *a3)
{
  id v5;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;

  v5 = a2;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[5];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006654;
  block[3] = &unk_100024928;
  v7 = v6;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10 = v5;
  v12 = *a3;
  v13 = *((_QWORD *)a3 + 2);
  v8 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
}

void sub_100006654(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  CMTime v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4 = *(CMTime *)(a1 + 48);
  sub_1000066A4((uint64_t)WeakRetained, v2, &v4);

}

void sub_1000066A4(uint64_t a1, void *a2, CMTime *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  CMTime v16;

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (v5 && *(_BYTE *)(a1 + 10))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rm_tracked_faces")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("raw_data")));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pose")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rm_camera_id")));
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v11 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v16.value) = 138543618;
        *(CMTimeValue *)((char *)&v16.value + 4) = (CMTimeValue)v10;
        LOWORD(v16.flags) = 2114;
        *(_QWORD *)((char *)&v16.flags + 2) = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Cam %{public}@] Pose %{public}@", (uint8_t *)&v16, 0x16u);
      }

    }
    v12 = *(_QWORD **)(a1 + 32);
    if (v12)
      v13 = (void *)v12[1];
    else
      v13 = 0;
    v16 = *a3;
    v14 = v13;
    v15 = v12;
    objc_msgSend(v14, "_feedFaceKitData:timestamp:", v5, CMTimeGetSeconds(&v16));

  }
}

void sub_1000068FC(uint64_t a1)
{
  id *v2;
  id **v3;
  id *v4;
  unsigned int v5;
  _QWORD *v6;
  id **v7;

  v2 = *(id **)(a1 + 32);
  if (v2)
  {
    v3 = (id **)v2[4];
    if (v3)
    {
      v7 = v3;
      v2 = v3[1];
    }
    else
    {
      v7 = 0;
      v2 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v4 = v2;
  v5 = objc_msgSend(v4, "isRequestingCameraOn");
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[9];
  objc_msgSend(v6, "setCameraPaused:", v5 ^ 1);

}

void sub_10000697C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  int v11;
  double v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 64);
  else
    v3 = 0;
  objc_msgSend(v3, "lidAngle");
  if (v4 >= 0.0)
  {
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      if (vabdd_f64(v4, *(double *)(v6 + 40)) <= 0.1)
        return;
      *(double *)(v6 + 40) = v4;
    }
    else if (fabs(v4) <= 0.1)
    {
      return;
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (!v7)
      goto LABEL_21;
    if (!*(_BYTE *)(v7 + 10))
      goto LABEL_14;
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v8 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 134349056;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "LidAngle %{public}.2f", (uint8_t *)&v11, 0xCu);
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
LABEL_14:
      v9 = *(id *)(v7 + 32);
      v10 = v9;
      if (v9)
        v9 = (_QWORD *)v9[1];
    }
    else
    {
LABEL_21:
      v10 = 0;
      v9 = 0;
    }
    objc_msgSend(v9, "_feedLidAngle:", v5);

  }
}

void sub_100006AEC(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v4 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v3 = *(id *)(v2 + 32);
  v4 = v3;
  if (!v3 || !*((_QWORD *)v3 + 9))
    goto LABEL_9;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5 || (v6 = *(id *)(v5 + 32)) == 0)
  {

    goto LABEL_7;
  }
  v7 = v6[9];

  if (v7 != 1)
  {
LABEL_7:
    v8 = 1;
    goto LABEL_11;
  }
LABEL_10:
  v8 = 0;
LABEL_11:
  if (MKBGetDeviceLockState(0) - 1 >= 2)
    v9 = v8;
  else
    v9 = 0;
  sub_100006B8C(*(_QWORD *)(a1 + 32), v9);
}

void sub_100006B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  int v14;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v4 = *(_QWORD *)(v4 + 64);
    if (v4 != a2)
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v5 = (void *)qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        if (v6)
          LODWORD(v6) = *(_DWORD *)(v6 + 64);
        *(_DWORD *)buf = 67240448;
        v12 = v6;
        v13 = 1026;
        v14 = a2;
        v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "displayState: %{public}d -> %{public}d", buf, 0xEu);

      }
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        *(_QWORD *)(v8 + 64) = a2;
      v9 = *(NSObject **)(a1 + 40);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000071AC;
      v10[3] = &unk_100024978;
      v10[4] = a1;
      v10[5] = a2;
      dispatch_async(v9, v10);
    }
  }
}

void sub_100006CE8(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_QWORD *)(v2 + 80) > *(_QWORD *)(a1 + 40))
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v3 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Not stopping RMFacePoseCaptureSession because new session is using it", buf, 2u);
    }
  }
  else
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_1000249E8);
    v4 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping RMFacePoseCaptureSession", v8, 2u);
    }
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 72);
    else
      v6 = 0;
    objc_msgSend(v6, "stopCaptureSession");
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      *(_BYTE *)(v7 + 8) = 0;
  }
}

void sub_100006EA4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberOfCameras");
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_1000249E8);
  v3 = (void *)qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    v9[0] = 67240448;
    v9[1] = objc_msgSend(v4, "numberOfCameras");
    v10 = 1026;
    v11 = v2 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Number of cameras: %{public}d, updating CMMediaSession tracking scheme to %{public}d", (uint8_t *)v9, 0xEu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v7 = *(id *)(v6 + 32);
    v8 = v7;
    if (v7)
      v7 = (_QWORD *)v7[1];
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  objc_msgSend(v7, "_updateTrackingScheme:", v2 != 0);

}

void sub_100006FE8(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  unsigned int v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  unsigned int v15;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v4 = *(_QWORD *)(v4 + 56);
    if (v4 != a2)
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_1000249E8);
      v5 = (void *)qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        if (v6)
          LODWORD(v6) = *(_DWORD *)(v6 + 56);
        *(_DWORD *)buf = 67240448;
        v13 = v6;
        v14 = 1026;
        v15 = a2;
        v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "displayCount: %{public}d -> %{public}d", buf, 0xEu);

      }
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        *(_QWORD *)(v8 + 56) = a2;
      v9 = *(NSObject **)(a1 + 40);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000714C;
      v10[3] = &unk_1000249A0;
      v10[4] = a1;
      v11 = a2;
      dispatch_async(v9, v10);
    }
  }
}

void sub_10000714C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(id *)(v2 + 32);
    if (v3)
    {
      v4 = v3;
      v3 = (_QWORD *)v3[1];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  objc_msgSend(v3, "_feedDisplayCount:", *(unsigned int *)(a1 + 40));

}

void sub_1000071AC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(id *)(v2 + 32);
    if (v3)
    {
      v4 = v3;
      v3 = (_QWORD *)v3[1];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  objc_msgSend(v3, "_feedScreenUnlockedEvent:", *(_QWORD *)(a1 + 40) == 1);

}

void sub_100007214(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v5[5];

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[11];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 40);
  else
    v3 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000072A0;
  v5[3] = &unk_100024900;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v4, "startUserInteractionUpdatesToQueue:withHandler:", v3, v5);

}

void sub_1000072A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(id *)(v1 + 32);
    if (v2)
    {
      v3 = v2;
      v2 = (_QWORD *)v2[1];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
    v2 = 0;
  }
  objc_msgSend(v2, "_triggerUserInteractedWithDeviceEvent");

}

id sub_1000072F0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return objc_msgSend(*(id *)(v1 + 88), "stopUserInteractionUpdates");
  else
    return objc_msgSend(0, "stopUserInteractionUpdates");
}

void sub_100007308(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 40);
  else
    v5 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007398;
  v8[3] = &unk_1000248B0;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

void sub_100007398(uint64_t a1)
{
  sub_100006FE8(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "count") + 1);
}

void sub_100007430(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_1000249E8);
  v2 = (void *)qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v4 = *(id *)(v3 + 32);
      v5 = v4;
      if (v4)
        LODWORD(v3) = *((_DWORD *)v4 + 18);
      else
        LODWORD(v3) = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = *(_QWORD *)(a1 + 40);
    v11[0] = 67240448;
    v11[1] = v3;
    v12 = 1026;
    v13 = v6;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "backlightState: %{public}d -> %{public}d", (uint8_t *)v11, 0xEu);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(v8 + 32);
    if (v10)
    {
      v10[9] = v9;

    }
  }
}

void sub_100007600(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

void sub_100007BB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100007BE4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "endpoint"));
  v8 = sub_100015FE8((uint64_t)v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007CC8;
  block[3] = &unk_100024A10;
  v10 = *(id *)(a1 + 40);
  v15 = v6;
  v16 = v10;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

uint64_t sub_100007CC8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100007CDC(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0));

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void sub_100007D98(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    sub_100015F24(a2);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0));

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100007E5C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007E6C(uint64_t a1)
{

}

void sub_100007E74(uint64_t a1, id *a2)
{
  id *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  id v7;

  if (a2)
  {
    v3 = sub_10000A068(a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v7 = (id)v4;
    if (v4)
      v5 = (const __CFString *)v4;
    else
      v5 = CFSTR("Unknown");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1, 0));
    (*(void (**)(uint64_t, const __CFString *))(v6 + 16))(v6, CFSTR("RMSpiListClients"));
  }

}

void sub_100007F18(_QWORD *a1, void *a2)
{
  id *v3;
  id *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    v4 = sub_10000A068(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_msgSend(v5, "isEqualToString:", a1[4]);

    if (v6)
    {
      sub_100015F24((uint64_t)v10);
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
    }
  }
  else
  {
    v7 = a1[5];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0));
    (*(void (**)(uint64_t, const __CFString *, void *))(v7 + 16))(v7, CFSTR("RMSpiDisconnectClient"), v9);

  }
}

void sub_100008050(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "InternalService");
  v2 = (void *)qword_10002C4C8;
  qword_10002C4C8 = (uint64_t)v1;

}

void sub_1000083BC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "receiverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008468;
  block[3] = &unk_100024AD0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, block);

}

_QWORD *sub_100008468(_QWORD *result)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(result[4] + 8));
  if ((v1 & 1) != 0)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[6] + 16))(result[6], result[5]);
  return result;
}

void sub_1000085D0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

id *sub_100008664(id *a1, void *a2)
{
  id v4;
  id *v5;
  SEL v6;
  objc_super v8;

  v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)RMHeadphoneActivityProvider;
    v5 = (id *)objc_msgSendSuper2(&v8, "init");
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      objc_setProperty_atomic(a1, v6, 0, 24);
    }
  }

  return a1;
}

void *sub_1000086E8(void *a1, void *a2)
{
  const char *v3;
  id v4;
  unsigned int v5;
  const char *v6;
  unsigned int v7;
  const char *v8;
  unsigned int v9;
  const char *v10;
  unsigned int v12;

  v4 = a2;
  if (a1)
  {
    v5 = objc_msgSend(objc_getProperty(a1, v3, 24, 1), "unknown");
    if (v5 == objc_msgSend(v4, "unknown")
      && (v7 = objc_msgSend(objc_getProperty(a1, v6, 24, 1), "stationary"),
          v7 == objc_msgSend(v4, "stationary"))
      && (v9 = objc_msgSend(objc_getProperty(a1, v8, 24, 1), "walking"),
          v9 == objc_msgSend(v4, "walking")))
    {
      v12 = objc_msgSend(objc_getProperty(a1, v10, 24, 1), "running");
      a1 = (void *)(v12 ^ objc_msgSend(v4, "running") ^ 1);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void sub_100008898(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  id v23;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (sub_1000086E8(*(void **)(a1 + 32), v5))
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024B90);
      v8 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Suppressing duplicate activity: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v9 = *(void **)(a1 + 32);
      if (v9)
        objc_setProperty_atomic(v9, v7, v5, 24);
      v10 = objc_alloc((Class)NSMutableDictionary);
      v20[0] = kCMHeadphoneEventTypeKey;
      v20[1] = kCMHeadphoneEventPayloadData;
      v21[0] = kCMHeadphoneEventTypeActivity;
      v21[1] = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      v12 = objc_msgSend(v10, "initWithDictionary:", v11);

      if (v6)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, kCMHeadphoneEventPayloadError);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 0, 0));
      if (v13)
      {
        v14 = *(_QWORD *)(a1 + 32);
        if (v14)
          v15 = *(NSObject **)(v14 + 8);
        else
          v15 = 0;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100008B54;
        v17[3] = &unk_100024B48;
        v19 = *(id *)(a1 + 40);
        v18 = v13;
        dispatch_async(v15, v17);

      }
      else
      {
        if (qword_10002C4B0 != -1)
          dispatch_once(&qword_10002C4B0, &stru_100024B90);
        v16 = qword_10002C4B8;
        if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to serialize activity dictionary: %{public}@", buf, 0xCu);
        }
      }

    }
  }

}

uint64_t sub_100008B54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100008BF8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

id *sub_100008D94(id *result, uint64_t a2, uint64_t a3)
{
  id *v3;
  id v4;
  id v5;

  if (!a3)
  {
    v3 = result;
    objc_msgSend(result[4], "setLastDeviceStatus:", a2);
    v4 = objc_msgSend(v3[4], "lastDeviceStatus");
    v5 = v3[4];
    if (v4)
      return (id *)objc_msgSend(v5, "notifyDisconnectedToClient");
    else
      return (id *)objc_msgSend(v5, "notifyConnectedToClient");
  }
  return result;
}

void sub_10000918C(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "callbackBlock"));
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

void sub_100009490(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000951C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v9 = v8;
  if (v8 != CMErrorDomain)
  {

    goto LABEL_10;
  }
  v10 = objc_msgSend(v7, "code");

  if (v10 != (id)109)
  {
LABEL_10:
    if (v5)
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024C00);
      v15 = (void *)qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(void **)(a1 + 32);
        v17 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeAudioRouteDeviceID"));
        v20 = 138477827;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[RMHeadphoneStatusProvider] Activity supported for device: %{private}@", (uint8_t *)&v20, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "setActivitySupported:", 1);
      objc_msgSend(*(id *)(a1 + 32), "notifyConnectedToClient");
    }
    goto LABEL_16;
  }
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024C00);
  v11 = (void *)qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(void **)(a1 + 32);
    v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeAudioRouteDeviceID"));
    v20 = 138477827;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[RMHeadphoneStatusProvider] Activity not supported for device: %{private}@", (uint8_t *)&v20, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "notifyDisconnectedToClient");
LABEL_16:
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "audioAccessoryManager"));
  objc_msgSend(v19, "stopActivityUpdates");

}

void sub_100009814(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

void sub_1000098C8(id *a1@<X0>, _OWORD *a2@<X8>)
{
  id *v3;
  id v4;

  *a2 = 0u;
  a2[1] = 0u;
  if (a1)
  {
    v3 = sub_100016388(a1);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    xpc_connection_get_audit_token(v4, a2);

  }
}

BOOL sub_100009920(id *a1, void *a2)
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  CFErrorRef v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t i;
  void *v12;
  __CFError *v13;
  id v14;
  CFErrorDomain Domain;
  CFIndex Code;
  CFTypeID v17;
  _BOOL8 v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t j;
  void *v23;
  id v24;
  id v25;
  void *v26;
  __CFString *v27;
  NSObject *v28;
  id v29;
  unsigned int v30;
  __CFString *v31;
  void *v32;
  __CFError *v34;
  audit_token_t v35;
  CFErrorRef error;
  au_asid_t asidp[2];
  gid_t rgidp[2];
  pid_t pidp[2];
  audit_token_t token;

  v3 = a2;
  if (a1)
  {
    error = 0;
    memset(&v35, 0, sizeof(v35));
    sub_1000098C8(a1, &v35);
    token = v35;
    v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    if (v4)
    {
      v5 = v4;
      v6 = SecTaskCopyValueForEntitlement(v4, v3, &error);
      v7 = error;
      if (error)
      {
        if (qword_10002C4A0 != -1)
          dispatch_once(&qword_10002C4A0, &stru_100024C20);
        v8 = (id)qword_10002C4A8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v7;
          v9 = objc_alloc_init((Class)NSMutableString);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v35.val[0]));
          objc_msgSend(v9, "appendString:", v10);

          for (i = 1; i != 8; ++i)
          {
            objc_msgSend(v9, "appendString:", CFSTR("|"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v35.val[i]));
            objc_msgSend(v9, "appendString:", v12);

          }
          v13 = error;
          v14 = v9;
          Domain = CFErrorGetDomain(v13);
          Code = CFErrorGetCode(error);
          token.val[0] = 138412802;
          *(_QWORD *)&token.val[1] = v9;
          LOWORD(token.val[3]) = 2112;
          *(_QWORD *)((char *)&token.val[3] + 2) = Domain;
          HIWORD(token.val[5]) = 2048;
          *(_QWORD *)&token.val[6] = Code;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCopyValueForEntitlement failed for token '%@' with error '%@' (%ld)", (uint8_t *)&token, 0x20u);

          v7 = v34;
        }

        CFRelease(error);
      }
      if (v6)
      {
        v17 = CFGetTypeID(v6);
        v18 = v17 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
        CFRelease(v6);
        if (v7)
          goto LABEL_26;
      }
      else
      {
        v18 = 0;
        if (v7)
        {
LABEL_26:
          if (qword_10002C4A0 != -1)
            dispatch_once(&qword_10002C4A0, &stru_100024C20);
          v26 = (void *)qword_10002C4A8;
          if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEFAULT))
          {
            v27 = objc_retainAutorelease(v3);
            v28 = v26;
            v29 = -[__CFString UTF8String](v27, "UTF8String");
            *(_QWORD *)rgidp = 0;
            *(_QWORD *)pidp = 0;
            *(_QWORD *)asidp = 0;
            token = v35;
            audit_token_to_au32(&token, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
            v30 = pidp[1];
            v31 = sub_100009DE8(&v35);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            token.val[0] = 136315650;
            *(_QWORD *)&token.val[1] = v29;
            LOWORD(token.val[3]) = 1024;
            *(unsigned int *)((char *)&token.val[3] + 2) = v30;
            HIWORD(token.val[4]) = 2112;
            *(_QWORD *)&token.val[5] = v32;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#Warning Issue retrieving entitlement, '%s', pid, %d, executable or bundle, '%@'", (uint8_t *)&token, 0x1Cu);

          }
        }
      }
      CFRelease(v5);
      goto LABEL_31;
    }
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100024C20);
    v19 = (id)qword_10002C4A8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_alloc_init((Class)NSMutableString);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v35.val[0]));
      objc_msgSend(v20, "appendString:", v21);

      for (j = 1; j != 8; ++j)
      {
        objc_msgSend(v20, "appendString:", CFSTR("|"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v35.val[j]));
        objc_msgSend(v20, "appendString:", v23);

      }
      v24 = objc_retainAutorelease(v20);
      v25 = objc_msgSend(v24, "UTF8String");
      token.val[0] = 136315138;
      *(_QWORD *)&token.val[1] = v25;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCreateWithAuditToken failed for token '%s'", (uint8_t *)&token, 0xCu);

    }
  }
  v18 = 0;
LABEL_31:

  return v18;
}

__CFString *sub_100009DE8(_OWORD *a1)
{
  __int128 v2;
  void *v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  CFURLRef v7;
  CFURLRef v8;
  const __CFURL *v9;
  const __CFURL *v10;
  __CFBundle *v11;
  __CFBundle *v12;
  __CFString *v13;
  __CFString *v14;
  __int128 v15;
  au_asid_t asidp[2];
  gid_t rgidp[2];
  pid_t pidp[2];
  audit_token_t atoken;

  *(_QWORD *)rgidp = 0;
  *(_QWORD *)pidp = 0;
  v2 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v2;
  *(_QWORD *)asidp = 0;
  audit_token_to_au32(&atoken, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
  if (proc_pidpath(pidp[1], &atoken, 0x1000u) <= 0)
    goto LABEL_16;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &atoken));
  if (!v3)
    goto LABEL_16;
  v4 = objc_retainAutorelease(v3);
  v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)objc_msgSend(v4, "UTF8String"), 4u);
  if (v5)
  {
    v6 = v5;
    v7 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v5, kCFURLPOSIXPathStyle, 0);
    if (v7)
    {
      v8 = v7;
      v9 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      if (v9)
      {
        v10 = v9;
        v11 = CFBundleCreate(kCFAllocatorDefault, v9);
        if (v11)
        {
          v12 = v11;
          v13 = (id)CFBundleGetIdentifier(v11);
          CFRelease(v12);
        }
        else
        {
          v13 = 0;
        }
        CFRelease(v10);
      }
      else
      {
        v13 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (!v14)
  {
LABEL_16:
    *(_QWORD *)rgidp = 0;
    *(_QWORD *)pidp = 0;
    v15 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v15;
    *(_QWORD *)asidp = 0;
    audit_token_to_au32(&atoken, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
    if (proc_pidpath(pidp[1], &atoken, 0x1000u) >= 1)
      return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &atoken));
    v14 = 0;
  }
  return v14;
}

BOOL sub_10000A00C(_BOOL8 a1, void *a2)
{
  id v3;
  _OWORD v5[2];

  v3 = a2;
  if (a1)
  {
    sub_1000098C8((id *)a1, v5);
    a1 = TCCAccessCheckAuditToken(v3, v5, 0) != 0;
  }

  return a1;
}

id *sub_10000A068(id *a1)
{
  __CFString *v1;
  _OWORD v3[2];

  if (a1)
  {
    memset(v3, 0, sizeof(v3));
    sub_1000098C8(a1, v3);
    v1 = sub_100009DE8(v3);
    a1 = (id *)objc_claimAutoreleasedReturnValue(v1);
  }
  return a1;
}

id *sub_10000A0A0(id *result)
{
  audit_token_t v1;
  audit_token_t atoken;
  au_asid_t asidp[2];
  gid_t rgidp[2];
  pid_t pidp[2];

  if (result)
  {
    memset(&v1, 0, sizeof(v1));
    sub_1000098C8(result, &v1);
    *(_QWORD *)rgidp = 0;
    *(_QWORD *)pidp = 0;
    *(_QWORD *)asidp = 0;
    atoken = v1;
    audit_token_to_au32(&atoken, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
    return (id *)pidp[1];
  }
  return result;
}

void sub_10000A108(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "IPC");
  v2 = (void *)qword_10002C4A8;
  qword_10002C4A8 = (uint64_t)v1;

}

void sub_10000A178(id a1)
{
  RMAudioAccessoryManagerSharedInternal *v1;
  void *v2;

  v1 = objc_opt_new(RMAudioAccessoryManagerSharedInternal);
  v2 = (void *)qword_10002C900;
  qword_10002C900 = (uint64_t)v1;

}

void sub_10000A4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A4DC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    objc_msgSend(v8, "setLastDeviceStatus:", a2);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managers", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "deviceMotionStatusHandler"));
          v14 = (void *)v13;
          if (v13)
            (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_sync_exit(v8);
  }

}

void sub_10000A648(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A970(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_sync_enter(v9);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managers", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "deviceMotionHandler"));
          v15 = (void *)v14;
          if (v14)
            (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v11);
    }

    v16 = sub_10000DC34();
    objc_msgSend(v9, "setDmSamplesPerSecond:", (char *)objc_msgSend(v9, "dmSamplesPerSecond") + 1);
    objc_msgSend(v9, "lastDMSampleTime");
    if (v17 + 1.0 < v16)
    {
      objc_msgSend(v9, "setDmSampleRate:", objc_msgSend(v9, "dmSamplesPerSecond"));
      objc_msgSend(v9, "setDmSamplesPerSecond:", 0);
      objc_msgSend(v9, "setLastDMSampleTime:", v16);
    }
    objc_msgSend(v9, "lastDMPrintTime");
    if (v18 + 5.0 < v16)
    {
      objc_msgSend(v9, "setLastDMPrintTime:", v16);
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024CE8);
      v19 = (id)qword_10002C4B8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v9, "dmSampleRate");
        *(_DWORD *)buf = 134349056;
        v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] current device motion samples per second: %{public}lu", buf, 0xCu);
      }

    }
    objc_sync_exit(v9);

  }
}

void sub_10000ABEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000AF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AF88(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_sync_enter(v9);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managers", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "activityHandler"));
          v15 = (void *)v14;
          if (v14)
            (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v11);
    }

    v16 = sub_10000DC34();
    objc_msgSend(v9, "setActivitySamplesPerSecond:", (char *)objc_msgSend(v9, "activitySamplesPerSecond") + 1);
    objc_msgSend(v9, "lastActivitySampleTime");
    if (v17 + 1.0 < v16)
    {
      objc_msgSend(v9, "setActivitySampleRate:", objc_msgSend(v9, "activitySamplesPerSecond"));
      objc_msgSend(v9, "setActivitySamplesPerSecond:", 0);
      objc_msgSend(v9, "setLastActivitySampleTime:", v16);
    }
    objc_msgSend(v9, "lastActivityPrintTime");
    if (v18 + 5.0 < v16)
    {
      objc_msgSend(v9, "setLastActivityPrintTime:", v16);
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024CE8);
      v19 = (id)qword_10002C4B8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v9, "activitySampleRate");
        *(_DWORD *)buf = 134349056;
        v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] current activity samples per second: %{public}lu", buf, 0xCu);
      }

    }
    objc_sync_exit(v9);

  }
}

void sub_10000B204(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B31C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000B918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000BD14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000BEB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000BF54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000C0F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000C20C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000C398(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

id *sub_10000C3C8(id *a1, void *a2, char a3)
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)RMHeadphoneMotionProvider;
    v7 = (id *)objc_msgSendSuper2(&v9, "init");
    a1 = v7;
    if (v7)
    {
      *((_BYTE *)v7 + 8) = a3;
      objc_storeStrong(v7 + 2, a2);
    }
  }

  return a1;
}

void sub_10000C508(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 0, 0));
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
        v6 = *(NSObject **)(v5 + 16);
      else
        v6 = 0;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000C680;
      v8[3] = &unk_100024B48;
      v10 = *(id *)(a1 + 40);
      v9 = v4;
      dispatch_async(v6, v8);

    }
    else
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024D30);
      v7 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to serialize CMDeviceMotion object: %{public}@", buf, 0xCu);
      }
    }

  }
}

uint64_t sub_10000C680(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10000C6F0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

id *sub_10000C720(id *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)RMConnectionHandlerInternal;
    v8 = (id *)objc_msgSendSuper2(&v10, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a3);
      objc_storeStrong(a1 + 2, a2);
    }
  }

  return a1;
}

void sub_10000C7B8(uint64_t a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    sub_100015F24(*(_QWORD *)(a1 + 16));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

  }
}

id sub_10000CA5C()
{
  if (qword_10002C4A0 != -1)
    dispatch_once(&qword_10002C4A0, &stru_100024DE0);
  return (id)qword_10002C4A8;
}

void sub_10000CFBC(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  const _xpc_type_s *v5;
  void *v6;
  NSObject *v7;
  __objc2_class_ro **p_info;
  NSObject *v9;
  RMConnectionEndpoint *v10;
  void *v11;
  id *v12;
  void *v13;
  NSObject *v14;
  id *v15;
  char *v16;
  id *v17;
  void *v18;
  unsigned int v19;
  uint64_t (**v20)(_QWORD, _QWORD);
  uint64_t v21;
  void *v22;
  id *v23;
  id *v24;
  void *v25;
  const char *string;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id *v30;
  char *v31;
  id *v32;
  void *v33;
  unsigned int v34;
  int v35;
  const char *name;
  __int16 v37;
  void *v38;
  __int16 v39;
  unsigned int v40;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100024DE0);
    p_info = RMMediaSessionStatus.info;
    v9 = qword_10002C4A8;
    if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection request received", (uint8_t *)&v35, 2u);
    }
    v10 = [RMConnectionEndpoint alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    v12 = sub_100015B9C((id *)&v10->super.isa, v3, v11);

    if (objc_msgSend(*(id *)(a1 + 32), "isEndpointConnectionAllowed:", v12))
    {
      if (qword_10002C4A0 != -1)
        dispatch_once(&qword_10002C4A0, &stru_100024DE0);
      v13 = (void *)qword_10002C4A8;
      if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v15 = sub_100016388(v12);
        v16 = (char *)objc_claimAutoreleasedReturnValue(v15);
        v17 = sub_10000A068(v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = sub_10000A0A0(v12);
        v35 = 134284035;
        name = v16;
        v37 = 2114;
        v38 = v18;
        v39 = 1025;
        v40 = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accepted connection %{private}p from %{public}@ (%{private}d)", (uint8_t *)&v35, 0x1Cu);

      }
      sub_1000163A4(v12, *(void **)(a1 + 32));
      v20 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messageHandlerConstructor"));
      v21 = ((uint64_t (**)(_QWORD, id *))v20)[2](v20, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      v23 = sub_100015474(v12);
      p_info = (__objc2_class_ro **)objc_claimAutoreleasedReturnValue(v23);

      if (p_info)
      {
        sub_100015FB8((uint64_t)v12);
        v24 = sub_10000C720((id *)[RMConnectionHandlerInternal alloc], v12, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections"));
        objc_msgSend(v25, "addObject:", v24);

LABEL_25:
        goto LABEL_26;
      }
      sub_100016844();
    }
    else if (qword_10002C4A0 == -1)
    {
      goto LABEL_23;
    }
    dispatch_once(&qword_10002C4A0, &stru_100024DE0);
LABEL_23:
    v28 = p_info[149];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = sub_100016388(v12);
      v31 = (char *)objc_claimAutoreleasedReturnValue(v30);
      v32 = sub_10000A068(v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = sub_10000A0A0(v12);
      v35 = 134284035;
      name = v31;
      v37 = 2114;
      v38 = v33;
      v39 = 1025;
      v40 = v34;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Denied connection %{private}p from %{public}@ (%{private}d)", (uint8_t *)&v35, 0x1Cu);

    }
    goto LABEL_25;
  }
  v5 = type;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100024DE0);
    v27 = qword_10002C4A8;
    if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_FAULT))
    {
      v35 = 136315138;
      name = string;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Got error: %s", (uint8_t *)&v35, 0xCu);
    }
  }
  else
  {
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100024DE0);
    v6 = (void *)qword_10002C4A8;
    if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_FAULT))
    {
      v7 = v6;
      v35 = 136315138;
      name = xpc_type_get_name(v5);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Unexpected event type %s", (uint8_t *)&v35, 0xCu);

    }
  }
LABEL_26:

}

void sub_10000D4CC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v2));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        if (v9)
          v10 = *(_QWORD *)(v9 + 16);
        else
          v10 = 0;
        (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v11;
    }
    while (v11);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

void sub_10000D6B4(id a1, RMConnectionHandlerInternal *a2, unint64_t a3, BOOL *a4)
{
  sub_10000C7B8((uint64_t)a2);
}

void sub_10000DA9C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "IPC");
  v2 = (void *)qword_10002C4A8;
  qword_10002C4A8 = (uint64_t)v1;

}

void sub_10000DAF8(void *a1, int a2, int a3, int a4, const char *a5, const char *a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  NSObject *v13;

  _os_signpost_emit_with_name_impl(a1, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, a5, a6, &buf, 0x26u);
}

void sub_10000DB18(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  NSObject *v13;

  _os_log_impl(a1, v13, OS_LOG_TYPE_INFO, a4, &buf, 0x26u);
}

void sub_10000DB2C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  NSObject *v13;

  _os_log_impl(a1, v13, OS_LOG_TYPE_FAULT, a4, &buf, 0x26u);
}

BOOL sub_10000DB40(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_INFO);
}

BOOL sub_10000DB4C(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_FAULT);
}

BOOL sub_10000DB58(os_log_t log)
{
  return os_signpost_enabled(log);
}

double sub_10000DB60(unint64_t a1)
{
  double v2;
  uint32_t denom;
  uint32_t numer;
  uint32_t v5;
  unsigned int v6;
  uint32_t v7;
  uint32_t v8;
  mach_timebase_info info;

  v2 = *(double *)&qword_10002C918;
  if (*(double *)&qword_10002C918 == 0.0)
  {
    info = 0;
    mach_timebase_info(&info);
    if (info.denom)
    {
      denom = info.denom;
      numer = info.numer;
      do
      {
        v5 = denom;
        denom = numer % denom;
        numer = v5;
      }
      while (denom);
    }
    else
    {
      v5 = info.numer;
    }
    v6 = 1000000000;
    v7 = info.numer / v5;
    do
    {
      v8 = v7;
      v7 = v6;
      v6 = v8 % v6;
    }
    while (v6);
    v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&qword_10002C918 = v2;
  }
  return v2 * (double)a1;
}

double sub_10000DC20()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  return sub_10000DB60(v0);
}

double sub_10000DC34()
{
  uint64_t v0;

  v0 = mach_continuous_time();
  return sub_10000DB60(v0);
}

void sub_10000DEF4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0;
  v2 = mach_absolute_time();
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "receiverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DFC8;
  block[3] = &unk_100024E08;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = v2;
  dispatch_async(v3, block);

}

void sub_10000DFC8(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a1 + 48, 64));
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void sub_10000E3D8(uint64_t a1)
{
  void (**v1)(void);

  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handler"));
  v1[2]();

}

void sub_10000E470(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

void sub_10000E4E0(id a1)
{
  CFBooleanRef v1;

  v1 = (CFBooleanRef)MGCopyAnswer(CFSTR("InternalBuild"), 0);
  byte_10002C920 = v1 == kCFBooleanTrue;
  CFRelease(v1);
}

void sub_10000E55C(id a1)
{
  __int128 v1;
  int v2;

  if (_os_feature_enabled_impl("CoreLocation", "OpportunisticAnchoredTracking"))
  {
    v2 = 802516499;
    v1 = xmmword_10001B678;
    byte_10002C930 = MGIsDeviceOneOfType(&v1);
  }
}

void sub_10000E68C(id a1)
{
  RMHeadphoneActivityManager *v1;
  void *v2;

  v1 = objc_opt_new(RMHeadphoneActivityManager);
  v2 = (void *)qword_10002C940;
  qword_10002C940 = (uint64_t)v1;

}

id sub_10000E9B8()
{
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024F68);
  return (id)qword_10002C4B8;
}

void sub_10000EFE4(id a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v1 = objc_alloc((Class)NSSet);
  v2 = objc_opt_class(NSArray);
  v3 = objc_opt_class(NSDictionary);
  v4 = objc_opt_class(NSString);
  v5 = objc_opt_class(NSData);
  v6 = objc_opt_class(NSDate);
  v7 = objc_opt_class(NSNumber);
  v8 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, v7, objc_opt_class(NSError), 0);
  v9 = (void *)qword_10002C950;
  qword_10002C950 = (uint64_t)v8;

}

void sub_10000F534(uint64_t a1, void *a2)
{
  id v3;
  RBSProcessIdentifier *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;
  void *v16;

  v3 = a2;
  v4 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", sub_10000A0A0(*(id **)(a1 + 32)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v5));
  v16 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v3, "setPredicates:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  objc_msgSend(v3, "setStateDescriptor:", v8);

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000F6FC;
  v9[3] = &unk_100024ED0;
  v13 = v14;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setUpdateHandler:", v9);

  _Block_object_dispose(v14, 8);
}

void sub_10000F6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F6FC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  id v22;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "state"));
  v8 = objc_msgSend(v7, "taskState");

  if (v8 == 4)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100024F68);
      v13 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@ is scheduled, resuming data stream", buf, 0xCu);
      }
      v14 = sub_100015FE8(*(_QWORD *)(a1 + 32));
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000F99C;
      v16[3] = &unk_100024D80;
      v12 = &v17;
      v17 = *(id *)(a1 + 40);
      v18 = *(id *)(a1 + 48);
      dispatch_async(v15, v16);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_15;
    }
  }
  else if (v8 == 3 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024F68);
    v9 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@ is suspended, pausing data stream", buf, 0xCu);
    }
    v10 = sub_100015FE8(*(_QWORD *)(a1 + 32));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F994;
    block[3] = &unk_100024900;
    v12 = &v20;
    v20 = *(id *)(a1 + 40);
    dispatch_async(v11, block);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_15:

  }
}

id sub_10000F994(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopProducingData");
}

id sub_10000F99C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startProducingDataWithCallback:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F9C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10000FCE0(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  double v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v13[0] = CFSTR("client");
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = v2;
  v13[1] = CFSTR("duration");
  v14[0] = v3;
  v4 = sub_10000DC34();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(double *)(v5 + 40);
  else
    v6 = 0.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4 - v6));
  v14[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024F68);
  v9 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138477827;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending analytics: \n%{private}@", (uint8_t *)&v11, 0xCu);
  }
  return v8;
}

void sub_10000FE84(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

void sub_100010374(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[5];
  _BYTE v31[128];
  _BYTE v32[128];

  objc_msgSend(*(id *)(a1 + 32), "setHandler:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
  v3 = objc_msgSend(v2, "count");

  if (!v3 && objc_msgSend(*(id *)(a1 + 32), "configureCaptureSession"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "facePoseCaptureSessionDidConfigure:");

    if ((v5 & 1) != 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000106A8;
      block[3] = &unk_100024900;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v6, block);

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v12, "supportsFaceKitMetadata") & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "startFaceKitForContext:", v12);
            objc_msgSend(v12, "faceKit");
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v9);
    }

    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100025050);
    v13 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting capture session", buf, 2u);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isCameraPaused") & 1) == 0)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "captureSession"));
            objc_msgSend(v19, "startRunning");

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
        }
        while (v16);
      }

    }
    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100025050);
    v20 = qword_10002C4B8;
    if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Started capture session", buf, 2u);
    }
  }
}

void sub_1000106A8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "facePoseCaptureSessionDidConfigure:", *(_QWORD *)(a1 + 32));

}

void sub_1000107BC(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *k;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *m;
  uint64_t v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100025050);
  v1 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Stopping capture session", buf, 2u);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "captureSession"));
        objc_msgSend(v7, "stopRunning");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "setHandler:", 0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v9; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "captureSession"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "inputs"));

        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)k);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "captureSession"));
              objc_msgSend(v20, "removeInput:", v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
          }
          while (v16);
        }

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "captureSession"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "outputs"));

        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v33;
          do
          {
            for (m = 0; m != v24; m = (char *)m + 1)
            {
              if (*(_QWORD *)v33 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)m);
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "captureSession"));
              objc_msgSend(v28, "removeOutput:", v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
          }
          while (v24);
        }

        objc_msgSend(v12, "setCaptureSession:", 0);
        objc_msgSend(v12, "setCaptureDeviceInput:", 0);
        objc_msgSend(v12, "setVideoDataOutput:", 0);
        objc_msgSend(v12, "setMetadataOutput:", 0);
        objc_msgSend(*(id *)(a1 + 32), "stopFaceKitForContext:", v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v9);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
  objc_msgSend(v29, "removeAllObjects");

}

void sub_100010C28(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[8];
  _BYTE v28[128];
  _BYTE v29[128];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    if (*(_BYTE *)(a1 + 40))
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100025050);
      v4 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pausing capture session", buf, 2u);
      }
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v24;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v24 != v8)
              objc_enumerationMutation(v5);
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9), "captureSession"));
            objc_msgSend(v10, "stopRunning");

            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        }
        while (v7);
      }

    }
    else
    {
      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100025050);
      v11 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resuming capture session", buf, 2u);
      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext", 0));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1)
                                                                               + 8 * (_QWORD)v16), "captureSession"));
            objc_msgSend(v17, "startRunning");

            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        }
        while (v14);
      }

      if (qword_10002C4B0 != -1)
        dispatch_once(&qword_10002C4B0, &stru_100025050);
      v18 = qword_10002C4B8;
      if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Resumed capture session", buf, 2u);
      }
    }
  }
}

void sub_1000126B8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x388], 8);
  _Unwind_Resume(a1);
}

void sub_100012704(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  AVCaptureDeviceType v14;
  void *v15;
  unsigned int v16;
  RMFacePoseCaptureContext *v17;
  NSString *v18;
  AVCaptureDeviceType v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v22 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "devices"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
      v12 = objc_msgSend(v11, "count");
      v13 = objc_msgSend(*(id *)(a1 + 32), "maxNumberOfCameras");

      if (v12 >= v13)
        break;
      if ((objc_msgSend(v10, "isContinuityCamera") & 1) == 0)
      {
        v14 = (AVCaptureDeviceType)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceType"));
        if (v14 != AVCaptureDeviceTypeExternal)
        {

LABEL_11:
          v17 = objc_opt_new(RMFacePoseCaptureContext);
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          -[RMFacePoseCaptureContext setCameraID:](v17, "setCameraID:");
          -[RMFacePoseCaptureContext setMediaType:](v17, "setMediaType:", v22);
          -[RMFacePoseCaptureContext setCaptureDevice:](v17, "setCaptureDevice:", v10);
          v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceType"));
          if (v18 == AVCaptureDeviceTypeExternal)
          {
            -[RMFacePoseCaptureContext setBuiltInCamera:](v17, "setBuiltInCamera:", 0);
          }
          else
          {
            v19 = (AVCaptureDeviceType)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceType"));
            -[RMFacePoseCaptureContext setBuiltInCamera:](v17, "setBuiltInCamera:", v19 != AVCaptureDeviceTypeContinuityCamera);

          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureContext"));
          objc_msgSend(v20, "addObject:", v17);

          goto LABEL_15;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedName"));
        v16 = objc_msgSend(v15, "containsString:", CFSTR("Display"));

        if (v16)
          goto LABEL_11;
      }
LABEL_15:
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

void sub_1000132DC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013318(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100013328(uint64_t a1)
{

}

void sub_100013330(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "results"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100013368(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "results"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1000133A0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSMutableDictionary *v19;
  _QWORD block[5];
  NSMutableDictionary *v21;
  __int128 v22;
  uint64_t v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", kCVAFaceTracking_TrackedFacesArray));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_opt_new(NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "cameraID")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, CFSTR("rm_camera_id"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureDevice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, CFSTR("rm_camera_device_name"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, CFSTR("rm_camera_device_model_id"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "captureDevice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, CFSTR("rm_camera_device_id"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isBuiltInCamera")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, CFSTR("rm_built_in"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v4, CFSTR("rm_tracked_faces"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "videoDataOutput"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14 != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, CFSTR("rm_has_video_data_output"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadataOutput"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16 != 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, CFSTR("rm_has_metadata_output"));

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "captureQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001364C;
    block[3] = &unk_100025008;
    block[4] = *(_QWORD *)(a1 + 40);
    v21 = v5;
    v22 = *(_OWORD *)(a1 + 48);
    v23 = *(_QWORD *)(a1 + 64);
    v19 = v5;
    dispatch_async(v18, block);

  }
}

void sub_10001364C(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void (*v5)(_QWORD *, uint64_t, __int128 *);
  __int128 v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handler"));

  if (v2)
  {
    v3 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handler"));
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (void (*)(_QWORD *, uint64_t, __int128 *))v3[2];
    v6 = *(_OWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 64);
    v5(v3, v4, &v6);

  }
}

void sub_1000146CC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "TempestDataProducer");
  v2 = (void *)qword_10002C4B8;
  qword_10002C4B8 = (uint64_t)v1;

}

id sub_1000146FC()
{
  if (qword_10002C9A8 != -1)
    dispatch_once(&qword_10002C9A8, &stru_100025070);
  return (id)qword_10002C9A0;
}

void sub_10001473C(id a1)
{
  NSArray *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%s"), v2, "com.apple.relatived"));
  v4 = (void *)qword_10002C9A0;
  qword_10002C9A0 = v3;

}

void sub_1000147C0()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (qword_10002C490 != -1)
    dispatch_once(&qword_10002C490, &stru_100025260);
  v0 = qword_10002C498;
  if (os_log_type_enabled((os_log_t)qword_10002C498, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "relatived exiting", v5, 2u);
  }
  dispatch_sync((dispatch_queue_t)qword_10002C968, &stru_100025090);
  dispatch_sync((dispatch_queue_t)qword_10002C978, &stru_1000250B0);
  dispatch_sync((dispatch_queue_t)qword_10002C988, &stru_1000250D0);
  dispatch_sync((dispatch_queue_t)qword_10002C998, &stru_1000250F0);
  v1 = (void *)qword_10002C968;
  qword_10002C968 = 0;

  v2 = (void *)qword_10002C978;
  qword_10002C978 = 0;

  v3 = (void *)qword_10002C988;
  qword_10002C988 = 0;

  v4 = (void *)qword_10002C998;
  qword_10002C998 = 0;

}

void sub_1000148D0(id a1)
{
  void *v1;

  objc_msgSend((id)qword_10002C960, "invalidate");
  v1 = (void *)qword_10002C960;
  qword_10002C960 = 0;

}

void sub_1000148FC(id a1)
{
  void *v1;

  objc_msgSend((id)qword_10002C970, "invalidate");
  v1 = (void *)qword_10002C970;
  qword_10002C970 = 0;

}

void sub_100014928(id a1)
{
  void *v1;

  objc_msgSend((id)qword_10002C980, "invalidate");
  v1 = (void *)qword_10002C980;
  qword_10002C980 = 0;

}

void sub_100014954(id a1)
{
  void *v1;

  objc_msgSend((id)qword_10002C990, "invalidate");
  v1 = (void *)qword_10002C990;
  qword_10002C990 = 0;

}

uint64_t start()
{
  NSObject *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  int *v6;
  char *v7;
  void *v8;
  NSObject *v9;
  int *v10;
  char *v11;
  dispatch_queue_t v12;
  void *v13;
  dispatch_queue_t v14;
  void *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_queue_t v18;
  void *v19;
  stat v21;
  _BYTE buf[22];

  if (qword_10002C490 != -1)
    dispatch_once(&qword_10002C490, &stru_100025260);
  v0 = qword_10002C498;
  if (os_log_type_enabled((os_log_t)qword_10002C498, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "relatived starting", (uint8_t *)&v21, 2u);
  }
  memset(&v21, 0, sizeof(v21));
  v1 = sub_1000146FC();
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  if (stat((const char *)objc_msgSend(v2, "UTF8String"), &v21))
  {
    if (*__error() == 2)
    {
      v3 = objc_retainAutorelease(v2);
      if (mkdir((const char *)objc_msgSend(v3, "UTF8String"), 0x1E4u))
      {
        if (qword_10002C490 != -1)
          dispatch_once(&qword_10002C490, &stru_100025260);
        v4 = (void *)qword_10002C498;
        if (os_log_type_enabled((os_log_t)qword_10002C498, OS_LOG_TYPE_ERROR))
        {
          v5 = v4;
          v6 = __error();
          v7 = strerror(*v6);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v3;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error trying to create our cache directory (%@): %s", buf, 0x16u);

        }
      }
    }
    else
    {
      if (qword_10002C490 != -1)
        dispatch_once(&qword_10002C490, &stru_100025260);
      v8 = (void *)qword_10002C498;
      if (os_log_type_enabled((os_log_t)qword_10002C498, OS_LOG_TYPE_ERROR))
      {
        v9 = v8;
        v10 = __error();
        v11 = strerror(*v10);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unexpected while checking for prsence of our cache directory (%@): %s", buf, 0x16u);

      }
    }
  }
  v12 = dispatch_queue_create("Tempest", 0);
  v13 = (void *)qword_10002C968;
  qword_10002C968 = (uint64_t)v12;

  v14 = dispatch_queue_create("Public", 0);
  v15 = (void *)qword_10002C978;
  qword_10002C978 = (uint64_t)v14;

  v16 = dispatch_queue_create("Control", 0);
  v17 = (void *)qword_10002C988;
  qword_10002C988 = (uint64_t)v16;

  v18 = dispatch_queue_create("Status", 0);
  v19 = (void *)qword_10002C998;
  qword_10002C998 = (uint64_t)v18;

  dispatch_async((dispatch_queue_t)qword_10002C968, &stru_100025110);
  dispatch_async((dispatch_queue_t)qword_10002C978, &stru_100025170);
  dispatch_async((dispatch_queue_t)qword_10002C988, &stru_1000251B0);
  dispatch_async((dispatch_queue_t)qword_10002C998, &stru_100025210);
  *(_OWORD *)buf = off_100025250;
  sigaction(2, (const sigaction *)buf, 0);
  sigaction(3, (const sigaction *)buf, 0);
  sigaction(15, (const sigaction *)buf, 0);
  CFRunLoopRun();
  sub_1000147C0();

  return 0;
}

void sub_100014CE0(id a1)
{
  RMConnectionListener *v1;
  RMConnectionListener *v2;
  void *v3;

  v1 = [RMConnectionListener alloc];
  v2 = -[RMConnectionListener initWithQueue:entitlement:messageHandlerConstructor:](v1, "initWithQueue:entitlement:messageHandlerConstructor:", qword_10002C968, CFSTR("com.apple.developer.coremotion.head-pose"), &stru_100025150);
  v3 = (void *)qword_10002C960;
  qword_10002C960 = (uint64_t)v2;

  objc_msgSend((id)qword_10002C960, "setDeprecatedEntitlement:", CFSTR("com.apple.relatived.tempest"));
  objc_msgSend((id)qword_10002C960, "startListeningForService:", CFSTR("com.apple.relatived.tempest"));
}

RMConnectionStreamProducingDelegate *__cdecl sub_100014D4C(id a1, RMConnectionEndpoint *a2)
{
  RMConnectionEndpoint *v2;
  RMDataStreamHandler *v3;

  v2 = a2;
  v3 = -[RMDataStreamHandler initWithEndpoint:isInternal:]([RMDataStreamHandler alloc], "initWithEndpoint:isInternal:", v2, 1);

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_100014D94(id a1)
{
  RMConnectionListener *v1;
  RMConnectionListener *v2;
  void *v3;

  v1 = [RMConnectionListener alloc];
  v2 = -[RMConnectionListener initWithQueue:entitlement:tccService:messageHandlerConstructor:](v1, "initWithQueue:entitlement:tccService:messageHandlerConstructor:", qword_10002C978, CFSTR("com.apple.locationd.activity"), kTCCServiceMotion, &stru_100025190);
  v3 = (void *)qword_10002C970;
  qword_10002C970 = (uint64_t)v2;

  objc_msgSend((id)qword_10002C970, "startListeningForService:", CFSTR("com.apple.relatived.public"));
}

RMConnectionStreamProducingDelegate *__cdecl sub_100014DFC(id a1, RMConnectionEndpoint *a2)
{
  RMConnectionEndpoint *v2;
  RMDataStreamHandler *v3;

  v2 = a2;
  v3 = -[RMDataStreamHandler initWithEndpoint:isInternal:]([RMDataStreamHandler alloc], "initWithEndpoint:isInternal:", v2, 0);

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_100014E44(id a1)
{
  RMConnectionListener *v1;
  RMConnectionListener *v2;
  void *v3;

  v1 = [RMConnectionListener alloc];
  v2 = -[RMConnectionListener initWithQueue:entitlement:messageHandlerConstructor:](v1, "initWithQueue:entitlement:messageHandlerConstructor:", qword_10002C988, CFSTR("com.apple.relatived.internal"), &stru_1000251F0);
  v3 = (void *)qword_10002C980;
  qword_10002C980 = (uint64_t)v2;

  objc_msgSend((id)qword_10002C980, "startListeningForService:", CFSTR("com.apple.relatived.internal"));
}

RMConnectionDataDelegate *__cdecl sub_100014EA0(id a1, RMConnectionEndpoint *a2)
{
  RMConnectionEndpoint *v2;
  RMInternalServiceHandler *v3;
  RMInternalServiceHandler *v4;

  v2 = a2;
  v3 = [RMInternalServiceHandler alloc];
  v4 = -[RMInternalServiceHandler initWithEndpoint:managedListener:](v3, "initWithEndpoint:managedListener:", v2, qword_10002C970);

  return (RMConnectionDataDelegate *)v4;
}

void sub_100014EEC(id a1)
{
  RMConnectionListener *v1;
  RMConnectionListener *v2;
  void *v3;

  v1 = [RMConnectionListener alloc];
  v2 = -[RMConnectionListener initWithQueue:entitlement:messageHandlerConstructor:](v1, "initWithQueue:entitlement:messageHandlerConstructor:", qword_10002C998, 0, &stru_100025230);
  v3 = (void *)qword_10002C990;
  qword_10002C990 = (uint64_t)v2;

  objc_msgSend((id)qword_10002C990, "startListeningForService:", CFSTR("com.apple.relatived.status"));
}

RMConnectionStreamProducingDelegate *__cdecl sub_100014F44(id a1, RMConnectionEndpoint *a2)
{
  RMConnectionEndpoint *v2;
  RMDataStreamHandler *v3;

  v2 = a2;
  v3 = -[RMDataStreamHandler initWithEndpoint:isInternal:]([RMDataStreamHandler alloc], "initWithEndpoint:isInternal:", v2, 0);

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_100014F8C(unsigned int a1)
{
  __CFRunLoop *Main;

  if (a1 <= 0xF && ((1 << a1) & 0x800C) != 0)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopStop(Main);
  }
}

void sub_100014FC0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "Daemon");
  v2 = (void *)qword_10002C498;
  qword_10002C498 = (uint64_t)v1;

}

void sub_100014FF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  xpc_object_t reply;
  id v9;
  const char *v10;
  id v11;
  xpc_object_t v12;
  id v13;

  v13 = a4;
  if (a1)
  {
    v7 = a3;
    reply = xpc_dictionary_create_reply(a2);
    v9 = objc_retainAutorelease(v7);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");

    xpc_dictionary_set_string(reply, "kRMConnectionMessageNameKey", v10);
    if (v13)
    {
      v11 = objc_retainAutorelease(v13);
      v12 = xpc_data_create(objc_msgSend(v11, "bytes"), (size_t)objc_msgSend(v11, "length"));
      xpc_dictionary_set_value(reply, "kRMConnectionMessageDataKey", v12);

    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);

  }
}

BOOL sub_1000150D0(uint64_t a1, void *a2, _QWORD *a3)
{
  _xpc_endpoint_s *v5;
  _xpc_endpoint_s *v6;
  NSObject *v7;
  _BOOL4 v8;
  _xpc_endpoint_s *WeakRetained;
  xpc_connection_t v10;
  void **v11;
  NSObject *v12;
  void *v13;
  _xpc_endpoint_s *v14;
  uint64_t v15;
  _xpc_endpoint_s *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _BOOL8 v20;
  int v22;
  _xpc_endpoint_s *v23;
  __int16 v24;
  uint64_t v25;

  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_30;
  }
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_endpoint)
  {
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100025330);
    v7 = qword_10002C4A8;
    if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "The client did not send streaming endpoint correctly", (uint8_t *)&v22, 2u);
    }
    v8 = 0;
    goto LABEL_29;
  }
  WeakRetained = (_xpc_endpoint_s *)objc_loadWeakRetained((id *)(a1 + 24));
  v10 = xpc_connection_create_from_endpoint(v6);
  if (v10)
  {
    v11 = (void **)(a1 + 32);
    objc_storeStrong((id *)(a1 + 32), v10);
    if ((sub_100015490(a1, WeakRetained) & 1) == 0)
    {
      v8 = a3 != 0;
      if (a3)
      {
        if (qword_10002C4A0 != -1)
          dispatch_once(&qword_10002C4A0, &stru_100025330);
        v12 = qword_10002C4A8;
        if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_ERROR))
        {
          v22 = 138412290;
          v23 = WeakRetained;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to start the streaming with handler %@", (uint8_t *)&v22, 0xCu);
        }
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RMConnectionStreaming"), -2, 0));
      }
      if (qword_10002C4A0 != -1)
        dispatch_once(&qword_10002C4A0, &stru_100025330);
      v13 = (void *)qword_10002C4A8;
      if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_xpc_endpoint_s **)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 32);
        v22 = 134283777;
        v23 = v14;
        v24 = 2049;
        v25 = v15;
        v16 = v14;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cancelling the streaming server connection %{private}p.%{private}p", (uint8_t *)&v22, 0x16u);

      }
      xpc_connection_cancel(v10);
      v18 = *v11;
      *v11 = 0;

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (qword_10002C4A0 != -1)
    dispatch_once(&qword_10002C4A0, &stru_100025330);
  v19 = qword_10002C4A8;
  if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_ERROR))
  {
    v22 = 138412290;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create connection from endpoint %@", (uint8_t *)&v22, 0xCu);
  }
  if (!a3)
  {
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("RMConnectionStreaming"), -1, 0));
  v8 = 1;
LABEL_28:

LABEL_29:
  v20 = !v8;
LABEL_30:

  return v20;
}

id sub_100015434()
{
  if (qword_10002C4A0 != -1)
    dispatch_once(&qword_10002C4A0, &stru_100025330);
  return (id)qword_10002C4A8;
}

id *sub_100015474(id *WeakRetained)
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  return WeakRetained;
}

id sub_100015490(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  id v8;
  xpc_object_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  id v15;
  NSObject *v16;
  _QWORD v18[5];
  id v19;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  xpc_object_t values;
  char *keys;

  if (!a1)
    return 0;
  v3 = *(_xpc_connection_s **)(a1 + 32);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100015FF4;
  handler[3] = &unk_100024D58;
  handler[4] = a1;
  v4 = a2;
  xpc_connection_set_event_handler(v3, handler);
  v5 = *(NSObject **)(a1 + 8);
  v6 = (_xpc_connection_s *)*(id *)(a1 + 32);
  xpc_connection_set_target_queue(v6, v5);

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 32));
  v7 = xpc_string_create("kRMConnectionMessageDataStream");
  keys = "kRMConnectionMessageNameKey";
  v8 = v7;
  values = v8;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100016260;
  v18[3] = &unk_1000252B0;
  v18[4] = a1;
  v9 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  v19 = v9;
  v10 = objc_msgSend(v4, "endpoint:shouldStartStreamingDataToReceiver:", a1, v18);

  if (qword_10002C4A0 != -1)
    dispatch_once(&qword_10002C4A0, &stru_100025330);
  v11 = (void *)qword_10002C4A8;
  if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(void **)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = "NO";
    if ((_DWORD)v10)
      v14 = "YES";
    *(_DWORD *)buf = 134284035;
    v22 = v12;
    v23 = 2049;
    v24 = v13;
    v25 = 2080;
    v26 = v14;
    v15 = v12;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "shouldStartStreamingDataToReceiver returned on streaming server connection %{private}p.%{private}p: %s", buf, 0x20u);

  }
  return v10;
}

void sub_1000156C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *, id);
  id WeakRetained;
  NSString *v8;
  char *v9;
  xpc_object_t value;
  void *v11;
  void *v12;
  id bytes_ptr;
  xpc_object_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  id v22;
  id v23;
  void (**v24)(id, void *, id);
  id v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint32_t v30;
  NSObject *v31;
  NSObject *v32;
  xpc_object_t reply;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "kRMConnectionMessageNameKey"));
    v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
    value = xpc_dictionary_get_value(v5, "kRMConnectionMessageDataKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    v12 = v11;
    if (v11)
    {
      bytes_ptr = (id)xpc_data_get_bytes_ptr(v11);
      if (bytes_ptr)
        bytes_ptr = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v12));
    }
    else
    {
      bytes_ptr = 0;
    }
    v14 = xpc_dictionary_get_value(v5, "kRMConnectionRequestSteamingKey");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)v15;
    if (v9)
    {
      if (!v15)
      {
        if (v6)
        {
          v6[2](v6, v9, bytes_ptr);
          goto LABEL_31;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("kRMConnectionMessagePriorityBoost")))
        {
          if (qword_10002C4A0 != -1)
            dispatch_once(&qword_10002C4A0, &stru_100025330);
          v32 = qword_10002C4A8;
          if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v42 = v9;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Creating reply to hold onto priority boost: %{private}@", buf, 0xCu);
          }
          reply = xpc_dictionary_create_reply(v5);
          v34 = *(void **)(a1 + 64);
          *(_QWORD *)(a1 + 64) = reply;
        }
        else
        {
          if ((objc_opt_respondsToSelector(WeakRetained, "endpoint:didReceiveMessage:withData:replyBlock:") & 1) == 0)
          {
            if (qword_10002C4A0 != -1)
              dispatch_once(&qword_10002C4A0, &stru_100025330);
            v35 = qword_10002C4A8;
            if (!os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_FAULT))
              goto LABEL_31;
            *(_WORD *)buf = 0;
            v27 = "Message received but the handler doesn't implement the selector 'endpoint:didReceiveMessage:withData:replyBlock:'";
            v28 = v35;
            v29 = OS_LOG_TYPE_FAULT;
            v30 = 2;
            goto LABEL_14;
          }
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100015B88;
          v37[3] = &unk_100025288;
          v37[4] = a1;
          v38 = v5;
          objc_msgSend(WeakRetained, "endpoint:didReceiveMessage:withData:replyBlock:", a1, v9, bytes_ptr, v37);
          v34 = v38;
        }

        goto LABEL_31;
      }
      if ((objc_msgSend(WeakRetained, "conformsToProtocol:", &OBJC_PROTOCOL___RMConnectionStreamProducingDelegate) & 1) != 0)
      {
        objc_msgSend(WeakRetained, "endpoint:didReceiveStreamingRequest:withData:", a1, v9, bytes_ptr);
        v40 = 0;
        sub_1000150D0(a1, v16, &v40);
        v17 = v40;
        if (v17)
        {
          v18 = v17;
          v39 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v39));
          v36 = v12;
          v20 = v9;
          v21 = v16;
          v22 = bytes_ptr;
          v23 = WeakRetained;
          v24 = v6;
          v25 = v39;

          sub_100014FF0(a1, v5, CFSTR("kRMConnectionMessageError"), v19);
          v6 = v24;
          WeakRetained = v23;
          bytes_ptr = v22;
          v16 = v21;
          v9 = v20;
          v12 = v36;
        }
        else
        {
          if (qword_10002C4A0 != -1)
            dispatch_once(&qword_10002C4A0, &stru_100025330);
          v31 = qword_10002C4A8;
          if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Streaming session started, sending acknowledgement", buf, 2u);
          }
          sub_100014FF0(a1, v5, CFSTR("kRMConnectionMessageSuccess"), 0);
        }
        goto LABEL_31;
      }
      sub_100016EEC();
    }
    else if (qword_10002C4A0 == -1)
    {
LABEL_12:
      v26 = qword_10002C4A8;
      if (!os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 136315138;
      v42 = "kRMConnectionMessageNameKey";
      v27 = "XPC message missing key \"%s\"";
      v28 = v26;
      v29 = OS_LOG_TYPE_ERROR;
      v30 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, v30);
      goto LABEL_31;
    }
    dispatch_once(&qword_10002C4A0, &stru_100025330);
    goto LABEL_12;
  }
LABEL_32:

}

void sub_100015B88(uint64_t a1, void *a2, void *a3)
{
  sub_100014FF0(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2, a3);
}

id *sub_100015B9C(id *a1, void *a2, void *a3)
{
  _xpc_connection_s *v6;
  NSObject *v7;
  id *v8;
  _QWORD handler[4];
  id *v11;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)RMConnectionEndpoint;
    v8 = (id *)objc_msgSendSuper2(&v12, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 7, a2);
      objc_storeStrong(a1 + 1, a3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100015C8C;
      handler[3] = &unk_100024D58;
      a1 = a1;
      v11 = a1;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_set_target_queue(v6, v7);

    }
  }

  return a1;
}

void sub_100015C8C(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_interrupted)
    {
      if (qword_10002C4A0 != -1)
        dispatch_once(&qword_10002C4A0, &stru_100025330);
      v9 = (void *)qword_10002C4A8;
      if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEBUG))
      {
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v10 = *(_QWORD *)(v10 + 56);
        v12 = 134283521;
        v13 = v10;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p interrupted!", (uint8_t *)&v12, 0xCu);

      }
      sub_100015EE0(*(_QWORD *)(a1 + 32));
    }
    else if (v3 == &_xpc_error_connection_invalid)
    {
      if (qword_10002C4A0 != -1)
        dispatch_once(&qword_10002C4A0, &stru_100025330);
      v6 = (void *)qword_10002C4A8;
      if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(a1 + 32);
        if (v7)
          v7 = *(_QWORD *)(v7 + 56);
        v12 = 134283521;
        v13 = v7;
        v8 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p invalidated!", (uint8_t *)&v12, 0xCu);

      }
      sub_100015F24(*(_QWORD *)(a1 + 32));
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_1000156C8(*(_QWORD *)(a1 + 32), v3, 0);
  }
  else
  {
    if (qword_10002C4A0 != -1)
      dispatch_once(&qword_10002C4A0, &stru_100025330);
    v5 = qword_10002C4A8;
    if (os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Got unexpected xpc event", (uint8_t *)&v12, 2u);
    }
  }

}

void sub_100015EE0(uint64_t a1)
{
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "endpointWasInterrupted:", a1);

  }
}

void sub_100015F24(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    if (*(_QWORD *)(a1 + 32))
      sub_1000161D8(a1);
    if (*(_QWORD *)(a1 + 40))
      sub_1000162FC(a1);
    if (*(_QWORD *)(a1 + 56))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
      v3 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "endpointWasInvalidated:", a1);

  }
}

void sub_100015FB8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 56));
  }
}

uint64_t sub_100015FE8(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

void sub_100015FF4(uint64_t a1, xpc_object_t object)
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  __int16 v15;
  uint64_t v16;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_interrupted)
    {
      if (qword_10002C4A0 != -1)
        dispatch_once(&qword_10002C4A0, &stru_100025330);
      v10 = (void *)qword_10002C4A8;
      if (!os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v11 = *(_QWORD **)(a1 + 32);
      if (v11)
        v11 = (_QWORD *)v11[7];
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        v12 = *(_QWORD *)(v12 + 32);
      v13 = 134283777;
      v14 = v11;
      v15 = 2049;
      v16 = v12;
      v7 = v11;
      v8 = v10;
      v9 = "#Warning Streaming server connection %{private}p.%{private}p interrupted!";
    }
    else
    {
      if (object != &_xpc_error_connection_invalid)
        return;
      if (qword_10002C4A0 != -1)
        dispatch_once(&qword_10002C4A0, &stru_100025330);
      v4 = (void *)qword_10002C4A8;
      if (!os_log_type_enabled((os_log_t)qword_10002C4A8, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v5 = *(_QWORD **)(a1 + 32);
      if (v5)
        v5 = (_QWORD *)v5[7];
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        v6 = *(_QWORD *)(v6 + 32);
      v13 = 134283777;
      v14 = v5;
      v15 = 2049;
      v16 = v6;
      v7 = v5;
      v8 = v4;
      v9 = "#Warning Streaming server connection %{private}p.%{private}p invalidated!";
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v13, 0x16u);

LABEL_21:
    sub_1000161D8(*(_QWORD *)(a1 + 32));
  }
}

void sub_1000161D8(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_QWORD *)(a1 + 32))
    {
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 32), &stru_1000252F0);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      v2 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(WeakRetained, "endpointShouldStopStreamingData:", a1);

    }
    else
    {
      sub_100017004();
    }
  }
}

void sub_100016260(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v9 = v3;
    v6 = objc_retainAutorelease(v3);
    xpc_dictionary_set_data(v5, "kRMConnectionMessageDataStreamKey", objc_msgSend(v6, "bytes"), (size_t)objc_msgSend(v6, "length"));
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(_xpc_connection_s **)(v7 + 32);
    else
      v8 = 0;
    xpc_connection_send_message(v8, *(xpc_object_t *)(a1 + 40));
    v3 = v9;
  }

}

void sub_1000162FC(uint64_t a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_QWORD *)(a1 + 40))
    {
      xpc_connection_suspend(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &stru_100025310);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      v2 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
    if (*(_QWORD *)(a1 + 48))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
      v3 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
  }
}

id *sub_100016388(id *a1)
{
  if (a1)
    a1 = (id *)a1[7];
  return a1;
}

id *sub_1000163A4(id *result, void *a2)
{
  if (result)
    return (id *)objc_storeWeak(result + 2, a2);
  return result;
}

id *sub_1000163B4(id *result, void *a2)
{
  if (result)
    return (id *)objc_storeWeak(result + 3, a2);
  return result;
}

void sub_100016434(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RelativeMotion", "IPC");
  v2 = (void *)qword_10002C4A8;
  qword_10002C4A8 = (uint64_t)v1;

}

uint64_t sub_100016478()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000CA5C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Entitlement cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000CA5C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "Entitlement cannot be nil", "{\"msg%{public}.0s\":\"Entitlement cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000CA5C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"Entitlement cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m", 77, "-[RMConnectionListener initWithQueue:entitlement:tccService:messageHandlerConstructor:]");
  return sub_100016594(v24);
}

uint64_t sub_100016594()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000CA5C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"TCC service cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000CA5C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "TCC service cannot be nil", "{\"msg%{public}.0s\":\"TCC service cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000CA5C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"TCC service cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m", 78, "-[RMConnectionListener initWithQueue:entitlement:tccService:messageHandlerConstructor:]");
  return sub_1000166B0(v24);
}

void sub_1000166B0()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t v29;

  v1 = sub_10000CA5C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"TCC service exists and entitlement does not!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v25, v26, v27, v28, v29);
  }

  v9 = sub_10000CA5C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "TCC service exists and entitlement does not!", "{\"msg%{public}.0s\":\"TCC service exists and entitlement does not!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v25, v26, v27, v28, v29);
  }

  v16 = sub_10000CA5C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"TCC service exists and entitlement does not!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v25, v26, v27, v28, v29);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m", 93, "-[RMConnectionListener isEndpointConnectionAllowed:]");
  sub_1000167CC(v24);
}

void sub_1000167CC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  int v4;
  uint64_t v5;

  v2 = sub_10000CA5C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138477827;
    v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Couldn't create XPC service for %{private}@", (uint8_t *)&v4, 0xCu);
  }

  abort();
}

uint64_t sub_100016844()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000CA5C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"The messageHandler didn't set the endpoint delegate at creation\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000CA5C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "The messageHandler didn't set the endpoint delegate at creation", "{\"msg%{public}.0s\":\"The messageHandler didn't set the endpoint delegate at creation\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000CA5C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"The messageHandler didn't set the endpoint delegate at creation\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m", 148, "-[RMConnectionListener startListeningForService:]_block_invoke");
  return sub_100016960(v24);
}

uint64_t sub_100016960()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000CA5C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Endpoint invalidated with no dataDelegate in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000CA5C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "Endpoint invalidated with no dataDelegate in place", "{\"msg%{public}.0s\":\"Endpoint invalidated with no dataDelegate in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000CA5C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"Endpoint invalidated with no dataDelegate in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/Common/RMConnectionListener.m", 197, "-[RMConnectionListener endpointWasInvalidated:]");
  return sub_100016A7C(v24);
}

uint64_t sub_100016A7C()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000E9B8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000E9B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000E9B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m", 84, "-[RMDataStreamHandler endpoint:didReceiveMessage:withData:replyBlock:]");
  return sub_100016B98(v24);
}

uint64_t sub_100016B98()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000E9B8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000E9B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000E9B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m", 91, "-[RMDataStreamHandler endpoint:didReceiveStreamingRequest:withData:]");
  return sub_100016CB4(v24);
}

uint64_t sub_100016CB4()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000E9B8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000E9B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000E9B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m", 145, "-[RMDataStreamHandler endpoint:shouldStartStreamingDataToReceiver:]");
  return sub_100016DD0(v24);
}

uint64_t sub_100016DD0()
{
  void *v0;
  id v1;
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30;

  v1 = sub_10000E9B8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (sub_10000DB4C(v2))
  {
    sub_10000DACC();
    sub_10000DB2C((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v26, v27, v28, v29, v30);
  }

  v9 = sub_10000E9B8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (sub_10000DB58(v10))
  {
    sub_10000DACC();
    sub_10000DAF8((void *)&_mh_execute_header, v11, v12, v13, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v26, v27, v28, v29, v30);
  }

  v16 = sub_10000E9B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (sub_10000DB40(v17))
  {
    sub_10000DACC();
    sub_10000DB18((void *)&_mh_execute_header, v18, v19, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v20, v21, v22, v23, v26, v27, v28, v29, v30);
  }

  v24 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/RelativeMotion/relatived/RMDataStreamHandler.m", 228, "-[RMDataStreamHandler endpointShouldStopStreamingData:]");
  return sub_100016EEC(v24);
}

#error "100016F5C: call analysis failed (funcsize=58)"

#error "100017074: call analysis failed (funcsize=58)"

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__disableLoggingForReplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disableLoggingForReplay");
}

id objc_msgSend__enableLoggingForReplayWithFilenamePrefix_filePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableLoggingForReplayWithFilenamePrefix:filePath:");
}

id objc_msgSend__feedDisplayCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_feedDisplayCount:");
}

id objc_msgSend__feedFaceKitData_timestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_feedFaceKitData:timestamp:");
}

id objc_msgSend__feedLidAngle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_feedLidAngle:");
}

id objc_msgSend__feedScreenUnlockedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_feedScreenUnlockedEvent:");
}

id objc_msgSend__initWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithOptions:");
}

id objc_msgSend__initWithQueue_entitlement_tccService_messageHandlerConstructor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithQueue:entitlement:tccService:messageHandlerConstructor:");
}

id objc_msgSend__isAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isAvailable");
}

id objc_msgSend__selectActiveAudioRouteForDeviceMotionWithBTAddress_modelID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:");
}

id objc_msgSend__setAudioAccessoryActivityUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAudioAccessoryActivityUpdateInterval:");
}

id objc_msgSend__setAudioAccessoryDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setAudioAccessoryDeviceMotionUpdateInterval:");
}

id objc_msgSend__startAudioAccessoryActivityUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startAudioAccessoryActivityUpdatesToQueue:withHandler:");
}

id objc_msgSend__startAudioAccessoryDeviceMotionStatusUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startAudioAccessoryDeviceMotionStatusUpdatesToQueue:withHandler:");
}

id objc_msgSend__startAudioAccessoryDeviceMotionUpdatesToQueue_lowLatencyMode_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startAudioAccessoryDeviceMotionUpdatesToQueue:lowLatencyMode:withHandler:");
}

id objc_msgSend__startPoseUpdatesToQueue_andHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startPoseUpdatesToQueue:andHandler:");
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stop");
}

id objc_msgSend__stopAudioAccessoryActivityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAudioAccessoryActivityUpdates");
}

id objc_msgSend__stopAudioAccessoryDeviceMotionStatusUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAudioAccessoryDeviceMotionStatusUpdates");
}

id objc_msgSend__stopAudioAccessoryDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopAudioAccessoryDeviceMotionUpdates");
}

id objc_msgSend__triggerUserInteractedWithDeviceEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_triggerUserInteractedWithDeviceEvent");
}

id objc_msgSend__updateClientMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateClientMode:");
}

id objc_msgSend__updateTrackingScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateTrackingScheme:");
}

id objc_msgSend_activeAudioRouteDeviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAudioRouteDeviceID");
}

id objc_msgSend_activeDepthDataFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDepthDataFormat");
}

id objc_msgSend_activeFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeFormat");
}

id objc_msgSend_activityHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityHandler");
}

id objc_msgSend_activityManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityManager");
}

id objc_msgSend_activitySampleRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activitySampleRate");
}

id objc_msgSend_activitySamplesPerSecond(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activitySamplesPerSecond");
}

id objc_msgSend_activitySupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activitySupported");
}

id objc_msgSend_addInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInput:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOutput:");
}

id objc_msgSend_allowBuiltInMetadataCameras(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowBuiltInMetadataCameras");
}

id objc_msgSend_allowBuiltInVideoCameras(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowBuiltInVideoCameras");
}

id objc_msgSend_allowExternalVideoCameras(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowExternalVideoCameras");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attentionAwarenessClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attentionAwarenessClient");
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attitude");
}

id objc_msgSend_audioAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioAccessoryManager");
}

id objc_msgSend_beginConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginConfiguration");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boundingBox(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundingBox");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_callbackBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callbackBlock");
}

id objc_msgSend_cameraID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraID");
}

id objc_msgSend_captureContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureContext");
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDevice");
}

id objc_msgSend_captureDeviceInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureDeviceInput");
}

id objc_msgSend_captureQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureQueue");
}

id objc_msgSend_captureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureSession");
}

id objc_msgSend_chooseBestFormatForFaceKit_forCameraID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chooseBestFormatForFaceKit:forCameraID:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitConfiguration");
}

id objc_msgSend_computeCameraParametersFromDimensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeCameraParametersFromDimensions:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configureCaptureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureCaptureSession");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectionWithMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionWithMediaType:");
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connections");
}

id objc_msgSend_consumedAuxTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consumedAuxTimestamp");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultFieldOfView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultFieldOfView");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deprecatedEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deprecatedEntitlement");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceID");
}

id objc_msgSend_deviceInputWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInputWithDevice:error:");
}

id objc_msgSend_deviceMotionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMotionHandler");
}

id objc_msgSend_deviceMotionStatusHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMotionStatusHandler");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoverySessionWithDeviceTypes_mediaType_position_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverySessionWithDeviceTypes:mediaType:position:");
}

id objc_msgSend_dmSampleRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmSampleRate");
}

id objc_msgSend_dmSamplesPerSecond(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dmSamplesPerSecond");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_endpoint_didReceiveMessage_withData_replyBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint:didReceiveMessage:withData:replyBlock:");
}

id objc_msgSend_endpoint_didReceiveStreamingRequest_withData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint:didReceiveStreamingRequest:withData:");
}

id objc_msgSend_endpoint_shouldStartStreamingDataToReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint:shouldStartStreamingDataToReceiver:");
}

id objc_msgSend_endpointShouldStopStreamingData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointShouldStopStreamingData:");
}

id objc_msgSend_endpointWasInterrupted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointWasInterrupted:");
}

id objc_msgSend_endpointWasInvalidated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointWasInvalidated:");
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlement");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMask");
}

id objc_msgSend_externalDisplayService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalDisplayService");
}

id objc_msgSend_faceId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceId");
}

id objc_msgSend_faceKit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceKit");
}

id objc_msgSend_facePoseCaptureSessionDidConfigure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "facePoseCaptureSessionDidConfigure:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_forceSessionRestart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceSessionRestart");
}

id objc_msgSend_formatDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatDescription");
}

id objc_msgSend_formats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formats");
}

id objc_msgSend_frameRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameRate");
}

id objc_msgSend_getConnectedDisplayInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConnectedDisplayInfoWithCompletionHandler:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCVPixelBuffer_orientation_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCVPixelBuffer:orientation:options:");
}

id objc_msgSend_initWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCompletionHandler:");
}

id objc_msgSend_initWithConfiguration_receiverQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:receiverQueue:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithEndpoint_isInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEndpoint:isInternal:");
}

id objc_msgSend_initWithEndpoint_managedListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEndpoint:managedListener:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithQueue_entitlement_messageHandlerConstructor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:entitlement:messageHandlerConstructor:");
}

id objc_msgSend_initWithQueue_entitlement_tccService_messageHandlerConstructor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:entitlement:tccService:messageHandlerConstructor:");
}

id objc_msgSend_initWithReceiverQueue_requireActivitySupport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReceiverQueue:requireActivitySupport:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUniqueIdentifier_tempestOptions_forceSessionRestart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUniqueIdentifier:tempestOptions:forceSessionRestart:");
}

id objc_msgSend_initWithUniqueIdentifier_updateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUniqueIdentifier:updateInterval:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internal");
}

id objc_msgSend_intervalInNanoSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intervalInNanoSeconds");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isBuiltInCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBuiltInCamera");
}

id objc_msgSend_isCameraPaused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCameraPaused");
}

id objc_msgSend_isContinuityCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContinuityCamera");
}

id objc_msgSend_isDeviceMotionActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceMotionActive");
}

id objc_msgSend_isEndpointConnectionAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEndpointConnectionAllowed:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExposureModeSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExposureModeSupported:");
}

id objc_msgSend_isFaceTrackingSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFaceTrackingSupported");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isRequestingCameraOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRequestingCameraOn");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isTempestActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTempestActive");
}

id objc_msgSend_isVideoBinned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVideoBinned");
}

id objc_msgSend_lastActivityPrintTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastActivityPrintTime");
}

id objc_msgSend_lastActivitySampleTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastActivitySampleTime");
}

id objc_msgSend_lastDMPrintTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDMPrintTime");
}

id objc_msgSend_lastDMSampleTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDMSampleTime");
}

id objc_msgSend_lastDeviceStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDeviceStatus");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastUserInteractionUpdateTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUserInteractionUpdateTimestamp");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lidAngle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lidAngle");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_lockForConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockForConfiguration:");
}

id objc_msgSend_machAbsTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machAbsTimestamp");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_managers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managers");
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapTableWithKeyOptions:valueOptions:");
}

id objc_msgSend_maxFrameRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxFrameRate");
}

id objc_msgSend_maxNumberOfCameras(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxNumberOfCameras");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaType");
}

id objc_msgSend_messageHandlerConstructor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageHandlerConstructor");
}

id objc_msgSend_metadataOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataOutput");
}

id objc_msgSend_minFrameRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minFrameRate");
}

id objc_msgSend_modelID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelID");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_motionActivityActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionActivityActive");
}

id objc_msgSend_mslLoggingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mslLoggingEnabled");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_networkFailureThresholdMultiplier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkFailureThresholdMultiplier");
}

id objc_msgSend_notifyClientWithStatusConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyClientWithStatusConnected:");
}

id objc_msgSend_notifyConnectedToClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyConnectedToClient");
}

id objc_msgSend_notifyDisconnectedToClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyDisconnectedToClient");
}

id objc_msgSend_numberOfCameras(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfCameras");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_outputDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputDevices");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputs");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_performRequests_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRequests:error:");
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pitch");
}

id objc_msgSend_postAudioRouteChangeCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postAudioRouteChangeCompleted");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateMatchingIdentifier:");
}

id objc_msgSend_producerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "producerQueue");
}

id objc_msgSend_producerTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "producerTimer");
}

id objc_msgSend_quaternion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quaternion");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_receivedAuxTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedAuxTimestamp");
}

id objc_msgSend_receiverQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiverQueue");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeInput:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeOutput:");
}

id objc_msgSend_requireActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireActivity");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_resumeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeWithError:");
}

id objc_msgSend_roll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roll");
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "running");
}

id objc_msgSend_sendUserInteractionUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendUserInteractionUpdate");
}

id objc_msgSend_setActiveAudioRouteDeviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveAudioRouteDeviceID:");
}

id objc_msgSend_setActiveDepthDataFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveDepthDataFormat:");
}

id objc_msgSend_setActiveFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveFormat:");
}

id objc_msgSend_setActiveMaxExposureDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveMaxExposureDuration:");
}

id objc_msgSend_setActiveVideoMaxFrameDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveVideoMaxFrameDuration:");
}

id objc_msgSend_setActiveVideoMinFrameDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveVideoMinFrameDuration:");
}

id objc_msgSend_setActivityHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityHandler:");
}

id objc_msgSend_setActivityManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityManager:");
}

id objc_msgSend_setActivitySampleRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivitySampleRate:");
}

id objc_msgSend_setActivitySamplesPerSecond_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivitySamplesPerSecond:");
}

id objc_msgSend_setActivitySupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivitySupported:");
}

id objc_msgSend_setAlwaysDiscardsLateVideoFrames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlwaysDiscardsLateVideoFrames:");
}

id objc_msgSend_setAttentionAwarenessClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttentionAwarenessClient:");
}

id objc_msgSend_setAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttentionLostTimeout:");
}

id objc_msgSend_setAudioAccessoryManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioAccessoryManager:");
}

id objc_msgSend_setBuiltInCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuiltInCamera:");
}

id objc_msgSend_setCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallbackBlock:");
}

id objc_msgSend_setCameraID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraID:");
}

id objc_msgSend_setCameraPaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraPaused:");
}

id objc_msgSend_setCaptureDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureDevice:");
}

id objc_msgSend_setCaptureDeviceInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureDeviceInput:");
}

id objc_msgSend_setCaptureSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureSession:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfiguration_shouldReset_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:shouldReset:error:");
}

id objc_msgSend_setConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnections:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeprecatedEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeprecatedEntitlement:");
}

id objc_msgSend_setDeviceMotionActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionActive:");
}

id objc_msgSend_setDeviceMotionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionHandler:");
}

id objc_msgSend_setDeviceMotionStatusHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionStatusHandler:");
}

id objc_msgSend_setDmSampleRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDmSampleRate:");
}

id objc_msgSend_setDmSamplesPerSecond_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDmSamplesPerSecond:");
}

id objc_msgSend_setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndpoint:");
}

id objc_msgSend_setEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEntitlement:");
}

id objc_msgSend_setEventHandlerWithQueue_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandlerWithQueue:block:");
}

id objc_msgSend_setEventMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventMask:");
}

id objc_msgSend_setExternalDisplayService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExternalDisplayService:");
}

id objc_msgSend_setFaceKit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceKit:");
}

id objc_msgSend_setFaceTrackingFailureFieldOfViewModifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceTrackingFailureFieldOfViewModifier:");
}

id objc_msgSend_setFaceTrackingMaxFaces_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceTrackingMaxFaces:");
}

id objc_msgSend_setFaceTrackingMetadataObjectTypesAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceTrackingMetadataObjectTypesAvailable:");
}

id objc_msgSend_setFaceTrackingNetworkFailureThresholdMultiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceTrackingNetworkFailureThresholdMultiplier:");
}

id objc_msgSend_setFaceTrackingUsesFaceRecognition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFaceTrackingUsesFaceRecognition:");
}

id objc_msgSend_setForceSessionRestart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceSessionRestart:");
}

id objc_msgSend_setGeometricDistortionCorrectionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeometricDistortionCorrectionEnabled:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInputFaceObservations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputFaceObservations:");
}

id objc_msgSend_setIntervalInNanoSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntervalInNanoSeconds:");
}

id objc_msgSend_setLastActivityPrintTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastActivityPrintTime:");
}

id objc_msgSend_setLastActivitySampleTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastActivitySampleTime:");
}

id objc_msgSend_setLastDMPrintTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastDMPrintTime:");
}

id objc_msgSend_setLastDMSampleTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastDMSampleTime:");
}

id objc_msgSend_setLastDeviceStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastDeviceStatus:");
}

id objc_msgSend_setLastUserInteractionUpdateTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastUserInteractionUpdateTimestamp:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setManagers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagers:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setMessageHandlerConstructor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageHandlerConstructor:");
}

id objc_msgSend_setMetadataObjectTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadataObjectTypes:");
}

id objc_msgSend_setMetadataObjectsDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadataObjectsDelegate:queue:");
}

id objc_msgSend_setMetadataOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadataOutput:");
}

id objc_msgSend_setMotionActivityActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionActivityActive:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setProducerQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProducerQueue:");
}

id objc_msgSend_setProducerTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProducerTimer:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setReceiverQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReceiverQueue:");
}

id objc_msgSend_setRequireActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequireActivity:");
}

id objc_msgSend_setRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunning:");
}

id objc_msgSend_setSampleBufferDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSampleBufferDelegate:queue:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setStatusUpdatesActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusUpdatesActive:");
}

id objc_msgSend_setSubscribedToStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubscribedToStatus:");
}

id objc_msgSend_setSupportsFaceKitMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsFaceKitMetadata:");
}

id objc_msgSend_setTccService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTccService:");
}

id objc_msgSend_setTempestActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTempestActive:");
}

id objc_msgSend_setTempestOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTempestOptions:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setVideoDataOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoDataOutput:");
}

id objc_msgSend_setVideoMirrored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoMirrored:");
}

id objc_msgSend_setVideoSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoSettings:");
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBacklight");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedSystemAudioContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSystemAudioContext");
}

id objc_msgSend_shouldActivateActivityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldActivateActivityUpdates");
}

id objc_msgSend_shouldActivateDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldActivateDeviceMotionUpdates");
}

id objc_msgSend_shouldActivateStatusUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldActivateStatusUpdates");
}

id objc_msgSend_startActivityUpdatesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startActivityUpdatesWithHandler:");
}

id objc_msgSend_startCaptureSessionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCaptureSessionWithHandler:");
}

id objc_msgSend_startDeviceMotionUpdatesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeviceMotionUpdatesWithHandler:");
}

id objc_msgSend_startFaceKitForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startFaceKitForContext:");
}

id objc_msgSend_startLidAngleUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLidAngleUpdates");
}

id objc_msgSend_startMonitoringActiveAudioRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringActiveAudioRoute");
}

id objc_msgSend_startMslLogging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMslLogging");
}

id objc_msgSend_startMslLoggingWithFilenamePrefix_filePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMslLoggingWithFilenamePrefix:filePath:");
}

id objc_msgSend_startOrStopActivityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOrStopActivityUpdates");
}

id objc_msgSend_startOrStopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOrStopDeviceMotionUpdates");
}

id objc_msgSend_startOrStopStatusUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOrStopStatusUpdates");
}

id objc_msgSend_startProducingDataForObject_tempestOptions_forceSessionRestart_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startProducingDataForObject:tempestOptions:forceSessionRestart:callback:");
}

id objc_msgSend_startProducingDataWithCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startProducingDataWithCallback:");
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRunning");
}

id objc_msgSend_startStatusUpdatesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStatusUpdatesWithHandler:");
}

id objc_msgSend_startUserInteractionUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUserInteractionUpdatesToQueue:withHandler:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stationary");
}

id objc_msgSend_statusUpdatesActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusUpdatesActive");
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopActivityUpdates");
}

id objc_msgSend_stopCaptureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopCaptureSession");
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDeviceMotionUpdates");
}

id objc_msgSend_stopFaceKitForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopFaceKitForContext:");
}

id objc_msgSend_stopLidAngleUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopLidAngleUpdates");
}

id objc_msgSend_stopMonitoringActiveAudioRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMonitoringActiveAudioRoute");
}

id objc_msgSend_stopMslLogging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopMslLogging");
}

id objc_msgSend_stopProducingData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopProducingData");
}

id objc_msgSend_stopProducingDataForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopProducingDataForObject:");
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRunning");
}

id objc_msgSend_stopStatusUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopStatusUpdates");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subscribedToStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribedToStatus");
}

id objc_msgSend_supportedDepthDataFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedDepthDataFormats");
}

id objc_msgSend_supportsFaceKitMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFaceKitMetadata");
}

id objc_msgSend_supportsOpportunisticAnchoredTracking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsOpportunisticAnchoredTracking");
}

id objc_msgSend_suspendWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspendWithError:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskState");
}

id objc_msgSend_tccService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tccService");
}

id objc_msgSend_tempestOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tempestOptions");
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "time");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_trackingFailureFieldOfViewModifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingFailureFieldOfViewModifier");
}

id objc_msgSend_traverseEndpointsAsynchronously_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traverseEndpointsAsynchronously:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueID");
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unknown");
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockForConfiguration");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateActiveAudioRouteDeviceIDAllowingSimulatedCrash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:");
}

id objc_msgSend_updateActivityForCurrentRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateActivityForCurrentRoute");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInteractionMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInteractionMonitor");
}

id objc_msgSend_videoDataOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoDataOutput");
}

id objc_msgSend_videoSupportedFrameRateRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoSupportedFrameRateRanges");
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walking");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_yaw(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "yaw");
}

