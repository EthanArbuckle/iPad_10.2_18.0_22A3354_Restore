@implementation RBLSBundleProperties

- (uint64_t)initWithBundleProxy:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "bundleIdentifier");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v4;

      objc_msgSend(v3, "bundleURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v7;

      objc_msgSend(v3, "canonicalExecutablePath");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v9;

      objc_msgSend(v3, "dataContainerURL");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v11;

      objc_msgSend(v3, "environmentVariables");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v13;

      objc_msgSend(v3, "_rb_extensionPointIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v15;

      v17 = *(_QWORD *)(a1 + 48);
      *(_BYTE *)(a1 + 15) = v17 != 0;
      if (v17)
      {
        objc_msgSend(v3, "entitlementValueForKey:ofClass:", CFSTR("com.apple.private.security.container-required"), objc_opt_class());
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v18;

      }
    }
  }

  return a1;
}

- (uint64_t)initWithApplicationProxy:(uint64_t)a1
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a2;
  if (a1)
  {
    a1 = -[RBLSBundleProperties initWithBundleProxy:](a1, v3);
    if (a1)
    {
      objc_msgSend(v3, "UIBackgroundModes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "containsObject:", CFSTR("fetch")) & 1) != 0)
        v5 = 1;
      else
        v5 = objc_msgSend(v4, "containsObject:", CFSTR("remote-notification"));
      *(_BYTE *)(a1 + 9) = v5;
      if ((objc_msgSend(v4, "containsObject:", CFSTR("voip")) & 1) != 0)
        v6 = 1;
      else
        v6 = objc_msgSend(v4, "containsObject:", CFSTR("push-to-talk"));
      *(_BYTE *)(a1 + 13) = v6;
      *(_BYTE *)(a1 + 12) = objc_msgSend(v4, "containsObject:", CFSTR("unboundedTaskCompletion"));
      *(_BYTE *)(a1 + 10) = objc_msgSend(v4, "containsObject:", CFSTR("network-authentication"));
      *(_BYTE *)(a1 + 11) = objc_msgSend(v4, "containsObject:", CFSTR("audio"));
      *(_BYTE *)(a1 + 14) = objc_msgSend(v4, "containsObject:", CFSTR("continuous"));
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("SBPreferredPriorityBand"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectsForInfoDictionaryKeys:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringForKey:", CFSTR("SBPreferredPriorityBand"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("PriorityBandSuspended")))
      {
        *(_DWORD *)(a1 + 16) = 0;
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", CFSTR("PriorityBandMail")))
        {
          v10 = 0;
          *(_DWORD *)(a1 + 16) = -1;
          goto LABEL_15;
        }
        *(_DWORD *)(a1 + 16) = 40;
      }
      v10 = 1;
LABEL_15:
      *(_BYTE *)(a1 + 8) = v10;

    }
  }

  return a1;
}

- (id)proxy
{
  void *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x24BDC1550];
  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v1, "bundleProxyForURL:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    rbs_general_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[RBLSBundleProperties proxy].cold.1(v2, (uint64_t)v5, v6);

  }
  return v4;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[RBLSBundleProperties proxy]((uint64_t)self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsForInfoDictionaryKeys:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "rawValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)bundleIdentifier
{
  return self->_identifier;
}

- (NSString)bundlePath
{
  return self->_path;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSString)containerOverrideIdentifier
{
  return self->_containerOverrideIdentifier;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (BOOL)hasPreferredJetsamBand
{
  return self->_hasPreferredJetsamBand;
}

- (int)preferredJetsamBand
{
  return self->_preferredJetsamBand;
}

- (BOOL)supportsBackgroundContentFetching
{
  return self->_supportsBackgroundContentFetching;
}

- (BOOL)supportsBackgroundNetworkAuthentication
{
  return self->_supportsBackgroundNetworkAuthentication;
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (BOOL)supportsUnboundedTaskCompletion
{
  return self->_supportsUnboundedTaskCompletion;
}

- (BOOL)usesSocketMonitoring
{
  return self->_usesSocketMonitoring;
}

- (BOOL)continuousBackgroundMode
{
  return self->_continuousBackgroundMode;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (int)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_containerOverrideIdentifier, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)proxy
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_fault_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_FAULT, "LSBundleProxy lookup for %{public}@, failed with %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
