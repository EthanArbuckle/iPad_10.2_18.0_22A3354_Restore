uint64_t kPPDateComparator_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id pp_social_highlights_signpost_handle()
{
  if (pp_social_highlights_signpost_handle__pasOnceToken29 != -1)
    dispatch_once(&pp_social_highlights_signpost_handle__pasOnceToken29, &__block_literal_global_47_6819);
  return (id)pp_social_highlights_signpost_handle__pasExprOnceResult;
}

id pp_xpc_server_log_handle()
{
  if (pp_xpc_server_log_handle__pasOnceToken12 != -1)
    dispatch_once(&pp_xpc_server_log_handle__pasOnceToken12, &__block_literal_global_22);
  return (id)pp_xpc_server_log_handle__pasExprOnceResult;
}

void __pp_default_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Default");
  v2 = (void *)pp_default_log_handle__pasExprOnceResult;
  pp_default_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __pp_xpc_client_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "XPCClient");
  v2 = (void *)pp_xpc_client_log_handle__pasExprOnceResult;
  pp_xpc_client_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void sub_18BE3C154(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BE3C7B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BE3CA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE3CFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_18BE3D194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id pp_default_log_handle()
{
  if (pp_default_log_handle__pasOnceToken2 != -1)
    dispatch_once(&pp_default_log_handle__pasOnceToken2, &__block_literal_global_6766);
  return (id)pp_default_log_handle__pasExprOnceResult;
}

void sub_18BE3DA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  void *v20;
  uint64_t v21;

  objc_sync_exit(v20);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose((const void *)(v21 - 120), 8);
  _Unwind_Resume(a1);
}

id pp_social_highlights_log_handle()
{
  if (pp_social_highlights_log_handle__pasOnceToken16 != -1)
    dispatch_once(&pp_social_highlights_log_handle__pasOnceToken16, &__block_literal_global_30);
  return (id)pp_social_highlights_log_handle__pasExprOnceResult;
}

void sub_18BE3E0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id pp_xpc_client_log_handle()
{
  if (pp_xpc_client_log_handle__pasOnceToken13 != -1)
    dispatch_once(&pp_xpc_client_log_handle__pasOnceToken13, &__block_literal_global_24);
  return (id)pp_xpc_client_log_handle__pasExprOnceResult;
}

void sub_18BE3E76C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id pp_quicktype_log_handle()
{
  if (pp_quicktype_log_handle__pasOnceToken3 != -1)
    dispatch_once(&pp_quicktype_log_handle__pasOnceToken3, &__block_literal_global_4);
  return (id)pp_quicktype_log_handle__pasExprOnceResult;
}

void __pp_social_highlights_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "SocialHighlights");
  v2 = (void *)pp_social_highlights_log_handle__pasExprOnceResult;
  pp_social_highlights_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_private_log_handle()
{
  if (pp_private_log_handle__pasOnceToken11 != -1)
    dispatch_once(&pp_private_log_handle__pasOnceToken11, &__block_literal_global_20_6791);
  return (id)pp_private_log_handle__pasExprOnceResult;
}

id PPGetStringInternPool()
{
  if (PPGetStringInternPool__pasOnceToken8 != -1)
    dispatch_once(&PPGetStringInternPool__pasOnceToken8, &__block_literal_global_102);
  return (id)PPGetStringInternPool__pasExprOnceResult;
}

