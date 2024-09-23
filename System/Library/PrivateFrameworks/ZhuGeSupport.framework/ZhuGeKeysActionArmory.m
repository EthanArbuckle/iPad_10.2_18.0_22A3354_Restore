@implementation ZhuGeKeysActionArmory

+ (void)setKey:(id)a3
{
  objc_storeStrong((id *)&_key, a3);
}

+ (NSString)key
{
  return (NSString *)(id)_key;
}

+ (id)getReportFDRDiagnosticFromOption:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*ReportSymbolLoc)(void *, void **, void **);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v32;
  void *v33;
  void *v34;

  v5 = a3;
  v9 = v5;
  v33 = 0;
  v34 = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 159, CFSTR("error p-pointer is nil!"), v6, v7, v8, v32);
    v27 = 0;
    v26 = 0;
    goto LABEL_18;
  }
  *a4 = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReportFDRDiagnostic_Options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = isObjectNilOrZhuGeNull(v10);

  v12 = 0;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ReportFDRDiagnostic_Options"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ReportFDRDiagnostic_Options"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    if ((isKindOfClass & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 167, CFSTR("FDR options is not a dictionary \"%@\"!"), v16, v17, v18, (uint64_t)v15);

      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = 9;
      goto LABEL_16;
    }

  }
  if (!libFDRLibraryCore_0()
    || !libFDRLibraryCore_0()
    || !getAMFDRDiagnosticGenerateReportSymbolLoc()
    || !libFDRLibraryCore_0()
    || !getAMFDRLogSetHandlerSymbolLoc())
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 178, CFSTR("Failed to load libFDR.dylib!"), v19, v20, v21, v32);
    v28 = (void *)MEMORY[0x24BDD1540];
    v29 = 13;
LABEL_16:
    objc_msgSend(v28, "errorWithZhuGeErrorCode:underlyingError:", v29, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v26 = 0;
LABEL_17:
    *a4 = v30;
    goto LABEL_18;
  }
  pAMFDRLogSetHandler((uint64_t)fdrDiagnosticLogCallback);
  ReportSymbolLoc = (uint64_t (*)(void *, void **, void **))getAMFDRDiagnosticGenerateReportSymbolLoc();
  if (!ReportSymbolLoc)
    getFDRDataByFDRClassWithError_cold_1();
  if ((ReportSymbolLoc(v12, &v34, &v33) & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory getReportFDRDiagnosticFromOption:withError:]", 186, CFSTR("AMFDRDiagnosticGenerateReport failed!"), v23, v24, v25, v32);
    v26 = v33;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 15, v33);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    goto LABEL_17;
  }
  v26 = 0;
  v27 = v34;
LABEL_18:

  return v27;
}

+ (id)queryFDRSealingStatusWithManifestOverride:(id)a3 WithError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFDictionary *Mutable;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFDictionary *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*AMFDRCreateWithOptionsSymbolLoc)(uint64_t, __CFDictionary *);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t (*AMFDRSealingMapVerifySealingSymbolLoc)(const void *, void **);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;

  v5 = a3;
  v9 = v5;
  v41 = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 212, CFSTR("error p-pointer is nil!"), v6, v7, v8, v39);
    v34 = 0;
    goto LABEL_20;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 218, CFSTR("needOverride pointer is nil!"), v6, v7, v8, v39);
    v35 = (void *)MEMORY[0x24BDD1540];
    v36 = 45;
    goto LABEL_19;
  }
  if (!libFDRLibraryCore_0()
    || !libFDRLibraryCore_0()
    || !getAMFDRCreateWithOptionsSymbolLoc()
    || !libFDRLibraryCore_0()
    || !getAMFDRSealingMapVerifySealingSymbolLoc())
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 226, CFSTR("Failed to load libFDR.dylib!"), v10, v11, v12, v39);
    v35 = (void *)MEMORY[0x24BDD1540];
    v36 = 13;
LABEL_19:
    objc_msgSend(v35, "errorWithZhuGeErrorCode:underlyingError:", v36, 0);
    v34 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v13 = *MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 236, CFSTR("CFDictionaryCreateMutable failed!"), v15, v16, v17, v39);
    v35 = (void *)MEMORY[0x24BDD1540];
    v36 = 32;
    goto LABEL_19;
  }
  v18 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("DataStore"), CFSTR("Local"));
  objc_msgSend(v9, "lowercaseString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("yes"));

  if (v20)
    CFDictionarySetValue(v18, CFSTR("SealingManifestOverride"), (const void *)*MEMORY[0x24BDBD270]);
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 245, CFSTR("FDR options is %@"), v21, v22, v23, (uint64_t)v18);
  AMFDRCreateWithOptionsSymbolLoc = (uint64_t (*)(uint64_t, __CFDictionary *))getAMFDRCreateWithOptionsSymbolLoc();
  if (!AMFDRCreateWithOptionsSymbolLoc)
    getFDRDataByFDRClassWithError_cold_1();
  v25 = AMFDRCreateWithOptionsSymbolLoc(v13, v18);
  if (v25)
  {
    v29 = (const void *)v25;
    AMFDRSealingMapVerifySealingSymbolLoc = (uint64_t (*)(const void *, void **))getAMFDRSealingMapVerifySealingSymbolLoc();
    if (!AMFDRSealingMapVerifySealingSymbolLoc)
      getFDRDataByFDRClassWithError_cold_1();
    if ((AMFDRSealingMapVerifySealingSymbolLoc(v29, &v41) & 1) != 0)
    {
      v34 = (void *)MEMORY[0x24BDBD1C8];
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 257, CFSTR("Didn't successfully verify fdr data sealing status, error %@!"), v31, v32, v33, (uint64_t)v41);
      v38 = v41;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 15, v41);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v34 = 0;
    }
    CFRelease(v29);
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRSealingStatusWithManifestOverride:WithError:]", 249, CFSTR("AMFDRCreateWithOptions failed!"), v26, v27, v28, v40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 15, 0);
    v34 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(v18);
LABEL_20:

  return v34;
}

+ (id)queryFDRDeviceAsidMetadataIsVerified:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc)(void *, void **);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  uint64_t v29;
  void *v30;

  v5 = a3;
  v9 = v5;
  v30 = 0;
  if (a4)
  {
    *a4 = 0;
    if (isObjectNilOrZhuGeNull(v5))
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 286, CFSTR("option is nil"), v10, v11, v12, v29);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = 45;
LABEL_17:
      objc_msgSend(v13, "errorWithZhuGeErrorCode:underlyingError:", v14, 0);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 291, CFSTR("option is not a dictionary"), v16, v17, v18, v29);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = 9;
      goto LABEL_17;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FDRDeviceAsidMetadataIsVerified_Options"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!libFDRLibraryCore_0()
      || !libFDRLibraryCore_0()
      || !getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc()
      || !libFDRLibraryCore_0()
      || !getAMFDRLogSetHandlerSymbolLoc())
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 301, CFSTR("Failed to load libFDR.dylib!"), v20, v21, v22, v29);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = 13;
      goto LABEL_17;
    }
    pAMFDRLogSetHandler((uint64_t)fdrLogCallback);
    AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc = (uint64_t (*)(void *, void **))getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc();
    if (!AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc)
      getFDRDataByFDRClassWithError_cold_1();
    if ((AMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc(v19, &v30) & 1) != 0)
    {
      v15 = (void *)MEMORY[0x24BDBD1C8];
      goto LABEL_18;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 309, CFSTR("AMFDRSealingMapVerifyAsidMetadataForDevice failed!"), v24, v25, v26, v29);
    v28 = v30;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 15, v30);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFDRDeviceAsidMetadataIsVerified:withError:]", 280, CFSTR("error p-pointer is nil!"), v6, v7, v8, v29);
  }
  v15 = 0;
LABEL_18:

  return v15;
}

+ (id)queryIOPropertyFromPath:(id)a3 andCriteria:(id)a4 withError:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  mach_port_t v45;
  id v46;
  io_registry_entry_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  io_object_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v58;
  const __CFDictionary *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  mach_port_t v63;
  mach_error_t MatchingServices;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CFMutableDictionaryRef v68;
  __CFString *v69;
  __CFString *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  const __CFDictionary *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  mach_error_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  kern_return_t v85;
  mach_error_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CFMutableDictionaryRef v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  void *v98;
  __CFString *v99;
  __CFDictionary *v100;
  __CFString *v101;
  void *v102;
  char v103;
  void *v104;
  int v105;
  __CFString *v106;
  uint64_t v107;
  int v108;
  __CFString *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id *v137;
  void *v138;
  void *v139;
  id v140;
  id v141;
  void *v142;
  uint64_t v143;
  const __CFAllocator *allocator;
  id v145;
  id v146;
  const __CFString *key;
  void *v148;
  int v149;
  id v150;
  id CFProperty;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  CFMutableDictionaryRef properties;
  id v157;
  io_object_t object;
  _BYTE v159[128];
  uint64_t v160;

  v160 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v11 = a4;
  object = 0;
  if (!a5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 343, CFSTR("error p-pointer is nil!"), v8, v9, v10, v136);
    v12 = 0;
    v21 = 0;
    v24 = 0;
    v27 = 0;
    v34 = 0;
    v55 = 0;
    v16 = 0;
    CFProperty = 0;
    goto LABEL_19;
  }
  *a5 = 0;
  if (!v7)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 350, CFSTR("path pointer is nil!"), v8, v9, v10, v136);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v21 = 0;
    v24 = 0;
    v27 = 0;
    v34 = 0;
    v55 = 0;
    v16 = 0;
LABEL_18:
    CFProperty = 0;
    *a5 = v56;
    goto LABEL_19;
  }
  v157 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(IO[a-z]+)://(.+)/(.+)"), 1, &v157);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v157;
  if (!v12)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 358, CFSTR("Creating regEx failed for IO query!"), v13, v14, v15, v136);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, v16);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
LABEL_16:
    v24 = 0;
    v27 = 0;
    v34 = 0;
