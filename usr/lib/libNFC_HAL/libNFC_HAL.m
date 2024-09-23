void *phOsalNfc_MemCopy(int a1, void *__dst, void *__src, size_t __n)
{
  return memcpy(__dst, __src, __n);
}

void *phOsalNfc_SetMemory(int a1, void *__b, int __c, size_t __len)
{
  void *result;

  if (__b)
  {
    if ((_DWORD)__len)
      return memset(__b, __c, __len);
  }
  return result;
}

void phOsalNfc_FreeMemory(int a1, void *a2)
{
  if (a2)
    free(a2);
}

uint64_t phTmlNfc_IoCtl(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  uint64_t v9;
  useconds_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  NSObject *v17;
  void **v18;
  const void **v19;
  void (*v20)(uint64_t, const char *, ...);
  NSObject *v21;
  uint64_t v22;
  int v23;
  const void **v24;
  void (*v25)(uint64_t, const char *, ...);
  NSObject *v26;
  const void **v27;
  void (*v28)(uint64_t, const char *, ...);
  NSObject *v29;
  uint64_t v30;
  unsigned int (*v31)(_QWORD);
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unsigned int (*v35)(_QWORD, uint8_t *, unint64_t *, uint64_t);
  uint64_t v36;
  const void **v37;
  void (*v38)(uint64_t, const char *, ...);
  NSObject *v39;
  int v40;
  int v41;
  const void **v42;
  void (*v43)(uint64_t, const char *, ...);
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  unsigned int (*v49)(_QWORD);
  uint64_t v50;
  uint64_t (*v51)(_QWORD);
  int v52;
  const void **v53;
  void (*v54)(uint64_t, const char *, ...);
  NSObject *v55;
  const void **v56;
  void (*v57)(uint64_t, const char *, ...);
  const void **v58;
  void (*v59)(uint64_t, const char *, ...);
  NSObject *v60;
  void (*v61)(uint64_t, const char *, ...);
  const void **v62;
  uint64_t v63;
  void (*v64)(uint64_t, const char *, ...);
  int *v65;
  char *v66;
  int *v67;
  NSObject *v68;
  int *v69;
  char *v70;
  int v71;
  const void **v72;
  void (*v73)(uint64_t, const char *, ...);
  const void **v74;
  void (*v75)(uint64_t, const char *, ...);
  void (*v76)(uint64_t, const char *, ...);
  void (*v77)(uint64_t, const char *, ...);
  NSObject *v78;
  unint64_t v79;
  uint8_t v80[4];
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  _BYTE v85[10];
  int v86;
  uint8_t buf[32];
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = sub_21A815FCC(a1);
  v5 = v4;
  if (a2 != 61680 && !v4)
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_IoCtl", 829, "tml!=NULL");
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 829;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "tml!=NULL";
LABEL_7:
    _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v11 = 15000;
  if (v4)
  {
    if (*(_BYTE *)(v4 + 104))
      v11 = 100000;
    else
      v11 = 15000;
  }
  if (a2 > 70)
  {
    if (a2 <= 61679)
    {
      switch(a2)
      {
        case 61440:
          return sub_21A818A28(a1, 1);
        case 61441:
          return sub_21A818A28(a1, 0);
        case 61442:
          v30 = **(_QWORD **)(v4 + 112);
          v31 = *(unsigned int (**)(_QWORD))(v30 + 192);
          if (v31 && v31(*(_QWORD *)(v30 + 240)))
            return 0;
          return 51;
        case 61443:
          v32 = sub_21A815FCC(a1);
          if (!v32)
          {
            v56 = (const void **)MEMORY[0x24BEDCDB0];
            dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
            v57 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v57)
              v57(3, "%s:%i FAILED: %s", "_phTmlNfc_QuerySPMIErrors", 789, "tml!=NULL");
            dispatch_get_specific(*v56);
            v8 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "_phTmlNfc_QuerySPMIErrors";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 789;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = "tml!=NULL";
              goto LABEL_7;
            }
            return 49;
          }
          v33 = *(uint64_t **)(v32 + 112);
          if (!v33)
          {
            v72 = (const void **)MEMORY[0x24BEDCDB0];
            dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
            v73 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v73)
              v73(3, "%s:%i FAILED: %s", "_phTmlNfc_QuerySPMIErrors", 790, "tml->ifc!=NULL");
            dispatch_get_specific(*v72);
            v8 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "_phTmlNfc_QuerySPMIErrors";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 790;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = "tml->ifc!=NULL";
              goto LABEL_7;
            }
            return 49;
          }
          v88 = 0u;
          v89 = 0u;
          memset(buf, 0, sizeof(buf));
          v79 = 64;
          v34 = *v33;
          v35 = *(unsigned int (**)(_QWORD, uint8_t *, unint64_t *, uint64_t))(*v33 + 120);
          if (v35 && v35(*(_QWORD *)(v34 + 136), buf, &v79, 31))
          {
            if (v79 >= 3)
            {
              v36 = 0;
              v37 = (const void **)MEMORY[0x24BEDCDB0];
              do
              {
                if (!buf[v36])
                  break;
                dispatch_get_specific(*v37);
                v38 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                if (v38)
                  v38(3, "%s:%i SPMI register 0x%02X = 0x%02X", "_phTmlNfc_QuerySPMIErrors", 805, buf[v36], buf[v36 + 2]);
                dispatch_get_specific(*v37);
                v39 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  v40 = buf[v36];
                  v41 = buf[v36 + 2];
                  *(_DWORD *)v80 = 136446978;
                  v81 = "_phTmlNfc_QuerySPMIErrors";
                  v82 = 1024;
                  v83 = 805;
                  v84 = 1024;
                  *(_DWORD *)v85 = v40;
                  *(_WORD *)&v85[4] = 1024;
                  *(_DWORD *)&v85[6] = v41;
                  _os_log_impl(&dword_21A811000, v39, OS_LOG_TYPE_ERROR, "%{public}s:%i SPMI register 0x%02X = 0x%02X", v80, 0x1Eu);
                }
                v36 += 3;
              }
              while (v79 >= v36 + 3);
            }
            return 0;
          }
          v62 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v63 = NFLogGetLogger();
          if (v63)
          {
            v64 = (void (*)(uint64_t, const char *, ...))v63;
            v65 = __error();
            v66 = strerror(*v65);
            v67 = __error();
            v64(3, "%s:%i \"%s\" errno=%d Failed to query SPMI error registers", "_phTmlNfc_QuerySPMIErrors", 796, v66, *v67);
          }
          dispatch_get_specific(*v62);
          v68 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v69 = __error();
            v70 = strerror(*v69);
            v71 = *__error();
            *(_DWORD *)v80 = 136446978;
            v81 = "_phTmlNfc_QuerySPMIErrors";
            v82 = 1024;
            v83 = 796;
            v84 = 2080;
            *(_QWORD *)v85 = v70;
            *(_WORD *)&v85[8] = 1024;
            v86 = v71;
            _os_log_impl(&dword_21A811000, v68, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to query SPMI error registers", v80, 0x22u);
          }
          v9 = 255;
          break;
        default:
          if (a2 != 71)
            goto LABEL_108;
          return sub_21A818F58(a1, 0);
      }
      return v9;
    }
    if (a2 == 61680)
    {
      NFHardwareSerialDebugDump();
      return 0;
    }
    if (a2 != 61681)
    {
      if (a2 == 61695)
      {
        if (v4)
          v18 = *(void ***)(v4 + 112);
        else
          v18 = 0;
        if (NFHardwareDebug(v18))
          return 0;
        else
          return 11;
      }
      goto LABEL_108;
    }
    if (v4)
    {
      if (*(_QWORD *)(v4 + 112))
      {
        v9 = 0;
        *(_BYTE *)(v4 + 1) = 1;
        return v9;
      }
      v74 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v75 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v75)
        v75(3, "%s:%i FAILED: %s", "_phTmlNfc_DebugMWUnload", 815, "tml->ifc!=NULL");
      dispatch_get_specific(*v74);
      v60 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_phTmlNfc_DebugMWUnload";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 815;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "tml->ifc!=NULL";
    }
    else
    {
      v58 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v59 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v59)
        v59(3, "%s:%i FAILED: %s", "_phTmlNfc_DebugMWUnload", 814, "tml!=NULL");
      dispatch_get_specific(*v58);
      v60 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_phTmlNfc_DebugMWUnload";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 814;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "tml!=NULL";
    }
    _os_log_impl(&dword_21A811000, v60, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 0;
  }
  if (a2 <= 19)
  {
    switch(a2)
    {
      case 1:
        if (*(_BYTE *)(v4 + 105))
        {
          v12 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v13)
            v13(6, "%s:%i phTmlNfc_e_EnableDownloadMode", "phTmlNfc_IoCtl", 981);
          dispatch_get_specific(*v12);
          v14 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 981;
            _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_EnableDownloadMode", buf, 0x12u);
          }
        }
        v9 = sub_21A81882C(a1, 1);
        if ((_DWORD)v9)
          return v9;
        usleep(0x1F4u);
        v9 = sub_21A8185FC(a1, 0);
        if ((_DWORD)v9)
          return v9;
        if ((NFHardwareInterfaceResetSerial(*(uint64_t **)(v5 + 112)) & 1) == 0)
        {
          v15 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v16)
            v16(3, "%s:%i failed to reset serial", "phTmlNfc_IoCtl", 990);
          dispatch_get_specific(*v15);
          v17 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 990;
            _os_log_impl(&dword_21A811000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to reset serial", buf, 0x12u);
          }
        }
LABEL_59:
        usleep(v11);
        v9 = sub_21A8185FC(a1, 1);
        if (!(_DWORD)v9)
        {
          usleep(0x2710u);
          *(_BYTE *)(v5 + 136) = 1;
        }
        break;
      case 2:
        v19 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v20)
          v20(6, "%s:%i phTmlNfc_e_EnableDownloadMode_NO_VEN", "phTmlNfc_IoCtl", 1025);
        dispatch_get_specific(*v19);
        v21 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1025;
          _os_log_impl(&dword_21A811000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_EnableDownloadMode_NO_VEN", buf, 0x12u);
        }
        v22 = a1;
        v23 = 1;
        goto LABEL_62;
      case 3:
        if (*(_BYTE *)(v4 + 105))
        {
          v24 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v25)
            v25(6, "%s:%i phTmlNfc_e_EnableNormalMode", "phTmlNfc_IoCtl", 925);
          dispatch_get_specific(*v24);
          v26 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 925;
            _os_log_impl(&dword_21A811000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_EnableNormalMode", buf, 0x12u);
          }
        }
        v9 = sub_21A81882C(a1, 0);
        if (!(_DWORD)v9)
        {
          usleep(0x1F4u);
          v9 = sub_21A8185FC(a1, 0);
          if (!(_DWORD)v9)
            goto LABEL_59;
        }
        return v9;
      case 4:
        v22 = a1;
        v23 = 0;
LABEL_62:
        v9 = sub_21A81882C(v22, v23);
        if (!(_DWORD)v9)
        {
          v9 = sub_21A8185FC(a1, 1);
          if (!(_DWORD)v9)
          {
            usleep(0x2710u);
            phTmlNfc_FlushTxRxBuffers(a1);
          }
        }
        break;
      case 6:
        if (*(_BYTE *)(v4 + 105))
        {
          v27 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v28)
            v28(6, "%s:%i phTmlNfc_e_PowerOff", "phTmlNfc_IoCtl", 900);
          dispatch_get_specific(*v27);
          v29 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 900;
            _os_log_impl(&dword_21A811000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_PowerOff", buf, 0x12u);
          }
        }
        *(_BYTE *)(v5 + 136) = 0;
        v9 = sub_21A8185FC(a1, 0);
        if (!(_DWORD)v9)
          usleep(v11);
        break;
      default:
        goto LABEL_108;
    }
    return v9;
  }
  if (a2 > 38)
  {
    if (a2 != 39)
    {
      if (a2 != 70)
        goto LABEL_108;
      return sub_21A818F58(a1, 1);
    }
    v42 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v43)
      v43(6, "%s:%i phTmlNfc_e_Nfc_Rst_Client", "phTmlNfc_IoCtl", 1082);
    dispatch_get_specific(*v42);
    v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1082;
      _os_log_impl(&dword_21A811000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_Nfc_Rst_Client", buf, 0x12u);
    }
    v45 = sub_21A815FCC(a1);
    if (!v45)
    {
      dispatch_get_specific(*v42);
      v61 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v61)
        v61(3, "%s:%i FAILED: %s", "_phTmlNfc_FollowerReset", 772, "tml!=NULL");
      dispatch_get_specific(*v42);
      v8 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        return 49;
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_phTmlNfc_FollowerReset";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 772;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "tml!=NULL";
      goto LABEL_7;
    }
    v46 = v45;
    v47 = *(uint64_t **)(v45 + 112);
    if (!v47)
    {
      dispatch_get_specific(*v42);
      v76 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v76)
        v76(3, "%s:%i FAILED: %s", "_phTmlNfc_FollowerReset", 773, "tml->ifc!=NULL");
      dispatch_get_specific(*v42);
      v8 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        return 49;
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "_phTmlNfc_FollowerReset";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 773;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "tml->ifc!=NULL";
      goto LABEL_7;
    }
    v48 = *v47;
    v49 = *(unsigned int (**)(_QWORD))(*v47 + 224);
    if (v49 && v49(*(_QWORD *)(v48 + 240)))
    {
      v50 = **(_QWORD **)(v46 + 112);
      v51 = *(uint64_t (**)(_QWORD))(v50 + 216);
      v9 = 255;
      if (v51)
      {
        v52 = v51(*(_QWORD *)(v50 + 240));
        if (v52)
          v9 = 179;
        else
          v9 = 255;
      }
      else
      {
        v52 = 0;
      }
      dispatch_get_specific(*v42);
      v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v77)
        v77(3, "%s:%i Failed to set device wake. NACK = %d", "_phTmlNfc_FollowerReset", 779, v52);
      dispatch_get_specific(*v42);
      v78 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "_phTmlNfc_FollowerReset";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 779;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v52;
        _os_log_impl(&dword_21A811000, v78, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to set device wake. NACK = %d", buf, 0x18u);
      }
      return v9;
    }
    usleep(0x2710u);
    return 0;
  }
  if (a2 != 20)
  {
    if (a2 == 21)
      return sub_21A818C24(a1, 1);
LABEL_108:
    v53 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v54 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v54)
      v54(3, "%s:%i Invalid code: %d", "phTmlNfc_IoCtl", 1089, a2);
    dispatch_get_specific(*v53);
    v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "phTmlNfc_IoCtl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1089;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a2;
      _os_log_impl(&dword_21A811000, v55, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid code: %d", buf, 0x18u);
    }
    return 1;
  }
  return sub_21A818C24(a1, 0);
}

uint64_t phTmlNfc_Write(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  const void **v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  const char *v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  const void **v17;
  void (*v18)(uint64_t, const char *, ...);
  NSObject *v19;
  uint32_t v20;
  void (*v21)(uint64_t, const char *, ...);
  NSObject *v22;
  const void **v23;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v25;
  const void **v26;
  void (*v27)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v23 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 361, "pBuffer!=((void *)0)");
    dispatch_get_specific(*v23);
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "phTmlNfc_Write";
      v30 = 1024;
      v31 = 361;
      v32 = 2080;
      v33 = "pBuffer!=((void *)0)";
LABEL_42:
      _os_log_impl(&dword_21A811000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_43:
    abort();
  }
  if (!a3)
  {
    v26 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27)
      v27(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 362, "wLength>0");
    dispatch_get_specific(*v26);
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "phTmlNfc_Write";
      v30 = 1024;
      v31 = 362;
      v32 = 2080;
      v33 = "wLength>0";
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  v3 = sub_21A815FCC(a1);
  if (!v3)
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
      v12(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 365, "tml!=NULL");
    dispatch_get_specific(*v11);
    v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v29 = "phTmlNfc_Write";
    v30 = 1024;
    v31 = 365;
    v32 = 2080;
    v33 = "tml!=NULL";
    v14 = "%{public}s:%i FAILED: %s";
LABEL_25:
    v19 = v13;
    v20 = 28;
    goto LABEL_26;
  }
  v4 = (_BYTE *)v3;
  v5 = *(_QWORD *)(v3 + 112);
  if (!v5)
  {
    v15 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 366, "tml->ifc!=NULL");
    dispatch_get_specific(*v15);
    v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v29 = "phTmlNfc_Write";
    v30 = 1024;
    v31 = 366;
    v32 = 2080;
    v33 = "tml->ifc!=NULL";
    v14 = "%{public}s:%i FAILED: %s";
    goto LABEL_25;
  }
  if (!*v4)
  {
    v17 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18)
      v18(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 367, "tml->isRunning");
    dispatch_get_specific(*v17);
    v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v29 = "phTmlNfc_Write";
    v30 = 1024;
    v31 = 367;
    v32 = 2080;
    v33 = "tml->isRunning";
    v14 = "%{public}s:%i FAILED: %s";
    goto LABEL_25;
  }
  v6 = NFHardwareInterfaceWriteBlock(v5);
  if (!v6)
    return 13;
  v7 = (const void **)MEMORY[0x24BEDCDB0];
  if (v6 != -1)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21)
      v21(3, "%s:%i Not initialized", "phTmlNfc_Write", 386);
    dispatch_get_specific(*v7);
    v22 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446466;
    v29 = "phTmlNfc_Write";
    v30 = 1024;
    v31 = 386;
    v14 = "%{public}s:%i Not initialized";
    v19 = v22;
    v20 = 18;
LABEL_26:
    _os_log_impl(&dword_21A811000, v19, OS_LOG_TYPE_ERROR, v14, buf, v20);
    return 49;
  }
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8)
    v8(3, "%s:%i Busy !", "phTmlNfc_Write", 383);
  dispatch_get_specific(*v7);
  v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "phTmlNfc_Write";
    v30 = 1024;
    v31 = 383;
    _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Busy !", buf, 0x12u);
  }
  return 111;
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
    _os_log_impl(&dword_21A811000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
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
      _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write, buffer already pending TX. Bytes left = %zu, bytes written = %d, suspend state = %d", buf, 0x28u);
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
  handler[2] = sub_21A822B0C;
  handler[3] = &unk_24DD2CCD0;
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
    _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for writing", buf, 0x12u);
  }
  return 1;
}

uint64_t phOsalNfc_Timer_Stop(int a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  pthread_mutex_t *v5;
  uint64_t i;
  const void **v7;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21A81A5F0(a1);
  if (v3)
  {
    v4 = v3;
    v5 = (pthread_mutex_t *)(v3 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 176));
    for (i = 8; i != 168; i += 16)
    {
      if (*(const char **)(v4 + i) == a2)
      {
        v11 = sub_21A81A9E4(v4 + i, 0);
        goto LABEL_18;
      }
    }
    v7 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to get timer %llX from context", "phOsalNfc_Timer_Stop", 364, a2);
    dispatch_get_specific(*v7);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "phOsalNfc_Timer_Stop";
      v18 = 1024;
      v19 = 364;
      v20 = 2048;
      v21 = a2;
      _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer %llX from context", buf, 0x1Cu);
    }
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a2;
      _os_log_fault_impl(&dword_21A811000, v10, OS_LOG_TYPE_FAULT, "Error: Failed to get timer 0x%llX from context", buf, 0xCu);
    }
    v11 = 1;
