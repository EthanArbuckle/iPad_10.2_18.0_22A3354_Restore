@implementation ICStoreURLRequest

- (ICStoreURLRequest)initWithURL:(id)a3 requestContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  ICStoreURLRequest *v9;

  v6 = (void *)MEMORY[0x1E0C92C80];
  v7 = a4;
  objc_msgSend(v6, "requestWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICStoreURLRequest initWithURLRequest:requestContext:resumeData:](self, "initWithURLRequest:requestContext:resumeData:", v8, v7, 0);

  return v9;
}

- (void)setShouldUseMescalSigning:(BOOL)a3
{
  self->_shouldUseMescalSigning = a3;
}

- (ICStoreURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  return -[ICStoreURLRequest initWithURLRequest:requestContext:resumeData:](self, "initWithURLRequest:requestContext:resumeData:", a3, a4, 0);
}

void __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter;
  buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter = (uint64_t)v0;

  objc_msgSend((id)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
  objc_msgSend((id)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter, "setLocale:", v4);
  v2 = (void *)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0);
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 48), "urlRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v2, "isTrustedHostForURL:", v4);

      if ((v5 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 56), "setURLBag:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 48), "buildStoreURLRequestWithURLRequest:builderProperties:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
      }
      else
      {
        v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = *(void **)(a1 + 48);
          objc_msgSend(v8, "urlRequest");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "URL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v21 = v8;
          v22 = 2114;
          v23 = v10;
          _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Using store request for url with untrusted host: '%{public}@'", buf, 0x16u);

        }
        v11 = (void *)MEMORY[0x1E0D4D030];
        v12 = *MEMORY[0x1E0D4CE48];
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 48), "urlRequest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Using store request for url with untrusted host '%@'"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v12, CFSTR("Bug"), CFSTR("ICStoreURLRequest"), v16, &stru_1E4391778, 0, 0);

        v17 = *(_QWORD *)(a1 + 72);
        if (*(_QWORD *)(a1 + 32))
        {
          (*(void (**)(_QWORD, _QWORD))(v17 + 16))(*(_QWORD *)(a1 + 72), 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7009, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

        }
      }
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7200, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

    }
  }
}

+ (BOOL)_shouldPersonalizeRequestForRequestContext:(id)a3 personalizationStyle:(int64_t)a4
{
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  if (a4 != 1)
    return a4 != 0;
  v5 = a3;
  objc_msgSend(v5, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestingBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "privacyAcknowledgementRequiredForBundleIdentifier:", v9);

  v4 = v13 ^ 1;
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICStoreURLRequest;
  -[ICURLRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStoreURLRequest storeRequestContext](self, "storeRequestContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("[requestContext=%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  ICUserCredentialRequest *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  ICUserCredentialRequest *v20;
  ICStoreURLRequestBuilderProperties *v21;
  uint64_t v22;
  dispatch_qos_class_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  ICStoreURLRequestBuilderProperties *v36;
  id v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  dispatch_queue_t v44;
  id v45;
  id v46;
  ICStoreURLRequestBuilderProperties *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[ICSecurityInfo sharedSecurityInfo](ICSecurityInfo, "sharedSecurityInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isContentProtectionEnabled")
      || (objc_msgSend(v6, "isDeviceClassCUnlocked") & 1) != 0)
    {
      v40 = v6;
      objc_msgSend(*(id *)(a1 + 32), "storeRequestContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identityStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[ICUserCredentialRequest initWithIdentity:identityStore:clientInfo:]([ICUserCredentialRequest alloc], "initWithIdentity:identityStore:clientInfo:", v9, v10, v41);
      -[ICUserCredentialRequest setTimeoutInterval:](v11, "setTimeoutInterval:", 30.0);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = objc_msgSend(*(id *)(a1 + 32), "prioritize");
      v14 = 17;
      if (v13)
        v14 = 25;
      if (v12 <= v14)
        v15 = v14;
      else
        v15 = v12;
      -[ICUserCredentialRequest setQualityOfService:](v11, "setQualityOfService:", v15);
      v42 = v8;
      objc_msgSend(v8, "addObject:", v11);
      objc_msgSend(v7, "delegatedIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 && (objc_msgSend(v16, "isEqualToIdentity:inStore:", v9, v10) & 1) == 0)
      {
        v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v54 = v19;
          v55 = 2112;
          v56 = v17;
          _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - buildURLRequestWithCompletionHandler [Delegated identity found] - delegatedIdentity=%@", buf, 0x16u);
        }

        v20 = -[ICUserCredentialRequest initWithIdentity:identityStore:clientInfo:]([ICUserCredentialRequest alloc], "initWithIdentity:identityStore:clientInfo:", v17, v10, v41);
        -[ICUserCredentialRequest timeoutInterval](v11, "timeoutInterval");
        -[ICUserCredentialRequest setTimeoutInterval:](v20, "setTimeoutInterval:");
        -[ICUserCredentialRequest setQualityOfService:](v20, "setQualityOfService:", v15);
        objc_msgSend(v42, "addObject:", v20);

      }
      v21 = objc_alloc_init(ICStoreURLRequestBuilderProperties);
      v22 = *(_QWORD *)(a1 + 48);
      if (v22 <= 16)
      {
        if (v22 == 9)
        {
          v23 = QOS_CLASS_BACKGROUND;
          goto LABEL_29;
        }
      }
      else
      {
        switch(v22)
        {
          case 17:
            v23 = QOS_CLASS_UTILITY;
            goto LABEL_29;
          case 33:
            v23 = QOS_CLASS_USER_INTERACTIVE;
            goto LABEL_29;
          case 25:
            v23 = QOS_CLASS_USER_INITIATED;
LABEL_29:
            dispatch_queue_attr_make_with_qos_class(0, v23, 0);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = dispatch_queue_create("com.apple.iTunesCloud.ICStoreURLRequest.serialQueue", v28);

            +[ICUserCredentialProvider sharedProvider](ICUserCredentialProvider, "sharedProvider");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_127;
            v43[3] = &unk_1E438CD38;
            v31 = *(void **)(a1 + 40);
            v43[4] = *(_QWORD *)(a1 + 32);
            v32 = v31;
            v44 = v29;
            v45 = v9;
            v46 = v10;
            v47 = v21;
            v48 = v17;
            v49 = v7;
            v33 = *(_QWORD *)(a1 + 48);
            v51 = v32;
            v52 = v33;
            v50 = v5;
            v34 = v7;
            v35 = v17;
            v36 = v21;
            v37 = v10;
            v38 = v9;
            v39 = v29;
            objc_msgSend(v30, "performCredentialRequests:withResponseHandler:", v42, v43);

            goto LABEL_30;
        }
      }
      v23 = QOS_CLASS_UNSPECIFIED;
      goto LABEL_29;
    }
    v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v54 = v25;
      _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "Request %{public}@ issued before before first unlock, returning error.", buf, 0xCu);
    }

    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7006, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v27);

  }
