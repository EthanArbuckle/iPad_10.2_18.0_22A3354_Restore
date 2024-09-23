uint64_t start()
{
  uint64_t v0;
  CFAllocatorRef (__cdecl **v1)(CFAllocatorRef, CFAllocatorContext *);
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  CFAllocatorRef (__cdecl *v13)(CFAllocatorRef, CFAllocatorContext *);
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CFIndex (__cdecl *v19)(CFIndex, CFOptionFlags, void *);
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  CFDataRef v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  const __CFString *v35;
  CFAllocatorRef (__cdecl **v36)(CFAllocatorRef, CFAllocatorContext *);
  id v37;
  id v38;
  id v39;
  const UInt8 *v40;
  CFIndex v41;
  const __CFString *v42;
  CFAllocatorRef (__cdecl **v43)(CFAllocatorRef, CFAllocatorContext *);
  const __CFAllocator *v44;
  const __CFAllocator *v45;
  void *v46;
  CFAllocatorRef (__cdecl **v47)(CFAllocatorRef, CFAllocatorContext *);
  id v48;
  uint64_t v49;
  const __CFData *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  UIImage *v57;
  NSData *v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  UIImage *v67;
  UIImage *v68;
  NSData *v69;
  void *v70;
  id v71;
  id v72;
  const __CFString *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  uint64_t v80;
  char isKindOfClass;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  uint64_t CurrentHomeScreenImage;
  uint64_t v88;
  uint64_t CurrentLockScreenImage;
  void *v90;
  void *v91;
  UIImage *v92;
  NSData *v93;
  void *v94;
  id v95;
  uint64_t v96;
  int *v98;
  uint64_t v99;
  uint64_t *v100;
  unsigned int *v101;
  uint64_t v102;
  void (__cdecl *v103)(void *, void *);
  void *(__cdecl *v104)(void *, CFIndex, CFOptionFlags, void *);
  void *(__cdecl *v105)(CFIndex, CFOptionFlags, void *);
  CFStringRef (__cdecl *v106)(const void *);
  void (__cdecl *v107)(const void *);
  const void *(__cdecl *v108)(const void *);
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  unsigned int v125;
  uint64_t v126;
  unsigned int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  double v132;
  double v133;
  double v134;
  id v135;
  _QWORD v136[11];
  CFAllocatorContext context;
  void *v138;
  void *v139;

  v126 = 0;
  if (secure_lockdown_checkin(&v126, 0, 0) || !v126)
  {
    v98 = __error();
    NSLog(CFSTR("lockdown_checkin() failed: %d"), *v98);
    exit(-1);
  }
  v123 = objc_autoreleasePoolPush();
  v0 = _UISharedImageSetPreferredImageScale(2.0);
  UIApplicationInitialize(v0);
  v1 = &CFAllocatorCreate_ptr;
  v2 = CFSTR("command");
  while (1)
  {
    v3 = objc_autoreleasePoolPush();
    v125 = 0;
    v4 = lockdown_recv(v126, &v125, 4);
    if (v4 != 4)
    {
      if (v4)
      {
        if (v4 == -1)
        {
          v99 = *__error();
          NSLog(CFSTR("Connection closed with error %d."), v99);
        }
        else
        {
          NSLog(CFSTR("Did not read 4 bytes of length got %ld."), v4);
        }
      }
      goto LABEL_85;
    }
    v125 = bswap32(v125);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:"));
    v6 = v5;
    if (v5)
      break;
LABEL_34:

    objc_autoreleasePoolPop(v3);
  }
  v124 = objc_retainAutorelease(v5);
  v7 = (char *)objc_msgSend(v124, "bytes");
  v8 = 0;
  v9 = v125;
  do
  {
    v10 = lockdown_recv(v126, &v7[v8], v9 - v8);
    v11 = v10;
    if (v10 < 0)
    {
      v96 = v125 - v8;
      v102 = *__error();
      NSLog(CFSTR("Could not receive %ld bytes of body at offset %ld; got %ld, errno = %d"), v96, v8, v11, v102);
      goto LABEL_84;
    }
    if (!v10)
    {
      NSLog(CFSTR("Could not receive %d bytes of body at offset %ld; stream closed"), v125, v8, v100, v101);
      goto LABEL_84;
    }
    v8 += v10;
    v9 = v125;
  }
  while (v8 < v125);
  if (v8 != v125)
    goto LABEL_84;
  v12 = v124;
  v13 = v1[9];
  v135 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "propertyListWithData:options:format:error:", v12, 0, 0, &v135));
  v15 = v135;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v2));
    v121 = v12;
    v122 = v16;
    if (objc_msgSend(v16, "isEqual:", CFSTR("getHomeScreenIconMetrics")))
    {
      v133 = 0.0;
      v134 = 0.0;
      v131 = 0.0;
      v132 = 0.0;
      v129 = 0;
      v130 = 0;
      v128 = 0;
      v127 = 0;
      v17 = SBSSpringBoardServerPort();
      v100 = &v128;
      v101 = &v127;
      SBGetHomeScreenIconMetrics(v17, &v134, &v133, &v132);
      v136[0] = CFSTR("homeScreenWidth");
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v134));
      context.version = (CFIndex)v114;
      v136[1] = CFSTR("homeScreenHeight");
      v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v133));
      context.info = v111;
      v136[2] = CFSTR("homeScreenIconWidth");
      v108 = (const void *(__cdecl *)(const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v132));
      context.retain = v108;
      v136[3] = CFSTR("homeScreenIconHeight");
      v107 = (void (__cdecl *)(const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v131));
      context.release = v107;
      v136[4] = CFSTR("homeScreenIconRows");
      v106 = (CFStringRef (__cdecl *)(const void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v130)));
      context.copyDescription = v106;
      v136[5] = CFSTR("homeScreenIconColumns");
      v105 = (void *(__cdecl *)(CFIndex, CFOptionFlags, void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v130));
      context.allocate = v105;
      v136[6] = CFSTR("homeScreenIconDockMaxCount");
      v104 = (void *(__cdecl *)(void *, CFIndex, CFOptionFlags, void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v129)));
      context.reallocate = v104;
      v136[7] = CFSTR("homeScreenIconMaxPages");
      v103 = (void (__cdecl *)(void *, void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v129));
      context.deallocate = v103;
      v136[8] = CFSTR("homeScreenIconFolderRows");
      v116 = v15;
      v18 = v14;
      v19 = (CFIndex (__cdecl *)(CFIndex, CFOptionFlags, void *))objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v128)));
      context.preferredSize = v19;
      v136[9] = CFSTR("homeScreenIconFolderColumns");
      v20 = v2;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v128));
      v138 = v21;
      v136[10] = CFSTR("homeScreenIconFolderMaxPages");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v127));
      v139 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &context, v136, 11));

      v2 = v20;
      v14 = v18;
      v15 = v116;

      v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v23, 200, 0, 0));
      v1 = &CFAllocatorCreate_ptr;
