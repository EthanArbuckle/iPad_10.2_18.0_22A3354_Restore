@implementation VUIPagePerformanceController

+ (void)postNotificationForImageProxy:(id)a3 withLoadingStatus:(BOOL)a4 withError:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  id v15;
  __CFString *v16;
  void *v17;
  _QWORD v18[4];
  __CFString *v19;
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("VUIPagePerformanceImageProxyNotificationTimestamp"));

  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("VUIPagePerformanceImageProxyNotificationError"));
  v12 = CFSTR("VUIPagePerformanceImageProxyDidLoadNotification");
  if (v6)
    v12 = CFSTR("VUIPagePerformanceImageProxyWillLoadNotification");
  v13 = v12;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__VUIPagePerformanceController_postNotificationForImageProxy_withLoadingStatus_withError___block_invoke;
  v18[3] = &unk_1E9F2C2B0;
  v19 = v13;
  v20 = v7;
  v21 = v10;
  v14 = v10;
  v15 = v7;
  v16 = v13;
  v17 = (void *)MEMORY[0x1DF08E588](v18);
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

void __90__VUIPagePerformanceController_postNotificationForImageProxy_withLoadingStatus_withError___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], a1[6]);

}

@end