LABEL_30:

}

- (void)buildURLRequestWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "qualityOfService");

  v9[1] = 3221225472;
  v9[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E438CD60;
  v9[4] = self;
  v10 = v4;
  v11 = v6;
  v8.receiver = self;
  v8.super_class = (Class)ICStoreURLRequest;
  v9[0] = MEMORY[0x1E0C809B0];
  v7 = v4;
  -[ICURLRequest buildURLRequestWithCompletionHandler:](&v8, sel_buildURLRequestWithCompletionHandler_, v9);

}

- (BOOL)shouldParseBodyData
{
  return self->_shouldParseBodyData;
}

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, void *);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  ICStoreURLRequest *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  uint64_t v112;
  void *v113;
  void *v114;
  ICStoreURLRequest *v115;
  void *v116;
  void *v117;
  void *v118;
  int64_t anisetteVersion;
  id v120;
  NSObject *v121;
  int64_t v122;
  BOOL v123;
  id v124;
  id v125;
  __CFString *v126;
  NSObject *v127;
  void *v128;
  int v129;
  uint64_t v130;
  int64_t v131;
  NSObject *v132;
  BOOL v133;
  id v134;
  id v135;
  __CFString *v136;
  NSObject *v137;
  NSObject *v138;
  __CFString *v139;
  __CFString *v140;
  ICJSSign *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  ICStoreURLRequest *v145;
  void *v146;
  void *v147;
  void *v148;
  ICStoreURLRequest *v149;
  uint64_t v150;
  id v151;
  uint64_t v152;
  void *v153;
  void *v154;
  id v155;
  _BOOL4 v156;
  void *v157;
  void *v158;
  BOOL v159;
  void *v160;
  void (**v161)(id, void *, void *);
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  id v168;
  ICStoreURLRequest *v169;
  void *v170;
  void *v171;
  void *v172;
  _QWORD v173[5];
  id v174;
  id v175;
  void (**v176)(id, void *, void *);
  _QWORD v177[4];
  id v178;
  BOOL v179;
  __CFString *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _BYTE v194[128];
  uint8_t v195[128];
  uint8_t buf[4];
  ICStoreURLRequest *v197;
  __int16 v198;
  const __CFString *v199;
  __int16 v200;
  void *v201;
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, void *))a5;
  -[ICStoreURLRequest storeRequestContext](self, "storeRequestContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientInfo");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identityStore");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v13, "URL");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = v11;
  v14 = objc_msgSend(v11, "personalizationStyle");
  if (v14 == 1 && -[ICStoreURLRequest _isPersonalizationRestricted](self, "_isPersonalizationRestricted"))
  {
    v15 = v12;
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v197 = self;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Automatic personalization is requested but not allowed - failing request", buf, 0xCu);
    }

    v17 = (void *)MEMORY[0x1E0D4D030];
    v18 = *MEMORY[0x1E0D4CE48];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Automatic personalization is requested but not allowed. url='%@'"), v170);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v18, CFSTR("Bug"), CFSTR("ICStoreURLRequest"), v19, 0, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7007, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v13, v20);
    goto LABEL_186;
  }
  v159 = v14 != 0;
  v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = "unpersonalized";
    if (v14)
      v22 = "personalized";
    *(_DWORD *)buf = 138543618;
    v197 = self;
    v198 = 2082;
    v199 = (const __CFString *)v22;
    _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Building %{public}s store URL request", buf, 0x16u);
  }

  v168 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "URLBag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = v23;
  if (v14 && v23 && objc_msgSend(v23, "shouldAppendDeviceGUIDForURL:", v170))
  {
    objc_msgSend(v12, "deviceGUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v168, "setObject:forKey:", v24, CFSTR("guid"));

  }
  v160 = v12;
  v161 = v10;
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isLegacyStoreCacheBusterEnabled");

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v168, "setObject:forKey:", v28, CFSTR("buster"));
  }
  if (objc_msgSend(v168, "count"))
  {
    objc_msgSend(v170, "ic_URLByAppendingQueryParameters:", v168);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setURL:", v29);
    v170 = (void *)v29;
  }
  -[ICStoreURLRequest additionalQueryItems](self, "additionalQueryItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v30;
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v170, "ic_URLByAppendingQueryItems:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setURL:", v31);
    v170 = (void *)v31;
  }
  objc_msgSend(v9, "DSID");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v14)
  {
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Dsid"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = v33 != 0;
    if (!v34 && v33)
    {
      objc_msgSend(v33, "stringValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v35, CFSTR("X-Dsid"));

    }
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("iCloud-DSID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      objc_msgSend(v9, "iCloudPersonID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
        objc_msgSend(v13, "setValue:forHTTPHeaderField:", v37, CFSTR("iCloud-DSID"));

    }
  }
  else
  {
    v156 = v32 != 0;
  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Requesting-Bundle-Id"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    objc_msgSend(v167, "requestingBundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "length"))
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v39, CFSTR("X-Apple-Requesting-Bundle-Id"));

  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Requesting-Bundle-Version"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    objc_msgSend(v167, "requestingBundleVersion");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "length"))
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v41, CFSTR("X-Apple-Requesting-Bundle-Version"));

  }
  v166 = v33;
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Enqueuer-DSID"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v169 = self;
  if (!v42)
  {
    objc_msgSend(v9, "delegatedDSID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v43, "stringValue");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v197 = v169;
        v198 = 2112;
        v199 = CFSTR("X-Enqueuer-DSID");
        v200 = 2112;
        v201 = v45;
        _os_log_impl(&dword_1A03E3000, v44, OS_LOG_TYPE_DEBUG, "%{public}@ - buildStoreURLRequestWithURLRequest:properties:completionHandler: - Delegation header [dsid] [%@: %@]", buf, 0x20u);

      }
      objc_msgSend(v43, "stringValue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v46, CFSTR("X-Enqueuer-DSID"));

    }
  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Enqueuer-Store-Front"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    objc_msgSend(v9, "delegatedStorefrontIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "length"))
    {
      objc_msgSend(v9, "delegatedURLBag");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v49)
      {
        v51 = v49;
      }
      else
      {
        objc_msgSend(v9, "URLBag");
        v51 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v51, "storefrontHeaderSuffix");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "length"))
      {
        objc_msgSend(v48, "stringByAppendingString:", v52);
        v53 = objc_claimAutoreleasedReturnValue();

        v48 = (void *)v53;
      }
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v48, CFSTR("X-Apple-Enqueuer-Store-Front"));

    }
  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-WHA-Token"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = v9;
  if (!v54)
  {
    objc_msgSend(v9, "delegateToken");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "type") == 1)
    {
      objc_msgSend(v55, "data");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "base64EncodedStringWithOptions:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        v58 = v8;
        v59 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v197 = v169;
          v198 = 2112;
          v199 = CFSTR("X-WHA-Token");
          v200 = 2112;
          v201 = v57;
          _os_log_impl(&dword_1A03E3000, v59, OS_LOG_TYPE_DEBUG, "%{public}@ - buildStoreURLRequestWithURLRequest:properties:completionHandler: - Delegation header [token] [%@: %@]", buf, 0x20u);
        }

        objc_msgSend(v13, "setValue:forHTTPHeaderField:", v57, CFSTR("X-WHA-Token"));
        v8 = v58;
      }

      v9 = v165;
    }

  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Tz"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v60)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "secondsFromGMT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringValue");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v64, CFSTR("X-Apple-Tz"));

  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-I-Client-Time"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v169;
  if (!v65)
  {
    if (buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatterOnceToken != -1)
      dispatch_once(&buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatterOnceToken, &__block_literal_global_18015);
    v67 = (void *)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "stringFromDate:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v69, "length"))
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v69, CFSTR("X-Apple-I-Client-Time"));

  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Connection-Type"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v70)
  {
    objc_msgSend((id)objc_opt_class(), "currentConnectionTypeHeader");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v71, "length"))
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v71, CFSTR("X-Apple-Connection-Type"));

  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Cuid"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v72)
  {
    +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "cloudMediaLibraryUID");
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v74, CFSTR("X-Apple-Cuid"));

  }
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v75)
  {
    objc_msgSend(v9, "storefrontIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v76;
    if (v76)
    {
      v78 = v76;
    }
    else
    {
      objc_msgSend(v164, "localStoreAccountProperties");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "storefrontIdentifier");
      v78 = (id)objc_claimAutoreleasedReturnValue();

      v66 = v169;
    }
    if (objc_msgSend(v78, "length"))
    {
      objc_msgSend(v162, "storefrontHeaderSuffix");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v80, "length"))
      {
        objc_msgSend(v78, "stringByAppendingString:", v80);
        v81 = objc_claimAutoreleasedReturnValue();

        v78 = (id)v81;
      }
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v78, CFSTR("X-Apple-Store-Front"));

      v66 = v169;
    }

  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "isInternalBuild");

  if (v83)
  {
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Issuing-Process"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v84)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "bundleIdentifier");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v86, CFSTR("X-Apple-Issuing-Process"));

    }
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Requesting-Process"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v87)
    {
      objc_msgSend(v167, "_clientIdentifierForUserAgent");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v88, CFSTR("X-Apple-Requesting-Process"));

    }
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-NSURLCachePolicy"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v89)
    {
      -[ICStoreURLRequest _stringForCachePolicy:](v66, "_stringForCachePolicy:", objc_msgSend(v13, "cachePolicy"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v90, CFSTR("X-Apple-NSURLCachePolicy"));

    }
  }
  objc_msgSend(v13, "setHTTPShouldHandleCookies:", 0);
  +[ICHTTPCookieStore sharedCookieStore](ICHTTPCookieStore, "sharedCookieStore");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91;
  v157 = v91;
  if (v14)
  {
    objc_msgSend(v91, "getCookiesHeadersForURL:userIdentifier:", v170, v166);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "isInternalBuild");

    if (v95)
    {
      v155 = v8;
      objc_msgSend(v92, "getCookiesForURL:userIdentifier:", v170, v166);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("itfe"), 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR(".apple.com"), 0);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v190 = 0u;
      v191 = 0u;
      v192 = 0u;
      v193 = 0u;
      v98 = v96;
      v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v190, v195, 16);
      if (v99)
      {
        v100 = v99;
        v101 = *(_QWORD *)v191;
        do
        {
          for (i = 0; i != v100; ++i)
          {
            if (*(_QWORD *)v191 != v101)
              objc_enumerationMutation(v98);
            v103 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * i);
            objc_msgSend(v103, "name");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v97, "containsObject:", v104) & 1) != 0)
            {
              objc_msgSend(v103, "domain");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = objc_msgSend(v172, "containsObject:", v105);

              if (v106)
                objc_msgSend(v171, "addObject:", v103);
            }
            else
            {

            }
          }
          v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v190, v195, 16);
        }
        while (v100);
      }

      if (objc_msgSend(v171, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C92C00], "requestHeaderFieldsWithCookies:", v171);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v93 = 0;
      }
      v8 = v155;

    }
    else
    {
      v93 = 0;
    }
  }
  v188 = 0u;
  v189 = 0u;
  v186 = 0u;
  v187 = 0u;
  v107 = v93;
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v186, v194, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v187;
    do
    {
      for (j = 0; j != v109; ++j)
      {
        if (*(_QWORD *)v187 != v110)
          objc_enumerationMutation(v107);
        v112 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * j);
        objc_msgSend(v13, "valueForHTTPHeaderField:", v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v113)
        {
          objc_msgSend(v107, "objectForKeyedSubscript:", v112);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setValue:forHTTPHeaderField:", v114, v112);

        }
      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v186, v194, 16);
    }
    while (v109);
  }

  v115 = v169;
  if (-[NSDictionary count](v169->_additionalHTTPCookies, "count"))
    objc_msgSend(v13, "ic_appendHTTPCookies:", v169->_additionalHTTPCookies);
  objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("X-Apple-Device-Model"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v165;
  if (!v116)
  {
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "rawDeviceModel");
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    if (v118)
      objc_msgSend(v13, "setValue:forHTTPHeaderField:", v118, CFSTR("X-Apple-Device-Model"));

  }
  anisetteVersion = v169->_anisetteVersion;
  if (anisetteVersion != -1)
  {
    if (anisetteVersion == 1)
    {
      anisetteVersion = v156;
      v169->_anisetteVersion = v156;
    }
    if (!anisetteVersion)
      goto LABEL_169;
LABEL_132:
    v120 = v8;
    v121 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      v122 = v169->_anisetteVersion;
      *(_DWORD *)buf = 138543618;
      v197 = v169;
      v198 = 1024;
      LODWORD(v199) = v122;
      _os_log_impl(&dword_1A03E3000, v121, OS_LOG_TYPE_DEFAULT, "%{public}@ adding MD headers for version %d", buf, 0x12u);
    }

    v184 = 0;
    v185 = 0;
    v183 = 0;
    v123 = +[ICADIUtilities generateMachineDataForAccountID:returningMachineIDData:otpData:error:](ICADIUtilities, "generateMachineDataForAccountID:returningMachineIDData:otpData:error:", objc_msgSend(v166, "unsignedLongLongValue"), &v185, &v184, &v183);
    v124 = v185;
    v125 = v184;
    v126 = (__CFString *)v183;
    if (!v123)
    {
      v131 = v169->_anisetteVersion;
      if (v131 != 1)
        goto LABEL_154;
      v127 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v197 = v169;
        v198 = 2114;
        v199 = v126;
        _os_log_impl(&dword_1A03E3000, v127, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to generate MD header data. err=%{public}@", buf, 0x16u);
      }
      goto LABEL_152;
    }
    if (v124)
    {
      objc_msgSend(v124, "base64EncodedStringWithOptions:", 0);
      v127 = (id)objc_claimAutoreleasedReturnValue();

      if (v127)
        objc_msgSend(v13, "setValue:forHTTPHeaderField:", v127, CFSTR("X-Apple-MD-M"));
      if (!v125)
        goto LABEL_152;
    }
    else
    {
      v127 = 0;
      if (!v125)
        goto LABEL_152;
    }
    objc_msgSend(v125, "base64EncodedStringWithOptions:", 0);
    v132 = (id)objc_claimAutoreleasedReturnValue();

    if (!v132)
    {
LABEL_153:
      v131 = v169->_anisetteVersion;
LABEL_154:
      if (v131 == 2)
      {
        v181 = v125;
        v182 = v124;
        v180 = v126;
        v133 = +[ICADIUtilities generateMachineDataForAccountID:returningMachineIDData:otpData:error:](ICADIUtilities, "generateMachineDataForAccountID:returningMachineIDData:otpData:error:", -1, &v182, &v181, &v180);
        v134 = v182;

        v135 = v181;
        v136 = v180;

        if (!v133)
        {
          v137 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v197 = v169;
            v198 = 2114;
            v199 = v136;
            _os_log_impl(&dword_1A03E3000, v137, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to generate AMD header data. err=%{public}@", buf, 0x16u);
          }
          v8 = v120;
          goto LABEL_167;
        }
        if (v134)
        {
          objc_msgSend(v134, "base64EncodedStringWithOptions:", 0);
          v137 = (id)objc_claimAutoreleasedReturnValue();

          if (v137)
            objc_msgSend(v13, "setValue:forHTTPHeaderField:", v137, CFSTR("X-Apple-AMD-M"));
        }
        else
        {
          v137 = 0;
        }
        v8 = v120;
        if (!v135)
        {
LABEL_167:

          goto LABEL_168;
        }
        objc_msgSend(v135, "base64EncodedStringWithOptions:", 0);
        v138 = (id)objc_claimAutoreleasedReturnValue();

        if (v138)
        {
          objc_msgSend(v13, "setValue:forHTTPHeaderField:", v138, CFSTR("X-Apple-AMD"));
          v137 = v138;
          goto LABEL_167;
        }
      }
      else
      {
        v136 = v126;
        v134 = v124;
        v135 = v125;
        v8 = v120;
      }
LABEL_168:

      v9 = v165;
      v115 = v169;
      goto LABEL_169;
    }
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v132, CFSTR("X-Apple-MD"));
    v127 = v132;
