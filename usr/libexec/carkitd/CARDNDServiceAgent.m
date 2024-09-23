@implementation CARDNDServiceAgent

- (CARDNDServiceAgent)initWithVehicleStore:(id)a3
{
  id v5;
  CARDNDServiceAgent *v6;
  CARDNDServiceAgent *v7;
  CARAutomaticDNDStatus *v8;
  CARAutomaticDNDStatus *status;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CARDNDServiceAgent;
  v6 = -[CARDNDServiceAgent init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vehicleStore, a3);
    v8 = (CARAutomaticDNDStatus *)objc_alloc_init((Class)CARAutomaticDNDStatus);
    status = v7->_status;
    v7->_status = v8;

    -[CARAutomaticDNDStatus _detachObservers](v7->_status, "_detachObservers");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)sub_100043C8C, CARAutomaticDNDCarPlayActivationChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v7;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)CARDNDServiceAgent;
  -[CARDNDServiceAgent dealloc](&v4, "dealloc");
}

+ (id)_DNDServiceInterface
{
  if (qword_1000DB890 != -1)
    dispatch_once(&qword_1000DB890, &stru_1000B6B70);
  return (id)qword_1000DB888;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carkit.app")));
  if (objc_msgSend(v6, "BOOLValue"))
  {

LABEL_4:
    v11 = CarDNDWDLogging(v7, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "processIdentifier")));
      v21 = 138412802;
      v22 = v5;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Receiving connection %@ to service %@ from %@", (uint8_t *)&v21, 0x20u);

    }
    v15 = objc_msgSend((id)objc_opt_class(self), "_DNDServiceInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v5, "setExportedInterface:", v16);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
    v17 = 1;
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.carkit.dnd")));
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) != 0)
    goto LABEL_4;
  v18 = CarDNDWDLogging(v7, v8);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    sub_10006DD78(v5, v19);

  v17 = 0;
LABEL_10:

  return v17;
}

- (void)isCarPlayAutomaticDNDActiveWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
  (*((void (**)(id, id))a3 + 2))(v4, objc_msgSend(v5, "isDNDValid"));

}

- (void)setCarPlayAutomaticDNDActive:(BOOL)a3 withReply:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[8];
  id location;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
  objc_initWeak(&location, v6);

  if (v4)
  {
    v9 = CarDNDWDLogging(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Engaging Driving from external activation.";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }
  }
  else
  {
    v12 = CarDNDWDLogging(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Disabling Driving from external activation.";
      goto LABEL_6;
    }
  }

  v13 = objc_loadWeakRetained(&location);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "CARDNDQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044180;
  block[3] = &unk_1000B6B98;
  v19 = v4;
  objc_copyWeak(&v18, &location);
  v17 = v5;
  v15 = v5;
  dispatch_async(v14, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)resetAutomaticDNDPreferencesWithReply:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  _QWORD v6[5];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100044440;
  v6[3] = &unk_1000B51B8;
  v6[4] = self;
  objc_msgSend(v5, "_performCARPreferencesBlock:forReading:", v6, 0);

  if (v4)
    v4[2](v4, 1, 0);

}

- (void)shouldDisplayExitConfirmationWithReply:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD v11[2];

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
  if (objc_msgSend(v4, "isDNDValid"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
    v6 = objc_msgSend(v5, "isCurrentlyInGeofencedRegion") ^ 1;

  }
  else
  {
    v6 = 0;
  }

  v9 = CarDNDWDLogging(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Should Display Exit Confirmation: %d", (uint8_t *)v11, 8u);
  }

  if (v3)
    v3[2](v3, v6, 0);

}

- (void)fetchDNDTriggerModeWithReply:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
    (*((void (**)(id, id, _QWORD))a3 + 2))(v5, objc_msgSend(v6, "automaticDNDTriggeringMethod"), 0);

  }
}

- (void)_triggerModeChanged:(unint64_t)a3 mechanism:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
  v8 = (unint64_t)objc_msgSend(v7, "automaticDNDTriggeringMethod");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
  objc_msgSend(v9, "mostRecentTriggerMethodChange");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
  if (objc_msgSend(v12, "hasAdjustedTriggerMethod"))
  {
    if (v8 > 2)
      v13 = CFSTR("Unknown");
    else
      v13 = off_1000B6C20[v8];
  }
  else
  {
    v13 = CFSTR("New");
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
  objc_msgSend(v14, "setHasAdjustedTriggerMethod:", 1);

  v17 = (id)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
  if (a3 > 2)
    v15 = CFSTR("Unknown");
  else
    v15 = off_1000B6C20[a3];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
  objc_msgSend(v17, "userChangedFromTriggerMethod:toMethod:withMechanism:fromPreviousInterval:activateWithCarPlay:", v13, v15, v6, objc_msgSend(v16, "shouldActivateWithCarPlay"), v11);

}

