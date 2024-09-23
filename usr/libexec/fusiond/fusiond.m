uint64_t sub_100003B98(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = qword_100014C50;
  if (!qword_100014C50)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100011ED8, "objectForKeyedSubscript:", a1));

    if (v3)
      result = 73400320;
    else
      result = 10485760;
    qword_100014C50 = result;
  }
  return result;
}

NSMutableDictionary *sub_100003BEC()
{
  return +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &off_100011F00, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), 0, CFSTR("Data"), 0);
}

id sub_100003C50(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a1));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("Status"));

  if (v9)
    v12 = v9;
  else
    v12 = &stru_1000108C0;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("Error"));

  if (v8)
    v13 = v8;
  else
    v13 = &stru_1000108C0;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("Output"));

  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("Data"));

  return v10;
}

id sub_100003E30(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
  v3 = objc_msgSend(v1, "code");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "localizedDescription"));

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSError domain:%@, error code: %d. Description: %@"), v2, v3, v4)));
  v6 = objc_msgSend(v5, "UTF8String");

  return v6;
}

id sub_100003ED8(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  _QWORD v9[5];

  if (!a1)
    return 0;
  v1 = a1;
  v8 = 0;
  v2 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v1, &v8);

  v3 = v8;
  NSLog(CFSTR("Unarchive Error : %@"), v3);
  if (v3)
    NSLog(CFSTR("Error : %@"), v3);
  objc_msgSend(v2, "setDecodingFailurePolicy:", 0);
  v9[0] = objc_opt_class(NSData);
  v9[1] = objc_opt_class(NSDictionary);
  v9[2] = objc_opt_class(NSString);
  v9[3] = objc_opt_class(NSArray);
  v9[4] = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "decodeObjectOfClasses:forKey:", v5, CFSTR("HSArchiverKey")));

  objc_msgSend(v2, "finishDecoding");
  NSLog(CFSTR("recvDict : %@"), v6);
  NSLog(CFSTR("err : %@"), v3);

  return v6;
}

id sub_100004088(void *a1)
{
  id v1;
  id v2;
  void *v3;

  if (a1)
  {
    v1 = a1;
    v2 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    objc_msgSend(v2, "encodeObject:forKey:", v1, CFSTR("HSArchiverKey"));

    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "encodedData"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id sub_100004104(void *a1)
{
  id v1;
  id v2;
  char *v3;
  void *v4;
  char *i;
  unsigned __int8 v7;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2)
  {
    v3 = (char *)v2;
    v7 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * (_QWORD)v2));
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(v1, "getBytes:range:", &v7, i, 1);
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id sub_1000041B4(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;
  uint64_t v7;

  v1 = a1;
  if ((objc_msgSend(v1, "length") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    if (objc_msgSend(v1, "length"))
    {
      v3 = 0;
      do
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringWithRange:", v3, 2));
        v7 = 0;
        v5 = objc_retainAutorelease(v4);
        sscanf((const char *)objc_msgSend(v5, "UTF8String"), "%lx", &v7);
        objc_msgSend(v2, "appendFormat:", CFSTR("%c"), (char)v7);

        v3 += 2;
      }
      while (v3 < (unint64_t)objc_msgSend(v1, "length"));
    }
  }

  return v2;
}

NSMutableData *sub_1000042A0(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSMutableData *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  id v11;
  char v12;
  int v13;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("0x"), &stru_1000108C0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("0X"), &stru_1000108C0));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1000108C0));
  v4 = objc_msgSend(v3, "length");
  if ((v4 & 1) != 0)
  {
    v10 = CFSTR("Text does not have 2-digit hex chars for every byte");
    goto LABEL_8;
  }
  v5 = objc_opt_new(NSMutableData);
  if (v4)
  {
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v6, 2));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v7));
      v13 = 0;
      if ((objc_msgSend(v8, "scanHexInt:", &v13) & 1) == 0)
        break;
      v12 = v13;
      -[NSMutableData appendBytes:length:](v5, "appendBytes:length:", &v12, 1);

      v6 += 2;
      if ((unint64_t)v4 <= v6)
        goto LABEL_6;
    }
    v10 = CFSTR("Text has illegal hexadecimal characters");
LABEL_8:
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("IllegalInput"), v10, 0)));
    objc_exception_throw(v11);
  }
LABEL_6:

  return v5;
}

uint64_t sub_100004418(const char **a1, char *a2, int64_t a3, _QWORD *a4, id *a5)
{
  void *v8;
  void *v9;
  void (__cdecl *v10)(int);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  ssize_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  const char *v27;
  int *v28;
  NSString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  ssize_t v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  pid_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  int *v73;
  NSString *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  CFDictionaryRef (__cdecl **v85)(CFAllocatorRef, const void **, const void **, CFIndex, const CFDictionaryKeyCallBacks *, const CFDictionaryValueCallBacks *);
  void *v86;
  id *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  int v128;
  int __fd[2];
  _BYTE v130[1024];

  *(_QWORD *)__fd = 0;
  if (!a4)
  {
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "lastPathComponent"));
    v119 = 115;
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Input response dictionary pointer is NULL.")));
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v113, v114, v115, v116, v117, v118, (uint64_t)v112);

    v9 = 0;
    v20 = 0xFFFFFFFFLL;
    v87 = a5;
LABEL_27:
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "lastPathComponent"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error executing command with data, result = %d\n"), v20, v119));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v91, v92, v93, v94, v95, v96, (uint64_t)v89);

    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error executing command with data, result = %d\n"), v20, 195, v90));
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v97, NSLocalizedDescriptionKey, 0));
    if (v87)
    {
      v99 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("HSErrorDomain"), 7, v98);
      *v87 = v99;
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "localizedDescription"));
      objc_msgSend(v9, "setObject:forKey:", v100, CFSTR("Error"));

      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "lastPathComponent"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v87, "localizedDescription"));
      v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v103));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v104, v105, v106, v107, v108, v109, (uint64_t)v102);

    }
    goto LABEL_30;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v8, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), 0, CFSTR("Data"), 0));

  v10 = signal(13, (void (__cdecl *)(int))1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("entering hs_execute_command_with_input_data: %s (%p - %zu)\n"), *a1, a2, a3));
  v119 = 120;
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v14, v15, v16, v17, v18, v19, (uint64_t)v12);

  v20 = 0xFFFFFFFFLL;
  __fd[0] = -1;
  v21 = sub_100004C64(a1, &__fd[1], 0, __fd);
  if (v21 != -1 && __fd[0] != -1)
  {
    v22 = v21;
    if (a3 >= 1)
    {
      while (1)
      {
        v23 = write(__fd[0], a2, a3);
        if (v23 == -1)
          break;
        a2 += v23;
        v24 = a3 <= v23;
        a3 -= v23;
        if (v24)
          goto LABEL_10;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastPathComponent"));
      v27 = *a1;
      v28 = __error();
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("write failed for %s: %s\n"), v27, strerror(*v28), v13);
      v120 = (void *)objc_claimAutoreleasedReturnValue(v29);
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v30, v31, v32, v33, v34, v35, (uint64_t)v26);

    }
