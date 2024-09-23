void sub_100003430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000344C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000345C(uint64_t a1)
{

}

uint64_t sub_100003464(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  xpc_type_t type;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSNumber *v12;
  id v13;
  NSString *v14;
  NSNumber *v15;
  NSNumber *v16;
  const void *bytes_ptr;
  size_t length;
  NSNumber *v19;
  void *v20;
  NSDate *v21;
  void *v22;

  v5 = a3;
  type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_BOOL_get_value(v5));
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_22:
    v22 = v13;
    objc_msgSend(v11, "addObject:", v13);

    v10 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", xpc_string_get_string_ptr(v5), 4);
    v13 = (id)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    v13 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v5));
    v13 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    length = xpc_data_get_length(v5);
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", bytes_ptr, length));
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    v13 = (id)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithXPCDictionary:](NSDictionary, "dictionaryWithXPCDictionary:", v5));
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v20 = *(void **)(a1 + 32);
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = objc_msgSend(v20, "initWithXPCArray:", v5);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v21 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)xpc_date_get_value(v5));
    v13 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_22;
  }
  v7 = sub_100024A40();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1000282DC(a2, v8, v9);

  v10 = 0;
LABEL_23:

  return v10;
}

void sub_1000037E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000037FC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  xpc_object_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  xpc_object_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  id v31;
  NSObject *v32;
  double v33;

  v6 = a2;
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v9 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
LABEL_5:
    v12 = v9;
    xpc_array_append_value(v8, v9);

    goto LABEL_6;
  }
  v10 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v11 = objc_retainAutorelease(v6);
    v9 = xpc_data_create(objc_msgSend(v11, "bytes"), (size_t)objc_msgSend(v11, "length"));
    goto LABEL_5;
  }
  v13 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0)
  {
    v14 = objc_retainAutorelease(v6);
    if (!strcmp((const char *)objc_msgSend(v14, "objCType"), "i")
      || (v15 = objc_retainAutorelease(v14), !strcmp((const char *)objc_msgSend(v15, "objCType"), "s"))
      || (v16 = objc_retainAutorelease(v15), !strcmp((const char *)objc_msgSend(v16, "objCType"), "q"))
      || (v17 = objc_retainAutorelease(v16), !strcmp((const char *)objc_msgSend(v17, "objCType"), "q")))
    {
      v25 = *(void **)(a1 + 32);
      v26 = xpc_int64_create((int64_t)objc_msgSend(v14, "longLongValue"));
    }
    else
    {
      v18 = objc_retainAutorelease(v17);
      if (!strcmp((const char *)objc_msgSend(v18, "objCType"), "f")
        || (v19 = objc_retainAutorelease(v18), !strcmp((const char *)objc_msgSend(v19, "objCType"), "d")))
      {
        v25 = *(void **)(a1 + 32);
        objc_msgSend(v18, "doubleValue");
        v26 = xpc_double_create(v33);
      }
      else
      {
        v20 = objc_retainAutorelease(v19);
        if (strcmp((const char *)objc_msgSend(v20, "objCType"), "B"))
        {
          v21 = objc_retainAutorelease(v20);
          if (strcmp((const char *)objc_msgSend(v21, "objCType"), "c"))
          {
            v22 = sub_100024A40();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              sub_100028348(v21, v23);

            *a4 = 1;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_23;
          }
        }
        v25 = *(void **)(a1 + 32);
        v26 = xpc_BOOL_create((BOOL)objc_msgSend(v20, "BOOLValue"));
      }
    }
    v27 = v26;
    xpc_array_append_value(v25, v26);

LABEL_23:
    goto LABEL_6;
  }
  v24 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v9 = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcArrayFromArray"));
    goto LABEL_5;
  }
  v28 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v28) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    v9 = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "createXPCDictionary"));
    goto LABEL_5;
  }
  v29 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v6, v29) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "timeIntervalSince1970");
    v9 = xpc_date_create((uint64_t)v30);
    goto LABEL_5;
  }
  v31 = sub_100024A40();
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    sub_1000283CC(v32);

  *a4 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_6:

}

void sub_100003B50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100004044(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

char *sub_10000407C(int *a1)
{
  return strerror(*a1);
}

void sub_100006A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_100006AA4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006AB4(uint64_t a1)
{

}

void sub_100006ABC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingPathComponent:", a2));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isEqualToString:", CFSTR("/")) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nonContainerizedContentRoots"));
    v10 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    if (v10)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void sub_1000079AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000079BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000079CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1000079F4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

CFStringRef sub_100007D9C(unsigned __int8 *a1)
{
  char __str[100];

  snprintf(__str, 0x64uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15],
    a1[16],
    a1[17],
    a1[18],
    a1[19]);
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
}

unsigned __int8 *sub_100007E98(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t i;

  v4 = sub_100007EF8(a2);
  v5 = v4;
  if (v4)
  {
    v4 = sub_100007EF8(a3);
    if (v4)
    {
      for (i = 0; i != 20; ++i)
        v5[i] ^= v4[i];
    }
  }
  free(v4);
  return v5;
}

unsigned __int8 *sub_100007EF8(const __CFString *a1)
{
  CFTypeID v2;
  unsigned __int8 *v3;
  CC_SHA1_CTX *p_c;
  CC_LONG Length;
  size_t v6;
  char *v7;
  const UInt8 *BytePtr;
  id v9;
  NSObject *v10;
  CFIndex v12;
  const void *ValueAtIndex;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  uint64_t i;
  uint8_t v17[16];
  CC_SHA1_CTX c;

  if (!a1)
    return 0;
  v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
  {
    v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x6A69C61BuLL);
    LOBYTE(c.h0) = CFBooleanGetValue((CFBooleanRef)a1);
    p_c = &c;
    Length = 1;
LABEL_10:
    CC_SHA1(p_c, Length, v3);
    return v3;
  }
  if (v2 != CFStringGetTypeID())
  {
    if (v2 == CFDateGetTypeID())
    {
      v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xEAF147E6uLL);
      *(_QWORD *)&c.h0 = CFDateGetAbsoluteTime((CFDateRef)a1);
      p_c = &c;
      Length = 8;
      goto LABEL_10;
    }
    if (v2 == CFDataGetTypeID())
    {
      v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x1991A161uLL);
      BytePtr = CFDataGetBytePtr((CFDataRef)a1);
      Length = CFDataGetLength((CFDataRef)a1);
      p_c = (CC_SHA1_CTX *)BytePtr;
      goto LABEL_10;
    }
    if (v2 == CFArrayGetTypeID())
    {
      if (CFArrayGetCount((CFArrayRef)a1))
      {
        memset(&c, 0, sizeof(c));
        if (!sub_10000877C((const __CFArray *)a1))
        {
          v3 = (unsigned __int8 *)sub_100007EF8(CFSTR("array"));
          CC_SHA1_Init(&c);
          if (CFArrayGetCount((CFArrayRef)a1) >= 1)
          {
            v12 = 0;
            do
            {
              ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v12);
              v14 = (unsigned __int8 *)sub_100007EF8(ValueAtIndex);
              if (!v14)
                break;
              v15 = v14;
              CC_SHA1_Update(&c, v14, 0x14u);
              CC_SHA1_Final(v15, &c);
              if (v3)
              {
                for (i = 0; i != 20; ++i)
                  v3[i] ^= v15[i];
              }
              free(v15);
              ++v12;
            }
            while (CFArrayGetCount((CFArrayRef)a1) > v12);
          }
          return v3;
        }
        v9 = sub_100024A40();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failing to hash due to duplicate array entries", v17, 2u);
        }

      }
    }
    else
    {
      if (v2 == CFDictionaryGetTypeID())
        return (unsigned __int8 *)sub_10000853C((const __CFDictionary *)a1);
      if (v2 == CFNumberGetTypeID())
        return sub_1000086B8((const __CFNumber *)a1);
    }
    return 0;
  }
  v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x877E83E2uLL);
  v6 = CFStringGetLength(a1) + 1;
  v7 = (char *)malloc_type_calloc(1uLL, v6, 0x9DED1793uLL);
  CFStringGetCString(a1, v7, v6, 0x8000100u);
  CC_SHA1(v7, v6, v3);
  free(v7);
  return v3;
}

CFDataRef sub_1000081E0(const __CFAllocator *a1, const __CFString *a2, CFStringRef theString1, uint64_t a4, void (*a5)(uint64_t, float, float), uint64_t a6)
{
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFDataRef v20;
  const __CFURL *v21;
  const __CFURL *v22;
  __CFReadStream *v23;
  __CFReadStream *v24;
  UInt8 *v25;
  UInt8 *v26;
  CFIndex v27;
  CFIndex v28;
  uint64_t v29;
  __n128 v30;
  int v31;
  CFDataRef v32;
  CFStringRef v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  id v57;
  timeval v59;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];

  memset(&c, 0, sizeof(c));
  if (CFStringCompare(theString1, CFSTR("SHA-1"), 0) == kCFCompareEqualTo)
  {
    v21 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
    if (!v21)
    {
      v34 = sub_100024A40();
      v12 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100029628((uint64_t)a2, v12);
      goto LABEL_4;
    }
    v22 = v21;
    v23 = CFReadStreamCreateWithFile(a1, v21);
    if (!v23)
    {
      v35 = sub_100024A40();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_100029698();

      v20 = 0;
      goto LABEL_40;
    }
    v24 = v23;
    if (CFReadStreamOpen(v23))
    {
      if (a5)
        a5(a6, 0.0, -1.0);
      CC_SHA1_Init(&c);
      v25 = (UInt8 *)malloc_type_calloc(1uLL, 0x10000uLL, 0x49093F70uLL);
      if (v25)
      {
        v26 = v25;
        v59.tv_sec = 0;
        *(_QWORD *)&v59.tv_usec = 0;
        gettimeofday(&v59, 0);
        v27 = CFReadStreamRead(v24, v26, 0x10000);
        if (v27 < 1)
        {
LABEL_18:
          CC_SHA1_Final(md, &c);
          v32 = CFDataCreate(a1, md, 20);
          if (v32)
          {
            v20 = v32;
            v33 = sub_100007D9C(md);
            if (v33)
              CFRelease(v33);
            if (a5)
              a5(a6, 1.0, -1.0);
            goto LABEL_38;
          }
          v47 = sub_100024A40();
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            sub_100029788(v48, v49, v50, v51, v52, v53, v54, v55);
        }
        else
        {
          v28 = v27;
          v29 = 0;
          while (1)
          {
            CC_SHA1_Update(&c, v26, v28);
            v29 += v28;
            v30.n128_u32[0] = -1.0;
            if (a4)
              v30.n128_f32[0] = (float)v29 / (float)a4;
            if (a5)
            {
              v31 = ((uint64_t (*)(uint64_t, __n128, float))a5)(a6, v30, -1.0);
              if (v31)
                break;
            }
            v28 = CFReadStreamRead(v24, v26, 0x10000);
            if (v28 <= 0)
              goto LABEL_18;
          }
          v56 = v31;
          v57 = sub_100024A40();
          v48 = objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            sub_1000297B8(v56, v48);
        }

        v20 = 0;
LABEL_38:
        free(v26);
        goto LABEL_39;
      }
      v39 = sub_100024A40();
      v38 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_100029758(v38, v40, v41, v42, v43, v44, v45, v46);
    }
    else
    {
      v37 = sub_100024A40();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_1000296F8();
    }

    v20 = 0;
LABEL_39:
    CFReadStreamClose(v24);
    CFRelease(v24);
LABEL_40:
    CFRelease(v22);
    return v20;
  }
  v11 = sub_100024A40();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_100029828(v12, v13, v14, v15, v16, v17, v18, v19);
LABEL_4:

  return 0;
}

uint64_t sub_10000853C(const __CFDictionary *a1)
{
  uint64_t v2;
  int64_t Count;
  const void **v4;
  uint64_t i;
  void *v6;
  const void *Value;
  void *v8;
  unsigned __int8 *v9;
  uint64_t j;
  CC_SHA1_CTX v12;

  if (!CFDictionaryGetCount(a1))
    return 0;
  memset(&v12, 0, sizeof(v12));
  v2 = sub_100007EF8(CFSTR("dictionary"));
  Count = CFDictionaryGetCount(a1);
  v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(a1, v4, 0);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      v6 = (void *)sub_100007EF8(v4[i]);
      Value = CFDictionaryGetValue(a1, v4[i]);
      v8 = (void *)sub_100007EF8(Value);
      CC_SHA1_Init(&v12);
      v9 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x663AA81CuLL);
      if (v6)
      {
        CC_SHA1_Update(&v12, v6, 0x14u);
        free(v6);
      }
      if (v8)
      {
        CC_SHA1_Update(&v12, v8, 0x14u);
        free(v8);
      }
      CC_SHA1_Final(v9, &v12);
      if (v2 && v9)
      {
        for (j = 0; j != 20; ++j)
          *(_BYTE *)(v2 + j) ^= v9[j];
      }
      free(v9);
    }
  }
  free(v4);
  return v2;
}

