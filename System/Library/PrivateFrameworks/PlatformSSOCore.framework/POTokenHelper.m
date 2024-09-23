@implementation POTokenHelper

- (POTokenHelper)initWithIdentifierProvider:(id)a3
{
  id v5;
  POTokenHelper *v6;
  POTokenHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POTokenHelper;
  v6 = -[POTokenHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userIdentifierProvider, a3);

  return v7;
}

- (id)getDriverConfiguration
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDC6C98], "driverConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper getDriverConfiguration].cold.1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.platformsso"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)insertTokenForUser:(id)a3
{
  id v4;
  NSObject *v5;
  POConfigurationCoreManager *v6;
  void *v7;
  POConfigurationCoreManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  POMutableTokenConfigJWTBody *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  POMutableTokenConfigJWTBody *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  __SecCertificate *v60;
  SecKeyRef v61;
  __SecKey *v62;
  CFDictionaryRef v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  CFDictionaryRef v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  BOOL v78;
  id v79;
  POMutableTokenConfigJWTBody *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  POMutableTokenConfigJWTBody *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  CFDictionaryRef v106;
  id v107;
  id v109;
  void *v110;
  POMutableTokenConfigJWTBody *v111;
  CFDictionaryRef v112;
  uint64_t v113;
  POMutableTokenConfigJWTBody *v114;
  void *v115;
  id v116;
  const __CFDictionary *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[2];
  void *v129;
  const __CFString *v130;
  void *v131;
  void *v132;
  const __CFString *v133;
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  uint8_t v137[128];
  uint8_t buf[4];
  const char *v139;
  __int16 v140;
  id v141;
  __int16 v142;
  POTokenHelper *v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POTokenHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v139 = "-[POTokenHelper insertTokenForUser:]";
    v140 = 2114;
    v141 = v4;
    v142 = 2112;
    v143 = self;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", buf, 0x20u);
  }

  v6 = [POConfigurationCoreManager alloc];
  -[POTokenHelper userIdentifierProvider](self, "userIdentifierProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:](v6, "initWithUserName:identifierProvider:sharedOnly:", v4, v7, 1);

  -[POConfigurationCoreManager currentUserConfiguration](v8, "currentUserConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "userDecryptionCertificate"))
    {
      objc_msgSend(v10, "userDecryptionKeyHash");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v10, "userUnlockData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[POTokenHelper getDriverConfiguration](self, "getDriverConfiguration");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13)
        {
          v126[0] = MEMORY[0x24BDAC760];
          v126[1] = 3221225472;
          v126[2] = __36__POTokenHelper_insertTokenForUser___block_invoke;
          v126[3] = &unk_2514FF9D0;
          v127 = v4;
          v79 = __36__POTokenHelper_insertTokenForUser___block_invoke((uint64_t)v126);
          v78 = 0;
          v26 = v127;
LABEL_49:

          goto LABEL_50;
        }
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        -[NSObject tokenConfigurations](v13, "tokenConfigurations");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v123;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v123 != v19)
                objc_enumerationMutation(v16);
              -[NSObject removeTokenConfigurationForTokenInstanceID:](v14, "removeTokenConfigurationForTokenInstanceID:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
          }
          while (v18);
        }

        -[NSObject removeTokenConfigurationForTokenInstanceID:](v14, "removeTokenConfigurationForTokenInstanceID:", v4);
        objc_msgSend(v10, "userDecryptionKeyHash");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject removeTokenConfigurationForTokenInstanceID:](v14, "removeTokenConfigurationForTokenInstanceID:", v22);

        -[NSObject tokenConfigurations](v14, "tokenConfigurations");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userDecryptionKeyHash");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          goto LABEL_16;
        objc_msgSend(v10, "userDecryptionKeyHash");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addTokenConfigurationForTokenInstanceID:](v14, "addTokenConfigurationForTokenInstanceID:", v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
LABEL_16:
          if (v12)
          {
            PO_LOG_POTokenHelper();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              -[POTokenHelper insertTokenForUser:].cold.2();

            v30 = objc_alloc_init(POMutableTokenConfigJWTBody);
            objc_msgSend(v10, "userUnlockData");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[POMutableTokenConfigJWTBody setUnlockData:](v30, "setUnlockData:", v31);

            objc_msgSend(v10, "userUnlockHash");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[POMutableTokenConfigJWTBody setUnlockHash:](v30, "setUnlockHash:", v33);

            objc_msgSend(v10, "unlockTokenId");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[POMutableTokenConfigJWTBody setIdpTokenId:](v30, "setIdpTokenId:", v34);

            v114 = v30;
            -[_POJWTBodyBase dataRepresentation](v30, "dataRepresentation");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setConfigurationData:", v35);

            v36 = objc_msgSend(v10, "userDecryptionCertificate");
            v37 = objc_alloc(MEMORY[0x24BDC6CA0]);
            v38 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v10, "uniqueIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR("certificate:%@"), v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v37, "initWithCertificate:objectID:", v36, v40);

            v42 = objc_alloc(MEMORY[0x24BDC6CA8]);
            objc_msgSend(v10, "userDecryptionKeyHash");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)objc_msgSend(v42, "initWithCertificate:objectID:", v36, v43);

            objc_msgSend(v10, "userDecryptionKeyHash");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setApplicationTag:", v45);

            objc_msgSend(v44, "setSuitableForLogin:", 1);
            objc_msgSend(v44, "setCanDecrypt:", 1);
            objc_msgSend(v44, "setCanSign:", 1);
            objc_msgSend(v44, "setCanPerformKeyExchange:", 1);
            v135[0] = &unk_251520FD8;
            v135[1] = &unk_251520FF0;
            v136[0] = CFSTR("TOKENS");
            v136[1] = CFSTR("TOKENS");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setConstraints:", v46);

            v115 = (void *)v41;
            v134[0] = v41;
            v134[1] = v44;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v134, 2);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setKeychainItems:", v47);

            -[NSObject tokenConfigurations](v14, "tokenConfigurations");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "userUnlockHash");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v51)
              goto LABEL_21;
            objc_msgSend(v10, "userUnlockHash");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addTokenConfigurationForTokenInstanceID:](v14, "addTokenConfigurationForTokenInstanceID:", v53);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v51)
            {
LABEL_21:
              v54 = objc_alloc_init(POMutableTokenConfigJWTBody);
              -[POMutableTokenConfigJWTBody setUserName:](v54, "setUserName:", v4);
              objc_msgSend(v10, "userLoginConfiguration");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "loginUserName");
              v56 = objc_claimAutoreleasedReturnValue();
              v57 = (void *)v56;
              if (v56)
                v58 = (id)v56;
              else
                v58 = v4;
              -[POMutableTokenConfigJWTBody setLoginUserName:](v54, "setLoginUserName:", v58);

              -[_POJWTBodyBase dataRepresentation](v54, "dataRepresentation");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setConfigurationData:", v59);

              v60 = (__SecCertificate *)objc_msgSend(v10, "userUnlockCertificate");
              if (v60)
              {
                v61 = SecCertificateCopyKey(v60);
                if (v61)
                {
                  v62 = v61;
                  +[POSecKeyHelper dataForEphemeralKey:](POSecKeyHelper, "dataForEphemeralKey:", v61);
                  v113 = objc_claimAutoreleasedReturnValue();
                  if (v113)
                  {
                    v111 = v54;
                    v63 = SecKeyCopyAttributes(v62);
                    CFRelease(v62);
                    v112 = v63;
                    if (v63)
                    {
                      v109 = objc_alloc(MEMORY[0x24BDC6CA8]);
                      objc_msgSend(v10, "userUnlockHash");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v64);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      v110 = (void *)objc_msgSend(v109, "initWithCertificate:objectID:", 0, v65);

                      -[__CFDictionary objectForKeyedSubscript:](v63, "objectForKeyedSubscript:", *MEMORY[0x24BDE9550]);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setPublicKeyData:", v66);

                      -[__CFDictionary objectForKeyedSubscript:](v63, "objectForKeyedSubscript:", *MEMORY[0x24BDE8FB0]);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setPublicKeyHash:", v67);

                      -[__CFDictionary objectForKeyedSubscript:](v63, "objectForKeyedSubscript:", *MEMORY[0x24BDE9050]);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setKeyType:", v68);

                      v69 = v63;
                      v70 = v110;
                      -[__CFDictionary objectForKeyedSubscript:](v69, "objectForKeyedSubscript:", *MEMORY[0x24BDE9048]);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setKeySizeInBits:", objc_msgSend(v71, "unsignedIntegerValue"));

                      objc_msgSend(v10, "userUnlockHash");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v72);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setLabel:", v73);

                      objc_msgSend(v110, "setCanDecrypt:", 1);
                      objc_msgSend(v110, "setCanPerformKeyExchange:", 1);
                      objc_msgSend(CFSTR("idp"), "dataUsingEncoding:", 4);
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setApplicationTag:", v74);

                      v132 = &unk_251520FD8;
                      v133 = CFSTR("TOKENS");
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setConstraints:", v75);

                      v131 = v110;
                      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v131, 1);
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "setKeychainItems:", v76);

                      v77 = 0;
                    }
                    else
                    {
                      v116 = v10;
                      v107 = __36__POTokenHelper_insertTokenForUser___block_invoke_68();
                      v77 = 1;
                      v70 = v116;
                    }
                    v101 = v114;

                    v54 = v111;
                    v106 = v112;
                  }
                  else
                  {
                    CFRelease(v62);
                    v117 = v10;
                    v105 = __36__POTokenHelper_insertTokenForUser___block_invoke_65();
                    v77 = 1;
                    v106 = v117;
                    v101 = v114;
                  }

                  v100 = (void *)v113;
                }
                else
                {
                  v118 = v10;
                  v103 = __36__POTokenHelper_insertTokenForUser___block_invoke_61();
                  v77 = 1;
                  v100 = v118;
                  v101 = v114;
                }
              }
              else
              {
                v119 = v10;
                v99 = __36__POTokenHelper_insertTokenForUser___block_invoke_58();
                v77 = 1;
                v100 = v119;
                v101 = v114;
              }

            }
            else
            {
              v120 = v10;
              v104 = __36__POTokenHelper_insertTokenForUser___block_invoke_55();
              v77 = 1;
              v51 = v120;
              v101 = v114;
            }

            if (v77)
              goto LABEL_47;
          }
          else
          {
            v80 = objc_alloc_init(POMutableTokenConfigJWTBody);
            -[POMutableTokenConfigJWTBody setUserName:](v80, "setUserName:", v4);
            objc_msgSend(v10, "userLoginConfiguration");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "loginUserName");
            v82 = objc_claimAutoreleasedReturnValue();
            v83 = (void *)v82;
            if (v82)
              v84 = (id)v82;
            else
              v84 = v4;
            -[POMutableTokenConfigJWTBody setLoginUserName:](v80, "setLoginUserName:", v84);

            -[_POJWTBodyBase dataRepresentation](v80, "dataRepresentation");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setConfigurationData:", v85);

            v86 = objc_msgSend(v10, "userDecryptionCertificate");
            v87 = objc_alloc(MEMORY[0x24BDC6CA0]);
            v88 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v10, "uniqueIdentifier");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "stringWithFormat:", CFSTR("certificate:%@"), v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = (void *)objc_msgSend(v87, "initWithCertificate:objectID:", v86, v90);

            v92 = objc_alloc(MEMORY[0x24BDC6CA8]);
            objc_msgSend(v10, "userDecryptionKeyHash");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = (void *)objc_msgSend(v92, "initWithCertificate:objectID:", v86, v93);

            objc_msgSend(v10, "userDecryptionKeyHash");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setLabel:", v96);

            objc_msgSend(v94, "setSuitableForLogin:", 1);
            objc_msgSend(v94, "setCanDecrypt:", 1);
            objc_msgSend(v94, "setCanSign:", 1);
            objc_msgSend(v94, "setCanPerformKeyExchange:", 1);
            v129 = &unk_251520FD8;
            v130 = CFSTR("TOKENS");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setConstraints:", v97);

            v128[0] = v91;
            v128[1] = v94;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 2);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setKeychainItems:", v98);

          }
          v78 = 1;
          goto LABEL_49;
        }
        v121 = v10;
        v102 = __36__POTokenHelper_insertTokenForUser___block_invoke_40();