void sub_18BE3F124(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18BE45218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_18BE453A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_18BE4552C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
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

void sub_18BE45AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE4697C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__384(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__385(uint64_t a1)
{

}

void sub_18BE479EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18BE47C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__498(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__499(uint64_t a1)
{

}

void sub_18BE48490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__554(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__555(uint64_t a1)
{

}

void PPEncodeCalendarColor(void *a1, CGColor *a2)
{
  id v3;
  CGColorSpace *ColorSpace;
  CFPropertyListRef v5;
  CFDataRef v6;
  const CGFloat *Components;
  __CFString *v8;
  NSObject *v9;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (a2)
  {
    ColorSpace = CGColorGetColorSpace(a2);
    v5 = CGColorSpaceCopyPropertyList(ColorSpace);
    error = 0;
    v6 = CFPropertyListCreateData(0, v5, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFRelease(v5);
    if (!v6 || error)
    {
      if (error)
        v8 = (__CFString *)CFErrorCopyDescription(error);
      else
        v8 = CFSTR("Unknown reason");
      pp_events_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_error_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_ERROR, "failed to create space plist data from plist: %@", buf, 0xCu);
      }

      if (error)
        CFRelease(error);
      if (v6)
        CFRelease(v6);
      objc_msgSend(v3, "encodeBool:forKey:", 0, CFSTR("sup_hcc"));
    }
    else
    {
      Components = CGColorGetComponents(a2);
      objc_msgSend(v3, "encodeDouble:forKey:", CFSTR("sup_cc0"), *Components);
      objc_msgSend(v3, "encodeDouble:forKey:", CFSTR("sup_cc1"), Components[1]);
      objc_msgSend(v3, "encodeDouble:forKey:", CFSTR("sup_cc2"), Components[2]);
      objc_msgSend(v3, "encodeDouble:forKey:", CFSTR("sup_cc3"), Components[3]);
      objc_msgSend(v3, "encodeBool:forKey:", 1, CFSTR("sup_hcc"));
      objc_msgSend(v3, "encodeObject:forKey:", v6, CFSTR("sup_csd"));
      v8 = (__CFString *)v6;
    }

  }
}

CGColorRef PPCreateCalendarColorWithDecoder(void *a1)
{
  __CFString *v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  void *v6;
  void *v7;
  const __CFData *v8;
  CFPropertyListRef v9;
  CGColorSpace *v10;
  CGColorRef v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  __CFString *v16;
  NSObject *v17;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v21;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v1 = a1;
  if (-[__CFString decodeBoolForKey:](v1, "decodeBoolForKey:", CFSTR("sup_hcc")))
  {
    -[__CFString decodeDoubleForKey:](v1, "decodeDoubleForKey:", CFSTR("sup_cc0"));
    components[0] = v2;
    -[__CFString decodeDoubleForKey:](v1, "decodeDoubleForKey:", CFSTR("sup_cc1"));
    components[1] = v3;
    -[__CFString decodeDoubleForKey:](v1, "decodeDoubleForKey:", CFSTR("sup_cc2"));
    components[2] = v4;
    -[__CFString decodeDoubleForKey:](v1, "decodeDoubleForKey:", CFSTR("sup_cc3"));
    components[3] = v5;
    -[__CFString decodeObjectOfClass:forKey:](v1, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sup_csd"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      error = 0;
      v9 = CFPropertyListCreateWithData(0, v8, 0, 0, &error);
      CFRelease(v8);
      if (!v9 || error)
      {
        if (error)
          v16 = (__CFString *)CFErrorCopyDescription(error);
        else
          v16 = CFSTR("Unknown reason");
        pp_events_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v16;
          _os_log_error_impl(&dword_18BE3A000, v17, OS_LOG_TYPE_ERROR, "failed to create space plist from data: %@", buf, 0xCu);
        }

        if (error)
          CFRelease(error);
        if (v9)
          CFRelease(v9);

        goto LABEL_24;
      }
      v10 = CGColorSpaceCreateWithPropertyList(v9);
      CFRelease(v9);
      if (v10)
      {
        v11 = CGColorCreate(v10, components);
        CGColorSpaceRelease(v10);
LABEL_25:

        goto LABEL_26;
      }
      pp_events_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = "failed to create color space from property list";
        v14 = v12;
        v15 = 2;
        goto LABEL_22;
      }
    }
    else
    {
      pp_events_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v1;
        v13 = "failed to get space data from decoder %@";
        v14 = v12;
        v15 = 12;
LABEL_22:
        _os_log_error_impl(&dword_18BE3A000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }

LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  v11 = 0;
LABEL_26:

  return v11;
}

void sub_18BE4ACD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE4B134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE4DB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE4DFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE4E7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE4E978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE4EBB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18BE4ED6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE4F2EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1193(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1194(uint64_t a1)
{

}

id getEKObjectIDClass()
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
  v0 = (void *)getEKObjectIDClass_softClass;
  v7 = getEKObjectIDClass_softClass;
  if (!getEKObjectIDClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getEKObjectIDClass_block_invoke;
    v3[3] = &unk_1E226B918;
    v3[4] = &v4;
    __getEKObjectIDClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18BE527D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKObjectIDClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!EventKitLibraryCore_frameworkLibrary)
    EventKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!EventKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *EventKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPEvent.m"), 22, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("EKObjectID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKObjectIDClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPEvent.m"), 23, CFSTR("Unable to find class %s"), "EKObjectID");

LABEL_8:
    __break(1u);
  }
  getEKObjectIDClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

PPAttendee *internUsingSet(void *a1, void *a2)
{
  id v3;
  id v4;
  PPAttendee *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  void *v15;
  PPAttendee *v16;
  id v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  unint64_t v28;
  char *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  PPAttendee *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *memptr;
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3 && malloc_size(v3))
  {
    objc_msgSend(v4, "member:", v3);
    v5 = (PPAttendee *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v3;
        v54[0] = 0;
        v7 = objc_msgSend(v6, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, v54);
        if (v7)
        {
          v8 = v7;
          v9 = objc_alloc(MEMORY[0x1E0CB3940]);
          v10 = v54[0];
          v11 = v8;
          v12 = 4;
        }
        else
        {
          v18 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 2483028224);
          v19 = objc_msgSend(v6, "_fastCharacterContents");
          if (!v19)
          {
            v28 = v18 + 1;
            memptr = 0;
            v53 = 0;
            if (v18 + 1 > 0x4000)
            {
              v40 = malloc_type_posix_memalign(&memptr, 8uLL, v18, 0x56EFB4B4uLL);
              LOBYTE(v53) = 0;
              if (v40)
              {
                objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
                v45 = (id)objc_claimAutoreleasedReturnValue();
                objc_exception_throw(v45);
              }
              v29 = (char *)memptr;
            }
            else
            {
              MEMORY[0x1E0C80A78]();
              v29 = (char *)&v46 - ((v18 + 16) & 0xFFFFFFFFFFFFFFF0);
              bzero(v29, v18 + 1);
            }
            objc_msgSend(v6, "getCharacters:", v29);
            v5 = (PPAttendee *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v29, v18, 2483028224);
            if (v28 > 0x4000)
              free(v29);
            goto LABEL_29;
          }
          v20 = v19;
          v9 = objc_alloc(MEMORY[0x1E0CB3940]);
          v11 = v20;
          v10 = v18;
          v12 = 2483028224;
        }
        v5 = (PPAttendee *)objc_msgSend(v9, "initWithBytes:length:encoding:", v11, v10, v12);
LABEL_29:

        goto LABEL_30;
      }
      getEKObjectIDClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v3;
        v14 = objc_msgSend(v6, "isTemporary");
        v15 = (void *)MEMORY[0x18D7805AC]();
        if (v14)
        {
          v16 = (PPAttendee *)v6;
        }
        else
        {
          objc_msgSend(getEKObjectIDClass(), "objectIDWithEntityType:rowID:databaseID:", objc_msgSend(v6, "entityType"), objc_msgSend(v6, "rowID"), objc_msgSend(v6, "databaseID"));
          v16 = (PPAttendee *)objc_claimAutoreleasedReturnValue();
        }
        v5 = v16;
        objc_autoreleasePoolPop(v15);
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend(v3, "timeIntervalSinceReferenceDate");
        v5 = (PPAttendee *)objc_msgSend(v17, "initWithTimeIntervalSinceReferenceDate:");
LABEL_30:
        objc_msgSend(v4, "addObject:", v5);
        goto LABEL_8;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = v3;
          v47 = [PPAttendee alloc];
          objc_msgSend(v30, "name");
          v49 = (id)objc_claimAutoreleasedReturnValue();
          internUsingSet(v49, v4);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "emailAddress");
          v48 = (id)objc_claimAutoreleasedReturnValue();
          internUsingSet(v48, v4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPAttendee _plist]((uint64_t)v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("url"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          internUsingSet(v34, v4);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v30, "isCurrentUser");
          v37 = objc_msgSend(v30, "status");

          v5 = -[PPAttendee initWithName:emailAddress:urlString:isCurrentUser:status:](v47, "initWithName:emailAddress:urlString:isCurrentUser:status:", v31, v32, v35, v36, v37);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nonnull internUsingSet(NSObject * _Nonnull __strong, NSMutableSet * _Nonnull __strong)");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("PPEvent.m"), 319, CFSTR("unexpected type %@"), objc_opt_class());

          v5 = 0;
        }
        goto LABEL_30;
      }
      v21 = (void *)MEMORY[0x18D7805AC]();
      v51 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v51);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v51;
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nonnull internUsingSet(NSObject * _Nonnull __strong, NSMutableSet * _Nonnull __strong)");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PPEvent.m"), 305, CFSTR("failed to archive: %@"), v23);

      }
      v24 = (void *)MEMORY[0x1E0CB3710];
      v25 = (void *)MEMORY[0x18D7805AC]();
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
      objc_autoreleasePoolPop(v25);
      v50 = v23;
      objc_msgSend(v24, "unarchivedObjectOfClasses:fromData:error:", v26, v22, &v50);
      v5 = (PPAttendee *)objc_claimAutoreleasedReturnValue();
      v27 = v50;

      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nonnull internUsingSet(NSObject * _Nonnull __strong, NSMutableSet * _Nonnull __strong)");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("PPEvent.m"), 309, CFSTR("failed to unarchive: %@"), v27);

      }
      objc_autoreleasePoolPop(v21);
    }
  }
  else
  {
    v5 = (PPAttendee *)v3;
  }
