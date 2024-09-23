void YonkersAddEntitlementsToTATSURequestDict(const __CFDictionary *a1, __CFDictionary *a2)
{
  const __CFBoolean *Value;
  const __CFBoolean *v5;
  CFTypeID v6;
  int v7;
  const void **v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  CFTypeID v11;
  int v12;
  const void **v13;
  const __CFBoolean *v14;
  const __CFBoolean *v15;
  CFTypeID v16;
  int v17;
  const void **v18;
  const __CFBoolean *v19;
  const __CFBoolean *v20;
  CFTypeID v21;
  int v22;
  const void **v23;
  const __CFBoolean *v24;
  const __CFBoolean *v25;
  CFTypeID v26;
  int v27;
  const void **v28;
  const __CFBoolean *v29;
  const __CFBoolean *v30;
  CFTypeID v31;
  int v32;
  const void **v33;
  const __CFBoolean *v34;
  const __CFBoolean *v35;
  CFTypeID v36;
  int v37;
  const void **v38;
  const __CFBoolean *v39;
  const __CFBoolean *v40;
  CFTypeID v41;
  int v42;
  const void **v43;
  const __CFBoolean *v44;
  const __CFBoolean *v45;
  CFTypeID v46;
  int v47;
  const void **v48;
  const __CFBoolean *v49;
  const __CFBoolean *v50;
  CFTypeID v51;
  int v52;
  const void **v53;
  const __CFBoolean *v54;
  const __CFBoolean *v55;
  CFTypeID v56;
  int v57;
  const void **v58;
  const __CFBoolean *v59;
  const __CFBoolean *v60;
  CFTypeID v61;
  int v62;
  const void **v63;
  const __CFBoolean *v64;
  const __CFBoolean *v65;
  CFTypeID v66;
  int v67;
  const void **v68;

  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,ReadECKey"));
  if (Value)
  {
    v5 = Value;
    v6 = CFGetTypeID(Value);
    if (v6 == CFBooleanGetTypeID())
    {
      v7 = CFBooleanGetValue(v5);
      v8 = (const void **)MEMORY[0x24BDBD270];
      if (!v7)
        v8 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,ReadECKey"), *v8);
    }
  }
  v9 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,WriteECKey"));
  if (v9)
  {
    v10 = v9;
    v11 = CFGetTypeID(v9);
    if (v11 == CFBooleanGetTypeID())
    {
      v12 = CFBooleanGetValue(v10);
      v13 = (const void **)MEMORY[0x24BDBD270];
      if (!v12)
        v13 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,WriteECKey"), *v13);
    }
  }
  v14 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,WriteECID"));
  if (v14)
  {
    v15 = v14;
    v16 = CFGetTypeID(v14);
    if (v16 == CFBooleanGetTypeID())
    {
      v17 = CFBooleanGetValue(v15);
      v18 = (const void **)MEMORY[0x24BDBD270];
      if (!v17)
        v18 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,WriteECID"), *v18);
    }
  }
  v19 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,WriteEpoch"));
  if (v19)
  {
    v20 = v19;
    v21 = CFGetTypeID(v19);
    if (v21 == CFBooleanGetTypeID())
    {
      v22 = CFBooleanGetValue(v20);
      v23 = (const void **)MEMORY[0x24BDBD270];
      if (!v22)
        v23 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,WriteEpoch"), *v23);
    }
  }
  v24 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,ReadGID"));
  if (v24)
  {
    v25 = v24;
    v26 = CFGetTypeID(v24);
    if (v26 == CFBooleanGetTypeID())
    {
      v27 = CFBooleanGetValue(v25);
      v28 = (const void **)MEMORY[0x24BDBD270];
      if (!v27)
        v28 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,ReadGID"), *v28);
    }
  }
  v29 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,ReadFWKey"));
  if (v29)
  {
    v30 = v29;
    v31 = CFGetTypeID(v29);
    if (v31 == CFBooleanGetTypeID())
    {
      v32 = CFBooleanGetValue(v30);
      v33 = (const void **)MEMORY[0x24BDBD270];
      if (!v32)
        v33 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,ReadFWKey"), *v33);
    }
  }
  v34 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,AllowOfflineBoot"));
  if (v34)
  {
    v35 = v34;
    v36 = CFGetTypeID(v34);
    if (v36 == CFBooleanGetTypeID())
    {
      v37 = CFBooleanGetValue(v35);
      v38 = (const void **)MEMORY[0x24BDBD270];
      if (!v37)
        v38 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,AllowOfflineBoot"), *v38);
    }
  }
  v39 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,TempDemote"));
  if (v39)
  {
    v40 = v39;
    v41 = CFGetTypeID(v39);
    if (v41 == CFBooleanGetTypeID())
    {
      v42 = CFBooleanGetValue(v40);
      v43 = (const void **)MEMORY[0x24BDBD270];
      if (!v42)
        v43 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,TempDemote"), *v43);
    }
  }
  v44 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,AccessSensor"));
  if (v44)
  {
    v45 = v44;
    v46 = CFGetTypeID(v44);
    if (v46 == CFBooleanGetTypeID())
    {
      v47 = CFBooleanGetValue(v45);
      v48 = (const void **)MEMORY[0x24BDBD270];
      if (!v47)
        v48 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,AccessSensor"), *v48);
    }
  }
  v49 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,AccessSecurity"));
  if (v49)
  {
    v50 = v49;
    v51 = CFGetTypeID(v49);
    if (v51 == CFBooleanGetTypeID())
    {
      v52 = CFBooleanGetValue(v50);
      v53 = (const void **)MEMORY[0x24BDBD270];
      if (!v52)
        v53 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,AccessSecurity"), *v53);
    }
  }
  v54 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,FADemote"));
  if (v54)
  {
    v55 = v54;
    v56 = CFGetTypeID(v54);
    if (v56 == CFBooleanGetTypeID())
    {
      v57 = CFBooleanGetValue(v55);
      v58 = (const void **)MEMORY[0x24BDBD270];
      if (!v57)
        v58 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,FADemote"), *v58);
    }
  }
  v59 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,DebugStatus"));
  if (v59)
  {
    v60 = v59;
    v61 = CFGetTypeID(v59);
    if (v61 == CFBooleanGetTypeID())
    {
      v62 = CFBooleanGetValue(v60);
      v63 = (const void **)MEMORY[0x24BDBD270];
      if (!v62)
        v63 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,DebugStatus"), *v63);
    }
  }
  v64 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,Provisioning"));
  if (v64)
  {
    v65 = v64;
    v66 = CFGetTypeID(v64);
    if (v66 == CFBooleanGetTypeID())
    {
      v67 = CFBooleanGetValue(v65);
      v68 = (const void **)MEMORY[0x24BDBD270];
      if (!v67)
        v68 = (const void **)MEMORY[0x24BDBD268];
      CFDictionaryAddValue(a2, CFSTR("Yonkers,Provisioning"), *v68);
    }
  }
}

uint64_t CreateYonkersMeasurementDict(const __CFData *a1, CFTypeRef *a2)
{
  const __CFAllocator *v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  UInt8 *v9;
  BOOL v10;
  uint64_t v11;
  unint64_t Length;
  CFDataRef v13;
  CFDataRef v14;
  CC_SHA256_CTX c;
  unsigned __int8 md[16];
  __int128 v18;
  uint64_t v19;
  CFRange v20;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_OWORD *)md = 0u;
  v18 = 0u;
  v8 = CFDictionaryCreateMutable(0, 0, v5, v6);
  v9 = 0;
  if (v8)
    v10 = Mutable == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = 2;
    if (a1 && a2)
    {
      Length = CFDataGetLength(a1);
      v9 = (UInt8 *)calloc(Length, 1uLL);
      if (v9)
      {
        v20.location = 0;
        v20.length = Length;
        CFDataGetBytes(a1, v20, v9);
        if (!(Length >> 20))
        {
          CC_SHA256_Init(&c);
          CC_SHA256_Update(&c, v9, Length);
          CC_SHA256_Final(md, &c);
        }
        v13 = CFDataCreate(v4, md, 32);
        if (v13)
        {
          v14 = v13;
          CFDictionarySetValue(Mutable, CFSTR("Digest"), v13);
          CFDictionarySetValue(v8, CFSTR("MeasurementDictPatch"), Mutable);
          *a2 = SavageSafeRetain(v8);
          CFRelease(v14);
          v11 = 0;
        }
        else
        {
          v11 = 8;
        }
      }
      else
      {
        v11 = 3;
      }
    }
    goto LABEL_12;
  }
  v11 = 3;
  if (Mutable)
LABEL_12:
    CFRelease(Mutable);
  if (v8)
    CFRelease(v8);
  if (v9)
    free(v9);
  return v11;
}

