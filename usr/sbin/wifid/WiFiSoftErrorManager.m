@implementation WiFiSoftErrorManager

- (void)wifiSoftErrorEventHandler:(void *)a3 eventType:(int)a4 eventData:(void *)a5
{
  uint64_t v6;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v15;
  id v16;

  v6 = *(_QWORD *)&a4;
  v16 = -[WiFiSoftErrorManager copySoftErrorEventDescription:](self, "copySoftErrorEventDescription:", *(_QWORD *)&a4);
  if ((_DWORD)v6 == 12)
  {
    if (a5)
    {
      v9 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(a5, v9) & 1) != 0)
      {
        -[WiFiSoftErrorManager WiFiSoftErrorManagerLQMEventHandler:](self, "WiFiSoftErrorManagerLQMEventHandler:", a5);
        goto LABEL_24;
      }
    }
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: LQM Dictionary data is NULL or wrong type !", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]");
    goto LABEL_15;
  }
  v10 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: eventType received:%u eventName:%@", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]", v6, v16);
  objc_autoreleasePoolPop(v10);
  if (self->_softErrorInProcessFlags)
  {
    switch((_DWORD)v6)
    {
      case 0xB:
        goto LABEL_11;
      case 0xA:
        -[WiFiSoftErrorManager WiFiSoftErrorDriverAvailableEventhandler](self, "WiFiSoftErrorDriverAvailableEventhandler");
        goto LABEL_24;
      case 9:
LABEL_11:
        -[WiFiSoftErrorManager WiFiSoftErrorDriverLinkupEventhandler](self, "WiFiSoftErrorDriverLinkupEventhandler");
        goto LABEL_24;
    }
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Dropping SoftErrorEvent: SoftError in ProcessFlag:0x%0x", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]", self->_softErrorInProcessFlags);
    v12 = v13;
    goto LABEL_23;
  }
  if (-[WiFiSoftErrorManager supressEventDetectionProcesssing:deviceContext:](self, "supressEventDetectionProcesssing:deviceContext:", v6, a3))
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: SoftErrorEvent Detection Supressed", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]");
LABEL_15:
    v12 = v11;
LABEL_23:
    objc_autoreleasePoolPop(v12);
    goto LABEL_24;
  }
  switch((int)v6)
  {
    case 0:
    case 7:
    case 8:
      goto LABEL_18;
    case 1:
      -[WiFiSoftErrorManager enableSoftErrorMitigation:](self, "enableSoftErrorMitigation:", 2);
LABEL_18:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:](self, "wifiSoftErrorWiFiToggleEventHandler:deviceContext:", v6, a3);
      break;
    case 2:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:](self, "wifiSoftErrorWiFiScanEventHandler:", a3);
      break;
    case 3:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:](self, "wifiSoftErrorWiFiAutoJoinEventHandler:", a3);
      break;
    case 4:
      -[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:](self, "wifiSoftErrorTxDataStallEventHandler:eventData:", a3, a5);
      break;
    case 5:
      -[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:](self, "wifiSoftErrorRxDataStallEventHandler:eventData:", a3, a5);
      break;
    case 6:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiTriggerDisconnectEventHandler:eventData:](self, "wifiSoftErrorWiFiTriggerDisconnectEventHandler:eventData:", a3, a5);
      break;
    case 14:
      -[WiFiSoftErrorManager wifiSoftErrorUnexpectedClientAssertionHandler:eventData:](self, "wifiSoftErrorUnexpectedClientAssertionHandler:eventData:", a3, a5);
      break;
    case 15:
      -[WiFiSoftErrorManager wifiSoftErrorAwdlEventNotificationHandler:eventData:](self, "wifiSoftErrorAwdlEventNotificationHandler:eventData:", a3, a5);
      break;
    case 16:
      -[WiFiSoftErrorManager wifiSoftErrorSlowWiFiEventHandler:eventData:](self, "wifiSoftErrorSlowWiFiEventHandler:eventData:", a3, a5);
      break;
    default:
      break;
  }
LABEL_24:
  v15 = (_DWORD)v6 == 12 || (v6 & 0xFFFFFFFD) == 4;
  if (a5 && v15)
    CFRelease(a5);

}

- (void)WiFiSoftErrorManagerLQMEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RSSI")));
    self->_primaryInterfaceRssi = (int64_t)objc_msgSend(v5, "integerValue");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CCA")));
    self->_primaryInterfaceCca = (int64_t)objc_msgSend(v6, "integerValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SNR")));
    self->_primaryInterfaceSnr = (int64_t)objc_msgSend(v7, "integerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TXFRAMES")));
    self->_primaryInterfaceTxFrms[self->_primaryInterfaceStatsHistoryIdx] = objc_msgSend(v8, "unsignedIntValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TXFAIL")));
    self->_primaryInterfaceTxFail[self->_primaryInterfaceStatsHistoryIdx] = objc_msgSend(v9, "unsignedIntValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("RXFRAMES")));
    self->_primaryInterfaceRxFrms[self->_primaryInterfaceStatsHistoryIdx] = objc_msgSend(v10, "unsignedIntValue");

    v11 = v13;
    self->_primaryInterfaceStatsHistoryIdx = (self->_primaryInterfaceStatsHistoryIdx + 1) % 5u;
  }
  else
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: lqmDict is NULL", "-[WiFiSoftErrorManager WiFiSoftErrorManagerLQMEventHandler:]");
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

}

- (void)updateReportingPreference
{
  self->_isReportingDisabled = sub_100009230(self->_manager, &self->_reportingTimeout);
  if (self->_reportingTimeout == 0.0)
    self->_reportingTimeout = 3600.0;
}

- (id)copySoftErrorEventDescription:(int)a3
{
  if (a3 > 0x12)
    return 0;
  else
    return off_10022ECE8[a3];
}

- (WiFiSoftErrorManager)initWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v7;
  WiFiSoftErrorManager *v8;
  NSMutableArray *wifiToggleErrors;
  NSMutableArray *noNetworkFoundErrors;
  NSMutableArray *autoJoinDelayErrors;
  NSMutableArray *txDataStallErrors;
  NSMutableArray *rxDataStallErrors;
  void *v15;
  objc_super v16;

  v7 = a4;
  if (objc_opt_class(WAClient))
  {
    v16.receiver = self;
    v16.super_class = (Class)WiFiSoftErrorManager;
    v8 = -[WiFiSoftErrorManager init](&v16, "init");
    if (v8)
    {
      self = v8;
      v8->_manager = a3;
      v8->_softErrorInProcessFlags = 0;
      v8->_lastReportedSoftErrorTs = 0.0;
      objc_storeStrong((id *)&v8->_queue, a4);
      *(_QWORD *)&self->_errorCounters.slowWiFiUserConfirmCount = 0;
      *(_OWORD *)&self->_errorCounters.triggerDisconnectUserConfirmCount = 0u;
      *(_OWORD *)&self->_errorCounters.noNetworksFoundErrorUserConfirmCount = 0u;
      *(_OWORD *)&self->_errorCounters.rxDataStallErrorCount = 0u;
      *(_OWORD *)&self->_errorCounters.wifiToggleErrorCount = 0u;
      -[WiFiSoftErrorManager initEventMitigation](self, "initEventMitigation");
      wifiToggleErrors = self->_wifiToggleErrors;
      self->_wifiToggleErrors = 0;

      noNetworkFoundErrors = self->_noNetworkFoundErrors;
      self->_noNetworkFoundErrors = 0;

      autoJoinDelayErrors = self->_autoJoinDelayErrors;
      self->_autoJoinDelayErrors = 0;

      txDataStallErrors = self->_txDataStallErrors;
      self->_txDataStallErrors = 0;

      rxDataStallErrors = self->_rxDataStallErrors;
      self->_rxDataStallErrors = 0;

      self->_isInternalBuild = MGGetBoolAnswer(CFSTR("InternalBuild"));
      self->_isReportingDisabled = 0;
      self->_reportingTimeout = 3600.0;
      *(_QWORD *)self->_primaryInterfaceTxFail = 0;
      *(_QWORD *)&self->_primaryInterfaceTxFail[2] = 0;
      self->_primaryInterfaceTxFail[4] = 0;
      *(_QWORD *)&self->_primaryInterfaceTxFrms[2] = 0;
      *(_QWORD *)self->_primaryInterfaceTxFrms = 0;
      self->_primaryInterfaceTxFrms[4] = 0;
      *(_QWORD *)self->_primaryInterfaceRxFrms = 0;
      *(_QWORD *)&self->_primaryInterfaceRxFrms[2] = 0;
      self->_primaryInterfaceRxFrms[4] = 0;
      self->_primaryInterfaceStatsHistoryIdx = 0;
    }
    else
    {
      v15 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed in super-init", "-[WiFiSoftErrorManager initWithWiFiManager:queue:]");
      objc_autoreleasePoolPop(v15);
      self = 0;
    }
  }

  return self;
}

