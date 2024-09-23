@implementation UMFilesystemProvider

- (BOOL)fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, a4);

  return (char)a4;
}

- (id)dataWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  int v24;
  void *v25;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  id v34;
  id v35;
  int v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a4)
    *a4 = 0;
  v35 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v5, 0, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v35;
  v8 = v7;
  if (v6)
  {
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v9 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = sub_249998C68();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if (v11)
      {
        v36 = 138412290;
        v37 = v5;
        v12 = _os_log_send_and_compose_impl();
        v13 = (void *)v12;
        if (v12)
          sub_249998C90(v12);
      }
      else
      {
        v13 = 0;
      }
      free(v13);
    }

    goto LABEL_28;
  }
  if (!a4 || !v7)
    goto LABEL_28;
  objc_msgSend(v7, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDD1398];
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v8, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDD1128]);

    if (v20)
    {
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v21 = (id)qword_2544B43D8;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      v22 = sub_249998C68();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        v22 &= ~1u;
      if (v22)
      {
        v23 = v21;
        v24 = objc_msgSend(v18, "code");
        v36 = 138543618;
        v37 = v5;
        v38 = 1024;
        LODWORD(v39) = v24;
        v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25)
          goto LABEL_48;
        goto LABEL_46;
      }
    }
    else
    {
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v21 = (id)qword_2544B43D8;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_49;
      v32 = sub_249998C68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        v33 = v32;
      else
        v33 = v32 & 0xFFFFFFFE;
      if (v33)
      {
        v36 = 138543618;
        v37 = v5;
        v38 = 2114;
        v39 = v18;
        v25 = (void *)_os_log_send_and_compose_impl();
        if (!v25)
        {
LABEL_48:
          free(v25);
LABEL_49:

          v34 = objc_retainAutorelease(v18);
          *a4 = v34;

          goto LABEL_28;
        }
LABEL_46:
        sub_249998C90((uint64_t)v25);
        goto LABEL_48;
      }
    }
    v25 = 0;
    goto LABEL_48;
  }
  if (qword_2544B43E8 != -1)
    dispatch_once(&qword_2544B43E8, &unk_251AD4838);
  v27 = (id)qword_2544B43D8;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = sub_249998C68();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      v29 = v28;
    else
      v29 = v28 & 0xFFFFFFFE;
    if (v29)
    {
      v36 = 138543618;
      v37 = v5;
      v38 = 2114;
      v39 = v8;
      v30 = _os_log_send_and_compose_impl();
      v31 = (void *)v30;
      if (v30)
        sub_249998C90(v30);
    }
    else
    {
      v31 = 0;
    }
    free(v31);
  }

  *a4 = objc_retainAutorelease(v8);
LABEL_28:

  return v6;
}