LABEL_18:
    pthread_mutex_unlock(v5);
  }
  else
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Stop", 357);
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "phOsalNfc_Timer_Stop";
      v18 = 1024;
      v19 = 357;
      _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
    }
    return 49;
  }
  return v11;
}

uint64_t phOsalNfc_Timer_Start(int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  pthread_mutex_t *v12;
  uint64_t v13;
  uint64_t v14;
  const void **v15;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  const void **v20;
  void (*v21)(uint64_t, const char *, ...);
  NSObject *v22;
  const void **v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  const void **v26;
  void (*v27)(uint64_t, const char *, ...);
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  dispatch_time_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  const void **v35;
  void (*v36)(uint64_t, const char *, ...);
  NSObject *v37;
  uint64_t v38;
  _QWORD v40[3];
  double v41;
  _BYTE buf[32];
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v10 = sub_21A81A5F0(a1);
    if (v10)
    {
      v11 = v10;
      v12 = (pthread_mutex_t *)(v10 + 176);
      pthread_mutex_lock((pthread_mutex_t *)(v10 + 176));
      v13 = 0;
      while (1)
      {
        v14 = v11 + v13;
        if (*(_QWORD *)(v11 + v13 + 8) == a2)
          break;
        v13 += 16;
        if (v13 == 160)
        {
          v15 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger)
            Logger(3, "%s:%i Failed to get timer %llX from context", "phOsalNfc_Timer_Start", 331, a2);
          dispatch_get_specific(*v15);
          v17 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "phOsalNfc_Timer_Start";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 331;
            *(_WORD *)&buf[18] = 2048;
            *(_QWORD *)&buf[20] = a2;
            _os_log_impl(&dword_21A811000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer %llX from context", buf, 0x1Cu);
          }
          v18 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = a2;
            _os_log_fault_impl(&dword_21A811000, v18, OS_LOG_TYPE_FAULT, "Error: Failed to get timer 0x%llX from context", buf, 0xCu);
          }
          v19 = 1;
          goto LABEL_42;
        }
      }
      if (*(_QWORD *)(v14 + 16))
      {
        v26 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v27)
          v27(3, "%s:%i timer %llX already started", "_phOsalNfc_Timer_StartTimer", 142, *(_QWORD *)(v14 + 8));
        dispatch_get_specific(*v26);
        v28 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = *(_QWORD *)(v14 + 8);
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = "_phOsalNfc_Timer_StartTimer";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 142;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v29;
          _os_log_impl(&dword_21A811000, v28, OS_LOG_TYPE_ERROR, "%{public}s:%i timer %llX already started", buf, 0x1Cu);
        }
        v19 = 225;
      }
      else
      {
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x2000000000;
        v41 = 0.0;
        v41 = (double)a3 / 1000.0 + CFAbsoluteTimeGetCurrent();
        v30 = dispatch_source_create(MEMORY[0x24BDACA18], 1uLL, 0, *(dispatch_queue_t *)(v11 + 168));
        *(_QWORD *)(v14 + 16) = v30;
        if (v30)
        {
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 0x40000000;
          *(_QWORD *)&buf[16] = sub_21A81AFC4;
          *(_QWORD *)&buf[24] = &unk_24DD2CC50;
          v47 = a1;
          v43 = v40;
          v44 = a2;
          v45 = a4;
          v46 = a5;
          dispatch_source_set_event_handler(v30, buf);
          dispatch_activate(*(dispatch_object_t *)(v14 + 16));
          v31 = dispatch_time(0, 1000000 * a3);
          v32 = a3 / 0x32;
          if (a3 / 0x32 >= 0xEA60)
            v32 = 60000;
          v33 = 1000000 * v32;
          if (a3 >= 0x32)
            v34 = v33;
          else
            v34 = 1000000;
          dispatch_source_set_timer(*(dispatch_source_t *)(v14 + 16), v31, 0xFFFFFFFFFFFFFFFFLL, v34);
          v19 = 0;
        }
        else
        {
          v35 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v36 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v36)
            v36(3, "%s:%i Can't start timer %llX", "_phOsalNfc_Timer_StartTimer", 170, *(_QWORD *)(v14 + 8));
          dispatch_get_specific(*v35);
          v37 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = *(_QWORD *)(v14 + 8);
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "_phOsalNfc_Timer_StartTimer";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 170;
            *(_WORD *)&buf[18] = 2048;
            *(_QWORD *)&buf[20] = v38;
            _os_log_impl(&dword_21A811000, v37, OS_LOG_TYPE_ERROR, "%{public}s:%i Can't start timer %llX", buf, 0x1Cu);
          }
          v19 = 1;
        }
        _Block_object_dispose(v40, 8);
      }
LABEL_42:
      pthread_mutex_unlock(v12);
    }
    else
    {
      v23 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v24)
        v24(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Start", 324);
      dispatch_get_specific(*v23);
      v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "phOsalNfc_Timer_Start";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 324;
        _os_log_impl(&dword_21A811000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
      }
      return 49;
    }
  }
  else
  {
    v20 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21)
      v21(3, "%s:%i Invalid parameter", "phOsalNfc_Timer_Start", 318);
    dispatch_get_specific(*v20);
    v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "phOsalNfc_Timer_Start";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 318;
      _os_log_impl(&dword_21A811000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid parameter", buf, 0x12u);
    }
    return 1;
  }
  return v19;
}

uint64_t sub_21A814B6C(uint64_t a1)
{
  size_t v2;
  uintptr_t data;
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  ssize_t v10;
  uint64_t v11;
  void (*v12)(_QWORD, uint64_t, const char *, char *, ssize_t);
  const char *v13;
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
  uint64_t v24;
  const void **v25;
  void (*v26)(uint64_t, const char *, ...);
  NSObject *v27;
  uint64_t v28;
  const void **v30;
  void (*v31)(uint64_t, const char *, ...);
  NSObject *v32;
  const void **v33;
  void (*v34)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uintptr_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  data = dispatch_source_get_data(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 112));
  if (data < v2)
  {
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i Only %lu bytes available, requested %zu !", "NFHardwareSerialReadBlock_block_invoke", 673, data, *(_QWORD *)(a1 + 40));
    dispatch_get_specific(*v4);
    v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136446978;
      v36 = "NFHardwareSerialReadBlock_block_invoke";
      v37 = 1024;
      v38 = 673;
      v39 = 2048;
      v40 = (const char *)data;
      v41 = 2048;
      v42 = v7;
      _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only %lu bytes available, requested %zu !", buf, 0x26u);
    }
  }
  v8 = *(char **)(a1 + 56);
  if (!v8)
  {
    v30 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31)
      v31(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 629, "buffer!=((void *)0)");
    dispatch_get_specific(*v30);
    v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v36 = "_NFHardwareSerialRead";
      v37 = 1024;
      v38 = 629;
      v39 = 2080;
      v40 = "buffer!=((void *)0)";
LABEL_31:
      _os_log_impl(&dword_21A811000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_32:
    abort();
  }
  if (!v2)
  {
    v33 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34)
      v34(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 630, "*length>0");
    dispatch_get_specific(*v33);
    v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v36 = "_NFHardwareSerialRead";
      v37 = 1024;
      v38 = 630;
      v39 = 2080;
      v40 = "*length>0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = read(*(_DWORD *)v9, *(void **)(a1 + 56), v2);
  if (v10 < 0)
  {
    v14 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v15 = NFLogGetLogger();
    if (v15)
    {
      v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = __error();
      v18 = strerror(*v17);
      v19 = __error();
      v16(3, "%s:%i \"%s\" errno=%d ", "_NFHardwareSerialRead", 636, v18, *v19);
    }
    dispatch_get_specific(*v14);
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = __error();
      v22 = strerror(*v21);
      v23 = *__error();
      *(_DWORD *)buf = 136446978;
      v36 = "_NFHardwareSerialRead";
      v37 = 1024;
      v38 = 636;
      v39 = 2080;
      v40 = v22;
      v41 = 1024;
      LODWORD(v42) = v23;
      _os_log_impl(&dword_21A811000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    v13 = 0;
  }
  else
  {
    v11 = *(_QWORD *)(v9 + 8);
    v12 = *(void (**)(_QWORD, uint64_t, const char *, char *, ssize_t))(v11 + 80);
    if (v12)
    {
      v12(*(unsigned __int8 *)(v11 + 96), 7, "[RX<]", v8, v10);
      v11 = *(_QWORD *)(v9 + 8);
    }
    NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v11 + 88), 3, v8, v10);
    v13 = (const char *)v10;
  }
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 112));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  ++*(_DWORD *)(v24 + 120);
  *(_QWORD *)(v24 + 128) = 0;
  if ((unint64_t)v13 < *(_QWORD *)(a1 + 40))
  {
    v25 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26)
      v26(6, "%s:%i Only got %zu bytes, requested %zu, available %lu.", "NFHardwareSerialReadBlock_block_invoke", 688, (size_t)v13, *(_QWORD *)(a1 + 40), data);
    dispatch_get_specific(*v25);
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136447234;
      v36 = "NFHardwareSerialReadBlock_block_invoke";
      v37 = 1024;
      v38 = 688;
      v39 = 2048;
      v40 = v13;
      v41 = 2048;
      v42 = v28;
      v43 = 2048;
      v44 = data;
      _os_log_impl(&dword_21A811000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only got %zu bytes, requested %zu, available %lu.", buf, 0x30u);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t phTmlNfc_Read(uint64_t a1, uint64_t a2, int a3, const char *a4, const void *a5)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int Block;
  uint64_t result;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const void **v15;
  void (*v16)(uint64_t, const char *, ...);
  const void **v17;
  void (*v18)(uint64_t, const char *, ...);
  const void **v19;
  void (*v20)(uint64_t, const char *, ...);
  NSObject *v21;
  int v22;
  void (*v23)(uint64_t, const char *, ...);
  NSObject *v24;
  uint64_t v25;
  const void *v26;
  void (*v27)(uint64_t, const char *, ...);
  NSObject *v28;
  const void **v29;
  void (*v30)(uint64_t, const char *, ...);
  NSObject *v31;
  int v32;
  void (*v33)(uint64_t, const char *, ...);
  NSObject *v34;
  uint64_t v35;
  const void *v36;
  void (*v37)(uint64_t, const char *, ...);
  NSObject *v38;
  const void **v39;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v41;
  const void **v42;
  void (*v43)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  _BYTE v47[14];
  __int16 v48;
  const void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v39 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 454, "pBuffer!=((void *)0)");
    dispatch_get_specific(*v39);
    v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v45 = "phTmlNfc_Read";
      v46 = 1024;
      *(_DWORD *)v47 = 454;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = "pBuffer!=((void *)0)";
LABEL_66:
      _os_log_impl(&dword_21A811000, v41, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_67:
    abort();
  }
  if (!a3)
  {
    v42 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v43)
      v43(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 455, "wLength>0");
    dispatch_get_specific(*v42);
    v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v45 = "phTmlNfc_Read";
      v46 = 1024;
      *(_DWORD *)v47 = 455;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = "wLength>0";
      goto LABEL_66;
    }
    goto LABEL_67;
  }
  v7 = sub_21A815FCC(a1);
  if (!v7)
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 458, "tml!=NULL");
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v45 = "phTmlNfc_Read";
    v46 = 1024;
    *(_DWORD *)v47 = 458;
    *(_WORD *)&v47[4] = 2080;
    *(_QWORD *)&v47[6] = "tml!=NULL";
LABEL_26:
    _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v8 = v7;
  if (!*(_QWORD *)(v7 + 112))
  {
    v15 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
      v16(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 459, "tml->ifc!=NULL");
    dispatch_get_specific(*v15);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v45 = "phTmlNfc_Read";
    v46 = 1024;
    *(_DWORD *)v47 = 459;
    *(_WORD *)&v47[4] = 2080;
    *(_QWORD *)&v47[6] = "tml->ifc!=NULL";
    goto LABEL_26;
  }
  if (!*(_BYTE *)v7)
  {
    v17 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18)
      v18(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 460, "tml->isRunning");
    dispatch_get_specific(*v17);
    v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v45 = "phTmlNfc_Read";
    v46 = 1024;
    *(_DWORD *)v47 = 460;
    *(_WORD *)&v47[4] = 2080;
    *(_QWORD *)&v47[6] = "tml->isRunning";
    goto LABEL_26;
  }
  if (*(_BYTE *)(v7 + 1))
  {
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      v45 = a4;
      v46 = 2048;
      *(_QWORD *)v47 = a5;
      _os_log_fault_impl(&dword_21A811000, v9, OS_LOG_TYPE_FAULT, "Error : read received after shutdown : %p / %p", buf, 0x16u);
    }
  }
  Block = NFHardwareInterfaceReadBlock(*(_QWORD *)(v8 + 112));
  if (Block == -1)
  {
    v19 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v20)
      v20(3, "%s:%i Failed to read : busy. Pending read = %d", "phTmlNfc_Read", 500, *(unsigned __int8 *)(v8 + 2));
    dispatch_get_specific(*v19);
    v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *(unsigned __int8 *)(v8 + 2);
      *(_DWORD *)buf = 136446722;
      v45 = "phTmlNfc_Read";
      v46 = 1024;
      *(_DWORD *)v47 = 500;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v22;
      _os_log_impl(&dword_21A811000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read : busy. Pending read = %d", buf, 0x18u);
    }
    if (!NFIsInternalBuild())
      return 111;
    dispatch_get_specific(*v19);
    v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23)
      v23(6, "%s:%i Debug : Pending read cb = %p, context = %p", "phTmlNfc_Read", 502, *(const void **)(v8 + 8), *(const void **)(v8 + 16));
    dispatch_get_specific(*v19);
    v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(v8 + 8);
      v26 = *(const void **)(v8 + 16);
      *(_DWORD *)buf = 136446978;
      v45 = "phTmlNfc_Read";
      v46 = 1024;
      *(_DWORD *)v47 = 502;
      *(_WORD *)&v47[4] = 2048;
      *(_QWORD *)&v47[6] = v25;
      v48 = 2048;
      v49 = v26;
      _os_log_impl(&dword_21A811000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Pending read cb = %p, context = %p", buf, 0x26u);
    }
    dispatch_get_specific(*v19);
    v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27)
      v27(6, "%s:%i Debug : Current read cb = %p, context = %p", "phTmlNfc_Read", 503, a4, a5);
    dispatch_get_specific(*v19);
    v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v45 = "phTmlNfc_Read";
      v46 = 1024;
      *(_DWORD *)v47 = 503;
      *(_WORD *)&v47[4] = 2048;
      *(_QWORD *)&v47[6] = a4;
      v48 = 2048;
      v49 = a5;
      _os_log_impl(&dword_21A811000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Current read cb = %p, context = %p", buf, 0x26u);
    }
    *(_BYTE *)(v8 + 2) = 0;
    result = 111;
LABEL_56:
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 16) = 0;
    return result;
  }
  if (Block)
  {
    v29 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30)
      v30(3, "%s:%i Failed to read : not initialized. Pending read = %d", "phTmlNfc_Read", 510, *(unsigned __int8 *)(v8 + 2));
    dispatch_get_specific(*v29);
    v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = *(unsigned __int8 *)(v8 + 2);
      *(_DWORD *)buf = 136446722;
      v45 = "phTmlNfc_Read";
      v46 = 1024;
      *(_DWORD *)v47 = 510;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v32;
      _os_log_impl(&dword_21A811000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read : not initialized. Pending read = %d", buf, 0x18u);
    }
    if (NFIsInternalBuild())
    {
      dispatch_get_specific(*v29);
      v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v33)
        v33(6, "%s:%i Debug : Pending read cb = %p, context = %p", "phTmlNfc_Read", 512, *(const void **)(v8 + 8), *(const void **)(v8 + 16));
      dispatch_get_specific(*v29);
      v34 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *(_QWORD *)(v8 + 8);
        v36 = *(const void **)(v8 + 16);
        *(_DWORD *)buf = 136446978;
        v45 = "phTmlNfc_Read";
        v46 = 1024;
        *(_DWORD *)v47 = 512;
        *(_WORD *)&v47[4] = 2048;
        *(_QWORD *)&v47[6] = v35;
        v48 = 2048;
        v49 = v36;
        _os_log_impl(&dword_21A811000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Pending read cb = %p, context = %p", buf, 0x26u);
      }
      dispatch_get_specific(*v29);
      v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v37)
        v37(6, "%s:%i Debug : Current read cb = %p, context = %p", "phTmlNfc_Read", 513, a4, a5);
      dispatch_get_specific(*v29);
      v38 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v45 = "phTmlNfc_Read";
        v46 = 1024;
        *(_DWORD *)v47 = 513;
        *(_WORD *)&v47[4] = 2048;
        *(_QWORD *)&v47[6] = a4;
        v48 = 2048;
        v49 = a5;
        _os_log_impl(&dword_21A811000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Current read cb = %p, context = %p", buf, 0x26u);
      }
      *(_BYTE *)(v8 + 2) = 0;
      result = 49;
      goto LABEL_56;
    }
    return 49;
  }
  if (NFIsInternalBuild())
  {
    *(_BYTE *)(v8 + 2) = 1;
    *(_QWORD *)(v8 + 8) = a4;
    *(_QWORD *)(v8 + 16) = a5;
  }
  return 13;
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
    handler[2] = sub_21A814B6C;
    handler[3] = &unk_24DD2CCA8;
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
      _os_log_impl(&dword_21A811000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21A811000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Error : read already in progress.", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
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
      _os_log_impl(&dword_21A811000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
    }
  }
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
    _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
  }
  return 1;
}

uint64_t sub_21A815FCC(uint64_t a1)
{
  uint64_t v2;
  char i;
  char v4;
  uint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_253E47188);
  v2 = 0;
  for (i = 1; ; i = 0)
  {
    v4 = i;
    v5 = *((_QWORD *)&unk_253E47188 + v2 + 1);
    if (v5)
    {
      if (*(_QWORD *)(v5 + 144) == a1)
        break;
    }
    v2 = 1;
    if ((v4 & 1) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_253E47188);
      return 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253E47188);
  return *((_QWORD *)&unk_253E47188 + v2 + 1);
}