LABEL_8:

  return v5;
}

void PPSetContactStoreFactoryForTesting(void *a1)
{
  id v1;

  v1 = a1;
  __assert_rtn("PPSetContactStoreFactoryForTesting", "PPContactsUtilities.m", 63, "0");
}

id PPNewCNContactStore()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C97298]);
  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "setIncludeDonatedContacts:", 1);
  v2 = (void *)objc_msgSend(v0, "initWithConfiguration:", v1);

  return v2;
}

id PPSharedCNContactStore()
{
  if (PPSharedCNContactStore__pasOnceToken3 != -1)
    dispatch_once(&PPSharedCNContactStore__pasOnceToken3, &__block_literal_global_1548);
  return (id)PPSharedCNContactStore__pasExprOnceResult;
}

void PPSetSuggestionsContactServiceFactoryForTesting(void *a1)
{
  id v1;

  v1 = a1;
  __assert_rtn("PPSetSuggestionsContactServiceFactoryForTesting", "PPContactsUtilities.m", 81, "0");
}

uint64_t PPNewSuggestionsContactService()
{
  return objc_msgSend(MEMORY[0x1E0D19970], "serviceForContacts");
}

id PPSharedSuggestionsContactService()
{
  if (PPSharedSuggestionsContactService__pasOnceToken4 != -1)
    dispatch_once(&PPSharedSuggestionsContactService__pasOnceToken4, &__block_literal_global_5);
  return (id)PPSharedSuggestionsContactService__pasExprOnceResult;
}

void PPSetEventStoreFactoryForTesting(void *a1)
{
  id v1;

  v1 = a1;
  __assert_rtn("PPSetEventStoreFactoryForTesting", "PPEventsSupport.m", 39, "0");
}

id PPNewEKEventStore()
{
  void *v0;
  objc_class *v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getEKEventStoreClass_softClass;
  v7 = getEKEventStoreClass_softClass;
  if (!getEKEventStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getEKEventStoreClass_block_invoke;
    v3[3] = &unk_1E226B918;
    v3[4] = &v4;
    __getEKEventStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  return (id)objc_msgSend([v1 alloc], "initWithEKOptions:path:changeTrackingClientId:enablePropertyModificationLogging:allowDelegateSources:", 128, 0, 0, 1, 0);
}

void sub_18BE55334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKEventStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!EventKitLibraryCore_frameworkLibrary_1557)
    EventKitLibraryCore_frameworkLibrary_1557 = _sl_dlopen();
  if (!EventKitLibraryCore_frameworkLibrary_1557)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *EventKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPEventsSupport.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("EKEventStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKEventStoreClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPEventsSupport.m"), 21, CFSTR("Unable to find class %s"), "EKEventStore");