- (void)setDNDTriggerMode:(unint64_t)a3 withReply:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
  v7 = objc_msgSend(v6, "automaticDNDTriggeringMethod");

  if (v7 != (id)a3)
  {
    -[CARDNDServiceAgent _triggerModeChanged:mechanism:](self, "_triggerModeChanged:mechanism:", a3, CFSTR("Settings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDServiceAgent status](self, "status"));
    objc_msgSend(v8, "setAutomaticDNDTriggeringMethod:", a3);

    if (a3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
      objc_msgSend(v9, "_checkVehicleState");

    }
  }
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
    v10 = v11;
  }

}

- (void)allowedAutoReplyAudienceWithReply:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  void (**v5)(id, uint64_t, _QWORD);
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = (const __CFString *)CARDNDAutoReplyAudience;
  v4 = (const __CFString *)CRPreferencesAutomaticDNDDomain;
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  v6 = (id)CFPreferencesCopyAppValue(v3, v4);
  v8 = v6;
  if (v6)
  {
    v6 = objc_msgSend(v6, "unsignedIntegerValue");
    v9 = (uint64_t)v6;
  }
  else
  {
    v9 = 4;
  }
  v10 = CarDNDWDLogging(v6, v7);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updated auto-reply audience to %@", (uint8_t *)&v13, 0xCu);

  }
  v5[2](v5, v9, 0);

}

- (void)setAllowedAutoReplyAudience:(unint64_t)a3 reply:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  unint64_t v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044A5C;
  v7[3] = &unk_1000B6BC0;
  v8 = a4;
  v9 = a3;
  v6 = v8;
  -[CARDNDServiceAgent allowedAutoReplyAudienceWithReply:](self, "allowedAutoReplyAudienceWithReply:", v7);

}

- (void)autoReplyMessageWithReply:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(id, void *, _QWORD);

  v9 = (void (**)(id, void *, _QWORD))a3;
  v3 = (void *)CFPreferencesCopyAppValue(CARDNDAutoReplyMessage, CRPreferencesAutomaticDNDDomain);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4));

  if (!objc_msgSend(v5, "length"))
  {
    v7 = CRLocalizedStringForKey(CFSTR("DND_AUTO_REPLY_DEFAULT_MESSAGE"), v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v5 = (void *)v8;
  }
  v9[2](v9, v5, 0);

}

- (void)setAutoReplyMessage:(id)a3 reply:(id)a4
{
  const __CFString *v6;
  const __CFString *v7;
  void (**v8)(id, uint64_t, _QWORD);

  v6 = (const __CFString *)CARDNDAutoReplyMessage;
  v7 = (const __CFString *)CRPreferencesAutomaticDNDDomain;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  CFPreferencesSetAppValue(v6, a3, v7);
  -[CARDNDServiceAgent allowedAutoReplyAudienceWithReply:](self, "allowedAutoReplyAudienceWithReply:", &stru_1000B6C00);
  v8[2](v8, 1, 0);

}

- (void)disableDNDUntilEndOfDriveWithContext:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDManager sharedManager](CARDNDManager, "sharedManager"));
  v8 = objc_msgSend(v7, "isDNDValid");
  v9 = (int)v8;
  v11 = CarDNDWDLogging(v8, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Disabling Driving until end of drive.", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    if (objc_msgSend(v7, "isCurrentlyInGeofencedRegion"))
      v15 = 1;
    else
      v15 = 4;
    objc_msgSend(v14, "DNDEndedWithTrigger:vehicleHints:context:", v15, objc_msgSend(v7, "lastKnownVehicularHints"), v5);

    objc_msgSend(v7, "_disableDNDUntilEndOfDrive");
    if (!v6)
      goto LABEL_13;
LABEL_12:
    v6[2](v6, 1, 0);
    goto LABEL_13;
  }
  if (v13)
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring disable Driving until end of drive - Driving was not valid.", v16, 2u);
  }

  if (v6)
    goto LABEL_12;
LABEL_13:

}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleStore, a3);
}

- (CARAutomaticDNDStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
}

@end
