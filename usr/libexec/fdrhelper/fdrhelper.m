void start()
{
  lockdown_checkin_xpc("com.apple.fdrhelper", 0, 0, &stru_1000042B0);
  dispatch_main();
}

void sub_100000E18(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  sub_100000E50((uint64_t)a2);
  lockdown_disconnect(a2);
  syslog(5, "done");
  exit(0);
}

BOOL sub_100000E50(uint64_t a1)
{
  uint64_t *v2;
  CFTypeID v3;
  const __CFString *Value;
  const __CFString *v5;
  CFTypeID v6;
  _BOOL4 v7;
  const CFBooleanRef *v8;
  _BOOL8 result;
  const __CFDictionary *v10;
  const __CFData *v11;
  const __CFData *v12;
  CFTypeID v13;
  const void *v14;
  const __CFString *v15;
  const __CFUUID *v16;
  CFStringRef v17;
  const __CFString *v18;
  const __CFURL *v19;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v22;
  CFDataRef v23;
  const __CFData *v24;
  const __CFData *v25;
  const UInt8 *v26;
  CC_LONG v27;
  const UInt8 *v28;
  BOOL v29;
  BOOL v30;
  const __CFData *v32;
  const __CFData *v33;
  const UInt8 *v34;
  CC_LONG v35;
  const UInt8 *v36;
  CFTypeRef v40;
  uint64_t v41;
  CFMutableDictionaryRef Mutable;
  uint64_t i;
  const void *v44;
  const void *v45;
  CFURLRef v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  CFURLRef v50;
  const __CFData *v51;
  CFDictionaryRef v52;
  uint64_t v53;
  uint64_t v54;
  const __CFData *v55;
  const __CFData *v56;
  CFDictionaryRef v57;
  const __CFString *v58;
  const char *CStringPtr;
  DIR *v60;
  DIR *v61;
  CFMutableArrayRef v62;
  CFMutableArrayRef v63;
  dirent *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  CFURLRef v68;
  CFURLRef v69;
  CFIndex v70;
  const __CFURL *ValueAtIndex;
  const UInt8 *v72;
  CC_LONG v73;
  CFDataRef v74;
  CFStringRef PathComponent;
  CFStringRef v76;
  uint64_t v77;
  uint64_t v78;
  const __CFURL *v79;
  CFDictionaryRef v80;
  const __CFString *v81;
  const void *v82;
  const __CFString *v83;
  CFDictionaryRef v84;
  const __CFString *v85;
  CFDictionaryRef v86;
  CFURLRef v87;
  const __CFData *v88;
  CFTypeRef v89;
  char *v90;
  const __CFString *v91;
  CFTypeRef v92;
  const __CFData *v93;
  const __CFData *v94;
  CFStringRef v95;
  CFTypeRef v96;
  CFTypeRef v97;
  CFTypeRef cf;
  char v99;
  CFIndex v100;
  const UInt8 *v101;
  CFTypeRef v102;
  CFTypeRef v103;
  CFTypeRef v104;
  CFTypeRef v105;
  CFDataRef theData;
  CFBooleanRef v107;
  const __CFString *v108;
  void *v109[15];
  void *v110[2];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  const __CFString *v117;
  void *v118[16];
  void *v119[2];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  UInt8 buffer[1024];
  void *values[7];
  void *keys[2];
  __int128 v130;
  __int128 v131;
  const __CFString *v132;
  _OWORD v133[28];
  uint64_t v134;
  unsigned __int8 v135[16];
  __int128 v136;
  unsigned __int8 md[16];
  __int128 v138;
  const void *v139[3];
  UInt8 bytes[16];
  __int128 v141;

  cf = 0;
  syslog(5, "fdrhelper got a connection");
  v2 = &qword_100008000;
  qword_100008008 = a1;
  if (lockdown_receive_message(a1, &cf) || !cf)
  {
    syslog(3, "Lockdown connection disconnected");
    goto LABEL_9;
  }
  v3 = CFGetTypeID(cf);
  if (v3 != CFDictionaryGetTypeID())
  {
    syslog(3, "Failed to parse recieved message");
    goto LABEL_9;
  }
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Operation"));
  if (!Value || (v5 = Value, v6 = CFGetTypeID(Value), v6 != CFStringGetTypeID()))
  {
    syslog(3, "Failed to parse operation");
    goto LABEL_9;
  }
  if (CFStringCompare(v5, CFSTR("PerformFDRPreflight"), 0))
  {
    CFStringGetCStringPtr(v5, 0x8000100u);
    syslog(3, "Unknown operation %s");
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v10 = (const __CFDictionary *)cf;
  v104 = 0;
  v105 = 0;
  *(_OWORD *)md = 0u;
  v138 = 0u;
  *(_OWORD *)v135 = 0u;
  v136 = 0u;
  v102 = 0;
  v103 = 0;
  if (!AMFDRSealingMapGetEntriesForDevice())
  {
    sub_100002024(3, CFSTR("FDR is not supported."));
    goto LABEL_179;
  }
  AMFDRLogSetHandler(sub_100002130);
  v11 = (const __CFData *)CFDictionaryGetValue(v10, CFSTR("ApTicketData"));
  if (!v11 || (v12 = v11, v13 = CFGetTypeID(v11), v13 != CFDataGetTypeID()))
  {
    sub_100002024(3, CFSTR("Failed in getting apTicketData"));
LABEL_179:
    v7 = 0;
    v57 = 0;
    v96 = 0;
    v97 = 0;
    v55 = 0;
    v56 = 0;
    v23 = 0;
    v90 = 0;
    v92 = 0;
    v87 = 0;
    v88 = 0;
    v84 = 0;
    v86 = 0;
    v89 = 0;
    v95 = 0;
    Mutable = 0;
    v82 = 0;
    goto LABEL_97;
  }
  v14 = CFDictionaryGetValue(v10, CFSTR("FDRTrustObjectURL"));
  v15 = (const __CFString *)CFDictionaryGetValue(v10, CFSTR("FDRDataStoreURL"));
  v85 = (const __CFString *)CFDictionaryGetValue(v10, CFSTR("FDRCAURL"));
  v91 = (const __CFString *)CFDictionaryGetValue(v10, CFSTR("FDRSealingURL"));
  v16 = CFUUIDCreate(0);
  v17 = CFUUIDCreateString(0, v16);
  v18 = CFStringCreateWithFormat(0, 0, CFSTR("/tmp/FDR_%@"), v17);
  v19 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v18, kCFURLPOSIXPathStyle, 1u);
  if (v16)
    CFRelease(v16);
  if (v17)
    CFRelease(v17);
  if (v18)
    CFRelease(v18);
  if (AMSupportMakeDirectory(v19))
  {
    sub_100002024(3, CFSTR("Failed in creating temp data store directory %@"), v19);
LABEL_183:
    v7 = 0;
    v80 = 0;
    v96 = 0;
    v93 = 0;
    v94 = 0;
    v23 = 0;
    goto LABEL_83;
  }
  v134 = 0;
  memset(v133, 0, sizeof(v133));
  v100 = 0;
  v101 = 0;
  BytePtr = CFDataGetBytePtr(v12);
  Length = CFDataGetLength(v12);
  if (Img4DecodeInitManifest((uint64_t)BytePtr, Length, (uint64_t)v133))
  {
    sub_100002024(3, CFSTR("Failed to parse AP ticket as Img4 manifest"), v77);
    goto LABEL_183;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v133, 1919317089, 1145525076, &v101, &v100);
  if (v22)
  {
    sub_100002024(3, CFSTR("Failed to parse property %llu on object %llu"), 1145525076, 1919317089);
    goto LABEL_183;
  }
  v23 = CFDataCreate(kCFAllocatorDefault, v101, v100);
  if (!v23)
  {
    sub_100002024(3, CFSTR("failed to allocate CFData for property"));
LABEL_186:
    v7 = 0;
    v80 = 0;
    v96 = 0;
    v93 = 0;
    v94 = 0;
    goto LABEL_83;
  }
  if (AMFDRCopyDeviceKeys(kSecAttrKeyTypeRSA, &v104, &v103))
  {
    sub_100002024(3, CFSTR("Failed to copy device keys."));
    goto LABEL_186;
  }
  v83 = v15;
  v24 = (const __CFData *)sub_1000021A0(v23, 0, (uint64_t)v14, (void *)v104, (void *)v103);
  v94 = v24;
  if (!v24)
    goto LABEL_41;
  v25 = v24;
  v26 = CFDataGetBytePtr(v24);
  v27 = CFDataGetLength(v25);
  CC_SHA256(v26, v27, md);
  v28 = CFDataGetBytePtr(v23);
  v29 = *(_QWORD *)md == *(_QWORD *)v28 && *(_QWORD *)&md[8] == *((_QWORD *)v28 + 1);
  v30 = v29 && (_QWORD)v138 == *((_QWORD *)v28 + 2);
  if (v30 && *((_QWORD *)&v138 + 1) == *((_QWORD *)v28 + 3))
  {
    v40 = CFRetain(v25);
    sub_100002024(5, CFSTR("No need to fetch new trust object."));
    v33 = 0;
  }
  else
  {
LABEL_41:
    v32 = (const __CFData *)sub_1000021A0(v23, 1, (uint64_t)v14, (void *)v104, (void *)v103);
    v33 = v32;
    if (!v32)
    {
      sub_100002024(3, CFSTR("Fail to get remote new_trust_object"));
      v7 = 0;
      v80 = 0;
      v96 = 0;
      v97 = 0;
      v92 = 0;
      v93 = 0;
      v89 = 0;
      v90 = 0;
      v87 = 0;
      v88 = 0;
      v86 = 0;
      v95 = 0;
      Mutable = 0;
LABEL_188:
      v82 = 0;
      v84 = 0;
      goto LABEL_88;
    }
    v34 = CFDataGetBytePtr(v32);
    v35 = CFDataGetLength(v33);
    CC_SHA256(v34, v35, v135);
    v36 = CFDataGetBytePtr(v23);
    if (*(_QWORD *)v135 != *(_QWORD *)v36
      || *(_QWORD *)&v135[8] != *((_QWORD *)v36 + 1)
      || (_QWORD)v136 != *((_QWORD *)v36 + 2)
      || *((_QWORD *)&v136 + 1) != *((_QWORD *)v36 + 3))
    {
      v93 = v33;
      sub_100002024(3, CFSTR("Digest of trust object retrieved from server does not match trust object digest in AP ticket"));
      v7 = 0;
      v80 = 0;
LABEL_53:
      v96 = 0;
LABEL_83:
      v90 = 0;
LABEL_84:
      v87 = 0;
      v88 = 0;
      v86 = 0;
      v92 = 0;
      v97 = 0;
LABEL_85:
      v89 = 0;
      v95 = 0;
LABEL_86:
      Mutable = 0;
      v82 = 0;
      v84 = 0;
      goto LABEL_87;
    }
    v40 = v33;
  }
  *(_OWORD *)keys = *(_OWORD *)&off_1000042D0;
  v130 = *(_OWORD *)&off_1000042E0;
  v131 = *(_OWORD *)&off_1000042F0;
  v132 = CFSTR("PrivateKey");
  values[0] = CFSTR("Local");
  values[1] = (void *)v40;
  values[2] = v23;
  values[3] = v12;
  values[4] = kCFBooleanFalse;
  values[5] = (void *)v104;
  values[6] = (void *)v103;
  v80 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 7, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v96 = (CFTypeRef)AMFDRCreateWithOptions(kCFAllocatorDefault, v80);
  v93 = v33;
  if (!v96)
  {
    sub_100002024(3, CFSTR("Failed to create local AMFDRRef"));
    v7 = 0;
    goto LABEL_53;
  }
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(v19, 1u, buffer, 1024))
  {
    sub_100002024(3, CFSTR("Failed to get path from URL"));
    v7 = 0;
    goto LABEL_83;
  }
  v90 = strdup((const char *)buffer);
  v97 = (CFTypeRef)AMFDRSealingMapCreateRecoveryPermissions(&v105);
  if (!v97)
  {
    sub_100002024(3, CFSTR("Could not create recovery permissions: %@"), v105);
    v7 = 0;
    goto LABEL_84;
  }
  v41 = MGCopyAnswer(CFSTR("UniqueChipID"), 0);
  if (!v41)
  {
    sub_100002024(3, CFSTR("Could not query ECID from MobileGestalt"));
    v7 = 0;
    v87 = 0;
    v88 = 0;
    v86 = 0;
    v92 = 0;
    goto LABEL_85;
  }
  v89 = (CFTypeRef)v41;
  v95 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@"), v41);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  for (i = 0; i != 48; i += 16)
  {
    v44 = (const void *)MGCopyAnswer(*(__CFString **)((char *)&off_100004438 + i), 0);
    if (!v44)
    {
      syslog(3, "Failed to query MobileGestalt for key.");
      if (Mutable)
        CFRelease(Mutable);
      goto LABEL_138;
    }
    v45 = v44;
    CFDictionarySetValue(Mutable, *(__CFString **)((char *)&off_100004438 + i + 8), v44);
    CFRelease(v45);
  }
  if (!Mutable)
  {
LABEL_138:
    sub_100002024(3, CFSTR("Could not create metadata"));
    v7 = 0;
    v87 = 0;
    v88 = 0;
    v86 = 0;
    v92 = 0;
    goto LABEL_86;
  }
  v33 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v19, CFSTR("certificate"), 0);
  if (!v33)
  {
    sub_100002024(3, CFSTR("Could not create certificate URL"));
    v7 = 0;
    v87 = 0;
    v88 = 0;
    v86 = 0;
    v92 = 0;
    goto LABEL_188;
  }
  v46 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v19, CFSTR("cookie"), 0);
  v88 = v33;
  if (!v46)
  {
    sub_100002024(3, CFSTR("Could not create cookie URL"));
    v7 = 0;
    v86 = 0;
    v87 = 0;
    v92 = 0;
    v82 = 0;
    v84 = 0;
    v33 = 0;
    v2 = &qword_100008000;
    goto LABEL_89;
  }
  v123 = *(_OWORD *)&off_100004348;
  v124 = *(_OWORD *)&off_100004358;
  v125 = *(_OWORD *)&off_100004368;
  v126 = *(_OWORD *)&off_100004378;
  *(_OWORD *)v119 = *(_OWORD *)&off_100004308;
  v120 = *(_OWORD *)&off_100004318;
  v121 = *(_OWORD *)&off_100004328;
  v122 = *(_OWORD *)&off_100004338;
  v118[0] = CFSTR("Local");
  v118[1] = v19;
  v79 = v19;
  v118[2] = (void *)v97;
  v118[3] = (void *)v95;
  v118[4] = Mutable;
  v118[5] = (void *)v40;
  v118[6] = v23;
  v118[7] = (void *)v104;
  v47 = CFSTR("https://gg.apple.com");
  if (v85)
    v47 = v85;
  v118[8] = (void *)v103;
  v81 = v47;
  v118[9] = (void *)v47;
  if (v83)
    v48 = v83;
  else
    v48 = CFSTR("https://skl.apple.com");
  if (v91)
    v49 = v91;
  else
    v49 = CFSTR("https://ig.apple.com");
  v118[10] = (void *)v48;
  v118[11] = (void *)v49;
  v118[12] = v12;
  v118[13] = v33;
  v118[14] = v46;
  v118[15] = kCFBooleanTrue;
  v50 = v46;
  v86 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)v119, (const void **)v118, 16, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v92 = (CFTypeRef)AMFDRCreateWithOptions(kCFAllocatorDefault, v86);
  v87 = v50;
  if (!v92)
  {
    sub_100002024(3, CFSTR("Failed to create temp AMFDRRef"));
    v7 = 0;
    v92 = 0;
    v82 = 0;
    v84 = 0;
    v33 = 0;
    v2 = &qword_100008000;
    v19 = v79;
    goto LABEL_89;
  }
  v114 = *(_OWORD *)&off_1000043C8;
  v115 = *(_OWORD *)&off_1000043D8;
  v116 = *(_OWORD *)&off_1000043E8;
  v117 = CFSTR("EnableProxy");
  *(_OWORD *)v110 = *(_OWORD *)&off_100004388;
  v111 = *(_OWORD *)&off_100004398;
  v112 = *(_OWORD *)&off_1000043A8;
  v113 = *(_OWORD *)&off_1000043B8;
  v109[0] = CFSTR("Remote");
  v109[1] = (void *)v97;
  v109[2] = (void *)v95;
  v109[3] = Mutable;
  v51 = v94;
  if (v93)
    v51 = v93;
  v109[4] = v51;
  v109[5] = v23;
  v109[6] = (void *)v104;
  v109[7] = (void *)v103;
  v109[8] = (void *)v81;
  v109[9] = (void *)v48;
  v109[10] = (void *)v49;
  v109[11] = v12;
  v109[12] = v33;
  v109[13] = v50;
  v109[14] = kCFBooleanTrue;
  v52 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)v110, (const void **)v109, 15, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v53 = AMFDRCreateWithOptions(kCFAllocatorDefault, v52);
  v84 = v52;
  if (!v53)
  {
    sub_100002024(3, CFSTR("Failed to create remote AMFDRRef"));
    v7 = 0;
    v82 = 0;
    v33 = 0;
    v2 = &qword_100008000;
    v19 = v79;
    goto LABEL_89;
  }
  v54 = v53;
  v19 = v79;
  v82 = (const void *)v53;
  if (AMFDRSealingMapVerifySealing(v96, &v105))
  {
    sub_100002024(3, CFSTR("Current FDR data verifies. Skipping recovery."));
    if ((AMFDRSealingMapCreateAndPopulateSealedData(v96, &v102, &v105) & 1) == 0)
    {
      sub_100002024(3, CFSTR("failed to created sealed data from system partition data store"), v78);
      goto LABEL_174;
    }
    if ((AMFDRSealingMapVerifyAndCommitSealedData(v92, v102, &v105) & 1) == 0)
    {
      sub_100002024(3, CFSTR("failed to commit sealed data to data partition data store"), v78);
      goto LABEL_174;
    }
  }
  else
  {
    sub_100002024(3, CFSTR("FDR local data verification failed. Recovering from remote."));
    if ((AMFDRSealingMapRecoverCurrentDevice(v92, v54, 1, &v105) & 1) == 0)
    {
      sub_100002024(3, CFSTR("failed to recover FDR data into data partition"), v78);
      goto LABEL_174;
    }
  }
  if (!v79)
  {
    sub_100002024(3, CFSTR("%s: Dir is NULL"), "createDirectoryRegFileURLArray");
    goto LABEL_191;
  }
  v58 = CFURLCopyFileSystemPath(v79, kCFURLPOSIXPathStyle);
  CStringPtr = CFStringGetCStringPtr(v58, 0x8000100u);
  v60 = opendir(CStringPtr);
  if (!v60)
  {
    sub_100002024(3, CFSTR("%s: Fail to open dir"), "createDirectoryRegFileURLArray");
    goto LABEL_191;
  }
  v61 = v60;
  v62 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!v62)
  {
    sub_100002024(3, CFSTR("%s: Cannot create CFMutableArray"), "createDirectoryRegFileURLArray");
    goto LABEL_191;
  }
  v63 = v62;
  v64 = readdir(v61);
  if (!v64)
  {
LABEL_150:
    closedir(v61);
    v33 = (const __CFData *)CFRetain(v63);
    CFRelease(v63);
    if (!v33)
      goto LABEL_191;
    if (CFArrayGetCount(v33))
    {
      v70 = 0;
      while (1)
      {
        v99 = 0;
        ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v33, v70);
        if (!AMSupportFileURLExists(ValueAtIndex, &v99))
        {
          if (v99)
          {
            theData = 0;
            *(_OWORD *)bytes = 0u;
            v141 = 0u;
            if (AMSupportCreateDataFromFileURL(kCFAllocatorDefault, &theData, ValueAtIndex))
            {
              sub_100002024(3, CFSTR("Cannot read file %@"), ValueAtIndex);
              v7 = 0;
              v76 = 0;
              v74 = 0;
            }
            else
            {
              v72 = CFDataGetBytePtr(theData);
              v73 = CFDataGetLength(theData);
              CC_SHA256(v72, v73, bytes);
              v74 = CFDataCreate(kCFAllocatorDefault, bytes, 32);
              if (v74)
              {
                PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
                v76 = PathComponent;
                if (PathComponent)
                {
                  v139[0] = PathComponent;
                  v139[1] = theData;
                  v139[2] = v74;
                  v7 = sub_100001E80(qword_100008008, (const void **)&off_100004468, v139, 3);
                }
                else
                {
                  sub_100002024(3, CFSTR("Cannot get filename for %@"), ValueAtIndex);
                  v7 = 0;
                }
              }
              else
              {
                sub_100002024(3, CFSTR("Cannot create digest for %@"), ValueAtIndex);
                v7 = 0;
                v76 = 0;
              }
            }
            if (theData)
            {
              CFRelease(theData);
              theData = 0;
            }
            if (v76)
              CFRelease(v76);
            if (v74)
              CFRelease(v74);
            if (!v7)
              break;
          }
        }
        if (++v70 >= (unint64_t)CFArrayGetCount(v33))
          goto LABEL_171;
      }
      sub_100002024(3, CFSTR("Failed to send file"));
    }
    else
    {
LABEL_171:
      v7 = 1;
    }
    goto LABEL_88;
  }
  v65 = CFSTR("%s: Fail to get filename");
  while (2)
  {
    if (v64->d_type != 8)
    {
LABEL_149:
      v64 = readdir(v61);
      if (!v64)
        goto LABEL_150;
      continue;
    }
    break;
  }
  v66 = CFStringCreateWithCString(kCFAllocatorDefault, v64->d_name, 0x8000100u);
  if (!v66)
    goto LABEL_190;
  v67 = v66;
  v68 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v79, v66, 0);
  if (v68)
  {
    v69 = v68;
    CFArrayAppendValue(v63, v68);
    CFRelease(v67);
    CFRelease(v69);
    goto LABEL_149;
  }
  v65 = CFSTR("%s: Fail to get filepath");