- (BOOL)atomicallyWriteData:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  int v12;
  int v13;
  id v14;
  ssize_t v15;
  ssize_t v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  int v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  id v41;
  const char *v42;
  id v43;
  const std::__fs::filesystem::path *v44;
  id v45;
  const std::__fs::filesystem::path *v46;
  std::error_code *v47;
  int v48;
  int v49;
  NSObject *v50;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  void *v54;
  int v55;
  NSObject *v56;
  unsigned int v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  void *v72;
  int v73;
  NSObject *v74;
  unsigned int v75;
  unsigned int v76;
  uint64_t v77;
  void *v78;
  id v79;
  int v80;
  NSObject *v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t v84;
  void *v85;
  int *v87;
  uint64_t v88;
  id v89;
  int v90;
  id v91;
  __int16 v92;
  _BYTE v93[14];
  __int16 v94;
  ssize_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a5)
    *a5 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.writing"), v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (unlink((const char *)objc_msgSend(v9, "UTF8String")))
  {
    v10 = *__error();
    if (v10 != 2)
    {
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v21 = (id)qword_2544B43D8;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_44;
      v22 = sub_249998C68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        v23 = v22;
      else
        v23 = v22 & 0xFFFFFFFE;
      if (v23)
      {
        v90 = 138543874;
        v91 = v8;
        v92 = 2114;
        *(_QWORD *)v93 = v9;
        *(_WORD *)&v93[8] = 1024;
        *(_DWORD *)&v93[10] = v10;
        goto LABEL_32;
      }
LABEL_42:
      v27 = 0;
LABEL_43:
      free(v27);
LABEL_44:

      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v10, 0);
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_138;
    }
  }
  v11 = objc_retainAutorelease(v9);
  v12 = open_dprotected_np((const char *)objc_msgSend(v11, "UTF8String"), 3585, 4, 0, 420);
  if (v12 == -1)
  {
    v10 = *__error();
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v21 = (id)qword_2544B43D8;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    v24 = sub_249998C68();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      v25 = v24;
    else
      v25 = v24 & 0xFFFFFFFE;
    if (v25)
    {
      v90 = 138543874;
      v91 = v8;
      v92 = 2114;
      *(_QWORD *)v93 = v11;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v10;
LABEL_32:
      v26 = _os_log_send_and_compose_impl();
      v27 = (void *)v26;
      if (v26)
        sub_249998C90(v26);
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  v13 = v12;
  v14 = objc_retainAutorelease(v7);
  v15 = write(v13, (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
  if (v15 < 0)
  {
    v28 = *__error();
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v29 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = sub_249998C68();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        v30 &= ~1u;
      if (v30)
      {
        v31 = v29;
        v90 = 138544130;
        v91 = v8;
        v92 = 1024;
        *(_DWORD *)v93 = v13;
        *(_WORD *)&v93[4] = 2048;
        *(_QWORD *)&v93[6] = objc_msgSend(v14, "length");
        v94 = 1024;
        LODWORD(v95) = v28;
        LODWORD(v88) = 34;
        v87 = &v90;
        v32 = (void *)_os_log_send_and_compose_impl();

        if (v32)
          sub_249998C90((uint64_t)v32);
      }
      else
      {
        v32 = 0;
      }
      free(v32);
    }

    if (a5)
    {
      v34 = v28;
LABEL_90:
      v61 = (void *)MEMORY[0x24BDD1540];
      v62 = *MEMORY[0x24BDD1128];
LABEL_91:
      objc_msgSend(v61, "errorWithDomain:code:userInfo:", v62, v34, 0, v87, v88);
      v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_125;
    }
    goto LABEL_124;
  }
  v16 = v15;
  if (v15 != objc_msgSend(v14, "length"))
  {
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v17 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v89 = v7;
      v18 = sub_249998C68();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        v18 &= ~1u;
      if (v18)
      {
        v19 = v17;
        v90 = 138544130;
        v91 = v8;
        v92 = 1024;
        *(_DWORD *)v93 = v13;
        *(_WORD *)&v93[4] = 2048;
        *(_QWORD *)&v93[6] = objc_msgSend(v14, "length");
        v94 = 2048;
        v95 = v16;
        LODWORD(v88) = 38;
        v87 = &v90;
        v20 = (void *)_os_log_send_and_compose_impl();

        if (v20)
          sub_249998C90((uint64_t)v20);
      }
      else
      {
        v20 = 0;
      }
      v7 = v89;
      free(v20);
    }

  }
  if (!fsync(v13))
  {
    v41 = objc_retainAutorelease(v11);
    v42 = (const char *)objc_msgSend(v41, "UTF8String");
    v43 = objc_retainAutorelease(v8);
    if (renamex_np(v42, (const char *)objc_msgSend(v43, "UTF8String"), 2u))
    {
      v35 = *__error();
      if (v35 != 2)
      {
        if (qword_2544B43E8 != -1)
          dispatch_once(&qword_2544B43E8, &unk_251AD4838);
        v63 = (id)qword_2544B43D8;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = sub_249998C68();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            v65 = v64;
          else
            v65 = v64 & 0xFFFFFFFE;
          if (v65)
          {
            v90 = 138543618;
            v91 = v43;
            v92 = 1024;
            *(_DWORD *)v93 = v35;
            LODWORD(v88) = 18;
            v87 = &v90;
            v66 = _os_log_send_and_compose_impl();
            v67 = (void *)v66;
            if (v66)
              sub_249998C90(v66);
          }
          else
          {
            v67 = 0;
          }
          free(v67);
        }

        if (a5)
          goto LABEL_89;
        goto LABEL_124;
      }
      v44 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
      v45 = objc_retainAutorelease(v43);
      v46 = (const std::__fs::filesystem::path *)objc_msgSend(v45, "UTF8String");
      rename(v44, v46, v47);
      if (v48)
      {
        v49 = *__error();
        if (qword_2544B43E8 != -1)
          dispatch_once(&qword_2544B43E8, &unk_251AD4838);
        v50 = (id)qword_2544B43D8;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = sub_249998C68();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            v52 = v51;
          else
            v52 = v51 & 0xFFFFFFFE;
          if (v52)
          {
            v90 = 138543874;
            v91 = v45;
            v92 = 1024;
            *(_DWORD *)v93 = 2;
            *(_WORD *)&v93[4] = 1024;
            *(_DWORD *)&v93[6] = v49;
            LODWORD(v88) = 24;
            v87 = &v90;
            v53 = _os_log_send_and_compose_impl();
            v54 = (void *)v53;
            if (v53)
              sub_249998C90(v53);
          }
          else
          {
            v54 = 0;
          }
          free(v54);
        }

        if (a5)
        {
          v61 = (void *)MEMORY[0x24BDD1540];
          v62 = *MEMORY[0x24BDD1128];
          v34 = 2;
          goto LABEL_91;
        }
        goto LABEL_124;
      }
    }
    if (fcntl(v13, 85, v87, v88))
    {
      v55 = *__error();
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v56 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = sub_249998C68();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          v58 = v57;
        else
          v58 = v57 & 0xFFFFFFFE;
        if (v58)
        {
          v90 = 138543874;
          v91 = v43;
          v92 = 1024;
          *(_DWORD *)v93 = v13;
          *(_WORD *)&v93[4] = 1024;
          *(_DWORD *)&v93[6] = v55;
          v59 = _os_log_send_and_compose_impl();
          v60 = (void *)v59;
          if (v59)
            sub_249998C90(v59);
        }
        else
        {
          v60 = 0;
        }
        free(v60);
      }

    }
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v68 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      v69 = sub_249998C68();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        v70 = v69;
      else
        v70 = v69 & 0xFFFFFFFE;
      if (v70)
      {
        v90 = 138543362;
        v91 = v43;
        v71 = _os_log_send_and_compose_impl();
        v72 = (void *)v71;
        if (v71)
          sub_249998C90(v71);
      }
      else
      {
        v72 = 0;
      }
      free(v72);
    }

    v33 = 1;
    goto LABEL_125;
  }
  v35 = *__error();
  if (qword_2544B43E8 != -1)
    dispatch_once(&qword_2544B43E8, &unk_251AD4838);
  v36 = (id)qword_2544B43D8;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = sub_249998C68();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      v38 = v37;
    else
      v38 = v37 & 0xFFFFFFFE;
    if (v38)
    {
      v90 = 138543874;
      v91 = v8;
      v92 = 1024;
      *(_DWORD *)v93 = v13;
      *(_WORD *)&v93[4] = 1024;
      *(_DWORD *)&v93[6] = v35;
      LODWORD(v88) = 24;
      v87 = &v90;
      v39 = _os_log_send_and_compose_impl();
      v40 = (void *)v39;
      if (v39)
        sub_249998C90(v39);
    }
    else
    {
      v40 = 0;
    }
    free(v40);
  }

  if (a5)
  {
LABEL_89:
    v34 = v35;
    goto LABEL_90;
  }
