@implementation MSDDemoManifestCheck

+ (MSDDemoManifestCheck)sharedInstance
{
  if (qword_100175508 != -1)
    dispatch_once(&qword_100175508, &stru_10013F500);
  return (MSDDemoManifestCheck *)(id)qword_100175500;
}

- (MSDDemoManifestCheck)init
{
  MSDDemoManifestCheck *v2;
  MSDDemoManifestCheck *v3;
  void *v4;
  void *v5;
  WhitelistChecker *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  MSDDemoManifestCheck *v11;
  id v12;
  NSObject *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MSDDemoManifestCheck;
  v2 = -[MSDDemoManifestCheck init](&v15, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedSymLinks](v2, "getAllowedSymLinks"));
  -[MSDDemoManifestCheck setAllowedSymLinks:](v3, "setAllowedSymLinks:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSettingsComponentNames](v3, "getSettingsComponentNames"));
  -[MSDDemoManifestCheck setSettingsComponentNames:](v3, "setSettingsComponentNames:", v5);

  v6 = objc_alloc_init(WhitelistChecker);
  -[MSDDemoManifestCheck setWhitelistChecker:](v3, "setWhitelistChecker:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](v3, "whitelistChecker"));
  v8 = objc_msgSend(v7, "load");

  if ((v8 & 1) == 0)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C69C0();

    goto LABEL_7;
  }
  v10 = (void *)objc_opt_new(NSMutableSet, v9);
  -[MSDDemoManifestCheck setBlocklistedItems:](v3, "setBlocklistedItems:", v10);

  v11 = v3;
LABEL_8:

  return v11;
}

- (MSDDemoManifestCheck)initWithWhiteListChecker:(id)a3 andCheckType:(id)a4
{
  id v6;
  id v7;
  MSDDemoManifestCheck *v8;
  MSDDemoManifestCheck *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSDDemoManifestCheck;
  v8 = -[MSDDemoManifestCheck init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedSymLinks](v8, "getAllowedSymLinks"));
    -[MSDDemoManifestCheck setAllowedSymLinks:](v9, "setAllowedSymLinks:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSettingsComponentNames](v9, "getSettingsComponentNames"));
    -[MSDDemoManifestCheck setSettingsComponentNames:](v9, "setSettingsComponentNames:", v11);

    -[MSDDemoManifestCheck setWhitelistChecker:](v9, "setWhitelistChecker:", v6);
    -[MSDDemoManifestCheck setCheckType:](v9, "setCheckType:", v7);
  }

  return v9;
}

- (id)verifyFactoryManifestSignature:(id)a3 forDataSectionKeys:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v9 = (void *)objc_opt_new(NSMutableDictionary, v8);
  v10 = (void *)MGCopyAnswer(CFSTR("ProductVersion"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Info")));
  v12 = 0;
  if (!v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKey:", CFSTR("MinimumOSVersion")));
  if ((objc_msgSend(v10, "isEqualToString:", v12) & 1) == 0)
    objc_msgSend(v9, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("ExcludeBlocklistItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:](self, "verifyManifestSignature:forDataSectionKeys:withOptions:", v6, v7, v9));

  return v13;
}

- (id)verifyManifestSignature:(id)a3 forDataSectionKeys:(id)a4 withOptions:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  const __CFBoolean *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __SecKey *v32;
  __SecKey *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  int v38;
  uint64_t v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  __SecKey *v52;
  void *v53;
  unsigned __int8 *v54;
  const __CFData *v55;
  __CFString *v56;
  unsigned int v57;
  __CFString *v58;
  MSDDemoManifestCheck *v59;
  int v60;
  id v61;
  NSObject *v62;
  unsigned int v63;
  id v64;
  NSObject *v65;
  id v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  void *i;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  NSObject *v88;
  id v89;
  id v90;
  NSObject *v91;
  void *v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  id v119;
  id v121;
  __CFString *v122;
  void *v123;
  __CFString *v124;
  id v125;
  __CFString *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const __CFBoolean *cf;
  void *v132;
  id v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  uint64_t v139;
  _BOOL4 v140;
  id v141;
  id v142;
  void *v143;
  NSObject *obj;
  id v145;
  void *v146;
  int v147;
  uint64_t v148;
  __CFString *v149;
  MSDDemoManifestCheck *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  CFErrorRef error;
  uint8_t v168[128];
  uint8_t buf[4];
  const char *v170;
  __int16 v171;
  _BYTE v172[10];
  void *v173;
  __int16 v174;
  CFErrorRef v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _QWORD v178[3];
  _QWORD v179[3];
  _BYTE v180[128];

  v142 = a3;
  v137 = a4;
  v8 = a5;
  v145 = objc_alloc_init((Class)NSMutableDictionary);
  error = 0;
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Verifying a separate component manifest.", buf, 0xCu);
  }

  v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("RigorousTestingOverride")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ExcludeBlocklistItem")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v142));
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v13);

  }
  v14 = objc_alloc((Class)NSMutableSet);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "allKeys"));
  v16 = objc_msgSend(v14, "initWithArray:", v15);

  v17 = (const __CFBoolean *)MGCopyAnswer(CFSTR("SigningFuse"), 0);
  cf = v17;
  if (v17)
    v18 = CFBooleanGetValue(v17) != 0;
  else
    v18 = 1;
  v140 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKey:", CFSTR("Certificates")));
  v132 = v19;
  if (!v19)
  {
    v121 = sub_1000604F0();
    obj = objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      sub_1000C69EC();
    v36 = 0;
    v22 = 0;
    v23 = 0;
    v37 = 0;
    v24 = 0;
LABEL_102:

    if (cf)
      CFRelease(cf);
    v118 = 0;
    goto LABEL_112;
  }
  v150 = self;
  v133 = v16;
  v134 = v8;
  v135 = v11;
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  obj = v19;
  v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v163, v180, 16);
  if (!v20)
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_31;
  }
  v21 = v20;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v148 = *(_QWORD *)v164;
  while (2)
  {
    v25 = 0;
    v26 = v23;
    do
    {
      if (*(_QWORD *)v164 != v148)
        objc_enumerationMutation(obj);
      v27 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](obj, "objectForKey:", v27));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("TypeOfSignature")));

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("Certificate")));
      if (!v23)
      {
        v93 = sub_1000604F0();
        v67 = objc_claimAutoreleasedReturnValue(v93);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          sub_1000C6B80();
        v11 = v135;
        v16 = v133;
        v22 = v29;
        goto LABEL_96;
      }
      v22 = v29;
      if (!v29 || (v31 = objc_opt_class(NSArray, v30), (objc_opt_isKindOfClass(v29, v31) & 1) == 0))
      {
        v66 = sub_1000604F0();
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          sub_1000C6BEC(v67, v68, v69, v70, v71, v72, v73, v74);
LABEL_95:
        v11 = v135;
        v16 = v133;
LABEL_96:

        v36 = 0;
        v37 = 0;
        goto LABEL_102;
      }
      if (!objc_msgSend(v29, "count"))
      {
        v94 = sub_1000604F0();
        v67 = objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          sub_1000C6C5C(v67, v95, v96, v97, v98, v99, v100, v101);
        goto LABEL_95;
      }
      if (objc_msgSend(v23, "isEqualToString:", CFSTR("UAT")))
      {
        v32 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigning:](v150, "createPublicKeyForDevelopmentSigning:", v29);
        v24 = CFSTR("Skip");
        if (!v32)
          goto LABEL_93;
