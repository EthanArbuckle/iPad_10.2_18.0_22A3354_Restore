uint64_t sub_100006CF8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 128), 0xFFFFFFFFFFFFFFFFLL);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 120);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006D90;
  v8[3] = &unk_100024AB0;
  v8[4] = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v8);

  return 1;
}

intptr_t sub_100006D90(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "outputEvent:", *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 128));
}

uint64_t sub_100006DC4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 128), 0xFFFFFFFFFFFFFFFFLL);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 120);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006E5C;
  v8[3] = &unk_100024AB0;
  v8[4] = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v8);

  return 0;
}

intptr_t sub_100006E5C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "outputEvent:", *(_QWORD *)(a1 + 40));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 128));
}

uint64_t sub_100006F1C()
{
  puts("log [options] [<command>]");
  putchar(10);
  puts("    -a,--all                         Show all system logs");
  puts("    -x,--process <name>              Filter events from the specified process");
  puts("    -d,--path=<logs-dir>             Use <logs-dir> instead of default");
  puts("    --last num [m|h|d]               Limits the captured events to the period starting at the given interval ago from the current time");
  puts("    -S,--start=\"YYYY-MM-DD HH:MM:SS\" Start log dump from a specified date");
  puts("    -E,--end=\"YYYY-MM-DD HH:MM:SS\"   Stop log dump after a specified date");
  puts("    -b                               Show CloudDocs logs");
  puts("    -f                               Show FileProvider related logs");
  puts("    -F                               Show FruitBasket related logs");
  puts("    -N                               Show network related logs (should be used in conjonction with another flag)");
  puts("    -g                               Show Genstore related logs");
  puts("    -i                               Show SQL and CloudDocs logs");
  puts("    -o                               Show local storage logs");
  puts("    -D                               Show logs from the Denator subsystem");
  puts("    -z,--local-timezone              Display timestamps within local timezone");
  puts("    --dark-mode                      Adapt color scheme to dark mode terminal");
  puts("    -q,--quick                       Print logs without heavy pre-processing");
  return putchar(10);
}

id sub_100007794(int a1, char *const *a2)
{
  BRCTLLogCommand *v2;
  id v3;
  _QWORD v5[4];
  BRCTLLogCommand *v6;
  char *const *v7;
  int v8;

  v8 = a1;
  v7 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007854;
  v5[3] = &unk_100024DC8;
  v2 = objc_alloc_init(BRCTLLogCommand);
  v6 = v2;
  sub_10000A7D8(&v8, &v7, "abc:d:fFNogH:il:m:n:qS:E:p:stwx:z", (const option *)&off_100024B80, v5);
  -[BRCTLLogCommand buildPredicateFromString](v2, "buildPredicateFromString");
  if (v8)
    sub_10000A7C4();
  v3 = (id)-[BRCTLLogCommand dumpToFd:](v2, "dumpToFd:", 1);

  return v3;
}

id sub_100007854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseOption:arg:", a2, a3);
}

uint64_t sub_100007978(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007988(uint64_t a1)
{

}

uint64_t sub_100007990(_QWORD *a1, void *a2)
{
  id v3;
  FakeLogMessageEvent *v4;
  FakeLogMessageEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  id v13;
  id v14;
  unsigned int v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  FakeLogMessageEvent *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v3 = a2;
  v4 = objc_opt_new(FakeLogMessageEvent);
  -[FakeLogMessageEvent setEventType:](v4, "setEventType:", 1024);
  if ((unint64_t)objc_msgSend(v3, "length") < 0x1F)
  {
    v5 = 0;
    goto LABEL_46;
  }
  if (qword_10002A908 != -1)
    dispatch_once(&qword_10002A908, &stru_100024E10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 31));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10002A900, "dateFromString:", v6));
  if (v7)
  {
    -[FakeLogMessageEvent setTimestamp:](v4, "setTimestamp:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    objc_msgSend(v9, "setCharactersToBeSkipped:", v10);

    v43 = 0;
    v5 = 0;
    if (objc_msgSend(v9, "scanHexLongLong:", &v43))
    {
      -[FakeLogMessageEvent setThreadID:](v4, "setThreadID:", v43);
      if ((objc_msgSend(v9, "scanString:intoString:", CFSTR("Default"), 0) & 1) != 0)
      {
        v11 = 0;
LABEL_18:
        -[FakeLogMessageEvent setMessageType:](v4, "setMessageType:", v11);
        v42 = 0;
        v5 = 0;
        if (!objc_msgSend(v9, "scanHexLongLong:", &v42))
          goto LABEL_44;
        v41 = 0;
        v5 = 0;
        if (!objc_msgSend(v9, "scanInteger:", &v41))
          goto LABEL_44;
        -[FakeLogMessageEvent setProcessID:](v4, "setProcessID:", v41);
        v40 = 0;
        v12 = objc_msgSend(v9, "scanUpToString:intoString:", CFSTR(": "), &v40);
        v13 = v40;
        v5 = 0;
        if (!v12)
          goto LABEL_43;
        if ((objc_msgSend(v9, "isAtEnd") & 1) != 0)
          goto LABEL_22;
        objc_msgSend(v9, "scanString:intoString:", CFSTR(": "), 0);
        -[FakeLogMessageEvent setProcessImagePath:](v4, "setProcessImagePath:", v13);
        v14 = objc_msgSend(v9, "scanLocation");
        if (objc_msgSend(v9, "scanUpToString:intoString:", CFSTR(") ["), 0)
          && !objc_msgSend(v9, "isAtEnd"))
        {
          objc_msgSend(v9, "scanString:intoString:", CFSTR(") ["), 0);
        }
        else
        {
          objc_msgSend(v9, "setScanLocation:", v14);
          v5 = 0;
          if (!objc_msgSend(v9, "scanString:intoString:", CFSTR("["), 0))
            goto LABEL_43;
          if ((objc_msgSend(v9, "isAtEnd") & 1) != 0)
          {
LABEL_22:
            v5 = 0;
LABEL_43:

            goto LABEL_44;
          }
        }
        v39 = 0;
        v15 = objc_msgSend(v9, "scanUpToString:intoString:", CFSTR("]"), &v39);
        v16 = v39;
        v5 = 0;
        if (v15)
        {
          v36 = v16;
          if ((objc_msgSend(v9, "isAtEnd") & 1) != 0)
          {
            v5 = 0;
          }
          else
          {
            objc_msgSend(v9, "scanString:intoString:", CFSTR("]"), 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsSeparatedByString:", CFSTR(".")));
            v37 = v17;
            if (objc_msgSend(v36, "hasPrefix:", CFSTR("com.apple."))
              || (objc_msgSend(v36, "hasPrefix:", CFSTR("com.example.")) & 1) != 0)
            {
              v35 = v13;
              v18 = 0;
              v19 = 0;
              do
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectAtIndexedSubscript:", v18));
                v19 += (uint64_t)objc_msgSend(v20, "length");

                ++v18;
              }
              while (v18 != 3);
              v21 = (char *)(v19 + 2);
              v13 = v35;
            }
            else
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
              v21 = (char *)objc_msgSend(v22, "length");

            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "substringToIndex:", v21));
            -[FakeLogMessageEvent setSubsystem:](v4, "setSubsystem:", v23);

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "substringFromIndex:", v21 + 1));
            -[FakeLogMessageEvent setCategory:](v4, "setCategory:", v24);

            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
            v38 = 0;
            LODWORD(v23) = objc_msgSend(v9, "scanUpToCharactersFromSet:intoString:", v25, &v38);
            v26 = v38;

            v5 = 0;
            if ((_DWORD)v23)
            {
              -[FakeLogMessageEvent setEventMessage:](v4, "setEventMessage:", v26);
              v5 = v4;
            }

          }
          v16 = v36;
        }

        goto LABEL_43;
      }
      if ((objc_msgSend(v9, "scanString:intoString:", CFSTR("Info"), 0) & 1) != 0)
      {
        v11 = 1;
        goto LABEL_18;
      }
      if ((objc_msgSend(v9, "scanString:intoString:", CFSTR("Debug"), 0) & 1) != 0)
      {
        v11 = 2;
        goto LABEL_18;
      }
      if ((objc_msgSend(v9, "scanString:intoString:", CFSTR("Error"), 0) & 1) != 0)
      {
        v11 = 16;
        goto LABEL_18;
      }
      v5 = 0;
      if (objc_msgSend(v9, "scanString:intoString:", CFSTR("Fault"), 0))
      {
        v11 = 17;
        goto LABEL_18;
      }
    }
LABEL_44:

    goto LABEL_45;
  }
  v5 = 0;
LABEL_45:

LABEL_46:
  if (v5)
  {
    v27 = *(_QWORD *)(a1[6] + 8);
    if (*(_QWORD *)(v27 + 40))
    {
      v28 = (*(uint64_t (**)(void))(a1[4] + 16))();
      v27 = *(_QWORD *)(a1[6] + 8);
    }
    else
    {
      v28 = 0;
    }
    v29 = v5;
    v30 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v29;
LABEL_53:

    goto LABEL_54;
  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v32 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!v32)
    {
      v28 = 0xFFFFFFFFLL;
      goto LABEL_54;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "eventMessage"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", (char *)objc_msgSend(v3, "length") - 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v30, v33));
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setEventMessage:", v34);

    v28 = 0;
    goto LABEL_53;
  }
  v28 = 0;
LABEL_54:
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;

  return v28;
}

void sub_100007F84(id a1)
{
  NSDateFormatter *v1;
  void *v2;

  v1 = objc_opt_new(NSDateFormatter);
  v2 = (void *)qword_10002A900;
  qword_10002A900 = (uint64_t)v1;

  objc_msgSend((id)qword_10002A900, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZ"));
}

uint64_t sub_100007FC4()
{
  puts("check [options] <command>");
  puts("    run local and server checks");
  putchar(10);
  puts("    -o,--output=<file-path>");
  puts("                         redirect output to <file-path>");
  puts("    local                (default) run local checks");
  puts("    server [<containers>]");
  puts("                         run server checks for the specified containers");
  return putchar(10);
}

uint64_t sub_100008034(unsigned int a1, char *const *a2)
{
  const char *v2;
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  const char **v14;
  unsigned int v15;

  v15 = a1;
  v14 = (const char **)a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000082A0;
  v9[3] = &unk_100024EA8;
  v9[4] = &v10;
  sub_10000A7D8((int *)&v15, (char *const **)&v14, "o:", (const option *)&off_100024E30, v9);
  v2 = (const char *)v11[3];
  if (v2)
  {
    v3 = open(v2, 525, 420);
    if ((v3 & 0x80000000) != 0)
      err(1, "Unable to open file %s", *v14);
    v4 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v3, 1);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"));
  }
  v5 = (void *)qword_10002A910;
  qword_10002A910 = (uint64_t)v4;

  if (v15)
  {
    v6 = sub_10000A6F0(*v14, (const char **)&off_100024E70);
    v7 = ((uint64_t (*)(_QWORD, const char **))(&off_100024E70)[2 * v6 + 1])(v15, v14);
  }
  else
  {
    sub_1000081C0(0, 0);
    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_1000081A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000081C0(int a1, char *const *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  char *const *v10;
  int v11;

  v11 = a1;
  v10 = a2;
  sub_10000A7D8(&v11, &v10, 0, 0, 0);
  if (v11 >= 2)
    sub_10000A7C4();
  v2 = sub_10000A984();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = qword_10002A910;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000082C4;
  v8[3] = &unk_100024ED0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v5, "performSelfCheck:reply:", v4, v8);
  v6 = objc_msgSend(v5, "resultWithTimeout:exitMessage:", dword_10002A8D0, CFSTR("self-check failed"));

  return 0;
}

uint64_t sub_100008298()
{
  return 1;
}

uint64_t sub_1000082A0(uint64_t result, int a2)
{
  if (a2 == 111)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = optarg;
  return result;
}

id sub_1000082C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2, a3);
}

_QWORD *sub_100008554(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", NSProgressFileOperationKindKey));

  if (v5)
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    printf("xxxxx ignore %s\n", (const char *)objc_msgSend(v6, "UTF8String"));

    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setProgressObserved:", v3);
    objc_msgSend(*(id *)(a1 + 32), "setPreviousDescription:", 0);
    puts("<<<<<");
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("localizedDescription"), 4, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("localizedAdditionalDescription"), 4, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("indeterminate"), 4, 0);
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("userInfo.NSProgressFileTotalCountKey"), 4, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000086E0;
    v12[3] = &unk_100024AB0;
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v14 = v9;
    v10 = objc_retainBlock(v12);
    v7 = objc_retainBlock(v10);

  }
  return v7;
}

id sub_1000086E0(uint64_t a1)
{
  puts(">>>>>");
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("localizedDescription"));
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("localizedAdditionalDescription"));
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("indeterminate"));
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("userInfo.NSProgressFileTotalCountKey"));
}

void sub_1000090D8(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  float v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  float v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  const char *v67;
  const char *v68;
  id v69;
  id v70;
  const char *v71;
  const char *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *i;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  id v108;
  id obj;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  id v113;
  char v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  unsigned int v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];

  v3 = a2;
  objc_msgSend(a1[4], "disableUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSMetadataQueryUpdateAddedItemsKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSMetadataQueryUpdateRemovedItemsKey));
  v96 = v3;
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", NSMetadataQueryUpdateChangedItemsKey));
  v6 = a1[5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
  objc_msgSend(v6, "write:", "%s total:%d", objc_msgSend(v8, "UTF8String"), objc_msgSend(a1[4], "resultCount"));

  if (objc_msgSend(v4, "count"))
    objc_msgSend(a1[5], "write:", " added:%d", objc_msgSend(v4, "count"));
  v9 = v107;
  if (objc_msgSend(v107, "count"))
    objc_msgSend(a1[5], "write:", " updated:%d", objc_msgSend(v107, "count"));
  if (objc_msgSend(v5, "count"))
    objc_msgSend(a1[5], "write:", " removed:%d", objc_msgSend(v5, "count"));
  objc_msgSend(a1[5], "write:", "\n");
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "results"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v141, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v137;
    v104 = BRMetadataUbiquitousItemUploadingSizeKey;
    v103 = BRMetadataUbiquitousItemDownloadingSizeKey;
    v102 = NSMetadataUbiquitousSharedItemRoleKey;
    v101 = NSMetadataUbiquitousSharedItemPermissionsKey;
    v99 = BRURLTagNamesKey;
    v100 = BRModifiedSinceSharedKey;
    v97 = BRMetadataCreatorNameComponentsKey;
    v98 = BRMetadataIsTopLevelSharedItemKey;
    v114 = 1;
    v105 = *(_QWORD *)v137;
    v106 = v4;
    while (1)
    {
      v13 = 0;
      v108 = v11;
      do
      {
        if (*(_QWORD *)v137 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)v13);
        v15 = objc_msgSend(v4, "containsObject:", v14);
        v16 = objc_msgSend(v9, "containsObject:", v14);
        v17 = v16;
        if (!*((_BYTE *)a1[6] + 12) || (v15 & 1) != 0 || v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataItemURLKey));
          v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemURLInLocalContainerKey));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
          v127 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
          v21 = objc_msgSend(v20, "hasPrefix:", a1[7]);

          v121 = v13;
          if (v21)
          {
            v22 = objc_msgSend(a1[7], "length");
            if (v22 < objc_msgSend(v19, "length"))
            {
              v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "substringFromIndex:", objc_msgSend(a1[7], "length")));

              v19 = (void *)v23;
            }
          }
          v124 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemDownloadingErrorKey));
          v130 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemUploadingErrorKey));
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemPercentDownloadedKey));
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemPercentUploadedKey));
          v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v104));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v103));
          v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemDownloadingStatusKey));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemIsDownloadingKey));
          v25 = objc_msgSend(v24, "BOOLValue");

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemIsUploadedKey));
          v126 = objc_msgSend(v26, "BOOLValue");

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemIsUploadingKey));
          v28 = objc_msgSend(v27, "BOOLValue");

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemIsSharedKey));
          v30 = objc_msgSend(v29, "BOOLValue");

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousItemDownloadRequestedKey));
          v110 = objc_msgSend(v31, "BOOLValue");

          v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v102));
          v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousSharedItemOwnerNameComponentsKey));
          v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v101));
          v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", NSMetadataUbiquitousSharedItemMostRecentEditorNameComponentsKey));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v100));
          v111 = objc_msgSend(v32, "BOOLValue");

          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v99));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v98));
          v112 = objc_msgSend(v33, "BOOLValue");

          v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", v97));
          objc_msgSend(a1[5], "write:", " o ");
          if (v15 | v17)
            v34 = 2;
          else
            v34 = 0;
          if (v15)
            v35 = 2;
          else
            v35 = 9;
          objc_msgSend(a1[5], "startFgColor:attr:", v35, v34);
          v36 = a1[5];
          v113 = objc_retainAutorelease(v19);
          objc_msgSend(v36, "write:", "%s", objc_msgSend(v113, "fileSystemRepresentation"));
          objc_msgSend(a1[5], "reset");
          v37 = v120;
          if (v120 != v127)
          {
            objc_msgSend(a1[5], "startFgColor:attr:", 0, 2);
            v38 = a1[5];
            v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "path")));
            objc_msgSend(v38, "write:", " (at %s)", objc_msgSend(v39, "fileSystemRepresentation"));

            objc_msgSend(a1[5], "reset");
          }
          objc_msgSend(a1[5], "startFgColor:", 4);
          if (v126)
          {
            objc_msgSend(a1[5], "puts:", " ☁");
            v40 = v106;
            v41 = (void *)v124;
            v42 = v131;
            if ((v28 & 1) == 0)
              goto LABEL_34;
            goto LABEL_30;
          }
          v40 = v106;
          v41 = (void *)v124;
          v42 = v131;
          if (v28)
          {
LABEL_30:
            objc_msgSend(a1[5], "puts:", " ↑");
            if (v42)
            {
              v43 = a1[5];
              v44 = BRLocalizedFileSizeDescriptionWithExactCount(objc_msgSend(v131, "unsignedLongLongValue"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "description")));
              v90 = objc_msgSend(v46, "UTF8String");
              v47 = v43;
              v42 = v131;
              objc_msgSend(v47, "write:", " %s ", v90);

              v41 = (void *)v124;
            }
            if (v122)
            {
              v48 = a1[5];
              objc_msgSend(v122, "floatValue");
              v50 = v48;
              v42 = v131;
              objc_msgSend(v50, "write:", "%.01f%% ", v49);
            }
