@implementation BRCVolume

- (NSString)mountPath
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), self->_stfs.f_mntonname);
}

- (int)_setUpForStatfs:(statfs *)a3
{
  uint32_t f_flags;
  _OWORD v7[2];
  int v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v9 = xmmword_230722B40;
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  if (getattrlist(a3->f_mntonname, &v9, v7, 0x24uLL, 0x21u) < 0)
    return *__error();
  if (strcmp(a3->f_fstypename, "hfs") && (~DWORD1(v7[0]) & 0x180000) != 0)
    return 19;
  f_flags = a3->f_flags;
  if ((f_flags & 0x1001) == 0x1000)
  {
    memcpy(&self->_stfs, a3, sizeof(self->_stfs));
    return 0;
  }
  else if ((f_flags & 1) != 0)
  {
    return 30;
  }
  else
  {
    return 19;
  }
}

- (NSString)fsTypeName
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), self->_stfs.f_fstypename);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t deviceID;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  deviceID = self->_deviceID;
  BRCPrettyPrintBitmap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>, deviceID:%d device:'%s' mounted-on:'%s' fstype:%s(%@)"), v4, self, deviceID, self->_stfs.f_mntfromname, self->_stfs.f_mntonname, self->_stfs.f_fstypename, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)setupWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  id v23;
  int v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint8_t *v28;
  int v29;
  const char *v30;
  __int16 v31;
  _BYTE v32[18];
  __int16 v33;
  void *v34;
  _BYTE __dst[2168];
  statfs __src;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  self->_deviceID = 0;
  memset(&__src, 0, 512);
  objc_msgSend(MEMORY[0x24BDD17C8], "br_currentHomeDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "br_realpath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", *MEMORY[0x24BE172F8], 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  if (statfs((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &__src) < 0)
  {
    v16 = *__error();
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      *(_DWORD *)__dst = 136315650;
      *(_QWORD *)&__dst[4] = objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
      *(_WORD *)&__dst[12] = 1024;
      *(_DWORD *)&__dst[14] = v16;
      *(_WORD *)&__dst[18] = 2112;
      *(_QWORD *)&__dst[20] = v17;
      _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] statfs for %s failed %{errno}d%@", __dst, 0x1Cu);
    }

    *__error() = v16;
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_13;
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, (os_log_type_t)0x90u))
      goto LABEL_12;
    v15 = "(passed to caller)";
    *(_DWORD *)__dst = 136315906;
    *(_QWORD *)&__dst[4] = "-[BRCVolume setupWithError:]";
    *(_WORD *)&__dst[12] = 2080;
    if (!a3)
      v15 = "(ignored by caller)";
    goto LABEL_30;
  }
  memcpy(__dst, &__src, sizeof(__dst));
  v11 = -[BRCVolume _setUpForStatfs:](self, "_setUpForStatfs:", __dst);
  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        *(_DWORD *)__dst = 136315906;
        *(_QWORD *)&__dst[4] = "-[BRCVolume setupWithError:]";
        *(_WORD *)&__dst[12] = 2080;
        if (!a3)
          v15 = "(ignored by caller)";
LABEL_30:
        *(_QWORD *)&__dst[14] = v15;
        *(_WORD *)&__dst[22] = 2112;
        *(_QWORD *)&__dst[24] = v12;
        *(_WORD *)&__dst[32] = 2112;
        *(_QWORD *)&__dst[34] = v13;
        v28 = __dst;
LABEL_31:
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v28, 0x2Au);
      }
LABEL_12:

    }
  }
  else
  {
    memset(__dst, 0, 144);
    v23 = objc_retainAutorelease(v10);
    if ((stat((const char *)objc_msgSend(v23, "fileSystemRepresentation"), (stat *)__dst) & 0x80000000) == 0)
    {
      self->_deviceID = *(_DWORD *)__dst;
      goto LABEL_16;
    }
    v24 = *__error();
    brc_bread_crumbs();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      v29 = 136315650;
      v30 = (const char *)objc_msgSend(objc_retainAutorelease(v23), "fileSystemRepresentation");
      v31 = 1024;
      *(_DWORD *)v32 = v24;
      *(_WORD *)&v32[4] = 2112;
      *(_QWORD *)&v32[6] = v25;
      _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] stat for %s failed %{errno}d%@", (uint8_t *)&v29, 0x1Cu);
    }

    *__error() = v24;
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        v29 = 136315906;
        v30 = "-[BRCVolume setupWithError:]";
        v31 = 2080;
        if (!a3)
          v27 = "(ignored by caller)";
        *(_QWORD *)v32 = v27;
        *(_WORD *)&v32[8] = 2112;
        *(_QWORD *)&v32[10] = v12;
        v33 = 2112;
        v34 = v13;
        v28 = (uint8_t *)&v29;
        goto LABEL_31;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  if (a3)
    *a3 = objc_retainAutorelease(v12);

LABEL_16:
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__dst = 138412546;
    *(_QWORD *)&__dst[4] = self;
    *(_WORD *)&__dst[12] = 2112;
    *(_QWORD *)&__dst[14] = v19;
    _os_log_impl(&dword_230455000, v20, OS_LOG_TYPE_DEFAULT, "[NOTICE] on device: %@%@", __dst, 0x16u);
  }

  v21 = self->_deviceID != 0;
  return v21;
}

- (int)deviceID
{
  return self->_deviceID;
}

@end
