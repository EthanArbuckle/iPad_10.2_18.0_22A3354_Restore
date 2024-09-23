uint64_t CAFPreferencesGetBoolean(const __CFString *a1, unsigned int a2)
{
  _BOOL4 v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = CFPreferencesGetAppBooleanValue(a1, CFSTR("com.apple.CarAccessoryFramework"), &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v3;
  else
    return a2;
}

id CAFPreferencesGetArray(const __CFString *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  char isKindOfClass;
  id v9;

  v3 = a2;
  v4 = (void *)CFPreferencesCopyAppValue(a1, CFSTR("com.apple.CarAccessoryFramework"));
  v5 = objc_opt_class(NSArray);
  v6 = v4;
  v7 = v6;
  if (!v6 || (isKindOfClass = objc_opt_isKindOfClass(v6, v5), v9 = v7, (isKindOfClass & 1) == 0))
  {

    v9 = v3;
  }

  return v9;
}

BOOL CAFDefaultsHasValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", v1));

  return v3 != 0;
}

id CAFDefaultsGetBoolean(void *a1, id a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", v3));

  if (v5)
    a2 = objc_msgSend(v5, "BOOLValue");

  return a2;
}

void sub_10000377C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000092F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009818(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10000A078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 72), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_17(void *a1, const char *a2)
{
  return objc_msgSend(a1, "assertionCount");
}

NSMutableData *CAFImageDataByScalingImageData(void *a1, double a2, double a3)
{
  id v5;
  id v6;
  const __CFData *v7;
  const __CFData *v8;
  NSMutableData *v9;
  CGImageSource *v10;
  CGImageSource *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFNumber *Value;
  _BOOL4 v15;
  const __CFNumber *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFNumber *v19;
  double v20;
  double v21;
  double v23;
  CFDictionaryRef v24;
  CGImageRef ImageAtIndex;
  void *v26;
  float v27;
  float v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  CGImageDestinationRef v32;
  CGImageDestination *v33;
  void *v34;
  void *v35;
  int valuePtr;

  v5 = a1;
  v6 = objc_msgSend(v5, "length");
  v7 = (const __CFData *)v5;
  v8 = v7;
  v9 = (NSMutableData *)v7;
  if (!v6)
    goto LABEL_43;
  if (!v7)
  {
LABEL_42:
    v9 = v8;
    goto LABEL_43;
  }
  v10 = CGImageSourceCreateWithData(v7, 0);
  if (!v10)
  {
LABEL_8:

    goto LABEL_42;
  }
  v11 = v10;
  v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
  if (!v12)
  {
    CFRelease(v11);
    goto LABEL_8;
  }
  v13 = v12;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(v12, kCGImagePropertyOrientation);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    v15 = valuePtr > 4;
  }
  else
  {
    v15 = 0;
  }
  v16 = (const __CFNumber *)CFDictionaryGetValue(v13, kCGImagePropertyPixelWidth);
  if (v16 && CFNumberGetValue(v16, kCFNumberIntType, &valuePtr))
  {
    if (v15)
      v17 = 0;
    else
      v17 = valuePtr;
    if (v15)
      v18 = valuePtr;
    else
      v18 = 0;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  v19 = (const __CFNumber *)CFDictionaryGetValue(v13, kCGImagePropertyPixelHeight);
  if (v19 && CFNumberGetValue(v19, kCFNumberIntType, &valuePtr))
  {
    if (v15)
      v17 = valuePtr;
    else
      v18 = valuePtr;
  }
  CFRelease(v13);

  v20 = (double)v17;
  v21 = (double)v18;
  if (a2 >= (double)v17 && a3 >= v21)
  {
    CFRelease(v11);
    goto LABEL_42;
  }
  if (a2 / v20 >= a3 / v21)
    v23 = a3 / v21;
  else
    v23 = a2 / v20;
  if (CGImageSourceGetCount(v11))
  {
    v24 = CGImageSourceCopyPropertiesAtIndex(v11, 0, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
    if (ImageAtIndex)
    {
      v26 = ImageAtIndex;
      v27 = v23 * v20;
      v28 = v23 * v21;
      v29 = vcvtms_u32_f32(v28);
      if (vcvtms_u32_f32(v27))
        v30 = v29 == 0;
      else
        v30 = 1;
      if (!v30)
      {
        v31 = CGImageCreateByScaling(ImageAtIndex);
        CFRelease(v26);
        v26 = (void *)v31;
      }
      v9 = objc_opt_new(NSMutableData);
      v32 = CGImageDestinationCreateWithData((CFMutableDataRef)v9, CFSTR("public.jpeg"), 1uLL, 0);
      if (v32)
      {
        v33 = v32;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v24));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.75));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, kCGImageDestinationLossyCompressionQuality);

        CGImageDestinationAddImage(v33, (CGImageRef)v26, (CFDictionaryRef)v34);
        CGImageDestinationFinalize(v33);
        CFRelease(v33);

      }
      CGImageRelease((CGImageRef)v26);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  CFRelease(v11);
LABEL_43:

  return v9;
}

void sub_10000C164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t Boolean;
  int v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  id v10;
  CAFDCarDataServiceAgent *v11;
  id v12;
  id v13;
  _TtC13caraccessoryd22CAFDAssetVariantsAgent *v14;
  void *v15;
  void *v16;
  _TtC13caraccessoryd19CAFDNowPlayingAgent *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *context;
  uint8_t buf[4];
  CAFDCarDataServiceAgent *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  context = objc_autoreleasePoolPush();
  CAFSignpostEmit_Launched();
  Boolean = CAFPreferencesGetBoolean(CFSTR("fastStartupRegistration"), 1u);
  v4 = Boolean;
  v5 = CAFDLogging(Boolean);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cafd starting with fastStartup", buf, 2u);
    }

    v8 = objc_alloc((Class)CAFCarManagerMutableConfiguration);
    v6 = objc_claimAutoreleasedReturnValue(+[CAFRegistrations fastStartup](CAFRegistrations, "fastStartup"));
    v9 = objc_msgSend(v8, "initWithRegistrationDictionary:", v6);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cafd starting without fastStartup", buf, 2u);
    }
    v9 = 0;
  }

  v10 = objc_alloc_init((Class)CARSessionStatus);
  v25 = v9;
  v11 = -[CAFDCarDataServiceAgent initWithSessionStatus:config:]([CAFDCarDataServiceAgent alloc], "initWithSessionStatus:config:", v10, v9);
  v12 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.caraccessoryframework.cardata"));
  objc_msgSend(v12, "setDelegate:", v11);
  objc_msgSend(v12, "activate");
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_0);
  v13 = objc_alloc_init((Class)CAFCarManager);
  v14 = -[CAFDAssetVariantsAgent initWithCarManager:sessionStatus:]([_TtC13caraccessoryd22CAFDAssetVariantsAgent alloc], "initWithCarManager:sessionStatus:", v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDAssetVariantsAgent domain](v14, "domain"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BSServicesConfiguration activateManualDomain:](BSServicesConfiguration, "activateManualDomain:", v15));

  v17 = -[CAFDNowPlayingAgent initWithCarManager:]([_TtC13caraccessoryd19CAFDNowPlayingAgent alloc], "initWithCarManager:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CAFDAgent domain](v17, "domain"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BSServicesConfiguration activateManualDomain:](BSServicesConfiguration, "activateManualDomain:", v18));

  v21 = CAFDLogging(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v11;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "cafd ready %@ %@ %@", buf, 0x20u);
  }

  objc_autoreleasePoolPop(context);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v23, "run");

  return 0;
}

void __main_block_invoke(id a1, OS_xpc_object *a2)
{
  const char *string;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    v4 = CAFDLogging(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling %@ notification", (uint8_t *)&v6, 0xCu);
    }

  }
}

void sub_1000122A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_3_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  return objc_opt_class(v0);
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void OUTLINED_FUNCTION_11_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t variable initialization expression of CAFDAgent.listener()
{
  return 0;
}

uint64_t variable initialization expression of CAFDAssetVariantsAgent.workQueue()
{
  uint64_t v0;
  uint64_t v1;
  NSString v2;
  id v3;
  uint64_t v4;

  type metadata accessor for CAUVariantsService(0);
  static CAUVariantsService.identifier.getter();
  v1 = v0;
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  v3 = objc_msgSend((id)objc_opt_self(BSDispatchQueueAttributes), "serial");
  v4 = BSDispatchQueueCreate(v2, v3);

  return v4;
}

void variable initialization expression of CAFDAssetVariantsAgent.connections()
{
  variable initialization expression of CAFDAssetVariantsAgent.connections((uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAssetVariantsAgent._ConnectionProxy>, (void (*)(_QWORD))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
}

uint64_t CAFDAssetVariantsAgent.assetVariants.willset(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter(v5);
  swift_bridgeObjectRetain_n(a1, 2);
  v8 = v1;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc(22, -1);
    v23 = v4;
    v12 = v11;
    v13 = swift_slowAlloc(64, -1);
    v25 = v13;
    *(_DWORD *)v12 = 136315394;
    v24 = *(_QWORD *)&v8[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants];
    swift_bridgeObjectRetain(v24);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CAUVehicleTrait : String]?);
    v15 = String.init<A>(describing:)(&v24, v14);
    v22 = v3;
    v17 = v16;
    v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);

    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v12 + 12) = 2080;
    v24 = a1;
    swift_bridgeObjectRetain(a1);
    v18 = String.init<A>(describing:)(&v24, v14);
    v20 = v19;
    v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "updating assetVariants from %s to %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(v13, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v7, v22);
  }
  else
  {

    swift_bridgeObjectRelease_n(a1, 2);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t CAFDAssetVariantsAgent.assetExtrasURL.willset(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter(v5);
  v8 = a1;
  v9 = v1;
  v10 = v8;
  v11 = (char *)v9;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v32 = v4;
    v15 = v14;
    v16 = swift_slowAlloc(64, -1);
    v30 = v16;
    *(_DWORD *)v15 = 136315394;
    v33 = *(id *)&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL];
    v34 = v16;
    v17 = v33;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSSecurityScopedURLWrapper?);
    v31 = v3;
    v19 = v18;
    v20 = String.init<A>(describing:)(&v33, v18);
    v22 = v21;
    v33 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);

    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v15 + 12) = 2080;
    v33 = a1;
    v23 = v10;
    v24 = String.init<A>(describing:)(&v33, v19);
    v26 = v25;
    v33 = (id)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);

    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "updating assetExtrasURL from %s to %s", (uint8_t *)v15, 0x16u);
    v27 = v30;
    swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v7, v31);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

void specialized Sequence.forEach(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char **v20;
  NSObject *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char **v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[2];
  char *v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[5];
  void *v54;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v6 = a1;
    else
      v6 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = __CocoaSet.makeIterator()(v6);
    v8 = type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy();
    v9 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAFDAssetVariantsAgent._ConnectionProxy and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy, (uint64_t)&protocol conformance descriptor for NSObject);
    v10 = Set.Iterator.init(_cocoa:)(v53, v7, v8, v9);
    a1 = v53[0];
    v46 = v53[1];
    v12 = v53[2];
    v13 = v53[3];
    v14 = v53[4];
  }
  else
  {
    v15 = -1 << *(_BYTE *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 56);
    v46 = a1 + 56;
    v17 = ~v15;
    v18 = -v15;
    if (v18 < 64)
      v19 = ~(-1 << v18);
    else
      v19 = -1;
    v14 = v19 & v16;
    v10 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v12 = v17;
    v13 = 0;
  }
  v42[1] = v12;
  v44 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v45 = (unint64_t)(v12 + 64) >> 6;
  *(_QWORD *)&v11 = 138412290;
  v48 = v11;
  v20 = &selRef_remoteProxies;
  v43 = (char *)&type metadata for Swift.AnyObject + 8;
  v49 = v5;
  v47 = v3;
  while (a1 < 0)
  {
    v24 = __CocoaSet.Iterator.next()(v10);
    if (!v24)
      goto LABEL_38;
    v25 = v24;
    v52 = v24;
    v26 = type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy();
    swift_unknownObjectRetain(v25);
    swift_dynamicCast(&v54, &v52, v43, v26, 7);
    v27 = v54;
    v28 = (id)swift_unknownObjectRelease(v25);
    v23 = v13;
    v51 = v14;
    if (!v27)
      goto LABEL_38;
LABEL_36:
    v50 = v23;
    static Logger.assetVariants.getter(v28);
    v32 = v27;
    v21 = Logger.logObject.getter(v32);
    v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v33))
    {
      v34 = v2;
      v35 = a1;
      v36 = swift_slowAlloc(12, -1);
      v37 = v20;
      v38 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v36 = v48;
      *(_QWORD *)(v36 + 4) = v32;
      *v38 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, v33, "queuing refresh %@", (uint8_t *)v36, 0xCu);
      v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v38, 1, v39);
      v40 = v38;
      v20 = v37;
      swift_slowDealloc(v40, -1, -1);
      v41 = v36;
      a1 = v35;
      v2 = v34;
      v3 = v47;
      v5 = v49;
      swift_slowDealloc(v41, -1, -1);
    }
    else
    {

      v21 = v32;
    }
    v14 = v51;

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v32, v20[172]);

    v13 = v50;
  }
  if (v14)
  {
    v51 = (v14 - 1) & v14;
    v22 = __clz(__rbit64(v14)) | (v13 << 6);
    v23 = v13;
LABEL_35:
    v28 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v22);
    v27 = v28;
    if (!v28)
      goto LABEL_38;
    goto LABEL_36;
  }
  v29 = v13 + 1;
  if (!__OFADD__(v13, 1))
  {
    if (v29 >= v45)
      goto LABEL_38;
    v30 = *(_QWORD *)(v46 + 8 * v29);
    v23 = v13 + 1;
    if (!v30)
    {
      v23 = v13 + 2;
      if (v13 + 2 >= v45)
        goto LABEL_38;
      v30 = *(_QWORD *)(v46 + 8 * v23);
      if (!v30)
      {
        v23 = v13 + 3;
        if (v13 + 3 >= v45)
          goto LABEL_38;
        v30 = *(_QWORD *)(v46 + 8 * v23);
        if (!v30)
        {
          v23 = v13 + 4;
          if (v13 + 4 >= v45)
            goto LABEL_38;
          v30 = *(_QWORD *)(v46 + 8 * v23);
          if (!v30)
          {
            v23 = v13 + 5;
            if (v13 + 5 >= v45)
              goto LABEL_38;
            v30 = *(_QWORD *)(v46 + 8 * v23);
            if (!v30)
            {
              v31 = v13 + 6;
              while (v45 != v31)
              {
                v30 = *(_QWORD *)(v46 + 8 * v31++);
                if (v30)
                {
                  v23 = v31 - 1;
                  goto LABEL_34;
                }
              }
LABEL_38:
              outlined consume of Set<CAFDAssetVariantsAgent._ConnectionProxy>.Iterator._Variant(a1);
              return;
            }
          }
        }
      }
    }
LABEL_34:
    v51 = (v30 - 1) & v30;
    v22 = __clz(__rbit64(v30)) + (v23 << 6);
    goto LABEL_35;
  }
  __break(1u);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  __objc2_class_ro **p_info;
  _QWORD *v16;
  char **v17;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  char **v32;
  uint64_t v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[5];
  uint64_t v46;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = type metadata accessor for CAFDAgent._CAFDConnectionProxy();
    v5 = lazy protocol witness table accessor for type CAFDAgent._CAFDConnectionProxy and conformance NSObject();
    v6 = Set.Iterator.init(_cocoa:)(v45, v3, v4, v5);
    v1 = v45[0];
    v40 = v45[1];
    v7 = v45[2];
    v8 = v45[3];
    v9 = v45[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v40 = a1 + 56;
    v11 = ~v10;
    v12 = -v10;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v9 = v13 & *(_QWORD *)(a1 + 56);
    v6 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v7 = v11;
    v8 = 0;
  }
  v39 = (unint64_t)(v7 + 64) >> 6;
  v14 = static Logger.nowPlaying;
  p_info = _TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy.info;
  v16 = (_QWORD *)&__block_descriptor_96_e8_32s40s48s56s64s72s80s88bs_e5_v8__0ls32l8s40l8s48l8s56l8s64l8s72l8s80l8s88l8;
  v17 = &selRef_remoteProxies;
  while (v1 < 0)
  {
    v21 = __CocoaSet.Iterator.next()(v6);
    if (!v21)
      goto LABEL_40;
    v22 = v21;
    v43 = v21;
    v23 = type metadata accessor for CAFDAgent._CAFDConnectionProxy();
    swift_unknownObjectRetain(v22);
    swift_dynamicCast(&v44, &v43, (char *)&type metadata for Swift.AnyObject + 8, v23, 7);
    v24 = v44;
    swift_unknownObjectRelease(v22);
    v20 = v8;
    v42 = v9;
    if (!v24)
      goto LABEL_40;
LABEL_36:
    v41 = v20;
    if (p_info[136] != (__objc2_class_ro *)-1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    v28 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v28, (uint64_t)v14);
    v29 = v24;
    v18 = Logger.logObject.getter(v29);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v30))
    {
      v31 = swift_slowAlloc(12, -1);
      v32 = v17;
      v33 = v1;
      v34 = v14;
      v35 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v31 = 138412290;
      *(_QWORD *)(v31 + 4) = v29;
      *v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, v30, "queuing now playing refresh for %@", (uint8_t *)v31, 0xCu);
      v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v35, 1, v36);
      v37 = v35;
      v14 = v34;
      v1 = v33;
      v17 = v32;
      swift_slowDealloc(v37, -1, -1);
      v38 = v31;
      p_info = (__objc2_class_ro **)(_TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy + 32);
      v16 = &__block_descriptor_96_e8_32s40s48s56s64s72s80s88bs_e5_v8__0ls32l8s40l8s48l8s56l8s64l8s72l8s80l8s88l8;
      swift_slowDealloc(v38, -1, -1);
    }
    else
    {

      v18 = v29;
    }
    v9 = v42;

    v46 = v16[397];
    objc_msgSend((id)swift_dynamicCastObjCProtocolUnconditional(v29, 1, &v46, 0, 0, 0), v17[201]);

    v8 = v41;
  }
  if (v9)
  {
    v42 = (v9 - 1) & v9;
    v19 = __clz(__rbit64(v9)) | (v8 << 6);
    v20 = v8;
LABEL_35:
    v24 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v19);
    if (!v24)
      goto LABEL_40;
    goto LABEL_36;
  }
  v25 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v25 >= v39)
      goto LABEL_40;
    v26 = *(_QWORD *)(v40 + 8 * v25);
    v20 = v8 + 1;
    if (!v26)
    {
      v20 = v8 + 2;
      if (v8 + 2 >= v39)
        goto LABEL_40;
      v26 = *(_QWORD *)(v40 + 8 * v20);
      if (!v26)
      {
        v20 = v8 + 3;
        if (v8 + 3 >= v39)
          goto LABEL_40;
        v26 = *(_QWORD *)(v40 + 8 * v20);
        if (!v26)
        {
          v20 = v8 + 4;
          if (v8 + 4 >= v39)
            goto LABEL_40;
          v26 = *(_QWORD *)(v40 + 8 * v20);
          if (!v26)
          {
            v20 = v8 + 5;
            if (v8 + 5 >= v39)
              goto LABEL_40;
            v26 = *(_QWORD *)(v40 + 8 * v20);
            if (!v26)
            {
              v27 = v8 + 6;
              while (v39 != v27)
              {
                v26 = *(_QWORD *)(v40 + 8 * v27++);
                if (v26)
                {
                  v20 = v27 - 1;
                  goto LABEL_34;
                }
              }
LABEL_40:
              outlined consume of Set<CAFDAssetVariantsAgent._ConnectionProxy>.Iterator._Variant(v1);
              return;
            }
          }
        }
      }
    }
LABEL_34:
    v42 = (v26 - 1) & v26;
    v19 = __clz(__rbit64(v26)) + (v20 << 6);
    goto LABEL_35;
  }
  __break(1u);
}

