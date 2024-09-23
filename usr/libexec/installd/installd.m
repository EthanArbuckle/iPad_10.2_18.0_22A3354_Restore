void sub_100001D70(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DEA0;
  qword_10009DEA0 = (uint64_t)v1;

}

id sub_100002144()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_10009DEB0;
  v7 = qword_10009DEB0;
  if (!qword_10009DEB0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100002ED0;
    v3[3] = &unk_100084CF8;
    v3[4] = &v4;
    sub_100002ED0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000021E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002270(uint64_t a1)
{
  void *v1;
  unsigned __int8 v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = 0;
  v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  v3 = v4;
  if ((v2 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
    MOLogWrite(qword_10009E048, 3, "-[MIUserManagement primaryPersonaUniqueString]_block_invoke", CFSTR("Failed to query primary persona string: %@"));

}

void sub_100002364(uint64_t a1)
{
  void *v1;
  unsigned __int8 v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = 0;
  v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  v3 = v4;
  if ((v2 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
    MOLogWrite(qword_10009E048, 3, "-[MIUserManagement enterprisePersonaUniqueString]_block_invoke", CFSTR("Failed to query enteprise persona string: %@"));

}

void sub_100002458(uint64_t a1)
{
  void *v1;
  unsigned __int8 v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v4 = 0;
  v2 = objc_msgSend(v1, "_onQueue_refreshPersonaInformationWithError:", &v4);
  v3 = v4;
  if ((v2 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
    MOLogWrite(qword_10009E048, 3, "-[MIUserManagement systemPersonaUniqueString]_block_invoke", CFSTR("Failed to query system persona string: %@"));

}

void sub_100002648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000266C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000267C(uint64_t a1)
{

}

void sub_100002684(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "personaAttributesMap"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      v8 = sub_100010E50((uint64_t)"-[MIUserManagement isKnownPersonaUniqueString:error:]_block_invoke", 173, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Client provided persona %@ is not among available personas on the system"), v7, *(_QWORD *)(a1 + 40));
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
}

void sub_100002890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000028B4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  _QWORD *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSSet *v13;
  uint64_t v14;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (_QWORD *)a1[4];
    v6 = (void *)v5[3];
    if (v6)
    {
      v7 = v6;
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personaAttributesMap"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIDs"));
      v11 = *(_QWORD *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    else
    {
      v8 = 0;
      v13 = objc_opt_new(NSSet);
      v14 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }

  }
}

void sub_100002BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100002BDC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_onQueue_refreshPersonaInformationWithError:", &v11);
  objc_storeStrong((id *)(v3 + 40), v11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "personaAttributesMap"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100002CB4;
    v8[3] = &unk_100084CA8;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void sub_100002CB4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v8 = a3;
  if (((unint64_t)objc_msgSend(v8, "personaType") & 0xFFFFFFFFFFFFFFFBLL) == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIDs"));
    if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
        MOLogWrite(qword_10009E048, 7, "-[MIUserManagement personaForBundleID:error:]_block_invoke_2", CFSTR("BundleID %@ is associated with data separated persona %@"));
      *a4 = 1;
    }

  }
}

Class sub_100002ED0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10009DEB8)
  {
    v4 = off_100084D18;
    v5 = 0;
    qword_10009DEB8 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_10009DEB8)
    sub_100051AA8(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100051B24();
  qword_10009DEB0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_1000035A8()
{
  uint64_t path;
  __CFString *v1;
  void *v2;
  NSErrorUserInfoKey v4;
  __CFString *v5;

  path = container_error_get_path();
  if (path)
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFileSystemRepresentation:](NSString, "stringWithFileSystemRepresentation:", path));
  else
    v1 = CFSTR("Failed to read container error path");
  v4 = NSFilePathErrorKey;
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));

  return v2;
}

__CFString *sub_10000379C()
{
  void *v0;
  __CFString *v1;

  v0 = (void *)container_copy_unlocalized_description();
  if (v0)
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v0));
  else
    v1 = CFSTR("<No container description>");
  free(v0);
  return v1;
}

void sub_1000047C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000481C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000482C(uint64_t a1)
{

}

uint64_t sub_100004834(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v13;
  id v14;

  v4 = objc_autoreleasePoolPush();
  v5 = objc_alloc((Class)objc_opt_class(a1[6]));
  v14 = 0;
  v6 = objc_msgSend(v5, "initWithContainer:error:", a2, &v14);
  v7 = v14;
  v8 = v14;
  if (v6)
  {
    v9 = (*(uint64_t (**)(void))(a1[4] + 16))();
  }
  else
  {
    v10 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v11 = sub_10000379C();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
      MOLogWrite(v10, 3, "+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]_block_invoke", CFSTR("Failed to construct MIMCMContainer instance with container %@ : %@"));

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v7);
    v9 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

void sub_100004B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004B74(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

uint64_t sub_100005714(const char *a1)
{
  int v2;
  int v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  int *v12;
  size_t v13;
  int v14;
  uint64_t v15;
  int *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v22;
  int *v23;
  size_t v24;
  ssize_t v25;
  int *v26;
  size_t size;
  void *v28;

  size = 0;
  v28 = 0;
  v2 = open(a1, 256);
  if (v2 < 0)
  {
    v9 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v10 = __error();
      strerror(*v10);
      MOLogWrite(v9, 3, "MIMachOUnhideArchsSavingOriginalHeader", CFSTR("Failed to open \"%s\": %s"));
    }
    v7 = 0;
    goto LABEL_13;
  }
  v3 = v2;
  if (fgetxattr(v2, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0) == -1)
  {
    if (sub_10005173C(v3, &v28, &size))
    {
      v11 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v12 = __error();
        strerror(*v12);
        MOLogWrite(v11, 3, "MIMachOUnhideArchsSavingOriginalHeader", CFSTR("Failed to create new header for unhiding on path \"%s\": %s"));
      }
      v8 = 0;
      v7 = 0;
      goto LABEL_35;
    }
    if (!size)
    {
      v4 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
        goto LABEL_7;
      v5 = CFSTR("Did not need to unhide archs on %s");
      v6 = 7;
      goto LABEL_6;
    }
    v7 = malloc_type_malloc(size, 0x87799A7EuLL);
    *__error() = 0;
    v13 = size;
    if (v13 != pread(v3, v7, size, 0))
    {
      v19 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_34;
      v20 = __error();
      strerror(*v20);
      v17 = CFSTR("Failed to read existing header of length %zu from %s: %s");
      goto LABEL_32;
    }
    close(v3);
    v14 = open(a1, 258);
    if ((v14 & 0x80000000) == 0)
    {
      v3 = v14;
      if (fsetxattr(v14, "com.apple.installd.hidden_archs_fat_header", v7, size, 0, 2))
      {
        v15 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
          goto LABEL_34;
        v16 = __error();
        strerror(*v16);
        v17 = CFSTR("Failed to set xattr named %s of length %zu on %s: %s");
        v18 = v15;
        goto LABEL_33;
      }
      *__error() = 0;
      v24 = size;
      v25 = pwrite(v3, v28, size, 0);
      v19 = qword_10009E048;
      if (v24 == v25)
      {
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
          MOLogWrite(qword_10009E048, 7, "MIMachOUnhideArchsSavingOriginalHeader", CFSTR("Unhid archs on %s"));
        goto LABEL_8;
      }
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      {
LABEL_34:
        v8 = 0;
        goto LABEL_35;
      }
      v26 = __error();
      strerror(*v26);
      v17 = CFSTR("Failed to write new header of length %zu to %s: %s");
LABEL_32:
      v18 = v19;
LABEL_33:
      MOLogWrite(v18, 3, "MIMachOUnhideArchsSavingOriginalHeader", v17);
      goto LABEL_34;
    }
    v22 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v23 = __error();
      strerror(*v23);
      MOLogWrite(v22, 3, "MIMachOUnhideArchsSavingOriginalHeader", CFSTR("Failed to open \"%s\": %s"));
    }
LABEL_13:
    v8 = 0;
    goto LABEL_36;
  }
  v4 = qword_10009E048;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
    goto LABEL_7;
  v5 = CFSTR("Archs have already been unhidden on %s; skipping.");
  v6 = 5;
LABEL_6:
  MOLogWrite(v4, v6, "MIMachOUnhideArchsSavingOriginalHeader", v5);
LABEL_7:
  v7 = 0;
LABEL_8:
  v8 = 1;
LABEL_35:
  close(v3);
LABEL_36:
  if (v28)
    free(v28);
  if (v7)
    free(v7);
  return v8;
}

uint64_t sub_100005AE8(const char *a1, char *a2, _BYTE *a3)
{
  int v5;
  int v6;
  ssize_t v7;
  size_t v8;
  void *v9;
  ssize_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v27;
  int *v28;
  ssize_t v29;
  uint64_t v30;
  int *v31;

  *a3 = 0;
  v5 = open(a1, 256);
  if ((v5 & 0x80000000) == 0)
  {
    v6 = v5;
    v7 = fgetxattr(v5, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0);
    if (v7 < 0)
    {
      if (*__error() == 93)
      {
        v9 = 0;
        goto LABEL_17;
      }
      v24 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v25 = __error();
        strerror(*v25);
        MOLogWrite(v24, 3, "get_ea_value", CFSTR("Failed to get size of EA named %s: %s"));
      }
LABEL_33:
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "MIMachOCreateHiddenArchsExecutableIfNeeded", CFSTR("Failed to get original fat header from executable %s"));
      v9 = 0;
LABEL_37:
      v19 = 0;
LABEL_38:
      v12 = v6;
      goto LABEL_39;
    }
    v8 = v7;
    v9 = malloc_type_malloc(v7, 0x2907A5C4uLL);
    v10 = fgetxattr(v6, "com.apple.installd.hidden_archs_fat_header", v9, v8, 0, 0);
    if (v10 < 0)
    {
      v20 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      {
LABEL_28:
        if (v9)
          free(v9);
        goto LABEL_33;
      }
      v21 = __error();
      strerror(*v21);
      v22 = CFSTR("Failed to read EA named %s: %s");
      v23 = v20;
    }
    else
    {
      if (v8 == v10)
      {
        if (v8)
        {
          v11 = mkstemp(a2);
          if (v11 != -1)
          {
            v12 = v11;
            if (fcopyfile(v6, v11, 0, 0xAu))
            {
              v13 = qword_10009E048;
              if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
                goto LABEL_55;
              v14 = __error();
              strerror(*v14);
              v15 = CFSTR("Failed to copy executable at \"%s\" to temp path \"%s\": %s");
              v16 = v13;
            }
            else
            {
              *__error() = 0;
              v29 = pwrite(v12, v9, v8, 0);
              v30 = qword_10009E048;
              if (v8 == v29)
              {
                if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
                  MOLogWrite(qword_10009E048, 7, "MIMachOCreateHiddenArchsExecutableIfNeeded", CFSTR("Hid arm64 on file at path %s"));
                v19 = 1;
                *a3 = 1;
LABEL_56:
                close(v6);
                if (v12 < 0)
                {
LABEL_40:
                  if (v9)
                    free(v9);
                  return v19;
                }
LABEL_39:
                close(v12);
                goto LABEL_40;
              }
              if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
              {
LABEL_55:
                v19 = 0;
                goto LABEL_56;
              }
              v31 = __error();
              strerror(*v31);
              v15 = CFSTR("Failed to write new fat header of length %zu to %s: %s");
              v16 = v30;
            }
            MOLogWrite(v16, 3, "MIMachOCreateHiddenArchsExecutableIfNeeded", v15);
            goto LABEL_55;
          }
          v27 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v28 = __error();
            strerror(*v28);
            MOLogWrite(v27, 3, "MIMachOCreateHiddenArchsExecutableIfNeeded", CFSTR("mkstemp failed for %s : %s"));
          }
          goto LABEL_37;
        }
LABEL_17:
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
          MOLogWrite(qword_10009E048, 7, "MIMachOCreateHiddenArchsExecutableIfNeeded", CFSTR("Did not find hidden arm64 slice on file at path %s"));
        v19 = 1;
        goto LABEL_38;
      }
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_28;
      v22 = CFSTR("EA named %s changed in size between check and read. Was %zd, is now %zd.");
      v23 = qword_10009E048;
    }
    MOLogWrite(v23, 3, "get_ea_value", v22);
    goto LABEL_28;
  }
  v17 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v18 = __error();
    strerror(*v18);
    MOLogWrite(v17, 3, "MIMachOCreateHiddenArchsExecutableIfNeeded", CFSTR("Failed to open executable at path %s: %s"));
  }
  return 0;
}

uint64_t sub_100005F08(char *a1, const char *a2, const char *a3, const char *a4, const char *a5, const void *a6, const char *a7, const __CFArray *a8, _QWORD *a9, CFErrorRef *a10)
{
  FTS *v18;
  FTS *v19;
  int v20;
  int v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFErrorRef v27;
  CFErrorRef v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CFErrorRef v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  int v44;
  int *v45;
  CFErrorRef v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CFErrorRef v56;
  uint64_t result;
  void *v58;
  uint64_t v59;
  int *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  CFErrorRef v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void **v76;
  size_t v77;
  FTSENT *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  FTSENT *v85;
  unsigned int fts_info;
  char *v88;
  const char *v89;
  int v90;
  const char *v91;
  int v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  size_t v98;
  mode_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  int v105;
  char *v106;
  _BOOL4 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  const char **p_fts_path;
  int st_mode;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  CFErrorRef v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  int *v128;
  ssize_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  std::error_code *v143;
  int v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const __CFString *v159;
  int v160;
  CFErrorRef v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  CFErrorRef v168;
  CFTypeRef v169;
  const char *v170;
  const char *v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  CFErrorRef v178;
  uint64_t v179;
  int *v180;
  const __CFString *v181;
  uint64_t v182;
  uint64_t v183;
  int *v184;
  int *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  CFErrorRef v190;
  int *v191;
  const __CFString *v192;
  int v193;
  int *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char *i;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const __CFString *v205;
  int v206;
  char *v207;
  int *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  int *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  int *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  std::__fs::filesystem::path *fts_path;
  void **v238;
  _QWORD *v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  BOOL v243;
  stat v244;
  int v245;
  __int16 v246;
  char __str[16];
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  char *v279[2];
  unsigned __int8 v280;
  char v281[1039];
  char v282[1024];
  std::__fs::filesystem::path to[42];
  CFTypeRef v284[2];
  __int128 v285;
  __int128 v286;
  __int128 v287;
  char v288;
  uint64_t v289;
  __int16 v290;
  CFTypeRef cf[2];
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;

  bzero(to, 0x400uLL);
  bzero(v282, 0x400uLL);
  bzero(&v280, 0x410uLL);
  v279[0] = a1;
  v279[1] = 0;
  v18 = fts_open_b(v279, 85, &stru_100084DA0);
  if (!v18)
  {
    v33 = __error();
    strerror(*v33);
    v38 = sub_100007560("hardlink_copy_hierarchy", 746, v34, v35, 0, v36, CFSTR("fts_open of %s failed: %s"), v37, (char)a1);
    goto LABEL_24;
  }
  v19 = v18;
  if (!a3)
  {
    bzero(cf, 0x400uLL);
    if ((unint64_t)__strlcpy_chk(cf, a2, 1024, 1024) < 0x400)
    {
      LOWORD(v244.st_dev) = 0;
      *(_QWORD *)__str = 0;
      if ((sub_100007948((const char *)cf, v282, (mode_t *)&v244, (CFErrorRef *)__str) & 1) == 0)
      {
        v38 = sub_100007560("hardlink_copy_hierarchy", 786, v47, v48, *(const void **)__str, v49, CFSTR("Failed to realpath parent of %s"), v50, (char)cf);
        v56 = *(CFErrorRef *)__str;
        if (!*(_QWORD *)__str)
          goto LABEL_23;
        goto LABEL_22;
      }
      if (!LOWORD(v244.st_dev) || (v244.st_dev & 0xF000) == 0x4000)
      {
        v76 = 0;
        v243 = 0;
        goto LABEL_41;
      }
      v46 = sub_100007560("hardlink_copy_hierarchy", 792, v47, v48, 0, v49, CFSTR("Entity exists at %s but it's not a directory"), v50, (char)v282);
      goto LABEL_14;
    }
    v43 = CFSTR("Destination path was too long");
    v44 = 779;
LABEL_13:
    v46 = sub_100007560("hardlink_copy_hierarchy", v44, v39, v40, 0, v41, v43, v42, (char)fts_path);
LABEL_14:
    v38 = v46;
    goto LABEL_23;
  }
  if (!realpath_DARWIN_EXTSN(a2, v282))
  {
    v45 = __error();
    strerror(*v45);
    LOBYTE(fts_path) = (_BYTE)a2;
    v43 = CFSTR("realpath of '%s' failed at element '%s': %s");
    v44 = 752;
    goto LABEL_13;
  }
  memset(&v244, 0, sizeof(v244));
  v20 = open(a3, 256);
  if (v20 < 0)
  {
    v51 = __error();
    strerror(*v51);
    v28 = sub_100007560("open_delta_manifest", 416, v52, v53, 0, v54, CFSTR("Could not open %s: %s"), v55, (char)a3);
LABEL_20:
    v38 = sub_100007560("hardlink_copy_hierarchy", 758, v29, v30, v28, v31, CFSTR("Failed to open manifest %s"), v32, (char)a3);
    if (v28)
    {
      v56 = v28;
LABEL_22:
      CFRelease(v56);
    }
LABEL_23:
    fts_close(v19);
    goto LABEL_24;
  }
  v21 = v20;
  if (fstat(v20, &v244))
  {
    v22 = __error();
    strerror(*v22);
    v27 = sub_100007560("open_delta_manifest", 421, v23, v24, 0, v25, CFSTR("Could not stat %s: %s"), v26, (char)a3);
LABEL_7:
    v28 = v27;
LABEL_8:
    close(v21);
    goto LABEL_20;
  }
  v58 = mmap(0, v244.st_size, 1, 1026, v21, 0);
  if (v58 == (void *)-1)
  {
    v154 = __error();
    strerror(*v154);
    v27 = sub_100007560("open_delta_manifest", 435, v155, v156, 0, v157, CFSTR("Failed to map file at %s; error %s"),
            v158,
            (char)a3);
    goto LABEL_7;
  }
  v242 = v58;
  if (madvise(v58, v244.st_size, 2))
  {
    v59 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v60 = __error();
      LOBYTE(fts_path) = strerror(*v60);
      MOLogWrite(v59, 3, "open_delta_manifest", CFSTR("madvise failed: %s"));
    }
  }
  v61 = malloc_type_calloc(1uLL, 0x18uLL, 0x1010040113C0ABBuLL);
  if (!v61)
  {
    v28 = sub_100007560("open_delta_manifest", 446, v62, v63, 0, v64, CFSTR("Failed to allocate command stream object"), v65, (char)fts_path);
    munmap(v242, v244.st_size);
    goto LABEL_8;
  }
  v66 = v61;
  *v61 = v242;
  v61[1] = v244.st_size;
  v61[2] = 0;
  v322 = 0u;
  v321 = 0u;
  v320 = 0u;
  v319 = 0u;
  v318 = 0u;
  v317 = 0u;
  v316 = 0u;
  v315 = 0u;
  v314 = 0u;
  v313 = 0u;
  v312 = 0u;
  v311 = 0u;
  v310 = 0u;
  v309 = 0u;
  v308 = 0u;
  v307 = 0u;
  v306 = 0u;
  v305 = 0u;
  v304 = 0u;
  v303 = 0u;
  v302 = 0u;
  v301 = 0u;
  v300 = 0u;
  v299 = 0u;
  v298 = 0u;
  v297 = 0u;
  v296 = 0u;
  v295 = 0u;
  v294 = 0u;
  v293 = 0u;
  v292 = 0u;
  *(_OWORD *)cf = 0u;
  v277 = 0u;
  v278 = 0u;
  v275 = 0u;
  v276 = 0u;
  v273 = 0u;
  v274 = 0u;
  v271 = 0u;
  v272 = 0u;
  v269 = 0u;
  v270 = 0u;
  v267 = 0u;
  v268 = 0u;
  v265 = 0u;
  v266 = 0u;
  v263 = 0u;
  v264 = 0u;
  v261 = 0u;
  v262 = 0u;
  v259 = 0u;
  v260 = 0u;
  v257 = 0u;
  v258 = 0u;
  v255 = 0u;
  v256 = 0u;
  v253 = 0u;
  v254 = 0u;
  v251 = 0u;
  v252 = 0u;
  v249 = 0u;
  v250 = 0u;
  *(_OWORD *)__str = 0u;
  v248 = 0u;
  v246 = 0;
  v245 = 0;
  v290 = 0;
  v289 = 0;
  if ((sub_100007C7C(v61, 0, (uint64_t)&v245, 6uLL) & 1) == 0)
  {
    v159 = CFSTR("Failed to read magic");
    v160 = 299;
LABEL_155:
    v71 = sub_100007560("validate_stream", v160, v67, v68, 0, v69, v159, v70, (char)fts_path);
    goto LABEL_156;
  }
  if (v245 ^ 0x44617069 | v246)
  {
    v71 = sub_100007560("validate_stream", 305, v67, v68, 0, v69, CFSTR("Stream had invalid magic: %s"), v70, (char)&v245);
LABEL_156:
    v161 = v71;
LABEL_157:
    v28 = sub_100007560("open_delta_manifest", 456, v72, v73, v161, v74, CFSTR("Invalid manifest file at %s"), v75, (char)a3);
    if (v161)
      CFRelease(v161);
    munmap(v242, v244.st_size);
    free(v66);
    goto LABEL_8;
  }
  if ((sub_100007C7C(v66, 0, (uint64_t)&v289, 0xAuLL) & 1) == 0)
  {
    v159 = CFSTR("Failed to read version from manifest header");
    v160 = 310;
    goto LABEL_155;
  }
  v163 = strtol((const char *)&v289, 0, 10);
  if ((unint64_t)(v163 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v71 = sub_100007560("validate_stream", 318, v164, v165, 0, v166, CFSTR("Manifest had invalid version: %ld; expected 1, 2, or 3"),
            v167,
            v163);
    goto LABEL_156;
  }
  v241 = v163;
  if ((sub_100007C7C(v66, 0, (uint64_t)cf, 0x200uLL) & 1) == 0)
  {
    v159 = CFSTR("Failed to read manifest source version");
    v160 = 323;
    goto LABEL_155;
  }
  v239 = v66;
  if (a4)
    v170 = a5;
  else
    v170 = "";
  if (a4)
    v171 = a4;
  else
    v171 = "0";
  if (a4)
    v172 = " ";
  else
    v172 = "";
  if (v170)
    v173 = v170;
  else
    v173 = "";
  if (snprintf(__str, 0x200uLL, "%s%s%s", v171, v172, v173) > 0x1FF)
  {
    v178 = sub_100007560("validate_stream", 350, v174, v175, 0, v176, CFSTR("Incoming expected source version string \"%s%s%s\" was too long"), v177, (char)v171);
LABEL_228:
    v161 = v178;
LABEL_229:
    v66 = v239;
    goto LABEL_157;
  }
  for (i = __str; *i == 10; ++i)
  {
    *i = 32;
LABEL_224:
    ;
  }
  if (*i)
    goto LABEL_224;
  if (strcmp(__str, (const char *)cf))
  {
    fts_path = (std::__fs::filesystem::path *)cf;
    v205 = CFSTR("Got manifest for version \"%s\", but expected version \"%s\"");
    v206 = 357;
    goto LABEL_227;
  }
  if (v241 < 2)
    goto LABEL_250;
  v288 = 0;
  v287 = 0u;
  v286 = 0u;
  v285 = 0u;
  *(_OWORD *)v284 = 0u;
  if (!sub_100007C7C(v239, 0, (uint64_t)v284, 0x41uLL))
  {
    v205 = CFSTR("Failed to read stream");
    v206 = 375;
LABEL_227:
    v178 = sub_100007560("validate_stream", v206, v201, v202, 0, v203, v205, v204, (char)fts_path);
    goto LABEL_228;
  }
  if (!a6)
  {
    v205 = CFSTR("expected_infoplisthash is NULL");
    v206 = 371;
    goto LABEL_227;
  }
  if (memcmp(a6, v284, 0x41uLL))
  {
    v205 = CFSTR("Compare of info plist hash failed");
    v206 = 367;
    goto LABEL_227;
  }
  if ((unint64_t)v241 >= 3)
  {
    v284[0] = 0;
    if ((sub_100007CF0(v239, a8, (CFErrorRef *)v284) & 1) == 0)
    {
      v161 = sub_100007560("validate_stream", 384, v224, v225, v284[0], v226, CFSTR("Failed to validate supported devices"), v227, (char)fts_path);
      if (v284[0])
        CFRelease(v284[0]);
      goto LABEL_229;
    }
  }
LABEL_250:
  close(v21);
  cf[0] = 0;
  if ((sub_1000076EC(v239, &v280, (CFErrorRef *)cf, v228, v229, v230, v231, v232) & 1) == 0)
  {
    v38 = sub_100007560("hardlink_copy_hierarchy", 765, v233, v234, cf[0], v235, CFSTR("Failed to read first manifest command"), v236, (char)fts_path);
    if (cf[0])
      CFRelease(cf[0]);
    v162 = 0;
    v105 = -1;
    v76 = (void **)v239;
    goto LABEL_236;
  }
  v243 = v280 != 120;
  v76 = (void **)v239;
LABEL_41:
  v77 = strlen(a1);
  v78 = fts_read(v19);
  if (!v78)
  {
    v240 = 0;
LABEL_161:
    if (a3 && v280 != 120)
    {
      v121 = sub_100007560("hardlink_copy_hierarchy", 1110, v79, v80, 0, v82, CFSTR("Got done processing bundle but there were still commands remaining in manifest."), v84, (char)fts_path);
      goto LABEL_234;
    }
    v38 = 0;
    if (a9)
      *a9 = v240 << 9;
    v105 = -1;
    v162 = 1;
    if (!v76)
      goto LABEL_237;
LABEL_236:
    munmap(*v76, (size_t)v76[1]);
    free(v76);
    goto LABEL_237;
  }
  v85 = v78;
  v238 = v76;
  v240 = 0;
  while (1)
  {
    to[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
    fts_info = v85->fts_info;
    if (fts_info > 0xD || ((1 << fts_info) & 0x314A) == 0)
    {
      v91 = 0;
      v92 = 0;
    }
    else
    {
      v88 = &v85->fts_path[v77];
      v90 = *v88;
      v89 = v88 + 1;
      if (v90 == 47)
        v91 = v89;
      else
        v91 = &v85->fts_path[v77];
      if (fts_info != 6 && v243 && !sub_100007454(v281, v91))
      {
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
        {
          LOBYTE(fts_path) = v280;
          MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Command '%c' with path %s matched relpath %s"));
        }
        v92 = 1;
      }
      else
      {
        v92 = 0;
      }
      fts_info = v85->fts_info;
    }
    switch(fts_info)
    {
      case 1u:
        if (v92 && (v280 == 45 || v280 == 43))
        {
          if (fts_set(v19, v85, 4))
          {
            v213 = __error();
            strerror(*v213);
            v121 = sub_100007560("hardlink_copy_hierarchy", 1012, v214, v215, 0, v216, CFSTR("Failed to skip directory %s: %s"), v217, (char)v91);
            goto LABEL_234;
          }
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
          {
            LOBYTE(fts_path) = (_BYTE)v91;
            MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Skipping directory %s"));
          }
LABEL_139:
          cf[0] = 0;
          if ((sub_1000076EC(v76, &v280, (CFErrorRef *)cf, v80, v81, v82, v83, v84) & 1) != 0)
          {
            if (v280 == 120)
            {
              if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
                MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Hit EOF so terminating manifest processing"));
              v243 = 0;
            }
            goto LABEL_145;
          }
          v168 = sub_100007560("hardlink_copy_hierarchy", 1094, v145, v146, cf[0], v147, CFSTR("Failed to read next manifest command"), v148, (char)fts_path);
          goto LABEL_171;
        }
        *(_WORD *)__str = 0;
        cf[0] = 0;
        if ((sub_100007B0C(v282, v91, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
        {
          v168 = sub_100007560("hardlink_copy_hierarchy", 1023, v116, v80, cf[0], v82, CFSTR("Failed to make dest path for directory %s"), v84, (char)v91);
          goto LABEL_171;
        }
        if (*(_WORD *)__str && (*(_WORD *)__str & 0xF000) != 0x4000)
        {
          v121 = sub_100007560("hardlink_copy_hierarchy", 1030, v116, v80, 0, v82, CFSTR("Non-directory entity with mode 0%o exists at directory location in dest path %s"), v84, __str[0]);
          goto LABEL_234;
        }
        if (*(_WORD *)__str)
        {
          if (*(unsigned __int16 *)__str != (v85->fts_statp->st_mode | 0x80)
            && chmod((const char *)to, v85->fts_statp->st_mode | 0x80))
          {
            v223 = __error();
            strerror(*v223);
            v121 = sub_100007560("hardlink_copy_hierarchy", 1043, v117, v118, 0, v119, CFSTR("Failed to make destination directory \"%s\" writable: %s"), v120, (char)to);
LABEL_234:
            v38 = v121;
            goto LABEL_235;
          }
        }
        else
        {
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
          {
            fts_path = to;
            MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Making directory %s"));
          }
          if (mkdir((const char *)to, v85->fts_statp->st_mode | 0x80))
          {
            v218 = __error();
            strerror(*v218);
            v121 = sub_100007560("hardlink_copy_hierarchy", 1038, v219, v220, 0, v221, CFSTR("mkdir of '%s' failed: %s"), v222, (char)to);
            goto LABEL_234;
          }
        }
        goto LABEL_138;
      case 3u:
      case 8u:
        if (v280 == 94)
          v93 = v92;
        else
          v93 = 0;
        if (v93 != 1)
        {
          if (v92 && (v280 == 45 || v280 == 43))
          {
            if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v91;
              MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Skipping link creation for %s"));
            }
          }
          else
          {
            *(_WORD *)__str = 0;
            cf[0] = 0;
            if ((sub_100007B0C(v282, v91, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
            {
              v168 = sub_100007560("hardlink_copy_hierarchy", 975, v122, v123, cf[0], v124, CFSTR("Failed to make dest path for file %s"), v125, (char)v91);
LABEL_171:
              v38 = v168;
              v169 = cf[0];
              if (!cf[0])
                goto LABEL_235;
LABEL_202:
              CFRelease(v169);
              goto LABEL_235;
            }
            if (*(_WORD *)__str)
            {
              v121 = sub_100007560("hardlink_copy_hierarchy", 982, v122, v123, 0, v124, CFSTR("Entity with mode 0%o exists at file location in dest path %s"), v125, __str[0]);
              goto LABEL_234;
            }
            if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
            {
              fts_path = (std::__fs::filesystem::path *)v85->fts_path;
              MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Hardlinking %s to %s"));
            }
            if (link(v85->fts_path, (const char *)to))
            {
              v126 = qword_10009E048;
              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              {
                v127 = v85->fts_path;
                v128 = __error();
                strerror(*v128);
                LOBYTE(fts_path) = (_BYTE)v127;
                v76 = v238;
                MOLogWrite(v126, 3, "hardlink_copy_hierarchy", CFSTR("link of %s to %s failed: %s"));
              }
              if (copyfile(v85->fts_path, (const char *)to, 0, 0xC000Fu))
              {
                v207 = v85->fts_path;
                v208 = __error();
                strerror(*v208);
                v121 = sub_100007560("hardlink_copy_hierarchy", 991, v209, v210, 0, v211, CFSTR("copyfile of %s to %s failed: %s"), v212, (char)v207);
                goto LABEL_234;
              }
            }
          }
          goto LABEL_137;
        }
        LOWORD(v284[0]) = 0;
        bzero(cf, 0x400uLL);
        *(_QWORD *)&v244.st_dev = 0;
        if ((sub_100007B0C(v282, v91, (char *)to, (mode_t *)v284, (CFErrorRef *)&v244) & 1) == 0)
        {
          v38 = sub_100007560("hardlink_copy_hierarchy", 882, v94, v95, *(const void **)&v244.st_dev, v96, CFSTR("Failed to make dest path for file %s"), v97, (char)v91);
          v169 = *(CFTypeRef *)&v244.st_dev;
          if (!*(_QWORD *)&v244.st_dev)
            goto LABEL_235;
          goto LABEL_202;
        }
        v98 = v77;
        v99 = (mode_t)v284[0];
        if (!LOWORD(v284[0]))
        {
          v121 = sub_100007560("hardlink_copy_hierarchy", 889, v94, v95, 0, v96, CFSTR("Entity does not exist at file location in dest path %s"), v97, (char)to);
          goto LABEL_234;
        }
        if (snprintf((char *)cf, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
        {
          v121 = sub_100007560("hardlink_copy_hierarchy", 894, v100, v101, 0, v102, CFSTR("failed to make newfile path: %s.XXXXXXX"), v103, (char)to);
          goto LABEL_234;
        }
        v104 = mkstemp((char *)cf);
        if (v104 == -1)
        {
          v185 = __error();
          strerror(*v185);
          v121 = sub_100007560("hardlink_copy_hierarchy", 899, v186, v187, 0, v188, CFSTR("mktemp failed for %s : %s"), v189, (char)cf);
          goto LABEL_234;
        }
        v105 = v104;
        v106 = v85->fts_path;
        bzero(__str, 0x400uLL);
        if (a7 && !sub_100007454(v106, a7))
        {
          if (snprintf(__str, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
          {
            v38 = sub_100007560("hardlink_copy_hierarchy", 914, v131, v132, 0, v133, CFSTR("failed to make newfile path: %s.XXXXXXX"), v134, (char)to);
            goto LABEL_213;
          }
          LOBYTE(v289) = 0;
          if (!sub_100005AE8(a7, __str, &v289))
          {
            v192 = CFSTR("Failed to create hidden archs executable");
            v193 = 920;
LABEL_208:
            v190 = sub_100007560("hardlink_copy_hierarchy", v193, v135, v136, 0, v137, v192, v138, (char)fts_path);
LABEL_209:
            v38 = v190;
            goto LABEL_212;
          }
          v107 = (_BYTE)v289 != 0;
          if ((_BYTE)v289)
            v106 = __str;
        }
        else
        {
          v107 = 0;
        }
        if (sub_10004E01C(v106, (const char *)to, v105))
        {
          v190 = sub_100007560("hardlink_copy_hierarchy", 934, v139, v140, 0, v141, CFSTR("patch_file failed for:\n\t%s\n\t%s\n\t%s"), v142, (char)v106);
          goto LABEL_209;
        }
        if (fchmod(v105, v99))
        {
          v191 = __error();
          fts_path = (std::__fs::filesystem::path *)cf;
          strerror(*v191);
          v192 = CFSTR("chmod failed for %s : %s");
          v193 = 939;
          goto LABEL_208;
        }
        close(v105);
        rename((const std::__fs::filesystem::path *)cf, to, v143);
        if (v144)
        {
          v194 = __error();
          strerror(*v194);
          v38 = sub_100007560("hardlink_copy_hierarchy", 948, v195, v196, 0, v197, CFSTR("rename of %s to %s failed: %s"), v198, (char)cf);
          v105 = -1;
LABEL_212:
          v76 = v238;
LABEL_213:
          v162 = 0;
          if (v76)
            goto LABEL_236;
          goto LABEL_237;
        }
        if (v107)
          unlink(v106);
        v76 = v238;
        v77 = v98;
LABEL_137:
        v240 += v85->fts_statp->st_blocks;
LABEL_138:
        if (v92)
          goto LABEL_139;
LABEL_145:
        v85 = fts_read(v19);
        if (!v85)
          goto LABEL_161;
        break;
      case 4u:
      case 7u:
      case 0xAu:
        v121 = sub_100007560("hardlink_copy_hierarchy", 1078, v79, v80, 0, v82, CFSTR("FTS in %s returned an error %d for path '%s'"), v84, (char)"hardlink_copy_hierarchy");
        goto LABEL_234;
      case 6u:
        LOWORD(cf[0]) = 0;
        if (!sub_100007B0C(v282, v91, (char *)to, (mode_t *)cf, 0))
          goto LABEL_138;
        if (((uint64_t)cf[0] & 0xF000) == 0x4000 && (st_mode = v85->fts_statp->st_mode, st_mode != LOWORD(cf[0])))
        {
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
          {
            fts_path = to;
            MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Setting final perms of %s to 0%o"));
            LOWORD(st_mode) = v85->fts_statp->st_mode;
          }
          if (chmod((const char *)to, st_mode))
          {
            v149 = __error();
            strerror(*v149);
            v121 = sub_100007560("hardlink_copy_hierarchy", 1060, v150, v151, 0, v152, CFSTR("chmod of '%s' failed: %s"), v153, (char)to);
            goto LABEL_234;
          }
        }
        else if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
        {
          LOBYTE(fts_path) = cf[0];
          MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Skipping post-traversal directory fixup for entity type 0%o at path %s"));
        }
        goto LABEL_138;
      case 0xCu:
      case 0xDu:
        if (v92 && (v280 == 43 || v280 == 45))
          goto LABEL_137;
        LOWORD(v244.st_dev) = 0;
        *(_QWORD *)__str = 0;
        if ((sub_100007B0C(v282, v91, (char *)to, (mode_t *)&v244, (CFErrorRef *)__str) & 1) != 0)
        {
          if (LOWORD(v244.st_dev))
          {
            v121 = sub_100007560("hardlink_copy_hierarchy", 855, v108, v109, 0, v110, CFSTR("Entity with mode 0%o exists at symlink location in dest path %s"), v111, v244.st_dev);
            goto LABEL_234;
          }
          v112 = qword_10009E048;
          if (qword_10009E048)
          {
            p_fts_path = (const char **)&v85->fts_path;
            v113 = v85->fts_path;
            if (*(int *)(qword_10009E048 + 44) <= 6
              || (fts_path = (std::__fs::filesystem::path *)v85->fts_path,
                  MOLogWrite(qword_10009E048, 7, "hardlink_copy_hierarchy", CFSTR("Copying symlink %s to %s")),
                  v112 = qword_10009E048,
                  v113 = *p_fts_path,
                  qword_10009E048))
            {
              if (*(int *)(v112 + 44) >= 7)
              {
                LOBYTE(fts_path) = (_BYTE)v113;
                MOLogWrite(v112, 7, "_copy_symlink", CFSTR("Copying symlink %s to %s"));
              }
            }
          }
          else
          {
            p_fts_path = (const char **)&v85->fts_path;
            v113 = v85->fts_path;
          }
          v129 = readlink(v113, (char *)cf, 0x400uLL);
          if (v129 < 0)
          {
            v179 = qword_10009E048;
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            {
              v180 = __error();
              strerror(*v180);
              v181 = CFSTR("Can't read symlink %s: %s");
              v182 = v179;
              goto LABEL_199;
            }
LABEL_200:
            v121 = sub_100007560("hardlink_copy_hierarchy", 862, v130, v80, 0, v82, CFSTR("Failed to copy symlink %s to %s"), v84, (char)*p_fts_path);
            goto LABEL_234;
          }
          *((_BYTE *)cf + v129) = 0;
          if (symlink((const char *)cf, (const char *)to))
          {
            v183 = qword_10009E048;
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            {
              v184 = __error();
              strerror(*v184);
              v181 = CFSTR("Can't create symlink %s: %s");
              v182 = v183;
LABEL_199:
              MOLogWrite(v182, 3, "_copy_symlink", v181);
            }
            goto LABEL_200;
          }
          goto LABEL_137;
        }
        v38 = sub_100007560("hardlink_copy_hierarchy", 848, v108, v109, *(const void **)__str, v110, CFSTR("Failed to make dest path for symlink %s"), v111, (char)v91);
        v169 = *(CFTypeRef *)__str;
        if (*(_QWORD *)__str)
          goto LABEL_202;
LABEL_235:
        v162 = 0;
        v105 = -1;
        if (v76)
          goto LABEL_236;
LABEL_237:
        fts_close(v19);
        if ((v105 & 0x80000000) == 0)
          close(v105);
        if ((v162 & 1) != 0)
          return 1;
LABEL_24:
        if (a10)
        {
          result = 0;
          *a10 = v38;
        }
        else
        {
          if (v38)
            CFRelease(v38);
          return 0;
        }
        return result;
      default:
        goto LABEL_138;
    }
  }
}

int sub_100007440(id a1, const _ftsent **a2, const _ftsent **a3)
{
  return sub_100007454((*a2)->fts_name, (*a3)->fts_name);
}

uint64_t sub_100007454(char *cStr, const char *a2)
{
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  char __s2[1024];
  char buffer[1024];

  v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  v4 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  bzero(buffer, 0x400uLL);
  bzero(__s2, 0x400uLL);
  if (!CFStringGetFileSystemRepresentation(v3, buffer, 1024)
    || !CFStringGetFileSystemRepresentation(v4, __s2, 1024))
  {
    v5 = 0xFFFFFFFFLL;
    if (!v3)
      goto LABEL_7;
    goto LABEL_6;
  }
  v5 = strcmp(buffer, __s2);
  if (v3)
LABEL_6:
    CFRelease(v3);
LABEL_7:
  if (v4)
    CFRelease(v4);
  return v5;
}

CFErrorRef sub_100007560(const char *a1, int a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  __CFDictionary *Mutable;
  CFStringRef v13;
  CFNumberRef v14;
  CFStringRef v15;
  CFErrorRef v16;
  int valuePtr;

  valuePtr = a2;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFDictionaryAddValue(Mutable, CFSTR("FunctionName"), v13);
  if (v13)
    CFRelease(v13);
  v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("SourceFileLine"), v14);
  if (v14)
    CFRelease(v14);
  if (a5)
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, a5);
  v15 = CFStringCreateWithFormatAndArguments(0, 0, a7, &a9);
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "_CreateAndLogDMError", CFSTR("%@"));
  CFDictionaryAddValue(Mutable, kCFErrorLocalizedDescriptionKey, v15);
  if (v15)
    CFRelease(v15);
  v16 = CFErrorCreate(0, CFSTR("MIInstallerDeltaErrorDomain"), 1, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return v16;
}

uint64_t sub_1000076EC(_QWORD *a1, unsigned __int8 *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v13;
  BOOL v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  int v27;
  CFErrorRef v28;
  uint64_t v29;
  char *v31;
  char __str[8];
  uint64_t v33;
  uint64_t v34;
  char v35;

  v9 = a1[1];
  v8 = a1[2];
  if (v8 >= v9)
    sub_100051B9C();
  if (v8 + 1 >= v9)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      LOBYTE(v31) = 1;
      MOLogWrite(qword_10009E048, 3, "read_bytes", CFSTR("Expected to read %ld bytes but stream didn't have that many"));
    }
    v26 = CFSTR("Failed to read command from manifest");
    v27 = 508;
  }
  else
  {
    v13 = *(unsigned __int8 *)(*a1 + v8);
    *a2 = v13;
    ++a1[2];
    v14 = (v13 - 43) > 0x33 || ((1 << (v13 - 43)) & 0x8000000040005) == 0;
    if (v14 && v13 != 120)
    {
      v28 = sub_100007560("read_next_manifest_command", 514, (uint64_t)a3, a4, 0, a6, CFSTR("Stream had invalid command: %hhu"), a8, v13);
      goto LABEL_26;
    }
    v15 = sub_100007C7C(a1, 1, (uint64_t)(a2 + 1), 0x400uLL);
    v20 = *a2;
    if ((v15 & 1) == 0)
    {
      v28 = sub_100007560("read_next_manifest_command", 520, v16, v17, 0, v18, CFSTR("Failed to read arg1 of command %hhu"), v19, *a2);
      goto LABEL_26;
    }
    if (v20 != 61)
      goto LABEL_12;
    *(_QWORD *)__str = 0;
    v33 = 0;
    v35 = 0;
    v34 = 0;
    if ((sub_100007C7C(a1, 1, (uint64_t)__str, 0x19uLL) & 1) == 0)
    {
      v28 = sub_100007560("read_next_manifest_command", 528, v21, v22, 0, v23, CFSTR("Failed to read arg2 of command %hhu"), v24, *a2);
      goto LABEL_26;
    }
    v25 = strtoll(__str, 0, 10);
    *((_QWORD *)a2 + 129) = v25;
    if (v25)
    {
      v20 = *a2;
LABEL_12:
      if (v20 != 120 || !strncmp((const char *)a2 + 1, "EOF", 3uLL))
        return 1;
      v26 = CFSTR("Got malformed EOF marker");
      v27 = 542;
      goto LABEL_25;
    }
    v31 = __str;
    v26 = CFSTR("Invalid touch time \"%s\" found for path \"%s\"");
    v27 = 535;
  }
LABEL_25:
  v28 = sub_100007560("read_next_manifest_command", v27, (uint64_t)a3, a4, 0, a6, v26, a8, (char)v31);
LABEL_26:
  if (a3)
  {
    v29 = 0;
    *a3 = v28;
  }
  else
  {
    if (v28)
      CFRelease(v28);
    return 0;
  }
  return v29;
}

uint64_t sub_100007948(const char *a1, char *a2, mode_t *a3, CFErrorRef *a4)
{
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  const __CFString *v14;
  int v15;
  CFErrorRef v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  mode_t st_mode;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  stat v31;

  v8 = strlen(a1);
  v13 = v8 - 1;
  if (a1[v8 - 1] == 47)
  {
    a1[v13] = 0;
    v13 = v8 - 2;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
LABEL_6:
    v30 = (char)a1;
    v14 = CFSTR("Failed to find parent of '%s'");
    v15 = 588;
LABEL_7:
    v16 = sub_100007560("realpath_parent_no_symlink", v15, v9, v10, 0, v11, v14, v12, v30);
    goto LABEL_8;
  }
  while (a1[v13] != 47)
  {
    if (&a1[--v13] < a1)
      goto LABEL_6;
  }
  if (v13)
  {
    v18 = (char *)&a1[v13];
    a1[v13] = 0;
    if (!realpath_DARWIN_EXTSN(a1, a2))
    {
      v24 = __error();
      strerror(*v24);
      v16 = sub_100007560("realpath_parent_no_symlink", 599, v25, v26, 0, v27, CFSTR("realpath of '%s' failed at element '%s': %s"), v28, (char)a1);
      *v18 = 47;
      if (a4)
        goto LABEL_9;
      goto LABEL_18;
    }
    *v18 = 47;
    if (strlcat(a2, v18, 0x400uLL) >= 0x400)
    {
      v14 = CFSTR("Path was too long");
      v15 = 608;
      goto LABEL_7;
    }
  }
  else
  {
    strlcpy(a2, a1, 0x400uLL);
  }
  memset(&v31, 0, sizeof(v31));
  if (lstat(a2, &v31))
  {
    st_mode = 0;
LABEL_23:
    *a3 = st_mode;
    return 1;
  }
  st_mode = v31.st_mode;
  if ((v31.st_mode & 0xF000) != 0xA000)
    goto LABEL_23;
  v16 = sub_100007560("realpath_parent_no_symlink", 618, v19, v20, 0, v21, CFSTR("Found symlink at destination path \"%s\"; this is not allowed."),
          v22,
          (char)a2);
LABEL_8:
  if (a4)
  {
LABEL_9:
    v17 = 0;
    *a4 = v16;
    return v17;
  }
LABEL_18:
  if (v16)
    CFRelease(v16);
  return 0;
}

uint64_t sub_100007B0C(const char *a1, const char *a2, char *a3, mode_t *a4, CFErrorRef *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFErrorRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFErrorRef v23;
  uint64_t result;
  CFTypeRef cf;
  char __str[1024];

  bzero(__str, 0x400uLL);
  if (snprintf(__str, 0x400uLL, "%s/%s", a1, a2) < 0x400)
  {
    cf = 0;
    if ((sub_100007948(__str, a3, a4, (CFErrorRef *)&cf) & 1) == 0)
    {
      v23 = sub_100007560("make_and_check_dest_path", 701, v15, v16, cf, v17, CFSTR("Failed to realpath parent of %s"), v18, (char)__str);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      goto LABEL_7;
    }
    if (!sub_100007454(__str, a3))
      return 1;
    v14 = sub_100007560("make_and_check_dest_path", 709, v19, v20, 0, v21, CFSTR("realpath'd destpath '%s' is different from non-realpath '%s'"), v22, (char)a3);
  }
  else
  {
    v14 = sub_100007560("make_and_check_dest_path", 695, v10, v11, 0, v12, CFSTR("Dest path '%s/%s' was too long"), v13, (char)a1);
  }
  v23 = v14;
LABEL_7:
  if (a5)
  {
    result = 0;
    *a5 = v23;
  }
  else
  {
    if (v23)
      CFRelease(v23);
    return 0;
  }
  return result;
}

uint64_t sub_100007C7C(_QWORD *a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  int v6;
  int v7;

  v4 = a1[2];
  if (v4 >= a1[1])
    sub_100051BC4();
  if (!a4)
    return 0;
  v5 = 0;
  while (1)
  {
    v6 = *(unsigned __int8 *)(*a1 + v4);
    a1[2] = v4 + 1;
    v7 = v6 == 9 ? a2 : 0;
    if (v6 == 10 || v7 != 0)
      break;
    *(_BYTE *)(a3 + v5++) = v6;
    v4 = a1[2];
    if (v4 >= a1[1] || v5 >= a4)
      return 0;
  }
  *(_BYTE *)(a3 + v5) = 0;
  return 1;
}

uint64_t sub_100007CF0(_QWORD *a1, const __CFArray *a2, CFErrorRef *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFArray *ArrayBySeparatingStrings;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFArray *v18;
  __CFArray *Mutable;
  __CFArray *v20;
  uint64_t Count;
  uint64_t v22;
  CFIndex i;
  const void *ValueAtIndex;
  CFIndex j;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFErrorRef v31;
  const __CFString *v32;
  int v33;
  CFErrorRef v34;
  uint64_t result;
  CFErrorRef v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  const __CFString *v43;
  CFRange v44;
  CFRange v45;

  v10 = malloc_type_calloc(1uLL, 0x800uLL, 0x30FCD377uLL);
  if (!v10)
  {
    v32 = CFSTR("Failed to malloc buffer for line");
    v33 = 200;
LABEL_23:
    v34 = sub_100007560("validate_supported_devices", v33, v6, v7, 0, v8, v32, v9, v42);
    free(v10);
    goto LABEL_24;
  }
  if ((sub_100007C7C(a1, 0, (uint64_t)v10, 0x800uLL) & 1) == 0)
  {
    v32 = CFSTR("Failed to read supported devices from stream");
    v33 = 205;
    goto LABEL_23;
  }
  if (!*v10)
  {
    if (!a2)
    {
      free(v10);
      return 1;
    }
    v32 = CFSTR("Existing app lists supported devices but there were none in the manifest");
    v33 = 211;
    goto LABEL_23;
  }
  v11 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
  if (!v11)
  {
    v32 = CFSTR("Failed to create patch supported devices string");
    v33 = 222;
    goto LABEL_23;
  }
  v12 = v11;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v11, CFSTR(" "));
  v18 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    v36 = sub_100007560("validate_supported_devices", 228, v14, v15, 0, v16, CFSTR("Failed to split patch supported devices string"), v17, v42);
LABEL_32:
    v34 = v36;
    free(v10);
    v37 = 0;
    Mutable = 0;
    v20 = 0;
    goto LABEL_42;
  }
  if (!a2)
  {
    v36 = sub_100007560("validate_supported_devices", 234, v14, v15, 0, v16, CFSTR("Target app had no supported devices but patch did: %@"), v17, (char)v18);
    goto LABEL_32;
  }
  v43 = v12;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v20 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  Count = CFArrayGetCount(a2);
  v22 = CFArrayGetCount(v18);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v44.location = 0;
      v44.length = v22;
      if (!CFArrayContainsValue(v18, v44, ValueAtIndex))
        CFArrayAppendValue(Mutable, ValueAtIndex);
    }
  }
  if (v22 >= 1)
  {
    for (j = 0; j != v22; ++j)
    {
      v26 = CFArrayGetValueAtIndex(v18, j);
      v45.location = 0;
      v45.length = Count;
      if (!CFArrayContainsValue(a2, v45, v26))
        CFArrayAppendValue(v20, v26);
    }
  }
  if (Mutable && CFArrayGetCount(Mutable))
  {
    v31 = sub_100007560("validate_supported_devices", 242, v27, v28, 0, v29, CFSTR("Expected supported devices had devices that were not in patch: %@"), v30, (char)Mutable);
  }
  else
  {
    if (!v20 || !CFArrayGetCount(v20))
    {
      v34 = 0;
      v37 = 1;
      goto LABEL_41;
    }
    v31 = sub_100007560("validate_supported_devices", 247, v38, v39, 0, v40, CFSTR("Patch listed devices that were not in expected supported devices: %@"), v41, (char)v20);
  }
  v34 = v31;
  v37 = 0;
LABEL_41:
  v12 = v43;
  free(v10);
LABEL_42:
  CFRelease(v12);
  if (v18)
    CFRelease(v18);
  if (v20)
    CFRelease(v20);
  if (Mutable)
    CFRelease(Mutable);
  if ((v37 & 1) != 0)
    return 1;
LABEL_24:
  if (a3)
  {
    result = 0;
    *a3 = v34;
  }
  else
  {
    if (v34)
      CFRelease(v34);
    return 0;
  }
  return result;
}

id sub_100008058()
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10009DEC0);
  WeakRetained = objc_loadWeakRetained(&qword_10009DEC8);
  if (!WeakRetained)
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MobileInstallationHelperServiceProtocol));
    objc_storeWeak(&qword_10009DEC8, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10009DEC0);
  return WeakRetained;
}

