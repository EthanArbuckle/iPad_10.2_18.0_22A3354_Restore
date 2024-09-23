id __ISCurrentProcessName()
{
  if (__ISCurrentProcessName_onceToken != -1)
    dispatch_once(&__ISCurrentProcessName_onceToken, &__block_literal_global_6);
  return (id)__ISCurrentProcessName_processName;
}

void __ISRecordSPIClassUsage(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((SSIsDaemon() & 1) == 0)
  {
    v2 = v1;
    AnalyticsSendEventLazy();

  }
}

unint64_t b64_encode(unsigned __int8 *a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  int v5;

  v5 = 0;
  return b64_encode_(a1, a2, a3, a4, 0, &v5);
}

unint64_t b64_encode_(unsigned __int8 *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5, _DWORD *a6)
{
  _DWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  int v22;
  int v23;
  uint64_t i;
  unint64_t v25;
  unint64_t v26;
  unint64_t v29;
  _BYTE v30[3];

  if (!a6)
    b64_encode__cold_1();
  v6 = a6;
  v7 = a3;
  v8 = a2;
  v9 = (2 * (((a2 + 2) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64)) & 0xFFFFFFFFFFFFFFFCLL;
  *a6 = 0;
  if (a5)
    v9 += 2 * ((a5 + v9 - 1) / a5) - 2;
  if (a3)
  {
    if (v9 <= a4)
    {
      if (a2 >= 3)
      {
        v29 = v9;
        v10 = 0;
        v11 = a3 + a4;
        v12 = a5;
        do
        {
          v13 = v7;
          v14 = a1;
          v15 = *a1;
          v16 = a1[1];
          v17 = a1[2];
          v18 = b64_chars[v15 >> 2];
          *(_BYTE *)v13 = b64_chars[v15 >> 2];
          if (!memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v18, 0x41uLL))
            b64_encode__cold_2();
          if (v10 + 1 == v12)
            b64_encode__cold_3();
          v19 = (v16 >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v15 & 3));
          v20 = b64_chars[v19];
          *(_BYTE *)(v13 + 1) = b64_chars[v19];
          if (!memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v20, 0x41uLL))
            b64_encode__cold_4();
          if (v10 + 2 == v12)
            b64_encode__cold_5();
          v21 = (v17 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v16 & 0xF));
          v22 = b64_chars[v21];
          *(_BYTE *)(v13 + 2) = b64_chars[v21];
          if (!memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v22, 0x41uLL))
            b64_encode__cold_6();
          if (v10 + 3 == v12)
            b64_encode__cold_7();
          v23 = b64_chars[v17 & 0x3F];
          *(_BYTE *)(v13 + 3) = b64_chars[v17 & 0x3F];
          if (!memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v23, 0x41uLL))
            b64_encode__cold_8();
          v7 = v13 + 4;
          v10 += 4;
          if (v10 == v12 && v7 != v11)
          {
            v10 = 0;
            *(_WORD *)(v13 + 4) = 2573;
            v7 = v13 + 6;
          }
          v8 -= 3;
          a1 = v14 + 3;
        }
        while (v8 > 2);
        a1 = v14 + 3;
        v6 = a6;
        v9 = v29;
      }
      if (v8)
      {
        for (i = 0; i != v8; ++i)
          v30[i] = a1[i];
        if ((unint64_t)(i - 1) <= 1)
        {
          v25 = 2 - v8;
          if (v8 > 2)
            v25 = 0;
          bzero(&v30[v8], v25 + 1);
        }
        b64_encode_(v30, 3, v7, 12, 0, v6);
        if (v8 != 3)
        {
          v26 = 2 - v8;
          if (v8 > 2)
            v26 = 0;
          memset((void *)(v8 + v7 + 1), 61, v26 + 1);
        }
      }
    }
    else
    {
      v9 = 0;
      *a6 = 1;
    }
  }
  return v9;
}

unint64_t b64_encode2(unsigned __int8 *a1, unint64_t a2, uint64_t a3, unint64_t a4, char a5, unsigned int a6, int *a7)
{
  int v7;
  unsigned int v8;
  int *v9;
  unint64_t result;
  int v11;

  v7 = a5 & 0xF;
  v8 = 76;
  switch(v7)
  {
    case 0:
      if ((a6 & 0x80000000) != 0)
        goto LABEL_5;
      v8 = a6;
      if ((a6 & 3) != 0)
        b64_encode2_cold_2();
      return result;
    case 1:
      v8 = 0;
      break;
    case 2:
LABEL_5:
      v8 = 64;
      break;
    case 3:
      break;
    default:
      b64_encode2_cold_1();
  }
  v11 = 0;
  if (a7)
    v9 = a7;
  else
    v9 = &v11;
  return b64_encode_(a1, a2, a3, a4, v8, v9);
}

_BYTE *b64_decode(unsigned __int8 *a1, unint64_t a2, _BYTE *a3, unint64_t a4)
{
  int v5;
  unsigned __int8 *v6;

  v6 = 0;
  v5 = 0;
  return b64_decode_(a1, a2, a3, a4, 0, &v6, &v5);
}

_BYTE *b64_decode_(unsigned __int8 *a1, unint64_t a2, _BYTE *a3, unint64_t a4, __int16 a5, unsigned __int8 **a6, _DWORD *a7)
{
  unint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  char v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  char v18;

  v7 = a2 >> 2;
  if ((a2 & 3) != 0)
    ++v7;
  if (!a6)
    b64_decode__cold_1();
  if (!a7)
    b64_decode__cold_2();
  v8 = 3 * v7;
  *a6 = 0;
  *a7 = 0;
  if (a3)
  {
    if (v8 > a4)
    {
      v8 = 0;
      *a7 = 1;
      return (_BYTE *)v8;
    }
    v9 = a3;
    if (!a2)
      return (_BYTE *)(v9 - a3);
    v10 = 0;
    v11 = 0;
    v9 = a3;
    while (1)
    {
      v12 = (char)*a1;
      if (v12 == 61)
      {
        if (v11 >= 4)
          b64_decode__cold_3();
        *(&v15 + v11) = 0;
        ++v10;
        goto LABEL_16;
      }
      v13 = b64_indexes[*a1];
      if (v13 != 255)
      {
        if (v11 >= 4)
          b64_decode__cold_4();
        v10 = 0;
        *(&v15 + v11) = v13;
LABEL_16:
        if (++v11 == 4)
        {
          *v9 = (4 * v15) | (v16 >> 4) & 3;
          if (v10 == 2)
            return (_BYTE *)(++v9 - a3);
          v9[1] = (16 * v16) | (v17 >> 2) & 0xF;
          if (v10 == 1)
          {
            v9 += 2;
            return (_BYTE *)(v9 - a3);
          }
          v9[2] = v18 + (v17 << 6);
          if (v10)
          {
            v9 += 3;
            return (_BYTE *)(v9 - a3);
          }
          v11 = 0;
          v9 += 3;
        }
        goto LABEL_27;
      }
      if (v12 <= 0x20)
      {
        if (((1 << v12) & 0x100000B00) != 0)
        {
          if ((a5 & 0x200) != 0)
            goto LABEL_34;
          goto LABEL_27;
        }
        if (((1 << v12) & 0x2400) != 0)
          goto LABEL_27;
      }
      if ((a5 & 0x100) != 0)
      {
LABEL_34:
        v8 = 0;
        *a7 = 3;
        *a6 = a1;
        return (_BYTE *)v8;
      }
LABEL_27:
      ++a1;
      if (!--a2)
        return (_BYTE *)(v9 - a3);
    }
  }
  return (_BYTE *)v8;
}

_BYTE *b64_decode2(unsigned __int8 *a1, unint64_t a2, _BYTE *a3, unint64_t a4, __int16 a5, unsigned __int8 **a6, int *a7)
{
  int v8;
  uint64_t v9;

  v9 = 0;
  v8 = 0;
  if (!a6)
    a6 = (unsigned __int8 **)&v9;
  if (!a7)
    a7 = &v8;
  return b64_decode_(a1, a2, a3, a4, a5, a6, a7);
}

const char *b64_getErrorString(unsigned int a1)
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;

  if (a1 > 3 || (v1 = (uint64_t)*(&b64_LookupErrorStringA__s_strings + a1), *(_DWORD *)v1 != a1))
  {
    v3 = 0;
    v2 = "";
    while (1)
    {
      v1 = *(uint64_t *)((char *)&b64_LookupErrorStringA__s_strings + v3);
      if (*(_DWORD *)v1 == a1)
        break;
      v3 += 8;
      if (v3 == 32)
        return v2;
    }
  }
  return *(const char **)(v1 + 8);
}

uint64_t b64_getErrorStringLength(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  if (a1 > 3 || (v1 = (uint64_t)*(&b64_LookupErrorStringA__s_strings + a1), *(_DWORD *)v1 != a1))
  {
    v3 = 0;
    while (1)
    {
      v1 = *(uint64_t *)((char *)&b64_LookupErrorStringA__s_strings + v3);
      if (*(_DWORD *)v1 == a1)
        break;
      v3 += 8;
      if (v3 == 32)
        return 0;
    }
  }
  return *(_QWORD *)(v1 + 16);
}

void sub_20B72CD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_20B72D244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ISDeviceIncompatibleAppErrorWithAppTitle(void *a1)
{
  void *v2;
  unsigned int v3;

  if (objc_msgSend(a1, "length"))
  {
    v2 = (void *)MGCopyAnswer();
    v3 = objc_msgSend(v2, "integerValue") - 1;
    if (v3 <= 2
      && objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.itunesstore")), "localizedStringForKey:value:table:", off_24C43BF48[v3], &stru_24C441158, 0), a1))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.itunesstore")), "localizedStringForKey:value:table:", CFSTR("INCOMPATIBLE_PURCHASE_TITLE"), &stru_24C441158, 0);
    }

  }
  return SSError();
}

uint64_t ISBiometricsAddHeadersForTouchIDRequestToURLRequest(void *a1, void *a2, int a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  NSObject *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  NSObject *v40;
  int v41;
  int v42;
  int v43;
  int v44;
  void *v45;
  int *v47;
  uint64_t v48;
  id v49;
  id v50;
  int v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v49 = a1;
  v9 = a2;
  +[ISBiometricStore sharedInstance](ISBiometricStore, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ISBiometricsHTTPHeaderValueForBiometricStateWithStore(v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a3)
  {
    +[ISDevice sharedInstance](ISDevice, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "deviceBiometricStyle");

    if (v14 != 2 || objc_msgSend(v10, "keyCountForAccountIdentifier:", v9) != 1)
    {
LABEL_17:
      v50 = 0;
      objc_msgSend(v10, "publicKeyDataForAccountIdentifier:purpose:error:", v9, a4, &v50, v47);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v50;
      if (v21)
      {
        v23 = objc_retainAutorelease(v21);
        v24 = (void *)ISCopyEncodedBase64((unsigned __int8 *)objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"));
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v26 = objc_msgSend(v25, "shouldLog");
      if (objc_msgSend(v25, "shouldLogToDisk"))
        v27 = v26 | 2;
      else
        v27 = v26;
      objc_msgSend(v25, "OSLogObject");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        v29 = v27;
      else
        v29 = v27 & 2;
      if (v29)
      {
        v51 = 138412546;
        v52 = v9;
        v53 = 2114;
        v54 = v22;
        LODWORD(v48) = 22;
        v47 = &v51;
        v30 = (void *)_os_log_send_and_compose_impl();

        if (!v30)
        {
LABEL_33:

          v24 = 0;
LABEL_34:

          if (!v12)
            goto LABEL_48;
LABEL_35:
          objc_msgSend(v49, "setValue:forHTTPHeaderField:", v12, *MEMORY[0x24BEB25D0], v47);
          objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v32 = objc_msgSend(v31, "shouldLog");
          if (objc_msgSend(v31, "shouldLogToDisk"))
            v33 = v32 | 2;
          else
            v33 = v32;
          objc_msgSend(v31, "OSLogObject");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            v35 = v33;
          else
            v35 = v33 & 2;
          if (v35)
          {
            v51 = 138543362;
            v52 = v12;
            LODWORD(v48) = 12;
            v47 = &v51;
            v36 = (void *)_os_log_send_and_compose_impl();

            if (!v36)
            {
LABEL_47:

              goto LABEL_48;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, &v51, v48);
            v34 = objc_claimAutoreleasedReturnValue();
            free(v36);
            v47 = (int *)v34;
            SSFileLog();
          }

          goto LABEL_47;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v51, v48);
        v28 = objc_claimAutoreleasedReturnValue();
        free(v30);
        v47 = (int *)v28;
        SSFileLog();
      }

      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v19 = v17;
    else
      v19 = v17 & 2;
    if (v19)
    {
      LOWORD(v51) = 0;
      LODWORD(v48) = 2;
      v47 = &v51;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_16:

        a4 = 0;
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v51, v48);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v20);
      v47 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_16;
  }
  v24 = 0;
  v22 = 0;
  if (v11)
    goto LABEL_35;
LABEL_48:
  if (!v24)
    goto LABEL_75;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("E")) & 1) != 0
    || objc_msgSend(v12, "isEqualToString:", CFSTR("EP")))
  {
    objc_msgSend(v49, "setValue:forHTTPHeaderField:", v24, *MEMORY[0x24BEB25B0], v47);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = objc_msgSend(v37, "shouldLog");
    if (objc_msgSend(v37, "shouldLogToDisk"))
      v39 = v38 | 2;
    else
      v39 = v38;
    objc_msgSend(v37, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      v41 = v39;
    else
      v41 = v39 & 2;
    if (!v41)
      goto LABEL_73;
    v51 = 138543362;
    v52 = v24;
    LODWORD(v48) = 12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v42 = objc_msgSend(v37, "shouldLog", v47);
    if (objc_msgSend(v37, "shouldLogToDisk"))
      v43 = v42 | 2;
    else
      v43 = v42;
    objc_msgSend(v37, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      v44 = v43;
    else
      v44 = v43 & 2;
    if (!v44)
      goto LABEL_73;
    v51 = 138543362;
    v52 = v24;
    LODWORD(v48) = 12;
  }
  v45 = (void *)_os_log_send_and_compose_impl();

  if (v45)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v45, 4, &v51, v48);
    v40 = objc_claimAutoreleasedReturnValue();
    free(v45);
    SSFileLog();
LABEL_73:

  }
LABEL_75:
  if (a5)
    *a5 = objc_retainAutorelease(v22);

  return 0;
}

const __CFString *ISBiometricsHTTPHeaderValueForBiometricStateWithStore(void *a1)
{
  id v1;
  void *v2;
  ISBiometricStore *v3;
  ISBiometricStore *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v16;
  _WORD v17[8];

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = (ISBiometricStore *)v1;
  else
    v3 = objc_alloc_init(ISBiometricStore);
  v4 = v3;
  if (!-[ISBiometricStore canPerformBiometricOptIn](v3, "canPerformBiometricOptIn"))
    goto LABEL_27;
  v5 = -[ISBiometricStore biometricState](v4, "biometricState");
  if (!v5)
  {
    v8 = CFSTR("U");
    goto LABEL_28;
  }
  if (v5 == 1)
  {
    v8 = CFSTR("D");
    goto LABEL_28;
  }
  if (v5 != 2)
  {
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  +[ISDevice sharedInstance](ISDevice, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceBiometricStyle");

  if (v7 == 2)
  {
    v8 = CFSTR("E");
    goto LABEL_28;
  }
  if (v7 != 3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v13 = v11;
    else
      v13 = v11 & 2;
    if (v13)
    {
      v17[0] = 0;
      LODWORD(v16) = 2;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, v17, v16);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog();
    }

    goto LABEL_26;
  }
  v8 = CFSTR("EP");
LABEL_28:

  return v8;
}

void ISBiometricsAddHeadersForTouchIDSignatureToURLRequest(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *MEMORY[0x24BEB25A8];
  v6 = a3;
  v7 = a1;
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", a2, v5);
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v6, *MEMORY[0x24BEB25C0]);

  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("1"), *MEMORY[0x24BEB25C8]);
}