LABEL_10:
    close(__fd[0]);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "lastPathComponent"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start Reading output from shell command\n")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v38, v39, v40, v41, v42, v43, (uint64_t)v37);

    v44 = objc_alloc_init((Class)NSMutableString);
    v45 = read(v22, v130, 0x3FFuLL);
    if (v45 >= 1)
    {
      do
      {
        v130[v45] = 0;
        v46 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v130);
        objc_msgSend(v44, "appendString:", v46);

        v45 = read(v22, v130, 0x3FFuLL);
      }
      while (v45 > 0);
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lastPathComponent"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waiting for child to exit\n")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v49, v50, v51, v52, v53, v54, (uint64_t)v48);

    v128 = 0;
    v55 = waitpid(__fd[1], &v128, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastPathComponent"));
    if (v55 == -1)
    {
      v72 = *a1;
      v73 = __error();
      v74 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waitpid failed for %s: %s\n"), v72, strerror(*v73), v122);
      v70 = (void *)objc_claimAutoreleasedReturnValue(v74);
      v71 = 179;
    }
    else
    {
      v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("child exited\n")));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v58, v59, v60, v61, v62, v63, (uint64_t)v57);

      if ((v128 & 0x7F) == 0)
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "lastPathComponent"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("exit status: %d\n"), BYTE1(v128), 165, v123));
        v119 = 168;
        sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v78, v79, v80, v81, v82, v83, (uint64_t)v76);

        BYTE1(v75) = BYTE1(v128);
        close(v22);
        v20 = BYTE1(v75);
        if (BYTE1(v75))
          v84 = 7;
        else
          v84 = 0;
        v85 = &CFDictionaryCreate_ptr;
        goto LABEL_23;
      }
      if ((v128 & 0x7F) == 0x7F)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastPathComponent"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s was stopped by signal %d\n"), *a1, (v128 >> 8), v123));
        v71 = 175;
      }
      else
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastPathComponent"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s was terminated by signal %d\n"), *a1, v128 & 0x7F, v123));
        v71 = 171;
      }
    }
    v119 = v71;
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v64, v65, v66, v67, v68, v69, (uint64_t)v57);
    v85 = &CFDictionaryCreate_ptr;

    close(v22);
    v84 = 7;
    v20 = 0xFFFFFFFFLL;
LABEL_23:
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85[27], "numberWithInt:", v84));
    objc_msgSend(v9, "setObject:forKey:", v86, CFSTR("Status"));

    objc_msgSend(v9, "setObject:forKey:", v44, CFSTR("Output"));
  }
  if (v10 != (void (__cdecl *)(int))-1)
    signal(13, v10);
  v87 = a5;
  if ((_DWORD)v20)
    goto LABEL_27;
LABEL_30:
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v20;
}

uint64_t sub_100004C64(const char **a1, pid_t *a2, int a3, _DWORD *a4)
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  int *v31;
  NSString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  int *v42;
  NSString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  posix_spawn_file_actions_t v55;
  int v56[2];
  int v57[2];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("executing %s\n"), *a1));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);

  if (pipe(v57) != -1)
  {
    if (a4 && pipe(v56) == -1)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
      v41 = *a1;
      v42 = __error();
      v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pipe failed while preparing to execute %s: %s\n"), v41, strerror(*v42), v51);
      v54 = (void *)objc_claimAutoreleasedReturnValue(v43);
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v44, v45, v46, v47, v48, v49, (uint64_t)v40);

      v27 = 0xFFFFFFFFLL;
      goto LABEL_18;
    }
    v55 = 0;
    posix_spawn_file_actions_init(&v55);
    posix_spawn_file_actions_adddup2(&v55, v57[1], 1);
    if (a3)
      posix_spawn_file_actions_adddup2(&v55, v57[1], 2);
    posix_spawn_file_actions_addclose(&v55, v57[0]);
    if (a4)
    {
      posix_spawn_file_actions_adddup2(&v55, v56[0], 0);
      posix_spawn_file_actions_addclose(&v55, v56[1]);
    }
    v16 = posix_spawn(a2, *a1, &v55, 0, (char *const *)a1, 0);
    if (v16)
    {
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("posix_spawn %s failed: %s\n"), *a1, strerror(v17), v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue(v20);
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v21, v22, v23, v24, v25, v26, (uint64_t)v19);

      close(v57[0]);
      if (a4)
      {
        close(v56[1]);
        v27 = 0xFFFFFFFFLL;
LABEL_14:
        posix_spawn_file_actions_destroy(&v55);
        close(v56[0]);
LABEL_18:
        close(v57[1]);
        return v27;
      }
      v27 = 0xFFFFFFFFLL;
    }
    else
    {
      v27 = v57[0];
      if (a4)
      {
        *a4 = v56[1];
        goto LABEL_14;
      }
    }
    posix_spawn_file_actions_destroy(&v55);
    goto LABEL_18;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
  v30 = *a1;
  v31 = __error();
  v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pipe failed while preparing to execute %s: %s\n"), v30, strerror(*v31), v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue(v32);
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v33, v34, v35, v36, v37, v38, (uint64_t)v29);

  return 0xFFFFFFFFLL;
}

