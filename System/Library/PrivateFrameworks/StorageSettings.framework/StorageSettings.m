id STStorageDeviceKey()
{
  if (STStorageDeviceKey_onceToken != -1)
    dispatch_once(&STStorageDeviceKey_onceToken, &__block_literal_global);
  return (id)STStorageDeviceKey_deviceKey;
}

id STColorForCategoryKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (STColorForCategoryKey_onceToken == -1)
  {
    if (!v1)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_once(&STColorForCategoryKey_onceToken, &__block_literal_global_0);
    if (!v2)
      goto LABEL_4;
  }
  objc_msgSend((id)STColorForCategoryKey_gCategoryColors, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
LABEL_5:

  return v3;
}

id STColorForCategory()
{
  void *v0;
  void *v1;

  STKeyForCategory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  STColorForCategoryKey(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void STLoadHeaderIconForAppID(void *a1, void *a2)
{
  id v3;
  char IsClip;
  id v5;

  v3 = a2;
  v5 = a1;
  IsClip = AppIsClip(v5);
  _STLoadHeaderIconForAppID(v5, v3, IsClip);

}

void _STLoadHeaderIconForAppID(void *a1, void *a2, char a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(id, uint64_t);
  char v13;

  v5 = a1;
  v6 = a2;
  if (_STLoadHeaderIconForAppID_onceToken != -1)
    dispatch_once(&_STLoadHeaderIconForAppID_onceToken, &__block_literal_global_2);
  _CachedIconForAppID((void *)_gHeaderIconsByID, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v6[2](v6, v7);
  }
  else
  {
    if (_gTableIconsByID)
    {
      _CachedIconForAppID((void *)_gTableIconsByID, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v6[2](v6, (uint64_t)v8);
    }
    else
    {
      v8 = 0;
    }
    getIconLoaderQueue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___STLoadHeaderIconForAppID_block_invoke_2;
    v10[3] = &unk_24C756A38;
    v11 = v5;
    v13 = a3;
    v12 = v6;
    objc_msgSend(v9, "addOperationWithBlock:", v10);

  }
}

BOOL AppIsClip(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v1 = (objc_class *)MEMORY[0x24BDC1540];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v2, 1, 0);

  objc_msgSend(v3, "appClipMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

void STLoadHeaderIconForApp(void *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "appIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppClip");

  _STLoadHeaderIconForAppID(v6, v3, v5);
}

void STLoadTableIconForAppID(void *a1, void *a2)
{
  id v3;
  char IsClip;
  id v5;

  v3 = a2;
  v5 = a1;
  IsClip = AppIsClip(v5);
  _STLoadTableIconForAppID(v5, v3, IsClip);

}

void _STLoadTableIconForAppID(void *a1, void *a2, char a3)
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(id, void *);
  char v12;

  v5 = a1;
  v6 = a2;
  if (_STLoadTableIconForAppID_onceToken != -1)
    dispatch_once(&_STLoadTableIconForAppID_onceToken, &__block_literal_global_34);
  _CachedIconForAppID((void *)_gTableIconsByID, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    getIconLoaderQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___STLoadTableIconForAppID_block_invoke_2;
    v9[3] = &unk_24C756A38;
    v10 = v5;
    v12 = a3;
    v11 = v6;
    objc_msgSend(v8, "addOperationWithBlock:", v9);

  }
}

void STLoadTableIconForApp(void *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "appIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppClip");

  _STLoadTableIconForAppID(v6, v3, v5);
}

id _CachedIconForAppID(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "length"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_iconsLock);
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&_iconsLock);
  }
  else
  {
    PSBlankIconImage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id getIconLoaderQueue()
{
  if (getIconLoaderQueue_onceToken != -1)
    dispatch_once(&getIconLoaderQueue_onceToken, &__block_literal_global_1);
  return (id)getIconLoaderQueue__iconLoaderQueue;
}

id _LoadIconForAppID(void *a1, void *a2, int a3, int a4)
{
  id v7;
  id v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  double v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  const __CFString *v32;
  __CFString *v33;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v7 = a1;
  v8 = a2;
  if (!objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.")))
    goto LABEL_11;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB1CF8]))
  {
    v9 = CFSTR("Calendar");
LABEL_9:
    STFrameworkImage(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.VideosUsage")))
  {
    v9 = CFSTR("Videos");
    goto LABEL_9;
  }
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB1D10]) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB1D08]))
  {
    v9 = CFSTR("iCloudDriveIcon");
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB1D18]))
  {
    objc_msgSend(MEMORY[0x24BDF8238], "_typeOfCurrentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(MEMORY[0x24BE51AB8], "symbolForTypeIdentifier:error:", v24, &v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v25, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "systemImageNamed:", v27);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v28 = MGGetSInt32Answer();
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "userInterfaceIdiom");

      v31 = CFSTR("LocalStorageOldPhoneIcon");
      if (v28 == 2)
        v31 = CFSTR("LocalStoragePhoneIcon");
      v32 = CFSTR("LocalStoragePadIcon");
      if (v28 != 2)
        v32 = CFSTR("LocalStorageOldPadIcon");
      if (v30 == 1)
        v31 = (__CFString *)v32;
      v33 = v31;
      STFrameworkImage(v33);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v11)
      goto LABEL_23;
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ToneSettingsUsage")))
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("speaker.wave.2.circle.fill"));
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (id)v10;
      if (!v10)
        goto LABEL_11;
