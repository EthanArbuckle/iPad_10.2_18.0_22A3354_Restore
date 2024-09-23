@implementation SAPowerLog

- (void)ingestTAEvent:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v16;
    if (objc_msgSend(v6, "hasArrivalDate") && objc_msgSend(v6, "hasDepartureDate"))
    {
      -[SAPowerLog setVisitCount:](self, "setVisitCount:", -[SAPowerLog visitCount](self, "visitCount") + 1);
      objc_msgSend(v6, "departureDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "arrivalDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;
      -[SAPowerLog totalVisitDuration](self, "totalVisitDuration");
      -[SAPowerLog setTotalVisitDuration:](self, "setTotalVisitDuration:", v10 + v11);

    }
    v5 = v16;
  }
  objc_msgSend(v5, "getDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAPowerLog startTimestamp](self, "startTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v13);
  v15 = v14;

  if (v15 >= 14400.0)
    -[SAPowerLog sendPowerLog](self, "sendPowerLog");

}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (SAPowerLog)initWithClock:(id)a3 isReplay:(BOOL)a4
{
  id v7;
  SAPowerLog *v8;
  NSMutableSet *v9;
  NSMutableSet *monitoredDevices;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SAPowerLog;
  v8 = -[SAPowerLog init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    monitoredDevices = v8->_monitoredDevices;
    v8->_monitoredDevices = v9;

    objc_storeStrong((id *)&v8->_clock, a3);
    v8->_isReplay = a4;
    -[SAPowerLog resetStatistics](v8, "resetStatistics");
  }

  return v8;
}

- (void)resetStatistics
{
  void *v3;
  id v4;

  -[SATimeServiceProtocol getCurrentTime](self->_clock, "getCurrentTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAPowerLog setStartTimestamp:](self, "setStartTimestamp:", v3);

  -[SAPowerLog setVisitCount:](self, "setVisitCount:", 0);
  -[SAPowerLog setTotalVisitDuration:](self, "setTotalVisitDuration:", 0.0);
  -[SAPowerLog setBtScanCount:](self, "setBtScanCount:", 0);
  -[SAPowerLog setGeofenceCount:](self, "setGeofenceCount:", 0);
  -[SAPowerLog setGpsLocationRequestCount:](self, "setGpsLocationRequestCount:", 0);
  -[SAPowerLog setWifiLocationRequestCount:](self, "setWifiLocationRequestCount:", 0);
  -[SAPowerLog setSeparationAlertsCount:](self, "setSeparationAlertsCount:", 0);
  -[SAPowerLog monitoredDevices](self, "monitoredDevices");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)sendPowerLog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  _QWORD v26[9];
  _QWORD v27[11];

  v27[9] = *MEMORY[0x1E0C80C00];
  if (!self->_isReplay)
  {
    v26[0] = CFSTR("timestamp");
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[SAPowerLog startTimestamp](self, "startTimestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    objc_msgSend(v3, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v18;
    v26[1] = CFSTR("NumberOfVisits");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAPowerLog visitCount](self, "visitCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v17;
    v26[2] = CFSTR("DurationOfVisits");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[SAPowerLog totalVisitDuration](self, "totalVisitDuration");
    objc_msgSend(v4, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v16;
    v26[3] = CFSTR("TotalGeoFence");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAPowerLog geofenceCount](self, "geofenceCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v5;
    v26[4] = CFSTR("BTScanCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAPowerLog btScanCount](self, "btScanCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v6;
    v26[5] = CFSTR("Notifications");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAPowerLog separationAlertsCount](self, "separationAlertsCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v7;
    v26[6] = CFSTR("DevicesMonitored");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[SAPowerLog monitoredDevices](self, "monitoredDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[6] = v10;
    v26[7] = CFSTR("GPSAttribution");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAPowerLog gpsLocationRequestCount](self, "gpsLocationRequestCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[7] = v11;
    v26[8] = CFSTR("WifiScanCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SAPowerLog wifiLocationRequestCount](self, "wifiLocationRequestCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[8] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    v15 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289283;
      v21 = 0;
      v22 = 2082;
      v23 = "";
      v24 = 2113;
      v25 = v14;
      _os_log_impl(&dword_1CA04F000, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#sa submitting PowerLog event\", \"data\":\"%{private}@\"}", buf, 0x1Cu);
    }
    PLLogRegisteredEvent();
    CFRelease(v14);
    CFRelease(CFSTR("SeparationAlert"));
    -[SAPowerLog resetStatistics](self, "resetStatistics");

  }
}

- (void)increaseBTScanCount
{
  -[SAPowerLog setBtScanCount:](self, "setBtScanCount:", -[SAPowerLog btScanCount](self, "btScanCount") + 1);
}

- (void)increaseGeofenceCount
{
  -[SAPowerLog setGeofenceCount:](self, "setGeofenceCount:", -[SAPowerLog geofenceCount](self, "geofenceCount") + 1);
}

- (void)increaseGpsLocationRequestCount
{
  -[SAPowerLog setGpsLocationRequestCount:](self, "setGpsLocationRequestCount:", -[SAPowerLog gpsLocationRequestCount](self, "gpsLocationRequestCount") + 1);
}

- (void)increaseWifiLocationRequestCount
{
  -[SAPowerLog setWifiLocationRequestCount:](self, "setWifiLocationRequestCount:", -[SAPowerLog wifiLocationRequestCount](self, "wifiLocationRequestCount") + 1);
}

- (void)increaseSeparationAlertsCount:(unint64_t)a3
{
  -[SAPowerLog setSeparationAlertsCount:](self, "setSeparationAlertsCount:", -[SAPowerLog separationAlertsCount](self, "separationAlertsCount") + a3);
}

- (void)addMonitoredDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAPowerLog monitoredDevices](self, "monitoredDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAPowerLog clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SAPowerLog clients](self, "clients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (SATimeServiceProtocol)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (void)setStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_startTimestamp, a3);
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(unint64_t)a3
{
  self->_visitCount = a3;
}

- (double)totalVisitDuration
{
  return self->_totalVisitDuration;
}

- (void)setTotalVisitDuration:(double)a3
{
  self->_totalVisitDuration = a3;
}

- (unint64_t)btScanCount
{
  return self->_btScanCount;
}

- (void)setBtScanCount:(unint64_t)a3
{
  self->_btScanCount = a3;
}

- (unint64_t)geofenceCount
{
  return self->_geofenceCount;
}

- (void)setGeofenceCount:(unint64_t)a3
{
  self->_geofenceCount = a3;
}

- (unint64_t)gpsLocationRequestCount
{
  return self->_gpsLocationRequestCount;
}

- (void)setGpsLocationRequestCount:(unint64_t)a3
{
  self->_gpsLocationRequestCount = a3;
}

- (unint64_t)wifiLocationRequestCount
{
  return self->_wifiLocationRequestCount;
}

- (void)setWifiLocationRequestCount:(unint64_t)a3
{
  self->_wifiLocationRequestCount = a3;
}

- (unint64_t)separationAlertsCount
{
  return self->_separationAlertsCount;
}

- (void)setSeparationAlertsCount:(unint64_t)a3
{
  self->_separationAlertsCount = a3;
}

- (NSMutableSet)monitoredDevices
{
  return self->_monitoredDevices;
}

- (void)setMonitoredDevices:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredDevices, a3);
}

- (BOOL)isReplay
{
  return self->_isReplay;
}

- (void)setIsReplay:(BOOL)a3
{
  self->_isReplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredDevices, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
