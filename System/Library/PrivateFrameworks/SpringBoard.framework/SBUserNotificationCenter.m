@implementation SBUserNotificationCenter

+ (void)_userNotificationDone:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("SBUserNotificationDoneNotification"), v6);

  objc_msgSend((id)__userNotifications, "removeObject:", v6);
  if (!objc_msgSend((id)__userNotifications, "count"))
  {
    v5 = (void *)__userNotifications;
    __userNotifications = 0;

  }
}

+ (void)dispatchUserNotification:(id)a3 flags:(int)a4 replyPort:(unsigned int)a5 auditToken:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  SBUserNotificationAlert *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  SBUserNotificationAlert *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if ((v8 & 8) != 0)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C9B890]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "intValue");

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = (id)__userNotifications;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v26, "token") == v20)
          {
            v14 = v26;
            goto LABEL_18;
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v23)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_18:

    -[SBUserNotificationAlert cancel](v14, "cancel");
  }
  else if ((v8 & 0x10) != 0)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C9B890]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "intValue");

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = (SBUserNotificationAlert *)(id)__userNotifications;
    v29 = -[SBUserNotificationAlert countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v36;
LABEL_23:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v14);
        v33 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v32);
        if (objc_msgSend(v33, "token", (_QWORD)v35) == v28)
          break;
        if (v30 == ++v32)
        {
          v30 = -[SBUserNotificationAlert countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          if (v30)
            goto LABEL_23;
          goto LABEL_19;
        }
      }
      v34 = v33;

      if (!v34)
        goto LABEL_20;
      -[SBUserNotificationAlert updateWithMessage:requestFlags:](v34, "updateWithMessage:requestFlags:", v10, v8);
      v14 = v34;
    }
  }
  else
  {
    SBLogCFUserNotifications();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "pid");
      BSProcessDescriptionForPID();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v44 = v7;
      v45 = 2114;
      v46 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Presenting a CFUserNotification with reply port: %u on behalf of: %{public}@", buf, 0x12u);

    }
    v14 = -[SBUserNotificationAlert initWithMessage:replyPort:requestFlags:auditToken:]([SBUserNotificationAlert alloc], "initWithMessage:replyPort:requestFlags:auditToken:", v10, v7, v8, v11);
    v15 = (void *)__userNotifications;
    if (!__userNotifications)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = (void *)__userNotifications;
      __userNotifications = (uint64_t)v16;

      v15 = (void *)__userNotifications;
    }
    objc_msgSend(v15, "addObject:", v14);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", a1, sel__userNotificationDone_, CFSTR("SBUserNotificationDoneNotification"), v14);

  }
LABEL_19:

LABEL_20:
}

+ (void)startUserNotificationCenter
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "com.apple.SBUserNotification";
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "unable to bootstrap service: %s", (uint8_t *)&v1, 0xCu);
}

void __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  UInt8 *msg;
  UInt8 *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  const __CFData *v16;
  const __CFData *v17;
  void *v18;
  CFTypeID v19;
  NSObject *v20;
  char *v21;
  mach_msg_header_t *v22;
  id v23;

  v5 = a3;
  if (a2 == 8)
  {
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], *(_DWORD *)(a1 + 40), 1u, -1);
  }
  else if (a2 == 2)
  {
    msg = (UInt8 *)dispatch_mach_msg_get_msg();
    v7 = msg;
    if ((*(_DWORD *)msg & 0x80000000) != 0
      || ((v8 = *((unsigned int *)msg + 1), v8 >= 0x1C) ? (v9 = v8 == 0) : (v9 = 0), !v9))
    {
      SBLogCFUserNotifications();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_2(v10);
      goto LABEL_25;
    }
    v11 = *((unsigned int *)msg + 2);
    *((_DWORD *)msg + 2) = 0;
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenFromMachMessage:", msg);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (_SBUserNotificationAuthenticator_onceToken != -1)
      dispatch_once(&_SBUserNotificationAuthenticator_onceToken, &__block_literal_global_40);
    v23 = 0;
    v12 = (id)_SBUserNotificationAuthenticator___authenticator;
    v13 = objc_msgSend(v12, "authenticateAuditToken:error:", v10, &v23);
    v14 = v23;

    if ((v13 & 1) != 0)
    {

      v15 = *((unsigned int *)v7 + 5);
      v16 = CFDataCreate(0, v7 + 28, *((unsigned int *)v7 + 1) - 28);
      if (v16)
      {
        v17 = v16;
        v18 = (void *)CFPropertyListCreateWithData(0, v16, 0, 0, 0);
        CFRelease(v17);
        if (v18)
        {
          v19 = CFGetTypeID(v18);
          if (v19 == CFDictionaryGetTypeID())
          {
            objc_msgSend(*(id *)(a1 + 32), "dispatchUserNotification:flags:replyPort:auditToken:", v18, v15, v11, v10);

LABEL_25:
            mach_msg_destroy((mach_msg_header_t *)v7);
            goto LABEL_26;
          }
          CFRelease(v18);
        }
      }
    }
    else
    {
      SBLogCFUserNotifications();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_1(v10, (uint64_t)v14, v20);

    }
    v21 = (char *)malloc_type_calloc(0x1CuLL, 1uLL, 0x3E6A277BuLL);
    if (v21)
    {
      v22 = (mach_msg_header_t *)v21;
      *(_QWORD *)v21 = 0x1C00000012;
      *((_DWORD *)v21 + 2) = v11;
      *((_DWORD *)v21 + 3) = 0;
      *(_QWORD *)(v21 + 20) = 3;
      if (mach_msg((mach_msg_header_t *)v21, 1, 0x1Cu, 0, 0, 0, 0))
        mach_msg_destroy(v22);
      free(v22);
    }
    goto LABEL_25;
  }
LABEL_26:

}

void __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pid");
  BSProcessDescriptionForPID();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "CFUserNotification authorization failure: %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

void __55__SBUserNotificationCenter_startUserNotificationCenter__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Invalid message received", v1, 2u);
}

@end
