uint64_t sub_1000044DC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const std::__fs::filesystem::path *v13;
  const std::__fs::filesystem::path *v14;
  std::error_code *v15;
  int v16;
  id v17;
  uint64_t v18;
  id v20;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (v4)
  {
    if (v3)
    {
      v6 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0
        || (v7 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v3, v7) & 1) != 0)
        || (v8 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v3, v8) & 1) != 0))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByDeletingLastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v11));

        if (objc_msgSend(v3, "writeToFile:atomically:", v12, 0))
        {
          v13 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation");
          v14 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
          rename(v13, v14, v15);
          if (!v16)
          {
            v18 = 1;
            goto LABEL_16;
          }
        }
        NSLog(CFSTR("%s: Failed to write item to path %@"), "safeAtomicWriteToPath", v4);
        if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v12, 0))
        {
          v20 = 0;
          objc_msgSend(v5, "removeItemAtPath:error:", v12, &v20);
          v17 = v20;
          v18 = (uint64_t)v17;
          if (!v17)
          {
LABEL_16:

            goto LABEL_17;
          }
          NSLog(CFSTR("%s: Atomic write to path failed and failed to remove temp path(%@): %@"), "safeAtomicWriteToPath", v12, v17);

        }
        v18 = 0;
        goto LABEL_16;
      }
    }
    NSLog(CFSTR("Invalid data passed to %s"), "safeAtomicWriteToPath");
  }
  else
  {
    NSLog(CFSTR("Invalid path passed to %s"), "safeAtomicWriteToPath");
  }
  v18 = 0;
LABEL_17:

  return v18;
}

BOOL sub_1000046E8(void *a1, char a2, void *a3)
{
  id v5;
  uint64_t (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a1;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enumeratorAtPath:", v5));

  if (v8)
  {
    v9 = objc_autoreleasePoolPush();
    v10 = 0;
    while (1)
    {
      v11 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

      if (!v10)
        break;
      if ((a2 & 1) == 0)
        objc_msgSend(v8, "skipDescendants");
      if ((v6[2](v6, v10) & 1) == 0)
      {
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Caller canceled enumeration"))));
        NSLog(CFSTR("[MAB] %s"), objc_msgSend(v12, "UTF8String"));

        break;
      }
    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not create directory enumerator for %@"), v5)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v13, "UTF8String"));

  }
  return v8 != 0;
}

uint64_t sub_100004848()
{
  uint64_t result;

  result = os_variant_has_internal_content("com.apple.mobileassetd");
  if ((_DWORD)result)
    return sub_100004E98(CFSTR("MABrainAllowUnpersonalized"), 0) != 0;
  return result;
}

BOOL sub_100004880()
{
  unsigned int v0;
  BOOL v1;
  char v3;

  if (!os_variant_has_internal_content("com.apple.mobileassetd"))
    return 1;
  v3 = 0;
  v0 = sub_100004E98(CFSTR("MABrainAllowDownloaded"), &v3);
  if (v3)
    v1 = v0 == 0;
  else
    v1 = 0;
  return !v1;
}

uint64_t sub_1000048D4()
{
  uint64_t result;

  result = os_variant_has_internal_content("com.apple.mobileassetd");
  if ((_DWORD)result)
    return sub_100004E98(CFSTR("MABrainAllowCrossBuildGroup"), 0) != 0;
  return result;
}

uint64_t sub_10000490C()
{
  uint64_t result;

  result = os_variant_has_internal_content("com.apple.mobileassetd");
  if ((_DWORD)result)
    return sub_100004E98(CFSTR("MABrainDisableHealthCheck"), 0) != 0;
  return result;
}

id sub_100004944()
{
  mach_header_64 *v0;
  uint64_t ncmds;
  mach_header_64 *v2;
  uint64_t v3;
  uint64_t v4;
  const unsigned __int8 *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BYTE v10[37];
  uuid_t dst;

  v0 = _NSGetMachExecuteHeader();
  memset(dst, 0, sizeof(dst));
  ncmds = v0->ncmds;
  if ((_DWORD)ncmds)
  {
    v2 = v0;
    v3 = 0;
    v4 = 32;
    while (1)
    {
      v5 = (const unsigned __int8 *)v0 + v4;
      if (*(uint32_t *)((char *)&v0->magic + v4) == 27)
        break;
      v4 += *((unsigned int *)v5 + 1);
      if (ncmds == ++v3)
        goto LABEL_9;
    }
    uuid_copy(dst, v5 + 8);
    v6 = v2->ncmds;
  }
  else
  {
    v6 = 0;
    v3 = 0;
  }
  if (v3 == v6)
LABEL_9:
    uuid_clear(dst);
  memset(v10, 0, sizeof(v10));
  uuid_unparse_lower(dst, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_10000C5E0));

  return v8;
}

id sub_100004A58()
{
  uint64_t v0;
  int *v1;
  const __CFString *v2;
  NSString *v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;
  uint64_t v9;
  int *v10;
  NSString *v11;
  id v12;
  uint64_t v13;
  char *v14;
  size_t size;

  size = 0;
  if (sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    v0 = *__error();
    v1 = __error();
    v13 = v0;
    v14 = strerror(*v1);
    v2 = CFSTR("Could not look up boot session UUID: %d (%s)");
LABEL_3:
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v13, v14);
LABEL_4:
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v3));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v4, "UTF8String"));

    v5 = 0;
    return v5;
  }
  if (!size)
  {
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Boot session UUID has an invalid length (%zu)"), 0, v14);
    goto LABEL_4;
  }
  v7 = malloc_type_malloc(size, 0x73AB37B5uLL);
  if (!v7)
  {
    v2 = CFSTR("Could not allocate buffer to copy boot session UUID");
    goto LABEL_3;
  }
  v8 = v7;
  if (sysctlbyname("kern.bootsessionuuid", v7, &size, 0, 0))
  {
    v9 = *__error();
    v10 = __error();
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not copy boot session UUID: %d (%s)"), v9, strerror(*v10));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v11));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v12, "UTF8String"));

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4));
  }
  free(v8);
  return v5;
}

