@implementation WRM_EnhancedCTService

- (double)getServingCellSNR
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008F40;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSRP
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008E60;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)dataAttachedWithCellularNetwork
{
  const char *v3;

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s isDataAttached %@"), "-[WRM_EnhancedCTService dataAttachedWithCellularNetwork]", v3, -[WRM_EnhancedCTService isDataAttached](self, "isDataAttached"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isDataAttached](self, "isDataAttached"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
}

- (NSMutableArray)isDataAttached
{
  return *(NSMutableArray **)((char *)&self->_dataPreferredSlot + 4);
}

- (BOOL)isIMSPreferenceEnabled
{
  const char *v3;

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s imsVoiceOverPSSupported %@"), "-[WRM_EnhancedCTService isIMSPreferenceEnabled]", v3, -[WRM_EnhancedCTService imsVoiceOverPSSupported](self, "imsVoiceOverPSSupported"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService imsVoiceOverPSSupported](self, "imsVoiceOverPSSupported"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
}

- (NSMutableArray)imsVoiceOverPSSupported
{
  return *(NSMutableArray **)((char *)&self->_VoiceLqmReasonCode + 4);
}

- (BOOL)registeredWithCellularNetwork
{
  const char *v3;

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s isDeviceRegistered %@"), "-[WRM_EnhancedCTService registeredWithCellularNetwork]", v3, -[WRM_EnhancedCTService isDeviceRegistered](self, "isDeviceRegistered"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isDeviceRegistered](self, "isDeviceRegistered"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
}

- (NSMutableArray)isDeviceRegistered
{
  return *(NSMutableArray **)((char *)&self->_isDataEnabled + 4);
}

- (BOOL)isWiFiCallingSupportedAnySlot
{
  uint64_t v3;
  char v4;
  unsigned int v5;
  BOOL v6;

  v3 = 0;
  v4 = 1;
  do
  {
    v5 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isWiFiCallingSupported](self, "isWiFiCallingSupported"), "objectAtIndex:", v3), "BOOLValue");
    v6 = v5;
    if ((v4 & 1) == 0)
      break;
    v4 = 0;
    v3 = 1;
  }
  while (!v5);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: isWiFiCallingSupported %@"), "-[WRM_EnhancedCTService isWiFiCallingSupportedAnySlot]", -[WRM_EnhancedCTService isWiFiCallingSupported](self, "isWiFiCallingSupported"));
  return v6;
}

- (NSMutableArray)isWiFiCallingSupported
{
  return *(NSMutableArray **)((char *)&self->_isDeviceRegistered + 4);
}

- (BOOL)exitSaDepriotizationEval
{
  return dword_100271090 > 0;
}

- (int)getBandInfoDataSlot
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandInfo](self, "cellBandInfo"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s Band info %d"), "-[WRM_EnhancedCTService getBandInfoDataSlot]", v4, v3);
  return (int)v3;
}

- (char)getDataSlotLoad
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService loads](self, "loads"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
}

- (NSMutableArray)loads
{
  return *(NSMutableArray **)((char *)&self->_PrevAudioErasurePercent + 4);
}

- (int)getUARFCNDataSlot
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellARFCN](self, "cellARFCN"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s ARFCN %d"), "-[WRM_EnhancedCTService getUARFCNDataSlot]", v4, v3);
  return (int)v3;
}

- (double)getMeasureBWDataSlot
{
  double v3;
  double v4;
  const char *v5;
  int64_t v6;

  objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataBW](self, "dataBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
  v4 = v3;
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v5 = "CTSubscriptionSlotOne";
    }
    else
    {
      v6 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v5 = "Unknown CTSubscriptionSlot!!!";
      if (v6 == 2)
        v5 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v5 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s BW %f"), "-[WRM_EnhancedCTService getMeasureBWDataSlot]", v5, *(_QWORD *)&v4);
  return v4;
}

- (double)getServingCellRSRQ
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008D80;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isVoiceLQMValid
{
  unsigned int v3;
  const char *v4;
  int64_t v5;
  const char *v6;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmIsValid](self, "VoiceLqmIsValid"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService activeSlot](self, "activeSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  v6 = "No";
  if (v3)
    v6 = "Yes";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s vLQM is valid? %s"), "-[WRM_EnhancedCTService isVoiceLQMValid]", v4, v6);
  return v3;
}

- (NSMutableArray)VoiceLqmIsValid
{
  return *(NSMutableArray **)((char *)&self->_VoiceLqmValue + 4);
}

- (int)getLteVoiceLQM
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService activeSlot](self, "activeSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s vLQM %d"), "-[WRM_EnhancedCTService getLteVoiceLQM]", v4, v3);
  return (int)v3;
}

- (BOOL)isVoLTESupported
{
  const char *v3;

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s isVoLTESupported %@"), "-[WRM_EnhancedCTService isVoLTESupported]", v3, -[WRM_EnhancedCTService isVolteSupported](self, "isVolteSupported"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isVolteSupported](self, "isVolteSupported"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
}

- (NSMutableArray)isVolteSupported
{
  return *(NSMutableArray **)((char *)&self->_isPrivateNetworkPreferredOverWifi + 4);
}

- (float)getCurrentMovAvgSignalBars
{
  float v2;
  _QWORD v4[6];
  uint64_t v5;
  float *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = (float *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000351E4;
  v4[3] = &unk_100201BE0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[6];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)updateMovAverageOfSignalBar
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000354A8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (NSMutableArray)movingAverageSignalBars
{
  return *(NSMutableArray **)((char *)&self->_bars + 4);
}

- (int64_t)getCurrentSignalBars
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100036C10;
  v4[3] = &unk_100201BE0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSMutableArray)bars
{
  return *(NSMutableArray **)((char *)&self->_dataEnabled + 4);
}

- (int)getServingCellType
{
  int v3;
  const char *v4;
  NSMutableArray *v5;
  int v6;
  const char *v7;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v4 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v4 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  v5 = -[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType");
  v6 = v3 - 1;
  if ((v3 - 1) < 0xA && ((0x2FFu >> v6) & 1) != 0)
  {
    v7 = (&off_1002021B8)[v6];
  }
  else
  {
    v7 = "UNKNOWN_RADIO!!!";
    if (v3 == 9)
      v7 = "N_RADIO";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s rat property %@ rat %s"), "-[WRM_EnhancedCTService getServingCellType]", v4, v5, v7);
  return v3;
}

- (NSMutableArray)servCellRadioTechnologyType
{
  return *(NSMutableArray **)((char *)&self->_movingAverageSignalBars + 4);
}

- (BOOL)isDeviceUsingFR2Radio
{
  const char *v3;

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s isFR2 %@"), "-[WRM_EnhancedCTService isDeviceUsingFR2Radio]", v3, -[WRM_EnhancedCTService isFR2Radio](self, "isFR2Radio"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isFR2Radio](self, "isFR2Radio"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "BOOLValue");
}

- (int64_t)activeSlot
{
  return *(_QWORD *)(&self->_dataPreferredSlotOnCBRS + 1);
}

- (NSMutableArray)isFR2Radio
{
  return *(NSMutableArray **)((char *)&self->_isRoaming + 4);
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  WRM_EnhancedCTService *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void **v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSMutableArray *v26;
  char *v27;
  id v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  NSMutableArray *v32;
  char *v33;
  id v34;
  char *v35;
  id v36;
  int v37;
  NSMutableArray *v38;
  char *v39;
  id v40;
  char *v41;
  id v42;
  WRM_EnhancedCTService *v43;
  NSMutableArray *v44;
  void *v45;
  uint64_t v46;
  NSMutableArray *v47;
  __objc2_class **p_superclass;
  id v49;
  id v50;
  id v51;
  WRM_EnhancedCTService *v52;
  NSMutableArray *v53;
  char v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ cell info %@"), "-[WRM_EnhancedCTService cellMonitorUpdate:info:]", a3, a4);
  v7 = objc_msgSend(a4, "legacyInfo");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
          return;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v9);
  }
  if (!v7 || !objc_msgSend(v7, "count"))
    return;
  v64 = a3;
  v14 = (void **)&ADClientAddValueForScalarKey_ptr;
  v15 = self;
  if (!objc_msgSend(v7, "count"))
  {
    v49 = 0;
    LODWORD(v19) = 0;
    v51 = 0;
    v50 = 0;
    v63 = 0;
    p_superclass = (__objc2_class **)(WRM_SCService + 8);
    goto LABEL_42;
  }
  v16 = 0;
  v56 = 0;
  v57 = 0;
  v17 = 0;
  v54 = 0;
  v55 = 0;
  v18 = 0;
  v62 = kCTCellMonitorCellId;
  v61 = kCTCellMonitorUARFCN;
  v60 = kCTCellMonitorBandInfo;
  v59 = kCTCellMonitorBandwidth;
  v58 = kCTCellMonitorNRARFCN;
  do
  {
    v19 = v17;
    v20 = v18;
    v21 = v14;
    v22 = objc_msgSend(v7, "objectAtIndex:", v16);
    v23 = objc_msgSend(v22, "objectForKeyedSubscript:", v62);
    if (v23)
      v19 = objc_msgSend(v23, "intValue");
    v24 = objc_msgSend(v22, "objectForKeyedSubscript:", v61);
    if (v24)
    {
      v25 = objc_msgSend(v24, "intValue");
      v26 = -[WRM_EnhancedCTService cellARFCN](self, "cellARFCN");
      v27 = (char *)objc_msgSend(v64, "slotID") - 1;
      v56 = v25;
      v28 = objc_msgSend(v21[121], "numberWithInt:", v25);
      v29 = v26;
      self = v15;
      -[NSMutableArray replaceObjectAtIndex:withObject:](v29, "replaceObjectAtIndex:withObject:", v27, v28);
    }
    v30 = objc_msgSend(v22, "objectForKeyedSubscript:", v60);
    if (v30)
    {
      v31 = objc_msgSend(v30, "intValue");
      v32 = -[WRM_EnhancedCTService cellBandInfo](self, "cellBandInfo");
      v33 = (char *)objc_msgSend(v64, "slotID") - 1;
      v55 = v31;
      v34 = objc_msgSend(v21[121], "numberWithInt:", v31);
      v35 = v33;
      self = v15;
      -[NSMutableArray replaceObjectAtIndex:withObject:](v32, "replaceObjectAtIndex:withObject:", v35, v34);
    }
    v36 = objc_msgSend(v22, "objectForKeyedSubscript:", v59);
    v14 = v21;
    v18 = v20;
    v17 = v19;
    if (v36)
    {
      v37 = objc_msgSend(v36, "intValue");
      if (v37 > 49)
      {
        switch(v37)
        {
          case '2':
            v18 = 10;
            goto LABEL_34;
          case 'K':
            v18 = 15;
            goto LABEL_34;
          case 'd':
            v18 = 20;
            goto LABEL_34;
        }
      }
      else
      {
        switch(v37)
        {
          case 6:
            v18 = 1;
            goto LABEL_34;
          case 16:
            v18 = 3;
            goto LABEL_34;
          case 25:
            v18 = 5;
LABEL_34:
            v38 = -[WRM_EnhancedCTService cellBandwidth](self, "cellBandwidth");
            v39 = (char *)objc_msgSend(v64, "slotID") - 1;
            v40 = objc_msgSend(v14[121], "numberWithInt:", v18);
            v41 = v39;
            self = v15;
            -[NSMutableArray replaceObjectAtIndex:withObject:](v38, "replaceObjectAtIndex:withObject:", v41, v40);
            goto LABEL_35;
        }
      }
      v18 = 0;
      goto LABEL_34;
    }
LABEL_35:
    v42 = objc_msgSend(v22, "objectForKeyedSubscript:", v58);
    if (v42)
    {
      v57 = objc_msgSend(v42, "intValue");
      v54 = 1;
    }
    ++v16;
  }
  while ((unint64_t)objc_msgSend(v7, "count") > v16);
  if ((v54 & 1) != 0)
  {
    v63 = v18;
    v43 = v15;
    v44 = -[WRM_EnhancedCTService cellID](v15, "cellID");
    v45 = v64;
    -[NSMutableArray replaceObjectAtIndex:withObject:](v44, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v64, "slotID") - 1, objc_msgSend(v14[121], "numberWithInt:", v19));
    v46 = 1;
    -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService currNRCellFound](v43, "currNRCellFound"), "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v64, "slotID") - 1, objc_msgSend(v14[121], "numberWithInt:", 1));
    v47 = -[WRM_EnhancedCTService wifiNRCellFound](v43, "wifiNRCellFound");
    p_superclass = (__objc2_class **)(WRM_SCService + 8);
    v50 = v55;
    v49 = v56;
    goto LABEL_45;
  }
  v63 = v18;
  p_superclass = WRM_SCService.superclass;
  v50 = v55;
  v49 = v56;
  v51 = v57;
LABEL_42:
  v52 = v15;
  v53 = -[WRM_EnhancedCTService cellID](v15, "cellID");
  v45 = v64;
  if (objc_msgSend(-[NSMutableArray objectAtIndex:](v53, "objectAtIndex:", (char *)objc_msgSend(v64, "slotID") - 1), "intValue") == (_DWORD)v19)
  {
    v46 = 0;
  }
  else
  {
    v57 = v51;
    -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService wifiNRCellFound](v52, "wifiNRCellFound"), "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v64, "slotID") - 1, objc_msgSend(v14[121], "numberWithInt:", 0));
    v47 = -[WRM_EnhancedCTService currNRCellFound](v52, "currNRCellFound");
    v46 = 0;
LABEL_45:
    -[NSMutableArray replaceObjectAtIndex:withObject:](v47, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v45, "slotID") - 1, objc_msgSend(v14[121], "numberWithInt:", v46));
    v51 = v57;
  }
  objc_msgSend(p_superclass + 279, "logLevel:message:", 22, CFSTR("%s ARFCN: %d, CellBW: %d, CellBandInfo: %d, NRCellFound: %d, nARFCN: %d"), "-[WRM_EnhancedCTService cellMonitorUpdate:info:]", v49, v63, v50, v46, v51);
}

- (void)evaluateCellularScore:(unsigned __int8)a3 currnetConf:(unsigned __int8)a4 score:(char *)a5 conf:(char *)a6 evalMode:(BOOL)a7 outrankExit:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  unsigned int v13;
  id v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  const __CFString *v26;
  int64_t v27;
  id v28;
  id v29;
  unsigned int v30;
  id v31;
  unsigned int v32;
  uint64_t v33;
  const char *v34;
  int64_t v35;
  char *v36;
  char v37;
  char v38;
  char *v39;
  char v40;
  double mCellRSRP4G5GvsWiFiThreshold;
  id v42;
  id v43;
  unsigned int v44;
  _BOOL4 v45;
  unsigned int v46;
  BOOL v47;
  char *v48;
  unsigned int v49;
  int v50;
  id v51;
  id v52;
  id v53;
  unsigned int v54;

  v8 = a8;
  v9 = a7;
  *a5 = a3;
  *a6 = a4;
  v13 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v14 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentNRCellType](self, "currentNRCellType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v15 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService rrcState](self, "rrcState"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (v13 == 9 || (_DWORD)v14 == 3)
  {
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v17 = v21;
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellSNR](self, "nrCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v19 = v22;
    v20 = -[WRM_EnhancedCTService nrCellRSRQ](self, "nrCellRSRQ");
  }
  else
  {
    if (v13 != 1)
    {
      *a5 = 3;
      *a6 = 2;
      v26 = CFSTR("evaluateCellularScore: score: bad");
LABEL_31:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v26);
      return;
    }
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v17 = v16;
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellSNR](self, "servCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v19 = v18;
    v20 = -[WRM_EnhancedCTService servCellRSRQ](self, "servCellRSRQ");
  }
  objc_msgSend(-[NSMutableArray objectAtIndex:](v20, "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
  v24 = v23;
  v45 = v17 >= (double)(int)self->mCellConfiguredBandwidth && v23 >= (double)self->mCellRSRP4G5GvsWiFiThreshold;
  v48 = a5;
  v46 = v13;
  v51 = v14;
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v25 = "CTSubscriptionSlotOne";
    }
    else
    {
      v27 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v25 = "Unknown CTSubscriptionSlot!!!";
      if (v27 == 2)
        v25 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v25 = "CTSubscriptionSlotUnknown";
  }
  v47 = v9;
  v50 = (int)v15;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: RRC state: %d, forceActiveEval:%d, RSRP: %f, SNR: %f, RSRQ: %f, data slot: %s, locationEnabled:%d, exitOutrank: %d"), v15, v9, *(_QWORD *)&v17, v19, *(_QWORD *)&v24, v25, byte_100270960, v8);
  v54 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentHarvestedCellTypeFR2Capable](self, "currentHarvestedCellTypeFR2Capable"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v44 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService stallDetected](self, "stallDetected"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v28 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService neighberCellType](self, "neighberCellType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v49 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService highDataRateObserved](self, "highDataRateObserved"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "BOOLValue");
  v53 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDL](self, "estimatedBWDL"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v29 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDLConf](self, "estimatedBWDLConf"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v43 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v42 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v30 = -[WRM_EnhancedCTService getWiFiNRStatusDataSlot](self, "getWiFiNRStatusDataSlot");
  v52 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v31 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v32 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellBW](self, "detectedFR1CellBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v33 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandwidth](self, "cellBandwidth"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue")+ v32;
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v34 = "CTSubscriptionSlotOne";
    }
    else
    {
      v35 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v34 = "Unknown CTSubscriptionSlot!!!";
      if (v35 == 2)
        v34 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v34 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: LocationDB FR1 count: %d, FR2 count: %d: BW:%d  %s"), v52, v31, v33, v34);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: HarvestedCellFR2: %d, NeighberCell: %d, Connected Cell: %d, High rate likely : %d, DL BW:%d, DL Conf:%d isWiFiCellNR: %d"), v54 != 0, v28, v51, v49, v53, v29, v30 != 0);
  if (v50 == 1 || v47 || v8)
  {
    if (v8)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: exit outrank WiFi quality good, NR not added and LTE can't support high bandwidth"));
      *v48 = 3;
      v36 = a6;
LABEL_69:
      *v36 = 2;
      return;
    }
    if ((int)v29 < 5)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: dLQM: %d, vLQM: %d, RLGS stal: %d"), v43, v42, v44 != 0);
      if ((_DWORD)v43 != 10 && (_DWORD)v42 != 10 && !v44)
      {
        if ((v45 & v49 & 1) != 0)
        {
          v26 = CFSTR("evaluateCellularScore: RRC Connected mode");
          goto LABEL_31;
        }
        goto LABEL_58;
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: DLBW: %d, Conf:%d"), v53, v29);
      if ((int)v53 > 1999)
      {
        if ((v45 & v49 & 1) != 0)
        {
          v37 = 1;
LABEL_54:
          *v48 = v37;
          v38 = 2;
LABEL_59:
          *a6 = v38;
          return;
        }
LABEL_58:
        *v48 = 2;
        v38 = 1;
        goto LABEL_59;
      }
    }
    v37 = 3;
    goto LABEL_54;
  }
  if ((_DWORD)v28 == 2 || (_DWORD)v51 == 2 || (_DWORD)v31 || !byte_100270960 && v54)
  {
    *v48 = 1;
    *a6 = 2;
    v26 = CFSTR("evaluateCellularScore: FR2 evaluation");
    goto LABEL_31;
  }
  if (v46 == 9
    || (v28 & 0xFFFFFFFD) == 1
    || (_DWORD)v51 == 1
    || (_DWORD)v28 == 4
    || (_DWORD)v51 == 3
    || (_DWORD)v51 == 4
    || (_DWORD)v52
    || v30)
  {
    if (v17 < (double)(int)self->mCellConfiguredBandwidth)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: FR1 evaluation, radio Condition good: %d"), 0);
      v39 = v48;
      v36 = a6;
LABEL_57:
      v40 = 2;
LABEL_68:
      *v39 = v40;
      goto LABEL_69;
    }
    mCellRSRP4G5GvsWiFiThreshold = (double)self->mCellRSRP4G5GvsWiFiThreshold;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: FR1 evaluation, radio Condition good: %d"), v24 >= mCellRSRP4G5GvsWiFiThreshold);
    if ((v49 & 1) != 0)
    {
      v39 = v48;
      v36 = a6;
      if (v24 < mCellRSRP4G5GvsWiFiThreshold)
        goto LABEL_57;
    }
    else
    {
      v39 = v48;
      v36 = a6;
      if (v24 < mCellRSRP4G5GvsWiFiThreshold
        || v33 < HIDWORD(self->mInternetInterfaceName)
        || !(_DWORD)v52)
      {
        goto LABEL_57;
      }
    }
    v40 = 1;
    goto LABEL_68;
  }
  if (!v54)
  {
    *v48 = 3;
    *a6 = 2;
    v26 = CFSTR("evaluateCellularScore: default evaluation");
    goto LABEL_31;
  }
  *v48 = 2;
  *a6 = 1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScore: Fall back FR2 eval, auth: %d"), byte_100270960);
}

