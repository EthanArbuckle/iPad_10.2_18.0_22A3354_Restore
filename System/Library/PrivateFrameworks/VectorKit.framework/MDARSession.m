@implementation MDARSession

+ (id)newGeoTrackingSession
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  if (!+[MDARSession isSupported](MDARSession, "isSupported")
    || !objc_msgSend((id)getARGeoTrackingConfigurationClass(), "isSupported"))
  {
    return 0;
  }
  getARGeoTrackingConfigurationClass();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSupportEnablementOptions:", 4);
  objc_msgSend(v2, "setVisualLocalizationCallInterval:", 0.0);
  objc_msgSend(v2, "setPlaneDetection:", 0);
  objc_msgSend(v2, "setLightEstimationEnabled:", 0);
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "arEnableEnvironmentMap");

  if (v4)
    objc_msgSend(v2, "setEnvironmentTexturing:", 1);
  v5 = objc_alloc_init(getARSessionClass());
  objc_msgSend(v5, "runWithConfiguration:options:", v2, 1);

  return v5;
}

+ (id)newPositionalTrackingSession
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  if (+[MDARSession isSupported](MDARSession, "isSupported"))
  {
    if (objc_msgSend((id)getARWorldTrackingConfigurationClass(), "isSupported"))
    {
      getARWorldTrackingConfigurationClass();
      v2 = (void *)objc_opt_new();
      objc_msgSend(v2, "setPlaneDetection:", 0);
      objc_msgSend(v2, "setWorldAlignment:", 0);
      objc_msgSend(v2, "setLightEstimationEnabled:", 0);
      +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "arEnableEnvironmentMap");

      if (v4)
        objc_msgSend(v2, "setEnvironmentTexturing:", 1);
      if (v2)
      {
        v5 = objc_alloc_init(getARSessionClass());
        objc_msgSend(v5, "runWithConfiguration:options:", v2, 1);
LABEL_10:

        return v5;
      }
    }
    else
    {
      v2 = 0;
    }
    v5 = 0;
    goto LABEL_10;
  }
  return 0;
}

+ (BOOL)isSupported
{
  if (LoadARKit(void)::loadPredicate != -1)
    dispatch_once(&LoadARKit(void)::loadPredicate, &__block_literal_global_31230);
  return objc_msgSend((id)getARGeoTrackingConfigurationClass(), "isSupported");
}

+ (id)stringWithARTrackingState:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("NotAvailable");
  if (a3 == 1)
    v3 = CFSTR("Limited");
  if (a3 == 2)
    return CFSTR("Normal");
  else
    return (id)v3;
}

+ (id)stringWithARTrackingStateReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("None");
  else
    return (id)*((_QWORD *)&off_1E42F74B8 + a3 - 1);
}

+ (id)stringWithARGeoTrackingState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("NotAvailable");
  else
    return (id)*((_QWORD *)&off_1E42F74D8 + a3 - 1);
}

+ (id)stringWithARGeoTrackingStateReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("None");
  else
    return (id)*((_QWORD *)&off_1E42F74F0 + a3 - 1);
}

+ (id)stringWithARGeoTrackingAccuracy:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Undetermined");
  else
    return (id)*((_QWORD *)&off_1E42F7530 + a3 - 1);
}

@end