LABEL_8:
    __break(1u);
  }
  getEKEventStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PPNextMidnight()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "startOfDayForDate:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id PPPreviousMidnight()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  objc_msgSend(v0, "startOfDayForDate:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_18BE55A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE55FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_18BE56434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1771(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x18D780768](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1772(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void sub_18BE5D7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPIsServerContext()
{
  if (PPIsServerContext__pasOnceToken7 != -1)
    dispatch_once(&PPIsServerContext__pasOnceToken7, &__block_literal_global_98);
  return PPIsServerContext__pasExprOnceResult;
}

id PPGetSourceInternPool()
{
  if (PPGetSourceInternPool__pasOnceToken9 != -1)
    dispatch_once(&PPGetSourceInternPool__pasOnceToken9, &__block_literal_global_107);
  return (id)PPGetSourceInternPool__pasExprOnceResult;
}

void sub_18BE5EA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18BE5EEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2697(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2698(uint64_t a1)
{

}

void sub_18BE60F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE61000(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18BE612A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2954(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2955(uint64_t a1)
{

}

void sub_18BE64568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_18BE646F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18BE64880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3248(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3249(uint64_t a1)
{

}

void sub_18BE65898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3500(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3501(uint64_t a1)
{

}

void sub_18BE6972C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE6A588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE6AD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v7 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_18BE6B024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18BE6B200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4029(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4030(uint64_t a1)
{

}

void sub_18BE6BDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE6CC04(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18BE6D0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4177(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4178(uint64_t a1)
{

}

uint64_t qidStringToNumeric(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("Q")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t qidStringToNumeric(NSString *__strong)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PPSpotlightScoringFeatureVector.m"), 95, CFSTR("Invalid Qid: %@"), v1);

  }
  objc_msgSend(v1, "substringFromIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

uint64_t __Block_byref_object_copy__4414(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4415(uint64_t a1)
{

}

void sub_18BE6F924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE713C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE724B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4954(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4955(uint64_t a1)
{

}

void sub_18BE73018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18BE73250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18BE73460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5023(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5024(uint64_t a1)
{

}

void sub_18BE753D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE75748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE75858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE75B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5322(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5323(uint64_t a1)
{

}

void sub_18BE762E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE767D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5610(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5611(uint64_t a1)
{

}

void sub_18BE771E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE78074(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18BE78310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE785C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5794(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5795(uint64_t a1)
{

}

void sub_18BE788E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getEKCalendarVisibilityManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKCalendarVisibilityManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKCalendarVisibilityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKCalendarVisibilityManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 41, CFSTR("Unable to find class %s"), "EKCalendarVisibilityManager");

    __break(1u);
  }
}

void *EventKitLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!EventKitLibraryCore_frameworkLibrary_5801)
    EventKitLibraryCore_frameworkLibrary_5801 = _sl_dlopen();
  v0 = (void *)EventKitLibraryCore_frameworkLibrary_5801;
  if (!EventKitLibraryCore_frameworkLibrary_5801)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *EventKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PPNotificationManager.m"), 37, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_18BE78EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE79378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18BE79638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getEKObjectChangeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKObjectChange");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKObjectChangeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKObjectChangeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 43, CFSTR("Unable to find class %s"), "EKObjectChange");

    __break(1u);
  }
}

void sub_18BE79AC0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_18BE79D18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_18BE7A02C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18BE7A400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE7AC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getEKCalendarItemChangeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKCalendarItemChange");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKCalendarItemChangeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKCalendarItemChangeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 45, CFSTR("Unable to find class %s"), "EKCalendarItemChange");

    __break(1u);
  }
}

void __getEKExceptionDateChangeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKExceptionDateChange");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKExceptionDateChangeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKExceptionDateChangeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 46, CFSTR("Unable to find class %s"), "EKExceptionDateChange");

    __break(1u);
  }
}

void __getEKRecurrenceChangeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKRecurrenceChange");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKRecurrenceChangeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKRecurrenceChangeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 47, CFSTR("Unable to find class %s"), "EKRecurrenceChange");

    __break(1u);
  }
}

void __getEKEventChangeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKEventChange");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKEventChangeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKEventChangeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 48, CFSTR("Unable to find class %s"), "EKEventChange");

    __break(1u);
  }
}

void __getEKAttendeeChangeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKAttendeeChange");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKAttendeeChangeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKAttendeeChangeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 49, CFSTR("Unable to find class %s"), "EKAttendeeChange");

    __break(1u);
  }
}

void __getEKOrganizerChangeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  EventKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("EKOrganizerChange");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEKOrganizerChangeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEKOrganizerChangeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPNotificationManager.m"), 50, CFSTR("Unable to find class %s"), "EKOrganizerChange");

    __break(1u);
  }
}

void sub_18BE7B470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE7B544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE7B718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18BE7B9FC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_18BE7C34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18BE7E4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18BE7E6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6136(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6137(uint64_t a1)
{

}

void sub_18BE7F2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18BE7F534(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18BE7F4CCLL);
}

void sub_18BE7F540(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void __pp_quicktype_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "QuickType");
  v2 = (void *)pp_quicktype_log_handle__pasExprOnceResult;
  pp_quicktype_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_entities_log_handle()
{
  if (pp_entities_log_handle__pasOnceToken4 != -1)
    dispatch_once(&pp_entities_log_handle__pasOnceToken4, &__block_literal_global_6);
  return (id)pp_entities_log_handle__pasExprOnceResult;
}

