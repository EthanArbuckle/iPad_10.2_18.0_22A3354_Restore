@implementation MSDDemoManifestCheck

+ (MSDDemoManifestCheck)sharedInstance
{
  if (qword_100053DB8 != -1)
    dispatch_once(&qword_100053DB8, &stru_100048CE8);
  return (MSDDemoManifestCheck *)(id)qword_100053DB0;
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
  NSMutableSet *v9;
  MSDDemoManifestCheck *v10;
  id v11;
  NSObject *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MSDDemoManifestCheck;
  v2 = -[MSDDemoManifestCheck init](&v14, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_7:
    v10 = 0;
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
    v11 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002AE14();

    goto LABEL_7;
  }
  v9 = objc_opt_new(NSMutableSet);
  -[MSDDemoManifestCheck setBlocklistedItems:](v3, "setBlocklistedItems:", v9);

  v10 = v3;
LABEL_8:

  return v10;
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
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)MGCopyAnswer(CFSTR("ProductVersion"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Info")));
  v11 = 0;
  if (!v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKey:", CFSTR("MinimumOSVersion")));
  if ((objc_msgSend(v9, "isEqualToString:", v11) & 1) == 0)
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("ExcludeBlocklistItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:](self, "verifyManifestSignature:forDataSectionKeys:withOptions:", v6, v7, v8));

  return v12;
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
  __SecKey *v31;
  __SecKey *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  int v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  __SecKey *v51;
  void *v52;
  unsigned __int8 *v53;
  const __CFData *v54;
  __CFString *v55;
  unsigned int v56;
  __CFString *v57;
  MSDDemoManifestCheck *v58;
  int v59;
  id v60;
  NSObject *v61;
  unsigned int v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  NSObject *v76;
  id v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *i;
  uint64_t v82;
  id v83;
  void *v84;
  id v85;
  NSObject *v86;
  id v87;
  id v88;
  NSObject *v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  id v117;
  id v119;
  __CFString *v120;
  void *v121;
  __CFString *v122;
  id v123;
  __CFString *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const __CFBoolean *cf;
  void *v130;
  id v131;
  id v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  uint64_t v137;
  _BOOL4 v138;
  id v139;
  id v140;
  void *v141;
  NSObject *obj;
  id v143;
  void *v144;
  int v145;
  uint64_t v146;
  __CFString *v147;
  MSDDemoManifestCheck *v148;
  __int128 v149;
  __int128 v150;
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
  CFErrorRef error;
  uint8_t v166[128];
  uint8_t buf[4];
  const char *v168;
  __int16 v169;
  _BYTE v170[10];
  void *v171;
  __int16 v172;
  CFErrorRef v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _QWORD v176[3];
  _QWORD v177[3];
  _BYTE v178[128];

  v140 = a3;
  v135 = a4;
  v8 = a5;
  v143 = objc_alloc_init((Class)NSMutableDictionary);
  error = 0;
  v9 = sub_100024A40();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Verifying a separate component manifest.", buf, 0xCu);
  }

  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("RigorousTestingOverride")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ExcludeBlocklistItem")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedISTSignedComponents](self, "allowedISTSignedComponents"));

  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getAllowedISTSignedComponents:](self, "getAllowedISTSignedComponents:", v140));
    -[MSDDemoManifestCheck setAllowedISTSignedComponents:](self, "setAllowedISTSignedComponents:", v13);

  }
  v14 = objc_alloc((Class)NSMutableSet);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "allKeys"));
  v16 = objc_msgSend(v14, "initWithArray:", v15);

  v17 = (const __CFBoolean *)MGCopyAnswer(CFSTR("SigningFuse"), 0);
  cf = v17;
  if (v17)
    v18 = CFBooleanGetValue(v17) != 0;
  else
    v18 = 1;
  v138 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:", CFSTR("Certificates")));
  v130 = v19;
  if (!v19)
  {
    v119 = sub_100024A40();
    obj = objc_claimAutoreleasedReturnValue(v119);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      sub_10002AE40();
    v35 = 0;
    v22 = 0;
    v23 = 0;
    v36 = 0;
    v24 = 0;
LABEL_102:

    if (cf)
      CFRelease(cf);
    v116 = 0;
    goto LABEL_112;
  }
  v148 = self;
  v131 = v16;
  v132 = v8;
  v133 = v11;
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  obj = v19;
  v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
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
  v146 = *(_QWORD *)v162;
  while (2)
  {
    v25 = 0;
    v26 = v23;
    do
    {
      if (*(_QWORD *)v162 != v146)
        objc_enumerationMutation(obj);
      v27 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](obj, "objectForKey:", v27));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("TypeOfSignature")));

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", CFSTR("Certificate")));
      if (!v23)
      {
        v91 = sub_100024A40();
        v66 = objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          sub_10002AFD4();
        v11 = v133;
        v16 = v131;
        v22 = v29;
        goto LABEL_96;
      }
      v22 = v29;
      if (!v29 || (v30 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v29, v30) & 1) == 0))
      {
        v65 = sub_100024A40();
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          sub_10002B040(v66, v67, v68, v69, v70, v71, v72, v73);
LABEL_95:
        v11 = v133;
        v16 = v131;
LABEL_96:

        v35 = 0;
        v36 = 0;
        goto LABEL_102;
      }
      if (!objc_msgSend(v29, "count"))
      {
        v92 = sub_100024A40();
        v66 = objc_claimAutoreleasedReturnValue(v92);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          sub_10002B0B0(v66, v93, v94, v95, v96, v97, v98, v99);
        goto LABEL_95;
      }
      if (objc_msgSend(v23, "isEqualToString:", CFSTR("UAT")))
      {
        v31 = -[MSDDemoManifestCheck createPublicKeyForDevelopmentSigning:](v148, "createPublicKeyForDevelopmentSigning:", v29);
        v24 = CFSTR("Skip");
        if (!v31)
          goto LABEL_93;
LABEL_26:
        v33 = v22;
        goto LABEL_27;
      }
      v32 = -[MSDDemoManifestCheck createPublicKeyForStrongSigning:](v148, "createPublicKeyForStrongSigning:", v29);
      if (!v32)
      {
        v31 = -[MSDDemoManifestCheck createPublicKeyAppleISTSigning:](v148, "createPublicKeyAppleISTSigning:", v29);
        v24 = CFSTR("AppleISTCertCheck");
        if (!v31)
        {
LABEL_93:
          v100 = sub_100024A40();
          v66 = objc_claimAutoreleasedReturnValue(v100);
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            sub_10002B120(v66, v101, v102, v103, v104, v105, v106, v107);
          goto LABEL_95;
        }
        goto LABEL_26;
      }
      v31 = v32;
      v33 = v22;
      if (-[MSDDemoManifestCheck isManualSigning:](v148, "isManualSigning:", v22))
        v24 = CFSTR("Skip");
      else
        v24 = CFSTR("Default");