LABEL_23:
      os_unfair_lock_lock((os_unfair_lock_t)&_iconsLock);
      objc_msgSend(v7, "setObject:forKey:", v11, v8);
      os_unfair_lock_unlock((os_unfair_lock_t)&_iconsLock);
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB1D20]))
    {
      v34 = (id)*MEMORY[0x24BEB1D00];

      v8 = v34;
    }
  }
LABEL_11:
  ScreenScale();
  if (a3)
    v12 = 58.0;
  else
    v12 = 29.0;
  v13 = objc_alloc(MEMORY[0x24BE51AB0]);
  ScreenScale();
  v15 = (void *)objc_msgSend(v13, "initWithSize:scale:", v12, v12, v14);
  v16 = v15;
  if (a4)
    v17 = 5;
  else
    v17 = 0;
  objc_msgSend(v15, "setShape:", v17);
  objc_msgSend(v16, "setDrawBorder:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v8);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BE51A90], "genericApplicationIcon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

      v11 = 0;
      goto LABEL_24;
    }
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v19 = dispatch_semaphore_create(0);
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = ___LoadIconForAppID_block_invoke;
  v35[3] = &unk_24C756A80;
  v37 = &v38;
  v20 = v19;
  v36 = v20;
  objc_msgSend(v18, "getCGImageForImageDescriptor:completion:", v16, v35);
  v21 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v20, v21);
  if (v39[3])
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    CGImageRelease((CGImageRef)v39[3]);

  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v38, 8);
  if (v11)
    goto LABEL_23;
LABEL_24:

  return v11;
}

void sub_20D672BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getIconLoaderQueue_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)getIconLoaderQueue__iconLoaderQueue;
  getIconLoaderQueue__iconLoaderQueue = (uint64_t)v0;

  objc_msgSend((id)getIconLoaderQueue__iconLoaderQueue, "setMaxConcurrentOperationCount:", 3);
  return objc_msgSend((id)getIconLoaderQueue__iconLoaderQueue, "setQualityOfService:", 25);
}

id STFrameworkLocStr(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _FrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _FrameworkBundle()
{
  if (_FrameworkBundle_onceToken != -1)
    dispatch_once(&_FrameworkBundle_onceToken, &__block_literal_global_3);
  return (id)_FrameworkBundle_bundle;
}

id STFrameworkImage(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDF6AC8];
  v2 = a1;
  _FrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t PSBlankIconImage()
{
  return MEMORY[0x24BE758A0]();
}

uint64_t STFormattedShortDate()
{
  return MEMORY[0x24BEB1CD8]();
}

uint64_t STFormattedSize()
{
  return MEMORY[0x24BEB1CE0]();
}

uint64_t STKeyForCategory()
{
  return MEMORY[0x24BEB1CE8]();
}

uint64_t STSharedConcurrentQueue()
{
  return MEMORY[0x24BEB1CF0]();
}

uint64_t ScreenScale()
{
  return MEMORY[0x24BE75DE0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BDF78E8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BDF78F0](context);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

