uint64_t *NfRestoreSEOpen(uint64_t a1, uint64_t a2)
{
  return NfRestoreSEOpen_Internal(a1, 1, a2, 0);
}

uint64_t *NfRestoreSEOpenWithError(uint64_t a1, uint64_t a2, int *a3)
{
  return NfRestoreSEOpen_Internal(a1, 1, a2, a3);
}

uint64_t *NfRestoreSEOpen_Internal(uint64_t a1, int a2, uint64_t a3, int *a4)
{
  const void **v5;
  void (*v6)(uint64_t, const char *, ...);
  NSObject *v7;
  uint64_t *v8;
  uint64_t *v10;
  uint64_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const char *v15;
  int v16;
  const void **v17;
  void (*v18)(uint64_t, const char *, ...);
  NSObject *v19;
  const char *v20;
  const void **v21;
  void (*v22)(uint64_t, const char *, ...);
  const void **v23;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v25;
  char *v27;
  const void **v28;
  void (*v29)(uint64_t, const char *, ...);
  uint8_t v30[4];
  const char *v31;
  __int16 v32;
  int v33;
  _DWORD buf[6];
  uint64_t v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (!gNfContext)
  {
    gNfContext = (uint64_t)NfContextInit(0, a1, a3);
    if (gNfContext)
    {
      v10 = (uint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
      if (v10)
      {
        v8 = v10;
        v36 = 0u;
        memset(buf, 0, sizeof(buf));
        v35 = NFRestoreGetDriverFlags() | 0x200000;
        v11 = NFDriverOpen();
        *v8 = v11;
        if (!v11)
        {
          v23 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger)
            Logger(3, "%s:%i Failed to load driver", "NfRestoreSEOpen_Internal", 198);
          dispatch_get_specific(*v23);
          v25 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v30 = 136446466;
            v31 = "NfRestoreSEOpen_Internal";
            v32 = 1024;
            v33 = 198;
            _os_log_impl(&dword_2295E9000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", v30, 0x12u);
          }
          if (!a4)
            goto LABEL_36;
          v16 = 10;
          goto LABEL_35;
        }
        if (NFDriverLoadStack())
        {
          v12 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v13)
            v13(3, "%s:%i Failed to load stack", "NfRestoreSEOpen_Internal", 205);
          dispatch_get_specific(*v12);
          v14 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          *(_DWORD *)v30 = 136446466;
          v31 = "NfRestoreSEOpen_Internal";
          v32 = 1024;
          v33 = 205;
          v15 = "%{public}s:%i Failed to load stack";
        }
        else
        {
          v27 = NfSecureElementOpen(*v8, a2);
          v8[1] = (uint64_t)v27;
          if (v27)
            return v8;
          v28 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v29)
            v29(3, "%s:%i Failed to open SE", "NfRestoreSEOpen_Internal", 213);
          dispatch_get_specific(*v28);
          v14 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          *(_DWORD *)v30 = 136446466;
          v31 = "NfRestoreSEOpen_Internal";
          v32 = 1024;
          v33 = 213;
          v15 = "%{public}s:%i Failed to open SE";
        }
        _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_ERROR, v15, v30, 0x12u);
LABEL_17:
        if (!a4)
        {
LABEL_36:
          NfRestoreSEClose(v8);
          NfContextFree((void *)gNfContext);
          v8 = 0;
          gNfContext = 0;
          return v8;
        }
        v16 = 9;
LABEL_35:
        *a4 = v16;
        goto LABEL_36;
      }
      v21 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v22)
        v22(3, "%s:%i Failed to create NfRestoreSE object", "NfRestoreSEOpen_Internal", 186);
      dispatch_get_specific(*v21);
      v19 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        return 0;
      buf[0] = 136446466;
      *(_QWORD *)&buf[1] = "NfRestoreSEOpen_Internal";
      LOWORD(buf[3]) = 1024;
      *(_DWORD *)((char *)&buf[3] + 2) = 186;
      v20 = "%{public}s:%i Failed to create NfRestoreSE object";
    }
    else
    {
      v17 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v18)
        v18(3, "%s:%i Failed to create context", "NfRestoreSEOpen_Internal", 180);
      dispatch_get_specific(*v17);
      v19 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        return 0;
      buf[0] = 136446466;
      *(_QWORD *)&buf[1] = "NfRestoreSEOpen_Internal";
      LOWORD(buf[3]) = 1024;
      *(_DWORD *)((char *)&buf[3] + 2) = 180;
      v20 = "%{public}s:%i Failed to create context";
    }
    _os_log_impl(&dword_2295E9000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)buf, 0x12u);
    return 0;
  }
  v5 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v6 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v6)
    v6(3, "%s:%i Context already exists", "NfRestoreSEOpen_Internal", 173);
  dispatch_get_specific(*v5);
  v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    buf[0] = 136446466;
    *(_QWORD *)&buf[1] = "NfRestoreSEOpen_Internal";
    LOWORD(buf[3]) = 1024;
    *(_DWORD *)((char *)&buf[3] + 2) = 173;
    _os_log_impl(&dword_2295E9000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Context already exists", (uint8_t *)buf, 0x12u);
  }
  if (!a4)
    return 0;
  v8 = 0;
  *a4 = 4;
  return v8;
}

void NfRestoreSEClose(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
      NfSecureElementClose(v2);
    if (*a1)
    {
      NFDriverUnloadStackAndLeaveHWEnabled();
      NFDriverClose();
    }
    free(a1);
  }
  if (gNfContext)
  {
    NfContextFree((void *)gNfContext);
    gNfContext = 0;
  }
}

uint64_t NfRestoreSETransceive(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  return NfRestoreSETransceiveToOS(a1, 0, a2, a3, a4, a5);
}

uint64_t NfRestoreSETransceiveToOS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t *a6)
{
  uint64_t v8;
  unint64_t v9;
  const void **v10;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v12;
  uint64_t v13;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 6;
  NFDataCreateWithBytes();
  v8 = NFDriverSecureElementTransceive();
  NFDataRelease();
  if (v8)
  {
    if (a5 && a6)
    {
      v9 = *(_QWORD *)(v8 + 8);
      if (*a6 < v9)
      {
        v10 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(3, "%s:%i Provided buffer too small for result: %zu", "NfRestoreSETransceiveToOS", 292, *(_QWORD *)(v8 + 8));
        dispatch_get_specific(*v10);
        v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = *(_QWORD *)(v8 + 8);
          *(_DWORD *)buf = 136446722;
          v19 = "NfRestoreSETransceiveToOS";
          v20 = 1024;
          v21 = 292;
          v22 = 2048;
          v23 = v13;
          _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i Provided buffer too small for result: %zu", buf, 0x1Cu);
        }
        NFDataRelease();
        return 11;
      }
      *a6 = v9;
      memcpy(a5, *(const void **)v8, *(_QWORD *)(v8 + 8));
    }
    NFDataRelease();
    return 0;
  }
  v15 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v16)
    v16(3, "%s:%i Transceive failed", "NfRestoreSETransceiveToOS", 286);
  dispatch_get_specific(*v15);
  v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v19 = "NfRestoreSETransceiveToOS";
    v20 = 1024;
    v21 = 286;
    _os_log_impl(&dword_2295E9000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Transceive failed", buf, 0x12u);
  }
  return 9;
}

uint64_t NfRestoreSEList()
{
  return NfRestoreSEEnumerate();
}

uint64_t NfRestoreSEEnumerate()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint64_t v7;
  void (*v8)(_DWORD *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  const void **v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  const void **v21;
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  const void **v24;
  void (*v25)(uint64_t, const char *, ...);
  NSObject *v26;
  void (*v27)(uint64_t, const char *, ...);
  NSObject *v28;
  void (*v29)(uint64_t, const char *, ...);
  NSObject *v30;
  void (*v31)(uint64_t, const char *, ...);
  NSObject *v32;
  uint64_t i;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _QWORD v50[428];
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  int v55;
  _DWORD v56[12];
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v0 = MEMORY[0x24BDAC7A8]();
  v81 = *MEMORY[0x24BDAC8D0];
  v80 = 0u;
  v79 = 0u;
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v69 = 0u;
  v68 = 0u;
  v67 = 0u;
  v66 = 0u;
  v65 = 0u;
  v64 = 0u;
  v63 = 0u;
  v62 = 0u;
  v61 = 0u;
  v60 = 0u;
  v59 = 0u;
  v58 = 0u;
  v57 = 0u;
  memset(v56, 0, sizeof(v56));
  if (gNfContext)
  {
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Context already exists", "NfRestoreSEEnumerate", 318);
    dispatch_get_specific(*v3);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v42 = "NfRestoreSEEnumerate";
      v43 = 1024;
      v44 = 318;
      _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Context already exists", buf, 0x12u);
    }
    return 4;
  }
  v7 = v2;
  v8 = (void (*)(_DWORD *, uint64_t, uint64_t))v0;
  gNfContext = (uint64_t)NfContextInit(0, v1, v2);
  NFRestoreGetDriverFlags();
  v9 = NFDriverOpen();
  if (v9)
  {
    v10 = v9;
    if (NFDriverLoadStack())
    {
      v11 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12)
        v12(3, "%s:%i Failed to load stack", "NfRestoreSEEnumerate", 338);
      dispatch_get_specific(*v11);
      v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v42 = "NfRestoreSEEnumerate";
        v43 = 1024;
        v44 = 338;
        _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
      }
      NFDriverClose();
      NfContextFree((void *)gNfContext);
      gNfContext = 0;
      if (NFProductIsDevBoard())
      {
        dispatch_get_specific(*v11);
        v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v14)
          v14(4, "%s:%i Failed to get driver info", "NfRestoreSEEnumerate", 343);
        dispatch_get_specific(*v11);
        v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v42 = "NfRestoreSEEnumerate";
          v43 = 1024;
          v44 = 343;
          _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get driver info", buf, 0x12u);
        }
        dispatch_get_specific(*v11);
        v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v16)
          v16(4, "%s:%i Assuming HW not present", "NfRestoreSEEnumerate", 344);
        dispatch_get_specific(*v11);
        v17 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v42 = "NfRestoreSEEnumerate";
          v43 = 1024;
          v44 = 344;
          _os_log_impl(&dword_2295E9000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Assuming HW not present", buf, 0x12u);
        }
        return 1;
      }
      return 9;
    }
    if ((NFDriverGetControllerInfo() & 1) == 0)
    {
      v21 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v22)
        v22(4, "%s:%i Failed to get controller info", "NfRestoreSEEnumerate", 353);
      dispatch_get_specific(*v21);
      v23 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v42 = "NfRestoreSEEnumerate";
        v43 = 1024;
        v44 = 353;
        _os_log_impl(&dword_2295E9000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get controller info", buf, 0x12u);
      }
      return 9;
    }
    if ((NfRestoreSEDumpControllerInfo_controllerInfoPrinted & 1) == 0)
    {
      v24 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25)
        v25(6, "%s:%i ==== CONTROLLER ====", "NfRestoreSEDumpControllerInfo", 95);
      dispatch_get_specific(*v24);
      v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v42 = "NfRestoreSEDumpControllerInfo";
        v43 = 1024;
        v44 = 95;
        _os_log_impl(&dword_2295E9000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ==== CONTROLLER ====", buf, 0x12u);
      }
      dispatch_get_specific(*v24);
      v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v27)
        v27(6, "%s:%i Hardware: %x.%x (%s)", "NfRestoreSEDumpControllerInfo", 99, 0, 0, "Unknown");
      dispatch_get_specific(*v24);
      v28 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v42 = "NfRestoreSEDumpControllerInfo";
        v43 = 1024;
        v44 = 99;
        v45 = 1024;
        v46 = 0;
        v47 = 1024;
        v48 = 0;
        v49 = 2080;
        v50[0] = "Unknown";
        _os_log_impl(&dword_2295E9000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hardware: %x.%x (%s)", buf, 0x28u);
      }
      dispatch_get_specific(*v24);
      v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v29)
        v29(6, "%s:%i Firmware: %x.%x rev %d", "NfRestoreSEDumpControllerInfo", 103, 0, 0, 0);
      dispatch_get_specific(*v24);
      v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447234;
        v42 = "NfRestoreSEDumpControllerInfo";
        v43 = 1024;
        v44 = 103;
        v45 = 1024;
        v46 = 0;
        v47 = 1024;
        v48 = 0;
        v49 = 1024;
        LODWORD(v50[0]) = 0;
        _os_log_impl(&dword_2295E9000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Firmware: %x.%x rev %d", buf, 0x24u);
      }
      dispatch_get_specific(*v24);
      v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v31)
        v31(6, "%s:%i Middleware: %x.%x.%x.%x", "NfRestoreSEDumpControllerInfo", 108, 0, 0, 0, 0);
      dispatch_get_specific(*v24);
      v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447490;
        v42 = "NfRestoreSEDumpControllerInfo";
        v43 = 1024;
        v44 = 108;
        v45 = 1024;
        v46 = 0;
        v47 = 1024;
        v48 = 0;
        v49 = 1024;
        LODWORD(v50[0]) = 0;
        WORD2(v50[0]) = 1024;
        *(_DWORD *)((char *)v50 + 6) = 0;
        _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Middleware: %x.%x.%x.%x", buf, 0x2Au);
      }
      NfRestoreSEDumpControllerInfo_controllerInfoPrinted = 1;
    }
    if (!MEMORY[0x22E2CD270](v10, 1))
    {
      v35 = 0;
LABEL_70:
      if (MEMORY[0x22E2CD270](v10, 2))
      {
        v38 = 0;
        v39 = (unint64_t)&v56[36 * v35];
        *(_DWORD *)v39 = 2;
        *(_BYTE *)(v39 + 4) = 1;
        *(_BYTE *)(v39 + 5) = 0;
        v40 = v39 | 8;
        do
        {
          *(_DWORD *)(v40 + v38) = 4;
          v38 += 32;
        }
        while (v38 != 128);
        v35 = (v35 + 1);
      }
      NFDriverUnloadStackAndLeaveHWEnabled();
      NFDriverClose();
      NfContextFree((void *)gNfContext);
      gNfContext = 0;
      v8(v56, v35, v7);
      return 0;
    }
    v56[0] = 0;
    LOWORD(v56[1]) = 257;
    bzero(buf, 0xE08uLL);
    if (!NFDriverSetConfiguration())
    {
LABEL_69:
      v35 = 1;
      goto LABEL_70;
    }
    if (NFDriverSecureElementGetOSMode() && NFDriverSecureElementGetOSInfo())
    {
      for (i = 0; i != 32; i += 8)
        v56[i + 2] = 4;
      if (BYTE1(v56[1]))
        v34 = v55 == 2;
      else
        v34 = 1;
      if (!v34)
      {
        v36 = 0;
LABEL_67:
        v37 = &v56[8 * v36];
        v37[2] = 2;
        *((_BYTE *)v37 + 36) = 24;
        *(_QWORD *)(v37 + 7) = v54;
        *(_OWORD *)(v37 + 3) = v53;
        goto LABEL_68;
      }
      v56[2] = 0;
      LOBYTE(v56[9]) = 24;
      *(_OWORD *)&v56[3] = v51;
      *(_QWORD *)&v56[7] = v52;
      if (BYTE1(v56[1]))
      {
        v36 = 1;
        goto LABEL_67;
      }
    }
LABEL_68:
    NFDriverSetConfiguration();
    goto LABEL_69;
  }
  v18 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v19)
    v19(3, "%s:%i Failed to load driver", "NfRestoreSEEnumerate", 330);
  dispatch_get_specific(*v18);
  v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v42 = "NfRestoreSEEnumerate";
    v43 = 1024;
    v44 = 330;
    _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", buf, 0x12u);
  }
  NfContextFree((void *)gNfContext);
  gNfContext = 0;
  return 10;
}

uint64_t *NfRestoreOpenWithSE(int *a1, uint64_t a2, uint64_t a3)
{
  int v3;

  v3 = *a1;
  if (*a1)
  {
    if (v3 != 2)
      return 0;
  }
  else
  {
    v3 = 1;
  }
  return NfRestoreSEOpen_Internal(a2, v3, a3, 0);
}

uint64_t *NfRestoreOpenWithSEAndResult(int *a1, uint64_t a2, uint64_t a3, int *a4)
{
  int v4;

  v4 = *a1;
  if (*a1)
  {
    if (v4 != 2)
      return 0;
  }
  else
  {
    v4 = 1;
  }
  return NfRestoreSEOpen_Internal(a2, v4, a3, a4);
}

uint64_t NfRestoreToggleDwnldReq()
{
  return 11;
}

uint64_t NfRestoreToggleSEPower(uint64_t a1)
{
  if (!a1)
    return 6;
  if (!*(_QWORD *)(a1 + 8))
    return 6;
  if (NFDriverSetSecureElementPower())
    return 0;
  return 10;
}

uint64_t NfRestoreDumpUART()
{
  return NFDriverDumpUART();
}

void _NFRestorePushError(const char *a1, unsigned int a2, char *a3, ...)
{
  __CFString *v5;
  const __CFString *v6;
  CFTypeRef v7;
  CFIndex v8;
  const void **v9;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v11;
  char *cStr;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  void *userInfoValues;
  CFTypeRef v18;
  void *userInfoKeys;
  uint64_t v20;
  uint64_t v21;
  va_list va;

  va_start(va, a3);
  v21 = *MEMORY[0x24BDAC8D0];
  userInfoKeys = 0;
  v20 = 0;
  userInfoValues = 0;
  v18 = 0;
  cStr = 0;
  vasprintf(&cStr, a3, va);
  if (cStr)
  {
    v5 = (__CFString *)CFStringCreateWithCString(0, cStr, 0x8000100u);
    free(cStr);
  }
  else
  {
    v5 = CFSTR("???");
  }
  v6 = CFStringCreateWithCString(0, a1, 0x8000100u);
  if (_gError)
  {
    v7 = CFRetain((CFTypeRef)_gError);
    CFRelease((CFTypeRef)_gError);
    _gError = 0;
    if (v5)
    {
      userInfoKeys = (void *)*MEMORY[0x24BDBD3A0];
      userInfoValues = v5;
      if (v7)
      {
        v20 = *MEMORY[0x24BDBD3B0];
        v18 = v7;
        v8 = 2;
LABEL_11:
        _gError = (uint64_t)CFErrorCreateWithUserInfoKeysAndValues(0, v6, a2, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, v8);
        CFRelease(v5);
        goto LABEL_17;
      }
LABEL_10:
      v8 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    v7 = 0;
    if (v5)
    {
      userInfoKeys = (void *)*MEMORY[0x24BDBD3A0];
      userInfoValues = v5;
      goto LABEL_10;
    }
  }
  v9 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Failed to create errorValue CFString", "_NFRestorePushError", 86);
  dispatch_get_specific(*v9);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "_NFRestorePushError";
    v15 = 1024;
    v16 = 86;
    _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create errorValue CFString", buf, 0x12u);
  }
  _gError = (uint64_t)CFErrorCreate(0, v6, a2, 0);
LABEL_17:
  CFRelease(v6);
  if (v7)
    CFRelease(v7);
}

uint64_t NFRestoreGetDriverFlags()
{
  uint64_t v0;

  if (NFPreferencesGetBool(CFSTR("LogNCI")))
    v0 = 4;
  else
    v0 = 0;
  if (NFPreferencesGetBool(CFSTR("LogMW")))
    v0 |= 0x40000000uLL;
  if (NFPreferencesGetBool(CFSTR("LogAPI")))
    v0 |= 8uLL;
  if (NFPreferencesGetBool(CFSTR("LogAPDU")))
    v0 |= 0x10uLL;
  if (NFPreferencesGetBool(CFSTR("SimulateRestoreOS")))
    v0 |= 0x200000uLL;
  if (NFPreferencesGetBool(CFSTR("ForceVenReset")))
    return v0 | 0x4000000;
  else
    return v0;
}

BOOL NFPreferencesGetBool(const __CFString *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  CFTypeID v3;
  _BOOL8 v4;
  BOOL v5;
  double valuePtr;

  v1 = (const __CFString *)CFPreferencesCopyValue(a1, CFSTR("com.apple.stockholm"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFStringGetTypeID())
    {
      v4 = 1;
      if (CFStringCompare(v2, CFSTR("true"), 1uLL) == kCFCompareEqualTo)
        goto LABEL_18;
      v4 = 1;
      if (CFStringCompare(v2, CFSTR("YES"), 1uLL) == kCFCompareEqualTo)
        goto LABEL_18;
      v5 = CFEqual(v2, CFSTR("1")) == 0;
    }
    else
    {
      if (v3 != CFNumberGetTypeID())
      {
        v4 = v3 == CFBooleanGetTypeID() && v2 == (const __CFString *)*MEMORY[0x24BDBD270];
        goto LABEL_18;
      }
      valuePtr = 0.0;
      if (CFNumberIsFloatType((CFNumberRef)v2))
      {
        CFNumberGetValue((CFNumberRef)v2, kCFNumberDoubleType, &valuePtr);
        v5 = valuePtr == 0.0;
      }
      else
      {
        CFNumberGetValue((CFNumberRef)v2, kCFNumberCFIndexType, &valuePtr);
        v5 = *(_QWORD *)&valuePtr == 0;
      }
    }
    v4 = !v5;
LABEL_18:
    CFRelease(v2);
    return v4;
  }
  return 0;
}

uint64_t NFRestoreRFSettingsForController(_DWORD *a1, int a2, const __CFDictionary *a3)
{
  CFMutableStringRef Mutable;
  __CFString *v7;
  const __CFString *v8;
  const void **v10;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v12;
  const char *v13;
  CFIndex Count;
  const void **v15;
  const CFArrayCallBacks *v16;
  const __CFArray *v17;
  uint64_t v18;
  __CFArray *v19;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFString *v22;
  const void **v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  int v26;
  int v27;
  int v28;
  const char *v29;
  const void **v30;
  void (*v31)(uint64_t, const char *, ...);
  uint64_t v32;
  const void **v33;
  void (*v34)(uint64_t, const char *, ...);
  int v35;
  int v36;
  int v37;
  const __CFString *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  Mutable = CFStringCreateMutable(0, 128);
  v7 = Mutable;
  v8 = CFSTR("SN100V_FW_A3_");
  switch(a1[1])
  {
    case 5:
      if (Mutable)
        CFRelease(Mutable);
      return NFDataCreateWithLength();
    case 7:
    case 8:
      goto LABEL_16;
    case 0xA:
    case 0xB:
      v8 = CFSTR("SN200V_FW_B1_");
      goto LABEL_16;
    case 0xC:
      if (a2)
        v8 = CFSTR("SN200V_FURY_FW_B1_");
      else
        v8 = CFSTR("SN200V_FW_B1_");
      goto LABEL_16;
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
      v8 = CFSTR("SN300V_FW_B0_");
      goto LABEL_16;
    case 0x12:
      v10 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(6, "%s:%i RF not supported", "NFRestoreRFSettingsForController", 783);
      dispatch_get_specific(*v10);
      v12 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      *(_DWORD *)buf = 136446466;
      v40 = "NFRestoreRFSettingsForController";
      v41 = 1024;
      v42 = 783;
      v13 = "%{public}s:%i RF not supported";
      goto LABEL_35;
    case 0x14:
      if ((a2 & 1) == 0)
        goto LABEL_17;
      v8 = CFSTR("SN200V_FURY_FW_B1_");
LABEL_16:
      CFStringAppend(Mutable, v8);
LABEL_17:
      CFStringAppendFormat(v7, 0, CFSTR("%02X_%02X_%02X"), a1[2], a1[3] >> 8, a1[3]);
      Count = CFDictionaryGetCount(a3);
      v15 = (const void **)malloc_type_calloc(1uLL, 8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(a3, v15, 0);
      v16 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
      v17 = CFArrayCreate(0, v15, Count, MEMORY[0x24BDBD690]);
      v18 = CFArrayGetCount(v17);
      v19 = CFArrayCreateMutable(0, v18, v16);
      if (v18 >= 1)
      {
        for (i = 0; i != v18; ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v17, i);
          v22 = ValueAtIndex;
          if ((!v7 || CFStringHasPrefix(ValueAtIndex, v7)) && CFStringHasSuffix(v22, CFSTR(".plist")))
            CFArrayAppendValue(v19, v22);
        }
      }
      CFRelease(v17);
      free(v15);
      if (!v19)
      {
        v30 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v31)
          v31(6, "%s:%i No matching files", "NFRestoreRFSettingsForController", 791);
        dispatch_get_specific(*v30);
        v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v40 = "NFRestoreRFSettingsForController";
          v41 = 1024;
          v42 = 791;
          v13 = "%{public}s:%i No matching files";
LABEL_35:
          _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
        }
LABEL_36:
        v32 = 0;
        v19 = 0;
        if (!v7)
          goto LABEL_45;
LABEL_44:
        CFRelease(v7);
        goto LABEL_45;
      }
      if (!CFArrayGetCount(v19))
      {
        v33 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v34)
          v34(3, "%s:%i Failed to find matching file for %02x_%02x_%02x", "NFRestoreRFSettingsForController", 794, a1[2], a1[3] >> 8, a1[3]);
        dispatch_get_specific(*v33);
        v25 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v35 = a1[2];
          v36 = a1[3] >> 8;
          v37 = a1[3];
          *(_DWORD *)buf = 136447234;
          v40 = "NFRestoreRFSettingsForController";
          v41 = 1024;
          v42 = 794;
          v43 = 1024;
          v44 = v35;
          v45 = 1024;
          v46 = v36;
          v47 = 1024;
          v48 = v37;
          v29 = "%{public}s:%i Failed to find matching file for %02x_%02x_%02x";
          goto LABEL_42;
        }
LABEL_43:
        v32 = 0;
        if (!v7)
          goto LABEL_45;
        goto LABEL_44;
      }
      if (CFArrayGetCount(v19) >= 2)
      {
        v23 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v24)
          v24(3, "%s:%i More than 1 file matching %02x_%02x_%02x", "NFRestoreRFSettingsForController", 797, a1[2], a1[3] >> 8, a1[3]);
        dispatch_get_specific(*v23);
        v25 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = a1[2];
          v27 = a1[3] >> 8;
          v28 = a1[3];
          *(_DWORD *)buf = 136447234;
          v40 = "NFRestoreRFSettingsForController";
          v41 = 1024;
          v42 = 797;
          v43 = 1024;
          v44 = v26;
          v45 = 1024;
          v46 = v27;
          v47 = 1024;
          v48 = v28;
          v29 = "%{public}s:%i More than 1 file matching %02x_%02x_%02x";
LABEL_42:
          _os_log_impl(&dword_2295E9000, v25, OS_LOG_TYPE_ERROR, v29, buf, 0x24u);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
      v38 = (const __CFString *)CFArrayGetValueAtIndex(v19, 0);
      v32 = NFRestoreDictionaryCopyDataForKey(a3, v38);
      if (v7)
        goto LABEL_44;
LABEL_45:
      if (v19)
        CFRelease(v19);
      return v32;
    default:
      goto LABEL_17;
  }
}

uint64_t NFRestoreDictionaryCopyDataForKey(const __CFDictionary *a1, const __CFString *a2)
{
  const __CFURL *Value;
  const __CFURL *v5;
  CFTypeID v6;
  const __CFString *v7;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  const char *CStringPtr;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  char buffer[1024];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  Value = (const __CFURL *)CFDictionaryGetValue(a1, a2);
  if (Value && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFURLGetTypeID()))
  {
    v7 = CFURLGetString(v5);
    if (!CFStringGetCStringPtr(v7, 0x8000100u))
      CFStringGetCString(v7, buffer, 1024, 0x8000100u);
    return NFDataCreateWithFile();
  }
  else
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
      if (!CStringPtr)
      {
        CStringPtr = buffer;
        CFStringGetCString(a2, buffer, 1024, 0x8000100u);
      }
      v11(3, "%s:%i No data found for %s", "NFRestoreDictionaryCopyDataForKey", 534, CStringPtr);
    }
    dispatch_get_specific(*v9);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)CFStringGetCStringPtr(a2, 0x8000100u);
      if (!v14)
      {
        v14 = buffer;
        CFStringGetCString(a2, buffer, 1024, 0x8000100u);
      }
      *(_DWORD *)buf = 136446722;
      v16 = "NFRestoreDictionaryCopyDataForKey";
      v17 = 1024;
      v18 = 534;
      v19 = 2080;
      v20 = v14;
      _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i No data found for %s", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t _NFRestore(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const void **v5;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 HasRadio;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  const void **v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  int v17;
  unsigned __int8 *v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  unsigned int v21;
  uint64_t StackBreadcrumb;
  const char *Message;
  const void **v24;
  void (*v25)(uint64_t, const char *, ...);
  NSObject *v26;
  int Stack;
  void (*v28)(uint64_t, const char *, ...);
  NSObject *v29;
  void (*v30)(uint64_t, const char *, ...);
  NSObject *v31;
  unsigned int v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  const void **v36;
  void (*v37)(uint64_t, const char *, ...);
  NSObject *v38;
  const void **v39;
  void (*v40)(uint64_t, const char *, ...);
  NSObject *v41;
  uint64_t v42;
  unsigned int v43;
  const void **v44;
  void (*v45)(uint64_t, const char *, ...);
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  int v50;
  const void **v51;
  void (*v52)(uint64_t, const char *, ...);
  NSObject *v53;
  unsigned int v54;
  uint64_t v55;
  const char *v56;
  const __CFDictionary *Value;
  CFMutableDictionaryRef MutableCopy;
  int v59;
  const void **v60;
  void (*v61)(uint64_t, const char *, ...);
  NSObject *v62;
  int HasExternalSPMIIRQ;
  const void **v64;
  void (*v65)(uint64_t, const char *, ...);
  NSObject *v66;
  int v67;
  int v68;
  void (*v69)(uint64_t, const char *, ...);
  NSObject *v70;
  const void **v71;
  void (*v72)(uint64_t, const char *, ...);
  NSObject *v73;
  unsigned int v74;
  const void **v75;
  void (*v76)(uint64_t, const char *, ...);
  NSObject *v77;
  unsigned int v78;
  uint64_t v79;
  const void **v80;
  void (*v81)(uint64_t, const char *, ...);
  NSObject *v82;
  const void **v83;
  void (*v84)(uint64_t, const char *, ...);
  NSObject *v85;
  const void **v86;
  void (*v87)(uint64_t, const char *, ...);
  NSObject *v88;
  int v89;
  int v90;
  void (*v91)(uint64_t, const char *, ...);
  NSObject *v92;
  const char *v93;
  NSObject *v94;
  uint32_t v95;
  const void **v96;
  void (*v97)(uint64_t, const char *, ...);
  NSObject *v98;
  const void **v99;
  void (*v100)(uint64_t, const char *, ...);
  NSObject *v101;
  unsigned int v102;
  uint64_t v103;
  const char *v104;
  const void **v105;
  void (*v106)(uint64_t, const char *, ...);
  NSObject *v107;
  int v108;
  int v109;
  void (*v110)(uint64_t, const char *, ...);
  NSObject *v111;
  void (*v112)(uint64_t, const char *, ...);
  NSObject *v113;
  unsigned int v114;
  const char *v115;
  const void **v116;
  void (*v117)(uint64_t, const char *, ...);
  NSObject *v118;
  const char *v119;
  NSObject *v120;
  os_log_type_t v121;
  const void **v122;
  void (*v123)(uint64_t, const char *, ...);
  NSObject *v124;
  const void **v125;
  void (*v126)(uint64_t, const char *, ...);
  NSObject *v127;
  const void **v128;
  void (*v129)(uint64_t, const char *, ...);
  NSObject *v130;
  uint64_t v131;
  const char *v132;
  int v133;
  const void **v134;
  void (*v135)(uint64_t, const char *, ...);
  NSObject *v136;
  void (*v137)(uint64_t, const char *, ...);
  NSObject *v138;
  unsigned int v139;
  uint64_t v140;
  NSObject *v141;
  char *v143;
  char *v144;
  void (*v145)(uint64_t, const char *, ...);
  NSObject *v146;
  uint64_t v147;
  const char **v148;
  size_t v149;
  char *v150;
  void (*v151)(uint64_t, const char *, ...);
  NSObject *v152;
  void (*v153)(uint64_t, const char *, ...);
  NSObject *v154;
  const void **v155;
  void (*v156)(uint64_t, const char *, ...);
  NSObject *v157;
  const __CFDictionary *v158;
  void (*v159)(uint64_t, const char *, ...);
  NSObject *v160;
  const void **v161;
  void (*v162)(uint64_t, const char *, ...);
  NSObject *v163;
  const char *v164;
  const char *v165;
  char v166;
  uint8_t v167[24];
  int v168;
  uint8_t buf[32];
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  int v184;
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v4 = a1 + 4104;
  if ((*(_BYTE *)(a1 + 4107) & 1) != 0)
    NFRestoreGetDriverFlags();
  else
    NFRestoreGetDriverFlags();
  if (_gDriver)
  {
    v5 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Driver already open. This is bad", "_NFRestore", 1433);
    dispatch_get_specific(*v5);
    v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "_NFRestore";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1433;
      _os_log_impl(&dword_2295E9000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Driver already open. This is bad", buf, 0x12u);
    }
    return 4;
  }
  _gDriver = NFDriverOpen();
  if (_gDriver)
  {
    NFDriverSetCallback();
    v9 = _gDriver;
    HasRadio = _NfRestoreHasRadio();
    if (!a2 && !*(_BYTE *)(a1 + 2056))
    {
      v24 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25)
        v25(6, "%s:%i Nothing to do", "NFRestoreNfc", 1223);
      dispatch_get_specific(*v24);
      v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "NFRestoreNfc";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1223;
        _os_log_impl(&dword_2295E9000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Nothing to do", buf, 0x12u);
      }
      goto LABEL_192;
    }
    LODWORD(v8) = _NFRestoreNfcFirmwareStep(v9, a1, a2);
    if ((_DWORD)v8)
      goto LABEL_14;
    if (NFDriverLoadStack())
    {
      v14 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15)
        v15(3, "%s:%i Failed to load stack - retrying FW download", "_NFRestoreLoadStackAndRestoreOnFailure", 1064);
      dispatch_get_specific(*v14);
      v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1064;
        _os_log_impl(&dword_2295E9000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack - retrying FW download", buf, 0x12u);
      }
      *(_WORD *)(v4 + 1) = 257;
      _NFRestoreDebugNFCCError();
      v17 = _NFRestoreNfcFirmwareStep(v9, a1, a2);
      v18 = (unsigned __int8 *)MEMORY[0x24BED8B88];
      if (v17)
      {
        dispatch_get_specific(*v14);
        v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v19)
          v19(3, "%s:%i Failed to restore after load failure.", "_NFRestoreLoadStackAndRestoreOnFailure", 1075);
        dispatch_get_specific(*v14);
        v20 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1075;
          _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to restore after load failure.", buf, 0x12u);
        }
        v21 = *v18;
        StackBreadcrumb = NFDriverGetStackBreadcrumb();
        Message = (const char *)NFDriverSerialDebugLastMessage();
        _NFRestorePushError("com.apple.nfstack", v21, "Error 0x%04x at %s:%d: %llx %s", v21, "_NFRestoreLoadStackAndRestoreOnFailure", 1076, StackBreadcrumb, Message);
LABEL_43:
        dispatch_get_specific(*v14);
        v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v30)
          v30(3, "%s:%i Failed to load stack", "NFRestoreNfc", 1236);
        dispatch_get_specific(*v14);
        v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "NFRestoreNfc";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1236;
          _os_log_impl(&dword_2295E9000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
        }
        v32 = *v18;
        v33 = NFDriverGetStackBreadcrumb();
        v34 = (const char *)NFDriverSerialDebugLastMessage();
        _NFRestorePushError("com.apple.nfstack", v32, "Error 0x%04x at %s:%d: %llx %s", v32, "NFRestoreNfc", 1237, v33, v34);
        goto LABEL_210;
      }
      Stack = NFDriverLoadStack();
      dispatch_get_specific(*v14);
      v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Stack)
      {
        if (v28)
          v28(3, "%s:%i Failed to load stack after re-restore.", "_NFRestoreLoadStackAndRestoreOnFailure", 1087);
        dispatch_get_specific(*v14);
        v29 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1087;
          _os_log_impl(&dword_2295E9000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack after re-restore.", buf, 0x12u);
        }
        _NFRestoreDebugNFCCError();
        goto LABEL_43;
      }
      if (v28)
        v28(6, "%s:%i Stack loaded after re-restore.", "_NFRestoreLoadStackAndRestoreOnFailure", 1083);
      dispatch_get_specific(*v14);
      v35 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "_NFRestoreLoadStackAndRestoreOnFailure";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1083;
        _os_log_impl(&dword_2295E9000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Stack loaded after re-restore.", buf, 0x12u);
      }
    }
    if (!*(_BYTE *)(v9 + 56))
    {
      *(_WORD *)v167 = 0;
      if (!NFDriverReadATETrimVersion())
      {
        v36 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v37)
          v37(6, "%s:%i ATE Trim version is %x (%d)", "_NFRestoreReadATETrimVersion", 1105, *(unsigned __int16 *)v167, *(unsigned __int16 *)v167);
        dispatch_get_specific(*v36);
        v38 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "_NFRestoreReadATETrimVersion";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1105;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = *(unsigned __int16 *)v167;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = *(unsigned __int16 *)v167;
          _os_log_impl(&dword_2295E9000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ATE Trim version is %x (%d)", buf, 0x1Eu);
        }
      }
    }
    if (HasRadio)
    {
      if (*(_BYTE *)(a1 + 3080))
      {
        v39 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v40)
          v40(6, "%s:%i Using data from %s", "_NFRestoreNfcRFStep", 999, (const char *)(a1 + 3080));
        dispatch_get_specific(*v39);
        v41 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 999;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = a1 + 3080;
          _os_log_impl(&dword_2295E9000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using data from %s", buf, 0x1Cu);
        }
        v42 = NFDataCreateWithFile();
        goto LABEL_65;
      }
      if (!a2)
        goto LABEL_86;
      memset(buf, 0, 28);
      v42 = 0;
      if (!NFDriverGetControllerInfo())
      {
LABEL_65:
        if (v42)
        {
          v43 = NFDriverRFSettingsSetup();
          NFDataRelease();
          if (v43 <= 0xB && ((1 << v43) & 0xC01) != 0)
          {
            LODWORD(v8) = 0;
LABEL_109:
            if (!*(_BYTE *)(v9 + 56) && NFDriverDisableLPCDAssist())
            {
              v80 = (const void **)MEMORY[0x24BEDCDB0];
              dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
              v81 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v81)
                v81(5, "%s:%i Update LPCD settings failed; continue", "NFRestoreNfc", 1252);
              dispatch_get_specific(*v80);
              v82 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                *(_QWORD *)&buf[4] = "NFRestoreNfc";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1252;
                _os_log_impl(&dword_2295E9000, v82, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Update LPCD settings failed; continue",
                  buf,
                  0x12u);
              }
            }
            NFDriverUnloadStackAndLeaveHWEnabled();
            if (NFDriverLoadStack())
            {
              v75 = (const void **)MEMORY[0x24BEDCDB0];
              dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
              v76 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v76)
                v76(3, "%s:%i Failed to load stack after RF settings. Bailing", "NFRestoreNfc", 1262);
              dispatch_get_specific(*v75);
              v77 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                *(_QWORD *)&buf[4] = "NFRestoreNfc";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1262;
                _os_log_impl(&dword_2295E9000, v77, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack after RF settings. Bailing", buf, 0x12u);
              }
              v78 = *MEMORY[0x24BED8B88];
              v79 = NFDriverGetStackBreadcrumb();
              v164 = (const char *)NFDriverSerialDebugLastMessage();
              _NFRestorePushError("com.apple.nfstack", v78, "Error 0x%04x at %s:%d: %llx %s", v78, "NFRestoreNfc", 1263, v79, v164);
LABEL_209:
              _NFRestoreDebugNFCCError();
LABEL_210:
              v8 = 9;
              goto LABEL_216;
            }
            goto LABEL_174;
          }
          v71 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v72 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v72)
            v72(3, "%s:%i Failed to update RF settings.", "_NFRestoreNfcRFStep", 1045);
          dispatch_get_specific(*v71);
          v73 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "_NFRestoreNfcRFStep";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1045;
            _os_log_impl(&dword_2295E9000, v73, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to update RF settings.", buf, 0x12u);
          }
          v74 = *MEMORY[0x24BED8B88];
          NFDriverGetStackBreadcrumb();
          NFDriverSerialDebugLastMessage();
          _NFRestorePushError("com.apple.nfstack", v74, "Error 0x%04x at %s:%d: %llx %s");
LABEL_108:
          NFDriverUnloadStackAndLeaveHWEnabled();
          LODWORD(v8) = 9;
          goto LABEL_109;
        }
LABEL_86:
        v60 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v61 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v61)
          v61(3, "%s:%i Bundle is missing RF settings - NFCC might fail RF operation", "_NFRestoreNfcRFStep", 1035);
        dispatch_get_specific(*v60);
        v62 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1035;
          _os_log_impl(&dword_2295E9000, v62, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing RF settings - NFCC might fail RF operation", buf, 0x12u);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d");
        goto LABEL_108;
      }
      Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("rf"));
      if (Value)
      {
        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, Value);
        if ((*(_BYTE *)(v4 + 3) & 1) == 0)
        {
          v59 = 0;
          goto LABEL_244;
        }
        v158 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("fury-rf"));
        if (v158)
        {
          CFDictionaryApplyFunction(v158, (CFDictionaryApplierFunction)_AddEntriesIntoDictionary, MutableCopy);
          v59 = *(_BYTE *)(v4 + 3) & 1;
LABEL_244:
          v42 = NFRestoreRFSettingsForController(buf, v59, MutableCopy);
          if (MutableCopy)
            CFRelease(MutableCopy);
          goto LABEL_65;
        }
        if (MutableCopy)
          CFRelease(MutableCopy);
        v161 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v162 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v162)
          v162(4, "%s:%i Bundle is missing folder: fury-rf", "_NFRestoreNfcRFStep", 1020);
        dispatch_get_specific(*v161);
        v163 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v167 = 136446466;
          *(_QWORD *)&v167[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&v167[12] = 1024;
          *(_DWORD *)&v167[14] = 1020;
          _os_log_impl(&dword_2295E9000, v163, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing folder: fury-rf", v167, 0x12u);
        }
        LODWORD(v8) = 0;
      }
      else
      {
        v155 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v156 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v156)
          v156(3, "%s:%i Bundle is missing folder: rf", "_NFRestoreNfcRFStep", 1006);
        dispatch_get_specific(*v155);
        v157 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v167 = 136446466;
          *(_QWORD *)&v167[4] = "_NFRestoreNfcRFStep";
          *(_WORD *)&v167[12] = 1024;
          *(_DWORD *)&v167[14] = 1006;
          _os_log_impl(&dword_2295E9000, v157, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing folder: rf", v167, 0x12u);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "_NFRestoreNfcRFStep", 1007);
        LODWORD(v8) = 5;
      }
      NFDriverUnloadStackAndLeaveHWEnabled();
      goto LABEL_109;
    }
    v166 = -1;
    memset(v167, 0, sizeof(v167));
    v168 = 0;
    if ((NFDriverGetControllerInfo() & 1) == 0)
    {
      v44 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v45 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v45)
        v45(3, "%s:%i Failed to get controller info..", "_NFRestoreConfigureSPMIIRQ", 1126);
      dispatch_get_specific(*v44);
      v46 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        goto LABEL_75;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "_NFRestoreConfigureSPMIIRQ";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1126;
      v47 = "%{public}s:%i Failed to get controller info..";
      v48 = v46;
      v49 = 18;
LABEL_74:
      _os_log_impl(&dword_2295E9000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);
LABEL_75:
      v50 = 9;
LABEL_76:
      v51 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v52)
        v52(3, "%s:%i Failed to reconfigure I/O : 0x%x", "NFRestoreNfc", 1271, v50);
      dispatch_get_specific(*v51);
      v53 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "NFRestoreNfc";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1271;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v50;
        _os_log_impl(&dword_2295E9000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to reconfigure I/O : 0x%x", buf, 0x18u);
      }
      v54 = *MEMORY[0x24BED8B88];
      v55 = NFDriverGetStackBreadcrumb();
      v56 = (const char *)NFDriverSerialDebugLastMessage();
      _NFRestorePushError("com.apple.nfstack", v54, "Error 0x%04x at %s:%d: %llx %s", v54, "NFRestoreNfc", 1272, v55, v56);
      goto LABEL_125;
    }
    HasExternalSPMIIRQ = NFHardwareInterfaceHasExternalSPMIIRQ((UInt8 *)&v166);
    if (HasExternalSPMIIRQ)
    {
      if (HasExternalSPMIIRQ < 0)
      {
        v50 = 4;
        goto LABEL_76;
      }
      if (v166 != 255)
      {
        v64 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v65)
          v65(6, "%s:%i Configuring NFCC to use GPIO %d as data IRQ", "_NFRestoreConfigureSPMIIRQ", 1144, v166);
        dispatch_get_specific(*v64);
        v66 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "_NFRestoreConfigureSPMIIRQ";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1144;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v166;
          _os_log_impl(&dword_2295E9000, v66, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Configuring NFCC to use GPIO %d as data IRQ", buf, 0x18u);
        }
        v67 = NFDriverConfigureSPMIIRQ();
        if (v67)
        {
          v68 = v67;
          dispatch_get_specific(*v64);
          v69 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v69)
            v69(3, "%s:%i Failed to configure NFCC to use GPIO %d as data IRQ : %d", "_NFRestoreConfigureSPMIIRQ", 1147, v166, v68);
          dispatch_get_specific(*v64);
          v70 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            goto LABEL_75;
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "_NFRestoreConfigureSPMIIRQ";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1147;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v166;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v68;
          v47 = "%{public}s:%i Failed to configure NFCC to use GPIO %d as data IRQ : %d";
          v48 = v70;
          v49 = 30;
          goto LABEL_74;
        }
      }
    }
    else
    {
      v83 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v84 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v84)
        v84(6, "%s:%i No external SPMIIRQ", "_NFRestoreConfigureSPMIIRQ", 1137);
      dispatch_get_specific(*v83);
      v85 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "_NFRestoreConfigureSPMIIRQ";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1137;
        _os_log_impl(&dword_2295E9000, v85, OS_LOG_TYPE_DEFAULT, "%{public}s:%i No external SPMIIRQ", buf, 0x12u);
      }
    }
LABEL_125:
    memset(buf, 0, 28);
    if (!NFProductIsPad())
      goto LABEL_147;
    if ((NFDriverGetControllerInfo() & 1) != 0)
    {
      if (*(_DWORD *)&buf[4] != 18)
        goto LABEL_147;
      v86 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v87 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v87)
        v87(6, "%s:%i Configuring RSTN delay...", "_NFRestoreConfigureRSTNDelay", 1172);
      dispatch_get_specific(*v86);
      v88 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v167 = 136446466;
        *(_QWORD *)&v167[4] = "_NFRestoreConfigureRSTNDelay";
        *(_WORD *)&v167[12] = 1024;
        *(_DWORD *)&v167[14] = 1172;
        _os_log_impl(&dword_2295E9000, v88, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Configuring RSTN delay...", v167, 0x12u);
      }
      v89 = NFDriverConfigurRSTNDelay();
      if (!v89)
      {
        if (NFGetProductType() - 86 > 3)
          goto LABEL_162;
LABEL_147:
        v105 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v106 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v106)
          v106(6, "%s:%i Configuring I2C for LPM...", "_NFRestoreConfigureI2CForLPM", 1195);
        dispatch_get_specific(*v105);
        v107 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "_NFRestoreConfigureI2CForLPM";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1195;
          _os_log_impl(&dword_2295E9000, v107, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Configuring I2C for LPM...", buf, 0x12u);
        }
        v108 = NFDriverConfigureI2CForLPM();
        if (v108)
        {
          v109 = v108;
          dispatch_get_specific(*v105);
          v110 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v110)
            v110(3, "%s:%i Failed to configure I2C for LPM: %d", "_NFRestoreConfigureI2CForLPM", 1198, v109);
          dispatch_get_specific(*v105);
          v111 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "_NFRestoreConfigureI2CForLPM";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1198;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v109;
            _os_log_impl(&dword_2295E9000, v111, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to configure I2C for LPM: %d", buf, 0x18u);
          }
          dispatch_get_specific(*v105);
          v112 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v112)
            v112(3, "%s:%i Failed to configure I2C for LPM..", "NFRestoreNfc", 1283);
          dispatch_get_specific(*v105);
          v113 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1283;
            _os_log_impl(&dword_2295E9000, v113, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to configure I2C for LPM..", buf, 0x12u);
          }
          v114 = *MEMORY[0x24BED8B88];
          v8 = NFDriverGetStackBreadcrumb();
          v115 = (const char *)NFDriverSerialDebugLastMessage();
          _NFRestorePushError("com.apple.nfstack", v114, "Error 0x%04x at %s:%d: %llx %s", v114, "NFRestoreNfc", 1284, v8, v115);
          LODWORD(v8) = 9;
        }
        else
        {
LABEL_162:
          LODWORD(v8) = 0;
        }
        if (*(_BYTE *)(v9 + 58))
        {
          if (NFDriverDisableBoost())
          {
            v116 = (const void **)MEMORY[0x24BEDCDB0];
            dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
            v117 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v117)
              v117(3, "%s:%i Failed to disable boost", "NFRestoreNfc", 1291);
            dispatch_get_specific(*v116);
            v118 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "NFRestoreNfc";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 1291;
              v119 = "%{public}s:%i Failed to disable boost";
              v120 = v118;
              v121 = OS_LOG_TYPE_ERROR;
LABEL_173:
              _os_log_impl(&dword_2295E9000, v120, v121, v119, buf, 0x12u);
            }
          }
        }
        else
        {
          v122 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v123 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v123)
            v123(6, "%s:%i No RF for this device.", "NFRestoreNfc", 1294);
          dispatch_get_specific(*v122);
          v124 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1294;
            v119 = "%{public}s:%i No RF for this device.";
            v120 = v124;
            v121 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_173;
          }
        }
LABEL_174:
        v184 = 0;
        v182 = 0u;
        v183 = 0u;
        v180 = 0u;
        v181 = 0u;
        v178 = 0u;
        v179 = 0u;
        v176 = 0u;
        v177 = 0u;
        v174 = 0u;
        v175 = 0u;
        v172 = 0u;
        v173 = 0u;
        v171 = 0u;
        v170 = 0u;
        memset(buf, 0, sizeof(buf));
        if (!NFDriverReadPageEraseCounter())
          NFDriverPrintPageEraseCounter();
        if ((*(_BYTE *)(v4 + 1028) & 1) != 0)
        {
          v125 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v126 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v126)
            v126(6, "%s:%i Erasing firmware flags.", "NFRestoreNfc", 1302);
          dispatch_get_specific(*v125);
          v127 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1302;
            _os_log_impl(&dword_2295E9000, v127, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Erasing firmware flags.", buf, 0x12u);
          }
          if (NFDriverResetFWFlags())
            LODWORD(v8) = 9;
          else
            LODWORD(v8) = 0;
        }
        NFDriverUnloadStackAndLeaveHWEnabled();
        if ((*(_BYTE *)(v4 + 3) & 0x10) != 0 && (_DWORD)v8)
        {
          v128 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v129 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v129)
            v129(3, "%s:%i Dumping EEPROM after failure", "NFRestoreNfc", 1309);
          dispatch_get_specific(*v128);
          v130 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "NFRestoreNfc";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1309;
            _os_log_impl(&dword_2295E9000, v130, OS_LOG_TYPE_ERROR, "%{public}s:%i Dumping EEPROM after failure", buf, 0x12u);
          }
          _NFRestoreDebugNFCCError();
          goto LABEL_14;
        }
        if ((_DWORD)v8)
        {
LABEL_14:
          if ((_DWORD)v8 == 1)
            v8 = 0;
          else
            v8 = v8;
          goto LABEL_216;
        }
LABEL_192:
        if ((*(_BYTE *)v4 & 4) != 0)
        {
          v8 = _NfRestoreRunAntennaSelfCheck(_gDriver, 1);
          if ((_DWORD)v8)
          {
LABEL_216:
            NFDriverClose();
            _gDriver = 0;
            return v8;
          }
        }
        else if (NFIsRestoreOS() && _NfRestoreHasRadio())
        {
          _NfRestoreRunAntennaSelfCheck(_gDriver, 0);
        }
        if ((*(_BYTE *)(v4 + 3) & 1) == 0)
        {
          v131 = _gDriver;
          v133 = *(unsigned __int8 *)(v4 + 4);
          v132 = (const char *)(v4 + 4);
          v134 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v135 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v133)
          {
            if (v135)
              v135(6, "%s:%i ", "_NFRestoreJcop", 587);
            dispatch_get_specific(*v134);
            v136 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "_NFRestoreJcop";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 587;
              _os_log_impl(&dword_2295E9000, v136, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
            }
            if (NFDriverLoadStack())
            {
              dispatch_get_specific(*v134);
              v137 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v137)
                v137(3, "%s:%i Failed to load stack", "_NFRestoreJcop", 591);
              dispatch_get_specific(*v134);
              v138 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                *(_QWORD *)&buf[4] = "_NFRestoreJcop";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 591;
                _os_log_impl(&dword_2295E9000, v138, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
              }
              v139 = *MEMORY[0x24BED8B88];
              v140 = NFDriverGetStackBreadcrumb();
              v165 = (const char *)NFDriverSerialDebugLastMessage();
              _NFRestorePushError("com.apple.nfstack", v139, "Error 0x%04x at %s:%d: %llx %s", v139, "_NFRestoreJcop", 592, v140, v165);
              goto LABEL_209;
            }
            v143 = NfSecureElementOpen(v131, 1);
            if (!v143)
            {
              dispatch_get_specific(*v134);
              v153 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v153)
                v153(3, "%s:%i Failed to open SE", "_NFRestoreJcop", 601);
              dispatch_get_specific(*v134);
              v154 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                *(_QWORD *)&buf[4] = "_NFRestoreJcop";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 601;
                _os_log_impl(&dword_2295E9000, v154, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to open SE", buf, 0x12u);
              }
              v8 = 9;
              goto LABEL_252;
            }
            v144 = v143;
            if (*v132)
            {
              dispatch_get_specific(*v134);
              v145 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v145)
                v145(6, "%s:%i Running postflight: %s", "_NFRestoreRunPostFlight", 549, v132);
              dispatch_get_specific(*v134);
              v146 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446722;
                *(_QWORD *)&buf[4] = "_NFRestoreRunPostFlight";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 549;
                *(_WORD *)&buf[18] = 2080;
                *(_QWORD *)&buf[20] = v132;
                _os_log_impl(&dword_2295E9000, v146, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Running postflight: %s", buf, 0x1Cu);
              }
              v147 = NFDataCreateWithFile();
              if (v147)
              {
                v148 = (const char **)v147;
                v149 = *(_QWORD *)(v147 + 8) + 1;
                v150 = (char *)malloc_type_calloc(1uLL, v149, 0x100004077774924uLL);
                strlcpy(v150, *v148, v149);
                v8 = NfSecureElementScriptRun((uint64_t)v144, v150);
                if ((_DWORD)v8)
                {
                  dispatch_get_specific(*v134);
                  v151 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                  if (v151)
                    v151(3, "%s:%i Failed to run script", "_NFRestoreRunPostFlight", 565);
                  dispatch_get_specific(*v134);
                  v152 = NFSharedLogGetLogger();
                  if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446466;
                    *(_QWORD *)&buf[4] = "_NFRestoreRunPostFlight";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 565;
                    _os_log_impl(&dword_2295E9000, v152, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to run script", buf, 0x12u);
                  }
                }
                free(v150);
                NFDataRelease();
                goto LABEL_251;
              }
              dispatch_get_specific(*v134);
              v159 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
              if (v159)
                v159(3, "%s:%i Failed to open %s", "_NFRestoreRunPostFlight", 554, v132);
              dispatch_get_specific(*v134);
              v160 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                *(_QWORD *)&buf[4] = "_NFRestoreRunPostFlight";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 554;
                *(_WORD *)&buf[18] = 2080;
                *(_QWORD *)&buf[20] = v132;
                _os_log_impl(&dword_2295E9000, v160, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to open %s", buf, 0x1Cu);
              }
            }
            v8 = 0;
LABEL_251:
            NfSecureElementClose(v144);
LABEL_252:
            NFDriverUnloadStackAndLeaveHWEnabled();
            goto LABEL_216;
          }
          if (v135)
            v135(6, "%s:%i Nothing to do", "_NFRestoreJcop", 583);
          dispatch_get_specific(*v134);
          v141 = NFSharedLogGetLogger();
          v8 = 0;
          if (!os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
            goto LABEL_216;
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "_NFRestoreJcop";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 583;
          _os_log_impl(&dword_2295E9000, v141, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Nothing to do", buf, 0x12u);
        }
        v8 = 0;
        goto LABEL_216;
      }
      v90 = v89;
      dispatch_get_specific(*v86);
      v91 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v91)
        v91(3, "%s:%i Failed to configure RSTN delay: %d", "_NFRestoreConfigureRSTNDelay", 1175, v90);
      dispatch_get_specific(*v86);
      v92 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
LABEL_142:
        v99 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v100 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v100)
          v100(3, "%s:%i Failed to configure RSTN delay..", "NFRestoreNfc", 1277);
        dispatch_get_specific(*v99);
        v101 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "NFRestoreNfc";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1277;
          _os_log_impl(&dword_2295E9000, v101, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to configure RSTN delay..", buf, 0x12u);
        }
        v102 = *MEMORY[0x24BED8B88];
        v103 = NFDriverGetStackBreadcrumb();
        v104 = (const char *)NFDriverSerialDebugLastMessage();
        _NFRestorePushError("com.apple.nfstack", v102, "Error 0x%04x at %s:%d: %llx %s", v102, "NFRestoreNfc", 1278, v103, v104);
        goto LABEL_147;
      }
      *(_DWORD *)v167 = 136446722;
      *(_QWORD *)&v167[4] = "_NFRestoreConfigureRSTNDelay";
      *(_WORD *)&v167[12] = 1024;
      *(_DWORD *)&v167[14] = 1175;
      *(_WORD *)&v167[18] = 1024;
      *(_DWORD *)&v167[20] = v90;
      v93 = "%{public}s:%i Failed to configure RSTN delay: %d";
      v94 = v92;
      v95 = 24;
    }
    else
    {
      v96 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v97 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v97)
        v97(3, "%s:%i Failed to get controller info..", "_NFRestoreConfigureRSTNDelay", 1167);
      dispatch_get_specific(*v96);
      v98 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        goto LABEL_142;
      *(_DWORD *)v167 = 136446466;
      *(_QWORD *)&v167[4] = "_NFRestoreConfigureRSTNDelay";
      *(_WORD *)&v167[12] = 1024;
      *(_DWORD *)&v167[14] = 1167;
      v93 = "%{public}s:%i Failed to get controller info..";
      v94 = v98;
      v95 = 18;
    }
    _os_log_impl(&dword_2295E9000, v94, OS_LOG_TYPE_ERROR, v93, v167, v95);
    goto LABEL_142;
  }
  v11 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v12)
    v12(3, "%s:%i Failed to load driver", "_NFRestore", 1439);
  dispatch_get_specific(*v11);
  v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "_NFRestore";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1439;
    _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", buf, 0x12u);
  }
  return 10;
}

void _NFRestoreGenericHardwareError(uint64_t a1, unsigned __int8 a2)
{
  unsigned int v2;
  uint64_t StackBreadcrumb;
  const char *Message;

  *MEMORY[0x24BED8B88] = a2;
  v2 = a2;
  StackBreadcrumb = NFDriverGetStackBreadcrumb();
  Message = (const char *)NFDriverSerialDebugLastMessage();
  _NFRestorePushError("com.apple.nfstack", v2, "Error 0x%04x at %s:%d: %llx %s", v2, "_NFRestoreGenericHardwareError", 518, StackBreadcrumb, Message);
}

uint64_t _NfRestoreRunAntennaSelfCheck(uint64_t a1, char a2)
{
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint64_t v6;
  const void **v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  int v11;
  int v12;
  const void **v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((NFProductIsSIP() & 1) != 0 || (NFProductIsNED() & 1) != 0 || NFProductIsDevBoard())
  {
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i This is a SIP, NED or Dev, skipping antenna test", "_NfRestoreRunAntennaSelfCheck", 245);
    dispatch_get_specific(*v3);
    v5 = NFSharedLogGetLogger();
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v20 = "_NfRestoreRunAntennaSelfCheck";
      v21 = 1024;
      v22 = 245;
      _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i This is a SIP, NED or Dev, skipping antenna test", buf, 0x12u);
      return 0;
    }
    return v6;
  }
  if (!NFDriverLoadStack())
  {
    v11 = NFDriverAntennaSelfTest();
    if (v11)
    {
      v12 = v11;
      if (v11 != 19)
      {
        v13 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v14)
          v14(3, "%s:%i Failed to check antenna : 0x%x", "_NfRestoreRunAntennaSelfCheck", 259, v12);
        dispatch_get_specific(*v13);
        v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "_NfRestoreRunAntennaSelfCheck";
          v21 = 1024;
          v22 = 259;
          v23 = 1024;
          v24 = v12;
          _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to check antenna : 0x%x", buf, 0x18u);
        }
        v6 = 9;
        goto LABEL_31;
      }
    }
    else
    {
      v16 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v17)
        v17(6, "%s:%i TX LDO current is %d", "_NfRestoreRunAntennaSelfCheck", 262, 0);
      dispatch_get_specific(*v16);
      v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v20 = "_NfRestoreRunAntennaSelfCheck";
        v21 = 1024;
        v22 = 262;
        v23 = 1024;
        v24 = 0;
        _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i TX LDO current is %d", buf, 0x18u);
      }
      if (_NfRestoreHasRadio())
      {
        if ((a2 & 1) != 0)
          v6 = 10;
        else
          v6 = 0;
        goto LABEL_31;
      }
    }
    v6 = 0;
LABEL_31:
    NFDriverUnloadStackAndLeaveHWEnabled();
    return v6;
  }
  v8 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v9)
    v9(3, "%s:%i Failed to load stack", "_NfRestoreRunAntennaSelfCheck", 251);
  dispatch_get_specific(*v8);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "_NfRestoreRunAntennaSelfCheck";
    v21 = 1024;
    v22 = 251;
    _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load stack", buf, 0x12u);
  }
  return 9;
}

BOOL _NfRestoreHasRadio()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  CFTypeID v6;
  size_t Length;
  void *v8;
  const UInt8 *BytePtr;
  int v10;
  _BOOL8 v11;
  const void **v12;
  void (*Logger)(uint64_t, const char *, ...);
  const char *v14;
  NSObject *v15;
  const char *v16;
  const void **v17;
  void (*v18)(uint64_t, const char *, ...);
  NSObject *v19;
  const void **v20;
  void (*v21)(uint64_t, const char *, ...);
  NSObject *v22;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceNameMatching("stockholm");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("nfcWithRadio"), 0, 0);
    if (CFProperty)
    {
      v5 = CFProperty;
      v6 = CFGetTypeID(CFProperty);
      if (v6 == CFDataGetTypeID())
      {
        Length = CFDataGetLength(v5);
        v8 = malloc_type_calloc(1uLL, Length, 0x100004077774924uLL);
        BytePtr = CFDataGetBytePtr(v5);
        v10 = memcmp(v8, BytePtr, Length);
        v11 = v10 != 0;
        v12 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          if (v10)
            v14 = "present";
          else
            v14 = "absent";
          Logger(6, "%s:%i Radio %s.", "_NfRestoreHasRadio", 871, v14);
        }
        dispatch_get_specific(*v12);
        v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (v10)
            v16 = "present";
          else
            v16 = "absent";
          *(_DWORD *)buf = 136446722;
          v25 = "_NfRestoreHasRadio";
          v26 = 1024;
          v27 = 871;
          v28 = 2080;
          v29 = v16;
          _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Radio %s.", buf, 0x1Cu);
        }
        free(v8);
      }
      else
      {
        v11 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      v20 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21)
        v21(6, "%s:%i No radio key, skipping RF settings.", "_NfRestoreHasRadio", 876);
      dispatch_get_specific(*v20);
      v22 = NFSharedLogGetLogger();
      v11 = 0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v25 = "_NfRestoreHasRadio";
        v26 = 1024;
        v27 = 876;
        _os_log_impl(&dword_2295E9000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%i No radio key, skipping RF settings.", buf, 0x12u);
        v11 = 0;
      }
    }
    IOObjectRelease(v3);
  }
  else
  {
    v17 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18)
      v18(3, "%s:%i Failed find IOKit service", "_NfRestoreHasRadio", 881);
    dispatch_get_specific(*v17);
    v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "_NfRestoreHasRadio";
      v26 = 1024;
      v27 = 881;
      _os_log_impl(&dword_2295E9000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v11;
}

uint64_t NfRestoreReturnError()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  CFErrorRef *v3;
  CFErrorRef *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  const void **v10;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v12;
  uint64_t v13;
  int v14;
  int v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  const void **v22;
  void (*v23)(uint64_t, const char *, ...);
  NSObject *v24;
  const __CFData *Value;
  const void **v26;
  void (*v27)(uint64_t, const char *, ...);
  NSObject *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFAllocator *v32;
  const __CFData *v33;
  const void **v34;
  void (*v35)(uint64_t, const char *, ...);
  NSObject *v36;
  int v37;
  int v38;
  int v39;
  const void **v40;
  void (*v41)(uint64_t, const char *, ...);
  const __CFString *v42;
  const __CFString *v43;
  char *v44;
  const void **v45;
  char *v46;
  BOOL v47;
  const char *v48;
  void (*v49)(uint64_t, const char *, ...);
  NSObject *v50;
  const void **v51;
  void (*v52)(uint64_t, const char *, ...);
  NSObject *v53;
  const void **v54;
  void (*v55)(uint64_t, const char *, ...);
  NSObject *v56;
  const __CFString *v57;
  const __CFBoolean *v58;
  BOOL v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFBoolean *v62;
  BOOL v63;
  const __CFBoolean *v64;
  char v65;
  const __CFBoolean *v66;
  char v67;
  const __CFBoolean *v68;
  char v69;
  const __CFString *v70;
  const __CFNumber *v71;
  const __CFBoolean *v72;
  BOOL v73;
  const __CFString *v74;
  const __CFBoolean *v75;
  BOOL v76;
  const __CFBoolean *v77;
  char v78;
  const __CFBoolean *v79;
  char v80;
  const __CFBoolean *v81;
  char v82;
  uint64_t IsSupported;
  char v84;
  char v85;
  int v86;
  const void **v87;
  void (*v88)(uint64_t, const char *, ...);
  NSObject *v89;
  char *v90;
  const void **v91;
  void (*v92)(uint64_t, const char *, ...);
  NSObject *v93;
  NSObject *v94;
  const void **v95;
  void (*v96)(uint64_t, const char *, ...);
  NSObject *v97;
  uint64_t v98;
  void (*v99)(uint64_t, const char *, ...);
  NSObject *v100;
  const char *v101;
  unsigned int v102;
  void (*v103)(uint64_t, const char *, ...);
  NSObject *v104;
  uint64_t v105;
  const __CFString *v106;
  const __CFDictionary *v107;
  const __CFDictionary *v108;
  const __CFBoolean *v109;
  BOOL v110;
  const void **v111;
  void (*v112)(uint64_t, const char *, ...);
  NSObject *v113;
  void (*v114)(uint64_t, const char *, ...);
  const void **v115;
  void (*v116)(uint64_t, const char *, ...);
  NSObject *v117;
  int v118;
  const __CFString *v119;
  char v120;
  char v121;
  const void **v122;
  void (*v123)(uint64_t, const char *, ...);
  NSObject *v125;
  unsigned int v126;
  void (*v127)(uint64_t, const char *, ...);
  NSObject *v128;
  uint64_t v129;
  void (*v130)(uint64_t, const char *, ...);
  NSObject *v131;
  void (*v132)(uint64_t, const char *, ...);
  CFErrorRef *v133;
  CFTypeRef cf;
  char *v135;
  char *__lasts;
  uint8_t buf[4];
  const char *v138;
  __int16 v139;
  int v140;
  char v141[1024];
  char v142;
  unsigned int v143;
  char v144[1024];
  char v145[1024];
  char v146;
  _BYTE v147[2];
  char v148;
  char v149[1024];
  char v150;
  char v151[1027];
  _BYTE v152[12];
  __int16 v153;
  int v154;
  __int16 v155;
  int *v156;
  int v157;
  const char *v158;
  __int16 v159;
  int v160;
  __int16 v161;
  const char *v162;
  __int16 v163;
  char *v164;
  int v165;
  const char *v166;
  __int16 v167;
  int v168;
  __int16 v169;
  _BYTE v170[10];
  uint64_t v171;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (const __CFDictionary *)v0;
  v171 = *MEMORY[0x24BDAC8D0];
  if (_gError)
  {
    CFRelease((CFTypeRef)_gError);
    _gError = 0;
  }
  if (gNfContext)
  {
    v10 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Context already exists", "NfRestoreReturnError", 1502);
    dispatch_get_specific(*v10);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v138 = "NfRestoreReturnError";
      v139 = 1024;
      v140 = 1502;
      _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i Context already exists", buf, 0x12u);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfRestoreReturnError", 1503);
    return 4;
  }
  gNfContext = (uint64_t)NfContextInit(v8, v6, v2);
  bzero(buf, 0x1810uLL);
  cf = 0;
  *(_QWORD *)v152 = 0;
  bzero(&v165, 0x400uLL);
  v14 = sysctlbyname("kern.bootargs", 0, (size_t *)v152, 0, 0);
  if (v14)
  {
    v15 = v14;
    v16 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v17)
      v17(3, "%s:%i Failed to read boot-args: %d", "NFRestoreParseBootArgs", 204, v15);
    dispatch_get_specific(*v16);
    v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v157 = 136446722;
      v158 = "NFRestoreParseBootArgs";
      v159 = 1024;
      v160 = 204;
      v161 = 1024;
      LODWORD(v162) = v15;
      v19 = "%{public}s:%i Failed to read boot-args: %d";
LABEL_14:
      v20 = v18;
      v21 = 24;
LABEL_20:
      _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v157, v21);
    }
  }
  else if (*(_QWORD *)v152 < 0x401uLL)
  {
    if (*(_QWORD *)v152)
    {
      v38 = sysctlbyname("kern.bootargs", &v165, (size_t *)v152, 0, 0);
      if (v38)
      {
        v39 = v38;
        v40 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v41)
          v41(3, "%s:%i Failed to read boot-args: %d", "NFRestoreParseBootArgs", 216, v39);
        dispatch_get_specific(*v40);
        v18 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v157 = 136446722;
          v158 = "NFRestoreParseBootArgs";
          v159 = 1024;
          v160 = 216;
          v161 = 1024;
          LODWORD(v162) = v39;
          v19 = "%{public}s:%i Failed to read boot-args: %d";
          goto LABEL_14;
        }
      }
      else
      {
        __lasts = 0;
        v44 = strtok_r((char *)&v165, " ", &__lasts);
        if (v44)
        {
          v45 = (const void **)MEMORY[0x24BEDCDB0];
          do
          {
            v135 = (char *)&unk_229601C58;
            v46 = strtok_r(v44, "=", &v135);
            if (v46)
              v47 = v135 == 0;
            else
              v47 = 1;
            if (!v47)
            {
              v48 = v46;
              if (!strcmp(v46, "nfrestore-loop"))
              {
                dispatch_get_specific(*v45);
                v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                if (v49)
                  v49(6, "%s:%i Found boot-arg \"%s\" = \"%s\"", "NFRestoreParseBootArgs", 228, v48, v135);
                dispatch_get_specific(*v45);
                v50 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  v157 = 136446978;
                  v158 = "NFRestoreParseBootArgs";
                  v159 = 1024;
                  v160 = 228;
                  v161 = 2080;
                  v162 = v48;
                  v163 = 2080;
                  v164 = v135;
                  _os_log_impl(&dword_2295E9000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found boot-arg \"%s\" = \"%s\"", (uint8_t *)&v157, 0x26u);
                }
                v142 |= 2u;
                v143 = atoi(v135);
              }
            }
            v44 = strtok_r(0, " ", &__lasts);
          }
          while (v44);
        }
      }
    }
  }
  else
  {
    v22 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
      v23(3, "%s:%i Invalid boot-arg length: %zu", "NFRestoreParseBootArgs", 208, *(size_t *)v152);
    dispatch_get_specific(*v22);
    v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v157 = 136446722;
      v158 = "NFRestoreParseBootArgs";
      v159 = 1024;
      v160 = 208;
      v161 = 2048;
      v162 = *(const char **)v152;
      v19 = "%{public}s:%i Invalid boot-arg length: %zu";
      v20 = v24;
      v21 = 28;
      goto LABEL_20;
    }
  }
  bzero(&v165, 0x400uLL);
  Value = (const __CFData *)CFDictionaryGetValue(v9, CFSTR("FirmwareBundleData"));
  v133 = v4;
  if (!Value)
  {
    v29 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("FirmwareBundlePath"));
    if (v29)
    {
      v30 = v29;
      if (!CFStringGetCStringPtr(v29, 0x8000100u))
        CFStringGetCString(v30, (char *)&v165, 1024, 0x8000100u);
      v31 = NFDataCreateWithFile();
      v32 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v33 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], *(const UInt8 **)v31, *(_QWORD *)(v31 + 8), (CFAllocatorRef)*MEMORY[0x24BDBD258]);
      cf = CFPropertyListCreateWithData(v32, v33, 0, 0, 0);
      CFRelease(v33);
      NFDataRelease();
      if (cf)
        goto LABEL_73;
      v34 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v35)
        v35(3, "%s:%i Failed to parse bundle data", "NFRestoreParseParams", 363);
      dispatch_get_specific(*v34);
      v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v157 = 136446466;
        v158 = "NFRestoreParseParams";
        v159 = 1024;
        v160 = 363;
        _os_log_impl(&dword_2295E9000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to parse bundle data", (uint8_t *)&v157, 0x12u);
      }
      v37 = 364;
    }
    else
    {
      v42 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("RootFilePath"));
      if (!v42)
        goto LABEL_73;
      v43 = v42;
      bzero(&v157, 0x400uLL);
      if (CFStringGetCStringPtr(v43, 0x8000100u))
        __strlcpy_chk();
      else
        CFStringGetCString(v43, (char *)&v157, 1024, 0x8000100u);
      if (!NfRestoreBundleScan((char *)&v157, (CFMutableDictionaryRef *)&cf))
        goto LABEL_73;
      v51 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v52)
        v52(3, "%s:%i Failed to scan %s", "NFRestoreParseParams", 375, (const char *)&v157);
      dispatch_get_specific(*v51);
      v53 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v152 = 136446722;
        *(_QWORD *)&v152[4] = "NFRestoreParseParams";
        v153 = 1024;
        v154 = 375;
        v155 = 2080;
        v156 = &v157;
        _os_log_impl(&dword_2295E9000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to scan %s", v152, 0x1Cu);
      }
      v37 = 376;
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NFRestoreParseParams", v37);
LABEL_68:
    v54 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v55)
      v55(3, "%s:%i Failed to parse params", "NfRestoreReturnError", 1513);
    dispatch_get_specific(*v54);
    v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v165 = 136446466;
      v166 = "NfRestoreReturnError";
      v167 = 1024;
      v168 = 1513;
      _os_log_impl(&dword_2295E9000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to parse params", (uint8_t *)&v165, 0x12u);
    }
    v13 = 6;
    goto LABEL_203;
  }
  cf = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], Value, 0, 0, 0);
  if (!cf)
  {
    v26 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27)
      v27(3, "%s:%i Failed to parse bundle data", "NFRestoreParseParams", 348);
    dispatch_get_specific(*v26);
    v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v157 = 136446466;
      v158 = "NFRestoreParseParams";
      v159 = 1024;
      v160 = 348;
      _os_log_impl(&dword_2295E9000, v28, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to parse bundle data", (uint8_t *)&v157, 0x12u);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NFRestoreParseParams", 349);
    goto LABEL_68;
  }
LABEL_73:
  v57 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("DevicePath"));
  if (v57)
    CFStringGetCString(v57, (char *)buf, 1024, 0x600u);
  v58 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("InvokedFromCommandLine"));
  if (v58)
    v59 = CFBooleanGetValue(v58) != 0;
  else
    v59 = 0;
  v142 = v142 & 0xFE | v59;
  v60 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("NfcUpdateFile"));
  if (v60)
    CFStringGetCString(v60, v144, 1024, 0x600u);
  else
    v144[0] = 0;
  v61 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("NfcRFSettingsFile"));
  if (v61)
    CFStringGetCString(v61, v145, 1024, 0x600u);
  else
    v145[0] = 0;
  v62 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("FactoryInstall"));
  if (v62)
    v63 = CFBooleanGetValue(v62) != 0;
  else
    v63 = 0;
  v146 = v146 & 0xFE | v63;
  v64 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("kNfUpdateParamIntegrity"));
  if (v64)
    v65 = 16 * (CFBooleanGetValue(v64) != 0);
  else
    v65 = 0;
  v148 = v148 & 0xEF | v65;
  v66 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("kNfUpdateParamQueryFDRKey"));
  if (v66)
    v67 = 2 * (CFBooleanGetValue(v66) != 0);
  else
    v67 = 0;
  v146 = v146 & 0xFD | v67;
  v68 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("kNfUpdateAntennaSelfTest"));
  if (v68)
    v69 = 4 * (CFBooleanGetValue(v68) != 0);
  else
    v69 = 0;
  v146 = v146 & 0xFB | v69;
  v70 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("RestoreSystemPartition"));
  if (v70)
    CFStringGetCString(v70, v151, 1024, 0x600u);
  else
    v151[0] = 0;
  v71 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("NfcMaxFwDlRetries"));
  if (v71)
    CFNumberGetValue(v71, kCFNumberSInt8Type, v147);
  else
    v147[0] = 10;
  v72 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("NfcForceFwDl"));
  if (v72)
    v73 = CFBooleanGetValue(v72) != 0;
  else
    v73 = 0;
  v147[1] = v73;
  v74 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("JcopPostflightScript"));
  if (v74)
    CFStringGetCString(v74, v149, 1024, 0x600u);
  else
    v149[0] = 0;
  v75 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("JcopTerminateApplets"));
  if (v75)
    v76 = CFBooleanGetValue(v75) != 0;
  else
    v76 = 0;
  v150 = v150 & 0xFE | v76;
  v77 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("JcopForceJCOPPostflightScript"));
  if (v77)
    v78 = 2 * (CFBooleanGetValue(v77) != 0);
  else
    v78 = 0;
  v150 = v150 & 0xFD | v78;
  v79 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("StockholmOnly"));
  if (v79)
    v80 = 2 * (CFBooleanGetValue(v79) != 0);
  else
    v80 = 0;
  v148 = v148 & 0xFD | v80;
  v81 = (const __CFBoolean *)CFDictionaryGetValue(v9, CFSTR("HammerfestOnly"));
  if (v81)
    v82 = 4 * (CFBooleanGetValue(v81) != 0);
  else
    v82 = 0;
  v148 = v148 & 0xFB | v82;
  IsSupported = (uint64_t)CFDictionaryGetValue(v9, CFSTR("CLIRestore"));
  if (IsSupported)
  {
    IsSupported = CFBooleanGetValue((CFBooleanRef)IsSupported);
    v84 = 8 * ((_DWORD)IsSupported != 0);
  }
  else
  {
    v84 = 0;
  }
  v85 = v148;
  v148 = v148 & 0xF7 | v84;
  if ((v85 & 2) != 0
    || (IsSupported = NFHardwareInterfaceIsSupported("com.apple.spmi.nfc.hammerfest"), !(_DWORD)IsSupported))
  {
    v86 = 0;
  }
  else
  {
    IsSupported = NFHardwareSkipSpmiReconfig("hammerfest-spmi");
    if ((IsSupported & 1) == 0)
    {
      IsSupported = _NFRestoreShutdownNFCC(2);
      if ((IsSupported & 1) == 0)
      {
        v115 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v116 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v116)
          v116(3, "%s:%i Failed to shut down Hammerfest", "NfRestoreReturnError", 1527);
        dispatch_get_specific(*v115);
        v117 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          v165 = 136446466;
          v166 = "NfRestoreReturnError";
          v167 = 1024;
          v168 = 1527;
          _os_log_impl(&dword_2295E9000, v117, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to shut down Hammerfest", (uint8_t *)&v165, 0x12u);
        }
        v118 = 1528;
        goto LABEL_232;
      }
    }
    v86 = 1;
  }
  if ((v148 & 4) != 0)
  {
    v87 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v88 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v88)
      v88(6, "%s:%i Skipping Stockholm restore", "NfRestoreReturnError", 1538);
    dispatch_get_specific(*v87);
    v89 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      v165 = 136446466;
      v166 = "NfRestoreReturnError";
      v167 = 1024;
      v168 = 1538;
      _os_log_impl(&dword_2295E9000, v89, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Skipping Stockholm restore", (uint8_t *)&v165, 0x12u);
    }
  }
  else
  {
    if ((v146 & 2) != 0)
    {
      v90 = (char *)NfRestoreCopyUniqueFDRKey(IsSupported, v4);
      v91 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v92 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v90)
      {
        if (v92)
          v92(6, "%s:%i FDR Key : %s", "NfRestoreReturnError", 1546, v90);
        dispatch_get_specific(*v91);
        v93 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v165 = 136446722;
          v166 = "NfRestoreReturnError";
          v167 = 1024;
          v168 = 1546;
          v169 = 2080;
          *(_QWORD *)v170 = v90;
          _os_log_impl(&dword_2295E9000, v93, OS_LOG_TYPE_DEFAULT, "%{public}s:%i FDR Key : %s", (uint8_t *)&v165, 0x1Cu);
        }
        if ((NFIsRestoreOS() & 1) == 0)
          fprintf((FILE *)*MEMORY[0x24BDAC8E8], "FDR Key : %s\n", v90);
        free(v90);
      }
      else
      {
        if (v92)
          v92(3, "%s:%i No FDR Key !", "NfRestoreReturnError", 1552);
        dispatch_get_specific(*v91);
        v94 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          v165 = 136446466;
          v166 = "NfRestoreReturnError";
          v167 = 1024;
          v168 = 1552;
          _os_log_impl(&dword_2295E9000, v94, OS_LOG_TYPE_ERROR, "%{public}s:%i No FDR Key !", (uint8_t *)&v165, 0x12u);
        }
        if ((NFIsRestoreOS() & 1) == 0)
          fwrite("No FDR Key !\n", 0xDuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8E8]);
      }
    }
    else if ((v148 & 0x10) != 0)
    {
      NfRestoreRunIntegrityCheck(v4);
    }
    v95 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v96 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v96)
      v96(6, "%s:%i **************** Restoring Stockholm ****************", "NfRestoreReturnError", 1568);
    dispatch_get_specific(*v95);
    v97 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      v165 = 136446466;
      v166 = "NfRestoreReturnError";
      v167 = 1024;
      v168 = 1568;
      _os_log_impl(&dword_2295E9000, v97, OS_LOG_TYPE_DEFAULT, "%{public}s:%i **************** Restoring Stockholm ****************", (uint8_t *)&v165, 0x12u);
    }
    if ((v142 & 2) != 0)
    {
      v102 = 1;
      while (1)
      {
        dispatch_get_specific(*v95);
        v103 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v103)
          v103(6, "%s:%i Iteration %d of %d", "NfRestoreReturnError", 1573, v102, v143);
        dispatch_get_specific(*v95);
        v104 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          v165 = 136446978;
          v166 = "NfRestoreReturnError";
          v167 = 1024;
          v168 = 1573;
          v169 = 1024;
          *(_DWORD *)v170 = v102;
          *(_WORD *)&v170[4] = 1024;
          *(_DWORD *)&v170[6] = v143;
          _os_log_impl(&dword_2295E9000, v104, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Iteration %d of %d", (uint8_t *)&v165, 0x1Eu);
        }
        v105 = _NFRestore((uint64_t)buf, cf);
        if ((_DWORD)v105)
          break;
        ++v102;
        if (v143 && v102 > v143)
          goto LABEL_169;
      }
      v13 = v105;
      dispatch_get_specific(*v95);
      v114 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v114)
        v114(3, "%s:%i Failed at iteration %d", "NfRestoreReturnError", 1575, v102);
      dispatch_get_specific(*v95);
      v100 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        goto LABEL_203;
      v165 = 136446722;
      v166 = "NfRestoreReturnError";
      v167 = 1024;
      v168 = 1575;
      v169 = 1024;
      *(_DWORD *)v170 = v102;
      v101 = "%{public}s:%i Failed at iteration %d";
      goto LABEL_184;
    }
    v98 = _NFRestore((uint64_t)buf, cf);
    if ((_DWORD)v98)
    {
      v13 = v98;
      dispatch_get_specific(*v95);
      v99 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v99)
        v99(3, "%s:%i Failed %d", "NfRestoreReturnError", 1583, v13);
      dispatch_get_specific(*v95);
      v100 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        goto LABEL_203;
      v165 = 136446722;
      v166 = "NfRestoreReturnError";
      v167 = 1024;
      v168 = 1583;
      v169 = 1024;
      *(_DWORD *)v170 = v13;
      v101 = "%{public}s:%i Failed %d";
      goto LABEL_184;
    }
  }
LABEL_169:
  if ((v148 & 2) != 0)
  {
    v111 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v112 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v112)
      v112(6, "%s:%i Skipping Hammerfest restore.", "NfRestoreReturnError", 1591);
    dispatch_get_specific(*v111);
    v113 = NFSharedLogGetLogger();
    v13 = 0;
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      goto LABEL_203;
    v165 = 136446466;
    v166 = "NfRestoreReturnError";
    v167 = 1024;
    v168 = 1591;
LABEL_201:
    _os_log_impl(&dword_2295E9000, v113, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Skipping Hammerfest restore.", (uint8_t *)&v165, 0x12u);
    goto LABEL_202;
  }
  if (!v86)
  {
LABEL_202:
    v13 = 0;
    goto LABEL_203;
  }
  v106 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("AuxiliaryDevicePath"));
  if (v106)
    CFStringGetCString(v106, v141, 1024, 0x600u);
  v148 |= 1u;
  v107 = (const __CFDictionary *)CFDictionaryGetValue(v9, CFSTR("StockholmOptions"));
  if (v107)
  {
    v108 = v107;
    v109 = (const __CFBoolean *)CFDictionaryGetValue(v107, CFSTR("RestoreHammerfest"));
    if (v109)
      v110 = CFBooleanGetValue(v109) != 0;
    else
      v110 = 0;
    v148 = v148 & 0xFE | v110;
    v119 = (const __CFString *)CFDictionaryGetValue(v108, CFSTR("HammerfestFirmwareType"));
    if (v119 && CFStringCompare(v119, CFSTR("Manufacturing"), 1uLL) == kCFCompareEqualTo)
      v120 = v146 | 1;
    else
      v120 = v146 & 0xFE;
    v146 = v120;
  }
  v149[0] = 0;
  v150 &= 0xFCu;
  v121 = v148;
  v122 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v123 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if ((v121 & 1) == 0)
  {
    if (v123)
      v123(5, "%s:%i Skipping Hammerfest restore.", "NfRestoreReturnError", 1603);
    dispatch_get_specific(*v122);
    v113 = NFSharedLogGetLogger();
    v13 = 0;
    if (!os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      goto LABEL_203;
    v165 = 136446466;
    v166 = "NfRestoreReturnError";
    v167 = 1024;
    v168 = 1603;
    goto LABEL_201;
  }
  if (v123)
    v123(6, "%s:%i **************** Restoring Hammerfest ****************", "NfRestoreReturnError", 1607);
  dispatch_get_specific(*v122);
  v125 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
  {
    v165 = 136446466;
    v166 = "NfRestoreReturnError";
    v167 = 1024;
    v168 = 1607;
    _os_log_impl(&dword_2295E9000, v125, OS_LOG_TYPE_DEFAULT, "%{public}s:%i **************** Restoring Hammerfest ****************", (uint8_t *)&v165, 0x12u);
  }
  if (!NFHardwareSkipSpmiReconfig("hammerfest-spmi") && (_NFRestoreShutdownNFCC(1) & 1) == 0)
  {
    dispatch_get_specific(*v122);
    v130 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v130)
      v130(3, "%s:%i Failed to shut down Stockholm", "NfRestoreReturnError", 1610);
    dispatch_get_specific(*v122);
    v131 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      v165 = 136446466;
      v166 = "NfRestoreReturnError";
      v167 = 1024;
      v168 = 1610;
      _os_log_impl(&dword_2295E9000, v131, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to shut down Stockholm", (uint8_t *)&v165, 0x12u);
    }
    v118 = 1611;
LABEL_232:
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfRestoreReturnError", v118);
    v13 = 5;
    goto LABEL_203;
  }
  if ((v142 & 2) == 0)
  {
    v13 = _NFRestore((uint64_t)buf, cf);
    if ((_DWORD)v13)
      goto LABEL_203;
LABEL_225:
    if ((v148 & 8) != 0)
    {
      _NfRestoreResetFailForwardDefault("FailForwardNeeded");
      _NfRestoreResetFailForwardDefault("FailForwardInProgress");
      _NfRestoreResetFailForwardDefault("FailForwardDetectedTimestamp");
      _NfRestoreResetFailForwardDefault("FailForwardLastAttemptTimestamp");
    }
    goto LABEL_202;
  }
  v126 = 1;
  while (1)
  {
    dispatch_get_specific(*v122);
    v127 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v127)
      v127(6, "%s:%i Iteration %d of %d", "NfRestoreReturnError", 1620, v126, v143);
    dispatch_get_specific(*v122);
    v128 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
    {
      v165 = 136446978;
      v166 = "NfRestoreReturnError";
      v167 = 1024;
      v168 = 1620;
      v169 = 1024;
      *(_DWORD *)v170 = v126;
      *(_WORD *)&v170[4] = 1024;
      *(_DWORD *)&v170[6] = v143;
      _os_log_impl(&dword_2295E9000, v128, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Iteration %d of %d", (uint8_t *)&v165, 0x1Eu);
    }
    v129 = _NFRestore((uint64_t)buf, cf);
    if ((_DWORD)v129)
      break;
    ++v126;
    if (v143 && v126 > v143)
      goto LABEL_225;
  }
  v13 = v129;
  dispatch_get_specific(*v122);
  v132 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v132)
    v132(3, "%s:%i Failed at iteration %d", "NfRestoreReturnError", 1622, v126);
  dispatch_get_specific(*v122);
  v100 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    goto LABEL_203;
  v165 = 136446722;
  v166 = "NfRestoreReturnError";
  v167 = 1024;
  v168 = 1622;
  v169 = 1024;
  *(_DWORD *)v170 = v126;
  v101 = "%{public}s:%i Failed at iteration %d";
LABEL_184:
  _os_log_impl(&dword_2295E9000, v100, OS_LOG_TYPE_ERROR, v101, (uint8_t *)&v165, 0x18u);
LABEL_203:
  if (cf)
    CFRelease(cf);
  NfContextFree((void *)gNfContext);
  gNfContext = 0;
  if (v133)
    *v133 = (CFErrorRef)_gError;
  return v13;
}

uint64_t _NFRestoreShutdownNFCC(int a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  const char *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  NFRestoreGetDriverFlags();
  if (_gDriver)
  {
    v2 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      if (a1 == 2)
        v4 = "Hammerfest";
      else
        v4 = "Stockholm";
      Logger(3, "%s:%i %s driver already open - can't interrupt", "_NFRestoreShutdownNFCC", 1392, v4);
    }
    dispatch_get_specific(*v2);
    v5 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      return 0;
    if (a1 == 2)
      v6 = "Hammerfest";
    else
      v6 = "Stockholm";
    *(_DWORD *)buf = 136446722;
    v16 = "_NFRestoreShutdownNFCC";
    v17 = 1024;
    v18 = 1392;
    v19 = 2080;
    v20 = v6;
    v7 = "%{public}s:%i %s driver already open - can't interrupt";
    v8 = v5;
    v9 = 28;
    goto LABEL_12;
  }
  if (NFDriverOpen())
  {
    v10 = NFDriverNFCCPowerOff();
    NFDriverClose();
    return v10;
  }
  v12 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v13)
    v13(3, "%s:%i Failed to open driver", "_NFRestoreShutdownNFCC", 1398);
  dispatch_get_specific(*v12);
  v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "_NFRestoreShutdownNFCC";
    v17 = 1024;
    v18 = 1398;
    v7 = "%{public}s:%i Failed to open driver";
    v8 = v14;
    v9 = 18;
LABEL_12:
    _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
  }
  return 0;
}

uint64_t NfRestoreCopyUniqueFDRKey(uint64_t a1, CFErrorRef *a2)
{
  uint64_t v3;
  uint64_t UniqueFDRKey;
  BOOL v5;
  int v6;
  CFErrorRef v7;
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  CFErrorRef v11;
  _DWORD code[3];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  NFLogSetLogger();
  NFRestoreGetDriverFlags();
  v3 = _gDriver;
  if (_gDriver || (_gDriver = NFDriverOpen()) != 0)
  {
    code[0] = 0;
    UniqueFDRKey = NFDriverGetUniqueFDRKey();
    if (UniqueFDRKey)
      v5 = code[0] == 0;
    else
      v5 = 0;
    v6 = !v5;
    if (a2)
    {
      if (v6)
      {
        v7 = CFErrorCreate(0, CFSTR("com.apple.nfstack"), 0, 0);
        *a2 = v7;
        if (v7)
          CFAutorelease(v7);
      }
    }
    if (!v3)
    {
      NFDriverClose();
      _gDriver = 0;
    }
  }
  else
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to load driver", "NfRestoreCopyUniqueFDRKey", 1675);
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      code[0] = 136446466;
      *(_QWORD *)&code[1] = "NfRestoreCopyUniqueFDRKey";
      v14 = 1024;
      v15 = 1675;
      _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", (uint8_t *)code, 0x12u);
    }
    if (a2)
    {
      v11 = CFErrorCreate(0, CFSTR("com.apple.nfstack"), 9, 0);
      *a2 = v11;
      if (v11)
        CFAutorelease(v11);
    }
    return 0;
  }
  return UniqueFDRKey;
}

void NfRestoreRunIntegrityCheck(CFErrorRef *a1)
{
  uint64_t v2;
  _DWORD *v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  int v6;
  int v7;
  uint64_t *v8;
  unint64_t v9;
  const void **v10;
  void (*v11)(uint64_t, const char *, ...);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  NSObject *v20;
  const void **v21;
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  CFErrorRef v24;
  _DWORD *v25;
  uint64_t v26;
  uint8_t v27[4];
  uint8_t *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  uint8_t buf[32];
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  NFRestoreGetDriverFlags();
  _gDriver = NFDriverOpen();
  if (_gDriver)
  {
    NFDriverRunIntegrityDebug();
    if (NFIsInternalBuild())
    {
      v2 = NFDriverDebugDumpMemory();
      if (v2)
      {
        v3 = (_DWORD *)v2;
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(6, "%s:%i EEPROM User Area Start:0x%08X End:0x%08X", "NfRestoreRunIntegrityCheck", 301, *v3, v3[1]);
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v5 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *v3;
          v7 = v3[1];
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = "NfRestoreRunIntegrityCheck";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 301;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v6;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v7;
          _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i EEPROM User Area Start:0x%08X End:0x%08X", buf, 0x1Eu);
        }
        v8 = (uint64_t *)*((_QWORD *)v3 + 1);
        if (v8)
        {
          v36 = 0u;
          memset(buf, 0, sizeof(buf));
          v9 = v8[1];
          v26 = *v8;
          v10 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          dispatch_get_specific(*v10);
          v12 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_QWORD *)(*((_QWORD *)v3 + 1) + 8);
            *(_DWORD *)v27 = 136315906;
            v28 = (uint8_t *)"NfRestoreRunIntegrityCheck";
            v29 = 1024;
            v30 = 304;
            v31 = 2082;
            v32 = "EEPROM User Area: ";
            v33 = 2048;
            v34 = v13;
            _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", v27, 0x26u);
          }
          if (v11)
            v11(6, "%s:%i %s %lu bytes :", "NfRestoreRunIntegrityCheck", 304, "EEPROM User Area: ", *(_QWORD *)(*((_QWORD *)v3 + 1) + 8));
          v25 = v3;
          if (v9)
          {
            v14 = 0;
            do
            {
              v15 = 0;
              v16 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v14)];
              do
              {
                v17 = v15 + 1;
                v18 = v15 + 1 + v14;
                v19 = sprintf(v16, "0x%02X ", *(unsigned __int8 *)(v26 + v14 + v15));
                if (v15 > 6)
                  break;
                v16 += v19;
                ++v15;
              }
              while (v18 < v9);
              dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
              v20 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v27 = 136446210;
                v28 = buf;
                _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", v27, 0xCu);
              }
              if (v11)
                v11(6, "%s", (const char *)buf);
              v14 += v17;
            }
            while (v18 < v9);
          }
          v3 = v25;
          NFDataRelease();
        }
        free(v3);
      }
    }
    NFDriverClose();
    _gDriver = 0;
  }
  else
  {
    v21 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22)
      v22(3, "%s:%i Failed to load driver", "NfRestoreRunIntegrityCheck", 288);
    dispatch_get_specific(*v21);
    v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "NfRestoreRunIntegrityCheck";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 288;
      _os_log_impl(&dword_2295E9000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load driver", buf, 0x12u);
    }
    if (a1)
    {
      v24 = CFErrorCreate(0, CFSTR("com.apple.nfstack"), 9, 0);
      *a1 = v24;
      if (v24)
        CFAutorelease(v24);
    }
  }
}

void _NfRestoreResetFailForwardDefault(char *cStr)
{
  const __CFString *v1;

  v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  CFPreferencesSetAppValue(v1, 0, CFSTR("com.apple.nfcacd"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.nfcacd"));
  CFRelease(CFSTR("com.apple.nfcacd"));
  CFRelease(v1);
}

uint64_t NfRestore()
{
  return NfRestoreReturnError();
}

uint64_t _NFRestoreNfcFirmwareStep(uint64_t a1, uint64_t a2, const void *a3)
{
  _BYTE *v4;
  const char *v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  int IsDevBoard;
  const void **v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  void (*v21)(uint64_t, const char *, ...);
  NSObject *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  CFStringRef v26;
  CFTypeID v27;
  const __CFDictionary *Value;
  const void **v29;
  void (*v30)(uint64_t, const char *, ...);
  NSObject *v31;
  NSObject *v32;
  const void **v33;
  void (*v34)(uint64_t, const char *, ...);
  NSObject *v35;
  const void **v36;
  void (*v37)(uint64_t, const char *, ...);
  NSObject *v38;
  uint8_t v39[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  uint8_t buf[40];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = (_BYTE *)(a2 + 4104);
  if (*(_BYTE *)(a2 + 2056))
  {
    v5 = (const char *)(a2 + 2056);
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i %s", "_NFRestoreNfcFirmwareStep", 903, v5);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_NFRestoreNfcFirmwareStep";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 903;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v5;
      _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
    }
    if (NFDataCreateWithFile())
    {
      if (NFDriverUpdateFirmware())
      {
        dispatch_get_specific(*v6);
        v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v9)
          v9(3, "%s:%i Failed to install FW", "_NFRestoreNfcFirmwareStep", 914);
        dispatch_get_specific(*v6);
        v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "_NFRestoreNfcFirmwareStep";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 914;
          _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to install FW", buf, 0x12u);
        }
        v11 = *MEMORY[0x24BED8B88];
        NFDriverGetStackBreadcrumb();
        NFDriverSerialDebugLastMessage();
LABEL_13:
        _NFRestorePushError("com.apple.nfstack", v11, "Error 0x%04x at %s:%d: %llx %s");
        return 5;
      }
      return 0;
    }
    dispatch_get_specific(*v6);
    v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14)
      v14(3, "%s:%i Failed to read file: %s", "_NFRestoreNfcFirmwareStep", 907, v5);
    dispatch_get_specific(*v6);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_NFRestoreNfcFirmwareStep";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 907;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v5;
      _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read file: %s", buf, 0x1Cu);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "_NFRestoreNfcFirmwareStep", 908);
    return 7;
  }
  else
  {
    if (!a3)
      return 0;
    memset(buf, 0, 28);
    if ((NFDriverGetControllerInfo() & 1) != 0)
    {
      if ((*v4 & 1) != 0)
        v23 = "fw-mfg";
      else
        v23 = "fw";
      v24 = "fury-fw-mfg";
      if ((*v4 & 1) == 0)
        v24 = "fury-fw";
      if ((v4[3] & 1) != 0)
        v25 = v24;
      else
        v25 = v23;
      v26 = CFStringCreateWithCString(0, v25, 0x8000100u);
      v27 = CFGetTypeID(a3);
      if (v27 != CFDictionaryGetTypeID())
      {
        v33 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v34)
          v34(3, "%s:%i Incorrect bundle", "_NFRestoreNfcFirmwareStep", 958);
        dispatch_get_specific(*v33);
        v35 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v39 = 136446466;
          v40 = "_NFRestoreNfcFirmwareStep";
          v41 = 1024;
          v42 = 958;
          _os_log_impl(&dword_2295E9000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%i Incorrect bundle", v39, 0x12u);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "_NFRestoreNfcFirmwareStep", 959);
        CFRelease(v26);
        return 5;
      }
      Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a3, v26);
      CFRelease(v26);
      if (!Value)
      {
        v36 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v37)
          v37(3, "%s:%i Bundle is missing folder: %s", "_NFRestoreNfcFirmwareStep", 968, v25);
        dispatch_get_specific(*v36);
        v38 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v39 = 136446722;
          v40 = "_NFRestoreNfcFirmwareStep";
          v41 = 1024;
          v42 = 968;
          v43 = 2080;
          v44 = v25;
          _os_log_impl(&dword_2295E9000, v38, OS_LOG_TYPE_ERROR, "%{public}s:%i Bundle is missing folder: %s", v39, 0x1Cu);
        }
        _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d");
        return 5;
      }
      v12 = NFRestoreNfcForController(a1, buf, v4[3] & 1, *v4 & 1, Value);
      if ((_DWORD)v12)
      {
        v29 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v30)
          v30(3, "%s:%i Failed to update FW: %s", "_NFRestoreNfcFirmwareStep", 983, v25);
        dispatch_get_specific(*v29);
        v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v39 = 136446722;
          v40 = "_NFRestoreNfcFirmwareStep";
          v41 = 1024;
          v42 = 983;
          v43 = 2080;
          v44 = v25;
          _os_log_impl(&dword_2295E9000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to update FW: %s", v39, 0x1Cu);
        }
      }
    }
    else
    {
      IsDevBoard = NFProductIsDevBoard();
      v18 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (!IsDevBoard)
      {
        if (v19)
          v19(3, "%s:%i Failed to get driver info", "_NFRestoreNfcFirmwareStep", 938);
        dispatch_get_specific(*v18);
        v32 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v39 = 136446466;
          v40 = "_NFRestoreNfcFirmwareStep";
          v41 = 1024;
          v42 = 938;
          _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get driver info", v39, 0x12u);
        }
        v11 = *MEMORY[0x24BED8B88];
        NFDriverGetStackBreadcrumb();
        NFDriverSerialDebugLastMessage();
        goto LABEL_13;
      }
      if (v19)
        v19(4, "%s:%i Failed to get driver info", "_NFRestoreNfcFirmwareStep", 933);
      dispatch_get_specific(*v18);
      v20 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v39 = 136446466;
        v40 = "_NFRestoreNfcFirmwareStep";
        v41 = 1024;
        v42 = 933;
        _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get driver info", v39, 0x12u);
      }
      dispatch_get_specific(*v18);
      v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21)
        v21(4, "%s:%i Assuming HW not present", "_NFRestoreNfcFirmwareStep", 934);
      dispatch_get_specific(*v18);
      v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v39 = 136446466;
        v40 = "_NFRestoreNfcFirmwareStep";
        v41 = 1024;
        v42 = 934;
        _os_log_impl(&dword_2295E9000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Assuming HW not present", v39, 0x12u);
      }
      return 1;
    }
  }
  return v12;
}

void _NFRestoreDebugNFCCError()
{
  uint64_t v0;
  _DWORD *v1;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v3;
  int v4;
  int v5;
  uint64_t *v6;
  unint64_t v7;
  const void **v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  NSObject *v18;
  _DWORD *v19;
  uint64_t v20;
  uint8_t v21[4];
  uint8_t *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint8_t buf[32];
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  NFDriverRunIntegrityDebug();
  if (NFIsInternalBuild())
  {
    v0 = NFDriverDebugDumpMemory();
    if (v0)
    {
      v1 = (_DWORD *)v0;
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(6, "%s:%i EEPROM User Area Start:0x%08X End:0x%08X", "_NFRestoreDebugNFCCError", 322, *v1, v1[1]);
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v3 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *v1;
        v5 = v1[1];
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = "_NFRestoreDebugNFCCError";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 322;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v5;
        _os_log_impl(&dword_2295E9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%i EEPROM User Area Start:0x%08X End:0x%08X", buf, 0x1Eu);
      }
      v6 = (uint64_t *)*((_QWORD *)v1 + 1);
      if (v6)
      {
        v30 = 0u;
        memset(buf, 0, sizeof(buf));
        v7 = v6[1];
        v20 = *v6;
        v8 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        dispatch_get_specific(*v8);
        v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(*((_QWORD *)v1 + 1) + 8);
          *(_DWORD *)v21 = 136315906;
          v22 = (uint8_t *)"_NFRestoreDebugNFCCError";
          v23 = 1024;
          v24 = 324;
          v25 = 2082;
          v26 = "EEPROM User Area: ";
          v27 = 2048;
          v28 = v11;
          _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", v21, 0x26u);
        }
        if (v9)
          v9(6, "%s:%i %s %lu bytes :", "_NFRestoreDebugNFCCError", 324, "EEPROM User Area: ", *(_QWORD *)(*((_QWORD *)v1 + 1) + 8));
        v19 = v1;
        if (v7)
        {
          v12 = 0;
          do
          {
            v13 = 0;
            v14 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v12)];
            do
            {
              v15 = v13 + 1;
              v16 = v13 + 1 + v12;
              v17 = sprintf(v14, "0x%02X ", *(unsigned __int8 *)(v20 + v12 + v13));
              if (v13 > 6)
                break;
              v14 += v17;
              ++v13;
            }
            while (v16 < v7);
            dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
            v18 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v21 = 136446210;
              v22 = buf;
              _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", v21, 0xCu);
            }
            if (v9)
              v9(6, "%s", (const char *)buf);
            v12 += v15;
          }
          while (v16 < v7);
        }
        v1 = v19;
        NFDataRelease();
      }
      free(v1);
    }
  }
}

uint64_t NFRestoreNfcForController(uint64_t a1, _DWORD *a2, int a3, int a4, const __CFDictionary *a5)
{
  const void **v9;
  void (*v10)(uint64_t, const char *, ...);
  NSObject *v11;
  int v12;
  int v13;
  const char *v14;
  const char *v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  int v19;
  int v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const void **v24;
  void (*v25)(uint64_t, const char *, ...);
  NSObject *v26;
  int v27;
  int v28;
  const void **v29;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v31;
  int v32;
  int v33;
  const void **v34;
  void (*v35)(uint64_t, const char *, ...);
  NSObject *v36;
  int v37;
  int v38;
  const char *v39;
  const void **v40;
  void (*v41)(uint64_t, const char *, ...);
  NSObject *v42;
  int v43;
  int v44;
  const void **v45;
  void (*v46)(uint64_t, const char *, ...);
  NSObject *v47;
  const __CFString *v48;
  void (*v49)(uint64_t, const char *, ...);
  NSObject *v50;
  unsigned int v51;
  uint64_t StackBreadcrumb;
  const char *Message;
  uint64_t v54;
  void (*v55)(uint64_t, const char *, ...);
  NSObject *v56;
  const void **v58;
  void (*v59)(uint64_t, const char *, ...);
  NSObject *v60;
  int v61;
  int v62;
  void (*v63)(uint64_t, const char *, ...);
  int v64;
  int v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  _DWORD v71[7];

  *(_QWORD *)&v71[5] = *MEMORY[0x24BDAC8D0];
  switch(a2[1])
  {
    case 5:
      v29 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 630, *a2, a2[2]);
      dispatch_get_specific(*v29);
      v31 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *a2;
        v33 = a2[2];
        *(_DWORD *)buf = 136446978;
        v67 = "NFRestoreNfcFirmwareNameForController";
        v68 = 1024;
        v69 = 630;
        v70 = 1024;
        v71[0] = v32;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v33;
        _os_log_impl(&dword_2295E9000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      if (a2[2] == 2)
      {
        v14 = "PN552_FW_02_01_6A_rev125914.bin";
        v15 = "PN552_FW_02_01_AF_59162.bin";
        goto LABEL_38;
      }
      dispatch_get_specific(*v29);
      v63 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v63)
        v63(3, "%s:%i Unexpected ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 645, *a2, a2[2]);
      dispatch_get_specific(*v29);
      v36 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        goto LABEL_74;
      v64 = *a2;
      v65 = a2[2];
      *(_DWORD *)buf = 136446978;
      v67 = "NFRestoreNfcFirmwareNameForController";
      v68 = 1024;
      v69 = 645;
      v70 = 1024;
      v71[0] = v64;
      LOWORD(v71[1]) = 1024;
      *(_DWORD *)((char *)&v71[1] + 2) = v65;
      v39 = "%{public}s:%i Unexpected ROM version %02x.%02x";
      goto LABEL_73;
    case 7:
    case 8:
      v24 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25)
        v25(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 654, *a2, a2[2]);
      dispatch_get_specific(*v24);
      v26 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *a2;
        v28 = a2[2];
        *(_DWORD *)buf = 136446978;
        v67 = "NFRestoreNfcFirmwareNameForController";
        v68 = 1024;
        v69 = 654;
        v70 = 1024;
        v71[0] = v27;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v28;
        _os_log_impl(&dword_2295E9000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      v14 = "SN100V_FW_A3_01_01_A8_rev151108.bin";
      v15 = "SN100V_FW_A3_01_01_C3_rev78599.bin";
      goto LABEL_38;
    case 0xA:
    case 0xB:
    case 0xC:
      v16 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v17)
        v17(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 669, *a2, a2[2]);
      dispatch_get_specific(*v16);
      v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *a2;
        v20 = a2[2];
        *(_DWORD *)buf = 136446978;
        v67 = "NFRestoreNfcFirmwareNameForController";
        v68 = 1024;
        v69 = 669;
        v70 = 1024;
        v71[0] = v19;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v20;
        _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      v21 = "SN200V_FW_B1_02_01_A9_rev151266.bin";
      if (a4)
        v21 = "SN200V_FW_B1_02_01_FA_rev124452.bin";
      v22 = "SN200V_FURY_FW_B1_02_01_FA_rev149466.bin";
      if (!a4)
        v22 = "SN200V_FURY_FW_B1_02_01_A2_rev150255.bin";
      if (a3)
        v23 = v22;
      else
        v23 = v21;
      goto LABEL_41;
    case 0xE:
    case 0xF:
    case 0x10:
    case 0x11:
      v9 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v10)
        v10(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 697, *a2, a2[2]);
      dispatch_get_specific(*v9);
      v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *a2;
        v13 = a2[2];
        *(_DWORD *)buf = 136446978;
        v67 = "NFRestoreNfcFirmwareNameForController";
        v68 = 1024;
        v69 = 697;
        v70 = 1024;
        v71[0] = v12;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v13;
        _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      v14 = "SN300V_FW_B0_02_01_55_rev151948.bin";
      v15 = "SN300V_FW_B0_02_01_EE_rev152118.bin";
      goto LABEL_38;
    case 0x12:
      v40 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v41)
        v41(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 710, *a2, a2[2]);
      dispatch_get_specific(*v40);
      v42 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = *a2;
        v44 = a2[2];
        *(_DWORD *)buf = 136446978;
        v67 = "NFRestoreNfcFirmwareNameForController";
        v68 = 1024;
        v69 = 710;
        v70 = 1024;
        v71[0] = v43;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v44;
        _os_log_impl(&dword_2295E9000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      v14 = "SE310S_FW_A0_01_01_20_rev151695.bin";
      v15 = "SE310S_FW_A0_01_01_BE_rev150106.bin";
LABEL_38:
      if (a4)
        v23 = v15;
      else
        v23 = v14;
      goto LABEL_41;
    case 0x14:
      v58 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v59 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v59)
        v59(6, "%s:%i ROM version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 721, *a2, a2[2]);
      dispatch_get_specific(*v58);
      v60 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = *a2;
        v62 = a2[2];
        *(_DWORD *)buf = 136446978;
        v67 = "NFRestoreNfcFirmwareNameForController";
        v68 = 1024;
        v69 = 721;
        v70 = 1024;
        v71[0] = v61;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v62;
        _os_log_impl(&dword_2295E9000, v60, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ROM version %02x.%02x", buf, 0x1Eu);
      }
      if (a4)
        v23 = "SN200V_FURY_FW_B1_02_01_FA_rev149466.bin";
      else
        v23 = "SN200V_FURY_FW_B1_02_01_A2_rev150255.bin";
      if ((a3 & 1) == 0)
        goto LABEL_74;
LABEL_41:
      v45 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v46 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v46)
        v46(6, "%s:%i Selected file %s", "NFRestoreNfcForController", 831, v23);
      dispatch_get_specific(*v45);
      v47 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v67 = "NFRestoreNfcForController";
        v68 = 1024;
        v69 = 831;
        v70 = 2080;
        *(_QWORD *)v71 = v23;
        _os_log_impl(&dword_2295E9000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Selected file %s", buf, 0x1Cu);
      }
      v48 = CFStringCreateWithCString(0, v23, 0x8000100u);
      if (NFRestoreDictionaryCopyDataForKey(a5, v48))
      {
        if (NFDriverUpdateFirmware())
        {
          dispatch_get_specific(*v45);
          v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v49)
            v49(3, "%s:%i Failed to install %s", "NFRestoreNfcForController", 842, v23);
          dispatch_get_specific(*v45);
          v50 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v67 = "NFRestoreNfcForController";
            v68 = 1024;
            v69 = 842;
            v70 = 2080;
            *(_QWORD *)v71 = v23;
            _os_log_impl(&dword_2295E9000, v50, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to install %s", buf, 0x1Cu);
          }
          v51 = *MEMORY[0x24BED8B88];
          StackBreadcrumb = NFDriverGetStackBreadcrumb();
          Message = (const char *)NFDriverSerialDebugLastMessage();
          _NFRestorePushError("com.apple.nfstack", v51, "Error 0x%04x at %s:%d: %llx %s", v51, "NFRestoreNfcForController", 843, StackBreadcrumb, Message);
          v54 = 5;
        }
        else
        {
          v54 = 0;
        }
      }
      else
      {
        dispatch_get_specific(*v45);
        v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v55)
          v55(3, "%s:%i No data found for %s", "NFRestoreNfcForController", 836, v23);
        dispatch_get_specific(*v45);
        v56 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v67 = "NFRestoreNfcForController";
          v68 = 1024;
          v69 = 836;
          v70 = 2080;
          *(_QWORD *)v71 = v23;
          _os_log_impl(&dword_2295E9000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i No data found for %s", buf, 0x1Cu);
        }
        v54 = 7;
      }
      NFDataRelease();
      CFRelease(v48);
      break;
    default:
      v34 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v35)
        v35(3, "%s:%i Unexpected Si version %02x.%02x", "NFRestoreNfcFirmwareNameForController", 735, *a2, a2[2]);
      dispatch_get_specific(*v34);
      v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = *a2;
        v38 = a2[2];
        *(_DWORD *)buf = 136446978;
        v67 = "NFRestoreNfcFirmwareNameForController";
        v68 = 1024;
        v69 = 735;
        v70 = 1024;
        v71[0] = v37;
        LOWORD(v71[1]) = 1024;
        *(_DWORD *)((char *)&v71[1] + 2) = v38;
        v39 = "%{public}s:%i Unexpected Si version %02x.%02x";
LABEL_73:
        _os_log_impl(&dword_2295E9000, v36, OS_LOG_TYPE_ERROR, v39, buf, 0x1Eu);
      }
LABEL_74:
      v54 = 7;
      break;
  }
  return v54;
}

void _AddEntriesIntoDictionary(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionaryAddValue(theDict, key, value);
}

uint64_t NfSecureElementScriptRunLine(uint64_t a1, char *a2)
{
  char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  FILE **v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  const void **v12;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  const void **v19;
  void (*v20)(uint64_t, const char *, ...);
  NSObject *v21;
  const void **v22;
  void (*v23)(uint64_t, const char *, ...);
  NSObject *v24;
  unsigned int v25;
  uint64_t StackBreadcrumb;
  const char *Message;
  size_t v28;
  size_t v29;
  const void **v30;
  void (*v31)(uint64_t, const char *, ...);
  NSObject *v32;
  void (*v33)(uint64_t, const char *, ...);
  NSObject *v34;
  void (*v35)(uint64_t, const char *, ...);
  NSObject *v36;
  unsigned int ResponseStatus;
  unsigned int v38;
  const void **v39;
  void (*v40)(uint64_t, const char *, ...);
  NSObject *v41;
  void (*v42)(uint64_t, const char *, ...);
  NSObject *v43;
  char *__s;
  char *__lasts;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  char *v52;
  char __str[2048];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  bzero(__str, 0x800uLL);
  __s = 0;
  __lasts = 0;
  v3 = a2;
  v4 = MEMORY[0x24BDAC740];
  do
  {
    while (1)
    {
      v6 = *v3++;
      v5 = v6;
      if ((v6 & 0x80000000) != 0)
        break;
      if ((*(_DWORD *)(v4 + 4 * v5 + 60) & 0x4000) == 0)
        goto LABEL_6;
    }
  }
  while (__maskrune(v5, 0x4000uLL));
LABEL_6:
  if (!v5)
    return 0;
  __strlcpy_chk();
  strtok_r(__str, " ", &__lasts);
  if (__lasts)
  {
    if (strlen(__lasts) < 5)
    {
      __s = __lasts;
      goto LABEL_13;
    }
    if (*__lasts == 42)
    {
      __s = __lasts + 1;
LABEL_13:
      __lasts = 0;
      goto LABEL_15;
    }
    strtok_r(__lasts, "*", &__s);
  }
LABEL_15:
  v8 = (FILE **)MEMORY[0x24BDAC8E8];
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "> %s\n", __str);
  if (NFDataCreateWithHexString())
  {
    v9 = NFDriverSecureElementTransceive();
    NFDataRelease();
    if (v9)
    {
      v10 = (char *)NFDataAsHexString();
      fprintf(*v8, "%s\n", v10);
      if (__lasts)
      {
        v11 = strlen(__lasts);
        if (v11 && strncasecmp(v10, __lasts, v11))
        {
          v12 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger)
            Logger(3, "%s:%i R-APDU does not match expected prefix!", "NfSecureElementScriptRunLine", 78);
          dispatch_get_specific(*v12);
          v14 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v48 = "NfSecureElementScriptRunLine";
            v49 = 1024;
            v50 = 78;
            _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i R-APDU does not match expected prefix!", buf, 0x12u);
          }
          dispatch_get_specific(*v12);
          v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v15)
            v15(3, "%s:%i Expected: %s", "NfSecureElementScriptRunLine", 79, __lasts);
          dispatch_get_specific(*v12);
          v16 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v48 = "NfSecureElementScriptRunLine";
            v49 = 1024;
            v50 = 79;
            v51 = 2080;
            v52 = __lasts;
            _os_log_impl(&dword_2295E9000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Expected: %s", buf, 0x1Cu);
          }
          dispatch_get_specific(*v12);
          v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v17)
            v17(3, "%s:%i Received: %s", "NfSecureElementScriptRunLine", 80, v10);
          dispatch_get_specific(*v12);
          v18 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v48 = "NfSecureElementScriptRunLine";
            v49 = 1024;
            v50 = 80;
            v51 = 2080;
            v52 = v10;
            _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Received: %s", buf, 0x1Cu);
          }
          _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfSecureElementScriptRunLine", 81);
          v7 = 5;
          goto LABEL_45;
        }
      }
      else
      {
        v11 = 0;
      }
      v7 = 0;
LABEL_45:
      if (__s)
      {
        v28 = strlen(__s);
        if (v28)
        {
          v29 = strlen(v10);
          if (strncasecmp(&v10[v29 - v28], __s, v28))
          {
            v30 = (const void **)MEMORY[0x24BEDCDB0];
            dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
            v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v31)
              v31(3, "%s:%i R-APDU does not match expected suffix!", "NfSecureElementScriptRunLine", 90);
            dispatch_get_specific(*v30);
            v32 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v48 = "NfSecureElementScriptRunLine";
              v49 = 1024;
              v50 = 90;
              _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i R-APDU does not match expected suffix!", buf, 0x12u);
            }
            dispatch_get_specific(*v30);
            v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v33)
              v33(3, "%s:%i Expected: %s", "NfSecureElementScriptRunLine", 91, __s);
            dispatch_get_specific(*v30);
            v34 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v48 = "NfSecureElementScriptRunLine";
              v49 = 1024;
              v50 = 91;
              v51 = 2080;
              v52 = __s;
              _os_log_impl(&dword_2295E9000, v34, OS_LOG_TYPE_ERROR, "%{public}s:%i Expected: %s", buf, 0x1Cu);
            }
            dispatch_get_specific(*v30);
            v35 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v35)
              v35(3, "%s:%i Received: %s", "NfSecureElementScriptRunLine", 92, v10);
            dispatch_get_specific(*v30);
            v36 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v48 = "NfSecureElementScriptRunLine";
              v49 = 1024;
              v50 = 92;
              v51 = 2080;
              v52 = v10;
              _os_log_impl(&dword_2295E9000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i Received: %s", buf, 0x1Cu);
            }
            _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfSecureElementScriptRunLine", 93);
            v7 = 5;
          }
        }
      }
      else
      {
        v28 = 0;
      }
      if (!(v28 | v11))
      {
        ResponseStatus = NFDriverSecureElementGetResponseStatus();
        if (ResponseStatus != 36864)
        {
          v38 = ResponseStatus;
          v39 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v40 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v40)
            v40(3, "%s:%i Command failed: status=0x%04x", "NfSecureElementScriptRunLine", 102, v38);
          dispatch_get_specific(*v39);
          v41 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v48 = "NfSecureElementScriptRunLine";
            v49 = 1024;
            v50 = 102;
            v51 = 1024;
            LODWORD(v52) = v38;
            _os_log_impl(&dword_2295E9000, v41, OS_LOG_TYPE_ERROR, "%{public}s:%i Command failed: status=0x%04x", buf, 0x18u);
          }
          dispatch_get_specific(*v39);
          v42 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v42)
            v42(3, "%s:%i Received: %s", "NfSecureElementScriptRunLine", 103, v10);
          dispatch_get_specific(*v39);
          v43 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v48 = "NfSecureElementScriptRunLine";
            v49 = 1024;
            v50 = 103;
            v51 = 2080;
            v52 = v10;
            _os_log_impl(&dword_2295E9000, v43, OS_LOG_TYPE_ERROR, "%{public}s:%i Received: %s", buf, 0x1Cu);
          }
          if (v38 == 25536)
          {
            v7 = 2;
          }
          else if (v38 == 26277)
          {
            v7 = 15;
          }
          else
          {
            _NFRestorePushError("com.apple.nfjcop", v38, "Error 0x%04x at %s:%d", v38, "NfSecureElementScriptRunLine", 110);
            v7 = 5;
          }
        }
      }
      free(v10);
      NFDataRelease();
      return v7;
    }
    v22 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
      v23(3, "%s:%i Transceive failed", "NfSecureElementScriptRunLine", 65);
    dispatch_get_specific(*v22);
    v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "NfSecureElementScriptRunLine";
      v49 = 1024;
      v50 = 65;
      _os_log_impl(&dword_2295E9000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i Transceive failed", buf, 0x12u);
    }
    v25 = *MEMORY[0x24BED8B88];
    StackBreadcrumb = NFDriverGetStackBreadcrumb();
    Message = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v25, "Error 0x%04x at %s:%d: %llx %s", v25, "NfSecureElementScriptRunLine", 66, StackBreadcrumb, Message);
    return 9;
  }
  else
  {
    v19 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v20)
      v20(3, "%s:%i Invalid hex string", "NfSecureElementScriptRunLine", 55);
    dispatch_get_specific(*v19);
    v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v48 = "NfSecureElementScriptRunLine";
      v49 = 1024;
      v50 = 55;
      _os_log_impl(&dword_2295E9000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid hex string", buf, 0x12u);
    }
    _NFRestorePushError("com.apple.nfrestore", 0, "Error at %s:%d", "NfSecureElementScriptRunLine", 56);
    return 7;
  }
}

uint64_t NfSecureElementScriptRun(uint64_t a1, char *__s)
{
  size_t v4;
  char *v5;
  char *v6;
  char *v7;
  const void **v8;
  char *v9;
  int v10;
  uint64_t v11;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v13;
  uint64_t v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  void (*v18)(uint64_t, const char *, ...);
  NSObject *v19;
  char *v20;
  void (*v21)(uint64_t, const char *, ...);
  NSObject *v22;
  char *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = strlen(__s) + 1;
  v5 = (char *)malloc_type_calloc(1uLL, v4, 0x100004077774924uLL);
  if (v5)
  {
    v6 = v5;
    strlcpy(v5, __s, v4);
    v24 = v6;
    v7 = strtok(v6, "\r\n");
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    if (v7)
    {
      v9 = v7;
      v10 = 0;
      while (1)
      {
        v11 = NfSecureElementScriptRunLine(a1, v9);
        if ((_DWORD)v11 == 2)
        {
          do
          {
            dispatch_get_specific(*v8);
            Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (Logger)
              Logger(6, "%s:%i Retry...", "NfSecureElementScriptRun", 152);
            dispatch_get_specific(*v8);
            v13 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              v26 = "NfSecureElementScriptRun";
              v27 = 1024;
              v28 = 152;
              _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Retry...", buf, 0x12u);
            }
            v14 = NfSecureElementScriptRunLine(a1, v9);
          }
          while ((_DWORD)v14 == 2);
          v11 = v14;
        }
        ++v10;
        if ((_DWORD)v11)
          break;
        v9 = strtok(0, "\r\n");
        if (!v9)
          goto LABEL_20;
      }
      dispatch_get_specific(*v8);
      v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21)
        v21(3, "%s:%i Failed at line %d: %s", "NfSecureElementScriptRun", 160, v10, v9);
      dispatch_get_specific(*v8);
      v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v26 = "NfSecureElementScriptRun";
        v27 = 1024;
        v28 = 160;
        v29 = 1024;
        v30 = v10;
        v31 = 2080;
        v32 = v9;
        _os_log_impl(&dword_2295E9000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed at line %d: %s", buf, 0x22u);
      }
      v20 = v24;
    }
    else
    {
      v10 = 0;
LABEL_20:
      dispatch_get_specific(*v8);
      v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v18)
        v18(6, "%s:%i Executed %d lines successfully", "NfSecureElementScriptRun", 165, v10);
      dispatch_get_specific(*v8);
      v19 = NFSharedLogGetLogger();
      v11 = 0;
      v20 = v24;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v26 = "NfSecureElementScriptRun";
        v27 = 1024;
        v28 = 165;
        v29 = 1024;
        v30 = v10;
        _os_log_impl(&dword_2295E9000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Executed %d lines successfully", buf, 0x18u);
        v11 = 0;
      }
    }
    free(v20);
  }
  else
  {
    v15 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i calloc failure...", "NfSecureElementScriptRun", 138);
    dispatch_get_specific(*v15);
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "NfSecureElementScriptRun";
      v27 = 1024;
      v28 = 138;
      _os_log_impl(&dword_2295E9000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i calloc failure...", buf, 0x12u);
    }
    return 3;
  }
  return v11;
}

uint64_t NfRestoreBundleScan(char *a1, CFMutableDictionaryRef *a2)
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  int *v7;
  char *v8;
  int *v9;
  const char *v10;
  NSObject *v11;
  int *v12;
  char *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  const void **v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  const void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, const char *, ...);
  char *v24;
  NSObject *v25;
  char *v26;
  const __CFString *v27;
  const __CFAllocator *v28;
  const void **v29;
  void (*v30)(uint64_t, const char *, ...);
  NSObject *v31;
  DIR *v32;
  DIR *v33;
  dirent *v34;
  dirent *v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  NSObject *v38;
  CFStringEncoding SystemEncoding;
  CFStringRef v40;
  void *v41;
  void (*v42)(uint64_t, const char *, ...);
  NSObject *v43;
  void (*v44)(uint64_t, const char *, ...);
  NSObject *v45;
  CFMutableDictionaryRef theDict;
  stat v47;
  void *value;
  uint8_t v49[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  _BYTE v54[14];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  _BYTE v60[14];
  __int16 v61;
  const char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  memset(&v47, 0, sizeof(v47));
  if (stat(a1, &v47))
  {
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      v7 = __error();
      v8 = strerror(*v7);
      v9 = __error();
      if (a1)
        v10 = a1;
      else
        v10 = "NULL";
      v6(3, "%s:%i \"%s\" errno=%d Failed to stat at %s", "NfRestoreBundleScan", 203, v8, *v9, v10);
    }
    dispatch_get_specific(*v4);
    v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      v14 = *__error();
      if (a1)
        v15 = a1;
      else
        v15 = "NULL";
      *(_DWORD *)buf = 136447234;
      v56 = "NfRestoreBundleScan";
      v57 = 1024;
      v58 = 203;
      v59 = 2080;
      *(_QWORD *)v60 = v13;
      *(_WORD *)&v60[8] = 1024;
      *(_DWORD *)&v60[10] = v14;
      v61 = 2080;
      v62 = v15;
      _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to stat at %s", buf, 0x2Cu);
    }
    return 7;
  }
  if (((__int16)v47.st_mode & 0x80000000) == 0)
  {
    if ((v47.st_mode & 0x4000) == 0)
    {
      v18 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v19)
        v19(4, "%s:%i Ignoring file of type %d: %s", "NfRestoreBundleScan", 217, v47.st_mode, a1);
      dispatch_get_specific(*v18);
      v20 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v56 = "NfRestoreBundleScan";
        v57 = 1024;
        v58 = 217;
        v59 = 1024;
        *(_DWORD *)v60 = v47.st_mode;
        *(_WORD *)&v60[4] = 2080;
        *(_QWORD *)&v60[6] = a1;
        _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Ignoring file of type %d: %s", buf, 0x22u);
      }
      return 1;
    }
    v28 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 10, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v29 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30)
      v30(6, "%s:%i %s", "_NfRestoreBundleReadDir", 104, a1);
    dispatch_get_specific(*v29);
    v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v49 = 136446722;
      v50 = "_NfRestoreBundleReadDir";
      v51 = 1024;
      v52 = 104;
      v53 = 2080;
      *(_QWORD *)v54 = a1;
      _os_log_impl(&dword_2295E9000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", v49, 0x1Cu);
    }
    v32 = opendir(a1);
    if (v32)
    {
      v33 = v32;
      v34 = readdir(v32);
      if (!v34)
      {
LABEL_46:
        closedir(v33);
        v16 = 0;
        *a2 = theDict;
        return v16;
      }
      v35 = v34;
      while (1)
      {
        if (v35->d_name[0] != 46)
        {
          if (snprintf((char *)buf, 0x400uLL, "%s/%s", a1, v35->d_name) < 0)
          {
            dispatch_get_specific(*v29);
            v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v44)
              v44(3, "%s:%i snprintf error", "_NfRestoreBundleReadDir", 119);
            dispatch_get_specific(*v29);
            v45 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v49 = 136446466;
              v50 = "_NfRestoreBundleReadDir";
              v51 = 1024;
              v52 = 119;
              _os_log_impl(&dword_2295E9000, v45, OS_LOG_TYPE_ERROR, "%{public}s:%i snprintf error", v49, 0x12u);
            }
            closedir(v33);
            CFRelease(theDict);
            return 5;
          }
          value = 0;
          v36 = NfRestoreBundleScan(buf, &value);
          if ((_DWORD)v36)
          {
            v16 = v36;
            dispatch_get_specific(*v29);
            v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v37)
              v37(3, "%s:%i Error %d at %s", "_NfRestoreBundleReadDir", 128, v16, (const char *)buf);
            dispatch_get_specific(*v29);
            v38 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v49 = 136446978;
              v50 = "_NfRestoreBundleReadDir";
              v51 = 1024;
              v52 = 128;
              v53 = 1024;
              *(_DWORD *)v54 = v16;
              *(_WORD *)&v54[4] = 2080;
              *(_QWORD *)&v54[6] = buf;
              _os_log_impl(&dword_2295E9000, v38, OS_LOG_TYPE_ERROR, "%{public}s:%i Error %d at %s", v49, 0x22u);
            }
            if ((_DWORD)v16 != 1 && ((_DWORD)v16 != 7 || v35->d_type != 10))
            {
              closedir(v33);
              CFRelease(theDict);
              return v16;
            }
          }
          else
          {
            SystemEncoding = CFStringGetSystemEncoding();
            v40 = CFStringCreateWithCString(v28, v35->d_name, SystemEncoding);
            v41 = value;
            CFDictionarySetValue(theDict, v40, value);
            CFRelease(v40);
            CFRelease(v41);
          }
        }
        v35 = readdir(v33);
        if (!v35)
          goto LABEL_46;
      }
    }
    dispatch_get_specific(*v29);
    v42 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v42)
      v42(3, "%s:%i Failed to open %s", "_NfRestoreBundleReadDir", 108, a1);
    dispatch_get_specific(*v29);
    v43 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v49 = 136446722;
      v50 = "_NfRestoreBundleReadDir";
      v51 = 1024;
      v52 = 108;
      v53 = 2080;
      *(_QWORD *)v54 = a1;
      _os_log_impl(&dword_2295E9000, v43, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to open %s", v49, 0x1Cu);
    }
    CFRelease(theDict);
    return 7;
  }
  v21 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v22 = NFLogGetLogger();
  if (v22)
  {
    v23 = (void (*)(uint64_t, const char *, ...))v22;
    v24 = basename(a1);
    v23(6, "%s:%i %s", "_NfRestoreBundleGetFileHandle", 89, v24);
  }
  dispatch_get_specific(*v21);
  v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = basename(a1);
    *(_DWORD *)buf = 136446722;
    v56 = "_NfRestoreBundleGetFileHandle";
    v57 = 1024;
    v58 = 89;
    v59 = 2080;
    *(_QWORD *)v60 = v26;
    _os_log_impl(&dword_2295E9000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s", buf, 0x1Cu);
  }
  v27 = CFStringCreateWithCString(0, a1, 0x8000100u);
  *a2 = CFURLCreateWithString(0, v27, 0);
  CFRelease(v27);
  return 0;
}

uint64_t NfRestoreBundleCreate(char *a1, const char *a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const void **v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  const void **v10;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v12;
  int v13;
  int v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  CFPropertyListRef v18;
  CFDataRef v19;
  const __CFData *v20;
  FILE *v21;
  FILE *v22;
  const UInt8 *BytePtr;
  size_t Length;
  size_t v25;
  const __CFString *v26;
  const void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, ...);
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  NSObject *v32;
  CFStringEncoding v33;
  const char *v34;
  const void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  int *v38;
  char *v39;
  int *v40;
  NSObject *v41;
  int *v42;
  char *v43;
  int v44;
  const void **v45;
  void (*v46)(uint64_t, const char *, ...);
  NSObject *v47;
  const void **v48;
  void (*v49)(uint64_t, const char *, ...);
  NSObject *v50;
  const void **v51;
  void (*v52)(uint64_t, const char *, ...);
  NSObject *v53;
  const void **v54;
  void (*v55)(uint64_t, const char *, ...);
  NSObject *v56;
  CFPropertyListRef propertyList;
  CFErrorRef error;
  char __str[1024];
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  _BYTE v66[14];
  __int16 v67;
  char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  propertyList = 0;
  v4 = ".";
  if (a2)
    v4 = a2;
  if (snprintf(__str, 0x400uLL, "%s", v4) < 0)
  {
    v10 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i snprintf error", "NfRestoreBundleCreate", 228);
    dispatch_get_specific(*v10);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v62 = "NfRestoreBundleCreate";
      v63 = 1024;
      v64 = 228;
      _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i snprintf error", buf, 0x12u);
    }
    return 3;
  }
  else
  {
    v5 = _NfRestoreBundleValidateTargetPath(__str);
    if ((_DWORD)v5)
    {
      v6 = v5;
      v7 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v8)
        v8(3, "%s:%i Failed to build target path: %s", "NfRestoreBundleCreate", 233, a2);
      dispatch_get_specific(*v7);
      v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v62 = "NfRestoreBundleCreate";
        v63 = 1024;
        v64 = 233;
        v65 = 2080;
        *(_QWORD *)v66 = a2;
        _os_log_impl(&dword_2295E9000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to build target path: %s", buf, 0x1Cu);
      }
      return v6;
    }
    v13 = NfRestoreBundleScan(a1, (CFMutableDictionaryRef *)&propertyList);
    if (v13)
    {
      v14 = v13;
      v15 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
        v16(3, "%s:%i Failed to scan directory %u : %s", "NfRestoreBundleCreate", 238, v14, a1);
      dispatch_get_specific(*v15);
      v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v62 = "NfRestoreBundleCreate";
        v63 = 1024;
        v64 = 238;
        v65 = 1024;
        *(_DWORD *)v66 = v14;
        *(_WORD *)&v66[4] = 2080;
        *(_QWORD *)&v66[6] = a1;
        _os_log_impl(&dword_2295E9000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to scan directory %u : %s", buf, 0x22u);
      }
      return 7;
    }
    v18 = propertyList;
    error = 0;
    v19 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], propertyList, kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (v19)
    {
      v20 = v19;
      unlink(__str);
      v21 = fopen(__str, "w");
      if (v21)
      {
        v22 = v21;
        BytePtr = CFDataGetBytePtr(v20);
        Length = CFDataGetLength(v20);
        v25 = fwrite(BytePtr, Length, 1uLL, v22);
        if (v25 == 1)
        {
          v6 = 0;
        }
        else
        {
          v45 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v46 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v46)
            v46(3, "%s:%i Failed to write data to %s", "_NfRestoreBundleWrite", 73, __str);
          dispatch_get_specific(*v45);
          v47 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v62 = "_NfRestoreBundleWrite";
            v63 = 1024;
            v64 = 73;
            v65 = 2080;
            *(_QWORD *)v66 = __str;
            _os_log_impl(&dword_2295E9000, v47, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write data to %s", buf, 0x1Cu);
          }
          v6 = 7;
        }
        fclose(v22);
        CFRelease(v20);
        if (v25 == 1)
        {
          v48 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v49)
            v49(6, "%s:%i Wrote to file: %s", "NfRestoreBundleCreate", 248, __str);
          dispatch_get_specific(*v48);
          v50 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v62 = "NfRestoreBundleCreate";
            v63 = 1024;
            v64 = 248;
            v65 = 2080;
            *(_QWORD *)v66 = __str;
            _os_log_impl(&dword_2295E9000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Wrote to file: %s", buf, 0x1Cu);
          }
          if (v18)
            CFRelease(v18);
          return 0;
        }
      }
      else
      {
        v35 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v36 = NFLogGetLogger();
        if (v36)
        {
          v37 = (void (*)(uint64_t, const char *, ...))v36;
          v38 = __error();
          v39 = strerror(*v38);
          v40 = __error();
          v37(3, "%s:%i \"%s\" errno=%d Failed to open %s", "_NfRestoreBundleWrite", 51, v39, *v40, __str);
        }
        dispatch_get_specific(*v35);
        v41 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = __error();
          v43 = strerror(*v42);
          v44 = *__error();
          *(_DWORD *)buf = 136447234;
          v62 = "_NfRestoreBundleWrite";
          v63 = 1024;
          v64 = 51;
          v65 = 2080;
          *(_QWORD *)v66 = v43;
          *(_WORD *)&v66[8] = 1024;
          *(_DWORD *)&v66[10] = v44;
          v67 = 2080;
          v68 = __str;
          _os_log_impl(&dword_2295E9000, v41, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to open %s", buf, 0x2Cu);
        }
        CFRelease(v20);
        v6 = 7;
      }
    }
    else
    {
      if (error)
      {
        v26 = CFErrorCopyDescription(error);
        v27 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v28 = NFLogGetLogger();
        if (v28)
        {
          v29 = (void (*)(uint64_t, const char *, ...))v28;
          SystemEncoding = CFStringGetSystemEncoding();
          CStringPtr = CFStringGetCStringPtr(v26, SystemEncoding);
          v29(3, "%s:%i Encoding error: %s", "_NfRestoreBundleWrite", 37, CStringPtr);
        }
        dispatch_get_specific(*v27);
        v32 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = CFStringGetSystemEncoding();
          v34 = CFStringGetCStringPtr(v26, v33);
          *(_DWORD *)buf = 136446722;
          v62 = "_NfRestoreBundleWrite";
          v63 = 1024;
          v64 = 37;
          v65 = 2080;
          *(_QWORD *)v66 = v34;
          _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Encoding error: %s", buf, 0x1Cu);
        }
        CFRelease(v26);
        CFRelease(error);
      }
      else
      {
        v51 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v52 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v52)
          v52(3, "%s:%i Unknown encoding error", "_NfRestoreBundleWrite", 42);
        dispatch_get_specific(*v51);
        v53 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v62 = "_NfRestoreBundleWrite";
          v63 = 1024;
          v64 = 42;
          _os_log_impl(&dword_2295E9000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i Unknown encoding error", buf, 0x12u);
        }
      }
      v6 = 3;
    }
    v54 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v55)
      v55(3, "%s:%i Failed to write to path: %s", "NfRestoreBundleCreate", 243, __str);
    dispatch_get_specific(*v54);
    v56 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v62 = "NfRestoreBundleCreate";
      v63 = 1024;
      v64 = 243;
      v65 = 2080;
      *(_QWORD *)v66 = __str;
      _os_log_impl(&dword_2295E9000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write to path: %s", buf, 0x1Cu);
    }
    if (v18)
      CFRelease(v18);
  }
  return v6;
}

uint64_t _NfRestoreBundleValidateTargetPath(char *a1)
{
  char *v2;
  const void **v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  int *v6;
  char *v7;
  int *v8;
  NSObject *v9;
  int *v10;
  char *v11;
  int v12;
  const char *v13;
  uint64_t result;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  NSObject *v18;
  uint32_t v19;
  const void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, ...);
  int *v23;
  char *v24;
  int *v25;
  NSObject *v26;
  int *v27;
  char *v28;
  int v29;
  size_t v30;
  const void **v31;
  uint64_t v32;
  void (*v33)(uint64_t, const char *, ...);
  int *v34;
  char *v35;
  int *v36;
  int *v37;
  char *v38;
  int v39;
  const void **v40;
  void (*v41)(uint64_t, const char *, ...);
  NSObject *v42;
  stat v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  memset(&v43, 0, sizeof(v43));
  if (stat(a1, &v43))
  {
    if (*__error() == 2)
    {
      v2 = dirname(a1);
      if (stat(v2, &v43))
      {
        v3 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = NFLogGetLogger();
        if (Logger)
        {
          v5 = (void (*)(uint64_t, const char *, ...))Logger;
          v6 = __error();
          v7 = strerror(*v6);
          v8 = __error();
          v5(3, "%s:%i \"%s\" errno=%d failed to stat parent: %s", "_NfRestoreBundleValidateTargetPath", 159, v7, *v8, v2);
        }
        dispatch_get_specific(*v3);
        v9 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          return 7;
        v10 = __error();
        v11 = strerror(*v10);
        v12 = *__error();
        *(_DWORD *)buf = 136447234;
        v45 = "_NfRestoreBundleValidateTargetPath";
        v46 = 1024;
        v47 = 159;
        v48 = 2080;
        v49 = v11;
        v50 = 1024;
        v51 = v12;
        v52 = 2080;
        v53 = v2;
        v13 = "%{public}s:%i \"%s\" errno=%d failed to stat parent: %s";
      }
      else
      {
        if ((v43.st_mode & 0x4000) != 0)
          return 0;
        v31 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v32 = NFLogGetLogger();
        if (v32)
        {
          v33 = (void (*)(uint64_t, const char *, ...))v32;
          v34 = __error();
          v35 = strerror(*v34);
          v36 = __error();
          v33(3, "%s:%i \"%s\" errno=%d parent is not directory: %s", "_NfRestoreBundleValidateTargetPath", 168, v35, *v36, v2);
        }
        dispatch_get_specific(*v31);
        v9 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          return 7;
        v37 = __error();
        v38 = strerror(*v37);
        v39 = *__error();
        *(_DWORD *)buf = 136447234;
        v45 = "_NfRestoreBundleValidateTargetPath";
        v46 = 1024;
        v47 = 168;
        v48 = 2080;
        v49 = v38;
        v50 = 1024;
        v51 = v39;
        v52 = 2080;
        v53 = v2;
        v13 = "%{public}s:%i \"%s\" errno=%d parent is not directory: %s";
      }
      v18 = v9;
      v19 = 44;
    }
    else
    {
      v20 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v21 = NFLogGetLogger();
      if (v21)
      {
        v22 = (void (*)(uint64_t, const char *, ...))v21;
        v23 = __error();
        v24 = strerror(*v23);
        v25 = __error();
        v22(3, "%s:%i \"%s\" errno=%d stat failed", "_NfRestoreBundleValidateTargetPath", 172, v24, *v25);
      }
      dispatch_get_specific(*v20);
      v26 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        return 7;
      v27 = __error();
      v28 = strerror(*v27);
      v29 = *__error();
      *(_DWORD *)buf = 136446978;
      v45 = "_NfRestoreBundleValidateTargetPath";
      v46 = 1024;
      v47 = 172;
      v48 = 2080;
      v49 = v28;
      v50 = 1024;
      v51 = v29;
      v13 = "%{public}s:%i \"%s\" errno=%d stat failed";
      v18 = v26;
      v19 = 34;
    }
LABEL_26:
    _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_ERROR, v13, buf, v19);
    return 7;
  }
  if ((v43.st_mode & 0x4000) == 0)
  {
    result = unlink(a1);
    if (!(_DWORD)result)
      return result;
    v15 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i Failed to delete existing file: %s", "_NfRestoreBundleValidateTargetPath", 191, a1);
    dispatch_get_specific(*v15);
    v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 7;
    *(_DWORD *)buf = 136446722;
    v45 = "_NfRestoreBundleValidateTargetPath";
    v46 = 1024;
    v47 = 191;
    v48 = 2080;
    v49 = a1;
    v13 = "%{public}s:%i Failed to delete existing file: %s";
    v18 = v17;
    v19 = 28;
    goto LABEL_26;
  }
  v30 = strlen(a1);
  if ((snprintf(&a1[v30], 1024 - v30, "/%s", "StockholmRestore.plist") & 0x80000000) == 0)
    return _NfRestoreBundleValidateTargetPath(a1);
  v40 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v41)
    v41(3, "%s:%i snprintf error", "_NfRestoreBundleValidateTargetPath", 182);
  dispatch_get_specific(*v40);
  v42 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v45 = "_NfRestoreBundleValidateTargetPath";
    v46 = 1024;
    v47 = 182;
    _os_log_impl(&dword_2295E9000, v42, OS_LOG_TYPE_ERROR, "%{public}s:%i snprintf error", buf, 0x12u);
  }
  return 3;
}

_QWORD *NfContextInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = malloc_type_calloc(1uLL, 0x18uLL, 0x80040D6874129uLL);
  if (v6)
  {
    NFLogSetLogger();
    *v6 = a1;
    v6[1] = a2;
    v6[2] = a3;
  }
  return v6;
}

uint64_t NFRestoreLog(uint64_t a1, char *__format, ...)
{
  uint64_t result;
  char __str[1024];
  uint64_t v6;
  va_list va;

  va_start(va, __format);
  v6 = *MEMORY[0x24BDAC8D0];
  if (!gNfContext)
    goto LABEL_5;
  if (*(_QWORD *)(gNfContext + 8))
  {
    vsnprintf(__str, 0x400uLL, __format, va);
    return (*(uint64_t (**)(_QWORD, uint64_t, const char *, ...))(gNfContext + 8))(*(_QWORD *)(gNfContext + 16), a1, "%s\n", __str);
  }
  result = NFIsRestoreOS();
  if ((_DWORD)result)
  {
LABEL_5:
    vsnprintf(__str, 0x400uLL, __format, va);
    return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", __str);
  }
  return result;
}

void NfContextFree(void *a1)
{
  if (a1)
    free(a1);
}

char *NfSecureElementOpen(uint64_t a1, int a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  char *v7;
  char *v8;
  unsigned int v9;
  const char *v10;
  void (*v11)(uint64_t, const char *, ...);
  const char *v12;
  const char *v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  const char *v19;
  const char *v20;
  void (*v21)(uint64_t, const char *, ...);
  int v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  int v26;
  const char *v27;
  BOOL v28;
  int v29;
  int v30;
  int v31;
  int v32;
  void (*v33)(uint64_t, const char *, ...);
  NSObject *v34;
  int v35;
  int v36;
  void (*v37)(uint64_t, const char *, ...);
  NSObject *v38;
  void (*v39)(uint64_t, const char *, ...);
  NSObject *v40;
  unsigned int v41;
  uint64_t StackBreadcrumb;
  const char *Message;
  void (*v44)(uint64_t, const char *, ...);
  NSObject *v45;
  unsigned int v46;
  uint64_t v47;
  void (*v48)(uint64_t, const char *, ...);
  NSObject *v49;
  void (*v51)(uint64_t, const char *, ...);
  NSObject *v52;
  unsigned int v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NfSecureElementOpen", 149);
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v58 = "NfSecureElementOpen";
    v59 = 1024;
    v60 = 149;
    _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  v7 = (char *)malloc_type_calloc(1uLL, 0xE18uLL, 0x10200407C1C0D77uLL);
  if (!v7)
  {
    dispatch_get_specific(*v4);
    v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v37)
      v37(3, "%s:%i Failed to allocate NfSecureElement_t", "NfSecureElementOpen", 154);
    dispatch_get_specific(*v4);
    v38 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v58 = "NfSecureElementOpen";
      v59 = 1024;
      v60 = 154;
      _os_log_impl(&dword_2295E9000, v38, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate NfSecureElement_t", buf, 0x12u);
    }
    return 0;
  }
  v8 = v7;
  *(_QWORD *)v7 = a1;
  *((_DWORD *)v7 + 2) = a2;
  if ((NfSecureElementSetPower((uint64_t)v7, 1) & 1) == 0)
  {
    dispatch_get_specific(*v4);
    v39 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v39)
      v39(3, "%s:%i Failed to enter wired mode", "NfSecureElementOpen", 162);
    dispatch_get_specific(*v4);
    v40 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v58 = "NfSecureElementOpen";
      v59 = 1024;
      v60 = 162;
      _os_log_impl(&dword_2295E9000, v40, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to enter wired mode", buf, 0x12u);
    }
    v41 = *MEMORY[0x24BED8B88];
    StackBreadcrumb = NFDriverGetStackBreadcrumb();
    Message = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v41, "Error 0x%04x at %s:%d: %llx %s", v41, "NfSecureElementOpen", 163, StackBreadcrumb, Message);
    goto LABEL_65;
  }
  if ((NFDriverSecureElementGetOSMode() & 1) == 0)
  {
    dispatch_get_specific(*v4);
    v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v44)
      v44(4, "%s:%i Failed to get OS mode", "NfSecureElementUpdateOSInfo", 22);
    dispatch_get_specific(*v4);
    v45 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v58 = "NfSecureElementUpdateOSInfo";
      v59 = 1024;
      v60 = 22;
      _os_log_impl(&dword_2295E9000, v45, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get OS mode", buf, 0x12u);
    }
    v46 = *MEMORY[0x24BED8B88];
    v47 = NFDriverGetStackBreadcrumb();
    v55 = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v46, "Error 0x%04x at %s:%d: %llx %s", v46, "NfSecureElementUpdateOSInfo", 23, v47, v55);
    goto LABEL_61;
  }
  if (*((_DWORD *)v8 + 887) == 2 && (NFDriverSecureElementGetOSInfo() & 1) == 0)
  {
    dispatch_get_specific(*v4);
    v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v51)
      v51(4, "%s:%i Failed to get OS info", "NfSecureElementUpdateOSInfo", 29);
    dispatch_get_specific(*v4);
    v52 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v58 = "NfSecureElementUpdateOSInfo";
      v59 = 1024;
      v60 = 29;
      _os_log_impl(&dword_2295E9000, v52, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get OS info", buf, 0x12u);
    }
    v53 = *MEMORY[0x24BED8B88];
    v54 = NFDriverGetStackBreadcrumb();
    v56 = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v53, "Error 0x%04x at %s:%d: %llx %s", v53, "NfSecureElementUpdateOSInfo", 30, v54, v56);
LABEL_61:
    dispatch_get_specific(*v4);
    v48 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v48)
      v48(3, "%s:%i Failed to update OS info", "NfSecureElementOpen", 168);
    dispatch_get_specific(*v4);
    v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v58 = "NfSecureElementOpen";
      v59 = 1024;
      v60 = 168;
      _os_log_impl(&dword_2295E9000, v49, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to update OS info", buf, 0x12u);
    }
LABEL_65:
    NfSecureElementClose(v8);
    return 0;
  }
  v9 = *((_DWORD *)v8 + 889) - 1;
  v10 = "UNKNOWN";
  if (v9 <= 5)
    v10 = off_24F259308[v9];
  dispatch_get_specific(*v4);
  v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v11)
  {
    if (v8[3599])
      v12 = "YES";
    else
      v12 = "NO";
    if (v8[3600])
      v13 = "YES";
    else
      v13 = "NO";
    v11(6, "%s:%i id=%s dev=0x%02x hw=0x%08x fw=0x%04x cfw=0x%04x restricted=%s OSUpdate=%s", "NfSecureElementUpdateOSInfo", 54, v8 + 3392, v8[3596], *((_DWORD *)v8 + 894), *((_DWORD *)v8 + 893), *((unsigned __int16 *)v8 + 1792), v12, v13);
  }
  dispatch_get_specific(*v4);
  v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v8[3596];
    v16 = *((_DWORD *)v8 + 894);
    v17 = *((_DWORD *)v8 + 893);
    v18 = *((unsigned __int16 *)v8 + 1792);
    if (v8[3599])
      v19 = "YES";
    else
      v19 = "NO";
    if (v8[3600])
      v20 = "YES";
    else
      v20 = "NO";
    *(_DWORD *)buf = 136448258;
    v58 = "NfSecureElementUpdateOSInfo";
    v59 = 1024;
    v60 = 54;
    v61 = 2080;
    v62 = v8 + 3392;
    v63 = 1024;
    v64 = v15;
    v65 = 1024;
    v66 = v16;
    v67 = 1024;
    v68 = v17;
    v69 = 1024;
    v70 = v18;
    v71 = 2080;
    v72 = v19;
    v73 = 2080;
    v74 = v20;
    _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i id=%s dev=0x%02x hw=0x%08x fw=0x%04x cfw=0x%04x restricted=%s OSUpdate=%s", buf, 0x48u);
  }
  dispatch_get_specific(*v4);
  v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v21)
  {
    v22 = *((_DWORD *)v8 + 887);
    if (v22 == 2)
      v23 = "JCOP";
    else
      v23 = "UNKNOWN";
    if (v22 == 1)
      v24 = "Update";
    else
      v24 = v23;
    v21(6, "%s:%i mode=%s counter=%d reference=%d osid=0x%02x othervalid=0x%02x", "NfSecureElementUpdateOSInfo", 62, v24, *((unsigned __int16 *)v8 + 1793), *((unsigned __int16 *)v8 + 1794), v8[3597], v8[3598]);
  }
  dispatch_get_specific(*v4);
  v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *((_DWORD *)v8 + 887);
    if (v26 == 2)
      v27 = "JCOP";
    else
      v27 = "UNKNOWN";
    v28 = v26 == 1;
    v29 = *((unsigned __int16 *)v8 + 1793);
    if (v28)
      v27 = "Update";
    v30 = *((unsigned __int16 *)v8 + 1794);
    v31 = v8[3597];
    v32 = v8[3598];
    *(_DWORD *)buf = 136447746;
    v58 = "NfSecureElementUpdateOSInfo";
    v59 = 1024;
    v60 = 62;
    v61 = 2080;
    v62 = v27;
    v63 = 1024;
    v64 = v29;
    v65 = 1024;
    v66 = v30;
    v67 = 1024;
    v68 = v31;
    v69 = 1024;
    v70 = v32;
    _os_log_impl(&dword_2295E9000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i mode=%s counter=%d reference=%d osid=0x%02x othervalid=0x%02x", buf, 0x34u);
  }
  dispatch_get_specific(*v4);
  v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v33)
    v33(6, "%s:%i migration=%s pkgs=%d inst=%d", "NfSecureElementUpdateOSInfo", 67, v10, *((unsigned __int16 *)v8 + 1795), *((unsigned __int16 *)v8 + 1796));
  dispatch_get_specific(*v4);
  v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = *((unsigned __int16 *)v8 + 1795);
    v36 = *((unsigned __int16 *)v8 + 1796);
    *(_DWORD *)buf = 136447234;
    v58 = "NfSecureElementUpdateOSInfo";
    v59 = 1024;
    v60 = 67;
    v61 = 2080;
    v62 = v10;
    v63 = 1024;
    v64 = v35;
    v65 = 1024;
    v66 = v36;
    _os_log_impl(&dword_2295E9000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s:%i migration=%s pkgs=%d inst=%d", buf, 0x28u);
  }
  return v8;
}

uint64_t NfSecureElementSetPower(uint64_t a1, int a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  int v7;
  unsigned int v9;
  uint64_t StackBreadcrumb;
  const char *Message;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i se=%d, enabled=%d", "NfSecureElementSetPower", 80, *(_DWORD *)(a1 + 8), a2);
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)buf = 136446978;
    v13 = "NfSecureElementSetPower";
    v14 = 1024;
    v15 = 80;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = a2;
    _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i se=%d, enabled=%d", buf, 0x1Eu);
  }
  if (!a2)
    return NFDriverSetConfiguration();
  if ((NFDriverSetConfiguration() & 1) != 0)
  {
    usleep(0x7D0u);
    return 1;
  }
  else
  {
    v9 = *MEMORY[0x24BED8B88];
    StackBreadcrumb = NFDriverGetStackBreadcrumb();
    Message = (const char *)NFDriverSerialDebugLastMessage();
    _NFRestorePushError("com.apple.nfstack", v9, "Error 0x%04x at %s:%d: %llx %s", v9, "NfSecureElementSetPower", 86, StackBreadcrumb, Message);
    return 0;
  }
}

void NfSecureElementClose(void *a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  void (*v5)(uint64_t, const char *, ...);
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NfSecureElementClose", 181);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "NfSecureElementClose";
    v9 = 1024;
    v10 = 181;
    _os_log_impl(&dword_2295E9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (a1)
  {
    NfSecureElementSetPower((uint64_t)a1, 0);
    free(a1);
  }
  else
  {
    dispatch_get_specific(*v2);
    v5 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v5)
      v5(3, "%s:%i se object is not valid", "NfSecureElementClose", 184);
    dispatch_get_specific(*v2);
    v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v8 = "NfSecureElementClose";
      v9 = 1024;
      v10 = 184;
      _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i se object is not valid", buf, 0x12u);
    }
  }
}

BOOL NFHardwareGetUARTLogEnabled(io_registry_entry_t *a1)
{
  io_registry_entry_t v1;
  CFTypeRef CFProperty;
  const void *v3;
  CFTypeID v4;
  _BOOL8 v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  if (!v1)
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Not connected", "NFHardwareGetUARTLogEnabled", 23);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v20 = "NFHardwareGetUARTLogEnabled";
    v21 = 1024;
    v22 = 23;
    v9 = "%{public}s:%i Not connected";
    v10 = v8;
    v11 = 18;
    goto LABEL_13;
  }
  CFProperty = IORegistryEntryCreateCFProperty(v1, CFSTR("uart.log"), 0, 0);
  if (!CFProperty)
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(4, "%s:%i Failed to fetch property: %s", "NFHardwareGetUARTLogEnabled", 30, "uart.log");
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446722;
    v20 = "NFHardwareGetUARTLogEnabled";
    v21 = 1024;
    v22 = 30;
    v23 = 2080;
    v24 = "uart.log";
    v9 = "%{public}s:%i Failed to fetch property: %s";
    v10 = v14;
    v11 = 28;
LABEL_13:
    _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0;
  }
  v3 = CFProperty;
  v4 = CFGetTypeID(CFProperty);
  if (v4 == CFBooleanGetTypeID())
  {
    v5 = v3 == (const void *)*MEMORY[0x24BDBD270];
  }
  else
  {
    v15 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i Unsupported type: %lu", "NFHardwareGetUARTLogEnabled", 39, v4);
    dispatch_get_specific(*v15);
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "NFHardwareGetUARTLogEnabled";
      v21 = 1024;
      v22 = 39;
      v23 = 2048;
      v24 = (const char *)v4;
      _os_log_impl(&dword_2295E9000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Unsupported type: %lu", buf, 0x1Cu);
    }
    v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

uint64_t NFHardwareGetRFConfigTLVs(io_registry_entry_t *a1, CFStringRef *a2)
{
  CFStringRef *v3;
  CFStringRef *v4;
  CFStringRef *v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  uint64_t RFConfigTLV;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  if (*a1)
  {
    v3 = a2 + 1;
    *((_OWORD *)a2 + 1) = 0uLL;
    v4 = a2 + 2;
    *(_OWORD *)a2 = 0uLL;
    v5 = a2 + 3;
    _NFHardwareGetRFConfigTLV(a1, CFSTR("rf-clock-tlv"), a2);
    if (_NFHardwareGetRFConfigTLV(a1, CFSTR("rf-config-tlvs"), v3) && *v3)
      return 1;
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 101, "rf-config-tlvs");
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "NFHardwareGetRFConfigTLVs";
      v20 = 1024;
      v21 = 101;
      v22 = 2080;
      v23 = "rf-config-tlvs";
      _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
    }
    if (!_NFHardwareGetRFConfigTLV(a1, CFSTR("rf-config-tlvs-10"), v4) || !*v4)
    {
      dispatch_get_specific(*v6);
      v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9)
        v9(4, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 106, "rf-config-tlvs-10");
      dispatch_get_specific(*v6);
      v10 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v19 = "NFHardwareGetRFConfigTLVs";
        v20 = 1024;
        v21 = 106;
        v22 = 2080;
        v23 = "rf-config-tlvs-10";
        _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
      }
    }
    RFConfigTLV = _NFHardwareGetRFConfigTLV(a1, CFSTR("rf-config-tlvs-12"), v5);
    if ((_DWORD)RFConfigTLV && *v5)
    {
      return 1;
    }
    else
    {
      dispatch_get_specific(*v6);
      v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15)
        v15(4, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 110, "rf-config-tlvs-12");
      dispatch_get_specific(*v6);
      v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v19 = "NFHardwareGetRFConfigTLVs";
        v20 = 1024;
        v21 = 110;
        v22 = 2080;
        v23 = "rf-config-tlvs-12";
        _os_log_impl(&dword_2295E9000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
      }
    }
  }
  else
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i Not connected", "NFHardwareGetRFConfigTLVs", 86);
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "NFHardwareGetRFConfigTLVs";
      v20 = 1024;
      v21 = 86;
      _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Not connected", buf, 0x12u);
    }
    return 0;
  }
  return RFConfigTLV;
}

uint64_t _NFHardwareGetRFConfigTLV(io_registry_entry_t *a1, const __CFString *a2, CFStringRef *a3)
{
  uint64_t result;
  const void *v5;
  CFTypeID v6;
  CFStringRef v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  CFTypeID TypeID;
  CFTypeID v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  CFTypeID v19;
  __int16 v20;
  CFTypeID v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  result = (uint64_t)IORegistryEntryCreateCFProperty(*a1, a2, 0, 0);
  if (!result)
    return result;
  v5 = (const void *)result;
  v6 = CFGetTypeID((CFTypeRef)result);
  if (v6 != CFDataGetTypeID())
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      TypeID = CFDataGetTypeID();
      v12 = CFGetTypeID(v5);
      v10(3, "%s:%i Unexpected CFType, exp = %lu, actual = %lu", "_NFHardwareGetRFConfigTLV", 69, TypeID, v12);
    }
    dispatch_get_specific(*v8);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "_NFHardwareGetRFConfigTLV";
      v16 = 1024;
      v17 = 69;
      v18 = 2048;
      v19 = CFDataGetTypeID();
      v20 = 2048;
      v21 = CFGetTypeID(v5);
      _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
    }
    CFRelease(v5);
    return 0;
  }
  v7 = CFStringCreateFromExternalRepresentation(0, (CFDataRef)v5, 0x600u);
  if (v7)
    *a3 = v7;
  CFRelease(v5);
  return 1;
}

CFStringRef NFHardwareCopyAntennaName(io_registry_entry_t *a1)
{
  io_registry_entry_t v1;
  const __CFData *CFProperty;
  const __CFData *v3;
  CFTypeID v4;
  CFStringRef v5;
  const void **v7;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v9;
  const char *v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  const void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, const char *, ...);
  CFTypeID TypeID;
  CFTypeID v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  CFTypeID v24;
  __int16 v25;
  CFTypeID v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  if (!v1)
  {
    v7 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Not connected", "NFHardwareCopyAntennaName", 122);
    dispatch_get_specific(*v7);
    v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v20 = "NFHardwareCopyAntennaName";
    v21 = 1024;
    v22 = 122;
    v10 = "%{public}s:%i Not connected";
LABEL_13:
    _os_log_impl(&dword_2295E9000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
    return 0;
  }
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, CFSTR("rf-antenna-name"), 0, 0);
  if (!CFProperty)
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
      v12(4, "%s:%i antenna name is missing - no RF?", "NFHardwareCopyAntennaName", 131);
    dispatch_get_specific(*v11);
    v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v20 = "NFHardwareCopyAntennaName";
    v21 = 1024;
    v22 = 131;
    v10 = "%{public}s:%i antenna name is missing - no RF?";
    goto LABEL_13;
  }
  v3 = CFProperty;
  v4 = CFGetTypeID(CFProperty);
  if (v4 == CFDataGetTypeID())
  {
    v5 = CFStringCreateFromExternalRepresentation(0, v3, 0x600u);
    CFRelease(v3);
    return v5;
  }
  v13 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v14 = NFLogGetLogger();
  if (v14)
  {
    v15 = (void (*)(uint64_t, const char *, ...))v14;
    TypeID = CFDataGetTypeID();
    v17 = CFGetTypeID(v3);
    v15(3, "%s:%i Unexpected CFType, exp = %lu, actual = %lu", "NFHardwareCopyAntennaName", 143, TypeID, v17);
  }
  dispatch_get_specific(*v13);
  v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v20 = "NFHardwareCopyAntennaName";
    v21 = 1024;
    v22 = 143;
    v23 = 2048;
    v24 = CFDataGetTypeID();
    v25 = 2048;
    v26 = CFGetTypeID(v3);
    _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
  }
  CFRelease(v3);
  return 0;
}

_DWORD *NFHardwareLoad(const char *a1)
{
  _DWORD *v2;
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOServiceNameMatching(a1);
  MatchingService = IOServiceGetMatchingService(v3, v4);
  *v2 = MatchingService;
  if (!MatchingService)
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Could not find service: %s", "NFHardwareLoad", 159, a1);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "NFHardwareLoad";
      v12 = 1024;
      v13 = 159;
      v14 = 2080;
      v15 = a1;
      _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
    }
    free(v2);
    return 0;
  }
  return v2;
}

void NFHardwareUnload(io_object_t *a1)
{
  io_object_t v2;
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *a1;
    if (v2 && IOObjectRelease(v2))
    {
      v3 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i Fail to release service", "NFHardwareUnload", 175);
      dispatch_get_specific(*v3);
      v5 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v7 = "NFHardwareUnload";
        v8 = 1024;
        v9 = 175;
        _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
      }
    }
    free(a1);
  }
}

BOOL NFHardwareHasFollowerReset(const char *a1)
{
  _BOOL8 v1;
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  CFTypeRef CFProperty;
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (strcmp(a1, "stockholm-spmi"))
    return 0;
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceNameMatching("stockholm-spmi");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareHasFollowerReset", 206);
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "NFHardwareHasFollowerReset";
      v13 = 1024;
      v14 = 206;
      _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  v5 = MatchingService;
  CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("spmiFollowerReset"), 0, 0);
  v1 = CFProperty != 0;
  if (CFProperty)
    CFRelease(CFProperty);
  IOObjectRelease(v5);
  return v1;
}

BOOL NFHardwareSupportedSecureTimersInOff()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  CFTypeRef CFProperty;
  _BOOL8 v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceNameMatching("stockholm");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("se-lpem-enabled"), 0, 0);
    v5 = CFProperty != 0;
    if (CFProperty)
      CFRelease(CFProperty);
    IOObjectRelease(v3);
  }
  else
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareSupportedSecureTimersInOff", 227);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "NFHardwareSupportedSecureTimersInOff";
      v12 = 1024;
      v13 = 227;
      _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v5;
}

uint64_t NFHardwareGetModelID(const char *a1)
{
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  CFTypeID v7;
  uint64_t v8;
  const void **v9;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = *MEMORY[0x24BDD8B18];
  v2 = IOServiceNameMatching(a1);
  MatchingService = IOServiceGetMatchingService(v1, v2);
  if (MatchingService)
  {
    v4 = MatchingService;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("nfccModel"), 0, 0);
    if (CFProperty)
    {
      v6 = CFProperty;
      v7 = CFGetTypeID(CFProperty);
      if (v7 == CFDataGetTypeID() && CFDataGetLength(v6))
        v8 = *CFDataGetBytePtr(v6);
      else
        v8 = 0;
      CFRelease(v6);
    }
    else
    {
      v8 = 0;
    }
    IOObjectRelease(v4);
  }
  else
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareGetModelID", 253);
    dispatch_get_specific(*v9);
    v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v14 = "NFHardwareGetModelID";
      v15 = 1024;
      v16 = 253;
      _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v8;
}

BOOL NFHardwareIsEos(const char *a1)
{
  return NFHardwareGetModelID(a1) - 209 < 3;
}

uint64_t NFHardwareAllowsVBATOff()
{
  return 1;
}

BOOL NFHardwareSkipSpmiReconfig(const char *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  const void **v5;
  io_object_t v6;
  CFTypeRef CFProperty;
  _BOOL8 v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  void (*v11)(uint64_t, const char *, ...);
  const char *v12;
  NSObject *v13;
  const char *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceNameMatching(a1);
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = (const void **)MEMORY[0x24BEDCDB0];
  if (MatchingService)
  {
    v6 = MatchingService;
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("skip-spmi-reconfig"), 0, 0);
    v8 = CFProperty != 0;
    if (CFProperty)
      CFRelease(CFProperty);
    IOObjectRelease(v6);
  }
  else
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed find IOKit service %s", "NFHardwareSkipSpmiReconfig", 293, a1);
    dispatch_get_specific(*v5);
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "NFHardwareSkipSpmiReconfig";
      v18 = 1024;
      v19 = 293;
      v20 = 2080;
      v21 = a1;
      _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service %s", buf, 0x1Cu);
    }
    v8 = 0;
  }
  dispatch_get_specific(*v5);
  v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v11)
  {
    if (v8)
      v12 = "not reconfigure";
    else
      v12 = "reconfigure";
    v11(6, "%s:%i Will %s spmi for %s", "NFHardwareSkipSpmiReconfig", 296, v12, a1);
  }
  dispatch_get_specific(*v5);
  v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v14 = "not reconfigure";
    else
      v14 = "reconfigure";
    *(_DWORD *)buf = 136446978;
    v17 = "NFHardwareSkipSpmiReconfig";
    v18 = 1024;
    v19 = 296;
    v20 = 2080;
    v21 = v14;
    v22 = 2080;
    v23 = a1;
    _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Will %s spmi for %s", buf, 0x26u);
  }
  return v8;
}

BOOL NFHardwareHasVirtualGPIO()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  CFTypeID v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  const __CFString *v9;
  const __CFString *v10;
  _BOOL8 v11;
  const void **v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  CFTypeID v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  _BOOL8 v19;
  CFTypeID TypeID;
  NSObject *v21;
  CFTypeID v22;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  CFTypeID v31;
  __int16 v32;
  CFTypeID v33;
  uint64_t v34;
  CFRange v35;

  v34 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceNameMatching("stockholm");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("required-gpios"), 0, 0);
    v5 = CFProperty;
    if (CFProperty && (v6 = CFGetTypeID(CFProperty), v6 == CFDataGetTypeID()))
    {
      BytePtr = CFDataGetBytePtr(v5);
      Length = CFDataGetLength(v5);
      v9 = CFStringCreateWithBytes(0, BytePtr, Length, 0x600u, 0);
      if (v9)
      {
        v10 = v9;
        v35.length = CFStringGetLength(v9);
        v35.location = 0;
        v11 = CFStringFindWithOptions(v10, CFSTR("support_virtual_gpio"), v35, 0, 0) != 0;
        CFRelease(v10);
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v12 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v14 = (void (*)(uint64_t, const char *, ...))Logger;
        if (v5)
          v15 = CFGetTypeID(v5);
        else
          v15 = -1;
        TypeID = CFStringGetTypeID();
        v14(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareHasVirtualGPIO", 324, "required-gpios", v15, TypeID);
      }
      dispatch_get_specific(*v12);
      v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        if (v5)
          v22 = CFGetTypeID(v5);
        else
          v22 = -1;
        *(_DWORD *)buf = 136447234;
        v25 = "NFHardwareHasVirtualGPIO";
        v26 = 1024;
        v27 = 324;
        v28 = 2080;
        v29 = "required-gpios";
        v30 = 2048;
        v31 = v22;
        v32 = 2048;
        v33 = CFStringGetTypeID();
        _os_log_impl(&dword_2295E9000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      v11 = 0;
      v19 = 0;
      if (!v5)
        goto LABEL_25;
    }
    CFRelease(v5);
    v19 = v11;
LABEL_25:
    IOObjectRelease(v3);
    return v19;
  }
  v16 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v17)
    v17(3, "%s:%i %s doesn't exist", "NFHardwareHasVirtualGPIO", 329, "stockholm");
  dispatch_get_specific(*v16);
  v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v25 = "NFHardwareHasVirtualGPIO";
    v26 = 1024;
    v27 = 329;
    v28 = 2080;
    v29 = "stockholm";
    _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i %s doesn't exist", buf, 0x1Cu);
  }
  return 0;
}

BOOL NFHardwareGPIOSetPower(uint64_t *a1, unsigned int a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetPower", 68, a2);
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "NFHardwareGPIOSetPower";
    v10 = 1024;
    v11 = 68;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 0, a2) == 0;
}

uint64_t _NFHardwareGPIOSetBoolean(uint64_t *a1, uint32_t selector, unsigned int a3)
{
  uint64_t v3;
  uint64_t v6;
  mach_port_t v7;
  uint64_t v8;
  const void **v9;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  uint64_t input;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint32_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  input = a3;
  if (a1)
  {
    v6 = *a1;
    v7 = *(_DWORD *)(*a1 + 4);
    if (v7)
    {
      *(_BYTE *)(v6 + 8) = 0;
      v8 = IOConnectCallScalarMethod(v7, selector, &input, 1u, 0, 0);
      if ((_DWORD)v8)
      {
        v9 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(3, "%s:%i selector=%d enable=%llu : Failed with %#x", "_NFHardwareGPIOSetBoolean", 56, selector, input, v8);
        dispatch_get_specific(*v9);
        v11 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447234;
          v21 = "_NFHardwareGPIOSetBoolean";
          v22 = 1024;
          v23 = 56;
          v24 = 1024;
          v25 = selector;
          v26 = 2048;
          v27 = input;
          v28 = 1024;
          v29 = v8;
          _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Failed with %#x", buf, 0x28u);
        }
        if ((_DWORD)v8 == -536870163)
        {
          *(_BYTE *)(*a1 + 8) = 1;
          return 3758097133;
        }
      }
    }
    else
    {
      v15 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
        v16(3, "%s:%i selector=%d enable=%llu : Not connected", "_NFHardwareGPIOSetBoolean", 48, selector, v3);
      dispatch_get_specific(*v15);
      v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v21 = "_NFHardwareGPIOSetBoolean";
        v22 = 1024;
        v23 = 48;
        v24 = 1024;
        v25 = selector;
        v26 = 2048;
        v27 = v3;
        _os_log_impl(&dword_2295E9000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Not connected", buf, 0x22u);
      }
      return 4294967294;
    }
  }
  else
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i Invalid parameter", "_NFHardwareGPIOSetBoolean", 43);
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "_NFHardwareGPIOSetBoolean";
      v22 = 1024;
      v23 = 43;
      _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid parameter", buf, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return v8;
}

BOOL NFHardwareGPIOSetVBAT(uint64_t *a1, unsigned int a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i VBAT enable=%d", "NFHardwareGPIOSetVBAT", 74, a2);
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "NFHardwareGPIOSetVBAT";
    v10 = 1024;
    v11 = 74;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i VBAT enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 5u, a2) == 0;
}

BOOL NFHardwareGPIOSetDownloadRequest(uint64_t *a1, unsigned int a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetDownloadRequest", 80, a2);
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "NFHardwareGPIOSetDownloadRequest";
    v10 = 1024;
    v11 = 80;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 1u, a2) == 0;
}

BOOL NFHardwareGPIOSetPMUStandbyPowerEnabled(uint64_t *a1, unsigned int a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetPMUStandbyPowerEnabled", 86, a2);
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v9 = "NFHardwareGPIOSetPMUStandbyPowerEnabled";
    v10 = 1024;
    v11 = 86;
    v12 = 1024;
    v13 = a2;
    _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return _NFHardwareGPIOSetBoolean(a1, 2u, a2) == 0;
}

BOOL NFHardwareGPIOSetDeviceWake(uint64_t *a1, unsigned int a2)
{
  os_unfair_lock_s *v4;
  int v5;

  v4 = *(os_unfair_lock_s **)(*a1 + 16);
  if (a2)
    v5 = 7;
  else
    v5 = 8;
  NFHardwareSerialDebugLog(v4, v5, 0, 0);
  return _NFHardwareGPIOSetBoolean(a1, 3u, a2) == 0;
}

uint64_t NFHardwareGPIOWasItSPMINack(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)a1 + 8);
}

uint64_t NFHardwareGPIOSPMIFollowerReset(uint64_t *a1)
{
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*a1 + 16), 10, 0, 0);
  return _NFHardwareGPIOSetBoolean(a1, 8u, 1u);
}

BOOL NFHardwareGPIOValidateSPMIConfig(uint64_t a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  mach_port_t v5;
  kern_return_t v6;
  kern_return_t v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  _BOOL8 result;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  void (*v16)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  kern_return_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NFHardwareGPIOValidateSPMIConfig", 114);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "NFHardwareGPIOValidateSPMIConfig";
    v19 = 1024;
    v20 = 114;
    _os_log_impl(&dword_2295E9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a1)
  {
    dispatch_get_specific(*v2);
    v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14)
      v14(3, "%s:%i Invalid parameter", "NFHardwareGPIOValidateSPMIConfig", 117);
    dispatch_get_specific(*v2);
    v15 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 136446466;
    v18 = "NFHardwareGPIOValidateSPMIConfig";
    v19 = 1024;
    v20 = 117;
    v11 = "%{public}s:%i Invalid parameter";
LABEL_20:
    v12 = v15;
    v13 = 18;
    goto LABEL_21;
  }
  v5 = *(_DWORD *)(*(_QWORD *)a1 + 4);
  if (!v5)
  {
    dispatch_get_specific(*v2);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i Not connected", "NFHardwareGPIOValidateSPMIConfig", 122);
    dispatch_get_specific(*v2);
    v15 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 136446466;
    v18 = "NFHardwareGPIOValidateSPMIConfig";
    v19 = 1024;
    v20 = 122;
    v11 = "%{public}s:%i Not connected";
    goto LABEL_20;
  }
  v6 = IOConnectCallScalarMethod(v5, 6u, 0, 0, 0, 0);
  if (!v6)
    return 1;
  v7 = v6;
  dispatch_get_specific(*v2);
  v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8)
    v8(3, "%s:%i Failed with %#x", "NFHardwareGPIOValidateSPMIConfig", 128, v7);
  dispatch_get_specific(*v2);
  v9 = NFSharedLogGetLogger();
  result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136446722;
    v18 = "NFHardwareGPIOValidateSPMIConfig";
    v19 = 1024;
    v20 = 128;
    v21 = 1024;
    v22 = v7;
    v11 = "%{public}s:%i Failed with %#x";
    v12 = v9;
    v13 = 24;
LABEL_21:
    _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  return result;
}

BOOL NFHardwareGPIOConfigureHammerfestSPMI(uint64_t a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  mach_port_t v5;
  kern_return_t v6;
  kern_return_t v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  _BOOL8 result;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  void (*v16)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  kern_return_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NFHardwareGPIOConfigureHammerfestSPMI", 140);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    v19 = 1024;
    v20 = 140;
    _os_log_impl(&dword_2295E9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a1)
  {
    dispatch_get_specific(*v2);
    v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14)
      v14(3, "%s:%i Invalid parameter", "NFHardwareGPIOConfigureHammerfestSPMI", 143);
    dispatch_get_specific(*v2);
    v15 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 136446466;
    v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    v19 = 1024;
    v20 = 143;
    v11 = "%{public}s:%i Invalid parameter";
LABEL_20:
    v12 = v15;
    v13 = 18;
    goto LABEL_21;
  }
  v5 = *(_DWORD *)(*(_QWORD *)a1 + 4);
  if (!v5)
  {
    dispatch_get_specific(*v2);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i Not connected", "NFHardwareGPIOConfigureHammerfestSPMI", 148);
    dispatch_get_specific(*v2);
    v15 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)buf = 136446466;
    v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    v19 = 1024;
    v20 = 148;
    v11 = "%{public}s:%i Not connected";
    goto LABEL_20;
  }
  v6 = IOConnectCallScalarMethod(v5, 7u, 0, 0, 0, 0);
  if (!v6)
    return 1;
  v7 = v6;
  dispatch_get_specific(*v2);
  v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8)
    v8(3, "%s:%i Failed with %#x", "NFHardwareGPIOConfigureHammerfestSPMI", 154, v7);
  dispatch_get_specific(*v2);
  v9 = NFSharedLogGetLogger();
  result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136446722;
    v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    v19 = 1024;
    v20 = 154;
    v21 = 1024;
    v22 = v7;
    v11 = "%{public}s:%i Failed with %#x";
    v12 = v9;
    v13 = 24;
LABEL_21:
    _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  return result;
}

void **NFHardwareGPIOOpen(int a1)
{
  void **v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  kern_return_t v10;
  kern_return_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  const void **v20;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v22;
  const void **v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = (void **)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (v2)
  {
    v3 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040D090CC53uLL);
    if (!v3)
    {
LABEL_28:
      free(v2);
      return 0;
    }
    v4 = v3;
    *v2 = v3;
    if (a1 == 1)
    {
      v6 = "AppleStockholmControl";
      v5 = 1;
    }
    else
    {
      if (a1 != 2)
      {
        v20 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(3, "%s:%i wrong GPIO driver type: %d", "NFHardwareGPIOOpen", 184, a1);
        dispatch_get_specific(*v20);
        v22 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_DWORD *)buf = 136446722;
        v28 = "NFHardwareGPIOOpen";
        v29 = 1024;
        v30 = 184;
        v31 = 1024;
        LODWORD(v32) = a1;
        v17 = "%{public}s:%i wrong GPIO driver type: %d";
        v18 = v22;
        v19 = 24;
        goto LABEL_26;
      }
      v5 = 0;
      v6 = "AppleHammerfestControl";
    }
    *((_QWORD *)v4 + 2) = NFHardwareSerialDebugger(v5);
    v7 = *MEMORY[0x24BDD8B18];
    v8 = IOServiceNameMatching(v6);
    MatchingService = IOServiceGetMatchingService(v7, v8);
    *(_DWORD *)v4 = MatchingService;
    if (!MatchingService)
    {
      v23 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v24)
        v24(3, "%s:%i Could not find service: %s", "NFHardwareGPIOOpen", 194, v6);
      dispatch_get_specific(*v23);
      v25 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      *(_DWORD *)buf = 136446722;
      v28 = "NFHardwareGPIOOpen";
      v29 = 1024;
      v30 = 194;
      v31 = 2080;
      v32 = v6;
      v17 = "%{public}s:%i Could not find service: %s";
      v18 = v25;
      v19 = 28;
      goto LABEL_26;
    }
    v10 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)v4 + 1);
    if (v10)
    {
      v11 = v10;
      v12 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v13)
        v13(3, "%s:%i Could not open service (%#x)", "NFHardwareGPIOOpen", 205, v11);
      dispatch_get_specific(*v12);
      v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v28 = "NFHardwareGPIOOpen";
        v29 = 1024;
        v30 = 205;
        v31 = 1024;
        LODWORD(v32) = v11;
        _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not open service (%#x)", buf, 0x18u);
      }
      if (!IOObjectRelease(*(_DWORD *)v4))
        goto LABEL_27;
      dispatch_get_specific(*v12);
      v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15)
        v15(3, "%s:%i Fail to release service", "NFHardwareGPIOOpen", 207);
      dispatch_get_specific(*v12);
      v16 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      *(_DWORD *)buf = 136446466;
      v28 = "NFHardwareGPIOOpen";
      v29 = 1024;
      v30 = 207;
      v17 = "%{public}s:%i Fail to release service";
      v18 = v16;
      v19 = 18;
LABEL_26:
      _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
LABEL_27:
      free(*v2);
      goto LABEL_28;
    }
  }
  return v2;
}

void NFHardwareGPIOClose(uint64_t *a1)
{
  uint64_t v2;
  io_object_t *v3;
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  const void **v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = MGGetProductType();
    if (v2 == 3402870384 || v2 == 896202454)
    {
      NFHardwareGPIOSetPower(a1, 1u);
      usleep(0x7D0u);
    }
    v3 = (io_object_t *)*a1;
    if (*(_DWORD *)(*a1 + 4))
    {
      if (IOConnectRelease(*(_DWORD *)(*a1 + 4)))
      {
        v4 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(3, "%s:%i Fail to release connection", "NFHardwareGPIOClose", 239);
        dispatch_get_specific(*v4);
        v6 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v11 = "NFHardwareGPIOClose";
          v12 = 1024;
          v13 = 239;
          _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release connection", buf, 0x12u);
        }
      }
      v3 = (io_object_t *)*a1;
      *(_DWORD *)(*a1 + 4) = 0;
    }
    if (*v3)
    {
      if (IOObjectRelease(*v3))
      {
        v7 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v8)
          v8(3, "%s:%i Fail to release service", "NFHardwareGPIOClose", 246);
        dispatch_get_specific(*v7);
        v9 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v11 = "NFHardwareGPIOClose";
          v12 = 1024;
          v13 = 246;
          _os_log_impl(&dword_2295E9000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
        }
      }
      v3 = (io_object_t *)*a1;
      *(_DWORD *)*a1 = 0;
    }
    free(v3);
    free(a1);
  }
}

uint64_t NFHardwareGPIOIsHostWakeCapable()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  CFTypeID v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  const __CFString *v9;
  CFIndex v10;
  CFIndex v11;
  int v12;
  uint64_t v13;
  const void **v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  CFTypeID v17;
  const void **v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  CFTypeID TypeID;
  NSObject *v22;
  CFTypeID v23;
  const __CFDictionary *v24;
  io_service_t v25;
  io_object_t v26;
  const __CFData *v27;
  const __CFData *v28;
  CFTypeID v29;
  const UInt8 *v30;
  CFIndex v31;
  const __CFString *v32;
  CFIndex v33;
  int v34;
  const void **v35;
  uint64_t v36;
  void (*v37)(uint64_t, const char *, ...);
  CFTypeID v38;
  CFTypeID v39;
  NSObject *v40;
  CFTypeID v41;
  CFTypeID v42;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  CFTypeID v51;
  __int16 v52;
  CFTypeID v53;
  uint64_t v54;
  CFRange v55;
  CFRange v56;
  CFRange v57;

  v54 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceNameMatching("stockholm");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("required-gpios"), 0, 0);
    v5 = CFProperty;
    if (CFProperty && (v6 = CFGetTypeID(CFProperty), v6 == CFDataGetTypeID()))
    {
      BytePtr = CFDataGetBytePtr(v5);
      Length = CFDataGetLength(v5);
      v9 = CFStringCreateWithBytes(0, BytePtr, Length, 0x600u, 0);
      v10 = CFStringGetLength(v9);
      if (!v9)
        goto LABEL_15;
      v11 = v10;
      v55.location = 0;
      v55.length = v10;
      v12 = CFStringFindWithOptions(v9, CFSTR("support_wake_stockholm_soc"), v55, 0, 0);
      v56.location = 0;
      v56.length = v11;
      LODWORD(v11) = CFStringFindWithOptions(v9, CFSTR("support_wake_stockholm"), v56, 0, 0) | v12;
      CFRelease(v9);
      if ((_DWORD)v11)
        v13 = 1;
      else
LABEL_15:
        v13 = 0;
      CFRelease(v5);
    }
    else
    {
      v14 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v16 = (void (*)(uint64_t, const char *, ...))Logger;
        if (v5)
          v17 = CFGetTypeID(v5);
        else
          v17 = -1;
        TypeID = CFStringGetTypeID();
        v16(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareGPIOIsHostWakeCapable", 285, "required-gpios", v17, TypeID);
      }
      dispatch_get_specific(*v14);
      v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        if (v5)
          v23 = CFGetTypeID(v5);
        else
          v23 = -1;
        *(_DWORD *)buf = 136447234;
        v45 = "NFHardwareGPIOIsHostWakeCapable";
        v46 = 1024;
        v47 = 285;
        v48 = 2080;
        v49 = "required-gpios";
        v50 = 2048;
        v51 = v23;
        v52 = 2048;
        v53 = CFStringGetTypeID();
        _os_log_impl(&dword_2295E9000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      if (v5)
        CFRelease(v5);
      v13 = 0;
    }
    IOObjectRelease(v3);
  }
  else
  {
    v18 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19)
      v19(3, "%s:%i stockholm doesn't exist", "NFHardwareGPIOIsHostWakeCapable", 290);
    dispatch_get_specific(*v18);
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v45 = "NFHardwareGPIOIsHostWakeCapable";
      v46 = 1024;
      v47 = 290;
      _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i stockholm doesn't exist", buf, 0x12u);
    }
    v13 = 0;
  }
  v24 = IOServiceNameMatching("stockholm-spmi");
  v25 = IOServiceGetMatchingService(v0, v24);
  if (v25)
  {
    v26 = v25;
    v27 = (const __CFData *)IORegistryEntryCreateCFProperty(v25, CFSTR("required-functions"), 0, 0);
    v28 = v27;
    if (v27 && (v29 = CFGetTypeID(v27), v29 == CFDataGetTypeID()))
    {
      v30 = CFDataGetBytePtr(v28);
      v31 = CFDataGetLength(v28);
      v32 = CFStringCreateWithBytes(0, v30, v31, 0x600u, 0);
      v33 = CFStringGetLength(v32);
      if (v32)
      {
        v57.length = v33;
        v57.location = 0;
        v34 = CFStringFindWithOptions(v32, CFSTR("support_host_wake_spmi"), v57, 0, 0);
        CFRelease(v32);
        if (v34)
          v13 = 1;
      }
    }
    else
    {
      v35 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v36 = NFLogGetLogger();
      if (v36)
      {
        v37 = (void (*)(uint64_t, const char *, ...))v36;
        if (v28)
          v38 = CFGetTypeID(v28);
        else
          v38 = -1;
        v39 = CFStringGetTypeID();
        v37(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareGPIOIsHostWakeCapable", 313, "required-functions", v38, v39);
      }
      dispatch_get_specific(*v35);
      v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        if (v28)
          v41 = CFGetTypeID(v28);
        else
          v41 = -1;
        v42 = CFStringGetTypeID();
        *(_DWORD *)buf = 136447234;
        v45 = "NFHardwareGPIOIsHostWakeCapable";
        v46 = 1024;
        v47 = 313;
        v48 = 2080;
        v49 = "required-functions";
        v50 = 2048;
        v51 = v41;
        v52 = 2048;
        v53 = v42;
        _os_log_impl(&dword_2295E9000, v40, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      if (!v28)
        goto LABEL_46;
    }
    CFRelease(v28);
LABEL_46:
    IOObjectRelease(v26);
  }
  return v13;
}

uint64_t NFHardwareSerialGetDefaultInterfaceType()
{
  io_object_t MatchingService;
  const void **v1;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v3;
  uint64_t result;
  io_object_t v5;
  unsigned int v6;
  io_registry_entry_t v8;
  io_object_t v9;
  kern_return_t v10;
  BOOL v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  BOOL v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  const __CFBoolean *Value;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  properties = 0;
  MatchingService = _NFHardwareFindMatchingService("AppleStockholmControl", "nfc,primary,gpio");
  if (!MatchingService)
  {
    v1 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i Could not find service, trying slow path: %s", "NFHardwareSerialGetDefaultInterfaceType", 437, "AppleStockholmControl");
    dispatch_get_specific(*v1);
    v3 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "NFHardwareSerialGetDefaultInterfaceType";
      v24 = 1024;
      v25 = 437;
      v26 = 2080;
      v27 = "AppleStockholmControl";
      _os_log_impl(&dword_2295E9000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service, trying slow path: %s", buf, 0x1Cu);
    }
    _NFHardwareDumpIOKit();
    result = _NFHardwareLookInTree("nfc,primary,gpio");
    if (!(_DWORD)result)
      return result;
    MatchingService = result;
    v5 = _NFHardwareFindMatchingService("AppleStockholmControl", "nfc,primary,gpio");
    if (v5)
      goto LABEL_12;
    v6 = 100;
    do
    {
      usleep(0x186A0u);
      v5 = _NFHardwareFindMatchingService("AppleStockholmControl", "nfc,primary,gpio");
      if (v5)
        break;
    }
    while (v6-- > 1);
    if (v5)
LABEL_12:
      IOObjectRelease(v5);
  }
  IOObjectRelease(MatchingService);
  v8 = _NFHardwareFindMatchingService("AppleStockholmSPMI", "nfc,primary,spmi");
  if (v8)
  {
    v9 = v8;
    v10 = IORegistryEntryCreateCFProperties(v8, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (v10)
      v11 = 1;
    else
      v11 = properties == 0;
    if (v11)
    {
      v12 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v13)
        v13(6, "%s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", "NFHardwareSerialGetDefaultInterfaceType", 461, v10);
      dispatch_get_specific(*v12);
      v14 = NFSharedLogGetLogger();
      v15 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      *(_DWORD *)buf = 136446722;
      v23 = "NFHardwareSerialGetDefaultInterfaceType";
      v24 = 1024;
      v25 = 461;
      v26 = 1024;
      LODWORD(v27) = v10;
      _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
    }
    else if (CFDictionaryContainsKey(properties, CFSTR("stockholm-spmi-data-socket")))
    {
      Value = (const __CFBoolean *)CFDictionaryGetValue(properties, CFSTR("stockholm-spmi-data-socket"));
      v15 = CFBooleanGetValue(Value) != 0;
LABEL_31:
      if (properties)
      {
        CFRelease(properties);
        properties = 0;
      }
      IOObjectRelease(v9);
      if (v15)
        return 3;
      else
        return 2;
    }
    v15 = 0;
    goto LABEL_31;
  }
  v16 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v17)
    v17(6, "%s:%i Could not find service: %s", "NFHardwareSerialGetDefaultInterfaceType", 453, "AppleStockholmSPMI");
  dispatch_get_specific(*v16);
  v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v23 = "NFHardwareSerialGetDefaultInterfaceType";
    v24 = 1024;
    v25 = 453;
    v26 = 2080;
    v27 = "AppleStockholmSPMI";
    _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
  }
  IOObjectRelease(0);
  return 1;
}

uint64_t _NFHardwareFindMatchingService(const char *a1, const char *a2)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  CFStringRef v6;
  CFStringRef v7;
  __CFDictionary *v8;
  const __CFDictionary *v9;
  kern_return_t MatchingServices;
  kern_return_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const void **v18;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v20;
  const void **v21;
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  const char *v24;
  const void **v25;
  void (*v26)(uint64_t, const char *, ...);
  uint64_t v27;
  const void **v29;
  void (*v30)(uint64_t, const char *, ...);
  NSObject *v31;
  const void **v32;
  void (*v33)(uint64_t, const char *, ...);
  io_iterator_t existing;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  kern_return_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v18 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to create property matching dictionary", "_NFHardwareFindMatchingService", 358);
    dispatch_get_specific(*v18);
    v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v36 = "_NFHardwareFindMatchingService";
    v37 = 1024;
    v38 = 358;
    v15 = "%{public}s:%i Failed to create property matching dictionary";
LABEL_13:
    v16 = v20;
    v17 = 18;
LABEL_14:
    _os_log_impl(&dword_2295E9000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    return 0;
  }
  v5 = Mutable;
  v6 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v6)
  {
    v21 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22)
      v22(3, "%s:%i Failed to create CF property string", "_NFHardwareFindMatchingService", 363);
    dispatch_get_specific(*v21);
    v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 136446466;
    v36 = "_NFHardwareFindMatchingService";
    v37 = 1024;
    v38 = 363;
    v24 = "%{public}s:%i Failed to create CF property string";
    goto LABEL_23;
  }
  v7 = v6;
  CFDictionarySetValue(v5, CFSTR("IONameMatched"), v6);
  CFRelease(v7);
  v8 = IOServiceMatching(a1);
  if (!v8)
  {
    v25 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26)
      v26(3, "%s:%i Failed to create matching dictionary", "_NFHardwareFindMatchingService", 372);
    dispatch_get_specific(*v25);
    v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 136446466;
    v36 = "_NFHardwareFindMatchingService";
    v37 = 1024;
    v38 = 372;
    v24 = "%{public}s:%i Failed to create matching dictionary";
LABEL_23:
    _os_log_impl(&dword_2295E9000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
LABEL_24:
    CFRelease(v5);
    return 0;
  }
  v9 = v8;
  CFDictionarySetValue(v8, CFSTR("IOPropertyMatch"), v5);
  CFRelease(v5);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], v9, &existing);
  if (MatchingServices)
  {
    v11 = MatchingServices;
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i Failed to lookup service : 0x%x", "_NFHardwareFindMatchingService", 397, v11);
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446722;
    v36 = "_NFHardwareFindMatchingService";
    v37 = 1024;
    v38 = 397;
    v39 = 1024;
    v40 = v11;
    v15 = "%{public}s:%i Failed to lookup service : 0x%x";
    v16 = v14;
    v17 = 24;
    goto LABEL_14;
  }
  if (!existing || !IOIteratorIsValid(existing))
  {
    v32 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v33)
      v33(3, "%s:%i Failed to get iterator for service", "_NFHardwareFindMatchingService", 389);
    dispatch_get_specific(*v32);
    v20 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v36 = "_NFHardwareFindMatchingService";
    v37 = 1024;
    v38 = 389;
    v15 = "%{public}s:%i Failed to get iterator for service";
    goto LABEL_13;
  }
  v27 = IOIteratorNext(existing);
  if (!existing || !IOIteratorIsValid(existing))
  {
    v29 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30)
      v30(3, "%s:%i Failed to get valid iterator for service", "_NFHardwareFindMatchingService", 393);
    dispatch_get_specific(*v29);
    v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v36 = "_NFHardwareFindMatchingService";
      v37 = 1024;
      v38 = 393;
      _os_log_impl(&dword_2295E9000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get valid iterator for service", buf, 0x12u);
    }
  }
  return v27;
}

void _NFHardwareDumpIOKit()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  void (*v6)(uint64_t, const char *, ...);
  NSObject *v7;
  const __CFDictionary *v8;
  io_service_t v9;
  void (*v10)(uint64_t, const char *, ...);
  NSObject *v11;
  const __CFDictionary *v12;
  io_service_t v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  const __CFDictionary *v16;
  io_service_t v17;
  void (*v18)(uint64_t, const char *, ...);
  NSObject *v19;
  const __CFDictionary *v20;
  io_service_t v21;
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  io_service_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ----------------------- IOService plane --------------------------", "_NFHardwareDumpIOKit", 316);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "_NFHardwareDumpIOKit";
    v28 = 1024;
    v29 = 316;
    _os_log_impl(&dword_2295E9000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
  }
  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOServiceNameMatching("stockholm");
  MatchingService = IOServiceGetMatchingService(v3, v4);
  dispatch_get_specific(*v0);
  v6 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v6)
    v6(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 318, "stockholm", MatchingService);
  dispatch_get_specific(*v0);
  v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "_NFHardwareDumpIOKit";
    v28 = 1024;
    v29 = 318;
    v30 = 2080;
    v31 = "stockholm";
    v32 = 1024;
    v33 = MatchingService;
    _os_log_impl(&dword_2295E9000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(MatchingService);
  v8 = IOServiceNameMatching("stockholm-spmi");
  v9 = IOServiceGetMatchingService(v3, v8);
  dispatch_get_specific(*v0);
  v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v10)
    v10(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 322, "stockholm-spmi", v9);
  dispatch_get_specific(*v0);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "_NFHardwareDumpIOKit";
    v28 = 1024;
    v29 = 322;
    v30 = 2080;
    v31 = "stockholm-spmi";
    v32 = 1024;
    v33 = v9;
    _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v9);
  v12 = IOServiceNameMatching("AppleStockholmSPMI");
  v13 = IOServiceGetMatchingService(v3, v12);
  dispatch_get_specific(*v0);
  v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v14)
    v14(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 326, "AppleStockholmSPMI", v13);
  dispatch_get_specific(*v0);
  v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "_NFHardwareDumpIOKit";
    v28 = 1024;
    v29 = 326;
    v30 = 2080;
    v31 = "AppleStockholmSPMI";
    v32 = 1024;
    v33 = v13;
    _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v13);
  v16 = IOServiceNameMatching("AppleStockholmControl");
  v17 = IOServiceGetMatchingService(v3, v16);
  dispatch_get_specific(*v0);
  v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v18)
    v18(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 330, "AppleStockholmControl", v17);
  dispatch_get_specific(*v0);
  v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "_NFHardwareDumpIOKit";
    v28 = 1024;
    v29 = 330;
    v30 = 2080;
    v31 = "AppleStockholmControl";
    v32 = 1024;
    v33 = v17;
    _os_log_impl(&dword_2295E9000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v17);
  v20 = IOServiceNameMatching("AppleStockholmControlUserClient");
  v21 = IOServiceGetMatchingService(v3, v20);
  dispatch_get_specific(*v0);
  v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v22)
    v22(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 334, "AppleStockholmControlUserClient", v21);
  dispatch_get_specific(*v0);
  v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "_NFHardwareDumpIOKit";
    v28 = 1024;
    v29 = 334;
    v30 = 2080;
    v31 = "AppleStockholmControlUserClient";
    v32 = 1024;
    v33 = v21;
    _os_log_impl(&dword_2295E9000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v21);
  dispatch_get_specific(*v0);
  v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v24)
    v24(6, "%s:%i ----------------------- IOService plane --------------------------", "_NFHardwareDumpIOKit", 338);
  dispatch_get_specific(*v0);
  v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "_NFHardwareDumpIOKit";
    v28 = 1024;
    v29 = 338;
    _os_log_impl(&dword_2295E9000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
  }
  _NFHardwarePrintNode("stockholm");
  _NFHardwarePrintNode("stockholm-spmi");
  _NFHardwarePrintNode("AppleStockholmSPMI");
  _NFHardwarePrintNode("AppleStockholmControl");
  _NFHardwarePrintNode("AppleStockholmControlUserClient");
  _NFHardwarePrintNode("hammerfest");
  _NFHardwarePrintNode("AppleHammerfestSPMI");
  _NFHardwarePrintNode("AppleHammerfestControl");
}

uint64_t _NFHardwareLookInTree(const char *a1)
{
  uint64_t RootEntry;
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint64_t v6;
  io_object_t object;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  object = 0;
  RootEntry = IORegistryGetRootEntry(*MEMORY[0x24BDD8B18]);
  if (MEMORY[0x22E2CD0FC](RootEntry, "IOService", 1, &object))
  {
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to create iterator", "_NFHardwareLookInTree", 302);
    dispatch_get_specific(*v3);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "_NFHardwareLookInTree";
      v11 = 1024;
      v12 = 302;
      _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create iterator", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    v6 = _NFHardwareWalkTree(object, a1);
    IOObjectRelease(object);
  }
  return v6;
}

BOOL NFHardwareSerialIsHammerfestAlive()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  io_registry_entry_t MatchingService;
  io_object_t v4;
  kern_return_t v5;
  BOOL v6;
  void (*v7)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  _BOOL8 v11;
  const __CFBoolean *Value;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NFHardwareSerialIsHammerfestAlive", 491);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "NFHardwareSerialIsHammerfestAlive";
    v18 = 1024;
    v19 = 491;
    _os_log_impl(&dword_2295E9000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  MatchingService = _NFHardwareFindMatchingService("AppleStockholmSPMI", "nfc,secondary,spmi");
  v4 = MatchingService;
  if (MatchingService)
  {
    properties = 0;
    v5 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (v5)
      v6 = 1;
    else
      v6 = properties == 0;
    if (v6)
    {
      dispatch_get_specific(*v0);
      v7 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v7)
        v7(3, "%s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", "NFHardwareSerialIsHammerfestAlive", 506, v5);
      dispatch_get_specific(*v0);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v17 = "NFHardwareSerialIsHammerfestAlive";
        v18 = 1024;
        v19 = 506;
        v20 = 1024;
        LODWORD(v21) = v5;
        _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
      }
    }
    else if (CFDictionaryContainsKey(properties, CFSTR("hammerfest-data-available-event")))
    {
      Value = (const __CFBoolean *)CFDictionaryGetValue(properties, CFSTR("hammerfest-data-available-event"));
      v11 = CFBooleanGetValue(Value) != 0;
      goto LABEL_22;
    }
    v11 = 0;
LABEL_22:
    if (properties)
      CFRelease(properties);
    goto LABEL_24;
  }
  dispatch_get_specific(*v0);
  v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v9)
    v9(6, "%s:%i Could not find service: %s", "NFHardwareSerialIsHammerfestAlive", 498, "AppleHammerfestSPMI");
  dispatch_get_specific(*v0);
  v10 = NFSharedLogGetLogger();
  v11 = 0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v17 = "NFHardwareSerialIsHammerfestAlive";
    v18 = 1024;
    v19 = 498;
    v20 = 2080;
    v21 = "AppleHammerfestSPMI";
    _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
    v11 = 0;
  }
LABEL_24:
  IOObjectRelease(v4);
  return v11;
}

uint64_t NFHardwareSerialIsSupported(const char *a1)
{
  const char *v1;
  uint64_t result;
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = "nfc,primary,gpio";
  if (a1 && strcasestr(a1, "hammerfest"))
    v1 = "nfc,secondary,gpio";
  LODWORD(result) = _NFHardwareFindMatchingService("AppleStockholmControl", v1);
  if ((_DWORD)result)
    goto LABEL_10;
  v3 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i Could not find service with: %s, retrying slow path", "NFHardwareSerialIsSupported", 534, v1);
  dispatch_get_specific(*v3);
  v5 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v7 = "NFHardwareSerialIsSupported";
    v8 = 1024;
    v9 = 534;
    v10 = 2080;
    v11 = v1;
    _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service with: %s, retrying slow path", buf, 0x1Cu);
  }
  _NFHardwareDumpIOKit();
  result = _NFHardwareLookInTree(v1);
  if ((_DWORD)result)
  {
LABEL_10:
    IOObjectRelease(result);
    return 1;
  }
  return result;
}

uint64_t NFHardwareSerialReadBlockAbort(uint64_t a1)
{
  uint64_t v2;
  const void **v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  uint64_t ElapsedTimeInMillisecondsFromMachTime;
  NSObject *v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*(_QWORD *)(a1 + 8) + 88), 4, 0, 0);
  v2 = *(_QWORD *)(a1 + 8);
  if (!*(_DWORD *)(v2 + 120))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 112));
    ++*(_DWORD *)(*(_QWORD *)(a1 + 8) + 120);
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v5 = (void (*)(uint64_t, const char *, ...))Logger;
      mach_continuous_time();
      ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v5(6, "%s:%i Read aborted while in progress since %llu.", "NFHardwareSerialReadBlockAbort", 600, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v3);
    v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mach_continuous_time();
      *(_DWORD *)buf = 136446722;
      v10 = "NFHardwareSerialReadBlockAbort";
      v11 = 1024;
      v12 = 600;
      v13 = 2048;
      v14 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_2295E9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Read aborted while in progress since %llu.", buf, 0x1Cu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 128) = 0;
  }
  return 0;
}

uint64_t NFHardwareSerialWriteBlockAbort(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*(_QWORD *)(a1 + 8) + 88), 6, 0, 0);
  v2 = *(_QWORD *)(a1 + 8);
  if (!*(_DWORD *)(v2 + 144))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 136));
    v3 = *(_QWORD *)(a1 + 8);
    ++*(_DWORD *)(v3 + 144);
    *(_QWORD *)(v3 + 152) = 0;
    *(_QWORD *)(v3 + 160) = 0;
    *(_DWORD *)(v3 + 168) = 0;
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i Write aborted while in progress.", "NFHardwareSerialWriteBlockAbort", 618);
    dispatch_get_specific(*v4);
    v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v9 = "NFHardwareSerialWriteBlockAbort";
      v10 = 1024;
      v11 = 618;
      _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Write aborted while in progress.", buf, 0x12u);
    }
  }
  return 0;
}

uint64_t NFHardwareSerialReadBlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  const void **v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  uint64_t ElapsedTimeInMillisecondsFromMachTime;
  NSObject *v15;
  _QWORD handler[8];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 1;
  v5 = *(_QWORD *)(a1 + 8);
  if (*(_DWORD *)(v5 + 120))
  {
    v6 = *(NSObject **)(v5 + 112);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __NFHardwareSerialReadBlock_block_invoke;
    handler[3] = &unk_24F259340;
    handler[6] = a1;
    handler[7] = a2;
    handler[4] = a4;
    handler[5] = a3;
    dispatch_source_set_event_handler(v6, handler);
    v7 = *(_QWORD *)(a1 + 8);
    v8 = *(_DWORD *)(v7 + 120);
    if (v8)
    {
      *(_DWORD *)(v7 + 120) = v8 - 1;
      v9 = mach_continuous_time();
      v7 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(v7 + 128) = v9;
    }
    dispatch_resume(*(dispatch_object_t *)(v7 + 112));
    return 0;
  }
  else
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      mach_continuous_time();
      ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v13(3, "%s:%i Error : read in progress since %llu", "NFHardwareSerialReadBlock", 660, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v11);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      mach_continuous_time();
      *(_DWORD *)buf = 136446722;
      v18 = "NFHardwareSerialReadBlock";
      v19 = 1024;
      v20 = 660;
      v21 = 2048;
      v22 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_2295E9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Error : read already in progress.", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t NFHardwareSerialWriteBlock(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  const void **v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  uint64_t v14;
  void (*v15)(_QWORD, uint64_t, const char *, char *, unint64_t);
  void (*v18)(_QWORD, uint64_t, const char *, char *, unint64_t);
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const void **v22;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v24;
  const void **v25;
  void (*v26)(uint64_t, const char *, ...);
  const void **v27;
  void (*v28)(uint64_t, const char *, ...);
  const void **v29;
  void (*v30)(uint64_t, const char *, ...);
  const void **v31;
  void (*v32)(uint64_t, const char *, ...);
  _QWORD handler[6];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 1;
  if (!a2)
  {
    v22 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 712, "buffer!=((void *)0)");
    dispatch_get_specific(*v22);
    v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    v36 = 1024;
    v37 = 712;
    v38 = 2080;
    v39 = "buffer!=((void *)0)";
LABEL_42:
    _os_log_impl(&dword_2295E9000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    goto LABEL_43;
  }
  if (!a3)
  {
    v25 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26)
      v26(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 713, "length!=0");
    dispatch_get_specific(*v25);
    v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    v36 = 1024;
    v37 = 713;
    v38 = 2080;
    v39 = "length!=0";
    goto LABEL_42;
  }
  v7 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(v7 + 152))
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v9)
      v9(3, "%s:%i Failed to write, buffer already pending TX. Bytes left = %zu, bytes written = %d, suspend state = %d", "NFHardwareSerialWriteBlock", 717, *(_QWORD *)(*(_QWORD *)(a1 + 8) + 160), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 168), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 144));
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 8);
      v12 = *(const char **)(v11 + 160);
      v13 = *(_DWORD *)(v11 + 168);
      LODWORD(v11) = *(_DWORD *)(v11 + 144);
      *(_DWORD *)buf = 136447234;
      v35 = "NFHardwareSerialWriteBlock";
      v36 = 1024;
      v37 = 717;
      v38 = 2048;
      v39 = v12;
      v40 = 1024;
      v41 = v13;
      v42 = 1024;
      v43 = v11;
      _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write, buffer already pending TX. Bytes left = %zu, bytes written = %d, suspend state = %d", buf, 0x28u);
    }
    v14 = *(_QWORD *)(a1 + 8);
    v15 = *(void (**)(_QWORD, uint64_t, const char *, char *, unint64_t))(v14 + 80);
    if (v15)
      v15(*(unsigned __int8 *)(v14 + 96), 7, "[TX>] Failed : Busy", a2, a3);
    return 0xFFFFFFFFLL;
  }
  v18 = *(void (**)(_QWORD, uint64_t, const char *, char *, unint64_t))(v7 + 80);
  if (v18)
  {
    v18(*(unsigned __int8 *)(v7 + 96), 7, "[TX>]", a2, a3);
    v7 = *(_QWORD *)(a1 + 8);
  }
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v7 + 88), 5, a2, a3);
  v19 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(v19 + 152))
  {
    v27 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v28)
      v28(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 728, "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBuffer == ((void *)0)");
    dispatch_get_specific(*v27);
    v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    v36 = 1024;
    v37 = 728;
    v38 = 2080;
    v39 = "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBuffer == ((void *)0)";
    goto LABEL_42;
  }
  if (*(_QWORD *)(v19 + 160))
  {
    v29 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30)
      v30(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 729, "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBufferSize == 0");
    dispatch_get_specific(*v29);
    v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    v36 = 1024;
    v37 = 729;
    v38 = 2080;
    v39 = "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBufferSize == 0";
    goto LABEL_42;
  }
  if (*(_DWORD *)(v19 + 144) != 1)
  {
    v31 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v32)
      v32(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 730, "((NFHardwareSerialInternal*)(serial->internal))->suspendWriteCount == 1");
    dispatch_get_specific(*v31);
    v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "NFHardwareSerialWriteBlock";
      v36 = 1024;
      v37 = 730;
      v38 = 2080;
      v39 = "((NFHardwareSerialInternal*)(serial->internal))->suspendWriteCount == 1";
      goto LABEL_42;
    }
LABEL_43:
    abort();
  }
  *(_QWORD *)(v19 + 152) = a2;
  *(_QWORD *)(v19 + 160) = a3;
  *(_DWORD *)(v19 + 168) = 0;
  v20 = *(NSObject **)(v19 + 136);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __NFHardwareSerialWriteBlock_block_invoke;
  handler[3] = &unk_24F259368;
  handler[4] = a4;
  handler[5] = a1;
  dispatch_source_set_event_handler(v20, handler);
  v21 = *(_QWORD *)(a1 + 8);
  if (*(_DWORD *)(v21 + 144))
  {
    *(_DWORD *)(v21 + 144) = 0;
    dispatch_resume(*(dispatch_object_t *)(v21 + 136));
  }
  return 0;
}

uint64_t NFHardwareSerialFlush(int *a1)
{
  uint64_t v2;
  ssize_t v3;
  const void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, const char *, ...);
  int *v7;
  char *v8;
  int *v9;
  NSObject *v10;
  int *v11;
  char *v12;
  int v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  const void **v17;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v19;
  uint64_t v20;
  const void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  uint64_t ElapsedTimeInMillisecondsFromMachTime;
  NSObject *v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)a1 + 1);
  if (*(_BYTE *)(v2 + 97))
  {
    _NFHardwareSerialSetNonBlock(a1, 1);
    goto LABEL_5;
  }
  if (*(_DWORD *)(v2 + 120))
  {
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &__block_literal_global);
    dispatch_resume(*(dispatch_object_t *)(v2 + 112));
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 112));
    dispatch_release(*(dispatch_object_t *)(v2 + 112));
    *(_QWORD *)(v2 + 112) = 0;
    while (1)
    {
LABEL_5:
      while (1)
      {
        v3 = read(*a1, &v27, 1uLL);
        if (v3 < 0)
          break;
        if (!v3)
        {
          v17 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger)
            Logger(3, "%s:%i Unexpected result", "NFHardwareSerialFlush", 815);
          dispatch_get_specific(*v17);
          v19 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v29 = "NFHardwareSerialFlush";
            v30 = 1024;
            v31 = 815;
            v14 = "%{public}s:%i Unexpected result";
            v15 = v19;
            v16 = 18;
LABEL_18:
            _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
          }
          goto LABEL_19;
        }
      }
      if (*__error() == 35)
        break;
      if (*__error() != 4)
      {
        v4 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v5 = NFLogGetLogger();
        if (v5)
        {
          v6 = (void (*)(uint64_t, const char *, ...))v5;
          v7 = __error();
          v8 = strerror(*v7);
          v9 = __error();
          v6(3, "%s:%i \"%s\" errno=%d ", "NFHardwareSerialFlush", 809, v8, *v9);
        }
        dispatch_get_specific(*v4);
        v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = __error();
          v12 = strerror(*v11);
          v13 = *__error();
          *(_DWORD *)buf = 136446978;
          v29 = "NFHardwareSerialFlush";
          v30 = 1024;
          v31 = 809;
          v32 = 2080;
          v33 = (uint64_t)v12;
          v34 = 1024;
          v35 = v13;
          v14 = "%{public}s:%i \"%s\" errno=%d ";
          v15 = v10;
          v16 = 34;
          goto LABEL_18;
        }
LABEL_19:
        v20 = 0;
        goto LABEL_21;
      }
    }
    v20 = 1;
LABEL_21:
    if (*(_BYTE *)(v2 + 97))
    {
      _NFHardwareSerialSetNonBlock(a1, 0);
    }
    else if (!*(_QWORD *)(v2 + 112))
    {
      *(_QWORD *)(v2 + 112) = dispatch_source_create(MEMORY[0x24BDACA00], *a1, 0, *(dispatch_queue_t *)(v2 + 104));
      dispatch_set_qos_class_fallback();
      dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &__block_literal_global_38);
      dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v2 + 112), &__block_literal_global_42);
      dispatch_activate(*(dispatch_object_t *)(v2 + 112));
      dispatch_suspend(*(dispatch_object_t *)(v2 + 112));
      *(_DWORD *)(v2 + 120) = 1;
      *(_QWORD *)(*((_QWORD *)a1 + 1) + 128) = 0;
    }
    NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v2 + 88), 9, 0, 0);
  }
  else
  {
    v22 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v23 = NFLogGetLogger();
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      mach_continuous_time();
      ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v24(3, "%s:%i Error : read in progress since %llu", "NFHardwareSerialFlush", 779, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v22);
    v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      mach_continuous_time();
      *(_DWORD *)buf = 136446722;
      v29 = "NFHardwareSerialFlush";
      v30 = 1024;
      v31 = 779;
      v32 = 2048;
      v33 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_2295E9000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    return 0;
  }
  return v20;
}

BOOL _NFHardwareSerialSetNonBlock(int *a1, int a2)
{
  int v4;
  int v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  int *v9;
  char *v10;
  int *v11;
  NSObject *v12;
  _BOOL8 result;
  int *v14;
  char *v15;
  int v16;
  const char *v17;
  const void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  int *v21;
  char *v22;
  int *v23;
  int *v24;
  char *v25;
  int v26;
  char v27;
  const void **v28;
  void (*v29)(uint64_t, const char *, ...);
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = fcntl(*a1, 3, 0);
  if (v4 != -1)
  {
    if (a2)
      v5 = 4;
    else
      v5 = 0;
    if (fcntl(*a1, 4, v4 & 0xFFFFFFFB | v5))
    {
      v6 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v8 = (void (*)(uint64_t, const char *, ...))Logger;
        v9 = __error();
        v10 = strerror(*v9);
        v11 = __error();
        v8(3, "%s:%i \"%s\" errno=%d Failed to set flags", "_NFHardwareSerialSetNonBlock", 109, v10, *v11);
      }
      dispatch_get_specific(*v6);
      v12 = NFSharedLogGetLogger();
      result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (result)
      {
        v14 = __error();
        v15 = strerror(*v14);
        v16 = *__error();
        *(_DWORD *)buf = 136446978;
        v36 = "_NFHardwareSerialSetNonBlock";
        v37 = 1024;
        v38 = 109;
        v39 = 2080;
        v40 = v15;
        v41 = 1024;
        v42 = v16;
        v17 = "%{public}s:%i \"%s\" errno=%d Failed to set flags";
LABEL_14:
        _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
        return 0;
      }
      return result;
    }
    v27 = fcntl(*a1, 3, 0);
    v28 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if ((v27 & 4) != 0)
    {
      if (v29)
        v29(6, "%s:%i Socket is non-blocking", "_NFHardwareSerialSetNonBlock", 114);
      dispatch_get_specific(*v28);
      v34 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        return 1;
      *(_DWORD *)buf = 136446466;
      v36 = "_NFHardwareSerialSetNonBlock";
      v37 = 1024;
      v38 = 114;
      v31 = "%{public}s:%i Socket is non-blocking";
      v32 = v34;
      v33 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (v29)
        v29(3, "%s:%i Socket is blocking !!", "_NFHardwareSerialSetNonBlock", 116);
      dispatch_get_specific(*v28);
      v30 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        return 1;
      *(_DWORD *)buf = 136446466;
      v36 = "_NFHardwareSerialSetNonBlock";
      v37 = 1024;
      v38 = 116;
      v31 = "%{public}s:%i Socket is blocking !!";
      v32 = v30;
      v33 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_2295E9000, v32, v33, v31, buf, 0x12u);
    return 1;
  }
  v18 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v19 = NFLogGetLogger();
  if (v19)
  {
    v20 = (void (*)(uint64_t, const char *, ...))v19;
    v21 = __error();
    v22 = strerror(*v21);
    v23 = __error();
    v20(3, "%s:%i \"%s\" errno=%d Failed to get flags", "_NFHardwareSerialSetNonBlock", 103, v22, *v23);
  }
  dispatch_get_specific(*v18);
  v12 = NFSharedLogGetLogger();
  result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v24 = __error();
    v25 = strerror(*v24);
    v26 = *__error();
    *(_DWORD *)buf = 136446978;
    v36 = "_NFHardwareSerialSetNonBlock";
    v37 = 1024;
    v38 = 103;
    v39 = 2080;
    v40 = v25;
    v41 = 1024;
    v42 = v26;
    v17 = "%{public}s:%i \"%s\" errno=%d Failed to get flags";
    goto LABEL_14;
  }
  return result;
}

uint64_t NFHardwareSerialReset(uint64_t a1)
{
  _BOOL8 v2;
  const void **v3;
  void (*v4)(uint64_t, const char *, ...);
  NSObject *v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, ...);
  int *v13;
  char *v14;
  int *v15;
  NSObject *v16;
  int *v17;
  char *v18;
  int v19;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (**(_BYTE **)(a1 + 8))
      return 1;
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i ", "NFHardwareSerialReset", 853);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "NFHardwareSerialReset";
      v24 = 1024;
      v25 = 853;
      _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
    }
    v21 = 3;
    if (!setsockopt(*(_DWORD *)a1, 2, -2147191792, &v21, 4u))
    {
      v10 = -1;
      while (v10 != 2)
      {
        v21 = 3;
        ++v10;
        if (setsockopt(*(_DWORD *)a1, 2, -2147191792, &v21, 4u))
        {
          v2 = v10 > 2;
          v9 = v10 + 1;
          goto LABEL_19;
        }
      }
      return 1;
    }
    v2 = 0;
    v9 = 0;
LABEL_19:
    dispatch_get_specific(*v6);
    v11 = NFLogGetLogger();
    if (v11)
    {
      v12 = (void (*)(uint64_t, const char *, ...))v11;
      v13 = __error();
      v14 = strerror(*v13);
      v15 = __error();
      v12(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:TIOCFLUSH - attempt %d - ", "NFHardwareSerialReset", 861, v14, *v15, v9);
    }
    dispatch_get_specific(*v6);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = __error();
      v18 = strerror(*v17);
      v19 = *__error();
      *(_DWORD *)buf = 136447234;
      v23 = "NFHardwareSerialReset";
      v24 = 1024;
      v25 = 861;
      v26 = 2080;
      v27 = v18;
      v28 = 1024;
      v29 = v19;
      v30 = 1024;
      v31 = v9;
      _os_log_impl(&dword_2295E9000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:TIOCFLUSH - attempt %d - ", buf, 0x28u);
    }
  }
  else
  {
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v4 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v4)
      v4(3, "%s:%i Serial device not opened!", "NFHardwareSerialReset", 845);
    dispatch_get_specific(*v3);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v23 = "NFHardwareSerialReset";
      v24 = 1024;
      v25 = 845;
      _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Serial device not opened!", buf, 0x12u);
    }
    return 0;
  }
  return v2;
}

BOOL NFHardwareSerialSetBaudRate(uint64_t a1, speed_t a2)
{
  _BOOL8 result;
  const void **v4;
  void (*v5)(uint64_t, const char *, ...);
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  const void **v11;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, const char *, ...);
  int *v18;
  char *v19;
  int *v20;
  NSObject *v21;
  int *v22;
  char *v23;
  int v24;
  uint64_t v25;
  void (*v26)(uint64_t, const char *, ...);
  int *v27;
  char *v28;
  int *v29;
  NSObject *v30;
  int *v31;
  char *v32;
  int v33;
  uint64_t v34;
  void (*v35)(uint64_t, const char *, ...);
  int *v36;
  char *v37;
  int *v38;
  NSObject *v39;
  int *v40;
  char *v41;
  int v42;
  uint64_t v43;
  void (*v44)(uint64_t, const char *, ...);
  int *v45;
  char *v46;
  int *v47;
  int *v48;
  char *v49;
  int v50;
  socklen_t v51;
  speed_t v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  speed_t v58;
  __int16 v59;
  int v60;
  __int16 v61;
  speed_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v52 = a2;
  if (a1)
  {
    if (**(_BYTE **)(a1 + 8))
      return 1;
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i baudRate=%lu", "NFHardwareSerialSetBaudRate", 880, a2);
    dispatch_get_specific(*v11);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v54 = "NFHardwareSerialSetBaudRate";
      v55 = 1024;
      v56 = 880;
      v57 = 2048;
      v58 = a2;
      _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i baudRate=%lu", buf, 0x1Cu);
    }
    v14 = *(_QWORD *)(a1 + 8);
    if (*(_BYTE *)(v14 + 1))
    {
      v15 = (const void *)(v14 + 8);
      v51 = 72;
      if (getsockopt(*(_DWORD *)a1, 2, 1078490131, (void *)(v14 + 8), &v51))
      {
        dispatch_get_specific(*v11);
        v16 = NFLogGetLogger();
        if (v16)
        {
          v17 = (void (*)(uint64_t, const char *, ...))v16;
          v18 = __error();
          v19 = strerror(*v18);
          v20 = __error();
          v17(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetBaudRate", 887, v19, *v20);
        }
        dispatch_get_specific(*v11);
        v21 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          return 0;
        v22 = __error();
        v23 = strerror(*v22);
        v24 = *__error();
        *(_DWORD *)buf = 136446978;
        v54 = "NFHardwareSerialSetBaudRate";
        v55 = 1024;
        v56 = 887;
        v57 = 2080;
        v58 = (speed_t)v23;
        v59 = 1024;
        v60 = v24;
        v7 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
        goto LABEL_18;
      }
      if (!cfsetspeed((termios *)(*(_QWORD *)(a1 + 8) + 8), a2))
      {
        if (!setsockopt(*(_DWORD *)a1, 2, -2142735340, v15, 0x48u))
          return 1;
        dispatch_get_specific(*v11);
        v43 = NFLogGetLogger();
        if (v43)
        {
          v44 = (void (*)(uint64_t, const char *, ...))v43;
          v45 = __error();
          v46 = strerror(*v45);
          v47 = __error();
          v44(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetBaudRate", 897, v46, *v47);
        }
        dispatch_get_specific(*v11);
        v21 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          return 0;
        v48 = __error();
        v49 = strerror(*v48);
        v50 = *__error();
        *(_DWORD *)buf = 136446978;
        v54 = "NFHardwareSerialSetBaudRate";
        v55 = 1024;
        v56 = 897;
        v57 = 2080;
        v58 = (speed_t)v49;
        v59 = 1024;
        v60 = v50;
        v7 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL";
LABEL_18:
        v8 = v21;
        v9 = 34;
        goto LABEL_30;
      }
      dispatch_get_specific(*v11);
      v34 = NFLogGetLogger();
      if (v34)
      {
        v35 = (void (*)(uint64_t, const char *, ...))v34;
        v36 = __error();
        v37 = strerror(*v36);
        v38 = __error();
        v35(3, "%s:%i \"%s\" errno=%d baudRate=%lu", "NFHardwareSerialSetBaudRate", 892, v37, *v38, a2);
      }
      dispatch_get_specific(*v11);
      v39 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        return 0;
      v40 = __error();
      v41 = strerror(*v40);
      v42 = *__error();
      *(_DWORD *)buf = 136447234;
      v54 = "NFHardwareSerialSetBaudRate";
      v55 = 1024;
      v56 = 892;
      v57 = 2080;
      v58 = (speed_t)v41;
      v59 = 1024;
      v60 = v42;
      v61 = 2048;
      v62 = a2;
      v7 = "%{public}s:%i \"%s\" errno=%d baudRate=%lu";
      v8 = v39;
LABEL_29:
      v9 = 44;
      goto LABEL_30;
    }
    if ((ioctl(*(_DWORD *)a1, 0x80085402uLL, &v52) & 0x80000000) == 0)
      return 1;
    dispatch_get_specific(*v11);
    v25 = NFLogGetLogger();
    if (v25)
    {
      v26 = (void (*)(uint64_t, const char *, ...))v25;
      v27 = __error();
      v28 = strerror(*v27);
      v29 = __error();
      v26(3, "%s:%i \"%s\" errno=%d baudRate=%lu", "NFHardwareSerialSetBaudRate", 904, v28, *v29, v52);
    }
    dispatch_get_specific(*v11);
    v30 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (result)
    {
      v31 = __error();
      v32 = strerror(*v31);
      v33 = *__error();
      *(_DWORD *)buf = 136447234;
      v54 = "NFHardwareSerialSetBaudRate";
      v55 = 1024;
      v56 = 904;
      v57 = 2080;
      v58 = (speed_t)v32;
      v59 = 1024;
      v60 = v33;
      v61 = 2048;
      v62 = v52;
      v7 = "%{public}s:%i \"%s\" errno=%d baudRate=%lu";
      v8 = v30;
      goto LABEL_29;
    }
  }
  else
  {
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v5 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v5)
      v5(3, "%s:%i Serial device not opened!", "NFHardwareSerialSetBaudRate", 871);
    dispatch_get_specific(*v4);
    v6 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136446466;
      v54 = "NFHardwareSerialSetBaudRate";
      v55 = 1024;
      v56 = 871;
      v7 = "%{public}s:%i Serial device not opened!";
      v8 = v6;
      v9 = 18;
LABEL_30:
      _os_log_impl(&dword_2295E9000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      return 0;
    }
  }
  return result;
}

uint64_t NFHardwareSerialSetLogFunction(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 80) = a2;
  return 1;
}

int *NFHardwareSerialOpen(const char *a1, NSObject *a2, BOOL a3)
{
  int *v6;
  BOOL *v7;
  BOOL *v8;
  _BOOL4 v9;
  os_unfair_lock_s *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  const void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  int *v17;
  char *v18;
  int *v19;
  NSObject *v20;
  int *v21;
  char *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uintptr_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void (*v32)(uint64_t, const char *, ...);
  int *v33;
  char *v34;
  int *v35;
  NSObject *v36;
  int *v37;
  char *v38;
  int v39;
  uint64_t v40;
  void (*v41)(uint64_t, const char *, ...);
  int *v42;
  char *v43;
  int *v44;
  int *v45;
  char *v46;
  int v47;
  NSObject *v48;
  uint32_t v49;
  void (*v50)(uint64_t, const char *, ...);
  NSObject *v51;
  const char *v52;
  const void **v53;
  uint64_t v54;
  void (*v55)(uint64_t, const char *, ...);
  int *v56;
  char *v57;
  int *v58;
  NSObject *v59;
  int *v60;
  char *v61;
  int v62;
  const void **v63;
  uint64_t v64;
  void (*v65)(uint64_t, const char *, ...);
  int *v66;
  char *v67;
  int *v68;
  NSObject *v69;
  int *v70;
  char *v71;
  int v72;
  const char *v73;
  void (*v74)(uint64_t, const char *, ...);
  NSObject *v75;
  const void **v76;
  uint64_t v77;
  void (*v78)(uint64_t, const char *, ...);
  int *v79;
  char *v80;
  int *v81;
  int *v82;
  char *v83;
  int v84;
  uint64_t v85;
  void (*v86)(uint64_t, const char *, ...);
  int *v87;
  char *v88;
  int *v89;
  int *v90;
  char *v91;
  int v92;
  const void **v93;
  uint64_t v94;
  void (*v95)(uint64_t, const char *, ...);
  int *v96;
  char *v97;
  int *v98;
  int *v99;
  char *v100;
  int v101;
  NSObject *v102;
  uint32_t v103;
  const void **v104;
  void (*v105)(uint64_t, const char *, ...);
  uint64_t v107;
  void (*v108)(uint64_t, const char *, ...);
  int *v109;
  char *v110;
  int *v111;
  int *v112;
  char *v113;
  int v114;
  uint64_t v115;
  void (*v116)(uint64_t, const char *, ...);
  int *v117;
  char *v118;
  int *v119;
  NSObject *v120;
  int *v121;
  char *v122;
  int v123;
  const void **v124;
  uint64_t v125;
  void (*v126)(uint64_t, const char *, ...);
  int *v127;
  char *v128;
  int *v129;
  NSObject *v130;
  int *v131;
  char *v132;
  int v133;
  uint64_t v134;
  void (*v135)(uint64_t, const char *, ...);
  int *v136;
  char *v137;
  int *v138;
  int *v139;
  char *v140;
  int v141;
  const void **v142;
  uint64_t v143;
  void (*v144)(uint64_t, const char *, ...);
  int *v145;
  char *v146;
  int *v147;
  int *v148;
  char *v149;
  int v150;
  const void **v151;
  void (*v152)(uint64_t, const char *, ...);
  NSObject *v153;
  const void **v154;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v156;
  socklen_t v157;
  sockaddr v158;
  __int128 v159;
  uint8_t buf[4];
  const char *v161;
  __int16 v162;
  int v163;
  __int16 v164;
  char *v165;
  __int16 v166;
  int v167;
  __int16 v168;
  int v169;
  _OWORD handler[3];
  __int128 v171;
  __int128 v172;
  __int128 v173;
  int v174;
  uint64_t v175;

  v175 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v154 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "NFHardwareSerialOpen", 1117, "devicePath != ((void *)0)");
    dispatch_get_specific(*v154);
    v156 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
    {
      LODWORD(handler[0]) = 136446722;
      *(_QWORD *)((char *)handler + 4) = "NFHardwareSerialOpen";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 1117;
      WORD1(handler[1]) = 2080;
      *(_QWORD *)((char *)&handler[1] + 4) = "devicePath != ((void *)0)";
      _os_log_impl(&dword_2295E9000, v156, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", (uint8_t *)handler, 0x1Cu);
    }
    abort();
  }
  v6 = (int *)malloc_type_calloc(1uLL, 0x10uLL, 0x10800407411B482uLL);
  if (!v6)
    goto LABEL_72;
  v7 = (BOOL *)malloc_type_calloc(1uLL, 0xB0uLL, 0x10B0040FC08F2D4uLL);
  if (!v7)
    goto LABEL_72;
  v8 = v7;
  *((_QWORD *)v6 + 1) = v7;
  v9 = strcasestr(a1, "hammerfest") == 0;
  v8[96] = v9;
  v10 = (os_unfair_lock_s *)NFHardwareSerialDebugger(v9);
  *((_QWORD *)v8 + 11) = v10;
  v11 = 1;
  NFHardwareSerialDebugLog(v10, 1, 0, 0);
  v8[97] = a3;
  if (strlen(a1) >= 5)
    v11 = strncmp(a1, "/dev/", 5uLL) != 0;
  v8[1] = v11;
  *v8 = strcasestr(a1, "spmi") != 0;
  if (v8[1])
  {
    v158 = (sockaddr)0;
    v159 = 0u;
    v174 = 0;
    v172 = 0u;
    v173 = 0u;
    v171 = 0u;
    memset(handler, 0, sizeof(handler));
    v12 = *((_QWORD *)v6 + 1);
    v157 = 72;
    v13 = socket(32, 1, 2);
    *v6 = v13;
    v14 = (const void **)MEMORY[0x24BEDCDB0];
    if (v13 < 0)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v31 = NFLogGetLogger();
      if (v31)
      {
        v32 = (void (*)(uint64_t, const char *, ...))v31;
        v33 = __error();
        v34 = strerror(*v33);
        v35 = __error();
        v32(3, "%s:%i \"%s\" errno=%d socket", "_NFHardwareSerialOpenSocket", 991, v34, *v35);
      }
      dispatch_get_specific(*v14);
      v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = __error();
        v38 = strerror(*v37);
        v39 = *__error();
        *(_DWORD *)buf = 136446978;
        v161 = "_NFHardwareSerialOpenSocket";
        v162 = 1024;
        v163 = 991;
        v164 = 2080;
        v165 = v38;
        v166 = 1024;
        v167 = v39;
        _os_log_impl(&dword_2295E9000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d socket", buf, 0x22u);
      }
      *v6 = 0;
      goto LABEL_29;
    }
    v174 = 0;
    v172 = 0u;
    v173 = 0u;
    v171 = 0u;
    memset(handler, 0, sizeof(handler));
    __strlcpy_chk();
    if (ioctl(*v6, 0xC0644E03uLL, handler))
    {
      dispatch_get_specific(*v14);
      v15 = NFLogGetLogger();
      if (v15)
      {
        v16 = (void (*)(uint64_t, const char *, ...))v15;
        v17 = __error();
        v18 = strerror(*v17);
        v19 = __error();
        v16(3, "%s:%i \"%s\" errno=%d ioctl: CTLIOCGINFO", "_NFHardwareSerialOpenSocket", 1000, v18, *v19);
      }
      dispatch_get_specific(*v14);
      v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v21 = __error();
      v22 = strerror(*v21);
      v23 = *__error();
      *(_DWORD *)buf = 136446978;
      v161 = "_NFHardwareSerialOpenSocket";
      v162 = 1024;
      v163 = 1000;
      v164 = 2080;
      v165 = v22;
      v166 = 1024;
      v167 = v23;
      v24 = "%{public}s:%i \"%s\" errno=%d ioctl: CTLIOCGINFO";
      goto LABEL_27;
    }
    *(_DWORD *)&v158.sa_len = 139296;
    *(_DWORD *)&v158.sa_data[2] = handler[0];
    *(_DWORD *)&v158.sa_data[6] = 0;
    if (connect(*v6, &v158, 0x20u))
    {
      dispatch_get_specific(*v14);
      v40 = NFLogGetLogger();
      if (v40)
      {
        v41 = (void (*)(uint64_t, const char *, ...))v40;
        v42 = __error();
        v43 = strerror(*v42);
        v44 = __error();
        v41(3, "%s:%i \"%s\" errno=%d connect", "_NFHardwareSerialOpenSocket", 1011, v43, *v44);
      }
      dispatch_get_specific(*v14);
      v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v45 = __error();
      v46 = strerror(*v45);
      v47 = *__error();
      *(_DWORD *)buf = 136446978;
      v161 = "_NFHardwareSerialOpenSocket";
      v162 = 1024;
      v163 = 1011;
      v164 = 2080;
      v165 = v46;
      v166 = 1024;
      v167 = v47;
      v24 = "%{public}s:%i \"%s\" errno=%d connect";
      goto LABEL_27;
    }
    if (*(_BYTE *)(*((_QWORD *)v6 + 1) + 97))
    {
      dispatch_get_specific(*v14);
      v74 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v74)
        v74(6, "%s:%i Using blocking socket for relay", "_NFHardwareSerialOpenSocket", 1016);
      dispatch_get_specific(*v14);
      v75 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v161 = "_NFHardwareSerialOpenSocket";
        v162 = 1024;
        v163 = 1016;
        _os_log_impl(&dword_2295E9000, v75, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", buf, 0x12u);
      }
    }
    else if (!_NFHardwareSerialSetNonBlock(v6, 1))
    {
      dispatch_get_specific(*v14);
      v107 = NFLogGetLogger();
      if (v107)
      {
        v108 = (void (*)(uint64_t, const char *, ...))v107;
        v109 = __error();
        v110 = strerror(*v109);
        v111 = __error();
        v108(3, "%s:%i \"%s\" errno=%d Failed to set non-blocking.", "_NFHardwareSerialOpenSocket", 1019, v110, *v111);
      }
      dispatch_get_specific(*v14);
      v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v112 = __error();
      v113 = strerror(*v112);
      v114 = *__error();
      *(_DWORD *)buf = 136446978;
      v161 = "_NFHardwareSerialOpenSocket";
      v162 = 1024;
      v163 = 1019;
      v164 = 2080;
      v165 = v113;
      v166 = 1024;
      v167 = v114;
      v24 = "%{public}s:%i \"%s\" errno=%d Failed to set non-blocking.";
LABEL_27:
      v48 = v20;
      v49 = 34;
LABEL_28:
      _os_log_impl(&dword_2295E9000, v48, OS_LOG_TYPE_ERROR, v24, buf, v49);
LABEL_29:
      dispatch_get_specific(*v14);
      v50 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v50)
        v50(3, "%s:%i failed to open socket %s", "NFHardwareSerialOpen", 1147, a1);
      dispatch_get_specific(*v14);
      v51 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        goto LABEL_72;
      LODWORD(handler[0]) = 136446722;
      *(_QWORD *)((char *)handler + 4) = "NFHardwareSerialOpen";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 1147;
      WORD1(handler[1]) = 2080;
      *(_QWORD *)((char *)&handler[1] + 4) = a1;
      v52 = "%{public}s:%i failed to open socket %s";
LABEL_71:
      _os_log_impl(&dword_2295E9000, v51, OS_LOG_TYPE_ERROR, v52, (uint8_t *)handler, 0x1Cu);
LABEL_72:
      NFHardwareSerialClose((uint64_t)v6);
      return 0;
    }
    if (!**((_BYTE **)v6 + 1))
    {
      if (getsockopt(*v6, 2, 1078490131, (void *)(v12 + 8), &v157))
      {
        dispatch_get_specific(*v14);
        v85 = NFLogGetLogger();
        if (v85)
        {
          v86 = (void (*)(uint64_t, const char *, ...))v85;
          v87 = __error();
          v88 = strerror(*v87);
          v89 = __error();
          v86(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "_NFHardwareSerialOpenSocket", 1032, v88, *v89);
        }
        dispatch_get_specific(*v14);
        v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        v90 = __error();
        v91 = strerror(*v90);
        v92 = *__error();
        *(_DWORD *)buf = 136446978;
        v161 = "_NFHardwareSerialOpenSocket";
        v162 = 1024;
        v163 = 1032;
        v164 = 2080;
        v165 = v91;
        v166 = 1024;
        v167 = v92;
        v24 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
        goto LABEL_27;
      }
      *(_QWORD *)(v12 + 24) = 232192;
      *(_QWORD *)(v12 + 8) |= 4uLL;
      cfmakeraw((termios *)(v12 + 8));
      if (cfsetspeed((termios *)(*((_QWORD *)v6 + 1) + 8), 0x1C200uLL))
      {
        dispatch_get_specific(*v14);
        v115 = NFLogGetLogger();
        if (v115)
        {
          v116 = (void (*)(uint64_t, const char *, ...))v115;
          v117 = __error();
          v118 = strerror(*v117);
          v119 = __error();
          v116(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenSocket", 1046, v118, *v119, 115200);
        }
        dispatch_get_specific(*v14);
        v120 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        v121 = __error();
        v122 = strerror(*v121);
        v123 = *__error();
        *(_DWORD *)buf = 136447234;
        v161 = "_NFHardwareSerialOpenSocket";
        v162 = 1024;
        v163 = 1046;
        v164 = 2080;
        v165 = v122;
        v166 = 1024;
        v167 = v123;
        v168 = 1024;
        v169 = 115200;
        v24 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
        v48 = v120;
        v49 = 40;
        goto LABEL_28;
      }
      if (setsockopt(*v6, 2, -2142735340, (const void *)(v12 + 8), 0x48u))
      {
        dispatch_get_specific(*v14);
        v134 = NFLogGetLogger();
        if (v134)
        {
          v135 = (void (*)(uint64_t, const char *, ...))v134;
          v136 = __error();
          v137 = strerror(*v136);
          v138 = __error();
          v135(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "_NFHardwareSerialOpenSocket", 1051, v137, *v138);
        }
        dispatch_get_specific(*v14);
        v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        v139 = __error();
        v140 = strerror(*v139);
        v141 = *__error();
        *(_DWORD *)buf = 136446978;
        v161 = "_NFHardwareSerialOpenSocket";
        v162 = 1024;
        v163 = 1051;
        v164 = 2080;
        v165 = v140;
        v166 = 1024;
        v167 = v141;
        v24 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL";
        goto LABEL_27;
      }
    }
    goto LABEL_15;
  }
  v25 = *((_QWORD *)v6 + 1);
  v26 = open(a1, 131078);
  *v6 = v26;
  if (v26 < 0)
  {
    v53 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v54 = NFLogGetLogger();
    if (v54)
    {
      v55 = (void (*)(uint64_t, const char *, ...))v54;
      v56 = __error();
      v57 = strerror(*v56);
      v58 = __error();
      v55(3, "%s:%i \"%s\" errno=%d open", "_NFHardwareSerialOpenDeviceNode", 925, v57, *v58);
    }
    dispatch_get_specific(*v53);
    v59 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = __error();
      v61 = strerror(*v60);
      v62 = *__error();
      LODWORD(handler[0]) = 136446978;
      *(_QWORD *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 925;
      WORD1(handler[1]) = 2080;
      *(_QWORD *)((char *)&handler[1] + 4) = v61;
      WORD6(handler[1]) = 1024;
      *(_DWORD *)((char *)&handler[1] + 14) = v62;
      _os_log_impl(&dword_2295E9000, v59, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d open", (uint8_t *)handler, 0x22u);
    }
    *v6 = 0;
    goto LABEL_67;
  }
  if (**((_BYTE **)v6 + 1))
    goto LABEL_15;
  if (ioctl(v26, 0x2000740DuLL))
  {
    v63 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v64 = NFLogGetLogger();
    if (v64)
    {
      v65 = (void (*)(uint64_t, const char *, ...))v64;
      v66 = __error();
      v67 = strerror(*v66);
      v68 = __error();
      v65(3, "%s:%i \"%s\" errno=%d ioctl: TIOCEXCL", "_NFHardwareSerialOpenDeviceNode", 938, v67, *v68);
    }
    dispatch_get_specific(*v63);
    v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v70 = __error();
    v71 = strerror(*v70);
    v72 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(_QWORD *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 938;
    WORD1(handler[1]) = 2080;
    *(_QWORD *)((char *)&handler[1] + 4) = v71;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v72;
    v73 = "%{public}s:%i \"%s\" errno=%d ioctl: TIOCEXCL";
    goto LABEL_65;
  }
  if (tcgetattr(*v6, (termios *)(v25 + 8)))
  {
    v76 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v77 = NFLogGetLogger();
    if (v77)
    {
      v78 = (void (*)(uint64_t, const char *, ...))v77;
      v79 = __error();
      v80 = strerror(*v79);
      v81 = __error();
      v78(3, "%s:%i \"%s\" errno=%d tcgetattr", "_NFHardwareSerialOpenDeviceNode", 944, v80, *v81);
    }
    dispatch_get_specific(*v76);
    v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v82 = __error();
    v83 = strerror(*v82);
    v84 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(_QWORD *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 944;
    WORD1(handler[1]) = 2080;
    *(_QWORD *)((char *)&handler[1] + 4) = v83;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v84;
    v73 = "%{public}s:%i \"%s\" errno=%d tcgetattr";
    goto LABEL_65;
  }
  if (fcntl(*v6, 4, 0))
  {
    v93 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v94 = NFLogGetLogger();
    if (v94)
    {
      v95 = (void (*)(uint64_t, const char *, ...))v94;
      v96 = __error();
      v97 = strerror(*v96);
      v98 = __error();
      v95(3, "%s:%i \"%s\" errno=%d fcntl: F_SETFL", "_NFHardwareSerialOpenDeviceNode", 950, v97, *v98);
    }
    dispatch_get_specific(*v93);
    v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v99 = __error();
    v100 = strerror(*v99);
    v101 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(_QWORD *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 950;
    WORD1(handler[1]) = 2080;
    *(_QWORD *)((char *)&handler[1] + 4) = v100;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v101;
    v73 = "%{public}s:%i \"%s\" errno=%d fcntl: F_SETFL";
LABEL_65:
    v102 = v69;
    v103 = 34;
LABEL_66:
    _os_log_impl(&dword_2295E9000, v102, OS_LOG_TYPE_ERROR, v73, (uint8_t *)handler, v103);
    goto LABEL_67;
  }
  *(_QWORD *)(v25 + 8) |= 4uLL;
  *(_OWORD *)(v25 + 16) = xmmword_229601C80;
  *(_QWORD *)(v25 + 32) = 0;
  *(_WORD *)(v25 + 56) = 1;
  if (cfsetispeed((termios *)(*((_QWORD *)v6 + 1) + 8), 0x1C200uLL)
    || cfsetospeed((termios *)(*((_QWORD *)v6 + 1) + 8), 0x1C200uLL))
  {
    v124 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v125 = NFLogGetLogger();
    if (v125)
    {
      v126 = (void (*)(uint64_t, const char *, ...))v125;
      v127 = __error();
      v128 = strerror(*v127);
      v129 = __error();
      v126(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenDeviceNode", 963, v128, *v129, 115200);
    }
    dispatch_get_specific(*v124);
    v130 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v131 = __error();
    v132 = strerror(*v131);
    v133 = *__error();
    LODWORD(handler[0]) = 136447234;
    *(_QWORD *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 963;
    WORD1(handler[1]) = 2080;
    *(_QWORD *)((char *)&handler[1] + 4) = v132;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v133;
    WORD1(handler[2]) = 1024;
    DWORD1(handler[2]) = 115200;
    v73 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
    goto LABEL_89;
  }
  if (tcsetattr(*v6, 0, (const termios *)(*((_QWORD *)v6 + 1) + 8)))
  {
    v142 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v143 = NFLogGetLogger();
    if (v143)
    {
      v144 = (void (*)(uint64_t, const char *, ...))v143;
      v145 = __error();
      v146 = strerror(*v145);
      v147 = __error();
      v144(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenDeviceNode", 968, v146, *v147, 115200);
    }
    dispatch_get_specific(*v142);
    v130 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v148 = __error();
    v149 = strerror(*v148);
    v150 = *__error();
    LODWORD(handler[0]) = 136447234;
    *(_QWORD *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 968;
    WORD1(handler[1]) = 2080;
    *(_QWORD *)((char *)&handler[1] + 4) = v149;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v150;
    WORD1(handler[2]) = 1024;
    DWORD1(handler[2]) = 115200;
    v73 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
LABEL_89:
    v102 = v130;
    v103 = 40;
    goto LABEL_66;
  }
  if (*(_BYTE *)(*((_QWORD *)v6 + 1) + 97))
  {
    v151 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v152 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v152)
      v152(6, "%s:%i Using blocking socket for relay", "_NFHardwareSerialOpenDeviceNode", 973);
    dispatch_get_specific(*v151);
    v153 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(handler[0]) = 136446466;
      *(_QWORD *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 973;
      _os_log_impl(&dword_2295E9000, v153, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", (uint8_t *)handler, 0x12u);
    }
    goto LABEL_15;
  }
  if (!_NFHardwareSerialSetNonBlock(v6, 1))
  {
LABEL_67:
    v104 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v105 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v105)
      v105(3, "%s:%i failed to open device %s", "NFHardwareSerialOpen", 1153, a1);
    dispatch_get_specific(*v104);
    v51 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    LODWORD(handler[0]) = 136446722;
    *(_QWORD *)((char *)handler + 4) = "NFHardwareSerialOpen";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 1153;
    WORD1(handler[1]) = 2080;
    *(_QWORD *)((char *)&handler[1] + 4) = a1;
    v52 = "%{public}s:%i failed to open device %s";
    goto LABEL_71;
  }
LABEL_15:
  *((_QWORD *)v8 + 13) = a2;
  dispatch_retain(a2);
  v27 = *((_QWORD *)v6 + 1);
  if (!*(_BYTE *)(v27 + 97))
  {
    v28 = *v6;
    *(_QWORD *)(v27 + 112) = dispatch_source_create(MEMORY[0x24BDACA00], v28, 0, *(dispatch_queue_t *)(v27 + 104));
    dispatch_set_qos_class_fallback();
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v27 + 112), &__block_literal_global_124);
    dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v27 + 112), &__block_literal_global_127);
    dispatch_activate(*(dispatch_object_t *)(v27 + 112));
    dispatch_suspend(*(dispatch_object_t *)(v27 + 112));
    *(_DWORD *)(v27 + 120) = 1;
    *(_QWORD *)(*((_QWORD *)v6 + 1) + 128) = 0;
    *(_QWORD *)(v27 + 152) = 0;
    *(_QWORD *)(v27 + 160) = 0;
    v29 = dispatch_source_create(MEMORY[0x24BDACA30], v28, 0, *(dispatch_queue_t *)(v27 + 104));
    *(_QWORD *)(v27 + 136) = v29;
    dispatch_source_set_event_handler(v29, &__block_literal_global_129);
    v30 = *(NSObject **)(v27 + 136);
    *(_QWORD *)&handler[0] = MEMORY[0x24BDAC760];
    *((_QWORD *)&handler[0] + 1) = 0x40000000;
    *(_QWORD *)&handler[1] = ___NFHardwareSerialCreateSources_block_invoke_131;
    *((_QWORD *)&handler[1] + 1) = &__block_descriptor_tmp_132;
    LODWORD(handler[2]) = v28;
    dispatch_source_set_cancel_handler(v30, handler);
    dispatch_activate(*(dispatch_object_t *)(v27 + 136));
    dispatch_suspend(*(dispatch_object_t *)(v27 + 136));
    *(_DWORD *)(v27 + 144) = 1;
  }
  return v6;
}

void NFHardwareSerialClose(uint64_t a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NFHardwareSerialClose", 1171);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "NFHardwareSerialClose";
    v11 = 1024;
    v12 = 1171;
    _os_log_impl(&dword_2295E9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 8);
    if (v5)
    {
      NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v5 + 88), 2, 0, 0);
      v6 = *(_QWORD *)(a1 + 8);
      if (!*(_QWORD *)(v6 + 136) && (*(_DWORD *)a1 & 0x80000000) == 0)
      {
        close(*(_DWORD *)a1);
        *(_DWORD *)a1 = -1;
        v6 = *(_QWORD *)(a1 + 8);
      }
      if (!*(_BYTE *)(v6 + 97))
      {
        if (*(_QWORD *)(v6 + 112))
        {
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 112), &__block_literal_global_134);
          v7 = *(_QWORD *)(a1 + 8);
          if (*(_DWORD *)(v7 + 120))
          {
            dispatch_resume(*(dispatch_object_t *)(v7 + 112));
            v7 = *(_QWORD *)(a1 + 8);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(v7 + 112));
          dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 8) + 112));
          v6 = *(_QWORD *)(a1 + 8);
          *(_QWORD *)(v6 + 112) = 0;
        }
        if (*(_QWORD *)(v6 + 136))
        {
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 136), &__block_literal_global_137);
          v8 = *(_QWORD *)(a1 + 8);
          if (*(_DWORD *)(v8 + 144))
          {
            dispatch_resume(*(dispatch_object_t *)(v8 + 136));
            v8 = *(_QWORD *)(a1 + 8);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(v8 + 136));
          dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 8) + 136));
          v6 = *(_QWORD *)(a1 + 8);
          *(_QWORD *)(v6 + 136) = 0;
        }
      }
      if (*(_QWORD *)(v6 + 104))
      {
        dispatch_release(*(dispatch_object_t *)(v6 + 104));
        v6 = *(_QWORD *)(a1 + 8);
        *(_QWORD *)(v6 + 104) = 0;
      }
      free((void *)v6);
    }
    free((void *)a1);
  }
}

uint64_t NFHardwareSerialPower()
{
  return 1;
}

BOOL NFHardwareSerialHasCTS(_BOOL8 result)
{
  unsigned __int8 *v1;

  if (result)
  {
    v1 = *(unsigned __int8 **)(result + 8);
    return v1 && *v1 == 0;
  }
  return result;
}

uint64_t NFHardwareSerialGetCTS(uint64_t result)
{
  _BYTE *v1;
  const void **v2;
  void (*v3)(uint64_t, const char *, ...);
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  const void **v7;
  void (*Logger)(uint64_t, const char *, ...);
  void (*v9)(uint64_t, const char *, ...);
  int *v10;
  char *v11;
  int *v12;
  NSObject *v13;
  int *v14;
  char *v15;
  int v16;
  const char *v17;
  int v18;
  const void **v19;
  void (*v20)(uint64_t, const char *, ...);
  void (*v21)(uint64_t, const char *, ...);
  int *v22;
  char *v23;
  int *v24;
  int *v25;
  char *v26;
  int v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  socklen_t v37;
  unsigned int v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!result)
    return result;
  v1 = *(_BYTE **)(result + 8);
  if (!v1)
    return 0;
  if (!*v1)
  {
    v38 = 0;
    if (v1[1])
    {
      v37 = 4;
      v6 = getsockopt(*(_DWORD *)result, 2, 1074033770, &v38, &v37);
      v7 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      v9 = Logger;
      if (v6)
      {
        if (Logger)
        {
          v10 = __error();
          v11 = strerror(*v10);
          v12 = __error();
          v9(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "NFHardwareSerialGetCTS", 1239, v11, *v12);
        }
        dispatch_get_specific(*v7);
        v13 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          return 0xFFFFFFFFLL;
        v14 = __error();
        v15 = strerror(*v14);
        v16 = *__error();
        *(_DWORD *)buf = 136446978;
        v40 = "NFHardwareSerialGetCTS";
        v41 = 1024;
        v42 = 1239;
        v43 = 2080;
        v44 = v15;
        v45 = 1024;
        v46 = v16;
        v17 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
LABEL_20:
        _os_log_impl(&dword_2295E9000, v13, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
        return 0xFFFFFFFFLL;
      }
      if (Logger)
      {
        if ((v38 & 0x20) != 0)
          v28 = "HIGH";
        else
          v28 = "LOW";
        Logger(6, "%s:%i Flow is %s (line=%x)", "NFHardwareSerialGetCTS", 1243, v28, v38);
      }
      dispatch_get_specific(*v7);
      v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if ((v38 & 0x20) != 0)
          v30 = "HIGH";
        else
          v30 = "LOW";
        *(_DWORD *)buf = 136446978;
        v40 = "NFHardwareSerialGetCTS";
        v41 = 1024;
        v42 = 1243;
        v43 = 2080;
        v44 = (void *)v30;
        v45 = 1024;
        v46 = v38;
        v31 = "%{public}s:%i Flow is %s (line=%x)";
        v32 = v29;
        v33 = 34;
LABEL_41:
        _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
    }
    else
    {
      v18 = ioctl(*(_DWORD *)result, 0x4004746AuLL, &v38);
      v19 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      v21 = v20;
      if (v18)
      {
        if (v20)
        {
          v22 = __error();
          v23 = strerror(*v22);
          v24 = __error();
          v21(3, "%s:%i \"%s\" errno=%d TIOCMSET", "NFHardwareSerialGetCTS", 1247, v23, *v24);
        }
        dispatch_get_specific(*v19);
        v13 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          return 0xFFFFFFFFLL;
        v25 = __error();
        v26 = strerror(*v25);
        v27 = *__error();
        *(_DWORD *)buf = 136446978;
        v40 = "NFHardwareSerialGetCTS";
        v41 = 1024;
        v42 = 1247;
        v43 = 2080;
        v44 = v26;
        v45 = 1024;
        v46 = v27;
        v17 = "%{public}s:%i \"%s\" errno=%d TIOCMSET";
        goto LABEL_20;
      }
      if (v20)
      {
        if ((v38 & 0x20) != 0)
          v34 = "HIGH";
        else
          v34 = "LOW";
        v20(6, "%s:%i Flow is %s", "NFHardwareSerialGetCTS", 1250, v34);
      }
      dispatch_get_specific(*v19);
      v35 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = "HIGH";
        v40 = "NFHardwareSerialGetCTS";
        *(_DWORD *)buf = 136446722;
        if ((v38 & 0x20) == 0)
          v36 = "LOW";
        v41 = 1024;
        v42 = 1250;
        v43 = 2080;
        v44 = (void *)v36;
        v31 = "%{public}s:%i Flow is %s";
        v32 = v35;
        v33 = 28;
        goto LABEL_41;
      }
    }
    return (v38 >> 5) & 1;
  }
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v3 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v3)
    v3(6, "%s:%i Ignoring for SPMI", "NFHardwareSerialGetCTS", 1229);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v5)
  {
    *(_DWORD *)buf = 136446466;
    v40 = "NFHardwareSerialGetCTS";
    v41 = 1024;
    v42 = 1229;
    _os_log_impl(&dword_2295E9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Ignoring for SPMI", buf, 0x12u);
    return 0;
  }
  return result;
}

BOOL NFHardwareSerialSetCRCEnabled(uint64_t a1, int a2)
{
  _BYTE *v2;
  int v3;
  const void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, const char *, ...);
  int *v7;
  char *v8;
  int *v9;
  NSObject *v10;
  _BOOL8 result;
  int *v12;
  char *v13;
  int v14;
  const void **v15;
  uint64_t Logger;
  void (*v17)(uint64_t, const char *, ...);
  int *v18;
  char *v19;
  int *v20;
  NSObject *v21;
  int *v22;
  char *v23;
  int v24;
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 8);
  if (!*v2)
    return 1;
  v25 = a2;
  v3 = *(_DWORD *)a1;
  if (!v2[1])
  {
    if (ioctl(v3, 0x80047301uLL, &v25))
    {
      v15 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v17 = (void (*)(uint64_t, const char *, ...))Logger;
        v18 = __error();
        v19 = strerror(*v18);
        v20 = __error();
        v17(3, "%s:%i \"%s\" errno=%d IO_STOCKHOLM_CRC", "NFHardwareSerialSetCRCEnabled", 1273, v19, *v20);
      }
      dispatch_get_specific(*v15);
      v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = __error();
        v23 = strerror(*v22);
        v24 = *__error();
        *(_DWORD *)buf = 136446978;
        v27 = "NFHardwareSerialSetCRCEnabled";
        v28 = 1024;
        v29 = 1273;
        v30 = 2080;
        v31 = v23;
        v32 = 1024;
        v33 = v24;
        _os_log_impl(&dword_2295E9000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d IO_STOCKHOLM_CRC", buf, 0x22u);
      }
    }
    return 1;
  }
  if (!setsockopt(v3, 2, -2147192063, &v25, 4u))
    return 1;
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v5 = NFLogGetLogger();
  if (v5)
  {
    v6 = (void (*)(uint64_t, const char *, ...))v5;
    v7 = __error();
    v8 = strerror(*v7);
    v9 = __error();
    v6(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetCRCEnabled", 1267, v8, *v9);
  }
  dispatch_get_specific(*v4);
  v10 = NFSharedLogGetLogger();
  result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v12 = __error();
    v13 = strerror(*v12);
    v14 = *__error();
    *(_DWORD *)buf = 136446978;
    v27 = "NFHardwareSerialSetCRCEnabled";
    v28 = 1024;
    v29 = 1267;
    v30 = 2080;
    v31 = v13;
    v32 = 1024;
    v33 = v14;
    _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", buf, 0x22u);
    return 0;
  }
  return result;
}

BOOL NFHardwareSerialSetOnDemandClientMode(uint64_t a1, int a2)
{
  _BYTE *v2;
  int v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  int *v7;
  char *v8;
  int *v9;
  NSObject *v10;
  _BOOL8 result;
  int *v12;
  char *v13;
  int v14;
  const char *v15;
  const void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, const char *, ...);
  int *v19;
  char *v20;
  int *v21;
  int *v22;
  char *v23;
  int v24;
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 8);
  if (!*v2)
    return 1;
  v25 = a2;
  v3 = *(_DWORD *)a1;
  if (v2[1])
  {
    if (setsockopt(v3, 2, -2147192062, &v25, 4u))
    {
      v4 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v6 = (void (*)(uint64_t, const char *, ...))Logger;
        v7 = __error();
        v8 = strerror(*v7);
        v9 = __error();
        v6(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_ON_DEMAND_CLIENT", "NFHardwareSerialSetOnDemandClientMode", 1293, v8, *v9);
      }
      dispatch_get_specific(*v4);
      v10 = NFSharedLogGetLogger();
      result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (result)
      {
        v12 = __error();
        v13 = strerror(*v12);
        v14 = *__error();
        *(_DWORD *)buf = 136446978;
        v27 = "NFHardwareSerialSetOnDemandClientMode";
        v28 = 1024;
        v29 = 1293;
        v30 = 2080;
        v31 = v13;
        v32 = 1024;
        v33 = v14;
        v15 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_ON_DEMAND_CLIENT";
LABEL_13:
        _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0x22u);
        return 0;
      }
      return result;
    }
    return 1;
  }
  if (!ioctl(v3, 0x80047302uLL, &v25))
    return 1;
  v16 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v17 = NFLogGetLogger();
  if (v17)
  {
    v18 = (void (*)(uint64_t, const char *, ...))v17;
    v19 = __error();
    v20 = strerror(*v19);
    v21 = __error();
    v18(3, "%s:%i \"%s\" errno=%d IO_STOCKHOLM_ON_DEMAND_CLIENT", "NFHardwareSerialSetOnDemandClientMode", 1299, v20, *v21);
  }
  dispatch_get_specific(*v16);
  v10 = NFSharedLogGetLogger();
  result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v22 = __error();
    v23 = strerror(*v22);
    v24 = *__error();
    *(_DWORD *)buf = 136446978;
    v27 = "NFHardwareSerialSetOnDemandClientMode";
    v28 = 1024;
    v29 = 1299;
    v30 = 2080;
    v31 = v23;
    v32 = 1024;
    v33 = v24;
    v15 = "%{public}s:%i \"%s\" errno=%d IO_STOCKHOLM_ON_DEMAND_CLIENT";
    goto LABEL_13;
  }
  return result;
}

uint64_t NFHardwareSerialQuerySPMIError(uint64_t a1, void *a2, _QWORD *a3, int a4)
{
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  _BYTE *v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  int *v14;
  char *v15;
  int *v16;
  NSObject *v17;
  int *v18;
  char *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  _BOOL8 v26;
  void (*v28)(uint64_t, const char *, ...);
  int v29;
  uint64_t v30;
  void (*v31)(uint64_t, const char *, ...);
  int *v32;
  char *v33;
  int *v34;
  NSObject *v35;
  int *v36;
  char *v37;
  int v38;
  int v39;
  socklen_t v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  v8 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NFHardwareSerialQuerySPMIError", 1312);
  dispatch_get_specific(*v8);
  v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v42 = "NFHardwareSerialQuerySPMIError";
    v43 = 1024;
    v44 = 1312;
    _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a2 || !a3)
  {
    dispatch_get_specific(*v8);
    v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v24)
      v24(3, "%s:%i Invalid parameter", "NFHardwareSerialQuerySPMIError", 1315);
    dispatch_get_specific(*v8);
    v25 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v42 = "NFHardwareSerialQuerySPMIError";
    v43 = 1024;
    v44 = 1315;
    v21 = "%{public}s:%i Invalid parameter";
LABEL_18:
    v22 = v25;
    v23 = 18;
    goto LABEL_19;
  }
  v11 = *(_BYTE **)(a1 + 8);
  if (!*v11)
  {
    *a3 = 0;
    return 1;
  }
  if (!v11[1])
  {
    dispatch_get_specific(*v8);
    v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v28)
      v28(3, "%s:%i Not implemented.", "NFHardwareSerialQuerySPMIError", 1340);
    dispatch_get_specific(*v8);
    v25 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136446466;
    v42 = "NFHardwareSerialQuerySPMIError";
    v43 = 1024;
    v44 = 1340;
    v21 = "%{public}s:%i Not implemented.";
    goto LABEL_18;
  }
  v40 = *a3;
  if (getsockopt(*(_DWORD *)a1, 2, -1069518077, a2, &v40))
  {
    dispatch_get_specific(*v8);
    v12 = NFLogGetLogger();
    if (v12)
    {
      v13 = (void (*)(uint64_t, const char *, ...))v12;
      v14 = __error();
      v15 = strerror(*v14);
      v16 = __error();
      v13(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", "NFHardwareSerialQuerySPMIError", 1328, v15, *v16);
    }
    dispatch_get_specific(*v8);
    v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return 0;
    v18 = __error();
    v19 = strerror(*v18);
    v20 = *__error();
    *(_DWORD *)buf = 136446978;
    v42 = "NFHardwareSerialQuerySPMIError";
    v43 = 1024;
    v44 = 1328;
    v45 = 2080;
    v46 = v19;
    v47 = 1024;
    v48 = v20;
    v21 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS";
    v22 = v17;
    v23 = 34;
LABEL_19:
    _os_log_impl(&dword_2295E9000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    return 0;
  }
  *a3 = v40;
  v39 = a4;
  v29 = setsockopt(*(_DWORD *)a1, 2, -1069518077, &v39, 4u);
  v26 = v29 == 0;
  if (v29)
  {
    dispatch_get_specific(*v8);
    v30 = NFLogGetLogger();
    if (v30)
    {
      v31 = (void (*)(uint64_t, const char *, ...))v30;
      v32 = __error();
      v33 = strerror(*v32);
      v34 = __error();
      v31(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", "NFHardwareSerialQuerySPMIError", 1335, v33, *v34);
    }
    dispatch_get_specific(*v8);
    v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = __error();
      v37 = strerror(*v36);
      v38 = *__error();
      *(_DWORD *)buf = 136446978;
      v42 = "NFHardwareSerialQuerySPMIError";
      v43 = 1024;
      v44 = 1335;
      v45 = 2080;
      v46 = v37;
      v47 = 1024;
      v48 = v38;
      _os_log_impl(&dword_2295E9000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", buf, 0x22u);
    }
  }
  return v26;
}

void _NFHardwarePrintNode(const char *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  const void **v5;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  NSObject *v10;
  void (*v11)(uint64_t, const char *, ...);
  NSObject *v12;
  const __CFString *CFProperty;
  const __CFString *v14;
  char *StringValue;
  void (*v16)(uint64_t, const char *, ...);
  const char *v17;
  NSObject *v18;
  const char *v19;
  const __CFString *v20;
  const __CFString *v21;
  char *v22;
  void (*v23)(uint64_t, const char *, ...);
  const char *v24;
  NSObject *v25;
  const char *v26;
  const __CFString *v27;
  const __CFString *v28;
  char *v29;
  void (*v30)(uint64_t, const char *, ...);
  const char *v31;
  NSObject *v32;
  const char *v33;
  const __CFString *v34;
  const __CFString *v35;
  char *v36;
  void (*v37)(uint64_t, const char *, ...);
  const char *v38;
  NSObject *v39;
  const char *v40;
  io_registry_entry_t child;
  uint8_t v42[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  uint8_t *v49;
  uint8_t buf[48];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceNameMatching(a1);
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (MatchingService)
  {
    if (Logger)
      Logger(6, "%s:%i %s found", "_NFHardwarePrintNode", 143, a1);
    dispatch_get_specific(*v5);
    v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_NFHardwarePrintNode";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 143;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = a1;
      _os_log_impl(&dword_2295E9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s found", buf, 0x1Cu);
    }
    child = 0;
    if (IORegistryEntryGetChildEntry(MatchingService, "IOService", &child))
    {
      dispatch_get_specific(*v5);
      v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v8)
        v8(6, "%s:%i %s has no child", "_NFHardwarePrintNode", 156, a1);
      dispatch_get_specific(*v5);
      v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 156;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1;
        _os_log_impl(&dword_2295E9000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has no child", buf, 0x1Cu);
      }
    }
    else if (child)
    {
      v54 = 0u;
      v55 = 0u;
      v53 = 0u;
      v51 = 0u;
      v52 = 0u;
      memset(buf, 0, sizeof(buf));
      if (!MEMORY[0x22E2CD120]())
      {
        dispatch_get_specific(*v5);
        v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v11)
          v11(6, "%s:%i %s has child %s", "_NFHardwarePrintNode", 151, a1, (const char *)buf);
        dispatch_get_specific(*v5);
        v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v42 = 136446978;
          v43 = "_NFHardwarePrintNode";
          v44 = 1024;
          v45 = 151;
          v46 = 2080;
          v47 = a1;
          v48 = 2080;
          v49 = buf;
          _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has child %s", v42, 0x26u);
        }
      }
      IOObjectRelease(child);
    }
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IONameMatch"), 0, 0);
    if (CFProperty)
    {
      v14 = CFProperty;
      StringValue = _NFHardwareGetStringValue(CFProperty);
      dispatch_get_specific(*v5);
      v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
      {
        if (StringValue)
          v17 = StringValue;
        else
          v17 = "??";
        v16(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 162, a1, "IONameMatch", v17);
      }
      dispatch_get_specific(*v5);
      v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (StringValue)
          v19 = StringValue;
        else
          v19 = "??";
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 162;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = "IONameMatch";
        *(_WORD *)&buf[38] = 2080;
        *(_QWORD *)&buf[40] = v19;
        _os_log_impl(&dword_2295E9000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (StringValue)
        free(StringValue);
      CFRelease(v14);
    }
    v20 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IONameMatched"), 0, 0);
    if (v20)
    {
      v21 = v20;
      v22 = _NFHardwareGetStringValue(v20);
      dispatch_get_specific(*v5);
      v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v23)
      {
        if (v22)
          v24 = v22;
        else
          v24 = "??";
        v23(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 170, a1, "IONameMatched", v24);
      }
      dispatch_get_specific(*v5);
      v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v22)
          v26 = v22;
        else
          v26 = "??";
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 170;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = "IONameMatched";
        *(_WORD *)&buf[38] = 2080;
        *(_QWORD *)&buf[40] = v26;
        _os_log_impl(&dword_2295E9000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v22)
        free(v22);
      CFRelease(v21);
    }
    v27 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOMatchCategory"), 0, 0);
    if (v27)
    {
      v28 = v27;
      v29 = _NFHardwareGetStringValue(v27);
      dispatch_get_specific(*v5);
      v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v30)
      {
        if (v29)
          v31 = v29;
        else
          v31 = "??";
        v30(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 178, a1, "IOMatchCategory", v31);
      }
      dispatch_get_specific(*v5);
      v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (v29)
          v33 = v29;
        else
          v33 = "??";
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 178;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = "IOMatchCategory";
        *(_WORD *)&buf[38] = 2080;
        *(_QWORD *)&buf[40] = v33;
        _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v29)
        free(v29);
      CFRelease(v28);
    }
    v34 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOUserClientClass"), 0, 0);
    if (v34)
    {
      v35 = v34;
      v36 = _NFHardwareGetStringValue(v34);
      dispatch_get_specific(*v5);
      v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v37)
      {
        if (v36)
          v38 = v36;
        else
          v38 = "??";
        v37(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 186, a1, "IOUserClientClass", v38);
      }
      dispatch_get_specific(*v5);
      v39 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        if (v36)
          v40 = v36;
        else
          v40 = "??";
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 186;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = "IOUserClientClass";
        *(_WORD *)&buf[38] = 2080;
        *(_QWORD *)&buf[40] = v40;
        _os_log_impl(&dword_2295E9000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v36)
        free(v36);
      CFRelease(v35);
    }
    IOObjectRelease(MatchingService);
  }
  else
  {
    if (Logger)
      Logger(6, "%s:%i %s NOT found", "_NFHardwarePrintNode", 193, a1);
    dispatch_get_specific(*v5);
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_NFHardwarePrintNode";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 193;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = a1;
      _os_log_impl(&dword_2295E9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s NOT found", buf, 0x1Cu);
    }
  }
}

char *_NFHardwareGetStringValue(const __CFString *a1)
{
  CFTypeID v2;
  char *v3;

  v2 = CFGetTypeID(a1);
  if (v2 != CFStringGetTypeID())
    return strdup("");
  v3 = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
  if (v3)
    CFStringGetCString(a1, v3, 256, 0x8000100u);
  return v3;
}

uint64_t _NFHardwareWalkTree(io_iterator_t a1, const char *a2)
{
  const void **v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  const __CFString *CFProperty;
  const __CFString *v9;
  char *StringValue;
  char *v11;
  uint64_t v12;
  _BOOL4 v13;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v15;
  const __CFString *v16;
  char *v17;
  void (*v18)(uint64_t, const char *, ...);
  NSObject *v19;
  void (*v20)(uint64_t, const char *, ...);
  const char *v21;
  NSObject *v22;
  const char *v23;
  const void **v24;
  void (*v25)(uint64_t, const char *, ...);
  NSObject *v26;
  unsigned int v28;
  char __s1[48];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  if (a1 && IOIteratorIsValid(a1))
  {
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    while (1)
    {
      v5 = IOIteratorNext(a1);
      if (!(_DWORD)v5)
        return 0;
      v6 = v5;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v30 = 0u;
      memset(__s1, 0, sizeof(__s1));
      v7 = MEMORY[0x22E2CD120](v5, __s1) ? 0 : strdup(__s1);
      CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, CFSTR("IONameMatch"), 0, 0);
      if (CFProperty)
      {
        v9 = CFProperty;
        StringValue = _NFHardwareGetStringValue(CFProperty);
        if (!StringValue)
          goto LABEL_12;
        v11 = StringValue;
        if (strcmp(StringValue, a2))
          goto LABEL_11;
        dispatch_get_specific(*v4);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(6, "%s:%i Found property %s : %s", "_NFHardwareIsEntryMatching", 208, "IONameMatch", v11);
        dispatch_get_specific(*v4);
        v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__s1 = 136446978;
          *(_QWORD *)&__s1[4] = "_NFHardwareIsEntryMatching";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 208;
          *(_WORD *)&__s1[18] = 2080;
          *(_QWORD *)&__s1[20] = "IONameMatch";
          *(_WORD *)&__s1[28] = 2080;
          *(_QWORD *)&__s1[30] = v11;
          _os_log_impl(&dword_2295E9000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
        }
        free(v11);
        CFRelease(v9);
        v16 = (const __CFString *)IORegistryEntryCreateCFProperty(v6, CFSTR("IOClass"), 0, 0);
        if (v16)
          break;
      }
LABEL_13:
      if (MEMORY[0x22E2CD114](v6, "IOService", &v28))
      {
        v12 = 0;
        v13 = 0;
      }
      else
      {
        IOObjectRelease(v6);
        v12 = _NFHardwareWalkTree(v28, a2);
        v13 = v12 != 0;
        LODWORD(v6) = v28;
      }
      IOObjectRelease(v6);
      if (v7)
        free(v7);
      if (v13)
        return v12;
      if (!IOIteratorIsValid(a1))
        goto LABEL_46;
    }
    v9 = v16;
    v17 = _NFHardwareGetStringValue(v16);
    if (v17)
    {
      v11 = v17;
      if (!strcmp(v17, "AppleStockholmControl"))
      {
        dispatch_get_specific(*v4);
        v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v18)
          v18(6, "%s:%i Found property %s : %s", "_NFHardwareIsEntryMatching", 220, "IOPropertyMatch", v11);
        dispatch_get_specific(*v4);
        v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__s1 = 136446978;
          *(_QWORD *)&__s1[4] = "_NFHardwareIsEntryMatching";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 220;
          *(_WORD *)&__s1[18] = 2080;
          *(_QWORD *)&__s1[20] = "IOPropertyMatch";
          *(_WORD *)&__s1[28] = 2080;
          *(_QWORD *)&__s1[30] = v11;
          _os_log_impl(&dword_2295E9000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
        }
        free(v11);
        CFRelease(v9);
        dispatch_get_specific(*v4);
        v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v20)
        {
          if (v7)
            v21 = v7;
          else
            v21 = "??";
          v20(6, "%s:%i %s has matching {%s / %s}", "_NFHardwareWalkTree", 268, v21, "AppleStockholmControl", a2);
        }
        dispatch_get_specific(*v4);
        v22 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          if (v7)
            v23 = v7;
          else
            v23 = "??";
          *(_DWORD *)__s1 = 136447234;
          *(_QWORD *)&__s1[4] = "_NFHardwareWalkTree";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 268;
          *(_WORD *)&__s1[18] = 2080;
          *(_QWORD *)&__s1[20] = v23;
          *(_WORD *)&__s1[28] = 2080;
          *(_QWORD *)&__s1[30] = "AppleStockholmControl";
          *(_WORD *)&__s1[38] = 2080;
          *(_QWORD *)&__s1[40] = a2;
          _os_log_impl(&dword_2295E9000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has matching {%s / %s}", (uint8_t *)__s1, 0x30u);
        }
        if (v7)
          free(v7);
        return v6;
      }
LABEL_11:
      free(v11);
    }
LABEL_12:
    CFRelease(v9);
    goto LABEL_13;
  }
  v12 = 0;
LABEL_46:
  v24 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v25)
    v25(3, "%s:%i Invalid iterator", "_NFHardwareWalkTree", 257);
  dispatch_get_specific(*v24);
  v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__s1 = 136446466;
    *(_QWORD *)&__s1[4] = "_NFHardwareWalkTree";
    *(_WORD *)&__s1[12] = 1024;
    *(_DWORD *)&__s1[14] = 257;
    _os_log_impl(&dword_2295E9000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid iterator", (uint8_t *)__s1, 0x12u);
  }
  return v12;
}

int *NFHardwareSerialDebugger(int a1)
{
  int *v2;
  BOOL v3;
  int v4;
  int v5;
  int v6;
  char v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;

  if ((!a1 || (v2 = (int *)gDebuggers_0) == 0) && ((a1 & 1) != 0 || (v2 = (int *)gDebuggers_1) == 0))
  {
    v2 = (int *)malloc_type_calloc(1uLL, 0x58uLL, 0x10300409288EE5CuLL);
    if (v2)
    {
      if (NFHardwareSerialIsInRestoreOS_onceToken != -1)
        dispatch_once(&NFHardwareSerialIsInRestoreOS_onceToken, &__block_literal_global_0);
      v3 = NFHardwareSerialIsInRestoreOS_inRestoreOS == 0;
      if (NFHardwareSerialIsInRestoreOS_inRestoreOS)
        v4 = 4142;
      else
        v4 = 1024;
      if (NFHardwareSerialIsInRestoreOS_inRestoreOS)
        v5 = 4096;
      else
        v5 = 128;
      *v2 = v4;
      v2[1] = v5;
      v2[2] = v5;
      v6 = v4 + 37;
      if (v3)
        v7 = 7;
      else
        v7 = 12;
      v8 = (v6 << v7);
      v2[6] = v8;
      *((_QWORD *)v2 + 2) = malloc_type_calloc(1uLL, v8, 0x100004077774924uLL);
      v9 = malloc_type_calloc(1uLL, *v2, 0x100004077774924uLL);
      v10 = *((_QWORD *)v2 + 2);
      *((_QWORD *)v2 + 4) = v10;
      *((_QWORD *)v2 + 5) = v10;
      *((_QWORD *)v2 + 6) = 0;
      *((_QWORD *)v2 + 7) = v9;
      v2[16] = 0;
      *((_BYTE *)v2 + 68) = a1;
      *((_QWORD *)v2 + 9) = 0;
      v11 = &gDebuggers_1;
      v2[20] = 0;
      if (a1)
        v11 = &gDebuggers_0;
      *v11 = (uint64_t)v2;
    }
  }
  return v2;
}

uint64_t NFHardwareSerialDebugLastMessage(int a1)
{
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v1 = &gDebuggers_1;
  if (!a1)
    v1 = &gDebuggers_0;
  v2 = *v1;
  if (*v1)
  {
    v3 = (os_unfair_lock_s *)(v2 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 80));
    v2 = *(_QWORD *)(v2 + 72);
    os_unfair_lock_unlock(v3);
  }
  return v2;
}

void NFHardwareSerialDebugLog(os_unfair_lock_s *a1, int a2, char *a3, unint64_t a4)
{
  char *v8;
  char *v9;
  char *v10;
  unint64_t v11;
  unint64_t os_unfair_lock_opaque;
  int v13;
  char *v14;
  char v15;
  char *v16;
  uint64_t v17;
  int v18;
  char *v19;
  const void **v20;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v22;
  char *v23;
  int v24;
  int v25;
  uint64_t v26;
  timeval v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27.tv_sec = 0;
  *(_QWORD *)&v27.tv_usec = 0;
  gettimeofday(&v27, 0);
  os_unfair_lock_lock(a1 + 20);
  v8 = *(char **)&a1[4]._os_unfair_lock_opaque;
  if (v8 && *(_QWORD *)&a1[14]._os_unfair_lock_opaque)
  {
    v9 = *(char **)&a1[10]._os_unfair_lock_opaque;
    v10 = *(char **)v9;
    if (!*(_QWORD *)v9)
    {
      *(_QWORD *)v9 = v8;
      v10 = v8;
    }
    v11 = (unint64_t)&v8[a1[6]._os_unfair_lock_opaque];
    os_unfair_lock_opaque = (int)a1->_os_unfair_lock_opaque;
    if (os_unfair_lock_opaque >= a4)
      LODWORD(os_unfair_lock_opaque) = a4;
    v13 = os_unfair_lock_opaque + 37;
    if ((int)os_unfair_lock_opaque + 37 >= 1)
    {
      v14 = *(char **)&a1[8]._os_unfair_lock_opaque;
      v15 = 1;
      v16 = v10;
      while (1)
      {
        v17 = v14 - v16;
        if (v14 < v16 || v14 == v9 && v14 == v16 && v16 == v8)
          break;
        if (v17 >= v13)
          goto LABEL_24;
        v19 = *(char **)v14;
        *(_QWORD *)&a1[8]._os_unfair_lock_opaque = *(_QWORD *)v14;
        --a1[16]._os_unfair_lock_opaque;
        if (v14 <= v19)
        {
          LODWORD(v17) = (_DWORD)v19 - (_DWORD)v16;
          v14 = v19;
LABEL_24:
          v18 = v17;
LABEL_16:
          v15 = 0;
          v13 -= v18;
          v16 += (int)v17;
          if ((unint64_t)v16 >= v11)
            v16 = v8;
          goto LABEL_18;
        }
        v14 = v19;
LABEL_18:
        if (v13 <= 0)
          goto LABEL_30;
      }
      LODWORD(v17) = v11 - (_DWORD)v16;
      if ((v15 & ((v11 - (_DWORD)v16) < 0x25)) != 0)
        v18 = 0;
      else
        v18 = v11 - (_DWORD)v16;
      goto LABEL_16;
    }
LABEL_30:
    if ((unint64_t)(v10 + 37) > v11)
    {
      *(_QWORD *)v9 = v8;
      v10 = v8;
    }
    *(timeval *)(v10 + 8) = v27;
    *((_DWORD *)v10 + 6) = a2;
    *(_QWORD *)(v10 + 28) = a4;
    v23 = v10 + 36;
    v24 = v11 - ((_DWORD)v10 + 36);
    v25 = os_unfair_lock_opaque - v24;
    if ((int)os_unfair_lock_opaque > v24)
    {
      memcpy(v10 + 36, a3, v24);
      a3 += v24;
      v23 = *(char **)&a1[4]._os_unfair_lock_opaque;
      LODWORD(os_unfair_lock_opaque) = v25;
    }
    if ((_DWORD)os_unfair_lock_opaque)
    {
      v26 = (int)os_unfair_lock_opaque;
      memcpy(v23, a3, (int)os_unfair_lock_opaque);
      a2 = *((_DWORD *)v10 + 6);
    }
    else
    {
      v26 = 0;
    }
    *(_QWORD *)v10 = &v23[v26];
    *(_QWORD *)&a1[10]._os_unfair_lock_opaque = v10;
    ++a1[16]._os_unfair_lock_opaque;
    if (a2 == 5)
      *(_QWORD *)&a1[12]._os_unfair_lock_opaque = v10;
    os_unfair_lock_unlock(a1 + 20);
  }
  else
  {
    v20 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Buffers not allocated", "NFHardwareSerialDebugLog", 274);
    dispatch_get_specific(*v20);
    v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "NFHardwareSerialDebugLog";
      v30 = 1024;
      v31 = 274;
      _os_log_impl(&dword_2295E9000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
    }
  }
}

void NFHardwareSerialDebugDump_wCB(int *a1, void (*a2)(_QWORD, CFDataRef))
{
  os_unfair_lock_s *v4;
  const void **v5;
  void *v6;
  uint64_t *v7;
  char *v8;
  char *v9;
  int v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void (*v26)(uint64_t, const char *, ...);
  NSObject *v27;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v29;
  unint64_t v30;
  const void **v31;
  const __CFString *v32;
  CFIndex AppIntegerValue;
  void (*v34)(uint64_t, const char *, ...);
  NSObject *v35;
  const __CFAllocator *v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  const void *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  void *v52;
  CFDataRef v53;
  CFDataRef v54;
  void (*v55)(uint64_t, const char *, ...);
  NSObject *v56;
  _QWORD *v57;
  os_unfair_lock_s *lock;
  uint8_t v59[4];
  const char *v60;
  __int16 v61;
  int v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  unint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 20);
  v5 = (const void **)MEMORY[0x24BEDCDB0];
  if (*((_QWORD *)a1 + 2) && *((_QWORD *)a1 + 7))
  {
    lock = v4;
    v6 = (void *)*((_QWORD *)a1 + 9);
    if (v6)
    {
      free(v6);
      *((_QWORD *)a1 + 9) = 0;
    }
    v7 = (uint64_t *)*((_QWORD *)a1 + 6);
    if (!v7)
      v7 = (uint64_t *)*((_QWORD *)a1 + 4);
    v8 = (char *)malloc_type_calloc(1uLL, 0x100uLL, 0x100004077774924uLL);
    *((_QWORD *)a1 + 9) = v8;
    if (v8)
    {
      if (v7 != **((uint64_t ***)a1 + 5))
      {
        v9 = v8;
        v10 = 255;
        while (1)
        {
          v11 = *((unsigned int *)v7 + 6);
          if ((v11 - 11) < 0xFFFFFFF6)
            goto LABEL_43;
          v12 = snprintf(v9, v10, "%s", *((const char **)&NFHardwareSerialDebugMsgTypeString + v11));
          v13 = __OFSUB__(v10, v12);
          v10 -= v12;
          if ((v10 < 0) ^ v13 | (v10 == 0))
            goto LABEL_43;
          v9 += v12;
          v14 = *(uint64_t *)((char *)v7 + 28);
          if (v14 >= *a1)
            v15 = *a1;
          else
            v15 = *(uint64_t *)((char *)v7 + 28);
          v16 = (unsigned __int8 *)v7 + 36;
          v17 = *((_QWORD *)a1 + 2) + a1[6];
          if ((unint64_t)v7 + v14 + 36 > v17)
          {
            v18 = (int)v17 - (int)v16;
            if (v18 >= v15)
              v19 = v15;
            else
              v19 = v18;
            if (v19)
            {
              v20 = v19;
              do
              {
                v21 = *v16++;
                v22 = snprintf(v9, v10, "%02x", v21);
                v13 = __OFSUB__(v10, v22);
                v10 -= v22;
                if ((v10 < 0) ^ v13 | (v10 == 0))
                  goto LABEL_43;
                v9 += v22;
                --v20;
              }
              while (v20);
              v16 = (unsigned __int8 *)*((_QWORD *)a1 + 2);
            }
            else
            {
              v16 = (unsigned __int8 *)*((_QWORD *)a1 + 2);
            }
            v15 -= v19;
          }
          if (v15)
            break;
LABEL_29:
          v7 = (uint64_t *)*v7;
          if (v7 == **((uint64_t ***)a1 + 5) || v10 <= 0)
            goto LABEL_43;
        }
        while (1)
        {
          v23 = *v16++;
          v24 = snprintf(v9, v10, "%02x", v23);
          v13 = __OFSUB__(v10, v24);
          v10 -= v24;
          if ((v10 < 0) ^ v13 | (v10 == 0))
            break;
          v9 += v24;
          if (!--v15)
            goto LABEL_29;
        }
      }
    }
    else
    {
      dispatch_get_specific(*v5);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i failed to allocate last msg buffer", "_NFHardwareSerialDebugSaveLastMessage", 177);
      dispatch_get_specific(*v5);
      v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v64 = "_NFHardwareSerialDebugSaveLastMessage";
        v65 = 1024;
        v66 = 177;
        _os_log_impl(&dword_2295E9000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to allocate last msg buffer", buf, 0x12u);
      }
    }
LABEL_43:
    v30 = a1[2];
    if (NFHardwareSerialIsInRestoreOS_onceToken != -1)
      dispatch_once(&NFHardwareSerialIsInRestoreOS_onceToken, &__block_literal_global_0);
    v31 = (const void **)MEMORY[0x24BEDCDB0];
    if (!NFHardwareSerialIsInRestoreOS_inRestoreOS)
    {
      buf[0] = 0;
      v32 = *((_BYTE *)a1 + 68) ? CFSTR("com.apple.stockholm") : (const __CFString *)*MEMORY[0x24BDBD580];
      CFPreferencesAppSynchronize(v32);
      AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("UARTDumpMaxEntries"), v32, buf);
      if (buf[0])
        v30 = AppIntegerValue;
    }
    dispatch_get_specific(*v31);
    v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34)
      v34(6, "%s:%i Printing last %ld messages", "NFHardwareSerialDebugDump_wCB", 360, v30);
    dispatch_get_specific(*v31);
    v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v64 = "NFHardwareSerialDebugDump_wCB";
      v65 = 1024;
      v66 = 360;
      v67 = 2048;
      v68 = v30;
      _os_log_impl(&dword_2295E9000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Printing last %ld messages", buf, 0x1Cu);
    }
    v36 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v37 = (uint64_t *)*((_QWORD *)a1 + 4);
    while (1)
    {
      v38 = *((unsigned int *)v37 + 6);
      if ((_DWORD)v38)
      {
        if (v38 < 0xB)
        {
          v39 = a1[16];
          if (v30 > v39)
          {
            v40 = (const char *)*((_QWORD *)&NFHardwareSerialDebugMsgTypeString + v38);
            v41 = "";
            if (*(uint64_t *)((char *)v37 + 28) > (unint64_t)*a1)
              v41 = "TRUNCATED";
            snprintf((char *)buf, 0x80uLL, "%ld.%.6d %s %s", v37[1], *((_DWORD *)v37 + 4), v40, v41);
            v42 = *((_QWORD *)a1 + 4);
            v43 = *(_QWORD *)(v42 + 28);
            if (v43 >= *a1)
              LODWORD(v44) = *a1;
            else
              v44 = *(_QWORD *)(v42 + 28);
            v45 = (const void *)(v42 + 36);
            v46 = v42 + 36 + v43;
            v47 = *((_QWORD *)a1 + 2) + a1[6];
            if (v46 > v47)
            {
              v48 = *((_QWORD *)a1 + 7);
              v49 = v47 - (_DWORD)v45;
              if (v49 >= (int)v44)
                v50 = v44;
              else
                v50 = v49;
              memcpy(*((void **)a1 + 7), v45, v50);
              v51 = v44 - v50;
              v52 = (void *)(v48 + v50);
              v31 = (const void **)MEMORY[0x24BEDCDB0];
              memcpy(v52, *((const void **)a1 + 2), v51);
              v45 = (const void *)*((_QWORD *)a1 + 7);
            }
            if (a2)
            {
              v53 = CFDataCreate(v36, (const UInt8 *)v45, (int)v44);
              if (v53)
              {
                v54 = v53;
                a2(*(unsigned int *)(*((_QWORD *)a1 + 4) + 24), v53);
                CFRelease(v54);
              }
              else
              {
                dispatch_get_specific(*v31);
                v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                if (v55)
                  v55(3, "%s:%i failed to msg", "NFHardwareSerialDebugDump_wCB", 409);
                dispatch_get_specific(*v31);
                v56 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v59 = 136446466;
                  v60 = "NFHardwareSerialDebugDump_wCB";
                  v61 = 1024;
                  v62 = 409;
                  _os_log_impl(&dword_2295E9000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to msg", v59, 0x12u);
                }
              }
            }
            NFSharedDumpTransport();
            v37 = (uint64_t *)*((_QWORD *)a1 + 4);
            LODWORD(v39) = a1[16];
          }
          *((_DWORD *)v37 + 6) = 0;
          v37 = (uint64_t *)*v37;
          *((_QWORD *)a1 + 4) = v37;
          goto LABEL_80;
        }
        *((_DWORD *)v37 + 6) = 0;
      }
      v37 = (uint64_t *)*v37;
      *((_QWORD *)a1 + 4) = v37;
      LODWORD(v39) = a1[16];
LABEL_80:
      a1[16] = v39 - 1;
      if (v37 == **((uint64_t ***)a1 + 5))
      {
        v57 = (_QWORD *)*((_QWORD *)a1 + 2);
        *((_QWORD *)a1 + 4) = v57;
        *((_QWORD *)a1 + 5) = v57;
        *v57 = v57;
        NFSharedDumpTransport();
        os_unfair_lock_unlock(lock);
        return;
      }
    }
  }
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v26)
    v26(3, "%s:%i Buffers not allocated", "NFHardwareSerialDebugDump_wCB", 338);
  dispatch_get_specific(*v5);
  v27 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v64 = "NFHardwareSerialDebugDump_wCB";
    v65 = 1024;
    v66 = 338;
    _os_log_impl(&dword_2295E9000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
  }
}

void NFHardwareSerialDebugDump()
{
  if (gDebuggers_0)
    NFHardwareSerialDebugDump_wCB((int *)gDebuggers_0, 0);
  if (gDebuggers_1)
    NFHardwareSerialDebugDump_wCB((int *)gDebuggers_1, 0);
}

uint64_t NFHardwareSerialDebugMaxEntriesPrinted(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

_QWORD *NFHardwareInterfaceOpen(const char *a1, NSObject *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  char *v8;
  const void **v9;
  void (*v10)(uint64_t, const char *, ...);
  NSObject *v11;
  const void **v12;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  int *v18;
  _BYTE *v19;
  uint64_t (*v20)(uint64_t);
  int v21;
  void **v22;
  int *v23;
  _BYTE *v24;
  uint64_t (*v25)(uint64_t);
  int v26;
  void **v27;
  const void **v28;
  void (*v29)(uint64_t, const char *, ...);
  NSObject *v30;
  void (*v31)(void);
  void (*v32)(void);
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (!v4)
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to allocate interface %s", "NFHardwareInterfaceOpen", 59, a1);
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "NFHardwareInterfaceOpen";
      v36 = 1024;
      v37 = 59;
      v38 = 2080;
      v39 = a1;
      _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
    }
    return 0;
  }
  v5 = v4;
  v6 = malloc_type_calloc(1uLL, 0xF8uLL, 0x9004090A32887uLL);
  if (!v6)
  {
    v15 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i Failed to allocate interface %s", "NFHardwareInterfaceOpen", 65, a1);
    dispatch_get_specific(*v15);
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "NFHardwareInterfaceOpen";
      v36 = 1024;
      v37 = 65;
      v38 = 2080;
      v39 = a1;
      _os_log_impl(&dword_2295E9000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
    }
    goto LABEL_48;
  }
  v7 = v6;
  *v5 = v6;
  if (!a1)
    a1 = "com.apple.stockholm";
  v8 = strdup(a1);
  *(_QWORD *)v7 = v8;
  if (!strncmp("com.apple.", v8, 0xAuLL))
  {
    v18 = NFHardwareSerialOpen(v8, a2, 0);
    *((_QWORD *)v7 + 17) = v18;
    *((_QWORD *)v7 + 1) = NFHardwareSerialSetBaudRate;
    *((_QWORD *)v7 + 2) = 0;
    *((_QWORD *)v7 + 3) = NFHardwareSerialReadBlock;
    *((_QWORD *)v7 + 4) = 0;
    *((_QWORD *)v7 + 7) = NFHardwareSerialReadBlockAbort;
    *((_QWORD *)v7 + 8) = NFHardwareSerialWriteBlockAbort;
    *((_QWORD *)v7 + 5) = NFHardwareSerialWriteBlock;
    *((_QWORD *)v7 + 6) = 0;
    *((_QWORD *)v7 + 9) = NFHardwareSerialFlush;
    *((_QWORD *)v7 + 10) = NFHardwareSerialReset;
    *((_QWORD *)v7 + 11) = NFHardwareSerialSetLogFunction;
    if (v18 && (v19 = (_BYTE *)*((_QWORD *)v18 + 1)) != 0 && !*v19)
      v20 = NFHardwareSerialGetCTS;
    else
      v20 = 0;
    *((_QWORD *)v7 + 12) = v20;
    *((_QWORD *)v7 + 13) = NFHardwareSerialSetCRCEnabled;
    *((_QWORD *)v7 + 14) = NFHardwareSerialSetOnDemandClientMode;
    *((_QWORD *)v7 + 15) = NFHardwareSerialQuerySPMIError;
    *((_QWORD *)v7 + 16) = NFHardwareSerialClose;
    if (strcasestr(*(const char **)v7, "hammerfest"))
      v21 = 2;
    else
      v21 = 1;
    v22 = NFHardwareGPIOOpen(v21);
    *((_QWORD *)v7 + 30) = v22;
    *((_QWORD *)v7 + 18) = NFHardwareGPIOSetDeviceWake;
    *((_QWORD *)v7 + 19) = NFHardwareGPIOSetPower;
    *((_QWORD *)v7 + 20) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((_QWORD *)v7 + 21) = NFHardwareGPIOSetVBAT;
    *((_QWORD *)v7 + 22) = NFHardwareGPIOSetDownloadRequest;
    *((_QWORD *)v7 + 23) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((_QWORD *)v7 + 28) = NFHardwareGPIOSPMIFollowerReset;
    *((_QWORD *)v7 + 29) = NFHardwareGPIOClose;
    *((_QWORD *)v7 + 24) = NFHardwareGPIOIsHostWakeCapable;
    *((_QWORD *)v7 + 25) = NFHardwareGPIOValidateSPMIConfig;
    *((_QWORD *)v7 + 26) = NFHardwareGPIOConfigureHammerfestSPMI;
    *((_QWORD *)v7 + 27) = NFHardwareGPIOWasItSPMINack;
    if (!v22)
      goto LABEL_37;
  }
  else
  {
    if (strncmp("/dev/", v8, 5uLL))
    {
      v9 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v10)
        v10(3, "%s:%i Unknown interface %s", "NFHardwareInterfaceOpen", 226, a1);
      dispatch_get_specific(*v9);
      v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v35 = "NFHardwareInterfaceOpen";
        v36 = 1024;
        v37 = 226;
        v38 = 2080;
        v39 = a1;
        _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Unknown interface %s", buf, 0x1Cu);
      }
LABEL_47:
      free(*(void **)v7);
      free(v7);
LABEL_48:
      free(v5);
      return 0;
    }
    v23 = NFHardwareSerialOpen(v8, a2, 0);
    *((_QWORD *)v7 + 17) = v23;
    *((_QWORD *)v7 + 1) = NFHardwareSerialSetBaudRate;
    *((_QWORD *)v7 + 2) = 0;
    *((_QWORD *)v7 + 3) = NFHardwareSerialReadBlock;
    *((_QWORD *)v7 + 4) = 0;
    *((_QWORD *)v7 + 7) = NFHardwareSerialReadBlockAbort;
    *((_QWORD *)v7 + 8) = NFHardwareSerialWriteBlockAbort;
    *((_QWORD *)v7 + 5) = NFHardwareSerialWriteBlock;
    *((_QWORD *)v7 + 6) = 0;
    *((_QWORD *)v7 + 9) = NFHardwareSerialFlush;
    *((_QWORD *)v7 + 10) = NFHardwareSerialReset;
    *((_QWORD *)v7 + 11) = NFHardwareSerialSetLogFunction;
    if (v23 && (v24 = (_BYTE *)*((_QWORD *)v23 + 1)) != 0 && !*v24)
      v25 = NFHardwareSerialGetCTS;
    else
      v25 = 0;
    *((_QWORD *)v7 + 12) = v25;
    *((_QWORD *)v7 + 13) = NFHardwareSerialSetCRCEnabled;
    *((_QWORD *)v7 + 14) = NFHardwareSerialSetOnDemandClientMode;
    *((_QWORD *)v7 + 16) = NFHardwareSerialClose;
    if (strcasestr(*(const char **)v7, "hammerfest"))
      v26 = 1;
    else
      v26 = 2;
    v27 = NFHardwareGPIOOpen(v26);
    *((_QWORD *)v7 + 18) = NFHardwareGPIOSetDeviceWake;
    *((_QWORD *)v7 + 19) = NFHardwareGPIOSetPower;
    *((_QWORD *)v7 + 20) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((_QWORD *)v7 + 21) = NFHardwareGPIOSetVBAT;
    *((_QWORD *)v7 + 22) = NFHardwareGPIOSetDownloadRequest;
    *((_QWORD *)v7 + 23) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((_QWORD *)v7 + 24) = NFHardwareGPIOIsHostWakeCapable;
    *((_QWORD *)v7 + 27) = NFHardwareGPIOWasItSPMINack;
    *((_QWORD *)v7 + 28) = 0;
    *((_QWORD *)v7 + 15) = 0;
    *((_QWORD *)v7 + 29) = NFHardwareGPIOClose;
    *((_QWORD *)v7 + 30) = v27;
    if (!v27)
    {
LABEL_37:
      v28 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v29)
        v29(3, "%s:%i Failed to create context for interface %s", "NFHardwareInterfaceOpen", 234, a1);
      dispatch_get_specific(*v28);
      v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v35 = "NFHardwareInterfaceOpen";
        v36 = 1024;
        v37 = 234;
        v38 = 2080;
        v39 = a1;
        _os_log_impl(&dword_2295E9000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create context for interface %s", buf, 0x1Cu);
      }
      if (*((_QWORD *)v7 + 17))
      {
        v31 = (void (*)(void))*((_QWORD *)v7 + 16);
        if (v31)
          v31();
      }
      if (*((_QWORD *)v7 + 30))
      {
        v32 = (void (*)(void))*((_QWORD *)v7 + 29);
        if (v32)
          v32();
      }
      goto LABEL_47;
    }
  }
  if (!*((_QWORD *)v7 + 17))
    goto LABEL_37;
  return v5;
}

void NFHardwareInterfaceClose(void **a1)
{
  void **v2;
  void (*v3)(void *);
  void (*v4)(void *);

  v2 = (void **)*a1;
  v3 = (void (*)(void *))*((_QWORD *)*a1 + 16);
  if (v3)
    v3(v2[17]);
  v4 = (void (*)(void *))v2[29];
  if (v4)
    v4(v2[30]);
  free(*v2);
  *v2 = 0;
  free(*a1);
  free(a1);
}

uint64_t NFHardwareInterfaceResetSerial(uint64_t *a1)
{
  uint64_t v1;
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  uint64_t (*v5)(_QWORD);
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i ", "NFHardwareInterfaceResetSerial", 269);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "NFHardwareInterfaceResetSerial";
    v9 = 1024;
    v10 = 269;
    _os_log_impl(&dword_2295E9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  v5 = *(uint64_t (**)(_QWORD))(v1 + 80);
  if (v5)
    return v5(*(_QWORD *)(v1 + 136));
  else
    return 0;
}

uint64_t NFHardwareInterfaceSetPower(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 152);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetPMUStandbyEnabled(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 160);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetVBAT(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 168);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetDownloadRequest(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 176);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetPMUStandbyPowerEnabled(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 184);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetDeviceWake(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 144);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetLogFunction(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 88);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetBaudRate(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 8);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 1;
}

uint64_t NFHardwareInterfaceRead(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 16);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  v3 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i No interface defined for reading", "NFHardwareInterfaceRead", 346);
  dispatch_get_specific(*v3);
  v5 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v7 = "NFHardwareInterfaceRead";
    v8 = 1024;
    v9 = 346;
    _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
  }
  return 0;
}

uint64_t NFHardwareInterfaceReadBlock(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 24);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  v3 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i No interface defined for reading", "NFHardwareInterfaceReadBlock", 356);
  dispatch_get_specific(*v3);
  v5 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v7 = "NFHardwareInterfaceReadBlock";
    v8 = 1024;
    v9 = 356;
    _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
  }
  return 1;
}

uint64_t NFHardwareInterfaceWrite(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 32);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 0;
}

uint64_t NFHardwareInterfaceWriteBlock(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 40);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  v3 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i No interface defined for writing", "NFHardwareInterfaceWriteBlock", 375);
  dispatch_get_specific(*v3);
  v5 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v7 = "NFHardwareInterfaceWriteBlock";
    v8 = 1024;
    v9 = 375;
    _os_log_impl(&dword_2295E9000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for writing", buf, 0x12u);
  }
  return 1;
}

uint64_t NFHardwareInterfaceReadAbort(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 48);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 1;
}

uint64_t NFHardwareInterfaceReadBlockAbort(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 56);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 0;
}

uint64_t NFHardwareInterfaceWriteBlockAbort(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 64);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 0;
}

uint64_t NFHardwareInterfaceFlush(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 72);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 1;
}

uint64_t NFHardwareInterfaceGetFlowControl(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 96);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetCRCEnabled(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 104);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetOnDemandClientMode(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 112);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 136));
  else
    return 1;
}

uint64_t NFHardwareInterfaceIsHostWakeCapable(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 192);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 0;
}

uint64_t NFHardwareInterfaceFollowerReset(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 224);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 0;
}

BOOL NFHardwareInterfaceQuerySPMIError(uint64_t a1)
{
  unsigned int (*v1)(_QWORD);

  v1 = *(unsigned int (**)(_QWORD))(*(_QWORD *)a1 + 120);
  return v1 && v1(*(_QWORD *)(*(_QWORD *)a1 + 136)) != 0;
}

BOOL NFHardwareDebug(void **a1)
{
  void **v2;
  NSObject *global_queue;
  void **v4;
  const void **v5;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v7;
  uint64_t (*v8)(_QWORD);
  int v9;
  void (*v10)(uint64_t, const char *, ...);
  NSObject *v11;
  uint64_t (*v12)(_QWORD, _QWORD);
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  unsigned int (*v17)(_QWORD);
  int v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  uint64_t (*v21)(_QWORD, uint64_t);
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  unsigned int (*v26)(_QWORD);
  int v27;
  void (*v28)(uint64_t, const char *, ...);
  NSObject *v29;
  uint64_t (*v30)(_QWORD, _QWORD);
  void (*v31)(uint64_t, const char *, ...);
  NSObject *v32;
  unsigned int (*v33)(_QWORD);
  int v34;
  unsigned int (*v35)(_QWORD);
  int v36;
  unsigned int (*v37)(_QWORD);
  int v38;
  unsigned int (*v39)(_QWORD);
  int v40;
  unsigned int (*v41)(_QWORD);
  int v42;
  unsigned int (*v43)(_QWORD);
  int v44;
  unsigned int (*v45)(_QWORD);
  int v46;
  void (*v47)(uint64_t, const char *, ...);
  NSObject *v48;
  unsigned int (*v49)(_QWORD);
  int v50;
  void (*v51)(uint64_t, const char *, ...);
  NSObject *v52;
  uint64_t (*v53)(_QWORD, uint64_t);
  void (*v54)(uint64_t, const char *, ...);
  NSObject *v55;
  void (*v56)(uint64_t, const char *, ...);
  NSObject *v57;
  unsigned int (*v58)(_QWORD);
  int v59;
  void (*v60)(uint64_t, const char *, ...);
  int v61;
  NSObject *v62;
  int v63;
  uint64_t (*v64)(_QWORD, _QWORD);
  void (*v65)(uint64_t, const char *, ...);
  NSObject *v66;
  int v67;
  uint64_t (*v68)(_QWORD, _QWORD);
  void (*v69)(uint64_t, const char *, ...);
  NSObject *v70;
  int v71;
  void (*v72)(uint64_t, const char *, ...);
  NSObject *v73;
  _BOOL8 result;
  const char *v75;
  void (*v76)(uint64_t, const char *, ...);
  void (*v77)(uint64_t, const char *, ...);
  NSObject *v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  _BOOL4 v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v4 = (void **)NFHardwareInterfaceOpen("/dev/tty.stockholm", global_queue);
    if (v4)
    {
      v2 = v4;
      if (*((_QWORD *)*v4 + 12))
        goto LABEL_6;
      NFHardwareInterfaceClose(v4);
    }
    return 1;
  }
  v2 = a1;
  if (!*((_QWORD *)*a1 + 12))
    return 1;
LABEL_6:
  v5 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i HW Debugging - current FLOW CHECK", "NFHardwareDebug", 485);
  dispatch_get_specific(*v5);
  v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 485;
    _os_log_impl(&dword_2295E9000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - current FLOW CHECK", buf, 0x12u);
  }
  v8 = (uint64_t (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v8)
    v9 = v8(*((_QWORD *)*v2 + 17));
  else
    v9 = 1;
  usleep(0xF4240u);
  dispatch_get_specific(*v5);
  v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v10)
    v10(6, "%s:%i HW Debugging starting - OFF", "NFHardwareDebug", 491);
  dispatch_get_specific(*v5);
  v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 491;
    _os_log_impl(&dword_2295E9000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging starting - OFF", buf, 0x12u);
  }
  v12 = (uint64_t (*)(_QWORD, _QWORD))*((_QWORD *)*v2 + 19);
  if (v12 && (v12(*((_QWORD *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i Error", "NFHardwareDebug", 494);
    dispatch_get_specific(*v5);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 494;
      _os_log_impl(&dword_2295E9000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v15)
    v15(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", "NFHardwareDebug", 502);
  dispatch_get_specific(*v5);
  v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 502;
    _os_log_impl(&dword_2295E9000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
  }
  v17 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v17)
    v18 = 2 * (v17(*((_QWORD *)*v2 + 17)) != 0);
  else
    v18 = 2;
  v85 = v9 != 0;
  dispatch_get_specific(*v5);
  v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v19)
    v19(6, "%s:%i HW Debugging - ON", "NFHardwareDebug", 506);
  dispatch_get_specific(*v5);
  v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 506;
    _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - ON", buf, 0x12u);
  }
  v21 = (uint64_t (*)(_QWORD, uint64_t))*((_QWORD *)*v2 + 19);
  if (v21 && (v21(*((_QWORD *)*v2 + 30), 1) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22)
      v22(3, "%s:%i Error", "NFHardwareDebug", 515);
    dispatch_get_specific(*v5);
    v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 515;
      _os_log_impl(&dword_2295E9000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v24)
    v24(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED ON", "NFHardwareDebug", 519);
  dispatch_get_specific(*v5);
  v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 519;
    _os_log_impl(&dword_2295E9000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
  }
  v26 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v26)
    v27 = 4 * (v26(*((_QWORD *)*v2 + 17)) != 0);
  else
    v27 = 4;
  v84 = v27;
  dispatch_get_specific(*v5);
  v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v28)
    v28(6, "%s:%i HW Debugging - SLEEP + wait 1.5s", "NFHardwareDebug", 524);
  dispatch_get_specific(*v5);
  v29 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 524;
    _os_log_impl(&dword_2295E9000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - SLEEP + wait 1.5s", buf, 0x12u);
  }
  v30 = (uint64_t (*)(_QWORD, _QWORD))*((_QWORD *)*v2 + 18);
  if (v30 && (v30(*((_QWORD *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31)
      v31(3, "%s:%i Error", "NFHardwareDebug", 527);
    dispatch_get_specific(*v5);
    v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 527;
      _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x30D40u);
  v33 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v33)
    v34 = 8 * (v33(*((_QWORD *)*v2 + 17)) != 0);
  else
    v34 = 8;
  usleep(0x30D40u);
  v35 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v35)
    v36 = 16 * (v35(*((_QWORD *)*v2 + 17)) != 0);
  else
    v36 = 16;
  v80 = v36;
  usleep(0x30D40u);
  v37 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v37)
    v38 = 32 * (v37(*((_QWORD *)*v2 + 17)) != 0);
  else
    v38 = 32;
  v83 = v38;
  usleep(0x30D40u);
  v39 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v39)
    v40 = (v39(*((_QWORD *)*v2 + 17)) != 0) << 6;
  else
    v40 = 64;
  v82 = v40;
  usleep(0x30D40u);
  v41 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v41)
    v42 = (v41(*((_QWORD *)*v2 + 17)) != 0) << 7;
  else
    v42 = 128;
  v81 = v42;
  usleep(0x30D40u);
  v43 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v43)
    v44 = (v43(*((_QWORD *)*v2 + 17)) != 0) << 8;
  else
    v44 = 256;
  v79 = v44;
  usleep(0x30D40u);
  v45 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v45)
    v46 = (v45(*((_QWORD *)*v2 + 17)) != 0) << 9;
  else
    v46 = 512;
  usleep(0x30D40u);
  dispatch_get_specific(*v5);
  v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v47)
    v47(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", "NFHardwareDebug", 560);
  dispatch_get_specific(*v5);
  v48 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 560;
    _os_log_impl(&dword_2295E9000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
  }
  v49 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v49)
    v50 = (v49(*((_QWORD *)*v2 + 17)) != 0) << 10;
  else
    v50 = 1024;
  dispatch_get_specific(*v5);
  v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v51)
    v51(6, "%s:%i HW Debugging - WAKE", "NFHardwareDebug", 564);
  dispatch_get_specific(*v5);
  v52 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 564;
    _os_log_impl(&dword_2295E9000, v52, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - WAKE", buf, 0x12u);
  }
  v53 = (uint64_t (*)(_QWORD, uint64_t))*((_QWORD *)*v2 + 18);
  if (v53 && (v53(*((_QWORD *)*v2 + 30), 1) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    v54 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v54)
      v54(3, "%s:%i Error", "NFHardwareDebug", 567);
    dispatch_get_specific(*v5);
    v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 567;
      _os_log_impl(&dword_2295E9000, v55, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  v56 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v56)
    v56(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED ON", "NFHardwareDebug", 571);
  dispatch_get_specific(*v5);
  v57 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 571;
    _os_log_impl(&dword_2295E9000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
  }
  v58 = (unsigned int (*)(_QWORD))*((_QWORD *)*v2 + 12);
  if (v58)
    v59 = (v58(*((_QWORD *)*v2 + 17)) != 0) << 11;
  else
    v59 = 2048;
  dispatch_get_specific(*v5);
  v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v60)
    v60(6, "%s:%i HW Debugging - POWERING OFF", "NFHardwareDebug", 575);
  v61 = v18 | v85 | v84;
  dispatch_get_specific(*v5);
  v62 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v87 = "NFHardwareDebug";
    v88 = 1024;
    v89 = 575;
    _os_log_impl(&dword_2295E9000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - POWERING OFF", buf, 0x12u);
  }
  v63 = v61 | v34;
  v64 = (uint64_t (*)(_QWORD, _QWORD))*((_QWORD *)*v2 + 18);
  if (v64 && (v64(*((_QWORD *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v65)
      v65(3, "%s:%i Error", "NFHardwareDebug", 577);
    dispatch_get_specific(*v5);
    v66 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 577;
      _os_log_impl(&dword_2295E9000, v66, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  v67 = v63 | v80;
  v68 = (uint64_t (*)(_QWORD, _QWORD))*((_QWORD *)*v2 + 19);
  if (v68 && (v68(*((_QWORD *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    v69 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v69)
      v69(3, "%s:%i Error", "NFHardwareDebug", 579);
    dispatch_get_specific(*v5);
    v70 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 579;
      _os_log_impl(&dword_2295E9000, v70, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  if (!a1)
    NFHardwareInterfaceClose(v2);
  v71 = v67 | v83 | v82 | v81 | v79 | v46 | v50 | v59;
  if (v71 == 4095)
  {
    dispatch_get_specific(*v5);
    v76 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v76)
      v76(3, "%s:%i HW error : unit is not powering cycling.", "NFHardwareDebug", 595);
    dispatch_get_specific(*v5);
    v73 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 595;
      v75 = "%{public}s:%i HW error : unit is not powering cycling.";
      goto LABEL_130;
    }
  }
  else
  {
    if (v71)
    {
      dispatch_get_specific(*v5);
      v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v77)
        v77(3, "%s:%i HW debugging result : 0x%04X", "NFHardwareDebug", 598, v71);
      dispatch_get_specific(*v5);
      v78 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v87 = "NFHardwareDebug";
        v88 = 1024;
        v89 = 598;
        v90 = 1024;
        v91 = v67 | v83 | v82 | v81 | v79 | v46 | v50 | v59;
        _os_log_impl(&dword_2295E9000, v78, OS_LOG_TYPE_ERROR, "%{public}s:%i HW debugging result : 0x%04X", buf, 0x18u);
      }
      return 1;
    }
    dispatch_get_specific(*v5);
    v72 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v72)
      v72(3, "%s:%i HW error : unit is not powering on.", "NFHardwareDebug", 592);
    dispatch_get_specific(*v5);
    v73 = NFSharedLogGetLogger();
    result = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136446466;
      v87 = "NFHardwareDebug";
      v88 = 1024;
      v89 = 592;
      v75 = "%{public}s:%i HW error : unit is not powering on.";
LABEL_130:
      _os_log_impl(&dword_2295E9000, v73, OS_LOG_TYPE_ERROR, v75, buf, 0x12u);
      return 0;
    }
  }
  return result;
}

uint64_t NFHardwareInterfaceValidateSPMIConfig(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 200);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceSetSPMIConfig(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 208);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 1;
}

uint64_t NFHardwareInterfaceWasItNACK(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 216);
  if (v1)
    return v1(*(_QWORD *)(*(_QWORD *)a1 + 240));
  else
    return 0;
}

uint64_t NFHardwareInterfaceIsSupported(char *__s2)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!__s2 || !strncmp("com.apple.", __s2, 0xAuLL) || !strncmp("/dev/", __s2, 5uLL))
    return NFHardwareSerialIsSupported(__s2);
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Unmatched interface %s", "NFHardwareInterfaceIsSupported", 648, __s2);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v7 = "NFHardwareInterfaceIsSupported";
    v8 = 1024;
    v9 = 648;
    v10 = 2080;
    v11 = __s2;
    _os_log_impl(&dword_2295E9000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Unmatched interface %s", buf, 0x1Cu);
  }
  return 0;
}

uint64_t NFHardwareInterfaceHasExternalSPMIIRQ(UInt8 *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  const __CFDictionary *v5;
  io_service_t v6;
  io_object_t v7;
  const __CFData *v8;
  const __CFData *v9;
  CFTypeID TypeID;
  const UInt8 *BytePtr;
  const UInt8 *v12;
  uint64_t v13;
  const void **v14;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD8B18];
  v3 = IOServiceNameMatching("stockholm-spmi");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
    return 0;
  IOObjectRelease(MatchingService);
  v5 = IOServiceNameMatching("stockholm");
  v6 = IOServiceGetMatchingService(v2, v5);
  if (v6)
  {
    v7 = v6;
    v8 = (const __CFData *)IORegistryEntrySearchCFProperty(v6, "IOService", CFSTR("se-spmi-irq"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (v8)
    {
      v9 = v8;
      TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v9))
      {
        BytePtr = CFDataGetBytePtr(v9);
        if (BytePtr)
        {
          v12 = BytePtr;
          if (CFDataGetLength(v9))
            *a1 = *v12;
        }
        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      v13 = 0;
    }
    IOObjectRelease(v7);
  }
  else
  {
    v14 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Unexpected state.", "NFHardwareInterfaceHasExternalSPMIIRQ", 681);
    dispatch_get_specific(*v14);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v19 = "NFHardwareInterfaceHasExternalSPMIIRQ";
      v20 = 1024;
      v21 = 681;
      _os_log_impl(&dword_2295E9000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected state.", buf, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return v13;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x24BDBC138](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC530](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC8A8](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

uint64_t GetElapsedTimeInMillisecondsFromMachTime()
{
  return MEMORY[0x24BEDCC60]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x24BDD7F28](*(_QWORD *)&connect);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8660](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88B8](*(_QWORD *)&entry, plane, *(_QWORD *)&options, iterator);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x24BDD88C8](*(_QWORD *)&entry, plane, child);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return MEMORY[0x24BDD8940](*(_QWORD *)&mainPort);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t NFDataAsHexString()
{
  return MEMORY[0x24BEDCC78]();
}

uint64_t NFDataCreateWithBytes()
{
  return MEMORY[0x24BEDCC80]();
}

uint64_t NFDataCreateWithFile()
{
  return MEMORY[0x24BEDCC90]();
}

uint64_t NFDataCreateWithHexString()
{
  return MEMORY[0x24BEDCC98]();
}

uint64_t NFDataCreateWithLength()
{
  return MEMORY[0x24BEDCCA0]();
}

uint64_t NFDataRelease()
{
  return MEMORY[0x24BEDCCB0]();
}

uint64_t NFDriverAntennaSelfTest()
{
  return MEMORY[0x24BED8A88]();
}

uint64_t NFDriverClose()
{
  return MEMORY[0x24BED8A90]();
}

uint64_t NFDriverConfigurRSTNDelay()
{
  return MEMORY[0x24BED8A98]();
}

uint64_t NFDriverConfigureI2CForLPM()
{
  return MEMORY[0x24BED8AA0]();
}

uint64_t NFDriverConfigureSPMIIRQ()
{
  return MEMORY[0x24BED8AA8]();
}

uint64_t NFDriverDebugDumpMemory()
{
  return MEMORY[0x24BED8AB0]();
}

uint64_t NFDriverDisableBoost()
{
  return MEMORY[0x24BED8AB8]();
}

uint64_t NFDriverDisableLPCDAssist()
{
  return MEMORY[0x24BED8AC0]();
}

uint64_t NFDriverDumpUART()
{
  return MEMORY[0x24BED8AC8]();
}

uint64_t NFDriverGetControllerInfo()
{
  return MEMORY[0x24BED8AD0]();
}

uint64_t NFDriverGetStackBreadcrumb()
{
  return MEMORY[0x24BED8AD8]();
}

uint64_t NFDriverGetUniqueFDRKey()
{
  return MEMORY[0x24BED8AE0]();
}

uint64_t NFDriverIsSecureElementPresent()
{
  return MEMORY[0x24BED8AE8]();
}

uint64_t NFDriverLoadStack()
{
  return MEMORY[0x24BED8AF0]();
}

uint64_t NFDriverNFCCPowerOff()
{
  return MEMORY[0x24BED8AF8]();
}

uint64_t NFDriverOpen()
{
  return MEMORY[0x24BED8B00]();
}

uint64_t NFDriverPrintPageEraseCounter()
{
  return MEMORY[0x24BED8B08]();
}

uint64_t NFDriverRFSettingsSetup()
{
  return MEMORY[0x24BED8B10]();
}

uint64_t NFDriverReadATETrimVersion()
{
  return MEMORY[0x24BED8B18]();
}

uint64_t NFDriverReadPageEraseCounter()
{
  return MEMORY[0x24BED8B20]();
}

uint64_t NFDriverResetFWFlags()
{
  return MEMORY[0x24BED8B28]();
}

uint64_t NFDriverRunIntegrityDebug()
{
  return MEMORY[0x24BED8B30]();
}

uint64_t NFDriverSecureElementGetOSInfo()
{
  return MEMORY[0x24BED8B38]();
}

uint64_t NFDriverSecureElementGetOSMode()
{
  return MEMORY[0x24BED8B40]();
}

uint64_t NFDriverSecureElementGetResponseStatus()
{
  return MEMORY[0x24BED8B48]();
}

uint64_t NFDriverSecureElementTransceive()
{
  return MEMORY[0x24BED8B50]();
}

uint64_t NFDriverSerialDebugLastMessage()
{
  return MEMORY[0x24BED8B58]();
}

uint64_t NFDriverSetCallback()
{
  return MEMORY[0x24BED8B60]();
}

uint64_t NFDriverSetConfiguration()
{
  return MEMORY[0x24BED8B68]();
}

uint64_t NFDriverSetSecureElementPower()
{
  return MEMORY[0x24BED8B70]();
}

uint64_t NFDriverUnloadStackAndLeaveHWEnabled()
{
  return MEMORY[0x24BED8B78]();
}

uint64_t NFDriverUpdateFirmware()
{
  return MEMORY[0x24BED8B80]();
}

uint64_t NFGetProductType()
{
  return MEMORY[0x24BEDCCB8]();
}

uint64_t NFIsInternalBuild()
{
  return MEMORY[0x24BEDCCC0]();
}

uint64_t NFIsRestoreOS()
{
  return MEMORY[0x24BEDCCC8]();
}

uint64_t NFLogGetLogger()
{
  return MEMORY[0x24BEDCCD0]();
}

uint64_t NFLogSetLogger()
{
  return MEMORY[0x24BEDCCD8]();
}

uint64_t NFProductIsDevBoard()
{
  return MEMORY[0x24BEDCCF8]();
}

uint64_t NFProductIsNED()
{
  return MEMORY[0x24BEDCD00]();
}

uint64_t NFProductIsPad()
{
  return MEMORY[0x24BEDCD08]();
}

uint64_t NFProductIsSIP()
{
  return MEMORY[0x24BEDCD10]();
}

uint64_t NFSharedDumpTransport()
{
  return MEMORY[0x24BEDCD20]();
}

uint64_t NFSharedLogGetLogger()
{
  return MEMORY[0x24BEDCD28]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x24BDAD2B0](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void cfmakeraw(termios *a1)
{
  MEMORY[0x24BDAD958](a1);
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD960](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD968](a1, a2);
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD970](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x24BDADC40](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x24BDADF50]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x24BDAFED8](__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x24BDAFFF0](__str, __sep);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x24BDAFFF8](__str, __sep, __lasts);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x24BDB01E0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x24BDB01E8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

