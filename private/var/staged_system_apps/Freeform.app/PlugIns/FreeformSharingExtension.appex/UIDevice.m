@implementation UIDevice

+ (id)crl_platformString
{
  if (qword_10006DAB8 != -1)
    dispatch_once(&qword_10006DAB8, &stru_100061A68);
  return (id)qword_10006DAB0;
}

+ (BOOL)crl_phoneUI
{
  void *v2;

  if ((byte_10006DAC0 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    qword_10006DAC8 = (uint64_t)objc_msgSend(v2, "userInterfaceIdiom");

    byte_10006DAC0 = 1;
  }
  return qword_10006DAC8 == 0;
}

+ (BOOL)crl_padUI
{
  void *v2;

  if ((byte_10006DAC0 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    qword_10006DAC8 = (uint64_t)objc_msgSend(v2, "userInterfaceIdiom");

    byte_10006DAC0 = 1;
  }
  return qword_10006DAC8 == 1;
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
