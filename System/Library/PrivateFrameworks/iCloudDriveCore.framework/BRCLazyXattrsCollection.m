@implementation BRCLazyXattrsCollection

- (const)xattrNamesListBegin
{
  return (const char *)-[NSMutableData bytes](self->_xattrNamesList, "bytes");
}

- (const)xattrNamesListEnd
{
  uint64_t v3;

  v3 = -[NSMutableData bytes](self->_xattrNamesList, "bytes");
  return (const char *)(v3 + -[NSMutableData length](self->_xattrNamesList, "length"));
}

- (const)xattrNamesBegin
{
  return (const char **)-[NSMutableData mutableBytes](self->_xattrNamesData, "mutableBytes");
}

- (unsigned)xattrNamesCount
{
  return self->_xattrCount;
}

- (const)xattrNamesEnd
{
  return (const char **)(-[NSMutableData mutableBytes](self->_xattrNamesData, "mutableBytes") + 8 * self->_xattrCount);
}

- (const)structuralXattrNamesBegin
{
  return (const char **)(-[NSMutableData mutableBytes](self->_xattrNamesData, "mutableBytes")
                       + 8 * self->_contentXattrCount);
}

- (const)structuralXattrNamesEnd
{
  return (const char **)(-[NSMutableData mutableBytes](self->_xattrNamesData, "mutableBytes") + 8 * self->_xattrCount);
}

- (unsigned)structuralXattrNamesCount
{
  return self->_xattrCount - self->_contentXattrCount;
}

- (const)contentXattrNamesBegin
{
  return (const char **)-[NSMutableData mutableBytes](self->_xattrNamesData, "mutableBytes");
}

- (const)contentXattrNamesEnd
{
  return (const char **)(-[NSMutableData mutableBytes](self->_xattrNamesData, "mutableBytes")
                       + 8 * self->_contentXattrCount);
}

- (unsigned)contentXattrNamesCount
{
  return self->_contentXattrCount;
}

- (BRCLazyXattrsCollection)initWithFD:(int)a3 sizeLimit:(int64_t)a4 syncable:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  BRCLazyXattrsCollection *v10;
  BRCLazyXattrsCollection *v11;
  ssize_t v12;
  size_t v13;
  void *v14;
  NSObject *v15;
  BRCLazyXattrsCollection *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BRCLazyXattrsCollection *v20;
  uint64_t v21;
  NSMutableData *xattrNamesList;
  const char *v23;
  unint64_t v24;
  _BYTE *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  NSMutableData *xattrNamesData;
  char *v32;
  int v33;
  xattr_flags_t v34;
  char v35;
  uint64_t v36;
  unsigned int contentXattrCount;
  BRCLazyXattrsCollection *v38;
  const char **v39;
  unsigned int v40;
  BRCLazyXattrsCollection *v41;
  const char **v42;
  unsigned int v43;
  const char *v45;
  const char *v46;
  objc_super v47;
  _BYTE buf[24];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v7 = a5;
  v52 = *MEMORY[0x24BDAC8D0];
  v47.receiver = self;
  v47.super_class = (Class)BRCLazyXattrsCollection;
  v10 = -[BRCLazyXattrsCollection init](&v47, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_36:
    v38 = objc_retainAutorelease(v11);
    v39 = -[BRCLazyXattrsCollection contentXattrNamesBegin](v38, "contentXattrNamesBegin");
    v40 = -[BRCLazyXattrsCollection contentXattrNamesCount](v38, "contentXattrNamesCount");
    if (v40)
      qsort_b(v39, v40, 8uLL, &__block_literal_global_76);
    v41 = objc_retainAutorelease(v38);
    v42 = -[BRCLazyXattrsCollection structuralXattrNamesBegin](v41, "structuralXattrNamesBegin");
    v43 = -[BRCLazyXattrsCollection structuralXattrNamesCount](v41, "structuralXattrNamesCount");
    if (v43)
      qsort_b(v42, v43, 8uLL, &__block_literal_global_76);
    v20 = v41;
LABEL_41:
    v16 = v20;
    goto LABEL_42;
  }
  v10->_sizeLimit = a4;
  v10->_fd = a3;
  v12 = flistxattr(a3, 0, 0, 0);
  if (v12 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        v45 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a6)
          v45 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v45;
        *(_WORD *)&buf[22] = 2112;
        v49 = v17;
        v50 = 2112;
        v51 = v18;
        _os_log_error_impl(&dword_230455000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v17);

    v20 = v11;
    goto LABEL_41;
  }
  v13 = v12;
  if (a4 < 0 || v12 <= a4)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v12);
    xattrNamesList = v11->_xattrNamesList;
    v11->_xattrNamesList = (NSMutableData *)v21;

    if (flistxattr(a3, (char *)-[NSMutableData mutableBytes](v11->_xattrNamesList, "mutableBytes"), v13, 0) != v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        brc_bread_crumbs();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
        {
          v46 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a6)
            v46 = "(ignored by caller)";
          *(_QWORD *)&buf[14] = v46;
          *(_WORD *)&buf[22] = 2112;
          v49 = v27;
          v50 = 2112;
          v51 = v28;
          _os_log_error_impl(&dword_230455000, v29, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v27);

      goto LABEL_26;
    }
    v23 = -[BRCLazyXattrsCollection xattrNamesListBegin](v11, "xattrNamesListBegin");
    v24 = -[BRCLazyXattrsCollection xattrNamesListEnd](v11, "xattrNamesListEnd");
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __countSyncableXattrs_block_invoke;
    v49 = &__block_descriptor_33_e9_B16__0r_8l;
    LOBYTE(v50) = v7;
    v25 = buf;
    if ((unint64_t)v23 >= v24)
    {
      v26 = 0;
    }
    else
    {
      v26 = 0;
      do
      {
        v26 += (*(uint64_t (**)(_BYTE *, const char *))&buf[16])(v25, v23);
        v23 += strlen(v23) + 1;
      }
      while ((unint64_t)v23 < v24);
    }

    v11->_xattrCount = v26;
    v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 8 * v11->_xattrCount);
    xattrNamesData = v11->_xattrNamesData;
    v11->_xattrNamesData = (NSMutableData *)v30;

    v32 = -[BRCLazyXattrsCollection xattrNamesListBegin](v11, "xattrNamesListBegin");
    if (v32 < -[BRCLazyXattrsCollection xattrNamesListEnd](v11, "xattrNamesListEnd"))
    {
      v33 = 0;
      do
      {
        v34 = brc_xattr_flags_from_name(v32);
        v35 = v34;
        if ((xattr_intent_with_flags(4u, v34) == 0) != v7)
        {
          v36 = -[BRCLazyXattrsCollection xattrNamesBegin](objc_retainAutorelease(v11), "xattrNamesBegin");
          if ((v35 & 2) != 0)
          {
            contentXattrCount = v11->_contentXattrCount;
            v11->_contentXattrCount = contentXattrCount + 1;
          }
          else
          {
            ++v33;
            contentXattrCount = v11->_xattrCount - v33;
          }
          *(_QWORD *)(v36 + 8 * contentXattrCount) = v32;
        }
        v32 += strlen(v32) + 1;
      }
      while (v32 < -[BRCLazyXattrsCollection xattrNamesListEnd](v11, "xattrNamesListEnd"));
    }
    goto LABEL_36;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    -[BRCLazyXattrsCollection initWithFD:sizeLimit:syncable:error:].cold.1((uint64_t)v14, a4, v15);

  if (!a6)
  {
LABEL_26:
    v16 = 0;
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 12);
  v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v16;
}

