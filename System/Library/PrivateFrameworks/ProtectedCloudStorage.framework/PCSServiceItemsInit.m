@implementation PCSServiceItemsInit

void __PCSServiceItemsInit_block_invoke()
{
  const __CFAllocator *v0;
  CFURLRef v1;
  const void *v2;
  uint64_t v3;
  CFStringRef v4;
  __CFReadStream *v5;
  __CFReadStream *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  CFURLRef url;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  PCSServiceItemsInit_localServiceItems = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v1 = CFURLCreateWithFileSystemPath(v0, CFSTR("/System/Library/Preferences/ProtectedCloudStorage/Identities"), kCFURLPOSIXPathStyle, 1u);
  v9 = 0;
  url = 0;
  v2 = (const void *)MEMORY[0x1AF414C2C](v0, v1, 2, 0);
  do
  {
    while (1)
    {
      v3 = MEMORY[0x1AF414C38](v2, &url, 0);
      if (v3 != 1)
        break;
      v4 = CFURLCopyPathExtension(url);
      if (CFEqual(v4, CFSTR("plist")))
      {
        v5 = CFReadStreamCreateWithFile(v0, url);
        if (v5)
        {
          v6 = v5;
          if (CFReadStreamOpen(v5))
          {
            v7 = (const __CFDictionary *)CFPropertyListCreateWithStream(v0, v6, 0, 0, (CFPropertyListFormat *)&v9, 0);
            if (v7)
            {
              v8 = v7;
              __PCSServiceItemsInit_block_invoke_2((int)v7, v7);
              CFRelease(v8);
            }
          }
          CFRelease(v6);
        }
      }
      if (v4)
        CFRelease(v4);
    }
  }
  while (v3 != 2);
  if (v2)
    CFRelease(v2);
  if (v1)
    CFRelease(v1);
}