LABEL_26:
        v34 = v22;
        goto LABEL_27;
      }
      v33 = -[MSDDemoManifestCheck createPublicKeyForStrongSigning:](v150, "createPublicKeyForStrongSigning:", v29);
      if (!v33)
      {
        v32 = -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:](v150, "createPublicKeyAppleISTSigning:", v29);
        v24 = CFSTR("AppleISTCertCheck");
        if (!v32)
        {
LABEL_93:
          v102 = sub_1000604F0();
          v67 = objc_claimAutoreleasedReturnValue(v102);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            sub_1000C6CCC(v67, v103, v104, v105, v106, v107, v108, v109);
          goto LABEL_95;
        }
        goto LABEL_26;
      }
      v32 = v33;
      v34 = v22;
      if (-[MSDDemoManifestCheck isManualSigning:](v150, "isManualSigning:", v22))
        v24 = CFSTR("Skip");
      else
        v24 = CFSTR("Default");
LABEL_27:
      v178[0] = CFSTR("publicKey");
      v178[1] = CFSTR("TypeOfSignature");
      v179[0] = v32;
      v179[1] = v23;
      v178[2] = CFSTR("RigorousCheckType");
      v179[2] = v24;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v179, v178, 3));
      objc_msgSend(v145, "setObject:forKeyedSubscript:", v35, v27);

      v25 = (char *)v25 + 1;
      v22 = v34;
      v26 = v23;
    }
    while (v21 != v25);
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v163, v180, 16);
    v22 = v34;
    if (v21)
      continue;
    break;
  }
LABEL_31:

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  obj = v137;
  v130 = v22;
  v127 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
  v36 = 0;
  v37 = 0;
  v38 = 0;
  if (v127)
  {
    v128 = *(_QWORD *)v160;
    while (1)
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v160 != v128)
          objc_enumerationMutation(obj);
        v40 = v36;
        v129 = v39;
        v41 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * v39);
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v143 = v41;
        v138 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKey:"));
        v141 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
        if (!v141)
          goto LABEL_50;
        v139 = *(_QWORD *)v156;
        while (2)
        {
          v42 = 0;
          do
          {
            v147 = v38;
            v149 = v24;
            v43 = v37;
            v44 = v23;
            if (*(_QWORD *)v156 != v139)
              objc_enumerationMutation(v138);
            v45 = *(const __CFString **)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)v42);
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "objectForKey:", v143));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", v45));

            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("Certificate")));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "objectForKey:", v47));
            v49 = v48;
            v36 = v40;
            if (!v48)
            {
              v87 = sub_1000604F0();
              v88 = objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                sub_1000C6A44();
LABEL_100:
              v16 = v133;
              v8 = v134;

              v23 = v44;
              v11 = v135;
              v22 = v130;
LABEL_101:
              v24 = v149;
              goto LABEL_102;
            }
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("TypeOfSignature")));

            if ((v140 & objc_msgSend(v50, "isEqualToString:", CFSTR("UAT"))) == 1)
            {
              v110 = sub_1000604F0();
              v88 = objc_claimAutoreleasedReturnValue(v110);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                sub_1000C6AB0(v88, v111, v112, v113, v114, v115, v116, v117);
              goto LABEL_99;
            }
            v51 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](v150, "getComponentData:", v37));

            if (!v51)
            {
              v89 = sub_1000604F0();
              v88 = objc_claimAutoreleasedReturnValue(v89);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                sub_1000C6B20();
              v36 = 0;
LABEL_99:
              v44 = v50;
              goto LABEL_100;
            }
            v52 = (__SecKey *)objc_msgSend(v49, "objectForKey:", CFSTR("publicKey"));
            v53 = v37;
            v40 = (__CFString *)v51;
            v54 = sub_1000526FC((uint64_t)kCFAllocatorDefault, v45, v51);
            v55 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", CFSTR("Signature")));
            LODWORD(v52) = SecKeyVerifySignature(v52, kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1, (CFDataRef)+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v54, 20), v55, &error);
            free(v54);
            v146 = v53;
            if (!(_DWORD)v52)
            {
              v90 = sub_1000604F0();
              v91 = objc_claimAutoreleasedReturnValue(v90);
              v92 = v133;
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
                v171 = 2114;
                *(_QWORD *)v172 = v45;
                *(_WORD *)&v172[8] = 2114;
                v173 = v143;
                v174 = 2114;
                v175 = error;
                _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%s: signature verification failed for %{public}@ in section %{public}@. Error: %{public}@", buf, 0x2Au);
              }

LABEL_87:
              v22 = v130;
              v36 = v40;
              v37 = v146;
              v23 = v50;
              v16 = v92;
              v8 = v134;
              v11 = v135;
              goto LABEL_101;
            }
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", CFSTR("RigorousCheckType")));

            objc_msgSend(v53, "setObject:forKey:", v56, CFSTR("RigorousCheckType"));
            v57 = -[__CFString isEqualToString:](v56, "isEqualToString:", CFSTR("Skip"));
            v58 = v56;
            if (-[__CFString isEqualToString:](v56, "isEqualToString:", CFSTR("AppleISTCertCheck"))
              && objc_msgSend(v143, "isEqualToString:", CFSTR("Apps"))
              && !-[MSDDemoManifestCheck validateISTSignedApp:manifest:](v150, "validateISTSignedApp:manifest:", v45, v142))
            {
              v149 = v56;
              v92 = v133;
              goto LABEL_87;
            }
            v38 = v57 ^ 1 | v147;

            v42 = (char *)v42 + 1;
            v37 = v146;
            v23 = v50;
            v24 = v58;
          }
          while (v141 != v42);
          v141 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v155, v176, 16);
          if (v141)
            continue;
          break;
        }
LABEL_50:

        v22 = v130;
        v39 = v129 + 1;
        v59 = v150;
        v36 = v40;
      }
      while ((id)(v129 + 1) != v127);
      v127 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v159, v177, 16);
      if (!v127)
        goto LABEL_54;
    }
  }
  v59 = v150;
LABEL_54:

  v16 = v133;
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod")
    || !v136
    || (v60 = v38 & 1, v60 == objc_msgSend(v136, "BOOLValue")))
  {
    if ((v38 & 1) == 0)
      goto LABEL_60;
    goto LABEL_66;
  }
  v61 = sub_1000604F0();
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = objc_msgSend(v136, "BOOLValue");
    *(_DWORD *)buf = 136315650;
    v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    v171 = 1024;
    *(_DWORD *)v172 = v60;
    *(_WORD *)&v172[4] = 1024;
    *(_DWORD *)&v172[6] = v63;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%s: Overriding rigorous testing from %{BOOL}d to %{BOOL}d", buf, 0x18u);
  }

  if ((objc_msgSend(v136, "BOOLValue") & 1) != 0)
  {
LABEL_66:
    v8 = v134;
    v11 = v135;
    if (-[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:](v59, "secureManifestCheckForSegmentedManifest:options:", v142, v134))
    {
      goto LABEL_67;
    }
    v122 = v36;
    v123 = v37;
    v124 = v122;
    v125 = sub_1000604F0();
    obj = objc_claimAutoreleasedReturnValue(v125);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      sub_1000C6A18();
    v8 = v134;
    v11 = v135;
    v16 = v133;
    v22 = v130;
    v126 = v124;
    v37 = v123;
    v36 = v126;
    goto LABEL_102;
  }
LABEL_60:
  v64 = sub_1000604F0();
  v65 = objc_claimAutoreleasedReturnValue(v64);
  v11 = v135;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v170 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%s: Skipping rigorous manifest testing.", buf, 0xCu);
  }

  v8 = v134;
