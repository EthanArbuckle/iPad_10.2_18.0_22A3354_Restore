@implementation BRCDocumentSignatureCalculator

+ (id)calculateSignatureForURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v22;
  char v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE17660];
  objc_msgSend(v9, "_scope");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v11, "consumeSandboxExtension:error:", v12, a5);
  if (v13 < 0)
  {
    v17 = 0;
  }
  else
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v15, &v23);

    if (v16)
    {
      if (v23)
        objc_msgSend(a1, "_calculateSignatureForPackageAtURL:boundaryKey:error:", v10, v8, a5);
      else
        objc_msgSend(a1, "_calculateSignatureForFileAtURL:boundaryKey:error:", v10, v8, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        brc_bread_crumbs();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          v22 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v25 = "+[BRCDocumentSignatureCalculator calculateSignatureForURL:boundaryKey:error:]";
          v26 = 2080;
          if (!a5)
            v22 = "(ignored by caller)";
          v27 = v22;
          v28 = 2112;
          v29 = v18;
          v30 = 2112;
          v31 = v19;
          _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v18);

      v17 = 0;
    }
    objc_msgSend(MEMORY[0x24BE17660], "releaseSandboxExtensionHandle:", v13);
  }

  return v17;
}

+ (id)_calculateSignatureForPackageAtURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  BRCFSPackageEnumerator *v9;
  id *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const char *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__49;
  v34 = __Block_byref_object_dispose__49;
  v35 = 0;
  v9 = [BRCFSPackageEnumerator alloc];
  v10 = (id *)(v31 + 5);
  obj = (id)v31[5];
  v11 = -[BRCFSPackageEnumerator initForURL:boundaryKey:error:](v9, "initForURL:boundaryKey:error:", v7, v8, &obj);
  objc_storeStrong(v10, obj);
  v12 = (void *)v31[5];
  if (v12)
  {
    v13 = v12;
    v14 = 0;
  }
  else
  {
    v15 = (void *)objc_opt_new();
    v16 = (void *)objc_opt_new();
    v17 = (id *)(v31 + 5);
    v28 = (id)v31[5];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke;
    v24[3] = &unk_24FE491C0;
    v18 = v16;
    v25 = v18;
    v14 = v15;
    v26 = v14;
    v27 = &v30;
    objc_msgSend(v11, "enumeratePackageItemsWithSortOrder:error:usingBlock:", 2, &v28, v24);
    objc_storeStrong(v17, v28);
    objc_msgSend(v14, "done");

    v13 = (id)v31[5];
    if (!v13)
      goto LABEL_6;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
  {
    v23 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    v37 = "+[BRCDocumentSignatureCalculator _calculateSignatureForPackageAtURL:boundaryKey:error:]";
    v38 = 2080;
    if (!a5)
      v23 = "(ignored by caller)";
    v39 = v23;
    v40 = 2112;
    v41 = v13;
    v42 = 2112;
    v43 = v19;
    _os_log_error_impl(&dword_230455000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
  }

LABEL_6:
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  if (v31[5])
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v14, "signature");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v30, 8);
  return v21;
}

void __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  NSObject *v13;
  id obj;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "updateWithPkgItem:", a2);
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "addItem:error:", v9, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "clear");
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke_cold_1(v7, (uint64_t)v12, v13);

    *a4 = 1;
  }

}

+ (id)_calculateSignatureForFileAtURL:(id)a3 boundaryKey:(id)a4 error:(id *)a5
{
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  const char *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  v10 = objc_msgSend(MEMORY[0x24BE17660], "open:flags:", v8, 33028);
  if ((v10 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorFromErrno");
    v13 = objc_claimAutoreleasedReturnValue();
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413058;
      v23 = (const char *)a1;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      _os_log_error_impl(&dword_230455000, v15, (os_log_type_t)0x90u, "[ERROR] %@ - Failed opening contents at '%@'. Error: %@%@", buf, 0x2Au);
    }

    v12 = 0;
  }
  else
  {
    v11 = v10;
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDB9248], "br_signatureWithFileDescriptor:boundaryKey:error:", v10, v9, &v21);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (uint64_t)v21;
    if (!(v12 | v13))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithPOSIXCode:", 22);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BE17660], "closeFD:", v11);
  }
  v16 = (id)v13;
  if (v16)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      v20 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v23 = "+[BRCDocumentSignatureCalculator _calculateSignatureForFileAtURL:boundaryKey:error:]";
      v24 = 2080;
      if (!a5)
        v20 = "(ignored by caller)";
      v25 = v20;
      v26 = 2112;
      v27 = (uint64_t)v16;
      v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a5)
    *a5 = objc_retainAutorelease(v16);

  return (id)v12;
}

void __87__BRCDocumentSignatureCalculator__calculateSignatureForPackageAtURL_boundaryKey_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_obfuscatedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_230455000, a3, (os_log_type_t)0x90u, "[ERROR] Couldn't add item for checksumming at %@%@", (uint8_t *)&v7, 0x16u);

}

@end