void sub_21A816054(_QWORD *a1, unsigned __int16 a2, int a3)
{
  uint64_t v4;
  unsigned __int16 v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  _BYTE *v9;
  NSObject *v10;
  void (*v11)(_QWORD, _QWORD *);
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a1[4];
  if (a3)
    v5 = 0;
  else
    v5 = 255;
  v16[0] = v5;
  v16[1] = v4;
  v16[2] = a2;
  if ((a3 & 1) == 0)
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to read", "phTmlNfc_Read_block_invoke", 473);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "phTmlNfc_Read_block_invoke";
      v19 = 1024;
      LODWORD(v20) = 473;
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read", buf, 0x12u);
    }
  }
  v9 = (_BYTE *)a1[5];
  HIDWORD(v16[0]) = v9[120];
  if (v9[1])
  {
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v13 = (const char *)a1[6];
      v12 = a1[7];
      v14 = a1[5];
      v15 = *(_QWORD *)(v14 + 144);
      LODWORD(v14) = *(_DWORD *)(v14 + 152);
      *(_DWORD *)buf = 134218752;
      v18 = v13;
      v19 = 2048;
      v20 = v12;
      v21 = 2048;
      v22 = v15;
      v23 = 1024;
      v24 = v14;
      _os_log_fault_impl(&dword_21A811000, v10, OS_LOG_TYPE_FAULT, "Error : read received after shutdown : %p / %p. Driver context %llu, Controller config type %d", buf, 0x26u);
    }
    v9 = (_BYTE *)a1[5];
    v9[1] = 0;
  }
  if (*v9)
  {
    v11 = (void (*)(_QWORD, _QWORD *))a1[6];
    if (v11)
    {
      v9[2] = 0;
      v11(a1[7], v16);
    }
  }
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
  return sub_21A81FCCC(a1, 3u, a2) == 0;
}

void *phOsalNfc_GetMemory(int a1, size_t size)
{
  if ((_DWORD)size)
    return malloc_type_calloc(1uLL, size, 0xAC8762BEuLL);
  else
    return 0;
}

void phOsalNfc_SignPostLogStr(uint64_t a1, int a2, int a3, uint64_t a4)
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  _BOOL4 v12;
  uint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = NFSharedMiddlewareSignpostLog();
  if (v7)
  {
    v8 = v7;
    switch(a2)
    {
      case 1:
        v12 = os_signpost_enabled(v7);
        if (a3 == 3)
        {
          if (v12)
          {
            v23 = 136446210;
            v24 = a4;
            v10 = "PHTMLNFC";
            v11 = "%{public}s";
            goto LABEL_13;
          }
        }
        else if (v12)
        {
          v21 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v21;
          v25 = 2082;
          v26 = a4;
          v10 = "PHTMLNFC";
          v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 2:
        if (os_signpost_enabled(v7))
        {
          v13 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v13;
          v25 = 2082;
          v26 = a4;
          v10 = "PHOSALNFC";
          v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 3:
        v14 = os_signpost_enabled(v7);
        if (a3 == 3)
        {
          if (v14)
          {
            v23 = 136446210;
            v24 = a4;
            v10 = "PHNCINFC";
            v11 = "%{public}s";
LABEL_13:
            v15 = v8;
            v16 = 12;
            goto LABEL_27;
          }
        }
        else if (v14)
        {
          v22 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v22;
          v25 = 2082;
          v26 = a4;
          v10 = "PHNCINFC";
          v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 4:
      case 9:
      case 10:
        if (os_signpost_enabled(v7))
        {
          v9 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v9;
          v25 = 2082;
          v26 = a4;
          v10 = "PHLIBNFC";
          v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 5:
        if (os_signpost_enabled(v7))
        {
          v17 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v17;
          v25 = 2082;
          v26 = a4;
          v10 = "PHLIBNFC_INFRA";
          v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 6:
        if (os_signpost_enabled(v7))
        {
          v18 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v18;
          v25 = 2082;
          v26 = a4;
          v10 = "PHLIBNFC_DNLD";
          v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 7:
        if (os_signpost_enabled(v7))
        {
          v19 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v19;
          v25 = 2082;
          v26 = a4;
          v10 = "PHLIBNFC_HCI";
          v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 8:
        if (os_signpost_enabled(v7))
        {
          v20 = qword_24DD2CC70[a3];
          v23 = 136446466;
          v24 = v20;
          v25 = 2082;
          v26 = a4;
          v10 = "PHLIBNFC_NDEF";
          v11 = "%{public}s%{public}s";
LABEL_26:
          v15 = v8;
          v16 = 22;
LABEL_27:
          _os_signpost_emit_with_name_impl(&dword_21A811000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, v11, (uint8_t *)&v23, v16);
        }
        break;
      default:
        return;
    }
  }
}

double phOsalNfc_SignPostLogFunc(unsigned int a1, int a2, const char *a3, char *a4, int a5)
{
  unsigned int v9;
  NSObject *v10;
  double result;
  NSObject *v12;
  int *v13;
  int v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  char *v27;
  int v28;
  _BYTE *v29;
  int v30;
  _BOOL4 v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  char *v35;
  int v36;
  _BYTE *v37;
  int v38;
  _BOOL4 v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  char *v43;
  BOOL v44;
  const char *v45;
  char *v47;
  NSObject *v48;
  uint32_t v49;
  char *v50;
  int v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 1)
    v9 = a1;
  else
    v9 = 0;
  v10 = NFSharedMiddlewareSignpostLog();
  if (v10)
  {
    v12 = v10;
    v13 = (int *)&byte_253E471C0[264 * v9];
    v14 = *v13;
    if (a5)
    {
      if (v14 == 2)
        goto LABEL_9;
      if (v14 != 1)
      {
        if (v14)
          return result;
LABEL_9:
        v15 = os_signpost_enabled(v10);
        if (a4)
        {
          if (v15)
          {
            v51 = 136446722;
            v52 = "+";
            v53 = 2082;
            v54 = a3;
            v55 = 2082;
            v56 = a4;
            v16 = "%{public}s:%{public}s <- %{public}s";
            v17 = v12;
            v18 = 32;
LABEL_26:
            _os_signpost_emit_with_name_impl(&dword_21A811000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", v16, (uint8_t *)&v51, v18);
          }
        }
        else if (v15)
        {
          v51 = 136446466;
          v52 = "+";
          v53 = 2082;
          v54 = a3;
          v16 = "%{public}s:%{public}s";
          v17 = v12;
          v18 = 22;
          goto LABEL_26;
        }
        *v13 = 1;
        byte_253E471C0[264 * v9 + 4] = a2;
        __strlcpy_chk();
        return result;
      }
      v23 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v23)
        {
          v51 = 136446722;
          v52 = "+";
          v53 = 2082;
          v54 = a3;
          v55 = 2082;
          v56 = a4;
          v24 = "%{public}s:%{public}s <- %{public}s";
          v25 = v12;
          v26 = 32;
LABEL_34:
          _os_signpost_emit_with_name_impl(&dword_21A811000, v25, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", v24, (uint8_t *)&v51, v26);
        }
      }
      else if (v23)
      {
        v51 = 136446466;
        v52 = "+";
        v53 = 2082;
        v54 = a3;
        v24 = "%{public}s:%{public}s";
        v25 = v12;
        v26 = 22;
        goto LABEL_34;
      }
      *v13 = 3;
      v43 = &byte_253E471C0[264 * v9];
      v43[5] = a2;
      strlcpy(v43 + 134, a3, 0x80uLL);
      return result;
    }
    if (v14 != 3)
    {
      if (v14 != 1)
        return result;
      v19 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v19)
        {
          v51 = 136446722;
          v52 = "-";
          v53 = 2082;
          v54 = &byte_253E471C0[264 * v9 + 6];
          v55 = 2082;
          v56 = a4;
          v20 = "%{public}s:%{public}s :%{public}s";
          v21 = v12;
          v22 = 32;
LABEL_38:
          _os_signpost_emit_with_name_impl(&dword_21A811000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", v20, (uint8_t *)&v51, v22);
        }
      }
      else if (v19)
      {
        v51 = 136446466;
        v52 = "-";
        v53 = 2082;
        v54 = &byte_253E471C0[264 * v9 + 6];
        v20 = "%{public}s:%{public}s";
        v21 = v12;
        v22 = 22;
        goto LABEL_38;
      }
      *v13 = 2;
      byte_253E471C0[264 * v9 + 4] = 0;
      return result;
    }
    v27 = &byte_253E471C0[264 * v9];
    v30 = v27[5];
    v29 = v27 + 5;
    v28 = v30;
    if (v30 == a2)
    {
      v31 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v31)
        {
          v51 = 136446722;
          v52 = "-";
          v53 = 2082;
          v54 = &byte_253E471C0[264 * v9 + 134];
          v55 = 2082;
          v56 = a4;
          v32 = "%{public}s:%{public}s :%{public}s";
          v33 = v12;
          v34 = 32;
LABEL_53:
          _os_signpost_emit_with_name_impl(&dword_21A811000, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", v32, (uint8_t *)&v51, v34);
        }
      }
      else if (v31)
      {
        v51 = 136446466;
        v52 = "-";
        v53 = 2082;
        v54 = &byte_253E471C0[264 * v9 + 134];
        v32 = "%{public}s:%{public}s";
        v33 = v12;
        v34 = 22;
        goto LABEL_53;
      }
      *v13 = 2;
      *v29 = 0;
      return result;
    }
    v35 = &byte_253E471C0[264 * v9];
    v38 = v35[4];
    v37 = v35 + 4;
    v36 = v38;
    if (v38 == a2)
    {
      v39 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v39)
        {
          v51 = 136446722;
          v52 = "-";
          v53 = 2082;
          v54 = &byte_253E471C0[264 * v9 + 6];
          v55 = 2082;
          v56 = a4;
          v40 = "%{public}s:%{public}s :%{public}s";
          v41 = v12;
          v42 = 32;
LABEL_63:
          _os_signpost_emit_with_name_impl(&dword_21A811000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", v40, (uint8_t *)&v51, v42);
        }
      }
      else if (v39)
      {
        v51 = 136446466;
        v52 = "-";
        v53 = 2082;
        v54 = &byte_253E471C0[264 * v9 + 6];
        v40 = "%{public}s:%{public}s";
        v41 = v12;
        v42 = 22;
        goto LABEL_63;
      }
      *v37 = 0;
      return result;
    }
    if (v28)
      v44 = v36 == 0;
    else
      v44 = 1;
    if (v44)
    {
      if (v36)
      {
        if (v28)
          goto LABEL_72;
        if (os_signpost_enabled(v10))
        {
          v51 = 136446722;
          v52 = "-";
          v53 = 2082;
          v54 = &byte_253E471C0[264 * v9 + 6];
          v55 = 2082;
          v56 = a4;
          _os_signpost_emit_with_name_impl(&dword_21A811000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
        }
        if (!os_signpost_enabled(v12))
          goto LABEL_72;
        v51 = 136446722;
        v52 = a3;
        v53 = 2082;
        v54 = &byte_253E471C0[264 * v9 + 6];
        v55 = 1026;
        LODWORD(v56) = a2;
        v45 = "-: WARNING: %{public}s: Expected %{public}s eMWApi_Id{wrong}=%{public}d";
      }
      else
      {
        if (!v28)
          goto LABEL_72;
        if (os_signpost_enabled(v10))
        {
          v51 = 136446722;
          v52 = "-";
          v53 = 2082;
          v54 = &byte_253E471C0[264 * v9 + 134];
          v55 = 2082;
          v56 = a4;
          _os_signpost_emit_with_name_impl(&dword_21A811000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
        }
        if (!os_signpost_enabled(v12))
          goto LABEL_72;
        v51 = 136446722;
        v52 = a3;
        v53 = 2082;
        v54 = &byte_253E471C0[264 * v9 + 134];
        v55 = 1026;
        LODWORD(v56) = a2;
        v45 = "-: WARNING: %{public}s: Expected %{public}s eMWApi{wrong}=%{public}d";
      }
      v48 = v12;
      v49 = 28;
    }
    else
    {
      if (os_signpost_enabled(v10))
      {
        v51 = 136446722;
        v52 = "-";
        v53 = 2082;
        v54 = &byte_253E471C0[264 * v9 + 6];
        v55 = 2082;
        v56 = a4;
        _os_signpost_emit_with_name_impl(&dword_21A811000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
      }
      if (os_signpost_enabled(v12))
      {
        v51 = 136446722;
        v52 = "-";
        v53 = 2082;
        v54 = &byte_253E471C0[264 * v9 + 134];
        v55 = 2082;
        v56 = a4;
        _os_signpost_emit_with_name_impl(&dword_21A811000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
      }
      if (!os_signpost_enabled(v12))
        goto LABEL_72;
      v51 = 136446978;
      v47 = &byte_253E471C0[264 * v9];
      v52 = a3;
      v53 = 2082;
      v54 = v47 + 134;
      v55 = 2082;
      v56 = v47 + 6;
      v57 = 1026;
      v58 = a2;
      v45 = "-: WARNING: %{public}s: Expected %{public}s OR %{public}s eMWApi{wrong}=%{public}d";
      v48 = v12;
      v49 = 38;
    }
    _os_signpost_emit_with_name_impl(&dword_21A811000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LIBNFC", v45, (uint8_t *)&v51, v49);
LABEL_72:
    *v13 = 0;
    *v37 = 0;
    *v29 = 0;
    v50 = &byte_253E471C0[264 * v9];
    result = 0.0;
    *(_OWORD *)(v50 + 6) = 0u;
    *(_OWORD *)(v50 + 22) = 0u;
    *(_OWORD *)(v50 + 38) = 0u;
    *(_OWORD *)(v50 + 54) = 0u;
    *(_OWORD *)(v50 + 70) = 0u;
    *(_OWORD *)(v50 + 86) = 0u;
    *(_OWORD *)(v50 + 102) = 0u;
    *(_OWORD *)(v50 + 118) = 0u;
    *(_OWORD *)(v50 + 134) = 0u;
    *(_OWORD *)(v50 + 150) = 0u;
    *(_OWORD *)(v50 + 166) = 0u;
    *(_OWORD *)(v50 + 182) = 0u;
    *(_OWORD *)(v50 + 198) = 0u;
    *(_OWORD *)(v50 + 214) = 0u;
    *(_OWORD *)(v50 + 230) = 0u;
    *(_OWORD *)(v50 + 246) = 0u;
  }
  return result;
}

uint64_t phTmlNfc_Init(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  const void **v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  int IsSupported;
  int v11;
  uint64_t v12;
  int v13;
  char v14;
  char *v15;
  char v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  char *v24;
  NSObject *v25;
  _QWORD *v26;
  void (*v27)(_QWORD, _QWORD);
  _QWORD *v28;
  void (*v29)(_QWORD, _QWORD);
  uint64_t result;
  void (*v31)(uint64_t, const char *, ...);
  NSObject *v32;
  void (*v33)(uint64_t, const char *, ...);
  NSObject *v34;
  const void **v35;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v37;
  const void **v38;
  void (*v39)(uint64_t, const char *, ...);
  const void **v40;
  void (*v41)(uint64_t, const char *, ...);
  const void **v42;
  void (*v43)(uint64_t, const char *, ...);
  void (*v44)(uint64_t, const char *, ...);
  void (*v45)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v35 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 144, "pConfig!=((void *)0)");
    dispatch_get_specific(*v35);
    v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136446722;
    v47 = "phTmlNfc_Init";
    v48 = 1024;
    v49 = 144;
    v50 = 2080;
    v51 = "pConfig!=((void *)0)";
    goto LABEL_80;
  }
  if (!*(_QWORD *)a1 && !*(_QWORD *)(a1 + 8))
  {
    v42 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v43)
      v43(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 145, "pConfig->pDevNameHsu || pConfig->pDevNameSpmi");
    dispatch_get_specific(*v42);
    v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136446722;
    v47 = "phTmlNfc_Init";
    v48 = 1024;
    v49 = 145;
    v50 = 2080;
    v51 = "pConfig->pDevNameHsu || pConfig->pDevNameSpmi";
    goto LABEL_80;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    v38 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v39 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v39)
      v39(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 146, "pConfig->pContext");
    dispatch_get_specific(*v38);
    v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136446722;
    v47 = "phTmlNfc_Init";
    v48 = 1024;
    v49 = 146;
    v50 = 2080;
    v51 = "pConfig->pContext";
    goto LABEL_80;
  }
  if (!a2)
  {
    v40 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v41)
      v41(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 147, "pHwRef!=((void *)0)");
    dispatch_get_specific(*v40);
    v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136446722;
    v47 = "phTmlNfc_Init";
    v48 = 1024;
    v49 = 147;
    v50 = 2080;
    v51 = "pHwRef!=((void *)0)";
    goto LABEL_80;
  }
  if (*(_BYTE *)(a1 + 40) == 6)
    v5 = *(char **)(a1 + 16);
  else
    v5 = 0;
  v6 = *(char **)(a1 + 8 * (*(_BYTE *)(a1 + 40) == 6));
  v7 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8)
    v8(6, "%s:%i devName: %s  auxDevName: %s", "phTmlNfc_Init", 159, v6, v5);
  dispatch_get_specific(*v7);
  v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v47 = "phTmlNfc_Init";
    v48 = 1024;
    v49 = 159;
    v50 = 2080;
    v51 = v6;
    v52 = 2080;
    v53 = v5;
    _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%i devName: %s  auxDevName: %s", buf, 0x26u);
  }
  IsSupported = NFHardwareInterfaceIsSupported(v6);
  if (!IsSupported)
    return 51;
  if (IsSupported < 0)
    return 255;
  if (!v5)
  {
LABEL_18:
    os_unfair_lock_lock((os_unfair_lock_t)&unk_253E47188);
    v12 = 0;
    v13 = *(_DWORD *)(a1 + 24);
    v14 = 1;
    while (1)
    {
      v15 = (char *)&unk_253E47188 + 8 * v12;
      if (!*((_QWORD *)v15 + 1))
        break;
      v16 = v14;
      v14 = 0;
      v12 = 1;
      if ((v16 & 1) == 0)
      {
        dispatch_get_specific(*v7);
        v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v17)
          v17(3, "%s:%i Failed to allocate TML context - no space available.", "_phTmlNfc_CreateTMLContext", 123);
        dispatch_get_specific(*v7);
        v18 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "_phTmlNfc_CreateTMLContext";
          v48 = 1024;
          v49 = 123;
          _os_log_impl(&dword_21A811000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate TML context - no space available.", buf, 0x12u);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_253E47188);
        dispatch_get_specific(*v7);
        v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v19)
          v19(3, "%s:%i Failed to create TML context !", "phTmlNfc_Init", 188);
        dispatch_get_specific(*v7);
        v20 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v47 = "phTmlNfc_Init";
          v48 = 1024;
          v49 = 188;
          v21 = "%{public}s:%i Failed to create TML context !";
          v22 = v20;
          v23 = 18;
          goto LABEL_53;
        }
        return 255;
      }
    }
    v24 = (char *)malloc_type_calloc(1uLL, 0xA0uLL, 0xAC8762BEuLL);
    *(_OWORD *)v24 = 0u;
    *((_OWORD *)v24 + 1) = 0u;
    *((_OWORD *)v24 + 2) = 0u;
    *((_OWORD *)v24 + 3) = 0u;
    *((_OWORD *)v24 + 4) = 0u;
    *((_OWORD *)v24 + 5) = 0u;
    *((_OWORD *)v24 + 6) = 0u;
    *((_OWORD *)v24 + 7) = 0u;
    *((_OWORD *)v24 + 8) = 0u;
    *((_OWORD *)v24 + 9) = 0u;
    *((_DWORD *)v24 + 38) = v13;
    *((_QWORD *)v24 + 18) = (v13 + 1);
    *((_QWORD *)v15 + 1) = v24;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_253E47188);
    pthread_mutex_init((pthread_mutex_t *)(v24 + 40), 0);
    *((_DWORD *)v24 + 8) = 0;
    if (!pthread_mutex_lock((pthread_mutex_t *)(v24 + 40)))
    {
      ++*((_DWORD *)v24 + 8);
      if (!pthread_mutex_unlock((pthread_mutex_t *)(v24 + 40)))
      {
        v24[2] = 0;
        *((_QWORD *)v24 + 1) = 0;
        *((_QWORD *)v24 + 2) = 0;
        v25 = *(NSObject **)v4;
        if (*(_QWORD *)v4)
        {
          *((_QWORD *)v24 + 3) = v25;
          dispatch_retain(v25);
          v24[104] = *(_BYTE *)(v4 + 16);
          v24[105] = *(_BYTE *)(v4 + 18);
          v26 = NFHardwareInterfaceOpen(v6, *((NSObject **)v24 + 3));
          *((_QWORD *)v24 + 14) = v26;
          if (v26)
          {
            v27 = *(void (**)(_QWORD, _QWORD))(*v26 + 88);
            if (v27)
              v27(*(_QWORD *)(*v26 + 136), *(_QWORD *)(v4 + 8));
            if (!v5)
              goto LABEL_40;
            v28 = NFHardwareInterfaceOpen(v5, *((NSObject **)v24 + 3));
            *((_QWORD *)v24 + 16) = v28;
            if (v28)
            {
              v29 = *(void (**)(_QWORD, _QWORD))(*v28 + 88);
              if (v29)
                v29(*(_QWORD *)(*v28 + 136), *(_QWORD *)(v4 + 8));
              v24[121] = 1;
LABEL_40:
              if (*(_DWORD *)(a1 + 24) == 1)
                v24[120] = 1;
              result = 0;
              *(_WORD *)v24 = 1;
              *a2 = *((_QWORD *)v24 + 18);
              return result;
            }
          }
        }
        phTmlNfc_Shutdown(*((_QWORD *)v24 + 18));
        return 255;
      }
      dispatch_get_specific(*v7);
      v45 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v45)
        v45(3, "%s:%i FAILED: %s", "retainTML", 264, "!status");
      dispatch_get_specific(*v7);
      v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v47 = "retainTML";
        v48 = 1024;
        v49 = 264;
        v50 = 2080;
        v51 = "!status";
        goto LABEL_80;
      }