LABEL_67:
  if (!objc_msgSend(v11, "BOOLValue"))
    goto LABEL_109;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](v59, "blocklistedItems"));
  v76 = objc_msgSend(v75, "count");

  if (!v76)
  {
    v119 = sub_1000604F0();
    v77 = objc_claimAutoreleasedReturnValue(v119);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "No items blocklisted, skip blocklist item exclusion", buf, 2u);
    }
    goto LABEL_107;
  }
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v77 = v142;
  v78 = -[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
  if (!v78)
  {
LABEL_107:
    v11 = v135;
    goto LABEL_108;
  }
  v80 = v78;
  v81 = v37;
  v82 = *(_QWORD *)v152;
  do
  {
    for (i = 0; i != v80; i = (char *)i + 1)
    {
      if (*(_QWORD *)v152 != v82)
        objc_enumerationMutation(v77);
      v84 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * (_QWORD)i);
      v85 = -[NSObject objectForKey:ofType:](v77, "objectForKey:ofType:", v84, objc_opt_class(NSMutableDictionary, v79));
      v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
      if (v86)
        -[MSDDemoManifestCheck removeBlocklistedItemFromSection:withName:](v150, "removeBlocklistedItemFromSection:withName:", v86, v84);

    }
    v80 = -[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v151, v168, 16);
  }
  while (v80);
  v11 = v135;
  v22 = v130;
  v37 = v81;
  v8 = v134;
  v16 = v133;
LABEL_108:

LABEL_109:
  if (cf)
    CFRelease(cf);
  v118 = v142;
LABEL_112:

  return v118;
}

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3
{
  return -[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:](self, "secureManifestCheckForSegmentedManifest:options:", a3, 0);
}

- (BOOL)checkFileForEntitlements:(id)a3 forCorrespondingManifestEntry:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  unsigned __int8 v37;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;

  v6 = a3;
  v47 = a4;
  v48 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck itemBeingInstalled](self, "itemBeingInstalled"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("TypeOfFiles")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

    v13 = objc_opt_class(NSDictionary, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0)
    {
      v39 = sub_1000604F0();
      v29 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1000C6E90();
      goto LABEL_10;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
    v15 = objc_msgSend(v9, "isEqualToString:", v14);

    if (v15)
    {
      v44 = v9;
      v45 = v8;
      v46 = v6;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Identifier")));
      v16 = objc_msgSend(v43, "rangeValue");
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getInstallationOrder](self, "getInstallationOrder"));
      v20 = v16 + v18;
      v21 = v16 + v18 - 1;
      if ((int)(v16 + v18 - 1) >= 0)
      {
        while (1)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", v21));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupItemName:](self, "getBackupItemName:", v22));

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v23));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("Manifest")));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v25));

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v47));
          if (v27)
            break;

          --v20;
          --v21;
          if (v20 < 1)
            goto LABEL_7;
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("RigorousCheckType")));
        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("Skip"));

        v8 = v45;
        v6 = v46;
        v9 = v44;
        if ((v37 & 1) != 0)
          goto LABEL_20;
LABEL_19:
        if (MISValidateSignatureAndCopyInfo(v6, 0, &v48))
        {
LABEL_20:
          v30 = 1;
          goto LABEL_21;
        }
        v42 = sub_1000604F0();
        v29 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_1000C6D9C(v29);
LABEL_10:

        v30 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_7:

      v8 = v45;
      v6 = v46;
      v9 = v44;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ExtensionData")) & 1) != 0
           || (objc_msgSend(v9, "isEqualToString:", CFSTR("AppData")) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", CFSTR("GroupData")))
    {
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Identifier")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v29));
      v33 = objc_opt_class(NSDictionary, v32);
      if ((objc_opt_isKindOfClass(v31, v33) & 1) == 0)
      {
        v40 = sub_1000604F0();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          sub_1000C6E24();

        goto LABEL_10;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("RigorousCheckType")));
      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("Skip"));

      if ((v35 & 1) != 0)
        goto LABEL_20;
      goto LABEL_19;
    }
    v28 = sub_1000604F0();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1000C6D3C();
    goto LABEL_10;
  }
  v30 = 1;
LABEL_22:

  return v30;
}

- (__SecKey)createPublicKeyForStrongSigning:(id)a3
{
  id v4;
  uint64_t MobileStoreSigner;
  id v6;
  NSObject *v7;
  NSObject *v8;
  __SecKey *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[16];

  v4 = a3;
  MobileStoreSigner = SecPolicyCreateMobileStoreSigner();
  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (MobileStoreSigner)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Verifying strong signing", v18, 2u);
    }

    v9 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](self, "createPublicKey:usingPolicy:anchors:", v4, MobileStoreSigner, 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000C6EFC(v8, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }

  return v9;
}

- (__SecKey)createPublicKeyForDevelopmentSigning:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  __SecKey *v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Verifying development signing", v9, 2u);
  }

  v7 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigningStandard:](self, "createPublicKeyForDevelopmentSigningStandard:", v4);
  return v7;
}

- (__SecKey)createPublicKeyAppleISTSigning:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t DemoDigitalCatalogSigning;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  id v13;
  const UInt8 *v14;
  void *v15;
  const __CFData *v16;
  SecCertificateRef v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  const UInt8 *v27;
  void *v28;
  const __CFData *v29;
  __SecCertificate *v30;
  NSObject *v31;
  const __CFData *v32;
  SecCertificateRef v33;
  void *v34;
  __SecKey *v35;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t buf[8];
  CFStringRef commonName;

  v4 = a3;
  commonName = 0;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Verifying AppleIST certificate\n", buf, 2u);
  }

  DemoDigitalCatalogSigning = SecPolicyCreateDemoDigitalCatalogSigning();
  if (!DemoDigitalCatalogSigning)
  {
    v37 = sub_1000604F0();
    v31 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1000C6F6C(v31, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_24;
  }
  v8 = DemoDigitalCatalogSigning;
  if (objc_msgSend(v4, "count") != (id)2)
  {
    v45 = sub_1000604F0();
    v31 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1000C71DC();
    goto LABEL_24;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  v11 = objc_opt_class(NSData, v10);
  isKindOfClass = objc_opt_isKindOfClass(v9, v11);

  if ((isKindOfClass & 1) == 0)
  {
    v19 = 0;
    goto LABEL_21;
  }
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0)));
  v14 = (const UInt8 *)objc_msgSend(v13, "bytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  v16 = CFDataCreate(kCFAllocatorDefault, v14, (CFIndex)objc_msgSend(v15, "length"));

  if (!v16)
  {
    v46 = sub_1000604F0();
    v31 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1000C6FDC();
LABEL_24:
    v19 = 0;
LABEL_36:
    v34 = 0;
    v35 = 0;
    goto LABEL_14;
  }
  v17 = SecCertificateCreateWithData(kCFAllocatorDefault, v16);
  v18 = SecCertificateCopyOrganizationalUnit(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", 0));
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("1.2.840.113635.100.6.60"));

  if ((v21 & 1) == 0)
  {
    v47 = sub_1000604F0();
    v31 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1000C717C();
    goto LABEL_36;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1));
  v24 = objc_opt_class(NSData, v23);
  v25 = objc_opt_isKindOfClass(v22, v24);

  if ((v25 & 1) == 0)
  {
LABEL_21:
    v34 = 0;
    v35 = 0;
    goto LABEL_15;
  }
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1)));
  v27 = (const UInt8 *)objc_msgSend(v26, "bytes");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1));
  v29 = CFDataCreate(kCFAllocatorDefault, v27, (CFIndex)objc_msgSend(v28, "length"));

  if (!v29)
  {
    v48 = sub_1000604F0();
    v31 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1000C7008();
    goto LABEL_36;
  }
  v30 = SecCertificateCreateWithData(kCFAllocatorDefault, v29);
  SecCertificateCopyCommonName(v30, &commonName);
  v31 = (id)commonName;
  if ((-[NSObject isEqualToString:](v31, "isEqualToString:", CFSTR("DemoUnit CA")) & 1) == 0)
  {
    v49 = sub_1000604F0();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_1000C7114((uint64_t)&commonName, v50, v51, v52, v53, v54, v55, v56);
    goto LABEL_35;
  }
  v32 = CFDataCreate(kCFAllocatorDefault, byte_100174928, dword_100174CB0);
  if (!v32)
  {
    v57 = sub_1000604F0();
    v50 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_1000C7034(v50, v58, v59, v60, v61, v62, v63, v64);
    goto LABEL_35;
  }
  v33 = SecCertificateCreateWithData(kCFAllocatorDefault, v32);
  if (!v33)
  {
    v65 = sub_1000604F0();
    v50 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_1000C70A4(v50, v66, v67, v68, v69, v70, v71, v72);
LABEL_35:

    goto LABEL_36;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v33, 0));
  v35 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](self, "createPublicKey:usingPolicy:anchors:", v4, v8, v34);