LABEL_152:

    goto LABEL_153;
  }
  if (v162)
  {
    objc_msgSend(v13, "URL");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v162, "shouldAppendMachineDataHeadersForURL:", v128);
    v130 = 2;
    if (!v129)
      v130 = 0;
    v169->_anisetteVersion = v130;

    if (!v169->_anisetteVersion)
      goto LABEL_169;
    goto LABEL_132;
  }
  v169->_anisetteVersion = 0;
LABEL_169:
  if (v115->_machineDataSyncState)
  {
    if (v115->_anisetteVersion == 1)
      v139 = CFSTR("X-Apple-MD-S");
    else
      v139 = CFSTR("X-Apple-AMD-S");
    v140 = v139;
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v115->_machineDataSyncState, v140);

  }
  v10 = v161;
  if (v115->_JSSignConfiguration)
  {
    v141 = -[ICJSSign initWithConfiguration:]([ICJSSign alloc], "initWithConfiguration:", v115->_JSSignConfiguration);
    -[ICJSSign signatureDataWithURLRequest:](v141, "signatureDataWithURLRequest:", v13);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v142;
    if (v142)
    {
      objc_msgSend(v142, "base64EncodedStringWithOptions:", 0);
      v144 = objc_claimAutoreleasedReturnValue();
      v145 = v115;
      v146 = (void *)v144;
      -[ICJSSignConfiguration signatureDataCookieName](v145->_JSSignConfiguration, "signatureDataCookieName");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v147, "length"))
        objc_msgSend(v13, "ic_appendHTTPCookieWithName:value:", v147, v146);
      -[ICJSSignConfiguration signatureDataHeaderName](v169->_JSSignConfiguration, "signatureDataHeaderName");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v148, "length"))
        objc_msgSend(v13, "setValue:forHTTPHeaderField:", v146, v148);

      v9 = v165;
      v115 = v169;
    }

  }
  v149 = v115;
  v150 = MEMORY[0x1E0C809B0];
  v177[0] = MEMORY[0x1E0C809B0];
  v177[1] = 3221225472;
  v177[2] = __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_181;
  v177[3] = &unk_1E438E600;
  v179 = v159;
  v151 = v13;
  v178 = v151;
  v152 = MEMORY[0x1A1AFA8D0](v177);
  v153 = (void *)v152;
  if (v149->_shouldUseMescalSigning)
  {
    v173[0] = v150;
    v173[1] = 3221225472;
    v173[2] = __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2;
    v173[3] = &unk_1E438CDA8;
    v173[4] = v149;
    v174 = v151;
    v175 = v153;
    v176 = v161;
    v154 = v162;
    -[ICStoreURLRequest _getSignatureDataForRequest:urlBag:completionHandler:](v149, "_getSignatureDataForRequest:urlBag:completionHandler:", v174, v162, v173);

  }
  else
  {
    (*(void (**)(uint64_t))(v152 + 16))(v152);
    v161[2](v161, v151, 0);
    v154 = v162;
  }

  v15 = v160;
  v20 = v168;