BOOL ISBiometricsHasEntitlement(void *a1)
{
  __CFString *v1;
  __SecTask *v2;
  __SecTask *v3;
  CFTypeRef v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v13;
  CFErrorRef error;
  int v15;
  __CFString *v16;
  __int16 v17;
  CFErrorRef v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = SecTaskCreateFromSelf(0);
  if (!v2)
  {
    v11 = 0;
    goto LABEL_20;
  }
  v3 = v2;
  error = 0;
  v4 = SecTaskCopyValueForEntitlement(v2, v1, &error);
  if (error)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v15 = 138543618;
      v16 = v1;
      v17 = 2114;
      v18 = error;
      LODWORD(v13) = 22;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        CFRelease(error);
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v15, v13);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_16:
  v11 = v4 != 0;
  if (v4)
    CFRelease(v4);
  CFRelease(v3);
LABEL_20:

  return v11;
}

void sub_20B730C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_20B731328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B731838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20B731D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B732D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20B733294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_20B733790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_20B734180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20B734828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20B734EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20B73553C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20B737660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20B737D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20B7382EC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20B73830C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x20B73827CLL);
}

void sub_20B739158(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, __int16 a17, uint64_t a18, __int16 a19, uint64_t a20)
{
  int v20;

  if (v20)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_20B739B1C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

BOOL ISThreadSetBackgroundPriority(int a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!a1)
  {
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v3, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      v10 &= 2u;
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
      v15 = 134217984;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_25:
        v8 = 0;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v15, v14);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_25;
  }
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (!v5)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v15 = 134217984;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v15, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog();
LABEL_12:

  }
  v8 = 4096;
LABEL_26:

  return setpriority(3, 0, v8) == 0;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_20B73BC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void __CreateMainQueue()
{
  ISOperationQueue *v0;
  void *v1;

  v0 = objc_alloc_init(ISOperationQueue);
  v1 = (void *)__MainQueue;
  __MainQueue = (uint64_t)v0;

}

void sub_20B73D37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;

  _Block_object_dispose(&a64, 8);
  _Unwind_Resume(a1);
}

uint64_t _set_path_class(const char *a1, int a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v8 = 0;
  v7 = xmmword_20B7B9478;
  v6 = 0;
  if (getattrlist(a1, &v7, &v6, 8uLL, 0))
    return *__error();
  if (HIDWORD(v6) == a2)
    return 0;
  v5 = a2;
  result = setattrlist(a1, &v7, &v5, 4uLL, 0);
  if ((_DWORD)result)
    return *__error();
  return result;
}

void setFileClassC(void *a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = objc_retainAutorelease(v5);
  if ((_set_path_class((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 3) & 0xFFFFFFFD) != 0)
  {
    v8 = v6;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v15 = 138543362;
      v16 = v7;
      LODWORD(v14) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_14:

        *a3 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v15, v14);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_14;
  }
LABEL_15:

}

void sub_20B73E070(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_20B7421D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_20B744A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B7471E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B748C00(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20B748C20(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x20B748BD4);
}

void _HostResolutionCallback(uint64_t a1, uint64_t a2, _DWORD *a3, void *a4)
{
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _WORD v14[8];

  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    v10 = v8;
  else
    v10 = v8 & 2;
  if (!v10)
    goto LABEL_12;
  v14[0] = 0;
  LODWORD(v13) = 2;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v14, v13);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog();
LABEL_12:

  }
  _errorForStreamError(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a4, "_resolutionCompletedWithError:", v12);

}

_DWORD *_errorForStreamError(_DWORD *a1)
{
  _DWORD *v1;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return a1;
  v1 = a1;
  if (!*(_QWORD *)a1 && !a1[2])
    return 0;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    v6 = v4;
  else
    v6 = v4 & 2;
  if (!v6)
    goto LABEL_15;
  v7 = *(_QWORD *)v1;
  v8 = v1[2];
  v12 = 134218240;
  v13 = v7;
  v14 = 1024;
  v15 = v8;
  LODWORD(v11) = 18;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v12, v11);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog();
LABEL_15:

  }
  ISError();
  a1 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  return a1;
}

void *ISImageResourceCreateImageForResourceName(void *a1, _DWORD *a2)
{
  id v3;
  void *v4;
  const __CFURL *v5;
  void *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  void *v9;
  float v10;
  float v11;
  void *ImageForImageSource;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  uint64_t v33;
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  HIDWORD(v33) = 0;
  if (ISImageResourceCreateImageForResourceName_bundle)
  {
    if (v3)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v6, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v18 = v16;
    else
      v18 = v16 & 2;
    if (v18)
    {
      *(_WORD *)v34 = 0;
      LODWORD(v33) = 2;
      ImageForImageSource = (void *)_os_log_send_and_compose_impl();

      if (!ImageForImageSource)
        goto LABEL_55;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", ImageForImageSource, 4, v34, v33);
      v17 = objc_claimAutoreleasedReturnValue();
      free(ImageForImageSource);
      SSFileLog();
    }
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)ISImageResourceCreateImageForResourceName_bundle;
  ISImageResourceCreateImageForResourceName_bundle = v13;

  if (!v4)
    goto LABEL_8;
LABEL_3:
  objc_msgSend((id)ISImageResourceCreateImageForResourceName_bundle, "URLForResource:withExtension:", v4, CFSTR("tiff"));
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v19 = -[NSObject shouldLog](v17, "shouldLog");
    if (-[NSObject shouldLogToDisk](v17, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    -[NSObject OSLogObject](v17, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      v22 = v20;
    else
      v22 = v20 & 2;
    if (!v22)
      goto LABEL_40;
LABEL_38:
    *(_DWORD *)v34 = 138543618;
    *(_QWORD *)&v34[4] = ISImageResourceCreateImageForResourceName_bundle;
    *(_WORD *)&v34[12] = 2114;
    *(_QWORD *)&v34[14] = v4;
    LODWORD(v33) = 22;
    v26 = (void *)_os_log_send_and_compose_impl();

    if (!v26)
    {
LABEL_41:

      ImageForImageSource = 0;
      goto LABEL_55;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, v34, v33, *(_OWORD *)v34, *(_QWORD *)&v34[16], v35);
    v21 = objc_claimAutoreleasedReturnValue();
    free(v26);
    SSFileLog();
LABEL_40:

    goto LABEL_41;
  }
  v7 = CGImageSourceCreateWithURL(v5, 0);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v23 = -[NSObject shouldLog](v17, "shouldLog");
    if (-[NSObject shouldLogToDisk](v17, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    -[NSObject OSLogObject](v17, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      v25 = v24;
    else
      v25 = v24 & 2;
    if (!v25)
      goto LABEL_40;
    goto LABEL_38;
  }
  v8 = v7;
  if (!CGImageSourceGetCount(v7))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = objc_msgSend(v27, "shouldLog");
    if (objc_msgSend(v27, "shouldLogToDisk"))
      v29 = v28 | 2;
    else
      v29 = v28;
    objc_msgSend(v27, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      v29 &= 2u;
    if (v29)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0);
      *(_DWORD *)v34 = 138543362;
      *(_QWORD *)&v34[4] = objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = 12;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_53:

        ImageForImageSource = 0;
        goto LABEL_54;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, v34, v33);
      v30 = objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog();
    }

    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenScale");
  v11 = v10;

  ImageForImageSource = _ISImageResourceCreateImageForImageSource(v8, (float *)&v33 + 1, v11);
LABEL_54:
  CFRelease(v8);
LABEL_55:

  if (a2)
    *a2 = HIDWORD(v33);

  return ImageForImageSource;
}

CGImageRef _ISImageResourceCreateImageForImageSource(CGImageSource *a1, float *a2, float a3)
{
  size_t Count;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  float v13;
  CGImageRef result;

  Count = CGImageSourceGetCount(a1);
  v7 = 2.0;
  v8 = 1.0;
  if (a3 == 2.0 && (Count & 0xFFFFFFFFFFFFFFFELL) == 2)
    v9 = 2.0;
  else
    v9 = 1.0;
  v10 = 1;
  v11 = 2;
  if (Count == 3)
    v8 = 3.0;
  else
    v11 = 0;
  if (Count != 2)
  {
    v10 = v11;
    v7 = v8;
  }
  if (a3 == 3.0)
    v12 = v10;
  else
    v12 = (a3 == 2.0) & ((Count & 0xFFFFFFFFFFFFFFFELL) == 2);
  if (a3 == 3.0)
    v13 = v7;
  else
    v13 = v9;
  result = CGImageSourceCreateImageAtIndex(a1, v12, 0);
  if (a2)
    *a2 = v13;
  return result;
}

BOOL ISImageResourceShouldUseRetina()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = ISImageResourceShouldUseRetina_kPKPaymentContentItemImageAndScaleAttachment;
  if (!ISImageResourceShouldUseRetina_kPKPaymentContentItemImageAndScaleAttachment)
  {
    SSVPassKitFramework();
    SSVWeakLinkedStringConstantForString();
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)ISImageResourceShouldUseRetina_kPKPaymentContentItemImageAndScaleAttachment;
    ISImageResourceShouldUseRetina_kPKPaymentContentItemImageAndScaleAttachment = v1;

    v0 = ISImageResourceShouldUseRetina_kPKPaymentContentItemImageAndScaleAttachment;
  }
  return v0 != 0;
}

uint64_t ISImageResourceShouldUseTinting()
{
  id v0;

  SSVPassKitFramework();
  v0 = (id)SSVWeakLinkedStringConstantForString();
  return 0;
}

id __GetDictionaryValueForNetworkType(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  SSGetStringForNetworkType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (SSNetworkTypeIsCellularType())
    {
      while (a2 >= 2)
      {
        --a2;
        SSGetStringForNetworkType();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_7;
      }
    }
    v5 = 0;
  }
LABEL_7:

  return v5;
}

void sub_20B74D964(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __ISRecordSPIFunctionUsage()
{
  uint64_t result;

  result = SSIsDaemon();
  if ((result & 1) == 0)
    return AnalyticsSendEventLazy();
  return result;
}

void sub_20B757D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_20B758B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ISError()
{
  __ISRecordSPIFunctionUsage();
  return SSErrorWithUnderlyingError();
}

uint64_t ISErrorIndicatesSlowNetwork(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  __ISRecordSPIFunctionUsage();
  v2 = (void *)objc_msgSend(a1, "domain");
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD1308]))
  {
    v3 = objc_msgSend(a1, "code");
    if ((unint64_t)(v3 + 1009) >= 9)
      return 0;
    else
      return (0x111u >> (v3 - 15)) & 1;
  }
  else
  {
    result = objc_msgSend(v2, "isEqualToString:", CFSTR("SSErrorDomain"));
    if ((_DWORD)result)
      return objc_msgSend(a1, "code") == 110;
  }
  return result;
}

uint64_t ISErrorIsEqual(void *a1, uint64_t a2, uint64_t a3)
{
  __ISRecordSPIFunctionUsage();
  if (a1 && objc_msgSend(a1, "code") == a3)
    return objc_msgSend((id)objc_msgSend(a1, "domain"), "isEqualToString:", a2);
  else
    return 0;
}

uint64_t ISErrorWithDomain()
{
  __ISRecordSPIFunctionUsage();
  return SSErrorWithUnderlyingError();
}

uint64_t ISErrorWithExternalError(void *a1)
{
  void *v2;

  __ISRecordSPIFunctionUsage();
  v2 = (void *)objc_msgSend(a1, "domain");
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD1308])
    && (objc_msgSend(a1, "code") & 0xFFFFFFFFFFFFFFFELL) == 0xFFFFFFFFFFFFFB4ELL)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("UNTRUSTED_CERT_TITLE"), &stru_24C441158, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("UNTRUSTED_CERT_BODY"), &stru_24C441158, 0);
  }
  objc_msgSend(a1, "domain");
  objc_msgSend(a1, "code");
  objc_msgSend(a1, "userInfo");
  return SSErrorWithUnderlyingErrorAndInfo();
}

uint64_t ISErrorWithUnderlyingError()
{
  __ISRecordSPIFunctionUsage();
  return SSErrorWithUnderlyingError();
}

const __CFString *ISClientIdentifierForBundleIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0)
  {
    v2 = CFSTR("Software");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileStore")) & 1) != 0)
  {
    v2 = CFSTR("WiFi-Music");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Music")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.mobileipod")) & 1) != 0)
  {
    v2 = CFSTR("MusicPlayer");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.videos")) & 1) != 0)
  {
    v2 = CFSTR("VideoPlayer");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0)
  {
    v2 = CFSTR("eBooks");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.itunesu")) & 1) != 0)
  {
    v2 = CFSTR("iTunesU");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
  {
    v2 = CFSTR("Podcasts");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0)
  {
    v2 = CFSTR("News");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v2 = CFSTR("Messages");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ios.NewsstandStore")) & 1) != 0)
  {
    v2 = CFSTR("Newsstand");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.WelcomeKit")))
  {
    v2 = CFSTR("matd");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *ISClientIdentifierForURLScheme(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("itms-apps")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("itms-apps")) & 1) != 0)
  {
    v2 = CFSTR("Software");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("itms-books")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("itms-bookss")) & 1) != 0)
  {
    v2 = CFSTR("eBooks");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("itms-gc")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("itms-gcs")) & 1) != 0)
  {
    v2 = CFSTR("GameCenter");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("itms-itunesu")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("itms-itunesus")) & 1) != 0)
  {
    v2 = CFSTR("iTunesU");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("its-music")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("its-musics")) & 1) != 0)
  {
    v2 = CFSTR("MusicPlayer");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("itms")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("itmss")) & 1) != 0)
  {
    v2 = CFSTR("WiFi-Music");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("its-videos")) & 1) != 0
         || objc_msgSend(v1, "isEqualToString:", CFSTR("its-videoss")))
  {
    v2 = CFSTR("VideoPlayer");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __ServerConnectionCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "_handleTelephonyNotificationWithName:userInfo:", a2, a3);
}