char *CAFDAssetVariantsAgent.__allocating_init(carManager:sessionStatus:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(a1, a2);
}

char *CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(void *a1, void *a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject **v26;
  uint64_t v27;
  uint8_t *v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  id v31;
  objc_class *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char *v37;
  id v38;
  char *result;
  uint64_t v40;
  void *v41;
  char *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  id v47;
  NSObject **v48;
  uint64_t v49;
  void *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void **aBlock;
  _QWORD v55[4];
  uint64_t v56;
  objc_super v57;

  v3 = v2;
  v53 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v53 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v51 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v48 - v9;
  v52 = &v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_carManager];
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager] = 0;
  v11 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue;
  type metadata accessor for CAUVariantsService(0);
  v12 = v2;
  static CAUVariantsService.identifier.getter();
  v14 = v13;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  v16 = objc_msgSend((id)objc_opt_self(BSDispatchQueueAttributes), "serial");
  v17 = BSDispatchQueueCreate(v15, v16);

  *(_QWORD *)&v3[v11] = v17;
  *(_QWORD *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener] = 0;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&_swiftEmptyArrayStorage, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAssetVariantsAgent._ConnectionProxy>, (void (*)(_QWORD))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
  }
  else
  {
    v18 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections] = v18;
  *(_QWORD *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants] = 0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL] = 0;
  static Logger.assetVariants.getter();
  v19 = a1;
  v20 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc(12, -1);
    v50 = a2;
    v23 = (uint8_t *)v22;
    v48 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v23 = 138412290;
    aBlock = (void **)&v19->isa;
    v24 = v19;
    v49 = v6;
    v25 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v55);
    v26 = v48;
    *v48 = v19;

    v6 = v49;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Initializing with carManager %@", v23, 0xCu);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v26, 1, v27);
    swift_slowDealloc(v26, -1, -1);
    v28 = v23;
    a2 = v50;
    swift_slowDealloc(v28, -1, -1);
  }
  else
  {

    v20 = v19;
  }

  v29 = *(void (**)(char *, uint64_t))(v6 + 8);
  v30 = v53;
  v29(v10, v53);
  swift_unknownObjectWeakAssign(v52, v19);
  *(_QWORD *)&v12[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_sessionStatus] = a2;
  v31 = a2;

  v32 = (objc_class *)type metadata accessor for CAFDAssetVariantsAgent();
  v57.receiver = v12;
  v57.super_class = v32;
  v33 = objc_msgSendSuper2(&v57, "init");
  *(&v48 - 2) = (NSObject **)__chkstk_darwin(v33);
  v34 = swift_allocObject(&unk_1000311C8, 32, 7);
  *(_QWORD *)(v34 + 16) = partial apply for closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:);
  *(_QWORD *)(v34 + 24) = &v48 - 4;
  v55[3] = partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v56 = v34;
  aBlock = _NSConcreteStackBlock;
  v55[0] = 1107296256;
  v55[1] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v55[2] = &block_descriptor;
  v35 = _Block_copy(&aBlock);
  v36 = (void *)objc_opt_self(BSServiceConnectionListener);
  v37 = (char *)v33;
  swift_retain(v34);
  v38 = objc_msgSend(v36, "listenerWithConfigurator:", v35);
  _Block_release(v35);
  swift_release(v56);
  LOBYTE(v35) = swift_isEscapingClosureAtFileLocation(v34, "", 0, 0, 0, 1);
  result = (char *)swift_release(v34);
  if ((v35 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v40 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener;
    v41 = *(void **)&v37[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener];
    *(_QWORD *)&v37[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_listener] = v38;

    v42 = v51;
    v43 = static Logger.assetVariants.getter();
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "activating listener", v46, 2u);
      swift_slowDealloc(v46, -1, -1);
    }

    v29(v42, v30);
    result = *(char **)&v37[v40];
    if (result)
    {
      objc_msgSend(result, "activate");
      -[NSObject registerObserver:](v19, "registerObserver:", v37);
      v47 = -[NSObject currentCar](v19, "currentCar");
      objc_msgSend(v37, "carManager:didUpdateCurrentCar:", v19, v47);

      return v37;
    }
  }
  __break(1u);
  return result;
}

id closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  type metadata accessor for CAUVariantsService(0);
  static CAUVariantsService.domain.getter();
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  objc_msgSend(a1, "setDomain:", v6);

  static CAUVariantsService.identifier.getter();
  v8 = v7;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  objc_msgSend(a1, "setService:", v9);

  return objc_msgSend(a1, "setDelegate:", a2);
}

uint64_t thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain(a2);
  v3(a2);
  return swift_unknownObjectRelease(a2);
}

id CAFDAgent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void CAFDAssetVariantsAgent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("caraccessoryd.CAFDAssetVariantsAgent", 36, "init()", 6, 0);
  __break(1u);
}

id CAFDAssetVariantsAgent.__deallocating_deinit(uint64_t a1)
{
  return CAFDAssetVariantsAgent.__deallocating_deinit(a1, type metadata accessor for CAFDAssetVariantsAgent);
}

void CAFDAssetVariantsAgent.carManager(_:didUpdateCurrentCar:)(uint64_t a1, void *a2)
{
  specialized CAFDAssetVariantsAgent.carManager(_:didUpdateCurrentCar:)(a2);
}

void CAFDAssetVariantsAgent.carDidUpdateAccessories(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter(v6);
  v9 = a1;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v24 = v5;
    v25 = v4;
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v27 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = objc_msgSend(v9, "vehicleResources");
    if (v14)
    {
      v15 = v14;
      v16 = objc_msgSend(v14, "description");

      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
      v19 = v18;

    }
    else
    {
      v19 = 0xE300000000000000;
      v17 = 7104878;
    }
    v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);

    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Checking for vehicleResources: %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v25);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  v20 = objc_msgSend(v9, "vehicleResources");
  v21 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources;
  v22 = *(void **)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources) = v20;

  v23 = *(void **)(v2 + v21);
  if (v23)
    objc_msgSend(v23, "registerObserver:", v2);
  CAFDAssetVariantsAgent.updateAssetVariants()();
}

Swift::Void __swiftcall CAFDAssetVariantsAgent.updateAssetVariants()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  void (*v25)(char *, _QWORD, uint64_t);
  id v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void (*v34)(char *, _QWORD, uint64_t);
  uint64_t *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  NSObject *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  unint64_t v74[3];

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v70 - v6;
  v8 = type metadata accessor for CAUVehicleTrait(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void **)(v0 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources);
  if (v13)
  {
    v14 = v13;
    v15 = -[NSObject receivedAllValues](v14, "receivedAllValues");
    if ((_DWORD)v15)
    {
      v72 = v12;
      v73 = v0;
      v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CAUVehicleTrait, String)>);
      v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAUVehicleTrait, String));
      v18 = *(_QWORD *)(v17 - 8);
      v19 = *(_QWORD *)(v18 + 72);
      v20 = *(unsigned __int8 *)(v18 + 80);
      v21 = (v20 + 32) & ~v20;
      v22 = swift_allocObject(v16, v21 + 2 * v19, v20 | 7);
      v70 = v22;
      *(_OWORD *)(v22 + 16) = xmmword_100025E60;
      v23 = v22 + v21;
      v24 = (uint64_t *)(v23 + *(int *)(v17 + 48));
      v25 = *(void (**)(char *, _QWORD, uint64_t))(v9 + 104);
      v25((char *)v23, enum case for CAUVehicleTrait.exteriorStyle(_:), v8);
      v26 = -[NSObject vehicleVariant](v14, "vehicleVariant");
      v27 = objc_msgSend(v26, "exteriorStyle");
      v71 = v9;
      v28 = v14;
      v29 = v27;

      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
      v32 = v31;

      v33 = v28;
      *v24 = v30;
      v24[1] = v32;
      v34 = v25;
      v35 = (uint64_t *)(v23 + v19 + *(int *)(v17 + 48));
      ((void (*)(void))v25)();
      v36 = -[NSObject vehicleVariant](v28, "vehicleVariant");
      v37 = objc_msgSend(v36, "interiorStyle");

      v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
      v40 = v39;

      *v35 = v38;
      v35[1] = v40;
      v41 = specialized Dictionary.init(dictionaryLiteral:)(v70);
      v42 = -[NSObject vehicleVariant](v28, "vehicleVariant");
      v43 = objc_msgSend(v42, "vehicleLayout");

      if (v43)
      {
        v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
        v46 = v45;

        v47 = (uint64_t)v72;
        v34(v72, enum case for CAUVehicleTrait.vehicleLayout(_:), v8);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v41);
        v74[0] = v41;
        specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v44, v46, v47, isUniquelyReferenced_nonNull_native);
        v41 = v74[0];
        swift_bridgeObjectRelease(0x8000000000000000);
        v49 = v71;
        (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v47, v8);
      }
      else
      {
        v49 = v71;
        v47 = (uint64_t)v72;
      }
      v59 = -[NSObject vehicleVariant](v33, "vehicleVariant");
      v60 = objc_msgSend(v59, "audioLogo");

      v61 = v73;
      if (v60)
      {
        v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
        v64 = v63;

        v34((char *)v47, enum case for CAUVehicleTrait.audioBrandLogo(_:), v8);
        v65 = swift_isUniquelyReferenced_nonNull_native(v41);
        v74[0] = v41;
        specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v62, v64, v47, v65);
        v41 = v74[0];
        swift_bridgeObjectRelease(0x8000000000000000);
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v8);
      }
      CAFDAssetVariantsAgent.assetVariants.willset(v41);
      v66 = *(_QWORD *)(v61 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants);
      *(_QWORD *)(v61 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants) = v41;
      swift_bridgeObjectRelease(v66);
      v67 = (uint64_t *)(v61 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections);
      swift_beginAccess(v61 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections, v74, 0, 0);
      v68 = *v67;
      v69 = swift_bridgeObjectRetain(v68);
      specialized Sequence.forEach(_:)(v69);

      swift_bridgeObjectRelease(v68);
    }
    else
    {
      v54 = static Logger.assetVariants.getter(v15);
      v55 = Logger.logObject.getter(v54);
      v56 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "Missing values from variants", v57, 2u);
        swift_slowDealloc(v57, -1, -1);
        v58 = v14;
      }
      else
      {
        v58 = v55;
        v55 = v14;
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    }
  }
  else
  {
    v50 = static Logger.assetVariants.getter(v10);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "No vehicleResources", v53, 2u);
      swift_slowDealloc(v53, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t CAFDAssetVariantsAgent.clusterThemeManager(_:didUpdateExtraAssetsURL:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[24];

  v4 = a2;
  CAFDAssetVariantsAgent.assetExtrasURL.willset(a2);
  v5 = *(void **)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL) = a2;
  v6 = v4;

  v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections);
  swift_beginAccess(v7, v11, 0, 0);
  v8 = *v7;
  v9 = swift_bridgeObjectRetain(v8);
  specialized Sequence.forEach(_:)(v9);

  return swift_bridgeObjectRelease(v8);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAUVehicleTrait, String));
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v25 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v25);
    return (unint64_t)v8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CAUVehicleTrait, String>);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    outlined init with copy of (CAUVehicleTrait, String)(v13, (uint64_t)v5);
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for CAUVehicleTrait(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    v20 = (_QWORD *)(v8[7] + 16 * v17);
    v21 = *((_QWORD *)v10 + 1);
    *v20 = *(_QWORD *)v10;
    v20[1] = v21;
    v22 = v8[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_12;
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v25 = v27;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void CAFDAssetVariantsAgent.listener(_:didReceive:withContext:)(uint64_t a1, void *a2)
{
  specialized CAFDAssetVariantsAgent.listener(_:didReceive:withContext:)(a2);
}

uint64_t BSServiceConnectionHost.CAFDDescription.getter(uint64_t a1)
{
  void *v1;
  void *v2;
  Swift::String v4;
  id v5;
  Swift::String v6;
  void *object;
  Swift::String v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String v14;
  void *v16;
  uint64_t v17;
  unint64_t v18;

  v2 = v1;
  v17 = 0;
  v18 = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  v16 = v1;
  DefaultStringInterpolation.appendInterpolation<A>(_:)(&v16, a1);
  v4._countAndFlagsBits = 0x3D64697020;
  v4._object = (void *)0xE500000000000000;
  String.append(_:)(v4);
  v5 = objc_msgSend(v1, "remoteToken");
  LODWORD(a1) = objc_msgSend(v5, "pid");

  LODWORD(v16) = a1;
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  v8._countAndFlagsBits = 0x3D656C646E756220;
  v8._object = (void *)0xE800000000000000;
  String.append(_:)(v8);
  v9 = objc_msgSend(v2, "remoteToken");
  v10 = objc_msgSend(v9, "bundleID");

  if (v10)
  {
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

  }
  else
  {
    v13 = (void *)0xE300000000000000;
    v11 = 7104878;
  }
  v14._countAndFlagsBits = v11;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v13);
  return v17;
}

uint64_t CAFDAssetVariantsAgent.add(proxy:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  _QWORD aBlock[5];
  uint64_t v23;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  CAFDAssetVariantsAgent._ConnectionProxy.activate()();
  v20 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue);
  v12 = swift_allocObject(&unk_1000312E8, 24, 7);
  swift_unknownObjectWeakInit(v12 + 16, v2);
  v13 = swift_allocObject(&unk_100031310, 32, 7);
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAssetVariantsAgent.add(proxy:);
  v23 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_9;
  v14 = _Block_copy(aBlock);
  swift_retain(v12);
  static DispatchQoS.unspecified.getter(a1);
  v21 = &_swiftEmptyArrayStorage;
  v15 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  v17 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v16, v17, v4, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = v23;
  swift_release(v12);
  return swift_release(v18);
}

uint64_t CAFDAssetVariantsAgent.remove(proxy:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "invalidate");
  v19 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue);
  v11 = swift_allocObject(&unk_1000312E8, 24, 7);
  swift_unknownObjectWeakInit(v11 + 16, v1);
  v12 = swift_allocObject(&unk_100031428, 32, 7);
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAssetVariantsAgent.remove(proxy:);
  v22 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_31;
  v13 = _Block_copy(aBlock);
  swift_retain(v11);
  static DispatchQoS.unspecified.getter(a1);
  v20 = &_swiftEmptyArrayStorage;
  v14 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  v16 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v20, v15, v16, v3, v14);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v17 = v22;
  swift_release(v11);
  return swift_release(v17);
}

void closure #1 in CAFDAssetVariantsAgent.remove(proxy:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  _BYTE v7[24];
  _BYTE v8[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    swift_beginAccess(Strong + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections, v7, 33, 0);
    v6 = (void *)specialized Set._Variant.remove(_:)(a2);
    swift_endAccess(v7);

  }
}

void closure #1 in CAFDAssetVariantsAgent.add(proxy:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  _BYTE v7[24];
  Swift::Int v8;
  _BYTE v9[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    swift_beginAccess(Strong + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections, v7, 33, 0);
    specialized Set._Variant.insert(_:)(&v8, a2);
    v6 = (void *)v8;
    swift_endAccess(v7);

  }
}

uint64_t CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(void *a1, void *a2, void *a3)
{
  char *v3;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t result;
  _QWORD v19[5];
  uint64_t v20;
  objc_super v21;

  v7 = swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_agent], 0);
  swift_unknownObjectWeakAssign(v7, a1);
  *(_QWORD *)&v3[OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection] = a3;
  v21.receiver = v3;
  v21.super_class = (Class)type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy();
  v8 = a3;
  v9 = objc_msgSendSuper2(&v21, "init");
  v10 = swift_allocObject(&unk_100031360, 32, 7);
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = swift_allocObject(&unk_100031388, 32, 7);
  *(_QWORD *)(v11 + 16) = partial apply for closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:);
  *(_QWORD *)(v11 + 24) = v10;
  v19[4] = partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionConfiguring) -> ();
  v20 = v11;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v19[3] = &block_descriptor_18;
  v12 = _Block_copy(v19);
  v13 = v20;
  v14 = v9;
  v15 = v8;
  v16 = v14;
  v17 = a2;
  swift_retain(v11);
  swift_release(v13);
  objc_msgSend(v15, "configureConnection:", v12);

  _Block_release(v12);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation(v11, "", 102, 201, 44, 1);
  swift_release(v10);
  result = swift_release(v11);
  if ((a1 & 1) == 0)
    return (uint64_t)v16;
  __break(1u);
  return result;
}

void closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;

  objc_msgSend(a1, "setTargetQueue:", a2);
  type metadata accessor for CAUVariantsService(0);
  v5 = (void *)static CAUVariantsService.serviceQuality.getter();
  objc_msgSend(a1, "setServiceQuality:", v5);

  v6 = (void *)static CAUVariantsService.interface.getter();
  objc_msgSend(a1, "setInterface:", v6);

  objc_msgSend(a1, "setInterfaceTarget:", a3);
  v7 = swift_allocObject(&unk_1000313D8, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, a3);
  v9[4] = partial apply for closure #1 in closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:);
  v10 = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnection & BSServiceConnectionContext) -> ();
  v9[3] = &block_descriptor_24;
  v8 = _Block_copy(v9);
  swift_release(v10);
  objc_msgSend(a1, "setInvalidationHandler:", v8);
  _Block_release(v8);
}

void closure #1 in closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t Strong;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _BYTE v25[24];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v25, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v8 = (void *)Strong;
    static Logger.assetVariants.getter(Strong);
    v9 = v8;
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v23 = v3;
      v12 = swift_slowAlloc(12, -1);
      v22 = v4;
      v13 = (uint8_t *)v12;
      v21 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v13 = 138412290;
      v24 = v9;
      v14 = v9;
      v3 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25);
      v15 = v21;
      *v21 = v8;

      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Connection invalidated %@", v13, 0xCu);
      v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v15, 1, v16);
      swift_slowDealloc(v15, -1, -1);
      v17 = v13;
      v4 = v22;
      swift_slowDealloc(v17, -1, -1);
    }
    else
    {

      v10 = v9;
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v18 = swift_unknownObjectWeakLoadStrong((char *)v9+ OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_agent);
    if (v18)
    {
      v19 = (void *)v18;
      CAFDAssetVariantsAgent.remove(proxy:)(v9);

    }
  }
}

id CAFDAssetVariantsAgent._ConnectionProxy.activate()()
{
  return CAFDAssetVariantsAgent._ConnectionProxy.activate()("Connection activating %@", (SEL *)&selRef_activate);
}

uint64_t CAFDAssetVariantsAgent._ConnectionProxy.remote.getter()
{
  uint64_t v0;
  NSString v1;
  NSString v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  Class isa;
  id v9;
  uint64_t v10;
  uint64_t v12;
  _OWORD v13[2];
  _QWORD v14[4];

  v1 = String._bridgeToObjectiveC()();
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(RBSDomainAttribute), "attributeWithDomain:name:", v1, v2);

  v4 = *(void **)(v0
                + OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100025E70;
  *(_QWORD *)(v6 + 32) = v3;
  v14[0] = v6;
  specialized Array._endMutation()();
  type metadata accessor for RBSAttribute();
  v7 = v3;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14[0]);
  v9 = objc_msgSend(v4, "remoteTargetWithAssertionAttributes:", isa);

  if (v9)
  {
    _bridgeAnyObjectToAny(_:)(v13, v9);
    swift_unknownObjectRelease(v9);

  }
  else
  {

    memset(v13, 0, sizeof(v13));
  }
  outlined init with take of Any?((uint64_t)v13, (uint64_t)v14);
  if (v14[3])
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CAUVariantsClient);
    if (swift_dynamicCast(&v12, v14, (char *)&type metadata for Any + 8, v10, 6))
      return v12;
    else
      return 0;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v14);
    return 0;
  }
}

id CAFDAssetVariantsAgent._ConnectionProxy.__deallocating_deinit()
{
  return CAFDAssetVariantsAgent.__deallocating_deinit(0, type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy);
}