LABEL_81:
      abort();
    }
    dispatch_get_specific(*v7);
    v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v44)
      v44(3, "%s:%i FAILED: %s", "retainTML", 259, "!status");
    dispatch_get_specific(*v7);
    v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136446722;
    v47 = "retainTML";
    v48 = 1024;
    v49 = 259;
    v50 = 2080;
    v51 = "!status";
LABEL_80:
    _os_log_impl(&dword_21A811000, v37, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    goto LABEL_81;
  }
  v11 = NFHardwareInterfaceIsSupported(v5);
  if (!v11)
  {
    dispatch_get_specific(*v7);
    v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31)
      v31(3, "%s:%i Interface %s is not supported?!", "phTmlNfc_Init", 175, v5);
    dispatch_get_specific(*v7);
    v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v47 = "phTmlNfc_Init";
      v48 = 1024;
      v49 = 175;
      v50 = 2080;
      v51 = v5;
      _os_log_impl(&dword_21A811000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Interface %s is not supported?!", buf, 0x1Cu);
    }
    return 51;
  }
  if ((v11 & 0x80000000) == 0)
    goto LABEL_18;
  dispatch_get_specific(*v7);
  v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v33)
    v33(3, "%s:%i Error detecting interface %s", "phTmlNfc_Init", 178, v5);
  dispatch_get_specific(*v7);
  v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v47 = "phTmlNfc_Init";
    v48 = 1024;
    v49 = 178;
    v50 = 2080;
    v51 = v5;
    v21 = "%{public}s:%i Error detecting interface %s";
    v22 = v34;
    v23 = 28;
LABEL_53:
    _os_log_impl(&dword_21A811000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
  }
  return 255;
}

uint64_t phTmlNfc_Shutdown(uint64_t a1)
{
  _DWORD *v1;
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  uint64_t v5;
  void (*v6)(_QWORD, uint64_t);
  void **v7;
  void **v8;
  int v9;
  BOOL v10;
  int v11;
  uint64_t result;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  NSObject *v19;
  uint64_t v20;
  char v21;
  char *v22;
  char v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  void (*v26)(uint64_t, const char *, ...);
  uint8_t *p_buf;
  void (*v28)(uint64_t, const char *, ...);
  uint8_t v29[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  pthread_mutex_t buf;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v1 = (_DWORD *)sub_21A815FCC(a1);
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v1)
  {
    if (Logger)
      Logger(6, "%s:%i ", "phTmlNfc_Shutdown", 307);
    dispatch_get_specific(*v2);
    v4 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__sig) = 136446466;
      *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"phTmlNfc_Shutdown";
      *(_WORD *)&buf.__opaque[4] = 1024;
      *(_DWORD *)&buf.__opaque[6] = 307;
      _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", (uint8_t *)&buf, 0x12u);
    }
    *(_BYTE *)v1 = 0;
    if (*((_BYTE *)v1 + 120))
    {
      if (*((_BYTE *)v1 + 136))
      {
        v5 = **((_QWORD **)v1 + 14);
        v6 = *(void (**)(_QWORD, uint64_t))(v5 + 112);
        if (v6)
          v6(*(_QWORD *)(v5 + 136), 1);
      }
    }
    v7 = (void **)*((_QWORD *)v1 + 14);
    if (v7)
    {
      NFHardwareInterfaceClose(v7);
      *((_QWORD *)v1 + 14) = 0;
    }
    v8 = (void **)*((_QWORD *)v1 + 16);
    if (v8)
    {
      NFHardwareInterfaceClose(v8);
      *((_QWORD *)v1 + 16) = 0;
    }
    if (pthread_mutex_lock((pthread_mutex_t *)(v1 + 10)))
    {
      dispatch_get_specific(*v2);
      v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v26)
        v26(3, "%s:%i FAILED: %s", "releaseTML", 272, "!status");
      dispatch_get_specific(*v2);
      v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__sig) = 136446722;
        *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"releaseTML";
        *(_WORD *)&buf.__opaque[4] = 1024;
        *(_DWORD *)&buf.__opaque[6] = 272;
        *(_WORD *)&buf.__opaque[10] = 2080;
        *(_QWORD *)&buf.__opaque[12] = "!status";
        goto LABEL_44;
      }
LABEL_46:
      abort();
    }
    v9 = v1[8];
    v10 = __OFSUB__(v9, 1);
    v11 = v9 - 1;
    if (v11 < 0 != v10 || (v1[8] = v11) != 0)
    {
      result = pthread_mutex_unlock((pthread_mutex_t *)(v1 + 10));
      if ((_DWORD)result)
      {
        dispatch_get_specific(*v2);
        v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v13)
          v13(3, "%s:%i FAILED: %s", "releaseTML", 298, "!status");
        dispatch_get_specific(*v2);
        v14 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.__sig) = 136446722;
          *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"releaseTML";
          *(_WORD *)&buf.__opaque[4] = 1024;
          *(_DWORD *)&buf.__opaque[6] = 298;
          *(_WORD *)&buf.__opaque[10] = 2080;
          *(_QWORD *)&buf.__opaque[12] = "!status";
LABEL_44:
          p_buf = (uint8_t *)&buf;
LABEL_45:
          _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", p_buf, 0x1Cu);
          goto LABEL_46;
        }
        goto LABEL_46;
      }
    }
    else
    {
      v16 = *(_OWORD *)(v1 + 10);
      v17 = *(_OWORD *)(v1 + 14);
      v18 = *(_OWORD *)(v1 + 22);
      *(_OWORD *)&buf.__opaque[24] = *(_OWORD *)(v1 + 18);
      *(_OWORD *)&buf.__opaque[40] = v18;
      *(_OWORD *)&buf.__sig = v16;
      *(_OWORD *)&buf.__opaque[8] = v17;
      v19 = *((_QWORD *)v1 + 3);
      if (v19)
      {
        dispatch_release(v19);
        *((_QWORD *)v1 + 3) = 0;
      }
      os_unfair_lock_lock((os_unfair_lock_t)&unk_253E47188);
      v20 = 0;
      v21 = 1;
      do
      {
        v22 = (char *)&unk_253E47188 + 8 * v20;
        if (*((_DWORD **)v22 + 1) == v1)
        {
          free(v1);
          *((_QWORD *)v22 + 1) = 0;
          goto LABEL_37;
        }
        v23 = v21;
        v21 = 0;
        v20 = 1;
      }
      while ((v23 & 1) != 0);
      dispatch_get_specific(*v2);
      v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v24)
        v24(3, "%s:%i Failed to release TML context - not found", "_phTmlNfc_FreeTMLContext", 138);
      dispatch_get_specific(*v2);
      v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v29 = 136446466;
        v30 = "_phTmlNfc_FreeTMLContext";
        v31 = 1024;
        v32 = 138;
        _os_log_impl(&dword_21A811000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to release TML context - not found", v29, 0x12u);
      }
LABEL_37:
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_253E47188);
      if (pthread_mutex_unlock(&buf))
      {
        dispatch_get_specific(*v2);
        v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v28)
          v28(3, "%s:%i FAILED: %s", "releaseTML", 290, "!status");
        dispatch_get_specific(*v2);
        v14 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v29 = 136446722;
          v30 = "releaseTML";
          v31 = 1024;
          v32 = 290;
          v33 = 2080;
          v34 = "!status";
          p_buf = v29;
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      pthread_mutex_destroy(&buf);
      return 0;
    }
  }
  else
  {
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Shutdown", 305, "tml!=NULL");
    dispatch_get_specific(*v2);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__sig) = 136446722;
      *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"phTmlNfc_Shutdown";
      *(_WORD *)&buf.__opaque[4] = 1024;
      *(_DWORD *)&buf.__opaque[6] = 305;
      *(_WORD *)&buf.__opaque[10] = 2080;
      *(_QWORD *)&buf.__opaque[12] = "tml!=NULL";
      _os_log_impl(&dword_21A811000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", (uint8_t *)&buf, 0x1Cu);
    }
    return 49;
  }
  return result;
}

_QWORD *sub_21A817EE0(_QWORD *result, unsigned __int16 a2, int a3)
{
  unsigned __int16 v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD, uint64_t *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a3)
    v3 = 0;
  else
    v3 = 255;
  v8 = 0;
  v7 = v3;
  v5 = result[4];
  v4 = (_BYTE *)result[5];
  HIDWORD(v7) = v4[120];
  v8 = v5;
  v9 = a2;
  if (*v4)
  {
    v6 = (uint64_t (*)(_QWORD, uint64_t *))result[6];
    if (v6)
      return (_QWORD *)v6(result[7], &v7);
  }
  return result;
}

uint64_t phTmlNfc_WriteAbort(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unsigned int (*v4)(_QWORD);
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  const void **v9;
  void (*v10)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = sub_21A815FCC(a1);
  if (!v1)
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_WriteAbort", 525, "tml!=NULL");
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v12 = "phTmlNfc_WriteAbort";
    v13 = 1024;
    v14 = 525;
    v15 = 2080;
    v16 = "tml!=NULL";
    goto LABEL_15;
  }
  v2 = *(uint64_t **)(v1 + 112);
  if (!v2)
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v10)
      v10(3, "%s:%i FAILED: %s", "phTmlNfc_WriteAbort", 526, "tml->ifc!=NULL");
    dispatch_get_specific(*v9);
    v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v12 = "phTmlNfc_WriteAbort";
    v13 = 1024;
    v14 = 526;
    v15 = 2080;
    v16 = "tml->ifc!=NULL";
LABEL_15:
    _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v3 = *v2;
  v4 = *(unsigned int (**)(_QWORD))(*v2 + 64);
  if (v4 && v4(*(_QWORD *)(v3 + 136)))
    return 255;
  else
    return 0;
}

uint64_t phTmlNfc_ReadAbort(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unsigned int (*v5)(_QWORD);
  uint64_t v6;
  const void **v7;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v9;
  const void **v10;
  void (*v11)(uint64_t, const char *, ...);
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BYTE v24[14];
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v1 = sub_21A815FCC(a1);
  if (!v1)
  {
    v7 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_ReadAbort", 610, "tml!=NULL");
    dispatch_get_specific(*v7);
    v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v20 = "phTmlNfc_ReadAbort";
    v21 = 1024;
    v22 = 610;
    v23 = 2080;
    *(_QWORD *)v24 = "tml!=NULL";
    goto LABEL_21;
  }
  v2 = v1;
  v3 = *(uint64_t **)(v1 + 112);
  if (!v3)
  {
    v16 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v17)
      v17(3, "%s:%i FAILED: %s", "phTmlNfc_ReadAbort", 611, "tml->ifc!=NULL");
    dispatch_get_specific(*v16);
    v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v20 = "phTmlNfc_ReadAbort";
    v21 = 1024;
    v22 = 611;
    v23 = 2080;
    *(_QWORD *)v24 = "tml->ifc!=NULL";
LABEL_21:
    _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v4 = *v3;
  v5 = *(unsigned int (**)(_QWORD))(*v3 + 56);
  if (v5 && v5(*(_QWORD *)(v4 + 136)))
    v6 = 255;
  else
    v6 = 0;
  if (NFIsInternalBuild())
  {
    v10 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v11)
      v11(6, "%s:%i Debug : Pending read %d, read cb = %p, context = %p", "phTmlNfc_ReadAbort", 616, *(unsigned __int8 *)(v2 + 2), *(const void **)(v2 + 8), *(const void **)(v2 + 16));
    dispatch_get_specific(*v10);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(unsigned __int8 *)(v2 + 2);
      v14 = *(_QWORD *)(v2 + 8);
      v15 = *(_QWORD *)(v2 + 16);
      *(_DWORD *)buf = 136447234;
      v20 = "phTmlNfc_ReadAbort";
      v21 = 1024;
      v22 = 616;
      v23 = 1024;
      *(_DWORD *)v24 = v13;
      *(_WORD *)&v24[4] = 2048;
      *(_QWORD *)&v24[6] = v14;
      v25 = 2048;
      v26 = v15;
      _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Pending read %d, read cb = %p, context = %p", buf, 0x2Cu);
    }
    *(_BYTE *)(v2 + 2) = 0;
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
  }
  return v6;
}

uint64_t phTmlNfc_FlushTxRxBuffers(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unsigned int (*v4)(_QWORD);
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  const void **v9;
  void (*v10)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = sub_21A815FCC(a1);
  if (!v1)
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_FlushTxRxBuffers", 708, "tml!=NULL");
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v12 = "phTmlNfc_FlushTxRxBuffers";
    v13 = 1024;
    v14 = 708;
    v15 = 2080;
    v16 = "tml!=NULL";
    goto LABEL_14;
  }
  v2 = *(uint64_t **)(v1 + 112);
  if (!v2)
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v10)
      v10(3, "%s:%i FAILED: %s", "phTmlNfc_FlushTxRxBuffers", 709, "tml->ifc");
    dispatch_get_specific(*v9);
    v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v12 = "phTmlNfc_FlushTxRxBuffers";
    v13 = 1024;
    v14 = 709;
    v15 = 2080;
    v16 = "tml->ifc";
LABEL_14:
    _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v3 = *v2;
  v4 = *(unsigned int (**)(_QWORD))(*v2 + 72);
  if (v4 && !v4(*(_QWORD *)(v3 + 136)))
    return 255;
  else
    return 0;
}