LABEL_27:
      v176[0] = CFSTR("publicKey");
      v176[1] = CFSTR("TypeOfSignature");
      v177[0] = v31;
      v177[1] = v23;
      v176[2] = CFSTR("RigorousCheckType");
      v177[2] = v24;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v177, v176, 3));
      objc_msgSend(v143, "setObject:forKeyedSubscript:", v34, v27);

      v25 = (char *)v25 + 1;
      v22 = v33;
      v26 = v23;
    }
    while (v21 != v25);
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v161, v178, 16);
    v22 = v33;
    if (v21)
      continue;
    break;
  }
LABEL_31:

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  obj = v135;
  v128 = v22;
  v125 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v157, v175, 16);
  v35 = 0;
  v36 = 0;
  v37 = 0;
  if (v125)
  {
    v126 = *(_QWORD *)v158;
    while (1)
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v158 != v126)
          objc_enumerationMutation(obj);
        v39 = v35;
        v127 = v38;
        v40 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v38);
        v153 = 0u;
        v154 = 0u;
        v155 = 0u;
        v156 = 0u;
        v141 = v40;
        v136 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:"));
        v139 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
        if (!v139)
          goto LABEL_50;
        v137 = *(_QWORD *)v154;
        while (2)
        {
          v41 = 0;
          do
          {
            v145 = v37;
            v147 = v24;
            v42 = v36;
            v43 = v23;
            if (*(_QWORD *)v154 != v137)
              objc_enumerationMutation(v136);
            v44 = *(const __CFString **)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)v41);
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:", v141));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKey:", v44));

            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("Certificate")));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "objectForKey:", v46));
            v48 = v47;
            v35 = v39;
            if (!v47)
            {
              v85 = sub_100024A40();
              v86 = objc_claimAutoreleasedReturnValue(v85);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                sub_10002AE98();
LABEL_100:
              v16 = v131;
              v8 = v132;

              v23 = v43;
              v11 = v133;
              v22 = v128;
LABEL_101:
              v24 = v147;
              goto LABEL_102;
            }
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKey:", CFSTR("TypeOfSignature")));

            if ((v138 & objc_msgSend(v49, "isEqualToString:", CFSTR("UAT"))) == 1)
            {
              v108 = sub_100024A40();
              v86 = objc_claimAutoreleasedReturnValue(v108);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                sub_10002AF04(v86, v109, v110, v111, v112, v113, v114, v115);
              goto LABEL_99;
            }
            v50 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](v148, "getComponentData:", v36));

            if (!v50)
            {
              v87 = sub_100024A40();
              v86 = objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                sub_10002AF74();
              v35 = 0;
LABEL_99:
              v43 = v49;
              goto LABEL_100;
            }
            v51 = (__SecKey *)objc_msgSend(v48, "objectForKey:", CFSTR("publicKey"));
            v52 = v36;
            v39 = (__CFString *)v50;
            v53 = sub_100007E98((uint64_t)kCFAllocatorDefault, v44, v50);
            v54 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("Signature")));
            LODWORD(v51) = SecKeyVerifySignature(v51, kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1, (CFDataRef)+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v53, 20), v54, &error);
            free(v53);
            v144 = v52;
            if (!(_DWORD)v51)
            {
              v88 = sub_100024A40();
              v89 = objc_claimAutoreleasedReturnValue(v88);
              v90 = v131;
              if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
                v169 = 2114;
                *(_QWORD *)v170 = v44;
                *(_WORD *)&v170[8] = 2114;
                v171 = v141;
                v172 = 2114;
                v173 = error;
                _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "%s: signature verification failed for %{public}@ in section %{public}@. Error: %{public}@", buf, 0x2Au);
              }