void __pp_entities_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Entities");
  v2 = (void *)pp_entities_log_handle__pasExprOnceResult;
  pp_entities_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_topics_log_handle()
{
  if (pp_topics_log_handle__pasOnceToken5 != -1)
    dispatch_once(&pp_topics_log_handle__pasOnceToken5, &__block_literal_global_8);
  return (id)pp_topics_log_handle__pasExprOnceResult;
}

void __pp_topics_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Topics");
  v2 = (void *)pp_topics_log_handle__pasExprOnceResult;
  pp_topics_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_contacts_log_handle()
{
  if (pp_contacts_log_handle__pasOnceToken6 != -1)
    dispatch_once(&pp_contacts_log_handle__pasOnceToken6, &__block_literal_global_10_6779);
  return (id)pp_contacts_log_handle__pasExprOnceResult;
}

void __pp_contacts_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Contacts");
  v2 = (void *)pp_contacts_log_handle__pasExprOnceResult;
  pp_contacts_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_events_log_handle()
{
  if (pp_events_log_handle__pasOnceToken7 != -1)
    dispatch_once(&pp_events_log_handle__pasOnceToken7, &__block_literal_global_12);
  return (id)pp_events_log_handle__pasExprOnceResult;
}

void __pp_events_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Events");
  v2 = (void *)pp_events_log_handle__pasExprOnceResult;
  pp_events_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_connections_log_handle()
{
  if (pp_connections_log_handle__pasOnceToken8 != -1)
    dispatch_once(&pp_connections_log_handle__pasOnceToken8, &__block_literal_global_14);
  return (id)pp_connections_log_handle__pasExprOnceResult;
}

void __pp_connections_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Connections");
  v2 = (void *)pp_connections_log_handle__pasExprOnceResult;
  pp_connections_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_locations_log_handle()
{
  if (pp_locations_log_handle__pasOnceToken9 != -1)
    dispatch_once(&pp_locations_log_handle__pasOnceToken9, &__block_literal_global_16);
  return (id)pp_locations_log_handle__pasExprOnceResult;
}

void __pp_locations_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Locations");
  v2 = (void *)pp_locations_log_handle__pasExprOnceResult;
  pp_locations_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_reranker_log_handle()
{
  if (pp_reranker_log_handle__pasOnceToken10 != -1)
    dispatch_once(&pp_reranker_log_handle__pasOnceToken10, &__block_literal_global_18);
  return (id)pp_reranker_log_handle__pasExprOnceResult;
}

void __pp_reranker_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Reranker");
  v2 = (void *)pp_reranker_log_handle__pasExprOnceResult;
  pp_reranker_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __pp_private_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Private-Data");
  v2 = (void *)pp_private_log_handle__pasExprOnceResult;
  pp_private_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __pp_xpc_server_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "XPCServer");
  v2 = (void *)pp_xpc_server_log_handle__pasExprOnceResult;
  pp_xpc_server_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_asset_log_handle()
{
  if (pp_asset_log_handle__pasOnceToken14 != -1)
    dispatch_once(&pp_asset_log_handle__pasOnceToken14, &__block_literal_global_26);
  return (id)pp_asset_log_handle__pasExprOnceResult;
}

void __pp_asset_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "Asset");
  v2 = (void *)pp_asset_log_handle__pasExprOnceResult;
  pp_asset_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_score_interpreter_log_handle()
{
  if (pp_score_interpreter_log_handle__pasOnceToken15 != -1)
    dispatch_once(&pp_score_interpreter_log_handle__pasOnceToken15, &__block_literal_global_28);
  return (id)pp_score_interpreter_log_handle__pasExprOnceResult;
}

void __pp_score_interpreter_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "ScoreInterpreter");
  v2 = (void *)pp_score_interpreter_log_handle__pasExprOnceResult;
  pp_score_interpreter_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_temporal_clusters_log_handle()
{
  if (pp_temporal_clusters_log_handle__pasOnceToken17 != -1)
    dispatch_once(&pp_temporal_clusters_log_handle__pasOnceToken17, &__block_literal_global_32);
  return (id)pp_temporal_clusters_log_handle__pasExprOnceResult;
}

void __pp_temporal_clusters_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "TemporalClusters");
  v2 = (void *)pp_temporal_clusters_log_handle__pasExprOnceResult;
  pp_temporal_clusters_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_universal_search_log_handle()
{
  if (pp_universal_search_log_handle__pasOnceToken18 != -1)
    dispatch_once(&pp_universal_search_log_handle__pasOnceToken18, &__block_literal_global_34);
  return (id)pp_universal_search_log_handle__pasExprOnceResult;
}

void __pp_universal_search_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive.PersonalizationPortrait", "UniversalSearch");
  v2 = (void *)pp_universal_search_log_handle__pasExprOnceResult;
  pp_universal_search_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_default_signpost_handle()
{
  if (pp_default_signpost_handle__pasOnceToken19 != -1)
    dispatch_once(&pp_default_signpost_handle__pasOnceToken19, &__block_literal_global_36);
  return (id)pp_default_signpost_handle__pasExprOnceResult;
}

void __pp_default_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Default");
  v2 = (void *)pp_default_signpost_handle__pasExprOnceResult;
  pp_default_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_maintenance_signpost_handle()
{
  if (pp_maintenance_signpost_handle__pasOnceToken20 != -1)
    dispatch_once(&pp_maintenance_signpost_handle__pasOnceToken20, &__block_literal_global_37);
  return (id)pp_maintenance_signpost_handle__pasExprOnceResult;
}