uint64_t sub_100004BE8()
{
  unsigned int v0;
  _QWORD v2[2];
  _QWORD v3[2];

  v2[0] = kMKBUserSessionIDKey;
  v2[1] = CFSTR("ExtendedDeviceLockState");
  v3[0] = &off_10000D740;
  v3[1] = &__kCFBooleanTrue;
  v0 = MKBGetDeviceLockState(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 2));
  return (v0 < 7) & (0x46u >> v0);
}

id sub_100004C88()
{
  if (qword_1000105E8 != -1)
    dispatch_once(&qword_1000105E8, &stru_10000C338);
  return (id)qword_1000105E0;
}

void sub_100004CC8(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.MobileAsset.preferencesDomain", 0);
  v2 = (void *)qword_1000105E0;
  qword_1000105E0 = (uint64_t)v1;

}

id sub_100004CF4(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  id v10;
  void **block;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v1 = a1;
  if (v1)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_100004E44;
    v22 = sub_100004E54;
    v23 = 0;
    v2 = sub_100004C88();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    block = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_100004E5C;
    v15 = &unk_10000C360;
    v4 = v1;
    v16 = v4;
    v17 = &v18;
    dispatch_sync(v3, &block);

    v5 = (void *)v19[5];
    if (v5)
    {
      v6 = v5;
      v7 = (objc_class *)objc_opt_class(v6);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    }
    v10 = v5;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_100004E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E44(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004E54(uint64_t a1)
{

}

void sub_100004E5C(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;

  v2 = CFPreferencesCopyAppValue(*(CFStringRef *)(a1 + 32), CFSTR("com.apple.MobileAsset"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_100004E98(void *a1, _BYTE *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  char v7;
  char v8;
  id v9;

  v3 = sub_100004CF4(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v5 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);
    v7 = isKindOfClass ^ 1;
    v8 = isKindOfClass & 1;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = 0;
  v7 = 1;
  if (a2)
LABEL_3:
    *a2 = v8;
LABEL_4:
  if ((v7 & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v4, "BOOLValue");

  return v9;
}

id start(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = objc_autoreleasePoolPush();
  NSLog(CFSTR("Starting mobileassetd built Aug  3 2024 07:37:08"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MABrainLoader sharedInstance](MABrainLoader, "sharedInstance"));
  v6 = objc_msgSend(v5, "run:argv:", a1, a2);

  objc_autoreleasePoolPop(v4);
  return v6;
}

id sub_100004F98(uint64_t a1)
{
  void *v1;
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSString *v12;
  id v14;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), "stringByAppendingPathComponent:", a1));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend(v2, "fileExistsAtPath:", v1);

  if (!v3)
  {
    v7 = 0;
    v4 = 0;
    goto LABEL_5;
  }
  v14 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v1, 4, &v14));
  v5 = v14;
  if (v5)
  {
    v6 = v5;
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error loading contents of %@: %@"), v1, v5)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v7, "UTF8String"));
LABEL_14:

    v7 = 0;
    goto LABEL_15;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid target path at %@"), v1);
LABEL_12:
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v12));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v7, "UTF8String"));
    goto LABEL_13;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), "stringByAppendingPathComponent:", v4));
  if (!v8)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Allocating targetPath failed for target %@"), v4);
    goto LABEL_12;
  }
  v7 = (id)v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v7);

  if ((v10 & 1) == 0)
  {
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ does not exist"), v7)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v11, "UTF8String"));

LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
LABEL_5:
  v6 = 0;
LABEL_15:

  return v7;
}