LABEL_190:
  sub_100002024(3, v65, "createDirectoryRegFileURLArray");
  CFRelease(v63);
LABEL_191:
  sub_100002024(3, CFSTR("Cannot list files under %@"), v79);
LABEL_174:
  v7 = 0;
LABEL_87:
  v33 = 0;
LABEL_88:
  v2 = &qword_100008000;
LABEL_89:
  if (v19)
  {
    bytes[0] = 0;
    if (!AMSupportFileURLExists(v19, bytes) && bytes[0])
      AMSupportRemoveDirectory(v19);
    CFRelease(v19);
  }
  if (v33)
    CFRelease(v33);
  v56 = v93;
  v55 = v94;
  v57 = v80;
LABEL_97:
  if (v105)
  {
    CFRelease(v105);
    v105 = 0;
  }
  if (v57)
    CFRelease(v57);
  if (v96)
    CFRelease(v96);
  if (v55)
    CFRelease(v55);
  if (v56)
    CFRelease(v56);
  if (v23)
    CFRelease(v23);
  if (v88)
    CFRelease(v88);
  if (v87)
    CFRelease(v87);
  if (v86)
    CFRelease(v86);
  free(v90);
  if (v92)
    CFRelease(v92);
  if (v97)
    CFRelease(v97);
  if (v89)
    CFRelease(v89);
  if (v95)
    CFRelease(v95);
  if (Mutable)
    CFRelease(Mutable);
  if (v104)
  {
    CFRelease(v104);
    v104 = 0;
  }
  if (v103)
  {
    CFRelease(v103);
    v103 = 0;
  }
  if (v84)
    CFRelease(v84);
  if (v82)
    CFRelease(v82);
  if (v102)
  {
    CFRelease(v102);
    v102 = 0;
  }
  sub_100002024(5, CFSTR("FDR preflight is done."));