uint64_t CreateYonkersRequestDictForTATSU(const __CFDictionary *a1, const __CFDictionary *a2, CFDictionaryRef theDict, uint64_t a4, CFTypeRef *a5)
{
  CFMutableDictionaryRef Mutable;
  uint64_t v6;
  __CFDictionary *v10;
  const CFDictionaryKeyCallBacks *v11;
  const CFDictionaryValueCallBacks *v12;
  __CFDictionary *v13;
  uint64_t v14;
  const void *v15;
  const void *v16;
  CFTypeID v17;
  const void *v18;
  const void *v19;
  CFTypeID v20;
  const void *v21;
  const void *v22;
  CFTypeID v23;
  const __CFBoolean *v24;
  const __CFBoolean *v25;
  CFTypeID v26;
  const void *v27;
  const __CFBoolean *v28;
  const __CFBoolean *v29;
  CFTypeID v30;
  int v31;
  const __CFBoolean *v32;
  const __CFBoolean *v33;
  CFTypeID v34;
  const __CFBoolean *v35;
  const __CFBoolean *v36;
  CFTypeID v37;
  int v38;
  const void *v39;
  const void *v40;
  CFTypeID v41;
  const void *v42;
  const void *v43;
  CFTypeID v44;
  int YonkersMeasurementTags;
  void *v46;
  const void *v47;
  __CFDictionary *v48;
  __CFDictionary *v49;
  CFTypeID v50;
  const void *v51;
  uint64_t v52;
  const __CFAllocator *v53;
  unint64_t v54;
  int v55;
  CFMutableDictionaryRef v57;
  CFTypeID v58;
  uint64_t v59;
  const __CFAllocator *v60;
  unint64_t v61;
  int v62;
  CFMutableDictionaryRef MutableCopy;
  CFTypeID v65;
  int v67;
  CFTypeRef *v68;
  __CFDictionary *v69;
  int v71;
  const __CFDictionary *Value;
  int valuePtr;
  CFTypeRef v74;
  void *key;

  Mutable = 0;
  v74 = 0;
  key = 0;
  valuePtr = 0;
  v6 = 2;
  if (!a1 || !a2 || !theDict || !a4)
  {
    v10 = 0;
    goto LABEL_66;
  }
  v10 = 0;
  if (!a5)
    goto LABEL_66;
  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("MeasurementDictPatch"));
  v11 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v12 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = CFDictionaryCreateMutable(0, 0, v11, v12);
  v10 = v13;
  v6 = 3;
  if (!v13 || !Mutable || !Value)
    goto LABEL_66;
  v14 = *MEMORY[0x24BDBD270];
  CFDictionaryAddValue(v13, CFSTR("@Yonkers,Ticket"), (const void *)*MEMORY[0x24BDBD270]);
  v15 = CFDictionaryGetValue(a2, CFSTR("Yonkers,BoardID"));
  if (!v15)
    goto LABEL_77;
  v16 = v15;
  v17 = CFGetTypeID(v15);
  if (v17 != CFNumberGetTypeID())
    goto LABEL_77;
  CFDictionaryAddValue(v10, CFSTR("Yonkers,BoardID"), v16);
  v18 = CFDictionaryGetValue(a2, CFSTR("Yonkers,PatchEpoch"));
  if (!v18)
    goto LABEL_77;
  v19 = v18;
  v20 = CFGetTypeID(v18);
  if (v20 != CFNumberGetTypeID())
    goto LABEL_77;
  CFDictionaryAddValue(v10, CFSTR("Yonkers,PatchEpoch"), v19);
  v21 = CFDictionaryGetValue(a1, CFSTR("Yonkers,ChipID"));
  if (!v21)
    goto LABEL_77;
  v22 = v21;
  v23 = CFGetTypeID(v21);
  if (v23 != CFNumberGetTypeID())
    goto LABEL_77;
  CFDictionaryAddValue(v10, CFSTR("Yonkers,ChipID"), v22);
  CFNumberGetValue((CFNumberRef)v22, kCFNumberSInt32Type, &valuePtr);
  v24 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,ProductionMode"));
  if (!v24)
    goto LABEL_77;
  v25 = v24;
  v26 = CFGetTypeID(v24);
  if (v26 != CFBooleanGetTypeID())
    goto LABEL_77;
  v71 = CFBooleanGetValue(v25);
  v27 = (const void *)(v71 ? v14 : *MEMORY[0x24BDBD268]);
  CFDictionaryAddValue(v10, CFSTR("Yonkers,ProductionMode"), v27);
  v28 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("YonkersIsProvisioned"));
  if (v28 && (v29 = v28, v30 = CFGetTypeID(v28), v30 == CFBooleanGetTypeID()))
    v31 = CFBooleanGetValue(v29);
  else
    v31 = 1;
  v32 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("YonkersIsYmgt"));
  if (v32 && (v33 = v32, v34 = CFGetTypeID(v32), v34 == CFBooleanGetTypeID()))
    v67 = CFBooleanGetValue(v33);
  else
    v67 = 0;
  v35 = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("Yonkers,WriteECID"));
  if (v35 && (v36 = v35, v37 = CFGetTypeID(v35), v37 == CFBooleanGetTypeID()))
    v38 = CFBooleanGetValue(v36);
  else
    v38 = 0;
  v39 = CFDictionaryGetValue(a1, CFSTR("Yonkers,ECID"));
  if (!v39)
    goto LABEL_77;
  v40 = v39;
  v41 = CFGetTypeID(v39);
  if (v41 != CFDataGetTypeID())
    goto LABEL_77;
  CFDictionaryAddValue(v10, CFSTR("Yonkers,ECID"), v40);
  v42 = CFDictionaryGetValue(a1, CFSTR("Yonkers,Nonce"));
  if (!v42)
    goto LABEL_77;
  v43 = v42;
  v44 = CFGetTypeID(v42);
  if (v44 != CFDataGetTypeID())
    goto LABEL_77;
  CFDictionaryAddValue(v10, CFSTR("Yonkers,Nonce"), v43);
  YonkersMeasurementTags = GetYonkersMeasurementTags(a1, (CFTypeRef *)&key, &v74);
  v46 = key;
  v6 = 17;
  if (!YonkersMeasurementTags && key)
  {
    v47 = CFDictionaryGetValue(theDict, CFSTR("MeasurementDictPatch"));
    v48 = (__CFDictionary *)SavageSafeRetain(v47);
    if (!v48)
    {
LABEL_66:
      v46 = key;
      goto LABEL_67;
    }
    v49 = v48;
    v50 = CFGetTypeID(v48);
    if (v50 == CFDictionaryGetTypeID())
    {
      v68 = a5;
      v69 = Mutable;
      CFDictionaryAddValue(v49, CFSTR("EPRO"), v27);
      v51 = CFDictionaryGetValue(a1, CFSTR("Yonkers,FabRevision"));
      CFDictionaryAddValue(v49, CFSTR("FabRevision"), v51);
      CFDictionaryAddValue(v10, key, v49);
      CFRelease(v49);
      if (!(v31 | v38))
      {
        CFDictionaryRemoveValue(v10, key);
        if (valuePtr == 1300)
        {
          v59 = 4 * (v67 != 0);
          v60 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          if (v67)
            v61 = 8;
          else
            v61 = 4;
          while (1)
          {
            v62 = dword_215D0BD58[v59];
            if (GetYonkersFabRevisionTags(v62, v71, (CFTypeRef *)&key, 0) || key == 0)
              goto LABEL_74;
            MutableCopy = CFDictionaryCreateMutableCopy(v60, 0, Value);
            if (!MutableCopy)
              goto LABEL_74;
            v49 = MutableCopy;
            v65 = CFGetTypeID(MutableCopy);
            if (v65 != CFDictionaryGetTypeID())
            {
LABEL_75:
              Mutable = v69;
              goto LABEL_76;
            }
            CFDictionarySetValue(v49, CFSTR("EPRO"), v27);
            SavageCFDictionarySetInteger32(v49, CFSTR("FabRevision"), v62);
            CFDictionarySetValue(v10, key, v49);
            CFRelease(v49);
            if (++v59 >= v61)
              goto LABEL_64;
          }
        }
        if (valuePtr == 1044)
        {
          v52 = 4 * (v67 != 0);
          v53 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          if (v67)
            v54 = 6;
          else
            v54 = 4;
          while (1)
          {
            v55 = dword_215D0BD40[v52];
            if (GetYonkersFabRevisionTags(v55, v71, (CFTypeRef *)&key, 0) || key == 0)
              break;
            v57 = CFDictionaryCreateMutableCopy(v53, 0, Value);
            if (!v57)
              break;
            v49 = v57;
            v58 = CFGetTypeID(v57);
            if (v58 != CFDictionaryGetTypeID())
              goto LABEL_75;
            CFDictionarySetValue(v49, CFSTR("EPRO"), v27);
            SavageCFDictionarySetInteger32(v49, CFSTR("FabRevision"), v55);
            CFDictionarySetValue(v10, key, v49);
            CFRelease(v49);
            if (++v52 >= v54)
              goto LABEL_64;
          }
LABEL_74:
          v6 = 17;
          goto LABEL_65;
        }
      }
LABEL_64:
      YonkersAddEntitlementsToTATSURequestDict(a1, v10);
      v6 = 0;
      *v68 = SavageSafeRetain(v10);
LABEL_65:
      Mutable = v69;
      goto LABEL_66;
    }
LABEL_76:
    CFRelease(v49);
LABEL_77:
    v6 = 17;
    goto LABEL_66;
  }
LABEL_67:
  if (v46)
  {
    CFRelease(v46);
    key = 0;
  }
  if (Mutable)
    CFRelease(Mutable);
  if (v10)
    CFRelease(v10);
  return v6;
}

CFDataRef SavageUpdaterCreateLocalCertificateSignature(CFDictionaryRef theDict, CFTypeRef *a2)
{
  const __CFDictionary *v2;
  const __CFBoolean *Value;
  const __CFBoolean *v5;
  CFTypeID v6;
  __int128 *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  const __CFData *v11;
  const __CFData *v12;
  CFTypeID v13;
  const __CFData *v14;
  CFTypeID v15;
  __CFString **v16;
  CFTypeID v17;
  const __CFData *v18;
  CFTypeID v19;
  const __CFData *v20;
  CFTypeID v21;
  const __CFData *v22;
  CFTypeID v23;
  const char *v24;
  size_t v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CFDataRef v33;
  CFDataRef v34;
  _BOOL4 v35;
  CFErrorRef CFErrorWithDomain;
  __int128 v38;
  size_t v39;
  void *v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;

  v2 = theDict;
  v39 = 0;
  v40 = 0;
  v38 = xmmword_24D470638;
  if (!theDict)
  {
    v35 = 0;
    goto LABEL_43;
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Savage,WriteUID"));
  if (Value && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFBooleanGetTypeID()) && CFBooleanGetValue(v5))
  {
    puts("Local Signing - Handling fusing option.");
    v7 = &kSavageProvisioningFirmwareCert;
  }
  else
  {
    v7 = &kSavageSecureBootFirmwareCert;
  }
  v8 = (const __CFBoolean *)CFDictionaryGetValue(v2, CFSTR("Savage,ReadGID"));
  if (v8)
  {
    v9 = v8;
    v10 = CFGetTypeID(v8);
    if (v10 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v9))
      {
        puts("Local Signing - Handling cert option.");
        v7 = &kSavageGidHmacFirmwareCert;
      }
    }
  }
  v11 = (const __CFData *)CFDictionaryGetValue(v2, CFSTR("Savage,Nonce"));
  v12 = v11;
  if (!v11)
    goto LABEL_44;
  v13 = CFGetTypeID(v11);
  if (v13 != CFDataGetTypeID())
    goto LABEL_42;
  v41.location = 0;
  v41.length = 16;
  CFDataGetBytes(v12, v41, (UInt8 *)v7 + 65);
  v14 = (const __CFData *)CFDictionaryGetValue(v2, CFSTR("Savage,ProductionMode"));
  v12 = v14;
  if (!v14)
    goto LABEL_44;
  v15 = CFGetTypeID(v14);
  if (v15 != CFBooleanGetTypeID())
  {
LABEL_42:
    v35 = 0;
    v2 = 0;
LABEL_43:
    v34 = 0;
    v12 = 0;
    goto LABEL_35;
  }
  *((_BYTE *)v7 + 25) = CFBooleanGetValue(v12) != 0;
  if (CFBooleanGetValue(v12))
  {
    v12 = (const __CFData *)CFDictionaryGetValue(v2, CFSTR("Savage,B0-Prod-Patch"));
    if (v12)
      goto LABEL_21;
    v16 = &kSavageTagMeasurementB2ProdPatch;
  }
  else
  {
    v12 = (const __CFData *)CFDictionaryGetValue(v2, CFSTR("Savage,B0-Dev-Patch"));
    if (v12)
      goto LABEL_21;
    v16 = &kSavageTagMeasurementB2DevPatch;
  }
  v12 = (const __CFData *)CFDictionaryGetValue(v2, *v16);
  if (!v12)
    goto LABEL_44;