- (void)initErrorArray:(int)a3
{
  id v5;
  void *v6;
  NSMutableArray **p_wifiToggleErrors;
  void *v8;
  id v9;

  v5 = objc_alloc_init((Class)NSMutableArray);
  v9 = v5;
  if (v5)
  {
    v6 = v5;
    switch(a3)
    {
      case 1:
        p_wifiToggleErrors = &self->_wifiToggleErrors;
        goto LABEL_12;
      case 2:
        p_wifiToggleErrors = &self->_noNetworkFoundErrors;
        goto LABEL_12;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_6;
      case 4:
        p_wifiToggleErrors = &self->_autoJoinDelayErrors;
        goto LABEL_12;
      case 8:
        p_wifiToggleErrors = &self->_txDataStallErrors;
        goto LABEL_12;
      default:
        if (a3 != 16)
        {
LABEL_6:
          v8 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Invalid Soft-Error", "-[WiFiSoftErrorManager initErrorArray:]", v9);
          goto LABEL_8;
        }
        p_wifiToggleErrors = &self->_rxDataStallErrors;
LABEL_12:
        objc_storeStrong((id *)p_wifiToggleErrors, v6);
        break;
    }
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: errorArray allocation failed", "-[WiFiSoftErrorManager initErrorArray:]", 0);
LABEL_8:
    objc_autoreleasePoolPop(v8);
  }

}

- (void)wifiSoftErrorsInProcessStateSet:(int)a3
{
  void *v4;
  uint64_t v5;

  if (a3 >= 0x400)
  {
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:Invalid Soft Error", "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:]", v5);
  }
  else
  {
    self->_softErrorInProcessFlags |= a3;
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: softErrorsInProcessFlags:0x%0x", "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:]", self->_softErrorInProcessFlags);
  }
  objc_autoreleasePoolPop(v4);
}

- (void)wifiSoftErrorsInProcessStateUnset:(int)a3
{
  void *v4;
  uint64_t v5;

  if (a3 >= 0x400)
  {
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:Invalid Soft Error", "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:]", v5);
  }
  else
  {
    self->_softErrorInProcessFlags &= ~a3;
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: softErrorsInProcessFlags:0x%0x", "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:]", self->_softErrorInProcessFlags);
  }
  objc_autoreleasePoolPop(v4);
}

- (id)fetchSoftErrorContext:(void *)a3 softErrorType:(int)a4
{
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *manager;
  void *v14;

  if (a3)
  {
    v7 = 40;
    switch(a4)
    {
      case 1:
        goto LABEL_8;
      case 2:
        v7 = 48;
        goto LABEL_8;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_18;
      case 4:
        v7 = 56;
        goto LABEL_8;
      case 8:
        v7 = 64;
        goto LABEL_8;
      default:
        if (a4 != 16)
          goto LABEL_18;
        v7 = 72;
LABEL_8:
        v8 = *(id *)((char *)&self->super.isa + v7);
        if (v8)
        {
          v9 = v8;
          if (objc_msgSend(v8, "count"))
          {
            v10 = 0;
            v11 = 0;
            do
            {
              v12 = v11;
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));

              if (a4 == 1)
                manager = self->_manager;
              else
                manager = self->_deviceManager;
              if (manager == a3)
                break;
              ++v10;
            }
            while (v10 < (unint64_t)objc_msgSend(v9, "count"));
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_21;
        }
LABEL_18:
        v14 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: errorListArray is NULL! ", "-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]");
        break;
    }
  }
  else
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Null deviceContext", "-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]");
  }
  objc_autoreleasePoolPop(v14);
  v11 = 0;
  v9 = 0;
LABEL_21:

  return v11;
}

- (void)wifiSoftErrorWiFiToggleEventHandler:(int)a3 deviceContext:(void *)a4
{
  double Current;
  WiFiSoftErrorContext *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  WiFiSoftErrorContext *v30;

  Current = CFAbsoluteTimeGetCurrent();
  if (self->_wifiToggleErrors)
  {
    v30 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:](self, "fetchSoftErrorContext:softErrorType:", a4, 1));
    if (v30)
      goto LABEL_9;
    v8 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]([WiFiSoftErrorContext alloc], "initWithErrorType:deviceContext:", 1, a4);
    if (!v8)
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to alloc wifiToggleError", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]");
LABEL_49:
      objc_autoreleasePoolPop(v9);
      v30 = 0;
LABEL_50:
      v13 = 0;
      v11 = 0;
LABEL_51:
      v15 = 0;
      goto LABEL_24;
    }
  }
  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 1);
    if (!self->_wifiToggleErrors)
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: wifiToggleErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]");
      goto LABEL_49;
    }
    v8 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]([WiFiSoftErrorContext alloc], "initWithErrorType:deviceContext:", 1, a4);
    if (!v8)
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to alloc wifiToggleError Context", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]");
      goto LABEL_49;
    }
  }
  v30 = v8;
  -[NSMutableArray addObject:](self->_wifiToggleErrors, "addObject:", v8);
LABEL_9:
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v10)
  {
    v27 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: eventDict is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]");
    objc_autoreleasePoolPop(v27);
    goto LABEL_50;
  }
  v11 = v10;
  v12 = objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v30, "fetchSoftErrorContextData"));
  if (!v12)
  {
    v28 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: wifiToggleEventsArray is NULL", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]");
    objc_autoreleasePoolPop(v28);
    v13 = 0;
    goto LABEL_51;
  }
  v13 = (void *)v12;
  v14 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", Current);
  if (!v14)
  {
    v29 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Failed to alloc CurrTime", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]");
    objc_autoreleasePoolPop(v29);
    goto LABEL_51;
  }
  v15 = v14;
  if ((a3 & 0xFFFFFFF7) != 0)
  {
    if (a3 == 7 || a3 == 1)
    {
      objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("WiFiONEvent"));
      objc_msgSend(v13, "addObject:", v11);
      v16 = (unint64_t)objc_msgSend(v13, "count");
      v17 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: wifiToggleEventsArray:eventsCount:%u", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]", v16);
      objc_autoreleasePoolPop(v17);
      if ((int)v16 + 0x7FFFFFFF < 0)
      {
        v18 = (v16 - 1);
        while (1)
        {
          v16 = (v16 - 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v18));
          if (!v19)
            break;
          v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("WiFiOFFEvent")));

          if (v21)
          {
            objc_msgSend(v21, "doubleValue");
            v23 = Current - v22;
            if (v23 >= 3.0)
            {
              v25 = objc_autoreleasePoolPush();
              if (qword_10026DD20)
                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Not a WiFi-Toggle: TimeDelta:%f", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]", *(_QWORD *)&v23);
              objc_autoreleasePoolPop(v25);
            }
            else
            {
              -[WiFiSoftErrorContext setErrorState:](v30, "setErrorState:", 2);
              v24 = objc_autoreleasePoolPush();
              if (qword_10026DD20)
                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:(Soft Error):WiFi Toggle Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]");
              objc_autoreleasePoolPop(v24);
              -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 1);
              -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 1, a4, 0);
              -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:](self, "wifiSoftErrorMitigation:mitigationContext:", 1, a4);
            }
            -[NSMutableArray removeObject:](self->_wifiToggleErrors, "removeObject:", v30);

            v30 = 0;
            goto LABEL_24;
          }
          --v18;
          if ((int)v16 < 1)
            goto LABEL_24;
        }
        v26 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: eventRef at index:%u is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]", v16);
        objc_autoreleasePoolPop(v26);
      }
    }
  }
  else
  {
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("WiFiOFFEvent"));
    objc_msgSend(v13, "addObject:", v11);
  }