id CAFDAssetVariantsAgent.__deallocating_deinit(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

id CAFDAssetVariantsAgent._ConnectionProxy.activate()(const char *a1, SEL *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject **v17;
  uint64_t v18;
  uint64_t v20;
  NSObject **v21;
  const char *v22;
  uint64_t v23;
  SEL *v24;
  NSObject *v25;
  uint64_t v26;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter(v7);
  v10 = v2;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v24 = a2;
    v13 = swift_slowAlloc(12, -1);
    v22 = a1;
    v14 = (uint8_t *)v13;
    v21 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    v25 = v10;
    v15 = v10;
    v23 = v5;
    v16 = v15;
    a2 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
    v17 = v21;
    *v21 = v10;

    v5 = v23;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v22, v14, 0xCu);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v17, 1, v18);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {

    v11 = v10;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return objc_msgSend(*(id *)((char *)&v10->isa+ OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_connection), *a2);
}

void *CAFDAssetVariantsAgent._ConnectionProxy.refreshVariants()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject **v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t *v14;
  void *result;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter(v3);
  v6 = v0;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v19 = v1;
    v9 = swift_slowAlloc(12, -1);
    v18 = v2;
    v10 = (uint8_t *)v9;
    v11 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    v20 = v6;
    v12 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
    *v11 = v6;

    v1 = v19;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "telling %@ to refresh", v10, 0xCu);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v11, 1, v13);
    swift_slowDealloc(v11, -1, -1);
    v14 = v10;
    v2 = v18;
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {

    v7 = v6;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  result = (void *)CAFDAssetVariantsAgent._ConnectionProxy.remote.getter();
  if (result)
  {
    v16 = result;
    objc_msgSend(result, "refreshVariants");
    return (void *)swift_unknownObjectRelease(v16);
  }
  return result;
}

uint64_t variable initialization expression of CAFDNowPlayingAgent.lastMediaSourceIdentifier()
{
  return 0;
}

void variable initialization expression of CAFDAgent.connections()
{
  variable initialization expression of CAFDAssetVariantsAgent.connections((uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAgent._CAFDConnectionProxy>, (void (*)(_QWORD))type metadata accessor for CAFDAgent._CAFDConnectionProxy);
}

void variable initialization expression of CAFDAssetVariantsAgent.connections(uint64_t *a1, void (*a2)(_QWORD))
{
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0)
  {
    if (_CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
      specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&_swiftEmptyArrayStorage, a1, a2);
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CAFMediaSourceSemanticType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CAFMediaSourceSemanticType(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for CAUVehicleTrait(0);
  v6 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAUVehicleTrait and conformance CAUVehicleTrait, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleTrait, (uint64_t)&protocol conformance descriptor for CAUVehicleTrait);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v7);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t i;
  int v47;
  uint64_t v48;

  v3 = v2;
  v6 = type metadata accessor for CAUVehicleTrait(0);
  v48 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CAUVehicleTrait, String>);
  v47 = a2;
  v10 = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_43;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v45 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v43 = v2;
  v44 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain(v9);
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v22 = v21 | (v18 << 6);
      goto LABEL_24;
    }
    v23 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v44)
      break;
    v24 = v45;
    v25 = v45[v23];
    ++v18;
    if (!v25)
    {
      v18 = v23 + 1;
      if (v23 + 1 >= v44)
        goto LABEL_36;
      v25 = v45[v18];
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v44)
        {
LABEL_36:
          swift_release(v9);
          v3 = v43;
          if ((v47 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = v45[v26];
        if (!v25)
        {
          while (1)
          {
            v18 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v18 >= v44)
              goto LABEL_36;
            v25 = v45[v18];
            ++v26;
            if (v25)
              goto LABEL_23;
          }
        }
        v18 = v26;
      }
    }
LABEL_23:
    v15 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_24:
    v27 = *(_QWORD *)(v48 + 72);
    v28 = *(_QWORD *)(v9 + 48) + v27 * v22;
    if ((v47 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v8, v28, v6);
      v29 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 16 * v22);
      v31 = *v29;
      v30 = v29[1];
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v8, v28, v6);
      v32 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 16 * v22);
      v31 = *v32;
      v30 = v32[1];
      swift_bridgeObjectRetain(v30);
    }
    v33 = *(_QWORD *)(v11 + 40);
    v34 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAUVehicleTrait and conformance CAUVehicleTrait, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleTrait, (uint64_t)&protocol conformance descriptor for CAUVehicleTrait);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v33, v6, v34);
    v35 = -1 << *(_BYTE *)(v11 + 32);
    v36 = result & ~v35;
    v37 = v36 >> 6;
    if (((-1 << v36) & ~*(_QWORD *)(v16 + 8 * (v36 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v36) & ~*(_QWORD *)(v16 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v38 = 0;
      v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v40 = v37 == v39;
        if (v37 == v39)
          v37 = 0;
        v38 |= v40;
        v41 = *(_QWORD *)(v16 + 8 * v37);
      }
      while (v41 == -1);
      v19 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v48 + 32))(*(_QWORD *)(v11 + 48) + v27 * v19, v8, v6);
    v20 = (_QWORD *)(*(_QWORD *)(v11 + 56) + 16 * v19);
    *v20 = v31;
    v20[1] = v30;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release(v9);
  v3 = v43;
  v24 = v45;
  if ((v47 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v42 = 1 << *(_BYTE *)(v9 + 32);
  if (v42 >= 64)
    bzero(v24, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v42;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_43:
  result = swift_release(v9);
  *v3 = v11;
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t result;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;

  v5 = (_QWORD **)v4;
  v28 = a2;
  v9 = type metadata accessor for CAUVehicleTrait(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = specialized __RawDictionaryStorage.find<A>(_:)(a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = *v5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = (uint64_t *)(v21[7] + 16 * v15);
      result = swift_bridgeObjectRelease(v22[1]);
      v24 = v28;
      *v22 = a1;
      v22[1] = v24;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
    goto LABEL_7;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
  v25 = specialized __RawDictionaryStorage.find<A>(_:)(a3);
  if ((v19 & 1) != (v26 & 1))
  {
LABEL_14:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v9);
    __break(1u);
    return result;
  }
  v15 = v25;
  v21 = *v5;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return specialized _NativeDictionary._insert(at:key:value:)(v15, (uint64_t)v12, a1, v28, v21);
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = a5[6];
  v11 = type metadata accessor for CAUVehicleTrait(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a2, v11);
  v13 = (_QWORD *)(a5[7] + 16 * a1);
  *v13 = a3;
  v13[1] = a4;
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for CAUVehicleTrait(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CAUVehicleTrait and conformance CAUVehicleTrait, (uint64_t (*)(uint64_t))&type metadata accessor for CAUVehicleTrait, (uint64_t)&protocol conformance descriptor for CAUVehicleTrait);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  const void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v36 = type metadata accessor for CAUVehicleTrait(0);
  v1 = *(_QWORD *)(v36 - 8);
  __chkstk_darwin(v36);
  v35 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CAUVehicleTrait, String>);
  v32 = v0;
  v3 = *v0;
  v4 = static _DictionaryStorage.copy(original:)(*v0);
  v5 = *(_QWORD *)(v3 + 16);
  v38 = v4;
  if (!v5)
  {
    result = (void *)swift_release(v3);
    v30 = v38;
    v29 = v32;
LABEL_28:
    *v29 = v30;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = (const void *)(v3 + 64);
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, v34, 8 * v8);
    v6 = v38;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v37 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v33 = (unint64_t)(v11 + 63) >> 6;
  v15 = v35;
  v14 = v36;
  v16 = v38;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v18 = v17 | (v10 << 6);
      v19 = v37;
      goto LABEL_12;
    }
    v26 = v10 + 1;
    v19 = v37;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v33)
      goto LABEL_26;
    v27 = *((_QWORD *)v34 + v26);
    ++v10;
    if (!v27)
    {
      v10 = v26 + 1;
      if (v26 + 1 >= v33)
        goto LABEL_26;
      v27 = *((_QWORD *)v34 + v10);
      if (!v27)
        break;
    }
LABEL_25:
    v13 = (v27 - 1) & v27;
    v18 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v1 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v15, *(_QWORD *)(v19 + 48) + v20, v14);
    v21 = 16 * v18;
    v22 = (uint64_t *)(*(_QWORD *)(v19 + 56) + 16 * v18);
    v23 = *v22;
    v24 = v22[1];
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v16 + 48) + v20, v15, v14);
    v25 = (_QWORD *)(*(_QWORD *)(v16 + 56) + v21);
    *v25 = v23;
    v25[1] = v24;
    result = (void *)swift_bridgeObjectRetain(v24);
  }
  v28 = v26 + 2;
  if (v28 >= v33)
  {
LABEL_26:
    result = (void *)swift_release(v37);
    v29 = v32;
    v30 = v38;
    goto LABEL_28;
  }
  v27 = *((_QWORD *)v34 + v28);
  if (v27)
  {
    v10 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v10 >= v33)
      goto LABEL_26;
    v27 = *((_QWORD *)v34 + v10);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CAFDAssetVariantsAgent()
{
  return objc_opt_self(_TtC13caraccessoryd22CAFDAssetVariantsAgent);
}

id partial apply for closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(void *a1)
{
  uint64_t v1;

  return closure #1 in CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1000169B4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void specialized CAFDAssetVariantsAgent.carManager(_:didUpdateCurrentCar:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[3];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.assetVariants.getter(v5);
  v8 = a1;
  v9 = v1;
  v10 = v8;
  v11 = (char *)v9;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v46 = v4;
    v47 = v3;
    v48 = a1;
    v14 = swift_slowAlloc(22, -1);
    v45 = swift_slowAlloc(64, -1);
    v51[0] = v45;
    *(_DWORD *)v14 = 136315394;
    v15 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar];
    if (v15)
    {
      v16 = objc_msgSend(v15, "description");
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
      v19 = v18;

    }
    else
    {
      v19 = 0xE300000000000000;
      v17 = 7104878;
    }
    v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v14 + 12) = 2080;
    if (v48)
    {
      v20 = objc_msgSend(v10, "description");
      v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      v23 = v22;

    }
    else
    {
      v23 = 0xE300000000000000;
      v21 = 7104878;
    }
    v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v23, v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);

    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "update current car from %s to %s", (uint8_t *)v14, 0x16u);
    v24 = v45;
    swift_arrayDestroy(v45, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
    a1 = v48;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  v25 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar;
  v26 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_currentCar];
  if (v26)
    objc_msgSend(v26, "unregisterObserver:", v11);
  v27 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources;
  v28 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources];
  if (v28)
    objc_msgSend(v28, "unregisterObserver:", v11);
  v29 = OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager;
  v30 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager];
  if (v30)
  {
    objc_msgSend(v30, "setDelegate:", 0);
    v31 = *(void **)&v11[v29];
  }
  else
  {
    v31 = 0;
  }
  *(_QWORD *)&v11[v29] = 0;

  CAFDAssetVariantsAgent.assetVariants.willset(0);
  v32 = *(_QWORD *)&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants];
  *(_QWORD *)&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants] = 0;
  swift_bridgeObjectRelease(v32);
  v33 = &v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections];
  swift_beginAccess(&v11[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections], v51, 0, 0);
  v34 = *(_QWORD *)v33;
  v35 = swift_bridgeObjectRetain(v34);
  specialized Sequence.forEach(_:)(v35);
  swift_bridgeObjectRelease(v34);
  v36 = *(void **)&v11[v27];
  *(_QWORD *)&v11[v27] = 0;

  v37 = *(void **)&v11[v25];
  *(_QWORD *)&v11[v25] = a1;
  v38 = v10;

  if (a1)
  {
    objc_msgSend(v38, "registerObserver:", v11);
    v39 = objc_allocWithZone((Class)CRSUIClusterThemeManager);
    v40 = v38;
    v41 = objc_msgSend(v39, "init");
    objc_msgSend(v41, "setDelegate:", v11);
    v42 = *(void **)&v11[v29];
    *(_QWORD *)&v11[v29] = v41;
    v43 = v41;

    objc_msgSend(v11, "carDidUpdateAccessories:", v40);
  }
}

void specialized CAFDAssetVariantsAgent.accessoryDidUpdate(_:receivedAllValues:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static Logger.assetVariants.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Variants have all values", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  CAFDAssetVariantsAgent.updateAssetVariants()();
}

void specialized CAFDAssetVariantsAgent.listener(_:didReceive:withContext:)(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSString v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  char *v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v46 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v43 - v9;
  static Logger.assetVariants.getter(v8);
  v11 = a1;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v44 = v5;
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v45 = v4;
    v16 = v15;
    v48 = v15;
    *(_DWORD *)v14 = 136315138;
    ObjectType = swift_getObjectType(v11);
    v18 = BSServiceConnectionHost.CAFDDescription.getter(ObjectType);
    v20 = v19;
    v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48);

    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Received connection %s", v14, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    v21 = v16;
    v4 = v45;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    v22 = *(void (**)(char *, uint64_t))(v44 + 8);
  }
  else
  {

    v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  }
  v22(v10, v4);
  v23 = swift_getObjectType(v11);
  v24 = objc_msgSend(v11, "remoteToken");
  type metadata accessor for CAUVariantsService(0);
  static CAUVariantsService.entitlement.getter();
  v26 = v25;
  v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v26);
  LODWORD(v26) = objc_msgSend(v24, "hasEntitlement:", v27);

  if ((_DWORD)v26)
  {
    v29 = *(void **)&v2[OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_workQueue];
    v30 = objc_allocWithZone((Class)type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy());
    v31 = (void *)CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(v2, v29, v11);
    CAFDAssetVariantsAgent.add(proxy:)(v31);

  }
  else
  {
    v32 = v46;
    static Logger.assetVariants.getter(v28);
    v33 = v11;
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(12, -1);
      v37 = swift_slowAlloc(32, -1);
      v48 = v37;
      *(_DWORD *)v36 = 136315138;
      v45 = v4;
      v38 = BSServiceConnectionHost.CAFDDescription.getter(v23);
      v40 = v39;
      v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v39, &v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48);

      swift_bridgeObjectRelease(v40);
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "connection %s does not have required entitlement", v36, 0xCu);
      swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1, -1);
      swift_slowDealloc(v36, -1, -1);

      v42 = v45;
      v41 = v46;
    }
    else
    {

      v41 = v32;
      v42 = v4;
    }
    v22(v41, v42);
  }
}

void specialized CAFDAssetVariantsAgent._ConnectionProxy.fetchVariants(reply:)(char *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t Strong;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  char *v21;
  uint64_t v22;
  char **v23;
  char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  unsigned __int8 v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char **v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  NSDictionary v62;
  void *v63;
  uint64_t v64;
  char **v65;
  int v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = &a1[OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_agent];
  Strong = swift_unknownObjectWeakLoadStrong(&a1[OBJC_IVAR____TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy_agent]);
  v10 = (void *)Strong;
  if (Strong)
  {
    v11 = *(_QWORD *)(Strong + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants);
    swift_bridgeObjectRetain(v11);

    if (v11)
      v10 = (void *)Dictionary<>.init(_:)(v11);
    else
      v10 = 0;
  }
  v12 = swift_unknownObjectWeakLoadStrong(v8);
  v13 = (id)v12;
  if (v12)
  {
    v14 = *(id *)(v12 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_sessionStatus);

    v13 = objc_msgSend(v14, "currentSession");
    if (v13)
    {
      v15 = objc_msgSend(v13, "configuration");

      v13 = objc_msgSend(v15, "rightHandDrive");
    }
  }
  v16 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", v13);
  static Logger.assetVariants.getter(v16);
  swift_bridgeObjectRetain_n(v10, 2);
  v17 = a1;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, (os_log_type_t)v19))
  {
    v63 = v10;
    v64 = a2;
    v20 = v18;
    v21 = v7;
    v66 = v19;
    v68 = v16;
    v69 = v5;
    v70 = v4;
    v22 = swift_slowAlloc(52, -1);
    v23 = (char **)swift_slowAlloc(8, -1);
    v67 = swift_slowAlloc(128, -1);
    v71 = (uint64_t)v17;
    v72 = v67;
    *(_DWORD *)v22 = 138413314;
    v24 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72);
    v65 = v23;
    *v23 = v17;

    *(_WORD *)(v22 + 12) = 2080;
    v25 = swift_unknownObjectWeakLoadStrong(v8);
    if (v25)
    {
      v26 = (void *)v25;
      v27 = *(_QWORD *)(v25 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants);
      swift_bridgeObjectRetain(v27);

    }
    else
    {
      v27 = 0;
    }
    v28 = v21;
    v29 = v20;
    v10 = v63;
    v71 = v27;
    v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CAUVehicleTrait : String]?);
    v31 = String.init<A>(describing:)(&v71, v30);
    v33 = v32;
    v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72);

    swift_bridgeObjectRelease(v33);
    *(_WORD *)(v22 + 22) = 2080;
    v71 = (uint64_t)v10;
    swift_bridgeObjectRetain(v10);
    v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]?);
    v35 = String.init<A>(describing:)(&v71, v34);
    v37 = v36;
    v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72);
    swift_bridgeObjectRelease_n(v10, 2);
    swift_bridgeObjectRelease(v37);
    *(_WORD *)(v22 + 32) = 2080;
    v38 = swift_unknownObjectWeakLoadStrong(v8);
    if (v38)
    {
      v39 = (void *)v38;
      v40 = *(void **)(v38 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);
      v41 = v40;

    }
    else
    {
      v40 = 0;
    }
    a2 = v64;
    v71 = (uint64_t)v40;
    v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSSecurityScopedURLWrapper?);
    v43 = String.init<A>(describing:)(&v71, v42);
    v45 = v44;
    v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v44, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72);

    swift_bridgeObjectRelease(v45);
    *(_WORD *)(v22 + 42) = 2080;
    v46 = swift_unknownObjectWeakLoadStrong(v8);
    if (v46
      && (v47 = (void *)v46,
          v48 = *(id *)(v46 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_sessionStatus),
          v47,
          v49 = objc_msgSend(v48, "currentSession"),
          v48,
          v49))
    {
      v50 = objc_msgSend(v49, "configuration");

      v51 = objc_msgSend(v50, "rightHandDrive");
    }
    else
    {
      v51 = 2;
    }
    LOBYTE(v71) = v51;
    v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Bool?);
    v53 = String.init<A>(describing:)(&v71, v52);
    v55 = v54;
    v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v53, v54, &v72);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72);

    swift_bridgeObjectRelease(v55);
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v66, "fetching for %@ assetVariants=%s payload=%s extraAssetsURL=%s isRHD=%s", (uint8_t *)v22, 0x34u);
    v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    v57 = v65;
    swift_arrayDestroy(v65, 1, v56);
    swift_slowDealloc(v57, -1, -1);
    v58 = v67;
    swift_arrayDestroy(v67, 4, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v58, -1, -1);
    swift_slowDealloc(v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v69 + 8))(v28, v70);
    v16 = v68;
  }
  else
  {

    swift_bridgeObjectRelease_n(v10, 2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v59 = swift_unknownObjectWeakLoadStrong(v8);
  if (!v59)
  {
    v61 = 0;
    if (v10)
      goto LABEL_23;
LABEL_25:
    v62.super.isa = 0;
    goto LABEL_26;
  }
  v60 = (void *)v59;
  v61 = *(id *)(v59 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);

  if (!v10)
    goto LABEL_25;
LABEL_23:
  v62.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
LABEL_26:
  (*(void (**)(uint64_t, id, id, Class, _QWORD))(a2 + 16))(a2, v61, v16, v62.super.isa, 0);
  swift_bridgeObjectRelease(v10);

}

void specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  specialized Set.init(_nonEmptyArrayLiteral:)(a1, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAgent._CAFDConnectionProxy>, (void (*)(_QWORD))type metadata accessor for CAFDAgent._CAFDConnectionProxy);
}

void specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1, uint64_t *a2, void (*a3)(_QWORD))
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::Int v30;
  id v31;
  Swift::Int v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  id v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;

  v4 = a1;
  v5 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v6 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v4);
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(a2);
      v7 = (_QWORD *)static _SetStorage.allocate(capacity:)(v6);
      if (!v5)
        goto LABEL_4;
LABEL_11:
      if (v4 < 0)
        v10 = v4;
      else
        v10 = v4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v4);
      v8 = _CocoaArrayWrapper.endIndex.getter(v10);
      swift_bridgeObjectRelease(v4);
      if (!v8)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
  }
  v7 = &_swiftEmptySetSingleton;
  if (v5)
    goto LABEL_11;
LABEL_4:
  v8 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v8)
    return;
LABEL_15:
  v11 = (char *)(v7 + 7);
  v48 = v8;
  if ((v4 & 0xC000000000000001) != 0)
  {
    v12 = 0;
    v45 = v4;
    while (1)
    {
      v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(v12, v4);
      v14 = __OFADD__(v12++, 1);
      if (v14)
      {
        __break(1u);
        goto LABEL_43;
      }
      v15 = v13;
      v16 = NSObject._rawHashValue(seed:)(v7[5]);
      v17 = -1 << *((_BYTE *)v7 + 32);
      v18 = v16 & ~v17;
      v19 = v18 >> 6;
      v20 = *(_QWORD *)&v11[8 * (v18 >> 6)];
      v21 = 1 << v18;
      if (((1 << v18) & v20) != 0)
      {
        a3(0);
        v22 = *(id *)(v7[6] + 8 * v18);
        v23 = static NSObject.== infix(_:_:)();

        if ((v23 & 1) != 0)
        {
LABEL_17:
          swift_unknownObjectRelease(v15);
          v4 = v45;
          goto LABEL_18;
        }
        v24 = ~v17;
        while (1)
        {
          v18 = (v18 + 1) & v24;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)&v11[8 * (v18 >> 6)];
          v21 = 1 << v18;
          if ((v20 & (1 << v18)) == 0)
            break;
          v25 = *(id *)(v7[6] + 8 * v18);
          v26 = static NSObject.== infix(_:_:)();

          if ((v26 & 1) != 0)
            goto LABEL_17;
        }
        v4 = v45;
      }
      *(_QWORD *)&v11[8 * v19] = v21 | v20;
      *(_QWORD *)(v7[6] + 8 * v18) = v15;
      v27 = v7[2];
      v14 = __OFADD__(v27, 1);
      v28 = v27 + 1;
      if (v14)
        goto LABEL_44;
      v7[2] = v28;
LABEL_18:
      if (v12 == v48)
        return;
    }
  }
  v29 = 0;
  v46 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v29 != v46)
  {
    v30 = v7[5];
    v31 = *(id *)(v4 + 32 + 8 * v29);
    v32 = NSObject._rawHashValue(seed:)(v30);
    v33 = -1 << *((_BYTE *)v7 + 32);
    v34 = v32 & ~v33;
    v35 = v34 >> 6;
    v36 = *(_QWORD *)&v11[8 * (v34 >> 6)];
    v37 = 1 << v34;
    if (((1 << v34) & v36) != 0)
    {
      a3(0);
      v38 = *(id *)(v7[6] + 8 * v34);
      v39 = static NSObject.== infix(_:_:)();

      if ((v39 & 1) != 0)
        goto LABEL_30;
      v40 = ~v33;
      v34 = (v34 + 1) & v40;
      v35 = v34 >> 6;
      v36 = *(_QWORD *)&v11[8 * (v34 >> 6)];
      v37 = 1 << v34;
      if ((v36 & (1 << v34)) != 0)
      {
        while (1)
        {
          v41 = *(id *)(v7[6] + 8 * v34);
          v42 = static NSObject.== infix(_:_:)();

          if ((v42 & 1) != 0)
            break;
          v34 = (v34 + 1) & v40;
          v35 = v34 >> 6;
          v36 = *(_QWORD *)&v11[8 * (v34 >> 6)];
          v37 = 1 << v34;
          if ((v36 & (1 << v34)) == 0)
            goto LABEL_38;
        }
LABEL_30:

        v8 = v48;
        goto LABEL_31;
      }
LABEL_38:
      v8 = v48;
    }
    *(_QWORD *)&v11[8 * v35] = v37 | v36;
    *(_QWORD *)(v7[6] + 8 * v34) = v31;
    v43 = v7[2];
    v14 = __OFADD__(v43, 1);
    v44 = v43 + 1;
    if (v14)
      goto LABEL_45;
    v7[2] = v44;
LABEL_31:
    if (++v29 == v8)
      return;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
}

uint64_t type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy()
{
  return objc_opt_self(_TtCC13caraccessoryd22CAFDAssetVariantsAgentP33_AD8EB03328B3296C924C05733247A05A16_ConnectionProxy);
}

unint64_t type metadata accessor for RBSAttribute()
{
  unint64_t result;
  uint64_t v1;

  result = lazy cache variable for type metadata for RBSAttribute;
  if (!lazy cache variable for type metadata for RBSAttribute)
  {
    v1 = objc_opt_self(RBSAttribute);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for RBSAttribute);
  }
  return result;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100017E00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void partial apply for closure #1 in CAFDAssetVariantsAgent.add(proxy:)()
{
  uint64_t v0;

  closure #1 in CAFDAssetVariantsAgent.add(proxy:)(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100017EC0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(void *a1)
{
  uint64_t v1;

  closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100017EF4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionConfiguring) -> ()(uint64_t a1)
{
  uint64_t v1;

  return thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ()(a1, *(uint64_t (**)(void))(v1 + 16));
}

void partial apply for closure #1 in closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in closure #1 in CAFDAssetVariantsAgent._ConnectionProxy.init(agent:workQueue:connection:)(a1, v1);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in CAFDAssetVariantsAgent.remove(proxy:)()
{
  uint64_t v0;

  closure #1 in CAFDAssetVariantsAgent.remove(proxy:)(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t outlined consume of Set<CAFDAssetVariantsAgent._ConnectionProxy>.Iterator._Variant(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with copy of (CAUVehicleTrait, String)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CAUVehicleTrait, String));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void CAFDAgent.listener.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t one-time initialization function for nowPlaying()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v0, static Logger.nowPlaying);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.nowPlaying);
  return Logger.init(subsystem:category:)(0xD000000000000022, 0x8000000100026C90, 0xD000000000000010, 0x8000000100026CC0);
}

int64x2_t one-time initialization function for maxImageSize()
{
  int64x2_t result;

  result = vdupq_n_s64(0x407F400000000000uLL);
  static CAFDNowPlayingAgent.maxImageSize = (__int128)result;
  return result;
}

void CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (one-time initialization token for nowPlaying != -1)
    swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
  v1 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v10 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = *(_QWORD *)&v2[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
    v8 = *(_QWORD *)&v2[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier + 8];
    swift_bridgeObjectRetain(v8);
    v9 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10);

    swift_bridgeObjectRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received new media source identifier %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  CAFDNowPlayingAgent.updateNowPlaying()();
}

id CAFDNowPlayingAgent.__allocating_init(carManager:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = specialized CAFDNowPlayingAgent.init(carManager:)(a1);

  return v4;
}

id CAFDNowPlayingAgent.init(carManager:)(void *a1)
{
  id v2;

  v2 = specialized CAFDNowPlayingAgent.init(carManager:)(a1);

  return v2;
}

void CAFDNowPlayingAgent.refreshClients()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _BYTE v12[24];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections);
  swift_beginAccess(v0 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections, v12, 0, 0);
  v2 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v2 < 0)
      v3 = *v1;
    else
      v3 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v1);
    v4 = __CocoaSet.count.getter(v3);
    swift_bridgeObjectRelease(v2);
    if (v4)
      goto LABEL_6;
  }
  else if (*(_QWORD *)(v2 + 16))
  {
LABEL_6:
    v5 = *v1;
    v6 = swift_bridgeObjectRetain(v5);
    specialized Sequence.forEach(_:)(v6);
    swift_bridgeObjectRelease(v5);
    return;
  }
  if (one-time initialization token for nowPlaying != -1)
    swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
  v7 = type metadata accessor for Logger(0);
  v8 = __swift_project_value_buffer(v7, (uint64_t)static Logger.nowPlaying);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "No clients to refresh.", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

void CAFDNowPlayingAgent.updateNowPlaying()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  id v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  id v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  id v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  int v81;
  _BOOL4 v82;
  uint8_t *v83;
  id v84;
  void *v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  unsigned __int8 v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  unint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  char *v124;
  void *v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  id v129;
  void *v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t v134;
  NSObject *v135;
  os_log_type_t v136;
  NSObject *v137;
  os_log_type_t v138;
  uint8_t *v139;
  __int128 v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  NSObject *v145;
  void *v146;
  id v147;
  id v148;
  NSObject *v149;
  os_log_type_t v150;
  uint8_t *v151;
  id v152;
  NSObject *v153;
  os_log_type_t v154;
  uint8_t *v155;
  _QWORD *v156;
  id v157;
  uint64_t v158;
  os_log_t v159;
  void *v160;
  id v161;
  uint64_t v162;
  unint64_t v163;
  os_log_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unsigned int v168;
  uint64_t v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  uint64_t v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t v177;
  id v178;
  id v179;
  void *v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unint64_t v185;
  unint64_t v186;
  char *v187;
  id v188;
  id v189;
  void *v190;
  uint64_t v191;
  unint64_t v192;
  unint64_t v193;
  uint64_t v194;
  NSObject *v195;
  id v196;
  void *v197;
  id v198;
  uint64_t v199;
  unint64_t v200;
  void *v201;
  void *v202;
  id v203;
  void *v204;
  unint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  uint64_t v209;
  char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t *v214;
  id v215;
  uint64_t v216;
  unint64_t v217;
  unsigned int v218;
  id v219;
  id v220;
  uint64_t v221;
  os_log_t v222;
  uint64_t v223;
  NSObject *v224;
  uint64_t v225;
  unint64_t v226;
  NSObject *v227;
  char v228[32];
  uint64_t v229;
  _BYTE v230[16];
  id v231;
  uint64_t v232[3];
  __int128 v233;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v207 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t *)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
  v6 = *(_QWORD *)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier + 8];
  v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0)
    v7 = *(_QWORD *)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier] & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
    if (one-time initialization token for nowPlaying != -1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    v34 = __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
    v227 = Logger.logObject.getter(v34);
    v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v227, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v227, v35, "No current media source", v36, 2u);
      swift_slowDealloc(v36, -1, -1);
    }
    goto LABEL_22;
  }
  v8 = *(void **)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar];
  if (!v8
    || (swift_bridgeObjectRetain(*(_QWORD *)&v0[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier
                                              + 8]),
        v9 = v8,
        v10 = String._bridgeToObjectiveC()(),
        swift_bridgeObjectRelease(v6),
        v11 = objc_msgSend(v9, "mediaSourceWithIdentifier:", v10),
        v9,
        v10,
        !v11))
  {
    if (one-time initialization token for nowPlaying != -1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
    v227 = v0;
    v11 = Logger.logObject.getter(v227);
    v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = swift_slowAlloc(32, -1);
      v232[0] = v31;
      *(_DWORD *)v30 = 136315138;
      v32 = *v5;
      v33 = v5[1];
      swift_bridgeObjectRetain(v33);
      v229 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v232);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, v230);

      swift_bridgeObjectRelease(v33);
      _os_log_impl((void *)&_mh_execute_header, v11, v29, "No media source with identifier %s", v30, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v30, -1, -1);
LABEL_30:

      return;
    }

LABEL_22:
    return;
  }
  if (!-[NSObject receivedAllValues](v11, "receivedAllValues"))
  {
    if (one-time initialization token for nowPlaying != -1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
    v37 = v0;
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = swift_slowAlloc(32, -1);
      v232[0] = v41;
      *(_DWORD *)v40 = 136315138;
      v42 = *v5;
      v43 = v5[1];
      swift_bridgeObjectRetain(v43);
      v229 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, v232);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, v230);

      swift_bridgeObjectRelease(v43);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Source has not received all values: %s", v40, 0xCu);
      swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);

    }
    else
    {

    }
    -[NSObject registerObserver:](v11, "registerObserver:", v37);
    goto LABEL_30;
  }
  v211 = v2;
  if (one-time initialization token for nowPlaying != -1)
    swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
  v12 = __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
  v13 = v11;
  v14 = v0;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  v17 = os_log_type_enabled(v15, v16);
  v223 = v12;
  v224 = v13;
  v227 = v14;
  v210 = v4;
  v214 = v5;
  if (v17)
  {
    v18 = v14;
    v19 = swift_slowAlloc(22, -1);
    v20 = swift_slowAlloc(32, -1);
    v232[0] = v20;
    *(_DWORD *)v19 = 136315394;
    v21 = *v5;
    v22 = v5[1];
    swift_bridgeObjectRetain(v22);
    v229 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, v232);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, v230);

    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v19 + 12) = 2048;
    v23 = -[NSObject mediaItems](v13, "mediaItems");
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend(v23, "mediaItems");

      v26 = type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaItem, CAFMediaItem_ptr);
      v27 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v25, v26);

      if ((unint64_t)v27 >> 62)
      {
        if (v27 < 0)
          v206 = v27;
        else
          v206 = v27 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v27);
        v28 = _CocoaArrayWrapper.endIndex.getter(v206);
        v13 = v224;

        swift_bridgeObjectRelease_n(v27, 2);
      }
      else
      {
        v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
        v13 = v224;

        swift_bridgeObjectRelease(v27);
      }
    }
    else
    {

      v28 = 0;
    }
    v229 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, v230);

    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Source %s has %ld media item(s)", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v19, -1, -1);

    v14 = v227;
  }
  else
  {

  }
  v218 = -[NSObject mediaSourceSemanticType](v13, "mediaSourceSemanticType");
  v44 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying;
  v45 = *(Class *)((char *)&v14->isa + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying);
  if (!v45)
  {
    v213 = 0;
    v225 = 0;
    v216 = 0;
    v212 = 0;
    v217 = 0xE000000000000000;
    v48 = 0xE000000000000000;
LABEL_41:
    v52 = 0xE000000000000000;
    goto LABEL_42;
  }
  v46 = objc_msgSend(v45, "title");
  v225 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  v48 = v47;

  v49 = *(Class *)((char *)&v14->isa + v44);
  if (!v49)
  {
    v213 = 0;
    v216 = 0;
    v212 = 0;
    v217 = 0xE000000000000000;
    goto LABEL_41;
  }
  v50 = objc_msgSend(v49, "artist");
  v216 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
  v52 = v51;

  v53 = *(Class *)((char *)&v14->isa + v44);
  if (v53)
  {
    v54 = objc_msgSend(v53, "album");
    v213 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
    v56 = v55;

    v57 = *(Class *)((char *)&v14->isa + v44);
    v217 = v56;
    if (v57)
    {
      v58 = objc_msgSend(v57, "userVisibleDescription");
      if (v58)
      {
        v59 = v58;
        v212 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
        v61 = v60;

        goto LABEL_43;
      }
    }
    v212 = 0;
  }
  else
  {
    v213 = 0;
    v212 = 0;
    v217 = 0xE000000000000000;
  }
LABEL_42:
  v61 = 0xE000000000000000;
LABEL_43:
  v62 = *(Class *)((char *)&v14->isa + v44);
  if (v62)
  {
    v63 = objc_msgSend(v62, "artworkCharacteristic");
    v220 = objc_msgSend(v63, "transactionId");

  }
  else
  {
    v220 = 0;
  }
  v64 = -[NSObject mediaItemImagesCharacteristic](v13, "mediaItemImagesCharacteristic");
  if (v64)
  {
    v65 = v64;
    v219 = objc_msgSend(v64, "transactionId");

  }
  else
  {
    v219 = 0;
  }
  v66 = -[NSObject hasCurrentMediaItemIdentifier](v13, "hasCurrentMediaItemIdentifier");
  v221 = v44;
  if (!(_DWORD)v66
    || (v66 = -[NSObject hasMediaItems](v13, "hasMediaItems"), !(_DWORD)v66)
    || (v66 = -[NSObject currentMediaItemIdentifier](v13, "currentMediaItemIdentifier")) == 0)
  {
LABEL_63:
    v89 = Logger.logObject.getter(v66);
    v90 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v89, v90))
    {
      v91 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v91 = 0;
      _os_log_impl((void *)&_mh_execute_header, v89, v90, "No available current media item", v91, 2u);
      swift_slowDealloc(v91, -1, -1);
    }

    if (-[NSObject hasCurrentFrequency](v13, "hasCurrentFrequency"))
    {
      v92 = -[NSObject currentFrequencyInvalid](v13, "currentFrequencyInvalid");
      v93 = v227;
      if ((v92 & 1) != 0 || !-[NSObject currentFrequency](v13, "currentFrequency"))
      {
        v222 = 0;
        v215 = 0;
        v97 = (char *)&_swiftEmptyArrayStorage;
        v101 = 0xF000000000000000;
        goto LABEL_74;
      }
      v94 = UInt32.formattedFrequency(in:)((char)-[NSObject mediaSourceSemanticType](v13, "mediaSourceSemanticType"), -[NSObject currentFrequency](v13, "currentFrequency"));
      v96 = v95;
      swift_bridgeObjectRetain(v95);
      v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      v99 = *((_QWORD *)v97 + 2);
      v98 = *((_QWORD *)v97 + 3);
      if (v99 >= v98 >> 1)
        v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v98 > 1), v99 + 1, 1, v97);
      *((_QWORD *)v97 + 2) = v99 + 1;
      v100 = &v97[16 * v99];
      *((_QWORD *)v100 + 4) = v94;
      *((_QWORD *)v100 + 5) = v96;
      swift_bridgeObjectRelease(v96);
      v222 = 0;
      v215 = 0;
    }
    else
    {
      v222 = 0;
      v215 = 0;
      v97 = (char *)&_swiftEmptyArrayStorage;
    }
LABEL_72:
    v101 = 0xF000000000000000;
    v93 = v227;