id sub_1000080CC()
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10009DED0);
  WeakRetained = objc_loadWeakRetained(&qword_10009DED8);
  if (!WeakRetained)
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MobileInstallerDelegateProtocol));
    objc_storeWeak(&qword_10009DED8, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10009DED0);
  return WeakRetained;
}

id sub_100008140()
{
  id WeakRetained;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_10009DEE0);
  WeakRetained = objc_loadWeakRetained(&qword_10009DEE8);
  if (!WeakRetained)
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MobileInstallerProtocol));
    v1 = ICLKnownBundleRecordClasses();
    v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    v3 = objc_msgSend(v2, "setByAddingObject:", objc_opt_class(NSArray));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

    v5 = objc_opt_class(NSDictionary);
    v6 = objc_opt_class(NSArray);
    v7 = objc_opt_class(NSString);
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(NSNumber), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v9, "checkCapabilities:withOptions:completion:", 0, 0);

    v10 = objc_opt_class(NSArray);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(ICLUninstallRecord), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v12, "uninstallIdentifiers:withOptions:completion:", 0, 1);

    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v4, "installURL:identity:targetingDomain:options:returningResultInfo:completion:", 1, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v4, "fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:", 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v4, "fetchInfoForFrameworkAtURL:options:completion:", 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v4, "cancelUpdateForStagedUUID:completion:", 0, 1);
    objc_msgSend(WeakRetained, "setClasses:forSelector:argumentIndex:ofReply:", v4, "finalizeStagedInstallForUUID:returningResultInfo:completion:", 1, 1);
    objc_storeWeak(&qword_10009DEE8, WeakRetained);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10009DEE0);
  return WeakRetained;
}

void sub_1000083A4(id a1)
{
  MIIPAPatcherFileManager *v1;
  void *v2;

  v1 = objc_alloc_init(MIIPAPatcherFileManager);
  v2 = (void *)qword_10009DEF0;
  qword_10009DEF0 = (uint64_t)v1;

}

void sub_1000092A4(id a1)
{
  void *v1;

  v1 = (void *)qword_10009DF00;
  qword_10009DF00 = (uint64_t)&off_10008ED48;

}

uint64_t sub_10000B4F8()
{
  if (qword_10009DF18 != -1)
    dispatch_once(&qword_10009DF18, &stru_100084E80);
  return dword_10009DF10;
}

void sub_10000B538(id a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentUser"));
  dword_10009DF10 = objc_msgSend(v2, "uid");

  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    MOLogWrite(qword_10009E048, 5, "MIFetchUIDForRegistration_block_invoke", CFSTR("UID for registration: %u"));
}

id sub_10000B5D0()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "allUsers"));

  return v1;
}

id sub_10000B610()
{
  if (qword_10009DF28 != -1)
    dispatch_once(&qword_10009DF28, &stru_100084EA0);
  return (id)qword_10009DF20;
}

void sub_10000B650(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.installd.LaunchServicesRegistrationQueue", v4);
  v3 = (void *)qword_10009DF20;
  qword_10009DF20 = (uint64_t)v2;

}

id sub_10000B6A0(void *a1)
{
  uint64_t (**v1)(_QWORD);
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v1 = a1;
  v2 = 0;
  v3 = 0;
  while (1)
  {
    v4 = v1[2](v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    if (!v5)
      break;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    if (objc_msgSend(v6, "isEqualToString:", NSCocoaErrorDomain) && objc_msgSend(v5, "code") == (id)4097)
    {

      if (v3 >= 5)
        break;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain", v9));
      if (!objc_msgSend(v7, "isEqualToString:", NSCocoaErrorDomain)
        || objc_msgSend(v5, "code") != (id)4099)
      {

        break;
      }

      if (v3 > 4)
        break;
    }
    ++v3;
    v2 = v5;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v9 = v5;
      MOLogWrite(qword_10009E048, 3, "MIRetrySynchronousIPC", CFSTR("Retrying IPC because of error %@"));
    }
    sleep(1u);
  }

  return v5;
}

void sub_10000B800(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = a1;
  v14 = objc_alloc_init((Class)SDRDiagnosticReporter);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", v13, v12, v11, v10, CFSTR("installd"), 0));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000B998;
  v18[3] = &unk_100084EC8;
  v16 = v15;
  v19 = v16;
  v17 = v9;
  v20 = v17;
  if ((objc_msgSend(v14, "snapshotWithSignature:delay:events:payload:actions:reply:", v16, 0, v17, 0, v18, 0.0) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100051BEC((uint64_t)v16);
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "MIReportIssueUsingAutoBugCapture", CFSTR("Failed to report using ABC with signature: %@"));
  }

}

void sub_10000B998(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  char v4;
  unsigned int v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", kSymptomDiagnosticReplySuccess));
  v3 = (void *)v2;
  v8 = (void *)v2;
  if (v2 && (v4 = objc_opt_respondsToSelector(v2, "BOOLValue"), v3 = v8, (v4 & 1) != 0))
  {
    v5 = objc_msgSend(v8, "BOOLValue");
    v6 = qword_10009E048;
    if (v5)
    {
      v3 = v8;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v7 = CFSTR("Successfully reported issue for signature %@ payload %@");
LABEL_10:
        MOLogWrite(v6, 3, "MIReportIssueUsingAutoBugCapture_block_invoke", v7);
        v3 = v8;
      }
    }
    else
    {
      v3 = v8;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v7 = CFSTR("Request to report issue signature %@ payload %@ rejected");
        goto LABEL_10;
      }
    }
  }
  else
  {
    v6 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v7 = CFSTR("Received unexpected response for issue signature %@ payload %@ response %@");
      goto LABEL_10;
    }
  }

}

void sub_10000BD6C(void *a1)
{
  id v1;
  void *v2;
  unsigned __int8 v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  id v7;

  v1 = a1;
  if (objc_msgSend(v1, "isTransient"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
    v7 = 0;
    v3 = objc_msgSend(v1, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v7);
    v4 = v7;
    if ((v3 & 1) != 0)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
        goto LABEL_10;
      v5 = CFSTR("Successfully cleaned up orphaned temp %s container for %@");
      v6 = 7;
    }
    else
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_10;
      v5 = CFSTR("Failed to destroy temp %s container for %@ : %@");
      v6 = 3;
    }
    MOLogWrite(qword_10009E048, v6, "_DestroyContainerIfTemporary", v5);
LABEL_10:

  }
}

void sub_10000DE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DE48(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000DE58(uint64_t a1)
{

}

void sub_10000DE60(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:](MILaunchServicesOperationManager, "registerInstalledInfo:forIdentity:inDomain:error:", v2, v3, 1, &v9));
  v5 = v9;
  v6 = v9;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);

}

void sub_10000E0E4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DF30;
  qword_10009DF30 = (uint64_t)v1;

}

id sub_10000E344()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "dataDirectory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("DiskImageMountPaths.plist"), 0));

  return v2;
}

id sub_10000E3A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_configureMountInfoForPaths:", *(_QWORD *)(a1 + 40));
}

void sub_10000E50C(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v17 = objc_opt_new(NSMutableDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasInternalContent");

  if (v4)
  {
    v16 = a1;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "developerDirectories"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v2, "itemExistsAtURL:", v11))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("Applications"), 1));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_bundleIDMapForAppsInDirectory:", v13));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v14, v15);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    a1 = v16;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMountInfo:", v17);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveMountPaths");

}

void sub_10000EBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EBB8(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

id sub_10000ECD4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveMountPaths");
}

void sub_10000EDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EE04(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveMountPaths");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_10000EF20(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

void sub_10000EF98(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_10000F0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F0F4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingMountPath"));
  if (v2 && objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", v2))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i)))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_15;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

void sub_10000F318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F330(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000F340(uint64_t a1)
{

}

void sub_10000F348(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v3 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_10000F4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F4CC(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F550;
  v5[3] = &unk_100084FB8;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void sub_10000F550(uint64_t a1, uint64_t a2, void *a3, char *a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
  if (v6)
  {
    v11 = v6;
    v7 = objc_msgSend(v6, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v11;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  *a4 = v10;

}

void sub_10000F68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F6A4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F728;
  v5[3] = &unk_100084FB8;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void sub_10000F728(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));

  if (v6)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *a4 = 0;
  }
}

void sub_10000F83C(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mountInfo"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F8BC;
  v3[3] = &unk_100084FE0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void sub_10000F8BC(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allKeys"));
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  *a4 = 0;
}

uint64_t sub_10000FAD0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *v20;
  NSMutableDictionary *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  _QWORD *v35;
  void *v36;
  NSMutableArray *v37;
  void *v38;
  uint64_t v39;
  NSMutableArray *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  NSMutableArray *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  _BYTE v56[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("app")))
  {
    v55 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIExecutableBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v3, &v55));
    v6 = v55;
    v7 = v6;
    if (!v5)
    {
      if (sub_100011000(v6))
        goto LABEL_30;
      v19 = qword_10009E048;
      if (qword_10009E048)
      {
        if (*(int *)(qword_10009E048 + 44) < 3)
          goto LABEL_30;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
      MOLogWrite(v19, 3, "-[MIDiskImageManager _onQueue_scanApps:returnMapInfo:]_block_invoke", CFSTR("Failed to create MIExecutableBundle instance for %@ : %@"));
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryPersonaString"));
    v54 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:](MILaunchServicesDatabaseGatherer, "entryForBundle:inContainer:forPersona:withError:", v5, 0, v10, &v54));
    v12 = v54;

    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8));

      if (!v13)
      {
        v41 = v12;
        v20 = objc_opt_new(NSMutableArray);
        v46 = v8;
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, v8);
        v37 = v20;
        v44 = v11;
        -[NSMutableArray addObject:](v20, "addObject:", v11);
        v21 = objc_opt_new(NSMutableDictionary);
        v42 = v5;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoPlistSubset"));
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v39 = a1;
        v23 = *(id *)(a1 + 40);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v25; i = (char *)i + 1)
            {
              if (*(_QWORD *)v51 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v28));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v29, v28);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
          }
          while (v25);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v3, CFSTR("com.apple.MobileInstallation.bundleURL"));
        v30 = -[NSMutableDictionary copy](v21, "copy");
        objc_msgSend(*(id *)(v39 + 48), "setObject:forKeyedSubscript:", v30, v46);

        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100010000;
        v48[3] = &unk_100085008;
        v40 = v37;
        v49 = v40;
        v31 = objc_retainBlock(v48);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "primaryPersonaString"));
        v47 = v41;
        v38 = v31;
        v35 = v31;
        v5 = v42;
        LOBYTE(v30) = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:](MILaunchServicesDatabaseGatherer, "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:", v42, v33, 0, 0, 0, &v47, v35);
        v7 = v47;

        if ((v30 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
          MOLogWrite(qword_10009E048, 3, "-[MIDiskImageManager _onQueue_scanApps:returnMapInfo:]_block_invoke", CFSTR("Failed to scan app extensions in %@ : %@"));

        v11 = v44;
        v8 = v46;
        goto LABEL_28;
      }
      v14 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        v45 = v8;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleURL"));
        v43 = v11;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleURL"));
        v7 = v12;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
        MOLogWrite(v14, 5, "-[MIDiskImageManager _onQueue_scanApps:returnMapInfo:]_block_invoke", CFSTR("Already have entry for app %@ at %@; keeping it instead of %@"));

        v11 = v43;
        v8 = v45;

LABEL_28:
        goto LABEL_29;
      }
    }
    else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      MOLogWrite(qword_10009E048, 3, "-[MIDiskImageManager _onQueue_scanApps:returnMapInfo:]_block_invoke", CFSTR("Failed to get entry for bundle %@ : %@"));
    }
    v7 = v12;
    goto LABEL_28;
  }
LABEL_31:

  return 1;
}

id sub_100010000(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void sub_1000100EC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001016C;
  v4[3] = &unk_100085058;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

}

void sub_10001016C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const __CFString *v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v14 = v7;
    MOLogWrite(qword_10009E048, 7, "-[MIDiskImageManager _onQueue_registerDiscoveredAppEntries:onMountPoint:completion:]_block_invoke_2", CFSTR("Registering app %@"));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser", v14));
  v10 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "registerInstalledInfo:onMountPoint:forAppBundleID:error:", v8, v10, v7, &v15));
  v12 = v15;

  if (v11)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v13 = CFSTR("LS registered app %@");
LABEL_11:
      MOLogWrite(qword_10009E048, 5, "-[MIDiskImageManager _onQueue_registerDiscoveredAppEntries:onMountPoint:completion:]_block_invoke_2", v13);
    }
  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v13 = CFSTR("LS failed to register app %@ : %@");
    goto LABEL_11;
  }
  *a4 = 0;

}