LABEL_186:

}

- (NSArray)additionalQueryItems
{
  return self->_additionalQueryItems;
}

- (id)_stringForCachePolicy:(unint64_t)a3
{
  if (a3 > 5)
    return CFSTR("Unknown");
  else
    return off_1E438CDC8[a3];
}

+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  char v6;
  __CFString *v7;
  char v8;
  __CFString *v9;
  char v10;
  unint64_t v11;
  __CFString *v12;
  objc_super v14;

  v4 = (__CFString *)a3;
  v5 = CFSTR("machine-data-action-performed");
  if (v4 == CFSTR("machine-data-action-performed"))
  {
    v12 = CFSTR("machine-data-action-performed");
LABEL_9:

    goto LABEL_10;
  }
  v6 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("machine-data-action-performed"));

  if ((v6 & 1) != 0)
  {
LABEL_10:
    v11 = 1;
    goto LABEL_13;
  }
  v7 = CFSTR("dialog-processed");
  if (v4 == CFSTR("dialog-processed"))
  {

    goto LABEL_12;
  }
  v8 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("dialog-processed"));

  if ((v8 & 1) != 0)
  {
LABEL_12:
    v11 = 2;
    goto LABEL_13;
  }
  v9 = CFSTR("other");
  if (v4 == CFSTR("other"))
  {
    v12 = CFSTR("other");
    goto LABEL_9;
  }
  v10 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("other"));

  if ((v10 & 1) != 0)
    goto LABEL_10;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___ICStoreURLRequest;
  v11 = (unint64_t)objc_msgSendSuper2(&v14, sel__defaultMaxRetryCountForReason_, v4);