LABEL_87:
              v22 = v128;
              v35 = v39;
              v36 = v144;
              v23 = v49;
              v16 = v90;
              v8 = v132;
              v11 = v133;
              goto LABEL_101;
            }
            v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKey:", CFSTR("RigorousCheckType")));

            objc_msgSend(v52, "setObject:forKey:", v55, CFSTR("RigorousCheckType"));
            v56 = -[__CFString isEqualToString:](v55, "isEqualToString:", CFSTR("Skip"));
            v57 = v55;
            if (-[__CFString isEqualToString:](v55, "isEqualToString:", CFSTR("AppleISTCertCheck"))
              && objc_msgSend(v141, "isEqualToString:", CFSTR("Apps"))
              && !-[MSDDemoManifestCheck validateISTSignedApp:manifest:](v148, "validateISTSignedApp:manifest:", v44, v140))
            {
              v147 = v55;
              v90 = v131;
              goto LABEL_87;
            }
            v37 = v56 ^ 1 | v145;

            v41 = (char *)v41 + 1;
            v36 = v144;
            v23 = v49;
            v24 = v57;
          }
          while (v139 != v41);
          v139 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
          if (v139)
            continue;
          break;
        }
LABEL_50:

        v22 = v128;
        v38 = v127 + 1;
        v58 = v148;
        v35 = v39;
      }
      while ((id)(v127 + 1) != v125);
      v125 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v157, v175, 16);
      if (!v125)
        goto LABEL_54;
    }
  }
  v58 = v148;
LABEL_54:

  v16 = v131;
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod")
    || !v134
    || (v59 = v37 & 1, v59 == objc_msgSend(v134, "BOOLValue")))
  {
    if ((v37 & 1) == 0)
      goto LABEL_60;
    goto LABEL_66;
  }
  v60 = sub_100024A40();
  v61 = objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = objc_msgSend(v134, "BOOLValue");
    *(_DWORD *)buf = 136315650;
    v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    v169 = 1024;
    *(_DWORD *)v170 = v59;
    *(_WORD *)&v170[4] = 1024;
    *(_DWORD *)&v170[6] = v62;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%s: Overriding rigorous testing from %{BOOL}d to %{BOOL}d", buf, 0x18u);
  }

  if ((objc_msgSend(v134, "BOOLValue") & 1) != 0)
  {
LABEL_66:
    v8 = v132;
    v11 = v133;
    if (-[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:](v58, "secureManifestCheckForSegmentedManifest:options:", v140, v132))
    {
      goto LABEL_67;
    }
    v120 = v35;
    v121 = v36;
    v122 = v120;
    v123 = sub_100024A40();
    obj = objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      sub_10002AE6C();
    v8 = v132;
    v11 = v133;
    v16 = v131;
    v22 = v128;
    v124 = v122;
    v36 = v121;
    v35 = v124;
    goto LABEL_102;
  }
LABEL_60:
  v63 = sub_100024A40();
  v64 = objc_claimAutoreleasedReturnValue(v63);
  v11 = v133;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%s: Skipping rigorous manifest testing.", buf, 0xCu);
  }

  v8 = v132;
LABEL_67:
  if (!objc_msgSend(v11, "BOOLValue"))
    goto LABEL_109;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](v58, "blocklistedItems"));
  v75 = objc_msgSend(v74, "count");

  if (!v75)
  {
    v117 = sub_100024A40();
    v76 = objc_claimAutoreleasedReturnValue(v117);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "No items blocklisted, skip blocklist item exclusion", buf, 2u);
    }
    goto LABEL_107;
  }
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v76 = v140;
  v77 = -[NSObject countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
  if (!v77)
  {
LABEL_107:
    v11 = v133;
    goto LABEL_108;
  }
  v78 = v77;
  v79 = v36;
  v80 = *(_QWORD *)v150;
  do
  {
    for (i = 0; i != v78; i = (char *)i + 1)
    {
      if (*(_QWORD *)v150 != v80)
        objc_enumerationMutation(v76);
      v82 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)i);
      v83 = -[NSObject objectForKey:ofType:](v76, "objectForKey:ofType:", v82, objc_opt_class(NSMutableDictionary));
      v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
      if (v84)
        -[MSDDemoManifestCheck removeBlocklistedItemFromSection:withName:](v148, "removeBlocklistedItemFromSection:withName:", v84, v82);

    }
    v78 = -[NSObject countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
  }
  while (v78);
  v11 = v133;
  v22 = v128;
  v36 = v79;
  v8 = v132;
  v16 = v131;
LABEL_108:

LABEL_109:
  if (cf)
    CFRelease(cf);
  v116 = v140;
