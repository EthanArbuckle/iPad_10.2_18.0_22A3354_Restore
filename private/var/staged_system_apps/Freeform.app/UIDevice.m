@implementation UIDevice

+ (id)crl_platformString
{
  if (qword_101414DD0 != -1)
    dispatch_once(&qword_101414DD0, &stru_1012365A8);
  return (id)qword_101414DC8;
}

+ (BOOL)crl_phoneUI
{
  void *v2;

  if ((byte_101414DD8 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    qword_101414DE0 = (uint64_t)objc_msgSend(v2, "userInterfaceIdiom");

    byte_101414DD8 = 1;
  }
  return qword_101414DE0 == 0;
}

+ (BOOL)crl_padUI
{
  void *v2;

  if ((byte_101414DD8 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    qword_101414DE0 = (uint64_t)objc_msgSend(v2, "userInterfaceIdiom");

    byte_101414DD8 = 1;
  }
  return qword_101414DE0 == 1;
}

+ (BOOL)crl_phoneDevice
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone"));

  return v4;
}

+ (BOOL)crl_iPodTouchDevice
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPod touch"));

  return v4;
}

+ (BOOL)crl_iPadDevice
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad"));

  return v4;
}

+ (BOOL)crl_landscapePhoneUI
{
  _BOOL4 v2;

  v2 = +[UIDevice crl_phoneUI](UIDevice, "crl_phoneUI");
  if (v2)
    LOBYTE(v2) = +[UIScreen crl_deviceIsLandscape](UIScreen, "crl_deviceIsLandscape");
  return v2;
}

@end