void __pp_maintenance_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Maintenance");
  v2 = (void *)pp_maintenance_signpost_handle__pasExprOnceResult;
  pp_maintenance_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_quicktype_signpost_handle()
{
  if (pp_quicktype_signpost_handle__pasOnceToken21 != -1)
    dispatch_once(&pp_quicktype_signpost_handle__pasOnceToken21, &__block_literal_global_39);
  return (id)pp_quicktype_signpost_handle__pasExprOnceResult;
}

void __pp_quicktype_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "QuickType");
  v2 = (void *)pp_quicktype_signpost_handle__pasExprOnceResult;
  pp_quicktype_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_entities_signpost_handle()
{
  if (pp_entities_signpost_handle__pasOnceToken22 != -1)
    dispatch_once(&pp_entities_signpost_handle__pasOnceToken22, &__block_literal_global_40);
  return (id)pp_entities_signpost_handle__pasExprOnceResult;
}

void __pp_entities_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Entities");
  v2 = (void *)pp_entities_signpost_handle__pasExprOnceResult;
  pp_entities_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_topics_signpost_handle()
{
  if (pp_topics_signpost_handle__pasOnceToken23 != -1)
    dispatch_once(&pp_topics_signpost_handle__pasOnceToken23, &__block_literal_global_41);
  return (id)pp_topics_signpost_handle__pasExprOnceResult;
}

void __pp_topics_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Topics");
  v2 = (void *)pp_topics_signpost_handle__pasExprOnceResult;
  pp_topics_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_contacts_signpost_handle()
{
  if (pp_contacts_signpost_handle__pasOnceToken24 != -1)
    dispatch_once(&pp_contacts_signpost_handle__pasOnceToken24, &__block_literal_global_42);
  return (id)pp_contacts_signpost_handle__pasExprOnceResult;
}

void __pp_contacts_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Contacts");
  v2 = (void *)pp_contacts_signpost_handle__pasExprOnceResult;
  pp_contacts_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_events_signpost_handle()
{
  if (pp_events_signpost_handle__pasOnceToken25 != -1)
    dispatch_once(&pp_events_signpost_handle__pasOnceToken25, &__block_literal_global_43);
  return (id)pp_events_signpost_handle__pasExprOnceResult;
}

void __pp_events_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Events");
  v2 = (void *)pp_events_signpost_handle__pasExprOnceResult;
  pp_events_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_connections_signpost_handle()
{
  if (pp_connections_signpost_handle__pasOnceToken26 != -1)
    dispatch_once(&pp_connections_signpost_handle__pasOnceToken26, &__block_literal_global_44_6815);
  return (id)pp_connections_signpost_handle__pasExprOnceResult;
}

void __pp_connections_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Connections");
  v2 = (void *)pp_connections_signpost_handle__pasExprOnceResult;
  pp_connections_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_locations_signpost_handle()
{
  if (pp_locations_signpost_handle__pasOnceToken27 != -1)
    dispatch_once(&pp_locations_signpost_handle__pasOnceToken27, &__block_literal_global_45_6818);
  return (id)pp_locations_signpost_handle__pasExprOnceResult;
}

void __pp_locations_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Locations");
  v2 = (void *)pp_locations_signpost_handle__pasExprOnceResult;
  pp_locations_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_reranker_signpost_handle()
{
  if (pp_reranker_signpost_handle__pasOnceToken28 != -1)
    dispatch_once(&pp_reranker_signpost_handle__pasOnceToken28, &__block_literal_global_46);
  return (id)pp_reranker_signpost_handle__pasExprOnceResult;
}

void __pp_reranker_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "Reranker");
  v2 = (void *)pp_reranker_signpost_handle__pasExprOnceResult;
  pp_reranker_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __pp_social_highlights_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "SocialHighlights");
  v2 = (void *)pp_social_highlights_signpost_handle__pasExprOnceResult;
  pp_social_highlights_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id pp_temporal_clusters_signpost_handle()
{
  if (pp_temporal_clusters_signpost_handle__pasOnceToken30 != -1)
    dispatch_once(&pp_temporal_clusters_signpost_handle__pasOnceToken30, &__block_literal_global_48);
  return (id)pp_temporal_clusters_signpost_handle__pasExprOnceResult;
}