unsigned __int8 *sub_1000086B8(const __CFNumber *a1)
{
  unsigned __int8 *v2;
  size_t v3;
  CFNumberType v4;
  void *v5;
  uint64_t valuePtr;

  v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xFF7F1A96uLL);
  valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  if ((unint64_t)(valuePtr + 1) >= 0xE)
    v3 = 8;
  else
    v3 = 4;
  if ((unint64_t)(valuePtr + 1) < 0xE)
    v4 = kCFNumberSInt32Type;
  else
    v4 = kCFNumberSInt64Type;
  v5 = malloc_type_calloc(1uLL, v3, 0xD98972E9uLL);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

uint64_t sub_10000877C(const __CFArray *a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  CFRange v7;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
    return 0;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
    v7.location = 0;
    v7.length = v3;
    if (CFArrayGetCountOfValue(a1, v7, ValueAtIndex) >= 2)
      break;
    if (v3 == ++v4)
      return 0;
  }
  return 1;
}

void sub_1000087F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100008804(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

BOOL sub_100009F68(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100029B34(v3, v5);

  return 1;
}

void sub_10000AA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000AA34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000AA44(uint64_t a1)
{

}

void sub_10000AA4C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unsigned __int8 v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;

  v6 = a1 + 40;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingPathComponent:", a2));
  v8 = *(_QWORD *)(*(_QWORD *)v6 + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = sub_100024A40();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v33 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
    v34 = 2112;
    v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - intermediatePath:  %@", buf, 0x16u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"), "stringByAppendingPathComponent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
    v14 = *(void **)(a1 + 32);
    v31 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attributesOfItemAtPath:error:", v13, &v31));
    v16 = v31;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fileType"));
      v18 = objc_msgSend(v17, "isEqualToString:", NSFileTypeDirectory);

      if (v18)
      {
        v19 = sub_100024A40();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 40);
          *(_DWORD *)buf = 136315394;
          v33 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
          v34 = 2112;
          v35 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s - Creating directory:  %@", buf, 0x16u);
        }

        v22 = *(void **)(a1 + 32);
        v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v30 = v16;
        v24 = objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v23, 0, v15, &v30);
        v25 = v30;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v24;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          goto LABEL_17;
        v26 = sub_100024A40();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_100029ED4(v6, v25);
        v16 = v25;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        v29 = sub_100024A40();
        v27 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_100029F80(v6, v27);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v28 = sub_100024A40();
      v27 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100029E4C();
    }

    v25 = v16;
LABEL_17:
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;

  }
}

void sub_10000AE3C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10000AE7C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10000AE90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

uint64_t sub_10000AEF4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10000AF40(id a1)
{
  MSDPlatform *v1;
  void *v2;

  v1 = objc_alloc_init(MSDPlatform);
  v2 = (void *)qword_100053D88;
  qword_100053D88 = (uint64_t)v1;

}

void sub_10000AFA8(id a1)
{
  byte_100053D98 = NSClassFromString(CFSTR("MSDHubBundleManager")) != 0;
}

int *sub_10000D9C0()
{
  return __error();
}

void sub_10000F660(id a1)
{
  MSDDemoManifestCheck *v1;
  void *v2;

  v1 = objc_alloc_init(MSDDemoManifestCheck);
  v2 = (void *)qword_100053DB0;
  qword_100053DB0 = (uint64_t)v1;

}

void sub_100011310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001133C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001134C(uint64_t a1)
{

}

void sub_100011354(uint64_t a1, const __CFData *a2, uint64_t a3, _BYTE *a4)
{
  SecCertificateRef v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  SecCertificateRef v18;

  v6 = SecCertificateCreateWithData(kCFAllocatorDefault, a2);
  if (v6)
  {
    v18 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

  }
  else
  {
    v7 = sub_100024A40();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002B8FC(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

    *a4 = 1;
  }
}

void sub_100011B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011BC4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v10 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100011CBC;
    v11[3] = &unk_100048D38;
    v11[4] = *(_QWORD *)(a1 + 40);
    v8 = v10;
    v9 = *(_QWORD *)(a1 + 72);
    v12 = v8;
    v16 = v9;
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    v17 = a4;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

void sub_100011CBC(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char *v11;
  id v12;
  NSObject *v13;
  char *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  unsigned __int8 v21;
  id v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  uint64_t v35;

  v7 = a2;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "checkType"));
  if (v9)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "checkType"));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("RigorousCheckType")));
  v11 = (char *)v10;

  v12 = sub_100024A40();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v29 = v7;
    v30 = 2114;
    v31 = v14;
    v32 = 2114;
    v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Name: %{public}@, Section Name: %{public}@, Check Type: %{public}@", buf, 0x20u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getComponentData:", v8));
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Skip")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Default")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "runSecurityChecksForSection:dataType:componentName:options:", v15, *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("AppleISTCertCheck")))
    {
      v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 40), v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allowedISTSignedComponents"));
      v18 = objc_msgSend(v17, "containsObject:", v16);

      if (v18)
      {
        if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 56))
          && objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(a1 + 64)))
        {
          v19 = sub_100024A40();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = (const char *)v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "About to run app layout checks for %{public}@", buf, 0xCu);
          }

          v21 = objc_msgSend(*(id *)(a1 + 32), "runAppLayoutSecurityCheck:", v15);
        }
        else
        {
          v21 = objc_msgSend(*(id *)(a1 + 32), "runSecurityChecksForSection:dataType:componentName:options:", v15, *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 48));
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v21;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v24 = sub_100024A40();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_10002BD1C();

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      v22 = sub_100024A40();
      v16 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v29 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
        v30 = 2114;
        v31 = v11;
        v32 = 2114;
        v33 = v7;
        v34 = 2114;
        v35 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Unknown rigorous check type (%{public}@) for %{public}@ (from %{public}@).", buf, 0x2Au);
      }
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v26 = sub_100024A40();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_10002BC84((uint64_t)v7, a1, v27);

    *a4 = 1;
    **(_BYTE **)(a1 + 80) = 1;
  }

}

void sub_10001372C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v3 = a2;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notification received for entitlement check for: %{public}@ %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  objc_msgSend(*(id *)(a1 + 32), "setItemBeingInstalled:", v8);

}

_BYTE *sub_1000153E4(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_100016970(id a1)
{
  MSDHVolumeManager *v1;
  void *v2;

  v1 = objc_alloc_init(MSDHVolumeManager);
  v2 = (void *)qword_100053DC0;
  qword_100053DC0 = (uint64_t)v1;

}

void sub_10001720C(id a1)
{
  void *v1;
  char *v2;
  uint64_t v3;
  id v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_object_t v7;
  io_object_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  CFTypeRef v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  io_iterator_t iterator;
  uint8_t buf[4];
  uint64_t v27;
  statfs v28;

  iterator = 0;
  bzero(&v28, 0x878uLL);
  if (statfs("/", &v28))
  {
    v17 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10002CC14(v18);

    v4 = 0;
    v1 = 0;
    goto LABEL_34;
  }
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v28.f_mntfromname));
  v2 = (char *)objc_msgSend(v1, "rangeOfString:", CFSTR("/dev/"));
  if (v2 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002CB2C();

    v4 = 0;
    goto LABEL_34;
  }
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "substringFromIndex:", &v2[v3])));
  v5 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)objc_msgSend(v4, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService)
  {
    v21 = sub_100024A40();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10002CB58();

    goto LABEL_34;
  }
  v7 = MatchingService;
  if (IORegistryEntryCreateIterator(MatchingService, "IOService", 3u, &iterator))
  {
    v23 = sub_100024A40();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_10002CBB0();

    IOObjectRelease(v7);
LABEL_34:
    v11 = 0;
    goto LABEL_15;
  }
  v8 = IOIteratorNext(iterator);
  if (v8)
  {
    while (!IOObjectConformsTo(v8, "AppleAPFSContainer"))
    {
      IOObjectRelease(v8);
      v8 = IOIteratorNext(iterator);
      if (!v8)
        goto LABEL_8;
    }
    v12 = IORegistryEntrySearchCFProperty(v8, "IOService", CFSTR("BSD Name"), 0, 3u);
    if (v12)
    {
      v11 = (void *)v12;
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/dev/"), "stringByAppendingString:", v12));
      v14 = (void *)qword_100053DD0;
      qword_100053DD0 = v13;

      IOObjectRelease(v7);
LABEL_14:
      IOObjectRelease(v8);
      goto LABEL_15;
    }
  }
LABEL_8:
  v9 = sub_100024A40();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10002CB84();

  IOObjectRelease(v7);
  v11 = 0;
  if (v8)
    goto LABEL_14;
LABEL_15:
  if (iterator)
    IOObjectRelease(iterator);
  if (!qword_100053DD0)
  {
    qword_100053DD0 = (uint64_t)CFSTR("/dev/disk0s1");

  }
  v15 = sub_100024A40();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = qword_100053DD0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Current APFS boot container: %{public}@", buf, 0xCu);
  }

}

void sub_1000184CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_1000184F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_100018504(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100018564(id a1)
{
  MSDTestPreferences *v1;
  void *v2;

  v1 = objc_alloc_init(MSDTestPreferences);
  v2 = (void *)qword_100053DE0;
  qword_100053DE0 = (uint64_t)v1;

}

uint64_t sub_100019A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setMetadata:forFile:", a2, a3);
  return 1;
}

BOOL sub_10001A3A0(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  NSURL *v15;
  __int16 v16;
  NSError *v17;

  v4 = a2;
  v5 = a3;
  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v4, "path"));
    v10 = 136315906;
    v11 = "-[MSDManifest enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:]_block_invoke";
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Could not enumerate %{public}@, url=%{public}@, error=%{public}@", (uint8_t *)&v10, 0x2Au);

  }
  return 1;
}

void sub_10001A908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A924(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001A934(uint64_t a1)
{

}

uint64_t sub_10001A93C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  xpc_type_t type;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSNumber *v13;
  id v14;
  NSString *v15;
  NSNumber *v16;
  NSNumber *v17;
  void *v18;
  const void *bytes_ptr;
  size_t length;
  NSNumber *v21;
  NSDate *v22;
  void *v23;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 4));
  type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_BOOL_get_value(v5));
    v14 = (id)objc_claimAutoreleasedReturnValue(v13);
LABEL_22:
    v23 = v14;
    objc_msgSend(v12, "setObject:forKey:", v14, v6);

    v11 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", xpc_string_get_string_ptr(v5), 4);
    v14 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    v14 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v5));
    v14 = (id)objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v18 = *(void **)(a1 + 32);
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = objc_msgSend(v18, "initWithXPCDictionary:", v5);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    length = xpc_data_get_length(v5);
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", bytes_ptr, length));
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithXPCArray:](NSArray, "arrayWithXPCArray:", v5));
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    v14 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v22 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)xpc_date_get_value(v5));
    v14 = (id)objc_claimAutoreleasedReturnValue(v22);
    goto LABEL_22;
  }
  v8 = sub_100024A40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10002D5BC((uint64_t)v6, v9, v10);

  v11 = 0;
LABEL_23:

  return v11;
}

id sub_10001B4B4()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

id sub_10001B4C0()
{
  if (qword_100053DF8 != -1)
    dispatch_once(&qword_100053DF8, &stru_100048EA0);
  return (id)qword_100053DF0;
}

void sub_10001B500(id a1)
{
  void *v1;
  unsigned int v2;
  NSArray *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v2 = objc_msgSend(v1, "watchOS");

  if (v2)
  {
    v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/var/mobile/Demo.mov"), CFSTR("/var/mobile/Demo.plist"), CFSTR("/var/mobile/Media"), CFSTR("/var/mobile/Library/AddressBook"), CFSTR("/var/mobile/Library/Alarms"), CFSTR("/var/mobile/Library/Calendar"), CFSTR("/var/mobile/Library/CallHistoryDB"), CFSTR("/var/mobile/Library/Carousel"), CFSTR("/var/mobile/Library/Health"), CFSTR("/var/mobile/Library/Maps"), CFSTR("/var/mobile/Library/MapsHistory.plist"), CFSTR("/var/mobile/Library/NanoMailKit"), CFSTR("/var/mobile/Library/NanoMusicSync"), CFSTR("/var/mobile/Library/NanoPasses"), CFSTR("/var/mobile/Library/NanoPodcasts"), CFSTR("/var/mobile/Library/NanoPhotos"), CFSTR("/var/mobile/Library/NanoWeatherDemo"),
           CFSTR("/var/mobile/Library/News"),
           CFSTR("/var/mobile/Library/RetailDemo"),
           CFSTR("/var/mobile/Library/Reminders"),
           CFSTR("/var/mobile/Library/SMS"),
           CFSTR("/var/mobile/Library/UserConfigurationProfiles"),
           CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences.plist"),
           CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences_m.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.Accessibility.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.ActivitySharing.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.AppleMediaServices.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.assistant.backedup.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.assistant.nano.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.assistant.support.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.backboardd.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.Carousel.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.coremedia.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.ControlCenter.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.DeepBreathing.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.demo-settings.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.findmy.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.healthd.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.ids.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.locationd.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.mobileme.fmf1.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.mobilephone.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.mobiletimer.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.nanobuddy.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.nanolifestyle.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.nanolifestyle.privacy.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.NanoMediaUI.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.NanoMusicSync.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.nanopassbook.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.nanophotos.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.nanonews.sync.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.Noise.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.podcasts.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.SessionTrackerApp.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.stockholm.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.system.prefs.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.timed.plist"),
           CFSTR("/var/mobile/Library/Preferences/com.apple.voicememod.plist"),
           CFSTR("/var/mobile/Library/Preferences/group.com.apple.stocks.plist"),
           CFSTR("/var/mobile/Library/Preferences/Avalon"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v5 = objc_msgSend(v4, "tvOS");

    if (!v5)
      return;
    v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/var/mobile/Media/DCIM"), CFSTR("/var/mobile/Media/PhotoData"), CFSTR("/var/mobile/Library/Preferences/com.apple.demo-settings.plist"), CFSTR("/var/MobileDevice/ProvisioningProfiles"), CFSTR("/var/mobile/Library/com.apple.HeadBoard/HBDemoModeAppOrder"), CFSTR("/var/mobile/Library/com.apple.HeadBoard/AppOrder.plist"), CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences.plist"), CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences_m.plist"), CFSTR("/var/mobile/Library/DemoLoop"), 0, v8, v9, v10, v11, v12, v13, v14,
           v15,
           v16,
           v17,
           v18,
           v19,
           v20,
           v21,
           v22,
           v23,
           v24,
           v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31,
           v32,
           v33,
           v34,
           v35,
           v36,
           v37,
           v38,
           v39,
           v40,
           v41,
           v42,
           v43,
           v44,
           v45,
           v46,
           v47,
           v48,
           v49,
           v50,
           v51,
           v52,
           v53,
           v54,
           v55,
           v56,
           v57,
           v58);
  }
  v6 = objc_claimAutoreleasedReturnValue(v3);
  v7 = (void *)qword_100053DF0;
  qword_100053DF0 = v6;

}

