@implementation CLDurianSettings

+ (BOOL)forceEnableLeash
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianForceLeash", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (NSDictionary)settingsDictionary
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v10[15];
  _QWORD v11[15];

  v10[0] = CFSTR("DurianCrashAlertEnabled");
  v11[0] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "crashAlertEnabled"));
  v10[1] = CFSTR("DurianLKLEnabled");
  v11[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "lastKnownLocationEnabled"));
  v10[2] = CFSTR("DurianForceLeash");
  v11[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "forceEnableLeash"));
  v10[3] = CFSTR("DurianConnectionMaintenanceInterval");
  v11[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a1, "maintenanceIntervalOverride"));
  v10[4] = CFSTR("DurianAlignmentInterval");
  v3 = (const __CFString *)objc_msgSend(a1, "alignmentIntervalOverride");
  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("none");
  v11[4] = v4;
  v10[5] = CFSTR("DurianNearOwnerTimeout");
  v5 = (const __CFString *)objc_msgSend(a1, "nearOwnerTimeoutOverride");
  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("none");
  v11[5] = v6;
  v10[6] = CFSTR("DurianDisableProactiveMaintenance");
  v11[6] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "maintenanceOnWildObservationEnabled"));
  v10[7] = CFSTR("DurianForceMaintenanceConnections");
  v11[7] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "forceMaintenanceConnectionsOverride"));
  v10[8] = CFSTR("DurianTestMode");
  v7 = (const __CFString *)objc_msgSend(a1, "testMode");
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("none");
  v11[8] = v8;
  v10[9] = CFSTR("HawkeyeTestMode");
  v11[9] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a1, "hawkeyeTestMode"));
  v10[10] = CFSTR("DurianForcePosh");
  v11[10] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "forceEnablePosh"));
  v10[11] = CFSTR("DurianForceNonAppleConnections");
  v11[11] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "forceNonAppleConnections"));
  v10[12] = CFSTR("DurianForcePoshAirPods");
  v11[12] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "forcePoshAirPods"));
  v10[13] = CFSTR("DurianBeaconsChangedPopup");
  v11[13] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "allowBeaconsChangedPopup"));
  v10[14] = CFSTR("DurianBeaconsChangedPopupBackoff");
  v11[14] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a1, "beaconsChangedPopupBackoff"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 15);
}

+ (int)beaconsChangedPopupBackoff
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  int v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4B84(v8, "DurianBeaconsChangedPopupBackoff", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v2)
    return v3;
  else
    return 900;
}

+ (BOOL)allowBeaconsChangedPopup
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianBeaconsChangedPopup", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (BOOL)forceEnablePosh
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianForcePosh", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (BOOL)forcePoshAirPods
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianForcePoshAirPods", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (BOOL)forceNonAppleConnections
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianForceNonAppleConnections", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (BOOL)crashAlertEnabled
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianCrashAlertEnabled", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (BOOL)lastKnownLocationEnabled
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianLKLEnabled", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return 1;
  else
    return v2 ^ 1;
}

+ (BOOL)reconnectAfterLeashFailure
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianLeashReconnect", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (BOOL)driftModelConnectionEnabled
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianDriftModelConnectionEnabled", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return 1;
  else
    return v2 ^ 1;
}

+ (BOOL)reconciledConnectionEnabled
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianReconciledConnectionEnabled", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return 1;
  else
    return v2 ^ 1;
}

+ (int)maintenanceIntervalOverride
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;
  int v8;

  v8 = 0;
  sub_1001E4804(&v6);
  sub_1001E4B84(v6, "DurianConnectionMaintenanceInterval", &v8);
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return v8;
}

+ (NSNumber)alignmentIntervalOverride
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unsigned int v10;

  v10 = 0;
  sub_1001E4804(&v8);
  v2 = sub_100526244(v8, "DurianAlignmentInterval", &v10);
  v3 = v2;
  v4 = v9;
  if (!v9)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (v3)
      return +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
  }
  else
  {
LABEL_5:
    if (v2)
      return +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v10);
  }
  return 0;
}

+ (NSNumber)nearOwnerTimeoutOverride
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unsigned int v10;

  v10 = 0;
  sub_1001E4804(&v8);
  v2 = sub_1001E4B84(v8, "DurianNearOwnerTimeout", &v10);
  v3 = v2;
  v4 = v9;
  if (!v9)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v6 = __ldaxr(p_shared_owners);
  while (__stlxr(v6 - 1, p_shared_owners));
  if (!v6)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    if (v3)
      return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10);
  }
  else
  {
LABEL_5:
    if (v2)
      return +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10);
  }
  return 0;
}

+ (BOOL)maintenanceOnWildObservationEnabled
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianDisableProactiveMaintenance", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2 ^ 1;
  else
    return 1;
}

+ (BOOL)forceMaintenanceConnectionsOverride
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "DurianForceMaintenanceConnections", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (int)hawkeyeTestMode
{
  unsigned int v2;
  int result;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  int v9;

  v9 = 0;
  v2 = +[CLDurianPlatform isInternalInstall](CLDurianPlatform, "isInternalInstall");
  result = 0;
  if (v2)
  {
    sub_1001E4804(&v7);
    sub_1001E4B84(v7, "HawkeyeTestMode", &v9);
    v4 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    return v9;
  }
  return result;
}

+ (NSString)testMode
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::string *p_p;
  NSString *v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  if (!+[CLDurianPlatform isInternalInstall](CLDurianPlatform, "isInternalInstall"))
    return 0;
  sub_1001E4804(&v8);
  sub_1000BCB64(v8, "DurianTestMode", &__p);
  v2 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

+ (int64_t)uarpAssetLocationType
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;
  int v8;

  v8 = 1;
  sub_1001E4804(&v6);
  sub_1001E4B84(v6, "HawkeyeUARPAssetLocationType", &v8);
  v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return v8;
}

+ (BOOL)uarpPacketCaptureEnabled
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "HawkeyeEnableUARPPacketCapture", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

+ (BOOL)runningFindMyCertificationAssistant
{
  char v2;
  _BOOL4 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;
  BOOL v10;

  sub_1001E4804(&v8);
  v10 = 0;
  v2 = sub_1001E4874(v8, "HawkeyeRunningFindMyCertificationAssistant", &v10);
  v3 = v10;
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v3)
    return v2;
  else
    return 0;
}

@end
