@implementation HSPipeUtil

+ (int)HSPipeUtilExecCommandWithData:(id)a3 options:(id)a4 data:(id)a5 response:(id *)a6 error:(id *)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  const char **v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  int v41;
  void *v42;
  void *v43;
  BOOL v44;
  uint64_t v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v62;

  v9 = a3;
  v10 = a4;
  v58 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Enter %s at line %d\n"), "+[HSPipeUtil HSPipeUtilExecCommandWithData:options:data:response:error:]", 289));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);

  v62 = v10;
  v19 = objc_msgSend(v10, "count");
  v20 = (int)v19;
  v57 = (_QWORD)v19 << 32;
  v21 = (const char **)malloc_type_malloc((((_QWORD)v19 << 32) + 0x200000000) >> 29, 0x50040EE9192B6uLL);
  v59 = objc_retainAutorelease(v9);
  *v21 = (const char *)objc_msgSend(v59, "UTF8String");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("argv[0] = %s\n"), *v21, 289, v55));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);

  if (v20 >= 1)
  {
    v30 = 1;
    do
    {
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v30 - 1)));
      v21[v30] = (const char *)objc_msgSend(v31, "UTF8String");

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastPathComponent"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("argv[%d] = %s\n"), v30, v21[v30], v56));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v34, v35, v36, v37, v38, v39, (uint64_t)v33);

      ++v30;
    }
    while (v20 + 1 != v30);
  }
  *(const char **)((char *)v21 + (((uint64_t)&_mh_execute_header + v57) >> 29)) = 0;
  v40 = objc_retainAutorelease(v58);
  v41 = sub_100004418(v21, (char *)objc_msgSend(v40, "bytes"), (int64_t)objc_msgSend(v40, "length"), a6, a7);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastPathComponent"));
  v44 = v41 == 0;
  v45 = 7;
  if (v41)
    v46 = 7;
  else
    v46 = 0;
  if (v44)
    v45 = 0;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exit %s at line %d, success = %d\n"), "+[HSPipeUtil HSPipeUtilExecCommandWithData:options:data:response:error:]", 307, v45));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v48, v49, v50, v51, v52, v53, (uint64_t)v43);

  free(v21);
  return v46;
}

+ (int)HSPipeUtilExecCommand:(id)a3 options:(id)a4 response:(id *)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int v20;
  uint64_t v21;
  const char **v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Enter %s at line %d\n"), "+[HSPipeUtil HSPipeUtilExecCommand:options:response:error:]", 319));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v13, v14, v15, v16, v17, v18, (uint64_t)v11);

  v19 = objc_msgSend(v9, "count");
  v20 = (int)v19;
  v21 = (_QWORD)v19 << 32;
  v22 = (const char **)malloc_type_malloc((((_QWORD)v19 << 32) + 0x200000000) >> 29, 0x50040EE9192B6uLL);
  v23 = objc_retainAutorelease(v8);
  *v22 = (const char *)objc_msgSend(v23, "UTF8String");
  if (v20 >= 1)
  {
    v24 = 0;
    v25 = (v20 + 1) - 1;
    do
    {
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v24)));
      v22[v24 + 1] = (const char *)objc_msgSend(v26, "UTF8String");

      ++v24;
    }
    while (v25 != v24);
  }
  *(const char **)((char *)v22 + (((uint64_t)&_mh_execute_header + v21) >> 29)) = 0;
  v27 = sub_100004FC4(v22, a5, a6);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
  v30 = v27 == 0;
  v31 = 7;
  if (v27)
    v32 = 7;
  else
    v32 = 0;
  if (v30)
    v31 = 0;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Exit %s at line %d, success = %d\n"), "+[HSPipeUtil HSPipeUtilExecCommand:options:response:error:]", 335, v31));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v34, v35, v36, v37, v38, v39, (uint64_t)v29);

  free(v22);
  return v32;
}

@end