- (int64_t)dataPreferredSlot
{
  return *(int64_t *)((char *)&self->_subscriptions + 4);
}

- (NSMutableArray)VoiceLqmValue
{
  return *(NSMutableArray **)((char *)&self->_servCellRadioTechnologyType + 4);
}

- (OS_dispatch_queue)queue
{
  return *(CoreTelephonyClient **)((char *)&self->_CTClient + 4);
}

- (int)getWiFiNRStatusDataSlot
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService wifiNRCellFound](self, "wifiNRCellFound"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s NR Available %d"), "-[WRM_EnhancedCTService getWiFiNRStatusDataSlot]", v4, v3);
  return (int)v3;
}

- (NSMutableArray)wifiNRCellFound
{
  return *(NSMutableArray **)((char *)&self->_currNRCellFound + 4);
}

- (void)setActiveSlot:(int64_t)a3
{
  if (!a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: Slot set to %s, changing it to Slot 1"), "-[WRM_EnhancedCTService setActiveSlot:]", "CTSubscriptionSlotUnknown");
    a3 = 1;
  }
  *(_QWORD *)(&self->_dataPreferredSlotOnCBRS + 1) = a3;
}

- (NSMutableArray)stallDetected
{
  return *(NSMutableArray **)((char *)&self->_currentHarvestedCellTypeFR2Capable + 4);
}

- (NSMutableArray)servCellSNR
{
  return *(NSMutableArray **)((char *)&self->_servCellRSRQ + 4);
}

- (NSMutableArray)servCellRSRQ
{
  return *(NSMutableArray **)((char *)&self->_servCellRSSI + 4);
}

- (NSMutableArray)servCellRSRP
{
  return *(NSMutableArray **)((char *)&self->_imsVoiceOverPSSupported + 4);
}

- (NSMutableArray)rrcState
{
  return *(NSMutableArray **)((char *)&self->_loads + 4);
}

- (NSMutableArray)neighberCellType
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWULConf + 4);
}

- (BOOL)isDataPreferredSlotCBRS
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000184B8;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSMutableArray)highDataRateObserved
{
  return *(NSMutableArray **)((char *)&self->_neighberCellType + 4);
}

- (int)getCurrentNRStatusDataSlot
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currNRCellFound](self, "currNRCellFound"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s NR Available %d"), "-[WRM_EnhancedCTService getCurrentNRStatusDataSlot]", v4, v3);
  return (int)v3;
}

- (int)getCTDataIndictor
{
  unsigned int v3;
  const char *v4;
  int64_t v5;
  const char *v6;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataIndicator](self, "dataIndicator"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  if (v3 < 0x13 && ((0x5FFF7u >> v3) & 1) != 0)
  {
    v6 = (&off_1002022A0)[v3];
  }
  else
  {
    v6 = "Unknown kCTDataIndicatorStatusUnknown!!!";
    if (v3 == 17)
      v6 = "5GUwb";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s Data indicator: %s"), "-[WRM_EnhancedCTService getCTDataIndictor]", v4, v6);
  return v3;
}

- (NSMutableArray)dataIndicator
{
  return *(NSMutableArray **)((char *)&self->_nrCellSNR + 4);
}

- (int)getBandWidthDataSlot
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandwidth](self, "cellBandwidth"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s Cell BW %d"), "-[WRM_EnhancedCTService getBandWidthDataSlot]", v4, v3);
  return (int)v3;
}

- (NSMutableArray)cellBandwidth
{
  return *(NSMutableArray **)((char *)&self->_cellBandInfo + 4);
}

- (NSMutableArray)estimatedBWDL
{
  return *(NSMutableArray **)((char *)&self->_configuredMaxULBW + 4);
}

- (NSMutableArray)estimatedBWDLConf
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWDL + 4);
}

- (NSMutableArray)detectedFR2CellCountLocDB
{
  return *(NSMutableArray **)((char *)&self->_detectedFR1CellBW + 4);
}

- (NSMutableArray)detectedFR1CellCountLocDB
{
  return *(NSMutableArray **)((char *)&self->_cbrsCoreAnalyticsMetricsSent + 4);
}

- (NSMutableArray)detectedFR1CellBW
{
  return *(NSMutableArray **)((char *)&self->_detectedFR1CellCountLocDB + 4);
}

- (NSMutableArray)currentNRCellType
{
  return *(NSMutableArray **)((char *)&self->_highDataRateObserved + 4);
}

- (NSMutableArray)currentHarvestedCellTypeFR2Capable
{
  return *(NSMutableArray **)((char *)&self->_currentNRCellType + 4);
}

- (NSMutableArray)currNRCellFound
{
  return *(NSMutableArray **)((char *)&self->_cellBandwidth + 4);
}

- (NSMutableArray)DataLqmValue
{
  return *(NSMutableArray **)((char *)&self->_VoiceLqmIsValid + 4);
}

+ (id)wrm_EnhancedCTServiceSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000322A8;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_100271080 != -1)
    dispatch_once(&qword_100271080, block);
  return (id)qword_100271088;
}

- (void)updateLTEBandwidth:(int64_t)a3 LTEBW:(unsigned int)a4
{
  _QWORD block[6];
  unsigned int v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018AEC;
  block[3] = &unk_100201F00;
  v5 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)updateHighRateLikely:(int64_t)a3 highrateIndicator:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000188EC;
  block[3] = &unk_100201D70;
  v5 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)updateConnectedStateSummary:(int64_t)a3 neighberNRCell:(int)a4 highrateIndicator:(BOOL)a5
{
  _QWORD block[6];
  int v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001881C;
  block[3] = &unk_100201F00;
  v6 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue", a3, *(_QWORD *)&a4, a5), block);
}

- (NSMutableArray)isExpensive
{
  return *(NSMutableArray **)((char *)&self->_dataModeLTE + 4);
}

- (NSMutableArray)isDataEnabled
{
  return *(NSMutableArray **)((char *)&self->_isDataAttached + 4);
}

- (BOOL)isAudioQualityGood
{
  unsigned int v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService activeSlot](self, "activeSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s PrevAudioQualityWasGood %d"), "-[WRM_EnhancedCTService isAudioQualityGood]", v4, v3);
  return v3;
}

- (unsigned)getWRMCellOutrankWifiBWThreshold
{
  unsigned int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000189B0;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)getRRCState
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService rrcState](self, "rrcState"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
}

- (BOOL)deviceICheapFR2Coverage
{
  WRM_EnhancedCTService *v2;
  id v3;

  v2 = self;
  objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isExpensive](self, "isExpensive"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "BOOLValue");
  objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataModeLTE](v2, "dataModeLTE"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](v2, "dataPreferredSlot") - 1), "BOOLValue");
  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](v2, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](v2, "dataPreferredSlot") - 1), "intValue");
  LODWORD(v2) = (_DWORD)v3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("deviceICheapFR2Coverage:%d"), v3);
  return (_DWORD)v2 != 0;
}

- (NSMutableArray)dataModeLTE
{
  return *(NSMutableArray **)((char *)&self->_stallDetected + 4);
}

- (NSMutableArray)dataBW
{
  return *(NSMutableArray **)((char *)&self->_dataIndicator + 4);
}

- (BOOL)cellularDataEnabled
{
  const char *v3;

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s isDataEnabled %@"), "-[WRM_EnhancedCTService cellularDataEnabled]", v3, -[WRM_EnhancedCTService isDataEnabled](self, "isDataEnabled"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isDataEnabled](self, "isDataEnabled"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
}

- (NSMutableArray)cellID
{
  return *(NSMutableArray **)((char *)&self->_wifiNRCellFound + 4);
}

- (NSMutableArray)cellBandInfo
{
  return *(NSMutableArray **)((char *)&self->_cellARFCN + 4);
}

- (NSMutableArray)cellARFCN
{
  return *(NSMutableArray **)((char *)&self->_locDbRequired + 4);
}

- (NSMutableArray)PrevAudioQualityWasGood
{
  return *(NSMutableArray **)((char *)&self->_servCellECIO + 4);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "wrm_EnhancedCTServiceSingleton", a3);
}

- (unint64_t)retainCount
{
  return -1;
}