LABEL_21:
  v17 = CFGetTypeID(v12);
  if (v17 != CFDictionaryGetTypeID())
    goto LABEL_42;
  v18 = (const __CFData *)CFDictionaryGetValue(v12, CFSTR("Digest"));
  v12 = v18;
  if (!v18)
    goto LABEL_44;
  v19 = CFGetTypeID(v18);
  if (v19 != CFDataGetTypeID() || CFDataGetLength(v12) != 32)
    goto LABEL_42;
  v42.length = CFDataGetLength(v12);
  v42.location = 0;
  CFDataGetBytes(v12, v42, (UInt8 *)v7 + 31);
  v20 = (const __CFData *)CFDictionaryGetValue(v2, CFSTR("Savage,ChipID"));
  v12 = v20;
  if (!v20)
    goto LABEL_44;
  v21 = CFGetTypeID(v20);
  if (v21 != CFNumberGetTypeID() || !CFNumberGetValue(v12, kCFNumberSInt8Type, (char *)v7 + 4))
    goto LABEL_42;
  v22 = (const __CFData *)CFDictionaryGetValue(v2, CFSTR("Savage,UID"));
  v12 = v22;
  if (!v22)
  {
LABEL_44:
    v35 = 0;
    v2 = 0;
    v34 = 0;
    goto LABEL_35;
  }
  v23 = CFGetTypeID(v22);
  if (v23 != CFDataGetTypeID())
    goto LABEL_42;
  v43.location = 0;
  v43.length = 16;
  CFDataGetBytes(v12, v43, (UInt8 *)v7 + 7);
  v12 = 0;
  if (_createDataSignature(0, v7, 0x73uLL, &v40, &v39, &v38))
  {
    v24 = "failed to Img4EncodeCreateManifest";
  }
  else
  {
    v24 = "manifest is null or zero manifesetLen";
    if (v40 && v39)
    {
      v25 = v39 + kSavageSignedLeafCertificate_len + 115;
      printf("Result of creating signature: outDataLen = %d, leafCertLen = %d, certLen = %d, manifestLen = %d \n", v39 + kSavageSignedLeafCertificate_len + 115, kSavageSignedLeafCertificate_len, 115, v39);
      v12 = (const __CFData *)calloc(1uLL, v25);
      memcpy(v12, &kSavageSignedLeafCertificate, kSavageSignedLeafCertificate_len);
      v26 = (char *)v12 + kSavageSignedLeafCertificate_len;
      v27 = v7[3];
      v29 = *v7;
      v28 = v7[1];
      *((_OWORD *)v26 + 2) = v7[2];
      *((_OWORD *)v26 + 3) = v27;
      *(_OWORD *)v26 = v29;
      *((_OWORD *)v26 + 1) = v28;
      v31 = v7[5];
      v30 = v7[6];
      v32 = v7[4];
      *(_DWORD *)(v26 + 111) = *(_DWORD *)((char *)v7 + 111);
      *((_OWORD *)v26 + 5) = v31;
      *((_OWORD *)v26 + 6) = v30;
      *((_OWORD *)v26 + 4) = v32;
      memcpy(v26 + 115, v40, v39);
      v33 = CFDataCreate(0, (const UInt8 *)v12, v25);
      if (v33)
      {
        v34 = v33;
        v35 = 0;
        v2 = 0;
        goto LABEL_35;
      }
      v24 = "failed to CFDataCreate for manifest data";
    }
  }
  CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v24, 0xEu, (uint64_t)v2, CFSTR("SavageErrorDomain"));
  v2 = CFErrorWithDomain;
  v34 = 0;
  v35 = CFErrorWithDomain != 0;
  if (a2 && CFErrorWithDomain)
  {
    v34 = 0;
    *a2 = SavageSafeRetain(CFErrorWithDomain);
    v35 = 1;
  }
LABEL_35:
  if (v40)
  {
    free(v40);
    v40 = 0;
  }
  if (v12)
    free(v12);
  if (v35)
    CFRelease(v2);
  return v34;
}

uint64_t _computeDigestSHA256(const void *a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t result;
  CC_LONG v6;
  CC_SHA256_CTX c;

  result = 0xFFFFFFFFLL;
  if (a1 && a3)
  {
    v6 = a2;
    if (a2 < 0x100000)
    {
      memset(&c, 0, sizeof(c));
      CC_SHA256_Init(&c);
      CC_SHA256_Update(&c, a1, v6);
      return CC_SHA256_Final(a3, &c);
    }
    else
    {
      printf("Computing signature for buffer %p whose size 0x%08zx is too large.  Failing. \n", a1, a2);
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void _loadAndMeasureFile(const char *a1, unsigned __int8 *a2, CFDataRef *a3)
{
  FILE *v5;
  FILE *v6;
  off_t v7;
  void *v8;
  void *v9;
  size_t v10;

  v5 = fopen(a1, "rb");
  if (v5)
  {
    v6 = v5;
    fseeko(v5, 0, 2);
    v7 = ftello(v6);
    fseeko(v6, 0, 0);
    if (v7 >= 0x100000)
    {
      puts("Input firmware file too large.  Failing. ");
    }
    else
    {
      v8 = calloc(v7, 1uLL);
      if (v8)
      {
        v9 = v8;
        v10 = fread(v8, 1uLL, v7, v6);
        fclose(v6);
        if (v10 == v7)
        {
          _computeDigestSHA256(v9, v7, a2);
          if (a3)
            *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD248], (const UInt8 *)v9, v7);
        }
        else
        {
          puts("Could not read Savage firmware patch file");
        }
        free(v9);
      }
      else
      {
        puts("Could not allocate Savage firmware buffer");
        fclose(v6);
      }
    }
  }
  else
  {
    perror("Error opening Savage firmware patch file \n");
  }
}

void _loadAndMeasureVTFile(const char *a1, unsigned __int8 *a2, CFDataRef *a3)
{
  FILE *v5;
  FILE *v6;
  int64_t v7;
  size_t v8;
  char *v9;
  char *v10;
  size_t v11;
  uint64_t v12;
  char *v13;
  unint64_t *v14;
  unint64_t v15;
  _BYTE v16[224];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = fopen(a1, "rb");
  if (v5)
  {
    v6 = v5;
    fseeko(v5, 0, 2);
    v7 = ftello(v6);
    if (v7 < 0x100000 && (v8 = v7, (v9 = (char *)calloc(v7, 1uLL)) != 0))
    {
      v10 = v9;
      fseeko(v6, 0, 0);
      v11 = fread(v10, 1uLL, v8, v6);
      fclose(v6);
      if (v11 == v8)
      {
        v12 = 0;
        v13 = v10;
        v14 = (unint64_t *)&qword_215D0BEC0;
        do
        {
          v15 = *v14++;
          _computeDigestSHA256(v13, v15, &v16[v12]);
          v13 += v15;
          v12 += 32;
        }
        while (v12 != 224);
        _computeDigestSHA256(v16, 0xE0uLL, a2);
        if (a3)
          *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD248], (const UInt8 *)v10, v8);
      }
      fclose(v6);
      free(v10);
    }
    else
    {
      fclose(v6);
    }
  }
}

uint64_t _createDataSignature(uint64_t a1, const void *a2, unint64_t a3, _QWORD *a4, size_t *a5, _QWORD *a6)
{
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  size_t v20;
  _OWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  memset(v21, 0, sizeof(v21));
  v11 = MEMORY[0x2199EFFE8]();
  v12 = (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
  v20 = v12;
  MEMORY[0x24BDAC7A8]();
  v14 = (uint64_t *)((char *)&v19 - v13);
  if (!a6)
    return 0xFFFFFFFFLL;
  v15 = 0xFFFFFFFFLL;
  if (!a4)
    return v15;
  if (!a5)
    return v15;
  v15 = 0xFFFFFFFFLL;
  if (!a2 || !a3)
    return v15;
  if (!*a6 || !a6[1])
    return 0xFFFFFFFFLL;
  v15 = _computeDigestSHA256(a2, a3, (unsigned __int8 *)v21);
  *v14 = v11;
  if (!ccec_der_import_priv())
  {
    v16 = calloc(1uLL, v12);
    if (v16)
    {
      v17 = v16;
      ccDRBGGetRngState();
      if (!ccec_sign())
      {
        *a4 = v17;
        *a5 = v20;
        printf("Result of creating signature: %d \n", v15);
        return 0;
      }
    }
  }
  return v15;
}

__CFDictionary *SavageUpdaterGetTagsWithLogging(const __CFDictionary *a1, uint64_t (*a2)(_QWORD, _QWORD), uint64_t a3, CFTypeRef *a4)
{
  logSinkFunc = a2;
  logContext = a3;
  return SavageUpdaterGetTags(a1, a4);
}

__CFDictionary *SavageUpdaterGetTags(const __CFDictionary *a1, CFTypeRef *a2)
{
  __CFDictionary *Mutable;
  const __CFAllocator *v5;
  __CFArray *v6;
  __CFArray *v7;
  const void *v8;
  const void *v9;
  CFTypeID v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *v13;
  const void *v14;
  CFTypeRef v15;
  CFTypeID v16;
  unsigned int YonkersMeasurementTags;
  const __CFData *v18;
  const __CFData *v19;
  CFTypeID v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *v24;
  const char *v26;
  unsigned int v27;
  uint64_t v28;
  CFErrorRef CFErrorWithDomain;
  const __CFString *v30;
  const char *v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  int CString;
  const char *v36;
  UInt8 buffer[4];
  void *v38;
  void *value;
  void *v40;
  void *v41;
  CFRange v42;

  v40 = 0;
  v41 = 0;
  v38 = 0;
  value = 0;
  *(_DWORD *)buffer = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterGetTags: Cannot allocate memory for outputDict", 3u, 0, CFSTR("SavageErrorDomain"));
    v15 = 0;
    v6 = 0;
    goto LABEL_50;
  }
  if (a1)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v6 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (v6)
    {
      v7 = CFArrayCreateMutable(v5, 0, MEMORY[0x24BDBD690]);
      if (v7)
      {
        v8 = CFDictionaryGetValue(a1, CFSTR("DeviceInfo"));
        if (v8)
        {
          v9 = v8;
          v10 = CFGetTypeID(v8);
          if (v10 == CFDictionaryGetTypeID())
          {
            v11 = CFCopyDescription(v9);
            if (v11)
            {
              v12 = v11;
              if (CFStringGetCString(v11, logString, 4096, 0))
                v13 = logString;
              else
                v13 = "No C string description available.";
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterGetTags", v13);
              CFRelease(v12);
            }
            else
            {
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterGetTags", "No C string description available.");
            }
            a1 = (const __CFDictionary *)SavageSafeRetain(v9);
            v14 = CFDictionaryGetValue(a1, CFSTR("YonkersDeviceInfo"));
            v15 = v14;
            if (v14)
            {
              v16 = CFGetTypeID(v14);
              if (v16 == CFDictionaryGetTypeID())
              {
                v15 = SavageSafeRetain(v15);
                YonkersMeasurementTags = GetYonkersMeasurementTags((CFDictionaryRef)v15, (CFTypeRef *)&value, (CFTypeRef *)&v38);
                if (YonkersMeasurementTags || !value)
                {
                  v30 = CFSTR("YonkersErrorDomain");
                  v31 = "SavageUpdaterGetTags: Unable to get kYonkersTagMeasurementPatch";
                  v32 = (uint64_t)v15;
LABEL_57:
                  CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v31, YonkersMeasurementTags, v32, v30);
                  goto LABEL_58;
                }
                CFArrayAppendValue(v6, CFSTR("SEP"));
                CFArrayAppendValue(v6, CFSTR("Yonkers,BoardID"));
                CFArrayAppendValue(v6, CFSTR("Yonkers,ChipID"));
                CFArrayAppendValue(v6, CFSTR("Yonkers,PatchEpoch"));
                CFArrayAppendValue(v6, value);
                CFArrayAppendValue(v6, v38);
                CFArrayAppendValue(v7, CFSTR("Yonkers,Ticket"));
                if (v15 && CFDictionaryGetCount(a1) == 1)
                {
LABEL_30:
                  CFDictionaryAddValue(Mutable, CFSTR("BuildIdentityTags"), v6);
                  CFDictionaryAddValue(Mutable, CFSTR("ResponseTags"), v7);
                  v22 = CFCopyDescription(Mutable);
                  if (v22)
                  {
                    v23 = v22;
                    if (CFStringGetCString(v22, logString, 4096, 0))
                      v24 = logString;
                    else
                      v24 = "No C string description available.";
                    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterGetTags", v24);
                    CFRelease(v23);
                  }
                  else
                  {
                    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterGetTags", "No C string description available.");
                  }
                  goto LABEL_36;
                }
              }
              else
              {
                v15 = 0;
              }
            }
            YonkersMeasurementTags = GetRelevantMeasurementTags(a1, (__CFString **)&v41, (__CFString **)&v40);
            if (v41)
            {
              if (v40)
              {
                CFArrayAppendValue(v6, CFSTR("Savage,ChipID"));
                CFArrayAppendValue(v6, CFSTR("Savage,PatchEpoch"));
                CFArrayAppendValue(v6, v41);
                CFArrayAppendValue(v6, v40);
                v18 = (const __CFData *)CFDictionaryGetValue(a1, CFSTR("Savage,ChipID"));
                if (v18)
                {
                  v19 = v18;
                  v20 = CFGetTypeID(v18);
                  v21 = CFSTR("Savage,Ticket");
                  if (v20 == CFDataGetTypeID())
                  {
                    v42.location = 0;
                    v42.length = 4;
                    CFDataGetBytes(v19, v42, buffer);
                    *(_DWORD *)buffer = bswap32(*(unsigned int *)buffer);
                    if (*(_DWORD *)buffer > 0x5064u)
                      v21 = CFSTR("Brunor,Ticket");
                  }
                }
                else
                {
                  v21 = CFSTR("Savage,Ticket");
                }
                CFArrayAppendValue(v7, v21);
                goto LABEL_30;
              }
              v30 = CFSTR("SavageErrorDomain");
              v31 = "SavageUpdaterGetTags: Unable to get kSavageTagMeasurementPatchRepair";
            }
            else
            {
              v30 = CFSTR("SavageErrorDomain");
              v31 = "SavageUpdaterGetTags: Unable to get kSavageTagMeasurementPatch";
            }
            v32 = (uint64_t)a1;
            goto LABEL_57;
          }
        }
        v26 = "SavageUpdaterGetTags: DeviceInfo is NULL?";
        v27 = 17;
        v28 = (uint64_t)a1;
      }
      else
      {
        v26 = "SavageUpdaterGetTags: Cannot allocate memory for tagsInTssResponse";
        v27 = 3;
        v28 = 0;
      }
      CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v26, v27, v28, CFSTR("SavageErrorDomain"));
      v15 = 0;
      goto LABEL_53;
    }
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterGetTags: Cannot allocate memory for tagsInBI", 3u, 0, CFSTR("SavageErrorDomain"));
    v15 = 0;