uint64_t sub_100004FC4(const char **a1, _QWORD *a2, id *a3)
{
  CFDictionaryRef (__cdecl **v6)(CFAllocatorRef, const void **, const void **, CFIndex, const CFDictionaryKeyCallBacks *, const CFDictionaryValueCallBacks *);
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  ssize_t v20;
  id v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  int *v33;
  NSString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  pid_t v73;
  _BYTE v74[1024];

  if (!a2)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Input response dictionary pointer is NULL.")));
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v41, v42, v43, v44, v45, v46, (uint64_t)v40);

    v8 = 0;
    goto LABEL_20;
  }
  v6 = &CFDictionaryCreate_ptr;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v7, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), &stru_1000108C0, CFSTR("Output"), 0, CFSTR("Data"), 0));

  v73 = 0;
  v9 = sub_100004C64(a1, &v73, 1, 0);
  if (v9 == -1)
  {
LABEL_20:
    v35 = 0xFFFFFFFFLL;
LABEL_21:
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lastPathComponent"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error executing command, result = %d\n"), v35));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v49, v50, v51, v52, v53, v54, (uint64_t)v48);

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error executing command, result = %d\n"), v35, 266, v70));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v55, NSLocalizedDescriptionKey, 0));
    if (a3)
    {
      v57 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("HSErrorDomain"), 7, v56);
      *a3 = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedDescription"));
      objc_msgSend(v8, "setObject:forKey:", v58, CFSTR("Error"));

      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "lastPathComponent"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "localizedDescription"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v61));
      sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v62, v63, v64, v65, v66, v67, (uint64_t)v60);

    }
    if (a2)
      goto LABEL_17;
    goto LABEL_18;
  }
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start Reading output from shell command\n")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);

  v19 = objc_alloc_init((Class)NSMutableString);
  v20 = read(v10, v74, 0x3FFuLL);
  if (v20 >= 1)
  {
    do
    {
      v74[v20] = 0;
      v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v74);
      objc_msgSend(v19, "appendString:", v21);

      v20 = read(v10, v74, 0x3FFuLL);
    }
    while (v20 > 0);
  }
  v72 = 0;
  if (waitpid(v73, &v72, 0) == -1)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
    v32 = *a1;
    v33 = __error();
    v6 = &CFDictionaryCreate_ptr;
    v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waitpid failed for %s: %s\n"), v32, strerror(*v33), v68);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v34);
LABEL_14:
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);

    close(v10);
    v36 = 7;
    v35 = 0xFFFFFFFFLL;
    goto LABEL_15;
  }
  v22 = BYTE1(v72);
  if ((v72 & 0x7F) != 0)
  {
    if ((v72 & 0x7F) == 0x7F)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s was stopped by signal %d\n"), *a1, (v72 >> 8), v68));
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/Common/HSPipeUtil.m"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s was terminated by signal %d\n"), *a1, v72 & 0x7F, v68));
    }
    goto LABEL_14;
  }
  close(v10);
  v35 = v22;
  if (v22)
    v36 = 7;
  else
    v36 = 0;
LABEL_15:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[27], "numberWithInt:", v36));
  objc_msgSend(v8, "setObject:forKey:", v37, CFSTR("Status"));

  objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("Output"));
  if ((_DWORD)v35)
    goto LABEL_21;
  if (a2)
LABEL_17:
    *a2 = objc_retainAutorelease(v8);
LABEL_18:

  return v35;
}

void sub_1000064DC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handler"));

  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSHostConnection.m"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
  if (v2)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invoke handler to process new connection.")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);

    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handler"));
    (*((void (**)(id, _QWORD))v18 + 2))(v18, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No handler for remote connection.")));
    sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);

  }
}

id sub_1000066EC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "listen:", *(_QWORD *)(a1 + 40));
}

void sub_1000067E0(id a1)
{
  HSSepUtil *v1;
  void *v2;

  v1 = objc_alloc_init(HSSepUtil);
  v2 = (void *)qword_100014C60;
  qword_100014C60 = (uint64_t)v1;

}

id sub_100006ACC()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("-x"), CFSTR("boot-args"), 0));
  v11 = 0;
  v12 = 0;
  +[HSPipeUtil HSPipeUtilExecCommand:options:response:error:](HSPipeUtil, "HSPipeUtilExecCommand:options:response:error:", CFSTR("/usr/sbin/nvram"), v0, &v12, &v11);
  v1 = v12;
  v2 = v11;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Output")));
  NSLog(CFSTR("Output: %@"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Output")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

  v9 = 0;
  v10 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v5, 0, &v10, &v9));
  NSLog(CFSTR("plist is %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("boot-args")));

  return v7;
}

uint64_t sub_100006C1C()
{
  id v0;
  void *v1;
  void *v2;
  unsigned int v3;
  BOOL v4;
  __CFString *v5;
  uint64_t v6;

  v0 = sub_100006ACC();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "containsString:", CFSTR("rd=md0"));
    v4 = v3 == 0;
    if (v3)
      v5 = CFSTR("Ramdisk");
    else
      v5 = CFSTR("NonUI");
    if (v4)
      v6 = 2;
    else
      v6 = 1;
    NSLog(&v5->isa);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_100006DA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006DC4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got xpc remote connection: 0x%lx."), v3));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  objc_copyWeak(&v32, (id *)(a1 + 40));
  v31 = v3;
  xpc_remote_connection_set_event_handler();
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Done with set_event_handler for remote connection.")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v16, v17, v18, v19, v20, v21, (uint64_t)v14);

  xpc_remote_connection_activate(v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("remote coonnection activated.")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);

  objc_destroyWeak(&v32);
}

void sub_100006FAC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100006FC4(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSMessaging.m"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got an event on xpc remote connection.")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000070FC;
  block[3] = &unk_100010600;
  objc_copyWeak(&v18, a1 + 6);
  v16 = v3;
  v17 = a1[5];
  v13 = v3;
  dispatch_async(v12, block);

  objc_destroyWeak(&v18);
}

void sub_1000070FC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "handleEvent:from:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

BOOL sub_100007DB8()
{
  uint64_t LogHandle;
  NSObject *v1;
  uint8_t v3[16];

  if (!&_lockdown_copy_checkin_info)
  {
    LogHandle = getLogHandle(1);
    v1 = objc_claimAutoreleasedReturnValue(LogHandle);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "lockdown service not found on this system", v3, 2u);
    }

  }
  return &_lockdown_copy_checkin_info != 0;
}