LABEL_17:
    v55 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v12, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v17;
  if (!v17)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 364, CFSTR("Matching regEx failed for IO path \"%@\"!"), v18, v19, v20, (uint64_t)v7);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 47, 0);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v22 = objc_msgSend(v17, "rangeAtIndex:", 1);
  objc_msgSend(v7, "substringWithRange:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "rangeAtIndex:", 2);
  objc_msgSend(v7, "substringWithRange:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v21, "rangeAtIndex:", 3);
  objc_msgSend(v7, "substringWithRange:", v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v30;
  if (!v11)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 374, CFSTR("criteria pointer is nil!"), v31, v32, v33, v136);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  key = (const __CFString *)v30;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fullPath"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 379, CFSTR("Lacking of criteria \"fullPath\" service or not!"), v36, v37, v38, v136);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
    v55 = 0;
    CFProperty = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_91:
    v34 = (void *)key;
    goto LABEL_19;
  }
  v145 = v27;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fullPath"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "lowercaseString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("yes"));

  if ((v40 & 1) == 0)
  {
    properties = 0;
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 395, CFSTR("Searching from non-fullPath services."), v41, v42, v43, v136);
    v58 = objc_retainAutorelease(v145);
    v59 = IOServiceMatching((const char *)objc_msgSend(v58, "UTF8String"));
    v142 = v12;
    v143 = (uint64_t)v7;
    if (v59)
    {
      v146 = v58;
      v137 = a5;
      v63 = *MEMORY[0x24BDD8B18];
      MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], v59, &object);
      if (!MatchingServices && object)
      {
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 408, CFSTR("Find service class: \"%@\"), v65, v66, v67, (uint64_t)v58);
LABEL_35:
        CFProperty = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        MEMORY[0x24BD1D4FC](object);
        v83 = IOIteratorNext(object);
        v55 = v148;
        if ((_DWORD)v83)
        {
          v84 = v83;
          v70 = 0;
          v69 = 0;
          v68 = 0;
          allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v140 = v16;
          v141 = v11;
          v138 = v24;
          v139 = v21;
          while (1)
          {
            if (!IORegistryEntryInPlane(v84, (const char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String")))
              goto LABEL_77;
            v149 = v84;
            v85 = IORegistryEntryCreateCFProperties(v84, &properties, allocator, 0);
            if (!v85)
              break;
            v86 = v85;
            if (v85 != 53)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v84);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              mach_error_string(v86);
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 453, CFSTR("Failed to get IO properties from service entry %@! %s!"), v111, v112, v113, (uint64_t)v110);

              goto LABEL_68;
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v84);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            mach_error_string(53);
            ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 449, CFSTR("Failed to get IO properties from service entry %@! %s, a potential issue!"), v88, v89, v90, (uint64_t)v87);

LABEL_77:
            IOObjectRelease(v84);
            v84 = IOIteratorNext(object);
            if (!(_DWORD)v84)
              goto LABEL_81;
          }
          v91 = properties;

          v154 = 0u;
          v155 = 0u;
          v152 = 0u;
          v153 = 0u;
          v92 = v11;
          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v152, v159, 16);
          if (!v93)
          {
            v96 = 1;
            goto LABEL_72;
          }
          v94 = v93;
          v95 = *(_QWORD *)v153;
          v96 = 1;
          v150 = v92;
LABEL_43:
          v97 = 0;
          while (1)
          {
            if (*(_QWORD *)v153 != v95)
              objc_enumerationMutation(v92);
            v98 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * v97);
            if ((objc_msgSend(v98, "isEqualToString:", CFSTR("fullPath")) & 1) == 0)
              break;
LABEL_64:
            if (v94 == ++v97)
            {
              v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v152, v159, 16);
              if (v94)
                goto LABEL_43;
LABEL_72:

              v11 = v141;
              if (objc_msgSend(v92, "count") == v96)
              {
                -[__CFDictionary objectForKeyedSubscript:](v91, "objectForKeyedSubscript:", key);
                v118 = (void *)objc_claimAutoreleasedReturnValue();

                v68 = v91;
                v21 = v139;
                v16 = v140;
                v24 = v138;
                if (v118)
                {
                  -[__CFDictionary objectForKeyedSubscript:](v68, "objectForKeyedSubscript:", key);
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(CFProperty, "addObject:", v122);

                  goto LABEL_76;
                }
                LODWORD(v84) = v149;
                ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 499, CFSTR("No property \"%@\" in entry \"%u\"), v119, v120, v121, (uint64_t)key);
LABEL_68:
                v55 = v148;
              }
              else
              {
                v68 = v91;
                v21 = v139;
                v16 = v140;
                v24 = v138;
LABEL_76:
                v55 = v148;
                LODWORD(v84) = v149;
              }
              goto LABEL_77;
            }
          }
          objc_msgSend(v92, "objectForKeyedSubscript:", v98);
          v99 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v100 = v91;
          -[__CFDictionary objectForKeyedSubscript:](v91, "objectForKeyedSubscript:", v98);
          v101 = (__CFString *)objc_claimAutoreleasedReturnValue();

          -[__CFString lowercaseString](v99, "lowercaseString");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("yes"));

          v69 = CFSTR("Yes");
          if ((v103 & 1) != 0
            || (-[__CFString lowercaseString](v99, "lowercaseString"),
                v104 = (void *)objc_claimAutoreleasedReturnValue(),
                v105 = objc_msgSend(v104, "isEqualToString:", CFSTR("no")),
                v104,
                v69 = CFSTR("No"),
                v105))
          {

          }
          else
          {
            v69 = v99;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringFromData:", v101);
            v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v114 = objc_opt_class();
                ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 485, CFSTR("Unsupported type \"%@\" for criterion \"%@\"), v115, v116, v117, v114);
                v70 = v101;
                v91 = v100;
LABEL_71:
                v92 = v150;
                goto LABEL_72;
              }
              v70 = v101;
              goto LABEL_62;
            }
            v107 = objc_opt_class();
            if (v107 == objc_opt_class())
            {
              v108 = -[__CFString BOOLValue](v101, "BOOLValue");
              v109 = CFSTR("Yes");
              if (!v108)
                v109 = CFSTR("No");
              v106 = v109;
            }
            else
            {
              -[__CFString stringValue](v101, "stringValue");
              v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          v70 = v106;

LABEL_62:
          v91 = v100;
          if (!-[__CFString isEqualToString:](v70, "isEqualToString:", v69))
            goto LABEL_71;
          ++v96;
          v92 = v150;
          goto LABEL_64;
        }
        v68 = 0;
        v69 = 0;
        v70 = 0;
LABEL_81:
        v123 = objc_msgSend(CFProperty, "count");
        if (v123 == 1)
        {
          objc_msgSend(CFProperty, "objectAtIndexedSubscript:", 0);
          v127 = objc_claimAutoreleasedReturnValue();

          CFProperty = (id)v127;
        }
        else if (!v123)
        {

          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 509, CFSTR("Failed to find a non-fullPath service for path \"%@\"), v124, v125, v126, v143);
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 21, 0);
          CFProperty = 0;
          *v137 = (id)objc_claimAutoreleasedReturnValue();
        }
        v27 = v146;
        goto LABEL_90;
      }
      mach_error_string(MatchingServices);
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 411, CFSTR("Cannot find service class: \"%@\", %s"), v71, v72, v73, (uint64_t)v58);
      v74 = objc_retainAutorelease(v58);
      v75 = IOServiceNameMatching((const char *)objc_msgSend(v74, "UTF8String"));
      if (v75)
      {
        v79 = IOServiceGetMatchingServices(v63, v75, &object);
        if (!v79 && object)
        {
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 422, CFSTR("Find service name: \"%@\"), v80, v81, v82, (uint64_t)v74);
          goto LABEL_35;
        }
        mach_error_string(v79);
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 425, CFSTR("Cannot find service name: \"%@\", %s"), v130, v131, v132, (uint64_t)v74);
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 428, CFSTR("Failed to find IO entry for \"%@\"!"), v133, v134, v135, (uint64_t)v74);
        v128 = (void *)MEMORY[0x24BDD1540];
        v129 = 20;
      }
      else
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 416, CFSTR("Failed to match the service name \"%@\"!"), v76, v77, v78, (uint64_t)v74);
        v128 = (void *)MEMORY[0x24BDD1540];
        v129 = 24;
      }
      objc_msgSend(v128, "errorWithZhuGeErrorCode:underlyingError:", v129, 0);
      CFProperty = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      *v137 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v146;
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 402, CFSTR("Failed to match the service class \"%@\"!"), v60, v61, v62, (uint64_t)v58);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 24, 0);
      CFProperty = 0;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v58;
    }
    v55 = v148;
LABEL_90:

    v12 = v142;
    v7 = (id)v143;
    goto LABEL_91;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 524, CFSTR("Searching from fullPath service."), v41, v42, v43, v136);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:/%@"), v24, v145);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x24BDD8B18];
  v46 = objc_retainAutorelease(v44);
  v47 = IORegistryEntryFromPath(v45, (const char *)objc_msgSend(v46, "UTF8String"));
  if (v47)
  {
    v51 = v47;
    v34 = (void *)key;
    CFProperty = (id)IORegistryEntryCreateCFProperty(v47, key, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!CFProperty)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 537, CFSTR("Cannot create CF property for property \"%@\"!"), v52, v53, v54, (uint64_t)key);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 21, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    IOObjectRelease(v51);
    v27 = v145;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOPropertyFromPath:andCriteria:withError:]", 530, CFSTR("Cannot find IO entry from path \"%@\"!"), v48, v49, v50, (uint64_t)v46);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 20, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    CFProperty = 0;
    v27 = v145;
    v34 = (void *)key;
  }
  v55 = v148;
LABEL_19:
  if (object)
  {
    IOObjectRelease(object);
    object = 0;
  }

  return CFProperty;
}

