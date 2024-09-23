@implementation CLGatheringSettings

- (CLGatheringSettings)initWithUniverse:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLGatheringSettings;
  if (-[CLGatheringSettings init](&v4, "init"))
    operator new();
  objc_msgSend(0, "_setupSettings");
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[CLGatheringSettings setOtaSettings:](self, "setOtaSettings:", 0);
  -[CLGatheringSettings unregisterForOTASettingsNotification](self, "unregisterForOTASettingsNotification");
  v3.receiver = self;
  v3.super_class = (Class)CLGatheringSettings;
  -[CLGatheringSettings dealloc](&v3, "dealloc");
}

- (void)registerForOTASettingsNotification
{
  sub_100E69FE4((uint64_t)self->_settingsSubscription.__ptr_.__value_);
}

- (void)unregisterForOTASettingsNotification
{
  sub_100E6A24C(self->_settingsSubscription.__ptr_.__value_);
}

- (void)onUpdatedSettings:(id)a3
{
  NSObject *v5;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  const char *v10;
  char *v11;
  int v12;
  id v13;
  _OWORD buf[102];

  if (qword_1022A0150 != -1)
    dispatch_once(&qword_1022A0150, &stru_10213EEC8);
  v5 = qword_1022A0158;
  if (os_log_type_enabled((os_log_t)qword_1022A0158, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 138477827;
    *(_QWORD *)((char *)buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLGatheringSettings Received OTA settings %{private}@", (uint8_t *)buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0150 != -1)
      dispatch_once(&qword_1022A0150, &stru_10213EEC8);
    v12 = 138477827;
    v13 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0158, 1, "CLGatheringSettings Received OTA settings %{private}@", &v12, 12);
    v11 = (char *)v10;
    sub_100512490("Generic", 1, 0, 2, "-[CLGatheringSettings onUpdatedSettings:]", "%s\n", v10);
    if (v11 != (char *)buf)
      free(v11);
  }
  -[CLGatheringSettings setOtaSettings:](self, "setOtaSettings:", a3);
  if (-[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", CFSTR("ADPD")))
  {
    v6 = -[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", CFSTR("ADPD"));
    if (objc_msgSend(v6, "objectForKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CLGatheringScanForceScreenOffOnly")))
    {
      LOBYTE(v12) = objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CLGatheringScanForceScreenOffOnly")), "BOOLValue");
      sub_1001E4804(buf);
      sub_10011B47C(*(uint64_t *)&buf[0], "CLGatheringScanForceScreenOffOnly", &v12);
      v7 = (std::__shared_weak_count *)*((_QWORD *)&buf[0] + 1);
      if (*((_QWORD *)&buf[0] + 1))
      {
        v8 = (unint64_t *)(*((_QWORD *)&buf[0] + 1) + 8);
        do
          v9 = __ldaxr(v8);
        while (__stlxr(v9 - 1, v8));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
    }
  }
}

- (void)_setupSettings
{
  char v3;
  BOOL v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  char v8;
  BOOL v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  int64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  int v18;
  int64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  int64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  int v28;
  int64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  char v33;
  BOOL v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  char v38;
  BOOL v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  int v43;
  int64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  int v48;
  int64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  char v53;
  BOOL v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  int v58;
  int64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  int v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  int64_t v69;

  sub_1001E4804(&v67);
  LOBYTE(v69) = 0;
  v3 = sub_1001E4874(v67, "CLGatheringScanEnabled", (BOOL *)&v69);
  if ((_BYTE)v69)
    v4 = v3;
  else
    v4 = 0;
  self->_scanEnabled = v4;
  v5 = v68;
  if (v68)
  {
    p_shared_owners = (unint64_t *)&v68->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  sub_1001E4804(&v67);
  LOBYTE(v69) = 0;
  v8 = sub_1001E4874(v67, "CLGatheringScanForceNoAopPolicy", (BOOL *)&v69);
  if ((_BYTE)v69)
    v9 = v8;
  else
    v9 = 0;
  self->_scanForceNoAopPolicy = v9;
  v10 = v68;
  if (v68)
  {
    v11 = (unint64_t *)&v68->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  self->_scanForceScreenOffOnly = -[CLGatheringSettings evalScanForceScreenOffOnly](self, "evalScanForceScreenOffOnly");
  sub_1001E4804(&v67);
  v69 = 0;
  v13 = sub_10052655C(v67, "CLGatheringScanDutyCyle", &v69);
  v15 = v68;
  v14 = v69;
  if (!v13)
    v14 = 35;
  self->_scanDutyCycle = v14;
  if (v15)
  {
    v16 = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  sub_1001E4804(&v67);
  v69 = 0;
  v18 = sub_10052655C(v67, "CLGatheringScanBackgroundDutyCyle", &v69);
  v20 = v68;
  v19 = v69;
  if (!v18)
    v19 = 20;
  self->_scanAonDutyCycle = v19;
  if (v20)
  {
    v21 = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  sub_1001E4804(&v67);
  v69 = 0;
  v23 = sub_10052655C(v67, "CLGatheringScanBackoffTimeout", &v69);
  v25 = v68;
  v24 = v69;
  if (!v23)
    v24 = 15;
  self->_scanBackoffTimeout = v24;
  if (v25)
  {
    v26 = (unint64_t *)&v25->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  sub_1001E4804(&v67);
  v69 = 0;
  v28 = sub_10052655C(v67, "CLGatheringScanPeriodicInterval", &v69);
  v30 = v68;
  v29 = v69;
  if (!v28)
    v29 = 360;
  self->_scanPeriodicInterval = v29;
  if (v30)
  {
    v31 = (unint64_t *)&v30->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  sub_1001E4804(&v67);
  LOBYTE(v69) = 0;
  v33 = sub_1001E4874(v67, "CLGatheringScanWithDuplicates", (BOOL *)&v69);
  if ((_BYTE)v69)
    v34 = v33;
  else
    v34 = 0;
  self->_scanWithDuplicates = v34;
  v35 = v68;
  if (v68)
  {
    v36 = (unint64_t *)&v68->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  sub_1001E4804(&v67);
  LOBYTE(v69) = 0;
  v38 = sub_1001E4874(v67, "CLGatheringAdvertiseEnabled", (BOOL *)&v69);
  if ((_BYTE)v69)
    v39 = v38;
  else
    v39 = 0;
  self->_advertiseEnabled = v39;
  v40 = v68;
  if (v68)
  {
    v41 = (unint64_t *)&v68->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  sub_1001E4804(&v67);
  v69 = 0;
  v43 = sub_10052655C(v67, "CLGatheringAdvertisePeriod", &v69);
  v45 = v68;
  v44 = v69;
  if (!v43)
    v44 = 10;
  self->_advertisePeriod = v44;
  if (v45)
  {
    v46 = (unint64_t *)&v45->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  sub_1001E4804(&v67);
  v69 = 0;
  v48 = sub_10052655C(v67, "CLGatheringLoggingVolatileMaxAge", &v69);
  v50 = v68;
  v49 = v69;
  if (!v48)
    v49 = 1800;
  self->_loggingVolatileMaxAge = v49;
  if (v50)
  {
    v51 = (unint64_t *)&v50->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  sub_1001E4804(&v67);
  LOBYTE(v69) = 0;
  v53 = sub_1001E4874(v67, "CLGatheringLoggingPersistentEnabled", (BOOL *)&v69);
  if ((_BYTE)v69)
    v54 = v53;
  else
    v54 = 0;
  self->_loggingPersistentEnabled = v54;
  v55 = v68;
  if (v68)
  {
    v56 = (unint64_t *)&v68->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  sub_1001E4804(&v67);
  v69 = 0;
  v58 = sub_10052655C(v67, "CLGatheringLoggingPersistentMaxAge", &v69);
  v60 = v68;
  v59 = v69;
  if (!v58)
    v59 = 604800;
  self->_loggingPersistentMaxAge = v59;
  if (v60)
  {
    v61 = (unint64_t *)&v60->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  sub_1001E4804(&v67);
  LOBYTE(v69) = 0;
  v63 = sub_1001E4874(v67, "CLGatheringLoggingPersistentInTempFolder", (BOOL *)&v69) ^ 1;
  if ((_BYTE)v69)
    LOBYTE(v63) = 1;
  self->_loggingPersistentInTempFolder = v63;
  v64 = v68;
  if (v68)
  {
    v65 = (unint64_t *)&v68->__shared_owners_;
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 - 1, v65));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }
}

- (BOOL)getSettings:(id)a3 fallback:(BOOL)a4
{
  int v7;
  int v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  id v12;
  uint64_t v14;
  std::__shared_weak_count *v15;
  BOOL v16;

  v16 = 0;
  sub_1001E4804(&v14);
  v7 = sub_1001E4874(v14, (const char *)objc_msgSend(a3, "cStringUsingEncoding:", 1), &v16);
  v8 = v7;
  v9 = v15;
  if (!v15)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    if (v8)
      return v16;
  }
  else
  {
LABEL_5:
    if (v7)
      return v16;
  }
  if (-[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", CFSTR("ADPD")))
  {
    v12 = -[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", CFSTR("ADPD"));
    if (objc_msgSend(v12, "objectForKeyedSubscript:", a3))
      return objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", a3), "BOOLValue");
  }
  return a4;
}

- (BOOL)evalScanForceScreenOffOnly
{
  return -[CLGatheringSettings getSettings:fallback:](self, "getSettings:fallback:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CLGatheringScanForceScreenOffOnly"), 0);
}

- (void)overrideWithConfiguration:(id)a3
{
  int var1;
  char v5;
  char v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  int v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  int v14;
  int64_t v15;
  unint64_t *v16;
  char v17;
  char v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  int v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  int v26;
  int64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  int v31;
  int64_t v32;
  unint64_t *v33;
  int v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  int v38;
  int64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  int v43;
  int64_t v44;
  unint64_t *v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  int64_t v48;

  var1 = a3.var1;
  if (a3.var0 != 1)
  {
    if (a3.var0)
      goto LABEL_24;
    sub_1001E4804(&v46);
    LOBYTE(v48) = 0;
    v5 = sub_1001E4874(v46, "CLGatheringAdvertiseEnabled", (BOOL *)&v48);
    v6 = (_BYTE)v48 ? v5 : 0;
    self->_advertiseEnabled = v6;
    v7 = v47;
    if (!v47)
      goto LABEL_24;
    p_shared_owners = (unint64_t *)&v47->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    goto LABEL_22;
  }
  sub_1001E4804(&v46);
  LOBYTE(v48) = 0;
  v10 = sub_1001E4874(v46, "CLGatheringAdvertiseEnabled", (BOOL *)&v48) ^ 1;
  if ((_BYTE)v48)
    LOBYTE(v10) = 1;
  self->_advertiseEnabled = v10;
  v11 = v47;
  if (v47)
  {
    v12 = (unint64_t *)&v47->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  sub_1001E4804(&v46);
  v48 = 0;
  v14 = sub_10052655C(v46, "CLGatheringAdvertisePeriod", &v48);
  v7 = v47;
  v15 = v48;
  if (!v14)
    v15 = 10;
  self->_advertisePeriod = v15;
  if (v7)
  {
    v16 = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(v16);
    while (__stlxr(v9 - 1, v16));
LABEL_22:
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_24:
  switch(var1)
  {
    case 2:
      sub_1001E4804(&v46);
      LOBYTE(v48) = 0;
      v22 = sub_1001E4874(v46, "CLGatheringScanEnabled", (BOOL *)&v48) ^ 1;
      if ((_BYTE)v48)
        LOBYTE(v22) = 1;
      self->_scanEnabled = v22;
      v23 = v47;
      if (v47)
      {
        v24 = (unint64_t *)&v47->__shared_owners_;
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      sub_1001E4804(&v46);
      v48 = 0;
      v26 = sub_10052655C(v46, "CLGatheringScanBackgroundDutyCyle", &v48);
      v28 = v47;
      v27 = v48;
      if (!v26)
        v27 = 10;
      self->_scanAonDutyCycle = v27;
      if (v28)
      {
        v29 = (unint64_t *)&v28->__shared_owners_;
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
        {
          ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
          std::__shared_weak_count::__release_weak(v28);
        }
      }
      sub_1001E4804(&v46);
      v48 = 0;
      v31 = sub_10052655C(v46, "CLGatheringScanDutyCyle", &v48);
      v32 = v48;
      if (!v31)
        v32 = 30;
      self->_scanDutyCycle = v32;
      v19 = v47;
      if (v47)
      {
        v33 = (unint64_t *)&v47->__shared_owners_;
        do
          v21 = __ldaxr(v33);
        while (__stlxr(v21 - 1, v33));
        goto LABEL_73;
      }
      break;
    case 1:
      sub_1001E4804(&v46);
      LOBYTE(v48) = 0;
      v34 = sub_1001E4874(v46, "CLGatheringScanEnabled", (BOOL *)&v48) ^ 1;
      if ((_BYTE)v48)
        LOBYTE(v34) = 1;
      self->_scanEnabled = v34;
      v35 = v47;
      if (v47)
      {
        v36 = (unint64_t *)&v47->__shared_owners_;
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      sub_1001E4804(&v46);
      v48 = 0;
      v38 = sub_10052655C(v46, "CLGatheringScanBackgroundDutyCyle", &v48);
      v40 = v47;
      v39 = v48;
      if (!v38)
        v39 = 20;
      self->_scanAonDutyCycle = v39;
      if (v40)
      {
        v41 = (unint64_t *)&v40->__shared_owners_;
        do
          v42 = __ldaxr(v41);
        while (__stlxr(v42 - 1, v41));
        if (!v42)
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      sub_1001E4804(&v46);
      v48 = 0;
      v43 = sub_10052655C(v46, "CLGatheringScanDutyCyle", &v48);
      v44 = v48;
      if (!v43)
        v44 = 35;
      self->_scanDutyCycle = v44;
      v19 = v47;
      if (v47)
      {
        v45 = (unint64_t *)&v47->__shared_owners_;
        do
          v21 = __ldaxr(v45);
        while (__stlxr(v21 - 1, v45));
        goto LABEL_73;
      }
      break;
    case 0:
      sub_1001E4804(&v46);
      LOBYTE(v48) = 0;
      v17 = sub_1001E4874(v46, "CLGatheringScanEnabled", (BOOL *)&v48);
      v18 = (_BYTE)v48 ? v17 : 0;
      self->_scanEnabled = v18;
      v19 = v47;
      if (v47)
      {
        v20 = (unint64_t *)&v47->__shared_owners_;
        do
          v21 = __ldaxr(v20);
        while (__stlxr(v21 - 1, v20));
LABEL_73:
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
      break;
  }
}

- (BOOL)scanEnabled
{
  return self->_scanEnabled;
}

- (void)setScanEnabled:(BOOL)a3
{
  self->_scanEnabled = a3;
}

- (BOOL)scanForceNoAopPolicy
{
  return self->_scanForceNoAopPolicy;
}

- (void)setScanForceNoAopPolicy:(BOOL)a3
{
  self->_scanForceNoAopPolicy = a3;
}

- (BOOL)scanForceScreenOffOnly
{
  return self->_scanForceScreenOffOnly;
}

- (void)setScanForceScreenOffOnly:(BOOL)a3
{
  self->_scanForceScreenOffOnly = a3;
}

- (int64_t)scanAonDutyCycle
{
  return self->_scanAonDutyCycle;
}

- (void)setScanAonDutyCycle:(int64_t)a3
{
  self->_scanAonDutyCycle = a3;
}

- (int64_t)scanDutyCycle
{
  return self->_scanDutyCycle;
}

- (void)setScanDutyCycle:(int64_t)a3
{
  self->_scanDutyCycle = a3;
}

- (int64_t)scanBackoffTimeout
{
  return self->_scanBackoffTimeout;
}

- (void)setScanBackoffTimeout:(int64_t)a3
{
  self->_scanBackoffTimeout = a3;
}

- (int64_t)scanPeriodicInterval
{
  return self->_scanPeriodicInterval;
}

- (void)setScanPeriodicInterval:(int64_t)a3
{
  self->_scanPeriodicInterval = a3;
}

- (BOOL)scanWithDuplicates
{
  return self->_scanWithDuplicates;
}

- (void)setScanWithDuplicates:(BOOL)a3
{
  self->_scanWithDuplicates = a3;
}

- (BOOL)advertiseEnabled
{
  return self->_advertiseEnabled;
}

- (void)setAdvertiseEnabled:(BOOL)a3
{
  self->_advertiseEnabled = a3;
}

- (int64_t)advertisePeriod
{
  return self->_advertisePeriod;
}

- (void)setAdvertisePeriod:(int64_t)a3
{
  self->_advertisePeriod = a3;
}

- (int64_t)loggingVolatileMaxAge
{
  return self->_loggingVolatileMaxAge;
}

- (void)setLoggingVolatileMaxAge:(int64_t)a3
{
  self->_loggingVolatileMaxAge = a3;
}

- (BOOL)loggingPersistentEnabled
{
  return self->_loggingPersistentEnabled;
}

- (void)setLoggingPersistentEnabled:(BOOL)a3
{
  self->_loggingPersistentEnabled = a3;
}

- (int64_t)loggingPersistentMaxAge
{
  return self->_loggingPersistentMaxAge;
}

- (void)setLoggingPersistentMaxAge:(int64_t)a3
{
  self->_loggingPersistentMaxAge = a3;
}

- (BOOL)loggingPersistentInTempFolder
{
  return self->_loggingPersistentInTempFolder;
}

- (void)setLoggingPersistentInTempFolder:(BOOL)a3
{
  self->_loggingPersistentInTempFolder = a3;
}

- (NSDictionary)otaSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOtaSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  sub_1004D8F50((uint64_t *)&self->_settingsSubscription, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
