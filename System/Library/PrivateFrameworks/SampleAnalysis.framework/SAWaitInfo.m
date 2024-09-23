@implementation SAWaitInfo

- (SAWaitInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAWaitInfo;
  return (SAWaitInfo *)-[SABlockingInfo _init](&v3, sel__init);
}

- (SAWaitInfo)initWithKCDataWaitInfo:(const stackshot_thread_waitinfo_v2 *)a3
{
  SAWaitInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAWaitInfo;
  result = -[SABlockingInfo _init](&v5, sel__init);
  if (result)
  {
    result->_owner = a3->owner;
    result->_context = a3->context;
    result->_type = a3->wait_type;
  }
  return result;
}

+ (id)waitInfoWithKCDataWaitInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:
{
  id v9;
  objc_class *v10;
  SAWaitInfoWithPortLabel *v11;
  id v12;
  id *v13;
  uint64_t v14;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (objc_class *)objc_opt_self();
  if (v9)
  {
    v11 = [SAWaitInfoWithPortLabel alloc];
    v12 = v9;
    if (v11)
    {
      v20.receiver = v11;
      v20.super_class = (Class)SAWaitInfoWithPortLabel;
      v13 = (id *)objc_msgSendSuper2(&v20, sel_initWithKCDataWaitInfo_, a2);
      v14 = (uint64_t)v13;
      if (v13)
      {
        objc_storeStrong(v13 + 4, a3);
        if (a4 >= 0x10000)
        {
          v16 = *__error();
          _sa_logt();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v22 = a4;
            _os_log_fault_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_FAULT, "port label flags 0x%llx is too large", buf, 0xCu);
          }

          *__error() = v16;
        }
        *(_WORD *)(v14 + 40) = a4;
        if (a5 >= 0x100)
        {
          v18 = *__error();
          _sa_logt();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v22 = a5;
            _os_log_fault_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_FAULT, "port label domain %llu is too large", buf, 0xCu);
          }

          *__error() = v18;
        }
        *(_BYTE *)(v14 + 42) = a5;
      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = objc_msgSend([v10 alloc], "initWithKCDataWaitInfo:", a2);
  }

  return (id)v14;
}

- (uint64_t)displaysSameContentAs:(int)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:
{
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v9 = a2;
  v10 = v9;
  if (a1)
  {
    if ((_QWORD *)a1 == v9)
      goto LABEL_24;
    if (v9)
    {
      if (*(unsigned __int16 *)(a1 + 8) != *((unsigned __int16 *)v9 + 4))
        goto LABEL_22;
      if (*(_QWORD *)(a1 + 16) != v9[2])
        goto LABEL_22;
      v11 = objc_msgSend((id)a1, "portFlags");
      if (v11 != objc_msgSend(v10, "portFlags"))
        goto LABEL_22;
      v12 = (void *)objc_msgSend((id)a1, "portDomain");
      if (v12 != (void *)objc_msgSend(v10, "portDomain") || (a5 & 2) != 0 && *(_QWORD *)(a1 + 24) != v10[3])
        goto LABEL_22;
      objc_msgSend((id)a1, "portName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v10, "portName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_24;
      }
      objc_msgSend((id)a1, "portName");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v10, "portName");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend((id)a1, "portName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "portName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (v13)
          {

            if ((v20 & 1) != 0)
              goto LABEL_24;
            goto LABEL_22;
          }

          if ((v20 & 1) != 0)
          {
LABEL_24:
            a1 = 1;
            goto LABEL_25;
          }
LABEL_22:
          a1 = 0;
          goto LABEL_25;
        }

      }
      if (v13)
        v12 = v13;

      goto LABEL_22;
    }
    a1 = !-[SAWaitInfo _displaysContentForPid:tid:options:displayString:nameCallback:](a1, a3, a4, a5, 0, 0);
  }
LABEL_25:

  return a1;
}