void sub_100010368(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v3 = *(_QWORD *)(a1 + 32);
  v18 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v3, 0, 1, &v18));
  v5 = v18;

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    if (objc_msgSend(*(id *)(a1 + 40), "_isKnownPath:", v6))
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        MOLogWrite(qword_10009E048, 5, "-[MIDiskImageManager registerContentsAtMountPoint:completion:]_block_invoke", CFSTR("Not registering apps on already registered mount point %@"));
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_setPendingMountPath:", v6);
      v12 = *(void **)(a1 + 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Applications"), 1));
      v17 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_onQueue_scanApps:returnMapInfo:", v13, &v17));
      v15 = v17;

      if (objc_msgSend(v14, "count"))
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v16 = v6;
          MOLogWrite(qword_10009E048, 5, "-[MIDiskImageManager registerContentsAtMountPoint:completion:]_block_invoke", CFSTR("Registering applications at mount point: %@"));
        }
        objc_msgSend(*(id *)(a1 + 40), "_addMountPath:withInfo:", v6, v15, v16);
        objc_msgSend(*(id *)(a1 + 40), "_clearPendingMountPath");
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_registerDiscoveredAppEntries:onMountPoint:completion:", v14, v4, *(_QWORD *)(a1 + 48));
      }
      else
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v16 = v6;
          MOLogWrite(qword_10009E048, 5, "-[MIDiskImageManager registerContentsAtMountPoint:completion:]_block_invoke", CFSTR("Found no apps to register on %@"));
        }
        objc_msgSend(*(id *)(a1 + 40), "_clearPendingMountPath", v16);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
  }
  else
  {
    v7 = (void *)MIInstallerErrorDomain;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path"));
    v10 = sub_100010E50((uint64_t)"-[MIDiskImageManager registerContentsAtMountPoint:completion:]_block_invoke", 409, v7, 25, v5, 0, CFSTR("Failed to realpath image mount %@"), v9, (uint64_t)v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = (id)v11;
  }

}

void sub_100010684(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v3 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v3, 0, 1, &v17));
  v5 = v17;

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    if ((objc_msgSend(*(id *)(a1 + 40), "_isKnownPath:", v6) & 1) != 0)
    {
      v7 = *(void **)(a1 + 40);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Applications"), 1));
      v16 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_onQueue_scanApps:returnMapInfo:", v8, &v16));
      v10 = v16;

      if (objc_msgSend(v9, "count"))
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v15 = v6;
          MOLogWrite(qword_10009E048, 5, "-[MIDiskImageManager reregisterContentsAtMountPoint:]_block_invoke", CFSTR("Re-registering applications at mount point: %@"));
        }
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_registerDiscoveredAppEntries:onMountPoint:completion:", v9, v4, 0, v15);
      }
      else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        MOLogWrite(qword_10009E048, 5, "-[MIDiskImageManager reregisterContentsAtMountPoint:]_block_invoke", CFSTR("Found no apps to register on %@"));
      }

      goto LABEL_19;
    }
    v13 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
    {
LABEL_19:

      goto LABEL_20;
    }
    v12 = CFSTR("Not re-registering apps on unknown mount point %@");
    v14 = 5;
LABEL_14:
    MOLogWrite(v13, v14, "-[MIDiskImageManager reregisterContentsAtMountPoint:]_block_invoke", v12);
    goto LABEL_19;
  }
  v11 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path"));
    v12 = CFSTR("Failed to realpath when re-registering image mount %@ : %@");
    v13 = v11;
    v14 = 3;
    goto LABEL_14;
  }
LABEL_20:

}

void sub_100010958(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v3 = a1[4];
  v17 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v3, 0, 1, &v17));
  v5 = v17;

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    if ((objc_msgSend(a1[5], "_removeMountPath:", v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "lsRegisterQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100010B44;
      v13[3] = &unk_100085080;
      v14 = v4;
      v15 = v6;
      v16 = a1[6];
      MIRunTransactionalTask(v7, "com.apple.installd.unregister-content-diskImage", v13);

    }
    else
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        MOLogWrite(qword_10009E048, 5, "-[MIDiskImageManager unregisterContentsAtMountPoint:completion:]_block_invoke", CFSTR("Ignoring call to unregister apps on mount point not previously registered: %@"));
      (*((void (**)(id))a1[6] + 2))(a1[6]);
    }

  }
  else
  {
    v8 = (void *)MIInstallerErrorDomain;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "path"));
    v11 = sub_100010E50((uint64_t)"-[MIDiskImageManager unregisterContentsAtMountPoint:completion:]_block_invoke", 481, v8, 25, v5, 0, CFSTR("Failed to realpath image mount %@"), v10, (uint64_t)v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);

    (*((void (**)(void))a1[6] + 2))();
    v5 = (id)v12;
  }

}

void sub_100010B44(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser"));
  v3 = a1[4];
  v9 = 0;
  v4 = objc_msgSend(v2, "unregisterAppsAtMountPoint:error:", v3, &v9);
  v5 = v9;

  if ((v4 & 1) == 0)
  {
    v7 = sub_100010E50((uint64_t)"-[MIDiskImageManager unregisterContentsAtMountPoint:completion:]_block_invoke_2", 499, MIInstallerErrorDomain, 4, v5, 0, CFSTR("Unregistering applications failed for mount point %@"), v6, a1[5]);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v5 = (id)v8;
  }
  (*(void (**)(void))(a1[6] + 16))();

}

id sub_100010C9C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
    v19 = (NSMutableDictionary *)objc_msgSend(v17, "mutableCopy");
  else
    v19 = objc_opt_new(NSMutableDictionary);
  v20 = v19;
  if (v18)
  {
    v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v18, a8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v21, NSLocalizedDescriptionKey);

  }
  if (v16)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v16, NSUnderlyingErrorKey);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, MIFunctionNameErrorKey);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v23, MISourceFileLineErrorKey);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, a4, v20));
  return v24;
}

id sub_100010E24(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9;

  v9 = sub_100010C9C(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id sub_100010E50(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v9;

  v9 = sub_100010E7C(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id sub_100010E7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;

  v15 = a5;
  v16 = sub_100010C9C(a1, a2, a3, a4, v15, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

  v20 = qword_10009E048;
  if (v15)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
      objc_msgSend(v15, "code");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));
      MOLogWrite(v20, 3, a1, CFSTR("%d: %@ (%@:%ld %@)"));

    }
  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    MOLogWrite(qword_10009E048, 3, a1, CFSTR("%d: %@"));
  }

  return v17;
}

BOOL sub_100011000(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
  v3 = MIInstallerErrorDomain;
  if (objc_msgSend(v2, "isEqualToString:", MIInstallerErrorDomain) && objc_msgSend(v1, "code") == (id)12)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", v3) && objc_msgSend(v1, "code") == (id)11)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
      if (objc_msgSend(v6, "isEqualToString:", v3))
        v4 = objc_msgSend(v1, "code") == (id)35;
      else
        v4 = 0;

    }
  }

  return v4;
}

__CFString *sub_1000110E8()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;

  v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    v1 = (void *)v0;
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v0));
    free(v1);
  }
  else
  {
    v2 = CFSTR("(container_error_copy_unlocalized_description returned NULL)");
  }
  return v2;
}

id sub_10001113C(void *a1, id a2)
{
  id v3;

  v3 = a1;
  objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3) & 1) != 0)
    a2 = objc_msgSend(v3, "BOOLValue");

  return a2;
}

uint64_t sub_100011190(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v5)) & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

id sub_100011298(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v1, "count")));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v8) & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = objc_msgSend(v2, "copy");
  return v9;
}

uint64_t sub_1000113E0(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000114A4;
  v8[3] = &unk_1000850D0;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_10001148C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000114A4(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass(v8) & 1) == 0 || a1[6] && (objc_opt_isKindOfClass(v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }

}

id sub_10001152C(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v1) & 1) != 0)
      v2 = v1;
    else
      v2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v1));
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id sub_1000115A8(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  id v6;

  v1 = a1;
  if (!v1)
    goto LABEL_11;
  objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    if (sub_100011190(v1))
    {
      v2 = v1;
LABEL_7:
      v3 = v2;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
  {
    v6 = v1;
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    goto LABEL_7;
  }
  objc_opt_class(NSSet);
  if ((objc_opt_isKindOfClass(v1) & 1) == 0)
  {
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "allObjects"));
  if (sub_100011190(v4))
    v3 = v4;
  else
    v3 = 0;

LABEL_12:
  return v3;
}

BOOL sub_1000116CC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || objc_msgSend(v3, "isEqual:", v4));

  return v6;
}

void sub_100011CD0(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;

  v2 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection sendProgressWithDictionary:]_block_invoke", CFSTR("Failed to send progress: %@"));
    v2 = v3;
  }

}

void sub_100011EA4(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v3 = v4;
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection sendDelegateMessagesComplete]_block_invoke", CFSTR("Failed to send delegateMessageDeliveryComplete : %@"));
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);

}

void sub_100011FA0(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v3 = v4;
    MOLogWrite(qword_10009E048, 3, "-[MIClientConnection releaseTerminationAssertion]_block_invoke", CFSTR("Failed to send releaseTerminationAssertion : %@"));
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);

}

uint64_t sub_1000120E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000125CC()
{
  __break(1u);
}

void sub_100012694()
{
  objc_end_catch();
  JUMPOUT(0x100012614);
}

uint64_t sub_1000126A0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32) != 0);
}

uint64_t sub_100012770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 40))
    a3 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3);
}

void sub_1000129C0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1000129F0()
{
  JUMPOUT(0x1000129F8);
}

void sub_100012A90()
{
  objc_end_catch();
  JUMPOUT(0x100012A04);
}

id sub_100012A9C(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "xpcConnection"));
  v7 = v5;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.mobileinstall.allowedSPI")));
    if (v8)
    {
      objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v8) & 1) != 0)
      {
        if ((objc_msgSend(v8, "isEqualToString:", v4) & 1) == 0)
          goto LABEL_10;
      }
      else
      {
        objc_opt_class(NSArray);
        if ((objc_opt_isKindOfClass(v8) & 1) == 0 || (objc_msgSend(v8, "containsObject:", v4) & 1) == 0)
          goto LABEL_10;
      }
      v10 = 0;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v11 = (void *)MIInstallerErrorDomain;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientName"));
    v14 = sub_100010E50((uint64_t)"_ValidateMIAllowedSPIEntitlement", 189, v11, 2, 0, &off_10008F6B8, CFSTR("Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call the MobileInstallation SPI."), v13, (uint64_t)v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v14);

    goto LABEL_11;
  }
  v9 = sub_100010E50((uint64_t)"_ValidateMIAllowedSPIEntitlement", 191, MIInstallerErrorDomain, 2, 0, &off_10008F6E0, CFSTR("XPCConnection object was nil so failing entitlement check"), v6, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_12:

  return v10;
}

void sub_1000135A0()
{
  __break(1u);
}

void sub_1000136DC(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100013654);
  }
  JUMPOUT(0x1000136F0);
}

uint64_t sub_1000136F8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100013708(uint64_t a1)
{

}

void sub_100013710(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *(_QWORD *)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identity"));
  v4 = objc_msgSend(*(id *)(a1 + 40), "domain");
  v10 = 0;
  v5 = objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:](MILaunchServicesOperationManager, "registerInstalledInfo:forIdentity:inDomain:error:", v2, v3, v4, &v10));
  v6 = v10;
  v7 = v10;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6);

}

id sub_100013C00(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((objc_opt_isKindOfClass(v1) & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id sub_100013C48(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "xpcConnection"));
  v2 = v1;
  if (v1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "valueForEntitlement:", CFSTR("com.apple.private.installcoordinationd.daemon")));
    v4 = sub_10001113C(v3, 0);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id sub_100013F44()
{
  if (qword_10009DF48 != -1)
    dispatch_once(&qword_10009DF48, &stru_1000853A0);
  return (id)qword_10009DF40;
}

id sub_100013F84(int a1)
{
  void *v2;
  unsigned int v3;
  intptr_t v4;
  dispatch_queue_global_t global_queue;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v3 = objc_msgSend(v2, "installQOSOverride");

  if (v3)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "_InstallationQueueForRequestType", CFSTR("QOS of installation overridden, running at QOS 0x%02x"));
    v4 = v3;
  }
  else if (a1)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "_InstallationQueueForRequestType", CFSTR("Running installation as QOS_CLASS_USER_INITIATED"));
    v4 = 25;
  }
  else
  {
    v4 = 17;
  }
  global_queue = dispatch_get_global_queue(v4, 0);
  return (id)objc_claimAutoreleasedReturnValue(global_queue);
}

intptr_t sub_100014064(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_doInstallationForURL:identity:domain:options:operationType:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 72));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

uint64_t sub_10001409C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void sub_100014434()
{
  __break(1u);
}

void sub_1000144F4()
{
  objc_end_catch();
  JUMPOUT(0x100014474);
}

uint64_t sub_100014500(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

intptr_t sub_100014814(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stageURL:identity:domain:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

uint64_t sub_100014848(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_100014D2C()
{
  __break(1u);
}

void sub_100014DF0()
{
  objc_end_catch();
  JUMPOUT(0x100014D70);
}

uint64_t sub_100014DFC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32) != 0);
}

void sub_1000150C4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015154;
  v4[3] = &unk_1000851F0;
  v5 = *(id *)(a1 + 56);
  v6 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v2, "_finalizeStagedUpdateForUUID:completion:", v3, v4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

uint64_t sub_100015154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 40))
    a3 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t sub_100015170(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t sub_10001521C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000155C0()
{
  __break(1u);
}

void sub_100015678()
{
  objc_end_catch();
  JUMPOUT(0x1000155F0);
}

uint64_t sub_100015684(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32) != 0);
}

void sub_100015CDC()
{
  __break(1u);
}

void sub_100015D90()
{
  objc_end_catch();
  JUMPOUT(0x100015D0CLL);
}

uint64_t sub_100015D9C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100015EB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000160BC()
{
  __break(1u);
}

void sub_100016178()
{
  objc_end_catch();
  JUMPOUT(0x1000160F0);
}

void sub_100016380()
{
  __break(1u);
}

void sub_100016438()
{
  objc_end_catch();
  JUMPOUT(0x1000163B4);
}

void sub_10001666C()
{
  __break(1u);
}

void sub_100016728()
{
  objc_end_catch();
  JUMPOUT(0x1000166A0);
}

void sub_100016984(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10001699C(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x100016A50);
}

#error "100016A20: call analysis failed (funcsize=37)"

void sub_100016A3C(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1000169B8);
  }
  _Unwind_Resume(a1);
}

void sub_100016FB0(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  v5 = v2;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10001E6FC;
  v39[3] = &unk_100085408;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "xpcConnection"));
  v40 = v6;
  v7 = objc_retainBlock(v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataDirectory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("LastLaunchServicesMap.plist")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  objc_msgSend(v11, "removeItemAtURL:error:", v10, 0);

  v12 = sub_100012A9C(v3, CFSTR("EnumerateInstalledAppsForLaunchServices"));
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    v14 = 0;
  }
  else if (v4
         && ((objc_opt_class(NSDictionary), v15 = v4, (objc_opt_isKindOfClass(v15) & 1) == 0)
           ? (v16 = 0)
           : (v16 = v15),
             v15,
             v16,
             !v16))
  {
    v14 = 0;
    v25 = sub_100010E50((uint64_t)"_DoEnumerationOfInstalledAppsWithOptions", 1326, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Options provided was not a dictionary"), v17, (uint64_t)v30);
    v13 = (id)objc_claimAutoreleasedReturnValue(v25);
  }
  else
  {
    v18 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "clientName"));
      v32 = v4;
      MOLogWrite(v18, 5, "_DoEnumerationOfInstalledAppsWithOptions", CFSTR("Enumerate installed apps requested by %@ with options %@"));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserRequestedAppDBRebuild"), v30, v32));
    v20 = sub_10001113C(v19, 0);

    if (v20)
    {
      v33[0] = 1;
      if ((container_invalidate_code_signing_cache(v33) & 1) == 0
        && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
      {
        v31 = v33[0];
        MOLogWrite(qword_10009E048, 3, "_DoEnumerationOfInstalledAppsWithOptions", CFSTR("Error clearing containermanagerd's cache: %llu"));
      }
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OnlyScanPluginsUnderFrameworks"), v31));
    v22 = sub_10001113C(v21, 0);

    if (v22)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        MOLogWrite(qword_10009E048, 5, "_DoEnumerationOfInstalledAppsWithOptions", CFSTR("Only scanning plugins in frameworks"));
      v23 = 1;
    }
    else
    {
      v23 = 0;
    }
    sub_10004EE54();
    v14 = 1;
    v24 = objc_msgSend(objc_alloc((Class)MILaunchServicesDatabaseGatherer), "initWithOptions:enumerator:", v23, v7);
    v38 = 0;
    objc_msgSend(v24, "performGatherWithError:", &v38);
    v13 = v38;

  }
  if ((v14 & 1) != 0)
    sub_10004EE5C();
  objc_msgSend(v3, "sendDelegateMessagesComplete");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001E7E0;
  v33[3] = &unk_100085430;
  v26 = v3;
  v34 = v26;
  v27 = v4;
  v35 = v27;
  v28 = v5;
  v37 = v28;
  v29 = v13;
  v36 = v29;
  objc_msgSend(v26, "_callBlockAfterDelegateMessagesSend:dispatchBlock:", "com.apple.installd.enumerate-installed-apps-complete", v33);

}

void sub_1000173E8()
{
  __break(1u);
}

void sub_1000174B8()
{
  objc_end_catch();
  JUMPOUT(0x10001742CLL);
}

void sub_100017990()
{
  __break(1u);
}

void sub_100017A58()
{
  objc_end_catch();
  JUMPOUT(0x1000179D4);
}

void sub_100017A64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13));

  if (v6)
  {
    v7 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13, v13));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleURL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      MOLogWrite(v7, 3, "-[MIClientConnection fetchInfoForFrameworkAtURL:options:completion:]_block_invoke", CFSTR("App extension with identifier %@ already found at path %@; ignoring discovered app extension at %@"));

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v13);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void sub_100017F40()
{
  __break(1u);
}

void sub_100018000()
{
  objc_end_catch();
  JUMPOUT(0x100017F70);
}

void sub_100018AB4()
{
  __break(1u);
}

void sub_100018BBC()
{
  objc_end_catch();
  JUMPOUT(0x100018B34);
}

void sub_100018BC8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSUUID *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id obj;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_opt_new(NSUUID);
  v5 = (void *)objc_opt_new(LSOperationRequestContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "legacySinfInfoDictionary"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  LOBYTE(v3) = objc_msgSend(v2, "updateSINFMetadataForApplicationWithIdentifier:operationUUID:requestContext:parsedSINFInfo:saveObserver:error:", v3, v4, v5, v6, 0, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

void sub_1000192FC()
{
  __break(1u);
}

void sub_1000193D4()
{
  objc_end_catch();
  JUMPOUT(0x10001934CLL);
}

void sub_1000193E0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSUUID *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id obj;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_opt_new(NSUUID);
  v5 = (void *)objc_opt_new(LSOperationRequestContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  LOBYTE(v3) = objc_msgSend(v2, "updateiTunesMetadataForApplicationWithIdentifier:operationUUID:requestContext:metadataPlist:saveObserver:error:", v3, v4, v5, v6, 0, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

void sub_1000196E8()
{
  __break(1u);
}

void sub_1000197A4()
{
  objc_end_catch();
  JUMPOUT(0x10001971CLL);
}

void sub_100019B48()
{
  __break(1u);
}

void sub_100019BF8()
{
  objc_end_catch();
  JUMPOUT(0x100019B78);
}

void sub_100019EE8()
{
  __break(1u);
}

void sub_100019F98()
{
  objc_end_catch();
  JUMPOUT(0x100019F18);
}

void sub_10001A1FC()
{
  __break(1u);
}

void sub_10001A2AC()
{
  objc_end_catch();
  JUMPOUT(0x10001A22CLL);
}

void sub_10001A560(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10001A578(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x10001A628);
}

#error "10001A5F4: call analysis failed (funcsize=36)"

void sub_10001A614(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10001A590);
  }
  _Unwind_Resume(a1);
}

void sub_10001AB64()
{
  __break(1u);
}

void sub_10001AC38()
{
  objc_end_catch();
  JUMPOUT(0x10001ABB4);
}

void sub_10001AC44(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSUUID *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id obj;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v3 = a1[4];
  v4 = objc_opt_new(NSUUID);
  v5 = a1[5];
  v6 = a1[8];
  v7 = a1[9];
  v8 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v8 + 40);
  LOBYTE(v3) = objc_msgSend(v2, "updatePlaceholderMetadataForApplicationWithIdentifier:operationUUID:requestContext:installType:failure:saveObserver:error:", v3, v4, v5, v6, v7, 0, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;

}

void sub_10001B1A4()
{
  __break(1u);
}

void sub_10001B270()
{
  objc_end_catch();
  JUMPOUT(0x10001B1ECLL);
}

void sub_10001B5D8()
{
  __break(1u);
}

void sub_10001B694()
{
  objc_end_catch();
  JUMPOUT(0x10001B60CLL);
}

void sub_10001B790()
{
  __break(1u);
}

void sub_10001B848()
{
  objc_end_catch();
  JUMPOUT(0x10001B7C4);
}

void sub_10001BAF0()
{
  __break(1u);
}

void sub_10001BBAC()
{
  objc_end_catch();
  JUMPOUT(0x10001BB24);
}

void sub_10001C1F4()
{
  objc_end_catch();
  JUMPOUT(0x10001C164);
}

void sub_10001C210(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = objc_msgSend(*(id *)(a1 + 56), "domain");
  v11 = 0;
  v6 = objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager registerInstalledInfo:forAppBundleID:personas:inDomain:error:](MILaunchServicesOperationManager, "registerInstalledInfo:forAppBundleID:personas:inDomain:error:", v2, v3, v4, v5, &v11));
  v7 = v11;
  v8 = v11;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v7);

}

void sub_10001C94C()
{
  objc_end_catch();
  JUMPOUT(0x10001C8B8);
}

void sub_10001CE6C()
{
  __break(1u);
}

void sub_10001CF24()
{
  objc_end_catch();
  JUMPOUT(0x10001CE9CLL);
}

void sub_10001D0A0()
{
  __break(1u);
}

void sub_10001D154(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10001DA60()
{
  objc_end_catch();
  JUMPOUT(0x10001D97CLL);
}

void sub_10001DA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DA98(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:]_block_invoke", CFSTR("Failed to scan content: %@"));
  }
  else
  {
    v7 = (void *)objc_opt_new(LSOperationRequestContext);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)));
    objc_msgSend(v7, "setTargetUserID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legacyRecordDictionary"));
    v21 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v20 = 0;
    v12 = objc_msgSend(v9, "registerApplicationForRebuildWithInfoDictionaries:requestContext:registrationError:", v11, v7, &v20);
    v13 = v20;
    v14 = v20;

    v15 = qword_10009E048;
    if ((v12 & 1) != 0)
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
        MOLogWrite(qword_10009E048, 7, "-[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:]_block_invoke", CFSTR("Registered info : %@"));
    }
    else
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
        MOLogWrite(v15, 3, "-[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:]_block_invoke", CFSTR("Failed to register %@ : %@"));

      }
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v18 = *(_QWORD *)(v16 + 40);
      v17 = (id *)(v16 + 40);
      if (!v18)
        objc_storeStrong(v17, v13);
    }

  }
}

void sub_10001DFA0()
{
  __break(1u);
}

void sub_10001E068()
{
  objc_end_catch();
  JUMPOUT(0x10001DFD4);
}

void sub_10001E604()
{
  objc_end_catch();
  JUMPOUT(0x10001E528);
}

void sub_10001E610(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10001E664(id a1)
{
  dispatch_semaphore_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v1 = dispatch_semaphore_create((intptr_t)objc_msgSend(v3, "nSimultaneousInstallations"));
  v2 = (void *)qword_10009DF40;
  qword_10009DF40 = (uint64_t)v1;

}

void sub_10001E6AC(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.mobileinstallation.enumeration", v4);
  v3 = (void *)qword_10009DF58;
  qword_10009DF58 = (uint64_t)v2;

}

void sub_10001E6FC(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &stru_1000853E0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legacyRecordDictionary"));

  objc_msgSend(v8, "enumerateAppDictionary:error:", v7, v5);
}

void sub_10001E784(id a1, NSError *a2)
{
  NSError *v2;
  NSError *v3;

  v2 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v3 = v2;
    MOLogWrite(qword_10009E048, 3, "_DoEnumerationOfInstalledAppsWithOptions_block_invoke_2", CFSTR("Failed to call enumerator callback: %@"));
    v2 = v3;
  }

}

uint64_t sub_10001E7E0(uint64_t a1)
{
  uint64_t v2;
  void *v4;

  v2 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientName"));
    MOLogWrite(v2, 5, "_DoEnumerationOfInstalledAppsWithOptions_block_invoke_3", CFSTR("Enumerate installed apps complete for %@ with options %@"));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_10001EF24(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DF60;
  qword_10009DF60 = (uint64_t)v1;

}

void sub_10001F4D4()
{
  objc_end_catch();
  JUMPOUT(0x10001F4DCLL);
}

void sub_10002123C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021264(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100021274(uint64_t a1)
{

}

uint64_t sub_10002127C(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v5 = a2;
  v6 = v5;
  if (a3 == 4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("app")))
    {
      v37 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIExecutableBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v6, &v37));
      v9 = v37;
      if (!v8)
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          MOLogWrite(qword_10009E048, 3, "-[MIInstaller _bundleInDirectory:withBundleID:error:]_block_invoke", CFSTR("Failed to create bundle for %@ : %@"));
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v9;

        goto LABEL_21;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
      if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32)))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v11 + 40);
        v13 = (id *)(v11 + 40);
        v12 = v14;
        if (v14)
        {
          v36 = (void *)MIInstallerErrorDomain;
          v15 = *(_QWORD *)(a1 + 32);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleURL"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
          v18 = sub_100010E50((uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]_block_invoke", 437, v36, 181, 0, &off_10008F758, CFSTR("Multiple .app bundles with the bundle ID \"%@\" were found within the installable: both \"%@\" and \"%@\" have this bundle ID."), v17, v15);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

LABEL_21:
          v22 = 0;
LABEL_29:

          goto LABEL_30;
        }
        objc_storeStrong(v13, v8);
      }
      else
      {
        v28 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
          v32 = v10;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "path"));
          v31 = v29;
          MOLogWrite(v28, 5, "-[MIInstaller _bundleInDirectory:withBundleID:error:]_block_invoke", CFSTR("Ignoring non-target app bundle %@ with bundle ID %@ while exploring %@"));

        }
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v10, v31, v32, v34);
      }

    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("bundle")))
      {
        v23 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
          goto LABEL_28;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
        v25 = CFSTR("Ignoring unsupported carrier bundle: %@");
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("vpnplugin")))
          goto LABEL_28;
        v23 = qword_10009E048;
        if (qword_10009E048)
        {
          if (*(int *)(qword_10009E048 + 44) < 5)
            goto LABEL_28;
        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
        v25 = CFSTR("Ignoring unsupported VPN bundle: %@");
      }
      MOLogWrite(v23, 5, "-[MIInstaller _bundleInDirectory:withBundleID:error:]_block_invoke", v25);

    }
LABEL_28:
    v22 = 1;
    goto LABEL_29;
  }
  v22 = 1;
LABEL_30:

  return v22;
}

void sub_100022EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022EFC(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v5 = a2;
  v6 = v5;
  if (a3 == 8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension"));
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("mobileprovision"))
      && (v8 = MIInstallProfileAtURL(v6),
          MIIsFatalMISProfileInstallationError(v8, *(unsigned __int8 *)(a1 + 48))))
    {
      v9 = (void *)MIInstallerErrorDomain;
      v22[0] = CFSTR("LegacyErrorString");
      v22[1] = MILibMISErrorNumberKey;
      v23[0] = CFSTR("ApplicationVerificationFailed");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
      v23[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "installURL"));
      v13 = MIErrorStringForMISError(v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = sub_100010E50((uint64_t)"-[MIInstaller _installProvisioningProfilesAtStagingRootWithError:]_block_invoke", 887, v9, 13, 0, v11, CFSTR("Failed to install local provisioning profile at staging root for %@ : 0x%08x (%@)"), v14, (uint64_t)v12);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      v19 = 0;
    }
    else
    {
      v19 = 1;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

void sub_100023E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

id sub_100023E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireCallbackWithStatus:percentComplete:", a2, a3);
}

void sub_100023EA4(_QWORD *a1)
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)a1[4];
  v6 = 0;
  v3 = objc_msgSend(v2, "performLaunchServicesRegistrationWithError:", &v6);
  v4 = v6;
  v5 = v6;
  if ((v3 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v4);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

void sub_100025138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100025178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireCallbackWithStatus:percentComplete:", a2, a3);
}

void sub_100025188(_QWORD *a1)
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)a1[4];
  v6 = 0;
  v3 = objc_msgSend(v2, "performLaunchServicesRegistrationWithError:", &v6);
  v4 = v6;
  v5 = v6;
  if ((v3 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v4);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }

}

void sub_100025398(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.installd", "Signpost");
  v2 = (void *)qword_10009DF70;
  qword_10009DF70 = (uint64_t)v1;

}

uint64_t start()
{
  void *v0;
  uint64_t v1;
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  int st_mode;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  sem_t *v36;
  sem_t *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  unsigned __int8 v42;
  id v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  id v60;
  unsigned __int8 v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  int v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  sem_t *v83;
  int (__cdecl **v84)(int *, BZFILE *, void *, int);
  void *v85;
  unsigned __int8 v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  MobileInstallationServiceDelegate *v91;
  uint64_t v93;
  int *v94;
  id v95;
  id v96;
  const char *v97;
  id v98;
  char *v99;
  void *v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  stat v110;

  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  v0 = objc_autoreleasePoolPush();
  v1 = os_transaction_create("com.apple.installd.startup");
  if (mach_timebase_info((mach_timebase_info_t)&qword_10009E050))
  {
    syslog(3, "Failed to get timebase info\n");
    qword_10009E050 = (uint64_t)&_mh_execute_header;
  }
  signal(15, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v3);
  dispatch_source_set_event_handler(v4, &stru_100085500);
  v101 = v4;
  dispatch_activate(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  memset(&v110, 0, sizeof(v110));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "installdPath"));

  v8 = objc_retainAutorelease(v7);
  v102 = v3;
  if (stat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v110))
  {
    v9 = *__error();
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByDeletingLastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugDescriptionForItemAtURL:", v10));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100051F6C(v8, v9, (uint64_t)v11);

  }
  else
  {
    st_mode = v110.st_mode;
    if ((v110.st_mode & 0xF000) != 0x4000 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100051EDC(v8, st_mode);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v14 = objc_msgSend(v13, "uid");

    if (v14 != v110.st_uid && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100051E50(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v16 = objc_msgSend(v15, "gid");

    if (v16 != v110.st_gid && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100051DC4(v8);
    if ((st_mode & 0xFFF) != 0x1ED && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100051D34(v8);
  }
  v103 = v0;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentUserDataDirectory"));

  if (!v18)
    sub_100051D1C();
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "installdLibraryPath"));
  sub_1000269EC(v5, v20, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "logDirectory"));
  sub_1000269EC(v5, v22, 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dataDirectory"));
  sub_1000269EC(v5, v24, 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "backedUpStateDirectory"));
  sub_1000269EC(v5, v26, 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cachesDirectory"));
  sub_1000269EC(v5, v28, 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "journalStorageBaseURL"));
  sub_1000269EC(v5, v30, 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "launchServicesOperationStorageBaseURL"));
  sub_1000269EC(v5, v32, 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "logDirectory"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", CFSTR("mobile_installation.log"), 0));

  v36 = sem_open("installd.firstboot_check", 0);
  v37 = v36;
  if (v36 != (sem_t *)-1)
  {
    sem_close(v36);
LABEL_31:
    v43 = 0;
    goto LABEL_32;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "roleUserMigrationMarkerFilePath"));
  v40 = objc_msgSend(v5, "itemDoesNotExistAtURL:", v39);

  if (!v40)
    goto LABEL_31;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    MOLogWrite(qword_10009E048, 5, "main", CFSTR("Upgrade to the new home directory structure, but still some old data to move"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
  v109 = 0;
  v42 = objc_msgSend(v41, "migrateMobileContentWithError:", &v109);
  v43 = v109;

  if ((v42 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v95 = v43;
      MOLogWrite(qword_10009E048, 3, "main", CFSTR("Error migrating the library directory for installd: %@"));
    }

    goto LABEL_31;
  }
LABEL_32:
  v100 = (void *)v1;
  qword_10009E048 = MOLogOpen("com.apple.mobile.installd", 5);
  if (!qword_10009E048)
    syslog(3, "Failed to set up rotating logs at path %s", (const char *)objc_msgSend(objc_retainAutorelease(v35), "fileSystemRepresentation"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", v95));
  v45 = objc_msgSend(v44, "allowsInternalSecurityPolicy");

  if (v45)
    v46 = 4;
  else
    v46 = 1;
  v47 = qword_10009E048;
  v48 = objc_retainAutorelease(v35);
  MOLogEnableDiskLogging(v47, objc_msgSend(v48, "fileSystemRepresentation"), v46, 0x40000);
  ICLSetLoggingHandle(qword_10009E048);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
  v108 = v43;
  LOBYTE(v47) = objc_msgSend(v49, "wipeStagingRootAndSetUpPerUserDataDirWithError:", &v108);
  v50 = v108;

  if ((v47 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v96 = v50;
      MOLogWrite(qword_10009E048, 3, "main", CFSTR("Failed to remove staging directory and set up per user data: %@"));
    }

    v50 = 0;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", v96));
  v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stagingRootForSystemContent"));
  sub_1000269EC(v5, (void *)v52, 1);

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  LOBYTE(v52) = objc_msgSend(v53, "isSharediPad");

  if ((v52 & 1) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "currentUserJournalStorageBaseURL"));
    sub_1000269EC(v5, v55, 0);

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "currentUserLaunchServicesOperationStorageBaseURL"));
    sub_1000269EC(v5, v57, 0);

  }
  LOBYTE(v110.st_dev) = 0;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
  v107 = v50;
  v59 = objc_msgSend(v58, "isRunningInTestMode:outError:", &v110, &v107);
  v60 = v107;

  if (v59 && LOBYTE(v110.st_dev))
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "main", CFSTR("In test mode, running erroneous container clean up"));
    sub_100026B04(0);
  }
  if (+[ICLFeatureFlags transientBundleCleanupEnabled](ICLFeatureFlags, "transientBundleCleanupEnabled"))
  {
    v106 = v60;
    v61 = +[MIBundleContainer purgeTransientBundleContainersWithError:](MIBundleContainer, "purgeTransientBundleContainersWithError:", &v106);
    v62 = v106;

    if ((v61 & 1) != 0)
    {
      v60 = v62;
    }
    else
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v97 = (const char *)v62;
        MOLogWrite(qword_10009E048, 3, "main", CFSTR("Failed to clean up all transient bundle containers: %@"));
      }

      v60 = 0;
    }
  }
  if (v37 != (sem_t *)-1)
  {
    v63 = v60;
LABEL_76:
    v84 = &BZ2_bzRead_ptr;
    goto LABEL_77;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    MOLogWrite(qword_10009E048, 5, "main", CFSTR("Reboot detected"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", v97));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastBuildInfoFileURL"));

  v105 = 0;
  v66 = MIIsBuildUpgrade(v65, &v105);
  v67 = v105;
  if (v66)
  {
    v68 = objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", 2));
    if (!v68
      || (v69 = (void *)v68,
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", 3)), v70, v69, !v70))
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "main", CFSTR("Failed to initialize container link manager"));
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "dataDirectory"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "URLByAppendingPathComponent:isDirectory:", CFSTR("DeveloperDiskImageInfo.plist"), 0));
    objc_msgSend(v5, "removeItemAtURL:error:", v73, 0);

    v74 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "dataDirectory"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "URLByAppendingPathComponent:isDirectory:", CFSTR("DiskImagesInfo.plist"), 0));
    objc_msgSend(v5, "removeItemAtURL:error:", v76, 0);

    v77 = (void *)objc_claimAutoreleasedReturnValue(+[MIKeychainAccessGroupTracker sharedTracker](MIKeychainAccessGroupTracker, "sharedTracker"));
    objc_msgSend(v77, "reconcile");

    v78 = objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v78, "dataDirectory"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "URLByAppendingPathComponent:isDirectory:", CFSTR("ArchivedApplications.plist"), 0));
    objc_msgSend(v5, "removeItemAtURL:error:", v80, 0);

    v104 = v60;
    LOBYTE(v78) = +[MIObsoleteUpgradeCleaner cleanUpgradesWithError:](MIObsoleteUpgradeCleaner, "cleanUpgradesWithError:", &v104);
    v63 = v104;

    if ((v78 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
    {
      v98 = v63;
      MOLogWrite(qword_10009E048, 3, "main", CFSTR("Failed to clean up obsolete upgrades: %@"));
    }
    sub_100026B04(v67);
    MIRecordCurrentBuildVersion(v65);
    v0 = v103;
  }
  else
  {
    v63 = v60;
  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](MIUninstalledAppList, "sharedList", v98));
  objc_msgSend(v81, "preflightUninstalledMap");

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[MIDiskImageManager sharedInstance](MIDiskImageManager, "sharedInstance"));
  objc_msgSend(v82, "resetMountPaths");

  v83 = sem_open("installd.firstboot_check", 512, 256, 0);
  if (v83 != (sem_t *)-1)
  {
    sem_close(v83);
    goto LABEL_76;
  }
  v93 = qword_10009E048;
  v84 = &BZ2_bzRead_ptr;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v94 = __error();
    v97 = "installd.firstboot_check";
    v99 = strerror(*v94);
    MOLogWrite(v93, 3, "set_first_boot_work_completed", CFSTR("Failed to create semaphore %s: %s"));
  }