LABEL_112:

  return v116;
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
  void *v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  unsigned __int8 v35;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;

  v6 = a3;
  v45 = a4;
  v46 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck itemBeingInstalled](self, "itemBeingInstalled"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("TypeOfFiles")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v9));

    v12 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
    {
      v37 = sub_100024A40();
      v28 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_10002B2E4();
      goto LABEL_10;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupSectionName](self, "getBackupSectionName"));
    v14 = objc_msgSend(v9, "isEqualToString:", v13);

    if (v14)
    {
      v42 = v9;
      v43 = v8;
      v44 = v6;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Identifier")));
      v15 = objc_msgSend(v41, "rangeValue");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getInstallationOrder](self, "getInstallationOrder"));
      v19 = v15 + v17;
      v20 = v15 + v17 - 1;
      if ((int)(v15 + v17 - 1) >= 0)
      {
        while (1)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", v20));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getBackupItemName:](self, "getBackupItemName:", v21));

          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("Manifest")));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v24));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v45));
          if (v26)
            break;

          --v19;
          --v20;
          if (v19 < 1)
            goto LABEL_7;
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("RigorousCheckType")));
        v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("Skip"));

        v8 = v43;
        v6 = v44;
        v9 = v42;
        if ((v35 & 1) != 0)
          goto LABEL_20;
LABEL_19:
        if (MISValidateSignatureAndCopyInfo(v6, 0, &v46))
        {
LABEL_20:
          v29 = 1;
          goto LABEL_21;
        }
        v40 = sub_100024A40();
        v28 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_10002B1F0(v28);
LABEL_10:

        v29 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_7:

      v8 = v43;
      v6 = v44;
      v9 = v42;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ExtensionData")) & 1) != 0
           || (objc_msgSend(v9, "isEqualToString:", CFSTR("AppData")) & 1) != 0
           || objc_msgSend(v9, "isEqualToString:", CFSTR("GroupData")))
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Identifier")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v28));
      v31 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v30, v31) & 1) == 0)
      {
        v38 = sub_100024A40();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_10002B278();

        goto LABEL_10;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("RigorousCheckType")));
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("Skip"));

      if ((v33 & 1) != 0)
        goto LABEL_20;
      goto LABEL_19;
    }
    v27 = sub_100024A40();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_10002B190();
    goto LABEL_10;
  }
  v29 = 1;
LABEL_22:

  return v29;
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
  v6 = sub_100024A40();
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
      sub_10002B350(v8, v11, v12, v13, v14, v15, v16, v17);

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
  v5 = sub_100024A40();
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
  char isKindOfClass;
  id v12;
  const UInt8 *v13;
  void *v14;
  const __CFData *v15;
  SecCertificateRef v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  uint64_t v22;
  char v23;
  id v24;
  const UInt8 *v25;
  void *v26;
  const __CFData *v27;
  __SecCertificate *v28;
  NSObject *v29;
  const __CFData *v30;
  SecCertificateRef v31;
  void *v32;
  __SecKey *v33;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t buf[8];
  CFStringRef commonName;

  v4 = a3;
  commonName = 0;
  v5 = sub_100024A40();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Verifying AppleIST certificate\n", buf, 2u);
  }

  DemoDigitalCatalogSigning = SecPolicyCreateDemoDigitalCatalogSigning();
  if (!DemoDigitalCatalogSigning)
  {
    v35 = sub_100024A40();
    v29 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10002B3C0(v29, v36, v37, v38, v39, v40, v41, v42);
    goto LABEL_24;
  }
  v8 = DemoDigitalCatalogSigning;
  if (objc_msgSend(v4, "count") != (id)2)
  {
    v43 = sub_100024A40();
    v29 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10002B630();
    goto LABEL_24;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  v10 = objc_opt_class(NSData);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) == 0)
  {
    v18 = 0;
    goto LABEL_21;
  }
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0)));
  v13 = (const UInt8 *)objc_msgSend(v12, "bytes");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  v15 = CFDataCreate(kCFAllocatorDefault, v13, (CFIndex)objc_msgSend(v14, "length"));

  if (!v15)
  {
    v44 = sub_100024A40();
    v29 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10002B430();
LABEL_24:
    v18 = 0;
LABEL_36:
    v32 = 0;
    v33 = 0;
    goto LABEL_14;
  }
  v16 = SecCertificateCreateWithData(kCFAllocatorDefault, v15);
  v17 = SecCertificateCopyOrganizationalUnit(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", 0));
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("1.2.840.113635.100.6.60"));

  if ((v20 & 1) == 0)
  {
    v45 = sub_100024A40();
    v29 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10002B5D0();
    goto LABEL_36;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1));
  v22 = objc_opt_class(NSData);
  v23 = objc_opt_isKindOfClass(v21, v22);

  if ((v23 & 1) == 0)
  {
LABEL_21:
    v32 = 0;
    v33 = 0;
    goto LABEL_15;
  }
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1)));
  v25 = (const UInt8 *)objc_msgSend(v24, "bytes");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 1));
  v27 = CFDataCreate(kCFAllocatorDefault, v25, (CFIndex)objc_msgSend(v26, "length"));

  if (!v27)
  {
    v46 = sub_100024A40();
    v29 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10002B45C();
    goto LABEL_36;
  }
  v28 = SecCertificateCreateWithData(kCFAllocatorDefault, v27);
  SecCertificateCopyCommonName(v28, &commonName);
  v29 = (id)commonName;
  if ((-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("DemoUnit CA")) & 1) == 0)
  {
    v47 = sub_100024A40();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_10002B568((uint64_t)&commonName, v48, v49, v50, v51, v52, v53, v54);
    goto LABEL_35;
  }
  v30 = CFDataCreate(kCFAllocatorDefault, byte_1000539F8, dword_100053D80);
  if (!v30)
  {
    v55 = sub_100024A40();
    v48 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_10002B488(v48, v56, v57, v58, v59, v60, v61, v62);
    goto LABEL_35;
  }
  v31 = SecCertificateCreateWithData(kCFAllocatorDefault, v30);
  if (!v31)
  {
    v63 = sub_100024A40();
    v48 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_10002B4F8(v48, v64, v65, v66, v67, v68, v69, v70);
LABEL_35:

    goto LABEL_36;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v31, 0));
  v33 = -[MSDDemoManifestCheck createPublicKey:usingPolicy:anchors:](self, "createPublicKey:usingPolicy:anchors:", v4, v8, v32);