uint64_t sub_100005564(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __MABuiltinBrainBundle__ *v5;
  NSString *v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSString *v10;
  id v11;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), "stringByAppendingPathComponent:", v3));
  v5 = -[__MABuiltinBrainBundle__ initWithPath:]([__MABuiltinBrainBundle__ alloc], "initWithPath:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Preserving item %@"), v3);
LABEL_5:
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v7, "UTF8String"));
    goto LABEL_10;
  }
  if (-[__MABuiltinBrainBundle__ isGrafted](v5, "isGrafted"))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Preserving item %@ (still grafted)"), v3);
    goto LABEL_5;
  }
  v8 = *(void **)(a1 + 40);
  v14 = 0;
  v9 = objc_msgSend(v8, "removeItemAtPath:error:", v4, &v14);
  v7 = v14;
  if (v9)
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Successfully removed item %@"), v3, v13);
  else
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error removing item %@: %@"), v3, v7);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v11, "UTF8String"));

LABEL_10:
  return 1;
}

void sub_1000067E8(id a1)
{
  MABrainLoader *v1;
  void *v2;

  v1 = objc_alloc_init(MABrainLoader);
  v2 = (void *)qword_1000105F0;
  qword_1000105F0 = (uint64_t)v1;

}

void sub_100006E2C(uint64_t a1)
{
  const __CFString *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  int *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  char *v15;
  id v16;
  stat v17;

  memset(&v17, 0, sizeof(v17));
  if (lstat((const char *)objc_msgSend(CFSTR("/private/var/run/com.apple.mobileassetd-MobileAssetBrain"), "fileSystemRepresentation"), &v17))
  {
    if (*__error() == 2)
    {
      v2 = CFSTR("mobileassetd has no launch history; possible first launch since boot.");
    }
    else
    {
      v10 = __error();
      v15 = strerror(*v10);
      v2 = CFSTR("Error reading mobileassetd launch history file metadata: %s");
    }
    goto LABEL_9;
  }
  if (v17.st_size > 0x10000)
  {
    v2 = CFSTR("mobileassetd launch history file is too large; disregarding.");
LABEL_9:
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v15)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v3, "UTF8String"));
    goto LABEL_10;
  }
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/run/com.apple.mobileassetd-MobileAssetBrain")));
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v3, &v16));
  v5 = v16;
  v6 = objc_msgSend(v4, "mutableCopy");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v6;

  if (v5)
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not load mobileassetd launch history: %@"), v5);
  else
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mobileassetd launch history successfully loaded"), v15);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v9));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v14, "UTF8String"));

LABEL_10:
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v11 = objc_alloc_init((Class)NSMutableDictionary);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 8);
    *(_QWORD *)(v12 + 8) = v11;

  }
}

void sub_100007C78(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("bundleId")));
  objc_msgSend(v1, "recordLaunch:", v2);

}

void sub_100007D00(id a1)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;
  id v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "$SIDEBUILD_PARENT_TRAIN"));
  if (objc_msgSend(v1, "isEqualToString:", &stru_10000C5E0))
  {

  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "$SIDEBUILD_PARENT_TRAIN"));
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("$SIDEBUILD_PARENT_TRAIN"));

    if ((v3 & 1) == 0)
    {
      qword_100010618 = (uint64_t)"$SIDEBUILD_PARENT_TRAIN";
      return;
    }
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "Crystal"));
  if (objc_msgSend(v6, "isEqualToString:", &stru_10000C5E0))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "Crystal"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("$RC_RELEASE"));

    if ((v5 & 1) == 0)
      qword_100010618 = (uint64_t)"Crystal";
  }
}

