void sub_20D4C969C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id QLPreviewCopyEmbeddedIWorkData(void *a1, void *a2, void *a3, void *a4)
{
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  id *v26;
  QLZipArchive *v27;
  NSObject *v28;
  void *v29;
  QLZipArchive *v30;
  id v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  const __CFString *v36;
  __int128 v37;
  id obj;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  __CFString *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  id v67;
  uint8_t v68[24];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v40 = a2;
  v44 = a3;
  v42 = a4;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  v63 = 0;
  -[__CFString path](v7, "path");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v8 = *MEMORY[0x24BDBCC60];
  v56 = 0;
  LOBYTE(a4) = -[__CFString getResourceValue:forKey:error:](v7, "getResourceValue:forKey:error:", &v57, v8, &v56);
  v43 = v57;
  v41 = v56;
  if ((a4 & 1) == 0)
  {
    generationLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      QLPreviewCopyEmbeddedIWorkData_cold_2();

    v22 = v7 == 0;
    goto LABEL_25;
  }
  if (!v7)
  {
    v22 = 1;
    goto LABEL_25;
  }
  if (!objc_msgSend(v43, "BOOLValue"))
    goto LABEL_20;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v42;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
  if (!v9)
    goto LABEL_19;
  v11 = *(_QWORD *)v53;
  v12 = *MEMORY[0x24BDD0B88];
  *(_QWORD *)&v10 = 138412290;
  v37 = v10;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v53 != v11)
        objc_enumerationMutation(obj);
      -[__CFString URLByAppendingPathComponent:](v7, "URLByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v37);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x24BDBCE50]);
      v51 = 0;
      v16 = objc_msgSend(v15, "initWithContentsOfURL:options:error:", v14, 1, &v51);
      v17 = (__CFString *)v51;
      v18 = (void *)v59[5];
      v59[5] = v16;

      if (v59[5])
      {
        generationLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D4C7000, v33, OS_LOG_TYPE_INFO, "Returning thumbnail or preview found inside iWork bundle", buf, 2u);
        }

        v22 = 0;
        v24 = 0;
        goto LABEL_26;
      }
      -[__CFString domain](v17, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", v12))
      {
        v20 = -[__CFString code](v17, "code") == 4;

        if (v20)
          goto LABEL_17;
      }
      else
      {

      }
      generationLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v37;
        v65 = v17;
        _os_log_error_impl(&dword_20D4C7000, v21, OS_LOG_TYPE_ERROR, "Couldn't read thumbnail or preview inside iWork bundle: %@", buf, 0xCu);
      }

LABEL_17:
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
    if (v9)
      continue;
    break;
  }
LABEL_19:

LABEL_20:
  v22 = 0;
LABEL_25:
  v24 = 1;
LABEL_26:
  if (!v59[5])
  {
    generationLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4C7000, v25, OS_LOG_TYPE_INFO, "No iWork thumbnail or preview found inside bundle", buf, 2u);
    }

  }
  if (!v24)
  {
LABEL_40:
    v32 = (id)v59[5];
    goto LABEL_48;
  }
  if (!+[QLUTIManager contentTypeIsIWorkType:](QLUTIManager, "contentTypeIsIWorkType:", v44))
    goto LABEL_47;
  if (!v22)
  {
    generationLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v39, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      QLPreviewCopyEmbeddedIWorkData_cold_1(v29, v68, v28);
    }

    v50 = 0;
    v26 = (id *)&v50;
    v27 = -[QLZipArchive initWithURL:error:]([QLZipArchive alloc], "initWithURL:error:", v7, &v50);
LABEL_38:
    v30 = v27;
    v31 = *v26;
    if (!v30)
      goto LABEL_45;
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __QLPreviewCopyEmbeddedIWorkData_block_invoke;
    v45[3] = &unk_24C71AE88;
    v46 = v42;
    v48 = &v58;
    v47 = v7;
    -[QLZipArchive enumerateEntriesWithHandler:](v30, "enumerateEntriesWithHandler:", v45);

    goto LABEL_40;
  }
  if (v40)
  {
    v49 = 0;
    v26 = (id *)&v49;
    v27 = -[QLZipArchive initWithData:error:]([QLZipArchive alloc], "initWithData:error:", v40, &v49);
    goto LABEL_38;
  }
  v31 = 0;
LABEL_45:
  generationLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v36 = CFSTR("archive data");
    if (!v22)
      v36 = v7;
    *(_DWORD *)buf = 138412546;
    v65 = v36;
    v66 = 2112;
    v67 = v31;
    _os_log_error_impl(&dword_20D4C7000, v34, OS_LOG_TYPE_ERROR, "Hit error trying to read %@: %@", buf, 0x16u);
  }

LABEL_47:
  v32 = 0;
LABEL_48:

  _Block_object_dispose(&v58, 8);
  return v32;
}

void sub_20D4CA168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
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

id generationLog()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x24BDE5F50];
  v1 = *(void **)(MEMORY[0x24BDE5F50] + 112);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 112);
  }
  return v1;
}

id QLPreviewCopyEmbeddedIWorkThumbnailDataInFile(void *a1, void *a2)
{
  return QLPreviewCopyEmbeddedIWorkData(a1, 0, a2, &unk_24C71F720);
}

id QLPreviewCopyEmbeddedIWorkThumbnailDataInData(void *a1, void *a2)
{
  return QLPreviewCopyEmbeddedIWorkData(0, a1, a2, &unk_24C71F738);
}

id QLPreviewCopyEmbeddedPDF(void *a1, void *a2)
{
  return QLPreviewCopyEmbeddedIWorkData(a1, 0, a2, &unk_24C71F750);
}

id QLFrameworkBundle()
{
  if (QLFrameworkBundle_onceToken != -1)
    dispatch_once(&QLFrameworkBundle_onceToken, &__block_literal_global);
  return (id)QLFrameworkBundle_QLBundle;
}

uint64_t QLGuessEncodingForTextFileFromData(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  const char *Name;
  const __CFString *v8;
  const __CFString *v9;
  CFStringEncoding v10;
  unsigned int v11;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") <= 0x400)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "subdataWithRange:", 0, 1024);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  v4 = 134217984;
  ucsdet_open();
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  ucsdet_setText();
  if (ucsdet_detect()
    && (Name = (const char *)ucsdet_getName()) != 0
    && (v8 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], Name, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258])) != 0)
  {
    v9 = v8;
    v10 = CFStringConvertIANACharSetNameToEncoding(v8);
    CFRelease(v9);
    ucsdet_close();
    if (v10 == 2561)
      v11 = 1056;
    else
      v11 = v10;
    if (v10 == -1)
      v4 = 134217984;
    else
      v4 = v11;
  }
  else
  {
    ucsdet_close();
  }

  return v4;
}

uint64_t QLGuessEncodingForTextFileAtURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  id v19;
  id v20;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v2, "attributesOfItemAtPath:error:", v3, &v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v20;
    v6 = (void *)objc_msgSend(v4, "mutableCopy");

    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("NSFileExtendedAttributes"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        v9 = objc_alloc(MEMORY[0x24BDD17C8]);
        -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("com.apple.TextEncoding"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithData:encoding:", v10, 4);

        v12 = objc_msgSend(v11, "rangeOfString:options:", CFSTR(";"), 4);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_9:
          goto LABEL_10;
        }
        objc_msgSend(v11, "substringFromIndex:", v12 + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v18, "integerValue");

        if ((_DWORD)v13 != -1)
        {
          v15 = v5;
LABEL_15:

          goto LABEL_16;
        }
      }
LABEL_10:
      v19 = v5;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:maxLength:error:", v1, 1, 1024, &v19);
      v15 = v19;

      if (!v14)
      {
        generationLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          QLGuessEncodingForTextFileAtURL_cold_1();

      }
      v13 = QLGuessEncodingForTextFileFromData(v14);

      goto LABEL_15;
    }
    generationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      QLGuessEncodingForTextFileAtURL_cold_2();
    goto LABEL_9;
  }
  v13 = 134217984;
LABEL_16:

  return v13;
}

const void *_QLDictionaryValueForKey(const __CFDictionary *a1, const void *a2, CFTypeID a3, uint64_t a4)
{
  const void *Value;
  const void *v7;
  CFTypeID v8;
  CFStringRef v9;
  CFStringRef v10;

  if (!a1)
    return (const void *)a4;
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
    return (const void *)a4;
  v7 = Value;
  v8 = CFGetTypeID(Value);
  if (v8 != a3)
  {
    v9 = CFCopyTypeIDDescription(v8);
    v10 = CFCopyTypeIDDescription(a3);
    if (v9)
      CFRelease(v9);
    if (v10)
      CFRelease(v10);
    return (const void *)a4;
  }
  return v7;
}

uint64_t _QLSDictionaryBooleanValueForKey(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFBoolean *Value;
  const __CFBoolean *v5;
  CFTypeID v6;

  if (a1
    && (Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2)) != 0
    && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFBooleanGetTypeID()))
  {
    return CFBooleanGetValue(v5);
  }
  else
  {
    return a3;
  }
}

void _QLSDictionarySetBooleanValueForKey(__CFDictionary *a1, const void *a2, int a3)
{
  const void **v3;

  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(a1, a2, *v3);
}

uint64_t _QLDictionaryIntValueForKey(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  unsigned int valuePtr;

  v3 = a3;
  valuePtr = a3;
  if (a1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetIntValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, int a4)
{
  CFNumberRef v6;
  CFNumberRef v7;
  int valuePtr;

  valuePtr = a4;
  v6 = CFNumberCreate(a1, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

double _QLDictionaryCGFloatValueForKey(const __CFDictionary *a1, const void *a2, double a3)
{
  double v3;
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  double valuePtr;

  v3 = a3;
  valuePtr = a3;
  if (a1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberCGFloatType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetCGFloatValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, double a4)
{
  CFNumberRef v6;
  CFNumberRef v7;
  double valuePtr;

  valuePtr = a4;
  v6 = CFNumberCreate(a1, kCFNumberCGFloatType, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

float _QLDictionaryFloatValueForKey(const __CFDictionary *a1, const void *a2, float a3)
{
  float v3;
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  float valuePtr;

  v3 = a3;
  valuePtr = a3;
  if (a1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloatType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetFloatValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, float a4)
{
  CFNumberRef v6;
  CFNumberRef v7;
  float valuePtr;

  valuePtr = a4;
  v6 = CFNumberCreate(a1, kCFNumberFloatType, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

uint64_t _QLDictionarySInt32ValueForKey(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  unsigned int valuePtr;

  v3 = a3;
  valuePtr = a3;
  if (a1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetSInt32ValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, int a4)
{
  CFNumberRef v6;
  CFNumberRef v7;
  int valuePtr;

  valuePtr = a4;
  v6 = CFNumberCreate(a1, kCFNumberSInt32Type, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

const __CFDictionary *_QLSDictionaryGetPointValueForKey(const __CFDictionary *result, const void *a2, CGPoint *a3)
{
  const __CFDictionary *v4;
  CFTypeID v5;

  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v4 = result;
      v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID())
        return (const __CFDictionary *)CGPointMakeWithDictionaryRepresentation(v4, a3);
      else
        return 0;
    }
  }
  return result;
}

void _QLSDictionarySetPointValueForKey(__CFDictionary *a1, const void *a2, double a3, double a4)
{
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v7;

  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(*(CGPoint *)&a3);
  if (DictionaryRepresentation)
  {
    v7 = DictionaryRepresentation;
    CFDictionarySetValue(a1, a2, DictionaryRepresentation);
    CFRelease(v7);
  }
}

const __CFDictionary *_QLSDictionaryGetSizeValueForKey(const __CFDictionary *result, const void *a2, CGSize *a3)
{
  const __CFDictionary *v4;
  CFTypeID v5;

  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v4 = result;
      v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID())
        return (const __CFDictionary *)CGSizeMakeWithDictionaryRepresentation(v4, a3);
      else
        return 0;
    }
  }
  return result;
}

void _QLSDictionarySetSizeValueForKey(__CFDictionary *a1, const void *a2, double a3, double a4)
{
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v7;

  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&a3);
  if (DictionaryRepresentation)
  {
    v7 = DictionaryRepresentation;
    CFDictionarySetValue(a1, a2, DictionaryRepresentation);
    CFRelease(v7);
  }
}

const __CFDictionary *_QLSDictionaryGetRectValueForKey(const __CFDictionary *result, const void *a2, CGRect *a3)
{
  const __CFDictionary *v4;
  CFTypeID v5;

  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      v4 = result;
      v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID())
        return (const __CFDictionary *)CGRectMakeWithDictionaryRepresentation(v4, a3);
      else
        return 0;
    }
  }
  return result;
}

void _QLSDictionarySetRectValueForKey(__CFDictionary *a1, const void *a2, double a3, double a4, double a5, double a6)
{
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v9;

  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&a3);
  if (DictionaryRepresentation)
  {
    v9 = DictionaryRepresentation;
    CFDictionarySetValue(a1, a2, DictionaryRepresentation);
    CFRelease(v9);
  }
}

void _QLDictionarySetValueForKeyIfExists(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  if (value)
    CFDictionarySetValue(theDict, key, value);
}

uint64_t _QLSAppPreferencesBooleanValueForKey(const __CFString *a1, unsigned int a2)
{
  const __CFString *v4;
  uint64_t result;
  _BOOL4 v6;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v4 = (const __CFString *)*MEMORY[0x24BDBD580];
  result = CFPreferencesGetAppBooleanValue(a1, (CFStringRef)*MEMORY[0x24BDBD580], &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    v6 = CFPreferencesGetAppIntegerValue(a1, v4, &keyExistsAndHasValidFormat) != 0;
    if (keyExistsAndHasValidFormat)
      return v6;
    else
      return a2;
  }
  return result;
}

uint64_t _QLSAppPreferencesIntValueForKey(const __CFString *a1, uint64_t a2)
{
  uint64_t v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  CFTypeID v5;
  CFTypeID v6;
  unsigned int valuePtr;

  v2 = a2;
  valuePtr = a2;
  v3 = (const __CFNumber *)CFPreferencesCopyAppValue(a1, (CFStringRef)*MEMORY[0x24BDBD580]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    }
    else
    {
      v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID())
        valuePtr = CFStringGetIntValue((CFStringRef)v4);
    }
    CFRelease(v4);
    return valuePtr;
  }
  return v2;
}