id sub_100007E34(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t LogHandle;
  NSObject *v9;
  void *v10;
  unsigned int v11;
  BOOL i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  unsigned int v21;
  uint8_t v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;

  v21 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0));
  while (1)
  {
    v3 = lockdown_recv(a1, &v21, 4);
    if (v3)
      break;
    sleep(1u);
  }
  if (v3 != 4)
  {
    LogHandle = getLogHandle(1);
    v9 = objc_claimAutoreleasedReturnValue(LogHandle);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to receive the size of the message.\n", buf, 2u);
    }

    goto LABEL_12;
  }
  v4 = v21;
  v5 = getLogHandle(1);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4 > 0xA00000)
  {
    if (v7)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v21;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Size of message is too long: %u.\n", buf, 8u);
    }

LABEL_12:
    v10 = 0;
    goto LABEL_27;
  }
  if (v7)
  {
    *(_DWORD *)buf = 134217984;
    v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Start receiving from the lockdown connection. Buffer size = %lu\n", buf, 0xCu);
  }

  v11 = v21;
  for (i = v21 >= 0x400; ; i = v11 >= 0x400)
  {
    if (i)
      v11 = 1024;
    if (!v11)
      break;
    v13 = v11;
    v14 = lockdown_recv(a1, buf, v11);
    if (!v14)
    {
      do
      {
        sleep(1u);
        v15 = lockdown_recv(a1, buf, v13);
      }
      while (!v15);
      v14 = v15;
    }
    objc_msgSend(v2, "appendBytes:length:", buf, v14);
    v11 = v21 - v14;
    v21 = v11;
  }
  v16 = getLogHandle(1);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v2, "length");
    *(_DWORD *)v22 = 134217984;
    v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Done receiving from the lockdown connection. Total received size = %lu\n", v22, 0xCu);
  }

  v19 = sub_100003ED8(v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v19);
LABEL_27:

  return v10;
}

id sub_1000080BC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t LogHandle;
  NSObject *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  unsigned int v17;
  BOOL i;
  uint64_t v19;
  id v20;
  uint64_t v22;
  NSObject *v23;
  id v24;
  unsigned int v25;
  uint8_t buf[4];
  unint64_t v27;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    LogHandle = getLogHandle(1);
    v6 = objc_claimAutoreleasedReturnValue(LogHandle);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "response pointer is NULL\n", buf, 2u);
    }
    goto LABEL_21;
  }
  v5 = sub_100004088(v3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSObject length](v6, "length");
  v25 = v7;
  if (v7 > 0xA00000)
  {
    v8 = getLogHandle(1);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Size of message is too long: %u.\n", buf, 8u);
    }

LABEL_21:
    v20 = 0;
    goto LABEL_22;
  }
  v11 = objc_retainAutorelease(v6);
  v12 = (char *)-[NSObject bytes](v11, "bytes");
  v13 = lockdown_send(a1, &v25, 4);
  v14 = getLogHandle(1);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13 != 4)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to send the size of the message.\n", buf, 2u);
    }

    goto LABEL_21;
  }
  if (v16)
  {
    *(_DWORD *)buf = 134217984;
    v27 = v25;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Start sending to the lockdown connection. Buffer size = %lu\n", buf, 0xCu);
  }

  v17 = v25;
  for (i = v25 >= 0x400; ; i = v17 >= 0x400)
  {
    if (i)
      v17 = 1024;
    if (!v17)
      break;
    v19 = lockdown_send(a1, v12, v17);
    if (!v19)
      break;
    v12 += v19;
    v17 = v25 - v19;
    v25 = v17;
  }
  v22 = getLogHandle(1);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = -[NSObject length](v11, "length");
    *(_DWORD *)buf = 134217984;
    v27 = (unint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Done sending to the lockdown connection. Total sent size = %lu\n", buf, 0xCu);
  }

  v20 = -[NSObject length](v11, "length");
LABEL_22:

  return v20;
}

void start()
{
  void *v0;
  dispatch_queue_global_t global_queue;
  NSObject *v2;
  NSObject *v3;
  xpc_connection_t mach_service;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_queue_t v15;
  void *remote_service_listener;
  uint64_t v17;
  NSObject *v18;
  _xpc_connection_s *v19;
  uint64_t LogHandle;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;

  v0 = objc_autoreleasePoolPush();
  sub_1000099D4((uint64_t)"com.apple.fusiond");
  global_queue = dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue(global_queue);
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v2);

  dispatch_source_set_event_handler(v3, &stru_100010690);
  dispatch_resume(v3);
  if (sub_100007DB8())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.fusiond", 0, 1uLL);
    if (!mach_service)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not create listener for %s"), "com.apple.fusiond"));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);

      exit(1);
    }
    v19 = mach_service;
    LogHandle = getLogHandle(1);
    v21 = objc_claimAutoreleasedReturnValue(LogHandle);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Handle connection\n", buf, 2u);
    }

    xpc_connection_set_event_handler(v19, &stru_1000106D0);
    xpc_connection_resume(v19);
  }
  else
  {
    v13 = dispatch_queue_create("com.apple.fusiond.message", 0);
    v14 = (void *)qword_100014C68;
    qword_100014C68 = (uint64_t)v13;

    v15 = dispatch_queue_create("com.apple.fusion.remote.xpc_listener", 0);
    remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener("com.apple.fusion.remote.service", v15, 0);
    xpc_remote_connection_set_event_handler(remote_service_listener, &stru_100010798);
    xpc_remote_connection_activate(remote_service_listener);
    v17 = getLogHandle(1);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "com.apple.fusiond is alive on RemoteXPC", buf, 2u);
    }

  }
  v22 = getLogHandle(1);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "com.apple.fusiond";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s started\n", buf, 0xCu);
  }

  dispatch_main();
}

void sub_1000085F0(id a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got SIGTERM, exiting now.\n")));
  sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v3, v4, v5, v6, v7, v8, (uint64_t)v2);

  exit(0);
}

void sub_100008674(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  uint64_t LogHandle;
  NSObject *v4;
  xpc_type_t type;
  xpc_type_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  OS_xpc_object *v17;

  v2 = a2;
  LogHandle = getLogHandle(1);
  v4 = objc_claimAutoreleasedReturnValue(LogHandle);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got a connection %p", buf, 0xCu);
  }

  type = xpc_get_type(v2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_event_handler(v2, &stru_1000106F0);
    xpc_connection_resume(v2);
  }
  else
  {
    v6 = type;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get a connection: %p\n"), v6));
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);

  }
}