LABEL_74:
    v102 = v218;
    goto LABEL_75;
  }
  v67 = v66;
  v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
  v70 = v69;

  v71 = HIBYTE(v70) & 0xF;
  if ((v70 & 0x2000000000000000) == 0)
    v71 = v68 & 0xFFFFFFFFFFFFLL;
  if (!v71 || (v72 = -[NSObject mediaItems](v224, "mediaItems")) == 0)
  {
    v66 = (id)swift_bridgeObjectRelease(v70);
    v13 = v224;
    goto LABEL_63;
  }
  v73 = v72;
  v74 = objc_msgSend(v72, "mediaItems");

  v75 = type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaItem, CAFMediaItem_ptr);
  v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v74, v75);

  swift_bridgeObjectRetain(v70);
  v77 = specialized Sequence.first(where:)(v76, v68, v70);
  swift_bridgeObjectRelease(v76);
  v66 = (id)swift_bridgeObjectRelease_n(v70, 2);
  v78 = v77;
  v13 = v224;
  if (!v78)
    goto LABEL_63;
  v215 = v78;
  v79 = v78;
  v80 = Logger.logObject.getter(v79);
  v81 = static os_log_type_t.default.getter();
  v82 = os_log_type_enabled(v80, (os_log_type_t)v81);
  v208 = v79;
  v226 = 0;
  if (v82)
  {
    LODWORD(v209) = v81;
    v222 = v80;
    v83 = (uint8_t *)swift_slowAlloc(12, -1);
    v207 = swift_slowAlloc(32, -1);
    v232[0] = v207;
    *(_DWORD *)v83 = 136315138;
    v84 = objc_msgSend(v79, "identifier");
    if (v84)
    {
      v85 = v84;
      v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(v84);
      v88 = v87;

    }
    else
    {
      v86 = 0;
      v88 = 0xE000000000000000;
    }
    v229 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v86, v88, v232);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v229, v230);
    v79 = v208;

    swift_bridgeObjectRelease(v88);
    v164 = v222;
    _os_log_impl((void *)&_mh_execute_header, v222, (os_log_type_t)v209, "Found media item with identifier %s", v83, 0xCu);
    v165 = v207;
    swift_arrayDestroy(v207, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v165, -1, -1);
    swift_slowDealloc(v83, -1, -1);

  }
  else
  {

  }
  v166 = swift_allocObject(&unk_100031478, 32, 7);
  *(_QWORD *)(v166 + 16) = 0;
  v167 = v166 + 16;
  v209 = v166;
  *(_QWORD *)(v166 + 24) = 0xE000000000000000;
  v168 = -[NSObject mediaSourceSemanticType](v13, "mediaSourceSemanticType");
  if (v168 <= 8 && ((1 << v168) & 0x106) != 0)
  {
    if (objc_msgSend(v79, "frequency"))
    {
      v169 = UInt32.formattedFrequency(in:)((char)-[NSObject mediaSourceSemanticType](v13, "mediaSourceSemanticType"), objc_msgSend(v79, "frequency"));
      v171 = v170;
      firstLineAppend #1 (_:) in CAFDNowPlayingAgent.updateNowPlaying()(v169, v170, v209);
      swift_bridgeObjectRelease(v171);
    }
    v172 = objc_msgSend(v79, "mediaItemName");
    if (v172)
    {
      v173 = v172;
      v174 = static String._unconditionallyBridgeFromObjectiveC(_:)(v172);
      v176 = v175;

      v177 = HIBYTE(v176) & 0xF;
      if ((v176 & 0x2000000000000000) == 0)
        v177 = v174 & 0xFFFFFFFFFFFFLL;
      if (v177)
      {
LABEL_152:
        firstLineAppend #1 (_:) in CAFDNowPlayingAgent.updateNowPlaying()(v174, (void *)v176, v209);
        goto LABEL_153;
      }
      swift_bridgeObjectRelease(v176);
      v79 = v208;
    }
    v178 = objc_msgSend(v79, "mediaItemShortName");
  }
  else
  {
    v178 = objc_msgSend(v79, "mediaItemName");
  }
  v179 = v178;
  if (!v179)
    goto LABEL_154;
  v180 = v179;
  v174 = static String._unconditionallyBridgeFromObjectiveC(_:)(v179);
  v176 = v181;

  v182 = HIBYTE(v176) & 0xF;
  if ((v176 & 0x2000000000000000) == 0)
    v182 = v174 & 0xFFFFFFFFFFFFLL;
  if (v182)
    goto LABEL_152;
LABEL_153:
  swift_bridgeObjectRelease(v176);
LABEL_154:
  swift_beginAccess(v167, v228, 0, 0);
  v183 = *(_QWORD *)(v209 + 16);
  v184 = *(_QWORD *)(v209 + 24);
  swift_bridgeObjectRetain_n(v184, 2);
  v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  v186 = *((_QWORD *)v97 + 2);
  v185 = *((_QWORD *)v97 + 3);
  if (v186 >= v185 >> 1)
    v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v185 > 1), v186 + 1, 1, v97);
  *((_QWORD *)v97 + 2) = v186 + 1;
  v187 = &v97[16 * v186];
  *((_QWORD *)v187 + 4) = v183;
  *((_QWORD *)v187 + 5) = v184;
  swift_bridgeObjectRelease(v184);
  v188 = v208;
  v189 = objc_msgSend(v208, "mediaItemImageIdentifier");
  if (!v189)
  {
    swift_release(v209);

    v222 = 0;
    goto LABEL_72;
  }
  v190 = v189;
  v191 = static String._unconditionallyBridgeFromObjectiveC(_:)(v189);
  v193 = v192;

  v194 = HIBYTE(v193) & 0xF;
  if ((v193 & 0x2000000000000000) == 0)
    v194 = v191 & 0xFFFFFFFFFFFFLL;
  v195 = v224;
  v102 = v218;
  if (!v194 || !-[NSObject hasMediaItemImages](v224, "hasMediaItemImages"))
  {
    swift_release(v209);
    swift_bridgeObjectRelease(v193);

    v222 = 0;
    v101 = 0xF000000000000000;
    v93 = v227;
    goto LABEL_75;
  }
  v196 = -[NSObject mediaItemImages](v195, "mediaItemImages");
  if (!v196)
  {
    swift_release(v209);
    swift_bridgeObjectRelease(v193);
LABEL_169:

    v222 = 0;
    goto LABEL_72;
  }
  v197 = v196;
  v198 = objc_msgSend(v196, "mediaItemImages");

  v199 = type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaItemImage, CAFMediaItemImage_ptr);
  v200 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v198, v199);

  swift_bridgeObjectRetain(v193);
  v201 = specialized Sequence.first(where:)(v200, v191, v193);
  swift_bridgeObjectRelease(v200);
  swift_bridgeObjectRelease_n(v193, 2);
  if (!v201)
  {
    swift_release(v209);
    goto LABEL_169;
  }
  v202 = v201;
  v203 = objc_msgSend(v201, "imageData");
  v93 = v227;
  v102 = v218;
  if (v203)
  {
    v204 = v203;
    v222 = (os_log_t)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v226 = v205;
    swift_release(v209);

    v101 = v226;
  }
  else
  {
    swift_release(v209);

    v222 = 0;
    v101 = 0xF000000000000000;
  }
LABEL_75:
  v226 = v101;
  v103 = HIBYTE(v48) & 0xF;
  if ((v48 & 0x2000000000000000) == 0)
    v103 = v225 & 0xFFFFFFFFFFFFLL;
  if (v103)
  {
    swift_bridgeObjectRelease(v61);
    swift_bridgeObjectRetain(v48);
    if ((swift_isUniquelyReferenced_nonNull_native(v97) & 1) == 0)
      v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v97 + 2) + 1, 1, v97);
    v105 = *((_QWORD *)v97 + 2);
    v104 = *((_QWORD *)v97 + 3);
    if (v105 >= v104 >> 1)
      v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v104 > 1), v105 + 1, 1, v97);
    *((_QWORD *)v97 + 2) = v105 + 1;
    v106 = &v97[16 * v105];
    *((_QWORD *)v106 + 4) = v225;
    v107 = v106 + 32;
    v61 = v48;
LABEL_91:
    *((_QWORD *)v107 + 1) = v48;
    goto LABEL_92;
  }
  swift_bridgeObjectRelease(v48);
  v108 = HIBYTE(v61) & 0xF;
  v109 = v212;
  if ((v61 & 0x2000000000000000) == 0)
    v108 = v212 & 0xFFFFFFFFFFFFLL;
  if (v108)
  {
    swift_bridgeObjectRetain(v61);
    if ((swift_isUniquelyReferenced_nonNull_native(v97) & 1) == 0)
      v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v97 + 2) + 1, 1, v97);
    v111 = *((_QWORD *)v97 + 2);
    v110 = *((_QWORD *)v97 + 3);
    if (v111 >= v110 >> 1)
      v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v110 > 1), v111 + 1, 1, v97);
    *((_QWORD *)v97 + 2) = v111 + 1;
    v112 = &v97[16 * v111];
    *((_QWORD *)v112 + 4) = v109;
    v107 = v112 + 32;
    v48 = v61;
    goto LABEL_91;
  }
LABEL_92:
  v113 = v216;
  swift_bridgeObjectRelease(v61);
  v114 = HIBYTE(v52) & 0xF;
  if ((v52 & 0x2000000000000000) == 0)
    v114 = v113 & 0xFFFFFFFFFFFFLL;
  if (v114)
  {
    swift_bridgeObjectRetain(v52);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v97);
    v116 = v217;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v97 + 2) + 1, 1, v97);
    v118 = *((_QWORD *)v97 + 2);
    v117 = *((_QWORD *)v97 + 3);
    if (v118 >= v117 >> 1)
      v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v117 > 1), v118 + 1, 1, v97);
    *((_QWORD *)v97 + 2) = v118 + 1;
    v119 = &v97[16 * v118];
    *((_QWORD *)v119 + 4) = v113;
    *((_QWORD *)v119 + 5) = v52;
  }
  else
  {
    v116 = v217;
  }
  swift_bridgeObjectRelease(v52);
  if (specialized Sequence<>.contains(_:)(v102, (uint64_t)&outlined read-only object #0 of CAFDNowPlayingAgent.updateNowPlaying()))
  {
    v120 = HIBYTE(v116) & 0xF;
    v121 = v213;
    if ((v116 & 0x2000000000000000) == 0)
      v120 = v213 & 0xFFFFFFFFFFFFLL;
    if (v120)
    {
      swift_bridgeObjectRetain(v116);
      if ((swift_isUniquelyReferenced_nonNull_native(v97) & 1) == 0)
        v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v97 + 2) + 1, 1, v97);
      v123 = *((_QWORD *)v97 + 2);
      v122 = *((_QWORD *)v97 + 3);
      if (v123 >= v122 >> 1)
        v97 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v122 > 1), v123 + 1, 1, v97);
      *((_QWORD *)v97 + 2) = v123 + 1;
      v124 = &v97[16 * v123];
      *((_QWORD *)v124 + 4) = v121;
      *((_QWORD *)v124 + 5) = v116;
    }
  }
  swift_bridgeObjectRelease(v116);
  v233 = xmmword_100025F10;
  v125 = *(Class *)((char *)&v93->isa + v221);
  if (v125)
  {
    v126 = objc_msgSend(v125, "artwork");
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v128 = v127;

    __asm { BR              X10 }
  }
  if (v226 >> 60 != 15)
    __asm { BR              X10 }
  v129 = *(Class *)((char *)&v93->isa + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot);
  if (v129 && (v129 = objc_msgSend(v129, "artworkData")) != 0)
  {
    v130 = v129;
    v131 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v133 = v132;

    v134 = outlined copy of Data._Representation(v131, v133);
    v135 = Logger.logObject.getter(v134);
    v136 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v135, v136))
    {
      *(_DWORD *)swift_slowAlloc(12, -1) = 134217984;
      __asm { BR              X10 }
    }
    outlined consume of Data._Representation(v131, v133);

    outlined consume of Data?(v233, *((unint64_t *)&v233 + 1));
    *(_QWORD *)&v233 = v131;
    *((_QWORD *)&v233 + 1) = v133;
  }
  else
  {
    v137 = Logger.logObject.getter(v129);
    v138 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v137, v138))
    {
      v139 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v139 = 0;
      _os_log_impl((void *)&_mh_execute_header, v137, v138, "No available artwork data.", v139, 2u);
      swift_slowDealloc(v139, -1, -1);
    }

  }
  type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFNowPlayingSnapshot, CAFNowPlayingSnapshot_ptr);
  swift_beginAccess(&v233, v232, 0, 0);
  v140 = v233;
  v141 = *v214;
  v142 = v214[1];
  swift_bridgeObjectRetain(v142);
  outlined copy of Data?(v140, *((unint64_t *)&v140 + 1));
  v143 = CAFNowPlayingSnapshot.__allocating_init(titles:artworkData:mediaSourceType:mediaSourceIdentifier:artworkToken:mediaItemImageToken:)((uint64_t)v97, v140, *((unint64_t *)&v140 + 1), v102, v141, v142, (uint64_t)v220, (uint64_t)v219);
  v144 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot;
  v145 = v227;
  v146 = *(Class *)((char *)&v227->isa + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot);
  if (!v146)
    goto LABEL_128;
  v147 = v146;
  v148 = objc_msgSend(v147, "isEqual:", v143);
  if (!(_DWORD)v148)
  {

LABEL_128:
    v152 = v143;
    v153 = Logger.logObject.getter(v152);
    v154 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v153, v154))
    {
      v155 = (uint8_t *)swift_slowAlloc(12, -1);
      v156 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v155 = 138412290;
      v231 = v152;
      v157 = v152;
      v145 = v227;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v231, v232);
      *v156 = v152;

      _os_log_impl((void *)&_mh_execute_header, v153, v154, "Generated snapshot %@", v155, 0xCu);
      v158 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v156, 1, v158);
      swift_slowDealloc(v156, -1, -1);
      swift_slowDealloc(v155, -1, -1);

    }
    else
    {

    }
    v159 = v222;
    v160 = *(Class *)((char *)&v145->isa + v144);
    *(Class *)((char *)&v145->isa + v144) = (Class)v152;
    v161 = v152;

    CAFDNowPlayingAgent.refreshClients()();
    outlined consume of Data?((uint64_t)v159, v226);

    goto LABEL_132;
  }
  v149 = Logger.logObject.getter(v148);
  v150 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v149, v150))
  {

    outlined consume of Data?((uint64_t)v222, v226);
    v163 = *((_QWORD *)&v140 + 1);
    v162 = v140;
    goto LABEL_133;
  }
  v151 = (uint8_t *)swift_slowAlloc(2, -1);
  *(_WORD *)v151 = 0;
  _os_log_impl((void *)&_mh_execute_header, v149, v150, "No change in snapshot; not notifying clients.", v151, 2u);
  swift_slowDealloc(v151, -1, -1);

  outlined consume of Data?((uint64_t)v222, v226);
LABEL_132:
  v163 = *((_QWORD *)&v233 + 1);
  v162 = v233;
LABEL_133:
  outlined consume of Data?(v162, v163);
}

uint64_t firstLineAppend #1 (_:) in CAFDNowPlayingAgent.updateNowPlaying()(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  Swift::String v9;
  Swift::String v10;
  _BYTE v12[24];
  _BYTE v13[24];

  v6 = a3 + 16;
  swift_beginAccess(a3 + 16, v13, 0, 0);
  v7 = *(_QWORD *)(a3 + 24);
  v8 = *(_QWORD *)(a3 + 16) & 0xFFFFFFFFFFFFLL;
  if ((v7 & 0x2000000000000000) != 0)
    v8 = HIBYTE(v7) & 0xF;
  if (v8)
  {
    swift_beginAccess(v6, v12, 33, 0);
    v9._countAndFlagsBits = 32;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    swift_endAccess(v12);
  }
  swift_beginAccess(v6, v12, 33, 0);
  v10._countAndFlagsBits = a1;
  v10._object = a2;
  String.append(_:)(v10);
  return swift_endAccess(v12);
}

uint64_t UInt32.formattedFrequency(in:)(char a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 == 8 || a1 == 2)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v6 = swift_allocObject(v4, 72, 7);
    *(_OWORD *)(v6 + 16) = xmmword_100025F20;
    *(_QWORD *)(v6 + 56) = &type metadata for Double;
    *(_QWORD *)(v6 + 64) = &protocol witness table for Double;
    *(double *)(v6 + 32) = (double)a2 / 1000.0;
    v7 = 1714499109;
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v6 = swift_allocObject(v5, 72, 7);
    *(_OWORD *)(v6 + 16) = xmmword_100025F20;
    *(_QWORD *)(v6 + 56) = &type metadata for UInt;
    *(_QWORD *)(v6 + 64) = &protocol witness table for UInt;
    *(_QWORD *)(v6 + 32) = a2;
    v7 = 1764962341;
  }
  return String.init(format:_:)(v7, 0xE400000000000000, v6);
}

BOOL specialized Sequence<>.contains(_:)(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

id CAFNowPlayingSnapshot.__allocating_init(titles:artworkData:mediaSourceType:mediaSourceIdentifier:artworkToken:mediaItemImageToken:)(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  NSArray v17;
  Class isa;
  id v19;
  NSString v20;
  id v21;

  v9 = v8;
  v17.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  if (a3 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a2, a3);
  }
  v19 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v9));
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a6);
  v21 = objc_msgSend(v19, "initWithTitles:artworkData:mediaSourceType:mediaSourceIdentifier:artworkToken:mediaItemImageToken:", v17.super.isa, isa, a4, v20, a7, a8);

  return v21;
}

uint64_t CAFDNowPlayingAgent.__ivar_destroyer(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_carManager, a2);

  return swift_bridgeObjectRelease(*(_QWORD *)(v2
                                             + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier
                                             + 8));
}

id CAFDNowPlayingAgent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAFDNowPlayingAgent(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;

  v3 = objc_msgSend(a1, "media");
  if (!v3)
    goto LABEL_18;
  v4 = v3;
  v5 = objc_msgSend(a1, "nowPlayingInformation");
  if (!v5)
  {

LABEL_18:
    if (one-time initialization token for nowPlaying != -1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    v19 = type metadata accessor for Logger(0);
    v20 = __swift_project_value_buffer(v19, (uint64_t)static Logger.nowPlaying);
    v44 = Logger.logObject.getter(v20);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v44, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v21, "Awaiting media and now playing", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }
    goto LABEL_42;
  }
  v44 = v5;
  objc_msgSend(v4, "registerObserver:", v1);
  -[NSObject registerObserver:](v44, "registerObserver:", v1);
  if ((-[NSObject receivedAllValues](v44, "receivedAllValues") & 1) == 0)
  {
    if (one-time initialization token for nowPlaying != -1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    v23 = type metadata accessor for Logger(0);
    v24 = __swift_project_value_buffer(v23, (uint64_t)static Logger.nowPlaying);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      v28 = "Awaiting now playing to receive all values";
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v25, v26, v28, v27, 2u);
      swift_slowDealloc(v27, -1, -1);

      return;
    }
LABEL_31:

    return;
  }
  v6 = objc_msgSend(v4, "mediaSources");
  if (!v6)
    goto LABEL_26;
  v7 = v6;
  v8 = type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for CAFMediaSource, CAFMediaSource_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  if ((unint64_t)v9 >> 62)
  {
    v31 = v9 < 0 ? v9 : v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9);
    v10 = _CocoaArrayWrapper.endIndex.getter(v31);
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v9);
  if (!v10)
  {
LABEL_26:
    if (one-time initialization token for nowPlaying != -1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    v29 = type metadata accessor for Logger(0);
    v30 = __swift_project_value_buffer(v29, (uint64_t)static Logger.nowPlaying);
    v25 = Logger.logObject.getter(v30);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      v28 = "Awaiting media to receive some sources";
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  v11 = -[NSObject nowPlaying](v44, "nowPlaying");
  objc_msgSend(v11, "registerObserver:", v1);

  v12 = objc_msgSend(v4, "mediaSources");
  if (!v12)
  {
LABEL_41:
    v33 = *(void **)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_media);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_media) = v4;
    v34 = v4;

    v35 = -[NSObject nowPlaying](v44, "nowPlaying");
    v36 = *(void **)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying) = v35;

    v37 = -[NSObject nowPlaying](v44, "nowPlaying");
    v38 = objc_msgSend(v37, "currentMediaSourceIdentifier");

    v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v41 = v40;

    v42 = (uint64_t *)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier);
    v43 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier + 8);
    *v42 = v39;
    v42[1] = v41;
    swift_bridgeObjectRelease(v43);
    CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset();

LABEL_42:
    return;
  }
  v13 = v12;
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v8);

  if (!((unint64_t)v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v14);
    if (v15)
      goto LABEL_11;
LABEL_40:
    swift_bridgeObjectRelease_n(v14, 2);
    goto LABEL_41;
  }
  if (v14 < 0)
    v32 = v14;
  else
    v32 = v14 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v14);
  v15 = _CocoaArrayWrapper.endIndex.getter(v32);
  if (!v15)
    goto LABEL_40;
LABEL_11:
  if (v15 >= 1)
  {
    v16 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0)
        v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v14);
      else
        v17 = *(id *)(v14 + 8 * v16 + 32);
      v18 = v17;
      ++v16;
      v45 = v17;
      closure #1 in CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(&v45, v1);

    }
    while (v15 != v16);
    goto LABEL_40;
  }
  __break(1u);
}