LABEL_24:

}

- (void)wifiSoftErrorWiFiScanEventHandler:(void *)a3
{
  void *v5;
  WiFiSoftErrorContext *v6;
  WiFiSoftErrorContext *v7;
  WiFiSoftErrorContext *v8;
  void *v9;
  void *v10;
  double Current;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  WiFiSoftErrorContext *v18;
  void *v19;
  void *v20;
  WiFiSoftErrorContext *v21;
  WiFiSoftErrorContext *v22;
  WiFiSoftErrorContext *v23;

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Received zero scan results Event", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
  objc_autoreleasePoolPop(v5);
  if (self->_noNetworkFoundErrors)
  {
    v6 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:](self, "fetchSoftErrorContext:softErrorType:", a3, 2));
    if (v6)
      goto LABEL_13;
    v7 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]([WiFiSoftErrorContext alloc], "initWithErrorType:deviceContext:", 2, a3);
    if (v7)
    {
      v21 = v7;
      -[NSMutableArray addObject:](self->_noNetworkFoundErrors, "addObject:", v7);
LABEL_12:
      v6 = v21;
LABEL_13:
      v22 = v6;
      v23 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v6, "fetchSoftErrorContextData"));
      v10 = objc_autoreleasePoolPush();
      if (!v23)
      {
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: noNetworksEventsArray is NULL", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
        objc_autoreleasePoolPop(v10);
        goto LABEL_27;
      }
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: noNetworksEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]", v23);
      objc_autoreleasePoolPop(v10);
      Current = CFAbsoluteTimeGetCurrent();
      if ((unint64_t)-[WiFiSoftErrorContext count](v23, "count") > 2)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext objectAtIndex:](v23, "objectAtIndex:", 0));
        if (v14)
        {
          v15 = v14;
          objc_msgSend(v14, "doubleValue");
          if (Current - v16 < 60.0)
          {
            -[WiFiSoftErrorContext removeAllObjects](v23, "removeAllObjects");
            v17 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:(Soft Error):No Networks Found Detected !", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
            objc_autoreleasePoolPop(v17);
            -[WiFiSoftErrorContext setErrorState:](v22, "setErrorState:", 2);
            -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 2);
            -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 2, a3, 0);
            -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:](self, "wifiSoftErrorMitigation:mitigationContext:", 2, a3);
            -[WiFiSoftErrorContext removeAllObjects](v23, "removeAllObjects");
            -[NSMutableArray removeObject:](self->_noNetworkFoundErrors, "removeObject:", v22);

            v18 = v23;
            goto LABEL_28;
          }
          -[WiFiSoftErrorContext removeObjectAtIndex:](v23, "removeObjectAtIndex:", 0);
          v13 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", Current);

          if (v13)
            goto LABEL_25;
        }
      }
      else
      {
        v12 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", Current);
        if (v12)
        {
          v13 = v12;
LABEL_25:
          -[WiFiSoftErrorContext addObject:](v23, "addObject:", v13);

LABEL_26:
LABEL_27:
          v18 = v22;
LABEL_28:

          return;
        }
      }
      v19 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: numRef Null", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
      objc_autoreleasePoolPop(v19);
      goto LABEL_26;
    }
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to alloc wifiToggleError", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
  }
  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 2);
    if (self->_noNetworkFoundErrors)
    {
      v8 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]([WiFiSoftErrorContext alloc], "initWithErrorType:deviceContext:", 2, a3);
      if (v8)
      {
        v21 = v8;
        -[NSMutableArray addObject:](self->_noNetworkFoundErrors, "addObject:", v8);
        v9 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: noNetworksErrorList:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]", self->_noNetworkFoundErrors);
        objc_autoreleasePoolPop(v9);
        goto LABEL_12;
      }
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to allocate noNetworksError ", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
    }
    else
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: noNetworksErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]");
    }
  }
  objc_autoreleasePoolPop(v20);
}

- (void)wifiSoftErrorWiFiAutoJoinEventHandler:(void *)a3
{
  void *v5;
  WiFiSoftErrorContext *v6;
  WiFiSoftErrorContext *v7;
  void *v8;
  void *v9;
  double Current;
  id v11;
  void *v12;
  WiFiSoftErrorContext *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  WiFiSoftErrorContext *v26;
  void *v27;
  void *v28;
  WiFiSoftErrorContext *v29;
  WiFiSoftErrorContext *v30;
  WiFiSoftErrorContext *v31;

  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Received delayed AutoJoin", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
  objc_autoreleasePoolPop(v5);
  if (self->_autoJoinDelayErrors)
  {
    v6 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:](self, "fetchSoftErrorContext:softErrorType:", a3, 4));
    if (v6)
      goto LABEL_9;
  }
  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 4);
    if (!self->_autoJoinDelayErrors)
    {
      v28 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: autoJoinDelayErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
      goto LABEL_42;
    }
  }
  v7 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]([WiFiSoftErrorContext alloc], "initWithErrorType:deviceContext:", 4, a3);
  if (v7)
  {
    v30 = v7;
    -[NSMutableArray addObject:](self->_autoJoinDelayErrors, "addObject:", v7);
    v6 = v30;
LABEL_9:
    v31 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v6, "fetchSoftErrorContextData"));
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: slowAutoJoinEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]", v8);
    objc_autoreleasePoolPop(v9);
    Current = CFAbsoluteTimeGetCurrent();
    -[WiFiSoftErrorContext setDetectionTime:](v31, "setDetectionTime:");
    v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", Current);
    if (!v11)
    {
      v27 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: numRef Null", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
      objc_autoreleasePoolPop(v27);

      v26 = v31;
      goto LABEL_34;
    }
    v12 = v11;
    objc_msgSend(v8, "addObject:", v11);
    if (objc_msgSend(v8, "count") == (id)10)
      objc_msgSend(v8, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 9, v8, 1, 9);
    v13 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:](self, "fetchSoftErrorContext:softErrorType:", a3, 1));
    v29 = v13;
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v13, "fetchSoftErrorContextData"));
      v15 = v14;
      if (v14 && objc_msgSend(v14, "count"))
      {
        v16 = objc_msgSend(v15, "count");
        if ((uint64_t)v16 - 1 < 0)
        {
          v21 = 0;
        }
        else
        {
          v17 = (uint64_t)v16;
          while (1)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", --v17));
            v19 = v18;
            if (v18)
            {
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("WiFiONEvent")));
              if (v20)
                break;
            }

            if (v17 <= 0)
            {
              v21 = 0;
              goto LABEL_29;
            }
          }
          v21 = (void *)v20;

          v22 = CFAbsoluteTimeGetCurrent();
          objc_msgSend(v21, "doubleValue");
          if (v22 - v23 < 3.0)
          {
            v24 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: device was just powered on - skipping delayed auto-join detection", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
            objc_autoreleasePoolPop(v24);

            goto LABEL_33;
          }
        }
LABEL_29:

      }
    }
    else
    {
      v15 = 0;
    }
    v25 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:(Soft Error):Slow AutoJoin Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
    objc_autoreleasePoolPop(v25);
    -[WiFiSoftErrorContext setErrorState:](v31, "setErrorState:", 2);
    -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 4);
    -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 4, a3, 0);
    -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:](self, "wifiSoftErrorMitigation:mitigationContext:", 4, a3);
LABEL_33:

    v26 = v29;
LABEL_34:

    return;
  }
  v28 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to alloc autoJoinDelayedError", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]");
LABEL_42:
  objc_autoreleasePoolPop(v28);
}

