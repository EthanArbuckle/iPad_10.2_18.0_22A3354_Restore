@implementation NSXPCConnection

- (NSString)sd_description
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection sd_connectionBundleID](self, "sd_connectionBundleID"));
  v4 = (void *)v3;
  v5 = CFSTR("N/A");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%d)"), v6, -[NSXPCConnection processIdentifier](self, "processIdentifier")));
  return (NSString *)v7;
}

- (NSString)sd_connectionBundleID
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](self, "_xpcConnection"));
  v4 = sub_10019CD60(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", CFSTR("application-identifier")));
  return (NSString *)v5;
}

- (NSString)sd_connectionProcessName
{
  __int128 v3;

  if (proc_name(-[NSXPCConnection processIdentifier](self, "processIdentifier", 0, 0, 0, 0), &v3, 0x20u) < 1)
    return (NSString *)0;
  else
    return (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", &v3);
}

- (BOOL)sd_connectionHasEntitlement:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", a3));
  if ((objc_opt_respondsToSelector(v3, "BOOLValue") & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)sd_connectionCanShareURL:(id)a3
{
  const __CFURL *v4;
  char v5;
  id v6;
  NSObject *v7;
  __int128 v9;

  v4 = (const __CFURL *)a3;
  -[NSXPCConnection auditToken](self, "auditToken");
  v5 = sub_10019B530(v4, &v9);
  if ((v5 & 1) == 0)
  {
    v6 = share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1005744B0(v4, v7);

  }
  return v5;
}

- (BOOL)_connectionHasEntitlement:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", a3));
  if ((objc_opt_respondsToSelector(v3, "BOOLValue") & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

@end