id sub_10001B92C()
{
  if (qword_100053E08 != -1)
    dispatch_once(&qword_100053E08, &stru_100048EC0);
  return (id)qword_100053E00;
}

void sub_10001B96C(id a1)
{
  void *v1;
  unsigned int v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v2 = objc_msgSend(v1, "watchOS");

  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.WatchListKit.NSURLCache"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-shm"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-wal"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-wal"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-shm"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/fsCachedData"), 0));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v5 = objc_msgSend(v4, "tvOS");

    if (!v5)
      return;
    v3 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }
  v6 = (void *)qword_100053E00;
  qword_100053E00 = v3;

}

id sub_10001BA6C()
{
  if (qword_100053E18 != -1)
    dispatch_once(&qword_100053E18, &stru_100048EE0);
  return (id)qword_100053E10;
}

void sub_10001BAAC(id a1)
{
  void *v1;
  unsigned int v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v2 = objc_msgSend(v1, "watchOS");

  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("systemgroup.com.apple.configurationprofiles"), 0));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v5 = objc_msgSend(v4, "tvOS");

    if (!v5)
      return;
    v3 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }
  v6 = (void *)qword_100053E10;
  qword_100053E10 = v3;

}

id sub_10001BB68()
{
  if (qword_100053E28 != -1)
    dispatch_once(&qword_100053E28, &stru_100048F00);
  return (id)qword_100053E20;
}

void sub_10001BBA8(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/.com.apple.mobile_container_manager.metadata.plist"), CFSTR("/Library/Caches"), CFSTR("/Library/SyncedPreferences"), CFSTR("/Library/Saved Application State"), CFSTR("/SystemData/com.apple.AuthenticationServices"), 0));
  v2 = (void *)qword_100053E20;
  qword_100053E20 = v1;

}

id sub_10001BC10()
{
  if (qword_100053E38 != -1)
    dispatch_once(&qword_100053E38, &stru_100048F20);
  return (id)qword_100053E30;
}

void sub_10001BC50(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/.com.apple.mobile_container_manager.metadata.plist"), CFSTR("/Library/Caches"), CFSTR("/Library/SyncedPreferences"), CFSTR("/Library/Saved Application State"), CFSTR("/SystemData/com.apple.AuthenticationServices"), 0));
  v2 = (void *)qword_100053E30;
  qword_100053E30 = v1;

}

id sub_10001BCB8()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("ContentRootDomain");
  v0 = sub_10001B4C0();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v6[1] = CFSTR("SystemContainerDomain");
  v7[0] = v1;
  v2 = sub_10001BA6C();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

void sub_10001C0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001C0FC(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2));
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "metadataForFile:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "pathsToSkip"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if (v11)
    {
      v12 = sub_100024A40();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315394;
        v17 = "-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]_block_invoke";
        v18 = 2114;
        v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Skip file attributes restore for %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      if ((objc_msgSend(v7, "restoreAttribuesToPath:", v8) & 1) != 0)
        goto LABEL_9;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v15 = sub_100024A40();
      v13 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10002D9E0();
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v14 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Got non-string value from array.", (uint8_t *)&v16, 2u);
    }
    v7 = 0;
    v8 = 0;
  }

LABEL_9:
  objc_autoreleasePoolPop(v4);
}

void sub_10001CA0C(id a1)
{
  MSDHOperations *v1;
  void *v2;

  v1 = objc_alloc_init(MSDHOperations);
  v2 = (void *)qword_100053E40;
  qword_100053E40 = (uint64_t)v1;

}

void sub_10002010C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020140(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100020150(uint64_t a1)
{

}

void sub_100020158(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)OSLogEventStream), "initWithSource:", v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setFilterPredicate:", v7);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000202C0;
  v10[3] = &unk_100048F90;
  v12 = *(_QWORD *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setInvalidationHandler:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000203BC;
  v9[3] = &unk_100048FB8;
  v9[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setEventHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -172800.0));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "activateStreamFromDate:", v8);

}

intptr_t sub_1000202C0(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;

  if (a2 == 5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v6 = CFSTR("successful");
    else
      v6 = CFSTR("failed");
    v8 = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Log file creation %{public}@, OSLogEventStreamInvalidation: %lu", (uint8_t *)&v8, 0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000203BC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v12 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  objc_msgSend(v12, "setTimeZone:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromDate:", v5));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "seekToEndOfFile");
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "process"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composedMessage"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@: %@\n"), v6, v8, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:", 4));
  objc_msgSend(v7, "writeData:", v11);

}

void sub_100020EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_1000213AC(uint64_t a1)
{
  void *v2;
  char *v3;
  void *result;
  char *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_100053E58)
  {
    v6 = off_100049028;
    v7 = 0;
    qword_100053E58 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    v2 = (void *)qword_100053E58;
    if (qword_100053E58)
    {
      if (!v5)
        goto LABEL_5;
    }
    else
    {
      v3 = (char *)abort_report_np("%s", v5);
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_100053E58;
LABEL_5:
  result = dlsym(v2, "SFTerminateProcessNamed");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_100053E50 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10002149C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1000214C8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000214D4()
{
  return SCError();
}

uint64_t sub_1000214DC()
{
  xpc_connection_t mach_service;
  void *v1;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (!qword_100053E60)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemodhelper", 0, 1uLL);
    v1 = (void *)qword_100053E60;
    qword_100053E60 = (uint64_t)mach_service;

    if (!qword_100053E60)
    {
      v3 = sub_100024A40();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not create XPC listener.", v5, 2u);
      }

      exit(1);
    }
    xpc_connection_set_event_handler((xpc_connection_t)qword_100053E60, &stru_100049060);
    xpc_connection_resume((xpc_connection_t)qword_100053E60);
  }
  return 0;
}

void sub_100021594(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  OS_xpc_object *v4;
  id v5;
  NSObject *v6;
  OS_xpc_object *v7;
  id v8;
  NSObject *v9;
  _xpc_connection_s *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  _BOOL4 v15;
  __int128 v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  OS_xpc_object *v19;

  v2 = a2;
  v3 = (id)qword_100053E60;
  v4 = v2;
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_connection)
  {
    if (v4 == (OS_xpc_object *)&_xpc_error_termination_imminent)
    {
      v11 = sub_100024A40();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      LOWORD(v16) = 0;
      v13 = "XPC connection will be closed";
    }
    else
    {
      v14 = sub_100024A40();
      v12 = objc_claimAutoreleasedReturnValue(v14);
      v15 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v4 != (OS_xpc_object *)&_xpc_error_connection_invalid)
      {
        if (v15)
        {
          LODWORD(v16) = 136446210;
          *(_QWORD *)((char *)&v16 + 4) = xpc_dictionary_get_string(v4, _xpc_error_key_description);
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Got XPC error on listener connection: %{public}s", (uint8_t *)&v16, 0xCu);
        }

        xpc_connection_cancel((xpc_connection_t)qword_100053E60);
        exit(1);
      }
      if (!v15)
      {
LABEL_14:

        exit(0);
      }
      LOWORD(v16) = 0;
      v13 = "No XPC connection, exiting";
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 2u);
    goto LABEL_14;
  }
  v5 = sub_100024A40();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10002F5D0();

  v7 = v4;
  v8 = sub_100024A40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Start to deal with new connection", (uint8_t *)&v16, 2u);
  }

  *(_QWORD *)&v16 = _NSConcreteStackBlock;
  *((_QWORD *)&v16 + 1) = 3221225472;
  v17 = sub_1000218B4;
  v18 = &unk_100049088;
  v19 = v7;
  v10 = v7;
  xpc_connection_set_event_handler(v10, &v16);
  xpc_connection_resume(v10);

}

uint64_t start(uint64_t a1, uint64_t *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;

  v3 = sub_100024A40();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *a2;
    v8 = 136446210;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s started", (uint8_t *)&v8, 0xCu);
  }

  sub_1000214DC();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v6, "run");

  return 0;
}

void sub_1000218B4(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint8_t *v19;
  id v20;
  __int16 v21;
  uint8_t buf[2];

  v3 = a2;
  type = xpc_get_type(v3);
  v5 = sub_100024A40();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10002F6D4();

  v7 = sub_100024A40();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (v9)
      sub_10002F6A8();

    if (type != (xpc_type_t)&_xpc_type_dictionary)
      sub_10002F680();
    v10 = *(id *)(a1 + 32);
    v11 = v3;
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10002F654();

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHMessageResponder sharedInstance](MSDHMessageResponder, "sharedInstance"));
    objc_msgSend(v14, "handleXPCMessage:fromConnection:", v11, v10);

    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_10002F628();
    goto LABEL_11;
  }
  if (v9)
    sub_10002F5FC();

  if (v3 == &_xpc_error_connection_invalid)
  {
    v20 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = "XPC disconnected by client";
      v19 = buf;
      goto LABEL_21;
    }
  }
  else
  {
    if (v3 != &_xpc_error_termination_imminent)
      goto LABEL_12;
    v17 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 0;
      v18 = "XPC connection will be closed";
      v19 = (uint8_t *)&v21;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    }
  }
LABEL_11:

LABEL_12:
}

void sub_100021AAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100021AFC(id a1)
{
  MSDXCTestSpawnWrapper *v1;
  void *v2;

  v1 = objc_alloc_init(MSDXCTestSpawnWrapper);
  v2 = (void *)qword_100053E68;
  qword_100053E68 = (uint64_t)v1;

}

id sub_100024A40()
{
  if (qword_100053E80 != -1)
    dispatch_once(&qword_100053E80, &stru_1000490C8);
  return (id)qword_100053E78;
}

void sub_100024A80(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MobileStoreDemo", "Default");
  v2 = (void *)qword_100053E78;
  qword_100053E78 = (uint64_t)v1;

}

id sub_100024AB0()
{
  if (qword_100053E90 != -1)
    dispatch_once(&qword_100053E90, &stru_1000490E8);
  return (id)qword_100053E88;
}

void sub_100024AF0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  v2 = (void *)qword_100053E88;
  qword_100053E88 = (uint64_t)v1;

}

id sub_100024B20()
{
  if (qword_100053EA0 != -1)
    dispatch_once(&qword_100053EA0, &stru_100049108);
  return (id)qword_100053E98;
}

void sub_100024B60(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MobileStoreDemo", "Message");
  v2 = (void *)qword_100053E98;
  qword_100053E98 = (uint64_t)v1;

}

id sub_100024B90()
{
  if (qword_100053EB0 != -1)
    dispatch_once(&qword_100053EB0, &stru_100049128);
  return (id)qword_100053EA8;
}

void sub_100024BD0(id a1)
{
  os_log_t v1;
  id v2;
  void *v3;

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    v1 = (os_log_t)&_os_log_disabled;
    v2 = &_os_log_disabled;
  }
  v3 = (void *)qword_100053EA8;
  qword_100053EA8 = (uint64_t)v1;

}

void sub_100024C2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;

  v9 = a1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  objc_msgSend(v10, "logWithFormat:andArgs:", v9, &a9);

}

void sub_100024CC8(id a1)
{
  MSDLogModel *v1;
  void *v2;

  v1 = objc_alloc_init(MSDLogModel);
  v2 = (void *)qword_100053EB8;
  qword_100053EB8 = (uint64_t)v1;

}

void sub_100024E64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000251F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002520C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002521C(uint64_t a1)
{

}

void sub_100025224(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("/%@"), a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
  NSLog(CFSTR("Checking existing log file (full path) %@ against %@"), v14, v6);

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "attributesOfItemAtPath:error:", v14, 0));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate"));
  v11 = objc_msgSend(v10, "compare:", *(_QWORD *)(a1 + 40));

  if (v11 == (id)-1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "fileCreationDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    NSLog(CFSTR("Removing %@ whose creation date is %@."), v14, v13);

    objc_msgSend(*(id *)(a1 + 48), "removeItemAtPath:error:", v14, 0);
  }
  *a4 = 0;

}