LABEL_77:
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84[94], "sharedInstance", v97, v99));
  v86 = objc_msgSend(v85, "isSharediPad");

  if ((v86 & 1) != 0)
    v87 = 0;
  else
    v87 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForSystemSharedContent](MILaunchServicesOperationManager, "instanceForSystemSharedContent"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser"));
  if (v37 == (sem_t *)-1)
  {
    objc_msgSend(v87, "purge");
    objc_msgSend(v88, "purge");
  }
  else
  {
    objc_msgSend(v87, "reconcile");
    objc_msgSend(v88, "reconcile");
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](MIJournal, "sharedInstance"));
  objc_msgSend(v89, "reconcile");
  v90 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.mobile.installd"));
  v91 = objc_opt_new(MobileInstallationServiceDelegate);
  objc_msgSend(v90, "setDelegate:", v91);
  objc_msgSend(v90, "resume");

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();

  return 0;
}

void sub_1000269AC(id a1)
{
  uint64_t v1;

  v1 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    v1 = MOLogWrite(qword_10009E048, 5, "main_block_invoke", CFSTR("Got SIGTERM; Exiting when clean."));
  xpc_transaction_exit_clean(v1);
}

void sub_1000269EC(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a1;
  v6 = a2;
  v12 = 0;
  v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", v6, a3, 493, 4, &v12);
  v8 = v12;
  v9 = v8;
  if ((v7 & 1) != 0)
    goto LABEL_9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v10, "isEqualToString:", NSPOSIXErrorDomain))
  {
    v11 = objc_msgSend(v9, "code");

    if (v11 == (id)28)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100052030(v6, (uint64_t)v9, v5);
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_1000520D4(v6, (uint64_t)v9, v5);
LABEL_9:

}

void sub_100026B04(void *a1)
{
  id v1;
  NSMutableSet *v2;
  NSMutableArray *v3;
  void *v4;
  unsigned __int8 v5;
  int (__cdecl **v6)(int *, BZFILE *, void *, int);
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *k;
  void *v34;
  void *v35;
  unsigned int v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  unsigned __int8 v41;
  id v42;
  int v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  NSMutableArray *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *m;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  unsigned int v70;
  uint64_t v71;
  id v72;
  void *v73;
  id v74;
  NSMutableSet *v75;
  id obj;
  uint64_t v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSMutableArray *v84;
  uint64_t v85;
  NSMutableSet *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  id v107;
  unsigned __int8 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];

  v1 = a1;
  if ((_os_feature_enabled_impl("containermanagerd", "multipersona_reconciliation_on_delete") & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Container cleanup disabled"));
    goto LABEL_65;
  }
  v86 = objc_opt_new(NSMutableSet);
  v2 = objc_opt_new(NSMutableSet);
  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  v5 = objc_msgSend(v4, "isSharediPad");

  if ((v5 & 1) != 0)
    goto LABEL_64;
  v6 = &BZ2_bzRead_ptr;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v8 = objc_msgSend(v7, "wasErroneousContainerCleanupDone");

  v106 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[MIContainer containersWithClass:error:](MIContainer, "containersWithClass:error:", 1, &v106));
  v10 = v106;
  v84 = v3;
  v73 = (void *)v9;
  if (!v9)
  {
    v44 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_58;
    v68 = (uint64_t)v10;
    v45 = CFSTR("Failed to query bundle containers: %@");
LABEL_57:
    MOLogWrite(v44, 3, "_CleanUpErroneousDataContainers", v45);
LABEL_58:
    obj = 0;
    goto LABEL_59;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v105 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "listAllPersonaAttributesWithError:", &v105));
  v72 = v105;

  if (!v12)
  {
    v44 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
    {
      obj = 0;
      v10 = v72;
      goto LABEL_59;
    }
    v10 = v72;
    v68 = (uint64_t)v72;
    v45 = CFSTR("Failed to retrieve UM persona attributes: %@");
    goto LABEL_57;
  }
  v70 = v8;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v102 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "isDataSeparatedPersona"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userPersonaBundleIDList"));
          -[NSMutableSet addObjectsFromArray:](v2, "addObjectsFromArray:", v18);

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userPersonaUniqueString"));
          -[NSMutableSet addObject:](v86, "addObject:", v19);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v14);
  }

  if (!-[NSMutableSet count](v86, "count"))
  {
    v46 = 1;
    v10 = v72;
    v6 = &BZ2_bzRead_ptr;
    goto LABEL_63;
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v74 = v73;
  v71 = (uint64_t)v1;
  v78 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
  if (!v78)
  {
    v85 = 0;
    v20 = v3;
    goto LABEL_68;
  }
  v85 = 0;
  v77 = *(_QWORD *)v98;
  v20 = v3;
  v75 = v2;
  do
  {
    for (j = 0; j != v78; j = (char *)j + 1)
    {
      if (*(_QWORD *)v98 != v77)
        objc_enumerationMutation(v74);
      v22 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)j);
      v23 = objc_autoreleasePoolPush();
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
      v96 = 0;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainer allContainersForAllPersonasForIdentifier:options:error:](MIContainer, "allContainersForAllPersonasForIdentifier:options:error:", v24, 2, &v96));
      v26 = v96;
      v27 = v26;
      if (v25)
      {
        v79 = v26;
        v82 = v23;
        v83 = j;
        v81 = v24;
        v28 = -[NSMutableSet containsObject:](v2, "containsObject:", v24);
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v80 = v25;
        v29 = v25;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
        if (!v30)
          goto LABEL_41;
        v31 = v30;
        v32 = *(_QWORD *)v93;
        while (1)
        {
          for (k = 0; k != v31; k = (char *)k + 1)
          {
            if (*(_QWORD *)v93 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)k);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "personaUniqueString", v68));
            v36 = -[NSMutableSet containsObject:](v86, "containsObject:", v35);

            if (v28 != v36)
            {
              v37 = v34;
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "containerURL"));
              v108 = 0;
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
              v40 = objc_msgSend(v37, "containerClass");
              v107 = 0;
              v41 = objc_msgSend(v39, "dataContainer:ofContainerType:isEmpty:error:", v38, v40, &v108, &v107);
              v42 = v107;

              if ((v41 & 1) != 0)
              {
                v43 = v108;

                v20 = v84;
                if (!v43)
                  goto LABEL_34;
              }
              else
              {
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
                {
                  v68 = (uint64_t)v37;
                  v69 = v42;
                  MOLogWrite(qword_10009E048, 5, "_IsDataContainerEmpty", CFSTR("Failed to resolve if container %@ has user data; will skip deletion: %@"));
                }

                v20 = v84;
LABEL_34:
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                {
                  v68 = (uint64_t)v37;
                  MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Unexpectedly found erroneous data container with user data: %@"));
                }
                ++v85;
              }
              -[NSMutableArray addObject:](v20, "addObject:", v37, v68, v69);
              continue;
            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
          if (!v31)
          {
LABEL_41:

            v2 = v75;
            v23 = v82;
            j = v83;
            v25 = v80;
            v24 = v81;
            v27 = v79;
            goto LABEL_45;
          }
        }
      }
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v68 = (uint64_t)v24;
        v69 = v26;
        MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Failed to get containers for %@ : %@"));
      }
LABEL_45:

      objc_autoreleasePoolPop(v23);
    }
    v78 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
  }
  while (v78);
LABEL_68:

  if (!-[NSMutableArray count](v20, "count"))
  {
    v10 = v72;
    v6 = &BZ2_bzRead_ptr;
LABEL_90:
    if (v85)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_100052178(v85, v61, v62, v63, v64, v65, v66, v67);
      v1 = (id)v71;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v68 = v85;
        MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Found %lu erroneous containers containing user data"));
      }
      v46 = 1;
    }
    else
    {
      v46 = 1;
      v1 = (id)v71;
    }
    goto LABEL_63;
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v48 = v20;
  v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v89;
    do
    {
      for (m = 0; m != v50; m = (char *)m + 1)
      {
        if (*(_QWORD *)v89 != v51)
          objc_enumerationMutation(v48);
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v68 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)m);
          MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Unexpectedly found erroneous container %@"));
        }
      }
      v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
    }
    while (v50);
  }

  v1 = (id)v71;
  v6 = &BZ2_bzRead_ptr;
  v8 = v70;
  if (v70)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000521FC(v71, v53, v54, v55, v56, v57, v58, v59);
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v68 = v71;
      MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Found unexpected erroneous containers after upgrading from %@"));
    }
  }
  v87 = v72;
  v60 = +[MIContainer removeContainers:waitForDeletion:error:](MIContainer, "removeContainers:waitForDeletion:error:", v48, 0, &v87, v68);
  v10 = v87;

  if ((v60 & 1) != 0)
    goto LABEL_90;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v68 = (uint64_t)v10;
    MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Failed to delete erroneous containers with: %@"));
  }
LABEL_59:
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v68 = v8;
    MOLogWrite(qword_10009E048, 3, "_CleanUpErroneousDataContainers", CFSTR("Failed to clean up erroneous containers. Previous value of container clean up key is %d"));
  }
  v46 = 0;
LABEL_63:
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[90], "sharedInstance", v68));
  objc_msgSend(v47, "setErroneousContainerCleanupDone:", v46);

  v3 = v84;
LABEL_64:

LABEL_65:
}

void sub_100027400(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x18u);
}

void sub_100027460(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_100027470(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_100027524(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DF80;
  qword_10009DF80 = (uint64_t)v1;

}

uint64_t sub_100027BC4(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = v5;
  if (a3 == 8
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension")),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("plist")),
        v7,
        v8))
  {
    v22 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v6, 3, &v22));
    v10 = v22;
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v21 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v11, v9, &v21));
      v13 = v21;

      v14 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      if (v12)
      {
        v15 = v14();
      }
      else
      {
        v14();
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_10005243C(v6);
        v17 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
          MOLogWrite(v17, 3, "-[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:]_block_invoke", CFSTR("Failed to unarchive journal entry data from %@ : %@"));

        }
        v15 = *(_BYTE *)(a1 + 48) != 0;
      }

      v10 = v13;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_1000523B0(v6);
      v16 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
        MOLogWrite(v16, 3, "-[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:]_block_invoke", CFSTR("Failed to read journal entry data from %@ : %@"));

      }
      v15 = *(_BYTE *)(a1 + 48) != 0;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

BOOL sub_100027E94(id a1, MIJournalEntry *a2, NSError *a3)
{
  MIJournalEntry *v4;
  NSError *v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MIJournalEntry *v15;
  id v16;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v15 = v4;
      MOLogWrite(qword_10009E048, 5, "-[MIJournal reconcile]_block_invoke", CFSTR("Restarting journal entry %@"));
    }
    v16 = 0;
    v6 = -[MIJournalEntry finalizeWithError:](v4, "finalizeWithError:", &v16, v15);
    v7 = v16;
    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        sub_1000524C8((uint64_t)v4, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "-[MIJournal reconcile]_block_invoke", CFSTR("Failed to finalize journal entry when reconciling for %@ : %@"));
    }

  }
  return 1;
}

void sub_100028074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002808C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002809C(uint64_t a1)
{

}

uint64_t sub_1000280A4(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v6 ^ 1;
}

void sub_10002822C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028244(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

  return 1;
}

void sub_1000282F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x2Au);
}

uint64_t sub_100028314()
{
  void *v0;
  void *v1;
  uint64_t v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "migrationPlistURL"));
  v2 = MIIsBuildUpgrade(v1, 0) ^ 1;

  return v2;
}

void sub_100029000(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100028F78);
  }
  _Unwind_Resume(a1);
}

void sub_10002901C(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x100029028);
}

void sub_1000293AC(id a1)
{
  MISystemAppMigrationState *v1;
  void *v2;

  v1 = objc_alloc_init(MISystemAppMigrationState);
  v2 = (void *)qword_10009DF98;
  qword_10009DF98 = (uint64_t)v1;

}

void sub_100029450(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = *(_BYTE *)(a1 + 40);
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "-[MISystemAppMigrationState setSystemAppMigrationComplete:]_block_invoke", CFSTR("Updated SystemAppMigration state set to complete."));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "migrationPlistURL"));
    MIRecordCurrentBuildVersion(v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "blockArray"));
    if (v5)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "blockArray", 0));
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i) + 16))();
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

      objc_msgSend(*(id *)(a1 + 32), "setBlockArray:", 0);
    }
  }
}

void sub_100029684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002969C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

void sub_100029748(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "blockArray"));

    if (v3
      || (v4 = objc_alloc_init((Class)NSMutableArray),
          objc_msgSend(*(id *)(a1 + 32), "setBlockArray:", v4),
          v4,
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "blockArray")),
          v5,
          v5))
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "blockArray"));
      v7 = objc_retainBlock(*(id *)(a1 + 40));
      objc_msgSend(v11, "addObject:", v7);

    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = sub_100010E50((uint64_t)"-[MISystemAppMigrationState waitForSystemAppMigrationToComplete:]_block_invoke", 118, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to create an array"), v6, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue(v9);
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v11);
    }

  }
}

void sub_10002993C(id a1, NSString *a2, NSDictionary *a3, BOOL *a4)
{
  NSString *v6;
  NSDictionary *v7;
  NSString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unsigned int v35;
  unsigned __int8 v36;
  id v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;

  v6 = a2;
  v7 = a3;
  *a4 = 0;
  v8 = v6;
  v47 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v8, 0, 0, &v47));
  v10 = v47;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", kCFBundleVersionKey));
    objc_opt_class(NSString);
    v13 = v12;
    if ((objc_opt_isKindOfClass(v13) & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    if (!v14)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "_CheckApp", CFSTR("Installed app with bundle ID %@ doesn't have a CFBundleVersion defined or its value is not a string"));
      goto LABEL_48;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundle"));

    if (!v17)
    {
      v23 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerURL"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
        MOLogWrite(v23, 3, "_CheckApp", CFSTR("Failed to locate bundle in container %@"));

      }
      goto LABEL_48;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "infoPlistSubset"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", kCFBundleVersionKey));
    objc_opt_class(NSString);
    v21 = v20;
    if ((objc_opt_isKindOfClass(v21) & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    v25 = qword_10009E048;
    if (v22)
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerURL"));
        v43 = v22;
        v45 = v14;
        v38 = v8;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "path"));
        MOLogWrite(v25, 7, "_CheckApp", CFSTR("Found upgraded app for %@: container at %@ has version %@, built in has version %@"));

      }
      v27 = objc_msgSend(v22, "compare:options:", v14, 64, v38, v41, v43, v45);
      if (v27 == (id)-1)
        goto LABEL_35;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      v30 = objc_msgSend(v29, "allowsInternalSecurityPolicy");
      if (!v28 && (v30 & 1) == 0)
      {

        goto LABEL_35;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
      v35 = objc_msgSend(v34, "allowsInternalSecurityPolicy");

      if (v35)
      {
LABEL_35:
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v42 = v22;
          v44 = v14;
          v40 = v8;
          MOLogWrite(qword_10009E048, 5, "_CheckApp", CFSTR("Container for %@ had version %@ while bundled version was %@; removing containerized version."));
        }
        v46 = v11;
        v36 = objc_msgSend(v9, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v46, v40, v42, v44);
        v37 = v46;

        if ((v36 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
          MOLogWrite(qword_10009E048, 3, "_CheckApp", CFSTR("Failed to destroy bundle container %@ for %@ : %@"));
        v11 = v37;
        goto LABEL_47;
      }
      v32 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 5)
      {
LABEL_47:

LABEL_48:
        goto LABEL_49;
      }
      v31 = CFSTR("Preserving containerized version of %@ because it has a higher version than what's built in");
      v33 = 5;
    }
    else
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_47;
      v31 = CFSTR("App installed in container %@ for bundle ID %@ doesn't have a CFBundleVersion or its value is not a string");
      v32 = qword_10009E048;
      v33 = 3;
    }
    MOLogWrite(v32, v33, "_CheckApp", v31);
    goto LABEL_47;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  if (objc_msgSend(v15, "isEqualToString:", MIContainerManagerErrorDomain))
  {
    v16 = objc_msgSend(v11, "code");

    if (v16 == (id)21)
      goto LABEL_49;
  }
  else
  {

  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "_CheckApp", CFSTR("Failed to locate container for bundle ID %@: %@"));
LABEL_49:

}

id sub_10002A8EC()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "dataDirectory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("LinkedParentBundles.plist"), 0));

  return v2;
}

id sub_10002A950(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_migratePlaygroundsBundleMetadata");
}

void sub_10002A9CC(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)objc_opt_class(*(_QWORD *)(a1 + 32))), "initWithDomain:", 2);
  v2 = (void *)qword_10009DFA8;
  qword_10009DFA8 = (uint64_t)v1;

}

void sub_10002AA70(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)objc_opt_class(*(_QWORD *)(a1 + 32))), "initWithDomain:", 3);
  v2 = (void *)qword_10009DFB8;
  qword_10009DFB8 = (uint64_t)v1;

}

void sub_10002B964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B988(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002B998(uint64_t a1)
{

}

void sub_10002B9A0(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  obj = 0;
  v5 = objc_msgSend(v2, "_onQueue_isValidLinkForParent:toChild:error:", v3, v4, &obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v5;
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v6);
}

void sub_10002BB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002BB90(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  obj = 0;
  v5 = objc_msgSend(v2, "_onQueue_updateLinkForParent:toChild:operationType:error:", v3, v4, 0, &obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v5;
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v6);
}

void sub_10002BD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002BD84(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  obj = 0;
  v5 = objc_msgSend(v2, "_onQueue_updateLinkForParent:toChild:operationType:error:", v3, v4, 1, &obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v5;
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v6);
}

void sub_10002C32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002C350(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v10 = 0;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_onQueue_childrenForParentBundleID:error:", v3, &v10));
  v5 = v10;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

void sub_10002C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002C6BC(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  id v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  obj = 0;
  v4 = objc_msgSend(v2, "_onQueue_removeParent:error:", v3, &obj);
  v5 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);
}

void sub_10002C790(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void _MILogTransactionStep(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14;
  id v15;
  id v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  id v21;
  const char *v22;
  NSString *v23;
  void *v24;
  uint64_t v25;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  switch(a2)
  {
    case 1:
      v18 = "Start";
      if (!v16)
        goto LABEL_15;
      break;
    case 2:
      if (!v16)
      {
        v19 = "Fail";
        if ((_DWORD)a3)
          v19 = "Success";
        if ((unint64_t)(a1 - 1) > 0xD)
          v20 = "Unknown";
        else
          v20 = off_100085688[a1 - 1];
        v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s (%s) : %s"), v19, "End", v20, 0);
        goto LABEL_21;
      }
      break;
    case 3:
      v18 = "Start (Asynch)";
      if (!v16)
        goto LABEL_15;
      break;
    default:
      v18 = "Unknown Phase";
      if (!v16)
      {
LABEL_15:
        if ((unint64_t)(a1 - 1) > 0xD)
          v22 = "Unknown";
        else
          v22 = off_100085688[a1 - 1];
        v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s : %s"), v18, v22, v25, 0);
LABEL_21:
        v21 = (id)objc_claimAutoreleasedReturnValue(v23);
        goto LABEL_22;
      }
      break;
  }
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v16, &a9);
LABEL_22:
  v24 = v21;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:persona:description:](AITransactionLog, "logStep:byParty:phase:success:forBundleID:persona:description:", a1, 7, a2, a3, v14, v15, v21);

}

__CFString *sub_10002DDD4(unint64_t a1)
{
  if (a1 >= 9)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown phase: %lu"), a1));
  else
    return off_1000856F8[a1];
}

void sub_100032844(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  v2 = qword_10009E048;
  v3 = v1;
  if (!v1)
  {
LABEL_5:
    if (!v2)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    MOLogWrite(qword_10009E048, 3, "_FlagErrorAndPostAppDeletionNotification", CFSTR("Failed to destroy containers with error %@"));
    v2 = qword_10009E048;
    goto LABEL_5;
  }
LABEL_6:
  if (*(int *)(v2 + 44) >= 7)
    MOLogWrite(v2, 7, "_FlagErrorAndPostAppDeletionNotification", CFSTR("Posting the notification %@"));
LABEL_8:
  notify_post("com.apple.mobile.application_deletion_complete");

}

void sub_100034120(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000342D8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000342E8(uint64_t a1)
{

}

void sub_1000342F0(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  uint64_t v31;
  unsigned __int8 v32;
  void *v33;
  uint64_t v34;
  unsigned __int8 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id obj;
  void *v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];

  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v51;
    v42 = kMIUninstallParallelPlaceholderKey;
    v43 = *(_QWORD *)v51;
    do
    {
      v5 = 0;
      v44 = v3;
      do
      {
        if (*(_QWORD *)v51 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier", v40, v41));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7));
        v9 = v8;
        if (v8)
        {
          v10 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
          {
            v40 = v7;
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
            MOLogWrite(v10, 5, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke", CFSTR("Re-registering built-in app %@ (%@)"));

          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser", v40, v41));
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v49 = *(id *)(v12 + 40);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "registerInstalledInfoForBuiltInAppAtURL:error:", v9, &v49));
          objc_storeStrong((id *)(v12 + 40), v49);

          if (!v13)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
              v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = 136315650;
              v55 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
              v56 = 2112;
              v57 = v36;
              v58 = 2112;
              v59 = v37;
              _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to re-register built-in app at %@ : %@", buf, 0x20u);

            }
            v14 = qword_10009E048;
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            {
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
              v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              MOLogWrite(v14, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke", CFSTR("Failed to re-register built-in app at %@ : %@"));

            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
          }
          goto LABEL_55;
        }
        if (!objc_msgSend(v6, "doesNotHaveBundleContainer"))
        {
          if (objc_msgSend(v6, "hasParallelPlaceholder"))
          {
            v16 = v7;
            v17 = &__kCFBooleanTrue;
            goto LABEL_24;
          }
          v18 = objc_msgSend(v6, "isPlaceholder");
          v16 = v7;
          if (v18)
          {
            v17 = &__kCFBooleanTrue;
            v19 = &__kCFBooleanFalse;
          }
          else
          {
            v17 = &__kCFBooleanFalse;
LABEL_24:
            v19 = &__kCFBooleanTrue;
          }
          v15 = objc_claimAutoreleasedReturnValue(+[LSPrecondition registrationStatePreconditionForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:](LSPrecondition, "registrationStatePreconditionForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:", v16, v17, v19));
          goto LABEL_26;
        }
        v15 = objc_claimAutoreleasedReturnValue(+[LSPrecondition emptyPrecondition](LSPrecondition, "emptyPrecondition"));
LABEL_26:
        v46 = (void *)v15;
        if ((objc_msgSend(v6, "isLinked") & 1) != 0)
        {
          v20 = 0;
          v21 = 3;
        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "options"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("UninstallPlaceholdersOnly")));
          v24 = objc_msgSend(v23, "isEqual:", &__kCFBooleanTrue);

          if ((v24 & 1) != 0)
          {
            v20 = 1;
            v21 = 1;
          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "options"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v42));
            v20 = objc_msgSend(v26, "isEqual:", &__kCFBooleanTrue);

            if (v20)
              v21 = 4;
            else
              v21 = 3;
          }
        }
        v27 = sub_10000B4F8();
        if (+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled"))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
          v29 = objc_msgSend(v28, "isSharediPad");

          if ((v29 & 1) == 0)
          {
            if (v27)
            {
              if (objc_msgSend(v6, "isLastReference"))
              {
                if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v7))
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForSystemSharedContent](MILaunchServicesOperationManager, "instanceForSystemSharedContent"));
                  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                  v48 = *(id *)(v31 + 40);
                  v32 = objc_msgSend(v30, "unregisterAppForBundleID:inDomain:operationType:precondition:error:", v7, 1, v21, v46, &v48);
                  objc_storeStrong((id *)(v31 + 40), v48);

                  if ((v32 & 1) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                    {
                      v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
                      *(_DWORD *)buf = 136315650;
                      v55 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
                      v56 = 2112;
                      v57 = v7;
                      v58 = 2112;
                      v59 = v39;
                      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to unregister record for %@ in system domain: %@", buf, 0x20u);
                    }
                    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                    {
                      v40 = v7;
                      v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
                      MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke", CFSTR("Failed to unregister record for %@ in system domain: %@"));
                    }
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
                  }
                }
              }
            }
          }
        }
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
          && (v20 | objc_msgSend(v6, "isLastReference")) == 1)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser"));
          v34 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v47 = *(id *)(v34 + 40);
          v35 = objc_msgSend(v33, "unregisterAppForBundleID:inDomain:operationType:precondition:error:", v7, 1, v21, v46, &v47);
          objc_storeStrong((id *)(v34 + 40), v47);

          if ((v35 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              v38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = 136315650;
              v55 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
              v56 = 2112;
              v57 = v7;
              v58 = 2112;
              v59 = v38;
              _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to unregister record for %@ in user domain: %@", buf, 0x20u);
            }
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            {
              v40 = v7;
              v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke", CFSTR("Failed to unregister record for %@ in user domain: %@"));
            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
          }
        }

        v4 = v43;
        v3 = v44;
LABEL_55:

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v3);
  }

}

uint64_t sub_100034A4C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2112;
  return result;
}

void sub_100034A64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x20u);
}

void sub_100034AE4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DFC8;
  qword_10009DFC8 = (uint64_t)v1;

}

void sub_100034B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100034D88(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100034DC8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateObject");

}

void sub_100034DF4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateObject");

}

void sub_100035094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000350AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000350BC(uint64_t a1)
{

}

void sub_1000350C4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient migrateMobileContentWithError:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_10003512C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_100035248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100035260(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient wipeStagingRootAndSetUpPerUserDataDirWithError:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1000352C8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_10003549C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000354CC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient stageItemAtURL:options:containedSymlink:error:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100035534(_QWORD *a1, void *a2, char a3, void *a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a4);
  if (!v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  }

}

void sub_100035704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003571C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:withError:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100035784(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1000358F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100035910(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:withError:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100035978(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_100035B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_100035B28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient dataContainer:ofContainerType:isEmpty:error:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100035B90(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void sub_100035D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100035D64(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:withError:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100035DCC(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void sub_100035FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100036008(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIHelperServiceClient moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:withError:]_block_invoke", CFSTR("Failed to setup remote proxy"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100036070(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (!v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void sub_100036160(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DFD0;
  qword_10009DFD0 = (uint64_t)v1;

}

id sub_1000362C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRefs:", 0);
}

void sub_100036418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036430(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100036440(uint64_t a1)
{

}

uint64_t sub_100036448(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v19;

  v5 = a2;
  v6 = v5;
  if (a3 == 4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("app"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
      v19 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:error:", v6, &v19));
      v11 = v19;

      if (v10)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "refs"));
        objc_msgSend(v12, "addObject:", v10);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
        if ((objc_msgSend(v14, "isEqualToString:", NSPOSIXErrorDomain) & 1) != 0)
        {
          v15 = objc_msgSend(v11, "code");

          if (v15 == (id)93)
            goto LABEL_12;
        }
        else
        {

        }
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = v11;
        v12 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v17;
      }

LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
  }
  v13 = 1;
LABEL_13:

  return v13;
}

void sub_100036710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100036728(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(v3, "_onQueue_addAppIdentifierIfCachedOnContainer:error:", a2, &v8);
  v5 = v8;
  v6 = v8;
  if ((v4 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);

  return v4;
}

void sub_100036C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100036C40(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "_onQueue_addReferenceForApplicationIdentifier:bundle:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

void sub_100037078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10003709C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_onQueue_removeReferenceForBundle:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

void sub_100037EBC(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DFE0;
  qword_10009DFE0 = (uint64_t)v1;

}

BOOL sub_10003824C()
{
  __darwin_time_t tv_sec;
  _BOOL8 result;
  stat v2;

  memset(&v2, 0, sizeof(v2));
  result = 0;
  if (!lstat("/var/mobile/Library/ApplicationSync", &v2))
  {
    tv_sec = v2.st_mtimespec.tv_sec;
    if (tv_sec > time(0) - 31536000)
      return 1;
  }
  return result;
}

void sub_10003838C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000383A4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000383B4(uint64_t a1)
{

}

void sub_1000383BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_uninstalledList"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100038490(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_uninstalledList"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_setUninstalledList:", v3);
}

void sub_100038598(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onQueue_uninstalledList"));
  objc_msgSend(v2, "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_setUninstalledList:", v2);

}

void sub_1000388BC(void *a1)
{
  id v1;
  unsigned __int8 v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v1 = a1;
  v14 = 0;
  if (!objc_msgSend(v1, "isTransient"))
  {
    v5 = 0;
    goto LABEL_19;
  }
  v13 = 0;
  v2 = objc_msgSend(v1, "isStagedUpdateContainer:withError:", &v14, &v13);
  v3 = v13;
  v4 = v3;
  if ((v2 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v10 = v1;
      v11 = v3;
      MOLogWrite(qword_10009E048, 3, "_DestroyContainerIfTemporary", CFSTR("Failed to query staged container status %@ : %@"));
    }
    v14 = 0;
LABEL_10:
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier", v10, v11));
    v12 = v4;
    v7 = objc_msgSend(v1, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v12);
    v5 = v12;

    if ((v7 & 1) != 0)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
        goto LABEL_18;
      v8 = CFSTR("Successfully cleaned up orphaned temp %s container for %@");
      v9 = 7;
    }
    else
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_18;
      v8 = CFSTR("Failed to destroy temp %s container for %@ : %@");
      v9 = 3;
    }
    MOLogWrite(qword_10009E048, v9, "_DestroyContainerIfTemporary", v8);
LABEL_18:

    goto LABEL_19;
  }
  if (!v14)
    goto LABEL_10;
  v5 = v3;
LABEL_19:

}

void sub_10003DC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;

  _Block_object_dispose(&a64, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003DCE4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003DCF4(uint64_t a1)
{

}

uint64_t sub_10003DCFC(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v3 = objc_retainAutorelease(a2);
  v19[4] = &v21;
  v20 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003DEA8;
  v19[3] = &unk_1000858C8;
  v4 = MIMachOFileIterateImageVersions(objc_msgSend(v3, "fileSystemRepresentation"), &v20, v19);
  v5 = v20;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = v5;
    v10 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
    goto LABEL_5;
  }
  if (!*((_BYTE *)v22 + 24))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v9, "length")));

    v12 = sub_100010E50((uint64_t)"-[MIInstallableBundle _performBrowserAppValidationForEntitlements:error:]_block_invoke", 1689, MIInstallerErrorDomain, 202, 0, 0, CFSTR("\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app."), v11, (uint64_t)v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

LABEL_5:
  }
  _Block_object_dispose(&v21, 8);

  return 1;
}