LABEL_14:

LABEL_15:
  return v33;
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
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10002B65C(v9, v10, v11, v12, v13, v14, v15, v16);

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
  v31 = sub_10001133C;
  v32 = sub_10001134C;
  v33 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v10 = (void *)v29[5];
  v29[5] = v9;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100011354;
  v27[3] = &unk_100048D10;
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
    v16 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002B88C();
    goto LABEL_13;
  }
  if (v8 && SecTrustSetAnchorCertificates(trust, v8))
  {
    v26 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002B81C();
    goto LABEL_13;
  }
  if (SecTrustEvaluate(trust, &result))
  {
    v17 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002B7AC();
    goto LABEL_13;
  }
  if (result != kSecTrustResultProceed && result != kSecTrustResultUnspecified)
  {
    v13 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002B6CC();
    goto LABEL_13;
  }
  v12 = SecTrustCopyPublicKey(trust);
  if (!v12)
  {
    v18 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002B73C(v14, v19, v20, v21, v22, v23, v24, v25);
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
  v9 = sub_100024A40();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10002B9F0();

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
    v20 = sub_100024A40();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      sub_10002B96C(v18, v21);

  }
  return v18 == 0;
}

- (BOOL)isManualSigning:(id)a3
{
  const __CFData *v3;
  uint64_t v4;
  __SecCertificate *v5;
  __SecCertificate *v6;
  __CFString *v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint8_t v30[16];
  uint8_t buf[8];
  CFStringRef commonName;

  commonName = 0;
  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectAtIndexedSubscript:", 0));
  if (!v3 || (v4 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v3, v4) & 1) == 0))
  {
    v11 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002BA28(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_12;
  }
  v5 = SecCertificateCreateWithData(kCFAllocatorDefault, v3);
  if (!v5)
  {
    v20 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002BA98(v12, v21, v22, v23, v24, v25, v26, v27);
LABEL_12:

    v7 = 0;
    goto LABEL_13;
  }
  v6 = v5;
  SecCertificateCopyCommonName(v5, &commonName);
  CFRelease(v6);
  v7 = (__CFString *)commonName;
  if (-[__CFString isEqualToString:]((id)commonName, "isEqualToString:", CFSTR("Demo Content Signing")))
  {
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "A certificate for manual signing is used.", buf, 2u);
    }
    v10 = 1;
    goto LABEL_16;
  }
LABEL_13:
  v28 = sub_100024A40();
  v9 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "A certificate for non-manual signing is used.", v30, 2u);
  }
  v10 = 0;