+ (id)queryIOProperty:(id)a3 fromCriteria:(id)a4 withError:(id *)a5
{
  __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  __CFDictionary *v63;
  void *v64;
  const __CFDictionary *Copy;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFMutableDictionaryRef v69;
  __CFString *v70;
  void *v71;
  mach_port_t v72;
  id v73;
  io_registry_entry_t v74;
  io_registry_entry_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  mach_error_t v100;
  mach_error_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  mach_error_t MatchingServices;
  mach_port_t v109;
  id v110;
  uint64_t v111;
  mach_error_t v112;
  mach_error_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  __CFString *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  kern_return_t CFProperties;
  mach_error_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  int v162;
  uint64_t v163;
  int v164;
  void *v165;
  void *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  char v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  char v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  char v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  int v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  char v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  void *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  int v280;
  int v281;
  int v282;
  const __CFAllocator *allocator;
  IOOptionBits options;
  IOOptionBits optionsa;
  void *v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  id v290;
  void *v291;
  id v292;
  id v293;
  id v294;
  void *v295;
  id v296;
  io_registry_entry_t entry;
  void *v298;
  void *v299;
  int v300;
  void *v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  io_registry_entry_t parent;
  io_object_t object;
  char v308[128];
  io_name_t name;
  io_name_t className;
  uint64_t v311;

  v311 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = a4;
  v13 = v9;
  object = 0;
  if (!a5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 573, CFSTR("error p-pointer is nil!"), v10, v11, v12, v266);
    v15 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_17;
  }
  *a5 = 0;
  if (!v8)
  {
    v24 = CFSTR("property pointer is nil!");
    v25 = 579;
LABEL_13:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", v25, v24, v10, v11, v12, v266);
    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = 45;
LABEL_14:
    objc_msgSend(v26, "errorWithZhuGeErrorCode:underlyingError:", v27, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
LABEL_15:
    v20 = 0;
LABEL_16:
    v21 = 0;
    v22 = 0;
    v23 = 0;
    *a5 = v28;
    goto LABEL_17;
  }
  if (!v9)
  {
    v24 = CFSTR("criteria pointer is nil!");
    v25 = 585;
    goto LABEL_13;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("basic"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(a1, "key");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 591, CFSTR("Missing basic criteria for key \"%@\"!"), v31, v32, v33, (uint64_t)v30);

    v26 = (void *)MEMORY[0x24BDD1540];
    v27 = 29;
    goto LABEL_14;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("basic"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(a1, "key");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 598, CFSTR("Invalid basic criteria type for key \"%@\"!"), v35, v36, v37, (uint64_t)v34);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 38, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("extra"));
  v301 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isObjectNilOrZhuGeNull(v301) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(a1, "key");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 605, CFSTR("Invalid extra criteria type for key \"%@\"!"), v41, v42, v43, (uint64_t)v40);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 38, 0);
      v21 = 0;
      v22 = 0;
      v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v301;
      goto LABEL_17;
    }
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("direction"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = isObjectNilOrZhuGeNull(v16);

  if ((v17 & 1) != 0)
  {
    v18 = 0;
    v19 = 1;
  }
  else
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("direction"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("child"));

    if ((v39 & 1) != 0)
    {
      v19 = 0;
      v18 = 1;
    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("direction"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("parent"));

      v19 = v45 ^ 1;
      if (v45)
        v18 = 2;
      else
        v18 = 0;
    }
  }
  objc_msgSend(a1, "key");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 620, CFSTR("Searching property \"%@\" for key \"%@\" with criteria %@"), v46, v47, v48, (uint64_t)v8);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("path"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("path"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "componentsSeparatedByString:", CFSTR(":"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v301;
    if ((unint64_t)objc_msgSend(v51, "count") > 1)
    {
      options = v18;
      v292 = a1;
      objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = *MEMORY[0x24BDD8B18];
      v73 = objc_retainAutorelease(v50);
      v74 = IORegistryEntryFromPath(v72, (const char *)objc_msgSend(v73, "UTF8String"));
      if (v74)
      {
        v75 = v74;
        v290 = objc_retainAutorelease(v71);
        v76 = (const char *)objc_msgSend(v290, "UTF8String");
        v23 = (id)IORegistryEntrySearchCFProperty(v75, v76, v8, (CFAllocatorRef)*MEMORY[0x24BDBD240], options);
        objc_msgSend(v292, "key");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 652, CFSTR("Found property \"%@\" for key \"%@\" with fullPath"), v77, v78, v79, (uint64_t)v8);

        }
        else
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 647, CFSTR("Failed to search property \"%@\" for key \"%@\"!"), v77, v78, v79, (uint64_t)v8);

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 21, 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        IOObjectRelease(v75);
        v22 = 0;
        goto LABEL_175;
      }
      v290 = v71;
      objc_msgSend(v292, "key");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 637, CFSTR("Cannot find IO service entry from path \"%@\" for key \"%@\"!"), v86, v87, v88, (uint64_t)v73);
      v56 = 20;
    }
    else
    {
      objc_msgSend(a1, "key");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 629, CFSTR("Invalid full path to search property \"%@\" for key \"%@\"!"), v53, v54, v55, (uint64_t)v8);
      v290 = 0;
      v56 = 41;
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", v56, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v22 = 0;
LABEL_46:
    v23 = 0;
    goto LABEL_175;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("servicePlane"));
  v57 = objc_claimAutoreleasedReturnValue();
  v20 = v301;
  if (!v57)
  {
    objc_msgSend(a1, "key");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 661, CFSTR("Failed to search property \"%@\" for key \"%@\" due to a nil service plane!"), v83, v84, v85, (uint64_t)v8);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 26, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v58 = (void *)v57;
  v282 = v19;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentPlane"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (!v22)
    v22 = v58;
  v290 = v58;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceClass"));
  v59 = objc_claimAutoreleasedReturnValue();
  v296 = v22;
  if (v59
    && (v60 = (void *)v59,
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceName")),
        v61 = (void *)objc_claimAutoreleasedReturnValue(),
        v61,
        v60,
        v61))
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceClass"));
    v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v63 = IOServiceMatching((const char *)objc_msgSend(v62, "UTF8String"));

    if (!v63)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceClass"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "key");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 676, CFSTR("Failed step1 of matching \"%@\" for key \"%@\"!"), v92, v93, v94, (uint64_t)v91);

      v95 = (void *)MEMORY[0x24BDD1540];
      v96 = 24;
      goto LABEL_171;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceName"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v63, CFSTR("IONameMatch"), v64);

    Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v63);
    CFRelease(v63);
    v69 = 0;
    v70 = CFSTR("service class and name");
  }
  else
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceClass"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (v81)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceClass"));
      v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      Copy = IOServiceMatching((const char *)objc_msgSend(v82, "UTF8String"));

      v69 = 0;
      v70 = CFSTR("service class");
    }
    else
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceName"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("serviceName"));
        v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v69 = IOServiceNameMatching((const char *)objc_msgSend(v90, "UTF8String"));

        Copy = 0;
        v70 = CFSTR("service name");
      }
      else
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("service"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        if (v97)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("service"));
          v98 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          Copy = IOServiceMatching((const char *)objc_msgSend(v98, "UTF8String"));

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("service"));
          v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v69 = IOServiceNameMatching((const char *)objc_msgSend(v99, "UTF8String"));

          v70 = CFSTR("service class or name");
        }
        else
        {
          v69 = 0;
          Copy = 0;
          v70 = CFSTR("service plane");
        }
      }
    }
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 710, CFSTR("Trying to get IO iterator with condition of \"%@\"), v66, v67, v68, (uint64_t)v70);
  if ((-[__CFString isEqualToString:](v70, "isEqualToString:", CFSTR("service plane")) & 1) != 0)
  {
    *(_DWORD *)className = *MEMORY[0x24BDD8B18];
    v100 = MEMORY[0x24BD1D508](*MEMORY[0x24BDAD2F0], className);
    if (v100)
    {
      v101 = v100;
      objc_msgSend(a1, "key");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 736, CFSTR("Failed to get bootstrap main port for key \"%@\"!"), v103, v104, v105, (uint64_t)v102);

      v106 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(v101));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "errorWithZhuGeErrorCode:underlyingError:", 19, v107);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_58:
      v22 = v296;
      goto LABEL_46;
    }
    v293 = a1;
    v109 = *(_DWORD *)className;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:/"), v290, v267, v13);
    v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v111 = IORegistryEntryFromPath(v109, (const char *)objc_msgSend(v110, "UTF8String"));

    if (!(_DWORD)v111)
    {
      objc_msgSend(v293, "key");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 744, CFSTR("Failed to get plane entry for key \"%@\"!"), v263, v264, v265, (uint64_t)v262);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 20, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v301;
      goto LABEL_58;
    }
    v112 = MEMORY[0x24BD1D544](v111, objc_msgSend(objc_retainAutorelease(v290), "UTF8String"), 1, &object);
    v22 = v296;
    if (v112)
    {
      v113 = v112;
      objc_msgSend(v293, "key");
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 751, CFSTR("Failed to get io service iterator from \"%@\" for key \"%@\"!"), v114, v115, v116, (uint64_t)v70);

      v117 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(v113));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "errorWithZhuGeErrorCode:underlyingError:", 20, v118);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v20 = v301;
      goto LABEL_46;
    }
    IOObjectRelease(v111);
    mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)className);
    v20 = v301;
    a1 = v293;
    goto LABEL_73;
  }
  if (Copy)
  {
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], Copy, &object);
    if (!MatchingServices && object)
    {
      if (v69)
        CFRelease(v69);
      MatchingServices = 0;
      goto LABEL_71;
    }
  }
  else
  {
    MatchingServices = -536870212;
  }
  if (v69)
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B18], v69, &object);
LABEL_71:
  if (MatchingServices || !object)
  {
    objc_msgSend(a1, "key");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 728, CFSTR("Failed to get io service iterator by \"%@\" for key \"%@\"!"), v249, v250, v251, (uint64_t)v70);

    v252 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", mach_error_string(MatchingServices));
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v252, "errorWithZhuGeErrorCode:underlyingError:", 20, v253);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v21 = v290;
    v22 = v296;
    goto LABEL_17;
  }
LABEL_73:
  optionsa = v18;
  v294 = a1;
  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  MEMORY[0x24BD1D4FC](object);
  v119 = IOIteratorNext(object);
  v22 = v296;
  if (!(_DWORD)v119)
    goto LABEL_168;
  v120 = v119;
  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v295 = v15;
  do
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 765, CFSTR("Trying IO service entry \"%@\"), v122, v123, v124, (uint64_t)v121);

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentClass"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    entry = v120;
    if (v125
      || (objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentName")),
          (v125 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_78:
      parent = 0;
      memset(className, 0, sizeof(className));
      memset(name, 0, sizeof(name));
      v126 = objc_retainAutorelease(v22);
      if (IORegistryEntryGetParentEntry(v120, (const char *)objc_msgSend(v126, "UTF8String"), &parent))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v120);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v294, "key");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 782, CFSTR("Failed to get parent entry of entry \"%@\" for key \"%@\"!"), v129, v130, v131, (uint64_t)v127);
      }
      else if (IOObjectGetClass(parent, className))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v120);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v294, "key");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 788, CFSTR("Failed step1 to get parent class of entry \"%@\" for key \"%@\"!"), v132, v133, v134, (uint64_t)v127);
      }
      else if (IORegistryEntryGetNameInPlane(parent, (const char *)objc_msgSend(objc_retainAutorelease(v126), "UTF8String"), name))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v120);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v294, "key");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 794, CFSTR("Failed step2 to get parent name of entry \"%@\" for key \"%@\"!"), v137, v138, v139, (uint64_t)v127);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", parent);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", className);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", name);
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 798, CFSTR("Parent entry is \"%@\", class is \"%@\", name is \"%@\"), v167, v168, v169, (uint64_t)v165);

        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentClass"));
        v170 = objc_claimAutoreleasedReturnValue();
        if (v170
          && (v171 = (void *)v170,
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentName")),
              v172 = (void *)objc_claimAutoreleasedReturnValue(),
              v172,
              v171,
              v172))
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentClass"));
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", className);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v173, "isEqualToString:", v174) & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentName"));
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", name);
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            v177 = objc_msgSend(v175, "isEqualToString:", v176);

            v136 = CFSTR("parent class and name");
            if ((v177 & 1) != 0)
              goto LABEL_88;
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v294, "key");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 803, CFSTR("Failed to match parent class and name of entry \"%@\" for key \"%@\"!"), v202, v203, v204, (uint64_t)v127);
        }
        else
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentClass"));
          v182 = (void *)objc_claimAutoreleasedReturnValue();

          if (v182)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentClass"));
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", className);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v185 = objc_msgSend(v183, "isEqualToString:", v184);

            v136 = CFSTR("parent class");
            if ((v185 & 1) != 0)
              goto LABEL_88;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v294, "key");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 812, CFSTR("Failed to match parent class of entry \"%@\" for key \"%@\"!"), v186, v187, v188, (uint64_t)v127);
          }
          else
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentName"));
            v195 = (void *)objc_claimAutoreleasedReturnValue();

            if (v195)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parentName"));
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", name);
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              v198 = objc_msgSend(v196, "isEqualToString:", v197);

              v136 = CFSTR("parent name");
              if ((v198 & 1) != 0)
                goto LABEL_88;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v294, "key");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 821, CFSTR("Failed to match parent name of entry \"%@\" for key \"%@\"!"), v199, v200, v201, (uint64_t)v127);
            }
            else
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parent"));
              v237 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v237)
              {
                v136 = CFSTR("parent check failed");
                goto LABEL_88;
              }
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parent"));
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", className);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v127, "isEqualToString:", v128) & 1) != 0)
              {
                v136 = CFSTR("parent class or name");
                goto LABEL_87;
              }
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parent"));
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", name);
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              v240 = objc_msgSend(v238, "isEqualToString:", v239);

              v136 = CFSTR("parent class or name");
              if ((v240 & 1) != 0)
                goto LABEL_88;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v294, "key");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 831, CFSTR("Failed to match parent class or name of entry \"%@\" for key \"%@\"!"), v241, v242, v243, (uint64_t)v127);
            }
          }
        }
      }
      v136 = CFSTR("parent check failed");