void sub_1000254C0(id a1)
{
  MSDHMessageResponder *v1;
  void *v2;

  v1 = objc_alloc_init(MSDHMessageResponder);
  v2 = (void *)qword_100053EC8;
  qword_100053EC8 = (uint64_t)v1;

}

void sub_100025704(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("updateSignedManifest"), CFSTR("migratePreferencesFile:"), CFSTR("stageDeviceForUpdateProcess:"), CFSTR("clearStagedDeviceAfterUpdateProcess"), CFSTR("prepareWorkDirectory:"), CFSTR("removeWorkDirectory:"), CFSTR("createDeviceManifest:"), CFSTR("fileExistsAtPath:"), CFSTR("readPlistFile:outContent:"), CFSTR("touchFile:"), CFSTR("cloneFile:"), CFSTR("restoreBackupAttributes:"), CFSTR("restoreAppDataAttributes:"), CFSTR("deleteNvram:"), CFSTR("writeNvram:"), CFSTR("manageVolume:"),
           CFSTR("disableLaunchdServicesForWatch:"),
           CFSTR("moveStagingToFinal:"),
           CFSTR("switchToBackupFolder:"),
           CFSTR("reboot:"),
           CFSTR("quitHelper:"),
           CFSTR("collectDemoLogsToFolder:"),
           CFSTR("preserveBluetoothFileToShelter:"),
           CFSTR("restartBluetooth:"),
           CFSTR("setComputerNameAndHostname:"),
           CFSTR("executeTestScriptOfIdentifier:"),
           CFSTR("preserveSecondPartyAppDataToShelter:outErrorDict:"),
           CFSTR("setPreferences:"),
           0));
  v2 = (void *)qword_100053ED8;
  qword_100053ED8 = v1;

}

id sub_10002590C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleXPCMessage:fromConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_1000274A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100028260(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSArray: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_1000282DC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100003B50((void *)&_mh_execute_header, a2, a3, "The value at index %lu in this xpcArray are of an unsupported type", (uint8_t *)&v3);
}

void sub_100028348(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  id v5;

  v4 = 136315138;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "objCType");
  sub_100003B50((void *)&_mh_execute_header, a2, v3, "Unsupported NSNumber type: %s for xpc dictionary encoding", (uint8_t *)&v4);
}

void sub_1000283CC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The values in this NSArray are of an unsupported type", v1, 2u);
}

void sub_10002840C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  sub_10000407C(v0);
  sub_100004058();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Cannot remove xattr for %{public}@ - %s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_100028480(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not extract extended file attributes from %{public}@, returned %ld", (uint8_t *)&v3, 0x16u);
}

void sub_100028504()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  sub_10000407C(v0);
  sub_100004058();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Coud not extract extended file attributes from %{public}@. File is expected to have extended attributes.  %s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_100028578(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  char *v12;

  v6 = __error();
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = a2;
  v11 = 2080;
  v12 = sub_10000407C(v6);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to set xattr %{public}@ on %{public}@ - %s", (uint8_t *)&v7, 0x20u);
}

void sub_10002862C(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  unint64_t v5;

  v4 = 134217984;
  v5 = (unint64_t)objc_msgSend(a1, "length") >> 1;
  sub_100003B50((void *)&_mh_execute_header, a2, v3, "Unable to malloc bytes of size: %lu", (uint8_t *)&v4);
}

void sub_1000286B0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "String should be all hex digits: %@ (bad digit around %ld)", (uint8_t *)&v3, 0x16u);
}

void sub_100028734(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100003B50((void *)&_mh_execute_header, a2, a3, "Hex strings should have an even number of digits (%@)", (uint8_t *)&v3);
}

void sub_1000287A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: No Info section or in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028810(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: No Product section or in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028880(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s - Could not initialize manifestVerifier\n", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_1000288F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: InstallationOrder section in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028960(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: no BackupData section or in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_1000289D0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "One or more components have an invalid platformType", v1, 2u);
}

void sub_100028A10(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[MSDSignedManifestV7 initWithManifestData:]";
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2048;
  sub_1000079F4((void *)&_mh_execute_header, a2, a3, "%s - InstallationOrder count (%lu) doesn't match number of components in manifest (%lu)", *(const char **)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
}

void sub_100028A94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s - ConfigurationProfiles section in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028B04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s - Packages section in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028B74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: SystemApps section in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028BE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Apps section in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028C54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: payload format not correct.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100028CC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing Info section for app:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100028D30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing both RealSize and Size values for app:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100028D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Missing Info section for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100028E08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing both RealSize and Size values for package:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100028E74()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_1000079D8();
  sub_1000079F4((void *)&_mh_execute_header, v0, v1, "%s - Missing manifest data for section: %{public}@ for identifier: %{public}@", v2);
}

void sub_100028EEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Missing app object for app:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100028F58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Missing version number for app:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100028FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Missing package object for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100029030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Missing version number for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002909C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100007A18();
  sub_1000079CC((void *)&_mh_execute_header, v0, (uint64_t)v0, "Info section is missing for item %{public}@ under component %{public}@.", v1);
  sub_1000079EC();
}

void sub_100029104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s - Missing componentName.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100029174()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100007A18();
  sub_1000079CC((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unrecognized container type: %{public}@ for component %{public}@", v1);
  sub_1000079EC();
}

void sub_1000291DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100007A08();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "No component %{public}@ under section %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100029258()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100007A08();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "No %{public}@ key in component %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_1000292D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100007A08();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "No %{public}@ key in component %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100029350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Failed to read manifest file:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_1000293BC(void *a1, NSObject *a2)
{
  void *v3;
  int v4[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v4[0] = 136315394;
  sub_1000079D8();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:  Failed to convert manifest file to property list.  Error:  %{public}@", (uint8_t *)v4, 0x16u);

  sub_100004070();
}

void sub_100029450()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s:  Missing Version number in manifest file:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_1000294BC(void *a1, NSObject *a2)
{
  int v3;
  const char *v4;
  __int16 v5;
  unsigned int v6;

  v3 = 136315394;
  v4 = "+[MSDSignedManifestFactory readManifestFromFile:]";
  v5 = 1024;
  v6 = objc_msgSend(a1, "intValue");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:  Manifest version %d is not supported yet.", (uint8_t *)&v3, 0x12u);
  sub_100004070();
}

void sub_100029550()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s:  Manifest file is in wrong format:  %{public}@ - Must be NSDictionary.", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_1000295BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Manifest file does not exist:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_100029628(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Can't create URL %{public}@", (uint8_t *)&v2, 0xCu);
  sub_1000079EC();
}

void sub_100029698()
{
  uint64_t v0;
  os_log_t v1;

  sub_100007A18();
  sub_100008804((void *)&_mh_execute_header, v0, v1, "Can't create read stream, %{public}@ %{public}@");
  sub_1000079EC();
}

void sub_1000296F8()
{
  uint64_t v0;
  os_log_t v1;

  sub_100007A18();
  sub_100008804((void *)&_mh_execute_header, v0, v1, "Can't open read stream %{public}@ *** %{public}@");
  sub_1000079EC();
}

void sub_100029758(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "Can't alloc buffer", a5, a6, a7, a8, 0);
  sub_100008818();
}

void sub_100029788(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "Can't create data", a5, a6, a7, a8, 0);
  sub_100008818();
}

void sub_1000297B8(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Progress handler returned with status %d; failing verification",
    (uint8_t *)v2,
    8u);
  sub_100008818();
}

void sub_100029828(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "Unknown algorithm", a5, a6, a7, a8, 0);
  sub_100008818();
}

void sub_100029858(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000AE90((void *)&_mh_execute_header, a3, (uint64_t)a3, "Skipping all items in current item domain due to insufficient free disk space.", a1);
}

void sub_10002988C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a2, v4, "Failed to remove data shelter folder with error - %{public}@", v5);

  sub_100004070();
}

void sub_10002990C(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  sub_100003B50((void *)&_mh_execute_header, a2, a3, "Failed to get system container path for powerlog %llu", (uint8_t *)&v4);
  sub_1000079EC();
}

void sub_100029978()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, v0, v1, "Unexpected file type encountered for item %{public}@", v2);
  sub_1000079EC();
}

void sub_1000299DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  sub_10000AEB8();
  sub_10000AE7C((void *)&_mh_execute_header, v0, v1, "Failed to dirstat item %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_100029A50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  sub_10000AEB8();
  sub_10000AE7C((void *)&_mh_execute_header, v0, v1, "Failed to stat item %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_100029AC4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_10000AE90((void *)&_mh_execute_header, a1, a3, "Failed to get answer for kMGQDiskUsage.", v3);
}

void sub_100029AFC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_10000AE90((void *)&_mh_execute_header, a1, a3, "Failed to extract disk space information.", v3);
}

void sub_100029B34(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a2, v4, "Enumeration error at (but will continue): %{public}@", v5);

  sub_100004070();
}

void sub_100029BB4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_10000AEF4(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000AE50();
  sub_10000AE3C((void *)&_mh_execute_header, v4, v5, "%s: Cannot find files/dirs under %@ - %@", v6, v7, v8, v9, 2u);

  sub_10000AE6C();
}

void sub_100029C3C()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000AE9C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "localizedDescription"));
  sub_10000AED0();
  sub_100004044((void *)&_mh_execute_header, v2, v3, "Failed to remove:  %@ - Error:  %@", v4, v5, v6, v7, v8);

  sub_10000AEA8();
}

void sub_100029CBC()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000AE9C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "localizedDescription"));
  sub_10000AED0();
  sub_100004044((void *)&_mh_execute_header, v2, v3, "Cannot remove %@ - %@", v4, v5, v6, v7, v8);

  sub_10000AEA8();
}

void sub_100029D3C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_10000AEF4(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000AE50();
  sub_10000AE3C((void *)&_mh_execute_header, v4, v5, "%s: Cannot get attribute from %@ - %@", v6, v7, v8, v9, 2u);

  sub_10000AE6C();
}

void sub_100029DC4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_10000AEF4(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000AE50();
  sub_10000AE3C((void *)&_mh_execute_header, v4, v5, "%s: Cannot remove item: %@ - Error:  %@", v6, v7, v8, v9, 2u);

  sub_10000AE6C();
}

void sub_100029E4C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_10000AEF4(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000AE50();
  sub_10000AE3C((void *)&_mh_execute_header, v4, v5, "%s - Failed to read attributes of folder:  %@ - Error:  %@", v6, v7, v8, v9, 2u);

  sub_10000AE6C();
}

void sub_100029ED4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  sub_10000AE3C((void *)&_mh_execute_header, v2, v3, "%s - Failed to create directory:  %@ - Error:  %@", v4, v5, v6, v7, 2u);

  sub_10000AE6C();
}

void sub_100029F80(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v3 = 136315394;
  v4 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Intermediate path:  %@ must be folder.", (uint8_t *)&v3, 0x16u);
  sub_1000079EC();
}

void sub_10002A010()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, v0, v1, "Cannot calculate original path for %@", v2);
  sub_1000079EC();
}

void sub_10002A074()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "File does not exist at %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002A0D4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v3, v4, "Get file attributes failed for %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);

  sub_10000AEA8();
}

void sub_10002A158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_10000AEB8();
  sub_10000AE7C((void *)&_mh_execute_header, v0, v1, "Could not extract extended attributes from %{public}@.  Error:  %{public, errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002A1C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_10000AEB8();
  sub_10000AE7C((void *)&_mh_execute_header, v0, v1, "Could not extract extended attributes from %{public}@. File is expected to have extended attributes.  Error:  %{public, errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002A230()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D9C8();
  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000D9A8();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Could not get ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002A29C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Could not allocate buffer for ACL.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002A2C8()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D9C8();
  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000D9A8();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Could not create ACL binary format for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002A334()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D9C8();
  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000D9A8();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Could not validate ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002A3A0()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000AEE8();
  v3 = 2048;
  v4 = v0;
  sub_1000079CC((void *)&_mh_execute_header, v1, (uint64_t)v1, "Could not extract extended file attributes from %{public}@, returned %td", v2);
  sub_1000079EC();
}

void sub_10002A414()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Coud not extract extended file attributes from %{public}@. File is expected to have extended attributes.", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002A474()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Could not get attribute keys from file %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002A4D4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v3, v4, "Could not get destination of symbolic link %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);

  sub_10000AEA8();
}

void sub_10002A558()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Cannot get file attribute for %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002A5B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Cannot get file extended attribute for %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002A618()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot allocate space.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002A644()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Inconsistent return value from listxattr.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002A670()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000AEE8();
  v3 = 2114;
  v4 = v0;
  sub_1000079CC((void *)&_mh_execute_header, v1, (uint64_t)v1, "Cannot remove extended attribte %{public}s from %{public}@.", v2);
  sub_1000079EC();
}