LABEL_34:
            if (v25)
            {
LABEL_35:
              objc_msgSend(a1[5], "puts:", " ↓");
              if (v118)
              {
                v51 = a1[5];
                v52 = BRLocalizedFileSizeDescriptionWithExactCount(objc_msgSend(v118, "unsignedLongLongValue"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
                v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "description")));
                v91 = objc_msgSend(v54, "UTF8String");
                v55 = v51;
                v42 = v131;
                objc_msgSend(v55, "write:", " %s ", v91);

              }
              if (v123)
              {
                v56 = a1[5];
                objc_msgSend(v123, "floatValue");
                v58 = v56;
                v42 = v131;
                objc_msgSend(v58, "write:", "%.01f%% ", v57);
              }
LABEL_43:
              objc_msgSend(a1[5], "reset");
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[8], "objectForKeyedSubscript:", v128));
              v60 = (void *)v130;
              if (v59)
              {
                objc_msgSend(a1[5], "startFgColor:", 4);
                v61 = a1[5];
                v92 = objc_msgSend(objc_retainAutorelease(v59), "UTF8String");
                v62 = v61;
                v42 = v131;
                objc_msgSend(v62, "write:", " %s", v92);
                objc_msgSend(a1[5], "reset");
              }
              if (v111)
              {
                objc_msgSend(a1[5], "write:", " ✍️ ");
                objc_msgSend(a1[5], "startFgColor:", 5);
                v63 = a1[5];
                if (v117)
                {
                  v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "br_formattedName")));
                  objc_msgSend(v63, "write:", " by %s", objc_msgSend(v64, "UTF8String"));

                  v60 = (void *)v130;
                }
                else
                {
                  objc_msgSend(v63, "write:", " by Me");
                }
                objc_msgSend(a1[5], "reset");
                v42 = v131;
              }
              if (((v30 ^ 1 | v112) & 1) == 0)
              {
                objc_msgSend(a1[5], "write:", " ➕ ");
                objc_msgSend(a1[5], "startFgColor:", 5);
                v65 = a1[5];
                if (v116)
                {
                  v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "br_formattedName")));
                  v67 = (const char *)objc_msgSend(v66, "UTF8String");
                  v68 = "🤷";
                  if (v67)
                    v68 = v67;
                  objc_msgSend(v65, "write:", " by %s", v68);

                  v60 = (void *)v130;
                }
                else
                {
                  objc_msgSend(v65, "write:", " by Me");
                }
                objc_msgSend(a1[5], "reset");
                v42 = v131;
              }
              if (v30)
                objc_msgSend(a1[5], "write:", " 👥 ");
              objc_msgSend(a1[5], "startFgColor:", 5);
              if (objc_msgSend(v125, "isEqualToString:", NSMetadataUbiquitousSharedItemRoleOwner))
              {
                objc_msgSend(a1[5], "write:", " by Me");
                v13 = v121;
              }
              else
              {
                v13 = v121;
                if (objc_msgSend(v125, "isEqualToString:", NSMetadataUbiquitousSharedItemRoleParticipant))
                {
                  v69 = a1[5];
                  v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "br_formattedName")));
                  v71 = (const char *)objc_msgSend(v70, "UTF8String");
                  v72 = "🤷";
                  if (v71)
                    v72 = v71;
                  v73 = v69;
                  v42 = v131;
                  objc_msgSend(v73, "write:", " by %s", v72);

                  v60 = (void *)v130;
                }
              }
              objc_msgSend(a1[5], "reset");
              if (v129)
              {
                objc_msgSend(a1[5], "startFgColor:", 5);
                v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[9], "objectForKeyedSubscript:", v129));
                v75 = v74;
                if (v74)
                {
                  v76 = a1[5];
                  v93 = objc_msgSend(objc_retainAutorelease(v74), "UTF8String");
                  v77 = v76;
                  v60 = (void *)v130;
                  objc_msgSend(v77, "write:", " (%s)", v93);
                }
                objc_msgSend(a1[5], "reset");

                v42 = v131;
              }
              objc_msgSend(a1[5], "puts:", "\n");
              if (v41)
              {
                objc_msgSend(a1[5], "startFgColor:", 1);
                objc_msgSend(a1[5], "puts:", "\t\t download error:");
                objc_msgSend(a1[5], "reset");
                v78 = a1[5];
                v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "_prettyDescriptionFromError:", v41)));
                v94 = objc_msgSend(v79, "UTF8String");
                v80 = v78;
                v42 = v131;
                objc_msgSend(v80, "write:", " %s\n", v94);

                v60 = (void *)v130;
              }
              if (v60)
              {
                objc_msgSend(a1[5], "startFgColor:", 1);
                objc_msgSend(a1[5], "puts:", "\t\t upload error:");
                objc_msgSend(a1[5], "reset");
                v81 = a1[5];
                v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "_prettyDescriptionFromError:", v60)));
                v95 = objc_msgSend(v82, "UTF8String");
                v83 = v81;
                v42 = v131;
                objc_msgSend(v83, "write:", " %s\n", v95);

                v60 = (void *)v130;
              }
              v84 = v119;
              if (v119)
              {
                objc_msgSend(a1[5], "startFgColor:", 4);
                objc_msgSend(a1[5], "puts:", "\t\t tags:");
                v134 = 0u;
                v135 = 0u;
                v132 = 0u;
                v133 = 0u;
                v85 = v119;
                v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
                if (v86)
                {
                  v87 = v86;
                  v88 = *(_QWORD *)v133;
                  do
                  {
                    for (i = 0; i != v87; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v133 != v88)
                        objc_enumerationMutation(v85);
                      objc_msgSend(a1[5], "puts:", objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)i)), "UTF8String"));
                      objc_msgSend(a1[5], "puts:", " ");
                    }
                    v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
                  }
                  while (v87);
                }

                objc_msgSend(a1[5], "puts:", "\n");
                v37 = v120;
                v13 = v121;
                v41 = (void *)v124;
                v60 = (void *)v130;
                v42 = v131;
                v84 = v119;
              }
              v114 &= v126;

              v9 = v107;
              v11 = v108;
              v12 = v105;
              v4 = v40;
              goto LABEL_83;
            }
          }
          else
          {
            objc_msgSend(a1[5], "puts:", " (Waiting for upload)");
            if (v25)
              goto LABEL_35;
          }
          if (v110
            && (objc_msgSend(v128, "isEqualToString:", NSMetadataUbiquitousItemDownloadingStatusCurrent) & 1) == 0)
          {
            objc_msgSend(a1[5], "puts:", " (Waiting for download)");
          }
          goto LABEL_43;
        }
LABEL_83:
        v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v141, 16);
      if (!v11)
        goto LABEL_87;
    }
  }
  v114 = 1;
LABEL_87:

  objc_msgSend(a1[5], "puts:", "\n");
  objc_msgSend(a1[4], "enableUpdates");
  *((_BYTE *)a1[6] + 16) = v114 & 1;

}

void sub_100009F14(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void sub_100009F5C(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1[4] + 40));
  v5 = v4;

  (*(void (**)(void))(a1[6] + 16))();
  v6 = (void *)a1[5];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
  objc_msgSend(v6, "write:", "%s gathering done in %.3fs\n\n", objc_msgSend(v8, "UTF8String"), v5);

  v9 = a1[4];
  if (*(_BYTE *)(v9 + 14))
    exit(0);
  *(_BYTE *)(v9 + 17) = 1;

}

uint64_t sub_10000A0D8()
{
  puts("monitor [options] [<container> ...]");
  puts("    monitor activity");
  puts("    -g                   dump global activity of the iCloud Drive");
  puts("    -i                   dump changes incrementally");
  puts("    -t                   amount of time in seconds to run the query, the query will stop after the specified time");
  puts("    -p                   only static gathering");
  puts("                         Example: brctl monitor -p com.apple.CloudDoocs");
  puts("    -S,--scope=<scope>");
  puts("                         restrict the NSMetadataQuery scope to docs, data, external or a combination");
  puts("    -w,--wait-uploaded");
  puts("                         wait for all items to be uploaded");
  putchar(10);
  puts("    [<container> ...]    list of containers to monitor, ignored when -g is used");
  return putchar(10);
}

uint64_t sub_10000A184(int a1, char *const *a2)
{
  BRCTLMonitor *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  BRCTLMonitor *v36;
  char *const *v37;
  int v38;
  _BYTE v39[128];

  v38 = a1;
  v37 = a2;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000A614;
  v35[3] = &unk_100024DC8;
  v2 = objc_alloc_init(BRCTLMonitor);
  v36 = v2;
  sub_10000A7D8(&v38, &v37, "gipt:S:w", (const option *)&off_10002A7F0, v35);
  if (-[BRCTLMonitor isGlobal](v2, "isGlobal"))
  {
    -[BRCTLMonitor monitorGlobalActivity](v2, "monitorGlobalActivity");
    goto LABEL_40;
  }
  if (!-[BRCTLMonitor scopes](v2, "scopes"))
    -[BRCTLMonitor setScopes:](v2, "setScopes:", 7);
  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BRContainer allContainersByContainerID](BRContainer, "allContainersByContainerID"));
  v5 = v4;
  if (v38)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v37));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

    if (v7)
    {
      if (v38 >= 1)
      {
        for (i = 0; i < v38; ++i)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v37[i]));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

          if (v10)
            objc_msgSend(v3, "addObject:", v9);

        }
      }
      goto LABEL_23;
    }
    v11 = v3;
    v3 = 0;
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j), "identifier"));
          objc_msgSend(v3, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v13);
    }
  }

LABEL_23:
  if (v3)
    v17 = v3;
  else
    v17 = &__NSArray0__struct;
  v18 = objc_msgSend(v17, "mutableCopy");
  if ((-[BRCTLMonitor scopes](v2, "scopes") & 2) != 0)
    objc_msgSend(v18, "addObject:", NSMetadataQueryUbiquitousDataScope);
  if ((-[BRCTLMonitor scopes](v2, "scopes") & 1) != 0)
    objc_msgSend(v18, "addObject:", NSMetadataQueryUbiquitousDocumentsScope);
  if ((-[BRCTLMonitor scopes](v2, "scopes") & 4) != 0)
    objc_msgSend(v18, "addObject:", NSMetadataQueryAccessibleUbiquitousExternalDocumentsScope);
  v19 = objc_alloc_init((Class)NSMetadataQuery);
  v20 = v19;
  if (v3)
  {
    if (!objc_msgSend(v3, "count"))
      sub_1000170C4(0);
    objc_msgSend(v20, "setSearchScopes:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K LIKE '*/*'"), NSMetadataItemPathKey));
    objc_msgSend(v20, "setPredicate:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URLForUbiquityContainerIdentifier:", v23));

    if (!v24)
      sub_1000170D8(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByDeletingLastPathComponent"));

  }
  else
  {
    if (v38 >= 2)
      sub_10001709C((uint64_t)v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString br_pathWithFileSystemRepresentation:](NSString, "br_pathWithFileSystemRepresentation:", *v37));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "br_realpath"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v27));
    v29 = (uint64_t)objc_msgSend(v24, "br_isInSyncedLocation");
    if ((v29 & 1) == 0)
      sub_1000170B0(v29);
    objc_msgSend(v20, "br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:", v24, v18);
  }

  -[BRCTLMonitor monitorQuery:rootPath:](v2, "monitorQuery:rootPath:", v20, v27);
LABEL_40:

  return 0;
}

id sub_10000A614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseOption:arg:", a2, a3);
}

void sub_10000A624(uint64_t a1, const char *a2)
{
  errx(1, a2);
}

uint64_t sub_10000A6F0(const char *a1, const char **a2)
{
  size_t v4;
  const char *v5;
  size_t v6;
  uint64_t v7;
  const char **v8;
  uint64_t result;
  uint64_t v10;
  const char *v11;

  v4 = strlen(a1);
  v5 = *a2;
  if (!*a2)
    goto LABEL_11;
  v6 = v4;
  v7 = 0;
  v8 = a2 + 2;
  result = 0xFFFFFFFFLL;
  do
  {
    v10 = result;
    if (strlen(v5) == v6 && !strncmp(v5, a1, v6))
    {
      result = v7;
      if ((v10 & 0x80000000) == 0)
      {
        warnx("Operation %s is ambiguous: %s or %s?");
        goto LABEL_12;
      }
    }
    else
    {
      result = v10;
    }
    v11 = *v8;
    v8 += 2;
    v5 = v11;
    v7 = (v7 + 1);
  }
  while (v11);
  if ((result & 0x80000000) != 0)
  {
LABEL_11:
    warnx("No such operation %s");
LABEL_12:
    sub_10000A7C4();
  }
  return result;
}

void sub_10000A7C4()
{
  sub_10000DAF4();
  exit(64);
}

void sub_10000A7D8(int *a1, char *const **a2, const char *a3, const option *a4, void *a5)
{
  int v9;
  uint64_t v10;
  void (**v11)(id, _QWORD, char *);

  v11 = a5;
  v9 = 1;
  optreset = 1;
  optind = 1;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    while (1)
    {
      v10 = getopt_long(*a1, *a2, a3, a4, 0);
      if ((_DWORD)v10 == -1)
        break;
      if ((_DWORD)v10 == 63 || (_DWORD)v10 == 58)
        sub_10000A7C4();
      v11[2](v11, v10, optarg);
    }
    v9 = optind;
  }
  *a1 -= v9;
  *a2 += optind;

}

id sub_10000A8BC(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  size_t v7;
  uint64_t v8;
  const char *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = strlen(a2);
    v8 = 0;
    v9 = "yes";
    while (strncmp(v9, a2, v7))
    {
      v9 = (&off_100024FE0)[v8 + 2];
      v8 += 2;
      if (v8 == 12)
        errx(64, "-%c expects yes/no, received \"%s\"", a1, a2);
    }
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD((&off_100024FE0)[v8 + 1])));
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

id sub_10000A984()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection"));
  v1 = objc_msgSend(v0, "newSyncProxy");

  if (!v1)
    sub_1000170EC(v2);
  return v1;
}

id sub_10000A9C8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v0 = BRIsFPFSEnabled();
  if ((v0 & 1) == 0)
    sub_100017100(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection"));
  v2 = objc_msgSend(v1, "newFPFSSyncProxy");

  if (!v2)
    sub_1000170EC(v3);
  return v2;
}

id sub_10000AA18()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v0 = BRIsFPFSEnabled();
  if ((_DWORD)v0)
    sub_100017114(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection"));
  v2 = objc_msgSend(v1, "newLegacySyncProxy");

  if (!v2)
    sub_1000170EC(v3);
  return v2;
}