uint64_t _QLSAppPreferencesCFIndexValueForKey(const __CFString *a1, uint64_t a2)
{
  uint64_t v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  CFTypeID v5;
  CFTypeID v6;
  uint64_t valuePtr;

  v2 = a2;
  valuePtr = a2;
  v3 = (const __CFNumber *)CFPreferencesCopyAppValue(a1, (CFStringRef)*MEMORY[0x24BDBD580]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberCFIndexType, &valuePtr);
    }
    else
    {
      v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID())
        valuePtr = CFStringGetIntValue((CFStringRef)v4);
    }
    CFRelease(v4);
    return valuePtr;
  }
  return v2;
}

uint64_t _QLSGlobalQuickLookPreferencesBooleanValueForKey(const __CFString *a1, uint64_t Value)
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;

  v3 = (const __CFBoolean *)CFPreferencesCopyValue(a1, CFSTR("com.apple.quicklook"), (CFStringRef)*MEMORY[0x24BDBD578], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID())
      Value = CFBooleanGetValue(v4);
    CFRelease(v4);
  }
  return Value;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id extensionLog()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x24BDE5F50];
  v1 = *(void **)(MEMORY[0x24BDE5F50] + 136);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 136);
  }
  return v1;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20D4CBA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

id _log()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x24BDE5F50];
  v1 = *(void **)(MEMORY[0x24BDE5F50] + 128);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 128);
  }
  return v1;
}

CGColorSpaceRef QLDrawGrayLinearGradient(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13)
{
  CGColorSpaceRef result;
  const void *v30;
  CGGradient *v31;
  CGFloat components[5];
  CGPoint v33;
  CGPoint v34;
  CGRect v35;

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  result = CGColorSpaceCreateDeviceGray();
  if (result)
  {
    v30 = result;
    components[0] = a8;
    components[1] = a9;
    components[2] = a12;
    components[3] = a13;
    v31 = CGGradientCreateWithColorComponents(result, components, 0, 2uLL);
    CFRelease(v30);
    if (v31)
    {
      CGContextSaveGState(a1);
      v35.origin.x = a2;
      v35.origin.y = a3;
      v35.size.width = a4;
      v35.size.height = a5;
      CGContextClipToRect(a1, v35);
      v33.x = a6;
      v33.y = a7;
      v34.x = a10;
      v34.y = a11;
      CGContextDrawLinearGradient(a1, v31, v33, v34, 0);
      CGContextRestoreGState(a1);
      CFRelease(v31);
      return (CGColorSpaceRef)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t QLDrawLinearGradient(CGColor *a1, void *a2, CGContext *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  CGColorSpace *ColorSpace;
  const __CFArray *v23;
  CGGradient *v24;
  void *values[3];
  CGPoint v27;
  CGPoint v28;
  CGRect v29;

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  ColorSpace = CGColorGetColorSpace(a1);
  values[0] = a1;
  values[1] = a2;
  v23 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x24BDBD690]);
  v24 = CGGradientCreateWithColors(ColorSpace, v23, 0);
  CFRelease(v23);
  if (!v24)
    return 0;
  CGContextSaveGState(a3);
  v29.origin.x = a4;
  v29.origin.y = a5;
  v29.size.width = a6;
  v29.size.height = a7;
  CGContextClipToRect(a3, v29);
  v27.x = a8;
  v27.y = a9;
  v28.x = a10;
  v28.y = a11;
  CGContextDrawLinearGradient(a3, v24, v27, v28, 0);
  CGContextRestoreGState(a3);
  CFRelease(v24);
  return 1;
}

double QLFillOrExceedAtLeastOneDimensionOfSizeInSize(int a1, double result, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double v7;
  double v8;

  if (a3 != 0.0)
  {
    v5 = result;
    if (result != 0.0 && a5 != 0.0 && a4 != 0.0)
    {
      if (a5 >= a3)
      {
        return a4;
      }
      else
      {
        result = a4;
        if (a4 < v5)
        {
          v6 = a3 / a5;
          if (a3 / a5 > v5 / a4)
            v6 = v5 / a4;
          v7 = round(a4 * v6 * 1000000.0) / 1000000.0;
          v8 = ceil(v7);
          if (a1)
            result = v8;
          else
            result = v7;
          if (result < 1.0)
            return 1.0;
        }
      }
    }
  }
  return result;
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

double QLAdaptSizeInSizeWithRounding(int a1, double (*a2)(double), double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;

  v6 = a3;
  if (a4 != 0.0 && a3 != 0.0 && a6 != 0.0 && a5 != 0.0)
  {
    if (a1 || a6 > a4 || a5 > a3)
    {
      if (a4 / a6 <= a3 / a5)
      {
        v8 = round(a5 * (a4 / a6) * 1000000.0);
        v6 = v8 / 1000000.0;
        if (a2)
          v6 = a2(v8 / 1000000.0);
      }
      else
      {
        v7 = round(a6 * (a3 / a5) * 1000000.0);
        if (a2)
          a2(v7 / 1000000.0);
      }
      if (v6 < 1.0)
        return 1.0;
    }
    else
    {
      return a5;
    }
  }
  return v6;
}

double QLAdaptSizeInSize(int a1, int a2, double a3, double a4, double a5, double a6)
{
  double (*v6)(double);

  if (a2)
    v6 = CGFloor;
  else
    v6 = 0;
  return QLAdaptSizeInSizeWithRounding(a1, v6, a3, a4, a5, a6);
}

double CGFloor(double a1)
{
  return floor(a1);
}

double QLAdaptSizeOutSizeWithRounding(int a1, double (*a2)(double), double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;

  v6 = a3;
  if (a4 != 0.0 && a3 != 0.0 && a6 != 0.0 && a5 != 0.0)
  {
    if (a1 || a6 < a4 || a5 < a3)
    {
      if (a4 / a6 >= a3 / a5)
      {
        v8 = round(a5 * (a4 / a6) * 1000000.0);
        v6 = v8 / 1000000.0;
        if (a2)
          v6 = a2(v8 / 1000000.0);
      }
      else
      {
        v7 = round(a6 * (a3 / a5) * 1000000.0);
        if (a2)
          a2(v7 / 1000000.0);
      }
      if (v6 < 1.0)
        return 1.0;
    }
    else
    {
      return a5;
    }
  }
  return v6;
}

double QLAdaptSizeOutSize(int a1, int a2, double a3, double a4, double a5, double a6)
{
  double (*v6)(double);

  if (a2)
    v6 = CGFloor;
  else
    v6 = 0;
  return QLAdaptSizeOutSizeWithRounding(a1, v6, a3, a4, a5, a6);
}

CGFloat QLAdaptSizeToRectWithRounding2(int a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9)
{
  uint64_t v17;
  double (**v18)(_QWORD, double, __n128);
  double (**v19)(_QWORD, double);
  double v20;
  double v21;
  __n128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double Height;
  CGFloat Width;
  _QWORD v33[5];
  _QWORD v34[5];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v17 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __QLAdaptSizeToRectWithRounding2_block_invoke;
  v34[3] = &__block_descriptor_40_e8_d16__0d8l;
  v34[4] = a3;
  v18 = (double (**)(_QWORD, double, __n128))MEMORY[0x212BA28B4](v34);
  v33[0] = v17;
  v33[1] = 3221225472;
  v33[2] = __QLAdaptSizeToRectWithRounding2_block_invoke_2;
  v33[3] = &__block_descriptor_40_e8_d16__0d8l;
  v33[4] = a2;
  v19 = (double (**)(_QWORD, double))MEMORY[0x212BA28B4](v33);
  if (a8 <= 0.0 || a9 <= 0.0)
  {
    v39.origin.x = a4;
    v39.origin.y = a5;
    v39.size.width = a6;
    v39.size.height = a7;
    Width = CGRectGetWidth(v39);
    v29 = v19[2](v19, Width * 0.5);
    v40.origin.x = a4;
    v40.origin.y = a5;
    v40.size.width = a6;
    v40.size.height = a7;
    Height = CGRectGetHeight(v40);
  }
  else
  {
    v35.origin.x = a4;
    v35.origin.y = a5;
    v35.size.width = a6;
    v35.size.height = a7;
    v20 = CGRectGetWidth(v35) / a8;
    v36.origin.x = a4;
    v36.origin.y = a5;
    v36.size.width = a6;
    v36.size.height = a7;
    v21 = CGRectGetHeight(v36) / a9;
    if (v20 >= v21)
      v22.n128_f64[0] = v21;
    else
      v22.n128_f64[0] = v20;
    if (v20 >= v21)
      v21 = v20;
    if (a1)
      v23 = v22.n128_f64[0];
    else
      v23 = v21;
    v24 = v18[2](v18, a8 * v23, v22);
    if (v24 >= 1.0)
      v25 = v24;
    else
      v25 = 1.0;
    v26 = ((double (*)(double (**)(_QWORD, double, __n128), double))v18[2])(v18, a9 * v23);
    if (v26 >= 1.0)
      v27 = v26;
    else
      v27 = 1.0;
    v37.origin.x = a4;
    v37.origin.y = a5;
    v37.size.width = a6;
    v37.size.height = a7;
    v28 = CGRectGetWidth(v37);
    v29 = v19[2](v19, (v28 - v25) * 0.5);
    v38.origin.x = a4;
    v38.origin.y = a5;
    v38.size.width = a6;
    v38.size.height = a7;
    Height = CGRectGetHeight(v38) - v27;
  }
  v19[2](v19, Height * 0.5);

  return a4 + v29;
}

CGFloat QLAdaptSizeToRectWithRounding(int a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  return QLAdaptSizeToRectWithRounding2(a1, a2, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat QLAdaptSizeToRect(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7)
{
  return QLAdaptSizeToRectWithRounding2(a1, (uint64_t)CGFloor, (uint64_t)CGFloor, a2, a3, a4, a5, a6, a7);
}

double QLScaleRect(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

CGFloat QLAdjustRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double Width;
  CGFloat v16;
  double v17;
  double Height;
  double MinX;
  double MaxX;
  double v21;
  double MaxY;
  double MinY;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  Width = CGRectGetWidth(*(CGRect *)&a1);
  rect = a5;
  v27.origin.x = a5;
  v16 = a8;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  if (Width > CGRectGetWidth(v27))
    return a1;
  v17 = a1;
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  Height = CGRectGetHeight(v28);
  v29.origin.x = rect;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = v16;
  if (Height <= CGRectGetHeight(v29))
  {
    v30.origin.x = rect;
    v30.origin.y = a6;
    v30.size.width = a7;
    v30.size.height = v16;
    v45.origin.x = a1;
    v45.origin.y = a2;
    v45.size.width = a3;
    v45.size.height = a4;
    if (!CGRectContainsRect(v30, v45))
    {
      v31.origin.x = a1;
      v31.origin.y = a2;
      v31.size.width = a3;
      v31.size.height = a4;
      MinX = CGRectGetMinX(v31);
      v32.origin.x = rect;
      v32.origin.y = a6;
      v32.size.width = a7;
      v32.size.height = v16;
      if (MinX < CGRectGetMinX(v32))
      {
        v33.origin.x = rect;
        v33.origin.y = a6;
        v33.size.width = a7;
        v33.size.height = v16;
        v17 = CGRectGetMinX(v33);
      }
      v34.origin.x = v17;
      v34.origin.y = a2;
      v34.size.width = a3;
      v34.size.height = a4;
      MinY = CGRectGetMinY(v34);
      v35.origin.x = rect;
      v35.origin.y = a6;
      v35.size.width = a7;
      v35.size.height = v16;
      if (MinY < CGRectGetMinY(v35))
      {
        v36.origin.x = rect;
        v36.origin.y = a6;
        v36.size.width = a7;
        v36.size.height = v16;
        a2 = CGRectGetMinY(v36);
      }
      v37.origin.x = v17;
      v37.origin.y = a2;
      v37.size.width = a3;
      v37.size.height = a4;
      MaxX = CGRectGetMaxX(v37);
      v38.origin.x = rect;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = v16;
      if (MaxX > CGRectGetMaxX(v38))
      {
        v39.origin.x = rect;
        v39.origin.y = a6;
        v39.size.width = a7;
        v39.size.height = v16;
        v21 = CGRectGetMaxX(v39);
        v40.origin.x = v17;
        v40.origin.y = a2;
        v40.size.width = a3;
        v40.size.height = a4;
        v17 = v21 - CGRectGetWidth(v40);
      }
      v41.origin.x = v17;
      v41.origin.y = a2;
      v41.size.width = a3;
      v41.size.height = a4;
      MaxY = CGRectGetMaxY(v41);
      v42.origin.x = rect;
      v42.origin.y = a6;
      v42.size.width = a7;
      v42.size.height = v16;
      if (MaxY > CGRectGetMaxY(v42))
      {
        v43.origin.x = rect;
        v43.origin.y = a6;
        v43.size.width = a7;
        v43.size.height = v16;
        CGRectGetMaxY(v43);
        v44.origin.x = v17;
        v44.origin.y = a2;
        v44.size.width = a3;
        v44.size.height = a4;
        CGRectGetHeight(v44);
      }
    }
  }
  return v17;
}

void QLDrawDebugRect(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGPoint points;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x24BDAC8D0];
  CGContextSaveGState(a1);
  QLContextSetRGBStrokeColor(a1, a6, a7, a8, 1.0);
  CGContextSetLineWidth(a1, 2.0);
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  CGContextStrokeRect(a1, v24);
  points.x = a2;
  points.y = a3;
  v17 = a2 + a4;
  v18 = a3 + a5;
  v19 = a2;
  v20 = a3 + a5;
  v21 = a2 + a4;
  v22 = a3;
  CGContextStrokeLineSegments(a1, &points, 4uLL);
  CGContextRestoreGState(a1);
}

void QLDrawLockIcon(CGContext *a1, CGFloat a2, CGFloat a3, double a4, double a5, double a6, double a7)
{
  CGFloat v12;
  CGFloat v13;
  CGColor *GenericGray;
  void *v15;
  void *v16;
  CGImage *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v12 = a4 * a7;
  v13 = a5 * a7;
  GenericGray = CGColorCreateGenericGray(0.98, 1.0);
  CGContextSetFillColorWithColor(a1, GenericGray);
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = v12;
  v25.size.height = v13;
  CGContextFillRect(a1, v25);
  CFRelease(GenericGray);
  v24 = (id)objc_opt_new();
  objc_msgSend(v24, "setPointSize:", a6);
  objc_msgSend(v24, "setSymbolWeight:", 6);
  objc_msgSend(v24, "setScale:", a7);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A68]), "initWithSymbolName:bundleURL:", CFSTR("lock.fill"), 0);
  objc_msgSend(v15, "imageForDescriptor:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (CGImage *)objc_msgSend(v16, "CGImage");

  CGImageGetSizeAfterOrientation();
  v19 = v18;
  v21 = v20;
  v26.origin.x = a2;
  v26.origin.y = a3;
  v26.size.width = v12;
  v26.size.height = v13;
  v22 = CGRectGetMidX(v26) - v19 * 0.5;
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = v12;
  v27.size.height = v13;
  v23 = CGRectGetMidY(v27) - v21 * 0.5;
  CGContextSetAlpha(a1, 0.36);
  v28.origin.x = v22;
  v28.origin.y = v23;
  v28.size.width = v19;
  v28.size.height = v21;
  CGContextDrawImage(a1, v28, v17);

}

CGPDFPage *QLGetCGPDFPageRect(CGPDFPage *result, CGPDFBox a2)
{
  CGPDFPage *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect BoxRect;
  CGRect v8;
  CGRect v9;

  if (result)
  {
    v2 = result;
    BoxRect = CGPDFPageGetBoxRect(result, a2);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    v9 = CGPDFPageGetBoxRect(v2, kCGPDFMediaBox);
    v8.origin.x = x;
    v8.origin.y = y;
    v8.size.width = width;
    v8.size.height = height;
    CGRectIntersection(v8, v9);
    return (CGPDFPage *)CGPDFPageGetRotationAngle(v2);
  }
  return result;
}

double QLGetCGPDFPageProxyRect(void *a1, uint64_t a2, int a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "rectForBox:", a2);
    v8 = v7;
    objc_msgSend(v6, "rotation");
    if (a3)
      v8 = *MEMORY[0x24BDBEFB0];
  }
  else
  {
    v8 = *MEMORY[0x24BDBF090];
  }

  return v8;
}