void sub_10003DE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003DEA8(uint64_t a1, int a2, int a3)
{
  BOOL v4;
  uint64_t result;

  v4 = a2 == 16777228 && (a3 & 0xFFFFFF) == 2;
  result = !v4;
  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

const __CFString *sub_10003E4EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  const __CFString *v24;
  const __CFString *v25;

  v3 = a2;
  v4 = v3;
  if (a1 != 1)
  {
    if (a1 == 2)
    {
      v5 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_17;
      v6 = CFSTR("Answer source was forced");
    }
    else
    {
      v5 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_17;
      v6 = CFSTR("Unknown os_eligibility_answer_source_t value %llu.");
    }
LABEL_16:
    MOLogWrite(v5, 3, "_IneligibilityReasonStringForSourceAndStatus", v6);
LABEL_17:
    v10 = 0;
    v7 = 0;
    goto LABEL_18;
  }
  if (!v3)
  {
    v5 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_17;
    v6 = CFSTR("NULL os_eligibility status object");
    goto LABEL_16;
  }
  v7 = (void *)_CFXPCCreateCFObjectFromXPCObject(v3);
  if (v7)
  {
    objc_opt_class(NSDictionary);
    v8 = v7;
    v9 = (objc_opt_isKindOfClass(v8) & 1) != 0 ? v8 : 0;

    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_CLASS")));
      objc_opt_class(NSNumber);
      v13 = v12;
      if ((objc_opt_isKindOfClass(v13) & 1) != 0)
        v14 = v13;
      else
        v14 = 0;

      v15 = objc_msgSend(v14, "unsignedLongLongValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION")));
      objc_opt_class(NSNumber);
      v17 = v16;
      if ((objc_opt_isKindOfClass(v17) & 1) != 0)
        v18 = v17;
      else
        v18 = 0;

      v19 = objc_msgSend(v18, "unsignedLongLongValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_BILLING")));
      objc_opt_class(NSNumber);
      v21 = v20;
      if ((objc_opt_isKindOfClass(v21) & 1) != 0)
        v22 = v21;
      else
        v22 = 0;

      v23 = objc_msgSend(v22, "unsignedLongLongValue");
      if (v15 == (id)3)
      {
        if (v19 != (id)3 && v23 != (id)3)
        {
          v24 = CFSTR("This device is not eligible based on the country or region it is located in and the country or region of the Apple ID signed in.");
          v25 = CFSTR("This device is not eligible based on the country or region it is located in and without an Apple ID signed in.");
LABEL_38:
          if (v23 == (id)7)
            v10 = v25;
          else
            v10 = v24;
          goto LABEL_42;
        }
        if (v19 == (id)3)
        {
          if (v23 == (id)3)
          {
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              MOLogWrite(qword_10009E048, 3, "_IneligibilityReasonStringForSourceAndStatus", CFSTR("Unknown ineligibility reason for source %llu status %@"));
            v10 = 0;
            goto LABEL_42;
          }
          v24 = CFSTR("This device is not eligible based on the country or region of the Apple ID signed in.");
          v25 = CFSTR("This device is not eligible without an Apple ID signed in.");
          goto LABEL_38;
        }
        v10 = CFSTR("This device is not eligible based on the country or region it is located in.");
      }
      else
      {
        v10 = CFSTR("This device type is not eligible.");
      }
LABEL_42:
      v7 = v8;
      goto LABEL_18;
    }
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "_IneligibilityReasonStringForSourceAndStatus", CFSTR("os_eligibility status was nil or not a dictionary; found: %@"));
  v10 = 0;
LABEL_18:

  return v10;
}

uint64_t sub_10003EAC4(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((sub_100046574(v1) & 1) != 0)
  {
    v2 = 1;
  }
  else if (sub_100046584(v1))
  {
    v2 = (uint64_t)sub_1000465DC(v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t sub_100040F7C(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  unsigned int v8;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v5 = a1;
  v6 = a2;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleTypeDescription"));
  v8 = objc_msgSend(v5, "bundleType");
  if (v8 - 1 < 5 || v8 == 9)
  {

    v7 = CFSTR("app");
  }
  if (sub_1000470A4(v6))
  {
    v10 = (void *)MIInstallerErrorDomain;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
    v13 = sub_100010E50((uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements", 1882, v10, 205, 0, 0, CFSTR("The %@ at \"%@\" has the entitlement \"%@\", which is only allowed on app extensions targeting the extension point \"%@\"."), v12, (uint64_t)v7);
  }
  else if (sub_100047094(v6))
  {
    v14 = (void *)MIInstallerErrorDomain;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
    v13 = sub_100010E50((uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements", 1887, v14, 205, 0, 0, CFSTR("The %@ at \"%@\" has the entitlement \"%@\", which is only allowed on app extensions targeting the extension point \"%@\"."), v15, (uint64_t)v7);
  }
  else
  {
    if (!sub_100047084(v6))
    {
      v18 = 0;
      v19 = 1;
      goto LABEL_17;
    }
    v16 = (void *)MIInstallerErrorDomain;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
    v13 = sub_100010E50((uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements", 1892, v16, 205, 0, 0, CFSTR("The %@ at \"%@\" has the entitlement \"%@\", which is only allowed on app extensions targeting the extension point \"%@\"."), v17, (uint64_t)v7);
  }
  v18 = (id)objc_claimAutoreleasedReturnValue(v13);

  if (a3)
  {
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a3 = v18;
  }
  else
  {
    v19 = 0;
  }
LABEL_17:

  return v19;
}

uint64_t sub_10004115C(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleTypeDescription"));
  if (sub_100047064(v6))
  {
    v8 = (void *)MIInstallerErrorDomain;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
    v11 = sub_100010E50((uint64_t)"_ValidateBundleDoesNotHaveBrowserAppEntitlements", 1912, v8, 204, 0, 0, CFSTR("The %@ at \"%@\" has the %@\" entitlement, which is only allowed on the browser app itself."), v10, (uint64_t)v7);
  }
  else
  {
    if (!sub_100047074(v6))
    {
      v14 = 0;
      v15 = 1;
      goto LABEL_9;
    }
    v12 = (void *)MIInstallerErrorDomain;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "relativePath"));
    v11 = sub_100010E50((uint64_t)"_ValidateBundleDoesNotHaveBrowserAppEntitlements", 1918, v12, 213, 0, 0, CFSTR("The %@ at \"%@\" has the %@\" entitlement, which is only allowed on the app itself."), v13, (uint64_t)v7);
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(v11);

  if (a3)
  {
    v14 = objc_retainAutorelease(v14);
    v15 = 0;
    *a3 = v14;
  }
  else
  {
    v15 = 0;
  }
LABEL_9:

  return v15;
}

void sub_100045288(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009DFF0;
  qword_10009DFF0 = (uint64_t)v1;

}

void sub_100045520()
{
  objc_end_catch();
  JUMPOUT(0x100045498);
}

void sub_100045924()
{
  objc_end_catch();
  JUMPOUT(0x10004589CLL);
}

void sub_100045EF8(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100045E70);
  }
  _Unwind_Resume(a1);
}

void sub_100045F14(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x100045F20);
}

id sub_100046350(void *a1, void *a2, id a3)
{
  id v5;
  void *v6;

  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", v5));
    if (v6)
    {
      objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v6) & 1) != 0)
      {
        a3 = objc_msgSend(v6, "BOOLValue");
      }
      else if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
      {
        MOLogWrite(qword_10009E048, 7, "MIGetBooleanEntitlement", CFSTR("Found non-BOOLean value for BOOLean entitlement %@: %@ ; assuming %s."));
      }
    }
    else
    {
      a3 = 0;
    }

  }
  else
  {
    a3 = 0;
  }

  return a3;
}

uint64_t sub_100046440(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((sub_100046350(v5, *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

id sub_100046564(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.private.mobileinstall.upgrade-enabled"), 0);
}

id sub_100046574(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.private.security.container-required"), (id)1);
}

id sub_100046584(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.private.security.no-container"), 0);
}

id sub_100046594(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.private.security.no-sandbox"), 0);
}

BOOL sub_1000465A4(void *a1)
{
  void *v1;
  _BOOL8 v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("seatbelt-profiles")));
  v2 = v1 != 0;

  return v2;
}

id sub_1000465DC(void *a1)
{
  return sub_100046350(a1, CFSTR("platform-application"), 0);
}

id sub_1000465EC(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.security.system-container"), 0);
}

id sub_1000465FC(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.private.mobileinstall.xpc-services-enabled"), 0);
}

id sub_10004660C(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.private.security.system-application"), 0);
}

id sub_10004661C(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.private.webkit.pushbundle"), 0);
}

id sub_10004662C(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.marketplace.app-installation"), 0);
}

id sub_10004663C(void *a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaceholderEntitlements.plist"), 0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v1));

  return v2;
}

id sub_10004668C(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlaceholderEntitlements.plist"), 0));
  v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id sub_100046704(void *a1)
{
  return sub_100046710(a1, CFSTR("com.apple.security.application-groups"));
}

id sub_100046710(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", v3));
  if (!v4)
    goto LABEL_15;
  objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v4);
  objc_opt_class(NSString);
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      v12 = v4;
      v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      if (v6)
        goto LABEL_7;
LABEL_16:
      v8 = 0;
      goto LABEL_17;
    }
    v9 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
    {
LABEL_15:
      v6 = 0;
      goto LABEL_16;
    }
    v10 = CFSTR("Entitlement %@ does not contain supported types; ignoring.");
LABEL_14:
    MOLogWrite(v9, 3, "_MICommonCopyGroupEntitlement", v10);
    goto LABEL_15;
  }
  if ((sub_100011190(v4) & 1) == 0)
  {
    v9 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_15;
    v10 = CFSTR("Entitlement %@ contains non-string values; ignoring.");
    goto LABEL_14;
  }
  v6 = v4;
LABEL_7:
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

LABEL_17:
  return v8;
}

BOOL sub_1000468B0(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = sub_100046710(a1, CFSTR("com.apple.security.application-groups"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2 != 0;

  return v3;
}

id sub_1000468E8(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v1 = a1;
  v2 = sub_100046710(v1, CFSTR("com.apple.security.system-groups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "count"))
  {
    v5 = sub_100046710(v1, CFSTR("com.apple.security.system-group-containers"));
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v4 = (void *)v6;
  }

  return v4;
}

BOOL sub_10004695C(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = sub_1000468E8(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2 != 0;

  return v3;
}

id sub_10004698C(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.on-demand-install-capable"), 0);
}

id sub_10004699C(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.parent-application-identifiers")));
  objc_opt_class(NSArray);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(NSString), sub_100011190(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id sub_100046A44(void *a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("application-identifier")));
  objc_opt_class(NSString);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id sub_100046AB0(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("previous-application-identifiers")));
  objc_opt_class(NSString);
  v2 = sub_1000115A8(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

id sub_100046B04(void *a1)
{
  return sub_100046350(a1, CFSTR("beta-reports-active"), 0);
}

id sub_100046B14(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("keychain-access-groups")));
  objc_opt_class(NSArray);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(NSString), sub_100011190(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id sub_100046BBC(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.swift-playgrounds-app"), 0);
}

id sub_100046BCC(void *a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.app-management-domain")));
  objc_opt_class(NSString);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t sub_100046C38(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "hasPrefix:", CFSTR("swift-playgrounds")) & 1) != 0)
    {
      v3 = 2;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.WebKit.PushBundles")))
    {
      v3 = 3;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

uint64_t sub_100046CA4(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = sub_100046BCC(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = sub_100046C38(v2);

  return v3;
}

id sub_100046CD8(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.networking.networkextension")));
  objc_opt_class(NSArray);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(NSString), sub_100011190(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id sub_100046D80(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.associated-appclip-app-identifiers")));
  objc_opt_class(NSArray);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3 && (objc_opt_class(NSString), sub_100011190(v3)))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id sub_100046E28(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.driverkit"), 0);
}

id sub_100046E38(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection")));
  objc_opt_class(NSString);
  v3 = v2;
  if ((objc_opt_isKindOfClass(v3) & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("data-protection-class")));
    objc_opt_class(NSString);
    v6 = v5;
    v4 = (objc_opt_isKindOfClass(v6) & 1) != 0 ? v6 : 0;

    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("DataProtectionClass")));
      objc_opt_class(NSString);
      v8 = v7;
      if ((objc_opt_isKindOfClass(v8) & 1) != 0)
        v4 = v8;
      else
        v4 = 0;

    }
  }

  return v4;
}

id sub_100046F68(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.default-data-protection-if-available")));
  objc_opt_class(NSString);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  if (v3)
  {
    v4 = v2;
  }
  else
  {
    objc_opt_class(NSArray);
    v5 = v2;
    if ((objc_opt_isKindOfClass(v5) & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (v6)
    {
      v7 = v5;
      objc_opt_class(NSString);
      v8 = sub_100011298(v7);
      v4 = (id)objc_claimAutoreleasedReturnValue(v8);

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

id sub_100047064(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.web-browser-engine.host"), 0);
}

id sub_100047074(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.embedded-web-browser-engine"), 0);
}

id sub_100047084(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.web-browser-engine.rendering"), 0);
}

id sub_100047094(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.web-browser-engine.networking"), 0);
}

id sub_1000470A4(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.web-browser-engine.webcontent"), 0);
}

id sub_1000470B4(void *a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.memory.transfer-accept")));
  objc_opt_class(NSString);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id sub_100047120(void *a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("com.apple.developer.memory.transfer-send")));
  objc_opt_class(NSString);
  v2 = v1;
  if ((objc_opt_isKindOfClass(v2) & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id sub_10004718C(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.web-browser"), 0);
}

id sub_10004719C(void *a1)
{
  return sub_100046350(a1, CFSTR("com.apple.developer.browser.app-installation"), 0);
}

void sub_10004893C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100048978(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100048988(uint64_t a1)
{

}

uint64_t sub_100048990(uint64_t a1, void *a2, int a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  id v18;

  v6 = a2;
  if (a3 == 4)
  {
    v7 = objc_alloc((Class)NSUUID);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v9 = objc_msgSend(v7, "initWithUUIDString:", v8);

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      v18 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modificationDateForURL:error:", v6, &v18));
      v12 = v18;
      if (v11)
      {
        if (objc_msgSend(v11, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) == (id)1)
        {
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
            objc_msgSend(*(id *)(a1 + 40), "addObject:");
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11);
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
        }
      }
      else
      {
        v14 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
          MOLogWrite(v14, 3, "+[MILaunchServicesOperationManager _mostRecentInstanceDirURLWithinURL:]_block_invoke", CFSTR("Failed to get mod date from %@ : %@"));

        }
      }

    }
    else
    {
      v13 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
        MOLogWrite(v13, 5, "+[MILaunchServicesOperationManager _mostRecentInstanceDirURLWithinURL:]_block_invoke", CFSTR("Found non-UUID named directory in LS operation journal dir: %@"));

      }
    }

  }
  return 1;
}

void sub_1000491CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000491F4(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 8)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return a3 != 8;
}

uint64_t sub_1000498B8(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  id v16;

  v5 = a2;
  v6 = v5;
  if (a3 == 8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("plist"));

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
      v16 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_operationFromURL:error:", v6, &v16));
      v11 = v16;
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_100053144(v6);
        v13 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
          MOLogWrite(v13, 3, "+[MILaunchServicesOperationManager _discoverOrderedJournalEntriesInInstanceDir:]_block_invoke", CFSTR("Failed to unarchive operation data from %@ : %@"));

        }
      }

      goto LABEL_14;
    }
    v12 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
      MOLogWrite(v12, 3, "+[MILaunchServicesOperationManager _discoverOrderedJournalEntriesInInstanceDir:]_block_invoke", CFSTR("Found non-plist item in operations journal directory: %@"));
LABEL_14:

    }
  }

  return 1;
}

int64_t sub_100049A3C(id a1, MILaunchServicesOperation *a2, MILaunchServicesOperation *a3)
{
  MILaunchServicesOperation *v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = -[MILaunchServicesOperation serialNumber](a2, "serialNumber");
  v6 = -[MILaunchServicesOperation serialNumber](v4, "serialNumber");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

void sub_10004B028(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id sub_10004B064(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_lsApplicationWorkspaceInstance"));
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "registerContainerizedApplicationWithInfoDictionaries:operationUUID:requestContext:saveObserver:registrationError:", v5, v3, v4, v6, &v13));
  v8 = v13;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  v11 = 0;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    v11 = v8;

  return v11;
}

void sub_10004B2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10004B2F8(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = a1[11];
  v13 = 0;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:", v3, v4, v5, v7, v6, &v13));
  v9 = v13;
  v10 = v13;
  v11 = *(_QWORD *)(a1[9] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

  if (!*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40))
    objc_storeStrong((id *)(*(_QWORD *)(a1[10] + 8) + 40), v9);

}

void sub_10004BCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004BCD8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_lsApplicationWorkspaceInstance"));
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v8 = objc_msgSend(v2, "setPersonaUniqueStrings:forApplicationWithBundleIdentifier:operationUUID:requestContext:saveObserver:error:", v6, v3, v4, v5, v7, &v12);
  v9 = v12;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;

  v10 = 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    v10 = v9;

  return v10;
}

void sub_10004BEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10004BF1C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = a1 + 6;
  v2 = a1[6];
  v4 = (void *)a1[4];
  v5 = *(v3 - 1);
  v6 = v3[3];
  v15 = 0;
  v7 = objc_msgSend(v4, "_onQueue_setPersonaUniqueStrings:forAppBundleID:inDomain:error:", v5, v2, v6, &v15);
  v8 = v15;
  v9 = v15;
  *(_BYTE *)(*(_QWORD *)(v3[1] + 8) + 24) = v7;
  if (!*(_BYTE *)(*(_QWORD *)(v3[1] + 8) + 24))
  {
    v11 = a1[8];
    v10 = (uint64_t)(a1 + 8);
    objc_storeStrong((id *)(*(_QWORD *)(v11 + 8) + 40), v8);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000534B8(v3, v3 + 3, v10);
    v12 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v13 = MIStringForInstallationDomain(v3[3]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      MOLogWrite(v12, 3, "-[MILaunchServicesOperationManager setPersonaUniqueStrings:forAppBundleID:inDomain:error:]_block_invoke", CFSTR("Failed to set persona unique strings for %@/%@ : %@"));

    }
  }

}

void sub_10004C2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004C314(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_lsApplicationWorkspaceInstance"));
  v3 = *(unsigned int *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v9 = objc_msgSend(v2, "unregisterContainerizedApplicationWithBundleIdentifier:operationUUID:unregistrationOperation:precondition:requestContext:saveObserver:unregistrationError:", v7, v4, v3, v5, v6, v8, &v13);
  v10 = v13;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v9;

  v11 = 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    v11 = v10;

  return v11;
}

void sub_10004C7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_10004C7F0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned int *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v2, "_onQueue_unregisterAppForBundleID:domain:operationType:precondition:error:", v3, v6, v5, v4, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
}

void sub_10004CC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10004CC44(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "_onQueue_unregisterApplicationsAtMountPoint:error:", v3, &v7);
  v5 = v7;
  v6 = v7;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);

}

id sub_10004CD68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:", *(_QWORD *)(a1 + 40), 1);
}

id sub_10004CE3C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleLaunchServicesOperationFailureForUUID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10004CEEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x2Au);
}

void sub_10004CFD8(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc((Class)objc_opt_class(*(_QWORD *)(a1 + 32))), "initForInstallationDomain:", 2);
  v3 = (void *)qword_10009E010;
  qword_10009E010 = (uint64_t)v2;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class(*(_QWORD *)(a1 + 32))), "initForInstallationDomain:", 3);
  v5 = (void *)qword_10009E018;
  qword_10009E018 = (uint64_t)v4;

}

void sub_10004D41C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009E028;
  qword_10009E028 = (uint64_t)v1;

}

uint64_t sub_10004D7AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _BYTE *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  const __CFString *v29;
  uint64_t v30;
  int *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t buf;
  unint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;

  v48 = 0u;
  v49 = 0u;
  buf = 0;
  v46 = 0;
  v47 = 0;
  if ((*(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t, _QWORD))(a3 + 16))(a3, 3, &v48, 32, 0) != 32)
  {
    v27 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      return 0;
    v28 = __error();
    strerror(*v28);
    v29 = CFSTR("failed to read header: %s\n");
LABEL_35:
    v30 = v27;
LABEL_39:
    MOLogWrite(v30, 3, "patchFile", v29);
    return 0;
  }
  if ((_QWORD)v48 != 0x3034464649445342)
  {
    v30 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      return 0;
    v29 = CFSTR("bad magic\n");
    goto LABEL_39;
  }
  v9 = sub_10004DDC8(a3, 4, a4, 32);
  if (!v9)
  {
    v27 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      return 0;
    v32 = __error();
    strerror(*v32);
    v29 = CFSTR("failed to open control region: %s\n");
    goto LABEL_35;
  }
  v10 = v9;
  v11 = sub_10004DDC8(a3, 5, a4, *((_QWORD *)&v48 + 1) + 32);
  if (v11)
  {
    v12 = v11;
    v13 = sub_10004DDC8(a3, 6, a4, *((_QWORD *)&v48 + 1) + v49 + 32);
    if (v13)
    {
      v14 = v13;
      v15 = malloc_type_malloc(0x10000uLL, 0xBA17AE47uLL);
      if (v15)
      {
        v16 = v15;
        v17 = malloc_type_malloc(0x10000uLL, 0xCE350E8DuLL);
        if (v17)
        {
          v18 = v17;
          if (*((_QWORD *)&v49 + 1))
          {
            v19 = 0;
            v20 = 0;
            v44 = (uint64_t)v14;
            while (sub_10004DF54((uint64_t)v10, &buf, 24) == 24)
            {
              if (v47 < 0)
                v47 = -(v47 & 0x7FFFFFFFFFFFFFFFLL);
              v21 = buf;
              if (buf)
              {
                while (1)
                {
                  if (v21 >= 0x10000)
                    v22 = 0x10000;
                  else
                    v22 = v21;
                  if ((*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(a1 + 16))(a1, 1, v16, v22, v20) != v22)
                  {
                    v41 = qword_10009E048;
                    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                    {
                      v42 = CFSTR("read %zd from orig file, expected %d\n");
                      goto LABEL_68;
                    }
                    goto LABEL_76;
                  }
                  if (v22 != (int)sub_10004DF54((uint64_t)v12, v18, v22))
                    break;
                  v23 = 0;
                  do
                  {
                    *((_BYTE *)v18 + v23) += v16[v23];
                    ++v23;
                  }
                  while (v22 != v23);
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v22, v19) != v22)
                  {
LABEL_62:
                    v41 = qword_10009E048;
                    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                    {
                      v42 = CFSTR("wrote %zd to new file, expected %d\n");
LABEL_68:
                      v43 = v41;
                      goto LABEL_75;
                    }
                    goto LABEL_76;
                  }
                  v20 += v22;
                  v19 += v22;
                  v21 -= v22;
                  if (!v21)
                    goto LABEL_23;
                }
                v43 = qword_10009E048;
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                {
                  v42 = CFSTR("read %zd from diff sect, expected %d\n");
                  goto LABEL_75;
                }
                goto LABEL_76;
              }
LABEL_23:
              v24 = v46;
              if (v46)
              {
                while (1)
                {
                  v25 = v24 >= 0x10000 ? 0x10000 : v24;
                  if (v25 != (int)sub_10004DF54(v44, v18, v25))
                    break;
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v25, v19) != v25)goto LABEL_62;
                  v19 += v25;
                  v24 -= v25;
                  if (!v24)
                    goto LABEL_30;
                }
                v43 = qword_10009E048;
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                {
                  v42 = CFSTR("read %zd from extra sect, expected %d\n");
LABEL_75:
                  MOLogWrite(v43, 3, "patchFile", v42);
                }
LABEL_76:
                v26 = 0;
                v14 = (_QWORD *)v44;
                goto LABEL_77;
              }
LABEL_30:
              v20 += v47;
              v26 = 1;
              v14 = (_QWORD *)v44;
              if (v19 >= *((_QWORD *)&v49 + 1))
                goto LABEL_77;
            }
            if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              MOLogWrite(qword_10009E048, 3, "patchFile", CFSTR("failed to read control block\n"));
            v26 = 0;
          }
          else
          {
            v26 = 1;
          }
LABEL_77:
          free(v18);
        }
        else
        {
          v39 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v40 = __error();
            strerror(*v40);
            MOLogWrite(v39, 3, "patchFile", CFSTR("malloc of patchbuf failed: %s\n"));
          }
          v26 = 0;
        }
        free(v16);
      }
      else
      {
        v37 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v38 = __error();
          strerror(*v38);
          MOLogWrite(v37, 3, "patchFile", CFSTR("malloc of filebuf failed: %s\n"));
        }
        v26 = 0;
      }
      sub_10004DFCC(v14);
    }
    else
    {
      v35 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v36 = __error();
        strerror(*v36);
        MOLogWrite(v35, 3, "patchFile", CFSTR("failed to open extra region: %s\n"));
      }
      v26 = 0;
    }
    sub_10004DFCC(v12);
  }
  else
  {
    v33 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v34 = __error();
      strerror(*v34);
      MOLogWrite(v33, 3, "patchFile", CFSTR("failed to open diff region: %s\n"));
    }
    v26 = 0;
  }
  sub_10004DFCC(v10);
  return v26;
}

_QWORD *sub_10004DDC8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  FILE *v10;
  BZFILE *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int bzerror;

  bzerror = 0;
  v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040A4FBEE0AuLL);
  v9 = v8;
  if (!v8)
  {
    v14 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_15;
    v15 = __error();
    strerror(*v15);
    v13 = CFSTR("malloc of wrapper failed: %s\n");
LABEL_13:
    v12 = v14;
    goto LABEL_14;
  }
  *(_DWORD *)v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a1;
  v10 = funopen(v8, (int (__cdecl *)(void *, char *, int))sub_10004E314, 0, 0, 0);
  v9[4] = v10;
  if (!v10)
  {
    v14 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_15;
    v16 = __error();
    strerror(*v16);
    v13 = CFSTR("fropen failed: %s\n");
    goto LABEL_13;
  }
  v11 = BZ2_bzReadOpen(&bzerror, v10, 0, 0, 0, 0);
  v9[5] = v11;
  if (!v11)
  {
    v12 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_15;
    v13 = CFSTR("BZ2_bzReadOpen failed: %d\n");
LABEL_14:
    MOLogWrite(v12, 3, "BZOpen", v13);
LABEL_15:
    sub_10004DFCC(v9);
    return 0;
  }
  return v9;
}

uint64_t sub_10004DF54(uint64_t a1, void *buf, int len)
{
  uint64_t result;
  int bzerror;

  bzerror = 0;
  result = BZ2_bzRead(&bzerror, *(BZFILE **)(a1 + 40), buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "BZRead", CFSTR("BZ2_bzRead failed: %d\n"));
    return 0xFFFFFFFFLL;
  }
  return result;
}

void sub_10004DFCC(_QWORD *a1)
{
  BZFILE *v2;
  FILE *v3;
  int bzerror;

  bzerror = 0;
  if (a1)
  {
    v2 = (BZFILE *)a1[5];
    if (v2)
      BZ2_bzReadClose(&bzerror, v2);
    v3 = (FILE *)a1[4];
    if (v3)
      fclose(v3);
    free(a1);
  }
}

uint64_t sub_10004E01C(const char *a1, const char *a2, int a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  int *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  int *v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v24[4];
  int v25;
  _QWORD v26[4];
  int v27;
  _QWORD v28[4];
  int v29;
  stat v30;
  stat v31;

  memset(&v31, 0, sizeof(v31));
  memset(&v30, 0, sizeof(v30));
  v5 = open(a1, 256);
  if (v5 != -1)
  {
    v6 = v5;
    if (fstat(v5, &v31) == -1)
    {
      v13 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_18;
      v14 = __error();
      strerror(*v14);
      v15 = CFSTR("fstat(%s): %s\n");
      v16 = v13;
    }
    else
    {
      v7 = open(a2, 256);
      if (v7 != -1)
      {
        v8 = v7;
        if (fstat(v7, &v30) == -1)
        {
          v19 = qword_10009E048;
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
            goto LABEL_26;
          v20 = __error();
          strerror(*v20);
          v21 = CFSTR("fstat(%s): %s\n");
          v22 = v19;
        }
        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 0x40000000;
          v28[2] = sub_10004E2D8;
          v28[3] = &unk_100085AB8;
          v29 = v6;
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 0x40000000;
          v26[2] = sub_10004E2EC;
          v26[3] = &unk_100085AD8;
          v27 = v8;
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 0x40000000;
          v24[2] = sub_10004E300;
          v24[3] = &unk_100085AF8;
          v25 = a3;
          if ((sub_10004D7AC((uint64_t)v28, v9, (uint64_t)v26, v30.st_size, (uint64_t)v24) & 1) != 0)
          {
            v10 = 0;
LABEL_27:
            close(v8);
            goto LABEL_28;
          }
          v22 = qword_10009E048;
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
          {
LABEL_26:
            v10 = 0xFFFFFFFFLL;
            goto LABEL_27;
          }
          v21 = CFSTR("patch failed\n");
        }
        MOLogWrite(v22, 3, "patch_file", v21);
        goto LABEL_26;
      }
      v17 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      {
LABEL_18:
        v10 = 0xFFFFFFFFLL;
LABEL_28:
        close(v6);
        return v10;
      }
      v18 = __error();
      strerror(*v18);
      v15 = CFSTR("open(%s): %s\n");
      v16 = v17;
    }
    MOLogWrite(v16, 3, "patch_file", v15);
    goto LABEL_18;
  }
  v11 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v12 = __error();
    strerror(*v12);
    MOLogWrite(v11, 3, "patch_file", CFSTR("open(%s): %s\n"));
  }
  return 0xFFFFFFFFLL;
}

ssize_t sub_10004E2D8(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10004E2EC(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_10004E300(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pwrite(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

uint64_t sub_10004E314(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
  if (result == -1)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 16) += result;
  return result;
}

void sub_10004E778(const void *a1)
{
  sub_10004E788(a1, 0);
}

void sub_10004E780(const void *a1)
{
  sub_10004E788(a1, 1);
}

void sub_10004E788(const void *a1, int a2)
{
  CFTypeID v4;
  const __CFArray *MutableCopy;
  CFMutableSetRef Mutable;
  _QWORD v7[5];
  char v8;
  CFRange v9;

  v4 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v4)
  {
    MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)a1);
    v9.length = CFArrayGetCount(MutableCopy);
    v9.location = 0;
    CFArraySortValues(MutableCopy, v9, (CFComparatorFunction)sub_10004E99C, 0);
    Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004EF64;
    v7[3] = &unk_100085B38;
    v7[4] = Mutable;
    v8 = a2;
    sub_10004EA2C(MutableCopy, v7);
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }
  else
  {
    if (CFStringGetTypeID() != v4)
      sub_100053800();
    sub_10004EFB0(a1, a2);
  }
}

void sub_10004E8A0(const void *a1)
{
  CFTypeID v2;
  const __CFArray *MutableCopy;
  CFMutableSetRef Mutable;
  _QWORD v5[5];
  CFRange v6;

  v2 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v2)
  {
    MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)a1);
    v6.length = CFArrayGetCount(MutableCopy);
    v6.location = 0;
    CFArraySortValues(MutableCopy, v6, (CFComparatorFunction)sub_10004E99C, (void *)1);
    Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10004EA88;
    v5[3] = &unk_100085B18;
    v5[4] = Mutable;
    sub_10004EA2C(MutableCopy, v5);
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }
  else
  {
    if (CFStringGetTypeID() != v2)
      sub_100053840();
    sub_10004EAD0(a1);
  }
}

CFComparisonResult sub_10004E99C(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFTypeID TypeID;
  CFTypeID v7;
  CFComparisonResult result;
  uint64_t v9;
  uint64_t v10;

  TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a1))
    return 0;
  v7 = CFStringGetTypeID();
  if (v7 != CFGetTypeID(a2))
    return 0;
  result = CFStringCompare(a1, a2, 0);
  v9 = 1;
  if (result == kCFCompareGreaterThan)
    v10 = -1;
  else
    v10 = result;
  if (result != kCFCompareLessThan)
    v9 = v10;
  if (a3)
    return v9;
  return result;
}