intptr_t sub_10000ABD0(uint64_t a1)
{

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000AC00(FILE *a1, void *a2, int a3)
{
  sub_10000AC08(a1, a2, a3, 0);
}

void sub_10000AC08(FILE *a1, void *a2, int a3, int a4)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  unsigned int v24;
  const char *v25;
  FILE *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v35;
  id v38;
  id obj;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  FILE *v44;
  int v45;
  char v46;
  _QWORD v47[5];
  id v48;
  id v49;
  uint64_t *v50;
  BOOL v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[4];
  _QWORD v64[4];
  _BYTE v65[128];

  v35 = a2;
  v38 = (id)_CFURLPromiseCopyPhysicalURL();
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_10000D464;
  v61 = sub_10000D474;
  v62 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));

  v56 = 0;
  objc_msgSend(v38, "getResourceValue:forKey:error:", &v56, NSURLVolumeIdentifierKey, 0);
  v7 = v56;
  v8 = geteuid() == 0;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[BRAccountDescriptor allLoggedInAccountDescriptors](BRAccountDescriptor, "allLoggedInAccountDescriptors"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v53;
    v4 = &unk_100025280;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10000E3CC;
        v47[3] = &unk_100025280;
        v51 = v8;
        v47[4] = v12;
        v48 = v6;
        v49 = v7;
        v50 = &v57;
        BRPerformWithAccountDescriptor(v12, v47);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v9);
  }

  v13 = (id)v58[5];
  _Block_object_dispose(&v57, 8);

  if (a4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v63[0] = CFSTR("logical");
    v15 = objc_retainAutorelease(v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v15, "fileSystemRepresentation")));
    v64[0] = v16;
    v63[1] = CFSTR("physical");
    v17 = objc_retainAutorelease(v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v17, "fileSystemRepresentation")));
    v64[1] = v18;
    v63[2] = CFSTR("account");
    if (v13)
    {
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountIdentifier")));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v4, "UTF8String")));
    }
    else
    {
      v19 = CFSTR("no account found");
    }
    v64[2] = v19;
    v63[3] = CFSTR("synced");
    if (v17)
      v27 = v17;
    else
      v27 = v15;
    if (objc_msgSend(v27, "br_isInSyncedLocation"))
      v28 = "YES";
    else
      v28 = "NO";
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v28));
    v64[3] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 4));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v30, CFSTR("Paths"));

    if (v13)
    {

    }
    v26 = a1;
  }
  else
  {
    fwrite("𒁂  Paths\n", 0xCuLL, 1uLL, a1);
    v20 = objc_retainAutorelease(v35);
    fprintf(a1, "  𒁍  logical:     %s\n", (const char *)objc_msgSend(v20, "fileSystemRepresentation"));
    v21 = objc_retainAutorelease(v38);
    fprintf(a1, "  𒁍  physical:    %s\n", (const char *)objc_msgSend(v21, "fileSystemRepresentation"));
    if (v13)
    {
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountIdentifier")));
      fprintf(a1, "  𒁍  account:     %s\n", (const char *)objc_msgSend(v22, "UTF8String"));

    }
    else
    {
      fprintf(a1, "  𒁍  account:     %s\n", "no account found");
    }
    if (v21)
      v23 = v21;
    else
      v23 = v20;
    v24 = objc_msgSend(v23, "br_isInSyncedLocation");
    v25 = "NO";
    if (v24)
      v25 = "YES";
    v26 = a1;
    fprintf(a1, "  𒁍  synced:      %s\n", v25);
    v14 = 0;
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000B1DC;
  v40[3] = &unk_1000250A8;
  v45 = a3;
  v46 = a4;
  v41 = v14;
  v42 = v35;
  v43 = v38;
  v44 = v26;
  v31 = v38;
  v32 = v35;
  v33 = v14;
  BRPerformWithAccountDescriptor(v13, v40);

}

void sub_10000B1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_10000B1DC(uint64_t a1)
{
  FILE *v1;
  id v2;
  void *v3;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  FILE *v25;
  const char *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  dispatch_time_t v31;
  dispatch_time_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  const char *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  const __CFString *v101;
  const char *v102;
  const char *v103;
  const char *v104;
  const char *v105;
  const char *v106;
  const char *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  uint64_t v122;
  void *k;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  FILE *v128;
  FILE *v129;
  const char *v130;
  id v131;
  id v132;
  id v133;
  void *v134;
  dispatch_semaphore_t v135;
  void *v136;
  id v137;
  uint64_t v138;
  NSObject *v139;
  dispatch_time_t v140;
  FILE *v141;
  id v142;
  uint64_t v143;
  void *v144;
  id v145;
  FILE *v146;
  id v147;
  dispatch_group_t group;
  void *v149;
  id v150;
  void *v151;
  const char *v152;
  id v153;
  const char *v154;
  const char *v155;
  const char *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  id v161;
  __CFString *v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  FILE *v167;
  FILE *v168;
  FILE *v169;
  FILE *v170;
  FILE *v171;
  FILE *v172;
  id v173;
  FILE *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  id v182;
  id obj;
  id obja;
  id objb;
  id objc;
  uint64_t v187;
  void *v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  void *v195;
  id v196;
  void *v197;
  void *v198;
  id v199;
  void *i;
  void *v201;
  id v202;
  id v203;
  void *v204;
  void *v205;
  id v206;
  id v207;
  void *v208;
  void *v209;
  uint64_t v210;
  id v211;
  _QWORD v212[4];
  id v213;
  id v214;
  id v215;
  NSObject *v216;
  uint64_t v217;
  char v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  id v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _QWORD v232[4];
  NSObject *v233;
  uint64_t *v234;
  char v235;
  uint64_t v236;
  uint64_t *v237;
  uint64_t v238;
  uint64_t (*v239)(uint64_t, uint64_t);
  void (*v240)(uint64_t);
  id v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  id v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  _BYTE v251[128];
  _QWORD v252[9];
  _QWORD v253[9];
  _BYTE v254[128];
  _QWORD v255[9];
  _QWORD v256[9];
  _BYTE v257[128];
  _QWORD v258[9];
  _QWORD v259[9];
  _BYTE v260[128];
  _BYTE v261[128];
  _QWORD v262[10];
  _QWORD v263[18];
  _QWORD v264[2];
  _QWORD v265[2];

  fputc(10, *(FILE **)(a1 + 56));
  v210 = a1;
  v5 = *(_DWORD *)(a1 + 64);
  if ((v5 & 8) == 0)
  {
    v151 = 0;
    if ((v5 & 0x20) != 0)
      goto LABEL_37;
LABEL_3:
    v166 = 0;
    if ((v5 & 0x40) != 0)
      goto LABEL_169;
LABEL_4:
    v205 = v166;
    if ((v5 & 0x80) != 0)
      goto LABEL_193;
    goto LABEL_5;
  }
  v264[0] = CFSTR("File Attributes");
  v263[0] = NSURLNameKey;
  v263[1] = NSURLLocalizedNameKey;
  v263[2] = NSURLTypeIdentifierKey;
  v263[3] = NSURLContentTypeKey;
  v263[4] = NSURLHasHiddenExtensionKey;
  v263[5] = NSURLIsHiddenKey;
  v263[6] = NSURLFileResourceTypeKey;
  v263[7] = NSURLIsPackageKey;
  v263[8] = NSURLIsAliasFileKey;
  v263[9] = NSURLFileSizeKey;
  v263[10] = NSURLTotalFileSizeKey;
  v263[11] = NSURLCreationDateKey;
  v263[12] = NSURLContentModificationDateKey;
  v263[13] = NSURLAttributeModificationDateKey;
  v263[14] = NSURLAddedToDirectoryDateKey;
  v263[15] = NSURLFileProtectionKey;
  v263[16] = NSURLDocumentIdentifierKey;
  v263[17] = NSURLThumbnailDictionaryKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v263, 18));
  v264[1] = CFSTR("Ubiquitous Attributes");
  v265[0] = v7;
  v262[0] = NSURLIsUbiquitousItemKey;
  v262[1] = NSURLUbiquitousItemContainerDisplayNameKey;
  v262[2] = NSURLUbiquitousItemHasUnresolvedConflictsKey;
  v262[3] = NSURLUbiquitousItemDownloadRequestedKey;
  v262[4] = NSURLUbiquitousItemIsDownloadingKey;
  v262[5] = NSURLUbiquitousItemIsUploadedKey;
  v262[6] = NSURLUbiquitousItemIsUploadingKey;
  v262[7] = NSURLUbiquitousItemDownloadingStatusKey;
  v262[8] = NSURLUbiquitousItemDownloadingErrorKey;
  v262[9] = NSURLUbiquitousItemUploadingErrorKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v262, 10));
  v265[1] = v8;
  v195 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v265, v264, 2));

  v249 = 0u;
  v250 = 0u;
  v247 = 0u;
  v248 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "allKeys"));
  v191 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v247, v261, 16);
  if (!v191)
  {
    v151 = 0;
    goto LABEL_36;
  }
  v151 = 0;
  v187 = *(_QWORD *)v248;
  do
  {
    for (i = 0; i != v191; i = (char *)i + 1)
    {
      if (*(_QWORD *)v248 != v187)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v247 + 1) + 8 * (_QWORD)i);
      if (*(_BYTE *)(v210 + 68))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

        objc_msgSend(*(id *)(v210 + 32), "setObject:forKeyedSubscript:", v10, v9);
      }
      else
      {
        fprintf(*(FILE **)(v210 + 56), "𒁂  %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
        v10 = v151;
      }
      v11 = *(void **)(v210 + 40);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "objectForKeyedSubscript:", v9));
      v246 = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "promisedItemResourceValuesForKeys:error:", v12, &v246));
      v206 = v246;

      if (v206 || !v13)
      {
        if (*(_BYTE *)(v210 + 68))
          goto LABEL_30;
        v25 = __stderrp;
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v210 + 40), "path")));
        v26 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "description")));
        fprintf(v25, "can't get attributes at '%s': %s\n", v26, (const char *)objc_msgSend(v27, "UTF8String"));

      }
      else
      {
        v244 = 0u;
        v245 = 0u;
        v242 = 0u;
        v243 = 0u;
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "objectForKeyedSubscript:", v9));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v242, v260, 16);
        if (v15)
        {
          v3 = *(void **)v243;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void **)v243 != v3)
                objc_enumerationMutation(v14);
              v17 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * (_QWORD)j);
              if (*(_BYTE *)(v210 + 68))
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v242 + 1) + 8 * (_QWORD)j)));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "description"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\""), CFSTR("'")));

                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
                v1 = (FILE *)NSString;
                v22 = objc_retainAutorelease(v21);
                v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v22, "UTF8String")));
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v2, v17);
              }
              else
              {
                v1 = *(FILE **)(v210 + 56);
                v23 = objc_retainAutorelease(v17);
                v24 = (const char *)objc_msgSend(v23, "UTF8String");
                v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v23));
                v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "description")));
                fprintf(v1, "  𒁍  %s: %s\n", v24, (const char *)objc_msgSend(v2, "UTF8String"));
              }

            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v242, v260, 16);
          }
          while (v15);
        }
      }

      if (*(_BYTE *)(v210 + 68))
      {
LABEL_30:

        v151 = 0;
        goto LABEL_32;
      }
      fputc(10, *(FILE **)(v210 + 56));
      v151 = v10;
LABEL_32:

    }
    v191 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v247, v261, 16);
  }
  while (v191);
LABEL_36:

  v5 = *(_DWORD *)(v210 + 64);
  if ((v5 & 0x20) == 0)
    goto LABEL_3;