CGFloat QLDrawPDFPage(CGContext *a1, void *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  return QLDrawCGPDFPage(a1, (CGPDFPage *)objc_msgSend(a2, "pageRef"), a3, a4, a5, a6, a7);
}

CGFloat QLDrawCGPDFPage(CGContext *a1, CGPDFPage *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v19;
  CGRect v20;

  QLContextSetGrayFillColor(a1, 1.0, 1.0);
  v19.origin.x = a4;
  v19.origin.y = a5;
  v19.size.width = a6;
  v19.size.height = a7;
  CGContextFillRect(a1, v19);
  QLGetCGPDFDrawRect(a2, a3, a4, a5, a6, a7);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (CGRectIsEmpty(v20))
    return *MEMORY[0x24BDBF090];
  QLDrawCGPDFPageInRect(a1, (CGAffineTransform *)a2, a3, x, y, width, height);
  return x;
}

CGPDFPage *QLGetPDFPageRect(void *a1, CGPDFBox a2)
{
  return QLGetCGPDFPageRect((CGPDFPage *)objc_msgSend(a1, "pageRef"), a2);
}

void QLGetCGPDFDrawRect(CGPDFPage *a1, CGPDFBox a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v10;
  double v11;

  QLGetCGPDFPageRect(a1, a2);
  if (v10 > 0.0)
    QLAdaptSizeToRectWithRounding2(1, (uint64_t)CGFloor, (uint64_t)CGCeiling, a3, a4, a5, a6, v10, v11);
}

double QLGetThumbnailSizeSatisfyingParameters(int a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v14;
  double v15;

  v7 = a3;
  v8 = a2;
  v9 = a6 * a7;
  if (a2 <= a6 * a7 || a3 <= v9)
  {
    if (a2 >= a3)
      a2 = a3;
    v11 = floor(v9 / a2);
    v8 = ceil(v8 * v11);
    v7 = ceil(a3 * v11);
  }
  else
  {
    v12 = a5 * a7;
    if (a2 >= a4 * a7 || v7 >= v12)
    {
      v14 = QLAdaptSizeInSizeWithRounding(0, 0, a4 * a7, v12, a2, v7);
      if (v14 < v9 || v15 < v9)
        return floor(QLAdaptSizeOutSizeWithRounding(1, 0, v9, v9, v14, v15));
      else
        return ceil(v14);
    }
  }
  if (a1)
    return QLFillOrExceedAtLeastOneDimensionOfSizeInSize(1, a4, a5, v8, v7);
  return v8;
}

CGFloat QLGetPDFDrawingTransformWithThumbnailSize@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D4>, double a5@<D5>, CGFloat a6, CGFloat a7, double a8, double a9)
{
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat MinY;
  __int128 v17;
  __int128 v18;
  CGFloat result;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  if (a5 <= a9)
    v10 = 0.0;
  else
    v10 = a5 - a9;
  if (a4 <= a8)
    v11 = 0.0;
  else
    v11 = (a4 - a8) * 0.5;
  v12 = a4 / a2;
  v13 = a5 / a3;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  if (v12 >= v13)
    v14 = v12;
  else
    v14 = v13;
  *(_OWORD *)a1 = 0uLL;
  v22.origin.x = a6;
  v22.origin.y = a7;
  v22.size.width = a8;
  v22.size.height = a9;
  v15 = CGRectGetMinX(v22) - v11;
  v23.origin.x = a6;
  v23.origin.y = a7;
  v23.size.width = a8;
  v23.size.height = a9;
  MinY = CGRectGetMinY(v23);
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, v15, MinY - v10);
  v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, v14, v14);
  v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  result = v21.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  return result;
}

BOOL QLGetDrawRectAndTransformWithMinimumDimension(uint64_t a1, _OWORD *a2, double a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11)
{
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  _OWORD v41[3];

  if (a5 <= 0.0)
  {
    if (a1)
    {
      v37 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
      *(_OWORD *)a1 = *MEMORY[0x24BDBF090];
      *(_OWORD *)(a1 + 16) = v37;
    }
    if (a2)
    {
      v38 = MEMORY[0x24BDBD8B8];
      v39 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *a2 = *MEMORY[0x24BDBD8B8];
      a2[1] = v39;
      v36 = *(_OWORD *)(v38 + 32);
      goto LABEL_16;
    }
  }
  else
  {
    v25 = QLGetThumbnailSizeSatisfyingParameters(1, a5, a6, a9, a10, a11, 1.0);
    v27 = v25;
    v28 = v26;
    if (v25 >= a9)
      v29 = a9;
    else
      v29 = v25;
    if (v26 >= a10)
      v30 = a10;
    else
      v30 = v26;
    v31 = QLAdaptSizeToRectWithRounding2(1, (uint64_t)CGFloor, (uint64_t)CGCeiling, a7, a8, a9, a10, v29, v30);
    if (a1)
    {
      *(double *)a1 = v31;
      *(CGFloat *)(a1 + 8) = v32;
      *(double *)(a1 + 16) = v33;
      *(double *)(a1 + 24) = v34;
    }
    if (a2)
    {
      QLGetPDFDrawingTransformWithThumbnailSize((uint64_t)v41, a5, a6, v27, v28, v31, v32, v33, v34);
      v35 = v41[1];
      *a2 = v41[0];
      a2[1] = v35;
      v36 = v41[2];
LABEL_16:
      a2[2] = v36;
    }
  }
  return a5 > 0.0;
}

BOOL QLGetPDFDrawRectAndTransformWithMinimumDimension(CGPDFPage *a1, CGPDFBox a2, uint64_t a3, _OWORD *a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9)
{
  double v16;
  double v17;
  double v18;
  double v19;

  QLGetCGPDFPageRect(a1, a2);
  return QLGetDrawRectAndTransformWithMinimumDimension(a3, a4, v16, v17, v18, v19, a5, a6, a7, a8, a9);
}