void sub_10004EA2C(const __CFArray *a1, void *a2)
{
  id context;
  CFRange v4;

  if (a1)
  {
    context = a2;
    v4.length = CFArrayGetCount(a1);
    v4.location = 0;
    CFArrayApplyFunction(a1, v4, (CFArrayApplierFunction)sub_10004F1B4, context);

  }
}

void sub_10004EA88(uint64_t a1, const void *a2)
{
  if (!CFSetContainsValue(*(CFSetRef *)(a1 + 32), a2))
  {
    sub_10004EAD0(a2);
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), a2);
  }
}

char *sub_10004EAD0(const void *a1)
{
  char *result;
  pthread_rwlock_t *v3;
  unsigned int *v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  _BOOL4 v9;

  pthread_mutex_lock(&stru_10009DD88);
  result = (char *)qword_10009DE88;
  if (qword_10009DE88)
  {
    result = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_10009DE88, a1);
    if (result)
    {
      v3 = (pthread_rwlock_t *)result;
      v4 = (unsigned int *)(result + 208);
      if (*((_DWORD *)result + 52))
      {
        if (*v4 == -1)
        {
          while (1)
          {
            v7 = __ldaxr(v4);
            if (v7 != -1)
              goto LABEL_32;
            if (!__stlxr(0, v4))
            {
              if (dword_10009DE98 || !dword_10009DE94)
                goto LABEL_31;
              v8 = dword_10009DE94 - 1;
              dword_10009DE94 = v8;
              if (dword_10009DE90 | v8)
              {
                v9 = 1;
                if (v8)
                  goto LABEL_21;
              }
              else
              {
                pthread_cond_signal(&stru_10009DDC8);
                v9 = dword_10009DE98 != -1;
                if (dword_10009DE94)
                  goto LABEL_21;
              }
              if (v9)
                pthread_cond_broadcast(&stru_10009DDF8);
              goto LABEL_21;
            }
          }
        }
        do
          v5 = __ldaxr(v4);
        while (__stlxr(v5 - 1, v4));
        if (v5 > 0 && (dword_10009DE98 & 0x80000000) == 0)
        {
          v6 = dword_10009DE90;
          if (dword_10009DE90)
          {
            --dword_10009DE90;
            if (!((v6 - 1) | dword_10009DE94 | dword_10009DE98))
              pthread_cond_signal(&stru_10009DDC8);
LABEL_21:
            --v3[1].__sig;
            pthread_rwlock_unlock(v3);
            if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
              MOLogWrite(qword_10009E048, 7, "unlock_one_lock", CFSTR("Unlocked identifier %@"));
            if (v3[1].__sig)
              return (char *)pthread_mutex_unlock(&stru_10009DD88);
            result = (char *)qword_10009E048;
            if (qword_10009E048)
            {
              if (*(int *)(qword_10009E048 + 44) >= 7)
                result = (char *)MOLogWrite(qword_10009E048, 7, "unlock_one_lock", CFSTR("Destroying lock for identifier %@"));
            }
            if (!*v4)
            {
              pthread_rwlock_destroy(v3);
              free(v3);
              CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_10009DE88, a1);
              return (char *)pthread_mutex_unlock(&stru_10009DD88);
            }
          }
        }
      }
    }
  }
LABEL_31:
  __break(1u);
LABEL_32:
  __clrex();
  __break(1u);
  return result;
}

uint64_t sub_10004ECE0()
{
  return sub_10004ECE8(0);
}

uint64_t sub_10004ECE8(char a1)
{
  BOOL v2;
  BOOL v4;
  int v6;
  int i;
  int v8;

  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    MOLogWrite(qword_10009E048, 7, "_lock_all_identifiers", CFSTR("Waiting to lock all identifiers for %s"));
  pthread_mutex_lock(&stru_10009DD88);
  if ((a1 & 1) != 0)
  {
    if (dword_10009DE90)
      v2 = 0;
    else
      v2 = dword_10009DE94 == 0;
    if (!v2 || dword_10009DE98 != 0)
    {
      do
      {
        pthread_cond_wait(&stru_10009DDC8, &stru_10009DD88);
        if (dword_10009DE90)
          v4 = 0;
        else
          v4 = dword_10009DE94 == 0;
      }
      while (!v4 || dword_10009DE98 != 0);
    }
    v6 = -1;
  }
  else
  {
    v8 = dword_10009DE94;
    for (i = dword_10009DE98; v8 || i == -1; i = dword_10009DE98)
    {
      pthread_cond_wait(&stru_10009DDF8, &stru_10009DD88);
      v8 = dword_10009DE94;
    }
    v6 = i + 1;
  }
  dword_10009DE98 = v6;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    MOLogWrite(qword_10009E048, 7, "_lock_all_identifiers", CFSTR("Locked all identifiers for %s"));
  return pthread_mutex_unlock(&stru_10009DD88);
}

uint64_t sub_10004EE54()
{
  return sub_10004ECE8(1);
}

uint64_t sub_10004EE60()
{
  uint64_t result;
  int v1;
  BOOL v2;

  result = pthread_mutex_lock(&stru_10009DD88);
  if (dword_10009DE98 == -1)
  {
    dword_10009DE98 = 0;
    pthread_cond_signal(&stru_10009DDC8);
    pthread_cond_broadcast(&stru_10009DDF8);
    pthread_cond_broadcast(&stru_10009DE28);
    pthread_cond_broadcast(&stru_10009DE58);
  }
  else
  {
    if (dword_10009DE98 <= 0)
    {
      __break(1u);
      return result;
    }
    v1 = dword_10009DE98 - 1;
    dword_10009DE98 = v1;
    if (!v1)
    {
      pthread_cond_broadcast(&stru_10009DE28);
      v1 = dword_10009DE98;
    }
    if (dword_10009DE90)
      v2 = 0;
    else
      v2 = dword_10009DE94 == 0;
    if (v2 && v1 == 0)
      pthread_cond_signal(&stru_10009DDC8);
  }
  pthread_mutex_unlock(&stru_10009DD88);
  result = qword_10009E048;
  if (qword_10009E048)
  {
    if (*(int *)(qword_10009E048 + 44) >= 7)
      return MOLogWrite(qword_10009E048, 7, "unlock_all_identifiers", CFSTR("Unlocked all identifiers"));
  }
  return result;
}

void sub_10004EF64(uint64_t a1, const void *a2)
{
  if (!CFSetContainsValue(*(CFSetRef *)(a1 + 32), a2))
  {
    sub_10004EFB0(a2, *(unsigned __int8 *)(a1 + 40));
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), a2);
  }
}

uint64_t sub_10004EFB0(const void *a1, int a2)
{
  int v4;
  char *Value;
  char *v6;
  unsigned int *v7;
  uint64_t result;
  unsigned int v10;

  pthread_mutex_lock(&stru_10009DD88);
  v4 = dword_10009DE98;
  if ((a2 & 1) != 0)
  {
    while (dword_10009DE98)
      pthread_cond_wait(&stru_10009DE28, &stru_10009DD88);
    ++dword_10009DE94;
  }
  else
  {
    while (v4 == -1)
    {
      pthread_cond_wait(&stru_10009DE58, &stru_10009DD88);
      v4 = dword_10009DE98;
    }
    ++dword_10009DE90;
  }
  if (!qword_10009DE88)
  {
    qword_10009DE88 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    goto LABEL_12;
  }
  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_10009DE88, a1);
  if (!Value)
  {
LABEL_12:
    v6 = (char *)malloc_type_malloc(0xD8uLL, 0x1000040E7203D26uLL);
    pthread_rwlock_init((pthread_rwlock_t *)v6, 0);
    *((_QWORD *)v6 + 25) = 1;
    *((_DWORD *)v6 + 52) = 0;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_10009DE88, a1, v6);
    goto LABEL_13;
  }
  v6 = Value;
  ++*((_QWORD *)Value + 25);
LABEL_13:
  pthread_mutex_unlock(&stru_10009DD88);
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    MOLogWrite(qword_10009E048, 7, "take_one_lock", CFSTR("Waiting to lock %@ for %s"));
  v7 = (unsigned int *)(v6 + 208);
  if (a2)
  {
    result = pthread_rwlock_wrlock((pthread_rwlock_t *)v6);
    while (!__ldaxr(v7))
    {
      if (!__stlxr(0xFFFFFFFF, v7))
        goto LABEL_24;
    }
    goto LABEL_29;
  }
  result = pthread_rwlock_rdlock((pthread_rwlock_t *)v6);
  do
    v10 = __ldaxr(v7);
  while (__stlxr(v10 + 1, v7));
  if ((v10 & 0x80000000) != 0)
  {
    __break(1u);
LABEL_29:
    __clrex();
    __break(1u);
    return result;
  }
LABEL_24:
  result = qword_10009E048;
  if (qword_10009E048)
  {
    if (*(int *)(qword_10009E048 + 44) >= 7)
      return MOLogWrite(qword_10009E048, 7, "take_one_lock", CFSTR("Got lock on identifier %@"));
  }
  return result;
}

void sub_10004F1B4(uint64_t a1, id a2)
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))objc_retainBlock(a2);
  v3[2](v3, a1);

}

void sub_10004F268(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_10009E038;
  qword_10009E038 = (uint64_t)v1;

}

void sub_100050468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100050490(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000504A0(uint64_t a1)
{

}

uint64_t sub_1000504A8(uint64_t a1, void *a2, int a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v18;
  void *v19;
  id obj;

  v7 = a2;
  v8 = v7;
  if (a3 != 4)
  {
    v10 = *(_DWORD *)(a1 + 48);
    if (v10 == 1)
    {
      a4 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      if (objc_msgSend(a4, "isEqualToString:", CFSTR("TemporaryAppReferences")))
      {

LABEL_13:
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        obj = *(id *)(v13 + 40);
        a4 = (_BYTE *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceMetadata referenceMetadataFromURL:error:](MIAppReferenceMetadata, "referenceMetadataFromURL:error:", v8, &obj));
        objc_storeStrong((id *)(v13 + 40), obj);
        if (!a4)
        {
          v9 = 0;
          goto LABEL_20;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "personas"));
        v15 = objc_msgSend(v14, "count");

        v16 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "personas"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
          MOLogWrite(v16, 5, "-[MIAppReferenceManager _countReferencesWithType:atBaseURL:count:withError:]_block_invoke", CFSTR("Found %lu (%@) references at %@"));

        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v15;
        goto LABEL_18;
      }
      if (*(_DWORD *)(a1 + 48) != 2)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else if (v10 != 2)
    {
      goto LABEL_19;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("AppReferences"));

    if (v10 == 1)
    {

      if ((v12 & 1) == 0)
        goto LABEL_19;
    }
    else if (!v12)
    {
LABEL_19:
      v9 = 1;
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  v9 = 1;
  *a4 = 1;
LABEL_20:

  return v9;
}

uint64_t sub_100051124(int a1, _QWORD *a2, size_t *a3, int a4)
{
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  if (!a2 || !a3)
  {
LABEL_13:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!sub_100051214(a1, (uint64_t)&v9))
  {
    if ((v9 & 0x3E) != 0x2E)
      return 0;
    if (v10 < 2)
    {
      if (HIDWORD(v10) == HIDWORD(v9) - 1)
        return sub_1000516BC(HIDWORD(v10), a2, a3);
      if (a4)
        return sub_1000515A8(a1, a2, a3, HIDWORD(v9), SHIDWORD(v10));
      syslog(3, "arm64 slice at index %u, not last (nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_13;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100051214(int a1, uint64_t a2)
{
  uint64_t result;
  uint32_t nfat_arch;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  stat v20;
  fat_arch v21;
  fat_header fat_header;

  fat_header = 0;
  memset(&v21, 0, sizeof(v21));
  memset(&v20, 0, sizeof(v20));
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = fstat(a1, &v20);
  if ((_DWORD)result != -1)
  {
    if (sub_1000519D0(a1, &fat_header, 8uLL, 0))
    {
      if (fat_header.magic != -1095041334)
        return 0;
      swap_fat_header(&fat_header, NX_LittleEndian);
      nfat_arch = fat_header.nfat_arch;
      *(_DWORD *)(a2 + 4) = fat_header.nfat_arch;
      if (sub_100051A18(a1, nfat_arch, &v21))
      {
        if (v21.cputype == 16777228)
        {
          v18 = 0u;
          v19 = 0u;
          if (v20.st_size > v21.offset && v21.size >= 0x1C && v20.st_size >= v21.size + v21.offset && v21.align <= 0x40)
          {
            if (v21.size + (unint64_t)v21.offset > 0x1F)
            {
              if (sub_1000519D0(a1, &v18, 0x20uLL, v21.offset) && (_DWORD)v18 == -17958193 && HIDWORD(v18) == 2)
              {
                *(_DWORD *)a2 |= 0x10u;
                ++fat_header.nfat_arch;
              }
            }
            else
            {
              *__error() = 34;
            }
          }
        }
        if (fat_header.nfat_arch)
        {
          v6 = 0;
          while (1)
          {
            if (!sub_100051A18(a1, v6, &v21))
              return 0xFFFFFFFFLL;
            if (v21.cputype == 12)
            {
              *(_DWORD *)a2 |= 2u;
              v7 = 1;
            }
            else
            {
              v7 = 0;
              if (v21.cputype == 16777228)
              {
                *(_DWORD *)a2 |= 4u;
                ++*(_DWORD *)(a2 + 8);
                *(_DWORD *)(a2 + 12) = v6;
              }
            }
            v18 = 0u;
            v19 = 0u;
            if (v21.size + (unint64_t)v21.offset <= 0x1F)
            {
              *__error() = 34;
              return 0xFFFFFFFFLL;
            }
            if (!sub_1000519D0(a1, &v18, 0x20uLL, v21.offset))
              return 0xFFFFFFFFLL;
            if ((_DWORD)v18 == -17958193)
              break;
            if ((_DWORD)v18 == -17958194)
            {
              v8 = HIDWORD(v18);
              v9 = v19;
              v10 = 28;
              v11 = 28;
              goto LABEL_29;
            }
            syslog(5, "ignoring slice with magic %08x\n", (_DWORD)v18);
LABEL_47:
            if (++v6 >= fat_header.nfat_arch)
              return 0;
          }
          v8 = HIDWORD(v18);
          v9 = v19;
          v10 = 32;
          v11 = 32;
LABEL_29:
          if (v8 == 2)
          {
            *(_DWORD *)a2 |= 0x20u;
            v11 = v10;
          }
          if (v7)
          {
            if (v9)
            {
              while (1)
              {
                v17 = 0;
                v12 = sub_100051A68(a1, &v17, 8uLL, v11, v21.offset, v21.size);
                v13 = v12;
                if (!v12)
                  goto LABEL_42;
                if ((_DWORD)v17 == 37)
                  break;
                v11 += HIDWORD(v17);
                if (!--v9)
                  goto LABEL_36;
              }
              v15 = 0;
              v16 = 0;
              if (!sub_100051A68(a1, &v15, 0x10uLL, v11, v21.offset, v21.size))
              {
LABEL_42:
                v14 = 1;
                goto LABEL_43;
              }
              if (WORD1(v16) <= 6u)
                *(_DWORD *)a2 |= 8u;
            }
            else
            {
LABEL_36:
              v13 = 0;
            }
            v14 = 6;
LABEL_43:
            if (v14 != 6 || v13)
            {
              if (v14 != 6)
                return 0xFFFFFFFFLL;
            }
            else
            {
              *(_DWORD *)a2 |= 8u;
            }
          }
          goto LABEL_47;
        }
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000515A8(int a1, _QWORD *a2, size_t *a3, unsigned int a4, int a5)
{
  int *v5;
  int v6;
  size_t v12;
  _DWORD *v13;
  _DWORD *v14;
  uint64_t result;
  _DWORD *v16;
  int v17;
  _DWORD *v18;
  __int128 v19;
  __int128 v20;

  if (a4 >= 0x401)
  {
    v5 = __error();
    v6 = 22;
LABEL_7:
    *v5 = v6;
    return 0xFFFFFFFFLL;
  }
  v12 = 20 * a4 + 8;
  v13 = malloc_type_malloc(v12, 0x63868CB2uLL);
  if (!v13)
  {
    v5 = __error();
    v6 = 12;
    goto LABEL_7;
  }
  v14 = v13;
  if (sub_1000519D0(a1, v13, v12, 0))
  {
    result = 0;
    v16 = &v14[5 * a4 - 3];
    v17 = v16[4];
    v18 = &v14[5 * a5 + 2];
    v19 = *(_OWORD *)v18;
    v16[4] = v18[4];
    v20 = *(_OWORD *)v16;
    *(_OWORD *)v16 = v19;
    *(_OWORD *)v18 = v20;
    v18[4] = v17;
    v14[1] = bswap32(a4 - 1);
    *a2 = v14;
    *a3 = v12;
    return result;
  }
  free(v14);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000516BC(unsigned int a1, _QWORD *a2, _QWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t result;

  v6 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v6)
  {
    v7 = v6;
    result = 0;
    *v7 = -1095041334;
    v7[1] = bswap32(a1);
    *a2 = v7;
    *a3 = 8;
  }
  else
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10005173C(int a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!sub_100051214(a1, (uint64_t)&v6))
  {
    if ((~(_DWORD)v6 & 0x3E) != 0)
      return 0;
    if (v7 < 2)
    {
      if (HIDWORD(v7) == HIDWORD(v6))
        return sub_1000516BC(HIDWORD(v7) + 1, a2, a3);
      syslog(3, "arm64 slice at index %u, not last (nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_11;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100051800(char *a1, int a2, _BYTE *a3)
{
  return sub_100051810(a1, 1, a2, a3);
}

uint64_t sub_100051810(char *a1, int a2, int a3, _BYTE *a4)
{
  int v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  int v13;
  size_t v14;
  ssize_t v15;
  ssize_t v16;
  int *v17;
  int *v18;
  size_t v20;
  void *v21;

  v20 = 0;
  v21 = 0;
  if (a4)
    *a4 = 0;
  v8 = open(a1, 256);
  v9 = v8;
  if (v8 == -1)
  {
    v10 = __error();
    v11 = strerror(*v10);
    syslog(3, "Could not open %s for reading: %s", a1, v11);
    goto LABEL_11;
  }
  if (a2)
  {
    if (!sub_100051124(v8, &v21, &v20, a3))
      goto LABEL_12;
LABEL_11:
    v12 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (a3)
    syslog(4, "allow_reorder not allowed for unhiding");
  if (sub_10005173C(v9, &v21, &v20))
    goto LABEL_11;
LABEL_12:
  if (v20)
  {
    close(v9);
    v13 = open(a1, 258);
    v9 = v13;
    if (v13 == -1)
    {
      v17 = __error();
      strerror(*v17);
      syslog(3, "Could not open %s for writing: %s");
    }
    else
    {
      v14 = v20;
      v15 = pwrite(v13, v21, v20, 0);
      v16 = v15;
      if (v15 != v14 && v15 != -1)
        *__error() = 5;
      if (v16 == v14)
      {
        if (a4)
        {
          v12 = 0;
          *a4 = 1;
          goto LABEL_23;
        }
      }
      else
      {
        v18 = __error();
        strerror(*v18);
        syslog(3, "Could not write new header to executable: %s");
      }
    }
  }
  v12 = 0;
LABEL_23:
  if (v21)
    free(v21);
  if (v9 != -1)
    close(v9);
  return v12;
}

uint64_t sub_1000519C0(char *a1, _BYTE *a2)
{
  return sub_100051810(a1, 0, 0, a2);
}

BOOL sub_1000519D0(int a1, void *a2, size_t a3, off_t a4)
{
  ssize_t v5;
  ssize_t v6;

  v5 = pread(a1, a2, a3, a4);
  v6 = v5;
  if (v5 != a3 && v5 != -1)
    *__error() = 5;
  return v6 == a3;
}

BOOL sub_100051A18(int a1, int a2, fat_arch *a3)
{
  _BOOL8 v4;

  v4 = sub_1000519D0(a1, a3, 0x14uLL, 20 * a2 + 8);
  if (v4)
    swap_fat_arch(a3, 1u, NX_LittleEndian);
  return v4;
}

BOOL sub_100051A68(int a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a4 & 0x8000000000000000) == 0 && (uint64_t)(a4 + a3) <= a6 + a5)
    return sub_1000519D0(a1, a2, a3, a5 + a4);
  *__error() = 34;
  return 0;
}

void sub_100051AA8(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *UserManagementLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ICLSoftLinking.h"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_100051B24()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getUMUserManagerClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ICLSoftLinking.h"), 39, CFSTR("Unable to find class %s"), "UMUserManager");

  __break(1u);
}

void sub_100051B9C()
{
  __assert_rtn("read_bytes", "delta_update.c", 105, "stream->currentStreamOffset < stream->streamLength");
}

void sub_100051BC4()
{
  __assert_rtn("read_string_to_terminator", "delta_update.c", 121, "stream->currentStreamOffset < stream->streamLength");
}

void sub_100051BEC(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v1 = 136315394;
  v2 = "MIReportIssueUsingAutoBugCapture";
  v3 = 2112;
  v4 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to report using ABC with signature: %@", (uint8_t *)&v1, 0x16u);
}

void sub_100051C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v3 = 136315906;
  v4 = "-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  v9 = 2112;
  v10 = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: App %@ already has a data container with persona %@ but this installation request came for a different persona, %@. Apps may not be installed for multiple personas simultaneously. Deleting abandoned containers.", (uint8_t *)&v3, 0x2Au);
}

void sub_100051D1C()
{
  _os_crash("Failed to get path to MobileInstallation's daemon data container");
  __break(1u);
}

void sub_100051D34(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_10002749C();
  sub_100027400((void *)&_mh_execute_header, &_os_log_default, v2, "Daemon's home directory at %@ should have perms 0%ho, but found 0%ho", v3, v4, v5, v6, v7);

  sub_100027490();
}

void sub_100051DC4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_100027440();
  sub_100027400((void *)&_mh_execute_header, &_os_log_default, v2, "Daemon's home directory at %@ should have gid %u, but found %u", v3, v4, v5, v6, v7);

  sub_100027480();
}

void sub_100051E50(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_100027440();
  sub_100027400((void *)&_mh_execute_header, &_os_log_default, v2, "Daemon's home directory at %@ should be owned by uid %u, but found %u", v3, v4, v5, v6, v7);

  sub_100027480();
}

void sub_100051EDC(void *a1, int a2)
{
  void *v3;
  uint8_t v4[14];
  int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_10002749C();
  v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Daemon's home directory at %@ was not a directory; found mode: 0%ho",
    v4,
    0x12u);

  sub_100027490();
}

void sub_100051F6C(void *a1, int a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  uint64_t v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v6 = 138413058;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  v10 = 2080;
  v11 = strerror(a2);
  v12 = 2112;
  v13 = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to stat daemon's home directory at %@ : %d (%s); parentInfo: %@",
    (uint8_t *)&v6,
    0x26u);

  sub_100027410();
}

void sub_100052030(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLByDeletingLastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "debugDescriptionForItemAtURL:", v4));
  sub_100027420();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v6, "No space to create directory at \"%@\": %@; parentInfo: %@",
    v7,
    v8,
    v9,
    v10,
    v11);

  sub_100027410();
}

void sub_1000520D4(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLByDeletingLastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "debugDescriptionForItemAtURL:", v4));
  sub_100027420();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v6, "Failed to create directory at \"%@\": %@; parentInfo: %@",
    v7,
    v8,
    v9,
    v10,
    v11);

  sub_100027410();
}

void sub_100052178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Found %lu erroneous containers containing user data", a5, a6, a7, a8, 2u);
}

void sub_1000521FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Found unexpected erroneous containers after upgrading from %@", a5, a6, a7, a8, 2u);
}

void sub_100052280(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "path"));
  sub_1000282A8();
  sub_1000282F8((void *)&_mh_execute_header, &_os_log_default, v3, "%s: Failed to write journal entry for %@ to %@ : %@", v4, v5, v6, v7, 2u);

  sub_1000282E8();
}

void sub_100052318(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "path"));
  sub_1000282A8();
  sub_1000282F8((void *)&_mh_execute_header, &_os_log_default, v3, "%s: Failed to remove journal entry for %@ from %@ : %@", v4, v5, v6, v7, 2u);

  sub_1000282E8();
}

void sub_1000523B0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_1000282CC();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to read journal entry data from %@ : %@", v3, v4, v5, v6, 2u);

  sub_100028308();
}

void sub_10005243C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_1000282CC();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to unarchive journal entry data from %@ : %@", v3, v4, v5, v6, 2u);

  sub_100028308();
}

void sub_1000524C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Failed to finalize journal entry when reconciling for %@ : %@", a5, a6, a7, a8, 2u);
}

void sub_100052554()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7A8();
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to add Swift Playgrounds to linked parent bundle ID list: %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_1000525BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7A8();
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to locate bundle container for Swift Playgrounds: %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_100052624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7A8();
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to read bundle metadata for Swift Playgrounds: %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_10005268C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7A8();
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to scan for bundle containers: %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_1000526F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7A8();
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to save updated bundle metadata on Swift Playgrounds container: %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_10005275C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7A8();
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to query bundle containers with %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_1000527C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7B4();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to read bundle metadata for %@: %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_100052830(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_10002C7B4();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to read linked parent bundles file at %@ : %@", v3, v4, v5, v6, v7);

}

void sub_1000528BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002C7A8();
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, v0, "Linked child bundle IDs on disk and in memory are not the same for %@", v1, v2, v3, v4, v5);
  sub_10002C7A0();
}

void sub_100052924()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3[0] = 136315906;
  sub_100030234();
  v4 = v0;
  v5 = v1;
  v6 = v0;
  v7 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to recover install for %@/%@ : %@", (uint8_t *)v3, 0x2Au);
}

void sub_1000529B8(void *a1, uint64_t a2)
{
  void *v3;
  int v4[5];
  __int16 v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identity"));
  v4[0] = 136315650;
  sub_100030234();
  v5 = 2048;
  v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to replay journal entry for %@ after %lu attempts", (uint8_t *)v4, 0x20u);

}

void sub_100052A64(void *a1, _DWORD *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  *a2 = 136315650;
  sub_100034A4C((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]");
  *(_QWORD *)(v5 + 24) = CFSTR("ParallelPlaceholderOnlyIfExists");
  sub_100034A64((void *)&_mh_execute_header, &_os_log_default, v6, "%s: Process %@ is using an unsupported key: %@", v7);

}

void sub_100052AD0(void *a1, _DWORD *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;

  *a2 = 136315650;
  sub_100034A4C((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]");
  *(_QWORD *)(v5 + 24) = CFSTR("Placeholder");
  sub_100034A64((void *)&_mh_execute_header, &_os_log_default, v6, "%s: Process %@ is using an unsupported key: %@", v7);

}

void sub_100052B3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to register installation record in system domain for %@ : %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_100052BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, a3, "%s: System Shared instance is not valid in a Shared iPad configuration.", a5, a6, a7, a8, 2u);
  sub_10002C7A0();
}

void sub_100052C24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: LaunchServices reported failure when saving LS operation UUID %@ : %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_100052C98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to rename identified most recent instance dir: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100052D0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to re-create operation storage base: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100052D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to clear out LS operation storage base dir: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100052DF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to move operation storage base to look aside: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100052E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to remove lookaside directory: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100052EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002C790((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Failed to locate most recent instance dir in LS operation lookaside dir; purging state",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10002C7A0();
}

void sub_100052F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to clear out old content in storage base: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100052FC4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_1000282CC();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to write previous attempts file to %@ : %@", v3, v4, v5, v6, 2u);

  sub_100028308();
}

void sub_100053050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Discovered %ld previous reconcile attempts; declaring defeat",
    a5,
    a6,
    a7,
    a8,
    2u);
  sub_10002C7A0();
}

void sub_1000530D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write new count to previous reconcile attempts count: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100053144(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_1000282CC();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to unarchive operation data from %@ : %@", v3, v4, v5, v6, 2u);

  sub_100028308();
}

void sub_1000531D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100030234();
  sub_100027470((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to remove lookaside storage base: %@", v1, v2, v3, v4, 2u);
  sub_10002C7A0();
}

void sub_100053244(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_1000282CC();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to purge registration dir at %@ : %@", v3, v4, v5, v6, 2u);

  sub_100028308();
}

void sub_1000532D0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  sub_1000282CC();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to purge registration lookaside dir at %@ : %@", v3, v4, v5, v6, 2u);

  sub_100028308();
}

void sub_10005335C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to push persona unique strings for %@ to LaunchServices: %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_1000533D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_100053444()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_1000534B8(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;

  v4 = *a1;
  v5 = MIStringForInstallationDomain(*a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a3 + 8) + 40);
  v9 = 136315906;
  v10 = "-[MILaunchServicesOperationManager setPersonaUniqueStrings:forAppBundleID:inDomain:error:]_block_invoke";
  v11 = 2112;
  v12 = v4;
  v13 = 2112;
  v14 = v6;
  v15 = 2112;
  v16 = v7;
  sub_10004CEEC((void *)&_mh_execute_header, &_os_log_default, v8, "%s: Failed to set persona unique strings for %@/%@ : %@", (uint8_t *)&v9);

}

void sub_100053588()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_1000535FC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 136315906;
  v5 = "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]";
  v6 = 2112;
  v7 = a1;
  v8 = 1024;
  v9 = a3;
  v10 = 2112;
  v11 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Successfully registered the record for %@ from on-disk state after failing to unregister (Operation type %d) due to precondition validation failure %@", (uint8_t *)&v4, 0x26u);
  sub_10004CEE4();
}

void sub_1000536A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to register information for %@ after precondition validation failure : %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_100053718(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)a4 = 136315906;
  *(_QWORD *)(a4 + 4) = "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]";
  *(_WORD *)(a4 + 12) = 2112;
  *(_QWORD *)(a4 + 14) = a1;
  *(_WORD *)(a4 + 22) = 2112;
  *(_QWORD *)(a4 + 24) = a2;
  *(_WORD *)(a4 + 32) = 2112;
  *(_QWORD *)(a4 + 34) = a3;
  sub_10004CEEC((void *)&_mh_execute_header, &_os_log_default, a3, "%s: Failed to unregister record for %@ in domain %@ : %@", (uint8_t *)a4);

}

void sub_10005378C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10004CEC8();
  sub_100027460((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
  sub_10004CEE4();
}

void sub_100053800()
{
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) > 2)
    MOLogWrite(qword_10009E048, 3, "_lock_identifier", CFSTR("Unknown parameter type!"));
  abort();
}

void sub_100053840()
{
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) > 2)
    MOLogWrite(qword_10009E048, 3, "unlock_identifier", CFSTR("Unknown parameter type!"));
  abort();
}

void sub_100053880(void *a1)
{
  void *v1;
  int v2;
  const char *v3;
  __int16 v4;
  void *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v2 = 136315394;
  v3 = "-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]";
  v4 = 2112;
  v5 = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Unexpectedly found no personas in : %@", (uint8_t *)&v2, 0x16u);

}

id objc_msgSend_ICLUninstallRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ICLUninstallRecord");
}

id objc_msgSend_MI_writeAtomicallyToURL_withMode_owner_group_protectionClass_withBarrier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MI_writeAtomicallyToURL:withMode:owner:group:protectionClass:withBarrier:error:");
}

id objc_msgSend_MI_writeToURL_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MI_writeToURL:format:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__addMountPath_withInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addMountPath:withInfo:");
}

id objc_msgSend__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:");
}

id objc_msgSend__appReferenceManagerInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appReferenceManagerInstance");
}

id objc_msgSend__applyDeltaPatchWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyDeltaPatchWithError:");
}

id objc_msgSend__applyParallelPatchProcessingArchiveSection_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyParallelPatchProcessingArchiveSection:withError:");
}

id objc_msgSend__arrayFromPlistRepresentation_key_sub_index_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_arrayFromPlistRepresentation:key:sub:index:withError:");
}

id objc_msgSend__attemptLSUpdateWithDiscoveredStateForIdentity_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attemptLSUpdateWithDiscoveredStateForIdentity:domain:");
}

id objc_msgSend__beginLaunchServicesRegistrationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginLaunchServicesRegistrationWithError:");
}

id objc_msgSend__builtInAppUpgradeFailureError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_builtInAppUpgradeFailureError");
}

id objc_msgSend__bundleIDMapForAppsInDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bundleIDMapForAppsInDirectory:");
}

id objc_msgSend__bundleInDirectory_withBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bundleInDirectory:withBundleID:error:");
}

id objc_msgSend__callBlockAfterDelegateMessagesSend_dispatchBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_callBlockAfterDelegateMessagesSend:dispatchBlock:");
}

id objc_msgSend__captureDataFromStagingRootOrBundle_toContainer_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_captureDataFromStagingRootOrBundle:toContainer:withError:");
}

id objc_msgSend__checkCanInstallWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkCanInstallWithError:");
}

id objc_msgSend__checkEligibilityForEntitlements_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkEligibilityForEntitlements:withError:");
}

id objc_msgSend__clearPendingMountPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearPendingMountPath");
}

id objc_msgSend__commitContainersWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_commitContainersWithError:");
}

id objc_msgSend__containerForIdentifier_contentClass_forPersona_transient_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_containerForIdentifier:contentClass:forPersona:transient:create:error:");
}

id objc_msgSend__containerLinkManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_containerLinkManager");
}

id objc_msgSend__containerProtectionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_containerProtectionManager");
}

id objc_msgSend__countFinalReferences_inBundleContainer_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_countFinalReferences:inBundleContainer:withError:");
}