void __pp_temporal_clusters_signpost_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = os_log_create("com.apple.proactive", "TemporalClusters");
  v2 = (void *)pp_temporal_clusters_signpost_handle__pasExprOnceResult;
  pp_temporal_clusters_signpost_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void sub_18BE829F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18BE82C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6844(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6845(uint64_t a1)
{

}

__CFString *PPCollapseWhitespaceAndStrip(void *a1)
{
  __CFString *v1;
  unint64_t v2;
  unint64_t v3;
  size_t v4;
  char *v5;
  __CFString *v6;
  const __CFString *v7;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  CFIndex v19;
  UniChar v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  char v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  unint64_t v33;
  _OWORD buffer[8];
  __CFString *v35;
  const UniChar *v36;
  const char *v37;
  uint64_t v38;
  CFIndex v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  CFRange v43;

  v42 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = -[__CFString length](v1, "length");
    if (v2)
    {
      v3 = v2;
      if (v2 <= 0x1FF)
      {
        MEMORY[0x1E0C80A78]();
        v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v5, v4);
LABEL_7:
        v7 = v1;
        v1 = (__CFString *)v7;
        if (v7)
        {
          memset(buffer, 0, sizeof(buffer));
          Length = CFStringGetLength(v7);
          v35 = v1;
          v38 = 0;
          v39 = Length;
          CharactersPtr = CFStringGetCharactersPtr(v1);
          CStringPtr = 0;
          v36 = CharactersPtr;
          if (!CharactersPtr)
            CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
          v33 = v3;
          v40 = 0;
          v41 = 0;
          v37 = CStringPtr;
          if (Length >= 1)
          {
            v11 = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 64;
            v17 = 1;
            while (1)
            {
              if ((unint64_t)v13 >= 4)
                v18 = 4;
              else
                v18 = v13;
              v19 = v39;
              if (v39 <= v13)
              {
                v20 = 0;
              }
              else
              {
                if (v36)
                {
                  v20 = v36[v13 + v38];
                }
                else if (v37)
                {
                  v20 = v37[v38 + v13];
                }
                else
                {
                  if (v41 <= v13 || v12 > v13)
                  {
                    v22 = v18 + v11;
                    v23 = v16 - v18;
                    v24 = v13 - v18;
                    v25 = v24 + 64;
                    if (v24 + 64 >= v39)
                      v25 = v39;
                    v40 = v24;
                    v41 = v25;
                    if (v39 >= v23)
                      v19 = v23;
                    v43.length = v19 + v22;
                    v43.location = v24 + v38;
                    CFStringGetCharacters(v35, v43, (UniChar *)buffer);
                    v12 = v40;
                  }
                  v20 = *((_WORD *)buffer + v13 - v12);
                }
                if (v20 == 10 || v20 == 32)
                {
LABEL_49:
                  if ((v17 & 1) == 0)
                  {
                    *(_WORD *)&v5[2 * v15++] = 32;
                    v14 = v14 & 1 | (v20 != 32);
                  }
                  v17 = 1;
                  goto LABEL_53;
                }
              }
              if ((unsigned __int16)(v20 - 48) >= 0xAu && (unsigned __int16)((v20 & 0xFFDF) - 65) >= 0x1Au)
              {
                if (v20 > 0x9Fu)
                {
                  if (v20 == 160 || v20 == 5760)
                    goto LABEL_49;
                }
                else if (v20 == 9 || v20 == 32)
                {
                  goto LABEL_49;
                }
                if ((unsigned __int16)(v20 - 0x2000) < 0xCu)
                  goto LABEL_49;
                if (v20 > 0x2027u)
                {
                  if (v20 - 8232 <= 0x37
                    && ((1 << (v20 - 40)) & 0x80000000000083) != 0
                    || v20 == 12288)
                  {
                    goto LABEL_49;
                  }
                }
                else if (v20 - 10 < 4 || v20 == 133)
                {
                  goto LABEL_49;
                }
              }
              v17 = 0;
              *(_WORD *)&v5[2 * v15++] = v20;
LABEL_53:
              ++v13;
              --v11;
              ++v16;
              if (Length == v13)
                goto LABEL_57;
            }
          }
          v15 = 0;
          v14 = 0;
LABEL_57:
          v26 = v14;
          v3 = v33;
        }
        else
        {
          v15 = 0;
          v26 = 0;
        }

        v27 = v15 - 1;
        while (v27 != -1)
        {
          v28 = *(unsigned __int16 *)&v5[2 * v27--];
          if (v28 != 32)
          {
            v29 = v27 + 2;
            if ((v26 & 1) != 0)
              goto LABEL_65;
            goto LABEL_64;
          }
        }
        v29 = 0;
        if ((v26 & 1) != 0)
          goto LABEL_65;
LABEL_64:
        if (v29 >= -[__CFString length](v1, "length"))
          goto LABEL_66;
LABEL_65:
        v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v5, v29);

        v1 = (__CFString *)v30;
LABEL_66:
        if (v3 >= 0x200)
          free(v5);
        goto LABEL_68;
      }
      v5 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
      if (v5)
        goto LABEL_7;
    }
LABEL_68:
    v1 = v1;
    v6 = v1;
    goto LABEL_69;
  }
  v6 = 0;
LABEL_69:

  return v6;
}