uint64_t sub_21A8185FC(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  int v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, BOOL);
  int v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(_QWORD);
  const void **v14;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v16;
  const void **v17;
  void (*v18)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21A815FCC(a1);
  if (!v3)
  {
    v14 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPower", 632, "tml!=NULL");
    dispatch_get_specific(*v14);
    v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v20 = "_phTmlNfc_SetPower";
    v21 = 1024;
    v22 = 632;
    v23 = 2080;
    v24 = "tml!=NULL";
    goto LABEL_21;
  }
  v4 = v3;
  v5 = *(uint64_t **)(v3 + 112);
  if (!v5)
  {
    v17 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18)
      v18(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPower", 633, "tml->ifc!=NULL");
    dispatch_get_specific(*v17);
    v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v20 = "_phTmlNfc_SetPower";
    v21 = 1024;
    v22 = 633;
    v23 = 2080;
    v24 = "tml->ifc!=NULL";
LABEL_21:
    _os_log_impl(&dword_21A811000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v6 = a2 != 0;
  v7 = *v5;
  v8 = *(uint64_t (**)(_QWORD, BOOL))(*v5 + 152);
  if (v8)
  {
    v9 = v8(*(_QWORD *)(v7 + 240), a2 != 0);
    v6 = a2 ? v9 : 0;
    if (!v9)
      return 255;
  }
  if (v6)
  {
    v10 = *(uint64_t **)(v4 + 112);
    if (v10)
    {
      v11 = *v10;
      v12 = *(void (**)(_QWORD))(*v10 + 72);
      if (v12)
        v12(*(_QWORD *)(v11 + 136));
    }
  }
  return 0;
}

uint64_t sub_21A81882C(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unsigned int (*v6)(_QWORD, BOOL);
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21A815FCC(a1);
  if (!v3)
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDownload", 674, "tml!=NULL");
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v14 = "_phTmlNfc_SetDownload";
    v15 = 1024;
    v16 = 674;
    v17 = 2080;
    v18 = "tml!=NULL";
    goto LABEL_14;
  }
  v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
      v12(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDownload", 675, "tml->ifc!=NULL");
    dispatch_get_specific(*v11);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v14 = "_phTmlNfc_SetDownload";
    v15 = 1024;
    v16 = 675;
    v17 = 2080;
    v18 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v5 = *v4;
  v6 = *(unsigned int (**)(_QWORD, BOOL))(*v4 + 176);
  if (v6 && !v6(*(_QWORD *)(v5 + 240), a2 != 0))
    return 255;
  else
    return 0;
}

uint64_t sub_21A818A28(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unsigned int (*v6)(_QWORD, BOOL);
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21A815FCC(a1);
  if (!v3)
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPMUStandbyEnabled", 647, "tml!=NULL");
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v14 = "_phTmlNfc_SetPMUStandbyEnabled";
    v15 = 1024;
    v16 = 647;
    v17 = 2080;
    v18 = "tml!=NULL";
    goto LABEL_14;
  }
  v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
      v12(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPMUStandbyEnabled", 648, "tml->ifc!=NULL");
    dispatch_get_specific(*v11);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v14 = "_phTmlNfc_SetPMUStandbyEnabled";
    v15 = 1024;
    v16 = 648;
    v17 = 2080;
    v18 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v5 = *v4;
  v6 = *(unsigned int (**)(_QWORD, BOOL))(*v4 + 160);
  if (v6 && !v6(*(_QWORD *)(v5 + 240), a2 != 0))
    return 255;
  else
    return 0;
}

uint64_t sub_21A818C24(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD, BOOL);
  uint64_t v8;
  const void **v9;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  uint64_t v15;
  uint64_t (*v16)(_QWORD);
  int v17;
  const void **v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  char v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21A815FCC(a1);
  if (!v3)
  {
    v9 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDeviceWake", 684, "tml!=NULL");
    dispatch_get_specific(*v9);
    v11 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v24 = "_phTmlNfc_SetDeviceWake";
    v25 = 1024;
    v26 = 684;
    v27 = 2080;
    v28 = "tml!=NULL";
    goto LABEL_14;
  }
  v4 = v3;
  v5 = *(uint64_t **)(v3 + 112);
  if (!v5)
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDeviceWake", 685, "tml->ifc!=NULL");
    dispatch_get_specific(*v12);
    v11 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v24 = "_phTmlNfc_SetDeviceWake";
    v25 = 1024;
    v26 = 685;
    v27 = 2080;
    v28 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_21A811000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v6 = *v5;
  v7 = *(uint64_t (**)(_QWORD, BOOL))(*v5 + 144);
  if (v7 && (v7(*(_QWORD *)(v6 + 240), a2 != 0) & 1) == 0)
  {
    v15 = **(_QWORD **)(v4 + 112);
    v16 = *(uint64_t (**)(_QWORD))(v15 + 216);
    v8 = 255;
    if (v16)
    {
      v17 = v16(*(_QWORD *)(v15 + 240));
      if (v17)
        v8 = 179;
      else
        v8 = 255;
    }
    else
    {
      v17 = 0;
    }
    v18 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19)
      v19(3, "%s:%i Failed to set device wake. NACK = %d", "_phTmlNfc_SetDeviceWake", 691, v17);
    dispatch_get_specific(*v18);
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "_phTmlNfc_SetDeviceWake";
      v25 = 1024;
      v26 = 691;
      v27 = 1024;
      LODWORD(v28) = v17;
      _os_log_impl(&dword_21A811000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to set device wake. NACK = %d", buf, 0x18u);
    }
    v21 = v17 ^ 1;
    if (!a2)
      v21 = 1;
    if ((v21 & 1) == 0)
    {
      v22 = *(_DWORD *)(v4 + 156);
      *(_DWORD *)(v4 + 156) = v22 + 1;
      if (v22 >= 11)
      {
        NFHardwareSerialDebugDump();
        phOsalNfc_RaiseExceptionWithDescription(2, 0xDEADu);
      }
    }
  }
  else
  {
    v8 = 0;
    *(_DWORD *)(v4 + 156) = 0;
  }
  return v8;
}

uint64_t sub_21A818F58(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unsigned int (*v6)(_QWORD, BOOL);
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21A815FCC(a1);
  if (!v3)
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetCRCEnable", 761, "tml!=NULL");
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v14 = "_phTmlNfc_SetCRCEnable";
    v15 = 1024;
    v16 = 761;
    v17 = 2080;
    v18 = "tml!=NULL";
    goto LABEL_14;
  }
  v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
      v12(3, "%s:%i FAILED: %s", "_phTmlNfc_SetCRCEnable", 762, "tml->ifc!=NULL");
    dispatch_get_specific(*v11);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v14 = "_phTmlNfc_SetCRCEnable";
    v15 = 1024;
    v16 = 762;
    v17 = 2080;
    v18 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  v5 = *v4;
  v6 = *(unsigned int (**)(_QWORD, BOOL))(*v4 + 104);
  if (v6 && !v6(*(_QWORD *)(v5 + 136), a2 != 0))
    return 255;
  else
    return 0;
}

uint64_t phTmlNfc_ConfigHsuBaudRate(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unsigned int (*v6)(_QWORD, _QWORD);
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  const void **v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21A815FCC(a1);
  if (!v3)
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_ConfigHsuBaudRate", 1099, "tml!=NULL");
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v17 = "phTmlNfc_ConfigHsuBaudRate";
    v18 = 1024;
    v19 = 1099;
    v20 = 2080;
    v21 = "tml!=NULL";
    goto LABEL_15;
  }
  v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
      v12(3, "%s:%i FAILED: %s", "phTmlNfc_ConfigHsuBaudRate", 1100, "tml->ifc!=NULL");
    dispatch_get_specific(*v11);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v17 = "phTmlNfc_ConfigHsuBaudRate";
    v18 = 1024;
    v19 = 1100;
    v20 = 2080;
    v21 = "tml->ifc!=NULL";
LABEL_15:
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  if ((a2 - 1) >= 9)
  {
    v13 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14)
      v14(3, "%s:%i Invalid input baud rate", "phTmlNfc_ConfigHsuBaudRate", 1115);
    dispatch_get_specific(*v13);
    v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "phTmlNfc_ConfigHsuBaudRate";
      v18 = 1024;
      v19 = 1115;
      _os_log_impl(&dword_21A811000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid input baud rate", buf, 0x12u);
    }
    return 1;
  }
  else
  {
    v5 = *v4;
    v6 = *(unsigned int (**)(_QWORD, _QWORD))(*v4 + 8);
    if (v6 && !v6(*(_QWORD *)(v5 + 136), qword_21A829F48[a2 - 1]))
      return 255;
    else
      return 0;
  }
}

uint64_t phTmlNfc_GetHsuMaxBaudRate(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 2)
  {
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Invalid mode parameter", "phTmlNfc_GetHsuMaxBaudRate", 1132);
    dispatch_get_specific(*v4);
    v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v8 = "phTmlNfc_GetHsuMaxBaudRate";
      v9 = 1024;
      v10 = 1132;
      _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid mode parameter", buf, 0x12u);
    }
    return 1;
  }
  else
  {
    result = 0;
    *a3 = 5;
  }
  return result;
}

uint64_t phTmlNfc_SpmiDrvErrorStatus(uint64_t a1, _BYTE *a2, int a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t result;
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  uint64_t v13;
  unsigned int (*v14)(_QWORD, _OWORD *, unint64_t *, _QWORD);
  uint64_t v15;
  const void **v16;
  _BYTE *v17;
  void (*v18)(uint64_t, const char *, ...);
  NSObject *v19;
  int v20;
  int v21;
  const void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  int *v25;
  char *v26;
  int *v27;
  NSObject *v28;
  int *v29;
  char *v30;
  int v31;
  unint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[10];
  int v39;
  _OWORD v40[4];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = sub_21A815FCC(a1);
  memset(v40, 0, sizeof(v40));
  v32 = 64;
  if (!v5)
  {
    v8 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_SpmiDrvErrorStatus", 1147, "tml!=NULL");
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v34 = "phTmlNfc_SpmiDrvErrorStatus";
    v35 = 1024;
    v36 = 1147;
    v37 = 2080;
    *(_QWORD *)v38 = "tml!=NULL";
    goto LABEL_13;
  }
  v6 = *(uint64_t **)(v5 + 112);
  if (!v6)
  {
    v11 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12)
      v12(3, "%s:%i FAILED: %s", "phTmlNfc_SpmiDrvErrorStatus", 1148, "tml->ifc!=NULL");
    dispatch_get_specific(*v11);
    v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v34 = "phTmlNfc_SpmiDrvErrorStatus";
    v35 = 1024;
    v36 = 1148;
    v37 = 2080;
    *(_QWORD *)v38 = "tml->ifc!=NULL";
LABEL_13:
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  if (a3)
    return 0;
  v13 = *v6;
  v14 = *(unsigned int (**)(_QWORD, _OWORD *, unint64_t *, _QWORD))(*v6 + 120);
  if (v14 && v14(*(_QWORD *)(v13 + 136), v40, &v32, a2[5]))
  {
    if (v32 < 3)
      return 0;
    v15 = 0;
    v16 = (const void **)MEMORY[0x24BEDCDB0];
    do
    {
      result = 0;
      v17 = a2;
      switch(*((_BYTE *)v40 + v15))
      {
        case 0:
          return result;
        case 4:
          goto LABEL_25;
        case 5:
          v17 = a2 + 1;
          goto LABEL_25;
        case 6:
          v17 = a2 + 2;
          goto LABEL_25;
        case 7:
          v17 = a2 + 3;
          goto LABEL_25;
        case 8:
          v17 = a2 + 4;
LABEL_25:
          *v17 = *((_BYTE *)v40 + v15 + 2);
          break;
        default:
          break;
      }
      dispatch_get_specific(*v16);
      v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v18)
        v18(3, "%s:%i SPMI register 0x%02X = 0x%02X", "phTmlNfc_SpmiDrvErrorStatus", 1178, *((unsigned __int8 *)v40 + v15), *((unsigned __int8 *)v40 + v15 + 2));
      dispatch_get_specific(*v16);
      v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *((unsigned __int8 *)v40 + v15);
        v21 = *((unsigned __int8 *)v40 + v15 + 2);
        *(_DWORD *)buf = 136446978;
        v34 = "phTmlNfc_SpmiDrvErrorStatus";
        v35 = 1024;
        v36 = 1178;
        v37 = 1024;
        *(_DWORD *)v38 = v20;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v21;
        _os_log_impl(&dword_21A811000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i SPMI register 0x%02X = 0x%02X", buf, 0x1Eu);
      }
      result = 0;
      v15 += 3;
    }
    while (v32 >= v15 + 3);
  }
  else
  {
    v22 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v23 = NFLogGetLogger();
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      v25 = __error();
      v26 = strerror(*v25);
      v27 = __error();
      v24(3, "%s:%i \"%s\" errno=%d Failed to query SPMI error registers", "phTmlNfc_SpmiDrvErrorStatus", 1157, v26, *v27);
    }
    dispatch_get_specific(*v22);
    v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = __error();
      v30 = strerror(*v29);
      v31 = *__error();
      *(_DWORD *)buf = 136446978;
      v34 = "phTmlNfc_SpmiDrvErrorStatus";
      v35 = 1024;
      v36 = 1157;
      v37 = 2080;
      *(_QWORD *)v38 = v30;
      *(_WORD *)&v38[8] = 1024;
      v39 = v31;
      _os_log_impl(&dword_21A811000, v28, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to query SPMI error registers", buf, 0x22u);
    }
    return 255;
  }
  return result;
}

uint64_t phTmlNfc_SetGetSpmiDrvConfigRegs()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Not Implemented!!!", "phTmlNfc_SetGetSpmiDrvConfigRegs", 1194);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "phTmlNfc_SetGetSpmiDrvConfigRegs";
    v6 = 1024;
    v7 = 1194;
    _os_log_impl(&dword_21A811000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Not Implemented!!!", buf, 0x12u);
  }
  return 0;
}

uint64_t phTmlNfc_ConfigureSpmi(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  _BOOL4 v5;
  const void **v6;
  void (*v7)(uint64_t, const char *, ...);
  NSObject *v8;
  uint64_t result;
  const void **v10;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD);
  char v19;
  void (*v20)(uint64_t, const char *, ...);
  void (*v21)(uint64_t, const char *, ...);
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void (*v26)(uint64_t, const char *, ...);
  NSObject *v27;
  uint64_t v28;
  uint64_t (*v29)(_QWORD);
  char v30;
  void (*v31)(uint64_t, const char *, ...);
  NSObject *v32;
  NSObject *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = sub_21A815FCC(a1);
  if (!v2)
  {
    v10 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_ConfigureSpmi", 1204, "tml!=NULL");
    dispatch_get_specific(*v10);
    v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v35 = "phTmlNfc_ConfigureSpmi";
    v36 = 1024;
    v37 = 1204;
    v38 = 2080;
    v39 = "tml!=NULL";
    goto LABEL_16;
  }
  v3 = v2;
  if (*(_BYTE *)(v2 + 120))
    v4 = "hammerfest-spmi";
  else
    v4 = "stockholm-spmi";
  v5 = NFHardwareSkipSpmiReconfig(v4);
  if (!*(_BYTE *)(v3 + 120))
    return 6;
  v6 = (const void **)MEMORY[0x24BEDCDB0];
  if (v5)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v7 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v7)
      v7(4, "%s:%i Skipping SPMI reconfig.", "phTmlNfc_ConfigureSpmi", 1209);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "phTmlNfc_ConfigureSpmi";
      v36 = 1024;
      v37 = 1209;
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Skipping SPMI reconfig.", buf, 0x12u);
    }
    return 6;
  }
  v13 = sub_21A815FCC(a1);
  if (!v13)
  {
    dispatch_get_specific(*v6);
    v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21)
      v21(3, "%s:%i FAILED: %s", "_phTmlNfc_ConfigureSPMI", 718, "tml!=NULL");
    dispatch_get_specific(*v6);
    v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v35 = "_phTmlNfc_ConfigureSPMI";
    v36 = 1024;
    v37 = 718;
    v38 = 2080;
    v39 = "tml!=NULL";
    goto LABEL_16;
  }
  v14 = v13;
  if (!*(_QWORD *)(v13 + 112) || !*(_QWORD *)(v13 + 128))
  {
    dispatch_get_specific(*v6);
    v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v20)
      v20(3, "%s:%i FAILED: %s", "_phTmlNfc_ConfigureSPMI", 720, "(tml->ifc && tml->auxIfc)");
    dispatch_get_specific(*v6);
    v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      return 49;
    *(_DWORD *)buf = 136446722;
    v35 = "_phTmlNfc_ConfigureSPMI";
    v36 = 1024;
    v37 = 720;
    v38 = 2080;
    v39 = "(tml->ifc && tml->auxIfc)";
LABEL_16:
    _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  dispatch_get_specific(*v6);
  v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v15)
    v15(6, "%s:%i Validating Hammerfest SPMI config...", "_phTmlNfc_ConfigureSPMI", 730);
  dispatch_get_specific(*v6);
  v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v35 = "_phTmlNfc_ConfigureSPMI";
    v36 = 1024;
    v37 = 730;
    _os_log_impl(&dword_21A811000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Validating Hammerfest SPMI config...", buf, 0x12u);
  }
  v17 = **(_QWORD **)(v14 + 112);
  v18 = *(uint64_t (**)(_QWORD))(v17 + 200);
  if (v18)
    v19 = v18(*(_QWORD *)(v17 + 240));
  else
    v19 = 1;
  dispatch_get_specific(*v6);
  v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if ((v19 & 1) != 0)
  {
    if (v22)
      v22(6, "%s:%i Hammerfest SPMI config is good", "_phTmlNfc_ConfigureSPMI", 736);
    dispatch_get_specific(*v6);
    v23 = NFSharedLogGetLogger();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v24)
    {
      *(_DWORD *)buf = 136446466;
      v35 = "_phTmlNfc_ConfigureSPMI";
      v36 = 1024;
      v37 = 736;
      _os_log_impl(&dword_21A811000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hammerfest SPMI config is good", buf, 0x12u);
      return 0;
    }
  }
  else
  {
    if (v22)
      v22(6, "%s:%i Hammerfest SPMI config is incorrect", "_phTmlNfc_ConfigureSPMI", 733);
    dispatch_get_specific(*v6);
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "_phTmlNfc_ConfigureSPMI";
      v36 = 1024;
      v37 = 733;
      _os_log_impl(&dword_21A811000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hammerfest SPMI config is incorrect", buf, 0x12u);
    }
    dispatch_get_specific(*v6);
    v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26)
      v26(6, "%s:%i Setting Hammerfest SPMI config...", "_phTmlNfc_ConfigureSPMI", 741);
    dispatch_get_specific(*v6);
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "_phTmlNfc_ConfigureSPMI";
      v36 = 1024;
      v37 = 741;
      _os_log_impl(&dword_21A811000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Setting Hammerfest SPMI config...", buf, 0x12u);
    }
    v28 = **(_QWORD **)(v14 + 128);
    v29 = *(uint64_t (**)(_QWORD))(v28 + 208);
    if (v29)
      v30 = v29(*(_QWORD *)(v28 + 240));
    else
      v30 = 1;
    dispatch_get_specific(*v6);
    v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if ((v30 & 1) != 0)
    {
      if (v31)
        v31(6, "%s:%i Hammerfest SPMI config is set", "_phTmlNfc_ConfigureSPMI", 748);
      dispatch_get_specific(*v6);
      v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v35 = "_phTmlNfc_ConfigureSPMI";
        v36 = 1024;
        v37 = 748;
        _os_log_impl(&dword_21A811000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hammerfest SPMI config is set", buf, 0x12u);
      }
      result = 0;
      *(_BYTE *)(v14 + 121) = 0;
    }
    else
    {
      if (v31)
        v31(6, "%s:%i Failed to set Hammerfest SPMI config", "_phTmlNfc_ConfigureSPMI", 745);
      dispatch_get_specific(*v6);
      v33 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v35 = "_phTmlNfc_ConfigureSPMI";
        v36 = 1024;
        v37 = 745;
        _os_log_impl(&dword_21A811000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Failed to set Hammerfest SPMI config", buf, 0x12u);
      }
      return 255;
    }
  }
  return result;
}