id objc_msgSend__countReferencesWithType_atBaseURL_count_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_countReferencesWithType:atBaseURL:count:withError:");
}

id objc_msgSend__countTemporaryReferences_inBundleContainer_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_countTemporaryReferences:inBundleContainer:withError:");
}

id objc_msgSend__createJournalEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createJournalEntry");
}

id objc_msgSend__createStorageBaseDirectoryWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createStorageBaseDirectoryWithError:");
}

id objc_msgSend__discoverInstallableWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoverInstallableWithError:");
}

id objc_msgSend__discoverOrderedJournalEntriesInInstanceDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_discoverOrderedJournalEntriesInInstanceDir:");
}

id objc_msgSend__diskImageManagerInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_diskImageManagerInstance");
}

id objc_msgSend__doInitWithContainer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doInitWithContainer:error:");
}

id objc_msgSend__doInstallationForURL_identity_domain_options_operationType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_doInstallationForURL:identity:domain:options:operationType:completion:");
}

id objc_msgSend__enumerateJournaledEntriesContinuingOnFailure_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateJournaledEntriesContinuingOnFailure:withBlock:");
}

id objc_msgSend__enumeratorWithContainerClass_forPersona_isTransient_identifiers_groupIdentifiers_create_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:");
}

id objc_msgSend__extractPackageContainedSymlink_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractPackageContainedSymlink:withError:");
}

id objc_msgSend__finalizeInstallationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finalizeInstallationWithError:");
}

id objc_msgSend__finalizeStagedUpdateForUUID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finalizeStagedUpdateForUUID:completion:");
}

id objc_msgSend__findBundleContainerForToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findBundleContainerForToken:error:");
}

id objc_msgSend__fireCallbackWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fireCallbackWithStatus:");
}

id objc_msgSend__fireCallbackWithStatus_percentComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fireCallbackWithStatus:percentComplete:");
}

id objc_msgSend__freeProfileValidatedAppTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_freeProfileValidatedAppTracker");
}

id objc_msgSend__gatherForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherForIdentifier:");
}

id objc_msgSend__gatherLaunchServicesRegistrationInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherLaunchServicesRegistrationInfoWithError:");
}

id objc_msgSend__getLinkedParentBundleID_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getLinkedParentBundleID:withError:");
}

id objc_msgSend__getMarketplaceEligibilityForWebDistribution_isMarketplace_operationType_isEligible_ineligibilityReason_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMarketplaceEligibilityForWebDistribution:isMarketplace:operationType:isEligible:ineligibilityReason:error:");
}

id objc_msgSend__handleStashMode_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleStashMode:withError:");
}

id objc_msgSend__handleStashOptionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleStashOptionWithError:");
}

id objc_msgSend__helperServiceClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_helperServiceClient");
}

id objc_msgSend__identifiersToLockBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_identifiersToLockBundleIdentifier:error:");
}

id objc_msgSend__initializeMountInfoFromStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeMountInfoFromStorage");
}

id objc_msgSend__installEmbeddedProfilesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installEmbeddedProfilesWithError:");
}

id objc_msgSend__installInstallable_containingSymlink_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installInstallable:containingSymlink:error:");
}

id objc_msgSend__installProvisioningProfilesAtStagingRootWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installProvisioningProfilesAtStagingRootWithError:");
}

id objc_msgSend__installProvisioningProfilesFromUserOptionsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installProvisioningProfilesFromUserOptionsWithError:");
}

id objc_msgSend__installURL_identity_targetingDomain_options_operationType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installURL:identity:targetingDomain:options:operationType:completion:");
}

id objc_msgSend__installationJournalOperationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_installationJournalOperationType");
}

id objc_msgSend__instanceForUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_instanceForUID:");
}

id objc_msgSend__invalidateObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateObject");
}

id objc_msgSend__isKnownPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isKnownPath:");
}

id objc_msgSend__isValidWatchKitApp_withVersion_installableSigningInfo_isSystemAppInstall_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isValidWatchKitApp:withVersion:installableSigningInfo:isSystemAppInstall:error:");
}

id objc_msgSend__journalInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_journalInstance");
}

id objc_msgSend__journalStorageURLForUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_journalStorageURLForUniqueIdentifier:");
}

id objc_msgSend__keychainAccessGroupTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_keychainAccessGroupTracker");
}

id objc_msgSend__launchServicesBundleRecordsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchServicesBundleRecordsWithError:");
}

id objc_msgSend__linkToParentApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_linkToParentApplication:");
}

id objc_msgSend__logOperationCompletionWithStartTime_distributorID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_logOperationCompletionWithStartTime:distributorID:");
}

id objc_msgSend__lsApplicationWorkspaceInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lsApplicationWorkspaceInstance");
}

id objc_msgSend__manifestErrorForKey_sub_index_expected_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_manifestErrorForKey:sub:index:expected:value:");
}

id objc_msgSend__manifestFromPlistRepresentationV1_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_manifestFromPlistRepresentationV1:withError:");
}

id objc_msgSend__manifestPathForBase_withIdentifier_patchType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_manifestPathForBase:withIdentifier:patchType:error:");
}

id objc_msgSend__mapPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mapPath");
}

id objc_msgSend__mostRecentInstanceDirURLWithinURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mostRecentInstanceDirURLWithinURL:");
}

id objc_msgSend__mountInfoForPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_mountInfoForPath:");
}

id objc_msgSend__noLongerPresentAppExtensionDataContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_noLongerPresentAppExtensionDataContainers");
}

id objc_msgSend__numberFromPlistRepresentation_key_sub_index_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_numberFromPlistRepresentation:key:sub:index:withError:");
}

id objc_msgSend__onQueue_addAppIdentifierIfCachedOnContainer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_addAppIdentifierIfCachedOnContainer:error:");
}

id objc_msgSend__onQueue_addPendingLaunchServicesOperation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_addPendingLaunchServicesOperation:error:");
}

id objc_msgSend__onQueue_addReferenceForApplicationIdentifier_bundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_addReferenceForApplicationIdentifier:bundle:error:");
}

id objc_msgSend__onQueue_childrenForParentBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_childrenForParentBundleID:error:");
}

id objc_msgSend__onQueue_deleteLaunchServicesOperationForSerialNumber_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_deleteLaunchServicesOperationForSerialNumber:error:");
}

id objc_msgSend__onQueue_discoverReferencesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_discoverReferencesWithError:");
}

id objc_msgSend__onQueue_isValidLinkForParent_toChild_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_isValidLinkForParent:toChild:error:");
}

id objc_msgSend__onQueue_journalLaunchServicesOperation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_journalLaunchServicesOperation:error:");
}

id objc_msgSend__onQueue_linkedParentBundleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_linkedParentBundleIDs:");
}

id objc_msgSend__onQueue_nextSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_nextSerialNumber");
}

id objc_msgSend__onQueue_refreshPersonaInformationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_refreshPersonaInformationWithError:");
}

id objc_msgSend__onQueue_registerApplicationInfo_onMountPoint_forAppBundleID_domain_personas_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:");
}

id objc_msgSend__onQueue_registerDiscoveredAppEntries_onMountPoint_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_registerDiscoveredAppEntries:onMountPoint:completion:");
}

id objc_msgSend__onQueue_removeParent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_removeParent:error:");
}

id objc_msgSend__onQueue_removePendingLaunchServicesOperationForUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_removePendingLaunchServicesOperationForUUID:");
}

id objc_msgSend__onQueue_removePendingLaunchServicesOperationForUUID_dueToLSSave_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:");
}

id objc_msgSend__onQueue_removeReferenceForBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_removeReferenceForBundle:error:");
}

id objc_msgSend__onQueue_saveMountPaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_saveMountPaths");
}

id objc_msgSend__onQueue_scanApps_returnMapInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_scanApps:returnMapInfo:");
}

id objc_msgSend__onQueue_setLinkedParentBundleIDList_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_setLinkedParentBundleIDList:error:");
}

id objc_msgSend__onQueue_setPersonaUniqueStrings_forAppBundleID_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_setPersonaUniqueStrings:forAppBundleID:inDomain:error:");
}

id objc_msgSend__onQueue_setUninstalledList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_setUninstalledList:");
}

id objc_msgSend__onQueue_uninstalledList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_uninstalledList");
}

id objc_msgSend__onQueue_unregisterAppForBundleID_domain_operationType_precondition_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_unregisterAppForBundleID:domain:operationType:precondition:error:");
}

id objc_msgSend__onQueue_unregisterApplicationsAtMountPoint_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_unregisterApplicationsAtMountPoint:error:");
}

id objc_msgSend__onQueue_updateLinkForParent_toChild_operationType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onQueue_updateLinkForParent:toChild:operationType:error:");
}

id objc_msgSend__operationFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_operationFromURL:error:");
}

id objc_msgSend__performAppClipSpecificValidationForEntitlements_isAppClip_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performAppClipSpecificValidationForEntitlements:isAppClip:withError:");
}

id objc_msgSend__performBrowserAppValidationForEntitlements_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performBrowserAppValidationForEntitlements:error:");
}

id objc_msgSend__performBuiltInAppUpgradeValidationWithSigningInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performBuiltInAppUpgradeValidationWithSigningInfo:error:");
}

id objc_msgSend__performCompanionWatchAppValidationForWatchApp_withVersion_companionAppSigningInfo_frameworks_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performCompanionWatchAppValidationForWatchApp:withVersion:companionAppSigningInfo:frameworks:error:");
}

id objc_msgSend__performInstallationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performInstallationWithError:");
}

id objc_msgSend__performJournaledInstallAsReplay_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performJournaledInstallAsReplay:withError:");
}

id objc_msgSend__performPreflightWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performPreflightWithError:");
}

id objc_msgSend__performVerificationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performVerificationWithError:");
}

id objc_msgSend__performWatchVerificationForSigningInfo_isSystemAppInstall_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performWatchVerificationForSigningInfo:isSystemAppInstall:withError:");
}

id objc_msgSend__populateSigningInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateSigningInfoWithError:");
}

id objc_msgSend__postFlightAppExtensionsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postFlightAppExtensionsWithError:");
}

id objc_msgSend__postFlightInstallationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postFlightInstallationWithError:");
}

id objc_msgSend__preserveExistingPlaceholderAsParallelPlaceholderWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preserveExistingPlaceholderAsParallelPlaceholderWithError:");
}

id objc_msgSend__privateContainerManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_privateContainerManager");
}

id objc_msgSend__promoteKeychainItemsForAppClipWithAppIdentifier_toParentAppWithAppIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promoteKeychainItemsForAppClipWithAppIdentifier:toParentAppWithAppIdentifier:");
}

id objc_msgSend__purgeJournalEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_purgeJournalEntry");
}

id objc_msgSend__reconcileOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reconcileOperations:");
}

id objc_msgSend__reconcileOperations_unregisterMountPoints_registerMountPoints_restartUniqueOperations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reconcileOperations:unregisterMountPoints:registerMountPoints:restartUniqueOperations:");
}

id objc_msgSend__referenceURLForUserWithID_inBundleContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_referenceURLForUserWithID:inBundleContainer:");
}

id objc_msgSend__refreshContainerMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshContainerMetadataWithError:");
}

id objc_msgSend__refreshUUIDForContainer_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshUUIDForContainer:withError:");
}

id objc_msgSend__registerApplicationInfo_onMountPoint_forAppBundleID_domain_personas_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerApplicationInfo:onMountPoint:forAppBundleID:domain:personas:error:");
}

id objc_msgSend__registerInstalledInfo_forAppBundleID_personas_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerInstalledInfo:forAppBundleID:personas:inDomain:error:");
}

id objc_msgSend__registerInstalledInfo_forIdentity_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerInstalledInfo:forIdentity:inDomain:error:");
}

id objc_msgSend__registerUsingDiscoveredInfoForAppIdentity_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerUsingDiscoveredInfoForAppIdentity:inDomain:error:");
}

id objc_msgSend__removeMountPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeMountPath:");
}

id objc_msgSend__removeReferenceAtURL_personaUniqueString_inBundleContainer_wasLastReference_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend__removeReferenceForBundleWithIdentity_linkedToChildren_temporaryReference_removedInfo_wasLastReference_gatherOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeReferenceForBundleWithIdentity:linkedToChildren:temporaryReference:removedInfo:wasLastReference:gatherOptions:error:");
}

id objc_msgSend__setBundleMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBundleMetadataWithError:");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend__setLaunchWarningDataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLaunchWarningDataWithError:");
}

id objc_msgSend__setLinkageInBundleMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLinkageInBundleMetadata:error:");
}

id objc_msgSend__setPendingMountPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPendingMountPath:");
}

id objc_msgSend__setUpLookAsideAtDirAndFindMostRecentInstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setUpLookAsideAtDirAndFindMostRecentInstance:");
}

id objc_msgSend__setupPackageStateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupPackageStateWithError:");
}

id objc_msgSend__sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sharedConnection");
}

id objc_msgSend__sharedContainerManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sharedContainerManager");
}

id objc_msgSend__shouldContinueAfterCheckingAttemptCountInDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldContinueAfterCheckingAttemptCountInDir:");
}

id objc_msgSend__stageURL_identity_domain_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stageURL:identity:domain:options:completion:");
}

id objc_msgSend__storageURLForOperationSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storageURLForOperationSerialNumber:");
}

id objc_msgSend__stringFromPlistRepresentation_key_sub_index_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:");
}

id objc_msgSend__synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend__systemAppState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemAppState");
}

id objc_msgSend__takeOwnershipOfInstallableContainingSymlink_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_takeOwnershipOfInstallableContainingSymlink:error:");
}

id objc_msgSend__targetsFromPlistRepresentationV1_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_targetsFromPlistRepresentationV1:withError:");
}

id objc_msgSend__temporaryReferenceURLForUserWithID_inBundleContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_temporaryReferenceURLForUserWithID:inBundleContainer:");
}

id objc_msgSend__uninstallBundleWithIdentity_linkedToChildren_waitForDeletion_uninstallReason_temporaryReference_deleteDataContainers_wasLastReference_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:");
}

id objc_msgSend__uninstallIdentities_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uninstallIdentities:withOptions:completion:");
}

id objc_msgSend__uninstallUserStuffForIdentity_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uninstallUserStuffForIdentity:error:");
}

id objc_msgSend__uninstalledAppList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uninstalledAppList");
}

id objc_msgSend__updateContainerStatePostCommit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateContainerStatePostCommit");
}

id objc_msgSend__updateJournalPhaseTo_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateJournalPhaseTo:withError:");
}

id objc_msgSend__updateReferenceAtURL_byAddingPersonaUniqueString_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend__updateReferenceAtURL_byRemovingPersonaUniqueString_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend__updateReferencesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateReferencesWithError:");
}

id objc_msgSend__validateAndEstablishLinkToParentContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateAndEstablishLinkToParentContainer:");
}

id objc_msgSend__validateAppManagementDomainForSigningInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateAppManagementDomainForSigningInfo:error:");
}

id objc_msgSend__validateAppWithBundleID_isNotInstalledInDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateAppWithBundleID:isNotInstalledInDomain:error:");
}

id objc_msgSend__validateApplicationIdentifierForNewBundleSigningInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateApplicationIdentifierForNewBundleSigningInfo:error:");
}

id objc_msgSend__validateArgsForMethodWithName_bundleIdentifier_data_optionalOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:");
}

id objc_msgSend__validateBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateBundle:error:");
}

id objc_msgSend__validateBundle_validatingResources_performingOnlineAuthorization_checkingTrustCacheIfApplicable_allowingFreeProfileValidation_skippingProfileIDValidation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateBundle:validatingResources:performingOnlineAuthorization:checkingTrustCacheIfApplicable:allowingFreeProfileValidation:skippingProfileIDValidation:error:");
}

id objc_msgSend__validateCompanionAppStateInWatchKitApp_withVersion_isSystemAppInstall_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateCompanionAppStateInWatchKitApp:withVersion:isSystemAppInstall:error:");
}

id objc_msgSend__validateITunesMetadataOptionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateITunesMetadataOptionWithError:");
}

id objc_msgSend__validateInstallRequestForURL_identity_targetingDomain_options_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateInstallRequestForURL:identity:targetingDomain:options:withError:");
}

id objc_msgSend__validateLinkedParentForSigningInfo_appManagementDomainValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateLinkedParentForSigningInfo:appManagementDomainValue:error:");
}

id objc_msgSend__validateSinfsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateSinfsWithError:");
}

id objc_msgSend__validateiTunesMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateiTunesMetadataWithError:");
}

id objc_msgSend__verifyBundleMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_verifyBundleMetadataWithError:");
}

id objc_msgSend__verifyPluginKitPlugins_extensionKitExtensions_inWatchKit2App_checkAppexSignatures_checkFrameworkSignature_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_verifyPluginKitPlugins:extensionKitExtensions:inWatchKit2App:checkAppexSignatures:checkFrameworkSignature:error:");
}

id objc_msgSend__writeData_toFile_inContainerAtURL_legacyErrorString_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeData:toFile:inContainerAtURL:legacyErrorString:error:");
}

id objc_msgSend__writeJournalEntryWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeJournalEntryWithError:");
}

id objc_msgSend__writeLaunchServicesOperation_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeLaunchServicesOperation:toURL:error:");
}

id objc_msgSend__writeLockBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeLockBundle:error:");
}

id objc_msgSend__writeLockIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeLockIdentifiers:");
}

id objc_msgSend__writeOptionsDataToBundle_orContainer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeOptionsDataToBundle:orContainer:error:");
}

id objc_msgSend_addBarrierBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBarrierBlock:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIdentifier:");
}

id objc_msgSend_addIdentifier_withState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIdentifier:withState:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addReferenceForApplicationIdentifier_bundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addReferenceForApplicationIdentifier:bundle:error:");
}

id objc_msgSend_addReferenceForIdentity_inDomain_forUserWithID_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addReferenceForIdentity:inDomain:forUserWithID:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_addReferenceForUserWithID_personaUniqueString_byRemovingTemporaryReference_inBundleContainer_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_addReferencesForBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addReferencesForBundle:error:");
}

id objc_msgSend_addTemporaryReferenceForIdentity_inDomain_forUserWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTemporaryReferenceForIdentity:inDomain:forUserWithID:error:");
}

id objc_msgSend_addTemporaryReferenceForUserWithID_personaUniqueString_inBundleContainer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:error:");
}

id objc_msgSend_allContainersForAllPersonasForIdentifier_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allContainersForAllPersonasForIdentifier:options:error:");
}

id objc_msgSend_allContainersForIdentifier_persona_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allContainersForIdentifier:persona:options:error:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allUsers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowDeletableSystemApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowDeletableSystemApps");
}

id objc_msgSend_allowLocalProvisioned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowLocalProvisioned");
}

id objc_msgSend_allowPatchWithoutSinf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowPatchWithoutSinf");
}

id objc_msgSend_allowsInternalSecurityPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsInternalSecurityPolicy");
}

id objc_msgSend_alternateIconName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateIconName");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appBundleContainerForIdentifier_inDomain_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleContainerForIdentifier:inDomain:withError:");
}

id objc_msgSend_appBundleContainerWithIdentifier_createIfNeeded_created_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleContainerWithIdentifier:createIfNeeded:created:error:");
}

id objc_msgSend_appExtensionBundles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appExtensionBundles");
}

id objc_msgSend_appExtensionBundlesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appExtensionBundlesWithError:");
}

id objc_msgSend_appExtensionDataContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appExtensionDataContainers");
}

id objc_msgSend_appReferencesEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appReferencesEnabled");
}

id objc_msgSend_applyStagedUpdateForUUID_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyStagedUpdateForUUID:withError:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attemptCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptCount");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_autoInstallOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoInstallOverride");
}

id objc_msgSend_backedUpStateDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backedUpStateDirectory");
}

id objc_msgSend_bestEffortRollbackSinfData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestEffortRollbackSinfData:");
}

id objc_msgSend_bestEffortRollbackiTunesMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestEffortRollbackiTunesMetadata:error:");
}

id objc_msgSend_blockArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockArray");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_builtInApplicationBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "builtInApplicationBundleIDs");
}

id objc_msgSend_builtInFrameworkBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "builtInFrameworkBundleIDs");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleContainer");
}

id objc_msgSend_bundleForURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForURL:error:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIDs");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleMetadataWithError:");
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleName");
}

id objc_msgSend_bundleRecordArrayToInfoDictionaryArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordArrayToInfoDictionaryArray:");
}

id objc_msgSend_bundleRecordWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordWithError:");
}

id objc_msgSend_bundleRecordsToRegister(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordsToRegister");
}

id objc_msgSend_bundleShortVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleShortVersion");
}

id objc_msgSend_bundleShortVersionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleShortVersionString");
}

id objc_msgSend_bundleSigningInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleSigningInfo");
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleType");
}

id objc_msgSend_bundleTypeDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleTypeDescription");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleVersion");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachesDirectory");
}

id objc_msgSend_calcDynamic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calcDynamic");
}

id objc_msgSend_calcShared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calcShared");
}

id objc_msgSend_calcStatic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calcStatic");
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callStackSymbols");
}

id objc_msgSend_captureBundleByMoving_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureBundleByMoving:withError:");
}

id objc_msgSend_captureStoreDataFromDirectory_doCopy_failureIsFatal_includeiTunesMetadata_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:");
}

id objc_msgSend_cfBundleShortVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cfBundleShortVersion");
}

id objc_msgSend_cfBundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cfBundleVersion");
}

id objc_msgSend_checkCapabilities_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkCapabilities:withOptions:error:");
}

id objc_msgSend_childrenForParentBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childrenForParentBundleID:error:");
}

id objc_msgSend_cleanUpJournaledDataOnDiskWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpJournaledDataOnDiskWithError:");
}

id objc_msgSend_cleanUpgradesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUpgradesWithError:");
}

id objc_msgSend_clearIsRunningInTestModeForProcessWithPID_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearIsRunningInTestModeForProcessWithPID:withError:");
}

id objc_msgSend_clearStagedUpdateContainerStatusWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearStagedUpdateContainerStatusWithError:");
}

id objc_msgSend_clearTestFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearTestFlags:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client");
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientName");
}

id objc_msgSend_cloneContentFromStashedBundleContainer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloneContentFromStashedBundleContainer:error:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_codeSignatureVerificationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeSignatureVerificationState");
}

id objc_msgSend_codeSignerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeSignerType");
}

id objc_msgSend_codeSigningEnforcementIsDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeSigningEnforcementIsDisabled");
}

id objc_msgSend_codeSigningInfoByValidatingResources_performingOnlineAuthorization_ignoringCachedSigningInfo_checkingTrustCacheIfApplicable_skippingProfileIDValidation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:");
}

id objc_msgSend_commandLineArgs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandLineArgs");
}

id objc_msgSend_companionAppIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionAppIdentifier");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_compatibilityLinkDestination(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compatibilityLinkDestination");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_containerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerClass");
}

id objc_msgSend_containerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerURL");
}

id objc_msgSend_containerWithIdentifier_forPersona_ofContentClass_createIfNeeded_created_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:");
}

id objc_msgSend_containersWithClass_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containersWithClass:error:");
}

id objc_msgSend_containersWithClass_personaUniqueString_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containersWithClass:personaUniqueString:error:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyItemIfExistsAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemIfExistsAtURL:toURL:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_coreServicesAppBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreServicesAppBundleIDToInfoMap");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAppSnapshotWithBundleID_snapshotToURL_onlyV1AppIfPresent_placeholderOnly_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:completion:");
}

id objc_msgSend_createAppSnapshotWithBundleID_snapshotToURL_onlyV1AppIfPresent_placeholderOnly_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:withError:");
}

id objc_msgSend_createDirectoryAtURL_mode_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:mode:withError:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_mode_class_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_mode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:mode:error:");
}

id objc_msgSend_createSafeHarborWithIdentifier_forPersona_containerType_andMigrateDataFrom_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:");
}

id objc_msgSend_createSafeHarborWithIdentifier_forPersona_containerType_andMigrateDataFrom_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:withError:");
}

id objc_msgSend_createSnapshotWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSnapshotWithError:");
}

id objc_msgSend_createTemporaryDirectoryInDirectoryURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTemporaryDirectoryInDirectoryURL:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_currentUserDataDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserDataDirectory");
}

id objc_msgSend_currentUserJournalStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserJournalStorageBaseURL");
}

id objc_msgSend_currentUserLaunchServicesOperationLookAsideStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserLaunchServicesOperationLookAsideStorageBaseURL");
}

id objc_msgSend_currentUserLaunchServicesOperationStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserLaunchServicesOperationStorageBaseURL");
}

id objc_msgSend_dataContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainer");
}

id objc_msgSend_dataContainer_ofContainerType_isEmpty_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainer:ofContainerType:isEmpty:error:");
}

id objc_msgSend_dataContainerCreatingIfNeeded_forPersona_makeLive_created_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:");
}

id objc_msgSend_dataContainerForExecutableBundle_forPersona_createIfNeeded_temporary_created_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:");
}

id objc_msgSend_dataContainerForPersona_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainerForPersona:error:");
}

id objc_msgSend_dataDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataDirectory");
}

id objc_msgSend_dataFromPlistRepresentation_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataFromPlistRepresentation:withError:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_debugDescriptionForItemAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescriptionForItemAtURL:");
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegateMessageDeliveryCompleteWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateMessageDeliveryCompleteWithError:");
}

id objc_msgSend_destURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destURL");
}

id objc_msgSend_developerDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "developerDirectories");
}

id objc_msgSend_deviceHasPersonas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceHasPersonas");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_diskImageAppInfoForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskImageAppInfoForBundleID:");
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskUsage");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributorID");
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributorInfo");
}

id objc_msgSend_distributorIsFirstPartyApple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributorIsFirstPartyApple");
}

id objc_msgSend_distributorNameForCurrentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributorNameForCurrentLocale");
}

id objc_msgSend_distributorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distributorType");
}

id objc_msgSend_doesNotHaveBundleContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotHaveBundleContainer");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_driverKitExtensionBundles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driverKitExtensionBundles");
}

id objc_msgSend_driverKitExtensionBundlesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driverKitExtensionBundlesWithError:");
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveGroupIdentifier");
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserIdentifier");
}

id objc_msgSend_eligibilityOperationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eligibilityOperationType");
}

id objc_msgSend_embeddedWatchApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedWatchApp");
}

id objc_msgSend_emptyPrecondition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emptyPrecondition");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlements");
}

id objc_msgSend_entryForBundle_inContainer_forPersona_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryForBundle:inContainer:forPersona:withError:");
}

id objc_msgSend_enumerateAppDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateAppDictionary:error:");
}

id objc_msgSend_enumerateAppExtensionsInBundle_forPersona_updatingAppExtensionParentID_ensureAppExtensionsAreExecutable_installProfiles_error_enumerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:");
}

id objc_msgSend_enumerateContainersWithClass_forPersona_isTransient_identifiers_groupIdentifiers_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:");
}

id objc_msgSend_enumerateDylibsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateDylibsWithBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateURLsForItemsInDirectoryAtURL_ignoreSymlinks_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executableExistsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executableExistsWithError:");
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executableURL");
}

id objc_msgSend_existingBundleContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingBundleContainer");
}

id objc_msgSend_existingBundleShortVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingBundleShortVersion");
}

id objc_msgSend_existingBundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingBundleVersion");
}

id objc_msgSend_extensionKitBundlesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionKitBundlesWithError:");
}

id objc_msgSend_extensionPointIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionPointIdentifier");
}

id objc_msgSend_extractZipArchiveAtURL_toURL_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractZipArchiveAtURL:toURL:withError:");
}

id objc_msgSend_failWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failWithError:");
}

id objc_msgSend_fetchInfoForBundle_forPersona_inContainer_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchInfoForBundle:forPersona:inContainer:withError:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_finalizeContainersWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeContainersWithError:");
}

id objc_msgSend_finalizeInstallationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeInstallationWithError:");
}

id objc_msgSend_finalizeTemporaryReference_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeTemporaryReference:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_finalizeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeWithError:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDecoding");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fmWrite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fmWrite");
}

id objc_msgSend_frameworkBundles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameworkBundles");
}

id objc_msgSend_frameworkBundlesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameworkBundlesWithError:");
}

id objc_msgSend_gatherUsageInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherUsageInfoWithError:");
}

id objc_msgSend_geoJSONData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "geoJSONData");
}

id objc_msgSend_getEligibilityForDomain_answer_source_status_context_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEligibilityForDomain:answer:source:status:context:error:");
}

id objc_msgSend_getLinkedParent_forChild_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLinkedParent:forChild:error:");
}

id objc_msgSend_getSinfDataType_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSinfDataType:withError:");
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gid");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasExecutableSliceForCPUType_subtype_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasExecutableSliceForCPUType:subtype:error:");
}

id objc_msgSend_hasInternalContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasInternalContent");
}

id objc_msgSend_hasNoConflictsWithOtherInstalledEntitiesForSigningInfo_forPersona_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:forPersona:error:");
}

id objc_msgSend_hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:");
}

id objc_msgSend_hasParallelPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasParallelPlaceholder");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hostVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostVersion");
}

id objc_msgSend_iTunesArtworkData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesArtworkData");
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesMetadata");
}

id objc_msgSend_iTunesMetadataURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesMetadataURL");
}

id objc_msgSend_iTunesMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesMetadataWithError:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierLocked");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiers");
}

id objc_msgSend_identifiersMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiersMap");
}

id objc_msgSend_identities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identities");
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identity");
}

id objc_msgSend_infoPlistHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoPlistHash");
}

id objc_msgSend_infoPlistHashAlgorithm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoPlistHashAlgorithm");
}

id objc_msgSend_infoPlistSubset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoPlistSubset");
}

id objc_msgSend_infoValueForKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoValueForKey:error:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initForAppIdentity_options_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForAppIdentity:options:forClient:");
}

id objc_msgSend_initForInstallationDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForInstallationDomain:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAppExtensionBundle_inBundleIdentifier_dataContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAppExtensionBundle:inBundleIdentifier:dataContainer:");
}

id objc_msgSend_initWithBundle_inStagingRoot_packageFormat_identity_domain_installOptions_existingBundleContainer_operationType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:");
}

id objc_msgSend_initWithBundle_inStagingRoot_packageFormat_identity_domain_installOptions_manifestURL_existingBundleContainer_patchType_operationType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:");
}

id objc_msgSend_initWithBundleContainer_dataContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleContainer:dataContainer:");
}

id objc_msgSend_initWithBundleContainer_forPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleContainer:forPersona:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithBundleID_domain_personas_mountPoint_operationUUID_serialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:domain:personas:mountPoint:operationUUID:serialNumber:");
}

id objc_msgSend_initWithBundleID_domain_personas_registrationUUID_serialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:domain:personas:registrationUUID:serialNumber:");
}

id objc_msgSend_initWithBundleID_domain_registrationUUID_serialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:domain:registrationUUID:serialNumber:");
}

id objc_msgSend_initWithBundleID_persona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:persona:");
}

id objc_msgSend_initWithBundleID_snapshotTo_onlyV1AppIfPresent_placeholderOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleID:snapshotTo:onlyV1AppIfPresent:placeholderOnly:");
}

id objc_msgSend_initWithBundleURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleURL:error:");
}

id objc_msgSend_initWithCFBundleVersion_cfBundleShortVersion_bundleIdentifier_uiSupportedDevices_infoPlistHash_infoPlistHashAlgorithm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCFBundleVersion:cfBundleShortVersion:bundleIdentifier:uiSupportedDevices:infoPlistHash:infoPlistHashAlgorithm:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCommandLineArgs_targets_toolVersion_toolArch_toolBuiltWithSDKVersion_toolBuiltWithXcodeVersion_hostVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCommandLineArgs:targets:toolVersion:toolArch:toolBuiltWithSDKVersion:toolBuiltWithXcodeVersion:hostVersion:");
}

id objc_msgSend_initWithContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainer:");
}

id objc_msgSend_initWithContainer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainer:error:");
}

id objc_msgSend_initWithDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithIdentifiers_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifiers:options:");
}

id objc_msgSend_initWithIdentitites_options_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentitites:options:forClient:");
}

id objc_msgSend_initWithIdentity_bundleContainer_existingBundleContainer_installationDomain_operationType_installOptions_bundleSigningInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentity:bundleContainer:existingBundleContainer:installationDomain:operationType:installOptions:bundleSigningInfo:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMountPoint_operationUUID_serialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMountPoint:operationUUID:serialNumber:");
}

id objc_msgSend_initWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:reason:userInfo:");
}

id objc_msgSend_initWithOptions_enumerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:enumerator:");
}

id objc_msgSend_initWithOptions_forTargetUID_enumerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:forTargetUID:enumerator:");
}

id objc_msgSend_initWithPersonaString_personaType_associatedBundleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersonaString:personaType:associatedBundleIDs:");
}

id objc_msgSend_initWithReferenceUUID_identity_domain_uid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReferenceUUID:identity:domain:uid:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithSource_byPreservingFullInfoPlist_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSource:byPreservingFullInfoPlist:error:");
}

id objc_msgSend_initWithToken_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithToken:options:error:");
}

id objc_msgSend_initWithUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUID:");
}

id objc_msgSend_initWithURL_identity_domain_options_operationType_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:identity:domain:options:operationType:forClient:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_insecureCachedAppIdentifierIfAppClipForBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insecureCachedAppIdentifierIfAppClipForBundle:error:");
}

