@implementation _APRSBiomeAppKillEvent

+ (id)eventWithAppBundleID:(id)a3 pid:(int)a4 exitReason:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class(a1));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setBundleID:", v8);
    objc_msgSend(v10, "setPid:", v6);
    objc_msgSend(v10, "setExitReason:", v5);
  }

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[3];
  __int128 v10;
  unsigned int v11;

  v11 = 0;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  objc_msgSend(a3, "getBytes:length:", v9, 68);
  v5 = (void *)objc_opt_class(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventWithAppBundleID:pid:exitReason:", v6, HIDWORD(v10), v11));

  return v7;
}

- (id)log
{
  if (qword_1001AB960 != -1)
    dispatch_once(&qword_1001AB960, &stru_10015E780);
  return (id)qword_1001AB968;
}

- (id)serialize
{
  _APRSBiomeAppKillEvent *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  LODWORD(v10) = 0;
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSString copy](v2->_bundleID, "copy", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, v10);
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x3D)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[_APRSBiomeAppKillEvent log](v2, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000E2C94((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);

    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 60));
    v3 = (id)v5;
  }
  if ((objc_msgSend(v3, "getCString:maxLength:encoding:", &v8, 60, 4) & 1) == 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_APRSBiomeAppKillEvent log](v2, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000E2C20((uint64_t *)&v2->_bundleID, v6);

  }
  HIDWORD(v9) = v2->_pid;
  LODWORD(v10) = v2->_exitReason;

  objc_sync_exit(v2);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 68));
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("App %@ \n pid %d \n exit reason %d"), self->_bundleID, self->_pid, self->_exitReason);
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unsigned int)a3
{
  self->_exitReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