LABEL_124:
  v33 = 0;
LABEL_125:
  if (close(v13))
  {
    v73 = *__error();
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v74 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = sub_249998C68();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        v76 = v75;
      else
        v76 = v75 & 0xFFFFFFFE;
      if (v76)
      {
        v90 = 138543874;
        v91 = v8;
        v92 = 1024;
        *(_DWORD *)v93 = v13;
        *(_WORD *)&v93[4] = 1024;
        *(_DWORD *)&v93[6] = v73;
        v77 = _os_log_send_and_compose_impl();
        v78 = (void *)v77;
        if (v77)
          sub_249998C90(v77);
      }
      else
      {
        v78 = 0;
      }
      free(v78);
    }

  }
LABEL_138:
  v79 = objc_retainAutorelease(v9);
  if (unlink((const char *)objc_msgSend(v79, "UTF8String")))
  {
    v80 = *__error();
    if (v80 != 2)
    {
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v81 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v82 = sub_249998C68();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          v83 = v82;
        else
          v83 = v82 & 0xFFFFFFFE;
        if (v83)
        {
          v90 = 138543874;
          v91 = v8;
          v92 = 2114;
          *(_QWORD *)v93 = v79;
          *(_WORD *)&v93[8] = 1024;
          *(_DWORD *)&v93[10] = v80;
          v84 = _os_log_send_and_compose_impl();
          v85 = (void *)v84;
          if (v84)
            sub_249998C90(v84);
        }
        else
        {
          v85 = 0;
        }
        free(v85);
      }

    }
  }

  return v33;
}