LABEL_50:
    v7 = 0;
LABEL_53:
    a1 = 0;
    goto LABEL_58;
  }
  CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterGetTags: options is NULL", 2u, 0, CFSTR("SavageErrorDomain"));
  v15 = 0;
  v6 = 0;
  v7 = 0;
LABEL_58:
  if (a2 && CFErrorWithDomain)
  {
    *a2 = SavageSafeRetain(CFErrorWithDomain);
    v33 = CFErrorCopyDescription(CFErrorWithDomain);
    if (v33)
    {
      v34 = v33;
      CString = CFStringGetCString(v33, logString, 4096, 0);
      v36 = "No C string description available.";
      if (CString)
        v36 = logString;
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterGetTags", v36);
      CFRelease(v34);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterGetTags", "No C string description available.");
    }
    if (Mutable)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    goto LABEL_69;
  }
  if (CFErrorWithDomain)
LABEL_69:
    CFRelease(CFErrorWithDomain);
  if (v7)
LABEL_36:
    CFRelease(v7);
  if (v6)
    CFRelease(v6);
  if (v15)
    CFRelease(v15);
  if (a1)
    CFRelease(a1);
  if (value)
    CFRelease(value);
  return Mutable;
}

__CFData *SavageUpdaterCopyFirmwareWithLogging(const __CFDictionary *a1, uint64_t (*a2)(_QWORD, _QWORD), uint64_t a3, CFTypeRef *a4)
{
  logSinkFunc = a2;
  logContext = a3;
  return SavageUpdaterCopyFirmware(a1, a4);
}

__CFData *SavageUpdaterCopyFirmware(const __CFDictionary *a1, CFTypeRef *a2)
{
  const void *Value;
  const void *v4;
  CFTypeID v5;
  const __CFString *v6;
  const __CFString *v7;
  int CString;
  const char *v9;
  const __CFDictionary *v10;
  const __CFData *v11;
  const __CFData *v12;
  CFTypeID v13;
  const __CFDictionary *v14;
  unsigned int YonkersMeasurementTags;
  const __CFData *FileData;
  const __CFData *v17;
  const __CFData *v18;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  __CFData *v21;
  const __CFData *v22;
  const __CFData *v23;
  unsigned int RelevantMeasurementTags;
  const __CFData *v25;
  const UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v28;
  CFIndex v29;
  const __CFString *v30;
  const __CFString *v31;
  const char *v32;
  const __CFString *v33;
  const __CFString *v34;
  const char *v35;
  const __CFString *v36;
  const __CFString *v37;
  const char *v38;
  const char *v40;
  uint64_t v41;
  __CFError *CFErrorWithDomain;
  unsigned int v43;
  const char *v44;
  uint64_t v45;
  UInt8 bytes[8];
  uint64_t v48;
  CFErrorRef err;
  __CFString *v50;
  __CFString *v51;
  CFTypeRef v52;
  CFTypeRef cf;
  CFRange v54;

  *(_QWORD *)bytes = 0;
  v52 = 0;
  cf = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  err = 0;
  if (!a1)
  {
    v40 = "SavageUpdaterCopyFirmware: options is NULL";
    v41 = 0;
    goto LABEL_81;
  }
  Value = CFDictionaryGetValue(a1, CFSTR("DeviceInfo"));
  if (!Value || (v4 = Value, v5 = CFGetTypeID(Value), v5 != CFDictionaryGetTypeID()))
  {
    v40 = "SavageUpdaterCopyFirmware: Missing device info";
    v41 = (uint64_t)a1;
LABEL_81:
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v40, 2u, v41, CFSTR("SavageErrorDomain"));
    v20 = 0;
    v12 = 0;
    v18 = 0;
    v10 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v14 = 0;
    goto LABEL_98;
  }
  v6 = CFCopyDescription(v4);
  if (v6)
  {
    v7 = v6;
    CString = CFStringGetCString(v6, logString, 4096, 0);
    v9 = "No C string description available.";
    if (CString)
      v9 = logString;
    SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCopyFirmware", v9);
    CFRelease(v7);
  }
  else
  {
    SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
  }
  v10 = (const __CFDictionary *)SavageSafeRetain(v4);
  v11 = (const __CFData *)CFDictionaryGetValue(v10, CFSTR("YonkersDeviceInfo"));
  v12 = v11;
  if (!v11)
  {
    v14 = 0;
    v18 = 0;
LABEL_24:
    v20 = 0;
    goto LABEL_25;
  }
  v13 = CFGetTypeID(v11);
  if (v13 != CFDictionaryGetTypeID())
  {
    v14 = 0;
    v18 = 0;
    v12 = 0;
    goto LABEL_24;
  }
  v14 = (const __CFDictionary *)SavageSafeRetain(v12);
  YonkersMeasurementTags = GetYonkersMeasurementTags(v14, &cf, &v52);
  if (YonkersMeasurementTags)
  {
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Didn't get yonkers patch measurement tags", YonkersMeasurementTags, (uint64_t)v14, CFSTR("YonkersErrorDomain"));
    v20 = 0;
    v12 = 0;
    goto LABEL_89;
  }
  FileData = (const __CFData *)CreateFileData(a1, (const __CFString *)cf, (CFTypeRef *)&err);
  v12 = FileData;
  if (err)
  {
    v20 = 0;
    v18 = 0;
LABEL_92:
    v21 = 0;
    v22 = 0;
    goto LABEL_93;
  }
  if (!FileData || !CFDataGetLength(FileData))
  {
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Empty Yonkers firmware file?", 4u, (uint64_t)a1, CFSTR("YonkersErrorDomain"));
    v20 = 0;
LABEL_89:
    v18 = 0;
    goto LABEL_96;
  }
  v17 = (const __CFData *)CreateFileData(a1, (const __CFString *)v52, (CFTypeRef *)&err);
  v18 = v17;
  if (err)
  {
    v20 = 0;
    goto LABEL_92;
  }
  if (!v17 || !CFDataGetLength(v17))
  {
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Empty Yonkers alt firmware file?", 4u, (uint64_t)a1, CFSTR("YonkersErrorDomain"));
    v20 = 0;
LABEL_96:
    v21 = 0;
    v22 = 0;
    goto LABEL_97;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v20 = Mutable;
  if (!Mutable)
  {
    v44 = "SavageUpdaterCopyFirmware: Cannot allocate memory for outputDict";
    v43 = 3;
    v45 = (uint64_t)a1;
LABEL_95:
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v44, v43, v45, CFSTR("SavageErrorDomain"));
    goto LABEL_96;
  }
  CFDictionaryAddValue(Mutable, CFSTR("YonkersFirmware"), v12);
  CFDictionaryAddValue(v20, CFSTR("YonkersFirmwareAlt"), v18);
  if (!v14 || CFDictionaryGetCount(v10) != 1)
  {
LABEL_25:
    RelevantMeasurementTags = GetRelevantMeasurementTags(v10, &v51, &v50);
    if (!RelevantMeasurementTags)
    {
      v25 = (const __CFData *)CreateFileData(a1, v51, (CFTypeRef *)&err);
      v22 = v25;
      if (!err)
      {
        if (v25 && CFDataGetLength(v25))
        {
          v23 = (const __CFData *)CreateFileData(a1, v50, (CFTypeRef *)&err);
          if (err && CFErrorGetCode(err) == 19)
          {
            v21 = 0;
            goto LABEL_48;
          }
          v21 = CFDataCreateMutable(0, 0);
          if (v21)
          {
            *(_DWORD *)&bytes[4] = CFDataGetLength(v22);
            CFDataAppendBytes(v21, bytes, 16);
            BytePtr = CFDataGetBytePtr(v22);
            Length = CFDataGetLength(v22);
            CFDataAppendBytes(v21, BytePtr, Length);
            if (v23)
            {
              LODWORD(v48) = CFDataGetLength(v23);
              v54.location = 0;
              v54.length = 16;
              CFDataReplaceBytes(v21, v54, bytes, 16);
              v28 = CFDataGetBytePtr(v23);
              v29 = CFDataGetLength(v23);
              CFDataAppendBytes(v21, v28, v29);
            }
            if (v20)
            {
              CFDictionaryAddValue(v20, CFSTR("SavageFirmware"), v21);
              CFRelease(v21);
              v21 = 0;
            }
            goto LABEL_36;
          }
          CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Cannot allocate memory for savageFirmwareData", 3u, (uint64_t)a1, CFSTR("SavageErrorDomain"));
LABEL_98:
          err = CFErrorWithDomain;
          goto LABEL_48;
        }
        CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Empty Savage firmware file", 4u, (uint64_t)a1, CFSTR("SavageErrorDomain"));
        v21 = 0;
LABEL_97:
        v23 = 0;
        goto LABEL_98;
      }
      v21 = 0;
LABEL_93:
      v23 = 0;
      goto LABEL_48;
    }
    v43 = RelevantMeasurementTags;
    v44 = "SavageUpdaterCopyFirmware: Unable to get savage patch measurement tags";
    v45 = (uint64_t)v10;
    goto LABEL_95;
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
LABEL_36:
  v30 = CFCopyDescription(v20);
  if (v30)
  {
    v31 = v30;
    if (CFStringGetCString(v30, logString, 4096, 0))
      v32 = logString;
    else
      v32 = "No C string description available.";
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", v32);
    CFRelease(v31);
  }
  else
  {
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
  }
  v33 = CFCopyDescription(v21);
  if (v33)
  {
    v34 = v33;
    if (CFStringGetCString(v33, logString, 4096, 0))
      v35 = logString;
    else
      v35 = "No C string description available.";
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", v35);
    CFRelease(v34);
  }
  else
  {
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
  }
LABEL_48:
  if (a2 && err)
  {
    *a2 = SavageSafeRetain(err);
    v36 = CFErrorCopyDescription(err);
    if (v36)
    {
      v37 = v36;
      if (CFStringGetCString(v36, logString, 4096, 0))
        v38 = logString;
      else
        v38 = "No C string description available.";
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCopyFirmware", v38);
      CFRelease(v37);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
    }
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v52)
  {
    CFRelease(v52);
    v52 = 0;
  }
  if (err)
  {
    CFRelease(err);
    err = 0;
  }
  if (v14)
    CFRelease(v14);
  if (v10)
    CFRelease(v10);
  if (v22)
    CFRelease(v22);
  if (v23)
    CFRelease(v23);
  if (v12)
    CFRelease(v12);
  if (v18)
    CFRelease(v18);
  if (v20)
    return v20;
  else
    return v21;
}