id objc_msgSend_insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:error:");
}

id objc_msgSend_installEmbeddedProvisioningProfileWithProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installEmbeddedProvisioningProfileWithProgress:");
}

id objc_msgSend_installIntent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installIntent");
}

id objc_msgSend_installMacStyleEmbeddedProvisioningProfileWithProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installMacStyleEmbeddedProvisioningProfileWithProgress:");
}

id objc_msgSend_installOperationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installOperationType");
}

id objc_msgSend_installOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installOptions");
}

id objc_msgSend_installQOSOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installQOSOverride");
}

id objc_msgSend_installSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installSessionID");
}

id objc_msgSend_installTargetType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installTargetType");
}

id objc_msgSend_installTypeSummaryString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installTypeSummaryString");
}

id objc_msgSend_installURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installURL");
}

id objc_msgSend_installationBlacklist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationBlacklist");
}

id objc_msgSend_installationDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationDomain");
}

id objc_msgSend_installationIdentitySettingIfNotSet_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationIdentitySettingIfNotSet:withError:");
}

id objc_msgSend_installdLibraryPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installdLibraryPath");
}

id objc_msgSend_installdPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installdPath");
}

id objc_msgSend_installedDistributorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedDistributorID");
}

id objc_msgSend_installerForURL_identity_domain_options_operationType_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installerForURL:identity:domain:options:operationType:forClient:");
}

id objc_msgSend_instanceForCurrentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceForCurrentUser");
}

id objc_msgSend_instanceForSystemSharedContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceForSystemSharedContent");
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceID");
}

id objc_msgSend_instanceStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instanceStorageBaseURL");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalAppBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalAppBundleIDToInfoMap");
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalQueue");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateCache");
}

id objc_msgSend_isApplicableToCurrentDeviceFamilyWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicableToCurrentDeviceFamilyWithError:");
}

id objc_msgSend_isApplicableToCurrentOSVersionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicableToCurrentOSVersionWithError:");
}

id objc_msgSend_isApplicableToOSVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicableToOSVersion:error:");
}

id objc_msgSend_isApplicableToOSVersionEarlierThan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicableToOSVersionEarlierThan:");
}

id objc_msgSend_isDataContainerEmpty_ofContainerType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataContainerEmpty:ofContainerType:completion:");
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataSeparatedPersona");
}

id objc_msgSend_isDeveloperInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeveloperInstall");
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnterprisePersona");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExtensionBasedWatchKitApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExtensionBasedWatchKitApp");
}

id objc_msgSend_isExtensionlessWatchKitApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExtensionlessWatchKitApp");
}

id objc_msgSend_isGrandfatheredNonContainerizedForSigningInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGrandfatheredNonContainerizedForSigningInfo:");
}

id objc_msgSend_isLastReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLastReference");
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLaunchProhibited");
}

id objc_msgSend_isLinked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLinked");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersonalPersona");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isPlaceholderInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholderInstall");
}

id objc_msgSend_isRemovableSystemApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRemovableSystemApp");
}

id objc_msgSend_isRunningInTestMode_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningInTestMode:outError:");
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSharediPad");
}

id objc_msgSend_isStagedUpdateContainer_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStagedUpdateContainer:withError:");
}

id objc_msgSend_isSystemAppInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemAppInstall");
}

id objc_msgSend_isSystemPersona(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemPersona");
}

id objc_msgSend_isTransient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTransient");
}

id objc_msgSend_isUserInitiated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserInitiated");
}

id objc_msgSend_isWatchApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWatchApp");
}

id objc_msgSend_isWatchKitExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWatchKitExtension");
}

id objc_msgSend_isWatchOnlyApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWatchOnlyApp");
}

id objc_msgSend_itemDoesNotExistAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemDoesNotExistAtURL:");
}

id objc_msgSend_itemDoesNotExistOrIsNotDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemDoesNotExistOrIsNotDirectoryAtURL:");
}

id objc_msgSend_itemExistsAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemExistsAtURL:");
}

id objc_msgSend_itemIsFileAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemIsFileAtURL:error:");
}

id objc_msgSend_journalEntry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "journalEntry");
}

id objc_msgSend_journalEntryClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "journalEntryClasses");
}

id objc_msgSend_journalEntryForUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "journalEntryForUniqueIdentifier:");
}

id objc_msgSend_journalEntryID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "journalEntryID");
}

id objc_msgSend_journalPhase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "journalPhase");
}

id objc_msgSend_journalStorageBase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "journalStorageBase");
}

id objc_msgSend_journalStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "journalStorageBaseURL");
}

id objc_msgSend_lastBuildInfoFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastBuildInfoFileURL");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchServicesBundleRecordsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchServicesBundleRecordsWithError:");
}

id objc_msgSend_launchServicesOperationLookAsideStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchServicesOperationLookAsideStorageBaseURL");
}

id objc_msgSend_launchServicesOperationStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchServicesOperationStorageBaseURL");
}

id objc_msgSend_launchWarningData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchWarningData");
}

id objc_msgSend_legacyRecordDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacyRecordDictionary");
}

id objc_msgSend_legacySinfInfoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacySinfInfoDictionary");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_linkChild_toParent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkChild:toParent:error:");
}

id objc_msgSend_linkToParentBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkToParentBundleID");
}

id objc_msgSend_linkedChildBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkedChildBundleIDs");
}

id objc_msgSend_linkedParentBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "linkedParentBundleID");
}

id objc_msgSend_listAllPersonaAttributesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listAllPersonaAttributesWithError:");
}

id objc_msgSend_listQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listQueue");
}

id objc_msgSend_localSigningIsUnrestricted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localSigningIsUnrestricted");
}

id objc_msgSend_lockedIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockedIdentifiers");
}

id objc_msgSend_logDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logDirectory");
}

id objc_msgSend_logStep_byParty_phase_success_forBundleID_persona_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logStep:byParty:phase:success:forBundleID:persona:description:");
}

id objc_msgSend_lookAsideStorageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookAsideStorageBaseURL");
}

id objc_msgSend_lsInstallType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lsInstallType");
}

id objc_msgSend_lsInstallTypeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lsInstallTypeWithError:");
}

id objc_msgSend_lsRegisterQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lsRegisterQueue");
}

id objc_msgSend_makeAndSetNewInstallationIdentityWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeAndSetNewInstallationIdentityWithError:");
}

id objc_msgSend_makeContainerLiveReplacingContainer_reason_waitForDeletion_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:");
}

id objc_msgSend_makeContainerLiveWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeContainerLiveWithError:");
}

id objc_msgSend_makeExecutableWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeExecutableWithError:");
}

id objc_msgSend_makeStagedBackgroundUpdateLive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeStagedBackgroundUpdateLive:");
}

id objc_msgSend_makeSymlinkFromAppDataContainerToBundleForIdentifier_forPersona_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:completion:");
}

id objc_msgSend_makeSymlinkFromAppDataContainerToBundleForIdentifier_forPersona_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:withError:");
}

id objc_msgSend_manifestFromFileURL_fmRead_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestFromFileURL:fmRead:withError:");
}

id objc_msgSend_manifestFromPlistRepresentation_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestFromPlistRepresentation:withError:");
}

id objc_msgSend_manifestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestURL");
}

id objc_msgSend_manifestVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestVersion");
}

id objc_msgSend_markContainerAsStagedUpdateContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markContainerAsStagedUpdateContainer:");
}

id objc_msgSend_materializeIntoBundleDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "materializeIntoBundleDirectory:error:");
}

id objc_msgSend_mcmContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcmContainer");
}

id objc_msgSend_migrateMobileContentWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMobileContentWithCompletion:");
}

id objc_msgSend_migrateMobileContentWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateMobileContentWithError:");
}

id objc_msgSend_migrationPlistURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrationPlistURL");
}

id objc_msgSend_minimumWatchOSVersionIsPreV6(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumWatchOSVersionIsPreV6");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_modificationDateForURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modificationDateForURL:error:");
}

id objc_msgSend_mountInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountInfo");
}

id objc_msgSend_mountInfoAccessQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountInfoAccessQueue");
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountPoint");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_moveItemInStagingDirectory_atRelativePath_toDestinationURL_onBehalfOf_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:");
}

id objc_msgSend_moveItemInStagingDirectory_atRelativePath_toDestinationURL_onBehalfOf_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:withError:");
}

id objc_msgSend_multiPersonaSADAppBundleIDsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiPersonaSADAppBundleIDsWithError:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nSimultaneousInstallations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nSimultaneousInstallations");
}

id objc_msgSend_needsDataContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsDataContainer");
}

id objc_msgSend_needsSinf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsSinf");
}

id objc_msgSend_noLongerPresentAppExtensionDataContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noLongerPresentAppExtensionDataContainers");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
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

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onlyHasExecutableSlicesForPlatform_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onlyHasExecutableSlicesForPlatform:error:");
}

id objc_msgSend_onlyV1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onlyV1");
}

id objc_msgSend_operationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationType");
}

id objc_msgSend_operationUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationUUID");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_packageFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packageFormat");
}

id objc_msgSend_parallelPlaceholderURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parallelPlaceholderURL");
}

id objc_msgSend_parentBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentBundleID");
}

id objc_msgSend_parentToLinkedChildrenMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentToLinkedChildrenMap");
}

id objc_msgSend_patchType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patchType");
}

id objc_msgSend_patchTypeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patchTypeName");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pendingMountPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingMountPath");
}

id objc_msgSend_pendingOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingOperations");
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentComplete");
}

id objc_msgSend_performGatherWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performGatherWithError:");
}

id objc_msgSend_performInstallationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performInstallationWithError:");
}

id objc_msgSend_performLaunchServicesRegistrationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performLaunchServicesRegistrationWithError:");
}

id objc_msgSend_performPreflightWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performPreflightWithError:");
}

id objc_msgSend_performRevertWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRevertWithError:");
}

id objc_msgSend_performUninstallationByRevokingTemporaryReference_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performUninstallationByRevokingTemporaryReference:error:");
}

id objc_msgSend_performUninstallationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performUninstallationWithError:");
}

id objc_msgSend_performVerificationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performVerificationWithError:");
}

id objc_msgSend_personaAttributesMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaAttributesMap");
}

id objc_msgSend_personaGenerationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaGenerationIdentifier");
}

id objc_msgSend_personaGenerationIdentifierWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaGenerationIdentifierWithError:");
}

id objc_msgSend_personaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaType");
}

id objc_msgSend_personaTypeForPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaTypeForPersonaUniqueString:");
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaUniqueString");
}

id objc_msgSend_personaUniqueStrings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaUniqueStrings");
}

id objc_msgSend_personaUniqueStringsForAppWithBundleID_domain_forUserWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:");
}

id objc_msgSend_personaUniqueStringsForAppWithBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaUniqueStringsForAppWithBundleID:error:");
}

id objc_msgSend_personas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personas");
}

id objc_msgSend_placeholderOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderOnly");
}

id objc_msgSend_plistRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistRepresentation");
}

id objc_msgSend_plistRepresentationFromFileURL_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plistRepresentationFromFileURL:withError:");
}

id objc_msgSend_pluginKitBundlesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginKitBundlesWithError:");
}

id objc_msgSend_postFlightInstallationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postFlightInstallationWithError:");
}

id objc_msgSend_preflightAndPatchTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightAndPatchTime");
}

id objc_msgSend_preflightLinkingChild_toParent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightLinkingChild:toParent:error:");
}

id objc_msgSend_preflightUninstalledMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightUninstalledMap");
}

id objc_msgSend_preservePlaceholderAsParallel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preservePlaceholderAsParallel");
}

id objc_msgSend_primaryPersonaString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryPersonaString");
}

id objc_msgSend_privateAppBundleContainerWithIdentifier_createIfNeeded_created_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_profileValidationType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileValidationType");
}

id objc_msgSend_progressBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressBlock");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_provisioningProfileInstallFailureIsFatal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisioningProfileInstallFailureIsFatal");
}

id objc_msgSend_provisioningProfiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provisioningProfiles");
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purge");
}

id objc_msgSend_purgeContentWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeContentWithError:");
}

id objc_msgSend_purgeJournalEntry_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeJournalEntry:withError:");
}

id objc_msgSend_purgeTransientBundleContainersWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeTransientBundleContainersWithError:");
}

id objc_msgSend_q(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "q");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_realPathForURL_allowNonExistentPathComponents_isDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:");
}

id objc_msgSend_receipt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receipt");
}

id objc_msgSend_reconcile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reconcile");
}

id objc_msgSend_recordPromise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordPromise");
}

id objc_msgSend_referenceMetadataFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceMetadataFromURL:error:");
}

id objc_msgSend_referenceStorageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referenceStorageURL");
}

id objc_msgSend_referencesForIdentifier_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referencesForIdentifier:inDomain:error:");
}

id objc_msgSend_refs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refs");
}

id objc_msgSend_regenerateDirectoryUUIDWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regenerateDirectoryUUIDWithError:");
}

id objc_msgSend_registerApplicationForRebuildWithInfoDictionaries_requestContext_registrationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerApplicationForRebuildWithInfoDictionaries:requestContext:registrationError:");
}

id objc_msgSend_registerContainerizedApplicationWithInfoDictionaries_operationUUID_requestContext_saveObserver_registrationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerContainerizedApplicationWithInfoDictionaries:operationUUID:requestContext:saveObserver:registrationError:");
}

id objc_msgSend_registerContentsAtMountPoint_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerContentsAtMountPoint:completion:");
}

id objc_msgSend_registerInstalledInfo_forAppBundleID_personas_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerInstalledInfo:forAppBundleID:personas:inDomain:error:");
}

id objc_msgSend_registerInstalledInfo_forIdentity_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerInstalledInfo:forIdentity:inDomain:error:");
}

id objc_msgSend_registerInstalledInfo_onMountPoint_forAppBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerInstalledInfo:onMountPoint:forAppBundleID:error:");
}

id objc_msgSend_registerInstalledInfoForBuiltInAppAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerInstalledInfoForBuiltInAppAtURL:error:");
}

id objc_msgSend_registerSafeHarborAtURL_withOptions_forIdentifier_forPersona_ofType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerSafeHarborAtURL:withOptions:forIdentifier:forPersona:ofType:error:");
}

id objc_msgSend_registerUsingDiscoveredInformationForAppBundleID_inDomain_resultingRecordPromise_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:");
}

id objc_msgSend_registrationStatePreconditionForBundleWithIdentifier_placeholderInstalled_fullApplicationInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registrationStatePreconditionForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:");
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePath");
}

id objc_msgSend_releaseTerminationAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseTerminationAssertion");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:");
}

id objc_msgSend_removeContainers_waitForDeletion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeContainers:waitForDeletion:error:");
}

id objc_msgSend_removeIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIdentifiers:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeItemAtURL_keepParent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:keepParent:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeParent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeParent:error:");
}

id objc_msgSend_removeReferenceForBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeReferenceForBundle:error:");
}

id objc_msgSend_removeReferenceForIdentity_inDomain_forUserWithID_wasLastReference_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeReferenceForIdentity:inDomain:forUserWithID:wasLastReference:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_removeReferenceForUserWithID_personaUniqueString_inBundleContainer_wasLastReference_resultingPersonaUniqueStrings_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:");
}

id objc_msgSend_removeReferencesForBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeReferencesForBundle:error:");
}

id objc_msgSend_removeSafeHarborWithIdentifier_forPersona_ofType_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSafeHarborWithIdentifier:forPersona:ofType:options:error:");
}

id objc_msgSend_removeSinf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSinf");
}

id objc_msgSend_removeTemporaryReferenceForUserWithID_personaUniqueString_inBundleContainer_wasLastReference_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:");
}

id objc_msgSend_removeUnderlyingContainerWaitingForDeletion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUnderlyingContainerWaitingForDeletion:error:");
}

id objc_msgSend_replicateRootSinfWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replicateRootSinfWithError:");
}

id objc_msgSend_reportProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportProgress:");
}

id objc_msgSend_reregisterContentsAtMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reregisterContentsAtMountPoint:");
}

id objc_msgSend_resetMountPaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetMountPaths");
}

id objc_msgSend_resolvePersonaWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvePersonaWithError:");
}

id objc_msgSend_resultDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultDict");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_revertForIXWithIdentity_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revertForIXWithIdentity:withOptions:completion:");
}

id objc_msgSend_reverterForAppIdentity_withOptions_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverterForAppIdentity:withOptions:forClient:");
}

id objc_msgSend_revokeTemporaryReference_wasLastReference_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "revokeTemporaryReference:wasLastReference:error:");
}

id objc_msgSend_roleUserMigrationMarkerFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roleUserMigrationMarkerFilePath");
}

id objc_msgSend_rootSinfURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootSinfURL");
}

id objc_msgSend_safeHarborListForType_forPersona_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeHarborListForType:forPersona:withError:");
}

id objc_msgSend_saveBundleMetadata_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveBundleMetadata:withError:");
}

id objc_msgSend_sendDelegateMessagesComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDelegateMessagesComplete");
}

id objc_msgSend_sendProgressWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendProgressWithDictionary:");
}

id objc_msgSend_sendProgressWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendProgressWithStatus:");
}

id objc_msgSend_sendProgressWithStatus_percentComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendProgressWithStatus:percentComplete:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serializeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializeToURL:error:");
}

id objc_msgSend_serializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_onBehalfOf_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:onBehalfOf:withError:");
}

id objc_msgSend_setAlternateIconName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateIconName:");
}

id objc_msgSend_setAppClipAppIdentifier_insecurelyCachedOnBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppClipAppIdentifier:insecurelyCachedOnBundle:error:");
}

id objc_msgSend_setAppExtensionBundles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppExtensionBundles:");
}

id objc_msgSend_setAppExtensionDataContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppExtensionDataContainers:");
}

id objc_msgSend_setAutoInstallOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoInstallOverride:");
}

id objc_msgSend_setBlockArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlockArray:");
}

id objc_msgSend_setBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundle:");
}

id objc_msgSend_setBundleContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleContainer:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setBundleSigningInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleSigningInfo:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setDataContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataContainer:");
}

id objc_msgSend_setDataProtectionOnDataContainer_forNewBundle_retryIfLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataProtectionOnDataContainer:forNewBundle:retryIfLocked:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDistributorInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDistributorInfo:");
}

id objc_msgSend_setDoesNotHaveBundleContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoesNotHaveBundleContainer:");
}

id objc_msgSend_setDriverKitExtensionBundles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDriverKitExtensionBundles:");
}

id objc_msgSend_setEmbeddedWatchApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmbeddedWatchApp:");
}

id objc_msgSend_setErroneousContainerCleanupDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErroneousContainerCleanupDone:");
}

id objc_msgSend_setExistingBundleContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExistingBundleContainer:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFrameworkBundles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameworkBundles:");
}

id objc_msgSend_setHasParallelPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasParallelPlaceholder:");
}

id objc_msgSend_setIdentifierLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifierLocked:");
}

id objc_msgSend_setIdentifiersMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifiersMap:");
}

id objc_msgSend_setInstallBuildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallBuildVersion:");
}

id objc_msgSend_setInstallDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallDate:");
}

id objc_msgSend_setInstallType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallType:");
}

id objc_msgSend_setInstallURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallURL:");
}

id objc_msgSend_setInstalledDistributorID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstalledDistributorID:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsLastReference_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLastReference:");
}

id objc_msgSend_setIsLinked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLinked:");
}

id objc_msgSend_setIsLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLocked:");
}

id objc_msgSend_setIsPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPlaceholder:");
}

id objc_msgSend_setIsPlaceholderWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsPlaceholderWithError:");
}

id objc_msgSend_setIsRunningInTestModeForProcessWithPID_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRunningInTestModeForProcessWithPID:withError:");
}

id objc_msgSend_setIsTransient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTransient:");
}

id objc_msgSend_setJournalEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setJournalEntry:");
}

id objc_msgSend_setJournalPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setJournalPhase:");
}

id objc_msgSend_setLaunchWarningData_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchWarningData:withError:");
}

id objc_msgSend_setLinkToParentBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkToParentBundleID:");
}

id objc_msgSend_setLinkedChildBundleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkedChildBundleIDs:");
}

id objc_msgSend_setLinkedParentBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkedParentBundleID:");
}

id objc_msgSend_setLockedIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockedIdentifiers:");
}

id objc_msgSend_setMountInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMountInfo:");
}

id objc_msgSend_setNoLongerPresentAppExtensionDataContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoLongerPresentAppExtensionDataContainers:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPackageFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPackageFormat:");
}

id objc_msgSend_setParentBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParentBundleID:");
}

id objc_msgSend_setPendingOperationTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingOperationTransaction:");
}

id objc_msgSend_setPercentComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPercentComplete:");
}

id objc_msgSend_setPersonaUniqueStrings_forAppBundleID_inDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersonaUniqueStrings:forAppBundleID:inDomain:error:");
}

id objc_msgSend_setPersonaUniqueStrings_forApplicationWithBundleIdentifier_operationUUID_requestContext_saveObserver_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersonaUniqueStrings:forApplicationWithBundleIdentifier:operationUUID:requestContext:saveObserver:error:");
}

id objc_msgSend_setPersonas_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersonas:");
}

id objc_msgSend_setPlaceholderFailureReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholderFailureReason:");
}

id objc_msgSend_setPlaceholderFailureUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholderFailureUnderlyingError:");
}

id objc_msgSend_setPlaceholderFailureUnderlyingErrorSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholderFailureUnderlyingErrorSource:");
}

id objc_msgSend_setPreflightAndPatchTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreflightAndPatchTime:");
}

id objc_msgSend_setProgressBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressBlock:");
}

id objc_msgSend_setRefs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRefs:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setResultDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultDict:");
}

id objc_msgSend_setSinfDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSinfDataType:");
}

id objc_msgSend_setSinfDataType_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSinfDataType:withError:");
}

id objc_msgSend_setStagingRoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagingRoot:");
}

id objc_msgSend_setStagingTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagingTime:");
}

id objc_msgSend_setStagingURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStagingURL:");
}

id objc_msgSend_setStashedContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStashedContainer:");
}

id objc_msgSend_setSystemAppMigrationComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSystemAppMigrationComplete:");
}

id objc_msgSend_setTargetUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetUID:");
}

id objc_msgSend_setTargetUserID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetUserID:");
}

id objc_msgSend_setTerminationAssertionReleased_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTerminationAssertionReleased:");
}

id objc_msgSend_setTestFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestFlags:");
}

id objc_msgSend_setTestOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestOverrides:");
}

id objc_msgSend_setUninstalledList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUninstalledList:");
}

id objc_msgSend_setUpgradingBuiltInAppAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpgradingBuiltInAppAtURL:");
}

id objc_msgSend_setValidatedByFreeProfileAppIdentifier_insecurelyCachedOnBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValidatedByFreeProfileAppIdentifier:insecurelyCachedOnBundle:error:");
}

id objc_msgSend_setVerificationTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVerificationTime:");
}

id objc_msgSend_setWatchKitAppExecutableHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWatchKitAppExecutableHash:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcConnection:");
}

id objc_msgSend_setXpcServiceBundles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcServiceBundles:");
}

id objc_msgSend_setXpcServiceBundlesEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcServiceBundlesEnabled:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedInstanceForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstanceForDomain:");
}

id objc_msgSend_sharedList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedList");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedTracker");
}

id objc_msgSend_shouldModifyExistingContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldModifyExistingContainers");
}

id objc_msgSend_shouldPersist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPersist");
}

id objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_sinfData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinfData");
}

id objc_msgSend_sinfDataType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinfDataType");
}

id objc_msgSend_snapshotWithSignature_delay_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotWithSignature:delay:events:payload:actions:reply:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_stageBackgroundUpdate_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageBackgroundUpdate:withError:");
}

id objc_msgSend_stageItemAtURL_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageItemAtURL:options:completion:");
}

id objc_msgSend_stageItemAtURL_options_containedSymlink_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageItemAtURL:options:containedSymlink:error:");
}

id objc_msgSend_stageUpdateForLater_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageUpdateForLater:");
}

id objc_msgSend_stagedJournalEntryUniqueID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagedJournalEntryUniqueID");
}

id objc_msgSend_stagingRoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingRoot");
}

id objc_msgSend_stagingRootForDevice_url_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingRootForDevice:url:identifier:error:");
}

id objc_msgSend_stagingRootForSystemContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingRootForSystemContent");
}

id objc_msgSend_stagingRootURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingRootURL");
}

id objc_msgSend_stagingTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingTime");
}

id objc_msgSend_stagingURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingURL");
}

id objc_msgSend_standardInfoMapInfoPlistKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardInfoMapInfoPlistKeys");
}

id objc_msgSend_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardizeOwnershipAtURL:toUID:GID:removeACLs:setProtectionClass:foundSymlink:error:");
}

id objc_msgSend_stashBundleContainerContents_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stashBundleContainerContents:error:");
}

id objc_msgSend_stashMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stashMode");
}

id objc_msgSend_stashedBundleContainerWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stashedBundleContainerWithError:");
}

id objc_msgSend_stashedContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stashedContainer");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_storageBaseURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageBaseURL");
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

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithContentsOfURL_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfURL:encoding:error:");
}

id objc_msgSend_stringWithFileSystemRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supportedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedDevices");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemAppBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemAppBundleIDToInfoMap");
}

id objc_msgSend_systemAppMigrationComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemAppMigrationComplete");
}

id objc_msgSend_systemAppMigrationStateQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemAppMigrationStateQueue");
}

id objc_msgSend_systemAppPlaceholderBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemAppPlaceholderBundleIDs");
}

id objc_msgSend_systemAppStateDictionaryRestoringBackedUpState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemAppStateDictionaryRestoringBackedUpState:");
}

id objc_msgSend_systemAppsDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemAppsDirectory");
}

id objc_msgSend_targetUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetUID");
}

id objc_msgSend_targets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targets");
}

id objc_msgSend_targetsBrowserExtensionPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetsBrowserExtensionPoint");
}

id objc_msgSend_tempAppBundleContainerWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tempAppBundleContainerWithIdentifier:error:");
}

id objc_msgSend_tempAppBundleContainerWithIdentifier_inDomain_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tempAppBundleContainerWithIdentifier:inDomain:withError:");
}

id objc_msgSend_terminationAssertionReleased(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationAssertionReleased");
}

id objc_msgSend_testFileSentinelForSyncURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testFileSentinelForSyncURL");
}

id objc_msgSend_testFlagsAreSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testFlagsAreSet:");
}

id objc_msgSend_testOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testOverrides");
}

id objc_msgSend_testOverridesEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testOverridesEnabled");
}

id objc_msgSend_thinningMatchesCurrentDeviceWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thinningMatchesCurrentDeviceWithError:");
}

id objc_msgSend_toolArch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toolArch");
}

id objc_msgSend_toolBuiltWithSDKVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toolBuiltWithSDKVersion");
}

id objc_msgSend_toolBuiltWithXcodeVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toolBuiltWithXcodeVersion");
}

id objc_msgSend_toolVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toolVersion");
}

id objc_msgSend_transferExistingStashesFromContainer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transferExistingStashesFromContainer:error:");
}

id objc_msgSend_transferInstallationIdentityFromBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transferInstallationIdentityFromBundle:error:");
}

id objc_msgSend_transientBundleCleanupEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transientBundleCleanupEnabled");
}

id objc_msgSend_traverseDirectoryAtURL_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traverseDirectoryAtURL:withBlock:");
}

id objc_msgSend_twoStageAppInstallEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "twoStageAppInstallEnabled");
}

id objc_msgSend_uiSupportedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uiSupportedDevices");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uninstallRecordArrayToICLUninstallRecordArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstallRecordArrayToICLUninstallRecordArray:");
}

id objc_msgSend_uninstalledDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstalledDictionary");
}

id objc_msgSend_uninstalledList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstalledList");
}

id objc_msgSend_uninstallerForIdentities_withOptions_forClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstallerForIdentities:withOptions:forClient:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_uniqueInstallID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueInstallID");
}

id objc_msgSend_unlinkChild_fromParent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlinkChild:fromParent:error:");
}

id objc_msgSend_unregisterAppForBundleID_inDomain_operationType_precondition_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterAppForBundleID:inDomain:operationType:precondition:error:");
}

id objc_msgSend_unregisterApplicationsAtMountPoint_operationUUID_saveObserver_requestContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterApplicationsAtMountPoint:operationUUID:saveObserver:requestContext:");
}

id objc_msgSend_unregisterAppsAtMountPoint_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterAppsAtMountPoint:error:");
}

id objc_msgSend_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterContainerizedApplicationWithBundleIdentifier:operationUUID:unregistrationOperation:precondition:requestContext:saveObserver:unregistrationError:");
}

id objc_msgSend_unregisterContentsAtMountPoint_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterContentsAtMountPoint:completion:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateAndValidateSinf_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAndValidateSinf:error:");
}

id objc_msgSend_updateMCMWithCodeSigningInfoAsAdvanceCopy_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMCMWithCodeSigningInfoAsAdvanceCopy:withError:");
}

id objc_msgSend_updatePersonaUniqueStrings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePersonaUniqueStrings:");
}

id objc_msgSend_updatePlaceholderMetadataForApplicationWithIdentifier_operationUUID_requestContext_installType_failure_saveObserver_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePlaceholderMetadataForApplicationWithIdentifier:operationUUID:requestContext:installType:failure:saveObserver:error:");
}

id objc_msgSend_updateReferencesWithOldBundle_newBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateReferencesWithOldBundle:newBundle:error:");
}

id objc_msgSend_updateSINFMetadataForApplicationWithIdentifier_operationUUID_requestContext_parsedSINFInfo_saveObserver_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSINFMetadataForApplicationWithIdentifier:operationUUID:requestContext:parsedSINFInfo:saveObserver:error:");
}

id objc_msgSend_updateSinfWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSinfWithData:error:");
}

id objc_msgSend_updatedBundleShortVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedBundleShortVersion");
}

id objc_msgSend_updatedBundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatedBundleVersion");
}

id objc_msgSend_updateiTunesMetadataForApplicationWithIdentifier_operationUUID_requestContext_metadataPlist_saveObserver_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateiTunesMetadataForApplicationWithIdentifier:operationUUID:requestContext:metadataPlist:saveObserver:error:");
}

id objc_msgSend_upgradingBuiltInAppAtURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upgradingBuiltInAppAtURL");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userPersonaBundleIDList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaBundleIDList");
}

id objc_msgSend_userPersonaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaType");
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaUniqueString");
}

id objc_msgSend_validateAppIdentity_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAppIdentity:withError:");
}

id objc_msgSend_validateAppMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAppMetadataWithError:");
}

id objc_msgSend_validateAppReference_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAppReference:withError:");
}

id objc_msgSend_validateDriverKitExtensionMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateDriverKitExtensionMetadataWithError:");
}

id objc_msgSend_validateExtensionKitMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateExtensionKitMetadataWithError:");
}

id objc_msgSend_validateHasCorrespondingEntitlements_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateHasCorrespondingEntitlements:error:");
}

id objc_msgSend_validatePluginKitMetadataWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validatePluginKitMetadataWithError:");
}

id objc_msgSend_validateSinfWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateSinfWithError:");
}

id objc_msgSend_validateSymlinksInURLDoNotEscapeURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateSymlinksInURLDoNotEscapeURL:error:");
}

id objc_msgSend_validateWatchKitV2StubExecutableBundle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateWatchKitV2StubExecutableBundle:error:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_verificationTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verificationTime");
}

id objc_msgSend_waitForDeletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForDeletion");
}

id objc_msgSend_waitForSystemAppMigrationToComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForSystemAppMigrationToComplete:");
}

id objc_msgSend_waitingTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingTime");
}

id objc_msgSend_wasErroneousContainerCleanupDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasErroneousContainerCleanupDone");
}

id objc_msgSend_watchKitAppExecutableHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchKitAppExecutableHash");
}

id objc_msgSend_watchKitAppExecutableHashWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchKitAppExecutableHashWithError:");
}

id objc_msgSend_watchKitAppRunsIndependentlyOfCompanion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchKitAppRunsIndependentlyOfCompanion");
}

id objc_msgSend_watchKitV2AppBundleWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchKitV2AppBundleWithError:");
}

id objc_msgSend_watchKitVersionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchKitVersionWithError:");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_wipeStagingRootAndSetUpPerUserDataDirWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wipeStagingRootAndSetUpPerUserDataDirWithCompletion:");
}

id objc_msgSend_wipeStagingRootAndSetUpPerUserDataDirWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wipeStagingRootAndSetUpPerUserDataDirWithError:");
}

id objc_msgSend_writeData_toFileURL_mode_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:toFileURL:mode:withError:");
}

id objc_msgSend_writeJournalEntry_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeJournalEntry:withError:");
}

id objc_msgSend_writePlistRepresentation_toFileURL_mode_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePlistRepresentation:toFileURL:mode:withError:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:encoding:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_writeiTunesMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeiTunesMetadata:error:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}

id objc_msgSend_xpcServiceBundles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcServiceBundles");
}

id objc_msgSend_xpcServiceBundlesEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcServiceBundlesEnabled");
}

id objc_msgSend_xpcServiceBundlesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcServiceBundlesWithError:");
}