LABEL_16:

  return v10;
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
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002BB08();

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
    v13 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002BB34(v14, v15, v16, v17, v18, v19, v20, v21);
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
    v22 = sub_100024A40();
    v14 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10002BBA4(v14, v23, v24, v25, v26, v27, v28, v29);
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
  v8 = sub_100024A40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting rigorous security checks", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck segmentedManifestWithRigorousFlag](self, "segmentedManifestWithRigorousFlag"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100011BC4;
  v27[3] = &unk_100048D60;
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
    v15 = sub_100024A40();
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
    v19 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002BC14(v16, v20, v21, v22, v23, v24, v25, v26);
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
      v16 = sub_100024A40();
      v11 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10002BD7C();
      goto LABEL_17;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("region")));

    if (!v9)
    {
      v10 = sub_100024A40();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10002BDE8();
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
      v14 = sub_100024A40();
      v7 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10002BEC0();
      goto LABEL_11;
    }
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Data")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v7, "objectForKey:", CFSTR("HDR")));

    if (!v12)
    {
      v17 = sub_100024A40();
      v11 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10002BE54();
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
      v79 = sub_100024A40();
      v28 = objc_claimAutoreleasedReturnValue(v79);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_10002BF80();
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
            v70 = sub_100024A40();
            v71 = objc_claimAutoreleasedReturnValue(v70);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              sub_10002BF20();

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
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10004DEF8));
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
      v80 = sub_100024A40();
      v81 = objc_claimAutoreleasedReturnValue(v80);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        sub_10002BF80();

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
        v73 = sub_100024A40();
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          sub_10002BF20();
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
          v77 = sub_100024A40();
          v74 = objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v40 = v96;
            sub_10002C080();
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
        v75 = sub_100024A40();
        v74 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          sub_10002C00C();
        goto LABEL_78;
      }
      if (objc_msgSend(v9, "isEqualToString:", v38))
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
        v66 = objc_msgSend(v65, "handleSystemContainerFiles:withMetadata:", v102, v97);

        if ((v66 & 1) == 0)
        {
          v76 = sub_100024A40();
          v74 = objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            sub_10002BFAC();
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
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  const char *v46;
  uint32_t v47;
  id v48;
  NSObject *v49;
  const char *v50;
  uint32_t v51;
  id v52;
  NSObject *v53;
  const char *v54;
  uint32_t v55;
  id v56;
  NSObject *v57;
  const char *v58;
  uint32_t v59;
  id v60;
  NSObject *v61;
  NSObject *v62;
  const char *v63;
  id v64;
  NSObject *v65;
  const char *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  BOOL v74;
  BOOL v75;
  id v77;
  id v78;
  NSObject *v79;
  __int128 v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  _BYTE v95[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v8 = objc_msgSend(v7, "macOS");

  if (v8)
  {
    objc_msgSend(v5, "addObject:", &off_10004E0F0);
    objc_msgSend(v6, "addObject:", CFSTR("staff"));
    v9 = &off_10004DF10;
LABEL_7:
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    goto LABEL_8;
  }
  objc_msgSend(v5, "addObject:", &off_10004E108);
  objc_msgSend(v5, "addObject:", &off_10004E120);
  objc_msgSend(v6, "addObject:", CFSTR("mobile"));
  objc_msgSend(v6, "addObject:", CFSTR("wheel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v11 = objc_msgSend(v10, "iOS");

  if (v11)
  {
    v9 = &off_10004DF28;
    goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance"));
  v13 = objc_msgSend(v12, "tvOS");

  if (v13)
  {
    v9 = &off_10004DF40;
    goto LABEL_7;
  }
  v14 = objc_alloc_init((Class)NSSet);
LABEL_8:
  v84 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v4));

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (v17)
  {
    v19 = v17;
    v20 = &APFSContainerGetSpaceInfo_ptr;
    v86 = *(_QWORD *)v88;
    *(_QWORD *)&v18 = 134218242;
    v80 = v18;
    v82 = v16;
    v81 = v5;
    v85 = v6;
    do
    {
      v21 = 0;
      v83 = v19;
      do
      {
        if (*(_QWORD *)v88 != v86)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", v22, v80));
        if (!v23 || (v24 = objc_opt_class(v20[99]), (objc_opt_isKindOfClass(v23, v24) & 1) == 0))
        {
          v77 = sub_100024A40();
          v25 = objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            sub_10002C0F4();
          goto LABEL_106;
        }
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("MSDManifestSymbolicLinkTargetFile")));
        if (v25)
        {
          v26 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0
            || (-[NSObject isEqualToString:](v25, "isEqualToString:", &stru_100049858) & 1) == 0)
          {
            v78 = sub_100024A40();
            v79 = objc_claimAutoreleasedReturnValue(v78);
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              sub_10002C154();

LABEL_106:
            v31 = 6;
            goto LABEL_93;
          }
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", CFSTR("MSDManifestFileAttributes")));
        if (v27)
        {
          v28 = objc_opt_class(v20[99]);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
          {
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("NSFileType")));
            if (v29 && (v30 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v29, v30) & 1) != 0))
            {
              if ((-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("NSFileTypeDirectory")) & 1) != 0)
              {
                v31 = 3;
                goto LABEL_46;
              }
              if ((-[NSObject isEqualToString:](v29, "isEqualToString:", CFSTR("NSFileTypeRegular")) & 1) != 0)
              {
                if ((objc_msgSend(v84, "containsObject:", v22) & 1) != 0)
                {
                  v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFileOwnerAccountID));
                  if (v32
                    && (v33 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v32, v33) & 1) != 0))
                  {
                    if (-[NSObject integerValue](v32, "integerValue") == (id)501)
                    {
                      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFileGroupOwnerAccountID));

                      if (v34
                        && (v35 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v34, v35) & 1) != 0))
                      {
                        v6 = v85;
                        if ((objc_msgSend(v5, "containsObject:", v34) & 1) != 0)
                        {
                          v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFileOwnerAccountName));
                          if (v36
                            && (v37 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v36, v37) & 1) != 0))
                          {
                            if ((-[NSObject isEqualToString:](v36, "isEqualToString:", CFSTR("mobile")) & 1) != 0)
                            {
                              v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFileGroupOwnerAccountName));

                              if (v38
                                && (v39 = objc_opt_class(NSString),
                                    (objc_opt_isKindOfClass(v38, v39) & 1) != 0))
                              {
                                v5 = v81;
                                if ((objc_msgSend(v85, "containsObject:", v38) & 1) != 0)
                                {
                                  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", NSFilePosixPermissions));
                                  if (v40
                                    && (v41 = objc_opt_class(NSNumber),
                                        (objc_opt_isKindOfClass(v40, v41) & 1) != 0))
                                  {
                                    if (((unint64_t)-[NSObject integerValue](v40, "integerValue") & 0xC00) == 0)
                                    {
                                      v31 = 1;
                                      goto LABEL_42;
                                    }
                                    v72 = sub_100024A40();
                                    v61 = objc_claimAutoreleasedReturnValue(v72);
                                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                                    {
LABEL_77:

                                      v31 = 6;
LABEL_78:
                                      v5 = v81;
LABEL_42:

LABEL_43:
                                      v6 = v85;
LABEL_44:

                                      v16 = v82;
LABEL_45:

                                      v19 = v83;
                                      goto LABEL_46;
                                    }
                                    *(_DWORD *)buf = 138543362;
                                    v92 = v22;
                                    v62 = v61;
                                    v63 = "IS&T signed component contains setuid item: %{public}@";
                                  }
                                  else
                                  {
                                    v60 = sub_100024A40();
                                    v61 = objc_claimAutoreleasedReturnValue(v60);
                                    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                                      goto LABEL_77;
                                    *(_DWORD *)buf = 138543362;
                                    v92 = v22;
                                    v62 = v61;
                                    v63 = "IS&T signed component in wrong format (permission) for %{public}@";
                                  }
                                  _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, v63, buf, 0xCu);
                                  goto LABEL_77;
                                }
                                v71 = sub_100024A40();
                                v40 = objc_claimAutoreleasedReturnValue(v71);
                                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                                {
LABEL_75:
                                  v31 = 6;
                                  goto LABEL_42;
                                }
                                *(_DWORD *)buf = 138543618;
                                v92 = (uint64_t)v85;
                                v93 = 2114;
                                v94 = v22;
                                v57 = v40;
                                v58 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                                v59 = 22;
                              }
                              else
                              {
                                v56 = sub_100024A40();
                                v40 = objc_claimAutoreleasedReturnValue(v56);
                                v5 = v81;
                                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                                  goto LABEL_75;
                                *(_DWORD *)buf = 138543362;
                                v92 = v22;
                                v57 = v40;
                                v58 = "IS&T signed component in wrong format (onwer name) for %{public}@";
                                v59 = 12;
                              }
                              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v58, buf, v59);
                              goto LABEL_75;
                            }
                            v70 = sub_100024A40();
                            v40 = objc_claimAutoreleasedReturnValue(v70);
                            if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                            {
LABEL_73:
                              v31 = 6;
                              v38 = v36;
                              goto LABEL_78;
                            }
                            *(_DWORD *)buf = 138543618;
                            v92 = (uint64_t)CFSTR("mobile");
                            v93 = 2114;
                            v94 = v22;
                            v53 = v40;
                            v54 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                            v55 = 22;
                          }
                          else
                          {
                            v52 = sub_100024A40();
                            v40 = objc_claimAutoreleasedReturnValue(v52);
                            if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                              goto LABEL_73;
                            *(_DWORD *)buf = 138543362;
                            v92 = v22;
                            v53 = v40;
                            v54 = "IS&T signed component in wrong format (owner name) for %{public}@";
                            v55 = 12;
                          }
                          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, v54, buf, v55);
                          goto LABEL_73;
                        }
                        v69 = sub_100024A40();
                        v38 = objc_claimAutoreleasedReturnValue(v69);
                        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                        {
LABEL_71:
                          v31 = 6;
                          goto LABEL_44;
                        }
                        *(_DWORD *)buf = 138543618;
                        v92 = (uint64_t)v5;
                        v93 = 2114;
                        v94 = v22;
                        v49 = v38;
                        v50 = "IS&T signed component can only contain %{public}@ owned file - %{public}@";
                        v51 = 22;
                      }
                      else
                      {
                        v48 = sub_100024A40();
                        v38 = objc_claimAutoreleasedReturnValue(v48);
                        v6 = v85;
                        if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                          goto LABEL_71;
                        *(_DWORD *)buf = 138543362;
                        v92 = v22;
                        v49 = v38;
                        v50 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                        v51 = 12;
                      }
                      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v50, buf, v51);
                      goto LABEL_71;
                    }
                    v68 = sub_100024A40();
                    v38 = objc_claimAutoreleasedReturnValue(v68);
                    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                    {
LABEL_69:
                      v31 = 6;
                      v34 = v32;
                      goto LABEL_43;
                    }
                    *(_DWORD *)buf = v80;
                    v92 = 501;
                    v93 = 2114;
                    v94 = v22;
                    v45 = v38;
                    v46 = "IS&T signed component can only contain %ld owned file - %{public}@";
                    v47 = 22;
                  }
                  else
                  {
                    v44 = sub_100024A40();
                    v38 = objc_claimAutoreleasedReturnValue(v44);
                    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                      goto LABEL_69;
                    *(_DWORD *)buf = 138543362;
                    v92 = v22;
                    v45 = v38;
                    v46 = "IS&T signed component in wrong format (owner ID) for %{public}@";
                    v47 = 12;
                  }
                  _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v46, buf, v47);
                  goto LABEL_69;
                }
                v67 = sub_100024A40();
                v34 = objc_claimAutoreleasedReturnValue(v67);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v22;
                  v65 = v34;
                  v66 = "%{public}@ is not allowed in IS&T signed component.";
                  goto LABEL_80;
                }
              }
              else
              {
                v64 = sub_100024A40();
                v34 = objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v92 = v22;
                  v65 = v34;
                  v66 = "IS&T signed component can only contain regular files - %{public}@";
                  goto LABEL_80;
                }
              }
            }
            else
            {
              v43 = sub_100024A40();
              v34 = objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v92 = v22;
                v65 = v34;
                v66 = "IS&T signed component in wrong format (file type) for %{public}@";
LABEL_80:
                _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
              }
            }
            v31 = 6;
            goto LABEL_45;
          }
        }
        v42 = sub_100024A40();
        v29 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v92 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "IS&T signed component in wrong format (no file attributes) for %{public}@", buf, 0xCu);
        }
        v31 = 6;