LABEL_37:
  if (*(_BYTE *)(v210 + 68))
  {
    v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(*(id *)(v210 + 32), "setObject:forKeyedSubscript:", v166, CFSTR("Versions"));
  }
  else
  {
    fwrite("𒁂  Versions\n", 0xFuLL, 1uLL, *(FILE **)(v210 + 56));
    v166 = 0;
  }
  v236 = 0;
  v237 = &v236;
  v238 = 0x3032000000;
  v239 = sub_10000D464;
  v240 = sub_10000D474;
  v241 = objc_alloc_init((Class)NSMutableDictionary);
  v28 = dispatch_group_create();
  dispatch_group_enter(v28);
  v29 = *(_QWORD *)(v210 + 40);
  v232[0] = _NSConcreteStackBlock;
  v232[1] = 3221225472;
  v232[2] = sub_10000D47C;
  v232[3] = &unk_100025058;
  v235 = *(_BYTE *)(v210 + 68);
  v234 = &v236;
  v30 = v28;
  v233 = v30;
  +[NSFileVersion getNonlocalVersionsOfItemAtURL:completionHandler:](NSFileVersion, "getNonlocalVersionsOfItemAtURL:completionHandler:", v29, v232);
  v31 = dispatch_time(0, 3000000000);
  group = v30;
  if (dispatch_group_wait(v30, v31))
  {
    if (!*(_BYTE *)(v210 + 68))
      fwrite("Fetching non local versions...\n", 0x1FuLL, 1uLL, __stderrp);
    v32 = dispatch_time(0, 120000000000);
    if (dispatch_group_wait(v30, v32) && !*(_BYTE *)(v210 + 68))
      fwrite("Fetching non local versions timed out\n", 0x26uLL, 1uLL, __stderrp);
  }
  v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileVersion currentVersionOfItemAtURL:](NSFileVersion, "currentVersionOfItemAtURL:", *(_QWORD *)(v210 + 40)));
  if (v149)
  {
    if (*(_BYTE *)(v210 + 68))
    {
      v258[0] = CFSTR("name");
      v207 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "localizedName")));
      v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v207, "UTF8String")));
      v259[0] = v201;
      v258[1] = CFSTR("mtime");
      v196 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "modificationDate"));
      v192 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v196, "description")));
      v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v192, "UTF8String")));
      v259[1] = v188;
      v258[2] = CFSTR("device");
      obja = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "localizedNameOfSavingComputer")));
      v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(obja, "UTF8String")));
      v259[2] = v180;
      v258[3] = CFSTR("path");
      v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "URL"));
      v173 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "path")));
      v167 = (FILE *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v173, "fileSystemRepresentation")));
      v259[3] = v167;
      v258[4] = CFSTR("location");
      if (objc_msgSend(v149, "hasLocalContents"))
        v33 = "local";
      else
        v33 = "remote";
      v165 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v33));
      v259[4] = v165;
      v258[5] = CFSTR("conlict");
      if (objc_msgSend(v149, "isConflict"))
        v34 = "true";
      else
        v34 = "false";
      v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v34));
      v259[5] = v164;
      v258[6] = CFSTR("resolved");
      if (objc_msgSend(v149, "isResolved"))
        v35 = "true";
      else
        v35 = "false";
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v35));
      v259[6] = v36;
      v258[7] = CFSTR("thumbnail");
      if (objc_msgSend(v149, "hasThumbnail"))
        v37 = "true";
      else
        v37 = "false";
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v37));
      v259[7] = v38;
      v258[8] = CFSTR("etag");
      v39 = (void *)v237[5];
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "persistentIdentifier"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v40));
      if (v41)
      {
        v42 = (void *)v237[5];
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "persistentIdentifier"));
        v1 = (FILE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v3));
        v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FILE etag](v1, "etag")));
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v2, "UTF8String")));
      }
      else
      {
        v43 = &stru_100026330;
      }
      v259[8] = v43;
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v259, v258, 9));
      objc_msgSend(v166, "addObject:", v56);

      if (v41)
      {

      }
    }
    else
    {
      v174 = *(FILE **)(v210 + 56);
      v207 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "localizedName")));
      v168 = (FILE *)objc_msgSend(v207, "UTF8String");
      v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "modificationDate"));
      v196 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v201, "description")));
      v165 = objc_msgSend(v196, "UTF8String");
      v192 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "localizedNameOfSavingComputer")));
      v44 = (const char *)objc_msgSend(v192, "UTF8String");
      v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "URL"));
      obja = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "path")));
      v45 = (const char *)objc_msgSend(obja, "fileSystemRepresentation");
      if (objc_msgSend(v149, "hasLocalContents"))
        v46 = "local";
      else
        v46 = "remote";
      if (objc_msgSend(v149, "isConflict"))
        v47 = "|conflict";
      else
        v47 = "";
      if (objc_msgSend(v149, "isResolved"))
        v48 = "|resolved";
      else
        v48 = "";
      if (objc_msgSend(v149, "hasThumbnail"))
        v49 = "|thumbnail";
      else
        v49 = "";
      v50 = (void *)v237[5];
      v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "persistentIdentifier"));
      v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", v180));
      if (v177)
      {
        v51 = (void *)v237[5];
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "persistentIdentifier"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v52));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "etag"));
        v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" etag:"), "stringByAppendingString:", v54)));
        fprintf(v174, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", (const char *)v168, (const char *)v165, v44, v45, v46, v47, v48, v49, (const char *)objc_msgSend(v55, "UTF8String"));

      }
      else
      {
        fprintf(v174, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", (const char *)v168, (const char *)v165, v44, v45, v46, v47, v48, v49, "");
      }
    }

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:", *(_QWORD *)(v210 + 40)));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "sortedArrayUsingSelector:", "modificationDate"));

  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v150 = v58;
  v160 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v228, v257, 16);
  if (v160)
  {
    v158 = *(_QWORD *)v229;
    do
    {
      v208 = 0;
      do
      {
        if (*(_QWORD *)v229 != v158)
          objc_enumerationMutation(v150);
        v59 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * (_QWORD)v208);
        if (*(_BYTE *)(v210 + 68))
        {
          v255[0] = CFSTR("name");
          v202 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedName")));
          v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v202, "UTF8String")));
          v256[0] = v197;
          v255[1] = CFSTR("mtime");
          v193 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "modificationDate"));
          v189 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "description")));
          objb = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v189, "UTF8String")));
          v256[1] = objb;
          v255[2] = CFSTR("device");
          v181 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedNameOfSavingComputer")));
          v178 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v181, "UTF8String")));
          v256[2] = v178;
          v255[3] = CFSTR("path");
          v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "URL"));
          v169 = (FILE *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "path")));
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), -[FILE fileSystemRepresentation](v169, "fileSystemRepresentation")));
          v256[3] = v60;
          v255[4] = CFSTR("location");
          if (objc_msgSend(v59, "hasLocalContents"))
            v61 = "local";
          else
            v61 = "remote";
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v61));
          v256[4] = v62;
          v255[5] = CFSTR("conlict");
          if (objc_msgSend(v59, "isConflict"))
            v63 = "true";
          else
            v63 = "false";
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v63));
          v256[5] = v64;
          v255[6] = CFSTR("resolved");
          if (objc_msgSend(v59, "isResolved"))
            v65 = "true";
          else
            v65 = "false";
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v65));
          v256[6] = v66;
          v255[7] = CFSTR("thumbnail");
          if (objc_msgSend(v59, "hasThumbnail"))
            v67 = "true";
          else
            v67 = "false";
          v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v67));
          v256[7] = v68;
          v255[8] = CFSTR("etag");
          v69 = (void *)v237[5];
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "persistentIdentifier"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", v70));
          if (v71)
          {
            v72 = (void *)v237[5];
            v165 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "persistentIdentifier"));
            v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v165));
            v163 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "etag")));
            v162 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v163, "UTF8String")));
            v73 = v162;
          }
          else
          {
            v73 = &stru_100026330;
          }
          v256[8] = v73;
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v256, v255, 9));
          objc_msgSend(v166, "addObject:", v85);

          if (v71)
          {

          }
        }
        else
        {
          v170 = *(FILE **)(v210 + 56);
          v202 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedName")));
          v156 = (const char *)objc_msgSend(v202, "UTF8String");
          v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "modificationDate"));
          v193 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "description")));
          v154 = (const char *)objc_msgSend(v193, "UTF8String");
          v189 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedNameOfSavingComputer")));
          v152 = (const char *)objc_msgSend(v189, "UTF8String");
          objb = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "URL"));
          v181 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(objb, "path")));
          v74 = (const char *)objc_msgSend(v181, "fileSystemRepresentation");
          if (objc_msgSend(v59, "hasLocalContents"))
            v75 = "local";
          else
            v75 = "remote";
          if (objc_msgSend(v59, "isConflict"))
            v76 = "|conflict";
          else
            v76 = "";
          if (objc_msgSend(v59, "isResolved"))
            v77 = "|resolved";
          else
            v77 = "";
          if (objc_msgSend(v59, "hasThumbnail"))
            v78 = "|thumbnail";
          else
            v78 = "";
          v79 = (void *)v237[5];
          v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "persistentIdentifier"));
          v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", v178));
          if (v175)
          {
            v80 = (void *)v237[5];
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "persistentIdentifier"));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKeyedSubscript:", v81));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "etag"));
            v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" etag:"), "stringByAppendingString:", v83)));
            fprintf(v170, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v156, v154, v152, v74, v75, v76, v77, v78, (const char *)objc_msgSend(v84, "UTF8String"));

          }
          else
          {
            fprintf(v170, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v156, v154, v152, v74, v75, v76, v77, v78, "");
          }
        }

        v208 = (char *)v208 + 1;
      }
      while (v160 != v208);
      v86 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v228, v257, 16);
      v160 = v86;
    }
    while (v86);
  }

  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  v153 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v237[5], "allValues"));
  v161 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v224, v254, 16);
  if (v161)
  {
    v159 = *(_QWORD *)v225;
    do
    {
      v209 = 0;
      do
      {
        if (*(_QWORD *)v225 != v159)
          objc_enumerationMutation(v153);
        v87 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * (_QWORD)v209);
        if (*(_BYTE *)(v210 + 68))
        {
          v252[0] = CFSTR("name");
          v203 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "localizedName")));
          v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v203, "UTF8String")));
          v253[0] = v198;
          v252[1] = CFSTR("mtime");
          v194 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "modificationDate"));
          v190 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v194, "description")));
          objc = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v190, "UTF8String")));
          v253[1] = objc;
          v252[2] = CFSTR("device");
          v182 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "localizedNameOfSavingComputer")));
          v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v182, "UTF8String")));
          v253[2] = v179;
          v252[3] = CFSTR("path");
          v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "URL"));
          v171 = (FILE *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "path")));
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), -[FILE fileSystemRepresentation](v171, "fileSystemRepresentation")));
          v253[3] = v88;
          v252[4] = CFSTR("location");
          if (objc_msgSend(v87, "hasLocalContents"))
            v89 = "local";
          else
            v89 = "remote";
          v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v89));
          v253[4] = v90;
          v252[5] = CFSTR("conlict");
          if (objc_msgSend(v87, "isConflict"))
            v91 = "true";
          else
            v91 = "false";
          v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v91));
          v253[5] = v92;
          v252[6] = CFSTR("resolved");
          if (objc_msgSend(v87, "isResolved"))
            v93 = "true";
          else
            v93 = "false";
          v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v93));
          v253[6] = v94;
          v252[7] = CFSTR("thumbnail");
          if (objc_msgSend(v87, "hasThumbnail"))
            v95 = "true";
          else
            v95 = "false";
          v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v95));
          v253[7] = v96;
          v252[8] = CFSTR("etag");
          v97 = (void *)v237[5];
          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "persistentIdentifier"));
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectForKeyedSubscript:", v98));
          if (v99)
          {
            v100 = (void *)v237[5];
            v165 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "persistentIdentifier"));
            v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", v165));
            v163 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "etag")));
            v162 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v163, "UTF8String")));
            v101 = v162;
          }
          else
          {
            v101 = &stru_100026330;
          }
          v253[8] = v101;
          v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v253, v252, 9));
          objc_msgSend(v166, "addObject:", v114);

          if (v99)
          {

          }
        }
        else
        {
          v172 = *(FILE **)(v210 + 56);
          v203 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "localizedName")));
          v157 = (const char *)objc_msgSend(v203, "UTF8String");
          v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "modificationDate"));
          v194 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "description")));
          v155 = (const char *)objc_msgSend(v194, "UTF8String");
          v190 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "localizedNameOfSavingComputer")));
          v102 = (const char *)objc_msgSend(v190, "UTF8String");
          objc = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "URL"));
          v182 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(objc, "path")));
          v103 = (const char *)objc_msgSend(v182, "fileSystemRepresentation");
          if (objc_msgSend(v87, "hasLocalContents"))
            v104 = "local";
          else
            v104 = "remote";
          if (objc_msgSend(v87, "isConflict"))
            v105 = "|conflict";
          else
            v105 = "";
          if (objc_msgSend(v87, "isResolved"))
            v106 = "|resolved";
          else
            v106 = "";
          if (objc_msgSend(v87, "hasThumbnail"))
            v107 = "|thumbnail";
          else
            v107 = "";
          v108 = (void *)v237[5];
          v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "persistentIdentifier"));
          v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectForKeyedSubscript:", v179));
          if (v176)
          {
            v109 = (void *)v237[5];
            v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "persistentIdentifier"));
            v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "objectForKeyedSubscript:", v110));
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "etag"));
            v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" etag:"), "stringByAppendingString:", v112)));
            fprintf(v172, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v157, v155, v102, v103, v104, v105, v106, v107, (const char *)objc_msgSend(v113, "UTF8String"));

          }
          else
          {
            fprintf(v172, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v157, v155, v102, v103, v104, v105, v106, v107, "");
          }
        }

        v209 = (char *)v209 + 1;
      }
      while (v161 != v209);
      v115 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v224, v254, 16);
      v161 = v115;
    }
    while (v115);
  }

  if (*(_BYTE *)(v210 + 68))
  {

    v166 = 0;
  }
  else
  {
    fputc(10, *(FILE **)(v210 + 56));
  }

  _Block_object_dispose(&v236, 8);
  v5 = *(_DWORD *)(v210 + 64);
  if ((v5 & 0x40) == 0)
    goto LABEL_4;
LABEL_169:
  if (*(_BYTE *)(v210 + 68))
  {
    v205 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

    objc_msgSend(*(id *)(v210 + 32), "setObject:forKeyedSubscript:", v205, CFSTR("Thumbnail"));
  }
  else
  {
    fwrite("𒁂  Thumbnail\n", 0x10uLL, 1uLL, *(FILE **)(v210 + 56));
    v205 = v166;
  }
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[GSStorageManager manager](GSStorageManager, "manager"));
  v117 = ((uint64_t (*)(void))BRIsFPFSEnabled)();
  v118 = 48;
  if (v117)
    v118 = 40;
  v119 = *(_QWORD *)(v210 + v118);
  v223 = 0;
  v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "permanentStorageForItemAtURL:allocateIfNone:error:", v119, 0, &v223));
  v199 = v223;

  if (v199 || !v204)
  {
    if (!*(_BYTE *)(v210 + 68))
    {
      v129 = __stderrp;
      v120 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v210 + 40), "path")));
      v130 = (const char *)objc_msgSend(v120, "fileSystemRepresentation");
      v131 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "description")));
      fprintf(v129, "can't get thumbnails at '%s': %s\n", v130, (const char *)objc_msgSend(v131, "UTF8String"));

      goto LABEL_189;
    }
LABEL_190:

    v205 = 0;
  }
  else
  {
    v120 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v204, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:", CFSTR("com.apple.thumbnails"), 0, 0, 0xFFFFFFFFLL));
    v222 = 0u;
    v220 = 0u;
    v221 = 0u;
    v219 = 0u;
    v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v219, v251, 16);
    if (v121)
    {
      v122 = *(_QWORD *)v220;
      do
      {
        for (k = 0; k != v121; k = (char *)k + 1)
        {
          if (*(_QWORD *)v220 != v122)
            objc_enumerationMutation(v120);
          v124 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * (_QWORD)k);
          if (*(_BYTE *)(v210 + 68))
          {
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "url"));
            v126 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "path")));
            v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v126, "UTF8String")));
            objc_msgSend(v205, "addObject:", v127);

          }
          else
          {
            v128 = *(FILE **)(v210 + 56);
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "url"));
            v126 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "path")));
            fprintf(v128, "  𒁍  thumbnail: %s\n", (const char *)objc_msgSend(v126, "UTF8String"));
          }

        }
        v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v219, v251, 16);
      }
      while (v121);
    }
LABEL_189:

    if (*(_BYTE *)(v210 + 68))
      goto LABEL_190;
    fputc(10, *(FILE **)(v210 + 56));
  }

  if ((*(_DWORD *)(v210 + 64) & 0x80) == 0)
  {
LABEL_5:
    v6 = v151;
    goto LABEL_205;
  }
LABEL_193:
  if (*(_BYTE *)(v210 + 68))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));

    v132 = objc_msgSend(*(id *)(v210 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("Lookup"));
  }
  else
  {
    v132 = (id)fwrite("𒁂  Lookup\n", 0xDuLL, 1uLL, *(FILE **)(v210 + 56));
    v6 = v151;
  }
  if (!BRIsFPFSEnabled(v132))
  {
    v133 = sub_10000AA18();
    v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
    v135 = dispatch_semaphore_create(0);
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v210 + 40), "path"));
    v212[0] = _NSConcreteStackBlock;
    v212[1] = 3221225472;
    v212[2] = sub_10000D608;
    v212[3] = &unk_100025080;
    v218 = *(_BYTE *)(v210 + 68);
    v213 = *(id *)(v210 + 48);
    v137 = v134;
    v214 = v137;
    v6 = v6;
    v138 = *(_QWORD *)(v210 + 56);
    v215 = v6;
    v217 = v138;
    v139 = v135;
    v216 = v139;
    objc_msgSend(v137, "gatherInformationForPath:reply:", v136, v212);

    v140 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v139, v140))
    {
      if (*(_BYTE *)(v210 + 68))
        goto LABEL_203;
      v141 = __stderrp;
      v142 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v210 + 48), "path")));
      fprintf(v141, "timed out getting lookup info at '%s'\n", (const char *)objc_msgSend(v142, "fileSystemRepresentation"));

    }
    if (!*(_BYTE *)(v210 + 68))
    {
LABEL_204:

      goto LABEL_205;
    }
LABEL_203:

    v6 = 0;
    goto LABEL_204;
  }
  if (!*(_BYTE *)(v210 + 68))
    fwrite("NOT IMPLEMENTED IN FPFS\n", 0x18uLL, 1uLL, *(FILE **)(v210 + 56));
LABEL_205:
  if (*(_BYTE *)(v210 + 68))
  {
    v143 = *(_QWORD *)(v210 + 32);
    v211 = 0;
    v144 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization jsonStringFromDictionary:options:error:](NSJSONSerialization, "jsonStringFromDictionary:options:error:", v143, 1, &v211));
    v145 = v211;
    if (v145)
      sub_10001716C(v145);
    v146 = *(FILE **)(v210 + 56);
    v147 = objc_retainAutorelease(v144);
    fputs((const char *)objc_msgSend(v147, "UTF8String"), v146);

  }
}

void sub_10000D424(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x280], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D464(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000D474(uint64_t a1)
{

}

void sub_10000D47C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  FILE *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      v8 = __stderrp;
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
      fprintf(v8, "Unable to list versions: %s\n", (const char *)objc_msgSend(v9, "UTF8String"));

    }
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v5);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentIdentifier"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

        }
        v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_10000D608(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  FILE *v17;
  id v18;
  const char *v19;
  FILE *v20;
  id v21;
  const char *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v5 = a2;
  v6 = a3;
  v25 = v6;
  if (!v5 || v6)
  {
    if (!*(_BYTE *)(a1 + 72))
    {
      v20 = __stderrp;
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path")));
      v22 = (const char *)objc_msgSend(v21, "fileSystemRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "error"));
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description")));
      fprintf(v20, "failed getting lookup info at '%s': %s\n", v22, (const char *)objc_msgSend(v24, "UTF8String"));

    }
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = objc_msgSend(&off_100027F40, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(&off_100027F40);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));

          if (v12)
          {
            if (*(_BYTE *)(a1 + 72))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\""), CFSTR("'")));

              v15 = objc_retainAutorelease(v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(v15, "UTF8String")));
              objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, v11);

            }
            else
            {
              v17 = *(FILE **)(a1 + 64);
              v18 = objc_retainAutorelease(v11);
              v19 = (const char *)objc_msgSend(v18, "UTF8String");
              v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v18)));
              fprintf(v17, "  𒁍  %s: %s\n", v19, (const char *)objc_msgSend(v15, "UTF8String"));
            }

          }
        }
        v8 = objc_msgSend(&off_100027F40, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

uint64_t sub_10000DAF4()
{
  const char *v0;

  v0 = getprogname();
  printf("Usage: %s <command> [command-options and arguments]\n", v0);
  putchar(10);
  puts("    -h,--help            show this help");
  putchar(10);
  puts("COMMANDS");
  putchar(10);
  sub_100016CAC();
  sub_100006F1C();
  puts("dump [options] [<container>]");
  puts("    dump the CloudDocs database");
  putchar(10);
  puts("    -o,--output=<file-path>");
  puts("                         redirect output to <file-path>");
  puts("    -d,--database-path=<db-path>");
  puts("                         Use the database at <db-path>");
  puts("    -e,--enterprise");
  puts("                         Use the Data Separated database");
  puts("    -i,--itemless");
  puts("                         Don't dump items from the db");
  puts("    -u,--upgrade");
  puts("                         Upgrade the db if necessary before dumping");
  puts("    -v,--verbose");
  puts("                         Be verbose when dumping the database");
  putchar(10);
  puts("    [<container>]        the container to be dumped");
  putchar(10);
  puts("status [<containers>]");
  puts("    Prints items which haven't been completely synced up / applied to disk");
  putchar(10);
  puts("    [<container>]        the container to be dumped");
  putchar(10);
  puts("accounts [options]");
  puts("    Displays iCloudDrive eligible accounts and their logged in/out status and directory name");
  puts("    -w,--wait            wait for logged in accounts to load");
  putchar(10);
  puts("quota");
  puts("    Displays the available quota in the account");
  putchar(10);
  sub_10000A0D8();
  puts("spotlight [<command>]");
  putchar(10);
  puts("    enable                enables spotlight indexing");
  puts("    disable               disables spotlight indexing");
  putchar(10);
  return 64;
}

BOOL sub_10000DCEC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  id v18;
  FILE *v19;
  const char *v20;
  const char *v21;
  const char *v23;
  FILE *v24;
  id v25;
  id v26;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v26 = 0;
  v6 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v4, v3, &v26);
  v7 = v26;
  if ((v6 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enumeratorAtPath:", v3));
    v9 = 0;
    while (1)
    {
      v10 = v9;
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

      v11 = v9 == 0;
      if (!v9)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v9));
      v25 = v7;
      v13 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v4, v12, &v25);
      v14 = v25;

      v7 = v14;
      if ((v13 & 1) == 0)
      {
        v24 = __stderrp;
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
        v23 = (const char *)objc_msgSend(v15, "UTF8String");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
        v17 = (const char *)objc_msgSend(v16, "UTF8String");
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description")));
        fprintf(v24, "Unable to set attributes (attributes: %s, path: %s, error: %s).", v23, v17, (const char *)objc_msgSend(v18, "UTF8String"));

        v7 = v14;
        goto LABEL_7;
      }
    }
  }
  else
  {
    v19 = __stderrp;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    v20 = (const char *)objc_msgSend(v8, "UTF8String");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    v21 = (const char *)objc_msgSend(v9, "UTF8String");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
    fprintf(v19, "Unable to set attributes (attributes: %s, path: %s, error: %s).", v20, v21, (const char *)objc_msgSend(v15, "UTF8String"));
LABEL_7:

    v11 = 0;
  }

  return v11;
}

uint64_t sub_10000DF24()
{
  return 1;
}