double QLGetDrawRectFromPageRectWithMinimumDimension(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9)
{
  __int128 v17;
  _OWORD v19[2];

  v17 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v19[0] = *MEMORY[0x24BDBF090];
  v19[1] = v17;
  QLGetDrawRectAndTransformWithMinimumDimension((uint64_t)v19, 0, a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return *(double *)v19;
}

double QLGetPDFDrawRectWithMinimumDimension(CGPDFPage *a1, CGPDFBox a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _OWORD v18[2];

  v12 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v18[0] = *MEMORY[0x24BDBF090];
  v18[1] = v12;
  QLGetCGPDFPageRect(a1, a2);
  QLGetDrawRectAndTransformWithMinimumDimension((uint64_t)v18, 0, v13, v14, v15, v16, a3, a4, a5, a6, a7);
  return *(double *)v18;
}

double QLGetPDFDrawRect(CGPDFPage *a1, CGPDFBox a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  return QLGetPDFDrawRectWithMinimumDimension(a1, a2, a3, a4, a5, a6, 0.0);
}

void QLGetDrawingTransformForCGPDFPage(CGPDFPage *a1@<X0>, CGPDFBox a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  __int128 v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t RotationAngle;
  double MaxY;
  double MaxX;
  __int128 v15;
  __int128 v16;
  CGFloat MinX;
  unint64_t v18;
  CGRect BoxRect;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v6 = MEMORY[0x24BDBD8B8];
  v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)(a3 + 16) = v7;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v6 + 32);
  BoxRect = CGPDFPageGetBoxRect(a1, a2);
  x = BoxRect.origin.x;
  y = BoxRect.origin.y;
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  RotationAngle = CGPDFPageGetRotationAngle(a1);
  if (a2)
  {
    v30 = CGPDFPageGetBoxRect(a1, kCGPDFMediaBox);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectIntersection(v20, v30);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
  }
  if (RotationAngle > 89)
  {
    if (RotationAngle == 270)
    {
LABEL_12:
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      MaxY = CGRectGetMaxY(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      MinX = CGRectGetMinX(v25);
      v15 = xmmword_20D4DF360;
      v16 = xmmword_20D4DF370;
      MaxX = -MinX;
      goto LABEL_13;
    }
    if (RotationAngle == 180)
    {
LABEL_14:
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      MaxY = CGRectGetMaxX(v26);
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      MaxX = CGRectGetMaxY(v27);
      v18 = 0xBFF0000000000000;
LABEL_16:
      *(_QWORD *)a3 = v18;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = v18;
      goto LABEL_17;
    }
    if (RotationAngle != 90)
    {
LABEL_15:
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      MaxY = -CGRectGetMinX(v28);
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      MaxX = -CGRectGetMinY(v29);
      v18 = 0x3FF0000000000000;
      goto LABEL_16;
    }
  }
  else if (RotationAngle != -270)
  {
    if (RotationAngle != -180)
    {
      if (RotationAngle != -90)
        goto LABEL_15;
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxY = -CGRectGetMinY(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxX = CGRectGetMaxX(v23);
  v15 = xmmword_20D4DF380;
  v16 = xmmword_20D4DF390;
LABEL_13:
  *(_OWORD *)a3 = v15;
  *(_OWORD *)(a3 + 16) = v16;
LABEL_17:
  *(double *)(a3 + 32) = MaxY;
  *(double *)(a3 + 40) = MaxX;
}

CGAffineTransform *QLGetCGPDFDrawingTransform@<X0>(CGAffineTransform *result@<X0>, CGPDFBox a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  CGPDFPage *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  CGFloat MinX;
  CGFloat MinY;
  __int128 v29;
  __int128 v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  __int128 v36;
  __int128 v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  __int128 v41;
  __int128 v42;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  if (result)
  {
    v12 = (CGPDFPage *)result;
    QLGetCGPDFPageRect((CGPDFPage *)result, a2);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
    v17 = CGRectGetWidth(v51);
    v45 = y;
    v46 = x;
    v52.origin.x = x;
    v52.origin.y = y;
    v44 = width;
    v52.size.width = width;
    v52.size.height = height;
    v18 = CGRectGetHeight(v52);
    v19 = 0.0;
    if (v17 == 0.0)
    {
      v21 = a7;
    }
    else
    {
      v20 = v18;
      v21 = a7;
      if (v18 != 0.0)
      {
        v53.origin.x = a4;
        v53.origin.y = a5;
        v53.size.width = a6;
        v53.size.height = a7;
        v22 = CGRectGetWidth(v53) / v17;
        v54.origin.x = a4;
        v54.origin.y = a5;
        v54.size.width = a6;
        v54.size.height = a7;
        v23 = CGRectGetHeight(v54) / v20;
        if (v22 >= v23)
          v19 = ceil(v17 * v23) / v17;
        else
          v19 = ceil(v20 * v22) / v20;
      }
    }
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    v55.origin.x = a4;
    v55.origin.y = a5;
    v55.size.width = a6;
    v55.size.height = v21;
    MinX = CGRectGetMinX(v55);
    v56.origin.x = a4;
    v56.origin.y = a5;
    v56.size.width = a6;
    v56.size.height = v21;
    MinY = CGRectGetMinY(v56);
    CGAffineTransformMakeTranslation((CGAffineTransform *)a3, MinX, MinY);
    v29 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v49.a = *(_OWORD *)a3;
    *(_OWORD *)&v49.c = v29;
    *(_OWORD *)&v49.tx = *(_OWORD *)(a3 + 32);
    CGAffineTransformScale(&v50, &v49, v19, v19);
    v30 = *(_OWORD *)&v50.c;
    *(_OWORD *)a3 = *(_OWORD *)&v50.a;
    *(_OWORD *)(a3 + 16) = v30;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v50.tx;
    v31 = v46;
    *(CGFloat *)&v30 = v45;
    v32 = v44;
    v33 = height;
    v34 = -CGRectGetMinX(*(CGRect *)((char *)&v30 - 8));
    v57.origin.x = v46;
    v57.origin.y = v45;
    v57.size.width = v44;
    v57.size.height = height;
    v35 = CGRectGetMinY(v57);
    v36 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v49.a = *(_OWORD *)a3;
    *(_OWORD *)&v49.c = v36;
    *(_OWORD *)&v49.tx = *(_OWORD *)(a3 + 32);
    CGAffineTransformTranslate(&v50, &v49, v34, -v35);
    v37 = *(_OWORD *)&v50.c;
    *(_OWORD *)a3 = *(_OWORD *)&v50.a;
    *(_OWORD *)(a3 + 16) = v37;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v50.tx;
    memset(&v50, 0, sizeof(v50));
    v38 = v46;
    *(CGFloat *)&v37 = v45;
    v39 = v44;
    v40 = height;
    CGPDFPageGetDrawingTransform(&v50, v12, a2, *(CGRect *)((char *)&v37 - 8), 0, 1);
    t1 = v50;
    v41 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&t2.a = *(_OWORD *)a3;
    *(_OWORD *)&t2.c = v41;
    *(_OWORD *)&t2.tx = *(_OWORD *)(a3 + 32);
    result = CGAffineTransformConcat(&v49, &t1, &t2);
    v42 = *(_OWORD *)&v49.c;
    *(_OWORD *)a3 = *(_OWORD *)&v49.a;
    *(_OWORD *)(a3 + 16) = v42;
    v26 = *(_OWORD *)&v49.tx;
  }
  else
  {
    v24 = MEMORY[0x24BDBD8B8];
    v25 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)(a3 + 16) = v25;
    v26 = *(_OWORD *)(v24 + 32);
  }
  *(_OWORD *)(a3 + 32) = v26;
  return result;
}

CGAffineTransform *QLGetPDFDrawingTransform@<X0>(CGAffineTransform *result@<X0>, CGPDFBox a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  CGFloat MinX;
  CGFloat MinY;
  __int128 v27;
  __int128 v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  __int128 v34;
  __int128 v35;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  if (result)
  {
    QLGetCGPDFPageRect((CGPDFPage *)-[CGAffineTransform pageRef](result, "pageRef"), a2);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    v15 = CGRectGetWidth(v42);
    v38 = y;
    v39 = x;
    v43.origin.x = x;
    v43.origin.y = y;
    v37 = width;
    v43.size.width = width;
    v43.size.height = height;
    v16 = CGRectGetHeight(v43);
    v17 = 0.0;
    if (v15 == 0.0)
    {
      v19 = a7;
    }
    else
    {
      v18 = v16;
      v19 = a7;
      if (v16 != 0.0)
      {
        v44.origin.x = a4;
        v44.origin.y = a5;
        v44.size.width = a6;
        v44.size.height = a7;
        v20 = CGRectGetWidth(v44) / v15;
        v45.origin.x = a4;
        v45.origin.y = a5;
        v45.size.width = a6;
        v45.size.height = a7;
        v21 = CGRectGetHeight(v45) / v18;
        if (v20 >= v21)
          v17 = ceil(v15 * v21) / v15;
        else
          v17 = ceil(v18 * v20) / v18;
      }
    }
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    v46.origin.x = a4;
    v46.origin.y = a5;
    v46.size.width = a6;
    v46.size.height = v19;
    MinX = CGRectGetMinX(v46);
    v47.origin.x = a4;
    v47.origin.y = a5;
    v47.size.width = a6;
    v47.size.height = v19;
    MinY = CGRectGetMinY(v47);
    CGAffineTransformMakeTranslation((CGAffineTransform *)a3, MinX, MinY);
    v27 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v40.a = *(_OWORD *)a3;
    *(_OWORD *)&v40.c = v27;
    *(_OWORD *)&v40.tx = *(_OWORD *)(a3 + 32);
    CGAffineTransformScale(&v41, &v40, v17, v17);
    v28 = *(_OWORD *)&v41.c;
    *(_OWORD *)a3 = *(_OWORD *)&v41.a;
    *(_OWORD *)(a3 + 16) = v28;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v41.tx;
    v29 = v39;
    *(CGFloat *)&v28 = v38;
    v30 = v37;
    v31 = height;
    v32 = -CGRectGetMinX(*(CGRect *)((char *)&v28 - 8));
    v48.origin.x = v39;
    v48.origin.y = v38;
    v48.size.width = v37;
    v48.size.height = height;
    v33 = CGRectGetMinY(v48);
    v34 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v40.a = *(_OWORD *)a3;
    *(_OWORD *)&v40.c = v34;
    *(_OWORD *)&v40.tx = *(_OWORD *)(a3 + 32);
    result = CGAffineTransformTranslate(&v41, &v40, v32, -v33);
    v35 = *(_OWORD *)&v41.c;
    *(_OWORD *)a3 = *(_OWORD *)&v41.a;
    *(_OWORD *)(a3 + 16) = v35;
    v24 = *(_OWORD *)&v41.tx;
  }
  else
  {
    v22 = MEMORY[0x24BDBD8B8];
    v23 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)(a3 + 16) = v23;
    v24 = *(_OWORD *)(v22 + 32);
  }
  *(_OWORD *)(a3 + 32) = v24;
  return result;
}

void QLDrawCGPDFPageInRect(CGContext *a1, CGAffineTransform *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;

  CGContextSaveGState(a1);
  v16.origin.x = a4;
  v16.origin.y = a5;
  v16.size.width = a6;
  v16.size.height = a7;
  CGContextClipToRect(a1, v16);
  memset(&v15, 0, sizeof(v15));
  QLGetCGPDFDrawingTransform(a2, a3, (uint64_t)&v15, a4, a5, a6, a7);
  v14 = v15;
  CGContextConcatCTM(a1, &v14);
  CGContextDrawPDFPageWithAnnotations();
  CGContextRestoreGState(a1);
}

void QLDrawPDFPageInRectWithTransform(CGContext *a1, CGPDFPage *a2, CGPDFBox a3, _OWORD *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform transform;
  CGRect v19;

  CGContextSaveGState(a1);
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGContextClipToRect(a1, v19);
  v16 = a4[1];
  *(_OWORD *)&transform.a = *a4;
  *(_OWORD *)&transform.c = v16;
  *(_OWORD *)&transform.tx = a4[2];
  CGContextConcatCTM(a1, &transform);
  QLGetDrawingTransformForCGPDFPage(a2, a3, (uint64_t)&v17);
  CGContextConcatCTM(a1, &v17);
  CGContextSetAllowsAntialiasing(a1, 1);
  CGContextSetShouldAntialias(a1, 1);
  CGContextSetTextGreekingThreshold();
  CGContextSetLineWidthThreshold();
  CGContextSetInterpolationQuality(a1, kCGInterpolationHigh);
  CGContextDrawPDFPageWithAnnotations();
  CGContextRestoreGState(a1);
}

void QLDrawPDFPageInRect(CGContext *a1, CGAffineTransform *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  QLGetCGPDFDrawingTransform(a2, a3, (uint64_t)&v15, a4, a5, a6, a7);
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  QLDrawPDFPageInRectWithTransform(a1, (CGPDFPage *)a2, a3, v14, a4, a5, a6, a7);
}

CGFloat QLDrawPDFPageWithMinimumDimension(CGContext *a1, CGPDFPage *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8)
{
  CGRect *v16;
  CGSize v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGRect v28;
  CGRect v29;

  QLContextSetGrayFillColor(a1, 1.0, 1.0);
  v29.origin.x = a4;
  v29.origin.y = a5;
  v29.size.width = a6;
  v29.size.height = a7;
  CGContextFillRect(a1, v29);
  v16 = (CGRect *)MEMORY[0x24BDBF090];
  v17 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v28.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v28.size = v17;
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v25 = *MEMORY[0x24BDBD8B8];
  v26 = v18;
  v27 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  QLGetCGPDFPageRect(a2, a3);
  QLGetDrawRectAndTransformWithMinimumDimension((uint64_t)&v28, &v25, v19, v20, v21, v22, a4, a5, a6, a7, a8);
  if (!CGRectIsEmpty(v28))
  {
    v24[0] = v25;
    v24[1] = v26;
    v24[2] = v27;
    QLDrawPDFPageInRectWithTransform(a1, a2, a3, v24, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    v16 = &v28;
  }
  return v16->origin.x;
}

id QLPlistDataForFile(void *a1, uint64_t a2, _BYTE *a3, char a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;

  v7 = a1;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDF8530];
  if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF8530]))
  {
    if (a3)
      *a3 = 1;
    if ((a4 & 1) != 0 || objc_msgSend(v8, "isEqual:", v9))
    {
      v21 = 0;
      v10 = *MEMORY[0x24BDBCC48];
      v20 = 0;
      v11 = objc_msgSend(v7, "getResourceValue:forKey:error:", &v21, v10, &v20);
      v12 = v21;
      v13 = v20;
      if ((v11 & 1) != 0)
      {
        if ((unint64_t)objc_msgSend(v12, "unsignedLongLongValue") > 0x500000)
        {
          v14 = 0;
LABEL_20:

          goto LABEL_21;
        }
        v19 = v13;
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v7, 0, &v19);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v19;

        if (v15)
        {
          QLPlistDataForData(v15, v8, a3, a4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          generationLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            QLPlistDataForFile_cold_1();

          v14 = 0;
        }
      }
      else
      {
        generationLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          QLPlistDataForFile_cold_2();
        v14 = 0;
        v16 = v13;
      }

      v13 = v16;
      goto LABEL_20;
    }
    v14 = 0;
  }
  else
  {
    v14 = 0;
    *a3 = 0;
  }