uint64_t __ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig"), "debugLogsEnabled"))
    return objc_msgSend(a3, "_reloadNetworkTypeWithReachabilityFlags:", a2, v15);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = v5;
  if ((a2 & 2) != 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("reachable"));
    if ((a2 & 0x40000) == 0)
    {
LABEL_4:
      if ((a2 & 8) == 0)
        goto LABEL_5;
      goto LABEL_27;
    }
  }
  else if ((a2 & 0x40000) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v6, "addObject:", CFSTR("wwan"));
  if ((a2 & 8) == 0)
  {
LABEL_5:
    if ((a2 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v6, "addObject:", CFSTR("automatic"));
  if ((a2 & 0x20) == 0)
  {
LABEL_6:
    if ((a2 & 8) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v6, "addObject:", CFSTR("on-demand"));
  if ((a2 & 8) == 0)
  {
LABEL_7:
    if ((a2 & 4) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v6, "addObject:", CFSTR("on-traffic"));
  if ((a2 & 4) == 0)
  {
LABEL_8:
    if ((a2 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v6, "addObject:", CFSTR("connection-required"));
  if ((a2 & 0x20000) == 0)
  {
LABEL_9:
    if ((a2 & 0x10000) == 0)
      goto LABEL_10;
LABEL_32:
    objc_msgSend(v6, "addObject:", CFSTR("local"));
    if ((a2 & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_31:
  objc_msgSend(v6, "addObject:", CFSTR("direct"));
  if ((a2 & 0x10000) != 0)
    goto LABEL_32;
LABEL_10:
  if ((a2 & 1) != 0)
LABEL_11:
    objc_msgSend(v6, "addObject:", CFSTR("transient"));
LABEL_12:
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v7)
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v10 = v9;
  else
    v10 = v9 & 2;
  if (v10)
  {
    v17 = 138412802;
    v18 = objc_opt_class();
    v19 = 1024;
    v20 = v9;
    v21 = 2112;
    v22 = objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    LODWORD(v16) = 28;
    v15 = &v17;
    v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v17, v16);
      free(v12);
      v15 = (int *)v13;
      SSFileLog();
    }
  }

  return objc_msgSend(a3, "_reloadNetworkTypeWithReachabilityFlags:", a2, v15);
}

uint64_t __CarrierChangeNotification(uint64_t a1, uint64_t a2)
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.carrier"));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("ISCarrierSettingsDidChangeNotification"), a2);
}

uint64_t __AutoDownloadsSettingsChangedNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadCellularRestriction");
}

void __NetworkTypeOverrideChangedNotification(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = *(NSObject **)(a2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ____NetworkTypeOverrideChangedNotification_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(v2, block);
}

void sub_20B75D0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20B75D254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B75D4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_20B75D780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20B75D8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B75DC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B75DE4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20B75EF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class initUIAlertController()
{
  Class result;

  if (UIKitLibrary_sOnce != -1)
    dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("UIAlertController");
  classUIAlertController = (uint64_t)result;
  getUIAlertControllerClass = (uint64_t (*)())UIAlertControllerFunction;
  return result;
}

id UIAlertControllerFunction()
{
  return (id)classUIAlertController;
}

Class initUIAlertAction()
{
  Class result;

  if (UIKitLibrary_sOnce != -1)
    dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("UIAlertAction");
  classUIAlertAction = (uint64_t)result;
  getUIAlertActionClass = (uint64_t (*)())UIAlertActionFunction;
  return result;
}

id UIAlertActionFunction()
{
  return (id)classUIAlertAction;
}

Class initUIWindow()
{
  Class result;

  if (UIKitLibrary_sOnce != -1)
    dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("UIWindow");
  classUIWindow = (uint64_t)result;
  getUIWindowClass = (uint64_t (*)())UIWindowFunction;
  return result;
}

id UIWindowFunction()
{
  return (id)classUIWindow;
}

Class initUIScreen()
{
  Class result;

  if (UIKitLibrary_sOnce != -1)
    dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("UIScreen");
  classUIScreen = (uint64_t)result;
  getUIScreenClass = (uint64_t (*)())UIScreenFunction;
  return result;
}

id UIScreenFunction()
{
  return (id)classUIScreen;
}

Class initUIViewController()
{
  Class result;

  if (UIKitLibrary_sOnce != -1)
    dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("UIViewController");
  classUIViewController = (uint64_t)result;
  getUIViewControllerClass = (uint64_t (*)())UIViewControllerFunction;
  return result;
}

id UIViewControllerFunction()
{
  return (id)classUIViewController;
}

Class initUIApplication()
{
  Class result;

  if (UIKitLibrary_sOnce != -1)
    dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_9);
  result = objc_getClass("UIApplication");
  classUIApplication = (uint64_t)result;
  getUIApplicationClass = (uint64_t (*)())UIApplicationFunction;
  return result;
}

id UIApplicationFunction()
{
  return (id)classUIApplication;
}

void sub_20B761D8C(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_20B762438(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

id ISCopyDigestFromString(void *a1)
{
  id v2;
  unint64_t i;
  uint64_t v4;
  char v6;
  char __str[2];
  char v8;
  unint64_t v9;
  _BYTE v10[32];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v9 = 0;
  if (objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v10, 32, &v9, 1, 0, 0, objc_msgSend(a1, "length"), 0)&& v9 == 32)
  {
    for (i = 0; i < v9; i += 2)
    {
      *(_WORD *)__str = *(_WORD *)&v10[i];
      v8 = 0;
      v4 = strtol(__str, 0, 16);
      if (v4 <= 255)
      {
        v6 = v4;
        objc_msgSend(v2, "appendBytes:length:", &v6, 1);
      }
    }
  }
  return v2;
}

void *ISStringFromDigest(unsigned __int8 *a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  unsigned int v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (a2)
  {
    v5 = a2;
    do
    {
      v6 = *a1++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v6);
      --v5;
    }
    while (v5);
  }
  return v4;
}

void *ISMD5StringForBytes(const void *a1, CC_LONG a2)
{
  void *v2;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!CC_MD5(a1, a2, md))
    return 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  for (i = 0; i != 16; ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02x"), md[i]);
  return v2;
}

unsigned __int8 *ISSHA1DataForBytes(const void *a1, CC_LONG a2)
{
  unsigned __int8 *result;
  unsigned __int8 md[20];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  result = CC_SHA1(a1, a2, md);
  if (result)
    return (unsigned __int8 *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
  return result;
}

uint64_t ISCopyEncodedBase64(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  void *v6;

  result = b64_encode2(a1, a2, 0, 0, 1, 0, 0);
  if (result)
  {
    v5 = result;
    result = (uint64_t)malloc_type_malloc(result, 0xAA96C257uLL);
    if (result)
    {
      v6 = (void *)result;
      if (!b64_encode2(a1, a2, result, v5, 1, 0, 0)
        || (result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v5, 4, 1)) == 0)
      {
        free(v6);
        return 0;
      }
    }
  }
  return result;
}

_BYTE *ISCopyDecodedBase64(unsigned __int8 *a1, unsigned int a2)
{
  unint64_t v3;
  _BYTE *result;
  unint64_t v5;
  _BYTE *v6;

  v3 = a2;
  result = b64_decode2(a1, a2, 0, 0, 1, 0, 0);
  if (result)
  {
    v5 = (unint64_t)result;
    v6 = malloc_type_malloc((size_t)result, 0xF3D7A450uLL);
    b64_decode2(a1, v3, v6, v5, 1, 0, 0);
    result = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v6, v5, 1);
    if (!result)
    {
      free(v6);
      return 0;
    }
  }
  return result;
}

id ISCopyDecompressedGZipDataForData()
{
  void *v0;
  id v1;
  unsigned int v2;
  unsigned int v3;
  z_stream strm;
  _BYTE v6[16384];
  uint64_t v7;

  v0 = (void *)MEMORY[0x24BDAC7A8]();
  v7 = *MEMORY[0x24BDAC8D0];
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = objc_msgSend(v0, "length");
  strm.next_in = (Bytef *)objc_msgSend(v0, "bytes");
  v1 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    v1 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v6;
      v2 = inflate(&strm, 0);
      if (v2 > 1)
        break;
      v3 = v2;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v1, "appendBytes:length:", v6, 0x4000 - strm.avail_out);
      if (v3)
      {
        inflateEnd(&strm);
        return v1;
      }
    }
    inflateEnd(&strm);

    return 0;
  }
  return v1;
}

uint64_t ISCopyGzippedDataForData(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  z_stream v10;

  v2 = objc_msgSend(a1, "bytes");
  v3 = objc_msgSend(a1, "length");
  v4 = 0;
  if (v2)
  {
    v5 = v3;
    if (v3)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v3);
      memset(&v10.avail_in, 0, 104);
      v10.avail_in = v5;
      v10.avail_out = v5;
      v10.next_out = (Bytef *)objc_msgSend(v6, "mutableBytes", v2, *(_QWORD *)&v10.avail_in);
      if (v6
        && !deflateInit2_(&v10, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (v7 = deflate(&v10, 4), v8 = deflateEnd(&v10), v7 == 1))
      {
        v4 = 0;
        if (!v8 && v5 == v10.total_in)
        {
          objc_msgSend(v6, "setLength:", v10.total_out);
          v4 = objc_msgSend(v6, "copy");
        }
      }
      else
      {
        v4 = 0;
      }

    }
  }
  return v4;
}

void sub_20B765054(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x20B765004);
  }
  _Unwind_Resume(exc_buf);
}

void sub_20B769080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_20B769BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_20B769D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B76A068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B76A288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void MachineDataAddHeadersToRequestProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __MachineDataAddHeadersToRequestProperties_block_invoke;
  v5[3] = &unk_24C43CB28;
  v6 = v3;
  v4 = v3;
  __GetMachineDataHeaders(a2, v5);

}

void __GetMachineDataHeaders(void *a1, void *a2)
{
  void (**v3)(id, void *, void *);
  int v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = 0;
  v19 = 0;
  v17 = 0;
  v4 = MEMORY[0x20BD375A4](objc_msgSend(a1, "unsignedLongLongValue"), &v19, (char *)&v17 + 4, &v18, &v17);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedFairPlayAnisetteConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      v10 = v8;
    else
      v10 = v8 & 2;
    if (v10)
    {
      v20 = 138543618;
      v21 = CFSTR("ISMachineDataActionOperation");
      v22 = 2048;
      v23 = v5;
      LODWORD(v16) = 22;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:
        v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v20, v16);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog();
    }

    v11 = 0;
    goto LABEL_14;
  }
  if (v19)
  {
    v13 = objc_alloc(MEMORY[0x24BDBCE50]);
    v14 = (void *)objc_msgSend(v13, "initWithBytesNoCopy:length:freeWhenDone:", v19, HIDWORD(v17), 0);
    objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  if (v18)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCE50]);
    v6 = (void *)objc_msgSend(v15, "initWithBytesNoCopy:length:freeWhenDone:", v18, v17, 0);
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v11 = 0;
LABEL_21:
  v3[2](v3, v12, v11);
  if (v19)
    MEMORY[0x20BD375E0]();
  if (v18)
    MEMORY[0x20BD375E0]();

}

void MachineDataAddHeadersToRequestProperties_V1_5(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", -1);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __MachineDataAddHeadersToRequestProperties_V1_5_block_invoke;
  v4[3] = &unk_24C43CB28;
  v5 = v1;
  v3 = v1;
  __GetMachineDataHeaders(v2, v4);

}

void sub_20B76E370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_20B770750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ISSoftwareMapXPC(uint64_t a1, uint64_t a2)
{
  if (__ISSoftwareMapXPC_sOnce != -1)
    dispatch_once(&__ISSoftwareMapXPC_sOnce, &__block_literal_global_11);
  if (__ISSoftwareMapXPC_sConnection)
    return objc_msgSend((id)__ISSoftwareMapXPC_sConnection, "sendMessage:withReply:", a1, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, 0);
}

void sub_20B770D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __StartWatchingInstallationNotifications()
{
  return objc_msgSend(-[NSObject mainThreadProxy](ISSoftwareMap, "mainThreadProxy"), "_startWatchingInstallationNotifications");
}

uint64_t __SoftwareMappingChangedNotification()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _WORD *v8;
  uint64_t v9;
  _WORD v10[8];

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v0)
    v0 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v1 = objc_msgSend(v0, "shouldLog");
  if (objc_msgSend(v0, "shouldLogToDisk"))
    v2 = v1 | 2;
  else
    v2 = v1;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v0, "OSLogObject"), OS_LOG_TYPE_INFO))
    v3 = v2;
  else
    v3 = v2 & 2;
  if (v3)
  {
    v10[0] = 0;
    LODWORD(v9) = 2;
    v8 = v10;
    v4 = _os_log_send_and_compose_impl();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v4, 4, v10, v9);
      free(v5);
      v8 = (_WORD *)v6;
      SSFileLog();
    }
  }
  +[ISSoftwareMap invalidateCurrentMap](ISSoftwareMap, "invalidateCurrentMap", v8);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("ISSoftwareMapInvalidatedExternalNotification"), 0);
}

uint64_t ISCompareSoftwareVersions(void *a1, void *a2, void *a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (a1 == a2)
    return 0;
  if (!a1)
    return -1;
  if (!a2)
    return 1;
  if (a3)
  {
    v6 = objc_msgSend(a3, "indexOfObject:", a1);
    v7 = objc_msgSend(a3, "indexOfObject:", a2);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 == 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(a1, "compare:", a2);
  v8 = -1;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 1;
    v10 = 1;
    if (v6 <= v7)
      v10 = -1;
    if (v6 == v7)
      v10 = 0;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      return v10;
  }
  return v8;
}

void sub_20B77221C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_20B7724AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B772BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B772EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20B77344C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ISUniqueOperationLock(uint64_t a1, uint64_t a2, void *a3)
{
  ISUniqueOperationManager *v6;
  uint64_t v7;
  id AssociatedObject;
  uint64_t v9;

  v6 = +[ISUniqueOperationManager sharedInstance](ISUniqueOperationManager, "sharedInstance");
  v7 = -[ISUniqueOperationManager predecessorForKey:operation:](v6, "predecessorForKey:operation:", a1, a2);
  AssociatedObject = objc_getAssociatedObject(a3, "com.apple.iTunesStore.ISUniqueOperationQueueAdjusts");
  if (!AssociatedObject || objc_msgSend(AssociatedObject, "BOOLValue"))
  {
    pthread_mutex_lock(&__LocksLock);
    v9 = objc_msgSend(a3, "maxConcurrentOperationCount");
    if (v9 != -1)
      objc_msgSend(a3, "setMaxConcurrentOperationCount:", v9 + 1);
    pthread_mutex_unlock(&__LocksLock);
  }
  objc_msgSend(__GetLockForKey(a1), "lock");
  -[ISUniqueOperationManager setPredecessorIfNeeded:forKey:](v6, "setPredecessorIfNeeded:forKey:", a2, a1);
  return v7;
}

id __GetLockForKey(uint64_t a1)
{
  id v2;
  id v3;

  pthread_mutex_lock(&__LocksLock);
  v2 = (id)__UniqueOperationLocks;
  if (!__UniqueOperationLocks)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    __UniqueOperationLocks = (uint64_t)v2;
  }
  v3 = (id)objc_msgSend(v2, "objectForKey:", a1);
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1648]);
    objc_msgSend((id)__UniqueOperationLocks, "setObject:forKey:", v3, a1);

  }
  pthread_mutex_unlock(&__LocksLock);
  return v3;
}

uint64_t ISUniqueOperationQueueAdjustsConcurrentOperationCount(void *a1)
{
  id AssociatedObject;

  AssociatedObject = objc_getAssociatedObject(a1, "com.apple.iTunesStore.ISUniqueOperationQueueAdjusts");
  if (AssociatedObject)
    return objc_msgSend(AssociatedObject, "BOOLValue");
  else
    return 1;
}

void ISUniqueOperationQueueSetAdjustsConcurrentOperationCount(id object, int a2)
{
  id v3;

  if (a2)
  {
    objc_setAssociatedObject(object, "com.apple.iTunesStore.ISUniqueOperationQueueAdjusts", 0, (void *)0x301);
  }
  else
  {
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", 0);
    objc_setAssociatedObject(object, "com.apple.iTunesStore.ISUniqueOperationQueueAdjusts", v3, (void *)0x301);

  }
}