uint64_t sub_10000DF2C(const char *a1, int a2)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  const char *v7;
  pid_t v8;
  size_t size;
  int v11[4];
  uint64_t v12;

  *(_OWORD *)v11 = xmmword_10001B604;
  v12 = 0;
  size = 0;
  v4 = sysctl(v11, 3u, 0, &size, 0, 0);
  if (!(_DWORD)v4)
  {
    v5 = (char *)malloc_type_malloc(size, 0xAF081F82uLL);
    v4 = sysctl(v11, 3u, v5, &size, 0, 0);
    if (!(_DWORD)v4)
    {
      if (size >= 0x288)
      {
        v6 = size / 0x288;
        v7 = v5 + 243;
        v4 = 0xFFFFFFFFLL;
        do
        {
          v8 = *(_DWORD *)(v7 - 203);
          if (v8 >= 1 && !strncmp(a1, v7, 0x10uLL))
            v4 = kill(v8, a2);
          v7 += 648;
          --v6;
        }
        while (v6);
      }
      else
      {
        v4 = 0xFFFFFFFFLL;
      }
    }
    free(v5);
  }
  return v4;
}

NSMutableArray *sub_10000E08C(const char *a1)
{
  NSMutableArray *v2;
  int *v3;
  size_t v4;
  int *v5;
  uint64_t v6;
  char *v7;
  const char *v8;
  void *v9;
  size_t size;
  char buffer[1024];
  int v13[4];
  uint64_t v14;

  *(_OWORD *)v13 = xmmword_10001B604;
  v14 = 0;
  size = 0;
  v2 = 0;
  if (!sysctl(v13, 3u, 0, &size, 0, 0))
  {
    v3 = (int *)malloc_type_malloc(size, 0xE6FE6C88uLL);
    v2 = 0;
    if (!sysctl(v13, 3u, v3, &size, 0, 0))
    {
      if (size >= 0x288)
      {
        v2 = 0;
        v4 = size / 0x288;
        v5 = v3 + 10;
        do
        {
          v6 = *v5;
          if ((v6 & 0x80000000) == 0 && (proc_pidpath(*v5, buffer, 0x400u) & 0x80000000) == 0)
          {
            v7 = strrchr(buffer, 47);
            v8 = v7 ? v7 + 1 : buffer;
            if (!strcmp(v8, a1))
            {
              if (!v2)
                v2 = objc_opt_new(NSMutableArray);
              v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
              -[NSMutableArray addObject:](v2, "addObject:", v9);

            }
          }
          v5 += 162;
          --v4;
        }
        while (v4);
      }
      else
      {
        v2 = 0;
      }
    }
    free(v3);
  }
  return v2;
}

uint64_t sub_10000E23C()
{
  if (qword_10002A920 != -1)
    dispatch_once(&qword_10002A920, &stru_1000250C8);
  return dword_10002A918;
}

void sub_10000E27C(id a1)
{
  uid_t v1;
  int v2;

  v1 = getuid();
  if (!v1)
    v1 = getuid();
  if (v1 == -101)
    v2 = 0;
  else
    v2 = v1;
  dword_10002A918 = v2;
}

uint64_t start(unsigned int a1, char *const *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const char **v7;
  unsigned int v8;
  const char **v10;
  unsigned int v11;

  v11 = a1;
  v10 = (const char **)a2;
  v3 = getpid();
  v4 = sandbox_check(v3, 0, 0);
  if ((_DWORD)v4)
    sub_1000171B0(v4);
  v5 = MKBDeviceUnlockedSinceBoot();
  if (v5 < 0)
    errx(70, "We can't figure out if the device is unlocked: error %d", v5);
  if (!v5)
    sub_100017198();
  setenv("POSIXLY_CORRECT", "1", 1);
  if (os_variant_has_internal_content("com.apple.CloudDocs"))
    execv("/usr/local/bin/brctl_internal", a2);
  sub_10000A7D8((int *)&v11, (char *const **)&v10, "h", (const option *)&off_1000250E8, &stru_100025168);
  v6 = v11;
  if ((int)v11 <= 0)
  {
    sub_10000DAF4();
    exit(64);
  }
  v7 = v10;
  v8 = sub_10000A6F0(*v10, (const char **)&off_100025188);
  return ((uint64_t (*)(uint64_t, const char **))(&off_100025188)[2 * v8 + 1])(v6, v7);
}

void sub_10000E3B4(id a1, int a2, const char *a3)
{
  if (a2 == 104)
    sub_10000A7C4();
}

void sub_10000E3CC(uint64_t a1)
{
  void *v2;
  NSString *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  if (*(_BYTE *)(a1 + 64) && (objc_msgSend(*(id *)(a1 + 32), "isDataSeparated") & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HOME")));
    if (*(_BYTE *)(a1 + 64))
    {
      v3 = NSHomeDirectoryForUser(CFSTR("mobile"));
      v4 = objc_claimAutoreleasedReturnValue(v3);

      v2 = (void *)v4;
    }
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString br_currentHomeDir](NSString, "br_currentHomeDir"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));
  v7 = 0;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v7, NSURLVolumeIdentifierKey, 0);
  v6 = v7;

  if (objc_msgSend(*(id *)(a1 + 48), "isEqual:", v6))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));

}

uint64_t sub_10000E4D0(int a1, char *const *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  const char *v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;
  int v11;
  int v12;
  const char *v13;
  void *v14;
  id v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t (**v24)(void);
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unsigned __int8 v29;
  id v30;
  unsigned __int8 v31;
  __CFString *v32;
  const __CFString *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  int v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 v45;
  id v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[11];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  const char **v99;
  int v100;
  id v101;
  uint8_t v102[128];
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;

  v100 = a1;
  v99 = (const char **)a2;
  v95 = 0;
  v96 = &v95;
  v97 = 0x2020000000;
  v98 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = sub_10000D464;
  v93 = sub_10000D474;
  v94 = 0;
  v88 = 0;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 1;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10001046C;
  v67[3] = &unk_1000253A8;
  v67[4] = &v95;
  v67[5] = &v89;
  v67[6] = &v84;
  v67[7] = &v80;
  v67[8] = &v76;
  v67[9] = &v72;
  v67[10] = &v68;
  sub_10000A7D8(&v100, (char *const **)&v99, "d:o:iuefv", (const option *)&off_1000252A0, v67);
  if (!v90[5])
    *((_BYTE *)v81 + 24) = 0;
  v2 = sub_100010560((const char *)v96[3], &v88);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)qword_10002A928;
  qword_10002A928 = v3;

  if (v100 < 1 || (v5 = *v99, !strcmp(*v99, "all")))
    v54 = 0;
  else
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  if (objc_msgSend(objc_retainAutorelease((id)v90[5]), "fileSystemRepresentation"))
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease((id)v90[5]), "fileSystemRepresentation");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name")));
    v6 = (const char *)objc_msgSend(v8, "UTF8String");

  }
  if (!*((_BYTE *)v73 + 24))
  {
    v9 = objc_msgSend((id)qword_10002A928, "fileDescriptor");
    v10 = *v99;
    if (!*v99)
      v10 = "all";
    dprintf(v9, "brctl: dumping\n    containers:   <%s>\n    from:         %s\n", v10, v6);
    if (!v90[5])
    {
      v11 = objc_msgSend((id)qword_10002A928, "fileDescriptor");
      v12 = BRIsFPFSEnabled();
      v13 = "Disabled";
      if (v12)
        v13 = "Enabled";
      dprintf(v11, "    FPFS Feature: %s\n", v13);
    }
  }
  if (v90[5])
  {
    v55 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "URLByAppendingPathComponent:", CFSTR("client.db")));
    v15 = objc_alloc_init((Class)PQLConnection);
    v101 = 0;
    v16 = objc_msgSend(v15, "openAtURL:withFlags:error:", v14, 1, &v101);
    v17 = v101;
    if ((v16 & 1) == 0)
      goto LABEL_52;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userVersion"));
    v19 = brc_bread_crumbs("getAccountSessionClassForDatabaseURL", 359);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = brc_default_log(1);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v104 = v14;
      v105 = 2112;
      v106 = v18;
      v107 = 2112;
      v108 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Database version of %@ is %@%@", buf, 0x20u);
    }

    objc_msgSend(v15, "close:", 0);
    v23 = (uint64_t)objc_msgSend(v18, "longLongValue");
    v24 = off_10002A8D8;
    if (v23 >= 30000)
      v24 = &off_10002A8E0;
    v25 = (*v24)();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sessionForDumpingDatabasesAtURL:", v55));
    v28 = *((unsigned __int8 *)v81 + 24);
    v66 = 0;
    v29 = objc_msgSend(v27, "initializeOfflineDatabaseWhileUpgrading:loadClientState:forDBDump:error:", v28, 1, 1, &v66);
    v30 = v66;
    v17 = v30;
    if ((v29 & 1) == 0)
    {
LABEL_52:
      objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"))), "UTF8String");
      errx(1, "Unable to open database: %s");
    }
    if (*((_BYTE *)v73 + 24))
    {
      v64 = v30;
      v31 = objc_msgSend(v27, "dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:", qword_10002A928, 0, 0, &v64);
      v32 = (__CFString *)v64;

      if ((v31 & 1) == 0)
      {
        objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__CFString description](v32, "description"))), "UTF8String");
        errx(1, "Unable to dump FPFS migration status: %s");
      }
    }
    else
    {
      v43 = *((unsigned __int8 *)v85 + 24);
      v44 = *((unsigned __int8 *)v69 + 24);
      v65 = v30;
      v45 = objc_msgSend(v27, "dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:", qword_10002A928, v54, v43, v44, 0, &v65);
      v32 = (__CFString *)v65;

      if ((v45 & 1) == 0)
      {
        objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__CFString description](v32, "description"))), "UTF8String");
        errx(1, "Unable to dump database: %s");
      }
    }
    goto LABEL_49;
  }
  if (*((_BYTE *)v73 + 24))
    v33 = CFSTR("FPFS Migration Status");
  else
    v33 = CFSTR("database");
  v55 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to dump %@"), v33));
  if (!*((_BYTE *)v77 + 24))
  {
    v32 = CFSTR("__defaultPersonaID__");
LABEL_45:
    v46 = sub_10000A984();
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v27 = v47;
    v48 = qword_10002A928;
    if (*((_BYTE *)v73 + 24))
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100010668;
      v56[3] = &unk_100024ED0;
      v49 = v56;
      v57 = v47;
      objc_msgSend(v57, "dumpFPFSMigrationStatusTo:personaID:includeNonMigratedItems:reply:", v48, v32, 0, v56);
    }
    else
    {
      v50 = *((unsigned __int8 *)v85 + 24);
      v51 = *((unsigned __int8 *)v69 + 24);
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_100010658;
      v58[3] = &unk_100024ED0;
      v49 = v58;
      v59 = v47;
      objc_msgSend(v59, "dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:", v48, v54, v32, v50, v51, v58);
    }

    v52 = objc_msgSend(v27, "resultWithTimeout:exitMessage:", dword_10002A8D0, v55);
LABEL_49:

    goto LABEL_50;
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v34 = (id)objc_claimAutoreleasedReturnValue(+[BRAccountDescriptor allLoggedInAccountDescriptors](BRAccountDescriptor, "allLoggedInAccountDescriptors"));
  v32 = 0;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v102, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v38, "isDataSeparated"))
        {
          v39 = objc_msgSend((id)qword_10002A928, "fileDescriptor");
          v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "organizationName")));
          dprintf(v39, "\n\ndatabase for data separated persona (managed by %s)\n", (const char *)objc_msgSend(v40, "UTF8String"));

          v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "personaIdentifier"));
          v32 = (__CFString *)v41;
        }
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v102, 16);
    }
    while (v35);
  }

  v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stringByAppendingString:", CFSTR(" for enterprise account")));
  v55 = (id)v42;
  if (v32)
    goto LABEL_45;
LABEL_50:

  if (v88)
  {
    +[BRCTermDumper execPagerOnFileFd:](BRCTermDumper, "execPagerOnFileFd:", objc_msgSend((id)qword_10002A928, "fileDescriptor"));
    __break(1u);
  }
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);
  return 0;
}

void sub_10000ED58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a66;
  char a72;

  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

id sub_10000EDE4(int a1, char *const *a2)
{
  const char *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id result;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  const char **v21;
  int v22;

  v22 = a1;
  v21 = (const char **)a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010768;
  v15[3] = &unk_100024EA8;
  v15[4] = &v17;
  sub_10000A7D8(&v22, (char *const **)&v21, "o:", (const option *)&off_1000253C8, v15);
  if (v22 < 1 || (v2 = *v21, !strcmp(*v21, "all")))
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2));
  v4 = sub_100010560((const char *)v18[3], &v16);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)qword_10002A928;
  qword_10002A928 = v5;

  v7 = sub_10000A984();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = qword_10002A928;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010780;
  v13[3] = &unk_100024ED0;
  v10 = v8;
  v14 = v10;
  objc_msgSend(v10, "printStatus:containerID:reply:", v9, v3, v13);
  v11 = objc_msgSend(v10, "resultWithTimeout:exitMessage:", dword_10002A8D0, CFSTR("self-check failed"));
  if (v16)
  {
    result = +[BRCTermDumper execPagerOnFileFd:](BRCTermDumper, "execPagerOnFileFd:", objc_msgSend((id)qword_10002A928, "fileDescriptor"));
    __break(1u);
  }
  else
  {

    _Block_object_dispose(&v17, 8);
    return 0;
  }
  return result;
}

void sub_10000EFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EFBC(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;

  optreset = 1;
  optind = 1;
  v2 = (a1 - 1);
  if (a1 <= 1)
    sub_10000A7C4();
  v3 = a2 + 8;
  v4 = (&off_100025408)[2 * sub_10000A6F0(*(const char **)(a2 + 8), (const char **)&off_100025408) + 1];
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(v2, v3);
}

uint64_t sub_10000F02C(int a1, char *const *a2)
{
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __CFString *v6;
  unsigned int v7;
  unsigned int v8;
  const char *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  const char *v13;
  unsigned int v14;
  id v15;
  const char *v16;
  const char *v17;
  void *v18;
  void *v20;
  id obj;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  char *const *v32;
  int v33;
  _BYTE v34[128];

  v33 = a1;
  v32 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100011550;
  v27[3] = &unk_100024EA8;
  v27[4] = &v28;
  sub_10000A7D8(&v33, &v32, "w", (const option *)&off_1000255A8, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "br_allEligibleAppleAccounts"));
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        v7 = objc_msgSend(v5, "isDataSeparatedAccount");
        v8 = objc_msgSend(v5, "isDataSeparatedAccount");
        v9 = "primary";
        if (v7)
          v9 = "enterprise-";
        v10 = &stru_100026330;
        if (v8)
          v10 = v6;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%@"), v9, v10));
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username")));
        v13 = (const char *)objc_msgSend(v12, "UTF8String");
        v14 = objc_msgSend(v5, "br_isEnabledForCloudDocs");
        v15 = objc_retainAutorelease(v11);
        v16 = (const char *)objc_msgSend(v15, "UTF8String");
        v17 = "no";
        if (v14)
          v17 = "yes";
        printf("account:%s logged-in:%s account-directory:%s\n", v13, v17, v16);

        if (*((_BYTE *)v29 + 24) && objc_msgSend(v5, "br_isEnabledForCloudDocs"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[BRAccountDescriptor accountDescriptorForAccountID:](BRAccountDescriptor, "accountDescriptorForAccountID:", v6));
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10001156C;
          v22[3] = &unk_100025470;
          v22[4] = v5;
          BRPerformWithAccountDescriptor(v18, v22);

        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v2);
  }

  _Block_object_dispose(&v28, 8);
  return 0;
}

void sub_10000F31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F35C()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v0 = objc_alloc_init((Class)NSOperationQueue);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BRAccountDescriptor allLoggedInAccountDescriptors](BRAccountDescriptor, "allLoggedInAccountDescriptors"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v5);
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_100011670;
        v8[3] = &unk_100024AB0;
        v8[4] = v6;
        v9 = v0;
        BRPerformWithAccountDescriptor(v6, v8);

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  objc_msgSend(v0, "waitUntilAllOperationsAreFinished");

  return 0;
}

uint64_t sub_10000F4CC(unsigned int a1, char *const *a2)
{
  uint64_t v2;
  uint64_t v3;
  const char **v4;
  void *v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  const char *v12;
  const char *v13;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  const char **v28;
  unsigned int v29[3];

  v29[0] = a1;
  v28 = (const char **)a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000117B4;
  v23[3] = &unk_100024EA8;
  v23[4] = &v24;
  sub_10000A7D8((int *)v29, (char *const **)&v28, "t", (const option *)&off_100025610, v23);
  v2 = v29[0];
  if (!v29[0])
    sub_10000A7C4();
  if (!geteuid())
    errx(1, "Can't evict a document while running as root");
  if ((int)v2 >= 1)
  {
    v3 = 0;
    v4 = v28;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4[v3], 0, 0));
      v6 = dispatch_semaphore_create(0);
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = sub_10000D464;
      v21 = sub_10000D474;
      v22 = 0;
      v7 = v25[3];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000117D0;
      v14[3] = &unk_100025588;
      v16 = &v17;
      v8 = v6;
      v15 = v8;
      BREvictItemAtURLWithOptions(v5, v7, v14);
      dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
      v9 = (void *)v18[5];
      if (v9)
      {
        v12 = *v4;
        v13 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"))), "UTF8String");
        errx(1, "Unable to evict item at path '%s': %s", v12, v13);
      }
      if (v25[3] == 4)
        v10 = "thumbnail";
      else
        v10 = "content";
      printf("evicted %s of '%s'\n", v10, v4[v3]);

      _Block_object_dispose(&v17, 8);
      ++v3;
    }
    while (v2 != v3);
  }
  _Block_object_dispose(&v24, 8);
  return 0;
}

