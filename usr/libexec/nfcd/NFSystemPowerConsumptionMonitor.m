@implementation NFSystemPowerConsumptionMonitor

- (NFSystemPowerConsumptionMonitor)init
{
  NFSystemPowerConsumptionMonitor *v2;
  NFSystemPowerConsumptionMonitor *v3;
  NSMutableArray *v4;
  NSMutableArray *delegates;
  void *specific;
  void (*Logger)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v9;
  const char *ClassName;
  const char *Name;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  PPMClient *ppmSharedInstance;
  PPMClient *v22;
  NFSystemPowerConsumptionMonitor *v23;
  objc_super v25;
  id v26;
  id location;
  uint8_t buf[8];
  _BYTE v29[26];

  v25.receiver = self;
  v25.super_class = (Class)NFSystemPowerConsumptionMonitor;
  v2 = -[NFSystemPowerConsumptionMonitor init](&v25, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_readerStarted = 0;
    v4 = objc_opt_new(NSMutableArray);
    delegates = v3->_delegates;
    v3->_delegates = v4;

    if ((sub_10019A5A8(v3) & 1) == 0)
    {
      objc_initWeak(&location, v3);
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger(specific);
      if (Logger)
      {
        Class = object_getClass(v3);
        if (class_isMetaClass(Class))
          v9 = 43;
        else
          v9 = 45;
        ClassName = object_getClassName(v3);
        Name = sel_getName("initCoreDuet");
        Logger(6, "%c[%{public}s %{public}s]:%i Using CoreDuet", v9, ClassName, Name, 408);
      }
      v12 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v13 = NFSharedLogGetLogger(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = object_getClass(v3);
        if (class_isMetaClass(v15))
          v16 = 43;
        else
          v16 = 45;
        v17 = object_getClassName(v3);
        v18 = sel_getName("initCoreDuet");
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v16;
        *(_WORD *)v29 = 2082;
        *(_QWORD *)&v29[2] = v17;
        *(_WORD *)&v29[10] = 2082;
        *(_QWORD *)&v29[12] = v18;
        *(_WORD *)&v29[20] = 1024;
        *(_DWORD *)&v29[22] = 408;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using CoreDuet", buf, 0x22u);
      }

      v26 = 0;
      v19 = objc_claimAutoreleasedReturnValue(+[PPMClient sharedInstanceWithClientRepresentation:error:](PPMClient, "sharedInstanceWithClientRepresentation:error:", CFSTR("com.apple.duet.ppm-attr.stck"), &v26));
      v20 = v26;
      ppmSharedInstance = v3->_ppmSharedInstance;
      v3->_ppmSharedInstance = (PPMClient *)v19;

      v22 = v3->_ppmSharedInstance;
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)v29 = 3221225472;
      *(_QWORD *)&v29[8] = sub_10019A120;
      *(_QWORD *)&v29[16] = &unk_1002EA510;
      objc_copyWeak((id *)&v29[24], &location);
      -[PPMClient registerForNotificationsWithError:handler:](v22, "registerForNotificationsWithError:handler:", 0, buf);
      objc_destroyWeak((id *)&v29[24]);
      objc_destroyWeak(&location);

    }
  }
  v23 = v3;

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalDelegateQueue, 0);
  objc_destroyWeak((id *)&self->_thermalDelegate);
  objc_storeStrong((id *)&self->_maxApprovedBudget, 0);
  objc_storeStrong((id *)&self->_currentThermalBudget, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_powerConsumer, 0);
  objc_storeStrong((id *)&self->_cpmsdescription, 0);
  objc_storeStrong((id *)&self->_ppmSharedInstance, 0);
}

@end