LABEL_13:

  return v11;
}

- (void)setAdditionalHTTPCookies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)_getSignatureDataForRequest:(id)a3 urlBag:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  ICStoreURLRequest *v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  ICStoreURLRequest *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(v9, "mescalConfigurationForRequest:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v57 = self;
        v58 = 2114;
        v59 = v11;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ creating mescal signature for request. configuration=%{public}@", buf, 0x16u);
      }

      v13 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      if (objc_msgSend(v11, "shouldSignBody"))
      {
        objc_msgSend(v8, "HTTPMethod");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("POST"));

        if (v15)
        {
          objc_msgSend(v8, "HTTPBody");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "appendData:", v16);

        }
      }
      objc_msgSend(v8, "HTTPMethod");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("POST"));

      if ((v18 & 1) == 0)
      {
        v43 = self;
        v44 = v10;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v45 = v11;
        objc_msgSend(v11, "headers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v51 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v8, "valueForHTTPHeaderField:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v24 && objc_msgSend(v24, "length"))
              {
                objc_msgSend(v25, "dataUsingEncoding:", 4);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "appendData:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          }
          while (v21);
        }

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v45, "fields");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v28)
        {
          v29 = v28;
          v30 = 0;
          v31 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v47 != v31)
                objc_enumerationMutation(v27);
              v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
              if (!v30)
              {
                objc_msgSend(v8, "URL");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "ic_queryParametersDictionary");
                v30 = (void *)objc_claimAutoreleasedReturnValue();

              }
              objc_msgSend(v30, "objectForKey:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v35;
              if (v35 && objc_msgSend(v35, "length"))
              {
                objc_msgSend(v36, "dataUsingEncoding:", 4);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "appendData:", v37);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v29);
        }
        else
        {
          v30 = 0;
        }

        v11 = v45;
        if (objc_msgSend(v45, "shouldIncludePath"))
        {
          objc_msgSend(v8, "URL");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "path");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "dataUsingEncoding:", 4);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "appendData:", v40);

        }
        self = v43;
        v10 = v44;
      }
      -[ICStoreURLRequest storeRequestContext](self, "storeRequestContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICSAPSession sharedSAPSessionWithVersion:URLBag:requestContext:](ICSAPSession, "sharedSAPSessionWithVersion:URLBag:requestContext:", 200, v9, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
        objc_msgSend(v42, "signData:withCompletionHandler:", v13, v10);
      else
        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7200, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v11);
  }

}