LABEL_10:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  v108 = CFSTR("Result");
  if (v7)
    v8 = &kCFBooleanTrue;
  else
    v8 = &kCFBooleanFalse;
  v107 = *v8;
  result = sub_100001E80(a1, (const void **)&v108, (const void **)&v107, 1);
  v2[1] = 0;
  return result;
}

BOOL sub_100001E80(uint64_t a1, const void **a2, const void **a3, uint64_t a4)
{
  __CFDictionary *Mutable;
  dispatch_semaphore_t v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  _BOOL8 v13;
  void **v15;
  uint64_t v16;
  intptr_t (*v17)(uint64_t);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  __CFDictionary *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  if (qword_100008010 != -1)
    dispatch_once(&qword_100008010, &stru_1000044A0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    for (; a4; --a4)
      CFDictionarySetValue(Mutable, *a2++, *a3++);
    v9 = dispatch_semaphore_create(0);
    v10 = qword_100008000;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10000233C;
    v18 = &unk_1000044C8;
    v20 = &v23;
    v21 = a1;
    v22 = Mutable;
    v11 = v9;
    v19 = v11;
    dispatch_async(v10, &v15);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v12 = *((_DWORD *)v24 + 6);
    v13 = v12 == 0;
    if (v12)
      syslog(3, "failed to send message", v15, v16, v17, v18);

    CFRelease(Mutable);
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v23, 8);
  return v13;
}