uint64_t ISUniqueOperationUnlock(uint64_t a1, uint64_t a2, void *a3)
{
  id AssociatedObject;
  uint64_t result;
  uint64_t v7;

  -[ISUniqueOperationManager uniqueOperationFinished:forKey:](+[ISUniqueOperationManager sharedInstance](ISUniqueOperationManager, "sharedInstance"), "uniqueOperationFinished:forKey:", a2, a1);
  objc_msgSend(__GetLockForKey(a1), "unlock");
  AssociatedObject = objc_getAssociatedObject(a3, "com.apple.iTunesStore.ISUniqueOperationQueueAdjusts");
  if (!AssociatedObject || (result = objc_msgSend(AssociatedObject, "BOOLValue"), (_DWORD)result))
  {
    pthread_mutex_lock(&__LocksLock);
    v7 = objc_msgSend(a3, "maxConcurrentOperationCount");
    if (v7 >= 2)
      objc_msgSend(a3, "setMaxConcurrentOperationCount:", v7 - 1);
    return pthread_mutex_unlock(&__LocksLock);
  }
  return result;
}

uint64_t ISDictionaryValueForCaseInsensitiveString(void *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a1, "objectForKey:", a2);
  if (!result)
    return objc_msgSend(a1, "objectForKey:", objc_msgSend(a2, "lowercaseString"));
  return result;
}

void sub_20B775594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class ISWeakLinkedClassForString(NSString *a1, const void *a2)
{
  __ISGetHandleForLibrary(a2);
  return NSClassFromString(a1);
}

void *__ISGetHandleForLibrary(const void *a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  const void *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  pthread_mutex_lock(&__HandleLock);
  Mutable = (const __CFDictionary *)__HandleForLibrary;
  if (!__HandleForLibrary)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __HandleForLibrary = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System")), "stringByAppendingPathComponent:", CFSTR("Library"));
    switch((unint64_t)a1)
    {
      case 0uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend((id)CPSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("usr")), "stringByAppendingPathComponent:", CFSTR("lib"));
        v7 = CFSTR("libAccessibility.dylib");
        goto LABEL_49;
      case 1uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("Contacts.framework"));
        v7 = CFSTR("Contacts");
        goto LABEL_49;
      case 2uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("ContactsUI.framework"));
        v7 = CFSTR("ContactsUI");
        goto LABEL_49;
      case 3uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("MediaPlayer.framework"));
        v7 = CFSTR("MediaPlayer");
        goto LABEL_49;
      case 4uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("MessageUI.framework"));
        v7 = CFSTR("MessageUI");
        goto LABEL_49;
      case 5uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("MusicLibrary.framework"));
        v7 = CFSTR("MusicLibrary");
        goto LABEL_49;
      case 6uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("AssetsLibrary.framework"));
        v7 = CFSTR("AssetsLibrary");
        goto LABEL_49;
      case 7uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("ToneLibrary.framework"));
        v7 = CFSTR("ToneLibrary");
        goto LABEL_49;
      case 8uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("PhotoLibrary.framework"));
        v7 = CFSTR("PhotoLibrary");
        goto LABEL_49;
      case 9uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("Social.framework"));
        v7 = CFSTR("Social");
        goto LABEL_49;
      case 0xAuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("Accounts.framework"));
        v7 = CFSTR("Accounts");
        goto LABEL_49;
      case 0xBuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("AccountSettings.framework"));
        v7 = CFSTR("AccountSettings");
        goto LABEL_49;
      case 0xCuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("AppleAccount.framework"));
        v7 = CFSTR("AppleAccount");
        goto LABEL_49;
      case 0xDuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("AskPermission.framework"));
        v7 = CFSTR("AskPermission");
        goto LABEL_49;
      case 0xEuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("Celestial.framework"));
        v7 = CFSTR("Celestial");
        goto LABEL_49;
      case 0xFuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("CoreMedia.framework"));
        v7 = CFSTR("CoreMedia");
        goto LABEL_49;
      case 0x10uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("AudioToolbox.framework"));
        v7 = CFSTR("AudioToolbox");
        goto LABEL_49;
      case 0x11uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("ManagedConfiguration.framework"));
        v7 = CFSTR("ManagedConfiguration");
        goto LABEL_49;
      case 0x12uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("MobileBackup.framework"));
        v7 = CFSTR("MobileBackup");
        goto LABEL_49;
      case 0x13uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("StoreKit.framework"));
        v7 = CFSTR("StoreKit");
        goto LABEL_49;
      case 0x14uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("StoreKitUI.framework"));
        v7 = CFSTR("StoreKitUI");
        goto LABEL_49;
      case 0x15uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("BiometricKit.framework"));
        v7 = CFSTR("BiometricKit");
        goto LABEL_49;
      case 0x16uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("Radio.framework"));
        v7 = CFSTR("Radio");
        goto LABEL_49;
      case 0x17uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("MobileInstallation.framework"));
        v7 = CFSTR("MobileInstallation");
        goto LABEL_49;
      case 0x18uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("StreamingZip.framework"));
        v7 = CFSTR("StreamingZip");
        goto LABEL_49;
      case 0x19uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("PassKit.framework"));
        v7 = CFSTR("PassKit");
        goto LABEL_49;
      case 0x1AuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("AppleAccountUI.framework"));
        v7 = CFSTR("AppleAccountUI");
        goto LABEL_49;
      case 0x1BuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("CoreDuet.framework"));
        v7 = CFSTR("CoreDuet");
        goto LABEL_49;
      case 0x1CuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("CoreTelephony.framework"));
        v7 = CFSTR("CoreTelephony");
        goto LABEL_49;
      case 0x1DuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("AppStoreDaemon.framework"));
        v7 = CFSTR("AppStoreDaemon");
        goto LABEL_49;
      case 0x1EuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("LocalAuthentication.framework"));
        v7 = CFSTR("LocalAuthentication");
        goto LABEL_49;
      case 0x1FuLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("MobileKeyBag.framework"));
        v7 = CFSTR("MobileKeyBag");
        goto LABEL_49;
      case 0x20uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("SafariServices.framework"));
        v7 = CFSTR("SafariServices");
        goto LABEL_49;
      case 0x21uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("CryptoTokenKit.framework"));
        v7 = CFSTR("CryptoTokenKit");
        goto LABEL_49;
      case 0x22uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("BookLibrary.framework"));
        v7 = CFSTR("BookLibrary");
        goto LABEL_49;
      case 0x23uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("CoreGraphics.framework"));
        v7 = CFSTR("CoreGraphics");
        goto LABEL_49;
      case 0x24uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("DeviceIdentity.framework"));
        v7 = CFSTR("DeviceIdentity");
        goto LABEL_49;
      case 0x25uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("MobileActivation.framework"));
        v7 = CFSTR("MobileActivation");
        goto LABEL_49;
      case 0x26uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("PassKitCore.framework"));
        v7 = CFSTR("PassKitCore");
        goto LABEL_49;
      case 0x27uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("PassKitUI.framework"));
        v7 = CFSTR("PassKitUI");
        goto LABEL_49;
      case 0x28uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Frameworks")), "stringByAppendingPathComponent:", CFSTR("MediaAccessibility.framework"));
        v7 = CFSTR("MediaAccessibility");
        goto LABEL_49;
      case 0x29uLL:
        v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks")), "stringByAppendingPathComponent:", CFSTR("RTCReporting.framework"));
        v7 = CFSTR("RTCReporting");
LABEL_49:
        v8 = (void *)objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
        if (!v8)
          goto LABEL_52;
        *__error() = 0;
        v9 = dlopen((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 1);
        if (!v9)
          goto LABEL_52;
        v10 = v9;
        CFDictionarySetValue((CFMutableDictionaryRef)__HandleForLibrary, a1, v9);
        pthread_mutex_unlock(&__HandleLock);
        v11 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("ISWeakLibraryLoaded"), 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1), CFSTR("Library"), 0));
        return v10;
      default:
LABEL_52:
        v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        if (!v12)
          v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v13 = objc_msgSend(v12, "shouldLog");
        if (objc_msgSend(v12, "shouldLogToDisk"))
          v14 = v13 | 2;
        else
          v14 = v13;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v14 &= 2u;
        if (v14)
        {
          v18 = 134218242;
          v19 = a1;
          v20 = 2080;
          v21 = dlerror();
          LODWORD(v17) = 22;
          v15 = _os_log_send_and_compose_impl();
          if (v15)
          {
            v16 = (void *)v15;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v18, v17);
            free(v16);
            SSFileLog();
          }
        }
        break;
    }
  }
  pthread_mutex_unlock(&__HandleLock);
  return (void *)Value;
}

void *ISWeakLinkedSymbolForString(const char *a1, const void *a2)
{
  void *result;

  result = __ISGetHandleForLibrary(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

void *ISWeakLinkedStringConstantForString(const char *a1, const void *a2)
{
  void *result;

  result = __ISGetHandleForLibrary(a2);
  if (result)
  {
    result = dlsym(result, a1);
    if (result)
      return *(void **)result;
  }
  return result;
}

uint64_t ISURLCachePurgeMemoryCache(void *a1)
{
  objc_msgSend(a1, "_CFURLCache");
  return _CFURLCachePurgeMemoryCache();
}

uint64_t ISURLCacheSaveMemoryCache(void *a1)
{
  objc_msgSend(a1, "_CFURLCache");
  return _CFURLCachePersistMemoryToDiskNow();
}

void sub_20B779A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void SSVPurchaseAddDownloadPropertiesForBuyParameters(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a1;
  objc_msgSend(v13, "buyParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "copyDictionaryForQueryString:unescapedValues:", v1, 1);
    v3 = *MEMORY[0x24BEB23A8];
    objc_msgSend(v13, "valueForDownloadProperty:", *MEMORY[0x24BEB23A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("appExtVrsId"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v13, "setValue:forDownloadProperty:", *MEMORY[0x24BEB22C0], v3);

    }
    v6 = *MEMORY[0x24BEB2338];
    objc_msgSend(v13, "valueForDownloadProperty:", *MEMORY[0x24BEB2338]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("bid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v13, "setValue:forDownloadProperty:", v8, v6);

    }
    v9 = *MEMORY[0x24BEB2410];
    objc_msgSend(v13, "valueForDownloadProperty:", *MEMORY[0x24BEB2410]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("salableAdamId"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v11, "longLongValue"));
        objc_msgSend(v13, "setValue:forDownloadProperty:", v12, v9);

      }
    }

  }
}

id ISFairPlaySAPSessionURLBag()
{
  if (ISFairPlaySAPSessionURLBag_sOnce != -1)
    dispatch_once(&ISFairPlaySAPSessionURLBag_sOnce, &__block_literal_global_3);
  return (id)ISFairPlaySAPSessionURLBag_sBag;
}

void sub_20B77C970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

id ISAccountURLWithURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "touchIDContinueToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(v3, "copyQueryStringDictionaryWithUnescapedValues:", 0);
    objc_msgSend(MEMORY[0x24BDBCF48], "escapedStringForString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("tidContinueToken"));

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __ISAccountURLWithURL_block_invoke;
    v29[3] = &unk_24C43C4E8;
    v30 = v9;
    v10 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v29);
    v11 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v3, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScheme:", v12);

    objc_msgSend(v3, "host");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHost:", v13);

    objc_msgSend(v3, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPath:", v14);

    objc_msgSend(v11, "setPercentEncodedQueryItems:", v10);
    objc_msgSend(v11, "URL");
    v15 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v15;
  }
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v16, "setObject:forKey:", CFSTR("account"), CFSTR("action"));
  objc_msgSend(v5, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("url"));

  if (objc_msgSend(v4, "shouldPersonalizeResponseActions"))
  {
    v18 = objc_msgSend(v4, "accountScope");
    objc_msgSend(v4, "requiredUniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 && objc_msgSend(v19, "unsignedLongLongValue"))
    {
      objc_msgSend(v20, "stringValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("dsid"));

      v22 = (_QWORD *)MEMORY[0x24BE07CB0];
      if (v18)
        v22 = (_QWORD *)MEMORY[0x24BE07CA8];
      objc_msgSend(MEMORY[0x24BDB4398], "ams_accountTypeIdentifierForMediaType:", *v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("accountType"));

    }
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "queryStringForDictionary:escapedValues:", v16, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://?%@"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLWithString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

Class initACAccountStore()
{
  Class result;

  if (AccountsLibrary_sOnce != -1)
    dispatch_once(&AccountsLibrary_sOnce, &__block_literal_global_13);
  result = objc_getClass("ACAccountStore");
  classACAccountStore = (uint64_t)result;
  getACAccountStoreClass = (uint64_t (*)())ACAccountStoreFunction;
  return result;
}

id ACAccountStoreFunction()
{
  return (id)classACAccountStore;
}

uint64_t __InvalidateBagsNotification(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v10;
  _WORD v11[8];

  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    v7 = v5;
  else
    v7 = v5 & 2;
  if (!v7)
    goto LABEL_12;
  v11[0] = 0;
  LODWORD(v10) = 2;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v11, v10);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_12:

  }
  return objc_msgSend(a2, "invalidateAllURLBags");
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

id ISCopyLoadMoreRangesFromArray(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("endId"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", CFSTR("startId"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "addObject:", v9);
              v5 = v11;
              objc_msgSend(v12, "addObject:", v8);
            }
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return v12;
}

uint64_t sub_20B789B88(mach_port_t a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  mach_msg_header_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;

  v15 = 1;
  v16 = a2;
  v17 = 16777472;
  v18 = a3;
  v19 = *MEMORY[0x24BDAC470];
  v20 = a3;
  reply_port = mig_get_reply_port();
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = reply_port;
  v14.msgh_bits = -2147478253;
  *(_QWORD *)&v14.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v14);
    reply_port = v14.msgh_local_port;
  }
  v9 = mach_msg(&v14, 3, 0x38u, 0x40u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v14.msgh_local_port);
    return v10;
  }
  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(v14.msgh_local_port);
    return v10;
  }
  if (v14.msgh_id == 71)
  {
    v12 = 4294966988;
  }
  else if (v14.msgh_id == 1300)
  {
    if ((v14.msgh_bits & 0x80000000) != 0)
    {
      v12 = 4294966996;
      if (v15 == 1 && v14.msgh_size == 56 && !v14.msgh_remote_port && HIBYTE(v17) == 1)
      {
        v13 = v18;
        if (v18 == v20)
        {
          *a4 = v16;
          *a5 = v13;
          return 0;
        }
      }
    }
    else if (v14.msgh_size == 36)
    {
      v12 = 4294966996;
      if (HIDWORD(v16))
      {
        if (v14.msgh_remote_port)
          v12 = 4294966996;
        else
          v12 = HIDWORD(v16);
      }
    }
    else
    {
      v12 = 4294966996;
    }
  }
  else
  {
    v12 = 4294966995;
  }
  mach_msg_destroy(&v14);
  return v12;
}

void zcamdt242h(uint64_t a1, int a2)
{
  __asm { BR              X8 }
}

void Gg9q7vHg34(unint64_t a1, uint64_t a2)
{
  _BOOL4 v3;

  v3 = a1 > 0xFFFFFFFFFFFFFFEFLL && a2 != 0;
  __asm { BR              X8 }
}

uint64_t sub_20B789FE8(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  BOOL v3;

  *a2 = 0;
  v3 = MEMORY[0x191D653A4](24, 4101018099) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((2 * v3) | 0x1E4u)) - 4))();
}

uint64_t sub_20B78A030(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 2118401485;
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(v3 - 136) = a1;
  v4 = v2(4096, 1358311088);
  **(_QWORD **)(v3 - 136) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((216 * (v4 != 0)) ^ 0x354u)) - 8))();
}