LABEL_87:

LABEL_88:
      v15 = v295;
      v22 = v296;
      goto LABEL_89;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parent"));
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    if (v135)
      goto LABEL_78;
    v136 = CFSTR("parent no check");
LABEL_89:
    LODWORD(v140) = entry;
    if ((-[__CFString isEqualToString:](v136, "isEqualToString:", CFSTR("parent check failed")) & 1) != 0)
      goto LABEL_160;
    *(_QWORD *)className = 0;
    CFProperties = IORegistryEntryCreateCFProperties(entry, (CFMutableDictionaryRef *)className, allocator, 0);
    if (CFProperties)
    {
      v142 = CFProperties;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      mach_error_string(v142);
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 847, CFSTR("Failed to get IO properties from entry \"%@\", %s"), v144, v145, v146, (uint64_t)v143);
      goto LABEL_159;
    }
    v143 = *(void **)className;
    v302 = 0u;
    v303 = 0u;
    v304 = 0u;
    v305 = 0u;
    v140 = v20;
    v291 = v143;
    v288 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v302, v308, 16);
    if (!v288)
    {
      v164 = 0;
      v298 = 0;
      v299 = 0;
      goto LABEL_150;
    }
    v147 = 0;
    v298 = 0;
    v299 = 0;
    v286 = v140;
    v287 = *(_QWORD *)v303;
    while (2)
    {
      v148 = 0;
      v280 = v147 + v288;
      v281 = v147;
      do
      {
        if (*(_QWORD *)v303 != v287)
          objc_enumerationMutation(v140);
        v149 = *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * v148);
        objc_msgSend(v140, "objectForKeyedSubscript:", v149);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "objectForKeyedSubscript:", v149);
        v151 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v151)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 860, CFSTR("\"%@\" doesn't exist in entry \"%@\"), v179, v180, v181, v149);
          goto LABEL_144;
        }
        if (objc_msgSend(v150, "hasPrefix:", CFSTR("number:")))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v150, "substringFromIndex:", objc_msgSend(CFSTR("number:"), "length"));
            v152 = (void *)objc_claimAutoreleasedReturnValue();

            v153 = objc_alloc_init(MEMORY[0x24BDD16F0]);
            objc_msgSend(v153, "numberFromString:", v152);
            v154 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v154, "isEqualToNumber:", v151))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
              v271 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 876, CFSTR("NSNumber \"%@\" of entry \"%@\" is %@ while expecting %@"), v192, v193, v194, v149);

              v298 = v154;
LABEL_142:
              v150 = v152;
              goto LABEL_148;
            }

            v298 = v154;
            v299 = v151;
            goto LABEL_120;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 867, CFSTR("\"%@\" of entry \"%@\" is class %@ while expecting NSNumber"), v189, v190, v191, v149);
LABEL_144:

          goto LABEL_149;
        }
        if (!objc_msgSend(v150, "hasPrefix:", CFSTR("BOOL:")))
        {
          if (objc_msgSend(v150, "hasPrefix:", CFSTR("data:")))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 901, CFSTR("\"%@\" of entry \"%@\" is class %@ while expecting NSData"), v211, v212, v213, v149);
              goto LABEL_144;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringFromData:", v151);
            v299 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v150, "substringFromIndex:", objc_msgSend(CFSTR("data:"), "length"));
            v157 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v157)
            {
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 909, CFSTR("\"%@\" is not a valid data criterion"), v158, v159, v160, (uint64_t)v150);
              v298 = 0;
              v151 = v299;
              goto LABEL_149;
            }
            v151 = v299;
            if ((objc_msgSend(v157, "isEqualToString:", v299) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 914, CFSTR("NSData \"%@\" of entry \"%@\" is %@ while expecting %@"), v218, v219, v220, v149);
              goto LABEL_147;
            }
          }
          else
          {
            if (!objc_msgSend(v150, "hasPrefix:", CFSTR("string:")))
              goto LABEL_149;
            objc_msgSend(v150, "substringFromIndex:", objc_msgSend(CFSTR("string:"), "length"));
            v157 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v157, "isEqualToString:", v151) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 922, CFSTR("NSString \"%@\" of entry \"%@\" is %@ while expecting %@"), v214, v215, v216, v149);
LABEL_147:

              v298 = v157;
LABEL_148:
              v22 = v296;
LABEL_149:

              v164 = v281 + v148;
              v299 = v151;
              v15 = v295;
              v20 = v301;
              v143 = v291;
              v140 = v286;
              goto LABEL_150;
            }
            v299 = v151;
          }
          v298 = v157;
          v152 = v150;
          goto LABEL_120;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 882, CFSTR("\"%@\" of entry \"%@\" is class %@ while expecting BOOL<NSNumber>"), v205, v206, v207, v149);
          goto LABEL_144;
        }
        objc_msgSend(v150, "substringFromIndex:", objc_msgSend(CFSTR("BOOL:"), "length"));
        v152 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v152, "lowercaseString");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v155, "isEqualToString:", CFSTR("yes")))
        {

          v156 = (void *)MEMORY[0x24BDBD1C8];
        }
        else
        {
          objc_msgSend(v152, "lowercaseString");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v300 = objc_msgSend(v161, "isEqualToString:", CFSTR("true"));

          if (v300)
            v156 = (void *)MEMORY[0x24BDBD1C8];
          else
            v156 = (void *)MEMORY[0x24BDBD1C0];
        }

        v162 = objc_msgSend(v156, "BOOLValue");
        if (v162 != objc_msgSend(v151, "BOOLValue"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 895, CFSTR("BOOL \"%@\" of entry \"%@\" is %@ while expecting %@"), v208, v209, v210, v149);

          v298 = v156;
          goto LABEL_142;
        }
        v298 = v156;
        v299 = v151;
LABEL_120:

        ++v148;
        v15 = v295;
        v22 = v296;
        v143 = v291;
        v140 = v286;
      }
      while (v288 != v148);
      v163 = objc_msgSend(v286, "countByEnumeratingWithState:objects:count:", &v302, v308, 16);
      v164 = v280;
      v147 = v280;
      v20 = v301;
      v288 = v163;
      if (v163)
        continue;
      break;
    }
LABEL_150:
    v221 = v164;

    if (objc_msgSend(v140, "count") == v221)
    {
      if (v282)
      {
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 941, CFSTR("Checking in self node for property \"%@\"), v222, v223, v224, (uint64_t)v8);
        objc_msgSend(v143, "objectForKeyedSubscript:", v8);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = (id)entry;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", optionsa);
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 944, CFSTR("Checking entry \"%@\", plane \"%@\" for property \"%@\" with direction %@,"), v231, v232, v233, (uint64_t)v230);

        v143 = v291;
        v140 = (id)entry;
        v225 = (void *)IORegistryEntrySearchCFProperty(entry, (const char *)objc_msgSend(objc_retainAutorelease(v290), "UTF8String"), v8, allocator, optionsa);
      }
      if (v225)
      {
        objc_msgSend(v23, "addObject:", v225);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v140);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 949, CFSTR("No property \"%@\" in entry \"%@\"), v234, v235, v236, (uint64_t)v8);

        LODWORD(v140) = entry;
      }
    }
    else
    {
      v226 = v221;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", entry);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v226 + 1));
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v140, "count"));
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 933, CFSTR("Entry \"%@\" failed check at %@/%@"), v227, v228, v229, (uint64_t)v225);

      v143 = v291;
      LODWORD(v140) = entry;

    }
LABEL_159:

LABEL_160:
    IOObjectRelease((io_object_t)v140);
    v120 = IOIteratorNext(object);
  }
  while ((_DWORD)v120);
LABEL_168:
  v244 = objc_msgSend(v23, "count");
  if (v244 == 1)
  {
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v254 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v294, "key");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 965, CFSTR("Found 1 property \"%@\" for key \"%@\" with non-fullPath"), v255, v256, v257, (uint64_t)v8);

    v23 = (id)v254;
  }
  else if (v244)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v294, "key");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 969, CFSTR("Found %@ property \"%@\" for key \"%@\" with non-fullPath"), v259, v260, v261, (uint64_t)v258);

  }
  else
  {

    objc_msgSend(v294, "key");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]", 959, CFSTR("Failed to find a non-fullPath service for key \"%@\"), v246, v247, v248, (uint64_t)v245);

    v95 = (void *)MEMORY[0x24BDD1540];
    v96 = 21;
LABEL_171:
    objc_msgSend(v95, "errorWithZhuGeErrorCode:underlyingError:", v96, 0);
    v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_175:
  v21 = v290;
LABEL_17:
  if (object)
  {
    IOObjectRelease(object);
    object = 0;
  }

  return v23;
}