void sub_100002004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002024(int a1, CFStringRef format, ...)
{
  CFStringRef v2;
  const __CFString *v3;
  CFNumberRef v4;
  const char *CStringPtr;
  int valuePtr;
  const void *v7[2];
  va_list va;

  va_start(va, format);
  valuePtr = a1;
  v2 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, format, va);
  if (v2)
  {
    v3 = v2;
    if (qword_100008008)
    {
      v4 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      v7[0] = v3;
      v7[1] = v4;
      sub_100001E80(qword_100008008, (const void **)&off_100004400, v7, 2);
      if (v4)
        CFRelease(v4);
    }
    CStringPtr = CFStringGetCStringPtr(v3, 0x8000100u);
    if (CStringPtr)
      syslog(valuePtr, "%s: %s", "Log", CStringPtr);
    CFRelease(v3);
  }
}

void sub_100002130(int a1, uint64_t a2)
{
  const __CFString *v3;

  if (a2)
  {
    v3 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s"), a2);
    sub_100002024(a1, v3);
    if (v3)
      CFRelease(v3);
  }
}

uint64_t sub_1000021A0(void *a1, int a2, uint64_t a3, void *a4, void *a5)
{
  const __CFString *v7;
  CFDictionaryRef v8;
  uint64_t v9;
  const void *v10;
  const char *v12;
  CFTypeRef cf;
  uint64_t v14;
  void *values[5];
  void *keys[2];
  __int128 v17;
  const __CFString *v18;

  cf = 0;
  v14 = 0;
  *(_OWORD *)keys = *(_OWORD *)&off_100004410;
  v17 = *(_OWORD *)&off_100004420;
  v18 = CFSTR("EnableProxy");
  v7 = CFSTR("Local");
  if (a2)
    v7 = CFSTR("Remote");
  values[0] = (void *)v7;
  values[1] = a1;
  values[2] = a4;
  values[3] = a5;
  values[4] = kCFBooleanTrue;
  v8 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v9 = AMFDRCreateWithOptions(kCFAllocatorDefault, v8);
  if (v9)
  {
    v10 = (const void *)v9;
    if ((AMFDRDataCopyTrustObject(v9, a3, &v14, &cf) & 1) == 0)
    {
      v12 = "local";
      if (a2)
        v12 = "remote";
      syslog(3, "Failed to copy %s trust object", v12);
    }
    CFRelease(v10);
    if (v8)
      goto LABEL_6;
  }
  else
  {
    syslog(3, "Failed to create AMFDRRef");
    if (v8)
LABEL_6:
      CFRelease(v8);
  }
  if (cf)
    CFRelease(cf);
  return v14;
}