LABEL_31:

      goto LABEL_32;
    }
    if (objc_msgSend(v16, "isEqual:", CFSTR("getIconState")))
    {
      v136[0] = 0;
      LODWORD(v134) = 0;
      v25 = v14;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("formatVersion")));
      v27 = objc_msgSend(v26, "intValue") == 2;

      v115 = v25;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", CFSTR("destinationState")));
      LODWORD(v25) = objc_msgSend(v28, "BOOLValue");

      v29 = SBSSpringBoardBackgroundServerPort();
      if ((_DWORD)v25)
        SBGetPendingIconState(v29, v27, v136, &v134);
      else
        SBGetIconState(v29, v27, v136, &v134);
      v40 = (const UInt8 *)v136[0];
      if (v136[0])
      {
        v41 = LODWORD(v134);
        context.version = 0;
        memset(&context.retain, 0, 40);
        context.info = (void *)LODWORD(v134);
        context.deallocate = (CFAllocatorDeallocateCallBack)sub_100003530;
        context.preferredSize = 0;
        v42 = v2;
        v43 = v1;
        v44 = CFAllocatorCreate(0, &context);
        v24 = CFDataCreateWithBytesNoCopy(0, v40, v41, v44);
        v45 = v44;
        v1 = v43;
        v2 = v42;
        CFRelease(v45);
      }
      else
      {
        v24 = 0;
      }
      goto LABEL_29;
    }
    if (objc_msgSend(v16, "isEqual:", CFSTR("setIconState")))
    {
      v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("iconState")));
      v117 = v15;
      v31 = v14;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[9], "dataWithPropertyList:format:options:error:", v30, 200, 0, 0));
      v33 = SBSSpringBoardBackgroundServerPort();
      v34 = objc_retainAutorelease(v32);
      v35 = v2;
      v36 = v1;
      v37 = objc_msgSend(v34, "bytes");
      v38 = objc_msgSend(v34, "length");
      v39 = v37;
      v1 = v36;
      v2 = v35;
      SBSetIconState(v33, v39, v38);
      v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));

      v14 = v31;
      v15 = v117;
