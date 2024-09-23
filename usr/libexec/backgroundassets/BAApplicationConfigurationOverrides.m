@implementation BAApplicationConfigurationOverrides

- (void)setEssentialMaxInstallSize:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *essentialMaxInstallSize;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7)
      sub_100034A80(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialMaxInstallSize integerVal"
                               "ue] >= 0), essentialMaxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialMaxInstallSize = self->_essentialMaxInstallSize;
    self->_essentialMaxInstallSize = v5;

  }
}

- (void)setMaxInstallSize:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *maxInstallSize;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7)
      sub_100034AF4(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([maxInstallSize integerValue] >= 0)"
                               ", maxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    maxInstallSize = self->_maxInstallSize;
    self->_maxInstallSize = v5;

  }
}

- (void)setEssentialDownloadAllowance:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *essentialDownloadAllowance;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7)
      sub_100034B68(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialDownloadAllowance integer"
                               "Value] >= 0), essentialDownloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialDownloadAllowance = self->_essentialDownloadAllowance;
    self->_essentialDownloadAllowance = v5;

  }
}

- (void)setDownloadAllowance:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *downloadAllowance;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7)
      sub_100034BDC(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([downloadAllowance integerValue] >="
                               " 0), downloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    downloadAllowance = self->_downloadAllowance;
    self->_downloadAllowance = v5;

  }
}

- (void)setManifestURL:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *manifestURL;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSString *)a3;
  v5 = v4;
  if (v4 && !-[NSString length](v4, "length"))
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v7)
      sub_100034C50(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([manifestURL length] > 0), manifest"
                               "URL cannot be empty.";
    __break(1u);
  }
  else
  {
    manifestURL = self->_manifestURL;
    self->_manifestURL = v5;

  }
}

- (void)setDomainAllowlist:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSArray *domainAllowlist;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = (NSArray *)a3;
  v5 = v4;
  if (!v4)
  {
LABEL_12:
    domainAllowlist = self->_domainAllowlist;
    self->_domainAllowlist = v5;

    return;
  }
  if (-[NSArray count](v4, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v5;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "length", (_QWORD)v28))
          {
            v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
            if (v12)
              sub_100034D38(v12, v13, v14, v15, v16, v17, v18, v19);
            qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([item length] > 0), domainA"
                                       "llowlist items cannot be empty.";
            __break(1u);
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }

    goto LABEL_12;
  }
  v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (v20)
    sub_100034CC4(v20, v21, v22, v23, v24, v25, v26, v27);
  qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([domainAllowlist count] > 0), domainA"
                             "llowlist cannot be empty.";
  __break(1u);
}

+ (id)overridesForAppBundleIdentifier:(id)a3
{
  return sub_100005124((uint64_t)a1, a3);
}

+ (BOOL)setOverrides:(id)a3 forAppBundleIdentifier:(id)a4
{
  return sub_1000052B4((uint64_t)a1, a3, a4);
}

+ (BOOL)clearOverridesForAppBundleIdentifier:(id)a3
{
  return sub_1000052B4((uint64_t)a1, 0, a3);
}

+ (BOOL)clearAllOverrides
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  CFPreferencesSetAppValue(CFSTR("InternalAppOverrides"), v2, CFSTR("com.apple.backgroundassets"));
  v3 = CFPreferencesAppSynchronize(CFSTR("com.apple.backgroundassets")) != 0;

  return v3;
}

- (NSNumber)essentialMaxInstallSize
{
  return self->_essentialMaxInstallSize;
}

- (NSNumber)maxInstallSize
{
  return self->_maxInstallSize;
}

- (NSString)manifestURL
{
  return self->_manifestURL;
}

- (NSNumber)essentialDownloadAllowance
{
  return self->_essentialDownloadAllowance;
}

- (NSNumber)downloadAllowance
{
  return self->_downloadAllowance;
}

- (NSArray)domainAllowlist
{
  return self->_domainAllowlist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAllowlist, 0);
  objc_storeStrong((id *)&self->_downloadAllowance, 0);
  objc_storeStrong((id *)&self->_essentialDownloadAllowance, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_maxInstallSize, 0);
  objc_storeStrong((id *)&self->_essentialMaxInstallSize, 0);
}

@end