uint64_t phOsalNfc_Timer_Init(int a1, NSObject **a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint64_t result;
  uint64_t v8;
  char i;
  char v10;
  const void **v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  const void **v16;
  NSObject *v17;
  char *v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, const char *, ...);
  NSObject *v22;
  NSObject *v23;
  uint64_t j;
  char *v25;
  uint8_t buf[4];
  _BYTE v27[10];
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (sub_21A81A5F0(a1))
  {
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Timer already initialized for config %d", "phOsalNfc_Timer_Init", 208, a1);
    dispatch_get_specific(*v4);
    v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)v27 = "phOsalNfc_Timer_Init";
      *(_WORD *)&v27[8] = 1024;
      v28 = 208;
      v29 = 1024;
      v30 = a1;
      _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Timer already initialized for config %d", buf, 0x18u);
    }
    return 50;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2550F9CF0);
    v8 = 0;
    for (i = 1; ; i = 0)
    {
      v10 = i;
      if (!qword_253E473D0[v8])
        break;
      v8 = 1;
      if ((v10 & 1) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_2550F9CF0);
        v11 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v12)
          v12(3, "%s:%i Failed to allocate timer context - no space available.", "_phTmlNfc_AllocateContext", 76);
        dispatch_get_specific(*v11);
        v13 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)v27 = "_phTmlNfc_AllocateContext";
          *(_WORD *)&v27[8] = 1024;
          v28 = 76;
          _os_log_impl(&dword_21A811000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate timer context - no space available.", buf, 0x12u);
        }
        dispatch_get_specific(*v11);
        v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v14)
          v14(3, "%s:%i failed to start timer thread", "phOsalNfc_Timer_Init", 214);
        dispatch_get_specific(*v11);
        v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)v27 = "phOsalNfc_Timer_Init";
          *(_WORD *)&v27[8] = 1024;
          v28 = 214;
          _os_log_impl(&dword_21A811000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to start timer thread", buf, 0x12u);
        }
        return 225;
      }
    }
    v16 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v17 = NFSharedMiddlewareSignpostLog();
    if (!v17)
      v17 = NFSharedSignpostLog();
    if (os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v27 = v8;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = a1;
      _os_signpost_emit_with_name_impl(&dword_21A811000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Allocated Timer", "slot %d, ctlr %d", buf, 0xEu);
    }
    v18 = (char *)malloc_type_calloc(1uLL, 0xF8uLL, 0xAC8762BEuLL);
    *((_DWORD *)v18 + 60) = a1;
    qword_253E473D0[v8] = v18;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2550F9CF0);
    v19 = pthread_mutex_init((pthread_mutex_t *)(v18 + 176), 0);
    if (v19)
    {
      v20 = v19;
      dispatch_get_specific(*v16);
      v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21)
        v21(3, "%s:%i Failed to create mutex: %d", "phOsalNfc_Timer_Init", 220, v20);
      dispatch_get_specific(*v16);
      v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)v27 = "phOsalNfc_Timer_Init";
        *(_WORD *)&v27[8] = 1024;
        v28 = 220;
        v29 = 1024;
        v30 = v20;
        _os_log_impl(&dword_21A811000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create mutex: %d", buf, 0x18u);
      }
      sub_21A81A680(a1);
      return 255;
    }
    else
    {
      v23 = *a2;
      *((_QWORD *)v18 + 21) = *a2;
      dispatch_retain(v23);
      for (j = 8; j != 168; j += 32)
      {
        v25 = &v18[j];
        *(_OWORD *)v25 = xmmword_21A829FC0;
        *((_OWORD *)v25 + 1) = xmmword_21A829FC0;
      }
      result = 0;
      *(_QWORD *)v18 = 1;
    }
  }
  return result;
}

uint64_t sub_21A81A5F0(int a1)
{
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2550F9CF0);
  v2 = 0;
  v3 = 1;
  do
  {
    while (1)
    {
      v4 = v3;
      v5 = qword_253E473D0[v2];
      if (v5)
        break;
      v3 = 0;
      v2 = 1;
      if ((v4 & 1) == 0)
      {
        v7 = 0;
        goto LABEL_10;
      }
    }
    v3 = 0;
    v6 = *(_DWORD *)(v5 + 240);
    v2 = 1;
  }
  while ((v4 & (v6 != a1)) != 0);
  if (v6 == a1)
    v7 = v5;
  else
    v7 = 0;
LABEL_10:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2550F9CF0);
  return v7;
}

void sub_21A81A680(int a1)
{
  uint64_t v2;
  char i;
  char v4;
  uint64_t v5;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  _BYTE v12[10];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2550F9CF0);
  v2 = 0;
  for (i = 1; ; i = 0)
  {
    v4 = i;
    v5 = qword_253E473D0[v2];
    if (v5)
    {
      if (*(_DWORD *)(v5 + 240) == a1)
        break;
    }
    v2 = 1;
    if ((v4 & 1) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_2550F9CF0);
      v6 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i Failed to release timer context - not found", "_phTmlNfc_ReleaseContext", 99);
      dispatch_get_specific(*v6);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)v12 = "_phTmlNfc_ReleaseContext";
        *(_WORD *)&v12[8] = 1024;
        v13 = 99;
        _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to release timer context - not found", buf, 0x12u);
      }
      return;
    }
  }
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v9 = NFSharedMiddlewareSignpostLog();
  if (!v9)
    v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v12 = v2;
    *(_WORD *)&v12[4] = 1024;
    *(_DWORD *)&v12[6] = a1;
    _os_signpost_emit_with_name_impl(&dword_21A811000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Released Timer", "slot %d, ctlr %d", buf, 0xEu);
  }
  v10 = (void *)qword_253E473D0[v2];
  if (v10)
    free(v10);
  qword_253E473D0[v2] = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2550F9CF0);
}

uint64_t phOsalNfc_Timer_Deinit(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = sub_21A81A5F0(a1);
  if (v2)
  {
    v3 = v2;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 168));
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 176));
    for (i = 8; i != 168; i += 16)
    {
      if (*(_QWORD *)(v3 + i) != 0xFFFFFFFFFFFFLL)
        sub_21A81A9E4(v3 + i, 1);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v3 + 176));
    pthread_mutex_destroy((pthread_mutex_t *)(v3 + 176));
    dispatch_release(*(dispatch_object_t *)(v3 + 168));
    *(_QWORD *)(v3 + 168) = 0;
    sub_21A81A680(a1);
    return 0;
  }
  else
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Deinit", 250);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "phOsalNfc_Timer_Deinit";
      v11 = 1024;
      v12 = 250;
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
    }
    return 49;
  }
}

uint64_t sub_21A81A9E4(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t result;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    if (v4)
    {
      dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
      dispatch_release(*(dispatch_object_t *)(a1 + 8));
      *(_QWORD *)(a1 + 8) = 0;
    }
    result = 0;
    if (a2)
      *(_QWORD *)a1 = 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Invalid timer", "_phOsalNfc_Timer_ClearTimer", 178);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "_phOsalNfc_Timer_ClearTimer";
      v11 = 1024;
      v12 = 178;
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid timer", buf, 0x12u);
    }
    return 1;
  }
  return result;
}

uint64_t phOsalNfc_Timer_Create(int a1)
{
  uint64_t v2;
  uint64_t *v3;
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  const void **v7;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v9;
  uint64_t i;
  NSObject *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = sub_21A81A5F0(a1);
  if (v2)
  {
    v3 = (uint64_t *)v2;
    v4 = (pthread_mutex_t *)(v2 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 176));
    v5 = 1;
    while (v3[v5] != 0xFFFFFFFFFFFFLL)
    {
      v5 += 2;
      if (v5 == 21)
      {
        v6 = 0xFFFFFFFFFFFFLL;
        goto LABEL_18;
      }
    }
    for (i = *v3; i == 0xFFFFFFFFFFFELL || i == -1; ++i)
      ;
    v6 = i + 1;
    *v3 = i + 1;
    v3[v5] = i + 1;
LABEL_18:
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v12 = NFSharedMiddlewareSignpostLog();
    if (!v12)
      v12 = NFSharedSignpostLog();
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 134218240;
      v15 = (const char *)v6;
      v16 = 1024;
      v17 = a1;
      _os_signpost_emit_with_name_impl(&dword_21A811000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Created Timer", "timerId %llX, ctlr %d", buf, 0x12u);
    }
    pthread_mutex_unlock(v4);
  }
  else
  {
    v7 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i Failed to get timer context for type %d", "phOsalNfc_Timer_Create", 279, a1);
    dispatch_get_specific(*v7);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "phOsalNfc_Timer_Create";
      v16 = 1024;
      v17 = 279;
      v18 = 1024;
      v19 = a1;
      _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context for type %d", buf, 0x18u);
    }
    return 0xFFFFFFFFFFFFLL;
  }
  return v6;
}

uint64_t phOsalNfc_Timer_Delete(int a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  pthread_mutex_t *v6;
  uint64_t v7;
  const void **v8;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v10;
  uint64_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = sub_21A81A5F0(a1);
  if (v4)
  {
    v5 = v4;
    v6 = (pthread_mutex_t *)(v4 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 176));
    v7 = 8;
    while (*(const char **)(v5 + v7) != a2)
    {
      v7 += 16;
      if (v7 == 168)
      {
        v8 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(3, "%s:%i Failed to get timer %llX from context", "phOsalNfc_Timer_Delete", 398, a2);
        dispatch_get_specific(*v8);
        v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v18 = "phOsalNfc_Timer_Delete";
          v19 = 1024;
          v20 = 398;
          v21 = 2048;
          v22 = a2;
          _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer %llX from context", buf, 0x1Cu);
        }
        v11 = 1;
        goto LABEL_19;
      }
    }
    v11 = sub_21A81A9E4(v5 + v7, 1);
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v15 = NFSharedMiddlewareSignpostLog();
    if (!v15)
      v15 = NFSharedSignpostLog();
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 134218240;
      v18 = a2;
      v19 = 1024;
      v20 = a1;
      _os_signpost_emit_with_name_impl(&dword_21A811000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Deleted Timer", "timerId %llX, ctlr %d", buf, 0x12u);
    }
LABEL_19:
    pthread_mutex_unlock(v6);
  }
  else
  {
    v12 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13)
      v13(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Delete", 391);
    dispatch_get_specific(*v12);
    v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v18 = "phOsalNfc_Timer_Delete";
      v19 = 1024;
      v20 = 391;
      _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
    }
    return 49;
  }
  return v11;
}

uint64_t sub_21A81AFC4(uint64_t a1)
{
  double v2;
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = CFAbsoluteTimeGetCurrent() - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2 > 0.100000001)
  {
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(4, "%s:%i Timer fired late: %f", "_phOsalNfc_Timer_StartTimer_block_invoke", 157, *(_QWORD *)&v2);
    dispatch_get_specific(*v3);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v8 = "_phOsalNfc_Timer_StartTimer_block_invoke";
      v9 = 1024;
      v10 = 157;
      v11 = 2048;
      v12 = v2;
      _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Timer fired late: %f", buf, 0x1Cu);
    }
  }
  phOsalNfc_Timer_Stop(*(_DWORD *)(a1 + 64), *(const char **)(a1 + 40));
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 48))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

void phOsalNfc_LogStr(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  void (*v7)(uint64_t, const char *, ...);
  NSObject *v8;
  os_log_type_t v9;
  void (*v10)(uint64_t, const char *, ...);
  NSObject *v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1:
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      v6 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      break;
    case 2:
      v7 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v7)
        v7(4, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      v6 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)buf = 136446722;
        v15 = "phOsalNfc_LogStr";
        v16 = 1024;
        v17 = 65;
        v18 = 2080;
        v19 = a4;
        v8 = v6;
        v9 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v10)
        v10(6, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v15 = "phOsalNfc_LogStr";
        v16 = 1024;
        v17 = 65;
        v18 = 2080;
        v19 = a4;
        v8 = v11;
        v9 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12)
        v12(7, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446722;
        v15 = "phOsalNfc_LogStr";
        v16 = 1024;
        v17 = 65;
        v18 = 2080;
        v19 = a4;
        v8 = v13;
        v9 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_21A811000, v8, v9, "%{public}s:%i %s", buf, 0x1Cu);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogU32(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5)
{
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  os_log_type_t v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1:
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      break;
    case 2:
      v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9)
        v9(4, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogU32";
        v18 = 1024;
        v19 = 74;
        v20 = 2080;
        v21 = a4;
        v22 = 1024;
        v23 = a5;
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12)
        v12(6, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogU32";
        v18 = 1024;
        v19 = 74;
        v20 = 2080;
        v21 = a4;
        v22 = 1024;
        v23 = a5;
        v10 = v13;
        v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v14)
        v14(7, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogU32";
        v18 = 1024;
        v19 = 74;
        v20 = 2080;
        v21 = a4;
        v22 = 1024;
        v23 = a5;
        v10 = v15;
        v11 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_21A811000, v10, v11, "%{public}s:%i %s=%d", buf, 0x22u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogX32(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5)
{
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  os_log_type_t v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1:
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      break;
    case 2:
      v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9)
        v9(4, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogX32";
        v18 = 1024;
        v19 = 83;
        v20 = 2080;
        v21 = a4;
        v22 = 1024;
        v23 = a5;
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12)
        v12(6, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogX32";
        v18 = 1024;
        v19 = 83;
        v20 = 2080;
        v21 = a4;
        v22 = 1024;
        v23 = a5;
        v10 = v13;
        v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v14)
        v14(7, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogX32";
        v18 = 1024;
        v19 = 83;
        v20 = 2080;
        v21 = a4;
        v22 = 1024;
        v23 = a5;
        v10 = v15;
        v11 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_21A811000, v10, v11, "%{public}s:%i %s=0x%X", buf, 0x22u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogX64(uint64_t a1, uint64_t a2, int a3, const char *a4, uint64_t a5)
{
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  os_log_type_t v11;
  void (*v12)(uint64_t, const char *, ...);
  NSObject *v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1:
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      break;
    case 2:
      v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9)
        v9(4, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogX64";
        v18 = 1024;
        v19 = 92;
        v20 = 2080;
        v21 = a4;
        v22 = 2048;
        v23 = a5;
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12)
        v12(6, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogX64";
        v18 = 1024;
        v19 = 92;
        v20 = 2080;
        v21 = a4;
        v22 = 2048;
        v23 = a5;
        v10 = v13;
        v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v14)
        v14(7, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "phOsalNfc_LogX64";
        v18 = 1024;
        v19 = 92;
        v20 = 2080;
        v21 = a4;
        v22 = 2048;
        v23 = a5;
        v10 = v15;
        v11 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_21A811000, v10, v11, "%{public}s:%i %s=0x%llX", buf, 0x26u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogBool(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5)
{
  void (*Logger)(uint64_t, const char *, ...);
  const char *v8;
  NSObject *v9;
  const char *v10;
  void (*v11)(uint64_t, const char *, ...);
  const char *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void (*v16)(uint64_t, const char *, ...);
  const char *v17;
  NSObject *v18;
  const char *v19;
  void (*v20)(uint64_t, const char *, ...);
  const char *v21;
  NSObject *v22;
  const char *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1:
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        v8 = "TRUE";
        if (!a5)
          v8 = "FALSE";
        Logger(3, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v8);
      }
      v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = "TRUE";
        v25 = "phOsalNfc_LogBool";
        v26 = 1024;
        v27 = 104;
        *(_DWORD *)buf = 136446978;
        v28 = 2080;
        if (!a5)
          v10 = "FALSE";
        v29 = a4;
        v30 = 2080;
        v31 = v10;
        goto LABEL_18;
      }
      break;
    case 2:
      v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v11)
      {
        v12 = "TRUE";
        if (!a5)
          v12 = "FALSE";
        v11(4, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v12);
      }
      v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = "TRUE";
        v25 = "phOsalNfc_LogBool";
        v26 = 1024;
        v27 = 104;
        *(_DWORD *)buf = 136446978;
        v28 = 2080;
        if (!a5)
          v13 = "FALSE";
        v29 = a4;
        v30 = 2080;
        v31 = v13;
LABEL_18:
        v14 = v9;
        v15 = OS_LOG_TYPE_ERROR;
        goto LABEL_37;
      }
      break;
    case 4:
      v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
      {
        v17 = "TRUE";
        if (!a5)
          v17 = "FALSE";
        v16(6, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v17);
      }
      v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = "TRUE";
        v25 = "phOsalNfc_LogBool";
        v26 = 1024;
        v27 = 104;
        *(_DWORD *)buf = 136446978;
        v28 = 2080;
        if (!a5)
          v19 = "FALSE";
        v29 = a4;
        v30 = 2080;
        v31 = v19;
        v14 = v18;
        v15 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_37;
      }
      break;
    case 5:
      v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v20)
      {
        if (a5)
          v21 = "TRUE";
        else
          v21 = "FALSE";
        v20(7, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v21);
      }
      v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        if (a5)
          v23 = "TRUE";
        else
          v23 = "FALSE";
        *(_DWORD *)buf = 136446978;
        v25 = "phOsalNfc_LogBool";
        v26 = 1024;
        v27 = 104;
        v28 = 2080;
        v29 = a4;
        v30 = 2080;
        v31 = v23;
        v14 = v22;
        v15 = OS_LOG_TYPE_DEBUG;
LABEL_37:
        _os_log_impl(&dword_21A811000, v14, v15, "%{public}s:%i %s=%s", buf, 0x26u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogFunc(uint64_t a1, uint64_t a2, const char *a3, int a4)
{
  void (*Logger)(uint64_t, const char *, ...);
  const char *v7;
  NSObject *v8;
  const char *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    if (a4)
      v7 = "+";
    else
      v7 = "-";
    Logger(7, "%s:%i :%s:%s", "phOsalNfc_LogFunc", 115, v7, a3);
  }
  v8 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (a4)
      v9 = "+";
    else
      v9 = "-";
    *(_DWORD *)buf = 136446978;
    v11 = "phOsalNfc_LogFunc";
    v12 = 1024;
    v13 = 115;
    v14 = 2080;
    v15 = v9;
    v16 = 2080;
    v17 = a3;
    _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_DEBUG, "%{public}s:%i :%s:%s", buf, 0x26u);
  }
}

void phOsalNfc_SignPostLogX32(uint64_t a1, int a2, int a3, uint64_t a4, int a5)
{
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = NFSharedMiddlewareSignpostLog();
  if (v9)
  {
    v10 = v9;
    switch(a2)
    {
      case 1:
        if (os_signpost_enabled(v9))
        {
          v13 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v13;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHTMLNFC";
          goto LABEL_19;
        }
        break;
      case 2:
        if (os_signpost_enabled(v9))
        {
          v14 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v14;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHOSALNFC";
          goto LABEL_19;
        }
        break;
      case 3:
        if (os_signpost_enabled(v9))
        {
          v15 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v15;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHNCINFC";
          goto LABEL_19;
        }
        break;
      case 4:
      case 9:
      case 10:
        if (os_signpost_enabled(v9))
        {
          v11 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v11;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHLIBNFC";
          goto LABEL_19;
        }
        break;
      case 5:
        if (os_signpost_enabled(v9))
        {
          v16 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v16;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHLIBNFC_INFRA";
          goto LABEL_19;
        }
        break;
      case 6:
        if (os_signpost_enabled(v9))
        {
          v17 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v17;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHLIBNFC_DNLD";
          goto LABEL_19;
        }
        break;
      case 7:
        if (os_signpost_enabled(v9))
        {
          v18 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v18;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHLIBNFC_HCI";
          goto LABEL_19;
        }
        break;
      case 8:
        if (os_signpost_enabled(v9))
        {
          v19 = qword_24DD2CC70[a3];
          v20 = 136446722;
          v21 = v19;
          v22 = 2082;
          v23 = a4;
          v24 = 1024;
          v25 = a5;
          v12 = "PHLIBNFC_NDEF";
LABEL_19:
          _os_signpost_emit_with_name_impl(&dword_21A811000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, "%{public}s%{public}s=0x%08X", (uint8_t *)&v20, 0x1Cu);
        }
        break;
      default:
        return;
    }
  }
}