CFAllocatorRef SavageUpdaterCreateRequestWithLogging(const __CFDictionary *a1, uint64_t (*a2)(_QWORD, _QWORD), uint64_t a3, CFTypeRef *a4)
{
  logSinkFunc = a2;
  logContext = a3;
  return SavageUpdaterCreateRequest(a1, a4);
}

CFAllocatorRef SavageUpdaterCreateRequest(const __CFDictionary *a1, CFTypeRef *a2)
{
  const void *Value;
  CFTypeRef v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const void *v9;
  CFTypeRef v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *v13;
  const void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const char *v17;
  CFTypeID v18;
  const void *v19;
  const __CFData *v20;
  const __CFData *v21;
  unsigned int v22;
  const void *v23;
  const __CFData *v24;
  const __CFData *v25;
  const __CFString *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  CFErrorRef CFErrorWithDomain;
  const __CFDictionary *v31;
  CFTypeID v32;
  const __CFData *v33;
  const __CFString *v34;
  const __CFString *v35;
  const char *v36;
  const __CFString *v37;
  const __CFString *v38;
  const char *v39;
  const void *v40;
  const __CFDictionary *v41;
  const __CFDictionary *v42;
  CFTypeID v43;
  const void *v44;
  const __CFString *v45;
  const __CFString *v46;
  const char *v47;
  const void *v48;
  unsigned int YonkersRequestDictForTATSU;
  CFAllocatorRef v50;
  unsigned int v51;
  uint64_t v52;
  const __CFString *v53;
  const __CFString *v54;
  int CString;
  const char *v56;
  const __CFDictionary *v57;
  CFMutableDataRef Mutable;
  CFMutableDictionaryRef v59;
  __CFDictionary *v60;
  const __CFString *v61;
  const __CFString *v62;
  CFTypeID v63;
  const __CFString *v64;
  const __CFString *v65;
  CFTypeID v66;
  const __CFData *v67;
  const __CFData *v68;
  CFTypeID v69;
  __CFData *v70;
  const __CFString *v71;
  __CFDictionary *v72;
  CFMutableDataRef v73;
  const __CFBoolean *v74;
  const __CFBoolean *v75;
  CFTypeID v76;
  int v77;
  __CFData *v78;
  const void *v79;
  const void *v80;
  CFTypeID v81;
  const void *v82;
  const void *v83;
  CFTypeID v84;
  unsigned int RelevantMeasurementTags;
  unsigned int v86;
  const void *v87;
  const void *v88;
  CFTypeID v89;
  const __CFDictionary *v90;
  const __CFDictionary *v91;
  CFTypeID v92;
  const void *v93;
  const void *v94;
  CFTypeID v95;
  const __CFBoolean *v96;
  const __CFBoolean *v97;
  CFTypeID v98;
  __CFData *v99;
  const __CFBoolean *v100;
  unsigned int v101;
  const __CFBoolean *v102;
  CFTypeID v103;
  __CFData *v104;
  const __CFBoolean *v105;
  const __CFBoolean *v106;
  CFTypeID v107;
  __CFData *v108;
  const __CFBoolean *v109;
  const __CFBoolean *v110;
  CFTypeID v111;
  __CFData *v112;
  const __CFBoolean *v113;
  const __CFBoolean *v114;
  CFTypeID v115;
  __CFData *v116;
  const __CFBoolean *v117;
  const __CFBoolean *v118;
  CFTypeID v119;
  __CFData *v120;
  const __CFBoolean *v121;
  const __CFBoolean *v122;
  CFTypeID v123;
  __CFData *v124;
  const __CFBoolean *v125;
  const __CFBoolean *v126;
  CFTypeID v127;
  __CFData *v128;
  const __CFBoolean *v129;
  const __CFBoolean *v130;
  CFTypeID v131;
  __CFData *v132;
  const __CFBoolean *v133;
  const __CFBoolean *v134;
  CFTypeID v135;
  __CFData *v136;
  const __CFBoolean *v137;
  const __CFBoolean *v138;
  CFTypeID v139;
  __CFData *v140;
  const __CFBoolean *v141;
  const __CFBoolean *v142;
  CFTypeID v143;
  __CFData *v144;
  const __CFBoolean *v145;
  const __CFBoolean *v146;
  CFTypeID v147;
  __CFData *v148;
  const __CFBoolean *v149;
  const __CFBoolean *v150;
  CFTypeID v151;
  __CFData *v152;
  const __CFBoolean *v153;
  const __CFBoolean *v154;
  CFTypeID v155;
  __CFData *v156;
  const __CFBoolean *v157;
  const __CFBoolean *v158;
  CFTypeID v159;
  __CFData *v160;
  const __CFString *v161;
  const __CFString *v162;
  const char *v163;
  CFTypeRef *v165;
  const __CFDictionary *v166;
  __CFData *v167;
  __CFDictionary *theDict;
  __CFData *v169;
  CFAllocatorRef allocator;
  CFTypeRef v171;
  CFTypeRef cf;
  __CFString *v173;
  void *key;
  UInt8 buffer[4];
  CFRange v176;

  v171 = 0;
  cf = 0;
  allocator = 0;
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, CFSTR("BuildIdentity")))
    {
      Value = CFDictionaryGetValue(a1, CFSTR("BuildIdentity"));
      v5 = SavageSafeRetain(Value);
      v6 = CFCopyDescription(v5);
      if (v6)
      {
        v7 = v6;
        if (CFStringGetCString(v6, logString, 4096, 0))
          v8 = logString;
        else
          v8 = "No C string description available.";
        SavageRestoreInfoLog("%s [input]: BuildIdentity %s \n", "SavageUpdaterCreateRequest", v8);
        CFRelease(v7);
        if (v5)
        {
LABEL_8:
          if (CFDictionaryContainsKey(a1, CFSTR("DeviceInfo")))
          {
            v9 = CFDictionaryGetValue(a1, CFSTR("DeviceInfo"));
            v10 = SavageSafeRetain(v9);
            v11 = CFCopyDescription(v10);
            if (v11)
            {
              v12 = v11;
              if (CFStringGetCString(v11, logString, 4096, 0))
                v13 = logString;
              else
                v13 = "No C string description available.";
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCreateRequest", v13);
              CFRelease(v12);
              if (v10)
                goto LABEL_14;
            }
            else
            {
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
              if (v10)
              {
LABEL_14:
                if (!CFDictionaryContainsKey(a1, CFSTR("FirmwareData")))
                  goto LABEL_49;
                v14 = CFDictionaryGetValue(a1, CFSTR("FirmwareData"));
                v15 = CFCopyDescription(v14);
                if (v15)
                {
                  v16 = v15;
                  if (CFStringGetCString(v15, logString, 4096, 0))
                    v17 = logString;
                  else
                    v17 = "No C string description available.";
                  SavageRestoreInfoLog("%s [input]: FirmwareData %s \n", "SavageUpdaterCreateRequest", v17);
                  CFRelease(v16);
                  if (v14)
                    goto LABEL_20;
                }
                else
                {
                  SavageRestoreInfoLog("%s [input]: FirmwareData %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                  if (v14)
                  {
LABEL_20:
                    v18 = CFGetTypeID(v14);
                    if (v18 == CFDictionaryGetTypeID())
                    {
                      v19 = CFDictionaryGetValue((CFDictionaryRef)v14, CFSTR("SavageFirmware"));
                      v20 = (const __CFData *)SavageSafeRetain(v19);
                      if (v20)
                      {
                        v21 = v20;
                        v22 = CreateMeasurementDict(v20, &cf);
                        CFRelease(v21);
                        if (v22)
                        {
                          v26 = CFSTR("SavageErrorDomain");
                          v27 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Savage.";
                          goto LABEL_256;
                        }
                      }
                      v23 = CFDictionaryGetValue((CFDictionaryRef)v14, CFSTR("YonkersFirmware"));
                      v24 = (const __CFData *)SavageSafeRetain(v23);
                      if (v24)
                      {
                        v25 = v24;
                        v22 = CreateYonkersMeasurementDict(v24, &v171);
                        CFRelease(v25);
                        if (v22)
                        {
                          v26 = CFSTR("YonkersErrorDomain");
                          v27 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Yonkers.";
LABEL_256:
                          v51 = v22;
                          v52 = (uint64_t)v14;
                          goto LABEL_66;
                        }
                      }
                    }
                    else
                    {
                      v32 = CFGetTypeID(v14);
                      if (v32 == CFDataGetTypeID())
                      {
                        v33 = (const __CFData *)SavageSafeRetain(v14);
                        v22 = CreateMeasurementDict(v33, &cf);
                        if (v33)
                          CFRelease(v33);
                        if (v22)
                        {
                          v26 = CFSTR("SavageErrorDomain");
                          v27 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Savage (Old way).";
                          goto LABEL_256;
                        }
                      }
                    }
                    v34 = CFCopyDescription(cf);
                    if (v34)
                    {
                      v35 = v34;
                      if (CFStringGetCString(v34, logString, 4096, 0))
                        v36 = logString;
                      else
                        v36 = "No C string description available.";
                      SavageRestoreInfoLog("%s [input]: SavageMeasurementDict - %s \n", "SavageUpdaterCreateRequest", v36);
                      CFRelease(v35);
                    }
                    else
                    {
                      SavageRestoreInfoLog("%s [input]: SavageMeasurementDict - %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                    }
                    v37 = CFCopyDescription(v171);
                    if (v37)
                    {
                      v38 = v37;
                      if (CFStringGetCString(v37, logString, 4096, 0))
                        v39 = logString;
                      else
                        v39 = "No C string description available.";
                      SavageRestoreInfoLog("%s [input]: YonkersMeasurementDict - %s \n", "SavageUpdaterCreateRequest", v39);
                      CFRelease(v38);
                    }
                    else
                    {
                      SavageRestoreInfoLog("%s [input]: YonkersMeasurementDict - %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                    }
LABEL_49:
                    if (!CFDictionaryContainsKey(a1, CFSTR("ReceiptManifest")))
                      goto LABEL_65;
                    v40 = CFDictionaryGetValue(a1, CFSTR("ReceiptManifest"));
                    v14 = SavageSafeRetain(v40);
                    v41 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v14, CFSTR("SEP"));
                    if (v41)
                    {
                      v42 = v41;
                      v43 = CFGetTypeID(v41);
                      if (v43 == CFDictionaryGetTypeID())
                      {
                        v44 = CFDictionaryGetValue(v42, CFSTR("Digest"));
                        v45 = CFCopyDescription(v44);
                        if (v45)
                        {
                          v46 = v45;
                          if (CFStringGetCString(v45, logString, 4096, 0))
                            v47 = logString;
                          else
                            v47 = "No C string description available.";
                          SavageRestoreInfoLog("%s [input]: SEP Digest from ReceiptManifest - %s \n", "SavageUpdaterCreateRequest", v47);
                          CFRelease(v46);
                        }
                        else
                        {
                          SavageRestoreInfoLog("%s [input]: SEP Digest from ReceiptManifest - %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                        }
                      }
                    }
                    if (!v14)
                    {
LABEL_65:
                      v26 = CFSTR("SavageErrorDomain");
                      v27 = "SavageUpdaterCreateRequest: ReceiptManifest is missing in input options";
                      v51 = 6;
                      v52 = (uint64_t)a1;
LABEL_66:
                      CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v27, v51, v52, v26);
                      v14 = 0;
                      goto LABEL_67;
                    }
                    if (CFDictionaryContainsKey((CFDictionaryRef)v10, CFSTR("YonkersDeviceInfo")))
                    {
                      v48 = CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("YonkersDeviceInfo"));
                      v31 = (const __CFDictionary *)SavageSafeRetain(v48);
                      YonkersRequestDictForTATSU = CreateYonkersRequestDictForTATSU(v31, (const __CFDictionary *)v5, (CFDictionaryRef)v171, (uint64_t)v14, (CFTypeRef *)&allocator);
                      if (YonkersRequestDictForTATSU || !allocator)
                      {
                        CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: CreateYonkersRequestDictForTATSU fails.", YonkersRequestDictForTATSU, (uint64_t)a1, CFSTR("YonkersErrorDomain"));
                        goto LABEL_68;
                      }
                      if (v31 && CFDictionaryGetCount((CFDictionaryRef)v10) == 1)
                      {
                        v50 = allocator;
                        goto LABEL_224;
                      }
                      v165 = a2;
                    }
                    else
                    {
                      v165 = a2;
                      v31 = 0;
                    }
                    v57 = (const __CFDictionary *)cf;
                    *(_DWORD *)buffer = 0;
                    v173 = 0;
                    key = 0;
                    Mutable = CFDataCreateMutable(0, 0);
                    v59 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                    if (!v57)
                    {
                      v60 = 0;
                      v101 = 2;
                      goto LABEL_216;
                    }
                    if (allocator)
                    {
                      v60 = (__CFDictionary *)SavageSafeRetain(allocator);
                    }
                    else
                    {
                      v60 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                      if (!v60)
                      {
                        v101 = 3;
                        goto LABEL_216;
                      }
                    }
                    v61 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("Savage,ChipID"));
                    if (!v61)
                    {
                      v101 = 17;
                      goto LABEL_216;
                    }
                    v62 = v61;
                    theDict = v59;
                    v63 = CFGetTypeID(v61);
                    if (v63 != CFStringGetTypeID())
                    {
LABEL_245:
                      v101 = 17;
                      goto LABEL_215;
                    }
                    if (!SavageCFStringToUInt32(v62, buffer, 0))
                      goto LABEL_246;
                    SavageCFDictionarySetInteger32(v60, CFSTR("Savage,ChipID"), *(int *)buffer);
                    v64 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("Savage,PatchEpoch"));
                    if (!v64)
                      goto LABEL_245;
                    v65 = v64;
                    v66 = CFGetTypeID(v64);
                    if (v66 != CFStringGetTypeID())
                      goto LABEL_245;
                    if (!SavageCFStringToUInt32(v65, buffer, 0))
                    {
LABEL_246:
                      v101 = 11;
                      goto LABEL_215;
                    }
                    SavageCFDictionarySetInteger32(v60, CFSTR("Savage,PatchEpoch"), *(int *)buffer);
                    v67 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,ChipID"));
                    if (v67 && (v68 = v67, v69 = CFGetTypeID(v67), v69 == CFDataGetTypeID()))
                    {
                      v176.location = 0;
                      v176.length = 4;
                      CFDataGetBytes(v68, v176, buffer);
                      *(_DWORD *)buffer = bswap32(*(unsigned int *)buffer);
                      v70 = (__CFData *)*MEMORY[0x24BDBD270];
                      if (*(_DWORD *)buffer >= 0x5065u)
                      {
                        CFDictionaryAddValue(v60, CFSTR("@Brunor,Ticket"), (const void *)*MEMORY[0x24BDBD270]);
                        v71 = CFSTR("Brunor,FdrRootCaDigest");
                        v72 = v60;
                        v73 = Mutable;
                        goto LABEL_98;
                      }
                    }
                    else
                    {
                      v70 = (__CFData *)*MEMORY[0x24BDBD270];
                    }
                    v71 = CFSTR("@Savage,Ticket");
                    v72 = v60;
                    v73 = v70;
LABEL_98:
                    CFDictionaryAddValue(v72, v71, v73);
                    v74 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,ProductionMode"));
                    if (v74)
                    {
                      v75 = v74;
                      v167 = Mutable;
                      v76 = CFGetTypeID(v74);
                      if (v76 != CFBooleanGetTypeID())
                        goto LABEL_244;
                      v77 = CFBooleanGetValue(v75);
                      v169 = (__CFData *)*MEMORY[0x24BDBD268];
                      v78 = v77 ? v70 : (__CFData *)*MEMORY[0x24BDBD268];
                      CFDictionaryAddValue(v60, CFSTR("Savage,ProductionMode"), v78);
                      v79 = CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,UID"));
                      if (!v79
                        || (v80 = v79, v81 = CFGetTypeID(v79), v81 != CFDataGetTypeID())
                        || (CFDictionaryAddValue(v60, CFSTR("Savage,UID"), v80),
                            (v82 = CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,Nonce"))) == 0)
                        || (v83 = v82, v84 = CFGetTypeID(v82), v84 != CFDataGetTypeID()))
                      {
LABEL_244:
                        v101 = 17;
LABEL_214:
                        Mutable = v167;
LABEL_215:
                        v59 = theDict;
                        goto LABEL_216;
                      }
                      v166 = v31;
                      CFDictionaryAddValue(v60, CFSTR("Savage,Nonce"), v83);
                      RelevantMeasurementTags = GetRelevantMeasurementTags((CFDictionaryRef)v10, (__CFString **)&key, &v173);
                      v86 = RelevantMeasurementTags;
                      if (key && v173)
                      {
                        v87 = CFDictionaryGetValue(v57, CFSTR("MeasurementDictPatch"));
                        if (v87)
                        {
                          v88 = v87;
                          v89 = CFGetTypeID(v87);
                          if (v89 == CFDictionaryGetTypeID())
                          {
                            CFDictionaryAddValue(v60, key, v88);
                            v90 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v14, CFSTR("SEP"));
                            if (v90)
                            {
                              v91 = v90;
                              v92 = CFGetTypeID(v90);
                              if (v92 == CFDictionaryGetTypeID())
                              {
                                v93 = CFDictionaryGetValue(v91, CFSTR("Digest"));
                                if (v93)
                                {
                                  v94 = v93;
                                  v95 = CFGetTypeID(v93);
                                  if (v95 == CFDataGetTypeID())
                                  {
                                    CFDictionarySetValue(theDict, CFSTR("Digest"), v94);
                                    CFDictionaryAddValue(v60, CFSTR("SEP"), theDict);
                                  }
                                }
                              }
                            }
                            v96 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Brunor,HarvestWrap"));
                            if (v96)
                            {
                              v97 = v96;
                              v98 = CFGetTypeID(v96);
                              if (v98 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v97))
                                  v99 = v70;
                                else
                                  v99 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Brunor,HarvestWrap"), v99);
                              }
                            }
                            v100 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Brunor,HarvestUnwrap"));
                            v101 = v86;
                            if (v100)
                            {
                              v102 = v100;
                              v103 = CFGetTypeID(v100);
                              if (v103 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v102))
                                  v104 = v70;
                                else
                                  v104 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Brunor,HarvestUnwrap"), v104);
                              }
                            }
                            v105 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Brunor,Authenticate"));
                            v31 = v166;
                            if (v105)
                            {
                              v106 = v105;
                              v107 = CFGetTypeID(v105);
                              if (v107 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v106))
                                  v108 = v70;
                                else
                                  v108 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Brunor,Authenticate"), v108);
                              }
                            }
                            v109 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,ReadECKey"));
                            if (v109)
                            {
                              v110 = v109;
                              v111 = CFGetTypeID(v109);
                              if (v111 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v110))
                                  v112 = v70;
                                else
                                  v112 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,ReadECKey"), v112);
                              }
                            }
                            v113 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,WriteECKey"));
                            if (v113)
                            {
                              v114 = v113;
                              v115 = CFGetTypeID(v113);
                              if (v115 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v114))
                                  v116 = v70;
                                else
                                  v116 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,WriteECKey"), v116);
                              }
                            }
                            v117 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,WriteUID"));
                            if (v117)
                            {
                              v118 = v117;
                              v119 = CFGetTypeID(v117);
                              if (v119 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v118))
                                  v120 = v70;
                                else
                                  v120 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,WriteUID"), v120);
                              }
                            }
                            v121 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,WriteEpoch"));
                            if (v121)
                            {
                              v122 = v121;
                              v123 = CFGetTypeID(v121);
                              if (v123 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v122))
                                  v124 = v70;
                                else
                                  v124 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,WriteEpoch"), v124);
                              }
                            }
                            v125 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,ReadGID"));
                            if (v125)
                            {
                              v126 = v125;
                              v127 = CFGetTypeID(v125);
                              if (v127 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v126))
                                  v128 = v70;
                                else
                                  v128 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,ReadGID"), v128);
                              }
                            }
                            v129 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,ReadFWKey"));
                            if (v129)
                            {
                              v130 = v129;
                              v131 = CFGetTypeID(v129);
                              if (v131 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v130))
                                  v132 = v70;
                                else
                                  v132 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,ReadFWKey"), v132);
                              }
                            }
                            v133 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,AllowOfflineBoot"));
                            if (v133)
                            {
                              v134 = v133;
                              v135 = CFGetTypeID(v133);
                              if (v135 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v134))
                                  v136 = v70;
                                else
                                  v136 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,AllowOfflineBoot"), v136);
                              }
                            }
                            v137 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,TempDemote"));
                            if (v137)
                            {
                              v138 = v137;
                              v139 = CFGetTypeID(v137);
                              if (v139 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v138))
                                  v140 = v70;
                                else
                                  v140 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,TempDemote"), v140);
                              }
                            }
                            v141 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,AccessSensor"));
                            if (v141)
                            {
                              v142 = v141;
                              v143 = CFGetTypeID(v141);
                              if (v143 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v142))
                                  v144 = v70;
                                else
                                  v144 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,AccessSensor"), v144);
                              }
                            }
                            v145 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,AccessSecurity"));
                            if (v145)
                            {
                              v146 = v145;
                              v147 = CFGetTypeID(v145);
                              if (v147 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v146))
                                  v148 = v70;
                                else
                                  v148 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,AccessSecurity"), v148);
                              }
                            }
                            v149 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,FADemote"));
                            if (v149)
                            {
                              v150 = v149;
                              v151 = CFGetTypeID(v149);
                              if (v151 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v150))
                                  v152 = v70;
                                else
                                  v152 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,FADemote"), v152);
                              }
                            }
                            v153 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,DebugStatus"));
                            if (v153)
                            {
                              v154 = v153;
                              v155 = CFGetTypeID(v153);
                              if (v155 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v154))
                                  v156 = v70;
                                else
                                  v156 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,DebugStatus"), v156);
                              }
                            }
                            v157 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("Savage,Provisioning"));
                            if (v157)
                            {
                              v158 = v157;
                              v159 = CFGetTypeID(v157);
                              if (v159 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v158))
                                  v160 = v70;
                                else
                                  v160 = v169;
                                CFDictionaryAddValue(v60, CFSTR("Savage,Provisioning"), v160);
                              }
                            }
                            if (!allocator)
                              allocator = (CFAllocatorRef)SavageSafeRetain(v60);
                            goto LABEL_214;
                          }
                        }
                        v101 = 17;
                        Mutable = v167;
                        v59 = theDict;
                      }
                      else
                      {
                        Mutable = v167;
                        v59 = theDict;
                        v101 = RelevantMeasurementTags;
                      }
                      v31 = v166;