void sub_100002310(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.fdrhelper.lockdown", 0);
  v2 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v1;

}

intptr_t sub_10000233C(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = lockdown_send_message(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 200);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (DERParseInteger((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t DERImg4DecodeManifest(_QWORD *a1, unint64_t a2)
{
  return sub_100002468(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_100002468(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (DERImg4DecodeTagCompare(a4, a5))
        return 2;
      v9 = 0;
      result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(_QWORD *a1, unint64_t a2)
{
  return sub_100002468(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(_QWORD *a1, unint64_t a2)
{
  return sub_100002468(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(_QWORD *a1, unint64_t a2)
{
  return sub_100002468(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  _QWORD v9[4];
  __int128 v10;

  v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  v10 = a3;
  result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!(_DWORD)result)
  {
    result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        result = 0;
        *(_QWORD *)(a4 + 16) = a2 | 0xE000000000000000;
        *(_QWORD *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  __int128 v8;

  v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7)
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7[2];

  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7))
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  sub_1000026F4(a1, a2, a3, 0x4D414E42u);
}

void sub_1000026F4(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _OWORD v12[3];
  _OWORD v13[3];
  unint64_t v14;
  unint64_t v15[2];

  v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2)
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10)
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
          }
        }
      }
    }
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  double result;
  int v10;
  int v11;
  int v12;
  _OWORD v13[3];
  unint64_t v14[2];

  v14[0] = 0;
  v14[1] = 0;
  result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000295C(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_10000295C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 6;
  if (a1 && a4)
  {
    v15 = a1;
    v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(_QWORD *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      v10 = a4 + 232;
      if (a3)
        result = DERImg4DecodeCertificate(&v15, v10);
      else
        result = DERImg4DecodeUnsignedCertificate(&v15, v10);
    }
    else
    {
      if (a5 != 1229796429)
        return 2;
      v9 = a4 + 232;
      if (a3)
        result = DERImg4DecodeManifest(&v15, v9);
      else
        result = DERImg4DecodeUnsignedManifest(&v15, v9);
    }
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a4 + 264))
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = a1;
        v16 = a2;
        result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a4 + 24) = a1;
          v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(_QWORD *)(a4 + 32) = v11;
            if (v11 == a2)
              return 0;
            else
              return 7;
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[2];

  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[3];

  memset(v12, 170, sizeof(v12));
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;

  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return AMFDRCopyDeviceKeys();
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}