void sub_10002A6E4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D9C8();
  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000D9A8();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Could not create empty ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002A750()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D9C8();
  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000D9A8();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Could not set ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002A7BC()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000D9C8();
  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000D9A8();
  sub_100004044((void *)&_mh_execute_header, v1, v2, "Could not load ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002A828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Could not set extended attributes on %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002A888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Got non-data value", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002A8B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Got Non-string key", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002A8E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_10000AEB8();
  sub_10000AE7C((void *)&_mh_execute_header, v0, v1, "Could not set file permission on symlink %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002A94C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_10000AEB8();
  sub_10000AE7C((void *)&_mh_execute_header, v0, v1, "Could not set file ownership on symlink %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002A9B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: No Info section or in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AA28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: No Product section or in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AA98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Could not initialize manifestVerifier", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002AAC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to parse bundle ID", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002AAF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "InstallationOrder failed the validation.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002AB1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: no Backup section or in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AB8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "InstallationOrder entry count does not match components listed in manifest.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002ABB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: App section in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AC28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: InstallationOrder section in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AC98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: payload format not correct.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AD08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "getBackup is only for old manifest.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002AD34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "Failed to parse %{public}@", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002ADA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "Failed to parse %{public}@", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AE14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Loading Domains.plist failed", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002AE40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "No certificates found in the manifest.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002AE6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "rigorousTesting failed.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002AE98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: No matching certificate for %{public}@.", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002AF04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Manifest contains UAT component on prodFused device.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002AF74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Failed to parse payload for item: %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002AFD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: signature type for certificate %{public}@ does not exist", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002B040(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: cannot find certificates, or certificate format not correct.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B0B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: cannot find certificates, certificates list empty.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B120(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Certificate not valid.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B190()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Could not locate the file:%{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002B1F0(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]";
  v3 = 1024;
  v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:There is unexpected invalid signature/entitlements:%08x", (uint8_t *)&v1, 0x12u);
  sub_1000079EC();
}

void sub_10002B278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s Could not find a data container for:%{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002B2E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: %{public}@ section is not a dictionary", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002B350(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot create policy.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B3C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot create policy.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B430()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Can not load appleIST leaf certificate", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002B45C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Can not load appleIST intermediate certificate", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002B488(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot load certificate data.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B4F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot load certificate.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B568(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a2, a3, "CN did not match for appleIST.:%{public}@\n", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B5D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "OU did not match for appleIST cert.:%{public}@\n", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002B630()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "appleIST certificate count is unexpected\n", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002B65C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot create policy.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B6CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014974();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: certificate trust evaluation failed: %ld", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002B73C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot extract public key.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B7AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014974();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: Cannot evaluate trust: %ld", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002B81C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014974();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: Cannot set anchor certificates: %ld", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002B88C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100014974();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: Cannot create secure trust object: %ld", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002B8FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot load certificate.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002B96C(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 136315394;
  v3 = "-[MSDDemoManifestCheck verifySignature:forData:withKey:]";
  v4 = 1024;
  v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Failed in verifying signature(%d)", (uint8_t *)&v2, 0x12u);
  sub_1000079EC();
}

void sub_10002B9F0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10000D9EC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "verifySignature is called", v1, 2u);
  sub_100008818();
}

void sub_10002BA28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Certificate array in wrong format.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002BA98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot load certificate.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002BB08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Apps signed by IS&T can only have Provisioning Profiles dependency.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002BB34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Passed a null manifest for security checks", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002BBA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Security checks failed", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002BC14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Security checks failed", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002BC84(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a2 + 40);
  v4 = 136315650;
  v5 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
  v6 = 2114;
  v7 = a1;
  v8 = 2114;
  v9 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed rigorous check for:%{public}@ (from %{public}@)", (uint8_t *)&v4, 0x20u);
}

void sub_10002BD1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Apple IST certificate is used to sign %{public}@ unexpected component", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002BD7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002BDE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002BE54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002BEC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Component %{public}@ is not a Settings component", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002BF20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "File attributes are nil for %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002BF80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Whitelist checker failed", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002BFAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "System container check failed for file:%{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002C00C()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000AEE8();
  v3 = 2048;
  v4 = v0;
  sub_1000079CC((void *)&_mh_execute_header, v1, (uint64_t)v1, "File permissions failed for file:%{public}@(%ld)", v2);
  sub_1000079EC();
}

void sub_10002C080()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000AEE8();
  v3 = 2114;
  v4 = v0;
  sub_1000079CC((void *)&_mh_execute_header, v1, (uint64_t)v1, "Not a valid fileType (%{public}@) for file: %{public}@", v2);
  sub_1000079EC();
}

void sub_10002C0F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "IS&T signed component in wrong format (no manifest) for %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002C154()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "IS&T signed component in wrong format (symlink target) for %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002C1B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Failed to get path components for file: %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002C214()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Invalid data container file. %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002C274()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10000D9EC();
  sub_10000AE90((void *)&_mh_execute_header, v0, v1, "Failed to set up directory traversal tree.", v2);
  sub_100008818();
}

void sub_10002C2A4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000153E4(a1, a2);
  sub_10000AE90((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to get file descriptor.", v3);
}

void sub_10002C2D0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000153E4(a1, a2);
  sub_10000AE90((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to write data to disk", v3);
}

void sub_10002C2FC(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000153E4(a1, a2);
  sub_10000AE90((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to write metadata to disk.", v3);
}

void sub_10002C328(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_1000153E4(a1, a2);
  sub_10000AE90((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to read from disk.", v3);
}

void sub_10002C354()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10000D9EC();
  sub_10000AE90((void *)&_mh_execute_header, v0, v1, "Fatal error occurred during tree traversal.", v2);
  sub_100008818();
}

void sub_10002C384()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10000D9EC();
  sub_10000AE90((void *)&_mh_execute_header, v0, v1, "Failed to open dst file name.", v2);
  sub_100008818();
}

void sub_10002C3B4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_10000D9EC();
  sub_10000AE90((void *)&_mh_execute_header, v0, v1, "Invalid src or dest path.", v2);
  sub_100008818();
}

void sub_10002C3E4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot load Domains.plist: %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_10002C458()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find CameraRollDomain, or in wrong format.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C484()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find HomeDomain, or in wrong format.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C4B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find KeychainDomain, or in wrong format.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C4DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find MediaDomain, or in wrong format.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RootDomain, or in wrong format.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C534()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find SystemPreferencesDomain, or in wrong format.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under SystemPreferencesDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C58C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under RootDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C5B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToBackupAndRestore under MediaDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C5E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C610()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C63C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C668()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C694()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C6C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C6EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C718()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C744()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsNotToBackupToService under HomeDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C770()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under HomeKitDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C79C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackupToService under HomeKitDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C7C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackupInMegaBackup under HomeKitDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C7F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRestoreOnly under HomeKitDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C820()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToOnlyBackupEncrypted under HomeKitDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C84C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under CameraRollDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under CameraRollDomain.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002C8A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_1000184E0();
  sub_1000184CC((void *)&_mh_execute_header, v0, v1, "Cannot open volume(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002C910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_1000184E0();
  sub_1000184CC((void *)&_mh_execute_header, v0, v1, "Cannot revert snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002C97C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_1000184E0();
  sub_1000184CC((void *)&_mh_execute_header, v0, v1, "Cannot delete snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002C9E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_1000184E0();
  sub_1000184CC((void *)&_mh_execute_header, v0, v1, "Cannot create snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002CA54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_1000184E0();
  sub_1000184CC((void *)&_mh_execute_header, v0, v1, "Cannot mount snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002CAC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9C8();
  sub_10000D9C0();
  sub_1000184E0();
  sub_1000184CC((void *)&_mh_execute_header, v0, v1, "Cannot unmount snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
  sub_100004070();
}

void sub_10002CB2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to locate keyword '/dev/'.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002CB58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to find volume IO service.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002CB84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to find container BSD name.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002CBB0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100018518();
  sub_1000184F8((void *)&_mh_execute_header, v0, v1, "Failed to create IO iterator with error - %d", v2);
  sub_100008818();
}

void sub_10002CC14(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];

  v2 = *__error();
  v4[0] = 67240192;
  v4[1] = v2;
  sub_1000184F8((void *)&_mh_execute_header, a1, v3, "Failed to statfs '/' with error - %{public, errno}d", (uint8_t *)v4);
  sub_1000079EC();
}

void sub_10002CC94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Invalid FSIndex for APFS volume.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002CCC0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100018518();
  sub_1000184F8((void *)&_mh_execute_header, v0, v1, "Failed to create APFS volume. error - %d", v2);
  sub_100008818();
}

void sub_10002CD24()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100018518();
  sub_1000184F8((void *)&_mh_execute_header, v0, v1, "Failed to delete APFS volume. error - %d", v2);
  sub_100008818();
}

void sub_10002CD88(_QWORD *a1, unint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  unint64_t v7;

  v3 = *a1 >> 20;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2 >> 20;
  sub_1000079CC((void *)&_mh_execute_header, a3, (uint64_t)a3, "Free space left: %llu MB but needed: %lld MB", (uint8_t *)&v4);
  sub_1000079EC();
}

void sub_10002CE0C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100018518();
  sub_1000184F8((void *)&_mh_execute_header, v0, v1, "Failed to get space info. error - %d", v2);
  sub_100008818();
}

void sub_10002CE70()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];

  sub_100018518();
  sub_1000184F8((void *)&_mh_execute_header, v0, v1, "Failed to scan IO Registry. error - %d", v2);
  sub_100008818();
}

void sub_10002CED4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_10000D9C0();
  strerror(*v0);
  sub_100018504((void *)&_mh_execute_header, v1, v2, "Failed to get mounted filesystem info - %{public}s", v3, v4, v5, v6, 2u);
  sub_100004070();
}

void sub_10002CF48(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100018504((void *)&_mh_execute_header, v2, v3, "Failed to set file attributes on mount point - %{public}@", v4, v5, v6, v7, 2u);

  sub_100004070();
}

void sub_10002CFC4(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];

  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000184F8((void *)&_mh_execute_header, a1, v3, "Failed to get file stat - %{errno}d", (uint8_t *)v4);
  sub_1000079EC();
}

void sub_10002D044(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  sub_10000D9D4();
  sub_1000079CC((void *)&_mh_execute_header, a3, v5, "Failed to create mount point at '%{public}@' - %{public}@", v6);

  sub_10000AEA8();
}

void sub_10002D0D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Volume is already mounted.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002D0FC(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  sub_10000D9D4();
  sub_1000079CC((void *)&_mh_execute_header, a3, v5, "Failed to remove mount point at '%{public}@' -  %{public}@", v6);

  sub_10000AEA8();
}

void sub_10002D188()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_10000D9C0();
  strerror(*v0);
  sub_100018504((void *)&_mh_execute_header, v1, v2, "Failed to unmount APFS volume - %{public}s", v3, v4, v5, v6, 2u);
  sub_100004070();
}

void sub_10002D1FC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to synchronize with CFPreferences.", v1, 2u);
}

void sub_10002D23C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;

  v3 = 136315138;
  v4 = "-[MSDManifest addFilesUsingSourceManifest:]";
  sub_100003B50((void *)&_mh_execute_header, a1, a3, "%s: Root path must be the same between source and device manifest.", (uint8_t *)&v3);
}

void sub_10002D2B4(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "path"));
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Couldn't get meta data for %{public}@", a1, 0xCu);

}

void sub_10002D328(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v5 = 138543362;
  v6 = v3;
  sub_100003B50((void *)&_mh_execute_header, a2, v4, "Couldn't run handler against %{public}@", (uint8_t *)&v5);

}

void sub_10002D3B4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "rootPath already specified. Could not add more files.", v1, 2u);
}

void sub_10002D3F4(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "absoluteString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByRemovingPercentEncoding"));
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot read file %{public}@", (uint8_t *)&v5, 0xCu);

  sub_10000AEA8();
}

void sub_10002D494(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "absoluteString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByRemovingPercentEncoding"));
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Cannot read data from %{public}@ - %{public}@.", (uint8_t *)&v7, 0x16u);

  sub_10000AEA8();
}

void sub_10002D544(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSDictionary: %{public}@", (uint8_t *)&v3, 0xCu);
  sub_1000079EC();
}

void sub_10002D5BC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_100003B50((void *)&_mh_execute_header, a2, a3, "The value for key %{public}@ has a type that is not supported yet", (uint8_t *)&v3);
  sub_1000079EC();
}

void sub_10002D624(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  id v5;

  v4 = 136315138;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "objCType");
  sub_100003B50((void *)&_mh_execute_header, a2, v3, "Unsupported NSNumber type: %s for xpc dictionary encoding", (uint8_t *)&v4);
  sub_100004070();
}

void sub_10002D6A0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  objc_opt_class(a2);
  v8 = 138543618;
  v9 = a1;
  sub_10001B4A4();
  v6 = v5;
  sub_1000079CC((void *)&_mh_execute_header, a3, v7, "The value for key %{public}@ has unsupported type %{public}@", (uint8_t *)&v8);

  sub_100004070();
}

void sub_10002D730(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  v5 = 2114;
  v6 = 0;
  sub_1000079CC((void *)&_mh_execute_header, a1, a3, "%s: Cannot convert %{public}@ to dictionary", (uint8_t *)&v3);
  sub_1000079EC();
}

void sub_10002D7B0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10001B4B4();
  sub_10001B480();
  sub_10000AE3C((void *)&_mh_execute_header, v2, v3, "Failed to deserialize JSON object with error - %{public}@(0x%tx). Target: %{public}@", v4, v5, v6, v7, v8);

  sub_10000AE6C();
}