void closure #1 in CAFDNowPlayingAgent.carDidUpdateAccessories(_:)(void **a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t *buf;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = *a1;
  if (one-time initialization token for nowPlaying != -1)
    swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
  v4 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v4, (uint64_t)static Logger.nowPlaying);
  v5 = v3;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = swift_slowAlloc(32, -1);
    v26 = v23;
    *(_DWORD *)v8 = 136315138;
    buf = v8;
    v9 = objc_msgSend(v5, "identifier");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Observing source: %s", buf, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(buf, -1, -1);

  }
  else
  {

  }
  objc_msgSend(v5, "registerObserver:", a2);
  if ((objc_msgSend(v5, "receivedAllValues") & 1) == 0)
  {
    v13 = v5;
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = swift_slowAlloc(32, -1);
      v26 = v17;
      *(_DWORD *)v16 = 136315138;
      v18 = objc_msgSend(v13, "identifier");
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      v21 = v20;

      v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25);

      swift_bridgeObjectRelease(v21);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Waiting for source to receive all values: %s", v16, 0xCu);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);

    }
    else
    {

    }
  }
}

void CAFDNowPlayingAgent.accessoryDidUpdate(_:receivedAllValues:)(void *a1, char a2)
{
  CAFDNowPlayingAgent.accessoryDidUpdate(_:receivedAllValues:)(a1, a2, "Received all values for accessory %@!");
}

void CAFDNowPlayingAgent.carManager(_:didUpdateCurrentCar:)(uint64_t a1, void *a2)
{
  specialized CAFDNowPlayingAgent.carManager(_:didUpdateCurrentCar:)(a2);
}

Swift::Void __swiftcall CAFDAgent._CAFDConnectionProxy.refreshNowPlayingSnapshot()()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __objc2_prot *v13;

  if (one-time initialization token for nowPlaying != -1)
    swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
  v1 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v1, (uint64_t)static Logger.nowPlaying);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v12 = v2;
    v7 = v2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
    *v6 = v2;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "telling %@ to refresh", v5, 0xCu);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  v9 = CAFDAgent._CAFDConnectionProxy.remote.getter();
  if (v9)
  {
    v10 = v9;
    v13 = &OBJC_PROTOCOL___CAFNowPlayingClient;
    v11 = (void *)swift_dynamicCastObjCProtocolConditional(v9, 1, &v13);
    if (v11)
      objc_msgSend(v11, "refreshNowPlayingSnapshot");
    swift_unknownObjectRelease(v10);
  }
}

void CAFDNowPlayingAgent.nowPlayingService(_:didUpdateCurrentMediaSourceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  BOOL v6;
  uint64_t v8;

  v5 = (_QWORD *)(v3 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier) == a2
    && *(_QWORD *)(v3 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier + 8) == a3;
  if (!v6 && (_stringCompareWithSmolCheck(_:_:expecting:)(a2, a3) & 1) == 0)
  {
    v8 = v5[1];
    *v5 = a2;
    v5[1] = a3;
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRelease(v8);
    CAFDNowPlayingAgent.lastMediaSourceIdentifier.didset();
  }
}

uint64_t @objc CAFDNowPlayingAgent.nowPlayingService(_:didUpdateJumpBackwardInterval:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
  __chkstk_darwin(v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v8 = type metadata accessor for CAFMediaSource(0, &lazy cache variable for type metadata for NSUnitDuration, NSUnitDuration_ptr);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 0, 1, v9);
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  }
  return outlined destroy of Measurement<NSUnitDuration>?((uint64_t)v7);
}

void CAFDNowPlayingAgent.serviceDidUpdate(_:receivedAllValues:)(void *a1, char a2)
{
  CAFDNowPlayingAgent.accessoryDidUpdate(_:receivedAllValues:)(a1, a2, "Service %@ received all values");
}

void CAFDNowPlayingAgent.accessoryDidUpdate(_:receivedAllValues:)(void *a1, char a2, const char *a3)
{
  void *v3;
  void *v5;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;

  if ((a2 & 1) != 0)
  {
    v5 = v3;
    if (one-time initialization token for nowPlaying != -1)
      swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
    v7 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v7, (uint64_t)static Logger.nowPlaying);
    v8 = a1;
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v17 = v5;
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v11 = 138412290;
      v18 = v8;
      v13 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19);
      *v12 = v8;

      v5 = v17;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, a3, v11, 0xCu);
      v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v12, 1, v14);
      swift_slowDealloc(v12, -1, -1);
      swift_slowDealloc(v11, -1, -1);

    }
    else
    {

    }
    v15 = objc_msgSend(v8, "car", v17, v18);
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v5, "carDidUpdateAccessories:", v15);

    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t @objc CAFDNowPlayingAgent.nowPlayingService(_:didUpdateUserVisibleDescription:)(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = a1;
  CAFDNowPlayingAgent.updateNowPlaying()();

  return swift_bridgeObjectRelease(v7);
}

void @objc CAFDNowPlayingAgent.mediaSourceService(_:didUpdateMediaItems:)(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  CAFDNowPlayingAgent.updateNowPlaying()();

}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

void *specialized Sequence.first(where:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((unint64_t)a1 >> 62)
    goto LABEL_20;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (v5)
  {
    do
    {
      v6 = 4;
      while (1)
      {
        v7 = (a1 & 0xC000000000000001) != 0
           ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, a1)
           : *(id *)(a1 + 8 * v6);
        v8 = v7;
        v9 = v6 - 3;
        if (__OFADD__(v6 - 4, 1))
          break;
        v10 = objc_msgSend(v7, "identifier");
        if (v10)
        {
          v11 = v10;
          v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
          v14 = v13;

          if (v12 == a2 && v14 == a3)
          {
            swift_bridgeObjectRelease(a1);
            v17 = a3;
            goto LABEL_18;
          }
          v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14);
          swift_bridgeObjectRelease(v14);
          if ((v16 & 1) != 0)
          {
            v17 = a1;
LABEL_18:
            swift_bridgeObjectRelease(v17);
            return v8;
          }
        }

        ++v6;
        if (v9 == v5)
          goto LABEL_24;
      }
      __break(1u);
LABEL_20:
      v18 = a3;
      if (a1 < 0)
        v19 = a1;
      else
        v19 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v20 = _CocoaArrayWrapper.endIndex.getter(v19);
      a3 = v18;
      v5 = v20;
    }
    while (v20);
  }
LABEL_24:
  swift_bridgeObjectRelease(a1);
  return 0;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

void *specialized Sequence.first(where:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v22;
  unint64_t v23;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_21;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v20))
  {
    v22 = v5;
    v23 = v5 & 0xC000000000000001;
    v7 = 4;
    while (1)
    {
      v8 = v23 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v5) : *(id *)(v5 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = a3;
      v12 = v6;
      v13 = objc_msgSend(v8, "identifier");
      if (v13)
      {
        v14 = v13;
        v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
        v17 = v16;

      }
      else
      {
        v15 = 0;
        v17 = 0xE000000000000000;
      }
      a3 = v11;
      if (v15 == a2 && v17 == v11)
      {
        swift_bridgeObjectRelease(v22);
LABEL_19:
        swift_bridgeObjectRelease(a3);
        return v9;
      }
      v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17);
      swift_bridgeObjectRelease(v17);
      if ((v18 & 1) != 0)
      {
        a3 = v22;
        goto LABEL_19;
      }

      ++v7;
      v6 = v12;
      v19 = v10 == v12;
      v5 = v22;
      if (v19)
      {
        swift_bridgeObjectRelease(v22);
        return 0;
      }
    }
    __break(1u);
LABEL_21:
    if (v5 < 0)
      v20 = v5;
    else
      v20 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
  }
  swift_bridgeObjectRelease(v5);
  return 0;
}

id specialized CAFDNowPlayingAgent.init(carManager:)(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint8_t *v19;
  void *v20;
  NSString v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  id v52;
  char *v53;

  v52 = a1;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v53 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for CAFDAgent.Configuration(0);
  v6 = __chkstk_darwin(v5);
  v51 = (uint64_t)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v46 - v8;
  v10 = &v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_carManager];
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_carManager], 0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_media] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_nowPlaying] = 0;
  v11 = &v1[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastMediaSourceIdentifier];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0xE000000000000000;
  v12 = one-time initialization token for nowPlaying;
  v13 = v1;
  if (v12 != -1)
    swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
  v14 = __swift_project_value_buffer(v2, (uint64_t)static Logger.nowPlaying);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = v3;
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "initializing now playing server", v18, 2u);
    v19 = v18;
    v3 = v17;
    swift_slowDealloc(v19, -1, -1);
  }
  v48 = v3;

  swift_unknownObjectWeakAssign(v10, v52);
  v50 = v13;

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v53, v14, v2);
  v20 = (void *)objc_opt_self(CAFNowPlayingServiceSpecification);
  v49 = v2;
  v21 = objc_msgSend(v20, "identifier");
  if (!v21)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v23 = v22;
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v23);
  }
  v24 = objc_msgSend((id)objc_opt_self(BSDispatchQueueAttributes), "serial");
  v47 = BSDispatchQueueCreate(v21, v24);

  v46 = objc_msgSend(v20, "interface");
  v25 = objc_msgSend(v20, "entitlement");
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
  v28 = v27;

  v29 = objc_msgSend((id)objc_opt_self(BSServiceQuality), "userInitiated");
  v30 = objc_msgSend(v20, "identifier");
  v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
  v33 = v32;

  v34 = objc_msgSend(v20, "identifier");
  v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
  v37 = v36;

  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v9, v53, v49);
  *(_QWORD *)&v9[v5[5]] = v47;
  *(_QWORD *)&v9[v5[6]] = v46;
  v38 = (uint64_t *)&v9[v5[7]];
  *v38 = v26;
  v38[1] = v28;
  *(_QWORD *)&v9[v5[8]] = v29;
  v39 = (uint64_t *)&v9[v5[9]];
  *v39 = v31;
  v39[1] = v33;
  v40 = (uint64_t *)&v9[v5[10]];
  *v40 = v35;
  v40[1] = v37;
  v41 = v51;
  outlined init with copy of CAFDAgent.Configuration((uint64_t)v9, v51);
  v42 = (id)CAFDAgent.init(configuration:)(v41);
  v43 = v52;
  objc_msgSend(v52, "registerObserver:", v42);
  v44 = objc_msgSend(v43, "currentCar");
  objc_msgSend(v42, "carManager:didUpdateCurrentCar:", v43, v44);

  outlined destroy of CAFDAgent.Configuration((uint64_t)v9);
  return v42;
}

uint64_t type metadata accessor for CAFDNowPlayingAgent(uint64_t a1)
{
  uint64_t result;

  result = type metadata singleton initialization cache for CAFDNowPlayingAgent;
  if (!type metadata singleton initialization cache for CAFDNowPlayingAgent)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CAFDNowPlayingAgent);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void specialized CAFDNowPlayingAgent.carManager(_:didUpdateCurrentCar:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for nowPlaying != -1)
    swift_once(&one-time initialization token for nowPlaying, one-time initialization function for nowPlaying);
  v7 = __swift_project_value_buffer(v3, (uint64_t)static Logger.nowPlaying);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = a1;
  v9 = v1;
  v10 = v8;
  v11 = (char *)v9;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    v31 = v4;
    v32 = a1;
    v14 = swift_slowAlloc(22, -1);
    v30 = swift_slowAlloc(64, -1);
    v34 = v30;
    *(_DWORD *)v14 = 136315394;
    v15 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar];
    if (v15)
    {
      v16 = objc_msgSend(v15, "description");
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
      v19 = v18;

    }
    else
    {
      v19 = 0xE300000000000000;
      v17 = 7104878;
    }
    HIDWORD(v29) = v13;
    v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v19, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v14 + 12) = 2080;
    if (v32)
    {
      v20 = objc_msgSend(v10, "description");
      v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      v23 = v22;

    }
    else
    {
      v23 = 0xE300000000000000;
      v21 = 7104878;
    }
    v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v23, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);

    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v12, BYTE4(v29), "update current car from %s to %s", (uint8_t *)v14, 0x16u);
    v24 = v30;
    swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v3);
    a1 = v32;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  v25 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar;
  v26 = *(void **)&v11[OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_currentCar];
  if (v26)
  {
    objc_msgSend(v26, "unregisterObserver:", v11);
    v27 = *(void **)&v11[v25];
  }
  else
  {
    v27 = 0;
  }
  *(_QWORD *)&v11[v25] = a1;
  v28 = v10;

  if (a1)
  {
    objc_msgSend(v28, "registerObserver:", v11);
    objc_msgSend(v11, "carDidUpdateAccessories:", v28);
  }
}

uint64_t ObjC metadata update function for CAFDNowPlayingAgent()
{
  return type metadata accessor for CAFDNowPlayingAgent(0);
}

uint64_t type metadata completion function for CAFDNowPlayingAgent(uint64_t a1)
{
  _QWORD v2[6];

  v2[0] = "\b";
  v2[1] = &unk_100025F70;
  v2[2] = &unk_100025F70;
  v2[3] = &unk_100025F70;
  v2[4] = &unk_100025F70;
  v2[5] = &unk_100025F88;
  return swift_updateClassMetadata2(a1, 256, 6, v2, a1 + 160);
}

uint64_t outlined destroy of Measurement<NSUnitDuration>?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void specialized CAFDAgent._CAFDConnectionProxy.fetchNowPlayingSnapshot(reply:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (*v9)(_QWORD *, id, _QWORD);
  id v10;
  id Strong;

  Strong = (id)swift_unknownObjectWeakLoadStrong(a1 + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_agent);
  if (!Strong)
    goto LABEL_9;
  v3 = type metadata accessor for CAFDNowPlayingAgent(0);
  v4 = swift_dynamicCastClass(Strong, v3);
  if (!v4)
  {

LABEL_9:
    _Block_release(a2);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x20676E697373694DLL, 0xEE00726576726573, "caraccessoryd/CAFDNowPlayingAgent.swift", 39, 2, 307, 0);
    __break(1u);
    return;
  }
  v5 = v4;
  v6 = OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot;
  v7 = *(void **)(v4 + OBJC_IVAR____TtC13caraccessoryd19CAFDNowPlayingAgent_lastSnapshot);
  if (v7 || (CAFDNowPlayingAgent.updateNowPlaying()(), (v7 = *(void **)(v5 + v6)) != 0))
  {
    v8 = v7;
  }
  else
  {
    v8 = objc_msgSend(objc_allocWithZone((Class)CAFNowPlayingSnapshot), "init");
    v7 = 0;
  }
  v9 = (void (*)(_QWORD *, id, _QWORD))a2[2];
  v10 = v7;
  v9(a2, v8, 0);

}

unint64_t lazy protocol witness table accessor for type CAFDAgent._CAFDConnectionProxy and conformance NSObject()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type CAFDAgent._CAFDConnectionProxy and conformance NSObject;
  if (!lazy protocol witness table cache variable for type CAFDAgent._CAFDConnectionProxy and conformance NSObject)
  {
    v1 = type metadata accessor for CAFDAgent._CAFDConnectionProxy();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CAFDAgent._CAFDConnectionProxy and conformance NSObject);
  }
  return result;
}

uint64_t outlined copy of Data?(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(result, a2);
  return result;
}

uint64_t outlined copy of Data._Representation(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t outlined consume of Data?(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(result, a2);
  return result;
}

uint64_t sub_10001CF80()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t type metadata accessor for CAFMediaSource(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t outlined init with copy of CAFDAgent.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CAFDAgent.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CAFDAgent.Configuration(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CAFDAgent.Configuration(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnection & BSServiceConnectionContext) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t CAFDAgent.init(configuration:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char *v18;
  id v19;
  uint64_t result;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  void *v38;
  id v39;
  uint8_t *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t aBlock[5];
  uint64_t v47;
  objc_super v48;

  v3 = type metadata accessor for CAFDAgent.Configuration(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener] = 0;
  v10 = v1;
  v44 = v3;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(&_swiftEmptyArrayStorage))
  {
    specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    v11 = &_swiftEmptySetSingleton;
  }
  *(_QWORD *)&v10[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections] = v11;
  outlined init with copy of CAFDAgent.Configuration(a1, (uint64_t)&v10[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration]);

  v12 = (objc_class *)type metadata accessor for CAFDAgent(0);
  v48.receiver = v10;
  v48.super_class = v12;
  v13 = objc_msgSendSuper2(&v48, "init");
  v14 = __chkstk_darwin(v13);
  *(&v40 - 2) = (uint8_t *)a1;
  *(&v40 - 1) = (uint8_t *)v14;
  v15 = swift_allocObject(&unk_100031640, 32, 7);
  *(_QWORD *)(v15 + 16) = partial apply for closure #1 in CAFDAgent.init(configuration:);
  *(_QWORD *)(v15 + 24) = &v40 - 4;
  aBlock[4] = (uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionConfiguring) -> ();
  v47 = v15;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  aBlock[3] = (uint64_t)&block_descriptor_31_0;
  v16 = _Block_copy(aBlock);
  v17 = (void *)objc_opt_self(BSServiceConnectionListener);
  v18 = (char *)v13;
  swift_retain(v15);
  v19 = objc_msgSend(v17, "listenerWithConfigurator:", v16);
  _Block_release(v16);
  swift_release(v47);
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation(v15, "", 0, 0, 0, 1);
  result = swift_release(v15);
  if ((v16 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v21 = OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener;
    v22 = *(void **)&v18[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener];
    *(_QWORD *)&v18[OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_listener] = v19;

    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
    v23 = (uint64_t)v5;
    v24 = outlined init with copy of CAFDAgent.Configuration(a1, (uint64_t)v5);
    v25 = v9;
    v26 = Logger.logObject.getter(v24);
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc(12, -1);
      v41 = v21;
      v29 = (uint8_t *)v28;
      v30 = swift_slowAlloc(32, -1);
      v43 = v7;
      v31 = v30;
      v42 = v25;
      *(_DWORD *)v29 = 136315138;
      aBlock[0] = v30;
      v40 = v29 + 4;
      v32 = (uint64_t *)&v5[*(int *)(v44 + 36)];
      v33 = a1;
      v44 = v6;
      v34 = *v32;
      v35 = v32[1];
      swift_bridgeObjectRetain(v35);
      v36 = v34;
      a1 = v33;
      v45 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v35, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, aBlock);
      swift_bridgeObjectRelease(v35);
      outlined destroy of CAFDAgent.Configuration(v23);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "activating listener for %s", v29, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      v37 = v29;
      v21 = v41;
      swift_slowDealloc(v37, -1, -1);

      result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v42, v44);
    }
    else
    {
      outlined destroy of CAFDAgent.Configuration((uint64_t)v5);

      result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v25, v6);
    }
    v38 = *(void **)&v18[v21];
    if (v38)
    {
      v39 = v38;
      objc_msgSend(v39, "activate");

      outlined destroy of CAFDAgent.Configuration(a1);
      return (uint64_t)v18;
    }
  }
  __break(1u);
  return result;
}

id closure #1 in CAFDAgent.init(configuration:)(void *a1, uint64_t a2, uint64_t a3)
{
  NSString v5;
  NSString v6;

  type metadata accessor for CAFDAgent.Configuration(0);
  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setDomain:", v5);

  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "setService:", v6);

  return objc_msgSend(a1, "setDelegate:", a3);
}

void CAFDAgent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("caraccessoryd.CAFDAgent", 23, "init()", 6, 0);
  __break(1u);
}

id CAFDAgent.__deallocating_deinit()
{
  return CAFDAssetVariantsAgent.__deallocating_deinit(0, (uint64_t (*)(void))type metadata accessor for CAFDAgent);
}

uint64_t type metadata accessor for CAFDAgent(uint64_t a1)
{
  return type metadata accessor for CAFDAgent(a1, (uint64_t *)&type metadata singleton initialization cache for CAFDAgent, (uint64_t)&nominal type descriptor for CAFDAgent);
}