LABEL_14:

LABEL_15:
  return v35;
}

- (__SecKey)createPublicKeyForDevelopmentSigningStandard:(id)a3
{
  id v4;
  uint64_t TestMobileStoreSigner;
  __SecKey *v6;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  TestMobileStoreSigner = SecPolicyCreateTestMobileStoreSigner();
  if (TestMobileStoreSigner)
  {
    v6 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](self, "createPublicKey:usingPolicy:anchors:", v4, TestMobileStoreSigner, 0);
  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000C7208(v9, v10, v11, v12, v13, v14, v15, v16);

    v6 = 0;
  }

  return v6;
}

- (__SecKey)createPublicKey:(id)a3 usingPolicy:(__SecPolicy *)a4 anchors:(id)a5
{
  id v7;
  const __CFArray *v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  __SecKey *v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  SecTrustResultType result;
  SecTrustRef trust;

  v7 = a3;
  v8 = (const __CFArray *)a5;
  trust = 0;
  result = kSecTrustResultInvalid;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100088CA8;
  v32 = sub_100088CB8;
  v33 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v10 = (void *)v29[5];
  v29[5] = v9;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100088CC0;
  v27[3] = &unk_10013F528;
  v27[4] = &v28;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);
  v11 = (const void *)v29[5];
  if (!v11)
  {
LABEL_14:
    v12 = 0;
    if (!a4)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (SecTrustCreateWithCertificates(v11, a4, &trust))
  {
    v16 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C7438();
    goto LABEL_13;
  }
  if (v8 && SecTrustSetAnchorCertificates(trust, v8))
  {
    v26 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C73C8();
    goto LABEL_13;
  }
  if (SecTrustEvaluate(trust, &result))
  {
    v17 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C7358();
    goto LABEL_13;
  }
  if (result != kSecTrustResultProceed && result != kSecTrustResultUnspecified)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C7278();
    goto LABEL_13;
  }
  v12 = SecTrustCopyPublicKey(trust);
  if (!v12)
  {
    v18 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C72E8(v14, v19, v20, v21, v22, v23, v24, v25);
LABEL_13:

    goto LABEL_14;
  }
  if (a4)
LABEL_15:
    CFRelease(a4);
LABEL_16:
  if (trust)
  {
    CFRelease(trust);
    trust = 0;
  }
  _Block_object_dispose(&v28, 8);

  return v12;
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 withKey:(__SecKey *)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  unsigned __int8 *v11;
  id v12;
  id v13;
  CC_LONG v14;
  id v15;
  const uint8_t *v16;
  id v17;
  OSStatus v18;
  id v20;
  NSObject *v21;

  v7 = a4;
  v8 = a3;
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1000C759C();

  v11 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x871388B4uLL);
  v12 = objc_retainAutorelease(v7);
  v13 = objc_msgSend(v12, "bytes");
  v14 = objc_msgSend(v12, "length");

  CC_SHA1(v13, v14, v11);
  v15 = objc_retainAutorelease(v8);
  v16 = (const uint8_t *)objc_msgSend(v15, "bytes");
  v17 = objc_msgSend(v15, "length");

  v18 = SecKeyRawVerify(a5, 0x8002u, v11, 0x14uLL, v16, (size_t)v17);
  free(v11);
  if (v18)
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_1000C7518(v18, v21);

  }
  return v18 == 0;
}

- (BOOL)isManualSigning:(id)a3
{
  uint64_t v3;
  const __CFData *v4;
  uint64_t v5;
  __SecCertificate *v6;
  __SecCertificate *v7;
  __CFString *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint8_t v31[16];
  uint8_t buf[8];
  CFStringRef commonName;

  commonName = 0;
  v4 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", 0));
  if (!v4 || (v5 = objc_opt_class(NSData, v3), (objc_opt_isKindOfClass(v4, v5) & 1) == 0))
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C75D4(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_12;
  }
  v6 = SecCertificateCreateWithData(kCFAllocatorDefault, v4);
  if (!v6)
  {
    v21 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C7644(v13, v22, v23, v24, v25, v26, v27, v28);
LABEL_12:

    v8 = 0;
    goto LABEL_13;
  }
  v7 = v6;
  SecCertificateCopyCommonName(v6, &commonName);
  CFRelease(v7);
  v8 = (__CFString *)commonName;
  if (-[__CFString isEqualToString:]((id)commonName, "isEqualToString:", CFSTR("Demo Content Signing")))
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "A certificate for manual signing is used.", buf, 2u);
    }
    v11 = 1;
    goto LABEL_16;
  }
LABEL_13:
  v29 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "A certificate for non-manual signing is used.", v31, 2u);
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)validateISTSignedApp:(id)a3 manifest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKey:", CFSTR("Apps")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Manifest")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Info")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("AppType")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Dependencies")));
  v12 = v11;
  if (!v11
    || objc_msgSend(v11, "count") == (id)1
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("ProvisioningProfiles"))),
        v13,
        v13))
  {
    v14 = 1;
  }
  else
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C76B4();

    v14 = 0;
  }

  return v14;
}

- (BOOL)secureManifestCheckForSegmentedManifest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C76E0(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v6));
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v9);

  }
  -[MSDDemoManifestCheck setSegmentedManifestWithRigorousFlag:](self, "setSegmentedManifestWithRigorousFlag:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Version")));
  -[MSDDemoManifestCheck setManifestVersion:](self, "setManifestVersion:", objc_msgSend(v10, "unsignedIntValue"));

  if (!-[MSDDemoManifestCheck runSecurityCheck:](self, "runSecurityCheck:", v7))
  {
    v22 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C7750(v14, v23, v24, v25, v26, v27, v28, v29);
LABEL_11:

    v11 = 0;
    goto LABEL_6;
  }
  -[MSDDemoManifestCheck registerEntitlementNotificationHandler](self, "registerEntitlementNotificationHandler");
  v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)runSecurityCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  BOOL v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  MSDDemoManifestCheck *v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  const char *v39;

  v4 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getSecurityCheckSectionNames](self, "getSecurityCheckSectionNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getappIconLayoutBackupName](self, "getappIconLayoutBackupName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting rigorous security checks", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100089530;
  v27[3] = &unk_10013F578;
  v11 = v5;
  v28 = v11;
  v29 = self;
  v33 = &v34;
  v12 = v4;
  v30 = v12;
  v13 = v6;
  v31 = v13;
  v14 = v7;
  v32 = v14;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v27);

  if (*((_BYTE *)v35 + 24))
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[MSDDemoManifestCheck runSecurityCheck:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:Cleared all checks for manifest. Approving future installations", buf, 0xCu);
    }
  }
  else
  {
    v19 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C77C0(v16, v20, v21, v22, v23, v24, v25, v26);
  }

  v17 = *((_BYTE *)v35 + 24) != 0;
  _Block_object_dispose(&v34, 8);

  return v17;
}