void phOsalNfc_SignPostLogTimerEvents(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v19;
  const char *v20;
  NSObject *v21;
  os_signpost_type_t v22;
  uint32_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = NFSharedMiddlewareSignpostLog();
  if (v11)
  {
    v12 = v11;
    v13 = sub_21A81A5F0(a1);
    v14 = 0;
    v15 = (uint64_t *)(v13 + 8);
    while (1)
    {
      v17 = *v15;
      v15 += 2;
      v16 = v17;
      if (v17 != 0xFFFFFFFFFFFFLL && v16 == a2)
        break;
      if (++v14 == 10)
      {
        LODWORD(v14) = 61680;
        break;
      }
    }
    if (a6)
    {
      if (a5)
      {
        switch((int)v14)
        {
          case 0:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID1";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 1:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID2";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 2:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID3";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 3:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID4";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 4:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID5";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 5:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID6";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 6:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID7";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 7:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID8";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 8:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID9";
              v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 9:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446722;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v28 = 2082;
              v29 = a5;
              v19 = "PHLIBNFC_TIMER_ID10";
              v20 = "%{public}s:%{public}s <- %{public}s";
LABEL_42:
              v21 = v12;
              v22 = OS_SIGNPOST_INTERVAL_BEGIN;
              goto LABEL_62;
            }
            break;
          default:
            return;
        }
      }
      else
      {
        switch((int)v14)
        {
          case 0:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID1";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 1:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID2";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 2:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID3";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 3:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID4";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 4:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID5";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 5:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID6";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 6:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID7";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 7:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID8";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 8:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID9";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 9:
            if (os_signpost_enabled(v12))
            {
              v24 = 136446466;
              v25 = "+";
              v26 = 2082;
              v27 = a4;
              v19 = "PHLIBNFC_TIMER_ID10";
              v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          default:
            return;
        }
      }
    }
    else if (a5)
    {
      switch((int)v14)
      {
        case 0:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID1";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 1:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID2";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 2:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID3";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 3:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID4";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 4:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID5";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 5:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID6";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 6:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID7";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 7:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID8";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 8:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID9";
            v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 9:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446722;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v28 = 2082;
            v29 = a5;
            v19 = "PHLIBNFC_TIMER_ID10";
            v20 = "%{public}s:%{public}s <- %{public}s";
LABEL_61:
            v21 = v12;
            v22 = OS_SIGNPOST_INTERVAL_END;
LABEL_62:
            v23 = 32;
            goto LABEL_101;
          }
          break;
        default:
          return;
      }
    }
    else
    {
      switch((int)v14)
      {
        case 0:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID1";
            v20 = "%{public}s:%{public}s";
            v21 = v12;
            v22 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_100;
          }
          break;
        case 1:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID2";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 2:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID3";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 3:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID4";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 4:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID5";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 5:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID6";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 6:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID7";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 7:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID8";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 8:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID9";
            v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 9:
          if (os_signpost_enabled(v12))
          {
            v24 = 136446466;
            v25 = "-";
            v26 = 2082;
            v27 = a4;
            v19 = "PHLIBNFC_TIMER_ID10";
            v20 = "%{public}s:%{public}s";
LABEL_99:
            v21 = v12;
            v22 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_100:
            v23 = 22;
LABEL_101:
            _os_signpost_emit_with_name_impl(&dword_21A811000, v21, v22, 0xEEEEB0B5B2B2EEEELL, v19, v20, (uint8_t *)&v24, v23);
          }
          break;
        default:
          return;
      }
    }
  }
}

void phOsalNfc_SignPostLogHexData(uint64_t a1, int a2, int a3, _BYTE *a4, uint64_t a5, unsigned int a6)
{
  int v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  char v20;
  char v21;
  _BYTE v22[86];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  memset(v22, 0, sizeof(v22));
  LOBYTE(v10) = *a4;
  v11 = v22;
  if (*a4)
  {
    v12 = 0;
    do
    {
      v22[v12] = v10;
      v13 = v12 + 1;
      if (v12 > 0x1A)
        break;
      v10 = a4[++v12];
    }
    while (v10);
    v11 = &v22[v13];
  }
  *v11 = 58;
  if (a6)
  {
    v14 = 0;
    v15 = v11 + 1;
    v16 = a6;
    do
    {
      v17 = *(unsigned __int8 *)(a5 + v14);
      v18 = v17 & 0xF;
      v19 = (v17 >> 4) | 0x30;
      if (v17 >= 0xA0)
        LOBYTE(v19) = (*(_BYTE *)(a5 + v14) >> 4) + 55;
      *v15 = v19;
      v20 = v17 & 0xF | 0x30;
      v21 = v18 + 55;
      if (v18 < 0xA)
        v21 = v20;
      v15[1] = v21;
      *((_WORD *)v15 + 1) = 32;
      if ((++v14 & 3) != 0)
      {
        v15 += 3;
      }
      else
      {
        v15[5] = 0;
        v15 += 5;
        *((_WORD *)v15 - 1) = 8224;
      }
      if ((v14 & 0xF) == 0)
      {
        *v15 = 0;
        v15 = v22;
        phOsalNfc_SignPostLogStr(a1, a2, a3, (uint64_t)v22);
        v22[0] = 0;
      }
    }
    while (v16 != v14);
  }
  if (v22[0])
    phOsalNfc_SignPostLogStr(a1, a2, a3, (uint64_t)v22);
}

uint64_t NFCalibrationGetRFConfigTLVs(CFStringRef *a1)
{
  io_registry_entry_t *v2;
  io_object_t *v3;
  uint64_t RFConfigTLVs;
  const void **v6;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = NFHardwareLoad("stockholm");
  if (v2)
  {
    v3 = v2;
    RFConfigTLVs = NFHardwareGetRFConfigTLVs(v2, a1);
    NFHardwareUnload(v3);
    return RFConfigTLVs;
  }
  else
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(4, "%s:%i Failed to load hw", "NFCalibrationGetRFConfigTLVs", 18);
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v10 = "NFCalibrationGetRFConfigTLVs";
      v11 = 1024;
      v12 = 18;
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load hw", buf, 0x12u);
    }
    return 0;
  }
}

CFStringRef NFCalibrationCopyAntennaName(const char *a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  io_registry_entry_t *v5;
  io_object_t *v6;
  CFStringRef v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i driverName=%s", "NFCalibrationCopyAntennaName", 33, a1);
  dispatch_get_specific(*v2);
  v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "NFCalibrationCopyAntennaName";
    v13 = 1024;
    v14 = 33;
    v15 = 2080;
    v16 = a1;
    _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i driverName=%s", buf, 0x1Cu);
  }
  v5 = NFHardwareLoad(a1);
  if (v5)
  {
    v6 = v5;
    v7 = NFHardwareCopyAntennaName(v5);
    NFHardwareUnload(v6);
  }
  else
  {
    dispatch_get_specific(*v2);
    v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v8)
      v8(4, "%s:%i Failed to load hw", "NFCalibrationCopyAntennaName", 36);
    dispatch_get_specific(*v2);
    v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "NFCalibrationCopyAntennaName";
      v13 = 1024;
      v14 = 36;
      _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load hw", buf, 0x12u);
    }
    return 0;
  }
  return v7;
}

uint64_t phOsalNfc_IsHeapMemory()
{
  malloc_zone_t *v0;
  unsigned int (*claimed_address)(void);
  const void **v3;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = malloc_default_zone();
  if (v0)
  {
    claimed_address = (unsigned int (*)(void))v0->claimed_address;
    if (claimed_address)
    {
      if (claimed_address() == 1)
        return 0;
      else
        return 255;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v3 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(3, "%s:%i phOsalNfc_IsHeapMemory: malloc_default_zone returned NULL", "phOsalNfc_IsHeapMemory", 198);
    dispatch_get_specific(*v3);
    v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "phOsalNfc_IsHeapMemory";
      v8 = 1024;
      v9 = 198;
      _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i phOsalNfc_IsHeapMemory: malloc_default_zone returned NULL", buf, 0x12u);
    }
    return 12;
  }
}

uint64_t phOsalNfc_Delay(uint64_t a1, int a2)
{
  return usleep(1000 * a2);
}

uint64_t phOsalNfc_MemCompare(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  uint64_t result;
  int v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;

  result = 1;
  if (a2 && a3 && a4)
  {
    v5 = a4 - 1;
    do
    {
      v7 = *a3++;
      v6 = v7;
      v8 = *a2++;
      result = (v6 - v8);
      v9 = v5-- != 0;
    }
    while (v9 && !(_DWORD)result);
  }
  return result;
}

uint64_t phOsalNfc_RaiseExceptionWithDescription(int a1, unsigned int a2)
{
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint64_t result;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i EXCEPTION=%d REASON=%d", "phOsalNfc_RaiseExceptionWithDescription", 290, a1, a2);
  dispatch_get_specific(*v4);
  v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v9 = "phOsalNfc_RaiseExceptionWithDescription";
    v10 = 1024;
    v11 = 290;
    v12 = 1024;
    v13 = a1;
    v14 = 1024;
    v15 = a2;
    _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i EXCEPTION=%d REASON=%d", buf, 0x1Eu);
  }
  result = NFIsRestoreOS();
  if ((result & 1) == 0)
  {
    if (byte_253E47180)
      result = postAnalyticsMiddlewareExceptionEvent();
    if (a1 == 2 && a2 >= 0x1000)
    {
      result = NFProductIsDevBoard();
      if ((result & 1) == 0)
      {
        NFSimulateCrash();
        exit(1);
      }
    }
  }
  return result;
}

uint64_t phOsalNfc_RaiseException(uint64_t a1, int a2, unsigned int a3)
{
  return phOsalNfc_RaiseExceptionWithDescription(a2, a3);
}

uint64_t phOsalNfc_Init(int a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char *v10;
  char v11;
  const void **v12;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  const void **v18;
  void (*v19)(uint64_t, const char *, ...);
  NSObject *v20;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_253E471A0);
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = *((_QWORD *)&unk_253E471A0 + v4 + 1);
    if (v7 && *(_DWORD *)(v7 + 8) == a1)
    {
      v15 = 50;
      goto LABEL_20;
    }
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  v8 = 0;
  v9 = 1;
  while (1)
  {
    v10 = (char *)&unk_253E471A0 + 8 * v8;
    if (!*((_QWORD *)v10 + 1))
      break;
    v11 = v9;
    v9 = 0;
    v8 = 1;
    if ((v11 & 1) == 0)
    {
      v12 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i Failed to allocate OSAL context - no space available", "_phOsalNfc_CreateContext", 87);
      dispatch_get_specific(*v12);
      v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v23 = "_phOsalNfc_CreateContext";
        v24 = 1024;
        v25 = 87;
        _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate OSAL context - no space available", buf, 0x12u);
      }
      v15 = 255;
      goto LABEL_20;
    }
  }
  v16 = malloc_type_calloc(1uLL, 0x70uLL, 0xAC8762BEuLL);
  v16[5] = 0u;
  v16[6] = 0u;
  v16[3] = 0u;
  v16[4] = 0u;
  v16[1] = 0u;
  v16[2] = 0u;
  *v16 = 0u;
  *((_DWORD *)v16 + 2) = a1;
  *((_QWORD *)v10 + 1) = v16;
  v17 = *(_QWORD *)(a2 + 8);
  byte_253E47180 = *(_BYTE *)(v17 + 17);
  v15 = phOsalNfc_Timer_Init(a1, (NSObject **)v17);
  if ((_DWORD)v15)
  {
    v18 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19)
      v19(3, "%s:%i Failed to init timer: %d", "phOsalNfc_Init", 347, v15);
    dispatch_get_specific(*v18);
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "phOsalNfc_Init";
      v24 = 1024;
      v25 = 347;
      v26 = 1024;
      v27 = v15;
      _os_log_impl(&dword_21A811000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to init timer: %d", buf, 0x18u);
    }
    sub_21A81DDDC(a1);
  }
LABEL_20:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253E471A0);
  return v15;
}

void sub_21A81DDDC(int a1)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  const void **v5;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v1 = 0;
  v12 = *MEMORY[0x24BDAC8D0];
  v2 = 1;
  do
  {
    v3 = v2;
    v4 = *((_QWORD *)&unk_253E471A0 + v1 + 1);
    if (v4 && *(_DWORD *)(v4 + 8) == a1)
    {
      free(*((void **)&unk_253E471A0 + v1 + 1));
      *((_QWORD *)&unk_253E471A0 + v1 + 1) = 0;
      return;
    }
    v2 = 0;
    v1 = 1;
  }
  while ((v3 & 1) != 0);
  v5 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Failed to release OSAL context - not found", "_phOsalNfc_FreeContext", 114);
  dispatch_get_specific(*v5);
  v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "_phOsalNfc_FreeContext";
    v10 = 1024;
    v11 = 114;
    _os_log_impl(&dword_21A811000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to release OSAL context - not found", buf, 0x12u);
  }
}

uint64_t phOsalNfc_OpenLogFile()
{
  return 0;
}

uint64_t phOsalNfc_CloseLogFile()
{
  return 0;
}

void phOsalNfc_DeInit(int a1)
{
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_253E471A0);
  v2 = 0;
  v3 = 1;
  while (1)
  {
    v4 = v3;
    v5 = *((_QWORD *)&unk_253E471A0 + v2 + 1);
    if (v5)
    {
      if (*(_DWORD *)(v5 + 8) == a1)
        break;
    }
    v3 = 0;
    v2 = 1;
    if ((v4 & 1) == 0)
      goto LABEL_7;
  }
  phOsalNfc_Timer_Deinit(a1);
  sub_21A81DDDC(a1);
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253E471A0);
}

uint64_t phOsalNfc_LoadLibrary(int a1, char *__filename, _QWORD *a3, unsigned int *a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  const void **v10;
  void (*v11)(uint64_t, const char *, ...);
  NSObject *v12;
  FILE *v14;
  FILE *v15;
  unsigned int v16;
  void *v17;
  const void **v18;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v20;
  const char *v21;
  const void **v22;
  void (*v23)(uint64_t, const char *, ...);
  const void **v24;
  void (*v25)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v6 = 0;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = *((_QWORD *)&unk_253E471A0 + v6 + 1);
    if (v9 && *(_DWORD *)(v9 + 8) == a1)
    {
      v14 = fopen(__filename, "rb");
      if (!v14)
      {
        v18 = (const void **)MEMORY[0x24BEDCDB0];
        dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
          Logger(3, "%s:%i FAILED to load FW binary image file\n", "phOsalNfc_LoadLibrary", 423);
        dispatch_get_specific(*v18);
        v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          return 255;
        *(_DWORD *)buf = 136446466;
        v27 = "phOsalNfc_LoadLibrary";
        v28 = 1024;
        v29 = 423;
        v21 = "%{public}s:%i FAILED to load FW binary image file\n";
        goto LABEL_28;
      }
      v15 = v14;
      fseek(v14, 0, 2);
      v16 = MEMORY[0x22074A168](v15);
      fseek(v15, 0, 0);
      if (v16)
      {
        v17 = malloc_type_calloc(1uLL, v16, 0xAC8762BEuLL);
        *(_QWORD *)(v9 + 16) = v17;
        if (v17)
        {
          if (fread(v17, 1uLL, v16, v15) == v16)
          {
            *a3 = *(_QWORD *)(v9 + 16);
            *a4 = v16;
            fclose(v15);
            return 0;
          }
          v24 = (const void **)MEMORY[0x24BEDCDB0];
          dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
          v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v25)
            v25(3, "%s:%i error : FAILED Unable to read the specified size from file !!!\n", "phOsalNfc_LoadLibrary", 451);
          dispatch_get_specific(*v24);
          v20 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            return 255;
          *(_DWORD *)buf = 136446466;
          v27 = "phOsalNfc_LoadLibrary";
          v28 = 1024;
          v29 = 451;
          v21 = "%{public}s:%i error : FAILED Unable to read the specified size from file !!!\n";
          goto LABEL_28;
        }
      }
      else
      {
        *(_QWORD *)(v9 + 16) = 0;
      }
      v22 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v23)
        v23(3, "%s:%i FAILED to allocate Memory to load FW image !!!\n", "phOsalNfc_LoadLibrary", 443);
      dispatch_get_specific(*v22);
      v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        return 255;
      *(_DWORD *)buf = 136446466;
      v27 = "phOsalNfc_LoadLibrary";
      v28 = 1024;
      v29 = 443;
      v21 = "%{public}s:%i FAILED to allocate Memory to load FW image !!!\n";
LABEL_28:
      _os_log_impl(&dword_21A811000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
      return 255;
    }
    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  v10 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v11)
    v11(3, "%s:%i error : OSAL context not initialized\n", "phOsalNfc_LoadLibrary", 415);
  dispatch_get_specific(*v10);
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "phOsalNfc_LoadLibrary";
    v28 = 1024;
    v29 = 415;
    _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i error : OSAL context not initialized\n", buf, 0x12u);
  }
  return 49;
}

uint64_t phOsalNfc_FreeLibrary(int a1)
{
  uint64_t v1;
  char i;
  char v3;
  uint64_t v4;
  const void **v5;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v7;
  uint64_t result;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v1 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  for (i = 1; ; i = 0)
  {
    v3 = i;
    v4 = *((_QWORD *)&unk_253E471A0 + v1 + 1);
    if (v4)
    {
      if (*(_DWORD *)(v4 + 8) == a1)
        break;
    }
    v1 = 1;
    if ((v3 & 1) == 0)
    {
      v5 = (const void **)MEMORY[0x24BEDCDB0];
      dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
      Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
        Logger(3, "%s:%i error : OSAL context not initialized\n", "phOsalNfc_FreeLibrary", 477);
      dispatch_get_specific(*v5);
      v7 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v10 = "phOsalNfc_FreeLibrary";
        v11 = 1024;
        v12 = 477;
        _os_log_impl(&dword_21A811000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i error : OSAL context not initialized\n", buf, 0x12u);
      }
      return 49;
    }
  }
  result = *(_QWORD *)(v4 + 16);
  if (result)
  {
    free((void *)result);
    return 0;
  }
  return result;
}

uint64_t phOsalNfc_setHardwareType(uint64_t result)
{
  dword_253E471B8 = result;
  return result;
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
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
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
      _os_log_impl(&dword_21A811000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Unsupported type: %lu", buf, 0x1Cu);
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
  uint64_t v11;
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
    sub_21A81EB0C(a1, CFSTR("rf-clock-tlv"), a2);
    if (sub_21A81EB0C(a1, CFSTR("rf-config-tlvs"), v3) && *v3)
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
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
    }
    if (!sub_21A81EB0C(a1, CFSTR("rf-config-tlvs-10"), v4) || !*v4)
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
        _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
      }
    }
    v11 = sub_21A81EB0C(a1, CFSTR("rf-config-tlvs-12"), v5);
    if ((_DWORD)v11 && *v5)
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
        _os_log_impl(&dword_21A811000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
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
      _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Not connected", buf, 0x12u);
    }
    return 0;
  }
  return v11;
}