- (BOOL)_displaysContentForPid:(uint64_t)a3 tid:(char)a4 options:(_QWORD *)a5 displayString:(void *)a6 nameCallback:
{
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  _BOOL8 v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  BOOL v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  BOOL v56;
  void *v57;
  uint64_t v58;
  void *v59;
  const __CFString *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  __CFString *v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  BOOL v91;
  void *v92;
  uint64_t v93;
  id v94;
  int v96;
  int v97;
  NSObject *v98;
  _BOOL4 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint8_t buf[4];
  int v108;
  __int16 v109;
  _BOOL4 v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (!a1)
  {
LABEL_243:
    v13 = 0;
    goto LABEL_240;
  }
  if ((a5 != 0) != (v11 != 0))
  {
    v97 = *__error();
    _sa_logt();
    v98 = objc_claimAutoreleasedReturnValue();
    v99 = v12 != 0;
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a5) = a5 != 0;
      *(_DWORD *)buf = 67109376;
      v108 = (int)a5;
      v109 = 1024;
      v110 = v99;
      _os_log_error_impl(&dword_1B9BE0000, v98, OS_LOG_TYPE_ERROR, "string_out:%d StringForPidAndTid:%d", buf, 0xEu);
    }
    else
    {
      LOBYTE(a5) = a5 != 0;
    }

    *__error() = v97;
    _SASetCrashLogMessage(2139, "string_out:%d StringForPidAndTid:%d", v100, v101, v102, v103, v104, v105, (char)a5);
    _os_crash();
    __break(1u);
  }
  v13 = 0;
  v14 = a4 & 1;
  switch(*(_BYTE *)(a1 + 8))
  {
    case 0:
      v15 = *__error();
      _sa_logt();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "waitinfo has no type", buf, 2u);
      }

      v13 = 0;
      *__error() = v15;
      goto LABEL_240;
    case 1:
      v19 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v19 != 0;
      if (a5 && v19)
      {
        v20 = (void *)objc_msgSend(CFSTR("kernel mutex"), "mutableCopy");
        v21 = v20;
        if ((a4 & 2) != 0)
          objc_msgSend(v20, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
        v22 = *(_QWORD *)(a1 + 16);
        if (!v22)
          goto LABEL_133;
        if (v22 != -6)
          goto LABEL_131;
        v23 = CFSTR(" in spin mode");
        goto LABEL_134;
      }
      goto LABEL_240;
    case 2:
      if ((a4 & 1) == 0)
      {
        objc_msgSend((id)a1, "portName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v25 = *(_QWORD *)(a1 + 16);
          if (v25 != -3 && v25 != -5)
            goto LABEL_243;
        }
      }
      if (!a5)
        goto LABEL_239;
      v27 = (void *)objc_msgSend(CFSTR("mach_msg receive"), "mutableCopy");
      if ((a4 & 2) != 0
        || ((v28 = *(_QWORD *)(a1 + 16), v28 != -5) ? (v29 = v28 == -3) : (v29 = 1),
            v29
         || (objc_msgSend((id)a1, "portName"), v30 = (void *)objc_claimAutoreleasedReturnValue(), v30, v30)))
      {
        v31 = *(_QWORD *)(a1 + 16);
        v32 = CFSTR(" on port");
        if (v31 == -5)
          v32 = CFSTR(" on intransit port");
        if (v31 == -3)
          v33 = CFSTR(" on locked port");
        else
          v33 = v32;
        objc_msgSend(v27, "appendFormat:", v33);
        objc_msgSend((id)a1, "portName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend((id)a1, "portName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendFormat:", CFSTR(" name \"%@\"), v35);

        }
        if (objc_msgSend((id)a1, "portFlags"))
          objc_msgSend(v27, "appendFormat:", CFSTR(" flags 0x%llx"), objc_msgSend((id)a1, "portFlags"));
        if (objc_msgSend((id)a1, "portDomain"))
          objc_msgSend(v27, "appendFormat:", CFSTR(" in domain %llu"), objc_msgSend((id)a1, "portDomain"));
        if ((a4 & 2) != 0)
          objc_msgSend(v27, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
        v36 = *(_QWORD *)(a1 + 16);
        if (v36 != 0 && v36 < 0xFFFFFFFFFFFFFFFBLL || ((1 << (v36 + 5)) & 0x25) == 0)
          objc_msgSend(v27, "appendFormat:", CFSTR(" name 0x%llx"), *(_QWORD *)(a1 + 16));
      }
      goto LABEL_232;
    case 3:
      if ((a4 & 1) != 0
        || (objc_msgSend((id)a1, "portName"), v37 = (void *)objc_claimAutoreleasedReturnValue(), v37, v37))
      {
        if (!a5)
          goto LABEL_239;
      }
      else
      {
        v93 = *(_QWORD *)(a1 + 16);
        v13 = v93 == -4;
        if (!a5 || v93 != -4)
          goto LABEL_240;
      }
      v27 = (void *)objc_msgSend(CFSTR("mach_msg receive"), "mutableCopy");
      if ((a4 & 2) != 0
        || *(_QWORD *)(a1 + 16) == -4
        || (objc_msgSend((id)a1, "portName"), v38 = (void *)objc_claimAutoreleasedReturnValue(), v38, v38))
      {
        if (*(_QWORD *)(a1 + 16) == -4)
          v39 = CFSTR(" on locked port set");
        else
          v39 = CFSTR(" on port set");
        objc_msgSend(v27, "appendFormat:", v39);
        objc_msgSend((id)a1, "portName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend((id)a1, "portName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendFormat:", CFSTR(" name \"%@\"), v41);

        }
        if (objc_msgSend((id)a1, "portFlags"))
          objc_msgSend(v27, "appendFormat:", CFSTR(" flags 0x%llx"), objc_msgSend((id)a1, "portFlags"));
        if (objc_msgSend((id)a1, "portDomain"))
          objc_msgSend(v27, "appendFormat:", CFSTR(" in domain %llu"), objc_msgSend((id)a1, "portDomain"));
LABEL_148:
        if ((a4 & 2) != 0)
          objc_msgSend(v27, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
      }
      goto LABEL_232;
    case 4:
      if ((a4 & 1) != 0
        || ((v42 = *(_QWORD *)(a1 + 16), (unint64_t)(v42 + 3) >= 2) ? (v43 = v42 == -5) : (v43 = 1),
            v43 || (v42 ? (v91 = (int)v42 <= 0) : (v91 = 1), !v91)))
      {
        if (!a5)
          goto LABEL_239;
      }
      else
      {
        objc_msgSend((id)a1, "portName");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v92 != 0;

        if (!a5 || !v92)
          goto LABEL_240;
      }
      v27 = (void *)objc_msgSend(CFSTR("mach_msg send"), "mutableCopy");
      if ((a4 & 2) != 0
        || ((v44 = *(_QWORD *)(a1 + 16), v44 != -5) ? (v45 = v44 == -3) : (v45 = 1),
            v45
         || (objc_msgSend((id)a1, "portName"), v46 = (void *)objc_claimAutoreleasedReturnValue(), v46, v46)))
      {
        v47 = *(_QWORD *)(a1 + 16);
        v48 = CFSTR(" on port");
        if (v47 == -5)
          v48 = CFSTR(" on intransit port");
        if (v47 == -3)
          v49 = CFSTR(" on locked port");
        else
          v49 = v48;
        objc_msgSend(v27, "appendFormat:", v49);
        objc_msgSend((id)a1, "portName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          objc_msgSend((id)a1, "portName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "appendFormat:", CFSTR(" name \"%@\"), v51);

        }
        if (objc_msgSend((id)a1, "portFlags"))
          objc_msgSend(v27, "appendFormat:", CFSTR(" flags 0x%llx"), objc_msgSend((id)a1, "portFlags"));
        if (objc_msgSend((id)a1, "portDomain"))
          objc_msgSend(v27, "appendFormat:", CFSTR(" in domain %llu"), objc_msgSend((id)a1, "portDomain"));
        if ((a4 & 2) != 0)
          objc_msgSend(v27, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
      }
      v52 = *(_QWORD *)(a1 + 16);
      switch(v52)
      {
        case -5:
        case -3:
          goto LABEL_232;
        case -2:
          v52 = 0;
          *(_QWORD *)(a1 + 16) = 0;
          goto LABEL_207;
        case 0:
          goto LABEL_209;
        default:
          goto LABEL_206;
      }
      goto LABEL_232;
    case 5:
      if ((a4 & 1) != 0)
      {
        if (!a5)
          goto LABEL_239;
      }
      else
      {
        objc_msgSend((id)a1, "portName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v53 != 0;

        if (!a5 || !v53)
          goto LABEL_240;
      }
      v27 = (void *)objc_msgSend(CFSTR("mach_msg send"), "mutableCopy");
      if ((a4 & 2) != 0)
        goto LABEL_182;
      objc_msgSend((id)a1, "portName");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (v84 || objc_msgSend((id)a1, "portFlags"))
      {

      }
      else if (!objc_msgSend((id)a1, "portDomain"))
      {
        goto LABEL_190;
      }
LABEL_182:
      objc_msgSend(v27, "appendString:", CFSTR(" on port"));
      objc_msgSend((id)a1, "portName");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (v85)
      {
        objc_msgSend((id)a1, "portName");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "appendFormat:", CFSTR(" name \"%@\"), v86);

      }
      if (objc_msgSend((id)a1, "portFlags"))
        objc_msgSend(v27, "appendFormat:", CFSTR(" flags 0x%llx"), objc_msgSend((id)a1, "portFlags"));
      if (objc_msgSend((id)a1, "portDomain"))
        objc_msgSend(v27, "appendFormat:", CFSTR(" in domain %llu"), objc_msgSend((id)a1, "portDomain"));
      if ((a4 & 2) != 0)
        objc_msgSend(v27, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
LABEL_190:
      objc_msgSend(v27, "appendString:", CFSTR(" in transit"));
      if (!*(_QWORD *)(a1 + 16))
      {
        v69 = CFSTR(" to unknown port");
        goto LABEL_231;
      }
      if ((a4 & 2) != 0)
        objc_msgSend(v27, "appendFormat:", CFSTR(" to port address 0x%llx"), *(_QWORD *)(a1 + 16));
      goto LABEL_232;
    case 6:
      v54 = *(_QWORD *)(a1 + 16);
      if (v54)
      {
        v56 = (_DWORD)v54 != a2 && (int)v54 >= 0;
        if ((a4 & 3) == 0 && !v56)
        {
LABEL_103:
          objc_msgSend((id)a1, "portName");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v57 != 0;

          if (!a5 || !v57)
            goto LABEL_240;
LABEL_195:
          v27 = (void *)objc_msgSend(CFSTR("semaphore"), "mutableCopy");
          if ((a4 & 2) != 0
            || (objc_msgSend((id)a1, "portName"),
                v87 = (void *)objc_claimAutoreleasedReturnValue(),
                v87,
                v87))
          {
            objc_msgSend(v27, "appendFormat:", CFSTR(" port"));
            objc_msgSend((id)a1, "portName");
            v88 = (void *)objc_claimAutoreleasedReturnValue();

            if (v88)
            {
              objc_msgSend((id)a1, "portName");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "appendFormat:", CFSTR(" name \"%@\"), v89);

            }
            if (objc_msgSend((id)a1, "portFlags"))
              objc_msgSend(v27, "appendFormat:", CFSTR(" flags 0x%llx"), objc_msgSend((id)a1, "portFlags"));
            if (objc_msgSend((id)a1, "portDomain"))
              objc_msgSend(v27, "appendFormat:", CFSTR(" in domain %llu"), objc_msgSend((id)a1, "portDomain"));
            if ((a4 & 2) != 0)
              objc_msgSend(v27, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
          }
          v52 = *(_QWORD *)(a1 + 16);
          if (v52)
          {
LABEL_206:
            if ((v52 & 0x80000000) != 0)
            {
              v69 = CFSTR(" owned by unknown process");
            }
            else
            {
LABEL_207:
              if ((_DWORD)v52 != a2)
              {
                v12[2](v12, v52, 0);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "appendFormat:", CFSTR(" owned by %@"), v90);

LABEL_232:
                v83 = v27;
                goto LABEL_238;
              }
              v69 = CFSTR(" owned by this process");
            }
          }
          else
          {
LABEL_209:
            v69 = CFSTR(" with unknown owner");
          }
LABEL_231:
          objc_msgSend(v27, "appendFormat:", v69, v106);
          goto LABEL_232;
        }
      }
      else if ((a4 & 3) == 0)
      {
        goto LABEL_103;
      }
      if (!a5)
        goto LABEL_239;
      goto LABEL_195;
    case 7:
      v58 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v58 != 0;
      if (!a5 || !v58)
        goto LABEL_240;
      v59 = (void *)objc_msgSend(CFSTR("krwlock"), "mutableCopy");
      v21 = v59;
      if ((a4 & 2) != 0)
        objc_msgSend(v59, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
      v60 = CFSTR(" for reading");
      goto LABEL_129;
    case 8:
      v61 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v61 != 0;
      if (!a5 || !v61)
        goto LABEL_240;
      v62 = (void *)objc_msgSend(CFSTR("krwlock"), "mutableCopy");
      v21 = v62;
      if ((a4 & 2) != 0)
        objc_msgSend(v62, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
      v60 = CFSTR(" for writing");
      goto LABEL_129;
    case 9:
      v63 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v63 != 0;
      if (!a5 || !v63)
        goto LABEL_240;
      v64 = (void *)objc_msgSend(CFSTR("krwlock"), "mutableCopy");
      v21 = v64;
      if ((a4 & 2) != 0)
        objc_msgSend(v64, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
      v60 = CFSTR(" for upgrading");
      goto LABEL_129;
    case 0xA:
      v65 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v65 != 0;
      if (!a5 || !v65)
        goto LABEL_240;
      v66 = CFSTR("user lock");
      goto LABEL_127;
    case 0xB:
      v67 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v67 != 0;
      if (!a5 || !v67)
        goto LABEL_240;
      v66 = CFSTR("pthread mutex");
LABEL_127:
      v21 = (void *)-[__CFString mutableCopy](v66, "mutableCopy");
      if ((a4 & 2) != 0)
      {
        v106 = *(_QWORD *)(a1 + 24);
        v60 = CFSTR(" address 0x%llx");
LABEL_129:
        objc_msgSend(v21, "appendFormat:", v60, v106);
      }
      v22 = *(_QWORD *)(a1 + 16);
      if (!v22)
      {
LABEL_133:
        v23 = CFSTR(" with unknown owner");
        goto LABEL_134;
      }
LABEL_131:
      if (v22 == a3)
      {
        v23 = CFSTR(" owned by this thread");
        goto LABEL_134;
      }
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appendFormat:", CFSTR(" owned by %@"), v82);
      goto LABEL_175;
    case 0xC:
      v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5)
        goto LABEL_240;
      v68 = (void *)objc_msgSend(CFSTR("pthread rwlock"), "mutableCopy");
      v27 = v68;
      if ((a4 & 2) != 0)
        objc_msgSend(v68, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
      v69 = CFSTR(" for reading");
      goto LABEL_231;
    case 0xD:
      v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5)
        goto LABEL_240;
      v70 = (void *)objc_msgSend(CFSTR("pthread rwlock"), "mutableCopy");
      v27 = v70;
      if ((a4 & 2) != 0)
        objc_msgSend(v70, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 24));
      v69 = CFSTR(" for writing");
      goto LABEL_231;
    case 0xE:
      v13 = v14 != 0;
      if ((a4 & 1) == 0 || !a5)
        goto LABEL_240;
      v27 = (void *)objc_msgSend(CFSTR("pthread condvar"), "mutableCopy");
      goto LABEL_148;
    case 0xF:
    case 0x15:
      goto LABEL_240;
    case 0x10:
      if (!a5)
        goto LABEL_239;
      v71 = (void *)objc_msgSend(CFSTR("queue"), "mutableCopy");
      v21 = v71;
      if ((a4 & 2) != 0)
        objc_msgSend(v71, "appendFormat:", CFSTR(" workloop address 0x%llx"), *(_QWORD *)(a1 + 24));
      v72 = *(_QWORD *)(a1 + 16);
      if (v72 == -8)
      {
        v23 = CFSTR(" that is suspended");
        goto LABEL_134;
      }
      if (v72 == -7)
      {
        v23 = CFSTR(" thread to be allocated");
LABEL_134:
        objc_msgSend(v21, "appendFormat:", v23);
        goto LABEL_176;
      }
      if (v72 == a3)
      {
        v23 = CFSTR(" processed by this thread");
        goto LABEL_134;
      }
      if (!v72)
      {
        v23 = CFSTR(" in a transient state");
        goto LABEL_134;
      }
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "appendFormat:", CFSTR(" processed by %@"), v82);
LABEL_175:

LABEL_176:
      v83 = v21;
      goto LABEL_238;
    case 0x11:
      if (!a5)
        goto LABEL_239;
      v73 = (void *)objc_msgSend(CFSTR("wait4"), "mutableCopy");
      v74 = *(_QWORD *)(a1 + 16);
      if (v74 == -1)
      {
        v78 = CFSTR(" on any child process");
      }
      else
      {
        if ((v74 & 0x8000000000000000) == 0)
        {
          ((void (*)(void (**)(_QWORD, _QWORD, _QWORD)))v12[2])(v12);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "appendFormat:", CFSTR(" on %@"), v75);
          goto LABEL_234;
        }
        v106 = -v74;
        v78 = CFSTR(" on any process in pgrp %lld");
      }
      goto LABEL_236;
    case 0x12:
      v76 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v76 != 0;
      if (!a5 || !v76)
        goto LABEL_240;
      v73 = (void *)objc_msgSend(CFSTR("turnstile"), "mutableCopy");
      v77 = *(_QWORD *)(a1 + 16);
      if (v77)
        goto LABEL_167;
      v78 = CFSTR(" with unknown owner");
      goto LABEL_236;
    case 0x13:
      v79 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v79 != 0;
      if (!a5 || !v79)
        goto LABEL_240;
      v73 = (void *)objc_msgSend(CFSTR("event link"), "mutableCopy");
      v77 = *(_QWORD *)(a1 + 16);
      if (!v77)
      {
        v78 = CFSTR(" (held)");
        goto LABEL_236;
      }
LABEL_167:
      if (v77 == a3)
      {
        v78 = CFSTR(" owned by this thread");
        goto LABEL_236;
      }
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "appendFormat:", CFSTR(" owned by %@"), v75);
      goto LABEL_234;
    case 0x14:
      v80 = *(_QWORD *)(a1 + 16) | v14;
      v13 = v80 != 0;
      if (!a5 || !v80)
        goto LABEL_240;
      v73 = (void *)objc_msgSend(CFSTR("compressor segment"), "mutableCopy");
      v81 = *(_QWORD *)(a1 + 16);
      if (!v81)
      {
        v78 = CFSTR(" busy for unknown thread");
        goto LABEL_236;
      }
      if (v81 == a3)
      {
        v78 = CFSTR(" busy for this thread");
LABEL_236:
        objc_msgSend(v73, "appendFormat:", v78, v106);
        goto LABEL_237;
      }
      ((void (*)(void (**)(_QWORD, _QWORD, _QWORD), uint64_t))v12[2])(v12, 0xFFFFFFFFLL);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "appendFormat:", CFSTR(" busy for thread %@"), v75);
LABEL_234:

LABEL_237:
      v83 = v73;
LABEL_238:
      v94 = objc_retainAutorelease(v83);
      *a5 = v94;

LABEL_239:
      v13 = 1;
LABEL_240:

      return v13;
    default:
      v17 = *__error();
      _sa_logt();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v96 = *(unsigned __int16 *)(a1 + MEMORY[0x71C]);
        *(_DWORD *)buf = 67109120;
        v108 = v96;
        _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "waitinfo has unknown type %u", buf, 8u);
      }

      v13 = 0;
      *__error() = v17;
      goto LABEL_240;
  }
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SAWaitInfo *v5;
  SAWaitInfo *v6;
  SAWaitInfo *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v5 = (SAWaitInfo *)a3;
  if (self == v5)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (self->_type != v6->_type
          || self->_context != v6->_context
          || (v8 = -[SABlockingInfo portFlags](self, "portFlags"), v8 != -[SABlockingInfo portFlags](v7, "portFlags"))
          || (v9 = -[SABlockingInfo portDomain](self, "portDomain"), v9 != -[SABlockingInfo portDomain](v7, "portDomain"))|| self->_owner != v7->_owner)
        {
          v17 = 0;
LABEL_18:

          goto LABEL_19;
        }
        -[SABlockingInfo portName](self, "portName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          -[SABlockingInfo portName](v7, "portName");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            v17 = 1;
LABEL_24:

            goto LABEL_25;
          }
        }
        -[SABlockingInfo portName](self, "portName");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          -[SABlockingInfo portName](v7, "portName");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            -[SABlockingInfo portName](self, "portName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SABlockingInfo portName](v7, "portName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if (!v10)
              goto LABEL_24;
LABEL_25:

            goto LABEL_18;
          }

        }
        v17 = 0;
        if (!v10)
          goto LABEL_24;
        goto LABEL_25;
      }
    }
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  unsigned int type;
  unsigned int v6;
  unint64_t owner;
  unint64_t v8;
  int64_t v9;
  unint64_t context;
  unint64_t v11;

  v4 = a3;
  type = self->_type;
  v6 = *((unsigned __int16 *)v4 + 4);
  if (type > v6)
    goto LABEL_7;
  if (type < v6)
  {
LABEL_5:
    v9 = -1;
    goto LABEL_8;
  }
  owner = self->_owner;
  v8 = v4[2];
  if (owner > v8)
    goto LABEL_7;
  if (owner < v8)
    goto LABEL_5;
  context = self->_context;
  v11 = v4[3];
  if (context > v11)
  {
LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  if (context >= v11)
    v9 = 0;
  else
    v9 = -1;
LABEL_8:

  return v9;
}