LABEL_20:

LABEL_21:
      v12 = v121;
      goto LABEL_31;
    }
    if (objc_msgSend(v16, "isEqual:", CFSTR("getIconPNGData")))
    {
      v115 = v14;
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("bundleId")));
      v46 = (void *)SBSCopyIconImagePNGDataForDisplayIdentifier();
      if (v46)
      {
        v47 = v1;
        v48 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v46, CFSTR("pngData"), 0);
        v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(objc_msgSend(v47[9], "dataWithPropertyList:format:options:error:", v48, 200, 0, 0));

        v1 = v47;
        v12 = v121;
      }
      else
      {
        v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
      }

      goto LABEL_30;
    }
    if (objc_msgSend(v16, "isEqual:", CFSTR("getInterfaceOrientation")))
    {
      LODWORD(context.version) = -1;
      v51 = SBSSpringBoardServerPort();
      SBGetInterfaceOrientation(v51, &context);
      v52 = objc_alloc((Class)NSDictionary);
      v53 = v14;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(context.version)));
      v30 = objc_msgSend(v52, "initWithObjectsAndKeys:", v54, CFSTR("interfaceOrientation"), 0);

      v14 = v53;
      v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[9], "dataWithPropertyList:format:options:error:", v30, 200, 0, 0));
      goto LABEL_20;
    }
    if (objc_msgSend(v16, "isEqual:", CFSTR("getHomeScreenWallpaperPNGData")))
    {
      v115 = v14;
      v55 = objc_alloc_init((Class)PBUIWallpaperConfigurationManager);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "wallpaperConfigurationForVariant:includingValuesForTypes:", 1, 1));
      v57 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "wallpaperImage"));

      if (v57)
      {
        v58 = UIImagePNGRepresentation(v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        if (v59)
        {
          v60 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v59, CFSTR("pngData"), 0);
          v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v60, 200, 0, 0));

          v2 = CFSTR("command");
        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

      v1 = &CFAllocatorCreate_ptr;
      goto LABEL_29;
    }
    if (objc_msgSend(v16, "isEqual:", CFSTR("getWallpaperInfo")))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("wallpaperName")));
      v112 = v61;
      if ((objc_msgSend(v61, "isEqual:", CFSTR("homescreen")) & 1) != 0)
      {
        v62 = 1;
      }
      else
      {
        v62 = objc_msgSend(v61, "isEqual:", CFSTR("lockscreen")) ^ 1;
        if ((v62 & 1) != 0)
        {
          v24 = 0;
LABEL_72:

          goto LABEL_21;
        }
      }
      v109 = objc_alloc_init((Class)PBUIWallpaperConfigurationManager);
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "wallpaperConfigurationForVariant:includingValuesForTypes:", v62, 1));
      v66 = objc_msgSend(v65, "wallpaperType");
      v67 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "wallpaperImage"));
      v68 = v67;
      if (v67)
      {
        v120 = v15;
        v69 = UIImagePNGRepresentation(v67);
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v71 = objc_alloc_init((Class)NSMutableDictionary);
        v72 = v71;
        if (v70)
        {
          objc_msgSend(v71, "setObject:forKey:", v70, CFSTR("pngData"));

        }
        v15 = v120;
      }
      else
      {
        v72 = objc_alloc_init((Class)NSMutableDictionary);
      }
      v73 = CFSTR("(error)");
      if ((unint64_t)v66 <= 5)
        v73 = *(&off_1000041A8 + (_QWORD)v66);
      objc_msgSend(v72, "setObject:forKey:", v73, CFSTR("wallpaperType"));
      v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v72, 200, 0, 0));

      v1 = &CFAllocatorCreate_ptr;
      v2 = CFSTR("command");
      goto LABEL_72;
    }
    if (!objc_msgSend(v16, "isEqual:", CFSTR("getWallpaperPreviewImage")))
    {
      NSLog(CFSTR("Unknown command: %@"), v16);
      v24 = 0;
      goto LABEL_31;
    }
    v115 = v14;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("wallpaperName")));
    v119 = v63;
    if ((objc_msgSend(v63, "isEqual:", CFSTR("homescreen")) & 1) != 0)
      v64 = 1;
    else
      v64 = objc_msgSend(v63, "isEqual:", CFSTR("lockscreen")) - 1;
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v74, "scale");
    v76 = v75;
    v113 = v74;
    objc_msgSend(v74, "bounds");
    v78 = v77;
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "objectForKey:", CFSTR("widthPixels")));
    v80 = objc_opt_class(NSNumber);
    isKindOfClass = objc_opt_isKindOfClass(v79, v80);
    v82 = v78;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v79, "doubleValue", v78);
      v82 = v83 / v76;
    }
    v110 = v79;
    v84 = fmax(v82, 1.0);
    if (v78 >= v84)
      v78 = v84;
    v85 = objc_autoreleasePoolPush();
    v86 = v85;
    if (v64)
    {
      if (v64 != 1)
      {
        objc_autoreleasePoolPop(v85);
        goto LABEL_78;
      }
      CurrentHomeScreenImage = SBSUIWallpaperGetCurrentHomeScreenImage(v78);
      v88 = objc_claimAutoreleasedReturnValue(CurrentHomeScreenImage);
    }
    else
    {
      CurrentLockScreenImage = SBSUIWallpaperGetCurrentLockScreenImage(v78);
      v88 = objc_claimAutoreleasedReturnValue(CurrentLockScreenImage);
    }
    v90 = (void *)v88;
    objc_autoreleasePoolPop(v86);
    if (v90)
    {
      v91 = objc_autoreleasePoolPush();
      v92 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "sbf_imageUsingContextType:", 0));
      v93 = UIImagePNGRepresentation(v92);
      v94 = (void *)objc_claimAutoreleasedReturnValue(v93);

      objc_autoreleasePoolPop(v91);
      if (v94)
      {
        v95 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v94, CFSTR("pngData"), 0);
        v24 = (CFDataRef)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v95, 200, 0, 0));

      }
      else
      {
        v24 = 0;
      }

      v1 = &CFAllocatorCreate_ptr;
      goto LABEL_81;
    }