+ (id)querySysctlVariableName:(id)a3 dataType:(id)a4 withError:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  size_t v24;
  _OWORD v25[8];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v11 = a4;
  memset(v25, 0, sizeof(v25));
  v24 = 128;
  if (!a5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysctlVariableName:dataType:withError:]", 993, CFSTR("error p-pointer is nil!"), v8, v9, v10, v23);
    v15 = 0;
    goto LABEL_12;
  }
  *a5 = 0;
  if (!v7)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysctlVariableName:dataType:withError:]", 999, CFSTR("name pointer is nil!"), v8, v9, v10, v23);
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 45;
LABEL_9:
    objc_msgSend(v16, "errorWithZhuGeErrorCode:underlyingError:", v17, 0);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v12 = objc_retainAutorelease(v7);
  if (sysctlbyname((const char *)objc_msgSend(v12, "UTF8String"), v25, &v24, 0, 0) == -1)
  {
    __error();
    v18 = __error();
    strerror(*v18);
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysctlVariableName:dataType:withError:]", 1007, CFSTR("Cannot look up \"%@\". System errno=%d errstr=%s"), v19, v20, v21, (uint64_t)v12);
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 61;
    goto LABEL_9;
  }
  objc_msgSend(v11, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("number"));

  if (v14)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)&v25[0]);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v15;
}

+ (id)ZhuGeToDo:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v17;
  id v18;

  v5 = a3;
  v9 = v5;
  if (a4)
  {
    *a4 = 0;
    if (!v5)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory ZhuGeToDo:withError:]", 1039, CFSTR("name pointer is nil!"), v6, v7, v8, v17);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v10 = 0;
      goto LABEL_7;
    }
    v18 = 0;
    MGQuery(v5, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (!v10)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory ZhuGeToDo:withError:]", 1047, CFSTR("Failed to retrive value for \"%@\" from MobileGestalt!"), v11, v12, v13, (uint64_t)v9);
      v15 = objc_retainAutorelease(v14);
      v14 = v15;
LABEL_7:
      *a4 = v15;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory ZhuGeToDo:withError:]", 1033, CFSTR("error p-pointer is nil!"), v6, v7, v8, v17);
    v14 = 0;
    v10 = 0;
  }

  return v10;
}

+ (id)queryIOCameraByProperty:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t i;
  uint64_t v27;
  void *v28;
  id *v29;
  id v30;
  _OWORD v31[4];
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = v6;
  v31[2] = xmmword_251C3E448;
  v31[3] = *(_OWORD *)off_251C3E458;
  v32 = CFSTR("AppleH16CamIn");
  v31[0] = xmmword_251C3E428;
  v31[1] = *(_OWORD *)&off_251C3E438;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      v29 = a4;
      v11 = 0;
      v12 = 0;
      v13 = 64;
      while (1)
      {
        v14 = v11;

        v15 = *(_QWORD *)((char *)v31 + v13);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s://%@/%@"), "IOService", v15, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0;
        objc_msgSend(a1, "queryIOPropertyFromPath:andCriteria:withError:", v11, &unk_251C48550, &v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v30;
        v12 = v17;
        if (v16)
          break;
        objc_msgSend(v17, "ZhuGeDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOCameraByProperty:withError:]", 1665, CFSTR("Failed to query property for %@, error %@"), v18, v19, v20, v15);

        v13 -= 8;
        if (v13 == -8)
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOCameraByProperty:withError:]", 1669, CFSTR("Failed to query property %@! after trying all methods"), v21, v22, v23, (uint64_t)v10);
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 63, 0);
          v16 = 0;
          *v29 = (id)objc_claimAutoreleasedReturnValue();
          break;
        }
      }
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOCameraByProperty:withError:]", 1648, CFSTR("property pointer is nil!"), v7, v8, v9, v27);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v12 = 0;
      v16 = 0;
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryIOCameraByProperty:withError:]", 1642, CFSTR("error p-pointer is nil!"), v7, v8, v9, v27);
    v12 = 0;
    v16 = 0;
    v11 = 0;
  }
  v24 = v16;
  for (i = 64; i != -8; i -= 8)

  return v24;
}

+ (id)queryScreenSerialNumberByProperty:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  _QWORD v37[2];
  __int16 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10 = v6;
  v37[0] = 0;
  v37[1] = 0;
  v38 = 0;
  if (a4)
  {
    *a4 = 0;
    if (v6)
    {
      v35 = CFSTR("basic");
      v33 = CFSTR("path");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:/%@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = 0;
      objc_msgSend(a1, "queryIOProperty:fromCriteria:withError:", CFSTR("panel-serial-number"), v13, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32;
      v16 = v15;
      if (!v14)
      {
        v31 = v15;
        objc_msgSend(a1, "queryIOProperty:fromCriteria:withError:", v10, v13, &v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v31;

        if (!v14)
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1717, CFSTR("Failed to query property %@! after trying all methods"), v18, v19, v20, (uint64_t)v10);
          v24 = objc_retainAutorelease(v17);
          v16 = v24;
          goto LABEL_10;
        }
        v16 = v17;
      }
      if ((unint64_t)objc_msgSend(v14, "length") > 0x11)
      {
        objc_msgSend(v14, "getBytes:length:", v37, 18);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v37, 18, 4);
        if (v25)
          goto LABEL_12;
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1732, CFSTR("Failed to get ScreenSerialNumber"), v27, v28, v29, (uint64_t)"IODeviceTree");
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 10, 0);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1723, CFSTR("The size of %@(less than %d) isn't correct: %@!"), v21, v22, v23, (uint64_t)v10);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 37, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1699, CFSTR("property pointer is nil!"), v7, v8, v9, v30);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v16 = 0;
      v13 = 0;
    }
LABEL_10:
    v25 = 0;
LABEL_11:
    *a4 = v24;
    goto LABEL_12;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryScreenSerialNumberByProperty:withError:]", 1693, CFSTR("error p-pointer is nil!"), v7, v8, v9, v30);
  v14 = 0;
  v16 = 0;
  v13 = 0;
  v25 = 0;
LABEL_12:

  return v25;
}

+ (id)queryWLHWIdentifierInfoByProperty:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v34;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("C"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1770, CFSTR("error p-pointer is nil!"), v7, v8, v9, (uint64_t)CFSTR("ChipNumber"));
    v20 = 0;
    v11 = 0;
    v19 = 0;
    v15 = 0;
    goto LABEL_14;
  }
  *a4 = 0;
  if (!v6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1776, CFSTR("property pointer is nil!"), v7, v8, v9, (uint64_t)CFSTR("ChipNumber"));
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v11 = 0;
    v19 = 0;
    v15 = 0;
LABEL_13:
    *a4 = v31;
    goto LABEL_14;
  }
  v34 = 0;
  objc_msgSend(a1, "queryIOProperty:fromCriteria:withError:", CFSTR("HWIdentifiers"), &unk_251C485A0, &v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v34;
  if (!v11)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1790, CFSTR("Failed to query WLHWIdentifier for property %@, no matching key found in %s"), v12, v13, v14, (uint64_t)v6);
    v31 = objc_retainAutorelease(v15);
    v15 = v31;
LABEL_12:
    v20 = 0;
    v19 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1796, CFSTR("Failed to query WLHWIdentifier due to mismatch data type, data read %@"), v16, v17, v18, (uint64_t)v11);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 38, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v10, "objectForKey:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1804, CFSTR("No data for property %@, field %@"), v21, v22, v23, (uint64_t)v6);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v11, "objectForKey:", v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "objectForKey:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v27, "intValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v11, "objectForKey:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLHWIdentifierInfoByProperty:withError:]", 1815, CFSTR("Read %@, field %@, output %@"), v28, v29, v30, (uint64_t)v6);
LABEL_14:
  v32 = v20;

  return v32;
}

+ (id)queryWLModuleSerialNumberWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22;

  v22 = 0;
  objc_msgSend(a1, "queryIOProperty:fromCriteria:withError:", CFSTR("wifi-module-sn"), &unk_251C485F0, &v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  if (!v4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLModuleSerialNumberWithError:]", 1842, CFSTR("Failed to query wifi-module-sn from ioreg path %@!"), v5, v6, v7, 0);
    v14 = objc_retainAutorelease(v8);
LABEL_9:
    v10 = 0;
    *a3 = v14;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = objc_opt_class();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLModuleSerialNumberWithError:]", 1848, CFSTR("Query wifi-module-sn fail, type %@, data %@"), v16, v17, v18, v15);
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 38;
LABEL_8:
    objc_msgSend(v19, "errorWithZhuGeErrorCode:underlyingError:", v20, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "hexStringFromData:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") != 12)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLModuleSerialNumberWithError:]", 1855, CFSTR("Unexpected length of wifi-module-sn: %@, expecting length %d"), v11, v12, v13, (uint64_t)v10);

    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 37;
    goto LABEL_8;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryWLModuleSerialNumberWithError:]", 1861, CFSTR("Read WLModuleSerialNumber, output %@"), v11, v12, v13, (uint64_t)v10);
LABEL_10:

  return v10;
}

+ (id)querySecureElementIDWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  __int128 v52;

  v52 = xmmword_24B33BC90;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  v45 = 0;
  if (a3)
  {
    *a3 = 0;
    if (isZhuGeInRestoreOS())
    {
      if (!MEMORY[0x24BEDCC38])
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]", 2231, CFSTR("Failed to weak link libnfrestore.dylib, NfRestoreSEList isn't available!"), v7, v8, v9, v33);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 13, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v11 = 0;
        v12 = 0;
        v13 = 0;
        *a3 = v10;
        goto LABEL_18;
      }
      if (NfRestoreSEList() || !BYTE12(v52))
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]", 2240, CFSTR("Failed to query Secure Element ID!"), v28, v29, v30, v33);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 36, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v11 = 0;
      v12 = 0;
      v13 = (void *)v52;
    }
    else
    {
      if (!objc_opt_class() || !objc_opt_class())
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]", 2245, CFSTR("Failed to weak link near field framework!"), v14, v15, v16, v33);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 13, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v17 = dispatch_semaphore_create(0);
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __55__ZhuGeKeysActionArmory_querySecureElementIDWithError___block_invoke;
      v36[3] = &unk_251C3E478;
      v38 = &v46;
      v39 = &v40;
      v11 = v17;
      v37 = v11;
      v12 = (void *)MEMORY[0x24BD1D9A0](v36);
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]", 2258, CFSTR("Before invoking sharedHardwareManager() from NearField Framework"), v18, v19, v20, v33);
      objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager:", v12);
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]", 2260, CFSTR("After invoking sharedHardwareManager() from NearField Framework"), v21, v22, v23, v34);
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      v27 = (void *)v47[5];
      if (v27)
      {
        objc_msgSend(v27, "serialNumber");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]", 2265, CFSTR("Failed to retrieve Secure Element!"), v24, v25, v26, v35);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 36, v41[5]);
        v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]", 2222, CFSTR("error p-pointer is nil!"), v3, v4, v5, v33);
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
LABEL_18:
  v31 = v13;

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v31;
}