LABEL_21:

  return v14;
}

id QLPlistDataForData(void *a1, void *a2, _BYTE *a3, char a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v15;

  v7 = a1;
  v8 = a2;
  v9 = *MEMORY[0x24BDF8530];
  if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF8530]))
  {
    if (a3)
      *a3 = 1;
    if ((a4 & 1) != 0)
    {
      if (!v7)
        goto LABEL_12;
    }
    else
    {
      v11 = objc_msgSend(v8, "isEqual:", v9);
      v10 = 0;
      if (!v7 || (v11 & 1) == 0)
        goto LABEL_20;
    }
    if ((unint64_t)objc_msgSend(v7, "length") > 0x500000)
      goto LABEL_12;
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, &v15, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (v15 == 200)
      {
        objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v12, 100, 0, 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v7;
      }
      v10 = v13;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    if (!a3)
    {
LABEL_12:
      v10 = 0;
      goto LABEL_20;
    }
    v10 = 0;
    *a3 = 0;
  }
LABEL_20:

  return v10;
}

void sub_20D4CF52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id QLSLogHandle()
{
  void *v0;

  v0 = (void *)_qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    v0 = (void *)_qlsLogHandle;
  }
  return v0;
}

void sub_20D4D12A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t QLUTIManagerTypeIsInternallyClaimedType(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[QLUTIManager internallyClaimedTypes](QLUTIManager, "internallyClaimedTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", a1);

  return v3;
}

void sub_20D4D15E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _QLMachDispatchIncomingMessageAndReplyIfNecessary(uint64_t a1, uint64_t (*a2)(uint64_t, vm_address_t), int a3, int a4, _DWORD *a5)
{
  ipc_space_t *v9;
  uint64_t v10;
  int v11;
  vm_size_t v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t *v15;
  BOOLean_t v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  mach_port_name_t v27;
  vm_address_t address;

  v9 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v10 = *MEMORY[0x24BDAEC58];
  if (a5)
    *a5 = 0;
  address = 0;
  v11 = a3 + 68;
  if ((a4 & 0x20000) == 0)
    v11 = a3;
  v12 = -*MEMORY[0x24BDB03C8] & (v11 + *MEMORY[0x24BDB03C8] - 1);
  v13 = vm_allocate(v10, &address, v12, 335544321);
  if (!(_DWORD)v13)
  {
    v14 = a2(a1, address);
    if (a5)
      *a5 = v14;
    v15 = (mach_msg_header_t *)address;
    if ((*(_DWORD *)address & 0x80000000) == 0 && *(_DWORD *)(address + 32) == -305)
      *(_DWORD *)(address + 8) = 0;
    if (v15->msgh_remote_port)
    {
      v16 = voucher_mach_msg_set(v15);
      if ((*(_DWORD *)address & 0x1F) == 0x12)
        v17 = 1;
      else
        v17 = 17;
      v13 = mach_msg((mach_msg_header_t *)address, v17 | a4 & 0xFFFFFFFC, *(_DWORD *)(address + 4), 0, 0, 0, 0);
      _log_0();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v16)
      {
        if (v19)
          _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_2(v18, v20, v21, v22, v23, v24, v25, v26);

        voucher_mach_msg_clear((mach_msg_header_t *)address);
      }
      else
      {
        if (v19)
          _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_1(v18, v20, v21, v22, v23, v24, v25, v26);

      }
      v15 = (mach_msg_header_t *)address;
      if ((v13 - 268435459) <= 1)
      {
        v27 = *(_DWORD *)(address + 12);
        if (v27 - 1 <= 0xFFFFFFFD && ((*(_DWORD *)address >> 8) & 0x1Fu) - 17 <= 1)
          mach_port_deallocate(*v9, v27);
        mach_msg_destroy(v15);
        v15 = (mach_msg_header_t *)address;
      }
    }
    else
    {
      v13 = 0;
    }
    MEMORY[0x212BA2A40](v10, v15, v12);
  }
  return v13;
}

id _log_0()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x24BDE5F50];
  v1 = *(void **)(MEMORY[0x24BDE5F50] + 144);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 144);
  }
  return v1;
}

uint64_t _QLMachGetMachPortCount()
{
  unsigned int *v0;
  mach_error_t v1;
  mach_error_t v2;
  NSObject *v3;
  mach_error_t v4;
  mach_error_t v5;
  NSObject *v6;
  mach_error_t v7;
  mach_error_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v10 = 0;
  v0 = (unsigned int *)MEMORY[0x24BDAEC58];
  v1 = MEMORY[0x212BA26A4](*MEMORY[0x24BDAEC58], &v12, (char *)&v10 + 4, &v11, &v10);
  if (v1)
  {
    v2 = v1;
    _log_0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _QLMachGetMachPortCount_cold_3(v2);
LABEL_11:

    return HIDWORD(v10);
  }
  v4 = MEMORY[0x212BA2A40](*v0, v12, 4 * HIDWORD(v10));
  if (v4)
  {
    v5 = v4;
    _log_0();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      _QLMachGetMachPortCount_cold_2(v5);

  }
  v7 = MEMORY[0x212BA2A40](*v0, v11, 4 * v10);
  if (v7)
  {
    v8 = v7;
    _log_0();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      _QLMachGetMachPortCount_cold_1(v8);
    goto LABEL_11;
  }
  return HIDWORD(v10);
}

uint64_t _QLMachRegisterForNoSenders(mach_port_t notify, int *a2)
{
  return _QLMachRequestNoSenderNotification(notify, notify, a2);
}

uint64_t _QLMachRequestNoSenderNotification(mach_port_name_t name, mach_port_t notify, int *a3)
{
  ipc_space_t *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  char *v11;
  int v12;
  mach_port_t previous;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  __int128 v16;
  uint64_t v17;
  uint8_t buf[4];
  mach_port_name_t v19;
  __int16 v20;
  mach_port_t v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  mach_port_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  *(_OWORD *)port_info_out = 0u;
  v16 = 0u;
  previous = 0;
  port_info_outCnt = 10;
  v6 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v7 = mach_port_request_notification(*MEMORY[0x24BDAEC58], name, 70, 2u, notify, 0x15u, &previous);
  if ((_DWORD)v7)
  {
    if (!a3)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (previous)
    mach_port_deallocate(*v6, previous);
  if (a3)
  {
    if (!mach_port_get_attributes(*v6, name, 2, port_info_out, &port_info_outCnt))
    {
      v8 = v16 + port_info_out[1];
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
LABEL_9:
    *a3 = v8;
  }
LABEL_10:
  _log_0();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = mach_error_string(v7);
    if (a3)
      v12 = *a3;
    else
      v12 = -1;
    *(_DWORD *)buf = 67110146;
    v19 = name;
    v20 = 1024;
    v21 = notify;
    v22 = 2080;
    v23 = v11;
    v24 = 1024;
    v25 = previous;
    v26 = 1024;
    v27 = v12;
    _os_log_debug_impl(&dword_20D4C7000, v9, OS_LOG_TYPE_DEBUG, "No sender notification request on %i for %i (%s) - old port: %i - seqno: %i", buf, 0x24u);
  }

  return v7;
}

uint64_t _QLMachUnregisterForNoSenders(mach_port_name_t a1)
{
  return _QLMachRequestNoSenderNotification(a1, 0, 0);
}

uint64_t _QLMachGetMinimumSequenceNumber(mach_port_name_t name, _DWORD *a2)
{
  uint64_t result;
  int v4;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out[4];
  __int128 v7;
  uint64_t v8;

  v8 = 0;
  *(_OWORD *)port_info_out = 0u;
  v7 = 0u;
  port_info_outCnt = 10;
  result = mach_port_get_attributes(*MEMORY[0x24BDAEC58], name, 2, port_info_out, &port_info_outCnt);
  v4 = v7 + port_info_out[1];
  if ((_DWORD)result)
    v4 = 0;
  *a2 = v4;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

char *OUTLINED_FUNCTION_3(mach_error_t error_value)
{
  return mach_error_string(error_value);
}

id QLScaledImageFromImageURL(const __CFURL *a1, int a2, _BYTE *a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  CGImageSource *v15;
  CGImageSource *v16;
  CGImage *v17;
  CGImage *v18;
  void *v19;

  v15 = CGImageSourceCreateWithURL(a1, 0);
  if (v15)
  {
    v16 = v15;
    v17 = QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType(v15, a5, a6, a7, a8, 0, a2, a3, a4, 1);
    if (v17)
    {
      v18 = v17;
      +[QLPlatformImage imageWithCGImage:scale:orientation:](QLPlatformImage, "imageWithCGImage:scale:orientation:", v17, 1, a8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v18);
    }
    else
    {
      v19 = 0;
    }
    CFRelease(v16);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

CGImageSource *QLScaledPlatformImageFromImageSource(CGImageSource *a1, double a2, double a3)
{
  return QLScaledPlatformImageFromImageSourceWithOptions(a1, 0, a2, a3);
}

CGImageSource *QLScaledPlatformImageFromImageSourceWithOptions(CGImageSource *a1, char a2, double a3, double a4)
{
  CGImageSource *v4;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const __CFNumber *Value;
  const __CFNumber *v13;
  const __CFNumber *v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  size_t PrimaryImageIndex;
  const __CFDictionary *v21;
  CGImageRef ImageAtIndex;
  CGImage *v24;
  CGImage *v25;
  unsigned int v26;
  double v27;
  double valuePtr;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v4 = a1;
  v32[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v27 = 0.0;
    valuePtr = 0.0;
    v26 = 1;
    v31 = *MEMORY[0x24BDD97F0];
    v8 = MEMORY[0x24BDBD1C8];
    v32[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = CGImageSourceCopyPropertiesAtIndex(v4, 0, v9);
    if (v10)
    {
      v11 = v10;
      Value = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDD96C8]);
      if (Value)
        CFNumberGetValue(Value, kCFNumberCGFloatType, &valuePtr);
      v13 = (const __CFNumber *)CFDictionaryGetValue(v11, (const void *)*MEMORY[0x24BDD96C0]);
      if (v13)
        CFNumberGetValue(v13, kCFNumberCGFloatType, &v27);
      v14 = (const __CFNumber *)CFDictionaryGetValue(v11, (const void *)*MEMORY[0x24BDD9698]);
      if (v14)
        CFNumberGetValue(v14, kCFNumberIntType, &v26);
      CFRelease(v11);
      v15 = v27;
      v16 = valuePtr;
    }
    else
    {
      v15 = 0.0;
      v16 = 0.0;
    }
    v17 = v16 < a3 && v15 < a3;
    v18 = v16 * v15;
    if (v17 || v18 < a3 * a3)
    {
      PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v4);
      if ((a2 & 1) != 0)
      {
        v29 = *MEMORY[0x24BDD97D8];
        v30 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v4, PrimaryImageIndex, v21);
      +[QLPlatformImage imageWithCGImage:scale:orientation:](QLPlatformImage, "imageWithCGImage:scale:orientation:", ImageAtIndex, v26, a4);
      v4 = (CGImageSource *)objc_claimAutoreleasedReturnValue();
      if (ImageAtIndex)
        CFRelease(ImageAtIndex);

    }
    else
    {
      v24 = QLThumbnailingImageIOCreateAndDecodeThumbnailWithImageSource(v4, 0, 0, 3, 1, a3 * a4, a3 * a4);
      if (v24)
      {
        v25 = v24;
        +[QLPlatformImage imageWithCGImage:scale:orientation:](QLPlatformImage, "imageWithCGImage:scale:orientation:", v24, 1, a4);
        v4 = (CGImageSource *)objc_claimAutoreleasedReturnValue();
        CGImageRelease(v25);
      }
      else
      {
        v4 = 0;
      }
    }

  }
  return v4;
}

unint64_t _QLThumbnailComputeBaselineFromData(uint64_t a1, unint64_t a2, unint64_t a3, vImagePixelCount a4, uint64_t a5, __int16 a6, uint64_t a7)
{
  unsigned int v14;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  vImagePixelCount v20;
  vImagePixelCount v21;
  size_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  vImagePixelCount v27;
  vImagePixelCount v28;
  int64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  char *v35;
  char *v36;
  float *v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  int64_t v42;
  vImage_Buffer dest;
  vImage_Buffer buf;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a4 != 64 && a4 != 32 || a3 != 8 && a3 != 16)
  {
    _log_1();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      return 0;
    }
    LODWORD(buf.data) = 134218240;
    *(void **)((char *)&buf.data + 4) = (void *)a3;
    WORD2(buf.height) = 2048;
    *(vImagePixelCount *)((char *)&buf.height + 6) = a4;
    v17 = "image format not supported for baseline alignment (bpc = %zu, bpp = %zu)";
    v18 = v16;
    v19 = 22;
LABEL_14:
    _os_log_impl(&dword_20D4C7000, v18, OS_LOG_TYPE_INFO, v17, (uint8_t *)&buf, v19);
    goto LABEL_15;
  }
  v14 = a6 & 0x1F;
  if (v14 > 7)
  {
LABEL_22:
    _log_1();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    LODWORD(buf.data) = 67109120;
    HIDWORD(buf.data) = v14;
    v17 = "image format not supported for baseline alignment (alpha info %d)";
    v18 = v16;
    v19 = 8;
    goto LABEL_14;
  }
  if (((1 << v14) & 0xE) == 0)
  {
    if (((1 << v14) & 0x61) != 0)
      return 0;
    if (v14 == 7)
    {
      if (a2)
        return a2 - 1;
      else
        return 0;
    }
    goto LABEL_22;
  }
  if (!a7)
  {
    _log_1();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    LOWORD(buf.data) = 0;
    v17 = "no bitmap data => can't compute baseline alignment";
    goto LABEL_30;
  }
  v20 = a4 / a3;
  v21 = a1 * (a4 / a3);
  v22 = 4 * v21;
  if ((a6 & 0x100) != 0)
  {
    v24 = 4 * v21;
    v23 = (char *)malloc_type_malloc(4 * v21, 0xE2BBF20DuLL);
    v22 = v24;
  }
  else
  {
    v23 = 0;
  }
  if (a2 < 2)
  {
LABEL_26:
    if (v23)
      free(v23);
    _log_1();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    LOWORD(buf.data) = 0;
    v17 = "more than the half of the image is transparent => cancel baseline computation";
LABEL_30:
    v18 = v16;
    v19 = 2;
    goto LABEL_14;
  }
  v25 = 0;
  v26 = (char *)(a7 + (a2 - 1) * a5);
  v27 = a4 >> 3;
  v28 = v20 - 1;
  v29 = v20 * a1;
  v42 = v27 * a1;
  v30 = 2 * v27 * a1;
  v31 = &v23[4 * v20 * a1];
  v32 = -a5;
  if (a2 >> 1 <= 1)
    v33 = 1;
  else
    v33 = a2 >> 1;
  v38 = v22;
  v39 = v33;
  v40 = -a5;
  v41 = v30;
  v34 = v29;
  while ((a6 & 0x100) == 0)
  {
    if (v42 >= 1)
    {
      v35 = v26;
      while (v35[v28] <= 0xB0u)
      {
        v35 += v27;
        if (v35 >= &v26[v42])
          goto LABEL_46;
      }
      return (unsigned __int16)v25;
    }
LABEL_46:
    v26 += v32;
    if (++v25 == v33)
      goto LABEL_26;
  }
  v36 = v23;
  bzero(v23, v22);
  buf.data = v26;
  buf.height = 1;
  buf.width = v34;
  buf.rowBytes = v42;
  dest.data = v36;
  dest.height = 1;
  dest.width = v34;
  dest.rowBytes = v41;
  vImageConvert_Planar16FtoPlanarF(&buf, &dest, 0);
  v33 = v39;
  v32 = v40;
  v23 = v36;
  if (v34 < 1)
  {
LABEL_45:
    v22 = v38;
    goto LABEL_46;
  }
  v37 = (float *)v36;
  while ((float)(v37[v28] * 255.0) < 177.0)
  {
    v37 += v20;
    if (v37 >= (float *)v31)
      goto LABEL_45;
  }
  free(v36);
  return (unsigned __int16)v25;
}

