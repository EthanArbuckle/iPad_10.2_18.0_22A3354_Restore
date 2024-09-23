@implementation RTNetworkOfInterestManager

- (RTNetworkOfInterestManager)init
{
  id v3;
  RTNetworkOfInterestManager *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DB0688]);
  v4 = -[RTNetworkOfInterestManager initWithNoiManager:](self, "initWithNoiManager:", v3);

  return v4;
}

- (RTNetworkOfInterestManager)initWithNoiManager:(id)a3
{
  id v5;
  RTNetworkOfInterestManager *v6;
  RTNetworkOfInterestManager *v7;
  RTNetworkOfInterestManager *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTNetworkOfInterestManager;
    v6 = -[RTNotifier init](&v11, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_noiManager, a3);
      v7->_cellLinkQuality = 0;
      v7->_wifiLinkQuality = 0;
      -[RTService setup](v7, "setup");
    }
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: noiManager", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[RTNetworkOfInterestManager noiManager](self, "noiManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueue:", v4);

  -[RTNetworkOfInterestManager noiManager](self, "noiManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[RTNetworkOfInterestManager noiManager](self, "noiManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackNOIAnyForInterfaceType:options:", 2, 0);

  -[RTNetworkOfInterestManager noiManager](self, "noiManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackNOIAnyForInterfaceType:options:", 1, 0);

}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RTNetworkOfInterestManager setCellLinkQuality:](self, "setCellLinkQuality:", 0);
  -[RTNetworkOfInterestManager cellNoi](self, "cellNoi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTNetworkOfInterestManager cellNoi](self, "cellNoi");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("linkQuality"));

    -[RTNetworkOfInterestManager setCellNoi:](self, "setCellNoi:", 0);
  }
  -[RTNetworkOfInterestManager setWifiLinkQuality:](self, "setWifiLinkQuality:", 0);
  -[RTNetworkOfInterestManager wifiNoi](self, "wifiNoi");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTNetworkOfInterestManager wifiNoi](self, "wifiNoi");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("linkQuality"));

    -[RTNetworkOfInterestManager setWifiNoi:](self, "setWifiNoi:", 0);
  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v8 = v9;
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTNetworkOfInterestManagerCellLinkQualityChangedNotification, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[RTNetworkOfInterestManager getCellLinkQualityNotification](self, "getCellLinkQualityNotification");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v10;
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v10, v6);

    goto LABEL_11;
  }
  +[RTNotification notificationName](RTNetworkOfInterestManagerWifiLinkQualityChangedNotification, "notificationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  if (v12)
  {
    -[RTNetworkOfInterestManager getWifiLinkQualityNotification](self, "getWifiLinkQualityNotification");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  _rt_log_facility_get_os_log(RTLogFacilityReachability);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = "-[RTNetworkOfInterestManager internalAddObserver:name:]";
    v18 = 2112;
    v19 = (const char *)v7;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s, unsupported notification, %@", (uint8_t *)&v16, 0x16u);
  }

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412802;
    v17 = (const char *)v7;
    v18 = 2080;
    v19 = "-[RTNetworkOfInterestManager internalAddObserver:name:]";
    v20 = 1024;
    v21 = 123;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v16, 0x1Cu);
  }

LABEL_11:
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[RTNotification notificationName](RTNetworkOfInterestManagerCellLinkQualityChangedNotification, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    +[RTNotification notificationName](RTNetworkOfInterestManagerWifiLinkQualityChangedNotification, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v11, 0xCu);
      }

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412802;
        v12 = v4;
        v13 = 2080;
        v14 = "-[RTNetworkOfInterestManager internalRemoveObserver:name:]";
        v15 = 1024;
        v16 = 137;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "unsupported notification, %@ (in %s:%d)", (uint8_t *)&v11, 0x1Cu);
      }

    }
  }

}

- (void)didStartTrackingNOI:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTNetworkOfInterestManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__RTNetworkOfInterestManager_didStartTrackingNOI___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__RTNetworkOfInterestManager_didStartTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "interface");
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_didStartTrackingWifiNOI:", *(_QWORD *)(a1 + 32));
  }
  else if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_didStartTrackingCellNOI:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityReachability);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "interface");
      v5 = 136315394;
      v6 = "-[RTNetworkOfInterestManager didStartTrackingNOI:]_block_invoke";
      v7 = 1024;
      v8 = v4;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%s, received noi for unsupported interface, %d", (uint8_t *)&v5, 0x12u);
    }

  }
}

- (void)_didStartTrackingCellNOI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "interface") == 2)
    {
      -[RTNetworkOfInterestManager cellNoi](self, "cellNoi");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[RTNetworkOfInterestManager setCellNoi:](self, "setCellNoi:", v5);
        -[RTNetworkOfInterestManager cellNoi](self, "cellNoi");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("linkQuality"), 5, 0);

        goto LABEL_11;
      }
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        v8 = "received second cell noi";
LABEL_8:
        v9 = v7;
        v10 = 2;