uint64_t sub_21A81EB0C(io_registry_entry_t *a1, const __CFString *a2, CFStringRef *a3)
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
      _os_log_impl(&dword_21A811000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
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
    _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
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
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
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
        _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service %s", buf, 0x1Cu);
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
    _os_log_impl(&dword_21A811000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Will %s spmi for %s", buf, 0x26u);
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
        _os_log_impl(&dword_21A811000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
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
    _os_log_impl(&dword_21A811000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i %s doesn't exist", buf, 0x1Cu);
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
    _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return sub_21A81FCCC(a1, 0, a2) == 0;
}

uint64_t sub_21A81FCCC(uint64_t *a1, uint32_t selector, unsigned int a3)
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
          _os_log_impl(&dword_21A811000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Failed with %#x", buf, 0x28u);
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
        _os_log_impl(&dword_21A811000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Not connected", buf, 0x22u);
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
      _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid parameter", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i VBAT enable=%d", buf, 0x18u);
  }
  return sub_21A81FCCC(a1, 5u, a2) == 0;
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
    _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return sub_21A81FCCC(a1, 1u, a2) == 0;
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
    _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return sub_21A81FCCC(a1, 2u, a2) == 0;
}

uint64_t NFHardwareGPIOWasItSPMINack(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)a1 + 8);
}

uint64_t NFHardwareGPIOSPMIFollowerReset(uint64_t *a1)
{
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*a1 + 16), 10, 0, 0);
  return sub_21A81FCCC(a1, 8u, 1u);
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
    _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
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
    _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
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
        _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not open service (%#x)", buf, 0x18u);
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
      _os_log_impl(&dword_21A811000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
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
          _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release connection", buf, 0x12u);
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
          _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
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
        _os_log_impl(&dword_21A811000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
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
      _os_log_impl(&dword_21A811000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i stockholm doesn't exist", buf, 0x12u);
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
        _os_log_impl(&dword_21A811000, v40, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
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
  io_object_t v0;
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
  v0 = sub_21A82180C("AppleStockholmControl", "nfc,primary,gpio");
  if (!v0)
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
      _os_log_impl(&dword_21A811000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service, trying slow path: %s", buf, 0x1Cu);
    }
    sub_21A821D18();
    result = sub_21A8222F8("nfc,primary,gpio");
    if (!(_DWORD)result)
      return result;
    v0 = result;
    v5 = sub_21A82180C("AppleStockholmControl", "nfc,primary,gpio");
    if (v5)
      goto LABEL_12;
    v6 = 100;
    do
    {
      usleep(0x186A0u);
      v5 = sub_21A82180C("AppleStockholmControl", "nfc,primary,gpio");
      if (v5)
        break;
    }
    while (v6-- > 1);
    if (v5)
LABEL_12:
      IOObjectRelease(v5);
  }
  IOObjectRelease(v0);
  v8 = sub_21A82180C("AppleStockholmSPMI", "nfc,primary,spmi");
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
      _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
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
    _os_log_impl(&dword_21A811000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
  }
  IOObjectRelease(0);
  return 1;
}

uint64_t sub_21A82180C(const char *a1, const char *a2)
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
    _os_log_impl(&dword_21A811000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
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
    _os_log_impl(&dword_21A811000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get valid iterator for service", buf, 0x12u);
    }
  }
  return v27;
}

void sub_21A821D18()
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
    _os_log_impl(&dword_21A811000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
  }
  sub_21A826248("stockholm");
  sub_21A826248("stockholm-spmi");
  sub_21A826248("AppleStockholmSPMI");
  sub_21A826248("AppleStockholmControl");
  sub_21A826248("AppleStockholmControlUserClient");
  sub_21A826248("hammerfest");
  sub_21A826248("AppleHammerfestSPMI");
  sub_21A826248("AppleHammerfestControl");
}

uint64_t sub_21A8222F8(const char *a1)
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
  if (MEMORY[0x220749E98](RootEntry, "IOService", 1, &object))
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
      _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create iterator", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    v6 = sub_21A826A6C(object, a1);
    IOObjectRelease(object);
  }
  return v6;
}

BOOL NFHardwareSerialIsHammerfestAlive()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  io_registry_entry_t v3;
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
    _os_log_impl(&dword_21A811000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  v3 = sub_21A82180C("AppleStockholmSPMI", "nfc,secondary,spmi");
  v4 = v3;
  if (v3)
  {
    properties = 0;
    v5 = IORegistryEntryCreateCFProperties(v3, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
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
        _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
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
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
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
  LODWORD(result) = sub_21A82180C("AppleStockholmControl", v1);
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
    _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service with: %s, retrying slow path", buf, 0x1Cu);
  }
  sub_21A821D18();
  result = sub_21A8222F8(v1);
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
      _os_log_impl(&dword_21A811000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Read aborted while in progress since %llu.", buf, 0x1Cu);
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
      _os_log_impl(&dword_21A811000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Write aborted while in progress.", buf, 0x12u);
    }
  }
  return 0;
}

ssize_t sub_21A822B0C(uint64_t a1)
{
  ssize_t result;
  uint64_t v3;
  uint64_t v4;
  ssize_t v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  int *v9;
  char *v10;
  int *v11;
  NSObject *v12;
  int *v13;
  char *v14;
  int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  result = write(**(_DWORD **)(a1 + 40), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 152), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 160));
  if (result < 0)
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
      v8(3, "%s:%i \"%s\" errno=%d ", "NFHardwareSerialWriteBlock_block_invoke", 742, v10, *v11);
    }
    dispatch_get_specific(*v6);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = __error();
      v14 = strerror(*v13);
      v15 = *__error();
      *(_DWORD *)buf = 136446978;
      v17 = "NFHardwareSerialWriteBlock_block_invoke";
      v18 = 1024;
      v19 = 742;
      v20 = 2080;
      v21 = v14;
      v22 = 1024;
      v23 = v15;
      _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v3 + 160) = 0;
    goto LABEL_9;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 152) += result;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 160);
  *(_DWORD *)(v3 + 168) += result;
  v5 = v4 - result;
  *(_QWORD *)(v3 + 160) = v5;
  if (!v5)
  {
LABEL_9:
    *(_QWORD *)(v3 + 152) = 0;
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 136));
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 144);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
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
    sub_21A8230EC(a1, 1);
    goto LABEL_5;
  }
  if (*(_DWORD *)(v2 + 120))
  {
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &unk_24DD2CD10);
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
            _os_log_impl(&dword_21A811000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
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
      sub_21A8230EC(a1, 0);
    }
    else if (!*(_QWORD *)(v2 + 112))
    {
      *(_QWORD *)(v2 + 112) = dispatch_source_create(MEMORY[0x24BDACA00], *a1, 0, *(dispatch_queue_t *)(v2 + 104));
      dispatch_set_qos_class_fallback();
      dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &unk_24DD2CD50);
      dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v2 + 112), &unk_24DD2CD90);
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
      _os_log_impl(&dword_21A811000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    return 0;
  }
  return v20;
}

BOOL sub_21A8230EC(int *a1, int a2)
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
        _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v32, v33, v31, buf, 0x12u);
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

void sub_21A82349C()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "NFHardwareSerialFlush_block_invoke", 828);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "NFHardwareSerialFlush_block_invoke";
    v5 = 1024;
    v6 = 828;
    _os_log_impl(&dword_21A811000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
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
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:TIOCFLUSH - attempt %d - ", buf, 0x28u);
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
      _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Serial device not opened!", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i baudRate=%lu", buf, 0x1Cu);
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
      _os_log_impl(&dword_21A811000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
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
      _os_log_impl(&dword_21A811000, v156, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", (uint8_t *)handler, 0x1Cu);
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
        _os_log_impl(&dword_21A811000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d socket", buf, 0x22u);
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
        _os_log_impl(&dword_21A811000, v75, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", buf, 0x12u);
      }
    }
    else if (!sub_21A8230EC(v6, 1))
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
      _os_log_impl(&dword_21A811000, v48, OS_LOG_TYPE_ERROR, v24, buf, v49);
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
      _os_log_impl(&dword_21A811000, v51, OS_LOG_TYPE_ERROR, v52, (uint8_t *)handler, 0x1Cu);
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
      _os_log_impl(&dword_21A811000, v59, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d open", (uint8_t *)handler, 0x22u);
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
    _os_log_impl(&dword_21A811000, v102, OS_LOG_TYPE_ERROR, v73, (uint8_t *)handler, v103);
    goto LABEL_67;
  }
  *(_QWORD *)(v25 + 8) |= 4uLL;
  *(_OWORD *)(v25 + 16) = xmmword_21A82A060;
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
      _os_log_impl(&dword_21A811000, v153, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", (uint8_t *)handler, 0x12u);
    }
    goto LABEL_15;
  }
  if (!sub_21A8230EC(v6, 1))
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
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v27 + 112), &unk_24DD2CDD0);
    dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v27 + 112), &unk_24DD2CE10);
    dispatch_activate(*(dispatch_object_t *)(v27 + 112));
    dispatch_suspend(*(dispatch_object_t *)(v27 + 112));
    *(_DWORD *)(v27 + 120) = 1;
    *(_QWORD *)(*((_QWORD *)v6 + 1) + 128) = 0;
    *(_QWORD *)(v27 + 152) = 0;
    *(_QWORD *)(v27 + 160) = 0;
    v29 = dispatch_source_create(MEMORY[0x24BDACA30], v28, 0, *(dispatch_queue_t *)(v27 + 104));
    *(_QWORD *)(v27 + 136) = v29;
    dispatch_source_set_event_handler(v29, &unk_24DD2CE50);
    v30 = *(NSObject **)(v27 + 136);
    *(_QWORD *)&handler[0] = MEMORY[0x24BDAC760];
    *((_QWORD *)&handler[0] + 1) = 0x40000000;
    *(_QWORD *)&handler[1] = sub_21A827160;
    *((_QWORD *)&handler[1] + 1) = &unk_24DD2CE70;
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
    _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
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
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 112), &unk_24DD2CEB0);
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
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 136), &unk_24DD2CEF0);
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
        _os_log_impl(&dword_21A811000, v13, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
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
        _os_log_impl(&dword_21A811000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
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
    _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Ignoring for SPMI", buf, 0x12u);
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
        _os_log_impl(&dword_21A811000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d IO_STOCKHOLM_CRC", buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", buf, 0x22u);
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
        _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0x22u);
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
    _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
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
      _os_log_impl(&dword_21A811000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", buf, 0x22u);
    }
  }
  return v26;
}

void sub_21A826248(const char *a1)
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
  char *v15;
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
      _os_log_impl(&dword_21A811000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s found", buf, 0x1Cu);
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
        _os_log_impl(&dword_21A811000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has no child", buf, 0x1Cu);
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
      if (!MEMORY[0x220749EBC]())
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
          _os_log_impl(&dword_21A811000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has child %s", v42, 0x26u);
        }
      }
      IOObjectRelease(child);
    }
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IONameMatch"), 0, 0);
    if (CFProperty)
    {
      v14 = CFProperty;
      v15 = sub_21A8269E8(CFProperty);
      dispatch_get_specific(*v5);
      v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
      {
        if (v15)
          v17 = v15;
        else
          v17 = "??";
        v16(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 162, a1, "IONameMatch", v17);
      }
      dispatch_get_specific(*v5);
      v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (v15)
          v19 = v15;
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
        _os_log_impl(&dword_21A811000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v15)
        free(v15);
      CFRelease(v14);
    }
    v20 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IONameMatched"), 0, 0);
    if (v20)
    {
      v21 = v20;
      v22 = sub_21A8269E8(v20);
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
        _os_log_impl(&dword_21A811000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v22)
        free(v22);
      CFRelease(v21);
    }
    v27 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOMatchCategory"), 0, 0);
    if (v27)
    {
      v28 = v27;
      v29 = sub_21A8269E8(v27);
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
        _os_log_impl(&dword_21A811000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v29)
        free(v29);
      CFRelease(v28);
    }
    v34 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOUserClientClass"), 0, 0);
    if (v34)
    {
      v35 = v34;
      v36 = sub_21A8269E8(v34);
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
        _os_log_impl(&dword_21A811000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
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
      _os_log_impl(&dword_21A811000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s NOT found", buf, 0x1Cu);
    }
  }
}

char *sub_21A8269E8(const __CFString *a1)
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

uint64_t sub_21A826A6C(io_iterator_t a1, const char *a2)
{
  const void **v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  const __CFString *CFProperty;
  const __CFString *v9;
  char *v10;
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
      v7 = MEMORY[0x220749EBC](v5, __s1) ? 0 : strdup(__s1);
      CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, CFSTR("IONameMatch"), 0, 0);
      if (CFProperty)
      {
        v9 = CFProperty;
        v10 = sub_21A8269E8(CFProperty);
        if (!v10)
          goto LABEL_12;
        v11 = v10;
        if (strcmp(v10, a2))
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
          _os_log_impl(&dword_21A811000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
        }
        free(v11);
        CFRelease(v9);
        v16 = (const __CFString *)IORegistryEntryCreateCFProperty(v6, CFSTR("IOClass"), 0, 0);
        if (v16)
          break;
      }
LABEL_13:
      if (MEMORY[0x220749EB0](v6, "IOService", &v28))
      {
        v12 = 0;
        v13 = 0;
      }
      else
      {
        IOObjectRelease(v6);
        v12 = sub_21A826A6C(v28, a2);
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
    v17 = sub_21A8269E8(v16);
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
          _os_log_impl(&dword_21A811000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
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
          _os_log_impl(&dword_21A811000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has matching {%s / %s}", (uint8_t *)__s1, 0x30u);
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
    _os_log_impl(&dword_21A811000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid iterator", (uint8_t *)__s1, 0x12u);
  }
  return v12;
}

void sub_21A826F8C()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "_NFHardwareSerialCreateSources_block_invoke", 1067);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "_NFHardwareSerialCreateSources_block_invoke";
    v5 = 1024;
    v6 = 1067;
    _os_log_impl(&dword_21A811000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
}

void sub_21A827078()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Error ! Unexpected invocation of write handler", "_NFHardwareSerialCreateSources_block_invoke_2", 1077);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "_NFHardwareSerialCreateSources_block_invoke_2";
    v5 = 1024;
    v6 = 1077;
    _os_log_impl(&dword_21A811000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of write handler", buf, 0x12u);
  }
}

uint64_t sub_21A827160(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_21A827168()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "_NFHardwareSerialDeleteSources_block_invoke", 1090);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "_NFHardwareSerialDeleteSources_block_invoke";
    v5 = 1024;
    v6 = 1090;
    _os_log_impl(&dword_21A811000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
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

  if ((!a1 || (v2 = (int *)qword_253E473E8) == 0) && ((a1 & 1) != 0 || (v2 = (int *)qword_253E473F0) == 0))
  {
    v2 = (int *)malloc_type_calloc(1uLL, 0x58uLL, 0x10300409288EE5CuLL);
    if (v2)
    {
      if (qword_253E473E0 != -1)
        dispatch_once(&qword_253E473E0, &unk_24DD2CF88);
      v3 = byte_253E473F8 == 0;
      if (byte_253E473F8)
        v4 = 4142;
      else
        v4 = 1024;
      if (byte_253E473F8)
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
      v11 = &qword_253E473F0;
      v2[20] = 0;
      if (a1)
        v11 = &qword_253E473E8;
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

  v1 = &qword_253E473F0;
  if (!a1)
    v1 = &qword_253E473E8;
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
          v12 = snprintf(v9, v10, "%s", *((const char **)&unk_24DD2CF10 + v11));
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
        _os_log_impl(&dword_21A811000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to allocate last msg buffer", buf, 0x12u);
      }
    }
LABEL_43:
    v30 = a1[2];
    if (qword_253E473E0 != -1)
      dispatch_once(&qword_253E473E0, &unk_24DD2CF88);
    v31 = (const void **)MEMORY[0x24BEDCDB0];
    if (!byte_253E473F8)
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
      _os_log_impl(&dword_21A811000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Printing last %ld messages", buf, 0x1Cu);
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
            v40 = (const char *)*((_QWORD *)&unk_24DD2CF10 + v38);
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
                  _os_log_impl(&dword_21A811000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to msg", v59, 0x12u);
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
    _os_log_impl(&dword_21A811000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
  }
}

void NFHardwareSerialDebugDump()
{
  if (qword_253E473E8)
    NFHardwareSerialDebugDump_wCB((int *)qword_253E473E8, 0);
  if (qword_253E473F0)
    NFHardwareSerialDebugDump_wCB((int *)qword_253E473F0, 0);
}

uint64_t NFHardwareSerialDebugMaxEntriesPrinted(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void sub_21A827AF0()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    byte_253E473F8 = CFBooleanGetValue(v0) != 0;
    CFRelease(v1);
  }
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
      _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
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
      _os_log_impl(&dword_21A811000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
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
        _os_log_impl(&dword_21A811000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Unknown interface %s", buf, 0x1Cu);
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
        _os_log_impl(&dword_21A811000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create context for interface %s", buf, 0x1Cu);
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
    _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
  }
  return 0;
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
    _os_log_impl(&dword_21A811000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - current FLOW CHECK", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging starting - OFF", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - ON", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - SLEEP + wait 1.5s", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v52, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - WAKE", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v55, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - POWERING OFF", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v66, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
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
      _os_log_impl(&dword_21A811000, v70, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
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
        _os_log_impl(&dword_21A811000, v78, OS_LOG_TYPE_ERROR, "%{public}s:%i HW debugging result : 0x%04X", buf, 0x18u);
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
      _os_log_impl(&dword_21A811000, v73, OS_LOG_TYPE_ERROR, v75, buf, 0x12u);
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
    _os_log_impl(&dword_21A811000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Unmatched interface %s", buf, 0x1Cu);
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
      _os_log_impl(&dword_21A811000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected state.", buf, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return v13;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
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

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC530](alloc, data, *(_QWORD *)&encoding);
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
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

uint64_t NFProductIsDevBoard()
{
  return MEMORY[0x24BEDCCF8]();
}

uint64_t NFSharedDumpTransport()
{
  return MEMORY[0x24BEDCD20]();
}

uint64_t NFSharedLogGetLogger()
{
  return MEMORY[0x24BEDCD28]();
}

uint64_t NFSharedMiddlewareSignpostLog()
{
  return MEMORY[0x24BEDCD38]();
}

uint64_t NFSharedSignpostLog()
{
  return MEMORY[0x24BEDCD40]();
}

uint64_t NFSimulateCrash()
{
  return MEMORY[0x24BEDCD48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
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

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
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

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x24BDAED20]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t postAnalyticsMiddlewareExceptionEvent()
{
  return MEMORY[0x24BEDCDD0]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x24BDB01E0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x24BDB01E8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