BOOL QLSThumbnailSizeIsSufficientForLowQuality(double a1, double a2, double a3)
{
  _BOOL4 v3;
  double v4;

  v3 = a3 <= 32.0;
  v4 = a2 * 0.5;
  if (a1 / a3 > 0.5)
    v3 = 1;
  return v4 < a1 && v3;
}

id _log_1()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x24BDE5F50];
  v1 = *(void **)(MEMORY[0x24BDE5F50] + 120);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 120);
  }
  return v1;
}

double QLThumbnailingImageIOGetSizeFromImageProperties(const __CFDictionary *a1)
{
  double v1;
  const void *v3;
  CFTypeID TypeID;
  const __CFNumber *v5;
  const void *v6;
  CFTypeID v7;
  const __CFNumber *v8;
  double v9;
  double v10;
  int v11;
  const void *v12;
  CFTypeID v13;
  double v15;
  double valuePtr;

  v1 = *MEMORY[0x24BDBF148];
  if (a1)
  {
    v15 = 0.0;
    valuePtr = 0.0;
    v3 = (const void *)*MEMORY[0x24BDD96C8];
    TypeID = CFNumberGetTypeID();
    v5 = (const __CFNumber *)_QLDictionaryValueForKey(a1, v3, TypeID, 0);
    if (v5)
      CFNumberGetValue(v5, kCFNumberCGFloatType, &valuePtr);
    v6 = (const void *)*MEMORY[0x24BDD96C0];
    v7 = CFNumberGetTypeID();
    v8 = (const __CFNumber *)_QLDictionaryValueForKey(a1, v6, v7, 0);
    if (v8)
    {
      CFNumberGetValue(v8, kCFNumberCGFloatType, &v15);
      v9 = valuePtr;
      if (valuePtr != 0.0)
      {
        v10 = v15;
        if (v15 != 0.0)
        {
          v11 = _QLDictionaryIntValueForKey(a1, (const void *)*MEMORY[0x24BDD9698], 0xFFFFFFFFLL);
          if (v11 == -1)
          {
            v12 = (const void *)*MEMORY[0x24BDD96E8];
            v13 = CFDictionaryGetTypeID();
            if (!_QLDictionaryValueForKey(a1, v12, v13, 0))
              return v9;
            v11 = _QLDictionaryIntValueForKey(a1, (const void *)*MEMORY[0x24BDD9710], 0xFFFFFFFFLL);
          }
          if ((v11 - 5) >= 4)
            return v9;
          else
            return v10;
        }
      }
    }
  }
  return v1;
}

double QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(CGImageSource *a1, size_t a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  double v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD97F0];
  v10[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CGImageSourceCopyPropertiesAtIndex(a1, a2, v4);
  if (v5)
  {
    v6 = v5;
    v7 = QLThumbnailingImageIOGetSizeFromImageProperties(v5);
    CFRelease(v6);
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
  }

  return v7;
}

CGImageSource *QLThumbnailingImageIOCreateThumbnailFromData(const __CFData *a1, _BYTE *a2, double a3, double a4)
{
  CGImageSource *result;
  CGImageSource *v8;
  CGImage *v9;

  result = CGImageSourceCreateWithData(a1, 0);
  if (result)
  {
    v8 = result;
    v9 = _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(result, 0, a2, 0, 0, 0, a3, a4);
    CFRelease(v8);
    return v9;
  }
  return result;
}

CGImage *_QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(CGImageSource *a1, int a2, _BYTE *a3, uint64_t a4, uint64_t a5, int a6, double a7, double a8)
{
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  size_t PrimaryImageIndex;
  CGImage *ThumbnailAtIndex;
  CGImage *v25;
  double Width;
  _BOOL4 v27;
  char v28;
  _BOOL4 v29;
  uint64_t v34;
  void *v35;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7 >= a8)
      v14 = a7;
    else
      v14 = a8;
    v35 = (void *)MEMORY[0x24BDBCED8];
    v34 = *MEMORY[0x24BDD9788];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDD9808];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDD9800];
    v19 = *MEMORY[0x24BDD9780];
    v20 = *MEMORY[0x24BDD97F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v13, v34, v15, v16, v17, v18, MEMORY[0x24BDBD1C0], v19, v13, v20, v21, *MEMORY[0x24BDD97D8], v13, *MEMORY[0x24BDD9820], v13, *MEMORY[0x24BDD97E8], 0);
    v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a1);
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, PrimaryImageIndex, v22);
    if (ThumbnailAtIndex)
    {
      v25 = ThumbnailAtIndex;
      Width = (double)CGImageGetWidth(ThumbnailAtIndex);
      v27 = a8 > (double)CGImageGetHeight(v25) && a7 > Width;
      if (a6)
        v28 = 0;
      else
        v28 = QLThumbnailingImageIOCanEfficientlyThumbnailImageSource(a1) ^ 1;
      if (a2)
        v29 = 0;
      else
        v29 = v27;
      if (!v29 || (v28 & 1) != 0)
      {
        if (a3 && a7 > (double)CGImageGetWidth(v25) && a8 > (double)CGImageGetHeight(v25))
          *a3 = 1;
        goto LABEL_20;
      }
      CGImageRelease(v25);
    }
    -[__CFDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD9778]);
    v25 = CGImageSourceCreateThumbnailAtIndex(a1, PrimaryImageIndex, v22);
LABEL_20:

    return v25;
  }
  return 0;
}

unint64_t QLThumbnailingImageIOExpectedMemoryUsageForImageSourceThumbnail(CGImageSource *a1, double a2, double a3, double a4)
{
  CFStringRef Type;
  CFStringRef v9;
  const __CFDictionary *v10;
  CFDictionaryRef v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  unint64_t v23;
  int v25;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  Type = CGImageSourceGetType(a1);
  if (!Type)
    return 0;
  v9 = Type;
  v28 = *MEMORY[0x24BDD97F0];
  v29[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = CGImageSourceCopyPropertiesAtIndex(a1, 0, v10);
  v12 = QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(a1, 0);
  v14 = v13;
  -[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD93D0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "intValue");
  if (v17 >= 0)
    v18 = v17;
  else
    v18 = v17 + 1;
  v19 = (double)(v18 >> 1);
  v20 = (unint64_t)(v12 * v14 * v19);
  v21 = a2 * a4;
  v22 = a3 * a4;
  v23 = (unint64_t)(v22 * (v21 * v19));
  if ((objc_msgSend(v16, "conformsToType:", *MEMORY[0x24BDF8438]) & 1) != 0
    || objc_msgSend(v16, "conformsToType:", *MEMORY[0x24BDF8550]))
  {
    if (v12 * 0.125 < v21 || v14 * 0.125 < v22)
    {
      if (v12 * 0.25 < v21 || v14 * 0.25 < v22)
      {
        if (v14 * 0.5 < v22 || v12 * 0.5 < v21)
          v25 = 1;
        else
          v25 = 2;
      }
      else
      {
        v25 = 4;
      }
    }
    else
    {
      v25 = 8;
    }
    v20 = 2 * (v20 / (v25 * v25) + v23);
  }
  else if (objc_msgSend(v16, "conformsToType:", *MEMORY[0x24BDF83E8]))
  {
    v20 = 4 * v23;
  }
  else if (objc_msgSend(v16, "conformsToType:", *MEMORY[0x24BDF84F8]))
  {
    v20 *= 3;
  }

  return v20;
}

uint64_t QLThumbnailingImageIOCanEfficientlyThumbnailImageSource(CGImageSource *a1)
{
  void *v2;
  uint64_t v3;
  const __CFDictionary *v4;
  CFDictionaryRef v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  char v11;
  uint8_t v13[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CGImageSourceGetType(a1));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDD97F0];
  v15[0] = MEMORY[0x24BDBD1C8];
  v3 = 1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CGImageSourceCopyPropertiesAtIndex(a1, 0, v4);
  v6 = QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(a1, 0);
  v8 = v7;
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD93D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((uint64_t)(v6 * v8 * (double)objc_msgSend(v9, "integerValue") * 0.125) >= 16777217)
  {
    if ((objc_msgSend(v2, "conformsToType:", *MEMORY[0x24BDF8438]) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", *MEMORY[0x24BDC17C8]);
      v10 = objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "conformsToType:", v10);
      if ((v3 & 1) == 0)
      {
        v11 = objc_msgSend(v2, "conformsToType:", *MEMORY[0x24BDF83E8]);

        if ((v11 & 1) != 0)
          goto LABEL_5;
        _log_1();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_20D4C7000, v10, OS_LOG_TYPE_DEFAULT, "Image is too large, not returning any thumbnail", v13, 2u);
        }
      }

      goto LABEL_9;
    }