void __55__ZhuGeKeysActionArmory_querySecureElementIDWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;

  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]_block_invoke", 2252, CFSTR("Entering aHWManagerReady callback"), a6, a7, a8, v16);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(MEMORY[0x24BE6B5C0], "embeddedSecureElementWithError:", &obj);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySecureElementIDWithError:]_block_invoke", 2255, CFSTR("Exiting aHWManagerReady callback"), v13, v14, v15, v17);
}

+ (id)queryNFSecureElementByKey:(id)a3 WithError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  dispatch_semaphore_t v22;
  void *v23;
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
  unsigned int v37;
  char *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _OWORD v61[3];
  __int16 v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  v62 = 0;
  memset(v61, 0, sizeof(v61));
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__0;
  v59 = __Block_byref_object_dispose__0;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  v54 = 0;
  if (a4)
  {
    *a4 = 0;
    if (!v5)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2378, CFSTR("nfKey pointer is nil!"), v6, v7, v8, v43);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if ((objc_msgSend(&unk_251C48FA0, "containsObject:", v5) & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2384, CFSTR("Unknown SE Type \"%@\"!"), v10, v11, v12, (uint64_t)v9);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 70, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2389, CFSTR("Querying %@ of Secure Element."), v10, v11, v12, (uint64_t)v9);
    if (isZhuGeInRestoreOS())
    {
      if (!MEMORY[0x24BEDCC30])
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2399, CFSTR("Failed to weak link libnfrestore.dylib, NfRestoreSEEnumerate isn't available!"), v13, v14, v15, v44);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 13, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
        v17 = 0;
        v18 = 0;
        goto LABEL_33;
      }
      if (NfRestoreSEEnumerate())
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2406, CFSTR("Failed to query \"%@\"!"), v31, v32, v33, (uint64_t)v9);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 36, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("jcopSESN")))
      {
        v37 = LOBYTE(v61[0]);
        v38 = (char *)v61 + 1;
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", CFSTR("systemSESN")))
          goto LABEL_31;
        v37 = BYTE9(v61[1]);
        v38 = (char *)&v61[1] + 10;
      }
      if (v37)
      {
        v39 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v38, v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "hexStringFromData:", v40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
LABEL_31:
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2420, CFSTR("Failed to get valid data for \"%@\" in restoreOS!"), v34, v35, v36, (uint64_t)v9);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 36, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (!objc_opt_class() || !objc_opt_class())
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2432, CFSTR("Failed to weak link near field framework!"), v19, v20, v21, v44);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 13, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    v22 = dispatch_semaphore_create(0);
    v23 = (void *)MEMORY[0x24BE6B598];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __61__ZhuGeKeysActionArmory_queryNFSecureElementByKey_WithError___block_invoke;
    v45[3] = &unk_251C3E478;
    v47 = &v55;
    v48 = &v49;
    v18 = v22;
    v46 = v18;
    objc_msgSend(v23, "sharedHardwareManager:", v45);

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    if (!v56[5])
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2449, CFSTR("Failed to retrieve Secure Element!"), v24, v25, v26, v44);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 36, v50[5]);
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
      v17 = 0;
LABEL_33:
      *a4 = v16;
      goto LABEL_34;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("jcopSESN")))
    {
      objc_msgSend((id)v56[5], "serialNumber");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("systemSESN")))
      {
LABEL_25:
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2461, CFSTR("Failed to get valid data for \"%@\" in bootedOS!"), v28, v29, v30, (uint64_t)v9);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 36, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      objc_msgSend((id)v56[5], "systemOSSerialNumber");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v27;
    if (v27)
      goto LABEL_34;
    goto LABEL_25;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]", 2372, CFSTR("error p-pointer is nil!"), v6, v7, v8, v43);
  v17 = 0;
LABEL_8:
  v18 = 0;
LABEL_34:
  v41 = v17;
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v41;
}

void __61__ZhuGeKeysActionArmory_queryNFSecureElementByKey_WithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;

  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]_block_invoke", 2440, CFSTR("Entering aHWManagerReady callback"), a6, a7, a8, v16);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(MEMORY[0x24BE6B5C0], "embeddedSecureElementWithError:", &obj);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryNFSecureElementByKey:WithError:]_block_invoke", 2443, CFSTR("Exiting aHWManagerReady callback"), v13, v14, v15, v17);
}

+ (id)queryDisplayUniqueChipIDWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;
  id v15;

  if (a3)
  {
    *a3 = 0;
    v15 = 0;
    objc_msgSend(a1, "queryIOProperty:fromCriteria:withError:", CFSTR("ecid"), &unk_251C48668, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "integerFromData:size:truncate:isSigned:needSwap:", v7, 8, 1, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryDisplayUniqueChipIDWithError:]", 2501, CFSTR("Failed to query IO property \"ecid\" for TCON!"), v8, v9, v10, v14);
      v11 = objc_retainAutorelease(v11);
      v12 = 0;
      *a3 = v11;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryDisplayUniqueChipIDWithError:]", 2483, CFSTR("error p-pointer is nil!"), v3, v4, v5, v14);
    v7 = 0;
    v11 = 0;
    v12 = 0;
  }

  return v12;
}

+ (id)querySysCfgKey:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  id v26;

  v5 = a3;
  v9 = v5;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysCfgKey:withError:]", 2528, CFSTR("error p-pointer is nil!"), v6, v7, v8, v25);
    v10 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysCfgKey:withError:]", 2534, CFSTR("key pointer is nil!"), v6, v7, v8, v25);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 45, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v14 = 0;
    goto LABEL_13;
  }
  v26 = 0;
  MGQuery(CFSTR("SysCfgDict"), &v26);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  if (!v10)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysCfgKey:withError:]", 2542, CFSTR("Failed to get sysconfig dictionary!"), v11, v12, v13, v25);
    v16 = objc_retainAutorelease(v14);
    v14 = v16;
    goto LABEL_13;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("all")))
  {
    if (objc_msgSend(v9, "length") == 4)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_15;
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysCfgKey:withError:]", 2561, CFSTR("Failed to read \"%@\" from sysconfig dictionary"), v17, v18, v19, (uint64_t)v9);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 60, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      *a4 = v16;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory querySysCfgKey:withError:]", 2554, CFSTR("Length of sysconfig key %@ is wrong, expecting 4!"), v21, v22, v23, (uint64_t)v20);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 37, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v10 = v10;
  v15 = v10;
LABEL_15:

  return v15;
}

+ (id)queryThreadRadioMacAddressForProvisioningWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[2];
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = a3;
    *a3 = 0;
    if (objc_msgSend(&unk_251C48FB8, "count"))
    {
      v26 = (uint64_t)v6;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = v10;
        v31 = CFSTR("basic");
        v12 = v9;
        v29[0] = CFSTR("servicePlane");
        v29[1] = CFSTR("serviceName");
        v30[0] = CFSTR("IODeviceTree");
        objc_msgSend(&unk_251C48FB8, "objectAtIndexedSubscript:", v8, v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v12;
        objc_msgSend(a1, "queryIOProperty:fromCriteria:withError:", CFSTR("local-mac-address"), v10, &v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v28;

        if (v15)
          break;
        if (objc_msgSend(&unk_251C48FB8, "count") <= (unint64_t)++v8)
        {
          v15 = 0;
          v6 = (id *)v26;
          goto LABEL_9;
        }
      }
      if (objc_msgSend(v15, "length"))
        v19 = objc_msgSend(v15, "length");
      else
        v19 = 8;
      v6 = (id *)v26;
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v15 = 0;
LABEL_9:
      v19 = 8;
    }
    v27 = v9;
    objc_msgSend(a1, "querySysCfgKey:withError:", CFSTR("TMac"), &v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v27;

    if (v20)
    {
      v24 = objc_alloc(MEMORY[0x24BDBCE50]);
      v16 = objc_retainAutorelease(v20);
      v17 = (void *)objc_msgSend(v24, "initWithBytes:length:", objc_msgSend(v16, "bytes"), v19);
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryThreadRadioMacAddressForProvisioningWithError:]", 2610, CFSTR("Failed to get TMac from sysconfig dictionary!"), v21, v22, v23, v26);
      v18 = objc_retainAutorelease(v18);
      v16 = 0;
      v17 = 0;
      *v6 = v18;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryThreadRadioMacAddressForProvisioningWithError:]", 2585, CFSTR("error p-pointer is nil!"), v3, v4, v5, v26);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v10 = 0;
    v18 = 0;
  }

  return v17;
}

+ (id)queryThreadRadioMacAddress64BitWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;

  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryThreadRadioMacAddress64BitWithError:]", 2632, CFSTR("error p-pointer is nil!"), v3, v4, v5, v18);
    v12 = 0;
    v11 = 0;
    v7 = 0;
    goto LABEL_11;
  }
  *a3 = 0;
  v19 = 0;
  objc_msgSend(a1, "queryThreadRadioMacAddressForProvisioningWithError:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (!v7)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryThreadRadioMacAddress64BitWithError:]", 2640, CFSTR("Failed to get TMac from sysconfig dictionary!"), v8, v9, v10, v18);
    v13 = objc_retainAutorelease(v11);
    v11 = v13;
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "length") != 6)
  {
    if (objc_msgSend(v7, "length") == 8)
    {
      v12 = v7;
      v7 = v12;
      goto LABEL_11;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryThreadRadioMacAddress64BitWithError:]", 2668, CFSTR("TMac in sysconfig dictionary is with invalid length."), v14, v15, v16, v18);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 60, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = 0;
    *a3 = v13;
    goto LABEL_11;
  }
  HIWORD(v18) = -257;
  BYTE4(v18) = 0;
  WORD1(v18) = 0;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 8);
  objc_msgSend(v7, "getBytes:length:", (char *)&v18 + 2, 3);
  objc_msgSend(v12, "replaceBytesInRange:withBytes:", 0, 3, (char *)&v18 + 2);
  objc_msgSend(v12, "replaceBytesInRange:withBytes:", 3, 2, (char *)&v18 + 6);
  objc_msgSend(v7, "getBytes:range:", (char *)&v18 + 2, 3, 3);
  objc_msgSend(v12, "replaceBytesInRange:withBytes:", 5, 3, (char *)&v18 + 2);
LABEL_11:

  return v12;
}

+ (id)queryVinylEUICCCSNwithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    *a3 = 0;
    if (isZhuGeInRestoreOS())
    {
      if (!MEMORY[0x24BED9F00])
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryVinylEUICCCSNwithError:]", 2698, CFSTR("Failed to weak link libVinylNonUpdater.dylib, VinyleUICCPerformOperation isn't available!"), v8, v9, v10, v44);
        v11 = (void *)MEMORY[0x24BDD1540];
        v12 = 13;
LABEL_11:
        objc_msgSend(v11, "errorWithZhuGeErrorCode:underlyingError:", v12, 0);
        v13 = 0;
        v14 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      v45 = CFSTR("DebugArgs");
      v46 = CFSTR("-l 0xFFFFFFFF -v 99");
      v47[0] = CFSTR("BasebandUpdater");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = CFSTR("UpdateBaseband");
      v48[0] = v24;
      v48[1] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = VinyleUICCPerformOperation();
      if ((_DWORD)v26)
      {
        v27 = v26;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryVinylEUICCCSNwithError:]", 2717, CFSTR("Failed to get response from eUICC operation! Error code: %@"), v29, v30, v31, (uint64_t)v28);

        v32 = (void *)MEMORY[0x24BDD1540];
        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v27);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("Vinyl error code: %@"), v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithZhuGeErrorCode:underlyingError:", 4, v35);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v14 = 0;
      }
      else
      {
        v34 = 0;
        objc_msgSend(0, "objectForKeyedSubscript:", CFSTR("EID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(0, "objectForKeyedSubscript:", CFSTR("EID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryVinylEUICCCSNwithError:]", 2725, CFSTR("Didn't find EID from response of eUICC operation!"), v40, v41, v42, v44);
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      v13 = 0;
    }
    else
    {
      +[ZhuGeSingletonArmory sharedInstance](ZhuGeArmory, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "helper");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "keysConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "key");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(a1, "key");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryVinylEUICCCSNwithError:]", 2737, CFSTR("Did not find config of key %@"), v37, v38, v39, (uint64_t)v36);

        v11 = (void *)MEMORY[0x24BDD1540];
        v12 = 29;
        goto LABEL_11;
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CACHEABLE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryVinylEUICCCSNwithError:]", 2743, CFSTR("ZhuGeBasebandFirmwareUpdateInfo query:%@ isCachable:%s"), v21, v22, v23, (uint64_t)CFSTR("kVinylFwUpdateCsn"));
      +[ZhuGeBasebandFirmwareUpdateInfoArmory query:isCachable:withError:](ZhuGeBasebandFirmwareUpdateInfoArmory, "query:isCachable:withError:", CFSTR("kVinylFwUpdateCsn"), v20, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryVinylEUICCCSNwithError:]", 2689, CFSTR("error p-pointer is nil!"), v3, v4, v5, v44);
    v13 = 0;
    v14 = 0;
  }
LABEL_16:

  return v14;
}

+ (id)queryBasebandFirmwareSecurityInfo:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v9 = a3;
  if (a4)
  {
    +[ZhuGeSingletonArmory sharedInstance](ZhuGeArmory, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "helper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keysConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "key");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CACHEABLE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryBasebandFirmwareSecurityInfo:withError:]", 2774, CFSTR("ZhuGeBasebandFirmwareSecurityInfo query:%@ forceCacheable:%s"), v17, v18, v19, (uint64_t)v9);
      +[ZhuGeBasebandFirmwareSecurityInfoArmory query:forceCacheable:withError:](ZhuGeBasebandFirmwareSecurityInfoArmory, "query:forceCacheable:withError:", v9, v16, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "key");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryBasebandFirmwareSecurityInfo:withError:]", 2768, CFSTR("did not find config of key %@"), v22, v23, v24, (uint64_t)v21);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryBasebandFirmwareSecurityInfo:withError:]", 2759, CFSTR("error pointer is nil"), v6, v7, v8, v26);
    v20 = 0;
  }

  return v20;
}

+ (id)queryMogulIDSN:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  CFTypeRef v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  mach_port_t IOConnection;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  io_connect_t v34;
  mach_error_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  mach_error_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __CFString *v51;
  uint64_t v52;
  mach_error_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _DWORD *v61;
  int v62;
  void *v63;
  void *outputStruct;
  void *outputStructa;
  uint64_t outputStructb;
  CFTypeRef cf;
  BOOL (*v68)(io_registry_entry_t, _DWORD *);
  int *v69;
  int v70;
  uint64_t input;
  size_t v72;
  unsigned __int8 v73[8];
  size_t v74;
  __int16 v75;
  char inputStruct;
  uint64_t v77;
  char v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v9 = v5;
  v70 = 2;
  v68 = 0;
  v69 = 0;
  cf = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulIDSN:withError:]", 3044, CFSTR("error p-pointer is nil!"), v6, v7, v8, (uint64_t)outputStruct);
    v11 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulIDSN:withError:]", 3049, CFSTR("key pointer is nil"), v6, v7, v8, (uint64_t)outputStruct);
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = 45;
LABEL_16:
    objc_msgSend(v13, "errorWithZhuGeErrorCode:underlyingError:", v14, 0);
    v11 = 0;
    v12 = 0;
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("mogulAce3")) & 1) != 0)
  {
    v10 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("mogulTopModule")) & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulIDSN:withError:]", 3061, CFSTR("Unknown Mogul Type"), v15, v16, v17, (uint64_t)outputStruct);
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = 38;
    goto LABEL_16;
  }
  v10 = 1;
LABEL_9:
  v70 = v10;
  if (!readPropertyFromMogulService(v10, "AppleAuthCPAID", CFSTR("IDSN"), &cf))
  {
    if (readPropertyFromMogulService(v10, "AppleAuthCP", CFSTR("IDSN"), &cf))
    {
      v21 = CFSTR("Successfully read IDSN from AppleAuthCP I2C service.");
      v22 = 2933;
      goto LABEL_13;
    }
    v68 = isMogulService;
    v69 = &v70;
    IOConnection = getIOConnection(MEMORY[0x24BDD89A8], CFSTR("IOPortTransportAIDBus"), &v68, 1, a4);
    if (!IOConnection)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulIDSN:withError:]", 3078, CFSTR("Failed to get a connection for AID Bus!"), v31, v32, v33, (uint64_t)outputStruct);
      v11 = 0;
      goto LABEL_14;
    }
    v34 = IOConnection;
    v75 = 0;
    v74 = 2;
    *(_DWORD *)&v73[3] = 0;
    *(_DWORD *)v73 = 0;
    v72 = 7;
    input = 5000;
    v77 = 0x60100000102E2;
    v78 = 6;
    inputStruct = -102;
    v35 = IOConnectCallMethod(IOConnection, 4u, &input, 1u, &inputStruct, 1uLL, 0, 0, &v75, &v74);
    if (v35)
    {
      v39 = mach_error_string(v35);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 2978, CFSTR("Mogul is not ready via AID, result: %s"), v40, v41, v42, (uint64_t)v39);
LABEL_31:
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulIDSN:withError:]", 3083, CFSTR("Failed to read IDSN via AID"), v43, v44, v45, (uint64_t)outputStructa);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, 0);
      v28 = 0;
      v12 = 0;
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
      IOServiceClose(v34);
      goto LABEL_17;
    }
    if (v75 == 155)
    {
      v46 = IOConnectCallMethod(v34, 4u, &input, 1u, &v77, 9uLL, 0, 0, v73, &v72);
      if (v46)
      {
        v47 = mach_error_string(v46);
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 2989, CFSTR("failed to read IDSN data via AID, result: %s"), v48, v49, v50, (uint64_t)v47);
        goto LABEL_31;
      }
      if (v73[0] == 227)
      {
        v53 = IOConnectCallMethod(v34, 4u, &input, 1u, &inputStruct, 1uLL, 0, 0, &v75, &v74);
        if (v53)
        {
          v57 = mach_error_string(v53);
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 2999, CFSTR("cannot get error code, result: %s"), v58, v59, v60, (uint64_t)v57);
          goto LABEL_31;
        }
        if (v75 != 155)
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 3003, CFSTR("failed to get errorcode response: %x"), v54, v55, v56, v75);
          goto LABEL_31;
        }
        if (HIBYTE(v75))
        {
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 3007, CFSTR("read IDSN failed, errorcode: %x"), v54, v55, v56, HIBYTE(v75));
          goto LABEL_31;
        }
        v61 = malloc_type_calloc(1uLL, 6uLL, 0xE156FD29uLL);
        if (v61)
        {
          v28 = v61;
          v62 = *(_DWORD *)&v73[1];
          *((_WORD *)v61 + 2) = *(_WORD *)&v73[5];
          *v61 = v62;
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", 3018, CFSTR("success read idsnData, first byte: %x"), v36, v37, v38, v62);
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v28, 6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "hexStringFromData:", v12);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "uppercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }
        v51 = CFSTR("cannot allocate space for idsn data");
        v52 = 3013;
      }
      else
      {
        v51 = CFSTR("failed to get read memory response");
        v52 = 2993;
      }
    }
    else
    {
      v51 = CFSTR("failed to get errorcode response: %x");
      outputStructb = v75;
      v52 = 2982;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "AIDReadIDSN", v52, v51, v36, v37, v38, outputStructb);
    goto LABEL_31;
  }
  v21 = CFSTR("Successfully read IDSN from AppleAuthCP AID service.");
  v22 = 2929;
LABEL_13:
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "readIDSNAuthCP", v22, v21, v18, v19, v20, (uint64_t)outputStruct);
  v23 = cf;
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulIDSN:withError:]", 3068, CFSTR("Get IDSN from AuthCP: %@"), v24, v25, v26, (uint64_t)cf);
  objc_msgSend(MEMORY[0x24BDD17C8], "hexStringFromData:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  v12 = 0;
  v28 = 0;
LABEL_17:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v28)
    free(v28);
LABEL_21:

  return v11;
}

+ (id)queryTouchScreenCert:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  const __CFString *v30;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    *a3 = 0;
    if (objc_msgSend(&unk_251C48FD0, "count"))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v11;
        v30 = CFSTR("basic");
        v13 = v10;
        v29[0] = CFSTR("IODeviceTree");
        v28[0] = CFSTR("servicePlane");
        v28[1] = CFSTR("serviceClass");
        objc_msgSend(&unk_251C48FD0, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v14;
        v29[2] = CFSTR("IOService");
        v28[2] = CFSTR("parentPlane");
        v28[3] = CFSTR("parentClass");
        objc_msgSend(&unk_251C48FE8, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28[4] = CFSTR("direction");
        v29[3] = v15;
        v29[4] = CFSTR("child");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v13;
        objc_msgSend(a1, "queryIOProperty:fromCriteria:withError:", CFSTR("AccessoryCertificate"), v11, &v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v27;

        objc_msgSend(&unk_251C48FE8, "objectAtIndexedSubscript:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_251C48FD0, "objectAtIndexedSubscript:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryTouchScreenCert:]", 3131, CFSTR("querying %@/%@ returned %s and %@"), v20, v21, v22, (uint64_t)v18);

        if (v17)
          break;
        if (objc_msgSend(&unk_251C48FD0, "count") <= (unint64_t)++v9)
          goto LABEL_9;
      }
    }
    else
    {
      v11 = 0;
      v10 = 0;
LABEL_9:
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryTouchScreenCert:]", 3138, CFSTR("Failed to get touch screen cert from ioreg"), v6, v7, v8, v24);
      v10 = objc_retainAutorelease(v10);
      v17 = 0;
      *a3 = v10;
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryTouchScreenCert:]", 3112, CFSTR("error p-pointer is nil!"), v3, v4, v5, v24);
    v11 = 0;
    v17 = 0;
    v10 = 0;
  }

  return v17;
}