void sub_10000F724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F758(unsigned int a1, char *const *a2)
{
  uint64_t v2;
  char *const *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSObject *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  void *v15;
  const char *v17;
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD block[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  char *const *v42;
  unsigned int v43;
  _BYTE v44[128];

  v43 = a1;
  v41 = 0;
  v42 = a2;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001181C;
  v33[3] = &unk_100025560;
  v33[4] = &v38;
  v33[5] = &v34;
  sub_10000A7D8((int *)&v43, &v42, "tb", (const option *)&off_100025650, v33);
  v2 = v43;
  if ((int)v43 <= 0)
    sub_10000A7C4();
  if (!geteuid())
    errx(1, "Can't download documents while running as root");
  v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v2);
  v3 = v42;
  do
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", *v3, 0, 0));
    objc_msgSend(v18, "addObject:", v4);

    ++v3;
    --v2;
  }
  while (v2);
  if (*((_BYTE *)v35 + 24))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = v18;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v10 = dispatch_group_create();
          global_queue = dispatch_get_global_queue(0, 0);
          v12 = objc_claimAutoreleasedReturnValue(global_queue);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100011854;
          block[3] = &unk_100025470;
          block[4] = v9;
          dispatch_group_async(v10, v12, block);

          dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
      }
      while (v6);
    }
  }
  else
  {
    v13 = dispatch_semaphore_create(0);
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = sub_10000D464;
    v26 = sub_10000D474;
    v27 = 0;
    v14 = v39[3];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000118F0;
    v19[3] = &unk_100025588;
    v21 = &v22;
    v5 = v13;
    v20 = v5;
    BRStartDownloadForItemsWithOptions(v18, v14, v19);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    v15 = (void *)v23[5];
    if (v15)
    {
      v17 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"))), "UTF8String");
      errx(1, "Unable to start downloads: %s", v17);
    }

    _Block_object_dispose(&v22, 8);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  return 0;
}

void sub_10000FAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FB18(unsigned int a1, char *const *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  objc_class *v9;
  objc_property_t *v10;
  unint64_t i;
  id v12;
  void *v13;
  __CFString *v14;
  const char *v15;
  __CFString *v16;
  const char *v17;
  id v18;
  uint64_t v19;
  void *j;
  id v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  void *v29;
  void *v30;
  const char **v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *m;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  char *const *v49;
  NSObject *v50;
  uint64_t v51;
  char *v52;
  void *v53;
  id obj;
  uint64_t v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  unsigned int outCount;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  NSObject *v78;
  uint64_t *v79;
  _QWORD v80[6];
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  char v84;
  _QWORD v85[3];
  char v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  NSMutableArray *v92;
  char *const *v93;
  unsigned int v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];

  v94 = a1;
  v93 = a2;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = sub_10000D464;
  v91 = sub_10000D474;
  v92 = objc_opt_new(NSMutableArray);
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  v86 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10001193C;
  v80[3] = &unk_100025560;
  v80[4] = v85;
  v80[5] = &v81;
  sub_10000A7D8((int *)&v94, &v93, "ao", (const option *)&off_1000256F0, v80);
  if ((int)v94 <= 0)
    sub_10000A7C4();
  v51 = v94;
  v49 = v93;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString br_pathWithFileSystemRepresentation:](NSString, "br_pathWithFileSystemRepresentation:", *v93));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));

  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100011968;
  v77[3] = &unk_100025738;
  v79 = &v87;
  v3 = dispatch_semaphore_create(0);
  v78 = v3;
  +[NSFileVersion getNonlocalVersionsOfItemAtURL:completionHandler:](NSFileVersion, "getNonlocalVersionsOfItemAtURL:completionHandler:", v53, v77);
  v50 = v3;
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v82 + 24))
  {
    puts("[");
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = (id)v88[5];
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
    if (v5)
    {
      v6 = 1;
      v55 = *(_QWORD *)v74;
      v52 = "\n]";
      do
      {
        v7 = 0;
        v56 = v5;
        do
        {
          if (*(_QWORD *)v74 != v55)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v7);
          outCount = 0;
          if ((v6 & 1) == 0)
            puts(",");
          v9 = (objc_class *)objc_opt_class(v8, v4);
          v10 = class_copyPropertyList(v9, &outCount);
          puts("\t{");
          if (outCount)
          {
            for (i = 0; i < outCount; ++i)
            {
              v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", property_getName(v10[i]));
              if ((objc_msgSend(v12, "isEqualToString:", CFSTR("persistentIdentifier")) & 1) == 0)
              {
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", v12));
                v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v13));

                if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("(null)")))
                {

                  v14 = &stru_100026330;
                }
                v15 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
                v16 = objc_retainAutorelease(v14);
                printf("\t\t\"%s\": \"%s\"", v15, (const char *)-[__CFString UTF8String](v16, "UTF8String"));
                if (i == outCount - 1)
                  v17 = "";
                else
                  v17 = ",";
                puts(v17);

              }
            }
          }
          printf("\t}");
          v6 = 0;
          v7 = (char *)v7 + 1;
        }
        while (v7 != v56);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
        v6 = 0;
      }
      while (v5);
      goto LABEL_34;
    }
    v22 = "\n]";
LABEL_33:
    v52 = (char *)v22;
    goto LABEL_34;
  }
  puts("versions: {");
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = (id)v88[5];
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v97, 16);
  if (!v18)
  {
    v22 = "}";
    goto LABEL_33;
  }
  v19 = *(_QWORD *)v69;
  v52 = "}";
  do
  {
    for (j = 0; j != v18; j = (char *)j + 1)
    {
      if (*(_QWORD *)v69 != v19)
        objc_enumerationMutation(obj);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1)
                                                                                            + 8 * (_QWORD)j), "description")));
      printf("    %s\n", (const char *)objc_msgSend(v21, "UTF8String"));

    }
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v97, 16);
  }
  while (v18);
LABEL_34:

  puts(v52);
  v23 = objc_alloc_init((Class)NSMutableDictionary);
  v24 = objc_alloc_init((Class)NSMutableSet);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v25 = (id)v88[5];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v96, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(_QWORD *)v65 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "etag"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v30);

      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v96, 16);
    }
    while (v26);
  }

  if ((int)v51 >= 2)
  {
    v31 = (const char **)(v49 + 1);
    v32 = v51 - 1;
    while (1)
    {
      v33 = *v31;
      if (!strcmp(*v31, "ALL"))
        break;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v33));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v34));

      if (v35)
        objc_msgSend(v24, "addObject:", v35);

      ++v31;
      if (!--v32)
        goto LABEL_49;
    }
    v36 = objc_alloc((Class)NSMutableSet);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allValues"));
    v38 = objc_msgSend(v36, "initWithArray:", v37);

    v24 = v38;
  }
LABEL_49:
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v57 = v24;
  v39 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v60, v95, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v61;
    while (2)
    {
      for (m = 0; m != v39; m = (char *)m + 1)
      {
        if (*(_QWORD *)v61 != v40)
          objc_enumerationMutation(v57);
        v42 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)m);
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "description")));
        printf("downloading version %s...\n", (const char *)objc_msgSend(v43, "UTF8String"));

        v44 = objc_alloc_init((Class)NSFileCoordinator);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URL"));
        v59 = 0;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_1000119D8;
        v58[3] = &unk_100025760;
        v58[4] = v42;
        objc_msgSend(v44, "coordinateReadingItemAtURL:options:error:byAccessor:", v45, 1, &v59, v58);
        v46 = v59;

        if (v46)
        {
          v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "description")));
          printf("  ERROR: %s\n", (const char *)objc_msgSend(v47, "UTF8String"));

          goto LABEL_59;
        }

      }
      v39 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v60, v95, 16);
      if (v39)
        continue;
      break;
    }
  }
LABEL_59:

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(v85, 8);
  _Block_object_dispose(&v87, 8);

  return 0;
}

void sub_10001036C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010404(int a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;

  optreset = 1;
  optind = 1;
  if (a1 != 2)
    sub_10000A7C4();
  v2 = a2 + 8;
  v3 = sub_10000A6F0(*(const char **)(a2 + 8), (const char **)&off_100025780);
  return ((uint64_t (*)(uint64_t, uint64_t))(&off_100025780)[2 * v3 + 1])(1, v2);
}

void sub_10001046C(_QWORD *a1, int a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  switch(a2)
  {
    case 'd':
      if (a3)
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString br_pathWithFileSystemRepresentation:](NSString, "br_pathWithFileSystemRepresentation:", a3));
      else
        v5 = 0;
      v7 = v5;
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v5);
      if (a3)

      return;
    case 'e':
      v6 = a1[8];
      goto LABEL_12;
    case 'f':
      v6 = a1[9];
      goto LABEL_12;
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
      return;
    case 'i':
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      return;
    case 'o':
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
      return;
    default:
      if (a2 == 117)
      {
        v6 = a1[7];
      }
      else
      {
        if (a2 != 118)
          return;
        v6 = a1[10];
      }
LABEL_12:
      *(_BYTE *)(*(_QWORD *)(v6 + 8) + 24) = 1;
      return;
  }
}

id sub_100010560(const char *a1, char *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  char v7;
  FILE *v9;
  id v10;
  int v11;

  if (a1)
  {
    v4 = open(a1, 1541, 420);
    if ((v4 & 0x80000000) != 0)
      err(1, "Unable to open file %s", a1);
    v5 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v4, 1);
  }
  else
  {
    if (isatty(1))
    {
      v9 = tmpfile();
      v10 = objc_alloc((Class)NSFileHandle);
      v11 = fileno(v9);
      v7 = 1;
      v6 = objc_msgSend(v10, "initWithFileDescriptor:closeOnDealloc:", dup(v11), 1);
      fclose(v9);
      if (!a2)
        return v6;
      goto LABEL_5;
    }
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"));
  }
  v6 = v5;
  v7 = 0;
  if (a2)
LABEL_5:
    *a2 = v7;
  return v6;
}

id sub_100010658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2, a3);
}

id sub_100010668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2, a3);
}

Class sub_100010678()
{
  Class Class;

  if (!qword_10002A938)
  {
    qword_10002A938 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudDocsDaemon.framework/CloudDocsDaemon", 2);
    if (!qword_10002A938)
      sub_1000171C4();
  }
  Class = objc_getClass("BRCAccountSession");
  qword_10002A930 = (uint64_t)Class;
  if (!Class)
    sub_10001726C();
  off_10002A8D8[0] = (uint64_t (*)())sub_1000106E4;
  return Class;
}

id sub_1000106E4()
{
  return (id)qword_10002A930;
}

Class sub_1000106F0()
{
  Class Class;

  if (!qword_10002A948)
  {
    qword_10002A948 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/iCloudDriveCore.framework/iCloudDriveCore", 2);
    if (!qword_10002A948)
      sub_100017294();
  }
  Class = objc_getClass("BRCAccountSessionFPFS");
  qword_10002A940 = (uint64_t)Class;
  if (!Class)
    sub_10001733C();
  off_10002A8E0 = (uint64_t (*)())sub_10001075C;
  return Class;
}

id sub_10001075C()
{
  return (id)qword_10002A940;
}

uint64_t sub_100010768(uint64_t result, int a2, uint64_t a3)
{
  if (a2 == 111)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

id sub_100010780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2, a3);
}

uint64_t sub_100010790()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  geteuid();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[BRAccountDescriptor allLoggedInAccountDescriptors](BRAccountDescriptor, "allLoggedInAccountDescriptors"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v9;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v9 != v3)
          objc_enumerationMutation(v0);
        v5 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v4);
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_100011108;
        v7[3] = &unk_100025470;
        v7[4] = v5;
        BRPerformWithAccountDescriptor(v5, v7);
        v4 = (char *)v4 + 1;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v2);
  }

  return 0;
}

uint64_t sub_1000108CC(int a1, char *const *a2)
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  char *const *v23;
  int v24;

  v24 = a1;
  v23 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10000D464;
  v21 = sub_10000D474;
  v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001140C;
  v16[3] = &unk_100024EA8;
  v16[4] = &v17;
  sub_10000A7D8(&v24, &v23, "o:", (const option *)&off_100025490, v16);
  if (v24 <= 0)
    errx(1, "need to specify a container ID\n");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v23)));
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  v4 = (const char *)objc_msgSend(objc_retainAutorelease((id)v18[5]), "UTF8String");
  v5 = "";
  if (v4)
    v5 = v4;
  printf("creating %s %s\n", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection"));
  v7 = objc_msgSend(v6, "newSyncProxy");

  v8 = v18[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011454;
  v14[3] = &unk_1000254D8;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v9, "createContainerWithID:ownerName:reply:", v2, v8, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "result"));

  if (!v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
    printf("  error: %s\n", (const char *)objc_msgSend(v13, "UTF8String"));

    err(1, "can't create container");
  }

  _Block_object_dispose(&v17, 8);
  return 0;
}

void sub_100010AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010B08(int a1, char *const *a2)
{
  id v2;
  const char *v3;
  const char *v4;
  const char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v13;
  const char *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  char *const *v26;
  int v27;

  v27 = a1;
  v26 = a2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100011468;
  v17[3] = &unk_100025560;
  v17[4] = &v22;
  v17[5] = &v18;
  sub_10000A7D8(&v27, &v26, "cs", (const option *)&off_1000254F8, v17);
  if (*((_BYTE *)v19 + 24))
    *((_BYTE *)v23 + 24) = 1;
  if (v27 <= 0)
    errx(1, "need to specify a container ID\n");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v26)));
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  v4 = "YES";
  if (*((_BYTE *)v23 + 24))
    v5 = "YES";
  else
    v5 = "NO";
  if (!*((_BYTE *)v19 + 24))
    v4 = "NO";
  printf("deleting container %s on client:%s and on server:%s\n", v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection"));
  v7 = objc_msgSend(v6, "newSyncProxy");

  v8 = *((unsigned __int8 *)v23 + 24);
  v9 = *((unsigned __int8 *)v19 + 24);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011494;
  v15[3] = &unk_1000254D8;
  v10 = v7;
  v16 = v10;
  objc_msgSend(v10, "deleteAllContentsOfContainerID:onClient:onServer:wait:reply:", v2, v8, v9, 1, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "result"));
  LOBYTE(v9) = objc_msgSend(v11, "BOOLValue");

  if ((v9 & 1) == 0)
  {
    v13 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error")), "description");
    v14 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v13)), "UTF8String");
    errx(1, "deletion failed with %s\n", v14);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return 0;
}

void sub_100010D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010D7C()
{
  ContainerObserver *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v0 = objc_alloc_init(ContainerObserver);
  v1 = objc_alloc_init((Class)BRContainersMonitor);
  v2 = objc_msgSend(objc_alloc((Class)BRCTermDumper), "initWithFd:forceColor:", 1, 0);
  -[ContainerObserver setDumper:](v0, "setDumper:", v2);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BRContainer allContainers](BRContainer, "allContainers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v5 = (void *)BRSubSystemContainerIDPrefix;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "identifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v9));
        objc_msgSend(v1, "addObserver:forContainerID:", v0, v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", BRUbiquitousContainerMetadataContainerID));
  objc_msgSend(v1, "addObserver:forContainerID:", v0, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", BRUbiquitousSharedContainerID));
  objc_msgSend(v1, "addObserver:forContainerID:", v0, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v13, "run");

  return 0;
}

uint64_t sub_100010F90(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  const char *v5;
  const char *v6;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  optreset = 1;
  optind = 1;
  if ((int)a1 <= 1)
    sub_100017364(a1);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10000D464;
  v14 = sub_10000D474;
  v15 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a2 + 8)));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011504;
  v7[3] = &unk_100025588;
  v9 = &v10;
  v3 = dispatch_semaphore_create(0);
  v8 = v3;
  BRRegisterInitialSyncHandlerForContainer(v2, v7);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (v11[5])
  {
    v5 = (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    v6 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v11[5], "description"))), "UTF8String");
    errx(1, "waiting for initial faults live failed for %s: %s\n", v5, v6);
  }

  _Block_object_dispose(&v10, 8);
  return 0;
}