LABEL_5:
    v3 = 1;
  }
LABEL_9:

  return v3;
}

CGImage *QLThumbnailingImageIOCreateAndDecodeThumbnailWithImageSource(CGImageSource *a1, int a2, _BYTE *a3, uint64_t a4, int a5, double a6, double a7)
{
  return _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(a1, a2, a3, 1, a4, a5, a6, a7);
}

double QLImageIOCropSizeForSize(double result, double a2, double a3)
{
  if (result >= a3)
    return a3;
  return result;
}

double QLImageIOCropRectForSize(double a1, double a2, double a3)
{
  BOOL v3;
  double result;

  v3 = a1 < a3;
  result = rint((a1 - a3) * 0.5);
  if (v3)
    return 0.0;
  return result;
}

CGImageRef QLImageIOCreateScaledImageOfMaximumAndMinimumSize(CGImage *a1, CGInterpolationQuality a2, double a3, double a4, double a5)
{
  CGImage *v9;
  double Width;
  size_t Height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGColorSpace *ColorSpace;
  CGContext *v17;
  CGContext *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGImageRef Image;
  NSObject *v24;
  CGImageRef result;
  CGRect v26;

  v9 = a1;
  Width = (double)CGImageGetWidth(a1);
  Height = CGImageGetHeight(v9);
  QLDetermineSizeRespectingAspectRatioAndMinimumDimension(Width, (double)Height, a5, a3, a4);
  v13 = v12;
  v15 = v14;
  ColorSpace = CGImageGetColorSpace(v9);
  CGColorSpaceIsWideGamutRGB(ColorSpace);
  v17 = (CGContext *)QLTCreateCGContext();
  if (v17)
  {
    v18 = v17;
    v19 = rint((v13 - a3) * 0.5);
    if (v13 >= a3)
      v20 = v19;
    else
      v20 = 0.0;
    v21 = rint((v15 - a4) * 0.5);
    if (v15 >= a4)
      v22 = v21;
    else
      v22 = 0.0;
    CGContextSetInterpolationQuality(v17, a2);
    v26.origin.x = -v20;
    v26.origin.y = -v22;
    v26.size.width = v13;
    v26.size.height = v15;
    CGContextDrawImage(v18, v26, v9);
    Image = CGBitmapContextCreateImage(v18);
    v9 = v18;
LABEL_12:
    CFRelease(v9);
    return Image;
  }
  _log_1();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    QLImageIOCreateScaledImageOfMaximumAndMinimumSize_cold_1(v24);

  Image = 0;
  result = 0;
  if (v9)
    goto LABEL_12;
  return result;
}

void QLDetermineSizeRespectingAspectRatioAndMinimumDimension(double a1, double a2, double a3, double a4, double a5)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v8 = QLAdaptSizeInSize(0, 0, a4, a5, a1, a2);
  v10 = ceil(v9);
  v11 = ceil(v8);
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  if (v12 < a3)
    QLAdaptSizeOutSize(1, 1, a3, a3, a1, a2);
}

CGImageRef QLImageIOCreateCroppedImageRef(CGImage *a1, double a2, double a3)
{
  double Width;
  size_t Height;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;

  if (!a1)
    QLImageIOCreateCroppedImageRef_cold_1();
  Width = (double)CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  v8 = (double)Height;
  if (a2 <= Width)
    v9 = a2;
  else
    v9 = Width;
  v10 = rint((Width - a2) * 0.5);
  if (a2 > Width)
    v10 = 0.0;
  v11 = a3 <= v8;
  if (a3 <= v8)
    v12 = a3;
  else
    v12 = (double)Height;
  v13 = rint((v8 - a3) * 0.5);
  if (!v11)
    v13 = 0.0;
  return CGImageCreateWithImageInRect(a1, *(CGRect *)(&v9 - 2));
}

CGImageRef QLThumbnailImageIOCreateICNSThumbnailWithImageSource(CGImageSource *a1, double a2, double a3)
{
  size_t Count;
  size_t v7;
  size_t v8;
  size_t v9;
  CFTypeRef v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  double v17;
  double v18;
  CGImageRef ImageAtIndex;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  Count = CGImageSourceGetCount(a1);
  if (!Count)
    return 0;
  v7 = Count;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = *MEMORY[0x24BDD97F0];
  v12 = 1.79769313e308;
  v13 = MEMORY[0x24BDBD1C8];
  do
  {
    v24 = v11;
    v25[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = CGImageSourceCopyPropertiesAtIndex(a1, v9, v14);
    if (v15)
    {
      v16 = v15;
      v17 = QLThumbnailingImageIOGetSizeFromImageProperties(v15);
      if (v17 >= a2 && v18 >= a3 && v17 < v12 && v18 < v12)
      {
        if (v17 >= v18)
          v12 = v18;
        else
          v12 = v17;
        if (v10)
          CFRelease(v10);
        v10 = CFRetain(v16);
        v8 = v9;
      }
      CFRelease(v16);
    }

    ++v9;
  }
  while (v7 != v9);
  if (!v10)
    return 0;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, v8, 0);
  CFRelease(v10);
  return ImageAtIndex;
}

CGImageRef QLThumbnailingImageIOCreateCroppedAndScaledThumbnailToSatisfyConstraints(CGImage *a1, CGInterpolationQuality a2, double a3, double a4, double a5, double a6, double a7)
{
  CGImage *v13;
  double Width;
  double Height;
  double v16;
  double v17;
  _BOOL4 v18;

  v13 = a1;
  Width = (double)CGImageGetWidth(a1);
  Height = (double)CGImageGetHeight(v13);
  QLDetermineSizeRespectingAspectRatioAndMinimumDimension(a3, a4, a5, a6, a7);
  if (v16 >= a6)
    v16 = a6;
  if (v17 >= a7)
    v17 = a7;
  v18 = a3 >= a6;
  if (a4 >= a7)
    v18 = 1;
  if (v16 == Width && v17 == Height)
    goto LABEL_20;
  if (a3 >= a5 && a4 >= a5)
  {
    if (!v18)
      return 0;
    if (v16 < Width || v17 < Height)
      return QLImageIOCreateCroppedImageRef(v13, v16, v17);
LABEL_20:
    CFRetain(v13);
    return v13;
  }
  return QLImageIOCreateScaledImageOfMaximumAndMinimumSize(v13, a2, a6, a7, a5);
}

CGImage *QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType(CGImageSource *a1, double a2, double a3, double a4, double a5, uint64_t a6, int a7, _BYTE *a8, uint64_t a9, int a10)
{
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGImage *result;
  _BOOL4 v31;
  _BOOL4 v32;
  CGImage *v33;
  CGImage *v34;
  CGImageRef v35;

  if (a4 >= 1.0)
    v18 = a4;
  else
    v18 = 1.0;
  v19 = QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(a1, 0);
  v21 = v19;
  v22 = v20;
  if (v19 < 1.0 || v20 < 1.0)
  {
    _log_1();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_1(v24, v21, v22);
  }
  else
  {
    v25 = v18 * a5;
    v26 = a3 * a5;
    v27 = a2 * a5;
    QLDetermineSizeRespectingAspectRatioAndMinimumDimension(v19, v20, v25, v27, v26);
    if (a7)
    {
      result = _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(a1, a7, a8, 1, a9, a10, v27, v26);
      if (result)
        return result;
    }
    else
    {
      v31 = v21 < v27;
      if (v22 >= v26)
        v31 = 0;
      v32 = v21 < v25;
      if (v22 < v25)
        v32 = 1;
      if (v32 || v31)
      {
        v28 = v21;
        v29 = v22;
      }
      v33 = _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(a1, 0, a8, 1, a9, a10, v28, v29);
      if (v33)
      {
        v34 = v33;
        v35 = QLThumbnailingImageIOCreateCroppedAndScaledThumbnailToSatisfyConstraints(v33, (CGInterpolationQuality)a9, v21, v22, v25, v27, v26);
        CGImageRelease(v34);
        return v35;
      }
    }
    _log_1();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_2(v24);
  }

  return 0;
}

CGImage *QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource(CGImageSource *a1, _BYTE *a2, uint64_t a3, int a4, double a5, double a6, double a7, double a8)
{
  return QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType(a1, a5, a6, a7, a8, (uint64_t)a2, 0, a2, a3, a4);
}

CGImageSourceRef QLThumbnailingImageIOCreateImageSourceFromData(const __CFData *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  const void **v7;
  const void **v8;
  CFIndex v9;
  const __CFDictionary *v10;
  CGImageSourceRef v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = *MEMORY[0x24BDD97E0];
    v14[0] = *MEMORY[0x24BDD9810];
    v14[1] = v3;
    v4 = *MEMORY[0x24BDBD268];
    v13[0] = a2;
    v13[1] = v4;
    v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    v7 = (const void **)v14;
    v8 = (const void **)v13;
    v9 = 2;
  }
  else
  {
    v7 = (const void **)MEMORY[0x24BDD97E0];
    v8 = (const void **)MEMORY[0x24BDBD268];
    v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    v9 = 1;
  }
  v10 = CFDictionaryCreate(0, v7, v8, v9, v5, v6);
  v11 = CGImageSourceCreateWithData(a1, v10);
  if (v10)
    CFRelease(v10);
  return v11;
}

uint64_t QLStackTrace()
{
  return 0;
}

void QLSInitLogging()
{
  if (QLSInitLogging_once != -1)
    dispatch_once(&QLSInitLogging_once, &__block_literal_global_2);
}

