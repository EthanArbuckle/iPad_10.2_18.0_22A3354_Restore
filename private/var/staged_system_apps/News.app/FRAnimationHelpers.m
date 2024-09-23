@implementation FRAnimationHelpers

+ (BOOL)changeWithoutRestartingEnabled
{
  if (qword_10010A6A0 != -1)
    dispatch_once(&qword_10010A6A0, &stru_1000DCEB0);
  return byte_10010A698;
}

+ (id)animationType
{
  void *v2;
  id v3;

  if (+[FRAnimationHelpers changeWithoutRestartingEnabled](FRAnimationHelpers, "changeWithoutRestartingEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("animation_type")));

  }
  else
  {
    if (qword_10010A6B0 != -1)
      dispatch_once(&qword_10010A6B0, &stru_1000DCED0);
    v3 = (id)qword_10010A6A8;
  }
  return v3;
}

+ (BOOL)overrideDurationEnabled
{
  void *v2;
  unsigned __int8 v3;

  if (+[FRAnimationHelpers changeWithoutRestartingEnabled](FRAnimationHelpers, "changeWithoutRestartingEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("override_duration"));

    return v3;
  }
  else
  {
    if (qword_10010A6C0 != -1)
      dispatch_once(&qword_10010A6C0, &stru_1000DCEF0);
    return byte_10010A6B8;
  }
}

+ (double)animationDuration
{
  void *v2;
  float v3;
  double v4;

  if (+[FRAnimationHelpers changeWithoutRestartingEnabled](FRAnimationHelpers, "changeWithoutRestartingEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "floatForKey:", CFSTR("animation_duration"));
    v4 = (float)(v3 / 10.0);

  }
  else
  {
    if (qword_10010A6D0 != -1)
      dispatch_once(&qword_10010A6D0, &stru_1000DCF10);
    if (byte_10010A6C8)
      return 1.0;
    else
      return 0.0;
  }
  return v4;
}

+ (BOOL)oldTimingEnabled
{
  void *v2;
  unsigned __int8 v3;

  if (+[FRAnimationHelpers changeWithoutRestartingEnabled](FRAnimationHelpers, "changeWithoutRestartingEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("animation_old_timing_enabled"));

    return v3;
  }
  else
  {
    if (qword_10010A6E0 != -1)
      dispatch_once(&qword_10010A6E0, &stru_1000DCF30);
    return byte_10010A6D8;
  }
}

+ (BOOL)prewarmDelayDisabled
{
  void *v2;
  unsigned __int8 v3;

  if (+[FRAnimationHelpers changeWithoutRestartingEnabled](FRAnimationHelpers, "changeWithoutRestartingEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("animation_prewarm_animation_disabled"));

    return v3;
  }
  else
  {
    if (qword_10010A6F0 != -1)
      dispatch_once(&qword_10010A6F0, &stru_1000DCF50);
    return byte_10010A6E8;
  }
}

+ (BOOL)synchronousImageLoadingEnabled
{
  void *v2;
  unsigned __int8 v3;

  if (+[FRAnimationHelpers changeWithoutRestartingEnabled](FRAnimationHelpers, "changeWithoutRestartingEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("animation_synchronously_load_headerimage"));

    return v3;
  }
  else
  {
    if (qword_10010A700 != -1)
      dispatch_once(&qword_10010A700, &stru_1000DCF70);
    return byte_10010A6F8;
  }
}

+ (BOOL)feedScaleDisabled
{
  void *v2;
  unsigned __int8 v3;

  if (+[FRAnimationHelpers changeWithoutRestartingEnabled](FRAnimationHelpers, "changeWithoutRestartingEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("animation_alternative_feedscale_disabled"));

    return v3;
  }
  else
  {
    if (qword_10010A710 != -1)
      dispatch_once(&qword_10010A710, &stru_1000DCF90);
    return byte_10010A708;
  }
}

@end