- (BOOL)runSecurityChecksForSection:(id)a3 dataType:(id)a4 componentName:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  unsigned __int8 v16;
  BOOL v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck settingsComponentNames](self, "settingsComponentNames"));
  v15 = objc_msgSend(v14, "containsObject:", v11);

  if (v15)
    v16 = -[MSDDemoManifestCheck runSettingsSecurityCheckForSection:component:](self, "runSettingsSecurityCheckForSection:component:", v13, v11);
  else
    v16 = -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:](self, "runFileSecurityChecksForSection:dataType:options:", v13, v10, v12);
  v17 = v16;

  return v17;
}

- (BOOL)runSettingsSecurityCheckForSection:(id)a3 component:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  id v14;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("locale")))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Data")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("language")));

    if (!v8)
    {
      v16 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000C7928();
      goto LABEL_17;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("region")));

    if (!v9)
    {
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000C7994();
LABEL_17:

LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("display")))
    {
      v14 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000C7A6C();
      goto LABEL_11;
    }
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Data")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("HDR")));

    if (!v12)
    {
      v17 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000C7A00();
      goto LABEL_17;
    }
  }

  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4
{
  return -[MSDDemoManifestCheck runFileSecurityChecksForSection:dataType:options:](self, "runFileSecurityChecksForSection:dataType:options:", a3, a4, 0);
}

- (BOOL)runFileSecurityChecksForSection:(id)a3 dataType:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  unsigned __int8 v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *i;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  MSDDemoManifestCheck *v60;
  uint64_t v61;
  void *j;
  void *v63;
  unsigned __int16 v64;
  void *v65;
  unsigned __int8 v66;
  id v67;
  int v68;
  void *v69;
  id v70;
  NSObject *v71;
  BOOL v72;
  id v73;
  NSObject *v74;
  id v75;
  id v76;
  id v77;
  id v79;
  id v80;
  NSObject *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  void *context;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  id obj;
  id obja;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("ExcludeBlocklistItem")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  LODWORD(a4) = objc_msgSend(v12, "macOS");

  if ((_DWORD)a4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Data")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "checkManifest:", v13));

    if (objc_msgSend(v11, "BOOLValue"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
      objc_msgSend(v16, "addObjectsFromArray:", v15);

    }
    else if (v15)
    {
      v79 = sub_1000604F0();
      v28 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1000C7B2C();
      v34 = 4;
LABEL_67:

      if (v34 == 4)
        goto LABEL_83;
      v72 = 1;
      goto LABEL_85;
    }
    v83 = v10;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v23 = v13;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
    if (v24)
    {
      v25 = v24;
      v99 = v15;
      v101 = v13;
      obj = v8;
      v86 = v11;
      v88 = v9;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = *(_QWORD *)v118;
      while (2)
      {
        v30 = 0;
        v31 = v26;
        v32 = v27;
        v33 = v28;
        do
        {
          if (*(_QWORD *)v118 != v29)
            objc_enumerationMutation(v23);
          v27 = *(id *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)v30);

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v27));
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "valueForKey:", CFSTR("MSDManifestFileAttributes")));

          if (!v28)
          {
            v70 = sub_1000604F0();
            v71 = objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              sub_1000C7ACC();

            v28 = 0;
            v34 = 4;
            goto LABEL_65;
          }
          v30 = (char *)v30 + 1;
          v31 = v26;
          v32 = v27;
          v33 = v28;
        }
        while (v25 != v30);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
        if (v25)
          continue;
        break;
      }
      v34 = 0;
LABEL_65:
      v11 = v86;
      v8 = obj;
      v15 = v99;

      v9 = v88;
      v13 = v101;
    }
    else
    {
      v34 = 0;
      v26 = 0;
      v28 = 0;
    }

    v10 = v83;
    goto LABEL_67;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10014E5E8));
  v18 = objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v8));

  v90 = (void *)v18;
  v85 = v11;
  if (objc_msgSend(v9, "isEqualToString:", v18))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "checkManifest:", v19));

    if (objc_msgSend(v11, "BOOLValue"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
      objc_msgSend(v22, "addObjectsFromArray:", v21);

    }
    else if (v21)
    {
      v91 = v21;
      v80 = sub_1000604F0();
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        sub_1000C7B2C();

      v35 = 0;
      v69 = 0;
      v44 = 0;
      v68 = 4;
      goto LABEL_61;
    }

  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v91 = v19;
  v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
  if (!v93)
  {
    v35 = 0;
    v69 = 0;
    v44 = 0;
    v68 = 0;
LABEL_61:
    v38 = v90;
    goto LABEL_81;
  }
  v82 = v19;
  v84 = v10;
  v35 = 0;
  v36 = 0;
  v98 = 0;
  v92 = *(_QWORD *)v114;
  v38 = v90;
  v37 = v91;
  v87 = v17;
  v89 = v9;
  while (2)
  {
    v39 = 0;
    v40 = v36;
    v41 = v98;
    do
    {
      if (*(_QWORD *)v114 != v92)
      {
        v42 = v39;
        objc_enumerationMutation(v37);
        v39 = v42;
      }
      v94 = v39;
      v43 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v39);
      context = objc_autoreleasePoolPush();
      v102 = v43;
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", v43));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "valueForKey:", CFSTR("MSDManifestFileAttributes")));

      if (!v44)
      {
        v73 = sub_1000604F0();
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          sub_1000C7ACC();
        v19 = v82;
        goto LABEL_80;
      }
      v45 = objc_msgSend(v17, "containsObject:", v9);
      v98 = v44;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "valueForKey:", CFSTR("NSFileType")));

      v96 = v46;
      v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("NSFileTypeRegular"));
      if (v45)
      {
        if (((v47 & 1) != 0
           || (objc_msgSend(v46, "isEqualToString:", CFSTR("NSFileTypeDirectory")) & 1) != 0)
          && !-[MSDDemoManifestCheck isValidDataContainerFile:](self, "isValidDataContainerFile:", v102))
        {
          goto LABEL_77;
        }
      }
      else if ((v47 & 1) == 0
             && (objc_msgSend(v46, "isEqualToString:", CFSTR("NSFileTypeDirectory")) & 1) == 0)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "valueForKey:", CFSTR("MSDManifestSymbolicLinkTargetFile")));

        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        obja = (id)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks"));
        v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        if (!v49)
        {

          v35 = v48;
          v38 = v90;
LABEL_77:
          v77 = sub_1000604F0();
          v74 = objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v40 = v96;
            sub_1000C7C2C();
            goto LABEL_79;
          }
LABEL_78:
          v40 = v96;
LABEL_79:
          v19 = v82;
          v44 = v98;