void sub_20D4D4FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D4D5344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t QLCreateReservedBitmapContextWithSize(CGColorSpace *a1)
{
  CGColorSpace *DeviceRGB;

  if (a1)
  {
    DeviceRGB = a1;
    CFRetain(a1);
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  _QLComputeValuesForCGContextCreationWithSizeAndScale();
  CGColorSpaceRelease(DeviceRGB);
  return 0;
}

CGImageRef QLCreateImageWithBitmapContext(CGContext *a1)
{
  CGColorSpace *ColorSpace;
  void *Data;
  size_t BytesPerRow;
  size_t Height;
  CGDataProvider *v6;
  size_t Width;
  size_t v8;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t v11;
  CGBitmapInfo BitmapInfo;
  CGImageRef v13;

  ColorSpace = CGBitmapContextGetColorSpace(a1);
  Data = CGBitmapContextGetData(a1);
  BytesPerRow = CGBitmapContextGetBytesPerRow(a1);
  Height = CGBitmapContextGetHeight(a1);
  v6 = CGDataProviderCreateWithData(0, Data, Height * BytesPerRow, 0);
  Width = CGBitmapContextGetWidth(a1);
  v8 = CGBitmapContextGetHeight(a1);
  BitsPerComponent = CGBitmapContextGetBitsPerComponent(a1);
  BitsPerPixel = CGBitmapContextGetBitsPerPixel(a1);
  v11 = CGBitmapContextGetBytesPerRow(a1);
  BitmapInfo = CGBitmapContextGetBitmapInfo(a1);
  v13 = CGImageCreate(Width, v8, BitsPerComponent, BitsPerPixel, v11, ColorSpace, BitmapInfo, v6, 0, 0, kCGRenderingIntentDefault);
  CFRelease(v6);
  return v13;
}

CGImageRef QLCreateImageWithMallocedBitmapContextTransferData(CGContext *a1)
{
  CGColorSpace *ColorSpace;
  void *Data;
  size_t BytesPerRow;
  size_t Height;
  CGDataProvider *v6;
  size_t Width;
  size_t v8;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t v11;
  CGBitmapInfo BitmapInfo;
  CGImageRef v13;

  ColorSpace = CGBitmapContextGetColorSpace(a1);
  Data = CGBitmapContextGetData(a1);
  BytesPerRow = CGBitmapContextGetBytesPerRow(a1);
  Height = CGBitmapContextGetHeight(a1);
  v6 = CGDataProviderCreateWithData(0, Data, Height * BytesPerRow, (CGDataProviderReleaseDataCallback)_DataFree);
  Width = CGBitmapContextGetWidth(a1);
  v8 = CGBitmapContextGetHeight(a1);
  BitsPerComponent = CGBitmapContextGetBitsPerComponent(a1);
  BitsPerPixel = CGBitmapContextGetBitsPerPixel(a1);
  v11 = CGBitmapContextGetBytesPerRow(a1);
  BitmapInfo = CGBitmapContextGetBitmapInfo(a1);
  v13 = CGImageCreate(Width, v8, BitsPerComponent, BitsPerPixel, v11, ColorSpace, BitmapInfo, v6, 0, 0, kCGRenderingIntentDefault);
  CFRelease(v6);
  return v13;
}

void _DataFree(int a1, void *a2)
{
  free(a2);
}

CGImageRef QLCreateImageWithBlock(void *a1)
{
  void (**v1)(id, uint64_t);
  uint64_t v2;
  CGContext *v3;
  CGImageRef v4;

  v1 = a1;
  v2 = QLCreateReservedBitmapContextWithSize(0);
  if (v2)
  {
    v3 = (CGContext *)v2;
    v1[2](v1, v2);
    v4 = QLCreateImageWithMallocedBitmapContextTransferData(v3);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t QLCreateMallocedBitmapContextWithSizeAndColorSpace(CGColorSpace *a1)
{
  return QLCreateReservedBitmapContextWithSize(a1);
}

CGContext *_QLDestroyReservedBitmapContext(CGContext *result, uint64_t (*a2)(CGContext *, size_t))
{
  CGContext *v2;
  CGContext *v3;
  size_t Height;
  size_t v5;

  if (result && a2)
  {
    v2 = result;
    result = (CGContext *)CGBitmapContextGetData(result);
    if (result)
    {
      v3 = result;
      Height = CGBitmapContextGetHeight(v2);
      v5 = CGBitmapContextGetBytesPerRow(v2) * Height;
      return (CGContext *)a2(v3, v5);
    }
  }
  return result;
}

uint64_t QLCreateMallocedBitmapContextWithSize()
{
  return QLCreateReservedBitmapContextWithSize(0);
}

void *_MallocReserve(size_t a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x34FD80C3uLL);
}

uint64_t QLCreateMallocedBitmapContextWithSizeSupportingSubPixelAntialiasing()
{
  return QLCreateReservedBitmapContextWithSize(0);
}

CGContextRef QLCreateMallocedGrayscaleContextWithSize(double a1, double a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  CGContextRef v5;
  void *v7;
  void *v8;
  CGColorSpace *DeviceGray;
  CGColorSpace *v10;
  uint64_t v11;
  NSObject *v12;

  v2 = (unint64_t)a1;
  v3 = (unint64_t)a2;
  if ((unint64_t)a1)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
    return 0;
  v5 = 0;
  if (!is_mul_ok(v2, v3))
    return v5;
  v7 = malloc_type_calloc(v2 * v3, 1uLL, 0x85793EADuLL);
  if (!v7)
  {
    v11 = MEMORY[0x24BDE5F50];
    v12 = *(NSObject **)(MEMORY[0x24BDE5F50] + 120);
    if (!v12)
    {
      QLTInitLogging();
      v12 = *(NSObject **)(v11 + 120);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      QLCreateMallocedGrayscaleContextWithSize_cold_1(v12);
    return 0;
  }
  v8 = v7;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  if (!DeviceGray)
  {
    free(v8);
    return 0;
  }
  v10 = DeviceGray;
  v5 = CGBitmapContextCreate(v8, v2, v3, 8uLL, v2, DeviceGray, 0);
  CGColorSpaceRelease(v10);
  if (!v5)
    free(v8);
  return v5;
}

void _QLDestroyMallocedBitmapContext(CGContext *a1)
{
  void *Data;
  void *v3;

  if (a1)
  {
    Data = CGBitmapContextGetData(a1);
    if (Data)
    {
      v3 = Data;
      CGBitmapContextGetHeight(a1);
      CGBitmapContextGetBytesPerRow(a1);
      free(v3);
    }
  }
}

void QLContextSetGrayFillColor(CGContext *a1, CGFloat a2, CGFloat a3)
{
  CGColor *GenericGrayGamma2_2;

  GenericGrayGamma2_2 = CGColorCreateGenericGrayGamma2_2(a2, a3);
  CGContextSetFillColorWithColor(a1, GenericGrayGamma2_2);
  CFRelease(GenericGrayGamma2_2);
}

void QLContextSetGrayStrokeColor(CGContext *a1, CGFloat a2, CGFloat a3)
{
  CGColor *GenericGrayGamma2_2;

  GenericGrayGamma2_2 = CGColorCreateGenericGrayGamma2_2(a2, a3);
  CGContextSetStrokeColorWithColor(a1, GenericGrayGamma2_2);
  CFRelease(GenericGrayGamma2_2);
}

void QLContextSetRGBFillColor(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGColor *SRGB;

  SRGB = CGColorCreateSRGB(a2, a3, a4, a5);
  CGContextSetFillColorWithColor(a1, SRGB);
  CFRelease(SRGB);
}

void QLContextSetRGBStrokeColor(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGColor *SRGB;

  SRGB = CGColorCreateSRGB(a2, a3, a4, a5);
  CGContextSetStrokeColorWithColor(a1, SRGB);
  CFRelease(SRGB);
}

id _log_2()
{
  uint64_t v0;
  void *v1;

  v0 = MEMORY[0x24BDE5F50];
  v1 = *(void **)(MEMORY[0x24BDE5F50] + 160);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 160);
  }
  return v1;
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

void sub_20D4DA328(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DA424(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DA890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  id v17;
  NSObject *v18;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  if (a2 == 1)
  {
    v17 = objc_begin_catch(a1);
    _log_2();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[QLPreviewParts computePreviewInThread].cold.1();

    objc_end_catch();
    JUMPOUT(0x20D4DA870);
  }
  _Unwind_Resume(a1);
}

void sub_20D4DAC68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DAD7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DADF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DAF1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DB094(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DB16C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DB314(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D4DB3DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void QLPreviewCopyEmbeddedIWorkData_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_20D4C7000, log, OS_LOG_TYPE_DEBUG, "Looking inside %@", buf, 0xCu);

}

void QLPreviewCopyEmbeddedIWorkData_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4C7000, v0, v1, "Unable to determine whether %@ is a directory: %@");
  OUTLINED_FUNCTION_2();
}

void QLGuessEncodingForTextFileAtURL_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4C7000, v0, v1, "Error while attempting to read data from file '%@' for encoding detection: %@");
  OUTLINED_FUNCTION_2();
}

void QLGuessEncodingForTextFileAtURL_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4C7000, v0, v1, "Error while attempting to get attributes from file '%@': %@");
  OUTLINED_FUNCTION_2();
}

void QLPlistDataForFile_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4C7000, v0, v1, "Could not read %@: %@");
}

void QLPlistDataForFile_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D4C7000, v0, v1, "Could not retrieve file size for %@: %@");
}

void _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, a1, a3, "_QLMachDispatchIncomingMessageAndReplyIfNecessary: Sent last message without voucher. (%s)", a5, a6, a7, a8, 2u);
}

void _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, a1, a3, "_QLMachDispatchIncomingMessageAndReplyIfNecessary: Sent last message with voucher attached. Clearing voucher now. (%s)", a5, a6, a7, a8, 2u);
}

void _QLMachGetMachPortCount_cold_1(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v1, v2, "Can't deallocate port types array: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_0();
}

void _QLMachGetMachPortCount_cold_2(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v1, v2, "Can't deallocate port names array: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_0();
}

void _QLMachGetMachPortCount_cold_3(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0_0(&dword_20D4C7000, v1, v2, "Can't get task port list: %s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_0();
}

void QLImageIOCreateScaledImageOfMaximumAndMinimumSize_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20D4C7000, log, OS_LOG_TYPE_FAULT, "Could not create CGContext to draw thumbnail smaller than minimum dimension.", v1, 2u);
}

void QLImageIOCreateCroppedImageRef_cold_1()
{
  __assert_rtn("QLImageIOCreateCroppedImageRef", "QLThumbnailingImageIO.m", 460, "imageRef != NULL");
}

void QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_1(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_20D4C7000, log, OS_LOG_TYPE_ERROR, "Will not generate thumbnail from image because it has an incorrect size: (%f, %f)", (uint8_t *)&v3, 0x16u);
}

void QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D4C7000, log, OS_LOG_TYPE_ERROR, "Could not generate thumbnail from image.", v1, 2u);
}

void QLCreateMallocedGrayscaleContextWithSize_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D4C7000, log, OS_LOG_TYPE_ERROR, "Can't malloc bitmap data", v1, 2u);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
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

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x24BDBC4F8](theString);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x24BDBD940](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x24BDBD948](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x24BDBD950](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x24BDBD958](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBD960](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA98](gray, alpha);
}

CGColorRef CGColorCreateGenericGrayGamma2_2(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA0](gray, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return MEMORY[0x24BDBDE08]();
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x24BDBDF80](c, allowsAntialiasing);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

uint64_t CGContextSetLineWidthThreshold()
{
  return MEMORY[0x24BDBE040]();
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

uint64_t CGContextSetTextGreekingThreshold()
{
  return MEMORY[0x24BDBE0E8]();
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
  MEMORY[0x24BDBE110](c, points, count);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE148](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x24BDBE160](consumer);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x24BDBE528](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x24BDBE6D0]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9190](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x24BDD91A0](isrc);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x24BDBE8D8](context, pageInfo);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x24BDBE8E8](context);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F0](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x24BDBE900](context);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x24BDBEC08](retstr, page, *(_QWORD *)&box, *(_QWORD *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x24BDBEC18](page);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEF98]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x24BDBEFA8](dict, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x24BDBF130]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x24BDBF140](dict, size);
}

uint64_t QLTCreateCGContext()
{
  return MEMORY[0x24BDE5F20]();
}

uint64_t QLTCreateCGContextWithSize()
{
  return MEMORY[0x24BDE5F28]();
}

uint64_t QLTImageClassWithError()
{
  return MEMORY[0x24BDE5F30]();
}

uint64_t QLTInitLogging()
{
  return MEMORY[0x24BDE5F38]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x24BDC15A8](inUTI, inConformsToUTI);
}

uint64_t UTTypeCopyParentIdentifiers()
{
  return MEMORY[0x24BDC15C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _QLComputeValuesForCGContextCreationWithSizeAndScale()
{
  return MEMORY[0x24BDE5F48]();
}

uint64_t _UTTypeCopyPedigreeSet()
{
  return MEMORY[0x24BDC1630]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t archive_entry_pathname_w()
{
  return MEMORY[0x24BEDA370]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x24BEDA3F8]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x24BEDA400]();
}

uint64_t archive_errno()
{
  return MEMORY[0x24BEDA428]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_read_data()
{
  return MEMORY[0x24BEDA458]();
}

uint64_t archive_read_data_skip()
{
  return MEMORY[0x24BEDA470]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x24BEDA4F8]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x24BEDA500]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x24BEDA528]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x24BEDA540]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x24BDAEBD0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_names(ipc_space_t task, mach_port_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_port_type_array_t *types, mach_msg_type_number_t *typesCnt)
{
  return MEMORY[0x24BDAEC00](*(_QWORD *)&task, names, namesCnt, types, typesCnt);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x24BDAEC08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t ucsdet_close()
{
  return MEMORY[0x24BEDC120]();
}

uint64_t ucsdet_detect()
{
  return MEMORY[0x24BEDC128]();
}

uint64_t ucsdet_getName()
{
  return MEMORY[0x24BEDC130]();
}

uint64_t ucsdet_open()
{
  return MEMORY[0x24BEDC138]();
}

uint64_t ucsdet_setText()
{
  return MEMORY[0x24BEDC140]();
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3730](src, dest, *(_QWORD *)&flags);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

void voucher_mach_msg_clear(mach_msg_header_t *msg)
{
  MEMORY[0x24BDB0410](msg);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0420](msg);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x24BDB04D0](a1);
}