void sub_100008610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008694(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000086A4(uint64_t a1)
{

}

uint64_t sub_1000086AC(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  __MABuiltinBrainBundle__ *v12;
  __MABuiltinBrainBundle__ *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  unsigned __int8 v29;
  id v30;
  id v32;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  if (!v8)
  {
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ MobileAssetBrain not found"), v7)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v10, "UTF8String"));
LABEL_26:

    v26 = 0;
    goto LABEL_27;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ MobileAssetBrain found in bundle %@"), v7, v10)));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v11, "UTF8String"));

  v12 = -[__MABuiltinBrainBundle__ initWithPath:]([__MABuiltinBrainBundle__ alloc], "initWithPath:", v9);
  v13 = v12;
  if (!v12)
  {
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Allocating bundle failed for %@"), v9)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v17, "UTF8String"));
LABEL_25:

    goto LABEL_26;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ brainInfo](v12, "brainInfo"));
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = objc_alloc_init((Class)NSDictionary);
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("boot-session-uuid")));
  v19 = *(void **)(a1 + 32);
  if (v19 && v18 && objc_msgSend(v19, "isEqualToString:", v18))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && !-[__MABuiltinBrainBundle__ hasValidCurrentBootOnlyTicket](v13, "hasValidCurrentBootOnlyTicket"))
  {
    goto LABEL_24;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "loadCryptex:bundle:bundleName:", *(unsigned __int8 *)(a1 + 80), v13, v10))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle/cryptex %@ could not be loaded"), v10)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v27, "UTF8String"));
LABEL_23:

    }
LABEL_24:

    goto LABEL_25;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "verify:", v13))
  {
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileAssetBrain bundle %@ could not be verified"), v10)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v28, "UTF8String"));

LABEL_21:
    v32 = 0;
    v29 = -[__MABuiltinBrainBundle__ ungraft:](v13, "ungraft:", &v32);
    v27 = v32;
    if ((v29 & 1) == 0)
    {
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error ungrafting bundle %@: %@"), v10, v27)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v30, "UTF8String"));

    }
    goto LABEL_23;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "loadTrustCache:bundle:bundleName:needsUnlock:", *(unsigned __int8 *)(a1 + 80), v13, v10, a4))goto LABEL_21;
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ brainPath](v13, "brainPath")));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v20, "fileSystemRepresentation");

  v21 = objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v10, CFSTR("bundleId"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, CFSTR("bundlePath"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &off_10000D788, CFSTR("_CompatibilityVersion"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("mobileassetd-uuid"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), objc_msgSend(*(id *)(a1 + 40), "getTrainName")));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("mobileassetd-trainname"));

  objc_msgSend(v21, "removeObjectForKey:", CFSTR("boot-session-uuid"));
  v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v21));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  v26 = 1;
LABEL_27:

  return v26;
}

uint64_t amfi_load_trust_cache(char a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  _QWORD v8[2];
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;

  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  v10 = -1431655766;
  v13 = -1431655766;
  LOBYTE(v8[0]) = a1;
  v8[1] = a2;
  v9 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  v16 = -1431655766;
  v15 = a7;
  return __sandbox_ms("AMFI", 101, v8);
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

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_brainInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brainInfo");
}

id objc_msgSend_brainPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brainPath");
}

id objc_msgSend_buildGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildGroup");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleId");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_cryptexPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cryptexPath");
}

id objc_msgSend_currentBootOnlyTicketPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBootOnlyTicketPath");
}

id objc_msgSend_currentTargetPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTargetPath");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_destageCurrent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destageCurrent:");
}

id objc_msgSend_destageProposed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destageProposed:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
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

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_getTrainName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTrainName");
}

id objc_msgSend_graft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "graft:");
}

id objc_msgSend_graftPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "graftPath");
}

id objc_msgSend_graftdmgType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "graftdmgType");
}

id objc_msgSend_hasValidCurrentBootOnlyTicket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasValidCurrentBootOnlyTicket");
}

id objc_msgSend_healthCheck_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "healthCheck:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithRestoreVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRestoreVersion:");
}

id objc_msgSend_isComparable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isComparable:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGloballySigned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGloballySigned");
}

id objc_msgSend_isGrafted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGrafted");
}

id objc_msgSend_isGraftedPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGraftedPath:");
}

id objc_msgSend_isPersonalized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersonalized");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadCryptex_bundle_bundleName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadCryptex:bundle:bundleName:");
}

id objc_msgSend_loadHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadHistory");
}

id objc_msgSend_loadTrustCache_bundle_bundleName_needsUnlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrustCache:bundle:bundleName:needsUnlock:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_primaryTicketPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryTicketPath");
}

id objc_msgSend_proposedTargetPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposedTargetPath");
}

id objc_msgSend_recordLaunch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordLaunch:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_restoreVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreVersion");
}

id objc_msgSend_rootHashPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootHashPath");
}

id objc_msgSend_run_argv_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run:argv:");
}

id objc_msgSend_run_argv_info_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run:argv:info:path:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDevice");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipDescendants");
}

id objc_msgSend_stageProposed_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageProposed:error:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
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

id objc_msgSend_ticketPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketPath");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_trustCachePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trustCachePath");
}

id objc_msgSend_ungraft_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ungraft:");
}

id objc_msgSend_verify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verify:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}