- (WRM_EnhancedCTService)init
{
  char *v2;
  id v3;
  NSObject *global_queue;
  uint64_t v5;
  char v6;
  char v7;
  id v8;
  double v9;
  uint64_t v10;
  _QWORD block[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WRM_EnhancedCTService;
  v2 = -[WRM_CTService init](&v13, "init");
  if (v2)
  {
    objc_msgSend(v2, "setQueue:", dispatch_queue_create("com.apple.WirelessRadioManager.enhancedCTClient", 0));
    objc_msgSend(v2, "setServerQueue:", dispatch_queue_create("com.apple.WirelessRadioManager.enhancedCTServer", 0));
    objc_msgSend(v2, "setCellularAvailabilityStatusQueue:", dispatch_queue_create("com.apple.WirelessRadioManager.enhancedCTCellularAvailabilityStatus", 0));
    objc_msgSend(v2, "setCTClientInitDone:", 0);
    objc_msgSend(v2, "setMSubscriptionInfoDidChange:", 0);
    objc_msgSend(v2, "setActiveSlot:", 1);
    objc_msgSend(v2, "setSubscriptions:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsDataAttached:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsDataEnabled:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsDeviceRegistered:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsVolteSupported:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsWiFiCallingSupported:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsPrivateNetworkSim:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsPrivateNetworkPreferredOverWifi:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsRoaming:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsFR2Radio:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setRadioCoverage:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setRadioFrequency:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDataEnabled:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setBars:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setMovingAverageSignalBars:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellRadioTechnologyType:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setVoiceLqmValue:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setVoiceLqmIsValid:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setVoiceLqmReasonCode:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setImsVoiceOverPSSupported:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellRSRP:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellRSRQ:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellRSSI:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellSNR:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellSINR:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellRSCP:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setServCellECIO:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setPrevAudioQualityWasGood:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setPrevAudioErasurePercent:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setLoads:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setRrcState:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setMcc:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setMnc:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setNrCellRSRP:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setNrCellRSRQ:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setNrCellSNR:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDataIndicator:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDataBW:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCellARFCN:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCellBandInfo:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCellBandwidth:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setLocDbRequired:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCurrNRCellFound:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setWifiNRCellFound:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCurrCBRSCellFound:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDataPreferredSlotOnCBRS:", 0);
    objc_msgSend(v2, "setWifiCBRSCellFound:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCbrsCoreAnalyticsMetricsSent:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDetectedFR1CellCountLocDB:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDetectedFR1CellBW:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDetectedFR2CellCountLocDB:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCellID:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setConfiguredMaxDLBW:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setConfiguredMaxULBW:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setEstimatedBWDL:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setEstimatedBWDLConf:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setEstimatedBWUL:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setEstimatedBWULConf:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setNeighberCellType:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setHighDataRateObserved:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCurrentNRCellType:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setCurrentHarvestedCellTypeFR2Capable:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setStallDetected:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setDataModeLTE:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    objc_msgSend(v2, "setIsExpensive:", objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2));
    *(_QWORD *)(v2 + 372) = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    *((_DWORD *)v2 + 95) = -1;
    v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getSCService");
    *(_QWORD *)(v2 + 428) = v3;
    if (!v3)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s: Creating SC Service WRM_SCServiceControllerSingleton"), "-[WRM_EnhancedCTService init]");
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100033730;
      block[3] = &unk_1002019E8;
      block[4] = v2;
      dispatch_async(global_queue, block);
    }
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      objc_msgSend(objc_msgSend(v2, "isDataAttached"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isDataEnabled"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), v5);
      objc_msgSend(objc_msgSend(v2, "isDeviceRegistered"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isVolteSupported"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isWiFiCallingSupported"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isPrivateNetworkSim"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isPrivateNetworkPreferredOverWifi"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isRoaming"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isFR2Radio"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "radioCoverage"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "radioFrequency"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "dataEnabled"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "bars"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 5), v5);
      v8 = objc_msgSend(v2, "movingAverageSignalBars");
      LODWORD(v9) = 5.0;
      objc_msgSend(v8, "insertObject:atIndex:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9), v5);
      objc_msgSend(objc_msgSend(v2, "servCellRadioTechnologyType"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 10), v5);
      objc_msgSend(objc_msgSend(v2, "VoiceLqmValue"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL), v5);
      objc_msgSend(objc_msgSend(v2, "VoiceLqmIsValid"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "VoiceLqmReasonCode"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "imsVoiceOverPSSupported"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), v5);
      objc_msgSend(objc_msgSend(v2, "servCellRSRP"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "servCellRSRQ"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "servCellRSSI"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "servCellSNR"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "servCellSINR"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "servCellRSCP"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "servCellECIO"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "PrevAudioQualityWasGood"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), v5);
      objc_msgSend(objc_msgSend(v2, "PrevAudioErasurePercent"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "loads"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "rrcState"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "nrCellRSRP"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "nrCellRSRQ"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "nrCellSNR"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "dataIndicator"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "dataBW"), "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), v5);
      objc_msgSend(objc_msgSend(v2, "mcc"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "mnc"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "locDbRequired"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "cellARFCN"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "cellBandInfo"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "cellBandwidth"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "currNRCellFound"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "wifiNRCellFound"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "currCBRSCellFound"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "cbrsCoreAnalyticsMetricsSent"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "detectedFR1CellCountLocDB"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "detectedFR1CellBW"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "detectedFR2CellCountLocDB"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "cellID"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "configuredMaxDLBW"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "configuredMaxULBW"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "estimatedBWDL"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "estimatedBWDLConf"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "estimatedBWUL"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "estimatedBWULConf"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "neighberCellType"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "highDataRateObserved"), "insertObject:atIndex:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "currentNRCellType"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "currentHarvestedCellTypeFR2Capable"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "stallDetected"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "dataModeLTE"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(objc_msgSend(v2, "isExpensive"), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      objc_msgSend(*(id *)(v2 + 372), "insertObject:atIndex:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0), v5);
      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
    objc_msgSend(v2, "setNumberofSubscriptions:", 1);
    objc_msgSend(v2, "setDataPreferredSlot:", 1);
    *(_QWORD *)(v2 + 316) = 0;
    *(_QWORD *)(v2 + 324) = 0;
    *(_QWORD *)(v2 + 332) = 0;
    *(_QWORD *)(v2 + 340) = 0;
    *(_QWORD *)(v2 + 348) = 0;
    v2[364] = 0;
    *(_QWORD *)(v2 + 388) = 0;
    *(_QWORD *)(v2 + 396) = 0;
    *(_QWORD *)(v2 + 404) = 0xC08F400000000000;
    objc_msgSend(v2, "initSOSWaypointThreshold");
    *(_QWORD *)(v2 + 412) = v10;
    v2[420] = 0;
    *((_DWORD *)v2 + 113) = 40;
    *((_DWORD *)v2 + 114) = 250000;
    *((_DWORD *)v2 + 115) = -105;
    *((_DWORD *)v2 + 116) = -20;
    *(_QWORD *)(v2 + 468) = 0;
    *(_QWORD *)(v2 + 476) = 0;
    *((_DWORD *)v2 + 109) = 0;
    v2[484] = 0;
    *(_QWORD *)(v2 + 444) = 0;
    objc_msgSend(v2, "initCellularProductExperimentsManager");
    objc_msgSend(v2, "initCellStationManager");
    objc_msgSend(v2, "initLocationController");
    objc_msgSend(v2, "createWrmSdmLocationManager");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("enhancedCTService: module initialized"));
  }
  return (WRM_EnhancedCTService *)v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("enhancedCTService: Dealloc !!"));
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService subscriptions](self, "subscriptions"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isDataAttached](self, "isDataAttached"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isDataEnabled](self, "isDataEnabled"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService bars](self, "bars"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService movingAverageSignalBars](self, "movingAverageSignalBars"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isDeviceRegistered](self, "isDeviceRegistered"), "removeAllObjects");
  objc_msgSend(*(id *)(&self->mWrmSdmLocationMonitoringStarted + 4), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isVolteSupported](self, "isVolteSupported"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isWiFiCallingSupported](self, "isWiFiCallingSupported"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isPrivateNetworkSim](self, "isPrivateNetworkSim"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isRoaming](self, "isRoaming"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService isFR2Radio](self, "isFR2Radio"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService radioCoverage](self, "radioCoverage"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService radioFrequency](self, "radioFrequency"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService dataEnabled](self, "dataEnabled"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService VoiceLqmIsValid](self, "VoiceLqmIsValid"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService VoiceLqmReasonCode](self, "VoiceLqmReasonCode"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService imsVoiceOverPSSupported](self, "imsVoiceOverPSSupported"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellRSSI](self, "servCellRSSI"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellRSRQ](self, "servCellRSRQ"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellSNR](self, "servCellSNR"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellSINR](self, "servCellSINR"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellECIO](self, "servCellECIO"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService servCellRSCP](self, "servCellRSCP"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService PrevAudioErasurePercent](self, "PrevAudioErasurePercent"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService loads](self, "loads"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService rrcState](self, "rrcState"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService nrCellRSRQ](self, "nrCellRSRQ"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService nrCellSNR](self, "nrCellSNR"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService mcc](self, "mcc"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService mnc](self, "mnc"), "removeAllObjects");
  -[NSMutableArray removeAllObjects](-[WRM_EnhancedCTService locDbRequired](self, "locDbRequired"), "removeAllObjects");
  if (-[WRM_EnhancedCTService isDataAttached](self, "isDataAttached"))
  {

    -[WRM_EnhancedCTService setIsDataAttached:](self, "setIsDataAttached:", 0);
  }
  if (-[WRM_EnhancedCTService isDataEnabled](self, "isDataEnabled"))
  {

    -[WRM_EnhancedCTService setIsDataEnabled:](self, "setIsDataEnabled:", 0);
  }
  if (-[WRM_EnhancedCTService isDeviceRegistered](self, "isDeviceRegistered"))
  {

    -[WRM_EnhancedCTService setIsDeviceRegistered:](self, "setIsDeviceRegistered:", 0);
  }
  v3 = *(void **)(&self->mWrmSdmLocationMonitoringStarted + 4);
  if (v3)
  {

    *(_QWORD *)(&self->mWrmSdmLocationMonitoringStarted + 4) = 0;
  }
  if (-[WRM_EnhancedCTService isVolteSupported](self, "isVolteSupported"))
  {

    -[WRM_EnhancedCTService setIsVolteSupported:](self, "setIsVolteSupported:", 0);
  }
  if (-[WRM_EnhancedCTService isWiFiCallingSupported](self, "isWiFiCallingSupported"))
  {

    -[WRM_EnhancedCTService setIsWiFiCallingSupported:](self, "setIsWiFiCallingSupported:", 0);
  }
  if (-[WRM_EnhancedCTService isPrivateNetworkSim](self, "isPrivateNetworkSim"))
  {

    -[WRM_EnhancedCTService setIsPrivateNetworkSim:](self, "setIsPrivateNetworkSim:", 0);
  }
  if (-[WRM_EnhancedCTService isPrivateNetworkPreferredOverWifi](self, "isPrivateNetworkPreferredOverWifi"))
  {

    -[WRM_EnhancedCTService setIsPrivateNetworkPreferredOverWifi:](self, "setIsPrivateNetworkPreferredOverWifi:", 0);
  }
  if (-[WRM_EnhancedCTService imsVoiceOverPSSupported](self, "imsVoiceOverPSSupported"))
  {

    -[WRM_EnhancedCTService setImsVoiceOverPSSupported:](self, "setImsVoiceOverPSSupported:", 0);
  }
  if (-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"))
  {

    -[WRM_EnhancedCTService setPrevAudioQualityWasGood:](self, "setPrevAudioQualityWasGood:", 0);
  }
  if (-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"))
  {

    -[WRM_EnhancedCTService setServCellRSRP:](self, "setServCellRSRP:", 0);
  }
  if (-[WRM_EnhancedCTService servCellRSRQ](self, "servCellRSRQ"))
  {

    -[WRM_EnhancedCTService setServCellRSRQ:](self, "setServCellRSRQ:", 0);
  }
  if (-[WRM_EnhancedCTService mcc](self, "mcc"))
  {

    -[WRM_EnhancedCTService setMcc:](self, "setMcc:", 0);
  }
  if (-[WRM_EnhancedCTService mnc](self, "mnc"))
  {

    -[WRM_EnhancedCTService setMnc:](self, "setMnc:", 0);
  }
  if (-[WRM_EnhancedCTService servCellRSSI](self, "servCellRSSI"))
  {

    -[WRM_EnhancedCTService setServCellRSSI:](self, "setServCellRSSI:", 0);
  }
  if (-[WRM_EnhancedCTService servCellRSCP](self, "servCellRSCP"))
  {

    -[WRM_EnhancedCTService setServCellRSCP:](self, "setServCellRSCP:", 0);
  }
  if (-[WRM_EnhancedCTService servCellECIO](self, "servCellECIO"))
  {

    -[WRM_EnhancedCTService setServCellECIO:](self, "setServCellECIO:", 0);
  }
  if (-[WRM_EnhancedCTService servCellSNR](self, "servCellSNR"))
  {

    -[WRM_EnhancedCTService setServCellSNR:](self, "setServCellSNR:", 0);
  }
  if (-[WRM_EnhancedCTService servCellSINR](self, "servCellSINR"))
  {

    -[WRM_EnhancedCTService setServCellSINR:](self, "setServCellSINR:", 0);
  }
  if (-[WRM_EnhancedCTService isDeviceRegistered](self, "isDeviceRegistered"))
  {

    -[WRM_EnhancedCTService setIsDeviceRegistered:](self, "setIsDeviceRegistered:", 0);
  }
  if (-[WRM_EnhancedCTService isVolteSupported](self, "isVolteSupported"))
  {

    -[WRM_EnhancedCTService setIsVolteSupported:](self, "setIsVolteSupported:", 0);
  }
  if (-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"))
  {

    -[WRM_EnhancedCTService setServCellRadioTechnologyType:](self, "setServCellRadioTechnologyType:", 0);
  }
  if (-[WRM_EnhancedCTService VoiceLqmIsValid](self, "VoiceLqmIsValid"))
  {

    -[WRM_EnhancedCTService setVoiceLqmIsValid:](self, "setVoiceLqmIsValid:", 0);
  }
  if (-[WRM_EnhancedCTService VoiceLqmReasonCode](self, "VoiceLqmReasonCode"))
  {

    -[WRM_EnhancedCTService setVoiceLqmReasonCode:](self, "setVoiceLqmReasonCode:", 0);
  }
  if (-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"))
  {

    -[WRM_EnhancedCTService setVoiceLqmValue:](self, "setVoiceLqmValue:", 0);
  }
  if (-[WRM_EnhancedCTService dataEnabled](self, "dataEnabled"))
  {

    -[WRM_EnhancedCTService setDataEnabled:](self, "setDataEnabled:", 0);
  }
  if (-[WRM_EnhancedCTService bars](self, "bars"))
  {

    -[WRM_EnhancedCTService setBars:](self, "setBars:", 0);
  }
  if (-[WRM_EnhancedCTService movingAverageSignalBars](self, "movingAverageSignalBars"))
  {

    -[WRM_EnhancedCTService setMovingAverageSignalBars:](self, "setMovingAverageSignalBars:", 0);
  }
  if (-[WRM_EnhancedCTService subscriptions](self, "subscriptions"))
  {

    -[WRM_EnhancedCTService setSubscriptions:](self, "setSubscriptions:", 0);
  }
  if (-[WRM_EnhancedCTService queue](self, "queue"))
  {
    dispatch_release((dispatch_object_t)-[WRM_EnhancedCTService queue](self, "queue"));
    -[WRM_EnhancedCTService setQueue:](self, "setQueue:", 0);
  }
  if (-[WRM_EnhancedCTService cellularAvailabilityStatusQueue](self, "cellularAvailabilityStatusQueue"))
  {
    dispatch_release((dispatch_object_t)-[WRM_EnhancedCTService cellularAvailabilityStatusQueue](self, "cellularAvailabilityStatusQueue"));
    -[WRM_EnhancedCTService setCellularAvailabilityStatusQueue:](self, "setCellularAvailabilityStatusQueue:", 0);
  }
  if (-[WRM_EnhancedCTService loads](self, "loads"))
  {

    -[WRM_EnhancedCTService setLoads:](self, "setLoads:", 0);
  }
  if (-[WRM_EnhancedCTService rrcState](self, "rrcState"))
  {

    -[WRM_EnhancedCTService setRrcState:](self, "setRrcState:", 0);
  }
  if (-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"))
  {

    -[WRM_EnhancedCTService setNrCellRSRP:](self, "setNrCellRSRP:", 0);
  }
  if (-[WRM_EnhancedCTService nrCellRSRQ](self, "nrCellRSRQ"))
  {

    -[WRM_EnhancedCTService setNrCellRSRQ:](self, "setNrCellRSRQ:", 0);
  }
  if (-[WRM_EnhancedCTService nrCellSNR](self, "nrCellSNR"))
  {

    -[WRM_EnhancedCTService setNrCellSNR:](self, "setNrCellSNR:", 0);
  }
  if (-[WRM_EnhancedCTService locDbRequired](self, "locDbRequired"))
  {

    -[WRM_EnhancedCTService setLocDbRequired:](self, "setLocDbRequired:", 0);
  }
  if (-[WRM_EnhancedCTService dataIndicator](self, "dataIndicator"))
  {

    -[WRM_EnhancedCTService setDataIndicator:](self, "setDataIndicator:", 0);
  }
  if (-[WRM_EnhancedCTService dataBW](self, "dataBW"))
  {

    -[WRM_EnhancedCTService setDataBW:](self, "setDataBW:", 0);
  }
  if (-[WRM_EnhancedCTService cellARFCN](self, "cellARFCN"))
  {

    -[WRM_EnhancedCTService setCellARFCN:](self, "setCellARFCN:", 0);
  }
  if (-[WRM_EnhancedCTService cellBandInfo](self, "cellBandInfo"))
  {

    -[WRM_EnhancedCTService setCellBandInfo:](self, "setCellBandInfo:", 0);
  }
  if (-[WRM_EnhancedCTService cellBandwidth](self, "cellBandwidth"))
  {

    -[WRM_EnhancedCTService setCellBandwidth:](self, "setCellBandwidth:", 0);
  }
  if (-[WRM_EnhancedCTService currNRCellFound](self, "currNRCellFound"))
  {

    -[WRM_EnhancedCTService setCurrNRCellFound:](self, "setCurrNRCellFound:", 0);
  }
  if (-[WRM_EnhancedCTService wifiNRCellFound](self, "wifiNRCellFound"))
  {

    -[WRM_EnhancedCTService setWifiNRCellFound:](self, "setWifiNRCellFound:", 0);
  }
  if (-[WRM_EnhancedCTService cellID](self, "cellID"))
  {

    -[WRM_EnhancedCTService setCellID:](self, "setCellID:", 0);
  }
  if (-[WRM_EnhancedCTService currCBRSCellFound](self, "currCBRSCellFound"))
  {

    -[WRM_EnhancedCTService setCurrCBRSCellFound:](self, "setCurrCBRSCellFound:", 0);
  }
  if (-[WRM_EnhancedCTService cbrsCoreAnalyticsMetricsSent](self, "cbrsCoreAnalyticsMetricsSent"))
  {

    -[WRM_EnhancedCTService setCbrsCoreAnalyticsMetricsSent:](self, "setCbrsCoreAnalyticsMetricsSent:", 0);
  }
  if (-[WRM_EnhancedCTService wifiCBRSCellFound](self, "wifiCBRSCellFound"))
  {

    -[WRM_EnhancedCTService setWifiCBRSCellFound:](self, "setWifiCBRSCellFound:", 0);
  }
  if (-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"))
  {

    -[WRM_EnhancedCTService setDetectedFR1CellCountLocDB:](self, "setDetectedFR1CellCountLocDB:", 0);
  }
  if (-[WRM_EnhancedCTService detectedFR1CellBW](self, "detectedFR1CellBW"))
  {

    -[WRM_EnhancedCTService setDetectedFR1CellBW:](self, "setDetectedFR1CellBW:", 0);
  }
  if (-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"))
  {

    -[WRM_EnhancedCTService setDetectedFR2CellCountLocDB:](self, "setDetectedFR2CellCountLocDB:", 0);
  }
  if (-[WRM_EnhancedCTService configuredMaxDLBW](self, "configuredMaxDLBW"))
  {

    -[WRM_EnhancedCTService setConfiguredMaxDLBW:](self, "setConfiguredMaxDLBW:", 0);
  }
  if (-[WRM_EnhancedCTService configuredMaxULBW](self, "configuredMaxULBW"))
  {

    -[WRM_EnhancedCTService setConfiguredMaxULBW:](self, "setConfiguredMaxULBW:", 0);
  }
  if (-[WRM_EnhancedCTService estimatedBWDL](self, "estimatedBWDL"))
  {

    -[WRM_EnhancedCTService setEstimatedBWDL:](self, "setEstimatedBWDL:", 0);
  }
  if (-[WRM_EnhancedCTService estimatedBWDLConf](self, "estimatedBWDLConf"))
  {

    -[WRM_EnhancedCTService setEstimatedBWDLConf:](self, "setEstimatedBWDLConf:", 0);
  }
  if (-[WRM_EnhancedCTService estimatedBWUL](self, "estimatedBWUL"))
  {

    -[WRM_EnhancedCTService setEstimatedBWUL:](self, "setEstimatedBWUL:", 0);
  }
  if (-[WRM_EnhancedCTService estimatedBWULConf](self, "estimatedBWULConf"))
  {

    -[WRM_EnhancedCTService setEstimatedBWULConf:](self, "setEstimatedBWULConf:", 0);
  }
  if (-[WRM_EnhancedCTService neighberCellType](self, "neighberCellType"))
  {

    -[WRM_EnhancedCTService setNeighberCellType:](self, "setNeighberCellType:", 0);
  }
  if (-[WRM_EnhancedCTService highDataRateObserved](self, "highDataRateObserved"))
  {

    -[WRM_EnhancedCTService setHighDataRateObserved:](self, "setHighDataRateObserved:", 0);
  }
  if (-[WRM_EnhancedCTService currentNRCellType](self, "currentNRCellType"))
  {

    -[WRM_EnhancedCTService setCurrentNRCellType:](self, "setCurrentNRCellType:", 0);
  }
  if (-[WRM_EnhancedCTService currentHarvestedCellTypeFR2Capable](self, "currentHarvestedCellTypeFR2Capable"))
  {

    -[WRM_EnhancedCTService setCurrentHarvestedCellTypeFR2Capable:](self, "setCurrentHarvestedCellTypeFR2Capable:", 0);
  }
  if (-[WRM_EnhancedCTService stallDetected](self, "stallDetected"))
  {

    -[WRM_EnhancedCTService setStallDetected:](self, "setStallDetected:", 0);
  }
  if (-[WRM_EnhancedCTService dataModeLTE](self, "dataModeLTE"))
  {

    -[WRM_EnhancedCTService setDataModeLTE:](self, "setDataModeLTE:", 0);
  }
  if (-[WRM_EnhancedCTService isExpensive](self, "isExpensive"))
  {

    -[WRM_EnhancedCTService setIsExpensive:](self, "setIsExpensive:", 0);
  }
  v4 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
  if (v4)
  {

    *(_QWORD *)(&self->super.m_PDPAssertionRefCount + 1) = 0;
  }
  v5 = *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4);
  if (v5)
  {

    *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4) = 0;
  }
  v6 = *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4);
  if (v6)
  {

    *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4) = 0;
  }
  v7 = *(void **)((char *)&self->mLastKnownLocationTimestamp + 4);
  if (v7)
  {
    objc_msgSend(v7, "stopMonitoring");

    *(double *)((char *)&self->mLastKnownLocationTimestamp + 4) = 0.0;
  }
  if (qword_100270F08)
  {

    qword_100270F08 = 0;
  }
  if (*(_QWORD *)(&self->mWatchAssociated + 4))
    *(_QWORD *)(&self->mWatchAssociated + 4) = 0;
  v8 = *(void **)&self->mCellRSRQ4G5GvsWiFiThreshold;
  if (v8)
  {

    *(_QWORD *)&self->mCellRSRQ4G5GvsWiFiThreshold = 0;
  }
  v9 = *(void **)(&self->mAnyCallState + 1);
  if (v9)
  {

    *(_QWORD *)(&self->mAnyCallState + 1) = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WRM_EnhancedCTService;
  -[WRM_CTService dealloc](&v10, "dealloc");
}

- (BOOL)isWiFiCallingSupportedSlot1
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isWiFiCallingSupported](self, "isWiFiCallingSupported"), "objectAtIndex:", 0), "BOOLValue");
}

- (BOOL)isWiFiCallingSupportedSlot2
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isWiFiCallingSupported](self, "isWiFiCallingSupported"), "objectAtIndex:", 1), "BOOLValue");
}

- (BOOL)qmiClientRunning
{
  return -[WRM_CTService qmiClientRunning](-[WRM_EnhancedCTService mCTService](self, "mCTService"), "qmiClientRunning");
}

- (BOOL)isSimActive
{
  return -[WRM_CTService isSimActive](-[WRM_EnhancedCTService mCTService](self, "mCTService"), "isSimActive");
}

- (void)triggerCommCenterForActivation
{
  -[WRM_CTService triggerCommCenterForActivation](-[WRM_EnhancedCTService mCTService](self, "mCTService"), "triggerCommCenterForActivation");
}

- (void)triggerCommCenterForDeActivation
{
  -[WRM_CTService triggerCommCenterForDeActivation](-[WRM_EnhancedCTService mCTService](self, "mCTService"), "triggerCommCenterForDeActivation");
}

- (BOOL)isCommCenterAsserted
{
  return -[WRM_CTService isCommCenterAsserted](-[WRM_EnhancedCTService mCTService](self, "mCTService"), "isCommCenterAsserted");
}

- (void)tiggerEnhanceLQMConfiguration
{
  -[WRM_CTService tiggerEnhanceLQMConfiguration](-[WRM_EnhancedCTService mCTService](self, "mCTService"), "tiggerEnhanceLQMConfiguration");
}

- (BOOL)dataAttachedWithCellularNetwork:(int64_t)a3
{
  const char *v4;
  const char *v5;
  int64_t v6;
  const char *v7;

  v4 = "CTSubscriptionSlotOne";
  v5 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v5 = "CTSubscriptionSlotTwo";
  v6 = a3 - 1;
  if (a3 != 1)
    v4 = v5;
  if (a3)
    v7 = v4;
  else
    v7 = "CTSubscriptionSlotUnknown";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: sim slot %s isDataAttached %@"), "-[WRM_EnhancedCTService dataAttachedWithCellularNetwork:]", v7, -[WRM_EnhancedCTService isDataAttached](self, "isDataAttached"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isDataAttached](self, "isDataAttached"), "objectAtIndex:", v6), "BOOLValue");
}

- (unsigned)getCellConfiguredBandwidthThreshold
{
  unsigned int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034548;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)getCellRSRP4G5GvsWiFiThreshold
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034648;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int)getCellRSRQ4G5GvsWiFiThreshold
{
  int v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034748;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setTrialParameters:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100034804;
  v3[3] = &unk_100201B18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v3);
}

- (int)getServingCellType:(int64_t)a3
{
  int v5;
  const char *v6;
  const char *v7;
  const char *v8;
  NSMutableArray *v9;
  int v10;
  const char *v11;

  v5 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", a3 - 1), "intValue");
  v6 = "CTSubscriptionSlotOne";
  v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v7 = "CTSubscriptionSlotTwo";
  if (a3 != 1)
    v6 = v7;
  if (a3)
    v8 = v6;
  else
    v8 = "CTSubscriptionSlotUnknown";
  v9 = -[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType");
  v10 = v5 - 1;
  if ((v5 - 1) < 0xA && ((0x2FFu >> v10) & 1) != 0)
  {
    v11 = (&off_1002021B8)[v10];
  }
  else
  {
    v11 = "UNKNOWN_RADIO!!!";
    if (v5 == 9)
      v11 = "N_RADIO";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: sim slot %s rat property %@ rat %s"), "-[WRM_EnhancedCTService getServingCellType:]", v8, v9, v11);
  return v5;
}

- (void)invalidateAudioQualityMetrics
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "replaceObjectAtIndex:withObject:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
}

- (double)getCurrentAudioErasure
{
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100034B4C;
    v5[3] = &unk_100201B90;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v5);
  }
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateVoLTESpeechErasure:(unint64_t)a3
{
  _QWORD v5[6];

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100034C9C;
    v5[3] = &unk_100201BB8;
    v5[4] = self;
    v5[5] = a3;
    dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v5);
  }
}