void __PCSServiceItemsInit_block_invoke_2(int a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  const __CFNumber *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const void *v8;
  CFTypeRef *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  BOOL v15;
  const void *v16;
  BOOL v17;
  const void *v18;
  _BOOL4 v19;
  const __CFString *v20;
  const __CFAllocator *v21;
  uint64_t Instance;
  uint64_t v23;
  BOOL v24;
  const __CFString *v25;
  const __CFString *v26;
  CFTypeID v27;
  CFStringRef Copy;
  BOOL v29;
  const __CFString *v30;
  CFTypeID v31;
  CFNumberRef v32;
  CFTypeID v33;
  CFStringRef v34;
  const __CFString *v35;
  CFTypeID v36;
  CFStringRef v37;
  CFTypeID v38;
  CFStringRef v39;
  CFStringRef v40;
  const __CFString *v41;
  int v42;
  int v43;
  BOOL v44;
  char v45;
  int v46;
  CFTypeID v47;
  CFStringRef v48;
  int v49;
  CFTypeID v50;
  CFStringRef v51;
  const void *v52;
  const __CFString *v53;
  CFStringRef v54;
  const __CFNumber *v55;
  const __CFString *v56;
  BOOL v57;
  BOOL v58;
  const __CFNumber *number;
  BOOL v60;
  _BOOL4 v61;
  _BOOL4 v62;
  const __CFString *v63;
  const __CFString *cf;
  uint64_t v65;
  uint64_t valuePtr;

  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("ServiceName"));
  cf = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("OldName"));
  v4 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ServiceNumber"));
  v5 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("ViewHint"));
  v6 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("KCItemClass"));
  v7 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("KeyDescription"));
  v8 = CFDictionaryGetValue(theDict, CFSTR("Classic7"));
  v9 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  if (v8)
    v58 = CFEqual(v8, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
  else
    v58 = 0;
  v10 = CFDictionaryGetValue(theDict, CFSTR("RollIdentity"));
  if (v10)
    v62 = CFEqual(v10, *v9) != 0;
  else
    v62 = 0;
  v11 = CFDictionaryGetValue(theDict, CFSTR("Manatee"));
  if (v11)
    v61 = CFEqual(v11, *v9) != 0;
  else
    v61 = 0;
  v12 = CFDictionaryGetValue(theDict, CFSTR("Authorship"));
  if (v12)
    v57 = CFEqual(v12, *v9) != 0;
  else
    v57 = 0;
  v13 = CFDictionaryGetValue(theDict, CFSTR("Escrow"));
  if (v13)
    v60 = CFEqual(v13, *v9) != 0;
  else
    v60 = 0;
  v14 = CFDictionaryGetValue(theDict, CFSTR("AllowKeyExport"));
  if (v14)
    v15 = CFEqual(v14, *v9) != 0;
  else
    v15 = 0;
  v16 = CFDictionaryGetValue(theDict, CFSTR("AnonymousSharing"));
  if (v16)
    v17 = CFEqual(v16, *v9) != 0;
  else
    v17 = 0;
  v18 = CFDictionaryGetValue(theDict, CFSTR("ManateeSharing"));
  v63 = v7;
  if (v18)
    v19 = CFEqual(v18, *v9) != 0;
  else
    v19 = 0;
  number = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RollInterval"));
  v20 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("AccessGroup"));
  v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  PCSServiceItemGetTypeID();
  Instance = _CFRuntimeCreateInstance();
  v23 = Instance;
  if (!Instance)
    goto LABEL_80;
  v56 = v20;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_QWORD *)(Instance + 16) = 0;
  *(_WORD *)(Instance + 72) = 256;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_QWORD *)(Instance + 24) = 0x3B538000000000;
  *(_QWORD *)(Instance + 64) = 0;
  *(_QWORD *)(Instance + 88) = 0;
  *(_QWORD *)(Instance + 74) = 0;
  *(_WORD *)(Instance + 82) = 0;
  if (Value)
  {
    v55 = v4;
    v24 = v17;
    v25 = v5;
    v26 = v6;
    v27 = CFGetTypeID(Value);
    if (v27 == CFStringGetTypeID())
      Copy = CFStringCreateCopy(v21, Value);
    else
      Copy = 0;
    v6 = v26;
    v5 = v25;
    v17 = v24;
    v4 = v55;
  }
  else
  {
    Copy = 0;
  }
  *(_QWORD *)(v23 + 16) = Copy;
  if (v4)
  {
    v29 = v15;
    v30 = v6;
    LODWORD(valuePtr) = 0;
    CFNumberGetValue(v4, kCFNumberSInt32Type, &valuePtr);
    *(_DWORD *)(v23 + 24) = valuePtr;
    v31 = CFGetTypeID(v4);
    if (v31 == CFNumberGetTypeID())
    {
      v65 = 0;
      CFNumberGetValue(v4, kCFNumberCFIndexType, &v65);
      valuePtr = v65;
      v32 = CFNumberCreate(v21, kCFNumberCFIndexType, &valuePtr);
    }
    else
    {
      v32 = 0;
    }
    v6 = v30;
    v15 = v29;
  }
  else
  {
    v32 = 0;
    *(_DWORD *)(v23 + 24) = 0;
  }
  *(_QWORD *)(v23 + 32) = v32;
  if (cf && (v33 = CFGetTypeID(cf), v33 == CFStringGetTypeID()))
    v34 = CFStringCreateCopy(v21, cf);
  else
    v34 = 0;
  *(_QWORD *)(v23 + 40) = v34;
  if (v5 && (v35 = v5, v36 = CFGetTypeID(v5), v36 == CFStringGetTypeID()))
    v37 = CFStringCreateCopy(v21, v35);
  else
    v37 = 0;
  *(_QWORD *)(v23 + 48) = v37;
  if (!v6 || (v38 = CFGetTypeID(v6), v38 != CFStringGetTypeID()) || (v39 = CFStringCreateCopy(v21, v6)) == 0)
  {
    v41 = (const __CFString *)*MEMORY[0x1E0CD68A8];
    goto LABEL_53;
  }
  v40 = v39;
  v41 = (const __CFString *)*MEMORY[0x1E0CD68A8];
  if (!CFEqual(v39, (CFTypeRef)*MEMORY[0x1E0CD68A8]) && !CFEqual(v40, (CFTypeRef)*MEMORY[0x1E0CD68E8]))
  {
    CFRelease(v40);
LABEL_53:
    v40 = CFStringCreateCopy(v21, v41);
  }
  *(_QWORD *)(v23 + 56) = v40;
  *(_BYTE *)(v23 + 72) = v58;
  *(_BYTE *)(v23 + 77) = v60;
  *(_BYTE *)(v23 + 78) = v15;
  *(_BYTE *)(v23 + 79) = v17;
  if (number)
  {
    LODWORD(valuePtr) = 0;
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    v42 = valuePtr;
  }
  else
  {
    v42 = 0;
  }
  if (v62)
    v43 = 3888000;
  else
    v43 = -99;
  v44 = v42 <= 0;
  v45 = v42 > 0 || v62;
  *(_BYTE *)(v23 + 73) = v45;
  v46 = 60 * v42;
  if (v44)
    v46 = v43;
  *(_DWORD *)(v23 + 28) = v46;
  *(_BYTE *)(v23 + 74) = v61;
  *(_BYTE *)(v23 + 75) = v19;
  *(_BYTE *)(v23 + 76) = v61 || v57;
  if (v63 && (v47 = CFGetTypeID(v63), v47 == CFStringGetTypeID()))
    v48 = CFStringCreateCopy(v21, v63);
  else
    v48 = 0;
  *(_QWORD *)(v23 + 64) = v48;
  if (v61)
    v49 = 4;
  else
    v49 = 0;
  if (v19)
    v49 |= 8u;
  *(_DWORD *)(v23 + 80) = v49;
  if (v56 && (v50 = CFGetTypeID(v56), v50 == CFStringGetTypeID()))
    v51 = CFStringCreateCopy(v21, v56);
  else
    v51 = 0;
  *(_QWORD *)(v23 + 88) = v51;
LABEL_80:
  v52 = *(const void **)(v23 + 16);
  if (v52)
  {
    if (CFEqual(v52, CFSTR("Raw")) && *(_QWORD *)(v23 + 32))
    {
      v53 = *(const __CFString **)(v23 + 16);
      goto LABEL_87;
    }
    v53 = *(const __CFString **)(v23 + 16);
    if (v53 && *(_QWORD *)(v23 + 32) && *(_QWORD *)(v23 + 48))
    {
LABEL_87:
      v54 = CFStringCreateCopy(v21, v53);
      CFDictionaryAddValue((CFMutableDictionaryRef)PCSServiceItemsInit_localServiceItems, v54, (const void *)v23);
      CFRelease((CFTypeRef)v23);
      v23 = (uint64_t)v54;
      if (!v54)
        return;
    }
  }
  CFRelease((CFTypeRef)v23);
}

@end