void __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to sign request. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_6;
  }
  if (v5)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-ActionSignature"));
LABEL_6:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (BOOL)shouldUseMescalSigning
{
  return self->_shouldUseMescalSigning;
}

+ (NSString)currentConnectionTypeHeader
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkType");
  v4 = v3;
  v5 = 0;
  v6 = 1;
  if (v3 <= 499)
  {
    switch(v3)
    {
      case 1:
        goto LABEL_7;
      case 2:
        goto LABEL_12;
      case 3:
        v6 = 0;
        v5 = CFSTR("4G");
        break;
      case 4:
        v6 = 0;
        v5 = CFSTR("5G");
        break;
      case 5:
        v6 = 0;
        v5 = CFSTR("6G");
        break;
      case 6:
        v6 = 0;
        v5 = CFSTR("7G");
        break;
      case 7:
        v6 = 0;
        v5 = CFSTR("8G");
        break;
      case 8:
        v6 = 0;
        v5 = CFSTR("9G");
        break;
      default:
        if (v3 == 100)
          goto LABEL_12;
        break;
    }
    goto LABEL_18;
  }
  if (v3 <= 1999)
  {
    if ((unint64_t)(v3 - 1000) >= 2)
    {
      if (v3 == 500)
      {
LABEL_7:
        v6 = 0;
        v5 = CFSTR("2G");
      }
      goto LABEL_18;
    }
LABEL_10:
    v6 = 0;
    v5 = CFSTR("WiFi");
    goto LABEL_18;
  }
  if (v3 == 3000)
  {
LABEL_12:
    v6 = 0;
    v5 = CFSTR("3G");
    goto LABEL_18;
  }
  if (v3 == 2000)
    goto LABEL_10;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v7, "appendString:", v5);
    if ((unint64_t)(v4 - 1) <= 0x1F2)
    {
      objc_msgSend(v2, "telephonyOperatorName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "appendFormat:", CFSTR("/%@"), v11);
      }

    }
  }

  return (NSString *)v8;
}