- (int)getLteVoiceLQM:(int64_t)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;

  v4 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", a3 - 1), "intValue");
  v5 = "CTSubscriptionSlotUnknown";
  v6 = "CTSubscriptionSlotOne";
  v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v7 = "CTSubscriptionSlotTwo";
  if (a3 != 1)
    v6 = v7;
  if (a3)
    v5 = v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: sim slot %s vLQM %d"), "-[WRM_EnhancedCTService getLteVoiceLQM:]", v5, v4);
  return (int)v4;
}

- (int64_t)getCellularLQM
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService activeSlot](self, "activeSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s data LQM %d"), "-[WRM_EnhancedCTService getCellularLQM]", v4, v3);
  return (int)v3;
}

- (BOOL)isVoiceLQMValid:(int64_t)a3
{
  unsigned int v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;

  v4 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmIsValid](self, "VoiceLqmIsValid"), "objectAtIndex:", a3 - 1), "BOOLValue");
  v5 = "CTSubscriptionSlotUnknown";
  v6 = "CTSubscriptionSlotOne";
  v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v7 = "CTSubscriptionSlotTwo";
  if (a3 != 1)
    v6 = v7;
  if (a3)
    v5 = v6;
  v8 = "No";
  if (v4)
    v8 = "Yes";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: sim slot %s vLQM is valid? %s"), "-[WRM_EnhancedCTService isVoiceLQMValid:]", v5, v8);
  return v4;
}

- (void)resetLteVoiceLQM
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService VoiceLqmIsValid](self, "VoiceLqmIsValid"), "replaceObjectAtIndex:withObject:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
}

- (void)resetCellularDataLQM
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService DataLqmIsValid](self, "DataLqmIsValid"), "replaceObjectAtIndex:withObject:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
}

- (BOOL)isDataLQMValid
{
  unsigned int v3;
  const char *v4;
  int64_t v5;
  const char *v6;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmIsValid](self, "DataLqmIsValid"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService activeSlot](self, "activeSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  v6 = "No";
  if (v3)
    v6 = "Yes";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s data LQM is valid? %s"), "-[WRM_EnhancedCTService isDataLQMValid]", v4, v6);
  return v3;
}

- (BOOL)isDataLQMValid:(int64_t)a3
{
  unsigned int v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;

  v4 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmIsValid](self, "DataLqmIsValid"), "objectAtIndex:", a3 - 1), "BOOLValue");
  v5 = "CTSubscriptionSlotUnknown";
  v6 = "CTSubscriptionSlotOne";
  v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v7 = "CTSubscriptionSlotTwo";
  if (a3 != 1)
    v6 = v7;
  if (a3)
    v5 = v6;
  v8 = "No";
  if (v4)
    v8 = "Yes";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: sim slot %s data LQM is valid? %s"), "-[WRM_EnhancedCTService isDataLQMValid:]", v5, v8);
  return v4;
}

- (void)initMovAverageOfSignalBar
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035328;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)resetMovAverageOfSignalBar
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035434;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (int)getCellularDataLQM
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService activeSlot](self, "activeSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s data LQM %d"), "-[WRM_EnhancedCTService getCellularDataLQM]", v4, v3);
  return (int)v3;
}

- (BOOL)getDataStallState:(int64_t)a3
{
  char v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035748;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)getCellularDataLQM:(int64_t)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;

  v4 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", a3 - 1), "intValue");
  v5 = "CTSubscriptionSlotUnknown";
  v6 = "CTSubscriptionSlotOne";
  v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v7 = "CTSubscriptionSlotTwo";
  if (a3 != 1)
    v6 = v7;
  if (a3)
    v5 = v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: sim slot %s data LQM %d"), "-[WRM_EnhancedCTService getCellularDataLQM:]", v5, v4);
  return (int)v4;
}

- (void)setServingCellRSSI:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000358A0;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setServingCellRSRP:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000359DC;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setServingCellSNR:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035B48;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setServingCellSINR:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035C84;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setServingCellRSRQ:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035DC0;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (double)getServingCellRSSI
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035F38;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSRP:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000360D8;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellSNR:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036250;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellSINR
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000363B4;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSRQ:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036554;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellRSCP
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000366B8;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellRSCP:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036858;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getServingCellECIO
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000369BC;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getServingCellECIO:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036B5C;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)getCurrentSignalBars:(int64_t)a3
{
  int64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036DB0;
  block[3] = &unk_100201C58;
  block[5] = &v6;
  block[6] = a3;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)deviceInRoaming
{
  const char *v3;

  if (-[WRM_EnhancedCTService activeSlot](self, "activeSlot"))
  {
    if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s isRoaming %@"), "-[WRM_EnhancedCTService deviceInRoaming]", v3, -[WRM_EnhancedCTService isRoaming](self, "isRoaming"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isRoaming](self, "isRoaming"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService activeSlot](self, "activeSlot") - 1), "BOOLValue");
}

- (unsigned)getRadioCoverage
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService radioCoverage](self, "radioCoverage"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
}

- (unsigned)getRadioFrequency
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService radioFrequency](self, "radioFrequency"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
}

- (BOOL)isSaAllowedOnWiFiAssociation:(int64_t)a3
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  if (-[WRM_EnhancedCTService CTClient](self, "CTClient"))
  {
    v13 = 0;
    v5 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
    v6 = objc_msgSend(objc_alloc((Class)CTXPCServiceSubscriptionContext), "initWithSlot:", a3);
    v7 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "copyCarrierBundleValue:key:bundleType:error:", v6, CFSTR("AllowSAOnWiFiAssociation"), v5, &v13);
    if (v7)
      v8 = v13 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v10 = v7;
      v11 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("AllowSAOnWiFiAssociation %ld, slotID:%ld"), objc_msgSend(v10, "integerValue"), a3);
        v9 = objc_msgSend(v10, "integerValue") != 0;
LABEL_12:

        goto LABEL_13;
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("AllowSAOnWiFiAssociation mis-configured in CB, slotID:%ld"), a3);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("AllowSAOnWiFiAssociation key not present in CB, slotID:%ld"), a3);
    }
    v9 = 0;
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CoreTelephony client not ready yet, slotID:%ld"), a3);
  v9 = 0;
LABEL_13:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("AllowSAOnWiFiAssociation %d, slotID:%ld"), v9, a3);
  return v9;
}

- (BOOL)isWiFiCallingAllowedInAPM
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  if (-[WRM_EnhancedCTService CTClient](self, "CTClient"))
  {
    v12 = 0;
    v3 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
    v4 = objc_msgSend(objc_alloc((Class)CTXPCServiceSubscriptionContext), "initWithSlot:", -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"));
    v5 = -[CoreTelephonyClient copyCarrierBundleValue:keyHierarchy:bundleType:error:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v4, &off_100241AC0, v3, &v12);
    if (v5)
      v6 = v12 == 0;
    else
      v6 = 0;
    if (v6)
    {
      v9 = v5;
      v10 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("AllowWiFiCallingInAirplaneMode %d"), objc_msgSend(v9, "integerValue"));
        v8 = objc_msgSend(v9, "integerValue") != 0;
LABEL_12:

        return v8;
      }
      v7 = CFSTR("AllowWiFiCallingInAirplaneMode misconfigured in CB");
    }
    else
    {
      v7 = CFSTR("AllowWiFiCallingInAirplaneMode key not present in CB");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v7);
    v8 = 1;
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CoreTelephony client not ready yet"));
  return 1;
}

- (void)getCurrentEnhancedCTMetrics
{
  unsigned int v3;
  __objc2_class **p_superclass;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  __objc2_class **v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  CoreTelephonyClient *v22;
  CoreTelephonyClient *v23;
  CoreTelephonyClient *v24;
  CoreTelephonyClient *v25;
  CoreTelephonyClient *v26;
  CoreTelephonyClient *v27;
  CoreTelephonyClient *v28;
  CoreTelephonyClient *v29;
  CoreTelephonyClient *v30;
  CoreTelephonyClient *v31;
  CoreTelephonyClient *v32;
  CoreTelephonyClient *v33;
  CoreTelephonyClient *v34;
  CoreTelephonyClient *v35;
  CoreTelephonyClient *v36;
  CoreTelephonyClient *v37;
  CoreTelephonyClient *v38;
  CoreTelephonyClient *v39;
  CoreTelephonyClient *v40;
  CoreTelephonyClient *v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableArray *obj;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  _BYTE v70[128];

  v69 = 0;
  v3 = -[CoreTelephonyClient isPrivateNetworkEvaluationNeeded:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "isPrivateNetworkEvaluationNeeded:", &v69);
  p_superclass = WRM_SCService.superclass;
  if (v69)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("isPrivateNetworkEvaluationNeeded: error %@"), objc_msgSend(v69, "localizedDescription"));
  }
  else
  {
    BYTE4(self->mLastCbrsRecommendation) = v3;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("isPrivateNetworkEvaluationNeeded: %d"), v3);
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = -[WRM_EnhancedCTService subscriptions](self, "subscriptions");
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v66;
    v43 = kCTCapabilityAgent;
    v42 = kCTCapabilityAgent2;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "slotID"))
        {
          v10 = -[CoreTelephonyClient getPrivateNetworkCapabilitiesForContext:error:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "getPrivateNetworkCapabilitiesForContext:error:", v9, &v69);
          v11 = v69;
          v12 = p_superclass;
          v13 = p_superclass + 279;
          v14 = objc_msgSend(v9, "slotID");
          if (v11 || !v10)
          {
            if (v14)
            {
              v18 = "CTSubscriptionSlotOne";
              if (objc_msgSend(v9, "slotID") != (id)1)
              {
                if (objc_msgSend(v9, "slotID") == (id)2)
                  v18 = "CTSubscriptionSlotTwo";
                else
                  v18 = "Unknown CTSubscriptionSlot!!!";
              }
            }
            else
            {
              v18 = "CTSubscriptionSlotUnknown";
            }
            objc_msgSend(v13, "logLevel:message:", 22, CFSTR("%s: getPrivateNetworkCapabilitiesForContext error=%@"), v18, objc_msgSend(v69, "localizedDescription"));
            v19 = 0;
            v20 = 0;
          }
          else
          {
            if (v14)
            {
              v15 = objc_msgSend(v9, "slotID");
              v16 = "CTSubscriptionSlotOne";
              if (v15 != (id)1)
              {
                v17 = objc_msgSend(v9, "slotID");
                v16 = "Unknown CTSubscriptionSlot!!!";
                if (v17 == (id)2)
                  v16 = "CTSubscriptionSlotTwo";
              }
            }
            else
            {
              v16 = "CTSubscriptionSlotUnknown";
            }
            objc_msgSend(v13, "logLevel:message:", 22, CFSTR("%s: getPrivateNetworkCapabilitiesForContext %@"), v16, v10);
            v21 = objc_msgSend(v10, "isPrivateNetworkModeEnabled");
            v20 = objc_msgSend(v10, "isPrivateNetworkPreferredOverWifi");
            if (v21)
            {
              v19 = 1;
              BYTE4(self->mLastCbrsRecommendation) = 1;
            }
            else
            {
              v19 = 0;
            }
          }
          -[WRM_EnhancedCTService processPrivateNwSimStatus:slot:](self, "processPrivateNwSimStatus:slot:", v19, objc_msgSend(v9, "slotID"));
          -[WRM_EnhancedCTService processPrivateNwPreferredOverWifiStatus:slot:](self, "processPrivateNwPreferredOverWifiStatus:slot:", v20, objc_msgSend(v9, "slotID"));
          if (objc_msgSend(v9, "slotID") == (id)1)
          {
            v22 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_1000379CC;
            v64[3] = &unk_100201C80;
            v64[4] = self;
            -[CoreTelephonyClient getSignalStrengthInfo:completion:](v22, "getSignalStrengthInfo:completion:", v9, v64);
            v23 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v63[0] = _NSConcreteStackBlock;
            v63[1] = 3221225472;
            v63[2] = sub_100037A50;
            v63[3] = &unk_100201CA8;
            v63[4] = self;
            -[CoreTelephonyClient copyIsDataAttached:completion:](v23, "copyIsDataAttached:completion:", v9, v63);
            v24 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_100037AD4;
            v62[3] = &unk_100201CD0;
            v62[4] = self;
            -[CoreTelephonyClient copyRegistrationStatus:completion:](v24, "copyRegistrationStatus:completion:", v9, v62);
            v25 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = sub_100037B58;
            v61[3] = &unk_100201CD0;
            v61[4] = self;
            -[CoreTelephonyClient copyMobileCountryCode:completion:](v25, "copyMobileCountryCode:completion:", v9, v61);
            v26 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_100037BDC;
            v60[3] = &unk_100201CD0;
            v60[4] = self;
            -[CoreTelephonyClient copyMobileNetworkCode:completion:](v26, "copyMobileNetworkCode:completion:", v9, v60);
            v27 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v59[0] = _NSConcreteStackBlock;
            v59[1] = 3221225472;
            v59[2] = sub_100037C60;
            v59[3] = &unk_100201CF8;
            v59[4] = self;
            -[CoreTelephonyClient context:getCapability:completion:](v27, "context:getCapability:completion:", v9, v43, v59);
            v28 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472;
            v58[2] = sub_100037CF8;
            v58[3] = &unk_100201CF8;
            v58[4] = self;
            -[CoreTelephonyClient context:getCapability:completion:](v28, "context:getCapability:completion:", v9, v42, v58);
            v29 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_100037D90;
            v57[3] = &unk_100201CD0;
            v57[4] = self;
            -[CoreTelephonyClient copyRadioAccessTechnology:completion:](v29, "copyRadioAccessTechnology:completion:", v9, v57);
            v30 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_100037E14;
            v56[3] = &unk_100201D20;
            v56[4] = self;
            -[CoreTelephonyClient getVoiceLinkQualityMetric:completion:](v30, "getVoiceLinkQualityMetric:completion:", v9, v56);
            v31 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_100037E98;
            v55[3] = &unk_100201D48;
            v55[4] = self;
            -[CoreTelephonyClient getEnhancedVoiceLinkQualityMetric:completion:](v31, "getEnhancedVoiceLinkQualityMetric:completion:", v9, v55);
            p_superclass = v12;
          }
          else
          {
            p_superclass = v12;
            if (objc_msgSend(v9, "slotID") == (id)2)
            {
              v32 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472;
              v54[2] = sub_100037F1C;
              v54[3] = &unk_100201CA8;
              v54[4] = self;
              -[CoreTelephonyClient copyIsDataAttached:completion:](v32, "copyIsDataAttached:completion:", v9, v54);
              v33 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_100037FA0;
              v53[3] = &unk_100201C80;
              v53[4] = self;
              -[CoreTelephonyClient getSignalStrengthInfo:completion:](v33, "getSignalStrengthInfo:completion:", v9, v53);
              v34 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v52[0] = _NSConcreteStackBlock;
              v52[1] = 3221225472;
              v52[2] = sub_100038024;
              v52[3] = &unk_100201CD0;
              v52[4] = self;
              -[CoreTelephonyClient copyRegistrationStatus:completion:](v34, "copyRegistrationStatus:completion:", v9, v52);
              v35 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_1000380A8;
              v51[3] = &unk_100201CD0;
              v51[4] = self;
              -[CoreTelephonyClient copyMobileCountryCode:completion:](v35, "copyMobileCountryCode:completion:", v9, v51);
              v36 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472;
              v50[2] = sub_10003812C;
              v50[3] = &unk_100201CD0;
              v50[4] = self;
              -[CoreTelephonyClient copyMobileNetworkCode:completion:](v36, "copyMobileNetworkCode:completion:", v9, v50);
              v37 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v49[0] = _NSConcreteStackBlock;
              v49[1] = 3221225472;
              v49[2] = sub_1000381B0;
              v49[3] = &unk_100201CF8;
              v49[4] = self;
              -[CoreTelephonyClient context:getCapability:completion:](v37, "context:getCapability:completion:", v9, v43, v49);
              v38 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v48[0] = _NSConcreteStackBlock;
              v48[1] = 3221225472;
              v48[2] = sub_100038248;
              v48[3] = &unk_100201CF8;
              v48[4] = self;
              -[CoreTelephonyClient context:getCapability:completion:](v38, "context:getCapability:completion:", v9, v42, v48);
              v39 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v47[0] = _NSConcreteStackBlock;
              v47[1] = 3221225472;
              v47[2] = sub_1000382E0;
              v47[3] = &unk_100201CD0;
              v47[4] = self;
              -[CoreTelephonyClient copyRadioAccessTechnology:completion:](v39, "copyRadioAccessTechnology:completion:", v9, v47);
              v40 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v46[0] = _NSConcreteStackBlock;
              v46[1] = 3221225472;
              v46[2] = sub_100038364;
              v46[3] = &unk_100201D20;
              v46[4] = self;
              -[CoreTelephonyClient getVoiceLinkQualityMetric:completion:](v40, "getVoiceLinkQualityMetric:completion:", v9, v46);
              v41 = -[WRM_EnhancedCTService CTClient](self, "CTClient");
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_1000383E8;
              v45[3] = &unk_100201D48;
              v45[4] = self;
              -[CoreTelephonyClient getEnhancedVoiceLinkQualityMetric:completion:](v41, "getEnhancedVoiceLinkQualityMetric:completion:", v9, v45);
            }
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v6);
  }
  -[WRM_EnhancedCTService setMSubscriptionInfoDidChange:](self, "setMSubscriptionInfoDidChange:", 0);
}

- (void)processDataAttached:(BOOL)a3 :(int64_t)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000384E0;
  block[3] = &unk_100201D70;
  block[4] = self;
  block[5] = a4;
  v5 = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processVolteStatus:(BOOL)a3 :(int64_t)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000385A8;
  block[3] = &unk_100201D70;
  block[4] = self;
  block[5] = a4;
  v5 = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)interfaceCostExpensiveChanged:(id)a3 isExpensive:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038670;
  block[3] = &unk_100201D98;
  v5 = a4;
  block[4] = a3;
  block[5] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000387AC;
  block[3] = &unk_100201D98;
  v5 = a4;
  block[4] = a3;
  block[5] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processWiFiCallingStatus:(BOOL)a3 :(int64_t)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000389B8;
  block[3] = &unk_100201D70;
  block[4] = self;
  block[5] = a4;
  v5 = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processPrivateNwSimStatus:(BOOL)a3 slot:(int64_t)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038A80;
  block[3] = &unk_100201D70;
  block[4] = self;
  block[5] = a4;
  v5 = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processPrivateNwPreferredOverWifiStatus:(BOOL)a3 slot:(int64_t)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038B48;
  block[3] = &unk_100201D70;
  block[4] = self;
  block[5] = a4;
  v5 = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processRegistrationStatus:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038C10;
  block[3] = &unk_100201DE8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (BOOL)isWatchAssociated
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"))
  {
    v9 = CFSTR("%s: Skipping CellularAvailabilityStatusBiomeStream event on iPhone as weak link to NanoRegistry framework missing.");
LABEL_13:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, v9, "-[WRM_EnhancedCTService isWatchAssociated]");
    return 0;
  }
  v2 = -[NRPairedDeviceRegistry getAllDevicesWithArchivedDevices](+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"), "getAllDevicesWithArchivedDevices");
  if ((int)objc_msgSend(v2, "count") < 1)
  {
    v9 = CFSTR("%s: Skipping CellularAvailabilityStatusBiomeStream event on iPhone as no associated watches");
    goto LABEL_13;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = NRDevicePropertyProductType;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: Associated watches. %@"), "-[WRM_EnhancedCTService isWatchAssociated]", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "valueForProperty:", v6));
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  return 1;
}

- (void)updateCellularAvailabilityStatus:(id)a3 :(int64_t)a4 :(double)a5 :(BOOL)a6
{
  _QWORD block[8];
  BOOL v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038FA0;
  block[3] = &unk_100201E10;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  *(double *)&block[7] = a5;
  v7 = a6;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService cellularAvailabilityStatusQueue](self, "cellularAvailabilityStatusQueue"), block);
}

