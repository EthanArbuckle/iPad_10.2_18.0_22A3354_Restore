void *sub_1DF30D9AC(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x5119C9E7uLL);
}

void sub_1DF30D9BC(int a1, void *a2)
{
  free(a2);
}

uint64_t MISValidateSignatureAndCopyInfo(const __CFString *a1, const __CFDictionary *a2, _QWORD *a3)
{
  return MISValidateSignatureAndCopyInfoWithProgress(a1, a2, a3, 0);
}

uint64_t sub_1DF30DA88@<X0>(const char *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  ssize_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  int v23;

  v4 = sub_1DF331E84();
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DF332058();
  v8 = getxattr(a1, (const char *)(v7 + 32), 0, 0, 0, 0);
  v9 = swift_release();
  if (v8 < 0)
  {
    result = MEMORY[0x1E0BFDD3C](v9);
    if ((_DWORD)result == 93)
    {
      *a2 = xmmword_1DF335C90;
    }
    else
    {
      v16 = result;
      v17 = sub_1DF331FF8();
      if ((v17 & 0x100000000) != 0)
      {
        sub_1DF317CC8();
        swift_allocError();
        *v19 = v16;
      }
      else
      {
        LODWORD(v22) = v17;
        sub_1DF3178F4(MEMORY[0x1E0DEE9D8]);
        sub_1DF317D0C(&qword_1F0474900, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADE88]);
        sub_1DF331EE4();
        sub_1DF331E78();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
      }
      return swift_willThrow();
    }
  }
  else
  {
    *(_QWORD *)&v22 = sub_1DF317DA4(v8);
    *((_QWORD *)&v22 + 1) = v10;
    swift_bridgeObjectRetain();
    sub_1DF317E40((uint64_t)&v22);
    v12 = v11;
    result = swift_bridgeObjectRelease();
    if (v12 < 0)
    {
      v14 = MEMORY[0x1E0BFDD3C](result);
      v15 = sub_1DF331FF8();
      if ((v15 & 0x100000000) != 0)
      {
        sub_1DF317CC8();
        swift_allocError();
        *v18 = v14;
      }
      else
      {
        v23 = v15;
        sub_1DF3178F4(MEMORY[0x1E0DEE9D8]);
        sub_1DF317D0C(&qword_1F0474900, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADE88]);
        sub_1DF331EE4();
        sub_1DF331E78();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
      }
      swift_willThrow();
      return sub_1DF311830(v22, *((unint64_t *)&v22 + 1));
    }
    else
    {
      *a2 = v22;
    }
  }
  return result;
}

void sub_1DF30DE38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  char *v30;
  char *v31;
  uint64_t v32;

  v1 = sub_1DF30E1CC(&qword_1F0474828);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DF30E1CC(&qword_1F0474840);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _s18LaunchWarningEntryVMa();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_1DF311144() & 1) != 0)
  {
    v30 = v3;
    v31 = v10;
    sub_1DF332094();
    v11 = sub_1DF311104();
    v32 = v0;
    v12 = (void *)*v11;
    sub_1DF30E1CC(qword_1ED1BFDD0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1DF3358D0;
    v14 = v12;
    v15 = sub_1DF331F2C();
    v17 = v16;
    *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v13 + 64) = sub_1DF3110C0();
    *(_QWORD *)(v13 + 32) = v15;
    *(_QWORD *)(v13 + 40) = v17;
    sub_1DF331FEC();

    swift_bridgeObjectRelease();
    type metadata accessor for LaunchWarningMark();
    v18 = v32;
    v19 = sub_1DF3111C8();
    if (v18)
      return;
    v20 = v19;
    if (v19)
    {
      type metadata accessor for LaunchWarningDB();
      v13 = (uint64_t)sub_1DF314B90(1);
      sub_1DF3155CC(v20, (uint64_t)v6);
LABEL_10:
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        sub_1DF319214((uint64_t)v6);
        if (objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 0, 0, 0))
        {
LABEL_17:
          swift_release();

          return;
        }
        __break(1u);
      }
      v21 = (uint64_t)v31;
      sub_1DF319254((uint64_t)v6, (uint64_t)v31);
      v22 = *(int *)(v7 + 20);
      v23 = *(unsigned __int8 *)(v21 + *(int *)(v7 + 24));
      v24 = type metadata accessor for LaunchWarningDetails();
      v25 = (uint64_t)v30;
      sub_1DF313DF0(v21 + v22 + *(int *)(v24 + 36), (uint64_t)v30);
      v26 = sub_1DF331F44();
      v27 = *(_QWORD *)(v26 - 8);
      v28 = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) != 1)
      {
        v28 = (void *)sub_1DF331F08();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
      }
      v29 = objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 1, v23, v28);

      if (v29)
      {
        sub_1DF319298(v21);
        goto LABEL_17;
      }
LABEL_19:
      __break(1u);
      return;
    }
    if (!objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 0, 0, 0))
    {
      __break(1u);
      goto LABEL_10;
    }
  }
  else if (!objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 0, 0, 0))
  {
    __break(1u);
    goto LABEL_19;
  }
}

uint64_t sub_1DF30E1CC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1E0BFEC78]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _s18LaunchWarningEntryVMa()
{
  uint64_t result;

  result = qword_1F0474940;
  if (!qword_1F0474940)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DF30E248(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1DF332034();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1DF30E2C4(const __CFDictionary *a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6CF8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v1, v2, *MEMORY[0x1E0CD6D00], v3);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t sub_1DF30E314(const __SecCode *a1, int a2, int a3, int a4, int a5, void *a6)
{
  id v11;
  int v12;
  int v13;
  int v14;
  SecCSFlags v15;
  void *v16;
  uint64_t v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  uint64_t v20;
  CFErrorRef errors;

  v11 = a6;
  if (a3 == 1)
    v12 = 7;
  else
    v12 = 8193;
  if (a4)
    v13 = 0x20000000;
  else
    v13 = 0x10000;
  v14 = v13 | v12;
  if (a5 == 1)
    v15 = v14 | 0x400;
  else
    v15 = v14;
  errors = 0;
  v16 = (void *)MEMORY[0x1E0BFE7D4]();
  v17 = SecStaticCodeCheckValidityWithErrors(a1, v15, 0, &errors);
  objc_autoreleasePoolPop(v16);
  if (errors)
  {
    if (a2 == 1)
    {
      v18 = CFErrorCopyUserInfo(errors);
      if (v18)
      {
        v19 = v18;
        sub_1DF32BB9C(v18, (const void *)*MEMORY[0x1E0CD6C28], (uint64_t)"resource added");
        sub_1DF32BB9C(v19, (const void *)*MEMORY[0x1E0CD6C38], (uint64_t)"resource deleted");
        sub_1DF32BB9C(v19, (const void *)*MEMORY[0x1E0CD6C30], (uint64_t)"resource modified");
        CFRelease(v19);
      }
    }
    CFRelease(errors);
  }
  v20 = sub_1DF30E44C(v17);

  return v20;
}

uint64_t sub_1DF30E44C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v1 = a1;
  v6 = *MEMORY[0x1E0C80C00];
  if ((int)a1 > -67055)
  {
    switch((_DWORD)a1)
    {
      case 0xFFFEFA12:
        v2 = 22;
        break;
      case 0xFFFEFA4C:
        v2 = 18;
        break;
      case 0:
        return v1;
      default:
        goto LABEL_13;
    }
    return v2 | 0xE8008001;
  }
  if ((_DWORD)a1 == -67062)
    return 3892346908;
  if ((_DWORD)a1 == -67061)
    return 3892346905;
LABEL_13:
  if ((a1 - 100001) <= 0x69)
    return ((_DWORD)a1 - 100000) | 0xC000u;
  sub_1DF30EE34();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_error_impl(&dword_1DF30C000, v3, OS_LOG_TYPE_ERROR, "unrecognized status %d from codesigning library", (uint8_t *)v5, 8u);
  }
  v1 = 3892346881;

  return v1;
}

uint64_t sub_1DF30E5B4(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  void *Value;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  Value = (void *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6D08]);
  if (!Value)
    return 0;
  v6 = Value;
  v7 = 3892346902;
  if (a2 && a3)
  {
    v8 = Value;
    if ((unint64_t)objc_msgSend_length(v8, v9, v10, v11) > 7)
    {
      v13 = (void *)MEMORY[0x1E0C99D50];
      v14 = objc_retainAutorelease(v8);
      v18 = objc_msgSend_bytes(v14, v15, v16, v17) + 8;
      v22 = objc_msgSend_length(v14, v19, v20, v21);
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v13, v23, v18, v22 - 8, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CEManagedContextFromCFData();
      v26 = (_QWORD *)MEMORY[0x1E0DDFFA0];
      if (v25 == *MEMORY[0x1E0DDFFA0])
      {
        if (CEQueryContextToCFDictionary() == *v26)
          v7 = 0;
        else
          CEReleaseManagedContext();
      }

    }
    else
    {
      sub_1DF30EE34();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v28) = 0;
        _os_log_error_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_ERROR, "Blob data too small", (uint8_t *)&v28, 2u);
      }

    }
  }
  else
  {
    sub_1DF30EE34();
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = 3892346881;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v28 = 138412802;
      v29 = v6;
      v30 = 2048;
      v31 = a2;
      v32 = 2048;
      v33 = a3;
      _os_log_error_impl(&dword_1DF30C000, v8, OS_LOG_TYPE_ERROR, "MISCreateEntitlementsFromBlobData called with invalid arguments: %@, %p, %p", (uint8_t *)&v28, 0x20u);
    }
  }

  return v7;
}

uint64_t MISQueryBlacklistForCdHash(const __CFData *a1, int a2, int a3, _DWORD *a4)
{
  const __CFString *v7;
  CFIndex Length;
  CFIndex v9;
  char *v10;
  int v11;
  int v12;
  int64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  _DWORD *v25;
  unint64_t v26;
  NSObject *v27;
  int v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  const void *v39;
  uint64_t v40;
  CFRange v41;
  _BYTE *v42;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  NSObject *v47;
  int v48;
  int v49;
  _DWORD *v50;
  NSObject *v51;
  _DWORD *v52;
  int v53;
  uint8_t buf[24];
  int v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (qword_1ED1C0290 != -1)
  {
    v50 = a4;
    dispatch_once(&qword_1ED1C0290, &unk_1EA98AC60);
    a4 = v50;
  }
  v7 = (const __CFString *)qword_1ED1C0288;
  if (!qword_1ED1C0288)
  {
    sub_1DF30EE34();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v16, OS_LOG_TYPE_ERROR, "Could not get denylist path (this should not happen).", buf, 2u);
    }

    return 0;
  }
  v53 = a3;
  v52 = a4;
  Length = CFStringGetLength((CFStringRef)qword_1ED1C0288);
  v9 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v10 = (char *)CFAllocatorAllocate(0, v9, 0);
  if (!v10)
  {
    v18 = sub_1DF30EE34();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v19 = "Could not allocate buffer for denylist path (this should not happen.";
LABEL_19:
    v20 = v18;
    v21 = 2;
    goto LABEL_20;
  }
  if (!CFStringGetCString(v7, v10, v9, 0x8000100u))
  {
    v18 = sub_1DF30EE34();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    *(_WORD *)buf = 0;
    v19 = "Denylist path conversion failed (this should not happen.)";
    goto LABEL_19;
  }
  v11 = open(v10, 0);
  if (v11 < 0)
  {
    v22 = *__error();
    v23 = sub_1DF30EE34();
    v24 = v23;
    if (v22 == 2)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DF30C000, v24, OS_LOG_TYPE_DEBUG, "Denylist does not exist.", buf, 2u);
      }
LABEL_38:
      v35 = sub_1DF30EE34();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DF30C000, v35, OS_LOG_TYPE_DEBUG, "Using empty denylist.", buf, 2u);
      }
      v36 = mmap(0, 0x18uLL, 3, 4098, -1, 0);
      if (v36 == (_QWORD *)-1)
      {
        v51 = sub_1DF30EE34();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DF30C000, v51, OS_LOG_TYPE_ERROR, "Failed to mmap fallback denylist header. Giving up.", buf, 2u);
        }
        abort();
      }
      v15 = (uint64_t)v36;
      v36[2] = 0;
      *(_OWORD *)v36 = xmmword_1DF337298;
      v13 = 24;
      mprotect(v36, 0x18uLL, 1);
      v37 = 0;
      v38 = 0;
      v17 = 0;
      v39 = 0;
      v12 = -1;
      if (!v10)
        goto LABEL_43;
      goto LABEL_42;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v32 = *__error();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v32;
    v19 = "Could not open denylist, error %{errno}d";
    v20 = v24;
    v21 = 8;
LABEL_20:
    _os_log_error_impl(&dword_1DF30C000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_38;
  }
  v12 = v11;
  v13 = lseek(v11, 0, 2);
  if (v13 <= 23)
  {
    v14 = sub_1DF30EE34();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 24;
      _os_log_error_impl(&dword_1DF30C000, v14, OS_LOG_TYPE_ERROR, "Denylist is too short (%lld bytes) for header (%lu bytes)", buf, 0x16u);
    }
    if (v13 < 1)
      goto LABEL_37;
    v15 = 0;
LABEL_35:
    if ((unint64_t)(v15 + 1) >= 2)
      munmap((void *)v15, v13);
LABEL_37:
    close(v12);
    goto LABEL_38;
  }
  v25 = mmap(0, v13, 1, 2, v12, 0);
  if (v25 == (_DWORD *)-1)
  {
    v33 = sub_1DF30EE34();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v48 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v48;
      _os_log_error_impl(&dword_1DF30C000, v33, OS_LOG_TYPE_ERROR, "Could not map denylist, error %{errno}d", buf, 8u);
    }
    v15 = -1;
    goto LABEL_35;
  }
  v15 = (uint64_t)v25;
  if (*v25 != 1134124660)
  {
    v34 = sub_1DF30EE34();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v49 = *(_DWORD *)v15;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v49;
    v29 = "Wrong denylist magic (0x08%x)";
    v30 = v34;
    v31 = 8;
    goto LABEL_64;
  }
  v26 = v25[2];
  if (v13 < v26)
  {
    v27 = sub_1DF30EE34();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v28 = *(_DWORD *)(v15 + 8);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v28;
    *(_WORD *)&buf[8] = 2048;
    *(_QWORD *)&buf[10] = v13;
    v29 = "Denylist entries offset %u is past denylist size %lld";
    v30 = v27;
    v31 = 18;
LABEL_64:
    _os_log_error_impl(&dword_1DF30C000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_35;
  }
  v38 = (char *)v25 + v26;
  v44 = v25[3];
  v37 = (uint64_t)&v38[32 * v44];
  v45 = v37 + 4 * v44;
  v46 = v45 - ((_QWORD)v25 + v13);
  if (v45 > (unint64_t)v25 + v13)
  {
    v47 = sub_1DF30EE34();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v46;
    v29 = "Denylist is %td bytes short for entry count";
    v30 = v47;
    v31 = 12;
    goto LABEL_64;
  }
LABEL_42:
  CFAllocatorDeallocate(0, v10);
  v17 = v37;
  v39 = v38;
LABEL_43:
  memset(buf, 0, sizeof(buf));
  v55 = 0;
  v56 = a2;
  v40 = CFDataGetLength(a1);
  if (v40 >= 28)
    v41.length = 28;
  else
    v41.length = v40;
  v41.location = 0;
  CFDataGetBytes(a1, v41, buf);
  v42 = bsearch_b(buf, v39, *(unsigned int *)(v15 + 12), 0x20uLL, &unk_1EA989200);
  if (v42)
  {
    if (v17)
    {
      if (v53)
        MISBlacklistOverriddenByUser();
      if (v52)
        *v52 = *(_DWORD *)(v17 + 4 * ((v42 - (_BYTE *)v39) >> 5));
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }
  if ((unint64_t)(v15 + 1) >= 2)
  {
    munmap((void *)v15, v13);
    if (v12 < 0)
      return v17;
    goto LABEL_56;
  }
  if ((v12 & 0x80000000) == 0)
LABEL_56:
    close(v12);
  return v17;
}

id sub_1DF30EE34()
{
  if (qword_1ED1C0438 != -1)
    dispatch_once(&qword_1ED1C0438, &unk_1EA98ACA0);
  if (qword_1ED1C0430)
    return (id)qword_1ED1C0430;
  else
    return MEMORY[0x1E0C81028];
}

const __CFDictionary *sub_1DF30EE84(const __CFDictionary *a1, const void *a2, Boolean *a3)
{
  CFTypeID TypeID;
  const __CFDictionary *v7;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  TypeID = CFBooleanGetTypeID();
  v7 = sub_1DF30EEF0(a1, a2, TypeID, &BOOLean);
  if (!(_DWORD)v7 && BOOLean)
    *a3 = CFBooleanGetValue(BOOLean);
  return v7;
}

const __CFDictionary *sub_1DF30EEF0(const __CFDictionary *result, const void *a2, uint64_t a3, const __CFDictionary **a4)
{
  const __CFDictionary *v6;

  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v6 = result;
      if (CFGetTypeID(result) == a3)
      {
        result = 0;
        *a4 = v6;
      }
      else
      {
        return (const __CFDictionary *)49174;
      }
    }
  }
  return result;
}

BOOL sub_1DF30EF44(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __CFString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  char isEqualToString;
  const __CFURL *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  __CFBundle *Unique;
  NSObject *v31;
  const __CFURL *v32;
  const __CFURL *v33;
  const __CFURL *v34;
  NSObject *v35;
  CFStringRef v36;
  NSObject *v37;
  CFStringRef v38;
  CFComparisonResult v39;
  _BOOL8 v40;
  NSObject *v41;
  char v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  CFStringRef v49;
  __int16 v50;
  const __CFURL *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], a2, a1, a4);
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend_pathComponents(v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v44, (uint64_t)buf, 16);
  if (!v10)
    goto LABEL_9;
  v14 = v10;
  v15 = 0;
  v16 = *(_QWORD *)v45;
  while (2)
  {
    v17 = 0;
    v18 = v15 + 1;
    v15 += v14;
    do
    {
      if (*(_QWORD *)v45 != v16)
        objc_enumerationMutation(v8);
      objc_msgSend_pathExtension(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v17), v11, v12, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)CFSTR("app"), v21);

      if ((isEqualToString & 1) != 0)
      {
        v24 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend_pathComponents(v4, v11, v12, v13);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_subarrayWithRange_(v25, v26, 0, v18 + v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURLWithPathComponents_(v24, v28, (uint64_t)v27, v29);
        v23 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_24;
        if (sub_1DF30F334((const __CFURL *)v4, v23))
        {
          Unique = (__CFBundle *)_CFBundleCreateUnique();
          if (Unique)
          {
            sub_1DF30EE34();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v49 = v4;
              v50 = 2112;
              v51 = v23;
              _os_log_impl(&dword_1DF30C000, v31, OS_LOG_TYPE_INFO, "Got bundle for %@ -> %@", buf, 0x16u);
            }

            v32 = CFBundleCopyExecutableURL(Unique);
            v33 = v32;
            if (v32)
            {
              v34 = CFURLCopyAbsoluteURL(v32);
              sub_1DF30EE34();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                v36 = CFURLGetString((CFURLRef)v4);
                *(_DWORD *)buf = 138412290;
                v49 = v36;
                _os_log_impl(&dword_1DF30C000, v35, OS_LOG_TYPE_INFO, "Ours: %@", buf, 0xCu);
              }

              sub_1DF30EE34();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                v38 = CFURLGetString(v34);
                *(_DWORD *)buf = 138412290;
                v49 = v38;
                _os_log_impl(&dword_1DF30C000, v37, OS_LOG_TYPE_INFO, "Bundle: %@", buf, 0xCu);
              }

              v39 = sub_1DF30F334((const __CFURL *)v4, v34);
              v40 = v39 == kCFCompareEqualTo;
              sub_1DF30EE34();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v49) = v39 == kCFCompareEqualTo;
                _os_log_impl(&dword_1DF30C000, v41, OS_LOG_TYPE_INFO, "Is main executable: %i", buf, 8u);
              }

              v42 = 0;
              if (v4)
                goto LABEL_30;
              goto LABEL_31;
            }
            v42 = 0;
          }
          else
          {
            v42 = 0;
            v33 = 0;
          }
        }
        else
        {
          v42 = 0;
          v33 = 0;
          Unique = 0;
        }
        v34 = 0;
        goto LABEL_29;
      }
      ++v17;
    }
    while (v14 != v17);
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v44, (uint64_t)buf, 16);
    if (v14)
      continue;
    break;
  }
LABEL_9:

  v23 = 0;
LABEL_24:
  v33 = 0;
  Unique = 0;
  v34 = 0;
  v42 = 1;
LABEL_29:
  v40 = 1;
  if (v4)
LABEL_30:
    CFRelease(v4);
LABEL_31:
  if (v33)
    CFRelease(v33);
  if (v34)
    CFRelease(v34);
  if ((v42 & 1) == 0)
    CFRelease(v23);
  if (Unique)
    CFRelease(Unique);
  return v40;
}

CFComparisonResult sub_1DF30F334(const __CFURL *a1, const __CFURL *a2)
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFURLGetString(a1);
  v4 = CFURLGetString(a2);
  return CFStringCompare(v3, v4, 0);
}

uint64_t MISValidateSignatureAndCopyInfoWithProgress(const __CFString *a1, const __CFDictionary *a2, _QWORD *a3, void *a4)
{
  unsigned int v7;
  id v8;
  const void *v9;
  const void *v10;
  void *v11;
  const __CFNumber *v12;
  const __CFData *v13;
  const void *v14;
  CFDataRef v15;
  const __CFArray *v16;
  const __CFDictionary *v17;
  const void *v18;
  const __CFDictionary *v19;
  uint64_t v20;
  int v22;
  NSObject *v23;
  unsigned int v24;
  const UInt8 *Value;
  const UInt8 *BytePtr;
  CFTypeID v27;
  CFTypeID TypeID;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  BOOL v33;
  int v34;
  CFTypeID v35;
  BOOL v36;
  int v37;
  int v38;
  NSObject *v39;
  __CFString *v40;
  const char *v41;
  uint64_t v42;
  char isEqualToString;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  char v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  const UInt8 *v79;
  NSObject *v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  unsigned int v89;
  const __CFArray *v90;
  unsigned int v91;
  __SecCertificate *ValueAtIndex;
  __SecCertificate *v93;
  __SecKey *v94;
  const __CFData *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const __CFData *v99;
  const __CFData *v100;
  CFIndex Length;
  const UInt8 *v102;
  const UInt8 *v103;
  size_t v104;
  NSObject *v105;
  const char *v106;
  BOOL v107;
  char v108;
  const char *v109;
  uint64_t v110;
  const UInt8 *v111;
  size_t v112;
  unsigned int v113;
  BOOL v114;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  const char *v122;
  const char *v123;
  const char *v124;
  const char *v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  const char *v133;
  int log;
  NSObject *loga;
  uint64_t v137;
  int v138;
  uint64_t v139;
  id v140;
  const __CFDictionary *v141;
  int v142;
  int v143;
  const UInt8 *__s2;
  int v145;
  void *v146;
  _QWORD *v147;
  void *context;
  id v149;
  const __SecCode *v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  Boolean v154;
  __int16 v155;
  __int16 v156;
  uint64_t valuePtr;
  Boolean v158;
  __int16 v159;
  __int16 v160;
  __int16 v161;
  uint64_t v162;
  CFTypeRef v163;
  CFTypeRef cf;
  const __CFDictionary *v165;
  uint64_t v166;
  CFTypeRef v167;
  unsigned int v168;
  uint8_t v169[4];
  _BYTE buf[32];
  const void *v171;
  __int128 v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v149 = a4;
  context = (void *)MEMORY[0x1E0BFE7D4]();
  v168 = 0;
  v166 = 0;
  v167 = 0;
  cf = 0;
  v165 = 0;
  v162 = 0;
  v163 = 0;
  v150 = (const __SecCode *)sub_1DF3108C4(a1, (uint64_t)a2, (int *)&v168);
  if (!v150)
    goto LABEL_4;
  v147 = a3;
  v161 = 0;
  v160 = 0;
  v159 = 0;
  v158 = 0;
  valuePtr = 0;
  v156 = 0;
  v155 = 0;
  v154 = 0;
  v7 = sub_1DF30EE84(a2, CFSTR("UnauthoritativeLaunch"), (Boolean *)&v161);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v168 = v7;
  if (v7)
    goto LABEL_5;
  v168 = sub_1DF30EE84(a2, CFSTR("AuthoritativeLaunch"), (Boolean *)&v161 + 1);
  if (v168)
    goto LABEL_4;
  v22 = v161;
  if ((_BYTE)v161 && HIBYTE(v161))
  {
    sub_1DF30EE34();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v23, OS_LOG_TYPE_ERROR, "Caller specified both unauthoritative and authoritative launch modes.", buf, 2u);
    }

    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v24 = -402620376;
    goto LABEL_76;
  }
  if (v161)
  {
    HIBYTE(v160) = 1;
    v159 = 0;
    v158 = 0;
    v156 = 257;
    HIBYTE(v155) = 0;
  }
  if (a2)
  {
    Value = (const UInt8 *)CFDictionaryGetValue(a2, CFSTR("ExpectedHash"));
    BytePtr = Value;
    if (Value)
    {
      v27 = CFGetTypeID(Value);
      if (v27 != CFDataGetTypeID() || CFDataGetLength((CFDataRef)BytePtr) != 20)
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v24 = 49174;
LABEL_76:
        v168 = v24;
        goto LABEL_5;
      }
      BytePtr = CFDataGetBytePtr((CFDataRef)BytePtr);
    }
  }
  else
  {
    BytePtr = 0;
  }
  v168 = 0;
  v168 = sub_1DF30EE84(a2, CFSTR("LogResourceErrors"), (Boolean *)&v160);
  if (v168)
    goto LABEL_4;
  v168 = sub_1DF30EE84(a2, CFSTR("AllowAdHocSigning"), (Boolean *)&v159 + 1);
  if (v168)
    goto LABEL_4;
  v168 = sub_1DF30EE84(a2, CFSTR("ValidateSignatureOnly"), (Boolean *)&v160 + 1);
  if (v168)
    goto LABEL_4;
  v168 = sub_1DF30EE84(a2, CFSTR("UseSoftwareSigningCert"), (Boolean *)&v159);
  if (v168)
    goto LABEL_4;
  v168 = sub_1DF30EE84(a2, CFSTR("OnlineAuthorization"), &v158);
  if (v168)
    goto LABEL_4;
  v168 = sub_1DF30EE84(a2, CFSTR("SkipProfileIdentifierPolicy"), (Boolean *)&v155);
  if (v168)
    goto LABEL_4;
  v145 = v22;
  __s2 = BytePtr;
  v168 = sub_1DF30EE84(a2, CFSTR("AllowLaunchWarnings"), &v154);
  if (v168)
    goto LABEL_4;
  TypeID = CFStringGetTypeID();
  v168 = sub_1DF30EEF0(a2, CFSTR("MainExecutablePath"), TypeID, &v165);
  if (v168)
    goto LABEL_4;
  v32 = sub_1DF30EF44((uint64_t)a1, v29, v30, v31);
  v33 = v32;
  v34 = !v32;
  if ((_BYTE)v155)
    v34 = 1;
  v143 = v34;
  LOBYTE(v155) = v34;
  *(_QWORD *)buf = 0;
  v35 = CFNumberGetTypeID();
  v168 = sub_1DF30EEF0(a2, CFSTR("OnlineCheckType"), v35, (const __CFDictionary **)buf);
  if (v168)
    goto LABEL_4;
  if (*(_QWORD *)buf && !CFNumberGetValue(*(CFNumberRef *)buf, kCFNumberCFIndexType, &valuePtr))
  {
    sub_1DF30EE34();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v169 = 0;
      _os_log_error_impl(&dword_1DF30C000, v46, OS_LOG_TYPE_ERROR, "Failure to convert onlineCheckType. (This should not happen.)", v169, 2u);
    }

    v168 = -402620415;
    goto LABEL_4;
  }
  v168 = sub_1DF30EE84(a2, CFSTR("RespectUppTrustAndAuthorization"), (Boolean *)&v156 + 1);
  if (v168)
    goto LABEL_4;
  v142 = HIBYTE(v156);
  if (HIBYTE(v156))
    LOBYTE(v156) = 1;
  v168 = sub_1DF30EE84(a2, CFSTR("HonorBlocklist"), (Boolean *)&v156);
  if (v168 || (v168 = sub_1DF30EE84(a2, CFSTR("TrustCacheOnly"), (Boolean *)&v155 + 1)) != 0)
  {
LABEL_4:
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_5;
  }
  if (v22)
    v36 = HIBYTE(v160) == 0;
  else
    v36 = 1;
  if (v36)
    v37 = 0;
  else
    v37 = v143;
  v38 = v159;
  v168 = sub_1DF30E314(v150, v160, HIBYTE(v160), v37, v159, v149);
  if (!v33)
  {
    sub_1DF30EE34();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DF30C000, v39, OS_LOG_TYPE_INFO, "DER policy skipped as we're not validating a main executable", buf, 2u);
    }
    goto LABEL_82;
  }
  if (sub_1DF310B24())
    goto LABEL_83;
  sub_1DF3318FC();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = CFSTR("Internal");
  isEqualToString = objc_msgSend_isEqualToString_(v39, v41, (uint64_t)CFSTR("Internal"), v42);

  sub_1DF30EE34();
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
  if ((isEqualToString & 1) == 0)
  {
    if (v45)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v44, OS_LOG_TYPE_ERROR, "validation failed because of missing DER entitlements", buf, 2u);
    }

    v168 = -402620375;
    goto LABEL_4;
  }
  if (v45)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DF30C000, v44, OS_LOG_TYPE_ERROR, "validation would have failed due to missing DER entitlements", buf, 2u);
  }

LABEL_82:
LABEL_83:
  if (v168 == -402620397)
  {
    v137 = 0;
    log = 1;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    if (v168)
      goto LABEL_5;
    log = 0;
    v47 = 4;
    if (!v38)
      v47 = 2;
    v137 = v47;
  }
  sub_1DF310FF0(v150);
  v141 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v141)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v24 = -402620407;
    goto LABEL_76;
  }
  if (v154 && _os_feature_enabled_impl())
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v48, (uint64_t)a1, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_opt_new();
    v153 = 0;
    objc_msgSend_checkForLaunchWarning_error_(v51, v52, (uint64_t)v50, (uint64_t)&v153);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v153;
    if (v53)
    {
      if (objc_msgSend_length(v53, v54, v55, v56))
      {
        sub_1DF30EE34();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = a1;
          _os_log_impl(&dword_1DF30C000, v58, OS_LOG_TYPE_DEFAULT, "New bundle has outstanding launch warning: %@", buf, 0xCu);
        }

        v140 = v53;
        goto LABEL_106;
      }
    }
    else
    {
      sub_1DF30EE34();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v57;
        _os_log_error_impl(&dword_1DF30C000, v59, OS_LOG_TYPE_ERROR, "Error checking for launch warning: %@, %@", buf, 0x16u);
      }

    }
    v140 = 0;
LABEL_106:

    goto LABEL_107;
  }
  v140 = 0;
LABEL_107:
  v60 = v156;
  if (!(_BYTE)v156)
    goto LABEL_127;
  v13 = (const __CFData *)sub_1DF311048(v141);
  if (_os_feature_enabled_impl())
  {
    v63 = (void *)objc_opt_new();
    if (v165)
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v61, (uint64_t)v165, v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = 0;
      v65 = (id *)&v152;
      objc_msgSend_queryExecutableURL_error_(v63, v66, (uint64_t)v64, (uint64_t)&v152);
      v67 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v61, (uint64_t)a1, v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = 0;
      v65 = (id *)&v151;
      objc_msgSend_queryAppBundle_error_(v63, v68, (uint64_t)v64, (uint64_t)&v151);
      v67 = objc_claimAutoreleasedReturnValue();
    }
    v69 = (void *)v67;
    v70 = *v65;

    if (v69)
    {
      if (objc_msgSend_warningState(v69, v71, v72, v73) && (objc_msgSend_isUserOverridden(v69, v74, v75, v76) & 1) == 0)
      {
        sub_1DF30EE34();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = a1;
          _os_log_impl(&dword_1DF30C000, v77, OS_LOG_TYPE_DEFAULT, "Blocking bundle with outstanding launch warning: %@", buf, 0xCu);
        }

        v168 = -402620387;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        goto LABEL_163;
      }
    }
    else
    {
      sub_1DF30EE34();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v70;
        _os_log_error_impl(&dword_1DF30C000, v78, OS_LOG_TYPE_ERROR, "Error checking for launch warning mark: %@, %@", buf, 0x16u);
      }

    }
  }
  if (MISQueryBlacklistForCdHash(v13, 26, 1, 0))
  {
    v79 = CFDataGetBytePtr(v13);
    sub_1DF30EE34();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      v81 = *v79;
      v82 = v79[1];
      v83 = v79[2];
      v84 = v79[3];
      v85 = v79[4];
      v86 = v79[5];
      v87 = v79[6];
      v88 = v79[7];
      *(_DWORD *)buf = 67110912;
      *(_DWORD *)&buf[4] = v81;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v82;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v83;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v84;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v85;
      LOWORD(v171) = 1024;
      *(_DWORD *)((char *)&v171 + 2) = v86;
      HIWORD(v171) = 1024;
      LODWORD(v172) = v87;
      WORD2(v172) = 1024;
      *(_DWORD *)((char *)&v172 + 6) = v88;
      _os_log_impl(&dword_1DF30C000, v80, OS_LOG_TYPE_DEFAULT, "The bundle with cdhash %02x%02x%02x%02x%02x%02x%02x%02x... is deny-listed.", buf, 0x32u);
    }

    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v89 = -402620387;
    goto LABEL_162;
  }
  if (!v13)
LABEL_127:
    v13 = (const __CFData *)sub_1DF311048(v141);
  v90 = sub_1DF310F04(v141, (int *)&v168);
  v16 = v90;
  v91 = v168;
  if (v168 == -402620396)
  {
    if (HIBYTE(v159))
    {
      v15 = 0;
      v168 = 0;
      v137 = 1;
      goto LABEL_152;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_163;
  }
  if (v90)
  {
    if (CFArrayGetCount(v90))
    {
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v16, 0);
      if (ValueAtIndex)
      {
        v93 = ValueAtIndex;
        v15 = SecCertificateCopyData(ValueAtIndex);
        buf[0] = 0;
        if (!SecCertificateIsSelfSigned() && buf[0])
        {
          v94 = SecCertificateCopyKey(v93);
          v95 = SecKeyCopyExternalRepresentation(v94, 0);
          v99 = (const __CFData *)sub_1DF331664((uint64_t)v95, v96, v97, v98);
          v100 = v99;
          if (v99)
          {
            if (v95)
            {
              Length = CFDataGetLength(v99);
              if (Length == CFDataGetLength(v95))
              {
                v102 = CFDataGetBytePtr(v100);
                v103 = CFDataGetBytePtr(v95);
                v104 = CFDataGetLength(v100);
                if (!memcmp(v102, v103, v104))
                {
                  log = 0;
                  v168 = 0;
                  v137 = 6;
                }
              }
            }
          }
          if (v94)
            CFRelease(v94);
          if (v95)
            CFRelease(v95);
          if (v100)
            CFRelease(v100);
        }
        v91 = v168;
        goto LABEL_150;
      }
      sub_1DF30EE34();
      v105 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
LABEL_161:

        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v14 = 0;
        v15 = 0;
        v89 = -402620415;
        goto LABEL_162;
      }
      *(_WORD *)buf = 0;
      v106 = "First certificate is NULL (this should not happen).";
    }
    else
    {
      sub_1DF30EE34();
      v105 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        goto LABEL_161;
      *(_WORD *)buf = 0;
      v106 = "Signers array is empty (this should not happen).";
    }
    _os_log_error_impl(&dword_1DF30C000, v105, OS_LOG_TYPE_ERROR, v106, buf, 2u);
    goto LABEL_161;
  }
  v15 = 0;
LABEL_150:
  if (!v91)
  {
LABEL_152:
    v14 = sub_1DF310EA8(v141, (int *)&v168);
    if (v168)
    {
      v9 = 0;
      v10 = 0;
LABEL_157:
      v11 = 0;
      v12 = 0;
      goto LABEL_163;
    }
    v10 = sub_1DF310E18(v141, (int *)&v168);
    if (v168 || (v168 = sub_1DF30E5B4(v141, (uint64_t)&v167, (uint64_t)&v166)) != 0)
    {
      v9 = 0;
      goto LABEL_157;
    }
    v9 = sub_1DF310DA4(v141, &v168);
    if (v168)
      goto LABEL_157;
    v12 = (const __CFNumber *)sub_1DF311084(v141);
    v11 = (void *)sub_1DF30E2C4(v141);
    if (v16 && log)
    {
      if (v145)
        goto LABEL_168;
      v139 = sub_1DF32C188(v16, (uint64_t)v10, (int *)&v168);
      if (v168)
        goto LABEL_163;
      if (v139 == 2)
      {
LABEL_168:
        v138 = v158;
        if (v158 | v142)
        {
          cf = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
          if (!cf)
          {
            sub_1DF30EE34();
            loga = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1DF30C000, loga, OS_LOG_TYPE_ERROR, "Failed to create list of provisioning profiles", buf, 2u);
            }

          }
        }
        v173 = v11;
        v174 = 0;
        *(_QWORD *)buf = v15;
        *(_QWORD *)&buf[8] = v167;
        *(_QWORD *)&buf[16] = v166;
        *(_QWORD *)&buf[24] = v13;
        v171 = v14;
        *(_QWORD *)&v172 = v9;
        *((_QWORD *)&v172 + 1) = v145;
        BYTE9(v172) = v143;
        if (v138)
          v107 = 1;
        else
          v107 = v142 == 0;
        v108 = !v107;
        LOBYTE(v174) = v108;
        BYTE1(v174) = v60;
        sub_1DF32C458((const __CFData **)buf);
      }
      if (v139 != 3)
      {
        sub_1DF30EE34();
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v139;
          _os_log_impl(&dword_1DF30C000, v126, OS_LOG_TYPE_DEFAULT, "Not validly signed for app provisioning (type: %ld).", buf, 0xCu);
        }

        v89 = -402620392;
        goto LABEL_162;
      }
      v137 = 5;
    }
    *(_QWORD *)buf = 0;
    if (!CFNumberGetValue(v12, kCFNumberLongLongType, buf) || *(uint64_t *)buf <= 132095)
    {
      v89 = -402620375;
      goto LABEL_162;
    }
    if (!v13)
      v13 = (const __CFData *)sub_1DF311048(v141);
    if (!__s2)
      goto LABEL_197;
    if (v13)
    {
      v111 = CFDataGetBytePtr(v13);
      v112 = CFDataGetLength(v13);
      if (!memcmp(v111, __s2, v112))
        goto LABEL_197;
      v113 = -402620401;
    }
    else
    {
      v113 = -402620415;
    }
    v168 = v113;
LABEL_197:
    if (!(_BYTE)v161)
      goto LABEL_215;
    if (BYTE3(v162))
      v114 = 1;
    else
      v114 = BYTE2(v162) == 0;
    if ((!v114 || BYTE1(v162)) && !amfi_developer_mode_status())
      v168 = -402620373;
    if (CEContextQuery() != *MEMORY[0x1E0DDFFA0] || amfi_developer_mode_status())
    {
LABEL_215:
      if (v168)
        goto LABEL_163;
      if (HIBYTE(v155))
      {
        v168 = sub_1DF32D83C(v13);
        if (v168)
          goto LABEL_163;
      }
      if (v163)
      {
        sub_1DF30EE34();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v163;
          _os_log_impl(&dword_1DF30C000, v115, OS_LOG_TYPE_DEFAULT, "%@ was picked for validation", buf, 0xCu);
        }

      }
      if (!v147)
        goto LABEL_163;
      objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], v109, 0, v110);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (v118)
      {
        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v116, v137, v117);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v146)
        {
          sub_1DF30EE34();
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DF30C000, v127, OS_LOG_TYPE_ERROR, "Could not create signer type number?", buf, 2u);
          }

          v168 = -402620406;
          goto LABEL_258;
        }
        objc_msgSend_setObject_forKeyedSubscript_(v118, v119, (uint64_t)v146, (uint64_t)CFSTR("SignerType"));
        v120 = MEMORY[0x1E0C9AAB0];
        objc_msgSend_setObject_forKeyedSubscript_(v118, v121, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("ValidatedByProfile"), log);
        if ((_BYTE)v162)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v122, v120, (uint64_t)CFSTR("ValidatedByUniversalProfile"));
        else
          objc_msgSend_setObject_forKeyedSubscript_(v118, v122, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("ValidatedByUniversalProfile"));
        if (BYTE1(v162))
          objc_msgSend_setObject_forKeyedSubscript_(v118, v123, v120, (uint64_t)CFSTR("ValidatedByLocalProfile"));
        else
          objc_msgSend_setObject_forKeyedSubscript_(v118, v123, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("ValidatedByLocalProfile"));
        if (v15)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v124, (uint64_t)v15, (uint64_t)CFSTR("SignerCertificate"));
        if (v14)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v124, (uint64_t)v14, (uint64_t)CFSTR("SigningID"));
        if (v10)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v124, (uint64_t)v10, (uint64_t)CFSTR("SigningTime"));
        if (v167)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v124, (uint64_t)v167, (uint64_t)CFSTR("Entitlements"));
        if (v9)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v124, (uint64_t)v9, (uint64_t)CFSTR("TeamID"));
        if (v13)
        {
          objc_msgSend_setObject_forKeyedSubscript_(v118, v124, (uint64_t)v13, (uint64_t)CFSTR("CdHash"));
        }
        else
        {
          sub_1DF30EE34();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DF30C000, v128, OS_LOG_TYPE_ERROR, "cdHash is NULL after successful validation? (This should not happen.)", buf, 2u);
          }

        }
        if (v163)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v125, (uint64_t)v163, (uint64_t)CFSTR("ProfileUUID"));
        if (v140)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v125, (uint64_t)v140, (uint64_t)CFSTR("LaunchWarningData"));
        objc_msgSend_setObject_forKeyedSubscript_(v118, v125, (uint64_t)v12, (uint64_t)CFSTR("SignatureVersion"));
        v132 = objc_msgSend_unsignedIntValue(v11, v129, v130, v131);
        if (v132 == 7 || v132 == 2)
          objc_msgSend_setObject_forKeyedSubscript_(v118, v133, MEMORY[0x1E0C9AAB0], (uint64_t)CFSTR("IsNativeForPlatform"));
        else
          objc_msgSend_setObject_forKeyedSubscript_(v118, v133, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("IsNativeForPlatform"));

      }
      *v147 = v118;
LABEL_258:

      goto LABEL_163;
    }
    v89 = -402620373;
LABEL_162:
    v168 = v89;
    goto LABEL_163;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v14 = 0;
LABEL_163:
  v8 = v140;
  v17 = v141;
LABEL_5:
  v18 = v8;
  v19 = v17;
  CEReleaseManagedContext();
  if (cf)
    CFRelease(cf);
  if (v163)
    CFRelease(v163);
  if (v150)
    CFRelease(v150);
  if (v15)
    CFRelease(v15);
  if (v16)
    CFRelease(v16);
  if (v14)
    CFRelease(v14);
  if (v167)
    CFRelease(v167);
  if (v10)
    CFRelease(v10);
  if (v13)
    CFRelease(v13);
  if (v9)
    CFRelease(v9);
  if (v12)
    CFRelease(v12);
  if (v11)
    CFRelease(v11);
  if (v18)
    CFRelease(v18);
  v20 = v168;

  objc_autoreleasePoolPop(context);
  return v20;
}

CFTypeRef sub_1DF3108C4(CFStringRef filePath, uint64_t a2, int *a3)
{
  const __CFDictionary *v4;
  CFTypeID TypeID;
  const __CFNumber *Value;
  const __CFNumber *v8;
  CFTypeID v9;
  const __CFDictionary *v10;
  CFTypeRef result;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  uint64_t valuePtr;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v4 = (const __CFDictionary *)a2;
  v20 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  v16 = 0;
  if (!a2)
    goto LABEL_8;
  TypeID = CFNumberGetTypeID();
  Value = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("UniversalFileOffset"));
  if (Value)
  {
    v8 = Value;
    if (CFGetTypeID(Value) != TypeID)
    {
      v16 = 49174;
      sub_1DF30EE34();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = 49174;
      v13 = "error processing kMISValidationOptionUniversalFileOffset (invalid type?), error 0x%x";
      goto LABEL_15;
    }
    CFNumberGetValue(v8, kCFNumberLongLongType, &valuePtr);
    if (valuePtr < 0)
    {
      v16 = 49174;
      sub_1DF30EE34();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 134217984;
      v19 = valuePtr;
      v13 = "invalid kMISValidationOptionUniversalFileOffset %lld";
      v14 = v12;
      v15 = 12;
      goto LABEL_16;
    }
  }
  v9 = CFDataGetTypeID();
  v10 = (const __CFDictionary *)CFDictionaryGetValue(v4, CFSTR("DetachedSignature"));
  v4 = v10;
  if (v10 && CFGetTypeID(v10) != v9)
  {
    v16 = 49174;
    sub_1DF30EE34();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = 49174;
    v13 = "error processing kMISValidationOptionDetachedSignature (invalid type?), error 0x%x";
LABEL_15:
    v14 = v12;
    v15 = 8;
LABEL_16:
    _os_log_error_impl(&dword_1DF30C000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_18;
  }
  v16 = 0;
  a2 = valuePtr;
LABEL_8:
  result = sub_1DF310B70(filePath, a2, (uint64_t)v4, &v16);
  if (result)
    goto LABEL_19;
  sub_1DF30EE34();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = v16;
    _os_log_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_DEFAULT, "Could not copy code signature (error 0x%x).", buf, 8u);
  }
LABEL_18:

  result = 0;
LABEL_19:
  if (a3)
    *a3 = v16;
  return result;
}

BOOL sub_1DF310B24()
{
  uint64_t IsPresent;
  uint64_t v1;

  IsPresent = SecCodeSpecialSlotIsPresent();
  v1 = SecCodeSpecialSlotIsPresent();
  return IsPresent != *MEMORY[0x1E0C9AE50] || v1 == *MEMORY[0x1E0C9AE50];
}

CFTypeRef sub_1DF310B70(CFStringRef filePath, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  const __CFAllocator *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  CFTypeRef cf;
  uint64_t valuePtr;
  void *values[2];

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  cf = 0;
  valuePtr = a2;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], filePath, kCFURLPOSIXPathStyle, 0);
  if (!v8)
  {
    LODWORD(v11) = -402620406;
    if (!a4)
      return cf;
    goto LABEL_20;
  }
  v9 = v8;
  if (a2)
  {
    values[0] = CFNumberCreate(v7, kCFNumberLongLongType, &valuePtr);
    v10 = CFDictionaryCreate(v7, MEMORY[0x1E0CD6CC8], (const void **)values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFRelease(values[0]);
    v11 = SecStaticCodeCreateWithPathAndAttributes(v9, 0, v10, (SecStaticCodeRef *)&cf);
    if (v10)
      CFRelease(v10);
    if (!(_DWORD)v11)
    {
LABEL_6:
      if (!a3)
        goto LABEL_19;
      goto LABEL_14;
    }
  }
  else
  {
    v11 = SecStaticCodeCreateWithPathAndAttributes(v8, 0, 0, (SecStaticCodeRef *)&cf);
    if (!(_DWORD)v11)
      goto LABEL_6;
  }
  sub_1DF30EE34();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(values[0]) = 67109120;
    HIDWORD(values[0]) = v11;
    _os_log_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_DEFAULT, "Failure creating static code: %d", (uint8_t *)values, 8u);
  }

  LODWORD(v11) = sub_1DF30E44C(v11);
  if (a3)
  {
LABEL_14:
    v13 = SecCodeSetDetachedSignature();
    if ((_DWORD)v13)
    {
      v14 = v13;
      LODWORD(v11) = sub_1DF30E44C(v13);
      if (cf)
      {
        sub_1DF30EE34();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(values[0]) = 67109120;
          HIDWORD(values[0]) = v14;
          _os_log_impl(&dword_1DF30C000, v15, OS_LOG_TYPE_DEFAULT, "Failure setting detached signature: %d", (uint8_t *)values, 8u);
        }

        CFRelease(cf);
        cf = 0;
      }
    }
  }
LABEL_19:
  CFRelease(v9);
  if (a4)
LABEL_20:
    *a4 = v11;
  return cf;
}

const void *sub_1DF310DA4(const __CFDictionary *a1, _DWORD *a2)
{
  const void *Value;
  const void *v4;
  CFTypeID v5;

  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6D28]);
  v4 = Value;
  if (Value)
  {
    v5 = CFGetTypeID(Value);
    if (v5 != CFStringGetTypeID())
    {
      v4 = 0;
      if (!a2)
        return v4;
      goto LABEL_5;
    }
    CFRetain(v4);
  }
  if (a2)
LABEL_5:
    *a2 = 0;
  return v4;
}

const void *sub_1DF310E18(void *a1, int *a2)
{
  const __CFDictionary *v3;
  const void *Value;
  const void *v5;
  int v6;

  v3 = a1;
  if (CFDictionaryContainsKey(v3, (const void *)*MEMORY[0x1E0CD6D18]) != 1)
  {
    v5 = 0;
    v6 = -402620388;
    if (!a2)
      goto LABEL_8;
LABEL_7:
    *a2 = v6;
    goto LABEL_8;
  }
  Value = CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0CD6D30]);
  v5 = Value;
  if (Value)
    CFRetain(Value);
  v6 = 0;
  if (a2)
    goto LABEL_7;
LABEL_8:

  return v5;
}

const void *sub_1DF310EA8(const __CFDictionary *a1, int *a2)
{
  const void *Value;
  const void *v4;
  int v5;

  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6D18]);
  v4 = Value;
  if (!Value)
  {
    v5 = -402620388;
    if (!a2)
      return v4;
    goto LABEL_3;
  }
  CFRetain(Value);
  v5 = 0;
  if (a2)
LABEL_3:
    *a2 = v5;
  return v4;
}

const __CFArray *sub_1DF310F04(void *a1, int *a2)
{
  int v3;
  const __CFDictionary *v4;
  const __CFArray *Value;
  const __CFArray *Copy;
  CFTypeID v7;

  v3 = -402620415;
  v4 = a1;
  if (CFDictionaryContainsKey(v4, (const void *)*MEMORY[0x1E0CD6D18]) != 1)
  {
    Copy = 0;
    v3 = -402620388;
    if (!a2)
      goto LABEL_11;
    goto LABEL_10;
  }
  Value = (const __CFArray *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CD6CE0]);
  Copy = Value;
  if (!Value)
  {
    v3 = -402620396;
    if (!a2)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = CFGetTypeID(Value);
  if (v7 == CFArrayGetTypeID() && CFArrayGetCount(Copy) >= 1)
  {
    Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Copy);
    v3 = 0;
    if (!a2)
      goto LABEL_11;
    goto LABEL_10;
  }
  Copy = 0;
  if (a2)
LABEL_10:
    *a2 = v3;
LABEL_11:

  return Copy;
}

CFDictionaryRef sub_1DF310FF0(const __SecCode *a1)
{
  void *v2;
  CFDictionaryRef information;

  information = 0;
  v2 = (void *)MEMORY[0x1E0BFE7D4]();
  LODWORD(a1) = SecCodeCopySigningInformation(a1, 0x23u, &information);
  objc_autoreleasePoolPop(v2);
  if ((_DWORD)a1)
    return (CFDictionaryRef)0;
  else
    return information;
}

const void *sub_1DF311048(const __CFDictionary *a1)
{
  const void *Value;
  const void *v2;

  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6D40]);
  v2 = Value;
  if (Value)
    CFRetain(Value);
  return v2;
}

const void *sub_1DF311084(const __CFDictionary *a1)
{
  const void *Value;
  const void *v2;

  Value = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x1E0CD6D20]);
  v2 = Value;
  if (Value)
    CFRetain(Value);
  return v2;
}

unint64_t sub_1DF3110C0()
{
  unint64_t result;

  result = qword_1ED1BFDC0;
  if (!qword_1ED1BFDC0)
  {
    result = MEMORY[0x1E0BFEC84](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED1BFDC0);
  }
  return result;
}

uint64_t *sub_1DF311104()
{
  if (qword_1ED1C0280 != -1)
    swift_once();
  return &qword_1ED1C0440;
}

uint64_t sub_1DF311144()
{
  return 1;
}

uint64_t type metadata accessor for LaunchWarningClientOperations()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LaunchWarningMark()
{
  return objc_opt_self();
}

uint64_t sub_1DF3111C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_1DF311280();
  if (!v0)
  {
    v4 = v3;
    if (v3 >> 60 == 15)
    {
      return 0;
    }
    else
    {
      v5 = v2;
      type metadata accessor for LaunchWarningMark();
      v1 = swift_allocObject();
      sub_1DF312DC0(v5, v4);
    }
  }
  return v1;
}

uint64_t sub_1DF311268@<X0>(const char *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1DF30DA88(a1, a2);
}

uint64_t sub_1DF311280()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  sub_1DF30E1CC(&qword_1F0474838);
  result = sub_1DF331F14();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_1DF3112F0()
{
  uint64_t v0;

  v0 = sub_1DF331F44();
  sub_1DF3117F0(v0, qword_1F0475468);
  sub_1DF311350(v0, (uint64_t)qword_1F0475468);
  return sub_1DF331EFC();
}

uint64_t sub_1DF311350(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id sub_1DF311368(char a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  if (qword_1F0474960 != -1)
    swift_once();
  v5 = sub_1DF331F44();
  sub_1DF311350(v5, (uint64_t)qword_1F0475468);
  v6 = (void *)sub_1DF331F08();
  v9.receiver = v4;
  v9.super_class = v2;
  v7 = objc_msgSendSuper2(&v9, sel_initWithDatabaseURL_asReadOnly_, v6, a1 & 1);

  return v7;
}

uint64_t type metadata accessor for UserTrustDB()
{
  return objc_opt_self();
}

uint64_t sub_1DF3115B8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void (*v7)(char *, uint64_t);
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  v1 = v0;
  v2 = sub_1DF331F44();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, sel_dbURL);
  sub_1DF331F20();

  sub_1DF331F2C();
  v7 = *(void (**)(char *, uint64_t))(v3 + 8);
  v7(v5, v2);
  v8 = sub_1DF332058();
  swift_bridgeObjectRelease();
  sub_1DF3318F4((const char *)(v8 + 32));
  swift_release();
  v9 = objc_msgSend(v1, sel_shmURL);
  sub_1DF331F20();

  sub_1DF331F2C();
  v7(v5, v2);
  v10 = sub_1DF332058();
  swift_bridgeObjectRelease();
  sub_1DF3318F4((const char *)(v10 + 32));
  swift_release();
  v11 = objc_msgSend(v1, sel_walURL);
  sub_1DF331F20();

  sub_1DF331F2C();
  v7(v5, v2);
  v12 = sub_1DF332058();
  swift_bridgeObjectRelease();
  sub_1DF3318F4((const char *)(v12 + 32));
  return swift_release();
}

id sub_1DF3117BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustDB();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t *sub_1DF3117F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1DF311830(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1DF311874(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1DF3118B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = 0u;
  v6 = v5 + 16;
  *(_OWORD *)(v5 + 32) = 0u;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DF319A80(0xD000000000000046, 0x80000001DF333580, (uint64_t)sub_1DF311A28, v7, (uint64_t)sub_1DF311A2C, v5);
  swift_release();
  swift_release();
  if (!v2)
  {
    swift_beginAccess();
    v6 = *(_QWORD *)(v5 + 16);
    sub_1DF311AF4(v6, *(_QWORD *)(v5 + 24), *(_QWORD *)(v5 + 32), *(_QWORD *)(v5 + 40));
  }
  swift_release();
  return v6;
}

uint64_t sub_1DF3119F8()
{
  _QWORD *v0;

  if (v0[3])
  {
    swift_bridgeObjectRelease();
    sub_1DF311830(v0[4], v0[5]);
  }
  return swift_deallocObject();
}

uint64_t sub_1DF311A2C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
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
  unint64_t v18;

  v2 = v1;
  v4 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 192))(0);
  v6 = v5;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 128))(1);
  if (v6)
  {
    v8 = nullsub_1(v4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    swift_beginAccess();
    v15 = v2[2];
    v16 = v2[3];
    v17 = v2[4];
    v18 = v2[5];
    v2[2] = v8;
    v2[3] = v10;
    v2[4] = v12;
    v2[5] = v14;
    return sub_1DF3123D0(v15, v16, v17, v18);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DF311AF4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return sub_1DF311874(a3, a4);
  }
  return result;
}

uint64_t sub_1DF311B2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[6];

  v14[0] = a2;
  v3 = sub_1DF331FE0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  sub_1DF30E1CC(&qword_1F0474868);
  v6 = swift_allocBox();
  v8 = v7;
  v9 = type metadata accessor for UserTrustedProfileEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v11 + v10, (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  swift_retain();
  v12 = v14[5];
  sub_1DF319A80(0xD0000000000000BFLL, 0x80000001DF3335D0, (uint64_t)sub_1DF311CD4, v11, (uint64_t)sub_1DF311F04, v6);
  swift_release();
  if (v12)
    return swift_release_n();
  swift_release();
  swift_beginAccess();
  sub_1DF311F2C(v8, v14[0]);
  return swift_release();
}

uint64_t sub_1DF311CD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;

  v2 = sub_1DF30E1CC(&qword_1F0474878);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DF30E1CC(&qword_1F0474868);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = swift_projectBox();
  v8 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 192);
  v8(0);
  v10 = v9;
  v11 = v8(1);
  v13 = v12;
  v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 128))(2);
  v16 = v14;
  v17 = v15;
  if (v13)
  {
    sub_1DF311874(v14, v15);
    v18 = nullsub_1(v11);
    v20 = v19;
    v22 = v21;
    v13 = v23;
    if (v10)
      goto LABEL_3;
LABEL_6:
    sub_1DF3123D0(v18, v20, v22, v13);
    __break(1u);
    goto LABEL_7;
  }
  v18 = 0;
  v20 = 0;
  v22 = 0;
  if (!v10)
    goto LABEL_6;
LABEL_3:
  sub_1DF331FC8();
  swift_bridgeObjectRelease();
  v24 = sub_1DF331FE0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v4, 1, v24) != 1)
  {
    sub_1DF312498((uint64_t)v4, v18, v20, v22, v13, (uint64_t)v7);
    sub_1DF311830(v16, v17);
    v25 = type metadata accessor for UserTrustedProfileEntry();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v7, 0, 1, v25);
    v26 = v28;
    swift_beginAccess();
    return sub_1DF312408((uint64_t)v7, v26);
  }
LABEL_7:
  result = sub_1DF3123D0(v18, v20, v22, v13);
  __break(1u);
  return result;
}

uint64_t sub_1DF311F04(uint64_t a1)
{
  return sub_1DF311CD8(a1);
}

uint64_t sub_1DF311F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DF30E1CC(&qword_1F0474868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DF311F74()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DF311F98()
{
  return sub_1DF311FD4((uint64_t)&unk_1EA989320, 0xD000000000000026, 0x80000001DF333690, (uint64_t)sub_1DF3120AC);
}

uint64_t sub_1DF311FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = MEMORY[0x1E0DEE9D8];
  v9 = v8 + 16;
  swift_retain();
  sub_1DF319A80(a2, a3, 0, 0, a4, v8);
  swift_release();
  if (!v4)
  {
    swift_beginAccess();
    v9 = *(_QWORD *)(v8 + 16);
    swift_bridgeObjectRetain();
  }
  swift_release();
  return v9;
}

uint64_t sub_1DF3120AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)a1 + 192))(0);
  if (v3)
  {
    v4 = (uint64_t *)(v1 + 16);
    v5 = sub_1DF33204C();
    v7 = v6;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v8 = *v4;
    result = swift_isUniquelyReferenced_nonNull_native();
    *v4 = v8;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1DF3122CC(0, *(_QWORD *)(v8 + 16) + 1, 1, (char *)v8);
      v8 = result;
      *v4 = result;
    }
    v10 = *(_QWORD *)(v8 + 16);
    v9 = *(_QWORD *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      result = (uint64_t)sub_1DF3122CC((char *)(v9 > 1), v10 + 1, 1, (char *)v8);
      v8 = result;
      *v4 = result;
    }
    *(_QWORD *)(v8 + 16) = v10 + 1;
    v11 = v8 + 16 * v10;
    *(_QWORD *)(v11 + 32) = v5;
    *(_QWORD *)(v11 + 40) = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DF3121B4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DF3121D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1DF331FE0();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1DF312238(uint64_t a1)
{
  uint64_t v2;

  sub_1DF331FE0();
  v2 = sub_1DF331FD4();
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 184))(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DF312298(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)a1 + 184))(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), 1);
}

char *sub_1DF3122CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    sub_1DF30E1CC(&qword_1F0474870);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1DF3123D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return sub_1DF311830(a3, a4);
  }
  return result;
}

uint64_t sub_1DF312408(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DF30E1CC(&qword_1F0474868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UserTrustedProfileEntry()
{
  uint64_t result;

  result = qword_1F0474968;
  if (!qword_1F0474968)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DF312498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;

  v12 = sub_1DF331FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a6, a1, v12);
  result = type metadata accessor for UserTrustedProfileEntry();
  v14 = (_QWORD *)(a6 + *(int *)(result + 20));
  *v14 = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TrustedTeamIdEntry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrustedTeamIdEntry(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_1DF311830(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for TrustedTeamIdEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_1DF311874(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

_QWORD *assignWithCopy for TrustedTeamIdEntry(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[2];
  v4 = a2[3];
  sub_1DF311874(v5, v4);
  v6 = a1[2];
  v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_1DF311830(v6, v7);
  return a1;
}

__n128 initializeWithTake for TrustedTeamIdEntry(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for TrustedTeamIdEntry(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a1[2];
  v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_1DF311830(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrustedTeamIdEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrustedTeamIdEntry()
{
  return &type metadata for TrustedTeamIdEntry;
}

uint64_t *sub_1DF312700(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1DF331FE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    if (v11)
    {
      *v9 = *v10;
      v9[1] = v11;
      v12 = v10[2];
      v13 = v10[3];
      swift_bridgeObjectRetain();
      sub_1DF311874(v12, v13);
      v9[2] = v12;
      v9[3] = v13;
    }
    else
    {
      v15 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v15;
    }
  }
  return a1;
}

uint64_t sub_1DF3127BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;

  v4 = sub_1DF331FE0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  result = v5[1];
  if (result)
  {
    swift_bridgeObjectRelease();
    return sub_1DF311830(v5[2], v5[3]);
  }
  return result;
}

uint64_t sub_1DF31281C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;

  v6 = sub_1DF331FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  if (v10)
  {
    *v8 = *v9;
    v8[1] = v10;
    v11 = v9[2];
    v12 = v9[3];
    swift_bridgeObjectRetain();
    sub_1DF311874(v11, v12);
    v8[2] = v11;
    v8[3] = v12;
  }
  else
  {
    v13 = *((_OWORD *)v9 + 1);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v13;
  }
  return a1;
}

uint64_t sub_1DF3128AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;

  v6 = sub_1DF331FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 8);
  v11 = v9[1];
  if (v10)
  {
    if (v11)
    {
      *v8 = *v9;
      v8[1] = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v12 = v9[2];
      v13 = v9[3];
      sub_1DF311874(v12, v13);
      v14 = v8[2];
      v15 = v8[3];
      v8[2] = v12;
      v8[3] = v13;
      sub_1DF311830(v14, v15);
    }
    else
    {
      sub_1DF3129A0((uint64_t)v8);
      v18 = *((_OWORD *)v9 + 1);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v18;
    }
  }
  else if (v11)
  {
    *v8 = *v9;
    v8[1] = v9[1];
    v16 = v9[2];
    v17 = v9[3];
    swift_bridgeObjectRetain();
    sub_1DF311874(v16, v17);
    v8[2] = v16;
    v8[3] = v17;
  }
  else
  {
    v19 = *((_OWORD *)v9 + 1);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v19;
  }
  return a1;
}

uint64_t sub_1DF3129A0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_1DF311830(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  return a1;
}

uint64_t sub_1DF3129D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;

  v6 = sub_1DF331FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t sub_1DF312A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;

  v6 = sub_1DF331FE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  if (!*(_QWORD *)(a1 + v7 + 8))
    goto LABEL_5;
  v10 = *(_QWORD *)(v9 + 8);
  if (!v10)
  {
    sub_1DF3129A0(v8);
LABEL_5:
    v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v13;
    return a1;
  }
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v8 + 16);
  v12 = *(_QWORD *)(v8 + 24);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
  sub_1DF311830(v11, v12);
  return a1;
}

uint64_t sub_1DF312AD0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF312ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_1DF331FE0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_1DF312B68()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF312B74(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1DF331FE0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  return result;
}

uint64_t sub_1DF312BF0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DF331FE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_1DF312C60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1DF312C78()
{
  sub_1DF332184();
  sub_1DF332190();
  return sub_1DF33219C();
}

uint64_t sub_1DF312CBC()
{
  return sub_1DF332190();
}

uint64_t sub_1DF312CE4()
{
  sub_1DF332184();
  sub_1DF332190();
  return sub_1DF33219C();
}

uint64_t sub_1DF312D34(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 1;
  *(_QWORD *)(result + 24) = a1;
  return result;
}

uint64_t sub_1DF312D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_1DF312DC0(a1, a2);
  return v4;
}

void sub_1DF312DC0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_1DF312E0C()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  char *v12;

  if (!BYTE6(v2))
  {
    v5 = 1;
    goto LABEL_13;
  }
  if (sub_1DF331F98() != 1)
  {
    v5 = 0;
    goto LABEL_13;
  }
  if (v1)
  {
    if (v1 == 1)
    {
      LODWORD(v4) = HIDWORD(v3) - v3;
      if (!__OFSUB__(HIDWORD(v3), (_DWORD)v3))
      {
        v4 = (int)v4;
        goto LABEL_11;
      }
      __break(1u);
LABEL_15:
      __break(1u);
      JUMPOUT(0x1DF313010);
    }
    v7 = *(_QWORD *)(v3 + 16);
    v6 = *(_QWORD *)(v3 + 24);
    v8 = __OFSUB__(v6, v7);
    v4 = v6 - v7;
    if (v8)
      goto LABEL_15;
  }
  else
  {
    v4 = BYTE6(v2);
  }
LABEL_11:
  v5 = 1;
  if (v4 == 9)
  {
    *(_BYTE *)(v0 + 16) = 1;
    v9 = sub_1DF313090(1, 8, v3, v2);
    sub_1DF31310C(v9, v10);
    __asm { BR              X10 }
  }
LABEL_13:
  sub_1DF31304C();
  swift_allocError();
  *v12 = v5;
  swift_willThrow();
  sub_1DF311830(v3, v2);
  type metadata accessor for LaunchWarningMark();
  swift_deallocPartialClassInstance();
  return v0;
}

unint64_t sub_1DF31304C()
{
  unint64_t result;

  result = qword_1F0474880;
  if (!qword_1F0474880)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF335534, &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_1F0474880);
  }
  return result;
}

uint64_t sub_1DF313090(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ((uint64_t (*)(void))((char *)&loc_1DF3130A0 + dword_1DF3130FC[a4 >> 62]))();
}

uint64_t sub_1DF3130B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (BYTE6(a4) <= a2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a2 + 1 < a1)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x1DF3130FCLL);
  }
  return sub_1DF331F68();
}

void sub_1DF31310C(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[3] = MEMORY[0x1E0CB0338];
  v3[4] = MEMORY[0x1E0CB0318];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_1DF313170 + dword_1DF3133A4[sub_1DF3137E0(v3, MEMORY[0x1E0CB0338])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_1DF313180()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v6 = v2;
  v7 = v3;
  v8 = BYTE2(v3);
  v9 = BYTE3(v3);
  v10 = BYTE4(v3);
  v11 = BYTE5(v3);
  sub_1DF311874(v1, v0);
  sub_1DF31376C(&v6, (_BYTE *)&v6 + BYTE6(v3), &v12);
  sub_1DF311830(v1, v0);
  v4 = v12;
  sub_1DF313804((uint64_t)&v13);
  return v4;
}

uint64_t sub_1DF3133B4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = MEMORY[0x1E0DEAC20];
  v8[4] = MEMORY[0x1E0CB1AA8];
  v8[0] = a1;
  v8[1] = a2;
  v2 = sub_1DF3137E0(v8, MEMORY[0x1E0DEAC20]);
  v3 = (_BYTE *)*v2;
  if (*v2 && (v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = sub_1DF313824(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = sub_1DF3138E4((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      v6 = sub_1DF31395C((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    v6 = 0;
  }
  sub_1DF313804((uint64_t)v8);
  return v6;
}

uint64_t sub_1DF31346C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = xmmword_1DF3354B0;
  v5 = *(_QWORD *)(v0 + 24);
  v1 = sub_1DF3133B4((uint64_t)&v5, (uint64_t)&v6);
  v3 = v2;
  sub_1DF331F8C();
  sub_1DF311830(v1, v3);
  return v6;
}

uint64_t sub_1DF31350C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  result = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
  if (!v1)
  {
    v4 = result;
    v5 = v3;
    sub_1DF3171A0();
    return sub_1DF311830(v4, v5);
  }
  return result;
}

uint64_t sub_1DF313594()
{
  return swift_deallocClassInstance();
}

unint64_t sub_1DF3135A8()
{
  unint64_t result;

  result = qword_1F0474888;
  if (!qword_1F0474888)
  {
    result = MEMORY[0x1E0BFEC84]("m>e\vt ", &type metadata for LaunchWarningMarkError);
    atomic_store(result, (unint64_t *)&qword_1F0474888);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for LaunchWarningMarkError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningMarkError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchWarningMarkError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1DF3136D8 + 4 * byte_1DF3354C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DF31370C + 4 * byte_1DF3354C0[v4]))();
}

uint64_t sub_1DF31370C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DF313714(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DF31371CLL);
  return result;
}

uint64_t sub_1DF313728(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DF313730);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DF313734(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DF31373C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DF313748(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DF313750(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningMarkError()
{
  return &type metadata for LaunchWarningMarkError;
}

_BYTE *sub_1DF31376C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_1DF313824(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_1DF3138E4((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_1DF31395C((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_1DF3137E0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1DF313804(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1DF313824(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_1DF3138E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1DF331ED8();
  swift_allocObject();
  result = sub_1DF331E9C();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1DF331F5C();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1DF31395C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1DF331ED8();
  swift_allocObject();
  result = sub_1DF331E9C();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1DF3139DC()
{
  uint64_t result;

  sub_1DF313B30();
  result = sub_1DF3320B8();
  qword_1F0475480 = result;
  return result;
}

uint64_t *sub_1DF313A40()
{
  if (qword_1F0474B00 != -1)
    swift_once();
  return &qword_1F0475480;
}

uint64_t sub_1DF313A80()
{
  uint64_t result;

  sub_1DF313B30();
  result = sub_1DF3320B8();
  qword_1ED1C0440 = result;
  return result;
}

uint64_t sub_1DF313AF0()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DF313B00()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for Logger()
{
  return objc_opt_self();
}

unint64_t sub_1DF313B30()
{
  unint64_t result;

  result = qword_1ED1BFDC8;
  if (!qword_1ED1BFDC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED1BFDC8);
  }
  return result;
}

uint64_t sub_1DF313B6C(uint64_t a1)
{
  unsigned int v1;

  if (a1 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (a1)
    return v1;
  else
    return 0;
}

_QWORD *sub_1DF313B84@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_1DF313BA4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

_QWORD *sub_1DF313BB0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1DF313BBC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1DF313BC4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1DF313BD8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1DF313BEC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1DF313C00(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1DF313C30@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1DF313C5C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1DF313C80(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1DF313C94(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1DF313CA8(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1DF313CBC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1DF313CD0(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1DF313CE4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1DF313CF8(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1DF313D0C()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1DF313D1C()
{
  return sub_1DF3320DC();
}

_QWORD *sub_1DF313D34(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1DF313D48@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1DF313D58(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_1DF313D64(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DF313D78@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1DF314AF4(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t type metadata accessor for LaunchWarningDetails()
{
  uint64_t result;

  result = qword_1F0474950;
  if (!qword_1F0474950)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DF313DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DF30E1CC(&qword_1F0474828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DF313E38@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;

  *(_DWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(_QWORD *)(a8 + 16) = a3;
  v12 = a5 & 1;
  v13 = (int *)type metadata accessor for LaunchWarningDetails();
  v14 = a8 + v13[6];
  v15 = sub_1DF331FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a4, v15);
  *(_BYTE *)(a8 + v13[7]) = v12;
  *(_QWORD *)(a8 + v13[8]) = a6;
  return sub_1DF313ED4(a7, a8 + v13[9]);
}

uint64_t sub_1DF313ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DF30E1CC(&qword_1F0474828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1DF313F20()
{
  unint64_t result;

  result = qword_1F0474890;
  if (!qword_1F0474890)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF3355E0, &type metadata for LaunchWarningReason);
    atomic_store(result, (unint64_t *)&qword_1F0474890);
  }
  return result;
}

unint64_t sub_1DF313F68()
{
  unint64_t result;

  result = qword_1F0474898;
  if (!qword_1F0474898)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF335780, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_1F0474898);
  }
  return result;
}

unint64_t sub_1DF313FB0()
{
  unint64_t result;

  result = qword_1F04748A0;
  if (!qword_1F04748A0)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF3356B8, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_1F04748A0);
  }
  return result;
}

unint64_t sub_1DF313FF8()
{
  unint64_t result;

  result = qword_1F04748A8;
  if (!qword_1F04748A8)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF3357B8, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_1F04748A8);
  }
  return result;
}

unint64_t sub_1DF314040()
{
  unint64_t result;

  result = qword_1F04748B0;
  if (!qword_1F04748B0)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF3357E0, &type metadata for LaunchWarningFlags);
    atomic_store(result, (unint64_t *)&qword_1F04748B0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningReason(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1DF3140D0 + 4 * byte_1DF3355D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DF314104 + 4 * asc_1DF3355D0[v4]))();
}

uint64_t sub_1DF314104(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DF31410C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DF314114);
  return result;
}

uint64_t sub_1DF314120(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DF314128);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DF31412C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DF314134(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningReason()
{
  return &type metadata for LaunchWarningReason;
}

ValueMetadata *type metadata accessor for LaunchWarningFlags()
{
  return &type metadata for LaunchWarningFlags;
}

_QWORD *sub_1DF314160(_DWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_DWORD *)a2;
    v7 = a2[1];
    v8 = a2[2];
    sub_1DF311874(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    v9 = a3[6];
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_1DF331FBC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(_QWORD *)((char *)v4 + v13) = *(_QWORD *)((char *)a2 + v13);
    v14 = a3[9];
    v15 = (char *)v4 + v14;
    v16 = (char *)a2 + v14;
    v17 = sub_1DF331F44();
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = sub_1DF30E1CC(&qword_1F0474828);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t sub_1DF3142A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  sub_1DF311830(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_1DF331FBC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 36);
  v7 = sub_1DF331F44();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

uint64_t sub_1DF314348(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_1DF311874(v6, v7);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1DF331FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v13 = a3[9];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_1DF331F44();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_1DF314460(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  uint64_t v21;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_1DF311874(v6, v7);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  sub_1DF311830(v8, v9);
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_1DF331FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v14 = a3[9];
  v15 = (void *)(a1 + v14);
  v16 = (void *)(a2 + v14);
  v17 = sub_1DF331F44();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v12) = v19(v15, 1, v17);
  v20 = v19(v16, 1, v17);
  if (!(_DWORD)v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    v21 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

uint64_t sub_1DF3145D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_1DF331FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  v11 = a3[9];
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = sub_1DF331F44();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_1DF3146DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  uint64_t v20;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1DF311830(v6, v7);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1DF331FBC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v13 = a3[9];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = sub_1DF331F44();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  v19 = v18(v15, 1, v16);
  if (!(_DWORD)v10)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t sub_1DF314840()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF31484C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  v6 = sub_1DF331FBC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 254)
  {
    v8 = sub_1DF30E1CC(&qword_1F0474828);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = a3[9];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = *(unsigned __int8 *)(a1 + a3[7]);
  if (v10 >= 2)
    return v10 - 1;
  else
    return 0;
}

uint64_t sub_1DF3148EC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF3148F8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_1DF331FBC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[6];
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + a4[7]) = a2 + 1;
      return result;
    }
    v10 = sub_1DF30E1CC(&qword_1F0474828);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = a4[9];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_1DF314998()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DF331FBC();
  if (v0 <= 0x3F)
  {
    sub_1DF314A4C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1DF314A4C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F0474830)
  {
    sub_1DF331F44();
    v0 = sub_1DF3320C4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F0474830);
  }
}

void type metadata accessor for SecCSDigestAlgorithm()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1F04748B8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1F04748B8);
  }
}

uint64_t sub_1DF314AF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1DF314B30()
{
  uint64_t v0;

  v0 = sub_1DF331F44();
  sub_1DF3117F0(v0, qword_1F0475488);
  sub_1DF311350(v0, (uint64_t)qword_1F0475488);
  return sub_1DF331EFC();
}

id sub_1DF314B90(char a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  if (qword_1F0474F10 != -1)
    swift_once();
  v5 = sub_1DF331F44();
  sub_1DF311350(v5, (uint64_t)qword_1F0475488);
  v6 = (void *)sub_1DF331F08();
  v9.receiver = v4;
  v9.super_class = v2;
  v7 = objc_msgSendSuper2(&v9, sel_initWithDatabaseURL_asReadOnly_, v6, a1 & 1);

  return v7;
}

uint64_t type metadata accessor for LaunchWarningDB()
{
  return objc_opt_self();
}

id sub_1DF314DE0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  char v11;
  void *v12;
  __CFString *v13;
  void *v14;
  objc_super v16;

  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for LaunchWarningDB();
  v1 = objc_msgSendSuper2(&v16, sel_setupSchema);
  if ((_DWORD)v1)
  {
    v2 = objc_msgSend(v0, sel_readSetting_, CFSTR("databaseSchemaVersion"));
    if (v2)
    {
      v3 = v2;
      v4 = sub_1DF332040();
      v6 = v5;

    }
    else
    {
      v7 = (void *)sub_1DF33201C();
      objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v7, 0, 0);

      v8 = CFSTR("databaseSchemaVersion");
      v4 = 49;
      v6 = 0xE100000000000000;
      v9 = (void *)sub_1DF33201C();
      objc_msgSend(v0, sel_setSetting_toValue_, v8, v9);

    }
    if (v4 == 49 && v6 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_1DF332130();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
        return v1;
    }
    v12 = (void *)sub_1DF33201C();
    objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v12, 0, 0);

    v13 = CFSTR("databaseSchemaVersion");
    v14 = (void *)sub_1DF33201C();
    objc_msgSend(v0, sel_setSetting_toValue_, v13, v14);

  }
  return v1;
}

id sub_1DF3150F8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningDB();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DF31512C()
{
  sub_1DF332184();
  sub_1DF332190();
  return sub_1DF33219C();
}

uint64_t sub_1DF31516C()
{
  return sub_1DF332190();
}

uint64_t sub_1DF315190()
{
  sub_1DF332184();
  sub_1DF332190();
  return sub_1DF33219C();
}

uint64_t sub_1DF3151CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t (*v14)(uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[12];
  int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v38 = a2;
  sub_1DF30E1CC(&qword_1F0474828);
  v3 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v5 = &v36[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v3);
  v7 = &v36[-v6];
  v8 = sub_1DF331FBC();
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = &v36[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v13 = &v36[-v12];
  v14 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160);
  v15 = v14(0);
  v39 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 128))(1);
  v40 = v16;
  v17 = v14(2);
  v18 = v14(3);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 144))(4);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 192))(5);
  if ((v15 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(v15))
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v21 = v20;
  v22 = sub_1DF313B6C(v17);
  if (v22 == 2)
  {
    swift_bridgeObjectRelease();
    sub_1DF3320A0();
    v23 = (void *)*sub_1DF313A40();
    sub_1DF30E1CC(qword_1ED1BFDD0);
    v24 = swift_allocObject();
    v25 = MEMORY[0x1E0DEDC60];
    *(_OWORD *)(v24 + 16) = xmmword_1DF3358D0;
    v26 = MEMORY[0x1E0DEDCD8];
    *(_QWORD *)(v24 + 56) = v25;
    *(_QWORD *)(v24 + 64) = v26;
    *(_QWORD *)(v24 + 32) = v17;
    v27 = v23;
    sub_1DF331FEC();

    swift_bridgeObjectRelease();
    v43 = v17;
    v28 = sub_1DF332124();
    v30 = v29;
    sub_1DF315544();
    swift_allocError();
    *(_OWORD *)v31 = xmmword_1DF3358E0;
    *(_QWORD *)(v31 + 16) = v28;
    *(_QWORD *)(v31 + 24) = v30;
    *(_BYTE *)(v31 + 32) = 1;
    swift_willThrow();
    sub_1DF311830(v39, v40);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v41 + 8))(v13, v42);
  }
  else
  {
    v37 = v22 & 1;
    v32 = sub_1DF331F44();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v7, 1, 1, v32);
    if (v21)
    {
      sub_1DF331F38();
      swift_bridgeObjectRelease();
      sub_1DF316464((uint64_t)v7, &qword_1F0474828);
      sub_1DF313ED4((uint64_t)v5, (uint64_t)v7);
    }
    v34 = v41;
    v33 = v42;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v41 + 16))(v11, v13, v42);
    v35 = nullsub_1(v18);
    sub_1DF315588((uint64_t)v7, (uint64_t)v5, &qword_1F0474828);
    sub_1DF313E38(v15, v39, v40, (uint64_t)v11, v37, v35, (uint64_t)v5, v38);
    sub_1DF316464((uint64_t)v7, &qword_1F0474828);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v34 + 8))(v13, v33);
  }
}

unint64_t sub_1DF315544()
{
  unint64_t result;

  result = qword_1F04748C0;
  if (!qword_1F04748C0)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF335D50, &type metadata for DBError);
    atomic_store(result, (unint64_t *)&qword_1F04748C0);
  }
  return result;
}

uint64_t sub_1DF315588(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1DF30E1CC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DF3155CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1DF30E1CC(&qword_1F0474840);
  v5 = swift_allocBox();
  v7 = v6;
  v8 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1DF3320F4();
  sub_1DF332070();
  sub_1DF332070();
  sub_1DF332070();
  swift_retain();
  swift_retain();
  sub_1DF319A80(0, 0xE000000000000000, (uint64_t)sub_1DF315778, a1, (uint64_t)sub_1DF31592C, v5);
  swift_bridgeObjectRelease();
  swift_release();
  if (v2)
    return swift_release_n();
  swift_release();
  swift_beginAccess();
  sub_1DF315588(v7, a2, &qword_1F0474840);
  return swift_release();
}

uint64_t sub_1DF315778(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = *(_QWORD *)(v1 + 24);
  if ((result & 0x8000000000000000) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)a1 + 152))();
  __break(1u);
  return result;
}

uint64_t sub_1DF3157B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = sub_1DF30E1CC(&qword_1F0474840);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for LaunchWarningDetails();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_projectBox();
  result = sub_1DF3151CC(a1, (uint64_t)v8);
  if (!v1)
  {
    v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(6);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(7);
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      v12 = result;
      v13 = _s18LaunchWarningEntryVMa();
      sub_1DF315944((uint64_t)v8, (uint64_t)v5 + *(int *)(v13 + 20), (uint64_t (*)(_QWORD))type metadata accessor for LaunchWarningDetails);
      *v5 = v12;
      *((_BYTE *)v5 + *(int *)(v13 + 24)) = v11 & 1;
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v5, 0, 1, v13);
      swift_beginAccess();
      return sub_1DF3164A0((uint64_t)v5, v9);
    }
  }
  return result;
}

uint64_t sub_1DF31592C(uint64_t a1)
{
  return sub_1DF3157B4(a1);
}

uint64_t sub_1DF315944(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1DF31598C()
{
  unint64_t result;

  result = qword_1F04748C8;
  if (!qword_1F04748C8)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF33590C, &type metadata for LaunchWarningDBError);
    atomic_store(result, (unint64_t *)&qword_1F04748C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchWarningDBError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningDBError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1DF315A64 + 4 * byte_1DF335900[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DF315A84 + 4 * byte_1DF335905[v4]))();
}

_BYTE *sub_1DF315A64(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DF315A84(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DF315A8C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DF315A94(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DF315A9C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DF315AA4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1DF315AB0()
{
  return 0;
}

ValueMetadata *type metadata accessor for LaunchWarningDBError()
{
  return &type metadata for LaunchWarningDBError;
}

_QWORD *sub_1DF315AC8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    *(_DWORD *)((char *)a1 + v7) = *(_DWORD *)((char *)a2 + v7);
    v10 = *(_QWORD *)((char *)a2 + v7 + 8);
    v11 = *(_QWORD *)((char *)a2 + v7 + 16);
    sub_1DF311874(v10, v11);
    *((_QWORD *)v8 + 1) = v10;
    *((_QWORD *)v8 + 2) = v11;
    v12 = (int *)type metadata accessor for LaunchWarningDetails();
    v13 = v12[6];
    v14 = &v8[v13];
    v15 = &v9[v13];
    v16 = sub_1DF331FBC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v8[v12[7]] = v9[v12[7]];
    *(_QWORD *)&v8[v12[8]] = *(_QWORD *)&v9[v12[8]];
    v17 = v12[9];
    v18 = &v8[v17];
    v19 = &v9[v17];
    v20 = sub_1DF331F44();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = sub_1DF30E1CC(&qword_1F0474828);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_1DF315C44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  sub_1DF311830(*(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16));
  v3 = type metadata accessor for LaunchWarningDetails();
  v4 = v2 + *(int *)(v3 + 24);
  v5 = sub_1DF331FBC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v2 + *(int *)(v3 + 36);
  v7 = sub_1DF331F44();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

_QWORD *sub_1DF315CF0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  v10 = *(_QWORD *)((char *)a2 + v6 + 16);
  sub_1DF311874(v9, v10);
  *((_QWORD *)v7 + 1) = v9;
  *((_QWORD *)v7 + 2) = v10;
  v11 = (int *)type metadata accessor for LaunchWarningDetails();
  v12 = v11[6];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = sub_1DF331FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(_QWORD *)&v7[v11[8]] = *(_QWORD *)&v8[v11[8]];
  v16 = v11[9];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = sub_1DF331F44();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    v21 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_1DF315E40(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)((char *)a1 + v6) = *(_DWORD *)((char *)a2 + v6);
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  v10 = *(_QWORD *)((char *)a2 + v6 + 16);
  sub_1DF311874(v9, v10);
  v11 = *((_QWORD *)v7 + 1);
  v12 = *((_QWORD *)v7 + 2);
  *((_QWORD *)v7 + 1) = v9;
  *((_QWORD *)v7 + 2) = v10;
  sub_1DF311830(v11, v12);
  v13 = (int *)type metadata accessor for LaunchWarningDetails();
  v14 = v13[6];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = sub_1DF331FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v7[v13[7]] = v8[v13[7]];
  *(_QWORD *)&v7[v13[8]] = *(_QWORD *)&v8[v13[8]];
  v18 = v13[9];
  v19 = &v7[v18];
  v20 = &v8[v18];
  v21 = sub_1DF331F44();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v7) = v23(v19, 1, v21);
  v24 = v23(v20, 1, v21);
  if (!(_DWORD)v7)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    v25 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_1DF315FE4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)v7 = *(_DWORD *)((char *)a2 + v6);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)((char *)a2 + v6 + 8);
  v9 = (int *)type metadata accessor for LaunchWarningDetails();
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_1DF331FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v7[v9[7]] = v8[v9[7]];
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  v14 = v9[9];
  v15 = &v7[v14];
  v16 = &v8[v14];
  v17 = sub_1DF331F44();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_1DF316128(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_DWORD *)v7 = *(_DWORD *)((char *)a2 + v6);
  v9 = *(_QWORD *)((char *)a1 + v6 + 8);
  v10 = *((_QWORD *)v7 + 2);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v8 + 8);
  sub_1DF311830(v9, v10);
  v11 = (int *)type metadata accessor for LaunchWarningDetails();
  v12 = v11[6];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = sub_1DF331FBC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v7[v11[7]] = v8[v11[7]];
  *(_QWORD *)&v7[v11[8]] = *(_QWORD *)&v8[v11[8]];
  v16 = v11[9];
  v17 = &v7[v16];
  v18 = &v8[v16];
  v19 = sub_1DF331F44();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v7) = v21(v17, 1, v19);
  v22 = v21(v18, 1, v19);
  if (!(_DWORD)v7)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = sub_1DF30E1CC(&qword_1F0474828);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1DF3162C0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF3162CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for LaunchWarningDetails();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_1DF31635C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DF316368(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for LaunchWarningDetails();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_1DF3163E4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LaunchWarningDetails();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DF316464(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1DF30E1CC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DF3164A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DF30E1CC(&qword_1F0474840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DF3164E8()
{
  const __CFURL *v0;
  OSStatus v1;
  const __SecCode *v2;
  OSStatus v3;
  CFDictionaryRef v4;
  id v5;
  const __CFDictionary *v6;
  id v7;
  const __CFDictionary *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[24];
  uint64_t v45;
  CFDictionaryRef information;
  SecStaticCodeRef staticCode[2];

  staticCode[1] = *(SecStaticCodeRef *)MEMORY[0x1E0C80C00];
  staticCode[0] = 0;
  v0 = (const __CFURL *)sub_1DF331F08();
  v1 = SecStaticCodeCreateWithPath(v0, 0, staticCode);

  if (v1 || !staticCode[0])
  {
    sub_1DF3320A0();
    v10 = (void *)*sub_1DF311104();
    sub_1DF30E1CC(qword_1ED1BFDD0);
    v11 = swift_allocObject();
    v12 = MEMORY[0x1E0DEDBC8];
    *(_OWORD *)(v11 + 16) = xmmword_1DF335A10;
    v13 = MEMORY[0x1E0DEDC38];
    *(_QWORD *)(v11 + 56) = v12;
    *(_QWORD *)(v11 + 64) = v13;
    *(_DWORD *)(v11 + 32) = v1;
    v14 = v10;
    v15 = sub_1DF331F2C();
    v17 = v16;
    *(_QWORD *)(v11 + 96) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v11 + 104) = sub_1DF3110C0();
    *(_QWORD *)(v11 + 72) = v15;
    *(_QWORD *)(v11 + 80) = v17;
    sub_1DF331FEC();

    swift_bridgeObjectRelease();
    sub_1DF316B94();
    swift_allocError();
    *(_DWORD *)v18 = v1;
    *(_BYTE *)(v18 + 4) = 0;
    swift_willThrow();
LABEL_28:

    return v14;
  }
  information = 0;
  v2 = staticCode[0];
  v3 = SecCodeCopySigningInformation(v2, 0x21u, &information);
  if (v3 || (v4 = information) == 0)
  {
    sub_1DF3320A0();
    v19 = (void *)*sub_1DF311104();
    sub_1DF30E1CC(qword_1ED1BFDD0);
    v14 = swift_allocObject();
    v20 = MEMORY[0x1E0DEDBC8];
    *(_OWORD *)(v14 + 16) = xmmword_1DF335A10;
    v21 = MEMORY[0x1E0DEDC38];
    *(_QWORD *)(v14 + 56) = v20;
    *(_QWORD *)(v14 + 64) = v21;
    *(_DWORD *)(v14 + 32) = v3;
    v22 = v19;
    v23 = sub_1DF331F2C();
    v25 = v24;
    *(_QWORD *)(v14 + 96) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 104) = sub_1DF3110C0();
    *(_QWORD *)(v14 + 72) = v23;
    *(_QWORD *)(v14 + 80) = v25;
    sub_1DF331FEC();

    swift_bridgeObjectRelease();
    sub_1DF316B94();
    swift_allocError();
    *(_DWORD *)v26 = v3;
    *(_BYTE *)(v26 + 4) = 0;
    swift_willThrow();
LABEL_27:

    goto LABEL_28;
  }
  *(_QWORD *)&v42 = *MEMORY[0x1E0CD6CD8];
  v5 = (id)v42;
  v6 = v4;
  v7 = v5;
  v8 = v6;
  sub_1DF30E1CC(&qword_1F0474858);
  v9 = -[__CFDictionary __swift_objectForKeyedSubscript:](v8, sel___swift_objectForKeyedSubscript_, sub_1DF33213C());
  swift_unknownObjectRelease();
  if (v9)
  {
    sub_1DF3320D0();
    swift_unknownObjectRelease();
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
  }
  sub_1DF316BD8((uint64_t)&v42, (uint64_t)v44);
  if (!v45)
  {

    sub_1DF316C20((uint64_t)v44);
LABEL_16:
    sub_1DF3320A0();
    v28 = (void *)*sub_1DF311104();
    sub_1DF30E1CC(qword_1ED1BFDD0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1DF3358D0;
    v29 = v28;
    v30 = sub_1DF331F2C();
    v32 = v31;
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 64) = sub_1DF3110C0();
    *(_QWORD *)(v14 + 32) = v30;
    *(_QWORD *)(v14 + 40) = v32;
LABEL_26:
    sub_1DF331FEC();

    swift_bridgeObjectRelease();
    sub_1DF316B94();
    swift_allocError();
    *(_DWORD *)v39 = 0;
    *(_BYTE *)(v39 + 4) = 1;
    swift_willThrow();

    goto LABEL_27;
  }
  sub_1DF30E1CC(&qword_1F0474848);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_16;
  }

  v27 = (id)*MEMORY[0x1E0CD6CE8];
  if (-[__CFDictionary __swift_objectForKeyedSubscript:](v8, sel___swift_objectForKeyedSubscript_, v27))
  {
    sub_1DF3320D0();
    swift_unknownObjectRelease();
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
  }
  sub_1DF316BD8((uint64_t)&v42, (uint64_t)v44);
  if (!v45)
  {

    swift_bridgeObjectRelease();
    sub_1DF316C20((uint64_t)v44);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v14 = v41;

  if (!*(_QWORD *)(v41 + 16) || (v33 = sub_1DF316C60(v41), (v34 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_1DF3320A0();
    v35 = (void *)*sub_1DF311104();
    sub_1DF30E1CC(qword_1ED1BFDD0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1DF3358D0;
    v29 = v35;
    v36 = sub_1DF331F2C();
    v38 = v37;
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 64) = sub_1DF3110C0();
    *(_QWORD *)(v14 + 32) = v36;
    *(_QWORD *)(v14 + 40) = v38;
    goto LABEL_26;
  }
  sub_1DF311874(*(_QWORD *)(*(_QWORD *)(v41 + 56) + 16 * v33), *(_QWORD *)(*(_QWORD *)(v41 + 56) + 16 * v33 + 8));

  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1DF316B94()
{
  unint64_t result;

  result = qword_1F04748D0;
  if (!qword_1F04748D0)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF335A20, &type metadata for CodeSignatureError);
    atomic_store(result, (unint64_t *)&qword_1F04748D0);
  }
  return result;
}

uint64_t sub_1DF316BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DF30E1CC(&qword_1F0474860);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DF316C20(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DF30E1CC(&qword_1F0474860);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DF316C60(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x1E0BFDEB0](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_1DF316F40(a1, v3);
}

uint64_t initializeBufferWithCopyOfBuffer for CodeSignatureError(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CodeSignatureError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CodeSignatureError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_1DF316CF4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DF316D10(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CodeSignatureError()
{
  return &type metadata for CodeSignatureError;
}

uint64_t destroy for CDHashInfo(uint64_t a1)
{
  return sub_1DF311830(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t _s3mis10CDHashInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_1DF311874(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for CDHashInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_1DF311874(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  sub_1DF311830(v5, v6);
  return a1;
}

__n128 initializeWithTake for CDHashInfo(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CDHashInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1DF311830(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CDHashInfo(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CDHashInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CDHashInfo()
{
  return &type metadata for CDHashInfo;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_1DF316EFC(a1, &qword_1F0474850);
}

void sub_1DF316EFC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

unint64_t sub_1DF316F40(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

id sub_1DF316FDC()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserTrustDB();
  v1 = objc_msgSendSuper2(&v7, sel_setupSchema);
  if ((_DWORD)v1)
  {
    v2 = objc_msgSend(v0, sel_readSetting_, CFSTR("databaseSchemaVersion"));
    if (!v2)
    {
      v3 = (void *)sub_1DF33201C();
      objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v3, 0, 0);

      v4 = (void *)sub_1DF33201C();
      objc_msgSend(v0, sel_executeQuery_withBind_withResults_, v4, 0, 0);

      v5 = CFSTR("databaseSchemaVersion");
      v2 = (id)sub_1DF33201C();
      objc_msgSend(v0, sel_setSetting_toValue_, v5, v2);

    }
  }
  return v1;
}

void type metadata accessor for FileAttributeKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ED1C0270)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ED1C0270);
  }
}

uint64_t sub_1DF3171A0()
{
  return sub_1DF331F14();
}

void sub_1DF3171DC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v4 = sub_1DF331E84();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&loc_1DF317268 + dword_1DF3175B4[a3 >> 62];
  v7[1] = (char *)v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __asm { BR              X10 }
}

uint64_t sub_1DF31727C()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;

  *(_QWORD *)(v5 - 104) = v3;
  *(_WORD *)(v5 - 96) = v4;
  *(_BYTE *)(v5 - 94) = BYTE2(v4);
  *(_BYTE *)(v5 - 93) = BYTE3(v4);
  *(_BYTE *)(v5 - 92) = BYTE4(v4);
  *(_BYTE *)(v5 - 91) = BYTE5(v4);
  v6 = sub_1DF332058();
  v7 = setxattr(v2, (const char *)(v6 + 32), (const void *)(v5 - 104), BYTE6(v4), 0, 0);
  result = swift_release();
  if (v7 < 0)
  {
    v9 = MEMORY[0x1E0BFDD3C](result);
    v10 = sub_1DF331FF8();
    if ((v10 & 0x100000000) != 0)
    {
      sub_1DF317CC8();
      swift_allocError();
      *v12 = v9;
    }
    else
    {
      *(_DWORD *)(v5 - 104) = v10;
      sub_1DF3178F4(MEMORY[0x1E0DEE9D8]);
      sub_1DF317D0C(&qword_1F0474900, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADE88]);
      v11 = *(_QWORD *)(v5 - 120);
      sub_1DF331EE4();
      sub_1DF331E78();
      (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v11, v1);
    }
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1DF3175C4(uint64_t a1, uint64_t a2)
{
  return sub_1DF31768C(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1DF3175D0()
{
  sub_1DF332040();
  sub_1DF332064();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DF317610()
{
  uint64_t v0;

  sub_1DF332040();
  sub_1DF332184();
  sub_1DF332064();
  v0 = sub_1DF33219C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1DF317680(uint64_t a1, uint64_t a2)
{
  return sub_1DF31768C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1DF31768C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1DF332040();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DF3176C8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1DF332028();
  *a2 = 0;
  return result;
}

uint64_t sub_1DF31773C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1DF332040();
  v2 = sub_1DF33201C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DF31777C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1DF332040();
  v2 = v1;
  if (v0 == sub_1DF332040() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1DF332130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1DF317804@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1DF33201C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DF317848@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DF332040();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DF317870()
{
  sub_1DF317D0C(&qword_1F04748D8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1DF335C48);
  sub_1DF317D0C(&qword_1F04748F0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1DF335B9C);
  return sub_1DF332118();
}

unint64_t sub_1DF3178F4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1DF30E1CC(&qword_1F0474908);
  v2 = sub_1DF33210C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DF317D4C(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1DF317A1C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1DF317D94(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1DF317A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1DF332184();
  sub_1DF332064();
  v4 = sub_1DF33219C();
  return sub_1DF317A80(a1, a2, v4);
}

unint64_t sub_1DF317A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1DF332130() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1DF332130() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_1DF332130() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

void sub_1DF317BC4(uint64_t a1)
{
  uint64_t v1;

  sub_1DF3171DC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

_DWORD *initializeBufferWithCopyOfBuffer for UtilitiesError(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UtilitiesError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UtilitiesError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UtilitiesError()
{
  return &type metadata for UtilitiesError;
}

uint64_t sub_1DF317C44()
{
  return sub_1DF317D0C(&qword_1F04748E0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1DF335B60);
}

uint64_t sub_1DF317C70()
{
  return sub_1DF317D0C(&qword_1F04748E8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1DF335B34);
}

uint64_t sub_1DF317C9C()
{
  return sub_1DF317D0C(&qword_1ED1C0278, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_1DF335BD0);
}

unint64_t sub_1DF317CC8()
{
  unint64_t result;

  result = qword_1F04748F8;
  if (!qword_1F04748F8)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF335AA4, &type metadata for UtilitiesError);
    atomic_store(result, (unint64_t *)&qword_1F04748F8);
  }
  return result;
}

uint64_t sub_1DF317D0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1E0BFEC84](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DF317D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DF30E1CC(&qword_1F0474910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1DF317D94(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1DF317DA4(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_1DF331ED8();
      swift_allocObject();
      sub_1DF331EB4();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1DF331F5C();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void sub_1DF317E40(uint64_t a1)
{
  __asm { BR              X11 }
}

ssize_t sub_1DF317EA8@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, size_t size, uint64_t a6, uint64_t value, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  _QWORD *v21;
  uint64_t v22;
  const char *v23;
  size_t v24;
  const char *v25;
  ssize_t v26;
  unint64_t v27;
  uint64_t v29;
  unsigned int v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;

  v29 = v22;
  LOWORD(v30) = a1;
  BYTE2(v30) = BYTE2(a1);
  HIBYTE(v30) = BYTE3(a1);
  v31 = BYTE4(a1);
  v32 = BYTE5(a1);
  v33 = BYTE6(a1);
  v25 = (const char *)(sub_1DF332058() + 32);
  swift_bridgeObjectRetain_n();
  v26 = getxattr(v23, v25, &v29, v24, 0, 0);
  swift_bridgeObjectRelease_n();
  swift_release();
  v27 = v30 | ((unint64_t)v31 << 32) | ((unint64_t)v32 << 40) | ((unint64_t)v33 << 48);
  *v21 = v29;
  v21[1] = v27;
  return v26;
}

void sub_1DF318288(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  CFURLRef v5;
  CFURLRef v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFBundle *bundle;

  v4 = (void *)sub_1DF331F08();
  bundle = (__CFBundle *)_CFBundleCreateUnique();

  if (bundle)
  {
    v5 = CFBundleCopyExecutableURL(bundle);
    if (v5)
    {
      v6 = v5;
      sub_1DF331F20();
      sub_1DF332094();
      v7 = (void *)*sub_1DF311104();
      sub_1DF30E1CC(qword_1ED1BFDD0);
      v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_1DF3358D0;
      v9 = v7;
      v10 = sub_1DF331F2C();
      v12 = v11;
      *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v8 + 64) = sub_1DF3110C0();
      *(_QWORD *)(v8 + 32) = v10;
      *(_QWORD *)(v8 + 40) = v12;
      sub_1DF331FEC();

      swift_bridgeObjectRelease();
      return;
    }

  }
  v13 = sub_1DF331F44();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a2, a1, v13);
}

void sub_1DF3183DC()
{
  sub_1DF30DE38();
}

_QWORD *sub_1DF3183F0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _DWORD v19[4];
  _QWORD *v20;

  v4 = sub_1DF331F44();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_1DF311144() & 1) == 0)
  {
    v17 = objc_msgSend(objc_allocWithZone((Class)MISLaunchWarningQueryResult), sel_initWithWarningState_withUserOverridden_withKBURL_, 0, 0, 0);
    v16 = v17;
    if (v17)
      return v16;
    __break(1u);
LABEL_6:
    v16 = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }
  v19[3] = sub_1DF332094();
  v8 = sub_1DF311104();
  v20 = v1;
  v9 = (void *)*v8;
  sub_1DF30E1CC(qword_1ED1BFDD0);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1DF3358D0;
  v11 = v9;
  v12 = a1;
  v13 = sub_1DF331F2C();
  v15 = v14;
  *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v10 + 64) = sub_1DF3110C0();
  *(_QWORD *)(v10 + 32) = v13;
  *(_QWORD *)(v10 + 40) = v15;
  sub_1DF331FEC();

  swift_bridgeObjectRelease();
  sub_1DF318288(v12, (uint64_t)v7);
  v16 = v20;
  v17 = (_QWORD *)(*(uint64_t (**)(char *))((*MEMORY[0x1E0DEEDD8] & *v20) + 0x50))(v7);
  if (!v2)
    goto LABEL_6;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

id sub_1DF3186C0()
{
  return sub_1DF31894C();
}

uint64_t sub_1DF318800(char a1, uint64_t a2)
{
  return sub_1DF318C18(a1, a2);
}

id sub_1DF31891C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchWarningClientOperations();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1DF31894C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  const __CFData *v13;
  _OWORD *v14;
  const __CFData *v15;
  _QWORD *v16;
  __int128 v18;
  CFDataRef v19[2];

  v19[1] = *(CFDataRef *)MEMORY[0x1E0C80C00];
  if ((sub_1DF311144() & 1) == 0)
    return 0;
  sub_1DF332094();
  v1 = (void *)*sub_1DF311104();
  sub_1DF30E1CC(qword_1ED1BFDD0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1DF3358D0;
  v3 = v1;
  v4 = sub_1DF331F2C();
  v6 = v5;
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v2 + 64) = sub_1DF3110C0();
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v6;
  sub_1DF331FEC();

  swift_bridgeObjectRelease();
  v7 = sub_1DF3164E8();
  if (!v0)
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    v19[0] = 0;
    sub_1DF311874(v8, v9);
    v13 = (const __CFData *)sub_1DF331F74();
    sub_1DF311830(v11, v12);
    v3 = (id)sub_1DF3310F4(v10, v13, v19);

    if (v3)
    {
      sub_1DF3320F4();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v18 = 0xD000000000000011;
      *((_QWORD *)&v18 + 1) = 0x80000001DF333CD0;
      sub_1DF332124();
      sub_1DF332070();
      swift_bridgeObjectRelease();
      v3 = (id)0x80000001DF333CD0;
      sub_1DF3191D0();
      swift_allocError();
      *v14 = v18;
    }
    else
    {
      if (v19[0])
      {
        v15 = v19[0];
        sub_1DF331F80();

      }
      sub_1DF3191D0();
      swift_allocError();
      *v16 = 0xD000000000000029;
      v16[1] = 0x80000001DF333D20;
    }
    swift_willThrow();
    sub_1DF311830(v11, v12);

  }
  return v3;
}

uint64_t sub_1DF318C18(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void **v19;
  int64_t v20;
  int64_t v21;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t *v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;

  v4 = sub_1DF331F44();
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF318288(a2, (uint64_t)v6);
  sub_1DF3320AC();
  v33[0] = sub_1DF311104();
  v7 = *(void **)v33[0];
  sub_1DF30E1CC(qword_1ED1BFDD0);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DF335A10;
  v9 = v7;
  v10 = sub_1DF331F2C();
  v12 = v11;
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
  v13 = sub_1DF3110C0();
  *(_QWORD *)(v8 + 64) = v13;
  v14 = MEMORY[0x1E0DEAFA0];
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v12;
  v15 = MEMORY[0x1E0DEAFD8];
  *(_QWORD *)(v8 + 96) = v14;
  *(_QWORD *)(v8 + 104) = v15;
  *(_BYTE *)(v8 + 72) = a1;
  sub_1DF331FEC();

  swift_bridgeObjectRelease();
  type metadata accessor for LaunchWarningMark();
  v16 = v33[1];
  v17 = sub_1DF3111C8();
  if (!v16)
  {
    v18 = v13;
    v19 = (void **)v33[0];
    if (v17)
    {
      v20 = sub_1DF330FC8(*(_QWORD *)(v17 + 24), a1 & 1);
      if (v20 == 16)
      {
        sub_1DF3191D0();
        swift_allocError();
        *v29 = 0;
        v29[1] = 0;
      }
      else
      {
        v21 = v20;
        if (v20 == 1024)
        {
          (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v35);
          return swift_release();
        }
        v36 = 0;
        v37 = 0xE000000000000000;
        sub_1DF3320F4();
        swift_bridgeObjectRelease();
        v36 = 0xD000000000000011;
        v37 = 0x80000001DF333CD0;
        v38 = v21;
        sub_1DF332124();
        sub_1DF332070();
        swift_bridgeObjectRelease();
        v30 = v36;
        v31 = v37;
        sub_1DF3191D0();
        swift_allocError();
        *v32 = v30;
        v32[1] = v31;
      }
      swift_willThrow();
      swift_release();
    }
    else
    {
      sub_1DF3320A0();
      v23 = *v19;
      v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_1DF3358D0;
      v25 = v23;
      v26 = sub_1DF331F2C();
      *(_QWORD *)(v24 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v24 + 64) = v18;
      *(_QWORD *)(v24 + 32) = v26;
      *(_QWORD *)(v24 + 40) = v27;
      sub_1DF331FEC();

      swift_bridgeObjectRelease();
      sub_1DF3191D0();
      swift_allocError();
      *v28 = xmmword_1DF335CB0;
      swift_willThrow();
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v6, v35);
}

unint64_t destroy for LaunchWarningClientOperationError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s3mis33LaunchWarningClientOperationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for LaunchWarningClientOperationError(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LaunchWarningClientOperationError(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for LaunchWarningClientOperationError(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchWarningClientOperationError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LaunchWarningClientOperationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_1DF319188(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1DF3191A0(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchWarningClientOperationError()
{
  return &type metadata for LaunchWarningClientOperationError;
}

unint64_t sub_1DF3191D0()
{
  unint64_t result;

  result = qword_1F0474918;
  if (!qword_1F0474918)
  {
    result = MEMORY[0x1E0BFEC84](&unk_1DF335CC0, &type metadata for LaunchWarningClientOperationError);
    atomic_store(result, (unint64_t *)&qword_1F0474918);
  }
  return result;
}

uint64_t sub_1DF319214(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DF30E1CC(&qword_1F0474840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DF319254(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DF319298(uint64_t a1)
{
  uint64_t v2;

  v2 = _s18LaunchWarningEntryVMa();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1DF3192D4()
{
  qword_1F04754A0 = -1;
}

uint64_t sub_1DF3192E4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_1DF319314(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_1DF319350())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1DF319390(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

void sub_1DF3193C0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1DF319414()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  sqlite3_stmt *v6;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v2;
  v9 = v3;
  v10 = BYTE2(v3);
  v11 = BYTE3(v3);
  v12 = BYTE4(v3);
  v13 = BYTE5(v3);
  v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 88);
  v5 = swift_retain();
  v6 = (sqlite3_stmt *)v4(v5);
  if (qword_1F04753A8 != -1)
    swift_once();
  sqlite3_bind_blob(v6, v0, &v8, BYTE6(v3), (void (__cdecl *)(void *))qword_1F04754A0);
  return swift_release();
}

_BYTE *sub_1DF319690(int a1)
{
  uint64_t v1;
  uint64_t (*v3)(void);
  sqlite3_stmt *v4;
  _BYTE *result;
  _BYTE *v6;
  sqlite3_stmt *v7;
  int v8;

  v3 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 88);
  v4 = (sqlite3_stmt *)v3();
  result = sqlite3_column_blob(v4, a1);
  if (result)
  {
    v6 = result;
    v7 = (sqlite3_stmt *)v3();
    v8 = sqlite3_column_bytes(v7, a1);
    return (_BYTE *)sub_1DF319E78(v6, v8);
  }
  return result;
}

uint64_t sub_1DF3196F0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t result;
  double v5;
  sqlite3_int64 v6;
  sqlite3_stmt *v7;

  result = sub_1DF331FB0();
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.22337204e18)
  {
    v6 = (uint64_t)v5;
    v7 = (sqlite3_stmt *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 88))(result);
    return sqlite3_bind_int64(v7, a2, v6);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_1DF31977C(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  sqlite3_column_int64(v3, a1);
  return sub_1DF331FA4();
}

uint64_t sub_1DF3197C0(sqlite3_int64 a1, int a2)
{
  uint64_t v2;
  sqlite3_stmt *v5;

  v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v2 + 88))();
  return sqlite3_bind_int64(v5, a2, a1);
}

sqlite3_int64 sub_1DF3197FC(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  return sqlite3_column_int64(v3, a1);
}

uint64_t sub_1DF319828(char a1, int a2)
{
  uint64_t v2;
  sqlite3_stmt *v5;

  v5 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v2 + 88))();
  return sqlite3_bind_int64(v5, a2, a1 & 1);
}

BOOL sub_1DF319864(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  return sqlite3_column_int64(v3, a1) != 0;
}

uint64_t sub_1DF31989C(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v6;

  if (a2)
  {
    v6 = result;
    swift_retain();
    return sub_1DF3198F4(v6, a2, v3, a3);
  }
  return result;
}

uint64_t sub_1DF3198F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  const char *v5;
  sqlite3_stmt *v7;
  char v8[8];
  uint64_t v9;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_1DF3320E8();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v5 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v5 = (const char *)sub_1DF332100();
    sub_1DF31A3B4(v5);
    return swift_release();
  }
  *(_QWORD *)v8 = a1;
  v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  v7 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)a3 + 88))();
  if (qword_1F04753A8 != -1)
    swift_once();
  sqlite3_bind_text(v7, a4, v8, -1, (void (__cdecl *)(void *))qword_1F04754A0);
  return swift_release();
}

const unsigned __int8 *sub_1DF319A30(int a1)
{
  uint64_t v1;
  sqlite3_stmt *v3;
  const unsigned __int8 *result;

  v3 = (sqlite3_stmt *)(*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
  result = sqlite3_column_text(v3, a1);
  if (result)
    return (const unsigned __int8 *)sub_1DF33207C();
  return result;
}

uint64_t sub_1DF319A70()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DF319A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v21;
  uint64_t aBlock;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  uint64_t (*v26)(uint64_t);
  _QWORD *v27;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  v11 = (void *)sub_1DF33201C();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  v26 = sub_1DF319F74;
  v27 = (_QWORD *)v12;
  aBlock = MEMORY[0x1E0C809B0];
  v23 = 1107296256;
  v24 = sub_1DF319CB8;
  v25 = &unk_1EA9890D0;
  v13 = _Block_copy(&aBlock);
  sub_1DF31A004(a3);
  swift_release();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a5;
  v14[3] = a6;
  v14[4] = v10;
  v26 = sub_1DF31A048;
  v27 = v14;
  aBlock = MEMORY[0x1E0C809B0];
  v23 = 1107296256;
  v24 = sub_1DF319CF4;
  v25 = &unk_1EA9890F8;
  v15 = _Block_copy(&aBlock);
  sub_1DF31A004(a5);
  swift_retain();
  swift_release();
  v16 = objc_msgSend(v21, sel_executeQuery_withBind_withResults_, v11, v13, v15);
  _Block_release(v15);
  _Block_release(v13);

  if (v16)
  {
    sub_1DF315544();
    swift_allocError();
    *(_QWORD *)v17 = v16;
    *(_QWORD *)(v17 + 8) = 0;
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)(v17 + 24) = 0;
    *(_BYTE *)(v17 + 32) = 0;
LABEL_5:
    swift_willThrow();
    return swift_release();
  }
  swift_beginAccess();
  v18 = *(void **)(v10 + 16);
  if (v18)
  {
    v19 = v18;
    goto LABEL_5;
  }
  return swift_release();
}

uint64_t sub_1DF319CB8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1DF319CF4(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  sub_1DF31A368();
  v4 = sub_1DF332010();
  swift_retain();
  v3(a2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DF319D6C(uint64_t a1, uint64_t a2, sqlite3_stmt *a3, sqlite3_stmt *a4, int a5)
{
  char *v10;
  uint64_t result;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = (char *)sub_1DF331EA8();
  if (!v10)
  {
LABEL_4:
    v12 = __OFSUB__(a2, a1);
    v13 = a2 - a1;
    if (v12)
    {
      __break(1u);
    }
    else
    {
      v14 = sub_1DF331EC0();
      if (v14 < v13)
        v13 = v14;
      a3 = a4;
      v15 = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 88))();
      if (!v10)
        v13 = 0;
      if (v13 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (v13 <= 0x7FFFFFFF)
        {
          a3 = (sqlite3_stmt *)v15;
          if (qword_1F04753A8 == -1)
          {
LABEL_12:
            sqlite3_bind_blob(a3, a5, v10, v13, (void (__cdecl *)(void *))qword_1F04754A0);
            return swift_release();
          }
LABEL_16:
          swift_once();
          goto LABEL_12;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  result = sub_1DF331ECC();
  if (!__OFSUB__(a1, result))
  {
    v10 += a1 - result;
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DF319E78(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_1DF313824(__src, &__src[a2]);
  sub_1DF331ED8();
  swift_allocObject();
  sub_1DF331E9C();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_1DF331F5C();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_1DF319F24()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1DF319F48()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DF319F74(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    v3 = result;
    type metadata accessor for SQLStatement();
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_1DF31A3A4((uint64_t)v2);
  }
  return result;
}

uint64_t sub_1DF319FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DF319FFC()
{
  return swift_release();
}

uint64_t sub_1DF31A004(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1DF31A014()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DF31A048(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))(v1 + 16);
  if (v2)
  {
    v3 = result;
    type metadata accessor for SQLStatement();
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v3;
    swift_retain();
    v2(v4);
    swift_release();
    return sub_1DF31A3A4((uint64_t)v2);
  }
  return result;
}

uint64_t sub_1DF31A0F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for DBError(uint64_t a1)
{
  return sub_1DF31A138(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_1DF31A138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1DF31A0F4(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DBError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1DF31A0F4(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_1DF31A138(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for DBError(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DBError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_1DF31A138(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DBError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DBError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1DF31A324(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_1DF31A32C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLStatement()
{
  return objc_opt_self();
}

unint64_t sub_1DF31A368()
{
  unint64_t result;

  result = qword_1F0474920;
  if (!qword_1F0474920)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F0474920);
  }
  return result;
}

uint64_t sub_1DF31A3A4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1DF31A3B4(const char *a1)
{
  uint64_t v1;
  int v3;
  sqlite3_stmt *v4;

  v3 = *(_DWORD *)(v1 + 24);
  v4 = (sqlite3_stmt *)(*(uint64_t (**)(void))(**(_QWORD **)(v1 + 16) + 88))();
  if (qword_1F04753A8 != -1)
    swift_once();
  return sqlite3_bind_text(v4, v3, a1, -1, (void (__cdecl *)(void *))qword_1F04754A0);
}

void sub_1DF31A448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;

  v3 = sub_1DF3118B8(a1, a2);
  if (!v2)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    if (v4)
    {
      sub_1DF311874(v5, v6);
      v11 = (void *)sub_1DF331F74();
      sub_1DF311830(v9, v10);
    }
    else
    {
      v11 = 0;
    }
    v12 = objc_msgSend(objc_allocWithZone((Class)MISUserTrustSignature), sel_initWithSignature_, v11);

    if (v12)
      sub_1DF3123D0(v7, v8, v9, v10);
    else
      __break(1u);
  }
}

uint64_t sub_1DF31A670()
{
  return sub_1DF311F98();
}

uint64_t sub_1DF31A748()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  _QWORD v14[2];

  v1 = v0;
  v2 = sub_1DF30E1CC(&qword_1F0474868);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DF30E1CC(&qword_1F0474878);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DF331FE0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF331FC8();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_1DF311B2C((uint64_t)v11, (uint64_t)v4);
    if (v0)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    else
    {
      v13 = type metadata accessor for UserTrustedProfileEntry();
      v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v4, 1, v13) != 1);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      sub_1DF31A91C((uint64_t)v4);
    }
    return (uint64_t)v1;
  }
  return result;
}

uint64_t sub_1DF31A91C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DF30E1CC(&qword_1F0474868);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for UserTrustOperations()
{
  return objc_opt_self();
}

id sub_1DF31AAA0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserTrustOperations();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  result = 22;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0;
    result = __sandbox_ms();
    if ((_DWORD)result)
      return *__error();
    else
      *a3 = 0;
  }
  return result;
}

uint64_t amfi_interface_query_bootarg_state(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 22;
  *a1 = 0;
  result = __sandbox_ms();
  if ((_DWORD)result)
    return *__error();
  *a1 = 0;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(_BYTE *a1)
{
  uint64_t result;
  _OWORD __s2[9];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1)
    return 22;
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  result = __sandbox_ms();
  if (!(_DWORD)result)
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(_BYTE *a1)
{
  uint64_t result;
  _OWORD __s2[6];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1)
    return 22;
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  result = __sandbox_ms();
  if (!(_DWORD)result)
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  _OWORD __s2[6];
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL))
    return 22;
  else
    return __sandbox_ms();
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0, 0) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0, 0) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && (unint64_t)(a3 - 1) <= 0x3FFE)
    return posix_spawnattr_setmacpolicyinfo_np();
  else
    return 22;
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int *v4;
  uint64_t result;
  int v6;
  _QWORD v7[129];

  v4 = (int *)a4;
  v7[128] = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      v6 = 5;
      if (!v4)
        v4 = &v6;
      if (!__sandbox_ms() && !*v4)
        return 1;
    }
    else if (a4)
    {
      result = 0;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }
  else if (a4)
  {
    result = 0;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }
  return 0;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result)
              return result;
            v3 = 0x1000000000;
          }
          else
          {
            v3 = 0x800000000;
          }
        }
        else
        {
          v3 = 0x400000000;
        }
      }
      else
      {
        v3 = 8;
      }
    }
    else
    {
      v3 = 3840;
    }
    *(_QWORD *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  double result;
  time_t v3;
  tm v4;
  time_t v5;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6))
      goto LABEL_3;
    v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      v3 = timegm(&v4);
      result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(_QWORD *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6))
          *(_QWORD *)(a1 + 240) |= 0x1000000000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!result)
    return result;
  v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  v4 = *(_QWORD *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(_BYTE *)(v3 + 17))
      result = sub_1DF31B480((_QWORD *)v3, a2);
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0)
    goto LABEL_15;
  result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result)
    goto LABEL_13;
  v5 = *(_QWORD *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(_QWORD *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(_QWORD *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= 0x6400000uLL;
    }
  }
  return result;
}

uint64_t sub_1DF31B480(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[2];
  unint64_t v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!(_DWORD)result)
  {
    result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= a1[1];
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

uint64_t CTEvaluateAMFICodeSignatureCMS_MaxDigestType(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, _QWORD *a7, _QWORD *a8, uint64_t *a9, int *a10, _DWORD *a11, _QWORD *a12, _QWORD *a13)
{
  __int128 v21;
  __int128 v22;
  uint64_t result;
  int v24;
  int *digest;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  _OWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[2];
  _QWORD v40[17];
  _BYTE __b[1216];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  memset(&v40[14], 170, 24);
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v40[10] = v21;
  *(_OWORD *)&v40[12] = v21;
  *(_OWORD *)&v40[6] = v21;
  *(_OWORD *)&v40[8] = v21;
  *(_OWORD *)&v40[2] = v21;
  *(_OWORD *)&v40[4] = v21;
  *(_OWORD *)v40 = v21;
  memset(__b, 170, sizeof(__b));
  *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39[0] = v22;
  v39[1] = v22;
  v37 = v22;
  v38 = v22;
  v35[4] = v22;
  v36 = v22;
  v35[2] = v22;
  v35[3] = v22;
  v35[0] = v22;
  v35[1] = v22;
  v34 = v22;
  result = sub_1DF31B764((uint64_t)v40, a1, a2, a3, a4, (uint64_t)__b, 0);
  if ((_DWORD)result)
    return result;
  result = sub_1DF31B810((uint64_t)v40, (uint64_t)&v34, &v40[15], 0, a6);
  if ((_DWORD)result)
    return result;
  v33 = 0;
  v30 = 0xAAAAAAAA0000AA01;
  v29 = xmmword_1DF336C60;
  BYTE1(v30) = a5;
  v31 = 0u;
  v32 = 0u;
  v24 = X509ChainCheckPathWithOptions(29, (uint64_t *)v39 + 1, (uint64_t)&v29, &v33);
  if (a10)
  {
    digest = find_digest((uint64_t)v35 + 8);
    if (!digest)
      return 327682;
    *a10 = *digest;
  }
  if (!a9 || v24)
  {
    if (!a9)
      goto LABEL_13;
    v26 = 0;
  }
  else
  {
    v26 = v33;
  }
  *a9 = v26;
LABEL_13:
  if (a8 && a7 && *((_QWORD *)&v39[0] + 1))
  {
    v27 = *(_QWORD *)(*((_QWORD *)&v39[0] + 1) + 8);
    *a7 = **((_QWORD **)&v39[0] + 1);
    *a8 = v27;
  }
  result = 0;
  if (a11 && a12)
  {
    if (a13)
    {
      result = 0;
      *a11 = DWORD2(v36);
      v28 = *((_QWORD *)&v37 + 1);
      *a12 = v37;
      *a13 = v28;
    }
  }
  return result;
}

uint64_t sub_1DF31B764(uint64_t result, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v9;

  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_QWORD *)(result + 112) = 0;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_QWORD *)(result + 24) = 0;
  *(_OWORD *)result = 0u;
  *(_QWORD *)(result + 32) = result + 24;
  *(_QWORD *)result = 4;
  *(_QWORD *)(result + 8) = a6;
  *(_DWORD *)(result + 96) = a7;
  if (a3 < 0)
  {
LABEL_10:
    __break(0x5519u);
    return result;
  }
  v9 = result;
  result = CMSParseContentInfoSignedData(a2, a3, (unint64_t *)result);
  if (!(_DWORD)result)
  {
    if (!a5)
      return 0;
    result = 131091;
    if (!*(_QWORD *)(v9 + 72) && !*(_QWORD *)(v9 + 80))
    {
      if ((a5 & 0x8000000000000000) == 0)
      {
        result = 0;
        *(_QWORD *)(v9 + 72) = a4;
        *(_QWORD *)(v9 + 80) = a5;
        return result;
      }
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t sub_1DF31B810(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, int a5)
{
  uint64_t result;

  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 64) = 1;
  *a3 = 0;
  a3[1] = 0;
  *a3 = a4;
  *(_DWORD *)(a2 + 168) = 458753;
  *((_DWORD *)a3 + 2) = a5;
  result = CMSParseSignerInfos(a1, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
    return *(unsigned int *)(a2 + 168);
  return result;
}

uint64_t CTEvaluateAMFICodeSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7, uint64_t *a8, int *a9, _DWORD *a10, _QWORD *a11, _QWORD *a12)
{
  return CTEvaluateAMFICodeSignatureCMS_MaxDigestType(a1, a2, a3, a4, a5, 16, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t CTEvaluateAMFICodeSignatureCMSPubKey(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, _DWORD *a8, _QWORD *a9, _QWORD *a10)
{
  __int128 v18;
  __int128 v19;
  uint64_t result;
  __int128 *v21;
  __int128 *v22;
  _UNKNOWN **v23;
  int *digest;
  uint64_t v25;
  _QWORD v26[7];
  _QWORD v27[2];
  __int128 v28;
  _OWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[17];
  _BYTE __b[1216];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  memset(&v35[14], 170, 24);
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v35[10] = v18;
  *(_OWORD *)&v35[12] = v18;
  *(_OWORD *)&v35[6] = v18;
  *(_OWORD *)&v35[8] = v18;
  *(_OWORD *)&v35[2] = v18;
  *(_OWORD *)&v35[4] = v18;
  *(_OWORD *)v35 = v18;
  memset(__b, 170, sizeof(__b));
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33 = v19;
  v34 = v19;
  v31 = v19;
  v32 = v19;
  v29[4] = v19;
  v30 = v19;
  v29[3] = v19;
  v29[1] = v19;
  v29[2] = v19;
  v28 = v19;
  v29[0] = v19;
  result = sub_1DF31B764((uint64_t)v35, a1, a2, a3, a4, (uint64_t)__b, 16);
  if (!(_DWORD)result)
  {
    v27[0] = a5;
    v27[1] = a6;
    v21 = (__int128 *)oidForPubKeyLength();
    v22 = &null_octet;
    if (v21)
      v22 = v21;
    v26[0] = 1;
    v26[1] = 0;
    v26[3] = v27;
    v26[2] = 0xAAAAAAAA00000000;
    v23 = &ecPublicKey;
    if (!v21)
      v23 = &rsaEncryption;
    v26[4] = v23;
    v26[5] = v22;
    v26[6] = 0;
    result = sub_1DF31B810((uint64_t)v35, (uint64_t)&v28, &v35[15], (uint64_t)v26, 16);
    if (!(_DWORD)result)
    {
      if (a7)
      {
        digest = find_digest((uint64_t)v29 + 8);
        if (!digest)
          return 327682;
        *a7 = *digest;
      }
      result = 0;
      if (a8 && a9)
      {
        if (a10)
        {
          result = 0;
          *a8 = DWORD2(v30);
          v25 = *((_QWORD *)&v31 + 1);
          *a9 = v31;
          *a10 = v25;
        }
      }
    }
  }
  return result;
}

uint64_t CTEvaluateProvisioningProfile(char *a1, uint64_t a2, char a3, _QWORD *a4, _QWORD *a5)
{
  __int128 v6;
  char v7;
  char v8;
  __int16 v9;
  int v10;
  __int128 *v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = -1431655766;
  v11 = &null_octet;
  v7 = 1;
  v6 = xmmword_1DF336C70;
  v8 = a3;
  v9 = 0;
  v12 = &null_octet;
  v13 = &null_octet;
  v14 = &null_octet;
  return CMSVerifyAndReturnSignedData(a1, a2, a4, a5, (uint64_t)&v6);
}

uint64_t CTAmfiInitializeContext(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5)
{
  __int128 v6;
  uint64_t result;
  int *digest;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[8];
  __int128 v14;
  __int128 v15;
  _OWORD v16[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[2];
  _BYTE __b[1216];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_DWORD *)(a1 + 16) = a4;
  *(_BYTE *)(a1 + 20) = a5;
  v21[0] = 0xAAAAAAAAAAAAAAAALL;
  v21[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14 = v6;
  v15 = v6;
  v13[6] = v6;
  v13[7] = v6;
  v13[4] = v6;
  v13[5] = v6;
  v13[2] = v6;
  v13[3] = v6;
  v13[0] = v6;
  v13[1] = v6;
  v12 = v6;
  memset(v16, 0, sizeof(v16));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  result = sub_1DF31BC58((uint64_t)v16, (uint64_t)&v12, (uint64_t)v21, (uint64_t)__b, a1, (uint64_t (*)(uint64_t, uint64_t, __int128 *))CMSBuildPath);
  if (!(_DWORD)result)
  {
    digest = find_digest((uint64_t)v13 + 8);
    if (digest)
    {
      *(_DWORD *)(a1 + 80) = *digest;
      if (*((_QWORD *)&v17 + 1))
      {
        v9 = v18;
        if ((_QWORD)v18)
        {
          *(_QWORD *)(a1 + 40) = *((_QWORD *)&v17 + 1);
          *(_QWORD *)(a1 + 48) = v9;
        }
      }
      v10 = *((_QWORD *)&v14 + 1);
      result = 0;
      if (*((_QWORD *)&v14 + 1))
      {
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8);
        *(_QWORD *)(a1 + 24) = **((_QWORD **)&v14 + 1);
        *(_QWORD *)(a1 + 32) = v11;
        *(_QWORD *)(a1 + 88) = *(_QWORD *)(v10 + 240);
      }
    }
    else
    {
      return 327682;
    }
  }
  return result;
}

uint64_t sub_1DF31BC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, __int128 *))
{
  uint64_t result;

  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = a1 + 24;
  *(_QWORD *)a1 = 4;
  *(_QWORD *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a5 + 16);
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 64) = 1;
  *(_DWORD *)(a2 + 168) = 327681;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 8) = *(_DWORD *)(a5 + 16);
  *(_BYTE *)(a3 + 12) = *(_BYTE *)(a5 + 84);
  result = CMSParseContentInfoSignedData(*(char **)a5, *(_QWORD *)(a5 + 8), (unint64_t *)a1);
  if (!(_DWORD)result)
  {
    result = CMSParseSignerInfos(a1, a3, a6);
    if (!(_DWORD)result)
      return *(unsigned int *)(a2 + 168);
  }
  return result;
}

uint64_t CTAmfiVerifyCMS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t result;
  uint64_t v8;
  _OWORD v9[6];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[6];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  _BYTE __b[1216];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13 = v6;
  v14 = v6;
  v11 = v6;
  v12 = v6;
  v9[5] = v6;
  v10 = v6;
  v9[3] = v6;
  v9[4] = v6;
  v9[1] = v6;
  v9[2] = v6;
  v9[0] = v6;
  memset(v15, 0, sizeof(v15));
  v16 = 0;
  v17 = a2;
  v18 = a3;
  result = sub_1DF31BC58((uint64_t)v15, (uint64_t)v9, (uint64_t)v19, (uint64_t)__b, a1, (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfo);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a1 + 56) = DWORD2(v10);
    v8 = *((_QWORD *)&v11 + 1);
    *(_QWORD *)(a1 + 64) = v11;
    *(_QWORD *)(a1 + 72) = v8;
    *(_BYTE *)(a1 + 84) = v13;
  }
  return result;
}

uint64_t CTAmfiVerifyCertificateChain(uint64_t a1)
{
  __int128 v2;
  uint64_t result;
  __int128 v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[9];
  _OWORD v10[2];
  _OWORD v11[7];
  uint64_t v12;
  _QWORD v13[2];
  _BYTE __b[1216];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, sizeof(__b));
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = v2;
  v10[1] = v2;
  v9[7] = v2;
  v9[8] = v2;
  v9[5] = v2;
  v9[6] = v2;
  v9[3] = v2;
  v9[4] = v2;
  v9[1] = v2;
  v9[2] = v2;
  v9[0] = v2;
  memset(v11, 0, sizeof(v11));
  v12 = 0;
  result = sub_1DF31BC58((uint64_t)v11, (uint64_t)v9, (uint64_t)v13, (uint64_t)__b, a1, (uint64_t (*)(uint64_t, uint64_t, __int128 *))sub_1DF31BF38);
  if (!(_DWORD)result)
  {
    v8 = 0;
    v5 = 0xAAAAAAAAAAAAAA01;
    v4 = xmmword_1DF336C60;
    BYTE1(v5) = *(_BYTE *)(a1 + 20);
    WORD1(v5) = 0;
    v6 = 0u;
    v7 = 0u;
    result = X509ChainCheckPathWithOptions(29, (uint64_t *)v10 + 1, (uint64_t)&v4, &v8);
    if ((_DWORD)result)
    {
      *(_QWORD *)(a1 + 96) = 0;
      return X509ChainCheckPathWithOptions(29, (uint64_t *)v10 + 1, 0, 0);
    }
    else
    {
      *(_QWORD *)(a1 + 96) = v8;
    }
  }
  return result;
}

uint64_t sub_1DF31BF38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 12) && *(unsigned __int8 *)(a1 + 12) != *(unsigned __int8 *)(a3 + 144))
    return 327710;
  else
    return CMSBuildPath(a1, a2, a3);
}

uint64_t CTAmfiContextGetLeaf(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  *a2 = *(_QWORD *)(a1 + 24);
  *a3 = v3;
  return 0;
}

uint64_t CTAmfiContextGetContent(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48);
  *a2 = *(_QWORD *)(a1 + 40);
  *a3 = v3;
  return 0;
}

uint64_t CTAmfiContextGetDigestType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 80);
}

uint64_t CTAmfiContextGetLeafPolicyFlags(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t CTAmfiContextGetChainPolicyFlags(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

uint64_t CTAmfiContextGetHashAgility(uint64_t a1, _DWORD *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;

  *a2 = *(_DWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 72);
  *a3 = *(_QWORD *)(a1 + 64);
  *a4 = v4;
  return 0;
}

uint64_t CTParseAmfiCMS(uint64_t a1, uint64_t a2, int a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _DWORD *a8, _QWORD *a9)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  v18[0] = a1;
  v18[1] = a2;
  LODWORD(v19) = a3;
  result = CTAmfiInitializeContext((uint64_t)v18, a1, a2, a3, 0);
  if ((_DWORD)result)
    return result;
  if (!a7 || !a6 || (v15 = *((_QWORD *)&v20 + 1)) == 0 || (v16 = v21) == 0)
  {
    if (!a6 || !a7)
      goto LABEL_10;
    v15 = 0;
    v16 = 0;
  }
  *a6 = v15;
  *a7 = v16;
LABEL_10:
  if (a5)
  {
    if (a4)
    {
      if (*((_QWORD *)&v19 + 1))
      {
        v17 = v20;
        if ((_QWORD)v20)
        {
          *a4 = *((_QWORD *)&v19 + 1);
          *a5 = v17;
        }
      }
    }
  }
  if (a9)
    *a9 = *((_QWORD *)&v23 + 1);
  if (a8)
    *a8 = v23;
  return result;
}

uint64_t CTVerifyAmfiCMS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _DWORD *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v12;
  _QWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v13[0] = a1;
  v13[1] = a2;
  LODWORD(v14) = a5;
  result = CTAmfiVerifyCMS((uint64_t)v13, a3, a4);
  if (!(_DWORD)result && a6 && a7)
  {
    if (a8)
    {
      *a6 = DWORD2(v16);
      v12 = *((_QWORD *)&v17 + 1);
      *a7 = v17;
      *a8 = v12;
    }
  }
  return result;
}

uint64_t CTVerifyAmfiCertificateChain(uint64_t a1, uint64_t a2, char a3, int a4, _QWORD *a5)
{
  uint64_t result;
  _QWORD v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  v7[0] = a1;
  v7[1] = a2;
  LODWORD(v8) = a4;
  BYTE4(v8) = a3;
  result = CTAmfiVerifyCertificateChain((uint64_t)v7);
  if (a5)
  {
    if (!(_DWORD)result)
      *a5 = v13;
  }
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2;
  int *result;

  v2 = 0;
  while (1)
  {
    result = (int *)compare_octet_string_raw((uint64_t)&dword_1EA989120[v2 / 4 + 2], *(const void **)a1, *(_QWORD *)(a1 + 8));
    if (!(_DWORD)result)
      break;
    v2 += 32;
    if (v2 == 160)
      return 0;
  }
  if (v2 <= ~(unint64_t)dword_1EA989120)
    return &dword_1EA989120[v2 / 4];
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1;

  v1 = 0;
  while (dword_1EA989120[v1 / 4] != (_DWORD)result)
  {
    v1 += 32;
    if (v1 == 160)
      return 0;
  }
  if (v1 <= ~(unint64_t)dword_1EA989120)
    return &dword_1EA989120[v1 / 4];
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v6;

  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    v6 = &CTOidSha1;
    v4 = 5;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha256;
LABEL_18:
    v4 = 9;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_18;
  }
  v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL))
      return 0;
    v6 = &CTOidSha512;
    goto LABEL_18;
  }
  v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t vars0;

  result = 0;
  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (result = sub_1DF31C658((uint64_t)&off_1EA98A568, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              v21 = 0xAAAAAAAAAAAAAAAALL;
              v22 = 0xAAAAAAAAAAAAAAAALL;
              v10 = a5[9];
              v9 = a5[10];
              if (__CFADD__(v10, v9))
                goto LABEL_31;
              if (v10 > v10 + v9)
                goto LABEL_32;
              v21 = a5[9];
              v22 = v10 + v9;
              if (!v9 || (result = ccder_blob_check_null(), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    result = ccder_decode_rsa_pub_n();
                    if (!result)
                      return result;
                    v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    v12 = result << 6;
                    if (result << 6 < 0x400)
                      return 0;
                    v25 = 0xAAAAAAAAAAAAAAAALL;
                    v26 = -21846;
                    v24 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      v13 = a5[4];
                      LOBYTE(v25) = v13;
                      if ((unint64_t)&v24 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          v14 = __memcpy_chk();
                          if (v12 > 0x1068)
                            return 0;
                          result = MEMORY[0x1E0C80A78](v14);
                          v16 = (unint64_t *)((char *)&v20 - v15);
                          v17 = 0;
                          *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            v19 = &v16[v17 / 8];
                            *(_OWORD *)v19 = v18;
                            *((_OWORD *)v19 + 1) = v18;
                            v17 += 32;
                          }
                          while (v15 != v17);
                          if (v15 >= 1)
                          {
                            *v16 = v11;
                            if (ccrsa_import_pub())
                              return 0;
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs())
                              return v23 != 0;
                            result = 0;
                            v23 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1DF31C658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  BOOL v7;

  v6 = 0;
  v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3))
      break;
    v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0;
  int is_supported;
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;

  v0 = ccec_x963_import_pub_size();
  is_supported = ccec_keysize_is_supported();
  v2 = &CTOidSECP256r1;
  v3 = &CTOidSECP521r1;
  v4 = &CTOidSECP384r1;
  if (v0 != 384)
    v4 = 0;
  if (v0 != 521)
    v3 = v4;
  if (v0 != 256)
    v2 = v3;
  if (is_supported)
    return v2;
  else
    return 0;
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  result = 0;
  v18 = *MEMORY[0x1E0C80C00];
  HIBYTE(v17) = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (result = sub_1DF31C658((uint64_t)&off_1EA98A5E8, a5 + 24, a5 + 56), (_DWORD)result))
            {
              result = sub_1DF31C934((int **)(a5 + 72));
              if (result)
              {
                v8 = *(_QWORD *)result;
                if (*(_QWORD *)result >> 61 || !is_mul_ok(8 * v8, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  v9 = 24 * v8;
                  v10 = __CFADD__(v9, 16);
                  v11 = v9 + 16;
                  if (!v10 && v11 < 0xFFFFFFFFFFFFFFF0)
                  {
                    result = MEMORY[0x1E0C80A78](result);
                    v14 = (uint64_t *)((char *)&v17 - v12);
                    v15 = 0;
                    do
                    {
                      v16 = &v14[v15 / 8];
                      *v16 = 0xAAAAAAAAAAAAAAAALL;
                      v16[1] = 0xAAAAAAAAAAAAAAAALL;
                      v15 += 16;
                    }
                    while (v12 != v15);
                    if (v13 >= 0x10)
                    {
                      *v14 = result;
                      if (v12 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          result = ccec_x963_import_pub_size();
                          if (result == 256 && *(_QWORD *)(a5 + 96) == 64)
                          {
                            if (*(_QWORD *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite())
                                return HIBYTE(v17) != 0;
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify())
LABEL_24:
                            HIBYTE(v17) = 0;
                        }
                        return HIBYTE(v17) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1DF31C934(int **a1)
{
  int *v1;
  int *v3;
  int v5;
  int v6;

  if (!a1)
    return 0;
  v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(_QWORD *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793)
      JUMPOUT(0x1E0BFE5DCLL);
    return 0;
  }
  v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497)
    JUMPOUT(0x1E0BFE5E8);
  v5 = *v3;
  v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713)
    return 0;
  return ccec_cp_521();
}

uint64_t compressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = (_QWORD *)sub_1DF31C934(a2);
  if (!v6)
    return 655366;
  v7 = v6;
  v8 = *v6;
  if (*v6 >> 61 || !is_mul_ok(8 * v8, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  v9 = 24 * v8;
  v10 = __CFADD__(v9, 16);
  v11 = v9 + 16;
  if (v10 || v11 >= 0xFFFFFFFFFFFFFFF0)
LABEL_19:
    __break(0x5500u);
  result = MEMORY[0x1E0C80A78](v6);
  v15 = (_QWORD *)((char *)v18 - v13);
  v16 = 0;
  do
  {
    v17 = &v15[v16 / 8];
    *v17 = 0xAAAAAAAAAAAAAAAALL;
    v17[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 += 16;
  }
  while (v13 != v16);
  if (v14 < 0x10)
    goto LABEL_21;
  *v15 = v7;
  if (v13 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  result = ccec_import_pub();
  if (!(_DWORD)result)
  {
    result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4)
        return ccec_compressed_x962_export_pub();
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t *)sub_1DF31C934(a2);
  if (!v6)
    return 655366;
  v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL))
LABEL_22:
    __break(0x550Cu);
  v8 = 24 * v7;
  v9 = __CFADD__(v8, 16);
  v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  result = MEMORY[0x1E0C80A78](v6);
  v14 = (_QWORD *)((char *)v18 - v12);
  v15 = 0;
  do
  {
    v16 = &v14[v15 / 8];
    *v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10)
    goto LABEL_24;
  *v14 = result;
  if (v12 >= 1)
  {
    v17 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v17)
    {
      result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4)
            v17 = 0;
          else
            v17 = 393220;
          ccec_export_pub();
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  int v4;
  int v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  int v12;
  char *v13;
  char *v15;
  int v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  size_t v26;
  __int16 v27;
  char *v28;
  char *v29;
  unint64_t v30[3];
  __int16 v31;
  char *v32;
  unint64_t v33;
  size_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  char *v37;
  char *v38;
  unint64_t v39;
  unsigned __int8 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_114;
  if (&a1[a2] < a1)
    goto LABEL_112;
  v4 = 65537;
  v28 = a1;
  v29 = &a1[a2];
  v27 = 0;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  v7 = sub_1DF31D370((uint64_t)&v28, 0x2000000000000010, (_BYTE *)&v27 + 1, &v26);
  result = 65537;
  if (v7)
  {
    v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26))
      goto LABEL_114;
    if (v28 > &v28[v26] || &v28[v26] > v29)
      goto LABEL_112;
    v24 = v28;
    v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24)
        goto LABEL_112;
      if (compare_octet_string_raw((uint64_t)&off_1EA98A668, v24, v26))
        return 65539;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v24 += v26;
      if (!sub_1DF31D370((uint64_t)&v24, 0xA000000000000000, &v27, &v26))
        return 65540;
      v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v22 = v24;
      v23 = &v24[v26];
      v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((sub_1DF31D370((uint64_t)&v22, 0x2000000000000010, (_BYTE *)&v31 + 1, v30) & 1) == 0)
        return 131073;
      if (__CFADD__(v22, v30[0]))
        goto LABEL_114;
      v9 = 131080;
      if (&v22[v30[0]] != v23)
        return 131082;
      v10 = a3 + 11;
      if (!ccder_blob_decode_uint64())
        return 131074;
      result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!sub_1DF31F0A8((unint64_t *)&v22, 0x2000000000000011, 0, 125))
          return 131075;
        v35 = 0;
        v34 = 0;
        if ((sub_1DF31D370((uint64_t)&v22, 0x2000000000000010, &v35, &v34) & 1) == 0)
          return 131076;
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34))
          goto LABEL_114;
        if (v22 > &v22[v34] || &v22[v34] > v23)
          goto LABEL_112;
        v32 = v22;
        v33 = (unint64_t)&v22[v34];
        if (!ccder_blob_decode_tl())
          return 131077;
        if (v33 < (unint64_t)v32 || v34 > v33 - (unint64_t)v32)
          goto LABEL_112;
        if (compare_octet_string_raw((uint64_t)&off_1EA98A678, v32, v34))
          return 131078;
        if (__CFADD__(v32, v34))
          goto LABEL_114;
        v11 = &v32[v34];
        if (v32 > &v32[v34] || (unint64_t)v11 > v33)
          goto LABEL_112;
        v32 += v34;
        v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          v40 = 0;
          v38 = (char *)v33;
          v39 = 0;
          v37 = v11;
          if (sub_1DF31D370((uint64_t)&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39))
                goto LABEL_114;
              if (&v37[v39] != (char *)v33)
                return v9;
            }
            if (v37 > v38)
              goto LABEL_112;
            v32 = v37;
            v33 = (unint64_t)v38;
            v36 = 0;
            v16 = v40;
            if (v40 && !sub_1DF31D370((uint64_t)&v32, 0x2000000000000004, &v36, &v39))
              return 131079;
            v41 = 0;
            if (!ccder_blob_decode_tl())
              return 131090;
            v17 = v32;
            v18 = v33;
            if (v33 < (unint64_t)v32)
              goto LABEL_112;
            v19 = v41;
            if (v41 > v33 - (unint64_t)v32)
              goto LABEL_112;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            v20 = &v17[v19];
            if ((unint64_t)v20 > v18 || v17 > v20)
              goto LABEL_112;
            v32 = v20;
            if ((sub_1DF31D40C((unint64_t *)&v32, v36) & 1) == 0)
              return 131089;
          }
          else
          {
            if (!v12)
              return v9;
            v16 = v40;
          }
          if ((sub_1DF31D40C((unint64_t *)&v32, v16 != 0) & 1) == 0)
            return 131088;
          v11 = v32;
        }
        if (v11 > v23 || v22 > v11)
          goto LABEL_112;
        v22 = v11;
        if ((sub_1DF31D40C((unint64_t *)&v22, v12 != 0) & 1) == 0)
          return 131081;
        v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23)
          goto LABEL_112;
        v37 = v22;
        v38 = v23;
        if ((sub_1DF31D370((uint64_t)&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          v13 = v22;
          v15 = v23;
          goto LABEL_86;
        }
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38)
            goto LABEL_112;
          v32 = v37;
          v33 = (unint64_t)&v37[v30[0]];
          if (!sub_1DF31EE10((unint64_t *)&v32, a3[1], *a3, a3 + 3, a3 + 2))
            return 131085;
          if (!sub_1DF31D40C((unint64_t *)&v32, v31))
            return 131086;
          v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32)
              goto LABEL_112;
            v15 = v38;
            if (v32 > v38)
              goto LABEL_112;
            v22 = v32;
            v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              v37 = v13;
              v38 = v15;
              if (sub_1DF31F0A8((unint64_t *)&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38)
                  goto LABEL_112;
                v22 = v37;
                v23 = v38;
              }
              if (!sub_1DF31F0A8((unint64_t *)&v22, 0x2000000000000011, &v30[1], 125))
                return 131083;
              if (v30[2] >= v30[1])
              {
                v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((sub_1DF31D40C((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0)
                    return 131084;
                  if (!sub_1DF31D40C((unint64_t *)&v22, v27))
                    return 65541;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    v24 = v22;
                    if (sub_1DF31D40C((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29)
                        return 65543;
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t sub_1DF31D370(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  int v8;
  uint64_t result;

  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL)
      return sub_1DF31EC54(a1, a3, a4);
  }
  return result;
}

uint64_t sub_1DF31D40C(unint64_t *a1, int a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;

  if (!a2)
    return 1;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return result;
  v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1])
    goto LABEL_12;
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int *digest;
  int *v14;
  unsigned int v15;
  uint64_t result;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int *v33;
  unsigned int v34;
  unint64_t v35;
  _OWORD *v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned __int8 v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v84 = 0xAAAAAAAAAAAAAAAALL;
  v85 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (__CFADD__(v4, v3))
    goto LABEL_93;
  if (v4 > v4 + v3)
    goto LABEL_92;
  v84 = *(_QWORD *)(a1 + 40);
  v85 = v4 + v3;
  v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    v48 = 0;
    result = 0;
    if (v3)
      return (v48 << 8) | 0x30008;
    return result;
  }
  v6 = 0;
  v60 = 0;
  v7 = 256;
  while (1)
  {
    v71 = 0;
    v82 = 0u;
    v83 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((sub_1DF31D370((uint64_t)&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      v49 = 196609;
      return v7 | v49;
    }
    v69 = 0xAAAAAAAAAAAAAAAALL;
    v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72))
      goto LABEL_93;
    if (v84 > v84 + v72 || v84 + v72 > v85)
      goto LABEL_92;
    v69 = v84;
    v70 = v84 + v72;
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      v49 = 196610;
      return v7 | v49;
    }
    v9 = v69;
    v8 = v70;
    v67 = 0xAAAAAAAAAAAAAAAALL;
    v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v67 = v69;
    v68 = v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl())
      break;
    v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9))
      goto LABEL_94;
    if (v72 + v10 - v9 > v8 - v9)
      goto LABEL_92;
    *((_QWORD *)&v73 + 1) = v9;
    *(_QWORD *)&v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72))
      goto LABEL_93;
    if (v10 > v10 + v72 || v10 + v72 > v70)
      goto LABEL_92;
    v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      v49 = 196612;
      return v7 | v49;
    }
    v63 = 0xAAAAAAAAAAAAAAAALL;
    v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63)
        goto LABEL_92;
      *((_QWORD *)&v75 + 1) = v63;
      *(_QWORD *)&v76 = v72;
      if (__CFADD__(v63, v72))
        goto LABEL_93;
      if (v63 > v63 + v72 || v63 + v72 > v64)
        goto LABEL_92;
      v69 = v63 + v72;
      v70 = v64;
    }
    else
    {
      *((_QWORD *)&v75 + 1) = 0;
      *(_QWORD *)&v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69)
      goto LABEL_92;
    *((_QWORD *)&v78 + 1) = v69;
    *(_QWORD *)&v79 = v72;
    if (__CFADD__(v69, v72))
      goto LABEL_93;
    v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70)
      goto LABEL_92;
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (sub_1DF31F0A8(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64)
        goto LABEL_92;
      v69 = v63;
      v70 = v64;
    }
    if ((sub_1DF31D40C(&v69, v71) & 1) == 0)
    {
      v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      v14 = digest;
      v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result)
            return result;
          v17 = *(_QWORD *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              v29 = v60 - 1;
              v30 = *(_QWORD *)(a1 + 56);
              v31 = 176 * v29;
              if (__CFADD__(v30, v31))
                goto LABEL_93;
              v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30)
                goto LABEL_92;
              v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    v35 = *(_QWORD *)(a1 + 56);
                    if (__CFADD__(v35, v31))
                      goto LABEL_93;
                    v36 = (_OWORD *)(v35 + 176 * v29);
                    v37 = v35 + 176 * *(_QWORD *)(a1 + 64);
                    v38 = v37 >= (unint64_t)v36;
                    v39 = v37 - (_QWORD)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0)
                      goto LABEL_92;
                    v40 = v73;
                    v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *v36 = v40;
                    v42 = v76;
                    v43 = v77;
                    v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    v45 = v80;
                    v46 = v81;
                    v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              v19 = *(_QWORD *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60))
                goto LABEL_93;
              v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0)
                goto LABEL_92;
              v21 = v73;
              v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *v20 = v21;
              v23 = v76;
              v24 = v77;
              v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              v26 = v80;
              v27 = v81;
              v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69)
      goto LABEL_92;
    v84 = v69;
    v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85)
        continue;
    }
    if (v69 == v85)
    {
      if (v60)
        return 0;
      v50 = *(_QWORD *)(a1 + 64);
      if (!v50)
        return 0;
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        result = 0;
        v51 = *(_OWORD **)(a1 + 56);
        v52 = v73;
        v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *v51 = v52;
        v54 = v76;
        v55 = v77;
        v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        v57 = v80;
        v58 = v81;
        v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if ((ccder_blob_decode_tl() & 1) != 0)
  {
    v10 = v67;
    v11 = v68;
LABEL_17:
    if (v10 > v11)
      goto LABEL_92;
    v69 = v10;
    v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    v10 = v65;
    v11 = v66;
    goto LABEL_17;
  }
  v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t CertificateUsingKeyIdentifier;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v3 = *(_QWORD *)(a3 + 8);
  v4 = *(_QWORD *)(a3 + 16);
  if (__CFADD__(v3, v4))
LABEL_49:
    __break(0x5513u);
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_48;
  v20 = *(_QWORD *)(a3 + 8);
  v21 = v5;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)a3 != 3)
  {
    if (*(_QWORD *)a3 != 1)
      return 524289;
    v8 = 524293;
    if (!ccder_blob_decode_tl())
      return 524290;
    if (!ccder_blob_decode_tl())
      return 524291;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      v15 = v20;
      v16 = v19;
      if (__CFADD__(v20, v19))
        goto LABEL_49;
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl())
          return 524292;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          v17 = v20;
          v18 = v19;
          if (__CFADD__(v20, v19))
            goto LABEL_49;
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            v9 = *(_QWORD **)(a2 + 24);
            if (!v9)
              return v8;
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              v9 = (_QWORD *)v9[34];
              if (!v9)
                return v8;
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(_QWORD *)(a2 + 88) == 1)
    return 524298;
  v15 = v3;
  v16 = v5;
  if (ccder_blob_decode_tl())
  {
    v11 = v20;
    v10 = v21;
    goto LABEL_29;
  }
  v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl())
    return v8;
  v11 = v15;
  v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  v20 = v15;
  v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11)
    goto LABEL_48;
  v17 = v11;
  v18 = v19;
  if (__CFADD__(v11, v19))
    goto LABEL_49;
  if (v11 > v11 + v19 || v11 + v19 > v10)
    goto LABEL_48;
  v20 = v11 + v19;
  CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier)
    return 524295;
  v9 = (_QWORD *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21)
    return 524543;
  v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (_QWORD *)(a3 + 152));
  v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681)
    *(_DWORD *)(a3 + 168) = v13;
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  __int128 *v6;
  int *digest;
  unint64_t *v8;
  unint64_t *v9;
  _OWORD *v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28[2];
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _OWORD v34[4];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest)
    return 327682;
  v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  v9 = v8;
  memset(v34, 0, sizeof(v34));
  v10 = (_OWORD *)a2[13];
  v11 = a2[14];
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      v10 = v34;
      v13 = ccdigest();
      v11 = *v9;
      if (*v9 >= 0x41)
        goto LABEL_55;
      goto LABEL_16;
    }
    if (!v10)
      goto LABEL_31;
  }
  if (*v8 != v11)
  {
LABEL_31:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40)
    goto LABEL_55;
  v13 = __memcpy_chk();
LABEL_16:
  *(_QWORD *)(a3 + 128) = v10;
  *(_QWORD *)(a3 + 136) = v11;
  v15 = (_QWORD *)(a3 + 128);
  v16 = *(_QWORD *)(a3 + 48);
  if (!v16)
  {
    result = CMSBuildPath(v13, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0;
      case 524294:
        goto LABEL_52;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753)
          goto LABEL_43;
        v20 = 524296;
LABEL_42:
        *(_DWORD *)(a3 + 168) = v20;
LABEL_43:
        v21 = *v9;
        if (*v9 > 0x40)
          goto LABEL_55;
        v28[0] = (uint64_t)v34;
        v28[1] = v21;
        result = X509CertificateCheckSignatureDigest(29, *(_QWORD *)(a3 + 152), v28, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          v22 = *(_DWORD *)(a3 + 168);
          if (!v22 || v22 == 458753 || v22 == 327681)
            *(_DWORD *)(a3 + 168) = result;
          result = 0;
        }
        break;
      case 524297:
        v20 = 524297;
        goto LABEL_42;
      default:
        if ((_DWORD)result)
          goto LABEL_52;
        goto LABEL_43;
    }
    goto LABEL_52;
  }
  v25 = a1;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  v17 = *(_QWORD *)(a3 + 40);
  if (__CFADD__(v17, v16))
LABEL_56:
    __break(0x5513u);
  v18 = v17 + v16;
  if (v17 > v18)
    goto LABEL_55;
  v32 = *(_QWORD *)(a3 + 40);
  v33 = v18;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 >= v18)
  {
    result = 262156;
    goto LABEL_52;
  }
  v27 = 0x2000000000000010;
  v24 = 262146;
  v26 = 262147;
  v23 = 458754;
  if (!ccder_blob_decode_tl())
  {
    result = 262145;
    goto LABEL_52;
  }
  if (__CFADD__(v32, v31))
    goto LABEL_56;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if (v32 > v32 + v31 || v32 + v31 > v33)
  {
LABEL_55:
    __break(0x5519u);
    goto LABEL_56;
  }
  v29 = v32;
  v30 = v32 + v31;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v29, v31))
      goto LABEL_56;
    if (v29 <= v29 + v31 && v29 + v31 <= v30)
    {
      v29 += v31;
      result = 262150;
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  result = v24;
LABEL_52:
  if ((_OWORD *)*v15 == v34)
  {
    *v15 = 0;
    *(_QWORD *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v7;

  v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168))
        *(_DWORD *)(a3 + 168) = v7;
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9[0] = 0;
  return sub_1DF31E9C0(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t sub_1DF31E9C0(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t result;
  uint64_t v18;
  _OWORD v19[9];
  __int128 v20;
  __int128 v21;
  unint64_t v22[2];
  __int128 v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD v28[3];
  uint64_t v29;
  _QWORD v30[2];
  _BYTE __b[1216];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  v26 = 0;
  v25 = 0;
  v23 = 0u;
  v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  v20 = 0u;
  v21 = 0u;
  memset(v19, 0, sizeof(v19));
  v27 = v19;
  *(_QWORD *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0)
    goto LABEL_19;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result)
    return result;
  if (!a4)
    goto LABEL_7;
  result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0)
    return result;
  if (a4 < 0)
LABEL_19:
    __break(0x5519u);
  *((_QWORD *)&v28[0] + 1) = a3;
  *(_QWORD *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7)
        result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            v18 = *(_QWORD *)&v28[1];
            if (*(_QWORD *)&v28[1])
            {
              if (*((_QWORD *)&v28[0] + 1))
              {
                *a8 = *((_QWORD *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = 0;
  v9[0] = 0;
  v8 = 0;
  return sub_1DF31E9C0(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7[0] = 0;
  return sub_1DF31E9C0(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t sub_1DF31EC54(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  unint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;

  *a2 = 0;
  v3 = *(unsigned __int8 **)result;
  if (!*(_QWORD *)result)
    return 0;
  v4 = *(_QWORD *)(result + 8);
  if ((unint64_t)v3 >= v4)
    return 0;
  if (v3 == (unsigned __int8 *)-1)
    goto LABEL_42;
  v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }
  *(_QWORD *)result = v5;
  v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        v7 = v4 - (_QWORD)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 1)
          return 0;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        v8 = v3 + 2;
        if (v5 > v8 || (unint64_t)v8 > v4)
          goto LABEL_41;
        *(_QWORD *)result = v8;
        v7 = *v5;
        v5 = v8;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 2)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        v9 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = (unint64_t)v3[1] << 8;
        v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 3)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL)
          goto LABEL_42;
        v9 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        v11 = v3[3];
LABEL_40:
        v7 = v10 | v11;
        *(_QWORD *)result = v9;
        v5 = v9;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7)
    return 0;
  *a3 = v7;
  return 1;
}

uint64_t sub_1DF31EE10(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t **v19;
  unint64_t **v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v25;
  unint64_t **v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v5 = *a1;
  v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  v30 = *a1;
  v31 = v6;
  v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    v12 = 0;
LABEL_8:
    if (a5)
      *a5 = v12;
    return 1;
  }
  else
  {
    v12 = 0;
    v13 = 304 * a3;
    v14 = a2 + 304 * a3;
    v25 = ~a2;
    v27 = (unint64_t **)(a4 + 1);
    v23 = (unint64_t *)(a2 + 272);
    v15 = a2;
    while (1)
    {
      v29 = 0;
      if (!ccder_blob_decode_tag())
        return 0;
      if (!v32)
        goto LABEL_8;
      if (!sub_1DF31EC54((uint64_t)&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010)
        return 0;
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25)
        goto LABEL_44;
      if (v15 > v14)
        goto LABEL_43;
      if (v15 < a2)
        goto LABEL_43;
      v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16)
        goto LABEL_43;
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        *(_QWORD *)(v15 + 272) = 0;
        v17 = *v27;
        *(_QWORD *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *v17 = v15;
        *v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        v18 = *a4;
        *v23 = *a4;
        v19 = (unint64_t **)(v18 + 280);
        v7 = v18 == 0;
        v20 = v27;
        if (!v7)
          v20 = v19;
        *v20 = v23;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *a4 = v15;
        *(_QWORD *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, &v30, 0, 0))
        return 0;
      if (v6 < v5)
        goto LABEL_43;
      v21 = v30;
      v22 = v30 - v5;
      if (v30 - v5 > v6 - v5)
        goto LABEL_43;
      if (v15 + 304 > v14)
        goto LABEL_43;
      *(_QWORD *)v15 = v5;
      *(_QWORD *)(v15 + 8) = v22;
      v6 = v31;
      if (v21 > v31)
        goto LABEL_43;
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304;
        v5 = v21;
        if (v12 < a3)
          continue;
      }
      goto LABEL_8;
    }
  }
}

uint64_t sub_1DF31F0A8(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  int v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8 && v14 == a2)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    result = sub_1DF31EC54((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0)
      return 0;
    if (a3)
    {
      v10 = a1[1];
      if (*a1 > v10)
        goto LABEL_18;
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        result = sub_1DF31F0A8(a1, 0, 0, (char)(a4 - 1));
        if (!(_DWORD)result)
          return result;
        return (sub_1DF31D40C(a1, 1) & 1) != 0;
      }
      return 0;
    }
    v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 <= *(_QWORD *)(a2 + 8))
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1])
      goto LABEL_20;
    v5 = *a1;
    v6 = *a1;
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (a2)
    {
      if (v6 < v5)
        goto LABEL_20;
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      result = ccder_blob_decode_tl();
      if (!(_DWORD)result)
        return result;
      if (v5 != v6)
        return 0;
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(_QWORD *a1)
{
  if (*a1 > a1[1])
    goto LABEL_6;
  if ((ccder_blob_decode_tl() & 1) != 0)
    return 0;
  if (*a1 > a1[1])
LABEL_6:
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v11 = *a1;
    v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v11;
      if (v16 < v11)
        goto LABEL_42;
      *a3 = v11;
      a3[1] = 0;
      v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v12 = *a1;
    v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v12;
      if (v17 < v12)
        goto LABEL_42;
      *a3 = v12;
      a3[1] = 0;
      v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v13 = *a1;
    v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v13;
      if (v18 < v13)
        goto LABEL_42;
      *a3 = v13;
      a3[1] = 0;
      v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v14 = *a1;
    v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v14;
      if (v19 < v14)
        goto LABEL_42;
      *a3 = v14;
      a3[1] = 0;
      v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v15 = *a1;
    v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v15;
      if (v20 < v15)
        goto LABEL_42;
      *a3 = v15;
      a3[1] = 0;
      v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10[2];
  _OWORD v11[15];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_11;
  v10[0] = a1;
  v10[1] = a1 + a2;
  result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    result = 720914;
    if (*((_QWORD *)&v12 + 1))
    {
      v9 = v13;
      if ((_QWORD)v13)
      {
        result = 0;
        if (a5)
        {
          if (a6)
          {
            result = 0;
            *a5 = *((_QWORD *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  unint64_t v7[2];
  _OWORD v8[19];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_7;
  v7[0] = a1;
  v7[1] = a1 + a2;
  result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result)
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return sub_1DF31FB6C(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&unk_1EA98A6D8, 2);
}

uint64_t sub_1DF31FB6C(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  uint64_t result;
  uint64_t *v22;
  uint64_t v23;
  __int128 *v24;
  unint64_t v25;
  int v26;
  unint64_t v27[2];
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33[4];
  _QWORD __b[154];

  __b[152] = *MEMORY[0x1E0C80C00];
  result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_34;
  if (a1 + a2 < a1)
    goto LABEL_35;
  v30 = a1;
  v31 = a1 + a2;
  result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if ((_DWORD)result)
    return result;
  result = 327690;
  if (v30 != v31)
    return result;
  if (v32 != 2)
    return 327692;
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *v22 = (uint64_t)&__b[74];
  if ((_QWORD *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL)
LABEL_34:
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(_QWORD *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if ((_DWORD)result)
    return result;
  v23 = **(_QWORD **)(v33[1] + 8);
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0)
    goto LABEL_35;
  v28 = a3;
  v29 = a4;
  v24 = (__int128 *)oidForPubKeyLength();
  result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, v24, v23 + 16, (__int128 *)(v23 + 40), (__int128 *)(v23 + 56));
  if ((_DWORD)result)
    return result;
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0)
      goto LABEL_35;
    if (compare_octet_string_raw(v23 + 248, a9, a10))
      return 590085;
  }
  v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  v26 = result;
  if ((_DWORD)result)
    result = result;
  else
    result = 327691;
  if (!v25 || v26)
    return result;
  if (a11)
    *a11 = (*(_QWORD *)(v25 + 240) & a13) != 0;
  if (!a7 || !a8)
    return 0;
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304)
    goto LABEL_35;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result)
    return result;
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  result = sub_1DF321D00((uint64_t)v27, a7, a8);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, BOOL *a7)
{
  return sub_1DF31FB6C(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&unk_1EA98A6D8, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return sub_1DF31FB6C(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&unk_1EA98A710, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, _QWORD *a7, _QWORD *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return sub_1DF31FB6C(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&unk_1EA98A748, 0x10000000000);
}

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  _QWORD v9[2];
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = 327696;
  if (!result || !a2)
    return v3;
  v11 = 0;
  v12[0] = 0;
  v10 = 0;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    v5 = sub_1DF31FFDC((uint64_t)v9, v12);
    v6 = 327697;
    if (!v5 && !HIDWORD(v12[0]))
    {
      if (sub_1DF31FFDC((uint64_t)v9, &v11))
      {
        return 327698;
      }
      else
      {
        v7 = sub_1DF31FFDC((uint64_t)v9, &v10);
        v6 = 327699;
        if (!v7)
        {
          v8 = v10;
          if (v10 <= 0xFF)
          {
            v6 = 0;
            if (a3)
            {
              *(_DWORD *)a3 = v12[0];
              *(_QWORD *)(a3 + 8) = v11;
              *(_BYTE *)(a3 + 16) = (v8 & 8) != 0;
              *(_BYTE *)(a3 + 17) = (v8 & 4) != 0;
              *(_BYTE *)(a3 + 18) = v8 & 3;
              *(_QWORD *)(a3 + 24) = 0;
              *(_QWORD *)(a3 + 32) = 0;
            }
          }
        }
      }
    }
    return v6;
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_1DF31FFDC(uint64_t result, _QWORD *a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  _QWORD *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 *v7;
  char v8;
  unsigned __int8 *v9;
  uint64_t v10;
  signed int v11;
  char v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  unsigned __int8 *v17;
  BOOL v18;
  unsigned __int8 *v19;
  unsigned __int8 *v21;
  unsigned int v22;
  unint64_t v23;

  v2 = *(unsigned __int8 **)result;
  v3 = *(_QWORD *)(result + 8);
  if (*(_QWORD *)result > v3)
    goto LABEL_50;
  v4 = (_QWORD *)result;
  v5 = *(unsigned __int8 **)result;
  if (*(_QWORD *)result < v3)
  {
    v6 = v3 - (_QWORD)v2;
    v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      v7 = v5 + 1;
      if ((unint64_t)(v5 + 1) > v3 || v5 > v7)
        goto LABEL_50;
      *(_QWORD *)result = v7;
      ++v5;
      if (!--v6)
      {
        v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }
  if ((unint64_t)v5 > v3 || v2 > v5)
    goto LABEL_50;
  result = 327708;
  if (v5 == (unsigned __int8 *)v3)
    return result;
  v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16)
    return result;
  if (v5 == (unsigned __int8 *)-1)
    goto LABEL_51;
  v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_50:
    __break(0x5519u);
LABEL_51:
    __break(0x5513u);
LABEL_52:
    __break(0x5500u);
    return result;
  }
  v10 = 0;
  *v4 = v9;
  if (v2 >= v5 || (v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_46:
    result = 0;
    if (a2)
      *a2 = v10;
  }
  else
  {
    v12 = 0;
    v10 = 0;
    v13 = v11 >> 1;
    v14 = 8 * v13 - 8;
    while (1)
    {
      if ((v8 & 1) == 0 || (v12 & 1) != 0)
      {
        v16 = *v2;
        if (v16 > ~(unint64_t)asciiNibbleToByte)
          goto LABEL_51;
        v17 = &asciiNibbleToByte[v16];
        v18 = v17 < byte_1DF336EB2 && v17 >= asciiNibbleToByte;
        if (!v18)
          goto LABEL_50;
        if (v2 == (unsigned __int8 *)-1)
          goto LABEL_51;
        if (v2 + 1 > v5 || v2 > v2 + 1)
          goto LABEL_50;
        v15 = *v17;
        ++v2;
      }
      else
      {
        v15 = 0;
      }
      if (v2 >= v5)
        return 327703;
      v19 = &asciiNibbleToByte[*v2];
      if (v19 >= byte_1DF336EB2 || v19 < asciiNibbleToByte)
        goto LABEL_50;
      v21 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v21)
        goto LABEL_50;
      if (v15 > 0xF)
        return 327703;
      v22 = *v19;
      if (v22 > 0xF)
        return 327703;
      v23 = (unint64_t)(v22 | (16 * v15)) << (v14 & 0xF8);
      v18 = __CFADD__(v10, v23);
      v10 += v23;
      if (v18)
        goto LABEL_52;
      if (v21 < v5)
      {
        v14 -= 8;
        v12 = 1;
        v2 = v21;
        if (v13-- > 1)
          continue;
      }
      goto LABEL_46;
    }
  }
  return result;
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD *a10, __int128 *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t *v21;
  _BYTE *v22;
  BOOL v23;
  __int128 v24;
  char v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  _BYTE v32[32];
  uint64_t v33;
  _QWORD v34[2];
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[4];
  _BYTE v39[272];
  uint64_t v40;
  _QWORD v41[117];

  v41[116] = *MEMORY[0x1E0C80C00];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_42;
  v36 = a1 + a2;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v35 = a1;
  result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if ((_DWORD)result)
    return result;
  if (v35 != v36)
    return 327690;
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    v20 = v38[0];
    v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0])
      v21 = &v38[1];
    *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7)
      v23 = a8 == 0;
    else
      v23 = 1;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23)
      v25 = a3;
    else
      v25 = 1;
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      v27 = (_UNKNOWN **)*((_QWORD *)a11 + 5);
    }
    else
    {
      v26 = *((_QWORD *)a11 + 4);
      *(_QWORD *)&v32[8] = v34;
      *(_QWORD *)&v32[16] = v26;
      v27 = oidForPubKeyLength();
    }
    v28 = *((_QWORD *)a11 + 6);
    *(_QWORD *)&v32[24] = v27;
    v33 = v28;
    result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!(_DWORD)result)
    {
      v29 = (_QWORD *)v38[0];
      if (!a5 || !a6 || !v38[0] || (result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        result = 0;
        if (a9)
        {
          if (v29)
          {
            result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        v22 = (_BYTE *)*((_QWORD *)v22 + 34);
        if (!v22)
        {
          v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = v39;
  }
  result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, _QWORD *a4, _QWORD *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, xmmword_1EA98A780);
}

uint64_t CTEvaluateBAASystem(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, xmmword_1EA98A7B8);
}

unint64_t CTEvaluateBAASystemWithId(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, xmmword_1EA98A7B8);
  if (!(_DWORD)result)
    return sub_1DF320558(v7, v8, v9, a5);
  return result;
}

unint64_t sub_1DF320558(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;

  if ((a1 & 0x800000) != 0 && a4)
  {
    result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if ((_DWORD)result)
      return result;
  }
  else if (!a4)
  {
    return 0;
  }
  result = 0;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      result = 0;
      *(_QWORD *)(a4 + 24) = a2;
      *(_QWORD *)(a4 + 32) = a3;
      return result;
    }
    return 0;
  }
  return result;
}

unint64_t CTEvaluateBAASystemTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, xmmword_1EA98A7B8);
  if (!(_DWORD)result)
    return sub_1DF320558(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAAUser(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, xmmword_1EA98A7F0);
  if (!(_DWORD)result)
    return sub_1DF320558(v7, v8, v9, a5);
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, xmmword_1EA98A7F0);
  if (!(_DWORD)result)
    return sub_1DF320558(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAASepApp(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, xmmword_1EA98A828);
  if (!(_DWORD)result)
    return sub_1DF320558(v9, v10, v11, a7);
  return result;
}

uint64_t CTEvaluateBAA(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, uint64_t a10)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = CTEvaluateBAASystemTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 2:
      result = CTEvaluateBAAUserTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 3:
      result = CTEvaluateBAAAccessory(a2, a3, a4, a5, a6, a7, a8, a9);
      break;
    case 4:
      result = CTEvaluateBAASepApp(a2, a3, a4, a5, a6, a7, a10);
      break;
    default:
      result = 327712;
      break;
  }
  return result;
}

uint64_t CTEvaluateBAAAccessory(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a5, a6, a3, a4, 0, &v12, xmmword_1EA98A8D0);
  if (!(_DWORD)result && a7)
  {
    if (a8)
    {
      v11 = v13;
      *a7 = v12;
      *a8 = v11;
    }
  }
  return result;
}

uint64_t CTGetBAARootType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASystemRootSPKI))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BAUserRootSPKI))
    return 2;
  if (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&MFi4RootSpki))
    return 4 * (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASepAppRootSPKI) == 0);
  return 3;
}

uint64_t CTGetBAASubCAType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASystemRootSKID))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BAUserRootSKID))
    return 2;
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&MFi4RootSKID))
    return 4 * (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASepAppRootSKID) == 0);
  return 3;
}

uint64_t CTEvaluateDAK(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t v7;
  uint64_t result;
  __int128 v12;
  unint64_t v13;
  _BYTE *v14;
  int v15;
  unint64_t v16[2];
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD v27[19];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a1 + a2;
  if (a1 + a2 < a1)
    goto LABEL_31;
  result = CTEvaluateBAAUserTestRoot(a1, a2, a3, a4, a5, a6, a7);
  if ((_DWORD)result)
    return result;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[17] = v12;
  v27[18] = v12;
  v27[15] = v12;
  v27[16] = v12;
  v27[13] = v12;
  v27[14] = v12;
  v27[11] = v12;
  v27[12] = v12;
  v27[9] = v12;
  v27[10] = v12;
  v27[7] = v12;
  v27[8] = v12;
  v27[5] = v12;
  v27[6] = v12;
  v27[3] = v12;
  v27[4] = v12;
  v27[1] = v12;
  v27[2] = v12;
  v27[0] = v12;
  v18[0] = 0xAAAAAAAAAAAAAAAALL;
  v18[1] = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0;
  if (__CFADD__(a1, a2))
    goto LABEL_32;
  v16[0] = a1;
  v16[1] = v7;
  result = (uint64_t)X509ChainParseCertificateSet(v16, (unint64_t)v27, 1, v18, &v17);
  if (!(_DWORD)result)
  {
    if (!v18[0])
      return 327691;
    v25 = 0;
    v26 = 0;
    result = CTParseExtensionValue(*(_QWORD *)v18[0], *(_QWORD *)(v18[0] + 8), &CTOidAppleFDRIdentity, 9uLL, &v25, &v26);
    if (!(_DWORD)result)
    {
      v23 = 0xAAAAAAAAAAAAAAAALL;
      v24 = 0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v25, v26))
      {
        if (v25 > v25 + v26)
          goto LABEL_31;
        v23 = v25;
        v24 = v25 + v26;
        v22 = v26;
        result = ccder_blob_decode_tl();
        if (!(_DWORD)result)
          return 720929;
        if (v24 < v23)
          goto LABEL_31;
        v13 = v22;
        if (v22 > v24 - v23)
          goto LABEL_31;
        v25 = v23;
        v26 = v22;
        if (!__CFADD__(v23, v22))
        {
          v14 = (_BYTE *)v23;
          if (v23 < v23 + v22)
          {
            do
            {
              if ((unint64_t)v14 < v23)
                goto LABEL_31;
              if (*v14 == 45)
                goto LABEL_19;
              ++v14;
              --v13;
            }
            while (v13);
            v14 = (_BYTE *)(v23 + v22);
          }
LABEL_19:
          if (v14 != (_BYTE *)-1)
          {
            if ((unint64_t)(v14 + 1) >= v23 + v22)
              return 327711;
            if (v23 <= (unint64_t)(v14 + 1))
            {
              v21[0] = v14 + 1;
              v21[1] = v23 + v22;
              v19 = 0;
              v20 = 0;
              v15 = sub_1DF31FFDC((uint64_t)v21, &v20);
              result = 327697;
              if (!v15 && !HIDWORD(v20))
              {
                if (sub_1DF31FFDC((uint64_t)v21, &v19))
                {
                  return 327698;
                }
                else
                {
                  result = 0;
                  if (a7)
                  {
                    *(_DWORD *)a7 = v20;
                    *(_QWORD *)(a7 + 8) = v19;
                  }
                }
              }
              return result;
            }
LABEL_31:
            __break(0x5519u);
          }
        }
      }
LABEL_32:
      __break(0x5513u);
    }
  }
  return result;
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, xmmword_1EA98A860);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, xmmword_1EA98A898);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, xmmword_1EA98A898);
}

uint64_t CTParseFlagsForAccessoryCerts(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;

  v1 = result;
  if (!result || (result = *(_QWORD *)(result + 240)) == 0)
  {
    v3 = v1 + 136;
    v2 = *(unsigned __int8 **)(v1 + 136);
    if (*(_QWORD *)(v3 + 8) != 15 || v2 == 0)
      return 0;
    if ((unint64_t)v2 < 0xFFFFFFFFFFFFFFFELL)
    {
      if (v2[2] != 170)
        return 0;
      if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF9)
      {
        if (v2[6] != 170)
          return 0;
        if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF7)
        {
          if (v2[8] == 170)
          {
            if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF4)
            {
              if (v2[11] == 170)
                return 0x8000000;
              return 0;
            }
            goto LABEL_17;
          }
          return 0;
        }
      }
    }
LABEL_17:
    __break(0x5513u);
  }
  return result;
}

uint64_t CTParseAccessoryCerts(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, char **a5, unint64_t *a6, uint64_t *a7)
{
  char *v14;
  uint64_t result;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  unint64_t v36[4];
  unint64_t v37;
  unint64_t v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[1216];
  _QWORD v47[2];

  v47[0] = *MEMORY[0x1E0C80C00];
  bzero(v46, 0x4C0uLL);
  v45 = 0;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38[0] = 4;
  v38[1] = (unint64_t)v46;
  v14 = &a1[a2];
  v37 = 0;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v38, 1);
  if ((_DWORD)result)
  {
    memset(v36, 170, sizeof(v36));
    if (__CFADD__(a1, a2))
      goto LABEL_65;
    v36[0] = (unint64_t)a1;
    v36[1] = (unint64_t)&a1[a2];
    result = (uint64_t)X509ChainParseCertificateSet(v36, (unint64_t)v46, 4, &v36[2], &v37);
    if ((_DWORD)result)
      return result;
    if (v36[0] != v36[1])
      return 327690;
  }
  else
  {
    v37 = v39;
  }
  if (!v46[265])
  {
    if (v37 < 2)
    {
      v20 = 0;
      v17 = 0;
      v16 = v46;
      goto LABEL_19;
    }
    v18 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_67:
      __break(0x5515u);
      return result;
    }
    v17 = 0;
    v16 = v46;
    v20 = 1;
    v19 = 1;
    goto LABEL_20;
  }
  v16 = v46;
  if (!v37)
  {
    v20 = 0;
    v17 = 0;
    goto LABEL_19;
  }
  if (v37 > 5)
  {
LABEL_66:
    __break(0x5512u);
    goto LABEL_67;
  }
  v17 = 304 * v37 - 304;
  if (__CFADD__(v46, v17))
  {
LABEL_65:
    __break(0x5513u);
    goto LABEL_66;
  }
  v16 = &v46[v17];
  v18 = v37 - 2;
  if (v37 < 2)
  {
    v20 = 0;
LABEL_19:
    v18 = -1;
    v19 = -1;
    goto LABEL_20;
  }
  v19 = 0;
  v20 = 1;
LABEL_20:
  if (a5 && a6)
  {
    v21 = v20 ^ 1;
    if (v18 < 0)
      v21 = 1;
    if ((v21 & 1) != 0)
    {
      v27 = 0;
      v26 = 0;
LABEL_47:
      *a5 = v27;
      *a6 = v26;
      goto LABEL_48;
    }
    v22 = (unint64_t *)&v46[304 * (int)v19];
    if (v22 >= v47 || v22 < (unint64_t *)v46)
      goto LABEL_63;
    v23 = 304 * (int)v19;
    if (v23 > 0x4BF)
      goto LABEL_64;
    v24 = v23 | 8;
    if ((v23 | 8) > 0x4C0)
      goto LABEL_64;
    v25 = *v22;
    if (v19 <= v18)
    {
      v26 = 0;
      while (1)
      {
        if (&v46[v24 - 8] >= (_BYTE *)v47 || &v46[v24 - 8] < v46)
          goto LABEL_63;
        if (v24 > 0x4C0)
          goto LABEL_64;
        v29 = *(_QWORD *)&v46[v24];
        v30 = __CFADD__(v26, v29);
        v26 += v29;
        if (v30)
          break;
        v31 = v19 + 1;
        if (__OFADD__(v19, 1))
          break;
        v24 += 304;
        ++v19;
        if (v31 > v18)
          goto LABEL_41;
      }
      __break(0x5500u);
      goto LABEL_63;
    }
    v26 = 0;
LABEL_41:
    v32 = v25 - (_QWORD)a1;
    v33 = v25 >= (unint64_t)a1;
    v34 = v25 < (unint64_t)a1;
    if (v32 < 0)
      v33 = v34;
    if (v33)
    {
      v27 = &a1[v32];
      if (v14 < v27 || v27 < a1 || v26 > v14 - v27)
        goto LABEL_63;
      goto LABEL_47;
    }
    goto LABEL_65;
  }
LABEL_48:
  if (a7 && v16)
  {
    if (v16 >= (_BYTE *)v47 || v16 < v46)
      goto LABEL_63;
    *a7 = CTParseFlagsForAccessoryCerts((uint64_t)v16);
  }
  result = 0;
  if (a3 && a4 && v16)
  {
    if (v46 <= v16 && v16 + 304 <= (_BYTE *)v47)
    {
      if (v17 <= 0x4BF && (v17 | 8) <= 0x4C0)
      {
        result = 0;
        v35 = *((_QWORD *)v16 + 1);
        *a3 = *(_QWORD *)v16;
        *a4 = v35;
        return result;
      }
LABEL_64:
      __break(1u);
    }
LABEL_63:
    __break(0x5519u);
    goto LABEL_64;
  }
  return result;
}

uint64_t CTEvaluateAccessoryCert(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t **v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int16 v34;
  char v35;
  char v36;
  int v37;
  unint64_t *v38;
  unint64_t *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42[2];
  unint64_t v43[4];
  unint64_t v44;
  unint64_t v45;
  unint64_t v46[4];
  unint64_t *v47;
  uint64_t *v48;
  _BYTE v49[272];
  uint64_t v50;
  unint64_t v51[34];
  _QWORD v52[4];
  unint64_t v53[11];
  unint64_t v54[19];
  uint64_t v55;
  _QWORD v56[44];

  v56[42] = *MEMORY[0x1E0C80C00];
  bzero(v51, 0x390uLL);
  v47 = 0;
  v48 = 0;
  memset(v46, 170, sizeof(v46));
  if (__CFADD__(a1, a2))
    goto LABEL_56;
  if (a1 + a2 < a1)
    goto LABEL_57;
  v46[0] = a1;
  v46[1] = a1 + a2;
  result = X509CertificateParse(v51, v46);
  if ((_DWORD)result)
    return result;
  v20 = (uint64_t)v47;
  v21 = &v48;
  if (v47)
    v21 = (uint64_t **)(v47 + 35);
  *v21 = v52;
  v47 = v51;
  v52[0] = v20;
  v52[1] = &v47;
  v44 = 0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a5, a6))
    goto LABEL_56;
  if (a5 + a6 < a5)
    goto LABEL_57;
  v44 = a5;
  v45 = a5 + a6;
  if ((unint64_t *)((char *)v53 + 1) != 0 && (unint64_t)v51 >= 0xFFFFFFFFFFFFFECFLL)
    goto LABEL_56;
  result = X509CertificateParse(v53, &v44);
  if ((_DWORD)result)
    return result;
  v56[0] = 0;
  v56[1] = v48;
  *v48 = (uint64_t)v53;
  v48 = v56;
  bzero(v49, 0x390uLL);
  if (!a3 || !a4)
  {
LABEL_22:
    result = X509ChainBuildPath(v51, (uint64_t *)&v47, &v46[2]);
    if ((_DWORD)result)
      return result;
    v26 = 0;
    v27 = 0;
    v28 = 28;
    result = 327700;
    if (a7 <= 0x1FFFFFFF)
    {
      if (a7 <= 0x7FFFFFF)
      {
        if (a7)
        {
          v29 = 0;
          if (a7 != 4)
            return result;
        }
        else
        {
          v27 = 0;
          v26 = 0;
          v29 = 1;
        }
        goto LABEL_44;
      }
      if (a7 == 0x8000000)
      {
        v26 = 0;
        v29 = 0;
        v28 = 29;
        v27 = 1;
        goto LABEL_44;
      }
      if (a7 != 0x10000000)
        return result;
    }
    else
    {
      if (a7 > 0x3FFFFFFFFLL)
      {
        if (a7 == 0x400000000 || a7 == 0x800000000)
        {
          v29 = 0;
        }
        else
        {
          v29 = 0;
          if (a7 != 0x1000000000)
            return result;
        }
        goto LABEL_44;
      }
      if (a7 != 0x20000000)
      {
        if (a7 != 0x40000000)
          return result;
        v27 = 0;
        v29 = 0;
        v26 = 3;
        goto LABEL_44;
      }
      v27 = 1;
    }
    v29 = v27;
    v26 = 2;
    v27 = 0;
LABEL_44:
    if (!v55)
      v55 = a7;
    memset(v43, 170, sizeof(v43));
    v42[0] = 0xAAAAAAAAAAAAAAAALL;
    v42[1] = 0xAAAAAAAAAAAAAAAALL;
    X509CertificateParseSPKI(v54, &v43[2], v42, v43);
    v32 = v26;
    v33 = a7;
    v37 = -1431655766;
    v38 = v43;
    v34 = 0;
    v35 = v29;
    v36 = v27;
    v39 = &v43[2];
    v40 = v42;
    v41 = 0;
    result = X509ChainCheckPath(v28, (uint64_t *)&v46[2], (uint64_t)&v32);
    if (!(_DWORD)result)
    {
      v30 = v46[2];
      if (!a8 || !a9 || !v46[2] || (result = X509CertificateParseKey(v46[2], a8, a9), !(_DWORD)result))
      {
        result = 0;
        if (a10 && a11)
        {
          if (v30)
          {
            result = 0;
            v31 = *(_QWORD *)(v30 + 256);
            *a10 = *(_QWORD *)(v30 + 248);
            *a11 = v31;
          }
        }
      }
    }
    return result;
  }
  if (__CFADD__(a3, a4))
  {
LABEL_56:
    __break(0x5513u);
LABEL_57:
    __break(0x5519u);
  }
  if (a3 + a4 < a3)
    goto LABEL_57;
  v32 = a3;
  v33 = a3 + a4;
  if (a3 + a4 <= a3)
    goto LABEL_22;
  v22 = 0;
  v23 = &v50;
  while (1)
  {
    result = X509CertificateParse((unint64_t *)v23 - 34, &v32);
    if ((_DWORD)result)
      return result;
    v24 = v48;
    *v23 = 0;
    v23[1] = (uint64_t)v24;
    *v24 = (uint64_t)(v23 - 34);
    v48 = v23;
    v25 = v32 >= v33 || v22++ > 1;
    v23 += 38;
    if (v25)
      goto LABEL_22;
  }
}

uint64_t CTEvaluatePragueSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_1DF336F70;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_1DF336F80;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  result = 327700;
  v4 = a1[31];
  v5 = a1[32];
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 327707;
  v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0)
      return result;
    if (!__CFADD__(v4, v5))
    {
      v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13)
          return 327704;
        v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          v10 = 0;
          v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6)
              return 327705;
            if (v17 == 20)
              break;
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14)
              goto LABEL_39;
            v19 = (v18 - 48);
            v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20))
              goto LABEL_40;
            v21 = v19 * v20;
            v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15)
              goto LABEL_38;
            ++v17;
            if ((unint64_t)--v16 < v4)
              goto LABEL_23;
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5))
    goto LABEL_41;
  v8 = v4 + v5;
  if (v4 + v5 == -1)
    goto LABEL_41;
  v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    v12 = 0;
    v13 = 0;
    v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      v14 = (unint64_t)(*v9 & 0x7F) << v12;
      v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15)
        goto LABEL_38;
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4)
          continue;
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  v10 = 0;
LABEL_23:
  if (v10 == a2)
    return 0;
  else
    return 589829;
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[2];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 327702;
  if (*(_QWORD *)(a1 + 232) && *(_QWORD *)(a1 + 224))
  {
    v7[1] = a3;
    v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(_QWORD, int *, uint64_t))sub_1DF321990, (uint64_t)v7);
    if ((_BYTE)v8)
      v5 = 0;
    else
      v5 = 327706;
    if (v4)
      return v4;
    else
      return v5;
  }
  return v3;
}

uint64_t sub_1DF321990(uint64_t result, _QWORD *a2, unint64_t a3)
{
  char *v4;
  size_t v5;
  size_t v6;
  char *v7;
  char *v8;
  BOOL v9;
  int v11;
  size_t v12;
  unint64_t v13;
  _BYTE *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  size_t v22;
  size_t v23;

  if ((_DWORD)result != 2)
    return 1;
  v4 = *(char **)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v6 = ~*(_QWORD *)a3;
  if (v5 > v6)
    goto LABEL_50;
  v7 = &v4[v5];
  if (&v4[v5] == (char *)-1)
    goto LABEL_50;
  v8 = v7 - 1;
  if (v7)
    v9 = v8 >= v4;
  else
    v9 = 0;
  if (!v9 || a3 + 24 < a3)
    goto LABEL_49;
  v11 = *v8;
  result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result)
    goto LABEL_48;
  if (v11 != 46)
    goto LABEL_15;
  v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        v13 = a2[1];
        if (v13 < 3)
          return 1;
        v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42)
          return 1;
        if (v14 != (_BYTE *)-1)
        {
          v15 = v14 + 1;
          if (v14[1] == 46)
          {
            v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
              v16 = (uint64_t)v14;
            v17 = -v16;
            v18 = 2;
            result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14)
                goto LABEL_49;
              if (v14[v18] == 46)
              {
                if (v13 == v18)
                  return 1;
                v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4)
                      goto LABEL_49;
                    if (*v20 == 46)
                      break;
                    if (v5 == ++v19)
                    {
                      v19 = v5;
                      break;
                    }
                  }
                }
                v22 = v13 - 1;
                v9 = v5 >= v19;
                v23 = v5 - v19;
                if (!v9)
                  goto LABEL_51;
                if (v22 == v23)
                {
                  if (v19 > v6)
                    goto LABEL_50;
                  result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result)
                    goto LABEL_48;
                }
                if (v11 != 46)
                  return 1;
                if (!v23)
                  goto LABEL_51;
                if (v22 != v23 - 1)
                  return 1;
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22))
                    goto LABEL_48;
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18)
                return result;
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      result = 0;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t result;
  __int128 v13;
  unint64_t v14[2];
  _QWORD v15[3];
  _OWORD v16[19];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  _UNKNOWN **v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0xAAAAAAAA00AAAA01;
  v21 = &null_octet;
  v19 = xmmword_1DF336F90;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  v22 = &null_octet;
  v23 = &null_octet;
  v24 = &CTOctetServerAuthEKU;
  v17 = 0;
  v18 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!(_DWORD)result)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!(_DWORD)result)
      {
        result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result)
          return CTVerifyHostname((uint64_t)v16, a3, a4);
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t sub_1DF321D00(uint64_t result, _BYTE *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v14;
  unsigned int v15;
  unsigned int v16;

  v5 = *(_QWORD *)result;
  v4 = *(_QWORD *)(result + 8);
  if (__CFADD__(*(_QWORD *)result, v4))
    goto LABEL_31;
  v6 = v5 + v4;
  v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6)
        continue;
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1)
    goto LABEL_31;
  v8 = v7 + 1;
  v3 = 327693;
  result = 327693;
  if ((unint64_t)(v7 + 1) >= v6)
    return result;
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (_QWORD)v8))
    goto LABEL_31;
  if (v6 - (_QWORD)v8 != 2 * a3)
    return (v3 + 1);
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  v9 = v7 + 2;
  v10 = a2;
  while (1)
  {
    result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3])
      return result;
    v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8)
      goto LABEL_34;
    v12 = &asciiNibbleToByte[*v11];
    result = (uint64_t)byte_1DF336EB2;
    if (v12 >= byte_1DF336EB2 || v12 < asciiNibbleToByte)
      goto LABEL_34;
    if (v11 < v7)
      goto LABEL_34;
    v14 = &asciiNibbleToByte[*v9];
    result = (uint64_t)byte_1DF336EB2;
    if (v14 >= byte_1DF336EB2 || v14 < asciiNibbleToByte)
      goto LABEL_34;
    v15 = *v12;
    result = 327695;
    if (v15 > 0xF)
      return result;
    v16 = *v14;
    if (v16 > 0xF)
      return result;
    if (v10 < a2)
      goto LABEL_34;
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9)
      goto LABEL_31;
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  int v40;
  int v41;
  unint64_t v43;
  unint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _OWORD v70[10];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v68 = 0;
  v69 = 0;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v66 = *a2;
  v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return v10;
  v12 = v69;
  v13 = v66;
  v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v67)
    goto LABEL_186;
  v64 = v13;
  v65 = v15;
  v62 = v13;
  v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68))
      goto LABEL_187;
    v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63)
        goto LABEL_186;
      v64 = v62 + v68;
      v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl())
    return 720917;
  v18 = v64;
  v17 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v19 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v64;
  *(_QWORD *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19))
    goto LABEL_187;
  v20 = v18 + v19;
  if (v18 > v20 || v20 > v17)
    goto LABEL_186;
  v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl())
    return 720919;
  v22 = v64;
  v21 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v23 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v64;
  *(_QWORD *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23))
    goto LABEL_187;
  v24 = v22 + v23;
  if (v22 > v24 || v24 > v21)
    goto LABEL_186;
  v64 = v24;
  if (!ccder_blob_decode_tl())
    return 720920;
  v26 = v64;
  v25 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v27 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v64;
  *(_QWORD *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27))
    goto LABEL_187;
  v28 = v26 + v27;
  if (v26 > v28 || v28 > v25)
    goto LABEL_186;
  v64 = v28;
  if (!ccder_blob_decode_tl())
    return 720921;
  v29 = v64;
  v30 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v31 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v64;
  *(_QWORD *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31))
    goto LABEL_187;
  v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30)
    goto LABEL_186;
  v64 = v29 + v31;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return 720922;
  v33 = v64;
  v34 = v68;
  v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v32;
    *(_QWORD *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34))
      goto LABEL_187;
    v36 = v33 + v34;
    if (v33 > v36 || v36 > v65)
      goto LABEL_186;
    v63 = v65;
    v64 = v36;
    v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720923;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720924;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if (ccder_blob_decode_tl())
    {
      v60 = 0xAAAAAAAAAAAAAAAALL;
      v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68))
        goto LABEL_187;
      if (v62 > v62 + v68 || v62 + v68 > v63)
        goto LABEL_186;
      v60 = v62;
      v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68)
        return 720925;
      v37 = v60;
      if (__CFADD__(v60, v68))
LABEL_187:
        __break(0x5513u);
      v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61)
        goto LABEL_186;
      v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3)
        v39 = a4 == 0;
      else
        v39 = 1;
      v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        v53 = 0;
        v41 = 0;
        do
        {
          v58 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0;
          v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0)
            return 720926;
          v54 = 0xAAAAAAAAAAAAAAAALL;
          v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          if (v60 > v60 + v56 || v60 + v56 > v61)
            goto LABEL_186;
          v54 = v60;
          v55 = v60 + v56;
          if (!ccder_blob_decode_tl())
            return 720927;
          if (v55 < v54 || v68 > v55 - v54)
            goto LABEL_186;
          v58 = v54;
          v59 = v68;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (!sub_1DF322808(&v54, 1, &v57))
            return 720928;
          if (!ccder_blob_decode_tl())
            return 720929;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v55 != v54 + v68)
            return 720929;
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54)
              goto LABEL_186;
            v43 = v68;
            if (v68 > v55 - v54)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v54;
            *(_QWORD *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              v16 = 720930;
              if ((v41 & 1) != 0 || (sub_1DF32291C() & 1) == 0)
                return v16;
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              v16 = 720931;
              if ((v41 & 2) != 0 || (sub_1DF3229E8(&v54, (_QWORD *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
                return v16;
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              v16 = 720932;
              if ((v41 & 4) != 0
                || (sub_1DF322AB4(&v54, (unint64_t *)(a1 + 168), (_QWORD *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              v16 = 720933;
              if ((v41 & 8) != 0
                || (sub_1DF322BD8(&v54, (unint64_t *)(a1 + 184), (_QWORD *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              v16 = 720934;
              if ((v41 & 0x10) != 0
                || (sub_1DF322C98(&v54, (unint64_t *)(a1 + 208), (_QWORD *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              v16 = 720935;
              if ((v41 & 0x20) != 0
                || (sub_1DF322DA4(&v54, (unint64_t *)(a1 + 224), (_QWORD *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            v16 = 720936;
            if (!sub_1DF322E74((uint64_t)&v58, (uint64_t)v70, v53))
              return v16;
            result = sub_1DF322EFC((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!(_DWORD)result)
              return v16;
            if (v53 == 0xFF)
              goto LABEL_189;
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (v57)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v54 != v55)
            return 720926;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          v37 = v60 + v56;
          if (v60 > v60 + v56)
            goto LABEL_186;
          v38 = v61;
          if (v37 > v61)
            goto LABEL_186;
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38)
        return 720925;
      if (v37 > v65 || v64 > v37)
        goto LABEL_186;
      v64 = v37;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v16 = 720915;
      if (v64 != v65)
        return v16;
LABEL_170:
      if (__CFADD__(v66, v69))
        goto LABEL_187;
      if (v66 > v66 + v69 || v66 + v69 > v67)
        goto LABEL_186;
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v60 = 0;
      result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result)
        return 720938;
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v70[0] + 1) >= *(_QWORD *)&v70[0])
        {
          v51 = (v60 + 7) >> 3;
          if (v51 <= *((_QWORD *)&v70[0] + 1) - *(_QWORD *)&v70[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v70[0];
            *(_QWORD *)(a1 + 64) = v51;
            v52 = v67;
            if (v66 <= v67)
            {
              v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_1DF322808(_QWORD *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1])
    __break(0x5519u);
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2)
    return 0;
  if (a3)
    *a3 = 0;
  return 1;
}

uint64_t sub_1DF32291C()
{
  uint64_t result;

  result = ccder_blob_decode_bitstring();
  if ((_DWORD)result)
    return 0;
  return result;
}

uint64_t sub_1DF3229E8(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t result;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    result = sub_1DF322808(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3)
          return 0;
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_1DF322AB4(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_15;
    if (v7 - 0x5555555555555556 != a1[1])
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_16;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_16;
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_1DF322BD8(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_1DF322C98(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = ccder_blob_decode_tl();
  result = 0;
  if (v6)
  {
    if (*a1 > a1[1])
      goto LABEL_11;
    v10 = *a1;
    v11 = a1[1];
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_11;
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1])
LABEL_11:
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t sub_1DF322DA4(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_1DF322E74(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_1DF322EFC(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return sub_1DF324FA4(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)sub_1DF3251C0((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return sub_1DF324D3C((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return sub_1DF324E1C();
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
    return sub_1DF324988((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return sub_1DF324AC0((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return sub_1DF324C54((unint64_t *)result);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = ccder_blob_check_null();
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return sub_1DF325070((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = ccder_blob_check_null();
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = sub_1DF322808((_QWORD *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  if (!ccder_blob_decode_tl())
    return v8;
  v11 = *a2;
  result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556)
    return v8;
  v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556)
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v4 = *a1;
  v5 = a1[1];
  if (__CFADD__(*a1, v5))
    goto LABEL_31;
  v6 = v4 + v5;
  if (v4 > v6)
    goto LABEL_30;
  v10 = 655361;
  v14 = *a1;
  v15 = v6;
  if (!ccder_blob_decode_tl())
    return v10;
  if (!ccder_blob_decode_tl())
    return 655363;
  if (v14 >= 0x5555555555555556)
LABEL_31:
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15)
    goto LABEL_30;
  v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl())
    return 655362;
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13)
    goto LABEL_30;
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13)
    goto LABEL_30;
  if (!ccder_blob_decode_bitstring())
    return 655364;
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15)
    return 0;
  else
    return 655365;
}

uint64_t X509CertificateParseKey(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = 327691;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v8 = 0;
      v9 = 0;
      result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v9;
  uint64_t result;
  unsigned int (*v11)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v28 = 0uLL;
  v27 = 0uLL;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v23 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9)
    return v9;
  v9 = 655632;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string((uint64_t)&v28, (uint64_t)&ecPublicKey))
      return 655617;
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  memset(v14, 0, sizeof(v14));
  v19 = *a5;
  v15 = *a4;
  v17 = v28;
  v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }
  result = v25;
  if (v26 || !v25)
  {
    v12 = *a3;
    v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14))
        return 0;
      else
        return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  __int128 v8;
  uint64_t result;
  __int128 v10;
  uint64_t v11[2];
  _OWORD v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64;
  v10 = 0uLL;
  result = sub_1DF323F1C(a3, a4, (uint64_t)v11, &v10);
  if (!(_DWORD)result)
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  return result;
}

uint64_t sub_1DF323F1C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_8;
  result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(_QWORD *)(a3 + 8) < 0x20uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_12;
  result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(_QWORD *)(a3 + 8) < 0x14uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result)
    goto LABEL_10;
  result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result)
    return 656640;
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(_QWORD *)(a3 + 8) >= 0x30uLL)
  {
    *(_QWORD *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6)
{
  __int128 v11;
  uint64_t v12;
  unsigned int (*v13)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  v30 = v32;
  v31 = 64;
  v29 = 0uLL;
  v12 = sub_1DF323F1C(a4, (uint64_t)a5, (uint64_t)&v30, &v29);
  if ((_DWORD)v12)
    return v12;
  v12 = 655617;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string(a2, (uint64_t)&ecPublicKey))
      return v12;
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  v28 = 0;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v22 = 0u;
  v20 = 0u;
  v18 = 0u;
  v21 = *a5;
  v17 = 0;
  v23 = *a6;
  v19 = v29;
  if (a3)
    v14 = *a3;
  else
    v14 = null_octet;
  v22 = v14;
  result = *a1;
  v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    if (v13(result, v16, (uint64_t)v30, v31, &v17))
      return 0;
    else
      return 655648;
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(_QWORD, int *, uint64_t), uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v9[5];
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 224);
  v4 = *(_QWORD *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_11;
  v10 = *(_QWORD *)(a1 + 224);
  v11 = v5;
  while (1)
  {
    if (v10 >= v11)
      return 0;
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0)
      break;
    if ((a2(v9[0], &v9[1], a3) & 1) == 0)
      return 0;
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = *a1;
  v3 = a1[1];
  v20 = v3;
  if (__CFADD__(*a1, v3))
    goto LABEL_59;
  v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  v6 = 720901;
  v18 = *a1;
  v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20)
        return 720898;
      v2 = v18;
      if (__CFADD__(v18, v20))
        break;
      v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19)
        goto LABEL_58;
      v16 = v18;
      v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl())
          return 720899;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20 || v16 + v20 > v17)
          goto LABEL_58;
        v15 = v16 + v20;
        if (!ccder_blob_decode_tl())
          return 720900;
        v2 = v16 + v20;
        if (v16 > v15)
          goto LABEL_58;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20)
          goto LABEL_58;
        v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(_BYTE *)(v16 + 2) == 3)
        {
          v12 = v16 + v20;
          v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15)
              goto LABEL_58;
            v12 = v16 + v20;
            v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15)
                goto LABEL_58;
              v12 = v16 + v20;
              v13 = v16 + v20;
              if (!ccder_blob_decode_tl())
                return v6;
            }
          }
          if (__CFADD__(v12, v20))
            goto LABEL_59;
          v2 = v12 + v20;
          if (v15 != v12 + v20)
            return 720902;
          if (v13 < v12 || v20 > v13 - v12)
            goto LABEL_58;
          *a2 = v12;
          a2[1] = v20;
        }
        v7 = v18 + v20;
        if (v2 > v17 || v16 > v2)
          goto LABEL_58;
        v16 = v2;
      }
      if (v2 != v7)
        return 720903;
      v4 = v19;
      if (v2 > v19 || v18 > v2)
        goto LABEL_58;
      v18 = v2;
      if (v2 >= v19)
        goto LABEL_46;
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4)
    return 720904;
  if (a2[1] && *a2)
    return 0;
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  _BOOL8 result;
  time_t v5;
  time_t v6[2];

  result = 0;
  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1)
    return !X509CertificateGetNotBefore(a1, v6)
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x1E0C80C00];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return sub_1DF324868(v4, a2);
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x1E0C80C00];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return sub_1DF324868(v4, a2);
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2;

  v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v1 = 720906;
  if (!result)
    return v1;
  v2 = *(_QWORD *)(result + 72);
  v3 = *(_QWORD *)(result + 80);
  if (!v2 || v3 == 0)
    return v1;
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(_QWORD *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6))
        return 720907;
      if (ccder_blob_decode_Time(v6))
        return 0;
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_1DF324868(const char **a1, time_t *a2)
{
  uint64_t v2;
  const char *v4;
  __int128 v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  time_t v10;
  tm v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = 720909;
  if (!a1)
    return v2;
  v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF)
    return v2;
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  v7 = *a1;
  if (v4 == (const char *)13)
  {
    result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150)
      v11.tm_year -= 100;
  }
  else
  {
    result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(_QWORD)*a1])
      return 720910;
    v10 = timegm(&v11);
    if (v10 == -1)
      return 720911;
    v2 = 0;
    if (a2)
      *a2 = v10;
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL sub_1DF324988(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0)
    goto LABEL_5;
  if (*a1 > a1[1])
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    v8 = v12;
    v7 = v13;
    if (v12 > v13)
      goto LABEL_19;
    *a1 = v12;
    a1[1] = v13;
    v9 = v11;
  }
  else
  {
    v8 = *a1;
    v7 = a1[1];
    v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9))
    goto LABEL_20;
  if (v7 == v8 + v9)
  {
    if (!v9)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t sub_1DF324AC0(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8)
        goto LABEL_12;
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_1DF324C54(unint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556)
        return 0;
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_1DF324D3C(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556)
        return 0;
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL)
          goto LABEL_13;
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_1DF324E1C()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t sub_1DF324FA4(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1DF325070(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_17;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_18;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
            goto LABEL_18;
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *sub_1DF3251C0(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  BOOL v6;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v21;

  v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = result;
    v10 = 0;
    v11 = a2 + 304 * a3;
    v12 = ~a2;
    v13 = a4 + 1;
    v14 = (_QWORD *)(a2 + 272);
    v15 = a3 - 1;
    v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      v16 = v14 - 34;
      if (v14 != (_QWORD *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result)
        return result;
      if (v10)
      {
        if ((unint64_t)v16 < a2)
          goto LABEL_30;
        if ((unint64_t)(v14 + 4) > v11)
          goto LABEL_30;
        v17 = (_QWORD *)*v13;
        *v14 = 0;
        v14[1] = v17;
        if (v14 != (_QWORD *)272 && (unint64_t)v16 >= v11)
          goto LABEL_30;
        *v17 = v16;
        *v13 = (unint64_t)v14;
      }
      else
      {
        v18 = *a4;
        *(_QWORD *)(a2 + 272) = *a4;
        if (v18)
          v19 = (unint64_t *)(v18 + 280);
        else
          v19 = v13;
        *v19 = v21;
        *a4 = v16;
        *(_QWORD *)(a2 + 280) = a4;
      }
      v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        v6 = v15 == v10++;
        if (!v6)
          continue;
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  uint64_t i;

  for (i = *a1; i; i = *(_QWORD *)(i + 272))
  {
    if (*(_QWORD *)(i + 192) && !compare_octet_string(a2, i + 184))
      break;
  }
  return i;
}

_QWORD *X509ChainResetChain(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  *result = 0;
  result[1] = result;
  v2 = (_QWORD *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      v2 = (_QWORD *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(_QWORD *a1, uint64_t *a2, _QWORD *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t CertificateUsingKeyIdentifier;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t v15;
  unsigned int v16;

  if (!a1)
    return 327691;
  v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  v8 = (uint64_t)(a1 + 15);
  result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (v7 = (_QWORD *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        v7 = (_QWORD *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (sub_1DF325538(v10, 1))
            return 0;
          v15 = sub_1DF3255CC(v10);
          if (a4)
            v16 = 0;
          else
            v16 = 524296;
          if (v15)
            return 0;
          else
            return v16;
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          v7 = (_QWORD *)v7[34];
          if (!v7)
            goto LABEL_16;
        }
      }
      v12 = (_QWORD *)*a3;
      if (*a3)
        break;
LABEL_13:
      v13 = (_QWORD *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *v13 = v7;
      a3[1] = v7 + 36;
      v8 = (uint64_t)(v7 + 15);
      v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      result = 0;
      if (!v14)
        return result;
    }
    while (v12 != v7)
    {
      v12 = (_QWORD *)v12[36];
      if (!v12)
        goto LABEL_13;
    }
    return 524297;
  }
  return result;
}

uint64_t sub_1DF325538(uint64_t result, int a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;

  v2 = &numAppleRoots;
  if (!a2)
    v2 = &numAppleProdRoots;
  v3 = *v2;
  if (*v2)
  {
    v4 = result;
    for (i = (uint64_t *)&AppleRoots; i < (uint64_t *)&BlockedYonkersSPKI && i >= (uint64_t *)&AppleRoots; ++i)
    {
      v7 = *i;
      result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result)
        return v7;
      if (!--v3)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t sub_1DF3255CC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *i;
  uint64_t v5;

  v1 = numBAARoots;
  if (numBAARoots)
  {
    v2 = result;
    for (i = (uint64_t *)&BAARoots; i < (uint64_t *)&rsaEncryption && i >= (uint64_t *)&BAARoots; ++i)
    {
      v5 = *i;
      result = compare_octet_string(v2, *i + 184);
      if (!(_DWORD)result)
        return v5;
      if (!--v1)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  unint64_t v34[2];
  unint64_t v35[5];

  v6 = a2;
  v35[4] = *MEMORY[0x1E0C80C00];
  v8 = *a2;
  if (a3)
  {
    v9 = *(_QWORD *)(a3 + 48);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208))
          return 327701;
        v8 = *v6;
      }
    }
  }
  if (v8)
  {
    v31 = v6;
    v32 = a4;
    v11 = 0;
    v12 = 0;
    v33 = 0;
    v13 = -1;
    while (1)
    {
      v14 = *(_QWORD *)(v8 + 288);
      v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        v16 = 0;
        v15 = v8 + 304;
        v14 = v8;
        goto LABEL_11;
      }
      if (!a3)
        return v12 | 0x9000Du;
      if (*(_BYTE *)(a3 + 16))
      {
        v20 = sub_1DF325538(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(_QWORD *)(a3 + 24))
          goto LABEL_58;
        v20 = sub_1DF3255CC(v8 + 168);
      }
      v14 = v20;
      v33 |= v20 != 0;
      v15 = v20 + 304;
      if (v20)
        goto LABEL_10;
LABEL_58:
      if (!*(_BYTE *)(a3 + 19))
        return v12 | 0x9000Du;
      v14 = 0;
      v16 = 1;
LABEL_11:
      if (v11 && *(_QWORD *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          v30 = 589825;
          return v12 | v30;
        }
        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          v30 = 589826;
          return v12 | v30;
        }
      }
      v17 = *(_QWORD *)(v8 + 200);
      if (v17)
        v18 = v17 >= v11;
      else
        v18 = 1;
      if (!v18)
      {
        v30 = 589827;
        return v12 | v30;
      }
      if (*(_BYTE *)(v8 + 266))
      {
        v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(_QWORD *)(v8 + 168) && *(_QWORD *)(v8 + 176))
      {
        if (v14 >= v15)
          goto LABEL_100;
        if (compare_octet_string(v8 + 168, v14 + 184))
          return v12 | 0x9000Au;
      }
      if (a3 && v11 && (*(_QWORD *)(v8 + 240) & *(_QWORD *)(a3 + 8)) == 0)
        X509PolicySetFlagsForCommonNames(v8);
      if (v14 == v8 && !*(_QWORD *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8))
            return v12 | 0x90009u;
          v19 = *(_QWORD *)(a3 + 8);
          if (!v11 && (*(_QWORD *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            v19 = *(_QWORD *)(a3 + 8);
          }
          v13 &= *(_QWORD *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(_QWORD *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15)
          goto LABEL_100;
        result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result)
          return result;
      }
      v21 = v11 + 1;
      if (v11 == -1)
        goto LABEL_99;
      v8 = *(_QWORD *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3)
          goto LABEL_61;
        goto LABEL_87;
      }
    }
  }
  v21 = 0;
  v13 = -1;
  if (!a3)
    goto LABEL_87;
LABEL_61:
  if (*(_QWORD *)a3)
  {
    v22 = v21;
    if ((v8 & 1) != 0)
    {
      v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(_QWORD *)a3 != v22)
      return ((_DWORD)v22 << 8) | 0x90006u;
  }
  v23 = *(_QWORD *)(a3 + 24);
  if (!v23 || !*(_QWORD *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16))
      goto LABEL_87;
    v24 = (_DWORD)v21 << 8;
    v25 = **(_QWORD **)(v6[1] + 8);
LABEL_75:
    v27 = 184;
    if ((v8 & 1) != 0)
      v27 = 168;
    v28 = sub_1DF325538(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28)
      return v24 | 0x9000Bu;
    v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }
    v26 = 589836;
    return v24 | v26;
  }
  v24 = (_DWORD)v21 << 8;
  v25 = **(_QWORD **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16))
    goto LABEL_75;
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(_QWORD *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(_QWORD *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(_QWORD *)(a3 + 32), *(__int128 **)(a3 + 40), v25 + 16, (__int128 *)(v25 + 40), (__int128 *)(v25 + 56)))goto LABEL_72;
  }
  else if (!compare_octet_string(*(_QWORD *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(_QWORD *)(a3 + 40));
  }
LABEL_87:
  result = 0;
  if (a4)
    *a4 = v13;
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

BOOL sub_1DF325B64(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)"fbe71da1-0834-4d49-9b41-d3fa7f9e4d4f", a4);
  if (!objc_msgSend_caseInsensitiveCompare_(a1, v6, v5, v7))
    return 1;
  v10 = 0;
  do
  {
    v11 = v10;
    if (v10 == 13)
      break;
    v12 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v8, (uint64_t)off_1EA98A918[v10 + 1], v9);
    v15 = objc_msgSend_caseInsensitiveCompare_(a1, v13, v12, v14);
    v10 = v11 + 1;
  }
  while (v15);
  return v11 < 0xD;
}

void sub_1DF3268A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DF326B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF326C0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1DF326C1C(uint64_t a1)
{

}

void sub_1DF326C24(uint64_t a1, sqlite3_stmt *a2)
{
  void *v3;
  sqlite3_int64 v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = sqlite3_column_int64(a2, 0);
  objc_msgSend_numberWithLongLong_(v3, v5, v4, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t sub_1DF326C74(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  v3 = objc_retainAutorelease(*(id *)(a1 + 32));
  v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  return sqlite3_bind_text(a2, 1, v7, -1, 0);
}

uint64_t sub_1DF326CB0(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  v4 = objc_retainAutorelease(*(id *)(a1 + 32));
  v8 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  sqlite3_bind_text(a2, 1, v8, -1, 0);
  v9 = objc_retainAutorelease(*(id *)(a1 + 40));
  v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  return sqlite3_bind_text(a2, 2, v13, -1, 0);
}

uint64_t sub_1DF326D14(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;

  v3 = objc_retainAutorelease(*(id *)(a1 + 32));
  v7 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  return sqlite3_bind_text(a2, 1, v7, -1, 0);
}

void sub_1DF326D50(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (uint64_t)sqlite3_column_text(a2, 0);
  if (v3)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v4, v3, v5);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

uint64_t sub_1DF326DA0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  return 1;
}

void *MISProfileGetValue(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;

  v3 = a1;
  if (MISProfileValidateSignature_0(v3)
    || (objc_msgSend_payload(v3, v4, v5, v6), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend_payload(v3, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v13, a2, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t MISProfileValidateSignature_0(void *a1)
{
  _QWORD *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t fixed;
  const __CFData *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CFDataRef v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  CFDataRef v19;
  void *v20;
  NSObject *v21;
  const void *v22;
  int v23;
  const void *ApplePinned;
  int v25;
  const void *OSXProvisioningProfileSigning;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const void *v42;
  NSObject *v43;
  CFErrorRef v44;
  CFTypeID v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend_payload(v1, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    fixed = 3892346883;
    v8 = (const __CFData *)v1[1];
    if (!v8)
    {
      v6 = 3892346884;
      goto LABEL_40;
    }
    if (qword_1F0475438 != -1)
      dispatch_once(&qword_1F0475438, &unk_1EA98AB88);
    v9 = (id)qword_1F0475430;
    v12 = sub_1DF329590(v8);
    if (!v12 || !v9)
    {
      sub_1DF30EE34();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DF30C000, v21, OS_LOG_TYPE_ERROR, "Failure creating profile cache key.", buf, 2u);
      }

      v19 = 0;
      v6 = 3892346890;
      goto LABEL_39;
    }
    objc_msgSend_objectForKey_(v9, v10, (uint64_t)v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    if (v13)
    {
      v18 = objc_msgSend_intValue(v13, v14, v15, v16);
      v19 = sub_1DF329C50(v8);
      v20 = 0;
    }
    else
    {
      v22 = (const void *)SecPolicyCreateiPhoneProvisioningProfileSigning();
      v23 = sub_1DF329D2C();
      CFRelease(v22);
      if (v23)
      {
        ApplePinned = (const void *)SecPolicyCreateApplePinned();
        v25 = sub_1DF329D2C();
        CFRelease(ApplePinned);
        if (v25)
        {
          OSXProvisioningProfileSigning = (const void *)SecPolicyCreateOSXProvisioningProfileSigning();
          v6 = sub_1DF329D2C();
          CFRelease(OSXProvisioningProfileSigning);
          if ((_DWORD)v6)
          {
            v18 = 0;
            v19 = 0;
            goto LABEL_23;
          }
          v18 = 2;
        }
        else
        {
          v18 = 1;
        }
      }
      else
      {
        v18 = 0;
      }
      v19 = sub_1DF329C50(v8);
      objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v27, v18, v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v9, v29, (uint64_t)v20, (uint64_t)v12);
    }

    v6 = 0;
LABEL_23:

    if ((_DWORD)v6)
    {
LABEL_39:

      goto LABEL_40;
    }
    objc_msgSend_setFlavor_(v1, v30, v18, v31);
    if (!v19)
    {
      v6 = 3892346906;
      goto LABEL_40;
    }
    error = 0;
    if (objc_msgSend_flavor(v1, v32, v33, v34)
      && objc_msgSend_flavor(v1, v35, v36, v37) != 2)
    {
      v39 = CFPropertyListCreateWithDERData();
      if (!v39)
        goto LABEL_38;
      v42 = (const void *)v39;
      objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99E08], v40, v39, v41);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v42);
    }
    else
    {
      v38 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v19, 2uLL, 0, &error);
    }
    if (error)
    {
      if (v38)
        CFRelease(v38);
      sub_1DF30EE34();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = error;
        _os_log_error_impl(&dword_1DF30C000, v43, OS_LOG_TYPE_ERROR, "Error parsing profile payload: %@", buf, 0xCu);
      }

      v44 = error;
    }
    else
    {
      if (!v38)
        goto LABEL_38;
      v46 = CFGetTypeID(v38);
      if (v46 == CFDictionaryGetTypeID())
      {
        objc_msgSend_setPayload_(v1, v47, (uint64_t)v38, v48);

        fixed = objc_msgSend_fixUp(v1, v49, v50, v51);
        goto LABEL_38;
      }
      v44 = (CFErrorRef)v38;
    }
    CFRelease(v44);
LABEL_38:
    v6 = fixed;
    goto LABEL_39;
  }
  v6 = 0;
LABEL_40:

  return v6;
}

MISProfile *MISProfileCreate()
{
  const char *v0;
  uint64_t v1;
  MISProfile *v2;
  void *v3;
  const char *v4;
  uint64_t v5;

  v2 = objc_alloc_init(MISProfile);
  if (v2)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], v0, 0, v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayload_(v2, v4, (uint64_t)v3, v5);

  }
  return v2;
}

MISProfile *MISProfileCreateWithData(uint64_t a1, const void *a2)
{
  MISProfile *v3;
  NSData *v4;
  NSData *signature;

  v3 = objc_alloc_init(MISProfile);
  if (v3)
  {
    v4 = (NSData *)CFRetain(a2);
    signature = v3->signature;
    v3->signature = v4;

    MISProfileValidateSignature_0(v3);
  }
  return v3;
}

MISProfile *MISProfileCreateWithFile(uint64_t a1, const char *a2)
{
  MISProfile *result;
  MISProfile *v3;
  MISProfile *v4;

  objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x1E0C99D50], a2, (uint64_t)a2, 1, 0);
  result = (MISProfile *)objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v3 = result;
    v4 = MISProfileCreateWithData((uint64_t)result, result);
    CFRelease(v3);
    return v4;
  }
  return result;
}

MISProfile *MISProfileCreateMutableCopy(uint64_t a1, void *a2)
{
  id v2;
  MISProfile *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;

  v2 = a2;
  if (MISProfileValidateSignature_0(v2))
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_alloc_init(MISProfile);
    if (v3)
    {
      objc_msgSend_payload(v2, v4, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v11 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend_payload(v2, v8, v9, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionaryWithDictionary_(v11, v13, (uint64_t)v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPayload_(v3, v16, (uint64_t)v15, v17);

      }
    }
  }

  return v3;
}

BOOL MISProfileIsMutable(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) == 0;
}

uint64_t MISProfileSignWithKeyAndCertificates(void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  const __CFAllocator *v7;
  void *v8;
  CFDataRef v9;
  NSObject *v10;
  void *v11;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = 3892346890;
  v2 = a1;
  v6 = v2;
  if (v2[1])
  {
    v1 = 3892346883;
  }
  else
  {
    error = 0;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend_payload(v2, v3, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFPropertyListCreateData(v7, v8, kCFPropertyListXMLFormat_v1_0, 0, &error);

    if (error)
    {
      if (v9)
        CFRelease(v9);
      sub_1DF30EE34();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = error;
        _os_log_error_impl(&dword_1DF30C000, v10, OS_LOG_TYPE_ERROR, "Failure creating profile payload data: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    else if (v9)
    {
      v11 = (void *)v6[1];
      v6[1] = 0;

      CFRelease(v9);
      v1 = 49197;
    }
  }

  return v1;
}

uint64_t MISProfileSignWithRSACallBack(void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  const __CFAllocator *v7;
  void *v8;
  CFDataRef v9;
  NSObject *v10;
  void *v11;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = 3892346890;
  v2 = a1;
  v6 = v2;
  if (v2[1])
  {
    v1 = 3892346883;
  }
  else
  {
    error = 0;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend_payload(v2, v3, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFPropertyListCreateData(v7, v8, kCFPropertyListXMLFormat_v1_0, 0, &error);

    if (error)
    {
      if (v9)
        CFRelease(v9);
      sub_1DF30EE34();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = error;
        _os_log_error_impl(&dword_1DF30C000, v10, OS_LOG_TYPE_ERROR, "Failure creating profile payload data: %@", buf, 0xCu);
      }

      CFRelease(error);
    }
    else if (v9)
    {
      v11 = (void *)v6[1];
      v6[1] = 0;

      CFRelease(v9);
      v1 = 49197;
    }
  }

  return v1;
}

uint64_t MISProfileCopySignerSubjectSummary(uint64_t a1, CFStringRef *a2)
{
  uint64_t v3;
  SecPolicyRef BasicX509;
  int v5;
  const __CFArray *v6;
  __SecCertificate *ValueAtIndex;

  if (!a2)
    return 49174;
  v3 = 3892346883;
  BasicX509 = SecPolicyCreateBasicX509();
  v5 = SecCMSVerify();
  if (v5 == -26275)
  {
LABEL_10:
    CFRelease(BasicX509);
    return v3;
  }
  if (!v5)
  {
    v6 = SecTrustCopyCertificateChain(0);
    ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v6, 0);
    if (ValueAtIndex)
    {
      v3 = 0;
      *a2 = SecCertificateCopySubjectSummary(ValueAtIndex);
    }
    else
    {
      v3 = 3892346884;
    }
    CFRelease(v6);
    CFRelease(0);
    goto LABEL_10;
  }
  CFRelease(BasicX509);
  return 3892346906;
}

void *MISProfileCreateDataRepresentation(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 8);
  if (v1)
    v2 = v1;
  return v1;
}

uint64_t MISProfileWriteToFile(uint64_t a1, const char *a2)
{
  void *v2;

  v2 = *(void **)(a1 + 8);
  if (!v2)
    return 3892346884;
  objc_msgSend_writeToFile_atomically_(v2, a2, (uint64_t)a2, 0);
  return 0;
}

uint64_t MISProfileSetValue(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v5;
  _QWORD *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;

  v5 = 3892346882;
  v6 = a1;
  v10 = v6;
  if (!v6[1])
  {
    objc_msgSend_payload(v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)CFRetain(a3);
      objc_msgSend_payload(v10, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v12, a2);

      v5 = 0;
    }
    else
    {
      v5 = 3892346883;
    }
  }

  return v5;
}

uint64_t MISProfileRemoveValue(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  const char *v7;
  uint64_t v8;

  if (a1[1])
    return 3892346882;
  objc_msgSend_payload(a1, a2, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v6, v7, (uint64_t)a2, v8);

  return 0;
}

uint64_t MISProfileSetPayload(_QWORD *a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  if (a1[1])
    return 3892346882;
  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a1;
  objc_msgSend_dictionaryWithDictionary_(v4, v6, a2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPayload_(v5, v9, (uint64_t)v8, v10);

  return 0;
}

CFDictionaryRef MISProfileCopyPayload(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CFDictionaryRef Copy;
  const __CFAllocator *v6;
  const __CFDictionary *v7;

  v1 = a1;
  if (MISProfileValidateSignature_0(v1))
  {
    Copy = 0;
  }
  else
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend_payload(v1, v2, v3, v4);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    Copy = CFDictionaryCreateCopy(v6, v7);

  }
  return Copy;
}

uint64_t MISProfileGetTypeID()
{
  NSObject *v0;
  uint8_t v2[16];

  sub_1DF30EE34();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_fault_impl(&dword_1DF30C000, v0, OS_LOG_TYPE_FAULT, "MISProfileGetTypeID is not supported, the results this function returns is wrong and should not be relied on", v2, 2u);
  }

  return 0;
}

uint64_t MISProfileValidateSignatureWithAnchors()
{
  NSObject *v0;
  uint8_t v2[16];

  sub_1DF30EE34();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_fault_impl(&dword_1DF30C000, v0, OS_LOG_TYPE_FAULT, "This function is not supported, and does not behave as you expect. Use MISProfileValidateSignature.", v2, 2u);
  }

  return 3892346884;
}

uint64_t MISProfileValidateSignatureWithAnchorsAndPolicy()
{
  NSObject *v0;
  uint8_t v2[16];

  sub_1DF30EE34();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_fault_impl(&dword_1DF30C000, v0, OS_LOG_TYPE_FAULT, "This function is not supported, and does not behave as you expect. Use MISProfileValidateSignature.", v2, 2u);
  }

  return 3892346884;
}

uint64_t MISProfileIsDEREncoded(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  if (MISProfileValidateSignature_0(v1))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend_payload(v1, v2, v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
      v5 = objc_msgSend_flavor(v1, v6, v7, v8) == 1;
  }

  return v5;
}

uint64_t sub_1DF32813C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;

  v3 = bswap64(*a2);
  v4 = bswap64(*a3);
  if (v3 == v4)
  {
    v3 = bswap64(a2[1]);
    v4 = bswap64(a3[1]);
    if (v3 == v4)
    {
      v3 = bswap64(a2[2]);
      v4 = bswap64(a3[2]);
      if (v3 == v4)
      {
        v3 = bswap64(a2[3]);
        v4 = bswap64(a3[3]);
        if (v3 == v4)
          return 0;
      }
    }
  }
  if (v3 < v4)
    return 0xFFFFFFFFLL;
  return 1;
}

MISProfile *MISProfileCreateForProvisioning(const __CFAllocator *a1)
{
  MISProfile *v2;

  v2 = MISProfileCreate();
  if (v2)
    sub_1DF3281EC(a1, v2);
  return v2;
}

void sub_1DF3281EC(const __CFAllocator *a1, void *a2)
{
  const __CFUUID *v4;
  CFStringRef v5;
  CFNumberRef v6;
  CFAbsoluteTime Current;
  CFDateRef v8;
  int valuePtr;

  v4 = CFUUIDCreate(a1);
  v5 = CFUUIDCreateString(a1, v4);
  MISProfileSetValue(a2, (uint64_t)CFSTR("UUID"), v5);
  CFRelease(v5);
  CFRelease(v4);
  valuePtr = 1;
  v6 = CFNumberCreate(a1, kCFNumberIntType, &valuePtr);
  MISProfileSetValue(a2, (uint64_t)CFSTR("Version"), v6);
  CFRelease(v6);
  Current = CFAbsoluteTimeGetCurrent();
  v8 = CFDateCreate(a1, Current);
  MISProfileSetValue(a2, (uint64_t)CFSTR("CreationDate"), v8);
  CFRelease(v8);
}

MISProfile *MISProvisioningProfileCreateMutableCopy(const __CFAllocator *a1, void *a2)
{
  MISProfile *MutableCopy;
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  unsigned int valuePtr;

  MutableCopy = MISProfileCreateMutableCopy((uint64_t)a1, a2);
  if (MutableCopy)
  {
    sub_1DF3281EC(a1, MutableCopy);
    Value = (const __CFNumber *)MISProfileGetValue(MutableCopy, (uint64_t)CFSTR("TimeToLive"));
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if (sub_1DF328360(MutableCopy, valuePtr))
        {
          CFRelease(MutableCopy);
          return 0;
        }
      }
    }
  }
  return MutableCopy;
}

uint64_t sub_1DF328360(void *a1, uint64_t a2)
{
  uint64_t v4;
  void *Value;
  void *v6;
  __CFCalendar *v7;
  const __CFAllocator *v8;
  CFDateRef v9;
  CFDateRef v10;
  CFAbsoluteTime at;

  v4 = 3892346883;
  Value = MISProfileGetValue(a1, (uint64_t)CFSTR("CreationDate"));
  if (Value)
  {
    v6 = Value;
    v7 = CFCalendarCopyCurrent();
    at = MEMORY[0x1E0BFE0B4](v6);
    CFCalendarAddComponents(v7, &at, 0, "d", a2);
    CFRelease(v7);
    v8 = CFGetAllocator(a1);
    v9 = CFDateCreate(v8, at);
    if (v9)
    {
      v10 = v9;
      v4 = MISProfileSetValue(a1, (uint64_t)CFSTR("ExpirationDate"), v9);
      CFRelease(v10);
    }
    else
    {
      return 3892346890;
    }
  }
  return v4;
}

uint64_t MISProvisioningProfileAddProvisionedDevice(_QWORD *a1, const void *a2)
{
  uint64_t v2;
  __CFArray *Value;
  __CFArray *v7;
  CFTypeID v8;
  const __CFAllocator *v9;
  __CFArray *Mutable;
  __CFArray *v11;

  v2 = 3892346882;
  if (!a1[1])
  {
    Value = (__CFArray *)MISProfileGetValue(a1, (uint64_t)CFSTR("ProvisionedDevices"));
    if (Value)
    {
      v7 = Value;
      v8 = CFGetTypeID(Value);
      if (v8 == CFArrayGetTypeID())
      {
        CFArrayAppendValue(v7, a2);
        return 0;
      }
      else
      {
        return 3892346883;
      }
    }
    else
    {
      v9 = CFGetAllocator(a1);
      Mutable = CFArrayCreateMutable(v9, 0, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
        v11 = Mutable;
        CFArrayAppendValue(Mutable, a2);
        v2 = MISProfileSetValue(a1, (uint64_t)CFSTR("ProvisionedDevices"), v11);
        CFRelease(v11);
      }
      else
      {
        return 3892346890;
      }
    }
  }
  return v2;
}

uint64_t MISProvisioningProfileAddEntitlement(_QWORD *a1, const void *a2, const void *a3)
{
  uint64_t v3;
  __CFDictionary *Value;
  __CFDictionary *v9;
  CFTypeID v10;
  const __CFAllocator *v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;

  v3 = 3892346882;
  if (!a1[1])
  {
    Value = (__CFDictionary *)MISProfileGetValue(a1, (uint64_t)CFSTR("Entitlements"));
    if (Value)
    {
      v9 = Value;
      v10 = CFGetTypeID(Value);
      if (v10 == CFDictionaryGetTypeID())
      {
        CFDictionarySetValue(v9, a2, a3);
        return 0;
      }
      else
      {
        return 3892346883;
      }
    }
    else
    {
      v11 = CFGetAllocator(a1);
      Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (Mutable)
      {
        v13 = Mutable;
        CFDictionarySetValue(Mutable, a2, a3);
        v3 = MISProfileSetValue(a1, (uint64_t)CFSTR("Entitlements"), v13);
        CFRelease(v13);
      }
      else
      {
        return 3892346890;
      }
    }
  }
  return v3;
}

uint64_t MISProvisioningProfileIsAppleInternalProfile(void *a1)
{
  return sub_1DF328600(a1, (uint64_t)CFSTR("AppleInternalProfile"));
}

uint64_t sub_1DF328600(void *a1, uint64_t a2)
{
  const __CFBoolean *Value;
  const __CFBoolean *v3;
  CFTypeID v4;

  Value = (const __CFBoolean *)MISProfileGetValue(a1, a2);
  if (Value && (v3 = Value, v4 = CFGetTypeID(Value), v4 == CFBooleanGetTypeID()))
    return CFBooleanGetValue(v3);
  else
    return 0;
}

uint64_t MISProvisioningProfileSetProvisionsAllDevices(void *a1)
{
  return MISProfileSetValue(a1, (uint64_t)CFSTR("ProvisionsAllDevices"), (const void *)*MEMORY[0x1E0C9AE50]);
}

uint64_t MISProvisioningProfileProvisionsAllDevices(void *a1)
{
  return sub_1DF328600(a1, (uint64_t)CFSTR("ProvisionsAllDevices"));
}

uint64_t MISProvisioningProfileIncludesDevice(void *a1, const __CFString *a2)
{
  uint64_t v4;
  const __CFArray *Value;
  const __CFArray *v6;
  CFTypeID v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const __CFString *ValueAtIndex;

  if (sub_1DF328600(a1, (uint64_t)CFSTR("ProvisionsAllDevices")))
    return 1;
  Value = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)CFSTR("ProvisionedDevices"));
  if (!Value)
    return 0;
  v6 = Value;
  v7 = CFGetTypeID(Value);
  if (v7 != CFArrayGetTypeID())
    return 0;
  Count = CFArrayGetCount(v6);
  if (Count < 1)
    return 0;
  v9 = Count;
  v10 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v10);
    v4 = 1;
    if (CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo)
      break;
    if (v9 == ++v10)
      return 0;
  }
  return v4;
}

BOOL MISProvisioningProfileIncludesPlatform(void *a1, const __CFString *a2, uint64_t a3)
{
  const __CFArray *Value;
  const __CFArray *v6;
  CFTypeID v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  BOOL v11;
  const __CFString *ValueAtIndex;
  const __CFString *v13;
  CFTypeID v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v18[16];
  uint8_t buf[16];

  Value = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)CFSTR("Platform"));
  if (Value)
  {
    v6 = Value;
    v7 = CFGetTypeID(Value);
    if (v7 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount(v6);
      if (Count < 1)
      {
        return 0;
      }
      else
      {
        v9 = Count;
        v10 = 0;
        v11 = 1;
        do
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v10);
          if (ValueAtIndex && (v13 = ValueAtIndex, v14 = CFGetTypeID(ValueAtIndex), v14 == CFStringGetTypeID()))
          {
            if (CFStringCompare(v13, a2, 1uLL) == kCFCompareEqualTo)
              return v11;
          }
          else
          {
            sub_1DF30EE34();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v18 = 0;
              _os_log_impl(&dword_1DF30C000, v15, OS_LOG_TYPE_DEFAULT, "Encountered a null or non-string platform identifier.", v18, 2u);
            }

          }
          v11 = ++v10 < v9;
        }
        while (v9 != v10);
      }
      return v11;
    }
    else
    {
      sub_1DF30EE34();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DF30C000, v16, OS_LOG_TYPE_DEFAULT, "Encountered a non-array value for 'Platforms'.", buf, 2u);
      }

      return 0;
    }
  }
  return a3;
}

uint64_t MISProvisioningProfileGrantsEntitlement(void *a1, void *a2, void *a3)
{
  void *Value;
  CFTypeID v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  uint8_t v22[16];
  uint8_t buf[16];
  NSObject *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  Value = MISProfileGetValue(a1, (uint64_t)CFSTR("Entitlements"));
  if (!Value)
    return sub_1DF328600(a1, (uint64_t)CFSTR("AppleInternalProfile"));
  v7 = CFGetTypeID(Value);
  if (v7 != CFDictionaryGetTypeID())
    return sub_1DF328600(a1, (uint64_t)CFSTR("AppleInternalProfile"));
  v8 = a1;
  v9 = a2;
  v10 = a3;
  v25 = v9;
  v26[0] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v26, (uint64_t)&v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v13 = CESerializeCFDictionary();
  v14 = (_QWORD *)MEMORY[0x1E0DDFFA0];
  if (v13 != *MEMORY[0x1E0DDFFA0])
  {
    sub_1DF30EE34();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v15, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", buf, 2u);
    }
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  v15 = v24;
  *(_QWORD *)buf = 0;
  if (CEManagedContextFromCFData() != *v14)
  {
    sub_1DF30EE34();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_1DF30C000, v19, OS_LOG_TYPE_ERROR, "Invalid entitlements in a provisioning profile", v22, 2u);
    }

    goto LABEL_10;
  }
  objc_msgSend_derEntitlements(v8, v16, v17, v18);
  v20 = CEContextIsSubset() == *v14;
  CEReleaseManagedContext();
LABEL_11:

  if (v20)
    return 1;
  return sub_1DF328600(a1, (uint64_t)CFSTR("AppleInternalProfile"));
}

uint64_t MISProvisioningProfileSetApplicationIdentifierPrefixes(void *a1, const void *a2)
{
  return MISProfileSetValue(a1, (uint64_t)CFSTR("ApplicationIdentifierPrefix"), a2);
}

const __CFArray *MISProvisioningProfileCopyApplicationIdentifierPrefixes(void *a1)
{
  const __CFArray *result;

  result = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)CFSTR("ApplicationIdentifierPrefix"));
  if (result)
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], result);
  return result;
}

uint64_t MISProvisioningProfileSetTimeToLive(_QWORD *a1, unsigned int a2)
{
  const __CFAllocator *v3;
  CFNumberRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int valuePtr;

  valuePtr = a2;
  v3 = CFGetAllocator(a1);
  v4 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  v5 = MISProfileSetValue(a1, (uint64_t)CFSTR("TimeToLive"), v4);
  CFRelease(v4);
  if (!(_DWORD)v5)
  {
    v5 = sub_1DF328360(a1, valuePtr);
    if ((_DWORD)v5)
      MISProfileRemoveValue(a1, CFSTR("TimeToLive"), v6, v7);
  }
  return v5;
}

const void *MISProvisioningProfileGetTeamIdentifier(void *a1)
{
  const __CFArray *Value;
  const __CFArray *v2;

  Value = (const __CFArray *)MISProfileGetValue(a1, (uint64_t)CFSTR("TeamIdentifier"));
  if (Value && (v2 = Value, CFArrayGetCount(Value) == 1))
    return CFArrayGetValueAtIndex(v2, 0);
  else
    return 0;
}

BOOL MISProvisioningProfileHasPPQExemption(void *a1)
{
  _BOOL8 v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const __CFBoolean *v7;
  const __CFBoolean *v8;

  if (sub_1DF328600(a1, (uint64_t)CFSTR("LocalProvision")))
    return 0;
  if (sub_1DF328600(a1, (uint64_t)CFSTR("ProvisionsAllDevices")))
  {
    MISProfileGetValue(a1, (uint64_t)CFSTR("AppAudience"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v2 = v3
      && objc_msgSend_containsObject_(v3, v4, (uint64_t)CFSTR("InternalBuild"), v5)
      && (v7 = (const __CFBoolean *)sub_1DF328CC0(a1)) != 0
      && CFBooleanGetValue(v7) == 0;

  }
  else
  {
    v8 = (const __CFBoolean *)sub_1DF328CC0(a1);
    return !v8 || CFBooleanGetValue(v8) == 0;
  }
  return v2;
}

void *sub_1DF328CC0(void *a1)
{
  void *Value;
  void *v2;
  CFTypeID v3;
  NSObject *v4;
  __int16 v6[8];

  Value = MISProfileGetValue(a1, (uint64_t)CFSTR("PPQCheck"));
  v2 = Value;
  if (Value)
  {
    v3 = CFGetTypeID(Value);
    if (v3 != CFBooleanGetTypeID())
    {
      sub_1DF30EE34();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 0;
        _os_log_impl(&dword_1DF30C000, v4, OS_LOG_TYPE_DEFAULT, "Encountered a non-BOOLean value for 'PPQCheck'.", (uint8_t *)v6, 2u);
      }

      return 0;
    }
  }
  return v2;
}

uint64_t MISProvisioningProfileIsForLocalProvisioning(void *a1)
{
  return sub_1DF328600(a1, (uint64_t)CFSTR("LocalProvision"));
}

void *MISProvisioningProfileGetAppAudience(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("AppAudience"));
}

void *MISProvisioningProfileGetExpirationDate(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("ExpirationDate"));
}

uint64_t MISProvisioningProfileSetName(void *a1, const void *a2)
{
  return MISProfileSetValue(a1, (uint64_t)CFSTR("Name"), a2);
}

void *MISProvisioningProfileGetName(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("Name"));
}

uint64_t MISProvisioningProfileAddDeveloperCertificate(void *a1, const void *a2)
{
  __CFArray *Value;
  __CFArray *v5;
  CFTypeID v6;
  const __CFAllocator *v8;
  __CFArray *Mutable;
  __CFArray *v10;
  uint64_t v11;

  Value = (__CFArray *)MISProfileGetValue(a1, (uint64_t)CFSTR("DeveloperCertificates"));
  if (Value)
  {
    v5 = Value;
    v6 = CFGetTypeID(Value);
    if (v6 == CFArrayGetTypeID())
    {
      CFArrayAppendValue(v5, a2);
      return 0;
    }
    else
    {
      return 3892346883;
    }
  }
  else
  {
    v8 = CFGetAllocator(a1);
    Mutable = CFArrayCreateMutable(v8, 0, MEMORY[0x1E0C9B378]);
    if (Mutable)
    {
      v10 = Mutable;
      CFArrayAppendValue(Mutable, a2);
      v11 = MISProfileSetValue(a1, (uint64_t)CFSTR("DeveloperCertificates"), v10);
      CFRelease(v10);
      return v11;
    }
    else
    {
      return 3892346890;
    }
  }
}

uint64_t MISProvisioningProfileSetDeveloperCertificates(void *a1, const __CFArray *a2)
{
  const __CFAllocator *v4;
  CFMutableArrayRef MutableCopy;
  CFMutableArrayRef v6;
  uint64_t v7;

  v4 = CFGetAllocator(a1);
  MutableCopy = CFArrayCreateMutableCopy(v4, 0, a2);
  if (!MutableCopy)
    return 3892346890;
  v6 = MutableCopy;
  v7 = MISProfileSetValue(a1, (uint64_t)CFSTR("DeveloperCertificates"), MutableCopy);
  CFRelease(v6);
  return v7;
}

void *MISProvisioningProfileGetDeveloperCertificatesHashes(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  objc_msgSend_certs(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void *MISProvisioningProfileGetDeveloperCertificates(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("DeveloperCertificates"));
}

void *MISXMLProvisioningProfileGetDeveloperCertificates(void *a1)
{
  if (MISProfileIsDEREncoded(a1))
    return 0;
  else
    return MISProfileGetValue(a1, (uint64_t)CFSTR("DeveloperCertificates"));
}

void *MISProvisioningProfileGetProvisionedDevices(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("ProvisionedDevices"));
}

void *MISProvisioningProfileGetUUID(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("UUID"));
}

uint64_t MISProvisioningProfileGetVersion(void *a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  MISProfileGetValue(a1, (uint64_t)CFSTR("Version"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend_intValue(v1, v2, v3, v4);
  else
    v5 = 0xFFFFFFFFLL;

  return v5;
}

void *MISProvisioningProfileGetCreationDate(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("CreationDate"));
}

void *MISProvisioningProfileGetEntitlements(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  objc_msgSend_entitlements(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void *MISProvisioningProfileGetRawEntitlements(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("Entitlements"));
}

uint64_t MISProvisioningProfileCheckValidity(void *a1, const __CFString *a2, const __CFDate *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  BOOL v12;
  NSObject *v13;
  const __CFDate *Value;
  uint8_t v16[16];

  v6 = MISProfileValidateSignature_0(a1);
  if (!(_DWORD)v6)
  {
    v6 = 3892346898;
    if (MISProvisioningProfileGetVersion(a1) != 1)
      return 3892346896;
    if (!a2 || MISProvisioningProfileIncludesDevice(a1, a2))
    {
      sub_1DF32C124();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (sub_1DF32C090((uint64_t)v7, a1, CFSTR("OSX")))
      {
        sub_1DF32C124();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1DF32C124();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("iOS");
        if (!v9)
          v10 = 0;
        v11 = v10;
        v12 = sub_1DF32C090((uint64_t)v8, a1, v11);

        if (!v12)
        {
          sub_1DF30EE34();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v16 = 0;
            _os_log_error_impl(&dword_1DF30C000, v13, OS_LOG_TYPE_ERROR, "Encountered a provisioning profile that does not provision the current platform.", v16, 2u);
          }

          return v6;
        }
      }
      else
      {

      }
      if (a3
        && (Value = (const __CFDate *)MISProfileGetValue(a1, (uint64_t)CFSTR("ExpirationDate"))) != 0
        && CFDateCompare(a3, Value, 0) != kCFCompareLessThan)
      {
        return 3892346897;
      }
      else
      {
        return 0;
      }
    }
  }
  return v6;
}

void *MISProvisioningProfileGetProvisioningCDHashes(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("ProvisioningCDHashes"));
}

void *MISProvisioningProfileGetEmbeddedDER(void *a1)
{
  return MISProfileGetValue(a1, (uint64_t)CFSTR("DER-Encoded-Profile"));
}

uint64_t MISProvisioningProfileIsForBetaDeployment(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  CFTypeID v5;

  objc_msgSend_entitlements(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID()))
    return MISEntitlementDictionaryAllowsEntitlementValue((const __CFDictionary *)v4, CFSTR("beta-reports-active"), (const __CFString *)*MEMORY[0x1E0C9AE50]);
  else
    return 0;
}

uint64_t sub_1DF32920C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1DF329218(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1DF3292B8;
  v11[3] = &unk_1EA98AB40;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v10 = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(a1, v8, (uint64_t)v11, v9);

}

void sub_1DF3292B8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  id v27;

  v27 = a2;
  *a4 = 0;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend_appendString_(v7, v9, (uint64_t)v27, v10);
  objc_msgSend_appendString_(*(void **)(a1 + 32), v11, (uint64_t)CFSTR("\x1F"), v12);
  sub_1DF32936C(*(void **)(a1 + 32), v8, *(void **)(a1 + 40));

  v13 = *(void **)(a1 + 32);
  v17 = objc_msgSend_length(v13, v14, v15, v16);
  v21 = v17 + ~objc_msgSend_length(v27, v18, v19, v20);
  v25 = objc_msgSend_length(v27, v22, v23, v24);
  objc_msgSend_deleteCharactersInRange_(v13, v26, v21, v25 + 1);

}

void sub_1DF32936C(void *a1, void *a2, void *a3)
{
  __CFString *v5;
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  CFTypeID v14;
  int v15;
  const __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v26 = a1;
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v26;
      v8 = v6;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1DF329574;
      v27[3] = &unk_1EA98AB68;
      v28 = v7;
      v29 = v8;
      objc_msgSend_enumerateObjectsUsingBlock_(v5, v9, (uint64_t)v27, v10);

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v24 = v5;
      v13 = CFSTR("string");
    }
    else
    {
      v14 = CFGetTypeID(v5);
      if (v14 != CFBooleanGetTypeID())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          abort();
        v20 = (void *)MEMORY[0x1E0CB3940];
        v25 = objc_msgSend_longLongValue(v5, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v20, v21, (uint64_t)CFSTR("%@%@%lld"), v22, CFSTR("number"), v26, v25);
        goto LABEL_15;
      }
      v15 = CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
      v12 = (void *)MEMORY[0x1E0CB3940];
      if (v15)
        v16 = CFSTR("true");
      else
        v16 = CFSTR("false");
      v24 = v16;
      v13 = CFSTR("BOOL");
    }
    objc_msgSend_stringWithFormat_(v12, (const char *)v26, (uint64_t)CFSTR("%@%@%@"), v11, v13, v26, v24);
LABEL_15:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v23);

    goto LABEL_16;
  }
  sub_1DF329218(v5, v26, v6);
LABEL_16:

}

uint64_t sub_1DF329574(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *a4 = 0;
  return sub_1DF32936C(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

uint64_t sub_1DF329584(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

CFDataRef sub_1DF329590(const __CFData *a1)
{
  const UInt8 *BytePtr;
  CC_LONG Length;
  CC_SHA256_CTX v5;
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(&v5, 0, sizeof(v5));
  CC_SHA256_Init(&v5);
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  CC_SHA256_Update(&v5, BytePtr, Length);
  CC_SHA256_Final(md, &v5);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], md, 32);
}

void sub_1DF329644()
{
  void *v0;

  sub_1DF30EE34();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_with_args();

}

void sub_1DF3296A0()
{
  void *v0;

  sub_1DF30EE34();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  os_log_with_args();

  abort();
}

__CFString *sub_1DF3296EC(const __CFData *a1)
{
  const __CFAllocator *v2;
  CFIndex Length;
  __CFString *Mutable;
  const UInt8 *BytePtr;
  CFIndex v6;
  CFIndex v7;
  unsigned int v8;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Length = CFDataGetLength(a1);
  Mutable = CFStringCreateMutable(v2, 2 * Length);
  BytePtr = CFDataGetBytePtr(a1);
  v6 = CFDataGetLength(a1);
  if (v6 >= 1)
  {
    v7 = v6;
    do
    {
      v8 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0, CFSTR("%02x"), v8);
      --v7;
    }
    while (v7);
  }
  return Mutable;
}

uint64_t MISArrayAllowsEntitlementValue(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count;
  CFIndex v5;
  const __CFAllocator *v6;
  uint64_t v7;
  const __CFString *ValueAtIndex;
  CFTypeID v9;
  CFIndex Length;
  CFIndex v11;
  const __CFString *v12;
  uint64_t HasPrefix;
  CFRange v15;

  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = 1;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v7 - 1);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 != CFStringGetTypeID())
        break;
      Length = CFStringGetLength(ValueAtIndex);
      v11 = Length - 1;
      if (Length < 1)
      {
        HasPrefix = 0;
      }
      else if (CFStringGetCharacterAtIndex(ValueAtIndex, v11) == 42)
      {
        v15.location = 0;
        v15.length = v11;
        v12 = CFStringCreateWithSubstring(v6, ValueAtIndex, v15);
        HasPrefix = CFStringHasPrefix(a2, v12);
        CFRelease(v12);
      }
      else
      {
        HasPrefix = CFStringCompare(ValueAtIndex, a2, 0) == kCFCompareEqualTo;
      }
      if (v7 < v5)
      {
        ++v7;
        if (!(_DWORD)HasPrefix)
          continue;
      }
      return HasPrefix;
    }
  }
  return 0;
}

uint64_t MISEntitlementDictionaryAllowsEntitlementValue(const __CFDictionary *a1, const void *a2, const __CFString *a3)
{
  void *Value;
  const void *v5;
  uint64_t v6;
  CFTypeID v7;
  CFTypeID v9;
  CFTypeID v10;
  const __CFArray *v11;
  CFTypeID v12;
  CFTypeID v13;
  CFTypeID v14;
  CFIndex Count;
  CFIndex v16;
  uint64_t v17;
  const __CFString *ValueAtIndex;
  CFTypeID v19;
  uint64_t v20;
  void *values;

  if (!a3)
    return 0;
  Value = (void *)CFDictionaryGetValue(a1, a2);
  values = Value;
  if (!Value)
    return 0;
  v5 = Value;
  if (CFEqual(Value, CFSTR("*")) != 1)
  {
    v7 = CFGetTypeID(v5);
    if (v7 == CFBooleanGetTypeID())
      return CFEqual(v5, a3);
    v9 = CFGetTypeID(v5);
    if (v9 == CFStringGetTypeID())
    {
      v10 = CFGetTypeID(a3);
      if (v10 == CFStringGetTypeID())
      {
        v11 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
        v6 = MISArrayAllowsEntitlementValue(v11, a3);
        CFRelease(v11);
        return v6;
      }
    }
    else
    {
      v12 = CFGetTypeID(v5);
      if (v12 == CFArrayGetTypeID())
      {
        v13 = CFGetTypeID(a3);
        if (v13 == CFStringGetTypeID())
          return MISArrayAllowsEntitlementValue((const __CFArray *)v5, a3);
        v14 = CFGetTypeID(a3);
        if (v14 == CFArrayGetTypeID())
        {
          Count = CFArrayGetCount((CFArrayRef)a3);
          if (Count < 1)
            return 1;
          v16 = Count;
          v17 = 1;
          while (1)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a3, v17 - 1);
            v19 = CFGetTypeID(ValueAtIndex);
            if (v19 != CFStringGetTypeID())
              break;
            v20 = MISArrayAllowsEntitlementValue((const __CFArray *)v5, ValueAtIndex);
            v6 = v20;
            if (v17 < v16)
            {
              ++v17;
              if ((_DWORD)v20 == 1)
                continue;
            }
            return v6;
          }
        }
      }
    }
    return 0;
  }
  return 1;
}

CFDataRef sub_1DF329C50(const __CFData *a1)
{
  const UInt8 *BytePtr;
  CFIndex v3;
  NSObject *v4;
  uint8_t buf[16];
  CFIndex length;
  const UInt8 *v8;

  v8 = 0;
  length = 0;
  BytePtr = CFDataGetBytePtr(a1);
  v3 = CFDataGetLength(a1);
  if (!CTParseAmfiCMS((uint64_t)BytePtr, v3, 8, 0, 0, &v8, &length, 0, 0))
    return CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  sub_1DF30EE34();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DF30C000, v4, OS_LOG_TYPE_ERROR, "Could not decode CMS message.", buf, 2u);
  }

  return 0;
}

uint64_t sub_1DF329D2C()
{
  uint64_t v0;
  int v1;
  _BOOL4 v2;

  v0 = 3892346883;
  v1 = SecCMSVerify();
  if (v1 != -26275)
  {
    if (v1)
    {
      return 3892346889;
    }
    else
    {
      v2 = SecTrustEvaluateWithError(0, 0);
      CFRelease(0);
      if (v2)
        return 0;
      else
        return 3892346899;
    }
  }
  return v0;
}

uint64_t sub_1DF329DAC()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1F0475430;
  qword_1F0475430 = (uint64_t)v0;

  return MEMORY[0x1E0DE7D20](qword_1F0475430, sel_setCountLimit_, 100, v2);
}

uint64_t MISPing(char **a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  xpc_object_t v4;
  uint64_t uint64;
  const char *v6;
  NSObject *v7;
  const char *string;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sub_1DF329F78();
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "MessageType", "Ping");
  v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
  if (MEMORY[0x1E0BFEE88]() == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v4, "Status");
    if (a1)
    {
      string = xpc_dictionary_get_string(v4, "Payload");
      *a1 = strdup(string);
    }
  }
  else
  {
    uint64 = 3892346881;
    if (MEMORY[0x1E0BFEE88](v4) == MEMORY[0x1E0C81310])
    {
      v6 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
      sub_1DF30EE34();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = v6;
        _os_log_impl(&dword_1DF30C000, v7, OS_LOG_TYPE_DEFAULT, "error sending ping: %s\n", (uint8_t *)&v10, 0xCu);
      }

      uint64 = 3892346893;
    }
  }
  xpc_connection_cancel(v2);

  return uint64;
}

_xpc_connection_s *sub_1DF329F78()
{
  _xpc_connection_s *mach_service;

  mach_service = xpc_connection_create_mach_service("com.apple.misagent", 0, 0);
  xpc_connection_set_event_handler(mach_service, &unk_1EA98AC40);
  xpc_connection_resume(mach_service);
  return mach_service;
}

void sub_1DF329FC0(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char *v4;
  NSObject *v5;
  const char *string;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2;
  if (v2 != (id)MEMORY[0x1E0C81260])
  {
    if (MEMORY[0x1E0BFEE88](v2) == MEMORY[0x1E0C81310])
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
      sub_1DF30EE34();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = string;
        _os_log_impl(&dword_1DF30C000, v7, OS_LOG_TYPE_DEFAULT, "misagent connection error: %s\n", (uint8_t *)&v8, 0xCu);
      }

    }
    else
    {
      v4 = (char *)MEMORY[0x1E0BFEDD4](v3);
      sub_1DF30EE34();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = v4;
        _os_log_impl(&dword_1DF30C000, v5, OS_LOG_TYPE_DEFAULT, "received unhandled event from misagent: %s\n", (uint8_t *)&v8, 0xCu);
      }

      free(v4);
    }
  }

}

uint64_t MISInstallProvisioningProfile(uint64_t a1)
{
  uint64_t uint64;
  void *v2;
  const __CFData *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  const UInt8 *BytePtr;
  size_t Length;
  xpc_object_t v8;
  const char *string;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  uint64 = 3892346881;
  v2 = *(void **)(a1 + 8);
  if (!v2)
    return 3892346884;
  v3 = v2;
  sub_1DF329F78();
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "MessageType", "Install");
  BytePtr = CFDataGetBytePtr(v3);
  Length = CFDataGetLength(v3);
  xpc_dictionary_set_data(v5, "Profile", BytePtr, Length);
  v8 = xpc_connection_send_message_with_reply_sync(v4, v5);
  if (MEMORY[0x1E0BFEE88]() == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v8, "Status");
  }
  else if (MEMORY[0x1E0BFEE88](v8) == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1E0C81270]);
    sub_1DF30EE34();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = string;
      _os_log_impl(&dword_1DF30C000, v10, OS_LOG_TYPE_DEFAULT, "error installing profile: %s\n", (uint8_t *)&v12, 0xCu);
    }

    uint64 = 3892346893;
  }
  xpc_connection_cancel(v4);
  CFRelease(v3);

  return uint64;
}

uint64_t MISRemoveProvisioningProfile(const __CFString *a1)
{
  uint64_t uint64;
  void *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  const char *string;
  NSObject *v8;
  int v10;
  const char *v11;
  char buffer[37];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  uint64 = 3892346881;
  v3 = (void *)MEMORY[0x1E0BFE7D4]();
  if (CFStringGetCString(a1, buffer, 37, 0x600u))
  {
    sub_1DF329F78();
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "MessageType", "Remove");
    xpc_dictionary_set_string(v5, "ProfileID", buffer);
    v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    if (MEMORY[0x1E0BFEE88]() == MEMORY[0x1E0C812F8])
    {
      uint64 = xpc_dictionary_get_uint64(v6, "Status");
    }
    else if (MEMORY[0x1E0BFEE88](v6) == MEMORY[0x1E0C81310])
    {
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E0C81270]);
      sub_1DF30EE34();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = string;
        _os_log_impl(&dword_1DF30C000, v8, OS_LOG_TYPE_DEFAULT, "error removing profile: %s\n", (uint8_t *)&v10, 0xCu);
      }

      uint64 = 3892346893;
    }
    xpc_connection_cancel(v4);

  }
  objc_autoreleasePoolPop(v3);
  return uint64;
}

uint64_t MISCopyInstalledProvisioningProfiles(CFMutableArrayRef *a1)
{
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[16];

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v3 = Mutable;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1DF32A594;
    v7[3] = &unk_1EA98ABA8;
    v7[4] = Mutable;
    v4 = MISEnumerateInstalledProvisioningProfiles(MISProfileEnumerationFlagLegacy, v7);
    if ((_DWORD)v4)
      CFRelease(v3);
    else
      *a1 = v3;
  }
  else
  {
    sub_1DF30EE34();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v5, OS_LOG_TYPE_ERROR, "unable to allocate profiles array", buf, 2u);
    }

    return 3892346890;
  }
  return v4;
}

uint64_t sub_1DF32A594(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
  return 1;
}

uint64_t MISEnumerateInstalledProvisioningProfiles(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  const char *string;
  NSObject *v8;
  uint64_t *v9;
  uint64_t uint64;
  void *v11;
  _xpc_connection_s *v12;
  _QWORD v14[4];
  _xpc_connection_s *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -402620415;
  sub_1DF329F78();
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "MessageType", "CopyAll");
  v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
  if (MEMORY[0x1E0BFEE88]() == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v6, "Status");
    *((_DWORD *)v20 + 6) = uint64;
    if ((_DWORD)uint64)
      goto LABEL_10;
  }
  else if (MEMORY[0x1E0BFEE88](v6) == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E0C81270]);
    sub_1DF30EE34();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = string;
      _os_log_error_impl(&dword_1DF30C000, v8, OS_LOG_TYPE_ERROR, "error getting installed profiles: %s\n", buf, 0xCu);
    }

    v9 = v20;
    goto LABEL_9;
  }
  xpc_dictionary_get_value(v6, "Payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (!v11)
  {
LABEL_9:
    *((_DWORD *)v9 + 6) = -402620403;
    uint64 = 3892346893;
    goto LABEL_10;
  }
  *((_DWORD *)v20 + 6) = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1DF32A838;
  v14[3] = &unk_1EA98ABD0;
  v12 = v4;
  v15 = v12;
  v17 = &v19;
  v18 = a1;
  v16 = v3;
  xpc_array_apply(v11, v14);
  xpc_connection_cancel(v12);
  uint64 = *((unsigned int *)v20 + 6);

LABEL_10:
  _Block_object_dispose(&v19, 8);

  return uint64;
}

void sub_1DF32A814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF32A838(uint64_t a1, int a2, xpc_object_t xstring)
{
  const __CFAllocator *v4;
  const char *string_ptr;
  const __CFString *v6;
  MISProfile *v7;
  MISProfile *v8;
  uint64_t v9;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  string_ptr = xpc_string_get_string_ptr(xstring);
  v6 = CFStringCreateWithCString(v4, string_ptr, 0x600u);
  v7 = sub_1DF32A904(*(void **)(a1 + 32), v6, *(_QWORD *)(a1 + 56) == MISProfileEnumerationFlagLegacy, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (!v7)
  {
    v9 = 0;
    if (!v6)
      return v9;
    goto LABEL_8;
  }
  v8 = v7;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v9 = 0;
  else
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CFRelease(v8);
  if (v6)
LABEL_8:
    CFRelease(v6);
  return v9;
}

MISProfile *sub_1DF32A904(void *a1, const __CFString *a2, BOOL a3, int *a4)
{
  int v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  xpc_object_t v10;
  const char *string;
  NSObject *v12;
  id v13;
  int uint64;
  MISProfile *v15;
  void *v16;
  const __CFAllocator *v18;
  const UInt8 *bytes_ptr;
  size_t length;
  CFDataRef v21;
  CFDataRef v22;
  int v23;
  char *v24;
  __int16 v25;
  const char *v26;
  char buffer[37];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = -402620415;
  v8 = a1;
  *a4 = -402620415;
  if (!CFStringGetCString(a2, buffer, 37, 0x600u))
  {
    v9 = 0;
    v10 = 0;
    v13 = 0;
LABEL_18:
    v15 = 0;
    *a4 = v7;
    goto LABEL_19;
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "MessageType", "CopySingle");
  xpc_dictionary_set_string(v9, "ProfileID", buffer);
  xpc_dictionary_set_BOOL(v9, "ForceXML", a3);
  v10 = xpc_connection_send_message_with_reply_sync(v8, v9);
  if (MEMORY[0x1E0BFEE88]() != MEMORY[0x1E0C812F8])
  {
    if (MEMORY[0x1E0BFEE88](v10) == MEMORY[0x1E0C81310])
    {
      string = xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x1E0C81270]);
      sub_1DF30EE34();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315394;
        v24 = buffer;
        v25 = 2080;
        v26 = string;
        _os_log_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_DEFAULT, "error getting profile '%s': %s", (uint8_t *)&v23, 0x16u);
      }
      v13 = 0;
      goto LABEL_15;
    }
LABEL_10:
    xpc_dictionary_get_value(v10, "Payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v13 = 0;
      goto LABEL_17;
    }
    v13 = v16;
    if (MEMORY[0x1E0BFEE88]() == MEMORY[0x1E0C812E8]
      && (v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
          bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v13),
          length = xpc_data_get_length(v13),
          (v21 = CFDataCreate(v18, bytes_ptr, length)) != 0))
    {
      v22 = v21;
      v15 = MISProfileCreateWithData((uint64_t)v21, v21);
      CFRelease(v22);

      if (v15)
        goto LABEL_19;
    }
    else
    {

    }
    sub_1DF30EE34();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315138;
      v24 = buffer;
      _os_log_error_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_ERROR, "error getting profile '%s' from fd", (uint8_t *)&v23, 0xCu);
    }
LABEL_15:

LABEL_17:
    v7 = -402620403;
    goto LABEL_18;
  }
  uint64 = xpc_dictionary_get_uint64(v10, "Status");
  *a4 = uint64;
  if (!uint64)
    goto LABEL_10;
  v13 = 0;
  v15 = 0;
LABEL_19:

  return v15;
}

uint64_t MISCopyProvisioningProfile(const __CFString *a1, MISProfile **a2)
{
  void *v4;
  uint64_t v5;
  unsigned int v7;

  v7 = -402620415;
  sub_1DF329F78();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *a2 = sub_1DF32A904(v4, a1, 0, (int *)&v7);
  xpc_connection_cancel((xpc_connection_t)v4);
  v5 = v7;

  return v5;
}

uint64_t MISCopyProvisioningProfileWithConnection(const __CFString *a1, MISProfile **a2, void *a3)
{
  unsigned int v4;

  v4 = -402620415;
  *a2 = sub_1DF32A904(a3, a1, 0, (int *)&v4);
  return v4;
}

uint64_t MISEnumerateMatchingProfiles(const __CFData *a1, const __CFArray *a2, void *a3)
{
  uint64_t v5;
  id v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t empty;
  const UInt8 *BytePtr;
  size_t Length;
  CFIndex i;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  xpc_object_t v19;
  const char *string;
  NSObject *v21;
  NSObject *v22;
  uint64_t uint64;
  uint64_t v24;
  void *v25;
  char *v26;
  NSObject *v27;
  _xpc_connection_s *v28;
  _QWORD applier[4];
  _xpc_connection_s *v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint8_t buf[4];
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = 3892346893;
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = -402620415;
  sub_1DF329F78();
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = xpc_dictionary_create(0, 0, 0);
  empty = xpc_array_create_empty();
  xpc_dictionary_set_string(v8, "MessageType", "CopyMatching");
  if (a1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v9, "Cert", BytePtr, Length);
  }
  if (a2)
  {
    for (i = 0; i < CFArrayGetCount(a2); ++i)
    {
      CFArrayGetValueAtIndex(a2, i);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
      if (!v18)
      {
        sub_1DF30EE34();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DF30C000, v22, OS_LOG_TYPE_ERROR, "Invalid UTF8 string in predicate", buf, 2u);
        }

        *((_DWORD *)v35 + 6) = -402620415;
        v19 = 0;
        v5 = 3892346881;
        goto LABEL_26;
      }
      xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v18);

    }
  }
  xpc_dictionary_set_value(v9, "Predicates", empty);
  xpc_dictionary_set_value(v8, "Payload", v9);
  v19 = xpc_connection_send_message_with_reply_sync(v7, v8);
  if (MEMORY[0x1E0BFEE88]() == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v19, "Status");
    *((_DWORD *)v35 + 6) = uint64;
    if ((_DWORD)uint64)
    {
      v5 = uint64;
      goto LABEL_26;
    }
  }
  else if (MEMORY[0x1E0BFEE88](v19) == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v19, (const char *)*MEMORY[0x1E0C81270]);
    sub_1DF30EE34();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v39 = string;
      _os_log_error_impl(&dword_1DF30C000, v21, OS_LOG_TYPE_ERROR, "error getting unauthoritative profile list: %s\n", buf, 0xCu);
    }

    *((_DWORD *)v35 + 6) = -402620403;
    goto LABEL_26;
  }
  xpc_dictionary_get_value(v19, "Payload");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
  {
    if (MEMORY[0x1E0BFEE88](v24) == MEMORY[0x1E0C812C8])
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = sub_1DF32B108;
      applier[3] = &unk_1EA98ABF8;
      v33 = &v34;
      v28 = v7;
      v31 = v28;
      v32 = v6;
      xpc_array_apply(v25, applier);
      xpc_connection_cancel(v28);
      v5 = *((unsigned int *)v35 + 6);

      goto LABEL_26;
    }
    v26 = (char *)MEMORY[0x1E0BFEDD4](v25);
  }
  else
  {
    v26 = 0;
  }
  sub_1DF30EE34();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v39 = v26;
    _os_log_error_impl(&dword_1DF30C000, v27, OS_LOG_TYPE_ERROR, "Payload is not an array: %s", buf, 0xCu);
  }

  free(v26);
  *((_DWORD *)v35 + 6) = -402620403;

LABEL_26:
  _Block_object_dispose(&v34, 8);

  return v5;
}

void sub_1DF32B0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF32B108(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t (**v9)(id, CFTypeRef *);
  id v10;
  void *v11;
  NSObject *v12;
  const char *string;
  const char *v14;
  const char *v15;
  int64_t date;
  const __CFAllocator *v17;
  CFStringRef v18;
  const __CFDate *v19;
  CFAbsoluteTime Current;
  const __CFDate *v21;
  unsigned int v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  void *v27;
  CFTypeRef cf;
  CFTypeRef v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  size_t count;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = v4;
  v8 = v5;
  v9 = v6;
  cf = 0;
  v29 = 0;
  v30 = 0;
  v10 = v8;
  v31 = v10;
  if (MEMORY[0x1E0BFEE88](v7) != MEMORY[0x1E0C812C8])
  {
    v11 = (void *)MEMORY[0x1E0BFEDD4](v7);
    sub_1DF30EE34();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      count = (size_t)v11;
      _os_log_error_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_ERROR, "Profile row is not an array: '%s'", buf, 0xCu);
    }
LABEL_4:

    free(v11);
LABEL_15:
    v18 = 0;
    v19 = 0;
    v21 = 0;
    v23 = -402620403;
    v22 = 1;
    goto LABEL_16;
  }
  if (xpc_array_get_count(v7) != 8)
  {
    sub_1DF30EE34();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      count = xpc_array_get_count(v7);
      v34 = 2048;
      v35 = 4;
      _os_log_error_impl(&dword_1DF30C000, v24, OS_LOG_TYPE_ERROR, "Wrong profile row count %ld != expected %ld", buf, 0x16u);
    }

    goto LABEL_15;
  }
  string = xpc_array_get_string(v7, 0);
  v14 = xpc_array_get_string(v7, 1uLL);
  v15 = xpc_array_get_string(v7, 2uLL);
  date = xpc_array_get_date(v7, 3uLL);
  BYTE1(v30) = xpc_array_get_BOOL(v7, 4uLL);
  BYTE3(v30) = xpc_array_get_BOOL(v7, 5uLL);
  BYTE2(v30) = xpc_array_get_BOOL(v7, 6uLL);
  BYTE4(v30) = xpc_array_get_BOOL(v7, 7uLL);
  if (!string)
  {
    xpc_array_get_value(v7, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0BFEDD4](v27);

    sub_1DF30EE34();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      count = (size_t)v11;
      _os_log_error_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_ERROR, "Profile row has no (or malformed) UUID: '%s'", buf, 0xCu);
    }
    goto LABEL_4;
  }
  v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], string, 0x8000100u);
  if (v14)
    v29 = CFStringCreateWithCString(v17, v14, 0x8000100u);
  v18 = CFStringCreateWithCString(v17, v15, 0x8000100u);
  v19 = CFDateCreate(v17, (double)date);
  Current = CFAbsoluteTimeGetCurrent();
  v21 = CFDateCreate(v17, Current);
  LOBYTE(v30) = CFDateCompare(v19, v21, 0) == kCFCompareLessThan;
  v22 = v9[2](v9, &cf);
  if (cf)
    CFRelease(cf);
  v23 = 0;
LABEL_16:
  if (v29)
    CFRelease(v29);
  if (v18)
    CFRelease(v18);
  if (v19)
    CFRelease(v19);
  if (v21)
    CFRelease(v21);

  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v23;
  if (*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
    v25 = 0;
  else
    v25 = v22;

  return v25;
}

void sub_1DF32B4E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t MISEnumerateMatchingProfilesUnauthoritative(const __CFData *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1DF32B598;
  v7[3] = &unk_1EA98AC20;
  v8 = v3;
  v4 = v3;
  v5 = MISEnumerateMatchingProfiles(a1, 0, v7);

  return v5;
}

uint64_t sub_1DF32B598(uint64_t a1, const __CFString **a2)
{
  int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CFTypeRef v7;
  BOOL v8;
  uint64_t v9;
  CFTypeRef cf;

  cf = 0;
  v3 = MISCopyProvisioningProfile(*a2, (MISProfile **)&cf);
  v7 = cf;
  if (cf)
    v8 = v3 == 0;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend_entitlements((void *)cf, v4, v5, v6);

    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 1;
    if (!cf)
      return v9;
  }
  CFRelease(v7);
  return v9;
}

void MISBlacklistOverriddenByUser()
{
  sub_1DF3319A0();
}

BOOL sub_1DF32B664(const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int16 a9, uint64_t a10, uint8_t a11, uint64_t a12, uint8_t buf, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  const __CFData *v20;
  uint64_t v21;
  CFIndex Length;
  __CFData *MutableCopy;
  const __CFData *v25;
  __CFString *v26;
  __CFString *v27;
  _BOOL8 v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  __int16 v33;
  __int16 v34;
  __int16 v35;

  if (a1)
  {
    Length = CFDataGetLength(v20);
    MutableCopy = CFDataCreateMutableCopy(0, Length + 4, v20);
    if (MutableCopy)
    {
      v25 = MutableCopy;
      CFDataAppendBytes(MutableCopy, (const UInt8 *)(v21 - 36), 4);
      v26 = sub_1DF3296EC(v25);
      if (v26)
      {
        v27 = v26;
        v28 = sub_1DF331BC0((_BOOL8)a1, v26);
        CFRelease(v27);
      }
      else
      {
        sub_1DF30EE34();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v33 = 0;
          _os_log_error_impl(&dword_1DF30C000, v31, OS_LOG_TYPE_ERROR, "Could not create lookup key for denylist override check.", (uint8_t *)&v33, 2u);
        }

        v28 = 0;
      }
      CFRelease(v25);
    }
    else
    {
      sub_1DF30EE34();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v34 = 0;
        _os_log_error_impl(&dword_1DF30C000, v30, OS_LOG_TYPE_ERROR, "Could not create cdHash for denylist override check.", (uint8_t *)&v34, 2u);
      }

      v28 = 0;
    }
    CFRelease(a1);
  }
  else
  {
    sub_1DF30EE34();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v35 = 0;
      _os_log_error_impl(&dword_1DF30C000, v29, OS_LOG_TYPE_ERROR, "Could not open denylist override list.", (uint8_t *)&v35, 2u);
    }

    return 0;
  }
  return v28;
}

void sub_1DF32B7D8()
{
  sub_1DF32BE60();
}

uint64_t sub_1DF32B7EC(uint64_t result)
{
  qword_1ED1C0288 = result;
  return result;
}

uint64_t MISQueryBlacklistForBundle(const __CFString *a1, uint64_t a2, int a3, _DWORD *a4, CFDataRef *a5, _DWORD *a6)
{
  const __SecCode *v10;
  const __SecCode *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFData *v14;
  const __CFData *v15;
  NSObject *v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t result;
  int v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v10 = (const __SecCode *)sub_1DF310B70(a1, a2, 0, &v23);
  if (v10)
  {
    v11 = v10;
    sub_1DF310FF0(v10);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (const __CFData *)sub_1DF311048(v12);
      if (v14)
      {
        v15 = v14;
      }
      else
      {
        v23 = -402620415;
        sub_1DF30EE34();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DF30C000, v19, OS_LOG_TYPE_DEFAULT, "Could not copy code directory hash.", buf, 2u);
        }

        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
      v23 = -402620407;
    }
    v17 = v23;
    CFRelease(v11);

    v18 = v15 == 0;
    if (!v17 && v15)
    {
      if (a5)
        *a5 = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v15);
      if (a6)
        *a6 = 26;
      v20 = MISQueryBlacklistForCdHash(v15, 26, a3, a4);
LABEL_22:
      CFRelease(v15);
      return v20;
    }
  }
  else
  {
    sub_1DF30EE34();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v25 = v23;
      _os_log_impl(&dword_1DF30C000, v16, OS_LOG_TYPE_DEFAULT, "Could not copy signature, error 0x%x", buf, 8u);
    }

    v17 = v23;
    v15 = 0;
    v18 = 1;
  }
  sub_1DF30EE34();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v25 = v17;
    _os_log_impl(&dword_1DF30C000, v21, OS_LOG_TYPE_DEFAULT, "Could not copy code directory hash (error: 0x%x).", buf, 8u);
  }

  v20 = 0;
  result = 0;
  if (!v18)
    goto LABEL_22;
  return result;
}

void MISBlacklistSetOverride(const __CFData *a1, unsigned int a2, BOOL a3)
{
  xpc_object_t v6;
  void *v7;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_string(v6, "type", "blov");
    BytePtr = CFDataGetBytePtr(a1);
    Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v7, "cdha", BytePtr, Length);
    xpc_dictionary_set_uint64(v7, "haty", a2);
    xpc_dictionary_set_BOOL(v7, "ovrr", a3);
    sub_1DF330BBC(v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10 && MEMORY[0x1E0BFEE88](v10) != MEMORY[0x1E0C81310])
      xpc_dictionary_get_int64(v11, "resu");
  }
  else
  {
    sub_1DF30EE34();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1DF30C000, v12, OS_LOG_TYPE_ERROR, "Could not create XPC message for setBlacklistOverride", v13, 2u);
    }

    v11 = 0;
  }

}

void sub_1DF32BB9C(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFURL *Value;
  const __CFURL *v5;
  CFTypeID v6;
  NSObject *v7;
  CFTypeID v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  const __CFURL *ValueAtIndex;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  UInt8 *v17;
  UInt8 buffer[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Value = (const __CFURL *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v5 = Value;
    v6 = CFGetTypeID(Value);
    if (v6 == CFURLGetTypeID())
    {
      CFURLGetFileSystemRepresentation(v5, 1u, buffer, 1024);
      sub_1DF30EE34();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = a3;
        v16 = 2080;
        v17 = buffer;
        _os_log_impl(&dword_1DF30C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
      }
LABEL_14:

      return;
    }
    v8 = CFGetTypeID(v5);
    if (v8 != CFArrayGetTypeID())
    {
      sub_1DF30EE34();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315394;
        v19 = "logResourceError";
        v20 = 2080;
        v21 = a3;
        _os_log_error_impl(&dword_1DF30C000, v7, OS_LOG_TYPE_ERROR, "%s: unexpected object type processing %s errors", buffer, 0x16u);
      }
      goto LABEL_14;
    }
    Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      v10 = Count;
      for (i = 0; i != v10; ++i)
      {
        ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v5, i);
        CFURLGetFileSystemRepresentation(ValueAtIndex, 1u, buffer, 1024);
        sub_1DF30EE34();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = a3;
          v16 = 2080;
          v17 = buffer;
          _os_log_impl(&dword_1DF30C000, v13, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
        }

      }
    }
  }
}

CFURLRef sub_1DF32BDD4()
{
  CFURLRef result;

  result = CFURLCreateWithFileSystemPath(0, CFSTR("/private/var/db/MobileIdentityData"), kCFURLPOSIXPathStyle, 1u);
  qword_1ED1C0298 = (uint64_t)result;
  return result;
}

void sub_1DF32BE04()
{
  if (qword_1ED1C02A0[0] != -1)
    dispatch_once(qword_1ED1C02A0, &unk_1EA98AC80);
  JUMPOUT(0x1E0BFE294);
}

void sub_1DF32BE60()
{
  sub_1DF32BE04();
}

CFStringRef sub_1DF32BE74(const __CFURL *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int16 a9, uint64_t a10, uint8_t buf, uint64_t a12, __int16 a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  const __CFURL *v19;
  CFStringRef v20;
  NSObject *v21;
  const char *v22;
  uint8_t *v23;
  __int16 v25;
  __int16 v26;
  __int16 v27;

  if (!a1)
  {
    sub_1DF30EE34();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = 0;
      v22 = "Could not create URL for MIS Data path creation (this should not happen).";
      v23 = (uint8_t *)&v27;
      goto LABEL_12;
    }
LABEL_9:

    return 0;
  }
  v19 = CFURLCopyAbsoluteURL(a1);
  CFRelease(a1);
  if (!v19)
  {
    sub_1DF30EE34();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = 0;
      v22 = "Could not create absolute URL for MIS Data path creation (this should not happen).";
      v23 = (uint8_t *)&v26;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v20 = CFURLCopyPath(v19);
  CFRelease(v19);
  if (!v20)
  {
    sub_1DF30EE34();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = 0;
      v22 = "Could not get path for MIS Data path creation (this should not happen).";
      v23 = (uint8_t *)&v25;
LABEL_12:
      _os_log_error_impl(&dword_1DF30C000, v21, OS_LOG_TYPE_ERROR, v22, v23, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  return v20;
}

void sub_1DF32BF70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, a3, a4);
  objc_claimAutoreleasedReturnValue();
  sub_1DF32BE60();
}

uint64_t sub_1DF32BFA4(const void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  int v6;

  v6 = objc_msgSend_fileExistsAtPath_(v4, a2, (uint64_t)a1, a4);
  if (a1)
    CFRelease(a1);
  if (v6)
    sub_1DF32BE60();

  return 1;
}

void sub_1DF32C060()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mis", "mis");
  v1 = (void *)qword_1ED1C0430;
  qword_1ED1C0430 = (uint64_t)v0;

}

BOOL sub_1DF32C090(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  const char *v6;
  uint64_t v7;
  __CFString *v8;
  int isEqualToString;
  _BOOL4 v10;
  _BOOL8 v11;

  v5 = a3;
  v8 = v5;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_7;
  }
  isEqualToString = objc_msgSend_isEqualToString_(v5, v6, (uint64_t)CFSTR("xrOS"), v7);
  v10 = MISProvisioningProfileIncludesPlatform(a2, v8, 0);
  if (!isEqualToString)
    goto LABEL_6;
  if (!v10)
  {
    v10 = MISProvisioningProfileIncludesPlatform(a2, CFSTR("visionOS"), 0);
LABEL_6:
    v11 = v10;
    goto LABEL_7;
  }
  v11 = 1;
LABEL_7:

  return v11;
}

id sub_1DF32C124()
{
  if (qword_1F0475440 != -1)
    dispatch_once(&qword_1F0475440, &unk_1EA98ACC0);
  return (id)qword_1F0475448;
}

MobileIdentityService *sub_1DF32C164()
{
  MobileIdentityService *result;

  result = objc_alloc_init(MobileIdentityService);
  qword_1F0475448 = (uint64_t)result;
  return result;
}

uint64_t sub_1DF32C188(const __CFArray *a1, uint64_t a2, int *a3)
{
  id v6;
  __SecCertificate *ValueAtIndex;
  unsigned int (**v8)(void *, uint64_t);
  const __CFData *v9;
  const char *v10;
  uint64_t v11;
  CFDataRef v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint8_t v36[16];
  _QWORD aBlock[6];

  if (qword_1F0475458 != -1)
    dispatch_once(&qword_1F0475458, &unk_1EA98AEA0);
  v6 = (id)qword_1F0475450;
  ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(a1, 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DF32F198;
  aBlock[3] = &unk_1EA98AE60;
  aBlock[4] = a1;
  aBlock[5] = a2;
  v8 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  if (!ValueAtIndex)
  {
    sub_1DF30EE34();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v36 = 0;
      _os_log_error_impl(&dword_1DF30C000, v21, OS_LOG_TYPE_ERROR, "There is no leaf cert (this should not happen).", v36, 2u);
    }

    v20 = 0;
    v9 = 0;
    v12 = 0;
    goto LABEL_16;
  }
  v9 = SecCertificateCopyData(ValueAtIndex);
  v12 = sub_1DF329590(v9);
  if (!v12 || !v6)
  {
    sub_1DF30EE34();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v36 = 0;
      _os_log_error_impl(&dword_1DF30C000, v22, OS_LOG_TYPE_ERROR, "Failure creating profile cache key. This shouldn't happen.", v36, 2u);
    }

    v20 = 0;
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  objc_msgSend_objectForKey_(v6, v10, (uint64_t)v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  if (v13)
  {
    v18 = objc_msgSend_intValue(v13, v14, v15, v16);
    if (v18)
    {
      v19 = 0;
      v20 = v18;
      if (!a3)
        goto LABEL_19;
      goto LABEL_18;
    }
    sub_1DF30EE34();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v36 = 0;
      _os_log_error_impl(&dword_1DF30C000, v24, OS_LOG_TYPE_ERROR, "Found in cert cache, but cert type is CertTypeError (this should not happen).", v36, 2u);
    }

  }
  v25 = SecPolicyCreateiPhoneApplicationSigning();
  if (!v8[2](v8, v25))
  {
    v20 = 1;
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v26, 1, v27);
    goto LABEL_30;
  }
  v28 = SecPolicyCreateiPhoneVPNApplicationSigning();
  if (!v8[2](v8, v28))
  {
    v20 = 3;
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v29, 3, v30);
    goto LABEL_30;
  }
  v31 = SecPolicyCreateiPhoneProfileApplicationSigning();
  if (!v8[2](v8, v31))
  {
    v20 = 2;
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v32, 2, v33);
LABEL_30:
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, (uint64_t)v12);

    v19 = 0;
    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
  v20 = 0;
LABEL_17:
  v19 = -402620392;
  if (a3)
LABEL_18:
    *a3 = v19;
LABEL_19:

  return v20;
}

void sub_1DF32C458(const __CFData **a1)
{
  _QWORD v1[4];
  _QWORD v2[3];
  char v3;
  _QWORD v4[3];
  char v5;
  _QWORD v6[3];
  char v7;
  _QWORD v8[3];
  char v9;
  _QWORD v10[3];
  char v11;
  _QWORD v12[3];
  char v13;
  _QWORD v14[3];
  char v15;

  sub_1DF329590(*a1);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 0;
  v2[0] = 0;
  v2[1] = v2;
  v2[2] = 0x2020000000;
  v3 = 0;
  v1[0] = 0;
  v1[1] = v1;
  v1[2] = 0x2020000000;
  v1[3] = 0;
  sub_1DF3319A0();
}

uint64_t sub_1DF32C524(uint64_t a1)
{
  const __CFData *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const __CFArray *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  CFDateRef v23;
  const void *v24;
  const void *v25;
  CFTypeID v26;
  CFAbsoluteTime Current;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  const void *v31;
  _QWORD v33[14];
  _QWORD v34[8];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  char v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[37];

  v44[3] = a1;
  v41[0] = 0;
  v41[1] = v41;
  v42 = v8;
  v43 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1DF32DF80;
  v35[3] = &unk_1EA98AEC8;
  v35[4] = v41;
  v36 = v6;
  v37 = v4;
  v38 = v3;
  v39 = v2;
  v40 = v5;
  v10 = _Block_copy(v35);
  v11 = *(void **)(v5 + 8);
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v12, 20, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v7 - 184) = v9;
  *(_QWORD *)(v7 - 176) = 3221225472;
  *(_QWORD *)(v7 - 168) = sub_1DF329584;
  *(_QWORD *)(v7 - 160) = &unk_1EA98AB18;
  v15 = v14;
  *(_QWORD *)(v7 - 152) = v15;
  v16 = (id)(v7 - 184);
  objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v17, (uint64_t)CFSTR("\x1F"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v7 - 144) = v9;
  *(_QWORD *)(v7 - 136) = 3221225472;
  *(_QWORD *)(v7 - 128) = sub_1DF32920C;
  *(_QWORD *)(v7 - 120) = &unk_1EA98AAF0;
  *(_QWORD *)(v7 - 112) = v16;
  v20 = v16;
  sub_1DF329218(v11, v19, (void *)(v7 - 144));

  if (*(_BYTE *)(v5 + 48))
  {
    v34[0] = v9;
    v34[1] = 3221225472;
    v34[2] = sub_1DF32E400;
    v34[3] = &unk_1EA98AEF0;
    v34[5] = v7 - 216;
    v34[6] = v47;
    v21 = v34;
    v34[7] = v49;
    v34[4] = v10;
    v22 = MISEnumerateMatchingProfiles(v1, v15, v34);
    v23 = 0;
    v24 = 0;
  }
  else
  {
    v25 = (const void *)MGCopyAnswer();
    v24 = v25;
    if (!v25)
    {
      sub_1DF30EE34();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)(v7 - 144) = 0;
        _os_log_error_impl(&dword_1DF30C000, v29, OS_LOG_TYPE_ERROR, "got NULL when querying UDID", (uint8_t *)(v7 - 144), 2u);
      }
      v23 = 0;
      v24 = 0;
      goto LABEL_15;
    }
    v26 = CFGetTypeID(v25);
    v22 = 3892346881;
    if (v26 != CFStringGetTypeID())
    {
      sub_1DF30EE34();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)(v7 - 144) = 0;
        _os_log_error_impl(&dword_1DF30C000, v30, OS_LOG_TYPE_ERROR, "got non-string when querying UDID", (uint8_t *)(v7 - 144), 2u);
      }

      CFRelease(v24);
      v23 = 0;
      v24 = 0;
      goto LABEL_25;
    }
    Current = CFAbsoluteTimeGetCurrent();
    v23 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Current);
    if (!v23)
      goto LABEL_25;
    sub_1DF30EE34();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)(v7 - 144) = 0;
      _os_log_impl(&dword_1DF30C000, v28, OS_LOG_TYPE_DEFAULT, "Authoritative", (uint8_t *)(v7 - 144), 2u);
    }

    v33[0] = v9;
    v33[1] = 3221225472;
    v33[2] = sub_1DF32E45C;
    v33[3] = &unk_1EA98AF18;
    v33[11] = v23;
    v33[12] = v1;
    v33[5] = v47;
    v33[6] = v7 - 216;
    v33[13] = v5;
    v33[7] = v46;
    v33[8] = v45;
    v21 = v33;
    v33[9] = v49;
    v33[10] = v24;
    v33[4] = v10;
    v22 = MISEnumerateMatchingProfiles(v1, v15, v33);
  }

  if (*(_BYTE *)(*(_QWORD *)(v7 - 240) + 24))
    goto LABEL_25;
  if (*(_BYTE *)(v47[1] + 24))
  {
    v22 = 3892346897;
    goto LABEL_25;
  }
  if (*(_BYTE *)(v48[1] + 24))
  {
    v22 = 3892346916;
    goto LABEL_25;
  }
  if (*(_BYTE *)(v46[1] + 24))
  {
    v22 = 3892346922;
    goto LABEL_25;
  }
  if (*(_BYTE *)(v45[1] + 24))
  {
    v22 = 3892346924;
    goto LABEL_25;
  }
  if (*(_BYTE *)(*(_QWORD *)(v7 - 208) + 24))
  {
    if (*(_BYTE *)(v49[1] + 24))
    {
      sub_1DF30EE34();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)(v7 - 144) = 0;
        _os_log_error_impl(&dword_1DF30C000, v29, OS_LOG_TYPE_ERROR, "Invalid profile iteration outcome?", (uint8_t *)(v7 - 144), 2u);
      }
LABEL_15:
      v22 = 3892346881;

      goto LABEL_25;
    }
    v22 = 3892346902;
  }
  else
  {
    v22 = 3892346901;
  }
LABEL_25:
  if (v1)
    CFRelease(v1);
  if (v23)
    CFRelease(v23);
  if (v24)
    CFRelease(v24);
  v31 = *(const void **)(v44[1] + 24);
  if (v31)
    CFRelease(v31);
  if (v15)
    CFRelease(v15);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose((const void *)(v7 - 248), 8);
  _Block_object_dispose((const void *)(v7 - 216), 8);
  return v22;
}

void sub_1DF32C9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  char a66;
  uint64_t v66;

  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose((const void *)(v66 - 248), 8);
  _Block_object_dispose((const void *)(v66 - 216), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF32CA74(const __CFData *a1, CFArrayRef theArray, const __CFNumber *a3, void *a4, int64_t a5, CFTypeRef *a6, const __CFString *a7)
{
  CFIndex Count;
  CFIndex v12;
  CFIndex v13;
  uint64_t v14;
  const __CFArray *ValueAtIndex;
  const __CFArray *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFBoolean *v20;
  const __CFBoolean *v21;
  NSObject *v22;
  int64_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  CFIndex v28;
  int64_t v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v34;
  CFTypeRef *v35;
  uint8_t buf[4];
  CFIndex v40;
  __int16 v41;
  const __CFArray *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 3892346881;
  if (!theArray)
    return 3892346881;
  Count = CFArrayGetCount(theArray);
  if (Count < 1)
    return 3892346881;
  v12 = Count;
  v35 = a6;
  v13 = 0;
  v14 = 3892346881;
  while (1)
  {
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(theArray, v13);
    if (!ValueAtIndex)
    {
      sub_1DF30EE34();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v25 = v24;
      v26 = "Encountered NULL record!";
      v27 = 2;
LABEL_21:
      _os_log_error_impl(&dword_1DF30C000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);
      goto LABEL_34;
    }
    v16 = ValueAtIndex;
    if (CFArrayGetCount(ValueAtIndex) != 4)
    {
      sub_1DF30EE34();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      v28 = CFArrayGetCount(v16);
      *(_DWORD *)buf = 134218242;
      v40 = v28;
      v41 = 2112;
      v42 = v16;
      v25 = v24;
      v26 = "Encountered record with %ld != 4 entries: %@";
      v27 = 22;
      goto LABEL_21;
    }
    v17 = (const __CFString *)CFArrayGetValueAtIndex(v16, 0);
    v18 = (const __CFString *)CFArrayGetValueAtIndex(v16, 1);
    if (!v17 || (v19 = v18) == 0)
    {
      sub_1DF30EE34();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      *(_DWORD *)buf = 138412290;
      v40 = (CFIndex)v16;
      v25 = v24;
      v26 = "Encountered record with no UUID or Team ID: %@";
      v27 = 12;
      goto LABEL_21;
    }
    v20 = (const __CFBoolean *)CFArrayGetValueAtIndex(v16, 2);
    v21 = (const __CFBoolean *)CFArrayGetValueAtIndex(v16, 3);
    sub_1DF30EE34();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DF30C000, v22, OS_LOG_TYPE_INFO, "Performing online authorization.", buf, 2u);
    }

    v23 = sub_1DF3308B4(a1, v17, v19, v20, v21, a3, a4, a5, a7);
    if ((v23 & 0x24) != 0)
    {
      sub_1DF30EE34();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DF30C000, v24, OS_LOG_TYPE_DEFAULT, "Authorization still pending.", buf, 2u);
      }
      v14 = 0;
      goto LABEL_34;
    }
    v29 = v23;
    if ((v23 & 0x10) != 0)
      break;
    if ((v23 & 2) != 0)
    {
      sub_1DF30EE34();
      v24 = objc_claimAutoreleasedReturnValue();
      v14 = 3892346904;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_DWORD *)buf = 134217984;
      v40 = v29;
      v31 = v24;
      v32 = "No online authorization (%#llx).";
LABEL_33:
      _os_log_impl(&dword_1DF30C000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
      goto LABEL_34;
    }
    if ((v23 & 8) != 0)
    {
      sub_1DF30EE34();
      v24 = objc_claimAutoreleasedReturnValue();
      v14 = 3892346918;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_DWORD *)buf = 134217984;
      v40 = v29;
      v31 = v24;
      v32 = "Online authorization rejected (%#llx).";
      goto LABEL_33;
    }
    sub_1DF30EE34();
    v30 = objc_claimAutoreleasedReturnValue();
    v24 = v30;
    if ((v29 & 1) != 0)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DF30C000, v24, OS_LOG_TYPE_INFO, "Online authorization succeeded.", buf, 2u);
      }

      if (!v35)
        return 0;
      if (*v35)
        CFRelease(*v35);
      v14 = 0;
      *v35 = CFRetain(v17);
      return v14;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v24, OS_LOG_TYPE_ERROR, "Online authorization ambiguous.", buf, 2u);
    }
    v14 = 3892346881;
LABEL_34:

    if (v12 == ++v13)
      return v14;
  }
  sub_1DF30EE34();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v29 & 0x10;
    _os_log_error_impl(&dword_1DF30C000, v34, OS_LOG_TYPE_ERROR, "Auth agent contact failure (entitlement status %lld)", buf, 0xCu);
  }

  return 3892346893;
}

void sub_1DF32CF4C()
{
  uint64_t v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = objc_opt_new();
  sub_1DF32BF70(v0, v1, v2, v3);
}

void sub_1DF32D81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF32D83C(const __CFData *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  mach_port_t v14;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v17;
  io_connect_t connect;
  uint64_t input;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  connect = 0;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v5 = MatchingService;
  if (!MatchingService)
  {
    sub_1DF30EE34();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = "Unable to find AppleMobileFileIntegrity service.";
      v10 = v8;
      v11 = 2;
      goto LABEL_19;
    }
    goto LABEL_7;
  }
  v6 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
  if (v6)
  {
    v7 = v6;
    sub_1DF30EE34();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v7;
      v9 = "Unable to open AppleMobileFileIntegrity user client: 0x%x";
LABEL_5:
      v10 = v8;
      v11 = 8;
LABEL_19:
      _os_log_error_impl(&dword_1DF30C000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  input = 1;
  v14 = connect;
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v17 = IOConnectCallMethod(v14, 6u, &input, 1u, BytePtr, Length, 0, 0, 0, 0);
  v12 = v17;
  if ((_DWORD)v17)
  {
    if ((_DWORD)v17 != -536870160)
    {
      sub_1DF30EE34();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v21 = v12;
        v9 = "AppleMobileFileIntegrity user client call failed: 0x%x";
        goto LABEL_5;
      }
LABEL_7:
      v12 = 3892346881;

      goto LABEL_8;
    }
    v12 = 3892346919;
  }
LABEL_8:
  if (connect)
    IOServiceClose(connect);
  if (v5)
    IOObjectRelease(v5);
  return v12;
}

void sub_1DF32DA50()
{
  sub_1DF3319A0();
}

void sub_1DF32DA78()
{
  sub_1DF3319A0();
}

uint64_t sub_1DF32DA88(const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int16 a9, uint64_t a10, uint8_t buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  const void *v18;
  const __CFData *v19;
  int v20;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;
  NSObject *v25;
  NSObject *v26;
  __int16 v28;
  __int16 v29;

  if (v20 && (MISQueryBlacklistForCdHash(v19, 26, 1, 0) & 1) != 0)
  {
    v22 = 4;
  }
  else
  {
    v23 = sub_1DF3296EC(v19);
    if (v23)
    {
      v24 = v23;
      if (sub_1DF331BC0((_BOOL8)a1, v23))
      {
        v22 = 3;
      }
      else if (sub_1DF331BC0((_BOOL8)v18, v24))
      {
        sub_1DF30EE34();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 0;
          _os_log_impl(&dword_1DF30C000, v26, OS_LOG_TYPE_DEFAULT, "Previous authorization failed.", (uint8_t *)&v28, 2u);
        }

        v22 = 2;
      }
      else
      {
        v22 = 0;
      }
      CFRelease(v24);
    }
    else
    {
      sub_1DF30EE34();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = 0;
        _os_log_error_impl(&dword_1DF30C000, v25, OS_LOG_TYPE_ERROR, "Could not create cdHash hex representation for app approval state (this should not happen).", (uint8_t *)&v29, 2u);
      }

      v22 = 1;
    }
  }
  if (v18)
    CFRelease(v18);
  if (a1)
    CFRelease(a1);
  return v22;
}

uint64_t sub_1DF32DBC0(uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4, char a5)
{
  uint64_t v8;

  v8 = 1;
  if (CFStringCompare(*(CFStringRef *)(a1 + 40), a2, 1uLL) == kCFCompareEqualTo)
  {
    if ((a5 & 1) != 0 || (v8 = 1, CFStringCompare(*(CFStringRef *)(a1 + 48), a3, 1uLL) == kCFCompareEqualTo))
    {
      v8 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return v8;
}

void MISExistsIndeterminateApps_0()
{
  sub_1DF3319A0();
}

BOOL sub_1DF32DC64(const __CFArray *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint8_t buf, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  __CFString *v30;
  BOOL *v31;
  uint64_t v32;
  int v34;
  _BOOL8 v35;
  BOOL v36;
  NSObject *v37;
  NSObject *v38;
  _QWORD v40[7];
  _WORD v41[8];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;

  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 33;
  if (v30 && (v30 = sub_1DF3296EC((const __CFData *)v30)) == 0)
  {
    sub_1DF30EE34();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v41[0] = 0;
      _os_log_error_impl(&dword_1DF30C000, v38, OS_LOG_TYPE_ERROR, "Could not create cdHash hex representation for indeterminate app check (this should not happen).", (uint8_t *)v41, 2u);
    }

    v35 = 0;
    v30 = 0;
    if (a1)
      goto LABEL_19;
  }
  else
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = sub_1DF32DE18;
    v40[3] = &unk_1EA98AF68;
    v40[5] = v32;
    v40[6] = v30;
    v40[4] = &v42;
    sub_1DF331C3C(a1, (uint64_t)v40);
    v34 = *((_DWORD *)v43 + 6);
    v35 = v34 < 1;
    if (v34 <= 0)
    {
      sub_1DF30EE34();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v41[0] = 0;
        _os_log_impl(&dword_1DF30C000, v37, OS_LOG_TYPE_DEFAULT, "Authorization is pending.", (uint8_t *)v41, 2u);
      }

      if (!v31)
      {
        v35 = 1;
        if (!a1)
          goto LABEL_20;
        goto LABEL_19;
      }
      v36 = 0;
      goto LABEL_10;
    }
    if (v31)
    {
      v36 = v34 < 6;
LABEL_10:
      *v31 = v36;
      if (!a1)
        goto LABEL_20;
LABEL_19:
      CFRelease(a1);
      goto LABEL_20;
    }
    v35 = 0;
    if (a1)
      goto LABEL_19;
  }
LABEL_20:
  if (v30)
    CFRelease(v30);
  _Block_object_dispose(&v42, 8);
  return v35;
}

void sub_1DF32DE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1DF32DE18(_QWORD *a1, CFStringRef theString2, __CFString *a3, uint64_t a4, uint64_t a5, const __CFNumber *a6)
{
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int valuePtr;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = (const __CFString *)a1[5];
  if (v10)
  {
    v11 = 1;
    if (CFStringCompare(v10, a3, 1uLL))
      return v11;
  }
  v12 = (const __CFString *)a1[6];
  if (v12)
  {
    v11 = 1;
    if (CFStringCompare(v12, theString2, 1uLL))
      return v11;
  }
  if (sub_1DF325B64(a3, (const char *)theString2, (uint64_t)a3, a4))
    return 1;
  valuePtr = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (!CFNumberGetValue(a6, kCFNumberIntType, &valuePtr))
  {
    sub_1DF30EE34();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v19 = valuePtr;
      _os_log_error_impl(&dword_1DF30C000, v15, OS_LOG_TYPE_ERROR, "Failure getting value of graceCount for record. Got %d, ignoring.", buf, 8u);
    }

    return 1;
  }
  v13 = *(_QWORD *)(a1[4] + 8);
  v14 = *(_DWORD *)(v13 + 24);
  if (v14 >= valuePtr)
    v14 = valuePtr;
  *(_DWORD *)(v13 + 24) = v14;
  return *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) > 0;
}

uint64_t sub_1DF32DF80(_QWORD *a1, const __CFString *a2, const __CFString *a3, int a4, int a5, int a6, char a7)
{
  char v7;
  BOOL v9;
  __CFArray *Mutable;
  __CFArray *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  const void *v25;
  CFTypeRef v26;
  uint64_t result;
  NSObject *v28;
  char *v29;
  char v30;
  char v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint64_t v37;
  char v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  _QWORD v44[4];
  void *v45;
  uint8_t buf[4];
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    sub_1DF30EE34();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v28, OS_LOG_TYPE_ERROR, "Skipping universal/local profile with NULL UUID.", buf, 2u);
    }

    return 1;
  }
  v7 = a6;
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    v9 = a6 == 0;
  else
    v9 = 0;
  if (v9)
    return 1;
  if (*(_QWORD *)(a1[8] + 16))
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 4, MEMORY[0x1E0C9B378]);
    if (!Mutable)
    {
      sub_1DF30EE34();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DF30C000, v36, OS_LOG_TYPE_ERROR, "Profile record creation failed, bailing out!", buf, 2u);
      }

      return 0;
    }
    v16 = Mutable;
    if (!a3)
      a3 = &stru_1EA98BC08;
    CFArrayAppendValue(Mutable, a2);
    CFArrayAppendValue(v16, a3);
    v17 = (const void *)*MEMORY[0x1E0C9AE50];
    v18 = (const void *)*MEMORY[0x1E0C9AE40];
    if (a4)
      v19 = (const void *)*MEMORY[0x1E0C9AE50];
    else
      v19 = (const void *)*MEMORY[0x1E0C9AE40];
    CFArrayAppendValue(v16, v19);
    if (a5)
      v20 = v17;
    else
      v20 = v18;
    CFArrayAppendValue(v16, v20);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1[8] + 16), v16);
    CFRelease(v16);
  }
  if ((a4 & 1) != 0 || a5)
  {
    v29 = (char *)a1[8];
    if (*v29)
      v30 = 1;
    else
      v30 = a4;
    *v29 = v30;
    if (v29[1])
      v31 = 1;
    else
      v31 = a5;
    v29[1] = v31;
    v32 = sub_1DF331BC0(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), a2);
    sub_1DF30EE34();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = a2;
        _os_log_impl(&dword_1DF30C000, v34, OS_LOG_TYPE_DEFAULT, "Universal/Local Provisioning Profile '%@' is not viable for validation.", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v47 = a2;
        _os_log_impl(&dword_1DF30C000, v34, OS_LOG_TYPE_INFO, "Accepting Universal/Local Provisioning Profile '%@'.", buf, 0xCu);
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = !v32;
    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      v37 = *(_QWORD *)(a1[4] + 8);
      if (*(_BYTE *)(v37 + 24))
        v38 = 1;
      else
        v38 = v7;
      *(_BYTE *)(v37 + 24) = v38;
      v39 = *(const void **)(a1[8] + 8);
      if (v39)
        CFRelease(v39);
      *(_QWORD *)(a1[8] + 8) = CFRetain(a2);
    }
    if (*(_BYTE *)(a1[9] + 64))
    {
      v44[0] = a2;
      v44[1] = a3;
      v40 = MEMORY[0x1E0C9AAA0];
      if (a4)
        v41 = MEMORY[0x1E0C9AAB0];
      else
        v41 = MEMORY[0x1E0C9AAA0];
      if (a5)
        v40 = MEMORY[0x1E0C9AAB0];
      v44[2] = v41;
      v44[3] = v40;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v44, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v42;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v43, (uint64_t)&v45, 1);
      objc_claimAutoreleasedReturnValue();

      sub_1DF32CF4C();
    }
    return 1;
  }
  sub_1DF30EE34();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v47 = a2;
    _os_log_impl(&dword_1DF30C000, v21, OS_LOG_TYPE_INFO, "Using Provisioning Profile '%@'.", buf, 0xCu);
  }

  v22 = a1[8];
  *(_BYTE *)(v22 + 2) = 1;
  *(_BYTE *)(v22 + 3) = a7;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    return 0;
  v23 = *(_QWORD *)(a1[4] + 8);
  if (*(_BYTE *)(v23 + 24))
    v24 = 1;
  else
    v24 = v7;
  *(_BYTE *)(v23 + 24) = v24;
  v25 = *(const void **)(v22 + 8);
  if (v25)
    CFRelease(v25);
  v26 = CFRetain(a2);
  result = 0;
  *(_QWORD *)(a1[8] + 8) = v26;
  return result;
}

uint64_t sub_1DF32E400(_QWORD *a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (*(_BYTE *)(a2 + 16))
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    return 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
}

uint64_t sub_1DF32E45C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const __CFString *v5;
  void *v6;
  MISProfile *v7;
  MISProfile *v8;
  BOOL v9;
  NSObject *v10;
  const __CFString *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v21;
  int v22;
  void *Value;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFDictionary *v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t i;
  id v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  NSObject *v48;
  __CFString *v49;
  const char *v50;
  uint64_t v51;
  int isEqualToString;
  int v53;
  NSObject *v54;
  int v55;
  int isEqual;
  NSObject *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL4 v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  const void *TeamIdentifier;
  _BOOL8 v70;
  _BOOL8 v71;
  _BOOL8 v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL8 v76;
  NSObject *v77;
  _QWORD *v78;
  NSObject *v79;
  uint64_t v80;
  NSObject *v81;
  CFTypeRef cf;
  uint64_t v83;
  _QWORD *v84;
  MISProfile *v85;
  id obj;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  uint64_t v93;
  uint8_t v94[4];
  id v95;
  __int16 v96;
  _BYTE v97[10];
  uint64_t v98;
  CFRange v99;

  v98 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a2 + 16))
  {
    v5 = *(const __CFString **)a2;
    v6 = *(void **)(a2 + 24);
    *(_DWORD *)buf = -402620415;
    v7 = sub_1DF32A904(v6, v5, 0, (int *)buf);
    v8 = v7;
    if (v7)
      v9 = *(_DWORD *)buf == 0;
    else
      v9 = 0;
    if (v9)
    {
      v15 = MISProvisioningProfileCheckValidity(v7, *(const __CFString **)(a1 + 80), *(const __CFDate **)(a1 + 88));
      if (v15)
      {
        v19 = v15;
        if (v15 == -402620399)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        sub_1DF30EE34();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = v19;
        v12 = "Skipping a profile because of error %#x.\n";
        v13 = v10;
        v14 = 8;
        goto LABEL_14;
      }
      objc_msgSend_certs(v8, v16, v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v99.length = CFArrayGetCount((CFArrayRef)v21);
        v99.location = 0;
        v22 = CFArrayContainsValue((CFArrayRef)v21, v99, *(const void **)(a1 + 96));
        v3 = 1;
        if (!v22)
          goto LABEL_17;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      Value = MISProfileGetValue(v8, (uint64_t)CFSTR("UUID"));
      objc_msgSend_entitlements(v8, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        if (MISProvisioningProfileIsForBetaDeployment(v8, v28, v29, v30))
        {
          v31 = *(const __CFDictionary **)(*(_QWORD *)(a1 + 104) + 8);
          if (v31)
          {
            if (CFDictionaryContainsKey(v31, CFSTR("application-identifier"))
              && !sub_1DF32EC90(v8, *(const __CFData **)(*(_QWORD *)(a1 + 104) + 24), *(void **)(*(_QWORD *)(a1 + 104) + 56)))
            {
              v80 = *(_QWORD *)(a1 + 56);
LABEL_61:
              v3 = 1;
              *(_BYTE *)(*(_QWORD *)(v80 + 8) + 24) = 1;
              goto LABEL_17;
            }
          }
        }
        v83 = (uint64_t)Value;
        v84 = (_QWORD *)a1;
        cf = v27;
        MISProfileGetValue(v8, (uint64_t)CFSTR("AppAudience"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v8;
        MISProfileGetValue(v8, (uint64_t)CFSTR("UUID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        obj = v32;
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v88, (uint64_t)buf, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v89;
          v38 = CFSTR("InternalBuild");
          while (2)
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v89 != v37)
                objc_enumerationMutation(obj);
              v40 = *(id *)(*((_QWORD *)&v88 + 1) + 8 * i);
              v41 = v33;
              if (objc_msgSend_isEqual_(v40, v42, (uint64_t)v38, v43, cf))
              {
                v87 = v41;
                v46 = v36;
                v47 = v38;
                sub_1DF3318FC();
                v48 = objc_claimAutoreleasedReturnValue();
                v49 = CFSTR("Internal");
                isEqualToString = objc_msgSend_isEqualToString_(v48, v50, (uint64_t)CFSTR("Internal"), v51);

                v53 = MGGetBoolAnswer();
                sub_1DF30EE34();
                v54 = objc_claimAutoreleasedReturnValue();
                v55 = v53 ^ 1;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v94 = 138543874;
                  v95 = v40;
                  v96 = 1024;
                  *(_DWORD *)v97 = isEqualToString;
                  *(_WORD *)&v97[4] = 1024;
                  *(_DWORD *)&v97[6] = v55;
                  _os_log_impl(&dword_1DF30C000, v54, OS_LOG_TYPE_DEFAULT, "Checking %{public}@ App Audience, %d, %d", v94, 0x18u);
                }

                if (((v55 | isEqualToString) & 1) == 0)
                {
                  sub_1DF30EE34();
                  v77 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v94 = 138543618;
                    v95 = v40;
                    v96 = 2114;
                    *(_QWORD *)v97 = v33;
                    _os_log_error_impl(&dword_1DF30C000, v77, OS_LOG_TYPE_ERROR, "Denying profile %{public}@ due to %{public}@ App Audience", v94, 0x16u);
                  }

                  v78 = v84;
                  v8 = v85;
                  v41 = v87;
LABEL_58:

                  sub_1DF30EE34();
                  v79 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v94 = 138543618;
                    v95 = v40;
                    v96 = 2114;
                    *(_QWORD *)v97 = v33;
                    _os_log_error_impl(&dword_1DF30C000, v79, OS_LOG_TYPE_ERROR, "App audience %{public}@ from profile %{public}@ not matched", v94, 0x16u);
                  }

                  v80 = v78[8];
                  goto LABEL_61;
                }
                v38 = v47;
                v36 = v46;
                v41 = v87;
              }
              else
              {
                isEqual = objc_msgSend_isEqual_(v40, v44, (uint64_t)CFSTR("NoExecute"), v45);
                sub_1DF30EE34();
                v57 = objc_claimAutoreleasedReturnValue();
                v48 = v57;
                if (isEqual)
                {
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v94 = 138543618;
                    v95 = v40;
                    v96 = 2114;
                    *(_QWORD *)v97 = v33;
                    _os_log_error_impl(&dword_1DF30C000, v48, OS_LOG_TYPE_ERROR, "Denying profile %{public}@ due to %{public}@ App Audience", v94, 0x16u);
                  }
                  v78 = v84;
                  v8 = v85;
                  goto LABEL_58;
                }
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v94 = 138543618;
                  v95 = v40;
                  v96 = 2114;
                  *(_QWORD *)v97 = v33;
                  _os_log_impl(&dword_1DF30C000, v48, OS_LOG_TYPE_DEFAULT, "Ignoring unenforced App Audience: %{public}@ from profile %{public}@", v94, 0x16u);
                }
              }

            }
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v88, (uint64_t)buf, 16);
            if (v36)
              continue;
            break;
          }
        }

        v8 = v85;
        if (!*(_QWORD *)(v84[13] + 8)
          || (v62 = objc_msgSend_derEntitlements(v85, v59, v60, v61),
              v63 = *(_QWORD *)(v84[13] + 16),
              v64 = sub_1DF328600(v85, (uint64_t)CFSTR("AppleInternalProfile")) != 0,
              (sub_1DF32EF8C(v62, v63, v83, v64) & 1) != 0))
        {
          if (!sub_1DF328600(v85, (uint64_t)CFSTR("LocalProvision"))
            || (v65 = v84[13], *(_BYTE *)(v65 + 49))
            || sub_1DF32F068(*(_QWORD *)(v65 + 32), *(_QWORD *)(v65 + 40), cf, v83))
          {
            *(_BYTE *)(*(_QWORD *)(v84[9] + 8) + 24) = 1;
            sub_1DF30EE34();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v93 = v83;
              _os_log_impl(&dword_1DF30C000, v66, OS_LOG_TYPE_DEFAULT, "Keep going %@", buf, 0xCu);
            }

            v67 = v84[4];
            v68 = MISProfileGetValue(v85, (uint64_t)CFSTR("UUID"));
            TeamIdentifier = MISProvisioningProfileGetTeamIdentifier(v85);
            v70 = sub_1DF328600(v85, (uint64_t)CFSTR("ProvisionsAllDevices")) != 0;
            v71 = sub_1DF328600(v85, (uint64_t)CFSTR("LocalProvision")) != 0;
            v72 = MISProfileIsDEREncoded(v85) != 0;
            v76 = MISProvisioningProfileIsForBetaDeployment(v85, v73, v74, v75) != 0;
            v3 = (*(uint64_t (**)(uint64_t, void *, const void *, _BOOL8, _BOOL8, _BOOL8, _BOOL8))(v67 + 16))(v67, v68, TeamIdentifier, v70, v71, v72, v76);
            goto LABEL_17;
          }
          sub_1DF30EE34();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v93 = v83;
            _os_log_impl(&dword_1DF30C000, v81, OS_LOG_TYPE_DEFAULT, "Local Profile '%@' has non-matching application-identifier.", buf, 0xCu);
          }

        }
        *(_BYTE *)(*(_QWORD *)(v84[9] + 8) + 24) = 0;
        goto LABEL_16;
      }
      sub_1DF30EE34();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)Value;
        _os_log_error_impl(&dword_1DF30C000, v10, OS_LOG_TYPE_ERROR, "Skipping profile '%@' because it has no entitlement match list?", buf, 0xCu);
      }
    }
    else
    {
      sub_1DF30EE34();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(const __CFString **)a2;
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)v11;
        v12 = "Skipping a profile %@";
        v13 = v10;
        v14 = 12;
LABEL_14:
        _os_log_impl(&dword_1DF30C000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
LABEL_15:

LABEL_16:
    v3 = 1;
LABEL_17:

    return v3;
  }
  v3 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return v3;
}

BOOL sub_1DF32EC90(MISProfile *a1, const __CFData *a2, void *a3)
{
  MISProfile *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  BOOL v15;
  void *v16;
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  int isEqualToString;
  NSObject *v21;
  __CFString *v22;
  const __CFString *v23;
  const __CFArray *Value;
  _BOOL8 v25;
  NSObject *v26;
  MISProfile *v28;
  uint8_t buf[4];
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = a1;
  if (a1)
  {
    v5 = a1;
    CFRetain(a1);
  }
  else
  {
    if (MISCopyProvisioningProfile(0, &v28))
      return 0;
    v5 = v28;
  }
  v9 = objc_msgSend_unsignedIntValue(a3, v6, v7, v8);
  v10 = CFSTR("OSX");
  switch(v9)
  {
    case 1:
      break;
    case 2:
      v10 = CFSTR("iOS");
      break;
    case 3:
      v10 = CFSTR("tvOS");
      break;
    case 4:
      v10 = CFSTR("watchOS");
      break;
    case 10:
      sub_1DF32C124();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("iOS");
      if (!v12)
        v13 = 0;
      v10 = v13;

      break;
    case 11:
      v10 = CFSTR("xrOS");
      break;
    default:
      sub_1DF30EE34();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v9;
        _os_log_error_impl(&dword_1DF30C000, v11, OS_LOG_TYPE_ERROR, "Invalid platform: %du", buf, 8u);
      }

      v10 = CFSTR("invalid");
      break;
  }
  sub_1DF32C124();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = sub_1DF32C090((uint64_t)v14, v5, v10);

  sub_1DF3318FC();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("Internal");
  isEqualToString = objc_msgSend_isEqualToString_(v16, v18, (uint64_t)CFSTR("Internal"), v19);

  if (!v15 && isEqualToString)
  {
    sub_1DF30EE34();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_error_impl(&dword_1DF30C000, v21, OS_LOG_TYPE_ERROR, "TestFlight platform policy failed, the profile did not include the expected platform %@, this would have been a critical failure on a customer build", buf, 0xCu);
    }

    goto LABEL_22;
  }
  if (!v15)
  {
    sub_1DF30EE34();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_error_impl(&dword_1DF30C000, v26, OS_LOG_TYPE_ERROR, "TestFlight platform policy failed, the profile did not include the expected platform %@", buf, 0xCu);
    }

    return 0;
  }
LABEL_22:

  v22 = sub_1DF3296EC(a2);
  if (!v22)
  {
    v25 = 1;
    if (!v5)
      return v25;
    goto LABEL_33;
  }
  v23 = v22;
  Value = (const __CFArray *)MISProfileGetValue(v5, (uint64_t)CFSTR("ProvisioningCDHashes"));
  if (Value)
    v25 = MISArrayAllowsEntitlementValue(Value, v23) != 0;
  else
    v25 = 1;
  CFRelease(v23);
  if (v5)
LABEL_33:
    CFRelease(v5);
  return v25;
}

uint64_t sub_1DF32EF8C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  LODWORD(v4) = a4;
  v10 = *MEMORY[0x1E0C80C00];
  if (CEContextIsSubset() == *MEMORY[0x1E0DDFFA0])
    v4 = 1;
  else
    v4 = v4;
  if ((v4 & 1) == 0)
  {
    sub_1DF30EE34();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = a3;
      _os_log_error_impl(&dword_1DF30C000, v6, OS_LOG_TYPE_ERROR, "Profile %@ failed to validate entitlements", (uint8_t *)&v8, 0xCu);
    }

  }
  return v4;
}

BOOL sub_1DF32F068(uint64_t a1, uint64_t a2, CFTypeRef cf, uint64_t a4)
{
  CFTypeID v8;
  const char *v9;
  uint64_t v10;
  __CFString *v11;
  _BOOL8 v12;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  CFTypeRef v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = CFGetTypeID(cf);
  if (v8 == CFDictionaryGetTypeID())
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("%@.%@"), v10, a2, a1);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = MISEntitlementDictionaryAllowsEntitlementValue((const __CFDictionary *)cf, CFSTR("application-identifier"), v11) != 0;

  }
  else
  {
    sub_1DF30EE34();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = a4;
      v17 = 2112;
      v18 = cf;
      _os_log_error_impl(&dword_1DF30C000, v13, OS_LOG_TYPE_ERROR, "Local Profile '%@' entitlement match list is not a dictionary, but '%@'.", buf, 0x16u);
    }

    return 0;
  }
  return v12;
}

uint64_t sub_1DF32F198(uint64_t a1, const void *a2)
{
  const void *v3;
  const __CFDate *v4;
  OSStatus v5;
  OSStatus v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  OSStatus v11;
  OSStatus v12;
  NSObject *v13;
  CFTypeRef cf;
  SecTrustRef trust;
  uint8_t buf[4];
  CFTypeRef v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(const void **)(a1 + 32);
  v4 = *(const __CFDate **)(a1 + 40);
  trust = 0;
  v5 = SecTrustCreateWithCertificates(v3, a2, &trust);
  if (v5)
  {
    v6 = v5;
    sub_1DF30EE34();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      v9 = 3892346904;

      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    v8 = "SecTrustCreateWithCertificates failed: %d";
LABEL_4:
    _os_log_impl(&dword_1DF30C000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 8u);
    goto LABEL_5;
  }
  if (v4)
  {
    v11 = SecTrustSetVerifyDate(trust, v4);
    if (v11)
    {
      v12 = v11;
      sub_1DF30EE34();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v12;
      v8 = "SecTrustSetVerifyDate failed: %d";
      goto LABEL_4;
    }
  }
  cf = 0;
  if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
  {
    v9 = 0;
  }
  else
  {
    sub_1DF30EE34();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = cf;
      _os_log_impl(&dword_1DF30C000, v13, OS_LOG_TYPE_INFO, "SecTrustEvaluateWithError failed: %@", buf, 0xCu);
    }
    v9 = 3892346904;

    CFRelease(cf);
  }
LABEL_6:
  if (trust)
    CFRelease(trust);
  CFRelease(a2);
  return v9;
}

uint64_t sub_1DF32F354()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)qword_1F0475450;
  qword_1F0475450 = (uint64_t)v0;

  return MEMORY[0x1E0DE7D20](qword_1F0475450, sel_setCountLimit_, 100, v2);
}

uint64_t MISValidateSignature(const __CFString *a1, const __CFDictionary *a2)
{
  return MISValidateSignatureAndCopyInfoWithProgress(a1, a2, 0, 0);
}

uint64_t MISAppApprovalState(const __CFString *a1, const __CFDictionary *a2)
{
  NSObject *v4;
  NSObject *v5;
  const __SecCode *v6;
  const __SecCode *v7;
  const __CFDictionary *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned int v12;
  Boolean v13;
  Boolean v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 1;
  v13 = 0;
  if (sub_1DF30EE84(a2, CFSTR("HonorBlocklist"), &v14))
  {
    sub_1DF30EE34();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v4, OS_LOG_TYPE_ERROR, "MISAppAprovalState failed to check kMISValidationOptionHonorBlocklist option.", buf, 2u);
    }

    v14 = 1;
  }
  v12 = sub_1DF30EE84(a2, CFSTR("ReportIndeterminateSoon"), &v13);
  if (v12)
  {
    sub_1DF30EE34();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v5, OS_LOG_TYPE_ERROR, "MISAppAprovalState failed to check kMISAppApprovalStateReportIndeterminateSoon option.", buf, 2u);
    }

    v13 = 0;
  }
  v6 = (const __SecCode *)sub_1DF3108C4(a1, (uint64_t)a2, (int *)&v12);
  if (v6)
  {
    v7 = v6;
    sub_1DF310FF0(v6);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (sub_1DF311048(v8))
        sub_1DF32DA50();
      sub_1DF30EE34();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v16) = v12;
        _os_log_impl(&dword_1DF30C000, v10, OS_LOG_TYPE_DEFAULT, "Could not extract cdhash: 0x%x", buf, 8u);
      }

    }
    CFRelease(v7);
  }
  else
  {
    sub_1DF30EE34();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v12;
      _os_log_impl(&dword_1DF30C000, v9, OS_LOG_TYPE_DEFAULT, "Could not copy signature: 0x%x", buf, 8u);
    }
  }

  return 1;
}

void MISExistsIndeterminateAppsByUPP()
{
  MISExistsIndeterminateApps_0();
}

void MISValidateUPP(void *a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (!sub_1DF325B64(a1, v7, v8, v9))
    sub_1DF3319A0();
  v6[2](v6, 3, 0);

}

void sub_1DF32FBC4()
{
  _QWORD v0[4];
  _QWORD v1[4];

  v1[0] = 0;
  v1[1] = v1;
  v1[2] = 0x2020000000;
  v1[3] = 0;
  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x2020000000;
  v0[3] = 0;
  sub_1DF3319A0();
}

void sub_1DF32FC10(const __CFArray *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[4];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1DF32FCCC;
  v7[3] = &unk_1EA98ADF0;
  v6 = *(_QWORD *)(v1 + 40);
  v9 = v3;
  v10 = v6;
  v8 = v2;
  sub_1DF331C3C(a1, (uint64_t)v7);
  if (a1)
    CFRelease(a1);
  (*(void (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose((const void *)(v4 - 64), 8);
}

void sub_1DF32FCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF32FCCC(uint64_t a1, const __CFString *a2, CFStringRef theString2, const __CFString *a4)
{
  CFIndex Length;
  uint64_t v8;
  uint64_t v9;
  const __CFAllocator *v10;
  char *v11;
  CFIndex v12;
  UInt8 *v13;
  UInt8 *v14;
  unsigned __int8 *v15;
  UInt8 *v16;
  CFIndex v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  _BOOL4 v22;
  char v23;
  BOOL v24;
  int v25;
  char v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  BOOL v31;
  char v32;
  BOOL v33;
  char v34;
  char v35;
  char v36;
  const __CFData *v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v43;
  const char *v44;
  const char *v45;
  NSObject *v46;
  const char *v47;
  uint8_t buf[4];
  const char *CStringPtr;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (CFStringCompare(*(CFStringRef *)(a1 + 48), theString2, 1uLL))
    return 1;
  Length = CFStringGetLength(a2);
  v8 = Length;
  if ((Length & 1) != 0)
  {
LABEL_46:
    sub_1DF30EE34();
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_47:

      return 1;
    }
    *(_DWORD *)buf = 136315138;
    CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
    v45 = "MISValidateUPP: could not process cdhash '%s'";
LABEL_54:
    _os_log_error_impl(&dword_1DF30C000, v41, OS_LOG_TYPE_ERROR, v45, buf, 0xCu);
    goto LABEL_47;
  }
  if (Length >= 0)
    v9 = Length;
  else
    v9 = Length + 1;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9 | 1, 0);
  if (!CFStringGetCString(a2, v11, v9 | 1, 0x600u))
    goto LABEL_37;
  v12 = v9 >> 1;
  v13 = (UInt8 *)CFAllocatorAllocate(v10, v12, 0);
  v14 = v13;
  if (v8 >= 2)
  {
    v15 = (unsigned __int8 *)(v11 + 1);
    v16 = v13;
    v17 = v12;
    do
    {
      v18 = *(v15 - 1);
      v19 = v18 - 48;
      v20 = v18 - 97;
      v21 = v18 - 55;
      v22 = (v18 - 65) < 6;
      if ((v18 - 65) >= 6)
        v21 = 0;
      v23 = v18 - 87;
      v24 = v20 > 5;
      v25 = v20 <= 5 || v22;
      if (v24)
        v23 = v21;
      if (v19 < 0xA)
      {
        v25 = 1;
        v23 = v19;
      }
      v26 = 16 * v23;
      v27 = *v15;
      v28 = v27 - 48;
      v29 = v27 - 97;
      v30 = v27 - 55;
      v31 = (v27 - 65) < 6;
      if ((v27 - 65) >= 6)
        v30 = 0;
      v32 = v27 - 87;
      v33 = v29 > 5;
      v34 = v29 <= 5 || v31;
      if (v33)
        v35 = v30;
      else
        v35 = v32;
      if (v28 >= 0xA)
        v36 = v34;
      else
        v36 = 1;
      if (v28 >= 0xA)
        LOBYTE(v28) = v35;
      *v16 = v28 | v26;
      if (!v25 || (v36 & 1) == 0)
        goto LABEL_36;
      ++v16;
      v15 += 2;
    }
    while (--v17);
  }
  v37 = CFDataCreateWithBytesNoCopy(v10, v14, v12, v10);
  if (!v37 && v14)
  {
LABEL_36:
    CFAllocatorDeallocate(v10, v14);
LABEL_37:
    v37 = 0;
  }
  if (v11)
    CFAllocatorDeallocate(v10, v11);
  if (!v37)
    goto LABEL_46;
  v38 = sub_1DF3308B4(v37, *(const __CFString **)(a1 + 48), a4, 0, 0, 0, 0, 2, 0);
  CFRelease(v37);
  if ((v38 & 1) == 0)
  {
    if ((v38 & 2) != 0)
    {
      sub_1DF30EE34();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = *(const char **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        CStringPtr = v44;
        _os_log_impl(&dword_1DF30C000, v43, OS_LOG_TYPE_DEFAULT, "Provisioning profile '%@' is banned.", buf, 0xCu);
      }

      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v40 = 2;
      goto LABEL_52;
    }
    if ((v38 & 8) == 0)
    {
      if ((v38 & 0x34) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v38 & 0x34;
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v40 = 1;
LABEL_52:
        *(_QWORD *)(v39 + 24) = v40;
        return 1;
      }
      sub_1DF30EE34();
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_DWORD *)buf = 134217984;
      CStringPtr = (const char *)v38;
      v45 = "MISValidateUPP: weird answer 0x%llx encountered.";
      goto LABEL_54;
    }
    sub_1DF30EE34();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = *(const char **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      CStringPtr = v47;
      _os_log_impl(&dword_1DF30C000, v46, OS_LOG_TYPE_DEFAULT, "Profile '%@' has a rejected app.", buf, 0xCu);
    }

  }
  return 1;
}

void MISUPPTrusted(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  sub_1DF32BF70(a1, a2, a3, a4);
}

uint64_t sub_1DF3300B8(int a1)
{
  uint64_t v1;
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;

  if (!a1)
    sub_1DF3319A0();
  v2 = (void *)objc_opt_new();
  v12 = 0;
  objc_msgSend_profileEntryExistsWithUuidString_error_(v2, v3, v1, (uint64_t)&v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    sub_1DF30EE34();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412546;
      v14 = v1;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1DF30C000, v9, OS_LOG_TYPE_ERROR, "could not retrieve profile entry for UUID %@: %@", (uint8_t *)&v13, 0x16u);
    }

    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend_BOOLValue(v4, v5, v6, v7);
  }

  return v10;
}

uint64_t MISCopyAuxiliarySignature(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v12 = 0;
  objc_msgSend_getAuxiliarySignatureWithTeamId_error_(v2, v3, a1, (uint64_t)&v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    sub_1DF30EE34();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = a1;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1DF30C000, v9, OS_LOG_TYPE_ERROR, "encountered error when retrieving auxiliary signature for teamId %@: %@", buf, 0x16u);
    }

    v10 = 0;
  }
  else
  {
    objc_msgSend_signature(v4, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t MISProfileSupportsAuxiliarySignature(void *a1)
{
  void *Value;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  Value = MISProfileGetValue(a1, (uint64_t)CFSTR("UUID"));
  result = sub_1DF328600(a1, (uint64_t)CFSTR("ProvisionsAllDevices"));
  if ((_DWORD)result)
    return !sub_1DF325B64(Value, v4, v5, v6);
  return result;
}

void MISSetUPPTrust(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  sub_1DF32BF70(a1, a2, a3, a4);
}

void sub_1DF330374(int a1)
{
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  int v4;
  int v5;

  if (a1)
  {
    v3 = v1;
    if (v2)
    {
      MISSetProfileTrust(v1, 0);
      return;
    }
    v4 = 0;
    v5 = 1;
  }
  else
  {
    v3 = v1;
    v4 = v2;
    v5 = 0;
  }
  sub_1DF330DB0(v3, v4, v5, 0, 0);
}

void MISSetProfileTrust(const __CFString *a1, const __CFData *a2)
{
  int v4;
  CFTypeRef v5;
  __CFString *TeamIdentifier;
  CFTypeRef cf;

  cf = 0;
  v4 = MISCopyProvisioningProfile(a1, (MISProfile **)&cf);
  v5 = cf;
  if (v4)
  {
    if (!cf)
      return;
    goto LABEL_3;
  }
  TeamIdentifier = (__CFString *)MISProvisioningProfileGetTeamIdentifier((void *)cf);
  sub_1DF330DB0(a1, 1, 1, TeamIdentifier, a2);
  if (v5)
LABEL_3:
    CFRelease(v5);
}

void MISRemoveProfileTrust(const __CFString *a1)
{
  sub_1DF330DB0(a1, 0, 1, 0, 0);
}

void MISEnumerateTrustedUPPs(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  sub_1DF32BF70((uint64_t)v1, v2, v3, v4);
}

uint64_t sub_1DF3306F8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t MISValidationCopySignatureVersion(const __CFString *a1, const void **a2)
{
  const __SecCode *v3;
  const __SecCode *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  unsigned int v9;

  v9 = 0;
  v3 = (const __SecCode *)sub_1DF3108C4(a1, 0, (int *)&v9);
  if (!v3)
    return 3892346908;
  v4 = v3;
  sub_1DF310FF0(v3);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (a2)
      *a2 = sub_1DF311084(v5);
  }
  else
  {
    v9 = -402620407;
  }
  CFRelease(v4);
  v7 = v9;

  return v7;
}

void MISDataMigrate(const __CFNumber *a1)
{
  uint64_t v1;
  xpc_object_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t valuePtr;
  uint8_t buf[16];

  valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr);
  v1 = valuePtr;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_string(v2, "type", "rqup");
    xpc_dictionary_set_uint64(v3, "phas", v1);
    sub_1DF330BBC(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4 && MEMORY[0x1E0BFEE88](v4) != MEMORY[0x1E0C81310])
      xpc_dictionary_get_int64(v5, "resu");
  }
  else
  {
    sub_1DF30EE34();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v6, OS_LOG_TYPE_ERROR, "Could not create XPC message for requestUpgrade", buf, 2u);
    }

    v5 = 0;
  }

}

int64_t sub_1DF3308B4(const __CFData *a1, const __CFString *a2, const __CFString *a3, const __CFBoolean *a4, const __CFBoolean *a5, const __CFNumber *a6, void *a7, int64_t a8, const __CFString *a9)
{
  void *v16;
  void *v17;
  char *v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  int64_t int64;
  xpc_object_t v24;
  const char *v25;
  const UInt8 *BytePtr;
  size_t Length;
  const UInt8 *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  BOOL v33;
  double v34;
  uint64_t v35;
  void *v37;
  uint64_t valuePtr;

  v16 = sub_1DF330B40(a2);
  if (!v16)
    goto LABEL_7;
  v17 = v16;
  v18 = (char *)sub_1DF330B40(a3);
  if (!v18)
  {
    free(v17);
LABEL_7:
    v22 = 0;
    v21 = 0;
    int64 = 4;
    goto LABEL_28;
  }
  v19 = v18;
  if (a9)
  {
    v20 = (char *)sub_1DF330B40(a9);
    if (!v20)
    {
      v21 = 0;
LABEL_24:
      v22 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v20 = 0;
  }
  v24 = xpc_dictionary_create(0, 0, 0);
  v21 = v24;
  if (!v24)
    goto LABEL_24;
  v37 = a7;
  xpc_dictionary_set_string(v24, "type", "auth");
  v25 = v20;
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v28 = BytePtr;
  v20 = (char *)v25;
  xpc_dictionary_set_data(v21, "cdha", v28, Length);
  xpc_dictionary_set_string(v21, "uuid", (const char *)v17);
  xpc_dictionary_set_string(v21, "team", v19);
  xpc_dictionary_set_int64(v21, "ckty", a8);
  if (v25)
    xpc_dictionary_set_string(v21, "apppath", v25);
  if (a4)
  {
    v32 = CFBooleanGetValue(a4) != 0;
    xpc_dictionary_set_BOOL(v21, "univ", v32);
  }
  if (a5)
  {
    v33 = CFBooleanGetValue(a5) != 0;
    xpc_dictionary_set_BOOL(v21, "locl", v33);
  }
  if (a6)
  {
    valuePtr = 0;
    if (CFNumberGetValue(a6, kCFNumberLongLongType, &valuePtr))
      xpc_dictionary_set_uint64(v21, "cdvr", valuePtr);
  }
  if (v37)
  {
    objc_msgSend_timeIntervalSince1970(v37, v29, v30, v31);
    xpc_dictionary_set_int64(v21, "sgnt", (uint64_t)(v34 * 1000.0));
  }
  sub_1DF330BBC(v21);
  v35 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v35;
  if (v35 && MEMORY[0x1E0BFEE88](v35) != MEMORY[0x1E0C81310])
  {
    int64 = xpc_dictionary_get_int64(v22, "resu");
    goto LABEL_26;
  }
LABEL_25:
  int64 = 4;
LABEL_26:
  free(v17);
  free(v19);
  if (v20)
    free(v20);
LABEL_28:

  return int64;
}

void *sub_1DF330B40(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  void *v4;

  Length = CFStringGetLength(a1);
  v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v4 = malloc_type_malloc(v3, 0x83B3C0F7uLL);
  if (v4 && !CFStringGetCString(a1, (char *)v4, v3, 0x8000100u))
  {
    free(v4);
    return 0;
  }
  return v4;
}

id sub_1DF330BBC(void *a1)
{
  id v1;
  NSObject *v2;
  _xpc_connection_s *mach_service;
  xpc_object_t v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.online-auth-agent.xpc", v2, 0);

  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &unk_1EA98AFA8);
    xpc_connection_resume(mach_service);
    v4 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
  }
  else
  {
    sub_1DF30EE34();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "com.apple.online-auth-agent.xpc";
      _os_log_error_impl(&dword_1DF30C000, v5, OS_LOG_TYPE_ERROR, "error, could not lookup %s service", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

void sub_1DF330CE0(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v7;
  uint8_t buf[2];

  if (MEMORY[0x1E0BFEE88](a2) != MEMORY[0x1E0C81310])
  {
    sub_1DF30EE34();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 0;
      v4 = "unexpected event in handler for referenced item service\n";
      v5 = (uint8_t *)&v7;
LABEL_10:
      _os_log_error_impl(&dword_1DF30C000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a2 != MEMORY[0x1E0C81258] && a2 != MEMORY[0x1E0C81260])
  {
    sub_1DF30EE34();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v4 = "unexpected error with online-auth-agent connection\n";
      v5 = buf;
      goto LABEL_10;
    }
LABEL_11:

  }
}

void sub_1DF330DB0(const __CFString *a1, int a2, int a3, __CFString *a4, const __CFData *a5)
{
  void *v9;
  void *v10;
  xpc_object_t v11;
  void *v12;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v9 = sub_1DF330B40(a1);
  if (!v9)
  {
    sub_1DF30EE34();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v17, OS_LOG_TYPE_ERROR, "Could not convert UPP UUID for setUppTrust", buf, 2u);
    }

    goto LABEL_18;
  }
  v10 = v9;
  v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    sub_1DF30EE34();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1DF30C000, v18, OS_LOG_TYPE_ERROR, "Could not create XPC message for setUppTrust", v19, 2u);
    }

    free(v10);
LABEL_18:
    v16 = 0;
    v12 = 0;
    goto LABEL_19;
  }
  v12 = v11;
  xpc_dictionary_set_string(v11, "type", "trst");
  xpc_dictionary_set_string(v12, "uuid", (const char *)v10);
  xpc_dictionary_set_BOOL(v12, "trst", a2 != 0);
  xpc_dictionary_set_BOOL(v12, "usdb", a3 != 0);
  if (a4)
  {
    a4 = (__CFString *)sub_1DF330B40(a4);
    xpc_dictionary_set_string(v12, "team", (const char *)a4);
  }
  if (a5)
  {
    BytePtr = CFDataGetBytePtr(a5);
    Length = CFDataGetLength(a5);
    xpc_dictionary_set_data(v12, "xsig", BytePtr, Length);
  }
  sub_1DF330BBC(v12);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15 && MEMORY[0x1E0BFEE88](v15) != MEMORY[0x1E0C81310])
    xpc_dictionary_get_int64(v16, "resu");
  free(v10);
  if (a4)
    free(a4);
LABEL_19:

}

int64_t sub_1DF330FC8(uint64_t a1, int a2)
{
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t int64;
  NSObject *v9;
  uint8_t v11[16];

  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (!v4)
  {
    sub_1DF30EE34();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1DF30C000, v9, OS_LOG_TYPE_ERROR, "Could not create XPC message for setBlacklistOverride", v11, 2u);
    }

    v7 = 0;
    goto LABEL_8;
  }
  xpc_dictionary_set_string(v4, "type", "lwov");
  xpc_dictionary_set_uint64(v5, "lwid", a1);
  xpc_dictionary_set_BOOL(v5, "ovrr", a2 != 0);
  sub_1DF330BBC(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6 || MEMORY[0x1E0BFEE88](v6) == MEMORY[0x1E0C81310])
  {
LABEL_8:
    int64 = 4;
    goto LABEL_9;
  }
  int64 = xpc_dictionary_get_int64(v7, "resu");
LABEL_9:

  return int64;
}

int64_t sub_1DF3310F4(unsigned int a1, const __CFData *a2, CFDataRef *a3)
{
  xpc_object_t v6;
  void *v7;
  const UInt8 *BytePtr;
  size_t v9;
  uint64_t v10;
  void *v11;
  int64_t int64;
  const UInt8 *data;
  NSObject *v14;
  size_t length;
  uint8_t buf[16];

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (!v6)
  {
    sub_1DF30EE34();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DF30C000, v14, OS_LOG_TYPE_ERROR, "Could not create XPC message for checkLaunchWarning", buf, 2u);
    }

    v11 = 0;
    goto LABEL_9;
  }
  xpc_dictionary_set_string(v6, "type", "chlw");
  xpc_dictionary_set_int64(v7, "cdht", a1);
  BytePtr = CFDataGetBytePtr(a2);
  v9 = CFDataGetLength(a2);
  xpc_dictionary_set_data(v7, "cdhd", BytePtr, v9);
  sub_1DF330BBC(v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10 || MEMORY[0x1E0BFEE88](v10) == MEMORY[0x1E0C81310])
  {
LABEL_9:
    int64 = 4;
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(v11, "resu");
  if (a3)
  {
    length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(v11, "warndata", &length);
    *a3 = CFDataCreate(0, data, length);
  }
LABEL_10:

  return int64;
}

CFStringRef MISCopyErrorStringForErrorCodeUnlocalized(uint64_t a1)
{
  CFStringRef result;

  switch(a1)
  {
    case 0xE8008001:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("An unknown error has occurred."));
      break;
    case 0xE8008002:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Attempted to modify an immutable provisioning profile."));
      break;
    case 0xE8008003:
    case 0xE8008005:
    case 0xE8008006:
    case 0xE8008007:
    case 0xE8008008:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("This provisioning profile is malformed."));
      break;
    case 0xE8008004:
    case 0xE800800E:
    case 0xE8008013:
    case 0xE800801A:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("This provisioning profile does not have a valid signature (or it has a valid, but untrusted signature)."));
      break;
    case 0xE8008009:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The signature was not valid."));
      break;
    case 0xE800800A:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Unable to allocate memory."));
      break;
    case 0xE800800B:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("A file operation failed."));
      break;
    case 0xE800800C:
    case 0xE800800D:
    case 0xE800801B:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("There was an error communicating with your device."));
      break;
    case 0xE800800F:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The application's signature is valid but it does not match the expected hash."));
      break;
    case 0xE8008010:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("This provisioning profile is unsupported."));
      break;
    case 0xE8008011:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("This provisioning profile has expired."));
      break;
    case 0xE8008012:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("This provisioning profile cannot be installed on this device."));
      break;
    case 0xE8008014:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The executable contains an invalid signature."));
      break;
    case 0xE8008015:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("A valid provisioning profile for this executable was not found."));
      break;
    case 0xE8008016:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The executable was signed with invalid entitlements."));
      break;
    case 0xE8008017:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("A signed resource has been added, modified, or deleted."));
      break;
    case 0xE8008018:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The identity used to sign the executable is no longer valid."));
      break;
    case 0xE8008019:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The application does not have a valid signature."));
      break;
    case 0xE800801C:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("No code signature found."));
      break;
    case 0xE800801D:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Rejected by policy."));
      break;
    case 0xE800801E:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The requested profile does not exist (it may have been removed)."));
      break;
    case 0xE800801F:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Attempted to install a Beta profile without the proper entitlement."));
      break;
    case 0xE8008020:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Attempted to install a Beta profile over lockdown connection."));
      break;
    case 0xE8008021:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The maximum number of apps for free development profiles has been reached."));
      break;
    case 0xE8008022:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("An error occured while accessing the profile database."));
      break;
    case 0xE8008023:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("An error occured while communicating with the agent."));
      break;
    case 0xE8008024:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The provisioning profile is banned."));
      break;
    case 0xE8008025:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The user did not explicitly trust the provisioning profile."));
      break;
    case 0xE8008026:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The provisioning profile requires online authorization."));
      break;
    case 0xE8008027:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The cdhash is not in the trust cache."));
      break;
    case 0xE8008028:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Invalid arguments or option combination."));
      break;
    case 0xE8008029:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The code signature version is no longer supported."));
      break;
    case 0xE800802A:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The application's signature is valid, but a provisioning profile can not be found that matches this version."));
      break;
    case 0xE800802B:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("Running this application requires Developer Mode to be enabled."));
      break;
    case 0xE800802C:
      result = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("The provisioning profile's App Audience is not suitable for this device."));
      break;
    default:
      result = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("An unexpected error was encountered (0x%X)"), a1);
      break;
  }
  return result;
}

CFStringRef MISCopyErrorStringForErrorCode(uint64_t a1)
{
  const __CFString *v1;
  __CFBundle *MainBundle;
  CFStringRef v3;

  v1 = MISCopyErrorStringForErrorCodeUnlocalized(a1);
  MainBundle = CFBundleGetMainBundle();
  v3 = CFBundleCopyLocalizedString(MainBundle, v1, v1, 0);
  CFRelease(v1);
  return v3;
}

id sub_1DF331664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  int local_signing_public_key;

  v4 = (void *)qword_1F0475460;
  if (qword_1F0475460)
    return v4;
  objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], 0, 97, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1F0475460;
  qword_1F0475460 = v6;

  v11 = (_BYTE *)objc_msgSend_mutableBytes((void *)qword_1F0475460, v8, v9, v10);
  local_signing_public_key = amfi_interface_get_local_signing_public_key(v11);
  v4 = (void *)qword_1F0475460;
  if (!local_signing_public_key)
    return v4;
  qword_1F0475460 = 0;

  return 0;
}

uint64_t sub_1DF3316D4(const char *a1, int a2)
{
  int v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  int v11;
  int v13;
  stat v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
  v4 = open(a1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4 == -1)
  {
    sub_1DF30EE34();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = *__error();
      *(_DWORD *)buf = 67109378;
      v16 = v13;
      v17 = 2080;
      v18 = a1;
      _os_log_error_impl(&dword_1DF30C000, v7, OS_LOG_TYPE_ERROR, "unable to open file to update permissions: %d, %s", buf, 0x12u);
    }

    return 0;
  }
  v5 = v4;
  if (fstat(v4, &v14) < 0)
  {
    sub_1DF30EE34();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v9 = *__error();
    *(_DWORD *)buf = 67109378;
    v16 = v9;
    v17 = 2080;
    v18 = a1;
    v10 = "unable to check filesystem permissions on db: %d, %s";
  }
  else
  {
    if ((v14.st_mode & 0x1FF) == a2 || (fchmod(v5, a2) & 0x80000000) == 0)
    {
      v6 = 1;
      if (v5 < 0)
        return v6;
      goto LABEL_17;
    }
    sub_1DF30EE34();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v11 = *__error();
    *(_DWORD *)buf = 67109378;
    v16 = v11;
    v17 = 2080;
    v18 = a1;
    v10 = "unable to set filesystem permissions on db: %d, %s";
  }
  _os_log_error_impl(&dword_1DF30C000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
LABEL_16:

  v6 = 0;
  if ((v5 & 0x80000000) == 0)
LABEL_17:
    close(v5);
  return v6;
}

uint64_t sub_1DF3318F4(const char *a1)
{
  return sub_1DF3316D4(a1, 420);
}

id sub_1DF3318FC()
{
  return (id)MGCopyAnswer();
}

void sub_1DF3319A0()
{
  sub_1DF32BE04();
}

CFArrayRef sub_1DF3319C8(const __CFURL *a1)
{
  __CFReadStream *v2;
  __CFReadStream *v3;
  const __CFArray *v4;
  CFArrayRef v5;
  CFTypeID v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  CFErrorRef v12;
  int v13;
  CFErrorRef v14;

  if (a1)
  {
    v2 = CFReadStreamCreateWithFile(0, a1);
    v3 = v2;
    v12 = 0;
    if (v2)
    {
      if (CFReadStreamOpen(v2))
      {
        v4 = (const __CFArray *)CFPropertyListCreateWithStream(0, v3, 0, 0, 0, &v12);
        if (v4)
        {
          v5 = v4;
          v6 = CFGetTypeID(v4);
          if (v6 == CFArrayGetTypeID())
            goto LABEL_17;
          v7 = sub_1DF30EE34();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v13) = 0;
            _os_log_impl(&dword_1DF30C000, v7, OS_LOG_TYPE_DEFAULT, "CreateMISAuthListWithStream: plist root has wrong type", (uint8_t *)&v13, 2u);
          }
          CFRelease(v5);
        }
        else
        {
          v10 = sub_1DF30EE34();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 138412290;
            v14 = v12;
            _os_log_impl(&dword_1DF30C000, v10, OS_LOG_TYPE_DEFAULT, "CreateMISAuthListWithStream: authList parse failed (malformed?), error %@", (uint8_t *)&v13, 0xCu);
          }
        }
LABEL_16:
        v5 = 0;
LABEL_17:
        if (v12)
          CFRelease(v12);
        if (v5)
          goto LABEL_21;
      }
    }
    else
    {
      v9 = sub_1DF30EE34();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_error_impl(&dword_1DF30C000, v9, OS_LOG_TYPE_ERROR, "CreateMISAuthListWithStream: creating stream failed", (uint8_t *)&v13, 2u);
        goto LABEL_16;
      }
    }
    v5 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
LABEL_21:
    CFRelease(a1);
    if (v3)
      CFRelease(v3);
    return v5;
  }
  v8 = sub_1DF30EE34();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v13) = 0;
    _os_log_error_impl(&dword_1DF30C000, v8, OS_LOG_TYPE_ERROR, "CreateMISAuthListWithFile: url is NULL", (uint8_t *)&v13, 2u);
  }
  return 0;
}

BOOL sub_1DF331BC0(_BOOL8 result, const __CFString *a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFString *ValueAtIndex;
  CFComparisonResult v8;

  if (result)
  {
    v3 = (const __CFArray *)result;
    Count = CFArrayGetCount((CFArrayRef)result);
    v5 = Count - 1;
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v6 = 0;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v6);
        v8 = CFStringCompare(ValueAtIndex, a2, 1uLL);
        result = v8 == kCFCompareEqualTo;
        if (v8 == kCFCompareEqualTo)
          break;
      }
      while (v5 != v6++);
    }
  }
  return result;
}

void sub_1DF331C3C(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeID v7;
  const __CFDictionary *v8;
  const void *Value;
  const void *v10;
  const void *v11;
  const void *v12;
  const __CFNumber *v13;
  CFNumberRef v14;
  CFTypeID v15;
  CFTypeID v16;
  CFTypeID v17;
  CFTypeID v18;
  CFTypeID v19;
  NSObject *v20;
  uint8_t *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  int valuePtr;
  uint8_t buf[2];
  __int16 v28;

  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v4 = Count;
    for (i = 0; i != v4; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      v7 = CFGetTypeID(ValueAtIndex);
      if (v7 == CFDictionaryGetTypeID())
      {
        v8 = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, i);
        Value = CFDictionaryGetValue(v8, CFSTR("cdhash"));
        v10 = CFDictionaryGetValue(v8, CFSTR("upp-uuid"));
        v11 = CFDictionaryGetValue(v8, CFSTR("teamid"));
        v12 = CFDictionaryGetValue(v8, CFSTR("type"));
        v13 = (const __CFNumber *)CFDictionaryGetValue(v8, CFSTR("grace"));
        if (Value
          && (v14 = v13, v15 = CFGetTypeID(Value), v15 == CFStringGetTypeID())
          && v10
          && (v16 = CFGetTypeID(v10), v16 == CFStringGetTypeID())
          && v11
          && (v17 = CFGetTypeID(v11), v17 == CFStringGetTypeID())
          && v12
          && (v18 = CFGetTypeID(v12), v18 == CFNumberGetTypeID()))
        {
          if (!v14 || (v19 = CFGetTypeID(v14), v19 != CFNumberGetTypeID()))
          {
            valuePtr = 0;
            v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          }
          if (!(*(unsigned int (**)(uint64_t, const void *, const void *, const void *, const void *, CFNumberRef))(a2 + 16))(a2, Value, v10, v11, v12, v14))return;
        }
        else
        {
          v24 = sub_1DF30EE34();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v21 = buf;
            v22 = v24;
            v23 = "indeterminateListIterate: malformed row";
            goto LABEL_21;
          }
        }
      }
      else
      {
        v20 = sub_1DF30EE34();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 0;
          v21 = (uint8_t *)&v28;
          v22 = v20;
          v23 = "indeterminateListIterate: row with unknown type";
LABEL_21:
          _os_log_impl(&dword_1DF30C000, v22, OS_LOG_TYPE_DEFAULT, v23, v21, 2u);
        }
      }
    }
  }
}

uint64_t sub_1DF331E78()
{
  return MEMORY[0x1E0CADE70]();
}

uint64_t sub_1DF331E84()
{
  return MEMORY[0x1E0CADE90]();
}

uint64_t sub_1DF331E90()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1DF331E9C()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1DF331EA8()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1DF331EB4()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1DF331EC0()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1DF331ECC()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1DF331ED8()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1DF331EE4()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1DF331EF0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DF331EFC()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1DF331F08()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DF331F14()
{
  return MEMORY[0x1E0CAFEE0]();
}

uint64_t sub_1DF331F20()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1DF331F2C()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1DF331F38()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1DF331F44()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DF331F50()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1DF331F5C()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1DF331F68()
{
  return MEMORY[0x1E0CB01B0]();
}

uint64_t sub_1DF331F74()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DF331F80()
{
  return MEMORY[0x1E0CB0220]();
}

uint64_t sub_1DF331F8C()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_1DF331F98()
{
  return MEMORY[0x1E0CB03A8]();
}

uint64_t sub_1DF331FA4()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1DF331FB0()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1DF331FBC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DF331FC8()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1DF331FD4()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1DF331FE0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DF331FEC()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1DF331FF8()
{
  return MEMORY[0x1E0DF2010]();
}

uint64_t sub_1DF332004()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_1DF332010()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1DF33201C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DF332028()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1DF332034()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1DF332040()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DF33204C()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1DF332058()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1DF332064()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DF332070()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DF33207C()
{
  return MEMORY[0x1E0DEA830]();
}

uint64_t sub_1DF332088()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DF332094()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DF3320A0()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DF3320AC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DF3320B8()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1DF3320C4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DF3320D0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1DF3320DC()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1DF3320E8()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1DF3320F4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DF332100()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DF33210C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DF332118()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1DF332124()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DF332130()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DF33213C()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1DF332148()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DF332154()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DF332160()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DF33216C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DF332178()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1DF332184()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DF332190()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DF33219C()
{
  return MEMORY[0x1E0DEDF40]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

uint64_t CEContextIsSubset()
{
  return MEMORY[0x1E0DDFED0]();
}

uint64_t CEContextQuery()
{
  return MEMORY[0x1E0DDFED8]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x1E0DDFEE8]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x1E0DDFEF0]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x1E0DDFEF8]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x1E0DDFF10]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

Boolean CFCalendarAddComponents(CFCalendarRef calendar, CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98220](calendar, at, options, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x1E0C98230]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98648](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

uint64_t CFPropertyListCreateWithDERData()
{
  return MEMORY[0x1E0CD5BE0]();
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99438](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t SecCMSVerify()
{
  return MEMORY[0x1E0CD5F20]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

uint64_t SecCertificateIsSelfSigned()
{
  return MEMORY[0x1E0CD6058]();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x1E0CD61F0](code, *(_QWORD *)&flags, information);
}

uint64_t SecCodeSetDetachedSignature()
{
  return MEMORY[0x1E0CD6200]();
}

uint64_t SecCodeSpecialSlotIsPresent()
{
  return MEMORY[0x1E0CD6208]();
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x1E0CD64D8]();
}

uint64_t SecPolicyCreateOSXProvisioningProfileSigning()
{
  return MEMORY[0x1E0CD64F8]();
}

uint64_t SecPolicyCreateiPhoneApplicationSigning()
{
  return MEMORY[0x1E0CD6558]();
}

uint64_t SecPolicyCreateiPhoneProfileApplicationSigning()
{
  return MEMORY[0x1E0CD6560]();
}

uint64_t SecPolicyCreateiPhoneProvisioningProfileSigning()
{
  return MEMORY[0x1E0CD6568]();
}

uint64_t SecPolicyCreateiPhoneVPNApplicationSigning()
{
  return MEMORY[0x1E0CD6570]();
}

OSStatus SecStaticCodeCheckValidityWithErrors(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement, CFErrorRef *errors)
{
  return MEMORY[0x1E0CD65C8](staticCode, *(_QWORD *)&flags, requirement, errors);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1E0CD65D0](path, *(_QWORD *)&flags, staticCode);
}

OSStatus SecStaticCodeCreateWithPathAndAttributes(CFURLRef path, SecCSFlags flags, CFDictionaryRef attributes, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x1E0CD65D8](path, *(_QWORD *)&flags, attributes, staticCode);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x1E0CD6760](trust, verifyDate);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1E0C80BC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1E0C81740](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1E0C819E8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1E0C81A08]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1E0C81A10]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1E0C81A18]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1E0C81A40]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1E0C81A88]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x1E0C81B38]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x1E0C81B48]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1E0C81BD8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1E0C81BE0]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1E0C81C30]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1E0C81C38]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1E0C81C40]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C81C68]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1E0C81C70]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1E0C81CD8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1E0C81D20]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1E0C81D28]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C81DC8]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1E0C81DD0]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1E0C81E00]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1E0C82340]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1E0C82388]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1E0C823E8]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1E0C825C8]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x1E0C82B98](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C841F0](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x1E0DE7D20])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1E0C84790]();
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return MEMORY[0x1E0C84B98]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const char *__cdecl sqlite3_column_origin_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1E0DE86A8](a1, *(_QWORD *)&a2);
}

const char *__cdecl sqlite3_column_table_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1E0DE86B0](a1, *(_QWORD *)&a2);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return MEMORY[0x1E0DE8758](db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1E0DE8A98](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1E0C855D8](a1, a2, a3);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1E0C85958](a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E28](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

int64_t xpc_array_get_date(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E48](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