BOOL PPStringIsWellFormed(void *a1)
{
  const __CFString *v1;
  __CFString *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v1 = a1;
  v2 = (__CFString *)v1;
  if (v1)
  {
    if (CFStringGetFastestEncoding(v1) == 1536)
    {
      v3 = 1;
    }
    else
    {
      -[__CFString dataUsingEncoding:allowLossyConversion:](v2, "dataUsingEncoding:allowLossyConversion:", 10, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v6 = objc_retainAutorelease(v4);
        v3 = u_strIsWellFormed((const UChar *)objc_msgSend(v6, "bytes"), (unint64_t)objc_msgSend(v6, "length") >> 1) != 0;
      }
      else
      {
        v3 = 0;
      }

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL PPStringAllWhiteSpace(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (v1)
  {
    if (PPStringAllWhiteSpace__pasOnceToken2 != -1)
      dispatch_once(&PPStringAllWhiteSpace__pasOnceToken2, &__block_literal_global_6875);
    v2 = objc_msgSend(v1, "rangeOfCharacterFromSet:", PPStringAllWhiteSpace__pasExprOnceResult) == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t PPStringLooksLikeNumber(void *a1)
{
  const __CFString *v1;
  __CFString *v2;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex v12;
  UniChar v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  uint64_t v19;
  _OWORD v21[8];
  CFStringRef theString;
  const UniChar *v23;
  const char *v24;
  uint64_t v25;
  CFIndex v26;
  uint64_t v27;
  uint64_t v28;
  CFRange v29;

  v1 = a1;
  v2 = (__CFString *)v1;
  if (!v1)
  {
LABEL_30:
    v19 = 0;
    goto LABEL_33;
  }
  memset(v21, 0, sizeof(v21));
  Length = CFStringGetLength(v1);
  theString = v2;
  v25 = 0;
  v26 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  CStringPtr = 0;
  v23 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  v27 = 0;
  v28 = 0;
  v24 = CStringPtr;
  if (Length >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 64;
    while (1)
    {
      v11 = (unint64_t)v8 >= 4 ? 4 : v8;
      v12 = v26;
      if (v26 <= v8)
        goto LABEL_30;
      if (v23)
      {
        v13 = v23[v8 + v25];
      }
      else if (v24)
      {
        v13 = v24[v25 + v8];
      }
      else
      {
        if (v28 <= v8 || v7 > v8)
        {
          v15 = v11 + v6;
          v16 = v10 - v11;
          v17 = v8 - v11;
          v18 = v17 + 64;
          if (v17 + 64 >= v26)
            v18 = v26;
          v27 = v17;
          v28 = v18;
          if (v26 >= v16)
            v12 = v16;
          v29.length = v12 + v15;
          v29.location = v17 + v25;
          CFStringGetCharacters(theString, v29, (UniChar *)v21);
          v7 = v27;
        }
        v13 = *((_WORD *)v21 + v8 - v7);
      }
      if (v13 > 0x39u)
        goto LABEL_30;
      if (((1 << v13) & 0x3FF000000000000) != 0)
      {
        v9 = 1;
      }
      else if (((1 << v13) & 0x7B0100000200) == 0)
      {
        goto LABEL_30;
      }
      ++v8;
      --v6;
      ++v10;
      if (Length == v8)
        goto LABEL_32;
    }
  }
  v9 = 0;
LABEL_32:
  v19 = v9 & 1;
LABEL_33:

  return v19;
}

id PPStringFirstNumber(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v7;
  int v8;
  int64_t v9;
  uint64_t v10;
  unsigned int v11;
  int64_t v12;
  int64_t v13;
  int v14;
  uint64_t v15;
  CFIndex v16;
  UniChar v17;
  uint64_t v19;
  CFIndex v20;
  int64_t v21;
  uint64_t v22;
  CFIndex v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CFStringRef theString;
  const UniChar *v45;
  const char *v46;
  uint64_t v47;
  CFIndex v48;
  int64_t v49;
  int64_t v50;
  CFRange v51;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_37;
  v3 = (__CFString *)v1;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  Length = CFStringGetLength(v3);
  theString = v3;
  v47 = 0;
  v48 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v45 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v49 = 0;
  v50 = 0;
  v46 = CStringPtr;
  if (Length <= 0)
  {
LABEL_36:

LABEL_37:
    v34 = 0;
    goto LABEL_38;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0xFFFFFFFFLL;
  v11 = -1;
  do
  {
    v12 = -v9;
    v13 = v9 + 64;
    v14 = v8;
    while (1)
    {
      if ((unint64_t)v9 >= 4)
        v15 = 4;
      else
        v15 = v9;
      v16 = v48;
      if (v48 <= v9)
      {
        ++v11;
        goto LABEL_27;
      }
      if (v45)
      {
        v17 = v45[v9 + v47];
      }
      else if (v46)
      {
        v17 = v46[v47 + v9];
      }
      else
      {
        if (v50 <= v9 || v7 > v9)
        {
          v19 = v15 + v12;
          v20 = v13 - v15;
          v21 = v9 - v15;
          v22 = v10;
          v23 = v21 + 64;
          if (v21 + 64 >= v48)
            v23 = v48;
          v49 = v21;
          v50 = v23;
          if (v48 >= v20)
            v16 = v20;
          v51.length = v16 + v19;
          v51.location = v21 + v47;
          CFStringGetCharacters(theString, v51, (UniChar *)&v36);
          v10 = v22;
          v7 = v49;
        }
        v17 = *((_WORD *)&v36 + v9 - v7);
      }
      ++v11;
      if ((unsigned __int16)(v17 - 48) < 0xAu)
        break;
LABEL_27:
      if (v14)
      {
        -[__CFString substringWithRange:](v3, "substringWithRange:", (int)v10, v14, v36, v37, v38, v39, v40, v41, v42, v43);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }
      ++v9;
      --v12;
      ++v13;
      if (Length == v9)
        goto LABEL_36;
    }
    if ((int)v10 >= 0)
      v10 = v10;
    else
      v10 = v11;
    v8 = v14 + 1;
    ++v9;
  }
  while (v9 != Length);
  v24 = v10;

  if (v14 < 0)
    goto LABEL_37;
  v33 = (void *)MEMORY[0x18D7805AC](v25, v26, v27, v28, v29, v30, v31, v32, v36, *((_QWORD *)&v36 + 1), v37, *((_QWORD *)&v37 + 1), v38, *((_QWORD *)&v38 + 1), v39, *((_QWORD *)&v39 + 1));
  -[__CFString substringWithRange:](v3, "substringWithRange:", v24, (v14 + 1));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v33);
LABEL_38:

  return v34;
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

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C990D8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BC80](color);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1E0C9BC88](a1, *(_QWORD *)&intent, color, options);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9BDC0](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE60](plist);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _PASIterateLongChars()
{
  return MEMORY[0x1E0D816F0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

UBool u_strIsWellFormed(const UChar *s, int32_t length)
{
  return MEMORY[0x1E0DE5AA8](s, *(_QWORD *)&length);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