uint64_t CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(void *a1, void *a2)
{
  char *v2;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t result;
  _QWORD v17[5];
  uint64_t v18;
  objc_super v19;

  v5 = swift_unknownObjectWeakInit(&v2[OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_agent], 0);
  swift_unknownObjectWeakAssign(v5, a1);
  *(_QWORD *)&v2[OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection] = a2;
  v19.receiver = v2;
  v19.super_class = (Class)type metadata accessor for CAFDAgent._CAFDConnectionProxy();
  v6 = a2;
  v7 = objc_msgSendSuper2(&v19, "init");
  v8 = swift_allocObject(&unk_100031528, 32, 7);
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = swift_allocObject(&unk_100031550, 32, 7);
  *(_QWORD *)(v9 + 16) = partial apply for closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:);
  *(_QWORD *)(v9 + 24) = v8;
  v17[4] = partial apply for thunk for @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v18 = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnectionListenerConfiguring) -> ();
  v17[3] = &block_descriptor_12;
  v10 = _Block_copy(v17);
  v11 = v18;
  v12 = v7;
  v13 = v6;
  v14 = v12;
  v15 = a1;
  swift_retain(v9);
  swift_release(v11);
  objc_msgSend(v13, "configureConnection:", v10);

  _Block_release(v10);
  LOBYTE(v15) = swift_isEscapingClosureAtFileLocation(v9, "", 89, 80, 44, 1);
  swift_release(v8);
  result = swift_release(v9);
  if ((v15 & 1) == 0)
    return (uint64_t)v14;
  __break(1u);
  return result;
}

void closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;

  v5 = a2 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration;
  v6 = (int *)type metadata accessor for CAFDAgent.Configuration(0);
  objc_msgSend(a1, "setTargetQueue:", *(_QWORD *)(v5 + v6[5]));
  objc_msgSend(a1, "setServiceQuality:", *(_QWORD *)(v5 + v6[8]));
  objc_msgSend(a1, "setInterface:", *(_QWORD *)(v5 + v6[6]));
  objc_msgSend(a1, "setInterfaceTarget:", a3);
  v7 = swift_allocObject(&unk_1000315A0, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, a3);
  v9[4] = partial apply for closure #1 in closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:);
  v10 = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed BSServiceConnection & BSServiceConnectionContext) -> ();
  v9[3] = &block_descriptor_18_0;
  v8 = _Block_copy(v9);
  swift_release(v10);
  objc_msgSend(a1, "setInvalidationHandler:", v8);
  _Block_release(v8);
}

void closure #1 in closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  NSObject *v19;
  _QWORD *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD *v27;
  uint8_t *v28;
  NSObject *v29;
  _BYTE v30[24];

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CAFDAgent.Configuration(0);
  __chkstk_darwin(v7);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v30, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a2);
  if (Strong)
  {
    v11 = (void *)Strong;
    v12 = Strong + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_agent;
    v13 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_agent);
    if (v13)
    {
      v14 = (void *)v13;
      outlined init with copy of CAFDAgent.Configuration(v13 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration, (uint64_t)v9);

      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
      outlined destroy of CAFDAgent.Configuration((uint64_t)v9);
      v15 = v11;
      v16 = Logger.logObject.getter(v15);
      v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc(12, -1);
        v27 = (_QWORD *)swift_slowAlloc(8, -1);
        v28 = v18;
        v29 = v15;
        *(_DWORD *)v18 = 138412290;
        v26[1] = v18 + 4;
        v19 = v15;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30);
        v20 = v27;
        *v27 = v11;

        v21 = v17;
        v22 = v28;
        _os_log_impl((void *)&_mh_execute_header, v16, v21, "Connection invalidated %@", v28, 0xCu);
        v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy(v20, 1, v23);
        swift_slowDealloc(v20, -1, -1);
        swift_slowDealloc(v22, -1, -1);
      }
      else
      {

        v16 = v15;
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    v24 = swift_unknownObjectWeakLoadStrong(v12);
    if (v24)
    {
      v25 = (void *)v24;
      CAFDAgent.remove(proxy:)(v11);

    }
  }
}

uint64_t CAFDAgent.remove(proxy:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "invalidate");
  v12 = v2 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration;
  v21 = *(_QWORD *)(v12 + *(int *)(type metadata accessor for CAFDAgent.Configuration(0) + 20));
  v13 = swift_allocObject(&unk_1000314B0, 24, 7);
  swift_unknownObjectWeakInit(v13 + 16, v2);
  v14 = swift_allocObject(&unk_1000315F0, 32, 7);
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAgent.remove(proxy:);
  v24 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_25;
  v15 = _Block_copy(aBlock);
  swift_retain(v13);
  static DispatchQoS.unspecified.getter(a1);
  v22 = &_swiftEmptyArrayStorage;
  v16 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  v18 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v17, v18, v4, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19 = v24;
  swift_release(v13);
  return swift_release(v19);
}

Swift::Void __swiftcall CAFDAgent._CAFDConnectionProxy.activate()()
{
  CAFDAgent._CAFDConnectionProxy.activate()("Connection activating %@", (SEL *)&selRef_activate);
}

uint64_t CAFDAgent._CAFDConnectionProxy.remote.getter()
{
  uint64_t v0;
  NSString v1;
  NSString v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  Class isa;
  id v9;
  uint64_t v10;
  _OWORD v12[2];
  _OWORD v13[2];

  v1 = String._bridgeToObjectiveC()();
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend((id)objc_opt_self(RBSDomainAttribute), "attributeWithDomain:name:", v1, v2);

  v4 = *(void **)(v0 + OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100025E70;
  *(_QWORD *)(v6 + 32) = v3;
  *(_QWORD *)&v13[0] = v6;
  specialized Array._endMutation()();
  type metadata accessor for RBSAttribute();
  v7 = v3;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(*(_QWORD *)&v13[0]);
  v9 = objc_msgSend(v4, "remoteTargetWithAssertionAttributes:", isa);

  if (v9)
  {
    _bridgeAnyObjectToAny(_:)(v12, v9);
    swift_unknownObjectRelease(v9);

    outlined init with take of Any(v12, v13);
  }
  else
  {

    memset(v13, 0, sizeof(v13));
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  if (swift_dynamicCast(v12, v13, v10, (char *)&type metadata for Swift.AnyObject + 8, 6))
    return *(_QWORD *)&v12[0];
  else
    return 0;
}

id CAFDAgent._CAFDConnectionProxy.__deallocating_deinit(uint64_t a1)
{
  return CAFDAssetVariantsAgent.__deallocating_deinit(a1, type metadata accessor for CAFDAgent._CAFDConnectionProxy);
}

Swift::Void __swiftcall CAFDAgent._CAFDConnectionProxy.invalidate()()
{
  CAFDAgent._CAFDConnectionProxy.activate()("invalidate proxy %@", (SEL *)&selRef_invalidate);
}

id CAFDAgent._CAFDConnectionProxy.activate()(const char *a1, SEL *a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t Strong;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject **v22;
  uint64_t v23;
  uint8_t *v24;
  NSObject **v26;
  const char *v27;
  uint64_t v28;
  char *v29;
  SEL *v30;
  NSObject *v31;
  uint64_t v32;

  v5 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CAFDAgent.Configuration(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_unknownObjectWeakLoadStrong(&v5[OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_agent]);
  if (Strong)
  {
    v14 = (void *)Strong;
    outlined init with copy of CAFDAgent.Configuration(Strong + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration, (uint64_t)v12);

    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
    outlined destroy of CAFDAgent.Configuration((uint64_t)v12);
    v15 = v5;
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v30 = a2;
      v18 = swift_slowAlloc(12, -1);
      v28 = v7;
      v19 = (uint8_t *)v18;
      v26 = (NSObject **)swift_slowAlloc(8, -1);
      v27 = a1;
      *(_DWORD *)v19 = 138412290;
      v31 = v15;
      v20 = v15;
      v29 = v5;
      v21 = v20;
      a2 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32);
      v22 = v26;
      *v26 = v15;

      v5 = v29;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v27, v19, 0xCu);
      v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v22, 1, v23);
      swift_slowDealloc(v22, -1, -1);
      v24 = v19;
      v7 = v28;
      swift_slowDealloc(v24, -1, -1);
    }
    else
    {

      v16 = v15;
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return objc_msgSend(*(id *)&v5[OBJC_IVAR____TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy_connection], *a2);
}

void CAFDAgent.listener(_:didReceive:withContext:)(uint64_t a1, void *a2)
{
  specialized CAFDAgent.listener(_:didReceive:withContext:)(a2);
}

uint64_t CAFDAgent.add(proxy:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  CAFDAgent._CAFDConnectionProxy.activate()();
  v12 = v2 + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_configuration;
  v21 = *(_QWORD *)(v12 + *(int *)(type metadata accessor for CAFDAgent.Configuration(0) + 20));
  v13 = swift_allocObject(&unk_1000314B0, 24, 7);
  swift_unknownObjectWeakInit(v13 + 16, v2);
  v14 = swift_allocObject(&unk_1000314D8, 32, 7);
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = a1;
  aBlock[4] = partial apply for closure #1 in CAFDAgent.add(proxy:);
  v24 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_0;
  v15 = _Block_copy(aBlock);
  swift_retain(v13);
  static DispatchQoS.unspecified.getter(a1);
  v22 = &_swiftEmptyArrayStorage;
  v16 = lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  v18 = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v17, v18, v4, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19 = v24;
  swift_release(v13);
  return swift_release(v19);
}

void closure #1 in CAFDAgent.remove(proxy:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[24];
  _BYTE v9[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    swift_beginAccess(Strong + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections, v8, 33, 0);
    v7 = (void *)specialized Set._Variant.remove(_:)(a2, v6, (uint64_t (*)(uint64_t))type metadata accessor for CAFDAgent._CAFDConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAgent._CAFDConnectionProxy>);
    swift_endAccess(v8);

  }
}

void closure #1 in CAFDAgent.add(proxy:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _BYTE v9[24];
  Swift::Int v10;
  _BYTE v11[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    swift_beginAccess(Strong + OBJC_IVAR____TtC13caraccessoryd9CAFDAgent_connections, v9, 33, 0);
    v6 = a2;
    specialized Set._Variant.insert(_:)(&v10, v6, v7, (uint64_t (*)(uint64_t))type metadata accessor for CAFDAgent._CAFDConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAgent._CAFDConnectionProxy>);
    v8 = (void *)v10;
    swift_endAccess(v9);

  }
}

uint64_t specialized Set._Variant.remove(_:)(void *a1)
{
  return specialized Set._Variant.remove(_:)(a1, 0, (uint64_t (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAssetVariantsAgent._ConnectionProxy>);
}

uint64_t specialized Set._Variant.remove(_:)(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t *a4)
{
  _QWORD *v4;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  Swift::Int v15;
  Swift::Int v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v8 = v4;
  v10 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v10 < 0)
      v11 = *v4;
    else
      v11 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v10);
    v12 = a1;
    v13 = __CocoaSet.contains(_:)();

    if ((v13 & 1) != 0)
    {
      v14 = specialized Set._Variant._migrateToNative(_:removing:)(v11, (uint64_t)v12, a4, a2, a3);
      swift_bridgeObjectRelease(v10);
      return v14;
    }
LABEL_15:
    swift_bridgeObjectRelease(v10);
    return 0;
  }
  v15 = *(_QWORD *)(v10 + 40);
  swift_bridgeObjectRetain(v10);
  v16 = NSObject._rawHashValue(seed:)(v15);
  v17 = -1 << *(_BYTE *)(v10 + 32);
  v18 = v16 & ~v17;
  if (((*(_QWORD *)(v10 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
    goto LABEL_15;
  a3(a2);
  v19 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v18);
  v20 = static NSObject.== infix(_:_:)(v19, a1);

  if ((v20 & 1) == 0)
  {
    v21 = ~v17;
    do
    {
      v18 = (v18 + 1) & v21;
      if (((*(_QWORD *)(v10 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
        goto LABEL_15;
      v22 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v18);
      v23 = static NSObject.== infix(_:_:)(v22, a1);

    }
    while ((v23 & 1) == 0);
  }
  swift_bridgeObjectRelease(v10);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v8);
  v25 = *v8;
  v28 = *v8;
  *v8 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    specialized _NativeSet.copy()(a4);
    v25 = v28;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * v18);
  specialized _NativeSet._delete(at:)(v18);
  v26 = *v8;
  *v8 = v28;
  swift_bridgeObjectRelease(v26);
  return v14;
}

uint64_t specialized Set._Variant._migrateToNative(_:removing:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  Swift::Int *v5;
  Swift::Int *v9;
  uint64_t v12;
  uint64_t v13;
  Swift::Int v14;
  Swift::Int v15;
  Swift::Int v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t result;
  Swift::Int v25;

  v9 = v5;
  swift_bridgeObjectRelease(*v9);
  v12 = __CocoaSet.count.getter(a1);
  v13 = swift_unknownObjectRetain(a1);
  v14 = specialized _NativeSet.init(_:capacity:)(v13, v12, a3, a4, a5);
  v25 = v14;
  v15 = *(_QWORD *)(v14 + 40);
  swift_retain(v14);
  v16 = NSObject._rawHashValue(seed:)(v15);
  v17 = -1 << *(_BYTE *)(v14 + 32);
  v18 = v16 & ~v17;
  if (((*(_QWORD *)(v14 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
  {
    a5(a4);
    v19 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * v18);
    v20 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v20 & 1) != 0)
    {
LABEL_6:
      swift_release(v14);
      v14 = *(_QWORD *)(*(_QWORD *)(v14 + 48) + 8 * v18);
      specialized _NativeSet._delete(at:)(v18);
      if ((static NSObject.== infix(_:_:)(a2, v14) & 1) != 0)
      {
        *v9 = v25;
        return v14;
      }
      __break(1u);
    }
    else
    {
      v21 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v21;
        if (((*(_QWORD *)(v14 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v14 + 48) + 8 * v18);
        v23 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v23 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release(v14);
    __break(1u);
  }
  result = swift_release(v14);
  __break(1u);
  return result;
}

id specialized _NativeSet.copy()(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = static _SetStorage.copy(original:)(*v1);
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release(v3);
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int specialized _NativeSet.copyAndResize(capacity:)(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  Swift::Int v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;

  v3 = v2;
  v4 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v5 = a1;
  else
    v5 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = static _SetStorage.resize(original:capacity:move:)(v4, v5, 0);
  v7 = v6;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release(v4);
LABEL_38:
    *v3 = v7;
    return result;
  }
  v31 = v3;
  v8 = 1 << *(_BYTE *)(v4 + 32);
  v9 = v4 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v4 + 56);
  v12 = (unint64_t)(v8 + 63) >> 6;
  v13 = v6 + 56;
  result = swift_retain(v4);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_27;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v19 >= v12)
      goto LABEL_36;
    v20 = *(_QWORD *)(v9 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v12)
        goto LABEL_36;
      v20 = *(_QWORD *)(v9 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v12)
          goto LABEL_36;
        v20 = *(_QWORD *)(v9 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_26:
    v11 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_27:
    v22 = *(_QWORD *)(v7 + 40);
    v23 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v18);
    result = NSObject._rawHashValue(seed:)(v22);
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v13 + 8 * (v25 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v13 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v26);
      }
      while (v30 == -1);
      v16 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v23;
    ++*(_QWORD *)(v7 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v12)
  {
LABEL_36:
    result = swift_release_n(v4, 2);
    v3 = v31;
    goto LABEL_38;
  }
  v20 = *(_QWORD *)(v9 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_26;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v12)
      goto LABEL_36;
    v20 = *(_QWORD *)(v9 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int specialized _NativeSet.resize(capacity:)(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;

  v3 = v2;
  v4 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v5 = a1;
  else
    v5 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = static _SetStorage.resize(original:capacity:move:)(v4, v5, 1);
  v7 = v6;
  if (*(_QWORD *)(v4 + 16))
  {
    v31 = v3;
    v8 = 1 << *(_BYTE *)(v4 + 32);
    v9 = (_QWORD *)(v4 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v4 + 56);
    v12 = (unint64_t)(v8 + 63) >> 6;
    v13 = v6 + 56;
    result = swift_retain(v4);
    v15 = 0;
    while (1)
    {
      if (v11)
      {
        v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v18 = v17 | (v15 << 6);
      }
      else
      {
        v19 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v19 >= v12)
          goto LABEL_36;
        v20 = v9[v19];
        ++v15;
        if (!v20)
        {
          v15 = v19 + 1;
          if (v19 + 1 >= v12)
            goto LABEL_36;
          v20 = v9[v15];
          if (!v20)
          {
            v15 = v19 + 2;
            if (v19 + 2 >= v12)
              goto LABEL_36;
            v20 = v9[v15];
            if (!v20)
            {
              v21 = v19 + 3;
              if (v21 >= v12)
              {
LABEL_36:
                swift_release(v4);
                v3 = v31;
                v30 = 1 << *(_BYTE *)(v4 + 32);
                if (v30 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v9 = -1 << v30;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v20 = v9[v21];
              if (!v20)
              {
                while (1)
                {
                  v15 = v21 + 1;
                  if (__OFADD__(v21, 1))
                    goto LABEL_42;
                  if (v15 >= v12)
                    goto LABEL_36;
                  v20 = v9[v15];
                  ++v21;
                  if (v20)
                    goto LABEL_26;
                }
              }
              v15 = v21;
            }
          }
        }
LABEL_26:
        v11 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v15 << 6);
      }
      v22 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v18);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v7 + 40));
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v13 + 8 * v25);
        }
        while (v29 == -1);
        v16 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release(v4);
  *v3 = v7;
  return result;
}

unint64_t specialized _NativeSet._delete(at:)(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 40);
        v11 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(v3 + 48);
            v17 = (_QWORD *)(v16 + 8 * v2);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v17 >= v18 + 1))
            {
              *v17 = *v18;
              v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v19 = *(_QWORD *)(v3 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

Swift::Int specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int result;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v10 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v29 = v10;
    v11 = __CocoaSet.makeIterator()(a1);
    v12 = __CocoaSet.Iterator.next()(v11);
    if (v12)
    {
      v13 = v12;
      v14 = a5(a4);
      do
      {
        v27 = v13;
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v14, 7);
        v10 = v29;
        v22 = *(_QWORD *)(v29 + 16);
        if (*(_QWORD *)(v29 + 24) <= v22)
        {
          specialized _NativeSet.resize(capacity:)(v22 + 1, a3);
          v10 = v29;
        }
        v15 = v28;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v10 + 40));
        v17 = v10 + 56;
        v18 = -1 << *(_BYTE *)(v10 + 32);
        v19 = result & ~v18;
        v20 = v19 >> 6;
        if (((-1 << v19) & ~*(_QWORD *)(v10 + 56 + 8 * (v19 >> 6))) != 0)
        {
          v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v10 + 56 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v23 = 0;
          v24 = (unint64_t)(63 - v18) >> 6;
          do
          {
            if (++v20 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v25 = v20 == v24;
            if (v20 == v24)
              v20 = 0;
            v23 |= v25;
            v26 = *(_QWORD *)(v17 + 8 * v20);
          }
          while (v26 == -1);
          v21 = __clz(__rbit64(~v26)) + (v20 << 6);
        }
        *(_QWORD *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
        *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v21) = v15;
        ++*(_QWORD *)(v10 + 16);
        v13 = __CocoaSet.Iterator.next()(result);
      }
      while (v13);
    }
    swift_release(v11);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v10;
}