- (void)wifiSoftErrorRxDataStallEventHandler:(void *)a3 eventData:(void *)a4
{
  void *v7;
  WiFiSoftErrorContext *v8;
  WiFiSoftErrorContext *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;
  void *v14;
  double Current;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WiFiSoftErrorContext *v22;
  WiFiSoftErrorContext *v23;

  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Received Rx-Data -Stall Event", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
  objc_autoreleasePoolPop(v7);
  if (!a3 || !a4)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: deviceRef or data is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
    goto LABEL_36;
  }
  if (self->_rxDataStallErrors)
  {
    v8 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:](self, "fetchSoftErrorContext:softErrorType:", a3, 16));
    if (v8)
      goto LABEL_11;
  }
  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 16);
    if (!self->_rxDataStallErrors)
    {
      v19 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: rxDataStallErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
      goto LABEL_36;
    }
  }
  v9 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]([WiFiSoftErrorContext alloc], "initWithErrorType:deviceContext:", 16, a3);
  if (v9)
  {
    v22 = v9;
    -[NSMutableArray addObject:](self->_rxDataStallErrors, "addObject:", v9);
    v8 = v22;
LABEL_11:
    v23 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v8, "fetchSoftErrorContextData"));
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: rxDataStallEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]", v10);
    objc_autoreleasePoolPop(v11);
    v12 = *(_QWORD *)a4;
    v13 = -[WiFiSoftErrorManager getReachabilityStatus](self, "getReachabilityStatus");
    v14 = objc_autoreleasePoolPush();
    if ((v13 & 1) != 0)
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Rx-Stall with errorCode:%lluu", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]", v12);
      objc_autoreleasePoolPop(v14);
      Current = CFAbsoluteTimeGetCurrent();
      -[WiFiSoftErrorContext setDetectionTime:](v23, "setDetectionTime:");
      v16 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", Current);
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v10, "addObject:", v16);
        if (objc_msgSend(v10, "count") == (id)20)
          objc_msgSend(v10, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 19, v10, 1, 19);
        v18 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:(Soft Error):RX-Data Stall Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
        objc_autoreleasePoolPop(v18);
        -[WiFiSoftErrorContext setErrorState:](v23, "setErrorState:", 2);
        -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 16);
        -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 16, a3, 0);
        -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:](self, "wifiSoftErrorMitigation:mitigationContext:", 16, a3);

        goto LABEL_22;
      }
      v21 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: numRef Null", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
      v20 = v21;
    }
    else
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Not a Rx-Stall", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
      v20 = v14;
    }
    objc_autoreleasePoolPop(v20);
LABEL_22:

    return;
  }
  v19 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to alloc rxDataStallError", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]");
LABEL_36:
  objc_autoreleasePoolPop(v19);
}

- (void)wifiSoftErrorTxDataStallEventHandler:(void *)a3 eventData:(void *)a4
{
  void *v7;
  WiFiSoftErrorContext *v8;
  WiFiSoftErrorContext *v9;
  void *v10;
  void *v11;
  double Current;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  WiFiSoftErrorContext *v23;
  WiFiSoftErrorContext *v24;

  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Received Tx-Data Stall Event", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
  objc_autoreleasePoolPop(v7);
  if (!a3 || !a4)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: deviceRef or data is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
    goto LABEL_48;
  }
  if (self->_txDataStallErrors)
  {
    v8 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:](self, "fetchSoftErrorContext:softErrorType:", a3, 8));
    if (v8)
      goto LABEL_11;
  }
  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 8);
    if (!self->_txDataStallErrors)
    {
      v21 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: txDataStallErrorArray is NULL!", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
      goto LABEL_48;
    }
  }
  v9 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]([WiFiSoftErrorContext alloc], "initWithErrorType:deviceContext:", 8, a3);
  if (!v9)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to alloc txDataStallError", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
LABEL_48:
    objc_autoreleasePoolPop(v21);
    v16 = 0;
    v10 = 0;
    goto LABEL_36;
  }
  v23 = v9;
  -[NSMutableArray addObject:](self->_txDataStallErrors, "addObject:", v9);
  v8 = v23;
LABEL_11:
  v24 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v8, "fetchSoftErrorContextData"));
  if (!-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:](self, "wifiSoftErrorTxDataStallProcessHistory:", a4))
  {
LABEL_44:
    v16 = 0;
    goto LABEL_45;
  }
  v11 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:Tx-Stall Instance Detected", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
  objc_autoreleasePoolPop(v11);
  Current = CFAbsoluteTimeGetCurrent();
  -[WiFiSoftErrorContext setDetectionTime:](v24, "setDetectionTime:");
  v13 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", Current);
  if (!v13)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: numRef Null", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
    objc_autoreleasePoolPop(v22);
    goto LABEL_44;
  }
  v14 = v13;
  objc_msgSend(v10, "addObject:", v13);
  if (objc_msgSend(v10, "count"))
    -[WiFiSoftErrorManager purgeOutdatedEvents:currTime:](self, "purgeOutdatedEvents:currTime:", v10, Current);
  v15 = objc_msgSend(v10, "count");
  if ((unint64_t)v15 < 2)
  {
    v16 = v14;
  }
  else
  {
    if ((unint64_t)v15 >= 0x15)
      objc_msgSend(v10, "removeObjectsInRange:", 1, ((_BYTE)v15 - 20));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", 0));

    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      if (Current - v17 >= 10.0)
      {
        if (-[WiFiSoftErrorManager isLQAIndicatingTxStall](self, "isLQAIndicatingTxStall"))
        {
          v18 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: TxStall Detected due to high TxPER(as per LQM)", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
        }
        else
        {
          v19 = -[WiFiSoftErrorManager getReachabilityStatus](self, "getReachabilityStatus");
          v18 = objc_autoreleasePoolPush();
          if ((v19 & 1) != 0)
          {
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: txStall NOT detected", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
            objc_autoreleasePoolPop(v18);
            goto LABEL_35;
          }
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: TxStall Detected due to Reachability Failure", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
        }
        objc_autoreleasePoolPop(v18);
        v20 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:(Soft Error):TX-Data Stall Error Detected !", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]");
        objc_autoreleasePoolPop(v20);
        -[WiFiSoftErrorContext setErrorState:](v24, "setErrorState:", 2);
        -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 8);
        -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 8, a3, 0);
        -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:](self, "wifiSoftErrorMitigation:mitigationContext:", 8, a3);
LABEL_35:
        objc_msgSend(v10, "removeAllObjects");
        -[NSMutableArray removeObject:](self->_txDataStallErrors, "removeObject:", v24);

LABEL_36:
        v24 = 0;
      }
    }
  }
LABEL_45:

}

- (void)wifiSoftErrorWiFiTriggerDisconnectEventHandler:(void *)a3 eventData:(void *)a4
{
  -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 32, a3, a4);
}

- (void)wifiSoftErrorUserDisconnectEventHandler:(void *)a3
{
  -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 64, a3, 0);
}

- (void)wifiSoftErrorUnexpectedClientAssertionHandler:(void *)a3 eventData:(void *)a4
{
  -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 128, a3, 0);
}

- (void)wifiSoftErrorAwdlEventNotificationHandler:(void *)a3 eventData:(void *)a4
{
  void *v7;
  uint64_t v8;

  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
  {
    if (a4)
      v8 = *(unsigned int *)a4;
    else
      v8 = 0;
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: SoftError eventType is %u \n", "-[WiFiSoftErrorManager wifiSoftErrorAwdlEventNotificationHandler:eventData:]", v8);
  }
  objc_autoreleasePoolPop(v7);
  -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 256, a3, 0);
}

- (void)wifiSoftErrorSlowWiFiEventHandler:(void *)a3 eventData:(void *)a4
{
  void *v7;
  void *v8;
  const void *v9;
  const void *v10;
  __CFString *Mutable;
  __CFString *v12;
  BOOL v13;

  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Slow WiFi event occured\n", "-[WiFiSoftErrorManager wifiSoftErrorSlowWiFiEventHandler:eventData:]");
  objc_autoreleasePoolPop(v7);
  v8 = sub_1000169FC((uint64_t)a3, a4);
  if (v8)
  {
    v9 = v8;
    v10 = sub_10002B088(v8);
    Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
    v12 = Mutable;
    if (Mutable)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (!v13)
    {
      CFStringAppendFormat(Mutable, 0, CFSTR("A slow Wi-Fi connection to “%@“ has been detected. Your response will be used to help tune our detection algorithm."), v10);
      -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:](self, "WiFiSoftErrorReporting:deviceContext:displayString:", 512, a3, v12);
      CFRelease(v9);
LABEL_11:
      CFRelease(v12);
      return;
    }
    CFRelease(v9);
    if (v12)
      goto LABEL_11;
  }
}