LABEL_216:
                      if (Mutable)
                        CFRelease(Mutable);
                      if (v59)
                        CFRelease(v59);
                      if (v60)
                        CFRelease(v60);
                      if (v101 || (v50 = allocator) == 0)
                      {
                        CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: CreateRequestDictForTATSU fails.", v101, (uint64_t)a1, CFSTR("SavageErrorDomain"));
                        a2 = v165;
                        goto LABEL_68;
                      }
LABEL_224:
                      v161 = CFCopyDescription(v50);
                      if (v161)
                      {
                        v162 = v161;
                        if (CFStringGetCString(v161, logString, 4096, 0))
                          v163 = logString;
                        else
                          v163 = "No C string description available.";
                        SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCreateRequest", v163);
                        CFRelease(v162);
                      }
                      else
                      {
                        SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                      }
                      goto LABEL_230;
                    }
                    goto LABEL_245;
                  }
                }
                CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: kSavageOptionFirmwareData is NULL in input options", 2u, (uint64_t)a1, CFSTR("SavageErrorDomain"));
LABEL_67:
                v31 = 0;
                goto LABEL_68;
              }
            }
          }
          CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: Cannot get DeviceInfo", 2u, (uint64_t)a1, CFSTR("SavageErrorDomain"));
          v14 = 0;
          v10 = 0;
          goto LABEL_67;
        }
      }
      else
      {
        SavageRestoreInfoLog("%s [input]: BuildIdentity %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
        if (v5)
          goto LABEL_8;
      }
    }
    v28 = "SavageUpdaterCreateRequest: BuildIdentity is NULL in input options";
    v29 = (uint64_t)a1;
  }
  else
  {
    v28 = "SavageUpdaterCreateRequest: options is NULL";
    v29 = 0;
  }
  CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v28, 2u, v29, CFSTR("SavageErrorDomain"));
  v14 = 0;
  v10 = 0;
  v31 = 0;
  v5 = 0;