LABEL_80:

          objc_autoreleasePoolPop(context);
          v68 = 4;
          v69 = v40;
          v10 = v84;
          goto LABEL_81;
        }
        v50 = v49;
        v100 = 0;
        v51 = *(_QWORD *)v110;
        v52 = v102;
        do
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(_QWORD *)v110 != v51)
              objc_enumerationMutation(obja);
            v54 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v52, "rangeOfString:", v54) != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", v54));

              v107 = 0u;
              v108 = 0u;
              v105 = 0u;
              v106 = 0u;
              v57 = v56;
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
              if (v58)
              {
                v59 = v58;
                v60 = self;
                v61 = *(_QWORD *)v106;
                while (2)
                {
                  for (j = 0; j != v59; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v106 != v61)
                      objc_enumerationMutation(v57);
                    if (objc_msgSend(v48, "rangeOfString:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)j)) != (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      v100 = 1;
                      goto LABEL_49;
                    }
                  }
                  v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
                  if (v59)
                    continue;
                  break;
                }
LABEL_49:
                self = v60;
                v52 = v102;
              }

            }
          }
          v50 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        }
        while (v50);

        v35 = v48;
        v17 = v87;
        v9 = v89;
        v38 = v90;
        v37 = v91;
        if ((v100 & 1) == 0)
          goto LABEL_77;
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "valueForKey:", CFSTR("NSFilePosixPermissions")));
      v64 = (unsigned __int16)objc_msgSend(v63, "longValue");

      if ((v64 & 0xC00) != 0)
      {
        v75 = sub_1000604F0();
        v74 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          sub_1000C7BB8();
        goto LABEL_78;
      }
      if (objc_msgSend(v9, "isEqualToString:", v38))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
        v66 = objc_msgSend(v65, "handleSystemContainerFiles:withMetadata:", v102, v97);

        if ((v66 & 1) == 0)
        {
          v76 = sub_1000604F0();
          v74 = objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            sub_1000C7B58();
          goto LABEL_78;
        }
      }

      objc_autoreleasePoolPop(context);
      v39 = v94 + 1;
      v40 = v96;
      v41 = v98;
    }
    while ((id)(v94 + 1) != v93);
    v67 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
    v36 = v96;
    v93 = v67;
    if (v67)
      continue;
    break;
  }
  v68 = 0;
  v19 = v82;
  v10 = v84;
  v44 = v98;
  v69 = v96;
LABEL_81:

  if (v68 == 4)
  {
    v8 = v19;
    v11 = v85;
LABEL_83:
    v72 = 0;
  }
  else
  {
    v72 = 1;
    v8 = v19;
    v11 = v85;
  }
LABEL_85:

  return v72;
}

- (BOOL)runAppLayoutSecurityCheck:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  _UNKNOWN **v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  __int128 v18;
  id v19;
  _UNKNOWN **v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  const char *v55;
  uint32_t v56;
  id v57;
  NSObject *v58;
  const char *v59;
  uint32_t v60;
  id v61;
  NSObject *v62;
  const char *v63;
  uint32_t v64;
  id v65;
  NSObject *v66;
  const char *v67;
  uint32_t v68;
  id v69;
  NSObject *v70;
  NSObject *v71;
  const char *v72;
  id v73;
  NSObject *v74;
  const char *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  BOOL v83;
  BOOL v84;
  id v86;
  id v87;
  NSObject *v88;
  __int128 v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  _BYTE v104[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v8 = objc_msgSend(v7, "macOS");

  if (v8)
  {
    objc_msgSend(v5, "addObject:", &off_10014DAD8);
    objc_msgSend(v6, "addObject:", CFSTR("staff"));
    v9 = &off_10014E600;
LABEL_7:
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    goto LABEL_8;
  }
  objc_msgSend(v5, "addObject:", &off_10014DAF0);
  objc_msgSend(v5, "addObject:", &off_10014DB08);
  objc_msgSend(v6, "addObject:", CFSTR("mobile"));
  objc_msgSend(v6, "addObject:", CFSTR("wheel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v11 = objc_msgSend(v10, "iOS");

  if (v11)
  {
    v9 = &off_10014E618;
    goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v13 = objc_msgSend(v12, "tvOS");

  if (v13)
  {
    v9 = &off_10014E630;
    goto LABEL_7;
  }
  v14 = objc_alloc_init((Class)NSSet);
LABEL_8:
  v93 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v4));

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v17)
  {
    v19 = v17;
    v20 = &AATermsEntryDevice_ptr;
    v95 = *(_QWORD *)v97;
    *(_QWORD *)&v18 = 134218242;
    v89 = v18;
    v91 = v16;
    v90 = v5;
    v94 = v6;
    do
    {
      v21 = 0;
      v92 = v19;
      do
      {
        if (*(_QWORD *)v97 != v95)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v22, v89));
        if (!v24 || (v25 = objc_opt_class(v20[274], v23), (objc_opt_isKindOfClass(v24, v25) & 1) == 0))
        {
          v86 = sub_1000604F0();
          v27 = objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_1000C7CA0();
          goto LABEL_106;
        }
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("MSDManifestSymbolicLinkTargetFile")));
        if (v27)
        {
          v28 = objc_opt_class(NSString, v26);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0
            || (-[NSObject isEqualToString:](v27, "isEqualToString:", &stru_100141020) & 1) == 0)
          {
            v87 = sub_1000604F0();
            v88 = objc_claimAutoreleasedReturnValue(v87);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              sub_1000C7D00();

LABEL_106:
            v35 = 6;
            goto LABEL_93;
          }
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("MSDManifestFileAttributes")));
        if (v30)
        {
          v31 = objc_opt_class(v20[274], v29);
          if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
          {
            v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("NSFileType")));
            if (v33 && (v34 = objc_opt_class(NSString, v32), (objc_opt_isKindOfClass(v33, v34) & 1) != 0))
            {
              if ((-[NSObject isEqualToString:](v33, "isEqualToString:", CFSTR("NSFileTypeDirectory")) & 1) != 0)
              {
                v35 = 3;
                goto LABEL_46;
              }
              if ((-[NSObject isEqualToString:](v33, "isEqualToString:", CFSTR("NSFileTypeRegular")) & 1) != 0)
              {
                if ((objc_msgSend(v93, "containsObject:", v22) & 1) != 0)
                {
                  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", NSFileOwnerAccountID));
                  if (v37
                    && (v38 = objc_opt_class(NSNumber, v36), (objc_opt_isKindOfClass(v37, v38) & 1) != 0))
                  {
                    if (-[NSObject integerValue](v37, "integerValue") == (id)501)
                    {
                      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", NSFileGroupOwnerAccountID));

                      if (v39
                        && (v41 = objc_opt_class(NSNumber, v40),
                            (objc_opt_isKindOfClass(v39, v41) & 1) != 0))
                      {
                        v6 = v94;
                        if ((objc_msgSend(v5, "containsObject:", v39) & 1) != 0)
                        {
                          v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", NSFileOwnerAccountName));
                          if (v43
                            && (v44 = objc_opt_class(NSString, v42),
                                (objc_opt_isKindOfClass(v43, v44) & 1) != 0))
                          {
                            if ((-[NSObject isEqualToString:](v43, "isEqualToString:", CFSTR("mobile")) & 1) != 0)
                            {
                              v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", NSFileGroupOwnerAccountName));

                              if (v45
                                && (v47 = objc_opt_class(NSString, v46),
                                    (objc_opt_isKindOfClass(v45, v47) & 1) != 0))
                              {
                                v5 = v90;
                                if ((objc_msgSend(v94, "containsObject:", v45) & 1) != 0)
                                {
                                  v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", NSFilePosixPermissions));
                                  if (v49
                                    && (v50 = objc_opt_class(NSNumber, v48),
                                        (objc_opt_isKindOfClass(v49, v50) & 1) != 0))
                                  {
                                    if (((unint64_t)-[NSObject integerValue](v49, "integerValue") & 0xC00) == 0)
                                    {
                                      v35 = 1;
                                      goto LABEL_42;
                                    }
                                    v81 = sub_1000604F0();
                                    v70 = objc_claimAutoreleasedReturnValue(v81);
                                    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                                    {
LABEL_77:

                                      v35 = 6;
LABEL_78:
                                      v5 = v90;
LABEL_42:

LABEL_43:
                                      v6 = v94;
LABEL_44:

                                      v16 = v91;
LABEL_45:

                                      v19 = v92;
                                      goto LABEL_46;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    v101 = v22;
                                    v71 = v70;
                                    v72 = "IS&T signed component contains setuid item: %{public}@";
                                  }
                                  else
                                  {
                                    v69 = sub_1000604F0();
                                    v70 = objc_claimAutoreleasedReturnValue(v69);
                                    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                                      goto LABEL_77;
                                    *(_DWORD *)buf = 138543362;
                                    v101 = v22;
                                    v71 = v70;
                                    v72 = "IS&T signed component in wrong format (permission) for %{public}@";
                                  }
                                  _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, v72, buf, 0xCu);
                                  goto LABEL_77;
                                }
                                v80 = sub_1000604F0();
                                v49 = objc_claimAutoreleasedReturnValue(v80);
                                if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                                {
LABEL_75:
                                  v35 = 6;
                                  goto LABEL_42;
                                }
                                *(_DWORD *)buf = 138543618;
                                v101 = (uint64_t)v94;
                                v102 = 2114;
                                v103 = v22;
                                v66 = v49;
                                v67 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                                v68 = 22;
                              }
                              else
                              {
                                v65 = sub_1000604F0();
                                v49 = objc_claimAutoreleasedReturnValue(v65);
                                v5 = v90;
                                if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                                  goto LABEL_75;
                                *(_DWORD *)buf = 138543362;
                                v101 = v22;
                                v66 = v49;
                                v67 = "IS&T signed component in wrong format (onwer name) for %{public}@";
                                v68 = 12;
                              }
                              _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v67, buf, v68);
                              goto LABEL_75;
                            }
                            v79 = sub_1000604F0();
                            v49 = objc_claimAutoreleasedReturnValue(v79);
                            if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                            {
LABEL_73:
                              v35 = 6;
                              v45 = v43;
                              goto LABEL_78;
                            }
                            *(_DWORD *)buf = 138543618;
                            v101 = (uint64_t)CFSTR("mobile");
                            v102 = 2114;
                            v103 = v22;
                            v62 = v49;
                            v63 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                            v64 = 22;
                          }
                          else
                          {
                            v61 = sub_1000604F0();
                            v49 = objc_claimAutoreleasedReturnValue(v61);
                            if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                              goto LABEL_73;
                            *(_DWORD *)buf = 138543362;
                            v101 = v22;
                            v62 = v49;
                            v63 = "IS&T signed component in wrong format (owner name) for %{public}@";
                            v64 = 12;
                          }
                          _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, v63, buf, v64);
                          goto LABEL_73;
                        }
                        v78 = sub_1000604F0();
                        v45 = objc_claimAutoreleasedReturnValue(v78);
                        if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                        {
LABEL_71:
                          v35 = 6;
                          goto LABEL_44;
                        }
                        *(_DWORD *)buf = 138543618;
                        v101 = (uint64_t)v5;
                        v102 = 2114;
                        v103 = v22;
                        v58 = v45;
                        v59 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                        v60 = 22;
                      }
                      else
                      {
                        v57 = sub_1000604F0();
                        v45 = objc_claimAutoreleasedReturnValue(v57);
                        v6 = v94;
                        if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                          goto LABEL_71;
                        *(_DWORD *)buf = 138543362;
                        v101 = v22;
                        v58 = v45;
                        v59 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                        v60 = 12;
                      }
                      _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, v59, buf, v60);
                      goto LABEL_71;
                    }
                    v77 = sub_1000604F0();
                    v45 = objc_claimAutoreleasedReturnValue(v77);
                    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:
                      v35 = 6;
                      v39 = v37;
                      goto LABEL_43;
                    }
                    *(_DWORD *)buf = v89;
                    v101 = 501;
                    v102 = 2114;
                    v103 = v22;
                    v54 = v45;
                    v55 = "IS&T signed component can only contain %ld owned file - %{public}@";
                    v56 = 22;
                  }
                  else
                  {
                    v53 = sub_1000604F0();
                    v45 = objc_claimAutoreleasedReturnValue(v53);
                    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                      goto LABEL_69;
                    *(_DWORD *)buf = 138543362;
                    v101 = v22;
                    v54 = v45;
                    v55 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                    v56 = 12;
                  }
                  _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v55, buf, v56);
                  goto LABEL_69;
                }
                v76 = sub_1000604F0();
                v39 = objc_claimAutoreleasedReturnValue(v76);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v101 = v22;
                  v74 = v39;
                  v75 = "%{public}@ is not allowed in IS&T signed component.";
                  goto LABEL_80;
                }
              }
              else
              {
                v73 = sub_1000604F0();
                v39 = objc_claimAutoreleasedReturnValue(v73);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v101 = v22;
                  v74 = v39;
                  v75 = "IS&T signed component can only contain regular files - %{public}@";
                  goto LABEL_80;
                }
              }
            }
            else
            {
              v52 = sub_1000604F0();
              v39 = objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v101 = v22;
                v74 = v39;
                v75 = "IS&T signed component in wrong format (file type) for %{public}@";
LABEL_80:
                _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, v75, buf, 0xCu);
              }
            }
            v35 = 6;
            goto LABEL_45;
          }
        }
        v51 = sub_1000604F0();
        v33 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v101 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "IS&T signed component in wrong format (no file attributes) for %{public}@", buf, 0xCu);
        }
        v35 = 6;
