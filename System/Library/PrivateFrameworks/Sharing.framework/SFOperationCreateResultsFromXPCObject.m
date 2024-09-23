@implementation SFOperationCreateResultsFromXPCObject

uint64_t ___SFOperationCreateResultsFromXPCObject_block_invoke(uint64_t a1, char *__s1, void *a3)
{
  CFStringRef v6;
  CFStringRef v7;
  uint64_t v8;
  CFErrorRef v9;
  const __CFAllocator *v10;
  const char *string_ptr;
  const void *Internal;
  const __CFData *v14;
  const __CFData *v15;
  CFTypeID v16;
  CGImageRef CGImageWithData;
  const __CFData *v18;
  CFTypeID v19;
  int64_t int64;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  CFTypeID v23;
  const __CFDictionary *v24;

  if (!strcmp(__s1, "Operation"))
  {
    if (MEMORY[0x1A8589904](a3) == MEMORY[0x1E0C81390])
    {
      v10 = *(const __CFAllocator **)(a1 + 32);
      string_ptr = xpc_string_get_string_ptr(a3);
      v7 = CFStringCreateWithCString(v10, string_ptr, 0x8000100u);
      Internal = (const void *)_SFOperationCreateInternal(*(_QWORD *)(a1 + 32), CFSTR("Receiver"), v7);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), CFSTR("Receiver"), Internal);
      if (Internal)
        CFRelease(Internal);
      if (v7)
        goto LABEL_12;
    }
  }
  else
  {
    v6 = CFStringCreateWithCString(0, __s1, 0x8000100u);
    if (v6)
    {
      v7 = v6;
      if (CFEqual(v6, CFSTR("Node")) || CFEqual(v7, CFSTR("SenderNode")))
      {
        v8 = _SFNodeCreateWithXPCObject(*(_QWORD *)(a1 + 32), a3);
        goto LABEL_6;
      }
      if (CFEqual(v7, CFSTR("FileIcon")) || CFEqual(v7, CFSTR("SmallFileIcon")))
      {
        v14 = (const __CFData *)_CFXPCCreateCFObjectFromXPCObject();
        if (!v14)
          goto LABEL_12;
        v15 = v14;
        v16 = CFGetTypeID(v14);
        if (v16 == CFDataGetTypeID())
        {
          CGImageWithData = createCGImageWithData(v15);
LABEL_19:
          v9 = CGImageWithData;
          goto LABEL_29;
        }
      }
      else
      {
        if (!CFEqual(v7, CFSTR("Error")))
        {
          v8 = _CFXPCCreateCFObjectFromXPCObject();
LABEL_6:
          v9 = (CFErrorRef)v8;
          if (!v8)
          {
LABEL_12:
            CFRelease(v7);
            return 1;
          }
LABEL_7:
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), v7, v9);
          CFRelease(v9);
          goto LABEL_12;
        }
        if (!xpc_dictionary_get_value(a3, "Domain"))
          goto LABEL_12;
        v18 = (const __CFData *)_CFXPCCreateCFObjectFromXPCObject();
        if (!v18)
          goto LABEL_12;
        v15 = v18;
        v19 = CFGetTypeID(v18);
        if (v19 == CFStringGetTypeID())
        {
          int64 = xpc_dictionary_get_int64(a3, "Code");
          if (!xpc_dictionary_get_value(a3, "UserInfo")
            || (v21 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject()) == 0)
          {
            CGImageWithData = CFErrorCreate(*(CFAllocatorRef *)(a1 + 32), (CFErrorDomain)v15, int64, 0);
            goto LABEL_19;
          }
          v22 = v21;
          v23 = CFGetTypeID(v21);
          if (v23 == CFDictionaryGetTypeID())
            v24 = v22;
          else
            v24 = 0;
          v9 = CFErrorCreate(*(CFAllocatorRef *)(a1 + 32), (CFErrorDomain)v15, int64, v24);
          CFRelease(v22);
LABEL_29:
          CFRelease(v15);
          if (!v9)
            goto LABEL_12;
          goto LABEL_7;
        }
      }
      v9 = 0;
      goto LABEL_29;
    }
  }
  return 1;
}

@end