void sub_1000087DC(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  uint64_t LogHandle;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFDictionaryRef v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int socket;
  dispatch_source_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint8_t buf[8];
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  NSObject *v49;
  uint64_t v50;
  _QWORD handler[5];
  void *values;
  void *keys;

  v2 = a2;
  LogHandle = getLogHandle(1);
  v4 = objc_claimAutoreleasedReturnValue(LogHandle);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got an xpc message\n", buf, 2u);
  }

  if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid)
  {
    v26 = getLogHandle(1);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Got an invalid connection\n", buf, 2u);
    }

  }
  else
  {
    v43 = 0;
    v44 = 0;
    if (lockdown_copy_checkin_info(v2, &v43))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get lockdown checkin info\n")));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);

    }
    values = v43;
    keys = (void *)kLockdownCheckinConnectionInfoKey;
    v13 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v14 = secure_lockdown_checkin(&v44, v13, 0);
    v15 = v44;
    if ((_DWORD)v14)
      v16 = 1;
    else
      v16 = v44 == 0;
    if (v16)
    {
      v17 = v14;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not checkin with lockdown: %d\n"), v17));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v20, v21, v22, v23, v24, v25, (uint64_t)v19);

      if (!v13)
        goto LABEL_21;
      goto LABEL_20;
    }
    socket = lockdown_get_socket(v44);
    v29 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, socket, 0, 0);
    v30 = v29;
    if (v29)
    {
      xpc_transaction_begin();
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100008B64;
      handler[3] = &unk_100010710;
      handler[4] = v15;
      dispatch_source_set_cancel_handler(v30, handler);
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v46 = 3221225472;
      v47 = sub_100008BDC;
      v48 = &unk_100010738;
      v50 = v15;
      v31 = v30;
      v49 = v31;
      dispatch_source_set_event_handler(v31, buf);
      dispatch_resume(v31);
      v32 = v49;
    }
    else
    {
      v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastPathComponent](v32, "lastPathComponent"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not create lockdown source")));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v34, v35, v36, v37, v38, v39, (uint64_t)v33);

    }
    if (v13)
LABEL_20:
      CFRelease(v13);
  }
LABEL_21:

}

void sub_100008B64(uint64_t a1)
{
  uint64_t LogHandle;
  NSObject *v3;
  uint8_t v4[16];

  LogHandle = getLogHandle(1);
  v3 = objc_claimAutoreleasedReturnValue(LogHandle);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "hcs cancel handler is called", v4, 2u);
  }

  lockdown_disconnect(*(_QWORD *)(a1 + 32));
  xpc_transaction_end();
}

void sub_100008BDC(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t LogHandle;
  NSObject *v10;
  _BOOL4 v11;
  HSMessageProcessor *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint8_t v64[8];
  _BYTE buf[24];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = objc_autoreleasePoolPush();
  v5 = sub_100007E34(v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("SerializedObject")));
    LogHandle = getLogHandle(1);
    v10 = objc_claimAutoreleasedReturnValue(LogHandle);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      v63 = v4;
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Start processing the message received.\n", buf, 2u);
      }
      v62 = v2;

      v12 = objc_alloc_init(HSMessageProcessor);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[HSMessage supportedClasses](HSMessage, "supportedClasses"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchiveDataToObject:allowedClasses:](NSKeyedUnarchiver, "unarchiveDataToObject:allowedClasses:", v8, v13));
      v15 = objc_opt_class(HSMessageRequest);
      v16 = v3;
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      {
        v17 = v14;
      }
      else
      {
        v31 = getLogHandle(1);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_10000BEE4((uint64_t)v14, v32, v33, v34, v35, v36, v37, v38);

        v17 = 0;
      }
      *(_QWORD *)v64 = 0;
      -[HSMessageProcessor processMessagev1:response:](v12, "processMessagev1:response:", v17, v64);
      v39 = *(id *)v64;
      v40 = getLogHandle(1);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v39;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Response: %@\n", buf, 0xCu);
      }

      v42 = v39;
      v19 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archiveObjectToDict:](NSKeyedArchiver, "archiveObjectToDict:", v42));

      v3 = v16;
      v2 = v62;
      v4 = v63;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Start processing the message received.\n", buf, 2u);
      }

      v12 = objc_alloc_init(HSMessageProcessor);
      *(_QWORD *)buf = 0;
      v18 = -[HSMessageProcessor processMessage:response:](v12, "processMessage:response:", v7, buf);
      v19 = *(id *)buf;
      if (v18)
      {
        v20 = getLogHandle(1);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10000BEB0(v21, v22, v23, v24, v25, v26, v27, v28);

      }
      v29 = getLogHandle(1);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v64 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Response:\n", v64, 2u);
      }

      if (v19)
      {
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &stru_100010778);
      }
      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
        v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v43, CFSTR("Status"), CFSTR("Failed to get a response from the device."), CFSTR("Error"), 0, CFSTR("Data"), 0));

      }
    }
    if (!sub_1000080BC(v2, v19))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastPathComponent"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to send message to the host")));
      sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v54, v55, v56, v57, v58, v59, (uint64_t)v53);

    }
  }
  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "lastPathComponent"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Didn't get an error from lockdown but the message is NULL")));
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v46, v47, v48, v49, v50, v51, (uint64_t)v45);

  }
  objc_autoreleasePoolPop(v4);

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void sub_100009094(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  uint64_t LogHandle;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Data")) & 1) == 0)
  {
    LogHandle = getLogHandle(1);
    v8 = objc_claimAutoreleasedReturnValue(LogHandle);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "key = %@, value = %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

void sub_100009178(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  _QWORD v3[4];
  OS_xpc_object *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000091F0;
  v3[3] = &unk_1000107C0;
  v4 = a2;
  v2 = v4;
  xpc_remote_connection_set_event_handler(v2, v3);
  xpc_remote_connection_activate(v2);

}

void sub_1000091F0(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;

  v4 = a2;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_remote_connection_cancel(*(_QWORD *)(a1 + 32));
  }
  else
  {
    v3 = qword_100014C68;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000092A8;
    block[3] = &unk_100010598;
    v6 = *(id *)(a1 + 32);
    v7 = v4;
    dispatch_sync(v3, block);

  }
}

void sub_1000092A8(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t LogHandle;
  NSObject *v5;
  xpc_object_t reply;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *data;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  HSMessageProcessor *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  unsigned int v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  NSObject *v53;
  char *v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  size_t length;
  uint8_t buf[4];
  const char *v63;

  v1 = *(void **)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v1;
  LogHandle = getLogHandle(1);
  v5 = objc_claimAutoreleasedReturnValue(LogHandle);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v63 = "void _handle_remote_xpc_message(__strong xpc_remote_connection_t, __strong xpc_object_t)";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Inside %s", buf, 0xCu);
  }

  reply = xpc_dictionary_create_reply(v3);
  if (!reply)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/fusiond.m"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RemoteXPC no reply context")));
    sub_100009AE0(4, CFSTR("[%@:%d] %@\n"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

    xpc_remote_connection_cancel(v2);
    goto LABEL_39;
  }
  if (!xpc_dictionary_get_string(v3, "RemotePing"))
  {
    length = 0;
    data = xpc_dictionary_get_data(v3, "SerializedObject", &length);
    if (!data)
    {
      v27 = getLogHandle(1);
      v22 = (HSMessageProcessor *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(&v22->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v22->super, OS_LOG_TYPE_DEFAULT, "Message Data is NULL.", buf, 2u);
      }
      goto LABEL_38;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, length));
    if (v19)
    {
      v20 = getLogHandle(1);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Start processing the message received with request data.\n", buf, 2u);
      }

      v22 = objc_alloc_init(HSMessageProcessor);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[HSMessage supportedClasses](HSMessage, "supportedClasses"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchiveDataToObject:allowedClasses:](NSKeyedUnarchiver, "unarchiveDataToObject:allowedClasses:", v19, v23));
      v25 = objc_opt_class(HSMessageRequest);
      if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      {
        v26 = v24;
      }
      else
      {
        v43 = getLogHandle(1);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          sub_10000BEE4((uint64_t)v24, v44, v45, v46, v47, v48, v49, v50);

        v26 = 0;
      }
      v60 = 0;
      -[HSMessageProcessor processMessagev1:response:](v22, "processMessagev1:response:", v26, &v60);
      v51 = (char *)v60;
      v52 = getLogHandle(1);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v51;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Response: %@\n", buf, 0xCu);
      }

      v54 = v51;
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archiveObjectToDict:](NSKeyedArchiver, "archiveObjectToDict:", v54));

    }
    else
    {
      if (!v3)
      {
        v31 = 0;
        v22 = 0;
        goto LABEL_35;
      }
      v28 = getLogHandle(1);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Start processing the message received without request data.\n", buf, 2u);
      }

      v22 = objc_alloc_init(HSMessageProcessor);
      v60 = 0;
      v30 = -[HSMessageProcessor processMessage:response:](v22, "processMessage:response:", v3, &v60);
      v31 = v60;
      if (v30)
      {
        v32 = getLogHandle(1);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          sub_10000BEB0(v33, v34, v35, v36, v37, v38, v39, v40);

      }
      v41 = getLogHandle(1);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Response:\n", buf, 2u);
      }

      if (v31)
      {
        objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", &stru_1000107E0);
LABEL_35:
        v55 = getLogHandle(1);
        v56 = objc_claimAutoreleasedReturnValue(v55);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v63 = (const char *)v31;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Start Replying for response... %@", buf, 0xCu);
        }

        v57 = sub_100004088(v31);
        v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v57));
        xpc_dictionary_set_data(reply, "SerializedObject", objc_msgSend(v58, "bytes"), (size_t)objc_msgSend(v58, "length"));
        xpc_dictionary_send_reply(reply);