LABEL_14:
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[RTNetworkOfInterestManager _didStartTrackingCellNOI:]";
        v14 = 2048;
        v15 = objc_msgSend(v5, "interface");
        v8 = "%s, interface, %ld, is not cell";
        v9 = v7;
        v10 = 22;
        goto LABEL_14;
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v8 = "Invalid parameter not satisfying: cellNoi";
      goto LABEL_8;
    }
  }

LABEL_11:
}

- (void)_didStartTrackingWifiNOI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "interface") == 1)
    {
      -[RTNetworkOfInterestManager wifiNoi](self, "wifiNoi");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[RTNetworkOfInterestManager setWifiNoi:](self, "setWifiNoi:", v5);
        -[RTNetworkOfInterestManager wifiNoi](self, "wifiNoi");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("linkQuality"), 5, 0);

        goto LABEL_11;
      }
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        v8 = "received second wifi noi";
LABEL_8:
        v9 = v7;
        v10 = 2;
LABEL_14:
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[RTNetworkOfInterestManager _didStartTrackingWifiNOI:]";
        v14 = 2048;
        v15 = objc_msgSend(v5, "interface");
        v8 = "%s, interface, %ld, is not wifi";
        v9 = v7;
        v10 = 22;
        goto LABEL_14;
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v8 = "Invalid parameter not satisfying: wifiNoi";
      goto LABEL_8;
    }
  }

LABEL_11:
}

- (void)didStopTrackingNOI:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTNetworkOfInterestManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__RTNetworkOfInterestManager_didStopTrackingNOI___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__RTNetworkOfInterestManager_didStopTrackingNOI___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "interface");
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_didStopTrackingWifiNOI:", *(_QWORD *)(a1 + 32));
  }
  else if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_didStopTrackingCellNOI:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityReachability);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "interface");
      v5 = 136315394;
      v6 = "-[RTNetworkOfInterestManager didStopTrackingNOI:]_block_invoke";
      v7 = 1024;
      v8 = v4;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%s, received noi for unsupported interface, %d", (uint8_t *)&v5, 0x12u);
    }

  }
}

- (void)_didStopTrackingCellNOI:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    LOWORD(v12) = 0;
    v9 = "Invalid parameter not satisfying: cellNoi";
    v10 = v8;
    v11 = 2;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    goto LABEL_7;
  }
  -[RTNetworkOfInterestManager cellNoi](self, "cellNoi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityReachability);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = 136315394;
    v13 = "-[RTNetworkOfInterestManager _didStopTrackingCellNOI:]";
    v14 = 2112;
    v15 = v4;
    v9 = "%s, unrecognized noi, %@";
    v10 = v8;
    v11 = 22;
    goto LABEL_10;
  }
  -[RTNetworkOfInterestManager cellNoi](self, "cellNoi");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("linkQuality"));

  -[RTNetworkOfInterestManager setCellNoi:](self, "setCellNoi:", 0);
  -[RTNetworkOfInterestManager setCellLinkQuality:](self, "setCellLinkQuality:", 0);
LABEL_8:

}

- (void)_didStopTrackingWifiNOI:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    LOWORD(v12) = 0;
    v9 = "Invalid parameter not satisfying: wifiNoi";
    v10 = v8;
    v11 = 2;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    goto LABEL_7;
  }
  -[RTNetworkOfInterestManager wifiNoi](self, "wifiNoi");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityReachability);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v12 = 136315394;
    v13 = "-[RTNetworkOfInterestManager _didStopTrackingWifiNOI:]";
    v14 = 2112;
    v15 = v4;
    v9 = "%s, unrecognized noi, %@";
    v10 = v8;
    v11 = 22;
    goto LABEL_10;
  }
  -[RTNetworkOfInterestManager wifiNoi](self, "wifiNoi");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("linkQuality"));

  -[RTNetworkOfInterestManager setWifiNoi:](self, "setWifiNoi:", 0);
  -[RTNetworkOfInterestManager setWifiLinkQuality:](self, "setWifiLinkQuality:", 0);
LABEL_8:

}

- (void)_processCellNetworkOfInterestChange:(int64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[RTNetworkOfInterestManager convertLinkQuality:](self, "convertLinkQuality:", a3);
  v5 = -[RTNetworkOfInterestManager cellLinkQuality](self, "cellLinkQuality");
  _rt_log_facility_get_os_log(RTLogFacilityReachability);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 == v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      RTLinkQualityToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[RTNetworkOfInterestManager _processCellNetworkOfInterestChange:]";
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%s, no change in linkQuality, %@", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[RTNetworkOfInterestManager cellLinkQuality](self, "cellLinkQuality");
      RTLinkQualityToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      RTLinkQualityToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[RTNetworkOfInterestManager _processCellNetworkOfInterestChange:]";
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, linkQuality changed from, %@, to, %@", (uint8_t *)&v11, 0x20u);

    }
    -[RTNetworkOfInterestManager setCellLinkQuality:](self, "setCellLinkQuality:", v4);
    -[RTNetworkOfInterestManager getCellLinkQualityNotification](self, "getCellLinkQualityNotification");
    v7 = objc_claimAutoreleasedReturnValue();
    -[RTNotifier postNotification:](self, "postNotification:", v7);
  }

}