- (int)openFileForAppendingAtPath:(id)a3 error:(id *)a4
{
  int v5;
  int *v6;

  if (a4)
    *a4 = 0;
  v5 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 777, 4, 0, 420);
  if (v5 == -1)
  {
    v6 = __error();
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v6, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (void)closeFileWithDescriptor:(int)a3
{
  close(a3);
}

- (BOOL)writeToFileWithDescriptor:(int)a3 string:(id)a4 error:(id *)a5
{
  id v7;
  const void *v8;
  size_t v9;
  ssize_t v10;
  int *v11;

  if (a5)
    *a5 = 0;
  v7 = objc_retainAutorelease(a4);
  v8 = (const void *)objc_msgSend(v7, "UTF8String");
  v9 = objc_msgSend(v7, "length");

  v10 = write(a3, v8, v9);
  if (v10 == -1)
  {
    v11 = __error();
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v11, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v10 != -1;
}

- (int64_t)sizeOfFileWithDescriptor:(int)a3 error:(id *)a4
{
  int *v5;
  stat v7;

  if (a4)
    *a4 = 0;
  memset(&v7, 0, sizeof(v7));
  if (!fstat(a3, &v7))
    return v7.st_size;
  v5 = __error();
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return -1;
}

- (BOOL)renameFileFromPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const std::__fs::filesystem::path *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  std::error_code *v12;
  int v13;
  int v14;
  int *v15;

  if (a5)
    *a5 = 0;
  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = (const std::__fs::filesystem::path *)objc_msgSend(v7, "UTF8String");
  v10 = objc_retainAutorelease(v8);
  v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "UTF8String");

  rename(v9, v11, v12);
  v14 = v13;
  if (v13)
  {
    v15 = __error();
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v15, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v14 == 0;
}

- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  BOOL v20;

  v5 = a3;
  if (a4)
    *a4 = 0;
  v6 = objc_retainAutorelease(v5);
  if (!unlink((const char *)objc_msgSend(v6, "UTF8String")))
  {
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v7 = (id)qword_2544B43D8;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    v10 = sub_249998C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      v11 = v10;
    else
      v11 = v10 & 0xFFFFFFFE;
    if (v11)
    {
LABEL_20:
      v12 = _os_log_send_and_compose_impl();
      v13 = (void *)v12;
      if (v12)
        sub_249998C90(v12);
      goto LABEL_32;
    }
LABEL_31:
    v13 = 0;
LABEL_32:
    free(v13);
LABEL_33:

    v20 = 1;
    goto LABEL_39;
  }
  if (*__error() == 2)
  {
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v7 = (id)qword_2544B43D8;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    v8 = sub_249998C68();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      v9 = v8;
    else
      v9 = v8 & 0xFFFFFFFE;
    if (v9)
      goto LABEL_20;
    goto LABEL_31;
  }
  v14 = *__error();
  if (qword_2544B43E8 != -1)
    dispatch_once(&qword_2544B43E8, &unk_251AD4838);
  v15 = (id)qword_2544B43D8;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_249998C68();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v17 = v16;
    else
      v17 = v16 & 0xFFFFFFFE;
    if (v17)
    {
      v18 = _os_log_send_and_compose_impl();
      v19 = (void *)v18;
      if (v18)
        sub_249998C90(v18);
    }
    else
    {
      v19 = 0;
    }
    free(v19);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v14, 0);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_39:

  return v20;
}

- (BOOL)removePath:(id)a3 error:(id *)a4
{
  id v6;
  _removefile_state *v7;

  v6 = a3;
  v7 = removefile_state_alloc();
  LOBYTE(a4) = sub_249996704((uint64_t)self, v6, v7, a4);

  removefile_state_free(v7);
  return (char)a4;
}