void sub_10002D834()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315394;
  v3 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  sub_10001B4A4();
  sub_1000079CC((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)&v2);
  sub_1000079EC();
}

void sub_10002D8A8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10001B4B4();
  sub_10001B480();
  sub_10000AE3C((void *)&_mh_execute_header, v2, v3, "Failed to serialize JSON object - %{public}@(0x%tx). Target: %{public}@", v4, v5, v6, v7, v8);

  sub_10000AE6C();
}

void sub_10002D92C()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  v2 = 136315394;
  v3 = "-[NSDictionary(xpcdictConv) convertToNSData]";
  sub_10001B4A4();
  sub_1000079CC((void *)&_mh_execute_header, v0, v1, "%s: Not a valid JSON object: %{public}@", (uint8_t *)&v2);
  sub_1000079EC();
}

void sub_10002D9A0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create manifest from manifest data.", v1, 2u);
}

void sub_10002D9E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s: Failed metadata attribute restore for %{public}@!", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002DA4C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  int *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceUID"));
  v4 = *__error();
  v5 = __error();
  v6 = strerror(*v5);
  v7 = 136315906;
  v8 = "-[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo]";
  v9 = 2114;
  v10 = v3;
  v11 = 1024;
  v12 = v4;
  v13 = 2082;
  v14 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Failed to get password entry for UID:  %{public}@ - errno:  %d - %{public}s", (uint8_t *)&v7, 0x26u);

}

void sub_10002DB28(void *a1, _DWORD *a2, NSObject *a3)
{
  void *v5;
  int v6;
  int *v7;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "deviceUID"));
  LODWORD(a2) = *a2;
  v6 = *__error();
  v7 = __error();
  v8 = strerror(*v7);
  v9 = 136316162;
  v10 = "-[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo]";
  v11 = 2114;
  v12 = v5;
  v13 = 1024;
  v14 = (int)a2;
  v15 = 1024;
  v16 = v6;
  v17 = 2082;
  v18 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s - Failed to get group entry for UID:  %{public}@ with group ID:  %d - errno:  %d - %{public}s", (uint8_t *)&v9, 0x2Cu);

}

void sub_10002DC14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000079D8();
  sub_1000079AC((void *)&_mh_execute_header, v0, v1, "%s - Failed to update file attributes for file:  %{public}@", v2, v3, v4, v5, 2u);
  sub_1000079EC();
}

void sub_10002DC80(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "File %{public}@ belong to UID: %{public}@; file metadata does not need to be updated",
    (uint8_t *)&v3,
    0x16u);
  sub_1000079EC();
}

void sub_10002DD00(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;

  v3 = 136315394;
  v4 = "-[MSDHOperations updateSignedManifest]";
  v5 = 2114;
  v6 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist");
  sub_1000079CC((void *)&_mh_execute_header, a1, a3, "%s - Cannot load manifest:  %{public}@", (uint8_t *)&v3);
  sub_1000079EC();
}

void sub_10002DD88(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;

  v3 = 136315394;
  v4 = "-[MSDHOperations updateSignedManifest]";
  v5 = 2114;
  v6 = CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist");
  sub_1000079CC((void *)&_mh_execute_header, a1, a3, "%s - Manifest file does not exist:  %{public}@", (uint8_t *)&v3);
  sub_1000079EC();
}

void sub_10002DE10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Couldn't change ownership for %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002DE70()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100007A18();
  sub_1000079CC((void *)&_mh_execute_header, v0, (uint64_t)v0, "Couldn't move %{public}@ to %{public}@", v1);
  sub_1000079EC();
}

void sub_10002DED8()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10000AE9C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "localizedDescription"));
  sub_1000214AC();
  sub_10000AE3C((void *)&_mh_execute_header, v2, v3, "%s: Cannot get attribute from %{public}@ - %{public}@", v4, v5, v6, v7, 2u);

  sub_10000AE6C();
}

void sub_10002DF64()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10000AE9C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "localizedDescription"));
  sub_1000214AC();
  sub_10000AE3C((void *)&_mh_execute_header, v2, v3, "%s: Cannot set attribute for %{public}@ - %{public}@", v4, v5, v6, v7, 2u);

  sub_10000AE6C();
}

void sub_10002DFF0()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10000AE9C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "localizedDescription"));
  sub_1000214AC();
  sub_10000AE3C((void *)&_mh_execute_header, v2, v3, "%s: Cannot create direcotry at %{public}@ - %{public}@", v4, v5, v6, v7, 2u);

  sub_10000AE6C();
}

void sub_10002E07C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Manifest has not been successfully loaded yet.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002E0EC()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315650;
  v4 = "-[MSDHOperations createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
  sub_10001B4A4();
  v5 = v0;
  v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: No manifest data found for component: %{public}@ of type: %{public}@", (uint8_t *)&v3, 0x20u);
}

void sub_10002E178(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot create device manifest.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002E1E8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a2, v4, "Cannot write device manifest with error - %{public}@", v5);

  sub_100004070();
}

void sub_10002E268()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Failed to read plist file at %{public}@ - %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E2E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "No file path specified for touch.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002E310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Failed to touch file path: %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002E370()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Couldn't locate options node in IODeviceTree", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002E39C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Couldn't force sync new nvram to device", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002E3C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Couldn't locate bootstrap_port mach port", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002E3F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Couldn't write nvram", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002E420(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10001B4A4();
  sub_100004044((void *)&_mh_execute_header, v2, v3, "Failed to create folder at: %{public}@ error: %{public}@", v4, v5, v6, v7, 2u);

  sub_100004070();
}

void sub_10002E4A8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10001B4A4();
  sub_100004044((void *)&_mh_execute_header, v2, v3, "Failed to remove folder at: %{public}@ error: %{public}@", v4, v5, v6, v7, 2u);

  sub_100004070();
}

void sub_10002E530()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "No user name provided for user volume.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002E55C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Cannot locate home path for user %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002E5BC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Failed to create folder: %{public}@ error: %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E638()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Failed to delete folder: %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002E698()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Failed to get file attributes of %{public}@ - %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E714()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Cannot get destination path for %{public}@ - %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E790()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Cannot remove symlink %{public}@ - %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E80C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Could not remove %{public}@ with error - %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Staging path %{public}@ does not exist.", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002E8E8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Failed to read destination of symbolic link at: %{public}@ error: %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E964()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Failed to remove symbolic link at %{public}@: %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002E9E0(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];

  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000184F8((void *)&_mh_execute_header, a1, v3, "Failed to rename temporary user backup folder to the real user backup folder: %{errno}d", (uint8_t *)v4);
  sub_1000079EC();
}

void sub_10002EA60()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Failed to create directory at: %{public}@ error: %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002EADC(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];

  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_1000184F8((void *)&_mh_execute_header, a1, v3, "Failed to rename temporary backup folder to the real backup folder: %{errno}d", (uint8_t *)v4);
  sub_1000079EC();
}

void sub_10002EB5C(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_1000184F8((void *)&_mh_execute_header, a2, a3, "Failed to reboot device with error - %d", (uint8_t *)v3);
  sub_100008818();
}

void sub_10002EBC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Faild to initialize MSDHFileMetadataRestore", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EBF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s - Manifest has not been successfully loaded yet.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002EC60()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000AEE8();
  v3 = 2048;
  v4 = v0;
  sub_1000079CC((void *)&_mh_execute_header, v1, (uint64_t)v1, "Couldn't load manifest dict for backup range location = %lu; length = %lu",
    v2);
  sub_1000079EC();
}

void sub_10002ECD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "MSDHFileMetadataRestore uninitialized", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002ED00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s - Manifest has not been successfully loaded yet.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002ED70()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100007A18();
  sub_1000079CC((void *)&_mh_execute_header, v0, (uint64_t)v0, "Couldn't load manifest dict for %{public}@/%{public}@", v1);
  sub_1000079EC();
}

void sub_10002EDD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to get answer for kMGQDiskUsage.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EE04(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "longLongValue");
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a2, v3, "Not enough disk space to collect logs. Available: %lld", v4);
  sub_100004070();
}

void sub_10002EE78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to create zip file.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EEA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to copy finish_demo_restore logs.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EED0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to generate DemoLoop logs", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EEFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to generate demod logs", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EF28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to create tmp log directory.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EF54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to remove log directory.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EF80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "Failed to remove compressed log stream file.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002EFAC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000AE9C();
  v2 = objc_msgSend((id)sub_1000214C8(v0, v1), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000D9D4();
  sub_100004044((void *)&_mh_execute_header, v4, v5, "Failed to create parent folder %{public}@ with error - %{public}@", v6, v7, v8, v9, v10);

  sub_10000AEA8();
}

void sub_10002F028()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "The following file doesnt exist: %{public}@. Skipping the copy.", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002F088()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002F0E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_10002149C((void *)&_mh_execute_header, v0, v1, "Final dataShelterSize:  %llu", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002F148()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_10002149C((void *)&_mh_execute_header, v0, v1, "Current dataShelterSize:  %llu", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002F1A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_10002149C((void *)&_mh_execute_header, v0, v1, "sourceDataSize:  %llu", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

uint64_t sub_10002F208()
{
  char *v0;
  uint64_t v1;

  v0 = dlerror();
  v1 = abort_report_np("%s", v0);
  return sub_10002F228(v1);
}

void sub_10002F228(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_1000184F8((void *)&_mh_execute_header, a2, a3, "Failed to restart bluetoothd: %d", (uint8_t *)v3);
  sub_100008818();
}

void sub_10002F290(NSObject *a1)
{
  int v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_1000214D4();
  SCErrorString(v2);
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a1, v3, "SCPreferencesCreate failed - Error:  %{public}s", v4);
  sub_100004070();
}

void sub_10002F304(NSObject *a1)
{
  int v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_1000214D4();
  SCErrorString(v2);
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a1, v3, "SCPreferencesSetComputerName failed - Error:  %{public}s", v4);
  sub_100004070();
}

void sub_10002F378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_1000087F4((void *)&_mh_execute_header, v0, v1, "_CSCopyLocalHostnameForComputerName failed.", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002F3A4(NSObject *a1)
{
  int v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_1000214D4();
  SCErrorString(v2);
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a1, v3, "SCPreferencesSetLocalHostName failed - Error:  %{public}s", v4);
  sub_100004070();
}

void sub_10002F418(NSObject *a1)
{
  int v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_1000214D4();
  SCErrorString(v2);
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a1, v3, "SCPreferencesCommitChanges failed - Error:  %{public}s", v4);
  sub_100004070();
}

void sub_10002F48C(NSObject *a1)
{
  int v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = sub_1000214D4();
  SCErrorString(v2);
  sub_10000AEE8();
  sub_100003B50((void *)&_mh_execute_header, a1, v3, "SCPreferencesApplyChanges failed - Error:  %{public}s", v4);
  sub_100004070();
}

void sub_10002F500()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_10002149C((void *)&_mh_execute_header, v0, v1, "hostName:  %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_10002F560(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s - CFPreferencesSynchronize failed.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_10002F5D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_100021AAC((void *)&_mh_execute_header, v0, v1, "It's an XPC_TYPE_CONNECTION", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002F5FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_100021AAC((void *)&_mh_execute_header, v0, v1, "It's an XPC_TYPE_ERROR", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002F628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_100021AAC((void *)&_mh_execute_header, v0, v1, "Message handled", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002F654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_100021AAC((void *)&_mh_execute_header, v0, v1, "MSDH: Received a XPC request", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002F680()
{
  __assert_rtn("MSDH_handle_connection_block_invoke", "demod_helper.m", 56, "type == XPC_TYPE_DICTIONARY");
}

void sub_10002F6A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_100021AAC((void *)&_mh_execute_header, v0, v1, "Received an XPC request?", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002F6D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D9EC();
  sub_100021AAC((void *)&_mh_execute_header, v0, v1, "Checking the type", v2, v3, v4, v5, v6);
  sub_100008818();
}

void sub_10002F700(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v2, v3, "Failed to load JSON data: %{public}@", v4, v5, v6, v7, v8);

  sub_100004070();
}

void sub_10002F778(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v2, v3, "Failed to deserialize JSON data: %{public}@", v4, v5, v6, v7, v8);

  sub_100004070();
}

void sub_10002F7F0(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 67240450;
  v3[1] = a2;
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to run xctspawn: %{public, errno}d stdout: %{public}@", (uint8_t *)v3, 0x12u);
}

void sub_10002F874(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v2, v3, "Failed to locate xctspawn tool: %{public}@", v4, v5, v6, v7, v8);

  sub_100004070();
}

void sub_10002F8EC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v2, v3, "Failed to get file last modified date: %{public}@", v4, v5, v6, v7, v8);

  sub_100004070();
}

void sub_10002F964(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to run xctspawn: %{public, errno}d", (uint8_t *)v2, 8u);
  sub_100008818();
}

void sub_10002F9D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "No test plan found.", a5, a6, a7, a8, 0);
  sub_100008818();
}

void sub_10002FA04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "No test target found.", a5, a6, a7, a8, 0);
  sub_100008818();
}

void sub_10002FA34()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v1, v2, "ip address - inet_ntop failed - %s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002FAA0()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v1, v2, "net mask - inet_ntop failed - %s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002FB0C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v1, v2, "broadcast addr - inet_ntop failed - %s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002FB78(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing interface name", buf, 2u);
}