unint64_t specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, void *a2)
{
  return specialized Set._Variant.insert(_:)(a1, a2, 0, (uint64_t (*)(uint64_t))type metadata accessor for CAFDAssetVariantsAgent._ConnectionProxy, (uint64_t *)&demangling cache variable for type metadata for _SetStorage<CAFDAssetVariantsAgent._ConnectionProxy>);
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v9;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  Swift::Int v18;
  Swift::Int v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  void *v27;
  id v28;
  Swift::Int v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  char isUniquelyReferenced_nonNull_native;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v42;
  Swift::Int v43;

  v9 = v5;
  v12 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v12 < 0)
      v13 = *v5;
    else
      v13 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v5);
    v14 = a2;
    v15 = __CocoaSet.member(for:)();

    if (v15)
    {
      swift_bridgeObjectRelease(v12);

      v42 = v15;
      v16 = a4(a3);
      swift_unknownObjectRetain(v15);
      swift_dynamicCast(&v43, &v42, (char *)&type metadata for Swift.AnyObject + 8, v16, 7);
      *a1 = v43;
      swift_unknownObjectRelease(v15);
      return 0;
    }
    result = __CocoaSet.count.getter(v13);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v29 = specialized _NativeSet.init(_:capacity:)(v13, result + 1, a5, a3, a4);
    v43 = v29;
    v30 = *(_QWORD *)(v29 + 16);
    if (*(_QWORD *)(v29 + 24) <= v30)
    {
      v36 = v30 + 1;
      v37 = v14;
      specialized _NativeSet.resize(capacity:)(v36, a5);
      v31 = v43;
    }
    else
    {
      v31 = v29;
      v32 = v14;
    }
    specialized _NativeSet._unsafeInsertNew(_:)((uint64_t)v14, v31);
    v38 = *v9;
    *v9 = v31;
    swift_bridgeObjectRelease(v38);
    *a1 = (Swift::Int)v14;
  }
  else
  {
    v18 = *(_QWORD *)(v12 + 40);
    swift_bridgeObjectRetain(v12);
    v19 = NSObject._rawHashValue(seed:)(v18);
    v20 = -1 << *(_BYTE *)(v12 + 32);
    v21 = v19 & ~v20;
    v39 = a4;
    if (((*(_QWORD *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
    {
      a4(a3);
      v22 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * v21);
      v23 = static NSObject.== infix(_:_:)();

      if ((v23 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v12);
        v27 = *(void **)(*(_QWORD *)(*v9 + 48) + 8 * v21);
        *a1 = (Swift::Int)v27;
        v28 = v27;
        return 0;
      }
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * v21);
        v26 = static NSObject.== infix(_:_:)();

        if ((v26 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v12);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v9);
    v43 = *v9;
    *v9 = 0x8000000000000000;
    v34 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v34, v21, isUniquelyReferenced_nonNull_native, a5, a3, v39);
    v35 = *v9;
    *v9 = v43;
    swift_bridgeObjectRelease(v35);
    *a1 = (Swift::Int)v34;
  }
  return 1;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  uint64_t *v6;
  uint64_t *v9;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v9 = v6;
  v12 = *(_QWORD *)(*v6 + 16);
  v13 = *(_QWORD *)(*v6 + 24);
  if (v13 > v12 && (a3 & 1) != 0)
    goto LABEL_14;
  v14 = v12 + 1;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)(v14, a4);
  }
  else
  {
    if (v13 > v12)
    {
      specialized _NativeSet.copy()(a4);
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)(v14, a4);
  }
  v15 = *v6;
  v16 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v6 + 40));
  v17 = -1 << *(_BYTE *)(v15 + 32);
  a2 = v16 & ~v17;
  if (((*(_QWORD *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v18 = a6(a5);
    v19 = *(id *)(*(_QWORD *)(v15 + 48) + 8 * a2);
    v20 = static NSObject.== infix(_:_:)();

    if ((v20 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v18);
      __break(1u);
    }
    else
    {
      v21 = ~v17;
      while (1)
      {
        a2 = (a2 + 1) & v21;
        if (((*(_QWORD *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v15 + 48) + 8 * a2);
        v23 = static NSObject.== infix(_:_:)();

        if ((v23 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v24 = *v9;
  *(_QWORD *)(*v9 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v24 + 48) + 8 * a2) = a1;
  v25 = *(_QWORD *)(v24 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v27;
}

void specialized CAFDAgent.listener(_:didReceive:withContext:)(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  unsigned int v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  v3 = a1;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v27 = v7;
    *(_DWORD *)v6 = 136315138;
    ObjectType = swift_getObjectType(v3);
    v9 = BSServiceConnectionHost.CAFDDescription.getter(ObjectType);
    v11 = v10;
    v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);

    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received connection %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {

  }
  v12 = swift_getObjectType(v3);
  v13 = objc_msgSend(v3, "remoteToken");
  type metadata accessor for CAFDAgent.Configuration(0);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "hasEntitlement:", v14);

  if (v15)
  {
    v16 = objc_allocWithZone((Class)type metadata accessor for CAFDAgent._CAFDConnectionProxy());
    v17 = (void *)CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(v2, v3);
    CAFDAgent.add(proxy:)(v17);

  }
  else
  {
    v18 = v3;
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      v22 = swift_slowAlloc(32, -1);
      v27 = v22;
      *(_DWORD *)v21 = 136315138;
      v23 = BSServiceConnectionHost.CAFDDescription.getter(v12);
      v25 = v24;
      v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27);

      swift_bridgeObjectRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "connection %s does not have required entitlement", v21, 0xCu);
      swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v21, -1, -1);
    }
    else
    {

    }
  }
}

uint64_t ObjC metadata update function for CAFDAgent()
{
  return type metadata accessor for CAFDAgent(0);
}

uint64_t type metadata completion function for CAFDAgent(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for CAFDAgent.Configuration(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\b";
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for CAFDAgent.Configuration(uint64_t a1)
{
  return type metadata accessor for CAFDAgent(a1, (uint64_t *)&type metadata singleton initialization cache for CAFDAgent.Configuration, (uint64_t)&nominal type descriptor for CAFDAgent.Configuration);
}

uint64_t type metadata accessor for CAFDAgent(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t type metadata accessor for CAFDAgent._CAFDConnectionProxy()
{
  return objc_opt_self(_TtCC13caraccessoryd9CAFDAgent20_CAFDConnectionProxy);
}

uint64_t *initializeBufferWithCopyOfBuffer for CAFDAgent.Configuration(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v29);
  }
  else
  {
    v7 = type metadata accessor for Logger(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    v12 = a3[7];
    v13 = a3[8];
    v14 = (uint64_t *)((char *)a1 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = *(void **)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + v13) = (uint64_t)v17;
    v18 = a3[9];
    v19 = a3[10];
    v20 = (uint64_t *)((char *)a1 + v18);
    v21 = (uint64_t *)((char *)a2 + v18);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = (uint64_t *)((char *)a1 + v19);
    v24 = (uint64_t *)((char *)a2 + v19);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = v10;
    v27 = v11;
    swift_bridgeObjectRetain(v16);
    v28 = v17;
    swift_bridgeObjectRetain(v22);
    swift_bridgeObjectRetain(v25);
  }
  return a1;
}

uint64_t destroy for CAFDAgent.Configuration(uint64_t a1, int *a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[7] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[9] + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[10] + 8));
}

uint64_t initializeWithCopy for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;

  v6 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = *(void **)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v10;
  v11 = a3[7];
  v12 = a3[8];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = *(void **)(a2 + v12);
  *(_QWORD *)(a1 + v12) = v16;
  v17 = a3[9];
  v18 = a3[10];
  v19 = (_QWORD *)(a1 + v17);
  v20 = (_QWORD *)(a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (_QWORD *)(a1 + v18);
  v23 = (_QWORD *)(a2 + v18);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = v9;
  v26 = v10;
  swift_bridgeObjectRetain(v15);
  v27 = v16;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRetain(v24);
  return a1;
}

uint64_t assignWithCopy for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  v11 = a3[6];
  v12 = *(void **)(a2 + v11);
  v13 = *(void **)(a1 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  v14 = v12;

  v15 = a3[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v18 = v17[1];
  v19 = v16[1];
  v16[1] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  v20 = a3[8];
  v21 = *(void **)(a2 + v20);
  v22 = *(void **)(a1 + v20);
  *(_QWORD *)(a1 + v20) = v21;
  v23 = v21;

  v24 = a3[9];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v27 = v26[1];
  v28 = v25[1];
  v25[1] = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  v29 = a3[10];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  *v30 = *v31;
  v32 = v31[1];
  v33 = v30[1];
  v30[1] = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  return a1;
}

uint64_t initializeWithTake for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  v9 = a3[6];
  v10 = *(void **)(a1 + v9);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);

  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  v16 = v12[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease(v16);
  v17 = a3[8];
  v18 = *(void **)(a1 + v17);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);

  v19 = a3[9];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (uint64_t *)(a2 + v19);
  v23 = *v21;
  v22 = v21[1];
  v24 = v20[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease(v24);
  v25 = a3[10];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)(a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  v30 = v26[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease(v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020378);
}

uint64_t sub_100020378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for CAFDAgent.Configuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100020400);
}

uint64_t sub_100020400(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata completion function for CAFDAgent.Configuration(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = &unk_100026010;
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[5] = &unk_100026010;
    v4[6] = &unk_100026010;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
    return 0;
  }
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100020510(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void partial apply for closure #1 in CAFDAgent.add(proxy:)()
{
  uint64_t v0;

  closure #1 in CAFDAgent.add(proxy:)(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t block_destroy_helper_0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

uint64_t sub_1000205A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(void *a1)
{
  uint64_t v1;

  closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000205D4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void partial apply for closure #1 in closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in closure #1 in CAFDAgent._CAFDConnectionProxy.init(agent:connection:)(a1, v1);
}

void partial apply for closure #1 in CAFDAgent.remove(proxy:)()
{
  uint64_t v0;

  closure #1 in CAFDAgent.remove(proxy:)(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

id partial apply for closure #1 in CAFDAgent.init(configuration:)(void *a1)
{
  uint64_t v1;

  return closure #1 in CAFDAgent.init(configuration:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100020600()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id objc_msgSend_CAF_decodeCarData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CAF_decodeCarData:");
}

id objc_msgSend_CAF_encodeCarDataFrom_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CAF_encodeCarDataFrom:error:");
}

id objc_msgSend_MFiCertificateSerialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MFiCertificateSerialNumber");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__addRegistration_instanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addRegistration:instanceIDs:priority:withResponse:");
}

id objc_msgSend__getChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getChannel:");
}

id objc_msgSend__getClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getClient:");
}

id objc_msgSend__isRegisteredForPluginID_instanceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isRegisteredForPluginID:instanceID:");
}

id objc_msgSend__mainQueue_initVehicleDataSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mainQueue_initVehicleDataSession:");
}

id objc_msgSend__observeAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_observeAssertion:");
}

id objc_msgSend__removeConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeConnection:");
}

id objc_msgSend__removeRegistration_instanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeRegistration:instanceIDs:priority:withResponse:");
}

id objc_msgSend__setupCarDataChannel_channelType_qualityOfService_streamPriority_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:");
}

id objc_msgSend__startConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startConnection");
}

id objc_msgSend__stopConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopConnection");
}

id objc_msgSend__workQueue_didReceiveConfigFromPluginID_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_workQueue_didReceiveConfigFromPluginID:config:");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateManualDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateManualDomain:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addRegistrationFromCache_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRegistrationFromCache:priority:withResponse:");
}

id objc_msgSend_addSessionObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSessionObserver:");
}

id objc_msgSend_agent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "agent");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allowPartialConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowPartialConfiguration");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascTree(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ascTree");
}

id objc_msgSend_assertionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionCount");
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertions");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cacheValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheValues:");
}

id objc_msgSend_cachedValueForInstanceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedValueForInstanceID:");
}

id objc_msgSend_cachedValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedValues");
}

id objc_msgSend_carConfigDidUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carConfigDidUpdate");
}

id objc_msgSend_carConfigSummary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carConfigSummary");
}

id objc_msgSend_carDataAvailableToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carDataAvailableToken");
}

id objc_msgSend_carDataChannelDidClose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carDataChannelDidClose:");
}

id objc_msgSend_carDataChannelDidOpen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carDataChannelDidOpen:");
}

id objc_msgSend_carDataChannelDidReceive_pluginID_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carDataChannelDidReceive:pluginID:payload:");
}

id objc_msgSend_carDataChannels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carDataChannels");
}

id objc_msgSend_carDataClients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carDataClients");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channel");
}

id objc_msgSend_channelDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelDelegate");
}

id objc_msgSend_clientDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientDelegate");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "close");
}

id objc_msgSend_closeChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeChannel");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connections");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyWithoutPlugins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithoutPlugins");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAssertionWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAssertionWithAction:");
}

id objc_msgSend_currentCar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCar");
}

id objc_msgSend_currentCarConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCarConfiguration");
}

id objc_msgSend_currentCarIdentifierIsEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCarIdentifierIsEqual:");
}

id objc_msgSend_currentCarPluginCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCarPluginCount");
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSession");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didNotifyPluginID_instanceID_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didNotifyPluginID:instanceID:value:");
}

id objc_msgSend_didReceiveConfigFromPluginID_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveConfigFromPluginID:config:");
}

id objc_msgSend_didReceiveErrorFromPluginID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveErrorFromPluginID:error:");
}

id objc_msgSend_didReceiveNotificationFromPluginID_instanceID_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveNotificationFromPluginID:instanceID:value:");
}

id objc_msgSend_didReceiveRequestFromPluginID_instanceID_value_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRequestFromPluginID:instanceID:value:withResponse:");
}

id objc_msgSend_didReceiveUpdateFromPluginID_values_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveUpdateFromPluginID:values:");
}

id objc_msgSend_didRequestPluginID_instanceID_value_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRequestPluginID:instanceID:value:withResponse:");
}

id objc_msgSend_didUpdateConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateConfig:");
}

id objc_msgSend_didUpdateCurrentCarConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateCurrentCarConfig:");
}

id objc_msgSend_didUpdatePluginID_values_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdatePluginID:values:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantPast");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fastStartup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fastStartup");
}

id objc_msgSend_fastStartupRegistrations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fastStartupRegistrations");
}

id objc_msgSend_getBoolean_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBoolean:key:");
}

id objc_msgSend_getType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getType:");
}

id objc_msgSend_handleCommand_transactionID_values_errors_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCommand:transactionID:values:errors:priority:");
}

id objc_msgSend_hasAccessory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAccessory:");
}

id objc_msgSend_hasAccessory_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAccessory:service:");
}

id objc_msgSend_hasAccessory_service_characteristic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAccessory:service:characteristic:");
}

id objc_msgSend_hasAccessory_service_control_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAccessory:service:control:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCarManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCarManager:");
}

id objc_msgSend_initWithCarManager_sessionStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCarManager:sessionStatus:");
}

id objc_msgSend_initWithChannel_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChannel:priority:");
}

id objc_msgSend_initWithConnection_agent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:agent:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithIdentifier_capture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:capture:");
}

id objc_msgSend_initWithIdentifier_session_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:session:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithPluginID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPluginID:");
}

id objc_msgSend_initWithProtocol_callbackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProtocol:callbackQueue:");
}

id objc_msgSend_initWithRegistrationDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegistrationDictionary:");
}

id objc_msgSend_initWithSession_channelType_channelID_withoutReply_qualityOfService_streamPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:channelType:channelID:withoutReply:qualityOfService:streamPriority:");
}

id objc_msgSend_initWithSessionStatus_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionStatus:config:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithValue_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:error:");
}

id objc_msgSend_initWithValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValues:");
}

id objc_msgSend_initWithValuesAndError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValuesAndError:error:");
}

id objc_msgSend_inputQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputQueue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndRemoveAssertions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAndRemoveAssertions");
}

id objc_msgSend_isConfigured(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConfigured");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isOpened(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOpened");
}

id objc_msgSend_lastAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastAssertion");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_notifyInstanceID_value_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyInstanceID:value:priority:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openChannel");
}

id objc_msgSend_osStatusFromCarDataError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osStatusFromCarDataError:");
}

id objc_msgSend_osTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osTransaction");
}

id objc_msgSend_outputQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputQueue");
}

id objc_msgSend_parseValues_errors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseValues:errors:");
}

id objc_msgSend_pluginConfigs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginConfigs");
}

id objc_msgSend_pluginConfigsRequested(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginConfigsRequested");
}

id objc_msgSend_pluginCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginCount");
}

id objc_msgSend_pluginID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginID");
}

id objc_msgSend_pluginStateCaptures(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginStateCaptures");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priority");
}

id objc_msgSend_processFastStartupRegistrations_config_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processFastStartupRegistrations:config:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processingQueue");
}

id objc_msgSend_proxyQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyQueue");
}

id objc_msgSend_readFromCache_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readFromCache:priority:withResponse:");
}

id objc_msgSend_readInstanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readInstanceIDs:priority:withResponse:");
}

id objc_msgSend_receiveData_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveData:priority:");
}

id objc_msgSend_reconnectTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconnectTimer");
}

id objc_msgSend_registerInstanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerInstanceIDs:priority:withResponse:");
}

id objc_msgSend_registrations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrations");
}

id objc_msgSend_registrationsForPluginID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationsForPluginID:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteProxies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteProxies");
}

id objc_msgSend_remoteProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteProxy");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeRegistrationFromCache_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRegistrationFromCache:priority:withResponse:");
}

id objc_msgSend_requestConfigurationWithPriority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestConfigurationWithPriority:withResponse:");
}

id objc_msgSend_requestInstanceID_value_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestInstanceID:value:priority:withResponse:");
}

id objc_msgSend_responseInstanceID_error_transactionID_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseInstanceID:error:transactionID:priority:");
}

id objc_msgSend_responseInstanceID_value_transactionID_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseInstanceID:value:transactionID:priority:");
}

id objc_msgSend_responseTransactionID_error_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseTransactionID:error:priority:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
}

id objc_msgSend_sendChannelMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendChannelMessage:");
}

id objc_msgSend_sendCommand_error_transactionID_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:error:transactionID:priority:");
}

id objc_msgSend_sendCommand_errors_transactionID_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:errors:transactionID:priority:");
}

id objc_msgSend_sendCommand_values_errors_error_transactionID_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:values:errors:error:transactionID:priority:withResponse:");
}

id objc_msgSend_sendCommand_values_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:values:priority:withResponse:");
}

id objc_msgSend_sendCommand_values_transactionID_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:values:transactionID:priority:");
}

id objc_msgSend_sendToPluginID_payload_priority_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendToPluginID:payload:priority:completion:");
}

id objc_msgSend_sendToPluginID_payload_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendToPluginID:payload:withCompletion:");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceName");
}

id objc_msgSend_sessionDidConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDidConnect:");
}

id objc_msgSend_sessionStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionStatus");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAssertionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssertionCount:");
}

id objc_msgSend_setCarStateCapture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarStateCapture:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setChannelDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannelDelegate:");
}

id objc_msgSend_setClientDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientDelegate:");
}

id objc_msgSend_setCurrentCar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCar:");
}

id objc_msgSend_setCurrentCarConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentCarConfiguration:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsOpened_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsOpened:");
}

id objc_msgSend_setLastAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastAssertion:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOsTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOsTransaction:");
}

id objc_msgSend_setPluginConfigsRequested_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPluginConfigsRequested:");
}

id objc_msgSend_setReconnectTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReconnectTimer:");
}

id objc_msgSend_setRegistrationsStateCapture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistrationsStateCapture:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setStateCaptureManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateCaptureManager:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stateCaptureForPluginID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateCaptureForPluginID:");
}

id objc_msgSend_stateCaptureManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateCaptureManager");
}

id objc_msgSend_stateCaptureValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateCaptureValues");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsVehicleData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsVehicleData");
}

id objc_msgSend_takeAssertions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeAssertions");
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactions");
}

id objc_msgSend_treeLogLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "treeLogLines");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unregisterInstanceIDs_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterInstanceIDs:priority:withResponse:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateConfiguration_pluginConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:pluginConfig:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueCaptureIIDsFromAccessoryConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueCaptureIIDsFromAccessoryConfig:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "values");
}

id objc_msgSend_valuesForPluginID_iids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuesForPluginID:iids:");
}

id objc_msgSend_vehicleDataPluginCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleDataPluginCount");
}

id objc_msgSend_vehicleDataProtocolVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleDataProtocolVersion");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workQueue");
}

id objc_msgSend_writeValues_priority_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeValues:priority:withResponse:");
}