- (void)processMobileCountryCode:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039110;
  block[3] = &unk_100201DE8;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processMobileNetworkCode:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039238;
  block[3] = &unk_100201DE8;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processVoiceLinkQualityInfo:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039360;
  block[3] = &unk_100201DE8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)updateAudioQuality:(id)a3 :(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t var1;
  double v8;
  int64_t v9;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a3.var2;
  v5 = *(_QWORD *)&a3.var0;
  var1 = a3.var1;
  v8 = (double)(100 * a3.var0) / ((double)a3.var1 + 0.000001);
  v9 = a4 - 1;
  -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService PrevAudioErasurePercent](self, "PrevAudioErasurePercent"), "replaceObjectAtIndex:withObject:", a4 - 1, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  v11 = v8 < 80.0 || var1 < 0x1F5;
  -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "replaceObjectAtIndex:withObject:", v9, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
  objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSCP](self, "servCellRSCP"), "objectAtIndex:", v9), "doubleValue");
  v13 = v12;
  objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellECIO](self, "servCellECIO"), "objectAtIndex:", v9), "doubleValue");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d"), v4, v5, var1, *(_QWORD *)&v8, v13, v14, objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "objectAtIndex:", v9), "BOOLValue"));
}

- (void)updateAudioQualityKaroo:(id *)a3 :(int64_t)a4
{
  unsigned int var1;
  double v8;
  _BOOL8 v10;
  uint64_t var0;
  uint64_t v12;
  uint64_t v13;
  unsigned int *p_var1;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  var1 = a3->var1;
  v8 = (double)(100 * a3->var0) / ((double)var1 + 0.000001);
  v10 = v8 < 80.0 || var1 < 0x1F5;
  -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "replaceObjectAtIndex:withObject:", a4 - 1, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10));
  var0 = a3->var0;
  p_var1 = &a3->var1;
  v12 = a3->var1;
  v13 = p_var1[1];
  objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSCP](self, "servCellRSCP"), "objectAtIndex:", a4 - 1), "doubleValue");
  v16 = v15;
  objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellECIO](self, "servCellECIO"), "objectAtIndex:", a4 - 1), "doubleValue");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d"), v13, var0, v12, *(_QWORD *)&v8, v16, v17, objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService PrevAudioQualityWasGood](self, "PrevAudioQualityWasGood"), "objectAtIndex:", a4 - 1), "BOOLValue"));
}

- (void)processEnhancedDataLQMBlob:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000397EC;
  block[3] = &unk_100201DE8;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processEnhancedVoiceLinkQualityBlob:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039C68;
  block[3] = &unk_100201DE8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)nrSliceAppStateChanged:(id)a3 status:(BOOL)a4 trafficDescriptors:(id)a5
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A930;
  v5[3] = &unk_100201E38;
  v5[4] = a3;
  v6 = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue", a3, a4, a5), v5);
}

- (void)processDataStatus:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AA5C;
  block[3] = &unk_100201DE8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processRadioTechnologyInfo:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B20C;
  block[3] = &unk_100201DE8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processSignalStrengthInfo:(id)a3 :(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B5F4;
  block[3] = &unk_100201DE8;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)processSubscriptionInfo:(id)a3 :(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003B75C;
  v4[3] = &unk_100201B18;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue", a3, a4), v4);
}

- (void)initCoreTelephonyClient
{
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s CTClientInitDone %d"), "-[WRM_EnhancedCTService initCoreTelephonyClient]", -[WRM_EnhancedCTService CTClientInitDone](self, "CTClientInitDone"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BAD8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  if (qword_100271098 != -1)
    dispatch_once(&qword_100271098, block);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s Done CTClientInitDone %d"), "-[WRM_EnhancedCTService initCoreTelephonyClient]", -[WRM_EnhancedCTService CTClientInitDone](self, "CTClientInitDone"));
  if (*(WRM_SpeedTestSchedulerServicesIOS **)((char *)&self->speedTestSchedulerServices + 4))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: initCellularProductExperimentsManager"));
    objc_msgSend(*(id *)((char *)&self->speedTestSchedulerServices + 4), "subscribeToTrial");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularProductExperimentsManager: Not initialized"));
  }
}

- (id)getInternetInterfaceName
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = sub_10003BD94;
  v9 = sub_10003BDA4;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BDB0;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)internetConnectionStateChanged:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003BE30;
  v3[3] = &unk_100201B18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v3);
}

- (void)subscriptionInfoDidChange
{
  _QWORD v3[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s"), "-[WRM_EnhancedCTService subscriptionInfoDidChange]");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003BF78;
  v3[3] = &unk_100201E60;
  v3[4] = self;
  -[CoreTelephonyClient getSubscriptionInfo:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "getSubscriptionInfo:", v3);
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ info %@"), "-[WRM_EnhancedCTService signalStrengthChanged:info:]", a3, a4);
  -[WRM_EnhancedCTService processSignalStrengthInfo::](self, "processSignalStrengthInfo::", a4, objc_msgSend(a3, "slotID"));
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  _QWORD v7[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ status %@"), "-[WRM_EnhancedCTService displayStatusChanged:status:]", a3, a4);
  -[WRM_EnhancedCTService processRegistrationStatus::](self, "processRegistrationStatus::", objc_msgSend(a4, "registrationDisplayStatus"), objc_msgSend(a3, "slotID"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C130;
  v7[3] = &unk_100201E88;
  v7[4] = self;
  v7[5] = a3;
  -[CoreTelephonyClient copyRegistrationStatus:completion:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "copyRegistrationStatus:completion:", a3, v7);
}

- (int)parseRegistrationStatusForBiomeStream:(id)a3
{
  int result;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCTRegistrationStatusRegisteredHome")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("kCTRegistrationStatusRegisteredRoaming")) & 1) != 0)
  {
    return 1;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kCTRegistrationStatusEmergencyOnly")))
  {
    if (!-[WRM_EnhancedCTService isSuppressSOSOnlyWithLimitedServiceEnabled](self, "isSuppressSOSOnlyWithLimitedServiceEnabled"))return 2;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("parseRegistrationStatusForBiomeStream:: Suppressed SOS with Limited Services."));
    return 3;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCTRegistrationStatusNotRegistered")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCTRegistrationStatusDenied")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kCTRegistrationStatusSearching")) & 1) != 0)
    return 3;
  result = objc_msgSend(a3, "isEqualToString:", CFSTR("kCTRegistrationStatusUnknown"));
  if (result)
    return 3;
  return result;
}

- (int)combinedRegistrationStatus
{
  void *v2;
  int v4;

  v2 = *(void **)(&self->mWrmSdmLocationMonitoringStarted + 4);
  if (!v2)
    return 0;
  v4 = 1;
  if ((objc_msgSend(v2, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1)) & 1) == 0)
  {
    v4 = 2;
    if ((objc_msgSend(*(id *)(&self->mWrmSdmLocationMonitoringStarted + 4), "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2)) & 1) == 0)
    {
      if (objc_msgSend(*(id *)(&self->mWrmSdmLocationMonitoringStarted + 4), "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 3)))return 3;
      else
        return 0;
    }
  }
  return v4;
}

- (id)getPreviousCellularAvailabilityStatus
{
  uint64_t mCellularAvailabilityStatus_high;

  mCellularAvailabilityStatus_high = HIDWORD(self->mCellularAvailabilityStatus);
  if ((_DWORD)mCellularAvailabilityStatus_high != -1)
    return (id)sub_10003C384(mCellularAvailabilityStatus_high);
  HIDWORD(self->mCellularAvailabilityStatus) = 0;
  return (id)sub_10003C384(0);
}

- (id)getCurrentCellularAvailabilityStatus
{
  uint64_t v3;

  objc_msgSend(*(id *)(&self->mWatchAssociated + 4), "getAirPlaneMode");
  if ((objc_msgSend(*(id *)(&self->mWatchAssociated + 4), "isAirPlaneModeEnabled") & 1) != 0)
    v3 = 4;
  else
    v3 = -[WRM_EnhancedCTService combinedRegistrationStatus](self, "combinedRegistrationStatus");
  return (id)sub_10003C384(v3);
}

- (int)getWatchAssociated
{
  return BYTE4(self->mSOSRSRPThreshold);
}

- (BOOL)isSuppressSOSOnlyWithLimitedServiceEnabled
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  const __CFString *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  if (-[WRM_EnhancedCTService CTClient](self, "CTClient"))
  {
    v12 = 0;
    v3 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 6);
    v4 = objc_msgSend(objc_alloc((Class)CTXPCServiceSubscriptionContext), "initWithSlot:", -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"));
    v5 = -[CoreTelephonyClient copyCarrierBundleValue:keyHierarchy:bundleType:error:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v4, &off_100241AD8, v3, &v12);
    if (v5)
      v6 = v12 == 0;
    else
      v6 = 0;
    if (v6)
    {
      v9 = v5;
      v10 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("isSuppressSOSOnlyWithLimitedServiceEnabled:: SuppressSOSOnlyWithLimitedService %d"), objc_msgSend(v9, "integerValue"));
        v8 = objc_msgSend(v9, "integerValue") != 0;
LABEL_12:

        return v8;
      }
      v7 = CFSTR("isSuppressSOSOnlyWithLimitedServiceEnabled:: SuppressSOSOnlyWithLimitedService misconfigured in CB");
    }
    else
    {
      v7 = CFSTR("isSuppressSOSOnlyWithLimitedServiceEnabled:: SuppressSOSOnlyWithLimitedService key not present in CB. Setting it to default value of True");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v7);
    v8 = 1;
    goto LABEL_12;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("isSuppressSOSOnlyWithLimitedServiceEnabled::CoreTelephony client not ready yet"));
  return 1;
}

- (void)monitorStrongSOSSignal:(double)a3
{
  uint64_t v5;
  uint64_t v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s mStrongestSOSRSRP %f, rsrp %f"), "-[WRM_EnhancedCTService monitorStrongSOSSignal:]", *(_QWORD *)((char *)&self->mEnterSOSTimeStamp + 4), *(_QWORD *)&a3);
  if (*(double *)((char *)&self->mStrongestSOSRSRP + 4) <= a3
    || *(double *)((char *)&self->mEnterSOSTimeStamp + 4) <= a3)
  {
    if (a3 > -44.0 || a3 < -140.0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s Invalid RSRP: %f"), "-[WRM_EnhancedCTService monitorStrongSOSSignal:]", *(_QWORD *)&a3, v6);
    }
    else
    {
      *(double *)((char *)&self->mEnterSOSTimeStamp + 4) = a3;
      -[NSDate timeIntervalSince1970](+[NSDate date](NSDate, "date"), "timeIntervalSince1970");
      *(_QWORD *)(&self->mPrevCombinedRegistrationStatus + 1) = v5;
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s mStrongestSOSRSRP %f, mStrongestSOSTimeStamp %@"), "-[WRM_EnhancedCTService monitorStrongSOSSignal:]", *(_QWORD *)((char *)&self->mEnterSOSTimeStamp + 4), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
    }
  }
}

- (BOOL)validateStrongestSOSTimeStamp:(double)a3
{
  double v4;
  double v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(double *)(&self->mPrevCombinedRegistrationStatus + 1);
  if (v4 <= 0.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s Invalid mStrongestSOSTimeStamp %@"), "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"), v10, v12, v14);
    return 0;
  }
  v6 = *(double *)((char *)&self->mEnterSOSTimeStamp + 4);
  if (v6 > -44.0 || v6 < -140.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s Invalid mStrongestSOSRSRP %f"), "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", *(_QWORD *)&v6, v10, v12, v14);
    return 0;
  }
  v7 = v4 - *(double *)((char *)&self->mStrongestSOSTimeStamp + 4);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s mStrongestSOSTimeStamp %@ within %f seconds of mEnterSOSTimeStamp %@. "), "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"), *(_QWORD *)&v7, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", *(double *)((char *)&self->mStrongestSOSTimeStamp + 4)));
  if (v7 <= 0.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s Invalid mStrongestSOSTimeStamp as before mEnterSOSTimeStamp "), "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", v9, v11, v13, v14);
    return 0;
  }
  if (v7 < 180.0)
  {
    *(double *)(&self->mPrevCombinedRegistrationStatus + 1) = *(double *)((char *)&self->mStrongestSOSTimeStamp + 4)
                                                            + 180.0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s Resetting mStrongestSOSTimeStamp to %@ as too close to entry SOS timestamp"), "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
    if (*(double *)(&self->mPrevCombinedRegistrationStatus + 1) > a3)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s Invalid mStrongestSOSTimeStamp %@ as SOS patch is less than %d seconds (mEnterSOSTimeStamp %@ - changeTimeStamp %@)"), "-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"), 180, +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", *(double *)((char *)&self->mStrongestSOSTimeStamp + 4)), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3));
      return 0;
    }
  }
  return 1;
}

- (void)initializeStrongestSOSSignal:(double)a3
{
  *(double *)((char *)&self->mStrongestSOSTimeStamp + 4) = a3;
  *(_QWORD *)(&self->mPrevCombinedRegistrationStatus + 1) = 0;
  *(double *)((char *)&self->mEnterSOSTimeStamp + 4) = -1000.0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("%s Reset to initial values. mEnterSOSTimeStamp %@ mStrongestSOSRSRP %f, mStrongestSOSTimeStamp %@"), "-[WRM_EnhancedCTService initializeStrongestSOSSignal:]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", *(double *)((char *)&self->mStrongestSOSTimeStamp + 4)), *(_QWORD *)((char *)&self->mEnterSOSTimeStamp + 4), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", *(double *)(&self->mPrevCombinedRegistrationStatus + 1)));
}

- (void)writeToCellularAvailabilityStatusBiomeStream:(double)a3 :(BOOL)a4
{
  uint64_t v6;
  __objc2_class **p_superclass;
  double v8;
  char **v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  NSDate *v15;
  uint64_t mCellularAvailabilityStatus_high;
  NSNumber *v17;
  NSDate *v18;
  NSDate *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;

  if (a4)
    v6 = 4;
  else
    v6 = -[WRM_EnhancedCTService combinedRegistrationStatus](self, "combinedRegistrationStatus");
  p_superclass = WRM_SCService.superclass;
  if (HIDWORD(self->mCellularAvailabilityStatus) == (_DWORD)v6)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("%s: Skipping event as %d same as previous status %d\n"), "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", v6, v6);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("%s: changeTimeStamp %@ combinedRegistrationStatus: %d mCellularAvailabilityStatus %@\n"), "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3), v6, *(_QWORD *)(&self->mWrmSdmLocationMonitoringStarted + 4));
    v8 = 0.0;
    v9 = &selRef_lowBandInABSReportFastCharging;
    if (HIDWORD(self->mCellularAvailabilityStatus) == 2)
    {
      if (-[WRM_EnhancedCTService validateStrongestSOSTimeStamp:](self, "validateStrongestSOSTimeStamp:", a3))
      {
        v8 = *(double *)(&self->mPrevCombinedRegistrationStatus + 1);
        v9 = &selRef_lowBandInABSReportFastCharging;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("%s Setting latestStrongTimeStamp %@ to mStrongestSOSTimeStamp %@ with RSRP %f aboveThreshold %d"), "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v8), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v8), *(_QWORD *)((char *)&self->mEnterSOSTimeStamp + 4), *(double *)((char *)&self->mEnterSOSTimeStamp + 4) >= *(double *)((char *)&self->mStrongestSOSRSRP + 4));
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("%s Invalid latestStrongTimeStamp %@. Persisting changeTimeStamp %@ for SOS"), "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0), +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3), v22, v23);
      }
    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v10 = off_1002710C0;
    v27 = off_1002710C0;
    if (!off_1002710C0)
    {
      v11 = (void *)sub_1000439BC();
      v10 = dlsym(v11, "__BMRootLibrary");
      v25[3] = (uint64_t)v10;
      off_1002710C0 = v10;
    }
    _Block_object_dispose(&v24, 8);
    if (!v10)
      sub_10012E538();
    v12 = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)((uint64_t (*)(void))v10)(), "Device"), "Wireless"), "CellularAvailabilityStatus"), "source");
    if (HIDWORD(self->mCellularAvailabilityStatus) == -1)
      HIDWORD(self->mCellularAvailabilityStatus) = 0;
    v13 = *(uint64_t *)((char *)&self->super.super.isa + *((int *)v9 + 517));
    if (v8 == 0.0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("%s NIL latestStrongTimeStamp %f  mStrongestSOSTimeStamp %f"), "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", *(_QWORD *)&v8, v13);
      v20 = objc_msgSend(objc_alloc((Class)sub_10003CD4C()), "initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3), 2, v6, HIDWORD(self->mCellularAvailabilityStatus));
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("%s NOT NIL latestStrongTimeStamp %f mStrongestSOSTimeStamp %f"), "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", *(_QWORD *)&v8, v13);
      v14 = objc_alloc((Class)sub_10003CD4C());
      v15 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3);
      mCellularAvailabilityStatus_high = HIDWORD(self->mCellularAvailabilityStatus);
      v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0);
      v18 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v8);
      v19 = v15;
      p_superclass = (__objc2_class **)(WRM_SCService + 8);
      v20 = objc_msgSend(v14, "initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", v19, 2, v6, mCellularAvailabilityStatus_high, v17, v18);
    }
    v21 = v20;
    objc_msgSend(p_superclass + 279, "logLevel:message:", 17, CFSTR("%s Event: %@"), "-[WRM_EnhancedCTService writeToCellularAvailabilityStatusBiomeStream::]", objc_msgSend(v20, "description"));
    HIDWORD(self->mCellularAvailabilityStatus) = v6;
    objc_msgSend(v12, "sendEvent:", v21);

    if (HIDWORD(self->mCellularAvailabilityStatus) == 2)
      -[WRM_EnhancedCTService initializeStrongestSOSSignal:](self, "initializeStrongestSOSSignal:", a3);
  }
}