- (ICStoreURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  id v8;
  id v9;
  ICStoreURLRequest *v10;
  ICStoreURLRequest *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICStoreURLRequest.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[requestContext isKindOfClass:[ICStoreRequestContext class]]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)ICStoreURLRequest;
  v10 = -[ICURLRequest initWithURLRequest:requestContext:resumeData:](&v14, sel_initWithURLRequest_requestContext_resumeData_, v8, v9, 0);
  v11 = v10;
  if (v10)
  {
    v10->_shouldRequireURLBag = 1;
    v10->_anisetteVersion = -1;
    v10->_shouldUseMescalSigning = 1;
    v10->_shouldParseBodyData = 1;
    -[ICURLRequest setCancelOnHTTPErrors:](v10, "setCancelOnHTTPErrors:", 0);
  }

  return v11;
}

+ (Class)_responseHandlerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSSignConfiguration, 0);
  objc_storeStrong((id *)&self->_additionalQueryItems, 0);
  objc_storeStrong((id *)&self->_additionalHTTPCookies, 0);
  objc_storeStrong((id *)&self->_machineDataSyncState, 0);
}

- (NSDictionary)additionalHTTPCookies
{
  if (self->_additionalHTTPCookies)
    return self->_additionalHTTPCookies;
  else
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (BOOL)_isPersonalizationRestricted
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[ICStoreURLRequest storeRequestContext](self, "storeRequestContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestingBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "privacyAcknowledgementRequiredForBundleIdentifier:", v6);

  return v10;
}

- (int64_t)anisetteVersion
{
  return self->_anisetteVersion;
}

- (void)setAnisetteVersion:(int64_t)a3
{
  self->_anisetteVersion = a3;
}

- (void)setShouldParseBodyData:(BOOL)a3
{
  self->_shouldParseBodyData = a3;
}

- (BOOL)shouldRequireURLBag
{
  return self->_shouldRequireURLBag;
}

- (void)setShouldRequireURLBag:(BOOL)a3
{
  self->_shouldRequireURLBag = a3;
}

- (NSString)machineDataSyncState
{
  return self->_machineDataSyncState;
}

- (void)setMachineDataSyncState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setAdditionalQueryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (ICJSSignConfiguration)JSSignConfiguration
{
  return self->_JSSignConfiguration;
}

- (void)setJSSignConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

void __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_181(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    +[ICAuthenticationUtilities sharedAuthKitSession](ICAuthenticationUtilities, "sharedAuthKitSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appleIDHeadersForRequest:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, v8);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

  }
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_127(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v34 = v13;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "Request %{public}@ failed to obtain credentials to form request. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  else
  {
    v14 = *(NSObject **)(a1 + 40);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_128;
    v20[3] = &unk_1E438CD10;
    v21 = v9;
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    v24 = v10;
    v25 = *(id *)(a1 + 64);
    v15 = *(id *)(a1 + 72);
    v16 = *(_QWORD *)(a1 + 32);
    v26 = v15;
    v27 = v16;
    v32 = a5;
    v17 = *(id *)(a1 + 80);
    v19 = *(void **)(a1 + 96);
    v18 = *(_QWORD *)(a1 + 104);
    v28 = v17;
    v31 = v18;
    v30 = v19;
    v29 = *(id *)(a1 + 88);
    dispatch_async(v14, v20);

  }
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_128(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BYTE *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToIdentity:inStore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 56), "iCloudIdentityProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 64);
    objc_msgSend(v3, "iCloudPersonID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setICloudPersonID:", v5);

    objc_msgSend(*(id *)(a1 + 56), "identityProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 64);
    objc_msgSend(v6, "DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDSID:", v8);

    v9 = *(void **)(a1 + 64);
    objc_msgSend(v6, "storefrontIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStorefrontIdentifier:", v10);

  }
  v11 = *(_QWORD *)(a1 + 72);
  if (v11 && objc_msgSend(v2, "isEqualToIdentity:inStore:", v11, *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 56), "identityProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isDelegated"))
    {
      v13 = *(void **)(a1 + 64);
      objc_msgSend(v12, "DSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDelegatedDSID:", v14);

      v15 = *(void **)(a1 + 64);
      objc_msgSend(v12, "delegateToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDelegateToken:", v16);

      v17 = *(void **)(a1 + 64);
      objc_msgSend(v12, "storefrontIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDelegatedStorefrontIdentifier:", v18);

      v19 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 80);
        objc_msgSend(*(id *)(a1 + 64), "delegatedDSID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "delegateToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v20;
        v38 = 2112;
        v39 = v21;
        v40 = 2112;
        v41 = v22;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - buildURLRequestWithCompletionHandler - Adding delegation info to builder - delegatedDSID=%@ - delegatedToken=%@", buf, 0x20u);

      }
    }

  }
  if (*(_BYTE *)(a1 + 120))
  {
    v23 = *(_BYTE **)(a1 + 80);
    if (v23[274])
    {
      +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 88);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_130;
      v29[3] = &unk_1E438CCE8;
      v26 = *(void **)(a1 + 104);
      v35 = *(_QWORD *)(a1 + 112);
      v27 = v26;
      v28 = *(_QWORD *)(a1 + 80);
      v34 = v27;
      v29[4] = v28;
      v30 = *(id *)(a1 + 64);
      v31 = *(id *)(a1 + 96);
      v32 = *(id *)(a1 + 72);
      v33 = *(id *)(a1 + 88);
      objc_msgSend(v24, "getBagForRequestContext:withCompletionHandler:", v25, v29);

    }
    else
    {
      objc_msgSend(v23, "buildStoreURLRequestWithURLRequest:builderProperties:completionHandler:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 104));
    }
  }

}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_130(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  dispatch_qos_class_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  dispatch_block_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 80);
  if (v7 <= 16)
  {
    if (v7 == 9)
    {
      v8 = QOS_CLASS_BACKGROUND;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  switch(v7)
  {
    case 17:
      v8 = QOS_CLASS_UTILITY;
      break;
    case 33:
      v8 = QOS_CLASS_USER_INTERACTIVE;
      break;
    case 25:
      v8 = QOS_CLASS_USER_INITIATED;
      break;
    default:
LABEL_8:
      v8 = QOS_CLASS_UNSPECIFIED;
      break;
  }
LABEL_11:
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E438CC98;
  v10 = v6;
  v28 = v10;
  v11 = v5;
  v29 = v11;
  v12 = *(id *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v33 = v12;
  v30 = v13;
  v31 = v14;
  v32 = *(id *)(a1 + 48);
  v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8, 0, block);
  v16 = v15;
  v17 = *(void **)(a1 + 56);
  if (v17)
  {
    v18 = *(void **)(a1 + 64);
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_142;
    v25[3] = &unk_1E4390188;
    v26 = v17;
    v19 = (void *)objc_msgSend(v18, "copyWithBlock:", v25);
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2_144;
    v21[3] = &unk_1E438CCC0;
    v24 = *(_QWORD *)(a1 + 80);
    v22 = *(id *)(a1 + 40);
    v23 = v16;
    objc_msgSend(v20, "getBagForRequestContext:withCompletionHandler:", v19, v21);

  }
  else
  {
    (*((void (**)(dispatch_block_t))v15 + 2))(v15);
  }

}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIdentity:", v2);
  objc_msgSend(v3, "setDelegatedIdentity:", 0);

}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  dispatch_qos_class_t v9;
  id v10;
  id v11;
  void (**v12)(dispatch_block_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  if (v8 <= 16)
  {
    if (v8 == 9)
    {
      v9 = QOS_CLASS_BACKGROUND;
      goto LABEL_11;
    }
LABEL_8:
    v9 = QOS_CLASS_UNSPECIFIED;
    goto LABEL_11;
  }
  if (v8 == 17)
  {
    v9 = QOS_CLASS_UTILITY;
    goto LABEL_11;
  }
  if (v8 == 33)
  {
    v9 = QOS_CLASS_USER_INTERACTIVE;
    goto LABEL_11;
  }
  if (v8 != 25)
    goto LABEL_8;
  v9 = QOS_CLASS_USER_INITIATED;
LABEL_11:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E4390EA8;
  v17 = v5;
  v18 = v6;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v10 = v7;
  v11 = v5;
  v12 = (void (**)(dispatch_block_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9, 0, v16);
  v12[2](v12, v13, v14, v15);

}

uint64_t __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 48), "setDelegatedURLBag:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