- (void)_processWifiNetworkOfInterestChange:(int64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[RTNetworkOfInterestManager convertLinkQuality:](self, "convertLinkQuality:", a3);
  v5 = -[RTNetworkOfInterestManager wifiLinkQuality](self, "wifiLinkQuality");
  _rt_log_facility_get_os_log(RTLogFacilityReachability);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 == v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      RTLinkQualityToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[RTNetworkOfInterestManager _processWifiNetworkOfInterestChange:]";
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%s, no change in linkQuality, %@", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[RTNetworkOfInterestManager wifiLinkQuality](self, "wifiLinkQuality");
      RTLinkQualityToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      RTLinkQualityToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[RTNetworkOfInterestManager _processWifiNetworkOfInterestChange:]";
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, linkQuality changed from, %@, to, %@", (uint8_t *)&v11, 0x20u);

    }
    -[RTNetworkOfInterestManager setWifiLinkQuality:](self, "setWifiLinkQuality:", v4);
    -[RTNetworkOfInterestManager getWifiLinkQualityNotification](self, "getWifiLinkQualityNotification");
    v7 = objc_claimAutoreleasedReturnValue();
    -[RTNotifier postNotification:](self, "postNotification:", v7);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__RTNetworkOfInterestManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E92978E8;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __77__RTNetworkOfInterestManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[RTNetworkOfInterestManager cellNoi](self, "cellNoi");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[RTNetworkOfInterestManager _processCellNetworkOfInterestChange:](self, "_processCellNetworkOfInterestChange:", objc_msgSend(v7, "linkQuality"));
  }
  else
  {
    -[RTNetworkOfInterestManager wifiNoi](self, "wifiNoi");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqual:", v10);

    if (v11)
    {
      -[RTNetworkOfInterestManager _processWifiNetworkOfInterestChange:](self, "_processWifiNetworkOfInterestChange:", objc_msgSend(v7, "linkQuality"));
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityReachability);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "-[RTNetworkOfInterestManager _observeValueForKeyPath:ofObject:change:context:]";
        v15 = 2112;
        v16 = v7;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%s, Unexpected noi, %@", (uint8_t *)&v13, 0x16u);
      }

    }
  }

}

- (unint64_t)convertLinkQuality:(int64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = 3;
  v4 = 4;
  if (a3 != 100)
    v4 = 0;
  if (a3 != 50)
    v3 = v4;
  v5 = 1;
  v6 = 2;
  if (a3 != 20)
    v6 = 0;
  if (a3)
    v5 = v6;
  if (a3 <= 49)
    return v5;
  else
    return v3;
}

- (id)getCellLinkQualityNotification
{
  return -[RTNetworkOfInterestManagerCellLinkQualityChangedNotification initWithLinkQuality:]([RTNetworkOfInterestManagerCellLinkQualityChangedNotification alloc], "initWithLinkQuality:", -[RTNetworkOfInterestManager cellLinkQuality](self, "cellLinkQuality"));
}

- (id)getWifiLinkQualityNotification
{
  return -[RTNetworkOfInterestManagerWifiLinkQualityChangedNotification initWithLinkQuality:]([RTNetworkOfInterestManagerWifiLinkQualityChangedNotification alloc], "initWithLinkQuality:", -[RTNetworkOfInterestManager wifiLinkQuality](self, "wifiLinkQuality"));
}

- (NWNetworkOfInterestManager)noiManager
{
  return self->_noiManager;
}

- (void)setNoiManager:(id)a3
{
  objc_storeStrong((id *)&self->_noiManager, a3);
}

- (NWNetworkOfInterest)cellNoi
{
  return self->_cellNoi;
}

- (void)setCellNoi:(id)a3
{
  objc_storeStrong((id *)&self->_cellNoi, a3);
}

- (NWNetworkOfInterest)wifiNoi
{
  return self->_wifiNoi;
}

- (void)setWifiNoi:(id)a3
{
  objc_storeStrong((id *)&self->_wifiNoi, a3);
}

- (unint64_t)cellLinkQuality
{
  return self->_cellLinkQuality;
}

- (void)setCellLinkQuality:(unint64_t)a3
{
  self->_cellLinkQuality = a3;
}

- (unint64_t)wifiLinkQuality
{
  return self->_wifiLinkQuality;
}

- (void)setWifiLinkQuality:(unint64_t)a3
{
  self->_wifiLinkQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiNoi, 0);
  objc_storeStrong((id *)&self->_cellNoi, 0);
  objc_storeStrong((id *)&self->_noiManager, 0);
}

@end
