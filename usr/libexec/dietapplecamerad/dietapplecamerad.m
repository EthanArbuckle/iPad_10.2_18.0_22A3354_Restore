void sub_100003728(uint64_t a1)
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  id v4;
  NSData *v5;
  NSData *v6;
  CFTypeRef v7;
  CFTypeRef v8;
  const void *v9;
  BOOL v10;
  CFTypeID v11;
  CFTypeID v12;
  const UInt8 *BytePtr;
  const char *v14;
  const UInt8 *v15;
  const char *v16;
  id v17;
  id v18;
  NSData *v19;
  NSData *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char __str[1024];

  v24 = 255;
  v2 = IOServiceNameMatching("AppleH10CamIn");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  v23 = 0;
  v4 = objc_msgSend(+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"), "copyPathForPersonalizedData:error:", 0, &v23);
  v5 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", CFSTR("/private/var/tmp/usr/standalone/firmware/Savage/SavagePatch.DAT"));
  if (a1)
  {
    v6 = v5;
    if (sub_10001BDA8(a1, &v24))
    {
      if (v6)
      {
        NSLog(CFSTR("Found Savage override DAT file, which takes precedence over all others - %@"), CFSTR("/private/var/tmp/usr/standalone/firmware/Savage/SavagePatch.DAT"));
        v9 = 0;
        v7 = 0;
      }
      else
      {
        if (!v4)
        {
          NSLog(CFSTR("Personalized firmware root path accessor not found"));
          return;
        }
        v7 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("SavageDeviceRev"), kCFAllocatorDefault, 0);
        v8 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("SavageMNS"), kCFAllocatorDefault, 0);
        v9 = v8;
        if (v7)
          v10 = v8 == 0;
        else
          v10 = 1;
        if (v10)
        {
          NSLog(CFSTR("IR sensor not detected"));
          v21 = 0;
          if (!v9)
            goto LABEL_24;
          goto LABEL_23;
        }
        v11 = CFGetTypeID(v7);
        if (v11 != CFDataGetTypeID())
          goto LABEL_37;
        v12 = CFGetTypeID(v9);
        if (v12 != CFDataGetTypeID())
          goto LABEL_37;
        BytePtr = CFDataGetBytePtr((CFDataRef)v7);
        v14 = "B3";
        if (BytePtr && (*BytePtr & 0xF0) == 0xA0)
          v14 = "BA";
        v15 = CFDataGetBytePtr((CFDataRef)v9);
        v16 = "Dev";
        if (v15 && *v15 == 10)
          v16 = "Prod";
        snprintf(__str, 0x400uLL, "Savage/SavagePatch%s%s.DAT", v14, v16);
        v17 = objc_msgSend(v4, "stringByAppendingPathComponent:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));
        NSLog(CFSTR("DAT file for unprovisioned Savage - %@"), v17);
        v18 = objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/Savage/SavagePatch.DAT"));
        NSLog(CFSTR("DAT file for provisioned Savage - %@"), v18);
        v19 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v17);
        if (!v19)
        {
          v20 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v18);
          if (v20)
          {
            v6 = v20;
            goto LABEL_20;
          }
          NSLog(CFSTR("No DAT file for Savage found"));
LABEL_37:
          v21 = 0;
LABEL_23:
          CFRelease(v9);
LABEL_24:
          if (v7)
            CFRelease(v7);
          if (v21)
            free(v21);
          goto LABEL_28;
        }
        v6 = v19;
        NSLog(CFSTR("Loading DAT file for unprovisioned Savage"));
      }
LABEL_20:
      v21 = malloc_type_calloc(-[NSData length](v6, "length"), 1uLL, 0x76D7A76FuLL);
      if (v21)
      {
        -[NSData getBytes:length:](v6, "getBytes:length:", v21, -[NSData length](v6, "length"));
        v22 = sub_10001BBC8(a1, v24 | 0x80000000, (uint64_t)v21, -[NSData length](v6, "length"), 5u);
        NSLog(CFSTR("Load Savage DAT File: Size = %ld; Status = %08x"), -[NSData length](v6, "length"), v22);
      }
      if (!v9)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
LABEL_28:
  if (v4)

}

void sub_100003AA0(uint64_t a1)
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  id v4;
  NSData *v5;
  NSData *v6;
  _BOOL4 v7;
  CFTypeRef v8;
  const __CFData *v9;
  const __CFData *v10;
  BOOL v11;
  CFTypeID v12;
  CFTypeID v13;
  const UInt8 *BytePtr;
  int v15;
  int v16;
  BOOL v17;
  int v18;
  BOOL v19;
  const UInt8 *v20;
  const char *v21;
  const char *v22;
  id v23;
  id v24;
  NSData *v25;
  NSData *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char __str[1024];

  v30 = 255;
  v2 = IOServiceNameMatching("AppleH10CamIn");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  v29 = 0;
  v4 = objc_msgSend(+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"), "copyPathForPersonalizedData:error:", 0, &v29);
  v5 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", CFSTR("/private/var/tmp/usr/standalone/firmware/Yonkers/YonkersPatch.DAT"));
  if (a1)
  {
    v6 = v5;
    v7 = sub_10001BD4C(a1, &v30);
    if (v6)
    {
      NSLog(CFSTR("Found Yonkers override DAT file, which takes precedence over all others - %@"), CFSTR("/private/var/tmp/usr/standalone/firmware/Yonkers/YonkersPatch.DAT"));
      v10 = 0;
      v8 = 0;
      goto LABEL_28;
    }
    if (v7)
    {
      if (!v4)
      {
        NSLog(CFSTR("Personalized firmware root path accessor not found"));
        return;
      }
      v8 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("YonkersFabRevision"), kCFAllocatorDefault, 0);
      v9 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("YonkersMNS"), kCFAllocatorDefault, 0);
      v10 = v9;
      if (v9)
        v11 = v8 == 0;
      else
        v11 = 1;
      if (v11)
      {
        NSLog(CFSTR("Secure RGB sensor not detected"));
        v27 = 0;
        if (!v10)
          goto LABEL_32;
        goto LABEL_31;
      }
      v12 = CFGetTypeID(v9);
      if (v12 != CFDataGetTypeID())
        goto LABEL_45;
      v13 = CFGetTypeID(v8);
      if (v13 != CFDataGetTypeID())
        goto LABEL_45;
      BytePtr = CFDataGetBytePtr((CFDataRef)v8);
      if (!BytePtr
        || ((v15 = __rev16(*(unsigned __int16 *)BytePtr), v16 = 1, v15 > 59904)
          ? (v17 = v15 == 59905, v18 = 61953)
          : (v17 = v15 == 54529, v18 = 56577),
            !v17 ? (v19 = v15 == v18) : (v19 = 1),
            !v19))
      {
        v16 = 0;
      }
      v20 = CFDataGetBytePtr(v10);
      v21 = "Dev";
      if (v20 && *v20 == 8)
        v21 = "Prod";
      v22 = "Ymgt";
      if (!v16)
        v22 = "Ngsk";
      snprintf(__str, 0x400uLL, "Yonkers/YonkersPatch%s%s.DAT", v22, v21);
      v23 = objc_msgSend(v4, "stringByAppendingPathComponent:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));
      NSLog(CFSTR("DAT file for unprovisioned Yonkers - %@"), v23);
      v24 = objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("/Yonkers/YonkersPatch.DAT"));
      NSLog(CFSTR("DAT file for provisioned Yonkers - %@"), v24);
      v25 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v23);
      if (!v25)
      {
        v26 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v24);
        if (v26)
        {
          v6 = v26;
          goto LABEL_28;
        }
        NSLog(CFSTR("No DAT file for Yonkers found"));
LABEL_45:
        v27 = 0;
LABEL_31:
        CFRelease(v10);
LABEL_32:
        if (v8)
          CFRelease(v8);
        if (v27)
          free(v27);
        goto LABEL_36;
      }
      v6 = v25;
      NSLog(CFSTR("Loading DAT file for unprovisioned Yonkers"));
LABEL_28:
      v27 = malloc_type_calloc(-[NSData length](v6, "length"), 1uLL, 0x5BBDADB3uLL);
      if (v27)
      {
        -[NSData getBytes:length:](v6, "getBytes:length:", v27, -[NSData length](v6, "length"));
        v28 = sub_10001BBC8(a1, v30 | 0x80000000, (uint64_t)v27, -[NSData length](v6, "length"), 5u);
        NSLog(CFSTR("Load Yonkers DAT File: Size = %ld; Status = %08x"), -[NSData length](v6, "length"), v28);
      }
      if (!v10)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
LABEL_36:
  if (v4)

}

void sub_100003E50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  _BOOL4 v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  BOOL v52;
  float v53;
  unsigned int *v54;
  uint64_t j;
  unsigned int v56;
  uint64_t k;
  uint64_t v58;
  __int16 v59;
  __int16 v60;
  float v61;
  unsigned int v62;
  uint64_t v63;
  int *v64;
  float v65;
  int v66;
  float v67;
  float v68;
  int v69;
  float v70;
  char v71;
  uint64_t v72;
  _QWORD v73[6];
  float v74;
  _OWORD v75[7];

  if (!a1)
    sub_10001D2EC();
  if (!a2)
    sub_10001D314();
  bzero((void *)(a2 + 469800), 0x4424uLL);
  *(_DWORD *)(a2 + 469796) = *(_DWORD *)(a2 + 284);
  switch(*(_DWORD *)(a2 + 4))
  {
    case 0:
      sub_10001D364();
    case 1:
      sub_10001D38C();
    case 2:
      v75[0] = 0uLL;
      v73[0] = a1;
      v73[1] = 0;
      sub_100004380((uint64_t)v75, (uint64_t)v73, a2);
      return;
    case 3:
      sub_10001D3B4();
    case 4:
      if (!*(_DWORD *)(a2 + 688))
        return;
      v4 = *(unsigned __int16 *)(a2 + 32);
      v5 = *(unsigned __int16 *)(a2 + 34);
      if ((v5 * v4) >= 0x81)
        sub_10001D3DC();
      bzero((void *)(a2 + 427300), 0x3800uLL);
      v7 = *(unsigned __int16 *)(a2 + 250) - *(unsigned __int16 *)(a2 + 246);
      if (!v7)
      {
        v14 = *(_WORD *)(a2 + 704);
        if (!(_DWORD)v5)
          goto LABEL_72;
LABEL_33:
        v32 = 0;
        v33 = *(float *)(a2 + 288);
        v34 = *(float *)(a2 + 292);
        v35 = *(float *)(a2 + 296);
        v36 = (float)v14;
        LOWORD(v6) = *(_WORD *)(a2 + 706);
        v37 = (float)v6 * 0.000030518;
        v38 = (float)(100 - *(_DWORD *)(a2 + 700)) / 200.0;
        v39 = (unint64_t)*(unsigned __int16 *)(a2 + 708) >> 1;
        v40 = -(uint64_t)v39;
        v72 = a2 + 112 * (int)v39 * (uint64_t)~(_DWORD)v4 + 427300;
        v41 = 112 * v4;
        v42 = 1.0 - v38;
        while (!(_DWORD)v4)
        {
LABEL_71:
          ++v32;
          ++v40;
          v72 += v41;
          if (v32 == v5)
            goto LABEL_72;
        }
        v43 = 0;
        v44 = *(_DWORD *)(a2 + 696);
        v45 = -(uint64_t)v39;
        v46 = v72;
        while (1)
        {
          v47 = v46;
          v48 = v40;
          memset(v75, 0, sizeof(v75));
          do
          {
            if (v48 < v5)
            {
              v49 = v47;
              v50 = v45;
              do
              {
                if (v50 < v4)
                {
                  for (i = 0; i != 112; i += 8)
                    *(int32x2_t *)((char *)v75 + i) = vadd_s32(*(int32x2_t *)((char *)v75 + i), *(int32x2_t *)(v49 + i));
                }
                v49 += 112;
                v52 = v50++ < (uint64_t)(v43 + v39);
              }
              while (v52);
            }
            v47 += v41;
            v52 = v48++ < (uint64_t)(v32 + v39);
          }
          while (v52);
          v53 = (float)DWORD1(v75[0]);
          *(float *)v73 = (float)DWORD1(v75[0]);
          v54 = (unsigned int *)v75 + 3;
          for (j = 4; j != 56; j += 4)
          {
            v56 = *v54;
            v54 += 2;
            v53 = v53 + (float)v56;
            *(float *)((char *)v73 + j) = v53;
          }
          if (v74 != 0.0)
          {
            for (k = 0; k != 56; k += 4)
              *(float *)((char *)v73 + k) = *(float *)((char *)v73 + k) / v74;
          }
          v58 = 0;
          v59 = 0;
          v60 = 13;
          do
          {
            v61 = *((float *)v73 + v58);
            if (v61 <= v38 && *((float *)v73 + v58 + 1) > v38)
              v59 = v58 + 1;
            if (v61 < v42 && *((float *)v73 + v58 + 1) >= v42)
              v60 = v58 + 1;
            ++v58;
          }
          while (v58 != 13);
          if (v59 > v60)
            break;
          v62 = 0;
          v63 = v60 - (uint64_t)v59 + 1;
          v64 = (int *)v75 + 2 * v59 + 1;
          v65 = 0.0;
          do
          {
            v65 = v65 + (float)*(v64 - 1);
            v66 = *v64;
            v64 += 2;
            v62 += v66;
            --v63;
          }
          while (v63);
          if (!v62)
            goto LABEL_63;
          v67 = -(float)((float)((float)(v65 / (float)v62) + v36) * v37);
LABEL_64:
          v68 = v34 * (float)(v67 - v33);
          if (v62 >= v44)
            v69 = 0x3FFF;
          else
            v69 = 0;
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480040) = v62;
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480044) = v69;
          v70 = v35 * v68;
          if (v62 >= v44)
            v71 = -96;
          else
            v71 = -120;
          *(float *)(a2 + 52 * (v43 + v32 * v4) + 480048) = v70;
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480052) = 0;
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480056) = 0;
          *(_BYTE *)(a2 + 52 * (v43 + v32 * v4) + 480060) = v71;
          ++v43;
          ++v45;
          v46 += 112;
          if (v43 == v4)
            goto LABEL_71;
        }
        v62 = 0;
LABEL_63:
        v67 = 0.0;
        goto LABEL_64;
      }
      v8 = 0;
      v9 = *(unsigned __int16 *)(a2 + 254);
      v10 = *(unsigned __int16 *)(a2 + 252);
      v11 = *(unsigned __int16 *)(a2 + 248) - *(unsigned __int16 *)(a2 + 244);
      v12 = a1 + *(unsigned __int16 *)(a2 + 246) * v10 + 2 * *(unsigned __int16 *)(a2 + 244);
      v13 = *(__int16 *)(a2 + 704);
      v14 = *(_WORD *)(a2 + 704);
      v15 = a2 + 427300 + 112 * -(int)v4;
      v16 = *(unsigned __int16 *)(a2 + 256);
      do
      {
        if (v8)
        {
          v17 = 0;
        }
        else
        {
          v8 = v16;
          v17 = v4;
        }
        v15 += 112 * v17;
        if (v11 >= 1)
        {
          v18 = 0;
          v19 = 0;
          v20 = v15 - 112;
          v21 = v11 + 1;
          do
          {
            v22 = v19 == 0;
            if (!v19)
              v19 = v9;
            v20 += 112 * v22;
            v23 = *(unsigned __int16 *)(v12 + v18);
            if (v23 != 0x3FFF)
            {
              v24 = v23 + v13;
              v25 = v24 ^ (v24 >> 31);
              v26 = 32 - __clz(v25);
              if (v25)
                v27 = v26;
              else
                v27 = 0;
              v28 = v27 ^ (v24 >> 31);
              if (v28 >= 6)
                v29 = 6;
              else
                v29 = v28;
              v30 = v29 + 7;
              if (v28 >= -7)
                v31 = v30;
              else
                v31 = 0;
              *(int32x2_t *)(v20 + 8 * v31) = vadd_s32(*(int32x2_t *)(v20 + 8 * v31), (int32x2_t)(*(unsigned __int16 *)(v12 + v18) | 0x100000000));
            }
            --v19;
            --v21;
            v18 += 2;
          }
          while (v21 > 1);
        }
        v12 += v10;
        --v8;
        --v7;
      }
      while (v7);
      if ((_DWORD)v5)
        goto LABEL_33;
LABEL_72:
      sub_10000A658(a2);
      return;
    default:
      sub_10001D33C();
  }
}

uint64_t sub_100004380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int32x4_t v12;
  __n128 v13;
  __n128 v14;
  int32x2_t v15;
  int16x8_t v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  int8x8_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  char v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  _BOOL4 v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  unsigned __int16 v44;
  int v45;
  unsigned int v46;
  __int16 v47;
  unsigned int v48;
  uint64_t v49;
  unsigned int v50;
  int v51;
  unsigned __int16 v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  unsigned __int16 v56;
  uint64_t v57;
  int32x2_t v58;
  signed int v59;
  _DWORD *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  unsigned __int16 *v66;
  uint64_t v67;
  unsigned __int16 *v68;
  uint64x2_t v69;
  __n128 v70;
  unsigned int v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  int8x8_t v76;
  int v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;
  unsigned __int16 *v82;
  unsigned __int16 *v83;
  char v84;
  int v85;
  int v86;
  int v87;
  int v88;
  _BOOL4 v89;
  uint64_t v90;
  unsigned int v91;
  unint64_t v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  __int16 v96;
  unsigned int v97;
  uint64_t v98;
  unsigned int v99;
  int v100;
  int v101;
  unsigned __int16 v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  unsigned __int16 v106;
  uint64_t v107;
  int32x2_t v108;
  signed int v109;
  _DWORD *v110;
  unsigned int v111;
  unsigned int v112;
  uint64_t v113;
  int v114;
  int v115;
  int v116;
  int16x8_t v117;
  int v118;
  const __int16 *v119;
  int v120;
  int8x16_t v121;
  int16x8_t v122;
  int8x16_t v123;
  int8x16_t v124;
  int8x16_t v125;
  int8x16_t v126;
  uint16x8_t v127;
  int v128;
  int v129;
  int v130;
  int v131;
  char *v132;
  int v133;
  int8x8_t v134;
  uint64_t v135;
  const __int16 *v136;
  int v137;
  const __int16 *v138;
  int v139;
  int v140;
  int v141;
  unint64_t v142;
  uint64_t v143;
  int v144;
  __int16 *v145;
  __int16 *v146;
  __int16 *v147;
  __int16 *v148;
  int v149;
  int8x16_t v150;
  int16x8_t v151;
  int16x8_t v152;
  int8x16_t v153;
  int8x16_t v154;
  int8x16_t v155;
  int16x8_t v156;
  int16x8_t v157;
  int16x8_t v158;
  int16x8_t v159;
  int8x16_t v160;
  int8x16_t v161;
  int8x16_t v162;
  int8x16_t *v163;
  _BOOL4 v164;
  uint64_t v165;
  unsigned int v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  _QWORD *v170;
  uint64_t v171;
  _DWORD *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  int v176;
  uint64_t v177;
  unsigned int v178;
  unsigned int v179;
  uint64_t v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int16x8_t v188;
  int v189;
  int *v190;
  int v191;
  uint64_t v192;
  const __int16 *v193;
  const __int16 *v194;
  const __int16 *v195;
  const __int16 *v196;
  int v197;
  int v198;
  unint64_t v199;
  uint64_t v200;
  __int16 *v201;
  int v202;
  uint64_t v203;
  __int8 *v204;
  __int8 *v205;
  __int8 *v206;
  __int8 *v207;
  __int8 *v208;
  int v209;
  const __int16 *v210;
  const __int16 *v211;
  const __int16 *v212;
  uint64_t v213;
  int8x16_t v214;
  int8x16_t v215;
  int8x16_t v216;
  int8x16_t v217;
  int16x8_t v218;
  int8x16_t v219;
  int8x16_t v220;
  int8x16_t v221;
  uint16x8_t v222;
  int8x16_t v223;
  int8x16_t v224;
  uint16x8_t v225;
  int8x16_t v226;
  int16x8_t v227;
  int16x8_t v228;
  uint16x8_t v229;
  int16x8_t v230;
  int16x8_t v231;
  int16x8_t v232;
  int16x8_t v233;
  int8x16_t v234;
  int8x16_t *v235;
  _BOOL4 v236;
  uint64_t v237;
  unsigned int v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  _QWORD *v243;
  uint64_t v244;
  _DWORD *v245;
  unsigned int v246;
  int v247;
  int v248;
  uint64_t v249;
  unsigned int v250;
  int8x8_t v251;
  int v252;
  int v253;
  int v254;
  int v255;
  int v256;
  uint64_t v257;
  char *v258;
  unsigned __int16 *v259;
  char v260;
  uint64_t v261;
  int v262;
  int v263;
  unsigned __int16 *v264;
  uint64_t v265;
  unsigned int v266;
  unsigned int v267;
  int v268;
  unsigned int v269;
  __int16 v270;
  unsigned int v271;
  unsigned int v272;
  int v273;
  int v274;
  unsigned __int16 v275;
  unsigned int v276;
  unsigned int v277;
  unsigned __int16 v278;
  uint64_t v279;
  int32x2_t v280;
  signed int v281;
  uint64_t v282;
  int8x8_t v283;
  int32x2_t *v284;
  int32x2_t v285;
  int32x2_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  unsigned int v290;
  char *v291;
  uint64_t v292;
  unsigned int v293;
  int8x8_t v294;
  int v295;
  int v296;
  int v297;
  int v298;
  int v299;
  uint64_t v300;
  unsigned __int16 *v301;
  unsigned __int16 *v302;
  char v303;
  int v304;
  _BOOL4 v305;
  uint64_t v306;
  unsigned int v307;
  uint32x2_t v308;
  int32x2_t v309;
  unsigned int v310;
  int v311;
  unsigned int v312;
  __int16 v313;
  unsigned int v314;
  uint64_t v315;
  unsigned int v316;
  int v317;
  int v318;
  unsigned __int16 v319;
  unsigned int v320;
  unsigned int v321;
  int v322;
  unsigned __int16 v323;
  uint64_t v324;
  int32x2_t v325;
  signed int v326;
  uint64_t v327;
  int32x4_t v328;
  unsigned int v329;
  int16x8_t v330;
  int v331;
  int v332;
  __int16 *v333;
  int v334;
  int8x16_t v335;
  int16x8_t v336;
  int8x16_t v337;
  int8x16_t v338;
  int8x16_t v339;
  int8x16_t v340;
  uint16x8_t v341;
  int v342;
  int v343;
  int v344;
  char *v345;
  uint64_t v346;
  __int16 *v347;
  int v348;
  int v349;
  __int16 *v350;
  int v351;
  int v352;
  __int16 *v353;
  int v354;
  const __int16 *v355;
  int16x8_t v356;
  int16x8_t v357;
  int8x16_t v358;
  int16x8_t v359;
  int8x16_t v360;
  int8x16_t v361;
  uint64_t v362;
  uint64_t v363;
  __int16 *v364;
  int16x8_t *v365;
  int8x16_t *v366;
  int16x8_t *v367;
  int16x8_t *v368;
  int16x8_t *v369;
  int8x16_t *v370;
  __int16 v371;
  uint64_t v372;
  uint64_t v373;
  __int16 v374;
  uint64_t v375;
  int8x16_t v376;
  int16x8_t v377;
  int8x16_t v378;
  int8x16_t v379;
  uint16x8_t v380;
  int16x8_t v381;
  int8x16_t v382;
  int16x8_t v383;
  int16x8_t v384;
  int16x8_t v385;
  int8x16_t v386;
  _BOOL4 v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t *v391;
  uint64_t v392;
  int v393;
  int v394;
  int v395;
  uint64_t v396;
  _DWORD *v397;
  int v398;
  _DWORD *v399;
  uint64_t v400;
  uint64_t v401;
  char *v402;
  uint64_t v403;
  unsigned int v404;
  int v405;
  int v406;
  int v407;
  int16x8_t v408;
  int v409;
  int v410;
  uint64_t v411;
  __int16 *v412;
  _WORD *v413;
  int v414;
  __int16 *v415;
  _WORD *v416;
  int v417;
  BOOL v418;
  _WORD *v419;
  int v420;
  const __int16 *v421;
  int16x8_t v422;
  int16x8_t v423;
  int8x16_t v424;
  BOOL v425;
  uint64_t v426;
  uint64_t v427;
  __int16 *v428;
  int8x16_t *v429;
  int16x8_t *v430;
  int16x8_t *v431;
  int16x8_t *v432;
  int16x8_t *v433;
  int8x16_t *v434;
  __int16 v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  int8x16_t v439;
  int8x16_t v440;
  int8x16_t v441;
  int8x16_t v442;
  int16x8_t v443;
  int8x16_t v444;
  int16x8_t v445;
  int8x16_t v446;
  int8x16_t v447;
  int8x16_t v448;
  int16x8_t v449;
  uint16x8_t v450;
  int8x16_t v451;
  int8x16_t v452;
  int8x16_t v453;
  int16x8_t v454;
  int16x8_t v455;
  uint16x8_t v456;
  int16x8_t v457;
  int16x8_t v458;
  int16x8_t v459;
  int8x16_t v460;
  int8x16_t v461;
  int8x16_t v462;
  _BOOL4 v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  _QWORD *v468;
  uint64_t v469;
  int v470;
  int32x4_t *v471;
  int32x4_t v472;
  unsigned int v473;
  int v474;
  int v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  int8x8_t v479;
  __n128 v480;
  uint64_t v481;
  int v482;
  uint64_t v483;
  int v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  unsigned int v492;
  int v493;
  int v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  int8x8_t v498;
  __n128 v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  int v508;
  uint64_t v509;
  int v510;
  unsigned int v511;
  int v512;
  int v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  int8x8_t v517;
  double v518;
  __n128 v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  int v528;
  uint64_t v529;
  int v530;
  unsigned int v531;
  int v532;
  int v533;
  double v534;
  __n128 v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  unsigned int v542;
  int v543;
  int v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  __n128 v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  double v552;
  unsigned int v553;
  int v554;
  int v555;
  int16x8_t *v556;
  uint64_t v557;
  uint64_t v558;
  int32x4_t v559;
  int32x4_t v560;
  uint64_t v561;
  int v562;
  uint64_t v563;
  int v564;
  int16x8_t *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  unsigned int v572;
  int v573;
  int v574;
  int16x8_t *v575;
  uint64_t v576;
  uint64_t v577;
  int32x4_t v578;
  int32x4_t v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  int16x8_t *v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  int v588;
  uint64_t v589;
  int v590;
  unsigned int v591;
  int v592;
  int v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  int v607;
  uint64_t v608;
  uint64_t v609;
  int v610;
  uint64_t v611;
  unsigned int v612;
  unint64_t v613;
  uint64_t v614;
  uint64_t v615;
  unsigned int *v616;
  unsigned int v617;
  unsigned __int16 *v618;
  unsigned __int16 *v619;
  int v620;
  unsigned int v621;
  unsigned int *v622;
  uint64_t v623;
  unint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  unsigned int v631;
  unsigned __int16 *v632;
  unsigned __int16 *v633;
  int v634;
  unsigned int v635;
  unsigned int *v636;
  uint64_t v637;
  unint64_t v638;
  unsigned int v639;
  int v640;
  unsigned __int16 *v641;
  unsigned __int16 *v642;
  int v643;
  unsigned int v644;
  unsigned int *v645;
  uint64_t v646;
  unint64_t v647;
  unsigned int v648;
  unsigned __int16 *v649;
  unsigned __int16 *v650;
  int v651;
  unsigned int v652;
  unsigned int *v653;
  uint64_t v654;
  uint64_t v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  uint64_t v659;
  uint64_t v660;
  uint64_t v661;
  unsigned int v662;
  unsigned __int16 *v663;
  unsigned __int16 *v664;
  int v665;
  unsigned int v666;
  unsigned int *v667;
  uint64_t v668;
  unint64_t v669;
  unsigned int v670;
  int v671;
  unsigned __int16 *v672;
  unsigned __int16 *v673;
  int v674;
  unsigned int v675;
  unsigned int *v676;
  uint64_t v677;
  unint64_t v678;
  uint64_t v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  uint64_t v683;
  unsigned int v684;
  unsigned __int16 *v685;
  unsigned __int16 *v686;
  int v687;
  unsigned int v688;
  unsigned int *v689;
  uint64_t v690;
  uint64_t v691;
  unsigned int v692;
  int v693;
  int v694;
  uint64_t v695;
  int v696;
  uint64_t v697;
  int v698;
  int v699;
  unsigned int *v700;
  uint64_t v701;
  unint64_t v702;
  uint64_t v703;
  uint64_t v704;
  int v705;
  int v706;
  int v707;
  unsigned __int16 *v708;
  unsigned __int16 *v709;
  uint64_t v710;
  uint64_t v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  unint64_t v715;
  int v716;
  uint64_t v717;
  unsigned __int16 *v718;
  unsigned __int16 *v719;
  unint64_t v720;
  int v721;
  int v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  uint64_t v727;
  uint64_t v728;
  uint64_t v729;
  unsigned int v730;
  int v731;
  int v732;
  uint64_t v733;
  uint64_t v734;
  uint64_t v735;
  uint64_t v736;
  uint64_t v737;
  uint64_t v738;
  uint64_t v739;
  unsigned int v740;
  unint64_t v741;
  uint64_t v742;
  uint64_t v743;
  unsigned int *v744;
  unsigned int v745;
  unsigned __int16 *v746;
  unsigned __int16 *v747;
  int v748;
  unsigned int v749;
  unsigned int *v750;
  uint64_t v751;
  unint64_t v752;
  uint64_t v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  uint64_t v757;
  uint64_t v758;
  unsigned int v759;
  unsigned __int16 *v760;
  unsigned __int16 *v761;
  int v762;
  unsigned int v763;
  unsigned int *v764;
  uint64_t v765;
  unint64_t v766;
  unsigned int v767;
  int v768;
  unsigned __int16 *v769;
  unsigned __int16 *v770;
  int v771;
  unsigned int v772;
  unsigned int *v773;
  uint64_t v774;
  unint64_t v775;
  unsigned int v776;
  unsigned __int16 *v777;
  unsigned __int16 *v778;
  int v779;
  unsigned int v780;
  unsigned int *v781;
  uint64_t v782;
  unsigned int v783;
  uint64_t v784;
  uint64_t v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  uint64_t v789;
  unsigned int v790;
  unsigned __int16 *v791;
  unsigned __int16 *v792;
  int v793;
  unsigned int v794;
  unsigned int *v795;
  uint64_t v796;
  unint64_t v797;
  unsigned int v798;
  int v799;
  unsigned __int16 *v800;
  unsigned __int16 *v801;
  int v802;
  unsigned int v803;
  unsigned int *v804;
  uint64_t v805;
  unint64_t v806;
  uint64_t v807;
  unsigned int v808;
  unsigned __int16 *v809;
  unsigned __int16 *v810;
  int v811;
  unsigned int v812;
  unsigned int *v813;
  uint64_t v814;
  unsigned int v815;
  unsigned int v816;
  float v817;
  float v818;
  float v819;
  unsigned int v820;
  int v821;
  uint64_t v822;
  unsigned int v823;
  float v824;
  uint64_t v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  float v829;
  _DWORD *v830;
  unsigned int v831;
  float v832;
  float v833;
  float v834;
  float v835;
  float v836;
  float v837;
  float v838;
  float v839;
  float v840;
  float v841;
  float v842;
  float v843;
  float v844;
  float v845;
  int v846;
  int v847;
  float v848;
  float v849;
  int v850;
  unsigned int v851;
  int v852;
  int v853;
  unsigned int v854;
  BOOL v855;
  uint64_t v856;
  float v857;
  uint64_t v858;
  uint64_t v859;
  __int16 v860;
  __int16 v861;
  unsigned __int16 v862;
  uint64_t v863;
  unsigned int v864;
  unsigned __int16 v865;
  unsigned int v866;
  uint64_t v867;
  uint64_t v868;
  unsigned int v869;
  uint64_t v870;
  uint64_t v871;
  uint64_t v872;
  uint64_t v873;
  uint64_t v874;
  uint64_t v875;
  unsigned int v876;
  float32x4_t *v877;
  float v878;
  float v879;
  float v880;
  float v881;
  float v882;
  float v883;
  float v884;
  float v885;
  float v886;
  float v887;
  float v888;
  float v889;
  float v890;
  _BOOL4 v891;
  float v892;
  uint64_t v893;
  BOOL v894;
  unsigned int v895;
  uint64_t v896;
  char v897;
  int v898;
  unsigned int v899;
  int v900;
  uint64_t v901;
  uint64_t v902;
  unint64_t v903;
  uint64_t *v904;
  uint64_t v905;
  uint64_t v906;
  uint64_t v907;
  uint64_t i;
  uint64_t v909;
  uint64_t v910;
  uint64_t *v911;
  uint64_t v912;
  int v913;
  uint64_t v914;
  signed int v915;
  double v916;
  float v917;
  uint64_t v918;
  uint64_t v919;
  uint64_t v920;
  _QWORD *v921;
  _DWORD *v922;
  unsigned int v923;
  uint64_t v924;
  uint64_t v925;
  unint64_t v926;
  uint64_t v927;
  _QWORD *v928;
  _QWORD *v929;
  uint64_t v930;
  unsigned int v931;
  float v932;
  float v933;
  int v934;
  uint64_t v935;
  _DWORD *v936;
  uint64_t v937;
  unint64_t v938;
  uint64_t v939;
  unint64_t v940;
  unint64_t v941;
  unsigned __int16 *v942;
  int64_t v943;
  int v944;
  int v945;
  BOOL v946;
  BOOL v947;
  _DWORD *v948;
  uint64_t j;
  uint64_t v950;
  char v951;
  int v952;
  uint64_t v953;
  signed int v954;
  int v955;
  int v956;
  uint64_t v957;
  int v958;
  int v959;
  int v960;
  unsigned int v961;
  char v962;
  int v963;
  uint64_t v964;
  unsigned int v965;
  uint64_t v966;
  uint64_t v967;
  int v968;
  uint64_t v969;
  signed int v970;
  uint64_t k;
  uint64_t m;
  int v973;
  _DWORD *v974;
  uint64_t v975;
  uint64_t v976;
  char *v977;
  int v978;
  int v979;
  int v980;
  uint64_t v981;
  int v982;
  int v983;
  _DWORD *v984;
  uint64_t v985;
  int v986;
  _DWORD *v987;
  uint64_t v988;
  uint64_t v989;
  float *v990;
  int v991;
  uint64_t v992;
  float v993;
  uint64_t v994;
  unsigned int v995;
  unint64_t v996;
  uint64_t v997;
  uint64_t v998;
  unint64_t v999;
  float v1000;
  float v1001;
  float v1002;
  uint64_t v1003;
  float v1004;
  char v1005;
  int v1006;
  unsigned int v1007;
  unsigned int v1008;
  int v1009;
  float v1010;
  uint64_t v1011;
  uint64_t v1012;
  unsigned int v1013;
  char v1014;
  uint64_t v1015;
  uint64_t v1016;
  uint64_t v1017;
  int v1018;
  float v1019;
  unsigned int v1020;
  int v1021;
  float v1022;
  float v1023;
  unsigned int v1024;
  unsigned int v1025;
  unsigned int v1026;
  unsigned int v1027;
  float v1028;
  float v1029;
  float v1030;
  unsigned int v1031;
  BOOL v1032;
  BOOL v1033;
  int v1034;
  unsigned int v1035;
  unsigned int v1036;
  float v1037;
  unsigned int v1038;
  int v1039;
  uint64_t v1040;
  float *v1041;
  int v1042;
  char v1043;
  int v1044;
  uint64_t v1045;
  float v1046;
  float v1047;
  float v1048;
  float v1049;
  uint64_t v1050;
  float v1051;
  float v1052;
  float v1053;
  float v1054;
  float v1055;
  float v1056;
  uint64_t result;
  uint64_t v1058;
  uint64_t v1059;
  int v1060;
  uint64_t v1061;
  int v1062;
  uint64_t v1063;
  int v1064;
  uint64_t v1065;
  __int16 *v1066;
  uint64_t v1067;
  uint64_t v1068;
  uint64_t v1069;
  int v1070;
  uint64_t v1071;
  int v1072;
  uint64_t v1073;
  uint64_t v1074;
  int v1075;
  int v1076;
  uint64_t v1077;
  uint64_t v1078;
  int v1079;
  uint64_t v1080;
  uint64_t v1081;
  float v1082;
  int16x8_t *v1083;
  uint64_t v1084;
  uint64_t v1085;
  uint64_t v1086;
  uint64_t v1087;
  float v1088;
  unsigned int v1089;
  unsigned int *v1090;
  int v1091;
  int v1092;
  unsigned int v1093;
  uint64_t v1094;
  uint64_t v1095;
  uint64_t v1096;
  int v1097;
  int v1098;
  uint64_t v1099;
  uint64_t v1100;
  int v1101;
  int v1102;
  int v1103;
  _WORD *v1104;
  unsigned int v1105;
  uint64_t v1106;
  uint64_t v1107;
  void *__dst;
  char *__dsta;
  void *__dstb;
  void *__dstc;
  int __src;
  int __srca;
  char *__srcb;
  char *__srcc;
  unsigned __int16 *__srcd;
  unsigned int __srce;
  int __srcf;
  int __srcg;
  unsigned int v1120;
  uint64_t v1121;
  const __int16 *v1122;
  uint64_t v1123;
  uint64_t v1124;
  unsigned int *v1125;
  unsigned int *v1126;
  unsigned int *v1127;
  unsigned int *v1128;
  unsigned int *v1129;
  uint64_t v1130;
  unsigned int *v1131;
  int v1132[2];
  int v1133;
  int v1134;
  int v1135;
  int v1136;
  int v1137;
  int v1138;
  _WORD *v1139;
  unsigned int *v1140;
  char *v1141;
  int v1142;
  unsigned int v1143;
  int v1144;
  _WORD *v1145;
  _WORD *v1146;
  _WORD *v1147;
  _WORD *v1148;
  _WORD *v1149;
  int v1150;
  _WORD *v1151;
  _WORD *v1152;
  void *v1153;
  _WORD *v1154;
  void *v1155;
  int v1156;
  unsigned int *v1157;
  int v1158;
  int v1159;
  int v1160;
  int v1161;
  int v1162;
  _WORD *v1163;
  _WORD *v1164;
  _WORD *v1165;
  _WORD *v1166;
  _WORD *v1167;
  _WORD *v1168;
  _WORD *v1169;
  unsigned __int16 *v1170;
  _WORD *v1171;
  _WORD *v1172;
  _WORD *v1173;
  _WORD *v1174;
  _WORD *v1175;
  _WORD *v1176;
  _WORD *v1177;
  int v1178[2];
  _DWORD *v1179;
  int v1180;
  int v1181;
  int v1182;
  int v1183;
  char *v1184;
  char *v1185;
  char *v1186;
  char *v1187;
  char *v1188;
  char *v1189;
  char *v1190;
  unsigned int v1191;
  char *v1192;
  char *v1193;
  char *v1194;
  char *v1195;
  char *v1196;
  char *v1197;
  char *v1198;
  uint64_t v1199;
  uint64_t v1200;
  char v1201;
  unsigned int v1202;
  unsigned int v1203;
  unsigned int v1204;
  uint64_t v1205;
  uint64_t v1206;
  unsigned int v1207;
  int v1208[2];
  _BYTE *v1209;
  int v1210;
  int v1211[2];
  int v1212;
  char v1213;
  int v1214;
  int8x16_t v1215;
  int8x16_t v1216;
  int8x16_t v1217;
  int8x16_t v1218;
  int8x16_t v1219;
  int16x8_t v1220;
  int16x8_t v1221;
  int16x8_t v1222;
  int16x8_t v1223;
  __int128 v1224;
  __int128 v1225;
  __int128 v1226;
  __int128 v1227;
  _QWORD v1228[4];
  __int128 v1229;
  __int128 v1230;
  __int128 v1231;
  _QWORD v1232[8];
  __int128 v1233;
  __int128 v1234;
  __int128 v1235;
  __int128 v1236;
  __int128 v1237;
  __int128 v1238;
  __int128 v1239;
  __int128 v1240;
  __int128 v1241;
  uint64_t v1242;
  int16x8x2_t v1243;
  int16x8x3_t v1244;
  int16x8x3_t v1245;
  int16x8x3_t v1246;
  int16x8x4_t v1247;
  int16x8x4_t v1248;
  int16x8x4_t v1249;
  int16x8x4_t v1250;

  if (*(unsigned __int16 *)(a3 + 34) * *(unsigned __int16 *)(a3 + 32) >= 0x81)
    sub_10001D404();
  v4 = *(_DWORD *)(a3 + 8);
  if (v4 >= 2)
    sub_10001DA20();
  v1090 = (unsigned int *)(a3 + 487244);
  v7 = a3 + 12;
  v8 = *(_DWORD *)(a3 + 4);
  v1083 = (int16x8_t *)(a3 + 12);
  v1210 = *(_DWORD *)(a3 + 8);
  __dst = (void *)a2;
  if (v8 < 2)
  {
    v1121 = a1;
    v66 = (unsigned __int16 *)sub_10000ABB4(v7, a1, a2, (uint64_t)&v1224);
    v1204 = *(unsigned __int16 *)(a3 + 32);
    if (v4 != 1)
    {
      v71 = *(_DWORD *)(a3 + 12);
      if (v71 > 4)
        sub_10001D47C((uint64_t)v66, v67, (uint64_t)v68);
      v72 = a3 + 6948;
      if (v71 != 2)
      {
        v73 = *(_DWORD *)(a3 + 20);
        v74 = *(_DWORD *)(a3 + 28);
        v1215.i32[0] = 0;
        v75 = 2 * v73;
        v1181 = 2 * v74;
        switch(v71)
        {
          case 0u:
            if (v75)
            {
              v76 = (int8x8_t)vdup_n_s32(0x7FF8u);
              v77 = 2 * v74;
              do
              {
                v78 = v1226;
                v79 = *(_DWORD *)(a3 + 16);
                if (v79 >= 1)
                {
                  LODWORD(v67) = 0;
                  v80 = *(_DWORD *)(a3 + 24);
                  v81 = v72 - 404;
                  v68 = (unsigned __int16 *)*((_QWORD *)&v1227 + 1);
                  v66 = (unsigned __int16 *)v1228[0];
                  v82 = (unsigned __int16 *)v1232[3];
                  v83 = (unsigned __int16 *)v1232[4];
                  v84 = *(_BYTE *)(a3 + 304);
                  v85 = v1232[1];
                  v86 = v79 + 1;
                  v87 = DWORD2(v1226);
                  v88 = v1232[0];
                  do
                  {
                    if (!v78)
                    {
                      v78 = v88;
                      v87 = v85;
                      v66 = v83;
                      v68 = v82;
                    }
                    v89 = v67 == 0;
                    if (!(_DWORD)v67)
                      LODWORD(v67) = v80;
                    v90 = v81 + 404 * v89;
                    v91 = *v68;
                    v92 = (unint64_t)v68[1] >> 4;
                    v93 = *v66;
                    ++*(_DWORD *)(v90 + 384);
                    *(_QWORD *)(v90 + 388) += v92;
                    *(_QWORD *)(v90 + 396) += v92 * (unint64_t)v92;
                    if ((v93 & 4) == 0)
                    {
                      v94 = (__int16)v66[1];
                      v95 = v94 & 7;
                      if ((v93 & 1) != 0 || (((v94 & 7u) < 6) & (v93 >> 1)) != 0)
                      {
                        v110 = (_DWORD *)(v81 + 404 * v89 + 12 * v87);
                        ++v110[84];
                        v110[85] += v92;
                        v110[86] += v91 >> 4;
                      }
                      else
                      {
                        v96 = v95 > 5;
                        v97 = v66[2];
                        v98 = (v97 & 0xF) + 1;
                        v99 = v97 >> 4;
                        v100 = (__int16)v93 >> 3;
                        v101 = v94 >> 3;
                        if (v94 < 0)
                          v101 = -v101;
                        if (v100 < 0)
                          v100 = -v100;
                        v102 = v95 - v96;
                        v103 = (16 * (v101 & 0xFFFu)) >> v96;
                        v104 = (v98 >> 1) * v99;
                        v105 = 8 * v100;
                        if (((v94 ^ v93) & 0x8000u) == 0)
                          v106 = v102 + 7;
                        else
                          v106 = v102;
                        v107 = v90 + 24 * v106;
                        v69.i32[0] = v103;
                        v108.i32[0] = vshr_n_u32(*(uint32x2_t *)v69.i8, 1uLL).u32[0];
                        v69.i32[1] = v105;
                        v108.i32[1] = vand_s8(*(int8x8_t *)&v69, v76).i32[1];
                        v109 = (v108.i32[0] * v104) >> 15 << v84;
                        if (v109 <= -32768)
                          v109 = -32768;
                        if (v109 >= 0x7FFF)
                          v109 = 0x7FFF;
                        *(_QWORD *)v107 += v98;
                        v69 = vaddw_u32(*(uint64x2_t *)(v107 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v109), v108), 0xFuLL));
                        *(uint64x2_t *)(v107 + 8) = v69;
                      }
                    }
                    v68 += 2;
                    v66 += 3;
                    --v78;
                    v67 = (v67 - 1);
                    ++v1215.i32[0];
                    v87 ^= 1u;
                    --v86;
                    v81 = v90;
                  }
                  while (v86 > 1);
                }
                if (v78)
                  sub_10001D6F8((uint64_t)v66, v67, (uint64_t)v68);
                sub_10000B560((uint64_t)&v1224);
                v66 = (unsigned __int16 *)sub_10000B560((uint64_t)&v1230);
                v111 = v1204;
                if (v77 != 1)
                  v111 = 0;
                v72 += 404 * v111;
                if (v77 == 1)
                  v77 = v1181;
                else
                  --v77;
                --v75;
              }
              while (v75);
            }
            goto LABEL_847;
          case 1u:
            if (v75)
            {
              v532 = -2 * v73;
              v533 = 2 * v74;
              while (2)
              {
                sub_10000B650((uint64_t)v1083, a3 + 300, 1, (int *)&v1226, (int *)v1232, v72, &v1215, *(double *)v69.i64, v70);
                sub_10000B560((uint64_t)&v1224);
                sub_10000B560((uint64_t)&v1230);
                v536 = sub_10000B650((uint64_t)v1083, a3 + 300, 0, (int *)&v1228[1], (int *)&v1232[5], v72, &v1215, v534, v535);
                switch((int)v1224)
                {
                  case 0:
                  case 2:
                    sub_10001D740(v536, v537, v538);
                  case 1:
                  case 3:
                    *(_QWORD *)&v1229 = v1229 + 2 * (v1225 + *((_QWORD *)&v1224 + 1));
                    if (v1228[3])
                    {
                      --v1228[3];
                      v539 = 2 * *((_QWORD *)&v1225 + 1);
                    }
                    else
                    {
                      v539 = *((_QWORD *)&v1225 + 1);
                    }
                    *((_QWORD *)&v1229 + 1) += 2 * v539;
                    LODWORD(v540) = vadd_s32(*(int32x2_t *)((char *)&v1228[1] + 4), (int32x2_t)0x200000002).u32[0];
                    HIDWORD(v540) = veor_s8(*(int8x8_t *)(v1228 + 12), (int8x8_t)0x100000001).i32[1];
                    *(_QWORD *)((char *)&v1228[1] + 4) = v540;
                    switch((int)v1230)
                    {
                      case 0:
                      case 2:
                        sub_10001D740(v536, v537, v538);
                      case 1:
                      case 3:
                        *(_QWORD *)&v1233 = v1233 + 2 * (v1231 + *((_QWORD *)&v1230 + 1));
                        if (v1232[7])
                        {
                          --v1232[7];
                          v541 = 2 * *((_QWORD *)&v1231 + 1);
                        }
                        else
                        {
                          v541 = *((_QWORD *)&v1231 + 1);
                        }
                        *((_QWORD *)&v1233 + 1) += 2 * v541;
                        v70.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1232[5] + 4), (int32x2_t)0x200000002).u32[0];
                        *(int8x8_t *)v69.i8 = veor_s8(*(int8x8_t *)((char *)&v1232[5] + 4), (int8x8_t)0x100000001);
                        v70.n128_u32[1] = v69.u32[1];
                        *(_QWORD *)((char *)&v1232[5] + 4) = v70.n128_u64[0];
                        v542 = v1204;
                        if (v533 != 2)
                          v542 = 0;
                        v72 += 404 * v542;
                        if (v533 == 2)
                          v533 = v1181;
                        else
                          v533 -= 2;
                        v532 += 2;
                        if (!v532)
                          goto LABEL_847;
                        continue;
                      case 4:
                        sub_10001D764(v536, v537, v538);
                      default:
                        sub_10001D71C(v536, v537, v538);
                    }
                  case 4:
                    sub_10001D764(v536, v537, v538);
                  default:
                    sub_10001D71C(v536, v537, v538);
                }
              }
            }
            goto LABEL_847;
          case 2u:
            goto LABEL_269;
          case 3u:
            if (v75)
            {
              v543 = -2 * v73;
              v544 = 2 * v74;
              while (2)
              {
                v545 = sub_10000B650((uint64_t)v1083, a3 + 300, 0, (int *)&v1228[1], (int *)&v1232[5], v72, &v1215, *(double *)v69.i64, v70);
                switch((int)v1224)
                {
                  case 0:
                  case 2:
                    sub_10001D740(v545, v546, v547);
                  case 1:
                  case 3:
                    *(_QWORD *)&v1229 = v1229 + 2 * (v1225 + *((_QWORD *)&v1224 + 1));
                    if (v1228[3])
                    {
                      --v1228[3];
                      v549 = 2 * *((_QWORD *)&v1225 + 1);
                    }
                    else
                    {
                      v549 = *((_QWORD *)&v1225 + 1);
                    }
                    *((_QWORD *)&v1229 + 1) += 2 * v549;
                    LODWORD(v550) = vadd_s32(*(int32x2_t *)((char *)&v1228[1] + 4), (int32x2_t)0x200000002).u32[0];
                    HIDWORD(v550) = veor_s8(*(int8x8_t *)(v1228 + 12), (int8x8_t)0x100000001).i32[1];
                    *(_QWORD *)((char *)&v1228[1] + 4) = v550;
                    switch((int)v1230)
                    {
                      case 0:
                      case 2:
                        sub_10001D740(v545, v546, v547);
                      case 1:
                      case 3:
                        *(_QWORD *)&v1233 = v1233 + 2 * (v1231 + *((_QWORD *)&v1230 + 1));
                        if (v1232[7])
                        {
                          --v1232[7];
                          v551 = 2 * *((_QWORD *)&v1231 + 1);
                        }
                        else
                        {
                          v551 = *((_QWORD *)&v1231 + 1);
                        }
                        *((_QWORD *)&v1233 + 1) += 2 * v551;
                        v548.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1232[5] + 4), (int32x2_t)0x200000002).u32[0];
                        v552 = COERCE_DOUBLE(veor_s8(*(int8x8_t *)((char *)&v1232[5] + 4), (int8x8_t)0x100000001));
                        v548.n128_u32[1] = HIDWORD(v552);
                        *(_QWORD *)((char *)&v1232[5] + 4) = v548.n128_u64[0];
                        sub_10000B650((uint64_t)v1083, a3 + 300, 1, (int *)&v1226, (int *)v1232, v72, &v1215, v552, v548);
                        sub_10000B560((uint64_t)&v1224);
                        sub_10000B560((uint64_t)&v1230);
                        v553 = v1204;
                        if (v544 != 2)
                          v553 = 0;
                        v72 += 404 * v553;
                        if (v544 == 2)
                          v544 = v1181;
                        else
                          v544 -= 2;
                        v543 += 2;
                        if (!v543)
                          goto LABEL_847;
                        continue;
                      case 4:
                        sub_10001D764(v545, v546, v547);
                      default:
                        sub_10001D71C(v545, v546, v547);
                    }
                  case 4:
                    sub_10001D764(v545, v546, v547);
                  default:
                    sub_10001D71C(v545, v546, v547);
                }
              }
            }
            goto LABEL_847;
          case 4u:
            if (v75)
              sub_10001D7B0();
            goto LABEL_847;
          default:
            sub_10001D4A0();
        }
      }
      v75 = *(_DWORD *)(a3 + 20);
      v1181 = *(_DWORD *)(a3 + 28);
      v1215.i32[0] = 0;
LABEL_269:
      if (v75)
      {
        v294 = (int8x8_t)vdup_n_s32(0x7FF8u);
        v295 = v1181;
        do
        {
          v296 = 2 * v1226;
          v297 = 2 * *(_DWORD *)(a3 + 16);
          if (v297 >= 1)
          {
            v298 = 0;
            v299 = 2 * *(_DWORD *)(a3 + 24);
            v300 = v72 - 404;
            v301 = (unsigned __int16 *)*((_QWORD *)&v1227 + 1);
            v302 = (unsigned __int16 *)(v1228[0] + 6);
            v303 = *(_BYTE *)(a3 + 304);
            v304 = v297 + 2;
            do
            {
              if (!v296)
              {
                v296 = 2 * LODWORD(v1232[0]);
                v302 = (unsigned __int16 *)(v1232[4] + 6);
                v301 = (unsigned __int16 *)v1232[3];
              }
              v305 = v298 == 0;
              if (!v298)
                v298 = v299;
              v306 = v300 + 404 * v305;
              v307 = *v301;
              v308.i32[0] = v301[1];
              v308.i32[1] = v301[2];
              v309 = (int32x2_t)vshr_n_u32(v308, 4uLL);
              v310 = *v302;
              ++*(_DWORD *)(v306 + 384);
              *(_QWORD *)(v306 + 388) += v309.u32[0];
              *(_QWORD *)(v306 + 396) += v309.u32[0] * (unint64_t)v309.u32[0];
              if ((v310 & 4) == 0)
              {
                v311 = (__int16)v302[1];
                v312 = v311 & 7;
                if ((v310 & 1) != 0 || (((v311 & 7u) < 6) & (v310 >> 1)) != 0)
                {
                  v327 = v300 + 404 * v305;
                  v328.i32[0] = 1;
                  v328.i32[3] = 1;
                  v328.i32[1] = v309.i32[0];
                  v328.i32[2] = v307 >> 4;
                  *(int32x4_t *)(v327 + 336) = vaddq_s32(*(int32x4_t *)(v327 + 336), v328);
                  *(int32x2_t *)(v327 + 352) = vadd_s32(*(int32x2_t *)(v327 + 352), v309);
                }
                else
                {
                  v313 = v312 > 5;
                  v314 = v302[2];
                  v315 = (v314 & 0xF) + 1;
                  v316 = v314 >> 4;
                  v317 = (__int16)v310 >> 3;
                  v318 = v311 >> 3;
                  if (v311 < 0)
                    v318 = -v318;
                  if (v317 < 0)
                    v317 = -v317;
                  v319 = v312 - v313;
                  v320 = (16 * (v318 & 0xFFFu)) >> v313;
                  v321 = (v315 >> 1) * v316;
                  v322 = 8 * v317;
                  if (((v311 ^ v310) & 0x8000u) == 0)
                    v323 = v319 + 7;
                  else
                    v323 = v319;
                  v324 = v306 + 24 * v323;
                  v309.i32[0] = v320;
                  v325.i32[0] = vshr_n_u32((uint32x2_t)v309, 1uLL).u32[0];
                  v309.i32[1] = v322;
                  v325.i32[1] = vand_s8(*(int8x8_t *)&v309, v294).i32[1];
                  v326 = (v325.i32[0] * v321) >> 15 << v303;
                  if (v326 <= -32768)
                    v326 = -32768;
                  if (v326 >= 0x7FFF)
                    v326 = 0x7FFF;
                  *(_QWORD *)v324 += v315;
                  *(uint64x2_t *)(v324 + 8) = vaddw_u32(*(uint64x2_t *)(v324 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v326), v325), 0xFuLL));
                }
              }
              v301 += 4;
              v302 += 6;
              v296 -= 2;
              v298 -= 2;
              ++v1215.i32[0];
              v304 -= 2;
              v300 = v306;
            }
            while (v304 > 2);
          }
          if (v296)
            sub_10001D788();
          sub_10000B560((uint64_t)&v1224);
          sub_10000B560((uint64_t)&v1230);
          v329 = v1204;
          if (v295 != 1)
            v329 = 0;
          v72 += 404 * v329;
          if (v295 == 1)
            v295 = v1181;
          else
            --v295;
          --v75;
        }
        while (v75);
      }
LABEL_847:
      if (*(_DWORD *)(a3 + 608))
      {
        v741 = sub_10000ABB4((unint64_t)v1083, v1121, (uint64_t)__dst, (uint64_t)&v1224);
        v1206 = a3 + 608;
        v744 = v1090;
        switch(v1083->i32[0])
        {
          case 0:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
              sub_10001D658(v741, v742, v743);
            if (*(_DWORD *)(a3 + 156))
            {
              v745 = 0;
              v746 = (unsigned __int16 *)(a3 + 487308 + *v1090);
              v747 = (unsigned __int16 *)(a3 + 487308 + v1090[3]);
              v1192 = (char *)(a3 + 487308 + v1090[9]);
              v1171 = (_WORD *)(a3 + 487308 + v1090[12]);
              v1151 = (_WORD *)(a3 + 487308 + v1090[6]);
              v748 = *(_DWORD *)(a3 + 20);
              do
              {
                v749 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v745 % *(_DWORD *)(a3 + 132)) + 8);
                v750 = v1090 + 1;
                v751 = 5;
                do
                {
                  bzero((void *)(a3 + 487308 + *(v750 - 1)), *v750);
                  v750 += 3;
                  --v751;
                }
                while (v751);
                if ((unsigned __int16)v748 >= v749)
                  v752 = v749;
                else
                  v752 = (unsigned __int16)v748;
                sub_10000BC60(a3, v752, (uint64_t)&v1224, v746, v747, v1151);
                sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1206, v746, v747, v1192, v1171, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v745);
                LOWORD(v748) = v748 - v749;
                ++v745;
              }
              while (v745 < *(_DWORD *)(a3 + 156));
            }
            break;
          case 1:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
              sub_10001D658(v741, v742, v743);
            v753 = a3 + 487308;
            v754 = *v1090;
            v755 = v1090[3];
            v756 = v1090[9];
            v757 = v1090[12];
            v758 = v1090[6];
            if (*(_DWORD *)(a3 + 156))
            {
              v759 = 0;
              v760 = (unsigned __int16 *)(v753 + v754);
              v761 = (unsigned __int16 *)(v753 + v755);
              v1172 = (_WORD *)(v753 + v757);
              v1193 = (char *)(v753 + v756);
              v1152 = (_WORD *)(v753 + v758);
              v762 = *(_DWORD *)(a3 + 20);
              do
              {
                v763 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v759 % *(_DWORD *)(a3 + 132)) + 8);
                v764 = v1090 + 1;
                v765 = 5;
                do
                {
                  bzero((void *)(v753 + *(v764 - 1)), *v764);
                  v764 += 3;
                  --v765;
                }
                while (v765);
                if ((unsigned __int16)v762 >= v763)
                  v766 = v763;
                else
                  v766 = (unsigned __int16)v762;
                sub_10000BC60(a3, v766, (uint64_t)&v1224, v760, v761, v1152);
                sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1206, v760, v761, v1193, v1172, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v759);
                LOWORD(v762) = v762 - v763;
                ++v759;
              }
              while (v759 < *(_DWORD *)(a3 + 156));
              v744 = v1090;
              v754 = *v1090;
              v755 = v1090[3];
              v756 = v1090[9];
              v757 = v1090[12];
              v758 = v1090[6];
            }
            if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216))
              sub_10001D67C(v741, v742, v743);
            if (*(_DWORD *)(a3 + 212))
            {
              v767 = 0;
              v768 = 0;
              v769 = (unsigned __int16 *)(v753 + v754);
              v770 = (unsigned __int16 *)(v753 + v755);
              v1173 = (_WORD *)(v753 + v757);
              v1194 = (char *)(v753 + v756);
              v1153 = (void *)(v753 + v758);
              v771 = *(_DWORD *)(a3 + 16);
              v1128 = v744 + 1;
              do
              {
                v772 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v767 % *(_DWORD *)(a3 + 188)) + 8);
                v773 = v1128;
                v774 = 5;
                do
                {
                  bzero((void *)(v753 + *(v773 - 1)), *v773);
                  v773 += 3;
                  --v774;
                }
                while (v774);
                if ((unsigned __int16)v771 >= v772)
                  v775 = v772;
                else
                  v775 = (unsigned __int16)v771;
                sub_10000C6B0(a3, v768, v775, (int *)&v1224, v769, v770, v1153);
                sub_10000BDD4(v1210, (unsigned int *)(a3 + 188), v1206, v769, v770, v1194, v1173, a3 + 360 * *(_DWORD *)(a3 + 240) * v767 + 242980);
                v768 += v772;
                LOWORD(v771) = v771 - v772;
                ++v767;
              }
              while (v767 < *(_DWORD *)(a3 + 212));
            }
            break;
          case 2:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
              sub_10001D658(v741, v742, v743);
            if (*(_DWORD *)(a3 + 156))
            {
              v776 = 0;
              v777 = (unsigned __int16 *)(a3 + 487308 + *v1090);
              v778 = (unsigned __int16 *)(a3 + 487308 + v1090[3]);
              v1195 = (char *)(a3 + 487308 + v1090[9]);
              v1174 = (_WORD *)(a3 + 487308 + v1090[12]);
              v779 = *(_DWORD *)(a3 + 20);
              do
              {
                v780 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v776 % *(_DWORD *)(a3 + 132)) + 8);
                v781 = v1090 + 1;
                v782 = 5;
                do
                {
                  bzero((void *)(a3 + 487308 + *(v781 - 1)), *v781);
                  v781 += 3;
                  --v782;
                }
                while (v782);
                if ((unsigned __int16)v779 >= v780)
                  v783 = v780;
                else
                  v783 = (unsigned __int16)v779;
                sub_10000C8C8((uint64_t)v1083, v783, (uint64_t)&v1224, v777, v778);
                sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1206, v777, v778, v1195, v1174, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v776);
                LOWORD(v779) = v779 - v780;
                ++v776;
              }
              while (v776 < *(_DWORD *)(a3 + 156));
            }
            break;
          case 3:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
              sub_10001D658(v741, v742, v743);
            v784 = a3 + 487308;
            v785 = *v1090;
            v786 = v1090[3];
            v787 = v1090[9];
            v788 = v1090[12];
            v789 = v1090[6];
            if (*(_DWORD *)(a3 + 156))
            {
              v790 = 0;
              v791 = (unsigned __int16 *)(v784 + v785);
              v792 = (unsigned __int16 *)(v784 + v786);
              v1175 = (_WORD *)(v784 + v788);
              v1196 = (char *)(v784 + v787);
              v1154 = (_WORD *)(v784 + v789);
              v793 = *(_DWORD *)(a3 + 20);
              do
              {
                v794 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v790 % *(_DWORD *)(a3 + 132)) + 8);
                v795 = v1090 + 1;
                v796 = 5;
                do
                {
                  bzero((void *)(v784 + *(v795 - 1)), *v795);
                  v795 += 3;
                  --v796;
                }
                while (v796);
                if ((unsigned __int16)v793 >= v794)
                  v797 = v794;
                else
                  v797 = (unsigned __int16)v793;
                sub_10000BC60(a3, v797, (uint64_t)&v1224, v791, v792, v1154);
                sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1206, v791, v792, v1196, v1175, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v790);
                LOWORD(v793) = v793 - v794;
                ++v790;
              }
              while (v790 < *(_DWORD *)(a3 + 156));
              v744 = v1090;
              v785 = *v1090;
              v786 = v1090[3];
              v787 = v1090[9];
              v788 = v1090[12];
              v789 = v1090[6];
            }
            if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216))
              sub_10001D67C(v741, v742, v743);
            if (*(_DWORD *)(a3 + 212))
            {
              v798 = 0;
              v799 = 0;
              v800 = (unsigned __int16 *)(v784 + v785);
              v801 = (unsigned __int16 *)(v784 + v786);
              v1176 = (_WORD *)(v784 + v788);
              v1197 = (char *)(v784 + v787);
              v1155 = (void *)(v784 + v789);
              v802 = *(_DWORD *)(a3 + 16);
              v1129 = v744 + 1;
              do
              {
                v803 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v798 % *(_DWORD *)(a3 + 188)) + 8);
                v804 = v1129;
                v805 = 5;
                do
                {
                  bzero((void *)(v784 + *(v804 - 1)), *v804);
                  v804 += 3;
                  --v805;
                }
                while (v805);
                if ((unsigned __int16)v802 >= v803)
                  v806 = v803;
                else
                  v806 = (unsigned __int16)v802;
                sub_10000C6B0(a3, v799, v806, (int *)&v1224, v800, v801, v1155);
                sub_10000BDD4(v1210, (unsigned int *)(a3 + 188), v1206, v800, v801, v1197, v1176, a3 + 360 * *(_DWORD *)(a3 + 240) * v798 + 242980);
                v799 += v803;
                LOWORD(v802) = v802 - v803;
                ++v798;
              }
              while (v798 < *(_DWORD *)(a3 + 212));
            }
            break;
          case 4:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
              sub_10001D658(v741, v742, v743);
            v807 = a3 + 487308;
            if (*(_DWORD *)(a3 + 156))
            {
              v808 = 0;
              v809 = (unsigned __int16 *)(v807 + *v1090);
              v810 = (unsigned __int16 *)(v807 + v1090[3]);
              v1198 = (char *)(v807 + v1090[9]);
              v1177 = (_WORD *)(v807 + v1090[12]);
              v811 = *(_DWORD *)(a3 + 20);
              do
              {
                v812 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v808 % *(_DWORD *)(a3 + 132)) + 8);
                v813 = v1090 + 1;
                v814 = 5;
                do
                {
                  bzero((void *)(v807 + *(v813 - 1)), *v813);
                  v813 += 3;
                  --v814;
                }
                while (v814);
                if ((unsigned __int16)v811 >= v812)
                  v815 = v812;
                else
                  v815 = (unsigned __int16)v811;
                sub_10000C8C8((uint64_t)v1083, v815, (uint64_t)&v1224, v809, v810);
                sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1206, v809, v810, v1198, v1177, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v808);
                LOWORD(v811) = v811 - v812;
                ++v808;
              }
              while (v808 < *(_DWORD *)(a3 + 156));
            }
            if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216))
              sub_10001D67C(v741, v742, v743);
            if (*(_DWORD *)(a3 + 212))
              sub_10001D6A0(a3, a3 + 487308);
            return result;
          default:
            sub_10001D630();
        }
      }
      goto LABEL_920;
    }
    v179 = *(_DWORD *)(a3 + 12);
    if (v179 > 4)
      sub_10001D47C((uint64_t)v66, v67, (uint64_t)v68);
    v180 = a3 + 6948;
    if (v179 != 2)
    {
      v181 = *(_DWORD *)(a3 + 20);
      v182 = *(_DWORD *)(a3 + 28);
      v1214 = 0;
      v183 = 2 * v181;
      v1183 = 2 * v182;
      switch(v179)
      {
        case 0u:
          if (!v183)
            goto LABEL_847;
          v184 = 2 * v182;
          break;
        case 1u:
          if (v183)
          {
            v721 = -2 * v181;
            v722 = 2 * v182;
            while (2)
            {
              sub_10000B880((uint64_t)v1083, a3 + 300, 1, (uint64_t)&v1226, (uint64_t)v1232, v180, &v1214);
              sub_10000B560((uint64_t)&v1224);
              sub_10000B560((uint64_t)&v1230);
              sub_10000B880((uint64_t)v1083, a3 + 300, 0, (uint64_t)&v1228[1], (uint64_t)&v1232[5], v180, &v1214);
              switch((int)v1224)
              {
                case 0:
                case 2:
                  sub_10001D740(v723, v724, v725);
                case 1:
                case 3:
                  *(_QWORD *)&v1229 = v1229 + 2 * (v1225 + *((_QWORD *)&v1224 + 1));
                  if (v1228[3])
                  {
                    --v1228[3];
                    v726 = 2 * *((_QWORD *)&v1225 + 1);
                  }
                  else
                  {
                    v726 = *((_QWORD *)&v1225 + 1);
                  }
                  *((_QWORD *)&v1229 + 1) += 2 * v726;
                  LODWORD(v727) = vadd_s32(*(int32x2_t *)((char *)&v1228[1] + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v727) = veor_s8(*(int8x8_t *)(v1228 + 12), (int8x8_t)0x100000001).i32[1];
                  *(_QWORD *)((char *)&v1228[1] + 4) = v727;
                  switch((int)v1230)
                  {
                    case 0:
                    case 2:
                      sub_10001D740(v723, v724, v725);
                    case 1:
                    case 3:
                      *(_QWORD *)&v1233 = v1233 + 2 * (v1231 + *((_QWORD *)&v1230 + 1));
                      if (v1232[7])
                      {
                        --v1232[7];
                        v728 = 2 * *((_QWORD *)&v1231 + 1);
                      }
                      else
                      {
                        v728 = *((_QWORD *)&v1231 + 1);
                      }
                      *((_QWORD *)&v1233 + 1) += 2 * v728;
                      LODWORD(v729) = vadd_s32(*(int32x2_t *)((char *)&v1232[5] + 4), (int32x2_t)0x200000002).u32[0];
                      HIDWORD(v729) = veor_s8(*(int8x8_t *)(v1232 + 44), (int8x8_t)0x100000001).i32[1];
                      *(_QWORD *)((char *)&v1232[5] + 4) = v729;
                      v730 = v1204;
                      if (v722 != 2)
                        v730 = 0;
                      v180 += 404 * v730;
                      if (v722 == 2)
                        v722 = v1183;
                      else
                        v722 -= 2;
                      v721 += 2;
                      if (!v721)
                        goto LABEL_847;
                      continue;
                    case 4:
                      sub_10001D764(v723, v724, v725);
                    default:
                      sub_10001D71C(v723, v724, v725);
                  }
                case 4:
                  sub_10001D764(v723, v724, v725);
                default:
                  sub_10001D71C(v723, v724, v725);
              }
            }
          }
          goto LABEL_847;
        case 2u:
          goto LABEL_369;
        case 3u:
          if (v183)
          {
            v731 = -2 * v181;
            v732 = 2 * v182;
            while (2)
            {
              sub_10000B880((uint64_t)v1083, a3 + 300, 0, (uint64_t)&v1228[1], (uint64_t)&v1232[5], v180, &v1214);
              switch((int)v1224)
              {
                case 0:
                case 2:
                  sub_10001D740(v733, v734, v735);
                case 1:
                case 3:
                  *(_QWORD *)&v1229 = v1229 + 2 * (v1225 + *((_QWORD *)&v1224 + 1));
                  if (v1228[3])
                  {
                    --v1228[3];
                    v736 = 2 * *((_QWORD *)&v1225 + 1);
                  }
                  else
                  {
                    v736 = *((_QWORD *)&v1225 + 1);
                  }
                  *((_QWORD *)&v1229 + 1) += 2 * v736;
                  LODWORD(v737) = vadd_s32(*(int32x2_t *)((char *)&v1228[1] + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v737) = veor_s8(*(int8x8_t *)(v1228 + 12), (int8x8_t)0x100000001).i32[1];
                  *(_QWORD *)((char *)&v1228[1] + 4) = v737;
                  switch((int)v1230)
                  {
                    case 0:
                    case 2:
                      sub_10001D740(v733, v734, v735);
                    case 1:
                    case 3:
                      *(_QWORD *)&v1233 = v1233 + 2 * (v1231 + *((_QWORD *)&v1230 + 1));
                      if (v1232[7])
                      {
                        --v1232[7];
                        v738 = 2 * *((_QWORD *)&v1231 + 1);
                      }
                      else
                      {
                        v738 = *((_QWORD *)&v1231 + 1);
                      }
                      *((_QWORD *)&v1233 + 1) += 2 * v738;
                      LODWORD(v739) = vadd_s32(*(int32x2_t *)((char *)&v1232[5] + 4), (int32x2_t)0x200000002).u32[0];
                      HIDWORD(v739) = veor_s8(*(int8x8_t *)(v1232 + 44), (int8x8_t)0x100000001).i32[1];
                      *(_QWORD *)((char *)&v1232[5] + 4) = v739;
                      sub_10000B880((uint64_t)v1083, a3 + 300, 1, (uint64_t)&v1226, (uint64_t)v1232, v180, &v1214);
                      sub_10000B560((uint64_t)&v1224);
                      sub_10000B560((uint64_t)&v1230);
                      v740 = v1204;
                      if (v732 != 2)
                        v740 = 0;
                      v180 += 404 * v740;
                      if (v732 == 2)
                        v732 = v1183;
                      else
                        v732 -= 2;
                      v731 += 2;
                      if (!v731)
                        goto LABEL_847;
                      continue;
                    case 4:
                      sub_10001D764(v733, v734, v735);
                    default:
                      sub_10001D71C(v733, v734, v735);
                  }
                case 4:
                  sub_10001D764(v733, v734, v735);
                default:
                  sub_10001D71C(v733, v734, v735);
              }
            }
          }
          goto LABEL_847;
        case 4u:
          if (v183)
            sub_10001D878();
          goto LABEL_847;
        default:
          sub_10001D7D8();
      }
      while (1)
      {
        v1160 = v184;
        v185 = v1226;
        v186 = *(_DWORD *)(a3 + 16);
        if (v186 >= 1)
          break;
LABEL_205:
        if (v185)
          sub_10001D800();
        sub_10000B560((uint64_t)&v1224);
        sub_10000B560((uint64_t)&v1230);
        v184 = v1160 - 1;
        v246 = v1204;
        if (v1160 != 1)
          v246 = 0;
        v180 += 404 * v246;
        if (v1160 == 1)
          v184 = v1183;
        if (!--v183)
          goto LABEL_847;
      }
      v187 = 0;
      v188 = vdupq_n_s16(*(char *)(a3 + 304));
      v189 = *(_DWORD *)(a3 + 24);
      v190 = (int *)&v1232[1];
      if ((_DWORD)v1226)
        v190 = (int *)&v1226 + 2;
      v191 = *v190;
      v192 = v180 - 404;
      v194 = (const __int16 *)*((_QWORD *)&v1227 + 1);
      v193 = (const __int16 *)v1228[0];
LABEL_178:
      v195 = (const __int16 *)v1232[3];
      v196 = (const __int16 *)v1232[4];
      v197 = v1232[0];
      if (!v185)
      {
        v185 = v1232[0];
        v193 = (const __int16 *)v1232[4];
        v194 = (const __int16 *)v1232[3];
      }
      if (v185 <= 7)
      {
        v198 = v186;
        if (v185 != v186)
        {
          if (v185 < 1)
            sub_10001D828();
          v199 = 0;
          v200 = 2 * v185;
          do
          {
            v201 = (__int16 *)&v194[v199];
            v1215.i16[v199 / 2] = *v201;
            v1223.i16[v199 / 2] = v201[1];
            v1222.i16[v199 / 2] = *v193;
            v1221.i16[v199 / 2] = v193[1];
            v1220.i16[v199 / 2] = v193[2];
            v199 += 2;
            v193 += 3;
          }
          while (v200 != v199);
          if (v186 >= 8)
            v202 = 8;
          else
            v202 = v186;
          if (v185 < v202)
          {
            v203 = 0;
            v204 = &v1220.i8[v200];
            v205 = &v1221.i8[v200];
            v206 = &v1222.i8[v200];
            v207 = &v1223.i8[v200];
            v208 = &v1215.i8[v200];
            v209 = v185;
            v210 = v195;
            do
            {
              v211 = &v195[v203];
              *(_WORD *)&v208[v203] = *v211;
              *(_WORD *)&v207[v203] = v211[1];
              *(_WORD *)&v206[v203] = *v196;
              *(_WORD *)&v205[v203] = v196[1];
              *(_WORD *)&v204[v203] = v196[2];
              v212 = v210;
              v196 += 3;
              ++v209;
              v203 += 2;
              v210 = v211 + 2;
            }
            while (v202 > v209);
            v195 = v212 + 2;
          }
          v1243.val[0] = (int16x8_t)v1215;
          v1243.val[1] = v1223;
          v1244.val[1] = v1221;
          v1244.val[0] = v1222;
          v185 += v197 - v202;
          v193 = v196;
          v194 = v195;
          v1244.val[2] = v1220;
LABEL_195:
          v213 = 0;
          v214.i64[0] = 0x2000200020002;
          v214.i64[1] = 0x2000200020002;
          v215.i64[0] = 0x4000400040004;
          v215.i64[1] = 0x4000400040004;
          v216 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v1244.val[0], v215));
          v217.i64[0] = 0x7000700070007;
          v217.i64[1] = 0x7000700070007;
          v218 = (int16x8_t)vandq_s8((int8x16_t)v1244.val[1], v217);
          v219.i64[0] = 0xF000F000F000FLL;
          v219.i64[1] = 0xF000F000F000FLL;
          v220 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1243.val[0], 4uLL);
          v221 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1243.val[1], 4uLL);
          v222.i64[0] = 0x5000500050005;
          v222.i64[1] = 0x5000500050005;
          v223 = (int8x16_t)vcgtq_u16((uint16x8_t)v218, v222);
          v224 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v1244.val[1], 3uLL)), 4uLL);
          v225 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v1244.val[0], 3uLL)), 4uLL);
          v226 = vorrq_s8(v223, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v1244.val[0], v214)));
          v227.i64[0] = -1;
          v227.i64[1] = -1;
          v228 = (int16x8_t)vbslq_s8(v223, (int8x16_t)vaddq_s16(v218, v227), (int8x16_t)v218);
          v229 = (uint16x8_t)vbslq_s8(v223, (int8x16_t)vshrq_n_u16((uint16x8_t)v224, 1uLL), v224);
          v223.i64[0] = 0x1000100010001;
          v223.i64[1] = 0x1000100010001;
          v230 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v1244.val[2], v219), (int16x8_t)vbicq_s8(v223, (int8x16_t)v1244.val[0])), v226);
          v231 = vaddq_s16(v228, (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v1244.val[0]), (int8x16_t)vcgtq_s16(v1244.val[1], v227)), v217));
          v232 = (int16x8_t)vshrq_n_u16(v229, 1uLL);
          v233 = vqshlq_s16(vqdmulhq_s16(v232, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v230, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v1244.val[2], 4uLL))), v188);
          v234 = (int8x16_t)vceqzq_s16(v230);
          v1215 = (int8x16_t)v231;
          v1216 = vornq_s8(vandq_s8((int8x16_t)v230, v216), v216);
          v1217 = vbslq_s8(v234, v221, (int8x16_t)vqdmulhq_s16(v233, v232));
          v1218 = vbslq_s8(v234, v220, (int8x16_t)vqdmulhq_s16(v233, (int16x8_t)vshrq_n_u16(v225, 1uLL)));
          v1223 = (int16x8_t)v221;
          v235 = &v1217;
          while (1)
          {
            v236 = v187 == 0;
            if (!v187)
              v187 = v189;
            v237 = v192 + 404 * v236;
            v238 = v235[-2].u16[0];
            v239 = v235[-1].u16[0];
            v240 = v235->u16[0];
            v241 = v235[1].u16[0];
            ++*(_DWORD *)(v237 + 384);
            v242 = v1223.u16[v213];
            *(_QWORD *)(v237 + 388) += v242;
            *(_QWORD *)(v237 + 396) += v242 * (unint64_t)v242;
            if ((_DWORD)v239)
            {
              if ((_DWORD)v239 != 0xFFFF)
              {
                v243 = (_QWORD *)(v237 + 24 * v238);
                v244 = v243[1];
                *v243 += v239;
                v243[1] = v244 + v240;
                v243[2] += v241;
              }
            }
            else
            {
              v245 = (_DWORD *)(v192 + 404 * v236 + 12 * v191);
              ++v245[84];
              v245[85] += v240;
              v245[86] += v241;
            }
            ++v1214;
            if (v186 - 1 == (_DWORD)v213)
              goto LABEL_205;
            v235 = (int8x16_t *)((char *)v235 + 2);
            v191 ^= 1u;
            --v187;
            ++v213;
            v192 = v237;
            if (v213 == 8)
            {
              v186 -= 8;
              v192 = v237;
              if (v186 + 1 > 1)
                goto LABEL_178;
              goto LABEL_205;
            }
          }
        }
      }
      else
      {
        v198 = 8;
      }
      v1243 = vld2q_s16(v194);
      v194 += 16;
      v185 -= v198;
      v1244 = vld3q_s16(v193);
      v193 += 24;
      goto LABEL_195;
    }
    v183 = *(_DWORD *)(a3 + 20);
    v1183 = *(_DWORD *)(a3 + 28);
    v1214 = 0;
LABEL_369:
    if (!v183)
      goto LABEL_847;
    v405 = v1183;
    while (1)
    {
      v406 = 2 * *(_DWORD *)(a3 + 16);
      if (v406 >= 1)
        break;
LABEL_407:
      sub_10000B560((uint64_t)&v1224);
      sub_10000B560((uint64_t)&v1230);
      v473 = v1204;
      if (v405 != 1)
        v473 = 0;
      v180 += 404 * v473;
      if (v405 == 1)
        v405 = v1183;
      else
        --v405;
      if (!--v183)
        goto LABEL_847;
    }
    v407 = 0;
    v408 = vdupq_n_s16(*(char *)(a3 + 304));
    v409 = 2 * *(_DWORD *)(a3 + 24);
    v410 = 2 * v1226;
    v411 = v180 - 404;
    v412 = (__int16 *)*((_QWORD *)&v1227 + 1);
    v413 = (_WORD *)v1228[0];
    v414 = v406 - 2;
LABEL_373:
    v415 = (__int16 *)v1232[3];
    v416 = (_WORD *)v1232[4];
    v417 = v1232[0];
    v418 = v410 == 0;
    if (v410)
    {
      v419 = v413;
    }
    else
    {
      v410 = 2 * LODWORD(v1232[0]);
      v419 = (_WORD *)v1232[4];
    }
    if (v418)
      v412 = (__int16 *)v1232[3];
    if (v410 < 16)
    {
      v420 = v406;
      if (v410 != v406)
      {
        v425 = v410 == 1;
        if (v410 < 1)
          sub_10001D850();
        v426 = v410 >> 1;
        if (!v425)
        {
          if (v426 <= 1)
            v427 = 1;
          else
            v427 = v426;
          v428 = v419 + 5;
          v429 = &v1219;
          v430 = &v1220;
          v431 = &v1221;
          v432 = &v1222;
          v433 = &v1223;
          v434 = &v1215;
          do
          {
            v434->i16[0] = *v412;
            v434 = (int8x16_t *)((char *)v434 + 2);
            v433->i16[0] = v412[1];
            v433 = (int16x8_t *)((char *)v433 + 2);
            v432->i16[0] = v412[2];
            v432 = (int16x8_t *)((char *)v432 + 2);
            v431->i16[0] = *(v428 - 2);
            v431 = (int16x8_t *)((char *)v431 + 2);
            v430->i16[0] = *(v428 - 1);
            v430 = (int16x8_t *)((char *)v430 + 2);
            v435 = *v428;
            v428 += 6;
            v429->i16[0] = v435;
            v429 = (int8x16_t *)((char *)v429 + 2);
            v412 += 4;
            --v427;
          }
          while (v427);
        }
        LODWORD(v436) = v406 >> 1;
        if (v406 <= 15)
          v436 = v436;
        else
          v436 = 8;
        if (v426 < v436)
        {
          v437 = v426;
          do
          {
            v1215.i16[v437] = *v415;
            v1223.i16[v437] = v415[1];
            v1222.i16[v437] = v415[2];
            v1221.i16[v437] = v416[3];
            v1220.i16[v437] = v416[4];
            v1219.i16[v437] = v416[5];
            v415 += 4;
            v416 += 6;
            ++v437;
          }
          while (v436 != v437);
        }
        v1247.val[0] = (int16x8_t)v1215;
        v1247.val[1] = v1223;
        v422 = v1221;
        v1247.val[2] = v1222;
        v424 = v1219;
        v423 = v1220;
        v410 = 2 * (v417 - v436 + v426);
        v413 = v416;
        v412 = v415;
LABEL_396:
        v438 = 0;
        v439.i64[0] = 0x2000200020002;
        v439.i64[1] = 0x2000200020002;
        v440.i64[0] = 0x4000400040004;
        v440.i64[1] = 0x4000400040004;
        v441 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v422, v440));
        v442.i64[0] = 0x7000700070007;
        v442.i64[1] = 0x7000700070007;
        v443 = (int16x8_t)vandq_s8((int8x16_t)v423, v442);
        v444.i64[0] = 0xF000F000F000FLL;
        v444.i64[1] = 0xF000F000F000FLL;
        v445 = (int16x8_t)vandq_s8(v424, v444);
        v446 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1247.val[0], 4uLL);
        v447 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1247.val[1], 4uLL);
        v448 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1247.val[2], 4uLL);
        v449 = (int16x8_t)vshrq_n_u16((uint16x8_t)v424, 4uLL);
        v450.i64[0] = 0x5000500050005;
        v450.i64[1] = 0x5000500050005;
        v451 = (int8x16_t)vcgtq_u16((uint16x8_t)v443, v450);
        v452 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v423, 3uLL)), 4uLL);
        v453 = vorrq_s8(v451, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v422, v439)));
        v454.i64[0] = -1;
        v454.i64[1] = -1;
        v455 = (int16x8_t)vbslq_s8(v451, (int8x16_t)vaddq_s16(v443, v454), (int8x16_t)v443);
        v456 = (uint16x8_t)vbslq_s8(v451, (int8x16_t)vshrq_n_u16((uint16x8_t)v452, 1uLL), v452);
        v451.i64[0] = 0x1000100010001;
        v451.i64[1] = 0x1000100010001;
        v457 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16(v445, (int16x8_t)vbicq_s8(v451, (int8x16_t)v422)), v453);
        v458 = (int16x8_t)vshrq_n_u16(v456, 1uLL);
        v459 = vqshlq_s16(vqdmulhq_s16(v458, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v457, 1uLL), v449)), v408);
        v460 = (int8x16_t)vqdmulhq_s16(v459, v458);
        v461 = (int8x16_t)vqdmulhq_s16(v459, (int16x8_t)vshrq_n_u16(vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v422, 3uLL)), 4uLL), 1uLL));
        v462 = (int8x16_t)vceqzq_s16(v457);
        v1223 = (int16x8_t)v447;
        v1215 = vornq_s8(vandq_s8((int8x16_t)v457, v441), v441);
        v1216 = vbslq_s8(v462, v447, v460);
        v1217 = vbslq_s8(v462, v446, v461);
        v1218 = vbslq_s8(v462, v448, (int8x16_t)vaddq_s16(v455, (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v422), (int8x16_t)vcgtq_s16(v423, v454)), v442)));
        while (1)
        {
          v463 = v407 == 0;
          if (!v407)
            v407 = v409;
          v464 = v411 + 404 * v463;
          v465 = v1215.u16[v438];
          ++*(_DWORD *)(v464 + 384);
          v466 = v1223.u16[v438];
          *(_QWORD *)(v464 + 388) += v466;
          *(_QWORD *)(v464 + 396) += v466 * (unint64_t)v466;
          if ((_DWORD)v465)
          {
            if ((_DWORD)v465 != 0xFFFF)
            {
              v467 = v1217.u16[v438];
              v468 = (_QWORD *)(v464 + 24 * v1218.u16[v438]);
              v469 = v468[1] + *(unsigned __int16 *)((char *)&v1215 + v438 * 2 + 16);
              *v468 += v465;
              v468[1] = v469;
              v468[2] += v467;
            }
          }
          else
          {
            v470 = v1218.u16[v438];
            v471 = (int32x4_t *)(v411 + 404 * v463);
            v472.i32[0] = 1;
            v472.i32[3] = 1;
            v472.i32[1] = *(unsigned __int16 *)((char *)&v1215 + v438 * 2 + 16);
            v472.i32[2] = v1217.u16[v438];
            v471[21] = vaddq_s32(v471[21], v472);
            v471[22].i32[0] += v472.i32[1];
            v471[22].i32[1] += v470;
          }
          ++v1214;
          if (v414 == (_DWORD)(v438 * 2))
            goto LABEL_407;
          v407 -= 2;
          ++v438;
          v411 = v464;
          if (v438 == 8)
          {
            v414 -= 16;
            v411 = v464;
            v946 = v406 <= 16;
            v406 -= 16;
            if (v946)
              goto LABEL_407;
            goto LABEL_373;
          }
        }
      }
    }
    else
    {
      v420 = 16;
    }
    v1247 = vld4q_s16(v412);
    v412 += 32;
    v421 = v419;
    v1245 = vld3q_s16(v421);
    v421 += 24;
    v1246 = vld3q_s16(v421);
    v422 = vuzp2q_s16(v1245.val[0], v1246.val[0]);
    v423 = vuzp2q_s16(v1245.val[1], v1246.val[1]);
    v424 = (int8x16_t)vuzp2q_s16(v1245.val[2], v1246.val[2]);
    v413 = v419 + 48;
    v410 -= v420;
    goto LABEL_396;
  }
  if (v8 - 2 >= 2)
  {
    if (v8 == 4)
      sub_10001D9F8();
    sub_10001D42C();
  }
  v9 = sub_10000B02C(v7, a2, (uint64_t)&v1224);
  v1203 = *(unsigned __int16 *)(a3 + 32);
  if (v4 == 1)
  {
    v112 = *(_DWORD *)(a3 + 12);
    if (v112 > 4)
      sub_10001D47C(v9, v10, v11);
    v113 = a3 + 6948;
    if (v112 != 2)
    {
      v114 = *(_DWORD *)(a3 + 20);
      v115 = *(_DWORD *)(a3 + 28);
      v1214 = 0;
      v116 = 2 * v114;
      v1182 = 2 * v115;
      switch(v112)
      {
        case 0u:
          if (!v116)
            goto LABEL_707;
          v117 = vdupq_n_s16(*(char *)(a3 + 304));
          v118 = *(_DWORD *)(a3 + 24);
          __srca = *(_DWORD *)(a3 + 16);
          v119 = (const __int16 *)*((_QWORD *)&v1226 + 1);
          v1095 = v1226;
          v1084 = v1230;
          v120 = DWORD1(v1229);
          v1067 = *((_QWORD *)&v1224 + 1);
          v1063 = 2 * *((_QWORD *)&v1224 + 1);
          v1065 = v1228[3];
          v1061 = 2 * v1228[3];
          v121.i64[0] = 0x1000100010001;
          v121.i64[1] = 0x1000100010001;
          v122.i64[0] = -1;
          v122.i64[1] = -1;
          v123.i64[0] = 0x2000200020002;
          v123.i64[1] = 0x2000200020002;
          v124.i64[0] = 0x4000400040004;
          v124.i64[1] = 0x4000400040004;
          v125.i64[0] = 0x7000700070007;
          v125.i64[1] = 0x7000700070007;
          v126.i64[0] = 0xF000F000F000FLL;
          v126.i64[1] = 0xF000F000F000FLL;
          v127.i64[0] = 0x5000500050005;
          v127.i64[1] = 0x5000500050005;
          v1101 = v1225;
          v128 = 2 * v115;
          v129 = DWORD1(v1225);
          v1075 = v1224;
          v1070 = v1228[2];
LABEL_111:
          v1133 = v128;
          v1159 = v129;
          v1142 = v120;
          v130 = v1101;
          if (__srca < 1)
            goto LABEL_146;
          v15.i32[0] = 0;
          v131 = 0;
          v132 = (char *)&v1229 + 8;
          v130 = v1101;
          if (v1101)
            v132 = (char *)&v1225 + 8;
          v133 = *(_DWORD *)v132;
          v16.i32[0] = *(_DWORD *)v132 & 1;
          v134 = (int8x8_t)vdup_lane_s32(vceq_s32(*(int32x2_t *)v16.i8, v15), 0);
          v15 = (int32x2_t)vorr_s8((int8x8_t)(*(_QWORD *)&v134 & 0xFF00FF00FF00FF00), (int8x8_t)(*(_QWORD *)&vmvn_s8(v134) & 0xFF00FF00FF00FFLL));
          v135 = v113 - 404;
          v136 = v119;
          v137 = __srca;
          v1122 = v119;
          break;
        case 1u:
          if (v116)
          {
            v554 = -2 * v114;
            v555 = 2 * v115;
            while (2)
            {
              v556 = sub_10000CE68(v1083, a3 + 300, 1, (uint64_t)&v1225, (uint64_t)&v1229, v113, &v1214, v12, (int32x4_t)v13);
              switch((int)v1224)
              {
                case 0:
                  *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                  v560.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1225 + 4), (int32x2_t)0x100000001).u32[0];
                  *(int8x8_t *)v559.i8 = veor_s8(*(int8x8_t *)((char *)&v1225 + 4), (int8x8_t)0x100000001);
                  v560.i32[1] = v559.i32[1];
                  *(_QWORD *)((char *)&v1225 + 4) = v560.i64[0];
                  goto LABEL_589;
                case 1:
                case 3:
                case 4:
                  if ((_QWORD)v1226)
                  {
                    *(_QWORD *)&v1226 = v1226 - 1;
                    v561 = *((_QWORD *)&v1224 + 1);
                  }
                  else
                  {
                    v561 = 2 * *((_QWORD *)&v1224 + 1);
                  }
                  *((_QWORD *)&v1226 + 1) += 2 * v561;
                  v562 = DWORD1(v1225) + 2;
                  goto LABEL_588;
                case 2:
                  *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                  v562 = DWORD1(v1225) + 1;
LABEL_588:
                  DWORD1(v1225) = v562;
LABEL_589:
                  switch(LODWORD(v1228[2]))
                  {
                    case 0:
                      *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                      v560.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1229 + 4), (int32x2_t)0x100000001).u32[0];
                      *(int8x8_t *)v559.i8 = veor_s8(*(int8x8_t *)((char *)&v1229 + 4), (int8x8_t)0x100000001);
                      v560.i32[1] = v559.i32[1];
                      *(_QWORD *)((char *)&v1229 + 4) = v560.i64[0];
                      goto LABEL_597;
                    case 1:
                    case 3:
                    case 4:
                      if ((_QWORD)v1230)
                      {
                        *(_QWORD *)&v1230 = v1230 - 1;
                        v563 = v1228[3];
                      }
                      else
                      {
                        v563 = 2 * v1228[3];
                      }
                      *((_QWORD *)&v1230 + 1) += 2 * v563;
                      v564 = DWORD1(v1229) + 2;
                      goto LABEL_596;
                    case 2:
                      *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                      v564 = DWORD1(v1229) + 1;
LABEL_596:
                      DWORD1(v1229) = v564;
LABEL_597:
                      v565 = sub_10000CE68(v1083, a3 + 300, 0, (uint64_t)&v1227, (uint64_t)&v1231, v113, &v1214, v559, v560);
                      switch((int)v1224)
                      {
                        case 0:
                        case 2:
                          sub_10001D8EC((uint64_t)v565, v566, v567);
                        case 1:
                        case 3:
                          if (v1228[0])
                          {
                            --v1228[0];
                            v568 = 2 * *((_QWORD *)&v1224 + 1);
                          }
                          else
                          {
                            v568 = *((_QWORD *)&v1224 + 1);
                          }
                          v1228[1] += 2 * v568;
                          v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1227 + 4), (int32x2_t)0x200000002).u32[0];
                          *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1227 + 4), (int8x8_t)0x100000001);
                          v13.n128_u32[1] = v12.u32[1];
                          *(_QWORD *)((char *)&v1227 + 4) = v13.n128_u64[0];
                          break;
                        case 4:
                          if (v1228[0])
                          {
                            --v1228[0];
                            v569 = 2 * *((_QWORD *)&v1224 + 1);
                          }
                          else
                          {
                            v569 = *((_QWORD *)&v1224 + 1);
                          }
                          v1228[1] += 2 * v569;
                          DWORD1(v1227) += 2;
                          break;
                        default:
                          sub_10001D8C8((uint64_t)v565, v566, v567);
                      }
                      switch(LODWORD(v1228[2]))
                      {
                        case 0:
                        case 2:
                          sub_10001D8EC((uint64_t)v565, v566, v567);
                        case 1:
                        case 3:
                          if (v1232[0])
                          {
                            --v1232[0];
                            v570 = 2 * v1228[3];
                          }
                          else
                          {
                            v570 = v1228[3];
                          }
                          v1232[1] += 2 * v570;
                          v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1231 + 4), (int32x2_t)0x200000002).u32[0];
                          *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1231 + 4), (int8x8_t)0x100000001);
                          v13.n128_u32[1] = v12.u32[1];
                          *(_QWORD *)((char *)&v1231 + 4) = v13.n128_u64[0];
                          break;
                        case 4:
                          if (v1232[0])
                          {
                            --v1232[0];
                            v571 = 2 * v1228[3];
                          }
                          else
                          {
                            v571 = v1228[3];
                          }
                          v1232[1] += 2 * v571;
                          DWORD1(v1231) += 2;
                          break;
                        default:
                          sub_10001D8C8((uint64_t)v565, v566, v567);
                      }
                      v572 = v1203;
                      if (v555 != 2)
                        v572 = 0;
                      v113 += 404 * v572;
                      if (v555 == 2)
                        v555 = v1182;
                      else
                        v555 -= 2;
                      v554 += 2;
                      if (!v554)
                        goto LABEL_707;
                      continue;
                    default:
                      sub_10001D910((uint64_t)v556, v557, v558);
                  }
                default:
                  sub_10001D910((uint64_t)v556, v557, v558);
              }
            }
          }
          goto LABEL_707;
        case 2u:
          goto LABEL_303;
        case 3u:
          if (v116)
          {
            v573 = -2 * v114;
            v574 = 2 * v115;
            while (2)
            {
              v575 = sub_10000CE68(v1083, a3 + 300, 0, (uint64_t)&v1227, (uint64_t)&v1231, v113, &v1214, v12, (int32x4_t)v13);
              switch((int)v1224)
              {
                case 0:
                case 2:
                  sub_10001D8EC((uint64_t)v575, v576, v577);
                case 1:
                case 3:
                  if (v1228[0])
                  {
                    --v1228[0];
                    v580 = 2 * *((_QWORD *)&v1224 + 1);
                  }
                  else
                  {
                    v580 = *((_QWORD *)&v1224 + 1);
                  }
                  v1228[1] += 2 * v580;
                  v579.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1227 + 4), (int32x2_t)0x200000002).u32[0];
                  *(int8x8_t *)v578.i8 = veor_s8(*(int8x8_t *)((char *)&v1227 + 4), (int8x8_t)0x100000001);
                  v579.i32[1] = v578.i32[1];
                  *(_QWORD *)((char *)&v1227 + 4) = v579.i64[0];
                  break;
                case 4:
                  if (v1228[0])
                  {
                    --v1228[0];
                    v581 = 2 * *((_QWORD *)&v1224 + 1);
                  }
                  else
                  {
                    v581 = *((_QWORD *)&v1224 + 1);
                  }
                  v1228[1] += 2 * v581;
                  DWORD1(v1227) += 2;
                  break;
                default:
                  sub_10001D8C8((uint64_t)v575, v576, v577);
              }
              switch(LODWORD(v1228[2]))
              {
                case 0:
                case 2:
                  sub_10001D8EC((uint64_t)v575, v576, v577);
                case 1:
                case 3:
                  if (v1232[0])
                  {
                    --v1232[0];
                    v582 = 2 * v1228[3];
                  }
                  else
                  {
                    v582 = v1228[3];
                  }
                  v1232[1] += 2 * v582;
                  v579.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1231 + 4), (int32x2_t)0x200000002).u32[0];
                  *(int8x8_t *)v578.i8 = veor_s8(*(int8x8_t *)((char *)&v1231 + 4), (int8x8_t)0x100000001);
                  v579.i32[1] = v578.i32[1];
                  *(_QWORD *)((char *)&v1231 + 4) = v579.i64[0];
                  break;
                case 4:
                  if (v1232[0])
                  {
                    --v1232[0];
                    v583 = 2 * v1228[3];
                  }
                  else
                  {
                    v583 = v1228[3];
                  }
                  v1232[1] += 2 * v583;
                  DWORD1(v1231) += 2;
                  break;
                default:
                  sub_10001D8C8((uint64_t)v575, v576, v577);
              }
              v584 = sub_10000CE68(v1083, a3 + 300, 1, (uint64_t)&v1225, (uint64_t)&v1229, v113, &v1214, v578, v579);
              switch((int)v1224)
              {
                case 0:
                  *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                  v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1225 + 4), (int32x2_t)0x100000001).u32[0];
                  *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1225 + 4), (int8x8_t)0x100000001);
                  v13.n128_u32[1] = v12.u32[1];
                  *(_QWORD *)((char *)&v1225 + 4) = v13.n128_u64[0];
                  goto LABEL_650;
                case 1:
                case 3:
                case 4:
                  if ((_QWORD)v1226)
                  {
                    *(_QWORD *)&v1226 = v1226 - 1;
                    v587 = *((_QWORD *)&v1224 + 1);
                  }
                  else
                  {
                    v587 = 2 * *((_QWORD *)&v1224 + 1);
                  }
                  *((_QWORD *)&v1226 + 1) += 2 * v587;
                  v588 = DWORD1(v1225) + 2;
                  goto LABEL_649;
                case 2:
                  *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                  v588 = DWORD1(v1225) + 1;
LABEL_649:
                  DWORD1(v1225) = v588;
LABEL_650:
                  switch(LODWORD(v1228[2]))
                  {
                    case 0:
                      *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                      v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1229 + 4), (int32x2_t)0x100000001).u32[0];
                      *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1229 + 4), (int8x8_t)0x100000001);
                      v13.n128_u32[1] = v12.u32[1];
                      *(_QWORD *)((char *)&v1229 + 4) = v13.n128_u64[0];
                      goto LABEL_658;
                    case 1:
                    case 3:
                    case 4:
                      if ((_QWORD)v1230)
                      {
                        *(_QWORD *)&v1230 = v1230 - 1;
                        v589 = v1228[3];
                      }
                      else
                      {
                        v589 = 2 * v1228[3];
                      }
                      *((_QWORD *)&v1230 + 1) += 2 * v589;
                      v590 = DWORD1(v1229) + 2;
                      goto LABEL_657;
                    case 2:
                      *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                      v590 = DWORD1(v1229) + 1;
LABEL_657:
                      DWORD1(v1229) = v590;
LABEL_658:
                      v591 = v1203;
                      if (v574 != 2)
                        v591 = 0;
                      v113 += 404 * v591;
                      if (v574 == 2)
                        v574 = v1182;
                      else
                        v574 -= 2;
                      v573 += 2;
                      if (!v573)
                        goto LABEL_707;
                      continue;
                    default:
                      sub_10001D910((uint64_t)v584, v585, v586);
                  }
                default:
                  sub_10001D910((uint64_t)v584, v585, v586);
              }
            }
          }
          goto LABEL_707;
        case 4u:
          if (v116)
          {
            v592 = -2 * v114;
            v593 = 2 * v115;
            while (2)
            {
              v594 = sub_10000D248((uint64_t)v1083, a3 + 300, (int *)&v1227, (int *)&v1231, v113, &v1214);
              switch((int)v1224)
              {
                case 0:
                case 2:
                  sub_10001D8EC(v594, v595, v596);
                case 1:
                case 3:
                  if (v1228[0])
                  {
                    --v1228[0];
                    v597 = 2 * *((_QWORD *)&v1224 + 1);
                  }
                  else
                  {
                    v597 = *((_QWORD *)&v1224 + 1);
                  }
                  v1228[1] += 2 * v597;
                  LODWORD(v599) = vadd_s32(*(int32x2_t *)((char *)&v1227 + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v599) = veor_s8(*(int8x8_t *)(&v1227 + 4), (int8x8_t)0x100000001).i32[1];
                  *(_QWORD *)((char *)&v1227 + 4) = v599;
                  break;
                case 4:
                  if (v1228[0])
                  {
                    --v1228[0];
                    v598 = 2 * *((_QWORD *)&v1224 + 1);
                  }
                  else
                  {
                    v598 = *((_QWORD *)&v1224 + 1);
                  }
                  v1228[1] += 2 * v598;
                  DWORD1(v1227) += 2;
                  break;
                default:
                  sub_10001D8C8(v594, v595, v596);
              }
              switch(LODWORD(v1228[2]))
              {
                case 0:
                case 2:
                  sub_10001D8EC(v594, v595, v596);
                case 1:
                case 3:
                  if (v1232[0])
                  {
                    --v1232[0];
                    v600 = 2 * v1228[3];
                  }
                  else
                  {
                    v600 = v1228[3];
                  }
                  v1232[1] += 2 * v600;
                  LODWORD(v602) = vadd_s32(*(int32x2_t *)((char *)&v1231 + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v602) = veor_s8(*(int8x8_t *)(&v1231 + 4), (int8x8_t)0x100000001).i32[1];
                  *(_QWORD *)((char *)&v1231 + 4) = v602;
                  break;
                case 4:
                  if (v1232[0])
                  {
                    --v1232[0];
                    v601 = 2 * v1228[3];
                  }
                  else
                  {
                    v601 = v1228[3];
                  }
                  v1232[1] += 2 * v601;
                  DWORD1(v1231) += 2;
                  break;
                default:
                  sub_10001D8C8(v594, v595, v596);
              }
              v603 = sub_10000D248((uint64_t)v1083, a3 + 300, (int *)&v1225, (int *)&v1229, v113, &v1214);
              switch((int)v1224)
              {
                case 0:
                  *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                  LODWORD(v608) = vadd_s32(*(int32x2_t *)((char *)&v1225 + 4), (int32x2_t)0x100000001).u32[0];
                  HIDWORD(v608) = veor_s8(*(int8x8_t *)(&v1225 + 4), (int8x8_t)0x100000001).i32[1];
                  *(_QWORD *)((char *)&v1225 + 4) = v608;
                  goto LABEL_693;
                case 1:
                case 3:
                case 4:
                  if ((_QWORD)v1226)
                  {
                    *(_QWORD *)&v1226 = v1226 - 1;
                    v606 = *((_QWORD *)&v1224 + 1);
                  }
                  else
                  {
                    v606 = 2 * *((_QWORD *)&v1224 + 1);
                  }
                  *((_QWORD *)&v1226 + 1) += 2 * v606;
                  v607 = DWORD1(v1225) + 2;
                  goto LABEL_692;
                case 2:
                  *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                  v607 = DWORD1(v1225) + 1;
LABEL_692:
                  DWORD1(v1225) = v607;
LABEL_693:
                  switch(LODWORD(v1228[2]))
                  {
                    case 0:
                      *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                      LODWORD(v611) = vadd_s32(*(int32x2_t *)((char *)&v1229 + 4), (int32x2_t)0x100000001).u32[0];
                      HIDWORD(v611) = veor_s8(*(int8x8_t *)(&v1229 + 4), (int8x8_t)0x100000001).i32[1];
                      *(_QWORD *)((char *)&v1229 + 4) = v611;
                      goto LABEL_701;
                    case 1:
                    case 3:
                    case 4:
                      if ((_QWORD)v1230)
                      {
                        *(_QWORD *)&v1230 = v1230 - 1;
                        v609 = v1228[3];
                      }
                      else
                      {
                        v609 = 2 * v1228[3];
                      }
                      *((_QWORD *)&v1230 + 1) += 2 * v609;
                      v610 = DWORD1(v1229) + 2;
                      goto LABEL_700;
                    case 2:
                      *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                      v610 = DWORD1(v1229) + 1;
LABEL_700:
                      DWORD1(v1229) = v610;
LABEL_701:
                      v612 = v1203;
                      if (v593 != 2)
                        v612 = 0;
                      v113 += 404 * v612;
                      if (v593 == 2)
                        v593 = v1182;
                      else
                        v593 -= 2;
                      v592 += 2;
                      if (!v592)
                        goto LABEL_707;
                      continue;
                    default:
                      sub_10001D910(v603, v604, v605);
                  }
                default:
                  sub_10001D910(v603, v604, v605);
              }
            }
          }
          goto LABEL_707;
        default:
          sub_10001D7D8();
      }
      while (1)
      {
        v138 = (const __int16 *)*((_QWORD *)&v1230 + 1);
        v139 = v1229;
        if (v130)
          v140 = v130;
        else
          v140 = v1229;
        if (!v130)
          v136 = (const __int16 *)*((_QWORD *)&v1230 + 1);
        if (v140 <= 7)
        {
          v141 = v137;
          if (v140 != v137)
          {
            if (v140 < 1)
              sub_10001D9A8();
            v142 = 0;
            v143 = 2 * v140;
            do
            {
              v1215.i16[v142 / 2] = *v136;
              v1223.i16[v142 / 2] = v136[1];
              v1222.i16[v142 / 2] = v136[2];
              v1221.i16[v142 / 2] = v136[3];
              v142 += 2;
              v136 += 4;
            }
            while (v143 != v142);
            if (v137 >= 8)
              v144 = 8;
            else
              v144 = v137;
            if (v140 < v144)
            {
              v145 = &v1221.i16[(unint64_t)v143 / 2];
              v146 = &v1222.i16[(unint64_t)v143 / 2];
              v147 = &v1223.i16[(unint64_t)v143 / 2];
              v148 = &v1215.i16[(unint64_t)v143 / 2];
              v149 = v140;
              do
              {
                *v148++ = *v138;
                *v147++ = v138[1];
                *v146++ = v138[2];
                *v145++ = v138[3];
                v138 += 4;
                ++v149;
              }
              while (v144 > v149);
            }
            v16 = (int16x8_t)v1215;
            v1248.val[1] = v1223;
            v1248.val[3] = v1221;
            v1248.val[2] = v1222;
            v130 = v139 - v144 + v140;
            v136 = v138;
            goto LABEL_134;
          }
        }
        else
        {
          v141 = 8;
        }
        v130 = v140 - v141;
        *(int16x8x4_t *)v16.i8 = vld4q_s16(v136);
        v136 += 32;
LABEL_134:
        v11 = 0;
        v150 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v16, v124));
        v151 = (int16x8_t)vandq_s8((int8x16_t)v1248.val[1], v125);
        v152 = vshrq_n_s16(v16, 3uLL);
        v153 = (int8x16_t)vaddq_s16(v1248.val[3], (int16x8_t)vbslq_s8((int8x16_t)vcltzq_s16(vshlq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)v15), 0xFuLL)), (int8x16_t)vnegq_s16(v152), (int8x16_t)v152));
        v154 = (int8x16_t)vcgtq_u16((uint16x8_t)v151, v127);
        v155 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v1248.val[1], 3uLL)), 4uLL);
        v156 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v1248.val[2], v126), (int16x8_t)vbicq_s8(v121, (int8x16_t)v16)), vorrq_s8(v154, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v16, v123))));
        v157 = vaddq_s16((int16x8_t)vbslq_s8(v154, (int8x16_t)vaddq_s16(v151, v122), (int8x16_t)v151), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v16), (int8x16_t)vcgtq_s16(v1248.val[1], v122)), v125));
        v158 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v154, (int8x16_t)vshrq_n_u16((uint16x8_t)v155, 1uLL), v155), 1uLL);
        v159 = vqshlq_s16(vqdmulhq_s16(v158, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v156, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v1248.val[2], 4uLL))), v117);
        v160 = (int8x16_t)vqdmulhq_s16(v159, v158);
        v161 = (int8x16_t)vqdmulhq_s16(v159, (int16x8_t)vshrq_n_u16(vqshlq_n_u16((uint16x8_t)vabsq_s16(v152), 4uLL), 1uLL));
        v162 = (int8x16_t)vceqzq_s16(v156);
        v1215 = (int8x16_t)v157;
        v1216 = vornq_s8(vandq_s8((int8x16_t)v156, v150), v150);
        v1217 = vbslq_s8(v162, v153, v160);
        v1218 = vbslq_s8(v162, (int8x16_t)v1248.val[3], v161);
        v1223 = (int16x8_t)v153;
        v163 = &v1217;
        do
        {
          v164 = v131 == 0;
          if (!v131)
            v131 = v118;
          v165 = v135 + 404 * v164;
          v166 = v163[-2].u16[0];
          v167 = v163[-1].u16[0];
          v9 = v163->u16[0];
          v168 = v163[1].u16[0];
          ++*(_DWORD *)(v165 + 384);
          v169 = v1223.u16[v11];
          *(_QWORD *)(v165 + 388) += v169;
          *(_QWORD *)(v165 + 396) += v169 * (unint64_t)v169;
          if ((_DWORD)v167)
          {
            if ((_DWORD)v167 != 0xFFFF)
            {
              v170 = (_QWORD *)(v165 + 24 * v166);
              v171 = v170[1] + v9;
              *v170 += v167;
              v170[1] = v171;
              v170[2] += v168;
            }
          }
          else
          {
            v172 = (_DWORD *)(v135 + 404 * v164 + 12 * v133);
            ++v172[84];
            v172[85] += v9;
            v172[86] += v168;
          }
          ++v1214;
          if (v137 - 1 == (_DWORD)v11)
          {
            v119 = v1122;
            goto LABEL_146;
          }
          v163 = (int8x16_t *)((char *)v163 + 2);
          v133 ^= 1u;
          --v131;
          ++v11;
          v135 = v165;
        }
        while (v11 != 8);
        v137 -= 8;
        v135 = v165;
        v119 = v1122;
        if (v137 + 1 <= 1)
        {
LABEL_146:
          if (!v130)
          {
            switch(v1075)
            {
              case 0:
                v119 += v1067;
                *((_QWORD *)&v1226 + 1) = v119;
                v129 = v1159 + 1;
                *(_QWORD *)((char *)&v1225 + 4) = __PAIR64__(DWORD2(v1225), v1159 + 1) ^ 0x100000000;
                goto LABEL_155;
              case 1:
              case 3:
              case 4:
                v173 = v1095;
                if (v1095)
                {
                  --v1095;
                  *(_QWORD *)&v1226 = v173 - 1;
                  v174 = v1067;
                }
                else
                {
                  v1095 = 0;
                  v174 = v1063;
                }
                v119 += v174;
                *((_QWORD *)&v1226 + 1) = v119;
                v129 = v1159 + 2;
                goto LABEL_154;
              case 2:
                v119 += v1067;
                *((_QWORD *)&v1226 + 1) = v119;
                v129 = v1159 + 1;
LABEL_154:
                DWORD1(v1225) = v129;
LABEL_155:
                switch(v1070)
                {
                  case 0:
                    *((_QWORD *)&v1230 + 1) += 2 * v1065;
                    v120 = v1142 + 1;
                    DWORD1(v1229) = v1142 + 1;
                    DWORD2(v1229) ^= 1u;
                    goto LABEL_162;
                  case 1:
                  case 3:
                  case 4:
                    v175 = v1084;
                    v176 = v1133;
                    if (v1084)
                    {
                      --v1084;
                      *(_QWORD *)&v1230 = v175 - 1;
                      v177 = v1065;
                    }
                    else
                    {
                      v1084 = 0;
                      v177 = v1061;
                    }
                    *((_QWORD *)&v1230 + 1) += 2 * v177;
                    v120 = v1142 + 2;
                    DWORD1(v1229) = v1142 + 2;
                    goto LABEL_163;
                  case 2:
                    *((_QWORD *)&v1230 + 1) += 2 * v1065;
                    v120 = v1142 + 1;
                    DWORD1(v1229) = v1142 + 1;
LABEL_162:
                    v176 = v1133;
LABEL_163:
                    v128 = v176 - 1;
                    v178 = v1203;
                    if (v176 != 1)
                      v178 = 0;
                    v113 += 404 * v178;
                    if (v176 == 1)
                      v128 = v1182;
                    if (!--v116)
                      goto LABEL_707;
                    goto LABEL_111;
                  default:
                    sub_10001D910(v9, (uint64_t)&v1215, v11);
                }
              default:
                sub_10001D910(v9, (uint64_t)&v1215, v11);
            }
          }
          sub_10001D980();
        }
      }
    }
    v116 = *(_DWORD *)(a3 + 20);
    v1182 = *(_DWORD *)(a3 + 28);
    v1214 = 0;
LABEL_303:
    if (!v116)
      goto LABEL_707;
    v330 = vdupq_n_s16(*(char *)(a3 + 304));
    v331 = 2 * *(_DWORD *)(a3 + 24);
    v332 = 2 * *(_DWORD *)(a3 + 16);
    v333 = (__int16 *)*((_QWORD *)&v1226 + 1);
    v1124 = v1226;
    v334 = DWORD1(v1225);
    v1064 = DWORD2(v1225);
    __srcc = (char *)v1230;
    v1076 = v1225;
    v1072 = 2 * v1225;
    v1086 = *((_QWORD *)&v1224 + 1);
    v1059 = 2 * *((_QWORD *)&v1224 + 1);
    v1062 = DWORD2(v1229);
    v1080 = v1228[3];
    v1058 = 2 * v1228[3];
    v1069 = v332 - 2;
    v335.i64[0] = 0x1000100010001;
    v335.i64[1] = 0x1000100010001;
    v336.i64[0] = -1;
    v336.i64[1] = -1;
    v337.i64[0] = 0x2000200020002;
    v337.i64[1] = 0x2000200020002;
    v338.i64[0] = 0x4000400040004;
    v338.i64[1] = 0x4000400040004;
    v339.i64[0] = 0x7000700070007;
    v339.i64[1] = 0x7000700070007;
    v340.i64[0] = 0xF000F000F000FLL;
    v340.i64[1] = 0xF000F000F000FLL;
    v341.i64[0] = 0x5000500050005;
    v341.i64[1] = 0x5000500050005;
    v342 = DWORD1(v1229);
    v343 = v1182;
    v1060 = v332;
    v1097 = v1228[2];
    v1103 = v1224;
    while (2)
    {
      v1135 = v343;
      v1144 = v342;
      v1162 = v334;
      if (v332 < 1)
      {
LABEL_346:
        switch(v1103)
        {
          case 0:
            v333 += v1086;
            *((_QWORD *)&v1226 + 1) = v333;
            v334 = v1162 + 1;
            DWORD1(v1225) = v1162 + 1;
            v1064 ^= 1u;
            DWORD2(v1225) = v1064;
            goto LABEL_354;
          case 1:
          case 3:
          case 4:
            v400 = v1124;
            if (v1124)
            {
              --v1124;
              *(_QWORD *)&v1226 = v400 - 1;
              v401 = v1086;
            }
            else
            {
              v1124 = 0;
              v401 = v1059;
            }
            v333 += v401;
            *((_QWORD *)&v1226 + 1) = v333;
            v334 = v1162 + 2;
            goto LABEL_353;
          case 2:
            v333 += v1086;
            *((_QWORD *)&v1226 + 1) = v333;
            v334 = v1162 + 1;
LABEL_353:
            DWORD1(v1225) = v334;
LABEL_354:
            switch(v1097)
            {
              case 0:
                *((_QWORD *)&v1230 + 1) += 2 * v1080;
                v342 = v1144 + 1;
                DWORD1(v1229) = v1144 + 1;
                v1062 ^= 1u;
                DWORD2(v1229) = v1062;
                goto LABEL_362;
              case 1:
              case 3:
              case 4:
                v402 = __srcc;
                if (__srcc)
                {
                  --__srcc;
                  *(_QWORD *)&v1230 = v402 - 1;
                  v403 = v1080;
                }
                else
                {
                  __srcc = 0;
                  v403 = v1058;
                }
                *((_QWORD *)&v1230 + 1) += 2 * v403;
                v342 = v1144 + 2;
                goto LABEL_361;
              case 2:
                *((_QWORD *)&v1230 + 1) += 2 * v1080;
                v342 = v1144 + 1;
LABEL_361:
                DWORD1(v1229) = v342;
LABEL_362:
                v343 = v1135 - 1;
                v404 = v1203;
                if (v1135 != 1)
                  v404 = 0;
                v113 += 404 * v404;
                if (v1135 == 1)
                  v343 = v1182;
                if (!--v116)
                  goto LABEL_707;
                continue;
              default:
                sub_10001D910(v9, v10, v11);
            }
          default:
            sub_10001D910(v9, v10, v11);
        }
      }
      break;
    }
    v344 = 0;
    v345 = (char *)&v1229 + 8;
    v9 = v113 - 404;
    if (v1076)
      v345 = (char *)&v1225 + 8;
    v346 = *(int *)v345;
    v10 = v1069;
    v347 = v333;
    v348 = v1072;
    v349 = v332;
    while (1)
    {
      v350 = (__int16 *)*((_QWORD *)&v1230 + 1);
      v351 = v1229;
      v352 = v348 ? v348 : 2 * v1229;
      v353 = v348 ? v347 : (__int16 *)*((_QWORD *)&v1230 + 1);
      if (v352 >= 16)
        break;
      v354 = v349;
      if (v352 == v349)
        goto LABEL_318;
      if (v352 <= 0)
        sub_10001D9D0();
      v1066 = v333;
      v362 = v352 >> 1;
      if (v352 != 1)
      {
        if (v362 <= 1)
          v363 = 1;
        else
          v363 = v362;
        v364 = v353 + 4;
        v365 = &v1220;
        v366 = &v1219;
        v367 = &v1221;
        v368 = &v1222;
        v369 = &v1223;
        v370 = &v1215;
        do
        {
          v370->i16[0] = *v364;
          v370 = (int8x16_t *)((char *)v370 + 2);
          v369->i16[0] = v364[1];
          v369 = (int16x8_t *)((char *)v369 + 2);
          v368->i16[0] = v364[2];
          v368 = (int16x8_t *)((char *)v368 + 2);
          v367->i16[0] = v364[3];
          v367 = (int16x8_t *)((char *)v367 + 2);
          v371 = *(v364 - 1);
          v366->i16[0] = v371;
          v366 = (int8x16_t *)((char *)v366 + 2);
          v365->i16[0] = v371 - (*(v364 - 4) >> 3);
          v365 = (int16x8_t *)((char *)v365 + 2);
          v364 += 8;
          --v363;
        }
        while (v363);
      }
      LODWORD(v372) = v349 >> 1;
      if (v349 <= 15)
        v372 = v372;
      else
        v372 = 8;
      if (v362 >= v372)
      {
        v332 = v1060;
        v333 = v1066;
      }
      else
      {
        v373 = v362;
        v332 = v1060;
        v333 = v1066;
        do
        {
          v1215.i16[v373] = v350[4];
          v1223.i16[v373] = v350[5];
          v1222.i16[v373] = v350[6];
          v1221.i16[v373] = v350[7];
          v374 = v350[3];
          v1219.i16[v373] = v374;
          v1220.i16[v373] = v374 - (*v350 >> 3);
          v350 += 8;
          ++v373;
        }
        while (v372 != v373);
      }
      v356 = (int16x8_t)v1215;
      v357 = v1223;
      v360 = (int8x16_t)v1221;
      v358 = (int8x16_t)v1222;
      v359 = (int16x8_t)v1219;
      v361 = (int8x16_t)v1220;
      v348 = 2 * (v351 - v372 + v362);
      v347 = v350;
LABEL_335:
      v375 = 0;
      v376 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v356, v338));
      v377 = (int16x8_t)vandq_s8((int8x16_t)v357, v339);
      v378 = (int8x16_t)vcgtq_u16((uint16x8_t)v377, v341);
      v379 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v357, 3uLL)), 4uLL);
      v380 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v356, 3uLL)), 4uLL);
      v381 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8(v358, v340), (int16x8_t)vbicq_s8(v335, (int8x16_t)v356)), vorrq_s8(v378, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v356, v337))));
      v382 = (int8x16_t)vaddq_s16((int16x8_t)vbslq_s8(v378, (int8x16_t)vaddq_s16(v377, v336), (int8x16_t)v377), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v356), (int8x16_t)vcgtq_s16(v357, v336)), v339));
      v383 = vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v381, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v358, 4uLL));
      v384 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v378, (int8x16_t)vshrq_n_u16((uint16x8_t)v379, 1uLL), v379), 1uLL);
      v385 = vqshlq_s16(vqdmulhq_s16(v384, v383), v330);
      v386 = (int8x16_t)vceqzq_s16(v381);
      v1223 = (int16x8_t)v361;
      v1215 = vornq_s8(vandq_s8((int8x16_t)v381, v376), v376);
      v1216 = vbslq_s8(v386, v361, (int8x16_t)vqdmulhq_s16(v385, v384));
      v1217 = vbslq_s8(v386, (int8x16_t)v359, (int8x16_t)vqdmulhq_s16(v385, (int16x8_t)vshrq_n_u16(v380, 1uLL)));
      v1218 = vbslq_s8(v386, v360, v382);
      do
      {
        v387 = v344 == 0;
        if (!v344)
          v344 = v331;
        v388 = v9 + 404 * v387;
        v389 = v1215.u16[v375];
        ++*(_DWORD *)(v388 + 384);
        v390 = v1223.u16[v375];
        *(_QWORD *)(v388 + 388) += v390;
        v11 = v388 + 396;
        *(_QWORD *)(v388 + 396) += v390 * (unint64_t)v390;
        if ((_DWORD)v389)
        {
          if ((_DWORD)v389 != 0xFFFF)
          {
            v9 = v1217.u16[v375];
            v391 = (uint64_t *)(v388 + 24 * v1218.u16[v375]);
            v11 = *v391;
            v392 = v391[1] + *(unsigned __int16 *)((char *)&v1215 + v375 * 2 + 16);
            *v391 += v389;
            v391[1] = v392;
            v391[2] += v9;
          }
        }
        else
        {
          v393 = *(unsigned __int16 *)((char *)&v1215 + v375 * 2 + 16);
          v394 = v1217.u16[v375];
          v395 = v1218.u16[v375];
          v396 = v9 + 404 * v387 + 336;
          v397 = (_DWORD *)(v396 + 12 * (int)v346);
          v398 = v397[1] + v393;
          ++*v397;
          v397[1] = v398;
          v397[2] += v394;
          v399 = (_DWORD *)(v396 + 12 * (v346 + 1));
          v11 = v399[1];
          v9 = (*v399 + 1);
          *v399 = v9;
          v399[1] = v11 + v393;
          v399[2] += v395;
        }
        ++v1214;
        if ((_DWORD)v10 == (_DWORD)(v375 * 2))
          goto LABEL_346;
        v344 -= 2;
        ++v375;
        v9 = v388;
      }
      while (v375 != 8);
      v10 -= 16;
      v9 = v388;
      v946 = v349 <= 16;
      v349 -= 16;
      if (v946)
        goto LABEL_346;
    }
    v354 = 16;
LABEL_318:
    v355 = v353;
    v1249 = vld4q_s16(v355);
    v355 += 32;
    v1250 = vld4q_s16(v355);
    v356 = vuzp2q_s16(v1249.val[0], v1250.val[0]);
    v357 = vuzp2q_s16(v1249.val[1], v1250.val[1]);
    v358 = (int8x16_t)vuzp2q_s16(v1249.val[2], v1250.val[2]);
    v359 = vuzp1q_s16(v1249.val[3], v1250.val[3]);
    v360 = (int8x16_t)vuzp2q_s16(v1249.val[3], v1250.val[3]);
    v361 = (int8x16_t)vsraq_n_s16(v359, vuzp1q_s16(v1249.val[0], v1250.val[0]), 3uLL);
    v347 = v353 + 64;
    v348 = v352 - v354;
    goto LABEL_335;
  }
  v17 = *(_DWORD *)(a3 + 12);
  if (v17 > 4)
    sub_10001D47C(v9, v10, v11);
  v18 = a3 + 6948;
  if (v17 != 2)
  {
    v19 = *(_DWORD *)(a3 + 20);
    v20 = *(_DWORD *)(a3 + 28);
    v1215.i32[0] = 0;
    v21 = 2 * v19;
    v1180 = 2 * v20;
    switch(v17)
    {
      case 0u:
        if (v21)
        {
          v22 = *(_DWORD *)(a3 + 24);
          v23 = *((_QWORD *)&v1226 + 1);
          v1120 = DWORD2(v1225);
          v24 = DWORD1(v1225);
          *(_QWORD *)v1132 = v1230;
          v1141 = (char *)v1226;
          v1100 = *((_QWORD *)&v1224 + 1);
          v1094 = v1228[3];
          v1074 = 2 * v1228[3];
          v1078 = 2 * *((_QWORD *)&v1224 + 1);
          __src = *(_DWORD *)(a3 + 16);
          v1158 = v1225;
          v25 = v1224;
          v26 = (int8x8_t)vdup_n_s32(0x7FF8u);
          v27 = v1180;
          v28 = DWORD1(v1229);
          v29 = v1228[2];
          while (2)
          {
            v30 = v1158;
            if (__src >= 1)
            {
              v31 = 0;
              v32 = v18 - 404;
              v33 = *(_BYTE *)(a3 + 304);
              v34 = __src + 1;
              v35 = v23;
              v36 = v1120;
              v30 = v1158;
              do
              {
                if (v30)
                  v37 = v30;
                else
                  v37 = v1229;
                if (v30)
                  v10 = v36;
                else
                  v10 = DWORD2(v1229);
                if (v30)
                  v11 = v35;
                else
                  v11 = *((_QWORD *)&v1230 + 1);
                v38 = v31 == 0;
                if (v31)
                  v39 = v31;
                else
                  v39 = v22;
                v40 = v32 + 404 * (v31 == 0);
                v9 = *(unsigned __int16 *)v11;
                v41 = (__int16)v9 >> 3;
                v42 = *(unsigned __int16 *)(v11 + 6);
                if ((v10 & 1) != 0)
                  v43 = -v41;
                else
                  LOWORD(v43) = (__int16)v9 >> 3;
                v44 = v43 + v42;
                ++*(_DWORD *)(v40 + 384);
                *(_QWORD *)(v40 + 388) += v44;
                *(_QWORD *)(v40 + 396) += v44 * (unint64_t)v44;
                if ((v9 & 4) == 0)
                {
                  v45 = *(__int16 *)(v11 + 2);
                  v46 = v45 & 7;
                  if ((v9 & 1) != 0 || (((v45 & 7u) < 6) & (v9 >> 1)) != 0)
                  {
                    v60 = (_DWORD *)(v32 + 404 * v38 + 12 * (int)v10);
                    ++v60[84];
                    v60[85] += v44;
                    v60[86] += v42;
                  }
                  else
                  {
                    v47 = v46 > 5;
                    v48 = *(unsigned __int16 *)(v11 + 4);
                    v49 = (v48 & 0xF) + 1;
                    v50 = v48 >> 4;
                    v51 = v45 >> 3;
                    if (v45 < 0)
                      v51 = -v51;
                    if (v41 < 0)
                      v41 = -v41;
                    v52 = v46 - v47;
                    v53 = (16 * (v51 & 0xFFFu)) >> v47;
                    v54 = (v49 >> 1) * v50;
                    v55 = 8 * v41;
                    if (((v45 ^ v9) & 0x8000u) == 0)
                      v56 = v52 + 7;
                    else
                      v56 = v52;
                    v57 = v40 + 24 * v56;
                    v9 = *(_QWORD *)v57;
                    v13.n128_u32[0] = v53;
                    v58.i32[0] = vshr_n_u32((uint32x2_t)v13.n128_u64[0], 1uLL).u32[0];
                    v13.n128_u32[1] = v55;
                    v58.i32[1] = vand_s8(*(int8x8_t *)&v13, v26).i32[1];
                    v59 = (v58.i32[0] * v54) >> 15 << v33;
                    if (v59 <= -32768)
                      v59 = -32768;
                    if (v59 >= 0x7FFF)
                      v59 = 0x7FFF;
                    *(_QWORD *)v57 += v49;
                    v13 = (__n128)vaddw_u32(*(uint64x2_t *)(v57 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v59), v58), 0xFuLL));
                    *(__n128 *)(v57 + 8) = v13;
                  }
                }
                v35 = v11 + 8;
                v30 = v37 - 1;
                v31 = v39 - 1;
                ++v1215.i32[0];
                v36 = v10 ^ 1;
                --v34;
                v32 = v40;
              }
              while (v34 > 1);
            }
            if (!v30)
            {
              switch(v25)
              {
                case 0:
                  v23 += 2 * v1100;
                  *((_QWORD *)&v1226 + 1) = v23;
                  DWORD1(v1225) = ++v24;
                  v1120 ^= 1u;
                  DWORD2(v1225) = v1120;
                  goto LABEL_54;
                case 1:
                case 3:
                case 4:
                  v61 = v1141;
                  if (v1141)
                  {
                    --v1141;
                    *(_QWORD *)&v1226 = v61 - 1;
                    v62 = v1100;
                  }
                  else
                  {
                    v1141 = 0;
                    v62 = v1078;
                  }
                  v23 += 2 * v62;
                  *((_QWORD *)&v1226 + 1) = v23;
                  v24 += 2;
                  goto LABEL_53;
                case 2:
                  v23 += 2 * v1100;
                  *((_QWORD *)&v1226 + 1) = v23;
                  ++v24;
LABEL_53:
                  DWORD1(v1225) = v24;
LABEL_54:
                  switch(v29)
                  {
                    case 0:
                      *((_QWORD *)&v1230 + 1) += 2 * v1094;
                      *(_QWORD *)((char *)&v1229 + 4) = __PAIR64__(DWORD2(v1229), ++v28) ^ 0x100000000;
                      goto LABEL_62;
                    case 1:
                    case 3:
                    case 4:
                      v63 = *(_QWORD *)v1132;
                      if (*(_QWORD *)v1132)
                      {
                        --*(_QWORD *)v1132;
                        *(_QWORD *)&v1230 = v63 - 1;
                        v64 = v1094;
                      }
                      else
                      {
                        *(_QWORD *)v1132 = 0;
                        v64 = v1074;
                      }
                      *((_QWORD *)&v1230 + 1) += 2 * v64;
                      v28 += 2;
                      goto LABEL_61;
                    case 2:
                      *((_QWORD *)&v1230 + 1) += 2 * v1094;
                      ++v28;
LABEL_61:
                      DWORD1(v1229) = v28;
LABEL_62:
                      v65 = v1203;
                      if (v27 != 1)
                        v65 = 0;
                      v18 += 404 * v65;
                      if (v27 == 1)
                        v27 = v1180;
                      else
                        --v27;
                      if (!--v21)
                        goto LABEL_707;
                      continue;
                    default:
                      sub_10001D910(v9, v10, v11);
                  }
                default:
                  sub_10001D910(v9, v10, v11);
              }
            }
            break;
          }
          sub_10001D934(v9, v10, v11);
        }
        goto LABEL_707;
      case 1u:
        if (v21)
        {
          v474 = -2 * v19;
          v475 = 2 * v20;
          while (2)
          {
            v476 = sub_10000C9D4((uint64_t)v1083, a3 + 300, 1, (int *)&v1225, (int *)&v1229, v18, &v1215, *(double *)v12.i64, v13);
            switch((int)v1224)
            {
              case 0:
                *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                v480.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1225 + 4), (int32x2_t)0x100000001).u32[0];
                v479 = veor_s8(*(int8x8_t *)((char *)&v1225 + 4), (int8x8_t)0x100000001);
                v480.n128_u32[1] = v479.u32[1];
                *(_QWORD *)((char *)&v1225 + 4) = v480.n128_u64[0];
                goto LABEL_424;
              case 1:
              case 3:
              case 4:
                if ((_QWORD)v1226)
                {
                  *(_QWORD *)&v1226 = v1226 - 1;
                  v481 = *((_QWORD *)&v1224 + 1);
                }
                else
                {
                  v481 = 2 * *((_QWORD *)&v1224 + 1);
                }
                *((_QWORD *)&v1226 + 1) += 2 * v481;
                v482 = DWORD1(v1225) + 2;
                goto LABEL_423;
              case 2:
                *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                v482 = DWORD1(v1225) + 1;
LABEL_423:
                DWORD1(v1225) = v482;
LABEL_424:
                switch(LODWORD(v1228[2]))
                {
                  case 0:
                    *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                    v480.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1229 + 4), (int32x2_t)0x100000001).u32[0];
                    v479 = veor_s8(*(int8x8_t *)((char *)&v1229 + 4), (int8x8_t)0x100000001);
                    v480.n128_u32[1] = v479.u32[1];
                    *(_QWORD *)((char *)&v1229 + 4) = v480.n128_u64[0];
                    goto LABEL_432;
                  case 1:
                  case 3:
                  case 4:
                    if ((_QWORD)v1230)
                    {
                      *(_QWORD *)&v1230 = v1230 - 1;
                      v483 = v1228[3];
                    }
                    else
                    {
                      v483 = 2 * v1228[3];
                    }
                    *((_QWORD *)&v1230 + 1) += 2 * v483;
                    v484 = DWORD1(v1229) + 2;
                    goto LABEL_431;
                  case 2:
                    *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                    v484 = DWORD1(v1229) + 1;
LABEL_431:
                    DWORD1(v1229) = v484;
LABEL_432:
                    v485 = sub_10000C9D4((uint64_t)v1083, a3 + 300, 0, (int *)&v1227, (int *)&v1231, v18, &v1215, *(double *)&v479, v480);
                    switch((int)v1224)
                    {
                      case 0:
                      case 2:
                        sub_10001D8EC(v485, v486, v487);
                      case 1:
                      case 3:
                        if (v1228[0])
                        {
                          --v1228[0];
                          v488 = 2 * *((_QWORD *)&v1224 + 1);
                        }
                        else
                        {
                          v488 = *((_QWORD *)&v1224 + 1);
                        }
                        v1228[1] += 2 * v488;
                        v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1227 + 4), (int32x2_t)0x200000002).u32[0];
                        *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1227 + 4), (int8x8_t)0x100000001);
                        v13.n128_u32[1] = v12.u32[1];
                        *(_QWORD *)((char *)&v1227 + 4) = v13.n128_u64[0];
                        break;
                      case 4:
                        if (v1228[0])
                        {
                          --v1228[0];
                          v489 = 2 * *((_QWORD *)&v1224 + 1);
                        }
                        else
                        {
                          v489 = *((_QWORD *)&v1224 + 1);
                        }
                        v1228[1] += 2 * v489;
                        DWORD1(v1227) += 2;
                        break;
                      default:
                        sub_10001D8C8(v485, v486, v487);
                    }
                    switch(LODWORD(v1228[2]))
                    {
                      case 0:
                      case 2:
                        sub_10001D8EC(v485, v486, v487);
                      case 1:
                      case 3:
                        if (v1232[0])
                        {
                          --v1232[0];
                          v490 = 2 * v1228[3];
                        }
                        else
                        {
                          v490 = v1228[3];
                        }
                        v1232[1] += 2 * v490;
                        v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1231 + 4), (int32x2_t)0x200000002).u32[0];
                        *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1231 + 4), (int8x8_t)0x100000001);
                        v13.n128_u32[1] = v12.u32[1];
                        *(_QWORD *)((char *)&v1231 + 4) = v13.n128_u64[0];
                        break;
                      case 4:
                        if (v1232[0])
                        {
                          --v1232[0];
                          v491 = 2 * v1228[3];
                        }
                        else
                        {
                          v491 = v1228[3];
                        }
                        v1232[1] += 2 * v491;
                        DWORD1(v1231) += 2;
                        break;
                      default:
                        sub_10001D8C8(v485, v486, v487);
                    }
                    v492 = v1203;
                    if (v475 != 2)
                      v492 = 0;
                    v18 += 404 * v492;
                    if (v475 == 2)
                      v475 = v1180;
                    else
                      v475 -= 2;
                    v474 += 2;
                    if (!v474)
                      goto LABEL_707;
                    continue;
                  default:
                    sub_10001D910(v476, v477, v478);
                }
              default:
                sub_10001D910(v476, v477, v478);
            }
          }
        }
        goto LABEL_707;
      case 2u:
        goto LABEL_213;
      case 3u:
        if (v21)
        {
          v493 = -2 * v19;
          v494 = 2 * v20;
          while (2)
          {
            v495 = sub_10000C9D4((uint64_t)v1083, a3 + 300, 0, (int *)&v1227, (int *)&v1231, v18, &v1215, *(double *)v12.i64, v13);
            switch((int)v1224)
            {
              case 0:
              case 2:
                sub_10001D8EC(v495, v496, v497);
              case 1:
              case 3:
                if (v1228[0])
                {
                  --v1228[0];
                  v500 = 2 * *((_QWORD *)&v1224 + 1);
                }
                else
                {
                  v500 = *((_QWORD *)&v1224 + 1);
                }
                v1228[1] += 2 * v500;
                v499.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1227 + 4), (int32x2_t)0x200000002).u32[0];
                v498 = veor_s8(*(int8x8_t *)((char *)&v1227 + 4), (int8x8_t)0x100000001);
                v499.n128_u32[1] = v498.u32[1];
                *(_QWORD *)((char *)&v1227 + 4) = v499.n128_u64[0];
                break;
              case 4:
                if (v1228[0])
                {
                  --v1228[0];
                  v501 = 2 * *((_QWORD *)&v1224 + 1);
                }
                else
                {
                  v501 = *((_QWORD *)&v1224 + 1);
                }
                v1228[1] += 2 * v501;
                DWORD1(v1227) += 2;
                break;
              default:
                sub_10001D8C8(v495, v496, v497);
            }
            switch(LODWORD(v1228[2]))
            {
              case 0:
              case 2:
                sub_10001D8EC(v495, v496, v497);
              case 1:
              case 3:
                if (v1232[0])
                {
                  --v1232[0];
                  v502 = 2 * v1228[3];
                }
                else
                {
                  v502 = v1228[3];
                }
                v1232[1] += 2 * v502;
                v499.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1231 + 4), (int32x2_t)0x200000002).u32[0];
                v498 = veor_s8(*(int8x8_t *)((char *)&v1231 + 4), (int8x8_t)0x100000001);
                v499.n128_u32[1] = v498.u32[1];
                *(_QWORD *)((char *)&v1231 + 4) = v499.n128_u64[0];
                break;
              case 4:
                if (v1232[0])
                {
                  --v1232[0];
                  v503 = 2 * v1228[3];
                }
                else
                {
                  v503 = v1228[3];
                }
                v1232[1] += 2 * v503;
                DWORD1(v1231) += 2;
                break;
              default:
                sub_10001D8C8(v495, v496, v497);
            }
            v504 = sub_10000C9D4((uint64_t)v1083, a3 + 300, 1, (int *)&v1225, (int *)&v1229, v18, &v1215, *(double *)&v498, v499);
            switch((int)v1224)
            {
              case 0:
                *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1225 + 4), (int32x2_t)0x100000001).u32[0];
                *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1225 + 4), (int8x8_t)0x100000001);
                v13.n128_u32[1] = v12.u32[1];
                *(_QWORD *)((char *)&v1225 + 4) = v13.n128_u64[0];
                goto LABEL_485;
              case 1:
              case 3:
              case 4:
                if ((_QWORD)v1226)
                {
                  *(_QWORD *)&v1226 = v1226 - 1;
                  v507 = *((_QWORD *)&v1224 + 1);
                }
                else
                {
                  v507 = 2 * *((_QWORD *)&v1224 + 1);
                }
                *((_QWORD *)&v1226 + 1) += 2 * v507;
                v508 = DWORD1(v1225) + 2;
                goto LABEL_484;
              case 2:
                *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                v508 = DWORD1(v1225) + 1;
LABEL_484:
                DWORD1(v1225) = v508;
LABEL_485:
                switch(LODWORD(v1228[2]))
                {
                  case 0:
                    *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                    v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1229 + 4), (int32x2_t)0x100000001).u32[0];
                    *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1229 + 4), (int8x8_t)0x100000001);
                    v13.n128_u32[1] = v12.u32[1];
                    *(_QWORD *)((char *)&v1229 + 4) = v13.n128_u64[0];
                    goto LABEL_493;
                  case 1:
                  case 3:
                  case 4:
                    if ((_QWORD)v1230)
                    {
                      *(_QWORD *)&v1230 = v1230 - 1;
                      v509 = v1228[3];
                    }
                    else
                    {
                      v509 = 2 * v1228[3];
                    }
                    *((_QWORD *)&v1230 + 1) += 2 * v509;
                    v510 = DWORD1(v1229) + 2;
                    goto LABEL_492;
                  case 2:
                    *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                    v510 = DWORD1(v1229) + 1;
LABEL_492:
                    DWORD1(v1229) = v510;
LABEL_493:
                    v511 = v1203;
                    if (v494 != 2)
                      v511 = 0;
                    v18 += 404 * v511;
                    if (v494 == 2)
                      v494 = v1180;
                    else
                      v494 -= 2;
                    v493 += 2;
                    if (!v493)
                      goto LABEL_707;
                    continue;
                  default:
                    sub_10001D910(v504, v505, v506);
                }
              default:
                sub_10001D910(v504, v505, v506);
            }
          }
        }
        goto LABEL_707;
      case 4u:
        if (v21)
        {
          v512 = -2 * v19;
          v513 = 2 * v20;
          while (2)
          {
            v514 = sub_10000CC00((uint64_t)v1083, a3 + 300, (uint64_t)&v1227, (uint64_t)&v1231, v18, &v1215, *(double *)v12.i64, v13.n128_f64[0], v14);
            switch((int)v1224)
            {
              case 0:
              case 2:
                sub_10001D8EC(v514, v515, v516);
              case 1:
              case 3:
                if (v1228[0])
                {
                  --v1228[0];
                  v520 = 2 * *((_QWORD *)&v1224 + 1);
                }
                else
                {
                  v520 = *((_QWORD *)&v1224 + 1);
                }
                v1228[1] += 2 * v520;
                LODWORD(v518) = vadd_s32(*(int32x2_t *)((char *)&v1227 + 4), (int32x2_t)0x200000002).u32[0];
                v517 = veor_s8(*(int8x8_t *)((char *)&v1227 + 4), (int8x8_t)0x100000001);
                HIDWORD(v518) = v517.i32[1];
                *(double *)((char *)&v1227 + 4) = v518;
                break;
              case 4:
                if (v1228[0])
                {
                  --v1228[0];
                  v521 = 2 * *((_QWORD *)&v1224 + 1);
                }
                else
                {
                  v521 = *((_QWORD *)&v1224 + 1);
                }
                v1228[1] += 2 * v521;
                DWORD1(v1227) += 2;
                break;
              default:
                sub_10001D8C8(v514, v515, v516);
            }
            switch(LODWORD(v1228[2]))
            {
              case 0:
              case 2:
                sub_10001D8EC(v514, v515, v516);
              case 1:
              case 3:
                if (v1232[0])
                {
                  --v1232[0];
                  v522 = 2 * v1228[3];
                }
                else
                {
                  v522 = v1228[3];
                }
                v1232[1] += 2 * v522;
                LODWORD(v518) = vadd_s32(*(int32x2_t *)((char *)&v1231 + 4), (int32x2_t)0x200000002).u32[0];
                v517 = veor_s8(*(int8x8_t *)((char *)&v1231 + 4), (int8x8_t)0x100000001);
                HIDWORD(v518) = v517.i32[1];
                *(double *)((char *)&v1231 + 4) = v518;
                break;
              case 4:
                if (v1232[0])
                {
                  --v1232[0];
                  v523 = 2 * v1228[3];
                }
                else
                {
                  v523 = v1228[3];
                }
                v1232[1] += 2 * v523;
                DWORD1(v1231) += 2;
                break;
              default:
                sub_10001D8C8(v514, v515, v516);
            }
            v524 = sub_10000CC00((uint64_t)v1083, a3 + 300, (uint64_t)&v1225, (uint64_t)&v1229, v18, &v1215, *(double *)&v517, v518, v519);
            switch((int)v1224)
            {
              case 0:
                *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1225 + 4), (int32x2_t)0x100000001).u32[0];
                *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1225 + 4), (int8x8_t)0x100000001);
                v13.n128_u32[1] = v12.u32[1];
                *(_QWORD *)((char *)&v1225 + 4) = v13.n128_u64[0];
                goto LABEL_528;
              case 1:
              case 3:
              case 4:
                if ((_QWORD)v1226)
                {
                  *(_QWORD *)&v1226 = v1226 - 1;
                  v527 = *((_QWORD *)&v1224 + 1);
                }
                else
                {
                  v527 = 2 * *((_QWORD *)&v1224 + 1);
                }
                *((_QWORD *)&v1226 + 1) += 2 * v527;
                v528 = DWORD1(v1225) + 2;
                goto LABEL_527;
              case 2:
                *((_QWORD *)&v1226 + 1) += 2 * *((_QWORD *)&v1224 + 1);
                v528 = DWORD1(v1225) + 1;
LABEL_527:
                DWORD1(v1225) = v528;
LABEL_528:
                switch(LODWORD(v1228[2]))
                {
                  case 0:
                    *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                    v13.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1229 + 4), (int32x2_t)0x100000001).u32[0];
                    *(int8x8_t *)v12.i8 = veor_s8(*(int8x8_t *)((char *)&v1229 + 4), (int8x8_t)0x100000001);
                    v13.n128_u32[1] = v12.u32[1];
                    *(_QWORD *)((char *)&v1229 + 4) = v13.n128_u64[0];
                    goto LABEL_536;
                  case 1:
                  case 3:
                  case 4:
                    if ((_QWORD)v1230)
                    {
                      *(_QWORD *)&v1230 = v1230 - 1;
                      v529 = v1228[3];
                    }
                    else
                    {
                      v529 = 2 * v1228[3];
                    }
                    *((_QWORD *)&v1230 + 1) += 2 * v529;
                    v530 = DWORD1(v1229) + 2;
                    goto LABEL_535;
                  case 2:
                    *((_QWORD *)&v1230 + 1) += 2 * v1228[3];
                    v530 = DWORD1(v1229) + 1;
LABEL_535:
                    DWORD1(v1229) = v530;
LABEL_536:
                    v531 = v1203;
                    if (v513 != 2)
                      v531 = 0;
                    v18 += 404 * v531;
                    if (v513 == 2)
                      v513 = v1180;
                    else
                      v513 -= 2;
                    v512 += 2;
                    if (!v512)
                      goto LABEL_707;
                    continue;
                  default:
                    sub_10001D910(v524, v525, v526);
                }
              default:
                sub_10001D910(v524, v525, v526);
            }
          }
        }
        goto LABEL_707;
      default:
        sub_10001D4A0();
    }
  }
  v21 = *(_DWORD *)(a3 + 20);
  v1180 = *(_DWORD *)(a3 + 28);
  v1215.i32[0] = 0;
LABEL_213:
  if (v21)
  {
    v247 = 2 * *(_DWORD *)(a3 + 24);
    v248 = v1224;
    v1079 = v1225;
    v1134 = 2 * v1225;
    v249 = *((_QWORD *)&v1226 + 1);
    __srcb = (char *)v1230;
    v1123 = v1226;
    v250 = DWORD1(v1229);
    v1096 = *((_QWORD *)&v1224 + 1);
    v1085 = v1228[3];
    v1068 = 2 * v1228[3];
    v1071 = 2 * *((_QWORD *)&v1224 + 1);
    v1102 = 2 * *(_DWORD *)(a3 + 16);
    v251 = (int8x8_t)vdup_n_s32(0x7FF8u);
    v252 = v1180;
    v253 = DWORD1(v1225);
    v254 = v1228[2];
    while (2)
    {
      v1161 = v253;
      v1143 = v250;
      v255 = v1134;
      if (v1102 >= 1)
      {
        v256 = 0;
        v257 = v18 - 404;
        v258 = (char *)&v1229 + 8;
        v259 = (unsigned __int16 *)(v249 + 8);
        v260 = *(_BYTE *)(a3 + 304);
        if (v1079)
          v258 = (char *)&v1225 + 8;
        v261 = *(int *)v258;
        v262 = v1102 + 2;
        v255 = v1134;
        do
        {
          if (v255)
            v263 = v255;
          else
            v263 = 2 * v1229;
          if (v255)
            v264 = v259;
          else
            v264 = (unsigned __int16 *)(*((_QWORD *)&v1230 + 1) + 8);
          v9 = v256 == 0;
          if (!v256)
            v256 = v247;
          v265 = v257 + 404 * v9;
          v11 = *(v264 - 1);
          v266 = v264[3];
          v10 = (v11 + ((__int16)*(v264 - 4) >> 3));
          v267 = *v264;
          ++*(_DWORD *)(v265 + 384);
          *(_QWORD *)(v265 + 388) += (unsigned __int16)v10;
          *(_QWORD *)(v265 + 396) += (unsigned __int16)v10 * (unint64_t)(unsigned __int16)v10;
          if ((v267 & 4) == 0)
          {
            v268 = (__int16)v264[1];
            v269 = v268 & 7;
            if ((v267 & 1) != 0 || (((v268 & 7u) < 6) & (v267 >> 1)) != 0)
            {
              v282 = v257 + 404 * v9 + 336;
              v283 = (int8x8_t)__PAIR64__(v266, v10);
              v284 = (int32x2_t *)(v282 + 12 * (int)v261);
              v285 = (int32x2_t)vand_s8(v283, (int8x8_t)0xFFFF0000FFFFLL);
              v286.i32[0] = 1;
              v286.i32[1] = v285.i32[0];
              *v284 = vadd_s32(*v284, v286);
              v284[1].i32[0] += v11;
              v287 = v282 + 12 * (v261 + 1);
              ++*(_DWORD *)v287;
              v14.n128_u64[0] = (unint64_t)vadd_s32(*(int32x2_t *)(v287 + 4), v285);
              *(_QWORD *)(v287 + 4) = v14.n128_u64[0];
            }
            else
            {
              v270 = v269 > 5;
              v271 = v264[2];
              v10 = (v271 & 0xF) + 1;
              v272 = v271 >> 4;
              v273 = (__int16)v267 >> 3;
              v274 = v268 >> 3;
              if (v268 < 0)
                v274 = -v274;
              if (v273 < 0)
                v273 = -v273;
              v275 = v269 - v270;
              v276 = (16 * (v274 & 0xFFFu)) >> v270;
              v277 = (v10 >> 1) * v272;
              v11 = (8 * v273);
              if (((v268 ^ v267) & 0x8000u) == 0)
                v278 = v275 + 7;
              else
                v278 = v275;
              v279 = v265 + 24 * v278;
              v14.n128_u32[0] = v276;
              v280.i32[0] = vshr_n_u32((uint32x2_t)v14.n128_u64[0], 1uLL).u32[0];
              v14.n128_u32[1] = v11;
              v280.i32[1] = vand_s8(*(int8x8_t *)&v14, v251).i32[1];
              v281 = (v280.i32[0] * v277) >> 15 << v260;
              v9 = 4294934528;
              if (v281 <= -32768)
                v281 = -32768;
              if (v281 >= 0x7FFF)
                v281 = 0x7FFF;
              *(_QWORD *)v279 += v10;
              v14 = (__n128)vaddw_u32(*(uint64x2_t *)(v279 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v281), v280), 0xFuLL));
              *(__n128 *)(v279 + 8) = v14;
            }
          }
          v259 = v264 + 8;
          v255 = v263 - 2;
          v256 -= 2;
          ++v1215.i32[0];
          v262 -= 2;
          v257 = v265;
        }
        while (v262 > 2);
      }
      if (!v255)
      {
        switch(v248)
        {
          case 0:
            v249 += 2 * v1096;
            *((_QWORD *)&v1226 + 1) = v249;
            v253 = v1161 + 1;
            *(_QWORD *)((char *)&v1225 + 4) = __PAIR64__(DWORD2(v1225), v1161 + 1) ^ 0x100000000;
            goto LABEL_252;
          case 1:
          case 3:
          case 4:
            v288 = v1123;
            if (v1123)
            {
              --v1123;
              *(_QWORD *)&v1226 = v288 - 1;
              v289 = v1096;
            }
            else
            {
              v1123 = 0;
              v289 = v1071;
            }
            v290 = v1143;
            v249 += 2 * v289;
            *((_QWORD *)&v1226 + 1) = v249;
            v253 = v1161 + 2;
            DWORD1(v1225) = v1161 + 2;
            goto LABEL_253;
          case 2:
            v249 += 2 * v1096;
            *((_QWORD *)&v1226 + 1) = v249;
            v253 = v1161 + 1;
            DWORD1(v1225) = v1161 + 1;
LABEL_252:
            v290 = v1143;
LABEL_253:
            switch(v254)
            {
              case 0:
                *((_QWORD *)&v1230 + 1) += 2 * v1085;
                v250 = v290 + 1;
                *(_QWORD *)((char *)&v1229 + 4) = __PAIR64__(DWORD2(v1229), v250) ^ 0x100000000;
                goto LABEL_261;
              case 1:
              case 3:
              case 4:
                v291 = __srcb;
                if (__srcb)
                {
                  --__srcb;
                  *(_QWORD *)&v1230 = v291 - 1;
                  v292 = v1085;
                }
                else
                {
                  __srcb = 0;
                  v292 = v1068;
                }
                *((_QWORD *)&v1230 + 1) += 2 * v292;
                v250 = v290 + 2;
                goto LABEL_260;
              case 2:
                *((_QWORD *)&v1230 + 1) += 2 * v1085;
                v250 = v290 + 1;
LABEL_260:
                DWORD1(v1229) = v250;
LABEL_261:
                v293 = v1203;
                if (v252 != 1)
                  v293 = 0;
                v18 += 404 * v293;
                if (v252 == 1)
                  v252 = v1180;
                else
                  --v252;
                if (!--v21)
                  goto LABEL_707;
                continue;
              default:
                sub_10001D910(v9, v10, v11);
            }
          default:
            sub_10001D910(v9, v10, v11);
        }
      }
      break;
    }
    sub_10001D958();
  }
LABEL_707:
  if (*(_DWORD *)(a3 + 608))
  {
    v613 = sub_10000B02C((unint64_t)v1083, (uint64_t)__dst, (uint64_t)&v1224);
    v1205 = a3 + 608;
    v616 = v1090;
    switch(v1083->i32[0])
    {
      case 0:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
          sub_10001D658(v613, v614, v615);
        if (*(_DWORD *)(a3 + 156))
        {
          v617 = 0;
          v618 = (unsigned __int16 *)(a3 + 487308 + *v1090);
          v619 = (unsigned __int16 *)(a3 + 487308 + v1090[3]);
          v1184 = (char *)(a3 + 487308 + v1090[9]);
          v1163 = (_WORD *)(a3 + 487308 + v1090[12]);
          v1145 = (_WORD *)(a3 + 487308 + v1090[6]);
          v620 = *(_DWORD *)(a3 + 20);
          do
          {
            v621 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v617 % *(_DWORD *)(a3 + 132)) + 8);
            v622 = v1090 + 1;
            v623 = 5;
            do
            {
              bzero((void *)(a3 + 487308 + *(v622 - 1)), *v622);
              v622 += 3;
              --v623;
            }
            while (v623);
            if ((unsigned __int16)v620 >= v621)
              v624 = v621;
            else
              v624 = (unsigned __int16)v620;
            sub_10000D698((unsigned int *)a3, v624, (int *)&v1224, v618, v619, v1145);
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1205, v618, v619, v1184, v1163, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v617);
            LOWORD(v620) = v620 - v621;
            ++v617;
          }
          while (v617 < *(_DWORD *)(a3 + 156));
        }
        break;
      case 1:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
          sub_10001D658(v613, v614, v615);
        v625 = a3 + 487308;
        v626 = *v1090;
        v627 = v1090[3];
        v628 = v1090[9];
        v629 = v1090[12];
        v630 = v1090[6];
        if (*(_DWORD *)(a3 + 156))
        {
          v631 = 0;
          v632 = (unsigned __int16 *)(v625 + v626);
          v633 = (unsigned __int16 *)(v625 + v627);
          v1164 = (_WORD *)(v625 + v629);
          v1185 = (char *)(v625 + v628);
          v1146 = (_WORD *)(v625 + v630);
          v634 = *(_DWORD *)(a3 + 20);
          do
          {
            v635 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v631 % *(_DWORD *)(a3 + 132)) + 8);
            v636 = v1090 + 1;
            v637 = 5;
            do
            {
              bzero((void *)(v625 + *(v636 - 1)), *v636);
              v636 += 3;
              --v637;
            }
            while (v637);
            if ((unsigned __int16)v634 >= v635)
              v638 = v635;
            else
              v638 = (unsigned __int16)v634;
            sub_10000D698((unsigned int *)a3, v638, (int *)&v1224, v632, v633, v1146);
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1205, v632, v633, v1185, v1164, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v631);
            LOWORD(v634) = v634 - v635;
            ++v631;
          }
          while (v631 < *(_DWORD *)(a3 + 156));
          v616 = v1090;
          v626 = *v1090;
          v627 = v1090[3];
          v628 = v1090[9];
          v629 = v1090[12];
          v630 = v1090[6];
        }
        if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216))
          sub_10001D67C(v613, v614, v615);
        if (*(_DWORD *)(a3 + 212))
        {
          v639 = 0;
          v640 = 0;
          v641 = (unsigned __int16 *)(v625 + v626);
          v642 = (unsigned __int16 *)(v625 + v627);
          v1165 = (_WORD *)(v625 + v629);
          v1186 = (char *)(v625 + v628);
          v1147 = (_WORD *)(v625 + v630);
          v643 = *(_DWORD *)(a3 + 16);
          v1125 = v616 + 1;
          do
          {
            v644 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v639 % *(_DWORD *)(a3 + 188)) + 8);
            v645 = v1125;
            v646 = 5;
            do
            {
              bzero((void *)(v625 + *(v645 - 1)), *v645);
              v645 += 3;
              --v646;
            }
            while (v646);
            if ((unsigned __int16)v643 >= v644)
              v647 = v644;
            else
              v647 = (unsigned __int16)v643;
            sub_10000D934((unsigned int *)a3, v640, v647, (int *)&v1224, v641, v642, v1147);
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 188), v1205, v641, v642, v1186, v1165, a3 + 360 * *(_DWORD *)(a3 + 240) * v639 + 242980);
            v640 += v644;
            LOWORD(v643) = v643 - v644;
            ++v639;
          }
          while (v639 < *(_DWORD *)(a3 + 212));
        }
        break;
      case 2:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
          sub_10001D658(v613, v614, v615);
        if (*(_DWORD *)(a3 + 156))
        {
          v648 = 0;
          v649 = (unsigned __int16 *)(a3 + 487308 + *v1090);
          v650 = (unsigned __int16 *)(a3 + 487308 + v1090[3]);
          v1187 = (char *)(a3 + 487308 + v1090[9]);
          v1166 = (_WORD *)(a3 + 487308 + v1090[12]);
          v651 = *(_DWORD *)(a3 + 20);
          do
          {
            v652 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v648 % *(_DWORD *)(a3 + 132)) + 8);
            v653 = v1090 + 1;
            v654 = 5;
            do
            {
              bzero((void *)(a3 + 487308 + *(v653 - 1)), *v653);
              v653 += 3;
              --v654;
            }
            while (v654);
            if ((unsigned __int16)v651 >= v652)
              v655 = v652;
            else
              v655 = (unsigned __int16)v651;
            sub_10000DB74((uint64_t)v1083, v655, (uint64_t)&v1224, v649, v650);
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1205, v649, v650, v1187, v1166, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v648);
            LOWORD(v651) = v651 - v652;
            ++v648;
          }
          while (v648 < *(_DWORD *)(a3 + 156));
        }
        break;
      case 3:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
          sub_10001D658(v613, v614, v615);
        v656 = a3 + 487308;
        v657 = *v1090;
        v658 = v1090[3];
        v659 = v1090[9];
        v660 = v1090[12];
        v661 = v1090[6];
        if (*(_DWORD *)(a3 + 156))
        {
          v662 = 0;
          v663 = (unsigned __int16 *)(v656 + v657);
          v664 = (unsigned __int16 *)(v656 + v658);
          v1167 = (_WORD *)(v656 + v660);
          v1188 = (char *)(v656 + v659);
          v1148 = (_WORD *)(v656 + v661);
          v665 = *(_DWORD *)(a3 + 20);
          do
          {
            v666 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v662 % *(_DWORD *)(a3 + 132)) + 8);
            v667 = v1090 + 1;
            v668 = 5;
            do
            {
              bzero((void *)(v656 + *(v667 - 1)), *v667);
              v667 += 3;
              --v668;
            }
            while (v668);
            if ((unsigned __int16)v665 >= v666)
              v669 = v666;
            else
              v669 = (unsigned __int16)v665;
            sub_10000D698((unsigned int *)a3, v669, (int *)&v1224, v663, v664, v1148);
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1205, v663, v664, v1188, v1167, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v662);
            LOWORD(v665) = v665 - v666;
            ++v662;
          }
          while (v662 < *(_DWORD *)(a3 + 156));
          v616 = v1090;
          v657 = *v1090;
          v658 = v1090[3];
          v659 = v1090[9];
          v660 = v1090[12];
          v661 = v1090[6];
        }
        if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216))
          sub_10001D67C(v613, v614, v615);
        if (*(_DWORD *)(a3 + 212))
        {
          v670 = 0;
          v671 = 0;
          v672 = (unsigned __int16 *)(v656 + v657);
          v673 = (unsigned __int16 *)(v656 + v658);
          v1168 = (_WORD *)(v656 + v660);
          v1189 = (char *)(v656 + v659);
          v1149 = (_WORD *)(v656 + v661);
          v674 = *(_DWORD *)(a3 + 16);
          v1126 = v616 + 1;
          do
          {
            v675 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v670 % *(_DWORD *)(a3 + 188)) + 8);
            v676 = v1126;
            v677 = 5;
            do
            {
              bzero((void *)(v656 + *(v676 - 1)), *v676);
              v676 += 3;
              --v677;
            }
            while (v677);
            if ((unsigned __int16)v674 >= v675)
              v678 = v675;
            else
              v678 = (unsigned __int16)v674;
            sub_10000D934((unsigned int *)a3, v671, v678, (int *)&v1224, v672, v673, v1149);
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 188), v1205, v672, v673, v1189, v1168, a3 + 360 * *(_DWORD *)(a3 + 240) * v670 + 242980);
            v671 += v675;
            LOWORD(v674) = v674 - v675;
            ++v670;
          }
          while (v670 < *(_DWORD *)(a3 + 212));
        }
        break;
      case 4:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160))
          sub_10001D658(v613, v614, v615);
        v679 = a3 + 487308;
        v680 = *v1090;
        v681 = v1090[3];
        v682 = v1090[9];
        v683 = v1090[12];
        if (*(_DWORD *)(a3 + 156))
        {
          v684 = 0;
          v685 = (unsigned __int16 *)(v679 + v680);
          v686 = (unsigned __int16 *)(v679 + v681);
          v1190 = (char *)(v679 + v682);
          v1169 = (_WORD *)(v679 + v683);
          v687 = *(_DWORD *)(a3 + 20);
          do
          {
            v688 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v684 % *(_DWORD *)(a3 + 132)) + 8);
            v689 = v1090 + 1;
            v690 = 5;
            do
            {
              bzero((void *)(v679 + *(v689 - 1)), *v689);
              v689 += 3;
              --v690;
            }
            while (v690);
            if ((unsigned __int16)v687 >= v688)
              v691 = v688;
            else
              v691 = (unsigned __int16)v687;
            sub_10000DB74((uint64_t)v1083, v691, (uint64_t)&v1224, v685, v686);
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 132), v1205, v685, v686, v1190, v1169, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v684);
            LOWORD(v687) = v687 - v688;
            ++v684;
          }
          while (v684 < *(_DWORD *)(a3 + 156));
          v616 = v1090;
          v680 = *v1090;
          v681 = v1090[3];
          v682 = v1090[9];
          v683 = v1090[12];
        }
        if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216))
          sub_10001D67C(v613, v614, v615);
        if (*(_DWORD *)(a3 + 212))
        {
          v692 = 0;
          v693 = 0;
          v694 = *(_DWORD *)(a3 + 16);
          __srcd = (unsigned __int16 *)(v679 + v680);
          v695 = *((_QWORD *)&v1224 + 1);
          v1170 = (unsigned __int16 *)(v679 + v681);
          __dsta = (char *)(v679 + v682);
          v1104 = (_WORD *)(v679 + v683);
          v696 = v1224;
          v1091 = v1227;
          v1087 = v1228[0];
          v697 = v1228[3];
          v698 = v1228[2];
          v699 = v1231;
          v1127 = v616 + 1;
          v1077 = v1232[0];
          v1081 = v1228[1];
          v1073 = v1232[1];
          do
          {
            v1150 = v694;
            v1136 = v693;
            v1191 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v692 % *(_DWORD *)(a3 + 188)) + 8);
            v700 = v1127;
            v701 = 5;
            do
            {
              bzero((void *)(v679 + *(v700 - 1)), *v700);
              v700 += 3;
              --v701;
            }
            while (v701);
            if ((unsigned __int16)v1150 >= v1191)
              v702 = v1191;
            else
              v702 = (unsigned __int16)v1150;
            if (!(_DWORD)v702)
              sub_10001D8A0();
            v703 = *(unsigned int *)(a3 + 20);
            if ((_DWORD)v703)
            {
              v704 = 0;
              v705 = v1091 - v1136;
              if (v1091 - v1136 >= 1)
                v706 = 0;
              else
                v706 = v699;
              v707 = v706 + v705;
              v708 = v1170;
              v709 = __srcd;
              v711 = v1073;
              v710 = v1077;
              v712 = v1081;
              v713 = v1087;
              do
              {
                v714 = v711 + -16 * v705;
                if (v705 >= 1)
                  v714 = v712 + 2 * (8 * v1136);
                v715 = v702;
                v716 = v707;
                do
                {
                  if (!v716)
                  {
                    v714 = v711;
                    v716 = v699;
                  }
                  *v709 += *(_WORD *)(v714 + 6) >> 2;
                  *v708 += *(_WORD *)(v714 + 14) >> 2;
                  v714 += 16;
                  --v716;
                  --v715;
                }
                while (v715);
                if ((v696 - 3) >= 2 && v696 != 1)
                {
                  if (v696 == 2 || !v696)
                    sub_10001D8EC(v712, v713, v710);
                  sub_10001D8C8(v712, v713, v710);
                }
                if ((v698 - 3) >= 2 && v698 != 1)
                {
                  if (v698 == 2 || !v698)
                    sub_10001D8EC(v712, v713, v710);
                  sub_10001D8C8(v712, v713, v710);
                }
                v712 += 2 * (v695 << (v713 != 0));
                v855 = v713-- != 0;
                if (!v855)
                  v713 = 0;
                v717 = v710 - 1;
                if (!v710)
                  v717 = 0;
                v711 += 2 * (v697 << (v710 != 0));
                ++v709;
                ++v708;
                ++v704;
                v710 = v717;
              }
              while (v704 != v703);
              v718 = __srcd;
              v719 = v1170;
              v720 = 0x80 / v702;
              do
              {
                *v718 = (*v718 * v720) >> 5;
                ++v718;
                *v719 = (*v719 * v720) >> 5;
                ++v719;
                --v703;
              }
              while (v703);
            }
            sub_10000BDD4(v1210, (unsigned int *)(a3 + 188), v1205, __srcd, v1170, __dsta, v1104, a3 + 360 * *(_DWORD *)(a3 + 240) * v692 + 242980);
            v693 = v1191 + v1136;
            v694 = v1150 - v1191;
            ++v692;
          }
          while (v692 < *(_DWORD *)(a3 + 212));
        }
        break;
      default:
        sub_10001D630();
    }
  }
LABEL_920:
  if (*(_DWORD *)(a3 + 608))
  {
    v816 = *(_DWORD *)(a3 + 12);
    if (v816 >= 5)
      sub_10001D608();
    v1156 = 0;
    v1092 = *(_DWORD *)(a3 + 676);
    v817 = *(float *)(a3 + 684);
    v1082 = *(float *)(a3 + 288);
    v818 = *(float *)(a3 + 292);
    v819 = *(float *)(a3 + 296);
    v820 = 8;
    switch(v816)
    {
      case 0u:
      case 2u:
        goto LABEL_926;
      case 1u:
      case 4u:
        goto LABEL_924;
      case 3u:
        v820 = 4;
LABEL_924:
        if (8u / *(_DWORD *)(a3 + 164) != v820 / *(_DWORD *)(a3 + 220))
          sub_10001D5E0();
        v1156 = 1;
LABEL_926:
        v1105 = 8u / *(_DWORD *)(a3 + 164);
        __srce = *(unsigned __int16 *)(a3 + 656);
        v1137 = *(_DWORD *)(a3 + 680);
        v1130 = a3 + 284;
        v1223.i32[0] = 0;
        v1222.i32[0] = 0;
        v821 = *(unsigned __int8 *)(a3 + 664);
        if (*(_BYTE *)(a3 + 664))
        {
          v822 = 0;
          v823 = *(_DWORD *)(a3 + 668);
          v824 = *(float *)(a3 + 672);
          do
          {
            v1199 = v822;
            v825 = a3 + 56 * v822;
            *(_QWORD *)v1211 = *(unsigned int *)(v825 + 156);
            if (v1211[0])
            {
              v826 = 0;
              v827 = a3 + 184320 * v822 + 58660;
              v1207 = *(_DWORD *)(v825 + 184);
              do
              {
                if (v1207)
                {
                  v828 = 0;
                  v829 = (float)*(int *)(a3 + 620);
                  do
                  {
                    v830 = (_DWORD *)(v827 + v828);
                    LODWORD(v1224) = 0;
                    v1215.i32[0] = 0;
                    v831 = *(_DWORD *)(v827 + v828 + 340);
                    v832 = (float)v831;
                    if (v831)
                      v833 = (float)v831;
                    else
                      v833 = 1.0;
                    v834 = *(float *)(v827 + v828 + 160) / v833;
                    v835 = *(float *)(v827 + v828 + 168) / v833;
                    v836 = v834 * v832;
                    v837 = (float)(v834 * v832) * v829;
                    v838 = v835 * v832;
                    v839 = v838 * v829;
                    v840 = *(float *)(v827 + v828 + 164) - (float)(v836 * v834);
                    if (v837 == 0.0)
                      v841 = 1.0;
                    else
                      v841 = v837;
                    v842 = v840 / v841;
                    v843 = *(float *)(v827 + v828 + 176) - (float)(v838 * v835);
                    if (v839 == 0.0)
                      v844 = 1.0;
                    else
                      v844 = v839;
                    v830[88] = fmaxf((float)(v842 + (float)(v843 / v844)) * 65536.0, 0.0);
                    sub_10000DD78(v1130, v827 + v828, (float *)v1215.i32, (float *)&v1224);
                    v845 = *(float *)&v1224;
                    v830[86] = v1224;
                    v830[87] = v1215.i32[0];
                    if (v845 >= v824 && v830[88] >= v823)
                      *(_BYTE *)(v827 + v828 + 356) = 1;
                    v828 += 360;
                  }
                  while (360 * v1207 != v828);
                  v827 += v828;
                }
                ++v826;
              }
              while (v826 != *(_QWORD *)v1211);
            }
            v822 = v1199 + 1;
          }
          while (v1199 != v1156);
        }
        *(_BYTE *)(a3 + 636) = 0;
        *(_QWORD *)v1178 = *(unsigned __int16 *)(a3 + 34);
        if (*(_WORD *)(a3 + 34))
        {
          __dstb = 0;
          v846 = (__int16)(__srce + (__srce >> 15));
          v847 = -(v846 >> 1);
          v1088 = (float)(v1092 - v1137);
          if (v817 == 1.0)
            v848 = 1.0;
          else
            v848 = 1.0 - v817;
          v849 = (float)(v1105 >> 1);
          v1098 = v846 >> 1;
          if (v847 <= v846 >> 1)
            v850 = v846 >> 1;
          else
            v850 = -(v846 >> 1);
          v1212 = v850;
          v1200 = *(unsigned __int16 *)(a3 + 32);
          __srcf = -(v846 >> 1);
          do
          {
            if ((_DWORD)v1200)
            {
              *(_QWORD *)v1208 = 0;
              v1106 = (_QWORD)__dstb * v1200;
              do
              {
                v1242 = 0;
                v1240 = 0u;
                v1241 = 0u;
                v1238 = 0u;
                v1239 = 0u;
                v1236 = 0u;
                v1237 = 0u;
                v1234 = 0u;
                v1235 = 0u;
                v1233 = 0u;
                v1231 = 0u;
                memset(v1232, 0, sizeof(v1232));
                v1229 = 0u;
                v1230 = 0u;
                memset(v1228, 0, sizeof(v1228));
                v1226 = 0u;
                v1227 = 0u;
                v1224 = 0u;
                v1225 = 0u;
                if (v847 <= v1098)
                {
                  v852 = 0;
                  v851 = 0;
                  v853 = v847;
                  do
                  {
                    v1138 = v853;
                    v854 = v853 + (_DWORD)__dstb;
                    do
                    {
                      v855 = v847 + v1208[0] >= v1200 || v854 >= v1178[0];
                      if (!v855)
                      {
                        v856 = 0;
                        v857 = (float)*(int *)(a3 + 660);
                        v858 = a3 + 58676;
                        do
                        {
                          v859 = a3 + 56 * v856;
                          if (v856)
                            v860 = v847 + LOWORD(v1208[0]);
                          else
                            v860 = v854;
                          v861 = *(_WORD *)(v859 + 132);
                          v862 = v860 * v861;
                          LODWORD(v863) = (unsigned __int16)(v861 + v860 * v861);
                          v864 = *(unsigned __int16 *)(v859 + 156);
                          if (v863 >= v864)
                            v863 = v864;
                          else
                            v863 = v863;
                          if (v863 > v862)
                          {
                            if (v856)
                              v865 = v854;
                            else
                              v865 = v847 + LOWORD(v1208[0]);
                            v866 = *(_DWORD *)(a3 + 56 * v856 + 184);
                            if ((unsigned __int16)(v865 + 1) >= (unsigned __int16)v866)
                              v867 = (unsigned __int16)v866;
                            else
                              v867 = (unsigned __int16)(v865 + 1);
                            v868 = v862;
                            v869 = v866 * v862 + v865;
                            v870 = a3 + 184320 * v856 + 360 * v869 + 58660;
                            v871 = v858 + 360 * v869;
                            do
                            {
                              v872 = v871;
                              v873 = v865;
                              v874 = v870;
                              if (v865 < v867)
                              {
                                do
                                {
                                  if (!v821 || *(_BYTE *)(v874 + 356) == 1)
                                  {
                                    v875 = 0;
                                    v876 = *(_DWORD *)(v874 + 340);
                                    do
                                    {
                                      v877 = (float32x4_t *)((char *)&v1224 + v875);
                                      *v877 = vaddq_f32(*(float32x4_t *)(v874 + v875), *(float32x4_t *)((char *)&v1224 + v875));
                                      v877[1].f32[0] = *(float *)(v872 + v875) + *(float *)((char *)&v1224 + v875 + 16);
                                      v875 += 20;
                                    }
                                    while (v875 != 340);
                                    v852 += v876;
                                    v878 = (float)*(int *)(a3 + 620);
                                    v879 = (float)v876;
                                    if (v876)
                                      v880 = (float)v876;
                                    else
                                      v880 = 1.0;
                                    v881 = *(float *)(v874 + 160) / v880;
                                    v882 = *(float *)(v874 + 168) / v880;
                                    v883 = v881 * v879;
                                    v884 = (float)(v881 * v879) * v878;
                                    v885 = v882 * v879;
                                    v886 = v885 * v878;
                                    v887 = *(float *)(v874 + 164) - (float)(v883 * v881);
                                    if (v884 == 0.0)
                                      v888 = 1.0;
                                    else
                                      v888 = v884;
                                    v889 = v887 / v888;
                                    v890 = *(float *)(v874 + 176) - (float)(v885 * v882);
                                    if (v886 == 0.0)
                                      v886 = 1.0;
                                    v851 += fmaxf((float)(v889 + (float)(v890 / v886)) * v857, 0.0);
                                  }
                                  v874 += 360;
                                  ++v873;
                                  v872 += 360;
                                }
                                while (v873 != v867);
                              }
                              v870 += 360 * v866;
                              ++v868;
                              v871 += 360 * v866;
                            }
                            while (v868 != v863);
                          }
                          ++v856;
                          v858 += 184320;
                        }
                        while (v856 != v1156 + 1);
                      }
                      v418 = v847++ == v1212;
                    }
                    while (!v418);
                    v853 = v1138 + 1;
                    v847 = __srcf;
                  }
                  while (v1138 != v1212);
                  DWORD1(v1241) = v852;
                }
                else
                {
                  v851 = 0;
                }
                sub_10000DD78(v1130, (uint64_t)&v1224, (float *)v1222.i32, (float *)v1223.i32);
                v891 = *(float *)v1223.i32 <= v817
                    || v851 <= v1092
                             - (float)((float)((float)(*(float *)v1223.i32 - v817) * v1088) / v848);
                v847 = __srcf;
                v892 = v818 * (float)((float)(v849 * *(float *)v1222.i32) - v1082);
                v893 = *(_QWORD *)v1208;
                v894 = !v891;
                if (v891)
                  v895 = 0;
                else
                  v895 = v851;
                v896 = a3 + 52 * (*(_QWORD *)v1208 + v1106) + 480040;
                *(_DWORD *)(v896 + 24) = (float)(*(float *)v1223.i32 * 1000.0);
                *(_DWORD *)(v896 + 28) = v895;
                if (v894)
                  v897 = -96;
                else
                  v897 = -120;
                *(float *)(a3 + 52 * (*(_QWORD *)v1208 + v1106) + 480072) = v819 * v892;
                *(_DWORD *)(a3 + 52 * (*(_QWORD *)v1208 + v1106) + 480076) = 0;
                *(_DWORD *)(a3 + 52 * (*(_QWORD *)v1208 + v1106) + 480080) = 0;
                *(_BYTE *)(a3 + 52 * (*(_QWORD *)v1208 + v1106) + 480084) = v897;
                ++*(_QWORD *)v1208;
              }
              while (v893 + 1 != v1200);
            }
            __dstb = (char *)__dstb + 1;
          }
          while (__dstb != *(void **)v1178);
        }
        v898 = v1178[0];
        break;
      default:
        sub_10001D5B8();
    }
  }
  else
  {
    v1082 = *(float *)(a3 + 288);
    v898 = *(unsigned __int16 *)(a3 + 34);
  }
  v899 = *(unsigned __int16 *)(a3 + 32);
  v900 = v898 * v899;
  if (v898 * v899)
  {
    v901 = a3 + 6948;
    v902 = a3 + 7092;
    v903 = vcvts_n_s32_f32(v1082, 0xCuLL);
    v904 = (uint64_t *)(a3 + 6964);
    do
    {
      v905 = 0;
      v906 = v901;
      v907 = v902;
      do
      {
        for (i = 0; i != 24; i += 8)
        {
          v909 = *(_QWORD *)(v906 + i);
          *(_QWORD *)(v906 + i) = *(_QWORD *)(v907 + i);
          *(_QWORD *)(v907 + i) = v909;
        }
        ++v905;
        v907 -= 24;
        v906 += 24;
      }
      while (v905 != 3);
      v910 = 0;
      v911 = v904;
      do
      {
        v912 = *(v911 - 1);
        v913 = dword_100022338[v910];
        v914 = ((*v911 << dword_1000222C8[v910]) * dword_100022300[v910] - ((uint64_t)(v912 * v903 + 2048) >> 12)) << v913;
        *(v911 - 1) = v912 << v913;
        *v911 = v914;
        ++v910;
        v911 += 3;
      }
      while (v910 != 14);
      v901 += 404;
      v902 += 404;
      v904 = (uint64_t *)((char *)v904 + 404);
      --v900;
    }
    while (v900);
  }
  v915 = a3 + 463652;
  bzero((void *)(a3 + 441636), 0x6E00uLL);
  if (v898)
  {
    *(float *)&v916 = *(float *)(a3 + 292) * *(float *)(a3 + 296);
    v917 = *(float *)(a3 + 308);
    v918 = a3 + 6948;
    v919 = a3 + 463668;
    v920 = a3 + 441636;
    do
    {
      if (v899)
      {
        v921 = (_QWORD *)(v918 + 16);
        v922 = (_DWORD *)v919;
        v923 = v899;
        v924 = v920;
        do
        {
          v925 = 0;
          v926 = 0;
          v927 = 0;
          v928 = (_QWORD *)(v918 + 388);
          v929 = v921;
          do
          {
            v930 = *(v929 - 1);
            v931 = (float)((float)v930 / v917);
            if (v931)
            {
              v932 = *(float *)&v916 * (float)((float)((*v929 << 8) / v930) * 0.0039062);
              if (v932 < 0.0)
                v933 = -0.5;
              else
                v933 = 0.5;
              v934 = (int)(float)(v932 + v933);
              v935 = *((unsigned int *)v929 - 4);
            }
            else
            {
              v934 = 0;
              v935 = 0;
            }
            v936 = (_DWORD *)(v924 + v925 * 4);
            *v936 = v935;
            v936[14] = v931;
            v936[28] = v934;
            v927 += dword_100022370[v925] * v931;
            v926 += v935;
            ++v925;
            v929 += 3;
          }
          while (v925 != 14);
          v937 = *(unsigned int *)(v918 + 384);
          if ((_DWORD)v937 && *v928)
          {
            v938 = 0;
            v939 = *v928 * *v928;
            v940 = 16 * v927;
            if (v926 <= 1)
              v941 = 1;
            else
              v941 = v926;
            v942 = (unsigned __int16 *)(a3 + 326);
            v943 = v940 / v941;
            do
            {
              v945 = *v942;
              v942 += 2;
              v944 = v945;
              if (v938 > 2)
                break;
              ++v938;
              v946 = v944 == 0xFFFF || v943 < (__int16)v944;
            }
            while (!v946);
            v947 = 10000 * (*(_QWORD *)(v918 + 396) * v937 - v939) / v939 > (__int16)*(v942 - 1);
          }
          else
          {
            v947 = 0;
          }
          *(_BYTE *)(v924 + 168) = v947;
          v948 = v922;
          for (j = 344; j != 392; j += 12)
          {
            *(v948 - 4) = *(_DWORD *)(v918 + j - 8);
            *v948 = *(_DWORD *)(v918 + j - 4);
            v948[4] = *(_DWORD *)(v918 + j);
            ++v948;
          }
          v918 += 404;
          v924 += 172;
          v921 = (_QWORD *)((char *)v921 + 404);
          v922 += 12;
          --v923;
        }
        while (v923);
      }
      v920 += 172 * v899;
      v919 += 48 * v899;
      --v898;
    }
    while (v898);
  }
  if (*(_DWORD *)(a3 + 312) != 1)
    sub_10001D590();
  v950 = 0;
  v1139 = (_WORD *)(a3 + 486696);
  v951 = 1;
  do
  {
    v1201 = v951;
    v952 = *(_DWORD *)(a3 + 4 * v950 + 312);
    if (v952 >= 1)
    {
      v953 = a3 + (v950 << 11) + 469800;
      v954 = *(unsigned __int16 *)(a3 + 32);
      v955 = *(unsigned __int16 *)(a3 + 34);
      if (v952 == 1)
      {
        v956 = v955 * v954;
        if (v955 * v954)
        {
          v957 = a3 + 441636;
          do
          {
            sub_10000E0B0(a3 + 284, v957, v953, v916);
            v957 += 172;
            v953 += 16;
            --v956;
          }
          while (v956);
        }
      }
      else
      {
        v958 = 0;
        if (v954 >= v952)
          v915 = v952;
        else
          v915 = *(unsigned __int16 *)(a3 + 32);
        if (v955 >= v952)
          v959 = v952;
        else
          v959 = *(unsigned __int16 *)(a3 + 34);
        do
        {
          if (v915 <= v954)
          {
            v960 = 0;
            do
            {
              v961 = v960 + v954 * v958;
              v1231 = 0u;
              memset(v1232, 0, 28);
              v1229 = 0u;
              v1230 = 0u;
              memset(v1228, 0, sizeof(v1228));
              v1226 = 0u;
              v1227 = 0u;
              v1224 = 0u;
              v1225 = 0u;
              if (v959)
              {
                v962 = 0;
                v963 = 0;
                v964 = a3 + 441636 + 172 * v961;
                v965 = v954;
                v966 = a3 + 441748 + 172 * (v960 + v958 * v954);
                v967 = 172 * v954;
                v968 = v959;
                do
                {
                  v969 = v966;
                  v970 = v915;
                  for (k = v964; v970; --v970)
                  {
                    if (*(_BYTE *)(k + 168))
                    {
                      for (m = 0; m != 56; m += 4)
                      {
                        *(_DWORD *)((char *)&v1224 + m) += *(_DWORD *)(v969 + m - 112);
                        v973 = *(_DWORD *)(v969 + m - 56);
                        v974 = (_DWORD *)((char *)&v1228[-1] + m);
                        *v974 = *(_DWORD *)((char *)&v1228[-1] + m) + v973;
                        v974[14] = *(_DWORD *)((char *)&v1230 + m) + *(_DWORD *)(v969 + m) * v973;
                      }
                      v962 = ++v963;
                    }
                    k += 172;
                    v969 += 172;
                  }
                  v964 += 172 * v965;
                  v966 += v967;
                  --v968;
                }
                while (v968);
                LOBYTE(v1232[3]) = v962;
              }
              v975 = 0;
              v976 = v953 + 16 * v961;
              do
              {
                v977 = (char *)&v1224 + v975;
                v978 = *(_DWORD *)((char *)&v1228[-1] + v975);
                if (v978)
                {
                  v979 = *((_DWORD *)v977 + 28);
                  v980 = v978 >> 1;
                  if (v979 < 0)
                    v980 = -v980;
                  *((_DWORD *)v977 + 28) = (v980 + v979) / v978;
                }
                v975 += 4;
              }
              while (v975 != 56);
              sub_10000E0B0(a3 + 284, (uint64_t)&v1224, v976, 0.0);
              v954 = *(unsigned __int16 *)(a3 + 32);
              v946 = v960++ < v954 - v915;
            }
            while (v946);
            v955 = *(unsigned __int16 *)(a3 + 34);
          }
          v946 = v958++ < v955 - v959;
        }
        while (v946);
      }
    }
    v951 = 0;
    v950 = 1;
  }
  while ((v1201 & 1) != 0);
  v981 = *(int *)(a3 + 12);
  if (v981 >= 5)
    sub_10001D568();
  v982 = *(unsigned __int16 *)(a3 + 34);
  v983 = v982 * *(unsigned __int16 *)(a3 + 32);
  v984 = (_DWORD *)(a3 + 463652);
  if (v983)
  {
    v985 = qword_100022408[v981];
    v986 = v982 * *(unsigned __int16 *)(a3 + 32);
    do
    {
      v987 = v984;
      v988 = v985;
      do
      {
        v987[2561] = *v987;
        v987[2565] = v987[4];
        v987[2569] = v987[8];
        ++v987;
        --v988;
      }
      while (v988);
      v984 += 12;
      --v986;
    }
    while (v986);
  }
  *(_DWORD *)(a3 + 487232) = *(_DWORD *)(a3 + 6861);
  *(_BYTE *)(a3 + 487236) = *(_BYTE *)(a3 + 6865);
  if (*(_BYTE *)(a3 + 6860))
  {
    v989 = (unsigned __int16)*v1139;
    if (v983 && v989 <= 0x7F)
    {
      v990 = (float *)(a3 + 486700 + 4 * v989);
      v991 = v983 - 1;
      v992 = a3 + 473896;
      do
      {
        sub_10000E318(v1083->u32[0], v992);
        LOWORD(v989) = *v1139;
        if (v993 >= 0.0)
        {
          *v990++ = v993;
          LOWORD(v989) = v989 + 1;
          *v1139 = v989;
        }
        if (!v991)
          break;
        v992 += 48;
        --v991;
      }
      while ((unsigned __int16)v989 < 0x80u);
    }
    if ((_WORD)v989)
    {
      qsort((void *)(a3 + 486700), (unsigned __int16)v989, 4uLL, (int (__cdecl *)(const void *, const void *))sub_10000E484);
      v994 = 0;
      v995 = (unsigned __int16)*v1139;
      do
      {
        v996 = (42949673 * (unint64_t)(*(unsigned __int8 *)(a3 + 487232 + v994) * v995 + 50)) >> 32;
        if (v996 >= v995)
          LODWORD(v996) = v995 - 1;
        *(_DWORD *)(a3 + 487212 + 4 * v994++) = *(_DWORD *)&v1139[2 * (int)v996 + 2];
      }
      while (v994 != 5);
    }
    v997 = 0;
    v998 = a3 + 6868;
    while (2)
    {
      v999 = 0;
      do
      {
        v1000 = *(float *)(v998 + 4 * v999);
        if (v1000 < 0.0)
          goto LABEL_1117;
        v1001 = *(float *)(a3 + 487212 + 4 * v999);
        if (v999 > 3)
          break;
        ++v999;
      }
      while (v1000 <= v1001);
      if (v1000 > v1001)
      {
LABEL_1117:
        if (*(unsigned __int8 *)(a3 + 487240) >= 5u)
          sub_10001D540();
        break;
      }
      *(_BYTE *)(a3 + 487240) = ++v997;
      v998 += 20;
      if (v997 != 4)
        continue;
      break;
    }
  }
  if (*(_BYTE *)(a3 + 400))
  {
    v1002 = *(float *)(a3 + 404);
    if (*(_BYTE *)(a3 + 487240) && v1002 > *(float *)(a3 + 408))
      v1002 = *(float *)(a3 + 408);
  }
  else
  {
    v1002 = 0.0;
  }
  v1003 = 0;
  v1004 = (float)((float)(*(float *)(a3 + 292) * *(float *)(a3 + 288)) * *(float *)(a3 + 296)) * -0.5;
  v1005 = 1;
  do
  {
    v1213 = v1005;
    v1006 = *(_DWORD *)(a3 + 4 * v1003 + 312);
    if (v1006 >= 1)
    {
      v1007 = *(unsigned __int16 *)(a3 + 34);
      v1008 = v1007 - v1006;
      if (v1007 >= v1006)
      {
        v1009 = 0;
        v1010 = (float)*(int *)(a3 + 469796);
        v1011 = a3 + (v1003 << 11) + 469800;
        v1012 = a3 + 20 * v1003;
        v1209 = (_BYTE *)(v1012 + 360);
        v1013 = *(unsigned __int16 *)(a3 + 32);
        v1157 = (unsigned int *)(v1012 + 372);
        v1179 = (_DWORD *)(v1012 + 368);
        v1131 = (unsigned int *)(v1012 + 364);
        v1140 = (unsigned int *)(v1012 + 376);
        v1014 = (_BYTE)v1003 << 6;
        v1202 = v1013 - v1006;
        v1015 = *(unsigned __int16 *)(a3 + 32);
        v1017 = a3 + 480040;
        v1016 = a3 + 473896;
        v1093 = v1008;
        v1089 = v1013;
        while (v1013 < v1006)
        {
LABEL_1188:
          v1016 += 48 * v1015;
          v1011 += 16 * v1015;
          v1017 += 52 * v1015;
          v418 = v1009++ == v1008;
          if (v418)
            goto LABEL_1190;
        }
        __srcg = v1009;
        v1018 = 0;
        v1099 = v1017;
        v1107 = v1016;
        __dstc = (void *)v1011;
        while (1)
        {
          sub_10000E318(*(unsigned int *)(a3 + 12), v1016);
          v1020 = *(_BYTE *)(a3 + 344) ? v915 & 0xFFFFFFFE | (*(_BYTE *)(v1011 + 12) == 0) : v915 & 0xFFFFFFFE;
          if (*(_BYTE *)(a3 + 348))
          {
            v1021 = *(_DWORD *)(v1011 + 8);
            v1022 = (float)((float)v1021 * 0.0625) + v1010;
            v1023 = (float)*(int *)(a3 + 356);
            v1024 = v1020 & 0xFFFFFFFB | (4 * (v1022 >= v1023));
            if (v1021 >= -1024 && v1022 < v1023)
              v1024 = v1020 & 0xFFFFFFFB | (4 * (v1022 <= (float)*(int *)(a3 + 352)));
          }
          else
          {
            v1024 = v1020 & 0xFFFFFFFB;
          }
          if (*v1209)
          {
            v1025 = *v1131;
            if (*v1131 <= 1)
              v1025 = 1;
            v1026 = *(_DWORD *)(v1011 + 4);
            v1027 = *(_DWORD *)v1011 / v1025;
            v1028 = (float)((float)*(int *)(v1011 + 8) * 0.0625) - v1004;
            if (v1028 < 0.0)
              v1028 = -v1028;
            v1029 = (float)((float)(1.0 - (float)((float)(v1028 + -16.0) * 0.0625)) * 20.0)
                  + (float)((float)((float)(v1028 + -16.0) * 0.0625) * 10.0);
            if (v1028 > 32.0)
              v1029 = 10.0;
            if (v1028 <= 16.0)
              v1029 = (float)((float)(1.0 - (float)((float)(v1028 + -8.0) * 0.125)) * 40.0)
                    + (float)((float)((float)(v1028 + -8.0) * 0.125) * 20.0);
            v1030 = v1028 > 8.0 ? v1029 : 40.0;
            v1031 = (*v1179 * (float)((float)(fabsf(sqrtf((float)v1027)) * v1030) + 0.5)) >> 8;
            v1032 = v1027 >= *v1140 || v1026 >= *v1157;
            v1033 = v1032 && v1026 >= v1031;
            v1034 = v1033 ? 0 : 8;
            v1035 = v1034 | v1024 & 0xFFFFFFF7;
          }
          else
          {
            v1035 = v1024 & 0xFFFFFFF7;
          }
          v1036 = *(_BYTE *)(a3 + 400) ? v1035 & 0xFFFFFFEF | (16 * (v1019 >= v1002)) : v1035 & 0xFFFFFFEF;
          v915 = v1036 & 0xFFFFFFDD;
          v1037 = (float)*(int *)(v1011 + 8) * 0.0625;
          if (v1006 != 1)
            break;
          if ((v1213 & 1) == 0)
            sub_10001D4C8();
          *(_QWORD *)v1017 = *(_QWORD *)v1011;
          *(float *)(v1017 + 8) = v1037;
          *(float *)(v1017 + 12) = v1019;
          *(_DWORD *)(v1017 + 16) = 0;
          *(_DWORD *)(v1017 + 20) = v1036 & 0xDD;
          *(_BYTE *)(v1017 + 20) = v1014 | (32 * ((v1036 & 0x1D) == 0)) | v1036 & 0x1D;
LABEL_1185:
          v1011 += 16;
          v1016 += 48;
          v1017 += 52;
          v418 = v1018++ == v1202;
          if (v418)
          {
            v1015 = *(unsigned __int16 *)(a3 + 32);
            v1008 = v1093;
            v1009 = __srcg;
            v1016 = v1107;
            v1011 = (uint64_t)__dstc;
            v1013 = v1089;
            v1017 = v1099;
            goto LABEL_1188;
          }
        }
        if ((v1213 & 1) != 0)
          sub_10001D4F0();
        if ((v1036 & 0xD) != 0)
          goto LABEL_1185;
        v1038 = *(unsigned __int8 *)(v1011 + 12);
        v1039 = v1006;
        v1040 = v1017;
LABEL_1170:
        v1041 = (float *)(v1040 + 20);
        v1042 = v1006;
        while (1)
        {
          v1043 = *(_BYTE *)v1041;
          if (((*(_BYTE *)v1041 & 0x10) != 0
             || (*(_BYTE *)v1041 & 1) != 0 && (v1006 * v1006) >> 1 >= v1038)
            && !*(_BYTE *)(a3 + 324))
          {
            goto LABEL_1183;
          }
          if (*(_BYTE *)(a3 + 342) == 1)
          {
            if ((*(_BYTE *)v1041 & 0x20) != 0 && *(v1041 - 3) <= v1037)
              goto LABEL_1183;
          }
          else
          {
            if (*(_BYTE *)(a3 + 342))
              sub_10001D518();
            if ((*(_BYTE *)v1041 & 0x20) != 0 && *(v1041 - 3) >= v1037)
              goto LABEL_1183;
          }
          *(_QWORD *)(v1041 - 5) = *(_QWORD *)v1011;
          *(v1041 - 3) = v1037;
          *(_BYTE *)v1041 = v1014 | v1043 & 0x33 | 0x20;
LABEL_1183:
          v1041 += 13;
          if (!--v1042)
          {
            v1040 += 52 * *(unsigned __int16 *)(a3 + 32);
            if (!--v1039)
              goto LABEL_1185;
            goto LABEL_1170;
          }
        }
      }
    }
LABEL_1190:
    v1005 = 0;
    v1003 = 1;
  }
  while ((v1213 & 1) != 0);
  if (*(_BYTE *)(a3 + 412))
  {
    if (*(_DWORD *)(a3 + 608))
    {
      v1044 = *(unsigned __int16 *)(a3 + 34) * *(unsigned __int16 *)(a3 + 32);
      if (v1044)
      {
        v1045 = a3 + 480048;
        do
        {
          if (*(_BYTE *)(a3 + 413) && (*(_BYTE *)(v1045 + 36) & 0x20) == 0)
            *(_BYTE *)(v1045 + 12) = *(_BYTE *)(v1045 + 12) & 0xDD | 2;
          if ((*(_BYTE *)(v1045 + 12) & 0x20) != 0)
          {
            v1046 = *(float *)v1045;
            if ((*(float *)v1045 <= 0.0 || *(float *)(v1045 + 24) >= 0.0)
              && (v1046 >= 0.0 || *(float *)(v1045 + 24) <= 0.0))
            {
              v1047 = -v1046;
              if (v1046 >= 0.0)
                v1047 = *(float *)v1045;
              if (v1047 > 1.0)
              {
                v1048 = *(float *)(v1045 + 24);
                v1049 = -v1048;
                if (v1048 >= 0.0)
                  v1049 = *(float *)(v1045 + 24);
                if (v1049 <= v1047)
                  v1050 = a3 + 480;
                else
                  v1050 = a3 + 544;
                if (v1049 <= v1047)
                  v1051 = v1049;
                else
                  v1051 = v1047;
                if (v1049 <= v1047)
                  v1052 = v1047;
                else
                  v1052 = v1049;
                v1053 = sub_10000E49C(v1050, v1047);
                if (v1051 == 0.0)
                  v1054 = 1.0;
                else
                  v1054 = v1051;
                v1055 = powf(v1052 / v1054, v1053);
                v1056 = sub_10000E49C(a3 + 416, (float)*(unsigned int *)(v1045 + 16)) * v1055;
                *(float *)v1045 = (float)(v1048 * v1056) + (float)(v1046 * (float)(1.0 - v1056));
                *(float *)(v1045 + 8) = v1056;
              }
            }
          }
          v1045 += 52;
          --v1044;
        }
        while (v1044);
      }
    }
  }
  return sub_10000A658(a3);
}

uint64_t sub_10000A658(uint64_t result)
{
  unsigned int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t i;
  unsigned int v28;
  BOOL v29;
  int v30;
  char v31;
  int v32;

  if (*(_BYTE *)(result + 712))
  {
    v1 = *(unsigned __int8 *)(result + 713);
    v2 = *(unsigned __int8 *)(result + 714) == v1 ? 1 : *(unsigned __int8 *)(result + 714) - v1;
    v3 = *(unsigned __int16 *)(result + 34);
    if (*(_WORD *)(result + 34))
    {
      v4 = 0;
      v5 = *(_DWORD *)(result + 272);
      v6 = result + 480040;
      v7 = *(_DWORD *)(result + 280);
      v8 = *(unsigned __int16 *)(result + 262);
      v32 = *(_DWORD *)(result + 268);
      v9 = *(unsigned __int16 *)(result + 32);
      v10 = (((v2 + ((unsigned __int16)(v2 & 0x8000) >> 15)) >> 1) + 0x10000) / v2;
      do
      {
        v11 = v7 + v5;
        v12 = (v5 >> 8) & ~(v5 >> 31);
        if (v12 >= v8)
          v12 = v8;
        v13 = ((v11 + 255) >> 8) & ~((v11 + 255) >> 31);
        if (v13 >= v8)
          v13 = v8;
        v14 = v13 - v12;
        if (v13 < v12)
          v14 = 0;
        if (v9)
        {
          v15 = 0;
          v16 = *(_DWORD *)(result + 276);
          v17 = *(unsigned __int16 *)(result + 260);
          v18 = *(unsigned __int16 *)(result + 264);
          v19 = v32;
          do
          {
            v20 = 0;
            v21 = (v19 >> 8) & ~(v19 >> 31);
            v19 += v16;
            if (v21 >= v17)
              v21 = v17;
            v22 = ((v19 + 255) >> 8) & ~((v19 + 255) >> 31);
            if (v22 >= v17)
              v22 = v17;
            v23 = v22 - v21;
            if (v22 < v21)
              v23 = 0;
            if (v13 > v12)
            {
              v20 = 0;
              v24 = result + 715 + v12 * v18 + v21;
              if (v23 <= 1)
                v25 = 1;
              else
                v25 = v23;
              v26 = v14;
              do
              {
                if (v22 > v21)
                {
                  for (i = 0; i != v25; ++i)
                  {
                    v28 = *(unsigned __int8 *)(v24 + i);
                    if (v28 <= v1)
                      v28 = v1;
                    v20 += v28;
                  }
                }
                v24 += v18;
                v29 = __OFSUB__(v26--, 1);
              }
              while (!((v26 < 0) ^ v29 | (v26 == 0)));
              if (v22 > v21)
                v20 /= (int)(v23 * v14);
            }
            v30 = (v20 - v1) * v10;
            if (v30 >= 0x10000)
              v31 = -1;
            else
              v31 = BYTE1(v30) & ~(v30 >> 31);
            *(_BYTE *)(v6 + 48) = v31;
            v6 += 52;
            ++v15;
          }
          while (v15 != v9);
        }
        ++v4;
        v5 = v11;
      }
      while (v4 != v3);
    }
  }
  return result;
}

uint64_t sub_10000A810(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    sub_10001DA48();
  if (!a2)
    sub_10001DA70();
  if (!a3)
    sub_10001DA98();
  bzero(a3 + 117450, 0x4424uLL);
  a3[117449] = a3[71];
  switch(a3[1])
  {
    case 0:
      v9 = a1;
      v10 = 0;
      v7 = a2;
      v8 = 0;
      break;
    case 1:
      sub_10001DAE8();
    case 2:
      sub_10001DB10();
    case 3:
      v9 = 0;
      v10 = 0;
      v7 = a1;
      v8 = a2;
      break;
    case 4:
      sub_10001DB38();
    default:
      sub_10001DAC0();
  }
  return sub_100004380((uint64_t)&v9, (uint64_t)&v7, (uint64_t)a3);
}

void sub_10000A900(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          bzero(a4 + 117450, 0x4424uLL);
          a4[117449] = a4[71];
          switch(a4[1])
          {
            case 0:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5331, "false");
            case 1:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5335, "false");
            case 2:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5339, "false");
            case 3:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5343, "false");
            case 4:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5347, "false");
            default:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5351, "false");
          }
        }
        __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5326, "pContext != nullptr");
      }
      __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5325, "pIn2 != nullptr");
    }
    __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5324, "pIn1 != nullptr");
  }
  __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5323, "pIn0 != nullptr");
}

uint64_t sub_10000AAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  int v10;
  _QWORD v12[2];
  _QWORD v13[2];

  if (!a1)
    sub_10001DB60();
  if (!a2)
    sub_10001DB88();
  if (!a3)
    sub_10001DBB0();
  if (!a4)
    sub_10001DBD8();
  if (!a5)
    sub_10001DC00();
  bzero(a5 + 117450, 0x4424uLL);
  a5[117449] = a5[71];
  v10 = a5[1];
  if (v10 != 1)
  {
    switch(v10)
    {
      case 0:
        sub_10001DC50();
      case 2:
        sub_10001DC78();
      case 3:
        sub_10001DCA0();
      case 4:
        sub_10001DCC8();
      default:
        sub_10001DC28();
    }
  }
  v13[0] = a1;
  v13[1] = a3;
  v12[0] = a2;
  v12[1] = a4;
  return sub_100004380((uint64_t)v13, (uint64_t)v12, (uint64_t)a5);
}

unint64_t sub_10000ABB4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int *v5;
  int v6;
  uint64_t v7;
  int v8;
  __int128 v9;
  char v10;
  uint64_t v11;
  int *v12;
  _DWORD *v13;
  unsigned int v14;
  unsigned int *v15;
  _DWORD *v16;
  _DWORD *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  char v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v27;
  unsigned int *v28;
  _DWORD *v29;
  unsigned int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint32x2_t v34;
  uint32x2_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  BOOL v48;
  uint64_t v49;
  unsigned int v50;
  int v53;
  int v54;
  char v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;

  v5 = (unsigned int *)result;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0uLL;
  v10 = 1;
  do
  {
    v11 = a4 + 112 * v7;
    *(_OWORD *)(v11 + 96) = v9;
    *(_OWORD *)(v11 + 48) = v9;
    *(_OWORD *)(v11 + 64) = v9;
    *(_OWORD *)(v11 + 80) = v9;
    v12 = (int *)(v11 + 80);
    *(_OWORD *)(v11 + 32) = v9;
    v13 = (_DWORD *)(v11 + 32);
    *(_OWORD *)v11 = v9;
    *(_OWORD *)(v11 + 16) = v9;
    v14 = *v5;
    v15 = &v5[12 * v7];
    *(_QWORD *)(v11 + 36) = -1;
    v16 = (_DWORD *)(v11 + 36);
    *(_DWORD *)v11 = v14;
    *(_QWORD *)(v11 + 76) = -1;
    v17 = (_DWORD *)(v11 + 76);
    v20 = v15[9];
    v19 = v15 + 9;
    v18 = v20;
    v21 = v10;
    v22 = *(v19 - 1);
    v24 = v19[1];
    v23 = v19[2];
    v25 = v24 - v22;
    if (v24 > v22 && v23 > v18)
    {
      v27 = v23 - v18;
      *(_DWORD *)(a4 + 112 * v7 + 4) = v27;
      v28 = (unsigned int *)(v11 + 40);
      v29 = (_DWORD *)(v11 + 72);
      switch(v14)
      {
        case 0u:
          v30 = v5[12 * v7 + 12];
          if (v30 >= 2)
            sub_10001DD18();
          if (v5[12 * v7 + 13] != -1)
            sub_10001DEF8();
          goto LABEL_20;
        case 1u:
        case 3u:
          v30 = v5[12 * v7 + 12];
          if (v30 >= 2)
            sub_10001DF20();
          v31 = v5[12 * v7 + 13];
          if ((v31 - 4) <= 0xFFFFFFFD)
            sub_10001DF48();
          switch(v14)
          {
            case 1u:
              *v13 = v25;
              *v16 = 0;
              *v28 = v30;
              *v29 = v25;
              *v17 = 1;
              v32 = v25;
              *v12 = v31;
              break;
            case 3u:
LABEL_24:
              *v29 = v25;
              *v17 = 0;
              *v12 = v31;
              *v13 = v25;
              *v16 = 1;
              v32 = v25;
              *v28 = v30;
              break;
            case 2u:
LABEL_20:
              v32 = 0;
              *v13 = v25;
              *v16 = 0;
              *v28 = v30;
              *(_QWORD *)v29 = 0xFFFFFFFF00000000;
              *v12 = -1;
              break;
            default:
              sub_10001DF70();
          }
          if (v27 != v5[2])
            sub_10001DED0();
          v33 = *(_QWORD *)(a2 + 8 * v7);
          if (!v33)
            sub_10001DD40();
          v34 = *(uint32x2_t *)&v5[12 * v7 + 16];
          v35 = vshr_n_u32(v34, 1uLL);
          *(_QWORD *)&v36 = v35.u32[0];
          *((_QWORD *)&v36 + 1) = v35.u32[1];
          *(_OWORD *)(a4 + 112 * v7 + 8) = v36;
          if (v34.i32[0] <= 1u)
            sub_10001DD68();
          if (v34.i32[1] <= 1u)
            sub_10001DD90();
          switch(v14)
          {
            case 0u:
            case 2u:
              v37 = a4 + 112 * v7;
              *(_QWORD *)(v37 + 56) = v33 + v5[12 * v7 + 15];
              *(_QWORD *)(v37 + 96) = 0;
              break;
            case 1u:
              v38 = v33 + v5[12 * v7 + 15];
              v39 = a4 + 112 * v7;
              *(_QWORD *)(v39 + 56) = v38;
              *(_QWORD *)(v39 + 96) = v38 + 2 * v35.u32[0];
              break;
            case 3u:
              v40 = v33 + v5[12 * v7 + 15];
              v41 = a4 + 112 * v7;
              *(_QWORD *)(v41 + 96) = v40;
              *(_QWORD *)(v41 + 56) = v40 + 2 * v35.u32[0];
              break;
            case 4u:
              sub_10001DEA8();
            default:
              sub_10001DDB8();
          }
          v42 = *(_QWORD *)(a3 + 8 * v7);
          if (!v42)
            sub_10001DDE0();
          v53 = v32;
          v54 = v25;
          v55 = v21;
          v56 = v6;
          v58 = 0;
          v59 = 0;
          v57 = 0;
          sub_10000B3CC(v14, v19 - 3, 6, (uint64_t *)&v59, &v58, &v57);
          v43 = a4 + 112 * v7;
          *(_QWORD *)(v43 + 24) = v59 >> 1;
          v44 = (_QWORD *)(v43 + 24);
          v44[3] = 0;
          v44[8] = 0;
          result = sub_10000B538(v14);
          v9 = 0uLL;
          switch(v14)
          {
            case 0u:
            case 2u:
              v45 = 0;
              *(_QWORD *)(a4 + 112 * v7 + 64) = v42 + v58;
              break;
            case 1u:
            case 3u:
              v46 = *v19;
              if (result > v46)
                v44[3] = result - v46;
              v47 = v5[12 * v7 + 7] + ~result;
              v48 = v47 >= v46;
              v49 = v47 - v46;
              if (v48)
                v44[8] = v49;
              *(_QWORD *)(a4 + 112 * v7 + 64) = v42 + v58;
              v45 = v42 + v57;
              break;
            default:
              sub_10001DE08();
          }
          *(_QWORD *)(a4 + 112 * v7 + 104) = v45;
          if (!*v44)
            sub_10001DE30();
          v8 += v53;
          v21 = v55;
          v6 = v54 + v56;
          break;
        case 2u:
          if (v5[12 * v7 + 12])
            sub_10001DFC0();
          if (v5[12 * v7 + 13] != -1)
            sub_10001DF98();
          v30 = 0;
          goto LABEL_20;
        case 4u:
          if (v5[12 * v7 + 12])
            sub_10001E010();
          if (v5[12 * v7 + 13] != 2)
            sub_10001DFE8();
          v30 = 0;
          v31 = 2;
          goto LABEL_24;
        default:
          sub_10001DCF0();
      }
    }
    v10 = 0;
    v7 = 1;
  }
  while ((v21 & 1) != 0);
  v50 = v5[1];
  if (v6 && v6 != v50)
    sub_10001DE58();
  if (v8)
  {
    if (v8 != v50)
      sub_10001DE80();
  }
  return result;
}

unint64_t sub_10000B02C(unint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int *v4;
  int v5;
  uint64_t v6;
  int v7;
  __int128 v8;
  char v9;
  uint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  unsigned int v13;
  unsigned int *v14;
  _DWORD *v15;
  _DWORD *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  char v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  unsigned int v26;
  unsigned int *v27;
  int *v28;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  int v42;
  int v43;
  char v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v4 = (unsigned int *)result;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0uLL;
  v9 = 1;
  do
  {
    v10 = a3 + 80 * v6;
    *(_OWORD *)(v10 + 64) = v8;
    *(_OWORD *)(v10 + 32) = v8;
    *(_OWORD *)(v10 + 48) = v8;
    v11 = (_DWORD *)(v10 + 48);
    *(_OWORD *)(v10 + 16) = v8;
    v12 = (_DWORD *)(v10 + 16);
    *(_OWORD *)v10 = v8;
    v13 = *v4;
    v14 = &v4[12 * v6];
    *(_QWORD *)(v10 + 20) = -1;
    v15 = (_DWORD *)(v10 + 20);
    *(_DWORD *)v10 = v13;
    *(_QWORD *)(v10 + 52) = -1;
    v16 = (_DWORD *)(v10 + 52);
    v19 = v14[9];
    v18 = v14 + 9;
    v17 = v19;
    v20 = v9;
    v21 = *(v18 - 1);
    v23 = v18[1];
    v22 = v18[2];
    v24 = v23 - v21;
    if (v23 > v21 && v22 > v17)
    {
      v26 = v22 - v17;
      *(_DWORD *)(a3 + 80 * v6 + 4) = v26;
      v27 = (unsigned int *)(v10 + 24);
      v28 = (int *)(v10 + 56);
      switch(v13)
      {
        case 0u:
          v29 = v4[12 * v6 + 12];
          if (v29 >= 2)
            sub_10001DD18();
          if (v4[12 * v6 + 13] != -1)
            sub_10001DEF8();
          goto LABEL_20;
        case 1u:
        case 3u:
          v29 = v4[12 * v6 + 12];
          if (v29 >= 2)
            sub_10001DF20();
          v30 = v4[12 * v6 + 13];
          if ((v30 - 4) <= 0xFFFFFFFD)
            sub_10001DF48();
          switch(v13)
          {
            case 1u:
              *v12 = v24;
              *v15 = 0;
              *v27 = v29;
              *v11 = v24;
              *v16 = 1;
              v31 = v24;
              *v28 = v30;
              break;
            case 3u:
LABEL_24:
              *v11 = v24;
              *v16 = 0;
              *v28 = v30;
              *v12 = v24;
              *v15 = 1;
              v31 = v24;
              *v27 = v29;
              break;
            case 2u:
LABEL_20:
              v31 = 0;
              *v12 = v24;
              *v15 = 0;
              *v27 = v29;
              *(_QWORD *)v11 = 0xFFFFFFFF00000000;
              *v28 = -1;
              break;
            default:
              sub_10001DF70();
          }
          if (v26 != v4[2])
            sub_10001E088();
          v32 = *(_QWORD *)(a2 + 8 * v6);
          if (!v32)
            sub_10001DDE0();
          v42 = v31;
          v43 = v24;
          v44 = v20;
          v45 = v5;
          v47 = 0;
          v48 = 0;
          v46 = 0;
          sub_10000B3CC(v13, v18 - 3, 8, (uint64_t *)&v48, &v47, &v46);
          v33 = a3 + 80 * v6;
          *(_QWORD *)(v33 + 8) = v48 >> 1;
          v34 = (_QWORD *)(v33 + 8);
          v34[3] = 0;
          v34[7] = 0;
          result = sub_10000B538(v13);
          if (v13 > 4)
            sub_10001DE08();
          v8 = 0uLL;
          if (((1 << v13) & 0x1A) != 0)
          {
            v35 = *v18;
            if (result > v35)
              v34[3] = result - v35;
            v36 = v4[12 * v6 + 7] + ~result;
            v37 = v36 >= v35;
            v38 = v36 - v35;
            if (v37)
              v34[7] = v38;
            *(_QWORD *)(a3 + 80 * v6 + 40) = v32 + v47;
            v39 = v32 + v46;
          }
          else
          {
            v39 = 0;
            *(_QWORD *)(a3 + 80 * v6 + 40) = v32 + v47;
          }
          *(_QWORD *)(a3 + 80 * v6 + 72) = v39;
          if (!*v34)
            sub_10001DE30();
          v7 += v42;
          v20 = v44;
          v5 = v43 + v45;
          break;
        case 2u:
          if (v4[12 * v6 + 12])
            sub_10001DFC0();
          if (v4[12 * v6 + 13] != -1)
            sub_10001DF98();
          v29 = 0;
          goto LABEL_20;
        case 4u:
          if (v4[12 * v6 + 12])
            sub_10001E010();
          if (v4[12 * v6 + 13] != 2)
            sub_10001DFE8();
          v29 = 0;
          v30 = 2;
          goto LABEL_24;
        default:
          sub_10001DCF0();
      }
    }
    v9 = 0;
    v6 = 1;
  }
  while ((v20 & 1) != 0);
  v40 = v4[1];
  if (v5 && v5 != v40)
    sub_10001E038();
  if (v7)
  {
    if (v7 != v40)
      sub_10001E060();
  }
  return result;
}

unint64_t sub_10000B3CC(unsigned int a1, unsigned int *a2, uint64_t a3, uint64_t *a4, uint64_t *a5, _QWORD *a6)
{
  unint64_t result;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  result = sub_10000B538(a1);
  switch(a1)
  {
    case 0u:
      v22 = 0;
      v23 = *a2 * a3;
      *a4 = v23;
      v24 = a2[2] * a3 + v23 * 2 * a2[3];
      goto LABEL_11;
    case 1u:
    case 3u:
    case 4u:
      v13 = a2[1];
      if (v13 <= 3)
        sub_10001E0D8();
      v14 = a2[3];
      if (v14 >= v13)
        sub_10001E100();
      v15 = a3 << (a1 == 4);
      *a4 = v15 * *a2;
      *a5 = 0;
      v16 = 2 * v14 - result;
      if (result > v14)
        v16 = v14;
      *a5 = *a4 * v16;
      v17 = v13 + ~(_DWORD)v14;
      v18 = *a4 * (2 * v13 - 1);
      *a6 = v18;
      v19 = v18 + *a4 * (result - 2 * v17);
      v20 = v18 - *a4 * v17;
      if (result <= v17)
        v20 = v19;
      *a6 = v20;
      v21 = v15 * a2[2];
      *a5 += v21;
      v22 = *a6 + v21;
      goto LABEL_12;
    case 2u:
      v22 = 0;
      v25 = 2 * a3 * *a2;
      *a4 = v25;
      v24 = v25 * a2[3] + 2 * a2[2] * a3;
LABEL_11:
      *a5 = v24;
LABEL_12:
      *a6 = v22;
      return result;
    default:
      sub_10001E0B0();
  }
}

uint64_t sub_10000B538(unsigned int a1)
{
  if (a1 >= 5)
    sub_10001E128();
  return qword_1000223E0[a1];
}

uint64_t sub_10000B560(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int32x2_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;

  switch(*(_DWORD *)result)
  {
    case 0:
      v3 = *(_QWORD *)(result + 64) + 2 * *(_QWORD *)(result + 24);
      v4 = *(int32x2_t *)(result + 36);
      LODWORD(v5) = vadd_s32(v4, (int32x2_t)0x100000001).u32[0];
      *(_QWORD *)(result + 56) += 2 * *(_QWORD *)(result + 8 * (v4.i8[0] & 1) + 8);
      *(_QWORD *)(result + 64) = v3;
      HIDWORD(v5) = veor_s8(*(int8x8_t *)&v4, (int8x8_t)0x100000001).i32[1];
      *(_QWORD *)(result + 36) = v5;
      return result;
    case 1:
    case 3:
      v1 = *(_QWORD *)(result + 48);
      *(_QWORD *)(result + 56) += 2 * (*(_QWORD *)(result + 16) + *(_QWORD *)(result + 8));
      if (v1)
      {
        *(_QWORD *)(result + 48) = v1 - 1;
        v2 = *(_QWORD *)(result + 24);
      }
      else
      {
        v2 = 2 * *(_QWORD *)(result + 24);
      }
      *(_QWORD *)(result + 64) += 2 * v2;
      v8 = *(_DWORD *)(result + 36) + 2;
      goto LABEL_8;
    case 2:
      v6 = *(_DWORD *)(result + 36);
      v7 = *(_QWORD *)(result + 64) + 2 * *(_QWORD *)(result + 24);
      *(_QWORD *)(result + 56) += 2 * *(_QWORD *)(result + 8 * (v6 & 1) + 8);
      *(_QWORD *)(result + 64) = v7;
      v8 = v6 + 1;
LABEL_8:
      *(_DWORD *)(result + 36) = v8;
      return result;
    case 4:
      sub_10001E178();
    default:
      sub_10001E150();
  }
}

uint64_t sub_10000B650(uint64_t result, uint64_t a2, uint64_t a3, int *a4, int *a5, uint64_t a6, _DWORD *a7, double a8, __n128 a9)
{
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  unsigned __int16 *v15;
  unsigned __int16 *v16;
  int v17;
  unsigned __int16 *v18;
  unsigned __int16 *v19;
  int8x8_t v20;
  _BOOL4 v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  int v33;
  unsigned __int16 v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  unsigned __int16 v38;
  uint64_t v39;
  int32x2_t v40;
  signed int v41;
  _DWORD *v42;

  v9 = *a4;
  v10 = *(_DWORD *)(result + 4);
  if (v10 >= 1)
  {
    v11 = 0;
    v12 = *(_DWORD *)(result + 12);
    v13 = a6 - 404;
    v14 = a4[2];
    v16 = (unsigned __int16 *)*((_QWORD *)a4 + 3);
    v15 = (unsigned __int16 *)*((_QWORD *)a4 + 4);
    v17 = v10 + 1;
    v18 = (unsigned __int16 *)*((_QWORD *)a5 + 3);
    v19 = (unsigned __int16 *)*((_QWORD *)a5 + 4);
    result = 24;
    v20 = (int8x8_t)vdup_n_s32(0x7FF8u);
    a2 = *(unsigned __int8 *)(a2 + 4);
    do
    {
      if (!v9)
      {
        v14 = a5[2];
        v9 = *a5;
        v15 = v19;
        v16 = v18;
      }
      v21 = v11 == 0;
      if (!v11)
        v11 = v12;
      v22 = v13 + 404 * v21;
      v23 = *v16;
      v24 = (unint64_t)v16[1] >> 4;
      v25 = *v15;
      ++*(_DWORD *)(v22 + 384);
      *(_QWORD *)(v22 + 388) += v24;
      *(_QWORD *)(v22 + 396) += v24 * (unint64_t)v24;
      if ((v25 & 4) == 0)
      {
        v26 = (__int16)v15[1];
        v27 = v26 & 7;
        if ((v25 & 1) != 0 || (((v26 & 7u) < 6) & (v25 >> 1)) != 0)
        {
          v42 = (_DWORD *)(v13 + 404 * v21 + 12 * v14);
          ++v42[84];
          v42[85] += v24;
          v42[86] += v23 >> 4;
        }
        else
        {
          v28 = v27 > 5;
          v29 = v15[2];
          v30 = (v29 & 0xF) + 1;
          v31 = v29 >> 4;
          v32 = (__int16)v25 >> 3;
          v33 = v26 >> 3;
          if (v26 < 0)
            v33 = -v33;
          if (v32 < 0)
            v32 = -v32;
          v34 = v27 - v28;
          v35 = (16 * (v33 & 0xFFFu)) >> v28;
          v36 = (v30 >> 1) * v31;
          v37 = 8 * v32;
          if (((v26 ^ v25) & 0x8000u) == 0)
            v38 = v34 + 7;
          else
            v38 = v34;
          v39 = v22 + 24 * v38;
          a9.n128_u32[0] = v35;
          v40.i32[0] = vshr_n_u32((uint32x2_t)a9.n128_u64[0], 1uLL).u32[0];
          a9.n128_u32[1] = v37;
          v40.i32[1] = vand_s8(*(int8x8_t *)&a9, v20).i32[1];
          v41 = (v40.i32[0] * v36) >> 15 << a2;
          if (v41 <= -32768)
            v41 = -32768;
          if (v41 >= 0x7FFF)
            v41 = 0x7FFF;
          *(_QWORD *)v39 += v30;
          a9 = (__n128)vaddw_u32(*(uint64x2_t *)(v39 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v41), v40), 0xFuLL));
          *(__n128 *)(v39 + 8) = a9;
        }
      }
      v16 += 2;
      v15 += 3;
      --v9;
      --v11;
      ++*a7;
      v14 ^= a3;
      --v17;
      v13 = v22;
    }
    while (v17 > 1);
  }
  if (v9)
    sub_10001D6F8(result, a2, a3);
  return result;
}

void sub_10000B880(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  int v7;
  int v8;
  int v9;
  int16x8_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  const __int16 *v15;
  const __int16 *v16;
  int8x16_t v17;
  int16x8_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  uint16x8_t v23;
  const __int16 *v24;
  const __int16 *v25;
  int v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  const __int16 *v30;
  int v31;
  uint64_t v32;
  __int8 *v33;
  __int8 *v34;
  __int8 *v35;
  __int8 *v36;
  char *v37;
  int v38;
  const __int16 *v39;
  const __int16 *v40;
  const __int16 *v41;
  uint64_t v42;
  int8x16_t v43;
  int16x8_t v44;
  int8x16_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  uint16x8_t v49;
  uint16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int8x16_t v55;
  unsigned __int16 *v56;
  _BOOL4 v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _DWORD *v66;
  int16x8_t v67[2];
  _OWORD v68[2];
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;
  int16x8x2_t v73;
  int16x8x3_t v74;

  v7 = *(_DWORD *)a4;
  v8 = *(_DWORD *)(a1 + 4);
  if (v8 < 1)
    goto LABEL_33;
  v9 = 0;
  v10 = vdupq_n_s16(*(char *)(a2 + 4));
  v11 = *(_DWORD *)(a1 + 12);
  if (v7)
    v12 = a4;
  else
    v12 = a5;
  v13 = *(_DWORD *)(v12 + 8);
  v14 = a6 - 404;
  v16 = *(const __int16 **)(a4 + 24);
  v15 = *(const __int16 **)(a4 + 32);
  v17.i64[0] = 0x1000100010001;
  v17.i64[1] = 0x1000100010001;
  v18.i64[0] = -1;
  v18.i64[1] = -1;
  v19.i64[0] = 0x2000200020002;
  v19.i64[1] = 0x2000200020002;
  v20.i64[0] = 0x4000400040004;
  v20.i64[1] = 0x4000400040004;
  v21.i64[0] = 0x7000700070007;
  v21.i64[1] = 0x7000700070007;
  v22.i64[0] = 0xF000F000F000FLL;
  v22.i64[1] = 0xF000F000F000FLL;
  v23.i64[0] = 0x5000500050005;
  v23.i64[1] = 0x5000500050005;
LABEL_6:
  v24 = *(const __int16 **)(a5 + 24);
  v25 = *(const __int16 **)(a5 + 32);
  v26 = *(_DWORD *)a5;
  if (!v7)
  {
    v7 = *(_DWORD *)a5;
    v15 = *(const __int16 **)(a5 + 32);
    v16 = *(const __int16 **)(a5 + 24);
  }
  if (v7 > 7)
  {
    v27 = 8;
LABEL_11:
    v73 = vld2q_s16(v16);
    v16 += 16;
    v7 -= v27;
    v74 = vld3q_s16(v15);
    v15 += 24;
    goto LABEL_23;
  }
  v27 = v8;
  if (v7 == v8)
    goto LABEL_11;
  if (v7 < 1)
    sub_10001D828();
  v28 = 0;
  v29 = 2 * v7;
  do
  {
    v30 = &v16[v28];
    v67[0].i16[v28 / 2] = *v30;
    v72.i16[v28 / 2] = v30[1];
    v71.i16[v28 / 2] = *v15;
    v70.i16[v28 / 2] = v15[1];
    v69.i16[v28 / 2] = v15[2];
    v28 += 2;
    v15 += 3;
  }
  while (v29 != v28);
  if (v8 >= 8)
    v31 = 8;
  else
    v31 = v8;
  if (v7 < v31)
  {
    v32 = 0;
    v33 = &v69.i8[v29];
    v34 = &v70.i8[v29];
    v35 = &v71.i8[v29];
    v36 = &v72.i8[v29];
    v37 = &v67[0].i8[v29];
    v38 = v7;
    v39 = v24;
    do
    {
      v40 = &v24[v32];
      *(_WORD *)&v37[v32] = *v40;
      *(_WORD *)&v36[v32] = v40[1];
      *(_WORD *)&v35[v32] = *v25;
      *(_WORD *)&v34[v32] = v25[1];
      *(_WORD *)&v33[v32] = v25[2];
      v41 = v39;
      v25 += 3;
      v32 += 2;
      ++v38;
      v39 = v40 + 2;
    }
    while (v31 > v38);
    v24 = v41 + 2;
  }
  v73.val[0] = v67[0];
  v73.val[1] = v72;
  v74.val[1] = v70;
  v74.val[0] = v71;
  v7 += v26 - v31;
  v15 = v25;
  v16 = v24;
  v74.val[2] = v69;
LABEL_23:
  v42 = 0;
  v43 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v74.val[0], v20));
  v44 = (int16x8_t)vandq_s8((int8x16_t)v74.val[1], v21);
  v45 = (int8x16_t)vshrq_n_u16((uint16x8_t)v73.val[0], 4uLL);
  v46 = (int8x16_t)vshrq_n_u16((uint16x8_t)v73.val[1], 4uLL);
  v47 = (int8x16_t)vcgtq_u16((uint16x8_t)v44, v23);
  v48 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v74.val[1], 3uLL)), 4uLL);
  v49 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v74.val[0], 3uLL)), 4uLL);
  v50 = (uint16x8_t)vbslq_s8(v47, (int8x16_t)vshrq_n_u16((uint16x8_t)v48, 1uLL), v48);
  v51 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v74.val[2], v22), (int16x8_t)vbicq_s8(v17, (int8x16_t)v74.val[0])), vorrq_s8(v47, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v74.val[0], v19))));
  v52 = vaddq_s16((int16x8_t)vbslq_s8(v47, (int8x16_t)vaddq_s16(v44, v18), (int8x16_t)v44), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v74.val[0]), (int8x16_t)vcgtq_s16(v74.val[1], v18)), v21));
  v53 = (int16x8_t)vshrq_n_u16(v50, 1uLL);
  v54 = vqshlq_s16(vqdmulhq_s16(v53, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v51, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v74.val[2], 4uLL))), v10);
  v55 = (int8x16_t)vceqzq_s16(v51);
  v67[0] = v52;
  v67[1] = (int16x8_t)vornq_s8(vandq_s8((int8x16_t)v51, v43), v43);
  v68[0] = vbslq_s8(v55, v46, (int8x16_t)vqdmulhq_s16(v54, v53));
  v68[1] = vbslq_s8(v55, v45, (int8x16_t)vqdmulhq_s16(v54, (int16x8_t)vshrq_n_u16(v49, 1uLL)));
  v72 = (int16x8_t)v46;
  v56 = (unsigned __int16 *)v68;
  while (1)
  {
    v57 = v9 == 0;
    if (!v9)
      v9 = v11;
    v58 = v14 + 404 * v57;
    v59 = *(v56 - 16);
    v60 = *(v56 - 8);
    v61 = *v56;
    v62 = v56[8];
    ++*(_DWORD *)(v58 + 384);
    v63 = v72.u16[v42];
    *(_QWORD *)(v58 + 388) += v63;
    *(_QWORD *)(v58 + 396) += v63 * (unint64_t)v63;
    if ((_DWORD)v60)
    {
      if ((_DWORD)v60 != 0xFFFF)
      {
        v64 = (_QWORD *)(v58 + 24 * v59);
        v65 = v64[1];
        *v64 += v60;
        v64[1] = v65 + v61;
        v64[2] += v62;
      }
    }
    else
    {
      v66 = (_DWORD *)(v14 + 404 * v57 + 12 * v13);
      ++v66[84];
      v66[85] += v61;
      v66[86] += v62;
    }
    ++*a7;
    if (v8 - 1 == (_DWORD)v42)
      break;
    ++v56;
    v13 ^= a3;
    --v9;
    ++v42;
    v14 += 404 * v57;
    if (v42 == 8)
    {
      v8 -= 8;
      v14 = v58;
      if (v8 + 1 > 1)
        goto LABEL_6;
      break;
    }
  }
LABEL_33:
  if (v7)
    sub_10001D800();
}

uint64_t sub_10000BC60(uint64_t a1, unint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5, _WORD *a6)
{
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned __int16 *v17;
  uint64_t v18;
  _WORD *v19;
  _WORD *v20;
  _WORD *v21;
  int v23;
  uint64_t v24;

  v12 = *(unsigned int *)(a1 + 16);
  v13 = *(unsigned __int16 *)(a1 + 628);
  bzero(a6, *(unsigned int *)(a1 + 487272));
  if (!a2)
    sub_10001E1A0();
  v24 = a1;
  v14 = 0;
  v15 = 40;
  if (!*(_DWORD *)(a3 + 32))
    v15 = 152;
  v23 = *(_DWORD *)(a3 + v15);
  do
  {
    v16 = *(_DWORD *)(a3 + 32);
    if ((_DWORD)v12)
    {
      v17 = *(unsigned __int16 **)(a3 + 56);
      v18 = v12;
      v19 = a6;
      v20 = a5;
      v21 = a4;
      do
      {
        if (!v16)
        {
          v17 = *(unsigned __int16 **)(a3 + 168);
          v16 = *(_DWORD *)(a3 + 144);
        }
        *v21 += *v17 >> 6;
        *v20 += v17[1] >> 6;
        if (v13 < *v17 || v13 < v17[1])
          ++*v19;
        ++v19;
        v17 += 2;
        ++v21;
        ++v20;
        --v16;
        --v18;
      }
      while (v18);
    }
    sub_10000B560(a3);
    sub_10000B560(a3 + 112);
    if (v16)
      sub_10001E1C8();
    ++v14;
  }
  while (v14 != a2);
  return sub_10000C064(v24 + 608, 0x80 / a2, v12, v23, a4, a5, a6);
}

void sub_10000BDD4(int a1, unsigned int *a2, uint64_t a3, unsigned __int16 *__src, unsigned __int16 *a5, char *__dst, _WORD *a7, uint64_t a8)
{
  unsigned int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  char *v25;
  _WORD *v26;
  unsigned int v27;
  uint64_t v28;
  float32x4_t *v29;
  unsigned int v30;
  int32x4_t v31;
  unsigned int v32;
  char *v33;
  unsigned __int16 *v34;
  int v35;
  unsigned int v36;
  int32x4_t v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  int16x8_t *v42;
  int8x16_t *v43;

  v15 = a2[8];
  switch(v15)
  {
    case 4u:
      sub_10000C158(a2[7], __src, (uint64_t)__dst);
      sub_10000C158(a2[7], a5, (uint64_t)a7);
      break;
    case 2u:
      sub_10000C0F8(a2[7], __src, __dst);
      sub_10000C0F8(a2[7], a5, a7);
      break;
    case 1u:
      memcpy(__dst, __src, 2 * a2[7]);
      memcpy(a7, a5, 2 * a2[7]);
      break;
    default:
      sub_10001E1F0();
  }
  if (a1 == 1)
  {
    if ((*(_DWORD *)(a3 + 4) & 0x80000000) == 0)
      sub_10001E290();
    if (*(int *)(a3 + 8) <= 0)
      sub_10001E2B8();
    if (a2[13])
    {
      v38 = 0;
      v39 = 0;
      v40 = a2[10];
      do
      {
        if (a2[12] + v39 >= a2[11])
          v39 = a2[11];
        else
          v39 += a2[12];
        v41 = (v39 - v40) & 0xFFFFFFF8;
        *(_DWORD *)(a8 + 340) = v41;
        v42 = (int16x8_t *)&__dst[2 * v40];
        v43 = (int8x16_t *)&a7[v40];
        sub_10000C1E4(v41, v42, v43, a8);
        sub_10000C1E4(v41, v42, v43 + 1, a8 + 160);
        a8 += 360;
        ++v38;
        v40 = v39;
      }
      while (v38 < a2[13]);
    }
  }
  else
  {
    if (a1)
      sub_10001E218();
    v16 = *(int *)(a3 + 4);
    if ((v16 & 0x80000000) == 0)
      sub_10001E240();
    v17 = *(_DWORD *)(a3 + 8);
    if (v17 <= 0)
      sub_10001E268();
    v18 = a2[13];
    if (v18)
    {
      v19 = 0;
      v20 = 0;
      v22 = a2[11];
      v21 = a2[12];
      v23 = v17 + 1;
      v24 = a2[10];
      do
      {
        v25 = &__dst[2 * v24];
        v26 = &a7[v24];
        v20 += v21;
        if (v20 >= v22)
          v20 = v22;
        v27 = (v20 - v24) & 0xFFFFFFF8;
        *(_DWORD *)(a8 + 340) = v27;
        v28 = v16;
        v29 = (float32x4_t *)a8;
        do
        {
          v30 = 0;
          v31 = 0uLL;
          if (v27)
          {
            v32 = v27;
            v33 = v25;
            v34 = &v26[v28];
            do
            {
              v35 = *(unsigned __int16 *)v33;
              if (v35 != 0xFFFF)
              {
                v36 = *v34;
                if (v36 != 0xFFFF)
                {
                  v30 += v36 * v36;
                  v37.i32[0] = *(unsigned __int16 *)v33;
                  v37.i32[1] = v35 * v35;
                  v37.i64[1] = __PAIR64__(v36 * v35, v36);
                  v31 = vaddq_s32(v31, v37);
                }
              }
              v33 += 2;
              ++v34;
              --v32;
            }
            while (v32);
          }
          v29[1].f32[0] = v29[1].f32[0] + (float)v30;
          *v29 = vaddq_f32(*v29, vcvtq_f32_u32((uint32x4_t)v31));
          v29 = (float32x4_t *)((char *)v29 + 20);
          ++v28;
        }
        while (v23 != (_DWORD)v28);
        ++v19;
        a8 += 360;
        v24 = v20;
      }
      while (v19 != v18);
    }
  }
}

uint64_t sub_10000C064(uint64_t result, int a2, uint64_t a3, char a4, _WORD *a5, _WORD *a6, _WORD *a7)
{
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  __int16 v12;

  v7 = *(unsigned __int16 *)(result + 24);
  if (!*(_BYTE *)(result + 16))
    v7 = 0xFFFF;
  for (; a3; --a3)
  {
    *a5 = ((unsigned __int16)*a5 * a2) >> 5;
    v8 = (unsigned __int16)*a6 * a2;
    *a6 = v8 >> 5;
    v9 = (unsigned __int16)*a5;
    v10 = (v8 >> 4) & 0xFFFE;
    v11 = v10 >= v9;
    v12 = v10 - v9;
    if (!v11)
      v12 = 0;
    if ((a4 & 1) != 0)
    {
      *a5 = v12;
      v12 = v9;
    }
    *a6 = v12;
    if (v7 <= (unsigned __int16)*a7)
    {
      *a7 = 1;
      *a5 = -1;
      *a6 = -1;
    }
    ++a7;
    ++a5;
    ++a6;
    a4 ^= 1u;
  }
  return result;
}

uint64_t sub_10000C0F8(uint64_t result, unsigned __int16 *a2, _WORD *a3)
{
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;

  v3 = result - 1;
  if (result != 1)
  {
    do
    {
      *a3 = *a2;
      v4 = *a2;
      if (v4 == 0xFFFF)
      {
        LOWORD(v6) = -1;
      }
      else
      {
        v5 = a2[1];
        v6 = (v4 + v5 + 1) >> 1;
        if (v5 == 0xFFFF)
          LOWORD(v6) = -1;
      }
      a3[1] = v6;
      ++a2;
      a3 += 2;
      --v3;
    }
    while (v3);
  }
  *a3 = *a2;
  return result;
}

uint64_t sub_10000C158(uint64_t result, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;

  v3 = result - 1;
  if (result != 1)
  {
    do
    {
      v4 = *a2;
      *(_WORD *)a3 = v4;
      v5 = *a2;
      if (v5 == 0xFFFF || (v6 = a2[1], v6 == 0xFFFF))
      {
        *(_DWORD *)(a3 + 2) = -1;
        LOWORD(v8) = -1;
      }
      else
      {
        v7 = v5 + v6 + 1;
        *(_WORD *)(a3 + 4) = v7 >> 1;
        *(_WORD *)(a3 + 2) = (v4 + (v7 >> 1) + 1) >> 1;
        v8 = (a2[1] + (v7 >> 1) + 1) >> 1;
      }
      *(_WORD *)(a3 + 6) = v8;
      ++a2;
      a3 += 8;
      --v3;
    }
    while (v3);
  }
  *(_WORD *)a3 = *a2;
  return result;
}

float sub_10000C1E4(int a1, int16x8_t *a2, int8x16_t *a3, uint64_t a4)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int32x4_t v12;
  int16x8_t v13;
  int32x4_t v14;
  unsigned int v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  uint16x8_t v31;
  int32x4_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  uint16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int32x4_t v41;
  int32x4_t v42;
  int v43;
  int32x4_t v44;
  int32x4_t v45;
  int16x8_t v46;
  int v47;
  int16x8_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int v51;
  int v52;
  uint16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int32x4_t v56;
  int32x4_t v57;
  int v58;
  int32x4_t v59;
  int8x8_t v60;
  int v61;
  uint16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int32x4_t v65;
  int32x4_t v66;
  int v67;
  __int32 v68;
  uint16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int v72;
  int v73;
  int32x4_t v74;
  uint16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int32x4_t v78;
  int32x4_t v79;
  uint16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int32x4_t v83;
  int32x4_t v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;

  if (a1 < 1)
  {
    v21 = 0uLL;
    v92 = 0.0;
    v91 = 0.0;
    v90 = 0.0;
    v89 = 0.0;
    v88 = 0.0;
    v87 = 0.0;
    v86 = 0.0;
    v85 = 0.0;
    v20 = 0uLL;
    v19 = 0uLL;
    v18 = 0uLL;
    v17 = 0uLL;
    v16 = 0uLL;
    v14 = 0uLL;
    v12 = 0uLL;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0uLL;
    v13.i64[0] = -1;
    v13.i64[1] = -1;
    v14 = 0uLL;
    v15 = a1 + 8;
    v16 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    v19 = 0uLL;
    v20 = 0uLL;
    v21 = 0uLL;
    do
    {
      v22 = (int16x8_t)a3[-1];
      v23 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 2uLL);
      v24 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 4uLL);
      v25 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 6uLL);
      v26 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 8uLL);
      v27 = *a2++;
      v28 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 0xAuLL);
      v29 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 0xCuLL);
      v30 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 0xEuLL);
      v31 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v27, v13));
      v32 = (int32x4_t)vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v22, v13)));
      v33 = (int16x8_t)vminq_u16((uint16x8_t)v27, (uint16x8_t)v32);
      v34 = (int16x8_t)vminq_u16((uint16x8_t)v22, (uint16x8_t)v32);
      v35 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v33.i8, *(uint16x4_t *)v33.i8), (uint16x8_t)v33, (uint16x8_t)v33);
      v36 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v34.i8, *(uint16x4_t *)v34.i8), (uint16x8_t)v34, (uint16x8_t)v34);
      v37 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v33.i8, *(uint16x4_t *)v34.i8), (uint16x8_t)v33, (uint16x8_t)v34);
      v32.i16[0] = vaddvq_s16(v33);
      v33.i16[0] = vaddvq_s16(v34);
      v38 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v23, v13)));
      v39 = (int16x8_t)vminq_u16((uint16x8_t)v27, v38);
      v40 = (int16x8_t)vminq_u16((uint16x8_t)v23, v38);
      v32.i32[1] = v33.i32[0];
      v41 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v39.i8, *(uint16x4_t *)v39.i8), (uint16x8_t)v39, (uint16x8_t)v39);
      v42 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v40.i8, *(uint16x4_t *)v40.i8), (uint16x8_t)v40, (uint16x8_t)v40);
      v43 = vaddvq_s32(v37);
      v44 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v39.i8, *(uint16x4_t *)v40.i8), (uint16x8_t)v39, (uint16x8_t)v40);
      v37.i16[0] = vaddvq_s16(v39);
      v40.i16[0] = vaddvq_s16(v40);
      v37.i32[1] = v40.i32[0];
      v39.i32[0] = vaddvq_s32(v35);
      v45 = (int32x4_t)vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v24, v13)));
      v46 = (int16x8_t)vminq_u16((uint16x8_t)v27, (uint16x8_t)v45);
      v47 = vaddvq_s32(v44);
      v48 = (int16x8_t)vminq_u16((uint16x8_t)v24, (uint16x8_t)v45);
      v49 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v48.i8, *(uint16x4_t *)v48.i8), (uint16x8_t)v48, (uint16x8_t)v48);
      v45.i32[0] = vaddvq_s32(v41);
      v50 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v46.i8, *(uint16x4_t *)v48.i8), (uint16x8_t)v46, (uint16x8_t)v48);
      v51 = vaddvq_s32(v50);
      v44.i16[0] = vaddvq_s16(v46);
      v50.i16[0] = vaddvq_s16(v48);
      v52 = v43;
      v44.i32[1] = v50.i32[0];
      v46.i32[0] = vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v46.i8, *(uint16x4_t *)v46.i8), (uint16x8_t)v46, (uint16x8_t)v46));
      *(int8x8_t *)v32.i8 = vand_s8(*(int8x8_t *)v32.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v53 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v25, v13)));
      v54 = (int16x8_t)vminq_u16((uint16x8_t)v27, v53);
      v55 = (int16x8_t)vminq_u16((uint16x8_t)v25, v53);
      v32.i64[1] = __PAIR64__(vaddvq_s32(v36), v39.u32[0]);
      v56 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v54.i8, *(uint16x4_t *)v54.i8), (uint16x8_t)v54, (uint16x8_t)v54);
      v57 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v55.i8, *(uint16x4_t *)v55.i8), (uint16x8_t)v55, (uint16x8_t)v55);
      v58 = v47;
      v59 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v54.i8, *(uint16x4_t *)v55.i8), (uint16x8_t)v54, (uint16x8_t)v55);
      v60.i32[0] = vaddvq_s32(v59);
      v54.i16[0] = vaddvq_s16(v54);
      v59.i16[0] = vaddvq_s16(v55);
      *(int8x8_t *)v55.i8 = vand_s8(*(int8x8_t *)v37.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v54.i32[1] = v59.i32[0];
      v61 = v51;
      v62 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v26, v13)));
      v63 = (int16x8_t)vminq_u16((uint16x8_t)v27, v62);
      v64 = (int16x8_t)vminq_u16((uint16x8_t)v26, v62);
      v65 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v63.i8, *(uint16x4_t *)v63.i8), (uint16x8_t)v63, (uint16x8_t)v63);
      *(int8x8_t *)v26.i8 = vand_s8(*(int8x8_t *)v44.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v66 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v64.i8, *(uint16x4_t *)v64.i8), (uint16x8_t)v64, (uint16x8_t)v64);
      v67 = vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v63.i8, *(uint16x4_t *)v64.i8), (uint16x8_t)v63, (uint16x8_t)v64));
      v68 = v60.i32[0];
      v60.i16[0] = vaddvq_s16(v63);
      v64.i16[0] = vaddvq_s16(v64);
      v60.i32[1] = v64.i32[0];
      *(int8x8_t *)v64.i8 = vand_s8(*(int8x8_t *)v54.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v69 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v28, v13)));
      v70 = (int16x8_t)vminq_u16((uint16x8_t)v27, v69);
      v71 = (int16x8_t)vminq_u16((uint16x8_t)v28, v69);
      v72 = v67;
      v55.i64[1] = __PAIR64__(vaddvq_s32(v42), v45.u32[0]);
      v73 = vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v70.i8, *(uint16x4_t *)v71.i8), (uint16x8_t)v70, (uint16x8_t)v71));
      v74 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v71.i8, *(uint16x4_t *)v71.i8), (uint16x8_t)v71, (uint16x8_t)v71);
      v26.i64[1] = __PAIR64__(vaddvq_s32(v49), v46.u32[0]);
      v46.i16[0] = vaddvq_s16(v70);
      v71.i16[0] = vaddvq_s16(v71);
      v46.i32[1] = v71.i32[0];
      v64.i64[1] = __PAIR64__(vaddvq_s32(v57), vaddvq_s32(v56));
      v4 += v52;
      *(int8x8_t *)v45.i8 = vand_s8(v60, (int8x8_t)0xFFFF0000FFFFLL);
      v45.i64[1] = __PAIR64__(vaddvq_s32(v66), vaddvq_s32(v65));
      v5 += v58;
      v6 += v61;
      *(int8x8_t *)v71.i8 = vand_s8(*(int8x8_t *)v46.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v71.i64[1] = __PAIR64__(vaddvq_s32(v74), vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v70.i8, *(uint16x4_t *)v70.i8), (uint16x8_t)v70, (uint16x8_t)v70)));
      v7 += v68;
      v8 += v72;
      v9 += v73;
      v75 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v29, v13)));
      v76 = (int16x8_t)vminq_u16((uint16x8_t)v27, v75);
      v77 = (int16x8_t)vminq_u16((uint16x8_t)v29, v75);
      v78 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v76.i8, *(uint16x4_t *)v76.i8), (uint16x8_t)v76, (uint16x8_t)v76);
      v79 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v77.i8, *(uint16x4_t *)v77.i8), (uint16x8_t)v77, (uint16x8_t)v77);
      v10 += vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v76.i8, *(uint16x4_t *)v77.i8), (uint16x8_t)v76, (uint16x8_t)v77));
      v76.i16[0] = vaddvq_s16(v76);
      v77.i16[0] = vaddvq_s16(v77);
      v76.i32[1] = v77.i32[0];
      *(int8x8_t *)v76.i8 = vand_s8(*(int8x8_t *)v76.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v12 = vaddq_s32(v32, v12);
      v76.i64[1] = __PAIR64__(vaddvq_s32(v79), vaddvq_s32(v78));
      v14 = vaddq_s32((int32x4_t)v55, v14);
      v80 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v30, v13)));
      v81 = (int16x8_t)vminq_u16((uint16x8_t)v27, v80);
      v16 = vaddq_s32((int32x4_t)v26, v16);
      v82 = (int16x8_t)vminq_u16((uint16x8_t)v30, v80);
      v83 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v81.i8, *(uint16x4_t *)v81.i8), (uint16x8_t)v81, (uint16x8_t)v81);
      v84 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v82.i8, *(uint16x4_t *)v82.i8), (uint16x8_t)v82, (uint16x8_t)v82);
      v17 = vaddq_s32((int32x4_t)v64, v17);
      v11 += vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v81.i8, *(uint16x4_t *)v82.i8), (uint16x8_t)v81, (uint16x8_t)v82));
      v18 = vaddq_s32(v45, v18);
      v81.i16[0] = vaddvq_s16(v81);
      v82.i16[0] = vaddvq_s16(v82);
      v81.i32[1] = v82.i32[0];
      v19 = vaddq_s32((int32x4_t)v71, v19);
      *(int8x8_t *)v81.i8 = vand_s8(*(int8x8_t *)v81.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v81.i64[1] = __PAIR64__(vaddvq_s32(v84), vaddvq_s32(v83));
      v20 = vaddq_s32((int32x4_t)v76, v20);
      v15 -= 8;
      ++a3;
      v21 = vaddq_s32((int32x4_t)v81, v21);
    }
    while (v15 > 8);
    v85 = (float)v4;
    v86 = (float)v5;
    v87 = (float)v6;
    v88 = (float)v7;
    v89 = (float)v8;
    v90 = (float)v9;
    v91 = (float)v10;
    v92 = (float)v11;
  }
  *(float32x2_t *)a4 = vcvt_f32_u32((uint32x2_t)vzip1_s32(*(int32x2_t *)v12.i8, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL)));
  *(float *)(a4 + 8) = (float)v12.u32[1];
  *(float *)(a4 + 12) = v85;
  *(float32x4_t *)(a4 + 16) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v12, v14), v14), 0xCuLL));
  *(float *)(a4 + 32) = v86;
  *(float32x4_t *)(a4 + 36) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v14, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v14, v16), v16), 0xCuLL));
  *(float *)(a4 + 52) = v87;
  *(float32x4_t *)(a4 + 56) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v16, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v16, v17), v17), 0xCuLL));
  *(float *)(a4 + 72) = v88;
  *(float32x4_t *)(a4 + 76) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v17, v18), v18), 0xCuLL));
  *(float *)(a4 + 92) = v89;
  *(float32x4_t *)(a4 + 96) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v18, v19), v19), 0xCuLL));
  *(float *)(a4 + 112) = v90;
  *(float32x4_t *)(a4 + 116) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v19, v20), v20), 0xCuLL));
  *(float *)(a4 + 132) = v91;
  *(float32x4_t *)(a4 + 136) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v20, v21), v21), 0xCuLL));
  *(float *)v21.i32 = (float)v21.u32[3];
  *(float *)(a4 + 152) = v92;
  *(float *)(a4 + 156) = (float)v21.u32[3];
  return *(float *)v21.i32;
}

uint64_t sub_10000C6B0(uint64_t a1, int a2, unint64_t a3, int *a4, _WORD *a5, _WORD *a6, void *a7)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _WORD *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  _WORD *v25;
  _WORD *v26;
  _WORD *v27;
  unsigned __int16 *v28;
  unint64_t v29;
  int v30;
  unsigned __int16 *v31;
  int v32;
  int v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v9 = *(unsigned int *)(a1 + 20);
  v10 = *a4;
  v34 = a4[18];
  v11 = *((_QWORD *)a4 + 12);
  v12 = a4[28];
  v38 = *((_QWORD *)a4 + 15);
  v39 = *((_QWORD *)a4 + 1);
  v36 = *((_QWORD *)a4 + 16);
  v37 = *((_QWORD *)a4 + 2);
  v13 = a4[46];
  v14 = (unsigned __int16 *)*((_QWORD *)a4 + 26);
  v15 = *(unsigned __int16 *)(a1 + 628);
  bzero(a7, *(unsigned int *)(a1 + 487272));
  if (!a3)
    sub_10001E2E0();
  v18 = 20;
  if (!a4[18])
    v18 = 48;
  v19 = a4[v18];
  v20 = a7;
  if ((_DWORD)v9)
  {
    v21 = 0;
    v22 = v34 - a2;
    if (v34 - a2 >= 1)
      v23 = 0;
    else
      v23 = v13;
    v24 = v23 + v22;
    v25 = a7;
    v26 = a6;
    v27 = a5;
LABEL_9:
    v28 = &v14[-2 * v22];
    if (v22 >= 1)
      v28 = (unsigned __int16 *)(v11 + 4 * a2);
    v29 = a3;
    v30 = v24;
    while (1)
    {
      if (v30)
        v31 = v28;
      else
        v31 = v14;
      if (v30)
        v32 = v30;
      else
        v32 = v13;
      *v27 += *v31 >> 6;
      *v26 += v31[1] >> 6;
      if (v15 < *v31 || v15 < v31[1])
        ++*v25;
      v28 = v31 + 2;
      v30 = v32 - 1;
      if (!--v29)
      {
        switch(v10)
        {
          case 0:
          case 2:
            sub_10001D740((uint64_t)v27, v17, 0);
          case 1:
          case 3:
            switch(v12)
            {
              case 0:
              case 2:
                sub_10001D740((uint64_t)v27, v17, 0);
              case 1:
              case 3:
                v11 += 2 * (v37 + v39);
                v14 += v36 + v38;
                ++v27;
                ++v26;
                ++v25;
                if (++v21 == v9)
                  return sub_10000C064(a1 + 608, 0x80 / a3, v9, v19, a5, a6, v20);
                goto LABEL_9;
              case 4:
                sub_10001D764((uint64_t)v27, v17, 0);
              default:
                sub_10001D71C((uint64_t)v27, v17, 0);
            }
          case 4:
            sub_10001D764((uint64_t)v27, v17, 0);
          default:
            sub_10001D71C((uint64_t)v27, v17, 0);
        }
      }
    }
  }
  return sub_10000C064(a1 + 608, 0x80 / a3, v9, v19, a5, a6, v20);
}

uint64_t sub_10000C8C8(uint64_t a1, unsigned int a2, uint64_t a3, _WORD *a4, _WORD *a5)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  _WORD *v15;
  _WORD *v16;
  _WORD *v17;
  uint64_t result;
  unsigned int v19;

  if (!a2)
    sub_10001E308();
  v10 = 0;
  v11 = *(unsigned int *)(a1 + 4);
  v12 = a3 + 112;
  do
  {
    v13 = *(_DWORD *)(a3 + 32);
    v14 = *(unsigned int *)(a1 + 4);
    if ((_DWORD)v14)
    {
      v15 = *(_WORD **)(a3 + 56);
      v16 = a5;
      v17 = a4;
      do
      {
        if (!v13)
        {
          v15 = *(_WORD **)(a3 + 168);
          v13 = *(_DWORD *)(a3 + 144);
        }
        *v17++ += *v15 >> 6;
        *v16++ += v15[2] >> 6;
        v15 += 4;
        --v13;
        --v14;
      }
      while (v14);
    }
    sub_10000B560(a3);
    result = sub_10000B560(v12);
    if (v13)
      sub_10001E330();
    ++v10;
  }
  while (v10 != a2);
  if ((_DWORD)v11)
  {
    v19 = 0x80 / a2;
    do
    {
      *a4 = (v19 * (unsigned __int16)*a4) >> 5;
      ++a4;
      *a5 = (v19 * (unsigned __int16)*a5) >> 5;
      ++a5;
      --v11;
    }
    while (v11);
  }
  return result;
}

uint64_t sub_10000C9D4(uint64_t result, uint64_t a2, uint64_t a3, int *a4, int *a5, uint64_t a6, _DWORD *a7, double a8, __n128 a9)
{
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned __int16 *v16;
  char v17;
  int8x8_t v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  unsigned __int16 v26;
  int v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  unsigned __int16 v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  unsigned __int16 v38;
  uint64_t v39;
  int32x2_t v40;
  signed int v41;
  _DWORD *v42;

  v9 = *a4;
  v10 = *(_DWORD *)(result + 4);
  if (v10 >= 1)
  {
    v11 = 0;
    v12 = *(_DWORD *)(result + 12);
    v13 = a6 - 404;
    v14 = a4[2];
    v15 = v10 + 1;
    v16 = (unsigned __int16 *)*((_QWORD *)a4 + 3);
    v17 = *(_BYTE *)(a2 + 4);
    v18 = (int8x8_t)vdup_n_s32(0x7FF8u);
    do
    {
      v19 = *a5;
      if (v9)
        v19 = v9;
      else
        v14 = a5[2];
      if (!v9)
        v16 = (unsigned __int16 *)*((_QWORD *)a5 + 3);
      v20 = v11 == 0;
      if (v11)
        a2 = v11;
      else
        a2 = v12;
      v21 = v13 + 404 * (v11 == 0);
      v22 = *v16;
      v23 = (__int16)v22 >> 3;
      v24 = v16[3];
      if ((v14 & 1) != 0)
        v25 = -v23;
      else
        v25 = (__int16)v22 >> 3;
      v26 = v25 + v24;
      ++*(_DWORD *)(v21 + 384);
      *(_QWORD *)(v21 + 388) += v26;
      *(_QWORD *)(v21 + 396) += v26 * (unint64_t)v26;
      if ((v22 & 4) == 0)
      {
        v27 = (__int16)v16[1];
        v28 = v27 & 7;
        if ((v22 & 1) != 0 || (((v27 & 7u) < 6) & (v22 >> 1)) != 0)
        {
          v42 = (_DWORD *)(v13 + 404 * v20 + 12 * v14);
          ++v42[84];
          v42[85] += v26;
          v42[86] += v24;
        }
        else
        {
          v29 = v28 > 5;
          v30 = v16[2];
          v31 = (v30 & 0xF) + 1;
          v32 = v30 >> 4;
          v33 = v27 >> 3;
          if (v27 < 0)
            v33 = -v33;
          if (v23 < 0)
            v23 = -v23;
          v34 = v28 - v29;
          v35 = (16 * (v33 & 0xFFFu)) >> v29;
          v36 = (v31 >> 1) * v32;
          v37 = 8 * v23;
          if (((v27 ^ v22) & 0x8000u) == 0)
            v38 = v34 + 7;
          else
            v38 = v34;
          v39 = v21 + 24 * v38;
          a9.n128_u32[0] = v35;
          v40.i32[0] = vshr_n_u32((uint32x2_t)a9.n128_u64[0], 1uLL).u32[0];
          a9.n128_u32[1] = v37;
          v40.i32[1] = vand_s8(*(int8x8_t *)&a9, v18).i32[1];
          v41 = (v40.i32[0] * v36) >> 15 << v17;
          if (v41 <= -32768)
            v41 = -32768;
          if (v41 >= 0x7FFF)
            v41 = 0x7FFF;
          *(_QWORD *)v39 += v31;
          a9 = (__n128)vaddw_u32(*(uint64x2_t *)(v39 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v41), v40), 0xFuLL));
          *(__n128 *)(v39 + 8) = a9;
        }
      }
      v16 += 4;
      v9 = v19 - 1;
      v11 = a2 - 1;
      result = (*a7 + 1);
      *a7 = result;
      v14 ^= a3;
      --v15;
      v13 = v21;
    }
    while (v15 > 1);
  }
  if (v9)
    sub_10001D934(result, a2, a3);
  return result;
}

uint64_t sub_10000CC00(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, double a7, double a8, __n128 a9)
{
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  char v17;
  int v18;
  int8x8_t v19;
  int v20;
  _BOOL4 v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  int v34;
  unsigned __int16 v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  unsigned __int16 v39;
  uint64_t v40;
  int32x2_t v41;
  signed int v42;
  uint64_t v43;
  uint64_t v44;
  _DWORD *v45;
  unsigned __int32 v46;

  v9 = 2 * *(_DWORD *)a3;
  v10 = 2 * *(_DWORD *)(result + 4);
  if (v10 >= 1)
  {
    v11 = 0;
    v12 = 2 * *(_DWORD *)(result + 12);
    v13 = a5 - 404;
    if (*(_DWORD *)a3)
      v14 = a3;
    else
      v14 = a4;
    v15 = *(int *)(v14 + 8);
    v16 = *(unsigned __int16 **)(a3 + 24);
    v17 = *(_BYTE *)(a2 + 4);
    v18 = v10 + 2;
    v19 = (int8x8_t)vdup_n_s32(0x7FF8u);
    do
    {
      v20 = 2 * *(_DWORD *)a4;
      if (v9)
        v20 = v9;
      else
        v16 = *(unsigned __int16 **)(a4 + 24);
      v21 = v11 == 0;
      if (v11)
        v22 = v11;
      else
        v22 = v12;
      result = v13 + 404 * (v11 == 0);
      v23 = v16[3];
      v24 = v16[7];
      v25 = v24 - ((__int16)v16[4] >> 3);
      v26 = *v16;
      ++*(_DWORD *)(result + 384);
      *(_QWORD *)(result + 388) += (unsigned __int16)v25;
      *(_QWORD *)(result + 396) += (unsigned __int16)v25 * (unint64_t)(unsigned __int16)v25;
      if ((v26 & 4) == 0)
      {
        v27 = (__int16)v16[1];
        v28 = v27 & 7;
        if ((v26 & 1) != 0 || (((v27 & 7u) < 6) & (v26 >> 1)) != 0)
        {
          v43 = v13 + 404 * v21 + 336;
          v44 = v43 + 12 * (int)v15;
          ++*(_DWORD *)v44;
          a9.n128_u64[0] = (unint64_t)vand_s8((int8x8_t)__PAIR64__(v23, v25), (int8x8_t)0xFFFF0000FFFFLL);
          *(int32x2_t *)(v44 + 4) = vadd_s32(*(int32x2_t *)(v44 + 4), (int32x2_t)a9.n128_u64[0]);
          v45 = (_DWORD *)(v43 + 12 * (v15 + 1));
          v46 = v45[1] + a9.n128_u32[0];
          ++*v45;
          v45[1] = v46;
          v45[2] += v24;
        }
        else
        {
          v29 = v28 > 5;
          v30 = v16[2];
          v31 = (v30 & 0xF) + 1;
          v32 = v30 >> 4;
          v33 = (__int16)v26 >> 3;
          v34 = v27 >> 3;
          if (v27 < 0)
            v34 = -v34;
          if (v33 < 0)
            v33 = -v33;
          v35 = v28 - v29;
          v36 = (16 * (v34 & 0xFFFu)) >> v29;
          v37 = (v31 >> 1) * v32;
          v38 = 8 * v33;
          if (((v27 ^ v26) & 0x8000u) == 0)
            v39 = v35 + 7;
          else
            v39 = v35;
          v40 = result + 24 * v39;
          a9.n128_u32[0] = v36;
          v41.i32[0] = vshr_n_u32((uint32x2_t)a9.n128_u64[0], 1uLL).u32[0];
          a9.n128_u32[1] = v38;
          v41.i32[1] = vand_s8(*(int8x8_t *)&a9, v19).i32[1];
          v42 = (v41.i32[0] * v37) >> 15 << v17;
          if (v42 <= -32768)
            v42 = -32768;
          if (v42 >= 0x7FFF)
            v42 = 0x7FFF;
          *(_QWORD *)v40 += v31;
          a9 = (__n128)vaddw_u32(*(uint64x2_t *)(v40 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v42), v41), 0xFuLL));
          *(__n128 *)(v40 + 8) = a9;
        }
      }
      v16 += 8;
      v9 = v20 - 2;
      v11 = v22 - 2;
      ++*a6;
      v18 -= 2;
      v13 = result;
    }
    while (v18 > 2);
  }
  if (v9)
    sub_10001D958();
  return result;
}

int16x8_t *sub_10000CE68(int16x8_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, int32x4_t a8, int32x4_t a9)
{
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  __int32 v17;
  const __int16 *v18;
  uint64_t v19;
  int16x8_t v20;
  __int32 v21;
  _OWORD *v22;
  int8x16_t v23;
  int16x8_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  uint16x8_t v29;
  const __int16 *v30;
  int v31;
  int v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  __int16 *v36;
  __int16 *v37;
  __int16 *v38;
  __int16 *v39;
  int v40;
  uint64_t v41;
  int8x16_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int8x16_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int8x16_t v52;
  int8x16_t v53;
  int8x16_t v54;
  _OWORD *v55;
  unsigned __int16 *v56;
  _BOOL4 v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _DWORD *v66;
  int16x8_t v67[2];
  _OWORD v68[2];
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8x4_t v72;

  v9 = *(_DWORD *)a4;
  if (*(_DWORD *)a4)
    v10 = a4;
  else
    v10 = a5;
  v11 = *(_DWORD *)(v10 + 8);
  v12 = result->i32[1];
  if (a3)
  {
    a8.i32[0] = 0;
    a9.i32[0] = v11 & 1;
    v13 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(a9, a8), 0);
    v14.i64[0] = 0xFFFF0000FFFFLL;
    v14.i64[1] = 0xFFFF0000FFFFLL;
    v15.i64[0] = 0xFFFF0000FFFF0000;
    v15.i64[1] = 0xFFFF0000FFFF0000;
    v16 = vbslq_s8(v13, v15, v14);
  }
  else
  {
    v16 = (int8x16_t)vdupq_n_s16(-(v11 & 1));
  }
  if (v12 < 1)
    goto LABEL_35;
  v17 = 0;
  v18 = *(const __int16 **)(a4 + 24);
  v19 = a6 - 404;
  v20 = vdupq_n_s16(*(char *)(a2 + 4));
  v21 = result->i32[3];
  v22 = v68;
  v23.i64[0] = 0x1000100010001;
  v23.i64[1] = 0x1000100010001;
  v24.i64[0] = -1;
  v24.i64[1] = -1;
  v25.i64[0] = 0x2000200020002;
  v25.i64[1] = 0x2000200020002;
  v26.i64[0] = 0x4000400040004;
  v26.i64[1] = 0x4000400040004;
  v27.i64[0] = 0x7000700070007;
  v27.i64[1] = 0x7000700070007;
  v28.i64[0] = 0xF000F000F000FLL;
  v28.i64[1] = 0xF000F000F000FLL;
  v29.i64[0] = 0x5000500050005;
  v29.i64[1] = 0x5000500050005;
  result = &v70;
LABEL_9:
  v30 = *(const __int16 **)(a5 + 24);
  v31 = *(_DWORD *)a5;
  if (!v9)
  {
    v9 = *(_DWORD *)a5;
    v18 = *(const __int16 **)(a5 + 24);
  }
  if (v9 > 7)
  {
    v32 = 8;
LABEL_14:
    v9 -= v32;
    v72 = vld4q_s16(v18);
    v18 += 32;
    goto LABEL_25;
  }
  v32 = v12;
  if (v9 == v12)
    goto LABEL_14;
  if (v9 < 1)
    sub_10001D9A8();
  v33 = 0;
  v34 = 2 * v9;
  do
  {
    v67[0].i16[v33 / 2] = *v18;
    v71.i16[v33 / 2] = v18[1];
    v70.i16[v33 / 2] = v18[2];
    v69.i16[v33 / 2] = v18[3];
    v33 += 2;
    v18 += 4;
  }
  while (v34 != v33);
  if (v12 >= 8)
    v35 = 8;
  else
    v35 = v12;
  if (v9 < v35)
  {
    v36 = &v69.i16[(unint64_t)v34 / 2];
    v37 = &v70.i16[(unint64_t)v34 / 2];
    v38 = &v71.i16[(unint64_t)v34 / 2];
    v39 = &v67[0].i16[(unint64_t)v34 / 2];
    v40 = v9;
    do
    {
      *v39++ = *v30;
      *v38++ = v30[1];
      *v37++ = v30[2];
      *v36++ = v30[3];
      v30 += 4;
      ++v40;
    }
    while (v35 > v40);
  }
  v72.val[0] = v67[0];
  v72.val[2] = v70;
  v72.val[1] = v71;
  v72.val[3] = v69;
  v9 += v31 - v35;
  v18 = v30;
LABEL_25:
  v41 = 0;
  v42 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v72.val[0], v26));
  v43 = (int16x8_t)vandq_s8((int8x16_t)v72.val[1], v27);
  v44 = vshrq_n_s16(v72.val[0], 3uLL);
  v45 = (int8x16_t)vaddq_s16(v72.val[3], (int16x8_t)vbslq_s8(v16, (int8x16_t)vnegq_s16(v44), (int8x16_t)v44));
  v46 = (int8x16_t)vcgtq_u16((uint16x8_t)v43, v29);
  v47 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v72.val[1], 3uLL)), 4uLL);
  v48 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v72.val[2], v28), (int16x8_t)vbicq_s8(v23, (int8x16_t)v72.val[0])), vorrq_s8(v46, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v72.val[0], v25))));
  v49 = vaddq_s16((int16x8_t)vbslq_s8(v46, (int8x16_t)vaddq_s16(v43, v24), (int8x16_t)v43), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v72.val[0]), (int8x16_t)vcgtq_s16(v72.val[1], v24)), v27));
  v50 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v46, (int8x16_t)vshrq_n_u16((uint16x8_t)v47, 1uLL), v47), 1uLL);
  v51 = vqshlq_s16(vqdmulhq_s16(v50, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v48, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v72.val[2], 4uLL))), v20);
  v52 = (int8x16_t)vqdmulhq_s16(v51, v50);
  v53 = (int8x16_t)vqdmulhq_s16(v51, (int16x8_t)vshrq_n_u16(vqshlq_n_u16((uint16x8_t)vabsq_s16(v44), 4uLL), 1uLL));
  v54 = (int8x16_t)vceqzq_s16(v48);
  v67[0] = v49;
  v67[1] = (int16x8_t)vornq_s8(vandq_s8((int8x16_t)v48, v42), v42);
  v68[0] = vbslq_s8(v54, v45, v52);
  v68[1] = vbslq_s8(v54, (int8x16_t)v72.val[3], v53);
  v71 = (int16x8_t)v45;
  v55 = v22;
  v56 = (unsigned __int16 *)v22;
  while (1)
  {
    v57 = v17 == 0;
    if (!v17)
      v17 = v21;
    v58 = v19 + 404 * v57;
    v59 = *(v56 - 16);
    v60 = *(v56 - 8);
    v61 = *v56;
    v62 = v56[8];
    ++*(_DWORD *)(v58 + 384);
    v63 = v71.u16[v41];
    *(_QWORD *)(v58 + 388) += v63;
    *(_QWORD *)(v58 + 396) += v63 * (unint64_t)v63;
    if ((_DWORD)v60)
    {
      if ((_DWORD)v60 != 0xFFFF)
      {
        v64 = (_QWORD *)(v58 + 24 * v59);
        v65 = v64[1] + v61;
        *v64 += v60;
        v64[1] = v65;
        v64[2] += v62;
      }
    }
    else
    {
      v66 = (_DWORD *)(v19 + 404 * v57 + 12 * v11);
      ++v66[84];
      v66[85] += v61;
      v66[86] += v62;
    }
    ++*a7;
    if (v12 - 1 == (_DWORD)v41)
      break;
    ++v56;
    v11 ^= a3;
    --v17;
    ++v41;
    v19 += 404 * v57;
    if (v41 == 8)
    {
      v12 -= 8;
      v19 = v58;
      v22 = v55;
      if (v12 + 1 > 1)
        goto LABEL_9;
      break;
    }
  }
LABEL_35:
  if (v9)
    sub_10001D980();
  return result;
}

uint64_t sub_10000D248(uint64_t result, uint64_t a2, int *a3, int *a4, uint64_t a5, _DWORD *a6)
{
  int v6;
  int v7;
  int16x8_t v8;
  int v9;
  int *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  const __int16 *v14;
  int v15;
  int8x16_t v16;
  int16x8_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  uint16x8_t v22;
  const __int16 *v23;
  int v24;
  int v25;
  int v26;
  const __int16 *v27;
  int16x8_t v28;
  int16x8_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int16x8_t v32;
  int8x16_t v33;
  unsigned int v34;
  uint64_t v35;
  int8x16_t *v36;
  int16x8_t *v37;
  int8x16_t *v38;
  int8x16_t *v39;
  int16x8_t *v40;
  __int16 *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;
  __int16 v45;
  unint64_t v46;
  int8x16_t v47;
  int16x8_t v48;
  int8x16_t v49;
  int8x16_t v50;
  uint16x8_t v51;
  int16x8_t v52;
  int8x16_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int8x16_t v57;
  _BOOL4 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  _DWORD *v69;
  int v70;
  _DWORD *v71;
  _OWORD v72[4];
  int16x8_t v73;
  int8x16_t v74;
  int8x16_t v75;
  int8x16_t v76;
  int16x8_t v77;
  int16x8x4_t v78;
  int16x8x4_t v79;

  v6 = 2 * *(_DWORD *)(result + 4);
  if (v6 < 1)
    return result;
  v7 = 0;
  v8 = vdupq_n_s16(*(char *)(a2 + 4));
  v9 = 2 * *(_DWORD *)(result + 12);
  if (*a3)
    v10 = a3;
  else
    v10 = a4;
  v11 = v10[2];
  v12 = 2 * *a3;
  v13 = a5 - 404;
  v14 = (const __int16 *)*((_QWORD *)a3 + 3);
  v15 = v6 - 2;
  v16.i64[0] = 0x1000100010001;
  v16.i64[1] = 0x1000100010001;
  v17.i64[0] = -1;
  v17.i64[1] = -1;
  v18.i64[0] = 0x2000200020002;
  v18.i64[1] = 0x2000200020002;
  v19.i64[0] = 0x4000400040004;
  v19.i64[1] = 0x4000400040004;
  v20.i64[0] = 0x7000700070007;
  v20.i64[1] = 0x7000700070007;
  v21.i64[0] = 0xF000F000F000FLL;
  v21.i64[1] = 0xF000F000F000FLL;
  result = 24;
  v22.i64[0] = 0x5000500050005;
  v22.i64[1] = 0x5000500050005;
LABEL_6:
  v23 = (const __int16 *)*((_QWORD *)a4 + 3);
  v24 = *a4;
  v25 = 2 * *a4;
  if (v12)
    v25 = v12;
  else
    v14 = (const __int16 *)*((_QWORD *)a4 + 3);
  if (v25 > 15)
  {
    v26 = 16;
LABEL_12:
    v27 = v14;
    v78 = vld4q_s16(v27);
    v27 += 32;
    v79 = vld4q_s16(v27);
    v28 = vuzp1q_s16(v78.val[0], v79.val[0]);
    v29 = vuzp1q_s16(v78.val[1], v79.val[1]);
    v30 = (int8x16_t)vuzp1q_s16(v78.val[2], v79.val[2]);
    v31 = (int8x16_t)vuzp1q_s16(v78.val[3], v79.val[3]);
    v32 = vuzp2q_s16(v78.val[3], v79.val[3]);
    v33 = (int8x16_t)vsubq_s16(v32, vshrq_n_s16(vuzp2q_s16(v78.val[0], v79.val[0]), 3uLL));
    v14 += 64;
    v12 = v25 - v26;
    goto LABEL_27;
  }
  v26 = v6;
  if (v25 == v6)
    goto LABEL_12;
  if (v25 <= 0)
    sub_10001D9D0();
  v34 = v25 >> 1;
  if (v25 != 1)
  {
    if (v34 <= 1)
      v35 = 1;
    else
      v35 = v34;
    v36 = &v74;
    v37 = &v73;
    v38 = &v75;
    v39 = &v76;
    v40 = &v77;
    v41 = (__int16 *)v72;
    do
    {
      *v41++ = *v14;
      v40->i16[0] = v14[1];
      v40 = (int16x8_t *)((char *)v40 + 2);
      v39->i16[0] = v14[2];
      v39 = (int8x16_t *)((char *)v39 + 2);
      v38->i16[0] = v14[3];
      v38 = (int8x16_t *)((char *)v38 + 2);
      v42 = v14[7];
      v37->i16[0] = v42;
      v37 = (int16x8_t *)((char *)v37 + 2);
      v36->i16[0] = v42 + (v14[4] >> 3);
      v36 = (int8x16_t *)((char *)v36 + 2);
      v14 += 8;
      --v35;
    }
    while (v35);
  }
  if (v6 <= 15)
    v43 = v6 >> 1;
  else
    v43 = 8;
  if (v34 < v43)
  {
    v44 = 0;
    do
    {
      *((_WORD *)v72 + v34 + v44) = *v23;
      v77.i16[v34 + v44] = v23[1];
      v76.i16[v34 + v44] = v23[2];
      v75.i16[v34 + v44] = v23[3];
      v45 = v23[7];
      v73.i16[v34 + v44] = v45;
      v74.i16[v34 + v44] = v45 + (v23[4] >> 3);
      v23 += 8;
      ++v44;
    }
    while (v43 - v34 != v44);
  }
  v28 = (int16x8_t)v72[0];
  v29 = v77;
  v31 = v75;
  v30 = v76;
  v32 = v73;
  v33 = v74;
  v12 = 2 * (v24 - v43 + v34);
  v14 = v23;
LABEL_27:
  v46 = 0;
  v47 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v28, v19));
  v48 = (int16x8_t)vandq_s8((int8x16_t)v29, v20);
  v49 = (int8x16_t)vcgtq_u16((uint16x8_t)v48, v22);
  v50 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v29, 3uLL)), 4uLL);
  v51 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v28, 3uLL)), 4uLL);
  v52 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8(v30, v21), (int16x8_t)vbicq_s8(v16, (int8x16_t)v28)), vorrq_s8(v49, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v28, v18))));
  v53 = (int8x16_t)vaddq_s16((int16x8_t)vbslq_s8(v49, (int8x16_t)vaddq_s16(v48, v17), (int8x16_t)v48), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v28), (int8x16_t)vcgtq_s16(v29, v17)), v20));
  v54 = vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v52, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v30, 4uLL));
  v55 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v49, (int8x16_t)vshrq_n_u16((uint16x8_t)v50, 1uLL), v50), 1uLL);
  v56 = vqshlq_s16(vqdmulhq_s16(v55, v54), v8);
  v57 = (int8x16_t)vceqzq_s16(v52);
  v77 = (int16x8_t)v33;
  v72[0] = vornq_s8(vandq_s8((int8x16_t)v52, v47), v47);
  v72[1] = vbslq_s8(v57, v33, (int8x16_t)vqdmulhq_s16(v56, v55));
  v72[2] = vbslq_s8(v57, v31, (int8x16_t)vqdmulhq_s16(v56, (int16x8_t)vshrq_n_u16(v51, 1uLL)));
  v72[3] = vbslq_s8(v57, (int8x16_t)v32, v53);
  v6 -= 16;
  while (1)
  {
    v58 = v7 == 0;
    if (!v7)
      v7 = v9;
    v59 = v13 + 404 * v58;
    v60 = *(unsigned __int16 *)((char *)v72 + v46);
    ++*(_DWORD *)(v59 + 384);
    v61 = v77.u16[v46 / 2];
    *(_QWORD *)(v59 + 388) += v61;
    *(_QWORD *)(v59 + 396) += v61 * (unint64_t)v61;
    if ((_DWORD)v60)
    {
      if ((_DWORD)v60 != 0xFFFF)
      {
        v62 = *(unsigned __int16 *)((char *)&v72[2] + v46);
        v63 = (_QWORD *)(v59 + 24 * *(unsigned __int16 *)((char *)&v72[3] + v46));
        v64 = v63[1] + *(unsigned __int16 *)((char *)&v72[1] + v46);
        *v63 += v60;
        v63[1] = v64;
        v63[2] += v62;
      }
    }
    else
    {
      v65 = *(unsigned __int16 *)((char *)&v72[1] + v46);
      v66 = *(unsigned __int16 *)((char *)&v72[2] + v46);
      v67 = *(unsigned __int16 *)((char *)&v72[3] + v46);
      v68 = v13 + 404 * v58 + 336;
      v69 = (_DWORD *)(v68 + 12 * (int)v11);
      v70 = v69[1] + v65;
      ++*v69;
      v69[1] = v70;
      v69[2] += v66;
      v71 = (_DWORD *)(v68 + 12 * (v11 + 1));
      LODWORD(v69) = v71[1];
      ++*v71;
      v71[1] = (_DWORD)v69 + v65;
      v71[2] += v67;
    }
    ++*a6;
    if (v15 == (_DWORD)v46)
      return result;
    v7 -= 2;
    v46 += 2;
    v13 = v59;
    if (v46 == 16)
    {
      v15 -= 16;
      v13 = v59;
      if (v6 > 0)
        goto LABEL_6;
      return result;
    }
  }
}

uint64_t sub_10000D698(unsigned int *a1, unint64_t a2, int *a3, _WORD *a4, _WORD *a5, _WORD *a6)
{
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  __int16 *v19;
  int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  _WORD *v24;
  _WORD *v25;
  _WORD *v26;
  int v27;
  __int16 *v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int32x2_t v39;
  uint64_t v40;

  v12 = a1[4];
  v13 = a1[157];
  bzero(a6, a1[121818]);
  if (!a2)
    sub_10001E358();
  v14 = 0;
  v15 = a3[4];
  v16 = 6;
  if (!v15)
    v16 = 26;
  v17 = a3[v16];
  v18 = *a3;
  v19 = (__int16 *)*((_QWORD *)a3 + 5);
  v20 = a3[6];
  v21 = (unsigned __int16)(v13 >> 4);
  while (2)
  {
    v22 = v15;
    v23 = v12;
    v24 = a6;
    v25 = a5;
    v26 = a4;
    LOBYTE(v27) = v20;
    v28 = v19;
    if ((_DWORD)v12)
    {
      do
      {
        if (!v22)
        {
          v28 = (__int16 *)*((_QWORD *)a3 + 15);
          v22 = a3[24];
          v27 = a3[26];
        }
        v29 = *v28 >> 3;
        v30 = (unsigned __int16)v28[3];
        if ((v27 & 1) != 0)
          v29 = -v29;
        v31 = (unsigned __int16)(v29 + v30);
        *v26 += (unsigned __int16)v28[3] >> 2;
        *v25 += v31 >> 2;
        if (v21 < v30 || v21 < v31)
          ++*v24;
        ++v24;
        v28 += 4;
        ++v26;
        ++v25;
        --v22;
        LOBYTE(v27) = v27 ^ 1;
        --v23;
      }
      while (v23);
    }
    switch(v18)
    {
      case 0:
        v19 += *((_QWORD *)a3 + 1);
        *((_QWORD *)a3 + 5) = v19;
        v20 ^= 1u;
        ++a3[5];
        a3[6] = v20;
        goto LABEL_24;
      case 1:
      case 3:
      case 4:
        v33 = *((_QWORD *)a3 + 4);
        if (v33)
        {
          *((_QWORD *)a3 + 4) = v33 - 1;
          v34 = *((_QWORD *)a3 + 1);
        }
        else
        {
          v34 = 2 * *((_QWORD *)a3 + 1);
        }
        v19 += v34;
        *((_QWORD *)a3 + 5) = v19;
        v35 = a3[5] + 2;
        goto LABEL_23;
      case 2:
        v19 += *((_QWORD *)a3 + 1);
        *((_QWORD *)a3 + 5) = v19;
        v35 = a3[5] + 1;
LABEL_23:
        a3[5] = v35;
LABEL_24:
        switch(a3[20])
        {
          case 0:
            *((_QWORD *)a3 + 15) += 2 * *((_QWORD *)a3 + 11);
            v39 = *(int32x2_t *)(a3 + 25);
            LODWORD(v40) = vadd_s32(v39, (int32x2_t)0x100000001).u32[0];
            HIDWORD(v40) = veor_s8(*(int8x8_t *)&v39, (int8x8_t)0x100000001).i32[1];
            *(_QWORD *)(a3 + 25) = v40;
            goto LABEL_32;
          case 1:
          case 3:
          case 4:
            v36 = *((_QWORD *)a3 + 14);
            if (v36)
            {
              *((_QWORD *)a3 + 14) = v36 - 1;
              v37 = *((_QWORD *)a3 + 11);
            }
            else
            {
              v37 = 2 * *((_QWORD *)a3 + 11);
            }
            *((_QWORD *)a3 + 15) += 2 * v37;
            v38 = a3[25] + 2;
            goto LABEL_31;
          case 2:
            *((_QWORD *)a3 + 15) += 2 * *((_QWORD *)a3 + 11);
            v38 = a3[25] + 1;
LABEL_31:
            a3[25] = v38;
LABEL_32:
            if (v22)
              sub_10001E380();
            if (++v14 != a2)
              continue;
            return sub_10000C064((uint64_t)(a1 + 152), 0x80 / a2, v12, v17, a4, a5, a6);
          default:
            sub_10001D910((uint64_t)v24, (uint64_t)v25, (uint64_t)v26);
        }
      default:
        sub_10001D910((uint64_t)v24, (uint64_t)v25, (uint64_t)v26);
    }
  }
}

uint64_t sub_10000D934(unsigned int *a1, int a2, unint64_t a3, int *a4, _WORD *a5, _WORD *a6, _WORD *a7)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  __int16 *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  _WORD *v24;
  _WORD *v25;
  char v26;
  _WORD *v27;
  __int16 *v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v38;
  int v39;
  uint64_t v45;
  uint64_t v46;

  v9 = a1[5];
  v10 = *a4;
  v39 = a4[12];
  v11 = *((_QWORD *)a4 + 8);
  v12 = *((_QWORD *)a4 + 9);
  v13 = a4[20];
  v45 = *((_QWORD *)a4 + 11);
  v46 = *((_QWORD *)a4 + 1);
  v14 = a4[32];
  v16 = *((_QWORD *)a4 + 18);
  v15 = (__int16 *)*((_QWORD *)a4 + 19);
  v38 = a1[157];
  bzero(a7, a1[121818]);
  if (!a3)
    sub_10001E3A8();
  v17 = 14;
  if (!a4[12])
    v17 = 34;
  v18 = a4[v17];
  if ((_DWORD)v9)
  {
    v19 = 0;
    v20 = v39 - a2;
    if (v39 - a2 >= 1)
      v21 = 0;
    else
      v21 = v14;
    v22 = v21 + v20;
    v23 = (unsigned __int16)(v38 >> 4);
    v24 = a5;
    v25 = a6;
    v26 = v18;
    v27 = a7;
    do
    {
      if (v20 >= 1)
        v28 = (__int16 *)(v12 + 8 * a2);
      else
        v28 = &v15[-4 * v20];
      v29 = a3;
      LODWORD(v30) = v22;
      do
      {
        if (!(_DWORD)v30)
        {
          v28 = v15;
          LODWORD(v30) = v14;
        }
        v31 = *v28 >> 3;
        v32 = (unsigned __int16)v28[3];
        if ((v26 & 1) != 0)
          v31 = -v31;
        *v24 += (unsigned __int16)v28[3] >> 2;
        *v25 += (unsigned __int16)(v31 + v32) >> 2;
        if (v23 < v32 || v23 < (unsigned __int16)(v31 + v32))
          ++*v27;
        v28 += 4;
        v30 = (v30 - 1);
        --v29;
      }
      while (v29);
      v34 = (v10 - 3);
      if (v34 >= 2 && v10 != 1)
      {
        if (v10 == 2 || !v10)
          sub_10001D8EC(v34, v30, (uint64_t)v28);
        sub_10001D8C8(v34, v30, (uint64_t)v28);
      }
      v35 = (v13 - 3);
      if (v35 >= 2 && v13 != 1)
      {
        if (v13 == 2 || !v13)
          sub_10001D8EC(v35, v30, (uint64_t)v28);
        sub_10001D8C8(v35, v30, (uint64_t)v28);
      }
      v12 += 2 * (v46 << (v11 != 0));
      if (v11)
        --v11;
      else
        v11 = 0;
      v36 = v16 - 1;
      if (!v16)
        v36 = 0;
      v15 += v45 << (v16 != 0);
      ++v24;
      ++v25;
      ++v27;
      v26 ^= 1u;
      ++v19;
      v16 = v36;
    }
    while (v19 != v9);
  }
  return sub_10000C064((uint64_t)(a1 + 152), 0x80 / a3, v9, v18, a5, a6, a7);
}

_WORD *sub_10000DB74(uint64_t a1, uint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  _WORD *v12;
  _WORD *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int32x2_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int32x2_t v23;
  uint64_t v24;
  unsigned int v25;

  if (!(_DWORD)a2)
    sub_10001E3D0();
  v5 = 0;
  v6 = *(unsigned int *)(a1 + 4);
  v7 = *(_DWORD *)(a3 + 16);
  v8 = *(_DWORD *)a3;
  v9 = *(_QWORD *)(a3 + 40);
  while (2)
  {
    v10 = v7;
    v11 = v6;
    v12 = a5;
    result = a4;
    v14 = v9;
    if ((_DWORD)v6)
    {
      do
      {
        if (!v10)
        {
          v14 = *(_QWORD *)(a3 + 120);
          v10 = *(_DWORD *)(a3 + 96);
        }
        *result++ += *(_WORD *)(v14 + 6) >> 2;
        *v12++ += *(_WORD *)(v14 + 14) >> 2;
        v14 += 16;
        --v10;
        --v11;
      }
      while (v11);
    }
    switch(v8)
    {
      case 0:
        v9 += 2 * *(_QWORD *)(a3 + 8);
        *(_QWORD *)(a3 + 40) = v9;
        v18 = *(int32x2_t *)(a3 + 20);
        LODWORD(v19) = vadd_s32(v18, (int32x2_t)0x100000001).u32[0];
        HIDWORD(v19) = veor_s8(*(int8x8_t *)&v18, (int8x8_t)0x100000001).i32[1];
        *(_QWORD *)(a3 + 20) = v19;
        goto LABEL_15;
      case 1:
      case 3:
      case 4:
        v15 = *(_QWORD *)(a3 + 32);
        if (v15)
        {
          *(_QWORD *)(a3 + 32) = v15 - 1;
          v16 = *(_QWORD *)(a3 + 8);
        }
        else
        {
          v16 = 2 * *(_QWORD *)(a3 + 8);
        }
        v9 += 2 * v16;
        *(_QWORD *)(a3 + 40) = v9;
        v17 = *(_DWORD *)(a3 + 20) + 2;
        goto LABEL_14;
      case 2:
        v9 += 2 * *(_QWORD *)(a3 + 8);
        *(_QWORD *)(a3 + 40) = v9;
        v17 = *(_DWORD *)(a3 + 20) + 1;
LABEL_14:
        *(_DWORD *)(a3 + 20) = v17;
LABEL_15:
        switch(*(_DWORD *)(a3 + 80))
        {
          case 0:
            *(_QWORD *)(a3 + 120) += 2 * *(_QWORD *)(a3 + 88);
            v23 = *(int32x2_t *)(a3 + 100);
            LODWORD(v24) = vadd_s32(v23, (int32x2_t)0x100000001).u32[0];
            HIDWORD(v24) = veor_s8(*(int8x8_t *)&v23, (int8x8_t)0x100000001).i32[1];
            *(_QWORD *)(a3 + 100) = v24;
            goto LABEL_23;
          case 1:
          case 3:
          case 4:
            v20 = *(_QWORD *)(a3 + 112);
            if (v20)
            {
              *(_QWORD *)(a3 + 112) = v20 - 1;
              v21 = *(_QWORD *)(a3 + 88);
            }
            else
            {
              v21 = 2 * *(_QWORD *)(a3 + 88);
            }
            *(_QWORD *)(a3 + 120) += 2 * v21;
            v22 = *(_DWORD *)(a3 + 100) + 2;
            goto LABEL_22;
          case 2:
            *(_QWORD *)(a3 + 120) += 2 * *(_QWORD *)(a3 + 88);
            v22 = *(_DWORD *)(a3 + 100) + 1;
LABEL_22:
            *(_DWORD *)(a3 + 100) = v22;
LABEL_23:
            if (v10)
              sub_10001E3F8();
            if (++v5 != (_DWORD)a2)
              continue;
            if ((_DWORD)v6)
            {
              v25 = 0x80 / a2;
              do
              {
                *a4 = (v25 * (unsigned __int16)*a4) >> 5;
                ++a4;
                *a5 = (v25 * (unsigned __int16)*a5) >> 5;
                ++a5;
                --v6;
              }
              while (v6);
            }
            return result;
          default:
            sub_10001D910((uint64_t)result, a2, a3);
        }
      default:
        sub_10001D910((uint64_t)result, a2, a3);
    }
  }
}

uint64_t sub_10000DD78(uint64_t result, uint64_t a2, float *a3, float *a4)
{
  uint64_t v4;
  float v5;
  float *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  float v18;
  float v19;
  int v20;
  float v21;
  char v22;
  float v24;
  unint64_t v25;
  unint64_t v26;
  float *v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  float v31;
  float v32;
  _BOOL4 v33;
  float v34;
  float v35;
  BOOL v36;
  float v37;
  float v38;
  uint64_t v39;
  float v40;
  uint64_t v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49[17];

  v4 = 0;
  v5 = (float)*(unsigned int *)(a2 + 340);
  v6 = (float *)(a2 + 8);
  do
  {
    v7 = *(v6 - 2);
    v8 = (float)(*(v6 - 1) * v5) - (float)(v7 * v7);
    v9 = 0.0;
    if (v8 >= 0.0)
    {
      v10 = *v6;
      v11 = (float)(v6[2] * v5) - (float)(v10 * v10);
      if (v11 >= 0.0)
      {
        v12 = (float)((float)(v10 * (float)-v7) + (float)(v6[1] * v5));
        v13 = sqrt(v8) * sqrt(v11);
        if (v13 == 0.0)
          v13 = 1.0;
        v9 = v12 / v13;
      }
    }
    v49[v4++] = v9;
    v6 += 5;
  }
  while (v4 != 17);
  v14 = *(_DWORD *)(result + 332) - *(_DWORD *)(result + 328);
  v15 = v14 + 2;
  if (v14 >= -1)
    v15 = v14 + 1;
  v16 = v15 >> 1;
  if (v14 < 0)
  {
    v19 = -1.0;
    v18 = 1.0;
    v20 = v16;
  }
  else
  {
    v17 = 0;
    v18 = 1.0;
    v19 = -1.0;
    v20 = v16;
    do
    {
      v21 = v49[v17];
      if (v19 < v21)
      {
        v20 = v17;
        v19 = v49[v17];
      }
      if (v18 > v21)
        v18 = v49[v17];
      ++v17;
    }
    while (v14 + 1 != v17);
  }
  v22 = *(_BYTE *)(result + 352);
  if (!v22)
    goto LABEL_46;
  if (v20 > 0xF || ((1 << v20) & 0x8101) == 0)
  {
    v24 = *(float *)(result + 356);
    if (v20 >= 8)
      v25 = 7;
    else
      v25 = 14;
    if (v20 >= 8)
      v26 = 1;
    else
      v26 = 9;
    v27 = &v49[v26];
    v28 = v25 >= v26;
    v29 = v25 - v26;
    if (!v28)
      v29 = 0;
    v30 = v29 + 1;
    v31 = -1.0;
    do
    {
      v32 = *v27;
      if (v31 < *v27 && *(v27 - 1) < (float)(v24 + v32) && v27[1] < (float)(v24 + v32))
        v31 = *v27;
      ++v27;
      --v30;
    }
    while (v30);
    v22 = (float)(v19 - v31) < *(float *)(result + 360);
  }
  else
  {
    v22 = 0;
  }
  v33 = 0;
  if (v20 < 2 || v20 >= v14 - 1)
    goto LABEL_47;
  v34 = v49[v20];
  v35 = *(float *)(result + 364);
  if (v34 >= (float)(v35 + v49[v20 - 1]) || v34 >= (float)(v35 + v49[v20 + 1]))
  {
LABEL_46:
    v33 = 0;
    goto LABEL_47;
  }
  if (v34 < (float)(v35 + v49[v20 - 2]))
  {
LABEL_59:
    *a4 = 0.0;
    v38 = 0.0;
    goto LABEL_64;
  }
  v33 = v34 < (float)(v35 + v49[v20 + 2]);
LABEL_47:
  if ((float)(v19 - v18) < *(float *)(result + 368) || (v22 & 1) != 0 || v33)
    goto LABEL_59;
  if (v19 < 0.0)
    v19 = 0.0;
  if (v19 > 1.0)
    v19 = 1.0;
  *a4 = v19;
  if (v20)
    v36 = v20 < v14;
  else
    v36 = 0;
  if (v36)
  {
    v39 = v20 - 1;
    v40 = (float)v20;
    v41 = v20 + 1;
    v42 = v49[v39];
    v43 = v49[v20];
    v44 = v49[v41];
    v45 = v43 - v42;
    v46 = v42 - v44;
    v47 = v44 - v43;
    v48 = (float)((float)(v46 * (float)v20) + (float)((float)(int)v41 * v45)) + (float)((float)(int)v39 * v47);
    if (v48 != 0.0)
      v40 = (float)((float)((float)((float)(v40 * v40) * v46) + (float)((float)((float)(int)v41 * (float)(int)v41) * v45))
                  + (float)((float)((float)(int)v39 * (float)(int)v39) * v47))
          / (float)(v48 + v48);
    v37 = v40 - (float)v16;
  }
  else
  {
    v37 = (float)(v20 - v16);
  }
  v38 = v37 * -2.0;
LABEL_64:
  *a3 = v38;
  return result;
}

uint64_t sub_10000E0B0(uint64_t result, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  float v16;
  float32x4_t v17;
  uint64_t v18;
  float32x4_t v19;
  int32x4_t v20;
  float32x4_t v21;
  int8x16_t v22;
  int32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int32x4_t v31;
  int32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  int32x4_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unsigned int v44;

  v4 = 0;
  v5 = 0.0;
  v6 = 0.0;
  do
  {
    v7 = (float)*(unsigned int *)(a2 + v4 * 4);
    v8 = *(float *)&dword_1000223A8[v4] * v7;
    v5 = v5 + (float)(v7 - v8);
    v6 = v6 + v8;
    ++v4;
  }
  while (v4 != 14);
  if (v6 == 0.0)
    v9 = 1.0;
  else
    v9 = v6;
  v10 = (float)(v5 / v9) + -1.0;
  if (v5 == 0.0)
    v11 = 1.0;
  else
    v11 = v5;
  if (v6 <= v5)
    v12 = 1.0 - (float)(v6 / v11);
  else
    v12 = v10;
  if (v12 >= 0.0)
    v13 = v12;
  else
    v13 = -v12;
  v14 = 0.0;
  if (v13 > 0.2)
  {
    v14 = 1.0;
    if (v13 < 0.6)
      v14 = (float)(v13 + -0.2) / 0.4;
  }
  v15 = 0;
  if (v12 >= 0.0)
    *(float *)&a4 = v14 * *(float *)(result + 36);
  else
    *(float *)&a4 = -(float)(v14 * *(float *)(result + 36));
  v16 = (float)(*(float *)&a4 + 1.0) * 0.5;
  *(float *)&a4 = 1.0 - v16;
  v17 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a4, 0);
  v18 = a2 + 116;
  v19 = (float32x4_t)vdupq_n_s32(0x3A800000u);
  v20 = 0uLL;
  v21.i64[0] = 0x7F0000007FLL;
  v21.i64[1] = 0x7F0000007FLL;
  v22 = (int8x16_t)vdupq_n_s32(0x7F800000u);
  __asm { FMOV            V16.4S, #1.0 }
  v28 = 0uLL;
  v29 = 0uLL;
  v30 = 0uLL;
  v31 = 0uLL;
  do
  {
    v32 = *(int32x4_t *)(v18 + v15 * 4 - 112);
    v33 = vmulq_f32(vcvtq_f32_u32((uint32x4_t)v32), v19);
    v34 = (float32x4_t)vbslq_s8((int8x16_t)vceqq_f32(v33, v21), v22, (int8x16_t)vabsq_f32(vsqrtq_f32(v33)));
    v35 = vmulq_f32(vmulq_f32(vcvtq_f32_u32(*(uint32x4_t *)(v18 + v15 * 4 - 56)), vcvtq_f32_u32(*(uint32x4_t *)&dword_100022370[v15 + 1])), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v34, _Q16), (int8x16_t)_Q16, (int8x16_t)v34));
    v36 = (int32x4_t)vcvtq_u32_f32(v35);
    v37 = (int32x4_t)vcvtq_u32_f32(vmulq_f32(vmlaq_f32(vmulq_n_f32(vsubq_f32(_Q16, *(float32x4_t *)&dword_1000223A8[v15 + 1]), v16), v17, *(float32x4_t *)&dword_1000223A8[v15 + 1]), v35));
    v30 = vaddq_s32(v30, v36);
    v29 = vaddq_s32(v29, v37);
    v31 = vaddq_s32(v32, v31);
    v38 = *(int32x4_t *)(v18 + v15 * 4);
    v28 = vmlaq_s32(v28, v38, v36);
    v20 = vmlaq_s32(v20, v38, v37);
    v15 += 4;
  }
  while (v15 != 12);
  v39 = vaddvq_s32(v30);
  v40 = vaddvq_s32(v29);
  v41 = vaddvq_s32(v28);
  v42 = vaddvq_s32(v20);
  if (v39)
    v41 = 16 * v41 / v39;
  v43 = v42;
  if (v40)
    v43 = 16 * v42 / v40;
  *(_BYTE *)(a3 + 12) = *(_BYTE *)(a2 + 168);
  if (v39)
  {
    *(_DWORD *)a3 = (vaddvq_s32(v31) + 8) >> 4;
    *(_DWORD *)(a3 + 4) = v39;
    *(_DWORD *)(a3 + 8) = v41;
    if (v40)
    {
      if (v43 >= 0)
        v44 = v43;
      else
        v44 = -v43;
      if (v44 >= 0xA1)
      {
        if (v44 < 0x140)
          *(_DWORD *)(a3 + 8) = (int)(((v44 << 10) - 163840) / 0xA0 * v43 + (1024 - ((v44 << 10) - 163840) / 0xA0) * v41) >> 10;
        else
          *(_DWORD *)(a3 + 8) = v43;
      }
    }
  }
  else
  {
    *(_DWORD *)(a3 + 8) = 0;
    *(_QWORD *)a3 = 0;
  }
  return result;
}

uint64_t sub_10000E318(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unsigned int *v3;
  float v4;
  unsigned int v5;
  float v6;
  uint64_t v8;
  float v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  float v13;

  if (result >= 5)
    sub_10001D568();
  v2 = qword_100022408[(int)result];
  switch((int)result)
  {
    case 0:
    case 1:
    case 3:
      v3 = (unsigned int *)(a2 + 32);
      v4 = -1.0;
      do
      {
        v5 = *(v3 - 4);
        if (v5 && *v3 && *(v3 - 8) >= 0x41)
        {
          v6 = (float)((float)v5 / (float)*v3) + -1.0;
          if (v6 < 0.0)
            v6 = -v6;
          if (v6 > v4 || v4 < 0.0)
            v4 = v6;
        }
        ++v3;
        --v2;
      }
      while (v2);
      break;
    case 2:
      return result;
    case 4:
      v8 = 0;
      v9 = -1.0;
      do
      {
        if ((v8 & 0x7FFFFFFD) != 0)
        {
          v10 = a2 + 4 * v8;
          v11 = *(_DWORD *)(v10 + 16);
          if (v11)
          {
            v12 = *(_DWORD *)(v10 + 32);
            if (v12)
            {
              if (*(_DWORD *)(a2 + 4 * v8) >= 0x41u)
              {
                v13 = (float)((float)v11 / (float)v12) + -1.0;
                if (v13 < 0.0)
                  v13 = -v13;
                if (v13 > v9 || v9 < 0.0)
                  v9 = v13;
              }
            }
          }
        }
        ++v8;
      }
      while (v2 != v8);
      break;
    default:
      sub_10001E420();
  }
  return result;
}

uint64_t sub_10000E484(float *a1, float *a2)
{
  unsigned int v2;

  if (*a1 >= *a2)
    v2 = 0;
  else
    v2 = -1;
  if (*a1 > *a2)
    return 1;
  else
    return v2;
}

float sub_10000E49C(uint64_t a1, float a2)
{
  float *v2;
  unint64_t i;
  float *v4;
  float v5;
  float v7;
  float v8;
  BOOL v9;
  float v10;

  v2 = (float *)(a1 + 8);
  for (i = 1; i != 8; ++i)
  {
    if (*v2 > a2)
      break;
    v2 += 2;
  }
  if (i >= 7)
    i = 7;
  v4 = (float *)(a1 + 8 * i);
  v5 = *(v4 - 2);
  if (*v4 == v5)
    return *(v4 - 1);
  v7 = (float)(a2 - v5) / (float)(*v4 - v5);
  if (v7 <= 1.0)
    v8 = v7;
  else
    v8 = 1.0;
  v9 = v7 < 0.0;
  v10 = 0.0;
  if (!v9)
    v10 = v8;
  return (float)((float)(1.0 - v10) * *(v4 - 1)) + (float)(v10 * v4[1]);
}

void sub_10000E524(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 582, a4);
}

void sub_10000E52C(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 594, a4);
}

void sub_10000E534(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 622, a4);
}

void sub_10000E53C(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 515, a4);
}

void sub_10000E544(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 511, a4);
}

void sub_10000E54C(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 532, a4);
}

void sub_10000E554(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 4380, a4);
}

void sub_10000E55C(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 4386, a4);
}

void sub_10000E564(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 202, a4);
}

void sub_10000E56C(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 1007, a4);
}

void sub_10000E574(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 1114, a4);
}

void start()
{
  operator new();
}

void sub_10000E670(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000E684(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

const void **sub_10000E694(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t sub_10000E6C8()
{
  return 0;
}

uint64_t sub_10000E6D0()
{
  return 0;
}

_QWORD *sub_10000E6D8(_QWORD *result, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  pid_t pid;
  pid_t v8;
  uint64_t v9;

  if (a2)
  {
    v3 = result;
    v4 = result + 1;
    if (!result[3])
      result[6] = os_transaction_create(result[20]);
    v5 = operator new(0x18uLL);
    v5[1] = v4;
    v5[2] = a2;
    v6 = v3[1];
    *v5 = v6;
    *(_QWORD *)(v6 + 8) = v5;
    v3[1] = v5;
    ++v3[3];
    if (*(_DWORD *)(a2 + 8) == 1 && (pid = xpc_connection_get_pid(*(xpc_connection_t *)a2)) != 0)
    {
      v8 = pid;
      sub_10000E7C8(3);
      v9 = v8;
    }
    else
    {
      sub_10000E7C8(3);
      v9 = 0;
    }
    kdebug_trace(832585740, v9, 0, 0, 0);
    return (_QWORD *)sub_10000E7C8(3);
  }
  return result;
}

uint64_t sub_10000E7C8(uint64_t result)
{
  if (result <= 5)
    operator new[]();
  return result;
}

void sub_10000E8AC(uint64_t a1, void *a2)
{
  pid_t pid;
  uint64_t v4;
  void *__p;

  __p = a2;
  if (a2)
  {
    sub_10000E994(a1 + 8, &__p);
    if (*((_DWORD *)__p + 2) == 1 && (pid = xpc_connection_get_pid(*(xpc_connection_t *)__p)) != 0)
    {
      LODWORD(v4) = pid;
      xpc_release(*(xpc_object_t *)__p);
      sub_10000E7C8(3);
      v4 = (int)v4;
    }
    else
    {
      sub_10000E7C8(3);
      v4 = 0;
    }
    sub_10000E7C8(3);
    if (!*(_QWORD *)(a1 + 24))
    {
      os_release(*(void **)(a1 + 48));
      *(_QWORD *)(a1 + 48) = 0;
    }
    kdebug_trace(832585744, v4, 0, 0, 0);
    if (__p)
      operator delete(__p);
  }
}

_QWORD *sub_10000E994(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10[3];

  v10[0] = (uint64_t)v10;
  v10[1] = (uint64_t)v10;
  v10[2] = 0;
  v2 = *(_QWORD **)(a1 + 8);
  if (v2 != (_QWORD *)a1)
  {
    do
    {
      v6 = (_QWORD *)v2[1];
      v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (_QWORD *)a1)
        {
          v8 = 1;
LABEL_8:
          v6 = (_QWORD *)a1;
        }
        else
        {
          while (1)
          {
            v7 = v6[2];
            v8 = v7 == v5;
            if (v7 != v5)
              break;
            v6 = (_QWORD *)v6[1];
            if (v6 == (_QWORD *)a1)
              goto LABEL_8;
          }
        }
        sub_10000F968((uint64_t)v10, v10, a1, v2, v6);
        if (!v8)
          v6 = (_QWORD *)v6[1];
      }
      v2 = v6;
    }
    while (v6 != (_QWORD *)a1);
  }
  return sub_10000F908(v10);
}

void sub_10000EA4C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_10000F908((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10000EA60(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *i;
  uint64_t v4;
  void *v5;

  v2 = a1 + 1;
  for (i = (_QWORD *)a1[2]; i != v2; i = (_QWORD *)i[1])
  {
    v4 = i[2];
    if (*(_DWORD *)(v4 + 8) == 1)
    {
      xpc_release(*(xpc_object_t *)v4);
      v4 = i[2];
      if (!v4)
        continue;
    }
    operator delete((void *)v4);
  }
  sub_10000F908(v2);
  v5 = (void *)a1[6];
  if (v5)
  {
    os_release(v5);
    a1[6] = 0;
  }
}

uint64_t sub_10000EAD8(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;

  sub_10000E7C8(3);
  kdebug_trace(832585733, *a3, 0, 0, 0);
  if (*a3 == 1)
  {
    v7 = 0;
  }
  else if (*a3 == 2)
  {
    v6 = a3[2];
    if (v6 <= 5)
    {
      v8 = *((_BYTE *)a3 + 12);
      if (!v8)
      {
        sub_1000113BC(*(_QWORD *)(a1 + 80));
        sub_1000113BC(*(_QWORD *)(a1 + 88));
      }
      v7 = 0;
      *(_BYTE *)(a2 + v6 + 12) = v8;
    }
    else
    {
      v7 = 3758097084;
    }
  }
  else
  {
    v7 = 3758097084;
  }
  sub_10000E7C8(3);
  kdebug_trace(832585734, *a3, 0, 0, 0);
  return v7;
}

uint64_t sub_10000EBF4(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v4;

  sub_10000E7C8(3);
  kdebug_trace(832585737, *a3, 0, 0, 0);
  if (*a3 == 5)
  {
    v4 = 0;
    *((_BYTE *)a3 + 8) = sub_100016C94(0, (uint64_t *)a3 + 2);
  }
  else
  {
    v4 = 3758097084;
  }
  sub_10000E7C8(3);
  kdebug_trace(832585738, *a3, 0, 0, 0);
  return v4;
}

void sub_10000ECBC(uint64_t a1, xpc_connection_t *a2, xpc_object_t xdict)
{
  int uint64;
  unsigned int *data;
  BOOL v8;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  xpc_object_t reply;
  void *v15;
  _xpc_connection_s *remote_connection;
  unsigned int __dst[920];
  size_t length;

  length = 0;
  uint64 = xpc_dictionary_get_uint64(xdict, "H10ISPServicesRemoteTypeKey");
  data = (unsigned int *)xpc_dictionary_get_data(xdict, "H10ISPServicesRemoteDataKey", &length);
  if (uint64)
    v8 = data == 0;
  else
    v8 = 1;
  if (v8 || length == 0)
    return;
  if (uint64 == 1 && length == 13136)
  {
    v10 = sub_10000EAD8(a1, (uint64_t)a2, data);
LABEL_14:
    v13 = v10;
    goto LABEL_16;
  }
  if (uint64 == 2 && length == 3680)
  {
    v11 = memcpy(__dst, data, sizeof(__dst));
    v10 = sub_10000EBF4((uint64_t)v11, v12, __dst);
    goto LABEL_14;
  }
  xpc_connection_get_pid(*a2);
  sub_10000E7C8(3);
  v13 = -536870212;
LABEL_16:
  reply = xpc_dictionary_create_reply(xdict);
  if (reply)
  {
    v15 = reply;
    remote_connection = xpc_dictionary_get_remote_connection(reply);
    xpc_connection_get_pid(*a2);
    if (remote_connection)
    {
      xpc_dictionary_set_int64(v15, "H10ISPServicesRemoteReturnKey", v13);
      if (uint64 == 2)
        xpc_dictionary_set_data(v15, "H10ISPServicesRemoteDataKey", __dst, length);
      xpc_connection_send_message(remote_connection, v15);
    }
    else
    {
      sub_10000E7C8(3);
    }
    xpc_release(v15);
  }
  else
  {
    xpc_connection_get_pid(*a2);
    sub_10000E7C8(3);
  }
}

uint64_t sub_10000EE58(uint64_t a1, xpc_connection_t *a2)
{
  xpc_connection_get_pid(*a2);
  sub_10000E7C8(3);
  return (*(uint64_t (**)(uint64_t, xpc_connection_t *))(*(_QWORD *)a1 + 48))(a1, a2);
}

void sub_10000EF28()
{
  operator new();
}

uint64_t sub_10000EFEC(uint64_t a1, xpc_object_t object)
{
  uint64_t v4;
  xpc_type_t type;
  xpc_connection_t *v6;

  v4 = *(_QWORD *)(a1 + 32);
  type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
    return sub_10000EE58(v4, *(xpc_connection_t **)(a1 + 40));
  v6 = *(xpc_connection_t **)(a1 + 40);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
    return (*(uint64_t (**)(uint64_t, xpc_connection_t *, xpc_object_t))(*(_QWORD *)v4 + 64))(v4, v6, object);
  xpc_connection_get_pid(*v6);
  return sub_10000E7C8(3);
}

const char *sub_10000F0AC(uint64_t a1, xpc_object_t xdict)
{
  const char *result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;

  result = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(a1 + 16);
    if (v5 == a1 + 8)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        v8 = v5 + 8;
        v5 = *(_QWORD *)(v5 + 8);
        v7 = *(_QWORD *)(v8 + 8);
        if (!*(_DWORD *)(v7 + 8))
          v6 = v7;
      }
      while (v5 != a1 + 8);
    }
    v9 = strlen(*(const char **)(a1 + 168));
    result = (const char *)strncmp(v4, *(const char **)(a1 + 168), v9);
    if ((_DWORD)result)
    {
      v10 = strlen(*(const char **)(a1 + 176));
      result = (const char *)strncmp(v4, *(const char **)(a1 + 176), v10);
      if ((_DWORD)result)
      {
        return (const char *)sub_10000E7C8(3);
      }
      else if (v6)
      {
        return (const char *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 48))(a1, v6);
      }
    }
    else if (!v6)
    {
      operator new();
    }
  }
  return result;
}

uint64_t sub_10000F1E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 72);
  if (!v2)
    return 3758097101;
  if ((sub_10001BB74(v2) & 1) != 0)
    return 0;
  if (sub_100018820(*(_QWORD *)(a1 + 72)))
  {
    do
    {
      usleep(0x186A0u);
      sub_10000E7C8(3);
    }
    while ((sub_100018820(*(_QWORD *)(a1 + 72)) & 1) != 0);
  }
  *(_QWORD *)(a1 + 48) = os_transaction_create(*(_QWORD *)(a1 + 184));
  v3 = sub_10001A684(*(_QWORD *)(a1 + 72));
  os_release(*(void **)(a1 + 48));
  if ((_DWORD)v3)
    sub_10000E7C8(3);
  return v3;
}

uint64_t sub_10000F2A8(_QWORD *a1)
{
  uint64_t v2;
  CFArrayRef *v3;
  uint64_t v4;
  unint64_t v5;
  const void *ValueAtIndex;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  kdebug_trace(832585729, 0, 0, 0, 0);
  v2 = sub_10001CD90(a1 + 8, (uint64_t)sub_10000E6C8, 0);
  v3 = (CFArrayRef *)a1[8];
  if (!v3)
  {
    v4 = 3758097088;
LABEL_16:
    sub_10000E7C8(3);
    goto LABEL_18;
  }
  v4 = v2;
  if (CFArrayGetCount(*v3))
  {
    v5 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)a1[8], v5);
      a1[9] = ValueAtIndex;
      v4 = sub_1000192F0((uint64_t)ValueAtIndex, (uint64_t)sub_10000E6D0, (uint64_t)a1);
      if (!(_DWORD)v4)
        break;
      a1[9] = 0;
      ++v5;
    }
    while (v5 < CFArrayGetCount(*(CFArrayRef *)a1[8]));
  }
  if (!a1[9])
  {
    sub_10000E7C8(3);
    if (!(_DWORD)v4)
      goto LABEL_19;
LABEL_18:
    (*(void (**)(_QWORD *))(*a1 + 24))(a1);
    goto LABEL_19;
  }
  v4 = sub_10000F1E4((uint64_t)a1);
  if ((_DWORD)v4)
    goto LABEL_18;
  v7 = 0;
  v8 = 1;
  do
  {
    v9 = v8;
    v10 = a1[9];
    v11 = &a1[v7 + 10];
    v15[0] = v11;
    v15[1] = v10;
    v12 = sub_1000113FC((uint64_t)v15);
    if ((_DWORD)v12)
    {
      v4 = v12;
      goto LABEL_16;
    }
    v13 = sub_1000111C4(*v11);
    if ((_DWORD)v13)
    {
      v4 = v13;
      goto LABEL_16;
    }
    v8 = 0;
    v7 = 1;
  }
  while ((v9 & 1) != 0);
  if (sub_10001A508(a1[9], 10))
    sub_10000E7C8(3);
  v4 = 0;
LABEL_19:
  kdebug_trace(832585730, 0, 0, 0, 0);
  return v4;
}

uint64_t sub_10000F48C(_QWORD *a1)
{
  const void **v2;
  const void **v3;
  uint64_t v4;
  char v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (const void **)a1[12];
  if (v2)
  {
    v3 = sub_10000E6C4(v2);
    operator delete(v3);
    a1[12] = 0;
  }
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = &a1[v4];
    v10 = v7[10];
    v9 = v7 + 10;
    v8 = v10;
    if (v10)
    {
      sub_100010FF4(v8);
      sub_1000115B8(*v9);
      *v9 = 0;
    }
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  v11 = a1[9];
  if (v11)
  {
    sub_100019134(v11);
    a1[9] = 0;
  }
  v12 = a1[8];
  if (v12)
  {
    sub_10001CF34(v12);
    a1[8] = 0;
  }
  return 0;
}

uint64_t sub_10000F51C(uint64_t a1)
{
  NSObject *v2;
  NSObject *v4;
  _xpc_connection_s *mach_service;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD handler[5];

  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (v2)
  {
    v4 = v2;
    dispatch_source_set_event_handler(v2, &stru_100024740);
    dispatch_resume(v4);
    mach_service = xpc_connection_create_mach_service(*(const char **)(a1 + 144), *(dispatch_queue_t *)(a1 + 40), 1uLL);
    *(_QWORD *)(a1 + 32) = mach_service;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_10000F644;
    handler[3] = &unk_100024760;
    handler[4] = a1;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 32));
    v6 = *(NSObject **)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_10000F6C8;
    v7[3] = &unk_100024780;
    v7[4] = a1;
    xpc_set_event_stream_handler("com.apple.iokit.matching", v6, v7);
    dispatch_main();
  }
  sub_10000E7C8(3);
  return 3758097086;
}

void sub_10000F624(id a1)
{
  sub_10000E7C8(3);
  exit(0);
}

xpc_type_t sub_10000F644(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_type_t result;

  v3 = *(_QWORD *)(a1 + 32);
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
    return (xpc_type_t)(*(uint64_t (**)(uint64_t, xpc_object_t))(*(_QWORD *)v3 + 32))(v3, object);
  result = xpc_get_type(object);
  if (result == (xpc_type_t)&_xpc_type_error)
    return (xpc_type_t)sub_10000E7C8(3);
  return result;
}

xpc_type_t sub_10000F6C8(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_type_t result;

  v3 = *(_QWORD *)(a1 + 32);
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
    return (xpc_type_t)(*(uint64_t (**)(uint64_t, xpc_object_t))(*(_QWORD *)v3 + 72))(v3, object);
  result = xpc_get_type(object);
  if (result == (xpc_type_t)&_xpc_type_error
    && (object == &_xpc_error_termination_imminent
     || object == &_xpc_error_connection_invalid
     || object == &_xpc_error_connection_interrupted))
  {
    return (xpc_type_t)sub_10000E7C8(3);
  }
  return result;
}

uint64_t sub_10000F794(uint64_t a1)
{
  *(_QWORD *)a1 = off_1000247B0;
  *(_QWORD *)(a1 + 8) = a1 + 8;
  *(_QWORD *)(a1 + 16) = a1 + 8;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_QWORD *)(a1 + 144) = "com.apple.dietapplecamerad";
  *(_QWORD *)(a1 + 152) = "com.apple.dietapplecamerad.writer";
  *(_QWORD *)(a1 + 160) = "com.apple.dietapplecamerad.assistant_active";
  *(_QWORD *)(a1 + 168) = "com.apple.dietapplecamerad.launch";
  *(_QWORD *)(a1 + 176) = "com.apple.dietapplecamerad.destroy";
  *(_QWORD *)(a1 + 184) = "com.apple.dietapplecamerad.firmware_loading";
  *(_QWORD *)(a1 + 40) = dispatch_queue_create("com.apple.dietapplecamerad", 0);
  *(_QWORD *)(a1 + 56) = dispatch_queue_create(*(const char **)(a1 + 152), 0);
  sub_10001CF90(CFSTR("EnableHawking"), CFSTR("com.apple.coremedia"), 1);
  sub_10000E7C8(3);
  return a1;
}

void sub_10000F85C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_10000F908(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F874(uint64_t a1)
{
  *(_QWORD *)a1 = off_1000247B0;
  sub_10000E7C8(3);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  dispatch_sync(*(dispatch_queue_t *)(a1 + 56), &stru_100024820);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  sub_10000F908((_QWORD *)(a1 + 8));
  return a1;
}

void sub_10000F8F4(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_10000F874(a1);
  operator delete(v1);
}

_QWORD *sub_10000F908(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

uint64_t sub_10000F968(uint64_t result, uint64_t *a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  if (a4 != a5)
  {
    v5 = (_QWORD *)*a5;
    if (result != a3)
    {
      v6 = 1;
      if (v5 != a4)
      {
        v7 = a4;
        do
        {
          v7 = (_QWORD *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(_QWORD *)(a3 + 16) -= v6;
      *(_QWORD *)(result + 16) += v6;
    }
    v8 = *a4;
    *(_QWORD *)(v8 + 8) = v5[1];
    *(_QWORD *)v5[1] = v8;
    v9 = *a2;
    *(_QWORD *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

uint64_t sub_10000F9E0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  const char *v5;
  uint32_t v6;
  stat v8;

  if (a3 == 1)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3 == 208)
      operator new[]();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8.st_dev = 136315650;
      *(_QWORD *)&v8.st_mode = "RPCFileInfo";
      WORD2(v8.st_ino) = 2048;
      *(__darwin_ino64_t *)((char *)&v8.st_ino + 6) = 208;
      HIWORD(v8.st_gid) = 2048;
      *(_QWORD *)&v8.st_rdev = v3;
      v5 = "%s: Buffer size does not match expected value (expected %ld, recv %lld)";
      v6 = 32;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8.st_dev = 136315394;
    *(_QWORD *)&v8.st_mode = "RPCFileInfo";
    WORD2(v8.st_ino) = 1024;
    *(_DWORD *)((char *)&v8.st_ino + 6) = a3;
    v5 = "%s: Number of buffers is not 1 (%d)";
    v6 = 18;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v6);
  }
  return 3;
}

uint64_t sub_10000FC24(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  const char *v5;
  uint32_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  if (a3 == 2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3 == 208)
      operator new[]();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "RPCFileRead";
      v10 = 2048;
      v11 = 208;
      v12 = 2048;
      v13 = v3;
      v5 = "%s: Buffer size does not match expected value (expected %ld, recv %lld)";
      v6 = 32;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "RPCFileRead";
    v10 = 1024;
    LODWORD(v11) = a3;
    v5 = "%s: Number of buffers is not 2 (%d)";
    v6 = 18;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v6);
  }
  return 3;
}

uint64_t sub_10000FF94(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  const char *v5;
  uint32_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  if (a3 == 2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3 == 208)
      operator new[]();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "RPCFileWrite";
      v10 = 2048;
      v11 = 208;
      v12 = 2048;
      v13 = v3;
      v5 = "%s: Buffer size does not match expected value (expected %ld, recv %lld)\n";
      v6 = 32;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "RPCFileWrite";
    v10 = 1024;
    LODWORD(v11) = a3;
    v5 = "%s: Number of buffers is not 2 (%d)\n";
    v6 = 18;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v6);
  }
  return 3;
}

uint64_t sub_100010310(uint64_t a1, uint64_t *a2, int a3)
{
  unint64_t v3;
  const char *v4;
  uint32_t v5;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unint64_t v13;

  if (a3 != 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "PDAFProcessX1Wrapper";
      v10 = 1024;
      v11 = a3;
      v4 = "%s: Number of buffers is not 2 (%d)\n";
      v5 = 18;
      goto LABEL_7;
    }
    return 3;
  }
  v3 = a2[4];
  if (v3 <= 0x7EF8B)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "PDAFProcessX1Wrapper";
      v10 = 1024;
      v11 = 520076;
      v12 = 2048;
      v13 = v3;
      v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
      return 3;
    }
    return 3;
  }
  sub_100003E50(*a2, a2[3]);
  return 0;
}

uint64_t sub_10001046C(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v3;
  const char *v4;
  uint32_t v5;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unint64_t v13;

  if (a3 != 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "PDAFProcessX2Wrapper";
      v10 = 1024;
      v11 = a3;
      v4 = "%s: Number of buffers is not 3 (%d)\n";
      v5 = 18;
      goto LABEL_7;
    }
    return 3;
  }
  v3 = *(_QWORD *)(a2 + 56);
  if (v3 <= 0x7EF8B)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "PDAFProcessX2Wrapper";
      v10 = 1024;
      v11 = 520076;
      v12 = 2048;
      v13 = v3;
      v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
      return 3;
    }
    return 3;
  }
  sub_10000A810(*(_QWORD *)a2, *(_QWORD *)(a2 + 24), *(_DWORD **)(a2 + 48));
  return 0;
}

uint64_t sub_1000105CC(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v3;
  const char *v4;
  uint32_t v5;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unint64_t v13;

  if (a3 == 4)
  {
    v3 = *(_QWORD *)(a2 + 80);
    if (v3 > 0x7EF8B)
      sub_10000A900(*(_QWORD *)a2, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 48), *(_DWORD **)(a2 + 72));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "PDAFProcessX3Wrapper";
      v10 = 1024;
      v11 = 520076;
      v12 = 2048;
      v13 = v3;
      v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "PDAFProcessX3Wrapper";
    v10 = 1024;
    v11 = a3;
    v4 = "%s: Number of buffers is not 4 (%d)\n";
    v5 = 18;
    goto LABEL_7;
  }
  return 3;
}

uint64_t sub_100010730(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v3;
  const char *v4;
  uint32_t v5;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unint64_t v13;

  if (a3 != 5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "PDAFProcessX4Wrapper";
      v10 = 1024;
      v11 = a3;
      v4 = "%s: Number of buffers is not 5 (%d)\n";
      v5 = 18;
      goto LABEL_7;
    }
    return 3;
  }
  v3 = *(_QWORD *)(a2 + 104);
  if (v3 <= 0x7EF8B)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "PDAFProcessX4Wrapper";
      v10 = 1024;
      v11 = 520076;
      v12 = 2048;
      v13 = v3;
      v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
      return 3;
    }
    return 3;
  }
  sub_10000AAA4(*(_QWORD *)a2, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 48), *(_QWORD *)(a2 + 72), *(_DWORD **)(a2 + 96));
  return 0;
}

uint64_t sub_100010898(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint32_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  _QWORD v18[3];

  memset(v18, 0, sizeof(v18));
  if (a3 == 4)
  {
    v3 = 0;
    v5 = (uint64_t *)(a2 + 24);
    v4 = *(int **)a2;
    do
    {
      v6 = *v5;
      v5 += 3;
      v18[v3++] = v6;
    }
    while (v3 != 3);
    v7 = *(_QWORD *)(a2 + 8);
    if (v7 == 591796)
    {
      sub_100014F00(v4, (uint64_t)v18);
      return 0;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = "BlurMProcessWrapper";
      v14 = 1024;
      v15 = 591796;
      v16 = 2048;
      v17 = v7;
      v10 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      v11 = 28;
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "BlurMProcessWrapper";
    v14 = 1024;
    v15 = 4;
    v16 = 1024;
    LODWORD(v17) = a3;
    v10 = "%s: Number of buffers is not %d (%d)\n";
    v11 = 24;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, v11);
  }
  return 3;
}

uint64_t sub_100010A20(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v4;
  unint64_t v7;
  uint64_t *v8;
  int *v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t *v17;
  uint64_t i;
  _DWORD *v19;
  uint8_t buf[4];
  int v22;

  v4 = byte_1002C57E0;
  if (*(_DWORD *)(a2 + 20))
  {
    v7 = 0;
    v8 = (uint64_t *)(a2 + 472);
    v9 = (int *)(a2 + 76);
    do
    {
      v10 = *v9;
      v11 = *(v9 - 13);
      if (v4)
      {
        v12 = *(_QWORD **)(a1 + 8 * v11);
        if (v12)
        {
          sub_100011668(v12);
          v11 = *(v9 - 13);
        }
      }
      *a3 = 0;
      v13 = kdebug_trace(832585749, a1, v11, 0, 0);
      v14 = 5;
      switch(*(v9 - 13))
      {
        case 4:
          v15 = sub_10000F9E0(v13, (uint64_t)v8, v10);
          goto LABEL_10;
        case 5:
          v15 = sub_10000FC24(v13, (uint64_t)v8, v10);
          goto LABEL_10;
        case 6:
          v15 = sub_10000FF94(v13, (uint64_t)v8, v10);
LABEL_10:
          v14 = v15;
          *a3 = 1;
          break;
        case 14:
          v16 = sub_100010310(v13, v8, v10);
          goto LABEL_16;
        case 15:
          v16 = sub_10001046C(v13, (uint64_t)v8, v10);
          goto LABEL_16;
        case 16:
          v16 = sub_1000105CC(v13, (uint64_t)v8, v10);
          goto LABEL_16;
        case 17:
          v16 = sub_100010730(v13, (uint64_t)v8, v10);
          goto LABEL_16;
        case 18:
          v16 = sub_100010898(v13, (uint64_t)v8, v10);
LABEL_16:
          v14 = v16;
          break;
        default:
          break;
      }
      kdebug_trace(832585750, a1, *(v9 - 13), 0, 0);
      *(v9 - 10) = v14;
      v4 = byte_1002C57E0;
      if (byte_1002C57E0)
      {
        v17 = *(uint64_t **)(a1 + 8 * *(v9 - 13));
        if (v17)
        {
          sub_10001169C(v17);
          v4 = byte_1002C57E0;
        }
        else
        {
          v4 = 1;
        }
      }
      ++*(_DWORD *)(a1 + 152);
      ++v7;
      v8 += 24;
      v9 += 14;
    }
    while (v7 < *(unsigned int *)(a2 + 20));
  }
  if (v4 && *(_DWORD *)(a1 + 152) >= 0x400u)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** Metrics report for firmware work processor ***", buf, 2u);
    }
    for (i = 0; i != 19; ++i)
    {
      v19 = *(_DWORD **)(a1 + 8 * i);
      if (v19)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v22 = i;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** Metrics for command %d ***", buf, 8u);
          v19 = *(_DWORD **)(a1 + 8 * i);
        }
        sub_100011874(v19);
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** End report ***", buf, 2u);
    }
    *(_DWORD *)(a1 + 152) = 0;
  }
  return 0;
}

uint64_t sub_100010D28(uint64_t a1)
{
  int v2;

  *(_DWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = 0;
  v2 = sub_10001CF90(CFSTR("FirmwareWorkMetrics"), CFSTR("com.apple.coremedia"), 0);
  byte_1002C57E0 = v2 != 0;
  if (v2)
    operator new();
  return a1;
}

void sub_100010DBC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100010DD4(uint64_t a1)
{
  uint64_t i;
  void **v3;
  void **v4;
  void *v5;

  if (byte_1002C57E0)
  {
    for (i = 0; i != 152; i += 8)
    {
      v3 = *(void ***)(a1 + i);
      if (v3)
      {
        v4 = sub_100011B34(v3);
        operator delete(v4);
      }
    }
  }
  v5 = *(void **)(a1 + 160);
  if (v5)
  {
    operator delete(v5);
    *(_QWORD *)(a1 + 160) = 0;
  }
  return a1;
}

void sub_100010E34(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  int v4;
  pthread_mutexattr_t v5;

  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_DWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 240) = a2;
  v3 = (uint64_t *)(a1 + 240);
  *(_QWORD *)(a1 + 272) = 0;
  *(_QWORD *)(a1 + 280) = 0x4000000000000000;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 16), 0);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 144), 0);
  *(_QWORD *)(a1 + 208) = 0;
  pthread_mutexattr_init(&v5);
  pthread_mutexattr_settype(&v5, 2);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 80), &v5);
  pthread_mutexattr_destroy(&v5);
  v4 = 0;
  sub_100018904(*v3, &v4, (double *)(a1 + 256));
  mach_timebase_info((mach_timebase_info_t)(a1 + 264));
  operator new();
}

void sub_100010F2C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100010F48(uint64_t a1)
{
  uint64_t v2;
  __CFRunLoop *v3;
  __CFRunLoopSource *v4;
  uint64_t v5;
  void *v6;

  if (*(_DWORD *)a1)
    sub_100010FF4(a1);
  if (*(_QWORD *)(a1 + 232))
    sub_100011080(a1);
  v2 = *(_QWORD *)(a1 + 272);
  if (v2)
  {
    v3 = *(__CFRunLoop **)(a1 + 8);
    v4 = sub_10001D18C(v2);
    CFRunLoopRemoveSource(v3, v4, kCFRunLoopDefaultMode);
    v5 = *(_QWORD *)(a1 + 272);
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    *(_QWORD *)(a1 + 272) = 0;
  }
  if (*(_QWORD *)(a1 + 288))
  {
    v6 = (void *)sub_100010E30();
    operator delete(v6);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 80));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 144));
  return a1;
}

uint64_t sub_100010FF4(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)a1)
  {
    sub_100011328(a1);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    *(_BYTE *)(a1 + 248) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 80));
    v3 = sub_10001B93C(*(_QWORD *)(a1 + 240), *(_DWORD *)(a1 + 224));
    *(_BYTE *)(a1 + 248) = 0;
    *(_DWORD *)a1 = 0;
  }
  else
  {
    v3 = 3758097122;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void sub_100011080(uint64_t a1)
{
  __CFRunLoopSource *v2;
  __CFMachPort *v3;
  mach_port_name_t v4;

  v2 = *(__CFRunLoopSource **)(a1 + 232);
  if (v2)
  {
    CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 8), v2, kCFRunLoopDefaultMode);
    CFRelease(*(CFTypeRef *)(a1 + 232));
    *(_QWORD *)(a1 + 232) = 0;
  }
  v3 = *(__CFMachPort **)(a1 + 216);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 216));
    *(_QWORD *)(a1 + 216) = 0;
  }
  v4 = *(_DWORD *)(a1 + 224);
  if (v4)
  {
    mach_port_mod_refs(mach_task_self_, v4, 1u, -1);
    *(_DWORD *)(a1 + 224) = 0;
  }
}

uint64_t sub_100011100(uint64_t a1)
{
  uint64_t v2;
  __CFMachPort *v3;
  __CFRunLoopSource *RunLoopSource;
  Boolean shouldFreeInfo;
  CFMachPortContext context;

  v2 = IOCreateReceivePort(0x39u, (mach_port_t *)(a1 + 224));
  if (!(_DWORD)v2)
  {
    v2 = 3758097085;
    shouldFreeInfo = 0;
    context.version = 1;
    context.info = (void *)a1;
    memset(&context.retain, 0, 24);
    v3 = CFMachPortCreateWithPort(kCFAllocatorDefault, *(_DWORD *)(a1 + 224), (CFMachPortCallBack)&IODispatchCalloutFromMessage, &context, &shouldFreeInfo);
    *(_QWORD *)(a1 + 216) = v3;
    if (v3)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, v3, 0);
      *(_QWORD *)(a1 + 232) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 8), RunLoopSource, kCFRunLoopDefaultMode);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t sub_1000111C4(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  _QWORD inputStruct[2];
  int v6;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)a1 == 1)
  {
    pthread_mutex_unlock(v2);
    return 3758097122;
  }
  else
  {
    *(_BYTE *)(a1 + 248) = 0;
    *(_DWORD *)a1 = 1;
    inputStruct[0] = sub_100011250;
    inputStruct[1] = a1;
    v6 = *(_DWORD *)(a1 + 224);
    v3 = sub_10001B8AC(*(_QWORD *)(a1 + 240), inputStruct);
    pthread_mutex_unlock(v2);
  }
  return v3;
}

void sub_100011250()
{
  operator new();
}

uint64_t sub_100011328(uint64_t a1)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *v3;

  v2 = (pthread_mutex_t *)(a1 + 144);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 144));
  v3 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 208));
    *(_QWORD *)(a1 + 208) = 0;
  }
  return pthread_mutex_unlock(v2);
}

uint64_t sub_10001136C(uint64_t a1)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *v3;
  CFAbsoluteTime Current;

  v2 = (pthread_mutex_t *)(a1 + 144);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 144));
  v3 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v3, Current + *(double *)(a1 + 280));
  }
  return pthread_mutex_unlock(v2);
}

uint64_t sub_1000113BC(uint64_t a1)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  sub_10001BAEC(*(_QWORD *)(a1 + 240), *(_DWORD *)(a1 + 224));
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t sub_1000113FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  pthread_t v5;
  _QWORD v6[3];
  pthread_mutex_t v7;
  pthread_attr_t v8;

  v5 = 0;
  sub_100011B9C((uint64_t)&v7);
  v2 = *(_QWORD *)(a1 + 8);
  v6[0] = 0;
  v6[1] = v2;
  v6[2] = &v7;
  pthread_attr_init(&v8);
  pthread_attr_setdetachstate(&v8, 2);
  pthread_create(&v5, &v8, (void *(__cdecl *)(void *))sub_1000114F4, v6);
  pthread_attr_destroy(&v8);
  sub_100011BDC(&v7);
  **(_QWORD **)a1 = v6[0];
  if (v6[0])
    v3 = 0;
  else
    v3 = 3758097084;
  sub_100011BD4((uint64_t)&v7);
  return v3;
}

void sub_1000114D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void sub_1000114F4(uint64_t a1)
{
  pthread_setname_np("H10ISPFirmwareWorkProcessorThread");
  j__pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 16));
  operator new();
}

void sub_1000115A4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000115B8(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  CFRetain(v2);
  v3 = (void *)sub_100010F48(a1);
  operator delete(v3);
  CFRunLoopStop((CFRunLoopRef)v2);
  CFRelease(v2);
  return 0;
}

double sub_100011600(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  double result;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  v3 = *a1;
  result = 0.0;
  if (a2 - 1 < a3 && v3 != 0)
  {
    v6 = *((unsigned int *)a1 + 4);
    *(_QWORD *)(v3 + 8 * v6) = a3 - a2;
    v8 = *((_DWORD *)a1 + 2);
    v7 = *((_DWORD *)a1 + 3);
    *((_DWORD *)a1 + 4) = ((int)v6 + 1) % v8;
    if (v7 < v8)
      *((_DWORD *)a1 + 3) = v7 + 1;
    return (double)((a3 - a2) * *((unsigned int *)a1 + 8) / *((unsigned int *)a1 + 9)) / 1000000.0;
  }
  return result;
}

_QWORD *sub_100011668(_QWORD *result)
{
  _QWORD *v1;

  if (*result)
  {
    v1 = result;
    if (!result[3])
    {
      result = (_QWORD *)mach_absolute_time();
      v1[3] = result;
    }
  }
  return result;
}

double sub_10001169C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  double result;

  v1 = a1[3];
  if (!v1)
    return 0.0;
  v3 = mach_absolute_time();
  result = sub_100011600(a1, v1, v3);
  a1[3] = 0;
  return result;
}

double sub_1000116E0(_DWORD *a1, uint64_t a2)
{
  double result;
  int v3;
  int v4;

  if (a2)
  {
    *(_QWORD *)(a2 + 48) = 0;
    result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    v4 = a1[2];
    v3 = a1[3];
    *(_DWORD *)a2 = v3;
    *(_DWORD *)(a2 + 4) = v4;
    *(_DWORD *)(a2 + 8) = a1[4];
    if (v3)
      operator new[]();
  }
  return result;
}

void sub_100011874(_DWORD *a1)
{
  _DWORD v1[4];
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;

  sub_1000116E0(a1, (uint64_t)v1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v8) = v1[0];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Number of samples: %d", buf, 8u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v8) = v1[1];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Maximum samples:   %d", buf, 8u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Minimum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Maximum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Average time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Median time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Standard deviation (ms): %.3f", buf, 0xCu);
  }
}

void sub_100011AE4(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 24) = 0;
  operator new[]();
}

void **sub_100011B34(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
    operator delete[](v2);
  return a1;
}

uint64_t sub_100011B60(uint64_t a1)
{
  pthread_mutex_init((pthread_mutex_t *)a1, 0);
  pthread_cond_init((pthread_cond_t *)(a1 + 64), 0);
  pthread_mutex_lock((pthread_mutex_t *)a1);
  return a1;
}

uint64_t sub_100011BA0(uint64_t a1)
{
  pthread_cond_destroy((pthread_cond_t *)(a1 + 64));
  pthread_mutex_destroy((pthread_mutex_t *)a1);
  return a1;
}

uint64_t sub_100011BDC(pthread_mutex_t *a1)
{
  return pthread_cond_wait((pthread_cond_t *)&a1[1], a1);
}

uint64_t sub_100011BE8(uint64_t a1)
{
  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100011C10(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  __int16 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  __int16 *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;

  v32 = a2;
  v7 = (__int16 *)(a1 + 2 * a6 * a3 + 2 * a2);
  v31 = a4;
  v8 = a6;
  v9 = 2 * a6;
  v10 = 2 * a4 - 4;
  v11 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *v7;
      v13 = v7[1];
      v14 = v7[2];
      v15 = v7[3];
      v16 = *(__int16 *)((char *)v7 + v10 - 4);
      v17 = *(__int16 *)((char *)v7 + v10 - 2);
      v18 = *(__int16 *)((char *)v7 + v10);
      v19 = *(__int16 *)((char *)v7 + v10 + 2);
      *(_DWORD *)buf = 67110912;
      v36 = v12;
      v37 = 1024;
      v38 = v13;
      v39 = 1024;
      v40 = v14;
      v41 = 1024;
      v42 = v15;
      v43 = 1024;
      v44 = v16;
      v45 = 1024;
      v46 = v17;
      v47 = 1024;
      v48 = v18;
      v49 = 1024;
      v50 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%6d %6d %6d %6d ... %6d %6d %6d %6d]\n", buf, 0x32u);
    }
    v7 = (__int16 *)((char *)v7 + v9);
    --v11;
  }
  while (v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [...... ...... ...... ...... ... ...... ...... ...... ......]\n", buf, 2u);
  }
  v20 = (__int16 *)(a1 + 2 * (a3 + (uint64_t)a5 - 4) * v8 + 2 * v32);
  v21 = 2 * v31 - 4;
  v22 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *v20;
      v24 = v20[1];
      v25 = v20[2];
      v26 = v20[3];
      v27 = *(__int16 *)((char *)v20 + v21 - 4);
      v28 = *(__int16 *)((char *)v20 + v21 - 2);
      v29 = *(__int16 *)((char *)v20 + v21);
      v30 = *(__int16 *)((char *)v20 + v21 + 2);
      *(_DWORD *)buf = 67110912;
      v36 = v23;
      v37 = 1024;
      v38 = v24;
      v39 = 1024;
      v40 = v25;
      v41 = 1024;
      v42 = v26;
      v43 = 1024;
      v44 = v27;
      v45 = 1024;
      v46 = v28;
      v47 = 1024;
      v48 = v29;
      v49 = 1024;
      v50 = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%6d %6d %6d %6d ... %6d %6d %6d %6d]\n", buf, 0x32u);
    }
    v20 += v8;
    --v22;
  }
  while (v22);
}

void sub_100011EB0(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned __int8 *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;

  v8 = a6;
  v30 = a2;
  v9 = (unsigned __int8 *)(a1 + a6 * (uint64_t)a3 + a2);
  v10 = a4 - 2;
  v11 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *v9;
      v13 = v9[1];
      v14 = v9[2];
      v15 = v9[3];
      v16 = v9[v10 - 2];
      v17 = v9[v10 - 1];
      v18 = v9[v10];
      v19 = v9[v10 + 1];
      *(_DWORD *)buf = 67110912;
      v33 = v12;
      v34 = 1024;
      v35 = v13;
      v36 = 1024;
      v37 = v14;
      v38 = 1024;
      v39 = v15;
      v40 = 1024;
      v41 = v16;
      v42 = 1024;
      v43 = v17;
      v44 = 1024;
      v45 = v18;
      v46 = 1024;
      v47 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%3d %3d %3d %3d ... %3d %3d %3d %3d]\n", buf, 0x32u);
    }
    v9 += v8;
    --v11;
  }
  while (v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [... ... ... ... ... ... ... ... ...]\n", buf, 2u);
  }
  v20 = (unsigned __int8 *)(a1 + (a3 + (uint64_t)a5 - 4) * v8 + v30);
  v21 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *v20;
      v23 = v20[1];
      v24 = v20[2];
      v25 = v20[3];
      v26 = v20[v10 - 2];
      v27 = v20[v10 - 1];
      v28 = v20[v10];
      v29 = v20[v10 + 1];
      *(_DWORD *)buf = 67110912;
      v33 = v22;
      v34 = 1024;
      v35 = v23;
      v36 = 1024;
      v37 = v24;
      v38 = 1024;
      v39 = v25;
      v40 = 1024;
      v41 = v26;
      v42 = 1024;
      v43 = v27;
      v44 = 1024;
      v45 = v28;
      v46 = 1024;
      v47 = v29;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%3d %3d %3d %3d ... %3d %3d %3d %3d]\n", buf, 0x32u);
    }
    v20 += v8;
    --v21;
  }
  while (v21);
}

void sub_10001212C(int16x8_t *a1, int a2, int a3, _WORD *a4, char a5)
{
  int16x8_t *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int32x4_t v10;
  int16x8_t *v11;
  int16x8_t v12;
  unint64_t v15;
  unint64_t v16;
  int32x4_t v17;
  int16x8_t *v18;
  int16x8_t v19;
  float32x2_t v20;
  int v21;
  uint64_t v22;
  int v23;
  float32x2_t v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;

  v6 = a1;
  v7 = (a3 * a2);
  if ((a5 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 67109120;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: length = %d\n", (uint8_t *)&v29, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x = [\n", (uint8_t *)&v29, 2u);
    }
    sub_100011C10((uint64_t)v6, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v29,
        2u);
    }
    v15 = v7 & 0xFFFFFFF8;
    if ((int)v15 < 1)
    {
      v17 = 0uLL;
    }
    else
    {
      v16 = 0;
      v17 = 0uLL;
      v18 = v6;
      do
      {
        v19 = *v18++;
        v17 = vaddw_high_s16(vaddw_s16(v17, *(int16x4_t *)v19.i8), v19);
        v16 += 8;
      }
      while (v16 < v15);
    }
    v24 = vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v17, (int8x16_t)v17, 8uLL));
    v25 = (int)(float)(v24.f32[1] + (float)(int)v24.f32[0]);
    if ((int)v7 >= 1)
    {
      v26 = v7;
      do
      {
        v27 = v6->i16[0];
        v6 = (int16x8_t *)((char *)v6 + 2);
        v25 += v27;
        --v26;
      }
      while (v26);
    }
    v28 = v25 / (int)v7;
    *a4 = v25 / (int)v7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 67109120;
      v30 = (__int16)v28;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: mean(x) = %d\n", (uint8_t *)&v29, 8u);
    }
  }
  else
  {
    v8 = v7 & 0xFFFFFFF8;
    if ((int)v8 < 1)
    {
      v10 = 0uLL;
    }
    else
    {
      v9 = 0;
      v10 = 0uLL;
      v11 = a1;
      do
      {
        v12 = *v11++;
        v10 = vaddw_high_s16(vaddw_s16(v10, *(int16x4_t *)v12.i8), v12);
        v9 += 8;
      }
      while (v9 < v8);
    }
    v20 = vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v10, (int8x16_t)v10, 8uLL));
    v21 = (int)(float)(v20.f32[1] + (float)(int)v20.f32[0]);
    if ((int)v7 >= 1)
    {
      v22 = (a3 * a2);
      do
      {
        v23 = v6->i16[0];
        v6 = (int16x8_t *)((char *)v6 + 2);
        v21 += v23;
        --v22;
      }
      while (v22);
    }
    *a4 = v21 / (int)v7;
  }
}

void sub_1000123C8(void *__src, int a2, int a3, __int16 *a4, __int16 *a5, __int16 *a6, int16x8_t *__dst, char a8)
{
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  int16x8_t v20;
  int16x8_t *v21;
  int v22;
  unsigned int v23;
  unint64_t v24;
  unint64_t v25;
  int16x8_t v26;
  int16x8_t *v27;
  uint64_t v28;
  __int16 *v29;
  int v30;
  uint64_t v31;
  __int16 *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  __int16 v37;
  uint8_t buf[4];
  int v39;

  v16 = (a3 * a2);
  memcpy(__dst, __src, 2 * (int)v16);
  if ((a8 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: length = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *a4;
      *(_DWORD *)buf = 67109120;
      v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_mean = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x = [\n", buf, 2u);
    }
    sub_100011C10((uint64_t)__src, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    v23 = *a4;
    v24 = v16 & 0xFFFFFFF8;
    if ((int)v24 < 1)
    {
      LODWORD(v25) = 0;
    }
    else
    {
      v25 = 0;
      v26 = vdupq_n_s16(v23);
      v27 = __dst;
      do
      {
        *v27 = vabdq_s16(*v27, v26);
        ++v27;
        v25 += 8;
      }
      while (v25 < v24);
    }
    if ((int)v25 < (int)v16)
    {
      v31 = v16 - v25;
      v32 = &__dst->i16[v25];
      do
      {
        v33 = *v32 - v23;
        if (v33 < 0)
          LOWORD(v33) = v23 - *v32;
        *v32++ = v33;
        --v31;
      }
      while (v31);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: length = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: abs(x-mean(x)) = [\n", buf, 2u);
    }
    sub_100011C10((uint64_t)__dst, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    v17 = *a4;
    v18 = v16 & 0xFFFFFFF8;
    if ((int)v18 < 1)
    {
      LODWORD(v19) = 0;
    }
    else
    {
      v19 = 0;
      v20 = vdupq_n_s16(v17);
      v21 = __dst;
      do
      {
        *v21 = vabdq_s16(*v21, v20);
        ++v21;
        v19 += 8;
      }
      while (v19 < v18);
    }
    if ((int)v19 < (int)v16)
    {
      v28 = v16 - v19;
      v29 = &__dst->i16[v19];
      do
      {
        v30 = *v29 - v17;
        if (v30 < 0)
          LOWORD(v30) = v17 - *v29;
        *v29++ = v30;
        --v28;
      }
      while (v28);
    }
  }
  v37 = 0;
  sub_10001212C(__dst, a2, a3, &v37, a8);
  v34 = v37;
  *a5 = v37;
  *a6 = (5 * v34) >> 2;
  if ((a8 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v39 = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_tmp_mean = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *a5;
      *(_DWORD *)buf = 67109120;
      v39 = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_mad_mean = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *a6;
      *(_DWORD *)buf = 67109120;
      v39 = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_mad_sigma = %d\n", buf, 8u);
    }
  }
}

void sub_100012870(uint64_t a1, int a2, int a3, __int16 *a4, __int16 *a5, __int16 *a6, __int16 *a7, uint64_t a8, char a9)
{
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  unint64_t v14;
  int16x8_t v15;
  int16x8_t *v16;
  int8x16_t *v17;
  int16x8_t v18;
  int v25;
  int v26;
  int v27;
  int v28;
  signed int v29;
  unint64_t v30;
  unint64_t v31;
  int16x8_t v32;
  int16x8_t *v33;
  int8x16_t *v34;
  int16x8_t v35;
  uint64_t v36;
  _WORD *v37;
  __int16 *v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  _WORD *v42;
  __int16 *v43;
  int v44;
  __int16 v45;
  int v46;
  int v47;

  v11 = (a3 * a2);
  v12 = *a4 + (*a7 >> *a5);
  *a6 = v12;
  if ((a9 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 67109120;
      v47 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: length = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *a4;
      v46 = 67109120;
      v47 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_median = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *a5;
      v46 = 67109120;
      v47 = v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: noise_factor = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *a7;
      v46 = 67109120;
      v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_sigma = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *a6;
      v46 = 67109120;
      v47 = v28;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sft_thr = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x = [\n", (uint8_t *)&v46, 2u);
    }
    sub_100011C10(a1, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v46,
        2u);
    }
    v29 = *a6;
    v30 = v11 & 0xFFFFFFF8;
    if ((int)v30 < 1)
    {
      LODWORD(v31) = 0;
    }
    else
    {
      v31 = 0;
      v32 = vdupq_n_s16(v29);
      v33 = (int16x8_t *)a1;
      v34 = (int8x16_t *)a8;
      do
      {
        v35 = *v33++;
        *v34++ = vandq_s8((int8x16_t)vsubq_s16(v35, v32), (int8x16_t)vcgtq_s16(v35, v32));
        v31 += 8;
      }
      while (v31 < v30);
    }
    if ((int)v31 < (int)v11)
    {
      v41 = v11 - v31;
      v42 = (_WORD *)(a8 + 2 * v31);
      v43 = (__int16 *)(a1 + 2 * v31);
      do
      {
        v44 = *v43++;
        v45 = v44 - v29;
        if (v44 <= v29)
          v45 = 0;
        *v42++ = v45;
        --v41;
      }
      while (v41);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 67109120;
      v47 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: length = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_th = [\n", (uint8_t *)&v46, 2u);
    }
    sub_100011C10(a8, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v46,
        2u);
    }
  }
  else
  {
    v13 = v11 & 0xFFFFFFF8;
    if ((int)v13 < 1)
    {
      LODWORD(v14) = 0;
    }
    else
    {
      v14 = 0;
      v15 = vdupq_n_s16(v12);
      v16 = (int16x8_t *)a1;
      v17 = (int8x16_t *)a8;
      do
      {
        v18 = *v16++;
        *v17++ = vandq_s8((int8x16_t)vsubq_s16(v18, v15), (int8x16_t)vcgtq_s16(v18, v15));
        v14 += 8;
      }
      while (v14 < v13);
    }
    if ((int)v14 < (int)v11)
    {
      v36 = v11 - v14;
      v37 = (_WORD *)(a8 + 2 * v14);
      v38 = (__int16 *)(a1 + 2 * v14);
      do
      {
        v39 = *v38++;
        v40 = v39 - v12;
        if (v39 <= v12)
          v40 = 0;
        *v37++ = v40;
        --v36;
      }
      while (v36);
    }
  }
}

void sub_100012D08(uint64_t a1, int a2, int a3, int *a4, uint64_t a5, int a6, const __int16 *a7, char a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __int16 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int16x8_t v27;
  unint64_t v28;
  int16x8_t *v29;
  int16x8_t v30;
  unsigned int v31;
  __int16 v32;
  uint64_t v33;
  const __int16 *v34;
  __int16 v35;
  int v36;
  int v37;
  int v38;
  int v39;
  __int16 v40[8];
  uint8_t buf[16];

  v11 = *a4;
  if (a3 - (int)v11 + 1 >= 0)
  {
    v12 = 0;
    v13 = 0;
    v14 = (v11 * v11);
    v15 = v14 & 0x7FFFFFF8;
    v16 = a2 - (int)v11 + 1;
    v17 = a6;
    v18 = 2 * v11;
    do
    {
      v19 = v13 + v11;
      if ((v16 & 0x80000000) == 0)
      {
        v20 = 0;
        v21 = 0;
        v22 = a1;
        do
        {
          if ((int)v11 >= 1)
          {
            v23 = a7;
            v24 = v22;
            v25 = v13;
            do
            {
              v26 = 0;
              do
              {
                v23[v26] = *(_WORD *)(v24 + 2 * v26);
                ++v26;
              }
              while (v21 + v26 < v21 + v11);
              ++v25;
              v24 += 2 * a2;
              v23 = (const __int16 *)((char *)v23 + v18);
            }
            while (v25 < v19);
          }
          v27 = vld1q_dup_s16(a7);
          if ((_DWORD)v15)
          {
            v28 = 0;
            v29 = (int16x8_t *)a7;
            do
            {
              v30 = *v29++;
              v27 = vmaxq_s16(v30, v27);
              v28 += 8;
            }
            while (v28 < v15);
            v31 = ((v15 - 1) & 0xFFFFFFF8) + 8;
          }
          else
          {
            v31 = 0;
          }
          v32 = vmaxv_s16(vmax_s16(*(int16x4_t *)v27.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL)));
          if ((int)v31 < (int)v14)
          {
            v33 = v14 - v31;
            v34 = &a7[v31];
            do
            {
              v36 = *v34++;
              v35 = v36;
              if (v32 <= v36)
                v32 = v35;
              --v33;
            }
            while (v33);
          }
          *(_WORD *)(a5 + 2 * (v20 + v12 * v17)) = v32;
          ++v20;
          v21 += v11;
          v22 += v18;
        }
        while (v21 <= v16);
      }
      ++v12;
      a1 += 2 * (int)v11 * (uint64_t)a2;
      v13 += v11;
    }
    while (v19 <= (a3 - v11 + 1));
  }
  if ((a8 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: xmax = [\n", buf, 2u);
    }
    if (a2 >= 0)
      v37 = a2;
    else
      v37 = a2 + 1;
    v38 = v37 >> 1;
    if (a3 >= 0)
      v39 = a3;
    else
      v39 = a3 + 1;
    sub_100011C10(a5, 0, 0, v38, v39 >> 1, v38);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v40[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)v40,
        2u);
    }
  }
}

void sub_100012F48(int16x8_t *a1, int a2, int a3, float *a4, char a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int8x16_t v8;
  int16x8_t *v9;
  int32x4_t v10;
  int32x4_t v11;
  int16x8_t v12;
  uint16x8_t v13;
  uint16x8_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 *v18;
  int v19;
  int v20;
  float v21;
  int v22;
  double v23;

  v5 = (a3 * a2);
  v6 = v5 & 0xFFFFFFF8;
  if ((int)v6 < 1)
  {
    LODWORD(v7) = 0;
    v11 = 0uLL;
    v10 = 0uLL;
  }
  else
  {
    v7 = 0;
    v8.i64[0] = 0x1000100010001;
    v8.i64[1] = 0x1000100010001;
    v9 = a1;
    v10 = 0uLL;
    v11 = 0uLL;
    do
    {
      v12 = *v9++;
      v13 = (uint16x8_t)vmaxq_s16(v12, (int16x8_t)0);
      v14 = (uint16x8_t)vandq_s8((int8x16_t)vcgtzq_s16(v12), v8);
      v10 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v10, *(uint16x4_t *)v13.i8), v13);
      v11 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v11, *(uint16x4_t *)v14.i8), v14);
      v7 += 8;
    }
    while (v7 < v6);
  }
  v15 = vaddvq_s32(v10);
  v16 = vaddvq_s32(v11);
  if ((int)v7 < (int)v5)
  {
    v17 = v5 - v7;
    v18 = &a1->i16[v7];
    do
    {
      v20 = *v18++;
      v19 = v20;
      if (v20 > 0)
        ++v16;
      v15 += v19 & ~(v19 >> 31);
      --v17;
    }
    while (v17);
  }
  v21 = (float)((float)v15 * 0.0625) / (float)v16;
  *a4 = v21;
  if ((a5 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134217984;
    v23 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sharpness = %f\n", (uint8_t *)&v22, 0xCu);
  }
}

double sub_1000130A4(int16x8_t *a1, int16x8_t *a2, int a3, int a4, float *a5, float *a6, float *a7, char a8)
{
  uint64_t v10;
  signed int v11;
  unint64_t v12;
  unint64_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int8x16_t v16;
  int16x8_t *v17;
  int16x8_t *v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  int v34;
  int32x4_t v35;
  int v36;
  float v37;
  uint64_t v38;
  __int16 *v39;
  __int16 *v40;
  int v41;
  float v42;
  int v43;
  int v44;
  float v45;
  float v46;
  __int32 v47;
  float32x2_t v48;
  uint64_t v49;
  double v50;
  double v51;
  __int32 v53;
  _BYTE buf[24];

  v10 = (a4 * a3);
  v11 = (int)*a5;
  v12 = v10 & 0xFFFFFFF8;
  if ((int)v12 < 1)
  {
    LODWORD(v13) = 0;
    v21 = 0uLL;
    v20 = 0uLL;
    v19 = 0uLL;
    v15 = 0uLL;
  }
  else
  {
    v13 = 0;
    v14 = vdupq_n_s16(v11);
    v15 = 0uLL;
    v16.i64[0] = 0x2000200020002;
    v16.i64[1] = 0x2000200020002;
    v17 = a1;
    v18 = a2;
    v19 = 0uLL;
    v20 = 0uLL;
    v21 = 0uLL;
    do
    {
      v22 = *v17++;
      v23 = v22;
      v24 = *v18++;
      v25 = vshrq_n_s16(v23, 4uLL);
      v26 = vshrq_n_s16(v24, 4uLL);
      v27 = vcgtq_s16(vmaxq_s16(v25, v26), v14);
      v15 = vsubq_s16(v15, v27);
      v19 = vsubq_s16(v19, (int16x8_t)vandq_s8((int8x16_t)v27, (int8x16_t)vcgtq_s16(v25, v26)));
      v28 = (int16x8_t)vandq_s8((int8x16_t)v27, vandq_s8((int8x16_t)vcgtq_s16(v26, v25), v16));
      v20 = vaddq_s16(v28, v20);
      v21 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v28, (int8x16_t)vcgtq_s16(v14, v25)), v21);
      v13 += 8;
    }
    while (v13 < v12);
  }
  v29 = (int8x16_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v15.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v15, (int8x16_t)v15, 8uLL)));
  v30 = (int8x16_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v19.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v19, (int8x16_t)v19, 8uLL)));
  v31 = (int32x2_t)vand_s8((int8x8_t)vzip1_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL);
  v32 = (int32x2_t)vand_s8((int8x8_t)vzip2_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL);
  v29.i64[0] = vextq_s8(v29, v29, 8uLL).u64[0];
  v30.i64[0] = vextq_s8(v30, v30, 8uLL).u64[0];
  v33 = vadd_s32(vadd_s32(vadd_s32(v32, v31), (int32x2_t)vand_s8((int8x8_t)vzip1_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL)), (int32x2_t)vand_s8((int8x8_t)vzip2_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL));
  v34 = vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v20.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL))));
  v35 = (int32x4_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v21.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL)));
  v36 = vaddvq_s32(v35);
  if ((int)v13 < (int)v10)
  {
    v37 = (float)v11;
    v38 = v10 - v13;
    v39 = &a2->i16[v13];
    v40 = &a1->i16[v13];
    do
    {
      v41 = *v40++;
      v42 = (float)(v41 >> 4);
      v43 = *v39++;
      v44 = v43 >> 4;
      v45 = (float)(v43 >> 4);
      if (v45 <= v42)
        v46 = v42;
      else
        v46 = (float)v44;
      if (v46 > v37)
      {
        v33 = vadd_s32(v33, (int32x2_t)((v42 > v45) | 0x100000000));
        if (v45 > v42)
        {
          v34 += 2;
          if (v42 < v37)
            v36 += 2;
        }
      }
      --v38;
    }
    while (v38);
  }
  v47 = v33.i32[1];
  if (v33.i32[1])
  {
    v48 = vcvt_f32_s32(v33);
    *(float32x2_t *)v35.i8 = vdiv_f32(v48, (float32x2_t)vdup_lane_s32((int32x2_t)v48, 1));
  }
  else
  {
    v35.i32[0] = 0;
  }
  *a6 = *(float *)v35.i32;
  if (v34)
    *(float *)v35.i32 = (float)v36 / (float)v34;
  else
    v35.i32[0] = 1.0;
  *a7 = *(float *)v35.i32;
  if ((a8 & 1) != 0)
  {
    v53 = v33.i32[0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v47;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nedge      = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v49) = 67109120;
      HIDWORD(v49) = v53;
      *(_QWORD *)buf = v49;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nda        = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nrg        = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nbrg       = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v50 = *a6;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v50;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurConf   = %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v51 = *a7;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v51;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurExtent = %f\n", buf, 0xCu);
    }
  }
  return *(double *)v35.i64;
}

void sub_1000134A8(int16x8_t *a1, int16x8_t *a2, int16x8_t *a3, int a4, int a5, uint64_t a6, char a7)
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int16x8_t *v13;
  int16x8_t *v14;
  int16x8_t *v15;
  int16x8_t *v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int32x4_t v23;
  int32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  uint64_t v30;
  _WORD *v31;
  __int16 *v32;
  __int16 *v33;
  __int16 *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;

  v10 = (a5 * a4);
  v11 = v10 & 0xFFFFFFF8;
  if ((int)v11 < 1)
  {
    LODWORD(v12) = 0;
  }
  else
  {
    v12 = 0;
    v13 = a1;
    v14 = a2;
    v15 = a3;
    v16 = (int16x8_t *)a6;
    do
    {
      v17 = *v13++;
      v18 = v17;
      v19 = *v14++;
      v20 = v19;
      v21 = *v15++;
      v22 = v21;
      v23 = vmull_s16(*(int16x4_t *)v20.i8, *(int16x4_t *)v20.i8);
      v24 = vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v20, v20), v18, v18), v22, v22);
      v25 = vcvtq_f32_s32(vmlal_s16(vmlal_s16(v23, *(int16x4_t *)v18.i8, *(int16x4_t *)v18.i8), *(int16x4_t *)v22.i8, *(int16x4_t *)v22.i8));
      v26 = vrsqrteq_f32(v25);
      v27 = vcvtq_f32_s32(v24);
      v28 = vmulq_f32(vmulq_f32(v26, vrsqrtsq_f32(vmulq_f32(v26, v25), v26)), v25);
      v29 = vrsqrteq_f32(v27);
      *v16++ = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(v28), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vmulq_f32(v29, vrsqrtsq_f32(vmulq_f32(v29, v27), v29)), v27)));
      v12 += 8;
    }
    while (v12 < v11);
  }
  if ((int)v12 < (int)v10)
  {
    v30 = v10 - v12;
    v31 = (_WORD *)(a6 + 2 * v12);
    v32 = &a3->i16[v12];
    v33 = &a2->i16[v12];
    v34 = &a1->i16[v12];
    do
    {
      v35 = *v34++;
      v36 = v35 * v35;
      v37 = *v33++;
      v38 = v36 + v37 * v37;
      v39 = *v32++;
      *v31++ = (int)sqrt((double)(v38 + v39 * v39));
      --v30;
    }
    while (v30);
  }
  if ((a7 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: calcEmap\n", (uint8_t *)&v40, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 67109120;
      v41 = a5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height=%d\n", (uint8_t *)&v40, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 67109120;
      v41 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width=%d\n", (uint8_t *)&v40, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: emap = [\n", (uint8_t *)&v40, 2u);
    }
    sub_100011C10(a6, 0, 0, a4, a5, a4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v40,
        2u);
    }
  }
}

void sub_100013764(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int16x8_t *__src, int16x8_t *a9, char a10)
{
  int16x8_t *v10;
  int16x8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int16x8_t *v19;
  uint64_t v20;
  uint64_t v21;
  const __int16 *v22;
  int16x8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int16x8_t *v27;
  uint64_t v28;
  uint64_t v29;
  const __int16 *v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int16x8_t *v39;
  int16x8_t *v40;
  int16x8_t v41;
  uint64_t v42;
  char *v43;
  __int16 *v44;
  __int16 v45;
  unint64_t v46;
  int16x8_t *v47;
  int16x8_t *v48;
  int16x8_t v49;
  unint64_t v50;
  int16x8_t *v51;
  int16x8_t *v52;
  int16x8_t v53;
  uint64_t v54;
  char *v55;
  __int16 *v56;
  int v57;
  uint64_t v58;
  char *v59;
  __int16 *v60;
  int v61;
  uint64_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int16x8_t *v73;
  int16x8_t *v74;
  int16x8_t v75;
  uint64_t v76;
  __int16 *v77;
  _WORD *v78;
  __int16 v79;
  unint64_t v80;
  int16x8_t *v81;
  int16x8_t *v82;
  int16x8_t v83;
  unint64_t v84;
  int16x8_t *v85;
  int16x8_t *v86;
  int16x8_t v87;
  uint64_t v88;
  __int16 *v89;
  _WORD *v90;
  __int16 v91;
  uint64_t v92;
  __int16 *v93;
  _WORD *v94;
  __int16 v95;
  uint64_t v96;
  int v97;
  int v98;
  unint64_t v99;
  int16x8_t *v100;
  int16x8_t *v101;
  int16x8_t v102;
  uint64_t v103;
  __int16 *v104;
  _WORD *v105;
  __int16 v106;
  unint64_t v107;
  int16x8_t *v108;
  int16x8_t *v109;
  int16x8_t v110;
  unint64_t v111;
  int16x8_t *v112;
  int16x8_t *v113;
  int16x8_t v114;
  uint64_t v115;
  _WORD *v116;
  __int16 *v117;
  int v118;
  uint64_t v119;
  _WORD *v120;
  __int16 *v121;
  int v122;
  uint64_t v124;
  uint8_t buf[4];
  int v128;
  int16x4x2_t v129;
  int16x4x2_t v130;

  v10 = __src;
  v15 = a9;
  if ((a10 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: hlwt2\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height=%d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width=%d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: img_data = [\n", buf, 2u);
    }
    sub_100011C10(a1, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if (a3 >= 1)
    {
      v24 = 0;
      v25 = (int)(a2 & 0xFFFFFFF8);
      v26 = 2 * (a2 >> 1);
      v27 = v10;
      v28 = (uint64_t)a9;
      do
      {
        if ((int)v25 < 1)
        {
          v29 = 0;
        }
        else
        {
          v29 = 0;
          v30 = (const __int16 *)a1;
          do
          {
            v130 = vld2_s16(v30);
            v30 += 8;
            *(uint64_t *)((char *)v27->i64 + v29) = (uint64_t)v130.val[0];
            *(int16x4_t *)(v28 + v29) = v130.val[1];
            v29 += 8;
          }
          while (v29 < v25);
          v29 = v29;
        }
        if ((int)v29 < a2)
        {
          do
          {
            if ((v29 & 1) != 0)
              v31 = (uint64_t)a9;
            else
              v31 = (uint64_t)v10;
            *(_WORD *)(v31 + 2 * (int)((int)v24 * a2 / 2 + (v29 >> 1))) = *(_WORD *)(a1 + 2 * v29);
            ++v29;
          }
          while (a2 != v29);
        }
        ++v24;
        v28 += v26;
        v27 = (int16x8_t *)((char *)v27 + v26);
        a1 += 2 * a2;
      }
      while (v24 != a3);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Splitting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: L = [\n", buf, 2u);
    }
    if (a2 >= 0)
      v32 = a2;
    else
      v32 = a2 + 1;
    sub_100011C10((uint64_t)v10, 0, 0, v32 >> 1, a3, v32 >> 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if (a3 < 1)
      goto LABEL_60;
    v16 = 0;
    v17 = (int)(a2 & 0xFFFFFFF8);
    v18 = 2 * (a2 >> 1);
    v19 = __src;
    v20 = (uint64_t)a9;
    do
    {
      if ((int)v17 < 1)
      {
        v21 = 0;
      }
      else
      {
        v21 = 0;
        v22 = (const __int16 *)a1;
        do
        {
          v129 = vld2_s16(v22);
          v22 += 8;
          *(uint64_t *)((char *)v19->i64 + v21) = (uint64_t)v129.val[0];
          *(int16x4_t *)(v20 + v21) = v129.val[1];
          v21 += 8;
        }
        while (v21 < v17);
        v21 = v21;
      }
      if ((int)v21 < a2)
      {
        do
        {
          if ((v21 & 1) != 0)
            v23 = a9;
          else
            v23 = __src;
          v23->i16[(int)v16 * a2 / 2 + (v21 >> 1)] = *(_WORD *)(a1 + 2 * v21);
          ++v21;
        }
        while (a2 != v21);
      }
      ++v16;
      v20 += v18;
      v19 = (int16x8_t *)((char *)v19 + v18);
      a1 += 2 * a2;
    }
    while (v16 != a3);
  }
  if ((a10 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: H = [\n", buf, 2u);
    }
    if (a2 >= 0)
      v33 = a2;
    else
      v33 = a2 + 1;
    sub_100011C10((uint64_t)a9, 0, 0, v33 >> 1, a3, v33 >> 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
LABEL_60:
  if (a2 >= 0)
    v34 = a2;
  else
    v34 = a2 + 1;
  v35 = v34 >> 1;
  v36 = ((v34 >> 1) * a3);
  v37 = v36 & 0xFFFFFFF8;
  if ((int)v37 < 1)
  {
    LODWORD(v38) = 0;
  }
  else
  {
    v38 = 0;
    v39 = a9;
    v40 = v10;
    do
    {
      v41 = *v40++;
      *v39 = vsubq_s16(*v39, v41);
      ++v39;
      v38 += 8;
    }
    while (v38 < v37);
  }
  if ((int)v38 < (int)v36)
  {
    v42 = v36 - v38;
    v43 = &v10->i8[2 * v38];
    v44 = &a9->i16[v38];
    do
    {
      v45 = *(_WORD *)v43;
      v43 += 2;
      *v44++ -= v45;
      --v42;
    }
    while (v42);
  }
  if ((a10 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Lifting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: H = [\n", buf, 2u);
    }
    sub_100011C10((uint64_t)a9, 0, 0, v35, a3, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if ((int)v37 < 1)
    {
      LODWORD(v50) = 0;
    }
    else
    {
      v50 = 0;
      v51 = a9;
      v52 = v10;
      do
      {
        v53 = vshrq_n_s16(*v51, 1uLL);
        *v52 = vsraq_n_s16(*v52, *v51, 1uLL);
        ++v52;
        *v51++ = v53;
        v50 += 8;
      }
      while (v50 < v37);
    }
    if ((int)v50 < (int)v36)
    {
      v58 = v36 - v50;
      v59 = &v10->i8[2 * v50];
      v60 = &a9->i16[v50];
      do
      {
        v61 = *v60;
        *v60++ >>= 1;
        *(_WORD *)v59 += v61 >> 1;
        v59 += 2;
        --v58;
      }
      while (v58);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: L = [\n", buf, 2u);
    }
    sub_100011C10((uint64_t)v10, 0, 0, v35, a3, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if ((int)v37 < 1)
    {
      LODWORD(v46) = 0;
    }
    else
    {
      v46 = 0;
      v47 = a9;
      v48 = v10;
      do
      {
        v49 = vshrq_n_s16(*v47, 1uLL);
        *v48 = vsraq_n_s16(*v48, *v47, 1uLL);
        ++v48;
        *v47++ = v49;
        v46 += 8;
      }
      while (v46 < v37);
    }
    if ((int)v46 < (int)v36)
    {
      v54 = v36 - v46;
      v55 = &v10->i8[2 * v46];
      v56 = &a9->i16[v46];
      do
      {
        v57 = *v56;
        *v56++ >>= 1;
        *(_WORD *)v55 += v57 >> 1;
        v55 += 2;
        --v54;
      }
      while (v54);
    }
  }
  if (a3 < 1)
  {
    v65 = a3;
    v64 = 0;
    v63 = 0;
  }
  else
  {
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v65 = a3;
    do
    {
      if ((v62 & 1) != 0)
      {
        memcpy((void *)(a5 + 2 * v63 * v35), v10, 2 * v35);
        ++v63;
      }
      else
      {
        memcpy((void *)(a4 + 2 * v64 * v35), v10, 2 * v35);
        ++v64;
      }
      ++v62;
      v10 = (int16x8_t *)((char *)v10 + 2 * v35);
    }
    while (a3 != v62);
  }
  if ((a10 & 1) != 0)
  {
    v66 = v65;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Splitting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v64;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a = [\n", buf, 2u);
    }
    if (v65 >= 0)
      v69 = v65;
    else
      v69 = v65 + 1;
    v68 = v69 >> 1;
    sub_100011C10(a4, 0, 0, v35, v69 >> 1, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h = [\n", buf, 2u);
    }
    sub_100011C10(a5, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    v63 = 0;
    v66 = v65;
    if (v65 >= 0)
      v67 = v65;
    else
      v67 = v65 + 1;
    v68 = v67 >> 1;
  }
  v70 = (v68 * v35);
  v71 = v70 & 0xFFFFFFF8;
  if ((int)v71 < 1)
  {
    LODWORD(v72) = 0;
  }
  else
  {
    v72 = 0;
    v73 = (int16x8_t *)a5;
    v74 = (int16x8_t *)a4;
    do
    {
      v75 = *v74++;
      *v73 = vsubq_s16(*v73, v75);
      ++v73;
      v72 += 8;
    }
    while (v72 < v71);
  }
  if ((int)v72 < (int)v70)
  {
    v76 = v70 - v72;
    v77 = (__int16 *)(a4 + 2 * v72);
    v78 = (_WORD *)(a5 + 2 * v72);
    do
    {
      v79 = *v77++;
      *v78++ -= v79;
      --v76;
    }
    while (v76);
  }
  if ((a10 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Lifting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h = [\n", buf, 2u);
    }
    sub_100011C10(a5, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if ((int)v71 < 1)
    {
      LODWORD(v84) = 0;
    }
    else
    {
      v84 = 0;
      v85 = (int16x8_t *)a4;
      v86 = (int16x8_t *)a5;
      do
      {
        v87 = *v86++;
        *v85 = vaddq_s16(vaddq_s16(*v85, *v85), v87);
        ++v85;
        v84 += 8;
      }
      while (v84 < v71);
    }
    if ((int)v84 < (int)v70)
    {
      v92 = v70 - v84;
      v93 = (__int16 *)(a5 + 2 * v84);
      v94 = (_WORD *)(a4 + 2 * v84);
      do
      {
        v95 = *v93++;
        *v94 = v95 + 2 * *v94;
        ++v94;
        --v92;
      }
      while (v92);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a = [\n", buf, 2u);
    }
    sub_100011C10(a4, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if ((int)v71 < 1)
    {
      LODWORD(v80) = 0;
    }
    else
    {
      v80 = 0;
      v81 = (int16x8_t *)a4;
      v82 = (int16x8_t *)a5;
      do
      {
        v83 = *v82++;
        *v81 = vaddq_s16(vaddq_s16(*v81, *v81), v83);
        ++v81;
        v80 += 8;
      }
      while (v80 < v71);
    }
    if ((int)v80 < (int)v70)
    {
      v88 = v70 - v80;
      v89 = (__int16 *)(a5 + 2 * v80);
      v90 = (_WORD *)(a4 + 2 * v80);
      do
      {
        v91 = *v89++;
        *v90 = v91 + 2 * *v90;
        ++v90;
        --v88;
      }
      while (v88);
    }
  }
  v124 = (v68 * v35);
  if (v66 < 1)
  {
    v98 = 0;
    v97 = 0;
  }
  else
  {
    v96 = 0;
    v97 = 0;
    v98 = 0;
    do
    {
      if ((v96 & 1) != 0)
      {
        memcpy((void *)(a7 + 2 * v97 * v35), v15, 2 * v35);
        ++v97;
      }
      else
      {
        memcpy((void *)(a6 + 2 * v98 * v35), v15, 2 * v35);
        ++v98;
      }
      ++v96;
      v15 = (int16x8_t *)((char *)v15 + 2 * v35);
    }
    while (v66 != v96);
  }
  if ((a10 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Splitting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v98;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v = [\n", buf, 2u);
    }
    sub_100011C10(a6, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v97;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d = [\n", buf, 2u);
    }
    sub_100011C10(a7, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    v63 = v97;
  }
  if ((int)v71 < 1)
  {
    LODWORD(v99) = 0;
  }
  else
  {
    v99 = 0;
    v101 = (int16x8_t *)a6;
    v100 = (int16x8_t *)a7;
    do
    {
      v102 = *v101++;
      *v100 = vsubq_s16(*v100, v102);
      ++v100;
      v99 += 8;
    }
    while (v99 < v71);
  }
  if ((int)v99 < (int)v124)
  {
    v103 = v124 - v99;
    v104 = (__int16 *)(a6 + 2 * v99);
    v105 = (_WORD *)(a7 + 2 * v99);
    do
    {
      v106 = *v104++;
      *v105++ -= v106;
      --v103;
    }
    while (v103);
  }
  if ((a10 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Lifting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d = [\n", buf, 2u);
    }
    sub_100011C10(a7, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if ((int)v71 < 1)
    {
      LODWORD(v111) = 0;
    }
    else
    {
      v111 = 0;
      v113 = (int16x8_t *)a6;
      v112 = (int16x8_t *)a7;
      do
      {
        v114 = vshrq_n_s16(*v112, 1uLL);
        *v113 = vsraq_n_s16(*v113, *v112, 1uLL);
        ++v113;
        *v112++ = v114;
        v111 += 8;
      }
      while (v111 < v71);
    }
    if ((int)v111 < (int)v124)
    {
      v119 = v124 - v111;
      v120 = (_WORD *)(a6 + 2 * v111);
      v121 = (__int16 *)(a7 + 2 * v111);
      do
      {
        v122 = *v121;
        *v121++ >>= 1;
        *v120++ += v122 >> 1;
        --v119;
      }
      while (v119);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v = [\n", buf, 2u);
    }
    sub_100011C10(a6, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if ((int)v71 < 1)
    {
      LODWORD(v107) = 0;
    }
    else
    {
      v107 = 0;
      v109 = (int16x8_t *)a6;
      v108 = (int16x8_t *)a7;
      do
      {
        v110 = vshrq_n_s16(*v108, 1uLL);
        *v109 = vsraq_n_s16(*v109, *v108, 1uLL);
        ++v109;
        *v108++ = v110;
        v107 += 8;
      }
      while (v107 < v71);
    }
    if ((int)v107 < (int)v124)
    {
      v115 = v124 - v107;
      v116 = (_WORD *)(a6 + 2 * v107);
      v117 = (__int16 *)(a7 + 2 * v107);
      do
      {
        v118 = *v117;
        *v117++ >>= 1;
        *v116++ += v118 >> 1;
        --v115;
      }
      while (v115);
    }
  }
  if ((a10 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d = [\n", buf, 2u);
    }
    sub_100011C10(a7, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
}

void sub_100014F00(int *a1, uint64_t a2)
{
  _DWORD *v2;
  int v3;
  int v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  double v10;
  _DWORD *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned __int8 *v16;
  _DWORD *v17;
  uint64_t v18;
  _DWORD *v19;
  unsigned __int8 *v20;
  unsigned int *v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  unsigned __int8 *v32;
  unsigned __int8 *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  _DWORD *v43;
  unsigned __int8 *v44;
  int v45;
  unsigned __int8 *v46;
  uint64_t v47;
  char v48;
  _DWORD *v49;
  int v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  int v63;
  uint64_t v64;
  _WORD *v65;
  unsigned __int8 *v66;
  uint64_t v67;
  _WORD *v68;
  unsigned __int8 *v69;
  __int16 v70;
  unsigned __int8 *v71;
  int v72;
  int v73;
  unsigned __int8 *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  float *v80;
  uint64_t v81;
  float *v82;
  float *v83;
  float *v84;
  const char *v85;
  uint64_t v86;
  float *v87;
  double v88;
  uint64_t v89;
  float *v90;
  double v91;
  uint64_t v92;
  float *v93;
  double v94;
  uint64_t v95;
  float *v96;
  double v97;
  int v98;
  _DWORD *v99;
  _DWORD *v100;
  unsigned __int8 *v101;
  uint64_t v102;
  char *__dst;
  char v104;
  int16x8_t *v105;
  int16x8_t *v106;
  const __int16 *v107;
  uint64_t v108;
  _DWORD *v109;
  float *v110;
  float *v111;
  uint64_t v112;
  int *v113;
  uint64_t v114;
  int16x8_t *v115;
  int16x8_t *v116;
  int16x8_t *v117;
  uint64_t v118;
  int16x8_t *v119;
  uint64_t v120;
  _DWORD *v121;
  uint64_t v122;
  unsigned __int8 *v123;
  uint64_t v124;
  int16x8_t *v125;
  int16x8_t *v126;
  int16x8_t *v127;
  int16x8_t *v128;
  int16x8_t *v129;
  int16x8_t *v130;
  int v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  int16x8_t *__src;
  unsigned __int8 *v136;
  int v137;
  unsigned int *v138;
  int v139;
  unsigned int *v140;
  int v141;
  int v142;
  uint64_t v143;
  float v144;
  __int16 v145;
  __int16 v146;
  int v147;
  __int16 v148;
  float v149;
  int v150;
  __int16 v151;
  __int16 v152;
  __int16 v153;
  int v154;
  __int16 v155;
  uint8_t buf[4];
  _BYTE v157[10];
  double v158;
  _BYTE v159[6];
  _BYTE v160[6];
  _BYTE v161[6];
  _BYTE v162[6];
  _DWORD v163[4];

  if (!a1)
    sub_10001E448();
  v2 = a1;
  v3 = *a1;
  if (*a1 == 1)
  {
    v136 = (unsigned __int8 *)(a1 + 1144);
    v101 = (unsigned __int8 *)(a1 + 2531);
    v104 = *((_BYTE *)a1 + 4608);
    if ((v104 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v2[4];
        v6 = v2[1169];
        v7 = v2[1170];
        v8 = v2[1153];
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v157 = v5;
        *(_WORD *)&v157[4] = 1024;
        *(_DWORD *)&v157[6] = v6;
        LOWORD(v158) = 1024;
        *(_DWORD *)((char *)&v158 + 2) = v7;
        HIWORD(v158) = 1024;
        *(_DWORD *)v159 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: #%08d (%4d x %4d) inputCount = %d\n", buf, 0x1Au);
      }
      if (v2[1153])
      {
        v9 = 0;
        do
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(double *)(a2 + 8 * v9);
            v11 = &v2[5 * v9];
            v12 = *((unsigned __int8 *)v11 + 4616);
            v13 = v11[1155];
            v14 = v11[1156];
            v15 = v11[1158];
            LODWORD(v11) = v11[1157];
            *(_DWORD *)buf = 134219520;
            *(_QWORD *)v157 = v9;
            *(_WORD *)&v157[8] = 2048;
            v158 = v10;
            *(_WORD *)v159 = 1024;
            *(_DWORD *)&v159[2] = v12;
            *(_WORD *)v160 = 1024;
            *(_DWORD *)&v160[2] = v13;
            *(_WORD *)v161 = 1024;
            *(_DWORD *)&v161[2] = v14;
            *(_WORD *)v162 = 1024;
            *(_DWORD *)&v162[2] = v15;
            LOWORD(v163[0]) = 1024;
            *(_DWORD *)((char *)v163 + 2) = (_DWORD)v11;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: input[%zu] = %p (level = %d) %d x %d, stride = %d, size = %d\n", buf, 0x34u);
          }
          v16 = *(unsigned __int8 **)(a2 + 8 * v9);
          if (v16)
          {
            v17 = &v2[5 * v9];
            v18 = v17[1155];
            if ((_DWORD)v18)
            {
              v19 = &v2[5 * v9];
              if (v19[1156])
              {
                v140 = v17 + 1155;
                v138 = v19 + 1156;
                v20 = &v16[v18 - 1];
                v21 = &v2[5 * v9 + 1158];
                v22 = 4;
                do
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v23 = *v16;
                    v24 = v16[1];
                    v25 = v16[2];
                    v26 = v16[3];
                    v27 = *(v20 - 3);
                    v28 = *(v20 - 2);
                    v29 = *(v20 - 1);
                    v30 = *v20;
                    *(_DWORD *)buf = 67110912;
                    *(_DWORD *)v157 = v23;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v24;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = v25;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)v159 = v26;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)v160 = v27;
                    *(_WORD *)&v160[4] = 1024;
                    *(_DWORD *)v161 = v28;
                    *(_WORD *)&v161[4] = 1024;
                    *(_DWORD *)v162 = v29;
                    *(_WORD *)&v162[4] = 1024;
                    v163[0] = v30;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: %3d %3d %3d %3d ... %3d %3d %3d %3d\n", buf, 0x32u);
                  }
                  v31 = *v21;
                  v16 += v31;
                  v20 += v31;
                  --v22;
                }
                while (v22);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ... ... ... ... ... ... ... ... ...\n", buf, 2u);
                  v31 = *v21;
                }
                v32 = (unsigned __int8 *)(*(_QWORD *)(a2 + 8 * v9) + (*v138 - 4) * v31);
                v33 = &v32[*v140 - 1];
                v34 = 4;
                do
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v35 = *v32;
                    v36 = v32[1];
                    v37 = v32[2];
                    v38 = v32[3];
                    v39 = *(v33 - 3);
                    v40 = *(v33 - 2);
                    v41 = *(v33 - 1);
                    v42 = *v33;
                    *(_DWORD *)buf = 67110912;
                    *(_DWORD *)v157 = v35;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v36;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = v37;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)v159 = v38;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)v160 = v39;
                    *(_WORD *)&v160[4] = 1024;
                    *(_DWORD *)v161 = v40;
                    *(_WORD *)&v161[4] = 1024;
                    *(_DWORD *)v162 = v41;
                    *(_WORD *)&v162[4] = 1024;
                    v163[0] = v42;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: %3d %3d %3d %3d ... %3d %3d %3d %3d\n", buf, 0x32u);
                    v31 = *v21;
                  }
                  v32 += v31;
                  v33 += v31;
                  --v34;
                }
                while (v34);
              }
            }
          }
          ++v9;
        }
        while (v9 < v2[1153]);
      }
    }
    v114 = a2;
    v43 = v2 + 40;
    v44 = v136;
    v45 = *v136;
    v111 = (float *)(v2 + 1171);
    bzero(v2 + 1171, 0x400uLL);
    v100 = v2 + 1427;
    memcpy(v2 + 1427, v2 + 40, 0x1160uLL);
    v46 = 0;
    __dst = (char *)(v2 + 35309);
    v47 = (uint64_t)(v2 + 51693);
    v134 = (uint64_t)(v2 + 84461);
    v129 = (int16x8_t *)(v2 + 100845);
    v130 = (int16x8_t *)(v2 + 92653);
    v127 = (int16x8_t *)(v2 + 27117);
    v128 = (int16x8_t *)(v2 + 18925);
    v126 = (int16x8_t *)(v2 + 10731);
    v125 = (int16x8_t *)(v2 + 133613);
    v107 = (const __int16 *)(v2 + 18923);
    v108 = (uint64_t)(v2 + 125421);
    v118 = (uint64_t)(v2 + 135661);
    v119 = (int16x8_t *)(v2 + 117229);
    v116 = (int16x8_t *)(v2 + 139757);
    v117 = (int16x8_t *)(v2 + 137709);
    v115 = (int16x8_t *)(v2 + 141805);
    v99 = v2;
    v105 = (int16x8_t *)(v2 + 145901);
    v106 = (int16x8_t *)(v2 + 143853);
    v48 = v104;
    v109 = v2 + 40;
    v113 = &v2[5 * v45 + 1158];
    v121 = v2 + 51693;
    __src = (int16x8_t *)(v2 + 109037);
    do
    {
      if (v43[368 * *v44 + 360 + (_QWORD)v46] == 1)
      {
        v49 = &v43[368 * *v44];
        v102 = v49[(_QWORD)v46 + 84];
        if ((int)v102 >= 1)
        {
          v120 = 0;
          v50 = 0;
          v51 = (double *)&v49[2 * (_QWORD)v46];
          v52 = (int)v51[48];
          v53 = (int)v51[44];
          v112 = v43[368 * *v44 + 80 + (_QWORD)v46];
          v110 = &v111[(_QWORD)v46];
          if ((int)v53 >= 0)
            v54 = (int)v51[44];
          else
            v54 = v53 + 1;
          v55 = v53 + 3;
          if ((int)v53 >= 0)
            v55 = v53;
          if ((int)v52 >= 0)
            v56 = v52;
          else
            v56 = v52 + 1;
          v141 = v56 >> 1;
          v57 = v54 >> 1;
          v139 = v55 >> 2;
          v137 = (int)v52 / 4;
          v122 = v52;
          v142 = v54 >> 1;
          v123 = v46;
          do
          {
            if ((int)v112 >= 1)
            {
              v58 = 0;
              v59 = v50;
              do
              {
                v124 = v59;
                v60 = (uint64_t)&v43[368 * *v44 + 104 + 64 * (_QWORD)v46];
                v132 = (int)*(double *)(v60 + 8 * v120 + 128);
                v133 = v58;
                v131 = (int)*(double *)(v60 + 8 * v58);
                if ((int)v52 >= 1)
                {
                  v61 = v52;
                  v62 = __dst;
                  v46 = v44;
                  v63 = (int)*(double *)(v60 + 8 * v120 + 128);
                  do
                  {
                    memcpy(v62, (const void *)(*(_QWORD *)(v114 + 8 * *v46) + v131 + (*v113 * v63++)), (int)v53);
                    v62 += (int)v53;
                    --v61;
                  }
                  while (v61);
                  v64 = 0;
                  v47 = (uint64_t)v121;
                  LODWORD(v52) = v122;
                  v65 = v121;
                  v66 = (unsigned __int8 *)__dst;
                  v44 = v46;
                  v48 = v104;
                  LODWORD(v46) = (_DWORD)v123;
                  v57 = v142;
                  do
                  {
                    if ((int)v53 >= 1)
                    {
                      v67 = v53;
                      v68 = v65;
                      v69 = v66;
                      do
                      {
                        v70 = *v69++;
                        *v68++ = 16 * v70;
                        --v67;
                      }
                      while (v67);
                    }
                    ++v64;
                    v66 += (int)v53;
                    v65 += (int)v53;
                  }
                  while (v64 != v122);
                }
                if ((v48 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67110144;
                    *(_DWORD *)v157 = v53;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v52;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = (_DWORD)v46;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)v159 = v120;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)v160 = v133;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: PYRYU8[%dx%df][OBJ=%d][Y=%d][X=%d]=[\n", buf, 0x20u);
                  }
                  sub_100011EB0(*(_QWORD *)(v114 + 8 * *v44), v131, v132, v53, v52, *v113);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67110144;
                    *(_DWORD *)v157 = v53;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v52;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = (_DWORD)v46;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)v159 = v120;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)v160 = v133;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ROIS16[%dx%df][OBJ=%d][Y=%d][X=%d]=[\n", buf, 0x20u);
                  }
                  sub_100011C10(v47, 0, 0, v53, v52, v53);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  sub_100013764(v47, v53, v52, v134, (uint64_t)v130, (uint64_t)v129, (uint64_t)__src, v128, v127, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v141;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_l1 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v57;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_l1 = %d\n", buf, 8u);
                  }
                  v71 = v44;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a1 = [\n", buf, 2u);
                  }
                  sub_100011C10(v134, 0, 0, v142, v141, v142);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                }
                else
                {
                  v71 = v44;
                  sub_100013764(v47, v53, v52, v134, (uint64_t)v130, (uint64_t)v129, (uint64_t)__src, v128, v127, v48);
                }
                v72 = v142;
                v73 = v141;
                sub_1000134A8(v130, v129, __src, v142, v141, (uint64_t)v119, v48);
                v155 = 0;
                sub_10001212C(__src, v142, v141, &v155, v48);
                if ((v48 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v155;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1_median = %d\n", buf, 8u);
                  }
                  v75 = (uint64_t)v119;
                  v76 = v137;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v141;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_d1 = %d\n", buf, 8u);
                  }
                  v72 = v142;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v142;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_d1 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1 = [\n", buf, 2u);
                  }
                  sub_100011C10((uint64_t)__src, 0, 0, v142, v141, v142);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  v154 = 0;
                  sub_1000123C8(__src, v142, v141, &v155, (__int16 *)&v154 + 1, (__int16 *)&v154, v126, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = SHIWORD(v154);
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1_mad_median = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = (__int16)v154;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1_mad_sigma = %d\n", buf, 8u);
                  }
                  v74 = v71;
                  v153 = 0;
                  v73 = v141;
                  sub_10001212C(v119, v142, v141, &v153, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v153;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: emap1_median = %d\n", buf, 8u);
                  }
                }
                else
                {
                  v74 = v71;
                  v154 = 0;
                  sub_1000123C8(__src, v142, v141, &v155, (__int16 *)&v154 + 1, (__int16 *)&v154, v126, v48);
                  v153 = 0;
                  sub_10001212C(v119, v142, v141, &v153, v48);
                  v75 = (uint64_t)v119;
                  v76 = v137;
                }
                v152 = 1;
                v151 = 0;
                sub_100012870(v75, v72, v73, &v153, &v152, &v151, (__int16 *)&v154, v108, v48);
                v150 = 2;
                sub_100012D08(v108, v72, v73, &v150, (uint64_t)v125, v139, v107, v48);
                v149 = 0.0;
                sub_100012F48(v125, v139, v76, &v149, v48);
                sub_100013764(v134, v72, v73, v118, (uint64_t)v117, (uint64_t)v116, (uint64_t)v115, v128, v127, v48);
                if ((v48 & 1) != 0)
                {
                  v47 = (uint64_t)v121;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v76;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_l2 = %d\n", buf, 8u);
                  }
                  v44 = v74;
                  v77 = (uint64_t)v106;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v139;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_l2 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a2 = [\n", buf, 2u);
                  }
                  sub_100011C10(v118, 0, 0, v139, v76, v139);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  v76 = v137;
                  sub_1000134A8(v117, v116, v115, v139, v137, (uint64_t)v106, v48);
                  v148 = 0;
                  sub_10001212C(v115, v139, v137, &v148, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v148;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2_median = %d\n", buf, 8u);
                  }
                  v79 = v124;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v137;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_d2 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v139;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_d2 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2 = [\n", buf, 2u);
                  }
                  sub_100011C10((uint64_t)v115, 0, 0, v139, v137, v139);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  v147 = 0;
                  v78 = v139;
                  sub_1000123C8(v115, v139, v137, &v148, (__int16 *)&v147 + 1, (__int16 *)&v147, v126, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = SHIWORD(v147);
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2_mad_median = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = (__int16)v147;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2_mad_sigma = %d\n", buf, 8u);
                  }
                  v146 = 0;
                  sub_10001212C(v106, v139, v137, &v146, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v157 = v146;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: emap2_median = %d\n", buf, 8u);
                  }
                }
                else
                {
                  v77 = (uint64_t)v106;
                  sub_1000134A8(v117, v116, v115, v139, v76, (uint64_t)v106, v48);
                  v148 = 0;
                  sub_10001212C(v115, v139, v76, &v148, v48);
                  v147 = 0;
                  sub_1000123C8(v115, v139, v76, &v148, (__int16 *)&v147 + 1, (__int16 *)&v147, v126, v48);
                  v146 = 0;
                  sub_10001212C(v106, v139, v76, &v146, v48);
                  v47 = (uint64_t)v121;
                  v44 = v74;
                  v78 = v139;
                  v79 = v124;
                }
                v145 = 0;
                sub_100012870(v77, v78, v76, &v146, &v152, &v145, (__int16 *)&v147, (uint64_t)v105, v48);
                *(_DWORD *)buf = 0;
                sub_100012F48(v105, v78, v137, (float *)buf, v48);
                v43 = v109;
                v144 = *(float *)&v109[368 * *v44 + 364 + (_QWORD)v123];
                v143 = 0;
                v46 = v123;
                sub_1000130A4(v125, v105, v78, v137, &v144, (float *)&v143 + 1, (float *)&v143, v48);
                v110[16 * v79] = v149;
                v80 = &v111[16 * v79 + (_QWORD)v123];
                v80[4] = *(float *)buf;
                v80[8] = *((float *)&v143 + 1);
                *((_DWORD *)v80 + 12) = v143;
                v59 = v79 + 1;
                v58 = v133 + 1;
                v52 = v122;
                v57 = v142;
              }
              while (v133 + 1 != v112);
              v50 = v59;
            }
            ++v120;
          }
          while (v120 != v102);
        }
      }
      ++v46;
    }
    while (v46 != (unsigned __int8 *)4);
    if ((v44[32] & 1) != 0)
    {
      v81 = 0;
      v82 = (float *)(v99 + 1175);
      v83 = (float *)(v99 + 1179);
      v84 = (float *)(v99 + 1183);
      do
      {
        if (v100[368 * *v101 + 360 + v81] == 1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v85 = "OTHER";
            if ((unsigned __int16)v81 <= 2u)
              v85 = off_100024850[(__int16)v81];
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v157 = v85;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Output[OBJ=%s]:\n", buf, 0xCu);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sharpnessL1 = [\n", buf, 2u);
          }
          v86 = 0;
          v87 = v111;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v88 = *v87;
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v157 = v86;
              *(_WORD *)&v157[8] = 2048;
              v158 = v88;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v86;
            v87 += 16;
          }
          while (v86 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sharpnessL2 = [\n", buf, 2u);
          }
          v89 = 0;
          v90 = v82;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v91 = *v90;
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v157 = v89;
              *(_WORD *)&v157[8] = 2048;
              v158 = v91;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v89;
            v90 += 16;
          }
          while (v89 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurConf = [\n", buf, 2u);
          }
          v92 = 0;
          v93 = v83;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v94 = *v93;
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v157 = v92;
              *(_WORD *)&v157[8] = 2048;
              v158 = v94;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v92;
            v93 += 16;
          }
          while (v92 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurExtent = [\n", buf, 2u);
          }
          v95 = 0;
          v96 = v84;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v97 = *v96;
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)v157 = v95;
              *(_WORD *)&v157[8] = 2048;
              v158 = v97;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v95;
            v96 += 16;
          }
          while (v95 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
        }
        ++v81;
        ++v111;
        ++v82;
        ++v83;
        ++v84;
      }
      while (v81 != 4);
    }
    v98 = 0;
    v2 = v99;
  }
  else if ((a1[1152] & 1) != 0)
  {
    v98 = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v157 = 1;
      *(_WORD *)&v157[4] = 1024;
      *(_DWORD *)&v157[6] = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: incompatible context version (expected %d, got %d)\n", buf, 0xEu);
    }
  }
  else
  {
    v98 = 1;
  }
  v2[2] = v98;
}

uint64_t sub_100016738(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, int a5, char a6, const char *a7)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 64) = a3;
  *(_QWORD *)(a1 + 72) = a4;
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a6;
  strncpy((char *)a1, a2, 0x20uLL);
  if (a7)
  {
    strncpy((char *)(a1 + 32), a7, 0x20uLL);
    *(_BYTE *)(a1 + 63) = 0;
  }
  return a1;
}

BOOL sub_100016798(uint64_t a1, const char *a2)
{
  int v4;
  uint64_t v5;
  FILE *v6;
  int __ptr;
  char v9[32];
  char v10[32];
  __int128 v11;
  int v12;
  int v13;

  __ptr = 2;
  strncpy(v9, (const char *)(a1 + 32), 0x20uLL);
  strncpy(v10, (const char *)a1, 0x20uLL);
  v11 = *(_OWORD *)(a1 + 64);
  v4 = *(unsigned __int8 *)(a1 + 84);
  v12 = *(_DWORD *)(a1 + 80);
  v13 = v4;
  v5 = qword_100031000;
  if ((unint64_t)qword_100031000 <= 0x5B)
  {
    do
    {
      v9[v5 - 4] ^= byte_1000224D8[v5 & 7];
      ++v5;
    }
    while (v5 != 92);
  }
  v6 = fopen(a2, "w");
  if (v6)
  {
    fwrite(&__ptr, 1uLL, 0x5CuLL, v6);
    fclose(v6);
  }
  return v6 != 0;
}

uint64_t sub_1000168A8(uint64_t a1, char *__filename)
{
  uint64_t result;
  FILE *v4;
  BOOL v5;
  uint64_t v6;
  int v7;
  int __ptr;
  char v9[32];
  char v10[32];
  __int128 v11;
  int v12;
  int v13;

  result = (uint64_t)fopen(__filename, "r");
  if (result)
  {
    v4 = (FILE *)result;
    v5 = fread(&__ptr, 1uLL, 0x24uLL, (FILE *)result) == 36 && __ptr == 2;
    if (v5 && fread(&v9[qword_100031000 - 4], 1uLL, 0x38uLL, v4) == 56)
    {
      v6 = qword_100031000;
      if ((unint64_t)qword_100031000 <= 0x5B)
      {
        do
        {
          v9[v6 - 4] ^= byte_1000224D8[v6 & 7];
          ++v6;
        }
        while (v6 != 92);
      }
      strncpy((char *)a1, v10, 0x20uLL);
      *(_OWORD *)(a1 + 64) = v11;
      v7 = v13;
      *(_DWORD *)(a1 + 80) = v12;
      *(_BYTE *)(a1 + 84) = v7 != 0;
      strncpy((char *)(a1 + 32), v9, 0x20uLL);
      *(_BYTE *)(a1 + 63) = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000169F0()
{
  NSFileManager *v0;
  NSString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id v11;

  v0 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/var/mobile/Documents/Pearl/ProjectorValid.bin");
  if (-[NSFileManager fileExistsAtPath:](v0, "fileExistsAtPath:", v1)
    && (v11 = 0, !-[NSFileManager removeItemAtPath:error:](v0, "removeItemAtPath:error:", v1, &v11)))
  {
    NSLog(CFSTR("Failed to remove %s token: %@"), "Pearl", objc_msgSend(v11, "description"));
    return 0;
  }
  else
  {
    sub_100016A98("token was removed", v2, v3, v4, v5, v6, v7, v8, v10);
    return 1;
  }
}

void sub_100016A98(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSDateFormatter *v10;
  int v11;
  uint64_t v12;
  FILE *v13;
  FILE *v14;
  char *v15[2];
  char __str[2048];

  v10 = objc_opt_new(NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v10, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v11 = snprintf(__str, 0x800uLL, "[%s] ", -[NSString UTF8String](-[NSDateFormatter stringFromDate:](v10, "stringFromDate:", +[NSDate date](NSDate, "date")), "UTF8String"));

  v12 = vsnprintf(&__str[v11], 0x800uLL, a1, &a9) + (uint64_t)v11;
  v15[0] = 0;
  v15[1] = &a9;
  if (vasprintf(v15, a1, &a9) >= 1)
    NSLog(CFSTR("%s"), v15[0]);
  if (v15[0])
  {
    free(v15[0]);
    v15[0] = 0;
  }
  *(_WORD *)&__str[v12] = 10;
  v13 = fopen("/var/mobile/Documents/Tokens.log", "a");
  if (v13)
  {
    v14 = v13;
    fwrite(__str, v12 + 1, 1uLL, v13);
    fclose(v14);
  }
  else
  {
    NSLog(CFSTR("Failed to open token log file."));
  }
}

BOOL sub_100016C0C(char *a1)
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  uint64_t valuePtr;

  v2 = (const __CFNumber *)MGCopyAnswer(CFSTR("UniqueChipID"), 0);
  v3 = v2;
  if (v2)
  {
    valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberSInt64Type, &valuePtr);
    sprintf(a1, "%lld", valuePtr);
    CFRelease(v3);
  }
  else
  {
    NSLog(CFSTR("Failed to read unique chip identifier"));
  }
  return v3 != 0;
}

uint64_t sub_100016C94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  const char *v51;
  _BYTE v52[80];
  int v53;
  char __s1[32];
  char __s2[32];
  char v56[32];
  uint64_t v57;
  time_t v58;
  int v59;
  char v60;

  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/var/mobile/Documents/Pearl/ProjectorValid.bin")))
  {
    v51 = "Pearl";
    v27 = "Can't activate %s projector: no projector token found";
LABEL_6:
    sub_100016A98(v27, v3, v4, v5, v6, v7, v8, v9, (char)v51);
    return 0;
  }
  v10 = nullsub_3(__s2);
  if ((sub_1000168A8(v10, "/var/mobile/Documents/Pearl/ProjectorValid.bin") & 1) == 0)
  {
    sub_100016A98("Failed to read %s projector token file. Token will be removed.", v11, v12, v13, v14, v15, v16, v17, (char)"Pearl");
    goto LABEL_14;
  }
  v18 = time(0);
  v26 = v58;
  if (v18 > v58)
  {
    sub_100016A98("%s token timeout was reached (current time %ld). Token will be removed.", v19, v20, v21, v22, v23, v24, v25, (char)"Pearl");
LABEL_14:
    sub_1000169F0();
    return 0;
  }
  if (v18 > v57 + 43200)
  {
    sub_100016A98("%s token has exceeded max allowed timeout. Token will be removed.", v19, v20, v21, v22, v23, v24, v25, (char)"Pearl");
    goto LABEL_14;
  }
  if (!sub_100016C0C(__s1))
  {
    v27 = "Failed to read unique chip ID";
    goto LABEL_6;
  }
  if (strcmp(__s1, __s2))
  {
    sub_100016A98("%s token does not match device. Token will be removed.", v28, v29, v30, v31, v32, v33, v34, (char)"Pearl");
    goto LABEL_14;
  }
  if (v60)
  {
    v36 = sub_100016F08();
    if (v36 == -1 || v36 > v57)
    {
      sub_100016A98("System performed boot since %s token creation (boot time: %ld). Token will be removed.", v28, v29, v30, v31, v32, v33, v34, (char)"Pearl");
      goto LABEL_14;
    }
  }
  if (!v59)
  {
    sub_100016A98("Number of allowed activations has reached zero. %s token will be removed.", v28, v29, v30, v31, v32, v33, v34, (char)"Pearl");
    goto LABEL_14;
  }
  if (v59 >= 1)
  {
    sub_100016794((uint64_t)v52, __s2, v57, v58, v59 - 1, v60, v56);
    if (v53)
    {
      if (!sub_100016798((uint64_t)v52, "/var/mobile/Documents/Pearl/ProjectorValid.bin"))
      {
        sub_100016A98("Failed to update %s token file. Will return false so someone looks at that...", v44, v45, v46, v47, v48, v49, v50, (char)"Pearl");
        return 0;
      }
      sub_100016A98("%s token activation count updated to %d", v44, v45, v46, v47, v48, v49, v50, (char)"Pearl");
    }
    else
    {
      sub_100016A98("Using last allowed activation. %s token will be removed.", v37, v38, v39, v40, v41, v42, v43, (char)"Pearl");
      sub_1000169F0();
    }
  }
  if (a2)
    *a2 = v26;
  return 1;
}

uint64_t sub_100016F08()
{
  uint64_t result;
  int *v1;
  size_t v2;
  uint64_t v3;
  int v4[2];

  *(_QWORD *)v4 = 0x1500000001;
  v2 = 16;
  if (sysctl(v4, 2u, &v3, &v2, 0, 0) || (result = v3) == 0)
  {
    v1 = __error();
    NSLog(CFSTR("Failed to read boot time. errno %d"), *v1);
    return -1;
  }
  return result;
}

double sub_100016FA4(double *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double result;

  v8 = (a3 - a2) / a6 - (a4 - a2) / (a6 + a7);
  v9 = (a4 - a3) / a7;
  *(float *)&v8 = v9 + v8;
  v10 = (a5 - a4) / a8 + v9 - (a5 - a3) / (a7 + a8);
  *(float *)&v8 = *(float *)&v8 * a7;
  v11 = v10 * a7;
  v12 = *(float *)&v8;
  v13 = v11;
  *a1 = a3;
  a1[1] = v12;
  v14 = a4 * 3.0 + a3 * -3.0 + v12 * -2.0 - v13;
  result = a4 * -2.0 + a3 * 2.0 + v12 + v13;
  a1[2] = v14;
  a1[3] = result;
  return result;
}

double sub_100017048(double *a1, double *a2, double a3)
{
  double v5[4];

  sub_100016FA4(v5, *a1, a1[1], a1[2], a1[3], a2[1] - *a2, a2[2] - a2[1], a2[3] - a2[2]);
  return v5[0] + a3 * (v5[1] + a3 * (v5[2] + v5[3] * a3));
}

void sub_1000170A4(double *a1, double *a2, double *a3, double a4, double a5)
{
  double v10[4];

  v10[0] = sub_100017048(a1, a3, a5);
  v10[1] = sub_100017048(a1 + 4, a3, a5);
  v10[2] = sub_100017048(a1 + 8, a3, a5);
  v10[3] = sub_100017048(a1 + 12, a3, a5);
  sub_100017048(v10, a2, a4);
}

void sub_100017170(unsigned __int16 *a1, long double *a2, unsigned int a3)
{
  uint64_t v3;
  int v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  int v14;
  double v15;
  long double v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  double v21;
  long double v22;
  uint64_t v23;
  long double *v24;
  double v25;
  long double v26;
  long double v27;

  v3 = a1[7];
  if (a1[7])
  {
    v6 = 0;
    v7 = a1[6];
    v8 = (double)(*a1 + 1) * 0.5;
    v9 = (double)(a1[1] + 1) * 0.5;
    v10 = 0.0;
    do
    {
      if (a1[6])
      {
        v11 = a1[4];
        v12 = (double)(a1[5] + v6 * a1[3]) - v9;
        v13 = v12 * v12;
        v14 = a1[6];
        do
        {
          v15 = sqrt(((double)v11 - v8) * ((double)v11 - v8) + v13);
          if (v15 > v10)
            v10 = v15;
          v11 += a1[2];
          --v14;
        }
        while (v14);
      }
      ++v6;
    }
    while (v6 != (_DWORD)v3);
    v16 = pow((double)a3 / 100.0, 0.25);
    v17 = 0;
    do
    {
      if ((_DWORD)v7)
      {
        v18 = a1[4];
        v19 = a1[2];
        v20 = a1[5] + v17 * a1[3];
        v21 = ((double)v20 - v9) * ((double)v20 - v9);
        v22 = acos(v16);
        v23 = v7;
        v24 = a2;
        v25 = v10 / tan(v22);
        do
        {
          v26 = atan(sqrt(((double)v18 - v8) * ((double)v18 - v8) + v21) / v25);
          v27 = cos(v26);
          *v24++ = pow(v27, 4.0);
          v18 += v19;
          --v23;
        }
        while (v23);
      }
      ++v17;
      a2 += v7;
    }
    while (v17 != v3);
  }
}

void sub_100017304(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  double v12;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  unsigned int v32;
  uint64_t v33;
  double v34;
  signed int v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  _BYTE *v41;
  double *v42;
  uint64_t v43;
  double v44;
  _BYTE *v45;
  double v46;
  float v47;
  double v48;
  unint64_t v49;
  double v50;
  uint64_t v51;
  unsigned int v52;
  double v53;
  unsigned int v54;
  unsigned int v55;
  double v56;
  double v57;
  double v58;
  unsigned int v59;
  double v60;
  double v61;
  float v62;
  float v63;
  float v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  double v80[4];
  double v81[4];
  double v82[16];

  v72 = a3[7];
  if (a3[7])
  {
    v71 = a3[3];
    v15 = a3[2];
    v70 = a3[5];
    v16 = a4 + 56;
    v17 = a4 + 140;
    v18 = a3[4];
    v19 = a3[6];
    v76 = v18;
    v77 = a2 - 2;
    v75 = v19;
    v73 = 0;
    v74 = v15;
    while (!(_DWORD)v19)
    {
LABEL_44:
      if (++v73 == v72)
        return;
    }
    v20 = 0;
    v21 = (double)(v70 + v73 * v71);
    v22 = *(unsigned __int16 *)(a4 + 40);
    v23 = *(unsigned __int16 *)(a4 + 42);
    v24 = v73 * v19;
    while (1)
    {
      v25 = (double)(v18 + v20 * v15);
      if ((_DWORD)v22)
      {
        v26 = 0;
        LOWORD(a7) = *(_WORD *)a4;
        *(float *)&a7 = (float)LODWORD(a7);
        while (v25 >= (float)(*(float *)(v16 + 4 * v26) * *(float *)&a7))
        {
          if (v22 == ++v26)
          {
            LOWORD(v26) = v22;
            if ((_DWORD)v23)
              goto LABEL_12;
            goto LABEL_17;
          }
        }
        if ((_DWORD)v23)
          goto LABEL_12;
      }
      else
      {
        LOWORD(v26) = 0;
        if ((_DWORD)v23)
        {
LABEL_12:
          v27 = 0;
          LOWORD(a7) = *(_WORD *)(a4 + 2);
          *(float *)&a7 = (float)LODWORD(a7);
          while (v21 >= (float)(*(float *)(v17 + 4 * v27) * *(float *)&a7))
          {
            if (v23 == ++v27)
            {
              v28 = v23;
              goto LABEL_19;
            }
          }
          v28 = v27;
          goto LABEL_19;
        }
      }
LABEL_17:
      v28 = 0;
LABEL_19:
      v29 = (unsigned __int16)v26;
      v30 = (unsigned __int16)v26 - 1;
      v31 = (double)(int)v30;
      v32 = v28;
      v33 = v28 - 1;
      v34 = (double)(int)v33;
      if (v29 < 2
        || (v35 = v32 - 2, v32 < 2)
        || ((double)v22 + -3.0 >= v31 ? (v36 = a5 == 0) : (v36 = 1),
            !v36 ? (v37 = (double)v23 + -3.0 < v34) : (v37 = 1),
            v37))
      {
        if (!(_DWORD)v29)
          v31 = 0.0;
        if (!v32)
          v34 = 0.0;
        if (v31 >= (double)((int)v22 - 2))
          v31 = (double)((int)v22 - 2);
        v52 = vcvtmd_u64_f64(v31);
        if (v34 >= (double)((int)v23 - 2))
          v53 = (double)((int)v23 - 2);
        else
          v53 = v34;
        v54 = vcvtmd_u64_f64(v53);
        v55 = v52 + v54 * v22;
        LOBYTE(v53) = *(_BYTE *)(a2 + v55);
        v56 = *(double *)(a4 + 48);
        v57 = (double)*(unint64_t *)&v53 / v56;
        LOBYTE(a9) = *(_BYTE *)(a2 + v55 + 1);
        v58 = (double)*(unint64_t *)&a9 / v56;
        v59 = v52 + (v54 + 1) * v22;
        LOBYTE(a10) = *(_BYTE *)(a2 + v59);
        v60 = (double)*(unint64_t *)&a10 / v56;
        LOBYTE(a11) = *(_BYTE *)(a2 + v59 + 1);
        v61 = (double)*(unint64_t *)&a11 / v56;
        LOWORD(a12) = *(_WORD *)a4;
        v62 = (float)LODWORD(a12);
        v63 = roundf(*(float *)(a4 + 56 + 4 * v52) * v62);
        LOWORD(v12) = *(_WORD *)(a4 + 2);
        v64 = (float)LODWORD(v12);
        v65 = roundf(*(float *)(a4 + 140 + 4 * v54) * v64);
        a12 = roundf(*(float *)(a4 + 56 + 4 * (v52 + 1)) * v62);
        v12 = roundf(*(float *)(a4 + 140 + 4 * (v54 + 1)) * v64);
        a11 = v25 - v63;
        v66 = a12 - v25;
        v67 = v60 * v66 + a11 * v61;
        a10 = a11 + v66;
        v68 = v67 / (a11 + v66);
        v69 = (v57 * v66 + a11 * v58) / (a11 + v66);
        a9 = v12 - v21;
        a7 = v21 - v65 + v12 - v21;
        *(double *)(a1 + 8 * (v24 + v20)) = fmax(fmin(((v12 - v21) * v69 + (v21 - v65) * v68) / a7, 1.0), 0.0);
      }
      else
      {
        v38 = 0;
        v39 = *(double *)(a4 + 48);
        v40 = v35;
        v41 = (_BYTE *)(v77 + v29 + (int)v22 * (uint64_t)v35);
        v42 = v82;
        do
        {
          v43 = 0;
          v81[v38] = *(float *)(a4 + 4 * (v38 + (int)v29 - 2) + 56);
          v44 = *(float *)(a4 + 4 * (v38 + v40) + 140);
          v80[v38] = v44;
          v45 = v41;
          do
          {
            LOBYTE(v44) = *v45;
            v44 = (double)*(unint64_t *)&v44 / v39;
            v42[v43] = v44;
            v45 += v22;
            ++v43;
          }
          while (v43 != 4);
          ++v38;
          ++v41;
          v42 += 4;
        }
        while (v38 != 4);
        LOWORD(v39) = *(_WORD *)a4;
        v46 = v25 / (double)*(unint64_t *)&v39;
        v47 = *(float *)(a4 + 56 + 4 * v30);
        v48 = v46 - v47;
        *(double *)&v49 = (float)(*(float *)(a4 + 56 + 4 * v29) - v47);
        v50 = v48 / *(double *)&v49;
        LOWORD(v49) = *(_WORD *)(a4 + 2);
        sub_1000170A4(v82, v81, v80, v50, (v21 / (double)v49 - *(float *)(a4 + 140 + 4 * v33))/ (float)(*(float *)(a4 + 140 + 4 * v32) - *(float *)(a4 + 140 + 4 * v33)));
        *(_QWORD *)(a1 + 8 * (v24 + v20)) = v51;
        v15 = v74;
        v19 = v75;
        v18 = v76;
      }
      if (++v20 == v19)
        goto LABEL_44;
    }
  }
}

uint64_t sub_10001774C(uint64_t result, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, int a7)
{
  unsigned int v7;
  unsigned __int16 v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int i;
  uint64_t v12;
  int v13;

  v7 = *(unsigned __int16 *)(a5 + 14);
  if (*(_WORD *)(a5 + 14))
  {
    v8 = 0;
    v9 = 0;
    v10 = *(unsigned __int16 *)(a5 + 12);
    do
    {
      if (v10)
      {
        for (i = 0; i < v10; ++i)
        {
          v12 = i + v9 * v10;
          v13 = 1 << a6;
          if (a7 != 2)
            LOWORD(v13) = llround(fmin(*(double *)(a3 + 8 * v12) / *(double *)(a4 + 8 * v12) * (double)(1 << a6), 65535.0));
          *(_WORD *)(result + 2 * v12) = v13;
          if ((unsigned __int16)v13 > v8)
            v8 = v13;
          v10 = *(unsigned __int16 *)(a5 + 12);
        }
        v7 = *(unsigned __int16 *)(a5 + 14);
      }
      ++v9;
    }
    while (v9 < v7);
  }
  else
  {
    v8 = 0;
  }
  *a2 = v8;
  return result;
}

void sub_1000177E8(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int32x2_t v12;
  int64x2_t v13;
  int v14;
  __int16 v15;
  __int16 v16;
  int64x2_t v17;
  float64x2_t v18;
  __int16 v19;
  __int16 v20;
  uint64_t v21;
  _DWORD v22[38];
  __int16 v23;
  __int16 v24;
  int v25;
  int v26;
  __int16 v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v8 = *(unsigned __int16 *)(a1 + 14) >> 1;
  v23 = *(_WORD *)(a1 + 14) >> 1;
  v9 = *(unsigned __int16 *)(a1 + 16) >> 1;
  v24 = *(_WORD *)(a1 + 16) >> 1;
  if (a3)
  {
    v10 = 0;
    do
    {
      v22[v10] = *(_DWORD *)(a7 + 4 * v10);
      ++v10;
    }
    while (a3 > v10);
  }
  if (a4)
  {
    v11 = 0;
    do
    {
      v22[v11 + 21] = *(_DWORD *)(a8 + 4 * v11);
      ++v11;
    }
    while (a4 > v11);
  }
  v29 = a1 + 18;
  v30 = a1 + 36;
  v31 = a1 + 54;
  v32 = a1 + 72;
  v15 = v8;
  v16 = v9;
  v17 = vdupq_n_s64(0x3F847AE147AE147BuLL);
  v19 = a3;
  v20 = a4;
  v12 = vadd_s32((int32x2_t)__PAIR64__(a4, a3), (int32x2_t)-1);
  v13.i64[0] = v12.i32[0];
  v13.i64[1] = v12.i32[1];
  v18 = vdivq_f64((float64x2_t)vdupq_n_s64(0x3FEF5C28F5C28F5CuLL), vcvtq_f64_s64(v13));
  v21 = 0x406F400000000000;
  v14 = *(_DWORD *)(a1 + 28);
  v25 = *(_DWORD *)(a1 + 20);
  v26 = v14;
  v27 = *(_WORD *)(a1 + 32);
  v28 = *(_WORD *)(a1 + 34);
  operator new[]();
}

uint64_t sub_100017A58(uint64_t result)
{
  uint64_t v1;
  unsigned __int16 *v2;
  int64_t v3;
  uint64_t v4;
  _WORD *v5;
  unint64_t v6;
  __int16 v7;
  BOOL v8;
  _QWORD v9[4];

  v1 = 0;
  v9[0] = result + 18;
  v9[1] = result + 36;
  v9[2] = result + 54;
  v9[3] = result + 72;
  do
  {
    v2 = (unsigned __int16 *)v9[v1];
    v3 = ((unint64_t)(v2[7] * v2[8]) << 32) - 0x100000000;
    if (v3 >= 1)
    {
      v4 = v2[3];
      v5 = (_WORD *)(result + 92 + 2 * v4);
      v6 = result + 90 + (((unint64_t)v3 >> 31) & 0x1FFFFFFFELL) + 2 * v4;
      do
      {
        v7 = *(_WORD *)(v6 + 2);
        *(_WORD *)(v6 + 2) = *v5;
        *v5++ = v7;
        v8 = v6 > (unint64_t)v5;
        v6 -= 2;
      }
      while (v8);
    }
    ++v1;
  }
  while (v1 != 4);
  return result;
}

void sub_100017B28()
{
  operator new[]();
}

unint64_t sub_100017CA4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;

  v2 = 0;
  v3 = 0;
  v4 = a1[1] * *a1;
  v5 = (v4 - 1);
  v6 = a2 + v5;
  v7 = a1 + 156;
  v8 = &a1[v5 + 156];
  do
  {
    v9 = v7;
    v10 = v8;
    v11 = a2;
    v12 = v6;
    do
    {
      *(_BYTE *)(v11 + v2) = v10[v2];
      result = v11 + v2 + 1;
      *(_BYTE *)(v12 + v2) = v9[v2];
      --v12;
      ++v11;
      --v10;
      ++v9;
    }
    while (v12 + v2 >= result);
    ++v3;
    v2 += v4;
  }
  while (v3 != 4);
  return result;
}

unsigned __int16 *sub_100017D1C(unsigned __int16 *result)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  unsigned int v7;

  v1 = result[16];
  if (v1 != result[43])
    sub_10001E498();
  v2 = result[17];
  if (v2 != result[44])
    sub_10001E470();
  v3 = v2 * v1;
  if (v3)
  {
    v4 = 0;
    v5 = &result[result[39] + 46];
    v6 = &result[result[12] + 46];
    do
    {
      v7 = (*v5 + *v6) >> 1;
      *v6++ = v7;
      *v5++ = v7;
      ++v4;
    }
    while (v3 > (unsigned __int16)v4);
  }
  return result;
}

uint64_t sub_100017D98(uint64_t a1, uint64_t a2, double a3)
{
  unint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  double v22;
  uint64_t result;
  uint64_t v24;
  float v25;
  float v26;
  float v27;
  double v28;
  double v29;
  unsigned int v30;
  double v31;
  unsigned int v32;
  double v33;
  unsigned int v34;
  _WORD *v35;
  _WORD *v36;
  unsigned int v37;
  double v38;
  double v39;
  double v40;
  uint64_t i;
  double v42;
  _QWORD v43[4];
  double v44[257];
  _QWORD v45[5];

  LOWORD(a3) = *(_WORD *)(a2 + 14);
  *(double *)&v5 = (double)*(unint64_t *)&a3;
  v6 = *(double *)&v5 * 0.5;
  LOWORD(v5) = *(_WORD *)(a2 + 16);
  v7 = (double)v5 * 0.5;
  memset(v45, 0, 32);
  bzero(v44, 0x808uLL);
  v8 = 0;
  v9 = v6;
  v43[0] = a2 + 18;
  v43[1] = a2 + 36;
  v43[2] = a2 + 54;
  v43[3] = a2 + 72;
  do
  {
    v45[v8] = a2 + 92 + 2 * *(unsigned __int16 *)(v43[v8] + 6);
    ++v8;
  }
  while (v8 != 4);
  v10 = v7;
  v11 = sqrt(v9 * v9 + v10 * v10);
  v12 = log2f(v11 * 0.0039062);
  v16 = 0;
  *(_WORD *)(a1 + 12) = vcvtps_s32_f32(v12);
  do
  {
    v17 = 0;
    v18 = (unsigned __int16 *)v43[v16];
    v19 = v18[1];
    v20 = v18[2];
    v21 = v18[7];
    v22 = (double)(v18[8] - 2);
    result = v45[v16];
    do
    {
      v24 = 0;
      v25 = (float)dword_1000224F0[v17];
      v26 = (float)dword_100022500[v17];
      do
      {
        v27 = (float)(v11 * (float)v24) * 0.0039062;
        v28 = (float)(v9 + (float)(v25 * (float)((float)(v9 / v11) * v27))) * 0.5;
        v29 = (float)(v10 + (float)(v26 * (float)((float)(v10 / v11) * v27))) * 0.5;
        if (v28 < 0.0)
          v28 = 0.0;
        if (v29 < 0.0)
          v29 = 0.0;
        v30 = (v29 / (double)v20);
        v31 = (double)(v28 / (double)v19);
        if (v31 >= (double)(v21 - 2))
          v31 = (double)(v21 - 2);
        v32 = v31;
        v33 = (double)v30;
        if ((double)v30 >= v22)
          v33 = v22;
        v34 = v33;
        v35 = (_WORD *)(result + 2 * v33 * v21 + 2 * v32);
        LOWORD(v33) = *v35;
        LOWORD(v13) = v35[1];
        v13 = (float)((float)LODWORD(v13) * 0.00012207);
        v36 = (_WORD *)(result + 2 * (v34 + 1) * v21 + 2 * v32);
        LOWORD(v14) = *v36;
        LOWORD(v15) = v36[1];
        v37 = v32 * v19;
        v38 = v28 - (double)v37;
        v39 = (double)(v19 + v37) - v28;
        v40 = v39 * (float)((float)LODWORD(v14) * 0.00012207) + v38 * (float)((float)LODWORD(v15) * 0.00012207);
        v15 = v38 + v39;
        v14 = v40 / (v38 + v39);
        v44[v24] = v44[v24]
                 + 1.0
                 / sqrt((((double)((v34 + 1) * v20) - v29)* ((v39 * (float)((float)LODWORD(v33) * 0.00012207) + v38 * v13)/ (v38 + v39))+ (v29 - (double)(v34 * v20)) * v14)/ (v29 - (double)(v34 * v20) + (double)((v34 + 1) * v20) - v29));
        ++v24;
      }
      while (v24 != 257);
      ++v17;
    }
    while (v17 != 4);
    ++v16;
  }
  while (v16 != 4);
  for (i = 0; i != 257; ++i)
  {
    v42 = v44[i] * 0.0625;
    v44[i] = v42;
    *(_WORD *)(a1 + 14 + 2 * i) = vcvtd_n_s64_f64(v42, 0xCuLL);
  }
  return result;
}

uint64_t sub_1000180C8(uint64_t a1, _DWORD *a2)
{
  mach_port_t v2;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  v2 = *(_DWORD *)(a1 + 96);
  if (!v2)
    return 3758097084;
  output = 0;
  outputCnt = 1;
  result = IOConnectCallScalarMethod(v2, 0x27u, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
    *a2 = output;
  return result;
}

uint64_t sub_100018130(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _OWORD __src[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _DWORD v24[7];

  if (!*(_DWORD *)(a1 + 416))
    return 3758097112;
  __src[0] = 0x300000000uLL;
  DWORD2(__src[1]) = 0;
  *(_QWORD *)&__src[1] = 0;
  v2 = sub_1000184EC(a1, (uint64_t)__src, 0x1Cu, 0, 0xFFFFFFFF);
  if (!(_DWORD)v2)
  {
    *(_OWORD *)(a1 + 376) = __src[0];
    *(_OWORD *)(a1 + 388) = *(_OWORD *)((char *)__src + 12);
    printf("H10ISP: maxChannels=%d, timeStampFrequency=%d\n", HIDWORD(__src[0]), DWORD2(__src[0]));
    if (!*(_QWORD *)(a1 + 408))
      operator new[]();
    LODWORD(v3) = *(_DWORD *)(a1 + 416);
    if (!(_DWORD)v3)
    {
LABEL_23:
      v2 = 0;
      *(_DWORD *)(a1 + 368) = v3;
      *(_BYTE *)(a1 + 372) = 1;
      return v2;
    }
    v4 = 0;
    while (1)
    {
      v23 = 0u;
      memset(v24, 0, sizeof(v24));
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
      memset(__src, 0, sizeof(__src));
      WORD2(__src[0]) = 269;
      DWORD2(__src[0]) = v4;
      v2 = sub_1000184EC(a1, (uint64_t)__src, 0xFCu, 0, 0xFFFFFFFF);
      if ((_DWORD)v2)
        break;
      v5 = (_DWORD *)(*(_QWORD *)(a1 + 408) + 280 * v4);
      *v5 = v16;
      memmove(v5 + 6, __src, 0xFCuLL);
      v6 = *(_QWORD *)(a1 + 408);
      if (*(_DWORD *)(v6 + 280 * v4))
      {
        if (!*(_QWORD *)(v6 + 280 * v4 + 8) && !*(_QWORD *)(v6 + 280 * v4 + 16))
          operator new[]();
        v7 = 0;
        v8 = 0;
        v9 = 0;
        while (1)
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          v15 = 0u;
          v16 = 0u;
          v13 = 0u;
          v14 = 0u;
          __src[1] = 0u;
          v12 = 0u;
          *(_QWORD *)&__src[0] = 0x10600000000;
          *((_QWORD *)&__src[0] + 1) = __PAIR64__(v9, v4);
          v2 = sub_1000184EC(a1, (uint64_t)__src, 0xB0u, 0, 0xFFFFFFFF);
          if ((_DWORD)v2)
            break;
          if ((BYTE12(__src[1]) & 0x80) != 0)
            WORD6(__src[1]) = (WORD6(__src[1]) & 0xFF00) + 256;
          memmove((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 408) + 280 * v4 + 8) + v8), &__src[1], 0xA0uLL);
          *(_QWORD *)&__src[0] = 0x14200000000;
          __src[1] = 0u;
          v12 = 0u;
          v13 = 0u;
          *(_QWORD *)&v14 = 0;
          *((_QWORD *)&__src[0] + 1) = __PAIR64__(v9, v4);
          v2 = sub_1000184EC(a1, (uint64_t)__src, 0x48u, 0, 0xFFFFFFFF);
          if ((_DWORD)v2)
            break;
          memmove((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 408) + 280 * v4 + 16) + v7), __src, 0x48uLL);
          ++v9;
          v8 += 160;
          v7 += 72;
          if (v9 >= *(unsigned int *)(*(_QWORD *)(a1 + 408) + 280 * v4))
            goto LABEL_20;
        }
      }
      else
      {
LABEL_20:
        v2 = 0;
      }
      ++v4;
      v3 = *(unsigned int *)(a1 + 416);
      if (v4 >= v3)
      {
        if ((_DWORD)v2)
          break;
        goto LABEL_23;
      }
    }
  }
  sub_1000185E0(a1);
  return v2;
}

uint64_t sub_1000184EC(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  mach_port_t v10;
  uint64_t v11;
  uint64_t input[4];

  kdebug_trace(832577545, 0, 0, 0, 0);
  v10 = *(_DWORD *)(a1 + 96);
  if (v10)
  {
    input[0] = a2;
    input[1] = a3;
    input[2] = a4;
    input[3] = a5;
    v11 = IOConnectCallScalarMethod(v10, 0xAu, input, 4u, 0, 0);
  }
  else
  {
    v11 = 3758097084;
  }
  kdebug_trace(832577546, 0, 0, 0, 0);
  return v11;
}

uint64_t sub_1000185E0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (*(_BYTE *)(a1 + 372))
  {
    *(_BYTE *)(a1 + 372) = 0;
    *(_DWORD *)(a1 + 368) = 0;
    v2 = *(void **)(a1 + 408);
    if (v2)
    {
      if (!*(_DWORD *)(a1 + 416))
        goto LABEL_11;
      v3 = 0;
      v4 = 0;
      do
      {
        v5 = *(_QWORD *)(a1 + 408);
        v6 = *(void **)(v5 + v3 + 8);
        if (v6)
        {
          operator delete[](v6);
          v5 = *(_QWORD *)(a1 + 408);
          *(_QWORD *)(v5 + v3 + 8) = 0;
        }
        v7 = *(void **)(v5 + v3 + 16);
        if (v7)
        {
          operator delete[](v7);
          v5 = *(_QWORD *)(a1 + 408);
          *(_QWORD *)(v5 + v3 + 16) = 0;
        }
        v8 = v5 + v3;
        *(_DWORD *)v8 = 0;
        *(_OWORD *)(v8 + 40) = 0u;
        *(_OWORD *)(v8 + 56) = 0u;
        *(_OWORD *)(v8 + 72) = 0u;
        *(_OWORD *)(v8 + 88) = 0u;
        *(_OWORD *)(v8 + 104) = 0u;
        *(_OWORD *)(v8 + 120) = 0u;
        *(_OWORD *)(v8 + 136) = 0u;
        *(_OWORD *)(v8 + 152) = 0u;
        *(_OWORD *)(v8 + 168) = 0u;
        *(_OWORD *)(v8 + 184) = 0u;
        *(_OWORD *)(v8 + 200) = 0u;
        *(_OWORD *)(v8 + 216) = 0u;
        *(_OWORD *)(v8 + 232) = 0u;
        *(_OWORD *)(v8 + 248) = 0u;
        *(_OWORD *)(v8 + 24) = 0u;
        *(_OWORD *)(v8 + 260) = 0u;
        ++v4;
        v3 += 280;
      }
      while (v4 < *(unsigned int *)(a1 + 416));
      v2 = *(void **)(a1 + 408);
      if (v2)
LABEL_11:
        operator delete[](v2);
      *(_QWORD *)(a1 + 408) = 0;
    }
  }
  return 0;
}

uint64_t sub_1000186DC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;
  const __CFURL *v5;
  const __CFURL *v6;
  __CFReadStream *v7;
  __CFReadStream *v8;
  CFPropertyListRef v9;
  CFStringRef v10;
  CFStringRef v11;
  CFErrorRef err;
  CFPropertyListFormat format;

  v2 = 3758097085;
  err = 0;
  result = 3758097090;
  if (a2 && !*a2)
  {
    v5 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("/usr/local/share/firmware/isp/ISPUnitInfo.plist"), kCFURLPOSIXPathStyle, 0);
    if (v5)
    {
      v6 = v5;
      format = 0;
      v7 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v5);
      if (v7)
      {
        v8 = v7;
        if (CFReadStreamOpen(v7))
        {
          fwrite("Parsing ISPUnitInfo.plist \n", 0x1BuLL, 1uLL, __stderrp);
          v9 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v8, 0, 0, &format, &err);
          if (err)
          {
            puts("Failure loading override ISPUnitInfo property list : CFPropertyListCreateWithStream failed ");
            v10 = CFErrorCopyDescription(err);
            if (v10)
            {
              v11 = v10;
              CFShow(v10);
              CFRelease(v11);
            }
          }
          else
          {
            v2 = 0;
            *a2 = v9;
          }
        }
        else
        {
          v2 = 3758097136;
        }
        CFReadStreamClose(v8);
        CFRelease(v8);
      }
      CFRelease(v6);
      return v2;
    }
    else
    {
      return 3758097085;
    }
  }
  return result;
}

uint64_t sub_100018820(uint64_t a1)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  result = *(unsigned int *)(a1 + 96);
  if ((_DWORD)result)
    return !IOConnectCallScalarMethod(result, 5u, 0, 0, &output, &outputCnt) && output == 1;
  return result;
}

uint64_t sub_100018874(uint64_t a1, unsigned int a2, void *outputStruct)
{
  mach_port_t v3;
  size_t v5;
  uint64_t input;

  v5 = 1688;
  v3 = *(_DWORD *)(a1 + 96);
  if (!v3)
    return 3758097084;
  input = a2;
  return IOConnectCallMethod(v3, 0xEu, &input, 1u, 0, 0, 0, 0, outputStruct, &v5);
}

uint64_t sub_100018904(uint64_t a1, _DWORD *a2, double *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  mach_timebase_info info;

  if (!*(_BYTE *)(a1 + 372))
    return 3758097112;
  mach_timebase_info(&info);
  result = 0;
  *a2 = *(_DWORD *)(a1 + 384);
  LODWORD(v7) = *(_DWORD *)(a1 + 384);
  LODWORD(v8) = info.numer;
  *a3 = 1.0 / (double)v7 * 1000000000.0 * ((double)(info.denom | 0x41CDCD6500000000uLL) / (double)v8);
  return result;
}

uint64_t sub_100018994(uint64_t a1, int a2, int a3, int a4, unsigned int a5)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  int v14;
  int v15;

  v12 = 0x12200000000;
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v7 = sub_1000184EC(a1, (uint64_t)&v12, 0x14u, 0, a5);
  v8 = v7;
  if (a3 == 6914 && !(_DWORD)v7)
  {
    if (*(_DWORD *)(a1 + 416))
    {
      v9 = 0;
      while (1)
      {
        v10 = sub_100018A48(a1, v9);
        if ((_DWORD)v10)
          break;
        if (++v9 >= *(_DWORD *)(a1 + 416))
          return 0;
      }
      v8 = v10;
      printf("WritePropertyValue - UpdateChannelConfigCache channel %d error: 0x%08X\n", v9, v10);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t sub_100018A48(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _OWORD v6[16];

  memset(v6, 0, 252);
  WORD2(v6[0]) = 269;
  DWORD2(v6[0]) = a2;
  v4 = sub_1000184EC(a1, (uint64_t)v6, 0xFCu, 0, 0xFFFFFFFF);
  if (!(_DWORD)v4)
    memmove((void *)(*(_QWORD *)(a1 + 408) + 280 * a2 + 24), v6, 0xFCuLL);
  return v4;
}

uint64_t sub_100018B14(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t i;
  _OWORD v8[13];

  v5 = 3758097090;
  if (*(_DWORD *)(a1 + 416) > a2 && a3 <= 0x40)
  {
    memset(v8, 0, sizeof(v8));
    WORD2(v8[0]) = 1285;
    DWORD2(v8[0]) = a2;
    WORD6(v8[0]) = a3;
    if (a3)
    {
      for (i = 0; i != a3; ++i)
      {
        *((_WORD *)v8 + i + 7) = *(_WORD *)(a4 + 2 * i);
        *((_BYTE *)&v8[8] + i + 14) = *(_BYTE *)(a5 + i);
      }
    }
    return sub_1000184EC(a1, (uint64_t)v8, 0xD0u, 0, 0xFFFFFFFF);
  }
  return v5;
}

uint64_t sub_100018BF4(uint64_t a1, uint64_t a2, io_registry_entry_t a3)
{
  _DWORD *v5;
  char *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFData *v11;
  const __CFData *v12;
  const UInt8 *BytePtr;
  int v14;
  int v15;
  int *v16;
  int v17;
  pthread_mutexattr_t v19;

  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 168) = 0;
  *(_BYTE *)(a1 + 372) = 0;
  *(_QWORD *)(a1 + 408) = 0;
  *(_DWORD *)(a1 + 368) = 0;
  v5 = (_DWORD *)(a1 + 416);
  *(_DWORD *)(a1 + 416) = 0;
  *(_DWORD *)(a1 + 88) = a3;
  *(_QWORD *)a1 = 0;
  v6 = &byte_1002C57E9;
  byte_1002C5814 = sub_10001CF90(CFSTR("LsInterpMode"), CFSTR("com.apple.coremedia"), 1);
  dword_1002C5818 = sub_10001CF90(CFSTR("LsBypassVerify"), CFSTR("com.apple.coremedia"), 0);
  byte_1002C581C = sub_10001CF90(CFSTR("LsEnableGreenAvg"), CFSTR("com.apple.coremedia"), 1) != 0;
  byte_1002C581D = sub_10001CF90(CFSTR("RadialGainEnable"), CFSTR("com.apple.coremedia"), 1) != 0;
  v7 = 0;
  dword_1002C5820 = sub_10001CF90(CFSTR("UnitInfoNVMChannelMask"), CFSTR("com.apple.coremedia"), 0xFFFFFFFFLL);
  do
  {
    v8 = CFStringCreateWithFormat(0, 0, CFSTR("LsAdjustEnableCam%d"), v7);
    *(_DWORD *)(v6 - 5) = sub_10001CF90(v8, CFSTR("com.apple.coremedia"), 0xFFFFFFFFLL);
    CFRelease(v8);
    v9 = CFStringCreateWithFormat(0, 0, CFSTR("LsAdjustInvertCam%d"), v7);
    *(v6 - 1) = sub_10001CF90(v9, CFSTR("com.apple.coremedia"), 0) != 0;
    CFRelease(v9);
    v10 = CFStringCreateWithFormat(0, 0, CFSTR("LsIdealPctCam%d"), v7);
    *v6 = sub_10001CF90(v10, CFSTR("com.apple.coremedia"), 0xFFFFFFFFLL);
    v6 += 8;
    CFRelease(v10);
    ++v7;
  }
  while (v7 != 6);
  v11 = (const __CFData *)IORegistryEntrySearchCFProperty(a3, "IOService", CFSTR("sensor-type"), kCFAllocatorDefault, 3u);
  if (v11)
  {
    v12 = v11;
    BytePtr = CFDataGetBytePtr(v11);
    if (BytePtr)
      v14 = *BytePtr;
    else
      v14 = -1;
    *(_DWORD *)(a1 + 48) = v14;
    CFRelease(v12);
    v15 = *(_DWORD *)(a1 + 48);
  }
  else
  {
    v15 = -1;
    *(_DWORD *)(a1 + 48) = -1;
  }
  v16 = &dword_1000249A8;
  *(_QWORD *)(a1 + 56) = &dword_1000249A8;
  v17 = 32;
  while (*v16 != v15)
  {
    v16 += 222;
    if (!--v17)
    {
      printf("H10ISPDevice - Did not find platform-info for platform:%d. Defaulting to 0.\n", v15);
      goto LABEL_14;
    }
  }
  *(_QWORD *)(a1 + 56) = v16;
LABEL_14:
  pthread_mutexattr_init(&v19);
  pthread_mutexattr_settype(&v19, 2);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 104), &v19);
  pthread_mutexattr_destroy(&v19);
  sub_100018F10(a1);
  sub_1000185E0(a1);
  *(_DWORD *)(a1 + 248) = 0;
  *(_WORD *)(a1 + 252) = 0;
  *(_DWORD *)(a1 + 328) = 0;
  *(_WORD *)(a1 + 332) = 0;
  *(_BYTE *)(a1 + 340) = 0;
  *(_BYTE *)(a1 + 348) = 0;
  *(_BYTE *)(a1 + 356) = 0;
  *(_DWORD *)(a1 + 360) = 0;
  if (sub_100018820(a1) && !sub_1000180C8(a1, v5))
    sub_100018130(a1);
  return a1;
}

uint64_t sub_100018F10(uint64_t refCon)
{
  if (!*(_DWORD *)(refCon + 92))
    return IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(_QWORD *)(refCon + 16) + 16), *(_DWORD *)(refCon + 88), "IOGeneralInterest", (IOServiceInterestCallback)sub_1000192D0, (void *)refCon, (io_object_t *)(refCon + 92));
  return refCon;
}

uint64_t sub_100018F48(uint64_t a1)
{
  io_object_t v2;
  uint64_t i;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  const void *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  int v15;
  _QWORD block[5];
  int v17;

  if (*(_DWORD *)(a1 + 96))
    sub_100019134(a1);
  v2 = *(_DWORD *)(a1 + 92);
  if (v2)
  {
    IOObjectRelease(v2);
    *(_DWORD *)(a1 + 92) = 0;
  }
  sub_1000185E0(a1);
  for (i = 0; i != 6; ++i)
  {
    if (*(_BYTE *)(a1 + i + 248))
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
      if (v4)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_1000191DC;
        block[3] = &unk_100024868;
        block[4] = a1;
        v17 = i;
        dispatch_sync(v4, block);
      }
    }
    if (*(_BYTE *)(a1 + i + 328))
    {
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
      if (v5)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 0x40000000;
        v14[2] = sub_100019218;
        v14[3] = &unk_100024888;
        v14[4] = a1;
        v15 = i;
        dispatch_sync(v5, v14);
      }
    }
  }
  if (*(_BYTE *)(a1 + 340))
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
    if (v6)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 0x40000000;
      v13[2] = sub_100019254;
      v13[3] = &unk_1000248A8;
      v13[4] = a1;
      dispatch_sync(v6, v13);
    }
  }
  if (*(_BYTE *)(a1 + 348))
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
    if (v7)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 0x40000000;
      v12[2] = sub_10001927C;
      v12[3] = &unk_1000248C8;
      v12[4] = a1;
      dispatch_sync(v7, v12);
    }
  }
  if (*(_BYTE *)(a1 + 356))
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 0x40000000;
      v11[2] = sub_1000192A4;
      v11[3] = &unk_1000248E8;
      v11[4] = a1;
      dispatch_sync(v8, v11);
    }
  }
  v9 = *(const void **)(a1 + 24);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(a1 + 24) = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 104));
  return a1;
}

uint64_t sub_100019134(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  io_connect_t v4;

  v2 = (pthread_mutex_t *)(a1 + 104);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 104));
  v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 4u, 0, 0, 0, 0);
  v4 = *(_DWORD *)(a1 + 96);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 96) = 0;
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  else
  {
    v3 = 3758097101;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t sub_1000191B0(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 92);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 92) = 0;
  }
  return result;
}

uint64_t sub_1000191DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = notify_cancel(*(_DWORD *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 224));
  *(_BYTE *)(v2 + *(unsigned int *)(a1 + 40) + 248) = 0;
  return result;
}

uint64_t sub_100019218(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = notify_cancel(*(_DWORD *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 304));
  *(_BYTE *)(v2 + *(unsigned int *)(a1 + 40) + 328) = 0;
  return result;
}

uint64_t sub_100019254(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = notify_cancel(*(_DWORD *)(v1 + 336));
  *(_BYTE *)(v1 + 340) = 0;
  return result;
}

uint64_t sub_10001927C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = notify_cancel(*(_DWORD *)(v1 + 344));
  *(_BYTE *)(v1 + 348) = 0;
  return result;
}

uint64_t sub_1000192A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = notify_cancel(*(_DWORD *)(v1 + 352));
  *(_BYTE *)(v1 + 356) = 0;
  return result;
}

uint64_t sub_1000192D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_QWORD *)result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))result)(result, a3, a4, *(_QWORD *)(result + 8));
  return result;
}

uint64_t sub_1000192F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  unsigned int v8;
  mach_port_t v9;
  uint64_t v11;

  v6 = (pthread_mutex_t *)(a1 + 104);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 104));
  if (*(_DWORD *)(a1 + 96))
  {
    pthread_mutex_unlock(v6);
    return 3758097093;
  }
  else
  {
    v8 = IOServiceOpen(*(_DWORD *)(a1 + 88), mach_task_self_, 0x2Au, (io_connect_t *)(a1 + 96));
    v9 = *(_DWORD *)(a1 + 96);
    if (v9)
      v7 = v8;
    else
      v7 = 3758097084;
    if (!(_DWORD)v7)
    {
      v11 = 0;
      v7 = IOConnectCallScalarMethod(v9, 3u, &v11, 1u, 0, 0);
      if (!(_DWORD)v7)
      {
        *(_QWORD *)a1 = a2;
        *(_QWORD *)(a1 + 8) = a3;
        sub_1000193FC(a1, (_DWORD *)(a1 + 64));
      }
    }
    pthread_mutex_unlock(v6);
  }
  return v7;
}

uint64_t sub_1000193FC(uint64_t a1, _DWORD *a2)
{
  mach_port_t v2;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  v2 = *(_DWORD *)(a1 + 96);
  if (!v2)
    return 3758097084;
  output = 0;
  outputCnt = 1;
  result = IOConnectCallScalarMethod(v2, 0x26u, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
    *a2 = output;
  return result;
}

uint64_t sub_100019464(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  const char **v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  FILE *v19;
  char *v20;
  const char *v21;
  int v22;
  char *v23;
  int v24;
  char v25;
  char *v26;
  char *v27;
  int v28;
  char *v29;
  int v30;
  const char *v31;
  mach_port_t v32;
  uint64_t result;
  mach_port_t v34;
  int v35;
  mach_port_t v36;
  unint64_t v37;
  char *v38;
  BOOL v39;
  _DWORD *v40;
  uint64_t v41;
  char __p;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD block[5];
  int v47;
  _QWORD v48[5];
  int v49;
  char __str[4];
  uint64_t __dst;
  char v52[256];
  int64x2_t __filename;
  uint64_t input[2];

  kdebug_trace(832577537, 0, 0, 0, 0);
  v2 = 3758097084;
  if (!*(_DWORD *)(a1 + 96))
    goto LABEL_6;
  if ((sub_100018820(a1) & 1) == 0 && *(_BYTE *)(a1 + 372))
    sub_1000185E0(a1);
  v2 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0xBu, 0, 0, 0, 0);
  if ((_DWORD)v2)
  {
LABEL_6:
    v41 = v2;
    if (*(_DWORD *)(a1 + 416))
    {
      v3 = 0;
      v4 = (const char **)(a1 + 256);
      v5 = a1 + 176;
      v6 = 16;
      do
      {
        v7 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + v6);
        if (v7 <= 1919246705)
        {
          if (v7 == 1718775412 || v7 == 1718776695)
          {
            v8 = "com.apple.isp.frontcamerapower";
            v9 = "com.apple.isp.frontcamerasensorconfig";
            goto LABEL_21;
          }
        }
        else
        {
          switch(v7)
          {
            case 1919246706:
              v8 = "com.apple.isp.backcamerapower";
              v9 = "com.apple.isp.backcamerasensorconfig";
              goto LABEL_21;
            case 1919251319:
              v8 = "com.apple.isp.backsuperwidecamerapower";
              v9 = "com.apple.isp.backsuperwidesensorconfig";
LABEL_21:
              *(v4 - 10) = v8;
              *v4 = v9;
              if (*(_BYTE *)(v5 + v3 + 72))
                goto LABEL_98;
              v12 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
              if (!v12
                || (v48[0] = _NSConcreteStackBlock,
                    v48[1] = 0x40000000,
                    v48[2] = sub_10001A3C8,
                    v48[3] = &unk_100024908,
                    v48[4] = a1,
                    v49 = v3,
                    dispatch_sync(v12, v48),
                    *v4))
              {
LABEL_98:
                if (!*(_BYTE *)(v5 + v3 + 152))
                {
                  v11 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
                  if (v11)
                  {
                    block[0] = _NSConcreteStackBlock;
                    block[1] = 0x40000000;
                    block[2] = sub_10001A414;
                    block[3] = &unk_100024928;
                    block[4] = a1;
                    v47 = v3;
                    dispatch_sync(v11, block);
                  }
                }
              }
              goto LABEL_29;
            case 1919251564:
              v8 = "com.apple.isp.backtelecamerapower";
              v9 = "com.apple.isp.backtelecamerasensorconfig";
              goto LABEL_21;
          }
        }
        *(v4 - 10) = 0;
        *v4 = 0;
LABEL_29:
        ++v3;
        ++v4;
        v6 += 128;
      }
      while (v3 < *(unsigned int *)(a1 + 416));
    }
    if (!*(_BYTE *)(a1 + 340))
    {
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
      if (v13)
      {
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 0x40000000;
        v45[2] = sub_10001A460;
        v45[3] = &unk_100024948;
        v45[4] = a1;
        dispatch_sync(v13, v45);
      }
    }
    if (!*(_BYTE *)(a1 + 348))
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
      if (v14)
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 0x40000000;
        v44[2] = sub_10001A498;
        v44[3] = &unk_100024968;
        v44[4] = a1;
        dispatch_sync(v14, v44);
      }
    }
    if (!*(_BYTE *)(a1 + 356))
    {
      v15 = *(NSObject **)(*(_QWORD *)(a1 + 16) + 72);
      if (v15)
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 0x40000000;
        v43[2] = sub_10001A4D0;
        v43[3] = &unk_100024988;
        v43[4] = a1;
        dispatch_sync(v15, v43);
      }
    }
    if (!sub_100018820(a1) || !*(_BYTE *)(a1 + 372) || (_DWORD)v41 || !*(_DWORD *)(a1 + 416))
      goto LABEL_73;
    v16 = 0;
    __p = 0;
    v17 = 0;
    v18 = 0;
LABEL_44:
    sprintf(__filename.i8, "/usr/local/share/firmware/isp/cam%dclocks.txt", v16);
    v19 = fopen(__filename.i8, "r");
    if (!v19)
      goto LABEL_72;
    printf("Found camera clock override information file for camera channel %d\n");
    while (1)
    {
      if (!fgets(__str, 40, v19))
      {
        fclose(v19);
        if ((__p & 1) != 0)
        {
          v32 = *(_DWORD *)(a1 + 96);
          if (v32 && (input[0] = v16, input[1] = v17, !IOConnectCallScalarMethod(v32, 0x1Eu, input, 2u, 0, 0)))
            printf("Successfully set camera %d clock divider over-ride: 0x%08X\n");
          else
            printf("Error: ISP_OverrideSensorClockFrequency returned an error: 0x%08X\n");
        }
        if (v18)
        {
          if (sub_100018B14(a1, v16, v18, (uint64_t)&__dst, (uint64_t)v52))
            printf("Error: SetSensorCustomSettings returned an error: 0x%08X\n");
          else
            printf("Successfully sent camera %d sensor register over-ride values for %d registers\n");
        }
LABEL_72:
        if (++v16 >= *(unsigned int *)(a1 + 416))
        {
LABEL_73:
          kdebug_trace(832577538, 0, 0, 0, 0);
          return v41;
        }
        goto LABEL_44;
      }
      v20 = strtok(__str, "=");
      if (!v20)
        break;
      v21 = v20;
      if (!strncmp(v20, "clockdiv", 8uLL))
      {
        v26 = strtok(0, " \n");
        if (!v26)
          break;
        v17 = strtoul(v26, 0, 0);
        printf("Set clock divider reg to 0x%08X\n", v17);
        __p = 1;
      }
      else if (!strncmp(v21, "property", 8uLL))
      {
        v27 = strtok(0, " :");
        if (!v27)
          break;
        v28 = strtoul(v27, 0, 0);
        v29 = strtok(0, " \n");
        if (!v29)
          break;
        v30 = strtoul(v29, 0, 0);
        printf("Setting FW property 0x%08x to 0x%08X\n", v28, v30);
        if (sub_100018994(a1, v16, v28, v30, 0xFFFFFFFF))
          printf("Error setting FW property: 0x%08x\n");
      }
      else
      {
        v22 = strtoul(v21, 0, 0);
        v23 = strtok(0, " \n");
        if (!v23)
          break;
        if (v18 > 0x3F)
        {
          v31 = "Error: too many camera sensor register over-rides in file";
LABEL_60:
          puts(v31);
        }
        else
        {
          v24 = strtoul(v23, 0, 0);
          v25 = v24;
          printf("Set sensor reg 0x%08x to val 0x%08X\n", v22, v24);
          *((_WORD *)v52 + v18 + 708) = v22;
          v52[v18++] = v25;
        }
      }
    }
    v31 = "Error parsing camera clock override file";
    goto LABEL_60;
  }
  v34 = *(_DWORD *)(a1 + 96);
  if (!v34)
    return 3758097084;
  __filename.i64[0] = 63;
  result = IOConnectCallScalarMethod(v34, 0x3Eu, (const uint64_t *)&__filename, 1u, 0, 0);
  if (!(_DWORD)result)
  {
    v40 = (_DWORD *)(a1 + 416);
    if (!*(_DWORD *)(a1 + 416))
    {
      v35 = sub_1000180C8(a1, v40);
      if (v35)
        printf("ISP_PowerOnCamera - ISP_GetNumChannels failed with 0x%08x\n", v35);
    }
    v36 = *(_DWORD *)(a1 + 96);
    if (v36)
    {
      __filename = vdupq_n_s64(1uLL);
      IOConnectCallScalarMethod(v36, 0x23u, (const uint64_t *)&__filename, 2u, 0, 0);
    }
    if (*v40)
    {
      v37 = 0;
      v38 = &byte_1002C57E9;
      do
      {
        bzero(&__filename, 0x698uLL);
        sub_100018874(a1, v37, &__filename);
        if (__filename.i8[4])
          v39 = __filename.u8[12] == 0;
        else
          v39 = 0;
        if (v39)
          operator new();
        ++v37;
        v38 += 8;
      }
      while (v37 < *v40);
    }
    if (!*(_BYTE *)(a1 + 372))
      sub_100018130(a1);
    v2 = 0;
    goto LABEL_6;
  }
  return result;
}

void sub_10001A3AC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A3C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = notify_register_check(*(const char **)(v2 + 8 * *(unsigned int *)(a1 + 40) + 176), (int *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 224));
  *(_BYTE *)(v2 + *(unsigned int *)(a1 + 40) + 248) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_10001A414(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  result = notify_register_check(*(const char **)(v2 + 8 * *(unsigned int *)(a1 + 40) + 256), (int *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 304));
  *(_BYTE *)(v2 + *(unsigned int *)(a1 + 40) + 328) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_10001A460(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = notify_register_check("com.apple.isp.cameratorch", (int *)(v1 + 336));
  *(_BYTE *)(v1 + 340) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_10001A498(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = notify_register_check("com.apple.isp.cameratorchcoolcurrent", (int *)(v1 + 344));
  *(_BYTE *)(v1 + 348) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_10001A4D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = notify_register_check("com.apple.isp.cameratorchwarmcurrent", (int *)(v1 + 352));
  *(_BYTE *)(v1 + 356) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_10001A508(uint64_t a1, int a2)
{
  int v2;
  uint64_t v4;
  int v5;
  _BOOL4 v6;
  uint64_t v7;

  if (!a2)
  {
    v5 = 0;
    v6 = 0;
    v7 = 3758097084;
    goto LABEL_12;
  }
  v2 = a2;
  while (1)
  {
    v4 = sub_100019464(a1);
    if ((_DWORD)v4 != -536870187)
      break;
    --v2;
    usleep(0x493E0u);
    if (!v2)
    {
      v5 = 0;
      v6 = 0;
      v7 = 3758097109;
      goto LABEL_12;
    }
  }
  v7 = v4;
  if ((_DWORD)v4)
  {
LABEL_11:
    v5 = 0;
    v6 = 0;
    goto LABEL_12;
  }
  if (!sub_100018820(a1))
  {
    v7 = 0;
    goto LABEL_11;
  }
  v7 = sub_10001A5F8(a1);
  v6 = v7 == 0;
  v5 = 1;
LABEL_12:
  printf("%s - poweredOn=%d, poweredOff=%d, res=0x%08X\n", "ISP_PowerCycle", v5, v6, v7);
  return v7;
}

uint64_t sub_10001A5F8(uint64_t a1)
{
  mach_port_t v2;
  uint64_t v3;

  kdebug_trace(832577541, 0, 0, 0, 0);
  v2 = *(_DWORD *)(a1 + 96);
  if (v2)
    v3 = IOConnectCallScalarMethod(v2, 0xCu, 0, 0, 0, 0);
  else
    v3 = 3758097084;
  kdebug_trace(832577542, 0, 0, 0, 0);
  return v3;
}

uint64_t sub_10001A684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFArray *Value;
  const __CFArray *v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  const __CFData *v9;
  const __CFData *v10;
  int Length;
  const __CFData *v12;
  const __CFData *v13;
  uint64_t v14;
  const __CFData *v15;
  const __CFData *v16;
  uint64_t v17;
  CFDictionaryRef theDict;
  _BYTE buf[24];

  v2 = sub_10001A97C(a1);
  if ((_DWORD)v2)
  {
    v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "ISP_LoadFirmware";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Failed to load Bin-format firmware binary: %#08x\n", buf, 0x12u);
    }
  }
  else
  {
    sub_100003728(a1);
    sub_100003AA0(a1);
    sub_10001AD08(a1);
    sub_10001B440();
    theDict = 0;
    sub_1000186DC(v4, &theDict);
    if (theDict)
    {
      Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("ChannelArray"));
      if (Value && (v6 = Value, CFArrayGetCount(Value) >= 1))
      {
        v7 = 0;
        v3 = 0;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v7);
          if (ValueAtIndex)
          {
            v9 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("NVM"));
            if (v9)
            {
              if (((dword_1002C5820 >> v7) & 1) != 0)
              {
                v10 = v9;
                Length = CFDataGetLength(v9);
                printf("sending camera channel %d over-ride NVM bytes to kernel (%d bytes)\n", v7, Length);
                *(_QWORD *)buf = CFDataGetBytePtr(v10);
                *(_QWORD *)&buf[8] = CFDataGetLength(v10);
                *(_QWORD *)&buf[16] = v7;
                v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0x1Au, (const uint64_t *)buf, 3u, 0, 0);
                if ((_DWORD)v3)
                  printf("error sending camera channel %d over-ride NVM bytes to kernel: 0x%08X\n");
              }
              else
              {
                printf("bypassing sending over-ride NVM bypass from unit-info plist for channel %d (mask bit not set)\n");
              }
            }
          }
          ++v7;
        }
        while (CFArrayGetCount(v6) > v7);
      }
      else
      {
        v3 = 0;
      }
      if (theDict)
      {
        v12 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("MultiCameraCalWide"));
        if (v12)
        {
          v13 = v12;
          *(_QWORD *)buf = CFDataGetLength(v12);
          *(_OWORD *)&buf[8] = (unint64_t)CFDataGetBytePtr(v13);
          v14 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0x4Fu, (const uint64_t *)buf, 3u, 0, 0);
          v3 = v14;
          if ((_DWORD)v14)
            printf("error sending multi camera w calibration to kernel: 0x%08X\n", v14);
        }
        if (theDict)
        {
          v15 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("MultiCameraCalSwide"));
          if (v15)
          {
            v16 = v15;
            *(_QWORD *)buf = CFDataGetLength(v15);
            *(_QWORD *)&buf[8] = CFDataGetBytePtr(v16);
            *(_QWORD *)&buf[16] = 1;
            v17 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0x4Fu, (const uint64_t *)buf, 3u, 0, 0);
            v3 = v17;
            if ((_DWORD)v17)
              printf("error sending multi camera sw calibration to kernel: 0x%08X\n", v17);
          }
          if (theDict)
            CFRelease(theDict);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_10001A97C(uint64_t a1)
{
  mach_port_t v2;
  int v4;
  const char *v5;
  const char *v6;
  FILE *v7;
  FILE *v8;
  FILE *v9;
  uint8_t outputStruct[24];
  uint8_t buf[4];
  const char *v13;
  _BYTE outputStructCnt[24];

  *(_QWORD *)outputStructCnt = 24;
  v2 = *(_DWORD *)(a1 + 96);
  if (v2 && (IOConnectCallStructMethod(v2, 0xFu, 0, 0, outputStruct, (size_t *)outputStructCnt), outputStruct[20]))
  {
    *(_QWORD *)outputStructCnt = 0;
    *(_QWORD *)&outputStructCnt[8] = 0;
    *(_QWORD *)&outputStructCnt[16] = *(unsigned int *)(a1 + 48);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "LoadFirmwareBinary";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: CTRR still call the kernel to make fISPCPUFirmwareLoaded true\n", buf, 0xCu);
    }
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 7u, (const uint64_t *)outputStructCnt, 3u, 0, 0);
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 64);
    if (v4 == 10)
    {
      v5 = 0;
      v6 = "/usr/local/share/firmware/isp/h12_isp_fw.bin";
    }
    else if (v4 == 9)
    {
      if (**(_DWORD **)(a1 + 56) == 178)
        v5 = "/usr/local/share/firmware/isp/adc-oceanus.bin";
      else
        v5 = 0;
      v6 = "/usr/local/share/firmware/isp/h11_isp_fw.bin";
    }
    else
    {
      v5 = 0;
      if (v4 == 8)
        v6 = "/usr/local/share/firmware/isp/h10_isp_fw.bin";
      else
        v6 = 0;
    }
    v7 = fopen(v5, "rb");
    v8 = fopen(v6, "rb");
    if (v8)
    {
      v9 = v8;
      if (v7)
        fclose(v7);
    }
    else
    {
      v9 = v7;
      v6 = v5;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136315394;
      *(_QWORD *)&outputStructCnt[4] = "LoadFirmwareBinary";
      *(_WORD *)&outputStructCnt[12] = 2080;
      *(_QWORD *)&outputStructCnt[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Load firmware from %s\n", outputStructCnt, 0x16u);
    }
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)outputStructCnt = 136315138;
        *(_QWORD *)&outputStructCnt[4] = "LoadFirmwareBinary";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: (Bin) Using ISPCPU firmware override file\n", outputStructCnt, 0xCu);
      }
      fseeko(v9, 0, 2);
      ftello(v9);
      fseeko(v9, 0, 0);
      operator new[]();
    }
    perror("error loading ISPCPU firmware");
    *(_QWORD *)outputStructCnt = 0;
    *(_QWORD *)&outputStructCnt[8] = 0;
    *(_QWORD *)&outputStructCnt[16] = *(unsigned int *)(a1 + 48);
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 7u, (const uint64_t *)outputStructCnt, 3u, 0, 0);
  }
}

void sub_10001AD08(uint64_t a1)
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  CFTypeRef v4;
  _BOOL4 v5;
  uint64_t v6;
  _DWORD *v7;
  FILE *v9;
  FILE *v10;
  CFStringRef v11;
  __CFDictionary *Mutable;
  const __CFData *v13;
  const __CFString *v14;
  const char *CStringPtr;
  const char *v16;
  _BOOL4 v17;
  const char *v18;
  const __CFString *v19;
  const char *v20;
  const char *v21;
  const UInt8 *BytePtr;
  unsigned int Length;
  int v24;
  CFStringRef v25;
  const __CFString *v26;
  const char *v27;
  CFErrorRef err;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  _BYTE v32[10];
  __int16 v33;
  const char *v34;

  v2 = IOServiceNameMatching("AppleH10CamIn");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  v4 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("FrontCameraModuleSerialNumString"), kCFAllocatorDefault, 3u);
  v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v30 = "LoadFCClDataFile";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: FrontCameraModuleSerialNumString exists - load FDR FCCl calibration data\n", buf, 0xCu);
    }
    CFRelease(v4);
    v6 = 0;
    v7 = (_DWORD *)(*(_QWORD *)(a1 + 56) + 16);
    while (1)
    {
      if (*(v7 - 2))
      {
        if (*v7 == 1718775412 || *v7 == 1718776695)
          break;
      }
      v7 += 32;
      if (++v6 == 6)
      {
        LODWORD(v6) = 0;
        break;
      }
    }
    v9 = fopen("/usr/local/share/firmware/isp/FCCl-Override.DAT", "rb");
    if (v9)
    {
      v10 = v9;
      fseeko(v9, 0, 2);
      ftello(v10);
      fseeko(v10, 0, 0);
      operator new[]();
    }
    err = 0;
    v11 = CFStringCreateWithCString(kCFAllocatorDefault, "FCCl", 0x8000100u);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, CFSTR("CopyAllowUnsealed"), kCFBooleanTrue);
    AMFDRLogSetHandler(sub_10001BC9C);
    v13 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass(v11, Mutable, &err);
    if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "LoadFCClDataFile";
      v31 = 1024;
      *(_DWORD *)v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: AMFDRSealingMapCopyLocalDataForClass failed! channel:%u\n", buf, 0x12u);
    }
    if (err)
    {
      v14 = CFErrorCopyDescription(err);
      CStringPtr = CFStringGetCStringPtr(v14, 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v16 = "No C string description.";
        if (CStringPtr)
          v16 = CStringPtr;
        *(_DWORD *)buf = 136315394;
        v30 = "LoadFCClDataFile";
        v31 = 2080;
        *(_QWORD *)v32 = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: AMFDRSealingMapCopyLocalDataForClass error: %s\n", buf, 0x16u);
      }
      CFRelease(v14);
      CFRelease(err);
      err = 0;
    }
    if (v13 || !*(_BYTE *)(*(_QWORD *)(a1 + 56) + 881))
      goto LABEL_39;
    v13 = (const __CFData *)AMFDRSealingManifestCopyLocalDataForClass(v11, Mutable, &err);
    v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (!v17)
        goto LABEL_33;
      *(_DWORD *)buf = 136315394;
      v30 = "LoadFCClDataFile";
      v31 = 1024;
      *(_DWORD *)v32 = v6;
      v18 = "%s: Unauthorized swap detected! channel:%u\n";
    }
    else
    {
      if (!v17)
        goto LABEL_33;
      *(_DWORD *)buf = 136315394;
      v30 = "LoadFCClDataFile";
      v31 = 1024;
      *(_DWORD *)v32 = v6;
      v18 = "%s: AMFDRSealingManifestCopyLocalDataForClass failed! channel:%u\n";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, buf, 0x12u);
LABEL_33:
    if (err)
    {
      v19 = CFErrorCopyDescription(err);
      v20 = CFStringGetCStringPtr(v19, 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v21 = "No C string description.";
        if (v20)
          v21 = v20;
        *(_DWORD *)buf = 136315394;
        v30 = "LoadFCClDataFile";
        v31 = 2080;
        *(_QWORD *)v32 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: AMFDRSealingManifestCopyLocalDataForClass error: %s\n", buf, 0x16u);
      }
      CFRelease(v19);
      CFRelease(err);
      err = 0;
    }
LABEL_39:
    if (v13)
    {
      BytePtr = CFDataGetBytePtr(v13);
      Length = CFDataGetLength(v13);
      v24 = sub_10001BBC8(a1, v6 | 0x80000000, (uint64_t)BytePtr, Length, 0x300u);
      v25 = CFCopyDescription(v13);
      if (v25)
      {
        v26 = v25;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v27 = CFStringGetCStringPtr(v26, 0);
          *(_DWORD *)buf = 136315906;
          v30 = "LoadFCClDataFile";
          v31 = 1024;
          *(_DWORD *)v32 = v6;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)&v32[6] = v24;
          v33 = 2080;
          v34 = v27;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: channel = %u, status = %#08x, FCCl data = %s\n", buf, 0x22u);
        }
        CFRelease(v26);
      }
      CFRelease(v13);
    }
    else
    {
      sub_10001BBC8(a1, v6 | 0x80000000, 0, 0, 0x300u);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "LoadFCClDataFile";
        v31 = 1024;
        *(_DWORD *)v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: channel = %u; No module or No FCCl data (perhaps cuz the device does not support FCCl)\n",
          buf,
          0x12u);
      }
    }
    if (v11)
      CFRelease(v11);
    if (Mutable)
      CFRelease(Mutable);
    return;
  }
  if (v5)
  {
    *(_DWORD *)buf = 136315138;
    v30 = "LoadFCClDataFile";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s : Couldn't read front camera module serial number. Sensor is hosed/disconnected. Skip loading FDR FCCl calibration data \n", buf, 0xCu);
  }
}

void sub_10001B440()
{
  const __CFString *v0;
  const __CFString *v1;
  CFIndex Length;
  CFRange v3;
  const char *v4;
  uint8_t *v5;
  const __CFAllocator *v6;
  CFStringRef v7;
  CFMutableStringRef MutableCopy;
  const char *CStringPtr;
  FILE *v10;
  FILE *v11;
  FILE *v12;
  int v13;
  uint8_t *v14;
  uint8_t buf[32];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v0 = (const __CFString *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
  if (v0)
  {
    v1 = v0;
    Length = CFStringGetLength(v0);
    if (CFStringHasSuffix(v1, CFSTR("AP")))
    {
      v3.length = Length - 2;
    }
    else
    {
      if (!CFStringHasSuffix(v1, CFSTR("DEV")))
      {
        v6 = kCFAllocatorDefault;
        goto LABEL_12;
      }
      v3.length = Length - 3;
    }
    v6 = kCFAllocatorDefault;
    if (v3.length >= 1)
    {
      v3.location = 0;
      v7 = CFStringCreateWithSubstring(kCFAllocatorDefault, v1, v3);
      CFRelease(v1);
      v1 = v7;
    }
LABEL_12:
    MutableCopy = CFStringCreateMutableCopy(v6, 0, v1);
    CFStringLowercase(MutableCopy, 0);
    CFShow(MutableCopy);
    CFRelease(v1);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    memset(buf, 0, sizeof(buf));
    strcat((char *)buf, "/System/Library/Isp/afpp/");
    CStringPtr = CFStringGetCStringPtr(MutableCopy, 0x8000100u);
    strcat((char *)buf, CStringPtr);
    strcat((char *)buf, "/ispane.afpp");
    CFRelease(MutableCopy);
    v10 = fopen((const char *)buf, "rb");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = buf;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loading file for ISP-ANE networks - %s \n", (uint8_t *)&v13, 0xCu);
    }
    v11 = fopen("/usr/local/share/firmware/isp/ispane.afpp", "rb");
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using override ISP-ANE AFPP file \n", (uint8_t *)&v13, 2u);
      }
      if (v10)
        fclose(v10);
      v10 = v12;
LABEL_21:
      fseeko(v10, 0, 2);
      ftello(v10);
      fseeko(v10, 0, 0);
      operator new[]();
    }
    if (v10)
      goto LABEL_21;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v4 = "Error opening ISP-ANE networks file. \n";
      v5 = (uint8_t *)&v13;
      goto LABEL_6;
    }
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v4 = "Failed to copy model string from MobileGestalt";
    v5 = buf;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
  }
}

uint64_t sub_10001B8AC(uint64_t a1, _DWORD *inputStruct)
{
  mach_port_t v2;
  uint64_t reference;
  __int128 v5;

  v2 = *(_DWORD *)(a1 + 96);
  if (!v2)
    return 3758097084;
  v5 = 0u;
  return IOConnectCallAsyncMethod(v2, 0x2Bu, inputStruct[4], &reference, 8u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t sub_10001B93C(uint64_t a1, mach_port_t wake_port)
{
  mach_port_t v2;
  uint64_t reference;
  __int128 v5;

  v2 = *(_DWORD *)(a1 + 96);
  if (!v2)
    return 3758097084;
  v5 = 0u;
  return IOConnectCallAsyncMethod(v2, 0x2Cu, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001B9C4(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  mach_port_t v3;
  uint64_t reference;
  __int128 v6;
  uint64_t input[2];

  v3 = *(_DWORD *)(a1 + 96);
  if (!v3)
    return 3758097084;
  input[0] = a3;
  input[1] = 2008;
  v6 = 0u;
  return IOConnectCallAsyncMethod(v3, 0x2Du, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001BA58(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  mach_port_t v3;
  uint64_t reference;
  __int128 v6;
  uint64_t input[2];

  v3 = *(_DWORD *)(a1 + 96);
  if (!v3)
    return 3758097084;
  input[0] = a3;
  input[1] = 2008;
  v6 = 0u;
  return IOConnectCallAsyncMethod(v3, 0x2Eu, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001BAEC(uint64_t a1, mach_port_t wake_port)
{
  mach_port_t v2;
  uint64_t reference;
  __int128 v5;

  v2 = *(_DWORD *)(a1 + 96);
  if (!v2)
    return 3758097084;
  v5 = 0u;
  return IOConnectCallAsyncMethod(v2, 0x32u, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001BB74(uint64_t a1)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  result = *(unsigned int *)(a1 + 96);
  if ((_DWORD)result)
    return !IOConnectCallScalarMethod(result, 0x3Du, 0, 0, &output, &outputCnt) && output == 1;
  return result;
}

uint64_t sub_10001BBC8(uint64_t a1, int a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  mach_port_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t input[4];

  v7 = *(_DWORD *)(a1 + 96);
  if (v7)
  {
    input[0] = a3;
    input[1] = a4;
    input[2] = a2;
    input[3] = a5;
    v8 = IOConnectCallScalarMethod(v7, 0x28u, input, 4u, 0, 0);
  }
  else
  {
    v8 = 3758097084;
  }
  v9 = "true";
  if (a2 >= 0)
    v9 = "false";
  printf("Load data file: channel: %d, type: %d, isEarlyBootDataFile: %s, status: %08x\n", a2 & 0x7FFFFFFF, a5, v9, v8);
  return v8;
}

void sub_10001BC9C(uint64_t a1, uint64_t a2)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "fdrLogMessages";
    v5 = 2080;
    v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %s \n", (uint8_t *)&v3, 0x16u);
  }
}

BOOL sub_10001BD4C(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  _DWORD *i;

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(unsigned __int8 *)(v3 + 843);
  for (i = (_DWORD *)(v3 + 16); ; i += 32)
  {
    if (*(i - 2))
    {
      if (*i == 1718776695 || *i == 1718775412)
        break;
    }
    if (++v2 == 6)
      return v4 != 0;
  }
  *a2 = v2;
  return v4 != 0;
}

BOOL sub_10001BDA8(uint64_t a1, _DWORD *a2)
{
  unint64_t v2;
  _DWORD *v3;
  BOOL v4;

  v2 = 0;
  v3 = (_DWORD *)(*(_QWORD *)(a1 + 56) + 16);
  v4 = 1;
  while (*v3 != 1718186595 || *(v3 - 2) != 1)
  {
    v4 = v2 < 5;
    v3 += 32;
    if (++v2 == 6)
      return 0;
  }
  *a2 = v2;
  return v4;
}

__n128 sub_10001BE08(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8, int a9, unsigned int a10)
{
  const char *v10;
  __int128 v11;
  __n128 result;

  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 0;
  if (a2 > 1028)
  {
    if (a2 > 1554)
    {
      if (a2 > 3413)
      {
        switch(a2)
        {
          case 3414:
            if (a3 == 2)
            {
              *(_QWORD *)a1 = &unk_100091000;
              *(_DWORD *)(a1 + 8) = 7040;
              v10 = "/usr/local/share/firmware/isp/6222_01XX.dat";
            }
            else
            {
              *(_QWORD *)a1 = &unk_10008F000;
              *(_DWORD *)(a1 + 8) = 7040;
              v10 = "/usr/local/share/firmware/isp/6221_01XX.dat";
            }
            break;
          case 26384:
            *(_QWORD *)a1 = &unk_1002C4000;
            *(_DWORD *)(a1 + 8) = 6112;
            v10 = "/usr/local/share/firmware/isp/6920_01XX.dat";
            break;
          case 38754:
            if (a3 == 3)
            {
              *(_QWORD *)a1 = &unk_1002B3000;
              *(_DWORD *)(a1 + 8) = 48148;
              v10 = "/usr/local/share/firmware/isp/7153_02XX.dat";
            }
            else if (a3 == 2)
            {
              *(_QWORD *)a1 = &unk_1002A7000;
              *(_DWORD *)(a1 + 8) = 48148;
              v10 = "/usr/local/share/firmware/isp/7152_02XX.dat";
            }
            else
            {
              *(_QWORD *)a1 = &unk_10029B000;
              *(_DWORD *)(a1 + 8) = 48148;
              v10 = "/usr/local/share/firmware/isp/7151_02XX.dat";
            }
            break;
          default:
            return result;
        }
      }
      else
      {
        switch(a2)
        {
          case 1555:
            *(_QWORD *)a1 = &unk_100277000;
            *(_DWORD *)(a1 + 8) = 38072;
            v10 = "/usr/local/share/firmware/isp/4920_01XX.dat";
            break;
          case 1556:
            *(_QWORD *)a1 = &unk_10028C000;
            *(_DWORD *)(a1 + 8) = 60780;
            v10 = "/usr/local/share/firmware/isp/2921_11XX.dat";
            break;
          case 1812:
            *(_QWORD *)a1 = &unk_100281000;
            *(_DWORD *)(a1 + 8) = 41368;
            v10 = "/usr/local/share/firmware/isp/2021_01XX.dat";
            break;
          default:
            return result;
        }
      }
    }
    else if (a2 > 1284)
    {
      switch(a2)
      {
        case 1285:
          *(_QWORD *)a1 = &unk_100264000;
          *(_DWORD *)(a1 + 8) = 35480;
          v10 = "/usr/local/share/firmware/isp/3911_01XX.dat";
          break;
        case 1300:
          if (a5 == 175)
          {
            *(_QWORD *)a1 = &unk_10020E000;
            *(_DWORD *)(a1 + 8) = 41368;
            v10 = "/usr/local/share/firmware/isp/2851_02XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_100219000;
            *(_DWORD *)(a1 + 8) = 41368;
            v10 = "/usr/local/share/firmware/isp/2851_01XX.dat";
          }
          break;
        case 1539:
          *(_QWORD *)a1 = &unk_10026D000;
          *(_DWORD *)(a1 + 8) = 38136;
          v10 = "/usr/local/share/firmware/isp/7920_01XX.dat";
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(a2)
      {
        case 1029:
          if ((a5 & 0xFFFFFFFC) == 0x50)
          {
            if (a10 > 2)
            {
              *(_QWORD *)a1 = &unk_100197000;
              *(_DWORD *)(a1 + 8) = 39168;
              v10 = "/usr/local/share/firmware/isp/9711_04XX.dat";
            }
            else
            {
              *(_QWORD *)a1 = &unk_10018D000;
              *(_DWORD *)(a1 + 8) = 39096;
              v10 = "/usr/local/share/firmware/isp/9711_03XX.dat";
            }
          }
          else if (a10 > 2)
          {
            *(_QWORD *)a1 = &unk_1001A6000;
            *(_DWORD *)(a1 + 8) = 38628;
            v10 = "/usr/local/share/firmware/isp/9711_02XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_1001A1000;
            *(_DWORD *)(a1 + 8) = 18364;
            v10 = "/usr/local/share/firmware/isp/9711_01XX.dat";
          }
          break;
        case 1044:
          if (a9)
          {
            *(_QWORD *)a1 = &unk_100135000;
            *(_DWORD *)(a1 + 8) = 41516;
            v10 = "/usr/local/share/firmware/isp/2561_01XX.dat";
          }
          else if (a5 == 196)
          {
            if (a10 > 5)
            {
              *(_QWORD *)a1 = &unk_10014B000;
              *(_DWORD *)(a1 + 8) = 41996;
              v10 = "/usr/local/share/firmware/isp/2561_06XX.dat";
            }
            else
            {
              *(_QWORD *)a1 = &unk_100140000;
              *(_DWORD *)(a1 + 8) = 41604;
              v10 = "/usr/local/share/firmware/isp/2561_05XX.dat";
            }
          }
          else if ((a5 - 167) > 3)
          {
            if ((a5 & 0xFFFFFFFC) == 0x50)
            {
              *(_QWORD *)a1 = &unk_10016C000;
              *(_DWORD *)(a1 + 8) = 42052;
              v10 = "/usr/local/share/firmware/isp/2561_09XX.dat";
            }
            else if (a10 > 5)
            {
              *(_QWORD *)a1 = &unk_100182000;
              *(_DWORD *)(a1 + 8) = 41996;
              v10 = "/usr/local/share/firmware/isp/2561_04XX.dat";
            }
            else
            {
              *(_QWORD *)a1 = &unk_100177000;
              *(_DWORD *)(a1 + 8) = 41604;
              v10 = "/usr/local/share/firmware/isp/2561_02XX.dat";
            }
          }
          else if (a10 > 5)
          {
            *(_QWORD *)a1 = &unk_100161000;
            *(_DWORD *)(a1 + 8) = 41996;
            v10 = "/usr/local/share/firmware/isp/2561_08XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_100156000;
            *(_DWORD *)(a1 + 8) = 41604;
            v10 = "/usr/local/share/firmware/isp/2561_07XX.dat";
          }
          break;
        case 1283:
          if (a3 == 3)
          {
            if (a5 == 178)
            {
              *(_QWORD *)a1 = &unk_1001F6000;
              *(_DWORD *)(a1 + 8) = 45980;
              v10 = "/usr/local/share/firmware/isp/7811_82XX.dat";
            }
            else
            {
              *(_QWORD *)a1 = &unk_100202000;
              *(_DWORD *)(a1 + 8) = 45720;
              v10 = "/usr/local/share/firmware/isp/7811_02XX.dat";
            }
          }
          else if (a3 == 2)
          {
            if (a5 == 178)
            {
              *(_QWORD *)a1 = &unk_1001DE000;
              *(_DWORD *)(a1 + 8) = 45980;
              v10 = "/usr/local/share/firmware/isp/7811_83XX.dat";
            }
            else
            {
              *(_QWORD *)a1 = &unk_1001EA000;
              *(_DWORD *)(a1 + 8) = 45720;
              v10 = "/usr/local/share/firmware/isp/7811_03XX.dat";
            }
          }
          else if (a5 == 178)
          {
            *(_QWORD *)a1 = &unk_1001C6000;
            *(_DWORD *)(a1 + 8) = 45980;
            v10 = "/usr/local/share/firmware/isp/7811_81XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_1001D2000;
            *(_DWORD *)(a1 + 8) = 45720;
            v10 = "/usr/local/share/firmware/isp/7811_01XX.dat";
          }
          break;
        default:
          return result;
      }
    }
    goto LABEL_147;
  }
  if (a2 <= 834)
  {
    if (a2 <= 770)
    {
      if (a2 == 553)
      {
        if (a3 == 2)
        {
          *(_QWORD *)a1 = &unk_1001BB000;
          *(_DWORD *)(a1 + 8) = 41872;
          v10 = "/usr/local/share/firmware/isp/8522_01XX.dat";
        }
        else
        {
          *(_QWORD *)a1 = &unk_1001B0000;
          *(_DWORD *)(a1 + 8) = 41872;
          v10 = "/usr/local/share/firmware/isp/8521_01XX.dat";
        }
      }
      else
      {
        if (a2 != 584)
          return result;
        *(_QWORD *)a1 = &unk_1002BF000;
        *(_DWORD *)(a1 + 8) = 17428;
        v10 = "/usr/local/share/firmware/isp/1820_01XX.dat";
      }
    }
    else
    {
      switch(a2)
      {
        case 771:
          if (a4 == 2)
          {
            *(_QWORD *)a1 = &unk_10003D000;
            *(_DWORD *)(a1 + 8) = 18552;
            v10 = "/usr/local/share/firmware/isp/5121_01XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_100042000;
            *(_DWORD *)(a1 + 8) = 18552;
            v10 = "/usr/local/share/firmware/isp/5111_01XX.dat";
          }
          break;
        case 787:
          if (a3 == 1)
          {
            *(_QWORD *)a1 = &unk_100047000;
            *(_DWORD *)(a1 + 8) = 18532;
            v10 = "/usr/local/share/firmware/isp/4121_01XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_10004C000;
            *(_DWORD *)(a1 + 8) = 18532;
            v10 = "/usr/local/share/firmware/isp/4123_01XX.dat";
          }
          break;
        case 788:
          *(_QWORD *)a1 = &unk_100032000;
          *(_DWORD *)(a1 + 8) = 42440;
          v10 = "/usr/local/share/firmware/isp/9151_01XX.dat";
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    if (a2 <= 853)
    {
      if (a2 == 835)
      {
        if (a5 == 162)
        {
          *(_QWORD *)a1 = &unk_100051000;
          *(_DWORD *)(a1 + 8) = 18656;
          v10 = "/usr/local/share/firmware/isp/5221_01XX.dat";
        }
        else
        {
          *(_QWORD *)a1 = &unk_100056000;
          *(_DWORD *)(a1 + 8) = 18544;
          v10 = "/usr/local/share/firmware/isp/5221_02XX.dat";
        }
        goto LABEL_147;
      }
      if (a2 != 851)
      {
        if (a2 != 852)
          return result;
        if (a5 == 162)
        {
          *(_QWORD *)a1 = &unk_10006F000;
          *(_DWORD *)(a1 + 8) = 42420;
          v10 = "/usr/local/share/firmware/isp/9251_01XX.dat";
        }
        else
        {
          *(_QWORD *)a1 = &unk_10007A000;
          *(_DWORD *)(a1 + 8) = 42476;
          v10 = "/usr/local/share/firmware/isp/9251_02XX.dat";
        }
        goto LABEL_147;
      }
      if (a5 == 161)
        goto LABEL_102;
      if (a5 == 162)
      {
        *(_QWORD *)a1 = &unk_10005B000;
        *(_DWORD *)(a1 + 8) = 18656;
        v10 = "/usr/local/share/firmware/isp/4221_01XX.dat";
        goto LABEL_147;
      }
      if ((a5 & 0xFFFFFFFE) != 0xC2)
      {
LABEL_102:
        *(_QWORD *)a1 = &unk_100060000;
        *(_DWORD *)(a1 + 8) = 18544;
        v10 = "/usr/local/share/firmware/isp/4221_02XX.dat";
        goto LABEL_147;
      }
      if (a8 != 5)
      {
        *(_QWORD *)a1 = &unk_10006A000;
        *(_DWORD *)(a1 + 8) = 18708;
        v10 = "/usr/local/share/firmware/isp/4521_02XX.dat";
        goto LABEL_147;
      }
LABEL_101:
      *(_QWORD *)a1 = &unk_100065000;
      *(_DWORD *)(a1 + 8) = 18724;
      v10 = "/usr/local/share/firmware/isp/4521_01XX.dat";
      goto LABEL_147;
    }
    if (a2 == 854)
    {
      if ((a5 - 172) <= 0x36 && ((1 << (a5 + 84)) & 0x40000000000003) != 0)
      {
        *(_QWORD *)a1 = &unk_100085000;
        *(_DWORD *)(a1 + 8) = 37660;
        v10 = "/usr/local/share/firmware/isp/4811_01XX.dat";
        goto LABEL_147;
      }
      goto LABEL_101;
    }
    if (a2 == 882)
    {
      if (a5 == 94)
      {
        *(_QWORD *)a1 = &unk_100244000;
        *(_DWORD *)(a1 + 8) = 63416;
        v10 = "/usr/local/share/firmware/isp/3811_61XX.dat";
      }
      else if (a5 == 178)
      {
        if (a7 && *(unsigned __int8 *)(a7 + 4) <= 0x12u)
        {
          *(_QWORD *)a1 = &unk_100224000;
          *(_DWORD *)(a1 + 8) = 65188;
          v10 = "/usr/local/share/firmware/isp/3811_91XX.dat";
        }
        else
        {
          *(_QWORD *)a1 = &unk_100234000;
          *(_DWORD *)(a1 + 8) = 65244;
          v10 = "/usr/local/share/firmware/isp/3811_81XX.dat";
        }
      }
      else
      {
        *(_QWORD *)a1 = &unk_100254000;
        *(_DWORD *)(a1 + 8) = 64936;
        v10 = "/usr/local/share/firmware/isp/3811_01XX.dat";
      }
      goto LABEL_147;
    }
    if (a2 != 1027)
      return result;
    if ((a5 & 0xFFFFFFFE) == 0x5E)
    {
      *(_QWORD *)a1 = &unk_100093000;
      *(_DWORD *)(a1 + 8) = 37644;
      v10 = "/usr/local/share/firmware/isp/7521_51XX.dat";
    }
    else if (a8 == 4)
    {
      *(_QWORD *)a1 = &unk_100130000;
      *(_DWORD *)(a1 + 8) = 18932;
      v10 = "/usr/local/share/firmware/isp/7521_02XX.dat";
    }
    else
    {
      if (a8 != 5)
        goto LABEL_114;
      if (a10 > 1)
      {
        if (a3 == 3)
        {
          if (a5 == 178)
          {
            *(_QWORD *)a1 = &unk_100115000;
            *(_DWORD *)(a1 + 8) = 66548;
            v10 = "/usr/local/share/firmware/isp/7521_99XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_100126000;
            *(_DWORD *)(a1 + 8) = 39268;
            v10 = "/usr/local/share/firmware/isp/7521_09XX.dat";
          }
        }
        else if (a3 == 2)
        {
          if (a5 == 178)
          {
            *(_QWORD *)a1 = &unk_1000FA000;
            *(_DWORD *)(a1 + 8) = 66548;
            v10 = "/usr/local/share/firmware/isp/7521_98XX.dat";
          }
          else
          {
            *(_QWORD *)a1 = &unk_10010B000;
            *(_DWORD *)(a1 + 8) = 39268;
            v10 = "/usr/local/share/firmware/isp/7521_08XX.dat";
          }
        }
        else if (a3 == 1 && a5 == 178)
        {
          *(_QWORD *)a1 = &unk_1000DF000;
          *(_DWORD *)(a1 + 8) = 66548;
          v10 = "/usr/local/share/firmware/isp/7521_97XX.dat";
        }
        else
        {
          *(_QWORD *)a1 = &unk_1000F0000;
          *(_DWORD *)(a1 + 8) = 39268;
          v10 = "/usr/local/share/firmware/isp/7521_07XX.dat";
        }
        goto LABEL_147;
      }
      if (a3 == 3)
      {
        if (a5 == 178)
        {
          *(_QWORD *)a1 = &unk_1000C9000;
          *(_DWORD *)(a1 + 8) = 66548;
          v10 = "/usr/local/share/firmware/isp/7521_93XX.dat";
        }
        else
        {
          *(_QWORD *)a1 = &unk_1000DA000;
          *(_DWORD *)(a1 + 8) = 19004;
          v10 = "/usr/local/share/firmware/isp/7521_03XX.dat";
        }
        goto LABEL_147;
      }
      if (a3 == 2)
      {
        if (a5 == 178)
        {
          *(_QWORD *)a1 = &unk_1000B3000;
          *(_DWORD *)(a1 + 8) = 66548;
          v10 = "/usr/local/share/firmware/isp/7521_95XX.dat";
        }
        else
        {
          *(_QWORD *)a1 = &unk_1000C4000;
          *(_DWORD *)(a1 + 8) = 19004;
          v10 = "/usr/local/share/firmware/isp/7521_05XX.dat";
        }
        goto LABEL_147;
      }
      if (a3 == 1 && a5 == 178)
      {
        *(_QWORD *)a1 = &unk_10009D000;
        *(_DWORD *)(a1 + 8) = 66548;
        v10 = "/usr/local/share/firmware/isp/7521_91XX.dat";
      }
      else
      {
LABEL_114:
        *(_QWORD *)a1 = &unk_1000AE000;
        *(_DWORD *)(a1 + 8) = 19004;
        v10 = "/usr/local/share/firmware/isp/7521_01XX.dat";
      }
    }
  }
LABEL_147:
  v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)(a1 + 12) = *(_OWORD *)v10;
  *(_OWORD *)(a1 + 28) = v11;
  result = *(__n128 *)(v10 + 28);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

double sub_10001C96C(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8, int a9, unsigned int a10)
{
  double result;

  *(_QWORD *)&result = sub_10001BE08(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10).n128_u64[0];
  return result;
}

uint64_t sub_10001C978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFRunLoopRef Current;

  *(_DWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a3;
  *(_QWORD *)(a1 + 64) = pthread_self();
  Current = CFRunLoopGetCurrent();
  *(_QWORD *)(a1 + 48) = CFRetain(Current);
  *(_QWORD *)(a1 + 72) = 0;
  return a1;
}

uint64_t sub_10001C9C0(uint64_t a1)
{
  unint64_t i;
  const void *ValueAtIndex;
  io_object_t v4;
  IONotificationPort *v5;
  __CFRunLoopSource *v6;
  NSObject *v7;
  const void *v8;

  for (i = 0; i < CFArrayGetCount(*(CFArrayRef *)a1); ++i)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)a1, i);
    sub_1000191B0((uint64_t)ValueAtIndex);
  }
  v4 = *(_DWORD *)(a1 + 56);
  if (v4)
    IOObjectRelease(v4);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
  v5 = *(IONotificationPort **)(a1 + 16);
  if (v5)
  {
    v6 = *(__CFRunLoopSource **)(a1 + 24);
    if (v6)
    {
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 48), v6, kCFRunLoopDefaultMode);
      *(_QWORD *)(a1 + 24) = 0;
      v5 = *(IONotificationPort **)(a1 + 16);
    }
    IONotificationPortDestroy(v5);
  }
  v7 = *(NSObject **)(a1 + 72);
  if (v7)
  {
    dispatch_sync(v7, &stru_10002B8C8);
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    *(_QWORD *)(a1 + 72) = 0;
  }
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
  return a1;
}

uint64_t sub_10001CA90(uint64_t a1)
{
  CFMutableArrayRef v2;
  uint64_t result;
  const __CFDictionary *v4;
  IONotificationPort *v5;
  __CFRunLoopSource *RunLoopSource;
  CFArrayCallBacks callBacks;
  uint8_t buf[4];
  const char *v9;

  callBacks.version = 0;
  callBacks.retain = 0;
  callBacks.copyDescription = 0;
  callBacks.equal = 0;
  callBacks.release = (CFArrayReleaseCallBack)sub_10001CC84;
  v2 = CFArrayCreateMutable(0, 0, &callBacks);
  *(_QWORD *)a1 = v2;
  if (!v2)
    return 3758097085;
  result = IOMasterPort(bootstrap_port, (mach_port_t *)(a1 + 8));
  if ((_DWORD)result)
    return result;
  v4 = IOServiceMatching("AppleH10CamIn");
  v5 = IONotificationPortCreate(*(_DWORD *)(a1 + 8));
  *(_QWORD *)(a1 + 16) = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "IOReturn H10ISP::H10ISPDeviceController::SetupDeviceController()";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: IONotificationPortCreate returned NULL ", buf, 0xCu);
    }
    return 3758097086;
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v5);
  *(_QWORD *)(a1 + 24) = RunLoopSource;
  if (!RunLoopSource)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "IOReturn H10ISP::H10ISPDeviceController::SetupDeviceController()";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: IONotificationPortGetRunLoopSource returned NULL ", buf, 0xCu);
    }
    IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    return 3758097086;
  }
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 48), RunLoopSource, kCFRunLoopDefaultMode);
  result = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 16), "IOServiceMatched", v4, (IOServiceMatchingCallback)sub_10001CCA4, (void *)a1, (io_iterator_t *)(a1 + 56));
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a1 + 72) = dispatch_queue_create("com.apple.h10ispdevicecontroller.notifications.queue", 0);
    sub_10001CCA4((CFArrayRef *)a1, *(_DWORD *)(a1 + 56));
    return 0;
  }
  return result;
}

void sub_10001CC84(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
  {
    v2 = (void *)sub_1000192CC(a2);
    operator delete(v2);
  }
}

uint64_t sub_10001CCA4(CFArrayRef *a1, io_iterator_t iterator)
{
  uint64_t result;
  CFMutableDictionaryRef properties;

  properties = 0;
  while (1)
  {
    result = IOIteratorNext(iterator);
    if (!(_DWORD)result)
      break;
    if (!IORegistryEntryCreateCFProperties(result, &properties, kCFAllocatorDefault, 0))
    {
      if (!CFArrayGetCount(*a1))
        operator new();
      CFRelease(properties);
    }
  }
  return result;
}

void sub_10001CD7C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CD90(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sched_param v7;
  pthread_t v8;
  _QWORD v9[4];
  pthread_mutex_t v10;
  pthread_attr_t v11;

  v8 = 0;
  sub_100011B9C((uint64_t)&v10);
  v9[0] = 0;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = &v10;
  v7 = (sched_param)48;
  pthread_attr_init(&v11);
  pthread_attr_setschedparam(&v11, &v7);
  pthread_attr_setdetachstate(&v11, 1);
  pthread_create(&v8, &v11, (void *(__cdecl *)(void *))sub_10001CE90, v9);
  pthread_attr_destroy(&v11);
  sub_100011BDC(&v10);
  *a1 = v9[0];
  sub_100011BD4((uint64_t)&v10);
  return 0;
}

void sub_10001CE74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void sub_10001CE90(uint64_t a1)
{
  pthread_setname_np("H10ISPServicesThread");
  j__pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 24));
  operator new();
}

void sub_10001CF20(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CF34(uint64_t a1)
{
  __CFRunLoop *v2;
  void *v3;
  void *v5;

  v2 = (__CFRunLoop *)CFRetain(*(CFTypeRef *)(a1 + 48));
  CFRunLoopStop(v2);
  v5 = 0;
  pthread_join(*(pthread_t *)(a1 + 64), &v5);
  v3 = (void *)sub_10001CA8C(a1);
  operator delete(v3);
  CFRelease(v2);
  return 0;
}

uint64_t sub_10001CF90(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  uint64_t IntValue;
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  CFTypeID v10;
  CFTypeID v11;
  unsigned int valuePtr;

  v4 = (const __CFString *)CFPreferencesCopyValue(a1, a2, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      v10 = CFGetTypeID(v5);
      if (v10 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        if (CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr))
          IntValue = valuePtr;
        else
          IntValue = a3;
      }
      else
      {
        v11 = CFGetTypeID(v5);
        IntValue = a3;
        if (v11 == CFBooleanGetTypeID())
          IntValue = CFEqual(v5, kCFBooleanTrue);
      }
      goto LABEL_19;
    }
    IntValue = CFStringGetIntValue(v5);
    if (!(_DWORD)IntValue)
    {
      SystemEncoding = CFStringGetSystemEncoding();
      CStringPtr = CFStringGetCStringPtr(v5, SystemEncoding);
      if (!CStringPtr)
        goto LABEL_7;
      IntValue = strtol(CStringPtr, 0, 0);
    }
    if ((int)IntValue > 0)
    {
LABEL_19:
      CFRelease(v5);
      return IntValue;
    }
LABEL_7:
    IntValue = 1;
    if (CFStringCompare(v5, CFSTR("true"), 1uLL))
    {
      IntValue = 1;
      if (CFStringCompare(v5, CFSTR("yes"), 1uLL))
      {
        if (CFStringCompare(v5, CFSTR("false"), 1uLL) == kCFCompareEqualTo
          || CFStringCompare(v5, CFSTR("no"), 1uLL) == kCFCompareEqualTo
          || (IntValue = a3, CFStringCompare(v5, CFSTR("0"), 1uLL) == kCFCompareEqualTo))
        {
          IntValue = 0;
        }
      }
    }
    goto LABEL_19;
  }
  return a3;
}

unsigned int *sub_10001D140(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  unsigned int *v4;
  uint64_t v5;

  v3 = *(_DWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (unsigned int *)(a1 + 20);
    do
    {
      v5 = *v4;
      if ((unint64_t)v4 + v5 > a1 + a2)
        break;
      if (*((unsigned __int16 *)v4 + 4) == a3)
        return v4 + 1;
      v4 = (unsigned int *)((char *)v4 + (v5 + 4));
      --v3;
    }
    while (v3);
  }
  return 0;
}

CFRunLoopSourceRef sub_10001D18C(uint64_t a1)
{
  CFRunLoopSourceRef result;

  result = *(CFRunLoopSourceRef *)(a1 + 16);
  if (!result)
  {
    result = CFMessagePortCreateRunLoopSource(0, *(CFMessagePortRef *)(a1 + 8), 0);
    *(_QWORD *)(a1 + 16) = result;
  }
  return result;
}

uint64_t sub_10001D1C0(thread_act_t a1, int a2)
{
  pid_t v4;
  uint64_t v5;
  uint64_t v6;
  integer_t v8;
  integer_t policy_info;
  _BYTE buffer[228];
  int v11;

  v8 = 0;
  v4 = getpid();
  if (proc_pidinfo(v4, 2, 0, buffer, 232) <= 0)
  {
    fwrite("H10ISPSetMachThreadPriority - proc_pidinfo() failed\n", 0x34uLL, 1uLL, __stderrp);
    return 0xFFFFFFFFLL;
  }
  else
  {
    policy_info = a2 - v11;
    v5 = thread_policy_set(a1, 3u, &policy_info, 1u);
    if ((_DWORD)v5)
    {
      v6 = v5;
      fprintf(__stderrp, "H10ISPSetMachThreadPriority - thread_policy_set(...,THREAD_PRECEDENCE_POLICY,...) failed, err=%d\n", v5);
    }
    else
    {
      v6 = thread_policy_set(a1, 1u, &v8, 1u);
      if ((_DWORD)v6)
        fprintf(__stderrp, "H10ISPSetMachThreadPriority - thread_policy_set(...,THREAD_EXTENDED_POLICY,...) failed, err=%d\n", v6);
    }
  }
  return v6;
}

void sub_10001D2EC()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5228, "pIn0 != nullptr");
}

void sub_10001D314()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5229, "pContext != nullptr");
}

void sub_10001D33C()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5265, "false");
}

void sub_10001D364()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5234, "false");
}

void sub_10001D38C()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5238, "false");
}

void sub_10001D3B4()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5248, "false");
}

void sub_10001D3DC()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5257, "pContext->geometry.tile.countX * pContext->geometry.tile.countY <= NTILES");
}

void sub_10001D404()
{
  __assert_rtn("Process", "PDAFPixelEngine.cpp", 5140, "pContext->geometry.tile.countX * pContext->geometry.tile.countY <= NTILES");
}

void sub_10001D42C()
{
  __assert_rtn("Process", "PDAFPixelEngine.cpp", 5192, "false");
}

void sub_10001D454()
{
  __assert_rtn("FlowAccumulate", "PDAFPixelEngine.cpp", 2439, "false");
}

void sub_10001D47C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E564("GetFocusRowInCell", "PDAFPixelEngine.cpp", a3, "false");
}

void sub_10001D4A0()
{
  __assert_rtn("FlowAccumulateScalar", "PDAFPixelEngine.cpp", 2229, "false");
}

void sub_10001D4C8()
{
  __assert_rtn("FlowOutputLevel", "PDAFPixelEngine.cpp", 3086, "level == 0");
}

void sub_10001D4F0()
{
  __assert_rtn("FlowOutputLevel", "PDAFPixelEngine.cpp", 3103, "level > 0");
}

void sub_10001D518()
{
  __assert_rtn("FlowOutputLevel", "PDAFPixelEngine.cpp", 3131, "false");
}

void sub_10001D540()
{
  __assert_rtn("FlareEstimate", "PDAFPixelEngine.cpp", 2960, "flare.intensity <= Params::Flare::NINTENSITIES");
}

void sub_10001D568()
{
  __assert_rtn("GetFocusPixelTypeCount", "PDAFPixelEngine.cpp", 252, "false");
}

void sub_10001D590()
{
  __assert_rtn("FlowPostProcess", "PDAFPixelEngine.cpp", 3229, "pContext->params.flow.levels[0] == 1");
}

void sub_10001D5B8()
{
  __assert_rtn("CorrPostProcess", "PDAFPixelEngine.cpp", 4844, "false");
}

void sub_10001D5E0()
{
  __assert_rtn("CorrPostProcess", "PDAFPixelEngine.cpp", 4840, "SamplingH == SamplingV");
}

void sub_10001D608()
{
  __assert_rtn("GetFocusPixelSamplingRateH", "PDAFPixelEngine.cpp", 274, "false");
}

void sub_10001D630()
{
  __assert_rtn("CorrAccumulate", "PDAFPixelEngine.cpp", 4544, "false");
}

void sub_10001D658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E554("CorrProfile", "PDAFPixelEngine.cpp", a3, "pContext->geometry.roi.cellCountX == geometryCorr.profileSize");
}

void sub_10001D67C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E55C("CorrProfile", "PDAFPixelEngine.cpp", a3, "pContext->geometry.roi.cellCountY == geometryCorr.profileSize");
}

void sub_10001D6A0(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  uint64_t v4;

  v3 = (unsigned int *)(a1 + 487248);
  v4 = 5;
  do
  {
    bzero((void *)(a2 + *(v3 - 1)), *v3);
    v3 += 3;
    --v4;
  }
  while (v4);
  __assert_rtn("CorrProfileSumCols2x1V", "PDAFPixelEngine.cpp", 4247, "false");
}

void sub_10001D6F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E56C("FlowAccumulateRow1x1Scalar", "PDAFPixelEngine.cpp", a3, "pixelInBuffer == 0");
}

void sub_10001D71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E54C("nextV", "PDAFPixelEngine.cpp", a3, "false");
}

void sub_10001D740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E544("nextV", "PDAFPixelEngine.cpp", a3, "false");
}

void sub_10001D764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E53C("nextV", "PDAFPixelEngine.cpp", a3, "false");
}

void sub_10001D788()
{
  __assert_rtn("FlowAccumulateRow2x1Scalar", "PDAFPixelEngine.cpp", 1569, "pixelInBuffer == 0");
}

void sub_10001D7B0()
{
  __assert_rtn("FlowAccumulateRow2x1Scalar", "PDAFPixelEngine.cpp", 1473, "!RB_FIRST");
}

void sub_10001D7D8()
{
  __assert_rtn("FlowAccumulateNeon64", "PDAFPixelEngine.cpp", 2397, "false");
}

void sub_10001D800()
{
  __assert_rtn("FlowAccumulateRow1x1Neon64", "PDAFPixelEngine.cpp", 1281, "pixelInBuffer == 0");
}

void sub_10001D828()
{
  __assert_rtn("FlowAccumulateRow1x1Neon64", "PDAFPixelEngine.cpp", 1190, "false");
}

void sub_10001D850()
{
  __assert_rtn("FlowAccumulateRow2x1Neon64", "PDAFPixelEngine.cpp", 1764, "false");
}

void sub_10001D878()
{
  __assert_rtn("FlowAccumulateRow2x1Neon64", "PDAFPixelEngine.cpp", 1698, "!RB_FIRST");
}

void sub_10001D8A0()
{
  __assert_rtn("CorrProfileSumCols2x1V", "PDAFPixelEngine.cpp", 4267, "pixelInRow != 0");
}

void sub_10001D8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E534("nextV", "PDAFPixelEngine.cpp", a3, "false");
}

void sub_10001D8EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E52C("nextV", "PDAFPixelEngine.cpp", a3, "false");
}

void sub_10001D910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E524("nextH", "PDAFPixelEngine.cpp", a3, "false");
}

void sub_10001D934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000E574("FlowAccumulateRow1x1Scalar", "PDAFPixelEngine.cpp", a3, "pixelInBuffer == 0");
}

void sub_10001D958()
{
  __assert_rtn("FlowAccumulateRow2x1Scalar", "PDAFPixelEngine.cpp", 1680, "pixelInBuffer == 0");
}

void sub_10001D980()
{
  __assert_rtn("FlowAccumulateRow1x1Neon64", "PDAFPixelEngine.cpp", 1455, "pixelInBuffer == 0");
}

void sub_10001D9A8()
{
  __assert_rtn("FlowAccumulateRow1x1Neon64", "PDAFPixelEngine.cpp", 1363, "false");
}

void sub_10001D9D0()
{
  __assert_rtn("FlowAccumulateRow2x1Neon64", "PDAFPixelEngine.cpp", 1928, "pixelInBuffer > 0");
}

void sub_10001D9F8()
{
  __assert_rtn("Process", "PDAFPixelEngine.cpp", 5188, "false");
}

void sub_10001DA20()
{
  __assert_rtn("Process", "PDAFPixelEngine.cpp", 5156, "false");
}

void sub_10001DA48()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5278, "pIn0 != nullptr");
}

void sub_10001DA70()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5279, "pIn1 != nullptr");
}

void sub_10001DA98()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5280, "pContext != nullptr");
}

void sub_10001DAC0()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5309, "false");
}

void sub_10001DAE8()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5291, "false");
}

void sub_10001DB10()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5295, "false");
}

void sub_10001DB38()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5305, "false");
}

void sub_10001DB60()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5366, "pIn0 != nullptr");
}

void sub_10001DB88()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5367, "pIn1 != nullptr");
}

void sub_10001DBB0()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5368, "pIn2 != nullptr");
}

void sub_10001DBD8()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5369, "pIn3 != nullptr");
}

void sub_10001DC00()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5370, "pContext != nullptr");
}

void sub_10001DC28()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5397, "false");
}

void sub_10001DC50()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5375, "false");
}

void sub_10001DC78()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5385, "false");
}

void sub_10001DCA0()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5389, "false");
}

void sub_10001DCC8()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5393, "false");
}

void sub_10001DCF0()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 673, "false");
}

void sub_10001DD18()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 652, "afeGeom.initH == 0 || afeGeom.initH == 1");
}

void sub_10001DD40()
{
  __assert_rtn("GetInputFPC", "PDAFPixelEngine.cpp", 726, "fpc != nullptr");
}

void sub_10001DD68()
{
  __assert_rtn("GetInputFPC", "PDAFPixelEngine.cpp", 729, "input.fpcStrides[0] > 0");
}

void sub_10001DD90()
{
  __assert_rtn("GetInputFPC", "PDAFPixelEngine.cpp", 730, "input.fpcStrides[1] > 0");
}

void sub_10001DDB8()
{
  __assert_rtn("GetInputFPC", "PDAFPixelEngine.cpp", 755, "false");
}

void sub_10001DDE0()
{
  __assert_rtn("GetInputAFE", "PDAFPixelEngine.cpp", 773, "afe != nullptr");
}

void sub_10001DE08()
{
  __assert_rtn("GetInputAFE", "PDAFPixelEngine.cpp", 812, "false");
}

void sub_10001DE30()
{
  __assert_rtn("GetInputAFE", "PDAFPixelEngine.cpp", 816, "input.afeStride > 0");
}

void sub_10001DE58()
{
  __assert_rtn("FPCAFEGetInputs", "PDAFPixelEngine.cpp", 858, "(cellCountXH == 0) || (cellCountXH == (signed)geometry.roi.cellCountX)");
}

void sub_10001DE80()
{
  __assert_rtn("FPCAFEGetInputs", "PDAFPixelEngine.cpp", 860, "(cellCountXV == 0) || (cellCountXV == (signed)geometry.roi.cellCountX)");
}

void sub_10001DEA8()
{
  __assert_rtn("GetInputFPC", "PDAFPixelEngine.cpp", 751, "false");
}

void sub_10001DED0()
{
  __assert_rtn("FPCAFEGetInputs", "PDAFPixelEngine.cpp", 843, "inputs[k].cellCountY == (signed)geometry.roi.cellCountY");
}

void sub_10001DEF8()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 653, "afeGeom.initV == -1");
}

void sub_10001DF20()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 658, "afeGeom.initH == 0 || afeGeom.initH == 1");
}

void sub_10001DF48()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 659, "afeGeom.initV == 2 || afeGeom.initV == 3");
}

void sub_10001DF70()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 710, "false");
}

void sub_10001DF98()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 664, "afeGeom.initV == -1");
}

void sub_10001DFC0()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 663, "afeGeom.initH == 0");
}

void sub_10001DFE8()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 669, "afeGeom.initV == 2");
}

void sub_10001E010()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 668, "afeGeom.initH == 0");
}

void sub_10001E038()
{
  __assert_rtn("AFEGetInputs", "PDAFPixelEngine.cpp", 895, "(cellCountXH == 0) || (cellCountXH == (signed)geometry.roi.cellCountX)");
}

void sub_10001E060()
{
  __assert_rtn("AFEGetInputs", "PDAFPixelEngine.cpp", 897, "(cellCountXV == 0) || (cellCountXV == (signed)geometry.roi.cellCountX)");
}

void sub_10001E088()
{
  __assert_rtn("AFEGetInputs", "PDAFPixelEngine.cpp", 886, "inputs[k].cellCountY == (signed)geometry.roi.cellCountY");
}

void sub_10001E0B0()
{
  __assert_rtn("GetAFEAddress", "PDAFPixelEngine.cpp", 442, "false");
}

void sub_10001E0D8()
{
  __assert_rtn("GetAFEAddress", "PDAFPixelEngine.cpp", 415, "afeGeom.cellCountY >= 4");
}

void sub_10001E100()
{
  __assert_rtn("GetAFEAddress", "PDAFPixelEngine.cpp", 416, "afeGeom.cellStartY < afeGeom.cellCountY");
}

void sub_10001E128()
{
  __assert_rtn("GetAFEDelayV", "PDAFPixelEngine.cpp", 376, "false");
}

void sub_10001E150()
{
  __assert_rtn("nextH", "PDAFPixelEngine.cpp", 499, "false");
}

void sub_10001E178()
{
  __assert_rtn("nextH", "PDAFPixelEngine.cpp", 483, "false");
}

void sub_10001E1A0()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 3917, "pixelInCol != 0");
}

void sub_10001E1C8()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 3946, "cellInBuffer == 0");
}

void sub_10001E1F0()
{
  __assert_rtn("CorrProfileProcess", "PDAFPixelEngine.cpp", 4328, "false");
}

void sub_10001E218()
{
  __assert_rtn("CorrProfileProcess", "PDAFPixelEngine.cpp", 4346, "false");
}

void sub_10001E240()
{
  __assert_rtn("CorrProfileAccumScalar", "PDAFPixelEngine.cpp", 3444, "params.shiftMin < 0");
}

void sub_10001E268()
{
  __assert_rtn("CorrProfileAccumScalar", "PDAFPixelEngine.cpp", 3445, "params.shiftMax > 0");
}

void sub_10001E290()
{
  __assert_rtn("CorrProfileAccumNeon64", "PDAFPixelEngine.cpp", 3820, "params.shiftMin < 0");
}

void sub_10001E2B8()
{
  __assert_rtn("CorrProfileAccumNeon64", "PDAFPixelEngine.cpp", 3821, "params.shiftMax > 0");
}

void sub_10001E2E0()
{
  __assert_rtn("CorrProfileSumCols1x1V", "PDAFPixelEngine.cpp", 4046, "pixelInRow != 0");
}

void sub_10001E308()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4168, "pixelInCol != 0");
}

void sub_10001E330()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4187, "cellInBuffer == 0");
}

void sub_10001E358()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 3975, "pixelInCol != 0");
}

void sub_10001E380()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 4010, "cellInBuffer == 0");
}

void sub_10001E3A8()
{
  __assert_rtn("CorrProfileSumCols1x1V", "PDAFPixelEngine.cpp", 4111, "pixelInRow != 0");
}

void sub_10001E3D0()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4207, "pixelInCol != 0");
}

void sub_10001E3F8()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4226, "cellInBuffer == 0");
}

void sub_10001E420()
{
  __assert_rtn("FlowEstimateGainError", "PDAFPixelEngine.cpp", 2886, "false");
}

void sub_10001E448()
{
  __assert_rtn("Process", "BlurM.cpp", 1751, "pContext != 0");
}

void sub_10001E470()
{
  __assert_rtn("LSCAverageGreenApple", "LSCComputeFromNVM.cpp", 780, "pLSCConfig->channelGR.gridCountY == pLSCConfig->channelGB.gridCountY");
}

void sub_10001E498()
{
  __assert_rtn("LSCAverageGreenApple", "LSCComputeFromNVM.cpp", 779, "pLSCConfig->channelGR.gridCountX == pLSCConfig->channelGB.gridCountX");
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_copyPathForPersonalizedData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPathForPersonalizedData:error:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDataAccessor");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}