- (id)getXattrValue:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *cachedXattrs;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t sizeLimit;
  int fd;
  id v15;
  const char *v16;
  ssize_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  char *v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSMutableDictionary *v27;
  void *v28;
  const char *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  cachedXattrs = self->_cachedXattrs;
  if (!cachedXattrs)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_cachedXattrs;
    self->_cachedXattrs = v8;

    cachedXattrs = self->_cachedXattrs;
  }
  -[NSMutableDictionary valueForKey:](cachedXattrs, "valueForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        brc_bread_crumbs();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          -[BRCLazyXattrsCollection getXattrValue:error:].cold.1();

      }
      v12 = v10;
      goto LABEL_23;
    }
LABEL_14:
    v12 = 0;
    goto LABEL_23;
  }
  sizeLimit = self->_sizeLimit;
  if ((sizeLimit & 0x8000000000000000) == 0 && self->_cacheSize >= sizeLimit)
  {
    brc_bread_crumbs();
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v22;
      _os_log_impl(&dword_230455000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Do not attempt to get xattr size cache is full%@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  fd = self->_fd;
  v15 = objc_retainAutorelease(v6);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");
  v17 = self->_sizeLimit - self->_cacheSize;
  v33 = 0;
  BRCGetXattrValue(fd, v16, v17, &v33);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v18 = v33;
  v19 = v18;
  if (v12)
  {
    -[NSMutableDictionary setObject:forKey:](self->_cachedXattrs, "setObject:forKey:", v12, v15);
    v20 = objc_msgSend(v15, "length");
    self->_cacheSize += objc_msgSend(v12, "length") + v20;
    v21 = v12;
  }
  else
  {
    v24 = v18;
    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        v30 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v35 = "-[BRCLazyXattrsCollection getXattrValue:error:]";
        v36 = 2080;
        if (!a4)
          v30 = "(ignored by caller)";
        v37 = v30;
        v38 = 2112;
        v39 = v24;
        v40 = 2112;
        v41 = v25;
        _os_log_error_impl(&dword_230455000, v26, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v24);

    if (!*a4)
    {
      v27 = self->_cachedXattrs;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, v15);

    }
  }

LABEL_23:
  return v12;
}

- (void)clearCache
{
  -[NSMutableDictionary removeAllObjects](self->_cachedXattrs, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedXattrs, 0);
  objc_storeStrong((id *)&self->_xattrNamesData, 0);
  objc_storeStrong((id *)&self->_xattrNamesList, 0);
}

- (void)initWithFD:(NSObject *)a3 sizeLimit:syncable:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_8_0(&dword_230455000, a3, (uint64_t)a3, "[ERROR] Xattr name list exceed size limit %ld%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (void)getXattrValue:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [cached isKindOfClass:[NSData class]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