LABEL_68:
  if (a2 && CFErrorWithDomain)
  {
    *a2 = SavageSafeRetain(CFErrorWithDomain);
    v53 = CFErrorCopyDescription(CFErrorWithDomain);
    if (v53)
    {
      v54 = v53;
      CString = CFStringGetCString(v53, logString, 4096, 0);
      v56 = "No C string description available.";
      if (CString)
        v56 = logString;
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCreateRequest", v56);
      CFRelease(v54);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
    }
  }
  else if (!CFErrorWithDomain)
  {
    if (!v14)
      goto LABEL_231;
LABEL_230:
    CFRelease(v14);
    goto LABEL_231;
  }
  CFRelease(CFErrorWithDomain);
  if (v14)
    goto LABEL_230;
LABEL_231:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v171)
  {
    CFRelease(v171);
    v171 = 0;
  }
  if (v5)
    CFRelease(v5);
  if (v10)
    CFRelease(v10);
  if (v31)
    CFRelease(v31);
  return allocator;
}

const char *SavageRestoreInfoLog(const char *a1, ...)
{
  const char *result;
  char __str[4096];
  uint64_t v3;
  va_list va;

  va_start(va, a1);
  result = (const char *)MEMORY[0x24BDAC7A8](a1);
  v3 = *MEMORY[0x24BDAC8D0];
  if (logSinkFunc)
  {
    vsnprintf(__str, 0x1000uLL, result, va);
    return (const char *)logSinkFunc(logContext, __str);
  }
  return result;
}

CFTypeRef CreateFileData(const __CFDictionary *a1, const __CFString *a2, CFTypeRef *a3)
{
  const __CFString *v6;
  const __CFString *v7;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  char *v10;
  const char *v11;
  const __CFDictionary *Value;
  const __CFDictionary *v13;
  const void *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  const void *v20;
  const __CFDictionary *v21;
  const void *v22;
  const __CFDictionary *v23;
  const void *v24;
  const __CFDictionary *v25;
  const void *v26;
  const void *v27;
  unsigned int v28;
  const __CFString *v29;
  const __CFString *v30;
  const char *v31;
  CFErrorRef v32;
  CFErrorRef CFErrorWithDomain;
  const char *CStringPtr;
  const char *v36;
  const __CFString *v37;
  const __CFString *v38;
  int CString;
  const char *v40;
  CFTypeRef cf;

  cf = 0;
  v6 = CFCopyDescription(a1);
  if (v6)
  {
    v7 = v6;
    Length = CFStringGetLength(v6);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    v10 = (char *)malloc(MaximumSizeForEncoding + 1);
    v11 = CFStringGetCString(v7, v10, MaximumSizeForEncoding, 0x8000100u) ? v10 : "No C string description available.";
    SavageRestoreInfoLog("%s [input]: Input Options - %s \n", "CreateFileData", v11);
    CFRelease(v7);
    if (v10)
      free(v10);
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("BundleDataDict"));
  if (Value)
  {
    v13 = Value;
    SavageRestoreInfoLog("%s: Device side restoreInfo path \n", "CreateFileData");
    v14 = CFDictionaryGetValue(v13, a2);
    cf = SavageSafeRetain(v14);
    if (cf)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v29 = CFCopyDescription(cf);
      if (!v29)
      {
        SavageRestoreInfoLog("%s [output]: %s \n", "CreateFileData", "No C string description available.");
        goto LABEL_23;
      }
      v30 = v29;
      if (CFStringGetCString(v29, logString, 4096, 0))
        v31 = logString;
      else
        v31 = "No C string description available.";
      SavageRestoreInfoLog("%s [output]: %s \n", "CreateFileData", v31);
      v32 = (CFErrorRef)v30;
      goto LABEL_22;
    }
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: bundleDataDict missing expected tag", 0x13u, (uint64_t)a1, CFSTR("SavageErrorDomain"));
    v15 = 0;
    goto LABEL_36;
  }
  SavageRestoreInfoLog("%s: Host side restoreInfo path \n", "CreateFileData");
  v20 = CFDictionaryGetValue(a1, CFSTR("BuildIdentity"));
  v21 = (const __CFDictionary *)SavageSafeRetain(v20);
  v15 = v21;
  if (!v21)
  {
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageOptionBuildIdentity", 0xAu, (uint64_t)a1, CFSTR("SavageErrorDomain"));
LABEL_36:
    v16 = 0;
    v17 = 0;
LABEL_39:
    v18 = 0;
    v19 = 0;
    goto LABEL_43;
  }
  v22 = CFDictionaryGetValue(v21, a2);
  v23 = (const __CFDictionary *)SavageSafeRetain(v22);
  v17 = v23;
  if (!v23)
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)CStringPtr, 0xAu, (uint64_t)a1, CFSTR("SavageErrorDomain"));
    v16 = 0;
    goto LABEL_39;
  }
  v24 = CFDictionaryGetValue(v23, CFSTR("Info"));
  v25 = (const __CFDictionary *)SavageSafeRetain(v24);
  v16 = v25;
  if (!v25)
  {
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageBuildIdentityInfoKey", 0xCu, (uint64_t)a1, CFSTR("SavageErrorDomain"));
    goto LABEL_39;
  }
  v26 = CFDictionaryGetValue(v25, CFSTR("Path"));
  v19 = SavageSafeRetain(v26);
  if (v19)
  {
    v27 = CFDictionaryGetValue(a1, CFSTR("BundlePath"));
    v18 = SavageSafeRetain(v27);
    if (v18)
    {
      v28 = AMSupportPlatformCopyURLWithAppendedComponent();
      v36 = "CreateFileData: Fail to run AMSupportPlatformCopyURLWithAppendedComponent with srcBundleURL";
    }
    else
    {
      v36 = "CreateFileData: Missing kSavageOptionSourceBundlePath";
      v28 = 10;
    }
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v36, v28, (uint64_t)a1, CFSTR("SavageErrorDomain"));
  }
  else
  {
    CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageBuildIdentityPathKey", 0xCu, (uint64_t)a1, CFSTR("SavageErrorDomain"));
    v18 = 0;
  }
LABEL_43:
  if (a3 && CFErrorWithDomain)
  {
    *a3 = SavageSafeRetain(CFErrorWithDomain);
    v37 = CFErrorCopyDescription(CFErrorWithDomain);
    if (v37)
    {
      v38 = v37;
      CString = CFStringGetCString(v37, logString, 4096, 0);
      v40 = logString;
      if (!CString)
        v40 = "No C string description available.";
      SavageRestoreInfoLog("%s [error]: %s \n", "CreateFileData", v40);
      CFRelease(v38);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "CreateFileData", "No C string description available.");
    }
    goto LABEL_52;
  }
  if (CFErrorWithDomain)
  {
LABEL_52:
    v32 = CFErrorWithDomain;
LABEL_22:
    CFRelease(v32);
  }
LABEL_23:
  if (v18)
    CFRelease(v18);
  if (v19)
    CFRelease(v19);
  if (v16)
    CFRelease(v16);
  if (v17)
    CFRelease(v17);
  if (v15)
    CFRelease(v15);
  return cf;
}

uint64_t CreateMeasurementDict(const __CFData *a1, CFTypeRef *a2)
{
  const __CFAllocator *v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  UInt8 *v9;
  BOOL v10;
  uint64_t v11;
  CC_LONG v12;
  CFDataRef v13;
  CFDataRef v14;
  UInt8 buffer[8];
  uint64_t v17;
  CC_SHA256_CTX c;
  unsigned __int8 md[16];
  __int128 v20;
  uint64_t v21;
  CFRange v22;
  CFRange v23;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)buffer = 0;
  v17 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_OWORD *)md = 0u;
  v20 = 0u;
  v8 = CFDictionaryCreateMutable(0, 0, v5, v6);
  v9 = 0;
  if (v8)
    v10 = Mutable == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = 2;
    if (a1 && a2)
    {
      v22.location = 0;
      v22.length = 16;
      CFDataGetBytes(a1, v22, buffer);
      if (*(_DWORD *)&buffer[4])
      {
        v9 = (UInt8 *)calloc(*(unsigned int *)&buffer[4], 1uLL);
        if (v9)
        {
          v23.length = *(unsigned int *)&buffer[4];
          v23.location = 16;
          CFDataGetBytes(a1, v23, v9);
          v12 = *(_DWORD *)&buffer[4];
          if (!(*(_DWORD *)&buffer[4] >> 20))
          {
            CC_SHA256_Init(&c);
            CC_SHA256_Update(&c, v9, v12);
            CC_SHA256_Final(md, &c);
          }
          v13 = CFDataCreate(v4, md, 32);
          if (v13)
          {
            v14 = v13;
            CFDictionarySetValue(Mutable, CFSTR("Digest"), v13);
            CFDictionarySetValue(v8, CFSTR("MeasurementDictPatch"), Mutable);
            *a2 = SavageSafeRetain(v8);
            CFRelease(v14);
            v11 = 0;
          }
          else
          {
            v11 = 8;
          }
        }
        else
        {
          v11 = 3;
        }
      }
      else
      {
        v9 = 0;
        v11 = 4;
      }
    }
    goto LABEL_13;
  }
  v11 = 3;
  if (Mutable)