void sub_1000110EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011108(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  const char *v7;
  unsigned int v8;
  const char *v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  void *v22;
  id obj;
  uint64_t v24;
  id v25;
  const char *v26;
  const char *v27;
  const char *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "organizationName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (managed by: %@)"), v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BRContainer allContainers](BRContainer, "allContainers"));
  v5 = objc_msgSend(v4, "count");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountIdentifier")));
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  v8 = objc_msgSend(*(id *)(a1 + 32), "isDataSeparated");
  v9 = "";
  if (v8)
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  v22 = v3;
  printf("\n\nlisting %ld containers for account %s%s:\n", v5, v7, v9);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier")));
        v28 = (const char *)objc_msgSend(v30, "UTF8String");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedName")));
        v27 = (const char *)objc_msgSend(v29, "UTF8String");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "documentsURL"));
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path")));
        v26 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
        if (objc_msgSend(v11, "isDocumentScopePublic"))
          v14 = "Public";
        else
          v14 = "Private";
        if (objc_msgSend(v11, "isInInitialState"))
          v15 = " inInitialState";
        else
          v15 = "";
        if (objc_msgSend(v11, "isCloudSyncTCCDisabled"))
          v16 = " isCloudSyncTCCDisabled";
        else
          v16 = "";
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifiers"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allObjects"));
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "))));
        v20 = (const char *)objc_msgSend(v19, "UTF8String");
        if (v20)
          v21 = v20;
        else
          v21 = "";
        printf("  id:%s localizedName:'%s' documents:'%s' [%s:%s%s] clients: %s\n", v28, v27, v26, v14, v15, v16, v21);

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v25);
  }

}

void sub_10001140C(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2 == 111)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

id sub_100011454(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2 == 0, a2);
}

uint64_t sub_100011468(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2 == 115)
  {
    v2 = *(_QWORD *)(result + 40);
  }
  else
  {
    if (a2 != 99)
      return result;
    v2 = *(_QWORD *)(result + 32);
  }
  *(_BYTE *)(*(_QWORD *)(v2 + 8) + 24) = 1;
  return result;
}

void sub_100011494(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2 == 0;
  v4 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  objc_msgSend(v2, "setObjResult:error:", v5, v4);

}

void sub_100011504(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_100011550(uint64_t result, int a2)
{
  if (a2 == 119)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_10001156C(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[5];

  v2 = sub_10000A984();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000115DC;
  v4[3] = &unk_1000254D8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "waitForAccountToLoadWithReply:", v4);

}

void sub_1000115DC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  const char *v4;
  void *v5;
  id v6;
  id v7;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "username")));
    v4 = (const char *)objc_msgSend(v7, "UTF8String");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

    v6 = objc_retainAutorelease(v5);
    printf("error loading logged-in account:%s error:%s\n", v4, (const char *)objc_msgSend(v6, "UTF8String"));

  }
}

void sub_100011670(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  v2 = objc_alloc_init((Class)BRFetchQuotaOperation);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000116F0;
  v3[3] = &unk_1000255F0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "setFetchQuotaCompletionBlock:", v3);
  objc_msgSend(*(id *)(a1 + 40), "addOperation:", v2);

}

void sub_1000116F0(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  id v6;
  id v7;
  unsigned int v8;
  const char *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isDataSeparated"))
      v5 = "enterprise";
    else
      v5 = "personal";
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description")));
    printf("failed fetching %s quota - %s\n", v5, (const char *)objc_msgSend(v6, "UTF8String"));

  }
  else
  {
    v7 = objc_msgSend(a2, "unsignedLongLongValue");
    v8 = objc_msgSend(*(id *)(a1 + 32), "isDataSeparated");
    v9 = "personal";
    if (v8)
      v9 = "enterprise";
    printf("%llu bytes of quota remaining in %s account\n", v7, v9);
  }

}

uint64_t sub_1000117B4(uint64_t result, int a2)
{
  if (a2 == 116)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 4;
  return result;
}

void sub_1000117D0(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_10001181C(uint64_t result, int a2)
{
  if (a2 == 98)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  else if (a2 == 116)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 2;
  }
  return result;
}

void sub_100011854(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_alloc_init((Class)NSFileCoordinator);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "coordinateReadingItemAtURL:options:error:byAccessor:", v3, 131073, &v4, &stru_1000256D0);

}

void sub_1000118AC(id a1, NSURL *a2)
{
  id v2;

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSURL path](a2, "path")));
  printf("download complete at \"%s\"\n", (const char *)objc_msgSend(v2, "UTF8String"));

}

void sub_1000118F0(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_10001193C(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2 == 111)
  {
    v2 = *(_QWORD *)(result + 40);
  }
  else
  {
    if (a2 != 97)
      return result;
    v2 = *(_QWORD *)(result + 32);
  }
  *(_BYTE *)(*(_QWORD *)(v2 + 8) + 24) = 1;
  return result;
}

void sub_100011968(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v6)
    sub_100017378(v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t sub_1000119D8(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  unsigned int st_mode;
  off_t st_size;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  stat v37;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "path")));
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");

  printf("  acquired coordinated read at '%s'\n", v4);
  memset(&v37, 0, sizeof(v37));
  if (lstat(v4, &v37) < 0)
  {
    v28 = *__error();
    return printf("  ERROR: can't lstat path '%s' %{errno}d\n", v4, v28);
  }
  else
  {
    st_mode = v37.st_mode;
    if ((v37.st_mode & 0xF000) == 0x8000
      || (st_size = v37.st_size, v7 = objc_msgSend(*(id *)(a1 + 32), "size"), st_mode = v37.st_mode, (id)st_size == v7))
    {
      v8 = aPcDBLSW[(unint64_t)st_mode >> 12];
      v9 = 120;
      if ((st_mode & 1) != 0)
        v10 = 120;
      else
        v10 = 45;
      v35 = v10;
      v11 = 119;
      if ((st_mode & 2) != 0)
        v12 = 119;
      else
        v12 = 45;
      if ((st_mode & 4) != 0)
        v13 = 114;
      else
        v13 = 45;
      v31 = v13;
      v33 = v12;
      if ((st_mode & 8) != 0)
        v14 = 120;
      else
        v14 = 45;
      if ((st_mode & 0x10) != 0)
        v15 = 119;
      else
        v15 = 45;
      v29 = v14;
      if ((st_mode & 0x20) != 0)
        v16 = 114;
      else
        v16 = 45;
      if ((st_mode & 0x40) == 0)
        v9 = 45;
      if ((st_mode & 0x80) == 0)
        v11 = 45;
      if ((st_mode & 0x100) != 0)
        v17 = 114;
      else
        v17 = 45;
      return printf("  version is on disk at '%s': deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x\n", v4, v37.st_dev, v37.st_ino, v8, v17, v11, v9, v16, v15, v29, v31, v33, v35);
    }
    else
    {
      v19 = 120;
      if ((v37.st_mode & 1) != 0)
        v20 = 120;
      else
        v20 = 45;
      v36 = v20;
      v21 = 119;
      if ((v37.st_mode & 2) != 0)
        v22 = 119;
      else
        v22 = 45;
      if ((v37.st_mode & 4) != 0)
        v23 = 114;
      else
        v23 = 45;
      v32 = v23;
      v34 = v22;
      if ((v37.st_mode & 8) != 0)
        v24 = 120;
      else
        v24 = 45;
      if ((v37.st_mode & 0x10) != 0)
        v25 = 119;
      else
        v25 = 45;
      v30 = v24;
      if ((v37.st_mode & 0x20) != 0)
        v26 = 114;
      else
        v26 = 45;
      if ((v37.st_mode & 0x40) == 0)
        v19 = 45;
      if ((v37.st_mode & 0x80) == 0)
        v21 = 45;
      if ((v37.st_mode & 0x100) != 0)
        v27 = 114;
      else
        v27 = 45;
      return printf("  ERROR: wrong size at '%s' deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x\n", v4, v37.st_dev, v37.st_ino, aPcDBLSW[(unint64_t)v37.st_mode >> 12], v27, v21, v19, v26, v25, v30, v32, v34, v36);
    }
  }
}

uint64_t sub_100011C28()
{
  sub_100011D0C(1);
  puts("Spotlight indexing has been enabled");
  return 0;
}

uint64_t sub_100011C50()
{
  id v0;
  id v1;
  void *v2;
  unsigned int v3;
  _QWORD v5[4];
  id v6;

  sub_100011D0C(0);
  v0 = sub_10000A984();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011EE8;
  v5[3] = &unk_1000254D8;
  v1 = (id)objc_claimAutoreleasedReturnValue(v0);
  v6 = v1;
  objc_msgSend(v1, "dropSpotlightIndexWithReply:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "result"));
  v3 = objc_msgSend(v2, "BOOLValue");

  if (!v3)
    sub_1000173A4(v1);
  puts("Dropped Spotlight index successfully");

  return 0;
}

void sub_100011D0C(int a1)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/bin/launchctl start com.apple.bird")));
  v20[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/usr/bin/pkill -STOP bird")));
  v20[1] = v3;
  v4 = "no";
  if (a1)
    v4 = "yes";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/usr/bin/defaults write com.apple.bird spotlight-indexer.enabled -BOOL %s"), v4));
  v20[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/usr/bin/pkill -KILL bird")));
  v20[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i));
        puts((const char *)objc_msgSend(v13, "UTF8String"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[BRTask taskWithCommandWithArguments:](BRTask, "taskWithCommandWithArguments:", v13));
        objc_msgSend(v14, "exec");

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

id sub_100011EE8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBoolResult:error:", a2 == 0, a2);
}

void sub_100011EFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x16u);
}

void sub_100011F10(uint64_t a1, const char *a2)
{
  errx(69, a2);
}

BOOL sub_100011F18(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT);
}

void sub_100012120(uint64_t a1)
{
  uint64_t v2;
  NSString *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isDataSeparated"))
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 112) = 1;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 109)
    && (objc_msgSend(*(id *)(a1 + 32), "isDataSeparated") & 1) == 0)
  {
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("HOME")));
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 109))
    {
      v7 = (id)v2;
      v3 = NSHomeDirectoryForUser(CFSTR("mobile"));
      v4 = objc_claimAutoreleasedReturnValue(v3);

      v2 = v4;
    }
  }
  else
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSString br_currentHomeDir](NSString, "br_currentHomeDir"));
  }
  v8 = (id)v2;
  if (v2)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountIdentifier"));
    objc_msgSend(v5, "setObject:forKey:", v8, v6);
  }
  else
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountIdentifier")));
    printf("couldn't get home path for account %s\n", (const char *)objc_msgSend(v6, "UTF8String"));
  }

}

void sub_1000136FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013720(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100013730(uint64_t a1)
{

}

void sub_100013738(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  uint64_t v6;
  void *v7;

  type = xpc_get_type(object);
  if (object == &_xpc_error_connection_interrupted && type == (xpc_type_t)&_xpc_type_error)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void sub_100013F30(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  FILE *v8;
  id v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("filecoordination_dump.txt")));
  v10 = 0;
  objc_msgSend(v4, "writeToFile:atomically:encoding:error:", v5, 1, 4, &v10);

  v6 = v10;
  v7 = v6;
  if (v6)
  {
    v8 = __stderrp;
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
    fprintf(v8, "failed to write file coordination dump - %s", (const char *)objc_msgSend(v9, "UTF8String"));

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t sub_100016738(uint64_t a1)
{
  return fclose(*(FILE **)(a1 + 32));
}

uint64_t sub_100016740(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  FILE *v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2));
  v4 = *(void **)(a1 + 40);
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v15));
  v6 = v15;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    v9 = __stderrp;
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
    fprintf(v9, "can't retrieve attributes of item at \"%s\": %s\n", v10, (const char *)objc_msgSend(v11, "UTF8String"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileType"));
  v13 = objc_msgSend(v12, "isEqualToString:", NSFileTypeSymbolicLink) ^ 1;

  return v13;
}

uint64_t sub_100016CAC()
{
  puts("diagnose [options] [--doc|-d <document-path>] [<diagnosis-output-path>]");
  puts("    diagnose and collect logs\n");
  puts("    -M,--collect-mobile-documents[=<container>]  (default: all containers)");
  puts("    -s,--sysdiagnose     Do not collect what's already part of sysdiagnose");
  puts("    -t,--uitest          Collect logs for UI tests");
  puts("    -n,--name=<name>     Change the device name");
  puts("    -f,--full            Do a full diagnose, including server checks");
  puts("    -d,--doc=<document-path>");
  puts("                         Collect additional information about the document at that path.");
  puts("                         Helps when investigating an issue impacting a specific document.");
  puts("    [<diagnosis-output-path>]");
  puts("                         Specifies the output path of the diagnosis; -n becomes useless.");
  return putchar(10);
}

uint64_t sub_100016D50(int a1, char *const *a2)
{
  BRCTLDiagnoseCommand *v4;
  NSString *diagnoseArgs;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  BRCTLDiagnoseCommand *v12;
  NSString *v13;
  _BOOL4 skipLogArchive;
  uid_t v15;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];
  BRCTLDiagnoseCommand *v21;
  char *const *v22;
  int v23;

  v23 = a1;
  v22 = a2;
  v4 = objc_alloc_init(BRCTLDiagnoseCommand);
  diagnoseArgs = v4->diagnoseArgs;
  v4->diagnoseArgs = (NSString *)&stru_100026330;

  if (a1 >= 2)
  {
    v6 = (uint64_t *)(a2 + 1);
    v7 = a1 - 1;
    do
    {
      v8 = *v6++;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %s"), v8));
      v10 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v4->diagnoseArgs, "stringByAppendingString:", v9));
      v11 = v4->diagnoseArgs;
      v4->diagnoseArgs = (NSString *)v10;

      --v7;
    }
    while (v7);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100016F28;
  v20[3] = &unk_100024DC8;
  v12 = v4;
  v21 = v12;
  sub_10000A7D8(&v23, &v22, "M:sfn:d:rletc", (const option *)&off_100025870, v20);
  -[BRCTLDiagnoseCommand prepareDiagnose](v12, "prepareDiagnose");
  if (v12->continueExecution)
  {
    v12->skipLogArchive = 1;
    v13 = v4->diagnoseArgs;
    v4->diagnoseArgs = 0;

  }
  skipLogArchive = v12->skipLogArchive;
  v15 = getuid();
  if (skipLogArchive || v15 == 0)
  {
    if (v23 >= 2)
      sub_10000A7C4();
    if (v23 == 1)
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v22));
    else
      v17 = 0;
    -[BRCTLDiagnoseCommand diagnoseWithPath:](v12, "diagnoseWithPath:", v17);

    v18 = 0;
  }
  else
  {
    printf("brctl diagnose must run as root to %s\n", "collect a log archive");
    v18 = 1;
  }

  return v18;
}

id sub_100016F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseOption:arg:", a2, a3);
}

Class sub_100016F38()
{
  Class Class;

  if (!qword_10002A958)
  {
    qword_10002A958 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
    if (!qword_10002A958)
      sub_1000174A0();
  }
  Class = objc_getClass("PKDiagnostics");
  qword_10002A950 = (uint64_t)Class;
  if (!Class)
    sub_100017560();
  off_10002A8F0 = (uint64_t (*)())sub_100016FA4;
  return Class;
}

id sub_100016FA4()
{
  return (id)qword_10002A950;
}

void sub_100016FB0()
{
  __assert_rtn("-[Section dumpPrefixWithKind:depth:to:]", "cmd-log.m", 168, "0");
}

void sub_100016FD8()
{
  __assert_rtn("-[BRCTLLogCommand getDepth:current:previous:forThread:]", "cmd-log.m", 631, "*current != [NSNull null]");
}

void sub_100017000()
{
  __assert_rtn("-[BRCTLLogCommand getDepth:current:previous:forThread:]", "cmd-log.m", 632, "*previous != [NSNull null]");
}

void sub_100017028(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] _checkIfQueryShouldStop%@", (uint8_t *)&v2, 0xCu);
}

void sub_10001709C(uint64_t a1)
{
  sub_10000A624(a1, "can't observe more than once path");
}

void sub_1000170B0(uint64_t a1)
{
  sub_10000A624(a1, "not in a synced location");
}

void sub_1000170C4(uint64_t a1)
{
  sub_10000A624(a1, "no containers");
}

void sub_1000170D8(uint64_t a1)
{
  sub_10000A624(a1, "can't find container root");
}

void sub_1000170EC(uint64_t a1)
{
  sub_100011F10(a1, "Unable to connect to bird");
}

void sub_100017100(uint64_t a1)
{
  sub_10000A624(a1, "Can't create the fpfs sync proxy when fpfs isn't enabled");
}

void sub_100017114(uint64_t a1)
{
  sub_10000A624(a1, "Can't create the legacy sync proxy when fpfs is enabled");
}

void sub_100017128(void *a1, void *a2)
{
  id v3;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v3 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description"))), "UTF8String");
  sub_10000A624((uint64_t)v3, "%s; error: %s");
}

void sub_10001716C(void *a1)
{
  id v1;

  v1 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"))), "UTF8String");
  sub_10000A624((uint64_t)v1, "JSON Serialization failed: %s");
}

void sub_100017198()
{
  errx(64, "The device has never been unlocked since boot, brctl won't work properly");
}

void sub_1000171B0(uint64_t a1)
{
  sub_10000A624(a1, "Trying to invoke brctl from a sandboxed process");
}

void sub_1000171C4()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = brc_bread_crumbs("CloudDocsDaemonLibrary", 116);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (sub_100011F18(v4))
  {
    dlerror();
    sub_100011EFC((void *)&_mh_execute_header, v5, v6, "[WARNING] Can't open CloudDocsDaemon : %s%@", v7, v8, v9, v10, 2u);
  }

  __assert_rtn("CloudDocsDaemonLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/brctl/brctl.m", 116, "Can't open CloudDocsDaemon");
}