- (void)WiFiSoftErrorDriverAvailableEventhandler
{
  void *v3;
  void *v4;

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Handle DriverAvailable Event: inProcessFlags:0x%0x", "-[WiFiSoftErrorManager WiFiSoftErrorDriverAvailableEventhandler]", self->_softErrorInProcessFlags);
  objc_autoreleasePoolPop(v3);
  if ((self->_softErrorInProcessFlags & 2) != 0)
  {
    -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:](self, "wifiSoftErrorsInProcessStateUnset:", 2);
  }
  else
  {
    self->_softErrorInProcessFlags = 0;
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: DriverAvailbale event received when not expected.Clearing inProcess State", "-[WiFiSoftErrorManager WiFiSoftErrorDriverAvailableEventhandler]");
    objc_autoreleasePoolPop(v4);
  }
}

- (void)WiFiSoftErrorDriverLinkupEventhandler
{
  void *v3;

  v3 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Handle Linkup/Roam Event:inProcessFlags:0x%0x", "-[WiFiSoftErrorManager WiFiSoftErrorDriverLinkupEventhandler]", self->_softErrorInProcessFlags);
  objc_autoreleasePoolPop(v3);
  if ((self->_softErrorInProcessFlags & 8) != 0)
    -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:](self, "wifiSoftErrorsInProcessStateUnset:", 8);
}

- (void)WiFiSoftErrorReporting:(int)a3 deviceContext:(void *)a4 displayString:(__CFString *)a5
{
  uint64_t v7;
  void *v9;
  void *v10;
  CFTypeRef v11;
  void *v12;
  _QWORD block[8];
  int v14;
  _QWORD v15[3];
  unint64_t v16;

  if (a3 >= 0x400)
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: errorType Not Handled", "-[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]");
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v7 = *(_QWORD *)&a3;
    -[WiFiSoftErrorManager wifiSoftErrorCounterUpdate:](self, "wifiSoftErrorCounterUpdate:");
    if (!-[WiFiSoftErrorManager shouldSupressErrorReporting:](self, "shouldSupressErrorReporting:", v7))
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: _isInternalBuild:%u _isReportingDisabled:%u supressTapToRadar:%u", "-[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]", self->_isInternalBuild, self->_isReportingDisabled, -[WiFiSoftErrorManager supressTapToRadar:deviceContext:](self, "supressTapToRadar:deviceContext:", v7, a4));
      objc_autoreleasePoolPop(v9);
      if (!self->_isInternalBuild
        || self->_isReportingDisabled
        || -[WiFiSoftErrorManager supressTapToRadar:deviceContext:](self, "supressTapToRadar:deviceContext:", v7, a4))
      {
        v10 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Supressed TapToRadar:errorType:%u !", "-[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]", v7);
        objc_autoreleasePoolPop(v10);
      }
      else
      {
        v15[0] = 0;
        v15[1] = v15;
        v15[2] = 0x2020000000;
        v16 = 0xAAAAAAAAAAAAAAAALL;
        if (a5)
          v11 = CFRetain(a5);
        else
          v11 = 0;
        v16 = (unint64_t)v11;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10003A814;
        block[3] = &unk_10022EC78;
        v14 = v7;
        block[6] = a5;
        block[7] = a4;
        block[4] = self;
        block[5] = v15;
        dispatch_async((dispatch_queue_t)qword_10026DD40, block);
        _Block_object_dispose(v15, 8);
      }
      if ((_DWORD)v7 == 64 || (_DWORD)v7 == 32)
        self->_lastReportedDisconnect = CFAbsoluteTimeGetCurrent();
      else
        self->_lastReportedSoftErrorTs = CFAbsoluteTimeGetCurrent();
    }
  }
}

- (void)wifiSoftErrorMitigation:(int)a3 mitigationContext:(void *)a4
{
  uint64_t v5;
  NSObject *queue;
  void *v8;
  _QWORD block[6];
  int v10;

  v5 = *(_QWORD *)&a3;
  if (-[WiFiSoftErrorManager isEventMitigationEnabled:](self, "isEventMitigationEnabled:"))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003A97C;
    block[3] = &unk_10022ECA0;
    v10 = v5;
    block[4] = self;
    block[5] = a4;
    dispatch_async(queue, block);
  }
  else
  {
    -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:](self, "wifiSoftErrorsInProcessStateUnset:", v5);
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: mitigation is supressed for SoftError:%u", "-[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:]", v5);
    objc_autoreleasePoolPop(v8);
  }
}

- (void)wifiSoftErrorCounterUpdate:(int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  if (a3 > 31)
  {
    if (a3 > 255)
    {
      if (a3 == 256)
      {
        ++self->_errorCounters.awdlSoftErrorCount;
        return;
      }
      if (a3 == 512)
      {
        ++self->_errorCounters.slowWiFiErrorCount;
        return;
      }
    }
    else
    {
      if (a3 == 32)
      {
        ++self->_errorCounters.triggerDisconnectCount;
        return;
      }
      if (a3 == 64)
      {
        ++self->_errorCounters.userDisconnectCount;
        return;
      }
    }
LABEL_19:
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: invalid softErrorType:%u", "-[WiFiSoftErrorManager wifiSoftErrorCounterUpdate:]", v3);
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    switch(a3)
    {
      case 1:
        ++self->_errorCounters.wifiToggleErrorCount;
        break;
      case 2:
        ++self->_errorCounters.noNetworksFoundErrorCount;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_19;
      case 4:
        ++self->_errorCounters.slowAutoJoinErrorCount;
        break;
      case 8:
        ++self->_errorCounters.txDataStallErrorCount;
        break;
      default:
        if (a3 != 16)
          goto LABEL_19;
        ++self->_errorCounters.rxDataStallErrorCount;
        break;
    }
  }
}

- (void)wifiSoftErrorUserConfirmationFlagSetting:(int)a3 forError:(int)a4 withDeviceContext:(void *)a5
{
  self->_errorCounters.lastSoftErrorUserFeedbk = a3;
  if (a3 != -1 && a4 == 512)
    sub_10011BC48((uint64_t)a5, a3 == 1);
}

- (void)wifiSoftErrorUserConfirmationUpdate:(int)a3 withDeviceContext:(void *)a4
{
  uint64_t v4;
  void *v6;

  v4 = *(_QWORD *)&a3;
  -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:](self, "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:", 1, *(_QWORD *)&a3, a4);
  if ((int)v4 > 31)
  {
    if ((int)v4 > 255)
    {
      if ((_DWORD)v4 == 256)
      {
        ++self->_errorCounters.awdlSoftErrorCount;
        return;
      }
      if ((_DWORD)v4 == 512)
      {
        ++self->_errorCounters.slowWiFiUserConfirmCount;
        return;
      }
    }
    else
    {
      if ((_DWORD)v4 == 32)
      {
        ++self->_errorCounters.triggerDisconnectUserConfirmCount;
        return;
      }
      if ((_DWORD)v4 == 64)
      {
        ++self->_errorCounters.UserDisconnectUserConfirmCount;
        return;
      }
    }
LABEL_19:
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: invalid softErrorType:%u", "-[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]", v4);
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    switch((int)v4)
    {
      case 1:
        ++self->_errorCounters.wifiToggleErrorUserConfirmCount;
        break;
      case 2:
        ++self->_errorCounters.noNetworksFoundErrorUserConfirmCount;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_19;
      case 4:
        ++self->_errorCounters.slowAutoJoinErrorUserConfirmCount;
        break;
      case 8:
        ++self->_errorCounters.txDataStallErrorUserConfirmCount;
        break;
      default:
        if ((_DWORD)v4 != 16)
          goto LABEL_19;
        ++self->_errorCounters.rxDataStallErrorUserConfirmCount;
        break;
    }
  }
}

