@implementation ARSessionDebugLogger

- (ARSessionDebugLogger)initWithSession:(id)a3
{
  id v4;
  ARSessionDebugLogger *v5;
  ARSessionDebugLogger *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSessionDebugLogger;
  v5 = -[ARSessionDebugLogger init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_session, v4);
    objc_msgSend(v4, "_addObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  objc_msgSend(WeakRetained, "_removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ARSessionDebugLogger;
  -[ARSessionDebugLogger dealloc](&v4, "dealloc");
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  __CFString *v14;

  v5 = a3;
  v6 = sub_10053A528();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (a4 >= 3)
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a4));
    else
      v8 = off_1011BAAB0[a4];
    *(_DWORD *)buf = 136315650;
    v10 = "-[ARSessionDebugLogger session:didChangeState:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%@:%@", buf, 0x20u);

  }
}

- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  char isKindOfClass;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(ARCustomTechniquesConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);
  v11 = sub_10053A528();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((isKindOfClass & 1) != 0)
  {
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "templateConfiguration"));
      v15 = 136316162;
      v16 = "-[ARSessionDebugLogger session:requestedRunWithConfiguration:options:]";
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = (unint64_t)v14;
      v23 = 2048;
      v24 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:%@:%@(%@)%lu", (uint8_t *)&v15, 0x34u);

    }
  }
  else if (v13)
  {
    v15 = 136315906;
    v16 = "-[ARSessionDebugLogger session:requestedRunWithConfiguration:options:]";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:%@:%@:%lu", (uint8_t *)&v15, 0x2Au);
  }

}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(ARCustomTechniquesConfiguration);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);
  v9 = sub_10053A528();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((isKindOfClass & 1) != 0)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "templateConfiguration"));
      v13 = 136315906;
      v14 = "-[ARSessionDebugLogger session:willRunWithConfiguration:]";
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%@:%@(%@)", (uint8_t *)&v13, 0x2Au);

    }
  }
  else if (v11)
  {
    v13 = 136315650;
    v14 = "-[ARSessionDebugLogger session:willRunWithConfiguration:]";
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%@:%@", (uint8_t *)&v13, 0x20u);
  }

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vlState"));
  objc_msgSend(v7, "timeSinceLastLocalization");
  v9 = v8;

  if (v9 > 0.0)
  {
    v10 = sub_10053A528();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vlState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vlState"));
      objc_msgSend(v13, "timeSinceLastLocalization");
      v15 = v14;
      objc_msgSend(v6, "heading");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));
      objc_msgSend(v6, "rawHeading");
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rawLocation"));
      objc_msgSend(v6, "rawLocationTimestamp");
      v23 = 136317442;
      v24 = "-[ARSessionDebugLogger session:didUpdateFrame:]";
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v12;
      v31 = 2048;
      v32 = v15;
      v33 = 2048;
      v34 = v17;
      v35 = 2112;
      v36 = v18;
      v37 = 2048;
      v38 = v20;
      v39 = 2112;
      v40 = v21;
      v41 = 2048;
      v42 = v22;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%@:%@:vlState=%@:timeSinceLastLocalization=%f:heading=%f:location=%@:rawHeading=%f:rawLocation=%@:rawLocationTimestamp=%f", (uint8_t *)&v23, 0x66u);

    }
  }

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = sub_10053A528();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315650;
    v10 = "-[ARSessionDebugLogger session:didFailWithError:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s:%@:%@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  unint64_t v12;
  __CFString *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;

  v5 = a3;
  v6 = a4;
  v7 = sub_10053A528();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (unint64_t)objc_msgSend(v6, "trackingState");
    if (v9 >= 3)
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v9));
    else
      v10 = off_1011BAAC8[v9];
    v11 = v10;
    v12 = (unint64_t)objc_msgSend(v6, "trackingStateReason");
    if (v12 >= 5)
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), v12));
    else
      v13 = off_1011BAAE0[v12];
    *(_DWORD *)buf = 136316162;
    v15 = "-[ARSessionDebugLogger session:cameraDidChangeTrackingState:]";
    v16 = 2112;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%@:%@:state=%@:reason=%@", buf, 0x34u);

  }
}

- (void)sessionWasInterrupted:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_10053A528();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[ARSessionDebugLogger sessionWasInterrupted:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sessionInterruptionEnded:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;

  v3 = a3;
  v4 = sub_10053A528();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[ARSessionDebugLogger sessionInterruptionEnded:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v5 = a3;
  v6 = a4;
  v7 = sub_10053A528();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = NSStringFromARGeoTrackingState(objc_msgSend(v6, "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = NSStringFromARGeoTrackingStateReason(objc_msgSend(v6, "stateReason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromARGeoTrackingAccuracy(objc_msgSend(v6, "accuracy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = 136316418;
    v16 = "-[ARSessionDebugLogger session:didChangeGeoTrackingStatus:]";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%@:%@:state=%@:reason=%@:accuracy=%@", (uint8_t *)&v15, 0x3Eu);

  }
}

- (ARSession)session
{
  return (ARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
}

@end