LABEL_47:
        v78 = 0;
        goto LABEL_49;
      }
    }
  }
  PO_LOG_POTokenHelper();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper insertTokenForUser:].cold.1();
  v78 = 0;
LABEL_50:

  return v78;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("No driver config for user."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __36__POTokenHelper_insertTokenForUser___block_invoke_cold_1((uint64_t)v2, a1, v3);

  return v2;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_40()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("No token config for token id."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __36__POTokenHelper_insertTokenForUser___block_invoke_40_cold_1();

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_55()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("No unlock token config for idp token id."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __36__POTokenHelper_insertTokenForUser___block_invoke_55_cold_1();

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_58()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("Missing unlock certificate."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __36__POTokenHelper_insertTokenForUser___block_invoke_55_cold_1();

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_61()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("Missing unlock public key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __36__POTokenHelper_insertTokenForUser___block_invoke_55_cold_1();

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_65()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("Missing unlock public key data."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __36__POTokenHelper_insertTokenForUser___block_invoke_55_cold_1();

  return v0;
}

id __36__POTokenHelper_insertTokenForUser___block_invoke_68()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("Missing unlock public key attributes."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POTokenHelper();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __36__POTokenHelper_insertTokenForUser___block_invoke_55_cold_1();

  return v0;
}

- (void)removeTokenForUser:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  POConfigurationCoreManager *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  POTokenHelper *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POTokenHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315650;
    v23 = "-[POTokenHelper removeTokenForUser:]";
    v24 = 2114;
    v25 = v4;
    v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", (uint8_t *)&v22, 0x20u);
  }

  -[POTokenHelper getDriverConfiguration](self, "getDriverConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "removeTokenConfigurationForTokenInstanceID:", v4);
    v8 = [POConfigurationCoreManager alloc];
    -[POTokenHelper userIdentifierProvider](self, "userIdentifierProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:](v8, "initWithUserName:identifierProvider:sharedOnly:", v4, v9, 1);

    -[NSObject currentUserConfiguration](v10, "currentUserConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "userDecryptionKeyHash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v12, "userDecryptionKeyHash");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeTokenConfigurationForTokenInstanceID:", v15);

      }
    }

  }
  else
  {
    PO_LOG_POTokenHelper();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[POTokenHelper removeTokenForUser:].cold.1((uint64_t)v4, v10, v16, v17, v18, v19, v20, v21);
  }

}

- (void)removeAllTokens
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "no driver config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (id)tokenHashForUser:(id)a3
{
  void *v3;
  void *v4;

  -[POTokenHelper tokenHashDataForUser:](self, "tokenHashDataForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)base64URLtokenHashForUser:(id)a3
{
  void *v3;
  void *v4;

  -[POTokenHelper tokenHashDataForUser:](self, "tokenHashDataForUser:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "psso_base64URLEncodedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tokenHashDataForUser:(id)a3
{
  id v4;
  NSObject *v5;
  POConfigurationCoreManager *v6;
  void *v7;
  POConfigurationCoreManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  POTokenHelper *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POTokenHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[POTokenHelper tokenHashDataForUser:]";
    v17 = 2114;
    v18 = v4;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", (uint8_t *)&v15, 0x20u);
  }

  v6 = [POConfigurationCoreManager alloc];
  -[POTokenHelper userIdentifierProvider](self, "userIdentifierProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:](v6, "initWithUserName:identifierProvider:sharedOnly:", v4, v7, 1);

  -[POConfigurationCoreManager currentUserConfiguration](v8, "currentUserConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || !objc_msgSend(v9, "userDecryptionCertificate")
    || (objc_msgSend(v10, "userDecryptionKeyHash"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    PO_LOG_POTokenHelper();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[POTokenHelper insertTokenForUser:].cold.1();
    goto LABEL_10;
  }
  if (!objc_msgSend(v10, "userDecryptionCertificate"))
  {
    PO_LOG_POTokenHelper();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[POTokenHelper tokenHashDataForUser:].cold.2();
LABEL_10:

    v12 = 0;
    goto LABEL_11;
  }
  v12 = (void *)SecCertificateCopyPublicKeySHA1Digest();
LABEL_11:

  return v12;
}

+ (id)dataToHex:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_retainAutorelease(v4);
    v8 = objc_msgSend(v7, "bytes");
    if (objc_msgSend(v7, "length"))
    {
      v9 = 0;
      do
        objc_msgSend(v6, "appendFormat:", CFSTR("%02lX"), *(unsigned __int8 *)(v8 + v9++));
      while (v9 < objc_msgSend(v7, "length"));
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)retrieveCertAndKeyForTokenId:(id)a3 context:(id)a4 certificate:(__SecCertificate *)a5 privateKey:(__SecKey *)a6
{
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  POTokenHelper *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  PO_LOG_POTokenHelper();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[POTokenHelper retrieveCertAndKeyForTokenId:context:certificate:privateKey:]";
    v15 = 2114;
    v16 = v9;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_DEFAULT, "%s tokenName = %{public}@ on %@", (uint8_t *)&v13, 0x20u);
  }

  if (*a5)
  {
    CFRelease(*a5);
    *a5 = 0;
  }
  if (*a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }
  PO_LOG_POTokenHelper();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper retrieveCertAndKeyForTokenId:context:certificate:privateKey:].cold.1();

  return 0;
}

- (id)findTokenIdForSmartCardBoundUser:(id)a3 tokenHash:(id *)a4
{
  id v4;
  NSObject *v5;

  v4 = a3;
  PO_LOG_POTokenHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper findTokenIdForSmartCardBoundUser:tokenHash:].cold.1();

  return 0;
}

- (id)findTokenIdForSmartCardAMUser:(id)a3 tokenHash:(id *)a4
{
  id v4;
  NSObject *v5;

  v4 = a3;
  PO_LOG_POTokenHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper findTokenIdForSmartCardAMUser:tokenHash:].cold.1();

  return 0;
}

- (id)findInfoForTokenId:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PO_LOG_POTokenHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper findInfoForTokenId:].cold.1();

  return 0;
}

- (BOOL)canTokenIdLogin:(id)a3 pubKeyHash:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC6C88]), "initWithTokenID:", v5);
  objc_msgSend(v7, "sessionWithLAContext:error:", 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v8, "keys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v21 = v5;
      v12 = *(_QWORD *)v23;
      v13 = *MEMORY[0x24BDE8FB0];
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v15, "keyUsage") & 1) != 0)
          {
            objc_msgSend(v15, "keychainAttributes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v6);

            if ((v18 & 1) != 0)
            {
              v19 = 1;
              goto LABEL_14;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
          continue;
        break;
      }
      v19 = 0;
LABEL_14:
      v5 = v21;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)postAHPCacheRefreshNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)getTokenInfo
{
  NSObject *v2;

  PO_LOG_POTokenHelper();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper getTokenInfo].cold.1();

  return 0;
}

- (BOOL)waitForTokenAvailable:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PO_LOG_POTokenHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[POTokenHelper waitForTokenAvailable:].cold.1();

  return 1;
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
}

- (void)getDriverConfiguration
{
  OUTLINED_FUNCTION_9(&dword_24440D000, a2, a3, "driver config value %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)insertTokenForUser:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "user not configured for decryption", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)insertTokenForUser:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "Adding unlock key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __36__POTokenHelper_insertTokenForUser___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_24440D000, log, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __36__POTokenHelper_insertTokenForUser___block_invoke_40_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(v0, v1), "tokenId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_24440D000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __36__POTokenHelper_insertTokenForUser___block_invoke_55_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(v0, v1), "unlockTokenId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_24440D000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)removeTokenForUser:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_24440D000, a2, a3, "no driver config for user: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)tokenHashDataForUser:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "No certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)retrieveCertAndKeyForTokenId:context:certificate:privateKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "No Identity found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)findTokenIdForSmartCardBoundUser:tokenHash:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s userName = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)findTokenIdForSmartCardAMUser:tokenHash:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s userName = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)findInfoForTokenId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s tokenId = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)getTokenInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)waitForTokenAvailable:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s tokenId = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

@end