uint64_t sub_20B78A0C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;

  *(_QWORD *)(v33 - 152) = v32;
  *(_DWORD *)(v27 + 8) = v29 + 4096;
  v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * ((712 * (*(_DWORD *)(v27 + 12) - 4093 < ((v28 - 598) ^ 0x2C8) + ((v28 - 468) | 0xEu) - 5061)) ^ (v28 - 598)));
  v35 = *(_QWORD *)(v26 + 8 * (v28 - 821)) - 13;
  *(_QWORD *)(v33 - 200) = v25;
  *(_QWORD *)(v33 - 192) = v35;
  return v34(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, v31, a18, a19,
           a20,
           a21,
           a22,
           v27 + 8,
           a24,
           a25);
}

uint64_t sub_20B78A134()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((15
                                * (2 * (v0 ^ 0x2F1)
                                 + ((2 * (v3 + 2 * v1)) & 0xFCDB7BFA)
                                 + ((v3 + 2 * v1) ^ 0xFE6DBDFD)
                                 + 26357872 < 0xFFFFEFFB)) ^ v0)))();
}

uint64_t sub_20B78A19C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = __ldaxr(v4);
  v8 = (*(uint64_t (**)(_QWORD, uint64_t))(v6 - 152))((a1 + 26362371), 1120292948);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 + 8 * (((v8 != 0) * ((v7 - 215) ^ 0x797)) ^ v7)) - 8))(v8, v9, v10, v11, v12, v13, v14, v15, a2, a3, a4);
}

void sub_20B78A1F4(uint64_t a1)
{
  __asm { BR              X17 }
}

uint64_t sub_20B78C5B0()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1818 * (v0 != v2)) ^ (v1 - 1146)))
                            - (v1 - 1408)
                            + 87))();
}

uint64_t sub_20B78C5EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  int v3;
  int v4;
  uint64_t v5;
  _BOOL4 v7;

  v7 = v2 < ((v3 + 1547) ^ 0x662u) || (unint64_t)(a1 - a2) < 0x20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((222 * v7) ^ v3)) + 3545690796 - (v3 ^ (v4 + 55))))();
}

void sub_20B78CD40()
{
  _QWORD *v0;
  void (*v1)(void);
  _QWORD *v2;

  v2 = v0;
  v1();
  *v2 = 0;
  v2[1] = 2118401485;
  ((void (*)(_QWORD *))v1)(v2);
  JUMPOUT(0x20B78CD64);
}

void jk24uiwqrg(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_20B78CDDC()
{
  MEMORY[0x191D68428]();
  return 0;
}

void fm23w5mn5o()
{
  uint64_t v0;
  char v1;

  v0 = qword_2547275E8 - (_QWORD)&v1 + qword_254727600;
  qword_2547275E8 = 1137813707 * v0 + 0x5751864245CF6939;
  qword_254727600 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  __asm { BR              X8 }
}

uint64_t sub_20B78CEDC()
{
  uint64_t v0;
  void (*v1)(void);
  uint64_t v2;

  v1();
  *(_QWORD *)(v0 + 8) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((20 * (*(_QWORD *)(v0 + 24) != 0)) | 0xA8u)) - 4))();
}

uint64_t sub_20B78CF14()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t v3;
  int v4;

  *(_QWORD *)(v3 - 111) = v0;
  v2();
  *(_QWORD *)(v1 + 24) = 0;
  *(_DWORD *)(v1 + 36) = 0;
  *(_QWORD *)v1 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((*(_QWORD *)(v1 + 48) == 0) * (((5 * (v4 ^ 0x92) + 20) | 8) - 290)) ^ (5 * (v4 ^ 0x92))))
                            - ((5 * (v4 ^ 0x92) + 20) ^ 0x199u)
                            + 171))();
}

uint64_t jkag7Bg01u(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8)) & 1) != 0)
    __asm { BR              X8 }
  return 4294922295;
}

void sub_20B78D494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18, int a19, int a20)
{
  uint64_t v20;
  _QWORD *v21;

  v21 = *(_QWORD **)(v20 - 152);
  (*(void (**)(_QWORD))(v20 - 208))(*v21);
  *v21 = a17;
  *a18 = a20;
  JUMPOUT(0x20B78D4CCLL);
}

uint64_t sub_20B78D57C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = ((a1 + 968818423) & 0xC640FFBE ^ 0x14473943) + *(_DWORD *)(v1 + 12);
  v4 = *(_DWORD *)(v1 + 8) - 797629582;
  v5 = v3 < 0x14473A79;
  v6 = v3 > v4;
  if (v4 < 0x14473A79 != v5)
    v6 = v5;
  return (*(uint64_t (**)(void))(v2 + 8 * ((444 * v6) ^ a1)))();
}

uint64_t sub_20B78D5FC@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  _BOOL4 v32;
  unsigned int v33;
  _BOOL8 v34;
  _BOOL4 v35;

  *(_QWORD *)(v29 - 152) = v27;
  v30 = a5 - 844;
  v31 = v26 + 659547387;
  v32 = (v26 + 659547387) < 0x6B21FBFE;
  v33 = ((2 * (2 * v26 + 2019283442)) & 0x87B47EFE) + ((2 * v26 + 2019283442) ^ (v30 + 1138376259));
  v34 = v33 + 659012735 < 0x6B21FBFE;
  if (v32 != v34)
    v35 = v33 + 659012735 < 0x6B21FBFE;
  else
    v35 = v33 + 659012735 > v31;
  return ((uint64_t (*)(_BOOL8, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 + 8 * ((109 * v35) ^ v30)) - 4))(v34, 2019283442, 1797389310, v33 - 534648, a1, a2, a3, a4, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_20B78D6A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  _DWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;

  v34 = *v31;
  v35 = ((2 * v29) & 0x9FDFFFFC) + (v29 ^ 0x4FEFFFFE);
  *(_BYTE *)(*v31 + v35 - 1341128701) = -2;
  v36 = (v33 - 222) | 0x88;
  *(_BYTE *)(v34 + v35 - 1341128702) = -123;
  *(_BYTE *)(v34 + v35 + (v36 ^ 0xB01002EC)) = 99;
  *(_BYTE *)(v34 + v35 - 1341128699) = -80;
  *v30 += 4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(4001280290 - ((v36 + 67120440) | 0xEA7E8106) + *(_QWORD *)(v32 + 11808)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_20B78F39C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2 + 8 * ((((v3 + ((v1 - 1524) | 0x220) - 675) ^ (v3 + 177)) * (v0 != 0)) ^ v1)))();
}

uint64_t sub_20B78F3D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  int v5;
  _BOOL4 v7;

  v7 = v2 < 8 || (unint64_t)(a1 - a2) < 0x20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (int)((((((2 * v3) ^ 0x696) - 285297762) & 0xFF7FF9B6 ^ (v5 + 13)) * v7) ^ v3))
                            - 8))();
}

uint64_t sub_20B78F424()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  char v3;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 < 0x20) ^ ((v1 ^ (v3 - 48)) + 1)) & 1)
                                * (((v1 - 336) | 0x71) - 749)) ^ v1)))();
}

uint64_t sub_20B78F464@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  __int128 v6;
  _BOOL4 v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (((v5 + v3 - 740) | 0x311u) ^ 0x335) != (v2 & 0xFFFFFFE0);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (int)(v7 & 0xFFFFFFFB | (4 * v7) | (v5 + v3 - 488))) - 8))();
}

uint64_t sub_20B78F4BC()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)(v1 ^ (205 * (v0 == 0))))
                            - (v1 ^ 0xEE7EB161 ^ ((v1 - 332103741) | 0x24A3120))))();
}

uint64_t sub_20B78F510()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v1 ^ (2
                                               * (((((v1 - 1939960322) ^ (v0 < 8)) & 1) == 0) | (32
                                                                                               * ((((v1 - 1939960322) ^ (v0 < 8)) & 1) == 0))))))
                            - 8))();
}

uint64_t sub_20B78F554()
{
  int v0;
  unint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1119
                                          * (v1 >= ((v0 + 240029406) | 0xE0302026)
                                                 + (unint64_t)((v0 + 486) | 0x235u)
                                                 - 4001281859u)) ^ v0))
                            - 8))();
}

uint64_t sub_20B78F5AC()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((85 * (v0 >= ((v1 - 1420) ^ 0x91u))) ^ v1))
                            - (v1 ^ (v3 + 1525) ^ 0xEE7EB12ELL)))();
}

void rsegvyrt87(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v6;
  int v8;

  if (a4)
    v6 = a5 == 0;
  else
    v6 = 1;
  v8 = v6 || a6 == 0;
  __asm { BR              X8 }
}

uint64_t sub_20B7901E0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5)
{
  uint64_t v5;
  _BOOL4 v6;

  *a4 = 0;
  *a5 = 0;
  v6 = MEMORY[0x191D653A4](24, 4101018099) != 0;
  return (*(uint64_t (**)(void))(v5 + 8 * ((419 * v6) ^ 0xA1u)))();
}

uint64_t sub_20B790240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  *(_QWORD *)(v31 - 256) = v28;
  *(_QWORD *)(v31 - 184) = v27;
  *(_DWORD *)(v31 - 236) = v26;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 449454675;
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(v31 - 152) = v30;
  v33 = v30(4096, 1358311088);
  *(_QWORD *)a1 = v33;
  v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((63 * (v33 == 0)) ^ 0x1DC));
  *(_QWORD *)(v31 - 144) = 0x191D68428;
  return v34(v33, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_20B7902E8()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 - 144))(v0);
  return 4294922293;
}

uint64_t gJa8aF901k(uint64_t a1)
{
  uint64_t v1;

  if ((unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8)) & 1) != 0)
  {
    v1 = *((_QWORD *)&unk_24C43D0A0 + ((867 * (MEMORY[0x191D653A4](24, 4101018099) != 0)) ^ 0x57Eu));
    __asm { BR              X8 }
  }
  return 4294922295;
}

uint64_t sub_20B796C88(_DWORD *a1)
{
  unsigned int v1;

  v1 = 882831569 * ((a1 & 0xE8317279 | ~(a1 | 0xE8317279)) ^ 0x84383F4C);
  return ((uint64_t (*)(void))(*(_QWORD *)(qword_24C440960[*a1 - v1 - 314]
                                        + 8 * (int)((194 * (v1 + a1[1] - 1169751002 < 0x46)) ^ (*a1 - v1))
                                        - 2)
                            - 4))();
}

uint64_t sub_20B796D08@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  *(_DWORD *)(result + 8) = *(_DWORD *)(*(_QWORD *)(v3 + 8 * (a2 - 347)) + 4 * v2 - 3);
  return result;
}

uint64_t sub_20B796D20(uint64_t result)
{
  *(_DWORD *)(result + 8) = 314902380;
  return result;
}

void uv5t6nhkui()
{
  unint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = qword_2547275E0 ^ (unint64_t)&v2 ^ qword_254727600;
  qword_2547275E0 = (1137813707 * v0) ^ 0xE86952A9CE08E98BLL;
  qword_254727600 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_24C43D0A0
       + ((893
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_24C440960[((-53 * ((qword_254727600 - qword_2547275E0) ^ 0x8B)) ^ byte_20B7BA250[byte_20B7B9F30[(-53 * ((qword_254727600 - qword_2547275E0) ^ 0x8B))] ^ 0xA8])
                                                                      + 12]
                                                      - 3))(24, 4101018099) != 0)) ^ 0x5E4u))- 8;
  __asm { BR              X8 }
}

uint64_t sub_20B796E4C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v6;

  *(_DWORD *)(v4 - 212) = v1;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0x35872FBD3D92718DLL;
  *(_DWORD *)(a1 + 16) = 0;
  v6 = v3(4096, 1358311088);
  *(_QWORD *)a1 = v6;
  return (*(uint64_t (**)(void))(v2 + 8 * ((47 * (v6 == 0)) ^ 0x119u)))();
}

uint64_t sub_20B796EB4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((((((v0 + 732) ^ 0x5E4) + 6) ^ 0x4E045395) * (v2 != 0)) ^ 0x5E4))
                            - 8))();
}

uint64_t sub_20B796F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;

  v4(v5, a2, a3, a4, 0x120104000);
  return 4294922293;
}

void tn46gtiuhw(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  BOOL v7;
  int v10;

  if (a4)
    v7 = a5 == 0;
  else
    v7 = 1;
  v10 = v7 || a6 == 0 || a7 == 0;
  __asm { BR              X8 }
}

uint64_t sub_20B79A9F4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  *a4 = 0;
  **(_DWORD **)(v8 - 152) = 0;
  **(_QWORD **)(v8 - 144) = 0;
  *a7 = 0;
  v9 = (uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((787 * (((unk_254727708 == 0) ^ 0x81) & 1)) ^ 0x15Eu)) - 8);
  *(_QWORD *)(v8 - 216) = 0x191D68428;
  return v9();
}

uint64_t sub_20B79AA70()
{
  int v0;
  void (*v1)(void);
  uint64_t v2;
  uint64_t v3;

  v1();
  *(_QWORD *)(v3 + 8) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((1438 * (*(_QWORD *)(v3 + 24) != 0)) ^ (v0 + 1485326383))))();
}

uint64_t sub_20B79AAA8()
{
  int v0;
  int v1;
  void (*v2)(void);
  uint64_t v3;
  uint64_t v4;

  v2();
  *(_QWORD *)(v4 + 24) = 0;
  *(_DWORD *)(v4 + 36) = 0;
  *(_QWORD *)v4 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((971 * (*(_QWORD *)(v4 + 48) != 0)) ^ (v0 + v1 + 91))) - 4))();
}

uint64_t sub_20B79AAE4()
{
  int v0;
  int v1;
  void (*v2)(void);
  uint64_t v3;
  uint64_t v4;

  v2();
  *(_QWORD *)(v4 + 48) = 0;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((v0 + v1 + 229328577) & 0xF254BEAF) - 1564) * (*(_QWORD *)(v4 + 64) != 0)) ^ (v0 + v1 + 172))))();
}

void fy34trz2st()
{
  unint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (qword_254727600 + qword_2547275F0) ^ (unint64_t)&v2;
  qword_2547275F0 = 1137813707 * v0 - 0x1796AD5631F71675;
  qword_254727600 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_24C43D0A0
       + ((203
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_24C440960[((-53 * (qword_2547275F0 ^ 0x8B ^ qword_254727600)) ^ byte_20B7B97E0[byte_20B7BA150[(-53 * (qword_2547275F0 ^ 0x8B ^ qword_254727600))] ^ 0x5E])
                                                                      + 1]
                                                      - 3))(24, 4101018099) == 0)) ^ 0x173u))- 4;
  __asm { BR              X8 }
}

uint64_t sub_20B79E8A8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 2051828535;
  *(_DWORD *)(a1 + 16) = 0;
  v4 = v1(4096, 1358311088);
  *(_QWORD *)a1 = v4;
  return (*(uint64_t (**)(void))(v2 + 8 * ((139 * (v4 == 0)) ^ 0x47A)))();
}

uint64_t sub_20B79E924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void (*v6)(uint64_t);

  v6(a6);
  return 4294922293;
}

void p435tmhbla()
{
  unint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (qword_254727600 - qword_2547275F8) ^ (unint64_t)&v2;
  qword_2547275F8 = 1137813707 * (v0 + 0x1796AD5631F71675);
  qword_254727600 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_24C43D0A0
       + ((54
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_24C440960[((-53
                                                                                         * ((qword_254727600
                                                                                           - 53 * (v0 + 117)) ^ 0x8B)) ^ byte_20B7B9B10[byte_20B7B96E0[(-53 * ((qword_254727600 - 53 * (v0 + 117)) ^ 0x8B))] ^ 0x9F])
                                                                      - 10]
                                                      - 3))(24, 4101018099) == 0)) ^ 0x29Du))- 8;
  __asm { BR              X8 }
}