LABEL_13:
    CFRelease(Mutable);
  if (v8)
    CFRelease(v8);
  if (v9)
    free(v9);
  return v11;
}

CFTypeRef SavageSafeRetain(CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  return cf;
}

void SavageCFDictionarySetInteger32(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  if (!v5)
    SavageCFDictionarySetInteger32_cold_1();
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void SavageCFDictionarySetBoolean(__CFDictionary *a1, const void *a2, int a3)
{
  const void **v3;

  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(a1, a2, *v3);
}

void SavageCFDictionarySetData(__CFDictionary *a1, const void *a2, UInt8 *bytes, CFIndex length)
{
  CFDataRef v6;
  CFDataRef v7;

  v6 = CFDataCreate(0, bytes, length);
  if (!v6)
    SavageCFDictionarySetData_cold_1();
  v7 = v6;
  CFDictionarySetValue(a1, a2, v6);
  CFRelease(v7);
}

uint64_t SavageCFStringToUInt32(const __CFString *a1, _DWORD *a2, int a3)
{
  uint64_t result;
  char buffer[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if ((_DWORD)result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, a3);
    return *__error() == 0;
  }
  return result;
}

CFErrorRef createCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  const __CFAllocator *v7;
  CFStringRef v8;
  const void *v9;
  CFStringRef v10;
  CFStringRef v11;
  __CFDictionary *Mutable;
  CFErrorRef v13;

  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@: %s"), a4, a1);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = CFStringCreateWithFormat(v7, 0, CFSTR("%@: Input Options: %@"), v8, a3);
  if (!v10)
  {
    v13 = 0;
    goto LABEL_4;
  }
  v11 = v10;
  Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBD3A0], v9);
  v13 = CFErrorCreate(v7, a4, a2, Mutable);
  CFRelease(v11);
  CFRelease(v9);
  v9 = Mutable;
  if (Mutable)
LABEL_4:
    CFRelease(v9);
  return v13;
}

uint64_t GetRelevantMeasurementTags(CFDictionaryRef theDict, __CFString **a2, __CFString **a3)
{
  uint64_t result;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  int v10;
  const __CFData *v11;
  const __CFData *v12;
  CFTypeID v13;
  const UInt8 *BytePtr;
  unsigned int v15;
  int v16;
  __CFString **v17;
  __CFString **v18;
  __CFString **v19;
  __CFString **v20;
  __CFString **v21;
  BOOL v22;
  __CFString **v23;
  __CFString **v24;
  __CFString *v25;

  result = 2;
  if (theDict && a2 && a3)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Savage,ProductionMode"));
    if (!Value)
      return 17;
    v8 = Value;
    v9 = CFGetTypeID(Value);
    if (v9 != CFBooleanGetTypeID())
      return 17;
    v10 = CFBooleanGetValue(v8);
    v11 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("Savage,Revision"));
    if (!v11)
      return 17;
    v12 = v11;
    v13 = CFGetTypeID(v11);
    if (v13 != CFDataGetTypeID())
      return 17;
    BytePtr = CFDataGetBytePtr(v12);
    if (BytePtr)
    {
      v15 = *BytePtr;
      v16 = ((v15 & 0xF0) + 96) >> 4;
      if ((v16 - 8) < 2)
      {
        v19 = &kSavageTagMeasurementB2ProdPatch;
        v20 = &kSavageTagMeasurementB2DevPatch;
LABEL_23:
        v22 = v10 == 0;
        if (!v10)
          v19 = v20;
        *a2 = *v19;
        v23 = &kSavageTagMeasurementBFProdPatch;
        v24 = &kSavageTagMeasurementBFDevPatch;
LABEL_26:
        if (v22)
          v23 = v24;
        v25 = *v23;
        goto LABEL_29;
      }
      if (!(((v15 & 0xF0) + 96) >> 4))
      {
        v21 = &kSavageTagMeasurementBAProdPatch;
        v22 = v10 == 0;
        if (!v10)
          v21 = &kSavageTagMeasurementBADevPatch;
        *a2 = *v21;
        v23 = &kSavageTagMeasurementBEProdPatch;
        v24 = &kSavageTagMeasurementBEDevPatch;
        goto LABEL_26;
      }
      if (v16 == 4)
      {
        v17 = &kSavageTagMeasurementBEProdPatch;
        v18 = &kSavageTagMeasurementBEDevPatch;
LABEL_19:
        if (!v10)
          v17 = v18;
        v25 = *v17;
        *a2 = v25;
LABEL_29:
        result = 0;
        *a3 = v25;
        return result;
      }
      if (v15 >= 0xF0)
      {
        v17 = &kSavageTagMeasurementBFProdPatch;
        v18 = &kSavageTagMeasurementBFDevPatch;
        goto LABEL_19;
      }
    }
    v19 = &kSavageTagMeasurementB0ProdPatch;
    v20 = &kSavageTagMeasurementB0DevPatch;
    goto LABEL_23;
  }
  return result;
}

uint64_t GetYonkersMeasurementTags(CFDictionaryRef theDict, CFTypeRef *a2, CFTypeRef *a3)
{
  uint64_t result;
  const __CFBoolean *Value;
  const __CFBoolean *v8;
  CFTypeID v9;
  _BOOL4 v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  int valuePtr;

  valuePtr = 0;
  result = 2;
  if (theDict && a2)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Yonkers,ProductionMode"));
    if (Value
      && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID())
      && (v10 = CFBooleanGetValue(v8) != 0,
          (v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Yonkers,FabRevision"))) != 0)
      && (v12 = v11, v13 = CFGetTypeID(v11), v13 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      return GetYonkersFabRevisionTags(valuePtr, v10, a2, a3);
    }
    else
    {
      return 17;
    }
  }
  return result;
}

uint64_t GetYonkersFabRevisionTags(int a1, int a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v8;
  uint64_t v9;
  CFStringRef v10;
  CFStringRef v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  const __CFAllocator *v15;
  uint64_t v16;
  int *v17;
  int v18;
  _BOOL8 v19;
  int v20;
  uint64_t v21;
  const __CFAllocator *v22;

  v8 = 0;
  v9 = 0;
  while (dword_215D0BEF8[v9] != a1)
  {
    ++v9;
    v8 -= 2;
    if (v9 == 6)
    {
      v10 = 0;
      v11 = 0;
      v12 = 2;
      goto LABEL_6;
    }
  }
  v13 = a2 != 0;
  v14 = v13 | (8 * (v9 < 4));
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Yonkers,SysTopPatch%X"), (v13 - v8));
  v11 = CFStringCreateWithFormat(v15, 0, CFSTR("Yonkers,SysTopPatch%X"), v14);
  v12 = 0;
LABEL_6:
  v16 = 0;
  v17 = &dword_215D0BF10;
  while (1)
  {
    v18 = *v17++;
    if (v18 == a1)
      break;
    v16 -= 2;
    if (v16 == -16)
    {
      if (!a3)
        goto LABEL_17;
      goto LABEL_15;
    }
  }
  v19 = a2 != 0;
  if ((v19 - v16) < 8)
    v20 = 8;
  else
    v20 = -8;
  v21 = (v20 | v19) - v16;
  v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("Yonkers,SysTopPatch%X"), v19 - v16);
  v11 = CFStringCreateWithFormat(v22, 0, CFSTR("Yonkers,SysTopPatch%X"), v21);
  v12 = 0;
  if (!a3)
    goto LABEL_17;
LABEL_15:
  if (v10)
    *a3 = CFRetain(v10);
LABEL_17:
  if (a4 && v11)
    *a4 = CFRetain(v11);
  if (v10)
    CFRelease(v10);
  if (v11)
    CFRelease(v11);
  return v12;
}

uint64_t _hexStringToBytes(_BYTE *a1, uint64_t *a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  char v13;
  char v14;
  char v15;
  unsigned int v16;
  unsigned int v17;
  char v18;
  char v19;

  v4 = 2;
  if ((a4 & 1) == 0 && *a2 >= a4 >> 1 && a1 && a3)
  {
    v5 = 0;
    *a2 = 0;
    if (a4 < 2)
    {
LABEL_27:
      v4 = 0;
      *a2 = v5;
      a1[v5] = 0;
    }
    else
    {
      if (a4 >> 1 <= 1)
        v5 = 1;
      else
        v5 = a4 >> 1;
      v6 = MEMORY[0x24BDAC740];
      v7 = a1;
      v8 = v5;
      while (1)
      {
        v9 = *a3;
        if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x10000) == 0)
          return 2;
        v10 = a3[1];
        if ((*(_DWORD *)(v6 + 4 * v10 + 60) & 0x10000) == 0)
          return 2;
        v11 = v9 - 48;
        v12 = v9 - 97;
        if ((v9 - 65) >= 6)
          v13 = -1;
        else
          v13 = v9 - 55;
        v14 = v9 - 87;
        if (v12 > 5)
          v14 = v13;
        if (v11 < 0xA)
          v14 = v11;
        v15 = 16 * v14;
        v16 = v10 - 48;
        v17 = v10 - 97;
        if ((v10 - 65) >= 6)
          v18 = -1;
        else
          v18 = v10 - 55;
        v19 = v10 - 87;
        if (v17 > 5)
          v19 = v18;
        if (v16 < 0xA)
          v19 = v16;
        *v7++ = v19 | v15;
        a3 += 2;
        if (!--v8)
          goto LABEL_27;
      }
    }
  }
  return v4;
}

void SavageCFDictionarySetInteger32_cold_1()
{
  __assert_rtn("SavageCFDictionarySetInteger32", "SavagePrivateHelper.cpp", 35, "num != NULL");
}

void SavageCFDictionarySetData_cold_1()
{
  __assert_rtn("SavageCFDictionarySetData", "SavagePrivateHelper.cpp", 48, "tmpData");
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x24BED9FA8]();
}

uint64_t AMSupportMakeDirectory()
{
  return MEMORY[0x24BEDA070]();
}

uint64_t AMSupportPlatformCopyURLWithAppendedComponent()
{
  return MEMORY[0x24BEDA078]();
}

uint64_t AMSupportPlatformFileURLExists()
{
  return MEMORY[0x24BEDA080]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x24BEDA0F0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x24BDBBD18](theData, range.location, range.length, newBytes, newLength);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
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

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x24BDAD340]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x24BDAD588]();
}

uint64_t ccec_der_import_priv()
{
  return MEMORY[0x24BDAD5A8]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x24BDAD5E0]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x24BDAE4E0](__stream, a2, *(_QWORD *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x24BDAE538](__stream);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