void sub_10002FBB4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = sub_10000D9C0();
  sub_10000407C(v0);
  sub_10000AEE8();
  sub_100018504((void *)&_mh_execute_header, v1, v2, "getifaddrs failed - %s", v3, v4, v5, v6, v7);
  sub_100004070();
}

void sub_10002FC20(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to remove file from %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);

}

void sub_10002FCD0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to set file attributes: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002FD44(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;

  v6 = *__error();
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = a2;
  v11 = 1024;
  v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to clonefile from %{public}@ to %{public}@ - %{errno}d", (uint8_t *)&v7, 0x1Cu);
}

void sub_10002FDF8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot load domains.plist from %{public}@.", (uint8_t *)&v2, 0xCu);
  sub_1000079EC();
}

void sub_10002FE68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "Cannot find domains.", a5, a6, a7, a8, 0);
}

void sub_10002FE9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "Cannot generate custom domains.", a5, a6, a7, a8, 0);
}

void sub_10002FED0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Manifest file path %{public}@ is not same as real path: %{public}@", (uint8_t *)&v3, 0x16u);
  sub_1000079EC();
}

void sub_10002FF50(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[WhitelistChecker handleSystemContainerFiles:withMetadata:]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:Container check failed for %{public}@", (uint8_t *)&v2, 0x16u);
  sub_1000079EC();
}

void sub_10002FFD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: Cannot create SecTask from audit token", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100030044(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: No data received.", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_1000300B4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_1000079D8();
  sub_1000079CC((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)v2);
  sub_1000079EC();
}

void sub_100030124(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "failed to prepare work container in user home.", a5, a6, a7, a8, 0);
  sub_100008818();
}

void sub_100030154()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "failed to create directory at %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_1000301B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "failed to destory work container in user home.", a5, a6, a7, a8, 0);
  sub_100008818();
}

void sub_1000301E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "failed to remove directory at %{public}@", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100030254(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "failed to remove directory at %{public}@", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_1000302C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "failed to remove directory at %{public}@", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100030334()
{
  os_log_t v0;
  int v1[6];

  v1[0] = 136315394;
  sub_1000079D8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Entering %s with parameter: %{public}@", (uint8_t *)v1, 0x16u);
  sub_1000079EC();
}

void sub_1000303AC()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_10000AEE8();
  v3 = 1026;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "INFO - computerName:  %{public}@ - encoding:  0x%{public}x", v2, 0x12u);
  sub_1000079EC();
}

void sub_100030428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000079BC((void *)&_mh_execute_header, a1, a3, "%s: entered - Launching test script is not supported on this OS!", a5, a6, a7, a8, 2u);
  sub_1000079EC();
}

void sub_100030498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "selector is nil for command: %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_1000304F8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;

  v5 = objc_msgSend((id)objc_opt_class(a1), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000AEE8();
  v9 = 2114;
  v10 = a2;
  sub_1000079CC((void *)&_mh_execute_header, a3, v7, "%{public}@ does not respond to %{public}@.", v8);

}

void sub_10003059C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000AEE8();
  sub_1000079BC((void *)&_mh_execute_header, v0, v1, "Command not allowed: %{public}@", v2, v3, v4, v5, v6);
  sub_1000079EC();
}

void sub_1000305FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000087F4((void *)&_mh_execute_header, a1, a3, "The client does not have proper entitlement", a5, a6, a7, a8, 0);
  sub_100008818();
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
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

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDispatchData");
}

id objc_msgSend__gatherDeviceDemoUserAccountInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherDeviceDemoUserAccountInfo");
}

id objc_msgSend__parseTestScriptsFromXCTSpawnResultDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_parseTestScriptsFromXCTSpawnResultDictionary:");
}

id objc_msgSend__testProductsPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_testProductsPath");
}

id objc_msgSend__updateFile_withAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFile:withAttributes:");
}

id objc_msgSend__updateFileAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFileAttributes:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessControlListWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessControlListWithPath:");
}

id objc_msgSend_activateStreamFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateStreamFromDate:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFilesUsingSourceManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFilesUsingSourceManifest:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_adjustContentUnder_userHomePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustContentUnder:userHomePath:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allowedISTSignedComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedISTSignedComponents");
}

id objc_msgSend_allowedSymLinks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedSymLinks");
}

id objc_msgSend_annotated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "annotated:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_arrayWithXPCArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithXPCArray:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_blackListedPaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackListedPaths");
}

id objc_msgSend_blocklistedItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blocklistedItems");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_canDeviceHaveEnoughSpaceForItemDomainWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canDeviceHaveEnoughSpaceForItemDomainWithSize:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_changeFileAttributes_atPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeFileAttributes:atPath:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_checkFile_WatchAndTV_withMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkFile_WatchAndTV:withMetaData:");
}

id objc_msgSend_checkFile_iOS_withMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkFile_iOS:withMetaData:");
}

id objc_msgSend_checkFile_macOS_withMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkFile_macOS:withMetaData:");
}

id objc_msgSend_checkFreeSpaceLeftInContainer_neededSpace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkFreeSpaceLeftInContainer:neededSpace:");
}

id objc_msgSend_checkManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkManifest:");
}

id objc_msgSend_checkPlatformTypeForAllComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkPlatformTypeForAllComponents");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkType");
}

id objc_msgSend_cloneFile_to_expectingHash_correctOwnership_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloneFile:to:expectingHash:correctOwnership:");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_collectDemoLogsToFolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectDemoLogsToFolder:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_composedMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composedMessage");
}

id objc_msgSend_compressContent_toPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compressContent:toPath:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_convertToNSData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertToNSData");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAPFSVolume_withSizeInMB_inContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAPFSVolume:withSizeInMB:inContainer:");
}

id objc_msgSend_createDeviceManifestForComponent_ofType_withRootPath_userHomePath_andSavePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createFullPathList_rootPath_isAllowList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFullPathList:rootPath:isAllowList:");
}

id objc_msgSend_createIntermdediateDirectoriesInPathAndRestoreAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createIntermdediateDirectoriesInPathAndRestoreAttributes:");
}

id objc_msgSend_createPublicKey_usingPolicy_anchors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPublicKey:usingPolicy:anchors:");
}

id objc_msgSend_createPublicKeyAppleISTSigning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPublicKeyAppleISTSigning:");
}

id objc_msgSend_createPublicKeyForDevelopmentSigning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPublicKeyForDevelopmentSigning:");
}

id objc_msgSend_createPublicKeyForDevelopmentSigningStandard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPublicKeyForDevelopmentSigningStandard:");
}

id objc_msgSend_createPublicKeyForStrongSigning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPublicKeyForStrongSigning:");
}

id objc_msgSend_createSignedManifestFromManifestFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSignedManifestFromManifestFile:");
}

id objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSymbolicLinkAtPath:withDestinationPath:error:");
}

id objc_msgSend_createXPCDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createXPCDictionary");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deleteAPFSVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAPFSVolume:");
}

id objc_msgSend_deleteDemoVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteDemoVolume");
}

id objc_msgSend_deleteNvram_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteNvram:");
}

id objc_msgSend_demoVolumeDev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "demoVolumeDev");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_destinationOfSymbolicLinkAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationOfSymbolicLinkAtPath:error:");
}

id objc_msgSend_destroyWorkContainerInUserHome(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyWorkContainerInUserHome");
}

id objc_msgSend_deviceGID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceGID");
}

id objc_msgSend_deviceGroupName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceGroupName");
}

id objc_msgSend_deviceUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUID");
}

id objc_msgSend_deviceUserName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUserName");
}

id objc_msgSend_dict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dict");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryFromJsonData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryFromJsonData:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
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

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dictionaryWithXPCDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithXPCDictionary:");
}

id objc_msgSend_disableLaunchdServicesForWatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableLaunchdServicesForWatch");
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domains");
}

id objc_msgSend_domainsPlistFilePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainsPlistFilePath");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enableLogToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableLogToFile:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_enumerateAndCollectMetaData_relativeTo_skip_superSet_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_extendedAttributeKeysWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedAttributeKeysWithPath:");
}

id objc_msgSend_extendedAttributesWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedAttributesWithPath:");
}

id objc_msgSend_file_blacklisted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "file:blacklisted:");
}

id objc_msgSend_file_whitelisted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "file:whitelisted:");
}

id objc_msgSend_fileAttributesAllowSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileAttributesAllowSet:");
}

id objc_msgSend_fileAttributesWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileAttributesWithPath:");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileGroupOwnerAccountID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileGroupOwnerAccountID");
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReading");
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingAtPath:");
}

id objc_msgSend_fileHandleForReadingFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingFromURL:error:");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_fileHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHash");
}

id objc_msgSend_fileHashWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHashWithPath:");
}

id objc_msgSend_fileMetaDataWithMetadataDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileMetaDataWithMetadataDictionary:");
}

id objc_msgSend_fileMetadatatWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileMetadatatWithPath:");
}

id objc_msgSend_fileNameForTodayUnder_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileNameForTodayUnder:prefix:");
}

id objc_msgSend_fileOwnerAccountID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileOwnerAccountID");
}

id objc_msgSend_filePosixPermissions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filePosixPermissions");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithString:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findAPFSVolumeMountPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findAPFSVolumeMountPoint:");
}

id objc_msgSend_folder_contains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folder:contains:");
}

id objc_msgSend_generateItemDomainsToBeSheltered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateItemDomainsToBeSheltered");
}

id objc_msgSend_generateLogsForPredicate_toFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateLogsForPredicate:toFile:");
}

id objc_msgSend_getAPFSBootContainerDeviceNode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAPFSBootContainerDeviceNode");
}

id objc_msgSend_getAccessControlList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccessControlList");
}

id objc_msgSend_getAllowedISTSignedComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllowedISTSignedComponents:");
}

id objc_msgSend_getAllowedISTSignedComponentsFromManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllowedISTSignedComponentsFromManifest:");
}

id objc_msgSend_getAllowedSymLinks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllowedSymLinks");
}

id objc_msgSend_getAppList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAppList");
}

id objc_msgSend_getBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBackup");
}

id objc_msgSend_getBackupItemName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBackupItemName:");
}

id objc_msgSend_getBackupList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBackupList");
}

id objc_msgSend_getBackupSectionName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBackupSectionName");
}

id objc_msgSend_getComponentData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getComponentData:");
}

id objc_msgSend_getDataSectionKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDataSectionKeys");
}

id objc_msgSend_getDictFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDictFromSection:forIdentifier:");
}

id objc_msgSend_getExtendedAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExtendedAttributes");
}

id objc_msgSend_getFileAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileAttributes");
}

id objc_msgSend_getFileSizeForItemAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileSizeForItemAtPath:");
}

id objc_msgSend_getFileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileType");
}

id objc_msgSend_getHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHash");
}

id objc_msgSend_getInstallationOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInstallationOrder");
}

id objc_msgSend_getManifestData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getManifestData:");
}

id objc_msgSend_getManifestDataFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getManifestDataFromSection:forIdentifier:");
}

id objc_msgSend_getManifestFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getManifestFromSection:forIdentifier:");
}

id objc_msgSend_getPathInUserHomeDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPathInUserHomeDirectory:");
}

id objc_msgSend_getRealPathForFile_withMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRealPathForFile:withMetaData:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSecurityCheckSectionNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSecurityCheckSectionNames");
}

id objc_msgSend_getSettingsComponentNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSettingsComponentNames");
}

id objc_msgSend_getSettingsDataFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSettingsDataFromSection:forIdentifier:");
}

id objc_msgSend_getSettingsFromSection_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSettingsFromSection:forIdentifier:");
}

id objc_msgSend_getStandAlonePackageList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStandAlonePackageList");
}

id objc_msgSend_getSystemAppDataList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemAppDataList");
}

id objc_msgSend_getSystemContainerKeyword(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemContainerKeyword");
}

id objc_msgSend_getTargetFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTargetFile");
}

id objc_msgSend_getValueFromTestPreferencesForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getValueFromTestPreferencesForKey:");
}

id objc_msgSend_getVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVersion");
}

id objc_msgSend_getappIconLayoutBackupName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getappIconLayoutBackupName");
}

id objc_msgSend_handleSystemContainerFiles_withMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSystemContainerFiles:withMetadata:");
}

id objc_msgSend_handleXPCMessage_fromConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleXPCMessage:fromConnection:");
}

id objc_msgSend_hasEntitlementMobileStoreDemod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEntitlementMobileStoreDemod:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasXattr_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasXattr:path:");
}

id objc_msgSend_iOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iOS");
}

id objc_msgSend_iOSHub(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iOSHub");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_andUserHomePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:andUserHomePath:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithManifestData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManifestData:");
}

id objc_msgSend_initWithManifestUID_deviceUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithManifestUID:deviceUID:");
}

id objc_msgSend_initWithName_andMethods_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:andMethods:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSource:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithXPCArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCArray:");
}

id objc_msgSend_initWithXPCDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCDictionary:");
}

id objc_msgSend_inputStreamWithFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputStreamWithFileAtPath:");
}

id objc_msgSend_installationOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationOrder");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isCommandAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCommandAllowed:");
}

id objc_msgSend_isContainerizedComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContainerizedComponent:");
}