LABEL_38:
        goto LABEL_39;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 6));
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v23, CFSTR("Status"), CFSTR("Failed to get a response from the device."), CFSTR("Error"), 0, CFSTR("Data"), 0));
    }

    goto LABEL_35;
  }
  v7 = (const char *)xpc_remote_connection_copy_remote_address_string(v2);
  v8 = getLogHandle(1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Start Replying ...", buf, 2u);
  }

  xpc_dictionary_set_string(reply, "RemotePing", v7);
  xpc_dictionary_send_reply(reply);
LABEL_39:

}

void sub_1000098D0(id a1, id a2, id a3, BOOL *a4)
{
  id v5;
  id v6;
  uint64_t LogHandle;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Data")) & 1) == 0)
  {
    LogHandle = getLogHandle(1);
    v8 = objc_claimAutoreleasedReturnValue(LogHandle);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "key = %@, value = %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

void sub_1000099B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000099C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000099D4(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009A40;
  block[3] = &unk_100010710;
  block[4] = a1;
  if (qword_100014C70 != -1)
    dispatch_once(&qword_100014C70, block);
}

void sub_100009A40(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  os_log_t v5;
  void *v6;

  byte_100014C80 = 1;
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
    v3 = (void *)qword_100014C78;
    qword_100014C78 = v2;

    v4 = *(const char **)(a1 + 32);
  }
  else
  {
    v4 = "com.apple.fusiond";
  }
  v5 = os_log_create(v4, "device");
  v6 = (void *)qword_100014C88;
  qword_100014C88 = (uint64_t)v5;

  if (!qword_100014C88 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10000BF4C();
}

void sub_100009AE0(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  FILE *v26;
  FILE *v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v10 = a2;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:arguments:", v10, &a9);

  v12 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v12, "setDateFormat:", CFSTR("yyyy-MM-dd hh:mm:ss"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v14, v11));

  switch(a1)
  {
    case 1:
      v16 = (void *)qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_retainAutorelease(v15);
        v18 = v16;
        *(_DWORD *)buf = 136315138;
        v30 = objc_msgSend(v17, "UTF8String");
        v19 = v18;
        v20 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_6;
      }
      break;
    case 2:
      v21 = (void *)qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_INFO))
      {
        v22 = objc_retainAutorelease(v15);
        v18 = v21;
        *(_DWORD *)buf = 136315138;
        v30 = objc_msgSend(v22, "UTF8String");
        v19 = v18;
        v20 = OS_LOG_TYPE_INFO;
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s", buf, 0xCu);

      }
      break;
    case 3:
      v23 = qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_DEBUG))
        sub_10000BF90(v15, v23);
      break;
    case 4:
      v24 = qword_100014C88;
      if (os_log_type_enabled((os_log_t)qword_100014C88, OS_LOG_TYPE_ERROR))
        sub_10000C020(v15, v24);
      break;
    default:
      break;
  }
  if (qword_100014C78)
  {
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/private/var/log/%@.log"), qword_100014C78)));
    v26 = fopen((const char *)objc_msgSend(v25, "UTF8String"), "a+");
    if (v26)
    {
      v27 = v26;
      v28 = objc_retainAutorelease(v15);
      fwrite(objc_msgSend(v28, "UTF8String"), (size_t)objc_msgSend(v28, "length"), 1uLL, v27);
      fflush(v27);
      fclose(v27);
    }

  }
}