LABEL_78:
    v24 = 0;
LABEL_81:

LABEL_29:
    v12 = v121;
LABEL_30:
    v14 = v115;
    goto LABEL_31;
  }
  NSLog(CFSTR("Unable to parse property list data of length: %li"), objc_msgSend(v12, "length"));
  v24 = 0;
LABEL_32:

  if (v24)
  {
    LODWORD(context.version) = 0;
    LODWORD(context.version) = bswap32(-[__CFData length](v24, "length"));
    lockdown_send(v126, &context, 4);
    v49 = v126;
    v50 = objc_retainAutorelease(v24);
    lockdown_send(v49, -[__CFData bytes](v50, "bytes"), -[__CFData length](v50, "length"));

    goto LABEL_34;
  }
LABEL_84:

LABEL_85:
  objc_autoreleasePoolPop(v3);
  lockdown_disconnect(v126);
  objc_autoreleasePoolPop(v123);
  return 0;
}

uint64_t sub_100003530(vm_address_t address, vm_size_t size)
{
  return vm_deallocate(mach_task_self_, address, size);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_sbf_imageUsingContextType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sbf_imageUsingContextType:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_wallpaperConfigurationForVariant_includingValuesForTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperConfigurationForVariant:includingValuesForTypes:");
}

id objc_msgSend_wallpaperImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperImage");
}

id objc_msgSend_wallpaperType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperType");
}