- (uint64_t)matchesKCDataWaitInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v9 = a3;
  if (a1
    && *(_WORD *)(a1 + 8) == *(unsigned __int8 *)(a2 + 24)
    && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 16)
    && *(_QWORD *)(a1 + 16) == *(_QWORD *)a2
    && objc_msgSend((id)a1, "portDomain") == a5
    && objc_msgSend((id)a1, "portFlags") == a4)
  {
    objc_msgSend((id)a1, "portName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 | v10)
    {
      objc_msgSend((id)a1, "portName");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = 0;
      if (v9 && v11)
      {
        objc_msgSend((id)a1, "portName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v14, "isEqualToString:", v9);

      }
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_context ^ self->_type ^ self->_owner;
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t type;
  unint64_t context;
  unint64_t owner;
  void *v9;
  void *v10;

  -[SABlockingInfo portName](self, "portName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = v4;
  type = self->_type;
  context = self->_context;
  owner = self->_owner;
  if (v3)
  {
    -[SABlockingInfo portName](self, "portName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[ wait_type:0x%x, context:0x%llx, owner:0x%llx, port name:%@, flags:0x%llx, domain:%llu]"), type, context, owner, v9, -[SABlockingInfo portFlags](self, "portFlags"), -[SABlockingInfo portDomain](self, "portDomain"));

  }
  else
  {
    v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[ wait_type:0x%x, context:0x%llx, owner:0x%llx ]"), type, self->_context, owner);
  }
  return (NSString *)v10;
}

- (unint64_t)blockingTid
{
  int type_low;
  unint64_t result;
  int v5;
  NSObject *v6;
  int *v7;
  unint64_t owner;
  BOOL v9;
  int type;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  type_low = LOBYTE(self->_type);
  result = 0;
  switch(type_low)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 21:
      return result;
    case 1:
      owner = self->_owner;
      v9 = owner == -6;
      goto LABEL_8;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 18:
    case 19:
    case 20:
      result = self->_owner;
      break;
    case 16:
      owner = self->_owner;
      v9 = (owner & 0xFFFFFFFFFFFFFFFELL) == -8;
LABEL_8:
      if (v9)
        result = 0;
      else
        result = owner;
      break;
    default:
      v5 = *__error();
      _sa_logt();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        type = self->_type;
        v11[0] = 67109120;
        v11[1] = type;
        _os_log_fault_impl(&dword_1B9BE0000, v6, OS_LOG_TYPE_FAULT, "waitinfo has unknown type %u", (uint8_t *)v11, 8u);
      }

      v7 = __error();
      result = 0;
      *v7 = v5;
      break;
  }
  return result;
}

- (int)blockingPid
{
  unsigned int type_low;
  int v4;
  int v6;
  NSObject *v7;
  unint64_t owner;
  int type;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  type_low = LOBYTE(self->_type);
  if (type_low > 0x15)
  {
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      type = self->_type;
      v11[0] = 67109120;
      v11[1] = type;
      _os_log_fault_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_FAULT, "waitinfo has unknown type %u", (uint8_t *)v11, 8u);
    }

    *__error() = v6;
    return -1;
  }
  v4 = 1 << type_low;
  if ((v4 & 0x3DFFAF) != 0)
    return -1;
  if ((v4 & 0x20040) != 0)
  {
    if (SLODWORD(self->_owner) < 0)
      return -1;
    else
      return self->_owner;
  }
  else
  {
    owner = self->_owner;
    if (owner == -5 || owner == -3)
      return -1;
    if (owner == -2)
    {
      return 0;
    }
    else if ((owner & 0x80000000) != 0)
    {
      return -1;
    }
    else
    {
      return self->_owner;
    }
  }
}

- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 options:(unint64_t)a5 nameCallback:(id)a6
{
  id v7;

  v7 = 0;
  -[SAWaitInfo _displaysContentForPid:tid:options:displayString:nameCallback:]((uint64_t)self, a3, a4, a5, &v7, a6);
  return v7;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)owner
{
  return self->_owner;
}

- (unint64_t)context
{
  return self->_context;
}

+ (id)classDictionaryKey
{
  return CFSTR("SAWaitInfo");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 44;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  void *v9;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAWaitInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SAWaitInfo debugDescription](self, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = objc_msgSend(v13, "UTF8String");
      v24 = 2048;
      v25 = -[SAWaitInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v26 = 2048;
      v27 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v11;
    -[SAWaitInfo debugDescription](self, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    -[SAWaitInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5258, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 513;
  a3->var2 = self->_type;
  *(_QWORD *)(&a3->var2 + 1) = self->_owner;
  *(unint64_t *)((char *)&a3->var3 + 4) = self->_context;
  -[SABlockingInfo portName](self, "portName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(unint64_t *)((char *)&a3->var4 + 4) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  *(unint64_t *)((char *)&a3->var5 + 4) = -[SABlockingInfo portFlags](self, "portFlags");
  *(unint64_t *)((char *)&a3->var6 + 4) = -[SABlockingInfo portDomain](self, "portDomain");

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    -[SABlockingInfo portName](self, "portName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSelfToSerializationDictionary:", v7);

  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAWaitInfoWithPortLabel *v6;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_17;
  if (a4 <= 0x13)
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a4;
      v27 = 2048;
      v28 = 20;
      _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo struct %lu", buf, 0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(5289, "bufferLength %lu < serialized SAWaitInfo struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a4;
      v27 = 2048;
      v28 = 44;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5295, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_17:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAWaitInfo version"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
LABEL_9:
    v6 = objc_alloc_init(SAWaitInfo);
    goto LABEL_10;
  }
  if (a4 <= 0x2B)
    goto LABEL_14;
  if (*(_QWORD *)((char *)a3 + 20) == -1 && !*(_QWORD *)((char *)a3 + 28) && !*(_QWORD *)((char *)a3 + 36))
    goto LABEL_9;
  v6 = objc_alloc_init(SAWaitInfoWithPortLabel);
  -[SAWaitInfoWithPortLabel setPortFlags:](v6, "setPortFlags:", *(_QWORD *)((char *)a3 + 28));
  -[SAWaitInfoWithPortLabel setPortDomain:](v6, "setPortDomain:", *(_QWORD *)((char *)a3 + 36));
LABEL_10:
  v6->super._type = *((unsigned __int8 *)a3 + 2);
  v6->super._owner = *(_QWORD *)((char *)a3 + 4);
  v6->super._context = *(_QWORD *)((char *)a3 + 12);
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  SAWaitInfo *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  const char *ClassName;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v42 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_20;
  if (a4 <= 0x13)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v44 = a4;
      v45 = 2048;
      v46 = 20;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5323, "bufferLength %lu < serialized SAWaitInfo struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 2u)
    goto LABEL_10;
  if (a4 <= 0x2B)
  {
LABEL_14:
    v24 = *__error();
    _sa_logt();
    self = (SAWaitInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v44 = a4;
      v45 = 2048;
      v46 = 44;
      _os_log_error_impl(&dword_1B9BE0000, &self->super.super, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5327, "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
LABEL_17:
    v31 = *__error();
    _sa_logt();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      ClassName = object_getClassName(self);
      *(_DWORD *)buf = 136315138;
      v44 = (unint64_t)ClassName;
      _os_log_error_impl(&dword_1B9BE0000, v32, OS_LOG_TYPE_ERROR, "wait info with port info, but class is %s", buf, 0xCu);
    }

    *__error() = v31;
    v34 = object_getClassName(self);
    _SASetCrashLogMessage(5333, "wait info with port info, but class is %s", v35, v36, v37, v38, v39, v40, v34);
    _os_crash();
    __break(1u);
LABEL_20:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAWaitInfo version"), 0);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v41);
  }
  if (*(_QWORD *)((char *)a3 + 20) != -1 || *(_QWORD *)((char *)a3 + 28) || *(_QWORD *)((char *)a3 + 36))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = *(_QWORD *)((char *)a3 + 20);
      v13 = self;
      v14 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v42, v11, v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWaitInfo setPortName:](v13, "setPortName:", v15);

      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_10:

}

+ (SAWaitInfo)stateWithPAStyleSerializedWaitInfo:(uint64_t)a1
{
  SAWaitInfo *v3;

  objc_opt_self();
  v3 = objc_alloc_init(SAWaitInfo);
  v3->_type = *(unsigned __int8 *)(a2 + 24);
  v3->_owner = *(_QWORD *)(a2 + 8);
  v3->_context = *(_QWORD *)(a2 + 16);
  return v3;
}

@end