id sub_100009DC8(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

uint64_t sub_100009E20(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  v20 = 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", a1, 1, &v20));
  v2 = v20;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("\n")));
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 0, 0, &v19));
  v6 = v19;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ProductBuildVersion")));
  if (objc_msgSend(v3, "count"))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v12 = v6;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  v9 = 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataUsingEncoding:", 1));
  v18 = v6;
  v17 = v1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v10, 1, &v18));
  v12 = v18;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("os_version")));
  v14 = objc_msgSend(v13, "containsString:", v7);

  v1 = v17;
  if ((v14 & 1) == 0)
    goto LABEL_8;
LABEL_9:

  return v9;
}

uint64_t sub_100009FF0(_QWORD *a1)
{
  CFDictionaryRef (__cdecl **v2)(CFAllocatorRef, const void **, const void **, CFIndex, const CFDictionaryKeyCallBacks *, const CFDictionaryValueCallBacks *);
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  unsigned int v30;
  const __CFString *v31;
  char v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  void *v82;
  CFDictionaryRef (__cdecl *v83)(CFAllocatorRef, const void **, const void **, CFIndex, const CFDictionaryKeyCallBacks *, const CFDictionaryValueCallBacks *);
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  CFDictionaryRef (__cdecl *v94)(CFAllocatorRef, const void **, const void **, CFIndex, const CFDictionaryKeyCallBacks *, const CFDictionaryValueCallBacks *);
  void *v95;
  void *v96;
  CFDictionaryRef (__cdecl **v97)(CFAllocatorRef, const void **, const void **, CFIndex, const CFDictionaryKeyCallBacks *, const CFDictionaryValueCallBacks *);
  void *v98;
  id v99;
  CFDictionaryRef (__cdecl *v100)(CFAllocatorRef, const void **, const void **, CFIndex, const CFDictionaryKeyCallBacks *, const CFDictionaryValueCallBacks *);
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v115;
  void *v116;
  void *v117;
  _QWORD *v118;
  id v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  id v123;
  id obj;
  uint64_t v125;
  void *v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  char v140;
  _BYTE v141[128];
  _BYTE v142[128];

  v2 = &CFDictionaryCreate_ptr;
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v140 = 0;
  v123 = objc_alloc_init((Class)NSMutableArray);
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v121 = objc_msgSend(&off_100011FA8, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
  v4 = 0;
  v5 = 0;
  if (!v121)
  {
    v127 = 0;
    goto LABEL_42;
  }
  v127 = 0;
  v120 = *(_QWORD *)v137;
  v118 = a1;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v137 != v120)
        objc_enumerationMutation(&off_100011FA8);
      v122 = v6;
      v7 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v126 = v7;
      LODWORD(v7) = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v140);

      if (!(_DWORD)v7)
      {
        v83 = v2[24];
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 43));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "dictionaryWithObjectsAndKeys:", v84, CFSTR("Status"), CFSTR("Log directory not found"), CFSTR("Error"), 0));

        v3 = objc_retainAutorelease(v85);
        *a1 = v3;
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
        v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "lastPathComponent"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" Response dict populated: %@"), v3));
LABEL_36:
        v12 = (id)v86;
        sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v87, v88, v89, v90, v91, v92, v86);

        goto LABEL_38;
      }
      if (!v140)
      {
        v94 = v2[24];
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 43));
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "dictionaryWithObjectsAndKeys:", v95, CFSTR("Status"), CFSTR("Log directory expected. but found file"), CFSTR("Error"), 0));

        v3 = objc_retainAutorelease(v96);
        *a1 = v3;
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
        v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "lastPathComponent"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" Response dict populated: %@"), v3));
        goto LABEL_36;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v135 = v127;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v126, &v135));
      v11 = v135;

      v133 = 0u;
      v134 = 0u;
      v131 = 0u;
      v132 = 0u;
      v12 = v10;
      v128 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v131, v141, 16);
      if (v128)
      {
        obj = v12;
        v119 = v3;
        v125 = *(_QWORD *)v132;
        while (1)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v132 != v125)
              objc_enumerationMutation(obj);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)v13)));
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
            v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File Name: %@"), v14));
            sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);

            if ((objc_msgSend(v14, "hasSuffix:", CFSTR(".ips")) & 1) == 0
              && !objc_msgSend(v14, "hasSuffix:", CFSTR(".log")))
            {
              v23 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
              v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Suffix Mismatch . Skipping file : %@"), v14, 152, v115));
              sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v53, v54, v55, v56, v57, v58, (uint64_t)v33);

              goto LABEL_29;
            }
            v23 = objc_alloc_init((Class)v2[24]);
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v130 = v11;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "attributesOfItemAtPath:error:", v14, &v130));
            v26 = v130;

            if (!v25)
            {
              v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to retrieve attributes for %@: (%@)"), v14, v26, v115));
              sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v46, v47, v48, v49, v50, v51, (uint64_t)v44);

LABEL_25:
              v4 = v25;
              goto LABEL_28;
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", NSFileSize));
            v28 = sub_100009DC8(v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

            if (!v29)
            {
              v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
              v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to retrieve size of %@."), v14, 152, v115));
              sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v61, v62, v63, v64, v65, v66, (uint64_t)v59);

              goto LABEL_25;
            }
            v30 = objc_msgSend(v14, "hasPrefix:", CFSTR("panic"));
            v31 = CFSTR("NO");
            if (!v30)
              goto LABEL_20;
            v32 = sub_100009E20((uint64_t)v14);
            v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
            if ((v32 & 1) != 0)
            {
              v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Panic Version and System Version matches. Sending to HOST")));
              sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v35, v36, v37, v38, v39, v40, (uint64_t)v34);

              v31 = CFSTR("YES");
              v2 = &CFDictionaryCreate_ptr;