id objc_msgSend_isContentRoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContentRoot:");
}

id objc_msgSend_isContentRootToRemove_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContentRootToRemove:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isItemApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isItemApp:");
}

id objc_msgSend_isItemBaseBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isItemBaseBackup:");
}

id objc_msgSend_isItemConfigurationProfile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isItemConfigurationProfile:");
}

id objc_msgSend_isItemProvisioningProfileBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isItemProvisioningProfileBackup:");
}

id objc_msgSend_isItemStandAlonePackage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isItemStandAlonePackage:");
}

id objc_msgSend_isItemSystemContainerBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isItemSystemContainerBackup:");
}

id objc_msgSend_isManualSigning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManualSigning:");
}

id objc_msgSend_isNotExtracted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNotExtracted:");
}

id objc_msgSend_isSystemContainerPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemContainerPath");
}

id objc_msgSend_isSystemContainerShared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSystemContainerShared");
}

id objc_msgSend_isValidDataContainerFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidDataContainerFile:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_isValidProductList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidProductList:");
}

id objc_msgSend_itemBeingInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemBeingInstalled");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launch");
}

id objc_msgSend_launchPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchPath");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "load");
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localStore");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_logFP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFP");
}

id objc_msgSend_logMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logMessage:");
}

id objc_msgSend_logWithFormat_andArgs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logWithFormat:andArgs:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lookupAPFSVolumeDevByName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupAPFSVolumeDevByName:");
}

id objc_msgSend_lookupSystemContainerPathUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupSystemContainerPathUUID");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_macOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "macOS");
}

id objc_msgSend_manageDataVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manageDataVolume:");
}

id objc_msgSend_manageDemoVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manageDemoVolume:");
}

id objc_msgSend_manageSnapshot_forVolumeAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manageSnapshot:forVolumeAt:");
}

id objc_msgSend_manageUserVolume_forUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manageUserVolume:forUser:");
}

id objc_msgSend_manifestUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestUID");
}

id objc_msgSend_manifestVerifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestVerifier");
}

id objc_msgSend_manifestVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestVersion");
}

id objc_msgSend_mergedBackupManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergedBackupManifest:");
}

id objc_msgSend_messageHandlerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageHandlerQueue");
}

id objc_msgSend_metadataForFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataForFile:");
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_methods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methods");
}

id objc_msgSend_migratePreferencesFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migratePreferencesFile");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_mountAPFSVolume_atMountPoint_withAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountAPFSVolume:atMountPoint:withAttributes:");
}

id objc_msgSend_mountSnapshotAt_forVolumeAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountSnapshotAt:forVolumeAt:");
}

id objc_msgSend_moveBluetoothFilesToDataShelter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveBluetoothFilesToDataShelter");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_moveSecondPartyAppFilesToDataShelter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveSecondPartyAppFilesToDataShelter");
}

id objc_msgSend_moveStagingToFinal_finalPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveStagingToFinal:finalPath:");
}

id objc_msgSend_moveUserHomeStagingToFinal_finalPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveUserHomeStagingToFinal:finalPath:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nonContainerizedContentRoots(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonContainerizedContentRoots");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objCType");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofType:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_originalPathFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalPathFor:");
}

id objc_msgSend_outputStreamToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputStreamToFileAtPath:append:");
}

id objc_msgSend_parseBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseBundleID:");
}

id objc_msgSend_parseInstallationOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseInstallationOrder");
}

id objc_msgSend_parseLocaleCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseLocaleCode");
}

id objc_msgSend_parseNonContainerizedContentRootSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseNonContainerizedContentRootSet");
}

id objc_msgSend_parseSectionForContentRoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseSectionForContentRoot:");
}

id objc_msgSend_patchDomainsPlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patchDomainsPlist:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_path_inSuperSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path:inSuperSet:");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathSet");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pathsToSkip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathsToSkip");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pipe");
}

id objc_msgSend_platformType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platformType");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prepareDirectory_writableByNonRoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareDirectory:writableByNonRoot:");
}

id objc_msgSend_prepareWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareWithCompletionHandler:");
}

id objc_msgSend_prepareWorkContainerInUserHome_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareWorkContainerInUserHome:");
}

id objc_msgSend_preserveBluetoothFileToShelter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preserveBluetoothFileToShelter:");
}

id objc_msgSend_preserveSecondPartyAppDataToShelter_withReturnErrorMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preserveSecondPartyAppDataToShelter:withReturnErrorMsg:");
}

id objc_msgSend_pressDemoTestTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pressDemoTestTarget");
}

id objc_msgSend_pressDemoXCTestProductsPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pressDemoXCTestProductsPath");
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "process");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_quitHelper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quitHelper");
}

id objc_msgSend_rOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rOS");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise");
}

id objc_msgSend_raiseInvalidProductListExceptionWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raiseInvalidProductListExceptionWithReason:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeValue");
}

id objc_msgSend_readDataOfLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataOfLength:");
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataToEndOfFile");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_readManifestFromFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readManifestFromFile:");
}

id objc_msgSend_readPlistFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readPlistFile:");
}

id objc_msgSend_reboot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reboot");
}

id objc_msgSend_registerEntitlementNotificationHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEntitlementNotificationHandler");
}

id objc_msgSend_removeAllExtendedAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllExtendedAttributes:");
}

id objc_msgSend_removeBlocklistedItemFromSection_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBlocklistedItemFromSection:withName:");
}

id objc_msgSend_removeDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDirectory:");
}

id objc_msgSend_removeFromRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromRunLoop:forMode:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
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

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeXattr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeXattr:");
}

id objc_msgSend_rescueDataBasedOnItemDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rescueDataBasedOnItemDomains:");
}

id objc_msgSend_rescueDataToShelterFromSnapshottedVolumes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rescueDataToShelterFromSnapshottedVolumes");
}

id objc_msgSend_restartBluetooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restartBluetooth");
}

id objc_msgSend_restoreAppDataAttributesUnder_containerType_identifier_manifestUID_deviceUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:");
}

id objc_msgSend_restoreAttribuesToPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAttribuesToPath:");
}

id objc_msgSend_restoreAttributesUnder_fromManifestData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAttributesUnder:fromManifestData:");
}

id objc_msgSend_restoreBackupAttributesUnder_range_manifestUID_deviceUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreBackupAttributesUnder:range:manifestUID:deviceUID:");
}

id objc_msgSend_restoreSystemContainerUUIDPathsInDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreSystemContainerUUIDPathsInDict:");
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootPath");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runAppLayoutSecurityCheck_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runAppLayoutSecurityCheck:");
}

id objc_msgSend_runFileSecurityChecksForSection_dataType_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runFileSecurityChecksForSection:dataType:options:");
}

id objc_msgSend_runPreflightChecksOnSecondPartyAppData_withReturnErrorMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runPreflightChecksOnSecondPartyAppData:withReturnErrorMsg:");
}

id objc_msgSend_runSecurityCheck_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runSecurityCheck:");
}

id objc_msgSend_runSecurityChecksForSection_dataType_componentName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runSecurityChecksForSection:dataType:componentName:options:");
}

id objc_msgSend_runSettingsSecurityCheckForSection_component_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runSettingsSecurityCheckForSection:component:");
}

id objc_msgSend_saveAsDataInXPCDictionary_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveAsDataInXPCDictionary:forKey:");
}

id objc_msgSend_scheduleInRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleInRunLoop:forMode:");
}

id objc_msgSend_secureManifestCheckForSegmentedManifest_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secureManifestCheckForSegmentedManifest:options:");
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToEndOfFile");
}

id objc_msgSend_segmentedManifestWithRigorousFlag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "segmentedManifestWithRigorousFlag");
}

id objc_msgSend_sendResponse_withPayload_forRequest_fromConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponse:withPayload:forRequest:fromConnection:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAllowedISTSignedComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedISTSignedComponents:");
}

id objc_msgSend_setAllowedSymLinks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedSymLinks:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setBlackListedPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlackListedPaths:");
}

id objc_msgSend_setBlocklistedItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlocklistedItems:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setCheckType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheckType:");
}

id objc_msgSend_setComputerNameAndHostname_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComputerNameAndHostname:encoding:");
}

id objc_msgSend_setContentRoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentRoot:");
}

id objc_msgSend_setCriticalComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCriticalComponents:");
}

id objc_msgSend_setCurrentDirectoryPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentDirectoryPath:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDemoVolumeDev_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDemoVolumeDev:");
}

id objc_msgSend_setDeviceGID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceGID:");
}

id objc_msgSend_setDeviceGroupName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceGroupName:");
}

id objc_msgSend_setDeviceUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceUID:");
}

id objc_msgSend_setDeviceUserName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceUserName:");
}

id objc_msgSend_setDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomains:");
}

id objc_msgSend_setDomainsPlistFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomainsPlistFilePath:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setFilterPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilterPredicate:");
}

id objc_msgSend_setIOS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIOS:");
}

id objc_msgSend_setInstallationOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallationOrder:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setItemBeingInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemBeingInstalled:");
}

id objc_msgSend_setLaunchPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchPath:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocaleCodeStr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocaleCodeStr:");
}

id objc_msgSend_setLogFP_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogFP:");
}

id objc_msgSend_setMacOS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMacOS:");
}

id objc_msgSend_setManifestUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifestUID:");
}

id objc_msgSend_setManifestVerifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifestVerifier:");
}

id objc_msgSend_setManifestVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifestVersion:");
}

id objc_msgSend_setMessageHandlerQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageHandlerQueue:");
}

id objc_msgSend_setMetadata_forFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:forFile:");
}

id objc_msgSend_setMethods_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMethods:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNonContainerizedContentRoots_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNonContainerizedContentRoots:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPathsToSkip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPathsToSkip:");
}

id objc_msgSend_setPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayload:");
}

id objc_msgSend_setPlatformType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatformType:");
}

id objc_msgSend_setPlatformWithManifestProductList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatformWithManifestProductList:");
}

id objc_msgSend_setPreferencesForKey_withValue_forApplication_andUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferencesForKey:withValue:forApplication:andUser:");
}

id objc_msgSend_setROS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setROS:");
}

id objc_msgSend_setRootPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootPath:");
}

id objc_msgSend_setSegmentedManifestWithRigorousFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSegmentedManifestWithRigorousFlag:");
}

id objc_msgSend_setSettingsComponentNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSettingsComponentNames:");
}

id objc_msgSend_setSignedManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSignedManifest:");
}

id objc_msgSend_setSigningKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSigningKey:");
}

id objc_msgSend_setStaggeredContentUpdateEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStaggeredContentUpdateEnabled:");
}

id objc_msgSend_setStandardOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStandardOutput:");
}

id objc_msgSend_setTestScripts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestScripts:");
}

id objc_msgSend_setTestScriptsLastModified_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestScriptsLastModified:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTvOS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTvOS:");
}

id objc_msgSend_setUserHomePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserHomePath:");
}

id objc_msgSend_setWatchOS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWatchOS:");
}

id objc_msgSend_setWhitelistChecker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWhitelistChecker:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_settingsComponentNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsComponentNames");
}

id objc_msgSend_setupDemoVolume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDemoVolume");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldRestoreSystemContainer_WatchAndTV_shared_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreSystemContainer_WatchAndTV:shared:");
}

id objc_msgSend_shouldRestoreSystemContainer_iOS_shared_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRestoreSystemContainer_iOS:shared:");
}

id objc_msgSend_shouldRunManifestRigorousTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRunManifestRigorousTest");
}

id objc_msgSend_signedManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signedManifest");
}

id objc_msgSend_signedManifestFromManifestData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signedManifestFromManifestData:");
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipDescendants");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByExpandingTildeInPath");
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByRemovingPercentEncoding");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
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

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_switchToBackupFolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToBackupFolder");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_targetFileWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetFileWithPath:");
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationStatus");
}

id objc_msgSend_testScripts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testScripts");
}

id objc_msgSend_testScriptsLastModified(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testScriptsLastModified");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_touchFile_fileAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchFile:fileAttributes:");
}

id objc_msgSend_tvOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tvOS");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unmountAPFSVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountAPFSVolume:");
}

id objc_msgSend_unmountSnapshotAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountSnapshotAt:");
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

id objc_msgSend_updateSignedManifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSignedManifest");
}

id objc_msgSend_userHomePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userHomePath");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validateISTSignedApp_manifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateISTSignedApp:manifest:");
}

id objc_msgSend_validateInstallationOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateInstallationOrder");
}

id objc_msgSend_valueForExtendedAttributesKey_forPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForExtendedAttributesKey:forPath:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_verifyManifestSignature_forDataSectionKeys_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyManifestSignature:forDataSectionKeys:withOptions:");
}

id objc_msgSend_waitForSnapshotDeletionOnVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForSnapshotDeletionOnVolume:");
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilExit");
}

id objc_msgSend_watchOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchOS");
}

id objc_msgSend_whitelistChecker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitelistChecker");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeDictionary_toFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDictionary:toFile:");
}

id objc_msgSend_writeNVRam_withValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeNVRam:withValue:");
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePropertyList:toStream:format:options:error:");
}

id objc_msgSend_xpcArrayFromArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcArrayFromArray");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}