+ (id)queryMogulTouchScreenCertDecoded:(BOOL)a3 withError:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFDataRef v13;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFData *v26;
  const __CFAllocator *v27;
  __CFString *v28;
  uint64_t v29;
  const UInt8 *v30;
  CFDataRef theData;
  unint64_t v32;
  const UInt8 *v33;
  unint64_t v34;
  unint64_t v35[2];
  unint64_t v36[2];
  unint64_t v37[2];

  theData = 0;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]", 3247, CFSTR("error p-pointer is nil!"), v4, v5, v6, (uint64_t)v30);
    v13 = 0;
    return v13;
  }
  v8 = a3;
  *a4 = 0;
  if ((readPropertyFromMogulService(1, "AppleAuthCPAID", CFSTR("AccessoryCertificate"), &theData) & 1) != 0)
  {
    v12 = 2941;
  }
  else
  {
    if ((readPropertyFromMogulService(1, "AppleAuthCP", CFSTR("AccessoryCertificate"), &theData) & 1) == 0)
    {
      v13 = theData;
      goto LABEL_15;
    }
    v12 = 2945;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "readAccessoryCertificateAuthCP", v12, CFSTR("Successfully read AccessoryCertificate from AppleAuthCP AID service."), v9, v10, v11, (uint64_t)v30);
  v13 = theData;
  if (!theData)
  {
LABEL_15:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]", 3254, CFSTR("Failed to read AccessoryCertificate of mogul based top module"), v9, v10, v11, (uint64_t)v30);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 21, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    *a4 = v21;
    return v13;
  }
  if (v8)
  {
    BytePtr = CFDataGetBytePtr(theData);
    v37[0] = (unint64_t)BytePtr;
    Length = CFDataGetLength(v13);
    v37[1] = Length;
    if (BytePtr && Length)
    {
      v36[0] = 0;
      v36[1] = 0;
      v35[0] = 0;
      v35[1] = 0;
      v33 = 0;
      v34 = 0;
      v32 = 0;
      if (DERDecodeSeqContentInit(v37, v36) || DERDecodeSeqNext(v36, &v32))
      {
        v19 = CFSTR("fail to strip root sequence");
        v20 = 3171;
      }
      else
      {
        if (!DERDecodeSeqContentInit((unint64_t *)&v33, v36))
        {
          if (!DERDecodeSeqNext(v36, &v32))
          {
            v26 = 0;
            v27 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            while (v32 != 0xA000000000000000)
            {
LABEL_38:
              if (DERDecodeSeqNext(v36, &v32))
                goto LABEL_44;
            }
            if (DERDecodeSeqContentInit((unint64_t *)&v33, v35)
              || DERDecodeSeqNext(v35, &v32))
            {
              v28 = CFSTR("fail to decode content");
              v29 = 3191;
            }
            else
            {
              if (!DERDecodeSeqContentInit((unint64_t *)&v33, v35))
              {
                do
                {
                  if (DERDecodeSeqNext(v35, &v32))
                  {
                    if (v26)
                      goto LABEL_38;
                    v19 = CFSTR("did not find plain cert");
                    v20 = 3228;
                    goto LABEL_17;
                  }
                }
                while (v32 != 0xA000000000000000);
                if (!v33 || !v34 || v34 >= 0x7D1)
                {
                  v28 = CFSTR("invalid decoded plain cert: [%p:%zu]");
                  v30 = v33;
                  v29 = 3216;
                  goto LABEL_43;
                }
                v26 = CFDataCreate(v27, v33, v34);
                if (v26)
                  goto LABEL_38;
                v19 = CFSTR("fail to create plain cert");
                v20 = 3221;
                goto LABEL_17;
              }
              v28 = CFSTR("fail to decode SignedData");
              v29 = 3207;
            }
LABEL_43:
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "decodePKCS7TouchScreenCert", v29, v28, v16, v17, v18, (uint64_t)v30);
LABEL_44:
            CFRelease(v13);
            theData = v26;
            v13 = v26;
            if (v26)
              return v13;
            goto LABEL_19;
          }
LABEL_18:
          CFRelease(v13);
          theData = 0;
LABEL_19:
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]", 3264, CFSTR("Failed to decode AccessoryCertificate"), v22, v23, v24, (uint64_t)v30);
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 12, 0);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v13 = 0;
          goto LABEL_20;
        }
        v19 = CFSTR("fail to decode ContentInfo");
        v20 = 3183;
      }
    }
    else
    {
      v19 = CFSTR("null or empty pkcs7 cert content");
      v20 = 3165;
    }
LABEL_17:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "decodePKCS7TouchScreenCert", v20, v19, v16, v17, v18, (uint64_t)v30);
    goto LABEL_18;
  }
  return v13;
}

+ (id)queryMesaSensorIDSensorSNWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t MesaFDRIdentifier;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[3];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  memset(v21, 0, 42);
  v20 = 42;
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3287, CFSTR("error p-pointer is nil!"), v3, v4, v5, v19);
    return 0;
  }
  *a3 = 0;
  MesaFDRIdentifier = getMesaFDRIdentifier((char *)v21, (size_t *)&v20);
  if ((_DWORD)MesaFDRIdentifier)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3295, CFSTR("Failed to get MesaSensorIDSensorSN, returned error 0x%08x"), v8, v9, v10, MesaFDRIdentifier);
LABEL_9:
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 4;
    goto LABEL_10;
  }
  if (v20 != 41)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3300, CFSTR("MesaSensorIDSensorSNBufferSize %zu, should be %d"), v8, v9, v10, v20);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryMesaSensorIDSensorSNWithError:]", 3306, CFSTR("MesaSensorIDSensorSN allocation failed"), v13, v14, v15, v19);
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = 10;
LABEL_10:
    objc_msgSend(v16, "errorWithZhuGeErrorCode:underlyingError:", v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    *a3 = v18;
  }
  return v12;
}

+ (id)queryFactoryShippingSettingTimeWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CFAbsoluteTime v48;
  uint64_t v49;
  id v50;
  CFTypeRef cf;
  unint64_t v52[3];
  _OWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  _OWORD v56[4];
  unint64_t v57[12];
  _BYTE v58[48];
  _QWORD v59[3];
  _QWORD v60[3];
  _BYTE v61[288];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v72 = 0;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  memset(v61, 0, sizeof(v61));
  memset(v58, 0, sizeof(v58));
  memset(v57, 0, sizeof(v57));
  memset(v56, 0, sizeof(v56));
  v54 = 0;
  v55 = 0;
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, sizeof(v52));
  cf = 0;
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3335, CFSTR("error p-pointer is nil!"), v3, v4, v5, v49);
    v10 = 0;
    v8 = 0;
    v9 = 0;
    v20 = 0;
    goto LABEL_21;
  }
  *a3 = 0;
  v59[0] = CFSTR("CopyAllowUnsealed");
  v59[1] = CFSTR("StripImg4");
  v60[0] = MEMORY[0x24BDBD1C8];
  v60[1] = MEMORY[0x24BDBD1C0];
  v59[2] = CFSTR("VerifyData");
  v60[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  getFDRDataByFDRClassWithError(CFSTR("pcrt"), v8, &v50);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v50;
  if (!v9)
  {
    objc_msgSend(a1, "key");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3347, CFSTR("Failed to get pinecrest cert from libFDR for key \"%@\"!"), v22, v23, v24, (uint64_t)v21);

    v25 = objc_retainAutorelease(v10);
LABEL_18:
    v20 = 0;
    *a3 = v25;
    goto LABEL_19;
  }
  v11 = objc_retainAutorelease(v9);
  v13 = Img4DecodeInit(objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), (uint64_t)v61);
  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3355, CFSTR("Img4DecodeInit failed to decode fdrData with der state %@!"), v15, v16, v17, (uint64_t)v14);

    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = 77;
LABEL_17:
    objc_msgSend(v18, "errorWithZhuGeErrorCode:underlyingError:", v19, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v54 = *((_QWORD *)&v62 + 1);
  v55 = v63;
  v26 = DERParseSequence((uint64_t)&v54, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, (unint64_t)v58, 0x30uLL);
  if ((_DWORD)v26)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3363, CFSTR("DERParseSequence failed to decode cert chain with der state %@!"), v28, v29, v30, (uint64_t)v27);
LABEL_16:

    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = 12;
    goto LABEL_17;
  }
  v31 = DERParseSequence((uint64_t)v58, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, (unint64_t)v56, 0xA0uLL);
  if ((_DWORD)v31)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3369, CFSTR("DERParseSequence failed to decode into TBS Cert with der state %@!"), v32, v33, v34, (uint64_t)v27);
    goto LABEL_16;
  }
  v35 = DERParseSequenceContent(v57, (unsigned __int16)DERNumValidityItemSpecs, (uint64_t)&DERValidityItemSpecs, (unint64_t)v53, 0x20uLL);
  if ((_DWORD)v35 || !*((_QWORD *)&v53[0] + 1))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3375, CFSTR("DERParseSequenceContent failed to decode into validity with der state %@!"), v40, v41, v42, (uint64_t)v27);
    goto LABEL_16;
  }
  v36 = DERDecodeItem((uint64_t)v53, v52);
  if ((_DWORD)v36)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3381, CFSTR("DERDecodeItem failed to decode validity notBefore time with der state %@!"), v37, v38, v39, (uint64_t)v27);
    goto LABEL_16;
  }
  SecAbsoluteTimeFromDateContentWithError();
  if (cf)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m", "+[ZhuGeKeysActionArmory queryFactoryShippingSettingTimeWithError:]", 3387, CFSTR("SecAbsoluteTimeFromDateContentWithError failed, error = %@"), v45, v46, v47, (uint64_t)cf);
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = 79;
    goto LABEL_17;
  }
  CFDateCreate(0, v48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
LABEL_21:
  v43 = v20;

  return v43;
}

@end