LABEL_46:

        if (v35 != 3)
          goto LABEL_93;
        v21 = (char *)v21 + 1;
        v20 = &AATermsEntryDevice_ptr;
      }
      while (v19 != v21);
      v82 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
      v19 = v82;
    }
    while (v82);
  }
  v35 = 0;
LABEL_93:

  if (v35)
    v83 = v35 == 6;
  else
    v83 = 1;
  v84 = !v83;

  return v84;
}

- (void)registerEntitlementNotificationHandler
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008B098;
  v5[3] = &unk_10013D8D8;
  v5[4] = self;
  v4 = objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("CheckEntitlementsNotify"), 0, 0, v5);

}

- (id)getSecurityCheckSectionNames
{
  void *v2;
  unsigned int v3;
  _UNKNOWN **v4;

  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
    v3 = objc_msgSend(v2, "macOS");

    if (v3)
      v4 = &off_10014E648;
    else
      v4 = &off_10014E660;
  }
  else
  {
    v4 = &off_10014E678;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
}

- (id)getManifestData:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;

  v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    v6 = objc_msgSend(v4, "objectForKey:ofType:", CFSTR("Data"), objc_opt_class(NSDictionary, v5));
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (id)getComponentData:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  v4 = CFSTR("Manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Manifest")));

  if (v5
    || (v4 = CFSTR("Settings"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Settings"))),
        v7,
        v7))
  {
    v8 = objc_msgSend(v3, "objectForKey:ofType:", v4, objc_opt_class(NSDictionary, v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)getBackupSectionName
{
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
    return CFSTR("BackupData");
  else
    return CFSTR("Backup");
}

- (id)getappIconLayoutBackupName
{
  void *v2;
  unsigned int v3;

  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") != 7)
    return CFSTR("backup.Merge.AppIconLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v3 = objc_msgSend(v2, "macOS");

  if (v3)
    return CFSTR("dockLayout");
  else
    return CFSTR("appIconLayout");
}

- (id)getInstallationOrder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("InstallationOrder")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("CriticalComponents")));
    if (v6)
      objc_msgSend(v3, "addObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Components")));
    if (v7)
      objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("InstallationOrder")));
  }

  return v3;
}

- (id)getBackupItemName:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("/BackupData/"), "length")));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (BOOL)isValidDataContainerFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int v7;
  void *v8;
  unsigned int v9;
  int v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v17;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathComponents"));
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(".."));

        if (v9)
        {
          if (!v7)
          {
            v14 = sub_1000604F0();
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              sub_1000C7DC0();
            goto LABEL_12;
          }
          v10 = -1;
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("."));

          v10 = v12 ^ 1;
        }
        v7 += v10;
        ++v6;
      }
      while ((unint64_t)objc_msgSend(v5, "count") > v6);
    }
    v13 = 1;
  }
  else
  {
    v17 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000C7D60();
LABEL_12:

    v13 = 0;
  }

  return v13;
}

