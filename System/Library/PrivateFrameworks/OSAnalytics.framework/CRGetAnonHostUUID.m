@implementation CRGetAnonHostUUID

void ___CRGetAnonHostUUID_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  const __CFAllocator *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  __CFReadStream *v5;
  __CFReadStream *v6;
  CFPropertyListRef v7;
  CFTypeID TypeID;
  const void *Value;
  const void *v10;
  CFTypeID v11;
  CFStringRef v12;
  const __CFString *v13;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v15;
  int v16;
  int v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  const __CFUUID *v22;
  const __CFUUID *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFUUID *v26;
  const __CFUUID *v27;
  CFStringRef v28;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  char *v30;
  char *v31;
  CFDataRef Data;
  const __CFData *v33;
  int v34;
  int v35;
  mode_t v36;
  CFIndex Length;
  const UInt8 *BytePtr;
  ssize_t v39;
  CFUUIDBytes v40;
  timespec v41;
  stat v42;
  stat v43;
  uuid_t v44;
  char buffer[4];
  __int128 v46;
  __int128 v47;
  char v48;
  _QWORD __buf[2];
  _WORD v50[4];
  int v51;
  uint64_t v52;
  _QWORD v53[2];
  _QWORD v54[2];
  char __str[6];
  __int16 v56;
  int v57;
  uint64_t v58;
  _QWORD v59[5];

  v59[2] = *MEMORY[0x1E0C80C00];
  v0 = _CRCopyAnonHostUUIDPath();
  if (v0)
  {
    v1 = v0;
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v0, kCFURLPOSIXPathStyle, 0);
    if (v3)
    {
      v4 = v3;
      v5 = CFReadStreamCreateWithFile(v2, v3);
      if (v5)
      {
        v6 = v5;
        if (CFReadStreamOpen(v5))
        {
          v7 = CFPropertyListCreateWithStream(v2, v6, 0, 0, 0, 0);
          if (v7)
          {
            TypeID = CFDictionaryGetTypeID();
            if (TypeID != CFGetTypeID(v7))
            {
              CFRelease(v7);
              v7 = 0;
            }
          }
          CFReadStreamClose(v6);
        }
        else
        {
          v7 = 0;
        }
        CFRelease(v6);
        CFRelease(v4);
        if (v7)
        {
          Value = CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("AnonHostUUID2"));
          if (Value)
          {
            v10 = Value;
            v11 = CFGetTypeID(Value);
            if (v11 == CFStringGetTypeID())
              _CRGetAnonHostUUID___uuid = (uint64_t)CFRetain(v10);
          }
          CFRelease(v7);
          goto LABEL_65;
        }
      }
      else
      {
        CFRelease(v4);
      }
    }
    if (geteuid())
    {
LABEL_65:
      CFRelease(v1);
      return;
    }
    v12 = _CRCopyAnonHostUUIDPath();
    if (!v12)
    {
      v28 = 0;
LABEL_64:
      _CRGetAnonHostUUID___uuid = (uint64_t)v28;
      goto LABEL_65;
    }
    v13 = v12;
    Mutable = CFDictionaryCreateMutable(v2, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (!Mutable)
    {
      v28 = 0;
LABEL_63:
      CFRelease(v13);
      goto LABEL_64;
    }
    v15 = Mutable;
    __str[5] = 0;
    v56 = 0;
    v57 = 0;
    v58 = 0;
    *(_QWORD *)((char *)v59 + 5) = 0;
    v59[0] = 0;
    strcpy(__str, "FAIL");
    v54[0] = 0;
    v54[1] = 0;
    v16 = open("/dev/urandom", 0);
    if (v16 >= 1)
    {
      v17 = v16;
      if (read(v16, v54, 0x10uLL) == 16)
      {
        v18 = 0;
        v19 = __str;
        do
        {
          snprintf(v19, 3uLL, "%02X", *((unsigned __int8 *)v54 + v18++));
          v19 += 2;
        }
        while (v18 != 16);
      }
      close(v17);
    }
    HIBYTE(v50[2]) = 0;
    v50[3] = 0;
    v51 = 0;
    v52 = 0;
    *(_QWORD *)((char *)v53 + 5) = 0;
    v53[0] = 0;
    strcpy((char *)v50, "FAIL");
    __buf[0] = 0;
    __buf[1] = 0;
    arc4random_buf(__buf, 0x10uLL);
    v20 = 0;
    v21 = (char *)v50;
    do
    {
      snprintf(v21, 3uLL, "%02X", *((unsigned __int8 *)__buf + v20++));
      v21 += 2;
    }
    while (v20 != 16);
    v48 = 0;
    v47 = 0u;
    v46 = 0u;
    *(_DWORD *)buffer = 1279869254;
    v22 = CFUUIDCreate(v2);
    if (v22)
    {
      v23 = v22;
      v24 = CFUUIDCreateString(v2, v22);
      if (v24)
      {
        v25 = v24;
        CFStringGetCString(v24, buffer, 37, 0x8000100u);
        CFRelease(v25);
      }
      CFRelease(v23);
    }
    memset(v44, 0, sizeof(v44));
    v41 = (timespec)xmmword_1A4D610D0;
    gethostuuid(v44, &v41);
    arc4random_addrandom(v44, 16);
    *(_QWORD *)&v40.byte0 = 0;
    *(_QWORD *)&v40.byte8 = 0;
    arc4random_buf(&v40, 0x10uLL);
    v26 = CFUUIDCreateFromUUIDBytes(v2, v40);
    if (!v26)
    {
      v28 = 0;
LABEL_62:
      CFRelease(v15);
      goto LABEL_63;
    }
    v27 = v26;
    v28 = CFUUIDCreateString(v2, v26);
    if (!v28)
    {
LABEL_61:
      CFRelease(v27);
      goto LABEL_62;
    }
    CFDictionarySetValue(v15, CFSTR("AnonHostUUID2"), v28);
    MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v13);
    v30 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xDC284E35uLL);
    if (v30)
    {
      v31 = v30;
      if (CFStringGetFileSystemRepresentation(v13, v30, MaximumSizeOfFileSystemRepresentation))
      {
        Data = CFPropertyListCreateData(v2, v15, kCFPropertyListBinaryFormat_v1_0, 0, 0);
        if (Data)
        {
          v33 = Data;
          memset(&v43, 0, sizeof(v43));
          memset(&v42, 0, sizeof(v42));
          if (lstat(v31, &v42) < 0)
          {
            if (*__error() == 2)
            {
              v36 = umask(0);
              v35 = open(v31, 2594, 420);
              umask(v36);
              if ((v35 & 0x80000000) == 0)
              {
                fchown(v35, 0xFFFFFFFF, 0xFFFFFFFF);
                goto LABEL_52;
              }
            }
          }
          else if (v42.st_mode == 33188 && v42.st_nlink == 1)
          {
            v34 = open(v31, 546, 0);
            if ((v34 & 0x80000000) == 0)
            {
              v35 = v34;
              if (!fstat(v34, &v43)
                && v43.st_nlink == v42.st_nlink
                && v43.st_uid == v42.st_uid
                && v43.st_mode == v42.st_mode
                && v43.st_ino == v42.st_ino
                && v43.st_dev == v42.st_dev)
              {
                ftruncate(v35, 0);
LABEL_52:
                Length = CFDataGetLength(v33);
                BytePtr = CFDataGetBytePtr(v33);
                v39 = write(v35, BytePtr, Length);
                if (v39 != Length && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  ___CRGetAnonHostUUID_block_invoke_cold_1((uint64_t)v31, Length, v39);
                close(v35);
                CFRelease(v33);
                free(v31);
                if (v39)
                  goto LABEL_61;
                goto LABEL_60;
              }
              close(v35);
            }
          }
          CFRelease(v33);
        }
      }
      free(v31);
    }
LABEL_60:
    CFRelease(v28);
    v28 = 0;
    goto LABEL_61;
  }
}

void ___CRGetAnonHostUUID_block_invoke_cold_1(uint64_t a1, int a2, uint64_t a3)
{
  uid_t v6;
  gid_t v7;
  uid_t v8;
  gid_t v9;
  int v10;
  int *v11;
  char *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uid_t v20;
  __int16 v21;
  gid_t v22;
  __int16 v23;
  uid_t v24;
  __int16 v25;
  gid_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = getuid();
  v7 = getgid();
  v8 = geteuid();
  v9 = getegid();
  v10 = *__error();
  v11 = __error();
  v12 = strerror(*v11);
  v13 = 136317186;
  v14 = a1;
  v15 = 2048;
  v16 = a3;
  v17 = 1024;
  v18 = a2;
  v19 = 1024;
  v20 = v6;
  v21 = 1024;
  v22 = v7;
  v23 = 1024;
  v24 = v8;
  v25 = 1024;
  v26 = v9;
  v27 = 1024;
  v28 = v10;
  v29 = 2080;
  v30 = v12;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Write failed to file %s - %zd of %d bytes written - uid: %d gid: %d, euid: %d egid: %d - error %d: %s", (uint8_t *)&v13, 0x44u);
}

@end
