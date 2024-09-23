@implementation NANDTelemetry_NandCoreAnalyticsDaily

+ (BOOL)shouldCollectNandCounters
{
  return 1;
}

- (void)runActivity
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t GeomErrorPayloadCnt;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (+[NANDTelemetry_NandCoreAnalyticsDaily shouldCollectNandCounters](NANDTelemetry_NandCoreAnalyticsDaily, "shouldCollectNandCounters"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getValueForKey:", CFSTR("geom_error_payload_cnt")));

    v4 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v12, v4) & 1) != 0)
    {
      v5 = objc_msgSend(v12, "unsignedIntValue");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
      objc_msgSend(v6, "saveValue:forKey:doPersist:", v7, CFSTR("geom_error_payload_cnt"), 1);

      v5 = 0;
    }
    SetGeomErrorPayloadCnt((uint64_t)v5);
    NandInfoExtractToCA_runAllSteps(0);
    GeomErrorPayloadCnt = GetGeomErrorPayloadCnt();
    if (GeomErrorPayloadCnt > v5)
    {
      v9 = GeomErrorPayloadCnt;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
      objc_msgSend(v10, "saveValue:forKey:doPersist:", v11, CFSTR("geom_error_payload_cnt"), 1);

    }
  }
}

+ (BOOL)shouldRegisterActivity
{
  return 1;
}

@end