- (id)getAllowedSymLinks
{
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  if (objc_msgSend(v3, "iOS"))
  {

LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10014E690));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.carrier"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator_1.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator_2.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator.merged.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("/var/db/timezone/zoneinfo")));
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("/var/db/timezone/localtime"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10014E6A8));
    objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("/var/mobile/Media/Books"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("/var/mobile/Library/Shortcuts/ToolKit")));
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("/var/mobile/Library/Shortcuts/ToolKit/Tools-active"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("Binaries/0/Debug-xros")));
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("/var/mobile/XcodeBuiltProducts/PressDemoScripts.xctestproducts/Tests/0/Debug-xros"));

    v11 = objc_alloc_init((Class)NSMutableSet);
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Containers/Data/Application/"));
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Containers/Shared/AppGroup/"));
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Containers/Shared/Extension/"));
    objc_msgSend(v11, "addObject:", CFSTR("/var/mobile/Library/Cookies"));
    objc_msgSend(v11, "addObject:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.PeoplePicker.plist"));
    objc_msgSend(v11, "addObject:", CFSTR("/private/var/mobile/Library/Preferences/.GlobalPreferences.plist"));
    objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("/var/mobile/Containers/"));

    return v2;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v5 = objc_msgSend(v4, "rOS");

  if (v5)
    goto LABEL_4;
  return v2;
}

- (id)getAllowedISTSignedComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("BackupData"), CFSTR("appIconLayout")));
  v12[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("BackupData"), CFSTR("dockLayout")));
  v12[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedISTSignedComponentsFromManifest:](self, "getAllowedISTSignedComponentsFromManifest:", v4));
  objc_msgSend(v5, "addObjectsFromArray:", v8);
  objc_msgSend(v5, "addObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v5));

  return v10;
}

- (id)getAllowedISTSignedComponentsFromManifest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v4, "addObject:", CFSTR("com.retailtech.arkenstone"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.DigitalCatalog"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.demoloop"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.windward"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.DemoDiscoveryApp"));
  objc_msgSend(v4, "addObject:", CFSTR("com.apple.ist.DigitalSignage.iOS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = v3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Apps")));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(obj);
        v29 = v6;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v6)));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Manifest")));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Dependencies")));

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v38;
          v30 = *(_QWORD *)v38;
          v31 = v10;
          do
          {
            v14 = 0;
            v32 = v12;
            do
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14);
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ProvisioningProfiles")) & 1) == 0)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15));
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                v36 = 0u;
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v34;
                  do
                  {
                    for (i = 0; i != v18; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v34 != v19)
                        objc_enumerationMutation(v16);
                      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v15, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i)));
                      objc_msgSend(v5, "addObject:", v21);

                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                  }
                  while (v18);
                }

                v13 = v30;
                v10 = v31;
                v12 = v32;
              }
              v14 = (char *)v14 + 1;
            }
            while (v14 != v12);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v12);
        }

        v6 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v28);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  return v22;
}

- (id)getSettingsComponentNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10014E6C0);
}

- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *i;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *k;
  uint64_t v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  MSDDemoManifestCheck *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  id v68;
  __int16 v69;
  uint64_t v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v6 = a3;
  v7 = a4;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v62;
    v12 = &AATermsEntryDevice_ptr;
    v40 = self;
    v41 = v6;
    v38 = *(_QWORD *)v62;
    v39 = v7;
    do
    {
      v13 = 0;
      v42 = v10;
      do
      {
        if (*(_QWORD *)v62 != v11)
          objc_enumerationMutation(v6);
        v46 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v13);
        v14 = objc_msgSend(v6, "objectForKey:ofType:", v46, objc_opt_class(v12[291], v9));
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](self, "getComponentData:", v15));
          if (v16)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v16));
            if (v18)
            {
              v43 = v16;
              v44 = v15;
              v45 = v13;
              v19 = (void *)objc_opt_new(NSMutableArray, v17);
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              obj = (id)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
              v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
              if (v20)
              {
                v21 = v20;
                v48 = *(_QWORD *)v58;
                do
                {
                  for (i = 0; i != v21; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v58 != v48)
                      objc_enumerationMutation(obj);
                    v23 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
                    v53 = 0u;
                    v54 = 0u;
                    v55 = 0u;
                    v56 = 0u;
                    v24 = v18;
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
                    if (v25)
                    {
                      v26 = v25;
                      v27 = *(_QWORD *)v54;
                      do
                      {
                        for (j = 0; j != v26; j = (char *)j + 1)
                        {
                          if (*(_QWORD *)v54 != v27)
                            objc_enumerationMutation(v24);
                          v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
                          if ((objc_msgSend(v29, "isEqualToString:", v23, v38) & 1) != 0
                            || objc_msgSend(v29, "hasPrefix:", v23))
                          {
                            objc_msgSend(v19, "addObject:", v29);
                          }
                        }
                        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
                      }
                      while (v26);
                    }

                  }
                  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
                }
                while (v21);
              }

              v51 = 0u;
              v52 = 0u;
              v49 = 0u;
              v50 = 0u;
              v30 = v19;
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
              v7 = v39;
              if (v31)
              {
                v32 = v31;
                v33 = *(_QWORD *)v50;
                do
                {
                  for (k = 0; k != v32; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v50 != v33)
                      objc_enumerationMutation(v30);
                    v35 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)k);
                    v36 = sub_1000604F0();
                    v37 = objc_claimAutoreleasedReturnValue(v36);
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      v66 = v35;
                      v67 = 2114;
                      v68 = v39;
                      v69 = 2114;
                      v70 = v46;
                      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Excluding %{public}@ from section: %{public}@ component:%{public}@", buf, 0x20u);
                    }

                    objc_msgSend(v18, "removeObjectForKey:", v35);
                  }
                  v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
                }
                while (v32);
              }

              self = v40;
              v6 = v41;
              v11 = v38;
              v12 = &AATermsEntryDevice_ptr;
              v10 = v42;
              v16 = v43;
              v15 = v44;
              v13 = v45;
            }

          }
        }

        v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v10);
  }

}

- (unsigned)manifestVersion
{
  return self->_manifestVersion;
}

- (void)setManifestVersion:(unsigned int)a3
{
  self->_manifestVersion = a3;
}

- (NSDictionary)segmentedManifestWithRigorousFlag
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSegmentedManifestWithRigorousFlag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)allowedSymLinks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllowedSymLinks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSSet)allowedISTSignedComponents
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllowedISTSignedComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (WhitelistChecker)whitelistChecker
{
  return (WhitelistChecker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWhitelistChecker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)itemBeingInstalled
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setItemBeingInstalled:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)checkType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCheckType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)settingsComponentNames
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSettingsComponentNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableSet)blocklistedItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBlocklistedItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocklistedItems, 0);
  objc_storeStrong((id *)&self->_settingsComponentNames, 0);
  objc_storeStrong((id *)&self->_checkType, 0);
  objc_storeStrong((id *)&self->_itemBeingInstalled, 0);
  objc_storeStrong((id *)&self->_whitelistChecker, 0);
  objc_storeStrong((id *)&self->_allowedISTSignedComponents, 0);
  objc_storeStrong((id *)&self->_allowedSymLinks, 0);
  objc_storeStrong((id *)&self->_segmentedManifestWithRigorousFlag, 0);
}

@end