LABEL_46:

        if (v31 != 3)
          goto LABEL_93;
        v21 = (char *)v21 + 1;
        v20 = &APFSContainerGetSpaceInfo_ptr;
      }
      while (v19 != v21);
      v73 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      v19 = v73;
    }
    while (v73);
  }
  v31 = 0;
LABEL_93:

  if (v31)
    v74 = v31 == 6;
  else
    v74 = 1;
  v75 = !v74;

  return v75;
}

- (void)registerEntitlementNotificationHandler
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001372C;
  v5[3] = &unk_100048D88;
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
      v4 = &off_10004DF58;
    else
      v4 = &off_10004DF70;
  }
  else
  {
    v4 = &off_10004DF88;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));
}

- (id)getManifestData:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[MSDDemoManifestCheck manifestVersion](self, "manifestVersion") == 7)
  {
    v5 = objc_msgSend(v4, "objectForKey:ofType:", CFSTR("Data"), objc_opt_class(NSDictionary));
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)getComponentData:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = CFSTR("Manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Manifest")));

  if (v5
    || (v4 = CFSTR("Settings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Settings"))),
        v6,
        v6))
  {
    v7 = objc_msgSend(v3, "objectForKey:ofType:", v4, objc_opt_class(NSDictionary));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
            v14 = sub_100024A40();
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              sub_10002C214();
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
    v17 = sub_100024A40();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10002C1B4();
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10004DFA0));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.carrier"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator_1.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator_2.plist"));
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("/var/mobile/Library/Preferences/com.apple.operator.merged.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("/var/db/timezone/zoneinfo")));
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("/var/db/timezone/localtime"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10004DFB8));
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
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10004DFD0);
}