- (softErrorCounters)getErrorCounters
{
  return &self->_errorCounters;
}

- (BOOL)wifiSoftErrorTxDataStallProcessHistory:(__CFDictionary *)a3
{
  void *v5;
  _OWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v17;
  void *value;
  unsigned int valuePtr;
  _OWORD v20[3];
  _OWORD v21[3];
  _OWORD v22[3];
  _BYTE v23[48];
  _BYTE v24[56];

  valuePtr = 0;
  v17 = 0;
  value = 0;
  memset(v24, 0, 48);
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  if (a3)
  {
    if (CFDictionaryGetValueIfPresent(a3, CFSTR("TX_FAILURE_PHYRATE_SERIES_COUNT"), (const void **)&value) && value)
    {
      CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
      v5 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Number of RateSeries Present:%u", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", valuePtr);
      objc_autoreleasePoolPop(v5);
    }
    v6 = 0;
    if (CFDictionaryGetValueIfPresent(a3, CFSTR("TX_FAILURE_PHYRATE_SERIES_LEGACY_RATES"), (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:](self, "populateTxFailHistory:failureHistoryArray:historyArraySz:", v17, v24, 12);
      v7 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Legacy Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17);
      objc_autoreleasePoolPop(v7);
      v6 = v24;
    }
    v8 = 0;
    if (CFDictionaryGetValueIfPresent(a3, CFSTR("TX_FAILURE_PHYRATE_SERIES_11N_1SS"), (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:](self, "populateTxFailHistory:failureHistoryArray:historyArraySz:", v17, v23, 12);
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: 11n 1SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17);
      objc_autoreleasePoolPop(v9);
      v6 = v23;
      v8 = 1;
    }
    if (CFDictionaryGetValueIfPresent(a3, CFSTR("TX_FAILURE_PHYRATE_SERIES_11N_2SS"), (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:](self, "populateTxFailHistory:failureHistoryArray:historyArraySz:", v17, v22, 12);
      v10 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: 11N 2SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17);
      objc_autoreleasePoolPop(v10);
      v6 = v22;
      v8 = 1;
    }
    if (CFDictionaryGetValueIfPresent(a3, CFSTR("TX_FAILURE_PHYRATE_SERIES_11AC_1SS"), (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:](self, "populateTxFailHistory:failureHistoryArray:historyArraySz:", v17, v21, 12);
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: 11AC 1SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17);
      objc_autoreleasePoolPop(v11);
      v6 = v21;
      v8 = 1;
    }
    if (CFDictionaryGetValueIfPresent(a3, CFSTR("TX_FAILURE_PHYRATE_SERIES_11AC_2SS"), (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:](self, "populateTxFailHistory:failureHistoryArray:historyArraySz:", v17, v20, 12);
      v12 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: 11AC 2SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17);
      objc_autoreleasePoolPop(v12);
      v6 = v20;
      v8 = 1;
    }
    v13 = -[WiFiSoftErrorManager isTxStalled:rateType:size:](self, "isTxStalled:rateType:size:", v6, v8, 12);
    if (v13)
    {
      v14 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Possible Tx-Stall", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]");
      objc_autoreleasePoolPop(v14);
      LOBYTE(v13) = 1;
    }
  }
  else
  {
    v15 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:txFailHistoryDictionary is NULL", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]");
    objc_autoreleasePoolPop(v15);
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)isTxStalled:(unsigned int *)a3 rateType:(unsigned __int8)a4 size:(unsigned int)a5
{
  unint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  void *v13;
  void *v15;

  if (a3 && a5)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = a3[v5];
      if (v5 >= 9)
        v9 = 0;
      else
        v9 = a3[v5];
      if (v5)
        v10 = 0;
      else
        v10 = *a3;
      if (a4)
        v9 = v10;
      v11 = v9 + v6;
      if (v8)
      {
        v7 += v8;
        v6 = v11;
      }
      ++v5;
    }
    while (a5 != v5);
    if (v7)
      v12 = (float)(v6 / v7);
    else
      v12 = 0.0;
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failureRatio:%f", "-[WiFiSoftErrorManager isTxStalled:rateType:size:]", *(_QWORD *)&v12);
    objc_autoreleasePoolPop(v13);
    if (v12 > 0.7)
      return 1;
  }
  else
  {
    v15 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Bad params!", "-[WiFiSoftErrorManager isTxStalled:rateType:size:]");
    objc_autoreleasePoolPop(v15);
  }
  return 0;
}

- (void)populateTxFailHistory:(__CFArray *)a3 failureHistoryArray:(unsigned int *)a4 historyArraySz:(unsigned int)a5
{
  uint64_t Count;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  void *v11;

  if (CFArrayGetCount(a3) >= a5)
    Count = a5;
  else
    Count = CFArrayGetCount(a3);
  if (a3 && a4 && a5)
  {
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a3, i);
        if (ValueAtIndex)
          CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, a4);
        ++a4;
      }
    }
  }
  else
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Failure History params are invalid", "-[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:]");
    objc_autoreleasePoolPop(v11);
  }
}

- (BOOL)shouldSupressErrorReporting:(int)a3
{
  uint64_t v3;
  double *p_lastReportedDisconnect;
  double reportingTimeout;
  void *v6;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  if (a3 == 64 || a3 == 32)
  {
    p_lastReportedDisconnect = &self->_lastReportedDisconnect;
    reportingTimeout = 82800.0;
  }
  else
  {
    p_lastReportedDisconnect = &self->_lastReportedSoftErrorTs;
    reportingTimeout = self->_reportingTimeout;
  }
  if ((a3 - 1) <= 0x3F && ((1 << (a3 - 1)) & 0x8000000080000001) != 0)
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Suppressing softerror (%u) reporting", v3, v10, v11);
LABEL_9:
    objc_autoreleasePoolPop(v6);
    return 1;
  }
  v8 = *p_lastReportedDisconnect;
  v9 = CFAbsoluteTimeGetCurrent() - v8;
  if (v9 < reportingTimeout)
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:Rate-Limiting-dropping this(%u) SoftError. TimeDelta:(%f)secs", "-[WiFiSoftErrorManager shouldSupressErrorReporting:]", v3, *(_QWORD *)&v9);
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)askToLaunchTapToRadar:(int)a3
{
  __CFString *Mutable;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v8;
  void *v10;
  CFOptionFlags v11;

  v11 = 0;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Mutable)
  {
    v5 = Mutable;
    if (a3 == 4)
      v6 = CFSTR("Did you manually disconnect from this network?");
    else
      v6 = CFSTR("Seeing WiFi Problems?");
    if (a3 == 4)
      v7 = CFSTR("If not, please file a radar.");
    else
      v7 = CFSTR("File a radar now?");
    CFStringAppend(Mutable, v6);
    CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v5, v7, CFSTR("Dismiss"), CFSTR("Radar"), 0, &v11);
    v8 = (v11 & 3) != 0;
    CFRelease(v5);
  }
  else
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failed to alloc string", "-[WiFiSoftErrorManager askToLaunchTapToRadar:]");
    objc_autoreleasePoolPop(v10);
    return 1;
  }
  return v8;
}

- (BOOL)askToLaunchTriggerDisconnectRadar:(__CFString *)a3
{
  CFOptionFlags v4;

  v4 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, a3, CFSTR("If WiFi was usable, please file radar"), CFSTR("Dismiss"), CFSTR("Radar"), 0, &v4);
  return (v4 & 3) != 0;
}

- (BOOL)askToLaunchSlowWiFiRadar:(__CFString *)a3
{
  CFOptionFlags v4;

  v4 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, CFSTR("[Internal Only]"), a3, CFSTR("Slow, File Radar"), CFSTR("Not Slow"), 0, &v4);
  return (v4 & 3) == 0;
}

- (BOOL)askToLaunchUserDisconnectRadar
{
  CFOptionFlags v3;

  v3 = 0;
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, CFSTR("User Disconnected from WiFi"), CFSTR("Seeing WiFi problems?"), CFSTR("Dismiss"), CFSTR("Radar"), 0, &v3);
  return (v3 & 3) != 0;
}