uint64_t sub_20B7A174C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v5;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 459037928;
  *(_DWORD *)(a1 + 16) = 0;
  v5 = v3(4096, 1358311088);
  *(_QWORD *)a1 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((100 * (((v5 == 0) ^ 0xEF) & 1)) ^ 0x43Bu))
                            - ((v1 + 12) ^ 0xB2D17A6BLL)))();
}

uint64_t sub_20B7A17E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  *(_DWORD *)(v8 + 8) = v5 + 4096;
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                     + 8
                                                                     * ((1983
                                                                       * (*(_DWORD *)(v8 + 12) - 4093 >= (v4 & 0xFF7 ^ 0x7Cu) - 4764)) ^ v4 & 0xFF7u));
  *(_QWORD *)(v10 - 168) = *(_QWORD *)(v6 + 8 * ((v4 & 0xFF7) - 710)) - 7;
  *(_QWORD *)(v10 - 160) = v3;
  *(_QWORD *)(v10 - 176) = *(_QWORD *)(v6 + 8 * ((v4 & 0xFF7) - 712)) - 13;
  *(_QWORD *)(v10 - 216) = v9;
  return v11(a1, a2, a3, 1294894604);
}

void asabc800ag(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_20B7A4A70(_QWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  _BOOL4 v3;

  *a1 = 0;
  *a2 = 0;
  v3 = MEMORY[0x191D653A4](24, 4101018099) != 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((16 * (v3 & 0xFFFFFFFD | (2 * v3))) ^ 0x59A)))();
}

uint64_t sub_20B7A4ABC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v6;

  *(_QWORD *)(v4 - 168) = v1;
  *(_QWORD *)(v4 - 160) = v3;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 1051258734;
  *(_DWORD *)(a1 + 16) = 0;
  v6 = v3(4096, 1358311088);
  *(_QWORD *)a1 = v6;
  return (*(uint64_t (**)(void))(v2 + 8 * ((89 * (((v6 == 0) ^ 0x93) & 1)) ^ 0x692)))();
}

uint64_t sub_20B7A4B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_DWORD *)(v35 + 8) = v32 + 4096;
  v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8 * ((1674 * (((3 * (v31 ^ 0x8F)) ^ (*(_DWORD *)(v35 + 12) - 4093 < (((v31 ^ 0x532) - 272) | 0x10Fu) - 5024)) & 1)) ^ v31 ^ 0x532u));
  *(_QWORD *)(v36 - 224) = v34;
  return v37(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

uint64_t sub_20B7A4BD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;

  *(_QWORD *)(v32 - 144) = 0;
  *(_QWORD *)(v32 - 176) = 0x9306C2D1D9A7B4E0;
  *(_QWORD *)(v32 - 152) = 0;
  v33 = *v31;
  v34 = ((a9 << ((v29 - 122) & 0xAF ^ 0x8C)) & 0x9F4FE1DE) + (a9 ^ 0x4FA7F0EF) - 1336406255;
  *(_BYTE *)(*v31 + v34) = 0;
  *(_BYTE *)(v33 + v34 + 1) = 0;
  *(_BYTE *)(v33 + v34 + 2) = 0;
  *(_BYTE *)(v33 + v34 + 3) = 1;
  *((_DWORD *)v31 + 3) += 4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * (int)((v29 + 978983814) & 0xC5A5E5AF ^ 0x2B9)) - ((((v29 + 978983814) & 0xC5A5E5AF) - 2007353960) & 0x77A5CEDF) + 1533))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_20B7A4CB4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((63
                                * ((((v1 + 2 * v2) << (((v0 + 100) | 0x54) ^ 0x56)) & 0x7D55FEFE)
                                 + ((v1 + 2 * v2) ^ 0xBEAAFF7F)
                                 + 1096085628 > 0xFFFFEFFA)) ^ v0)))();
}

uint64_t sub_20B7A4D24@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
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

  v17 = (*(uint64_t (**)(_QWORD, uint64_t))(v16 - 160))((a1 + 1096089729), 1120292948);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * ((209 * (v17 != 0)) ^ v14)) - 4))(v17, v18, v19, v20, v21, v22, v23, v24, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14);
}

void sub_20B7A4D84(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  *(_QWORD *)(v5 - 152) = 0;
  *(_QWORD *)(v5 - 144) = 0;
  v6 = *v4;
  *(_QWORD *)(v5 - 176) = 0x9306C2D1D9A7B4E0;
  *(_QWORD *)(v5 - 232) = 0x33EE8B0970FCB5F4;
  *(_QWORD *)(v5 - 192) = v1;
  v7 = (((2 * (v2 ^ 0x188) - 210724645) & 0xC8F67DF) + 1396) | 0x40;
  __asm { BR              X11 }
}

uint64_t sub_20B7A74B4()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * (((((v1 - 603) | 0x418) + 440) * (v0 != v2)) ^ v1)))();
}

uint64_t sub_20B7A74DC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((*(unsigned __int8 *)(v2 + 3663) < 8u) ^ (v0 + 78)) & 1)
                                          * (v0 - 1152)) ^ v0))
                            - 8))();
}

uint64_t sub_20B7A7514()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((194 * (v0 + (unint64_t)(90 * (v1 ^ 0x660u)) - 630 > 0x1F)) ^ v1)))();
}

uint64_t sub_20B7A754C()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((21 * (v1 ^ 0x65F) - 508306593) & 0x1E4C2359) - 795) * (v0 < 0x20)) ^ v1 ^ 0x7F))
                            - 8))();
}

uint64_t sub_20B7A759C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (v3 ^ (v4 - 343) ^ v7) + v2;
  *(_QWORD *)(a1 + v8 - 7) = *(_QWORD *)(a2 + v8 - 7);
  return (*(uint64_t (**)(void))(v6 + 8 * ((((v2 & 0xFFFFFFF8) - 8 == v3) * v5) ^ v4)))();
}

void sub_20B7A75E0()
{
  JUMPOUT(0x20B7A75A8);
}

uint64_t sub_20B7A75E8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((v4 + ((v1 + 1122460830) & 0xBD189B37) - 818) ^ (v4 - 153)) * (v0 != v2)) ^ v1)))();
}

uint64_t sub_20B7A7628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  _BOOL4 v6;

  v6 = v2 > 7 && a1 - a2 >= (unint64_t)(((v3 + 857735565) & 0xCCDFFF5D) - 213) - 808;
  return (*(uint64_t (**)(void))(v4 + 8 * ((1853 * v6) ^ v3)))();
}

uint64_t sub_20B7A7670()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8 * (((v0 >= ((11 * (v1 ^ 0x30D)) ^ 0x2D7u)) * ((40 * (v1 ^ 0x359)) ^ 0x4B4)) ^ v1)))();
}

uint64_t sub_20B7A76BC@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  __int128 v6;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v2 & 0xFFFFFFE0) == 32) * ((8 * v3) ^ v5)) ^ v3)))();
}

void sub_20B7A76F4()
{
  JUMPOUT(0x20B7A76CCLL);
}

uint64_t sub_20B7A7704()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((98 * (v1 != v0)) ^ v2 ^ 0x13D8))
                            - (((v2 ^ 0x13D8) - 1640) | 0x302u)
                            + 810))();
}

uint64_t sub_20B7A773C()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((122 * ((((351 * (v1 ^ 0x331)) ^ 0x405) & v0) != 0)) ^ v1)))();
}

uint64_t sub_20B7A7778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_QWORD *)(a1 + v3) = *(_QWORD *)(a2 + v3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((((v4 - 916160512) & 0x369B7FFE ^ 0xFFFFFD0E) & v2)
                                          - (unint64_t)((v4 - 916160512) & 0x369B7FFE)
                                          + 750 != v3) ^ (v4 - 916160512) & 0x369B7FFEu))
                            - 8))();
}

uint64_t sub_20B7A77D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(a1 + v2) = *(_QWORD *)(a2 + v2);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((v4 != v2) ^ v3)) - 8))();
}

uint64_t sub_20B7A77F4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v3 + 8 * (int)(((v4 + ((v2 + 1975908930) & 0xAEFBCEEB) - 52) * (v1 == v0)) ^ v2)))();
}

uint64_t sub_20B7A7834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;

  *(_BYTE *)(a1 + v3) = *(_BYTE *)(a2 + v3);
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((v3 + 1 != v2) * ((((v4 - 769) | 0x240) - 456930158) & 0x3FFDFC71 ^ (v6 - 319))) ^ ((v4 - 769) | 0x240))))();
}

uint64_t sub_20B7A7884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + v3) = *(_BYTE *)(a2 + v3);
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 + 1 != v2) * v5) ^ v4)))();
}

uint64_t sub_20B7A78A8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1009 * ((((v4 + v2 + 1882864004) ^ (v1 == v0)) & 1) == 0)) ^ v2))
                            - 4))();
}

uint64_t sub_20B7A78F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int128 v5;

  v5 = *(_OWORD *)(a2 + v2 - 16);
  *(_OWORD *)(a1 + v2 - 32) = *(_OWORD *)(a2 + v2 - 32);
  *(_OWORD *)(a1 + v2 - 16) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((651 * ((v2 & 0xFFFFFFE0) == 32)) ^ v3))
                            - (((v3 - 640) | 0x480u) ^ 0x69CLL)))();
}

void sub_20B7A7944()
{
  JUMPOUT(0x20B7A7908);
}

uint64_t sub_20B7A7954()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((v1 == v0) ^ (v2 + 1)) & 1 | (2
                                                                                         * (((v1 == v0) ^ (v2 + 1)) & 1)) | v2))
                            - ((v2 - 384) | 1u)
                            + 1297))();
}

uint64_t sub_20B7A7988()
{
  char v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (823 * ((v0 & 0x18) != 0))))
                            - (v1 - 456)
                            + 841))();
}

uint64_t sub_20B7A79C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v7 = v2 - 1;
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v7 != 0) * v4) ^ (23 * (v3 ^ 0x260))))
                            - (((23 * (v3 ^ 0x260) + 545340934) | 0x4408C60u) ^ v6)))();
}

uint64_t sub_20B7A7A14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = v4 - 1;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v8 != 0) * v5) ^ v2)) - (v3 ^ v7)))();
}

uint64_t sub_20B7A7A40()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned __int8 v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v4 = v2 + v1;
  v5 = v2 + v1 - 158;
  v6 = v2 + v1 + 29;
  v7 = v5 | 0x29;
  v8 = v4 + 488;
  v9 = (*(uint64_t (**)(_QWORD, uint64_t))(v3 - 160))(**(unsigned int **)(v3 - 200), 1490714378);
  v10 = *(_QWORD **)(v3 - 168);
  v11 = 32 * *(_QWORD *)(v3 - 208);
  *(_QWORD *)(*v10 + v11 + 24) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (v8 ^ (((v6 ^ (*(_QWORD *)(*v10 + v11 + 24) == 0)) & 1) << 6)))
                            - v7
                            + 41))();
}

void sub_20B7A7AC4()
{
  JUMPOUT(0x20B7A7480);
}

uint64_t sub_20B7A7B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36)
{
  uint64_t v36;
  int v37;

  return ((uint64_t (*)(void))(616680548
                            - ((v37 - 1477195353) & 0x7CCDFFF9)
                            + *(_QWORD *)(v36 + 8 * ((479 * (((v37 - 685) | 0x2C1) + a36 != 722)) ^ v37))
                            - 8))();
}

uint64_t sub_20B7A7B94()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v1 + 8 * ((*(_QWORD *)(v2 + 16) != 0) ^ (v3 + v0 + 140))))();
}

uint64_t sub_20B7A7BBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((157 * (*(_QWORD *)(v2 + 32 * v0 + 24) == 0)) ^ (v3 - 124)))
                            - 8))();
}

uint64_t sub_20B7A7BE8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t (*v5)(void);
  int v6;
  uint64_t v7;

  v7 = v5();
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8
                                                      * ((112 * (v2 + (v0 ^ (v4 + 595)) - 722 != v1)) ^ (v6 + v0 + 541)))
                                          - 4))(v7);
}

uint64_t sub_20B7A7C24()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v2 + 8 * ((*(_QWORD *)(v3 + 32 * v1 + 16) != 0) ^ (v4 + v0 + 140))))();
}

uint64_t sub_20B7A7C48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  void (*v4)(void);

  v4();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((157 * (*(_QWORD *)(v2 + 32 * v0 + 24) == 0)) ^ (v3 - 124)))
                            - 8))();
}

uint64_t sub_20B7A7C78()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((112 * (v2 + (v0 ^ (v4 + 595)) - 722 != v1)) ^ (v5 + v0 + 541)))
                            - 4))();
}

uint64_t sub_20B7A7CB0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  void (*v5)(uint64_t);
  int v6;
  uint64_t v7;

  v5 = v3;
  v6 = a1 - 326;
  v5(v2);
  **(_QWORD **)(v4 - 168) = 0;
  v7 = ((uint64_t (*)(_QWORD))v5)(*(_QWORD *)(v4 - 144));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1
                                                      + 8
                                                      * ((1188 * (*(_QWORD *)(v4 - 176) != 0x9306C2D1D9A7B4E0)) ^ v6))
                                          - ((383 * (v6 ^ 0x189) - 1388) | 6u)
                                          + 142))(v7);
}

uint64_t sub_20B7A7D28@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((v3 + a1 - 1532 + ((a1 + 12632644) | 0x24010420) - 1233360077)
                                          * (*(_QWORD *)(v1 + 0x6CF93D2E26584B20) == 0)) ^ a1))
                            - 4))();
}

uint64_t sub_20B7A7D88()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  void (*v5)(uint64_t);
  _QWORD *v6;
  int v7;

  v7 = 5 * (v0 ^ (v4 + 30));
  *(_QWORD *)v1 = 0;
  *(_DWORD *)(v1 + 8) = 2111990077;
  *(_DWORD *)(v1 + 12) = 1657608450;
  v5(v2 + 0x6CF93D2E26584B20);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((*v6 != 0) * (v7 ^ (v4 + 150) ^ (v4 - 26))) ^ v7))
                            - ((v4 + v7 - 150) ^ 0x24C1CC64)))();
}

void sub_20B7A7E18()
{
  void (*v0)(void);
  _QWORD *v1;

  v0();
  *v1 = 0;
  v1[1] = 1051258734;
  ((void (*)(_QWORD *))v0)(v1);
  JUMPOUT(0x20B7A7E34);
}

uint64_t sub_20B7A7E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36)
{
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 + 8 * (((a36 + 1 < *(_QWORD *)(v39 - 152)) * (((5 * (v37 ^ (v37 + 130))) ^ 0x59) + 1144)) ^ (v38 + v37 + 805))) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

void sub_20B7A7EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29)
{
  uint64_t v29;

  (*(void (**)(_QWORD))(v29 - 224))(*(_QWORD *)(v29 - 144));
  *a29 = *(_QWORD *)(v29 - 152);
  JUMPOUT(0x20B7A7CD4);
}

void qi864985u0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  int v8;

  if (a2)
    v5 = a3 == 0;
  else
    v5 = 1;
  v8 = !v5 && a4 != 0 && a5 != 0;
  __asm { BR              X8 }
}