- (void)plmnChanged:(id)a3 plmn:(id)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CE84;
  block[3] = &unk_100201EB0;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)privateNetworkInfoDidChange:(BOOL)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  id v17;
  id v18;
  _BOOL4 v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v19 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("privateNetworkInfoDidChange startEvaluation=%d"), a3);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = -[WRM_EnhancedCTService subscriptions](self, "subscriptions");
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "slotID"))
        {
          v20 = 0;
          v10 = -[CoreTelephonyClient getPrivateNetworkCapabilitiesForContext:error:](-[WRM_EnhancedCTService CTClient](self, "CTClient"), "getPrivateNetworkCapabilitiesForContext:error:", v9, &v20);
          v11 = v20;
          v12 = objc_msgSend(v9, "slotID");
          if (v11 || !v10)
          {
            if (v12)
            {
              v16 = "CTSubscriptionSlotOne";
              if (objc_msgSend(v9, "slotID") != (id)1)
              {
                if (objc_msgSend(v9, "slotID") == (id)2)
                  v16 = "CTSubscriptionSlotTwo";
                else
                  v16 = "Unknown CTSubscriptionSlot!!!";
              }
            }
            else
            {
              v16 = "CTSubscriptionSlotUnknown";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: privateNetworkInfoDidChange cap error=%@"), v16, objc_msgSend(v20, "localizedDescription"));
            v17 = 0;
            v18 = 0;
          }
          else
          {
            if (v12)
            {
              v13 = objc_msgSend(v9, "slotID");
              v14 = "CTSubscriptionSlotOne";
              if (v13 != (id)1)
              {
                v15 = objc_msgSend(v9, "slotID");
                v14 = "Unknown CTSubscriptionSlot!!!";
                if (v15 == (id)2)
                  v14 = "CTSubscriptionSlotTwo";
              }
            }
            else
            {
              v14 = "CTSubscriptionSlotUnknown";
            }
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: privateNetworkInfoDidChange cap=%@"), v14, v10);
            v17 = objc_msgSend(v10, "isPrivateNetworkModeEnabled");
            v18 = objc_msgSend(v10, "isPrivateNetworkPreferredOverWifi");
          }
          -[WRM_EnhancedCTService processPrivateNwSimStatus:slot:](self, "processPrivateNwSimStatus:slot:", v17, objc_msgSend(v9, "slotID"));
          -[WRM_EnhancedCTService processPrivateNwPreferredOverWifiStatus:slot:](self, "processPrivateNwPreferredOverWifiStatus:slot:", v18, objc_msgSend(v9, "slotID"));
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }
  *(WRM_Timer **)((char *)&self->mCbrsSwitchingTimer + 4) = 0;
  BYTE4(self->mLastCbrsRecommendation) = v19;
  if (v19)
  {
    if ((id)-[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions") == (id)1)
    {
      -[WRM_EnhancedCTService evaluateCbrsInSingleSimMode](self, "evaluateCbrsInSingleSimMode");
    }
    else if (-[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions") >= 2)
    {
      -[WRM_EnhancedCTService evaluateCbrsInDualSimMode:](self, "evaluateCbrsInDualSimMode:", 1);
    }
  }
}

- (void)evaluateCbrsInSingleSimMode
{
  const char *v3;
  int64_t v4;
  id v5;
  void *v6;
  char *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  NSMutableArray *v12;
  double v13;
  double v14;
  _BOOL8 v15;

  if (BYTE4(self->mLastCbrsRecommendation)
    && objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice")&& (id)-[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions") == (id)1)
  {
    if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
    {
      if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
      {
        v3 = "CTSubscriptionSlotOne";
      }
      else
      {
        v4 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
        v3 = "Unknown CTSubscriptionSlot!!!";
        if (v4 == 2)
          v3 = "CTSubscriptionSlotTwo";
      }
    }
    else
    {
      v3 = "CTSubscriptionSlotUnknown";
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("evaluateCbrsInSingleSimMode SingleSim DataSlot=%s"), v3);
    if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
    {
      v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
      if (!v5)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Error: invalid tempiRATConfig"));
        return;
      }
      v6 = v5;
      v7 = (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1;
      v8 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", v7), "intValue");
      if (v8 == 9)
      {
        objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"), "objectAtIndex:", v7), "doubleValue");
        v9 = v13;
        v12 = -[WRM_EnhancedCTService nrCellRSRQ](self, "nrCellRSRQ");
      }
      else
      {
        v9 = 0.0;
        v10 = 0.0;
        if (v8 != 1)
          goto LABEL_19;
        objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"), "objectAtIndex:", v7), "doubleValue");
        v9 = v11;
        v12 = -[WRM_EnhancedCTService servCellRSRQ](self, "servCellRSRQ");
      }
      objc_msgSend(-[NSMutableArray objectAtIndex:](v12, "objectAtIndex:", v7), "doubleValue");
      v10 = v14;
LABEL_19:
      v15 = v9 > (double)(uint64_t)objc_msgSend(v6, "nonCbrsExitRsrpMin")
         && v10 > (double)(uint64_t)objc_msgSend(v6, "nonCbrsExitRsrqMin");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("evaluateCbrsInSingleSimMode recommendSlot=unknown, dataSlotQuality=%d, anyCallState=%d"), v15, HIDWORD(self->mSCService));
      -[WRM_EnhancedCTService switchPrivateNwDataSim:currentSlotQuality:anyCallState:forceRecommend:](self, "switchPrivateNwDataSim:currentSlotQuality:anyCallState:forceRecommend:", 0, v15, HIDWORD(self->mSCService), 1);
    }
  }
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v5;
  WRM_Timer *v6;
  double v7;
  WRM_Timer *v8;
  OS_dispatch_queue *v9;
  const __CFString *v10;
  _QWORD v11[4];
  id v12;
  id location;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("dataPreferredSlot changed to %ld"), objc_msgSend(a3, "slotID"));
  -[WRM_EnhancedCTService setDataPreferredSlot:](self, "setDataPreferredSlot:", objc_msgSend(a3, "slotID"));
  if (!BYTE4(self->mLastCbrsRecommendation)
    || (id)-[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions") == (id)1)
  {
    return;
  }
  if ((objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isPrivateNetworkSim](self, "isPrivateNetworkSim"), "objectAtIndex:", 0), "BOOLValue") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if ((objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService isPrivateNetworkSim](self, "isPrivateNetworkSim"), "objectAtIndex:", 1), "BOOLValue") & 1) == 0)
    {
      v10 = CFSTR("currentDataSimChanged error: cbrs SIM not present in dual sim mode");
      goto LABEL_17;
    }
    v5 = 2;
  }
  v6 = (WRM_Timer *)objc_msgSend(a3, "slotID");
  if (v6 != *(WRM_Timer **)((char *)&self->mCbrsSwitchingTimer + 4))
  {
    v10 = CFSTR("Do not start CBRS ping-pong timer as CT hasn't honored WRM's recommendation");
LABEL_17:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v10);
    return;
  }
  if (*(_QWORD *)&self->mCellRSRQ4G5GvsWiFiThreshold)
  {
    objc_msgSend(*(id *)&self->mCellRSRQ4G5GvsWiFiThreshold, "invalidate");

    *(_QWORD *)&self->mCellRSRQ4G5GvsWiFiThreshold = 0;
    v6 = *(WRM_Timer **)((char *)&self->mCbrsSwitchingTimer + 4);
  }
  if (v6 == (WRM_Timer *)v5)
    v7 = 15.0;
  else
    v7 = 60.0;
  objc_initWeak(&location, self);
  v8 = [WRM_Timer alloc];
  v9 = -[WRM_EnhancedCTService queue](self, "queue");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003D6CC;
  v11[3] = &unk_100201ED8;
  objc_copyWeak(&v12, &location);
  *(_QWORD *)&self->mCellRSRQ4G5GvsWiFiThreshold = -[WRM_Timer initWithFireTimeIntervalSinceNow:queue:block:](v8, "initWithFireTimeIntervalSinceNow:queue:block:", v9, v11, v7);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CBRS ping-pong timer started for %f seconds"), *(_QWORD *)&v7);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)updateCallState:(int)a3
{
  const char *v3;
  const char *v5;

  if (HIDWORD(self->mSCService) == a3)
  {
    v3 = "inactive";
    if (a3 == 1)
      v3 = "active";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("EnhancedCTService: updateCallState no change %s"), v3);
  }
  else
  {
    HIDWORD(self->mSCService) = a3;
    if (a3 == 1)
      v5 = "active";
    else
      v5 = "inactive";
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("EnhancedCTService: updateCallState=%s, mWrmCbrsMonitorRequired=%d, numberofSubscriptions=%lu"), v5, BYTE4(self->mLastCbrsRecommendation), -[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions"));
    if (BYTE4(self->mLastCbrsRecommendation))
    {
      if ((id)-[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions") == (id)1)
      {
        -[WRM_EnhancedCTService evaluateCbrsInSingleSimMode](self, "evaluateCbrsInSingleSimMode");
      }
      else if (-[WRM_EnhancedCTService numberofSubscriptions](self, "numberofSubscriptions") >= 2)
      {
        -[WRM_EnhancedCTService evaluateCbrsInDualSimMode:](self, "evaluateCbrsInDualSimMode:", 1);
      }
    }
  }
}

- (void)evaluateCbrsInDualSimMode:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D8DC;
  v3[3] = &unk_100201E38;
  v3[4] = self;
  v4 = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v3);
}

- (void)switchPrivateNwDataSim:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5 forceRecommend:(BOOL)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v9;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  if (!a6 && (v9 = *(void **)&self->mCellRSRQ4G5GvsWiFiThreshold) != 0 && objc_msgSend(v9, "isValid"))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CBRS ping-pong timer not expired yet. Suppress switching"));
  else
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "switchPrivateNwDataSim:currentSlotQuality:anyCallState:", a3, v7, v6);
}

- (void)voiceLinkQualityChanged:(id)a3 metric:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ metric %@"), "-[WRM_EnhancedCTService voiceLinkQualityChanged:metric:]", a3, a4);
  -[WRM_EnhancedCTService processVoiceLinkQualityInfo::](self, "processVoiceLinkQualityInfo::", a4, objc_msgSend(a3, "slotID"));
}

- (void)enhancedVoiceLinkQualityChanged:(id)a3 metric:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ metric %@"), "-[WRM_EnhancedCTService enhancedVoiceLinkQualityChanged:metric:]", a3, a4);
  -[WRM_EnhancedCTService processEnhancedVoiceLinkQualityBlob::](self, "processEnhancedVoiceLinkQualityBlob::", a4, objc_msgSend(a3, "slotID"));
}

- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ metric %@"), "-[WRM_EnhancedCTService enhancedDataLinkQualityChanged:metric:]", a3, a4);
  -[WRM_EnhancedCTService processEnhancedDataLQMBlob::](self, "processEnhancedDataLQMBlob::", a4, objc_msgSend(a3, "slotID"));
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ dataStatus %@"), "-[WRM_EnhancedCTService dataStatus:dataStatusInfo:]", a3, a4);
  -[WRM_EnhancedCTService processDataStatus::](self, "processDataStatus::", a4, objc_msgSend(a3, "slotID"));
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ info %@"), "-[WRM_EnhancedCTService imsRegistrationChanged:info:]", a3, a4);
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  id v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ cell info %@"), "-[WRM_EnhancedCTService cellChanged:cell:]", a3, a4);
  if (a4)
  {
    v7 = objc_msgSend(a4, "objectForKey:", CFSTR("kCTRegistrationRadioAccessTechnology"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s rat info %@"), "-[WRM_EnhancedCTService cellChanged:cell:]", v7);
    if (v7)
      -[WRM_EnhancedCTService processRadioTechnologyInfo::](self, "processRadioTechnologyInfo::", v7, objc_msgSend(a3, "slotID"));
  }
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s context %@ capabilitiesChanged info %@"), "-[WRM_EnhancedCTService context:capabilitiesChanged:]", a3, a4);
  v7 = objc_msgSend(a4, "objectForKey:", kCTCapabilityAgent);
  if (v7)
  {
    v8 = objc_msgSend(v7, "objectForKey:", CFSTR("kCTCapabilityStatus"));
    v9 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("kCTCapabilityVoLTE status %d"), objc_msgSend(v8, "BOOLValue"));
      -[WRM_EnhancedCTService processVolteStatus::](self, "processVolteStatus::", objc_msgSend(v8, "BOOLValue"), objc_msgSend(a3, "slotID"));
    }
  }
  v10 = objc_msgSend(a4, "objectForKey:", kCTCapabilityAgent2);
  if (v10)
  {
    v11 = objc_msgSend(v10, "objectForKey:", CFSTR("kCTCapabilityStatus"));
    v12 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("kCTCapabilityWiFiCalling status %d"), objc_msgSend(v11, "BOOLValue"));
      -[WRM_EnhancedCTService processWiFiCallingStatus::](self, "processWiFiCallingStatus::", objc_msgSend(v11, "BOOLValue"), objc_msgSend(a3, "slotID"));
      objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "evalSAStatusWiFiCallCallingPrefChanged");
    }
  }
}

- (BOOL)checkIfServingCellNonLTE
{
  uint64_t v3;
  char v4;
  char v5;
  unsigned int v6;
  BOOL result;

  v3 = 0;
  v4 = 1;
  while (1)
  {
    v5 = v4;
    v6 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", v3), "intValue");
    if (v6 != 10 && v6 != 1)
      break;
    v4 = 0;
    result = 0;
    v3 = 1;
    if ((v5 & 1) == 0)
      return result;
  }
  return 1;
}

- (void)setNrRSRP:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E690;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setNrSNR:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E7C4;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setServingCellECIO:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E8C8;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setServingCellRSCP:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E9CC;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)setNrRSRQ:(double)a3 forSim:(int64_t)a4
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EAD0;
  block[3] = &unk_100201C30;
  block[4] = self;
  block[5] = a4;
  *(double *)&block[6] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (double)getNrRSRP
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003EC10;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getNrRSRP:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EDB0;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getNrSNR
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003EF14;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getNrSNR:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F0B4;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)getNrRSRQ
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003F218;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getNrRSRQ:(int64_t)a3
{
  double v3;
  _QWORD block[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F3B8;
  block[3] = &unk_100201C08;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)getFR2Status
{
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentHarvestedCellTypeFR2Capable](self, "currentHarvestedCellTypeFR2Capable"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue") != 0;
}

- (unsigned)getLocationDBFR1Count
{
  const char *v3;

  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s getLocationDBFR1Count %d"), "-[WRM_EnhancedCTService getLocationDBFR1Count]", v3, objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
}

- (unsigned)getLocationDBFR2Count
{
  const char *v3;

  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v3 = "CTSubscriptionSlotOne";
    }
    else if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)2)
    {
      v3 = "CTSubscriptionSlotTwo";
    }
    else
    {
      v3 = "Unknown CTSubscriptionSlot!!!";
    }
  }
  else
  {
    v3 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s getLocationDBFR2Count %d"), "-[WRM_EnhancedCTService getLocationDBFR2Count]", v3, objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue"));
  return objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
}

- (int)getCTDataIndictor:(int64_t)a3
{
  unsigned int v4;
  const char *v5;
  const char *v6;

  v4 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService dataIndicator](self, "dataIndicator"), "objectAtIndex:", a3 - 1), "intValue");
  v5 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v5 = "CTSubscriptionSlotTwo";
  if (a3 == 1)
    v5 = "CTSubscriptionSlotOne";
  if (!a3)
    v5 = "CTSubscriptionSlotUnknown";
  if (v4 < 0x13 && ((0x5FFF7u >> v4) & 1) != 0)
  {
    v6 = (&off_1002022A0)[v4];
  }
  else
  {
    v6 = "Unknown kCTDataIndicatorStatusUnknown!!!";
    if (v4 == 17)
      v6 = "5GUwb";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: sim slot %s Data indicator: %s"), "-[WRM_EnhancedCTService getCTDataIndictor:]", v5, v6);
  return v4;
}

- (int)getBandInfoOnSlot:(int64_t)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;

  v4 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService cellBandInfo](self, "cellBandInfo"), "objectAtIndex:", a3 - 1), "intValue");
  v5 = "CTSubscriptionSlotUnknown";
  v6 = "CTSubscriptionSlotOne";
  v7 = "Unknown CTSubscriptionSlot!!!";
  if (a3 == 2)
    v7 = "CTSubscriptionSlotTwo";
  if (a3 != 1)
    v6 = v7;
  if (a3)
    v5 = v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: getBandInfoOnSlot %s Band info %d"), "-[WRM_EnhancedCTService getBandInfoOnSlot:]", v5, v4);
  return (int)v4;
}

- (int)getConfiguredMaxBW
{
  id v3;
  const char *v4;
  int64_t v5;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService configuredMaxDLBW](self, "configuredMaxDLBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v4 = "CTSubscriptionSlotOne";
    }
    else
    {
      v5 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v4 = "Unknown CTSubscriptionSlot!!!";
      if (v5 == 2)
        v4 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v4 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: active slot %s Cell BW %d"), "-[WRM_EnhancedCTService getConfiguredMaxBW]", v4, v3);
  return (int)v3;
}

- (void)resetWiFiNRStatusDataSlot
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](-[WRM_EnhancedCTService wifiNRCellFound](self, "wifiNRCellFound"), "replaceObjectAtIndex:withObject:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
}

- (void)updateDataStallState:(int64_t)a3 stall:(BOOL)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F99C;
  block[3] = &unk_100201D70;
  v5 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)updateCurrentRatInfo:(int64_t)a3 currentNRCell:(int)a4
{
  _QWORD block[6];
  int v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FB68;
  block[3] = &unk_100201F00;
  v5 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)updateConfiguredMaxBW:(int64_t)a3 dlbw:(unsigned int)a4 ulbw:(unsigned int)a5
{
  _QWORD block[6];
  unsigned int v6;
  unsigned int v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FCA4;
  block[3] = &unk_100201C30;
  v6 = a4;
  v7 = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)updateDownlinkEstimatedBW:(unsigned __int8)a3 bw:(unsigned int)a4 conf:(unsigned int)a5 lte:(unsigned int)a6 nr:(unsigned int)a7
{
  _QWORD block[5];
  unsigned int v8;
  unsigned int v9;
  unsigned __int8 v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FE14;
  block[3] = &unk_100201D70;
  v10 = a3;
  v8 = a4;
  v9 = a5;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7), block);
}

- (void)updateUplinkEstimatedBW:(unsigned __int8)a3 bw:(unsigned int)a4 conf:(unsigned int)a5 queue:(unsigned int)a6
{
  _QWORD block[5];
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned __int8 v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FF94;
  block[3] = &unk_100201F28;
  v10 = a3;
  v7 = a4;
  v8 = a5;
  v9 = a6;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (BOOL)ifInternalDevice
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput check for internal device"));
  return MGGetBoolAnswer(CFSTR("InternalBuild"));
}

- (BOOL)isBetaBuild
{
  if (qword_1002710A0 != -1)
    dispatch_once(&qword_1002710A0, &stru_100201F68);
  return 0;
}

- (BOOL)ifMAV20Device
{
  unsigned int v2;

  v2 = objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId");
  return v2 == 13 || (v2 & 0xFFFFFFFE) == 14 || v2 == 11;
}

- (BOOL)ifAutomatedDeviceGroup
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = sub_10003BD94;
  v9 = sub_10003BDA4;
  v2 = (void *)qword_1002710D0;
  v10 = qword_1002710D0;
  if (!qword_1002710D0)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100043AB8;
    v4[3] = &unk_100201B40;
    v4[4] = &v5;
    sub_100043AB8((uint64_t)v4);
    v2 = (void *)v6[5];
  }
  _Block_object_dispose(&v5, 8);
  return objc_msgSend(objc_msgSend(v2, "performSelector:", NSSelectorFromString(CFSTR("automatedDeviceGroup"))), "length") != 0;
}

- (void)setCellularSpeedTestsDisabled:(BOOL)a3
{
  const char *v4;

  v4 = "NO";
  if (a3)
    v4 = "YES";
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput cellularSpeedTestsDisabled: %s"), v4);
  byte_1002710A8 = a3;
}