- (void)launchTapToRadar:(int)a3 displayString:(__CFString *)a4 deviceContext:(void *)a5
{
  uint64_t v7;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WiFiSoftErrorManager *v14;
  uint64_t v15;
  id v16;

  v7 = *(_QWORD *)&a3;
  -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:](self, "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:", 0xFFFFFFFFLL, *(_QWORD *)&a3);
  if ((int)v7 <= 31)
  {
    if ((_DWORD)v7 == 8)
    {
      if (objc_msgSend((id)qword_10026DD20, "getLogLevelEnable") == (id)1)
        sub_10016BD8C("softerror.tx_datapath_stall");
      -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:](self, "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:", 8, a5);
LABEL_21:
      v9 = CFSTR("tap-to-radar://new?Title=WiFi%20Tx%20Data%20Stall%20Problem&AutoDiagnostics=phone&Description=Not%20able%20to%20browse%20over%20WiFi%29%20Please%20provide%20following%20feedback%20%20-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20User%20activity%20during%20this%20period%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi");
      goto LABEL_22;
    }
    if ((_DWORD)v7 == 16)
    {
      if (objc_msgSend((id)qword_10026DD20, "getLogLevelEnable") == (id)1)
        sub_10016BD8C("softerror.rx_datapath.stall");
      -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:](self, "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:", 16, a5);
      v9 = CFSTR("tap-to-radar://new?Title=WiFi%20Rx%20Data%20Stall%20Problem&AutoDiagnostics=phone&Description=Not%20able%20to%20browse%20over%20WiFi&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi");
      goto LABEL_22;
    }
  }
  else
  {
    switch((_DWORD)v7)
    {
      case 0x200:
        if (-[WiFiSoftErrorManager askToLaunchSlowWiFiRadar:](self, "askToLaunchSlowWiFiRadar:", a4))
        {
          -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:](self, "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:", 512, a5);
          v10 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:SlowWiFi tap URL", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]");
          objc_autoreleasePoolPop(v10);
          v9 = CFSTR("tap-to-radar://new?Title=Slow%20WiFi%20detected&AutoDiagnostics=phone&Description=Please%20describe%20user%20activity%3A%0A%0AAt%20the%20time%20of%20Slow%20Wi-Fi%20error%20pop-up%2C%20were%20you%20observing%20any%20degraded%20wifi%20performance%3F%20%5BYes%2FNo%2FUnsure%5D%3A%0A%0AAfter%20selecting%20%E2%80%98Slow%2C%20File%20Radar%E2%80%99%20in%20the%20pop-up%2C%20was%20there%20any%20perceivable%20change%20in%20Wi-Fi%20performance%3F%20%5BYes%2FNo%2FUnsure%5D%3A%0A%0AAre%20you%20currently%20at%20home%2C%20office%20or%20other%20location%3F%0A%0A%20%20-If%20other%20location%2C%20please%20provide%20some%20details%20like%20Starbucks%2C%20Hotel%20captive%20network%2C%20etc%E2%80%A6%0A%0A%20%20-If%20at%20home%3A%0A%20%20%20%20-What%20is%20the%20make%20and%20model%20of%20the%20router%3F%0A%0A%20%20%20%20-Is%20the%20router%20at%20home%20surrounded%20by%20other%20electronic%20devices%20i.e.%20susceptible%20to%20RF%20interference%20or%20any%20obstacles%20strongly%20blocking%20RF%20signal%20%3F&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi");
          goto LABEL_22;
        }
        v14 = self;
        v15 = 512;
LABEL_37:
        -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:](v14, "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:", 0, v15, a5);
        v13 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:User-Cancelled Filing TD Radar", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]");
LABEL_34:
        objc_autoreleasePoolPop(v13);
        return;
      case 0x40:
        if (!-[WiFiSoftErrorManager askToLaunchUserDisconnectRadar](self, "askToLaunchUserDisconnectRadar"))
        {
          -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:](self, "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:", 0, 64, a5);
          v13 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:User-Cancelled Filing UD Radar", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]");
          goto LABEL_34;
        }
        -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:](self, "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:", 64, a5);
        v9 = CFSTR("tap-to-radar://new?Title=WiFi%20User%20Disconnect%20From%20Network&AutoDiagnostics=phone&Description=Please%20provide%20feedback%20on%20following-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20You%20dont%20want%20WiFi%20to%20connect%20to%20this%20network%20%28yes%2Fno%29%20-%0A3.%20Did%20WiFi%20happen%20to%20rejoin%20again%20%28yes%2Fno%29%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug");
        goto LABEL_22;
      case 0x20:
        if (-[WiFiSoftErrorManager askToLaunchTriggerDisconnectRadar:](self, "askToLaunchTriggerDisconnectRadar:", a4))
        {
          -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:](self, "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:", 32, a5);
          v9 = CFSTR("tap-to-radar://new?Title=WiFi%20Trigger%20Disconnected%20too%20early&AutoDiagnostics=phone&Description=Please%20provide%20following%20feedback%20%20-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20Do%20you%20expect%20wifi%20to%20be%20connected%20%28yes%2Fno%29%20-%0A3.%20User%20activity%20during%20this%20period%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi");
          goto LABEL_22;
        }
        v14 = self;
        v15 = 32;
        goto LABEL_37;
    }
  }
  if (!-[WiFiSoftErrorManager askToLaunchTapToRadar:](self, "askToLaunchTapToRadar:", v7))
  {
    -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:](self, "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:", 0, v7, a5);
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s:User-Cancelled Filing Radar", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]");
    goto LABEL_34;
  }
  -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:](self, "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:", v7, a5);
  if ((int)v7 <= 15)
  {
    v9 = CFSTR("tap-to-radar://new?Title=WiFi%20Toggle%20Problem&AutoDiagnostics=phone&Description=WiFi%20doesn't%20seem%20to%20work&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi");
    switch((int)v7)
    {
      case 1:
        goto LABEL_22;
      case 2:
        v9 = CFSTR("tap-to-radar://new?Title=No%20WiFi%20Networks%20Found%20Problem&AutoDiagnostics=phone&Description=I%20am%20not%20seeing%20any%20WiFi%20Networks%20On%20WiFi-Setting%20Page&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi");
        goto LABEL_22;
      case 4:
        v9 = CFSTR("tap-to-radar://new?Title=Slow%20AutoJoin%20Problem&AutoDiagnostics=phone&Description=WiFi%20is%20taking%20too%20long%20to%20connect%20to%20my%20known%20Network&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi");
        goto LABEL_22;
      case 8:
        goto LABEL_21;
      default:
        goto LABEL_32;
    }
  }
  if ((_DWORD)v7 != 256)
  {
LABEL_32:
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: UnKnown Soft-Error Type\n", "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]");
    goto LABEL_34;
  }
  v9 = CFSTR("tap-to-radar://new?Title=WiFi%20Awdl%20Issues&AutoDiagnostics=phone&Description=Please%20provide%20feedback%20on%20following-%0A1.%20Which%20application%20are%20you%20running%29%20-%0A2.%20Did%20you%20see%20any%20performance%20issue%29%20-&ComponentID=482277&ComponentName=WiFi%20AWDL&ComponentVersion=iOS&Classification=Other%20Bug");
LABEL_22:
  v11 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
  if (v11)
  {
    v16 = (id)v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v12, "openURL:", v16);

  }
}

- (void)purgeOutdatedEvents:(id)a3 currTime:(double)a4
{
  uint64_t v5;
  void *v6;
  char *v7;
  char *v8;
  char *i;
  void *v10;
  void *v11;
  double v12;
  void *v14;
  id v15;

  v15 = a3;
  if (!v15)
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: txStallEvents Array is NULL", "-[WiFiSoftErrorManager purgeOutdatedEvents:currTime:]");
    goto LABEL_18;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  if (!v5)
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: outdatedEvents allocation failed", "-[WiFiSoftErrorManager purgeOutdatedEvents:currTime:]");
LABEL_18:
    objc_autoreleasePoolPop(v14);
    goto LABEL_13;
  }
  v6 = (void *)v5;
  v7 = (char *)objc_msgSend(v15, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", i));
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "doubleValue");
        if (v12 != 0.0 && a4 - v12 > 15.0)
          objc_msgSend(v6, "addIndex:", i);
      }

    }
  }
  objc_msgSend(v15, "removeObjectsAtIndexes:", v6);