uint64_t sub_20B7A7FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,_DWORD *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_QWORD *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,_DWORD *a40,uint64_t a41,_QWORD *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  uint64_t v47;

  *a29 = 0;
  *a40 = 0;
  *a42 = 0;
  *a21 = 0;
  LODWORD(a45) = 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, void *, _DWORD *, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 + 8 * ((354 * (a1 != 0)) | 0x89u)) - 4))(a1, a2, 2419529101, a4, a5, a6, a7, a8, a9, a10, a11, 0x254727758, 0x254727754, 0x2547276F8, 0x1AEA531E4, &unk_254727750, a17, a18, a19,
           &unk_20B7B9D1A,
           a21,
           0x191D68428,
           0x18A076E3CLL,
           0,
           a25,
           a26,
           a1,
           a28,
           a29,
           0x254727754,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           0x254727700,
           a39,
           a40,
           0x191D653A4,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_20B7A80B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 *a16)
{
  int v16;
  uint64_t v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17 + 8 * ((1379 * *a16) ^ 0x135u))
                            - ((v16 + ((a3 - 213) ^ 0x135u) + 721) ^ 0x35ELL)))();
}

void sub_20B7AAC30()
{
  int v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[29];
  uint64_t v6;

  v5[4] = 0x996A703CF9788810;
  v6 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD *))(qword_24C440960[v1 ^ 0x903715AF] - 2))(v2, v4, v5);
  __asm { BR              X8 }
}

uint64_t sub_20B7AAEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(uint64_t, uint64_t))
{
  int v41;
  int v42;
  uint64_t v43;
  _BOOL4 v44;

  v44 = a41(24, 4101018099) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v43 + 8 * ((987 * v44) ^ v42))
                            - (v41
                             + ((v42 - 680044100) & 0xB8BFB5ED)
                             + 1007)
                            + 1140))();
}

uint64_t sub_20B7AAF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(uint64_t, uint64_t))
{
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0x1369D9E660F15CCDLL;
  *(_DWORD *)(a1 + 16) = 0;
  v43 = a41(4096, 1358311088);
  *(_QWORD *)a1 = v43;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 + 8 * (((v43 == 0) * ((v41 ^ 0x58B) + ((v41 - 1000) | 0x12A) - 710)) ^ v41)) - 8))(v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

uint64_t sub_20B7AAFB4()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((103 * (((v0 == 0) ^ (v1 - 45)) & 1)) ^ v1))
                            + 2419529093
                            - ((v1 + 271777358) | 0x80041585)))();
}

uint64_t sub_20B7AB010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(uint64_t),uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;

  a22(v37);
  v43 = (void (*)(uint64_t))(qword_24C440960[v39 ^ 0x90371581] - 2);
  v43(v41);
  v44 = ((uint64_t (*)(uint64_t))v43)(a37);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v42 + 8 * ((v38 + v39 + 1136) ^ (4 * (v40 != 0)))) - 8))(v44);
}

uint64_t sub_20B7AB1EC()
{
  int v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1(v2);
  return (*(uint64_t (**)(void))(v3 + 8 * ((v0 + 1081) ^ (2 * ((STACK[0x248] == 0) | (16 * (STACK[0x248] == 0)))))))();
}

uint64_t sub_20B7AB21C()
{
  int v0;
  int v1;
  uint64_t (*v2)(void);
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = v2();
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4
                                                      + 8
                                                      * ((15 * (v3 == ((v0 + v1 + 8) | 0x68) - 45253)) ^ (v0 + v1 + 985)))
                                          - ((v0 + v1 + 298) ^ 0x1B7)))(v5);
}

uint64_t sub_20B7AB270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  if (!v53)
    JUMPOUT(0x20B76DCCCLL);
  a50 = 0;
  a49 = 0;
  v56 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t *, int *))(qword_24C440960[v54 - 221] - 2))(*(unsigned int *)(qword_24C440960[v54 ^ 0xFA] - 3), *(_QWORD *)a53, *(unsigned int *)(a53 + 12), &a50, &a49);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 + 8 * ((((v56 ^ 0xCCDBDEBE) + ((2 * (_DWORD)v56) & 0x99B7BD7C) == -589570367) * (v54 + 179)) ^ v54)) - 8))(v56, v57, v58, v59, v60, v61, v62, v63, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

uint64_t sub_20B7AB328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;

  v24 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 + 8 * (v20 ^ 0xEC)) - 3))(*(unsigned int *)(*(_QWORD *)(v22 + 8 * (v20 ^ 0xDD)) - 2), a20, v21) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v23 + 8 * ((v24 * (v20 + 1499)) ^ v20)) - 8))();
}

uint64_t sub_20B7AB380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(uint64_t, uint64_t),uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,unint64_t a59)
{
  int v59;
  int v60;
  int v61;
  uint64_t v62;
  unsigned int *v63;
  uint64_t (*v64)(_QWORD, _QWORD, _QWORD, uint64_t *, int *);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t (*v69)(void);
  int v71;
  int v72;

  v67 = v64(*v63, *(_QWORD *)v62, *(unsigned int *)(v62 + 12), &a50, &a49);
  v68 = (v67 ^ 0x7E73DEBE) + ((v60 - 51921789) & (2 * v67)) - 841121840;
  if (v68 == v61)
  {
    v71 = -45017;
  }
  else
  {
    if ((v67 ^ 0x7E73DEBE) + ((v60 - 51921789) & (2 * (_DWORD)v67)) == 2121522878)
    {
      v69 = (uint64_t (*)(void))(*(_QWORD *)(v65
                                          + 8
                                          * (v59 - 1875438195 + 18 * (((a41(24, 4101018099) == 0) ^ 0x6D) & 1) + 247))
                              - 8);
      return v69();
    }
    v72 = 882831569 * ((-1004377353 - ((v66 - 108) | 0xC4226AF7) + ((v66 - 108) | 0x3BDD9508)) ^ 0xA82B27C2);
    *(_DWORD *)(v66 - 108) = v59 + v72 - 1875437980;
    *(_DWORD *)(v66 - 104) = v68 - v72 - 110604966;
    v67 = sub_20B796C88((_DWORD *)(v66 - 108));
    if (*(_DWORD *)(v66 - 100) == 314902380)
      v71 = -45016;
    else
      v71 = 0;
  }
  a59 = 0x996A703CF9788810;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65
                                                                        + 8
                                                                        * ((1051
                                                                          * (v71 == ((v59 + 952977539) ^ 0x5769CD99)
                                                                                  + ((v59 + 952977539) & 0x5769CD9A))) ^ (v59 - 1875437897)))
                                                            - 8))(v67, 3969263130, 2419529101);
}

uint64_t sub_20B7AB90C@<X0>(int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  int v52;
  uint64_t v53;

  return ((uint64_t (*)(void))(*(_QWORD *)(v53
                                        + 8
                                        * (((a52 != 0x996A703CF9788810) * (v52 + (a2 ^ (a1 - 246)) + 1722)) ^ a2))
                            - ((a2 + 455) | 2u)
                            + 735))();
}

uint64_t sub_20B7AB95C(uint64_t a1, uint64_t a2, char a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;
  BOOL v9;

  v6 = *(_DWORD *)(v4 + 0x66958FC3068777FCLL) + 813220973;
  v7 = *(_DWORD *)(v4 + 0x66958FC3068777F8) - 487505534;
  v8 = v6 < 0x43E29E4F;
  v9 = v6 > v7;
  if (v8 != v7 < 0x43E29E4F)
    v9 = v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1809 * (((a3 + v3 + 29) ^ v9) & 1)) ^ v3)) - 8))();
}

uint64_t sub_20B7AB9E4@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;

  v6 = (v4 - 1986685284) & 0x766A679A;
  v7 = (*(unsigned __int8 *)(*(_QWORD *)a3 + (v3 + a1)) << 24) | (*(unsigned __int8 *)(*(_QWORD *)a3 + (v3 + a1 + 1)) << 16) | (*(unsigned __int8 *)(*(_QWORD *)a3 + ((v6 + 457) ^ (a2 + 481) ^ 0x7CA13391u) + v3) << 8) | *(unsigned __int8 *)(*(_QWORD *)a3 + (v3 + a1 + 3));
  *(_DWORD *)(a3 + 12) = v3 + 4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1074 * (v7 == 0)) ^ v6)) - 4))();
}

uint64_t sub_20B7ABA70()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((332 * (((v1 == 0x996A703CF9788810) ^ (v0 + 38)) & 1)) ^ v0))
                            - 8))();
}

uint64_t sub_20B7ABAC4(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  _BOOL4 v7;

  v7 = v3 + 650116101 > (v4 - 650610410);
  if ((v3 + 650116101) < 0x3A29D5E3 != (v4 - 650610410) < 0x3A29D5E3)
    v7 = (v3 + 650116101) < 0x3A29D5E3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (v5 ^ (467 * !v7)))
                            - (((v5 ^ (a3 + 481)) - a3 + 905) ^ 0x381)))();
}

uint64_t sub_20B7ABB40@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *(unsigned __int8 *)(v38 + (_DWORD)a1 + v37 + ((v39 - 1094739338) ^ 0xBEBF9CE5) - 276);
  *(_DWORD *)(a8 + 12) = v37 + 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 8 * (v39 ^ (1352 * (v40 != 0x996A703CF9788810)))))(v42, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37);
}

uint64_t sub_20B7ABBDC(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v8 = v6 + v5 + ((v4 + 457) ^ (a2 - 289));
  v9 = v8 + 219058912;
  v10 = (v4 ^ v3 ^ 0x3C2A239E) + v2;
  v11 = v8 > 0xF2F16D1F;
  v12 = v9 > v10;
  if (v10 < 0xD0E92E0 == v11)
    v11 = v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((959 * !v11) ^ v4)) - 4))();
}

uint64_t sub_20B7ABC5C@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(a2 + 12) = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (v3 ^ (1271 * (v4 != 0x996A703CF9788810))))
                            + 2419529093
                            - ((4 * v3) ^ 0x940 ^ (a1 + 436))))();
}

uint64_t sub_20B7ABCB0()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  _BOOL4 v6;

  v5 = ((v2 + 154) ^ 0xD0294B9A) + v0;
  v6 = v1 + 498125799 > v5;
  if ((v1 + 498125799) < 0x311AA5C9 != v5 < 0x311AA5C9)
    v6 = (v1 + 498125799) < 0x311AA5C9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (int)((v6 * (v3 + ((v2 - 1224770303) & 0xD93795BF) - 90)) ^ v2))
                            - 8))();
}

uint64_t sub_20B7ABD34@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  *(_DWORD *)(a8 + 12) = v43 + 4;
  return (*(uint64_t (**)(BOOL, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8 * (v44 ^ (239 * (v45 == 0x996A703CF9788810)))))(v45 == 0x996A703CF9788810, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43);
}

uint64_t sub_20B7ABDC0(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL4 v10;
  int v11;
  _BOOL4 v12;

  v7 = v4 + v5 + a2;
  v8 = v7 + 843813432 + v3 - 883;
  v9 = ((v3 - 574637562) & 0xB27757FD ^ 0x416D200C) + v2;
  v10 = v7 > 0xCDB46DB1;
  v11 = v10 ^ (v9 < 0x324B924E);
  v12 = v8 > v9;
  if (v11)
    v12 = v10;
  return (*(uint64_t (**)(void))(v6 + 8 * ((2019 * !v12) ^ v3)))();
}

void sub_20B7ABE50(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, unsigned int a6@<W7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,_QWORD *a28)
{
  int v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  *(_DWORD *)(a7 + 12) = v28;
  *a28 = v30(v29, 925082483, a1, a2, a3, a4, a5, a6 & 0xFFF80000 | (a6 >> 8) & 0x7FFFF);
  JUMPOUT(0x20B7ABECCLL);
}

uint64_t sub_20B7ABF7C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(_QWORD, uint64_t),uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v50 = a41(a3 + ((v48 + 1231215089) & 0xB69D2587) + 185500081, 1120292948);
  STACK[0x280] = v50;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(_QWORD, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * ((2002 * (v50 != 0)) ^ v48)))(v50, v51, 2419529101, v52, v53, v54, v55, v56, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

void sub_20B7ABFE4()
{
  JUMPOUT(0x20B7A8788);
}

uint64_t sub_20B7AC04C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t v6;

  LODWORD(STACK[0x28C]) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (int)(v5 ^ (1456 * (v3 != 0))))
                            - ((v5 ^ (a3 - 384))
                             + (v5 ^ 0xFFFFFFFF6FC8EBFBLL))))();
}

uint64_t sub_20B7AC0A0@<X0>(int a1@<W8>)
{
  int v1;
  _QWORD *v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(((*v2 != 0) * (v1 + (a1 ^ 0x903716CE) + 51)) | a1)) - 8))();
}

void sub_20B7AC0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v22;
  int v23;
  int v24;
  int v25;

  *(_DWORD *)(a3 + 151) = v25;
  a22(a1, a2, a3 + 151);
  *(_QWORD *)v22 = 0;
  *(_DWORD *)(v22 + 8) = v23;
  *(_DWORD *)(v22 + 12) = v24;
  ((void (*)(uint64_t))a22)(v22);
  JUMPOUT(0x20B7AB854);
}

uint64_t sub_20B7AC104@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((57 * (a1 == 0)) ^ (v1 + v2 + 778))))();
}

uint64_t sub_20B7AC160@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t (*a15)(uint64_t), uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  _QWORD *v52;
  int v53;
  int v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;

  v56 = v52;
  v57 = a15(a1);
  *v56 = 0;
  *a4 = 0;
  *(_DWORD *)(a31 + 40 * a12 + 36) = 0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v55
                                                      + 8
                                                      * ((((((23 * (v54 ^ 0x9037159D)) ^ (a51 == 0x996A703CF9788810)) & 1) == 0)
                                                        * (v54 + 1875439310)) ^ (v53 + v54 + 298)))
                                          - 8))(v57);
}

uint64_t sub_20B7AC19C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(_QWORD, uint64_t))
{
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v43 = a41((a2 - 2046131935), 1120292948);
  STACK[0x268] = v43;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 8 * (int)(((((40 * (v41 ^ 0x39E)) ^ 0xFFFFFEBD) + 29 * (v41 ^ 0x395)) * (v43 == 0)) ^ v41)))(v43, v44, 2419529101, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_20B7AC21C()
{
  uint64_t v0;
  char v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1051 * (((v0 == 0) ^ (v2 - v1 + 33)) & 1)) ^ v2))
                            - (v2 + 646)
                            + 998))();
}

uint64_t sub_20B7AC254@<X0>(char a1@<W2>, int a2@<W8>)
{
  _QWORD *v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((1993 * (((*v2 == 0) ^ (a2 ^ (a1 - 42))) & 1)) ^ a2))
                            - 8))();
}

void sub_20B7AC288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(void),uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  int v40;

  a22();
  *(_QWORD *)a39 = 0;
  *(_DWORD *)(a39 + 8) = v39;
  *(_DWORD *)(a39 + 12) = v40;
  ((void (*)(uint64_t))a22)(a39);
  JUMPOUT(0x20B7AB1A4);
}

void aslgmuibau()
{
  unint64_t v0;
  uint64_t v1;
  _BYTE v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (unint64_t)&v2[qword_254727600 ^ qword_254727608];
  qword_254727608 = 1137813707 * v0 + 0x5751864245CF6939;
  qword_254727600 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_24C43D0A0
       + ((29
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_24C440960[((-53
                                                                                         * ((qword_254727600
                                                                                           - qword_254727608) ^ 0x8B)) ^ byte_20B7B9E30[byte_20B7B9A10[(-53 * ((qword_254727600 - qword_254727608) ^ 0x8B))] ^ 0xDC])
                                                                      - 21]
                                                      - 3))(24, 4101018099) == 0)) ^ 0x1EDu))- 4;
  __asm { BR              X8 }
}