- (void)checkAndScheduleSpeedTest
{
  BOOL v2;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;

  if (*(_QWORD *)(&self->super.m_PDPAssertionRefCount + 1))
    v2 = byte_1002710A8 == 0;
  else
    v2 = 0;
  if (v2)
  {
    v4 = -[WRM_EnhancedCTService getCTDataIndictor](self, "getCTDataIndictor");
    if (((1 << v4) & 0x70100) != 0)
      v5 = 1;
    else
      v5 = -1;
    if (v4 <= 0x12)
      v6 = v5;
    else
      v6 = 0xFFFFFFFFLL;
    v7 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
    if ((byte_1002710A9 & 1) == 0)
    {
      v8 = objc_msgSend(v7, "ifScheduleSpeedTestAfterReboot:probability:", 1, 60);
      v7 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
      if ((v8 & 1) == 0 && v7)
      {

        *(_QWORD *)(&self->super.m_PDPAssertionRefCount + 1) = 0;
        return;
      }
      byte_1002710A9 = 1;
    }
    v9 = v7;
    if ((byte_1002710AA & 1) == 0)
    {
      v10 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
      byte_1002710AA = 1;
      objc_msgSend(v10, "scheduleTests::", v6, &stru_100201FA8);
    }
  }
}

- (BOOL)determineifSABWCriteriaMet
{
  unsigned __int8 v3;

  v3 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService highDataRateObserved](self, "highDataRateObserved"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "BOOLValue");
  if (objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService configuredMaxDLBW](self, "configuredMaxDLBW"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue") >= self->mWRMCellOutrankWifiBWThreshold)return 1;
  else
    return v3;
}

- (void)evaluateCellularScorePrivateNw:(unsigned __int8)a3 currnetConf:(unsigned __int8)a4 score:(char *)a5 conf:(char *)a6 evalMode:(BOOL)a7 outrankExit:(BOOL)a8
{
  _BOOL8 v8;
  unsigned int v12;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  _BOOL4 v24;
  const char *v25;
  const __CFString *v26;
  int64_t v27;
  unsigned int v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unsigned int v33;
  id v34;
  id v35;
  const char *v36;
  int64_t v37;
  char v38;
  char *v39;
  char *v40;
  int v41;
  char *v42;
  char v43;
  unsigned int v44;
  _BOOL4 v45;
  char *v46;
  char *v47;
  int v48;
  id v49;

  v8 = a7;
  *a5 = a3;
  *a6 = a4;
  v12 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRadioTechnologyType](self, "servCellRadioTechnologyType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v13 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService currentNRCellType](self, "currentNRCellType"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v14 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService rrcState](self, "rrcState"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (v12 == 9 || (_DWORD)v13 == 3)
  {
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellRSRP](self, "nrCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v16 = v20;
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService nrCellSNR](self, "nrCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v18 = v21;
    v19 = -[WRM_EnhancedCTService nrCellRSRQ](self, "nrCellRSRQ");
  }
  else
  {
    if (v12 != 1)
    {
      *a5 = 3;
      *a6 = 2;
      v26 = CFSTR("evaluateCellularScore: score: bad");
      goto LABEL_44;
    }
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellRSRP](self, "servCellRSRP"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v16 = v15;
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService servCellSNR](self, "servCellSNR"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
    v18 = v17;
    v19 = -[WRM_EnhancedCTService servCellRSRQ](self, "servCellRSRQ");
  }
  objc_msgSend(-[NSMutableArray objectAtIndex:](v19, "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "doubleValue");
  v23 = v22;
  v24 = v16 >= (double)(int)self->mCellConfiguredBandwidth && v22 >= (double)self->mCellRSRP4G5GvsWiFiThreshold;
  v46 = a5;
  v47 = a6;
  v49 = v13;
  v45 = v24;
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v25 = "CTSubscriptionSlotOne";
    }
    else
    {
      v27 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v25 = "Unknown CTSubscriptionSlot!!!";
      if (v27 == 2)
        v25 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v25 = "CTSubscriptionSlotUnknown";
  }
  v48 = (int)v14;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScorePrivateNw: RRC state: %d, forceActiveEval:%d, RSRP: %f, SNR: %f, RSRQ: %f, data slot: %s, locationEnabled:%d"), v14, v8, *(_QWORD *)&v16, v18, *(_QWORD *)&v23, v25, byte_100270960);
  v44 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService stallDetected](self, "stallDetected"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v28 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService highDataRateObserved](self, "highDataRateObserved"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "BOOLValue");
  v29 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDL](self, "estimatedBWDL"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v30 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService estimatedBWDLConf](self, "estimatedBWDLConf"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v31 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService DataLqmValue](self, "DataLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v32 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService VoiceLqmValue](self, "VoiceLqmValue"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v33 = -[WRM_EnhancedCTService getWiFiNRStatusDataSlot](self, "getWiFiNRStatusDataSlot");
  v34 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR1CellCountLocDB](self, "detectedFR1CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  v35 = objc_msgSend(-[NSMutableArray objectAtIndex:](-[WRM_EnhancedCTService detectedFR2CellCountLocDB](self, "detectedFR2CellCountLocDB"), "objectAtIndex:", (char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1), "intValue");
  if (-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot"))
  {
    if ((id)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") == (id)1)
    {
      v36 = "CTSubscriptionSlotOne";
    }
    else
    {
      v37 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
      v36 = "Unknown CTSubscriptionSlot!!!";
      if (v37 == 2)
        v36 = "CTSubscriptionSlotTwo";
    }
  }
  else
  {
    v36 = "CTSubscriptionSlotUnknown";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScorePrivateNw: LocationDB FR1 count: %d, FR2 count: %d, %s"), v34, v35, v36);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScorePrivateNw: Connected Cell: %d, High rate likely : %d, DL BW:%d, DL Conf:%d isWiFiCellNR: %d"), v49, v28, v29, v30, v33 != 0);
  if (v48 != 1 && !v8)
  {
    v38 = 1;
    if ((_DWORD)v31 == 50)
    {
      v40 = v46;
      v39 = v47;
    }
    else
    {
      v40 = v46;
      v39 = v47;
      if ((_DWORD)v31 != 100)
      {
        v41 = v45;
        if ((_DWORD)v34)
          v41 = 1;
        if ((_DWORD)v35)
          v41 = 1;
        if (v41)
          v38 = 1;
        else
          v38 = 3;
      }
    }
    *v40 = v38;
    *v39 = 2;
    v26 = CFSTR("evaluateCellularScorePrivateNw: default evaluation");
    goto LABEL_44;
  }
  if ((int)v30 < 5)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScorePrivateNw: dLQM: %d, vLQM: %d, RLGS stal: %d"), v31, v32, v44 != 0);
    if ((_DWORD)v31 == 10 || (_DWORD)v32 == 10 || v44)
      goto LABEL_41;
    v26 = CFSTR("evaluateCellularScorePrivateNw: RRC Connected mode");
LABEL_44:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, v26);
    return;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("evaluateCellularScorePrivateNw: DLBW: %d, Conf:%d"), v29, v30);
  if ((int)v29 > 1999)
  {
    v42 = v47;
    if ((v45 & v28 & 1) != 0)
    {
      *v46 = 1;
      v43 = 2;
    }
    else
    {
      *v46 = 2;
      v43 = 1;
    }
    goto LABEL_46;
  }
LABEL_41:
  *v46 = 3;
  v43 = 2;
  v42 = v47;
LABEL_46:
  *v42 = v43;
}

- (void)reloadCellularSpeedTestSettingsFromPreferences
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFTypeID TypeID;
  CFTypeID v6;
  BOOL v7;
  _BOOL8 v8;
  const char *v9;
  int v10;
  const __CFString *v11;
  void *value;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: reloadCellularSpeedTestSettingsFromPreferences called"));
  v3 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("iRATDebug"), CFSTR("com.apple.WirelessRadioManager.debug"));
  if (!v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("iRATDebug not Found"));
    v8 = 0;
    v10 = 1;
    goto LABEL_13;
  }
  v4 = v3;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID == CFGetTypeID(v4))
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent(v4, CFSTR("CellularSpeedTest"), (const void **)&value))
    {
      v6 = CFStringGetTypeID();
      if (v6 == CFGetTypeID(value))
      {
        v7 = CFStringCompare(CFSTR("FALSE"), (CFStringRef)value, 0) == kCFCompareEqualTo;
        v8 = v7;
        v9 = "FALSE";
        if (v7)
          v9 = "TRUE";
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: DisableCellularSpeedTest read from preference %s"), v9);
        v10 = 0;
        goto LABEL_12;
      }
    }
    v11 = CFSTR("CellularThroughput: DisableCellularSpeedTest not found");
  }
  else
  {
    v11 = CFSTR("iRATDebug not Found");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v11);
  v8 = 0;
  v10 = 1;
LABEL_12:
  CFRelease(v4);
LABEL_13:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput setCellularSpeedTestDisabled is %d"), v8);
  -[WRM_EnhancedCTService handleSettingCellularSpeedTestSetting:](self, "handleSettingCellularSpeedTestSetting:", v8);
  if (v10)
    -[WRM_EnhancedCTService setCellularSpeedTestSettingsToPreferences:](self, "setCellularSpeedTestSettingsToPreferences:", v8);
}

- (void)handleSettingCellularSpeedTestSetting:(BOOL)a3
{
  void *v4;

  -[WRM_EnhancedCTService setCellularSpeedTestsDisabled:](self, "setCellularSpeedTestsDisabled:", a3);
  if (byte_1002710A8)
  {
    v4 = *(void **)(&self->super.m_PDPAssertionRefCount + 1);
    if (v4)
      objc_msgSend(v4, "abort");
  }
}

- (void)setCellularSpeedTestSettingsToPreferences:(BOOL)a3
{
  const char *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  void *values;
  void *keys;

  v3 = "FALSE";
  if (a3)
    v3 = "TRUE";
  values = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v3);
  keys = CFSTR("CellularSpeedTest");
  v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v4)
  {
    v5 = v4;
    CFPreferencesSetAppValue(CFSTR("iRATDebug"), v4, CFSTR("com.apple.WirelessRadioManager.debug"));
    CFRelease(v5);
  }
  if (!CFPreferencesAppSynchronize(CFSTR("com.apple.WirelessRadioManager.debug")))
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: Failed to sync the preferences."), "-[WRM_EnhancedCTService setCellularSpeedTestSettingsToPreferences:]");
}

- (BOOL)ifLimitSpeedTest
{
  return objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "platformManager"), "wrmPlatformId")- 22 < 4;
}

- (void)initCellularProductExperimentsManager
{
  *(WRM_SpeedTestSchedulerServicesIOS **)((char *)&self->speedTestSchedulerServices + 4) = (WRM_SpeedTestSchedulerServicesIOS *)objc_alloc_init(CellularProductExperimentsManager);
}

- (double)initSOSWaypointThreshold
{
  id v2;
  void *v3;

  v2 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  if (v2)
  {
    v3 = v2;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("initSOSWaypointThreshold: Setting to %f"), (double)(uint64_t)objc_msgSend(v2, "sosWaypointRSRPTh"));
    return (double)(uint64_t)objc_msgSend(v3, "sosWaypointRSRPTh");
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("initSOSWaypointThreshold Error: invalid tempiRATConfig. Setting to default value of -115"));
    return -115.0;
  }
}

- (void)initCellularSpeedTest
{
  _QWORD v3[5];
  int out_token;

  if (-[WRM_EnhancedCTService shouldScheduleSpeedTests](self, "shouldScheduleSpeedTests"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: initCellularSpeedTest"));
    *(_QWORD *)(&self->super.m_PDPAssertionRefCount + 1) = -[WRM_SpeedTestSchedulerServicesIOS initWithWaitTime:]([WRM_SpeedTestSchedulerServicesIOS alloc], "initWithWaitTime:", 259200.0);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: calling reloadCellularSpeedTestSettingsFromPreferences"));
    out_token = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100040F08;
    v3[3] = &unk_100201FD0;
    v3[4] = self;
    notify_register_dispatch("com.apple.WirelessRadioManager.DisableSpeedTestNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, v3);
    -[WRM_EnhancedCTService reloadCellularSpeedTestSettingsFromPreferences](self, "reloadCellularSpeedTestSettingsFromPreferences");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: reloadCellularSpeedTestSettingsFromPreferences called from EnhancedCTServices"));
  }
  else
  {
    *(_QWORD *)(&self->super.m_PDPAssertionRefCount + 1) = 0;
  }
}

- (void)initCellStationManager
{
  WRM_CellStationManagerIOS *v3;
  const __CFString *v4;

  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    v3 = objc_alloc_init(WRM_CellStationManagerIOS);
    *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4) = (CellularProductExperimentsManager *)v3;
    if (v3)
      v4 = CFSTR("CellStationManager: initCellStationManager");
    else
      v4 = CFSTR("CellStationManager: Not initialized");
  }
  else
  {
    *(CellularProductExperimentsManager **)((char *)&self->cellularProductExperimentsManager + 4) = 0;
    v4 = CFSTR("CellStationManager: Not a recent device");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v4);
}

- (void)initLocationController
{
  WRM_LocationControllerIOS *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    v3 = -[WRM_LocationControllerIOS initWithDesiredAccuracy:distanceFilter:]([WRM_LocationControllerIOS alloc], "initWithDesiredAccuracy:distanceFilter:", kCLLocationAccuracyHundredMeters, 100.0);
    *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4) = (WRM_CellStationManagerIOS *)v3;
    if (v3)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100041080;
      v6[3] = &unk_100202018;
      v6[4] = self;
      -[WRM_LocationControllerIOS setClientLocationAuthorized:](v3, "setClientLocationAuthorized:", v6);
      v4 = *(WRM_CellStationManagerIOS **)((char *)&self->cellStationManager + 4);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100041134;
      v5[3] = &unk_100202068;
      v5[4] = self;
      objc_msgSend(v4, "setClientLocationHandler:", v5);
    }
  }
}

- (void)createWrmSdmLocationManager
{
  WRM_LocationControllerIOS *v3;
  WRM_LocationControllerIOS *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isRecentDevice"))
  {
    v3 = [WRM_LocationControllerIOS alloc];
    v4 = -[WRM_LocationControllerIOS initWithDesiredAccuracy:distanceFilter:](v3, "initWithDesiredAccuracy:distanceFilter:", kCLLocationAccuracyLeech, kCLDistanceFilterNone);
    *(_QWORD *)((char *)&self->mLastKnownLocationTimestamp + 4) = v4;
    if (v4)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100041368;
      v7[3] = &unk_100202018;
      v7[4] = self;
      -[WRM_LocationControllerIOS setClientLocationAuthorized:](v4, "setClientLocationAuthorized:", v7);
      v5 = *(void **)((char *)&self->mLastKnownLocationTimestamp + 4);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10000CCC0;
      v6[3] = &unk_100202068;
      v6[4] = self;
      objc_msgSend(v5, "setClientLocationHandler:", v6);
      objc_msgSend(*(id *)((char *)&self->mLastKnownLocationTimestamp + 4), "startMonitoring");
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("wrmSdmLocationController creation failed"));
    }
  }
}

- (void)updateWrmSdmLocationDbInfoRegister:(BOOL)a3 forSim:(int64_t)a4
{
  _QWORD block[6];
  BOOL v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004147C;
  block[3] = &unk_100201D70;
  block[4] = self;
  block[5] = a4;
  v5 = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)fetchWrmSdmLocationDbInfoWithMcc:(unsigned int)a3 Mnc:(unsigned int)a4 CellId:(unint64_t)a5 ForSim:(int64_t)a6
{
  _QWORD v6[7];
  unsigned int v7;
  unsigned int v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100041654;
  v6[3] = &unk_100202040;
  v7 = a3;
  v8 = a4;
  v6[4] = self;
  v6[5] = a5;
  v6[6] = a6;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v6);
}

- (void)triggerLocationUpdate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000417E4;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)triggerHarvestedCellEval
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000190A8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
}

- (void)updateGlobalCellID:(unsigned __int8)a3 gci:(id)a4 cellprefix:(int)a5
{
  _QWORD block[6];
  int v9;

  if ((char *)-[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot") - 1 == (_BYTE *)a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000418EC;
    block[3] = &unk_100202090;
    v9 = a5;
    block[4] = a4;
    block[5] = self;
    dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
  }
}

- (void)queryLocationdDBForHarvestingData:(double)a3 :(double)a4
{
  id v7;
  _QWORD v8[7];

  v7 = objc_msgSend(objc_alloc((Class)sub_100041AF0()), "initWithGEOCoordinate:", a3, a4);
  objc_msgSend(v7, "setHorizontalAccuracy:", 0.0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100041C78;
  v8[3] = &unk_1002020B8;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = a4;
  v8[4] = self;
  objc_msgSend((id)sub_100041BB4(), "fetchDataForLocation:type:responseQueue:responseBlock:", v7, 1, -[WRM_EnhancedCTService queue](self, "queue"), v8);

}

- (void)processVoiceLqmQMI:(unsigned __int8)a3 VLQM:(unsigned __int8)a4 IMSPreference:(BOOL)a5 AudioErasure:(double)a6 RSRP:(double)a7
{
  _QWORD v7[7];
  unsigned __int8 v8;
  unsigned __int8 v9;
  BOOL v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042364;
  v7[3] = &unk_100202100;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  *(double *)&v7[5] = a6;
  *(double *)&v7[6] = a7;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v7);
}

- (id)intializeInterfaceClient:(int64_t)a3
{
  unsigned int v4;
  id v5;
  id v6;

  v4 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isQmiSdmSupported");
  v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton");
  if (v4)
  {
    v6 = objc_msgSend(v5, "getQmiClientForSim:", a3);
    if (v6)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: qmiClient is ready."), "-[WRM_EnhancedCTService intializeInterfaceClient:]");
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: qmiClient not ready yet"), "-[WRM_EnhancedCTService intializeInterfaceClient:]");
  }
  else if (objc_msgSend(v5, "isIbiSdmSupported"))
  {
    v6 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getIbiClient");
    if (v6)
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: ibiClient is ready."), "-[WRM_EnhancedCTService intializeInterfaceClient:]");
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: ibiClient not ready yet"), "-[WRM_EnhancedCTService intializeInterfaceClient:]");
  }
  else
  {
    return 0;
  }
  return v6;
}

- (void)fetchSmartDataModeDataForLocation:(double)a3 :(double)a4 :(unsigned __int16)a5 :(unsigned __int16)a6 :(unint64_t)a7 :(int64_t)a8
{
  uint64_t v10;
  uint64_t v11;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[9];
  __int16 v20;
  __int16 v21;

  v10 = a6;
  v11 = a5;
  v15 = -[WRM_EnhancedCTService intializeInterfaceClient:](self, "intializeInterfaceClient:", a8);
  v16 = objc_opt_class(WRM_QMINasClient);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0
    || (v17 = objc_opt_class(WRM_IceClientDriver), (objc_opt_isKindOfClass(v15, v17) & 1) != 0))
  {
    if (a3 == 0.0 && a4 == 0.0)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("fetchSmartDataModeDataForLocation for sub %d invalid location lat/long, return dB unavailable"), a8);
      objc_msgSend(v15, "sendWrmSdmLocationDbInfo:dbAvailable:mcc:mnc:cellId:", a8, 0, v11, v10, a7);
    }
    else
    {
      v18 = objc_msgSend(objc_alloc((Class)sub_100041AF0()), "initWithGEOCoordinate:", a3, a4);
      objc_msgSend(v18, "setHorizontalAccuracy:", 0.0);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100042740;
      v19[3] = &unk_100202128;
      *(double *)&v19[5] = a3;
      *(double *)&v19[6] = a4;
      v19[4] = v15;
      v20 = v11;
      v21 = v10;
      v19[7] = a8;
      v19[8] = a7;
      objc_msgSend((id)sub_100041BB4(), "fetchSmartDataModeDataForLocation:mcc:mnc:responseQueue:responseBlock:", v18, v11, v10, -[WRM_EnhancedCTService queue](self, "queue"), v19);

    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("%s: Invalid class type for interface client."), "-[WRM_EnhancedCTService fetchSmartDataModeDataForLocation::::::]");
  }
}