LABEL_13:
}

- (BOOL)isLQAIndicatingTxStall
{
  int v2;
  unsigned int v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  BOOL v8;
  void *v9;

  v2 = self->_primaryInterfaceStatsHistoryIdx + 4;
  v3 = v2 - 5 * ((13108 * v2) >> 16);
  v4 = (char *)self + 4 * (unsigned __int16)(v2 - 5 * ((13108 * v2) >> 16));
  v5 = *((unsigned int *)v4 + 81);
  v6 = *((unsigned int *)v4 + 76);
  v7 = 0.0;
  if ((_DWORD)v6)
    v8 = (_DWORD)v5 == 0;
  else
    v8 = 1;
  if (!v8)
    v7 = (float)((float)v6 / (float)v5);
  v9 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: lastLqaStatsRdIdx:%u lastSampleStats txFrms:%u txFails:%u txPer:%f", "-[WiFiSoftErrorManager isLQAIndicatingTxStall]", (unsigned __int16)v3, v5, v6, *(_QWORD *)&v7);
  objc_autoreleasePoolPop(v9);
  return v7 > 0.5;
}

- (BOOL)getReachabilityStatus
{
  const __SCNetworkReachability *v2;
  BOOL v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const char *v7;
  SCNetworkReachabilityFlags flags;
  sockaddr address;

  flags = 0;
  *(_QWORD *)&address.sa_data[6] = 0;
  *(_QWORD *)&address.sa_len = 528;
  v2 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  if (SCNetworkReachabilityGetFlags(v2, &flags))
    v3 = flags == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (!v3)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: NetworkReachabilityFlags :0x%0x", "-[WiFiSoftErrorManager getReachabilityStatus]", flags);
    objc_autoreleasePoolPop(v5);
  }
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
  {
    v7 = "NO";
    if (v4)
      v7 = "YES";
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Internet Reachability Status :%s", "-[WiFiSoftErrorManager getReachabilityStatus]", v7);
  }
  objc_autoreleasePoolPop(v6);
  if (v2)
    CFRelease(v2);
  return v4;
}

- (BOOL)supressTapToRadar:(int)a3 deviceContext:(void *)a4
{
  int v6;
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;

  v11 = 0;
  if (sub_100091BC8((uint64_t)self->_manager) == 1)
  {
    v12 = -1431655766;
    v6 = sub_1000A2190((uint64_t)self->_manager, &v12, &v11);
    v7 = objc_autoreleasePoolPush();
    if (v6)
    {
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Failed to get motion state", "-[WiFiSoftErrorManager supressTapToRadar:deviceContext:]", v10, v11);
    }
    else if (qword_10026DD20)
    {
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Motion state is:%u", "-[WiFiSoftErrorManager supressTapToRadar:deviceContext:]", v12, v11);
    }
    objc_autoreleasePoolPop(v7);
    if (a3 > 15)
    {
      if (a3 != 16)
        return a3 == 512;
    }
    else if (a3 != 4 && a3 != 8)
    {
      return 0;
    }
  }
  else
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiDevice UserMode is Not Interactive!", "-[WiFiSoftErrorManager supressTapToRadar:deviceContext:]");
    objc_autoreleasePoolPop(v9);
  }
  return 1;
}

- (BOOL)supressEventDetectionProcesssing:(int)a3 deviceContext:(void *)a4
{
  void *v5;

  if ((a3 & 0xFFFFFFFE) != 4)
    return 0;
  if (a4)
    return (int)sub_100118638((uint64_t)a4) < -70;
  v5 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: deviceManagerRef is NULL!", "-[WiFiSoftErrorManager supressEventDetectionProcesssing:deviceContext:]");
  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)initEventMitigation
{
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[4] = 0u;
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[6] = 0u;
  *(_OWORD *)self->_mitigationInfo.lastMitigationTime = 0u;
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[2] = 0u;
  *(_OWORD *)self->_mitigationInfo.mitigationAttemptCount = 0u;
  *(_OWORD *)&self->_mitigationInfo.mitigationAttemptCount[4] = 0u;
  -[WiFiSoftErrorManager enableSoftErrorMitigation:](self, "enableSoftErrorMitigation:", 2);
  -[WiFiSoftErrorManager enableSoftErrorMitigation:](self, "enableSoftErrorMitigation:", 8);
}

- (void)enableSoftErrorMitigation:(int)a3
{
  unsigned int v4;
  void *v5;

  v4 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:", *(_QWORD *)&a3);
  if (v4 >= 7)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Invalid softError Type", "-[WiFiSoftErrorManager enableSoftErrorMitigation:]");
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    self->_mitigationInfo.mitigationAllowedFlag[v4] = 1;
  }
}

- (void)supressSoftErrorMitigation:(int)a3
{
  unsigned int v4;
  void *v5;

  v4 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:", *(_QWORD *)&a3);
  if (v4 >= 7)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Invalid softError Type", "-[WiFiSoftErrorManager supressSoftErrorMitigation:]");
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    self->_mitigationInfo.mitigationAllowedFlag[v4] = 0;
  }
}

- (BOOL)isEventMitigationEnabled:(int)a3
{
  unsigned int v5;
  void *v7;

  v5 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:");
  if (v5 >= 7)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Invalid softError Type", "-[WiFiSoftErrorManager isEventMitigationEnabled:]");
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (a3 == 8)
      return 1;
    if (a3 == 2)
      return self->_mitigationInfo.mitigationAllowedFlag[v5];
  }
  return 0;
}

- (void)recordMitigation:(int)a3
{
  uint64_t v3;
  CFAbsoluteTime Current;
  unsigned int v6;
  unsigned int v7;
  mitigationAttemptInfo *p_mitigationInfo;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  Current = CFAbsoluteTimeGetCurrent();
  v6 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:", v3);
  if (v6 >= 7)
  {
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Invalid softError Type", "-[WiFiSoftErrorManager recordMitigation:]", v10, v11);
  }
  else
  {
    v7 = v6;
    p_mitigationInfo = &self->_mitigationInfo;
    self->_mitigationInfo.lastMitigationTime[v6] = Current;
    ++self->_mitigationInfo.mitigationAttemptCount[v6];
    if ((_DWORD)v3 == 2)
      -[WiFiSoftErrorManager supressSoftErrorMitigation:](self, "supressSoftErrorMitigation:", 2);
    v9 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: recording mitigationAttempt Count:(%u) for SoftError:%u", "-[WiFiSoftErrorManager recordMitigation:]", p_mitigationInfo->mitigationAttemptCount[v7], v3);
  }
  objc_autoreleasePoolPop(v9);
}

- (unsigned)softErrorTypeIndex:(int)a3
{
  uint64_t v3;
  unsigned int result;
  void *v5;

  v3 = *(_QWORD *)&a3;
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        return 4;
      case 32:
        return 5;
      case 64:
        return 6;
      default:
LABEL_12:
        v5 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Invalid softErrorType:%u", "-[WiFiSoftErrorManager softErrorTypeIndex:]", v3);
        objc_autoreleasePoolPop(v5);
        return 255;
    }
  }
  else
  {
    result = 0;
    switch(a3)
    {
      case 1:
        return result;
      case 2:
        result = 1;
        break;
      case 4:
        result = 2;
        break;
      case 8:
        result = 3;
        break;
      default:
        goto LABEL_12;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxDataStallErrors, 0);
  objc_storeStrong((id *)&self->_txDataStallErrors, 0);
  objc_storeStrong((id *)&self->_autoJoinDelayErrors, 0);
  objc_storeStrong((id *)&self->_noNetworkFoundErrors, 0);
  objc_storeStrong((id *)&self->_wifiToggleErrors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