uint64_t sub_20B7AC418(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 1471034656;
  *(_DWORD *)(a1 + 16) = 0;
  v4 = v2(4096, 1358311088);
  *(_QWORD *)a1 = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((v4 == 0) ^ 0xA56C9F0) & 1) == 0) | (4
                                                                                 * ((((v4 == 0) ^ 0xA56C9F0) & 1) == 0)) | 0x440u))
                            - 8))();
}

uint64_t sub_20B7AC480(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  *(_DWORD *)(v6 + 8) = v3 + 4096;
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5
                                                           + 8
                                                           * ((1686
                                                             * ((*(_DWORD *)(v6 + 12) - 4093) < 0xFFFFEFFF)) ^ 0x3C3u));
  *(_QWORD *)(v8 - 184) = *(_QWORD *)(v4 + 248) - 13;
  *(_QWORD *)(v8 - 208) = v2;
  *(_QWORD *)(v8 - 176) = v7;
  return v9(a1, a2, 1352897984);
}

uint64_t sub_20B7AC500(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((31
                                * (((2 * ((v5 << ((v4 ^ 0x82) + 57)) + a3)) & 0xBF7CEFF8)
                                 + (((v5 << ((v4 ^ 0x82) + 57)) + a3) ^ 0xDFBE77FC)
                                 + v3 > 0xFFFFEFFA)) ^ v4)))();
}

uint64_t sub_20B7AF0E0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  _BYTE v5[8];

  v2 = (unint64_t)&v5[qword_254727600 ^ qword_2547275D8];
  qword_2547275D8 = 1137813707 * v2 - 0x1796AD5631F71675;
  qword_254727600 = 1137813707 * (v2 ^ 0xE86952A9CE08E98BLL);
  v3 = ((uint64_t (*)(uint64_t))(qword_24C440960[((-53
                                                                                         * ((qword_254727600
                                                                                           - qword_2547275D8) ^ 0x8B)) ^ byte_20B7BA030[byte_20B7B9C10[(-53 * ((qword_254727600 - qword_2547275D8) ^ 0x8B))] ^ 0x27])
                                                        + 10]
                                        - 2))(a2);
  return ((uint64_t (*)(uint64_t))(qword_24C440960[((-53
                                                                             * ((qword_254727600 - qword_2547275D8) ^ 0x8B)) ^ byte_20B7B9D30[byte_20B7B9910[(-53 * ((qword_254727600 - qword_2547275D8) ^ 0x8B))] ^ 0x2C])
                                                          - 58]
                                          - 3))(v3);
}

uint64_t sub_20B7AF1F8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void (*v5)(_QWORD);
  char v6;

  v0 = qword_254727600 - qword_254727610 - (_QWORD)&v6;
  v1 = (1137813707 * v0) ^ 0xE86952A9CE08E98BLL;
  v2 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  qword_254727610 = v1;
  LOBYTE(v1) = -53 * ((v2 - v1) ^ 0x8B);
  v3 = qword_24C440960[(v1 ^ byte_20B7BA030[byte_20B7B9C10[v1] ^ 0xBE]) - 200];
  qword_254727600 = v2;
  v5 = (void (*)(_QWORD))(qword_24C440960[(v1 ^ byte_20B7B9E30[byte_20B7B9A10[v1] ^ 0x98])
                                                   + 11]
                                   - 2);
  v5(*(unsigned int *)(v3 - 3));
  v5(*(unsigned int *)(qword_24C440960[((-53 * (qword_254727610 ^ 0x8B ^ qword_254727600)) ^ byte_20B7B9E30[byte_20B7B9A10[(-53 * (qword_254727610 ^ 0x8B ^ qword_254727600))] ^ 0xB0])
                                     - 213]
                     - 3));
  return ((uint64_t (*)(_QWORD))v5)(*(unsigned int *)(qword_24C440960[((-53
                                                                                                 * (qword_254727610 ^ 0x8B ^ qword_254727600)) ^ byte_20B7B9D30[byte_20B7B9910[(-53 * (qword_254727610 ^ 0x8B ^ qword_254727600))] ^ 0x94])
                                                                              - 219]
                                                              - 3));
}

void b64_encode__cold_1()
{
  __assert_rtn("b64_encode_", "b64.c", 156, "NULL != rc");
}

void b64_encode__cold_2()
{
  __assert_rtn("b64_encode_", "b64.c", 217, "NULL != strchr(b64_chars, *(p-1))");
}

void b64_encode__cold_3()
{
  __assert_rtn("b64_encode_", "b64.c", 219, "len != lineLen");
}

void b64_encode__cold_4()
{
  __assert_rtn("b64_encode_", "b64.c", 222, "NULL != strchr(b64_chars, *(p-1))");
}

void b64_encode__cold_5()
{
  __assert_rtn("b64_encode_", "b64.c", 224, "len != lineLen");
}

void b64_encode__cold_6()
{
  __assert_rtn("b64_encode_", "b64.c", 227, "NULL != strchr(b64_chars, *(p-1))");
}

void b64_encode__cold_7()
{
  __assert_rtn("b64_encode_", "b64.c", 229, "len != lineLen");
}

void b64_encode__cold_8()
{
  __assert_rtn("b64_encode_", "b64.c", 232, "NULL != strchr(b64_chars, *(p-1))");
}

void b64_encode2_cold_1()
{
  __assert_rtn("b64_encode2", "b64.c", 465, "!\"Bad line length flag specified to b64_encode2()\"");
}

void b64_encode2_cold_2()
{
  __assert_rtn("b64_encode2", "b64.c", 471, "0 == (lineLen % 4)");
}

void b64_decode__cold_1()
{
  __assert_rtn("b64_decode_", "b64.c", 295, "NULL != badChar");
}

void b64_decode__cold_2()
{
  __assert_rtn("b64_decode_", "b64.c", 296, "NULL != rc");
}

void b64_decode__cold_3()
{
  __assert_rtn("b64_decode_", "b64.c", 331, "currIndex < NUM_ENCODED_DATA_BYTES");
}

void b64_decode__cold_4()
{
  __assert_rtn("b64_decode_", "b64.c", 380, "currIndex < NUM_ENCODED_DATA_BYTES");
}

uint64_t AMSError()
{
  return MEMORY[0x24BE07D18]();
}

uint64_t AMSErrorWithFormat()
{
  return MEMORY[0x24BE07D50]();
}

uint64_t AMSGenerateLogCorrelationKey()
{
  return MEMORY[0x24BE07D60]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x24BE07DF0]();
}

uint64_t AMSLogKey()
{
  return MEMORY[0x24BE07E08]();
}

uint64_t AMSSetLogKey()
{
  return MEMORY[0x24BE07FE0]();
}

uint64_t AMSSetLogKeyIfNeeded()
{
  return MEMORY[0x24BE07FE8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFHostCancelInfoResolution(CFHostRef theHost, CFHostInfoType info)
{
  MEMORY[0x24BDB7318](theHost, *(_QWORD *)&info);
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return (CFHostRef)MEMORY[0x24BDB7320](allocator, hostname);
}

CFArrayRef CFHostGetAddressing(CFHostRef theHost, Boolean *hasBeenResolved)
{
  return (CFArrayRef)MEMORY[0x24BDB7328](theHost, hasBeenResolved);
}

void CFHostScheduleWithRunLoop(CFHostRef theHost, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDB7330](theHost, runLoop, runLoopMode);
}

Boolean CFHostSetClient(CFHostRef theHost, CFHostClientCallBack clientCB, CFHostClientContext *clientContext)
{
  return MEMORY[0x24BDB7338](theHost, clientCB, clientContext);
}

Boolean CFHostStartInfoResolution(CFHostRef theHost, CFHostInfoType info, CFStreamError *error)
{
  return MEMORY[0x24BDB7340](theHost, *(_QWORD *)&info, error);
}

void CFHostUnscheduleFromRunLoop(CFHostRef theHost, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDB7348](theHost, runLoop, runLoopMode);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC058]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t CFURLCacheCopySharedURLCache()
{
  return MEMORY[0x24BDB7360]();
}

uint64_t CFURLCacheRemoveCachedResponseForRequest()
{
  return MEMORY[0x24BDB7370]();
}

uint64_t CFURLCacheSetDiskCapacity()
{
  return MEMORY[0x24BDB7378]();
}

uint64_t CFURLCacheSetMemoryCapacity()
{
  return MEMORY[0x24BDB7380]();
}

uint64_t CFURLRequestSetShouldStartSynchronously()
{
  return MEMORY[0x24BDB73C0]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC940](userNotification);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

uint64_t CPFreeSpaceRequestBytesAtPathWithCompletionBlock()
{
  return MEMORY[0x24BE04688]();
}

uint64_t CPSetPowerAssertionWithIdentifier()
{
  return MEMORY[0x24BE04720]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x24BE04740]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SBGetScreenLockStatus()
{
  return MEMORY[0x24BEB0B80]();
}

uint64_t SBSInterruptKeybagRefetch()
{
  return MEMORY[0x24BEB0C88]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF57A8](target, queue);
}

uint64_t SSAccountGetUniqueIdentifierFromValue()
{
  return MEMORY[0x24BEB20E0]();
}

uint64_t SSAccountScopeForURLBagType()
{
  return MEMORY[0x24BEB20E8]();
}

uint64_t SSCheckInAppPurchaseQueue()
{
  return MEMORY[0x24BEB2178]();
}

uint64_t SSDebugAlwaysSendGUID()
{
  return MEMORY[0x24BEB2180]();
}

uint64_t SSDebugShouldIgnoreExtendedValidation()
{
  return MEMORY[0x24BEB21A0]();
}

uint64_t SSDebugShouldLogOutgoingHeaders()
{
  return MEMORY[0x24BEB21B0]();
}

uint64_t SSDebugShouldLogResponseBodies()
{
  return MEMORY[0x24BEB21B8]();
}

uint64_t SSDebugShouldSendCacheBuster()
{
  return MEMORY[0x24BEB21C0]();
}

uint64_t SSDebugShouldTrackPerformance()
{
  return MEMORY[0x24BEB21C8]();
}

uint64_t SSDebugShouldUseFileBasedPaymentSheetProxy()
{
  return MEMORY[0x24BEB21D0]();
}

uint64_t SSError()
{
  return MEMORY[0x24BEB2480]();
}

uint64_t SSErrorBySettingUserInfoValue()
{
  return MEMORY[0x24BEB2498]();
}

uint64_t SSErrorWithUnderlyingError()
{
  return MEMORY[0x24BEB24B8]();
}

uint64_t SSErrorWithUnderlyingErrorAndInfo()
{
  return MEMORY[0x24BEB24C0]();
}

uint64_t SSFileIsLocalWritable()
{
  return MEMORY[0x24BEB24D0]();
}

uint64_t SSFileLog()
{
  return MEMORY[0x24BEB24D8]();
}

uint64_t SSGenerateLogCorrelationString()
{
  return MEMORY[0x24BEB24E0]();
}

uint64_t SSGetNotEnoughDiskSpaceErrorWithCount()
{
  return MEMORY[0x24BEB24F0]();
}

uint64_t SSGetStringForNetworkType()
{
  return MEMORY[0x24BEB24F8]();
}

uint64_t SSHashIfNeeded()
{
  return MEMORY[0x24BEB25E8]();
}

uint64_t SSIsAppStoreDaemon()
{
  return MEMORY[0x24BEB25F0]();
}

uint64_t SSIsDaemon()
{
  return MEMORY[0x24BEB25F8]();
}

uint64_t SSIsInternalBuild()
{
  return MEMORY[0x24BEB2600]();
}

uint64_t SSIsSeedBuild()
{
  return MEMORY[0x24BEB2608]();
}

uint64_t SSNetworkTypeIsCellularType()
{
  return MEMORY[0x24BEB29A0]();
}

uint64_t SSRestrictionsCopyRankForMediaType()
{
  return MEMORY[0x24BEB2A28]();
}

uint64_t SSVAnisetteAddHeadersToURLRequest()
{
  return MEMORY[0x24BEB2AB8]();
}

uint64_t SSVAnisetteOTPRequest()
{
  return MEMORY[0x24BEB2AC0]();
}

uint64_t SSVAnisetteProvisioningEnd()
{
  return MEMORY[0x24BEB2AC8]();
}

uint64_t SSVAnisetteProvisioningErase()
{
  return MEMORY[0x24BEB2AD0]();
}

uint64_t SSVAnisetteProvisioningSessionDestroy()
{
  return MEMORY[0x24BEB2AD8]();
}

uint64_t SSVAnisetteProvisioningStart()
{
  return MEMORY[0x24BEB2AE0]();
}

uint64_t SSVAnisetteStorageDispose()
{
  return MEMORY[0x24BEB2AE8]();
}

uint64_t SSVAnisetteSynchronize()
{
  return MEMORY[0x24BEB2AF0]();
}

uint64_t SSVFairPlayCopyKeyBagSyncData()
{
  return MEMORY[0x24BEB2B08]();
}

uint64_t SSVFairPlayImportKeybagData()
{
  return MEMORY[0x24BEB2B18]();
}

uint64_t SSVPassKitFramework()
{
  return MEMORY[0x24BEB2B40]();
}

uint64_t SSVSubscriptionBagForDictionary()
{
  return MEMORY[0x24BEB2B70]();
}

uint64_t SSVURLBagShouldSendAMDForURL()
{
  return MEMORY[0x24BEB2BB0]();
}

uint64_t SSVWeakLinkedStringConstantForString()
{
  return MEMORY[0x24BEB2BC0]();
}

uint64_t SSXPCCreateMessageDictionary()
{
  return MEMORY[0x24BEB2BF8]();
}

uint64_t SSXPCCreateNSArrayFromXPCEncodedArray()
{
  return MEMORY[0x24BEB2C00]();
}

uint64_t SSXPCDictionaryCopyCFObjectWithClass()
{
  return MEMORY[0x24BEB2C08]();
}

uint64_t SSXPCDictionaryCopyObjectWithClass()
{
  return MEMORY[0x24BEB2C10]();
}

uint64_t SSXPCDictionarySetCFObject()
{
  return MEMORY[0x24BEB2C18]();
}

uint64_t SSXPCDictionarySetObject()
{
  return MEMORY[0x24BEB2C20]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CFURLCacheLoadMemoryFromDiskNow()
{
  return MEMORY[0x24BDB7578]();
}

uint64_t _CFURLCachePersistMemoryToDiskNow()
{
  return MEMORY[0x24BDB7580]();
}

uint64_t _CFURLCachePurgeMemoryCache()
{
  return MEMORY[0x24BDB7588]();
}

uint64_t _CFURLRequestSetProtocolProperty()
{
  return MEMORY[0x24BDB75B0]();
}

uint64_t _CFURLStorageSessionCopyCache()
{
  return MEMORY[0x24BDB75C8]();
}

uint64_t _CFURLStorageSessionCopyIdentifier()
{
  return MEMORY[0x24BDB75D0]();
}

uint64_t _CFURLStorageSessionCreate()
{
  return MEMORY[0x24BDB75D8]();
}

uint64_t _CTServerConnectionCopyDataStatus()
{
  return MEMORY[0x24BDC2830]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x24BDC2878]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x24BDC2928]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x24BDC2978]();
}

uint64_t _CTServerConnectionUnregisterForNotification()
{
  return MEMORY[0x24BDC2990]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x24BDAE6A0](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

int getpriority(int a1, id_t a2)
{
  return MEMORY[0x24BDAE6E0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAFD00](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x24BDAFD48](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