void sub_10001726C()
{
  __assert_rtn("initBRCAccountSession", "brctl.m", 117, "classBRCAccountSession");
}

void sub_100017294()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = brc_bread_crumbs("iCloudDriveCoreLibrary", 106);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (sub_100011F18(v4))
  {
    dlerror();
    sub_100011EFC((void *)&_mh_execute_header, v5, v6, "[WARNING] Can't open iCloudDriveCore : %s%@", v7, v8, v9, v10, 2u);
  }

  __assert_rtn("iCloudDriveCoreLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/brctl/brctl.m", 106, "Can't open iCloudDriveCore");
}

void sub_10001733C()
{
  __assert_rtn("initBRCAccountSessionFPFS", "brctl.m", 107, "classBRCAccountSessionFPFS");
}

void sub_100017364(uint64_t a1)
{
  sub_10000A624(a1, "need to specify a container ID\n");
}

void sub_100017378(void *a1)
{
  id v1;

  v1 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"))), "UTF8String");
  sub_10000A624((uint64_t)v1, "Unable to list versions: %s");
}

void sub_1000173A4(void *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error")), "description");
  v2 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1)), "UTF8String");
  sub_10000A624((uint64_t)v2, "Unable to drop Spotlight Index: %s");
}

void sub_1000173D8()
{
  __assert_rtn("-[BRCTLDiagnoseCommand _removeDirectoryIfNecessaryAtPath:]", "cmd-diagnose.m", 268, "path");
}

void sub_100017400(uint64_t a1)
{
  sub_10000A624(a1, "Target path is (null)");
}

void sub_100017414(uint64_t a1)
{
  sub_10000A624(a1, "Diagnose path is (null)");
}

void sub_100017428(void *a1)
{
  sub_10000A624((uint64_t)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), "error opening file: '%s' for writing");
}

void sub_10001744C(void *a1, void *a2)
{
  id v3;

  objc_msgSend(a1, "_printActionFailedWithError:", a2);
  v3 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"))), "UTF8String");
  sub_10000A624((uint64_t)v3, "Print action failed with error: %s");
}

void sub_10001748C(uint64_t a1)
{
  sub_10000A624(a1, "switch to the $SUDO_USER failed");
}

void sub_1000174A0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  char *v5;
  __int16 v6;
  void *v7;

  v0 = brc_bread_crumbs("PassKitCoreLibrary", 40);
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = dlerror();
    v6 = 2112;
    v7 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open PassKitCore : %s%@", (uint8_t *)&v4, 0x16u);
  }

  __assert_rtn("PassKitCoreLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/brctl/cmd-diagnose.m", 40, "Can't open PassKitCore");
}

void sub_100017560()
{
  __assert_rtn("initPKDiagnostics", "cmd-diagnose.m", 41, "classPKDiagnostics");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLForUbiquityContainerIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForUbiquityContainerIdentifier:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__addSubscriberForFileURL_withPublishingHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addSubscriberForFileURL:withPublishingHandler:");
}

id objc_msgSend__collectCrashesAndSpinsAtPath_processes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectCrashesAndSpinsAtPath:processes:");
}

id objc_msgSend__collectDefaultsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectDefaultsAtPath:");
}

id objc_msgSend__collectDefaultsAtPathForDomain_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectDefaultsAtPathForDomain:path:");
}

id objc_msgSend__collectFileCoordinationDumpAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectFileCoordinationDumpAtPath:");
}

id objc_msgSend__collectFilesAtPath_dstPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectFilesAtPath:dstPath:");
}

id objc_msgSend__collectFilesWithPredicate_srcPath_dstPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectFilesWithPredicate:srcPath:dstPath:");
}

id objc_msgSend__collectLogs_diagnosePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectLogs:diagnosePath:");
}

id objc_msgSend__collectMobileDocumentsAtPath_containerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_collectMobileDocumentsAtPath:containerID:");
}

id objc_msgSend__createSecureDiagnoseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createSecureDiagnoseDirectory");
}

id objc_msgSend__diagnoseParentPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_diagnoseParentPath");
}

id objc_msgSend__dumpLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dumpLevel:");
}

id objc_msgSend__dumpPrefix_depth_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dumpPrefix:depth:to:");
}

id objc_msgSend__execTask_withLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_execTask:withLabel:");
}

id objc_msgSend__generateDiagnoseDirectoryNameWithDeviceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateDiagnoseDirectoryNameWithDeviceName:");
}

id objc_msgSend__getDebugInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getDebugInfoWithCompletionHandler:");
}

id objc_msgSend__isNoSuchFileError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isNoSuchFileError:");
}

id objc_msgSend__listFoldersUnderPath_withOutPath_listAsPlainFile_label_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_listFoldersUnderPath:withOutPath:listAsPlainFile:label:");
}

id objc_msgSend__moveMobileLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveMobileLogs");
}

id objc_msgSend__moveSecuredDiagnoseDirToTargetPath_targetPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveSecuredDiagnoseDirToTargetPath:targetPath:");
}

id objc_msgSend__parseMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseMessage:");
}

id objc_msgSend__prepareTargetDiagnoseDirPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareTargetDiagnoseDirPath:");
}

id objc_msgSend__prettyDescriptionFromError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prettyDescriptionFromError:");
}

id objc_msgSend__printActionEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printActionEnd");
}

id objc_msgSend__printActionFailed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printActionFailed");
}

id objc_msgSend__printActionFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printActionFailedWithError:");
}

id objc_msgSend__printActionStartWithLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printActionStartWithLabel:");
}

id objc_msgSend__removeDirectoryIfNecessaryAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeDirectoryIfNecessaryAtPath:");
}

id objc_msgSend__removeSubscriber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeSubscriber:");
}

id objc_msgSend__setExternalDocumentsBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setExternalDocumentsBundleIdentifier:");
}

id objc_msgSend__tar_c_withContentsOfDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tar_c:withContentsOfDirectory:error:");
}

id objc_msgSend__truncateFileForiOSSysdiagnose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_truncateFileForiOSSysdiagnose:");
}

id objc_msgSend_accountDescriptorForAccountID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountDescriptorForAccountID:");
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountIdentifier");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_forContainerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forContainerID:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_allContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allContainers");
}

id objc_msgSend_allContainersByContainerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allContainersByContainerID");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allLoggedInAccountDescriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allLoggedInAccountDescriptors");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appSupportPathForPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appSupportPathForPersona:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
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

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_br_addPhysicalProperty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_addPhysicalProperty");
}

id objc_msgSend_br_allEligibleAppleAccounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_allEligibleAppleAccounts");
}

id objc_msgSend_br_currentHomeDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_currentHomeDir");
}

id objc_msgSend_br_errorFromErrno(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_errorFromErrno");
}

id objc_msgSend_br_errorWithPOSIXCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_errorWithPOSIXCode:");
}

id objc_msgSend_br_formattedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_formattedName");
}

id objc_msgSend_br_isAbsolutePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_isAbsolutePath");
}

id objc_msgSend_br_isEnabledForCloudDocs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_isEnabledForCloudDocs");
}

id objc_msgSend_br_isInSyncedLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_isInSyncedLocation");
}

id objc_msgSend_br_isOversize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_isOversize");
}

id objc_msgSend_br_pathRelativeToDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_pathRelativeToDirectory:");
}

id objc_msgSend_br_pathRelativeToPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_pathRelativeToPath:");
}

id objc_msgSend_br_pathWithFileSystemRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_pathWithFileSystemRepresentation:");
}

id objc_msgSend_br_realpath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_realpath");
}

id objc_msgSend_br_setupForMonitoringChildrenOfFolderAtURL_searchScopes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:");
}

id objc_msgSend_brctl_fileURLWithUserInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brctl_fileURLWithUserInput:");
}

id objc_msgSend_buildPredicateFromString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildPredicateFromString");
}

id objc_msgSend_buildPredicateString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildPredicateString:");
}

id objc_msgSend_bundleIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifiers");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "category");
}

id objc_msgSend_checkPromisedItemIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkPromisedItemIsReachableAndReturnError:");
}

id objc_msgSend_close_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close:");
}

id objc_msgSend_cloudDocsLogPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudDocsLogPath");
}

id objc_msgSend_cloudKitLogPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudKitLogPath");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeRealOptionsForFd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeRealOptionsForFd:");
}

id objc_msgSend_containersPathForPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containersPathForPersona:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinateReadingItemAtURL:options:error:byAccessor:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crashLogsPaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crashLogsPaths");
}

id objc_msgSend_createContainerWithID_ownerName_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createContainerWithID:ownerName:reply:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentVersionOfItemAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentVersionOfItemAtURL:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateComponentsFromUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateComponentsFromUTF8String:");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFormatter");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateFromUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromUTF8String:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConnection");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_deleteAllContentsOfContainerID_onClient_onServer_wait_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllContentsOfContainerID:onClient:onServer:wait:reply:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_diagnoseWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnoseWithPath:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUpdates");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_documentsURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentsURL");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_dropSpotlightIndexWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dropSpotlightIndexWithReply:");
}

id objc_msgSend_dumpDatabaseTo_containerID_personaID_includeAllItems_verbose_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpDatabaseTo:containerID:personaID:includeAllItems:verbose:reply:");
}

id objc_msgSend_dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:");
}

id objc_msgSend_dumpEndSectionTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpEndSectionTo:");
}

id objc_msgSend_dumpFPFSMigrationStatusTo_personaID_includeNonMigratedItems_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpFPFSMigrationStatusTo:personaID:includeNonMigratedItems:reply:");
}

id objc_msgSend_dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:");
}

id objc_msgSend_dumpPrefixWithKind_depth_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpPrefixWithKind:depth:to:");
}

id objc_msgSend_dumpToFd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpToFd:");
}

id objc_msgSend_enableUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableUpdates");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_enumerateFromStartDate_toEndDate_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateFromStartDate:toEndDate:withBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumeratorForAdditionsInNameSpace_withOptions_withoutOptions_ordering_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorForAdditionsInNameSpace:withOptions:withoutOptions:ordering:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "environment");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_etag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "etag");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_eventMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMessage");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_exec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exec");
}

id objc_msgSend_execPagerOnFileFd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execPagerOnFileFd:");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForUpdatingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForUpdatingAtPath:");
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleWithStandardOutput");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fractionCompleted");
}

id objc_msgSend_gatherInformationForPath_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherInformationForPath:reply:");
}

id objc_msgSend_generateUbiquityDiagnosticsFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateUbiquityDiagnosticsFile:");
}

id objc_msgSend_getDepth_current_previous_forThread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDepth:current:previous:forThread:");
}

id objc_msgSend_getNonlocalVersionsOfItemAtURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNonlocalVersionsOfItemAtURL:completionHandler:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hasLocalContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLocalContents");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasThumbnail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasThumbnail");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithAppLibraryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAppLibraryName:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithFd_forceColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFd:forceColor:");
}

id objc_msgSend_initWithFd_forceColor_darkMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFd:forceColor:darkMode:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUID_kind_depth_parent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:kind:depth:parent:");
}

id objc_msgSend_initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeOfflineDatabaseWhileUpgrading:loadClientState:forDBDump:error:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAtEnd");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCloudSyncTCCDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudSyncTCCDisabled");
}

id objc_msgSend_isConflict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConflict");
}

id objc_msgSend_isDataSeparated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataSeparated");
}

id objc_msgSend_isDataSeparatedAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataSeparatedAccount");
}

id objc_msgSend_isDocumentScopePublic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDocumentScopePublic");
}

id objc_msgSend_isEnumeratingDirectoryPostOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnumeratingDirectoryPostOrder");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isGlobal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGlobal");
}

id objc_msgSend_isInInitialState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInInitialState");
}

id objc_msgSend_isIndeterminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIndeterminate");
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaused");
}

id objc_msgSend_isResolved(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isResolved");
}

id objc_msgSend_isWritableFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWritableFileAtPath:");
}

id objc_msgSend_jsonStringFromDictionary_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jsonStringFromDictionary:options:error:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_libraryPathForPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "libraryPathForPersona:");
}

id objc_msgSend_localizedAdditionalDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedAdditionalDescription");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedNameOfSavingComputer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedNameOfSavingComputer");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manager");
}

id objc_msgSend_mangledIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mangledIDString");
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageType");
}

id objc_msgSend_mobileDocumentsURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileDocumentsURL");
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modificationDate");
}

id objc_msgSend_monitorGlobalActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorGlobalActivity");
}

id objc_msgSend_monitorQuery_rootPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorQuery:rootPath:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newFPFSSyncProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newFPFSSyncProxy");
}

id objc_msgSend_newLegacySyncProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newLegacySyncProxy");
}

id objc_msgSend_newSyncProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSyncProxy");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newlineCharacterSet");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openAtURL_withFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openAtURL:withFlags:error:");
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationName");
}

id objc_msgSend_otherVersionsOfItemAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherVersionsOfItemAtURL:");
}

id objc_msgSend_outputEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputEvent:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_performSelfCheck_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelfCheck:reply:");
}

id objc_msgSend_permanentStorageForItemAtURL_allocateIfNone_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "permanentStorageForItemAtURL:allocateIfNone:error:");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentIdentifier");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaIdentifier");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithValue:");
}

id objc_msgSend_prepareDiagnose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareDiagnose");
}

id objc_msgSend_previousDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousDescription");
}

id objc_msgSend_printLogWithFacility_subsystem_message_threadID_kind_sender_sendPID_depth_level_timestamp_timezone_sectionID_isOversize_previousSectionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printLogWithFacility:subsystem:message:threadID:kind:sender:sendPID:depth:level:timestamp:timezone:sectionID:isOversize:previousSectionID:");
}

id objc_msgSend_printStatus_containerID_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printStatus:containerID:reply:");
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processID");
}

id objc_msgSend_processImagePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processImagePath");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processUniqueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processUniqueID");
}

id objc_msgSend_progressObserved(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressObserved");
}

id objc_msgSend_promisedItemResourceValuesForKeys_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promisedItemResourceValuesForKeys:error:");
}

id objc_msgSend_pushSection_forThread_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushSection:forThread:");
}

id objc_msgSend_put_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "put:");
}

id objc_msgSend_puts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "puts:");
}

id objc_msgSend_puts_len_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "puts:len:");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetRedirect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetRedirect");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_resultCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultCount");
}

id objc_msgSend_resultWithTimeout_exitMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultWithTimeout:exitMessage:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "results");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_sanitizeStringForFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sanitizeStringForFilename:");
}

id objc_msgSend_scanHexLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexLongLong:");
}

id objc_msgSend_scanInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanInteger:");
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanLocation");
}

id objc_msgSend_scanString_intoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanString:intoString:");
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:");
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanUpToString:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scopes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scopes");
}

id objc_msgSend_sectionRoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionRoot");
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToEndOfFile");
}

id objc_msgSend_sessionForDumpingDatabasesAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionForDumpingDatabasesAtURL:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCharactersToBeSkipped:");
}

id objc_msgSend_setCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommand:");
}

id objc_msgSend_setCommandWithArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommandWithArguments:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDumper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDumper:");
}

id objc_msgSend_setEventFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventFilter:");
}

id objc_msgSend_setEventMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventMessage:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setFetchQuotaCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchQuotaCompletionBlock:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setLogArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogArchive:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMessageType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageType:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setObjResult_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjResult:error:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOperationQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationQueue:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPreviousDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousDescription:");
}

id objc_msgSend_setProcessID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessID:");
}

id objc_msgSend_setProcessImagePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessImagePath:");
}

id objc_msgSend_setProgressObserved_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressObserved:");
}

id objc_msgSend_setRedirectStderrToFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRedirectStderrToFileDescriptor:");
}

id objc_msgSend_setRedirectStdoutToFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRedirectStdoutToFileAtPath:");
}

id objc_msgSend_setRedirectStdoutToFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRedirectStdoutToFileDescriptor:");
}

id objc_msgSend_setScanLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScanLocation:");
}

id objc_msgSend_setScopes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScopes:");
}

id objc_msgSend_setSearchScopes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchScopes:");
}

id objc_msgSend_setSubsystem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubsystem:");
}

id objc_msgSend_setThreadID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThreadID:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startFgColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startFgColor:");
}

id objc_msgSend_startFgColor_attr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startFgColor:attr:");
}

id objc_msgSend_startPager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPager");
}

id objc_msgSend_startQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startQuery");
}

id objc_msgSend_startStringForFgColor_bgColor_attr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStringForFgColor:bgColor:attr:");
}

id objc_msgSend_stopQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopQuery");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForReset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForReset");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subsystem");
}

id objc_msgSend_taskWithCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithCommand:");
}

id objc_msgSend_taskWithCommandWithArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithCommandWithArguments:");
}

id objc_msgSend_threadID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threadID");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_timezone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timezone");
}

id objc_msgSend_traceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traceID");
}

id objc_msgSend_truncateFileAtOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "truncateFileAtOffset:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_useColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useColor");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userVersion");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_waitForAccountToLoadWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForAccountToLoadWithReply:");
}

id objc_msgSend_waitStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitStatus");
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilAllOperationsAreFinished");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_write_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "write:");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}
