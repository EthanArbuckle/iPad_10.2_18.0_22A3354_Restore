@implementation NSURL(QLTExtensions)

- (BOOL)qlt_getVolumeUUID:()QLTExtensions
{
  id v4;
  NSObject *v5;
  _BOOL8 v6;
  int v7;
  int v8;
  NSObject *v9;
  __int128 v11;
  uint64_t v12;
  _BYTE v13[20];
  statfs v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(&v14, 0, 512);
  v4 = objc_retainAutorelease(a1);
  if (statfs((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v14))
  {
    _log_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NSURL(QLTExtensions) qlt_getVolumeUUID:].cold.2((uint64_t)v4, v5);

    return 0;
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v11 = xmmword_1D5500A60;
    v12 = 0;
    v7 = getattrlist(v14.f_mntonname, &v11, v13, 0x14uLL, 0);
    v6 = v7 == 0;
    if (v7)
    {
      v8 = v7;
      _log_2();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NSURL(QLTExtensions) qlt_getVolumeUUID:].cold.1(v8, v9);

    }
    else
    {
      *a3 = *(_OWORD *)&v13[4];
    }
  }
  return v6;
}

- (uint64_t)qlt_getDocumentIdentifier:()QLTExtensions
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;
  id v12;

  v12 = 0;
  v5 = *MEMORY[0x1E0C998F8];
  v11 = 0;
  v6 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v12, v5, &v11);
  v7 = v12;
  v8 = v11;
  if ((v6 & 1) != 0)
  {
    if (a3)
      *a3 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else
  {
    _log_2();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NSURL(QLTExtensions) qlt_getDocumentIdentifier:].cold.1((uint64_t)v8, (uint64_t)a1, v9);

  }
  return v6;
}

- (BOOL)qlt_getDeviceIdentifier:()QLTExtensions
{
  int v4;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  v4 = stat((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), &v6);
  if (a3 && !v4)
    *a3 = v6.st_dev;
  return v4 == 0;
}

- (void)qlt_getDocumentIdentifier:()QLTExtensions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D54AE000, log, OS_LOG_TYPE_ERROR, "Got error %@ trying to find docid for %@", (uint8_t *)&v3, 0x16u);
}

- (void)qlt_getVolumeUUID:()QLTExtensions .cold.1(int a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "getattrlist returned %d %{errno}d", (uint8_t *)v5, 0xEu);
}

- (void)qlt_getVolumeUUID:()QLTExtensions .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "statfs on \"%@\" failed", (uint8_t *)&v2, 0xCu);
}

@end