LABEL_20:
              objc_msgSend(v23, "setObject:forKey:", v31, CFSTR("isPanic"));
              v41 = objc_alloc((Class)NSData);
              v129 = v5;
              v33 = objc_msgSend(v41, "initWithContentsOfFile:options:error:", v14, 0, &v129);
              v42 = v129;

              if (v33)
              {
                objc_msgSend(v23, "setObject:forKey:", v14, CFSTR("LogFileName"));
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", NSFileSize));
                objc_msgSend(v23, "setObject:forKey:", v43, CFSTR("LogFileSize"));

                objc_msgSend(v23, "setObject:forKey:", v33, CFSTR("LogFileData"));
                objc_msgSend(v123, "addObject:", v23);
              }
              else
              {
                v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
                v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to load %@: %@"), v14, v42, v115));
                sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v69, v70, v71, v72, v73, v74, (uint64_t)v67);

              }
              v4 = v25;
              v5 = v42;
LABEL_28:
              v11 = v26;
              goto LABEL_29;
            }
            v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Panic Version and System Version does not match. Skipping")));
            sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v75, v76, v77, v78, v79, v80, (uint64_t)v34);

            v4 = v25;
            v11 = v26;
            v2 = &CFDictionaryCreate_ptr;
LABEL_29:

            v13 = (char *)v13 + 1;
          }
          while (v128 != v13);
          v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v141, 16);
          v128 = v81;
          if (!v81)
          {
            v12 = obj;
            v82 = obj;
            v127 = v11;
            a1 = v118;
            v3 = v119;
            goto LABEL_38;
          }
        }
      }
      v82 = v12;
      v127 = v11;
LABEL_38:

      v6 = v122 + 1;
    }
    while ((id)(v122 + 1) != v121);
    v121 = objc_msgSend(&off_100011FA8, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
  }
  while (v121);
LABEL_42:
  v97 = v2;
  v98 = v3;
  v99 = objc_msgSend(v123, "count");
  v100 = v97[24];
  if (v99)
  {
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "dictionaryWithObjectsAndKeys:", v101, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), v123, CFSTR("Data"), 0));
    v103 = v123;
    v104 = 0;
  }
  else
  {
    v103 = v123;
    v104 = 45;
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 45));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "dictionaryWithObjectsAndKeys:", v101, CFSTR("Status"), &stru_1000108C0, CFSTR("Error"), 0, CFSTR("Data"), 0));
  }

  v105 = objc_retainAutorelease(v102);
  *a1 = v105;
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSLog.m"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "lastPathComponent"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" Returning Status: %d"), v104));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v108, v109, v110, v111, v112, v113, (uint64_t)v107);

  return v104;
}

id sub_10000AA08()
{
  void *v0;

  return objc_msgSend(v0, "UTF8String");
}

void sub_10000AC2C(id a1)
{
  int v1;

  if (reboot3(0x8000000000000000))
    v1 = -1;
  else
    v1 = 0;
  exit(v1);
}

void sub_10000B46C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000B490(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got xpc remote connection: 0x%lx."), v3));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000B5C8;
  v14[3] = &unk_100010628;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v12 = v3;
  v15 = v12;
  xpc_remote_connection_set_event_handler(v12, v14);
  xpc_remote_connection_activate(v12);

  objc_destroyWeak(&v16);
}

void sub_10000B5B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000B5C8(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/CCCommunication/HSFileTransfer.m"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Got an event on xpc remote connection.")));
  sub_100009AE0(2, CFSTR("[%@:%d] %@\n"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B700;
  block[3] = &unk_100010600;
  objc_copyWeak(&v18, a1 + 6);
  v16 = v3;
  v17 = a1[5];
  v13 = v3;
  dispatch_async(v12, block);

  objc_destroyWeak(&v18);
}

void sub_10000B700(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "handleEvent:from:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10000BEB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000099C4((void *)&_mh_execute_header, a1, a3, "Process message failed.\n", a5, a6, a7, a8, 0);
}

void sub_10000BEE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000099B4((void *)&_mh_execute_header, a2, a3, "Some other class type: %@\n", a5, a6, a7, a8, 2u);
}

void sub_10000BF4C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os_log_t", v0, 2u);
}

void sub_10000BF90(void *a1, NSObject *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  v5 = 136315138;
  v6 = sub_10000AA08();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);

  sub_10000A9FC();
}

void sub_10000C020(void *a1, NSObject *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  v5 = 136315138;
  v6 = sub_10000AA08();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);

  sub_10000A9FC();
}

id objc_msgSend_HSPipeUtilExecCommand_options_response_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HSPipeUtilExecCommand:options:response:error:");
}

id objc_msgSend_HSPipeUtilExecCommandWithData_options_data_response_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HSPipeUtilExecCommandWithData:options:data:response:error:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__unarchiveObjectFromVersion1XPCObject_allowedClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unarchiveObjectFromVersion1XPCObject:allowedClasses:");
}

id objc_msgSend_acceptConnectionsForService_InQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptConnectionsForService:InQueue:withHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_archiveObject_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveObject:to:");
}

id objc_msgSend_archiveObjectToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveObjectToData:");
}

id objc_msgSend_archiveObjectToDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveObjectToDict:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsAtPath:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDecoding");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getClient:");
}

id objc_msgSend_handleError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleError:");
}

id objc_msgSend_handleEvent_from_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleEvent:from:");
}

id objc_msgSend_handleMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMessage:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hostConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostConnection");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:options:error:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithName_statusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:statusCode:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listeningQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningQueue");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_messageStr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageStr");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_processMessage_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processMessage:response:");
}

id objc_msgSend_processMessagev1_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processMessagev1:response:");
}

id objc_msgSend_processSepUtilCommand_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processSepUtilCommand:response:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_rebootDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rebootDevice:");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_sendMessage_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:response:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDecodingFailurePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDecodingFailurePolicy:");
}

id objc_msgSend_setDeviceEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceEnvironment:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHostConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostConnection:");
}

id objc_msgSend_setListeningQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeningQueue:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedSingleton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSingleton");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportedClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedClasses");
}

id objc_msgSend_unarchiveDataToObject_allowedClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchiveDataToObject:allowedClasses:");
}

id objc_msgSend_unarchiveXPCObject_allowedClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchiveXPCObject:allowedClasses:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