- (double)getLastKnownLatitude
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100042B44;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getLastKnownLongitude
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100042C10;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)getLastKnownLocationTimestamp
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100042CDC;
  v4[3] = &unk_100201B90;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)shouldScheduleSpeedTests
{
  _BOOL4 v3;

  v3 = -[WRM_EnhancedCTService ifInternalDevice](self, "ifInternalDevice");
  if (v3)
  {
    v3 = -[WRM_EnhancedCTService ifLimitSpeedTest](self, "ifLimitSpeedTest");
    if (v3)
    {
      if (-[WRM_EnhancedCTService ifAutomatedDeviceGroup](self, "ifAutomatedDeviceGroup"))
        LOBYTE(v3) = 0;
      else
        LOBYTE(v3) = !-[WRM_EnhancedCTService deviceInRoaming](self, "deviceInRoaming");
    }
  }
  return v3;
}

- (void)resetCbrsCAMetricSentOnSimSlot:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100042DAC;
  v3[3] = &unk_100201BB8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), v3);
}

- (void)feedCellularMetricsWithUUID:(id)a3
{
  _DWORD *v5;
  _DWORD *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  const __CFString *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int64_t v23;

  v5 = objc_msgSend(+[WRM_MetricsService getSingleton](WRM_MetricsService, "getSingleton"), "getWRMFaceTimeHandover");
  if (v5)
  {
    v6 = v5;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v23 = -[WRM_EnhancedCTService dataPreferredSlot](self, "dataPreferredSlot");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000430F4;
    block[3] = &unk_100202150;
    block[4] = self;
    block[5] = a3;
    block[6] = &v20;
    dispatch_sync((dispatch_queue_t)-[WRM_EnhancedCTService queue](self, "queue"), block);
    v7 = -[WRM_EnhancedCTService getCTDataIndictor:](self, "getCTDataIndictor:", v21[3]);
    v8 = -[WRM_EnhancedCTService isVoiceLQMValid:](self, "isVoiceLQMValid:", v21[3]);
    if (v8)
      v8 = -[WRM_EnhancedCTService getLteVoiceLQM:](self, "getLteVoiceLQM:", v21[3]);
    v6[31] = v8;
    v9 = -[WRM_EnhancedCTService isDataLQMValid:](self, "isDataLQMValid:", v21[3]);
    if (v9)
      v9 = -[WRM_EnhancedCTService getCellularDataLQM:](self, "getCellularDataLQM:", v21[3]);
    v6[30] = v9;
    v10 = -[WRM_EnhancedCTService dataAttachedWithCellularNetwork:](self, "dataAttachedWithCellularNetwork:", v21[3]);
    if (v10)
      v10 = -[WRM_EnhancedCTService getCurrentSignalBars:](self, "getCurrentSignalBars:", v21[3]);
    v6[28] = v10;
    switch(-[WRM_EnhancedCTService getServingCellType:](self, "getServingCellType:", v21[3]))
    {
      case 1:
        *((_QWORD *)v6 + 13) = CFSTR("LTE");
        -[WRM_EnhancedCTService getServingCellRSRP:](self, "getServingCellRSRP:", v21[3]);
        v6[32] = (int)v11;
        -[WRM_EnhancedCTService getServingCellRSRQ:](self, "getServingCellRSRQ:", v21[3]);
        v6[33] = (int)v12;
        -[WRM_EnhancedCTService getServingCellSNR:](self, "getServingCellSNR:", v21[3]);
        v6[34] = (int)v13;
        *((_BYTE *)v6 + 141) = v7 <= 0x12 && ((1 << v7) & 0x70100) != 0;
        goto LABEL_23;
      case 2:
        *((_QWORD *)v6 + 13) = CFSTR("UMTS");
        -[WRM_EnhancedCTService getServingCellRSCP:](self, "getServingCellRSCP:", v21[3]);
        v6[32] = (int)v15;
        -[WRM_EnhancedCTService getServingCellECIO:](self, "getServingCellECIO:", v21[3]);
        goto LABEL_22;
      case 3:
        v14 = CFSTR("CDMA1X");
        goto LABEL_20;
      case 4:
        v14 = CFSTR("CDMAEVDO");
        goto LABEL_20;
      case 5:
        v14 = CFSTR("CDMAHybrid");
        goto LABEL_20;
      case 6:
        v14 = CFSTR("eHRPD_RADIO");
        goto LABEL_20;
      case 7:
        v14 = CFSTR("TDSCDMA");
        goto LABEL_20;
      case 8:
        v14 = CFSTR("GSM");
        goto LABEL_20;
      case 9:
        *((_QWORD *)v6 + 13) = CFSTR("N_RADIO");
        -[WRM_EnhancedCTService getNrRSRP:](self, "getNrRSRP:", v21[3]);
        v6[32] = (int)v17;
        -[WRM_EnhancedCTService getNrRSRQ:](self, "getNrRSRQ:", v21[3]);
        v6[33] = (int)v18;
        -[WRM_EnhancedCTService getNrSNR:](self, "getNrSNR:", v21[3]);
LABEL_22:
        v6[34] = (int)v16;
        goto LABEL_23;
      default:
        v14 = CFSTR("UNKNOWN");
LABEL_20:
        *((_QWORD *)v6 + 13) = v14;
LABEL_23:
        _Block_object_dispose(&v20, 8);
        break;
    }
  }
}

- (BOOL)CTClientInitDone
{
  return BYTE5(self->mLastCbrsRecommendation);
}

- (void)setCTClientInitDone:(BOOL)a3
{
  BYTE5(self->mLastCbrsRecommendation) = a3;
}

- (BOOL)mSubscriptionInfoDidChange
{
  return BYTE6(self->mLastCbrsRecommendation);
}

- (void)setMSubscriptionInfoDidChange:(BOOL)a3
{
  BYTE6(self->mLastCbrsRecommendation) = a3;
}

- (unint64_t)numberofSubscriptions
{
  return *(int64_t *)((char *)&self->_activeSlot + 4);
}

- (void)setNumberofSubscriptions:(unint64_t)a3
{
  *(int64_t *)((char *)&self->_activeSlot + 4) = a3;
}

- (WRM_CTService)mCTService
{
  return *(WRM_CTService **)((char *)&self->_numberofSubscriptions + 4);
}

- (void)setMCTService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 508);
}

- (CoreTelephonyClient)CTClient
{
  return *(CoreTelephonyClient **)((char *)&self->_mCTService + 4);
}

- (void)setCTClient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 516);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 524);
}

- (OS_dispatch_queue)serverQueue
{
  return *(OS_dispatch_queue **)((char *)&self->_queue + 4);
}

- (void)setServerQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 532);
}

- (OS_dispatch_queue)cellularAvailabilityStatusQueue
{
  return *(OS_dispatch_queue **)((char *)&self->_serverQueue + 4);
}

- (void)setCellularAvailabilityStatusQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 540);
}

- (NSMutableArray)subscriptions
{
  return *(NSMutableArray **)((char *)&self->_cellularAvailabilityStatusQueue + 4);
}

- (void)setSubscriptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 548);
}

- (void)setDataPreferredSlot:(int64_t)a3
{
  *(NSMutableArray **)((char *)&self->_subscriptions + 4) = (NSMutableArray *)a3;
}

- (void)setIsDataAttached:(id)a3
{
  *(int64_t *)((char *)&self->_dataPreferredSlot + 4) = (int64_t)a3;
}

- (void)setIsDataEnabled:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isDataAttached + 4) = (NSMutableArray *)a3;
}

- (void)setIsDeviceRegistered:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isDataEnabled + 4) = (NSMutableArray *)a3;
}

- (void)setIsWiFiCallingSupported:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isDeviceRegistered + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)isPrivateNetworkSim
{
  return *(NSMutableArray **)((char *)&self->_isWiFiCallingSupported + 4);
}

- (void)setIsPrivateNetworkSim:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isWiFiCallingSupported + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)isPrivateNetworkPreferredOverWifi
{
  return *(NSMutableArray **)((char *)&self->_isPrivateNetworkSim + 4);
}

- (void)setIsPrivateNetworkPreferredOverWifi:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isPrivateNetworkSim + 4) = (NSMutableArray *)a3;
}

- (void)setIsVolteSupported:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isPrivateNetworkPreferredOverWifi + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)isRoaming
{
  return *(NSMutableArray **)((char *)&self->_isVolteSupported + 4);
}

- (void)setIsRoaming:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isVolteSupported + 4) = (NSMutableArray *)a3;
}

- (void)setIsFR2Radio:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isRoaming + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)radioCoverage
{
  return *(NSMutableArray **)((char *)&self->_isFR2Radio + 4);
}

- (void)setRadioCoverage:(id)a3
{
  *(NSMutableArray **)((char *)&self->_isFR2Radio + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)radioFrequency
{
  return *(NSMutableArray **)((char *)&self->_radioCoverage + 4);
}

- (void)setRadioFrequency:(id)a3
{
  *(NSMutableArray **)((char *)&self->_radioCoverage + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)dataEnabled
{
  return *(NSMutableArray **)((char *)&self->_radioFrequency + 4);
}

- (void)setDataEnabled:(id)a3
{
  *(NSMutableArray **)((char *)&self->_radioFrequency + 4) = (NSMutableArray *)a3;
}

- (void)setBars:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataEnabled + 4) = (NSMutableArray *)a3;
}

- (void)setMovingAverageSignalBars:(id)a3
{
  *(NSMutableArray **)((char *)&self->_bars + 4) = (NSMutableArray *)a3;
}

- (void)setServCellRadioTechnologyType:(id)a3
{
  *(NSMutableArray **)((char *)&self->_movingAverageSignalBars + 4) = (NSMutableArray *)a3;
}

- (void)setVoiceLqmValue:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRadioTechnologyType + 4) = (NSMutableArray *)a3;
}

- (void)setVoiceLqmIsValid:(id)a3
{
  *(NSMutableArray **)((char *)&self->_VoiceLqmValue + 4) = (NSMutableArray *)a3;
}

- (void)setDataLqmValue:(id)a3
{
  *(NSMutableArray **)((char *)&self->_VoiceLqmIsValid + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)DataLqmIsValid
{
  return *(NSMutableArray **)((char *)&self->_DataLqmValue + 4);
}

- (void)setDataLqmIsValid:(id)a3
{
  *(NSMutableArray **)((char *)&self->_DataLqmValue + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)VoiceLqmReasonCode
{
  return *(NSMutableArray **)((char *)&self->_DataLqmIsValid + 4);
}

- (void)setVoiceLqmReasonCode:(id)a3
{
  *(NSMutableArray **)((char *)&self->_DataLqmIsValid + 4) = (NSMutableArray *)a3;
}

- (void)setImsVoiceOverPSSupported:(id)a3
{
  *(NSMutableArray **)((char *)&self->_VoiceLqmReasonCode + 4) = (NSMutableArray *)a3;
}

- (void)setServCellRSRP:(id)a3
{
  *(NSMutableArray **)((char *)&self->_imsVoiceOverPSSupported + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellRSSI
{
  return *(NSMutableArray **)((char *)&self->_servCellRSRP + 4);
}

- (void)setServCellRSSI:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSRP + 4) = (NSMutableArray *)a3;
}

- (void)setServCellRSRQ:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSSI + 4) = (NSMutableArray *)a3;
}

- (void)setServCellSNR:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSRQ + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellSINR
{
  return *(NSMutableArray **)((char *)&self->_servCellSNR + 4);
}

- (void)setServCellSINR:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellSNR + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellRSCP
{
  return *(NSMutableArray **)((char *)&self->_servCellSINR + 4);
}

- (void)setServCellRSCP:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellSINR + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)servCellECIO
{
  return *(NSMutableArray **)((char *)&self->_servCellRSCP + 4);
}

- (void)setServCellECIO:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellRSCP + 4) = (NSMutableArray *)a3;
}

- (void)setPrevAudioQualityWasGood:(id)a3
{
  *(NSMutableArray **)((char *)&self->_servCellECIO + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)PrevAudioErasurePercent
{
  return *(NSMutableArray **)((char *)&self->_PrevAudioQualityWasGood + 4);
}

- (void)setPrevAudioErasurePercent:(id)a3
{
  *(NSMutableArray **)((char *)&self->_PrevAudioQualityWasGood + 4) = (NSMutableArray *)a3;
}

- (void)setLoads:(id)a3
{
  *(NSMutableArray **)((char *)&self->_PrevAudioErasurePercent + 4) = (NSMutableArray *)a3;
}

- (void)setRrcState:(id)a3
{
  *(NSMutableArray **)((char *)&self->_loads + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)mcc
{
  return *(NSMutableArray **)((char *)&self->_rrcState + 4);
}

- (void)setMcc:(id)a3
{
  *(NSMutableArray **)((char *)&self->_rrcState + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)mnc
{
  return *(NSMutableArray **)((char *)&self->_mcc + 4);
}

- (void)setMnc:(id)a3
{
  *(NSMutableArray **)((char *)&self->_mcc + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)nrCellRSRP
{
  return *(NSMutableArray **)((char *)&self->_mnc + 4);
}

- (void)setNrCellRSRP:(id)a3
{
  *(NSMutableArray **)((char *)&self->_mnc + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)nrCellRSRQ
{
  return *(NSMutableArray **)((char *)&self->_nrCellRSRP + 4);
}

- (void)setNrCellRSRQ:(id)a3
{
  *(NSMutableArray **)((char *)&self->_nrCellRSRP + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)nrCellSNR
{
  return *(NSMutableArray **)((char *)&self->_nrCellRSRQ + 4);
}

- (void)setNrCellSNR:(id)a3
{
  *(NSMutableArray **)((char *)&self->_nrCellRSRQ + 4) = (NSMutableArray *)a3;
}

- (void)setDataIndicator:(id)a3
{
  *(NSMutableArray **)((char *)&self->_nrCellSNR + 4) = (NSMutableArray *)a3;
}

- (void)setDataBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataIndicator + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)locDbRequired
{
  return *(NSMutableArray **)((char *)&self->_dataBW + 4);
}

- (void)setLocDbRequired:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataBW + 4) = (NSMutableArray *)a3;
}

- (void)setCellARFCN:(id)a3
{
  *(NSMutableArray **)((char *)&self->_locDbRequired + 4) = (NSMutableArray *)a3;
}

- (void)setCellBandInfo:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellARFCN + 4) = (NSMutableArray *)a3;
}

- (void)setCellBandwidth:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellBandInfo + 4) = (NSMutableArray *)a3;
}

- (void)setCurrNRCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellBandwidth + 4) = (NSMutableArray *)a3;
}

- (void)setWifiNRCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currNRCellFound + 4) = (NSMutableArray *)a3;
}

- (void)setCellID:(id)a3
{
  *(NSMutableArray **)((char *)&self->_wifiNRCellFound + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)currCBRSCellFound
{
  return *(NSMutableArray **)((char *)&self->_cellID + 4);
}

- (void)setCurrCBRSCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cellID + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)wifiCBRSCellFound
{
  return *(NSMutableArray **)((char *)&self->_currCBRSCellFound + 4);
}

- (void)setWifiCBRSCellFound:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currCBRSCellFound + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)cbrsCoreAnalyticsMetricsSent
{
  return *(NSMutableArray **)((char *)&self->_wifiCBRSCellFound + 4);
}

- (void)setCbrsCoreAnalyticsMetricsSent:(id)a3
{
  *(NSMutableArray **)((char *)&self->_wifiCBRSCellFound + 4) = (NSMutableArray *)a3;
}

- (BOOL)dataPreferredSlotOnCBRS
{
  return HIBYTE(self->mLastCbrsRecommendation);
}

- (void)setDataPreferredSlotOnCBRS:(BOOL)a3
{
  HIBYTE(self->mLastCbrsRecommendation) = a3;
}

- (void)setDetectedFR1CellCountLocDB:(id)a3
{
  *(NSMutableArray **)((char *)&self->_cbrsCoreAnalyticsMetricsSent + 4) = (NSMutableArray *)a3;
}

- (void)setDetectedFR1CellBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_detectedFR1CellCountLocDB + 4) = (NSMutableArray *)a3;
}

- (void)setDetectedFR2CellCountLocDB:(id)a3
{
  *(NSMutableArray **)((char *)&self->_detectedFR1CellBW + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)configuredMaxDLBW
{
  return *(NSMutableArray **)((char *)&self->_detectedFR2CellCountLocDB + 4);
}

- (void)setConfiguredMaxDLBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_detectedFR2CellCountLocDB + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)configuredMaxULBW
{
  return *(NSMutableArray **)((char *)&self->_configuredMaxDLBW + 4);
}

- (void)setConfiguredMaxULBW:(id)a3
{
  *(NSMutableArray **)((char *)&self->_configuredMaxDLBW + 4) = (NSMutableArray *)a3;
}

- (void)setEstimatedBWDL:(id)a3
{
  *(NSMutableArray **)((char *)&self->_configuredMaxULBW + 4) = (NSMutableArray *)a3;
}

- (void)setEstimatedBWDLConf:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWDL + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)estimatedBWUL
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWDLConf + 4);
}

- (void)setEstimatedBWUL:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWDLConf + 4) = (NSMutableArray *)a3;
}

- (NSMutableArray)estimatedBWULConf
{
  return *(NSMutableArray **)((char *)&self->_estimatedBWUL + 4);
}

- (void)setEstimatedBWULConf:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWUL + 4) = (NSMutableArray *)a3;
}

- (void)setNeighberCellType:(id)a3
{
  *(NSMutableArray **)((char *)&self->_estimatedBWULConf + 4) = (NSMutableArray *)a3;
}

- (void)setHighDataRateObserved:(id)a3
{
  *(NSMutableArray **)((char *)&self->_neighberCellType + 4) = (NSMutableArray *)a3;
}

- (void)setCurrentNRCellType:(id)a3
{
  *(NSMutableArray **)((char *)&self->_highDataRateObserved + 4) = (NSMutableArray *)a3;
}

- (void)setCurrentHarvestedCellTypeFR2Capable:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currentNRCellType + 4) = (NSMutableArray *)a3;
}

- (void)setStallDetected:(id)a3
{
  *(NSMutableArray **)((char *)&self->_currentHarvestedCellTypeFR2Capable + 4) = (NSMutableArray *)a3;
}

- (void)setDataModeLTE:(id)a3
{
  *(NSMutableArray **)((char *)&self->_stallDetected + 4) = (NSMutableArray *)a3;
}

- (void)setIsExpensive:(id)a3
{
  *(NSMutableArray **)((char *)&self->_dataModeLTE + 4) = (NSMutableArray *)a3;
}

@end
