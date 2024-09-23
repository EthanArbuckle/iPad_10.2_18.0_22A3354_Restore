@implementation MapsActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  Class v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  Class v18;

  v6 = a3;
  v7 = a4;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Handler"), objc_opt_class(v6));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v10 = NSClassFromString(v9);
  if (v10 != (Class)objc_opt_class(a1))
  {
    v11 = objc_msgSend(v6, "analyticsLaunchActionType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v12, "setMapLaunchAction:", v11);

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2090, 0, 0);
    v13 = sub_100431A4C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "MapsActionHandler : perform Action %@ with class %@", buf, 0x16u);
    }

    -[objc_class performSelector:withObject:withObject:](v10, "performSelector:withObject:withObject:", "performAction:inContext:", v6, v7);
  }

}

@end