- (BOOL)chownPath:(id)a3 toUser:(unsigned int)a4 group:(unsigned int)a5 error:(id *)a6
{
  id v9;
  id v10;
  int v11;
  int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;

  v9 = a3;
  if (a6)
    *a6 = 0;
  v10 = objc_retainAutorelease(v9);
  v11 = lchown((const char *)objc_msgSend(v10, "UTF8String"), a4, a5);
  if (v11)
  {
    v12 = *__error();
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v13 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_249998C68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v16 = _os_log_send_and_compose_impl();
        v17 = (void *)v16;
        if (v16)
          sub_249998C90(v16);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v12, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11 == 0;
}

- (BOOL)chmodPath:(id)a3 withMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  if (a5)
    *a5 = 0;
  v8 = objc_retainAutorelease(v7);
  v9 = chmod((const char *)objc_msgSend(v8, "UTF8String"), a4);
  if (v9)
  {
    v10 = *__error();
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v11 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = sub_249998C68();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if (v13)
      {
        v14 = _os_log_send_and_compose_impl();
        v15 = (void *)v14;
        if (v14)
          sub_249998C90(v14);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v10, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9 == 0;
}

- (BOOL)fixupPath:(id)a3 withMode:(unsigned __int16)a4 toUser:(unsigned int)a5 group:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  BOOL v20;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a3;
  if (a7)
    *a7 = 0;
  v13 = objc_retainAutorelease(v12);
  if (lchmod((const char *)objc_msgSend(v13, "UTF8String"), a4))
  {
    v14 = *__error();
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v15 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_249998C68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if (v17)
      {
        v18 = _os_log_send_and_compose_impl();
        v19 = (void *)v18;
        if (v18)
          sub_249998C90(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v14, 0);
      v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = -[UMFilesystemProvider chownPath:toUser:group:error:](self, "chownPath:toUser:group:error:", v13, v9, v8, a7);
  }

  return v20;
}

- (BOOL)makePath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  if (a5)
    *a5 = 0;
  v8 = objc_retainAutorelease(v7);
  v9 = mkpath_np((const char *)objc_msgSend(v8, "UTF8String"), a4);
  if (v9)
  {
    if (qword_2544B43E8 != -1)
      dispatch_once(&qword_2544B43E8, &unk_251AD4838);
    v10 = (id)qword_2544B43D8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_249998C68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        v12 = v11;
      else
        v12 = v11 & 0xFFFFFFFE;
      if (v12)
      {
        v13 = _os_log_send_and_compose_impl();
        v14 = (void *)v13;
        if (v13)
          sub_249998C90(v13);
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v9, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9 == 0;
}

- (BOOL)clonePath:(id)a3 toPath:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  _copyfile_state *v12;
  id v13;
  const char *v14;
  id v15;
  int v16;
  int v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int *v32;
  uint64_t v33;
  int v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (a5)
    *a5 = 0;
  v11 = a6;
  v12 = copyfile_state_alloc();
  copyfile_state_set(v12, 7u, v11);

  copyfile_state_set(v12, 6u, sub_249997EAC);
  v13 = objc_retainAutorelease(v9);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  v15 = objc_retainAutorelease(v10);
  v16 = copyfile(v14, (const char *)objc_msgSend(v15, "UTF8String"), v12, 0xC800Fu);
  copyfile_state_free(v12);
  if (v16)
  {
    v17 = *__error();
    if (v17)
    {
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v18 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = sub_249998C68();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          v20 = v19;
        else
          v20 = v19 & 0xFFFFFFFE;
        if (v20)
        {
          v34 = 138543874;
          v35 = v13;
          v36 = 2114;
          v37 = v15;
          v38 = 1024;
          v39 = v17;
          LODWORD(v33) = 28;
          v32 = &v34;
          v21 = _os_log_send_and_compose_impl();
          v22 = (void *)v21;
          if (v21)
            sub_249998C90(v21);
        }
        else
        {
          v22 = 0;
        }
        free(v22);
      }

      if (a5)
      {
        v28 = v17;
        v29 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD1128];
LABEL_31:
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v28, 0, v32, v33);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (qword_2544B43E8 != -1)
        dispatch_once(&qword_2544B43E8, &unk_251AD4838);
      v23 = (id)qword_2544B43D8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = sub_249998C68();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          v25 = v24;
        else
          v25 = v24 & 0xFFFFFFFE;
        if (v25)
        {
          v34 = 138543618;
          v35 = v13;
          v36 = 2114;
          v37 = v15;
          LODWORD(v33) = 22;
          v32 = &v34;
          v26 = _os_log_send_and_compose_impl();
          v27 = (void *)v26;
          if (v26)
            sub_249998C90(v26);
        }
        else
        {
          v27 = 0;
        }
        free(v27);
      }

      if (a5)
      {
        v29 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD1128];
        v28 = 89;
        goto LABEL_31;
      }
    }
  }

  return v16 == 0;
}

@end