- (void)removeBlocklistedItemFromSection:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _UNKNOWN **v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  void *i;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *k;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  MSDDemoManifestCheck *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
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
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  id v66;
  __int16 v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];

  v6 = a3;
  v7 = a4;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v60;
    v11 = &APFSContainerGetSpaceInfo_ptr;
    v38 = self;
    v39 = v6;
    v36 = *(_QWORD *)v60;
    v37 = v7;
    do
    {
      v12 = 0;
      v40 = v9;
      do
      {
        if (*(_QWORD *)v60 != v10)
          objc_enumerationMutation(v6);
        v44 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v12);
        v13 = objc_msgSend(v6, "objectForKey:ofType:", v44, objc_opt_class(v11[109]));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](self, "getComponentData:", v14));
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getManifestData:](self, "getManifestData:", v15));
            if (v16)
            {
              v41 = v15;
              v42 = v14;
              v43 = v12;
              v17 = objc_opt_new(NSMutableArray);
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              obj = (id)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](self, "blocklistedItems"));
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
              if (v18)
              {
                v19 = v18;
                v46 = *(_QWORD *)v56;
                do
                {
                  for (i = 0; i != v19; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v56 != v46)
                      objc_enumerationMutation(obj);
                    v21 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
                    v51 = 0u;
                    v52 = 0u;
                    v53 = 0u;
                    v54 = 0u;
                    v22 = v16;
                    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
                    if (v23)
                    {
                      v24 = v23;
                      v25 = *(_QWORD *)v52;
                      do
                      {
                        for (j = 0; j != v24; j = (char *)j + 1)
                        {
                          if (*(_QWORD *)v52 != v25)
                            objc_enumerationMutation(v22);
                          v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
                          if ((objc_msgSend(v27, "isEqualToString:", v21, v36) & 1) != 0
                            || objc_msgSend(v27, "hasPrefix:", v21))
                          {
                            -[NSMutableArray addObject:](v17, "addObject:", v27);
                          }
                        }
                        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v70, 16);
                      }
                      while (v24);
                    }

                  }
                  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                }
                while (v19);
              }

              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              v28 = v17;
              v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
              v7 = v37;
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v48;
                do
                {
                  for (k = 0; k != v30; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v48 != v31)
                      objc_enumerationMutation(v28);
                    v33 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k);
                    v34 = sub_100024A40();
                    v35 = objc_claimAutoreleasedReturnValue(v34);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543874;
                      v64 = v33;
                      v65 = 2114;
                      v66 = v37;
                      v67 = 2114;
                      v68 = v44;
                      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Excluding %{public}@ from section: %{public}@ component:%{public}@", buf, 0x20u);
                    }

                    objc_msgSend(v16, "removeObjectForKey:", v33);
                  }
                  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
                }
                while (v30);
              }

              self = v38;
              v6 = v39;
              v10 = v36;
              v11 = &APFSContainerGetSpaceInfo_ptr;
              v9 = v40;
              v15 = v41;
              v14 = v42;
              v12 = v43;
            }

          }
        }

        v12 = (char *)v12 + 1;
      }
      while (v12 != v9);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v9);
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
