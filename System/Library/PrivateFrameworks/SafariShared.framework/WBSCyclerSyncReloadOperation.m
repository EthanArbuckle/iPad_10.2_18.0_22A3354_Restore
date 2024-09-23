@implementation WBSCyclerSyncReloadOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  v7 = +[WBSCyclerConnectionManager shouldTabCyclerSlowDown](WBSCyclerConnectionManager, "shouldTabCyclerSlowDown");
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Sending a syncDidFinish notification to trigger a database reload", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("com.apple.SafariTabGroupSync.SyncDidFinish"), 0, &unk_1E4B87788);

  }
  else if (v9)
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Not sending a syncDidFinish notification because shouldTabCyclerSlowDown is off.", v12, 2u);
  }
  objc_msgSend(v6, "topLevelItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5, v11);
}

@end
